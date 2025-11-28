import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:spotlessgo/widgets/home_grid.dart';
import 'package:spotlessgo/widgets/home_services_card.dart';

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
          SizedBox(height: 12),
          Text("Our Services"),
          SizedBox(height: 12),
          Column(
            spacing: 14,
            children: [
              HomeServicesCard(
                icon: Icons.home_outlined,
                imagePath: 'assets/images/homec.jpeg',
                title: "Home Cleaning",
                subtitle: "Professional cleaning for your\nhome",
                price: "From ₦15000",
              ),
              HomeServicesCard(
                icon: Icons.home_outlined,
                imagePath: 'assets/images/office.jpeg',
                title: "Office Cleaning",
                subtitle: "Expert cleaning services for\nyour workspace",
                price: "From ₦10000",
              ),
              HomeServicesCard(
                icon: Icons.checkroom_outlined,
                imagePath: 'assets/images/laundry.jpeg',
                title: "Laundry Service",
                subtitle: "We wash, dry and fold your\nclothes",
                price: "From ₦300",
              ),
            ],
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
