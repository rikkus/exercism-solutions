var Bob = function() {};

Bob.prototype.hey = function (input) {

    var XRegExp = require('xregexp').XRegExp;

    // Test whether the input is empty or space character(s).
    if (XRegExp("^\\s*$").test(input))
        return "Fine. Be that way!";

    // Test whether the input has upper case - and no lower case - characters. This is our definition of 'shouting'.
    if (XRegExp("[\\p{Lu}]").test(input) && !XRegExp("[\\p{Ll}]").test(input))
        return "Whoa, chill out!";

    // Test whether the input ends with a question mark.
    if (XRegExp("\\?$").test(input))
        return "Sure.";

    return "Whatever.";
};

module.exports = Bob;