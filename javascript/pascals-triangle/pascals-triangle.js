export class Triangle {
  constructor(row_count) {
    this.row_count = row_count;
  }

  get lastRow() {
    return this.rows[this.row_count - 1];
  }

  get rows() {
    var rows = Array(this.row_count);
    for (var row_index = 0; row_index < this.row_count; row_index++) {
      var cols = Array(row_index);
      cols[0] = 1;
      for (var col_index = 1; col_index < row_index; col_index++) {
        cols[col_index] = rows[row_index - 1][col_index] + rows[row_index - 1][col_index - 1];
      }
      cols[row_index] = 1;
      rows[row_index] = cols;
    }
    return rows;
  }
}
