import 'package:flutter/material.dart';
import 'package:mvvmex/res/color.dart';
import 'package:mvvmex/res/components/round_button.dart';
import 'package:mvvmex/utils/utils.dart';
import 'package:mvvmex/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _obsecuredValue = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final authViewMod = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: AppColor.neonGreen,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: _emailFocusNode,
              decoration: InputDecoration(
                hintText: 'Enter Email',
                labelText: 'Email',
                prefixIcon: Icon(Icons.alternate_email_rounded),
              ),
              onFieldSubmitted: (value) {
                // FocusScope.of(context).requestFocus(_passwordFocusNode);
                Utils.fieldFocusChange(
                    context, _emailFocusNode, _passwordFocusNode);
              },
            ),
            ValueListenableBuilder(
              valueListenable: _obsecuredValue,
              builder: (context, value, child) {
                return TextFormField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  obscureText: _obsecuredValue.value,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_open_rounded),
                    suffixIcon: InkWell(
                      onTap: () {
                        _obsecuredValue.value = !_obsecuredValue.value;
                      },
                      child: Icon(_obsecuredValue.value
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: height * 0.01,
            ),
            RoundBtn(
              title: "Login",
              loading: authViewMod.loading,
              onPress: () {
                if (_emailController.text.isEmpty) {
                  Utils.flushbarErrorMessage("Please enter the email", context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.flushbarErrorMessage(
                      "Please enter the password", context);
                } else if (_passwordController.text.length < 6) {
                  Utils.flushbarErrorMessage(
                      "Password must be atleast 6 digits", context);
                }

                Map data = {
                  "email": _emailController.text.toString(),
                  "password": _passwordController.text.toString()
                };
                authViewMod.loginApi(data, context);
              },
            )
          ],
        ),
      ),
    );
  }
}
