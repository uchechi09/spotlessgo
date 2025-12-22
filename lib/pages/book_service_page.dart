import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spotlessgo/models/serviceconfig.dart';
import 'package:spotlessgo/utlis/currency_formatter.dart';

class BookServicePage extends StatefulWidget {
  BookServicePage({super.key, required this.service});
  final ServiceConfig service;

  @override
  State<BookServicePage> createState() => _BookServicePageState();
}

class _BookServicePageState extends State<BookServicePage> {
  int quantity = 1;
  DateTime? selectedDate;
  String? selectedTime;
  final List<String> timeSlots = [
    '08:00 AM',
    '09:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '01:00 PM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM',
  ];
  double get basePrice => (widget.service.basePrice ?? 0).toDouble();

  double get unitPrice => (widget.service.unitPrice ?? 0).toDouble();

  double get additionalCharges {
    if (quantity <= 1) return 0;
    return (quantity - 1) * unitPrice;
  }

  double get totalPrice => basePrice + additionalCharges;

  bool get canContinue => selectedDate != null && selectedTime != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
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

            // container for number of rooms
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
                    Center(
                      child: Text(
                        '${nairaFormatter.format(widget.service.basePrice)} base + '
                        '${nairaFormatter.format(widget.service.unitPrice)}/${widget.service.unitLabel}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                ],
              ),
            ),

            // container for date & time
            SizedBox(height: 24),
            Container(
              height: 150,
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: FlexColor.mandyRedDarkTertiary,
                      ),
                      Text(
                        "Select Date",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.calendar_today),
                      title: Text(
                        selectedDate == null
                            ? 'dd/MM/yyyy'
                            : DateFormat('dd/MM/yyyy').format(selectedDate!),
                        style: TextStyle(
                          color: selectedDate == null
                              ? Colors.grey
                              : Colors.black,
                        ),
                      ),
                      onTap: () async {
                        final now = DateTime.now();
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDate ?? now,
                          firstDate: now,
                          lastDate: DateTime.now().add(
                            Duration(days: 365 * 100),
                          ),
                        );
                        if (picked != null) {
                          setState(() => selectedDate = picked);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            // container for time
            Container(
              height: 250,
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.access_time,
                        color: FlexColor.mandyRedDarkTertiary,
                      ),
                      Text(
                        "Select Time",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: timeSlots.map((slot) {
                          final isSelected = slot == selectedTime;
                          return ChoiceChip(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            label: Text(slot),
                            selected: isSelected,
                            selectedColor: FlexColor.mandyRedDarkTertiary,
                            backgroundColor: Colors.white,
                            onSelected: (val) =>
                                setState(() => selectedTime = slot),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            // container for entering Address
            Container(
              height: 150,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: FlexColor.mandyRedDarkTertiary,
                      ),
                      Text(
                        "Service Adress",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      hintText: "Enter your address",
                    ),
                  ),
                ],
              ),
            ),
            // container for price summary
            SizedBox(height: 24),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: FlexColor.tealM3LightTertiaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  priceRow(
                    context,
                    'Base Price',
                    nairaFormatter.format(basePrice),
                  ),

                  if (additionalCharges > 0) ...[
                    SizedBox(height: 12),
                    priceRow(
                      context,
                      'Additional ${widget.service.unitLabel}',
                      nairaFormatter.format(additionalCharges),
                    ),
                  ],

                  SizedBox(height: 12),
                  Divider(),
                  SizedBox(height: 12),

                  priceRow(
                    context,
                    'Total',
                    nairaFormatter.format(totalPrice),
                    isTotal: true,
                  ),
                ],
              ),
            ),
            // button to continue
            SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: canContinue
                    ? () {
                        // TODO: Navigate to payment page
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: FlexColor.mandyRedDarkTertiary,
                  disabledBackgroundColor: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'Continue to Payment',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget priceRow(
    BuildContext context,
    String label,
    String value, {
    bool isTotal = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
            color: isTotal ? FlexColor.mandyRedDarkTertiary : Colors.black,
          ),
        ),
      ],
    );
  }
}
