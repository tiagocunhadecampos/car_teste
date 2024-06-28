import 'package:cars_teste/src/config/imports.dart';

class SavedLeadsBloc extends Bloc<SavedLeadsEvent, SavedLeadsState> {
  final GetSavedLeads getSavedLeads;
  final DeleteLead deleteLead;

  SavedLeadsBloc({required this.getSavedLeads, required this.deleteLead}) : super(SavedLeadsInitial()) {
    on<GetSavedLeadsEvent>(_onGetSavedLeads);
    on<DeleteLeadsEvent>(_onDeleteLeads);
  }

  void _onGetSavedLeads(GetSavedLeadsEvent event, Emitter<SavedLeadsState> emit) async {
    emit(SavedLeadsLoading());
    try {
      final leads = await getSavedLeads(NoParams());

      if (leads.isNotEmpty) {
        final response = await post(
          Uri.parse('$BASE_URL/cars/leads'),
          headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
          body: jsonEncode(leads.map((lead) => lead.toJson()).toList()),
        );

        if (response.statusCode == 200) {
          debugPrint('--------------------------------');
          debugPrint('---- Sucess to post leads--------');
          debugPrint('--------------------------------');
        } else {
          debugPrint('--------------------------------');
          debugPrint('---- Failed to post leads--------');
          debugPrint('--------------------------------');
        }
      } else {
        debugPrint('--------------------------------');
        debugPrint('---- Nenhum Leads Salvo --------');
        debugPrint('--------------------------------');
      }
      //  final leads = await getSavedLeads(NoParams());
      emit(SavedLeadsLoaded(leads: leads));
    } catch (e) {
      emit(SavedLeadsError(message: 'Erro as resevas salvas'));
    }
  }

  void _onDeleteLeads(DeleteLeadsEvent event, Emitter<SavedLeadsState> emit) async {
    emit(SavedLeadsLoading());
    try {
      await deleteLead(event.id);
      add(GetSavedLeadsEvent());
    } catch (e) {
      emit(SavedLeadsError(message: 'Erro ao excluir a reserva!'));
    }
  }
}
