import 'package:application_authenticate_frontend_with_flutter/provider/auth_Page_provider.dart';
import 'package:application_authenticate_frontend_with_flutter/provider/post_page_provider.dart';
import 'package:application_authenticate_frontend_with_flutter/provider/profile_page_provider.dart';
import 'package:application_authenticate_frontend_with_flutter/service/user_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Utils/routes/routes.dart';
import 'Utils/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:[
       ChangeNotifierProvider(create:(context) => AuthPageProvider(),),
       ChangeNotifierProvider(create:(context) => UserSharedPreferences(),),
      //  ChangeNotifierProvider(create:(context) => PostsPageProvider(),),
     
    ],
     child: MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
     
        primarySwatch: Colors.blue,
      ),
      // home: HomePage(),
     initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoute,

    ),
    );
  }
}


