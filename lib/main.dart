import 'package:flutter/material.dart';
import 'package:tm_db/theme/app_colors.dart';
import 'package:tm_db/widgets/auth/auth_widget.dart';
import 'package:tm_db/widgets/main_screen/main_screen_widget.dart';

import 'movie_details/movie_details_widget.dart';

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
        '/main_screen/movie_details' : (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if (arguments is int){
            return MovieDetailsWidget(movieId: arguments);
          } else {
            return MovieDetailsWidget(movieId: 0);
          }
        },
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
