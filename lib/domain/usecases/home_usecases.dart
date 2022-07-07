import 'package:luci_test/domain/repositories/home_repository.dart';
import 'package:luci_test/models/history_item.dart';
import 'package:luci_test/models/user.dart';

class HomeUseCases {
  final HomeRepository _homeRepository;

  HomeUseCases(this._homeRepository);

  User getInfo() => _homeRepository.getInfo();

  List<HistoryItem> getHistory() => _homeRepository.getHistory();
}
