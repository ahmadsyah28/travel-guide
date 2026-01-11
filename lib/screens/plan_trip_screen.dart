import 'package:flutter/material.dart';
import '../models/travel_place.dart';
import 'place_overview_screen.dart';

class PlanTripScreen extends StatefulWidget {
  const PlanTripScreen({super.key});

  @override
  State<PlanTripScreen> createState() => _PlanTripScreenState();
}

class _PlanTripScreenState extends State<PlanTripScreen> {
  // Selected destination
  String selectedDestination = 'Mount Fuji, Japan';

  // Date selection
  int selectedDateIndex = 0;
  final List<Map<String, dynamic>> dates = [
    {'day': 'T', 'date': 14, 'selected': true},
    {'day': 'W', 'date': 15, 'selected': false},
    {'day': 'T', 'date': 16, 'selected': false},
    {'day': 'F', 'date': 17, 'selected': false},
    {'day': 'S', 'date': 18, 'selected': false},
    {'day': 'S', 'date': 19, 'selected': false},
    {'day': 'M', 'date': 20, 'selected': false},
  ];

  // Budget
  double budgetValue = 1100.0;
  final double minBudget = 200.0;
  final double maxBudget = 2000.0;

  // Travel styles
  List<TravelStyle> styles = List.from(travelStyles);

  void _selectDate(int index) {
    setState(() {
      selectedDateIndex = index;
      for (int i = 0; i < dates.length; i++) {
        dates[i]['selected'] = i == index;
      }
    });
  }

  void _selectStyle(int index) {
    setState(() {
      for (int i = 0; i < styles.length; i++) {
        styles[i] = styles[i].copyWith(isSelected: i == index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F4FC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // App Bar
                _buildAppBar(context),
                const SizedBox(height: 20),

                // Destination Card
                _buildDestinationCard(),
                const SizedBox(height: 16),

                // Date & Budget Card
                _buildDateBudgetCard(),
                const SizedBox(height: 16),

                // Travel Style Card
                _buildTravelStyleCard(),
                const SizedBox(height: 16),

                // Generate Itinerary Button
                _buildGenerateButton(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, size: 18),
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
          ),
        ),
        const Text(
          'Plan A Trip',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            icon: const Icon(Icons.more_horiz, size: 18),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildDestinationCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F4FC),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.location_on_outlined,
              color: Color(0xFF4A90E2),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              selectedDestination,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F4FC),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.equalizer,
              color: Color(0xFF4A90E2),
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateBudgetCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Date & Budget',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: Color(0xFF4A90E2),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Date Selector
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              dates.length,
              (index) => _buildDateItem(
                dates[index]['day'],
                dates[index]['date'],
                dates[index]['selected'],
                () => _selectDate(index),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Amount Display
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Amount',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '\$${budgetValue.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Budget Slider
          Row(
            children: [
              Text(
                '\$${minBudget.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: const Color(0xFF4A90E2),
                    inactiveTrackColor: const Color(0xFFE0E0E0),
                    thumbColor: Colors.white,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 12,
                      elevation: 4,
                    ),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 20),
                    valueIndicatorColor: const Color(0xFF4A90E2),
                    valueIndicatorTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    showValueIndicator: ShowValueIndicator.always,
                  ),
                  child: Slider(
                    value: budgetValue,
                    min: minBudget,
                    max: maxBudget,
                    label: '\$${budgetValue.toStringAsFixed(2)}',
                    onChanged: (value) {
                      setState(() {
                        budgetValue = value;
                      });
                    },
                  ),
                ),
              ),
              Text(
                '\$${maxBudget.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDateItem(
      String day, int date, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            day,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.white : Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF4A90E2) : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                date.toString(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTravelStyleCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Travel Style',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: Color(0xFF4A90E2),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Style Options
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              styles.length,
              (index) => _buildStyleItem(
                styles[index],
                () => _selectStyle(index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStyleItem(TravelStyle style, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: style.isSelected
                  ? const Color(0xFF4A90E2).withOpacity(0.1)
                  : const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(16),
              border: style.isSelected
                  ? Border.all(color: const Color(0xFF4A90E2), width: 2)
                  : null,
            ),
            child: Center(
              child: Text(
                style.emoji,
                style: const TextStyle(fontSize: 28),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            style.name,
            style: TextStyle(
              fontSize: 11,
              fontWeight:
                  style.isSelected ? FontWeight.w600 : FontWeight.normal,
              color: style.isSelected ? const Color(0xFF4A90E2) : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenerateButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          // Navigate to Place Overview
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlaceOverviewScreen(
                place: travelPlaces[0],
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4A90E2),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        child: const Text(
          'Generate Itinerary',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
