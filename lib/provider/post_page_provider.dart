
import 'dart:async';

import 'package:application_authenticate_frontend_with_flutter/Utils/Utils.dart';
import 'package:application_authenticate_frontend_with_flutter/data/response/api_response.dart';
import 'package:application_authenticate_frontend_with_flutter/models/post_model.dart';
import 'package:application_authenticate_frontend_with_flutter/repository/post_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class PostsPageProvider with ChangeNotifier{
  
  final _myRepo = PostRepository();

  




//  StreamController<List<PostModel>> counterStream = StreamController<List<PostModel>>();     //* <-- single  streambuilder use data StreamController


  final _socketResponse = StreamController<PostModel>.broadcast();   //* <-- StreamController

  void Function(PostModel) get addResponse => _socketResponse.sink.add;   //* add data functoin

  Stream<PostModel> get getResponse => _socketResponse.stream.asBroadcastStream();  //* Get Data



  // final _socketResponse = StreamController<List<PostModel>>.broadcast();   //* <-- StreamController

  // void Function(List<PostModel>) get addResponse => _socketResponse.sink.add;   //* add data functoin

  // Stream<List<PostModel>> get getResponse => _socketResponse.stream.asBroadcastStream();  //* Get Data








List<PostModel> postlist = [];

  

  Future<void> getpostdataApi ()async{

      _myRepo.postsdata().then((value){
        postlist.add(value);
        // postlist.reversed;
        // counterStream.add(postlist);
        addResponse(value);

    }).onError((error, stackTrace){

       Utils.toastMessage(error.toString());

    });
    
  }

  










  







//TODO Create likePostAndDislikeApi Function 
  Future<void> likePostAndDislikeApi(var id, String token,BuildContext context)async{

     _myRepo.likePostAndUnlike(id,token).then((value){      //* <-- likePostAndUnlike function call
        getpostdataApi();
    
     }).onError((error, stackTrace){

        //  UserError userError = UserError.fromJson(error as Map<dynamic,dynamic>);
          Utils.toastMessage(error.toString());
        
         if(kDebugMode){ 
          
          print(error.toString());
       }
     });
  }





  
  
  
  
}