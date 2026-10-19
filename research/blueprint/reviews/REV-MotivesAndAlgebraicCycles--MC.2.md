# Independent review: MotivesAndAlgebraicCycles MC.2

**Verdict: accepted after in-place corrections, as a complete target-level planning pass.**

Issue #10800; reviewer Codex, session `codex-GaCJ9K`, 19 October 2026. The blueprint was written by session `codex-exmfR8` for #10829, submitted in #11054. This reviewer did not write or review that submission before this job.

All eleven new nodes have individual verdicts in the packet's `review.checked`: three corrected and eight verified. All seven baseline claims, 39 API entries and twenty definition/construction tests were checked. The inherited MC.2 interfaces, source issues E48–E50 and current supplier ownership were also checked. The packet remains `complete`, its stage remains **planned**, its three supplier gaps remain open, and every implementation status remains `unchecked`. Acceptance follows PROTOCOL §0's distinction between completing a planning pass and closing its dependencies.

## Corrections made

1. **Rational Chern-character ownership.** SF.5's geometric Chern classes and Chern-character polynomials do not by themselves provide the rational K₀/Chow isomorphism used to define the cycle map. The existing SchemeKTheoryOperations S.7 nodes `gamma-chow-comparison`, `chern-character-adams` and `chern-class-of-subvariety`, together with their S.2 K₀/G₀ bridge, supply the required statements for smooth quasi-projective schemes over arbitrary fields. MC.2 now imports those exact nodes and records that supplier request. This avoids both an insufficient SF.5 import and a second plan of S.7's mathematics. Nonnegative cohomological grading and the negative-degree zero extension were made explicit.
2. **Existing finite Artin and native ℓ-adic plans.** The old SF.6 process report does not establish today's ownership boundary. SF.2's `upstreamIntegration`, accepted EDC reviews and the actual files at TauCetiRoadmap PR #196 already identify the owners. `CohomologicalPointCounting/ComplexComparison` Layers 4,7,9–12 plan finite CW type, sheaf/singular and all-degree finite Artin comparison. `EllAdicRealization` Layers 0–10 plan native coefficients, finite towers, Milnor/finiteness, rationalization, action and topological adic comparison. The packet now imports these through SF.2 and names EDC.6's operation-transport nodes. The two gaps concern exact integration and normalization exports; they no longer ask C5 or SF.2 to plan generic comparisons again.
3. **Finite Tate coefficients.** The finite exponential identification uses the integral lattice `Z(1)=2πiZ` modulo `ℓⁿZ(1)`. The rational line `Q(1)` is used after the integral comparison. The packet now states that lattice explicitly, retaining the inverse site-map direction and the chosen closure embedding.
4. **Topological export scope.** AlgebraicTopology Stages 5–6 supply products, Künneth and compact oriented manifold duality; DifferentialGeometry Layers 6,8–9 supply smooth de Rham theory and integration/comparison. Their current targets do not already state the full cohomological projective-bundle and supported Thom/Gysin/divisor interface needed here. The packet and reader now call those additional exports, assigned to the same owners' Part II direction and coordinated with EDC.6's existing boundary.
5. **Citation consistency.** Milne LEC §19 is on pp.123–126 in the recorded v2.21 edition. The packet and reader were corrected together. All API names and tests remain aligned.

PR #196 was open and unmerged when checked. Its exact head was `4bd72379658126cbe9be935656396f0c9dac4de0` in `bwangpj/TauCetiRoadmap`. Both READMEs and compact suggested files were read. The packet records immutable URLs and README hashes. These files are ownership/interface specifications, not proof sources or declarations implemented at the pins. The read-only main checked below does not contain these roadmap directories.

## Mathematical checks

The cycle-map argument uses the projective-bundle/splitting construction, the rational Chow Chern-character isomorphism and Adams weight separation. Multiplicative comparisons preserving first Chern classes therefore preserve all rational cycles. It does not derive proper pushforward from a ring map alone: the admitted theories must provide Gysin, trace and duality compatibility separately. The structure-sheaf formula includes `(-1)^(r−1)/(r−1)!`; a complete-intersection point in P² detects its sign.

For a proper map from dimension d to dimension e, cohomological pushforward changes degree and twist by `(2(e−d),e−d)`. A correspondence of degree r consequently acts by `(2r,r)`. Perfect pairings and the trace square give compatibility with pushforward; pullback, cup and the cycle-class square give the correspondence comparison. The realization formula `R_H^j(X,p,m)=im(p on H^(j+2m)(X)(m))` agrees with the contravariant motive convention `Hom((X,p,m),(Y,q,n))=q Corr^(n−m)(X,Y)p`. Restricting the ambient comparison to projector images and extending through Tate inversion gives the claimed natural monoidal comparison, relative to the chosen normalized cohomology comparison. Existing Karoubi machinery is imported.

Betti realization requires a complex embedding and retains all geometric components. Algebraic de Rham realization is defined for every characteristic-zero field without a chosen embedding; its proof route descends each finite diagram to a finitely generated field and uses faithful scalar extension. The unresolved general base-change, cocycle, first-Chern and trace exports are stated in Gap 1. Geometric ℓ-adic realization requires ℓ invertible in k, retains cyclotomic action, and uses `Aut(k̄/k)` without assuming an algebraic closure is a Galois extension of an imperfect field. Purely inseparable invariance remains an explicit supplier obligation. The derived tower keeps its lim¹ term until finite-level finiteness gives Mittag–Leffler.

For de Rham to Betti, the Tate map is `t_dR ↦ (2πi)⁻¹t_B`; after trivializing the lines, the twisted component is `(2πi)⁻m I_X`. On P¹ the raw first-Chern period is `2πi`, and the Tate factor removes it. The dimension-d trace square cancels `(2πi)^d` in the same way. For Betti to étale, finite Artin comparison is inverted before passing to the adic realization, and the integral exponential Tate map fixes the coefficient normalization. The target forgets Galois action; no canonical field map from C to Qℓ or intrinsic rational Betti action is asserted.

The quotient criterion has the correct direction: a realization descends through an adequate ideal J precisely when `J ⊆ I_H`. Künneth and perfect pairings detect zero correspondence classes by zero action in every degree, giving faithfulness on the homological quotient and its idempotent completion. The known inclusion is `I_H ⊆ I_num`; numerical descent requires the reverse inclusion, a standard-conjecture-D condition. Taking the quotient before Karoubi completion avoids assuming that quotient idempotents lift.

The curve calculation requires geometric connectedness. Rational-divisor Chern classes are extended linearly from integral divisors. Top trace detects exactly degree-zero classes, finite-map push–pull counts inseparable degree, and the raw de Rham period is `2πi` times the degree. The worked P¹, elliptic degree-zero divisor and finite-map tests distinguish the stated theory from incorrect twists, signs, Chow faithfulness or numerical descent.

## Baseline and duplication checks

Mathlib was checked at `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`. Each listed declaration's actual statement and hypotheses were read at the pin.

| Declaration | Pinned source and usable content |
| --- | --- |
| `CategoryTheory.Idempotents.karoubiUniversal` | `Mathlib/CategoryTheory/Idempotents/FunctorExtension.lean:224`; the functor-category equivalence requires an idempotent-complete target |
| `CategoryTheory.Idempotents.natTrans_eq` | Same module, line 37; retract components are determined by the ambient component |
| `LinearEquiv.ofSubmodules` | `Mathlib/Algebra/Module/Submodule/Equiv.lean:57`; restricts an equivalence when the specified submodule image equals the target |
| `LinearMap.range_comp` | `Mathlib/Algebra/Module/Submodule/Range.lean:82`; computes a composite range by a submodule image |
| `LinearEquiv.range_comp` | `Mathlib/Algebra/Module/Submodule/Equiv.lean:129`; precomposition by an equivalence preserves range |
| `AlgebraicGeometry.Scheme.ellAdicSheaf` | `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:63`; native pro-étale continuous Zℓ coefficients |
| `AlgebraicGeometry.Scheme.EllAdicCohomology` | Same module, line 75; universe-lifted sheaf cohomology with additive-group structure, without the required Qℓ/finite-tower/cycle/trace interface |

AUDIT-35 and its accepted independent review were read; `data/library-coverage.json` was screened. The latter has no MC.2 entry supplying an additional geometric realization. Exact searches of the pinned and current Tau Ceti sources found no motive/Weil/Betti/de Rham realization carrier that would replace the new geometric targets. The native ℓ-adic definitions above are retained as partial existing infrastructure.

The current read-only roadmap tree was checked at `0d144d044dacebca17b654695b6f1ad58f159b27`, and its Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The nine newer roadmap directories were screened, including nested OperatorTheory suggested files. Relevant AlgebraicTopology, DifferentialGeometry and AlgebraicVectorBundles targets were read. MC.2 imports their existing theories and does not duplicate topology, smooth de Rham theory, bundle foundations or image constructions.

## Source verification

The ten mathematical source PDFs were fetched independently from their public primary locations and matched the packet's SHA-256 values. The original Deligne82 scan and author DMOS addendum were checked separately. All statements below and in the deliverables are in the workers' own words. No source excerpt or section-by-section source summary is retained, and no restricted book was needed.

| Source | Locations checked and their use |
| --- | --- |
| Stacks, *Weil Cohomology Theories*, ed88ff78 | Lemma 4.8, pp.10–11; Lemmas 7.1,7.4–7.11, pp.15–21; Propositions 12.1/12.4, pp.41–45; Lemmas 14.1–14.2, pp.48–49; Lemma 14.16/Proposition 14.17, pp.55–56: correspondence action, cycle construction and proof-dependency boundary |
| Grothendieck 1966 | Theorems 1/1′ and proper-case argument, printed pp.95–96: algebraic/analytic de Rham comparison |
| Deligne, *Hodge II* | §2.2.4–6, printed pp.28–29: exponential, negative-dlog sign and first-Chern comparison |
| Deligne82, revised 2018 and original scan | §1, revised pp.7–11, especially Theorem 1.4 and pp.9–11; original printed pp.19–22, including visual inspection of the formula on p.20: base change, Tate lines, cycle classes and trace |
| Milne LEC, v2.21 | §19, pp.123–126; Theorem 21.1/Remark 21.2, p.130; Theorems 22.1/22.4, pp.135–136; Lemma 23.1/Theorems 23.2–23.3, pp.138–141; Theorem 24.1/Remark 24.2, pp.144–145: towers, finite comparison, duality and cycle normalization |
| SGA 4 XVI, public retypeset edition | Theorem 4.1 and proper-case start, marginal pp.232–234, PDF pp.13–14: all-degree finite site comparison |
| Scholl, *Classical motives* | §§1.4,1.6, preprint p.3; §§1.8–1.9, p.4; Proposition 1.12 and §1.13, pp.5–6: contravariant convention, projectors, realization and Tate inversion |
| Demailly | V §13, Theorem 13.4/formula 13.6, pp.271–272: divisor current and Chern normalization |
| Milne, *Motives — Grothendieck's Dream* | §6, pp.7–8: obstruction to numerical realization |
| Grothendieck 1958 | §4.3, formulas (15)–(16), printed pp.150–151: alternating structure-sheaf Chern factor |

The packet's three incidental source findings are independently **confirmed**:

- **E48:** the revised Deligne82 transcription strengthens the first-Chern map incorrectly; original printed p.20 has the correct homomorphism formulation. Pic(P¹) and degree-zero elliptic line bundles give direct counterexamples to the stronger assertion.
- **E49:** the original and revised structure-sheaf formulas omit the alternating factor. For a complete-intersection point z in P², the resolution gives `c₂([O_z])=−h²` while its cycle class is `h²`; Grothendieck 1958 supplies the correct factor. The author's article page, original/revised copies and DMOS addendum did not yield a correction of this formula.
- **E50:** the displayed proof of Stacks 0FIT uses A9 under an A1–A8 statement, and 0FIU uses that result. The PDF, live tags and comment areas were checked. This confirms a proof-dependency gap, without claiming the weaker-hypothesis theorem false. MC.2 uses 0FIF for its ring cycle map and independently requested Gysin/trace inputs for pushforward.

## API, granularity, suggested file and closure

The eleven nodes have target-level granularity: four constructions, one definition, three theorems, two comparisons and one application. Proof-internal splitting, Adams, duality and projector steps remain proof sketches or imports. Every one of the five definition/construction nodes has four discriminating tests and a use-driven API, for totals of twenty tests and 39 API entries. The reader contains every target, API name and test. The normalization tests reject arbitrary scalar rescaling and missing Tate periods; the geometric tests include empty/disconnected schemes, P¹/P², inseparable degree and nontrivial degree-zero divisors.

The unchanged compact suggested file has two genuine linear-map milestones: zero-map detection under intertwining equivalences and restriction to images. Their hypotheses suffice; idempotence is unnecessary for the latter linear-algebra statement. The file uses Mathlib carriers and introduces no admitted data, opaque geometric substitute, auxiliary development or admitted example. Since it retains no light definitions, there are no new executable definition tests to add; all geometric APIs and tests remain definitive reader targets.

The twenty-five inherited MC.2 nodes are imported by id, not copied. Assembly must retain their five planets and add only **Normalized realization comparisons**, giving six total. RS-08's restriction of MC.4 does not remove either MC.2 comparison target.

Three precise frontiers remain: C5/topology base-change and normalization exports; integration of the existing finite Artin route with EDC.6's Tate/trace maps; and integration of native ℓ-adic realization with operation transport and imperfect-base invariance. Six requests identify their suppliers and the existing Chow/K-theory inputs. These prevent stage closure. They do not leave an unrecorded target or justify re-planning existing owners. No mathematical ownership was moved between tiers.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/MotivesAndAlgebraicCycles--MC.2.json`: **0 errors, 0 warnings**; eleven nodes, 39 API entries, twenty tests, seven baseline references, six requests, three gaps, one stage planned and zero closed.
- `lean-check research/blueprint/suggested/MotivesAndAlgebraicCycles--MC.2.lean`: **success**, pinned Mathlib `082e2d37e8`; only the expected declaration-uses-`sorry` warnings at lines 37 and 47. Available memory was 76 GB before the check. No language server or library build was started.
- Source hash, target/API/test coverage, review coverage and allowed-file checks passed. `git diff --check` passed.

No further correction is required from this review. Resume with the recorded supplier frontiers and subsequent assembly, as detailed in the review handoff.
