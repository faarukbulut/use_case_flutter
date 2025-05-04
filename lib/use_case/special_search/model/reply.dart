import 'dart:convert';

List<Reply> replyFromJson(String str) => List<Reply>.from(json.decode(str).map((x) => Reply.fromJson(x)));

String replyToJson(List<Reply> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Reply {
    String result;

    Reply({
        required this.result,
    });

    factory Reply.fromJson(Map<String, dynamic> json) => Reply(
        result: json["result"],
    );

    Map<String, dynamic> toJson() => {
        "result": result,
    };

    static List<Reply> get replies => List.generate(10, (i) => Reply(result: 'repy_${i+1}'));
}
