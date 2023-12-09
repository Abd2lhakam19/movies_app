import 'package:application/core/helper/spacing.dart';
import 'package:application/features/home/ui/widgets/new_releases/new_releases_section.dart';
import 'package:application/features/home/ui/widgets/recomended/recomended_section.dart';
import 'package:flutter/material.dart';

import 'widgets/slider/top_home_slider.dart';

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
              verticalSpace(24),
              const NewReleasesSection(),
              verticalSpace(30),
              const RecomendedSection(),
            ],
          ),
        ),
      ),
    );
  }
}
