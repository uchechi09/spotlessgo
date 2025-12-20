import 'package:flutter/material.dart';
import 'package:spotlessgo/models/serviceconfig.dart';
import 'package:spotlessgo/utlis/currency_formatter.dart';

class BookServicePage extends StatefulWidget {
  final ServiceConfig service;

  BookServicePage({super.key, required this.service});

  @override
  State<BookServicePage> createState() => _BookServicePageState();
}

class _BookServicePageState extends State<BookServicePage> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Service')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with title & subtitle OVERLAY
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  Image.asset(
                    widget.service.imageAsset,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),

                  // Gradient overlay for readability
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.6),
                        ],
                      ),
                    ),
                  ),

                  // Title & subtitle on image
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.service.title,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          widget.service.subtitle,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            // Other dynamic sections (quantity, date, time, etc.)
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.service.quantityLabel != null)
                    Text(
                      'Number of ${widget.service.quantityLabel}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: quantity > 1
                            ? () => setState(() => quantity--)
                            : null,
                      ),
                      Text(
                        quantity.toString(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => setState(() => quantity++),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  if (widget.service.basePrice != null &&
                      widget.service.unitPrice != null &&
                      widget.service.unitLabel != null)
                    Text(
                      '${nairaFormatter.format(widget.service.basePrice)} base + '
                      '${nairaFormatter.format(widget.service.unitPrice)}/${widget.service.unitLabel}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
