import 'package:Churpu/ui/add_tag/add_tag_view.dart';
import 'package:Churpu/ui/drawer/drawer_view.dart';
import 'package:Churpu/utils/date_formatter.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(dependencies: [
  LazySingleton(classType: DateFormatter),
  LazySingleton(classType: NavigationService)
], routes: [
  MaterialRoute(page: DrawerView, initial: true),
  MaterialRoute(page: AddTagView, path: '/tags/addTag')
])
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}