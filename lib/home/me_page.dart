import 'package:flutter/material.dart';
import 'package:httpdemo/bean/user_bean.dart';
import 'package:httpdemo/home/address_page.dart';
import 'package:httpdemo/home/found_page.dart';

class MePage extends StatelessWidget{
  UserBean user;
  String nickName;
  String chatNumber;
  MePage({this.nickName,this.chatNumber,this.user});
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Me'),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[
          new DriverH(),
          new ListTile(
            leading: new Image.asset('images/touxiang1.jpg',width: 45.0,height: 45.0,),
            title: new Text(nickName??'路飞',style: new TextStyle(fontSize: 15.0),),
            subtitle: new Text(chatNumber??'wei_xin_9900',style: new TextStyle(color: Colors.black26,fontSize: 12.0),),
            trailing: new Icon(Icons.image),
            
          ),
          new DriverH(),
          new ListTile(
            leading: new Icon(Icons.monetization_on,color: Colors.blue,),
            title: new Text('钱包'),
          ),
          new DriverH(),
          new ListTile(
            leading: new Icon(Icons.markunread_mailbox,color: Colors.redAccent,),
            title: new Text('收藏'),
          ),
          new Driver(),
          new ListTile(
            leading: new Icon(Icons.photo,color: Colors.blue,),
            title: new Text('相册'),
          ),
          new Driver(),
          new ListTile(
            leading: new Icon(Icons.credit_card,color: Colors.blue,),
            title: new Text('卡包'),
          ),
          new Driver(),
          new ListTile(
            leading: new Icon(Icons.tag_faces,color: Colors.yellow,),
            title: new Text('表情'),
          ),
          new DriverH(),
          new ListTile(
            leading: new Icon(Icons.settings,color: Colors.blue,),
            title: new Text('设置'),
          ),
        ],
      ),
    );
  }
  
  
}