import 'package:cars_teste/src/config/imports.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);
  final PageController _pageController = PageController();
  final List<Widget> _pages = [
    const CarListPage(),
    const SavedLeadsPage(),
  ];

  @override
  void dispose() {
    _currentIndexNotifier.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'WS Carros',
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: _currentIndexNotifier,
        builder: (context, currentIndex, _) {
          return PageView(
            controller: _pageController,
            children: _pages,
            onPageChanged: (index) {
              _currentIndexNotifier.value = index;
            },
          );
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _currentIndexNotifier,
        builder: (context, currentIndex, _) {
          return BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              _currentIndexNotifier.value = index;
              _pageController.jumpToPage(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.directions_car),
                label: 'Carros',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Reservas',
              ),
            ],
          );
        },
      ),
    );
  }
}
