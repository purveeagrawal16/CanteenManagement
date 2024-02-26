import 'package:flutter/material.dart';

class ProductInfo extends StatefulWidget {
  final String name;
  final Image image;
  final int amount;
  const ProductInfo(
      {super.key,
      required this.name,
      required this.image,
      required this.amount});

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  @override
  Widget build(BuildContext context) {
    int itemcount = 0;

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.grey.shade50, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                // color: const Color(0xFFF5F6F9),
              ),
              // padding: const EdgeInsets.all(10),
              child: widget.image,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                // const Text(
                //   'Description',
                //   style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: widget.amount.toString(),
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 30,
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         width: ,
                    //         height: 30,
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(12),
                    //             color: Colors.red),
                    //         child: IconButton(
                    //           onPressed: () {
                    //             setState(() {
                    //               itemcount--;
                    //             });
                    //           },
                    //           icon: const Icon(Icons.remove),
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.only(top: 8),
                    //         child: Text(
                    //           itemcount.toString(),
                    //           style: const TextStyle(
                    //             color: Colors.black,
                    //           ),
                    //         ),
                    //       ),
                    //       IconButton(
                    //         onPressed: () {
                    //           setState(() {
                    //             itemcount++;
                    //           });
                    //         },
                    //         icon: const Icon(Icons.add),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Container(
                      // width: 20,
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.red),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 8,
                          ),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  itemcount--;
                                });
                              },
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 16,
                              )),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            // margin: const EdgeInsets.symmetric(horizontal: 3),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Colors.white),
                            child: Text(
                              itemcount.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  itemcount--;
                                });
                              },
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 16,
                              )),
                          const SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
