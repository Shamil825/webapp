
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:raftlabs_test/contoller/homepage_controller.dart';
import 'package:raftlabs_test/model.dart';
import 'package:raftlabs_test/view/home_page/weblink_page.dart';

class page_home extends StatefulWidget {
   page_home({ Key? key }) : super(key: key);

  @override
  State<page_home> createState() => _page_homeState();
}

class _page_homeState extends State<page_home> {
TextEditingController searchController=TextEditingController();

bool flag=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 241, 216, 216),
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.5),
        title: const Text("api call"),
      ),
      //
      body: Column(
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[300],
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(18))),
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: TextFormField(
                        onChanged: (value) {
                         if(value.isEmpty || value==""){
                           flag=false;
                           setState(() {
                             
                             
                           });
                         }
                        
                        },
                        controller:searchController,
                        decoration:const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search for category',
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                           FocusScopeNode currentFocus = FocusScope.of(context);
                           
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
                          flag=true;
                          setState(() {
                            
                          });
                      }, child: const Icon(Icons.search)),
                ]),
          ),
         Expanded(
            child: FutureBuilder(
              future: flag ? search(searchKeyword:searchController.text):getcall(),
                builder: (context, AsyncSnapshot<Model?> snap) {
                  if (snap.hasData)  {
                    
                   if(snap.data!.entries!.isEmpty){
                     return Center(child: Text("not found"),);

                   }else{

                    return ListView.builder(
                      itemCount: snap.data!.entries!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 2,
                          color: Color.fromARGB(255, 243, 226, 226),
                          child: ListTile(
                            trailing: Text("Tap to more"),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => webLink(
                                        weblinkget:
                                            snap.data!.entries![index].link!)),
                              );
                            },
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text( snap.data!.entries![index].api!, style:
                                      const TextStyle(fontWeight: FontWeight.bold),),
                                      SizedBox(width: 5,),
                                Text(
                                  snap.data!.entries![index].category==null?"no category":
                                  snap.data!.entries![index].category!
                                 
                                ),
                              ],
                            ),
                            subtitle:
                                Text(snap.data!.entries![index].description!),
                          ),
                        );
                      },
                    );
                   }
                  } 
                  
                  
                  else {
                    
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ],
      ),
    );
  }
}