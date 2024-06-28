import 'package:cars_teste/src/config/imports.dart';

class SavedLeadsPage extends StatelessWidget {
  const SavedLeadsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Scaffold(
        body: BlocProvider<SavedLeadsBloc>(
          create: (_) => sl<SavedLeadsBloc>()..add(GetSavedLeadsEvent()),
          child: BlocConsumer<SavedLeadsBloc, SavedLeadsState>(
            listener: (context, state) {
              if (state is SavedLeadsError) {
                messageConfirm(context, state.message, null);
              }
            },
            builder: (context, state) {
              if (state is SavedLeadsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SavedLeadsLoaded) {
                return RefreshIndicator(
                  onRefresh: () async {
                    BlocProvider.of<SavedLeadsBloc>(context).add(GetSavedLeadsEvent());
                  },
                  child: state.leads.isEmpty
                      ? const Center(
                          child: Text('Adicione um Veículo!'),
                        )
                      : ListView.builder(
                          itemCount: state.leads.length,
                          itemBuilder: (context, index) {
                            return CarTile(
                              car: state.leads[index].carro,
                              reserved: () {
                                messageConfirm(
                                    context,
                                    'Tem certeza que gostaria de excluir a reserva?',
                                    () => BlocProvider.of<SavedLeadsBloc>(context)
                                        .add(DeleteLeadsEvent(state.leads[index].id)));
                              },
                            );
                          },
                        ),
                );
              } else {
                return const Center(
                  child: Text('Adicione um Veículo!'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
