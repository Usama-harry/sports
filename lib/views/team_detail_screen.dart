import 'package:flutter/material.dart';

class TeamDetailScreen extends StatelessWidget {
  static const routeName = '/teamDetail';
  const TeamDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detail =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          detail['team_name'],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  singleDetailRow('Country', detail['country']),
                  const SizedBox(height: 10),
                  singleDetailRow('Position', detail['position']),
                  const SizedBox(height: 10),
                  singleDetailRow('Points', detail['points']),
                  const SizedBox(height: 10),
                  singleDetailRow('Season', detail['season']),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  singleDetailRow(' games', detail['home_gp']),
                  const SizedBox(height: 10),
                  singleDetailRow(' wins', detail['home_w']),
                  const SizedBox(height: 10),
                  singleDetailRow(' draws', detail['home_d']),
                  const SizedBox(height: 10),
                  singleDetailRow(' loses', detail['home_l']),
                  const SizedBox(height: 10),
                  singleDetailRow(' goal scored', detail['home_gs']),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Away',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  singleDetailRow(' games', detail['away_gp']),
                  const SizedBox(height: 10),
                  singleDetailRow(' wins', detail['away_w']),
                  const SizedBox(height: 10),
                  singleDetailRow(' draws', detail['away_d']),
                  const SizedBox(height: 10),
                  singleDetailRow(' loses', detail['away_l']),
                  const SizedBox(height: 10),
                  singleDetailRow(' goal scored', detail['away_gs']),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row singleDetailRow(String detailName, String detailValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          detailName,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        Text(
          detailValue,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.grey[700],
          ),
        )
      ],
    );
  }
}
