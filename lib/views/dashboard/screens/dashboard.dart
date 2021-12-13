import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_vid/utils/change_theame.dart';
import 'package:sample_vid/utils/colors.dart';
import 'package:sample_vid/utils/styles.dart';

import 'package:sample_vid/views/dashboard/provider/dash_provider.dart';
import 'package:sample_vid/views/dashboard/video_player.dart';
import 'package:sample_vid/views/screens/login.dart';
import 'package:sample_vid/views/screens/profile.dart';

class Dashboard extends StatelessWidget {
  static const String route = '/dashboard';
  final List<String> _title = ['Home', 'Profile'];
  final List<Widget> _screens = [
    const VideoPlayerView(),
    const SizedBox(
        child: Center(
      child: ProfileView(),
    )),
  ];
  Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DashboardProvider _dashboardProvider =
        Provider.of<DashboardProvider>(context);
    return Scaffold(
      backgroundColor: colorBackground,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Builder(builder: (context) {
          return AppBar(
            backgroundColor: colorBlue,
            centerTitle: false,
            leading: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu),
            ),
            actions: [
              ChangeThemeButtonWidget(),
            ],
            title: Text(
              _title[_dashboardProvider.currentIndex],
              style: tsS16BWhite,
            ),
          );
        }),
      ),
      body: _screens[_dashboardProvider.currentIndex],
      drawer: drawerWidget(
        context,
        _dashboardProvider,
      ),
    );
  }

  Widget drawerWidget(
    BuildContext context,
    DashboardProvider _provider,
  ) =>
      Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: SizedBox(
                child: Text(
                  "Video_player",
                  style: tsS18BLUE,
                ),
              ),
            ),
            Column(
              children: [
                DrawerItem(
                  title: 'Home',
                  function: () {
                    _provider.currentIndex = 0;
                  },
                ),
                DrawerItem(
                  title: 'Profile',
                  function: () {
                    _provider.currentIndex = 1;
                  },
                ),
              ],
            )
          ],
        ),
      );
}

class DrawerItem extends StatelessWidget {
  final String title;
  final VoidCallback? function;
  // ignore: use_key_in_widget_constructors
  const DrawerItem({required this.title, this.function});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 49,
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: ListTile(
          onTap: function,
          title: Text(
            title,
            style: tsS14BoldBlack,
          ),
        ),
      ),
    );
  }
}
