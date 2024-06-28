import 'package:cars_teste/src/config/imports.dart';

class CarRepositoryImpl implements CarRepository {
  final Client client;
  final DatabaseManager databaseManager;

  CarRepositoryImpl({
    required this.client,
    required this.databaseManager,
  });

  @override
  Future<List<CarModel>> getCars() async {
    final response = await client.get(Uri.parse('$BASE_URL/cars.json'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body)['cars'];
      return jsonResponse.map((json) => CarModel.fromJson(json)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> saveLead(Lead lead) async {
    try {
      await databaseManager.saveLead(lead);
    } catch (e) {
      throw AppDatabaseException('Erro ao salvar lead no banco de dados');
    }
  }

  @override
  Future<List<Lead>> getAllLeads() async {
    try {
      return await databaseManager.getAllLeads();
    } catch (e) {
      throw AppDatabaseException('Erro ao buscar os lead no banco de dados');
    }
  }

  @override
  Future<void> deleteLead(int id) async {
    try {
      return await databaseManager.deleteLead(id);
    } catch (e) {
      throw AppDatabaseException('Erro ao buscar os lead no banco de dados');
    }
  }
}
