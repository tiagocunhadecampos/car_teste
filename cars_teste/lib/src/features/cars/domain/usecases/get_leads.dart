import 'package:cars_teste/src/config/imports.dart';

class GetSavedLeads implements UseCase<List<Lead>, NoParams> {
  final CarRepository repository;

  GetSavedLeads(this.repository);

  @override
  Future<List<Lead>> call(NoParams params) async {
    return await repository.getAllLeads();
  }
}
