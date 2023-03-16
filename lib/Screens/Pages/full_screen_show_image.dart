import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FullScreenShowImage extends StatefulWidget {
  final String urlPost;
  
  const FullScreenShowImage({Key? key,required this.urlPost}) : super(key: key);

  @override
  State<FullScreenShowImage> createState() => _FullScreenShowImageState();
}

class _FullScreenShowImageState extends State<FullScreenShowImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Hero(
          tag: new Text(widget.urlPost),
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
             
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(widget.urlPost),
                  )),
            ),
        ),
      ),
    );
  }
}