import 'package:flutter/material.dart';
import 'package:raftlabs_test/view/home_page/buttonpage.dart';
import 'package:raftlabs_test/view/home_page/page_home.dart';
import 'package:raftlabs_test/view/page_web.dart';
import 'package:raftlabs_test/view/page_welcome.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

int currentindex=0;



class _Home_ScreenState extends State<Home_Screen> {
  @override

  void selectedindex(int index){
    setState(() {
      currentindex=index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar:
        
         Theme(
           data: Theme.of(context).copyWith(
        
        canvasColor: Colors.black),
           child: BottomNavigationBar(
              currentIndex: currentindex,
            onTap: selectedindex,
               type: BottomNavigationBarType.shifting,
                selectedItemColor: Colors.greenAccent,
                unselectedItemColor: Colors.grey,
                backgroundColor: Color.fromRGBO(0, 0, 0, 1),
                items:const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: "home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: "user"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.zoom_out_map_sharp,
                  ),
                  label: "Webview")
            ]),
         ) ,
        body:IndexedStack(
          index: currentindex,
          children: [
            Button_Home(),
            Page_welcome(),
            Page_web(),
          ],
        ),
        
        
      )
    );
  }
}
