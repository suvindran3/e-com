import 'package:bloc/bloc.dart';

class StateCubit extends Cubit<bool> {
  StateCubit() : super(false);

  void sideBar() => emit(!state);
}
