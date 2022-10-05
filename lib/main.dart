import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'View/App/Account/SignIn_View.dart';
import 'View/App/Frame/Frame_View.dart';
import 'ViewModel/Account/User_Controller.dart';
import 'ViewModel/Cure_disease_ViewModel.dart';
import 'ViewModel/Cure_tool_ViewModel.dart';



void main() async{
  KakaoSdk.init(nativeAppKey: 'f955b0693ad1bd411fa28923171a0d8c');
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDefault();

  runApp(
    MultiProvider(providers: [
      //User_Controller
      ChangeNotifierProvider(create: (context) => Cure_tool_ViewModel()),
      ChangeNotifierProvider(create: (context) => Cure_disease_ViewModel()),
      ChangeNotifierProvider(create: (context) => User_Controller()),

    ], child: MyApp()),
  );
}
Future<void> initializeDefault() async {

  FirebaseApp app = await Firebase.initializeApp();

}

// Future<void> initializeDefault() async {
//   FirebaseApp app = await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   print('Initialized default app $app');
// }

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return ScreenUtilInit(
      designSize: const Size(390, 789),
      minTextAdapt: false,
      splitScreenMode: false,
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Frame_View(),
        );
      },
      child: const Frame_View(),
    );
  }
}

class Init {
  Init._();

  static final instance = Init._();

  Future<Widget?> initialize(BuildContext context) async {

    await Future.delayed(Duration(milliseconds: 4300));
    return Frame_View();// 초기 로딩 완료 시 띄울 앱 첫 화면


  }
}


// FutureBuilder(
// future: Init.instance.initialize(context),
// builder: (context, AsyncSnapshot snapshot) {
// if (snapshot.connectionState == ConnectionState.waiting) {
// return MaterialApp(
// debugShowCheckedModeBanner: false,
// home: Splash_View()); // 초기 로딩 시 Splash Screen
// } else if (snapshot.hasError) {
// return MaterialApp(
// debugShowCheckedModeBanner: false,
// home: Splash_View()); // 초기 로딩 에러 시 Error Screen
// } else {
// return MaterialApp(
// debugShowCheckedModeBanner: false,
// title: 'Flutter',
// theme: ThemeData(primarySwatch: Colors.blue),
// home: snapshot.data, // 로딩 완료 시 Home Screen
// builder: (context, child) => MediaQuery(
// child: child!,
// data: MediaQuery.of(context).copyWith(
// textScaleFactor: MediaQuery.of(context)
//     .textScaleFactor
//     .clamp(0.95, 1.05))), // 폰트 스케일 범위 고정
// );
// }
// },
// );