import 'dart:typed_data';

import 'package:bug_busters_flutter/core/constants/assets.dart';
import 'package:bug_busters_flutter/core/constants/colors.dart';
import 'package:bug_busters_flutter/features/profile/presentation/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker_web/image_picker_web.dart';

class DesktopView extends StatefulWidget {
  final TextEditingController name;

  final TextEditingController email;

  final TextEditingController publicAddress;

  const DesktopView(
      {Key? key,
      required this.name,
      required this.email,
      required this.publicAddress})
      : super(key: key);

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  String dropDownButton = "Default";
  Uint8List? profilePic;

  Map currencyList = <String, Widget>{
    'Default': const Text("Select Currency"),
    'ETH': const Text("ETH"),
    'MTK': const Text("MTK")
  };

  var currency = [
    'Default',
    'ETH',
    'MTK',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.kWhite,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: AppColors.kShadow, spreadRadius: 1, blurRadius: 10)
          ]),
      child: IntrinsicHeight(
        child: Form(
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("Edit Profile",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      profilePic = await ImagePickerWeb
                                          .getImageAsBytes();
                                      setState(() {});
                                    },
                                    child: ClipOval(
                                      child: SizedBox(
                                          height: 200,
                                          child: profilePic == null
                                              ? Image.asset(
                                                  AppAssets.kAvatar,
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.memory(profilePic!)),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton.icon(
                                        onPressed: () async {
                                          profilePic = await ImagePickerWeb
                                              .getImageAsBytes();
                                          setState(() {});
                                        },
                                        style: TextButton.styleFrom(
                                          fixedSize: const Size(200, 50),
                                          backgroundColor: AppColors.kPrimary,
                                          elevation: 0,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 28, vertical: 20),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          ),
                                        ),
                                        icon: const Icon(
                                          Icons.add,
                                          color: AppColors.kWhite,
                                        ),
                                        label: const Text(
                                          "Upload Picture",
                                          style: TextStyle(
                                            color: AppColors.kWhite,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      TextButton.icon(
                                        onPressed: () {
                                          setState(() {
                                            profilePic = null;
                                          });
                                        },
                                        style: TextButton.styleFrom(
                                          fixedSize: const Size(200, 50),
                                          backgroundColor: Colors.transparent,
                                          elevation: 0,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 28, vertical: 20),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              side: const BorderSide(
                                                  color: AppColors.kRed)),
                                        ),
                                        icon: const Icon(
                                          Icons.delete,
                                          color: AppColors.kRed,
                                        ),
                                        label: const Text(
                                          "Remove",
                                          style: TextStyle(
                                            color: AppColors.kRed,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ]),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextFieldProfile(
                                        controller: widget.name,
                                        title: "Name",
                                        width: 500,
                                        hintText: "Enter Full name"),
                                    const SizedBox(height: 10),
                                    TextFieldProfile(
                                        controller: widget.email,
                                        title: "Email",
                                        hintText: "Email",
                                        width: 500),
                                    const SizedBox(height: 10),
                                    TextFieldProfile(
                                      controller: widget.publicAddress,
                                      type: TextInputType.multiline,
                                      maxLine: 1,
                                      title: "Public Address",
                                      hintText: "Public Address",
                                      width: 500,
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            width: 150,
                                            height: 50,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              child: const Text("Submit"),
                                              style: ElevatedButton.styleFrom(
                                                  primary: AppColors.kPrimary),
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    width: 500,
                    color: AppColors.kPrimary,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppAssets.kBitcoin,
                          height: 200,
                          width: 500,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * .25,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColors.kWhite,
                                boxShadow: const [
                                  BoxShadow(
                                      color: AppColors.kShadow,
                                      blurRadius: 5,
                                      spreadRadius: 1)
                                ]),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * .8,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          "Swap",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20),
                                        ),
                                        Icon(
                                          Icons.settings,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                  TextField(
                                    maxLength: 15,
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(
                                        color: AppColors.kBlack),
                                    decoration: InputDecoration(
                                      counter: const Offstage(),
                                      fillColor: AppColors.kGrey,
                                      filled: true,
                                      border: InputBorder.none,
                                      suffixIcon: DropdownButton(
                                        value: dropDownButton,
                                        style: const TextStyle(
                                            color: Colors.black),
                                        items: currency.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items,
                                                style: const TextStyle(
                                                    color: AppColors.kBlack)),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          dropDownButton = value.toString();
                                        },
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: Colors.white)),
                                      hintText: "0.0",
                                      hintStyle:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  TextField(
                                    maxLength: 15,
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(color: Colors.black),
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      counter: const Offstage(),
                                      border: InputBorder.none,
                                      fillColor: AppColors.kWhite,
                                      filled: true,
                                      suffixIcon: DropdownButton(
                                        value: dropDownButton,
                                        style: const TextStyle(
                                            color: Colors.black),
                                        items: currency.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items,
                                                style: const TextStyle(
                                                    color: AppColors.kBlack)),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          dropDownButton = value.toString();
                                        },
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: Colors.white)),
                                      hintText: "0.0",
                                      hintStyle:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  TextButton.icon(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      fixedSize: const Size(200, 50),
                                      backgroundColor: AppColors.kPrimary,
                                      elevation: 0,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 28, vertical: 20),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          side: const BorderSide(
                                              color: AppColors.kPrimary)),
                                    ),
                                    icon: const Icon(
                                      Icons.swap_horiz,
                                      color: AppColors.kWhite,
                                    ),
                                    label: const Text(
                                      "Swap",
                                      style: TextStyle(
                                        color: AppColors.kWhite,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomClip extends StatelessWidget {
  final String file;
  final double? top;
  final double? left;
  final double? bottom;
  final double? right;
  final double? width;
  final double? height;
  final double opacity;

  const CustomClip(
      {Key? key,
      required this.file,
      this.top,
      this.left,
      this.right,
      this.width,
      this.height,
      this.bottom,
      this.opacity = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      bottom: bottom,
      right: right,
      child: Opacity(
        opacity: opacity,
        child: SvgPicture.asset(
          file,
          height: height,
          width: width,
        ),
      ),
    );
  }
}
