import 'package:chat_bot/logger_custom.dart';
import 'package:get/state_manager.dart';

class GlobalController extends GetxController {
  final RxBool _isLoading = false.obs;
  double _watchSize = 0.0;
  double _scaleRatio = 0.0;
  bool _isCircleDevice = false;
  String errorMessage = '';
  double widthScreenDevice = 0.0;
  double heightScreenDevice = 0.0;
  final CustomLogger logger = CustomLogger();

  RxBool checkLoading() => _isLoading;
  double getScaleRatio() => _scaleRatio;
  bool isCircleDevice() => _isCircleDevice;
  double getWatchSize() => _watchSize;

  void updateWatchSize(double widthScreen, double heightScreen) {
    // If widthScreen <       0   : _watchSize = 0;
    // If widthScreen > maxScreen : _watchSize = maxScreen;
    // If 0 <= widthScreen <= maxScreen : _watchSize = widthScreen;
    double maxScreen = 1080.0;

    if (widthScreen < heightScreen) {
      _watchSize = widthScreen.clamp(0, maxScreen);
    } else {
      _watchSize = heightScreen.clamp(0, maxScreen);
    }

    double defaultWatchSize = 390;

    _scaleRatio = _watchSize.toDouble() / defaultWatchSize;

    if (heightScreen <= widthScreen * 1.1) {
      // heigth < 110% of width => circle face
      _isCircleDevice = true;
      logger.warning('This is circle device');
    } else {
      _isCircleDevice = false;
      logger.warning('This is NOT circle device');
    }
    logger.debug('widthScreen Controller: $widthScreen');
    logger.debug('heightScreen Controller: $heightScreen');
    logger.debug('ScreenIsCircle Controller: $_isCircleDevice()');

    widthScreenDevice = widthScreen;
    heightScreenDevice = heightScreen;
  }

  @override
  void onInit() {
    // _cityIndex.value = 1;
    _watchSize = 1080.0;

    super.onInit();
  }
}
