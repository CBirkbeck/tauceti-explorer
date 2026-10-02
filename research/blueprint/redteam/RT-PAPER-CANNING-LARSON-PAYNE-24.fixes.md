# FIX-RT-PAPER-CANNING-LARSON-PAYNE-24

Codex — session `codex-J6LwjP`; issue #5520; 2 October 2026.
Applied the five findings confirmed in the red-team verification. This is a
complete repair of the extraction's contracts and provenance, with the Mukai
geometric repair explicitly retained as an unresolved proof dependency, as the
issue permits. It does not claim a complete proof of the paper's missing steps.

## 1. Half-spin bundle, central inertia and Mukai consumers

Replaced /60's unconditional `BSO_10` half-spin bundle and literal quotient
equivalence with a construction on a Spin lift and explicit gates /95–96.
Over C, `−1` acts as `−Id` on `S^+`, so the representation does not descend
through `Spin_10→SO_10`. The full `μ4` center acts by scalars on `S^+` and
trivially on the projective incidence data. The effective projective group is
`PSO_10`. Changing the group name would retain ineffective central inertia and
would not descend the vector bundles.

Gate /95 requires the curve-specific lift, central rigidification and actual
moduli-stack equivalence, including isomorphisms, genuine curve automorphisms,
base change and forgetting markings. Gate /96 requires bundle descent or
specified character/twisting data, the corrected Hodge/cotangent identifications,
and rational Chow/cohomology comparisons. CKgP transfer must commute with
exterior products for every allowed test stack; cohomology agreement alone is
insufficient. The bundles `S^+`, `L_i`, `Q_n` and the lifted tautological bundle
have nontrivial scalar weight and cannot descend unchanged. The pulled-back
Hodge bundle has trivial removed inertia. Every claimed descent must check the
full `μ4`, including a generator, rather than just the Spin-to-SO kernel.

Items /61–65 now state conditional contracts. Theorem 1.10 (/26), its genus-seven
CKgP table and the applications using that base case retain explicit proof
dependencies. Their final statements remain targets; no counterexample is
asserted. The valid /59 ambient `BSO_10` calculation is not automatically a
calculation on `BSpin_10` or `BPSO_10`. The reader explains these distinctions.

New library item /94 imports, rather than reconstructs, the declarations
`TauCeti.spinPlus`, `spinPlusAction`, `spinPlusSubrep` and `finrank_spinPlus`.
Read their actual statements at TauCeti pin `f790474`: [HalfSpin.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Spin/HalfSpin.lean)
and [Dimension.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Spin/Dimension.lean).
The action/subrepresentation require `P.line=⊥`; dimension requires a field,
finite-dimensional `P.W` and `P.W≠⊥`. Rank 16 is the `dim W=5` specialization.
These are representation primitives, not stack/bundle comparisons.

Read the reviewed `R09.4/R09.5` library audit and stage contracts. General stack
and rigidification machinery remains imported from those layers, while the new
curve-specific gates are routed once to `MotivicStructuresInModuliOfCurves`.
No existing roadmap or atlas data is edited. Both new gates include statements,
source locators, prerequisites, sample API and positive/negative checks.

Added source issue E2 against published §5.3.2–3 p. 20 and matching arXiv v3
pp. 21–22. It records the false intermediate bundle/construction claims and
missing descent/transfer steps, without asserting the final theorem false.

## 2. Cycle grading and Tate twists

Corrected /13 and the MC.2 source route to rational coefficients and codimension
grading `A^c→W_{2c}H^{2c}`; dimension grading on pure dimension d is
`A_i→W_{2d−2i}H^{2d−2i}`. Proper pushforward carries the corresponding degree
shift. Twisted Hodge/Galois targets have `(c)` explicitly; untwisted classes
have type `(c,c)` and Tate type `Q(−c)`. The reader uses the same conventions.
Preserved /44 verbatim, including its ungraded surjectivity.

Tests: on P², fundamental class, line and point have degrees 0, 2 and 4; the
point class commutes with the Gysin pushforward from Spec C to degree 4 with
twist (2). The twisted class has weight zero.

## 3. Proper compactification versus smooth open stack

The route now requires, for `2g−2+n>0`, a smooth proper DM compactification
`M̄_{g,n}` and its smooth open `M_{g,n}`, which is not generally proper.
The reader keeps ordinary, compactly supported and Borel–Moore theories
separate. Correct item /2 is preserved verbatim.

Regression: `M_{0,4}=P¹\{0,1,∞}` and `M̄_{0,4}=P¹`. Cross-ratio t over
C((t)) has no smooth extension at t=0; it extends to the stable nodal boundary.
The valuation of t is 1, so the required inverse 1/t is not regular on the
smooth punctured chart at the special point.

## 4. Recoverable prerequisite bindings

| Original entry | Correct input and use |
| --- | --- |
| 4 | Canning–Larson `2208.02357`, published [5]: Theorem 1.4, §3.1, Lemmas 3.11 and 10.5 for CKgP and Lemma 5.1. |
| 7 | Petersen, Pacific J. Math. 275 (2015), 39–61, DOI `10.2140/pjm.2015.275.39`, [27], Theorem 2.1 in Proposition 2.8. Separate compact-type paper `1310.7369`, [28], Theorems 2.1 and 3.8. |
| 9 | Petersen–**Tavakol**–Yin `1705.08875`, **[29]**, §§3.2, 5.1 and 5.2.2 in Lemma 3.1. Reference [30] is Petersen–Tommasi. |
| 10 | Mukai, *Curves and symmetric spaces I*, DOI `10.2307/2375032`, [21], Theorem 0.4, Proposition 2.2 and §5; part II is distinct. |
| 15 | Totaro `1407.1366`, *The motive of a classifying space*, [34], Theorem 4.1 in Remark 5.12. |
| 16 | Bergström–Faber `2207.05130`, [3], for genus-three computations. Separate Bergström software [2] for the Getzler–Kapranov calculation (7.1). |

Removed `2110.01059` from the CKgP binding. That paper is a distinct Hurwitz
Chow-ring input; the actual main-paper reference [7] used for the determinant
base stack is Canning–Larson `2103.09902`, §3 and Definition 5.2, now separately
listed. No unrelated arXiv identifier substitutes for [5] or [7]. Corrected
Orlando to **Orsola Tommasi**, Allan to **Andrew Kresch**, and e22 to **e23**.
Primary arXiv records, publisher records and the main paper's pp. 30–31
bibliography support the repaired titles/authors/identifiers; the main paper's
consumer passages specify the actual theorem/section uses.

The software repository is a separate prerequisite. Its exact historical
commit, data, inputs and execution behind the value 836 have not been pinned
or reproduced here. The result, route, /75 and reader explicitly retain that
reproducibility gap. A corrected link does not certify the calculation.

## 5. Induction subgroup in the graph argument

Added source misprint E3 against published p. 27 and matching v3 p. 29.
The corrected proof input in /75 and the reader is
`Ind_{S10×S2}^{S12}(sgn⊠1)`. The stabilizer of an unordered pair includes S2,
acting trivially; S10 acts by sign on the other labels. The printed induction
has dimension 132, while the intended one has dimension 66. Pieri gives
`(2,1^10)` and `(3,1^9)` with hook-length dimensions 11 and 55.
Preserved the intended `891−55=836` argument and final Lemma 7.3 target.

## Source collation and correction search

Read the published 31-page PDF and the 33-page arXiv v3 PDF on 2 October 2026.
Visually checked the decisive published pp. 20 and 27 and v3 pp. 21 and 29;
the defects occur in both. `sourceVersions` records full hashes, URLs, dates
and scope. The current Cambridge watermark changes its bytes relative to the
red-team download, so no byte-identity claim is made for that PDF. The v3 hash
matches the red-team version.

The bounded search checked the arXiv history (still v3), the Cambridge article
record/HTML and PDF, Sam Payne's current publication page, and title-specific
erratum/correction searches. No correction was found there. The linked
author-copy PDF returned HTTP 403 and was not collated. E2/E3 have no invented
independent-review verdict. The historical root review and confirmed E1 are
unchanged.

## Validation and remaining proof work

The inventory is now **96 items: 2 library, 4 planned, 90 missing**. Four routes
cover the 90 missing items exactly once (86 new, 2 SF.5, 1 MC.2, 1 SF.2), with
20 prerequisites and three source issues. No ownership changes were needed.

Executed exact Python regressions for the full μ4 scalar-weight model over
F5 (including generator and −1), the 16-dimensional even exterior model,
all partitions of 12 for the horizontal-two-strip and hook-length tests,
the two stabilizer signs, 66 versus 132, 891−55=836, P²/Gysin/Tate grading,
the cross-ratio valuation guard, exact routing and acyclic item dependencies.
Confirmed that item /2, item /44, the root review and E1 remain byte-for-byte
equal as JSON values. These are small exact checks, not a Spin-group proof,
a Lean elaboration, or a reproduction of the 891-graph/software calculation.

`scripts/check_paper.py`, source-issue/version validation, scoped intake
`check-files`, and `git diff --check` pass. No blueprint packet or suggested Lean
file is a deliverable of this issue; no Lean compilation was run. The new
roadmap design must discharge /95–96 and the historical software reproducibility
prerequisite before advertising the corresponding proof inputs as established.
