import 'package:flutter/material.dart';
import 'package:httpdemo/login/login_page.dart';
import 'package:httpdemo/login/registered_page.dart';

class LoginRegisteredPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => LoginRegisteredPageState();

}
class LoginRegisteredPageState extends State<LoginRegisteredPage>{
  TextEditingController _controller;
  bool _offstate = false;
   set offstate(bool offstate) => _offstate=offstate;
   get offstate => _offstate;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Image.asset('images/login.jpg',
            fit: BoxFit.fitWidth,
        //    height: MediaQuery.of(context).size.height, //获取当前屏幕的高度
            width: MediaQuery.of(context).size.width,
          ),
          new Offstage(
            offstage: _offstate,
            child: new LoginPage(loginRegisteredCallBack),
          ),
          new Offstage(
            offstage: !_offstate,
            child: new RegisteredPage(loginRegisteredCallBack),
          )
        ],
      ),
    );
  }

  loginRegisteredCallBack(){
    setState(() {
      _offstate = !_offstate;
    });
  }

}