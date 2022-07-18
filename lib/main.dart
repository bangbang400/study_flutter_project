import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = [
      listItem("pikachu"),
      listItem("pikachu"),
      listItem("pikachu"),
      listItem("pikachu"),
    ];
    return MaterialApp(
      title: 'FlutterHajimeniKakuYatu',
      home: Scaffold(
        appBar: AppBar(
          title: Text('GridViewの勉強'),
        ),
        body: GridView.count(
          crossAxisCount: 2
          ,children: list,)
      ),
    );
  }

  Widget listItem(String image) {
    var assetImage = "assets/" + image + ".jpeg";
    return Container(
      child: Image.asset(assetImage, fit: BoxFit.cover,),
    );
  }
}