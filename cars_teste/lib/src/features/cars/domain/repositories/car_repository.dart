import 'package:cars_teste/src/config/imports.dart';

abstract class CarRepository {
  Future<List<CarModel>> getCars();
  Future<void> saveLead(Lead lead);
  Future<void> deleteLead(int id);
  Future<List<Lead>> getAllLeads();
}
