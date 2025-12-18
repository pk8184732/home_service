
class CategoryModel {
  final String name;
  final String phone;
  final String image;
  final int stars;

  CategoryModel({
    required this.name,
    required this.phone,
    required this.image,
    required this.stars,
  });
}

class OfferModel {
  final String title;
  final String price;
  final String discount;
  final String description;
  final String image;

  OfferModel({
    required this.title,
    required this.price,
    required this.discount,
    required this.description,
    required this.image,
  });
}