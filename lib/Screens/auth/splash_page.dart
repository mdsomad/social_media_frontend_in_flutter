import 'package:application_authenticate_frontend_with_flutter/service/splash_services.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


SplashServices splashServices = SplashServices();   //TODO Create Objcet SplashServices class
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.checkAuthentictation(context);
  }




  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Center(child: Text("Splash Screen",style: Theme.of(context).textTheme.headline4,)),
     );
  }
}