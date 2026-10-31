import 'package:cloud_firestore/cloud_firestore.dart'
    show FirebaseFirestore, FieldValue;
import 'package:hive/hive.dart';

import '../../../../../core/utils/constant.dart';
import '../../models/cart_model.dart';
import 'cart_firestore_remote_data_source.dart';

class CartFirestoreRemoteDataSourceImpl
    implements CartFirestoreRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<void> addToCart({required CartModel cartModel}) async {
    final uid = Hive.box<String>(Constant.uidBox).get(Constant.uidBox);

    await _firebaseFirestore
        .collection("users")
        .doc(uid)
        .collection("cart")
        .doc(cartModel.productModel!.id.toString())
        .set({
          ...cartModel.toJson(),
          'createdAt': FieldValue.serverTimestamp(),
        });
  }

  @override
  Future<List<CartModel>> getCartItems() async {
    final uid = Hive.box<String>(Constant.uidBox).get(Constant.uidBox);
    final List<CartModel> cartItemList = [];
    final cartItems = await _firebaseFirestore
        .collection("users")
        .doc(uid)
        .collection("cart")
        .orderBy('createdAt', descending: true)
        .get();

    for (var item in cartItems.docs) {
      cartItemList.add(CartModel.fromJson(item.data()));
    }
    return cartItemList;
  }

  @override
  Future<void> updateCart({required CartModel cartModel}) async {
    final uid = Hive.box<String>(Constant.uidBox).get(Constant.uidBox);

    await _firebaseFirestore
        .collection('users')
        .doc(uid)
        .collection('cart')
        .doc(cartModel.productModel!.id.toString())
        .update(cartModel.toJson());
  }

  @override
  Future<void> deleteCartItems({required String productId}) async {
    final uid = Hive.box<String>(Constant.uidBox).get(Constant.uidBox);

    await _firebaseFirestore
        .collection('users')
        .doc(uid)
        .collection('cart')
        .doc(productId)
        .delete();
  }
}
