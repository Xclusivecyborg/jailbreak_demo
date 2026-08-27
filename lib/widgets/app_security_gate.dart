import 'package:flutter/material.dart';
import 'package:jailbreak_demo/security/device_interigy_checker.dart';
import 'package:jailbreak_demo/widgets/compromised_device_dialog.dart';

class AppSecurityGate extends StatefulWidget {
  const AppSecurityGate({
    super.key,
    required this.child,
    this.integrityChecker = const DeviceIntegrityChecker(),
  });

  final Widget child;
  final DeviceIntegrityChecker integrityChecker;

  @override
  State<AppSecurityGate> createState() => _AppSecurityGateState();
}

class _AppSecurityGateState extends State<AppSecurityGate> {
  Future<bool>? _integrityFutureCheck;
  bool _hasShownDialog = false;

  @override
  void initState() {
    super.initState();
    _integrityFutureCheck = _resolveIntegrity();
  }

  Future<bool> _resolveIntegrity() async {
    bool isCompromised = false;
    try {
      isCompromised = await widget.integrityChecker.isDeviceCompromised();
    } catch (_) {
      isCompromised = false;
    }

    if (mounted && isCompromised) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showCompromisedDialog();
      });
    }

    return isCompromised;
  }

  Future<void> _showCompromisedDialog() async {
    if (_hasShownDialog || !mounted) {
      return;
    }
    _hasShownDialog = true;

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: CompromisedDeviceDialog(onCloseApp: () {}),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _integrityFutureCheck,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: SizedBox.expand());
        }

        final isCompromised = snapshot.data ?? false;

        if (isCompromised) {
          return const Scaffold(body: SizedBox.expand());
        }

        return widget.child;
      },
    );
  }
}
