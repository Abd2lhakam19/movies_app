import 'package:application/core/helper/spacing.dart';
import 'package:flutter/material.dart';

import 'wigets/slider/top_home_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(13),
              const TopHomeSlider(),
            ],
          ),
        ),
      ),
    );
  }
}