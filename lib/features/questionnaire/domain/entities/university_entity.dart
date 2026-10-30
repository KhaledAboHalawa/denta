import 'package:equatable/equatable.dart';

class UniversityEntity extends Equatable {
  final String id;
  final String name;

  const UniversityEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
