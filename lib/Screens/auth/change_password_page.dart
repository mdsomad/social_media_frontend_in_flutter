import 'package:application_authenticate_frontend_with_flutter/Utils/Utils.dart';
import 'package:application_authenticate_frontend_with_flutter/provider/auth_Page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';
import '../../res/components/round_button.dart';
import '../../service/user_shared_preferences.dart';


class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {

  TextEditingController OldPasswordController = TextEditingController();
  TextEditingController NewPasswordController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();

   Future<UserModel> getUsertData() => UserSharedPreferences().getUser();   //* <-- Yah hai SharedPreferences ko Function ko get karna ka tarika

  
  
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthPageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        
        title: Text("Change Password Page"),
      ),
      
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: OldPasswordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Your Old Password",
              ),
            ),
           const SizedBox(height: 15,),
            TextField(
              controller: NewPasswordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Your New Password",
              ),
            ),
           const SizedBox(height: 15,),
            TextField(
              controller: ConfirmPasswordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Your New Confirm Password",
              ),
            ),
            const SizedBox(height: 15,),

            RoundButton(

                loading:authViewModel.loading,

                title: "Change Password", onPerss:(){

                  if(OldPasswordController.text.isEmpty){
                    Utils.ftushBarErrorMessage("Please enter old password", context);    
                  }else if(NewPasswordController.text.isEmpty){
                      Utils.ftushBarErrorMessage("Please enter new password", context);
                  }else if (ConfirmPasswordController.text.isEmpty){
                    Utils.ftushBarErrorMessage("Please enter confirm password", context);
                  }else if(NewPasswordController.text != ConfirmPasswordController.text){
                     Utils.ftushBarErrorMessage("Not macth new password or confirm password", context);
                  }else{


                     Map data = {
                        "oldPassword":OldPasswordController.text.toString().trim(),
                        "newPassword":NewPasswordController.text.toString().trim(),
                    };
              
                      getUsertData().then((value){
                        print(value.token.toString());
                        authViewModel.ChangePasswordApi(value.token.toString(),data,context);
                    }); 
                    
                        
                  }
                 
                  

              }),

            
          ],
        ),
      ),
    );
  }
}