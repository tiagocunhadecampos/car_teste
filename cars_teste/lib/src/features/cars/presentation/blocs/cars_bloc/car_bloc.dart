import 'package:cars_teste/src/config/imports.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final GetCars getCars;
  final SaveLead saveLead;
  final DatabaseManager databaseManager;
  final DeleteLead deleteLead;

  CarBloc({required this.getCars, required this.saveLead, required this.databaseManager, required this.deleteLead})
      : super(CarInitial()) {
    on<GetCarsEvent>(_onGetCars);
    on<SaveLeadEvent>(_onSaveLead);
    on<DeleteCarLeadsEvent>(_onDeleteLead);
  }

  void _onGetCars(GetCarsEvent event, Emitter<CarState> emit) async {
    emit(CarLoading());
    try {
      final List<CarModel> cars = await getCars(NoParams());
      final List<CarModel> updatedCars = [];

      for (var car in cars) {
        bool isSaved = await databaseManager.isCarSaved(car.id);
        updatedCars.add(car.copyWith(isSaved: isSaved));
      }

      emit(CarLoaded(cars: updatedCars));
    } catch (e) {
      emit(CarError(message: 'Erro ao buscar os Carros!'));
    }
  }

  void _onSaveLead(SaveLeadEvent event, Emitter<CarState> emit) async {
    emit(CarLoading());
    try {
      await saveLead(event.lead);
      add(GetCarsEvent());
    } catch (e) {
      emit(CarError(message: 'Erro ao realizar a reserva!'));
    }
  }

  void _onDeleteLead(DeleteCarLeadsEvent event, Emitter<CarState> emit) async {
    emit(CarLoading());
    try {
      await deleteLead(event.id);
      add(GetCarsEvent());
    } catch (e) {
      emit(CarError(message: 'Erro ao deletar a reserva!: $e'));
    }
  }
}
