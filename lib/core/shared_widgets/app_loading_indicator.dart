import 'package:flutter/material.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({
    super.key,
    this.message = 'Loading products...',
    this.subtitle = 'Please wait a moment',
    this.color = const Color(0xFF2463EB),
    this.showSubtitle = true,
    this.size = 58,
  });

  final String message;
  final String? subtitle;
  final Color color;
  final bool showSubtitle;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: size + 24,
              height: size + 24,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.07),
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: color.withValues(alpha: 0.10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: color.withValues(alpha: 0.06),
                    blurRadius: 24,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Center(
                child: SizedBox(
                  width: size,
                  height: size,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    strokeCap: StrokeCap.round,
                    color: color,
                    backgroundColor: color.withValues(alpha: 0.12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E293B),
                letterSpacing: 0.1,
              ),
            ),

            if (showSubtitle && subtitle != null) ...[
              const SizedBox(height: 7),
              Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF94A3B8),
                  height: 1.5,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
