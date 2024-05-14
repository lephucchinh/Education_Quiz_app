import 'package:chat_repository/src/models/chat.dart';
import 'package:user_repository/user_repository.dart';

abstract class ChatRepository {
  Future<Chat> createChat(Chat chat);
  Stream<List<Chat>> getChat(String chatID);
  Future<void> deleteChat(Chat chat, DateTime send);
  Future<void> updateChatImage(String picture , Chat chat);
  Future<void> sendNotificationChat(String token, String message , String name,String type);
}