// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({Key? key}) : super(key: key);

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  var conditionOn = "On";

  condition() {
    
    if (conditionOn == 'On') {
      setState(() {
        conditionOn = "Off";
      });
    } else {
      setState(() {
        conditionOn = "on";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black45,
        leading: IconButton(
          icon: const Icon(Icons.info_outline),
          onPressed: () {},
        ),
        title: Row(children: [
          const Text(
            'Smart Download',
            style: TextStyle(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: condition,
              child: Text(
                conditionOn,
                style: const TextStyle(color: Colors.blueAccent),
              ),
            ),
          ),
        ]),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              // Icons.download_for_offline_outlined,
              Icons.download_for_offline_sharp,
              size: 250,
              color: Colors.grey,
            ),
            const Text(
              "Movies and Tv shows that you \n download appear here!",
              style: TextStyle(color: Colors.white, fontSize: 19.0),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: MaterialButton(
                onPressed: () {},
                child:const Text("Find Something to download",
                    style: TextStyle(fontSize: 19.0)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
