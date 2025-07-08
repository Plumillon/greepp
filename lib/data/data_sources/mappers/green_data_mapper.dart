import 'package:greepp/core/extensions/collection_extensions.dart';
import 'package:greepp/core/mappers/to_mapper.dart';
import 'package:greepp/domain/entities/green_entity.dart';

class GreenDataMapper implements ToMapper<GreenEntity, Map<String, dynamic>> {
  @override
  GreenEntity mapTo(Map<String, dynamic> to) {
    return switch (to.getOrNull('type')) {
      'fruit' => FruitEntity(
          id: to['uid'],
          name: to['name'] as String,
          image: to.getOrNull<String>('image'),
          description: to.getOrNull<String>('description'),
          colors: to['colors'] != null ? to['colors'].cast<String>() : [],
        ),
      _ => VegetableEntity(
          id: to['uid'],
          name: to['name'] as String,
          image: to.getOrNull<String>('image'),
          description: to.getOrNull<String>('description'),
          colors: to['colors'] != null ? to['colors'].cast<String>() : [],
        ),
    };
  }
}
