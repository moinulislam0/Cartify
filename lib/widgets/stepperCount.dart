import 'package:flutter/material.dart';

class Steppercount extends StatefulWidget {
  final Function(int currentValue) onIncrement, onDecrement;
  const Steppercount(
      {super.key, required this.onIncrement, required this.onDecrement});

  @override
  State<Steppercount> createState() => _SteppercountState();
}

class _SteppercountState extends State<Steppercount> {
  TextEditingController stepCount = TextEditingController();
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
            onPressed: () {
              if (selectIndex < 20) {
                selectIndex++;
                stepCount.text = selectIndex.toString();
                widget.onIncrement(selectIndex);
              }
            },
            child: Icon(Icons.add)),
        SizedBox(
          width: 44,
          child: TextField(
            controller: stepCount,
            style: TextStyle(color: Colors.black),
            enabled: false,
            decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          ),
        ),
        TextButton(
            onPressed: () {
              if (selectIndex > 0) {
                selectIndex--;
                stepCount.text = selectIndex.toString();
                widget.onDecrement(selectIndex);
              }
            },
            child: Icon(Icons.remove))
      ],
    );
  }
}
