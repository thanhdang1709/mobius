class MockDb {
  final List<Map<String, dynamic>> _items = [];
  static final MockDb _db = MockDb._privateConstructor();

  MockDb._privateConstructor();

  factory MockDb() {
    return _db;
  }

  Future<void> insert(Map<String, dynamic> item) async {
    item['id'] = DateTime.now().toString();
    _items.add(item);
  }

  Future<void> remove(String id) async {
    _items.removeWhere((item) => item['id'] == id);
  }

  Future<void> update(Map<String, dynamic> updatedItem) async {
    int i = _items.indexWhere((item) => item['id'] == updatedItem['id']);
    _items[i] = updatedItem;
  }

  Future<List<Map<String, dynamic>>> list() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return _items;
  }

  Future<Map<String, dynamic>?> findOne(int id) async {
    return _items.firstWhere((item) => item['id'] == id);
  }
}
