# Handoff: BP-ArithmeticGaloisRepresentations--R01.5

Issue: #7959. Agent: Codex. Session: codex-AMR33J. Branch: codex-AMR33J-r01-5.

## Result and scope

The packet is a **complete planning pass** and its sole stage, `ArithmeticGaloisRepresentations:R01.5`, is **planned**, not closed. The accepted parent packet is unchanged. All 53 of its R01.5 principal target IDs are retained by explicit import. This part adds 23 declaration nodes: 2 definitions, 2 constructions, 13 lemmas, 5 theorems and 1 comparison. Its four definitions/constructions have 13 API items and 12 named unit tests. It adds one planet, Trace field, to the parent's five, giving six after assembly. It cites 49 baseline declarations. Every node remains implementationStatus unchecked.

The algebra additions separate the trace field, image algebra, span/trace membership, image basis, trace-dual coordinate descent, finite dimension, exact dimension, canonical base change, centrality, simplicity, splitting-field polynomial invariance, coefficient descent, trace/polynomial-field comparison, faithful determinant quotient, attached Brauer class, two splitting/realization criteria, and attached Schur index. The other three declarations supply BLR polarization, the rank-two group-element quadratic ideal/kernel equality, and elementwise-annihilation isotypy. The full-span interface is explicit and every central-simple/Brauer/index use requires positive dimension.

These are the four deliverables:

- `research/blueprint/packets/ArithmeticGaloisRepresentations--R01.5.json`
- `research/blueprint/readmes/ArithmeticGaloisRepresentations--R01.5.md`
- `research/blueprint/suggested/ArithmeticGaloisRepresentations--R01.5.lean`
- this handoff note.

The reader gives the exact added statements, APIs and tests, a catalogue of all 53 retained interfaces, the full-span and splitting proof route, source locators and the remaining supplier contracts. The suggested file prototypes only the new declarations and their APIs/tests. The parent suggested file supplies the retained signatures; this part does not duplicate them.

## Existing material consumed

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The pinned Mathlib Git HEAD was verified. All ten cited Tau Ceti source files in the shared build were byte-compared with the pinned Git objects. The statements were read, including the class-map/CSA constructors, Brauer base change and splitting criteria, finite-field and quaternion facts, degree/index and Skolem–Noether. There is no new generic Brauer group, central-simple structure, index or polynomial-law definition.

Current TauCetiRoadmap main was checked read-only at commit `94ff6a17fb5f138baeac6cd961cd5c21e40f6696`. The upstream documents used include IntegralHeckeAndGaloisDeterminants and RepresentationTheory/SemisimpleAlgebras; the Chebotarev, DifferentialGeometry, ReductiveGroups and relevant local/profinite documents were screened for the remaining supplier directions. Current Tau Ceti was searched separately from the pinned build. No build or update command was run in either read-only checkout.

The packet's `prerequisiteRefinements` records exact IHG exports now available: algebraically-closed-reconstruction, field-faithful-quotient, henselian-irreducible, coefficient-descent and symplectic-coefficient-descent. Its new determinant quotient comparison also uses IHG.0's matrix determinant, coefficient-subring descent and universal determinant-kernel characterization. The BLR module argument verifies full polarized Cayley–Hamilton annihilation before applying IHG.1/brauer-nesbitt-module-recognition. Existing upstream targets are imports, not new nodes.

A declaration-index limitation needs attention at assembly. The actual Haar singleton-null instance is `MeasureTheory.Measure.IsHaarMeasure.nullSingletonClass`, source line 943 in `Mathlib/MeasureTheory/Group/Measure.lean`. The supplied index skips priority-decorated instances and lists only its deprecated noAtoms alias, line 955. This packet uses the indexed alias as its baseline reference and records the preferred actual declaration separately. Once the index is regenerated, use the instance name. Both the source statement and its nonisolated-identity/T1/Borel/weak-local-compactness hypotheses were read; this is not a missing mathematical theorem.

## Work required to close R01.5

Three bounded mathematical gaps remain, each with exact consuming IDs and input contracts in the packet.

1. **Nonarchimedean analytic Haar-null bridge.** Construct intrinsic analytic charts and the Haar/additive chart measure comparison for compact open subgroups of smooth closed algebraic H(E), then prove the empty-interior analytic zero-locus theorem. The open-GL_n matrix proof cannot be used for GSp₄(O_E). For disconnected H, check every algebraic component met by the compact group, not just H°. This is the same need as DeligneWeightsAndPurity:DWP.3/haar-null-exceptional-eigenvalue-locus; assign one lower-tier owner and import it in both places. Real DifferentialGeometry supplies no such nonarchimedean interface. The abstract clopen, closed-upper-bound and boundary-null Haar-Chebotarev theorems do not depend on this gap.
2. **Minuscule Lie-algebra input.** Nekovář Proposition 3.10 has been read. Its case (3) requires a=r=1 and the minuscule Lie-module hypothesis, and yields global semisimplicity with isotypy on the specified open subgroup. Plan the compact-image logarithm passage, minuscule weight/unipotent detection, standard sp₄/gsp₄ verification and the finite-component argument needed for the global retained GSp₄ conclusion. Reading the source removed the unknown-source status, but does not supply these library declarations. BLR now supplies the separate rank-two input; it is not a theorem in arbitrary rank.
3. **Induced GSp₄/Asai monodromy.** Plan exact algebraic Goursat, normal-unipotent/reductive and SL₂×SL₂ central-quotient representation inputs, then the representation-specific O₄/SO₄ closure and N⋊O₄ subgroup classification with the degree-five minimal-polynomial witness. Current ReductiveGroups layers 3/5/6 cover surrounding notions, but do not explicitly state every needed comparison. The packet proposes a Part II. Keep the Asai and affine-monodromy specializations in this direction. The Ext¹ restriction/induction comparison must move down to this lower-tier owner, with ArithmeticGaloisDuality importing it; no upward prerequisite was added here.

Six unresolved supplier requests are retained: Chebotarev layer 10 (Dirichlet density), layer 14 (natural density), ArithmeticDirichletSeries layer 7 (density calculus), SemisimpleAlgebras layer 2 (block/module dictionary), FunctionFieldArithmetic:FA.5 (curve Chebotarev with constant-field degree congruence), and InverseGaloisAndArithmeticFundamentalGroups:IG.1 (fundamental-group, Frobenius and lisse-sheaf interfaces). Use the precise packet contracts and consuming IDs. The old coarse IHG.1 request is replaced by its exact exported nodes.

The generic reduced characteristic polynomial/reduced norm API is not a current SemisimpleAlgebras layer-4 target. This part proves only the attached matrix coefficient descent through a separable splitting and fixed-field comparison. A Part II proposal records the reusable generic extension. Do not claim that generic API as a baseline or existing-roadmap declaration.

Assembly must retain the parent principal Brauer target ID, use the new carrier and lemma IDs in its proof dependencies, apply `prerequisiteRefinements`, and reconcile prototype names with the actual baseline constructors. The part's `imports`, `principalRefinement`, source-issue references and reader are the durable assembly instructions; no scratch file is needed. There are no duplicated node IDs. Preserve the total of six stage planets.

## Sources and outstanding version checks

The packet records public URLs, digests and access date 2026-10-09 for the seven sources actually read:

- BLGGT arXiv:1010.2561v4, Lemma A.1.5 and proof, p.85.
- Chenevier arXiv:0809.0415v2, Theorem 2.12 and proof pp.28–30; Theorem 2.16 pp.31–32; Definition–Proposition 2.18 pp.32–33; Definition 2.19 p.33; Theorem 2.22 pp.34–35.
- Serre, written by Rouquier, Représentations linéaires sur des anneaux locaux, d'après Carayol, Cours no.14 (1993), Theorem 1 pp.1–2, Theorem 4 and Corollary 5 p.3.
- Boston–Lenstra–Ribet 1991, all six scanned pages pp.323–328, especially Propositions 1–2 and Theorem 1 pp.323–325, and the rank-three/general-degree counterexamples pp.327–328.
- Nekovář 2018, Proposition 1.3 and §§1.4–1.6 pp.1187–1189, Theorem 3.7 and Proposition 3.10 pp.1195–1198, including (A′), (C′), case (3) and the proofs.
- BCGP arXiv:2502.20645v1, §4.11 and the proofs of Propositions 4.11.1–4.11.2 pp.109–112.
- Deligne–Serre 1974, Lemma 6.13 and proof p.523.

Original Carayol 1994 Theorems 1–2 were not obtained from a public primary source and are not in the cleared library. Their exact attribution remains to be checked. The proof plan uses the read Serre/Rouquier statements and exact existing IHG coefficient-descent contracts. Chenevier's published 2014 chapter and Kisin–Zhou's published Annals 202 (2025) Proposition 5.3.5 remain version comparisons. Official publication metadata was found, but the published text was not read, so no assertion about its corrected wording is made. Use only a public primary copy or a maintainer-cleared copy to settle those checks.

The source issues are inherited, not recreated: `ArithmeticGaloisRepresentations/E501` is scoped to Chenevier arXiv v2's split wording; `ArithmeticGaloisRepresentations/E502` supplies the reciprocal Asai eigenvalue pair 1, −1, λ, λ⁻¹. No new source error is asserted. The cleared-library index was read; Schneider's p-Adic Lie Groups was screened in place as a possible analytic/Lie supplier, but no Haar-null theorem from it is claimed or relied upon. No private file, passage or extracted book text was copied.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticGaloisRepresentations--R01.5.json`: zero errors and zero warnings with the supplied pinned declaration index.
- `lean-check research/blueprint/suggested/ArithmeticGaloisRepresentations--R01.5.lean`: exit 0 at the pinned shared build, with **sorry as its only warning**. No language server or library build/update/cache command was used.
- Packet/file parity checked for all 23 proposed declarations, all 13 API items and all 12 named examples; every one of the 53 retained parent IDs is in the reader catalogue.
- All new IDs are disjoint from the accepted parent; the new dependency graph is acyclic. Planet union and baseline file/pin checks pass.
- The submission file-path/private-path checks and whitespace checks are run before the pull request is opened. The pull request references #7959 and is submitted for an independent review; it does not close the issue or certify formalization.
