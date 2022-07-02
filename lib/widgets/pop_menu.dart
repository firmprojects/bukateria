import 'package:bukateria/app/modules/login/views/role_view_view.dart';
import 'package:bukateria/app/modules/profiles/controllers/profiles_controller.dart';
import 'package:bukateria/data/menu_items.dart';
import 'package:bukateria/models/menu_item_model.dart';
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
              title: "Report/Block",
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              content: Column(
                children: [
                  Text(
                      "Please only report inappropriate content like nudity, hate speech or advertisement."),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => CheckboxListTile(
                      title: Text(
                          "I also want this person blocked from following or talking to me"),
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
                child: Text("Report"),
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
