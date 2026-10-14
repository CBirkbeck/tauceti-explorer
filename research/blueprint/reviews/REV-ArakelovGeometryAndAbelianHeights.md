# Review: Arakelov geometry and heights of abelian varieties (REV-ArakelovGeometryAndAbelianHeights)

Issue #348. Reviewer: Claude (session claude-QYnUzC, Opus), 2026-10-14. The plan under review is
BP-ArakelovGeometryAndAbelianHeights (session claude-fy0qlK, PR #9654): the first plan of R35.1–R35.6,
55 nodes at target level.

**Verdict: accepted, with corrections made in place.** All 55 nodes are verified (22) or corrected
(33). No node was added. One API item and one planet were added. Every baseline citation is
confirmed, and no contradiction is left open. The four gaps (G1–G4) and the seven requests are
recorded honestly. Every stage stays `planned`.

## Counts

| | before | after |
|---|---|---|
| nodes | 55 | 55 (22 verified, 33 corrected, 0 added) |
| API items / unit tests | 150 / 80 | 151 / 80 |
| planets | 21 | 22 (R35.6 Zarhin's trick) |
| baseline declarations | 23 | 25 |
| requests / gaps | 5 / 4 | 7 / 4 |
| source issues | 3 | 4 (E1–E3 confirmed, E4 added) |
| node source citations checked | 159 | 12 locators and 2 descriptions corrected, 1 removed, 1 added |

`python3 scripts/check_blueprint.py` (with the declaration index): 0 errors, 0 warnings.
`lean-check` on the suggested file at Mathlib 082e2d3 / Tau Ceti f790474: no errors, and the only
warnings are the 16 `declaration uses 'sorry'`.

## What was checked

- **Sources.** All 18 sources were fetched again. The SHA-256 of the 17 public files matches the
  packet; Faltings–Chai was read in the maintainer-cleared copy. Every node citation was checked at
  its locator. The scanned texts (Faltings 1983 ×2, Deligne, Raynaud, Moret-Bailly, Faltings–Chai)
  were read on the page images wherever the OCR lost the formulas.
- **Baseline.** The 23 declarations were read in the Mathlib tree at 082e2d3, and all are confirmed.
  `Height.logHeight` and `NumberField.mulHeight_eq` are the relative height, with no 1/[K:ℚ];
  `absNorm_mul_finprod_finitePlace_eq_one` is stated for integral tuples, and the node scales to
  that case. Two declarations were added (below).
- **Suppliers.** Every cross-roadmap id was resolved against its packet and its statement read. All
  suppliers are of a lower tier: SchemeAndStackFoundations 2, AlgebraicModuli 4,
  ComplexComparisonPartII 5, AbelianSchemes 6, NeronModels 8, HeightsRationalPoints 9, FiniteFlat 10,
  PELModuli 13, ShimuraCompactifications 15, against tier 16 here. The RP.0 node ids are in the
  revision-2 HeightsRationalPoints packet; its review (PR #9711, open) accepts it and keeps all six
  ids. Each request was checked to be genuinely unmet:
  - neither the A3 packet nor TauCetiRoadmap PR #849 has symmetric theta structures;
  - FiniteFlat R07.1 proves 𝔇(𝒢)𝔇(𝒢^D) = (#𝒢) only for e ≤ p − 1 and groups killed by p;
  - R11.3 has the semistable base change but not its converse;
  - C5 is stated for neat good-prime PEL data.
- **Mathematics.** Every statement, proof sketch and test was checked by hand. The numbers were
  recomputed in double precision from the q-products:
  - the elliptic Faltings-height formula gives −0.3080098411 for 11.a2, LMFDB's value;
  - the elliptic constants, U at j = 0 and at its true minimum.

## Corrections

Mathematical:

1. **R35.4/dual-isogeny-differents.** The packet stated h(B) − h(A) = h(A^t) − h(B^t). Together
   with the isogeny formula, that would force h(A) = h(B) for every isogeny. From
   𝔡_u𝔡_{u^t} = (d) the correct identity is h(B) − h(A) = h(B^t) − h(A^t), which is consistent
   with the invariance of heights under duality. The proof step was rewritten.
2. **R35.5/siegel-modular-line-bundle** (the g = 1 check and test `modularLineBundle_g1_norm`) and
   **R35.5/modular-height-equals-faltings-height** (the g = 1 check). The integral discriminant
   section of ω̄^{⊗12} (q-expansion q∏(1 − qⁿ)^{24} for 2πi dz) has Faltings norm
   (2π)^{12}|η^{24}|(Im τ)^6, not |η^{24}|(Im τ)^6. With the unscaled value, h_{O(1)}(j(E)) would
   exceed 12·h_Fal(E) by 12 log 2π.
3. **R35.3/bad-place-correction-bound.** Its "consequently" sentence used the lower bound of
   R35.6/faltings-height-lower-bound without listing it, an upward dependency inside the roadmap.
   The consequence is now stated for an arbitrary lower bound c on h_st. The finite set of bad
   primes moved into R35.6/finiteness-inputs-export (c), with its proof step.
4. **R35.6/faltings-height-lower-bound.** The statement claimed a constant c(g) linear in g. The
   planned proof (Northcott on A_{8g} and Zarhin's trick) gives a constant but not linearity, which
   is Bost's theorem (gap G1). The statement now separates the two.
5. **R35.5/log-singular-heights.** The proof bounded each complex embedding by Liouville's
   inequality, which makes the constants depend on [ℚ(x):ℚ]. The node claims uniform constants.
   The step was replaced by the argument of Faltings' Lemma 3: an integral section bounds the
   average of −log‖f(x_σ)‖, and concavity of log then gives the uniform bound.
6. **R35.6/zarhin-trick.** Moret-Bailly's Lemme 1.1 (Astérisque 129, IX, pp. 205–207) is for a
   polarisation of degree d², with B divisible by d². The sketch said deg λ = d. The planet
   "Zarhin's trick" was added; this roadmap owns that named theorem, and R28.5 currently cites it
   from Milne without a node.
7. **R35.1/degree-additivity.** The dual step treated s^∨ as a section of L^∨, which holds only when
   L = O_K·s. It is redone with the fractional-ideal form of the degree. A matching API item,
   `HermitianBundle.arakelovDegree_eq_fractionalIdeal`, was added to R35.1/arithmetic-degree and to
   the suggested file's list of untyped names.
8. **R35.1/norm-and-rational-lines (c).** The text said "divided appropriately by degrees". It now
   states that h_{N_π ℳ̄}(x) is the sum of h_ℳ̄ over the d points above x, with the product metric
   on the fibre and a proof step. The step uses the index identity for an order and its
   normalisation, so non-normal fibres are covered.
9. **R35.5/elliptic-j-height-bound.** The check placed the minimum of
   U = max(1, |j|)|Δ|(Im τ)^6 at τ = e^{2πi/3}. The minimum is in fact on |j| = 1, at j = −1:
   U ≈ 0.0020239 there, and U(e^{2πi/3}) ≈ 0.0020272. The sharp constants are −1.3210 (Faltings)
   and −0.7486 (Deligne), attained at j = −1, while h_st itself is smallest at j = 0 (Deligne,
   Remarque 1.5).

Smaller corrections:

- **R35.2/metrized-hodge-line.** Direction of the base-change injection:
  ω̄_{𝒜_L} ↪ ω̄_𝒜 ⊗ O_L.
- **R35.2/normalization-adapter.** Faltings–Chai's h_mod (V, Definition 4.1, inner product
  i^{g²}∫ α ∧ β̄) is the unscaled height. This was added, with the source.
- **R35.4/component-line-height.** The trivial-action API item now names the Yuan–Zhang
  normalisation.
- **R35.5/theta-faltings-comparison.** The normalisation of the final bound is now stated.
- **R35.3/model-and-polarization-independence (c)** and the acceptance check of
  **R35.3/field-extension-comparison** were reworded.
- **R35.1/heights-of-points.** The generic fibre is 𝒳_K for a model over O_K.

Suppliers:

- SchemeAndStackFoundations merged into TauCetiRoadmap on 2026-10-14, and the atlas SF.3 and SF.4
  part packets are `needs_changes`. Their node ids (`class-group-picard-locally-factorial`,
  `line-bundle-norm`, `strict-normal-crossings`) were replaced by the stage ids SF.3 and SF.4. Two
  requests name the merged README targets: §3.4 `classGroup_picard_locallyFactorial`, §3.5
  `lineBundleNorm` and §4.17 `IsStrictNormalCrossings`. SF.5/chow-group is in an accepted packet
  and stays.

Locators:

- Deligne §1.10 is on p. 31; it was cited as pp. 30–31 in two places.
- Deligne's definitions of logarithmic distance and logarithmic singularities follow Rappel 1.8 on
  p. 30; they were cited as "§1.8".
- Raynaud:
  - §1.3 runs pp. 202–204, not 201–203;
  - §1.4's computation is on p. 205;
  - Théorème 2.1.1, Remarque 2.1.2 and Corollaires 2.1.3–2.1.4 are on p. 207, not 206 (three
    citations);
  - the tower material starts at §4.1 and runs pp. 219–228.
- Szpiro's Proposition 1.1 is on p. 14, not p. 13.
- Yuan–Zhang's base-change sentence opens p. 3.
- Yuan's Faltings-metric formula is on p. 44.
- Two descriptions were corrected:
  - Yuan–Zhang only say that their normalisation differs from the one in Colmez's statement;
  - Moret-Bailly's polarisation has degree d².
- The Tsimerman citation on R35.6/field-degree-constants was removed. §2 p. 3 says nothing about
  fields of definition of moduli points; Deligne 1.23–1.24 and PELModuli M6 support that node.
- Gillet–Soulé §3.6 was added to `readSections`, and Raynaud's §2.1 page range was corrected.

## Baseline citations

All 23 were confirmed. Two were added:

- `mathlib:Ideal.absNorm_algebraMap` (Mathlib/RingTheory/Ideal/Norm/RelNorm.lean):
  absNorm(I·S) = absNorm(I)^{finrank R S}. This is exactly the step N(𝔞O_L) = N(𝔞)^{[L:K]} of
  degree-base-change, which the packet had attributed to the element-norm lemmas.
- `mathlib:NumberField.Units.logEmbedding` (Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean),
  for the image of the units in the exact sequence of the compactified Picard group. The
  regulator's "provides" text was corrected: it is the covolume of that lattice and does not
  itself appear in the sequence.

## Source issues (PROTOCOL §18)

- **E1** (Faltings 1983, (i/2)^g sign): **confirmed** on the scan at pp. 351 and 354. The printed
  form equals (−1)^{g(g−1)/2} times the volume.
- **E2** (Yuan–Zhang p. 12, "E is totally real or CM"): **confirmed**. A simpler counterexample
  than the packet's: ℤ[∛2] acts on B³ for any elliptic curve B, through M_3(ℤ).
- **E3** (Yuan–Zhang p. 15, monogenicity of O_{E,p}): **confirmed**. If 2 splits completely in a
  quartic E, O_E ⊗ ℤ_2 ≅ ℤ_2⁴ has no single generator.
- **E4 (new, misprint, affects nothing).** In the proof of Gaudron–Rémond's Lemme 7.9 (arXiv v1,
  p. 33), the lower bound for |Δ(τ)| carries (2π)^{−12}. In the normalisation in which their quoted
  formula for h_F holds, it should carry (2π)^{12}. The printed bound is true but loses (2π)^{24}:
  the argument gives h(E) ≤ h(j)/12 − 0.72 rather than + 2.95, and the optimum is −0.7486. The
  lemma as stated remains true. No erratum was found, and arXiv has only v1. The Comment. Math.
  Helv. text was not read.

## Suggested Lean file

The file was compiled before and after the review, with the same result. Its typed statements
were checked by hand and are true:
- `degree_principal` and the multiplicity non-example (value log 2);
- `degree_ofTuple` and `ofTuple_smul`;
- the covolume of ℤ + τℤ is Im τ;
- invariance of the elliptic archimedean term;
- the one-variable logarithmic-singularity model.

The only change is the new API name in the closing list of untyped targets. Every API item and
unit test of the packet appears in the file.

## Reader

The reader was re-rendered from the packet: a renderer first reproduced all 55 node sections of the
committed reader byte for byte, and then the changed sections were rewritten. The R35.6 milestones
line, the requests and the "Mistakes in the sources" list were updated; the last now carries the
review verdicts and E4.

## Questions for the orchestrator

1. **HilbertModularVarietiesAndShimuraCurves R18.2** (tier 14) requests hermitian rational lines
   and norm descent from R35 (tier 16). That is an upward citation. Its package has to plan them
   or take them from a lower roadmap, while R35.1 (norm-and-rational-lines, hermitian-vector-bundle)
   remains the plan-level owner under RS-06. Someone needs to decide which way the notion moves.
2. **FaltingsFinitenessAndIsogenyTheorems.** The re-pointing in this packet's `restructure` is
   still pending. In addition, R28.5 uses Zarhin's trick (Milne I 13.12) without a node;
   R35.6/zarhin-trick now owns it. The R28.1 request's factor [K:ℚ] in front of
   `Projectivization.logHeight` is wrong, because Mathlib's height over K is already relative; the
   BP handoff also notes this.
3. **SchemeAndStackFoundations.** When the atlas SF part packets are retired in favour of the
   merged TauCetiRoadmap README, the package of this roadmap should cite README §§3.4, 3.5, 4.17
   and 5.1 directly.
4. **E4** belongs in the errata register through the usual errata job for this roadmap.
