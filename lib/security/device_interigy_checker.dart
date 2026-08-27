import 'package:jailbreak_root_detection/jailbreak_root_detection.dart';

class DeviceIntegrityChecker {
  const DeviceIntegrityChecker();

  Future<bool> isDeviceCompromised() async {
    try {
      final isCompromised = await Future.any([
        JailbreakRootDetection.instance.isNotTrust,
        Future.delayed(const Duration(seconds: 5), () => false),
      ]);
      return isCompromised;
    } catch (e) {
      return false;
    }
  }
}
