import 'package:dansp_lab_site/home_page.dart';
import 'package:dansp_lab_site/privacy_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
    r.child('/privacy', child: (context) => const PrivacyPage());
  }
}
