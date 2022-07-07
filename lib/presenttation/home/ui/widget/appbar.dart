import 'package:flutter/material.dart';

class SAppBar extends StatefulWidget {
  final VoidCallback onClickMenu;

  const SAppBar({
    Key? key,
    required this.onClickMenu,
  }) : super(key: key);

  @override
  _AppBarState createState() => _AppBarState();
}

class _AppBarState extends State<SAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF740C0C),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 50,
      alignment: Alignment.center,
      child: LayoutBuilder(
        builder: (_, __) {
          if (MediaQuery.of(context).size.width > 1000) {
            return _web();
          } else {
            return _mobile();
          }
        },
      ),
    );
  }

  _web() {
    return Row(
      children: [
        const FlutterLogo(
          size: 36,
        ),
        const SizedBox(width: 20),
        InkWell(
          onTap: () {},
          child: const Text(
            'Quản lý dự án',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 24),
        InkWell(
          onTap: () {},
          child: const Text(
            'Quản lý bộ phận cấp tập trung',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 24),
        InkWell(
          onTap: () {},
          child: const Text(
            'Quản lý nhân sự cấp tập trung',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 24),
        InkWell(
          onTap: () {},
          child: const Text(
            'Cấu hình',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.notifications_none_outlined,
          color: Colors.white,
          size: 24,
        ),
        const SizedBox(width: 8),
        Container(
          height: 30,
          width: 1,
          color: Colors.black26,
        ),
        const SizedBox(width: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
            'https://ict-imgs.vgcloud.vn/2020/09/01/19/huong-dan-tao-facebook-avatar.jpg',
            width: 24,
            height: 24,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 4),
        const Text(
          'HieuLQ',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 4),
        const Icon(
          Icons.arrow_drop_down_outlined,
          color: Colors.white,
          size: 16,
        ),
      ],
    );
  }

  _mobile() {
    return Row(
      children: [
        const FlutterLogo(
          size: 36,
        ),
        const Spacer(),
        const Icon(
          Icons.notifications_none_outlined,
          color: Colors.white,
          size: 24,
        ),
        const SizedBox(width: 8),
        Container(
          height: 30,
          width: 1,
          color: Colors.black26,
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: widget.onClickMenu,
          child: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 24,
          ),
        ),
      ],
    );
  }
}
