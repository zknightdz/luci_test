import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luci_test/models/history_item.dart' as h;
import 'package:luci_test/presenttation/home/bloc/home_cubit.dart';

class History extends StatefulWidget {
  final bool isWeb;

  const History({
    Key? key,
    this.isWeb = true,
  }) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  late HomeCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (_, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Lịch sử hoạt động',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 2,
            color: Colors.black12,
          ),
          _search(),
          _listHistory(),
        ],
      );
    });
  }

  _search() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          const Text(
            'Tìm kiếm theo hành động',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          const SizedBox(width: 12),
          Container(
            height: 36,
            width: 186,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: const Color(0x238E8E8E),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xA38E8E8E),
                width: 2,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(
                  width: 150,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(bottom: 16),
                    ),
                  ),
                ),
                Icon(
                  Icons.search,
                  size: 16,
                  color: Color(0xA38E8E8E),
                )
              ],
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            'Thời gian',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 100,
            child: InkWell(
              onTap: () {},
              child: Row(
                children: const [
                  Text(
                    'Tất cả',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xD27B0A0A),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 2),
                  Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Color(0xD27B0A0A),
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _listHistory() {
    return widget.isWeb
        ? Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _cubit.listHistory.length,
              itemBuilder: (_, index) {
                return _itemHistory(_cubit.listHistory[index]);
              },
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            itemCount: _cubit.listHistory.length,
            itemBuilder: (_, index) {
              return _itemHistory(_cubit.listHistory[index]);
            },
          );
  }

  _itemHistory(h.HistoryItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            const Icon(
              Icons.calendar_today,
              size: 20,
              color: Colors.black87,
            ),
            const SizedBox(width: 8),
            Text(
              item.title,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: item.actions.length,
          itemBuilder: (_, index) {
            return _itemAction(item.actions[index]);
          },
        ),
      ],
    );
  }

  _itemAction(h.Action action) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(
          action.time,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black38,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0x238E8E8E),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            action.content,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
