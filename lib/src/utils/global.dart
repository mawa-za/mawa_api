import 'package:mawa_api/mawa_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

late String redirect;
final Future<SharedPreferences> preferences = SharedPreferences.getInstance();
late Individual selectedIndividual;
late Membership selectedMembership;
