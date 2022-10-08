
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../room/presentation/cubit/room_cubit.dart';
import '../../presentation/cubit/game_cubit.dart';
import '../models/game_model.dart';
import '../web_services/game_web_services.dart';


class GameRepository{

  final GameWebServices gameWebServices;

  GameRepository(this.gameWebServices);

  Future startGame({required BuildContext ctx, required Set<String> gamersExistsList}) async{
    Random _random = Random();
    List _gamersTokens = BlocProvider.of<RoomCubit>(ctx).gamersTokens;
    List _indexTokens = [];
    Map<String, dynamic> _kaitoTokensMap = {};
    Map _mapCategory = await gameWebServices.getObjectCategory();


    for (var element in _gamersTokens) {
      if(!gamersExistsList.contains(element)) _kaitoTokensMap[element] = 0;
    }
    for(int i = 0; i < (_gamersTokens.length - gamersExistsList.length); i++) {_indexTokens.add(i);}

    GameModel _gameModel = GameModel(answersList: [],
        objectCategory: BlocProvider.of<GameCubit>(ctx).round == 1?
        BlocProvider.of<GameCubit>(ctx).objectCategory: _mapCategory,
        kaitoTokensMap: _kaitoTokensMap,
        hiringIndex: _indexTokens[_random.nextInt(_indexTokens.length)],
        indexTokens: _indexTokens,
        kaitoToken: BlocProvider.of<GameCubit>(ctx).round == 1
            ? BlocProvider.of<GameCubit>(ctx).kaitoToken
            : _gamersTokens[_random.nextInt(_gamersTokens.length)],
        
        idRoom: BlocProvider.of<RoomCubit>(ctx).id);
    Map<String, dynamic> _map = await gameWebServices.startGame(map: _gameModel.toJson());
    return _map;
  }

  Future refresh({required String idRoom}) async{
    final Map<String, dynamic> map = await gameWebServices.refresh(idRoom: idRoom);
    GameModel gameModel = GameModel.fromJson(map);
    return gameModel.toJson();
  }

  Future answerQuestion({required int index,
    required String idRoom,
    required Map question,
    required String answer,
    required List answersList,
    required List indexTokens}) async{
    await gameWebServices.answerQuestion(index: index,
        idRoom: idRoom,
        indexTokens: indexTokens,
        question: question,
        answer: answer, answersList: answersList);
  }

  Future indexKaitoChosenFun({required String idRoom, required String token}) async{
    await gameWebServices.indexKaitoChosenFun(idRoom: idRoom, token: token);
  }

  Future<Map> getQuestion() async{
    Random _random = Random();
    int _r = _random.nextInt(4);
    return _r == 1? {'en': 'No Question', 'ar': 'لا يوجد سؤال'}
    : await gameWebServices.getQuestion();
  }

  Future countKaitoToken({required String token}) async{
    await gameWebServices.countKaitoWin(token: token);
  }

}