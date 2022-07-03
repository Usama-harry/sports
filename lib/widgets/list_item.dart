import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Screens
import '../views/team_detail_screen.dart';

class ListItem extends StatelessWidget {
  final Map<String, dynamic> compDetail;
  const ListItem({
    Key? key,
    required this.compDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        onTap: () => Get.toNamed(
          TeamDetailScreen.routeName,
          arguments: compDetail,
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.orange,
          child: Text(
            compDetail['comp_group'] != null
                ? (compDetail['comp_group'] as String).split(' ')[1]
                : '',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          compDetail['team_name'],
        ),
        subtitle: Text(
          compDetail['season'],
        ),
        trailing: Chip(
          backgroundColor:
              compDetail['position'] == '1' ? Colors.red : Colors.orange,
          label: Text(
            compDetail['position'],
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
