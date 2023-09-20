import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_internationalization_getx/controller/language_controller.dart';
import 'package:flutter_internationalization_getx/model/language_model.dart';
import 'package:flutter_internationalization_getx/services/admob_helper.dart';
import 'package:flutter_internationalization_getx/utils/size_config.dart';
import 'package:flutter_internationalization_getx/view/screens/auth/sign_in/sign_in.dart';
import 'package:flutter_internationalization_getx/view/widgets/button_global.dart';
import 'package:flutter_internationalization_getx/view/widgets/my_text.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

import '../../../constants/constant.dart';
import '../../../services/ad_helper.dart';
import '../../widgets/button_global_with_icon.dart';
import '../testads/test_ads.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BannerAd? _bannerAd;
  final adHelper = AdHelper();
  // final _box = GetStorage();
  final _languageController = Get.put(LanguageController());
  LanguageModel? selectedLang;

  @override
  void initState() {
    super.initState();
    adHelper.loadRewardedAd();
    _loadAd();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    adHelper.disposeRewardedAd();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    selectedLang = _languageController.languageList[_languageController
        .languageList
        .indexWhere((i) => i.locale == Get.locale)];

    /* Calling Custom Config Size Class */
    SizeConfigCustom sizeConfig = SizeConfigCustom();
    sizeConfig.init(context);

    return WillPopScope(
      onWillPop: () => bottomDialogSheetAnimated(context),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kBorderColorTextField,
        appBar: _appBar(context),
        body: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Center(
                      child: ButtonGlobalWithoutIcon(
                        //"home_screen".tr,
                        buttontext: 'Check Ads',
                        buttonTextColor: kBorderColorTextField,
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: kMainColor,
                        ),
                        onPressed: () {
                          Get.to(() => TestAds(postId: '',));
                        },
                      ),
                    ),

                    /* show Authentication */
                    ButtonGlobal(
                      buttontext: 'Show Auth',
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: kMainColor,
                      ),
                      onPressed: () {
                        Get.to(() => SignIn());
                      },
                    ),
                  ],
                ),
              ),

              //
              /* if (_bannerAd != null)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: _bannerAd!.size.width.toDouble(),
                    height: _bannerAd!.size.height.toDouble(),
                    child: AdWidget(ad: _bannerAd!),
                  ),
                ) */
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      titleSpacing: 0,
      backgroundColor: kMainColor,
      elevation: 0.0,
      title: ListTile(
        horizontalTitleGap: 0,
        contentPadding: const EdgeInsets.all(10.0),
        title: MyText(
          'Data',
          style: kTextStyle.copyWith(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.only(left: 8, right: 0),
          decoration: BoxDecoration(
            color: Colors.white, //<-- SEE HERE
          ),
          height: 25.0,
          child: DropdownButton<LanguageModel>(
            iconSize: 18,
            elevation: 16,
            value: selectedLang,
            style: const TextStyle(color: Colors.white),
            underline: Container(
              padding: const EdgeInsets.only(left: 4, right: 4),
              color: Colors.transparent,
            ),
            onChanged: (newValue) async {
              setState(() {
                selectedLang = newValue!;
                if (newValue.langName == 'English') {
                  _languageController.changeLanguage("en");
                } else if (newValue.langName == 'Española') {
                  _languageController.changeLanguage("es");
                } else if (newValue.langName == 'Français') {
                  _languageController.changeLanguage("de");
                } else if (newValue.langName == 'العربية') {
                  _languageController.changeLanguage("ar");
                } else if (newValue.langName == 'اردو') {
                  _languageController.changeLanguage("ur");
                } else if (newValue.langName == 'हिंदी') {
                  _languageController.changeLanguage("hi");
                }
              });
            },
            items: _languageController.languageList
                .map<DropdownMenuItem<LanguageModel>>((value) {
              return DropdownMenuItem<LanguageModel>(
                value: value,
                child: MyText(
                  value.langName,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  /* when user back press Bottom alert-dialog box no 3 */
  bottomDialogSheet(BuildContext context) {
    return Dialogs.bottomMaterialDialog(
      msg: 'Are you sure? you can\'t undo this action',
      title: 'Delete',
      context: context,
      actions: [
        IconsOutlineButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          text: 'Cancel',
          iconData: Icons.cancel_outlined,
          textStyle: TextStyle(color: Colors.grey),
          iconColor: Colors.grey,
        ),
        IconsButton(
          onPressed: () {},
          text: 'Delete',
          iconData: Icons.delete,
          color: Colors.red,
          textStyle: TextStyle(color: Colors.white),
          iconColor: Colors.white,
        ),
      ],
    );
  }

  /* bottom Material Dialog Animated */
  bottomDialogSheetAnimated(BuildContext context) {
    return Dialogs.bottomMaterialDialog(
      msg: 'Support us, by watching short ads',
      title: 'Help Us Grow',
      color: Colors.white,
      lottieBuilder: Lottie.asset(
        'assets/json/cong_example.json',
        fit: BoxFit.contain,
      ),
      context: context,
      actions: [
        IconsOutlineButton(
          onPressed: () {
            SystemNavigator.pop();
          },
          text: 'Cancel',
          iconData: Icons.cancel_outlined,
          textStyle: TextStyle(color: Colors.grey),
          iconColor: Colors.grey,
        ),
        IconsButton(
          onPressed: () {
            adHelper.loadRewardedAd();
            log("show rewarded ads button");
            adHelper.showRewardedAd();
            //SystemNavigator.pop();
          },
          text: 'Watch',
          iconData: Icons.done,
          color: Colors.blue,
          textStyle: TextStyle(color: Colors.white),
          iconColor: Colors.white,
        ),
      ],
    );
  }

  /// Loads and shows a banner ad.
  ///
  /// Dimensions of the ad are determined by the AdSize class.
  void _loadAd() async {
    BannerAd(
      size: AdSize.banner,
      adUnitId: AdmobHelper.bannerAdUnitId,
      request: AdRequest(),
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          log("Failed to load ad ${err.message}");
          ad.dispose();
        },

        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) {},
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) {},
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) {},
      ),
    ).load();
  }
}
