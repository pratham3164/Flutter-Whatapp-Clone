import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chatModel.dart';

class CallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 25,
            backgroundImage: NetworkImage(ChatModel.defaultUrl),
          ),
          title: Text(
            dummyData[0].name,
            style: TextStyle(fontSize: 18),
          ),
          subtitle: Row(
            children: <Widget>[
              Icon(
                Icons.call_made,
                size: 14,
                color: Colors.green,
              ),
              Text(
                '8 February, 6:49 pm',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          trailing: Icon(Icons.call, color: Color(0xff075e54)),
        )
      ],
    ));
  }
}
