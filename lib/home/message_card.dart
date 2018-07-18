import 'package:flutter/material.dart';
import 'package:httpdemo/bean/other_user.dart';
import 'package:httpdemo/bean/user_bean.dart';
import 'talk_page.dart';
import 'package:firebase_database/firebase_database.dart';

class MessageCard extends StatelessWidget{
  String imageUrl;
  String title;
  String subTitle;
  var messageTime;
  bool offstage;
  UserBean user;
  OtherUser otherUser;
  MessageCard({this.imageUrl,this.title,this.subTitle,this.messageTime,this.offstage=false,this.user});



  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
      child: new ListTile(
        onTap: (){
          DatabaseReference reference = FirebaseDatabase.instance.reference().child('users/'+subTitle);

          reference.once().then((DataSnapshot onValue){

            otherUser = new OtherUser(userName: onValue.value['username'],nickName: onValue.value['nickName']);

            Navigator.of(context).push(MaterialPageRoute(builder:(context)=> new TalkPage(user: user,otherUser: otherUser,)));
          });
        },
        leading: new Image.asset(imageUrl??'images/gangdan.jpg',width: 45.0,height: 45.0,),
        title: new Text(title??'标题',style: new TextStyle(fontSize: 15.0),),
        subtitle: new Text(subTitle??'副标题',style: new TextStyle(fontSize: 12.0),),
        trailing: new Container(
          child: new Column(
            children: <Widget>[
              new Text(messageTime??'消息时间',style: new TextStyle(fontSize: 12.0),),
              new Offstage(
                offstage: offstage,
                child: new Icon(Icons.notifications_off),
              )
            ],
          ),
        ),
      ),
    );
  }



}