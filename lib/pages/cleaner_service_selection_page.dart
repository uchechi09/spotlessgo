import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

class CleanerServiceSelectionPage extends StatefulWidget {
 const CleanerServiceSelectionPage({super.key});

  @override
  State<CleanerServiceSelectionPage> createState() =>
      CleanerServiceSelectionPageState();
}

class CleanerServiceSelectionPageState
    extends State<CleanerServiceSelectionPage> {
  final List<String> services = [
    'Home Cleaning',
    'Office Cleaning',
    'Deep Cleaning',
    'Post-construction Cleaning',
    'Laundry & Ironing',
  ];

  final Set<String> selectedServices = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Services')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What services do you offer?',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 8),
            Text(
              'We’ll only assign jobs that match your experience.',
              style: TextStyle(color: Colors.black54),
            ),
            SizedBox(height: 24),

            Expanded(
              child: ListView(
                children: services.map((service) {
                  final isSelected =
                      selectedServices.contains(service);

                  return CheckboxListTile(
                    value: isSelected,
                    title: Text(service),
                    activeColor:
                        FlexColor.mandyRedDarkTertiary,
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          selectedServices.add(service);
                        } else {
                          selectedServices.remove(service);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: selectedServices.isNotEmpty
                    ? () {
                        // Save selection later
                        Navigator.pushReplacementNamed(
                          context,
                          '/cleanerhome',
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      FlexColor.mandyRedDarkTertiary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
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
}
