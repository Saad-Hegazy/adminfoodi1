import 'package:adminfoodi1/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:adminfoodi1/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:adminfoodi1/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:adminfoodi1/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:adminfoodi1/view/screen/auth/login.dart';
import 'package:adminfoodi1/view/screen/categories/add.dart';
import 'package:adminfoodi1/view/screen/categories/edit.dart';
import 'package:adminfoodi1/view/screen/categories/view.dart';
import 'package:adminfoodi1/view/screen/home.dart';
import 'package:adminfoodi1/view/screen/items/add.dart';
import 'package:adminfoodi1/view/screen/items/edit.dart';
import 'package:adminfoodi1/view/screen/items/view.dart';
import 'package:adminfoodi1/view/screen/language.dart';
import 'package:adminfoodi1/view/screen/onboarding.dart';
import 'package:adminfoodi1/view/screen/orders/accepted.dart';
import 'package:adminfoodi1/view/screen/orders/ontheway.dart';
import 'package:adminfoodi1/view/screen/orders/details.dart';
import 'package:adminfoodi1/view/screen/orders/onthewayorderdetails.dart';
import 'package:adminfoodi1/view/screen/orders/pending.dart';
import 'package:adminfoodi1/view/screen/orders/screen.dart';
import 'package:adminfoodi1/view/screen/settings.dart';
import 'package:get/get.dart';
import 'core/constant/routes.dart';
import 'core/middleware/mymiddleware.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
// ================================= Auth ========================== //
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successResetpassword, page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
// ================================= Home ========================== //
  GetPage(name: AppRoute.homepage, page: () => const HomePage()),
// ================================= Categories ========================== //
  GetPage(name: AppRoute.categoriesview, page: () => const CategoriesView()),
  GetPage(name: AppRoute.categoriesadd, page: () => const CategoriesAdd()),
  GetPage(name: AppRoute.categoriesedit, page: () => const CategoriesEdit()),
  // ================================= Items ========================== //
  GetPage(name: AppRoute.itemsview, page: () => const ItemsView()),
  GetPage(name: AppRoute.itemsadd, page: () => const ItemsAdd()),
  GetPage(name: AppRoute.itemsedit, page: () => const ItemsEdit()),
  // ================================= Orders ========================== //
  GetPage(name: AppRoute.ordersPending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersPending, page: () => const OrdersAccepted()),
  GetPage(name: AppRoute.ordersScreen, page: () => const OrderScreen()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoute.orderswithdeliveryView, page: () => const OrderswithdeliveryView()),
  GetPage(name: AppRoute.onthewayordersdetails, page: () => const OnTheWayOrdersDetails()),
  GetPage(name: AppRoute.settings, page: () => const Settings()),

];