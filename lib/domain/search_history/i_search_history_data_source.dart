abstract class ISearchHistoryDataSource {
  Future<List<String>> list();
  Future<void> insert(List<String> searchHistory);
}
