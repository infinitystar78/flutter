

class Api {
  static const scheme = 'https';
  static const baseUrl = 'fakestoreapi.com';

  static get getCategories =>
      Uri(host: baseUrl, scheme: scheme, path: '/products/categories');

  static getProductsForCategory(String category) =>
      Uri(host: baseUrl, scheme: scheme, path: '/products/category/$category');

  static login

}