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
  int selectIndex = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      selectIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
            onPressed: () {
              if (selectIndex < 20) {
                selectIndex++;
                setState(() {});
                widget.onIncrement(selectIndex);
              }
            },
            child: Icon(Icons.add)),
        Text('$selectIndex'),
        TextButton(
            onPressed: () {
              if (selectIndex > 1) {
                selectIndex--;
                setState(() {});
                widget.onDecrement(selectIndex);
              }
            },
            child: Icon(Icons.remove))
      ],
    );
  }
}
