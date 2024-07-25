bool? ticTacToeLogic(List<String> board, int roundCount) {
  print(board);

  for (int i = 0; i < board.length; i += 3) {
    if (board[i].isNotEmpty &&
        board[i] == board[i + 1] &&
        board[i] == board[i + 2]) {
      return true;
    }
  }

  for (int i = 0; i < 3; i++) {
    if (board[i].isNotEmpty &&
        board[i] == board[i + 3] &&
        board[i] == board[i + 6]) {
      return true;
    }
  }

  if (board[0].isNotEmpty && board[0] == board[4] && board[0] == board[8]) {
    return true;
  } else if (board[2].isNotEmpty &&
      board[2] == board[4] &&
      board[2] == board[6]) {
    return true;
  } else if (roundCount == 9) {
    return false;
  }

  return null;
}
