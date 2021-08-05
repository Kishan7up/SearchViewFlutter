import 'package:e_officedesk/models/customer.dart';
import 'package:e_officedesk/services/remote_services.dart';
import 'package:get/state_manager.dart';

class CustomerController extends GetxController {
  var isLoading = true.obs;

  var customerlist = <CustomerModel>[].obs;
  @override
  void onInit() {
    fetch_customer_details();
    super.onInit();
  }

  void fetch_customer_details() async {
    try {
      isLoading(true);
      var customers = await RemoteServices.fetchCustomerList();
      if (customers != null) {
        customerlist.value = customers;
      }
    } finally {
      isLoading(false);
    }
  }
}
