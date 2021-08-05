import 'package:e_officedesk/models/customer_search_model.dart';
import 'package:e_officedesk/services/remote_services.dart';
import 'package:get/state_manager.dart';

class CustomerSearchController extends GetxController {
  var isLoading = true.obs;

  var customer_search_list = <CustomersSearchModel>[].obs;

  var qry = '';
  /*CustomerSearchController(String s) {
    qry = s;
  }*/

  @override
  void onInit() {
    fetch_search_customer_details();
    super.onInit();
  }

  void fetch_search_customer_details() async {
    try {
      isLoading(true);
      var customers = await RemoteServices.fetch_search_customer_details();
      if (customers != null) {
        customer_search_list.value = customers;
      }
    } finally {
      isLoading(false);
    }
  }
}
