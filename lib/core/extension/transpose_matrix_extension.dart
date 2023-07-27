extension NumberToAlphabet on List<List> {
  /// Transpose a matrix
  /// 
  /// Es:
  /// 
  /// Input:
  /// 
  /// [ Red1,    Red2,   Red3 ]
  /// 
  /// [ Blue1,   Blue2,  Blue3,  Blue4 ]
  /// 
  /// [ Green1,  Green2, Green3, Green4, Green5, Green6, Green7 ]
  /// 
  /// [ Yellow1, Yellow2 ]
  /// 
  /// [ Pink1,   Pink2,  Pink3,  Pink4 ]
  /// 
  /// 
  /// Output:
  ///
  /// [ Red1, Blue1, Green1, Yellow1, Pink1 ]
  /// 
  /// [ Red2, Blue2, Green2, Yellow2, Pink2 ]
  /// 
  /// [ Red3, Blue3, Green3, null,    Pink3 ]
  /// 
  /// [ null, Blue4, Green4, null,    Pink4 ]
  /// 
  /// [ null, null,  Green5, null,    null  ]
  /// 
  /// [ null, null,  Green6, null,    null  ]
  /// 
  /// [ null, null,  Green7, null,    null  ]
  List<List<T?>> transpose<T>() {
    final matrix = this;
    int rows = matrix.length;
    int maxCols = 0;
    for (int i = 0; i < rows; i++) {
      if (matrix[i].length > maxCols) {
        maxCols = matrix[i].length;
      }
    }

    List<List<T?>> transposedMatrix = List.generate(maxCols, (_) => List<T?>.filled(rows, null));

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < matrix[i].length; j++) {
        transposedMatrix[j][i] = matrix[i][j];
      }
    }

    return transposedMatrix;
  }
}
