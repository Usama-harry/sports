import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

//Screens
import './views/main_screen.dart';
import './views/tournament_detail_screen.dart';
import './views/team_detail_screen.dart';
//Providers
import './providers/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Data(),
      child: GetMaterialApp(
        title: 'Rankings',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        initialRoute: MainScreen.routeName,
        getPages: [
          GetPage(
            name: MainScreen.routeName,
            page: () => const MainScreen(),
          ),
          GetPage(
            name: TournamentDetailScreen.routeName,
            page: () => const TournamentDetailScreen(),
          ),
          GetPage(
            name: TeamDetailScreen.routeName,
            page: () => const TeamDetailScreen(),
          )
        ],
      ),
    );
  }
}
