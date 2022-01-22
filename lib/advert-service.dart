import 'package:firebase_admob/firebase_admob.dart';

class AdvertService {
  static final AdvertService _instance = AdvertService._internal();
  factory AdvertService() => _instance;
  MobileAdTargetingInfo _targetingInfo;
  final String _bannerAd = 'ca-app-pub-5276157814906108/6264265064';
  final String _interstitial = 'ca-app-pub-5276157814906108/9687492998';
  AdvertService._internal() {
    _targetingInfo = MobileAdTargetingInfo(
      childDirected: false,
      nonPersonalizedAds: true,
      testDevices: [
        "B2928B5A224D2FC3504E1E9E4D177BD0",
        "BE56FB48D598809EA7FC70FB20810741"
      ], // test yani bu olmazsa olmuyor
    );
  }

  showBanner() {
    BannerAd banner = BannerAd(
      adUnitId: _bannerAd, // test ederken BannerAd.testAdUnitId
      size: AdSize.smartBanner,
      targetingInfo: _targetingInfo,
    );
    banner
      ..load()
      ..show(); //anchorOffset: 50 50 bırım yukarıya koyuyor
    banner.dispose();
  }

  showIntersitial() {
    InterstitialAd interstitialAd = InterstitialAd(
      adUnitId: _interstitial, //test InterstitialAd.testAdUnitId
      targetingInfo: _targetingInfo,
    );
    interstitialAd
      ..load()
      ..show();
    interstitialAd.dispose();
  }
}
