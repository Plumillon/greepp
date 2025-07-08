sealed class GreenEntity {
  final String id;
  final String name;
  final String? image;
  final String? description;
  final List<String> colors;

  GreenEntity({
    required this.id,
    required this.name,
    this.image,
    this.description,
    this.colors = const [],
  });
}

class VegetableEntity extends GreenEntity {
  VegetableEntity({
    required super.id,
    required super.name,
    super.image,
    super.description,
    super.colors,
  });
}

class FruitEntity extends GreenEntity {
  FruitEntity({
    required super.id,
    required super.name,
    super.image,
    super.description,
    super.colors,
  });
}
