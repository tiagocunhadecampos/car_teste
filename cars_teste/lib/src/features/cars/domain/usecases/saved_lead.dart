import 'package:cars_teste/src/config/imports.dart';

class SaveLead implements UseCase<void, Lead> {
  final CarRepository repository;

  SaveLead(this.repository);

  @override
  Future<void> call(Lead lead) async {
    return await repository.saveLead(lead);
  }
}
