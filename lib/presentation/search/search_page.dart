import 'package:flutter/material.dart';

import 'widgets/search_form_widget.dart';
import 'widgets/search_history_body_widget.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchPage> {
  bool callSearchHistory;

  @override
  void initState() {
    callSearchHistory = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3 + 15.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 15.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 85.0,
                child: SearchFormWidget(
                  onTap: () {
                    setState(() {
                      callSearchHistory = true;
                    });
                  },
                ),
              ),
              if (callSearchHistory)
                Column(
                  children: [
                    const SizedBox(height: 10.0),
                    SearchHistoryBodyWidget(),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
