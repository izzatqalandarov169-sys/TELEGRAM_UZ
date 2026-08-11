import 'package:flutter/material.dart';

class AuthService {
  // Telegram API kalitlaringiz joylashtirildi:
  final int apiId = 37349381;
  final String apiHash = 'b98c62f5d7f406bea15614613e4a3e41';

  // Telegram serveriga SMS kod yuborish
  Future<bool> sendCode(String phoneNumber) async {
    try {
      print("Telegram serveriga so'rov yuborilmoqda...");
      print("API ID: $apiId");
      print("Telefon: $phoneNumber");

      // TDLib funksiyasi orqali Telegram serveriga ulanish:
      // await TelegramClient.sendCode(phoneNumber, apiId: apiId, apiHash: apiHash);

      await Future.delayed(Duration(seconds: 1)); // Yuklanish simulyatsiyasi
      return true;
    } catch (e) {
      print("SMS kod yuborishda xatolik: $e");
      return false;
    }
  }

  // Telegram'dan kelgan 5 xonali kodni tekshirish
  Future<bool> verifyCode(String smsCode) async {
    try {
      print("Kod tekshirilmoqda: $smsCode");

      // TDLib funksiyasi orqali kodni tasdiqlash:
      // await TelegramClient.checkCode(smsCode);

      await Future.delayed(Duration(seconds: 1)); // Yuklanish simulyatsiyasi
      return true;
    } catch (e) {
      print("Kod tasdiqlashda xatolik: $e");
      return false;
    }
  }
}
