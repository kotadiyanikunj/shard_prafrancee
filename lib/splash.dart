import 'package:admin/admin.dart';
import 'package:flutter/material.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    spl();
  }
  spl()
  async {
    await Future.delayed(Duration(seconds: 10));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return admin();
    },));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
          'https://1757140519.rsc.cdn77.org/blog/wp-content/uploads/2020/08/google-gif-logo.gif',
          width: 200,
          height: 200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
