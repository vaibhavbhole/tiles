import 'package:flutter/cupertino.dart';
import 'package:tiles/models/User.dart';
import 'package:tiles/repositories/UserRepository.dart';

class UserVm extends ChangeNotifier{
  User? user;
  final UserRepository _userRepository=UserRepository();

  void init() async{
    user=await _userRepository.getUser();
    notifyListeners();
  }

  Future logout() async{
    return _userRepository.logOut();
  }
}