# DESIGN-ShimuraVarietiesPartII

Issue #3356; Codex session `codex-WVWnys`; branch `codex-WVWnys-shimura-part-ii`.

The design pass is complete and ready for independent review. All eight layers
SV2.0–SV2.7 are **planned**, with no unassigned gaps. None is closed: 27 exact
supplier requests remain open. All implementation statuses are `unchecked`.
This is a specification, with no claim of formalization.

The five deliverables are the roadmap definition, packet, reader, suggested
Lean file and this handoff. The reader is definitive and carries every target,
hypothesis, proof outline, API, discriminating check and source locator.
Counts: 61 nodes (6 definitions, 18 constructions, 37 theorems), 72 API items,
72 unit tests, 31 planets, and 3 baseline declarations.

## Scope and ownership

The first independent direction is integral reduction through the geometric
common Frobenius-class theorem, Kisin–Zhou Theorem 5.1.4, p.48, proved on p.55.
The sequence is canonical tensors, corrected local geometry, auxiliary covers,
component descent, Newton/tensor isogeny theory, ordinary lifting, curves over
the original finite field, and the common point of the conjugacy quotient.

The packet retains all 594 identifiers from the issue's 13 routed inventories,
each assigned once to a core target, existing owner, supplier contract or
independent continuation. This is an ownership audit, not certification of the
statements extracted from unread papers. Eleven restructuring proposals keep
the independent directions and missing supplier extensions explicit.

General Honda–Tate/CM classification, mod-p points and Langlands–Rapoport,
nearby cycles, orthogonal integral models/Kuga–Satake, automorphic cohomology,
and Hecke-orbit/André–Pink–Zannier theory receive named continuation proposals.
The old `ShimuraVarietiesHondaTatePartII` candidate is an alias for the shared
core, not another owner of its integral construction.

The normalized Hodge interior and Zarhin replacement are exact C7 imports.
Existing C13/C14 and PEL moduli retain the Siegel-model routes. Existing
ReductiveGroupsPartIII owns arithmetic conjugacy and the KZ §6 abelian-variety
application. SV2.7 supplies its geometric input: **RG3.5 is never a prerequisite
here**. The integration notes identify the input to wire after review.

## Supplier work remaining

The closure register gives the full statements and every consuming node for
all 27 requests. Discharge them at their owners, then replace stage requests
with exact node references. Especially substantial contracts are:

- Corrected integral tensor displays, integral comparison, adapted branches
  and ordinary lifting preserving the entire Newton automorphism action:
  R07.2/R07.4/R07.6 and `FiniteFlatGroupsWithTensorsPartII`.
- Canonical flat local models in the ramified scope actually used here, their
  Schubert geometry and same-field rational root curves: GS0 and the existing
  `GeometricSatakeLocalModelsPartII` candidate.
- Modern canonical integral-model/shtuka comparison, and the connected
  adjoint frame reduction in KPZ Corollary 7.2.24: HS2 and
  `HeckeStacksAndLocalShtukasIntegralPartII`.
- R-smoothness, associated adjoint parahorics, fixer immersions and exact
  central extensions: proposed `ReductiveGroupsPartIV`. Current upstream
  Part II explicitly excludes these extensions; it already supplies
  parahorics and Lang's theorem and is imported without duplication.
- Convergent tensor families on singular/nonproper special fibres: CR.7 and
  proposed `CrystallineCohomologyIntegralFamiliesPartII`.
- Same-field smooth stack presentations, rational marked points and
  finite-field Bertini with the needed open/local conditions: R09.1/R09.4
  and proposed `AlgebraicModuliForArithmeticGeometryFiniteFieldCurvesPartII`.
- Noot's **coarser** Conj′ comparison, independently of the full common-class
  theorem: R01.6 and proposed
  `ArithmeticGaloisRepresentationsFrobeniusComparisonsPartII`. The current
  `noot-specialization` node is a different characteristic-zero theorem.
- Semisimple algebraic lisse companions on **open** curves, with constant
  twists and finite coefficient extension: GS.6, extending the existing
  `GlobalShtukasPartIICrystallineCompanions` proposal. The current projective
  finite-determinant node does not supply this interface; the existing
  Ramanujan/Arthur Part II is a different direction.

The remaining contracts cover the exact generic Shimura/component/moduli,
Tannakian, Newton-family, full-G realization, endomorphism and arithmetic
interfaces needed by this proof. They are not silently treated as implemented
or as statements already present at the cited stage.

## Mathematical checks for the reviewer

Keep full fixers and connected parahorics distinct, including the different
notation of KZ and KP/KPZ. The very-good display condition is a first-order
tensor trivialization. It is not implied by a closed good lattice embedding.
KPZ Theorem 7.1.8 uses the modern shtuka route and does not impose a globally
very-good embedding or R-smoothness on the given datum; its strict comparison
does not supply a rational local-model point over a prescribed finite field.

Component gluing uses the actual conjugated p-levels. The quotient kernel at
the full tower is not assumed finite. General connected adjoint reduction
uses KPZ Corollary 7.2.24, separate from the non-exceptional elementary route.

An actual ordinary class is required; maximality alone for an inner form does
not define it. The induced compact-centre condition of strong acceptability
is also substantive: standard GSp has compact-central subgroup μ₂ and is a
non-example. The positive check uses GU(1,1) with its imaginary quadratic
field split at p. Top KR and ordinary Newton membership remain distinct.

Finite-period crystalline automorphisms are kept distinct from J_b, as are
an exact Frobenius and a finite power. The whole curve induction preserves
the original F_q. Characters in all algebraic representations establish the
common geometric class; a faithful characteristic polynomial alone does not.
The final rational quotient point is not identified with a rational
G(Q)-conjugacy class or automatically with an element of G(Q).

## Baseline, sources and corrections

The reviewed library audit was read first. Three declaration statements and
their hypotheses were read at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`
and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`: the abelian-variety
carrier, its integral endomorphism ring, and `WittVector.Isocrystal`.
Their limited scope is stated explicitly in the packet.

Current Tau Ceti and current upstream roadmaps were inspected read-only.
Upstream main was `0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti
was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. In particular current
OrthogonalSpinGroups and ProfiniteArithmetic documents and suggested files,
and ReductiveGroupsPartII scope and relevant signatures, were checked.
No upstream file was edited and no build was run there.

Five public primary sources support the core design. The packet and reader
give URLs, exact editions, hashes and precise reading extents:

- Kisin–Zhou arXiv v2: introduction, §§2.1–2.4.3, and §§3–5 with proofs.
- Kisin–Madapusi Pera–Shin dated author copy: introduction, §1.3.1–1.3.18,
  §2.1 and Appendix A.
- Published Kisin–Pappas–Zhou: §§7.1–7.3, including the correction section.
- Published Kisin–Pappas: §4.2.6–4.2.12 and §§4.3–4.6.20.
- Kisin 2017 author manuscript: §2.1.1–2.1.7.

Nine source issues record corrections in original prose. Published KPZ
corrections are distinguished from findings scoped to KZ arXiv v2 or the HT
author copy. The Annals and Duke final texts were not collated; independent
review should collate them before assigning those findings to the versions
of record. Ordinary-existence and rational-conjugacy findings acknowledge
their existing packet provenance. No source excerpt is included.

Technical papers underlying the general supplier contracts were not all read
independently; the contracts are stated at the scope the five sources use.
The eight other routed papers were triaged from their extraction records.
No private reference-library book was used, and no restricted file or passage
was copied. Scratch downloads and generators are disposable; this handoff,
the complete packet and the reader preserve what the next worker needs.

## Validation

`python3 scripts/check_blueprint.py` passes with zero errors and warnings.
Baseline statements were also checked against the three exact pinned source
declarations. Source-issue/version, route completeness, graph, reader/API/test
consistency and deliverable-path checks pass. The suggested file is 61 lines;
the no-sorry-data check passes.

`lean-check research/blueprint/suggested/ShimuraVarietiesPartII.lean` compiled
successfully at the shared pinned build, with seven expected warnings, all
for theorem/example proofs using `sorry`. It contains one light real-bodied
multiplier predicate, four API statements and three examples. Geometric
carriers absent at the pins remain full README targets, following the fixed
2026-10-12 shape. The packet's 72 APIs/tests are the geometric specifications;
the small Lean specialization is not an exhaustive declaration checklist.

Next step: independent review of the complete design, allocation/discharge of
the exact supplier contracts, and the named continuation design jobs. There
is no unfinished core authoring pass to resume.
