
class GameModel{

  late String idRoom;
  late String kaitoToken;
  late List answersList;
  late List indexTokens;
  late int hiringIndex;
  late Map objectCategory;
  late Map<String, dynamic> kaitoTokensMap;


  GameModel({required this.answersList, required this.idRoom, required this.kaitoToken, 
    required this.indexTokens, required this.hiringIndex, required this.kaitoTokensMap,
    required this.objectCategory});

  GameModel.fromJson(Map<String, dynamic> json){
    answersList = json['answers_list'];
    idRoom = json['id_room'];
    kaitoToken = json['kaito_token'];
    indexTokens = json['index_tokens'];
    hiringIndex = json['hiring_index'];
    kaitoTokensMap = json['kaito_tokens_map'];
    objectCategory = json['object_category'];
  }

  Map<String, dynamic> toJson() => {
    'answers_list': answersList,
    'id_room': idRoom,
    'kaito_token': kaitoToken,
    'index_tokens': indexTokens,
    'hiring_index': hiringIndex,
    'kaito_tokens_map': kaitoTokensMap,
    'object_category': objectCategory
  };

}