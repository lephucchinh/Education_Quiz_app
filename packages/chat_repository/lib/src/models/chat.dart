import 'package:chat_repository/src/entity/chat_entity.dart';
import 'package:user_repository/user_repository.dart';

class Chat {
  String? chat;
  String? chatID;
  String? userSendID;
  String? userReceiveID;
  String? type;
  DateTime send;
  DateTime read;

  Chat({
    required this.chat,
    required this.chatID,
    required this.userSendID,
    required this.userReceiveID,
    required this.type,
    required this.send,
    required this.read,
  });

  static final empty = Chat(
    chat: '',
    chatID: '',
    userSendID: '',
    userReceiveID: '',
    type: '',
    send: DateTime.now(),
    read: DateTime.now(),
  );

  Chat copyWith({
    String? chat,
    String? chatID,
    String? userSendID,
    String? userReceiveID,
    String? type,
    DateTime? send,
    DateTime? read,
  }) {
    return Chat(
      chat: chat ?? this.chat,
      chatID: chatID ?? this.chatID,
      userSendID: userSendID ?? this.userSendID,
      userReceiveID: userReceiveID ?? this.userReceiveID,
      type: type ?? this.type,
      send: send ?? this.send,
      read: read ?? this.read,
    );
  }

  bool get isEmpty => this == Chat.empty;

  bool get isNotEmpty => this != Chat.empty;

  ChatEntity toEntity() {
    return ChatEntity(
      chat: chat!,
      chatID: chatID!,
      userSendID: userSendID!,
      userReceiveID: userReceiveID!,
      type: type!,
      send: send,
      read: read,
    );
  }

  static Chat fromEntity(ChatEntity entity) {
    return Chat(
      chat: entity.chat,
      chatID: entity.chatID,
      userSendID: entity.userSendID,
      userReceiveID: entity.userReceiveID,
      type: entity.type,
      send: entity.send,
      read: entity.read,
    );
  }

  List<Object?> get props =>
      [chat, chatID, userSendID, userReceiveID, type, send, read];
}
