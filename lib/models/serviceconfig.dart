enum ServiceType { home, office, laundry }

class ServiceConfig {
  final ServiceType type;
  final String title;
  final String subtitle;
  final String imageAsset;
  final String? quantityLabel;
  final int? basePrice;
  final int? unitPrice;
  final String? unitLabel;

  ServiceConfig({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.imageAsset,
    this.quantityLabel,
    this.basePrice,
    this.unitPrice,
    this.unitLabel,
  });
}
