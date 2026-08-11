import 'package:flutter/material.dart';

void main() {
  runApp(const TelegramProApp());
}

class TelegramProApp extends StatelessWidget {
  const TelegramProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Telegram',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF17212B),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF232E3C),
          elevation: 0,
        ),
      ),
      home: const PhoneAuthScreen(),
    );
  }
}

// ==========================================
// 1. RASMIY TELEGRAM TELEFON KIRISH EKRANI
// ==========================================
class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final TextEditingController _phoneController = TextEditingController(text: "97 518 25 26");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Telefon raqamingiz",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            const Text(
              "Mamlakatingiz kodini tasdiqlang\nva telefon raqamingizni kiriting.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 30),
            
            // Mamlakat tanlash
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent.shade100.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  Text("🇺🇿 ", style: TextStyle(fontSize: 20)),
                  SizedBox(width: 8),
                  Text("O'zbekiston", style: TextStyle(color: Colors.white, fontSize: 16)),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
                ],
              ),
            ),
            const SizedBox(height: 15),

            // Telefon kiritish
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Text("+998", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 15),
                  Expanded(
                    child: TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(color: Colors.white, fontSize: 16, letterSpacing: 1.2),
                      decoration: const InputDecoration(border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Checkbox(value: true, onChanged: (v) {}, activeColor: Colors.blue),
                const Text("Kontaktlarni sinxronlash", style: TextStyle(color: Colors.white70)),
              ],
            ),
            const Spacer(),

            // Davom etish tugmasi
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: FloatingActionButton(
                  backgroundColor: const Color(0xFF2EA6DA),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const TelegramMainScreen()),
                    );
                  },
                  child: const Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 2. TELEGRAM BOSH EKRANI (CHATLAR)
// ==========================================
class TelegramMainScreen extends StatelessWidget {
  const TelegramMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Telegram", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.card_giftcard, color: Colors.pinkAccent),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const GiftsScreen())),
          ),
          IconButton(
            icon: const Icon(Icons.star, color: Colors.amber),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const StarsScreen())),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.purple,
              child: Icon(Icons.star, color: Colors.amber),
            ),
            title: const Text("Rasmiy Kanal (3 ta do'st sharti)", style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text("Xabarlarni ochish uchun kiring"),
            trailing: const Text("00:17", style: TextStyle(color: Colors.grey, fontSize: 12)),
          ),
          const Divider(height: 1, color: Colors.white10),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.deepPurple,
              child: Text("F", style: TextStyle(color: Colors.white)),
            ),
            title: const Text("Free Fire Uzbekistan 🇺🇿", style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text("Qanday zormi ishlar..."),
            trailing: const Text("00:17", style: TextStyle(color: Colors.grey, fontSize: 12)),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 3. HADYA SOTIB OLISH EKRANI (GIFTS)
// ==========================================
class GiftsScreen extends StatelessWidget {
  const GiftsScreen({super.key});

  final List<Map<String, dynamic>> gifts = const [
    {"name": "Lola", "price": "15", "icon": "🌹", "badge": ""},
    {"name": "Ayiqcha", "price": "15", "icon": "🧸", "badge": ""},
    {"name": "Sovg'a", "price": "25", "icon": "🎁", "badge": ""},
    {"name": "Tort", "price": "50+", "icon": "🎂", "badge": ""},
    {"name": "Kupok", "price": "100", "icon": "🏆", "badge": ""},
    {"name": "Uzuk", "price": "100", "icon": "💍", "badge": ""},
    {"name": "Olmos", "price": "100", "icon": "💎", "badge": ""},
    {"name": "Mash'al", "price": "385+", "icon": "🗽", "badge": "qayta sotuv"},
    {"name": "Muzqaymoq", "price": "375+", "icon": "🍦", "badge": "qayta sotuv"},
    {"name": "Fastfud", "price": "380+", "icon": "🍜", "badge": "qayta sotuv"},
    {"name": "Rukzak", "price": "510+", "icon": "🎒", "badge": "qayta sotuv"},
    {"name": "2025 Ilon", "price": "375+", "icon": "🐍", "badge": "qayta sotuv"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hadya sotib olish"),
        leading: const BackButton(),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Chip(label: const Text("Barcha hadyalar"), backgroundColor: Colors.blue.shade700),
                const SizedBox(width: 10),
                const Chip(label: Text("Kolleksion hadyalar"), backgroundColor: Color(0xFF232E3C)),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.8,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: gifts.length,
              itemBuilder: (context, index) {
                final item = gifts[index];
                return Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF232E3C),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    children: [
                      if (item["badge"].isNotEmpty)
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                            child: Text(item["badge"], style: const TextStyle(fontSize: 9, color: Colors.white)),
                          ),
                        ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(item["icon"], style: const TextStyle(fontSize: 40)),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.star, color: Colors.amber, size: 14),
                                  const SizedBox(width: 4),
                                  Text(item["price"], style: const TextStyle(color: Colors.amber, fontSize: 12, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 4. TELEGRAM YULDUZLAR (STARS) EKRANI
// ==========================================
class StarsScreen extends StatelessWidget {
  const StarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Icon(Icons.star_rate_round, size: 90, color: Colors.amber),
            const SizedBox(height: 10),
            const Text("Telegram Yulduzlar", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              "Telegramdagi mini ilovalarda kontent va xizmatlarni ochish uchun yulduzlarni sotib oling.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 30),

            // Balans qismi
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF232E3C),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 28),
                      SizedBox(width: 8),
                      Text("0", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Text("balansingiz", style: TextStyle(color: Colors.grey, fontSize: 12)),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2EA6DA),
                      minimumSize: const Size(double.infinity, 45),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text("Yulduzlar sotib olish", style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(height: 10),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.group_add, color: Colors.blue, size: 18),
                    label: const Text("Do'stlarga yulduzlar hadya qilish", style: TextStyle(color: Colors.blue)),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),

            // Yulduzlar ishlashn
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF232E3C),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.monetization_on, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("Yulduzlar ishlash ", style: TextStyle(fontWeight: FontWeight.bold)),
                            Chip(label: Text("NEW", style: TextStyle(fontSize: 8, color: Colors.white)), backgroundColor: Colors.blue, padding: EdgeInsets.zero),
                          ],
                        ),
                        Text("Mini ilovalarga havolalarni tarqating va ularning daromadidan ulush oling.", style: TextStyle(fontSize: 11, color: Colors.grey)),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
