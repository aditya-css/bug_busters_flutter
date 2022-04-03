import 'dart:convert';
import 'dart:math';

import 'package:bug_busters_flutter/core/constants/resources.dart';
import 'package:bug_busters_flutter/core/widgets/custom_elevated_container.dart';
import 'package:bug_busters_flutter/features/profile/mobx/profile_store.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web3/flutter_web3.dart' hide Provider;
import 'package:provider/provider.dart';

class SwapTokenView extends StatefulWidget {
  const SwapTokenView({Key? key}) : super(key: key);

  @override
  State<SwapTokenView> createState() => _SwapTokenViewState();
}

class _SwapTokenViewState extends State<SwapTokenView> {
  bool get isEnabled => ethereum != null;
  late final ProfileStore store;
  late final dynamic jsonResult;
  late List<String> newData;

  TextEditingController currencyOne = TextEditingController();
  TextEditingController currencyTwo = TextEditingController();

  String dropDownCurrency1 = "Default";

  String dropDownCurrency2 = "Default";

  Map currencyList = <String, Widget>{
    'Default': const Text("Select Currency"),
    'ETH': const Text("ETH"),
    'META': const Text("META")
  };

  var currency = [
    'Default',
    'ETH',
    'META',
  ];

  Future<void> getMetaStack() async {
    var jsonString = await rootBundle.loadString(AppAssets.kMetaStack);
    jsonResult = await jsonDecode(jsonString);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getMetaStack();
    store = Provider.of<ProfileStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomElevatedContainer(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Swap",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    maxLength: 15,
                    controller: currencyOne,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: AppColors.kBlack),
                    decoration: InputDecoration(
                      counter: const Offstage(),
                      fillColor: AppColors.kPrimary.withOpacity(0.1),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      suffixIcon: DropdownButton(
                        value: dropDownCurrency1,
                        underline: const SizedBox.shrink(),
                        style: const TextStyle(color: Colors.black),
                        items: currency.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items,
                                style:
                                    const TextStyle(color: AppColors.kBlack)),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            dropDownCurrency1 = value.toString();
                          });
                        },
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.white)),
                      hintText: "0.0",
                      hintStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: currencyTwo,
                    maxLength: 15,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      counter: const Offstage(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: AppColors.kPrimary.withOpacity(0.1),
                      filled: true,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      suffixIcon: DropdownButton(
                        value: dropDownCurrency2,
                        style: const TextStyle(color: Colors.black),
                        underline: const SizedBox.shrink(),
                        items: currency.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items,
                                style:
                                    const TextStyle(color: AppColors.kBlack)),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            dropDownCurrency2 = value.toString();
                          });
                        },
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.white)),
                      hintText: "0.0",
                      hintStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton.icon(
                    onPressed: () async {
                      if (ethereum != null) {
                        try {
                          final metaToken = Contract(
                            '0x9Bf51d67178Ca86487d360f20f69a9DBaB98E889',
                            Interface(await rootBundle
                                .loadString(AppAssets.kMetaToken)),
                            provider!.getSigner(),
                          );
                          if (dropDownCurrency2 == "ETH") {
                            metaToken.send(
                                'ethToToken',
                                [],
                                TransactionOverride(
                                    value: BigInt.from(
                                        (double.parse(currencyTwo.text)) *
                                            pow(10, 17))));
                          } else if (dropDownCurrency2 == "META") {
                            metaToken.send(
                              'tokenToEth',
                              [(double.parse(currencyTwo.text) * pow(10, 17))],
                            );
                          }
                        } on EthereumUserRejected {
                          print('User rejected the modal');
                        }
                      } else {
                        print("Ethereum not aviavlable");
                      }
                    },
                    style: TextButton.styleFrom(
                      fixedSize: const Size(200, 50),
                      backgroundColor: AppColors.kPrimary,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                          side: const BorderSide(color: AppColors.kPrimary)),
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
        TextButton.icon(
          onPressed: () async {
            if (ethereum != null) {
              try {
                store.access = await ethereum!.requestAccount();
              } on EthereumUserRejected {
                if (kDebugMode) {
                  print('User rejected the modal');
                }
              }
            }
          },
          style: TextButton.styleFrom(
            fixedSize: const Size(200, 50),
            backgroundColor: AppColors.kPrimary,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
                side: const BorderSide(color: AppColors.kPrimary)),
          ),
          icon: const Icon(
            Icons.wallet_membership_outlined,
            color: AppColors.kWhite,
          ),
          label: const Text(
            "Connect Wallet",
            style: TextStyle(
              color: AppColors.kWhite,
            ),
          ),
        ),
      ],
    );
  }
}
