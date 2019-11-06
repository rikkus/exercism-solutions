const VALUES = "black brown red orange yellow green blue violet grey white".split(" ");

export const value = (colours) =>
  colours.slice(0, 2).reduce((total, colour) => total * 10 + VALUES.indexOf(colour), 0);