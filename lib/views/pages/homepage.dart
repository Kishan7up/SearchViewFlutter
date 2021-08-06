import 'package:e_officedesk/consts/base.dart';
import 'package:e_officedesk/controllers/customer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'search_user.dart';

class HomePage extends StatelessWidget {
  final CustomerController customerController = Get.put(CustomerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchUser()));
            },
          )
        ],
      ),
      body: Column(
        children: [
          /* Padding(
            padding: const EdgeInsets.all(16),
            child: TypeAheadField<CustomersSearchModel?>(
              textFieldConfiguration: TextFieldConfiguration(
                autofocus: true,
                style: DefaultTextStyle.of(context)
                    .style
                    .copyWith(fontStyle: FontStyle.italic),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'What are you looking for?'),
              ),
              suggestionsCallback: (pattern) async {
                // Here you can call http call
                customerSearchController =
                    Get.put(CustomerSearchController(pattern));
                return customerSearchController.customer_search_list;
              },
              itemBuilder: (context, CustomersSearchModel? suggestion) {
                final customer = suggestion!;
                return ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text(customer.label),
                  // subtitle: Text('\$${suggestion['price']}'),
                );
              },
              onSuggestionSelected: (suggestion) {
                // This when someone click the items
                print(suggestion);
              },
            ),
          ),*/
          Expanded(
            child: Obx(() {
              if (customerController.isLoading.value)
                return Center(child: CircularProgressIndicator());
              else
                return Container(
                  // padding: EdgeInsets.only(top: 25),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  // margin: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: customerController.customerlist.length,
                      itemBuilder: (BuildContext context, int index) {
                        //return userList(context, index);
                        //return ExpantionCustomer(context, index);

                        return Container(
                          margin: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Customer",
                                style: TextStyle(
                                  fontFamily: 'BalooBhai',
                                  fontSize: App.BIG_FONT_SIZE,
                                  color: Colors.deepPurpleAccent,
                                ),
                              ),
                              Text(
                                customerController
                                    .customerlist[index].customerName,
                                style: TextStyle(
                                  fontFamily: 'BalooBhai',
                                  fontSize: App.NORMAL_FONT_SIZE,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                );

              /*   return StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: productController.productList.length,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  itemBuilder: (context, index) {
                    return ProductTile(productController.productList[index]);
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                );*/
            }),
          )
        ],
      ),
    );
  }
}
