import 'package:cars_teste/src/config/imports.dart';

abstract class CarEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetCarsEvent extends CarEvent {}

class SaveLeadEvent extends CarEvent {
  final Lead lead;

  SaveLeadEvent(this.lead);

  @override
  List<Object> get props => [lead];
}

class DeleteCarLeadsEvent extends CarEvent {
  final int id;

  DeleteCarLeadsEvent(this.id);

  @override
  List<Object> get props => [id];
}
