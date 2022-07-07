import 'package:luci_test/models/history_item.dart';
import 'package:luci_test/models/user.dart';

abstract class HomeRepository {
  User getInfo();
  List<HistoryItem> getHistory();
}