import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:seat_sense_flutter/services/api_service.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AttendanceService {
  final ApiService _apiService = ApiService();
  final Logger _logger = Logger();

  Future<bool> markAttendance({
    required BuildContext context,
    required String eventId,
    required double latitude,
    required double longitude,
    required String imagePath,
  }) async {
    try {
      final formData = FormData.fromMap({
        'event_id': eventId,
        'latitude': latitude,
        'longitude': longitude,
        'image': await MultipartFile.fromFile(imagePath, filename: 'face.jpg'),
      });

      final response = await _apiService.post(
        '/attendance/mark-from-image',
        data: formData,
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        ShadToaster.of(context).show(
          ShadToast(title: Text('Server returned: ${response.statusCode}')),
        );
      }
    } on DioException catch (e) {
      String errorMessage =
          e.response?.data['detail'] ?? 'Failed to mark attendance.';

      Future.delayed(Duration.zero, () {
        ShadToaster.of(context).show(ShadToast(title: Text(errorMessage)));
      });
    } catch (e) {
      _logger.e('Unexpected Error: ${e.toString()}');
      ShadToaster.of(
        context,
      ).show(const ShadToast(title: Text('Unexpected error occurred')));
    }

    return false;
  }
}
