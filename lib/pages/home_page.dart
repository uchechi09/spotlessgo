import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:spotlessgo/widgets/home_grid.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              // method for top container
              _buildTopContainer(),
              // widget for grid
              HomeGrid(),
            ],
          ),
           Text("Our Services"),
        ],
      ),
    );
  }

  Widget _buildTopContainer() {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlexColor.mandyRedLightTertiary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: _buildHomeHeading(),
    );
  }

  Widget _buildHomeHeading() {
    return Padding(
      padding: const EdgeInsets.all(34),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          "Welcome Back,\nGrace!",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
