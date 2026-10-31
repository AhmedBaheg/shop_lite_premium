import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shop_lite_premium/firebase_options.dart';

import '../../features/product/data/models/product_model.dart';
import '../../simple_bloc_observer.dart';

class Constant {
  static const String langBox = "lang_box";
  static const String uidBox = "uid_box";
  static const String favBox = "fav_box";

  static Future<void> setUp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await Hive.initFlutter();

    // To register my model adapter
    Hive.registerAdapter(ProductModelAdapter());
    Bloc.observer = SimpleBlocObserver();

    if (!Hive.isBoxOpen(langBox)) {
      await Hive.openBox<String>(langBox);
    }
    if (!Hive.isBoxOpen(uidBox)) {
      await Hive.openBox<String>(uidBox);
    }
    if (!Hive.isBoxOpen(favBox)) {
      await Hive.openBox<ProductModel>(favBox);
    }
  }
}
