import 'package:flutter/material.dart';
import 'package:httpdemo/bean/other_user.dart';
import 'package:httpdemo/bean/user_bean.dart';
import 'message_card.dart';
import 'package:firebase_database/firebase_database.dart';

class MessagePage extends StatefulWidget{
  UserBean user;
  OtherUser otherUser;
  MessagePage({this.user,this.otherUser});

  List<Map<String,String>> _listDates = [{'imageUrl': 'images/gangdan.jpg','title': '钢蛋'},
  {'imageUrl': 'images/kenan.jpeg','title':'柯南君'}];
  @override
  State<StatefulWidget> createState() => MessagePageState();

}

class MessagePageState extends State<MessagePage>{
  UserBean user;
  OtherUser otherUser;
  DatabaseReference databaseReference;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = widget.user;
    otherUser = widget.otherUser;
    databaseReference = FirebaseDatabase.instance.reference().child('users/'+ user.UserName+'/messages');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('微信'),
        actions: <Widget>[
          new PopupMenuButton(

            icon: new Icon(Icons.add),
            itemBuilder: (BuildContext context)=><PopupMenuItem>[
              new PopupMenuItem(
                child: new ListTile(
                  leading: new Icon(Icons.add),
                  title: new Text('添加会话'),
                  onTap: (){ showDialog(context: context,builder: (BuildContext context)=>new AlertDialog(
                    title: new Text('添加会话'),
                    content: new Container(
                      child: new TextField(
                        decoration: InputDecoration(
                          labelText: '请输入账号或昵称'
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      new FlatButton.icon(onPressed: (){

                      },
                          icon: Icon(Icons.find_in_page,color: Colors.blue,),
                          label: new Text('查找')
                      ),
                    ],
                  ));},
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context,int index) => new MessageCard(imageUrl: widget._listDates[index]['imageUrl'],
          title: widget._listDates[index]['title'],
          user: widget.user,
        ),
        itemCount: widget._listDates.length,
      ),
    );
  }

}