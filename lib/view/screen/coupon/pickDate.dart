import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../controller/coupon/couponadd_controller.dart';
class ExpirationDatePicker extends StatefulWidget {
  @override
  _ExpirationDatePickerState createState() => _ExpirationDatePickerState();
}

class _ExpirationDatePickerState extends State<ExpirationDatePicker> {
  DateTime? _selectedDate;  // To hold the selected expiration date
  AddCouponController controlle =Get.put(AddCouponController()) ;

  // Function to pick the expiration date
  Future<void> _pickDate(BuildContext context) async {
    final DateTime initialDate = DateTime.now();
    final DateTime firstDate = DateTime.now();  // The earliest selectable date
    final DateTime lastDate = DateTime(2101);   // The latest selectable date

    // Show the date picker
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    // If the user selected a date, update the state
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        controlle.couponexpiredate=_selectedDate.toString();

      });
    }
  }

  // Format the date for display
  String _formattedDate() {
    if (_selectedDate == null) {
      return "Select Expiration Date";  // Default text when no date is selected
    } else {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');  // Date format
      return formatter.format(_selectedDate!);  // Return formatted date
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Label for Expiration Date
        Text(
          'Expiration Date',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        // Expiration Date TextField with Tap to pick Date
        GestureDetector(
          onTap: (){_pickDate(context);},  // Open date picker when tapped
          child: AbsorbPointer(  // Prevent direct input, only pick date from date picker
            child: TextFormField(
              controller: TextEditingController(text: _formattedDate()),
              decoration: InputDecoration(
                hintText: "Select Expiration Date",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
