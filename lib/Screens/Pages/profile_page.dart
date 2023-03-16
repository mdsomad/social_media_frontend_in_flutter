// import 'package:application_authenticate_frontend_with_flutter/data/response/status.dart';
// import 'package:application_authenticate_frontend_with_flutter/models/get_user_data_model.dart';
// import 'package:application_authenticate_frontend_with_flutter/models/user_model.dart';
// import 'package:application_authenticate_frontend_with_flutter/provider/profile_page_provider.dart';
// import 'package:application_authenticate_frontend_with_flutter/res/color.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../service/user_shared_preferences.dart';


// class ProfilePage extends StatefulWidget {
//   const ProfilePage({Key? key}) : super(key: key);

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {

//   Future<UserModel> getUsertToken() => UserSharedPreferences().getUser(); 

//   ProfilePageProvider getUserProvider = ProfilePageProvider();  //TODO Create object HomeViewViewModel with Provider Class
  
  
  
//   @override
//   void initState() {
//     // TODO: implement initState
    
//        getUsertToken().then((value){
//           print(value.token.toString());
//             getUserProvider.getuserdataApi(value.token.toString());
//         }); 
   
//     super.initState();
//   }
  




//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: 

//      ChangeNotifierProvider<ProfilePageProvider>(create: (context) => getUserProvider,
//       child: Consumer<ProfilePageProvider>(builder: (context, value, child) {

//         switch(value.getuserData.status){
//           case Status.LOADING:
//           return Center(child: CircularProgressIndicator());

//           case Status.ERROR:
//            return InkWell(
//             onTap: (() {
//               getUsertToken().then((value){
//               print(value.token);
//               getUserProvider.getuserdataApi(value.token.toString());
//         }); 
//             }),
//             child: Center(child:Text(value.getuserData.message.toString())));

//           case Status.COMPLETED:

//            return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//              children: [

//               //  InkWell(
//               //   onTap: () {

//               // getUsertToken().then((val){
//               //  print(val.token);
//               //       value.showUserNameDialogAlert(context,value.getuserData.data!.user!.name!,   val.token.toString());
//               //  }); 
                  
                  
//               //   },
//               //   child: ReusbaleRow(title: "Name",   value:value.getuserData.data!.user!.name!,  iconData: Icons.person)),     
                
//               //  InkWell(
//               //   onTap: () {

//               //     getUsertToken().then((val){
//               //        value.showPhoneDialogAlert(context,val.token.toString(),   value.getuserData.data!.user!.phone!.toString());
//               //     });

//               //   },
//               //   child: ReusbaleRow(title: "Phone",   value:value.getuserData.data!.user!.phone.toString(),  iconData: Icons.phone)),     

//               //  ReusbaleRow(title: "Email",   value:value.getuserData.data!.user!.email!,  iconData: Icons.email),     
                  
//              ],

            
             
//            );

//          default:
//          return Text("NO Data");
          
//         }
        

//       },),


//       )








//      );
//   }
// }










// class ReusbaleRow extends StatelessWidget {
//   final String title, value;
//   final IconData iconData;

//   const ReusbaleRow(
//       {Key? key,
//       required this.title,
//       required this.value,
//       required this.iconData})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ListTile(
//           title: Text(
//             title,
//             style: Theme.of(context).textTheme.subtitle2,
//           ),
//           trailing: Text(value, style: Theme.of(context).textTheme.subtitle2),
//           leading: Icon(
//             iconData,
//             color: AppColors.primaryIconColor,
//           ),
//         ),
//         Divider(
//           color: AppColors.dividedColor.withOpacity(0.4),
//         )
//       ],
//     );
//   }
// }
