import 'dart:convert';
class District {
  District({
    this.createdAt,
    this.deletedAt,
    this.id,
    this.name,
    this.provinceId,
    this.type,
    this.updatedAt,
  });

  String createdAt;
  String deletedAt;
  int id;
  String name;
  int provinceId;
  String type;
  String updatedAt;

  factory District.fromRawJson(String str) =>
      District.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory District.fromJson(Map<String, dynamic> json) => District(
        createdAt: json["created_at"],
        deletedAt: json["deleted_at"],
        id: json["id"],
        name: json["name"],
        provinceId: json["province_id"],
        type: json["type"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "deleted_at": deletedAt,
        "id": id,
        "name": name,
        "province_id": provinceId,
        "type": type,
        "updated_at": updatedAt,
      };
}

class Province {
  Province({
    this.createdAt,
    this.deletedAt,
    this.id,
    this.name,
    this.updatedAt,
    this.districtId,
  });

  String createdAt;
  String deletedAt;
  int id;
  String name;
  String updatedAt;
  int districtId;

  factory Province.fromRawJson(String str) =>
      Province.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Province.fromJson(Map<String, dynamic> json) => Province(
        createdAt: json["created_at"],
        deletedAt: json["deleted_at"],
        id: json["id"],
        name: json["name"],
        updatedAt: json["updated_at"],
        districtId: json["district_id"] == null ? null : json["district_id"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "deleted_at": deletedAt,
        "id": id,
        "name": name,
        "updated_at": updatedAt,
        "district_id": districtId == null ? null : districtId,
      };
}

class Village {
  Village({
    this.createdAt,
    this.deletedAt,
    this.id,
    this.name,
    this.postalCode,
    this.subdistrictId,
    this.updatedAt,
  });

  String createdAt;
  String deletedAt;
  int id;
  String name;
  String postalCode;
  int subdistrictId;
  String updatedAt;

  factory Village.fromRawJson(String str) => Village.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Village.fromJson(Map<String, dynamic> json) => Village(
        createdAt: json["created_at"],
        deletedAt: json["deleted_at"],
        id: json["id"],
        name: json["name"],
        postalCode: json["postal_code"],
        subdistrictId: json["subdistrict_id"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "deleted_at": deletedAt,
        "id": id,
        "name": name,
        "postal_code": postalCode,
        "subdistrict_id": subdistrictId,
        "updated_at": updatedAt,
      };
}

class SubDistrict {
  SubDistrict({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.districtId,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  int districtId;

  factory SubDistrict.fromRawJson(String str) =>
      SubDistrict.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubDistrict.fromJson(Map<String, dynamic> json) => SubDistrict(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
        districtId: json["district_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "name": name,
        "district_id": districtId,
      };
}