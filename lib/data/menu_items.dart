import 'package:bukateria/models/menu_item_model.dart';
import 'package:flutter/material.dart';

class MenuItems {
  static List<PopItem> menuItems = [report, share, logout];

  static var report = PopItem(text: "Report", icon: Icons.settings);
  static var share = PopItem(text: "Share", icon: Icons.share);
  static var logout = PopItem(text: "Logout", icon: Icons.logout);
}
