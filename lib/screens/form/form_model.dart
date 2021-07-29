import 'package:subscription_monitoring/models/Subscription.dart';

class FormModel {
  bool isUpdate;
  Subscription? subscription;

  FormModel({this.subscription, required this.isUpdate});

  void save() {}
}


//   Subscription _getNewSubscription() {
//   final diffDays = dateStart.difference(DateTime.now()).inDays;
//   final startDate = diffDays > 0
//       ? Utils.addMonth(count: -1, currentDate: dateStart)
//       : dateStart;
//   final endDate = diffDays > 0
//       ? dateStart
//       : Utils.addMonth(count: 1, currentDate: dateStart);

//   return Subscription(
//     id: Random().nextInt(500),
//     imageSrc: imageSrc,
//     title: title.text,
//     startDate: startDate,
//     endDate: endDate,
//     initDate: dateStart,
//     price: double.parse(price.text),
//   );
// }
