import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luci_test/models/job.dart';
import 'package:luci_test/models/project.dart';
import 'package:luci_test/presenttation/home/bloc/home_cubit.dart';

class JobAndProject extends StatefulWidget {
  final bool isWeb;

  const JobAndProject({
    Key? key,
    this.isWeb = true,
  }) : super(key: key);

  @override
  State<JobAndProject> createState() => _JobAndProjectState();
}

class _JobAndProjectState extends State<JobAndProject> {
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
          const SizedBox(height: 24),
          ..._jobs(),
          const SizedBox(height: 24),
          ..._projects(),
          const SizedBox(height: 24),
        ],
      );

  _jobs() {
    return [
      const Text(
        'Thông tin công việc',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 16),
      _headerJob(),
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _cubit.user?.jobs.length ?? 0,
        itemBuilder: (_, index) {
          return _itemJob(_cubit.user?.jobs[index]);
        },
      ),
    ];
  }

  _headerJob() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Expanded(
              child: Text(
                'Bộ phận',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                'Quyền hạn',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 4),
          width: double.infinity,
          height: 2,
          color: Colors.black12,
        ),
      ],
    );
  }

  _itemJob(Job? job) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                job?.department ?? '',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
            Expanded(
              child: Text(
                job?.position ?? '',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          width: double.infinity,
          height: 2,
          color: Colors.black12,
        ),
      ],
    );
  }

  _projects() {
    return [
      const Text(
        'Phụ trách dự án và phân quyền',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 16),
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _cubit.user?.projects.length ?? 0,
        itemBuilder: (_, index) {
          return _itemProject(_cubit.user?.projects[index], index);
        },
      ),
    ];
  }

  _itemProject(Project? project, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(
          'Dự án ${index + 1}',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black38,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          project?.name ?? '',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Phân quyền',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black38,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          project?.permission ?? '',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        InkWell(
          onTap: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Flexible(
                child: Text(
                  'Các module, tính năng được phép truy cập',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xD27B0A0A),
                    fontWeight: FontWeight.bold,
                  ),
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
    );
  }
}
