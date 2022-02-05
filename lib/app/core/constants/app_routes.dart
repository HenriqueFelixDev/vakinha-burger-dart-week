class AppRoutes {
  AppRoutes._();

  static const splash = '/';

  // Auth
  static const authPath = '/auth';
  static const login = authPath + '/login';
  static const signUp = authPath + '/signup';

  static const home = '/home';
  static const menu = '/menu';
  static const shoppingCart = '/shopping-cart';
  static const exit = '/exit';

  static const productDetails = '/product-details';

  static const orderFinish = '/orders/finish';
  static const orderPix = '/orders/pix';

}