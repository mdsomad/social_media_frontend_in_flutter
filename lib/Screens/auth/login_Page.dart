import 'package:application_authenticate_frontend_with_flutter/Utils/Utils.dart';
import 'package:application_authenticate_frontend_with_flutter/Utils/routes/routes_name.dart';
import 'package:application_authenticate_frontend_with_flutter/provider/auth_Page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../res/components/round_button.dart';
import '../../utils/routes/routes.dart';




class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode  emailFocusNode = FocusNode();
  FocusNode  passwordFocusNode = FocusNode();



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obscurePassword.dispose();
  }

  
  
  
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthPageProvider>(context);

    final hight = MediaQuery.of(context).size.height * 1 ;
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

             TextFormField(
              controller: _emailController,
              focusNode: emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              
              decoration: InputDecoration(
                    hintText: "Enter email",
                    labelText: "Email",
                    prefixIcon: Icon(Icons.alternate_email),
                    
               ),
               onFieldSubmitted: (value) {
                 Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);    //* <-- fieldFocusChange() Function call
               },
             ),
             




             ValueListenableBuilder(             //* <-- ValueListenableBuilder Use
              valueListenable: _obscurePassword, 
              builder:(context, value, child) {
              return  TextField(
              controller: _passwordController,
              obscureText:_obscurePassword.value,
              focusNode: passwordFocusNode,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                    hintText: "Enter password",
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock_open_outlined),
                    suffixIcon: InkWell(
                      onTap: () {
                        _obscurePassword.value = ! _obscurePassword.value;  //* <-- This Password Show or Hide Using code
                      },
                      child: Icon(
                        _obscurePassword.value ?
                        Icons.visibility_off_outlined:
                        Icons.visibility
                        
                        ))
               ),
             );
            },
          ),





            SizedBox(height: hight * .1,),






              RoundButton(

                loading:authViewModel.loading,

                title: "Login", onPerss:(){

                if(_emailController.text.isEmpty){

                    Utils.ftushBarErrorMessage("Please enter email", context);           //* <-- This ftushBarErrorMessage() Function Call

                }else if(_passwordController.text.isEmpty){

                   Utils.ftushBarErrorMessage("Please enter password", context);          //* <-- This ftushBarErrorMessage() Function Call

                }else if(_passwordController.text.length < 6){

                  Utils.ftushBarErrorMessage("Please enter 6 digit password", context);    //* <-- This ftushBarErrorMessage() Function Call

                }else{
                    
                    Map data ={
                      'email':_emailController.text.toString(),
                      'password':_passwordController.text.toString()
                    };

                    // Map data ={
                    //   'email':'eve.holt@reqres.in',
                    //   'password':'pistol'
                    // };

                    // Map data = {
                    //        "email":"akif@gamil.com",
                    //         "password":"121314"
                    //     };
                    authViewModel.loginApi(data,context);  //* LoginApi Function call
                   

                }
                
                  
              }),

           SizedBox(height: hight * .05,),
           InkWell(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.sigUp);
            },
            child: Text("Don't have account? SignUp"))






           
        ],))
    );
  }
}