import 'package:cars_teste/src/config/imports.dart';

class DatabaseManager {
  late Database _database;

  Future<void> initialize() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'leads.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE leads(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT,
            telefone TEXT,
            email TEXT,
            carro TEXT
          )
        ''');
      },
    );
  }

  Future<void> saveLead(Lead lead) async {
    try {
      await _database.insert(
        'leads',
        {
          'id': lead.id,
          'nome': lead.nome,
          'telefone': lead.telefone,
          'email': lead.email,
          'carro': jsonEncode(lead.carro.toJson()),
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      throw AppDatabaseException('Erro ao salvar lead no banco de dados');
    }
  }

  Future<List<Lead>> getAllLeads() async {
    final List<Map<String, dynamic>> maps = await _database.query('leads');
    if (maps.isEmpty) {
      return [];
    }
    return maps.map((map) => Lead.fromJson(map)).toList();
  }

  Future<void> deleteLead(int id) async {
    try {
      await _database.delete(
        'leads',
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw AppDatabaseException('Erro ao excluir lead no banco de dados');
    }
  }

  Future<bool> isCarSaved(int carId) async {
    final List<Map<String, dynamic>> maps = await _database.query(
      'leads',
      where: 'id = ?',
      whereArgs: [carId],
    );
    return maps.isNotEmpty;
  }
}
