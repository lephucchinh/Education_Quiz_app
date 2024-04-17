import 'package:chat_repository/chat_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizgames/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:quizgames/blocs/create_message_bloc/create_message_bloc.dart';
import 'package:quizgames/blocs/create_message_bloc/create_message_bloc.dart';
import 'package:quizgames/blocs/delete_chat_bloc/delete_chat_bloc.dart';
import 'package:user_repository/user_repository.dart';

class ChatCard extends StatefulWidget {
  final Chat chat;
  final MyUser myUser;
  final MyUser user;

  const ChatCard(
      {super.key,
      required this.chat,
      required this.myUser,
      required this.user});

  @override
  State<ChatCard> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  @override
  Widget build(BuildContext context) {
    final double threshold = MediaQuery.of(context).size.width * 0.6;

    if (widget.chat.userSendID ==
        context.read<AuthenticationBloc>().state.user!.uid) {
      return GestureDetector(
        onLongPress: () {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text('Cảnh báo'),
                  content: Text('Bạn có muốn xóa tin nhắn này ?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.read<DeleteChatBloc>().add(DeleteChat(
                            chatID: widget.chat.chatID!,
                            send: widget.chat.send));
                        print(widget.chat.send.toIso8601String());
                        Navigator.pop(context);
                      },
                      child: Text('Ok'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                  ],
                );
              });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            widget.chat.type == 'image'
                ? BlocBuilder<CreateMessageBloc, CreateMessageState>(
                    builder: (context, state) {
                      if(state is CreateMessageFailure) {
                        return Container();
                      } else if (state is CreateMessageProgress) {
                        return CircularProgressIndicator();
                      } else {
                        return SizedBox(
                          width: 200,
                          height: 300,
                          child: Image.network(widget.chat.chat!),
                        );
                      }
                    },
                  )
                : Container(
                    width: widget.chat.chat!.length > 40 ? threshold : null,
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      widget.chat.chat!,
                      softWrap: true,
                      maxLines: null,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                    ),
                  ),
            const SizedBox(width: 10,),
            widget.myUser.picture == ''
                ? Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  )
                : Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                              widget.myUser.picture.toString(),
                            ),
                            fit: BoxFit.cover)),
                  ),
          ],
        ),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          widget.user.picture == ''
              ? Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                )
              : Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                            widget.user.picture.toString(),
                          ),
                          fit: BoxFit.cover)),
                ),
          const SizedBox(width: 10,),
          widget.chat.type == 'image'
              ? SizedBox(
                  width: 200,
                  height: 300,
                  child: Image.network(widget.chat.chat!),
                )
              : Container(
                  width: widget.chat.chat!.length > 30 ? threshold : null,
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    widget.chat.chat!,
                    softWrap: true,
                    maxLines: null,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                  ),
                ),
        ],
      );
    }
  }
}
