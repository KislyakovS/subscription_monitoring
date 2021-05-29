class Subscription {
  final String title;
  final String imageSrc;
  final double price;
  final DateTime initDate;
  final DateTime startDate;
  final DateTime endDate;

  Subscription({
    required this.title,
    required this.imageSrc,
    required this.price,
    required this.initDate,
    required this.startDate,
    required this.endDate,
  });
}

final demoSubscription = Subscription(
  title: 'Netflix',
  imageSrc:
      'https://cdn.vox-cdn.com/thumbor/QuS2QKQys3HhosKiV-2IuKhphbo=/39x0:3111x2048/1400x1050/filters:focal(39x0:3111x2048):format(png)/cdn.vox-cdn.com/uploads/chorus_image/image/49901753/netflixlogo.0.0.png',
  price: 9.99,
  initDate: DateTime.utc(2021, 2, 1),
  startDate: DateTime.utc(2021, 5, 1),
  endDate: DateTime.utc(2021, 6, 1),
);
