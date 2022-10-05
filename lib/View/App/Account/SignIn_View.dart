
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseauth;
import 'package:han_gom/Utils/constans.dart';
import 'package:han_gom/Utils/toast/showtoast.dart';
import 'package:han_gom/View/App/Frame/Frame_View.dart';
import '../../../../Oauth/Kakao_Oauth/kakao_login.dart';
import '../../../../Oauth/Kakao_Oauth/main_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:provider/provider.dart';
import '../../../ViewModel/Account/User_Controller.dart';

class SignIn_View extends StatefulWidget {
  const SignIn_View({Key? key}) : super(key: key);

  @override
  _SignIn_ViewState createState() => _SignIn_ViewState();
}

class _SignIn_ViewState extends State<SignIn_View> {
  var viewModel = MainViewModel(KakaoLogin());
  var kakao_user;
  //로그인 식별자 저장 함수
  login_method(String method)async{

    final prefs = await SharedPreferences.getInstance();
    prefs.setString("login_method", method);
  }

  //apple oauth 로그인 함수
  Future<firebaseauth.UserCredential> signInWithApple() async {
    print("apple1");
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],

    );
    print("apple2");
    final oauthCredential = firebaseauth.OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode
      // rawNonce: rawNonce,
    );
    print("apple3");
    login_method("apple");
    return await firebaseauth.FirebaseAuth.instance.signInWithCredential(oauthCredential);

  }

  @override
  Widget build(BuildContext context) {
    var user_controller = Provider.of<User_Controller>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.grey.shade200,
      ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      InkWell(
                        onTap: (){
                          print( firebaseauth.FirebaseAuth.instance!.currentUser);

                        },
                        child: Container(
                          width: 150.w,
                          height: 150.h,
                          child: Image.asset("assets/images/hangom_logo.png"),
                        ),
                      ),
                      //
                      // Container(
                      //     width: 240.w,
                      //     child: TextField(
                      //       cursorColor: PrimaryColor,
                      //
                      //       controller: _emailcontroller,
                      //
                      //       decoration: InputDecoration(
                      //         enabledBorder: UnderlineInputBorder(
                      //           borderSide: BorderSide(color: Colors.grey),
                      //         ),
                      //         focusedBorder: UnderlineInputBorder(
                      //           borderSide: BorderSide(color: PrimaryColor),
                      //         ),
                      //         prefixIconColor: PrimaryColor,
                      //       focusColor: PrimaryColor,
                      //         iconColor: PrimaryColor,
                      //         prefixIcon:Icon(Icons.email_outlined,size: 20.sp,color: Colors.grey,),
                      //       ),
                      //
                      //     )),
                      // Container(
                      //     width: 240.w,
                      //     child: TextField(
                      //       cursorColor: PrimaryColor,
                      //
                      //       controller: _passwordcontroller,
                      //
                      //       decoration: InputDecoration(
                      //         enabledBorder: UnderlineInputBorder(
                      //           borderSide: BorderSide(color: Colors.grey),
                      //         ),
                      //         focusedBorder: UnderlineInputBorder(
                      //           borderSide: BorderSide(color: PrimaryColor),
                      //         ),
                      //         prefixIconColor: PrimaryColor,
                      //         focusColor: PrimaryColor,
                      //         iconColor: PrimaryColor,
                      //         prefixIcon:Icon(Icons.lock_outline_sharp,size: 20.sp,color: Colors.grey,),
                      //       ),
                      //
                      //     )),

                      //카톡 로그인
                      InkWell(
                        onTap: ()async{
                          var return_value = await viewModel.login();
                          if(return_value == true){
                            login_method("kakao");
                            Navigator.pop(context);

                          // user_controller.current_user(firebaseauth.User);
                            showtoast("로그인 성공");

                          }else{
                            showtoast("로그인 실패");
                          }
                        },
                        child: Center(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(15.w, 30.h, 15.w, 0.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(6)),

                               // shape: BoxShape.circle,

                                color: Colors.amber),
                            width: 270.w,
                            height: 40.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon( Icons.chat_bubble,size: 20,),
                                Container(
                                    margin: EdgeInsets.fromLTRB(5.w, 0.h, 15.w, 0.h),
                                    child: Text("카톡으로 등록",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.sp),))
                              ],
                            )
                          ),
                        ),
                      ),
                      //애플 로그인
                      InkWell(
                        onTap: () {
                          signInWithApple();
                          //Navigator.pop(context);
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 0.h),
                          width: 270.w,
                          height: 40.h,
                          child: Image.asset("assets/images/apple_oauth.png"),
                        ),
                      ),
                    ]),

        ),
        );
  }
}
