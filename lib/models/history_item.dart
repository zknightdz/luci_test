class HistoryItem {
  final String title;
  final List<Action> actions;

  HistoryItem({
    required this.title,
    required this.actions,
  });
}

class Action {
  final String time;
  final String content;

  Action({
    required this.time,
    required this.content,
  });
}
