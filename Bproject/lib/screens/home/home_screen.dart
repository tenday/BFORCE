import 'package:flutter/material.dart';
import 'package:rive_animation/screens/maps/maps.dart';

import '../../model/course.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SizedBox(
        width: 500.0,
        height: 800.0,
        child: MapSample(),
      ),
      );
  }
}
