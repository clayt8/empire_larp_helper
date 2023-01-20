import 'package:empire_lrp_helper/Screens/Runes/model/runes_model.dart';
import 'package:empire_lrp_helper/Screens/Runes/screens/rune_detail_screen.dart';
import 'package:empire_lrp_helper/Screens/Runes/screens/rune_study_screen.dart';
import 'package:empire_lrp_helper/Screens/Runes/viewmodel/runes_viewmodel.dart';
import 'package:flutter/material.dart';


class RunesScreen extends StatefulWidget {
  const RunesScreen({Key? key}) : super(key: key);

  @override
  State<RunesScreen> createState() => _RunesScreenState();
}

class _RunesScreenState extends State<RunesScreen> {
  final controller = TextEditingController();
  late RunesViewModel viewModel;
  late Future<List<RuneCardModel>> list;
  String? searchString;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = RunesViewModel();
    list = viewModel.getRuneCardListFromRepo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<RuneCardModel>>(
        future: list,
        builder: (BuildContext context,
            AsyncSnapshot<List<RuneCardModel>> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            final result = _searchRune(snapshot.data);
            viewModel.loadedList = snapshot.data!;
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: "Rune Name, alt name, or realm affiliation",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1),
                            borderSide: const BorderSide(color: Colors.grey))),
                    onChanged: setSearchString,
// onChanged: searchRune,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: result.length,
                      itemBuilder: (context, i) => Card(
                            child: ListTile(
                              title: Text(result[i].name),
                              subtitle: Text(result[i].altName),
                              trailing: Image.asset(result[i].imagePath,
                                  height: 36, fit: BoxFit.cover),
                              onTap: () => Navigator.of(context).push(runeDetailRoute(result[i].name)),
                            ),
                          ),
                  ),
                )
              ],
            );
          } else {
            return const Text(
                "Loading Runes"); //TODO cool loading rune animation thing
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).push(runeStudyRoute(viewModel.loadedList)),
        label: const Text('Study Mode'),
      ),
    );
  }

  // void searchRune(String query) {
  //   final suggestions = _list.where((rune) {
  //     final runeName = rune.name.toLowerCase();
  //     final input = query.toLowerCase();
  //     return runeName.contains(input);
  //   }).toList();
  //
  //   final futureList = constructFuture(suggestions);
  //   setState(() => list = futureList);
  // }

  List<RuneCardModel> _searchRune(List<RuneCardModel>? list) {
    if (searchString?.isNotEmpty == true) {
      List<RuneCardModel> nameSuggestions = <RuneCardModel>[];
      nameSuggestions = list
              ?.where((element) => element.name
                  .toLowerCase()
                  .contains(searchString!.toLowerCase()))
              .toList() ??
          <RuneCardModel>[];

      List<RuneCardModel> altNameSuggestions = <RuneCardModel>[];
      altNameSuggestions = list
              ?.where((element) => element.altName
                  .toLowerCase()
                  .contains(searchString!.toLowerCase()))
              .toList() ??
          <RuneCardModel>[];

      List<RuneCardModel> realmSuggestions = <RuneCardModel>[];
      realmSuggestions = list
              ?.where((element) => element.realmAffiliation
                  .toLowerCase()
                  .contains(searchString!.toLowerCase()))
              .toList() ??
          <RuneCardModel>[];

      var newList = {
        ...nameSuggestions,
        ...altNameSuggestions,
        ...realmSuggestions
      }.toList();
      return newList;
    }
    return list ?? <RuneCardModel>[];
  }

  void setSearchString(String search) {
    setState(() => searchString = search);
  }
}
