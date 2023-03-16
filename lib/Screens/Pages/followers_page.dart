import 'package:application_authenticate_frontend_with_flutter/service/session_manager.dart';
import 'package:flutter/material.dart';



class FollowerPage extends StatefulWidget {

  dynamic data;
  
 FollowerPage({Key? key,required this.data}) : super(key: key);

  @override
  State<FollowerPage> createState() => _FollowerPageState();
}

class _FollowerPageState extends State<FollowerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Followers"),
      ),
         body: ListView.builder(
          // shrinkWrap: true,
           itemCount: widget.data["Followers"].data!.user.followers.length,
           itemBuilder:(context, index) {
             return Card(
               child: Padding(
                 padding: const EdgeInsets.symmetric(vertical: 15),
                 child: ListTile(
                   leading: CircleAvatar(
                    // backgroundColor: Colors.red,
                    radius:28,
                   backgroundImage: NetworkImage(widget.data["Followers"].data!.user.followers[index].avater.url.toString(),scale: 1.0),
                   
                   ),
                   title: Text(widget.data["Followers"].data!.user.followers[index].name.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                   
                   trailing:InkWell(
                    onTap: (){
                      print(
                      widget.data["Followers"].data!.user.followers
                      );
                    },
                    child: buildStatColumn("${widget.data["Followers"].data!.user.followers.contains(SessionController().userid.toString())}"))
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


