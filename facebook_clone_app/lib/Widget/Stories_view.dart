import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone_app/Config_colors.dart/Color.dart';
import 'package:facebook_clone_app/Model/Model.dart';
import 'package:facebook_clone_app/Widget/Profile_avatar.dart';
import 'package:facebook_clone_app/data/data.dart';
import 'package:flutter/material.dart';

class Storire_Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      // color: Colors.red,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories.length,
        itemBuilder: (BuildContext context, int index) {
          final Story story = stories[0];
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: _StoryCard(
                  isAddStory: true, currentUser: currentUser, story: story),
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: _StoryCard(
                isAddStory: false,
                currentUser: onlineUsers[index - 1],
                story: stories[index - 1]),
          );
        },
      ),
    );
  }
}

// story card
class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User? currentUser;
  final Story? story;

  const _StoryCard({
    required this.isAddStory,
    required this.currentUser,
    required this.story,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: isAddStory ? currentUser!.imageUrl : story!.imageUrl,
            height: double.infinity,
            width: 110.0,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
            gradient: Appcolor.storyGradient,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        Positioned(
          top: 8.0,
          left: 8.0,
          child: isAddStory
              ? Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.add),
                    iconSize: 30.0,
                    color: Appcolor.facebookBlue,
                    onPressed: () => print('Add to Story'),
                  ),
                )
              : ProfileAvatar(
                  imageUrl: story!.user.imageUrl,
                  hasBorder: story!.isViewed,
                  currentUser: currentUser!,
                ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          right: 8.0,
          child: Text(
            isAddStory ? 'Add to Story' : story!.user.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

// Responsive swap mobile, tablet, desktop
// class Responsive extends StatelessWidget {
//   final Widget mobile;
//   final Widget tablet;
//   final Widget desktop;

//   const Responsive({
//     required Key key,
//     required this.mobile,
//     required this.tablet,
//     required this.desktop,
//   }) : super(key: key);

//   static bool isMobile(BuildContext context) =>
//       MediaQuery.of(context).size.width < 800;

//   static bool isTablet(BuildContext context) =>
//       MediaQuery.of(context).size.width >= 800 &&
//       MediaQuery.of(context).size.width < 1200;

//   static bool isDesktop(BuildContext context) =>
//       MediaQuery.of(context).size.width >= 1200;

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         if (constraints.maxWidth >= 1200) {
//           return desktop;
//         } else if (constraints.maxWidth >= 800) {
//           return tablet;
//         } else {
//           return mobile;
//         }
//       },
//     );
//   }
// }