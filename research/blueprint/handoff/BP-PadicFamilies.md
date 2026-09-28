# BP-PadicFamilies: checkpoint 1 (Claude Code cc-39fac3)

Claude Code, session `cc-39fac3`, 28 September 2026. Refs #965; the bot confirmed the claim. **Status: partial.**

| Stage | Coverage |
|---|---|
| L0a | `source_decomposed` (20 nodes) |
| L2a | `partial` (the 14 reviewed nodes carried and completed) |
| L0, L1, L2, L3, L4, L5 | `not_read` |

RS-08 is accepted, and its `keeps` are followed: L0a owns the factorial projector API, which R21.1 imports.

## Closed in this checkpoint

**L0a.** All of Khare–Thorne §2.4 (Lemmas 2.10–2.15) is planned, with Hida (1986) §1 and ACC+ §5.2.
- **Finite modules (finite-set argument):**
  - `factorial-iterate-stabilises`: f^[n!] = f^[|X|!] for n ≥ |X|.
  - The projector e_U = U^{|M|!}.
  - Its identification with Mathlib's Fitting decomposition.
  - Invertibility and nilpotence on the two parts.
  - Uniqueness, naturality, exactness and quotients.
  - Localization at U (ACC+ Proposition 5.2.15).
- **Profinite modules:**
  - Finite quotient systems.
  - The projector as a limit of finite projectors, with the threshold |M/J|.
  - The decomposition, with topological nilpotence and no uniform exponent.
  - Uniqueness, and naturality for maps respecting the systems.
- **The adic instance:** noetherian local rings with finite residue field. It carries the R = ℂ, U = 2 failure test.
- **Exactness:** exactness for limits of finite exact sequences by compactness, then the profinite exactness theorem.
- **Complexes:**
  - Complexes and cohomology.
  - The idempotent e_t ∈ R[t] of an element of a finite algebra.
  - Khare–Thorne Lemma 2.12 in the homotopy category (the degreewise ordinary part splits e).
  - Khare–Thorne Proposition 2.15 along towers.

**L2a.** The fourteen nodes of the integrated decomposition are carried with their ids and texts. This checkpoint
adds:
- their prerequisites;
- re-verified excerpts, taken from the PDF text layer with ligatures as printed; twelve of the earlier excerpts were
  normalised paraphrases;
- API and at least three unit tests for each of the six constructions;
- source issues E1–E9 for Buzzard's printed defects, which were previously recorded in nodes and one gap.

**Source issues.** E10 records Khare–Thorne's T₂ ∈ End_R(M) misprint in Lemmas 2.10(2) and 2.11(2). It is in both
v1 and v2.

## Remaining, precisely

- **L2a.**
  - The Bosch–Lütkebohmert and Conrad formal-model inputs (gap).
  - Refine `strict-slope-neighborhoods` and `admissible-slope-cover` to declaration granularity with the corrected
    inequalities.
  - The coherent eigenmodule sheaf with its Tor and generalized-eigenspace comparisons (gap).
  - The characteristic polynomial over finite projective modules used by `slope-polynomials` (new gap: Mathlib's
    `LinearMap.charpoly` needs a free module).
  - Conrad's irreducible components and Coleman–Mazur 1.3.11 (gap).
- **L0.** RS-08's narrowed scope:
  - the ordinary tower and the q-expansion principle;
  - the U_p instance of L0a;
  - control over the weight Iwasawa algebra;
  - the Eisenstein family from DirichletPadicLFunctions L4;
  - specialisation.

  Read Hida (1986) §§2–3, Wiles (1988) and Emerton–Pollack–Weston (arXiv math/0505193).
- **L1.** The ordinary symbol module, period and congruence modules, and the cyclotomic measure.
- **L2.** The modular instance: Coleman–Mazur Chapters 2–7 and Buzzard §§6–7.
- **L3.** Bellaïche (Invent. Math. 2012) and Pollack–Stevens (critical slope).
- **L4.** Family Selmer complexes, regulators and big Kato classes.
- **L5.** The Hilbert instance, with Khare–Thorne §6 and Hida (Annals 1988).

## Requests made

- **DeformationAndDerivedPatchingAlgebra P7:** minimal complexes and the gluing of good complexes and homotopy
  classes (Khare–Thorne Lemmas 2.3, 2.13, 2.14).
- **AdicSpacesPartII R0, R2, R3:** Tate algebras, formal-model finiteness, and coherent algebras with descent.
- **PadicMeasuresIwasawaAlgebras L0a:** the rigid weight space.

Cited directly as node prerequisites:
- AdicSpacesPartII:F0/finite-module-inverse-limit;
- ArithmeticGaloisDuality:R02.1/milnor-sequence and mittag-leffler-lim-one;
- LocallyAnalyticDistributions L4 Fredholm and Riesz nodes.

## Suggested Lean file

`suggested/PadicFamilies.lean` imports Mathlib modules only. It elaborates against Mathlib 082e2d3, run with the
pinned toolchain v4.34.0-rc2 and a single `lean` call: 0 errors, and the only warnings are for `sorry`.
- **L0a** is prototyped in full, with signatures, API lemmas and unit tests as `example`s.
- **Derived-category and tower statements** (Khare–Thorne 2.12 and 2.15) and **L2a** are recorded as signature
  comments, because neither library has rigid spaces or the P7 minimal-complex API.

## Sources

**Read:**
- Khare–Thorne, arXiv:1409.7007v2, §2.2 and §2.4 (v1 compared);
- ACC+, arXiv:1812.09999v2, §§5.1–5.2;
- Hida, Ann. Sci. ÉNS 1986, Numdam, introduction and §1;
- Buzzard, Conrad, Chenevier and Coleman–Mazur as listed in the packet (hashes re-verified).

**Missing:**
- the CUP 2007 print of Buzzard, so E1–E9 are unchecked there;
- the Amer. J. Math. print of Khare–Thorne, so E10 is unchecked there;
- Hida, Invent. Math. 85 (1986);
- Wiles, Invent. Math. 94 (1988).
