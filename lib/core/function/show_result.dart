Future<void> showResultDialog({required bool isDraw}, [String winnerName]) async {
  thereIsAWinner = true;
  if (isWin) isPlayerOne ? playerOneScore += 1 : playerTwoScore += 1;
  winnerName = isPlayerOne ? playerOne : playerTwo;
  isPlayerOne = !isPlayerOne;
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
                    onPressed: () {
                      setState(() {
                        clearBoard();
                        Navigator.pop(context);
                      });
                    },
                    child: const Text("اللعب مجدداً"),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    child: const Text("عرض النتيجة"),
                  ),
                ],
              ),
            ],
            title: Text(
                isWin ? "مبرووووووووووووك 🥳" : "عوافي 🙂 نلعب مره ثانية"),
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
}
