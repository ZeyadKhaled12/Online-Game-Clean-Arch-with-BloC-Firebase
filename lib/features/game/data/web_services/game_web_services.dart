

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class GameWebServices{

  Future startGame({required Map<String, dynamic> map}) async{
    await FirebaseFirestore.instance.collection('games').doc(map['id_room']).set(map);
    return map;
  }

  Future<Map<String, dynamic>> refresh({required String idRoom}) async{
    final data = await FirebaseFirestore.instance.collection('games').doc(idRoom)
        .get().then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      return data;
    });
    return data;
  }

  Future answerQuestion({required int index, required String idRoom,
    required Map question, required String answer, required List answersList,
    required List indexTokens}) async{
    answersList.add({'answer': answer, 'index': index,
      'question': question});
    Random _random = Random();

    indexTokens.remove(index);

    await FirebaseFirestore.instance.collection('games').doc(idRoom).update({
      'answers_list': answersList,
      'index_tokens': indexTokens,
      'hiring_index': indexTokens.isEmpty?
      -1: indexTokens[_random.nextInt(indexTokens.length)]
    });
  }
  
  Future indexKaitoChosenFun({required String idRoom, required String token}) async{
    Map<String, dynamic> _kaitoTokensMap = await FirebaseFirestore.instance.collection('games').doc(idRoom).get()
        .then((value) => value['kaito_tokens_map']);

    _kaitoTokensMap[token] = _kaitoTokensMap[token] + 1;
    await FirebaseFirestore.instance.collection('games').doc(idRoom)
        .update({'kaito_tokens_map': _kaitoTokensMap});
  }

  Future<Map> getObjectCategory() async{
    Random _random = Random();
    List _categories = ['animals', 'clothes', 'fruits', 'insects'];
    Map _map = await FirebaseFirestore.instance.collection('categories')
        .doc(_categories[_random.nextInt(_categories.length)])
        .get().then((value) => value['list'][_random.nextInt(value['list'].length)]);
    return _map;
  }

  Future<Map> getQuestion() async{
    Random _random = Random();
    Map _map = await FirebaseFirestore.instance.collection('questions').doc('questions')
        .get().then((value) {List _list = value['list'];
        return _list[_random.nextInt(_list.length)];
    });
    return _map;
  }

  Future countKaitoWin({required String token}) async{
    int _count = await FirebaseFirestore.instance.collection('users').doc(token).get()
        .then((value) => value['win_count']);
    await FirebaseFirestore.instance.collection('users').doc(token).update({
      'win_count': _count + 1
    });
  }
}