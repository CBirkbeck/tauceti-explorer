# Review: Polylogarithms (Polylogarithms, explicit regulators and Zagier statements), stages P.1–P.6

Job `REV-Polylogarithms` (issue #140), by Claude Code, session `cc-442dc5`, 24 September 2026. The packet was written by Claude Code, session cc-7b31c4 (`BP-Polylogarithms`, PRs #2780 and #2877). I had no part in it. **Status: accepted**, after the corrections below, which were made in place. The packet stays `partial`: P.1 is `source_decomposed`, P.2 to P.6 are `partial`, and the open points are recorded as 17 gaps and 19 requests.

## What was checked

- **Sources.** The three SHA-256 sums in the packet were re-checked and match: GR arXiv v3 (9a644392…), Goncharov arXiv v3 (ac729924…, and the e-print TeX fa6ea897…), and the K-book (a04f53c9…). Four further texts were read and added:
  - **GR arXiv v5** (15 July 2026, the final version, accepted by the Annals; d7694f41…). The abstract page lists v4 and v5; v5 changes statements that P.3 and P.4 rely on. It is added as `GR.2026`, and v3 is kept, since most locators are v3's.
  - **Goncharov, J. Amer. Math. Soc. 18 (2005)** (36de73ac…). Compared with arXiv v3 at every source issue: same theorem numbering, different equation numbers.
  - **Burgos Gil–Feliu–Takeda**, *On Goncharov's regulator and higher arithmetic Chow groups*, arXiv:0909.5296 = IMRN 2011 (63155506…), added as `BFT.2011`.
  - **Neukirch–Schmidt–Wingberg**, *Cohomology of Number Fields*, electronic edition 2.3, hosted by the authors (abbb7cde…), Section X.3, added as `NSW.2013` for Leopoldt's conjecture.
- **Checkers.** Three worked in parallel, each comparing every locator and excerpt with the rendered pages, opening every cited declaration at Mathlib 082e2d3 and Tau Ceti f790474, and reading every supplier stage in `data/atlas.json`:

  | Checker | Scope |
  |---|---|
  | A | P.1–P.2 (11 nodes), the 26 baseline declarations, the P.1–P.2 part of the Lean file |
  | B | P.3–P.4 (12 nodes), GR v3 against v5 |
  | C | P.5–P.6 (14 nodes), Goncharov v3 against JAMS, Burgos Gil–Feliu–Takeda |

- **What I checked myself.**
  - **Numerics** (mpmath, 30–40 digits):
    - D(i) = D((1+i)/2) = G;
    - both five-term instances used as tests (x = i, y = −1 and x = i/2, y = (1+i)/2) vanish;
    - D(e^{iπ/3}) = 1.014941606…;
    - Li₂(−1) = −π²/12;
    - the regulator normalisations: ζ_{ℚ(√−3)}(2)/(π²3^{−1/2}D(e^{iπ/3})) = 2/9, and Z₂, Z₃, Z₄ equal 3ζ_{ℚ(i)}(2), 16ζ_{ℚ(i)}(3) and 45ζ_{ℚ(i)}(4) respectively; Z₄(ℚ) = π⁴ = 90ζ(4);
    - the three cross-ratio conventions: D∘r = −D∘cr_{V.4} = −D∘[ , , , ]_{GR}, at random points;
    - the Laplacian ΔD = −2 Im z/(|z|²|1−z|²), at four points; this gives the positivity of D on the upper half-plane (new node P.1/bloch-wigner-positivity).
  - **Texts.**
    - Page images: GR's condition is ∗_n (v3 p. 5), not "o_n"; the misprints in v5 (5) and (6).
    - Goncharov: Lemma 6.9 side by side with its proof's (84); the definition of the Chow dilogarithm with 1/(2πi).
    - Burgos Gil–Feliu–Takeda: abstract and Theorem 6.18.
    - Neukirch–Schmidt–Wingberg: (10.3.3)–(10.3.6).
    - GR v5: Conventions and Theorem 1.3(i).
  - **Graph.**
    - Every stage-level cycle the checkers reported, against the atlas `requires`.
    - Every cross-roadmap node id the packet now cites exists in the sibling packets or in `reserved-ids.json`.
    - No node depends on a node of a later stage of this roadmap.
  - **Lean.** I elaborated the suggested file myself (below).
- **Checks.** `python3 scripts/check_blueprint.py --index <pinned declaration index> research/blueprint/packets/Polylogarithms.json` reports 0 errors and 4 warnings, all for prerequisites reserved for the unwritten BorelRegulators blueprint (R.3/borel-rank-theorem, R.4/borel-regulator). The original packet also passed; the checker does not test statement truth, test kinds, excerpt length or stage cycles. The source issues pass `scripts/check_errata.py`'s rules. My own validation also passes:
  - every test has a §12 kind;
  - every excerpt is at most 300 characters (six original ones were longer);
  - the prerequisite graph is acyclic and respects the stage order;
  - every `neededBy` names a node.

## Counts

| | before | after |
|---|---|---|
| nodes | 37 | 75 (33 corrected, 42 added, 4 deleted and replaced) |
| API items | 101 | 190 |
| unit tests | 74 (none with a kind) | 135 (all with a kind) |
| planets | 20 | 21 (at most 6 per layer) |
| baseline declarations | 26 | 61 (42 added, 7 removed) |
| requests (all with `neededBy`) | 15 (none with `neededBy`) | 19 |
| gaps (all with `neededBy`) | 6 | 17 |
| source issues | 0 | 21 |
| restructure entries | 3 | 6 |

Added nodes by stage: P.1 6, P.2 3, P.3 4, P.4 5, P.5 22, P.6 2. No node was verified unchanged.

## The main corrections

**Cycles and the order of the stages.**

Four stage-level cycles were removed, and one reversed edge:
- **P.1 → K3BlochGroups V.3.** P.1/bloch-wigner-five-term cited K3BlochGroups V.3, and V.3/bloch-wigner-dilogarithm imports P.1. The descent sentence moves to P.2, which cites the V.3 node ids.
- **P.2 → BorelRegulators R.7.** P.2/borel-comparison cited R.7, and R.7 requires P.2. The Borel regulator is R.4's (reserved id).
- **P.2 → ArithmeticQuantumTopology QT.5.** P.2/hyperbolic-volume cited QT.5, which requests this very identity from P.2; QT.5 moves to `uses`.
- **P.3 → P.4.** The atlas has P.4 requiring P.3, but P.3's complexes were built on P.4's groups.
  - P.3 now owns the explicit complexes of weight at most three, which is its reserved id's scope (Γ(F, n) for n ≤ 3). They are built on B₂ = P(F) ⊗ ℚ (K3BlochGroups V.3) and a new trilogarithm group B₃ with GR's 22-term relation, which is what the stage asks for ("the weight-three polylogarithmic groups and relations of the adopted Goncharov model") and what GR's weight-three and weight-four arguments use.
  - P.4 keeps the inductive groups ℬ_n and gains the general complex.
- **P.5 → EllipticRegulators ER.2/ER.3.** These prerequisites reversed the confirmed fix RT-AREA-ktheory-2/7 (P.5 owns η, and ER.2 specialises it); they are removed with both requests.
- **The request to SpecialValuesBirchTate B.8 pointed the wrong way** (B.8 requires P.6). It is replaced by an ownership entry.

**False statements corrected.**

P.1:
- L₁ = log|z| was false: the formula at n = 1 gives −log|1−z|.
- L_n(1) = 0 was false: it is ζ(n) for odd n.
- Inversion was stated for n = 1, where it fails.
- The Bernoulli coefficients are not forced by single-valuedness: Ramakrishnan's coefficients also give a single-valued function, unbounded at ∞.
- The monodromy formula was wrong; the exact jump 2πi(log x)^{n−1}/(n−1)! across (1, ∞) replaces it.
- D's discontinuity was placed on the negative axis; it is on (1, ∞).
- The suggested file's `polylog` was analytic on `slitPlane`, which contains the cut.

P.2:
- "The map kills c, which has order six" is false in B(ℂ), where c = 0 (K-book Cor. VI.5.4.1 as corrected in K3BlochGroups/E10).
- borel-comparison promised an explicit scalar and sign that nothing read supplies. It now asserts some q ∈ ℚ^× and records a gap against R.7.
- Its source was a weight-four theorem with a false match; Goncharov's Theorem 1.1 with (11) replaces it.

P.3:
- The vanishing of d² was located in rationality, but x ∧ x = 0 in Λ² of any abelian group.
- The transfer recipe fails: Λ³ of the norm after restriction is [L:F]³, not [L:F].
- The weight-three special value lacked its normalisation, π^{3r₂}.
- The K-theory comparison mapped from gr_γ, but the source's maps vanish on the rank filtration, and gr^rk = gr_γ is Suslin's conjecture.

P.4:
- ℬ₂ was identified with the rationalised Bloch group (a kernel); it is the rationalised pre-Bloch group, and the identification is Suslin's theorem, not a definition.
- The weight-two comparison with V.3 had the wrong sign.
- Zagier's third proposition claimed a nonzero multiple for every family, which fails for dependent families (GR: q ∈ ℚ).
- The weight-four comparison was called a theorem; it is GR Conjecture 1.4.
- The weight-four theorem, as printed, is false when r₂ = 0 (source issue E2).
- The general normalisation (π^{n r₂} for odd n, π^{n(r₁+r₂)} for even n) was stated nowhere.

P.5:
- The Chow dilogarithm's printed normalisation (2πi)^{−1}∫r₂ is purely imaginary. It is −(2π)^{−1}∫r₂, checked by quadrature (E12).
- Goncharov's Conjecture 6.2 was a theorem node for every complex curve; it is now a Prop with its three proved cases as theorems.
- Its target was V.3's Bloch group, a kernel, which would force Res = 0.
- The "curve regulator" was the Chow trilogarithm, which lives on surfaces in ℙ⁵.
- r_{m−1} was said to kill Steinberg elements (r₁((1−z)∧z) = −i dD ≠ 0) and constants.
- The locators Theorem 3.2 and Definition 2.11/Proposition 2.12 were wrong (Theorem 3.3; Definition 2.13 and Proposition 2.14).

P.6:
- The p-adic regulator was taken at the places above p. Their number is unrelated to r₁ + r₂ − 1: ℚ(√2) with 7 split gives a 2 × 1 matrix.
- The p-adic logarithm is PadicHodgeRegulators D.1's, not D.3's (the unramified p > 3 theorem).

**Status corrections.**
- **The comparison of Goncharov's regulator with Beilinson's is a theorem**, Burgos Gil–Feliu–Takeda, Theorem 6.18. The packet recorded it as open ("a formalisation that assumed the comparison would be assuming an open problem"). The node is replaced by P.5/regulator-induces-beilinson, with the sign (−1)^m of their Remark 5.12, and its supplier M.7 by M.4, M.6 and M.8.
- **GR Theorem 1.14(c) proves the weight-four extension** for the combinatorial L₄; only the motivic version is a prediction.
- **The source's name for the condition is ∗_n.**

**Closure and granularity (42 nodes added).**
- **P.1:**
  - the distribution and inversion formulas of Li_n;
  - the continuity of L_n (split off so that it can use inversion);
  - the differential of D and its positivity;
  - the cross-ratio identity behind the five-term proof, whose constant-fixing step was impossible for five distinct points (now a connectedness argument).
- **P.2:**
  - the Bloch–Wigner cocycle (a stage target);
  - Lobachevsky's three-angle identity;
  - the error theorem of the numerics. The approximation is now a computable function ℚ(i) × ℕ → ℚ; otherwise the error theorem is satisfied by D itself.
- **P.3:** the trilogarithm group, the residue on exterior powers, the regulator compatibility and the Milnor-degree comparison.
- **P.4:**
  - the specialisation lemma. The descent of δ_n was a non-routine step, and δ_n and ℬ_n were mutually dependent; they are now one recursion.
  - L_n on ℬ_n(ℂ);
  - the comparison of the explicit and inductive groups;
  - the general complex;
  - Goncharov's conjecture with its proved cases.
- **P.5:** the Chow dilogarithm as a definition; unramified weight-two classes (a stage target that no node realised); the split of the regulator into Goncharov's Deligne complex and its comparison, the residue, Proposition 2.8, the simplex form, Definition 2.11, Theorem 2.12 and the real statement; the degree-zero Arakelov group; the reciprocity law's lemmas and proved cases; the weight-three curve regulator (ρ₂, ρ₃) of (83)–(84); Conjecture 6.3 for n ≥ 4.
- **P.6:** the p-adic regulator and its rank, and the proved equivalence (NSW 10.3.6).

Each added node carries `"addedBy": "REV-Polylogarithms"`, and its note in `review.checked` says why it was added.

**Deleted nodes** (their content is in the replacements):
- P.5/chow-dilogarithm-reciprocity, a conjecture as a theorem;
- P.5/deligne-target-request, bookkeeping;
- P.5/chern-character-comparison-problem, replaced by regulator-induces-beilinson;
- P.5/strong-reciprocity-law, split into seven nodes.

No sibling packet cites any of them.

## Baseline citations removed or fixed

- **Near miss.** `Complex.hasSum_taylorSeries_log` is the alternating series of log(1+z). Li₁ is `Complex.hasSum_taylorSeries_neg_log` (LogBounds.lean:281).
- **Wrong module.** `Polynomial.bernoulli` is in `NumberTheory/BernoulliPolynomials.lean`. It is now used by the inversion formula.
- **Misleading.**
  - `Complex.slitPlane` is ℂ ∖ (−∞, 0]. The principal Li_n is analytic on its preimage under z ↦ 1 − z.
  - `HomologicalComplex` has no cones; the cone is `CochainComplex.mappingCone` and its `triangle`.
- **Removed as uncited or unused:** `bernoulliFun`, `Units`, `FreeAbelianGroup` (ℚ[F] is `Finsupp`), `NumberField.Units.regulator` (a "pattern", not a dependency) and `exteriorPower.map` (the universal property `exteriorPower.alternatingMapLinearEquiv` is what is used).
- **Added (42), all confirmed in the pinned index:**
  - Mathlib:
    - the logarithm and argument lemmas;
    - ζ values and the Fourier series of the Bernoulli polynomials;
    - the exterior powers, the graded exterior algebra and its universal property;
    - valuations and residue fields;
    - the infinite places with their embeddings, `IsReal`, `IsComplex` and `conjugate`;
    - the unit rank, fundamental system and torsion;
    - `PadicAlgCl`, `Distribution` and `TestFunction`;
  - Tau Ceti: the audited places API (`TauCeti.Place`, `ord`, `ResidueField`, `residueUnit`, `finite_setOf_ord_ne_zero`), `TauCeti.Divisor.degree_principal` and `TauCeti.unitFiltration`.
- **Format.** Every entry now has `kind` and `checked`.

## Mistakes in the sources

21 entries, all with `review.verdict = confirmed`; `sourceVersions` lists the seven texts read.

**GR, 7 entries.**
- E1: the codomain of π_n.
- **E2 (error, a stated result):** for r₂ = 0, Theorem 1.2 as printed reads ζ_F(4) = π^{4r₁}|d_F|^{−1/2}, false for ℚ.
- E3: δ_n{0} is undefined for n > 2.
- E6: misprints in v5 (5) and (6), new in v5.
- E4, E5, E7: v3 slips corrected in v5, recorded as known.

**K-book, 2 entries.** E8 and E9 are the mistakes K3BlochGroups found (its E9 and E10), recorded as known; this packet uses the corrected E9.

**Goncharov, 12 entries (E10–E21), all new.**
- E10: the summation range in (13).
- **E11:** Lemma 6.9 lacks 2π; the reviewer's quadrature gives −6.2834.
- **E12 (error, a stated result):** the Chow dilogarithm normalisation (2πi)^{−1}, which makes Conjecture 6.2(b) and Theorems 6.5, 6.12 and 6.14(b) compare an imaginary number with a real one.
- E13: the index in the proof of Theorem-Construction 3.1.
- E14: the degree of the currents in Theorem 2.4.
- E15: F := k(X)*.
- **E16 (error):** the abstract claims to prove the reciprocity law, but Section 6 states it as Conjecture 6.2 with three proved cases.
- E17 (gap): Proposition 6.17.
- E18 (gap): Theorem 6.14 needs lines in general position.
- E19: a slip in Lemma 6.13's proof.
- E20: the maps b_j of Section 3.1.
- **E21 (error):** the sign of the residue term in Proposition 2.8 at n = 2.

## Lean

`research/blueprint/suggested/Polylogarithms.lean` was rewritten against the final packet: 1397 lines, importing only individual Mathlib modules. I elaborated it with the Lean toolchain of Mathlib 082e2d3 (v4.34.0-rc2), with `LEAN_PATH` pointing at a prebuilt Mathlib 082e2d3; nothing was built. The result was exit 0 with 216 warnings, all `declaration uses 'sorry'`, and no other messages.

**Coverage.** A scripted check found every packet API item, every test and every node id in the file. Tests are `example`s whose docstring names the test.

**What cannot be stated yet.** API items and nodes that need currents on complex manifolds, Chow varieties, Bloch's cycle complex, the Deligne–Beilinson complex, hyperbolic volume or the places of a function field are comments `-- <name>: not stated; needs …`. This covers most of P.5 beyond the forms themselves. The Tau Ceti places API is at f790474, and no build of that commit was available; the file names it in comments rather than importing it.

**Objects stated concretely:**
- `polylog`, with its branch pinned by `polylog_one_eq_neg_log` for every z;
- `singleValuedPolylog` (Mathlib's `bernoulli`);
- `blochWigner` and its differential;
- GR's and Goncharov's cross-ratios and the Bloch–Wigner cocycle on GL₂(ℂ);
- Lobachevsky's function;
- the rational units and wedges;
- the quotient groups B₃ and ℬ_n, with δ_n on ℚ[F] and their descents;
- the cocycles and ∗_n;
- the Zagier determinant indexed by `{w // Odd n ∨ w.IsComplex}`;
- η, α, r_m and ρ₂ in a chart;
- the Chow dilogarithm on ℙ¹;
- the p-adic regulator matrix and its rank.

**Other properties of the file.**
- **Other roadmaps' objects are variables:** the pre-Bloch group, the Bloch group and V.3's boundary; K₃^ind and Suslin's map; the Borel regulator; rational K-groups; the p-adic logarithm.
- **No placeholders:** no `True` statement remains, and `sorry` appears only in declaration bodies or proof obligations inside them.
- **The `Prop`-valued definitions have content:** ∗_n, Goncharov's conjecture, Zagier's existence and identity, and Leopoldt in the rank form.
- **Implementation status:** `implementationStatus` stays `unchecked`.

## Questions for the orchestrator

1. **K3BlochGroups V.6/regulator-agreement** relies on "the nonzero rational scalar fixed in Polylogarithms:P.2/borel-comparison". After this review P.2 asserts only some q ∈ ℚ^×, and the exact scalar and sign are BorelRegulators R.7's (gap). V.6 should cite R.7 for them. The request to K3BlochGroups V.6 says so.
2. **GR v5.** It is the final version, accepted by the Annals, and several P.3–P.4 statements now follow it (infinite fields; the explicit groups; Conjecture 1.4 without "modulo torsion"). Other packets that cite GR v3 (ArithmeticQuantumTopology, HabiroNahmSeries) may want the same check.
3. **The Rogers dilogarithm** is requested from P.1 by K3BlochGroups (V.5/element-c-order-six) and built independently by ArithmeticQuantumTopology QT.5 and HabiroNahmSeries HB.3. No source read here defines it. A restructure entry proposes P.1/rogers-dilogarithm with Zagier's survey as the source.
4. **Unowned objects that P.5 needs:**
   - currents on complex manifolds, with the Poincaré–Lelong formula;
   - Chow varieties;
   - the complex-variety arithmetic Chow group (36);
   - the elliptic trilogarithm.

   Each is a gap with `neededBy`. Currents in particular block most of P.5's Lean statements.
5. **Suslin's rigidity B(F(t)) = B(F)** is requested from K3BlochGroups V.4, which owns Suslin's sequence but not obviously this corollary. If V.4 declines it, it needs an owner.
6. **Sources not obtained:** Goncharov 1991, 1994 and 1995; Zagier 1990; Suslin 1984 and 1990; and Goncharov's sections 4, 5 and 7. They would close most of the gaps of P.2–P.4.

## Summary

The review accepted the packet after correcting it in place. Of the 37 nodes, 33 were corrected, 4 were replaced, and 42 nodes were added. Four stage cycles were removed. The P.3/P.4 split now follows the atlas order and the reserved id.

A number of statements were false and are corrected:
- L₁, L_n(1) and inversion at n = 1;
- the order of c in B(ℂ);
- the weight-two sign against V.3;
- Zagier's "nonzero for every family";
- the Chow-dilogarithm normalisation;
- the curve regulator;
- the p-adic regulator.

The comparison with Beilinson's regulator, recorded as open, is a published theorem. Every test now has a kind, and every baseline citation was checked at the pin. The packet records 21 source mistakes, 17 gaps and 19 requests. The Lean file elaborates, with `sorry` as its only warning.
