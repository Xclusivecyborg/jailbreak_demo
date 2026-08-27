import 'package:flutter/material.dart';

class CompromisedDeviceDialog extends StatelessWidget {
  const CompromisedDeviceDialog({required this.onCloseApp, super.key});

  final VoidCallback onCloseApp;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFFF5EE), Color(0xFFFFE3D4)],
          ),
          border: Border.all(color: const Color(0xFFFFB087), width: 1.2),
        ),
        padding: const EdgeInsets.fromLTRB(22, 20, 22, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 62,
              height: 62,
              decoration: const BoxDecoration(
                color: Color(0xFFFFEFE5),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.security_rounded,
                size: 34,
                color: Color(0xFFC24B00),
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Unsupported Device Security State',
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: const Color(0xFF6E2600),
                height: 1.2,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'This device appears to be jailbroken or rooted. '
              'For your protection, this app is blocked on devices that '
              'do not meet our security requirements.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: const Color(0xFF7A3D1A),
                height: 1.4,
              ),
            ),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}
