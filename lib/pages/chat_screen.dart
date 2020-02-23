import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/Chat.dart';
import '../models/chatModel.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dummyData.length,
        itemBuilder: (context, i) => Column(
              children: <Widget>[
                Divider(height: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext contexxt) =>
                                Chat(dummyData[i])));
                    print('tapped');
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      foregroundColor: Theme.of(context).primaryColor,
                      backgroundColor: Colors.grey,
                      radius: 25.0,
                      backgroundImage: NetworkImage(dummyData[i].avatarURL),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(dummyData[i].name,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(dummyData[i].time,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.grey))
                      ],
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        dummyData[i].message,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ));
  }
}
