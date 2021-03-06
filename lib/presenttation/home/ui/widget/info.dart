import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luci_test/presenttation/home/bloc/home_cubit.dart';

class Info extends StatefulWidget {
  final bool isWeb;

  const Info({
    Key? key,
    this.isWeb = true,
  }) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  final GlobalKey _keyAction = GlobalKey();
  late HomeCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (_, state) {
        return Container(
          color: widget.isWeb ? const Color(0x468E8E8E) : Colors.transparent,
          height: widget.isWeb ? double.infinity : null,
          child: widget.isWeb
              ? SingleChildScrollView(
                  child: _body(),
                )
              : _body(),
        );
      },
    );
  }

  _body() => Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(),
          Container(
            width: double.infinity,
            height: 2,
            color: Colors.black12,
          ),
          ..._information(),
        ],
      );

  _title() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              'https://ict-imgs.vgcloud.vn/2020/09/01/19/huong-dan-tao-facebook-avatar.jpg',
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  _cubit.user?.name ?? '',
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _cubit.user?.position ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        _cubit.user?.status ?? '',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black38,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: _showPopupMenu,
                      child: Row(
                        key: _keyAction,
                        children: const [
                          Text(
                            'T??y ch???n',
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
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _information() {
    return [
      const SizedBox(height: 24),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          'Th??ng tin nh??n vi??n',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const SizedBox(height: 20),
      ..._itemInfo('M?? nh??n vi??n', _cubit.user?.id ?? ''),
      ..._itemInfo('T??n ????ng nh???p', _cubit.user?.userName ?? ''),
      ..._itemInfo('Email', _cubit.user?.email ?? ''),
      ..._itemInfo('S??? ??i???n tho???i', _cubit.user?.phone ?? ''),
      ..._itemInfo('Ng??y sinh', _cubit.user?.birthday ?? ''),
      ..._itemInfo('Gi???i t??nh', _cubit.user?.gender ?? ''),
      ..._itemInfo('?????a ch???', _cubit.user?.address ?? ''),
      ..._itemInfo('CMTND/CCCD/H??? chi???u', _cubit.user?.nationalId ?? ''),
      ..._itemInfo('Ng??y c???p', _cubit.user?.dateGrant ?? ''),
      ..._itemInfo('N??i c???p', _cubit.user?.addressGrant ?? ''),
      ..._itemInfo('Ghi ch??', _cubit.user?.note ?? ''),
    ];
  }

  _itemInfo(String title, String content) {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black38,
          ),
        ),
      ),
      const SizedBox(height: 4),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          content,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ),
      const SizedBox(height: 16),
    ];
  }

  _showPopupMenu() async {
    RenderBox box = _keyAction.currentContext!.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);
    showMenu<int>(
      context: context,
      position: RelativeRect.fromLTRB(
          position.dx, position.dy + 20, position.dx + 1, position.dy + 21),
      color: Colors.white,
      elevation: 8,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      items: [
        _itemPopupMenu('D???ng ho???t ?????ng', Colors.black87),
        _itemPopupMenu('?????t l???i m???t kh???u', Colors.black87),
        _itemPopupMenu('X??a nh??n s???', Colors.red),
      ],
    );
  }

  PopupMenuItem<int> _itemPopupMenu(String text, Color color) {
    return PopupMenuItem<int>(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: color,
        ),
      ),
    );
  }
}
