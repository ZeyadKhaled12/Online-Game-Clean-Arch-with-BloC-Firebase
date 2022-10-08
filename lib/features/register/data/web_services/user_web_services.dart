

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class UserWebServices{


  Future<Map<String, dynamic>> getDataUser({required String androidId}) async{
    try {
      final data = await FirebaseFirestore.instance.collection('users').doc(
          androidId).get().then((DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        return data;
      });
      return data;
    }catch(error){
      print(error);
    }
    return{};
  }

  Future createUser({required Map<String, dynamic> map,
    required String androidId}) async{
    try {
      await FirebaseAuth.instance.signInAnonymously();
      await FirebaseFirestore.instance.collection('users')
          .doc(androidId).set(map);
    }catch(error){
      print(error);
    }
  }

  Future<List> getAvatarPics() async{
    print('\n\nGETiN\n\n');
    List _avatarPicsUrls = [];
    final _docs = await FirebaseFirestore.instance.collection('avatar_pics').get()
        .then((value) => value.docs);
    for (var element in _docs) {
      _avatarPicsUrls.add(element['url']);
    }
    print('\n\nFINISH\n\n');
    return _avatarPicsUrls;
  }

}