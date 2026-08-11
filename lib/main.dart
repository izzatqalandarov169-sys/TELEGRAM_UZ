import 'package:flutter/material.dart';

void main() {
  runApp(const TelegramUzApp());
}

class TelegramUzApp extends StatelessWidget {
  const TelegramUzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Telegram UZ',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF17212B),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF232E3C)),
      ),
      home: const LoginScreen(),
    );
  }
}

// ==========================================
// 1. LOGIN EKRANI
// ==========================================
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final int apiId = 37349381;
  final String apiHash = 'b98c62f5d7f406bea15614613e4a3e41';
  final TextEditingController phoneController = TextEditingController(text: "+998");
  bool isLoading = false;

  void sendCode() async {
    setState(() => isLoading = true);
    await Future.delayed(const Duration(seconds: 1)); // Simulyatsiya
    setState(() => isLoading = false);

    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CodeScreen(phoneNumber: phoneController.text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Telegram UZ")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Telefon Raqamingiz", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(border: OutlineInputBorder(), labelText: "Telefon raqam"),
            ),
            const SizedBox(height: 20),
            isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: sendCode,
                    style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                    child: const Text("Davom etish ->"),
                  ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 2. SMS KODINI KIRITISH EKRANI
// ==========================================
class CodeScreen extends StatefulWidget {
  final String phoneNumber;
  const CodeScreen({super.key, required this.phoneNumber});

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  final TextEditingController codeController = TextEditingController();

  void verifyCode() {
    if (codeController.text.length == 5) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(userPhone: widget.phoneNumber)),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tasdiqlash")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${widget.phoneNumber} raqamiga kod yuborildi"),
            const SizedBox(height: 20),
            TextField(
              controller: codeController,
              keyboardType: TextInputType.number,
              maxLength: 5,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, letterSpacing: 8),
              decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "•••••"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: verifyCode,
              style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
              child: const Text("Kirish"),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 3. BOSH EKRAN (CHATLAR RO'YXATI)
// ==========================================
class HomeScreen extends StatelessWidget {
  final String userPhone;
  const HomeScreen({super.key, required this.userPhone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Telegram"),
        actions: [
          IconButton(
            icon: const Icon(Icons.card_giftcard, color: Colors.pinkAccent),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PromoScreen())),
          ),
          IconButton(
            icon: const Icon(Icons.admin_panel_settings, color: Colors.amber),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminScreen())),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.star, color: Colors.amber)),
            title: const Text("Rasmiy Kanal (3 ta do'st sharti)"),
            subtitle: const Text("Xabarlarni ochish uchun kiring"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ChannelGateScreen())),
          ),
          const Divider(),
          const ListTile(
            leading: CircleAvatar(child: Text("F")),
            title: Text("Free Fire Uzbekistan 🇺🇿"),
            subtitle: Text("Qanday zormi ishlar..."),
            trailing: Text("00:17"),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 4. PROMOKOD VA GIFT EKRANI
// ==========================================
class PromoScreen extends StatefulWidget {
  const PromoScreen({super.key});

  @override
  State<PromoScreen> createState() => _PromoScreenState();
}

class _PromoScreenState extends State<PromoScreen> {
  final TextEditingController promoController = TextEditingController();
  List<String> myGifts = [];
  int stars = 0;

  void applyPromo() {
    String code = promoController.text.trim().toLowerCase();
    if (code == "salom") {
      setState(() => myGifts.add("Exclusive Gift 🎁"));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Gift qo'shildi! 🎉")));
    } else if (code == "stars100") {
      setState(() => stars += 100);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("100 Stars qo'shildi! ⭐️")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Promokod xato!")));
    }
    promoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Promokod va Sovg'alar")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Yulduzlaringiz: $stars ⭐️", style: const TextStyle(fontSize: 18, color: Colors.amber)),
            const SizedBox(height: 15),
            TextField(
              controller: promoController,
              decoration: InputDecoration(
                hintText: "Promokod (masalan: salom)",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(icon: const Icon(Icons.send), onPressed: applyPromo),
              ),
            ),
            const SizedBox(height: 20),
            const Text("Mening Giftlarim:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: myGifts.length,
                itemBuilder: (context, i) => ListTile(
                  leading: const Icon(Icons.card_giftcard, color: Colors.pink),
                  title: Text(myGifts[i]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 5. KANALGA 3 TA DO'ST TAKLIF QILISH EKRANI
// ==========================================
class ChannelGateScreen extends StatefulWidget {
  const ChannelGateScreen({super.key});

  @override
  State<ChannelGateScreen> createState() => _ChannelGateScreenState();
}

class _ChannelGateScreenState extends State<ChannelGateScreen> {
  int friendsCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kanal")),
      body: friendsCount >= 3
          ? ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                Text("🔥 Xush kelibsiz! Kanaldagi maxsus xabarlar ochildi.", style: TextStyle(fontSize: 16)),
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.lock, size: 70, color: Colors.amber),
                  const SizedBox(height: 15),
                  const Text("Kanalni ochish uchun 3 ta do'st taklif qiling!"),
                  Text("Qo'shildi: $friendsCount / 3", style: const TextStyle(fontSize: 18, color: Colors.blue)),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      if (friendsCount < 3) setState(() => friendsCount++);
                    },
                    child: const Text("Do'st Qo'shish"),
                  )
                ],
              ),
            ),
    );
  }
}

// ==========================================
// 6. ADMIN PANEL
// ==========================================
class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Panel 👑")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const TextField(decoration: InputDecoration(labelText: "Foydalanuvchi ID / Raqam", border: OutlineInputBorder())),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(child: ElevatedButton(onPressed: () {}, child: const Text("+ Stars"))),
              const SizedBox(width: 10),
              Expanded(child: ElevatedButton(onPressed: () {}, child: const Text("- Stars"))),
            ],
          ),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: () {}, child: const Text("Premium Sovg'a Qilish")),
          ElevatedButton(onPressed: () {}, child: const Text("Direct Gift Yuborish 🎁")),
        ],
      ),
    );
  }
}
