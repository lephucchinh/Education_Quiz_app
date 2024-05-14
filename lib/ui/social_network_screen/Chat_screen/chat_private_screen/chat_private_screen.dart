import 'package:chat_repository/chat_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quizgames/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:quizgames/blocs/create_message_bloc/create_message_bloc.dart';
import 'package:quizgames/blocs/delete_chat_bloc/delete_chat_bloc.dart';
import 'package:quizgames/blocs/get_message_bloc/get_message_bloc.dart';
import 'package:quizgames/blocs/get_message_bloc/get_message_bloc.dart';
import 'package:quizgames/blocs/send_notification_message_bloc/send_notification_message_bloc.dart';
import 'package:quizgames/ui/social_network_screen/Chat_screen/chat_private_screen/widget/chat_card.dart';
import 'package:user_repository/user_repository.dart';

class ChatPrivateScreen extends StatefulWidget {
  final MyUser user;
  final MyUser myUser;

  const ChatPrivateScreen(
      {super.key, required this.user, required this.myUser});

  @override
  State<ChatPrivateScreen> createState() => _ChatPrivateScreenState();
}

class _ChatPrivateScreenState extends State<ChatPrivateScreen> {
  bool field = false;
  late Chat chat;
  late ScrollController _scrollController;
  final messageController = TextEditingController();

  @override
  void initState() {
    chat = Chat.empty;
    _scrollController = ScrollController();

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateMessageBloc, CreateMessageState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new)),
              title: Text(widget.user.name),
            ),
            body: Column(
              children: [
                BlocBuilder<GetMessageBloc, GetMessageState>(
                  builder: (context, state) {
                    if (state is GetMessageSuccess) {
                      return Expanded(
                        child: ListView.builder(
                            controller: _scrollController,
                            shrinkWrap: true,
                            itemCount: state.listChat.length,
                            itemBuilder: (BuildContext context, int index) {
                              WidgetsBinding.instance!
                                  .addPostFrameCallback((_) {
                                _scrollController.jumpTo(
                                    _scrollController.position.maxScrollExtent);
                              });
                              return BlocProvider(
                                create: (context) => DeleteChatBloc(
                                    myChatRepository: FirebaseChatRepository()),
                                child: ChatCard(
                                  chat: state.listChat[index],
                                  myUser: widget.myUser,
                                  user: widget.user,
                                ),
                              );
                            }),
                      );
                    } else {
                      return Expanded(child: Container());
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Card(
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () async {
                              final ImagePicker picker = ImagePicker();
                              final XFile? image = await picker.pickImage(
                                  source: ImageSource.camera);
                              if (image != null) {
                                chat.chat = "";
                                chat.chatID = "";
                                chat.userSendID = context
                                    .read<AuthenticationBloc>()
                                    .state
                                    .user
                                    ?.uid;
                                chat.userReceiveID = widget.user.id;
                                chat.type = 'image';
                                chat.send = DateTime.now();
                                chat.read = DateTime.now();
                                context.read<CreateMessageBloc>().add(
                                    CreateImageMessage(
                                        chat: chat, image: image.path));
                                if (state is CreateMessageSuccess) {
                                  context
                                      .read<SendNotificationMessageBloc>()
                                      .add(SendNotificationMessage(
                                      token: widget.user.token!,
                                      chat: chat,
                                      name: widget.myUser.name));
                                }
                              }
                            },
                            icon: Icon(Icons.camera_alt)),
                        IconButton(
                            onPressed: () async {
                              final ImagePicker picker = ImagePicker();
                              final List<XFile?> image =
                                  await picker.pickMultiImage(imageQuality: 70);
                              for (var i in image) {
                                chat.chat = "";
                                chat.chatID = "";
                                chat.userSendID = context
                                    .read<AuthenticationBloc>()
                                    .state
                                    .user
                                    ?.uid;
                                chat.userReceiveID = widget.user.id;
                                chat.type = 'image';
                                chat.send = DateTime.now();
                                chat.read = DateTime.now();
                                context.read<CreateMessageBloc>().add(
                                    CreateImageMessage(
                                        chat: chat, image: i!.path));
                                if (state is CreateMessageSuccess) {
                                  context
                                      .read<SendNotificationMessageBloc>()
                                      .add(SendNotificationMessage(
                                      token: widget.user.token!,
                                      chat: chat,
                                      name: widget.myUser.name));
                                }
                              }
                            },
                            icon: Icon(Icons.image)),
                        Expanded(
                            child: TextFormField(
                          controller: messageController,
                          maxLines: null,
                          style: TextStyle(fontSize: 16.0),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black12,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 15),
                            hintText: 'Aa',
                            hintStyle: TextStyle(fontSize: 16.0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        )),
                        IconButton(
                            onPressed: () {
                              if (messageController.text.isNotEmpty) {
                                FocusScope.of(context).unfocus();
                                chat.chat = messageController.text;
                                chat.chatID = "";
                                chat.userSendID = context
                                    .read<AuthenticationBloc>()
                                    .state
                                    .user
                                    ?.uid;
                                chat.userReceiveID = widget.user.id;
                                chat.type = 'text';
                                chat.send = DateTime.now();
                                chat.read = DateTime.now();

                                context
                                    .read<CreateMessageBloc>()
                                    .add(CreateMessage(chat: chat));
                                messageController.text = '';
                                if (state is CreateMessageSuccess) {
                                  context
                                      .read<SendNotificationMessageBloc>()
                                      .add(SendNotificationMessage(
                                          token: widget.user.token!,
                                          chat: chat,
                                          name: widget.myUser.name));
                                }
                              }
                            },
                            icon: Icon(Icons.send)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
