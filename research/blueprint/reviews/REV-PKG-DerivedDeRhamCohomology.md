# Independent package review: Derived de Rham cohomology

**Verdict: accepted.** Completed review of issue #7511 by Codex (GPT-6), session `codex-zY4L3n`, on 2026-10-08. This session did none of the package-writing job #7465 or the accepted plan. Clear citation and comment defects were corrected in the package; no mathematical target was removed or added.

The inputs were the package README, Suggested.lean and metadata.toml, and the accepted `research/blueprint/packets/DerivedDeRhamCohomology.json`. The review applies PROTOCOL §§5,13,20 and UPSTREAM_GUIDE. Acceptance concerns the roadmap specification and its admitted prototypes. It does not establish proofs or turn the enhanced interfaces described in comments into Lean declarations.

## The six package requirements

| Requirement | Result and evidence |
|---|---|
| Upstream form | Pass. The introduction motivates the library; the boundary table assigns neighbouring interfaces; conventions precede seven layers with individual targets, API and tests. Construction order distinguishes exposition from dependencies. HodgeStructures and DGAInfinity were read as nearby upstream comparisons. The README is 184,952 UTF-8 bytes, below both interpretations of the 200 KB limit. |
| Fidelity | Pass. All 132 targets, 191 API requirements, 151 tests and 608 prerequisite references were matched by declaration name and checked in their target blocks. The five rephrased statements were checked separately below. The 39 milestone names remain represented. The package preserves the accepted plan's proof obligations and supplier boundaries. |
| Own words and sources | Pass. The document organizes a mathematical construction, rather than reproducing source passages or summarizing successive source sections. Sources have statement/section and page locators; code has file and declaration locators. All 24 public source artifacts used for the package matched the plan's recorded SHA-256 receipts. Stacks completion and proper-cohomology locators were corrected below. |
| Timeless presentation | Pass after correction. The README contains no programme job, packet, review or checkpoint narrative. Such references in Suggested.lean were replaced with mathematical interface requirements and references to the definitive README. Its standard opening note remains. |
| Lean forms | Pass. Independent `lean-check research/blueprint/packages/DerivedDeRhamCohomology/Suggested.lean` completed successfully before and after the corrections: no errors, exactly 133 warnings, all for declarations using `sorry`. The admitted signatures match their stated ordinary views. The precise partition into typed and omitted names is explained below. |
| Metadata | Pass. The file is exactly the single line `topic = "math.AG"` followed by a newline. Algebraic geometry fits this roadmap. |

## Fidelity and hypotheses

The declaration-name audit gives the following exhaustive inventory. API and test entries were compared as mathematical statements, as well as counted.

| Layer | Targets | API items | Tests |
|---|---:|---:|---:|
| DD.0 | 22 | 26 | 21 |
| DD.1 | 21 | 35 | 24 |
| DD.2 | 32 | 40 | 37 |
| DD.3 | 10 | 10 | 9 |
| DD.4 | 14 | 16 | 12 |
| DD.5 | 13 | 20 | 15 |
| DD.6 | 20 | 44 | 33 |
| Total | 132 | 191 | 151 |

For 127 targets the statement agrees with the accepted plan after whitespace and Markdown normalization. The remaining five preserve its meaning:

- **Rational completion boundary:** the shorter statement retains uncompleted rational collapse, the nonzero ordinary Laurent class, and the separate filtered convergence/comparison obligation. The later smooth comparison separately retains the nilpotent-p theorem. Bhatt, Corollary 2.5 and Remark 2.6, pp.5–6, and Corollary 3.10/Remark 3.12, p.8, distinguish these ranges.
- **Quasisyntomic condition:** the ordinary quotient rings A/p and B/p are distinguished from the derived module tensors. Object completeness and bounded torsion, relative complete flatness, and cotangent amplitude remain separate conditions. BMS, Definition 4.10, pp.223–224, supports this formulation.
- **Regular PD comparison:** both endpoints are flat over Z/p^n, n≥1, and the locally finite regular ideal remains explicit. The Hodge/PD identification and the modulo-p conjugate comparison retain their respective meanings. Bhatt, Lemmas 3.37–3.38 and Corollary 3.40, pp.16–17, provide the regular calculation.
- **Derived Witt construction:** CR.4 supplies classical smooth Witt/Nygaard data; DD.4 performs the left Kan extension using EDS. Both displayed fiber sequences and the smooth restriction are retained. BMS §8.2, p.270, equations (4)–(5), is the relevant construction.
- **Corrected log lci condition:** flat endpoints, Cartier-type log smoothness and a strict regular quotient remain hypotheses. The inductive-limit form requires compatible regular presentations, rather than arbitrary strict surjections. Bhatt, Definition 7.20 and Theorem 7.22, p.31, are used in the repaired range of the accepted plan.

The full hypothesis list was checked against the conventions and each target. In particular, differential forms use the existing Kähler/exterior carriers and an A-linear differential; strict alternation survives characteristic two. Naive cotangent is only a truncation. Complete flatness does not imply ordinary flatness without the stated Noetherian algebra criterion. Strong spectral-sequence convergence and colimit/totalization exchanges keep their bounds. Crystalline equivalences retain flat lci hypotheses. Proper smooth perfectness does not assert finite projectivity of every cohomology group. General prelog QSyn/QRSP permits nonintegral monoids, while smooth and crystalline applications retain their integral and Cartier-type restrictions.

All 46 library prerequisites were checked at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. These include the exterior presentations and grading, Kähler relation quotient and basis, the actual cochain constructor, presentation-independent H1, regular sequences, ordinary divided powers, Witt vectors, derived-category views and ordinary adic completeness. These declarations do not supply their enhanced analogues. Tau Ceti's `mapSemilinear` and `mapSemilinear_D` were read in their pinned module; the package's degree-one test uses their defining Mathlib tower map under the algebra induced by f, without defining another Kähler map.

The four directional links recorded in the accepted plan agree with the package: classical CR.4 input feeds DD.4; DD.5 covers/unfolding feed DD.4's crystalline Čech application; DD.4 exports Witt/PD structure to RT.6; DD.3 supplies the conjugate bounds used in DD.5. The existing link-map `links` and `overlaps` arrays contain no additional edge involving this roadmap. References to it in their examined-roadmap inventories impose no extra construction. Early perfectoid and log-algebra interfaces remain early inputs, avoiding a dependency on their later applications.

## Sources and suggested scope

The source audit retained the plan's thirteen mathematical source corrections. Examples include the relative Frobenius twist and weight shift in Bhatt, Notation 3.1/Proposition 3.5, pp.6–7; the regular strict kernel for the logarithmic crystalline theorem, p.31; the odd-prime sign in Claim 3.30, p.14; the decreasing cofiber convention and converted cohomological Ext formula in BMS, Definition 5.1 and Proposition 5.6, pp.233,237–238; and injectivity on the Nygaard graded term in Proposition 8.13(3), p.274. KY, Construction 2.6/Theorem 2.11, pp.13–15, retains the shifts and the base-ring tensor for full de Rham complexes. The source-caution paragraph also keeps the specified prelog factors and section base. The completed torsion-sum test uses coordinates with unbounded orders, avoiding Bhatt Remark 8.7's p-torsion example, p.32.

The suggested file represents all 474 mathematical names of the plan: 133 typed names and 341 distinct, explicitly omitted names with their mathematical contracts. Fifty named tests are actual `example`s. The omissions are the accepted plan's omissions, principally animated carriers, mapping spaces, enhanced filtrations, log objects and neighbouring interfaces. Their absence is stated, and no arbitrary `Prop` field or assumed comparison conclusion substitutes for them. This is consistent with the nonexhaustive prototype rule of §13 and the accepted input's explicit scope. The README remains the full specification.

## Corrections made

1. The completeness citation now distinguishes Lemmas 93.1–93.3 from Definition 93.4. The reflector/Koszul-limit/Nakayama citation now gives the actual Stacks chapter pages 264,267–268 for Lemmas 93.10,93.18,93.20, tags 091V,0920,0G1U. The bibliography identifies chapter build 88ff78 of 14 July 2026.
2. A duplicated proper-cohomology citation was consolidated. Lemmas 36.30.1 and 36.30.4 have tags 0A1H and 0B91; Section 36.30 has tag 0A1G. The page locator remains pp.73–74 of Derived Categories of Schemes.
3. Suggested.lean no longer mentions the packet, PROTOCOL, a numbered review round or an inspected-source workflow. Rational comparison and flat-lifting comments instead state the mathematical arguments/interfaces required by the README.
4. Four Witt omission comments now assign animation/left Kan extension to DD.4 and only the classical smooth Witt/Nygaard input to CR.4. Their theorem hypotheses are unchanged.

Validation: the accepted packet checker reported **0 errors and 0 warnings**; the complete package inventory and prerequisite audit passed; JSON and single-line TOML checks passed; `git diff --check` passed. Final Lean elaboration returned exit status 0 with **133 `sorry` warnings and no other diagnostics**. No packet, atlas data, link map or neighbouring roadmap was changed. No further package correction is required by this review.
