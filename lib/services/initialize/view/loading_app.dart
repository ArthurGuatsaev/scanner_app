part of '../initialize.dart';

class InitializationSplashScreen extends StatefulWidget {
  final ValueNotifier<({int progress, String message})> progress;
  const InitializationSplashScreen({super.key, required this.progress});

  @override
  State<InitializationSplashScreen> createState() =>
      _InitializationSplashScreenState();
}

class _InitializationSplashScreenState
    extends State<InitializationSplashScreen> {
  @override
  void initState() {
    widget.progress.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.progress.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
              bodyMedium: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            )),
        debugShowCheckedModeBanner: false,
        home: LoadingPage(progress: widget.progress.value.progress));
  }
}
