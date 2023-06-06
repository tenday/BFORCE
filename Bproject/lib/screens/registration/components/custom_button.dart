import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({super.key, required this.text, required this.onPressed });

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
          animationDuration: const Duration(days: 5, hours: 4,seconds: 0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)
              ),
          ),
        ),
      child: Text(text , style:  const TextStyle(fontSize: 16 , fontFamily: "Poppins" , fontWeight: FontWeight.bold ,),
      )
    );

  }



}