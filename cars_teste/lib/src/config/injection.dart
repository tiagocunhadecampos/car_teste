import 'package:cars_teste/src/config/imports.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Inicializando o Preferences
  await SharedPreferencesManager.init();

  // Inicializando o DatabaseManager
  final databaseManager = DatabaseManager();
  await databaseManager.initialize();
  sl.registerSingleton<DatabaseManager>(databaseManager);

  // Bloc
  sl.registerFactory(() => CarBloc(getCars: sl(), saveLead: sl(), databaseManager: sl(), deleteLead: sl()));
  //SavedLeads Bloc
  sl.registerFactory(() => SavedLeadsBloc(getSavedLeads: sl(), deleteLead: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetCars(sl()));
  // SaveLead
  sl.registerLazySingleton(() => SaveLead(sl()));
  // DeleteLead
  sl.registerLazySingleton(() => DeleteLead(sl()));
  // GetLeads
  sl.registerLazySingleton(() => GetSavedLeads(sl()));

  // Repositório
  sl.registerLazySingleton<CarRepository>(
    () => CarRepositoryImpl(
      client: sl(),
      databaseManager: sl(),
    ),
  );

  // External
  sl.registerLazySingleton(() => Client());

  // ThemeProvider
  sl.registerLazySingleton(() => ThemeProvider());

  // Registrando o SharedPreferencesManager
  sl.registerLazySingleton<SharedPreferencesManager>(() => SharedPreferencesManager());
}
