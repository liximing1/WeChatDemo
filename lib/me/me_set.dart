import 'package:flutter/material.dart';

class MeSet extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>new MeSetState();

}

class MeSetState extends State<MeSet>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('个人信息'),
        centerTitle: true,
      ),
      body:new Container(
        color: Colors.black12,
        child:new ListView(
          children: <Widget>[

          ],
        ) ,
      ),
    );
  }

}