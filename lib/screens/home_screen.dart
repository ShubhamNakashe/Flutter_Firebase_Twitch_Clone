import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitch_clone/screens/browse.dart';
import 'package:twitch_clone/screens/feed_screen.dart';
import 'package:twitch_clone/screens/go_live_screen.dart';
import 'package:twitch_clone/screens/login_screen.dart';
import 'package:twitch_clone/screens/onboarding_screen.dart';
import 'package:twitch_clone/screens/profile.dart';
import 'package:twitch_clone/utils/colors.dart';
import 'package:twitch_clone/widgets/custom_button.dart';


// Home screen code
class HomeScreen extends StatefulWidget {
  static String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  int _page = 0;
  List<Widget> pages = [];


// Navigation on homepage
  @override
  void initState() {
    super.initState();
    pages = [
      browse(),
      const GoLiveScreen(),
      const FeedScreen(),
      ProfileScreen(),
      
    ];
  }

  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: buttonColor,
        unselectedItemColor: primaryColor,
        backgroundColor: backgroundColor,
        onTap: onPageChanged,
        currentIndex: _page,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_rounded),
            label: 'Go Live',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.copy),
            label: 'Live Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'User',
          ),
        ],
      ),
      body: pages[_page],
    );
  }
}
