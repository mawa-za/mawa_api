import 'package:flutter/material.dart';

late final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class Tools{

  static const String productCategoryFuneralPolicy = 'FUNERALPOLICY';
  static const String productCategoryTombstone = 'TOMBSTONE';

  // static late bool isTracking;

  static const String userTypeInternal = 'Internal';
  static const String userTypeExternal = 'External';
  static const String close = 'Close';
  static const String TRANSACTION = 'TRANSACTION';
  static const String LEAVEREQUEST = 'LEAVEREQUEST';
  static const String INVOICE = 'INVOICE';
  static const String TICKETTRACKING = 'TICKETTRACKING';
  static const String pause = 'Pause';
  static const String stop = 'Stop';
  static const String resolve = 'Resolve';
  static dynamic previousContext;
  static late String lastPage;
  static late BuildContext context;
  static int pageIndex = 0;
  static bool isTouchLocked = false;
  static String screenMessage = '';
  static late Widget body;
  static late String attachmentReference;
  static late String documentType;
  static late String parentType;
  late String email;

  static bool bannerShow = false;
  static String bannerMessage = '';

  static String? personCreateRole;
  static final flashKey = GlobalKey<FormState>();

  static const String endpointURL =
      'https://api-dev.mawa.co.za:8181/mawa-api/resources';

  // 'http://mawa-test.raretag.co.za:8080/mawa-api/resources/';

  // 'mawa-test.raretag.co.za:8080/mawa-api/resources/';

  final _resetPasswordFormKey = GlobalKey<FormState>();

  final TextEditingController _newPasswordController = TextEditingController();
  dynamic resetPasswordFeedback;

  final _forgotPasswordFormKey = GlobalKey<FormState>();
  final _tokenFormKey = GlobalKey<FormState>();


  static final Map<String, int> tabs = {
    'Balance':0,
    'History':1,
    'Approvals':2,
    // SearchTicket.id: 0,
    // MyTickets.id: 1,
    // NewTickets.id: 2,
    // TrackTicket.id: 4,
  };

  static textInputDecorations(String textLabel, icon, {String? hint, String? helperTxt}) {
    return InputDecoration(
        helperText: helperTxt ?? '',
        icon: Icon(icon),
        labelText: textLabel,
        hintText: hint,
        filled: true,
        fillColor: Colors.grey[100],
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ));
  }

  static textInputDecoration(String textLabel, {String? hint, String? helperTxt}) {
    return InputDecoration(
        helperText: helperTxt ?? '',
        labelText: textLabel,
        hintText: hint,
        filled: true,
        fillColor: Colors.grey[100],
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ));
  }

  static dropdownContainerDeco() {
    return BoxDecoration(
      color: Colors.grey[100],
      borderRadius: const BorderRadius.all(
        Radius.circular(10.0),
      ),
      border: Border.all(color: Colors.grey, width: 2.0),
    );
  }

}