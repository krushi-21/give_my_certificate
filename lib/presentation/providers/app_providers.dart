import 'package:give_my_certificate/data/notifiers/authantication_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => AuthanticationNotifier())
  ];
}
