import 'dart:convert';

import 'package:application_authenticate_frontend_with_flutter/Utils/Utils.dart';
import 'package:application_authenticate_frontend_with_flutter/Utils/routes/routes_name.dart';
import 'package:application_authenticate_frontend_with_flutter/models/register_model.dart';
import 'package:application_authenticate_frontend_with_flutter/provider/auth_Page_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../res/components/round_button.dart';
import '../../utils/routes/routes.dart';




class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _LoginViewState();
}

class _LoginViewState extends State<SignUpPage> {

  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode  nameFocusNode = FocusNode();
  FocusNode  emailFocusNode = FocusNode();
  FocusNode  passwordFocusNode = FocusNode();



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

   nameFocusNode.dispose();
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
        title: Text("SignUp"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

             TextFormField(
              controller: _nameController,
              focusNode: nameFocusNode,
              keyboardType: TextInputType.emailAddress,
              
              decoration: InputDecoration(
                    hintText: "Enter name",
                    labelText: "Name",
                    prefixIcon: Icon(Icons.person),
                    
               ),
               onFieldSubmitted: (value) {
                 Utils.fieldFocusChange(context, nameFocusNode, emailFocusNode);    //* <-- fieldFocusChange() Function call
               },
             ),


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
                    hintText: "Create password",
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

                loading:authViewModel.sigUploading, 

                title: "SigUp", onPerss:(){

                  if(_nameController.text.isEmpty){

                    Utils.ftushBarErrorMessage("Please enter name", context); 

                  }else if(_emailController.text.isEmpty){

                    Utils.ftushBarErrorMessage("Please enter email", context);           //* <-- This ftushBarErrorMessage() Function Call

                }else if(_passwordController.text.isEmpty){

                   Utils.ftushBarErrorMessage("Please enter password", context);          //* <-- This ftushBarErrorMessage() Function Call

                }else if(_passwordController.text.length < 6){

                  Utils.ftushBarErrorMessage("Please enter 6 digit password", context);    //* <-- This ftushBarErrorMessage() Function Call

                }else{
                    
                    Map data ={
                      'name':_nameController.text.toString().trim(),
                      'email':_emailController.text.toString().trim(),
                      'password':_passwordController.text.toString().trim()
                    };
                  
                    // String test = "true";
                    // bool isCorrect = test == 'true';


                    // Map data = {
                    //     "name":"Hello11",
                    //     "email":"hello11@gamil.com",
                    //     "phone":90909309.toString(),
                    //     "age":10.toString(),
                    //     "password":"123456",
                    //     "password_confirmation":"123456",
                    //     "tc":test
                    //     };

                    
                    
                    authViewModel.sigUpApi(data,context);  //* sigUpApi Function call
                    print("Api Hit");

                }
                
                  
              }),

           SizedBox(height: hight * .05,),
           InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text("Already have an account? Login"))






           
        ],))
    );
  }
}