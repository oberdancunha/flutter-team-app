import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/search/search_history/search_history_bloc.dart';
import 'search_history_list_widget.dart';

class SearchHistoryBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchHistoryBloc, SearchHistoryState>(
      builder: (context, state) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            height: 180,
            width: double.infinity,
            margin: const EdgeInsets.only(
              left: 10,
              top: 10,
              right: 10,
              bottom: 10,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Builder(
              builder: (_) => state.maybeMap(
                load: (_) => const CircularProgressIndicator(),
                failure: (_) => Container(),
                success: (success) => SearchHistoryListWidget(searchHistory: success.searchHistory),
                orElse: () => Container(),
              ),
            ),
          ),
        );
      },
    );
  }
}
