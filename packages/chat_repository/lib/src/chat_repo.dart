import 'package:chat_repository/src/models/chat.dart';

abstract class ChatRepository {
  Future<Chat> createChat(Chat chat);
  Stream<List<Chat>> getChat(String chatID);
  Future<void> deleteChat(String chatID, DateTime send);
  Future<void> updateChatImage(String picture , Chat chat);
}