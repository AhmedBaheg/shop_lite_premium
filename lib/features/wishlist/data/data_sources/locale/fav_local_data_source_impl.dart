import 'package:hive/hive.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../product/data/models/product_model.dart';
import 'fav_local_data_source.dart';

class FavLocalDataSourceImpl implements FavLocalDataSource {
  final favBox = Hive.box<ProductModel>(Constant.favBox);

  @override
  Future<List<ProductModel>> getFavorites() async {
    final favList = favBox.values.toList();
    return favList;
  }

  @override
  bool isFavorite(int productId) {
    return favBox.containsKey(productId);
  }

  @override
  Future<void> toggleFavorite(ProductModel productModel) async {
    if (isFavorite(productModel.id!)) {
      await favBox.delete(productModel.id);
    } else {
      await favBox.put(productModel.id, productModel);
    }
  }
}
