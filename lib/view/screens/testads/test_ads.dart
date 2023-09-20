import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_internationalization_getx/constants/constant.dart';
import 'package:flutter_internationalization_getx/view/widgets/button_global.dart';
import 'package:flutter_internationalization_getx/view/widgets/button_global_with_icon.dart';

import '../../../services/ad_helper.dart';

class TestAds extends StatefulWidget {
  final String postId;

  TestAds({super.key, required this.postId});

  @override
  State<TestAds> createState() => _TestAdsState();
}

class _TestAdsState extends State<TestAds> {
  final adHelper = AdHelper();

  @override
  void initState() {
    adHelper.loadInterstitialAd();
    adHelper.loadRewardedAd();
    super.initState();
  }

  @override
  void dispose() {
    adHelper.disposeRewardedAd();
    adHelper.disposeInterstitialAd();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        /* AppBar  */
        appBar: _appBar(),

        /* Body of Scaffold */
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(widget.postId),
            ElevatedButton(
              onPressed: () {
                log("pressed....................");
              },
              child: const Text('Show Google Ads'),
            ),
            const SizedBox(height: 32),

            /* Interstitial Ad */
            Center(
              child: ButtonGlobal(
                onPressed: () {
                  adHelper.showInterstitialAd();
                },
                buttontext: 'Show Interstitial',
                buttonDecoration: kButtonDecoration,
              ),
            ),
            const SizedBox(height: 32),

            /* Rewarded Ad */
            Center(
              // child: ElevatedButton(
              //   child: Text("RewardedAd"),
              //   onPressed: () {
              //     log("show rewarded ads button");
              //     adHelper.showRewardedAd();
              //   },
              // ),
              child: ButtonGlobalWithoutIcon(
                buttontext: 'Show Rewarded Ads',
                buttonDecoration: kButtonDecoration,
                buttonTextColor: kBorderColorTextField,
                onPressed: () {
                  adHelper.showRewardedAd();
                },
              ),
            ),
            const SizedBox(height: 32),
            Container(
              alignment: Alignment.center,
              // child: AdWidget(ad: adManager.getBannerAd()!),
              // width: adManager.getBannerAd()?.size.width.toDouble(),
              // height: adManager.getBannerAd()?.size.height.toDouble(),
            )
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('Google AdMob '),
      actions: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            icon: Icon(Icons.ads_click_sharp),
            onPressed: () {
              adHelper.showInterstitialAd();
            },
          ),
        ),
      ],
    );
  }
}
