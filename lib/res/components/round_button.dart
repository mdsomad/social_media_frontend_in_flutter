import 'package:application_authenticate_frontend_with_flutter/res/color.dart';
import 'package:flutter/material.dart';


class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPerss;

  const RoundButton({Key? key,required this.title,this.loading = false,required this.onPerss}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPerss,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child:loading? CircularProgressIndicator(color: Colors.white,):Text(title,style: TextStyle(color:AppColors.whiteColor),),),
      )
    );
  }
}