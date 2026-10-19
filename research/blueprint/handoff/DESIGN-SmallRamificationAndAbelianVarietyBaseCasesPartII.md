# DESIGN-SmallRamificationAndAbelianVarietyBaseCasesPartII

Complete target-level design submitted by **Codex**, session **codex-MVSHUy**, for **#3379**. The claim bot confirmed this session on 2026-10-19 at 03:24:14 UTC. This run takes no second job.

## Delivered and checked

The five deliverables are the roadmap definition, complete blueprint packet, definitive reader, compact suggested Lean file and this handoff. The packet has **24 nodes**: **5 definitions, 2 comparisons, 14 theorems and 3 applications**, **28 API items**, **15 definition tests**, **13 planets**, and **6 baseline declarations**. Every definition includes its uses and three distinguishing tests. The reader is about 9,400 words and gives every target, hypothesis, proof route, direct dependency, source locator, API and test. All statements are paraphrases; no source passages or source-by-section digest are included.

`python3 scripts/check_blueprint.py research/blueprint/packets/SmallRamificationAndAbelianVarietyBaseCasesPartII.json` passes with **zero errors and zero warnings**. The validator also passes against a fresh declaration index generated from the existing pinned source trees using the repository indexer (70,802 Tau Ceti and 246,008 Mathlib declarations). No source checkout was copied or fetched to build that index. Baseline definitions were additionally checked by reading their actual pinned source statements. JSON parsing, internal prerequisite order, definition/API/test coverage, reader/packet consistency, planet caps, deliverable scope and whitespace were also checked.

The **140-line suggested Lean file elaborated successfully through lean-check**, with only the intended unproved-statement warnings. It was run in the existing shared build at Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**, after checking available memory. Its only definitions are real intersection-of-comaps character steps and the finite descending filtration over existing Mathlib carriers. It includes the filtration API, invariant/top tests, a pure-character test, a nonsplit-extension order test and Tau Ceti Tate-piece sign checks. The native scheme, crystalline and period-ring carriers missing at the pins remain reader targets. No data definition uses a proof placeholder. No library build, dependency update, cache download or language server was started. Every node remains implementationStatus unchecked.

## Coverage and precise follow-up

All five layers are **planned**; **none is closed**. The packet status complete means this design pass is finished and ready for independent review. It does not mean the supplier interfaces or mathematical proofs have been formalized.

| Layer | What is planned | What must be discharged |
| --- | --- | --- |
| LH.0 | Independent proper smooth scheme models over W(F̄_p), dual seven-adic realization and purity at spread-out good primes. | SF.0/SF.2/SF.4 model, completion, cohomology, inertia and spreading exports; compatibility with R06.2/R06.5 comparison. |
| LH.1 | Filtered valuation truncation, polynomial solution lifting, period comparison, cardinality/field detection, approximate embeddings, strict higher-weight killed-p bound. | Exact A_cris/p model and functor normalization in R07.3; generic all-m>c ramification implication including the 1/e refinement in R07.6. Review strict cutoffs and Hensel precision. |
| LH.2 | Finite global crystalline category, simple objects, oriented extension splitting, arbitrary-seven-power devissage, finite and rational cyclotomic filtrations. | Certified root-discriminant-seven threshold; weight-zero, rank-one-inertia and local Ext exports; finite torsion/kernel-field and tame-conjugation exports. Review the discriminant substitutions and compact lattice limit. |
| LH.3 | H¹ and H³ vanish, H² is Tate, off-diagonal coherent Hodge groups vanish through total degree three, integral-model specializations. | Transitive LH.0/LH.2 contracts; characteristic-polynomial weight multiplicities and coherent Hodge/coefficient-extension interfaces; independent sign and scalar-action review. |
| LH.4 | Shared geometric K3 has h²⁰=1 and a bad Witt prime; projective-space checks. | Coherent base change and canonical-form identifications; projective-space differential cohomology; transitive LH.3 contracts and consumer-link refresh. |

There are **11 explicit supplier requests**: existing EllipticCurves Layer 4 criteria for one negative test; SF.0 model/base change; SF.4 completion; R06.1 Witt valuation fields; R07.3 exact periods/local FL; R07.6 generic ramification; R01.1 finite torsion/kernel fields; R25.1 the certified threshold; SF.2 cohomology/spreading; DWP.0 weights with multiplicities; LocalFieldsRamification Layer 3 tame-conjugation/different formulas. No new issue was opened or other packet edited to discharge them.

Three gaps are highlighted in the packet: the precise certified threshold below root discriminant seven, the exact A_cris/local-FL exports, and the general approximate-embedding ramification export. Other interfaces are explicit requested exports of their existing owners. A reviewer should start with these contracts and the worked proof checks in the reader, not decompose the proof into further lemma nodes.

## Mathematical choices requiring review

- The source's degree bound 208 is replaced by the base roadmap's existing sufficient bound **287**: after adjoining ζ₇ the degree is 6n′; wild ramification leaves n′=7n″ with n″≤6, still enough for the unique-Sylow argument. The final tame conclusion uses a separately requested certificate below root discriminant seven. A restricted certificate at degrees divisible by six suffices; the packet gives an explicit Poitou evaluation to certify.
- The source's stronger degree bound 28 is replaced by the existing **degree ≥36 implies root discriminant >12** bound: the nontrivial extension field has degree 42 and upper root discriminant 7^(53/42)<12. The source's cyclotomic class-number input is also avoidable: an everywhere-unramified degree-seven extension of Q(ζ₇) would have degree 42 and root discriminant 7^(5/6)<5.72, contradicting the existing degree-eight row.
- The local extension break is not simply asserted: after twisting to weights [0,a], a=1,2, the higher-weight bound gives b≤a over the tame degree-six base, while tame conjugation gives b≡a modulo 6; hence b=a. The ramified degree-42 different calculation retains both the tame and wild factors.
- Rank-one local FL determines the inertia character, allowing an unramified twist. The global Minkowski argument removes that twist before asserting scalar χⁱ-action at every torsion exponent.
- Purity uses a genuine finite-field fibre obtained by spreading the original X/Q to Z[1/N]. No finite unramified descent of an arbitrary W(F̄_q)-model is assumed. Witt models separately supply inertia triviality and crystallinity after unramified-completion descent.
- Purity removes all but one possible grade in degree two; exhaustiveness of the special filtration then makes the whole action scalar. No general semisimplicity theorem is inferred from purity.
- The theorem includes prime two in its geometric hypothesis, although the positive-weight local FL argument excludes p=2. It asserts total degree ≤3, with no off-diagonal degree-four extension.

## Sources and upstream audit

Fontaine's complete author scan was read visually: cover plus printed pp. 1–13, including all the local and global arguments and the alternate local proof. Public source: https://www.imo.universite-paris-saclay.fr/~fontaine/Zschemas.pdf, accessed 2026-10-19; SHA-256 **3a0d2b7a95db090438b43a86040d92b748e351a6461257dd083151864f33dc67**. Locators use printed author-scan pages, distinguished from the proceedings' pp. 43–56. The abstract's weak inequality is compatible with the letter's strict theorem and is not treated as an error. Remark (b)'s cycle-class consequence and the introductory speculation are outside the routed targets. No source error was established.

Schröer's author revision dated 19 July 2022 was read through the public web PDF, §5 pp. 14–17, especially Proposition 5.5 p. 16: https://www.math.uni-duesseldorf.de/~schroeer/publications_pdf/EnriquesOverIntegers_Juli2022.pdf. The metadata does not claim a locally downloaded or independently hashed copy. LMFDB 32.a3 was read for its minimal equation, discriminant 64, integral j=1728 and bad reduction at two: https://www.lmfdb.org/EllipticCurve/Q/32/a/3. Both were accessed 2026-10-19. The elliptic negative test uses the **3-adic** Tate module at the prime **2**, through the existing EllipticCurves Layer 4 criteria. Fontaine 1985 is an indirect reference reported by Fontaine 1993 and requested from R07.6; it is not claimed as a source newly read in this run. No cleared book was needed or copied.

The reviewed R25.1–R25.6 library audit, existing base/FL/p-adic/weights/scheme/K3/Enriques nodes and their exact statements were checked. At the pins, actual representation, invariant, submodule, finrank, root-discriminant and Tate-Hodge-piece declarations were read. The current read-only upstream **TauCetiRoadmap commit is 0d144d044dacebca17b654695b6f1ad58f159b27**, and current **Tau Ceti is a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039**. LocalFieldsRamification, NumberFieldArithmetic, LocalGaloisGroups and EllipticCurves documents and suggested interfaces were inspected. Current local different/discriminant, seventh-cyclotomic, finite-flat duality and Hodge-structure work is never replanned here.

## Consumer handoff

The historical route **EverywhereGoodReductionAndLowDegreeHodgeNumbers** in the Enriques materials should resolve to:

- `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.3/low-degree-hodge-vanishing` for PAPER-SCHROER-23/147;
- `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.4/k3-obstruction` for PAPER-SCHROER-23/148.

The repaired Enriques package supplies projective Z_p-scheme models and the shared projective geometric K3 predicate. An intrinsic merely proper K3 definition needs the K3 owner's projectivity bridge. Canonical covers, twists and generic-fibre matching stay with the Enriques owner, and no reverse dependency is introduced. These are handoff link updates only; this job does not edit that package.
