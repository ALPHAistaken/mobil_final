import 'package:flutter/material.dart';

class welcomeScreen extends StatelessWidget {
  const welcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "İNSTAGRAMA HOŞGELDİNİZ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/login'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  minimumSize: Size(150, 50),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20), // Yatay padding
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.login_rounded),
                    SizedBox(width: 5),
                    Text("GİRİŞ"),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  minimumSize: Size(150, 50),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20), // Yatay padding
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.app_registration),
                    SizedBox(width: 5),
                    Text("KAYIT"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
