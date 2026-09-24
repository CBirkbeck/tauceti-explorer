# RT-AUDIT-09

Red team against the accepted library audit `AUDIT-09` (reviewed by REV-AUDIT-09, 16 September 2026), issue #1568. By Claude Code, session `cc-38267a`, 24 September 2026. This session took no part in the audit or its review.

The audit covers five roadmaps:
- Complex multiplication and explicit reciprocity (CM.0–CM.6);
- Effective Diophantine methods (ED.0–ED.6);
- Faltings finiteness (R28.1–R28.6);
- Heights, rational points and obstructions (RP.0–RP.6);
- Inverse Galois theory and arithmetic fundamental groups (IG.0–IG.6).

That is 34 layers and 136 targets (105 absent, 30 partial, 1 in Mathlib), with 290 cited declarations and 104 duplicate entries.

**23 findings: none high, 8 medium, 15 low.** No target's status changes and every layer verdict holds. The findings are in `RT-AUDIT-09.result.json`, each with its evidence and a fix a worker can apply.

## How it was checked

- **Existence of every citation.** I built a fresh declaration index of the pinned trees with `research/blueprint/index_declarations.py`: Mathlib 082e2d3 (246,008 declarations) and Tau Ceti f790474 (70,802). All 290 citations (245 distinct declarations) exist at the cited file, within three lines of the cited line. The two the index cannot see because of its namespace reconstruction were opened by hand.
- **Content.** Three checkers split the roadmaps: CM with R28, ED with RP, and IG. For every declaration they opened the file at the line, read it with the section's variable lines, and compared it with its target, note and fit label. They searched both trees by concept and synonym for every absent target, and read every stage description and every duplicate entry. They also swept all 1968 atlas stage descriptions and the six new roadmaps for missed duplicates. I re-checked each finding I relied on against its quoted source.

## Medium findings

1. **CM.5: "The endomorphism ring of a Weierstrass curve exists in Tau Ceti" is false.** `Isogeny.Hom W W` is a monoid with zero and an additive group. Only (g + g')∘f = g∘f + g'∘f is proved; there is no `comp_add` and no ring instance. The source says the ring structure "is not built here". A design reading the note would treat End(E) as available.
2. **IG.6 misses an input Tau Ceti already proves.** `NumberField.iSup_inertia_eq_top` shows that inertia generates the Galois group of a number field over ℚ. That is exactly the input Mathlib's Morse-polynomial TODO asks for, and its own docstring says so. The note calls the number-field specialisation a TODO.
3. **IG.5 misstates the nearest notion to a regular extension.** At field level it is `IsIntegrallyClosedIn k F`, which Tau Ceti identifies with `algebraicClosure k F = ⊥` and shows forces linear disjointness from separable constant extensions. BelyiMaps already uses it as its regular-extension hypothesis.
4. **IG.4 and IG.6 miss a duplicate.** PolynomialGaloisGroups Layer 6 certifies Galois labels over ℚ in degree ≤ 5, including C₃, C₄, C₅, D₄ and D₅, with worked quintics.
5. **IG.5 and RP.4 miss LV.8** of the new MordellLawrenceVenkatesh roadmap. LV.8 builds Hurwitz spaces of singly ramified covers by Riemann existence, descends them, and constructs the Kodaira–Parshin family. It does not import IG.5.
6. **RP.4 misses LV.11**, which proves Faltings's theorem by the Lawrence–Venkatesh route and fixes RP.4's statement as its own final statement.
7. **ED.4 misses LV.3**, Strassmann's theorem.
8. **R28.5 misses LV.1**, Faltings's finiteness lemma (Brauer–Nesbitt with the Faltings–Deligne test set). That is the finite-Frobenius-data step of Satz 5.

## Low findings

- **Uncited declarations, each correcting a note:**
  - `Isogeny.Hom.comp_eq_zero_iff`, for "End without zero divisors" in CM.1, which cites only `instNontrivialEnd`;
  - `Scheme.Hom.image`, for the scheme-theoretic closure in R28.3;
  - finiteness of K(S,n), for "the only finiteness theorem of this shape" in R28.5;
  - `structureConstant`, for the product-one triple count in IG.3;
  - the profinite fibre-functor equivalence and Mathlib's profinite completion, for "no Ẑ" in IG.0.
- **Fit labels and misdescriptions:**
  - RP.1's two 2-descent lemmas are labelled "exact"; they are general lemmas, and ED.3 labels the same two "special case".
  - RP.1's note misdescribes `fg_point`, whose hypotheses are per-factor, not on the base.
  - CM.0's parenthetical "reflex occurs only in category-theoretic names" is false.
- **Duplicates:**
  - R28.2 is missing HodgeTate T0 and ModularCurves 7E. Its R11.6 entry is a supplier, not a duplicate.
  - CM.5 is missing ModularCurves 7E's supersingularity predicate.
  - CM.4 is missing AutomorphicPadicLFunctions L0 and AF.5 for infinity types and conductors.
  - R28.4 and CM.4 are missing the Tate-module layers, EllipticCurves Layer 2 and A4.
  - ED.5 is missing EllipticCurves Layer 4's reduction map.
  - ED.2 is missing two p-adic logarithm layers, DirichletPadicLFunctions L3 and ColemanIntegration L0.
  - IG.3 is missing BelyiMaps Layer 1 on passports.

## What held

- **Citations.** All 290 citations exist where stated, and apart from the findings their fit labels and notes are accurate.
- **Absent targets.** Every other absent target was confirmed absent by concept search. Among them:
  - the j-function and class polynomials, general orders with Pic finiteness, CM types and reflex norms;
  - Hecke characters, Tate modules and class fields beyond the genus field;
  - Néron models and p-divisible groups;
  - LLL, Baker bounds and the p-adic logarithm for ℚ_p;
  - Sha, Chabauty/Coleman, Brauer–Manin and adelic points;
  - Hilbert irreducibility, Riemann existence, rigidity and embedding problems, and the étale π₁.
- **Verdicts and duplicates.** Every layer verdict is consistent with its targets. All other duplicate entries match the named stage text.
- **Decomposition.** The reviewed Faltings decomposition's one library name, `NumberField.finite_of_discr_bdd`, agrees with the audit.
- **Near misses rejected as consumers or out of scope:** AutomorphicPadicLFunctions L3, ShimuraData D5, PELModuli M5, A5, DWP.1, R29.5, R14.6, ModularForms Layer 11, R18.3, the adic finite-étale sites, HL.6, NC.2, DY.5 and DY.6, TB.6, LV.6 and JacobianChallenge.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-AUDIT-09.result.json`: ok.
- Lean: none. A red team of a library audit has no Lean deliverable.
