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
  final List<Map<String, dynamic>> services = [
    {
      'name': 'Home Cleaning',
      'icon': Icons.home_outlined,
      'description': 'Standard residential cleaning',
    },
    {
      'name': 'Office Cleaning',
      'icon': Icons.business_outlined,
      'description': 'Commercial space maintenance',
    },
    {
      'name': 'Deep Cleaning',
      'icon': Icons.cleaning_services_outlined,
      'description': 'Thorough top-to-bottom clean',
    },
    {
      'name': 'Post-construction Cleaning',
      'icon': Icons.construction_outlined,
      'description': 'Removal of dust and debris',
    },
    {
      'name': 'Laundry & Ironing',
      'icon': Icons.local_laundry_service_outlined,
      'description': 'Wash, dry, fold, and iron',
    },
  ];

  final Set<String> selectedServices = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Services'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What services do you offer?',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'We’ll only assign jobs that match your experience.',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.black54),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.builder(
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    final service = services[index];
                    final String name = service['name'];
                    final IconData icon = service['icon'];
                    final String description = service['description'];
                    final bool isSelected = selectedServices.contains(name);

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected
                                ? FlexColor.mandyRedDarkTertiary
                                : Colors.grey.shade200,
                            width: isSelected ? 2 : 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: CheckboxListTile(
                          value: isSelected,
                          activeColor: FlexColor.mandyRedDarkTertiary,
                          checkboxShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          title: Row(
                            children: [
                              Icon(
                                icon,
                                color: isSelected
                                    ? FlexColor.mandyRedDarkTertiary
                                    : Colors.grey.shade600,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: isSelected
                                            ? Colors.black87
                                            : Colors.black54,
                                      ),
                                    ),
                                    Text(
                                      description,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          onChanged: (value) {
                            setState(() {
                              if (value == true) {
                                selectedServices.add(name);
                              } else {
                                selectedServices.remove(name);
                              }
                            });
                          },
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: selectedServices.isNotEmpty
                      ? () {
                          // TODO: Save selection to user profile/backend
                          Navigator.pushReplacementNamed(
                            context,
                            '/cleanerverification',
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: FlexColor.mandyRedDarkTertiary,
                    disabledBackgroundColor: Colors.grey.shade300,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
