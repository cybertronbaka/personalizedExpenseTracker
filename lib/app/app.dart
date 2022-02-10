import 'package:Churpu/ui/add_tag/add_tag_view.dart';
import 'package:Churpu/ui/add_transaction/add_transaction_view.dart';
import 'package:Churpu/ui/drawer/drawer_view.dart';
import 'package:Churpu/utils/date_formatter.dart';
import 'package:Churpu/utils/gallery_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(dependencies: [
  LazySingleton(classType: DateFormatter),
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: GalleryService),
], routes: [
  MaterialRoute(page: DrawerView, initial: true),
  MaterialRoute(page: AddTagView, path: '/tags/addTag'),
  MaterialRoute(page: AddTransactionView),
])
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}