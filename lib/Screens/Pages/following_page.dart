

import 'package:application_authenticate_frontend_with_flutter/service/session_manager.dart';
import 'package:flutter/material.dart';



class FollowingPage extends StatefulWidget {

  dynamic data;
  
 FollowingPage({Key? key,required this.data}) : super(key: key);

  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Following"),
      ),
         body: ListView.builder(
          // shrinkWrap: true,
           itemCount: widget.data["Following"].data!.user.following.length,
           itemBuilder:(context, index) {
             return Card(
               child: Padding(
                 padding: const EdgeInsets.symmetric(vertical: 15),
                 child: ListTile(
                   leading: CircleAvatar(
                    // backgroundColor: Colors.red,
                    radius:28,
                   backgroundImage: NetworkImage(widget.data["Following"].data!.user.following[index].avater.url.toString(),scale: 1.0),
                   
                   ),
                   title: Text(widget.data["Following"].data!.user.following[index].name.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                   trailing:buildStatColumn(widget.data["Following"].data!.user.following.contains(SessionController().userid) ? "UnFollow" : "hello")
                 ),
               ),
             );
         },)
    );
  }




  Widget buttonf(String value){
    return Container(
      // decoration: BoxDecoration(
      //   color: Colors.tealAccent
      // ),
      child: Center(
        child: Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              
            ),
          ),
      )
    );
  }



}






Material buildStatColumn(String value,) {
    return Material(
      color: Colors.pink,
      borderRadius: BorderRadius.circular(30),
      child: Container(
         
         height: 40, 
         width: 100,
        child: Center(
          child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
        ),
      ),
    );
    
  }


