import 'package:cars_teste/src/config/imports.dart';

abstract class SavedLeadsState extends Equatable {
  @override
  List<Object> get props => [];
}

class SavedLeadsInitial extends SavedLeadsState {}

class SavedLeadsLoading extends SavedLeadsState {}

class SavedLeadsLoaded extends SavedLeadsState {
  final List<Lead> leads;

  SavedLeadsLoaded({required this.leads});
}

class SavedLeadsError extends SavedLeadsState {
  final String message;

  SavedLeadsError({required this.message});
}
