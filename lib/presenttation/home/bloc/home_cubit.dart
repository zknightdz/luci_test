import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luci_test/domain/usecases/home_usecases.dart';
import 'package:luci_test/models/history_item.dart';
import 'package:luci_test/models/user.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeUseCases useCases;

  HomeCubit(this.useCases) : super(Initial());

  User? user;
  List<HistoryItem> listHistory = [];

  getInfo() {
    user = useCases.getInfo();
    emit(LoadDataDone());
  }

  getHistory() {
    listHistory = useCases.getHistory();
    emit(LoadDataDone());
  }
}
