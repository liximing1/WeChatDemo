import 'package:flutter/material.dart';
import 'package:httpdemo/login/login_registered_page.dart';

class LoginPage extends StatefulWidget{
  VoidCallback voidCallback;
  LoginPage(this.voidCallback);
  @override
  State<StatefulWidget> createState() =>LoginPageState();

}

class LoginPageState extends State<LoginPage>{
  TextEditingController _controller;
  LoginRegisteredPageState lrps = new LoginRegisteredPageState();
  @override
  Widget build(BuildContext context) {
    return new Center(
        child:new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                width: MediaQuery.of(context).size.width/2,
                child:new TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    labelText:'用户名：',
                    labelStyle:TextStyle(fontSize: 15.0,color: Colors.white70),
                  ),
                ) ,
              ),
              new Container(
                width: MediaQuery.of(context).size.width/2,
                child: new TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      labelText: '密码：',
                      labelStyle: TextStyle(fontSize: 15.0,color: Colors.white70)
                  ),
                ),
              ) ,
              new Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                width: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.all(Radius.circular(5.0))
                ),
                child: new FlatButton(
                    onPressed: null,
                    child: new Text('登录',style: new TextStyle(
                        color: Colors.black
                    ),)),
              ),
              new Container(
                child: new FlatButton(
                    onPressed:widget.voidCallback,
                    child: new Text('没有账号？快来注册吧',
                      style: new TextStyle(
                        color: Colors.black54,
                        fontSize: 12.0,
                        decoration:TextDecoration.underline,
                      ),)),
              ),
            ],
          ),
        )
    );
  }

}