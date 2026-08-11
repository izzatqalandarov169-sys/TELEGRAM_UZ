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
            // Mana bu yerda Icons.star_rounded ishlatildi:
            const Icon(Icons.star_rounded, size: 90, color: Colors.amber),
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

            // Yulduzlar ishlash
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
                            Chip(
                              label: Text("NEW", style: TextStyle(fontSize: 8, color: Colors.white)), 
                              backgroundColor: Colors.blue, 
                              padding: EdgeInsets.zero
                            ),
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
