/*
class NetworkTypeAheadPage extends StatelessWidget {
  // final CustomerSearchController customerSearchController;
  final CustomerSearchController customerSearchController =
      Get.put(CustomerSearchController(""));

  @override
  Widget build(BuildContext context) => Scaffold(
        body:
        SafeArea(
          child: Container(
              child: new Column(children: <Widget>[
            new Container(
                child: Column(children: <Widget>[
              TextFormField(
                  //controller: tc,
                  decoration: InputDecoration(hintText: 'Search...'),
                  onChanged: (v) {
                    if (v.length > 3) {
                      Get.put(CustomerSearchController(v));
                    }
                  }),
            ])),
            new Container(
                child: Column(children: <Widget>[
              Container(child: Obx(() {
                return ListView.builder(
                    itemCount:
                        customerSearchController.customer_search_list.length,
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
                              customerSearchController
                                  .customer_search_list[index].label,
                              style: TextStyle(
                                fontFamily: 'BalooBhai',
                                fontSize: App.NORMAL_FONT_SIZE,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              }))
            ])),
          ])),
        ),
      );
}
*/
import 'package:e_officedesk/controllers/customer_search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkTypeAhead extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<NetworkTypeAhead> {
  final CustomerSearchController customerSearchController =
      Get.put(CustomerSearchController());
  var _searchEdit = new TextEditingController();

  bool _isSearch = true;
  String _searchText = "";

  List<String> _socialListItems = <String>[];
  List<String> _searchListItems = <String>[];

  @override
  void initState() {
    super.initState();
    _socialListItems = <String>[];
    _socialListItems = [
      "Facebook",
      "Instagram",
      "Twitter",
      "LinkedIn",
      "Messenger",
      "WhatsApp",
      "Naukri",
      "Medium",
      "Tinder",
      "Gmail",
      "Hangouts",
      "Google Plus",
      "Snapchat",
      "True Caller",
      "WeChat",
      "Pinterest",
      "Quora"
    ];
    _socialListItems.sort();
  }

  _HomeScreenState() {
    _searchEdit.addListener(() {
      if (_searchEdit.text.isEmpty) {
        setState(() {
          _isSearch = true;
          _searchText = "";
        });
      } else {
        setState(() {
          _isSearch = false;
          _searchText = _searchEdit.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Search List"),
      ),
      body: new Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: new Column(
          children: <Widget>[
            _searchBox(),
            _isSearch ? _listView() : _searchListView()
          ],
        ),
      ),
    );
  }

  Widget _searchBox() {
    return new Container(
      decoration: BoxDecoration(border: Border.all(width: 1.0)),
      child: new TextField(
        controller: _searchEdit,
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: new TextStyle(color: Colors.grey[300]),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _listView() {
    return new Flexible(
      child: Obx(() {
        if (customerSearchController.isLoading.value)
          return Center(child: CircularProgressIndicator());
        else
          return Container(
              child: new ListView.builder(
                  itemCount: customerSearchController
                      .customer_search_list.length, //_socialListItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return new Card(
                      color: Colors.cyan[50],
                      elevation: 5.0,
                      child: new Container(
                        margin: EdgeInsets.all(15.0),
                        child: new Text(
                            "${customerSearchController.customer_search_list[index].label}"),
                      ),
                    );
                  }));
      }),
    );
  }

  Widget _searchListView() {
    _searchListItems = <String>[];
    // customerSearchController.customer_search_list.clear();
    /* for (int i = 0; i < _socialListItems.length; i++) {
      var item = _socialListItems[i];

      if (item.toLowerCase().contains(_searchText.toLowerCase())) {
        _searchListItems.add(item);
      }
    }
    return _searchAddList();*/
    for (int i = 0;
        i < customerSearchController.customer_search_list.length;
        i++) {
      var item = customerSearchController.customer_search_list[i];

      if (item.label.toLowerCase().contains(_searchText.toLowerCase())) {
        _searchListItems.add(item.label);
      }
    }
    return _searchAddList();
  }

  Widget _searchAddList() {
    return new Flexible(
      child: new ListView.builder(
          itemCount: _searchListItems.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              color: Colors.cyan[100],
              elevation: 5.0,
              child: new Container(
                margin: EdgeInsets.all(15.0),
                child: new Text("${_searchListItems[index]}"),
              ),
            );
          }),
    );
  }
}
