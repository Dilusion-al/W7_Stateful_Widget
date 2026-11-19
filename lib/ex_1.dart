import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableButton(),
            SizedBox(height: 16),
            SelectableButton(),
            SizedBox(height: 16),
            SelectableButton(),
            SizedBox(height: 16),
            SelectableButton(),
            SizedBox(height: 16),
          ],
        ),
      ),
    ),
  ),
);

class SelectableButton extends StatefulWidget {
  const SelectableButton({super.key});

  @override
  State<SelectableButton> createState() => _SelectableButton();
}

class _SelectableButton extends State<SelectableButton> {
  bool _isSelected = false;
  String get _buttonText => _isSelected ? 'Selected' : 'Not Selected';
  Color get _textColor => _isSelected ? Colors.white : Colors.black;
  Color? get _backgroundColor =>
      _isSelected ? Colors.blue[500] : Colors.blue[50];

      void toggle () {
        setState(() {
          _isSelected = !_isSelected;
        });
      }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: _backgroundColor),
        onPressed:
          toggle,
        child: Center(
          child: Text(
            _buttonText,
            style: TextStyle(
              color: _textColor
            ),
          ),
        ),
      ),
    );
  }
}
