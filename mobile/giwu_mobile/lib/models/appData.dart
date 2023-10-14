import 'package:giwu_mobile/models/appError.dart';

class AppData {
  AppData({
    required this.host,
    this.appError,
  });

  final String host;
  AppError? appError;
}
