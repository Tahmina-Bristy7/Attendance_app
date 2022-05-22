import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  final VoidCallback onClick;
  final IconData icon;
  final String title;
  final double sizeWidth;
  final Color inputColor;

  BuildButton({
    required this.onClick,
    required this.icon,
    required this.title,
    required this.sizeWidth,
    required this.inputColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: MediaQuery.of(context).size.height / 16,
        width: sizeWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: inputColor,
        ),
        child: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              icon,
              color: Colors.white,
              size: 28,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ]),
        ),
      ),
    );
  }
}
