

//TODOclass abstract Create
abstract class BaseAPIServices {                //* <-- Link this calss NetworkApiServices
  Future<dynamic> getGetApiRespons(String url);
  Future<dynamic> getGetBearerApiRespons(String url,String Token);
  Future<dynamic> getPostApiRespons(String url,dynamic data,);
  Future<dynamic> getPutApiBearerRespons(String url,String Token,dynamic data);
  Future<dynamic> getPostApiBearerRespons(String url,String Token,dynamic data);

}