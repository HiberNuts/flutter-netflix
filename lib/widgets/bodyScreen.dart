import 'package:flutter/material.dart';

import 'dynamicList.dart';

class bodyScreen extends StatelessWidget {
  const bodyScreen({
    Key? key,
    required ScrollController scrollController,
  })  : _scrollController = scrollController,
        super(key: key);

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                height: 300.0,
                width: double.infinity,
                child: Image.network(
                    "https://wallpaperaccess.com/full/790323.jpg"),
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
