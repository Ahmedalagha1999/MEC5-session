import 'package:get/get.dart';

class FavoriteFoodController extends GetxController {
  var favList = List<String>.empty(growable: true).obs;

  bool isFavorited(String path) {
    return favList.contains(path);
  }

  void toggleFavorite(String path) {
    if (!isFavorited(path)) {
      favList.add(path);
    } else {
      favList.remove(path);
    }
  }
}
