import 'dart:ffi';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget buildCard() => Container(
        padding: EdgeInsets.all(20),
        width: 70,
        decoration: BoxDecoration(color: Colors.red),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text(
          'PICT CANTEEN',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 85,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(width: 0.8),
                    ),
                    hintText: 'Search items',
                    hintStyle: const TextStyle(
                      fontSize: 14,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 25,
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.clear,
                        size: 25,
                      ),
                      onPressed: () {},
                    )),
              ),
            ),
          ),
          // const SizedBox(height: 10,),
          Container(
            child: const Text(
              'Categories',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                // for (int i = 0; i < 4; i++)
                Container(
                  padding: EdgeInsets.all(10),
                  height: 70,
                  width: MediaQuery.of(context).size.width / 4 - 20,
                  // Divide the screen width equally among 4 containers
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    border: Border.all(color: Colors.red, width: 2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  margin: const EdgeInsets.only(left: 5, right: 5),
                  child: const Text(
                    'Breakfast',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  height: 70,
                  width: MediaQuery.of(context).size.width / 4 - 20,
                  // Divide the screen width equally among 4 containers
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    border: Border.all(color: Colors.red, width: 2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  margin: const EdgeInsets.only(left: 5, right: 5),
                  child: const Text(
                    'Lunch',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  height: 70,
                  width: MediaQuery.of(context).size.width / 4 - 20,
                  // Divide the screen width equally among 4 containers
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    border: Border.all(color: Colors.red, width: 2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  margin: const EdgeInsets.only(left: 5, right: 5),
                  child: const Text(
                    'Snacks',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  height: 70,
                  width: MediaQuery.of(context).size.width / 4 - 20,
                  // Divide the screen width equally among 4 containers
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    border: Border.all(color: Colors.red, width: 2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  margin: const EdgeInsets.only(left: 5, right: 5),
                  child: const Text(
                    'Dinner',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: const Text(
              'Top picks for you',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              // height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 2),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.red,
          type: BottomNavigationBarType.fixed,

          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined),label: 'Check out'),
            BottomNavigationBarItem(icon: Icon(Icons.history_outlined),label: 'History')
          ]
      ),
    );
  }
}
