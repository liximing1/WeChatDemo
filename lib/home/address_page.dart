import 'package:flutter/material.dart';

class AddressPage extends StatelessWidget{
  ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('通讯录'),
        centerTitle: true,
        actions: <Widget>[
          //new PopupMenuButton(itemBuilder: null)
        ],
      ),
     body:new Stack(
       children: <Widget>[
         Container(
           child: new ListView.builder(
             controller: scrollController,
             itemCount: 10,
             itemBuilder: (BuildContext context,int index)=>new AddressBody(),
           ),
         ),
         new Positioned( //控制子部件的堆栈位置
           right: 0.0,
           top: 35.0,
           child:new Column(
            children: <Widget>[
               new WordIcon('A'),
               new WordIcon('B'),
               new WordIcon('C'),
               new WordIcon('D'),
               new WordIcon('E'),
               new WordIcon('F'),
               new WordIcon('G'),
               new WordIcon('H'),
               new WordIcon('I'),
               new WordIcon('J'),
               new WordIcon('K'),
               new WordIcon('L'),
               new WordIcon('M'),
               new WordIcon('N'),
               new WordIcon('O'),
               new WordIcon('P'),
               new WordIcon('Q'),
               new WordIcon('R'),
               new WordIcon('S'),
               new WordIcon('T'),
               new WordIcon('U'),
               new WordIcon('V'),
               new WordIcon('W'),
               new WordIcon('X'),
               new WordIcon('Y'),
               new WordIcon('Z'),
           ],
         )),
         new Container(
           height: 30.0,
           child: new AppBar(
             backgroundColor: Colors.black26,
             title: new Text('A'),
           ),
         ),
         new Offstage(
           offstage: true,
           child: Center(
             child: new Container(
               height: 50.0,
               width: 50.0,
               color: Colors.black26,
             ),
           ),
         ),
       ],
     ),

    );
  }

}


class AddressBody extends StatelessWidget{

  List<Widget> listBuilder = [ListBuilderBar(),ListBuilderType(),Driver(),ListBuilderType()];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Column(
        children: listBuilder,
      ),
    );
  }

}

class ListBuilderBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      color: Colors.black12,
      child: Row(
        children: <Widget>[
          new Text('A',textAlign: TextAlign.start,),
        ],
      ),

    );
  }

}

class ListBuilderType extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new ListTile(
          leading: new Icon(Icons.add_circle),
          title: new Text('name'),
        ),

      ],
    );
  }
  
}

class Driver extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  new Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      height: 1.0,
      color: Colors.black12,
    );
  }

}

class WordIcon extends StatelessWidget{
  String title;
  WordIcon(this.title);
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      width: 30.0,
      height: 15.0,
      child: new FlatButton(
        onPressed: null, 
        child: new Text(title??'',style: new TextStyle(color: Colors.black,fontSize: 12.0),)),
    );
  }

}
