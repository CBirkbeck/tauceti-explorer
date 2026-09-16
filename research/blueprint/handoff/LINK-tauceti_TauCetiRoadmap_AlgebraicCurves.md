# LINK-tauceti_TauCetiRoadmap_AlgebraicCurves: handoff

**Status:** `complete`. The whole catalogue has been screened, and `python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_AlgebraicCurves.json` reports 0 errors and 0 warnings.

**Output:** `research/blueprint/links/tauceti_TauCetiRoadmap_AlgebraicCurves.json`. It contains:

- **50 links**: 44 out of AlgebraicCurves and 6 into it; 46 explicit and 4 inferred.
- **11 overlaps**: 9 rescope, 2 keep, no merge.
- **212 examined entries**: all 211 other atlas roadmaps plus the new roadmap `MordellLawrenceVenkatesh`.

There was no earlier checkpoint for this job. Only the links file and this note were written. No git command was run.

## Inputs

- **Atlas.** `data/atlas.json`, edition `2026-09-15-comprehensive-roadmap-revision`, sha256 `62ab6c2c…61c56`.
  - The atlas records **no `stageEdges` into or out of any AlgebraicCurves stage**.
  - The declared roadmap edges are AlgebraicCurves → VectorBundlesAndIsocrystals and AlgebraicCurves → WeilConjectures, both from campaign upstream aliases with stageCount 0.
  - Two pseudo-stage edges exist: `UPSTREAM:AlgebraicCurves → WeilConjectures:WC.5` and `UPSTREAM:AlgebraicCurves-vector-bundles → SchemeKTheoryOperations:KU-geometry`.
- **Focal document.** sha256 `8696d432…a7a5`, 1,410 lines, read in full: conventions, all 13 layers, worked examples, ordering, contract table and coordination. The 13 stage descriptions are verbatim slices of it.
- **New roadmaps.** `research/blueprint/roadmaps/MordellLawrenceVenkatesh.json`, sha256 `e93a1dbc…8ede`.
- **Other link packets at this revision.** Only StandardDistributions and UniversalCovers are present, and neither touches AlgebraicCurves.
  - ⚠ The handoff `LINK-tauceti_TauCetiRoadmap_ModularCurves.md` describes a complete ModularCurves packet containing AlgebraicCurves Layers 7, 8, 9, 12 → ModularCurves Layer 10.
  - That packet is **not** in `research/blueprint/links/` at this revision, so those four links are recorded here too, with identical endpoints. Deduplicate when the ModularCurves packet is merged.
  - The overlap proposal for EllipticKTheory E.1 and ModularCurves 2A below agrees with that handoff's items 5 and 16.

## Method and read scope

1. **Own stages.** Each layer's inputs and outputs were written down before searching. A condensed inventory appears at the end of this note.
2. **Candidate search.** All stage descriptions and documents were dumped to text. Keyword searches covered:
   - function field, Riemann–Roch, genus, Hurwitz, Weil differential, repartition, place(s), divisor, canonical divisor/class, dualizing sheaf;
   - hyperelliptic, plane curve, Weierstrass gap/point, Clifford, Artin–Schreier, the different, ramification index, residue degree;
   - constant field, Cl⁰, class number, Jacobian, Picard, curves over finite fields, projective/proper/regular curve, Goppa/AG codes;
   - RatFunc, rational function field, Lüroth, Kähler differentials, residue theorem, Weil reciprocity, strong approximation;
   - Stichtenoth, Rosen, Belyi, stable reduction, and every spelling of "AlgebraicCurves".

   Every hit was read in context, and all 212 roadmap summaries were read.
3. **Full reads of candidate stages.**
   - **Whole documents or every stage:** EllipticCurves, JacobianChallenge, FunctionFieldArithmetic, SchemeAndStackFoundations, EllipticKTheory, WeilConjectures, ColemanIntegration, FiniteFieldsAndCharacterSums, EllipticCurveModularity, MordellLawrenceVenkatesh, VectorBundlesAndIsocrystals, InverseGaloisAndArithmeticFundamentalGroups, ComplexComparisonPartII, FuchsianOrbifolds.
   - **Targeted full-stage reads:**
     - BelyiMaps: boundaries, conventions, supplier table, Layers 9–12.
     - ModularCurves: Scope, 2A, Layer 10, Mazur interface.
     - ModularForms: Layer 10A–C.
     - StableReduction: Layers 0–6 and the supplier contracts.
     - LocalFieldsRamification: Layer 3.
     - NumberFieldArithmetic: Boundaries and Layers 3–6.
     - K2SymbolsBrauer: T.4.
     - ArithmeticGaloisRepresentations: R01.6.
     - DrinfeldModulesAndTModules: DM.0, DM.6.
     - SchemeKTheoryOperations: S.7 and the KU checkpoints.
     - DeligneWeightsAndPurity: DWP.1.
     - HeightsRationalPoints: RP.4.
     - EffectiveDiophantine: ED.4.
     - TropicalAndBerkovich: TB.2–TB.3.
     - ExcursionOperators: ES7.
     - EndoscopicTransfer: ET.2b.
4. **Decisions.** Each candidate pair was decided on the full descriptions. `examined` notes say what was read. A `none` result means no edge within that read scope.

## Links

### Into AlgebraicCurves (6, all explicit; AlgebraicCurves names each supplier)

| Supplier | Consumer | Content |
|---|---|---|
| EllipticCurves L0 | L10 | `toClass_surjective`, closing E(k) ≅ Cl⁰ |
| EllipticCurves L1 | L9 | the invariant differential in Ω[W.FunctionField⁄K] |
| EllipticCurves L1 | L12 | the isogeny type, used in 12C's isogeny/scheme-morphism instance |
| JacobianChallenge A | L12 | 𝒪_X(D), Weil/Cartier divisors, Cl(X) ≅ Pic X |
| JacobianChallenge B | L12 | coherent cohomology, g = dim H¹, χ-form RR, Serre duality |
| LocalFieldsRamification L3 | L8 | upper numbering, Herbrand, Hasse–Arf (finite residue fields) |

### Out of AlgebraicCurves (44; 4 inferred)

- **BelyiMaps (18).**
  - L0, L1, L3, L5, L6, L8, L12 → Layer 9.
  - L0, L3, L5, L6, L7 (*inferred*), L8 → Layer 10.
  - L3, L8 → Layer 11.
  - L6, L7, L8 → Layer 12.
- **EllipticCurves Layer 0 (4).** L0 (places), L2 (Dedekind bridge), L3 (divisors, product formula), L6 (inducedPlace and the fundamental identity).
- **ModularCurves Layer 10 (4).** L7, L8, L9, L12. These duplicate the pending ModularCurves packet; see above.
- **SchemeAndStackFoundations SF.3 (3).** L3, L4, L12.
- **K2SymbolsBrauer T.4 (3).** L0 and L12 explicit; L1 *inferred* (places of F(t), including ∞).
- **FiniteFieldsAndCharacterSums FF.4 (3).** L3 (L(G), evaluation codes), L4 (Ω_F(G−D), residue codes), L5 (local components ω_P(1)).
- **FunctionFieldArithmetic (2, both *inferred*).** L5 → FA.2 (completions at places); L5 → FA.5 (zeta-free inputs to the RR rationality route).
- **MordellLawrenceVenkatesh LV.7 (2).** L3, L12. LV.7's `requires` list names both; they are not in the atlas.
- **One each:**
  - L12 → EllipticKTheory E.1.
  - L12 → WeilConjectures WC.5. This refines the pseudo-stage edge.
  - L9 → ColemanIntegration L1.
  - L12 → ArithmeticGaloisRepresentations R01.6.
  - L12 → EllipticCurveModularity R29.6.

Confidence follows the job instruction: a link is **explicit** when either text names the other roadmap or stage. For EllipticCurves, AlgebraicCurves names it but EllipticCurves never names AlgebraicCurves. For ModularCurves, SchemeAndStackFoundations, EllipticKTheory, WeilConjectures, K2SymbolsBrauer, ColemanIntegration, FiniteFieldsAndCharacterSums, ArithmeticGaloisRepresentations, EllipticCurveModularity and MordellLawrenceVenkatesh, only the consumer names AlgebraicCurves. Both texts name each other only for BelyiMaps, JacobianChallenge and LocalFieldsRamification. Each link carries at least one verbatim quote per side, and all quotes were machine-checked.

## Overlaps and restructuring proposals

No merge is recommended. All proposals are stage-level rescopes, except two keeps.

1. **AlgebraicCurves L10 ↔ EllipticCurves L0 (rescope).**
   - *Duplicated:* the Weierstrass dictionary — Dedekind/integrally closed coordinate ring (10.ii), Point ≃ degree-1 places (10.iii), and the class-group/principal-divisor identification (10.iv with Prop. 6.1.6–6.1.7).
   - *Proposal:* EllipticCurves L0 owns (a)–(c), built on AlgebraicCurves L0/L2/L3. AlgebraicCurves L10 keeps intrinsic genus-1 theory and 10.i, and cites EllipticCurves for (ii)–(iv). Otherwise the EllipticCurves foundation would wait on AlgebraicCurves' late Layer 10.
2. **AlgebraicCurves L9 ↔ EllipticCurves L1 (rescope).**
   - *Duplicated:* dim Ω[F⁄K] = 1.
   - *Proposal:* split AlgebraicCurves L9's first subsection (dim_F Ω[F⁄k] = 1, basis dx; needs L0–L3 only) into its own stage so EllipticCurves L1 can consume it. The EllipticCurves compatibility milestone stays late. A single stage cannot both feed and consume EllipticCurves L1 without a cycle.
3. **AlgebraicCurves L4 ↔ JacobianChallenge B (keep).** Two Riemann–Roch routes, reconciled by 12E.
4. **AlgebraicCurves L12 (12D) ↔ JacobianChallenge A (rescope).**
   - *Proposal:* 12D takes Weil divisors and degree from JacobianChallenge A, or from Mathlib's AlgebraicCycle, and proves only the comparison with Divisor k F.
   - Name 12A's regular "curve over k" and relate it by one lemma to JacobianChallenge's smooth proper geometrically connected curve.
5. **AlgebraicCurves L4 ↔ ModularForms 10B (keep).** Analytic and function-field Riemann–Roch; the comparison is owned by BelyiMaps 9.5.
6. **FunctionFieldArithmetic FA.0 ↔ AlgebraicCurves L0, L12 (rescope).** FA.0 should consume the anti-equivalence and constant-field results.
7. **FA.1 ↔ AlgebraicCurves L3, L4, L5, L9 (rescope).** FA.1 should consume divisors, RR, finite Cl⁰ and residues. Layer 5's finite-constant-field subsection was written for this consumer.
8. **FA.3 ↔ AlgebraicCurves L6, L7, L8, L10 (rescope).** FA.3 should consume extension theory, the different/Hurwitz, ramification groups and the Kummer/Artin–Schreier calculus. It keeps discriminant, upper numbering and Witt vectors.
9. **AlgebraicCurves L12 ↔ EllipticKTheory E.1 ↔ ModularCurves 2A (rescope).**
   - Promote 12C's Weierstrass isogeny/scheme-morphism correspondence from acceptance instance to a named milestone, consuming ModularCurves 1A/2A's projective model and function-field identification.
   - E.1 imports ModularCurves and 12C, and keeps only the zero morphism and its K-theory-facing identifications.
10. **AlgebraicCurves L7, L8 ↔ LocalFieldsRamification L3 (rescope).** Tame different, Hilbert's formula and the G_i structure are proved twice.
    - *Proposal:* state LocalFieldsRamification L3's theorems for complete discretely valued fields with separable residue extension (Serre LF III–IV generality). AlgebraicCurves L7–L8 consume them at completions.
11. **AlgebraicCurves L7, L8 ↔ NumberFieldArithmetic L5, L6 (rescope).** Global-to-local transport is proved twice: the different localizes, global ramification groups match the local filtration, and the tame exponent follows.
    - *Proposal:* prove it once for Dedekind AKLB extensions with separable residue extension. NumberFieldArithmetic's own 6.4 note calls this the missing generic theorem.

## Supplier gaps found (for the orchestrator)

1. **BelyiMaps 10.6 and 12.4** attribute *full faithfulness of base change along ℚ̄ ⊂ ℂ (characteristic zero)* to AlgebraicCurves Layer 8. Layer 8 treats only **algebraic** constant-field extensions F·k″. Either AlgebraicCurves Layer 8 gains a milestone for base change along extensions of algebraically closed characteristic-zero fields, or BelyiMaps owns it. The links L8 → B10 and L8 → B12 record what Layer 8 does supply and state the gap in their reasons.
2. **BelyiMaps' supplier table** files `AlgebraicCurves.riemannRochSpace` and `AlgebraicCurves.genus` under "Layer 5"; AlgebraicCurves builds both in Layer 3. The links to Layers 9, 10 and 11 cite Layer 3, and Layer 5 where its consequences are used.
3. **BelyiMaps 10.4** cites AlgebraicCurves Layer 6 for a *finite branch set*. Finiteness of the ramification locus is a Layer 7 output (finite support of Diff). This is recorded as an inferred L7 → B10 link.
4. **ColemanIntegration** names AlgebraicCurves "for algebraic differentials and de Rham complexes". AlgebraicCurves has function-field Kähler differentials and residues (L9) but no de Rham complex or de Rham cohomology.
5. **SchemeKTheoryOperations KU-geometry** requires `UPSTREAM:AlgebraicCurves-vector-bundles`. AlgebraicCurves has no vector bundles; line bundles are JacobianChallenge's. No link.
6. **VectorBundlesAndIsocrystals.** The declared roadmap-level edge from AlgebraicCurves has no stage-level support: its "algebraic-curve APIs" concern the Fargues–Fontaine curve. No link.
7. **AlgebraicCurves' contract table** omits several consumers named here: ModularCurves L10 (Layers 7–9, 12), SchemeAndStackFoundations SF.3, EllipticKTheory E.1, WeilConjectures WC.5, K2SymbolsBrauer T.4, ColemanIntegration, FiniteFieldsAndCharacterSums FF.4, ArithmeticGaloisRepresentations, EllipticCurveModularity, MordellLawrenceVenkatesh LV.7, and FunctionFieldArithmetic, which is its anticipated CurvesOverFiniteFields consumer.

## Candidates considered and not recorded

- **AlgebraicCurves 12E → JacobianChallenge E (dim Jac = g).** AlgebraicCurves claims JacobianChallenge's acceptance "consumes this roadmap's genus through that contract". JacobianChallenge defines g := dim H¹(X, 𝒪_X) itself, so no use is stated.
- **AlgebraicCurves L0 (weak approximation) → EllipticCurves L2 (moving divisors for the Weil pairing).** A one-step deduction, not an exact stated output. EllipticCurves' Weil reciprocity is not supplied by AlgebraicCurves.
- **EllipticCurves L0.5 ↔ AlgebraicCurves L8.** Base change over arbitrary K vs perfect k with algebraic extensions; not the same statements.
- **EllipticKTheory E.7** ("torsion-divisor functions with Riemann–Roch"). The supplier is ambiguous among E.2's Pic⁰(E) ≃ E(F), EllipticCurves L0's principal-divisor characterisation, and AlgebraicCurves L10.
- **SchemeKTheoryOperations S.7** ("scheme divisor and cycle constructions shared with AlgebraicCurves/JacobianChallenge"). S.7 needs Chow groups on regular schemes, which AlgebraicCurves does not supply.
- **ComplexComparisonPartII C4** (smooth projective completion "by projective closure and normalization (R09.3 and the existing curve normalization theory)"). The supplier is unnamed, and AlgebraicCurves 12B–12C does not state the open embedding of an affine curve into its regular model.
- **MordellLawrenceVenkatesh LV.7**'s d_q = (q − 1)(g − ½) implicitly needs Riemann–Hurwitz, but it is not listed as an input. **HeightsRationalPointsAndObstructions RP.4**'s Parshin covering controls ramification without naming a supplier. **EffectiveDiophantineMethods ED.4** uses dim H⁰(Ω¹) = g implicitly.
- **FuchsianOrbifolds L5** (topological Riemann–Hurwitz) ↔ AlgebraicCurves L7. Different objects and proof; boundary stated on the FuchsianOrbifolds side.
- **StableReduction** (regular models over DVRs, nodal curves, genus = dim H¹): entirely scheme-level on JacobianChallenge contracts.
- **ModularCurves 2A**'s general lemma (fibre length = function-field degree for finite morphisms of smooth projective curves). Not stated by AlgebraicCurves; folded into overlap 9.
- **DrinfeldModules, GlobalShtukas, ExcursionOperators ES7, AdelicAlgebraicGroups.** Function-field inputs come from FunctionFieldArithmetic, not AlgebraicCurves.

## Own stages: inputs and outputs (condensed)

- **L0.** IsFunctionField; constant field k̃ finite and F/k̃ exact; normalized places; 𝒪_P a DVR; ord_P; F_P and deg P finite; existence of places; weak approximation; finiteness of zeros and poles.
- **L1.** Places of k(x) ≃ monic irreducibles ⊕ {∞}; degrees; ord computations.
- **L2.** Finite normalization R_x (no separability needed); places ↔ HeightOneSpectrum R_x; two charts; holomorphy rings.
- **L3.** Finsupp divisors, degree, div f, product formula; Cl, Cl⁰; L(D), ℓ(D); genus (sup definition); Riemann's theorem; i(D); k(x) computations; affine bridge Cl⁰ ≅ ClassGroup R_x.
- **L4.** Repartitions A_F(D); local quotient engine; i(D) = dim A_F/(A_F(D)+F); Weil differentials with dim_F = 1; (ω) and W; duality; Riemann–Roch; ℓ(W) = g, deg W = 2g − 2; uniqueness of RR data.
- **L5.** deg ≥ 2g − 1 regime; genus-1 ladder; genus 0; strong approximation; Weierstrass gaps; Clifford for infinite k; finite-k class number (bounded-degree counts, Finite Cl⁰); local components and the abstract residue theorem; η on k(x); completions at every place.
- **L6.** Extension setup; e, f; conorm and degree identity; geometric degree; fundamental identity; holomorphy rings and local integral bases; Kummer's theorem (A/B); Galois transitivity and decomposition groups.
- **L7.** Complementary module and different exponent; Diff; Dedekind's theorem with the tame value via a complete local route; cotrace; (Cotr ω) = Con(ω) + Diff; transitivity; Hurwitz genus formula (cross-multiplied); tame corollaries; RH for y² = f(x).
- **L8.** Constant-field extensions with perfect k (genus invariance, ℓ preserved, Clifford for all k); inseparable counterexamples; decomposition/inertia/lower ramification groups and Hilbert's formula; completion bridge; Abhyankar and composita; purely inseparable steps; genus bounds (Castelnuovo, Riemann, plane model).
- **L9.** dim_F Ω[F⁄k] = 1 with basis dx; local expansions k((T)) and residues; transformation formula; Δ_F ≅ Ω_F (k perfect); (dx) = −2(x)_∞ + Diff; residue theorem; EllipticCurves invariant-differential milestone.
- **L10.** Elliptic function fields, normal forms and group law; Mathlib compatibility (i)–(iv); hyperelliptic fields and genus formula; smooth plane curves with g = (d−1)(d−2)/2; Kummer and Artin–Schreier covers.
- **L11.** Aut(F/k) actions; fixed fields; PGL₂; rigidity; Weierstrass points (Wronskian, char 0); finiteness for g ≥ 2; Hurwitz bound 84(g−1); Hermitian wild counterexample.
- **L12.** 12A curves, ord_x, closed points = places. 12B X_F = normalization of ℙ¹_k in F; regular and projective. 12C anti-equivalence. 12D Weil divisors on X_F ≅ Divisor k F. 12E comparison contract with JacobianChallenge A–B.

## Resumption

Nothing remains for this job. A reviewer can re-run `python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_AlgebraicCurves.json`. Every quote is a whitespace-normalised verbatim substring, as the checker requires.
