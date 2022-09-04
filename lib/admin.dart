import 'dart:io';

import 'package:admin/read_data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'logout.dart';

class admin extends StatefulWidget {
  const admin({Key? key}) : super(key: key);

  @override
  State<admin> createState() => _adminState();
}

class _adminState extends State<admin> {
  TextEditingController id=TextEditingController();
  TextEditingController password=TextEditingController();
  String error="Enter valid id";
  String ide="admin";
  String pass="admin";
  String x="login";
  bool status=false;
int iid=10;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initpref();
  }


  initpref()
  async {
    read.perf=await SharedPreferences.getInstance();
    if(read.perf!.containsKey("abc"))
      {

        Navigator.push(context ,MaterialPageRoute(builder: (context) {
          return logout("log");
        },));
      }
    status =true;

    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff885566),
        title: Center(
          child: Text("Admin Page"),
        ),
      ),
      body: status ?Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Id=MTZ\npassword=123456"),
          Row(
            children: [

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 60, bottom: 20),
                child: Container(
                  height: 200,
                  width: 250,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xff885566).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: TextField(
                          controller: id,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                            ),
                            labelText: 'Enter Id',
                            hintText: 'Enter Id',

                            prefixIcon: Icon(Icons.perm_identity),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: TextField(
                          controller: password,
                          obscureText: true,
                          keyboardType:TextInputType.numberWithOptions(),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                            ),
                            labelText: 'Enter Password',
                            hintText: 'Enter Password',
                            prefixIcon: Icon(Icons.vpn_key),
                          ),
                          onChanged: (value) {

                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
            width: 240,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff885566).withOpacity(0.5),
                ),
                onPressed: () async {
                  String id1=id.text;
                  String password1=password.text;
                  print("id1="+id1);
                  if(id1=="MTZ" && password1=="123456")
                  {
                    await read.perf!.setString("abc",x);

                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      return logout("log",id1);
                    },));
                  }
                  else
                    {
                      Fluttertoast.showToast(
                          msg: "Invalid Id And Password",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }

                },
                child: Text(
                  "Log In",
                  style: TextStyle(fontSize: 20),
                )),
          ),
        ],
      ):Center(child:CircularProgressIndicator(),)
    );
  }
}
