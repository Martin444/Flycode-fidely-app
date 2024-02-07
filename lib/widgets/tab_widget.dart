import 'package:flutter/material.dart';
import 'package:flycode/utils/colors/fl_colors.dart';

class TabsWidget extends StatefulWidget {
  final List<String> titles;
  final Function(int) onChange;

  const TabsWidget({Key? key, required this.titles, required this.onChange})
      : super(key: key);

  @override
  _TabsWidgetState createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.titles.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        widget.onChange(_tabController.index);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 3,
        horizontal: 9,
      ),
      decoration: BoxDecoration(
          color: FlColors.withe2.withOpacity(0.3),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              blurRadius: 33,
              blurStyle: BlurStyle.normal,
              offset: const Offset(0, 7),
              color: FlColors.blueSelector.withOpacity(0.2),
            )
          ]),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: FlColors.blueSelector,
        ),
        padding: EdgeInsets.zero,
        indicatorPadding: const EdgeInsets.symmetric(vertical: 6),
        tabs: widget.titles
            .map((title) => Tab(
                  text: title,
                ))
            .toList(),
      ),
    );
  }
}
