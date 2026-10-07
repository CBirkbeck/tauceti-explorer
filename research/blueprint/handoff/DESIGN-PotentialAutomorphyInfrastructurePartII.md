# Handoff: DESIGN-PotentialAutomorphyInfrastructurePartII (issue #3344)

Worker: Claude (session claude-Zy0b6p), 7 October 2026. Status of the packet: **complete** (86 nodes, budget not reached; every stage `planned`).

## What this job decided

The job received fourteen paper routes proposing continuations of *Reusable infrastructure for potential automorphy over CM fields* (`PotentialAutomorphyInfrastructure`). They fall into five independent directions:

1. polarized automorphy lifting on definite unitary groups (Boxer–Calegari–Gee 2025, Newton–Thorne 2021 I and II and 2026, Clozel–Thorne 2017, Fakhruddin–Khare–Patrikis 2022, Liu et al. 2022, Le–Le Hung–Levin–Morra 2023, and the Geraghty lemma used by Qian);
2. Dwork switching motives (Qian 2023; Boxer–Calegari–Gee–Newton–Thorne 2025 §4);
3. conditional automorphy lifting for GL_n over arbitrary number fields (Calegari–Geraghty 2018, 2020);
4. P-ordinary degree shifting and crystalline local–global compatibility with Barsotti–Tate lifting (Caraiani–Newton);
5. weight-zero crystalline automorphy lifting with p arbitrarily ramified (Boxer–Calegari–Gee–Newton–Thorne 2025 §3), which imports (4).

As the job instructs, this roadmap plans direction (1) under the id `PotentialAutomorphyInfrastructurePartII`, titled "…, Part II: polarized automorphy lifting and finiteness of deformation rings". The packet's `restructure` proposes the other four as separate Part IIs with the briefs their routes record (ids `PotentialAutomorphyDworkMotivesPartII`, `AutomorphyLiftingBeyondTaylorWiles`, `CrystallineLocalGlobalCompatibilityCM`, `WeightZeroCrystallineAutomorphyLifting`).

The packet also proposes a boundary with ModularityAndLanglandsExtensions. Its unreviewed checkpoint (cc-39fac3) plans the BLGGT14 definitions and lifting theorems in ML.2, and Newton–Thorne 2021 Theorem 5.2 in ML.3. The accepted paper reviews assign these to this Part II, and ML.2/ML.3 consume it, so ML cannot own them without a cycle. The rescope proposal lists which ML nodes become imports of which nodes here.

## Deliverables

- `research/blueprint/roadmaps/PotentialAutomorphyInfrastructurePartII.json`: ten layers PL.0–PL.9, area `automorphic`, parent `PotentialAutomorphyInfrastructure`. The `requires` lists are computed from the packet's prerequisites.
- `research/blueprint/packets/PotentialAutomorphyInfrastructurePartII.json`: 86 nodes (13 definitions, 10 constructions, 63 theorems), 136 API items, 96 unit tests, 27 planets, 15 requests, 4 gaps, 5 source issues. `python3 scripts/check_blueprint.py` reports 0 errors and 0 warnings. Every source excerpt was checked mechanically to occur verbatim (up to whitespace) in the text of the version read.
- `research/blueprint/readmes/PotentialAutomorphyInfrastructurePartII.md`: the reader document. Its introduction, conventions, boundaries and acceptance tests are hand-written; the layer sections are generated from the packet, so the two agree.
- `research/blueprint/suggested/PotentialAutomorphyInfrastructurePartII.lean`: **compiled** with `lean-check` (`lake env lean` in the shared build at Mathlib 082e2d3): exit status 0, and the only warnings are the 213 "declaration uses `sorry`". The file imports Mathlib only. Definitions are prototyped over abstract carriers standing for the arithmetic objects the pins lack: local Galois groups with Artin maps, lifting rings and their points, `Γ ≤ G` with a level. The named theorems are templates over the same carriers, and the header says so. A few supplier-dependent API items and tests (de Rham properties, principal-series characterisation of ι-ordinarity, semistable determinant rings) are recorded by name in comment blocks marked "supplier-dependent".

## Stages

| Stage | Coverage | Remaining (lemma-level refinements) |
| --- | --- | --- |
| PL.0 | planned | split the Appendix A lemmas and the archimedean Lemma 2.2.3 into separate nodes at lemma level |
| PL.1 | planned | separate the l ≠ p and l = p connection relations at lemma level |
| PL.2 | planned | decompose Thorne 2012 §5 (local parahoric theory behind the Taylor–Wiles levels) |
| PL.3 | planned | the patching proofs cite DeformationAndDerivedPatchingAlgebra R03.5, which has no nodes yet (request) |
| PL.4 | planned | none |
| PL.5 | planned | Theorem 3.1.2 rests on the Dwork-family gap |
| PL.6 | planned | Thorne 2015 Propositions 3.9, 3.14–3.17, 3.37 and Corollary 5.7 are cited inside proofs |
| PL.7 | planned | Allen–Newton–Thorne Theorem 5.1 and Corollary 5.4 are inside proofs |
| PL.8 | planned | Newton–Thorne 2023 §4 is summarised in one proof |
| PL.9 | planned | Remark 9.2.2 rests on the generic Serre weight gap |

## Requests to other roadmaps

AutomorphicGaloisRepresentationsPartII AG2.2 (BLGGT14 Theorem 2.1.1) and AG2.1a (étale cohomology of unitary Shimura varieties); EndoscopicTransferAndUnitaryTraceComparison ET.7a (Arthur–Clozel; Labesse's base change for definite unitary groups) and ET.6 (local Langlands, generic representations); AdelicAlgebraicGroups AA.0 (unitary groups and integral models); AutomorphicFormsOnReductiveGroups AF.4 (coefficient lattices; BLGGT14 Lemma 2.2.3); ArithmeticGaloisDuality D7, R02.4 (local duality; Poitou–Tate); DeformationAndDerivedPatchingAlgebra R03.5 (module patching); LocalGaloisDeformationRings L7 (Geraghty's fixed-weight ordinary rings; Le–Le Hung–Levin–Morra Theorem 7.3.2) and R08.2 (Steinberg rings; Liu et al.'s minimally ramified and D^ram conditions at nonsplit places); ArithmeticGaloisRepresentations G7 (induction) and R01.5 (Weil–Deligne representations); Tau Ceti ClassFieldTheory layer 12 and Chebotarev layer 10. The exact statements are in the packet's `requests`.

## Gaps

1. The self-dual Dwork family and its monodromy, needed by BLGGT14 Theorem 3.1.2 (PL.5): to be owned by the proposed `PotentialAutomorphyDworkMotivesPartII`.
2. Geraghty's Lemma 5.9 in Qian's form (no level hypothesis), compared with BLGGT14 §2.1(7), which assumes level potentially prime to l.
3. The generic Serre weight theorem (Le–Le Hung–Levin–Morra Theorem 9.1.6), needed by their Remark 9.2.2 (PL.9).
4. Geraghty, Math. Ann. 373 (2019), was not available. Its results are cited only through the restatements in BLGGT14, Thorne 2012, Thorne 2015 and Newton–Thorne 2021.

## Sources read

BLGGT14 (arXiv v4), Thorne 2012 (arXiv v1), Thorne 2017 (accepted manuscript, Cambridge repository), Thorne 2015 (accepted manuscript, Cambridge repository), Allen–Newton–Thorne (arXiv v2), Newton–Thorne 2023 (arXiv v3; the numbering differs from earlier versions cited by Newton–Thorne II and 2026, as noted in PL.8), Newton–Thorne 2021 I and II, Newton–Thorne 2026 (arXiv v2), Boxer–Calegari–Gee (arXiv v3), Liu–Tian–Xiao–Zhang–Zhu (arXiv v1), Le–Le Hung–Levin–Morra (arXiv v2, §9.2). URLs and SHA-256 hashes are in the packet's `sources`. Not read: Geraghty 2019, Clozel–Harris–Taylor 2008 (used through Thorne 2012), Clozel–Thorne 2014 (Lemma 2.6 is used as Newton–Thorne 2026 applies it), Allen 2016 (used through Newton–Thorne 2021 and 2023), Gee–Kisin 2014 (Lemma 4.4.1 used as Newton–Thorne II applies it).

## Source issues recorded

E1–E2 (Newton–Thorne 2026: ι for ι⁻¹ in Definition 2.5(1); "Lemma 1.4.1" for Lemma 1.4.3(2)), E3 (Thorne 2012's gap when F ⊂ F⁺(ζ_l), corrected in Thorne 2017 §7), E4–E5 (Newton–Thorne 2021 Corollary 5.4 ramification set; Lemma 5.3 hypothesis Φ_p). E1, E2, E4 and E5 were first recorded by the paper extractions; they are repeated here because nodes of this packet use the corrected statements.

## Pre-submission check against the sources

A separate reading of the packet against the downloaded source texts (no part in writing it; not the independent review of section 8) raised eighteen points. All were fixed before submission:

- **Residual hypotheses.** In PL.5/pd-automorphy-lifting (BLGGT14 Theorem 4.2.1(3)) and PL.5/tensor-product-trick-lifting (Proposition 4.1.1(3)) the automorphy hypothesis is on (r̄, µ̄); the overbars are lost in the text extraction. The same correction was made in the BLGGT14 Theorem 2.3.1 paraphrase in PL.4/minimal-automorphy-lifting and in Thorne 2015 Theorem 7.1(9) (PL.7/two-constituent-automorphy-lifting).
- **PL.6/generic-prime-r-equals-t.** J = ker(P_𝒮 → T_m) lives in the characteristic-polynomial subring P_𝒮, not in R^univ. The hypothesis and the conclusion are now J·R^univ ⊂ 𝔭 and J·R^univ ⊂ Q (Allen–Newton–Thorne Theorem 4.1).
- **Unit test PL.6 `generic_example`.** It now uses two independent variables; ψ₂(σ) = 1 would be a nontrivial relation.
- **PL.0/automorphy-under-twist.** The level-prime-to-l clause holds only for ψ unramified above l.
- **PL.6/genericity-under-restriction.** The hypotheses of Thorne 2015 Proposition 5.3 were added: A = k⟦T⟧, ζ_l ∉ F, Schur and primitive, no l-power quotient, a regular semisimple σ₀, l ∤ n, µ(c) = −1, l > 3.
- **PL.6/reducible-twisting-and-base-change (2).** It is Thorne 2015 Lemma 3.38(2), with Lemma 3.40 for components.
- **PL.8.** W_E = W ⊗_O E as in Newton–Thorne 2023, with W_{E/O} = W_E/W. "Unitary type" means π^c ≅ π^∨. H¹_f and H¹_g are no longer conflated.
- **PL.4/relaxed-adequacy.** Boxer–Calegari–Gee's claim, which covers Proposition 2.21, is separated from this packet's own check of Proposition 7.1.
- **PL.3.** A false remark about l | n was replaced. The inertia characteristic polynomial at the Ihara-avoidance places was corrected (χ_{v,j}(Art⁻¹σ)⁻¹), and O[Δ_Q] replaces Λ[Δ_Q].
- **Smaller items.** σ|G_F absolutely irreducible was added to the strong residual oddness test; the supersingular non-ordinarity test was made convention-free; the K = Q_l wording was fixed in `pd_fontaine_laffaille`; the parity-obstruction test for definite unitary groups is now stated for n even only.

PL.2 was only skimmed by that reading and deserves the reviewer's attention, especially PL.2/taylor-wiles-level-structures, which summarises Thorne 2012 §5 in one node.

## For the reviewer and the next job

- Check the restructure proposal (the five-way split) and the ML.2/ML.3 rescope against the ModularityAndLanglandsExtensions blueprint job (#1033), which should import from PL.0–PL.5 and PL.7–PL.8 rather than plan them.
- When the Dwork Part II and the generic Serre weight owner exist, replace gaps 1 and 3 by requests.
- At lemma level, the remaining lists above name the proofs to decompose.
