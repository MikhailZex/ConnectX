main(List<String> args) {
  print(canMoveDiagonally(chessPiece.pawn));

  print(chessPiece.bishop.index);
  print(chessPiece.horse.toString());
}

enum chessPiece {king, queen, horse, bishop, castle, pawn}

bool canMoveDiagonally(chessPiece piece){
  if ([chessPiece.horse, chessPiece.castle].contains(piece)){
      return false;
  } else {
      return true;
  }
}