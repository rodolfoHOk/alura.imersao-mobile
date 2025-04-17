import 'package:flutter/material.dart';
import 'package:flutter_techtaste/routes/routes.dart';
import 'package:flutter_techtaste/ui/_core/bag_provider.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

AppBar getAppBar({required BuildContext context, String? title}) {
  BagProvider bagProvider = Provider.of<BagProvider>(context);
  return AppBar(
    forceMaterialTransparency: true,
    automaticallyImplyLeading: false,
    title: title != null ? Text(title) : null,
    centerTitle: true,
    leading: Row(
      children: [
        SizedBox(width: 8),
        title == null
            ? Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(Icons.menu),
                  iconSize: 28,
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            )
            : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
              iconSize: 28,
            ),
      ],
    ),
    actions: [
      badges.Badge(
        showBadge: bagProvider.dishesOnBag.isNotEmpty,
        position: badges.BadgePosition.bottomStart(start: 0, bottom: 0),
        badgeContent: Text(
          bagProvider.dishesOnBag.length.toString(),
          style: TextStyle(fontSize: 10),
        ),
        child: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.checkout);
          },
          icon: Icon(Icons.shopping_basket),
          iconSize: 28,
        ),
      ),
      SizedBox(width: 8),
    ],
  );
}
