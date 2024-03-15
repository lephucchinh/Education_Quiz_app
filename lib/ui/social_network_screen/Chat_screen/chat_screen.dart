import 'package:flutter/material.dart';
import 'package:quizgames/ui/social_network_screen/Chat_screen/widgets/user_list_tile.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('We Chat'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: ListView.builder(

        itemBuilder: (BuildContext context, int index) {
          return UserListTile();
        },

      ),
    );
  }
}
