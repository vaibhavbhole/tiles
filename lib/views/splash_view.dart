import 'package:flutter/material.dart';
import 'package:tiles/repositories/UserRepository.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final UserRepository _userRepository = UserRepository();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userRepository.isLoggedIn().then((value) {

      if (value) {
        Navigator.popAndPushNamed(context, '/home');
      } else {
        Navigator.popAndPushNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade50,
      child: Center(
        child: Image.asset('assets/images/arham_technosoft.jpg',width: 100.0,height: 100.0,),
      ),
    );
  }
}
