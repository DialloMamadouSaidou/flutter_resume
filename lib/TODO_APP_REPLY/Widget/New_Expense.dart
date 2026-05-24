import "package:flutter/material.dart";

import "package:full_cours/TODO_APP_REPLY/Widget/data_expense.dart";
import "package:google_fonts/google_fonts.dart";

class NewExpense extends StatefulWidget {
  final void Function(DataExpense data) ma_liste_depense;
  const NewExpense(this.ma_liste_depense, {super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  var _selected_category = Category.leisure;

  final _title_controller = TextEditingController();
  final _amount_controller = TextEditingController();
  DateTime? _date_choice;

  void Choice_Item(Category? item) {
    print("Mon item est $item");
    setState(() {
      _selected_category = item!;
    });
  }

  void _choice_date() async {
    var date_reference = DateTime.now();

    var date_choice = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(
        date_reference.year + 1,
        date_reference.month,
        date_reference.day,
      ),
    );

    setState(() {
      _date_choice = date_choice;
    });
  }

  void close_window() {
    Navigator.pop(context);
  }

  void _saved_data() {
    final text_entrer = _title_controller.text.trim();
    final amount = double.tryParse(_amount_controller.text.trim());

    if (amount == null ||
        amount <= 0 ||
        text_entrer == "" ||
        _date_choice == null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Input Error"),
            content: const Text("Tout les entrer doivent être valide"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Ok"),
              ),
            ],
          );
        },
      );

      return;
    } else {
      widget.ma_liste_depense(
        DataExpense(
          title: text_entrer,
          amount: amount,
          datetime: _date_choice!,
          category: _selected_category,
        ),
      );

      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _title_controller.dispose();
    _amount_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
      child: Padding(
      padding: EdgeInsets.fromLTRB(16, 2, 16, keyboardSpace + 16),

        child: Column(
          // Optionnel : aligne le contenu au début verticalement
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            // --- PREMIÈRE LIGNE (Titre) ---
            // Retrait de l'Expanded vertical ici
            Row(
              children: [
                Expanded( // Cet Expanded horizontal est CORRECT et nécessaire
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      controller: _title_controller,
                      keyboardType: TextInputType.text,
                      maxLength: 30,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        label: Container(
                          margin: const EdgeInsets.only(bottom: 45),
                          child: Text(
                            "Title",
                            style: GoogleFonts.lato(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // --- DEUXIÈME LIGNE (Montant, Catégorie, Date) ---
            // Retrait de l'Expanded vertical ici
            Row(
              children: [
                Expanded( // CORRECT
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _amount_controller,
                      decoration: const InputDecoration(
                        label: Text("Amount"),
                        prefixText: "\$",
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 13),
                Expanded( // CORRECT
                  child: DropdownButton<Category>(
                    value: _selected_category,
                    onChanged: Choice_Item,
                    items: Category.values.map((item) {
                      return DropdownMenuItem<Category>(
                        value: item,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(item.name),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                ElevatedButton(
                  onPressed: _choice_date,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    _date_choice == null
                        ? "Choice date"
                        : format.format(_date_choice!).toString(),
                  ),
                ),
              ],
            ),

            // --- TROISIÈME LIGNE (Boutons d'action) ---
            // Retrait de l'Expanded vertical ici
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(onPressed: close_window, child: const Text("Clear")),
                const SizedBox(width: 8), // Petit espace entre tes deux boutons
                ElevatedButton(onPressed: _saved_data, child: const Text("Saved data")),
              ],
            ),

          ],
        ),
      ),
    )
    );

  }
}
