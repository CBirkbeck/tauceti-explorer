# BP-CompletedCohomologyPartII — #9407

Codex, session codex-c7yzDc; completed target-level planning pass, 13 October 2026. This is a complete blueprint submission for independent review, not a checkpoint or an implementation. Every node remains unchecked. CC.0, CC.1, CC.2, CC.3, CC.4, CC.5, CC.6, CC.7 and CC.8 are planned; none is proof-closed.

The whole packet adds 68 nodes: 7 definitions, 10 constructions, 38 theorems, 9 comparisons and 4 applications. It has 68 API items, 51 definition/construction tests, 32 planets, 15 inspected baseline declarations, 15 explicit gaps and 16 supplier requests. It imports the independently accepted CC.8 packet unchanged: 12 nodes, 31 API items, 15 tests and 6 planets. The reader therefore presents 80 targets, 99 API items, 66 tests and 38 planets. The retained integrated targets keep their node ids. The reader includes every target and qualification, API, check, source locator, proof route and dependency, with examples in each layer and worked direction/duality/descent/control examples.

## Resolved scope and review findings

Accepted RS-09 fixes this as Part II of ArithmeticLocallySymmetricSpaces. Finite geometry, cochains, correspondence/transfer theory and early finite manifold duality remain ALS or current upstream AlgebraicTopology imports. Completed arithmetic descent, support and Iwasawa duality live here. Neither an ALS completed-descent result nor a late automorphic-duality layer is used to prove its own input.

- RT3: CC.0/CC.5 explicitly import NE.0's analytic-group/noetherian inputs. Its existing broader noetherian packet does not close Lazard, Auslander purity, coefficient grade comparison or dimension growth; G1 and two exact NE.0 requests retain those needs.
- RT15: reuse the accepted CC.8 fixed-exponent Scholze convention adapter. The almost automorphic-section comparison and Corollaries 4.2.2–4.2.3 have the single owner TC.2.
- RT16: retain all four accepted arithmetic-family adapters. Under the current tier order move the narrow selected canonical-model/Hilbert inputs into CC.8 and finite étale–Betti/trace comparisons into CC.0; wider geometry remains at its owners. Keep modular R14.3 input. No GL₂ local–global result supplies GSp₄ geometry. The additional arithmetic–Shimura central comparison distinguishes Y, Y° and Ỹ, torus fiber cohomology, compact-support shifts, coefficient descent and effective deck groups. Neatness does not remove rational central units.
- RT17: request general compact-analytic unitary Banach/Schikhof theory immediately after L1. CC.2/CC.5 apply it; PadicLocalLanglandsForGL2Qp:R30.2 specializes it. Full local-group unitarity requires a stable unit ball; a nonunitary algebraic twist only has the qualified compact-open admissibility claim.
- RT18: reuse accepted finite derived Hecke images, inverse-limit completed Hecke algebra, stable residual support, semilocal decomposition and central residual summands. IHG.2 supplies the finite equivariant image contract, with its noncommutative extension still explicit. P7 supplies noncommutative residue/perfect-complex machinery. CC.4 imports precisely GN Proposition 3.4.16's patched model through P8; it does not infer generic perfectness from patching or construct that model twice.

## Supplier migration at assembly

The accepted part is immutable for this issue. Its `CC.8/arithmetic-tower-realisation` still names higher-tier inputs. G11 specifies the exact replacement map for assembly after independent review:

- ShimuraVarieties:V8 → CC.8/canonical-four-family-tower-input.
- HilbertModularVarietiesAndShimuraCurves:R18.4 → CC.8/hilbert-finite-local-system-input.
- EDC.6/complex-analytic-comparison → CC.0/finite-etale-betti-support-comparison.
- EDC.6/trace-orientation-comparison → CC.0/finite-etale-trace-orientation-comparison.
- Also add CC.8/arithmetic-shimura-central-quotient.

The reader shows this proposed prerequisite replacement explicitly. The packet's accepted-part import lists the original twelve ids, and its restructure records the moves. Higher owners and R31 import these narrow contracts once assembled; no other packet is edited here.

## Exact closure work

Resume from the packet's `gaps`, `requests`, and each stage's `remaining` list, not by rebuilding already supplied definitions. G1: analytic Iwasawa/Auslander and general Banach foundations. G2: strict integral admissible pro-system control, with the flat fixed-exponent comparison. G3: strict continuous duality, integral torsion UCT and biduality. G4: BP's noncommutative completed-tensor action extension. G5: classical multiplicity/noncuspidal inputs, plus positive discrete-series rank and the classical-completion/Tate rank separation. G6: derived analytic arithmetic comparison. G7: the compatible Λ-cellular oriented/opposite-ring pairing. G8: nilpotent boundary-tower collapse and completed Levi induction. G9: selected canonical-model existence/descent. G10: constructible compact-support and oriented trace comparison. G11: accepted-part supplier migration. G12: central coefficient descent/effective-deck comparison, or a qualified closed-central-kernel finite-projective change of rings. The other three gaps are inherited: equivariant noncommutative IHG image theory, P7 finite-p-group derived residue detection, and absent arithmetic carriers at the pins.

The sixteen requests address SR.0, L1, the two precise NE.0 nodes, R02.1, D7, P7, P8, L0, R14.3, IHG.2, three current AlgebraicTopology stages, E1 and C2. Their exact formulations and consuming nodes are in the packet. Requests are records for review; no extra issue or external message was created.

## Sources and corrections

The source register records public versions, dates, hashes and exact read sections. Read the relevant statements and available proofs in Emerton's 2006 interpolation draft §§1.2, 2.1, 2.2, 2.4; Calegari–Emerton's survey §§1.1–1.7 and bounds paper §§1–3; Schneider–Teitelbaum §§2–3; Gee–Newton §2.1 and Propositions 3.4.16/3.4.19; Marshall §5.2; Fu §7; Boxer–Pilloni §§1.4, 5.4–5.5; Nakamura §2.3 and Appendix B.1; LLHLM §5.3; BCGP §§4.8–4.9; Milne's Shimura notes §§5, 9, 12–14; Emerton's 2011 Appendices B–C; and Milne's étale notes §§21, 24 and finite-cover trace. Scholze's §4.2 convention source is inherited from the accepted packet, with that packet's source-reading provenance. This run does not claim to have proved or reread Scholze's almost comparison.

Underlying proofs not acquired are named in G1–G10: especially Lazard/Venjakob and Harris general inputs, Borel–Wallach/DeGeorge–Wallach/Savin/Rohlfs–Speh classical leaves, the chain-level derived analytic comparison, the nilpotent boundary calculation, canonical-model existence criteria and the full constructible/duality theorem behind Milne's outline. No uncleared book or source passage is included.

Four survey findings require independent verification: E1 restores the torsion submodule in the first integral duality sequence (already known in the decomposition); E2 replaces the proof's all-degree Ext reduction identification by the Bockstein sequence, without declaring grade equality false; E3 restricts the invariant growth exponent to regular uniform-power filtrations; E4 restores coefficient dimension in unrestricted integral Ext amplitude. Explicit counterexamples are in the packet/reader. Author indexes and the fetched version yielded no published correction for these findings. This is a source-finding record, not self-review or an errata job.

## Validation

At Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369, all fifteen baseline statements and their relevant hypotheses were read. The reviewed AUDIT-14 coverage and current read-only Tau Ceti/TauCetiRoadmap sources were checked. Current AlgebraicTopology and ProfiniteArithmetic are imports; newer upstream directions are not re-planned.

`check_blueprint.py` with the declaration index: 0 errors, 0 warnings. The 190-line suggested file elaborated with `lean-check`: exit 0, six admitted-proof warnings and no other diagnostics. It uses native carriers and light real-bodied specializations; the full arithmetic carriers, their definition APIs/tests and unstatable endpoints remain reader targets under the current compact roadmap shape. There is no admitted data definition. File-scope/intake, packet–reader/API agreement, and whitespace checks pass. Only the four authorized deliverables change.

The next step is independent review of this complete plan. Proof-closure follow-ups and the precise supplier migration follow that review; this submission claims no closed layer.
