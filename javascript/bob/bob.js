export const hey = (message) => {

    // Test whether the input is empty or space character(s).
    if (/^\s*$/u.test(message))
        return "Fine. Be that way!";

    // Test whether the input has upper case - and no lower case - characters. This is our definition of 'shouting'.
    const is_shouted = /[\p{Lu}]/u.test(message) && !/[\p{Ll}]/u.test(message);

    // Test whether the input ends with a question mark.
    const is_question = /\?\s*$/u.test(message);

    if (is_question && is_shouted) {
      return "Calm down, I know what I'm doing!";
    }

    if (is_question) {
      return "Sure.";
    }

    if (is_shouted) {
      return "Whoa, chill out!";
    }

    return "Whatever.";
};