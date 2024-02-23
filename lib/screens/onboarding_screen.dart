import 'package:flutter/material.dart';
import 'package:twitch_clone/responsive/responsive.dart';
import 'package:twitch_clone/screens/login_screen.dart';
import 'package:twitch_clone/screens/signup_screen.dart';
import 'package:twitch_clone/widgets/custom_button.dart';



// First page of application
class OnBoardingScreen extends StatelessWidget {
  static const routeName = '/onboarding';

  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome to ",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 64,
                ),
                textAlign: TextAlign.start,
              ),
               const Text(
                "Twitch",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 64,
                  color: Color.fromRGBO(145, 71, 255, 1),
                ),
                
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomButton(
                    text: "Log in",
                    textStyle: TextStyle(color: Colors.white),
                    onTap: () {
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    }),
              ),
              CustomButton(
                  text: "Sign up",
                  onTap: () {
                    Navigator.pushNamed(context, SignupScreen.routeName);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
