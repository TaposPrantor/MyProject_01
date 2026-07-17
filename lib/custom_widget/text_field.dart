import 'package:flutter/material.dart';


class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.email,
    required this.hint,
    this.obscureText = false,
  });

  final TextEditingController email;
  final String hint;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: email,
        obscureText: obscureText,
        decoration: InputDecoration(
            hintText: hint,
            labelText: hint,
            prefixIcon: Icon(
              obscureText ? Icons.lock : Icons.person,
            ),
            suffixIcon: Icon(
              obscureText ? Icons.visibility_off : Icons.email,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)
            )
        ),
      ),
    );
  }
}