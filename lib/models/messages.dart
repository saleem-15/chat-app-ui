import 'user.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  bool isLiked;
  final bool unread;

  Message({
    required this.isLiked,
    required this.sender,
    required this.text,
    required this.time,
    required this.unread,
  });

//me
  static User currentUser = User(
    id: 0,
    name: 'Current User',
    imageUrl: 'assets/images/james.jpg',
  );

  //USERS
  static User james = User(
    id: 1,
    name: 'james',
    imageUrl: 'assets/images/james.jpg',
  );

  static User john = User(
    id: 2,
    name: 'john',
    imageUrl: 'assets/images/john.jpg',
  );

  static User greg = User(
    id: 3,
    name: 'greg',
    imageUrl: 'assets/images/greg.jpg',
  );

  static User olivia = User(
    id: 4,
    name: 'Olivia',
    imageUrl: 'assets/images/olivia.jpg',
  );

  static User sam = User(
    id: 5,
    name: 'Sam',
    imageUrl: 'assets/images/sam.jpg',
  );

  static User sophia = User(
    id: 6,
    name: 'Sophia',
    imageUrl: 'assets/images/sophia.jpg',
  );

  static User steven = User(
    id: 7,
    name: 'Steven',
    imageUrl: 'assets/images/steven.jpg',
  );

  static List<User> favorites = [sam, steven, olivia, john, greg];

  static List<Message> chats = [
    Message(
      sender: james,
      time: '5:30 PM ',
      text: 'Hey , how\'s it going ? What did you do today ?',
      isLiked: false,
      unread: true,
    ),
    Message(
      sender: olivia,
      time: '4:30 PM ',
      text: 'Hey , how\'s it going ? What did you do today ?',
      isLiked: false,
      unread: true,
    ),
    Message(
      sender: john,
      time: '3:30 PM',
      text: ' Hey , how \'s it going ? What did you do today ? ',
      isLiked: false,
      unread: false,
    ),
    Message(
      sender: sophia,
      time: '2:30 PM',
      text: ' Hey , how\'s it going ? What did you do today ? ',
      isLiked: false,
      unread: true,
    ),
    Message(
      sender: steven,
      time: '1:30 PM',
      text: ' Hey , how\'s it going ? What did you do today ? ',
      isLiked: false,
      unread: false,
    ),
    Message(
      sender: sam,
      time: '12:30 PM',
      text: ' Hey , how\'s it going ? What did you do today ? ',
      isLiked: false,
      unread: false,
    ),
    Message(
      sender: greg,
      time: '11:30 PM',
      text: ' Hey , how\'s it going ? What did you do today ? ',
      isLiked: false,
      unread: false,
    ),
  ];
}
