import 'package:bestfitnesstrackereu/pages/layout_template/layout_template.dart';
import 'package:bestfitnesstrackereu/provider/auth.dart';
import 'package:bestfitnesstrackereu/provider/users_table.dart';
import 'package:bestfitnesstrackereu/routing/route_names.dart';
import 'package:bestfitnesstrackereu/routing/router.dart';
import 'package:bestfitnesstrackereu/services/navigation_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'locator.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCaos63TeR_y3YVXxD5x180IYz3ssQeWHE",
      appId: "1:414667114455:web:e0d8cdd30559bc41576d92",
      messagingSenderId: "414667114455",
      projectId: "thebasics-fb4e8",
    ),
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: AuthProvider.initialize()),
    ChangeNotifierProvider.value(value: UsersTable.init()),
  ], child: MyApp()));
  setupLocator();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        Locale('de', ''),
        Locale('en', ''),
      ],
      locale: Locale('de'),
      title: 'BestFitnesstrackerEU',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
            fontFamily: 'Open Sans'
        ),
      ),
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: InformationRoute,
    );
  }
}

/*class AppPagesController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return FutureBuilder(
      // Initialize FlutterFire:
      future: Firebase.initializeApp(
        options: FirebaseOptions(
        apiKey: "AIzaSyCaos63TeR_y3YVXxD5x180IYz3ssQeWHE",
        appId: "1:414667114455:web:e0d8cdd30559bc41576d92",
        messagingSenderId: "414667114455",
        projectId: "thebasics-fb4e8",
      )),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Something went wrong")],
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          print(authProvider.status.toString());
          switch (authProvider.status) {
            case Status.Uninitialized:
              return Loading();
            case Status.Unauthenticated:
            case Status.Authenticating:
              return AuthenticationPage();
            case Status.Authenticated:
              return LayoutTemplate();
            default:
              return AuthenticationPage();
          }
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
        );
      },
    );
  }
}*/
