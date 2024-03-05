import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quizgames/simple_bloc_observer.dart';
import 'package:user_repository/user_repository.dart';
import 'app/app.dart';
import 'firebase_options.dart';
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
    runApp( MyApp(FireBaseUserRepository()));


}



