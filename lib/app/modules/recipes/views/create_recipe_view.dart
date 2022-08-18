import 'dart:io';
import 'package:bukateria/common_views.dart';
import 'package:bukateria/cubit/post_cubit/post_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import 'package:bukateria/flutter_flow/flutter_flow_icon_button.dart';
import 'package:bukateria/flutter_flow/flutter_flow_theme.dart';
import 'package:bukateria/themes/colors.dart';
import 'package:bukateria/themes/text.dart';
import 'package:bukateria/widgets/radio_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
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

  List<String> ingredients = [];
  List<Map<String, dynamic>> methods = [];

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
  String? imagePath;

  Future pickImage(ImageSource source,int index) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;


      setState(() {
        if(index == -1) {
          imagePath = image.path;
        }else{
          methods[index]["image"] = image.path;
        }
      });

    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostCubit, PostState>(listener: (context, state) {

      if (state.status == PostStatus.save) {
        Get.back();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Recipe Successfully saved!")));
      }else if (state.status == PostStatus.publish) {
        Get.back();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Recipe Successfully published!")));
        Get.back();
      }else if (state.status == PostStatus.error) {
        Get.back();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Something went wrong!")));
      }else if(state.status == PostStatus.submitting){
        CommonViews.showProgressDialog(context);
      }
    }, child: BlocBuilder<PostCubit, PostState>(
    builder: (context, state)
    {
      return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: white,
          // toolbarHeight: 70,
          iconTheme: const IconThemeData(color: dark),
          automaticallyImplyLeading: true,
          actions: [
            InkWell(
              onTap: () {
                if (imagePath == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Image is not selected")));
                } else if ((fullNameController?.text ?? "").isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: const Text("please add title")));
                } else if ((descriptionController?.text ?? "").isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please add description")));
                } else if (value == 'cuisines') {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: const Text("Please select cuisine")));
                } else if (_menuType == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: const Text("please select category")));
                } else if (ingredients.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Please add at least one ingredient")));
                } else if (methods.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Please add at least one Method")));
                } else {
                  bool ingredientResult = false;
                  bool methodResult = false;
                  ingredients.forEach((element) {
                    print("------------elements------------ ${element}");
                    if (element.isEmpty) {
                      ingredientResult = true;
                    }
                  });
                  methods.forEach((element) {
                    if (element["text"].isEmpty || element["image"].isEmpty) {
                      methodResult = true;
                    }
                  });
                  if (ingredientResult) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            "Please fill all fields in ingredients")));
                  } else if (methodResult) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text(
                            "Please fill all fields in methods")));
                  } else {
                    context.read<PostCubit>().imageChanged(File(imagePath!));
                    context.read<PostCubit>().titleChanged(
                        fullNameController!.text);
                    context.read<PostCubit>().descriptionChanged(
                        descriptionController!.text);
                    context.read<PostCubit>().typeOfCuisineChanged(value);
                    context.read<PostCubit>().recipeCategoryChanged(
                        _menuType == MenuType.Appetizer
                            ? "Appitizer"
                            : _menuType == MenuType.Desert
                            ? "Desert"
                            : _menuType == MenuType.Drink
                            ? "Drink"
                            : _menuType == MenuType.Main
                            ? "Main Dish"
                            : _menuType == MenuType.Side ? "Side Dish" : "");
                    context.read<PostCubit>().ingredientsChanged(ingredients);
                    context.read<PostCubit>().methodsChanged(methods);
                    context.read<PostCubit>().productStatusChanged("SAVE");
                    context.read<PostCubit>().postRecipeCredentials(
                        "", FirebaseAuth.instance.currentUser?.uid ?? "");
                  }
                }
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 20,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: state.status == PostStatus.initial? grey : Colors.grey.shade300, borderRadius: BorderRadius.circular(10)),
                child: const Text("Save"),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: (){
                if(state.status == PostStatus.save){
                  context.read<PostCubit>().productStatusChanged("SAVE");
                  context.read<PostCubit>().updateRecipeStatus("${state.key}", FirebaseAuth.instance.currentUser?.uid ?? "");
                }else{
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("Please Save first!")));
                }
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 20,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: primary, borderRadius: BorderRadius.circular(10)),
                child: const Text("Publish"),
              ),
            ),
            const SizedBox(
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
                onTap: () {
                  setState(() async {
                    imagePath = await _selectOptionBottomSheet(-1);
                  });
                },
                child: imagePath != null
                    ? Image.file(
                  File(imagePath!),
                  height: 230,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
                    : Container(
                  height: 230,
                  padding: const EdgeInsets.only(bottom: 20),
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Text(
                    "Tap to upload image/video",
                    style: title3,
                    textAlign: TextAlign.center,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      image: const DecorationImage(
                          scale: 2.0,
                          fit: BoxFit.contain,
                          image: const AssetImage("assets/images/food1.png"))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
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
                            borderSide: const BorderSide(
                              color: const Color(0xFFE5E5E5),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
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
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
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
                          title: 'Types of Cuisine',
                          choiceItems: options,
                          onChange: (state) =>
                              setState(() => value = state.value)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
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
                    const SizedBox(
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
                    const SizedBox(
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

                    const SizedBox(
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

                    const SizedBox(
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
                    const SizedBox(
                      height: 20,
                    ),

                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                      child: Text(
                        'Ingredients',
                        style: title5,
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: ingredients.length,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Row(
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
                                  color: FlutterFlowTheme
                                      .of(context)
                                      .primaryText,
                                  size: 30,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 20),
                                  child: TextFormField(

                                    onChanged: (text) {
                                      ingredients[index] = text;
                                      setState(() {});
                                    },
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Add ingredient',
                                      hintText: 'Enter  ingredient',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: const Color(0xFFE5E5E5),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: const Color(0xFFE5E5E5),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      filled: true,
                                      fillColor: greyLight.withOpacity(0.2),
                                    ),
                                    style:
                                    FlutterFlowTheme
                                        .of(context)
                                        .bodyText1
                                        .override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),

                    InkWell(
                      onTap: () {
                        ingredients.add("");
                        setState(() {});
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.add),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            "ingredient",
                            style: title5,
                          )
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                      child: Text(
                        'Methods',
                        style: title5,
                      ),
                    ),
                    ListView.builder(
                        itemCount: methods.length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Chip(
                                        padding: const EdgeInsets.all(0),
                                        backgroundColor: dark,
                                        label: Text("${index + 1}",
                                            style: const TextStyle(
                                                color: Colors.white)),
                                      ),
                                      Icon(
                                        Icons.drag_indicator,
                                        color: FlutterFlowTheme
                                            .of(context)
                                            .primaryText,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                  Flexible(
                                    child: TextFormField(
                                      onChanged: (text) {
                                        methods[index]["text"] = text;
                                        setState(() {});
                                      },
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
                                          borderRadius: BorderRadius.circular(
                                              10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: greyLight.withOpacity(0.3),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              10),
                                        ),
                                        filled: true,
                                        fillColor: greyLight.withOpacity(0.2),
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(Icons.more_horiz)
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      methods [index]['image'] =
                                          await _selectOptionBottomSheet(
                                              index) ?? "";
                                      setState(() {});
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: greyLight.withOpacity(0.3),
                                      ),
                                      width: 60,
                                      height: 60,
                                      child: methods [index]['image'] != "" ?
                                      Image.file(File(methods [index]['image']),
                                        fit: BoxFit.fill,) :
                                      Image.asset("assets/images/camera.png"),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),

                            ],
                          );
                        }),
                    InkWell(
                      onTap: () {
                        methods.add({
                          "text": "",
                          "image": ""
                        });
                        setState(() {});
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.add),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            "step",
                            style: title5,
                          )
                        ],
                      ),
                    )
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
    }),
    );
  }

   _selectOptionBottomSheet(int index) async {
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
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: width,
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Choose Option',
                            textAlign: TextAlign.center,
                            style: title4,
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            pickImage(ImageSource.camera,index);
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: width,
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.camera_alt,
                                  color: Colors.black.withOpacity(0.7),
                                  size: 18.0,
                                ),
                                const SizedBox(
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
                          onTap: () async{
                            pickImage(ImageSource.gallery,index);
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: width,
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.photo_album,
                                  color: Colors.black.withOpacity(0.7),
                                  size: 18.0,
                                ),
                                const SizedBox(
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
