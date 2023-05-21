import 'dart:async';

import 'package:floor/floor.dart';
import 'package:weatherforecast/data/vos/city_vo.dart';
import 'package:weatherforecast/persistance/city_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [CityVO])
abstract class AppDatabase extends FloorDatabase {
  CityDao get cityDao;
}
