import 'package:flutter/material.dart';

class settingsScreen extends StatelessWidget {
  const settingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayarlar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Dil Seçimi'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Bildirimler'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.security),
              title: Text('Gizlilik ve Güvenlik'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.color_lens),
              title: Text('Tema Ayarları'),
              onTap: () {},
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: settingsScreen(),
    ),
  );
}
