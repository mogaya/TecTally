import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  // Controller to hold selected date in text form
  TextEditingController _dateController = TextEditingController();

  // Method to display the date picker and update the text field
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Current date is shown by default
      firstDate: DateTime(2000), // The earliest date allowed
      lastDate: DateTime(2101), // The latest date allowed
    );

    if (picked != null) {
      setState(() {
        // Formatting the date to a readable format
        _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Input Field Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _dateController,
              readOnly: true, // So the user cannot directly type in the date
              decoration: InputDecoration(
                labelText: 'Select Date',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today), // Adds a calendar icon
              ),
              onTap: () {
                // When tapped, show the date picker
                _selectDate(context);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Date is required';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: Test(),
    ));
