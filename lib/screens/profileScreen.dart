import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/menuItem.dart';
import '../widgets/profileItem.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController securityInfoController = TextEditingController();

  String userName = "";
  String userEmail = "";
  String userPhone = "";
  String userSecurityInfo = "";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('name') ?? "";
      userEmail = prefs.getString('email') ?? "";
      userPhone = prefs.getString('phone') ?? "";
      userSecurityInfo = prefs.getString('securityInfo') ?? "";
    });
  }

  _saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('phone', userPhone);
    prefs.setString('securityInfo', userSecurityInfo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
        backgroundColor: Color.fromARGB(255, 87, 131, 167), // Önerilen Renk
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          ProfileItem(
            avatar: 'assets/images/avatar.png',
            name: userName,
          ),
          Divider(
            color: Colors.grey[400],
          ),
          MenuItem(
            icon: Icon(Icons.email, color: Colors.blue[700]),
            title: "Email: $userEmail",
            onTap: () {},
          ),
          Divider(
            color: Colors.grey[400],
          ),
          MenuItem(
            icon: Icon(Icons.phone, color: Colors.green[700]),
            title: "Telefon: + $userPhone",
            onTap: () {
              _showInputDialog(context, "Telefon Numarası", phoneController);
            },
          ),
          Divider(
            color: Colors.grey[400],
          ),
          MenuItem(
            icon: Icon(Icons.topic, color: Colors.orange[700]), // Önerilen Renk
            title: "İşiniz: $userSecurityInfo",
            onTap: () {
              _showInputDialog(context, "İşiniz", securityInfoController);
            },
          ),
          Divider(
            color: Colors.grey[400],
          ),
          SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(78, 89, 133, 151), // Önerilen Renk
            ),
            child: Text("Geri"),
          ),
          Center(),
        ],
      ),
    );
  }

  _showInputDialog(BuildContext context, String title,
      TextEditingController controller) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: controller,
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  if (title == "Telefon Numarası") {
                    userPhone = phoneController.text;
                  } else if (title == "İşiniz") {
                    userSecurityInfo = securityInfoController.text;
                  }
                });
                _saveUserData();
                Navigator.pop(context);
              },
              child: Text('Kaydet'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('İptal'),
            ),
          ],
        );
      },
    );
  }
}
