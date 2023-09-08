import 'package:data_management/core.dart';

import '../../../index.dart';

class UserDataSource extends FireStoreDataSourceImpl<User> {
  UserDataSource({
    super.path = "users",
  });

  @override
  User build(source) => User.from(source);
}
