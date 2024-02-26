import 'dart:ffi';
import 'package:canteen/breakfast/snacks.dart';
import 'package:canteen/home/categories.dart';
import 'package:canteen/home/top_picks.dart';
import 'package:flutter/material.dart';
import '../breakfast/breakfast.dart';
import '../check_out/cart_screen.dart';
import 'package:canteen/breakfast/foodtile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final List<String> l1 = ["Poha", "Sandwich", "Wadapav", "Bread pattis"];
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
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 70,
                      width: MediaQuery.of(context).size.width / 2 - 30,
                      // Divide the screen width equally among 4 containers
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        border: Border.all(color: Colors.red, width: 2),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      margin: const EdgeInsets.only(left: 5, right: 5),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Bfastpage();
                          }));
                        },
                        child: const Text(
                          'Breakfast',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 70,
                      width: MediaQuery.of(context).size.width / 2 - 30,
                      // Divide the screen width equally among 4 containers
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        border: Border.all(color: Colors.red, width: 2),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      margin: const EdgeInsets.only(left: 5, right: 5),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Bfastpage();
                          }));
                        },
                        child: const Text(
                          'Snacks',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 70,
                      width: MediaQuery.of(context).size.width / 2 - 30,
                      // Divide the screen width equally among 4 containers
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        border: Border.all(color: Colors.red, width: 2),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      margin: const EdgeInsets.only(left: 5, right: 5),
                      child: TextButton(
                        onPressed: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return Bfastpage();
                          // }));
                        },
                        child: const Text(
                          'lunch',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 70,
                      width: MediaQuery.of(context).size.width / 2 - 30,
                      // Divide the screen width equally among 4 containers
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        border: Border.all(color: Colors.red, width: 2),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      margin: const EdgeInsets.only(left: 5, right: 5),
                      child: TextButton(
                        onPressed: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return Bfastpage();
                          // }));
                        },
                        child: const Text(
                          'dinner',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
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

          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: l1.length,
                itemBuilder: (context, index) {
                  return Foodtile(item: l1[index]);
                }),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.home_outlined),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CartScreen();
                }));
              },
              icon: Icon(Icons.shopping_cart_outlined),
            ),
            label: 'Check out',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                // Handle onPressed for the History icon
              },
              icon: Icon(Icons.history_outlined),
            ),
            label: 'History',
          ),
        ],
      ),
    );
  }
}
