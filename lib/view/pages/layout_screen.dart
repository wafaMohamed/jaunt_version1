import 'package:flutter/cupertino.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import 'package:flutter/material.dart';
import 'package:jaunt/view/pages/booking_screen.dart';
import 'package:jaunt/view/pages/home_screen.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:jaunt/view_model/data/remot/dio/dio_helper.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../model/places.dart';
import '../../utilities/themes/apptheme.dart';
import 'explore_layout.dart';

// ignore: must_be_immutable
class layoutBottomNavigation extends StatefulWidget {
   layoutBottomNavigation({Key? key}) : super(key: key);
  static List<Places> myPlaces=[];
  @override
  State<layoutBottomNavigation> createState() => _layoutBottomNavigationState();
}

class _layoutBottomNavigationState extends State<layoutBottomNavigation> {
  @override
  void initState() {
    getData();
    super.initState();
  }
  void getData() async {
    await dioHelper.getData(url: 'places').then((value ) {
      var hamda=value.data as List;
      for (var value1 in hamda) {
       layoutBottomNavigation.myPlaces.add(Places.fromJson(value1));
      }
      setState(() {
        flagLoadingFinished=true;
      });
    }).catchError((error) {
      showToast(error.toString());
      print(error.toString());
    });
  }
  int currentIndex = 0;
  bool flagLoadingFinished=false;

   List<Widget> screensBottom = [
    HomePageScreen(),
    exploreLayout(),
    bookingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:flagLoadingFinished||currentIndex!=0? screensBottom[currentIndex]:Center(child: CircularProgressIndicator(color: Color(0xff9661c9),)),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 180, spreadRadius: 2, color: AppTheme.purpleLight),
        ]),
        child: BottomNavigationBar(
          selectedItemColor: Color(0xff4229bc),
          backgroundColor: AppTheme.purplewight,
          currentIndex: currentIndex,
          onTap: (int newIndex) {
            setState(() {

              currentIndex = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home,
                color: Color(0xff9661c9),
              ),
              backgroundColor: AppTheme.purplewight,
            ),
            BottomNavigationBarItem(
              label: 'Explore',
              icon: Icon(
                Icons.explore,
                color: Color(0xff9661c9),
              ),
              backgroundColor: AppTheme.purplewight,
            ),
            BottomNavigationBarItem(
              label: 'Booking',
              icon: Icon(
                FluentSystemIcons.ic_fluent_ticket_filled,
                color: Color(0xff9661c9),
              ),
              backgroundColor: AppTheme.purplewight,
            ),
          ],
        ),
      ),
    );

  }

  // Future<void> openMap(String url) async {
  //   if (await canLaunch(url))
  //   { await launch(url); }
  //   else { throw 'Could not open the map.'; }
  // }
}
