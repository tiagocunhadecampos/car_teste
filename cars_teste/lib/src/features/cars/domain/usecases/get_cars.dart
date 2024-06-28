import 'package:cars_teste/src/config/imports.dart';

class GetCars implements UseCase<List<CarModel>, NoParams> {
  final CarRepository repository;

  GetCars(this.repository);

  @override
  Future<List<CarModel>> call(NoParams params) async {
    return await repository.getCars();
  }
}
