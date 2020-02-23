import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = StoryController();
    final List<StoryItem> storyItems = [
      StoryItem.text("Hii", Colors.red),
      StoryItem.pageImage(
        NetworkImage(
            'https://i.pinimg.com/564x/40/23/9f/40239f09eac5be88598bd35b5ec6778a.jpg'),
      ),
      StoryItem.pageGif(
          'https://i.pinimg.com/originals/09/eb/e7/09ebe79bc506d02cbe4cb829c8286810.gif')
    ];
    return Material(
      child: StoryView(
        storyItems,
        controller: _controller,
        inline: false,
        repeat: true,
      ),
    );
  }
}
