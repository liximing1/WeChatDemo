import 'package:flutter/material.dart';

class RegisteredPage extends StatefulWidget{
  VoidCallback voidCallback;
  RegisteredPage(this.voidCallback);
  @override
  State<StatefulWidget> createState() =>RegisteredPageState();

}

class RegisteredPageState extends State<RegisteredPage>{
  TextEditingController _controller;
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
                width: MediaQuery.of(context).size.width/2,
                child: new TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      labelText: '确认密码：',
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
                    child: new Text('注册',style: new TextStyle(
                        color: Colors.black
                    ),)),
              ),
              new Container(
                child: new FlatButton(
                    onPressed: widget.voidCallback,
                    child: new Text('有账号啦？点我登录',
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