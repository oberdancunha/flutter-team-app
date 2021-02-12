import 'package:flutter/material.dart';

import '../../search_history/search_history_body_widget.dart';
import 'team_search_form_widget.dart';

class TeamSearchWidget extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<TeamSearchWidget> {
  bool callSearchHistory;

  @override
  void initState() {
    callSearchHistory = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3 + 100.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 85.0,
                child: TeamSearchFormWidget(
                  onTap: () {
                    setState(() {
                      callSearchHistory = true;
                    });
                  },
                ),
              ),
              if (callSearchHistory) SearchHistoryBodyWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
