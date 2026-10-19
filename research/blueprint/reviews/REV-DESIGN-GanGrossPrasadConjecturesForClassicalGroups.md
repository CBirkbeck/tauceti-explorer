# Independent review: Gan–Gross–Prasad framework

Accepted as a target-level planning pass on 2026-10-19. Reviewer: Codex (GPT-6), session `codex-OwKger`; job `REV-DESIGN-GanGrossPrasadConjecturesForClassicalGroups`, issue #3536. The design was written by another worker. The packet contains an individual verdict and reason for every node.

Acceptance concerns the correctness and honesty of the plan. It does not certify completion of its analytic proofs, its unregistered suppliers, or a formalization. The fifteen named proof and supplier contracts remain explicit. All nine layers are planned, none closed; their targets are realised and their remaining contracts are listed. The internal target graph is acyclic. The framework-before-comparison-before-arithmetic scheduling requirement in J1 remains necessary.

## Counts and scope

| Item | Before | After |
| --- | ---: | ---: |
| Nodes | 61 | 61 |
| Definitions / constructions | 24 / 4 | 24 / 4 |
| Theorems / lemmas / comparisons | 23 / 2 / 8 | 23 / 2 / 8 |
| API items / discriminating tests | 113 / 84 | 113 / 84 |
| Planets | 39 | 39 |
| Baseline declarations | 4 | 5 |
| Requests / explicit gaps | 12 / 15 | 12 / 15 |
| Routed source items | 44 | 44 |
| Verified / corrected / added / unverifiable nodes | — | 49 / 12 / 0 / 0 |

Read all 61 statements, hypotheses, proof sketches, prerequisite interfaces, APIs, tests and uses. Every definition/construction has three tests. The tests distinguish such errors as independent inner twists, a wrong complement, missing dualization, a quotient sign group, non-neat unweighted sums, and an Abel–Jacobi conclusion substituted for Chow nonvanishing. The existing 39 planets name central definitions, constructions and theorems. No node or Lean change was needed for API, tests or planet names.

## Corrections made

1. Corrected eleven node locators, checking the actual version-specific pages:

   | Target | Corrected source location |
   | --- | --- |
   | Relevant pair | JZ §2.1 p. 750; §3.2 p. 762 |
   | Global coherent packet | JZ §§6.2–6.3 pp. 802–804 |
   | Weak base-change uniqueness | BPLZZ Definition 1.6 and following paragraph pp. 3–4 |
   | Bessel Fourier coefficient | JZ §2.3 (2.7)–(2.9) pp. 754–755; (4.7) p. 766 |
   | Raw local period | NV §25.4 pp. 168–169, alongside §18 p. 121 |
   | Isotropic eigenvectors | NV Lemma 13.1 and proof pp. 93–94 |
   | Infinitesimal parameter | NV §15.1 p. 103, alongside Lemma 15.2 pp. 104–105 |
   | Rankin–Selberg weights | NV Lemma 15.3 and §15.4 (15.3) pp. 105–107 |
   | Local period support | NV §20 p. 142; Remark 22.1 p. 145, replacing nonexistent §21.1 |
   | Weighted limit | NV Theorem 30.1 p. 194; proof pp. 196–199; Corollaries 31.4/31.8 pp. 201–202 |
   | Weak subconvexity | NV §§26.4–27.2 pp. 177–182; §§31.2–31.6 pp. 201–204 |

2. Corrected O2: NV 24.4 is a remark about positive majorants; Theorem 24.5 supplies cuspidal-type allowability. It is not a separate supercuspidal-type Theorem 24.4 followed by a general approximation theorem. Definition 24.3's two positive approximation conditions remain essential.

3. Narrowed the ClassicalGroups request to its actual complex finite-dimensional GL/SL/O/Sp scope. It does not supply general-field U/SO groups. GN.2 already supplies the signed-hermitian isometry group, including its adjoint and transport; Tau Ceti supplies SO. O1 now explicitly includes the remaining general-field Lie/flag and scalar-extension comparison. No group carrier is planned twice.

4. Removed the direct `MC.0/graph-correspondence` prerequisite from the weak arithmetic proposition. Its supplier is restricted to smooth projective schemes and contravariant projective correspondences. LTX's CM setup allows the totally real base to be ℚ and does not impose projectivity on this conjecture. U1 now requires the smooth quasi-projective Chow class of a closed graph, its dimension, Hecke actions and coefficient quotient. Separatedness gives the closed graph; projective MC.0 applies only in its valid subcase. No unjustified properness or field restriction was added to LTX's statement.

5. Added the existing pinned SO spinor norm as a direct prerequisite of the weighted-limit node. The exceptional self-twist hypothesis therefore no longer hides this algebraic input. The classical convention on SO agrees with the pinned convention, as detailed below.

6. Corrected numerical-volume ownership: OrthogonalSpinGroups already names OrthogonalTamagawaAndLatticeMass as its orthogonal successor. A1 imports that owner's SO computation, including the anisotropic rank-two torus. The proposed AA.2 Part II and its request now cover the unitary computation, avoiding a competing orthogonal project.

7. Added independent confirmation/reasons to all six `sourceIssues`; synchronized the reader, source-reading metadata, arithmetic ownership and roadmap introduction. All node statements, hypotheses, APIs, tests, proof steps and locators were checked for reader agreement after editing.

## Baseline checks

The four original citations were confirmed at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. None was removed or renamed. One existing declaration was added.

| Declaration | Actual module and capability |
| --- | --- |
| `Representation.IntertwiningMap` | `Mathlib/RepresentationTheory/Intertwining.lean`: native algebraic linear map with its commutation equation; no continuity supplied. |
| `Representation.dual` | `Mathlib/RepresentationTheory/Basic.lean`: algebraic dual action by precomposition with the inverse; no smooth-dual assertion. |
| `Finset.prod` | `Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean`: finite product and its additive generated sum. Lean elaboration confirms the generated sum used by the suggested file. |
| `TauCeti.QuadraticMap.specialOrthogonalGroup` | `TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup.lean`: orthogonal subgroup intersected with the determinant-one kernel. The current library moves it into `OrthogonalGroup/Basic.lean`. |
| `CliffordAlgebra.spinorNorm` (added) | `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Basic.lean`: homomorphism on SO of a finite-dimensional nondegenerate form over a field with 2 invertible, valued in the multiplicative square-class group. |

Read the added definition, its orthogonal descent and reflection formula at the pin, and compared the current library. The pin uses the star-norm convention with a minus sign on each orthogonal reflection. In a determinant-one reflection factorization there are evenly many reflections, so these signs cancel. Only its SO restriction is imported; no claim that the pinned orthogonal extension has the current reflection convention is made.

## Sources and source corrections

The source files were read at the node locations, with source-specific printed pagination; source passages are not reproduced. Public versions and hashes are recorded in the packet and roadmap:

| Source | Version read and main checked endpoints |
| --- | --- |
| [GGP](https://numdam.org/item/AST_2012__346__1_0.pdf) | Astérisque 346 (2012), §§2,12,14–15,17,23–26; models, local propositions, coherence and global propositions. |
| [Jiang–Zhang](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p02-s.pdf) | Published Annals 191 (2020); relevant forms p. 750, Fourier construction pp. 754–755, packets pp. 760–763, periods pp. 766–767/785, global ranges pp. 802–805. |
| [BPLZZ](https://arxiv.org/pdf/1912.07169v3) | arXiv v3; Definitions 1.5–1.6, Theorems 1.8–1.10, Lemma 4.9, Theorem 4.14, Remark 4.17. |
| [BCZ](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00129-1.pdf) | Published IHÉS 135 (2022), §§1.1.2–1.1.6 pp. 184–188 and §10.3.5 p. 325. |
| [Nelson–Venkatesh](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf) | Published Acta 226 (2021), cited parts of §§13–15,18,20–22,24–27,30–31; statement of Theorem 30.1 p. 194 checked separately from its proof. |
| [Beuzart-Plessis](https://smf.emath.fr/system/files/filepdf/smf_ast_418.pdf) | Astérisque 418, Theorems 1/5, Proposition 6.4.1, Theorems 7.2.1/11.4.2/12.4.1. |
| [Gan–Ichino](https://arxiv.org/pdf/1409.6824) | Served v2, Propositions 9.3–9.4 pp. 50–52. |
| [Mœglin–Waldspurger](https://webusers.imj-prg.fr/~jean-loup.waldspurger/GPIII-01022010.pdf) | Author version 1 February 2010, introduction pp. 1–4, §1.3 p. 6, §3 pp. 39–41. |
| [Luo](https://arxiv.org/pdf/2009.13947) | 99-page arXiv version, introduction and Theorem 8.3.2 p. 62. |
| [Harris](https://arxiv.org/pdf/1201.0518) | arXiv v2, Conjecture 1.3 pp. 3–4, Proposition 2.1/proof pp. 5–7, Theorem 2.12 pp. 22–23. |
| [LTX](https://par.nsf.gov/servlets/purl/10323568) | Maintainer-cleared published Inventiones 228 (2022) copy, read in place: pp. 110, 116–119, 140, 143–147, 286, 308, 315. No file or passage was copied. |

All six carried findings are confirmed independently at their locations. E1's repaired higher-rank/global argument and dihedral self-twist calculation are reused from the existing independent NV review, which was read; this is not a claim of a new erratum or a fresh end-to-end reconstruction of that proof.

| Issue | Review reason |
| --- | --- |
| E1 | NV p. 182's universal spinor-image step fails in the rank-two torus situation. The SO₃/SO₂ weighted equality needs the stated non-self-twist restriction; the factor-two bound suffices for the broader little-o endpoint. |
| E2 | JZ p. 762's trailing exponent gives total size dim V+2. The corrected partition sums to dim V and agrees with p. 755. |
| E3 | JZ p. 750's cocycle belongs to the quasi-split source before twisting; simultaneous relevant twists preserve the inclusion. |
| E4 | BPLZZ Remark 1.7/Theorem 4.14(4) omit a cuspidal-source condition used in (1)–(2) and the proof. The packet retains it. |
| E5 | NV p. 142's bibliography key is wrong; BP p. 163 identifies the intended Waldspurger Proposition 5.7. Its original proof remains L4. |
| E6 | LTX p. 315's coefficient-field Chow assertion contains no λ; the later λ-adic Abel–Jacobi nonvanishing assumption is separate. |

The local trace, distribution uniqueness, generic reduction and other original proofs explicitly left in L1–L4/P2 are not claimed as fully audited. Their target statements and the honesty of those remaining obligations were checked.

## Ownership, checks and handoff

Read the actual cited supplier statements for the adelic measures, AF representation categories/Flath/decay, AL factors, Arthur classification, smooth induction, graph correspondence and Shimura functoriality. Read current ClassicalGroups and CompactGroups interfaces and the relevant OrthogonalSpinGroups material; screened the nine newer upstream roadmap scopes. The reviewed library-coverage audit gives no built GGP theory to duplicate. Current TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were inspected read-only. Existing intertwiners, duals, sums, SO and spinor norm are imported rather than planned again.

Validation completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/GanGrossPrasadConjecturesForClassicalGroups.json`: zero errors, zero warnings.
- `lean-check research/blueprint/suggested/GanGrossPrasadConjecturesForClassicalGroups.lean`: passed at the shared pinned build, with only fifteen expected `sorry` warnings. The 119-line suggested file is unchanged: two light real-bodied definitions, nine theorem signatures, six examples.
- Reader/packet comparison: every node statement, hypothesis, API item, test, acceptance condition, proof step and source locator agrees after correction.
- Submission file-rule check and `git diff --check`: passed.

Handoff: this review is complete; no second job is claimed. Packaging may use the accepted packet and synchronized reader. It must preserve the fifteen named incoming/proof-refinement contracts, especially the broader Chow graph interface in U1, the general-field comparison in O1, the existing orthogonal volume owner in A1, and the forward-framework/returned-theorem scheduling split in J1. No unresolved question blocks this review; registering and discharging those contracts remains programme work, not an assertion that those suppliers are implemented.
