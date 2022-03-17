import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class dynamicList extends StatefulWidget {
  const dynamicList({
    Key? key,
  }) : super(key: key);

  @override
  State<dynamicList> createState() => _dynamicListState();
}

class _dynamicListState extends State<dynamicList> {
  
  
  // Future getData() {
  //   final firestore = FirebaseFirestore.instance;
  //   QuerySnapshot snapshot=firestore.collection(collectionPath)
  // }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200.0,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 220.0, top: 10),
              child: Text(
                "Popular on netflix",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
            // SizedBox(
            //   height: 170,
            //   child: FutureBuilder(),
            // ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 8),
                  child: SizedBox(
                    width: 100,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 150,
                          width: 150,
                          child: Image.network(
                              "https://i.pinimg.com/236x/86/0c/58/860c580c9382f74257eabb4586e01f2c.jpg"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
