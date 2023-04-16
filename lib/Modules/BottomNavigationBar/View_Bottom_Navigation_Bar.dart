import 'package:eazypizy_eazyman/Modules/BottomNavigationBar/view_sideDrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';
import '../../widgets/easy_container.dart';
import '../Account/view_Account.dart';
import '../Eazyman_catalouge/view_eazy_man_cataloge.dart';
import '../Home/View_HomeScreen.dart';
import '../ManageCustomers/view_ManageCustomers.dart';
import '../ManageOrders/View_ManageOrders.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  _NavigationViewState createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  int _selectedPageIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    EazyManCatalogScreen(),
    const SizedBox(),
    const ManageOrders(),
    Account()
   // const ManageCustomers(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: EazyColors.appBarBG,
        endDrawer: EasyContainer(
          width: MediaQuery.of(context).size.width/1.5,
          child: const Drawer(


            child: DrawerView()
          ),
        ),
        body: _pages[_selectedPageIndex],
        bottomNavigationBar: CustomBottomNavigationBar(
          iconList: const [
            Icons.home,
            Icons.category_rounded,
            Icons.store,
            Icons.shopping_cart,
            Icons.person,
          ],
          onChange: (index) {
            setState(() {
              _selectedPageIndex = index;
            });
          },
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Get.to(const StoreHome());
        //     // Navigator.of(context).pushNamed('EazyPizyStore.routeName');
        //   },
        //   // backgroundColor: Colors.blueAccent,
        //   elevation: 5,
        //
        //   tooltip: 'Increment',
        //  child: const Icon(Icons.store),
        // ),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
    this.defaultSelectedIndex = 0,
    required this.iconList,
    required this.onChange,
  });

  final int defaultSelectedIndex;
  final void Function(int index) onChange;
  final List<IconData> iconList;

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
  }

  @override
  Widget build(BuildContext context) {
    final navBarItemList = <Widget>[];

    for (var i = 0; i < _iconList.length; i++) {
      navBarItemList.add(buildNavBarItem(_iconList[i], i));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: navBarItemList,
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: ((MediaQuery.of(context).size.width) / _iconList.length) - 30,
        margin: const EdgeInsets.only(right: 15, left: 15),
        decoration: index == _selectedIndex
            ? const BoxDecoration(
                // color: Colors.green,
                border: Border(
                  top: BorderSide(
                    width: 3,
                    color: EazyColors.primary,
                  ),
                ),
              )
            : const BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectedIndex ? EazyColors.primary : Colors.grey,
        ),
      ),
    );
  }
}
