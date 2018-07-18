import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:httpdemo/bean/other_user.dart';
import 'package:httpdemo/bean/user_bean.dart';

class TalkPage extends StatefulWidget{
  UserBean user;
  OtherUser otherUser;
  String otherName;
  TalkPage({this.user,this.otherUser,this.otherName});

  @override
  State<StatefulWidget> createState() => TalkPageState();

}

class TalkPageState extends State<TalkPage> with SingleTickerProviderStateMixin{
  TextEditingController _controller;
  TabController _tabcontroller;
  List<String> talkTypes;
  int _offsate = 0;
  bool _offsateSelect = true;
  DatabaseReference reference;
  DatabaseReference otherReference;
 // var value;
  @override
  void initState() {
    _controller = new TextEditingController();
    _tabcontroller = new TabController(length: 2, vsync: this);
    super.initState();
    //firebase的储存路径
    reference = FirebaseDatabase.instance.reference().child('users/'+widget.user.userName+'/messages/'+widget.otherUser.userName+'/message');
    otherReference = FirebaseDatabase.instance.reference().child('users/'+widget.otherUser.userName+'/messages/'+widget.user.userName);
  }
  @override
  void dispose() {
    super.dispose();
    _tabcontroller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        centerTitle: true,
        title: new Text(widget.otherUser.nickName??'用户昵称'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.perm_identity),
            onPressed: null
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          new Expanded(
            child: new FirebaseAnimatedList(
                sort: (DataSnapshot a,DataSnapshot b)=>b.value['time'].compareTo(a.value['time']), //根据数据的时间进行排序
                reverse: true, //在列表视图底部向上展示
                query: reference, //firebase 的查询数据
                itemBuilder: ( BuildContext context,
                DataSnapshot snapshot,
                Animation<double> animation,
                    int index,){
                  if(snapshot.value['userName']==widget.user.userName){
                    return new TalkType(title: snapshot.value['text'],);
                  }else{
                    return new TalkType2(title: snapshot.value['text'],);
                  }
//                  return new TalkType(title: snapshot.value['text']);

                },
            ),
          ),
          new Divider(height: 1.0,color: Colors.black26,),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new IconButton(
                padding: EdgeInsets.all(0.0),
                icon:new Icon(Icons.settings_voice,size: 30.0,),),
              new Expanded(
                child: new TextField(
          //        key: new ValueKey(value=_controller.text),
                  onChanged: (text){
                    if(text.length>0){
                      setState(() {
                        _offsate=1;
                      });
                    }else{
                      setState(() {
                        _offsate=0;
                      });
                    }
                  },
                  decoration: InputDecoration(
                  ),
                  style: new TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                  maxLines: null,
                  controller: _controller,
                  maxLength: 100,
                ),
              ),
              Offstage(
                offstage: _offsate==0,
                child: new IconButton(
                    padding: EdgeInsets.all(0.0),
                    icon: new Icon(
                        Icons.send,size: 30.0,),
                    onPressed: (){
                      reference.push().set({'text':_controller.text,'userName':widget.user.userName,'time':new DateTime.now().toString()});
                      otherReference.child('message').push().set({'text':_controller.text,'userName':widget.user.userName,'time':new DateTime.now().toString()});

                      _controller.clear();
                      setState(() {
                        _offsate=0;
                      });
                    }
                ),
              ),
              new Offstage(
                offstage:_offsate==1 ,
                child:  new IconButton(
                    padding: EdgeInsets.all(0.0),
                    icon: new Icon(Icons.add_circle_outline,size: 30.0,),
                    onPressed: (){
                      _offsateSelect = !_offsateSelect;
                      setState(() {
                      });
                    }
                ),
              ),
              new IconButton(
                  padding: EdgeInsets.all(0.0),
                  icon: new Icon(Icons.insert_emoticon,size: 30.0,),
                  onPressed: null)
            ],
          ),
          new Divider(height: 1.0,),
          new Offstage(
            offstage: _offsateSelect,
            child: Column(
              children: <Widget>[
                Container(
                  height: 180.0,
                  child: new TabBarView(
                    controller: _tabcontroller,
                    children: [
                      new SelectWidget(),
                      new SelectWidget()
                    ]
                  ),
                ),
                new TabPageSelector(
                  controller: _tabcontroller,
                  indicatorSize: 5.0,
                )
              ],
            ) ,
          ),
        ],
      ),
    );
  }

}

class TalkType extends StatelessWidget{ //屏幕上显示的内容

  String title;
  String imageUrl;
  TalkType({this.title,this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Flexible(
          child: new Container(
            decoration: new BoxDecoration(
                color:Colors.lightBlueAccent,
                borderRadius: BorderRadius.all(Radius.circular(5.0))
            ),
            margin: EdgeInsets.only(bottom: 5.0,left: 50.0,right: 10.0),
            child: Padding(
                padding:EdgeInsets.all(10.0),
                child: new Text(
                  title??'这里是内容',
                  maxLines: null,
                )),
          ),
        ),
        new GestureDetector( //头像
          onTap: null,
          child:new Container(
            margin: EdgeInsets.only(right: 10.0,bottom: 10.0),
            child: new Image.asset(imageUrl??'images/meT.jpg',width: 45.0,height: 45.0,),
          ),
        ),
      ],
    );
  }
}


class TalkType2 extends StatelessWidget{ //屏幕上显示的内容,其他用户

  String title;
  String imageUrl;
  TalkType2({this.title,this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new GestureDetector( //头像
          onTap: null,
          child:new Container(
            margin: EdgeInsets.only(left: 10.0,bottom: 10.0),
            child: new Image.asset(imageUrl??'images/meT.jpg',width: 45.0,height: 45.0,),
          ),
        ),
        Flexible(
          child: new Container(
            decoration: new BoxDecoration(
                color:Colors.lightBlueAccent,
                borderRadius: BorderRadius.all(Radius.circular(5.0))
            ),
            margin: EdgeInsets.only(bottom: 5.0,left: 10.0,right: 50.0),
            child: Padding(
                padding:EdgeInsets.all(10.0),
                child: new Text(
                  title??'这里是内容',
                  maxLines: null,
                )),
          ),
        ),

      ],
    );
  }
}



class SelectWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(5.0),
         child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
               new IconCard(title: '照片',ico: Icons.photo,),
               new IconCard(title: '拍摄',ico: Icons.photo_camera,)
              ],
            ),
            new Row(
              children: <Widget>[
                new IconCard(title: '地图',ico: Icons.map,)
              ],
            ),
          ],
        ),
 //     ),
    );
    
  }
  
}


class IconCard extends StatelessWidget{
  IconData ico;
  VoidCallback voidCallback;
  String title;
  TextEditingController controller;

   IconCard({this.ico,this.voidCallback,this.title,this.controller});

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.all(5.0),
        child: new Column(
          children: <Widget>[
            Card(child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: new IconButton(
                icon: new Icon(
                  ico??Icons.photo_camera,
                  size: 30.0,
                ),
                onPressed: voidCallback,
              ),
            )),
            new Text(title??'拍摄',style: new TextStyle(fontSize: 12.0),)
          ],
        )
    );
  }

}


