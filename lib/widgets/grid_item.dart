import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Screens
import '../views/tournament_detail_screen.dart';

class GridItem extends StatelessWidget {
  final Map<String, dynamic> catagory;
  const GridItem({
    Key? key,
    required this.catagory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        TournamentDetailScreen.routeName,
        arguments: catagory,
      ),
      child: Card(
        color: Colors.orange,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: FittedBox(
              child: Text(
                catagory['name'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
