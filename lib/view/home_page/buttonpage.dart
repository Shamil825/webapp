import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raftlabs_test/view/home_page/page_home.dart';

class Button_Home extends StatelessWidget {
  const Button_Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: TextButton(
      style: ButtonStyle(backgroundColor:  MaterialStateProperty.all(Colors.blue)),
    child:const Text("fetch api",style: TextStyle(color: Colors.white),),onPressed: (){
      Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  page_home()),
  );
    },),);
  }
}