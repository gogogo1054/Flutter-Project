import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:shake/shake.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  
  }

class _HomeScreenState extends State<HomeScreen> {
  
  late CollectionReference members;
  String point = "";

  // ShakeDetector detector = ShakeDetector.autoStart(
  //   onPhoneShake: () {
  //      point++;
  //   }
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }
  
  void getPoint() async {
    var documentSnapshot = await members.doc("1234").get();
    point = documentSnapshot.get('point');
  }
  
  @override
  void initState() {
    super.initState();
    members = FirebaseFirestore.instance.collection('members');
    getPoint();
  }


  _buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        _buildStats(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
              height: 300,
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 180,
                backgroundColor: Colors.orange[400],
                  child: Text(point, 
                  style: const TextStyle(fontSize: 50,color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  SliverPadding _buildStats() {
    const TextStyle stats = TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white);
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverGrid.count(
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 1.5,
        crossAxisCount: 3,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.blue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "+500",
                  style: stats,
                ),
                const SizedBox(height: 5.0),
                Text("Today".toUpperCase())
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.pink,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "30",
                  style: stats,
                ),
                const SizedBox(height: 5.0),
                Text("Distance(KM)".toUpperCase())
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.green,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "1200",
                  style: stats,
                ),
                const SizedBox(height: 5.0),
                Text("Calories".toUpperCase())
              ],
            ),
          ),
        ],
      ),
    );
  }
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      titleSpacing: 0.0,
      elevation: 0.5,
      backgroundColor: Colors.white,
      title: const Text(
        "HOME",
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
        textAlign: TextAlign.center,
      ),
    );
  }

}