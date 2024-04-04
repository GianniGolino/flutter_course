// import 'package:flutter/material.dart';
// //import 'package:gap/gap.dart';

// class AwayPlayersListWidget extends StatefulWidget {
//   const AwayPlayersListWidget({super.key});

//   @override
//   State<AwayPlayersListWidget> createState() => _AwayPlayersListWidgetState();
// }

// class _AwayPlayersListWidgetState extends State<AwayPlayersListWidget> {
//   List<String> awayTeamPlayers = [
//     'Meret',
//     'Rrahmani',
//     'J. Jesus',
//     'M. Rui',
//     'Di Lorenzo',
//     'Lobotka',
//     'Anguissa',
//     'Zielinski',
//     'Kvaratskhelia',
//     'Politano',
//     'Osimenh',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//         physics: const NeverScrollableScrollPhysics(),
//         itemBuilder: (context, index) {
//           return Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Text(
//                 awayTeamPlayers[index],
//                 //textAlign: TextAlign.end,
//                 style: const TextStyle(fontSize: 18),
//               ),
//             ],
//           );
//         },
//         separatorBuilder: (context, index) {
//           return const Divider(
//             color: Colors.transparent,
//           );
//         },
//         itemCount: awayTeamPlayers.length);
//   }
// }
