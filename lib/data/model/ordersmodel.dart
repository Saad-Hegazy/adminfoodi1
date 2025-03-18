class OrdersModel {
  int? ordersId;
  int? ordersUsersid;
  String? ordersUserstype;
  int? ordersAddressId;
  int? ordersType;
  int? ordersPricedelivery;
  num? ordersPrice;
  num? ordersTotalprice;
  int? ordersCouponId;
  int? ordersRating;
  String? ordersNoterating;
  int? ordersPaymentmethod;
  int? ordersStatus;
  String? ordersDoneImage;
  int? ordersDelivery;
  String? ordersDatetime;
  num? ordersAddressLat;
  num? ordersAddressLong;
  int? addressId;
  int? addressUsersid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  num? addressLat;
  num? addressLong;

  OrdersModel(
      {this.ordersId,
        this.ordersUsersid,
        this.ordersUserstype,
        this.ordersAddressId,
        this.ordersType,
        this.ordersPricedelivery,
        this.ordersPrice,
        this.ordersTotalprice,
        this.ordersCouponId,
        this.ordersRating,
        this.ordersNoterating,
        this.ordersPaymentmethod,
        this.ordersStatus,
        this.ordersDoneImage,
        this.ordersDelivery,
        this.ordersDatetime,
        this.ordersAddressLat,
        this.ordersAddressLong,
        this.addressId,
        this.addressUsersid,
        this.addressName,
        this.addressCity,
        this.addressStreet,
        this.addressLat,
        this.addressLong});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersUserstype = json['orders_userstype'];
    ordersAddressId = json['orders_address_id'];
    ordersType = json['orders_type'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersPrice = json['orders_price'];
    ordersTotalprice = json['orders_totalprice'];
    ordersCouponId = json['orders_coupon_id'];
    ordersRating = json['orders_rating'];
    ordersNoterating = json['orders_noterating'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersStatus = json['orders_status'];
    ordersDoneImage = json['orders_done_image'];
    ordersDelivery = json['orders_delivery'];
    ordersDatetime = json['orders_datetime'];
    ordersAddressLat = json['orders_address_lat'];
    ordersAddressLong = json['orders_address_long'];
    addressId = json['address_id'];
    addressUsersid = json['address_usersid'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_usersid'] = this.ordersUsersid;
    data['orders_userstype'] = this.ordersUserstype;
    data['orders_address_id'] = this.ordersAddressId;
    data['orders_type'] = this.ordersType;
    data['orders_pricedelivery'] = this.ordersPricedelivery;
    data['orders_price'] = this.ordersPrice;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_coupon_id'] = this.ordersCouponId;
    data['orders_rating'] = this.ordersRating;
    data['orders_noterating'] = this.ordersNoterating;
    data['orders_paymentmethod'] = this.ordersPaymentmethod;
    data['orders_status'] = this.ordersStatus;
    data['orders_done_image'] = this.ordersDoneImage;
    data['orders_delivery'] = this.ordersDelivery;
    data['orders_datetime'] = this.ordersDatetime;
    data['orders_address_lat'] = this.ordersAddressLat;
    data['orders_address_long'] = this.ordersAddressLong;
    data['address_id'] = this.addressId;
    data['address_usersid'] = this.addressUsersid;
    data['address_name'] = this.addressName;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    return data;
  }
}
