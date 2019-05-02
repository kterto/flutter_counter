
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/counter_bloc.dart';
import 'blocs/theme_bloc.dart';
import 'screens/counter_page.dart';


class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  final CounterBloc _counterBloc = CounterBloc();
  final ThemeBloc _themeBloc = ThemeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<CounterBloc>(bloc: _counterBloc),
        BlocProvider<ThemeBloc>(bloc: _themeBloc)
      ],
      child: BlocBuilder(
        bloc: _themeBloc,
        builder: (_, ThemeData theme) {
          return MaterialApp(
            title: 'Flutter Demo',
            home: CounterPage(),
            theme: theme,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _counterBloc.dispose();
    _themeBloc.dispose();
    super.dispose();
  }
}
