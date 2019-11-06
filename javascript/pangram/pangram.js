export const isPangram = (text) =>
  new Set(text.toLowerCase().split('').filter((c) => c >= 'a' && c <= 'z'))
    .size == 26;
