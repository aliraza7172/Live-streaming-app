import 'package:get/get.dart';
import 'package:stream_up_live/data/model/body/stories_model.dart';
import 'package:stream_up_live/database/loacal_db.dart';

class StoryViewController extends GetxController{
  StoriesModel storiesModel=StoriesModel();
  List<StoryData>? viewStories=[];
  // final sampleUsers = [
  //   UserModel(
  //     [
  //       StoryModel(
  //         // ImageAssets.createAstorybgImage,
  //         //  "https://images.unsplash.com/photo-1601758228041-f3b2795255f1?ixid=MXwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxN3x8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
  //       ),
  //       StoryModel(
  //         ImageAssets.streamUser1Image,
  //         // "https://images.unsplash.com/photo-1609418426663-8b5c127691f9?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNXx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
  //       ),
  //       StoryModel(
  //         ImageAssets.streamUser2Image,
  //         // "https://images.unsplash.com/photo-1609444074870-2860a9a613e3?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1Nnx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
  //       ),
  //       StoryModel(
  //         ImageAssets.streamUser3Image,
  //         // "https://images.unsplash.com/photo-1609504373567-acda19c93dc4?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1MHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
  //       ),
  //     ],
  //     "User1",
  //     ImageAssets.streamUser4Image,
  //     //"https://images.unsplash.com/photo-1609262772830-0decc49ec18c?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzMDF8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
  //   ),
  //   UserModel(
  //     [
  //       StoryModel(
  //         ImageAssets.streamUser5Image,
  //         // "https://images.unsplash.com/photo-1609439547168-c973842210e1?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4Nnx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
  //       ),
  //     ],
  //     "User2",
  //     ImageAssets.streamUser6Image,
  //     //"https://images.unsplash.com/photo-1601758125946-6ec2ef64daf8?ixid=MXwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwzMjN8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
  //   ),
  //   UserModel(
  //     [
  //       StoryModel(
  //         ImageAssets.streamUser7Image,
  //         //"https://images.unsplash.com/photo-1609421139394-8def18a165df?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMDl8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
  //       ),
  //       StoryModel(
  //         ImageAssets.streamUser8Image,
  //         //"https://images.unsplash.com/photo-1609377375732-7abb74e435d9?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxODJ8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
  //       ),
  //       StoryModel(
  //         ImageAssets.streamUser9Image,
  //         // "https://images.unsplash.com/photo-1560925978-3169a42619b2?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMjF8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
  //       ),
  //     ],
  //     "User3",
  //     ImageAssets.streamUser10Image,
  //     //"https://images.unsplash.com/photo-1609127102567-8a9a21dc27d8?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzOTh8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
  //   ),
  // ];
  @override
  Future<void> onInit() async {
    // storiesModel= await DBManager().fetchStories();
    // for(int i=1; i<storiesModel.data!.length;i++){
    //   viewStories?.add(storiesModel.data![i]);
    // }
    // update();
    // TODO: implement onInit
    super.onInit();
  }
  void setData( List<StoryData>? getStories){
    viewStories=getStories;
    print("=======viewStories:${viewStories?.length}=========");
    update();
  }
}
class UserModel {
  UserModel(this.stories, this.userName, this.imageUrl);
  final List<String> stories;
  final String userName;
  final String imageUrl;
}

class StoryModel {
  StoryModel(this.imageUrl);

  final String imageUrl;
}