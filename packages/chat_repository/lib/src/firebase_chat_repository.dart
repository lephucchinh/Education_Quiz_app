import 'dart:developer';
import 'dart:io';

import 'package:chat_repository/chat_repository.dart';
import 'package:chat_repository/src/chat_repo.dart';
import 'package:chat_repository/src/models/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
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
  Future<void> deleteChat(String chatID, DateTime send) async {
    try {
      String formattedTime = DateFormat('yyyyMMddHHmmssSSS').format(send);

      Reference firebaseStoreRef = FirebaseStorage.instance
          .ref()
          .child("ChatImage/${chatID}/${formattedTime}_lead");
      await firebaseStoreRef.delete();

      await chatCollection
          .doc(chatID)
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
}
