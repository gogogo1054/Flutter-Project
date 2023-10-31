// lib/widget/bottom_bar.dart
import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  const Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: const SizedBox(
        height: 100,
        child: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          indicatorColor: Colors.transparent,
          tabs: <Widget>[
            Tab(
              icon: Icon(
                Icons.run_circle_outlined ,
                size: 40,
              ),
              child: Text(
                'POINTWALK',
                style: TextStyle(fontSize: 12),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.location_on,
                size: 40,
              ),
              child: Text(
                'PLACE',
                style: TextStyle(fontSize: 13),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.shopping_bag_outlined ,
                size: 40,
              ),
              child: Text(
                'SHOP',
                style: TextStyle(fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}