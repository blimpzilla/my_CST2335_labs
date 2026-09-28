import 'package:flutter/material.dart';
import 'package:flutter_easy_translate/flutter_easy_translate.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final passwordController = TextEditingController();

  String imageSource = "images/questions.png";

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(translate('page_title'))),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: translate("login_name"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: translate("password"),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final password = passwordController.text;
                setState(() {
                  if (password == "ASDF") {
                    imageSource = "images/lightbulb.png";
                    debugPrint("Correct Password");
                  } else {
                    imageSource = 'images/stop.png';
                    debugPrint("Incorrect Password");
                  }
                });
              },
              child: Text(translate("login_button")),
            ),
            const SizedBox(height: 24),
            Image.asset(
              imageSource,
              width: 300,
              height: 300,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 24),
            PopupMenuButton<String>(
              tooltip: translate("language"),
              onSelected: (String languageCode) async {
                await changeLocale(context, languageCode);
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem<String>(
                  value: "en",
                  child: Text("English"),
                ),
                const PopupMenuItem<String>(
                  value: "fr",
                  child: Text("Français"),
                ),
              ],
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(translate("language")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
