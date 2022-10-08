class UserModel{

  late String name;
  late int winCount;
  late String avatarImagePath;
  UserModel({
    required this.name,
    required this.winCount,
    required this.avatarImagePath
  });

  UserModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    winCount = json['win_count'];
    avatarImagePath = json['avatar_path'];
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'win_count': winCount,
    'avatar_path': avatarImagePath
  };

}