import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../services/ad_helper.dart';

class TestAds extends StatefulWidget {
  TestAds({super.key});

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
        appBar: AppBar(
          title: const Text('Flutter AdMob '),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                icon: Icon(Icons.ac_unit),
                onPressed: () {
                  adHelper.showInterstitialAd();
                },
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                //adManager.disposeAds();
                log("pressed....................");
              },
              child: const Text('Go to Second Screen'),
            ),
            const SizedBox(height: 32),

            /* Interstitial Ad */
            Center(
              child: ElevatedButton(
                child: const Text('Show Interstitial'),
                onPressed: () {
                  //adManager.showInterstitial();
                },
              ),
            ),
            const SizedBox(height: 32),

            /* Rewarded Ad */
            Center(
              child: ElevatedButton(
                child: Text("RewardedAd"),
                onPressed: () {
                  log("show rewarded ads button");
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
}
