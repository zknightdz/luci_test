import 'package:luci_test/domain/repositories/home_repository.dart';
import 'package:luci_test/dummy/dummy.dart';
import 'package:luci_test/models/history_item.dart';
import 'package:luci_test/models/user.dart';

class HomeRepoImpl extends HomeRepository {
  @override
  User getInfo() {
    return user;
  }

  @override
  List<HistoryItem> getHistory() => history;
}
