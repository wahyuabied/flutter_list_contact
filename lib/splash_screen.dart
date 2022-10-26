import 'package:first_flutter/api/ConnectApiPage.dart';
import 'package:first_flutter/contact/screen/ContactHomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'notes/models/notes_operation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NotesOperation>(
        create: (context) => NotesOperation(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreenPage()
        )
    );
  }
}

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SplashScreenView(
            navigateRoute: const ContactApiPage(),
            duration: 3000,
            imageSize: 130,
            imageSrc: "https://w0.peakpx.com/wallpaper/901/27/HD-wallpaper-youtube-white-logo-white-neon-lights-social-network-creative-black-abstract-background-youtube-logo-youtube.jpg",
            text: "Splash Screen",
            textType: TextType.NormalText,
            textStyle: const TextStyle(
              fontSize: 30.0,
            ),
            backgroundColor: Colors.white,
          )),
    );
  }

/*@override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => MyHomePage(title: 'Flutter Demo Home Page'))
            )
    );
  }*/

/*@override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: FlutterLogo(
            size:MediaQuery.of(context).size.height,
        )

    );*/
}
