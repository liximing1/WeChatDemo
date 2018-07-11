import 'package:flutter/material.dart';
import 'package:httpdemo/home/address_page.dart';

class FoundPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('发现'),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            leading: new Icon(Icons.camera,color: Colors.deepOrangeAccent,),
            title: new Text('朋友圈'),
          ),
          new DriverH(),
          new ListTile(
            leading: new Icon(Icons.surround_sound,color: Colors.blue,),
            title: new Text('扫一扫'),
          ),
          new Driver(),
          new ListTile(
            leading: new Icon(Icons.crop_rotate,color: Colors.blue,),
            title: new Text('摇一摇'),
          ),
          new DriverH(),
          new ListTile(
            leading: new Icon(Icons.looks,color: Colors.yellow,),
            title: new Text('看一看'),
          ),
          new Driver(),
          new ListTile(
            leading: new Icon(Icons.filter_vintage,color: Colors.redAccent,),
            title: new Text('搜一搜'),
          ),
          new DriverH(),
          new ListTile(
            leading: new Icon(Icons.people,color: Colors.blue,),
            title: new Text('附近的人'),
          ),
          new DriverH(),
          new ListTile(
            leading: new Icon(Icons.shopping_basket,color: Colors.red,),
            title: new Text('购物'),
          ),
          new Driver(),
          new ListTile(
            leading: new Icon(Icons.games,color: Colors.green,),
            title: new Text('游戏'),
          ),
          new Driver(),
          new ListTile(
            leading: new Icon(Icons.keyboard_hide,color: Colors.blueAccent,),
            title: new Text('小程序'),
          ),
        ],
      ),
    );
  }

}

class DriverH extends StatelessWidget{
  double height;
  double margin;
  DriverH({this.height,this.margin});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin??0.0),
      height: height??25.0,
      color: Colors.black12,
    );
  }

}