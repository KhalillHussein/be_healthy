import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medicine_app/providers/appoint.dart';
import 'package:medicine_app/providers/calendar.dart';

import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';

import '../providers/index.dart';
import 'util/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MedicApp());
}

class MedicApp extends StatelessWidget {
  const MedicApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => NavigationProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => AppointProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => TableCalendarProvider(),
        ),
      ],
      child: MaterialApp(
        theme: Style.light,
        debugShowCheckedModeBanner: false,
        title: 'MEDIC APP',
        localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
        supportedLocales: const [Locale('ru')],
        onGenerateRoute: Routes.generateRoute,
        onUnknownRoute: Routes.errorRoute,
      ),
    );
  }
}
