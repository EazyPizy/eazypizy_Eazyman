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
    const EazyManCatalogScreen(),
  //  const SizedBox(),
    const ManageOrders(),
    const Account()
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
          width: MediaQuery.of(context).size.width / 1.5,
          child: const Drawer(child: DrawerView()),
        ),
        body: _pages[_selectedPageIndex],
        bottomNavigationBar: CustomBottomNavigationBar(
          iconList: const [
            Icons.home,
            Icons.category_rounded,
          //  Icons.store,
            Icons.book,
            Icons.person,
          ],

          label: const [
            'home',

            /// Store Floating Action Button, Just uncomment this///

            'Catalog',
          //  '',
            /// Store Floating Action Button, Just uncomment this///

            'Bookings',
            'Profile',
          ],
          onChange: (index) {
            setState(() {
              _selectedPageIndex = index;
            });
          },
        ),

        /// Store Floating Action Button///
        // floatingActionButtonLocation:
        //     FloatingActionButtonLocation.miniCenterDocked,
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     //  Get.to(const StoreHome());
        //     // Navigator.of(context).pushNamed('EazyPizyStore.routeName');
        //   },
        //
        //   // backgroundColor: Colors.blueAccent,
        //   elevation: 0,
        //   backgroundColor: EazyColors.primary,
        //   // Set the background color
        //   foregroundColor: EazyColors.white,
        //   // Set the foreground (icon) color
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(50), // Set the border radius
        //   ),
        //
        //   tooltip: 'Increment',
        //   child: const Icon(Icons.store),
        // ),

        /// Store Floating Action Button, Just uncomment this///

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
    required this.label,

  });

  final int defaultSelectedIndex;
  final void Function(int index) onChange;
  final List<IconData> iconList;
  final List<String> label;


  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];
  List<String> _label = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
    _label = widget.label;

  }

  @override
  Widget build(BuildContext context) {
    final navBarItemList = <Widget>[];

    for (var i = 0; i < _iconList.length; i++) {
      navBarItemList.add(buildNavBarItem(_iconList[i], i, _label[i]));
    }

    ///comment this
     return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: navBarItemList,
    );
   /// comment this

    /// Store Floating Action Button, Just uncomment this///

    // return BottomAppBar(
    //
    //   height: 60,
    //   shape: const CircularNotchedRectangle(),
    //   //color: Colors.white,
    //   notchMargin: 8,
    //  // surfaceTintColor: Colors.white,
    //   clipBehavior: Clip.antiAlias,
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: navBarItemList,
    //   ),
    // );

    /// Store Floating Action Button, Just uncomment this///
  }

  Widget buildNavBarItem(IconData icon, int index, String label) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 15, left: 15),

        /// Store Floating Action Button, Just comment this from here///
        height: 60,
       width: ((MediaQuery.of(context).size.width) / _iconList.length) - 30,
        decoration: index == _selectedIndex
            ? const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              width: 3,
              color: EazyColors.primary,
            ),
          ),
        )
            : const BoxDecoration(),

        /// Store Floating Action Button, Just comment this, to here///

        child:Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              size: 20,
              color: index == _selectedIndex ? EazyColors.primary : Colors.grey,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 9,
                color:
                index == _selectedIndex ? EazyColors.primary : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
