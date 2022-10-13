import 'dart:math';

import 'package:flutter/material.dart';

class Page_welcome extends StatelessWidget {
   Page_welcome({ Key? key }) : super(key: key);
var now=DateTime.now().hour;
 
 String greeting(){
   if(now<12){
     return 'assets/goodmornig.jpg';
   }if
     (now<17){
      return 'assets/goodafternoon.jpg';
     }if
     (now<19 ){
      return 'assets/goodevening.jpg';
     }
     return "assets/goodnight.jpg";
 }
  
 
  

 
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(greeting(),fit: BoxFit.cover,),
      ));
        
      }
}
