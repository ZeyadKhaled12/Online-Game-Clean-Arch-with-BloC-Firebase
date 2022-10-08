
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaito/features/room/presentation/screens/room_screen.dart';

import '../../../splash/presentation/cubit/splash_cubit.dart';
import '../cubit/sfg_cubit.dart';
import '../widgets/profile_sfg_widgets/profile_sfg_widget_appbar.dart';
import '../widgets/profile_sfg_widgets/profile_sfg_widget_body.dart';

class ProfileSFGScreen extends StatefulWidget {
  const ProfileSFGScreen({Key? key, required this.capacity}) : super(key: key);
  final int capacity;

  @override
  _ProfileSFGScreenState createState() => _ProfileSFGScreenState();
}

class _ProfileSFGScreenState extends State<ProfileSFGScreen> {
  @override
  void initState() {
    BlocProvider.of<SfgCubit>(context)
        .searchForGame(ctx: context, capacity: widget.capacity);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ProfileSFGWidgetAppBar(capacity: widget.capacity),
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('search_rooms')
            .doc('${widget.capacity}_capacity_room')
            .snapshots(),
        builder: (ctx, snapShot) {

          if (snapShot.connectionState != ConnectionState.waiting) {
            Map<String, dynamic>? mapOfData = snapShot.data!.data();
            if (mapOfData != null) {
              if (mapOfData.containsKey('token')) {
                if(mapOfData['creator'] != BlocProvider.of<SplashCubit>(context).androidId) {
                  BlocProvider.of<SfgCubit>(context).joinGame(
                    ctx: context,
                    capacity: widget.capacity,
                    id: mapOfData['token']).then((value) async => await Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) =>
                    const RoomScreen(isSearchGame: true))));}

                else{
                  Future.delayed(const Duration(seconds: 1),() async{
                    await await Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) =>
                      const RoomScreen(isSearchGame: true)));
                  });
                }
              }
            }
            return const ProfileSFGWidgetBody();
          }
          return const ProfileSFGWidgetBody();
        },
      ),
    );
  }
}
