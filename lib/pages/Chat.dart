import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/PopupMenu.dart';
import 'package:whatsapp_clone/models/chatModel.dart';

class Chat extends StatefulWidget {
  final ChatModel userData;
  Chat(this.userData);

  @override
  _ChatState createState() => _ChatState(userData);
}

class _ChatState extends State<Chat> {
  final ChatModel userData;
  _ChatState(this.userData);
  @override
  Widget build(BuildContext context) {
    final topBar = Theme(
      data: ThemeData(iconTheme: IconThemeData(color: Colors.white)),
      child: Container(
        padding: EdgeInsets.all(5.0),
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                  ),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(userData.avatarURL),
                  radius: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        userData.name,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        'Online',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.videocam),
                SizedBox(width: 18),
                Icon(Icons.call),
                SizedBox(width: 10),
                PopupMenuButton(
                    itemBuilder: (BuildContext context) => PCMenu.menu
                        .map((String title) =>
                            PopupMenuItem(value: title, child: Text(title)))
                        .toList())
              ],
            ),
          ],
        ),
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[topBar, Expanded(child: ChatBody())],
        ),
      ),
    );
  }
}

class ChatBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final roundednInput = ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: 8),
            Icon(Icons.insert_emoticon,
                size: 30, color: Theme.of(context).hintColor),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                textInputAction: TextInputAction.newline,
                minLines: 1,
                maxLines: 300,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  hintText: "Type a message",
                  border: InputBorder.none,
                ),
              ),
            ),
            Icon(Icons.attach_file,
                size: 30, color: Theme.of(context).hintColor),
            SizedBox(width: 8),
            Icon(Icons.camera_alt,
                size: 30, color: Theme.of(context).hintColor),
            SizedBox(width: 8),
          ],
        ),
      ),
    );

    final inputBar = Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(child: roundednInput),
          SizedBox(
            width: 5.0,
          ),
          GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                  radius: 25,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Icon(Icons.send, color: Colors.white, size: 20),
                  ),
                  backgroundColor: Theme.of(context).primaryColor))
        ],
      ),
    );

    return Container(
        color: Colors.green,
        child: Align(alignment: Alignment.bottomCenter, child: inputBar));
  }
}
