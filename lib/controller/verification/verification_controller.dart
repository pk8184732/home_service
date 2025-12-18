
import 'package:flutter/cupertino.dart';

class VerificationController {
  String email = 'Loisbecket@gmail.com';
  List<String> otpDigits = ['', '', '', ''];

  void setOtpDigit(int index, String value) {
    if (index >= 0 && index < 4) {
      otpDigits[index] = value;
    }
  }

  void submit(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/home');
  }
}

