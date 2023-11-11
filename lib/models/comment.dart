class Comment {
  final String commentText;
  final String time;
  final String username;
  final String date;
  final String profilePictureUrl;
  final bool reply;

  Comment(
      {required this.commentText,
      required this.time,
      required this.username,
      required this.date,
      required this.profilePictureUrl,
      required this.reply});
}

List<Comment> Samplecomments = [
  Comment(
      commentText:
          'Lorem ipsum dolor sit amet consectetur. Aliquam sagittis ullamcorper      amet justo quisque          ullamcorper volutpat. Donec feugiat diam et tellus in habitant viverra duis. ',
      time: '3 hours ago',
      username: '@Kerryjo',
      date: 'Kerry Johns',
      profilePictureUrl: 'assets/Ellipse 8.png',
      reply: true),
  Comment(
      commentText:
          'Lorem ipsum dolor sit amet consectetur. Aliquam sagittis ullamcorper      amet justo duis. ',
      time: '8 hour ago',
       username: '@Kerryjo',
      date: 'Kerry Johns',
      profilePictureUrl: 'assets/Ellipse 8 (1).png',
      reply: false),
  Comment(
      commentText:
          'Lorem ipsum dolor sit amet consectetur. Aliquam sagittis ullamcorper      amet justo quisque          ullamcorper volutpat. Donec feugiat diam et tellus in habitant viverra duis. ',
      time: '3 hour ago',
       username: '@Kerryjo',
      date: 'Kerry Johns',
      profilePictureUrl: 'assets/Ellipse 8 (2).png',
      reply: true),
  Comment(
      commentText:
          'Lorem ipsum dolor sit amet consectetur. Aliquam sagittis ullamcorper      amet justo duis. ',
      time: '8 hour ago',
       username: '@Kerryjo',
      date: 'Kerry Johns',
      profilePictureUrl: 'assets/Ellipse 8 (3).png',
      reply: true),
];
