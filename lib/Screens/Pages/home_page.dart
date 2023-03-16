import 'dart:async';

import 'package:application_authenticate_frontend_with_flutter/Screens/Pages/full_screen_show_image.dart';
import 'package:application_authenticate_frontend_with_flutter/data/response/status.dart';
import 'package:application_authenticate_frontend_with_flutter/models/post_model.dart';
import 'package:application_authenticate_frontend_with_flutter/models/user_model.dart';
import 'package:application_authenticate_frontend_with_flutter/provider/post_page_provider.dart';
import 'package:application_authenticate_frontend_with_flutter/service/session_manager.dart';
import 'package:application_authenticate_frontend_with_flutter/service/user_shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'drawer_page.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

Future<UserModel> getUsertToken() => UserSharedPreferences().getUser(); 
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    appBar: AppBar(
        title: Text("Home Page")
      ), 
      

       drawer: DrawerPage(),
      
      
      body: Container(
        height: 550,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[500],
         child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          SizedBox(height: 15,),
          ListTile(
            leading: CircleAvatar(backgroundColor: Colors.green,radius: 35,),
            title: Text("Name"),trailing: Icon(Icons.more_vert),),
            SizedBox(height: 15,),
            
            Container(
              height: 400,
              width:  400,
          
            decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 20,
                  )
                ],

                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://images.pexels.com/photos/994605/pexels-photo-994605.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=200&w=1260"),
                ),
            ),
            )
         ],),
      )
      
      );
  }
}











class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  


    Future<UserModel> getUsertToken() => UserSharedPreferences().getUser(); 
    Future<UserModel> getUsertId() => UserSharedPreferences().getUserId(); 
    PostsPageProvider postpageprovider = PostsPageProvider();  //TODO Create object HomeViewViewModel with Provider Class

  
  
 
@override
  void initState() {
    // TODO: implement initState
    postpageprovider.getpostdataApi();
    
    getUsertId().then((value){
        SessionController().userid = value.userid.toString();
    });

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
        title: Text("Home Page")
      ), 
      

       drawer: DrawerPage(),
      
      
      body:
      ChangeNotifierProvider<PostsPageProvider>(create: (context) => postpageprovider,
      child:
       Consumer<PostsPageProvider>(builder:(context, providerValue, child) {

     return StreamBuilder<PostModel>(
     
            stream: postpageprovider.getResponse,
     
            builder: (BuildContext context, AsyncSnapshot<PostModel> snapshot,) {
     
              if (snapshot.connectionState == ConnectionState.waiting) {     //* <-- condition star
     
                return Center(child: CircularProgressIndicator());
     
              } else if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done) {
     
     
                if (snapshot.hasError) {    //* <-- Mine condition star
     
                  return const Text('Error');
     
                } else if (snapshot.hasData) {
     
                  return ListView.builder(
                   // reverse: true,
                    itemCount: snapshot.data!.post.length,
                    itemBuilder:(context, index) {
                      return buildPostSection(
                       snapshot.data!.post[index].owner.name,
                       snapshot.data!.post[index].caption,
                       snapshot.data!.post[index].image.url,
                       snapshot.data!.post[index].owner.avater.url,
                       snapshot.data!.post[index].owner.userverify == 1,

                       snapshot.data!.post[index].likes.length.toString(),
                      
                     
                      
                       (){
                          getUsertToken().then((value) {
                              postpageprovider.likePostAndDislikeApi(snapshot.data!.post[index].id.toString(),value.token.toString(),context);
                          },);
                       },

                        snapshot.data!.post[index].likes.contains(SessionController().userid.toString()),
                        
                       (){
                           BottomSheet(snapshot,index);
                       },
                       

                       
                       );



                  },);

                } else {
                  return const Text('Empty data');
                }                                      //* <-- mine condition End
     
     
     
     
              } else {
                return Center(child: Text('State: ${snapshot.connectionState}'));
              }                                                 //* <-- condition End     
     
     
            },



            
     
     
          );




           

      //   return Container(
      //   padding: EdgeInsets.only(left: 10, right: 10, top: 45),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text(
      //         "Stories",
      //         style: TextStyle(
      //             fontSize: 18,
      //             fontWeight: FontWeight.bold,
      //             color: Colors.grey[500]),
      //       ),
      //       Container(
      //         margin: EdgeInsets.only(top: 8, bottom: 12),
      //         height: 60,
      //         child: ListView(
      //           scrollDirection: Axis.horizontal,
      //           children: [
      //             Stack(
      //               children: [
      //                 CircleAvatar(
      //                   radius: 30,
      //                   backgroundImage: NetworkImage(
      //                       "https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=100&w=640"),
      //                 ),
      //                 Positioned(
      //                   bottom: 0,
      //                   right: 0,
      //                   child: CircleAvatar(
      //                     radius: 10,
      //                     child: Icon(
      //                       Icons.add,
      //                       size: 15,
      //                     ),
      //                   ),
      //                 )
      //               ],
      //             ),
      //             buildStoryAvatar(
      //                 "https://images.pexels.com/photos/2169434/pexels-photo-2169434.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=100&w=640"),
      //             buildStoryAvatar(
      //                 "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=100&w=640"),
      //             buildStoryAvatar(
      //                 "https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=100&w=640"),
      //             buildStoryAvatar(
      //                 "https://images.pexels.com/photos/2092474/pexels-photo-2092474.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=100&w=640"),
      //             buildStoryAvatar(
      //                 "https://images.pexels.com/photos/1239291/pexels-photo-1239291.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=100&w=640"),
      //           ],
      //         ),
      //       ),
      //       Container(
      //         height: 2,
      //         color: Colors.grey[300],
      //         margin: EdgeInsets.symmetric(horizontal: 30),
      //       ),
             


        
             
             
             
             
             
      //       Expanded(
      //         child: 
              
              
              
              
              
      //         ListView(
      //           padding: EdgeInsets.only(top: 8),
      //           children: [
      //             buildPostSection(
      //                 "https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=200&w=640",
      //                 "https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=100&w=940","20"),
      //             buildPostSection(
      //                 "https://images.pexels.com/photos/206359/pexels-photo-206359.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=200&w=940",
      //                 "https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=100&w=640","20"),
      //             buildPostSection(
      //                 "https://images.pexels.com/photos/1212600/pexels-photo-1212600.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=200&w=1260",
      //                 "https://images.pexels.com/photos/1239291/pexels-photo-1239291.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=100&w=640","20"),
      //             buildPostSection(
      //                 "https://images.pexels.com/photos/7500307/pexels-photo-7500307.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
      //                 "https://images.pexels.com/photos/1239291/pexels-photo-1239291.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=100&w=640","20"),
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // );









         
         
      },)
      
      
      
      
      
      
      
      
      
  
      
    ));
  }









BottomSheet(dynamic commentdata,dynamic index1) {  //* <-- showModalBottomSheet 2 Method
   return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: ((context) => Container(
              height: 600,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Column(
                  children: [
                    Text("Header"),
                    ListView.builder(
                      itemCount: commentdata.data!.post[index1].comments.length,
                      shrinkWrap: true,
                      itemBuilder:(context, index) {
                        return 
                        ListTile(title: Text(commentdata.data!.post[index1].comments[index].comment));                        
                      },
                      
                      )
                    // buildPostFirstRow(UserName,caption,urlProfilePhoto),
                  ],
                ),
              ),
            )));
  }






















  Container buildPostSection(String UserName,String caption,String urlPost, String urlProfilePhoto,bool userverify,String likes,VoidCallback onPreass,bool likecolor,VoidCallback commentonPress,) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          buildPostFirstRow(UserName,caption,urlProfilePhoto,userverify),


          SizedBox(
            height: 10,
          ),


          GestureDetector(
          onLongPress: () {
            print("Lond press");
          },
            
            child: buildPostPicture(urlPost,onPreass,likecolor)),


          SizedBox(
            height: 10,
          ),



          Row(
            children: [
              Text(
                "$likes likes",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800]),
              ),
               SizedBox(width: 15,),

              GestureDetector(
                onTap: commentonPress,
                child: FaIcon(FontAwesomeIcons.comment, size: 25,color: Colors.black,)),
           
              
            ],
          ),


          SizedBox(
            height: 10,
          ),


        ],
      ),
    );
  }







  Row buildPostFirstRow(String UserName ,String caption, String urlProfilePhoto,bool userverify,) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                print("Ckick profile");
                // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ProfilPage( url: urlProfilePhoto)));
              },
                child: Hero(
                tag: urlProfilePhoto,
                            child: CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(urlProfilePhoto),
                ),
              ),
            ),


            SizedBox(
              width: 10,
            ),


            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                     UserName,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                SizedBox(width: 5),
                userverify ? Icon(Icons.verified_user,size: 18,color: Color(0xff0C9C28),):SizedBox()

                    
                    
                  ],
                ),


                Text(
                  caption,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500]),
                ),


              ],
            ),
          ],
        ),


        Icon(Icons.more_vert)


      ],
    );
  }







  Stack buildPostPicture(String urlPost,VoidCallback onPreass,bool likecolor) {
     print(likecolor);
    return Stack(
      children: [
        Hero(
          tag: new Text(urlPost),
          child: GestureDetector(
            onLongPress: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => FullScreenShowImage(urlPost: urlPost)));
            },
            child: Container(
              height: MediaQuery.of(context).size.width 
               // - 70
              ,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(urlPost),
                  )),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: InkWell(
            onTap:onPreass,

            child: Icon(Icons.favorite,size: 35, color: likecolor ? Color.fromARGB(255, 255, 1, 1).withOpacity(0.7): Colors.white.withOpacity(0.7)),
          ),
        )
      ],
    );
  }







  Container buildStoryAvatar(String url) {
    return Container(
      margin: EdgeInsets.only(left: 18),
      height: 60,
      width: 60,
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.red),
      child: CircleAvatar(
        radius: 18,
        backgroundImage: NetworkImage(url),
      ),
    );
  }
}







 

