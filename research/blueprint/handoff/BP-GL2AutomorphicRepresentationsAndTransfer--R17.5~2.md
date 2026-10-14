# R17.5 revision 2 — handoff

Agent: Codex, session codex-rDSlGM. Refs #9766. This is the completed revision pass, with coverage **planned** and the precise proof gap G2 retained. It is not an accepted plan or an implementation. All four deliverables are reconciled; the original fifteen node ids and the entire independent `review` object are preserved. The next independent reviewer replaces that object.

## Changes and counts

The packet now has 39 declarations: 32 theorems, three lemmas, one definition, one construction and two applications. It has fourteen API items, eight unit tests, sixteen baseline declarations, sixteen supplier contracts, one remaining gap and one planet, the Fong–Swan theorem. Together with R17.3’s five R17.5 planets the layer stays within six. All implementation statuses are unchecked.

Twenty-four targets were added: seven for character extension and the isolation subgroup; two for the preliminary functional equation and induction-constant product; eight for finite splitting, descent, complete modular systems and projective character comparison; six for modular Clifford and the strengthened lifting induction; and the p-rational character definition. Small proof steps remain in sketches rather than further lemma nodes. The reader states all targets, hypotheses, proof outlines, direct prerequisites, source locators, APIs, worked tests and acceptance checks.

The reviewer’s accepted corrections remain: unitary geometric reciprocity for the unshifted comparison, the arithmetic-Frobenius dual adapter, the correct U⁰ and positive congruence subgroups, a subgroup supported on S, local rather than global Weil-group twists, explicit split spectrum in general-domain Brauer reduction, the distinction between the abstract projective pairing and the modular Hom formula, and descent up to conjugacy for arbitrary algebraically closed k.

## Review gaps addressed at target level

- **G1:** Explicit open, Euclidean, compact and real-times-compact extension targets prove the idele instance. Peter–Weyl and Haar orthogonality are imported from current CompactGroups. The isolation subgroup uses compact norm slabs and a proper multiplication embedding to obtain the exact product topology before extending its character.
- **G3:** Import the existing finite-algebra projective covers. New targets lift projectives over a complete DVR, prove p-singular vanishing, derive the modular projective Hom pairing and count p-regular conjugacy classes. This makes the Brauer recognition step independent of a missing representation-theoretic interpretation of GrothendieckEulerForms.
- **G4:** Modular inertia correspondence, the coprime-index bijection, p-group lift comparison, determinant-order extension and odd-p p-rational extension feed the full automorphism-equivariant Isaacs induction, including its characteristic-subgroup degree clause. The new p-rational predicate has four API items and four tests; both C₂ characters at p=2 are admitted, while nontrivial C_p characters at odd p are excluded. Ordinary cyclic-quotient extension and relative-degree divisibility are exact Part II contracts rather than claims about current Layer 5.
- **G5:** Finite-dimensional algebra splitting and split-simple scalar extension descend a simple module from arbitrary algebraically closed k to a finite splitting field up to isomorphism. No argument assumes displayed matrix entries are algebraic over F_p. Complete modular systems then support the projective and lattice comparisons.
- **G6:** All three pages of Tunnell’s publisher PDF were collated via the archive URL recorded in `sources` and `sourceVersions`; SHA-256 matches the original record. Page 173 supplies the non-normal cubic/GL₃ input. Page 174 distinguishes the two quadratic descents by cubic base change, not determinant. Page 175 gives the unramified order obstruction. The prior independent unverifiable verdict stays as historical review evidence.

## Exact remaining G2 and continuation

The preliminary Artin functional equation is now explicit: Brauer induction, local L-induction (including the archimedean adapter) and one-dimensional Hecke functional equations give the intrinsic nonzero exponential E_pre. This prefix uses no higher-dimensional local epsilon factor. R01.2’s local epsilon existence proof must cite this prefix when integrated.

The missing proof is **∏_v λ_v(K/F,ψ)=1**, with ψ_K=ψ∘Tr, all archimedean factors, and products of local additive measures equal to Tamagawa measures. Degree-zero local induction yields the λ correction for arbitrary representations. The product assertion is required to identify the preliminary factor with the product of Deligne local constants. Deligne 5.11, p. 551, states the resulting global functional equation, but its short proof refers to known arguments rather than providing the induction-constant calculation. This revision did not establish the identification of that correction with a trace-pairing Fourier scalar; citing adelic Poisson alone would leave the same hole.

A continuation should first supply a collated proof of that precise product comparison, or plan its explicit trace/Fourier calculation with all normalizations. Then integrate the supplier chain in the order **preliminary prefix → local existence → induction product → final functional equation**. Do not invoke unrestricted local inductivity, and do not point local existence at the final global theorem. The every-place upgrade and residual modularity targets remain conditional on this analytic input.

R17.3’s two inherited gaps are not retired: `closesGaps` is empty, and both supersession proposals have pending owner integration and independent review status. The GL₃/JPSS proof contract, Hilbert classical weight-one dictionary and multi-place finite-order prescription remain supplier obligations, not achievements of this part.

## Current-library and roadmap boundaries

Read actual baseline statements at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The sixteen baseline entries include the original group, localization, matrix, irreducibility and roots-of-unity declarations, plus continuous characters, Circle, Stone–Weierstrass, Artinian radical results, Nat.factorization and IntermediateField.adjoin. AUDIT-14 was checked. Current Tau Ceti was also searched; it does not implement these end targets.

Current TauCetiRoadmap main was checked independently of the atlas snapshot. InductionRestriction and GrothendieckEulerForms were read in full; relevant current CompactGroups, QuiverRepresentations, SemisimpleAlgebras and LocalFieldsRamification layers and suggested files were inspected. Existing covers, Peter–Weyl, Haar orthogonality, Wedderburn blocks and cyclotomic splitting are imported. Current ordinary Clifford theory is not used as modular Clifford theory. SemisimpleAlgebras’ central-simple splitting theorem is not substituted for general finite-algebra splitting. The prescribed unramified residue extension belongs to LocalFieldsRamification Layer 2.

## Contracts and owner moves

The sixteen exact supplier contracts are in `requests` and reproduced in the reader. They cover GlobalNumberFields Layers 1, 6, 7 and 9; ClassFieldTheory Layer 11; InductionRestriction Layers 0, 5 and 6; SemisimpleAlgebras Layer 2; QuiverRepresentations Layer 3A; CompactGroups Layers 5 and 6; LocalFieldsRamification Layers 0 and 2; ModularForms Layer 4; and GrothendieckEulerForms’ already-owned abstract pairing. R01.1’s matrix-span adapter and R01.2’s local constants are separately imported by exact external node ids; the outstanding product comparison is the explicit G2 contract.

Maintainer integration proposals:

1. Move the idele extension and isolation topology, with their five extension foundations, to GlobalNumberFields Part II, retaining CompactGroups imports.
2. Move the preliminary, product and final global functional equations to R01.2 in the noncircular order above. Repoint `local-epsilon-factor` first.
3. Put modular Clifford, mixed-index correspondences, determinant and p-rational extension, the p-rational predicate and character-field adapter in InductionRestriction Part II. Add ordinary cyclic-quotient extension and relative-degree divisibility there. Keep the strengthened and final Fong–Swan targets together at their first consumer until integrated.
4. Put general finite-algebra splitting and split-simple scalar extension in QuiverRepresentations Part II. Reuse its existing covers; keep the finite-field and complete-system consequences explicit at the modular consumer.
5. Retain the previous proposals moving local GL₂ converse/stability to R16.3, importing Brauer characters into the higher KTheoryFiniteLocalFields consumer, and moving the GL₃ supplier targets to R17.4a with AL.3b.

**RT-AREA-automorphic-1/1:** Keep the R17.3 R17.4a/AL.3b proposal and the actual non-normal cubic base-change requirement; this revision adds only the GL₂ all-place refinement. It does not fix the GL₃ source-proof obligation by naming it.

**RT-AREA-automorphic-1/11:** Retain the R16.4 → R17.3 proposal and explicit R16.3–R16.6 → R17.5 links. In particular R16.6 supplies the classical Q weight-one comparison; strong multiplicity one remains R16.4’s input. No same-roadmap stage edge has been manually promoted.

Consumer retargets for ClassicalSerreModularity, EllipticCurveModularityWild3Adic, PotentialModularityAndCompatibleSystems, ModularityAndLanglandsExtensions and Carayol’s AutomorphicGaloisRepresentations uses remain in the packet, with the new R01.2 preliminary-prefix retarget. No other packet was edited.

## Sources and source corrections

Sources read: Jacquet–Langlands IAS retypesetting, Theorem 2.18/Corollary 2.19, Proposition 3.8 and Theorem 12.2 with Lemmas 12.3–12.5; Langlands author version §§2–3; Deligne 3.11–3.12, 4.1, 4.12, 4.14 and 5.11; Webb’s dated author prepublication Chapters 9–10 at the cited locators; Isaacs Definition 1.1, §2, 3.1, 4.1–4.7, 5.4 and §6; Tunnell 1981 pp. 173–175; BCGP Proposition 10.1.3; Deligne–Serre §4; Dieulefait–Pacetti’s stated preprint version; Rogawski–Tunnell §1; and Dikranjan’s dated notes at the theorem/page locators in the packet. The cleared Bushnell–Henniart copy supplied §§27.1–27.2, 27.8 and the preliminary functional equation/local existence discussion in §§30.8–30.9. No files or passages from that book were copied. No cited source remains unavailable; the missing item is the precise product proof just described. Later printed versions of the author prepublication sources were not collated.

E16 and E17 remain rejected under the original independent findings. E18 retains its narrow prepublication qualification. Seven new unreviewed findings E19–E25 record, in our own words, Webb’s self-comparison typo in projective-lift uniqueness, and Dikranjan’s extension formula/sign, repeated compact factor, fractional-part variables, cyclic-subgroup/index notation, limiting direction, and premature open-image assertion with quotient-domain notation. Source-page images were checked to distinguish actual defects from missing closure bars in text extraction. These findings concern only the versions read; author-page/correction-list searches found no correction for them. Theorems use corrected statements and arguments.

## Validation

- `check_blueprint.py` with the pinned declaration index: **0 errors, 0 warnings**, 39 nodes, fourteen API items, eight unit tests, sixteen baseline declarations, sixteen requests, one planned stage, zero closed stages.
- Source-issue schema validation: no errors. Original review object and all original node ids mechanically checked unchanged/present.
- `lean-check` in the shared pinned build: **exit 0**, 508 lines, 25 warnings, all `declaration uses sorry`. No other warnings or errors; no placeholder data definitions. The new p-rational definition and examples, continuous-character milestones and finite-field descent signature elaborate. Heavy targets stay in the reader. The original elementary involution proof remains proved.
- `git diff --check`: clean. Only the issue’s four named deliverables changed.

The next action is independent review of this revision, including G2’s exact status and the proposed owner contracts. Coverage must not be promoted to closed until the product proof and supplier integration are established.
