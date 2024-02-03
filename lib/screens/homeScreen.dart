import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vizeproje/screens/postScreen.dart';
import '../widgets/menuItem.dart';
import '../widgets/profileItem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userName = "Enes ÖZCAN"; // Default değer

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final savedName = prefs.getString('name');
    if (savedName != null && savedName.isNotEmpty) {
      setState(() {
        userName = savedName;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Uygulama Adı"),
        backgroundColor: Color.fromARGB(255, 209, 209, 209), // Önerilen Renk
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ProfileItem(
              avatar: 'assets/images/avatar.png',
              name: userName,
              onTap: () {
                Navigator.pushNamed(context, "/profile");
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MenuItem(
                      title: "Ana Ekran",
                      icon: Icon(Icons.home,
                          size: 20, color: Colors.blueGrey[600]),
                      onTap: () {
                        Navigator.pushNamed(context, '/home');
                      },
                    ),
                    Divider(
                      color: Colors.blueGrey[300],
                    ),
                    MenuItem(
                      title: "Hakkımızda",
                      icon: Icon(Icons.info_outline,
                          size: 20, color: Colors.amber[700]),
                      onTap: () {
                        Navigator.pushNamed(context, '/aboutus');
                      },
                    ),
                    Divider(
                      color: Colors.amber[400],
                    ),
                    MenuItem(
                      title: "Ürünler",
                      icon: Icon(Icons.store,
                          size: 20, color: Colors.orange[400]),
                      onTap: () {
                        Navigator.pushNamed(context, '/products');
                      },
                    ),
                    Divider(color: Colors.orange[200]),
                    MenuItem(
                      title: "İletişim",
                      icon:
                          Icon(Icons.phone, size: 20, color: Colors.teal[400]),
                      onTap: () {
                        Navigator.pushNamed(context, '/communication');
                      },
                    ),
                    Divider(color: Colors.teal[200]),
                    MenuItem(
                      title: "Ayarlar",
                      icon: Icon(
                        Icons.settings,
                        size: 25,
                        color: Colors.purple[400],
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, "/settings");
                      },
                    ),
                    Divider(color: Colors.purple[200]),
                    MenuItem(
                      icon: Icon(Icons.logout_outlined, color: Colors.red[400]),
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/welcome', (route) => false);
                      },
                      title: "Çıkış",
                    ),
                    Divider(
                      color: Colors.blueGrey[300],
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "Versiyon 1.0.7",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      body: postScreen(),
    );
  }
}
