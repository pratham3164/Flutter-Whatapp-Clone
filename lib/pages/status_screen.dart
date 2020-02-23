import 'package:flutter/material.dart';

import 'StoryPageView.dart';

class StatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xfff2f2f2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Stack(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage(
                            'https://aspire.rit.edu/sites/default/files/styles/image_large_thumbnail/public/default_images/profile-picture-default.png?itok=g_gy_X5Q'),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 1.0,
                          child: Container(
                            height: 20,
                            width: 20,
                            child:
                                Icon(Icons.add, color: Colors.white, size: 15),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.green),
                          )),
                    ],
                  ),
                  title: Text("My Status",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Tap to add Status Update'),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Viewed Updates',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                )),
            Expanded(
              child: Container(
                color: Colors.white,
                child: ListTile(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => StoryPageView())),
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(
                        'https://aspire.rit.edu/sites/default/files/styles/image_large_thumbnail/public/default_images/profile-picture-default.png?itok=g_gy_X5Q'),
                  ),
                  title: Text("P.M.",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Today, 20:30 PM'),
                ),
              ),
            ),
          ],
        ));
  }
}
