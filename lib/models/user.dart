import 'package:luci_test/models/job.dart';
import 'package:luci_test/models/project.dart';

class User {
  final String name;
  final String position;
  final String status;
  final String id;
  final String userName;
  final String email;
  final String phone;
  final String birthday;
  final String gender;
  final String address;
  final String nationalId;
  final String dateGrant;
  final String addressGrant;
  final String note;
  final List<Job> jobs;
  final List<Project> projects;

  User({
    required this.name,
    required this.position,
    required this.status,
    required this.id,
    required this.userName,
    required this.email,
    required this.phone,
    required this.birthday,
    required this.gender,
    required this.address,
    required this.nationalId,
    required this.dateGrant,
    required this.addressGrant,
    required this.note,
    required this.jobs,
    required this.projects,
  });
}
