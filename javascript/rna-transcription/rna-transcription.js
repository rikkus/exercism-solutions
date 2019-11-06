export const toRna = dna => {
  const lookup = {'G': 'C', 'C': 'G', 'T': 'A', 'A': 'U'};
  return dna.replace(/[GCTA]/g, c => lookup[c]);
};
