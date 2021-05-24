import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _CatsWidgetState createState() => _CatsWidgetState();
}

class _CatsWidgetState extends State<MyApp> {
  String url = "https://cataas.com/cat/gif";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Cats Gif Generator'),
          ),
          body: Center(
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: CachedNetworkImage(
                      imageUrl: url,
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    color: Colors.blue,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          var random = new Random();
                          url = "https://cataas.com/cat/gif?random=" +
                              random.nextInt(100).toString();
                        });
                      },
                      child: Text(
                        'Generate',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
