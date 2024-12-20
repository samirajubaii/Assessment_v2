import 'package:flutter/material.dart';
import 'service_provider.dart';
class ProfessionWidget extends StatefulWidget {
  final Function(String) updateProfession;

  const ProfessionWidget({required this.updateProfession, super.key});

  @override
  _ProfessionWidgetState createState() => _ProfessionWidgetState();
}
class _ProfessionWidgetState extends State<ProfessionWidget> {
  String? _selectedProfession;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: const Text('Select Profession'),
      value: _selectedProfession,
      onChanged: (value) {
        setState(() {
          _selectedProfession = value;
          widget.updateProfession(value!);
        });
      },
      items: ['Plumber', 'Electrician', 'Carpenter']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}