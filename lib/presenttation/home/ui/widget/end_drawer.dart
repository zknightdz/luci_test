import 'package:flutter/material.dart';

class EndDrawer extends StatelessWidget {
  const EndDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Drawer(
        child: Container(
          color: const Color(0xFF740C0C),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                ],
              ),
              const SizedBox(height: 24),
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
              const SizedBox(height: 8),
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
              const SizedBox(height: 8),
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
              const SizedBox(height: 8),
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
            ],
          ),
        ),
      ),
    );
  }
}
