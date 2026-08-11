import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  // Controller'lar
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController starsController = TextEditingController();
  final TextEditingController promoCodeController = TextEditingController();
  final TextEditingController giftImageController = TextEditingController();

  String promoType = "gift";
  String selectedGiftType = "Star Gift"; // Sovg'a turi

  // 1. Foydalanuvchiga Stars qo'shish yoki ayirish
  void updateStars({required bool isAdding}) {
    String userId = userIdController.text.trim();
    String amountStr = starsController.text.trim();

    if (userId.isEmpty || amountStr.isEmpty) {
      showSnackBar("Foydalanuvchi ID va Yulduzlar sonini kiriting!");
      return;
    }

    int amount = int.parse(amountStr);
    String action = isAdding ? "+$amount Stars qo'shildi" : "-$amount Stars ayirildi";
    
    showSnackBar("Foydalanuvchi ($userId): $action!");
    starsController.clear();
  }

  // 2. Premium sovg'a qilish
  void givePremium(int months) {
    String userId = userIdController.text.trim();

    if (userId.isEmpty) {
      showSnackBar("Foydalanuvchi ID yoki telefon raqamini kiriting!");
      return;
    }

    showSnackBar("Foydalanuvchiga ($userId) $months oylik Premium taqdim etildi! ⭐️");
  }

  // 3. To'g'ridan-to'g'ri Gift yuborish
  void sendDirectGift() {
    String userId = userIdController.text.trim();
    if (userId.isEmpty) {
      showSnackBar("Foydalanuvchi ID manzilini kiriting!");
      return;
    }

    showSnackBar("Foydalanuvchiga ($userId) '$selectedGiftType' sovg'asi yuborildi! 🎁");
  }

  // 4. Promokod Yaratish
  void createPromo() {
    String code = promoCodeController.text.trim();
    if (code.isEmpty) return;

    showSnackBar("Yangi Promokod yaratildi: '$code'");
    promoCodeController.clear();
  }

  void showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF17212B),
      appBar: AppBar(
        title: Text("Admin Panel 👑"),
        backgroundColor: Color(0xFF232E3C),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // FOYDALANUVCHINI TANLASH
            Text("Foydalanuvchi ID / Raqami", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            TextField(
              controller: userIdController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Masalan: 1371356391 yoki +99890...",
                hintStyle: TextStyle(color: Colors.grey[600]),
                filled: true,
                fillColor: Color(0xFF232E3C),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 20),

            // 1. STARS BO'LIMI (QO'SHISH VA AYIRISH)
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(color: Color(0xFF232E3C), borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 8),
                      Text("Stars Boshqaruvi", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: starsController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: "Yulduzlar miqdori",
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => updateStars(isAdding: true),
                          icon: Icon(Icons.add),
                          label: Text("Qo'shish"),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => updateStars(isAdding: false),
                          icon: Icon(Icons.remove),
                          label: Text("Ayirish"),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 15),

            // 2. PREMIUM SOVG'A QILISH
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(color: Color(0xFF232E3C), borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.workspace_premium, color: Colors.purpleAccent),
                      SizedBox(width: 8),
                      Text("Premium Sovg'a Qilish", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () => givePremium(1),
                        child: Text("1 Oy"),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                      ),
                      ElevatedButton(
                        onPressed: () => givePremium(6),
                        child: Text("6 Oy"),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                      ),
                      ElevatedButton(
                        onPressed: () => givePremium(12),
                        child: Text("1 Yil"),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),

            // 3. GIFT YUBORISH
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(color: Color(0xFF232E3C), borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.card_giftcard, color: Colors.pinkAccent),
                      SizedBox(width: 8),
                      Text("Gift Yuborish (To'g'ridan-to'g'ri)", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 10),
                  DropdownButton<String>(
                    dropdownColor: Color(0xFF232E3C),
                    value: selectedGiftType,
                    isExpanded: true,
                    style: TextStyle(color: Colors.white),
                    items: [
                      DropdownMenuItem(value: "Star Gift", child: Text("⭐️ Star Gift")),
                      DropdownMenuItem(value: "VIP Bear Gift", child: Text("🧸 VIP Bear Gift")),
                      DropdownMenuItem(value: "Golden Crown Gift", child: Text("👑 Golden Crown Gift")),
                    ],
                    onChanged: (val) => setState(() => selectedGiftType = val!),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: sendDirectGift,
                    child: Text("Giftni Yuborish 🎁"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      minimumSize: Size(double.infinity, 45),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),

            // 4. PROMOKOD BO'LIMI
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(color: Color(0xFF232E3C), borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Promokod Yaratish", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 10),
                  TextField(
                    controller: promoCodeController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: "Promokod (masalan: salom)",
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: createPromo,
                    child: Text("Promokod Yaratish"),
                    style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 45)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
