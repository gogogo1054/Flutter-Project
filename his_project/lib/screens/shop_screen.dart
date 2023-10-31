import 'package:flutter/material.dart';

import '../res/animation1.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreen();
  
  }

class _ShopScreen extends State<ShopScreen> {

  int count = 0;
  int price = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SHOP'),
        ),
        body: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, int index) {
                  return cartItems(index);
                },
              ),
            ),
            
            // _checkoutSection()
          ],
        ));
  }

  Widget cartItems(int index) {

    return Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(1),
      height: 140,
      child: Row(
        children: <Widget>[
          Container(
            width: 130,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(images[1]),
              fit: BoxFit.cover,
            )),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          "Item $index",
                          overflow: TextOverflow.fade,
                          softWrap: true,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15),
                        ),
                      ),
                      // SizedBox(
                      //   width: 50,
                      //   child: IconButton(
                      //     onPressed: () {
                      //       print("Button Pressed");
                      //     },
                      //     color: Colors.red,
                      //     icon: const Icon(Icons.delete),
                      //     iconSize: 20,
                      //   ),
                      // )
                    ],
                  ),
                  const Row(
                    children: <Widget>[
                      Text("Price: "),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '\$200',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Text("Total: "),
                      const SizedBox(
                        width: 5,
                      ),
                      Text('\$$price',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Colors.orange,
                          ))
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Text(
                        "Ships Free",
                        style: TextStyle(color: Colors.orange),
                      ),
                      const Spacer(),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {
                                minus();
                              });
                            },
                            splashColor: Colors.redAccent.shade200,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              alignment: Alignment.center,
                              child: const Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.redAccent,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text('$count'),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                add();
                              });
                            },
                            splashColor: Colors.lightBlue,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              alignment: Alignment.center,
                              child: const Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.green,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // Widget _checkoutSection() {
  //   return Material(
  //     color: Colors.black12,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         const Padding(
  //             padding: EdgeInsets.only(top: 10, left: 10, right: 10),
  //             child: Row(
  //               children: <Widget>[
  //                 Text(
  //                   "Checkout Price:",
  //                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
  //                 ),
  //                 Spacer(),
  //                 Text(
  //                   "Rs. 5000",
  //                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
  //                 )
  //               ],
  //             )),
  //         Padding(
  //           padding: const EdgeInsets.all(10.0),
  //           child: Material(
  //             color: Colors.red,
  //             elevation: 1.0,
  //             child: InkWell(
  //               splashColor: Colors.redAccent,
  //               onTap: () {},
  //               child: const SizedBox(
  //                 width: double.infinity,
  //                 child: Padding(
  //                   padding: EdgeInsets.all(10.0),
  //                   child: Text(
  //                     "Checkout",
  //                     textAlign: TextAlign.center,
  //                     style: TextStyle(
  //                         color: Colors.white,
  //                         fontSize: 18,
  //                         fontWeight: FontWeight.w700),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  void add() {
    count++;
    price = 200;
    price = price*count;
  }
  void minus() {
    count--;
    price = 200;
    price = price*count;
  }
}

