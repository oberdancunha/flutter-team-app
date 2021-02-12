import 'package:flutter/material.dart';

import '../../../domain/team/team.dart';

class TeamDetailsWidget extends StatelessWidget {
  final Team team;

  const TeamDetailsWidget({
    Key key,
    @required this.team,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 150.0,
            height: 150.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(team.logo),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30.0,
              horizontal: 50.0,
            ),
            child: Column(
              children: [
                _buildDetails(
                  context: context,
                  label: 'Name',
                  data: team.name,
                ),
                const SizedBox(height: 10.0),
                _buildDetails(
                  context: context,
                  label: 'Country',
                  data: team.country,
                ),
                const SizedBox(height: 10.0),
                _buildDetails(
                  context: context,
                  label: 'Founded',
                  data: team.founded,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetails({
    @required BuildContext context,
    @required String label,
    @required dynamic data,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.lightBlue[100],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$label:',
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10.0),
          Text(
            data.toString(),
            style: const TextStyle(fontSize: 20.0),
          ),
        ],
      ),
    );
  }
}
