import 'package:equatable/equatable.dart';

class SportInfo extends Equatable {
  final String imagePath;
  final String name;

  SportInfo({
    required this.imagePath,
    required this.name,
  });

  @override
  List<Object?> get props => [imagePath, name];
}
