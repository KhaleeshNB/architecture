import 'package:flutter/material.dart';
import 'package:mvvmex/res/color.dart';

class RoundBtn extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundBtn(
      {super.key,
      required this.title,
      this.loading = false,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.success,
        ),
        child: Center(
          child: loading
              ? CircularProgressIndicator()
              : Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
        ),
        padding: EdgeInsets.all(10),
        height: 50,
        width: 550,
        margin: EdgeInsets.all(10),
      ),
    );
  }
}
