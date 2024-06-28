import 'package:cars_teste/src/config/imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  initBackgroundFetch();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => sl<ThemeProvider>()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Ws Carros',
            theme: themeProvider.currentTheme,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
