

class User_InApp{
  String? nickname;
  String? email;
  User_InApp({this.nickname , this.email});

  factory User_InApp.fromJson(Map<String, dynamic> json) {
    return User_InApp(
      nickname: json['nickname'],
      email: json['email'],

    );
  }

}