// import 'package:bukateria/themes/colors.dart';
// import 'package:bukateria/themes/text.dart';
// import 'package:bukateria/widgets/custom_button.dart';
// import 'package:bukateria/widgets/custom_input.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_settings_screens/flutter_settings_screens.dart';
// import 'package:get/get.dart';

// class PickupInfo extends StatelessWidget {
//   const PickupInfo({Key? key}) : super(key: key);

//   static const phoneKey = 'phone-key';
//   static const nameKey = 'name-key';

//   @override
//   Widget build(BuildContext context) {
//     return SimpleSettingsTile(
//       title: "Contact Settings",
//       subtitle: "Phone, Address ",
//       leading: Icon(Icons.settings),
//       onTap: () {},
//       child: SettingsScreen(title: "Contact Settings", children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 30,
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
//                 child: TextFormField(
//                   onChanged: (val) {},
//                   autofocus: true,
//                   obscureText: false,
//                   decoration: InputDecoration(
//                     labelText: 'Phone Number',
//                     hintText: 'Phone Number',
//                     hintStyle: body3,
//                     labelStyle: body3,
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Color(0xFFE5E5E5),
//                         width: 1,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Color(0xFFE5E5E5),
//                         width: 1,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     filled: true,
//                     fillColor: greyLight.withOpacity(0.2),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
//                 child: TextFormField(
//                   onChanged: (val) {},
//                   autofocus: true,
//                   obscureText: false,
//                   decoration: InputDecoration(
//                     labelText: 'Enter your pick address',
//                     hintText: 'Enter your pick address',
//                     hintStyle: body3,
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: greyLight.withOpacity(0.3),
//                         width: 1,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: greyLight.withOpacity(0.3),
//                         width: 1,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     filled: true,
//                     fillColor: greyLight.withOpacity(0.2),
//                   ),
//                   maxLines: 3,
//                 ),
//               ),
//               CustomButton(
//                 width: Get.width,
//                 radius: 30,
//                 height: 50,
//                 text: "Save",
//                 color: dark,
//                 onPressed: () => {},
//               ),
//             ],
//           ),
//         )
//       ]),
//     );
//   }

//   Widget buildPrivacy() => SimpleSettingsTile(
//         title: "Privacy",
//         subtitle: "",
//         leading: Icon(Icons.privacy_tip),
//         onTap: () {},
//       );

//   Widget buildTOS() => SimpleSettingsTile(
//         title: "Terms & Conditions",
//         subtitle: "",
//         leading: Icon(Icons.document_scanner),
//         onTap: () {},
//       );
// }
