import 'package:flutter/material.dart';
import 'package:food_app/common/widgets/bottom_tab_navigator.dart';

class Header extends StatefulWidget {
  final String title;
  final Widget child;
  final bool? isShowLeading;
  final bool? isShowBottomTab;
  final bool? isShowHeader;

  const Header(
      {super.key,
      required this.title,
      required this.child,
      this.isShowLeading = false,
      this.isShowBottomTab = false,
      this.isShowHeader = true});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    var showBottomTab = false;
    var showLeadingIcon = false;

    Widget? leadingContent = Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      },
    );

    if (widget.isShowBottomTab!) {
      setState(() {
        showBottomTab = true;
      });
    }

    if (widget.isShowLeading!) {
      setState(() {
        showLeadingIcon = true;
      });
    }

    return Scaffold(
      bottomNavigationBar: showBottomTab
          ? BottomTabNavigator(navigationShell: widget.child)
          : null,
      appBar: widget.isShowHeader!
          ? AppBar(
              backgroundColor: Colors.white,
              leading: showLeadingIcon ? leadingContent : null,
              title: Text(
                widget.title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            )
          : null,
      body: Container(
        padding:
            EdgeInsets.symmetric(horizontal: widget.isShowBottomTab! ? 0 : 16),
        child: widget.child,
      ),
    );
  }
}
