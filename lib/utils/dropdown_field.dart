import 'package:flutter/material.dart';

class MyDropdownFormField extends StatefulWidget {
  const MyDropdownFormField({super.key});

  @override
  _MyDropdownFormFieldState createState() => _MyDropdownFormFieldState();
}

class _MyDropdownFormFieldState extends State<MyDropdownFormField> {
  double _loan = 0;
  final String _selectedItem = " ";

  final List<String> _items = [
    'Item 1',
    'Item 2',
    'Item 3',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<double>(
      value: _loan,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade600, width: 1)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade600)),
        filled: true,
        fillColor: Colors.white,
      ),
      dropdownColor: Colors.white,
      onChanged: (double? value) {
        setState(() {
          _loan = value!;
        });
      },
      items: const [
        DropdownMenuItem(
          value: 0,
          child: Text(' '),
        ),
        DropdownMenuItem(
          value: 5000,
          child: Text('fuliza'),
        ),
        DropdownMenuItem(
          value: 10000,
          child: Text('KCB'),
        ),
        DropdownMenuItem(
          value: 15000,
          child: Text('Advance Salary'),
        ),
        DropdownMenuItem(
          value: 20000,
          child: Text('Mkopa'),
        ),
      ],
      validator: (value) {
        if (value == null) {
          return 'Please select an amount';
        }
        return null;
      },
    );
  }
}
