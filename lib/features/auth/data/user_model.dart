class UserModel {
  int? id;
  String? userImagePath;
  String? username;

  UserModel({this.id, this.userImagePath, this.username});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userImagePath = json['image_path']?.toString();
    username = json['username'];
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "image_path": userImagePath,
    "username": username
  };


}