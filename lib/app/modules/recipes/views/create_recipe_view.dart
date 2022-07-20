import 'dart:io';
import 'package:flutter/services.dart';

import 'package:bukateria/app/modules/pages/google_places_search.dart';
import 'package:bukateria/flutter_flow/flutter_flow_icon_button.dart';
import 'package:bukateria/flutter_flow/flutter_flow_theme.dart';
import 'package:bukateria/flutter_flow/flutter_flow_widgets.dart';
import 'package:bukateria/themes/colors.dart';
import 'package:bukateria/themes/text.dart';
import 'package:bukateria/widgets/custom_button.dart';
import 'package:bukateria/widgets/radio_button_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AddRecipe extends StatefulWidget {
  const AddRecipe({Key? key}) : super(key: key);

  @override
  _AddRecipeState createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  TextEditingController? addIngredientFieldController1;
  TextEditingController? descriptionController;
  TextEditingController? fullNameController;
  double? sliderValue;
  TextEditingController? addIngredientFieldController2;
  TextEditingController? texeareaController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    addIngredientFieldController1 = TextEditingController();
    descriptionController = TextEditingController();
    fullNameController = TextEditingController();
    addIngredientFieldController2 = TextEditingController();
    texeareaController = TextEditingController();
    // WidgetsBinding.instance?.addPostFrameCallback((_) => setState(() {}));
  }

  MenuType? _menuType;

  String value = 'cuisines';
  List<S2Choice<String>> options = [
    S2Choice<String>(value: 'african', title: 'African'),
    S2Choice<String>(value: 'american', title: 'American'),
    S2Choice<String>(value: 'Brazilian', title: 'Brazilian'),
    S2Choice<String>(value: 'british', title: 'British'),
    S2Choice<String>(value: 'cajun', title: 'Cajun'),
    S2Choice<String>(value: 'chinese', title: 'Chinese'),
    S2Choice<String>(value: 'french', title: 'French'),
    S2Choice<String>(value: 'german', title: 'German'),
    S2Choice<String>(value: 'greek', title: 'Greek'),
    S2Choice<String>(value: 'italian', title: 'Italian'),
    S2Choice<String>(value: 'indian', title: 'Indian'),
    S2Choice<String>(value: 'indonesian', title: 'Indonesian'),
    S2Choice<String>(value: 'japanese', title: 'Japanese'),
    S2Choice<String>(value: 'korean', title: 'Korean'),
    S2Choice<String>(value: 'lebanese', title: 'Lebanese'),
    S2Choice<String>(value: 'mediterranean', title: 'Mediterranean'),
    S2Choice<String>(value: 'mexican', title: 'Mexican'),
    S2Choice<String>(value: 'moroccan', title: 'Moroccan'),
    S2Choice<String>(value: 'pakistani', title: 'Pakistani'),
    S2Choice<String>(value: 'russian', title: 'Russian'),
    S2Choice<String>(value: 'spanish', title: 'Spanish'),
    S2Choice<String>(value: 'thai', title: 'Thai'),
    S2Choice<String>(value: 'turkish', title: 'Turkish'),
    S2Choice<String>(value: 'Vietnamese', title: 'Vietnamese'),
    S2Choice<String>(value: 'others', title: 'Others'),
  ];

  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imagePath = File(image.path);
      setState(() => this.image = imagePath);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: white,
        // toolbarHeight: 70,
        iconTheme: IconThemeData(color: dark),
        automaticallyImplyLeading: true,
        actions: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 20,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
                color: grey, borderRadius: BorderRadius.circular(10)),
            child: Text("Save"),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 20,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
                color: primary, borderRadius: BorderRadius.circular(10)),
            child: Text("Publish"),
          ),
          SizedBox(
            width: 20,
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
              onTap: () => _selectOptionBottomSheet(),
              child: image != null
                  ? Image.file(
                      image!,
                      height: 230,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      height: 230,
                      padding: EdgeInsets.only(bottom: 20),
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Text(
                        "Tap to upload image/video",
                        style: title3,
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          image: DecorationImage(
                              scale: 2.0,
                              fit: BoxFit.contain,
                              image: AssetImage("assets/images/food1.png"))),
                    ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 30),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                    child: TextFormField(
                      controller: fullNameController,
                      onChanged: (val) {},
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Title',
                        hintText: 'Title',
                        hintStyle: title3.copyWith(color: grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE5E5E5),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE5E5E5),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: greyLight.withOpacity(0.2),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                    child: TextFormField(
                      controller: descriptionController,
                      onChanged: (_) {},
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        // labelText: 'Description',
                        hintText: 'Briefly describe your menu here',
                        hintStyle: body3.copyWith(color: grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: greyLight.withOpacity(0.3),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: greyLight.withOpacity(0.3),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: greyLight.withOpacity(0.2),
                      ),
                      maxLines: 4,
                    ),
                  ),

                  // SizedBox(
                  //   height: 20,
                  // ),
                  Container(
                    color: greyLight.withOpacity(0.3),
                    child: SmartSelect<String>.single(
                        choiceType: S2ChoiceType.chips,
                        placeholder: "",
                        selectedValue: value,
                        title: 'Type of Cuisines',
                        choiceItems: options,
                        onChange: (state) =>
                            setState(() => value = state.value)),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                    child: Text(
                      'Recipe Category',
                      style: title5,
                    ),
                  ),
                  CustomRadio(
                    menuType: _menuType,
                    title: "Appetizer",
                    value: MenuType.Appetizer,
                    onChanged: (val) {
                      setState(() {
                        _menuType = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomRadio(
                    menuType: _menuType,
                    title: "Main Dish",
                    value: MenuType.Main,
                    onChanged: (val) {
                      setState(() {
                        _menuType = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  CustomRadio(
                    menuType: _menuType,
                    title: "Desert",
                    value: MenuType.Desert,
                    onChanged: (val) {
                      setState(() {
                        _menuType = val;
                      });
                    },
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  CustomRadio(
                    menuType: _menuType,
                    title: "Side Dish",
                    value: MenuType.Side,
                    onChanged: (val) {
                      setState(() {
                        _menuType = val;
                      });
                    },
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  CustomRadio(
                    menuType: _menuType,
                    title: "Drink",
                    value: MenuType.Drink,
                    onChanged: (val) {
                      setState(() {
                        _menuType = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                    child: Text(
                      'Ingredients',
                      style: title5,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 60,
                        icon: Icon(
                          Icons.drag_indicator,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                          child: TextFormField(
                            controller: addIngredientFieldController1,
                            onChanged: (_) {},
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Add ingredient',
                              hintText: 'Enter  ingredient',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              fillColor: greyLight.withOpacity(0.2),
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 60,
                        icon: Icon(
                          Icons.drag_indicator,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                          child: TextFormField(
                            controller: addIngredientFieldController2,
                            onChanged: (_) {},
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Add  ingredient',
                              hintText: 'Enter  ingredient',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              fillColor: greyLight.withOpacity(0.2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "ingredient",
                        style: title5,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                    child: Text(
                      'Methods',
                      style: title5,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Chip(
                                padding: EdgeInsets.all(0),
                                backgroundColor: dark,
                                label: Text('1',
                                    style: TextStyle(color: Colors.white)),
                              ),
                              Icon(
                                Icons.drag_indicator,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20,
                              ),
                            ],
                          ),
                          Flexible(
                            child: TextFormField(
                              controller: descriptionController,
                              onChanged: (_) {},
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                // labelText: 'Description',
                                hintText: 'method text',
                                hintStyle: body3.copyWith(color: grey),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: greyLight.withOpacity(0.3),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: greyLight.withOpacity(0.3),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor: greyLight.withOpacity(0.2),
                              ),
                              maxLines: 2,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.more_horiz)
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 50,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: greyLight.withOpacity(0.3),
                            ),
                            width: 60,
                            height: 60,
                            child: Image.asset("assets/images/camera.png"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "step",
                            style: title5,
                          )
                        ],
                      )
                    ],
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 20),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Text(
                  //         "Delete Post",
                  //         textAlign: TextAlign.center,
                  //         style: title5.copyWith(color: primary),
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectOptionBottomSheet() {
    double width = MediaQuery.of(context).size.width;
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            color: white,
            child: new Wrap(
              children: <Widget>[
                Container(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: width,
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Choose Option',
                            textAlign: TextAlign.center,
                            style: title4,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            pickImage(ImageSource.camera);
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: width,
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.camera_alt,
                                  color: Colors.black.withOpacity(0.7),
                                  size: 18.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Camera',
                                  style: title4,
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            pickImage(ImageSource.gallery);
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: width,
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.photo_album,
                                  color: Colors.black.withOpacity(0.7),
                                  size: 18.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Upload from Gallery',
                                  style: body3,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
