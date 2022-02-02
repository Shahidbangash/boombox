import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_carplay/constants/constants.dart';
import 'package:flutter_carplay/flutter_carplay.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    FlutterCarplay.setRootTemplate(
      rootTemplate: CPTabBarTemplate(
        templates: [
          CPListTemplate(
            sections: [
              CPListSection(
                items: [
                  CPListItem(
                    text: "Item 1",
                    detailText: "Detail Text",
                    onPress: (complete, self) {
                      self.setDetailText("You can change the detail text.. 🚀");
                      complete();
                    },
                    image: 'images/logo_flutter_1080px_clr.png',
                  ),
                  CPListItem(
                    text: "Item 2",
                    detailText: "Start progress bar",
                    isPlaying: false,
                    playbackProgress: 0,
                    image: 'images/logo_flutter_1080px_clr.png',
                    onPress: (complete, self) {
                      complete();
                    },
                  ),
                ],
                header: "First Section",
              ),
            ],
            title: "Home",
            showsTabBadge: false,
            systemIcon: "house.fill",
          ),
          CPListTemplate(
            sections: [],
            title: "Settings",
            emptyViewTitleVariants: ["Settings"],
            emptyViewSubtitleVariants: [
              "No settings have been added here yet. You can start adding right away"
            ],
            showsTabBadge: false,
            systemIcon: "gear",
          ),
        ],
      ),
      animated: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Carplay'),
        ),
        body: Center(
            child: Text(
          'CarPlay with Flutter',
          textScaleFactor: 1.5,
        )),
      ),
    );
  }
}
