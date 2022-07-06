import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luci_test/domain/usecases/home_usecases.dart';
import 'package:luci_test/models/user.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeUseCases useCases;

  HomeCubit(this.useCases) : super(Initial());

  User? user;

  getInfo() {
    user = useCases.getInfo();
    emit(LoadDataDone());
  }
}
