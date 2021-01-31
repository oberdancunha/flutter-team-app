abstract class ISearchDataSource {
  Future<List<String>> list();
  Future<void> insert(List<String> searchHistory);
}
