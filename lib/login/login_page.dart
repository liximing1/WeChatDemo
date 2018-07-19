import 'package:flutter/material.dart';
import 'package:httpdemo/bean/user_bean.dart';
import 'package:httpdemo/home/home_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:httpdemo/login/registered_page.dart';


class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>LoginPageState();

}

class LoginPageState extends State<LoginPage>{
  TextEditingController _nameController;
  TextEditingController _passwordController;
  DatabaseReference reference ;
  String _passwordErr;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = new TextEditingController();
    _passwordController = new TextEditingController();
    reference = FirebaseDatabase.instance.reference().child('users');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        controller: _nameController,
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
                        controller: _passwordController,
                        decoration: InputDecoration(

                            helperText: _passwordErr,
                            helperStyle: new TextStyle(
                                color: Colors.red
                            ),
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
                          onPressed: (){
                            reference.child(_nameController.text).once().then((DataSnapshot onValue ){ //then传递的是reference位置查询的数据
                              if(onValue.value!=null){
                                if(onValue.value['password']==_passwordController.text){
                                  UserBean user = new UserBean(
                                      userName: onValue.value['username'],
                                      nickName: onValue.value['nickName']
                                  );
                                  //导航到home页面，并将数据带入到user类
                                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>HomePage(user)));
                                }else{
                                  setState(() {
                                    _passwordErr = '密码或账号错误';
                                  });
                                }
                              }else{
                                setState(() {
                                  _passwordErr = '密码或账号错误';
                                });
                              }
                            });
                          },
                          child: new Text('登录',style: new TextStyle(
                              color: Colors.black
                          ),)),
                    ),
                    new Container(
                      child: new FlatButton(
                          onPressed:(){
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => new RegisteredPage()));
                          },
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
          ),
        ],
      ),
    );
  }

}
