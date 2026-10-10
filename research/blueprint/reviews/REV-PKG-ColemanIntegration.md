# Independent package review: Coleman integration and noncritical Dirichlet L-values

**Verdict: needs_changes.** This is a completed review, with bounded corrections applied, rather than an unfinished review or checkpoint. Reviewer: Codex, session `codex-Jh9CHF`, job `REV-PKG-ColemanIntegration`, issue #7600, 10 October 2026. I did none of the packaging job, `PKG-ColemanIntegration` (#7535).

The analytic and moment parts are substantially specified, and the joined Lean file elaborates. The remaining obstacle is the locally owned motivic/regulator development: L3.Fa–Fd name substantial constructions without supplying their usable mathematical interfaces, and the corresponding original construction, APIs and tests are only comments in Lean. Acceptance requires the six checks below to hold together.

## Required checks

| Check | Result | Evidence |
|---|---|---|
| 1. Upstream form and density | **Needs changes** | Introduction, conventions, ownership table, four ordered layers and bibliography follow upstream form. The corrected README is 199,607 UTF-8 bytes, below 200,000. Compare current upstream ArithmeticDirichletSeries and Completed/ContourIntegration. L3.Fa–Fd lack the definition-level APIs and tests required of the constructions they introduce; see R1. |
| 2. Fidelity and prerequisites | **Needs changes in prerequisite specification** | All 177 original targets occur once, in the original order: 25/44/71/37 by layer. All 257 original API names remain in the README. The odd-prime normalization, Teichmüller twist, arithmetic q-Frobenius, integral Bloch torsion and endpoint qualifications are preserved. Downward ownership is appropriate, but moving the names of higher-tier inputs into L3.Fa–Fd has not yet supplied their prerequisite chains; see R1. |
| 3. Own words and locators | Pass after corrections | Mathematical assertions are written in the package's own words, with theorem/section/page locators. There are 241 distinct resolving footnotes. A normalized comparison against seventeen public source PDFs found no common sequence of twenty consecutive word tokens; this supplements manual reading, rather than proving originality by itself. Corrected the locators listed below. No source passages or source-by-source section summaries were added. |
| 4. No process in README | Pass after correction | No packet filenames, job identifiers, reviews, checkpoints or coverage statuses. Replaced the sentence about functions being “already planned” by their actual mathematical cross-references. |
| 5. Suggested Lean file | **Compilation passes; interface coverage needs changes** | Independent whole-file checks before and after corrections both exited 0. The final file has 511 warnings, all `declaration uses sorry`, and no errors or other warnings. It contains 178 typed `example`s. Mere occurrence of an API/test name in a comment does not supply its signature or example; see R2. |
| 6. Metadata | Pass | Exactly `topic = "math.NT"` followed by a newline, fitting the p-adic arithmetic topic. |

The accepted packet is unchanged. Its checker reports zero errors and zero warnings. That result validates the packet format and references; it does not prove the mathematical closure of the package. Its four layers are reported as planned, with seven recorded gaps and twenty-three supplier requests. I have not reclassified every historical gap as a new package defect: for example, the field-general Bloch/projective construction now has actual integral carriers, transport maps, infinity cases and discriminating examples.

## Corrections applied

1. **Tame punctures in Lean.** Added `hN : ¬ p ∣ N` to `puncturedLine_h1`, matching README L1.27 and its C4 contract. Without this hypothesis, the asserted unique N+1 residue coordinates are false. For N=p and a primitive p-th root ζ, the punctures 1 and ζ have the same reduction. On the tube the ratio `(z−ζ)/(z−1)` has an overconvergent logarithm; its differential is `dz/(z−ζ)−dz/(z−1)`. Thus those two proposed cohomology classes are dependent. The parameter now excludes exactly this failure, rather than silently assuming distinct reductions.
2. **Distribution generality in Lean.** Changed `padicRegulatorPolylog_distribution` from the p-th power alone to every positive integer m. Its hypotheses explicitly give the m-fold polylogarithm distribution relation, all m-th roots and the logarithm laws. This matches L3.14 and the accepted API. BDJ Remark 1.5, published pp.869–870, and §2, equation (2.4), p.876, fix the coefficients and underlying distribution law.
3. **Zero idempotent.** Restricted the dimension-characterization API and the totally-real/even-weight rejection test to π≠0. When π=0, both dimensions are zero, so the former unrestricted “no instance” test was false. PBC itself retains its stated dimension hypothesis and is not made a theorem. The positive-rank criterion is BBdJR Proposition 3.12, v2 p.12; the zero case is an elementary additional check.
4. **Reader signatures and cross-references.** Replaced six malformed suffixes such as `.7.` in L2.5's API by the corresponding L2 references and hypotheses. Corrected L1.28's heading to arithmetic q-power Frobenius, and L1.30's heading to the general punctured line. Replaced L2.32's empty prerequisite by field arithmetic. Condensed two redundant hypothesis paragraphs and mechanically duplicated punctuation, preserving the full statements, API names, tests and source references while keeping the size limit.
5. **Citation pages.** Corrected RJW Theorem 6.7/Remark 6.6 to v2 p.39 in footnotes 145, 150 and 162, and Lemma 5.12 to p.33 in footnote 147. Corrected L3.Fd's Conjecture 3.18 to BBdJR p.14, and the L3.Fa/Fc Proposition 4.17 range to pp.22–23. The files named in References were independently retrieved; the PDF text and printed numbering support these corrections.

## R1. Specify the locally owned motivic and regulator foundations as usable targets

**Location:** README L3.Fa–Fd and their consumers L3.15, L3.16, L3.36 and L3.37. **Severity:** substantive prerequisite gap, not a demand for completed Lean proofs.

The four foundation paragraphs are genuine downward ownership moves. They cannot inherit full specifications from Polylogarithms, PadicHodgeRegulators, BorelRegulators or AutomorphicPadicLFunctions while simultaneously excluding those higher-tier prerequisites. Currently L3.Fa has no definition API or unit tests; L3.Fc likewise names pairings, ranks and determinants without their interfaces/tests; L3.Fd names coefficient-valued assembly and p-adic induction without those constructions' contracts/tests. L3.Fb pins the cone differential and three useful normalization checks, but these do not specify the relative Chern character, products, integration-down map and symbol comparison on which the advertised regulator formula depends.

The scope of the repair is determined by the consumers, rather than by requiring a new node for every line of a proof:

| Local foundation | Required interface before its consumer |
|---|---|
| L3.Fa | Define the symbol complexes and their differential, the inversion quotient, relative K-groups and Adams-weight comparison; specify localization and finite-extension maps, exact hypotheses and compatibility diagrams. State the cyclotomic class and spanning theorem used by L3.15/L3.36. Each introduced definition/construction needs a named API and at least three discriminating tests. |
| L3.Fb | Specify the filtered rigid/relative complex, normalized syntomic target and relative Chern-character map with cup-product, boundary and pullback compatibilities. Give the integration-down map and special-symbol comparison with their domains, sign convention, hypotheses and prerequisite targets; connect them to the regulator of H¹ of the symbol complex. Preserve the inverse `(1−φ*/qⁿ)⁻¹`, the once-per-weight relativity sign and Gros's Euler factor. |
| L3.Fc | Specify the actual complex regulator pairing, coefficient and Galois maps, the rank/idempotent criterion, and the cyclotomic determinant calculation. Include tests for parity, basis/coefficients and a one-dimensional cyclotomic example, with their exact expected outcomes. |
| L3.Fd | Import the existing complex Artin theory, then specify the E-valued realization assembly, Euler factors and p-adic parity/Brauer construction with expression independence. State existence hypotheses wherever the source uses them. Test the degree-one Dirichlet specialization, direct sums and coefficient extension on the actual constructed functions. |

There is a concrete missing bridge, rather than simply a desire for more exposition: BDJ Definition 4.6, published p.892, identifies a normalized syntomic class with rigid cohomology, whereas the special-element computation uses relative cohomology and an integration map. Definition 5.2, p.895, and Proposition 5.7, p.898, specify relevant relative forms and its normalization; Propositions 7.10 and 7.14, pp.908–909, connect symbol evaluation to the K-theoretic regulator. Naming “integration-down and special-symbol computation” does not identify those maps and compatibilities. The number-field/cyclotomic specialization is justified by Theorem 1.12 and its proof, pp.872 and 910, including finite base change and distribution for pure p-power roots. The repaired roadmap must state that bridge in its own mathematical terms, not reproduce the source's sections.

For complex coefficient assembly, use BBdJR Definitions 3.5–3.6, pp.10–11, Remark 3.19(2), p.14, and Proposition 4.17, pp.22–23. Current upstream AdelicAlgebraicGroups AA.2.4 already owns the complex finite-image Artin theory; its factors and induction are imported, not re-planned. The new work is the assembly and additional p-adic interface.

The dyadic statement is already explicitly retained in the accepted plan and README L3.36. It is not an unnoticed change of hypothesis. Give that retained target a precise normalized supplier/statement when completing these foundations; the odd-prime formula alone proves neither its pure 2-power nor trivial-character cases. BBdJR Proposition 4.17 includes p=2 and asserts parts (1)–(3), not the general unit assertion of part (4).

This repair entails choosing and specifying genuine constructions and their dependency chain. I have not manufactured arbitrary K-group types, assumed comparison maps with their desired conclusions, or opaque `Prop := sorry` objects to obtain apparent acceptance.

## R2. Give locally owned constructions, APIs and tests actual Lean forms

**Location:** Suggested.lean's sections on general Coleman functions/integration, complex values, and regulators/PBC. **Severity:** incomplete deliverable under PROTOCOL §§13 and 20.

All original API and test names can be found using their namespace-qualified or local spellings. After removing Lean comments, however, 94 of the 257 API names have no occurrence even as a complete terminal-name token. This is a diagnostic lower bound on omissions, not a declaration count: occurrences in unrelated expressions can hide additional missing declarations, while namespace spelling must be resolved before assessing a name.

Representative missing interfaces are:

| README target | Lean evidence and required repair |
|---|---|
| L3.15 | `syntomicRegulator_cyclotomic` is explicitly unstated, depending on L3.Fa/Fb. After R1 supplies genuine carriers, give its regulator composite, normalization, theorem and cyclotomic/base-change examples actual forms. |
| L3.16 | `padicBeilinsonConjecture` and its five APIs are only comments. All four named tests (`pbc_dirichlet_instance`, `pbc_trivial_motive`, `pbc_dimension_fails_imaginary_quadratic`, `pbc_even_n_totally_real`) are described as unstated. Define the conjunction from the actual determinant and L-function objects; state these APIs and tests. Do not assert the conjecture. |
| L3.36–37 | `padicBeilinson_dirichletMotives` and `colemanFormula_syntomicRegulator` are comments. Give the advertised odd-prime statements using the preceding genuine objects, and the separate precise dyadic target required by R1. |
| L2.Fa/L2.30/L3.12–13 | The existing complex comparison accepts an arbitrary `polylogC` together with series/continuity assumptions. This is a useful conditional lemma, but supplies no locally owned construction satisfying them. Provide the specified complex boundary-value object, defining-series/continuity APIs and examples, following the live Mathlib polylogarithm vocabulary. PR #44531 is still open, so it is a design direction, not an import at the pinned baseline. |
| L1.7/L1.12 | `FrobeniusDatum.changeBasis`, `FrobeniusDatum.pow` and `WordAlgebra.isUnipotent` are explicitly omitted even though the abstract datum/word carriers are already typed. Add their actual statements against those carriers; pending rigid geometry is not the reason these algebraic interfaces are absent. |

Genuine external objects absent from the pinned build may require honestly limited prototypes. For example, I have not rejected every missing general-pair signature merely because AdicSpacesPartII's tubes/dagger algebra and annulus APIs are not implemented. The standard nonexhaustive note and omission of an unstatable condition are appropriate. They do not supply a missing locally owned construction, or convert a comment listing names into API lemma signatures and `example`s. Scalar moment and logarithm examples do not exercise the missing regulator or determinant definitions.

## Independent checks and limits

I read the package README, compared its ordered targets/hypotheses with the accepted packet, inspected its suggested declarations and omission blocks, and read the package handoff and binding worker/protocol/upstream instructions. I read the reviewed library coverage for all four layers and the relevant upstream ArithmeticDirichletSeries link-map entry, which records no exact direct match. Current upstream ownership and library checks used roadmap commit `3c18d9fbfceed0dc5c1edb1070a3927152d19e28` and Tau Ceti commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The nine roadmaps added since the atlas snapshot were screened in their available README/suggested files; this screen found no supplier of the higher syntomic regulator construction. Current JacobianChallenge/curve APIs supply curve cohomology and duality, with their rational-point and canonical-sheaf qualifications, not the missing identification with relative differentials by themselves.

Fresh primary reading concentrated on the analytic normalization and pullback claims, rational/complex series, scalar and projective five-term interfaces, smoothed moments, BBdJR determinants/PBC/cyclotomic comparison, BDJ's regulator bridge and BC's algebraic/rigid comparison. This review does not claim a new proof-by-proof extraction of all seventeen papers or an independent recertification of every one of the packet's 124 baseline declarations. Its negative verdict rests on the explicit missing interfaces above, not on speculation that the headline theorems are false.

The independent final commands were:

```text
lean-check research/blueprint/packages/ColemanIntegration/Suggested.lean
python3 scripts/check_blueprint.py research/blueprint/packets/ColemanIntegration.json
```

Compilation used the existing shared build at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, with 100 GB available before the final check. No library build/update/cache or language server was run. The examples and proofs contain admissions; elaboration certifies types, not the mathematics.

The next revision should address R1 and R2 on the package's permitted paths, preserve all original targets/API/tests and the corrections above, and repeat correspondence, intake validation and the whole-file Lean check. The accepted packet and supplier/ownership files were not modified by this review.
