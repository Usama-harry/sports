import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

//Providers
import '../providers/data.dart';
//Widgets
import '../widgets/grid_item.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main';
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final images = [
    'assets/images/1.jpeg',
    'assets/images/2.jpeg',
    'assets/images/3.jpeg',
    'assets/images/4.jpeg',
  ];

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 2)).then((value) {
      Provider.of<Data>(context, listen: false).loadCatagories();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: const Text('Rankings'),
    );
    final height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        appbar.preferredSize.height;
    return Scaffold(
      appBar: appbar,
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).padding.top +
                  appbar.preferredSize.height,
              color: Colors.red,
            ),
            drawerListTile(Icons.person, 'Sign In/Sign Up'),
            drawerListTile(Icons.list_alt_outlined, 'About Us'),
            drawerListTile(Icons.location_on, 'Locate Us'),
            drawerListTile(Icons.contact_mail_rounded, 'Contact Us'),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: height * 0.4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CarouselSlider(
                  items: images
                      .map(
                        (image) => ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    viewportFraction: 0.8,
                    height: height * 0.4 - 16,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.easeInOutBack,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  )),
            ),
          ),
          SizedBox(
            height: height * 0.6,
            child: FutureBuilder(
              future:
                  Provider.of<Data>(context, listen: false).loadCatagories(),
              builder: (context, AsyncSnapshot<dynamic> snapshot) {
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

                final catagories = json.decode(snapshot.data.body);

                return GridView.builder(
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3 / 2,
                  ),
                  itemCount: catagories.length,
                  itemBuilder: (_, index) => GridItem(
                    catagory: catagories[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  ListTile drawerListTile(IconData icon, String text) {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Comming soon',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: Colors.grey[700],
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
