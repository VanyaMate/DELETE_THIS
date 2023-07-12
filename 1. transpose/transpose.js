const transpose = function (table) {
    if (!table.length) return [];
    if (!table[0].length) return [];

    const rows = table.length;
    const cols = table[0].length;
    const transposedTable = new Array(cols).fill(undefined).map((row) => new Array(rows));

    for (let r = 0; r < rows; r++) {
        for (let c = 0; c < cols; c++) {
            transposedTable[c][r] = table[r][c];
        }
    }

    return transposedTable;
}