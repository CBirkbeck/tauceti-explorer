# Independent review of Automorphic Galois Representations Part II, AG2.0–AG2.5

Job `REV-AutomorphicGaloisRepresentationsPartII--AG2.0`, issue [#361](https://github.com/CBirkbeck/tauceti-explorer/issues/361). Reviewer: Codex, session `codex-obzmNj`, 7 October 2026. The input was written by sessions `cc-fb70e5` and `codex-Q1w8rI`; this reviewer did neither planning job.

**Verdict: `needs_changes`. This review is finished.** The corrected packet and suggested file have a sound target-level planning pass, with precisely recorded requests and source gaps. Acceptance is withheld because the definitive [reader](../readmes/AutomorphicGaloisRepresentationsPartII--AG2.0.md) still reproduces the incorrect hypotheses, examples and owner links corrected here. Its node fields were identical to the submitted packet, including every statement, hypothesis, proof step, API item, test and prerequisite. Issue #361 names the packet, suggested file and review report as editable deliverables and says to edit only the files under review; it does not authorize editing that reader. A revision must regenerate its declarations and refresh its prose, requests, gaps and source-issue discussion before acceptance. There is no need to reopen the entire mathematical pass merely because its already recorded supplier work remains open.

## Counts and coverage

| Item | Submitted | Corrected |
|---|---:|---:|
| Nodes | 77 | 77 |
| Definitions / constructions | 5 / 12 | 5 / 12 |
| Lemmas / theorems / comparisons | 5 / 44 / 11 | 5 / 44 / 11 |
| API items | 78 | 84 |
| Unit tests | 58 | 58 |
| Planets | 35 | 35 |
| Baseline declarations | 4 | 4 |
| Supplier requests | 50 | 50 |
| Gaps | 12 | 13 |
| Source issues | 4 | 5 |
| Restructure notes | 2 | 3 |

There are 36 corrected and 41 verified nodes, with no added or unverifiable node. No baseline citation was removed or replaced. All 17 definitions/constructions have at least three discriminating tests. The six added APIs are the dominant-weight constructor, coordinate extensionality, base-change identity and composition, and the Hodge–Tate multiset cardinality and no-repetition properties. Test categories `value` and `small` were changed to the protocol's `computation`.

The seven mathematical stages remain `planned`, with precise remaining contracts/gaps. AG2.1 remains the `source_decomposed` process aggregate of AG2.1a/b, without independent targets. All stage targets have a producer, imported request or explicit gap; none is `closed`. The complete pass has 77 nodes under the protocol’s 300-node budget. The 35 planets have counts 4, 6, 4, 3, 6, 6, 6 in AG2.0, AG2.1a, AG2.1b, AG2.2, AG2.3, AG2.4, AG2.5 respectively; names identify mathematical landmarks and meet the length bound. Implementation status remains `unchecked` throughout.

## Corrections of substance

1. **Weight examples and Frobenius conventions.** Classical weight `(k−2,0)` is dominant only for integer `k≥2`; both affected tests/acceptance statements now say so. The elliptic `Sym^(n−1)` test requires `n≥1`. For Δ at 2, if β are roots of `X²+24X+2¹¹`, the original modular representation has geometric roots β⁻¹ and its dual has roots β. The Hodge–Tate example now distinguishes changing convention for a fixed representation from taking its dual.
2. **Geometric examples.** Shin's compact rank-three variety is a surface. A signature `(3,3)` variety has complex dimension `9[F⁺:Q]`, not six. An empty Kuga-power selector is the trivial coefficient only when the central Tate twist is also trivial; the test now fixes `ξ=1,m=t=0`. The tensor-monodromy test now says explicitly that the other factor has nonzero N; the actual square of an N=0 representation has N=0.
3. **Direct proof inputs.** Added IG.1 for the global Mantovan almost-product formula, AF.1 for the cohomological archimedean packet/Lie-cohomology calculation, AF.4 for the definite-unitary Banach forms/classicality input, arbitrary-regular polarized existence for the CS discrete factors, the WD carrier for the tensor example and arithmetic semisimple recognition for the late modular comparison. Requests identify the exact extensions required. General recognition uses the corrected arithmetic blueprint over any number field with continuous embeddings; the narrower integrated G_Q/residual statement is insufficient on its own.
4. **Polarization owner.** The generic representation/sign/CHT-group carrier belongs to ArithmeticGaloisRepresentations G7. GlobalGaloisDeformations G7 concerns a residual polarized deformation problem and has extra residual/Schur/prime assumptions. Both uses and the request now name the generic arithmetic owner. The final sign assembly states the orthogonal sum of fixed irreducibles and hyperbolic pairing of exchanged pairs.
5. **CH hypotheses.** The definite family needs every Special Hypothesis 1.2, including sphericality at nonsplit places. Its finite-slope step is the even-rank §2 theorem; the final arbitrary-rank result has a separate odd geometric branch. The field-hypothesis removal now cites the first paragraph of the proof of 3.2.3 for the arbitrary-regular finite-slope case as well as 3.1.2 for slight regularity. The rationality node's obsolete AG2.7 pointer now identifies the late AG2.3 realization theorem and its AG2.6 Hodge input.
6. **HLTT spaces and slopes.** Finite-slope dagger sections embed into ordinary *formal* sections, not global classical sections. Proposition 6.15 has coefficient trace factor `p^(mn[F:Q])`; Corollary 6.17 changes slope bound `a` to `a+mn[F:Q]`. Both are explicit. The boundary-support definition is in §6.5, and 6.17 is a corollary.
7. **Product nearby cycles.** The Künneth comparison is Caraiani Proposition 3.9; the single-chart and induced product-monodromy formulas are Propositions 4.6 and 4.10, not theorems. Corollary 4.29 uses the kernel/image bifiltration of total N. The characteristic-zero coefficients and common trait of §4.2 are explicit. Corollary 5.9 is stated for rank at least two; rank one is handled separately by the character dictionary.
8. **Early trace ownership.** Reading the actual EDC.8 statement revealed that it supplies trace classes and sends the stronger fixed-point theorem to ET.5. A trace-class construction does not prove the required raw Hecke–Frobenius equality. A new gap and owner-refinement note require a single generic geometric theorem before Igusa stabilization; the ET.5 application must consume it. This preserves the red-team construction order without silently claiming an existing supplier provides more than its statement.

Other locator fixes: TY coefficient projector, shifted-degree identity and commutation are on p. 12; Shin Lemma 5.1 begins on p. 30, Corollary 6.5(iv) is on pp. 47–48 and Corollary 6.8/Remark 6.9 on p. 49; Varma's proof begins on p. 19; BLGGT's twisting proof uses the phrase “by a twisting argument” on p. 34; CH's rank-two remark is in §3.2 on p. 9. The Shin coefficient definition's excerpt was corrected to the actual word “Define”. The relevant coefficient field now explicitly uses the finite part `π^∞`.

## Pinned baseline and library audit

All four statements were read at Mathlib commit `082e2d37e8b0463410cdb532e111cd43d5a66174`, rather than inferred from names:

| Declaration | Actual content and use |
|---|---|
| `NumberField.IsCMField` | Under field/characteristic-zero instances, total complexness and quadraticity over the maximal real subfield. Number fields meet these hypotheses. |
| `NumberField.IsCMField.complexConj` | The `K⁺`-algebra equivalence of K; requires the integral ℚ-algebra instance, supplied by a number field. |
| `NumberField.IsCMField.complexEmbedding_complexConj` | For a complex embedding φ, `φ(complexConj K x)=conj(φ x)`. This is exactly the conjugate-embedding identity in the weight dictionary. |
| `Multiset.prod_X_sub_C_coeff` | For a commutative ring, a multiset s and `k≤s.card`, coefficient k is `(−1)^(s.card−k)*s.esymm(s.card−k)`. No additional division or field hypothesis is needed for the Hecke polynomial. |

[CMField source at the pin](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/CMField.lean) and [Vieta source at the pin](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Polynomial/Vieta.lean) support these uses. The declared Tau Ceti baseline is `f790474821cf4256814db967cb154e7af3d0c369`; this packet has no Tau Ceti Lean declaration in `baseline.declarations`.

The reviewed `data/library-coverage.json` was read for AG2.0–AG2.7 and the relevant generic owners. No built library layer is newly planned. Both upstream models, `RepresentationTheory/SemisimpleAlgebras/README.md` and `RepresentationTheory/SchurWeyl/README.md`, were read in full. Their generic Schur, Artin–Wedderburn, isotypic, Young and tensor-realization theory stays with them. Only the geometric graded-permutation, central-character/Tate normalization and trace-pairing applications are requested here. AF.4 highest weights/rationality, IHG.3 polynomial identities, IHG.4 interpolation/separation, R01 WD/recognition and arithmetic G7 polarization likewise retain their generic owners.

## Sources and independent error checks

All 20 cited public PDFs were fetched afresh and each SHA-256 matches its packet record. Every one of the 98 submitted node excerpts was matched against normalized extracted text; surrounding statements and hypotheses were read, and the incorrect locators above were corrected. The corrected packet has 99 node source entries after adding CH's arbitrary-regular field-removal passage. The publication PDFs used to collate BLGGT and Caraiani are additionally recorded in `sourceVersions`, with URL, date and hash. Earlier source-version records are preserved as author history; the review's fresh acquisition claim concerns the 20 cited sources and these two additional PDFs.

The primary versions are:

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4) — `blggt-potential-automorphy`.
- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf) — `accplus-cm-potential-automorphy`.
- [On the sign of regular algebraic polarizable automorphic representations](https://arxiv.org/pdf/1306.1242v2) — `patrikis-sign`.
- [On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf) — `hltt-rigid-cohomology`.
- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf) — `chenevier-harris-II`.
- [Local-global compatibility for regular algebraic cuspidal automorphic representations when l is different from p](https://arxiv.org/pdf/1411.2520) — `varma-local-global`.
- [Local-global compatibility and the action of monodromy on nearby cycles](https://arxiv.org/pdf/1010.2188) — `caraiani-monodromy-away`.
- [Monodromy and local-global compatibility for l = p](https://arxiv.org/pdf/1202.4683) — `caraiani-monodromy-at-p`.
- [Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf) — `shin-compact`.
- [Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf) — `shin-igusa`.
- [Compatibility of local and global Langlands correspondences](https://arxiv.org/pdf/math/0412357) — `taylor-yoshida`.
- [Rigid analytic spaces with overconvergent structure](https://arxiv.org/pdf/1408.3329) — `grosse-klonne-dagger`.
- [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf) — `cs-generic-published`.
- [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595) — `newton-thorne26`.
- [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568) — `liu-et-al22`.
- [Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf) — `bcgp21-purity`.
- [Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645) — `bcgp25-racsdc`.
- [The sign of Galois representations attached to automorphic forms for unitary groups](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/D778DCD413972E114657F69ACC7BB6BC/S0010437X11005264a.pdf/the-sign-of-galois-representations-attached-to-automorphic-forms-for-unitary-groups.pdf) — `bellaiche-chenevier-sign`.
- [A family of Calabi–Yau varieties and potential automorphy](https://annals.math.princeton.edu/wp-content/uploads/annals-v171-n2-p04-p.pdf) — `hsbt-character`.
- [Level-raising and symmetric power functoriality, III](https://www.repository.cam.ac.uk/bitstreams/dc59bf8c-174b-4034-9f2f-070974d101af/download) — `clozel-thorne17`.

The existing E1–E4 were independently checked and each received a confirmed verdict naming this review job. E5 was added with its own confirmed verdict:

| Issue | Independent evidence and scope |
|---|---|
| E1 | The published BLGGT definition on p. 536 repeats the out-of-scope multiplier name μ where the introduced automorphic character is χ. This is a notation misprint. |
| E2 | The algebraic-character calculation gives `r(χ)(c)=(−1)^w χ∞(−1)`, hence corrected parity `χ∞(−1)=(−1)^(n+w)`. A rank-one CM elliptic Hecke character of weight `(1,0)` satisfies the printed parity but gives multiplier +1, impossible for a polarization on a line. Patrikis Proposition 4.1 and BC's character-sign formula agree. Published BLGGT retains the problem on pp. 536–538. |
| E3 | Exact rational six-by-six matrices independently verify the q=4 example: pure N has power ranks `[4,2,1,0]`, impure N `[4,2,0,0]`; both satisfy `FNF⁻¹=N/4` and maximal rank four. The graded dimensions `(1,2,2,1)` bound rank by four. Block centers are `(0,0)` versus `(1,−1)`. This disproves general maximal-rank uniqueness, without claiming the restricted BCGP application fails. |
| E4 | For n=4 the exterior-square domain GL4 has dimension 16, whereas GL6 has dimension 36. The map is finite-kernel onto its image, not an isogeny onto GL6. The packet uses CH's first eigenvariety/fixed-weight proof and leaves coefficient-prime assertions to AG2.6. |
| E5 | Caraiani's proof of 7.4 assigns weight `2n−2` to the individual tempered normalized L_n parameter; its weight is `n−1` and its tensor square has weight `2n−2`. The same sentence is in the published typeset copy on p. 2409. The source's main compatibility theorem is unaffected; the packet's factor-weight statement was already correct. |

Publication collations: [BLGGT, Annals 179](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p03-p.pdf), SHA-256 `c9d6c7107bcde7fb26f9388abea5209f28457076bae59d70ccb6c34bbe1d621b`; [Caraiani, published typeset author copy](https://www.ma.imperial.ac.uk/~acaraian/papers/lgc1.pdf), SHA-256 `9801588a90444b611e10fe810c11c0099b54af4871217f3b7cf2c493d00595fe`. The recorded existing erratum/version searches were read; fresh searches and author-page checks found no correction for E5. This is a statement about the places checked, not proof that no correction exists anywhere.

## Eight handed red-team findings

| Finding | Packet and reader assessment |
|---|---|
| RT-AREA-langlands-1/2 | Raw coefficient/fixed-point/nearby-cycle nodes precede LLC and stabilized Igusa traces. The reader already states that order. The new EDC8/ET5 gap identifies the actual supplier scope mismatch; reader contracts/gap prose need this update. |
| RT-AREA-langlands-1/3 | Global Mantovan includes alternating smooth Ext, level colimit, dimension twist and global equality. Requests include generalized Steinberg/parabolic local formulas, not only supercuspidal input. The reader carries those precise formulas; the added direct IG1 prerequisite must be propagated. |
| RT-AREA-langlands-1/4 | Compact one-signature proper geometry is distinct from quasi-split signature `(n,n)`. Ramified distinguished local factors and exact IG1/ET7b specializations remain requested. Reader dimension test needs the correction recorded here. |
| RT-AREA-langlands-1/5 | Effective Kottwitz triples are polarized O_F-linear, with determinant/local type and α₀. Bare unpolarized Honda–Tate is insufficient. The existing effectivity gap and PEL4 request are explicit in both packet and reader. |
| RT-AREA-langlands-1/18 | TC4 receives arbitrary-regular polarized existence from AG2.3, not Shin's restricted geometric theorem. Residual unramifiedness, distinctness and α_i/α_j≠q are separate AG2.7 exports. Early cohomology never depends on IG7 torsion concentration. Reader routing agrees. |
| RT-AREA-langlands-1/19 | General GL_n WD/polarization stays in R01/arithmetic G7; dedicated GSp4 existence/LLC needs the proposed absent owner, recorded as a gap without invented ids. The reader's explicit G7 supplier must change from deformation G7 to arithmetic G7. |
| RT-AREA-langlands-1/26 | IHG4 owns generic interpolation and factor separation independently of TC2. The real Hasse surjection needs determinant descent along the Hecke quotient; the witness injection alone does not suffice. Packet/reader preserve the explicit quotient bridge gap. |
| RT-AREA-padic-2/32 | RD4 supplies GK comparison and functoriality, RD5 rigid finiteness, RD6 weight lower bounds; F1 supplies the geometric carrier. Intrinsic boundary-pair independence is explicitly not asserted. Reader agrees on scope. |

## Checks and orchestrator follow-up

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicGaloisRepresentationsPartII--AG2.0.json`: zero errors and warnings.
- Source-issue schema/version validation: all five entries and publication records valid.
- Independent own-node DFS: 77 nodes, no cycle. The early raw subgraph has no local Langlands or final automorphic existence input; supplier refinement gaps prevent claims that aggregate cross-roadmap links already establish an acyclic closed proof.
- Packet/suggested-file correspondence: all 77 mathematical signatures, 84 API items and 58 tests present, with individual omitted-carrier notes. No arbitrary `Prop` stand-ins were introduced.
- `lean-check research/blueprint/suggested/AutomorphicGaloisRepresentationsPartII--AG2.0.lean`: exit 0 at pinned Mathlib `082e2d37e8`; only five `declaration uses sorry` warnings. Memory check allowed the single compilation; no language server, project build or cache operation was used.
- `git diff --check`: clean.

Required revision: synchronize the reader with the corrected packet and the five source-issue verdicts, including the finite-part notation and field-realization pointer. The issue must authorize that reader path. Recheck the regenerated document against the packet, then seek acceptance; the existing precisely stated supplier gaps do not themselves force another full planning pass.

Owner work for the orchestrator: reconcile the generic fixed-point theorem before ET5 stabilization; route the corrected arithmetic G7 polarization request; retain the already proposed GSp4 owner and global-number-fields Part II; ensure the corrected general-number-field recognition API replaces the narrow integrated version when its arithmetic revision lands. The packet records these matters without editing supplier roadmaps or promoting data.

## Node-by-node verdicts

1. `AutomorphicGaloisRepresentationsPartII:AG2.0/the-normalization-dictionary-fixed-by-the-sources` — **verified**. HLTT7.13 and Clozel–Thorne notation agree after geometric Artin and the norm twist; the LLC comparison stays late, outside raw geometry.

2. `AutomorphicGaloisRepresentationsPartII:AG2.0/dominant-weights-and-the-weight-w` — **corrected**. BLGGT§2.1 dominance, conjugate-index weight relation and extreme regularity checked. Added k≥2 and constructor/extensionality/base-change laws; CM conjugation baseline supplies the embedding identity.

3. `AutomorphicGaloisRepresentationsPartII:AG2.0/regular-algebraic-of-weight` — **corrected**. Checked Ξ_a dual, C/L algebraicity and integer norm twist in BLGGT/ACC+. Added k≥2 to the classical dominant-weight example and normalized test categories.

4. `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation` — **corrected**. Checked BLGGT polarization, CM parity and totally-real alternative; E1/E2 are independently confirmed. Tests distinguish a normalized automorphic pair from a bare self-duality identity.

5. `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation` — **corrected**. Pairing symmetry and the multiplier sign checked including rank1. Replaced residual deformation G7 by the generic arithmetic polarization/sign/CHT-group carrier.

6. `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character` — **corrected**. BLGGT A.2 and reciprocity give the stated infinity-type, norm and conjugation rules. The imported character carrier is not recreated; normalized computation test categories.

7. `AutomorphicGaloisRepresentationsPartII:AG2.0/sign-of-the-polarization-multiplier` — **verified**. Derived μ(c)=(−1)^(n−1+w)χ∞(−1); the CM rank1 counterexample confirms E2 and the corrected parity. This is a convention calculation, not the automorphic sign theorem.

8. `AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset` — **corrected**. Shift, cardinality, regularity, polarity and twist follow from dominance and the pinned combinatorics. Added n≥1 to the elliptic symmetric-power test and cardinality/nodup APIs; clarified dual versus convention negation.

9. `AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions` — **verified**. ACC+2.2.5/2.3.6 and IHG3 fix the signed integral polynomial and normalized reciprocal conversion. Vieta at the pin has exactly the required coefficients.

10. `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places` — **corrected**. Good-place attachment has continuity, semisimplicity and a finite exceptional set. Corrected Δ: the dual has geometric roots β, the original roots β⁻¹. No ramified or p-adic comparison is inferred.

11. `AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality` — **corrected**. Clozel/ACC+ rationality controls traces, not models; the quaternion Schur-index example is valid. Corrected the stale AG2.7 realization pointer to the late AG2.3 theorem with AG2.6 Hodge input.

12. `AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris` — **verified**. CH3.2.3 removes field, slight-regularity and finite-slope hypotheses through nodes38–46; n1 uses CFT. Its AG2.1a identifier is retained, but the arbitrary-regular existence output depends on AG2.3.

13. `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-construction-of-nonselfdual-systems` — **verified**. HLTT7.13/7.14 construct arbitrary regular algebraic cuspidal systems via boundary cohomology and factor separation. The final good-prime range uses the all-places-above-q hypothesis.

14. `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-semisimplified-comparison-and-monodromy-bound` — **corrected**. Varma8.1,9.1,10.2 and10.3 supply semisimple local agreement and a monodromy bound, not full N equality. Corrected the proof locator to include p19.

15. `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-upgrade-away-from-p-and-temperedness` — **verified**. Caraiani7.4 and CH bound precede the polarized pure-WD upgrade; excluded coefficient-prime places and nonselfdual inputs are explicit.

16. `AutomorphicGaloisRepresentationsPartII:AG2.0/attachment-twist-dual-and-conjugation` — **verified**. Good polynomials determine the twist/dual/conjugation rules by semisimple recognition. The reviewed arithmetic recognition contract is over arbitrary number fields with continuous coefficient embeddings.

17. `AutomorphicGaloisRepresentationsPartII:AG2.0/unitary-similitude-central-character-dictionary` — **verified**. TY/Shin coefficient highest-weight and similitude exponents are retained; central ν powers affect the Tate normalization. This is an owner specialization, not new generic highest-weight theory.

18. `AutomorphicGaloisRepresentationsPartII:AG2.0/prescribed-crystalline-twisting-character` — **verified**. ACC+4.5.1 uses compatible HSBT2.2 unit prescriptions, a split selected p-adic pair and extra allowed ramification outside S; the contract does not promise inconsistent arbitrary local characters.

19. `AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-shin-pel-instance` — **corrected**. Read Shin5.1/5.2: odd n≥3, degree≥2, finite quasi-split compact datum and possibly ramified distinguished factor. Corrected lemma page and the n3 dimension test to2 versus9[F⁺:Q].

20. `AutomorphicGaloisRepresentationsPartII:AG2.1a/kuga-sato-coefficient-projector` — **corrected**. TY projector and exponent2n−1 occur on p12. Corrected the locator and trivial-coefficient test to require ξ=1,m=t=0; the explicit HT recipe remains an honest source gap.

21. `AutomorphicGaloisRepresentationsPartII:AG2.1a/coefficient-projector-degree-identity` — **corrected**. The shifted global cohomology identity follows after the corrected Leray projector, with its Tate twist. Fixed the locator to TY p12.

22. `AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-level-coefficient-cohomology` — **corrected**. The H^k finite-level and tower definitions keep degree, level maps, Hecke and Galois actions. Changed the excerpt to the actual “Define” on Shin p33.

23. `AutomorphicGaloisRepresentationsPartII:AG2.1a/hecke-galois-projector-commutation` — **corrected**. TY p12 gives equivariance after the cohomology identity. Corrected locator; no local Langlands or automorphic existence enters this raw action.

24. `AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-continuous-geometric-galois-action` — **verified**. Proper smooth purity of the genuine Kuga summand fixes k+m−2t, and finite continuous Galois action descends at fixed level. Its geometric suppliers suffice before spectral comparison.

25. `AutomorphicGaloisRepresentationsPartII:AG2.1a/automorphic-multiplicity-spaces` — **corrected**. AF1 gives the compact automorphic decomposition and upstream semisimple algebra gives isotypic evaluation. Exact compact-open invariants supply finite multiplicity spaces; corrected test categories.

26. `AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-fixed-point-trace-identity` — **verified**. Shin Igusa fixed-point count retains coefficients/effectivity. The stronger generic trace theorem is a requested extension: new gap records EDC8 trace-class scope and the ET5 ownership reconciliation.

27. `AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-nearby-cycle-traces` — **verified**. Proper nearby-cycle comparison, Drinfeld/Igusa charts and projector equivariance retain N at ramified distinguished fields. This is the raw geometric trace before LLC.

28. `AutomorphicGaloisRepresentationsPartII:AG2.1b/compact-global-mantovan-formula` — **corrected**. Shin5.2 includes the global Mantovan Ext/colimit functor and twist−D. Added IG1 almost-product directly, alongside HS3 tower and smooth derived Ext contracts.

29. `AutomorphicGaloisRepresentationsPartII:AG2.1b/shin-st-end-igusa-computation` — **verified**. Shin6.1/6.4 ST/END hypotheses, signs and local factors are restricted as in the source; ET5/ET7b supply stabilized trace identities, not universal packet multiplicity.

30. `AutomorphicGaloisRepresentationsPartII:AG2.1b/virtual-weil-constituent-comparison` — **verified**. Virtual constituent comparison is explicitly a Weil Grothendieck identity, with normalized local Mantovan formulas. It is not used as actual multiplicity divisibility.

31. `AutomorphicGaloisRepresentationsPartII:AG2.1b/weight-separation-middle-degree` — **verified**. Shin6.5 uses distinct weights of actual geometric degrees to concentrate at n−1. The unavailable HT p207 cancellation argument is recorded rather than silently supplied.

32. `AutomorphicGaloisRepresentationsPartII:AG2.1b/archimedean-packet-multiplicity` — **corrected**. Corollary6.5(iv) is on pp47–48. Added AF1 exact cohomological archimedean packet and Lie-cohomology contract needed to justify the selected ST/END multiplicities.

33. `AutomorphicGaloisRepresentationsPartII:AG2.1b/actual-galois-constituent-from-cohomology` — **corrected**. Corollary6.8/Remark6.9 are on p49. True irreducible multiplicities, not rank division, yield R̃₀; the unavailable HT VII.1.8 step remains a gap. Tests retain that distinction.

34. `AutomorphicGaloisRepresentationsPartII:AG2.2/shin-regular-geometric-existence` — **verified**. Shin geometric existence has its precise ST/END and weight range; it is not the final arbitrary-regular CH theorem. Coefficient character removal and actual multiplicity prerequisites are present.

35. `AutomorphicGaloisRepresentationsPartII:AG2.2/algebraic-character-polarization-twist` — **corrected**. BLGGT proof p34 says “by a twisting argument”; fixed the excerpt. Clozel–Thorne7.4 checks the rank2 parity specialization; unread CHT4.1.4 remains a gap, not an arbitrary square-root theorem.

36. `AutomorphicGaloisRepresentationsPartII:AG2.2/discrete-unitary-galois-assembly` — **corrected**. HLTT1.2 decomposition retains all m_i,n_i and norm/cyclotomic shifts and assumes actual attached factors individually. Test categories corrected; arbitrary regular factors come from AG2.3.

37. `AutomorphicGaloisRepresentationsPartII:AG2.2/cs-discrete-polarization-normalization` — **corrected**. Published CS5.5.5 has a selected two-block surjective cohomological transfer and parity character ϖ. Added arbitrary-regular polarized existence explicitly for the r_i inputs.

38. `AutomorphicGaloisRepresentationsPartII:AG2.2/attachment-under-solvable-base-change` — **verified**. Solvable base change plus good Satake power identity identifies the semisimple restriction by the corrected general-number-field recognition contract; it is separate from effective descent.

39. `AutomorphicGaloisRepresentationsPartII:AG2.3/definite-unitary-eigenvariety-instance` — **corrected**. Read CH1.1/1.2/2.2: added nonsplit sphericality1.2.2 explicitly and AF4 Banach/classicality prerequisite. Interpolation is even-rank, with fixed other weights and tame Bernstein conditions.

40. `AutomorphicGaloisRepresentationsPartII:AG2.3/strongly-regular-classical-density` — **verified**. CH2.3 invokes definite-unitary classicality/density from Chenevier. L2a only glues supplied families; AF4 owns analytic forms and density, with the uninspected cited proof recorded as a gap.

41. `AutomorphicGaloisRepresentationsPartII:AG2.3/definite-family-determinant-interpolation` — **verified**. CH2.3 characteristic-zero trace/determinant interpolation uses reduced affinoids and common S; reducible specialization continuity is explicitly requested from IHG4.

42. `AutomorphicGaloisRepresentationsPartII:AG2.3/finite-slope-regular-target-existence` — **corrected**. CH2.3 drops slight regularity within §2’s even-rank finite-slope setting. Added that rank restriction explicitly; odd rank comes from the separate geometric branch.

43. `AutomorphicGaloisRepresentationsPartII:AG2.3/s-general-solvable-extension-families` — **corrected**. CH3.1/3.2 cyclic prime-degree Grunwald–Wang and self-twist avoidance produce the exact S-general family. Existing global-number-field extension request is precise; test categories corrected.

44. `AutomorphicGaloisRepresentationsPartII:AG2.3/effective-automorphic-galois-patching` — **verified**. CH3.1 Sorensen patching requires actual semisimple r_i, Galois invariance and compositum compatibility. The generic arithmetic R01.5 theorem is requested, not inferred merely from trace equality.

45. `AutomorphicGaloisRepresentationsPartII:AG2.3/removal-of-geometric-field-hypotheses` — **corrected**. CH3.1.2 has slight regularity; added the first paragraph of3.2.3 which applies the same patching to the arbitrary-regular finite-slope branch.

46. `AutomorphicGaloisRepresentationsPartII:AG2.3/solvable-local-iwahori-reduction` — **verified**. CH local index reduction uses classical local Langlands/base change to kill Weil inertia and obtain Iwahori invariants, not the global AG2.5 compatibility it helps construct.

47. `AutomorphicGaloisRepresentationsPartII:AG2.3/solvable-index-induction` — **verified**. CH3.2.3 induction handles all local solvable indices after field hypotheses are removed. No finite-slope hypothesis persists in the final result.

48. `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-ordinary-boundary-instance` — **corrected**. HLTT quasi-split ordinary boundary datum differs from Shin compact datum; exact compactification, bundles and level conventions are imported. Test categories corrected.

49. `AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-support-dagger-cohomology` — **corrected**. The boundary-ideal log de Rham complex depends on the selected pair; no intrinsic independence asserted. Corrected its definition to HLTT§6.5 and normalized test categories.

50. `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-functorial-dagger-rigid-comparison` — **verified**. GK5.1 and HLTT6.8 require the specified proper formal embeddings/tubes; functoriality identifies ς_p with rigid Frobenius. RD4 owns the comparison; F1 owns geometric carriers.

51. `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-frobenius-trace-normalization` — **corrected**. Proposition6.15 has coefficient factor p^{mn[F:Q]}; made it explicit with Cor6.17 slope shift a↦a+mn[F:Q]. Trace/pullback degree remains p^{n(n+2m)[F⁺:Q]}.

52. `AutomorphicGaloisRepresentationsPartII:AG2.4/ordinary-cusp-finite-slope-pieces` — **corrected**. HLTT6.12 embeds finite-slope dagger sections in ordinary formal sections, not global classical sections. Corrected the target; finite-level admissibility and neighborhood invariance remain exact.

53. `AutomorphicGaloisRepresentationsPartII:AG2.4/hasse-weight-changing-congruence` — **verified**. HLTT6.1 Hasse division gives the actual high-weight direct-sum surjection modulo p^M, with shift j(p−1)p^{M−1}. This is the quotient input, not an injection of classical families.

54. `AutomorphicGaloisRepresentationsPartII:AG2.4/classical-cusp-galois-type` — **verified**. HLTT6.2 high-weight inequality and discrete assembly give rank2n Galois type with one S fixed by the level. No TC2 torsion existence is used.

55. `AutomorphicGaloisRepresentationsPartII:AG2.4/uniform-integral-hecke-congruence-witnesses` — **verified**. Uniform finite comparison must descend determinant identities along the Hasse Hecke quotient. The injection/quotient bridge and denominators are explicit IHG4 requests and a recorded gap.

56. `AutomorphicGaloisRepresentationsPartII:AG2.4/ordinary-hecke-determinant-limit` — **verified**. HLTT6.5/6.13 initially reconstruct an irreducible quotient of an admissible submodule; continuous inverse limits and coefficient changes keep S. No arbitrary subquotient theorem is assumed.

57. `AutomorphicGaloisRepresentationsPartII:AG2.4/logarithmic-cusp-section-spectral-sequence` — **corrected**. Corrected HLTT6.17 to Corollary6.17; coefficient E₁ terms and shifted slopes match6.15/6.20. The finite spectral-sequence filtration justifies abutment constituents.

58. `AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-stratum-weight-zero-sequence` — **verified**. HLTT6.21–6.24 use rigid finiteness and weight lower bounds. W0 identification is an isomorphism in i>0 and only a surjection in degree0, as stated.

59. `AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-levi-cohomology-realization` — **verified**. HLTT6.25/6.27 require n>1, positive interior degree and sufficiently large twists. The rank2n decomposition retains ε^{1−2n−2N}; source good-place restrictions are explicit.

60. `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-factor-separation-specialization` — **verified**. HLTT7.12 separation needs continuous semisimple rank2d data, infinitely many exponents, dense Frobenius and an infinite-order character. IHG4 owns the generic theorem independently of TC2.

61. `AutomorphicGaloisRepresentationsPartII:AG2.5/good-prime-unramified-polynomial` — **verified**. HLTT7.14 enlarges the good range beyond7.13, with all places above q spherical; field-ramified good q are allowed. The coefficient-prime places remain excluded.

62. `AutomorphicGaloisRepresentationsPartII:AG2.5/monodromy-order-interface` — **verified**. Varma Definitions1–2 and9.2 compare every isotypic partition/initial sum, equivalently all N-power ranks. Equal semisimple Weil parts are required for the two-order equivalence.

63. `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-integral-bernstein-operators` — **verified**. Varma7.2 integral Bernstein traces require the finite component union, level and common nonzero denominator. The type idempotent imposes the target monodromy bound.

64. `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-local-trace-congruence` — **verified**. Varma8.1 includes every split local Weil trace through the uniform congruences; the classical input is polarized full local comparison, not good Frobenius values alone.

65. `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-monodromy-rank-bound` — **verified**. Varma9.7/9.8 exterior trace identities use all powers and all inertia isotypes plus the semisimple image trace pairing. The source proves dominance, not equality of N.

66. `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-tensor-square-geometric-instance` — **corrected**. Caraiani§7 two distinguished signatures give dimension2n−2 and a tensor-square constituent. Corrected zero-monodromy test to distinguish unequal nonzero factors from the actual square; added WD carrier.

67. `AutomorphicGaloisRepresentationsPartII:AG2.5/two-chart-nearby-cycle-monodromy` — **corrected**. Corrected nonexistent “Theorems4.6/4.10” to Propositions3.9,4.6,4.10 and Cor4.29. The bifiltration is ker/im of total N; characteristic-zero coefficients and a common trait are explicit.

68. `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-stratum-concentration` — **verified**. Caraiani5.8/5.10 concentration j=2n−|S|−|T| is a characteristic-zero trace/weight argument under the exact packet/stratum hypotheses; IG7 torsion concentration is absent.

69. `AutomorphicGaloisRepresentationsPartII:AG2.5/racsdc-temperedness` — **corrected**. Caraiani5.9 is stated for n≥2; added the rank1 CFT branch. Tempered L_n has weight n−1; its square has weight2n−2, confirming the new source misprint E5.

70. `AutomorphicGaloisRepresentationsPartII:AG2.5/tensor-square-weight-spectral-sequence` — **verified**. Caraiani7.2/7.3 give the displayed double-filtered stratum indices and shifts; concentration forces degree2n−2 and purity including the coefficient Tate correction.

71. `AutomorphicGaloisRepresentationsPartII:AG2.5/pure-weil-deligne-comparison` — **verified**. TY1.4 primitive-string purity gives uniqueness up to equivalence, and the requested arithmetic API includes finite-extension and tensor-square detection. E3 rules out replacement by maximal rank N.

72. `AutomorphicGaloisRepresentationsPartII:AG2.5/ch-polarized-local-monodromy-bound` — **verified**. CH3.2.3(a′) uses the definite-family local Bernstein bound and patching. This supplies the polarized semisimple comparison before Caraiani; the BC§6.5 proof gap is recorded.

73. `AutomorphicGaloisRepresentationsPartII:AG2.5/published-racsdc-comparison-specializations` — **verified**. Read Liu3.2.4/3.2.10/3.2.11, published CS5.5.4–5.5.6 and BCGP25 after1.8.21. Coefficient-prime/strong-field exports remain AG2.6; higher-rank Liu geometric realization is conditional as recorded.

74. `AutomorphicGaloisRepresentationsPartII:AG2.3/automorphic-polarization-and-sign` — **corrected**. BC1.2 gives sign+1 only for dual-conjugation-fixed factors. Corrected generic G7 owner and explicitly assembled self-dual factors orthogonally and exchanged pairs hyperbolically.

75. `AutomorphicGaloisRepresentationsPartII:AG2.3/finite-number-field-of-realization` — **verified**. CH3.2.5 uses regular Hodge input, two auxiliary residue characteristics, distinct rational eigenvalues and a larger common field. Arithmetic rational-eigenvalue descent is the correct supplier.

76. `AutomorphicGaloisRepresentationsPartII:AG2.5/late-gl2-modular-comparison` — **corrected**. CH’s rank2 remark is in§3.2 p9; fixed the locator and added general semisimple recognition directly. R19 stays a late comparison, not arbitrary-rank existence input.

77. `AutomorphicGaloisRepresentationsPartII:AG2.0/relevant-automorphic-coefficient-field` — **corrected**. Liu3.1.1/3.1.2 compare normalized local polynomial fields with the stabilizer of the finite part π^∞. Clarified finite-part notation and retained the distinct strong Galois field question.

