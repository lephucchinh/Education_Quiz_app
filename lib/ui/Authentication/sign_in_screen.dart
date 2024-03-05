import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizgames/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:quizgames/components/strings.dart';
import 'package:quizgames/components/textfield.dart';
import 'package:quizgames/ui/Home_screen/Home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePassword = true;
  IconData iconPassword = CupertinoIcons.eye_fill;
  bool significance = false;
  String? _errorMsg;
  bool signInRequired = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          setState(() {
            signInRequired = false;
          });
        }
        else if (state is SignInProgress) {
          setState(() {
            signInRequired = true;
          });
        } else if (state is SignInFailure) {
          signInRequired = false;
          _errorMsg = 'Invalid email or password';
        }
      },
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: size.width * 0.9,
                child: MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  prefixIcon: const Icon(CupertinoIcons.mail_solid),
                  errorMsg: _errorMsg,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please fill in the field';
                    } else if (!emailRexExp.hasMatch(val)) {
                      return 'Please fill in the Email';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: size.width * 0.9,
                child: MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: obscurePassword,
                  keyboardType: TextInputType.text,
                  prefixIcon: const Icon(CupertinoIcons.lock_fill),
                  errorMsg: _errorMsg,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please fill in the field';
                    } else if (!passwordRexExp.hasMatch(val)) {
                      return 'Please fill in the Password';
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                        if (obscurePassword) {
                          iconPassword = CupertinoIcons.eye_fill;
                        } else {
                          iconPassword = CupertinoIcons.eye_slash_fill;
                        }
                      });
                    },
                    icon: Icon(iconPassword),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              !signInRequired
                  ? SizedBox(
                width: size.width * 0.9,
                child: TextButton(
                    style: TextButton.styleFrom(
                        elevation: 3,
                        backgroundColor:
                        Theme
                            .of(context)
                            .colorScheme
                            .primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                        )),
                    onPressed: () {
                        if (_formKey.currentState!.validate()) {
                            context.read<SignInBloc>().add(SignInRequired(
                              // kinh nghiệm TextEditingController bắt buộc sủa dụng kiểu .text chứ không hể sử dụng kiểu .toString
                                email: emailController.text,
                                password: passwordController.text));

                        }


                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 25),
                      child: Text(
                        'Sign In',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )),
              )
                  : const CircularProgressIndicator()
            ],
          )),
    );
  }
}
