import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/call_screen.dart';
import 'package:whatsapp_clone/pages/camera_page.dart';
import 'package:whatsapp_clone/pages/chat_screen.dart';
import 'package:whatsapp_clone/pages/status_screen.dart';
import './models/PopupMenu.dart';

class WhatsAppCloneHome extends StatefulWidget {
  final List<CameraDescription> cameras;
  WhatsAppCloneHome({this.cameras});
  @override
  _WhatsAppCloneHomeState createState() => _WhatsAppCloneHomeState();
}

class _WhatsAppCloneHomeState extends State<WhatsAppCloneHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  var fabN = 1, fabb;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);

    _tabController.addListener(() {
      if (_tabController.index == 0) {
        fabN = 0;
      }
      if (_tabController.index == 1) {
        fabN = 1;
      }
      if (_tabController.index == 2) {
        fabN = 2;
      }
      if (_tabController.index == 3) {
        fabN = 3;
      }
      setState(() {});
    });
  }

  final chatMenu = PMenu.menu
      .map((String title) => PopupMenuItem(value: title, child: Text(title)))
      .toList();
  final statusMenu = PSMenu.menu
      .map((String title) => PopupMenuItem(value: title, child: Text(title)))
      .toList();
  final callMenu = PCallMenu.menu
      .map((String title) => PopupMenuItem(value: title, child: Text(title)))
      .toList();
  @override
  Widget build(BuildContext context) {
    print('in scaffold:$fabN');
    return Scaffold(
      appBar: fabN == 0
          ? null
          : AppBar(
              elevation: 0.7,
              title: Text("WhatsAppClone"),
              actions: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: PopupMenuButton(
                        itemBuilder: (context) => fabN == 1
                            ? chatMenu
                            : fabN == 2
                                ? statusMenu
                                : fabN == 3 ? callMenu : chatMenu))
              ],
              bottom: TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.white,
                  tabs: <Widget>[
                    Tab(icon: Icon(Icons.camera_alt)),
                    Tab(text: "CHATS"),
                    Tab(text: "STATUS"),
                    Tab(text: "CALLS"),
                  ]),
            ),
      body: Center(
        child: TabBarView(controller: _tabController, children: <Widget>[
          CameraScreen(widget.cameras),
          ChatScreen(),
          StatusScreen(),
          CallScreen(),
        ]),
      ),
      floatingActionButton: fabN != 0
          ? fabN == 1
              ? FAB(Icons.message)
              : fabN == 2
                  ? FAB(Icons.camera_alt, widget.cameras)
                  : FAB(Icons.add_call)
          : null,
    );
  }
}

class FAB extends StatelessWidget {
  final type;
  final List<CameraDescription> cameras;
  FAB(this.type, [this.cameras]);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(
          type,
          color: Colors.white,
        ),
        onPressed: () {
          if (type == Icons.camera_alt) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => CameraScreen(cameras)));
          }
        });
  }
}
