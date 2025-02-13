part of '../initialize.dart';

class MyMainApp extends StatelessWidget {
  const MyMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dependencies = context.myDependencies!;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SubBloc(subR: dependencies.subR),
        ),
        BlocProvider(
          create: (context) => ScanBloc(scanR: dependencies.scanR),
        ),
        BlocProvider(
          create: (context) =>
              ErrorBloc(controller: dependencies.scanR.errorController),
        ),
      ],
      child: const MyAppRouter(),
    );
  }
}

class MyAppRouter extends StatelessWidget {
  const MyAppRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        // Locale('ru'),
      ],
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xffF2F4FF),
          textTheme: const TextTheme(
            bodyMedium:
                TextStyle(fontSize: 18, height: 1, fontWeight: FontWeight.w600),
            bodySmall: TextStyle(
              fontSize: 14,
            ),
            bodyLarge: TextStyle(
              fontSize: 32,
              height: 1.2,
            ),
          )),
      debugShowCheckedModeBanner: false,
      routerDelegate: MyRouterDelegate.instance,
      routeInformationParser: MyRouterInformationParser(),
    );
  }
}
