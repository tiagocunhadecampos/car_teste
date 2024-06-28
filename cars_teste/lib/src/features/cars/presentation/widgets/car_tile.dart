import 'package:cars_teste/src/config/imports.dart';

class CarTile extends StatelessWidget {
  final CarModel car;
  final void Function()? reserved;
  final void Function(Lead)? saveLead;
  const CarTile({Key? key, required this.car, this.saveLead, this.reserved}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(car.nomeModelo, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Ano: ${car.ano}'),
            trailing: reserved == null
                ? ElevatedButton(
                    onPressed: () {
                      _handleEuQuero(context);
                    },
                    child: const Text('Eu Quero'),
                  )
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: greenColor,
                    ),
                    onPressed: reserved,
                    child: const Text('Reservado'),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow('Modelo ID', car.modeloId.toString()),
                      _buildInfoRow('Combustível', car.combustivel),
                      _buildInfoRow('Valor', 'R\$ ${car.valor.toStringAsFixed(2)}'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow('Número de Portas', car.numPortas.toString()),
                      _buildInfoRow('Cor', car.cor),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  void _handleEuQuero(BuildContext context) {
    String nome = '';
    String telefone = '';
    String email = '';

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actionsOverflowAlignment: OverflowBarAlignment.center,
        actionsAlignment: MainAxisAlignment.spaceAround,
        actionsOverflowDirection: VerticalDirection.down,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Text(
                car.nomeModelo,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Text(
              'Ano: ${car.ano}',
              style: const TextStyle(fontWeight: FontWeight.w200, fontSize: 16),
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Nome'),
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, digite seu nome.';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            nome = value;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Telefone'),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, digite seu telefone.';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            telefone = value;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, digite seu email.';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Fecha o Dialog
            },
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                Lead lead = Lead(
                  id: car.id,
                  nome: nome,
                  telefone: telefone,
                  email: email,
                  carro: car,
                );

                saveLead!(lead);

                Navigator.of(context).pop();
              }
            },
            child: const Text('Eu Quero'),
          ),
        ],
      ),
    );
  }
}
