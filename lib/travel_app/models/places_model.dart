class PlacesModel {
  String  name, detail, img;
  int id, price;

  PlacesModel({
    required this.id,
    required this.name,
    required this.detail,
    required this.price,
    required this.img,
  });

  factory PlacesModel.fromJson(Map<String, dynamic> json) {
    return PlacesModel(
        id: json["id"],
        name: json["title"],
        detail: json["thumbnailUrl"],
        price: json["albumId"],
        img: json["url"]);
  }
}
