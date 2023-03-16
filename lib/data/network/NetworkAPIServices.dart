
import 'dart:convert';
import 'dart:io';

import 'package:application_authenticate_frontend_with_flutter/data/app_expositions.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'BaseApiServices.dart';

class NetworkApiServices extends BaseAPIServices{   //* NetworkApiServices class Link this BaseAPIServices class


  @override
  Future getGetApiRespons(String Url) async{
    // TODO: implement getGetApiRespons

    dynamic responseJson;
    try {

      final response = await http.get(
        Uri.parse(Url),
      headers: {
        // 'Content-Type': 'application/json',
        "Accept": "application/json",
    }
        );
        
        // .timeout(Duration(seconds: 10));

      responseJson = returnResponse(response);         //* <-- returnResponse Finction call
      
    } on SocketException {
      throw FetchDataException('No Internet Conncetion');  //* <-- FetchDataException class call
    }
    return responseJson;
    
    
  }



  


  @override
  Future getGetBearerApiRespons(String Url,String Token) async{
    // TODO: implement getGetApiRespons

    dynamic responseJson;
    try {

      final response = await http.get(
        Uri.parse(Url),
        headers: {
        // 'Content-Type': 'application/json',
        "Accept": "application/json",
        'Authorization': 'Bearer $Token',
    }
        );
        
        // .timeout(Duration(seconds: 10));

      responseJson = returnResponse(response);         //* <-- returnResponse Finction call
      
    } on SocketException {
      throw FetchDataException('No Internet Conncetion');  //* <-- FetchDataException class call
    }
    
    return responseJson;
    
    
  }










  @override 
  Future getPostApiRespons(String url,dynamic data)async {      //* <-- getPostApiRespons function call
    // TODO: implement getPostApiRespons
    
   dynamic responseJson;
    try {
     Response response = await post(
      Uri.parse(url),
      headers: {
      //  'Content-Type': 'application/json',
        "Accept": "application/json",
      },
      body: data

     );
      responseJson = returnResponse(response);    //* <-- returnResponse Finction call
    } on SocketException {
      throw FetchDataException('No Internet Conncetion');
    }
    return responseJson;
  }


  @override 
  Future getPostApiBearerRespons(String url,String Token,dynamic  data)async {      //* <-- getPostApiRespons function call
    // TODO: implement getPostApiRespons
    
   dynamic responseJson;
    try {
     Response response = await post(
      Uri.parse(url),
      headers: {
        // 'Content-Type': 'application/json',
        "Accept": "application/json",
        'Authorization': 'Bearer $Token',
        
      },
     body: data
     );
      responseJson = returnResponse(response);    //* <-- returnResponse Finction call
    } on SocketException {
      throw FetchDataException('No Internet Conncetion');
    }
    return responseJson;
  }








//TODO User Profile Update Function
  @override 
  Future getPutApiBearerRespons(String url,String Token,dynamic data)async {      //* <-- getPostApiRespons function call
   dynamic responseJson;
    try {
     Response response = await put(
      Uri.parse(url),
      headers: {
        // 'Content-Type': 'application/json',
        "Accept": "application/json",
        'Authorization': 'Bearer $Token',
      },
      body: data

     );
      responseJson = returnResponse(response);    //* <-- returnResponse Finction call
    } on SocketException {
      throw FetchDataException('No Internet Conncetion');
    }
    return responseJson;
  }








// TODO returnResponse Function Create
dynamic returnResponse (http.Response response){

  switch(response.statusCode){
      case 200:
       dynamic responseJson = jsonDecode(response.body);
       return responseJson;
      case 201:
       dynamic responseJson = jsonDecode(response.body);
       return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());   //* <-- BadRequestException class Call
      case 422:
        throw UnprocessableEntityException(response.body.toString());   //* <-- BadRequestException class Call
      case 500:
      case 404:
       throw UnauthorisedException(response.body.toString());   //* <-- UnauthorisedException class Call
      default :
       throw FetchDataException(' Error accured white communicating with server '+   //* <-- FetchDataException  class Call
              'with status code' + response.statusCode.toString());
     }
  
  
}


  

}


