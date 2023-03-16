import 'package:application_authenticate_frontend_with_flutter/Screens/Pages/home_page.dart';
import 'package:application_authenticate_frontend_with_flutter/Screens/Pages/notifications_page.dart';
import 'package:application_authenticate_frontend_with_flutter/Screens/Pages/post_page.dart';
import 'package:application_authenticate_frontend_with_flutter/Screens/Pages/profile/profil.dart';
import 'package:application_authenticate_frontend_with_flutter/Screens/Pages/profile_page.dart';
import 'package:application_authenticate_frontend_with_flutter/Screens/Pages/search_page.dart';
import 'package:application_authenticate_frontend_with_flutter/Screens/widget/customAdIcon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Utils/routes/routes_name.dart';
import '../service/user_shared_preferences.dart';



class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

   int _currentIndex = 0;
 

 static List<Widget> _widgetOptions = <Widget>[         // <-- First Create ( List ) <-- iska kaam hai Pages ko display karta hai
        HomeScreen(),
        ScarchPage(),
        ImagePostPage(),
        NotificationsPage(),
        Profil(),
        //  ProfilePage()
       


 ];
  
  
  
  @override
  Widget build(BuildContext context) {
  final textTheme = Theme.of(context).textTheme;
 final userPreferences = Provider.of<UserSharedPreferences>(context);
    return Scaffold(

   
      


      bottomNavigationBar:BottomNavigationBar(        // <-- BottomNavigationBar Using Example
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.teal[200],
        unselectedItemColor: Colors.black,
        selectedItemColor: Color(0xffFF0101),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        onTap: (val){
            setState(() {
              _currentIndex = val;
            });
        },

        items: const  [
          
            BottomNavigationBarItem(
              label: "Home",
              activeIcon: Icon(Icons.home) ,
              icon:Icon(Icons.home_outlined),
              ),

            BottomNavigationBarItem(
              label: "Search",
              activeIcon: Icon(Icons.search) ,
              icon:Icon(Icons.search_outlined),
              ),

            BottomNavigationBarItem(
            icon: customAdIcon(),        // <--Call customAdIcon class
            label: ""
            ),
              

            BottomNavigationBarItem(
              label: "Notifications",
              activeIcon: Icon(Icons.notifications) ,
              icon:Icon(Icons.notifications_outlined),
              ),

            BottomNavigationBarItem(
              label: "Profile",
              activeIcon: Icon(Icons.person),
              icon:Icon(Icons.person_outlined),
              ),


            // BottomNavigationBarItem(
            //   label: "Profile",
            //   activeIcon: Icon(Icons.person) ,
            //   icon: Icon(Icons.person_outlined)
            //   )
        ]
      ) ,
      
      
      
      
    
    body: _widgetOptions.elementAt(_currentIndex)    //* <-- Call List Widget  (Widget Name This --> _widgetOptions )
      
    );
    
  }
}