import 'package:stream_up_live/presentation/CreatePassword/create_password_screen.dart';
import 'package:stream_up_live/presentation/Follow/followers_screen.dart';
import 'package:stream_up_live/presentation/Follow/following_screen.dart';
import 'package:stream_up_live/presentation/ForgetPassword/forget_password_screen.dart';
import 'package:stream_up_live/presentation/Home/home_screen.dart';
import 'package:stream_up_live/presentation/Otp/verified_code_screen.dart';
import 'package:stream_up_live/presentation/RecomendedTalents/recomended_talents_screen.dart';
import 'package:stream_up_live/presentation/Setting/connect_with_us_screen.dart';
import 'package:stream_up_live/presentation/Setting/language_screen.dart';
import 'package:stream_up_live/presentation/createstory/audio_live_screen.dart';
import 'package:stream_up_live/presentation/createstory/create_a_story.dart';
import 'package:stream_up_live/presentation/createstory/create_post_screen.dart';
import 'package:stream_up_live/presentation/createstory/creative_live_screen.dart';
import 'package:stream_up_live/presentation/login/login_screen.dart';
import 'package:stream_up_live/presentation/profile/earning_screen.dart';
import 'package:stream_up_live/presentation/profile/edit_profile_screen.dart';
import 'package:stream_up_live/presentation/profile/help_screen.dart';
import 'package:stream_up_live/presentation/profile/my_badge_screen.dart';
import 'package:stream_up_live/presentation/profile/my_bag_screen.dart';
import 'package:stream_up_live/presentation/profile/my_invites_screen.dart';
import 'package:stream_up_live/presentation/profile/my_level.dart';
import 'package:stream_up_live/presentation/profile/my_tasks_screen.dart';
import 'package:stream_up_live/presentation/profile/public_profile_screen.dart';
import 'package:stream_up_live/presentation/profile/setting_screen.dart';
import 'package:stream_up_live/presentation/profile/store_screen.dart';
import 'package:stream_up_live/presentation/profile/top_up_screen.dart';
import 'package:stream_up_live/presentation/profile/vip_scren.dart';
import 'package:stream_up_live/presentation/signup/signup_screen.dart';
import 'package:stream_up_live/presentation/signup/signup_with_email_screen.dart';
import 'package:stream_up_live/presentation/signup/signup_with_phone_number_screen.dart';
import 'package:stream_up_live/presentation/stories/create_post_screen.dart';
import 'package:stream_up_live/presentation/stories/create_story_screen.dart';
import 'package:stream_up_live/presentation/stories/open_story_screen.dart';
import 'package:stream_up_live/presentation/stories/stories_screen.dart';
import 'package:stream_up_live/presentation/welathClass/wealth_class_screen.dart';
import '../../data/Live_Streaming/live_streaming.dart';
import '../../widgets/gameWidget.dart';
import '../Setting/blocked_list_screen.dart';
import '../Setting/faqs_screen.dart';
import '../Setting/inbox_screen.dart';
import '../Setting/privacy_screen.dart';
import '../Setting/room_effects_screen.dart';
import '../Setting/security_screen.dart';
import '../profile/leader_boardpage.dart';
import '../profile/live_data.dart';
import '../live_audio_room/audio_live_users_screen.dart';
import '../live_audio_room/live_people_screen.dart';
import '../live_audio_room/live_screen.dart';
import '../splash/splash_screen.dart';
import 'package:flutter/material.dart';
import '../login/login_with_social_media_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String mainRoute = "/main";
  static const String loginRoute = "/login";
  static const String SignUpRoute = "/signup";
  static const String forgetPasswordRoute = "/forgetPasswordScreen";
  // static const String PkViewRoute = "/pkView";
  static const String homeViewRoute = "/HomeView";
  // static const String topUserviewRoute = "/topUserview";
  // static const String topTalentviewRoute = "/TopTalentview";
  // static const String newStartviewRoute = "/NewStartview";
  static const String liveViewRoute = "/liveView";
  static const String GamePageRoute = '/GamePage'; // Define the route for GamePage

  // static const String recordsViewRoute = "/recordsView";
  static const String peopleLiveRoute = "/PeopleLive";
  static const String verifiedCodeRoute = "/verifiedCode";
  // static const String messageListRoute = "/messageListview";
  static const String createpasswordRoute = "/createpassword";
  // static const String luckeyPaisaViewRoute = "/LuckeyPaisaView";
  static const String signUpWithEmailRoute = "/signUpWithEmail";
  // static const String completeProfileRoute = "/completeProfile";
  static const String CreateAStoryRoute = "/CreateAStory";
  static const String TopUpViewPageRoute = "/TopUpViewPage";
  static const String EarningViewPageRoute = "/EarningViewPage";
  static const String MyLevelPageRoute = "/MylevelPage";
  static const String FollowerViewRoute = "/FollowerViewPage";
  static const String FollowingViewRoute = "/FollowingViewPage";
  static const String OpenStoryViewRoute = "/OpenStoryView";
  static const String storeViewPageRoute = "/storeViewPage";
  static const String MyBadgeViewRoute = "/MyBadgeViewPage";
  static const String StoriesViewPageRoute = "/StoriesViewPage";
  static const String AudioLiveViewRoute = "/AudioLiveView";
  static const String CreateLiveStoryRoute = "/CreateLiveStory";
  static const String CreatePostViewRoute = "/CreatePostView";
  static const String signUpWithNumberRoute = "/signUpWithNumber";
  static const String PublicProfilePageRoute = "/PublicProfilePage";
  static const String HelpSupportViewRoute = "/HelpSupportViewPage";
  static const String AudioLiveUsersViewRoute = "/AudioLiveUsersView";
  static const String MyInvitesViewRoute = "/MyInvitesViewPage";
  static const String SettingViewRoute = "/SettingViewPage";
  static const String MyBagViewRoute = "/MyBagViewPage";
  static const String VipViewRoute = "/VipViewPage";
  static const String EditProfileViewRoute = "/EditProfileView";
  static const String MyTasksViewRoute = "/MyTasksViewPage";
  static const String recomendedTalentViewRoute = "/RecomendedTalentView";
  static const String loginWithSocialMediaRoute = "/loginWithSocialMedia";
  static const String createPostPage = "/createPostPage";
  static const String createStoryPage = "/createStoryPage";
  static const String WealthClassViewRoute = "/WealthClassView";
  static const String LiveDataViewRoute = "/LiveDataScreen";
  static const String LeaderboardViewRoute = "/LeaderboardPage";
  static const String PrivacyViewRoute = "/PrivacyScreen";
  static const String BlockedListScreenViewRoute = "/BlockedListScreen";
  static const String InboxScreenVieRoute = "/InboxScreen";
  static const String RoomEffectsScreenViewRoute = "/RoomEffectsScreen";
  static const String SecurityScreenViewRoute = "/SecurityScreen";
  static const String LanguageScreenViewRoute = "/LanguageScreen";
  static const String ConnectWithUsScreenViewRoute = "/ConnectWithUsScreen";
  static const String FAQsScreenViewRoute = "/FAQsScreen";
  static const String LiveStreamingBasePage = "/LiveStreamingBasePage";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    // Retrieve the arguments
    Map<String, dynamic>? arguments = routeSettings.arguments as Map<String, dynamic>?;
    print('======routes---${arguments}');

    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.SignUpRoute:
        return MaterialPageRoute(builder: (_) => SignUpView());
      case Routes.loginWithSocialMediaRoute:
        return MaterialPageRoute(builder: (_) => LoginWithSocialMediaView());
      case Routes.signUpWithNumberRoute:
        return MaterialPageRoute(builder: (_) => SignUpWithNumberView());
      case Routes.signUpWithEmailRoute:
        return MaterialPageRoute(builder: (_) => SignUpWithEmailView());
      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());
      case Routes.PublicProfilePageRoute:
        return MaterialPageRoute(builder: (_) => PublicProfilePage());
      case Routes.createPostPage:
        return MaterialPageRoute(builder: (_) => CreatePostPage());
      case Routes.createStoryPage:
        return MaterialPageRoute(builder: (_) => CreateStoryPage());
      // case Routes.topUserviewRoute:
      //   return MaterialPageRoute(builder: (_) => TopUserview());
      // case Routes.topTalentviewRoute:
      //   return MaterialPageRoute(builder: (_) => TopTalentview());
      // case Routes.newStartviewRoute:
      //   return MaterialPageRoute(builder: (_) => NewStartview());
      case Routes.verifiedCodeRoute:
        return MaterialPageRoute(builder: (_) => OtpVerificationView());
      case Routes.createpasswordRoute:
        return MaterialPageRoute(builder: (_) => CreatePasswordView());
      // case Routes.completeProfileRoute:
      //   return MaterialPageRoute(builder: (_) => CompleteProfileView());
      case Routes.homeViewRoute:
        return MaterialPageRoute(builder: (_) => HomeView());
      case Routes.recomendedTalentViewRoute:
        return MaterialPageRoute(builder: (_) => RecomendedTalentView());
      // case Routes.messageListRoute:
      //   return MaterialPageRoute(builder: (_) => InnerChat());
      // case Routes.luckeyPaisaViewRoute:
      //   return MaterialPageRoute(builder: (_) => LuckeyPaisaView());
      // case Routes.PkViewRoute:
      //   return MaterialPageRoute(builder: (_) => PkView());
      case Routes.liveViewRoute:
        return MaterialPageRoute(builder: (_) => LiveView());
      case Routes.MyBadgeViewRoute:
        return MaterialPageRoute(builder: (_) => MyBadgeViewPage());
      case Routes.peopleLiveRoute:
        return MaterialPageRoute(builder: (_) => PeopleLive());
      case Routes.CreateAStoryRoute:
        return MaterialPageRoute(builder: (_) => CreateAStory());
      case Routes.CreatePostViewRoute:
        return MaterialPageRoute(builder: (_) => CreatePostView());
      case Routes.CreateLiveStoryRoute:
        return MaterialPageRoute(builder: (_) => CreateLiveStory());
      case Routes.AudioLiveViewRoute:
        return MaterialPageRoute(builder: (_) => AudioLiveView());
      case Routes.AudioLiveUsersViewRoute:
        return MaterialPageRoute(builder: (_) =>
            AudioLiveUsersView(roomID: arguments?['roomId'],
              isHost: arguments?['isHost'],));
      case Routes.StoriesViewPageRoute:
        return MaterialPageRoute(builder: (_) => StoriesViewPage());
      case Routes.OpenStoryViewRoute:
        return MaterialPageRoute(builder: (_) => OpenStoryView());
      case Routes.FollowingViewRoute:
        return MaterialPageRoute(builder: (_) => FollowingViewPage());
      case Routes.FollowerViewRoute:
        return MaterialPageRoute(builder: (_) => FollowerViewPage());
      case Routes.TopUpViewPageRoute:
        return MaterialPageRoute(builder: (_) => TopUpViewPage());
      case Routes.EarningViewPageRoute:
        return MaterialPageRoute(builder: (_) => EarningViewPage());
      case Routes.storeViewPageRoute:
        return MaterialPageRoute(builder: (_) => StoreViewPage());
      case Routes.HelpSupportViewRoute:
        return MaterialPageRoute(builder: (_) => HelpSupportViewPage());
      case Routes.MyInvitesViewRoute:
        return MaterialPageRoute(builder: (_) => MyInvitesViewPage());
      case Routes.SettingViewRoute:
        return MaterialPageRoute(builder: (_) => SettingViewPage());
      case Routes.MyBagViewRoute:
        return MaterialPageRoute(builder: (_) => MyBagViewPage());
      case Routes.MyTasksViewRoute:
        return MaterialPageRoute(builder: (_) => MyTasksViewPage());
      case Routes.VipViewRoute:
        return MaterialPageRoute(builder: (_) => VipViewPage());
      case Routes.EditProfileViewRoute:
        return MaterialPageRoute(builder: (_) => EditProfileView());
      case Routes.WealthClassViewRoute:
        return MaterialPageRoute(builder: (_) => WealthClassView());
      case Routes.PrivacyViewRoute:
        return MaterialPageRoute(builder: (_) => PrivacyScreen());
      case Routes.BlockedListScreenViewRoute:
        return MaterialPageRoute(builder: (_) => BlockedListScreen());
      case Routes.InboxScreenVieRoute:
        return MaterialPageRoute(builder: (_) => InboxScreen());
      case Routes.RoomEffectsScreenViewRoute:
        return MaterialPageRoute(builder: (_) => RoomEffectsScreen());
      case Routes.SecurityScreenViewRoute:
        return MaterialPageRoute(builder: (_) => SecurityScreen());
      case Routes.LanguageScreenViewRoute:
        return MaterialPageRoute(builder: (_) => LanguageScreen());
      case Routes.ConnectWithUsScreenViewRoute:
        return MaterialPageRoute(builder: (_) => ConnectWithUsScreen());
      case Routes.FAQsScreenViewRoute:
        return MaterialPageRoute(builder: (_) => FAQsScreen());
      case Routes.LiveDataViewRoute:
        return MaterialPageRoute(builder: (_) => LiveDataScreen());
      case Routes.LeaderboardViewRoute:
        return MaterialPageRoute(builder: (_) => LeaderboardPage());
      case Routes.MyLevelPageRoute:
        return MaterialPageRoute(builder: (_) => MylevelPage());
      case Routes.GamePageRoute:
        return MaterialPageRoute(builder: (_) => GamePage());
      case Routes.LiveStreamingBasePage:
        return MaterialPageRoute(
          builder: (_) => LiveStreamingBasePage(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(title: Text("No Route Found")),
              body: Center(child: Text("No Route Found")),
            ));
  }
}
