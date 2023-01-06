


import 'package:datas/model/drop_down.dart';
import 'package:datas/model/job_list_model.dart';
import 'package:datas/services/job_services.dart';
import 'package:get/get.dart';

class JobListController extends GetxController{

RxList<JoblistModel> jobModelData = <JoblistModel>[].obs;
List<DropDownModel> dropDownData = [];
List<DropDownModel> searchList = []; 
bool isLoginVisible = false; 

void getAllJobs()async{
final data = await JobServices().getAllJobSFromApi();
jobModelData.value = data!;
} 

void getAllPlaces()async{
final data = await DropDownService().getAllJobSFromApi();

dropDownData = data!; 
}


void isLoginVisibleFunction(){

  isLoginVisible = !isLoginVisible;
  update(); 
}


void searchFunction(String value){

  if(value.length == 0){

    searchList = dropDownData; 
  }else{

searchList = dropDownData
        .where((element) => element.place!.toLowerCase()
        
            .contains(value.toLowerCase())) 
        .toList();  
  }


 update(); 

}

@override
  void onInit() {  
 getAllJobs(); 
 getAllPlaces(); 
    super.onInit();
  }

}