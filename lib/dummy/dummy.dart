import 'package:luci_test/models/history_item.dart';
import 'package:luci_test/models/job.dart';
import 'package:luci_test/models/project.dart';
import 'package:luci_test/models/user.dart';

var user = User(
  name: 'Hoàng Thu Hiền',
  position: 'Kế toán trưởng',
  status: 'Đang hoạt động',
  id: 'NL08273',
  userName: 'hienht',
  email: 'hienht@g.com.vn',
  phone: '09888111772',
  birthday: '11/09/2012',
  gender: 'Nữ',
  address: 'Số 5, Cầu Giấy',
  nationalId: '123456789',
  dateGrant: '13/09/1999',
  addressGrant: 'Hà Nội',
  note: 'Quản lý phòng kế toán tập đoàn',
  jobs: [
    Job(
      department: 'Phòng kế toán',
      position: 'Quản lý',
    ),
    Job(
      department: 'Phòng CSKH',
      position: 'Nhân viên',
    ),
  ],
  projects: [
    Project(
      name: 'Dự án AAA',
      permission: 'Kế toán trưởng',
    ),
    Project(
      name: 'Dự án BBB',
      permission: 'Kế toán trưởng',
    ),
  ],
);

var history = [
  HistoryItem(
    title: 'Hôm nay, 07/07/2022',
    actions: [
      Action(
        time: '16:30:24, 07/07/2022',
        content: 'Chỉnh sửa thông tin bất động sản',
      ),
      Action(
        time: '15:45:06, 07/07/2022',
        content: 'Chỉnh sửa thông tin bất động sản',
      ),
      Action(
        time: '08:13:04, 07/07/2022',
        content: 'Thêm mới bất động sản',
      ),
    ],
  ),
  HistoryItem(
    title: 'Hôm qua, 06/07/2022',
    actions: [
      Action(
        time: '23:45:09, 06/07/2022',
        content: 'Chỉnh sửa thông tin bất động sản',
      ),
      Action(
        time: '11:11:11, 06/07/2022',
        content: 'Thêm mới bất động sản',
      ),
    ],
  ),
  HistoryItem(
    title: '05/07/2022',
    actions: [
      Action(
        time: '23:45:09, 05/07/2022',
        content: 'Thêm mới bất động sản',
      ),
      Action(
        time: '11:11:11, 05/07/2022',
        content: 'Đăng nhập hệ thống',
      ),
    ],
  ),
];
