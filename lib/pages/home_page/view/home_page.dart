import 'package:flutter/material.dart';
import 'package:testeam_mobile_application/connections/connection.dart';
import 'package:testeam_mobile_application/pages/home_page/widgets/widgets.dart';
import 'package:testeam_mobile_application/pages/login_page/view/login_page.dart';
import 'package:testeam_mobile_application/pages/user_page/view/user_page.dart';
import 'dart:ui';

import 'package:testeam_mobile_application/theme/theme.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    final PageController tabsController =
        PageController(initialPage: _selectedPage, keepPage: true);

    final tabs = [
      const Center(
        child: Text('1'),
      ),
      const Center(
        child: test_page(),
      ),
      const Center(
        child: Text('4'),
      ),
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            // Здесь установите свой собственный маршрут, на который хотите перейти
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
        ),
        backgroundColor:
            Theme.of(context).colorScheme.background.withOpacity(0.8),
        surfaceTintColor: Colors.transparent,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        // shadowColor: Theme.of(context).colorScheme.onBackground,
        title: Image.asset(
          'assets/images/tesTeam.png',
          height: Theme.of(context).textTheme.titleMedium!.fontSize!,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.account_circle_outlined,
              color: Color.fromRGBO(73, 66, 228, 1),
              size: 30.0,
            ),
            tooltip: 'Show user account',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => user_page()));
            },
          ),
        ],
      ),
      body: PageView.builder(
        physics: const PageScrollPhysics(),
        controller: tabsController,
        onPageChanged: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        itemCount: 4,
        itemBuilder: (context, index) => tabs[index],
      ),
      bottomNavigationBar: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: NavigationBar(
            backgroundColor:
                Theme.of(context).colorScheme.background.withOpacity(0.8),
            surfaceTintColor: Theme.of(context).colorScheme.background,
            destinations: [
              NavigationDestination(
                icon: Image.asset(
                  'assets/images/home.png',
                  width: Theme.of(context).textTheme.titleMedium!.fontSize!,
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Image.asset('assets/images/tests.png',
                    width: Theme.of(context).textTheme.titleMedium!.fontSize!),
                label: 'Tests',
              ),
              NavigationDestination(
                icon: Image.asset('assets/images/statistics.png',
                    width: Theme.of(context).textTheme.titleMedium!.fontSize!),
                label: 'Statistics',
              ),
            ],
            selectedIndex: _selectedPage,
            onDestinationSelected: (index) {
              tabsController.jumpToPage(index);
            },
          ),
        ),
      ),
    );
  }
}
