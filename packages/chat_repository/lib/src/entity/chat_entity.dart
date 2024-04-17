import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_repository/user_repository.dart';

class ChatEntity {
  String chat;
  String chatID;
  String userSendID;
  String userReceiveID;
  String type;
  DateTime send;
  DateTime read;

  ChatEntity({
    required this.chat,
    required this.chatID,
    required this.userSendID,
    required this.userReceiveID,
    required this.type,
    required this.send,
    required this.read,
  });

  Map<String, Object> toDocument() {
    return {
      "chat": chat,
      "chatID": chatID,
      "userSendID": userSendID,
      "userReceiveID": userReceiveID,
      "type": type,
      "send": send,
      "read": read,
    };
  }

  static ChatEntity fromDocument(Map<String, dynamic> doc) {
    return ChatEntity(
        chat: doc["chat"] as String,
        chatID: doc["chatID"] as String,
        userSendID: doc["userSendID"] as String,
        userReceiveID: doc["userReceiveID"] as String,
        type: doc["type"] as String,
        send: doc['send'] != null
            ? (doc['send'] as Timestamp).toDate()
            : DateTime.now(),
        read: doc['read'] != null
            ? (doc['read'] as Timestamp).toDate()
            : DateTime.now(),
    );
  }

  @override
  List<Object?> get props => [
    chat,chatID,userSendID,userReceiveID,type,send,read,
  ];
  @override
  String toString() {
    return '''ChatEntity: {
      chat: $chat
      chatID: $chatID
      userSendID: $userSendID
      userReceiveID: $userReceiveID
      send: $send
      type: $type
      read: $read
    }''';
  }

}
