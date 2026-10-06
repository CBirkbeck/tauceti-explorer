# BP-HabiroCohomologyFoundations--HQ.3 — handoff

Issue #6491. Agent: Codex, session `codex-sFf91B`. This is a **complete planning pass**, not a checkpoint or an implementation. Packet part is HQ.3 and its only scope/coverage stage is `HabiroCohomologyFoundations:HQ.3`, status **planned**, not closed. The accepted HQ.1 packet remains unedited.

## What this pass supplies

Three new nodes: two constructions and one comparison; 16 API items; seven unit tests; nine ordinary Mathlib baseline declarations. All 24 existing HQ.3 nodes are imported by id, with their 47 API items and 28 tests reproduced as imported interfaces in the reader. No new planets: the six accepted HQ.3 planets are reused. No new source errata are claimed.

The new chain plans scalar extension of a **chosen** q-Hodge filtration, comparison of its twisted filtrations, and the canonical Habiro–Hodge base-change map along a finite-projective Λ-map A→B between perfectly covered rings. The map is the functor–limit comparison followed by the limit of the stagewise maps. It includes the projection formula, identity/composition, partial descent, q−1-completion, cyclotomic filtration and Künneth interfaces.

The bounded comparison is conditional on the exact supplier exports below. Neither Wagner's Theorem A.1 nor fixed-base functoriality in 3.38 is reported as a theorem establishing these new coefficient-change comparisons. No unrestricted base-change equivalence or filtration on a bare algebra is asserted.

**Closed:** no stage is claimed closed. All HQ.3 target chains are accounted for at planning level, by existing nodes, the three new nodes, exact requests or named gaps. The finite-product target is already supplied by the imported strict monoidality/Künneth node and is not replanned.

## Requests and remaining work

The packet records four requests, in the existing owners rather than new HQ.3 definitions.

1. **DerivedDeRhamCohomology:DD.1:** coherent enhanced finite-projective scalar extension, exactness/t-exactness, all limits and colimits, derived Koszul completions, Rees degree-one quotients and completed tensors/colimits. The ordinary retract-of-finite-free argument motivates this export; the Mathlib module predicates do not supply it.
2. **DerivedDeRhamCohomology:DD.2:** filtered enhancement and coherent/multiplicative version of the imported `derived-base-change-kunneth` node. Its unfiltered statement is reused, not duplicated.
3. **PrismaticCohomology:PR.3:** the finite-projective coefficient-change comparison on the relative q-de Rham prisms, respecting relative Frobenius, iterates, Frobenius-twisted Nygaard filtrations, divisor transitions and animation. The exact statement, including the prism generator [p]_q, is in the packet request.
4. **AInfCohomology:AI.1:** finite-projective flat base change of the relevant filtered décalage on torsion-free representatives, compatible with relative Frobenius and twists. No arbitrary exactness or completion-commutation of Lη is assumed.

Two new gaps remain: the unrestricted Λ-map range, including transport of clause (c_p) and the Habiro inverse limit; and the unverified PR.3/AI.1 exports in the new finite-projective argument. The ℤ→ℚ power-series example rules out replacing finite projectivity by flatness in this argument. It does not refute a suitably completed rational base-change theorem.

A follow-up must supply those exact exports and either construct coherent target pairs/tower maps for a wider range or settle the intended base-change range. Preserve the distinction between constructing a map via the canonical limit comparison and proving that comparison invertible. Inherited gaps of the accepted HQ.1 packet, especially the technical twisted-filtration/Koszul comparisons and HR.2 enhanced infrastructure, remain owned there. This follow-up does not silently discharge them.

## Confirmed finding and inherited qualifications

**RT-AREA-etale/31:** handled in the packet summary, targetCoverage, new Habiro node, reader's cyclotomic section and suggested-file notes. The exhaustive ascending filtration is on H/(q^m−1), where H is the Habiro–Hodge inverse limit. For M=qHdg, the q−1-completed modification, only the q−1-completed filtration and graded pieces are stated. For m>1 the uncompleted claim on M is not used.

Inherited E3 and E102 fix the twisted-filtration notation and degree-one quotient. Inherited E401 fixes the source's shift ambiguity: use G^i=gr^i of the animated stupid filtration, intrinsically shifted; smooth forms occupy cohomological degree i. Do not shift G^i again. The reader interprets the old `twistedQHodgeFil_mod` API in this convention.

The final non-triviality gloss in the imported `habiro-descent` node describes an inclusion of Habiro-complete objects into q−1-complete objects. This pass imports its **factorisation clause**, not that inclusion gloss: H maps to M by q−1-completion, and the complete subcategories are not identified. The packet's `importQualifications` records this boundary. The original packet is unedited as the issue requires; its owner/reviewer should check that gloss alongside the inherited shift wording.

## Suggested Lean file and checks

The suggested file **elaborated successfully**, exit 0, with 22 warnings, all “declaration uses `sorry`”, using `lean-check` on 6 October 2026 against pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Memory was checked before each attempt and remained above the 20 GB threshold. No language server, Lake build, update, or cache-fetch command was run. The shared Tau Ceti working tree differs from its recorded pin, so its source search used the pinned git object; no Tau Ceti module is imported by the suggested file.

The file is an honest **partial signature prototype**. All 16 new API names and seven named example comments occur. The two construction signatures and named twisted-comparison theorem have these explicit limits:

- `PairShadow` carries algebra labels and filtration diagrams, not q-Hodge axioms. `pair`, `filtration`, `underlying`, `identity`, `composition` cover the data/ordinary diagram shadow. The Λ-ring, perfect-coverage and enhanced q-Hodge conditions are omitted where they cannot be stated; no dummy condition replaces them.
- `clauseData` transports ordinary comparison diagrams. The higher homotopies and identifications with the de Rham diagrams are not encoded. `modification` states completion/colimit comparison with the completion exchange independently supplied by DD.1.
- `TwistedQHodgeBaseChange.equivalence` states the limit-preservation step only. The relative-Frobenius, Nygaard, filtered décalage and arithmetic-gluing comparisons remain unstated.
- `HabiroHodgeBaseChange.map`, `projection`, `isIso`, `identity`, `composition` state genuine ordinary categorical formulas. Their application to enhanced factorial descent towers is a missing supplier identification, not an implementation claim.
- `partialDescent` and `qMinusOne` transport separately supplied completion exchanges; the specific descent identifications and agreement with the stagewise maps are not encoded. `cyclotomicFiltration` gives only the extended ascending diagram; exhaustion, reduced β, and animated graded-piece identifications remain unstated. `kuenneth` gives the bottom composite of the square; its enhanced monoidal commutativity/coherence is unstated.
- The seven examples are the data/elementary shadows of the packet tests. The shifted-quotient example includes bijectivity between adjacent t-adic powers and the degree-zero power-series quotient. The coordinate example tests its differential coefficient. The denominator example is the actual factorial sequence without a uniform denominator. The enhanced cofiber, completed-coordinate-complex and tensor-image identifications are not implemented.

The blueprint checker, with the provided declaration index, reports **0 errors and 0 warnings**. Also checked JSON parsing, all new ids against imported/reserved ids through the checker, namespace/API/test correspondence, literal TeX excerpts, the six-planet total across imports, target coverage, dependency ownership, source shifts, and `git diff --check`. No application files or prior packets changed.

## Sources and screening

Read the full WORKERS and both protocols, UPSTREAM_GUIDE, BROWSER_AGENTS, the roadmap document/atlas extract, accepted HQ.1 packet and the relevant library-coverage audit. Read the upstream AdicSpaces and HodgeStructures documents in full. Screened the 28 link files mentioning this roadmap and its HQ.3 stage edges; no additional HQ.3 overlap entry supplied these base-change targets. Inspected DD.1/DD.2, PR.3 and AI.1 owner contracts and available packet nodes.

Wagner v2 was fetched as PDF and TeX source from the public version-specific URLs recorded in the packet. The PDF SHA256 is `591d0bdf2c48d12f91d6c9a4beec32978bc1e9a9448b04ef0efdc4a84315373b`; source-archive SHA256 is `9c338455871808eb2265681199279607b4b179b3973752d48eca3f711bc25b47`. Read Definition 3.2, Lemma 3.3, Theorem 3.11, the twisted-filtered/descent constructions and the relevant proofs of §§3.5–3.6; Appendix A's global construction/additional base-change proof; and Appendix B's completeness and detection arguments. Read Stacks 10.78.2 and its splitting proof publicly on 6 October 2026.

No additional public source proves the new full Habiro base-change assertion in the range requested by the stage. BS22 and BMS1 were not re-read to claim the exact new compatibility exports: those are requests, not inspected-source claims. Prior q-Witt/thesis proof gaps remain inherited. Searches of pinned Mathlib and Tau Ceti found no HQ.3 target declaration; all nine baseline declaration statements were read at the Mathlib pin. All reproducible evidence and outstanding mathematical conditions are in the committed packet, reader and this note; scratch papers and logs are not needed for a subsequent worker.
