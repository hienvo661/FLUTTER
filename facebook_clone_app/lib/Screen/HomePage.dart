// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:facebook_clone_app/Config_colors.dart/Color.dart';
import 'package:facebook_clone_app/Widget/Circle_button.dart';
import 'package:facebook_clone_app/Widget/Rooms.dart';
import 'package:facebook_clone_app/Widget/Stories_view.dart';
import 'package:facebook_clone_app/Widget/create_post.dart';
import 'package:facebook_clone_app/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            elevation: 0.5,
            forceElevated: true,
            floating: true,
            expandedHeight: 60,
            leading: IconButton(
              onPressed: () {
                print('menu');
              },
              icon: Center(child: Icon(Icons.menu_sharp)),
              iconSize: 30,
              color: Colors.black87,
              splashRadius: 20,
            ),
            title: Text(
              'facebook',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Appcolor.facebookBlue,
                  letterSpacing: -1.5),
            ),
            centerTitle: false,
            leadingWidth: 32, //khoảng cách chữ và button
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  width: 37,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black12),
                  child: IconButton(
                    splashColor: Colors.black26,
                    onPressed: () {
                      print('search');
                    },
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    iconSize: 20,
                    color: Colors.black87,
                    splashRadius: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  width: 37,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black12),
                  child: IconButton(
                    splashColor: Colors.black26,
                    onPressed: () {
                      print('messenger');
                    },
                    icon: Icon(
                      MdiIcons.facebookMessenger,
                      color: Colors.black,
                    ),
                    iconSize: 20,
                    color: Colors.black87,
                    splashRadius: 20,
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: CreatePost(
              currentUser: currentUser,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 40,
              child: TabBar(
                controller: tabController,
                tabs: const <Widget>[
                  Tab(
                    icon: Center(
                      child: Text(
                        'Tin',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                  Tab(
                    icon: Center(
                      child: Text(
                        'Reels',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              height: 180,
              child: TabBarView(
                controller: tabController,
                children: <Widget>[
                  Storire_Widget(),
                  Storire_Widget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
