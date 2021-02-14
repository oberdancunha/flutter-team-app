import 'package:shared_preferences/shared_preferences.dart';
import '../../core/errors/exceptions/database_exception.dart';
import '../../domain/search_history/i_search_history_data_source.dart';

class SearchHistoryDataSourceSP implements ISearchHistoryDataSource {
  SharedPreferences sharedPreferences;
  static const searchHistoryKey = 'searchHistory';

  SearchHistoryDataSourceSP(this.sharedPreferences);

  @override
  Future<List<String>> list() async {
    try {
      await _connect();
      final searchHistory = sharedPreferences.getStringList(searchHistoryKey);
      return searchHistory ?? List.empty();
    } on Exception {
      throw DatabaseException();
    }
  }

  @override
  Future<void> insert(List<String> searchHistory) async {
    try {
      await _connect();
      final insert = await sharedPreferences.setStringList(
        searchHistoryKey,
        searchHistory,
      );
      if (!insert) {
        throw DatabaseException();
      }
      return;
    } on Exception {
      throw DatabaseException();
    }
  }

  Future<void> _connect() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
}
