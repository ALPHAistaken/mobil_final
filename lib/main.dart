import 'package:flutter/material.dart';

import 'package:vizeproje/screens/productsScreen.dart';
import 'package:vizeproje/screens/settingsScreen.dart';

import 'screens/homeScreen.dart';
import 'screens/loginScreen.dart';
import 'screens/profileScreen.dart';
import 'screens/registerScreen.dart';
import 'screens/welcomeScreen.dart';
import 'screens/communicationScreen.dart';
import 'screens/aboutusScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget registerScreen() {
    return RegisterScreen();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => registerScreen(),
        '/profile': (context) => ProfileScreen(),
        '/welcome': (context) => const welcomeScreen(),
        '/settings': (context) => const settingsScreen(),
        '/communication': (context) => CommunicationScreen(),
        '/aboutus': (context) => AboutUsScreen(),
        '/products': (context) => ProductsScreen(),
      },
      initialRoute: '/welcome',
      theme: ThemeData(),
      home: LoginScreen(),
    );
  }
}
