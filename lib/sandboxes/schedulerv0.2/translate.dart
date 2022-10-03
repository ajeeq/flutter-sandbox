// Import directives
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latinize/latinize.dart';

// Models
import 'package:flutter_sandbox/models/mandarin.dart';

// Services
import 'package:flutter_sandbox/services.dart';

// Riverpod Providers
import 'package:flutter_sandbox/providers/language_providers.dart';

class Translate extends ConsumerStatefulWidget {
  const Translate({ Key? key }) : super(key: key);

  @override
  _TranslateState createState() => _TranslateState();
}

class _TranslateState extends ConsumerState<Translate> {
  List<String> _listPinyin = [];
  List<String> _listLatinizedPinyin = [];
  List<MandarinElement> _mandarinList = [];

  // output print
  String _latPinyin = "";
  String _meaningMalay = "";
  String _meaningEnglish = "";
  String _chineseChar = "";

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/mandarin.json');
    final data = mandarinFromJson(response);
    final List<MandarinElement> json = data.mandarin;

    List<String> l = [];
    List<String> l2 = [];

    for(int i=0; i<json.length; i++) {
      for (var e in json) {
        l.add(e.pinyin);
        l2.add(e.latinizedPinyin);
      }
    }
        
    setState(() {
      _listPinyin = l;
      _listLatinizedPinyin = l2;
      _mandarinList = json;
    });
    
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    // const sample = '{"mandarin":[{"id":1,"pinyin":"dàxué","latinized_pinyin":"daxue","meaning_malay":"universiti","meaning_english":"university","chinese_char":"","tag":["TMC451","CS230"]},{"id":2,"pinyin":"diànyǐngyuàn","latinized_pinyin":"dianyingyuan","meaning_malay":"panggung wayang","meaning_english":"cinema","chinese_char":"","tag":["TMC451","CS230"]},{"id":3,"pinyin":"gōngchéngshī","latinized_pinyin":"gongchengshi","meaning_malay":"jurutera","meaning_english":"engineer","chinese_char":"","tag":["TMC451","CS230"]}]}';
    // final data = mandarinFromJson(sample);
    // final parsed = data.mandarin.map((e) => e.pinyin);

    // List<String> listPinyin = [];
    // List<String> listLatinizedPinyin = [];
    // for(int i=0; i<data.mandarin.length; i++) {
    //   for (var e in data.mandarin) {
    //     listPinyin.add(e.pinyin);
    //     listLatinizedPinyin.add(e.latinizedPinyin);
    //   }
    // }
      
    
    const List<String> _kOptions = <String>[
      'aardvark',
      'bobcat',
      'chameleon',
    ];

    
    // declaring riverpod state providers
    final inputWordState = ref.watch(inputWordProvider);

    // declaring notifiers for updating riverpod states
    final InputWordNotifier inputWordStateController = ref.read(inputWordProvider.notifier);
    final MandarinListNotifier mandarinListStateController = ref.read(mandarinListProvider.notifier);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Translate"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if(textEditingValue.text == '') {
                return const Iterable<String>.empty();
              }
              
              return _mandarinList.map((e) => e.pinyin).where((String option) {
                return latinize(option).contains(textEditingValue.text.toLowerCase());
                
              });
            },
            optionsViewBuilder: (context, Function(String) onSelected, options) {
              return Material(
                elevation: 4,
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    final option = options.elementAt(index);
      
                    return ListTile(
                      title: Text(option.toString()),
                      onTap: () {
                        onSelected(option.toString());
                      },
                    );
                  },
                ),
              );
            },
            fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
              // this.controller = controller;
              return TextField(
                controller: controller,
                focusNode: focusNode,
                onEditingComplete: onEditingComplete,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  hintText: "Text here",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: () => controller.clear(), 
                    icon: Icon(Icons.clear)
                  )
                ),
              );
            },
            onSelected: (String selection) {
              print('You just selected $selection');

              for (var i=0; i<_mandarinList.length; i++) {
                if (selection == _mandarinList[i].pinyin){

                  setState(() {
                    _latPinyin = _mandarinList[i].latinizedPinyin;
                    _meaningMalay = _mandarinList[i].meaningMalay;
                    _meaningEnglish = _mandarinList[i].meaningEnglish;
                    _chineseChar = _mandarinList[i].chineseChar;
                  });
                }
              }
            },
          ),

          SizedBox(height: 32),

          Text("latinized_pinyin: " + _latPinyin),
          Text("meaning_malay: " + _meaningMalay),
          Text("meaning_english: " + _meaningEnglish),
          Text("chinese_char: " + _chineseChar),
          Text("tag: "),
        ],
      ),
    );
  }
}