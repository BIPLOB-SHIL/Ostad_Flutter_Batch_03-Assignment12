import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/network_response.dart';
import '../../data/models/task_list_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';
import '../utils/show_snackbar.dart';
import '../widgets/screen_background.dart';
import '../widgets/task_list_tile.dart';
import '../widgets/user_profile_banner.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  bool _getCompletedTaskInProgress = false;
  TaskListModel _taskListModel = TaskListModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getCompletedTask();
    });
  }

  Future<void> getCompletedTask() async{
    _getCompletedTaskInProgress  = true;
    if(mounted){
      setState(() {
      });
    }
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.completeTask);
    if(response.isSuccess){
      _taskListModel = TaskListModel.fromJson(response.body!);

    }else {
      if(mounted){
        showSnackBar("Completed task failed", context, Colors.red[500], false);
      }
    }
    _getCompletedTaskInProgress  = false;
    if(mounted){
      setState(() {
      });
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Column(
          children: [
            const UserProfileBanner(),
            Expanded(
              child: _getCompletedTaskInProgress
                  ? const Center(
                      child: CircularProgressIndicator(),
                  )
                  : ListView.builder(
                itemCount: _taskListModel.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return  TaskListTile(backgroundColor: Colors.teal,data: _taskListModel.data![index],);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
