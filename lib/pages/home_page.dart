import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var ListOfgridText = ["My Bookings", "Ratings", "Hours Saved"];
    return Scaffold(
      body: Stack(
        children: [
          _buildTopContainer(),

          Positioned.fill(
            top: 120,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                itemCount: 3,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                 // mainAxisSpacing: 18,
                  //crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    child: Center(child: Text(ListOfgridText[index])),
                  );
                },
              ),
            ),
          ),
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
          "Welcome Back,",
          style: TextStyle(fontSize: 18, color: Colors.white),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
