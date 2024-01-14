import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
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
                    maxLength: 40,
                    maxLines: 1,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.pinkAccent.withOpacity(0.3))),
                        labelText: "Your account",
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: TextFormField(
                    maxLength: 40,
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.pinkAccent.withOpacity(0.3))),
                      labelText: "Your password",
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    ),
                  ),
                ),
                const Text('Password ?'),
                const SizedBox(
                  height: 50,
                ),
                Container(
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
                const SizedBox(
                  height: 35,
                ),
                Text("Don't have accounts ?"),
                Container(
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
          ),
        ),
      ),
    );
  }
}
