import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quizgames/simple_bloc_observer.dart';
import 'package:user_repository/user_repository.dart';
import 'app/app.dart';
import 'firebase_options.dart';
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future<void>  main() async {
  // kinh nghiệm là bắt buộc initialFirabase phải được đặt lên hàng đầu tiên
  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp(
    // kinh nghiệm sửa bắt buộc thêm dòng options để firebase được đồng bộ hóa
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  _firebaseMessaging.getToken().then((token) {
    print('FCM Token: $token');
    // Gửi token đến máy chủ của bạn để lưu trữ hoặc xử lý
  });
  _firebaseMessaging.requestPermission(
    sound: true,
    badge: true,
    alert: true,
    provisional: false,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(
        MyApp(FireBaseUserRepository()));


}



