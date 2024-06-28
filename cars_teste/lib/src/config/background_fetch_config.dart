import 'package:cars_teste/src/config/imports.dart';

void initBackgroundFetch() {
  BackgroundFetch.configure(
    BackgroundFetchConfig(
      minimumFetchInterval: 15,
      stopOnTerminate: false,
      enableHeadless: true,
      requiresBatteryNotLow: false,
      requiresCharging: false,
      requiresStorageNotLow: false,
      requiresDeviceIdle: false,
      requiredNetworkType: NetworkType.ANY,
    ),
    (String taskId) async {
      await postLeads();
      BackgroundFetch.finish(taskId);
    },
    (String taskId) async {
      BackgroundFetch.finish(taskId);
    },
  ).then((int status) {
    debugPrint('[BackgroundFetch] configure success: $status');
  }).catchError((e) {
    debugPrint('[BackgroundFetch] configure ERROR: $e');
  });

  BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
}
