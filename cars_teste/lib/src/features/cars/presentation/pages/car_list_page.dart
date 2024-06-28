import 'package:cars_teste/src/config/imports.dart';

class CarListPage extends StatelessWidget {
  const CarListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: BlocProvider<CarBloc>(
          create: (_) => sl<CarBloc>()..add(GetCarsEvent()),
          child: BlocConsumer<CarBloc, CarState>(
            listener: (context, state) {
              if (state is CarError) {
                messageConfirm(context, state.message, null);
              }
            },
            builder: (context, state) {
              if (state is CarLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CarLoaded) {
                return RefreshIndicator(
                  onRefresh: () async {
                    BlocProvider.of<CarBloc>(context).add(GetCarsEvent());
                  },
                  child: state.cars.isEmpty
                      ? const Center(
                          child: Text('Nenhum Veículo disponível!'),
                        )
                      : ListView.builder(
                          itemCount: state.cars.length,
                          itemBuilder: (context, index) {
                            return state.cars[index].isSaved
                                ? CarTile(
                                    car: state.cars[index],
                                    reserved: () {
                                      BlocProvider.of<CarBloc>(context).add(DeleteCarLeadsEvent(state.cars[index].id));
                                    },
                                  )
                                : CarTile(
                                    car: state.cars[index],
                                    saveLead: (lead) {
                                      BlocProvider.of<CarBloc>(context).add(SaveLeadEvent(lead));
                                    },
                                  );
                          },
                        ),
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          'Nenhum Veículo disponível!',
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CarBloc>(context).add(GetCarsEvent());
                        },
                        child: const Text('Atualizar!'),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
