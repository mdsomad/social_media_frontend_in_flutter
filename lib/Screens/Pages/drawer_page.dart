import 'package:application_authenticate_frontend_with_flutter/Utils/routes/routes_name.dart';
import 'package:application_authenticate_frontend_with_flutter/service/session_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../service/user_shared_preferences.dart';


class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {


  @override
  Widget build(BuildContext context) {

  final userPreferences = Provider.of<UserSharedPreferences>(context);
  
    return Drawer(
      //backgroundColor: Colors.pinkAccent[200],
      child: ListView(
        children: [
          SizedBox(height: 30,),
           ListTile(
              onTap: (){
                 userPreferences.remove().then((value){             //* <-- User Token remove call
                 SessionController().userid = '';
                 userPreferences.removeUserid();
                 Navigator.pushReplacementNamed(context, RoutesName.login);
                 
              });
               
              
              },
              leading: Icon(Icons.logout,color:Colors.blue),
              title: Text('Logout',style: TextStyle(fontSize: 18),),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
           ListTile(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.changepassword);
               
              
              },
              leading: Icon(Icons.key,color:Colors.blue),
              title: Text('Change Password',style: TextStyle(fontSize: 18),),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
        ],
      ),
      
    );
  }
}