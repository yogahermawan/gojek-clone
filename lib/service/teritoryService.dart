import 'package:dio/dio.dart';
import 'package:portal_berita/service/api.dart';
import 'package:portal_berita/models/TeritoryModel.dart';

class GetUserService {
  static Future<Response> getUserInfo(token) async {
    Dio instance = API.instance();
    instance.options.headers['authorization'] = "Bearer $token";
    Response response = await instance.get("/auth/info");
    return response;
    // return Data.fromJson(jsonDecode(response.data));
  }

  static Future getKabupaten() async {
    Dio instance = API.instance();
    final response = await instance.get("/sub-districts?district_id=479");
    List<SubDistrict> listData = List<SubDistrict>();
    response.data['data'].forEach((data) {
      SubDistrict sub = SubDistrict.fromJson(data);
      listData.add(sub);
    });
    return listData;
  }

  static Future getKecamatan(id) async {
    Dio instance = API.instance();
    final response = await instance.get("/villages?sub_district_id=$id");
    List<Village> listData = List<Village>();
    response.data['data'].forEach((data) {
      Village sub = Village.fromJson(data);
      listData.add(sub);
    });
    return listData;
    // setState(() {
    //   _dataDesa = listData;
    // });
  }
}