import 'package:flutter/material.dart';
import '../widget/bottom_bar.dart';
import 'home_screen.dart';
import 'place_screen.dart';
import 'shop_screen.dart';

class MainScreen extends StatefulWidget {
  final String id;

  const MainScreen(this.id, {super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}


class _MainScreenState extends State<MainScreen> {

  late TabController controller;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const HomeScreen(),
            const PlaceScreen(),
            const ShopScreen(),
            Container(
              child: const Text("1"),
            ),
          ],
        ),
        bottomNavigationBar: const Bottom(),
      ),
    );
  }
}
  
  