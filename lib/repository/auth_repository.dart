

import 'dart:convert';

import 'package:application_authenticate_frontend_with_flutter/models/user_model.dart';
import 'package:application_authenticate_frontend_with_flutter/res/app_url.dart';
import 'package:http/http.dart';

import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkAPIServices.dart';
import 'package:http/http.dart' as http;

import '../models/get_user_data_model.dart';

class AuthRepository{

 BaseAPIServices apiServices = NetworkApiServices();  //TODO Create object NetworkApiServices class call



 //TODO SignUp Function Create
 Future<dynamic> sigUpApi(dynamic data)async{

  try {                      //*obj call                //* AppUrl class call registerEndPint url
    dynamic response = await apiServices.getPostApiRespons(AppUrl.localhostRegister, data);  //* <-- getPostApiRespons Function call
    return response;
  } catch (e) {
     throw e;
  }
  
 }









 //TODO Login Function Create
 Future<UserModel> login(dynamic data)async{
  try {                      //*obj call                //* AppUrl class call loginEndPint url
    dynamic response = await apiServices.getPostApiRespons(AppUrl.localhostLogin,data); //* <-- getPostApiRespons Function call
    return UserModel.fromJson(response);
  } catch (e) {
      throw e;
  }
  
 }



















 //TODO Login Function Create
 Future changepassword(String token,data)async{
  try {                      //*obj call                //* AppUrl class call loginEndPint url
    dynamic response = await apiServices.getPostApiBearerRespons(AppUrl.localhostChangepassword,token,data);    //* <-- getPostApiRespons Function call
    return response;
  } catch (e) {
      throw e;
  }
  
 }





//  Future<Map> getJson(dynamic data) async {
//   return await http.post(Uri.parse("https://user-authenticate.onrender.com/api/user/login"),
//    headers: {"Accept": "application/json"},
//   body: data).then((response) => json.decode(response.body));
// }














  
}