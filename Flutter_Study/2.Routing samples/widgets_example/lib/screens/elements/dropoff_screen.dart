import 'package:flutter/material.dart';
import 'package:widgets_example/models/models.dart';
import 'package:widgets_example/widgets/widgets.dart';


class DropOffScreen extends StatefulWidget {

  static String routeName = '/_elementsDemos/01_dropoff';

  @override
  _DropOffScreenState createState() => _DropOffScreenState();
}

class _DropOffScreenState extends State<DropOffScreen>
    with SingleTickerProviderStateMixin {
  final _searchController = TextEditingController();
  TabController? _tabController;

  final List<Tab> tabs = <Tab>[
    Tab(text: 'RECENT'),
    Tab(text: 'AIRPORT'),
    Tab(text: 'TRAIN STATIONS'),
  ];

  final List<Location> locations = [
    Location(address: 'Kings Cross Underground Station', city: 'New York'),
    Location(address: '83, Midwood St', city: 'New York'),
    Location(address: '67, Grand Central Pkwy', city: 'New York'),
  ];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: Text('Drop-off',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black54)),
          centerTitle: true,
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/map.png',
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
          Container(
            margin: const EdgeInsets.only(top: 128),
            padding: const EdgeInsets.symmetric(vertical: 60),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(38)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2), blurRadius: 8)
                    ]),
                    child: TextField(
                      controller: _searchController,
                      showCursor: false,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        isDense: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none),
                        prefixIcon:
                            Icon(Icons.search, color: Colors.blue, size: 30),
                        // icon:
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60),
                // LocationMenu(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    tabs: tabs,
                    labelPadding: EdgeInsets.symmetric(horizontal: 24),
                    labelColor: Theme.of(context).primaryColor,
                    unselectedLabelColor: Colors.black.withOpacity(0.3),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        ListView.separated(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          itemCount: locations.length,
                          itemBuilder: (context, index) => LocationItem(
                            item: locations[index],
                            onTap: (item) {
                              _searchController.text = item.address;
                            },
                          ),
                          separatorBuilder: (context, _) => Padding(
                            padding: EdgeInsets.only(right: 16, left: 56),
                            child: Divider(),
                          ),
                        ),
                        ListView.separated(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          itemCount: locations.length,
                          itemBuilder: (context, index) => LocationItem(
                            item: locations[index],
                            onTap: (item) {
                              _searchController.text = item.address;
                            },
                          ),
                          separatorBuilder: (context, _) => Padding(
                            padding: EdgeInsets.only(right: 16, left: 56),
                            child: Divider(),
                          ),
                        ),
                        ListView.separated(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          itemCount: locations.length,
                          itemBuilder: (context, index) => LocationItem(
                            item: locations[index],
                            onTap: (item) {
                              _searchController.text = item.address;
                            },
                          ),
                          separatorBuilder: (context, _) => Padding(
                            padding: EdgeInsets.only(right: 16, left: 56),
                            child: Divider(),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
