import 'package:flutter/material.dart';
import 'package:naheelsoufan_game/src/core/services/language_services.dart';
import 'package:naheelsoufan_game/src/data/model/difficulties/difficulties_model_class.dart';

import '../../../core/constant/api_end_points.dart';
import '../../../core/services/api_services.dart';

class DifficultyService {

  final ApiServices _apiServices = ApiServices();
  final LanguageIdService _languageIdService = LanguageIdService();

  Future<DifficultiesModelClass?> fetchDifficultyData() async {
    try {
      final response = await _apiServices.getData(
        endPoint: ApiEndPoints.fetchDifficultiesUrl,
      );

      DifficultiesModelClass? difficultiesModelClass;

      if (response['success'] == true && response['data'] != null) {
        difficultiesModelClass = DifficultiesModelClass.fromJson(response);
        debugPrint('Difficulties data fetched successfully');
        debugPrint('Difficulties data: ${difficultiesModelClass.data}');
        await _languageIdService.setToken(difficultiesModelClass.data.first.language.id);
        final languageId = await _languageIdService.getToken();
        debugPrint("\n\n\nLanguageID: $languageId\n\n\n");
        return difficultiesModelClass;
      }
    } catch (e) {
      debugPrint('Error fetching difficulties data: $e');
      return null;
    }
    return null;
  }
}
