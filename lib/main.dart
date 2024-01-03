import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/common/utils/colors.dart';
import 'package:food_app/routes/router.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFFDB3022),
);

final theme = ThemeData().copyWith(
    useMaterial3: true,
    colorScheme: kColorScheme,
    textTheme: GoogleFonts.robotoTextTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.white,
      ),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Guruvarul Admin App',
      theme: theme,
      routerConfig: router,
    );
  }
}
