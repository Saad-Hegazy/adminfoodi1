class AppLink {
  static  const String server = "https://endpoin.shop/ecommerce/admin";
  static  const String serverMain = "https://endpoin.shop/ecommerce";
  static  const String test = "$server/test.php";
  static  const String imageststatic = "$serverMain/upload";
//========================== Image ============================
  static const String imagestCategories = "$imageststatic/categories";
  static const String imagestItems = "$imageststatic/items";
  static const String imagestOrders = "$imageststatic/orders";
// =============================================================
  static const String notification = "$serverMain/notification.php";
// ================================= Auth ========================== //
  static const String login = "$server/auth/login.php";
  static const String verifycodessignup = "$server/auth/verfiycode.php";
  static const String resend = "$server/auth/resend.php";
// ================================= ForgetPassword ========================== //
  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword = "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword = "$server/forgetpassword/verifycode.php";
// ================================= Home ========================== //
  static const String homepage = "$serverMain/home.php";

// ================================= Orders ========================== //
  static const String approveOrders  = "$server/orders/approve.php";
  static const String OntheWayOrders  = "$server/orders/ordersontheway.php";
  static const String deliverydetails  = "$server/orders/deliverydetails.php";
  static const String prepareOrders  = "$server/orders/prepare.php";
  static const String viewpendingOrders   = "$server/orders/viewpending.php";
  static const String viweacceptedOrders  = "$server/orders/viweaccepted.php";

  static const String detailsOrders  = "$server/orders/details.php";

  static const String startDliveredOrders  = "$server/orders/prepare.php";

  static const String customerdetails  = "$serverMain/orders/customerdetails.php";

// ================================= Categoties ========================== //
  static const String cegoriesview = "$server/categories/view.php";
  static const String cegoriesadd = "$server/categories/add.php";
  static const String cegoriesedit = "$server/categories/edit.php";
  static const String cegoriesdelete = "$server/categories/delete.php";


// ================================= Items ========================== //
  static const String itemsview = "$server/items/view.php";
  static const String itemsadd = "$server/items/add.php";
  static const String itemsedit = "$server/items/edit.php";
  static const String itemsdelete = "$server/items/delete.php";
// ================================= Users ========================== //
  static const String viewadmin = "$server/users/viewadmin.php";
  static const String viewdelivery = "$server/users/viewdelivery.php";
  static const String addDelivery = "$server/users/adddelivery.php";
  static const String addAdmin = "$server/users/addadmin.php";
  static const String deleteDelivery = "$server/users/deletedelivery.php";
  static const String deleteadmin = "$server/users/deleteadmin.php";


}