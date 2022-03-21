import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  Future getData() async {
    final firestore = FirebaseFirestore.instance;
    QuerySnapshot snapshot = await firestore.collection("posters").get();
    return snapshot;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        title: TextField(
          decoration: InputDecoration(
            filled: true,
            hintText: "Search for movie, show, genre etc.",
            hintStyle: const TextStyle(color: Colors.white),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.mic,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
            child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Popular Searches",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 500,
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
                    itemCount: documents.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 130,
                                    width: 180,
                                    child: Image.network(
                                        documents[index]['image'],
                                        alignment: Alignment.center,
                                        fit: BoxFit.cover),
                                  ),
                                  Container(
                                    child: Text(
                                      documents[index]['name'],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18.0),
                                    ),
                                  ),
                                  Icon(
                                    Icons.play_arrow,
                                    color: Colors.grey,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        )),
      ),
    );
  }
}
