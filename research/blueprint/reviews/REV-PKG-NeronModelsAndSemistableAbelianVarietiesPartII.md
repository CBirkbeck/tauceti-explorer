# REV-PKG-NeronModelsAndSemistableAbelianVarietiesPartII — fixing review

Reviewer: `independent-review-REV-PKG-NeronModelsAndSemistableAbelianVarietiesPartII` (Claude, session
`claude-ZcgAKZ`), 13 October 2026, issue #9228. The package was written by Codex, session `codex-hkDwpU`
(issue #9184, PR #9353, `research/blueprint/handoff/PKG-NeronModelsAndSemistableAbelianVarietiesPartII.md`);
this reviewer did none of that job and none of the plan's design or review jobs. Method:
`research/blueprint/PACKAGE_REVIEW.md` (one fixing review). Everything found was fixed in place in `README.md`
and `Suggested.lean`; nothing blocking remains.

Verdict: **accepted** (`review.json`). With the fixes below the package is ready for the draft PR.

## What was checked

1. **Upstream form.** The README has the TauCetiRoadmap shape (compared with the current StableReduction and
   ReductiveGroupsPartII READMEs): `**Summary.**`, *Scope and ownership*, *Conventions*, *Exact supplier
   contracts*, *How to read the build*, Layers 1–7 with `###` prose subsections, `**Checks.**` lists, per-layer
   *Examples* and *Dependencies*, *Downstream consumers* and *References*. No target tables or field lists.
   `metadata.toml` is `topic = "math.AG"`, which fits.
2. **Fidelity to the plan.** All 168 packet nodes map one-to-one to the 168 README subsections (by title, two
   by declaration name); all 723 packet API entries occur in the README, except two that this review renamed
   to the Lean names (`BoundedWeierstrass.chart_chart` → `inverseChart_inverseChart`,
   `BoundedWeierstrass.discriminant_chart` → `inverseChart_discriminant`). Every definition and construction
   node has at least three Checks. The plan's 17 gaps are carried as stated boundaries (Saito's
   conductor–discriminant identity as a named input of §3.11; W. E. Lang 2000 unread, replaced by the finite
   certificate; the model and rejection certificates as construction targets).
3. **Own words.** An 8-word-shingle comparison of the README with the texts of Schröer, Ferrand,
   Temkin–Tyomkin, Liu–Lorenzini–Raynaud and its corrigendum, Bombieri–Mumford, Witaszek and Liedtke found
   only titles and bibliographic strings. No passage, no section-by-section summary.
4. **Process residue.** Removed: 45 "Name the resulting construction or comparison" lines (now `*Lean name:*`
   lines), about 70 packet-node slugs used as cross-references (now `§k.n` or the API name), "node",
   "promoted", "fixture", "consumer leaves", "load-bearing", a packet stage id `G.0`, and a "declaration-sized
   node … granularity" paragraph (§5.10). The README also repeated the same hypothesis sentences in bullet
   after bullet (about 157 KB). In 45 subsections the repeats inside an API list were removed: in 22 they
   were hoisted once into a "Standing hypotheses" line, and in 23 the subsection prose already states them.
   No API item,
   Check, hypothesis or locator was removed: before and after, 703 API bullets and 171 Checks blocks. Each
   hoisted sentence was read; three subsections whose repeats were item-specific (§§2.26, 2.31, 2.38) were
   left as written. The README went from 841 KB to 679 KB.
5. **Suggested.lean.** `lean-check` before the review: exit 0, 68 warnings, all `declaration uses sorry`.
   After the review: exit 0, 69 warnings, all `declaration uses sorry`; 478 lines, sha256
   `d08ab58ca023248c…`. Shape: light real-bodied definitions only (`AffinePinching.conductor`,
   `commonIdealComparison`, `commonIdealDifference`, `QuadraticPinch.algebra`, `QuadraticPinch.curve`,
   `F2Model`, `BoundedWeierstrass`, `reverseWeight`, `inverseChart`, `fiberSectionGram`,
   `rationalSurfaceCount`, `rawCandidates`, `coefficientPolynomial`, `NormalizedCoefficients`,
   `normalizedEquation`, `normalizeA2`, `AdmissibleParameters`, `admissibleChange`); no sorry'd data. Every
   declaration was checked by hand against its README statement, and every Lean name occurs in the README.
6. **intake.** `python3 research/blueprint/intake.py check-files` on the package files, `review.json` and this
   report: 0 problems.
7. **Duplication.** Against current TauCetiRoadmap main (all roadmaps, including the nine newer than the atlas
   snapshot) and current Tau Ceti a91d3aaf, by object as well as by name (subring conductor, Ferrand
   pinching, scheme pushouts and clutching, Weierstrass point counts, singular cubics, F₂ curves, Kodaira
   types, genus-one fibrations, NumericalType/NumericalPicard, root-lattice discriminants, Lang, Tsen, trace
   formula, polynomial reversal). No target exists there; the overlaps are now stated as boundaries (below).
8. **Supplier layers and tiers.** Every TauCetiRoadmap layer citation was checked against the current
   roadmaps and every atlas citation against the lower packages: a Sonnet helper made the inventory, and each
   mismatch was confirmed by reading the cited section. Fixes below. All suppliers are now Mathlib, Tau Ceti,
   Tau Ceti roadmaps, or the lower-tier packages SchemeAndStackFoundations (PR #779),
   AlgebraicModuliForArithmeticGeometry (PR #853) and NeronModelsAndSemistableAbelianVarieties (PR #852).
9. **Sources.** Every locator I opened was correct, and I opened more than fifty across all the main
   sources. Schröer arXiv v3: Theorem 2.1, Propositions 3.1–3.3, 6.1–6.2, 7.1, Corollaries 7.2–7.3,
   Proposition 8.1, Corollaries 8.2–8.3, Lemma 8.4, Propositions 9.3, 9.5, Theorem 9.4, Propositions
   10.1–10.3, Theorems 10.4–10.5, Proposition 11.1 and its proof, and Propositions 12.2–12.3. Ferrand:
   Lemma 1.3 and its converse, Théorèmes 2.2, 5.1 and 7.1. Temkin–Tyomkin v3: Lemmas 2.1.6, 4.1.2, 4.3.1,
   5.1.2, 5.1.4, Theorems 4.2.1, 4.2.4, 4.4.1–4.4.2, 5.2.5, 5.3.1, 6.2.1, 6.3.2, 6.3.5, and its convention
   that spaces need not be quasi-separated. Liu–Lorenzini–Raynaud: Theorem 3.8, formula (21), Theorem 5.9,
   Facts 6.1, Lemma 6.3, Corollary 6.5, Theorem 6.6, Remark 6.8, Proposition 7.1, Lemmas 7.2–7.3.
   Bombieri–Mumford: Theorem 2, Proposition 4. Witaszek: Lemmas 2.23, 2.25, 2.28. Liedtke: Theorem 4.6.
   Stacks tags: 04D1, 02X4, 0417, 05Z2, 07T8, 0A2M, 02WW, 0ET0, 0C5Q, 0D2I, 0C5X. One wrong tag was found
   and fixed: 04S6, cited for the quotient by an étale equivalence relation, is now 02WW.

## Fixes made

**Classification (verified by an independent computation).** The package's end theorem gives fourteen
classes: eleven with j ≠ 0 and three with j = 0. Schröer's Theorem 10.4 prints eight equations with j ≠ 0.
I wrote my own Tate's algorithm over F₂(t) at t = 0, 1 and ∞; it does not reuse the packager's script. It
reproduces all eleven of Schröer's published configurations. It also shows that models 12–14 are minimal,
with fibres I₂*+E₄+Ĩ₂, I₃*+E₄+Ĩ₁ and IV*+E₄+Ĩ₂ (plus I₁ over t²+t+1) and 25 rational points each.

An exhaustive search of all 2¹⁸ normalized tuples gives 2592 survivors: Δ ≠ 0, minimal at the three
rational places, fibre count 25, and at most one rational fibre that is semistable or smooth supersingular.
These form exactly fourteen orbits under the 512 translations, the six base automorphisms and a₂
renormalization: thirteen of 192 members and one, III*+E₄+E₄, of 96. The orbits match the fourteen models
one-to-one. So the package's correction of Schröer is right.

I made the README say this explicitly. §6.1 now explains where models 12–14 come from: the twisted case of
the proof of Theorem 10.4, which also misses them in the configuration table in the proof of Proposition
11.1. §7.3 has two new Checks with the survivor and orbit counts. §7.5, *Downstream consumers* and the
Schröer reference now note that the printed theorem has eight classes.

**Supplier and tier corrections.**
- *Néron pair.* The README called the two Néron roadmaps a dependency bundle in which the parent consumes
  Part II's pinching. It does not: the parent's 4.8 writes its one-node curve by an equation and only points
  here. The dependency now runs one way. The parent layers are corrected throughout: Néron models are
  Layer 1, component groups and the minimal-model smooth locus Layer 2, the semistable Picard comparison
  Layer 3 §§3.8–3.9 and Layer 4. The old text said "Layers 2 and 4".
- *Trace formula.* WeilConjectures Layer 1 has no trace formula. The Grothendieck–Lefschetz trace formula
  is TraceFormula Layers 11–14, with FrobeniusGeometry and EllAdicRealization, in the cohomological
  point-counting family (TauCetiRoadmap PR #196). This is cited in the supplier section, §5.2 and the Layer 5
  dependencies, and the dependency on the non-upstream WeilConjectures is removed.
- *SchemeAndStackFoundations.* Layer names are now SF.0–SF.5 throughout. SF.1 does not state Stacks
  04D1, 02X4, 0417 or 05Z2, so these four are new targets of §1.9 with exact statements. The étale quotient
  theorem is 02WW (SF.1 T168), not 04S6. Flat base change of quasi-coherent cohomology is JacobianChallenge
  Layers A–D, not SF.0/SF.3 (§1.6).
- *Flat-module patching.* The "flat/étale patching equivalence" that §§1.8–1.10 used was cited to SF.3,
  which does not contain it, and was also said to be "proved here" without a target. It is now the target
  `ferrand_flat_patching` in §1.3 (Ferrand, Théorème 2.2(iv), p. 560; Stacks Lemma 15.6.8, tag 0D2I), with
  three Checks, and §§1.8–1.10 cite it.
- *StableReduction.* Layer 4 states only negative semidefiniteness. The sharper Zariski statement (kernel
  spanned by the multiplicity vector, proper principal submatrices definite) is Stacks Lemma 55.2.3 (tag
  0C5X), proved here in §2.5. Layer 5 has no Kodaira classification target, so §2.5 plans the
  classification in full and §2.3 defines the realization predicate rather than "extending the existing
  dictionary". H⁰/H¹ of P¹ are the genus-zero case of Layer 2.
- *JacobianChallenge, AlgebraicCurves, Tau Ceti.* Layers E–F give abelian varieties and the Abel–Jacobi
  map, not an elliptic Jacobian. The genus-one point/Pic⁰ bijection is the current library's
  `SchemeWeilDivisor.degreeOneEquivPicZero`. The Weierstrass presentation of §2.22 comes from AlgebraicCurves
  Layers 10 and 12, not SF.3, which has no Weierstrass statement.
- *EllipticCurves.* Layer 3 does not state isogeny invariance of extension counts. §3.8 now derives it from
  `#E(F_{qʳ}) = deg(1 − πʳ)` and multiplicativity of degrees.
- *Duplication boundaries added to Scope.* Equation-level counts of singular cubics are EllipticCurves
  Layer 3 and current Tau Ceti `frobeniusTrace_eq_{one_of_splits, neg_one_of_not_splits,
  zero_of_c₄_eq_zero}`, with `nodePolynomial` at the pin. `reverseWeight` agrees with Mathlib's
  `Polynomial.reflect` below the weight.

**Other README fixes.** The conductor API is `AffinePinching.*` everywhere, matching the Lean; before, the
README mixed `Subring.conductor_*` and `AffinePinching.conductor`. The §4.10 API names match the Lean. Five
subsections each had two **Checks.** blocks; they are merged. §2.14 had an irrelevant copied Check; it is
replaced by two discriminating ones (q ≥ 3; rationality of the four attachment points). §5.10 now states
that its configuration exclusions follow from the finite certificate, and has two new Checks (the count
alone does not exclude II+E₄+I₉, and the statement is over F₂ only).

**Suggested.lean.** Removed `trace_eq_of_count_eq`. Its hypothesis was equal point counts, and
`frobeniusTrace` is defined from the count, so it was a tautology. Added `reverseWeight_eq_reflect` and a
negative-control `example` (weight-six reversal of `X^7` differs from `reflect`). The closing comment says
that Layer 3 is README-only.

## Adversarial mathematics pass

| Statement checked | Instances tried | Result |
| --- | --- | --- |
| `F2Model` Δ = 1 and counts 1–5 | All five equations by hand; orbit sizes 2,4,4,4,2 from the automorphisms of each model over F₂ | Correct |
| `f2_discriminant`, `f2_change_formula`, inverse triple (r,s,t+rs) | Mathlib VariableChange formulas reduced mod 2 | Correct |
| `f2_e4_double` | Slope at (1,0) is 0, 2P = (0,0), which is 2-torsion | Correct; E₄(F₂) ≅ Z/4 |
| `QuadraticPinch.conductor` = (q) | q = t² (repeated root), degree 1 (fails, so the hypothesis natDegree = 2 is needed), F₂ nonsplit | Correct with the hypothesis |
| `curve_param`, `nonsplit_pointCount` | x = q, y = tq; r even/odd over F_{2^r} gives 2^r / 2^r+2 | Correct |
| `normalizeA2`, `admissibleChange`, 2¹⁸, 512 | Mathlib action with r = a₂; (t,t,0,0,0) ↦ (t,0,t²,t²,0) | Correct |
| `rawCandidates` Δ and c₄ | Models 1, 9–14 by hand; all 14 by script | Correct |
| Fourteen-model classification (§§7.4–7.6) | Exhaustive search above | Correct; Schröer's printed table lacks three |
| §3.11, LLR 6.6 period = multiplicity | The README's counterexample over C[t]_(t−1) (class split by the unramified K(√t), trivial over K^h) | The henselian hypothesis is needed; the README has it |
| §4.1–4.4 canonical formula, deg L⁻¹ = χ + length T, ω_J = f*O(−1), O² = −1 | Leray, Riemann–Roch on P¹, adjunction | Correct |
| §4.6 plane (F,O), projection formula, inverse [[1,1],[1,0]] | D = F, D = O, F+O of square 1 | Correct |
| §4.9 v_P = (P−O)−(1+P·O)F, v_P² = −2−2P·O | Orthogonality to F and O computed | Correct |
| §4.12 f_*O(3O) = O⊕O(−2)⊕O(−3) | Ext¹ = H¹(O(1)), H¹(O(2)), H¹(O(3)) = 0 | Correct |
| §4.16 quasielliptic types in char 2 | Component counts 1, 2, 2n+5, 8, 9; ρ = 2+Σ(r−1) | Correct |
| §5.1 fibre counts rq, q+2, 2q+2, rq+1 | Lefschetz: 1 + qN − tr(H¹) | Correct |
| §5.4–5.5 IV/IV* and I_m* rigidity | Orthogonal-summand and dual-parity arguments, m ≤ 4 | Correct (this is the corrected argument the errata register records) |
| §5.9 bound 10+7+7 = 24 < 25 | — | Correct |
| §7.3 Hodge degree one ⇒ rational | H¹(O) = 0, ω = O(−F), P₂ = 0, Castelnuovo–Zariski | Correct |
| §1.12–1.15, §1.21 common-ideal statements | Z→Z/2, diagonal F₂→F₂², Z/4, Z×Z projections, cusp | Correct |
| §2.40–2.41 infinity chart and overlap | (1+au+bu²)z = u³ over any ring (f is a unit because f ≡ 1 mod u) | Correct |

## Notes for the maintainer (not package defects)

- **Errata not yet in `research/errata/REGISTER.md`.** (1) Schröer, Theorem 10.4 (arXiv v3, p. 29) and the
  configuration table in the proof of Proposition 11.1 (p. 33) omit I₂*+E₄+Ĩ₂, I₃*+E₄+Ĩ₁ and IV*+E₄+Ĩ₂,
  given by (t,1,t³,0,0), (t,t,t³,0,0) and (t,t²,t²,0,0). The twisted case of the proof says only "the
  argument is similar". The §11 exclusion of Enriques Jacobians may therefore not cover these three.
  (2) Liu–Lorenzini–Raynaud 2004, Theorem 6.6 (p. 496), is stated without O_K henselian but measures the
  period over K. The proof's first step, "we can assume O_K strictly henselian", can lower the period. The
  README's §3.11 counterexample over C[t]_(t−1) is valid. An errata job should record both.
- The Saito 1988 conductor–discriminant identity (named input `genusOne_conductorDiscriminant`) and
  W. E. Lang 2000 remain unread. The README relies on neither silently: Lang's configuration statements
  follow from the finite certificate, which the search above confirms.
