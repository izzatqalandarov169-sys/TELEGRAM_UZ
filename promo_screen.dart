import 'package:flutter/material.dart';

class PromoScreen extends StatefulWidget {
  @override
  _PromoScreenState createState() => _PromoScreenState();
}

class _PromoScreenState extends State<PromoScreen> {
  final TextEditingController promoController = TextEditingController();
  List<Map<String, String>> myGifts = []; // Profilga tushgan giftlar
  int myStars = 0; // Foydalanuvchining Stars balansi

  void applyPromocode() {
    String code = promoController.text.trim().toLowerCase();

    if (code == "salom") {
      setState(() {
        myGifts.add({
          "title": "Eksklyuziv Gift 🎁",
          "image": "https://telegram.org/file/464001186/1/x2f...", // Yoki assets/gift.png
        });
      });
      showRewardDialog("Tabriklaymiz!", "Sizga yangi Telegram Gift sovg'a qilindi!");
    } else if (code == "stars100") {
      setState(() {
        myStars += 100;
      });
      showRewardDialog("Ajoyib!", "Hisobingizga 100 ta Yulduz (Stars) qo'shildi!");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Promokod xato yoki ishlatib bo'lingan!")),
      );
    }
    promoController.clear();
  }

  void showRewardDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Ajoyib"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF17212B),
      appBar: AppBar(
        title: Text("Promokod va Hadyalar"),
        backgroundColor: Color(0xFF232E3C),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Balans ko'rsatkichi
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF232E3C),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Sizning Yulduzlaringiz:", style: TextStyle(color: Colors.white, fontSize: 16)),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 5),
                      Text("$myStars", style: TextStyle(color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            
            // Promokod kiritish maydoni
            TextField(
              controller: promoController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Promokodni kiriting (masalan: salom)",
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Color(0xFF232E3C),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                suffixIcon: IconButton(
                  icon: Icon(Icons.send, color: Colors.blue),
                  onPressed: applyPromocode,
                ),
              ),
            ),
            SizedBox(height: 25),

            // Olingan Giftlar ro'yxati
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Mening Giftlarim:", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            Expanded(
              child: myGifts.isEmpty
                  ? Center(child: Text("Hozircha sizda Giftlar yo'q", style: TextStyle(color: Colors.grey)))
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
                      itemCount: myGifts.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF232E3C),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.card_giftcard, size: 50, color: Colors.pinkAccent),
                              SizedBox(height: 10),
                              Text(myGifts[index]['title']!, style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
