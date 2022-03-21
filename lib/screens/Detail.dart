import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:netflix/screens/home_screen.dart';
import 'package:netflix/widgets/Video.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key, required this.info}) : super(key: key);

  final DocumentSnapshot info;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => random());
  }

  var randomNumber = 97;
  var randomYear = 2012;

  random() {
    var rng = Random();
    int max = 99;
    int min = 80;
    randomNumber = min + rng.nextInt(max - min);
    randomNumber.toString();

    var year = Random();
    int maxx = 2022;
    int minn = 2010;
    randomYear = minn + rng.nextInt(maxx - minn);
    randomYear.toString();
  }

  @override
  Widget build(BuildContext context) {
    final info = widget.info;

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      image: NetworkImage(info['image']),
                      fit: BoxFit.cover,
                      colorFilter: const ColorFilter.mode(
                        Colors.black87,
                        BlendMode.darken,
                      )),
                ),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 13.0),
                    child: SizedBox(
                      height: 280.0,
                      width: 350.0,
                      child: Image.network(info['image']),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '$randomNumber % match',
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          randomYear.toString(),
                          style: TextStyle(color: Colors.green.shade500),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3)),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "16+",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const Text(
                          "3 seasons",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 35.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      // ignore: deprecated_member_use
                      child: FlatButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const VideoPlayer(
                                      videoData:
                                          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
                                      // "https://v.traileraddict.com/127213.mp4",
                                    )),
                          );
                        },
                        icon: const Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                        ),
                        label: const Text("Play"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 35.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      // ignore: deprecated_member_use
                      child: FlatButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.download,
                          color: Colors.white,
                        ),
                        label: const Text(
                          "Download",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(info['desc'],
                        style: const TextStyle(
                          color: Colors.white,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                          onPressed: () {},
                          child: Column(
                            children: const [
                              Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              Text(
                                "My List",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          child: Column(
                            children: const [
                              Icon(
                                Icons.thumb_up_alt_rounded,
                                color: Colors.white,
                              ),
                              Text(
                                "Rate",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          child: Column(
                            children: const [
                              Icon(
                                Icons.share,
                                color: Colors.white,
                              ),
                              Text(
                                "share",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ),
            expandedHeight: 600.0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
            ),
          )
        ],
      ),
    );
  }
}
