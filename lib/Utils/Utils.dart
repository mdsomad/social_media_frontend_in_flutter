
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:application_authenticate_frontend_with_flutter/res/color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Utils {

 

 static double averageRating(List<int>rating){
    var avgRating = 0;
    for(int i = 0 ;i<rating.length;i++){
       avgRating = avgRating + rating[i];
    }

    return double.parse((avgRating/rating.length).toStringAsFixed(1));
 }

 



  //TODO FocusNode Function create
  static void fieldFocusChange(
    BuildContext context,
    FocusNode current,
    FocusNode nextFocus
  ){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);

  }





  //* Fluttertoast Message
  static toastMessage(String message){
    Fluttertoast.showToast(msg: message,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 15
    );
    
  }








  //TODO ftushBarErrorMessage function create
  static void ftushBarErrorMessage(String message,BuildContext context){         //* <-- ERROR Message Show karne ka kaam Aata hai
     showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        forwardAnimationCurve: Curves.decelerate,
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        padding: EdgeInsets.all(15),
        backgroundColor: Colors.red,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        duration: Duration(seconds: 3),
        borderRadius: BorderRadius.circular(10),
        flushbarPosition: FlushbarPosition.TOP,
        icon: Icon(Icons.error,color: AppColors.whiteColor,),
      )..show(context)
      );
  }







// TODO snackBar Function create
static snackBar(String message,BuildContext context){
   return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      content: Text(message)
      ) 
   );
  
}





  
  
}