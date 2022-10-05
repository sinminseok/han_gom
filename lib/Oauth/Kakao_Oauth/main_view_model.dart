import 'package:han_gom/Oauth/Kakao_Oauth/social_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;

import '../../Model/User_model.dart';
import 'firebase_auth_remote_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainViewModel {
  final _firebaseAuthDataSource = FirebaseAuthRemoteDataSource();
  final SocialLogin _socialLogin;
  bool isLogined = false;
  kakao.User? user;

  MainViewModel(this._socialLogin);

  Future<bool> login() async {
    isLogined = await _socialLogin.login();
    if (isLogined) {
      user = await kakao.UserApi.instance.me();
      print("kakaoinin");
      print(user!.kakaoAccount!.profile!.nickname);
      print(user!.id.toString(),);
      print(user!.kakaoAccount!.email!);
     // print(user!.kakaoAccount!.profile!.profileImageUrl!);




      final token = await _firebaseAuthDataSource.createCustomToken({
        'uid': user!.id.toString(),
        'displayName': user!.kakaoAccount!.profile!.nickname,
        'email': user!.kakaoAccount!.email!,
      });
      print("login success1");
      await FirebaseAuth.instance.signInWithCustomToken(token);
      print("login success2");

     // User_InApp.fromJson(Map<String,token> jsonData = jsonDecode(token););
      return true;
    } else {
      return false;
    }
  }

  Future logout() async {
    await _socialLogin.logout();
    await FirebaseAuth.instance.signOut();
    isLogined = false;
    user = null;
  }
}
