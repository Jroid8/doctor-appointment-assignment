import 'package:doctor_appointment/features/auth/pages/demo_settings.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashPseudoState();
}

// it's a pseudo-state because I only use it for the initState method
class _SplashPseudoState extends State<SplashPage> {
  @override
  void initState() {
    initClient();
    super.initState();
  }

  Future<void> initClient() async {
    await Future.delayed(Duration(seconds: 3));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => DemoSettingsPage()),
      );
    }

    // ClientSessionManager mgr = ClientSessionManager(
    //   LocalDB.instance,
    //   RemoteAuthServerRepo(ServerConn(), MockClientPictureRepo()),
    // );
    // ActiveSession? session = await mgr.loadLocal();
    // if (!mounted) {
    //   // this branch will *never* be taken, but the lint says I must add this.
    //   return;
    // }
    // if (session == null) {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute<void>(builder: (context) => LoginPage(mgr)),
    //   );
    // } else {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (_) => HomePage(session: session, sessionMgr: mgr),
    //     ),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/splash.png");
  }
}
