import 'package:cars_teste/src/config/imports.dart';

class DeleteLead implements UseCase<void, int> {
  final CarRepository repository;

  DeleteLead(this.repository);

  @override
  Future<void> call(int id) async {
    return await repository.deleteLead(id);
  }
}
