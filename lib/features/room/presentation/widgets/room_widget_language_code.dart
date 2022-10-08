
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../game/presentation/cubit/game_cubit.dart';


class RoomWidgetLanguageCode extends StatefulWidget {
  const RoomWidgetLanguageCode({Key? key}) : super(key: key);

  @override
  State<RoomWidgetLanguageCode> createState() => _RoomWidgetLanguageCodeState();
}

class _RoomWidgetLanguageCodeState extends State<RoomWidgetLanguageCode> {

  bool isRight = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isRight = !(BlocProvider.of<GameCubit>(context).languageCode == 'en');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('العربية', style: TextStyle(
            color: Colors.amber,
            fontSize: 20,
            fontWeight: FontWeight.bold
          )),
        ),
        BlocBuilder<GameCubit, GameState>(
          builder: (_, gameState){
            return Switch(
              value: isRight,
              activeColor: Colors.green,
              focusColor: Colors.pink,
              hoverColor: Colors.pink,
              inactiveThumbColor: Colors.amber,
              inactiveTrackColor: Colors.amber.withOpacity(0.5),
              onChanged: (bool value) {
                setState(() {
                  isRight = value;
                  BlocProvider.of<GameCubit>(context).changeLanguageCodeFun();
                });
              },
            );
          },
        ),
        const Padding(
          padding: EdgeInsets.only(right: 10),
          child: Text('English', style: TextStyle(
              color: Colors.green,
              fontSize: 20,
              fontWeight: FontWeight.bold
          )),
        )
      ],
    );
  }
}
