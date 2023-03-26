import 'package:eazypizy_eazyman/Modules/ManageCustomers/view_AddCustomer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Add_Customers.dart';

class ManageCustomers extends StatefulWidget {
  static const routeName = '/ManageCustomers=Screen';

  const ManageCustomers({super.key});

  // const OrderScreen({Key key}) : super(key: key);

  @override
  State<ManageCustomers> createState() => _ManageCustomersState();
}

// bool detectScreen = true;
class _ManageCustomersState extends State<ManageCustomers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.5,
          title: Text(
            "Manage Customers",
            style: Get.textTheme.titleMedium,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.builder(
//shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, i) => Card(
                  elevation: 0.2,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigator.of(context).pushNamed(
                          //     MyCustomerScreen.routeName,
                          //     arguments: {
                          //       'CustomerName': eazymenData[i].name,
                          //       'CustomerId': eazymenData[i].myCustomerID,
                          //     });
                        },
                        child: ListTile(
                          title: Text('Name')

                          //subtitle: Text(contact.phones.elementAt(0).value),
                          // leading:  CircleAvatar(
                          //   child: Text(eazymenData[i].name),
                          //
                          // ),
                          ,
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.whatshot,
                              color: Colors.green,
                              size: 30,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ))),
        ),
        floatingActionButton: FloatingActionButton.extended(
          heroTag: "btn1",
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ADDCustomers(
              ),
            ));            // Navigator.of(context).pushNamed(ChangeLanguageScreen.routeName);
            // Get.bottomSheet(_categoryBottomButtons(),
            //     backgroundColor: Colors.white,
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.only(
            //       topRight: Radius.zero,
            //       topLeft: Radius.zero,
            //     )));
          },
          label: const Text(
            "Add Customer",
          ),
        ));
  }
}
