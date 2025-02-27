import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/features/splash_screen/screens/splash_screen.dart';
import 'package:task/global/bloc_providers/bloc_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviders.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Zomi Wealth Task",
        home:  SplashPage(),
        theme: ThemeData(
          textTheme: GoogleFonts.urbanistTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
      ),
    );
  }
}
