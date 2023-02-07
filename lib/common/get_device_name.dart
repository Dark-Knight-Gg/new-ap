import 'package:device_name/device_name.dart';
class GetDeviceName{
  Future<DeviceName> getDeviceName() async {
    final deviceName = DeviceName();
    return deviceName;
  }
}