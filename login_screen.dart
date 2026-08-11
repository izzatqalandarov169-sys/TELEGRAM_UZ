import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'code_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController(text: "+998");
  final AuthService authService = AuthService();
  bool isLoading = false;

  void onNextPressed() async {
    setState(() => isLoading = true);
    
    String phone = phoneController.text.trim();
    bool success = await authService.sendCode(phone);

    setState(() => isLoading = false);

    if (success) {
      // Kod yuborildi, keyingi SMS kod kiritish ekraniga o'tamiz
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CodeScreen(phoneNumber: phone)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Xatolik! Telefon raqamni qayta tekshiring.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Telegram UZ")),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sizning Telefon Raqamingiz",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Mamlakat kodini va telefon raqamingizni kiriting."),
            SizedBox(height: 20),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Telefon raqam",
              ),
            ),
            SizedBox(height: 30),
            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: onNextPressed,
                    child: Text("Davom etish ->"),
                  ),
          ],
        ),
      ),
    );
  }
}
