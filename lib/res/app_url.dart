class AppUrl{

//* BaseUrl
static var baseUrl = 'https://user-authenticate.onrender.com/api/user';      //* Search Browser access now


static var loginEndPint = baseUrl + "/login";               //* login route

static var registerEndPint = baseUrl + '/register';         //* register route

static var changepasswordEndPint = baseUrl + '/changepassword';         //* changepassword route





  //* localHost APIs
  static var localhostRegister = "http://10.0.2.2:5000/api/v1/register";         //* register route

  static var localhostLogin =  "http://10.0.2.2:5000/api/v1/login";               //* login route

  static var localhostGetUser =  "http://10.0.2.2:5000/api/v1/me";               //* login route

  static var localhostChangepassword = "http://10.0.2.2:5000/v1/update/password";         //* changepassword route

  static var localhostNameUpdate = "http://10.0.2.2:5000/api/user/nameupdate";         //* changepassword route

  static var localhostPhoneNumberUpdate = "http://10.0.2.2:5000/api/user/phonenumberupdate";         //* changepassword route

  static var localhostEmailUpdate = "http://10.0.2.2:5000/api/user/emailupdate";         //* changepassword route

  static var localhostAllPost = "http://10.0.2.2:5000/api/v1/getallpost"; 
          //* changepassword route
          
  static var post_id;
   
  static var localhostLikePostAndUnlike = "http://10.0.2.2:5000/api/v1/post/${post_id}";         //* changepassword route
  






  
} 