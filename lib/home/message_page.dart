import 'package:flutter/material.dart';
import 'package:httpdemo/bean/other_user.dart';
import 'package:httpdemo/bean/user_bean.dart';
import 'package:httpdemo/home/talk_page.dart';
import 'message_card.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

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
  DatabaseReference _databaseReference;
  TextEditingController _textEditingController;
  String _errText;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = widget.user;
    _databaseReference = FirebaseDatabase.instance.reference().child('users');
    _textEditingController = new TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textEditingController.dispose();
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
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          labelText: '请输入账号查找',
                          errorText: _errText,
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      new FlatButton.icon(onPressed: (){
                        _databaseReference.child(_textEditingController.text).once().then((DataSnapshot onValue){
                          if(onValue==null){
                            setState(() {
                              _errText = '账号不存在';
                            });
                          }else{
                            otherUser = new OtherUser(userName: onValue.value['username']
                            ,nickName: onValue.value['nickName']
                            );
                            _databaseReference.child(user.userName+'/messages/'+otherUser.userName).set({'userName':otherUser.userName,'nickName':otherUser.nickName});
                            _databaseReference.child(onValue.value['username']).child('messages/'+user.userName).set({'nickName':user.nickName,'userName':user.userName});
                            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new TalkPage(
                              user: user,
                              otherUser:otherUser
                            )));
                          }
                        });
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
      body: new FirebaseAnimatedList(
        sort: (a,b)=>b.key.compareTo((a.key)),
        query: _databaseReference.child(widget.user.userName).child('messages'),
        itemBuilder: (BuildContext context,DataSnapshot snapshot,Animation<double> animation,int index)=>new MessageCard(
          title:snapshot.value['nickName']??'昵称',user: user,subTitle: snapshot.value['userName'],
        ),
      ),
    );
  }

}