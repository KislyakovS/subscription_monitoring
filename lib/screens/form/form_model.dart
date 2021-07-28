import 'package:subscription_monitoring/models/Subscription.dart';

class FormModel {
  bool isUpdate;
  Subscription? subscription;

  FormModel({this.subscription, required this.isUpdate});

  void save() {}
}
