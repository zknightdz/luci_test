import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luci_test/presenttation/home/bloc/home_cubit.dart';
import 'package:luci_test/presenttation/home/ui/widget/appbar.dart';
import 'package:luci_test/presenttation/home/ui/widget/history.dart';
import 'package:luci_test/presenttation/home/ui/widget/info.dart';
import 'package:luci_test/presenttation/home/ui/widget/jobs_and_project.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<HomeCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cubit.getInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (_, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SAppBar(),
              ..._body(),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _body() {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: const Text(
                'Quản lý nhân sự cấp tập trung',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF740C0C),
                ),
              ),
            ),
            Text(
              ' / ${_cubit.user?.name}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black38,
              ),
            ),
          ],
        ),
      ),
      Container(
        width: double.infinity,
        height: 2,
        color: Colors.black12,
      ),
      Expanded(
        child: SingleChildScrollView(
          child: Row(
            children: const [
              Expanded(
                flex: 1,
                child: Info(),
              ),
              Expanded(
                flex: 2,
                child: History(),
              ),
              Expanded(
                flex: 1,
                child: JobAndProject(),
              ),
            ],
          ),
        ),
      ),
    ];
  }
}
