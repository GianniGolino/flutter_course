import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class UpdateScoreWidget extends StatefulWidget {
  const UpdateScoreWidget(
      {super.key,
      required this.onHomeTeamScoreChanged,
      required this.onAwayTeamScoreChanged});
  final void Function(int) onHomeTeamScoreChanged;
  final void Function(int) onAwayTeamScoreChanged;

  @override
  State<UpdateScoreWidget> createState() => _UpdateScoreWidgetState();
}

class _UpdateScoreWidgetState extends State<UpdateScoreWidget> {
  // TODO: Il valore predefinito che deve essere presente di default nelle textfield è "0" e deve tornare "0" 
  TextEditingController homeTeamTextController = TextEditingController();
  TextEditingController awayTeamTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    // to convert into a custom textField
                    // TODO: Se inserisco un numero e clicco sul tasto con la freccia verso il basso, il punteggio viene sottratto dal numero inserito
                    SizedBox(
                      width: 60,
                      height: 60, // Define a height for the SizedBox
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          // TODO: Per usare le regex serve un capitolo a parte
                          FilteringTextInputFormatter.allow(RegExp(r'^[0-9]$')),
                        ],
                        controller: homeTeamTextController,
                        cursorHeight: 0,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          //hintText: '0', // Set default text to '0'
                        ),
                        style: const TextStyle(fontSize: 30),
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          // TODO: Al cambio di valore all'interno della textfield deve avvenire direttamente il cambio di punteggio
                        },
                      ),
                    ),
                    const Gap(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 44,
                          height: 44,
                          // TODO: Preferisci degli IconButton ai FloatingActionButton se non devono contenere testo ma solo un'icona
                          child: FloatingActionButton(
                            heroTag: null,
                            onPressed: () {
                              // TODO: Se non inserisco nessun numero e clicco su questo tasto, la funzione viene eseguita comunque e ricevo un exception da Flutter.
                              // TODO: Seguendo l'as-is, il valore della texfield deve essere lo stesso del punteggio mostrato nel live_score board widget e, se non inserisco un numero 
                              // TODO: nella textfield, il click al tasto dovrebbe incrementare/ridurre il valore del punteggio 
                              int intValue =
                                  int.parse(homeTeamTextController.text);
                              widget.onHomeTeamScoreChanged(intValue);
                              homeTeamTextController.clear();
                            },
                            child: const Icon(Icons.arrow_upward),
                          ),
                        ),
                        const Gap(8),
                        SizedBox(
                          width: 44,
                          height: 44,
                          // TODO: Preferisci degli IconButton ai FloatingActionButton se non devono contenere testo ma solo un'icona
                          child: FloatingActionButton(
                            heroTag: null,
                            onPressed: () {
                              // TODO: Se non inserisco nessun numero e clicco su questo tasto, la funzione viene eseguita comunque e ricevo un exception da Flutter.
                              // TODO: Seguendo l'as-is, il valore della texfield deve essere lo stesso del punteggio mostrato nel live_score board widget e, se non inserisco un numero 
                              // TODO: nella textfield, il click al tasto dovrebbe incrementare/ridurre il valore del punteggio 
                              int intValue =
                                  int.parse(homeTeamTextController.text);
                              widget.onHomeTeamScoreChanged(-intValue);
                              homeTeamTextController.clear();
                            },
                            child: const Icon(Icons.arrow_downward),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(32),
              Expanded(
                child: Column(
                  children: [
                    // to convert into a custom textField
                    SizedBox(
                      width: 60,
                      height: 60, // Define a height for the SizedBox
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'^[0-9]$')),
                        ],
                        controller: awayTeamTextController,
                        cursorHeight: 20,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          //hintText: '0', // Set default text to '0'
                        ),
                        style: const TextStyle(fontSize: 30),
                        textAlign: TextAlign.center,
                        onChanged: (input) {},
                      ),
                    ),
                    const Gap(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 44,
                          height: 44,
                          // TODO: Preferisci degli IconButton ai FloatingActionButton se non devono contenere testo ma solo un'icona
                          child: FloatingActionButton(
                            heroTag: null,
                            onPressed: () {
                              // TODO: Se non inserisco nessun numero e clicco su questo tasto, la funzione viene eseguita comunque e ricevo un exception da Flutter.
                              // TODO: Seguendo l'as-is, il valore della texfield deve essere lo stesso del punteggio mostrato nel live_score board widget e, se non inserisco un numero 
                              // TODO: nella textfield, il click al tasto dovrebbe incrementare/ridurre il valore del punteggio 
                              int intValue =
                                  int.parse(awayTeamTextController.text);
                              widget.onAwayTeamScoreChanged(intValue);
                              awayTeamTextController.clear();
                            },
                            child: const Icon(Icons.arrow_upward),
                          ),
                        ),
                        const Gap(8),
                        SizedBox(
                          width: 44,
                          height: 44,
                          // TODO: Preferisci degli IconButton ai FloatingActionButton se non devono contenere testo ma solo un'icona
                          child: FloatingActionButton(
                            heroTag: null,
                            onPressed: () {
                              // TODO: Se non inserisco nessun numero e clicco su questo tasto, la funzione viene eseguita comunque e ricevo un exception da Flutter.
                              // TODO: Seguendo l'as-is, il valore della texfield deve essere lo stesso del punteggio mostrato nel live_score board widget e, se non inserisco un numero 
                              // TODO: nella textfield, il click al tasto dovrebbe incrementare/ridurre il valore del punteggio 
                              int intValue =
                                  int.parse(awayTeamTextController.text);
                              widget.onAwayTeamScoreChanged(-intValue);
                              awayTeamTextController.clear();
                            },
                            child: const Icon(Icons.arrow_downward),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
