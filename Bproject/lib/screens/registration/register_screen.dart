import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:rive_animation/screens/registration/components/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneController = TextEditingController();


  Country selectedCountry = Country(
      phoneCode: "39",
      countryCode: "IT",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "Italy",
      example: "Italy",
      displayName: "Italy",
      displayNameNoCountryCode: "IT",
      e164Key: "",
  );

  @override
  Widget build(BuildContext context) {

    phoneController.selection = TextSelection.fromPosition(
      TextPosition(
          offset: phoneController.text.length
      )
    );
    return Scaffold(
      body: SafeArea(
        child: Center(child: Padding(
         padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            children: [
                Container(
                  width: 200,
                  height: 200,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.purple.shade50
                  ),
                  child: Image.asset("assets/generics_image/image2.png"),
                ),

              const SizedBox(height: 20,),
              const Text(
                "Registrati!",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'
                ),
              ),
              const SizedBox(height: 10,),
              const Text(
                "Digita il tuo numero di cellulare",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: phoneController,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                onChanged: (value) {
                  setState(() {
                    phoneController.text = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Numero di cellulare",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.grey.shade600,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black)
                  ),
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        showCountryPicker(
                            context: context,
                        countryListTheme: const CountryListThemeData(
                           bottomSheetHeight: 550
                          ),
                        onSelect: (value){
                          setState(() {
                            selectedCountry = value;
                          });
                        });
                      },
                      child: Text("${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                  ),
                  suffixIcon: phoneController.text.length > 9
                      ? Container(
                      height: 30,
                      width: 30,
                      margin: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: const Icon(Icons.done,
                          color: Colors.white,
                          size: 20,
                      ),
                  ) : null
                ),
              ),
              const SizedBox(height: 20,),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomButton(
                    text: "Successivo",
                    onPressed: (){

                    }
                ),
              )
            ],
          ),
        )
        ),
      ),
    );
  }
}