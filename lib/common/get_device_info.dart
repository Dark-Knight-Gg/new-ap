import 'package:device_info/device_info.dart';
class GetDeviceInfo{
  Future<AndroidDeviceInfo> getDeviceInfo() async{
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo;
  }
}