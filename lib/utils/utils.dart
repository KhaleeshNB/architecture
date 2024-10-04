import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static flushbarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.all(15),
          message: message,
          backgroundColor: Colors.red,
          borderRadius: BorderRadius.circular(8),
          duration: Duration(seconds: 2),
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: Icon(
            Icons.error,
            size: 28,
            color: Colors.white,
          ),
          flushbarPosition: FlushbarPosition.TOP,
        )..show(context));
  }

  static flushbarSuccessMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.all(15),
          message: message,
          backgroundColor: Colors.green,
          borderRadius: BorderRadius.circular(8),
          duration: Duration(seconds: 2),
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: Icon(
            Icons.error,
            size: 28,
            color: Colors.white,
          ),
          flushbarPosition: FlushbarPosition.TOP,
        )..show(context));
  }

  static snackbarMessage(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(message)));
  }
}
