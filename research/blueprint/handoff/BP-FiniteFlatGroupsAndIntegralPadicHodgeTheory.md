# Handoff: BP-FiniteFlatGroupsAndIntegralPadicHodgeTheory (ninth checkpoint)

Agent: Claude Code, session cc-fb70e5. Refs #731.

- Checkpoints 1–8 merged in #3824, #3827, #3830, #3832, #3838, #3842, #3844 and #3846.
- R07.1 is closed. R07.2–R07.6 are partial.
- This checkpoint plans **Fontaine's ramification bound in R07.6**. SmallRamificationAndAbelianVarietyBaseCases requested it for R25.1/fontaine-torsion-field-bound.

## Source

Fontaine's *Il n'y a pas de variété abélienne sur Z* (Invent. Math. 81, 1985) was recorded as behind a login. It is in fact hosted on the author's page at Paris-Saclay, as varabZ.pdf.

- The file is the publisher's scan. Its OCR is poor, so excerpts are transcribed from the page images.
- The same page also hosts *Groupes p-divisibles sur les corps locaux* (Astérisque 47–48), as an image-only scan. It is the free source FL §9 (R07.3) was missing.

## New R07.6 nodes

- `fontaine-ramification-numbering` (definition, planet):
  - Fontaine's i_{L/K}, G^(u), u_{L/K} and i_{L/K};
  - the dictionary G_j = G_((j+1)/e_{L/K}) and G^v = G^(v+1);
  - compatibility with quotients;
  - v_K(𝒟_{L/K}) = u_{L/K} − i_{L/K} (Proposition 1.3).
- `krasner-embedding-criterion`: Propositions 1.4–1.5, the property (P_m) and its relation to u_{L/K}.
- `lci-lifting-and-ramification`:
  - §1.6, the divided powers on a^m;
  - Proposition 1.7, lifting through topologically nilpotent divided powers, and the bound u_{L/K} ≤ v_K(a) + e/(p − 1);
  - Corollary 1.8.
- `fontaine-ramification-bound` (planet): Théorème A / Théorème 1. For J finite flat over O_K and killed by pⁿ:
  - G_K^(u) acts trivially on J(K̄) for u > e(n + 1/(p − 1));
  - v_K(𝒟) < e(n + 1/(p − 1)), in Serre's numbering and in the normalised form;
  - for e = n = 1 the proof needs no embedding into a Barsotti–Tate group (Remark 2.2(a)).

## Requests

- **New:** Tau Ceti LocalFieldsRamification Layer 3, for Serre's numbering, Herbrand's functions, quotients and the different.
- **Answered:** SmallRamification's R07.6 request.

## Source issues

None found.
- A candidate strict "<" in the tame case of Proposition 1.7 (p. 524) is an OCR artefact. The page image reads "≦".

## Lean

The suggested Lean file is unchanged: ramification groups are not in Mathlib or Tau Ceti at the pin, so any suggestion would be pure placeholders.

## What a continuation could do

1. **R07.6:** the R08 deformation calculations, and finite-flat models under field extension and twisting.
2. **R07.3:** FL §9 through Fontaine's Astérisque 47–48 (image-only scan).
3. **R07.4:**
   - weights {0, p − 1} and {0, p};
   - the Wach comparison;
   - descent data beyond weight two.
4. **R07.5:** general e, and the general p = 2 criterion.
5. **R07.2:** crystals and Grothendieck–Messing.
