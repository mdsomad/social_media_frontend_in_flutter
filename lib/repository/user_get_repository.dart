
import 'package:application_authenticate_frontend_with_flutter/models/UserError.dart';
import 'package:application_authenticate_frontend_with_flutter/models/my_profile_models.dart';
import 'package:application_authenticate_frontend_with_flutter/res/app_url.dart';

import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkAPIServices.dart';
import '../models/get_user_data_model.dart';

class UserGetRepository{

BaseAPIServices _apiServices = NetworkApiServices();  //TODO Create object NetworkApiServices class call






  Future<MyProfileModel> getuserdata(String Token)async{
  try {                      //*obj call                //* AppUrl class call loginEndPint url
    dynamic response = await _apiServices.getGetBearerApiRespons(AppUrl.localhostGetUser,Token);             //* <-- getGetApiRespons Function call
    return MyProfileModel.fromJson(response);
  } catch (e) {
     throw e;
  }

 }









 //TODO 
 Future<UserError> userprofileupdate(String token,dynamic data)async{
  try {                      //*obj call                //* AppUrl class call loginEndPint url
    dynamic response = await _apiServices.getPutApiBearerRespons(AppUrl.localhostNameUpdate,token,data);    //* <-- getPostApiRespons Function call
    return   UserError.fromJson(response);
  } catch (e) {
      throw e;
  }
  
 }



 //TODO 
 Future<UserError> phonenumberupdate(String token,dynamic data)async{
  try {                      //*obj call                //* AppUrl class call loginEndPint url
    dynamic response = await _apiServices.getPutApiBearerRespons(AppUrl.localhostPhoneNumberUpdate,token,data);    //* <-- getPostApiRespons Function call
    return UserError.fromJson(response);
  } catch (e) {
      throw e;
  }
  
 }




 

}





