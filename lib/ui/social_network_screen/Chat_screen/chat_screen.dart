import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizgames/blocs/get_all_user_chat/get_all_user_bloc.dart';
import 'package:quizgames/blocs/get_comment_post_bloc/get_comment_post_bloc.dart';
import 'package:quizgames/ui/social_network_screen/Chat_screen/widgets/user_list_tile.dart';
import 'package:user_repository/user_repository.dart';

class ChatScreen extends StatefulWidget {
  final MyUser myUser;
  const ChatScreen({super.key, required this.myUser});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllUserBloc, GetAllUserState>(
      builder: (context, state) {
        if(state is GetAllUserSuccess){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme
                  .of(context)
                  .colorScheme
                  .primary,
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
              itemCount: state.listUsers.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return UserListTile(user: state.listUsers[index], myUser: widget.myUser,
                );
              },

            ),
          );
        } else if (state is GetCommentPostFailure) {
          return Center(child: Text('error'));
        } else {
          return Container();
        }

      },
    );
  }
}
