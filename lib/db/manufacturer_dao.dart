import 'package:test_app/db/manufacturer_entity.dart';
import 'package:test_app/entities/manufacturer.dart';
import 'package:floor/floor.dart';

@dao
abstract class ManufacturerDao{
  // get all entries
  @Query('SELECT * FROM Manufacturer')
  Future<List<Manufacturer>> fetchAllManufacturers();

  // get an entry by id
  @Query('SELECT * FROM Manufacturer WHERE id = :id')
  Future<ManufacturerEntity?> fetchManufacturerById(String id);

  // remove all entries
  @Query('DELETE FROM PassengerEntity')
  Future<List<ManufacturerEntity>?> removeAllManufacturers();

  // insert a new entry to database
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertManufacturer(ManufacturerEntity manufacturerEntity);

  // insert new list of records to database
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertManufacturers(List<ManufacturerEntity> manufacturers);

  // remove old entries and insert new data
  @transaction
  Future<void> refreshPassengers(List<Manufacturer> manufacturers, int page) async {
    await removeAllManufacturers();
    final list = manufacturers.map((e) => mappingToEntity(e)).toList();
    await insertManufacturers(list);
  }

  // convert manufacturer model to entity
  ManufacturerEntity mappingToEntity(Manufacturer manufacturer) {
    return ManufacturerEntity(manufacturer.id!.toInt(), manufacturer.country.toString(), manufacturer.brand.toString(), manufacturer.name.toString());
  }
}
