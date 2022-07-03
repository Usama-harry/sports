import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Providers
import '../providers/data.dart';
//Widgets
import '../widgets/list_item.dart';

class TournamentDetailScreen extends StatelessWidget {
  static const routeName = '/tournamentDetail';

  const TournamentDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catagory =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          catagory['name'],
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<Data>(context, listen: false).loadStandings(
          catagory['id'],
        ),
        builder: (_, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text('Please try again later'),
            );
          }
          final standings = json.decode(snapshot.data.body);

          if (standings is Map<String, dynamic>) {
            return const Center(
              child: Text(
                'No data found',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: standings.length,
            itemBuilder: (context, index) => ListItem(
              compDetail: standings[index],
            ),
          );
        },
      ),
    );
  }
}
