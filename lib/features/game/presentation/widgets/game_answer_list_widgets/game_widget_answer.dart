import 'package:flutter/material.dart';

class GameWidgetAnswer extends StatelessWidget {
  const GameWidgetAnswer(
      {Key? key,
      required this.question,
      required this.imgUrl,
      required this.gamerName,
      required this.answerQuestion})
      : super(key: key);
  final String imgUrl;
  final String gamerName;
  final String question;
  final String answerQuestion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, right: 25, left: 25),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).secondaryHeaderColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 8)),
            Text(
              question,
              style: const TextStyle(
                  color: Colors.white, fontSize: 18, fontFamily: 'com'),
            ),
            const Padding(padding: EdgeInsets.only(top: 8)),
            Card(
              child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 8, right: 40, left: 40),
                  child: Text(
                    answerQuestion,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  )),
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
            ),
            const Padding(padding: EdgeInsets.only(top: 8)),
            Card(
              color: Colors.white.withOpacity(0.4),
              elevation: 10,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: Column(
                  children: [
                    Image(image: NetworkImage(imgUrl), width: 60, height: 60),
                    Text(
                      gamerName,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20,
                          fontFamily: 'com',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
