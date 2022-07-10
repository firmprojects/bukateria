import 'package:bukateria/app/modules/login/views/role_view_view.dart';
import 'package:bukateria/app/modules/profiles/controllers/profiles_controller.dart';
import 'package:bukateria/data/menu_items.dart';
import 'package:bukateria/models/menu_item_model.dart';
import 'package:bukateria/themes/colors.dart';
import 'package:bukateria/themes/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopMenu extends StatelessWidget {
  ProfilesController controller = Get.put(ProfilesController());

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<PopItem>(
        onSelected: ((item) {
          if (item == MenuItems.report) {
            Get.defaultDialog(
              radius: 10,
              titleStyle: title4,
              confirmTextColor: primary,
              titlePadding: EdgeInsets.only(top: 20),
              title: "Report/Block",
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              content: Column(
                children: [
                  Text(
                      "Please only report inappropriate content like nudity, hate speech or advertisement.",
                      style: body4),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => CheckboxListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        "Blocked from following or talking to me",
                        style: body4,
                      ),
                      value: controller.checkedValue.value,
                      onChanged: (newValue) {
                        controller.checkedValue.value = newValue!;
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    ),
                  )
                ],
              ),
              confirm: TextButton(
                onPressed: () => Get.back(),
                child: Text(
                  "Report",
                  style: body3.copyWith(color: primary),
                ),
              ),
              cancel: TextButton(
                  onPressed: () => Get.back(), child: Text("Cancel")),
            );
          }

          if (item == MenuItems.logout) {
            Get.offAll(() => RoleRedirectWidget());
          }
        }),
        itemBuilder: (context) => [
              ...MenuItems.menuItems
                  .map((PopItem item) => PopupMenuItem<PopItem>(
                      value: item,
                      child: Row(
                        children: [
                          Icon(item.icon),
                          SizedBox(
                            width: 10,
                          ),
                          Text(item.text)
                        ],
                      )))
            ]);
  }
}
