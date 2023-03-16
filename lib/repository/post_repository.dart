import 'package:application_authenticate_frontend_with_flutter/data/network/BaseApiServices.dart';
import 'package:application_authenticate_frontend_with_flutter/data/network/NetworkAPIServices.dart';
import 'package:application_authenticate_frontend_with_flutter/models/like_post_and_unlike_model.dart';
import 'package:application_authenticate_frontend_with_flutter/models/post_model.dart';
import 'package:application_authenticate_frontend_with_flutter/res/app_url.dart';
import 'package:flutter/material.dart';



class PostRepository{

 BaseAPIServices _apiServices = NetworkApiServices();  //TODO Create object NetworkApiServices class call



  Future<PostModel> postsdata()async{
  try {                      //*obj call                //* AppUrl class call loginEndPint url
    dynamic response = await _apiServices.getGetApiRespons(AppUrl.localhostAllPost);             //* <-- getGetApiRespons Function call
    return PostModel.fromJson(response);
  } catch (e) {
     throw e;
  }

 }




 Future<LikePostAndUnlikeModel> likePostAndUnlike(var id,String token)async{
  try {                      //*obj call                //* AppUrl class call loginEndPint url
    // AppUrl.post_id = post_id;
    dynamic response = await _apiServices.getGetBearerApiRespons("http://10.0.2.2:5000/api/v1/post/${id}",token);             //* <-- getGetApiRespons Function call
    return LikePostAndUnlikeModel.fromJson(response);
  } catch (e) {
     throw e;
  }

 }

  
}