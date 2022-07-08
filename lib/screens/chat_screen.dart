import 'package:flutter/material.dart';
import 'package:nice_chat_app_ui/models/messages.dart';

import '../models/user.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({required this.user, Key? key}) : super(key: key);

  final User user;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> messages = [
    Message(
      sender: Message.james,
      time: '5:30 PM ',
      text: 'Hey , how\'s it going ? What did you do today ?',
      isLiked: false,
      unread: true,
    ),
    Message(
      sender: Message.currentUser,
      time: '5:31 PM ',
      text: 'Hi !',
      isLiked: false,
      unread: true,
    ),
    Message(
      sender: Message.currentUser,
      time: '5:31 PM',
      text: 'Well my day was good what about u?',
      isLiked: false,
      unread: false,
    ),
    Message(
      sender: Message.james,
      time: '5:32 PM',
      text: 'I had a great day, so do you want to go out and eat shawrama',
      isLiked: false,
      unread: true,
    ),
    Message(
      sender: Message.currentUser,
      time: '5:33 PM',
      text: 'is this a question, of course yea!!',
      isLiked: false,
      unread: false,
    ),
    Message(
      sender: Message.james,
      time: '5:33 PM',
      text: 'good , lets go Now',
      isLiked: false,
      unread: false,
    ),
    Message(
      sender: Message.currentUser,
      time: '5:33 PM',
      text: 'give me a sec. I want to get dressed first',
      isLiked: false,
      unread: false,
    ),
    Message(
      sender: Message.james,
      time: '5:33 PM',
      text: 'ok i\'ll wait',
      isLiked: false,
      unread: false,
    ),
    Message(
      sender: Message.currentUser,
      time: '5:37 PM',
      text: 'lets goo ',
      isLiked: false,
      unread: false,
    ),
  ]..reversed.toList();

  _buildMessage(Message message, bool isMe) {
    return Row(
      children: [
        if (isMe) const Spacer(),
        Container(
          width: MediaQuery.of(context).size.width * .75,
          margin: isMe
              ? const EdgeInsets.only(top: 8, bottom: 8, left: 8)
              : const EdgeInsets.only(top: 8, bottom: 8, right: 8),
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 15,
          ),
          decoration: BoxDecoration(
            color: isMe
                ? Theme.of(context).colorScheme.secondary
                : const Color(0xFFFFEFEE),
            borderRadius: isMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.time,
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(message.text),
            ],
          ),
        ),
        if (!isMe)
          IconButton(
            icon: message.isLiked
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border),
            iconSize: 30,
            color: message.isLiked ? Colors.red : Colors.blueGrey,
            onPressed: () {
              setState(() {
                message.isLiked = !message.isLiked;
              });
            },
          )
      ],
    );
  }

  _buildChatBottom() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.photo),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          const Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          )
        ],
      ),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.user.name,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz),
            iconSize: 30,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: ListView.builder(
                   reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final Message message = messages[index];
                    final isMe = message.sender.id == Message.currentUser.id;
                    return _buildMessage(message, isMe);
                  },
                ),
              ),
            ),
            _buildChatBottom(),
          ],
        ),
      ),
    );
  }
}
