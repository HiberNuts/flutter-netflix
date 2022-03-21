// ignore: duplicate_ignore
// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:netflix/screens/Detail.dart';

class dynamicList extends StatefulWidget {
  const dynamicList({
    Key? key,
    required this.type,
    required this.text,
  }) : super(key: key);

  final String type;
  final String text;

  @override
  State<dynamicList> createState() => _dynamicListState();
}

class _dynamicListState extends State<dynamicList> {
  Future getData() async {
    final firestore = FirebaseFirestore.instance;
    QuerySnapshot snapshot = await firestore.collection(widget.type).get();
    return snapshot;
  }

  routeToDetails(DocumentSnapshot info) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Detail(info: info)));
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      key: const PageStorageKey("dynamicList"),
      child: SizedBox(
        height: 200.0,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 220.0, top: 10),
              child: Text(
                widget.text,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
            SizedBox(
              height: 160,
              child: FutureBuilder(
                future: getData(),
                builder: (ctx, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.red,
                    ));
                  }

                  final documents = snapshot.data?.docs;

                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: documents?.length,
                      itemBuilder: (ctx, index) {
                        return GestureDetector(
                          onTap: () => routeToDetails(documents[index]),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 4),
                            child: SizedBox(
                              height: 100.0,
                              width: 100.0,
                              child: Image.network(documents[index]['image']),
                            ),
                          ),
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10.0, top: 8),
//                   child: SizedBox(
//                     width: 100,
//                     child: Column(
//                       children: [
//                         SizedBox(
                          
//                           height: 150,
//                           width: 150,
//                           child: Image.network(
//                               "https://i.pinimg.com/236x/86/0c/58/860c580c9382f74257eabb4586e01f2c.jpg"),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             )