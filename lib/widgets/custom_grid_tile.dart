import 'dart:math';
import 'package:flutter/material.dart';

class CustomGridTile extends StatelessWidget {
  const CustomGridTile({
    super.key,
    required this.title,
    required this.data,
    required this.isFavorite,
  });

  final String title;
  final String data;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)].withAlpha(3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              isFavorite
                  ? const Icon(Icons.star, color: Colors.pink)
                  : const Icon(Icons.star_border)
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Text(data,
            maxLines: 20,
            overflow: TextOverflow.ellipsis,
             style: Theme.of(context).textTheme.bodyMedium),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
