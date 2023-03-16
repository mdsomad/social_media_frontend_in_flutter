import 'package:application_authenticate_frontend_with_flutter/Screens/Pages/followers_page.dart';
import 'package:application_authenticate_frontend_with_flutter/Screens/Pages/following_page.dart';
import 'package:application_authenticate_frontend_with_flutter/Screens/auth/change_password_page.dart';
import 'package:application_authenticate_frontend_with_flutter/Screens/Pages/home_page.dart';
import 'package:application_authenticate_frontend_with_flutter/Screens/auth/login_Page.dart';
import 'package:application_authenticate_frontend_with_flutter/Screens/main_page.dart';
import 'package:application_authenticate_frontend_with_flutter/Screens/auth/signup_page.dart';
import 'package:application_authenticate_frontend_with_flutter/Screens/auth/splash_page.dart';
import 'package:application_authenticate_frontend_with_flutter/Utils/routes/routes_name.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class Routes {
  
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

     case RoutesName.splash:
        return MaterialPageRoute( builder: (BuildContext context) =>SplashPage());   

      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => LoginPage());

      case RoutesName.sigUp:
        return MaterialPageRoute( builder: (BuildContext context) =>SignUpPage());  

      case RoutesName.mainpage:
        return MaterialPageRoute( builder: (BuildContext context) =>MainPage()); 

      case RoutesName.home:
        return MaterialPageRoute( builder: (BuildContext context) =>HomePage());   

    

      case RoutesName.changepassword:
        return MaterialPageRoute( builder: (BuildContext context) =>ChangePasswordPage());


      case RoutesName.followers:
        return MaterialPageRoute( builder: (BuildContext context) =>FollowerPage(data: settings.arguments as Map,));   


      case RoutesName.following:
        return MaterialPageRoute( builder: (BuildContext context) =>FollowingPage(data: settings.arguments as Map,));   

      default:
        return MaterialPageRoute(builder: (context) {
          return Center(
            child: Text("No routes defined"),
          );
        });
    }
  }
}
