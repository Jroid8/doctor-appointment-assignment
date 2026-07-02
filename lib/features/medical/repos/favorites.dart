abstract class FavoritesRepo {
  Future<void> setHealthCenter(int id, bool isFavorite);
  Future<void> setDoctor(int id, bool isFavorite);
}

class MockFavoritesRepo implements FavoritesRepo {
  @override
  Future<void> setHealthCenter(int id, bool isFavorite) async {}

  @override
  Future<void> setDoctor(int id, bool isFavorite) async {}
}
