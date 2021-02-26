import 'package:flutter/material.dart';
import 'package:portal_berita/beranda/beranda_gojek_appbar.dart';
import 'package:portal_berita/models/TeritoryModel.dart';
import 'package:dio/dio.dart';
import 'package:portal_berita/service/api.dart';

class PesananPage extends StatefulWidget {
  @override
  _PesananPageState createState() => _PesananPageState();
}

class _PesananPageState extends State<PesananPage> {

  void initState() {
    // super.initState();
    getProvince();
  }

  int _province, _kabupaten, _kecamatan, _desa;

  List<Province> _dataProvince = List(); //subdistrict
  List<District> _dataKabupaten = List(); //subdistrict
  List<SubDistrict> _dataKecamatan = List(); //subdistrict
  List<Village> _dataDesa = List(); // village

  getProvince() async {
    try {
    Dio instance = API.instance();
    final response = await instance.get("/provinces");
    // print(response);
    // print(response);
    List<Province> listProvince = List<Province>();
    response.data['data'].forEach((data) {
      Province sub = Province.fromJson(data);
      listProvince.add(sub);
    });
    setState(() {
      _dataProvince = listProvince;
    });
    } catch(e) {
      print(e);
    }
  }

  void getKabupaten(id) async {
    Dio instance = API.instance();
    final response = await Dio().get("http://178.128.20.172:7328/districts?province_id=$id");
    // final response = await instance.get("/villages?sub_district_id=$id");
    List<District> listData = List<District>();
    response.data['data'].forEach((data) {
      District sub = District.fromJson(data);
      listData.add(sub);
    });
    setState(() {
      _dataKabupaten = listData;
    });
  }

  void getKecamatan(id) async {
    Dio instance = API.instance();
    final response = await Dio().get("http://178.128.20.172:7328/sub-districts?district_id=$id");
    // final response = await instance.get("/villages?sub_district_id=$id");
    List<SubDistrict> listData = List<SubDistrict>();
    response.data['data'].forEach((data) {
      SubDistrict sub = SubDistrict.fromJson(data);
      listData.add(sub);
    });
    setState(() {
      _dataKecamatan = listData;
    });
  }

  void getDesa(id) async {
    Dio instance = API.instance();
    final response = await Dio().get("http://178.128.20.172:7328/villages?sub_district_id=$id");
    // final response = await instance.get("/villages?sub_district_id=$id");
    List<SubDistrict> listData = List<SubDistrict>();
    response.data['data'].forEach((data) {
      SubDistrict sub = SubDistrict.fromJson(data);
      listData.add(sub);
    });
    setState(() {
      _dataKecamatan = listData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
        child: Scaffold(
            appBar: new GojekAppBar(),
            body: Container(
                child: Column(children: [
              Text("Provinsi"),
              DropdownButton(
                hint: Text("Pilih Provinsi"),
                value: _province,
                items: _dataProvince.map((item) {
                  return DropdownMenuItem(
                    child: Text(item.name),
                    value: item.id,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _province = value;
                    // _valCity = null;
                  });
                  getKabupaten(value);
                },
              ),
              Text("Kabupaten"),
              DropdownButton(
                hint: Text("Pilih Kabupaten"),
                value: _kabupaten,
                items: _dataKabupaten.map((item) {
                  return DropdownMenuItem(
                    child: Text(item.name),
                    value: item.id,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _kabupaten = value;
                    // _valCity = null;
                  });
                  getKecamatan(value);
                },
              ),
              Text("Kecamatan"),
              DropdownButton(
                hint: Text("Pilih Kecamatan"),
                value: _kecamatan,
                items: _dataKecamatan.map((item) {
                  return DropdownMenuItem(
                    child: Text(item.name),
                    value: item.id,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _kecamatan = value;
                    // _valCity = null;
                  });
                  getDesa(value);
                },
              ),
              Text("Kelurahan"),
              DropdownButton(
                hint: Text("Pilih Kelurahan"),
                value: _desa,
                items: _dataDesa.map((item) {
                  return DropdownMenuItem(
                    child: Text("${item.name}"),
                    value: item.id,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _desa = value;
                  });
                },
              ),
              RaisedButton(
                padding: const EdgeInsets.all(10.0),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
                  // _updateProfile();
                },
                child: new Text("Perbarui Profile"),
              ),
            ]))));
  }
}
