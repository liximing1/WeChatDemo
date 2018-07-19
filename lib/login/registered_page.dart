import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
class RegisteredPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>RegisteredPageState();

}

class RegisteredPageState extends State<RegisteredPage>{
  TextEditingController _nameController;
  TextEditingController _passwordController;
  TextEditingController _passwordController2;
  TextEditingController _nickNameController;
  DatabaseReference reference;
  String _usernameErr ='';
  String _passwordErr ='';
  RegExp _usernameRegExp = new RegExp(r'[a-z0-9]{6,10}');

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
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Opacity( //控制透明度
            opacity: 0.8,
            child: new Image.asset('images/login.jpg',
              fit: BoxFit.fitWidth,
              //    height: MediaQuery.of(context).size.height, //获取当前屏幕的高度
              width: MediaQuery.of(context).size.width,
            ),
          ),
      new Center(
          child:new Container(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  width: MediaQuery.of(context).size.width/2,
                  child:new TextField(
                    onChanged: (value){
                      if(_usernameRegExp.hasMatch(_nameController.text)){
                        reference.child(value).once().then((DataSnapshot onValue){
                          if(onValue.value==null){
                            setState(() {
                              _usernameErr = null;
                            });
                          }else{
                            _usernameErr = '用户名被占用';
                            setState(() {
                            });
                          }
                        });
                      }else{
                        setState(() {
                          _usernameErr = '用户名格式错误';
                        });
                      }
                    },
                    controller: _nameController,
                    decoration:  InputDecoration(
                      errorText: _usernameErr ,
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
                    onChanged: (value){
                      print('onChange1');
                      if(_usernameRegExp.hasMatch(value)){
                        print('zhengze');
                        setState(() {
                          _passwordErr = null;
                        });
                      }else{
                        _passwordErr = '密码格式错误';
                        setState(() {

                        });
                      }
                    },
                    decoration: InputDecoration(
                        labelText: '密码：',
                        labelStyle: TextStyle(fontSize: 15.0,color: Colors.white70)
                    ),
                  ),
                ) ,
                new Container(
                  width: MediaQuery.of(context).size.width/2,
                  child: new TextField(
                    onChanged: (value){
                      print('onChange2');
                        if(value!=_passwordController.text){
                          print('密码不服');
                          _passwordErr = '两次密码不符';
                          setState(() {
                          });
                        }else{
                          print('密码相同');
                          _passwordErr = null;
                          setState(() {
                          });
                        }
                    },
                    controller:_passwordController2,
                    decoration: InputDecoration(
                        errorText: _passwordErr,
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
                      onPressed: (_usernameErr==_passwordErr&&_passwordController.text==_passwordController2.text)?(){
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
                        });
                      }:null,
                      child: new Text('注册',style: new TextStyle(
                          color: Colors.black
                      ),)),
                ),
                new Container(
                  child: new FlatButton(
                      onPressed: ()=>Navigator.of(context).pop(),
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
      ),
        ],
      ),
    );

  }

}