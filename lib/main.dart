import 'package:flutter/material.dart';
import 'package:tm_db/theme/app_colors.dart';
import 'package:tm_db/widgets/auth/auth_widget.dart';
import 'package:tm_db/widgets/main_screen/main_screen_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.mainColor,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
      routes: {
        '/auth' : (context) => AuthWidget(),
        '/main_screen' : (context) => MainScreenWidget(),
      },
      initialRoute: '/auth',
      onGenerateRoute: (RouteSettings settings){
        return MaterialPageRoute(builder: (context){
          return const Scaffold(
            body: Center(child: Text('Произошла ошибка навигации')),
          );
        });
      },
    );
  }
}
