import 'package:mobile_capstone_fpt/config/provider/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class MainProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider<LoginProvider>(
      create: (context) => LoginProvider(),
    ),
  ];
}
