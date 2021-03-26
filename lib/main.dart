import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:zooppy/screens/main_screens/check_auth.dart';

Future main() async {
  await DotEnv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext contextP) {
    // Used to set Device Orientation
    // Here used Portrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    // Used to set Status Bar Color
    // Here used RedAccent color
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.red[700]));

    return MaterialApp(
      // debugShowCheckedModeBanner to false to disable Debug Banner
      debugShowCheckedModeBanner: false,

      // main.dart will execute first... The Class given in home: will execute
      // home: CheckAuth(),
      home: CheckAuth(),
    );
  }
}
