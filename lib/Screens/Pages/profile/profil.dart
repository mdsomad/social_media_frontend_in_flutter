import 'dart:convert';

import 'package:application_authenticate_frontend_with_flutter/Screens/Pages/profile/only_logged_user_posts.page.dart';
import 'package:application_authenticate_frontend_with_flutter/Utils/routes/routes_name.dart';
import 'package:application_authenticate_frontend_with_flutter/data/response/status.dart';
import 'package:application_authenticate_frontend_with_flutter/models/my_profile_models.dart';
import 'package:application_authenticate_frontend_with_flutter/provider/profile_page_provider.dart';
import 'package:application_authenticate_frontend_with_flutter/res/app_url.dart';
import 'package:application_authenticate_frontend_with_flutter/service/session_manager.dart';
import 'package:application_authenticate_frontend_with_flutter/service/user_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../../models/user_model.dart';

class Profil extends StatefulWidget {

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
 

 
  Future<UserModel> getUsertToken() => UserSharedPreferences().getUser(); 

  ProfilePageProvider getUserProvider = ProfilePageProvider();  //TODO Create object HomeViewViewModel with Provider Class
  

  @override
  void initState() {
    // TODO: implement initState
    
       getUsertToken().then((value){
          print(value.token.toString());
            getUserProvider.getuserdataApi(value.token.toString());
        }); 
   
    super.initState();
  }




var data;
  Future<void> getUserAli (String Token)async{

    final response = await http.get(
       Uri.parse(AppUrl.localhostGetUser),
        headers: {
        // 'Content-Type': 'application/json',
        "Accept": "application/json",
        'Authorization': 'Bearer $Token',
    }
    );

    if(response.statusCode == 20){
      data = jsonDecode(response.body.toString());
    }else{
       print("Error");
    }
    
  }
  
  
  
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 35),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // GestureDetector(
                //     onTap: () {
                //       Navigator.of(context).pop();
                //     },
                //     child: Icon(Icons.arrow_back_ios)),
                Icon(Icons.more_vert),
              ],
            ),
          ),




 ChangeNotifierProvider<ProfilePageProvider>(create: (context) => getUserProvider,
      child: Consumer<ProfilePageProvider>(builder: (context, value, child) {

      return  
        Expanded(
          child: StreamBuilder<MyProfileModel>(
             
              stream:value.getResponse,
             
              builder: (BuildContext context, AsyncSnapshot<MyProfileModel> snapshot,) {
             
                if (snapshot.connectionState == ConnectionState.waiting) {     //* <-- condition star
             
                  return Center(child: CircularProgressIndicator());
             
                } else if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done) {
             
             
                  if (snapshot.hasError) {    //* <-- Mine condition star
             
                    return const Text('Error');
             
                  } else if (snapshot.hasData) {
             
              return Column(

              children: [
                Text("${snapshot.data!.user.following.contains(SessionController().userid)}"),
                    Hero(
              tag: "https://images.pexels.com/photos/994605/pexels-photo-994605.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=200&w=1260",
                        child: Container(
                margin: EdgeInsets.only(top: 35),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
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
                      
                       snapshot.data!.user.avater.url.toString()
                      ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10,),
                Text(
                  snapshot.data!.user.name.toString(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 3,),
               snapshot.data!.user.userverify == 1 ?
                Icon(Icons.verified_user,size: 18,color: Color(0xff0C9C28),):SizedBox()
              ],
            ),
            Text(
              "London, England",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[400],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildStatColumn( snapshot.data!.user.posts.length.toString(), "Photos"),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, RoutesName.followers,arguments: {
                      // "Followers":value.getuserData.data!.user.posts.length,
                      "Followers": snapshot,
                      "FollowersName": snapshot.data!.user.followers[0].avater.url
                    });
                  },
                  child: buildStatColumn( snapshot.data!.user.followers.length.toString(), "Followers")),
        
                InkWell(
                  onTap: (){
                    print( snapshot.data!.user.followers);
                     Navigator.pushNamed(context, RoutesName.following,arguments: {
                      // "Followers":value.getuserData.data!.user.posts.length,
                      "Following": snapshot,
                      "FollowersName": snapshot.data!.user.followers[0].avater.url
                    });
                  },
                  child: buildStatColumn( snapshot.data!.user.following.length.toString(), "Following")),
              ],
            ),
        
        
            
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),   //* <-- Yah app ka Scrollable off karta hai
               
                  shrinkWrap: true,                         //* <-- Yah shrinkWrap true karne se content Ka hisab se space-occupying karta hai   (matlab Jitna content hai utna hi Jagah Lega)
               
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2
                  ), 
                  
                  itemCount:  snapshot.data!.user.posts.length,
                  itemBuilder:(context, index) {
                       
                   return InkWell(
                    onTap: (){
                         Navigator.push(context,MaterialPageRoute(builder:((context) => UserPostsPage())));

                    },
                     child: Container(
                                     margin: EdgeInsets.only(left: 8, right: 8, top: 8),
                                     decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.15),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25))),
                                     child: buildPictureCard( snapshot.data!.user.posts[index].image.url),
                                  
                                   ),
                   );
                       
                       
                  },
                       
               
               
                  ),
             
             
             
             
             
             
             
             
             
             
          
        
        
        
        
        
        
        
              ],
             );
        
                  } else {
                    return const Text('Empty data');
                  }                                      //* <-- mine condition End
             
             
             
             
                } else {
                  return Center(child: Text('State: ${snapshot.connectionState}'));
                }                                                 //* <-- condition End     
             
             
              },
        
        
        
              
             
             
            ),
        );
        
        
        
        
        
         

        
       
           
           
           
           
           
           
           
           
           
           
          

          // Expanded(
          //   child: Container(
          //     margin: EdgeInsets.only(left: 8, right: 8, top: 8),
          //     decoration: BoxDecoration(
          //         color: Colors.grey.withOpacity(0.15),
          //         borderRadius:
          //             BorderRadius.vertical(top: Radius.circular(25))),
          //     child: GridView.count(
          //       padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          //       crossAxisCount: 2,
          //       crossAxisSpacing: 5,
          //       mainAxisSpacing: 5,
          //       childAspectRatio: 5 / 6,
          //       children: [
          //         buildPictureCard(""),
                
          //       ],
          //     ),
          //   ),
          // )

        

      },),


      ),















          
          // Hero(
          //   tag: "https://images.pexels.com/photos/994605/pexels-photo-994605.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=200&w=1260",
          //             child: Container(
          //     margin: EdgeInsets.only(top: 35),
          //     height: 80,
          //     width: 80,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(40),
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.black.withOpacity(0.2),
          //           spreadRadius: 5,
          //           blurRadius: 20,
          //         )
          //       ],
          //       image: DecorationImage(
          //         fit: BoxFit.cover,
          //         image: NetworkImage(
          //           "https://images.pexels.com/photos/994605/pexels-photo-994605.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=200&w=1260"),
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     SizedBox(width: 10,),
          //     Text(
          //       "Tom Smith",
          //       style: TextStyle(
          //         fontSize: 18,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //     SizedBox(width: 3,),
          //     Icon(Icons.verified_user,size: 18,color: Color(0xff0C9C28),)
          //   ],
          // ),
          // Text(
          //   "London, England",
          //   style: TextStyle(
          //     fontWeight: FontWeight.bold,
          //     color: Colors.grey[400],
          //   ),
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     buildStatColumn("53", "Photos"),
          //     buildStatColumn("223k", "Followers"),
          //     buildStatColumn("117", "Following"),
          //   ],
          // ),


          // Expanded(
          //   child: Container(
          //     margin: EdgeInsets.only(left: 8, right: 8, top: 8),
          //     decoration: BoxDecoration(
          //         color: Colors.grey.withOpacity(0.15),
          //         borderRadius:
          //             BorderRadius.vertical(top: Radius.circular(25))),
          //     child: GridView.count(
          //       padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          //       crossAxisCount: 2,
          //       crossAxisSpacing: 5,
          //       mainAxisSpacing: 5,
          //       childAspectRatio: 5 / 6,
          //       children: [
          //         buildPictureCard(
          //             "https://images.pexels.com/photos/994605/pexels-photo-994605.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=200&w=1260"),
          //         buildPictureCard(
          //             "https://images.pexels.com/photos/132037/pexels-photo-132037.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=200&w=1260"),
          //         buildPictureCard(
          //             "https://images.pexels.com/photos/733475/pexels-photo-733475.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=200&w=1260"),
          //         buildPictureCard(
          //             "https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=200&w=1260"),
          //         buildPictureCard(
          //             "https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=200&w=1260"),
          //         buildPictureCard(
          //             "https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=200&w=1260"),
          //       ],
          //     ),
          //   ),
          // )





        ],
      ),

    );
  }






  Card buildPictureCard(String url) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(url),
            )),
      ),
    );
  }




  Column buildStatColumn(String value, String title) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}


