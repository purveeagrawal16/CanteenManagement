import 'package:flutter/material.dart';

class TopPicks extends StatelessWidget {

  final String? item;
  TopPicks({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(10),
      surfaceTintColor: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(8),
                child: Image.asset(
                  'assets/images/samosa.jpg',
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.width / 3,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item!,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Available: 20 pcs.",
                      style: TextStyle(fontSize: 15, color: Colors.green),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$15',
                          style: TextStyle(fontSize: 20),
                        ),
                        Padding(
                          padding: EdgeInsets.all(6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              ),
                              SizedBox(width: 10),
                              Text("0", style: TextStyle(fontSize: 20)),
                              SizedBox(width: 10),
                              Icon(
                                Icons.add_circle,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
