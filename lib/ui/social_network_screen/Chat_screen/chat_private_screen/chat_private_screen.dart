import 'package:flutter/material.dart';

class ChatPrivateScreen extends StatefulWidget {
  const ChatPrivateScreen({super.key});

  @override
  State<ChatPrivateScreen> createState() => _ChatPrivateScreenState();
}

class _ChatPrivateScreenState extends State<ChatPrivateScreen> {
  bool field = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        title: Text('Name'),
      ),
      body: Container(
        color: Colors.cyan,
      ),
      bottomSheet: Container(
        child: Row(children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt)),
          Expanded(child: TextFormField(

          )),
          IconButton(onPressed: () {}, icon: Icon(Icons.send)),
        ],),
      ),
    );
  }
}
