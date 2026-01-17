import 'package:spotlessgo/models/serviceconfig.dart';

class Services {
  static final home = ServiceConfig(
    type: ServiceType.home,
    title: 'Home Cleaning',
    subtitle: 'Professional cleaning for your home',
    imageAsset: 'assets/images/homec.jpeg',
    quantityLabel: 'rooms',
    basePrice: 15000,
    unitPrice: 7500,
    unitLabel: 'room',
  );

  static final office = ServiceConfig(
    type: ServiceType.office,
    title: 'Office Cleaning',
    subtitle: 'Keep your workspace spotless',
    imageAsset: 'assets/images/office.jpeg',
    quantityLabel: 'offices',
    basePrice: 10000,
    unitPrice: 5000,
    unitLabel: 'area',
  );

  static final laundry = ServiceConfig(
    type: ServiceType.laundry,
    title: 'Laundry Service',
    subtitle: 'We wash, dry, and fold for you',
    imageAsset: 'assets/images/laundry.jpeg',
    // unitLabel: 'load',
  );

  static final deepCleaning = ServiceConfig(
    type: ServiceType.deepCleaning,
    title: 'Deep Cleaning',
    subtitle: 'Thorough top-to-bottom cleaning',
    imageAsset: 'assets/images/deep.png',
    quantityLabel: 'rooms',
    basePrice: 25000,
    unitPrice: 10000,
    unitLabel: 'room',
  );

  static final postConstruction = ServiceConfig(
    type: ServiceType.postConstruction,
    title: 'Post Construction',
    subtitle: 'Cleaning after renovation or build',
    imageAsset: 'assets/images/construction.png',
    quantityLabel: 'sqm',
    basePrice: 50000,
    unitPrice: 1000,
    unitLabel: 'sqm',
  );
}
