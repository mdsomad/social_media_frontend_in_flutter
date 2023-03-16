
class AppException implements Exception{
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString(){
    return '$_prefix$_message';
  }
  
}



class FetchDataException extends AppException{

  FetchDataException([String? message]):super (message, 'Error During Communication');
  
}




class BadRequestException extends AppException{

  BadRequestException([String? message]):super (message, 'Invaild request');
  
}



class UnauthorisedException extends AppException{

  UnauthorisedException([String? message]):super (message, 'Unauthorised request');
  
}



class InvaildInputException extends AppException{

  InvaildInputException([String? message]):super (message, 'Invaild input');
  
}


class UnprocessableEntityException extends AppException{

  UnprocessableEntityException([String? message]):super (message, 'Unprocessable Entity');
  
}
