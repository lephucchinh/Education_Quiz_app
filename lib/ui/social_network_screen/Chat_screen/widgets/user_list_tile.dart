import 'package:chat_repository/chat_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizgames/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:quizgames/blocs/create_message_bloc/create_message_bloc.dart';
import 'package:quizgames/blocs/send_notification_message_bloc/send_notification_message_bloc.dart';
import 'package:user_repository/user_repository.dart';

import '../../../../blocs/get_message_bloc/get_message_bloc.dart';
import '../chat_private_screen/chat_private_screen.dart';

class UserListTile extends StatefulWidget {
  final MyUser user;
  final MyUser myUser;

  const UserListTile({
    super.key,
    required this.user,
    required this.myUser,
  });

  @override
  State<UserListTile> createState() => _UserListTileState();
}

class _UserListTileState extends State<UserListTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => MultiBlocProvider(
                          providers: [
                            BlocProvider(
                              create: (context) => CreateMessageBloc(
                                  myChatRepository: FirebaseChatRepository()),
                            ),
                            BlocProvider(
                              create: (context) => GetMessageBloc(
                                  myChatRepository: FirebaseChatRepository())
                                ..add(StreamGetMessage(
                                    chatId: context
                                                .read<AuthenticationBloc>()
                                                .state
                                                .user!
                                                .uid
                                                .hashCode >=
                                            widget.user.id.hashCode
                                        ? "${context.read<AuthenticationBloc>().state.user!.uid}_${widget.user.id}"
                                        : "${widget.user.id}_${context.read<AuthenticationBloc>().state.user!.uid}")),
                            ),
                            BlocProvider(
                                create: (context) =>
                                    SendNotificationMessageBloc(
                                        myChatRepository:
                                            FirebaseChatRepository()))
                          ],
                          child: ChatPrivateScreen(
                            user: widget.user,
                            myUser: widget.myUser,
                          ),
                        )));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: double.infinity,
              child: ListTile(
                leading: widget.user.picture!.isNotEmpty
                    ? Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(widget.user.picture!),
                            // Sử dụng myUser.picture! để tránh lỗi khi giá trị là null
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                    : Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                title: Text(widget.user.name),
                subtitle: Text('new chat'),
                trailing: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: widget.user.isOnline == true ?Colors.green :Colors.grey ,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
        ),
        Divider(
          color: Colors.grey,
        ),
      ],
    );
  }
}
