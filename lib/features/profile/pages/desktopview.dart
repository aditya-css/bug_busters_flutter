import 'package:bug_busters_flutter/core/constants/assets.dart';
import 'package:bug_busters_flutter/core/constants/colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/textfield.dart';

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
  FilePickerResult? profilePic;
  @override
  Widget build(BuildContext context) {
    return Form(
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
                    Text(
                      "Edit Profile",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        profilePic = await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['jpg', 'png'],
                        );
                        setState(() {
                          // print(data);
                        });
                      },
                      child: ClipOval(
                        child: SizedBox(
                            height: 200,
                            child: profilePic == null
                                ? Image.asset(
                                    AppAssets.kAvatar,
                                    fit: BoxFit.cover,
                                  )
                                : Image.memory(profilePic!.files.first.bytes!)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton.icon(
                          onPressed: () async {
                            profilePic = await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['jpg', 'png'],
                            );
                            setState(() {});
                          },
                          style: TextButton.styleFrom(
                            fixedSize: const Size(200, 50),
                            backgroundColor: AppColors.kPrimary,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 28, vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
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
                              borderRadius: BorderRadius.circular(2),
                              side: const BorderSide(
                                color: AppColors.kRed,
                              ),
                            ),
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
                            mainAxisAlignment: MainAxisAlignment.center,
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
