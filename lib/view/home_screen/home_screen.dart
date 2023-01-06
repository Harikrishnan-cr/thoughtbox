import 'dart:developer';

import 'package:datas/controller/job_list_controller/job_list_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final jobDatas = Get.put(JobListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(155, 166, 210, 246),
        elevation: 0,
        title: Column(
          children: [
            const Text(
              'Job List',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Padding(
                padding: EdgeInsets.only(left: 290),
                child: GetBuilder<JobListController>(builder: (jobController) {
                  return GestureDetector(
                    onTap: () {
                      jobController.isLoginVisibleFunction();
                    },
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                      size: 40,
                    ),
                  );
                }),
              ),
            )
          ],
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Obx(() {
            return jobDatas.jobModelData.isNotEmpty
                ? ListView.builder(
                    itemCount: jobDatas.jobModelData.length,
                    itemBuilder: (context, index) {
                      final jobDetails = jobDatas.jobModelData;
                      log('${jobDetails[index].image} $index');
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: const Color.fromARGB(255, 158, 212, 255),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ListTile(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(jobDetails[index].position.toString()),
                                    Text(jobDetails[index].company.toString()),
                                  ],
                                ),
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(jobDetails[
                                              index]
                                          .image ??
                                      'https://t4.ftcdn.net/jpg/04/70/29/97/360_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg'),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      jobDetails[index].location.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(jobDetails[index]
                                        .skillsRequired
                                        .toString()),
                                  ],
                                ),
                              ),
                              Text(jobDetails[index].date.toString())
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          }),
          DropDownWidget(),
        ],
      ),
    );
  }
}


// Container(
//                         width: double.infinity,
//                         height: 50,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                           color: Colors.green,
//                         ),
//                         child: Row(
//                           children: const[
//                             SizedBox(
//                               width: 15,
//                             ),
//                             Icon(
//                               Icons.search,
//                               color: Colors.white,
//                             ),
//                             SizedBox(
//                               width: 25,
//                             ),
//                             Text(
//                               'Search Job Locations',
//                               style: TextStyle(color: Colors.white),
//                             )
//                           ],
//                         ),
//                       )

class DropDownWidget extends StatelessWidget {
   DropDownWidget({
    Key? key,
  }) : super(key: key);
final searchController = TextEditingController(); 
  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobListController>(builder: (jobControler) {
      return jobControler.isLoginVisible == true
          ? Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.purple),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: searchController,
                        onChanged: (value) { 
                          jobControler.searchFunction(value); 
                        },
                        decoration: InputDecoration(
                        hintText: 'Search Job Locations',
                          border: OutlineInputBorder()
                        ),
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                      itemCount: jobControler.searchList.length, 
                      itemBuilder: (context, index) { 
                        final dropData = jobControler.searchList;
                        return ListTile(
                          title: Text(dropData[index].place.toString() ),
                        );
                      },
                    ))
                  ],
                ),
              ),
            )
          : SizedBox();
    });
  }
}
