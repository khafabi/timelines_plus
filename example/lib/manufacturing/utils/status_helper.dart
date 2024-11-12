import 'package:flutter/material.dart';
import '../../style/app_colors.dart';

class StatusHelper {
  static Color getStatusColor(String status) {
    switch (status) {
      case 'scheduled':
        return appColors.info.main;
      case 'in-process':
        return appColors.warning.main;
      case 'completed':
        return appColors.success.main;
      default:
        return appColors.neutral;
    }
  }

  static String getStatusTitle(String status) {
    switch (status) {
      case 'scheduled':
        return 'Di Jadwalkan';
      case 'in-process':
        return 'Dalam Proses';
      case 'completed':
        return 'Selesai/Ditutup';
      default:
        return '';
    }
  }

  static Icon getStatusIcon(String status, Color iconColor) {
    switch (status) {
      case 'scheduled':
        return Icon(Icons.calendar_today, size: 20, color: iconColor);
      case 'in-process':
        return Icon(Icons.access_time, size: 20, color: iconColor);
      case 'completed':
        return Icon(Icons.check_circle, size: 20, color: iconColor);
      default:
        return Icon(Icons.error, size: 20, color: iconColor);
    }
  }
}
