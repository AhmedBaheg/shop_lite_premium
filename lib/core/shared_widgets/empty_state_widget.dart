import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.iconSize = 64,
    this.iconColor = const Color(0xFF94A3B8),
    this.titleColor = const Color(0xFF1E293B),
    this.descriptionColor = const Color(0xFF64748B),
    this.titleFontSize = 18,
    this.descriptionFontSize = 14,
    this.padding = const EdgeInsets.all(24),
    this.spacing = 16,
  });

  final IconData icon;
  final String title;
  final String description;

  final double iconSize;
  final Color iconColor;
  final Color titleColor;
  final Color descriptionColor;

  final double titleFontSize;
  final double descriptionFontSize;
  final double spacing;

  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: iconSize,
              color: iconColor,
            ),
            SizedBox(height: spacing),
            Text(
              title,
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.w600,
                color: titleColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: descriptionFontSize,
                color: descriptionColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

