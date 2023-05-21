// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:weatherforecast/data/vos/city_vo.dart';

@dao
abstract class CityDao {
  @Query('SELECT * FROM CityVO')
  Future<List<CityVO>> getAllCity();

  @Query('SELECT * FROM CityVO WHERE cityId = :id')
  Future<CityVO?> findCityById(int id);

  @delete
  Future<void> deleteCity(CityVO city);

  @insert
  Future<void> insertCity(CityVO city);
}