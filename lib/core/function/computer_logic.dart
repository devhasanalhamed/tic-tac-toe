import 'dart:math';

int computerLogic(List<int> board, int roundCount) {
  if (board[4] == 0) {
    return 4;
  }
  if (board[0] + board[1] + board[2] == 2) {
    if (board[0] == 0) {
      return 0;
    } else if (board[1] == 0) {
      return 1;
    } else {
      return 2;
    }
  }

  if (board[3] + board[4] + board[5] == 2) {
    if (board[3] == 0) {
      return 3;
    } else if (board[4] == 0) {
      return 4;
    } else {
      return 5;
    }
  }

  if (board[6] + board[7] + board[8] == 2) {
    if (board[6] == 0) {
      return 6;
    } else if (board[7] == 0) {
      return 7;
    } else {
      return 8;
    }
  }

  if (board[0] + board[3] + board[6] == 2) {
    if (board[0] == 0) {
      return 0;
    } else if (board[3] == 0) {
      return 3;
    } else {
      return 6;
    }
  }

  if (board[1] + board[4] + board[7] == 2) {
    if (board[1] == 0) {
      return 1;
    } else if (board[4] == 0) {
      return 4;
    } else {
      return 7;
    }
  }

  if (board[2] + board[5] + board[8] == 2) {
    if (board[2] == 0) {
      return 2;
    } else if (board[5] == 0) {
      return 5;
    } else {
      return 8;
    }
  }

  if (board[0] + board[4] + board[8] == 2) {
    if (board[0] == 0) {
      return 0;
    } else if (board[4] == 0) {
      return 4;
    } else {
      return 8;
    }
  }

  if (board[2] + board[4] + board[6] == 2) {
    if (board[2] == 0) {
      return 2;
    } else if (board[4] == 0) {
      return 4;
    } else {
      return 6;
    }
  }

  while (roundCount < 9) {
    int random = Random().nextInt(8);
    if (board[random] == 0) {
      return random;
    }
  }

  return 9;
}
