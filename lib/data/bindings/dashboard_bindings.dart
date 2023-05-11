import 'package:get/get.dart';
import '../../presentation/controller/dashboard_controller.dart';
import '../remote/dashboard_api.dart';

class DashboardBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<DashboardController>(
        DashboardController(dashboardApi: DashboardApi()),
        permanent: true);
  }
}
