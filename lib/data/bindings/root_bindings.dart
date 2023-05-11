import 'package:get/get.dart';
import '../../presentation/controller/internetchecker_controller.dart';

class RootBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<InternetcheckerController>(InternetcheckerController(),
        permanent: true);
    
  }
}
