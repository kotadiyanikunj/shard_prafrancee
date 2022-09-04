import 'package:admin/admin.dart';
import 'package:admin/read_data.dart';
import 'package:admin/viewpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'dbhelper.dart';

class logout extends StatefulWidget {
  String? id1;
  String? s;

  logout(this.s,[this.id1]);

  @override
  State<logout> createState() => _logoutState();
}

class _logoutState extends State<logout> {
  TextEditingController name=TextEditingController();
  String gvalue="Male";
  String male="Male";
  String female="Female";
  String city="surat";
  Database? db;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbhelper().createDatabase().then((value) {
      db = value;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(children: [
          SizedBox(
            height: 50,
            child: Card(
              child: Center(
                child: Text("${widget.id1}"),
              ),
            ),
          ),
          Center(
            child:ElevatedButton(
                onPressed: () {
                  read.perf!.clear();
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return admin();
                    },
                  ));
                },
                child: Text("Log out")),
          ),
          Center(
            child:ElevatedButton(
                onPressed: () {
                  read.perf!.clear();
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return viewpage();
                    },
                  ));
                },
                child: Text("View Data")),
          ),

        ]),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: TextField(
                      controller: name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                        hintText: 'Full Name',
                      ),
                    ),
                  ),
                ),

                Container(
                  child: RadioListTile(
                      title: Text(male),
                      onChanged:(value) {
                        setState(() {
                          gvalue=value as String;
                        });

                      },value: male, groupValue: gvalue),
                ),
                Container(
                  child: RadioListTile(
                      title: Text(female),
                      onChanged:(value) {
                        setState(() {
                          gvalue=value as String;
                        });

                      },value:female, groupValue: gvalue),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 30,top: 20),
                  child: DropdownButton(value:city ,
                    items:[
                      DropdownMenuItem<String>(
                        onTap: () {
                          setState(() {
                            city="surat";
                          });

                        },
                        child: Text("Surat"),value: "surat",
                      ),
                      DropdownMenuItem<String>(
                        onTap: () {
                          setState(() {
                            city="Mumbai";
                          });

                        },
                        child: Text("Mumbai"),value: "Mumbai",
                      ),
                      DropdownMenuItem<String>(
                        onTap: () {
                          setState(() {
                            city="Nepal";
                          });

                        },
                        child: Text("Nepal"),value: "Nepal",
                      ),
                      DropdownMenuItem<String>(
                        onTap: () {
                          setState(() {
                            city="Rajasthan";
                          });

                        },
                        child: Text("Rajasthan"),value: "Rajasthan",
                      ),
                      DropdownMenuItem<String>(
                        onTap: () {
                          setState(() {
                            city="Hariyana";
                          });

                        },
                        child: Text("Hariyana"),value: "Hariyana",
                      ),
                      DropdownMenuItem<String>(
                        onTap: () {
                          setState(() {
                            city="Utter pradesh";
                          });

                        },
                        child: Text("Utter pradesh"),value: "Utter pradesh",
                      ),
                      DropdownMenuItem<String>(
                        onTap: () {
                          setState(() {
                            city="Panjab";
                          });

                        },
                        child: Text("Panjab"),value: "Panjab",
                      ),
                    ] ,
                    onChanged:(value) {
                      setState(() {

                      });
                    },),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(onPressed: () async{

                      String name1=name.text;
                      String q="insert into Test(name,Gender,city)values('$name1','$gvalue','$city')";
                      int id= await db!.rawInsert(q);
                      print(id);

                    }, child:Text("Save")),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
