import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mawa_api/mawa_api.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  dynamic host = 'localhost:8080';
  // dynamic host = 'dev.api.app.mawa.co.za';
  String tenantID;
  const env = String.fromEnvironment('env');
  if (env == 'prep') {
    host = 'prep.api.app.mawa.co.za';
  } else if (env == 'prod') {
    host = 'api.app.mawa.co.za';
  } else if (env == 'dev') {
    host = 'dev.api.app.mawa.co.za';
  } else if (env == 'alpha') {
    host = 'alpha.api.app.mawa.co.za';
  } else if (env == 'beta') {
    host = 'beta.api.app.mawa.co.za';
  }
  if (kIsWeb) {
    // running on the web!
    var base = Uri.base.origin;

    if (base.contains('localhost')){
      tenantID = "dev.app.mawa.co.za";
    }else{
      tenantID = base.split('//').last;
    }
  } else {
    tenantID = '';
    // NOT running on the web! You can check for additional platforms here.
  }
  MawaAPI.setAPIHost(env);
  MawaAPI.setTenant(tenantID);

  final response = await StorageBinService().getAll();
  print('awesome: ${response}');
}
