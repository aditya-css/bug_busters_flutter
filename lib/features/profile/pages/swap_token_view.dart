import 'package:bug_busters_flutter/core/constants/resources.dart';
import 'package:bug_busters_flutter/core/widgets/custom_elevated_container.dart';
import 'package:bug_busters_flutter/features/profile/mobx/profile_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:provider/provider.dart';

class SwapTokenView extends StatefulWidget {
  SwapTokenView({Key? key}) : super(key: key);

  @override
  State<SwapTokenView> createState() => _SwapTokenViewState();
}

class _SwapTokenViewState extends State<SwapTokenView> {
  final late store;

  
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
                    onPressed: () {},
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
            // `Ethereum.isSupported` is the same as `ethereum != null`
            if (ethereum != null) {
              try {
                // Prompt user to connect to the provider, i.e. confirm the connection modal
                final accs = await ethereum!
                    .requestAccount(); // Get all accounts in node disposal
                accs; // [foo,bar]
              } on EthereumUserRejected {
                print('User rejected the modal');
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
