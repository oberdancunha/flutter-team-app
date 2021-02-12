import 'package:flutter/material.dart';

class SearchHistoryNotListWidget extends StatelessWidget {
  final String message;

  const SearchHistoryNotListWidget({
    Key key,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }
}
