import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  List<Map<String, dynamic>> chatList = [];

  @override
  void initState() {
    super.initState();
    loadTelegramChats();
  }

  // Telegram serveridan chatlar ro'yxatini olish
  void loadTelegramChats() async {
    // Bu yerda TDLib orqali chatlar yuklanadi:
    // await TelegramService.getChats();

    // Hozircha sinov uchun namuna ma'lumotlar:
    await Future.delayed(Duration(seconds: 1)); // Serverdan yuklanish simulyatsiyasi
    
    setState(() {
      chatList = [
        {
          "name": "Free Fire Uzbekistan 🇺🇿",
          "lastMessage": "Qanday zormi ishlar bolyaptimi",
          "time": "00:17",
          "unread": 18,
          "isChannel": false,
        },
        {
          "name": "Garandliy forum",
          "lastMessage": "сглыпа): Rasm",
          "time": "00:17",
          "unread": 1960,
          "isChannel": true,
        },
        {
          "name": "IlovachiTexnobot",
          "lastMessage": "Backed by the trusted reliability of F...",
          "time": "23:36",
          "unread": 3,
          "isChannel": false,
        },
      ];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF17212B), // Telegram quyuq mavzusi foni
      appBar: AppBar(
        backgroundColor: Color(0xFF232E3C),
        elevation: 0,
        title: Text("Telegram", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator(color: Colors.blue))
          : ListView.separated(
              itemCount: chatList.length,
              separatorBuilder: (context, index) => Divider(color: Colors.white10, height: 1),
              itemBuilder: (context, index) {
                final chat = chatList[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Text(
                      chat['name'][0],
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          chat['name'],
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        chat['time'],
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    chat['lastMessage'],
                    style: TextStyle(color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: chat['unread'] > 0
                      ? Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            "${chat['unread']}",
                            style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                          ),
                        )
                      : null,
                  onTap: () {
                    // Chat ichiga kirish ekraniga o'tish
                  },
                );
              },
            ),
    );
  }
}
