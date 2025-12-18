
import '../models/home_service_model.dart';

class ServiceController {
  List<ServiceModel> getServices() {
    return [
      ServiceModel(
        title: 'General Contracting',
        rating: 2000,
        imageUrl: 'assets/images/service_image1.jpg',
      ),
      ServiceModel(
        title: 'Kitchen remodel',
        rating: 2000,
        imageUrl: 'assets/images/service_image2.jpg',
      ),
      ServiceModel(
        title: 'Bathroom remodel',
        rating: 2000,
        imageUrl: 'assets/images/service_image3.jpg',
      ),
      ServiceModel(
        title: 'Home additions',
        rating: 2000,
        imageUrl: 'assets/images/service_image4.jpg',
      ),
    ];
  }
}