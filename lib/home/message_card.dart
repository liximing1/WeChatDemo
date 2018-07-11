import 'package:flutter/material.dart';
import 'talk_page.dart';

class MessageCard extends StatelessWidget{
  String imageUrl;
  String title;
  String subTitle;
  var messageTime;
  bool offstage;
  MessageCard({this.imageUrl,this.title,this.subTitle,this.messageTime,this.offstage=false});


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
      child: new ListTile(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder:(context)=> new TalkPage()));
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