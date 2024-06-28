import 'package:cars_teste/src/config/imports.dart';

abstract class SavedLeadsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetSavedLeadsEvent extends SavedLeadsEvent {}

class GetLeadsEvent extends SavedLeadsEvent {
  final List<Lead> leads;

  GetLeadsEvent(this.leads);

  @override
  List<Object> get props => [leads];
}

class DeleteLeadsEvent extends SavedLeadsEvent {
  final int id;

  DeleteLeadsEvent(this.id);

  @override
  List<Object> get props => [id];
}
