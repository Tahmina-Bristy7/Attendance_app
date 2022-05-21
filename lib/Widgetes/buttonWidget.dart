import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  final VoidCallback onClick;
  final IconData icon;
  final String title;
  BuildButton({
    required this.onClick,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(50),
          primary: Colors.teal,
          onPrimary: Colors.black),
      child: Center(
        child: Row(children: [
          Icon(
            icon,
            size: 28,
          ),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(),
          ),
        ]),
      ),
    );
  }
}
