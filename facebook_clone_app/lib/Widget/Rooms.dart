// import 'package:facebook_clone_app/Config_colors.dart/Color.dart';
// import 'package:facebook_clone_app/Model/Model.dart';
// import 'package:facebook_clone_app/Widget/Profile_avatar.dart';
// import 'package:facebook_clone_app/data/data.dart';
// import 'package:flutter/material.dart';

// class Rooms extends StatelessWidget {
//   final List<User> onlineUsers;

//   const Rooms({
//     required Key key,
//     required this.onlineUsers,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final bool isDesktop = Responsive.isDesktop(context);
//     return Card(
//       margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
//       elevation: isDesktop ? 1.0 : 0.0,
//       shape: isDesktop
//           ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
//           : null,
//       child: Container(
//         height: 60.0,
//         color: Colors.white,
//         child: ListView.builder(
//           padding: const EdgeInsets.symmetric(
//             vertical: 10.0,
//             horizontal: 4.0,
//           ),
//           scrollDirection: Axis.horizontal,
//           itemCount: 1 + onlineUsers.length,
//           itemBuilder: (BuildContext context, int index) {
//             if (index == 0) {
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: _CreateRoomButton(),
//               );
//             }
//             final User user = onlineUsers[index - 1];
//             return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: ProfileAvatar(
//                 imageUrl: user.imageUrl,
//                 isActive: true, 
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class _CreateRoomButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return OutlineButton(
//       onPressed: () => print('Create Room'),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(30.0),
//       ),
//       color: Colors.white,
//       borderSide: BorderSide(
//         width: 3.0,
//         color: Colors.blueAccent,
//       ),
//       textColor: Appcolor.facebookBlue,
//       child: Row(
//         children: [
//           // ShaderMask(
//           //   shaderCallback: (rect) =>
//           //       Palette.createRoomGradient.createShader(rect),
//           //   child: Icon(
//           //     Icons.video_call,
//           //     size: 35.0,
//           //     color: Colors.white,
//           //   ),
//           // ),
//           Icon(
//             Icons.video_call,
//             size: 35.0,
//             color: Colors.purple,
//           ),
//           const SizedBox(width: 4.0),
//           Text('Create\nRoom'),
//         ],
//       ),
//     );
//   }
// }

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
//           return tablet ?? mobile;
//         } else {
//           return mobile;
//         }
//       },
//     );
//   }
// }
