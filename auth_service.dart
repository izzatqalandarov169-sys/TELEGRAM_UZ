import 'package:flutter/material.dart';

class AuthService {
  // 1. my.telegram.org saytidan olgan kalitlaringizni shu yerga qo'ying:
  final int apiId = 12345678; // O'zingizning API ID raqamingiz
  final String apiHash = 'YOUR_API_HASH'; // O'zingizning API Hash kodingiz

  // Telefon raqamga Telegram orqali SMS kod yuborish
  Future<bool> sendCode(String phoneNumber) async {
    try {
      print("Telegram serveriga raqam yuborilmoqda: $phoneNumber");
      
      // TDLib funksiyasi chaqiriladi:
      // setAuthenticationPhoneNumber(phoneNumber)
      
      return true; // Kod muvaffaqiyatli yuborildi
    } catch (e) {
      print("Xatolik yuz berdi: $e");
      return false;
    }
  }

  // Telegram'dan kelgan 5 xonali kodni tekshirish
  Future<bool> verifyCode(String smsCode) async {
    try {
      print("Kod tekshirilmoqda: $smsCode");
      
      // TDLib funksiyasi chaqiriladi:
      // checkAuthenticationCode(smsCode)
      
      return true; // Kod to'g'ri, tizimga kirildi!
    } catch (e) {
      print("Kod xato kiritildi: $e");
      return false;
    }
  }
}
