

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Picture extends Equatable {
  final String name;
  final String year;
  final String description;
  final Image image;
  final bool? isFavorite;

  const Picture({
    required this.name,
    required this.year,
    required this.description,
    required this.image,
    this.isFavorite = false
  });


  @override
  List<Object?> get props => [name, year, description, image, isFavorite];


  @override
  bool get stringify => true;


  Picture copyWith({
    String? name,
    String? year,
    String? description,
    Image? image,
    bool? isFavorite,
  }) => Picture(
      name: name ?? this.name,
      year: year ?? this.year,
      description: description ?? this.description,
      image: image ?? this.image,
      isFavorite: isFavorite ?? this.isFavorite,
   );
}

