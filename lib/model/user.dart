class UserModel {
  String? name, email, photo, phone, country, governorate, area,uid;

  UserModel(
      {this.name,
      this.email,
      this.photo,
      this.phone,
      this.country,
      this.governorate,
      this.area,
      this.uid});

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'email': this.email,
      'photo': this.photo,
      'phone': this.phone,
      'country': this.country,
      'governorate': this.governorate,
      'area': this.area,
      'uid': this.uid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      photo: map['photo'] as String,
      phone: map['phone'] as String,
      country: map['country'] as String,
      governorate: map['governorate'] as String,
      area: map['area'] as String,
      uid: map['uid'] as String,
    );
  }
}
