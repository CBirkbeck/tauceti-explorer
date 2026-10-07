# Integral Hecke actions, determinants and interpolation — revision 2

Job `BP-IntegralHeckeAndGaloisDeterminants~2`, issue #6932. Worker: Codex (GPT-6), session `codex-Tl5tL7`, 7 October 2026. This is a complete revision pass for the nine contracts identified in [the independent review](../reviews/REV-IntegralHeckeAndGaloisDeterminants.md), not a checkpoint or an implementation.

The [packet](../packets/IntegralHeckeAndGaloisDeterminants.json), [reader](../readmes/IntegralHeckeAndGaloisDeterminants.md) and [suggested Lean file](../suggested/IntegralHeckeAndGaloisDeterminants.lean) agree. Every original node ID, source-issue record, supplier request, boundary proposal and historical review record is preserved. The original `needs_changes` review is the pre-revision assessment; a fresh independent review must assess these repairs.

| Measure | Result |
| --- | --- |
| Nodes | 253: 28 definitions, 40 constructions, 115 lemmas, 16 comparisons, 54 theorems |
| Planning API | 228 items on definitions/constructions; 230 including the partition lemma's two items |
| Unit tests | 206; each of the 68 definitions/constructions has at least three |
| Theorem regression examples | Additional oriented-lattice, symplectic-form and exact-quotient-reduction examples in the suggested file |
| Planets | 33; no stage exceeds six |
| Pinned baseline declarations | 67, including 16 native module, Ext, local-ring and valuation interfaces added here |
| Sources / version records | 25 / 30; ANT20 accepted arXiv v2 is added |
| Source issues | 16, unchanged |
| Supplier requests / boundary proposals | 19 / 4, unchanged |
| Mathematical proof leaves | 38; five repaired contract-only gaps removed |
| Coverage | IHG.0, IHG.1, IHG.2, IHG.3, IHG.4, IHG.5 and IHG.6 all `planned`; zero `closed` |

## Contracts repaired

1. **Invariant evaluation:** the new `IHG.0/invariant-evaluation` bundles actual evaluation algebra maps and the explicit reindexing and final-coordinate multiplication equations. The representation constructor, continuity theorem, tuple kernel examples, reconstruction, discrete/valued continuity and slice signatures use that datum. The GL₂ unipotent examples additionally express regular polynomial evaluation and simultaneous conjugation invariance over algebraically closed fields. LP3 still supplies the actual group scheme and invariant-coordinate interpretation; no opaque proposition substitutes for it.

2. **Prescribed reducibility factors:** `IHG.1/gma-residual-dictionary` retains the ordered, split absolutely irreducible, pairwise nonisomorphic residual constituents, projector identities, diagonal reduction and product of full determinant laws. The two-block characterization uses those same constituents, explicit reduction through A/J→k and a unique ordered pair of factors. Its triangular example fixes the factor order in every characteristic. `partition-reducibility` now states the all-characteristic determinant theorem from ANT20 Proposition 2.5, its uniqueness and kernel containment, with the BC09 trace corollary retaining factorial invertibility.

3. **Actual Ext endpoints:** `IHG.1/quotient-constituent` constructs the vector modules from diagonal compression for singleton parts of the selected partition. The extension theorem takes a specified surjective quotient R→S with CH(D)⊆ker q⊆ker D and gives an injective map into Ext over R/JR of the restricted, prescribed modules. Its image is the range of restriction on Ext from S/JS. The projective-cover dependency no longer points back to the extension injection, so the proof graph is acyclic. The triangular Ext example has the correct orientation and nonzero endpoints.

4. **Ribet lattice:** the signature states the complete DVR, its fraction field and valuation unit ball, compact continuous irreducible representation, integral characteristic polynomials and prescribed distinct residual characters. The output is an actual finite free full stable submodule with an intertwining basis and an oriented nonsplit residual extension. Iwahori diagonal characters and the upper-unipotent unit test the orientation and nonsplitting. The stable-lattice and fractional-ideal proof remains open.

5. **Universal specialization:** the universal algebra is the actual characteristic-coefficient quotient. A specified coefficient map determines the specialized universal law; lifting requires compatibility of the entire determinant law with a Cayley–Hamilton target. Generator values and uniqueness are stated. Scalar extension is along that same map, and the matrix specialization assumes its residual law is split absolutely irreducible over a henselian local coefficient ring.

6. **Symplectic descent:** both coefficient rings are complete noetherian local with their adic topologies and a compatible common residue field of characteristic greater than two. The representation and prescribed full multiplier are continuous. The alternating form is explicitly invertible. The descended representation retains this form and multiplier, and the conjugator is a symplectic similitude reducing to the identity. The zero form is excluded by a regression example. The characteristic-two descent proof leaf is retained.

7. **Compatible local reconstruction:** the map is a surjective local coefficient map Ã→A. The same labelled GMA corner supplies the global compressed representation and local integral representation, with a residual local separator and chosen selected generic fibers. A full-law comparison with the given residually absolutely irreducible global representation supplies a conjugator over A, lifted through the local quotient. The local output reduces exactly to the given representation. The new `IHG.1/local-matrix-inner-conjugacy` supplies the precise matrix-algebra prerequisite. The suggested signature is the assembly step, with explicit outputs of the preceding projector/compression nodes as inputs; the reader records the full finite-flat CN23 setup.

The earlier review's clear repairs are preserved, including absolute irreducibility versus splitting, the non-Eisenstein Frobenius witness, operator telescope hypotheses, compact coefficient gluing, quotient-only nilpotent descent, Brauer–Nesbitt's actual module action, weak regularity, the degree-one law lemma and the corrected Chenevier Proposition 1.30 citation. The reader now reflects those repairs as well.

## What remains and where to resume

No stage is mathematically closed and no declaration is formalized: all `implementationStatus` fields remain `unchecked`. Every stage's `remaining` list is recomputed from the transitive prerequisite cones of the 38 proof leaves and 19 supplier requests. The precise lists are in the packet and reader; this revision resolves contracts, not those proofs.

For independent review, check all nine repaired contracts against their sources and the new interfaces, then assess the four new nodes. Preserve the historical review provenance until recording the new assessment.

The main IHG.1 follow-up leaves are now precise: transcribe the ANT20 proof's adapted-data/quotient independence, cross-part law-kernel vanishing, corner-degree argument and factor-kernel containment; prove BC09's primitive-projective Ext kernel calculation and the restriction image; derive the bundled finite-limit/finite-colimit preservation instances for restriction of scalars between the noncommutative module categories from the pinned per-diagram results; prove stable full-lattice existence and fractional-ideal entry rescaling. Characteristic-two symplectic descent, valuation reconstruction continuity and the unavailable reductive-group supplier interfaces remain open.

The other stage proof leaves remain: IHG.0's divided-power grading/representability, integral matrix invariants and projective/Azumaya descent; IHG.2's bounded derived/ghost and ordinary localization comparisons; IHG.3's full normalization and Galois-type inputs; IHG.4's integral uniform congruence inputs; IHG.5's specified geometric/nilpotent descent inputs; IHG.6's local factors, integral invariant theory and relation-complex comparisons. The integral pseudocharacter multiplicativity transfer leaf added by the review is retained.

Supplier ownership is unchanged: SR.4 owns spherical Hecke/Satake theory; LP3 owns invariant coordinates, algebraic-group cohomology and orbit/slice inputs; CC.8 owns completed Hecke algebras; R19.6 and AG2.4 own geometric congruence witnesses; DD.1 owns the Koszul complex and its regular-sequence exactness. The Semisimple algebras Part II request remains for general-ring Azumaya splitting and norm descent. None of these 19 requests has been marked supplied by this revision.

## Sources and baseline checked in this run

The accepted RS-24 result/review, AUDIT-33 library audit/review, IHG stage/link extracts, relevant ownership findings and nearby upstream SemisimpleAlgebras and CharacterTheory reader documents were read. Mathlib statements were read at `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti's roadmap baseline remains `f790474821cf4256814db967cb154e7af3d0c369`. Native `PolynomialLaw`, module categories, Ext, matrix actions and valuation/local-ring classes are reused.

Public texts reread for this revision, with exact editions, locators, access date (2026-10-07) and SHA-256 in the packet's source/version records:

- [Quast, Deformations of G-valued pseudocharacters](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf), author arXiv v1: Definition 3.1 and evaluation construction; Definition 3.10 and Lemma 3.11.
- [Böckle–Harris–Khare–Thorne](https://arxiv.org/pdf/1609.03491), arXiv v2: Definition 4.1, Remark 4.2 and Lemma 4.3.
- [Allen–Newton–Thorne](https://arxiv.org/pdf/1912.11269v2), accepted arXiv v2: §2 in full, including Theorem 2.4 and Proposition 2.5 with its entire proof. This resolves the previous instruction to obtain/read this proof; its mathematical transcription leaf remains.
- [Bellaïche–Chenevier](https://arxiv.org/pdf/math/0602340), public arXiv v2 preprint: §1.5 in full, the standing factorial hypotheses and Proposition 1.7.4 with proof. The published Astérisque text was not claimed as accessed.
- [Chenevier](https://arxiv.org/pdf/0809.0415v2): §1.22, Proposition 1.23 and scalar extension formula (1.8); Definition 2.19 and Theorem 2.22 with proof. The inherited source-archive hash and the distinct PDF hash remain separate.
- [Caraiani–Newton](https://arxiv.org/pdf/2301.10509v3): §3.2 in full, its finite-flat coefficient setup, local residual separation, Lemma 3.2.2 and Propositions 3.2.3–3.2.4 with proofs.
- [Gee–Geraghty](https://arxiv.org/pdf/1001.2044): Lemma 7.1.1 and its entire proof.

No needed passage for the nine contract repairs is missing. The remaining source-transcription needs of the inherited proof leaves are retained rather than claimed read or proved here.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/IntegralHeckeAndGaloisDeterminants.json` reports **0 errors and 0 warnings**. The entire suggested file elaborated successfully through `lean-check`, using the existing shared build at the exact Mathlib pin, with **only `declaration uses sorry` warnings**. All imports are individual Mathlib modules; it imports no Tau Ceti implementation module. This validates the suggested types and examples, not proofs. Memory availability was checked before each compilation, and no language server, library build or dependency/cache update was started.

The final consistency audit checks every original identifier and historical review/source-issue/request/boundary record, all 206 test names and object API declarations against the suggested file, all packet node statements and proof steps against the reader, the acyclic prerequisite graph, honest coverage/status fields, and the authorized deliverable paths. `git diff --check` is clean. No scratch file is a deliverable; all information needed for the next worker is in these four files.
