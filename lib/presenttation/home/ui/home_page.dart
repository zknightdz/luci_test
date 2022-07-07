import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luci_test/presenttation/home/bloc/home_cubit.dart';
import 'package:luci_test/presenttation/home/ui/widget/appbar.dart';
import 'package:luci_test/presenttation/home/ui/widget/end_drawer.dart';
import 'package:luci_test/presenttation/home/ui/widget/history.dart';
import 'package:luci_test/presenttation/home/ui/widget/info.dart';
import 'package:luci_test/presenttation/home/ui/widget/jobs_and_project.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  late HomeCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<HomeCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cubit.getInfo();
      _cubit.getHistory();
    });
  }

  openDrawer() {
    _key.currentState!.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (_, state) {
        return Scaffold(
          key: _key,
          backgroundColor: Colors.white,
          endDrawer: const EndDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SAppBar(
                onClickMenu: openDrawer,
              ),
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
        child: LayoutBuilder(
          builder: (_, __) {
            if (MediaQuery.of(context).size.width > 1300) {
              return _web();
            } else if (MediaQuery.of(context).size.width > 800) {
              return _mobileLarge();
            } else {
              return _mobileSmall();
            }
          },
        ),
      ),
    ];
  }

  _web() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          flex: 1,
          child: Info(),
        ),
        Container(
          width: 2,
          height: double.infinity,
          color: Colors.black12,
        ),
        const Expanded(
          flex: 2,
          child: History(),
        ),
        Container(
          width: 2,
          height: double.infinity,
          color: Colors.black12,
        ),
        const Expanded(
          flex: 1,
          child: JobAndProject(),
        ),
      ],
    );
  }

  _mobileLarge() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: const Color(0x468E8E8E),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Expanded(
                  flex: 1,
                  child: Info(
                    isWeb: false,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: JobAndProject(
                    isWeb: false,
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
          const History(
            isWeb: false,
          ),
        ],
      ),
    );
  }

  _mobileSmall() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: const Color(0x468E8E8E),
            child: Column(
              children: [
                const Info(
                  isWeb: false,
                ),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: Colors.black12,
                ),
                const JobAndProject(
                  isWeb: false,
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 2,
            color: Colors.black12,
          ),
          const History(
            isWeb: false,
          ),
        ],
      ),
    );
  }
}
