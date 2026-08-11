import 'package02/flutter/material.dart';
import 'auth_service.dart';
import 'home_screen.dart'; // Chatlar ro'yxati ekrani

class CodeScreen extends StatefulWidget {
  final String phoneNumber;

  CodeScreen({required this.phoneNumber});

  @override
  _CodeScreenState createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  final TextEditingController codeController = TextEditingController();
  final AuthService authService = AuthService();
  bool isLoading = false;

  void onVerifyPressed() async {
    String code = codeController.text.trim();
    if (code.length < 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Kodni to'liq kiriting!")),
      );
      return;
    }

    setState(() => isLoading = true);

    // Telegram API orqali kodni tekshiramiz
    bool isSuccess = await authService.verifyCode(code);

    setState(() => isLoading = false);

    if (isSuccess) {
      // Kod to'g'ri bo'lsa, Bosh ekranga (Chatlar bo'limiga) o'tamiz
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false, // Ortga qaytib bo'lmaydigan qilamiz
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("SMS kod xato kiritildi, qayta urinib ko'ring.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tasdiqlash")),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.mark_email_unread_outlined, size: 70, color: Colors.blue),
            SizedBox(height: 20),
            Text(
              "Kodni kiriting",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "${widget.phoneNumber} raqamiga Telegram orqali xabar yuborildi.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 30),
            TextField(
              controller: codeController,
              keyboardType: TextInputType.number,
              maxLength: 5,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, letterSpacing: 8, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                counterText: "",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                hintText: "•••••",
              ),
            ),
            SizedBox(height: 25),
            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: onVerifyPressed,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text("Kirish", style: TextStyle(fontSize: 18)),
                  ),
          ],
        ),
      ),
    );
  }
}
