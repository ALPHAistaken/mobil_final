import 'package:flutter/material.dart';

class CommunicationScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("İletişim"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Adınız:",
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Adınızı girin",
              ),
            ),
            SizedBox(height: 10),
            Text(
              "E-Posta:",
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "E-posta adresinizi girin",
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Mesajınız:",
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: messageController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Mesajınızı girin",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text;
                final email = emailController.text;
                final message = messageController.text;

                print("Ad: $name, E-Posta: $email, Mesaj: $message");

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Mesajınız Gönderildi'),
                    content: Text('Teşekkür ederiz, mesajınız alınmıştır.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Tamam'),
                      ),
                    ],
                  ),
                );
              },
              child: Text("Gönder"),
            ),
          ],
        ),
      ),
    );
  }
}
