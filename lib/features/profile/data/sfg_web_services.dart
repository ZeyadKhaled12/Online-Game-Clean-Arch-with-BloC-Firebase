// ignore_for_file: avoid_print

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../room/presentation/cubit/room_cubit.dart';
import '../../splash/presentation/cubit/splash_cubit.dart';

class SFGWebServices {

  Future searchForGame(
      {required int capacity, required BuildContext ctx}) async {
    try {
      List _players = await FirebaseFirestore.instance
          .collection('search_rooms')
          .doc('${capacity}_capacity_room')
          .get()
          .then((value) => value.exists ? value.data()!['players'] ?? [] : []);

      _players.add(BlocProvider.of<SplashCubit>(ctx).androidId);

      await FirebaseFirestore.instance
          .collection('search_rooms')
          .doc('${capacity}_capacity_room')
          .set({'players': _players});

      if (_players.length == capacity) {
        final Random _random = Random();
        String _id = '${_random.nextInt(10)}${_random.nextInt(10)}'
            '${_random.nextInt(10)}${_random.nextInt(10)}'
            '${_random.nextInt(10)}${_random.nextInt(10)}';
        await _createRoom(ctx: ctx, capacity: capacity, token: _id);
      }
    } catch (e) {
      print(e);
    }
  }

  Future _createRoom({required BuildContext ctx
    , required int capacity
    , required String token}) async {

    await BlocProvider.of<RoomCubit>(ctx).createRoom(
      isSearchGame: true,
        name: 'random', capacityRoom: capacity, limitRounds: 20, ctx: ctx,
        token: token);
    await leaveSearchForGame(capacity: capacity, isInSearch: true, ctx: ctx);
    await FirebaseFirestore.instance
        .collection('search_rooms')
        .doc('${capacity}_capacity_room')
        .update({'token': token, 'creator': BlocProvider.of<SplashCubit>(ctx).androidId});
  }

  Future joinRoom({required BuildContext ctx,
    required int capacity,
    required String id}) async {
    print('\n\nJoin Game\n\n');
    await leaveSearchForGame(capacity: capacity, isInSearch: true, ctx: ctx);
    await BlocProvider.of<RoomCubit>(ctx).joinRoom(ctx: ctx, id: id,
      isSearchGame: true);
  }

  Future leaveSearchForGame({required int capacity
    , required bool isInSearch
    , required BuildContext ctx}) async {
    try {
      if (isInSearch) {
        List _players = await FirebaseFirestore.instance
            .collection('search_rooms')
            .doc('${capacity}_capacity_room')
            .get()
            .then((value) => value['players']);

        _players.remove(BlocProvider.of<SplashCubit>(ctx).androidId);

        if (_players.isEmpty) {
          await FirebaseFirestore.instance
              .collection('search_rooms')
              .doc('${capacity}_capacity_room')
              .delete();
        }else{
          await FirebaseFirestore.instance
              .collection('search_rooms')
              .doc('${capacity}_capacity_room')
              .update({'players': _players});
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
