import 'package:eazypizy_eazyman/Modules/ManageCustomers/view_AddCustomer.dart';
import 'package:eazypizy_eazyman/Modules/ManageCustomers/view_MyCustomersDetails.dart';
import 'package:eazypizy_eazyman/theme/app_colors.dart';
import 'package:eazypizy_eazyman/widgets/easy_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/eazy_spaces.dart';
import 'Add_Customers.dart';
import 'ctrl_myCustomers.dart';

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
    return GetBuilder(
        init: MyCustomerController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
               // automaticallyImplyLeading: false,
                                title: Text(
                 'My Customers',
                  style: Get.textTheme.titleMedium,
                ),
              ),
              body: SingleChildScrollView(
                padding: Space.scaffoldPadding,
                child: ListView.builder(
                  shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 15,
                    itemBuilder: (context, i) => Card(

                        elevation: 0.2,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const MyCustomerDetails(),
                                ));
                              },
                              child: ListTile(
                                tileColor: EazyColors.white,

                                title: const Text('Customer Name'),
                                subtitle: Text('+91-9023499063', style: Get.textTheme.titleSmall,),
                                leading: EasyContainer(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset('assets/five.jpg', fit: BoxFit.cover,),
                                )

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
                    builder: (context) => const ADDCustomers(),
                  )); // Navigator.of(context).pushNamed(ChangeLanguageScreen.routeName);
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
        });
  }
}
