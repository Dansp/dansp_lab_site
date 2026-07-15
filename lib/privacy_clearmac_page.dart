import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

class PrivacyClearmacPage extends StatefulWidget {
  const PrivacyClearmacPage({Key? key}) : super(key: key);

  @override
  State<PrivacyClearmacPage> createState() => _PrivacyClearmacPageState();
}

class _PrivacyClearmacPageState extends State<PrivacyClearmacPage> {
  final controller = PlatformWebViewController(
    const PlatformWebViewControllerCreationParams(),
  );

  @override
  void initState() {
    super.initState();
    _loadHtmlFromAssets();
  }

  Future<void> _loadHtmlFromAssets() async {
    // Load HTML file as a string
    String html = await rootBundle.loadString('assets/privacy-clearmac.html');
    controller.loadHtmlString(html);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlatformWebViewWidget(
        PlatformWebViewWidgetCreationParams(controller: controller),
      ).build(context),
    );
  }
}
