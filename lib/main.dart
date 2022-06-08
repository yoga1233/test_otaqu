import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_otaqu/cubit/last_search_cubit.dart';
import 'package:test_otaqu/cubit/search_cubit.dart';
import 'package:test_otaqu/ui/home/home_page.dart';
import 'package:test_otaqu/ui/intro_page.dart/intro_page.dart';
import 'package:test_otaqu/ui/splash_page/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchCubit(),
        ),
        BlocProvider(
          create: (context) => LastSearchCubit(),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(414, 736),
        builder: (context, child) => MaterialApp(
          routes: {
            '/': (context) => const SplashPage(),
            '/intro': (context) => const IntroPage(),
            '/home': (context) => const HomePage(),
          },
        ),
      ),
    );
  }
}
