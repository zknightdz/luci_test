import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luci_test/data/home_repo_impl.dart';
import 'package:luci_test/domain/usecases/home_usecases.dart';
import 'package:luci_test/presenttation/home/bloc/home_cubit.dart';
import 'package:luci_test/presenttation/home/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chi tiết thông tin nhân sự',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => HomeCubit(HomeUseCases(HomeRepoImpl())),
        child: const HomePage(),
      ),
    );
  }
}
