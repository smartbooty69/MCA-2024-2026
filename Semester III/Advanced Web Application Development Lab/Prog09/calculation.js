exports.add = function (a, b) {
    return a + b;
};
exports.sub = function (a, b) {
    return a - b;
};
exports.mul = function (a, b) {
    return a * b;
};
exports.div = function (a, b) {
    return b !== 0 ? a / b : 'Infinity';
}; 