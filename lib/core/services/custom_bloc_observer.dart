import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class CustomBlocObserver extends BlocObserver {
  final Logger logger = Logger();
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logger.i('${bloc.runtimeType} $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logger.i('${bloc.runtimeType} $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logger.i('${bloc.runtimeType} $error $stackTrace');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    logger.i('${bloc.runtimeType} $event');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    logger.i('${bloc.runtimeType} is closed');
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    logger.i('${bloc.runtimeType} is created');
  }
}
