import 'package:shared_preferences/shared_preferences.dart';
import 'package:teamapp/core/errors/exceptions/database_exception.dart';

import '../../domain/search/i_search_data_source.dart';

class SearchDataSourceSP implements ISearchDataSource {
  SharedPreferences sharedPreferences;
  static const searchHistoryKey = 'searchHistory';

  SearchDataSourceSP(this.sharedPreferences);

  @override
  Future<List<String>> list() async {
    try {
      await _connect();
      return sharedPreferences.getStringList(searchHistoryKey);
    } on Exception {
      throw DatabaseException();
    }
  }

  @override
  Future<void> insert(List<String> searchHistory) async {
    try {
      await _connect();
      await _clear();
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

  Future<void> _clear() async {
    await sharedPreferences.clear();
  }

  Future<void> _connect() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
}
