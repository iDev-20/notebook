import 'package:flutter/material.dart';

class NoteBookWidget extends StatelessWidget {
  const NoteBookWidget({
    super.key,
    required this.label,
    this.icon,
    required this.color,
    this.onPressed,
  });

  final String label;
  final IconData? icon;
  final String color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
          height: 164,
          child: Stack(
            children: [
              Image.asset(color),
              Positioned(
                left: 15,
                right: 0,
                bottom: 0,
                top: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (icon != null)
                      Icon(
                        icon,
                        size: 25,
                        color: Colors.white,
                      ),
                    Text(
                      label,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ],
          ),),
    );
  }
}