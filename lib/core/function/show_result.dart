import 'package:flutter/material.dart';

Future<void> resultDialog({
  required BuildContext context,
  required bool isWin,
  String? winnerName,
  required VoidCallback continueFunction,
  required VoidCallback skipFunction,
}) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return PopScope(
        canPop: false,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () => continueFunction(),
                    child: const Text("اللعب مجدداً"),
                  ),
                  TextButton(
                    onPressed: () => skipFunction(),
                    child: const Text("عرض الساحة"),
                  ),
                ],
              ),
            ],
            title:
                Text(isWin ? "مبرووووووووووووك 🥳" : "عوافي 🙂 نلعب مره ثانية"),
            content: Container(
              constraints: const BoxConstraints(maxWidth: 200),
              child: Text(
                isWin
                    ? "ألف مبروك يا $winnerName تستاهل الفوز، حاب نتحدى مرة ثانية؟"
                    : "هذه المرة الفوز من نصيبي أتحداك تفوز 🔥",
              ),
            ),
          ),
        ),
      );
    },
  );
}
