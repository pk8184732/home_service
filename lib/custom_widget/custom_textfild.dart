import 'package:flutter/material.dart';


class Label extends StatelessWidget {
  final String text;
  const Label(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF666666),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class TextFields extends StatelessWidget {
  final String hint;
  final bool obscure;
  final Widget? suffixIcon;

  const TextFields({
    required this.hint,
    this.obscure = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE8E8E8),
          width: 1,
        ),
      ),
      child: TextField(
        obscureText: obscure,
        style: const TextStyle(
          color: Color(0xFF0E0000),
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: const Color(0xFF0E0000).withOpacity(0.5),
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSmall;

  const Button({
    required this.text,
    required this.onPressed,
    required this.isSmall,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF164C9F),
          padding: EdgeInsets.symmetric(vertical: isSmall ? 14 : 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: isSmall ? 16 : 17,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.3,
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String text;
  final bool isGoogle;
  final bool isSmall;

  const SocialButton({
    required this.text,
    required this.isGoogle,
    required this.isSmall,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: isSmall ? 12 : 13),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: const BorderSide(
            color: Color(0xFFE0E0E0),
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              isGoogle ? "assets/images/google_logo.png" : "assets/images/facebook_logo.png",
              height: 22,
              width: 22,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  isGoogle ? Icons.g_mobiledata : Icons.facebook,
                  size: 22,
                  color: isGoogle ? Colors.blue : Colors.blue[900],
                );
              },
            ),
            const SizedBox(width: 12),
            Text(
              text,
              style: TextStyle(
                color: const Color(0xFF0E0000),
                fontSize: isSmall ? 15 : 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}