// To parse this JSON data, do
//
//     final mandarin = mandarinFromJson(jsonString);

import 'dart:convert';

Mandarin mandarinFromJson(String str) => Mandarin.fromJson(json.decode(str));

String mandarinToJson(Mandarin data) => json.encode(data.toJson());

class Mandarin {
    Mandarin({
        required this.mandarin,
    });

    List<MandarinElement> mandarin;

    factory Mandarin.fromJson(Map<String, dynamic> json) => Mandarin(
        mandarin: List<MandarinElement>.from(json["mandarin"].map((x) => MandarinElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "mandarin": List<dynamic>.from(mandarin.map((x) => x.toJson())),
    };
}

class MandarinElement {
    MandarinElement({
        required this.id,
        required this.pinyin,
        required this.latinizedPinyin,
        required this.meaningMalay,
        required this.meaningEnglish,
        required this.chineseChar,
        required this.tag,
    });

    int id;
    String pinyin;
    String latinizedPinyin;
    String meaningMalay;
    String meaningEnglish;
    String chineseChar;
    List<String> tag;

    factory MandarinElement.fromJson(Map<String, dynamic> json) => MandarinElement(
        id: json["id"],
        pinyin: json["pinyin"],
        latinizedPinyin: json["latinized_pinyin"],
        meaningMalay: json["meaning_malay"],
        meaningEnglish: json["meaning_english"],
        chineseChar: json["chinese_char"],
        tag: List<String>.from(json["tag"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "pinyin": pinyin,
        "latinized_pinyin": latinizedPinyin,
        "meaning_malay": meaningMalay,
        "meaning_english": meaningEnglish,
        "chinese_char": chineseChar,
        "tag": List<dynamic>.from(tag.map((x) => x)),
    };
}
