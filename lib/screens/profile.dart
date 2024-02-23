import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitch_clone/providers/user_provider.dart';
import 'package:twitch_clone/screens/onboarding_screen.dart';
import 'package:twitch_clone/widgets/custom_button.dart';


class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

  //retrieve username and email for user provider that from firebase
  Future<void> signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacementNamed(context, OnBoardingScreen.routeName);
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        leading: Container(
          child: Image.asset('assets/twitch-icon.png'),
          width: 12, 
          height: 12,
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/nature2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.35),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Colors.grey), 
                    borderRadius: BorderRadius.circular(
                        10), 
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 24,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Username: ${userProvider.user.username}',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Colors.grey), 
                    borderRadius: BorderRadius.circular(
                        10), 
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.email,
                        size: 24,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Email: ${userProvider.user.email}',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Container(
                        width: 50,
                        height: 50,
                        child: Image.asset('assets/instagram_icon.jpg'),
                      ),
                      onPressed: () {
                       
                      },
                    ),
                    IconButton(
                      icon: Container(
                        width: 50,
                        height: 50,
                        child: Image.asset('assets/whatsapp_icon.jpg'),
                      ),
                      onPressed: () {
                        
                      },
                    ),
                    IconButton(
                      icon: Container(
                        width: 40,
                        height: 40,
                        child: Image.asset('assets/linkedin_icon.png'),
                      ),
                      onPressed: () {
                      },
                    ),
                    IconButton(
                      icon: Container(
                        width: 50,
                        height: 50,
                        child: Image.asset('assets/google_icon.png'),
                      ),
                      onPressed: () {
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CustomButton(
                  text: 'Sign Out',
                  onTap: () => signOut(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
