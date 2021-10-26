import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:sheep_game/utils/sounds.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    Sounds.playBackgroundSound();
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return FlameSplashScreen(
      theme: FlameSplashTheme.dark,
      onFinish: (BuildContext context) {},
    );
  }
}
