import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizgames/services/authentication.dart';
import 'package:quizgames/services/total_coins.dart';
import 'package:quizgames/ui/Home_screen/Home_screen.dart';

import 'bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  final usernameField = TextEditingController();
  final passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    return BlocProvider(
      create: (context) =>
      LoginBloc(
        RepositoryProvider.of<AuthenticationService>(context),
        RepositoryProvider.of<TotalCoinsServices>(context),
      )
        ..add(RegisterServicesEvent()),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is SuccessLoginState) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => HomeScreen(username: state.username)));
            }
          },
          builder: (context, state) {
            if(state is LoginInitial){
              return SafeArea(
                child: Scaffold(
                  body: SingleChildScrollView(
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            Image.asset('assets/icons/logo.png'),
                            const Text(
                              'Quiz game',
                              style: TextStyle(
                                  color: Colors.pinkAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 35),
                              child: TextFormField(
                                controller: usernameField,
                                maxLength: 40,
                                maxLines: 1,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                            Colors.pinkAccent.withOpacity(0.3))),
                                    labelText: "Your account",
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 10)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 35),
                              child: TextFormField(
                                controller: passwordField,
                                obscureText: _obscureText,
                                maxLength: 40,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.pinkAccent.withOpacity(
                                              0.3))),
                                  labelText: "Your password",
                                  suffixIcon: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                      child: Icon(Icons.remove_red_eye_outlined)),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                ),
                              ),
                            ),
                            const Text(
                              'Password ?',
                              style: TextStyle(
                                color: Colors.pinkAccent,
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  BlocProvider.of<LoginBloc>(context).add(
                                      LoginPressEvent(
                                          username: usernameField.text,
                                          password: passwordField.text));
                                });
                              },
                              child: Container(
                                width: size.width * 0.85,
                                height: 55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.cyan,
                                ),
                                child: Center(
                                    child: Text(
                                      'Login in',
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
                            Text(
                              "Don't have accounts ?",
                              style: TextStyle(
                                color: Colors.pinkAccent,
                              ),
                            ),
                            Container(
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
                          ],
                        ),
                      )),
                ),
              );
            }
            else return Container();


          },
        ),
      ),
    );
  }
}
