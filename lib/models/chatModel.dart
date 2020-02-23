class ChatModel {
  final String name;
  final String time;
  final String avatarURL;
  final String message;
  static const defaultUrl =
      'https://aspire.rit.edu/sites/default/files/styles/image_large_thumbnail/public/default_images/profile-picture-default.png?itok=g_gy_X5Q';
  ChatModel({
    this.name,
    this.time,
    this.avatarURL =
        'https://aspire.rit.edu/sites/default/files/styles/image_large_thumbnail/public/default_images/profile-picture-default.png?itok=g_gy_X5Q',
    this.message,
  });
}

List<ChatModel> dummyData = [
  ChatModel(
      name: 'Contact 1',
      time: '17.50',
      avatarURL:
          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
      message: 'heyya buddy'),
  ChatModel(
      name: 'Contact 2',
      time: '17.12',
      avatarURL:
          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
      message: 'hello'),
  ChatModel(name: 'Contact 3', time: '17.10', message: 'hello'),

  // https://aspire.rit.edu/sites/default/files/styles/image_large_thumbnail/public/default_images/profile-picture-default.png?itok=g_gy_X5Q
];
