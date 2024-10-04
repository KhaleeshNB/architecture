import 'package:flutter/material.dart';
import 'package:mvvmex/repository/auth_repository.dart';
import 'package:mvvmex/utils/routes/routes_name.dart';
import 'package:mvvmex/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      Utils.flushbarSuccessMessage("Login successful", context);
      Navigator.pushNamed(context, RoutesName.home);
      print(value.toString());
    }).onError((error, StackTrace) {
      setLoading(false);
      Utils.flushbarErrorMessage(error.toString(), context);
    });
  }
}
