import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'dbhelper.dart';

class viewpage extends StatefulWidget {
  const viewpage({Key? key}) : super(key: key);

  @override
  State<viewpage> createState() => _viewpageState();
}

class _viewpageState extends State<viewpage> {

  Database? db;
  bool status = false;
  List<Map<String, Object?>> l =[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  getdata() async {
    db = await dbhelper().createDatabase();
    String qur = "select * from Test";
    l=await db!.rawQuery(qur);
    status = true;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Data"),),
      body: status?(l.length>0)?
          ListView.builder(
            itemCount: l.length,
            itemBuilder: (context, index) {
              Map m=l[index];
                  return Card(
                    child: ListTile(
                      leading: Text("Name:${m['name']},\nGender:${m['Gender']},\ncity:${m['city']}",style:TextStyle(fontSize: 15),),
                    ),
                  );

          },):Center(child: Text("No data founded"),):
          Center(child: CircularProgressIndicator(),),
    );
  }
}
