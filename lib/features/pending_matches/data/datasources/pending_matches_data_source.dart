import 'package:denta/core/config/base_response/result.dart';
import 'package:denta/core/network/api_executer.dart';
import 'package:denta/features/pending_matches/data/models/pending_match_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// NOTE: mock data until the backend contract is available.
/// Assumed endpoint: `GET /student/pending-matches` returning
/// `{ "data": [{ "id", "title", "location", "requestedAt" (ISO 8601),
/// "status": "searching_for_patients" | "needs_adjustments" }] }`.
/// Keep every change here, in this one file.
@lazySingleton
class PendingMatchesDataSource {
  Future<Result<List<PendingMatchModel>>> getPendingMatches() async {
    return await executeApiCall<List<PendingMatchModel>>(
      apiCall: () async {
        await Future.delayed(const Duration(seconds: 1));
        return Response<Map<String, dynamic>>(
          statusCode: 200,
          data: {'data': _mockMatches},
          requestOptions: RequestOptions(),
        );
        // return await _dio.get<Map<String, dynamic>>('/student/pending-matches');
      },
      parser: (json) => (json['data'] as List? ?? [])
          .map((e) => PendingMatchModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

const _searching = 'searching_for_patients';
const _needsAdjustments = 'needs_adjustments';

const List<Map<String, dynamic>> _mockMatches = [
  {
    'id': '1',
    'title': 'Composite Restoration',
    'location': 'Alexandria, Egypt',
    'requestedAt': '2026-10-08',
    'status': _searching,
  },
  {
    'id': '2',
    'title': 'Amalgam Restoration',
    'location': 'Alexandria, Egypt',
    'requestedAt': '2026-10-08',
    'status': _needsAdjustments,
  },
  {
    'id': '3',
    'title': 'Complete Denture',
    'location': 'Alexandria, Egypt',
    'requestedAt': '2026-10-08',
    'status': _searching,
  },
  {
    'id': '4',
    'title': 'Fluoride Application',
    'location': 'Alexandria, Egypt',
    'requestedAt': '2026-10-08',
    'status': _searching,
  },
  {
    'id': '5',
    'title': 'Simple Tooth Extraction',
    'location': 'Alexandria, Egypt',
    'requestedAt': '2026-10-08',
    'status': _needsAdjustments,
  },
  {
    'id': '6',
    'title': 'Pediatric Dental Treatment',
    'location': 'Alexandria, Egypt',
    'requestedAt': '2026-10-08',
    'status': _searching,
  },
  {
    'id': '7',
    'title': 'Surgical Tooth Extraction',
    'location': 'Alexandria, Egypt',
    'requestedAt': '2026-10-08',
    'status': _needsAdjustments,
  },
];
