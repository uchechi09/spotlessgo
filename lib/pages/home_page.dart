import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:spotlessgo/data/service.dart';
import 'package:spotlessgo/pages/book_service_page.dart';
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
          Column(
            children: [
              HomeServicesCard(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BookServicePage(service: Services.home),
                    ),
                  );
                },
                icon: Icons.home_outlined,
                imagePath: Services.home.imageAsset,
                title: "Home Cleaning",
                subtitle: "Professional cleaning\nfor your home",
                price: "From ₦15000",
              ),
              HomeServicesCard(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BookServicePage(service: Services.office),
                    ),
                  );
                },
                icon: Icons.house_outlined,
                imagePath: Services.office.imageAsset,
                title: "Office Cleaning",
                subtitle: "Expert cleaning services\nfor your workspace",
                price: "From ₦10000",
              ),
              HomeServicesCard(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          BookServicePage(service: Services.laundry),
                    ),
                  );
                },
                icon: Icons.checkroom_outlined,
                imagePath: Services.laundry.imageAsset,
                title: "Laundry Services",
                subtitle: "We wash, dry and fold\nyour clothes",
                price: "From ₦300",
              ),
              HomeServicesCard(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          BookServicePage(service: Services.deepCleaning),
                    ),
                  );
                },
                icon: Icons.cleaning_services_outlined,
                imagePath: Services.deepCleaning.imageAsset,
                title: "Deep Cleaning",
                subtitle: "Thorough top-to-bottom\ncleaning",
                price: "From ₦25000",
              ),
              HomeServicesCard(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          BookServicePage(service: Services.postConstruction),
                    ),
                  );
                },
                icon: Icons.construction_outlined,
                imagePath: Services.postConstruction.imageAsset,
                title: "Post Construction",
                subtitle: "Cleaning after renovation\nor build",
                price: "From ₦50000",
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  height: 130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlexColor.mandyRedLightTertiary,
                    // borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "First Time User?\nGet 20% OFF Your First Booking!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
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
