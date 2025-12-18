

import '../models/category/category_model.dart';
import '../models/service/service_model.dart';
import '../models/user/user_model.dart';

class HomeController {
  UserModel getUser() {
    return UserModel(
      name: 'Tristan',
      location: 'Airport Gate -Motital Colony-Rajbari-du....',
      profileImage: 'assets/images/profile_image.jpg',
    );
  }

  List<OfferModel> getOffers() {
    return [
      OfferModel(
        title: 'Sealcoating Services',
        price: 'Rs. 699',
        discount: 'Rs. 299/year only',
        description: '*Medicine Delivery: Up to 25% Off | Lab Tests: Up to 25% Off | Home Visit: ₹499',
        image: 'assets/images/tool1.jpg',
      ),
      OfferModel(
        title: 'Sealcoating Services',
        price: 'Rs. 699',
        discount: 'Rs. 299/year only',
        description: '*Medicine Delivery: Up to 25% Off | Lab Tests: Up to 25% Off | Home Visit: ₹499',
        image: 'assets/images/tool1.jpg',
      ),
      OfferModel(
        title: 'Sealcoating Services',
        price: 'Rs. 699',
        discount: 'Rs. 299/year only',
        description: '*Medicine Delivery: Up to 25% Off | Lab Tests: Up to 25% Off | Home Visit: ₹499',
        image: 'assets/images/tool1.jpg',
      ),
    ];
  }

  List<ServiceModel> getServices() {
    return [
      ServiceModel(name: 'Paving', image: 'assets/images/service1.jpg'),
      ServiceModel(name: 'Sealcoating', image: 'assets/images/service2.jpg'),
      ServiceModel(name: 'Cold Planing', image: 'assets/images/service3.jpg'),
      ServiceModel(name: 'Asphalt\nRepair', image: 'assets/images/service4.jpg'),
      ServiceModel(name: 'Sports Court', image: 'assets/images/service5.jpg'),
      ServiceModel(name: 'Crack Seal', image: 'assets/images/service6.jpg'),
    ];
  }

  List<CategoryModel> getCategories() {
    return [
      CategoryModel(
        name: 'Jcy',
        phone: '+732 9999 III',
        image: 'assets/images/person1.jpg',
        stars: 2,
      ),
      CategoryModel(
        name: 'Laila',
        phone: 'B: 732 9999 III',
        image: 'assets/images/person2.jpg',
        stars: 2,
      ),
      CategoryModel(
        name: 'Doe John',
        phone: 'B: 732 9999 III',
        image: 'assets/images/person3.jpg',
        stars: 2,
      ),
    ];
  }
}