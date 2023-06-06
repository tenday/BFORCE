import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive_animation/screens/registration/components/custom_button.dart';
import 'package:rive_animation/screens/registration/register_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});



  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();

}


class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child:  Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/generics_image/image1.png",
                  height: 300,
                ),
                const SizedBox(height: 20,),
                const Text(
                  "Iniziamo con la Registrazione!",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'
                  ),
                ),
                const SizedBox(height: 10,),
                const Text(
                  "LET'S GO",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black38,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'
                  ),
                ),
                const SizedBox(height: 50,),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child : CustomButton(
                    text: "Sono pronto!",
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegisterScreen()));
                    },
                  )
                ),
                const SizedBox(height: 10,),
                SizedBox(
                    height: 50,
                    width: double.infinity,
                    child : CustomButton(
                      text: "Ci ho ripensato",
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    )
                ),
              ],
            ),
          ),
        ),
      )
    );

  }
}