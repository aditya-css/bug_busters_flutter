import 'dart:html';

import 'package:bug_busters_flutter/core/constants/resources.dart';
import 'package:bug_busters_flutter/features/login/pages/login_screen.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ///Logo
        SizedBox(
          child: Text(
            AppStrings.kAppName,
            style: Theme.of(context).textTheme.headline4?.copyWith(color: AppColors.kBlack),
          ),
        ),
        const SizedBox(width: 40.0),
        ///SearchBar
        if (size.width > 960)
          Flexible(
            child: Container(
              width: 500,
              margin: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.grey.shade300),
                  border: InputBorder.none,
                  hintText: "Search for Topics",
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                ),
              ),
            ),
          ),
        const SizedBox(width: 40.0),
        ///profile
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
          },
          child: const CircleAvatar(
            radius: 26,

            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(
              "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg",
            ),
          ),
        )
      ],
    );
  }
}
