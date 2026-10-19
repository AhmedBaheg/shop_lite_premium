import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shop_lite_premium/firebase_options.dart';

import '../../simple_bloc_observer.dart';

class Constant {
  static const String langBox = "lang_box";

  static Future<void> setUp() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Hive.initFlutter();

    // To register my model adapter
    // Hive.registerAdapter(NoteModelAdapter());

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    Bloc.observer = SimpleBlocObserver();

      await Hive.openBox<String>(langBox);

  }
}