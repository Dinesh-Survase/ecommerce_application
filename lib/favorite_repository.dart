import 'package:kharedi/model.dart';

class FavoriteRepository {
  static List<AppModel> favorites = [];

  static void toggleFavorite(AppModel product) {
    if (isFavorite(product)) {
      favorites.removeWhere((item) => item.name == product.name);
    } else {
      favorites.add(product);
    }
  }

  static bool isFavorite(AppModel product) {
    return favorites.any((item) => item.name == product.name);
  }

  static List<AppModel> getFavorites(){
    return favorites;
  }
}
