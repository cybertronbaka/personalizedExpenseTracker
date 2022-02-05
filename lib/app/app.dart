import 'package:Churpu/ui/drawer/drawer_view.dart';
import 'package:Churpu/utils/date_formatter.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(dependencies: [
  LazySingleton(classType: DateFormatter),
], routes: [
  MaterialRoute(page: DrawerView, initial: true),
])
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}