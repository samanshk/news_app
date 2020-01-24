import 'package:flutter/material.dart';
import 'Home.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:splashscreen/splashscreen.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'News App',
//       theme: ThemeData(
//         primarySwatch: Colors.red
//       ),
//       home: Home()
//     );
//   }
// }


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => new ThemeData(
        primarySwatch: Colors.indigo,
        brightness: brightness,
      ),
      themedWidgetBuilder: (context, theme) {
        return new MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: theme,
          home: new Splash(),
        );
      }
    );
  }
}


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 4,
      navigateAfterSeconds: new Home(),
      title: new Text('News',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 100.0,
        color: Colors.white
      ),),
      image: new Image.asset('assets/game.png'),
      backgroundColor: Colors.red,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 80.0,
      // onClick: ()=>print("Flutter Egypt"),
      loaderColor: Colors.white
    );
  }
}


