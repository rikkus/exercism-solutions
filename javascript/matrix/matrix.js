export class Matrix {
  constructor(text) {

    this._rows =
      text
      .split('\n')
      .map(row => row.split(' ').map(c => Number(c)));
  }

  get rows() { return this._rows; }

  get columns() {
    return this._columns = this._columns ||
        this._rows[0]
          .map((_, index) => this._rows.map(row => row[index]));
  }
}
