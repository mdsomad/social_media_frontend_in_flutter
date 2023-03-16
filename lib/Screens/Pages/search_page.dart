
import 'package:flutter/material.dart';



class ScarchPage extends StatefulWidget {
  const ScarchPage({Key? key}) : super(key: key);

  @override
  State<ScarchPage> createState() => _ScarchPageState();
}

class _ScarchPageState extends State<ScarchPage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: Center(child: Text("Search Page"),)
             );
  }
}