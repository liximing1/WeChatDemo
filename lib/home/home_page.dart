import 'package:flutter/material.dart';
import 'package:httpdemo/home/address_page.dart';
import 'package:httpdemo/home/found_page.dart';
import 'package:httpdemo/home/me_page.dart';
import 'message_page.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new HomePageState();
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  TabController tabController;
  List<Widget> list = [MessagePage(),AddressPage(),FoundPage(),MePage()];
  @override
  void initState() {
    // TODO: implement initState
    tabController = new TabController(length: list.length, vsync: this);
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TabBarView(
        children: list,
        controller: tabController,
      ),
      bottomNavigationBar: new TabBar(
        labelColor: Colors.green,
        unselectedLabelColor: Colors.black26,
        indicatorColor: new Color.fromARGB(0, 0, 0, 0),
        controller: tabController,
        tabs: [
          BottomType(Icons.message, '信息'),
          BottomType(Icons.contact_phone,'通讯录'),
          BottomType(Icons.network_check,'发现'),
          BottomType(Icons.perm_identity, '我')
        ],
      )
    );
  }

  Widget BottomType(IconData icon,String title){
    return new Container(
        height: 44.0,
        child: new Column(
        children: <Widget>[
        new Icon(icon),
        new Text(title,style: new TextStyle(color: Colors.black26,fontSize: 12.0),)
       ],
      ),
    );
  }

}


