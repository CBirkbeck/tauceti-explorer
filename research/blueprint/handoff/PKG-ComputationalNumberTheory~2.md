# Handoff: PKG-ComputationalNumberTheory~2

Claude (Opus), session `claude-JBqeYe`, 14 October 2026. Refs
[#9162](https://github.com/CBirkbeck/tauceti-explorer/issues/9162). Branch `claude-JBqeYe-pkg-cnt2`.
Revision round 2 of the package; the review object in `review.json` is left in place for the next
reviewer. No packet was edited.

## What changed

- **README.md** rewritten in the binding upstream form (PACKAGE_REVIEW.md, "README in TauCetiRoadmap
  form" and "Shape of a roadmap (2026-10-12)"): `# Roadmap:` title with a `**Summary.**`
  paragraph, *Scope and ownership*, *Conventions*, *Exact supplier contracts* (Mathlib pin, Tau Ceti
  pin, TauCetiRoadmap layers, lower-tier roadmaps), *How to read the build*, then `## Layer CN.k`
  sections with one `### k.n` subsection per target (statement, API list, *Construction* /
  *Method* / *Proof sketch* with locator and *Needs:*, **Checks.**), each layer closing with
  `### Examples` and `### Dependencies`, then *Downstream consumers* and *References*. All 108
  targets of the accepted plan are kept with their statements, APIs, tests and locators; 21 targets
  are new (below), 129 in all.
- **Suggested.lean** rewritten to the 2026-10-12 shape: 1,151 lines, 142 declarations, `import
  Mathlib` plus seven pinned Tau Ceti modules, one namespace `TauCetiRoadmap.ComputationalNumberTheory`,
  real-bodied light definitions only (`ramStep`, `PrattCertificate.check`, `prattBitSize`,
  `PocklingtonCertificate.check`, `aksParameter`, `multiplierRing`, `classRelationLattice`,
  `phiExpansion`, `coefficientValuation`, `intervalMul`, `intervalInv`, `dyadicHull`,
  `uniqueInteger`, `ctTailKernel`, `checkNegativeGram`, …), the end theorems and layer milestones
  proved by `sorry`, discriminating `example`s (several closed by `decide`, `rfl` or `norm_num`:
  floor division in `ramStep`, the Pratt tree for 3 and its size 7, Pocklington for 17,
  `aksParameter 9 = 3`, `35830422465487817813321292 ≡ −1 (mod 107)`), and a closing comment listing
  the 29 README targets whose statements need constructions that are themselves targets. The old
  file had sorry'd data definitions (`ramStep`, `PrattCertificate.check`, `aks`, …) and test-name
  comments; none remain. No existence statement is used where it would be vacuous: the Dirichlet
  `L`-value enclosure (4.20) is an algorithm whose existence form holds for any complex number, so it
  is a README target only.
- **metadata.toml** unchanged (`topic = "math.NT"`).

## The review's blocking finding (ED.3 is an upward input) — resolved by moving the notion down

The accepted plan imports the CN.3 target "isogenies, finite-field normalization and descent" with
EffectiveDiophantineMethods ED.3 (tier 17) as supplier of the local-image and saturation service.
Following WORKERS.md ("the notion moves down"), CN.3 now plans that service itself, on Tau Ceti's
pinned `x − T` descent API and on HeightsRationalPointsAndObstructions RP.1 (tier 9) for the local
index of multiplication by two:

| New CN.3 target | Replaces (ED.3 node) |
| --- | --- |
| 3.18 `LocalImageCertificate` (Suggested: `localImageSpan`, `localImageSpan_le_range`) | `ED.3/local-descent-image` |
| 3.19 `LocalImageCertificate.eq_range_of_isComplete` (Suggested: `localImageSpan_eq_range_of_card_padic`, `_real`) | `ED.3/local-image-completeness`; the index count is `RP.1/local-division-index` (so `ED.3/local-quotient-cardinality` is not needed in CN) |
| 3.20 `exists_complete_localImageCertificate` (existence and terminating search) | proof step 3 of `ED.3/local-descent-image` |
| 3.21 `localImage_of_good_odd` | `ED.3/good-place-local-image` |
| 3.22 `IsPSaturated` | `ED.3/p-saturated` |
| 3.23 `isPSaturated_iff_forall_not_dvd`, 3.24 `mem_nsmul_iff_exists_root`, 3.25 `saturationSieve_sound`, 3.26 `pSaturationTest` | `ED.3/saturation-certificate` (sound, complete and terminating: Siksek's reduction to finitely many equations (39), an exact `p`-divisibility test by division polynomials using Tau Ceti `mul_eval_ΨSq_eq_eval_Φ_of_zsmul`, and the reduction sieve (40)) |

For the maintainer: the RS-03 link `EffectiveDiophantineMethods:ED.3 → ComputationalNumberTheory:CN.3`
and its owner entry "New certified local-image, saturation and descent procedures → ED.3" should be
reversed (CN.3 → ED.3); the ED.3 nodes in the left column should import the CN.3 targets; the CN
packet's request to ED.3 and its gap "Elliptic local-image and saturation supplier pending" are
discharged by these targets. ED.3 keeps 2-Selmer groups, rank bounds, heights, index bounds and
Mordell–Weil bases (it already consumes CN.2 and CN.4 nodes).

## Further upward or tierless citations removed

- **FiniteFieldsAndCharacterSums has no tier** (it drops out of the Caraiani–Newton order; see
  `research/blueprint/upstream/drops.json`), so its FF.0/FF.3 nodes cannot be cited by a tier-15
  package. Moved down: 0.15 `RabinCertificate`, 0.16 `FiniteFieldPresentation`, 0.17
  `presentationChange` (from `FF.0/certified-presentation-of-a-finite-field`,
  `presentation-embedding-from-root`, `presentation-change-isomorphism`); 1.22–1.24
  `FiniteFieldFactorCertificate` with soundness and completeness (from
  `FF.3/factorization-certificate(-sound)`); 1.26 `henselLift` (from
  `FF.3/hensel-lifting-modulo-prime-powers`); 3.17 `pointCount_eq_charSum` (from
  `FF.3/naive-point-count`, `point-count-certificate-sound`; the naive count itself is Tau Ceti's
  pinned `WeierstrassCurve.pointCount`). The Rabin certificate builds on TauCetiRoadmap
  PolynomialGaloisGroups Layer 5, which proves the orbit lemma but explicitly has no certificate.
  RS-03's owner entries for finite-field presentations and for finite-field factorization/Hensel/
  point counting should now name CN.0/CN.1/CN.3, with FF importing them.
- **GN.5 (tier 3) does not supply the enumeration**: the GN package (now a TauCetiRoadmap pull
  request) is LLL only, although the GN.5 part packet has `fincke-pohst-enumeration` and
  `fincke-pohst-complete`. CN.4 now plans 4.26 `fpEnumeration` and 4.27 `fpEnumeration_complete`
  (de Weger 1989, §3.6 and Figure 2, pp.51–52) and `effectiveEllipsoidCover` uses them. If the GN
  roadmap adds Fincke–Pohst, these two targets become a citation.
- **CA.3 kernel basis**: CA.3 has no finite-field kernel algorithm; Tau Ceti's pinned
  `TauCeti.kernelBasis` (with `mulVec_eq_zero_of_mem_kernelBasis`, `span_kernelBasis`,
  `linearIndepOn_kernelBasis`) supplies it, so the request is discharged by the library.
- **CA.3 convex hull**: not needed; `IsPhiNewtonSide` is certified by its inequalities alone, and the
  stray prerequisite was dropped.
- **ModularForms Layer 8 eigensystem lift**: not there; AlgebraicModularFormsAndSerreWeights
  R15.5 `deligne-serre-eigenvalue-lifting-lemma` (tier 12) is cited instead (3.10, 3.11, 3.14,
  3.16). Layer 7 (general-level smoothed evaluation), Layer 8 (finite Manin presentations) and
  Layer 9 (label identification) are not needed by any target: the cusp-form enclosure is stated at
  level one, and `modularDataEqual` takes its two coefficient-binding proofs as hypotheses.
- **LevelOneAutomorphicFormsForClassicalGroups** (not in the order) is mentioned only as a downstream
  consumer of `ctExplicitFormula`; no target uses the identification with intrinsic functionals.
- New local-field targets used by CN.3: 2.23 `isSquare_iff_isSquare_mod` (Milne ANT Theorem 7.32,
  Newton's lemma, p.120) and 2.24 `card_padicRoots_eq` (Milne ANT Proposition 8.2, p.136).

## Duplication check (current TauCetiRoadmap, Tau Ceti a91d3aaf, Mathlib pin)

No exact duplicates. Partial overlaps are stated in *Scope and ownership*: current Tau Ceti's
`NumberFieldOrder.multiplierRing` and `NumberFieldOrder.isIntegral` (not at the pin),
`IntegralPrimitiveElement.not_dvd_index_iff` (Dedekind's criterion, monogenic case), and Mathlib's
`NumberField.Units.regOfFamily_div_regulator` (of which `units_complete_of_regulator_bound` is the
stopping corollary). EllipticCurves Layer 6 owns explicit 2-descent and the 2-Selmer rank bound but
no local-image certificates or saturation, so 3.18–3.26 do not duplicate it.

## Plan mistakes noticed (packets unchanged)

- `ED.3/local-descent-image` tests squares at `p = 2` by "the unit part read modulo 8 in each L_j";
  that is right for `L_j = ℚ_2` only. The correct test in a finite extension `L/ℚ_2` is modulo
  `4π_L` (README 2.23).
- The CN packet's request to GN.5 says no exact enumeration is exported; the GN.5 part packet has
  one, but the GN package omits it (see above).
- The CN packet's request text to ED.3 says ED.3 is `not_read`; ED.3 is now planned (review
  `needs_changes`), and is tier 17 in any case.

## Sources read for the new targets

Shoup, *A Computational Introduction to Number Theory and Algebra* v2 (printed = PDF − 18): Exercise
20.2 p.524, Theorems 19.10 p.513 and 19.14 pp.515–516, §§20.1–20.5 pp.523–544. Milne, *Algebraic
Number Theory* v3.08 (printed = PDF − 2): Theorem 7.32 p.120, Theorem 7.33 and Lemma 7.34 p.121,
Remark 7.37 p.122, Proposition 8.2 p.136. Sutherland, 18.783 (2023) Lecture 7, §7.2 eq. (1), p.2.
Cremona, *Algorithms for Modular Elliptic Curves* Ch. III (printed = PDF + 61): §3.3 pp.69–70,
§3.6 p.80. Flynn–Poonen–Schaefer arXiv:math/9508211v1, §7 Lemmas 3–4, pp.16–17. Siksek, *Infinite
descent on elliptic curves* (author preprint), §4 pp.17–19, equations (39)–(41). de Weger, CWI
Tract 65 (printed = PDF − 7), §3.6 and Figure 2, pp.51–52.

## Checks run

- `lean-check research/blueprint/packages/ComputationalNumberTheory/Suggested.lean`: exit 0 at
  Mathlib 082e2d3 and Tau Ceti f790474; 86 warnings, all `declaration uses 'sorry'`; no other
  warnings or errors.
- `python3 scripts/check_sorry_data.py` on Suggested.lean: no offenders.
- `python3 research/blueprint/intake.py check-files` on the three package files and this note: 0
  problems.
- Every `(README k.n)` in the Lean docstrings and every `` `name` (k.n) `` cross-reference in the
  README checked against the section headings by script.
- Banned words (optional/deferred/later) and process vocabulary: none in README.md.
- A full mechanical proofread (cross-references, anchors, *Needs* lists against layer order and
  admissible roadmaps, at least three Checks per definition, README-versus-Lean hypotheses,
  markdown) found no forward reference and no inadmissible citation; its other findings were fixed
  (a table without blank lines in 4.17, a stray `*`, missing hypotheses in five Lean signatures,
  the soundness conclusion `c.value = z` of 1.20, wording that called unconditional formulas
  conditional, missing *Needs* entries in 2.7, 3.15, 3.16 and 4.19). It also recomputed the
  coefficient of `q^107` in `ΔE₄²E₆`, its residue `−1` modulo 107, and the vanishing of the `T_p`
  determinant modulo `p` for all 16 pairs of 3.13, and reproduced the list of 3.12 by search over
  `p ≤ 79`.
