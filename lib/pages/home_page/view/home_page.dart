import 'package:flutter/material.dart';
import 'dart:ui';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
        child: Text('2'),
      ),
      const Center(
        child: Text('3'),
      ),
      const Center(
        child: Text('4'),
      ),
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
                icon: Image.asset('assets/images/calendar.png',
                    width: Theme.of(context).textTheme.titleMedium!.fontSize!),
                label: 'Calendar',
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