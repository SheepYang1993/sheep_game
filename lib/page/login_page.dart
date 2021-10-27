import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sheep_game/page/select_user_page.dart';
import 'package:sheep_game/utils/sounds.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with WidgetsBindingObserver {
  bool showSplash = true;

  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: showSplash ? buildSplash() : buildMenu(),
    );
  }

  Widget buildSplash() {
    return FlameSplashScreen(
      theme: FlameSplashTheme.dark,
      onFinish: (BuildContext context) {
        setState(() {
          Sounds.playBackgroundSound();
          showSplash = false;
        });
      },
    );
  }

  Widget buildMenu() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "懒洋君历险记",
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Normal', fontSize: 30.0),
            ),
            const SizedBox(
              height: 90.0,
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0))), //圆角弧度
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 118, 82, 78)), //背景颜色
                ),
                child: const Text(
                  "开始游戏",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Normal',
                    fontSize: 17.0,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SelectUserPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        Sounds.resumeBackgroundSound();
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        Sounds.pauseBackgroundSound();
        break;
      case AppLifecycleState.detached:
        Sounds.stopBackgroundSound();
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    Sounds.stopBackgroundSound();
    super.dispose();
  }
}
