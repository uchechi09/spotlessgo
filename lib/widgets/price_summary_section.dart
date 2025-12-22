import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PriceSummarySection extends StatelessWidget {
  PriceSummarySection({
    Key? key,
    required this.servicePrice,
    required this.additionalCharges,
    required this.isEnabled,
    required this.onContinue,
  }) : super(key: key);

  final double servicePrice;
  final double additionalCharges;
  final bool isEnabled;
  final VoidCallback onContinue;

  final NumberFormat nairaFormat = NumberFormat.currency(
    locale: 'en_NG',
    symbol: '₦',
    decimalDigits: 0,
  );

  double get totalPrice => servicePrice + additionalCharges;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        priceSummaryCard(),
        SizedBox(height: 20),
        continueButton(),
      ],
    );
  }

  Widget priceSummaryCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFEFF9F7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFB2E5DD)),
      ),
      child: Column(
        children: [
          priceRow('Base Price', nairaFormat.format(servicePrice)),
          SizedBox(height: 12),

          if (additionalCharges > 0) ...[
            priceRow(
              'Additional Charges',
              nairaFormat.format(additionalCharges),
            ),
            SizedBox(height: 12),
          ],

          Divider(),
          SizedBox(height: 12),

          priceRow(
            'Total',
            nairaFormat.format(totalPrice),
            isTotal: true,
          ),
        ],
      ),
    );
  }

  Widget priceRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
            color: isTotal ? Color(0xFF20B2A6) : Colors.black,
          ),
        ),
      ],
    );
  }

  Widget continueButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: isEnabled ? onContinue : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF8EDDD3),
          disabledBackgroundColor: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Continue to Payment',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
