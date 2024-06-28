import 'package:cars_teste/src/config/imports.dart';

void backgroundFetchHeadlessTask(HeadlessTask task) async {
  String taskId = task.taskId;
  bool isTimeout = task.timeout;
  if (isTimeout) {
    BackgroundFetch.finish(taskId);
    return;
  }

  await postLeads();
  BackgroundFetch.finish(taskId);
}

Future<void> postLeads() async {
  final databaseManager = sl<DatabaseManager>();
  final leads = await databaseManager.getAllLeads();

  if (leads.isNotEmpty) {
    final response = await post(
      Uri.parse('$BASE_URL/cars/leads'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
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
}
