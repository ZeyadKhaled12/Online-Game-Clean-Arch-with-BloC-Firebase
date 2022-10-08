
class RoomModel{

  late String name;
  late String id;
  late int capacityRoom;
  late String ownerToken;
  late List gamersTokens;
  late bool isGameStart;
  late int limitRounds;


  RoomModel({
    required this.name,
    required this.id,
    required this.capacityRoom,
    required this.ownerToken,
    required this.gamersTokens,
    required this.isGameStart,
    required this.limitRounds,
  });

  RoomModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    id = json['id'];
    limitRounds = json['limit_rounds'];
    capacityRoom = json['capacity_room'];
    ownerToken = json['owner_token'];
    gamersTokens = json['gamers_tokens'];
    isGameStart = json['is_game_start'];

  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'id': id,
    'limit_rounds' : limitRounds,
    'capacity_room': capacityRoom,
    'owner_token': ownerToken,
    'gamers_tokens': gamersTokens,
    'is_game_start': isGameStart
  };

}