class Places {
  String? sId;
  String? name;
  String? type;
  String? city;
  String? area;
  List<String>? images;
  String? desc;
  int? budget;
  String? phone;
  int? capacity;
  int? iV;

  Places(
      {this.sId,
        this.name,
        this.type,
        this.city,
        this.area,
        this.images,
        this.desc,
        this.budget,
        this.phone,
        this.capacity,
        this.iV});

  Places.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    type = json['type'];
    city = json['city'];
    area = json['area'];
    images = json['images'].cast<String>();
    desc = json['desc'];
    budget = json['budget'];
    phone = json['phone'];
    capacity = json['capacity'];
    iV = json['__v'];
  }


}