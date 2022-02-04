import 'package:get/get.dart';
import 'package:vakinha_burguer/app/core/constants/app_routes.dart';
import 'package:vakinha_burguer/app/modules/details/details_binding.dart';
import 'package:vakinha_burguer/app/modules/details/details_page.dart';

class DetailsRouter {
  DetailsRouter._();

  static List<GetPage> get pages => [
    GetPage(
      name: AppRoutes.productDetails,
      binding: DetailsBinding(),
      page: () => DetailsPage()
    )
  ];
}