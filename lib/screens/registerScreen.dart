import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
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
                  "Ad ve Soyad:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 100, 47, 168),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextField(
                    controller: nameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "İsim ve soyisim",
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Email:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 100, 47, 168),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextField(
                    controller: emailController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "email'iniz",
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "ŞİFRE:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 100, 47, 168),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextField(
                    controller: passwordController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "şifreniz",
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final name = nameController.text;
                        final email = emailController.text;
                        final password = passwordController.text;

                        await saveUserCredentials(name, email, password);

                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Kayıt Başarılı'),
                            content: Text('Yeni kullanıcı oluşturuldu.'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('Tamam'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text("Register"),
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

  Future<void> saveUserCredentials(
      String name, String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name);
    prefs.setString('email', email);
    prefs.setString('password', password);
  }
}

void main() {
  runApp(
    MaterialApp(
      home: RegisterScreen(),
    ),
  );
}
