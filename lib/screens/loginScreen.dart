import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 83, 0, 161),
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 36, 18, 39),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "E-MAIL:",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 235, 235, 235),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextField(
                    controller: emailController,
                    decoration:
                        InputDecoration(hintText: "E-mail adresinizi girin"),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "ŞİFRE:",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 235, 235, 235),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(hintText: "Şifrenizi girin"),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final email = emailController.text;
                        final password = passwordController.text;

                        final prefs = await SharedPreferences.getInstance();
                        final registeredName = prefs.getString('name');
                        final registeredEmail = prefs.getString('email');
                        final registeredPassword = prefs.getString('password');

                        if (email == registeredEmail &&
                            password == registeredPassword) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Giriş Başarılı'),
                              content: Text('Hoş geldiniz ' ' $registeredName'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pushReplacementNamed(
                                        context, '/home');
                                  },
                                  child: Text('Tamam'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Giriş Başarısız'),
                              content: Text('E-posta veya şifre hatalı.'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('git'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      child: Text("Login"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
