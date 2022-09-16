// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../Oauth/Kakao_Oauth/kakao_login.dart';
// import '../../../../Oauth/Kakao_Oauth/main_view_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// class SignIn_View extends StatefulWidget {
//   const SignIn_View({Key? key}) : super(key: key);
//
//   @override
//   _SignIn_ViewState createState() => _SignIn_ViewState();
// }
//
// class _SignIn_ViewState extends State<SignIn_View> {
//   final viewModel = MainViewModel(KakaoLogin());
//
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Center(
//         child: StreamBuilder<User?>(
//             stream: FirebaseAuth.instance.authStateChanges(),
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) {
//                 return ElevatedButton(
//                   onPressed: () async {
//                     await viewModel.login();
//                     setState(() {});
//                   },
//                   child: const Text('Login'),
//                 );
//               }
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Image.network(
//                       viewModel.user?.kakaoAccount?.profile?.profileImageUrl ?? ''),
//                   Text(
//                     '${viewModel.isLogined}',
//                     style: Theme.of(context).textTheme.headline4,
//                   ),
//                   ElevatedButton(
//                     onPressed: () async {
//                       await viewModel.logout();
//                       setState(() {});
//                     },
//                     child: const Text('Logout'),
//                   ),
//                 ],
//               );
//             }
//         ),
//       ),
//     );
//   }
// }
