import 'package:flutter/material.dart';
import 'package:sample_vid/views/dashboard/screens/dashboard.dart';
import 'package:sample_vid/views/dashboard/video_player.dart';
import 'package:sample_vid/views/screens/login.dart';
import 'package:sample_vid/views/screens/otp_view.dart';
import 'package:sample_vid/views/screens/profile.dart';

Map<String, WidgetBuilder> appRoutes() => {
      LoginView.route: (_) => const LoginView(),
      VideoPlayerView.route: (_) => const VideoPlayerView(),
      // OtpView.route: (_) => const OtpView(),
      Dashboard.route: (_) => Dashboard(),
      // ProfileView.route: (_) => ProfileView(),
    };

RouteFactory onAppGenerateRoute() => (settings) {
      if (settings.name == OtpView.route) {
        final arg = settings.arguments! as OtpView;
        return MaterialPageRoute(builder: (context) {
          return OtpView(
            phone: arg.phone,
            code_digit: arg.code_digit,
          );
        });
      }

      if (settings.name == ProfileView.route) {
        final arg = settings.arguments! as ProfileView;
        return MaterialPageRoute(builder: (context) {
          return ProfileView(
            em: arg.em,
            pass: arg.pass,
            mob: arg.mob,
            dob: arg.mob,
          );
        });
      }
    };
