import 'package:denta/features/questionnaire/domain/entities/university_entity.dart';

class UniversityModel {
  final String id;
  final String name;

  const UniversityModel({required this.id, required this.name});

  factory UniversityModel.fromJson(Map<String, dynamic> json) =>
      UniversityModel(
        id: json['id']?.toString() ?? '',
        name: json['name']?.toString() ?? '',
      );

  UniversityEntity toEntity() => UniversityEntity(id: id, name: name);
}
