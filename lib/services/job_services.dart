import 'package:datas/model/drop_down.dart';
import 'package:datas/model/job_list_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

const uriJobs = 'https://retoolapi.dev/CIuwqM/jobs';
const uriDropDown = 'https://retoolapi.dev/E0UTAw/data';

class JobServices {
  Future<List<JoblistModel>?> getAllJobSFromApi() async {
    final responce = await http.get(Uri.parse(uriJobs));

    try {
      if (responce.statusCode == 200) {
        final data = joblistModelFromJson(responce.body);

        return data;
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
    return null;
  }
}

class DropDownService {
  Future<List<DropDownModel>?> getAllJobSFromApi() async {
    final responce = await http.get(Uri.parse(uriDropDown));

    try {
      if (responce.statusCode == 200) {
        final data = dropDownModelFromJson(responce.body);

        return data;
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
    return null;
  }
}
