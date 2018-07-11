import 'package:flutter/material.dart';
import 'message_card.dart';

class MessagePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MessagePageState();
  List<Map<String,String>> _listDates = [{'imageUrl': 'images/gangdan.jpg','title': '钢蛋'},
  {'imageUrl': 'images/kenan.jpeg','title':'柯南君'}];
}

class MessagePageState extends State<MessagePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('微信'),
        actions: <Widget>[
          //new PopupMenuButton(itemBuilder: null)
        ],
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context,int index) => new MessageCard(imageUrl: widget._listDates[index]['imageUrl'],
          title: widget._listDates[index]['title'],
        ),
        itemCount: widget._listDates.length,
      ),
    );
  }

}