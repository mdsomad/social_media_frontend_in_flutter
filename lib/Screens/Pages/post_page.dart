
import 'package:flutter/material.dart';


class ImagePostPage extends StatefulWidget {
  const ImagePostPage({Key? key}) : super(key: key);

  @override
  State<ImagePostPage> createState() => NImagePostPageState();
}

class NImagePostPageState extends State<ImagePostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Image Post Page"),
      ),
    );
  }
}