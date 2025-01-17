
class ItemsModel {
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  var itemsCount;
  int? itemsActive;
  int? itemsquantityinbox;
  num? itemsPrice;
  num? itemspricrofbox;
  num? itemspricrofboxmerchant;
  num? itemspricrofboxmosque;
  num? itemsPriceMerchant;
  num? itemsPriceMosque;
  num? itemsDescount;
  num? itemsDescountMosque;
  num? itemsDescountMerchant;
  String? itemsDate;
  int? itemsCat;
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;
  int? favorite;
  ItemsModel(
      {this.itemsId,
        this.itemsName,
        this.itemsNameAr,
        this.itemsDesc,
        this.itemsDescAr,
        this.itemsImage,
        this.itemsCount,
        this.itemsActive,
        this.itemsquantityinbox,
        this.itemsPrice,
        this.itemspricrofbox,
        this.itemspricrofboxmerchant,
        this.itemspricrofboxmosque,
        this.itemsPriceMerchant,
        this.itemsPriceMosque,
        this.itemsDescount,
        this.itemsDescountMosque,
        this.itemsDescountMerchant,
        this.itemsDate,
        this.itemsCat,
        this.categoriesId,
        this.categoriesName,
        this.categoriesNameAr,
        this.categoriesImage,
        this.categoriesDatetime,
        this.favorite});

  ItemsModel.fromJson(Map<dynamic, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsquantityinbox = json['items_quantityinbox'];
    itemsPrice = json['items_price'];
    itemspricrofbox = json['items_pricrofbox'];
    itemspricrofboxmerchant = json['items_pricrofbox_merchant'];
    itemspricrofboxmosque = json['items_pricrofbox_mosque'];
    itemsPriceMerchant = json['items_price_merchant'];
    itemsPriceMosque = json['items_price_mosque'];
    itemsDescount = json['items_descount'];
    itemsDescountMosque = json['items_descount_mosque'];
    itemsDescountMerchant = json['items_descount_Merchant'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
    favorite = json['favorite'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_quantityinbox'] = itemsquantityinbox;
    data['items_price'] = this.itemsPrice;
    data['items_pricrofbox'] = itemspricrofbox;
    data['items_pricrofbox_merchant'] = itemspricrofboxmerchant;
    data['items_pricrofbox_mosque'] = itemspricrofboxmosque;
    data['items_price_merchant'] = this.itemsPriceMerchant;
    data['items_price_mosque'] = this.itemsPriceMosque;
    data['items_descount'] = this.itemsDescount;
    data['items_descount_mosque'] = this.itemsDescountMosque;
    data['items_descount_Merchant'] = this.itemsDescountMerchant;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_image'] = this.categoriesImage;
    data['categories_datetime'] = this.categoriesDatetime;
    return data;
  }
}