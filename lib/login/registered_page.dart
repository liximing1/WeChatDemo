import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
class RegisteredPage extends StatefulWidget{
  VoidCallback voidCallback;


  RegisteredPage(this.voidCallback,);
  @override
  State<StatefulWidget> createState() =>RegisteredPageState();

}

class RegisteredPageState extends State<RegisteredPage>{
  TextEditingController _nameController;
  TextEditingController _passwordController;
  TextEditingController _passwordController2;
  TextEditingController _nickNameController;
  DatabaseReference reference;
  bool _usernameErr = false;
  bool _passwordErr = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = new TextEditingController();
    _passwordController = new TextEditingController();
    _passwordController2 = new TextEditingController();
    _nickNameController = new TextEditingController();
    reference = FirebaseDatabase.instance.reference().child('users');

  }

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
                  onSubmitted: (value){
                    reference.child(value).once().then((DataSnapshot onValue){
                      if(onValue.value==null){
                        _usernameErr = true;
                        setState(() {
                        });
                      }else{
                        _usernameErr = false;
                        setState(() {
                        });
                      }
                    });
                  },
                  controller: _nameController,
                  decoration:  InputDecoration(
                    errorText: _usernameErr ? null:'用户名被占用',
                    fillColor: Colors.white,
                    labelText:'用户名：',
                    labelStyle:TextStyle(fontSize: 15.0,color: Colors.white70),
                  ),
                ) ,
              ),
              new Container(
                width: MediaQuery.of(context).size.width/2,
                child: new TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      labelText: '密码：',
                      labelStyle: TextStyle(fontSize: 15.0,color: Colors.white70)
                  ),
                ),
              ) ,
              new Container(
                width: MediaQuery.of(context).size.width/2,
                child: new TextField(
                  onSubmitted: (value){
                    if(value==_passwordController.text){
                      _passwordErr = true;
                    }else{
                      _passwordErr = false;
                    }
                  },
                  controller:_passwordController2,
                  decoration: InputDecoration(
                    errorText: _passwordErr ? null: '两次密码不同┗|｀O′|┛ 嗷~~',
                    labelText: '确认密码：',
                    labelStyle: TextStyle(fontSize: 15.0,color: Colors.white70)
                  ),
                ),
              ) ,
              new Container(
                width: MediaQuery.of(context).size.width/2,
                child: new TextField(
                  controller:_nickNameController,
                  decoration: InputDecoration(
                      labelText: '昵称：',
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
                    onPressed: (_usernameErr&&_passwordErr)?(){
                      setState(() {
                        reference.child(_nameController.text).set({
                          'username':_nameController.text,
                          'password':_passwordController.text,
                          'nickName':_nickNameController.text
                        });
                        _nameController.clear();
                        _passwordController.clear();
                        _passwordController2.clear();
                        _nickNameController.clear();
                        widget.voidCallback;
                      });
                    }:null,
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