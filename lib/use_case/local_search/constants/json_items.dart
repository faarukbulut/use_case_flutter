class JsonItems {
  JsonItems._();
  static final String largeJsonPath = '10k.json'.path;
  static final String lottieColorLoading = 'lottie-1.json'.path;

}

extension on String{
  String get path{
    return 'assets/json/$this';
  }
}