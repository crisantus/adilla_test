import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../widget/drawer_widgets.dart';
import 'bottomNavi/dashboard.dart';
import 'bottomNavi/dillia.dart';
import 'bottomNavi/explore.dart';
import 'bottomNavi/learn.dart';
import 'bottomNavi/save.dart';

class AppController extends StatefulWidget {
  const AppController({Key? key}) : super(key: key);
  @override
  State<AppController> createState() => _AppControllerState();
}

class _AppControllerState extends State<AppController> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    DashBoard(),
    Save(),
    Explore(),
    Learn(),
    Dilla(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerAdillia(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 10,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/leaf.png"),
              ),
              label: 'Save',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/explore.png"),
              ),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/sololearn.png"),
              ),
              label: 'Learn',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/wallet.png"),
              ),
              label: 'Dilla',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: kDefaultAppColor,
          unselectedItemColor: kLightGreyColor,
          showUnselectedLabels: true,
          unselectedLabelStyle: const TextStyle(
            color: kLightGreyColor,
          ),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
