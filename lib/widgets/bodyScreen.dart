import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'dynamicList.dart';

class bodyScreen extends StatefulWidget {
  const bodyScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<bodyScreen> createState() => _bodyScreenState();
}

class _bodyScreenState extends State<bodyScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> imageList = [];

    getData() async {
      final firestore = FirebaseFirestore.instance;
      var snapshot = await firestore.collection("carousel").doc("images").get();
      List<String> imageListTemp = [];
      final documents = snapshot.data();
      final data = documents?["image"];
      print(data);

      for (var value in data) {
        imageListTemp.add(value);
      }
      setState(() {
        imageList = imageListTemp;
        print(imageList.length);
        print(imageList);
      });
    }

    getData();

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CarouselSlider(
                items: [
                  //1st Image of Slider
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://wallpaperaccess.com/full/2052703.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  //2nd Image of Slider
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://wallpaperaccess.com/full/3640117.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  //3rd Image of Slider
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://wallpaperaccess.com/full/2052703.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  //4th Image of Slider
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://c4.wallpaperflare.com/wallpaper/622/739/588/stranger-things-netflix-clouds-bicycle-wallpaper-preview.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  //5th Image of Slider
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://wallpaperaccess.com/full/2387027.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],

                //Slider Container properties
                options: CarouselOptions(
                  height: 250.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 1500),
                  disableCenter: true,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    icon: const Icon(Icons.play_arrow, color: Colors.black),
                    label: const Text(
                      "Play",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.info_outline,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 9, right: 180.0),
                  child: Text(
                    "Continue watching...",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: SizedBox(
                        width: 100,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 150,
                              width: 150,
                              child: Image.network(
                                  "https://i.pinimg.com/236x/71/fb/d5/71fbd5870b87ba882126ea88c71c362f--pablo-escobar-netflix.jpg"),
                            ),
                            const LinearProgressIndicator(
                              value: 2,
                              color: Colors.red,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
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
                            const LinearProgressIndicator(
                              value: 2,
                              color: Colors.red,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: SizedBox(
                        width: 100,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 150,
                              width: 150,
                              child: Image.network(
                                  "https://i.pinimg.com/236x/94/cb/64/94cb64f0703c3645449139d51b50526d.jpg"),
                            ),
                            const LinearProgressIndicator(
                              value: 2,
                              color: Colors.red,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        const dynamicList(
          key: PageStorageKey('posters'),
          type: "posters",
          text: "BingeWorthy",
        ),
        const dynamicList(
          key: PageStorageKey('popular'),
          type: "popular",
          text: "Popular on netflix",
        ),
        const dynamicList(
          key: PageStorageKey('originals'),
          type: "originals",
          text: "Netflix Originals",
        ),
        const dynamicList(
          key: PageStorageKey('animated'),
          type: "animated",
          text: "Animated series",
        ),
      ],
    );
  }
}
