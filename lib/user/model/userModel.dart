class UserModel{
  String userName;

  UserModel({
    this.userName
});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userName: json['userName']
  );
}