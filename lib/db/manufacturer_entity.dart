import 'package:floor/floor.dart';

@entity
class ManufacturerEntity{
  @primaryKey
  final int id;

  final String country;
  final String brand;
  final String name;

  ManufacturerEntity(this.id, this.country, this.brand, this.name);
}
