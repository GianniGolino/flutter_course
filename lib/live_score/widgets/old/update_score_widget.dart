// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:gap/gap.dart';

// class UpdateScoreWidget extends StatefulWidget {
//   const UpdateScoreWidget({super.key, required this.onScoreChanged});
//   final void Function(
//       {required int newScore,
//       required bool isHomeScore,
//       required bool isScoreIncreasing}) onScoreChanged;

//   @override
//   State<UpdateScoreWidget> createState() => _UpdateScoreWidgetState();
// }

// class _UpdateScoreWidgetState extends State<UpdateScoreWidget> {
//   TextEditingController homeTeamTextController =
//       TextEditingController(text: '0');
//   TextEditingController awayTeamTextController =
//       TextEditingController(text: '0');

//   int homeScore = 0;
//   int awayScore = 0;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: Column(
//                   children: [
//                     // to convert into a custom textField
//                     SizedBox(
//                       width: 60,
//                       height: 60, // Define a height for the SizedBox
//                       child: TextField(
//                         enabled: false,
//                         // inputFormatters: [
//                         //   // TODO: Per usare le regex serve un capitolo a parte
//                         //   FilteringTextInputFormatter.allow(RegExp(r'^[0-9]$')),
//                         // ],
//                         controller: homeTeamTextController,
//                         cursorHeight: 20,
//                         decoration: const InputDecoration(
//                           contentPadding: EdgeInsets.symmetric(vertical: 4),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(15),
//                             ),
//                           ),
//                         ),
//                         style: const TextStyle(fontSize: 30),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     const Gap(8),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         changeScoreWidget(),
//                         const Gap(8),
//                         changeScoreWidget(isIncreasing: false),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               const Gap(32),
//               Expanded(
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       width: 60,
//                       height: 60, // Define a height for the SizedBox
//                       child: TextField(
//                         enabled: false,
//                         inputFormatters: [
//                           FilteringTextInputFormatter.allow(RegExp(r'^[0-9]$')),
//                         ],
//                         controller: awayTeamTextController,
//                         cursorHeight: 20,
//                         decoration: const InputDecoration(
//                           contentPadding: EdgeInsets.symmetric(vertical: 4),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(15),
//                             ),
//                           ),
//                         ),
//                         style: const TextStyle(fontSize: 30),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     const Gap(8),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         changeScoreWidget(isHome: false),
//                         const Gap(8),
//                         changeScoreWidget(isHome: false, isIncreasing: false),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget changeScoreWidget({bool isHome = true, bool isIncreasing = true}) {
//     return SizedBox(
//       width: 44,
//       height: 44,
//       child: IconButton(
//         onPressed: () {
//           setState(() {
//             if (isHome) {
//               if (isIncreasing) {
//                 homeScore++;
//               } else {
//                 homeScore--;
//               }
//               homeTeamTextController.text = homeScore.toString();
//             } else {
//               if (isIncreasing) {
//                 awayScore++;
//               } else {
//                 awayScore--;
//               }
//               awayTeamTextController.text = awayScore.toString();
//             }
//             widget.onScoreChanged(
//                 newScore: isHome ? homeScore : awayScore,
//                 isHomeScore: isHome,
//                 isScoreIncreasing: isIncreasing);
//           });
//         },
//         icon: Icon(isIncreasing ? Icons.arrow_upward : Icons.arrow_downward),
//       ),
//     );
//   }
// }



//     // TODO: Se non inserisco nessun numero e clicco su questo tasto, la funzione viene eseguita comunque e ricevo un exception da Flutter.
//     // TODO: Seguendo l'as-is, il valore della texfield deve essere lo stesso del punteggio mostrato nel live_score board widget e, se non inserisco un numero
//     // TODO: nella textfield, il click al tasto dovrebbe incrementare/ridurre il valore del punteggio