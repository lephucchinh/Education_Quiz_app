import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizgames/services/authentication.dart';
import 'package:quizgames/services/total_coins.dart';
import 'package:quizgames/ui/Home_screen/Home_screen.dart';

import 'Bloc/register_screen_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final usernameField = TextEditingController();
  final passwordField = TextEditingController();
  final confirmPasswordField = TextEditingController();
  bool checkConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => RegisterScreenBloc(
        RepositoryProvider.of<AuthenticationService>(context),
        RepositoryProvider.of<TotalCoinsServices>(context),
      )..add(RegisterServicesEvent()),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: BlocConsumer<RegisterScreenBloc, RegisterScreenState>(
          listener: (context, state) {
            if (state is SuccessRegisterState) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => HomeScreen(username: state.username)));
            }
            if (state is FailureRegisterState) {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: const Text('error'),
                        content: Text(state.error),
                      ));
            }
          },
          builder: (context, state) {
            if (state is RegisterScreenInitial) {
              return SafeArea(
                child: Scaffold(
                  body: SingleChildScrollView(
                      child: SizedBox(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          const Text(
                            'Create account',
                            style: TextStyle(
                                color: Colors.pinkAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          TextFormField(
                            controller: usernameField,
                            maxLength: 40,
                            maxLines: 1,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.pinkAccent
                                            .withOpacity(0.3))),
                                labelText: "Your account",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10)),
                          ),
                          TextFormField(
                            controller: passwordField,
                            maxLength: 40,
                            maxLines: 1,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Colors.pinkAccent.withOpacity(0.3))),
                              labelText: "Your password",
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                            ),
                          ),
                          TextFormField(
                            controller: confirmPasswordField,
                            maxLength: 40,
                            maxLines: 1,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.pinkAccent
                                            .withOpacity(0.3))),
                                labelText: "Confirm password",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                errorText: !checkConfirmPassword
                                    ? 'Password do not match !'
                                    : null),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if(passwordField.text != confirmPasswordField.text){
                                  checkConfirmPassword = !checkConfirmPassword;
                                }
                                else{
                                  BlocProvider.of<RegisterScreenBloc>(context).add(
                                      RegisterAccountEvent(
                                          username: usernameField.text,
                                          password: passwordField.text));
                                }
                              });

                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              width: size.width * 0.85,
                              height: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.teal.withOpacity(0.8),
                              ),
                              child: Center(
                                  child: Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19),
                              )),
                            ),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          const Text(
                            "Already have an account ?",
                            style: TextStyle(
                                color: Colors.pinkAccent,
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              width: size.width * 0.85,
                              height: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.cyan,
                              ),
                              child: Center(
                                  child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
