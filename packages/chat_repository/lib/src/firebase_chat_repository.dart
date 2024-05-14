import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:chat_repository/chat_repository.dart';
import 'package:chat_repository/src/chat_repo.dart';
import 'package:chat_repository/src/models/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:user_repository/src/models/my_user.dart';
import 'package:uuid/uuid.dart';

class FirebaseChatRepository implements ChatRepository {
  final chatCollection = FirebaseFirestore.instance.collection('Chat');

  @override
  Future<Chat> createChat(Chat chat) async {
    try {
      chat.send = DateTime.now();
      String formattedTime = DateFormat('yyyyMMddHHmmssSSS').format(chat.send);
      await chatCollection
          .doc(chat.chatID)
          .collection('message')
          .doc(formattedTime)
          .set(chat.toEntity().toDocument());
      return chat;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> deleteChat(Chat chat, DateTime send) async {
    try {
      String formattedTime = DateFormat('yyyyMMddHHmmssSSS').format(send);
      if(chat.type == "image") {
        Reference firebaseStoreRef = FirebaseStorage.instance
            .ref()
            .child("ChatImage/${chat.chatID}/${formattedTime}_lead");
        await firebaseStoreRef.delete();
      }

      await chatCollection
          .doc(chat.chatID)
          .collection("message")
          .doc(formattedTime)
          .delete();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Stream<List<Chat>> getChat(String chatID) {
    try {
      return chatCollection
          .doc(chatID)
          .collection('message')
          .orderBy('send', descending: false)
          .snapshots()
          .map((event) => event.docs
              .map(
                  (doc) => Chat.fromEntity(ChatEntity.fromDocument(doc.data())))
              .toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> updateChatImage(String picture, Chat chat) async {
    try {
      chat.send = DateTime.now();
      String formattedTime = DateFormat('yyyyMMddHHmmssSSS').format(chat.send);
      final File image = File(picture);
      Reference firebaseStoreRef = FirebaseStorage.instance
          .ref()
          .child('ChatImage/${chat.chatID}/${formattedTime}_lead');
      await firebaseStoreRef.putFile(image);
      String url = await firebaseStoreRef.getDownloadURL();
      chat.chat = url;
      chat.type = 'image';
      await chatCollection
          .doc(chat.chatID)
          .collection('message')
          .doc(formattedTime)
          .set(chat.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> sendNotificationChat( String token , String message , String name,String type) async {

    try {
      final url = 'https://fcm.googleapis.com/fcm/send';
      final headers = {
        'Authorization': 'key=AAAAANeFT70:APA91bFMcXywgTpYWakCnVvH6uxLHoZrcX-ze1OuGAOVEKFXWVbRDzjRBSIouEzTSo3dUw_E211jQThb_eMGY-dCzfZ-HoAXPm2yLqXnPLbyKql9XfF-rtWmYx35qpsHMUoGiMmBvLqS',
        'Content-Type': 'application/json',
      };
      log("đã gửi notification");
      if(type == 'image'){
        final body = {
          "to": token,
          "notification": {
            "title" : "Tin nhắn mới từ $name",
            "body" : "$name đã gửi 1 ảnh cho bạn"
          }

        };
        await post(Uri.parse(url), headers: headers , body: jsonEncode(body));
      } else {
        final body = {
          "to": token,
          "notification": {
            "title" : "Tin nhắn mới từ $name",
            "body" : message
          }

        };
        await post(Uri.parse(url), headers: headers , body: jsonEncode(body));

      }

    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
