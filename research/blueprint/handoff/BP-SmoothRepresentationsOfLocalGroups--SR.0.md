# Handoff: BP-SmoothRepresentationsOfLocalGroups--SR.0

Issue #996; agent Codex; session codex-bKazsS. This completes the planning pass continued from Claude Code's cc-144b52 checkpoint in #7974. The packet is `complete` for independent review, under PROTOCOL.md section 0. No stage is closed and no implementation is claimed: every node remains `unchecked`.

## Deliverables and checks

The packet and reader retain all 99 declaration nodes: 55 theorems, 21 definitions, 19 constructions, 2 comparisons and 2 applications. There are 282 definition/construction API entries plus 9 theorem API entries (291 total), 161 planned unit tests, 35 planets, 83 pinned baseline declarations, 14 supplier requests, 7 gaps, 2 restructure proposals and 26 source issues. All 8 coverage records are `planned`.

The suggested Lean file now elaborates at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The final `lean-check research/blueprint/suggested/SmoothRepresentationsOfLocalGroups--SR.0.lean` exited successfully with 497 admitted-proof warnings and no other diagnostics. Compilation checks signatures, not the truth of admitted proofs.

Typed coverage is 56 of 99 target declarations, 219 of 291 API entries, and 108 of 161 tests as named `example`s. The omission ledger at the end of the suggested file names every remaining declaration, API item and test, with its mathematical statement and the specific missing supplier carrier or operation. It contains 155 distinct names accounting for 43 target entries, 72 API entries and 53 tests; some names serve more than one packet role. These comments are not compiled assertions or passing tests. This follows the inherited checkpoint's instruction to instantiate reductive statements for GL_n(ℚ_p) or omit them with a comment, and section 13's instruction to leave out conditions that cannot yet be stated rather than invent proposition fields. The reader and packet remain definitive for the full plan.

Validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/SmoothRepresentationsOfLocalGroups--SR.0.json --index PINNED_DECLARATIONS_TSV`: 0 errors, 0 warnings. Use the declaration index generated from the two commits above.
- Packet-to-reader statement, hypothesis, proof, API, test and locator checks; named-signature/example/omission coverage audit; source-issue schema check.
- Swarm deliverable-path/local-path validation and `git diff --check`.

## Corrections and concrete interfaces

The Lean prototypes exposed mathematical statements that were too broad. Packet and reader now agree on these corrections:

- A discrete group has the good compact open subgroup {1} over any coefficient ring. Invertibility of p is necessary for a cofinal good basis only for a non-discrete locally pro-p group. Admissibility tests on a cofinal basis also retain the noetherian or all-compact-open invertibility hypothesis needed to descend to submodules.
- The permutation algebra uses the existing Hecke ring. With the stated inverse-basis action, H(U) is End(c-Ind_U A); Yoneda's order for Ext composition makes degree-zero derived Hecke H(U)ᵒᵖ. The two coset-sum formulas and graded bimodule sides follow these conventions.
- Nondegenerate modules use the A-unitization as their actual module carrier. Smooth induction is the smooth part of coinduction; compact induction uses compact support on the quotient. Jacquet modules reuse the pinned quotient-to-coinvariants functor, retaining the Levi/quotient action.
- Derived duality uses K-flat replacement in its contravariant input. The file gives actual smooth tensor complexes, totalisation, the acyclic-tensor K-flat predicate, replacement data and internal-Hom signatures; existence and smoothness of equivariant replacements remain a gap.
- The ordinary smooth centre has the corner-limit formula. Its identification with the enhanced π₀End(id) requires a separate comparison; the triangulated category centre is not substituted for the enhanced centre.
- A positive Levi double-coset product reduces to U m U_M m' U in general. The single-coset identity needs the Levi-normaliser hypothesis. The general embedding by transfer of structure constants remains a gap.
- Concrete GL_n(ℚ_p) uniform-admissibility, noetherianity and centre-finiteness signatures use the matrix-unit carrier. The conductor-character counterexample has unbounded exact p-power conductors. The regular isotypic quotient uses an admissible irreducible representation and the left/right smooth part of all linear endomorphisms.

## Coverage and where follow-up work resumes

### SR.0 — planned

- SR.0 is the compatibility name of SR.0:abelian-category (REV-RS-21): its nodes realise both ids and nothing further is planned under SR.0 alone.

### SR.0:abelian-category — planned

- Topological smooth representations on topological modules beyond the profinite comparison of PC1 (only the algebraic carrier is planned).
- Instantiate the GL₂ compact-open invariant test with the requested Cartan representatives and GL₂(ℤ_p) subgroup, listed in the omission ledger.

### SR.0:derived-extension — planned

- Complete the equivariant K-flat replacement, tensor totalisation and derived internal-Hom construction (recorded gap).
- The ∞-categorical enhancement and comparison with sheaves on [*/G] are supplied by EnhancedDerivedSheaves:E1 and the V-stack roadmaps; this part owns the dg model and ordinary derived functors.
- Instantiate the double-coset derived-Hecke product with ProfiniteCohomology Layers 10 and 12 and prove compatibility with the chosen Yoneda opposite convention.

### SR.1 — planned

- Prove the general positive Levi Hecke embedding by transfer of Levi structure constants (recorded gap); the normaliser/torus product is the stated special case.
- Construct the enhanced degree-zero centre comparison with the ordinary corner centre (recorded gap).
- Use the requested ReductiveGroupsPartII parabolic, Iwahori and root-data carriers to instantiate the named signatures in the omission ledger. The spherical comparison and integral spherical presentations are SR.4 targets.

### SR.2 — planned

- Supply multiplicity one and Rodier heredity for general quasi-split groups and the degenerate Whittaker inputs (recorded gaps).
- Specify the smooth equivariant l-sheaf category, its compactly supported sections and equivariance, then instantiate the sheaf and Mackey signatures listed in the omission ledger.
- Instantiate parabolic induction, generic root characters, Jacquet normalisations and Casselman statements with the requested reductive supplier carriers.

### SR.2a — planned

- Instantiate stabilisation, canonical lifting, Jacquet duality and second-adjunction unit/counit with the requested parabolic-pair and positive-cone carriers.
- The integral (ℓ ≠ p) second adjointness is supplied by SR.6 and compares with this complex-coefficient adjunction.

### SR.3 — planned

- Supply Harish-Chandra’s classification of tempered representations and the Schwartz/tempered projectivity input (recorded gaps).
- Instantiate cuspidal-data, inertial-class, affine-torus and quotient-variety carriers, and the associated block, centre, Langlands and Steinberg signatures in the omission ledger.

### SR.3a — planned

- Use the requested rational-point, Levi, Cartan-cone and congruence-subgroup carriers to extend the concrete GL_n(ℚ_p) signatures to general reductive G(F) and instantiate the remaining cuspidal signatures in the omission ledger.

The omission ledger groups names by packet node. Start an interface follow-up there, import the actual supplier carriers, replace the corresponding comments with typed signatures and examples, then reconcile packet and reader. Do not manufacture parabolic, root, variety or equivariant-sheaf conditions as opaque propositions. Mathematical proof gaps are distinct from unavailable Lean carriers.

## Mathematical gaps

- **Uniqueness of Whittaker models and Rodier heredity for general quasi-split groups.** whittaker-functionals defines generic representations and proves the GL_2 case; multiplicity one of Whittaker functionals for irreducible representations of a general quasi-split G (Gelfand–Kazhdan, Shalika) and the heredity of genericity under parabolic induction (Rodier) are not proved in the sources read. Gan–Savin use both for exceptional groups without proof. A source with a complete proof must be read before these are planned.
- **Harish-Chandra's classification of tempered representations.** Konno's proof of the Langlands classification takes as input Harish-Chandra's result that every irreducible tempered representation is a direct summand of a representation unitarily induced from a discrete series (Waldspurger 2003, Proposition III.4.1); its proof uses the Plancherel theory, which no stage in scope plans. langlands-classification is planned modulo this input.
- **Projectivity of discrete series in the tempered category.** Discrete series are projective and injective in the category of tempered representations (Meyer's Schwartz-algebra method); no Schwartz algebra or tempered category is planned here, and no source with a complete proof was read.
- **Degenerate Whittaker models and wave-front sets.** Mœglin–Waldspurger degenerate Whittaker models, used by Gan–Savin for the exceptional groups, are not planned; the source was not read.
- **Bushnell's localisation proof of second adjointness and the Bushnell–Kutzko Hecke-algebra embeddings.** Bushnell (J. London Math. Soc. 63 (2001)) was not obtained in a public copy, and Bushnell–Kutzko 1998 (Allen et al. [BK98, Cor. 6.12]) was not read. The normaliser/torus single-coset calculation is planned, but a proof of the general positive Levi Hecke embedding by transfer of structure constants remains missing. Second adjointness follows Bernstein’s route; neither unread source is claimed as read proof support.
- **Equivariant K-flat replacements and derived tensor/internal Hom.** The pinned libraries contain neither total tensor products of smooth complexes nor equivariant K-flat replacement. Stacks Section 20.26 (Tag 06Y7) supplies the non-equivariant definition and tensor criterion. The suggested file states concrete smooth tensor complexes, direct-sum totalisation, the acyclic-tensor K-flat predicate, replacement data and the derived internal-Hom adjunction. A complete equivariant construction and proof that replacements remain smooth are still missing; K-injective resolutions alone do not provide them.
- **Enhanced degree-zero Bernstein centre comparison.** The ordinary SmoothRep centre is planned as a compatible family of corner centres. To identify this with Fargues–Scholze’s π₀End(id), construct the dg/enhanced natural transformation object and prove that restriction to the heart induces an isomorphism in degree zero. The unenhanced triangulated CatCenter can have additional transformations and is not used as a substitute. This is the remaining early-owner input for RT-AREA-geomlanglands/9 and the higher ES0 comparison.

## Supplier requests (14)

- ProfiniteCohomology Layers 0, 1, 7, 10 and 12. Layer 10 supplies all-degree restriction, conjugation, Shapiro, open-subgroup corestriction and Mackey compatibility; the added Layer 12 request supplies graded cup products and projection formulas. SR.0 owns agreement with Yoneda composition.
- ProfiniteProPGroups Layer 1.
- RepresentationTheory/InductionRestriction Layers 0 and 3.
- ModularForms Layer 2, reusing the existing double-coset product.
- ReductiveGroups Layer 7.
- ReductiveGroupsPartII RG2.0, RG2.1, RG2.3 and RG2.4. RG2.4 also supplies the Cartan/coset data for the omitted GL₂ tests.

## Ownership and order to carry forward

REV-RS-21 was accepted before this claim. SR.0 is the compatibility alias of SR.0:abelian-category, with the same nodes realising both ids. SR.1 retains characteristic-p permutation-module Hecke algebras without unconditional averaging. SR.3a does not depend on centre finiteness.

The two inherited restructure proposals remain proposals for the maintainer:

1. Order the layers SR.0:abelian-category → SR.1 → SR.0:derived-extension → SR.2 → SR.3a → SR.3 → SR.2a. Stabilisation uses uniform admissibility, Bernstein decomposition, noetherianity and generic irreducibility (Bernstein 1992, III §3.3, Theorem 22, pp. 67–70; Bernstein 1987, §5.3). SR.3 does not use SR.2a. The derived Hecke algebra adds the early SR.1 edge; the regular principal-series Ext argument adds the early derived-extension → SR.2 edge.
2. Move K-injective resolutions, the dg Hom-complex model and derived invariants down from EnhancedDerivedSheaves:E1 to SR.0:derived-extension. E1 retains the downstream ∞-categorical comparison. Higher consumers must point to these early owners; the packet has no ExcursionOperatorsAndSpectralAction or LanglandsParameterStacks prerequisite.

RT-AREA-geomlanglands/9 has the ordinary corner-centre and ℓ-adic separatedness plans, but the enhanced comparison remains the seventh gap. The inherited handoff's claim that the enhanced comparison was proved has been corrected. Source issues E24–E25 continue to record what Fargues–Scholze assert without proof.

SR.4/SR.5/SR.6 remain with the other part: spherical comparison and Satake; integral GL_n families and co-Whittaker modules; integral centre finiteness and integral second adjointness. Nothing from those stages is re-planned here.

## Source provenance

The checkpoint's source inventory is preserved: 30 sources and, after the added Stacks PDF version, 37 source-version records. Its reads include Casselman 1995, Bernstein 1992 and 1987, Bernstein–Deligne 1984, Bernstein–Zelevinsky 1976/1977, Borel, Casselman 1980, Iwahori–Matsumoto, Haines–Kottwitz–Prasad, Lusztig, Vignéras, Dat, Bezrukavnikov–Kazhdan, Konno and the routed papers listed in the packet. URLs, locators, version notes and available hashes are in `sources` and `sourceVersions`. These inherited reads are not represented as fresh reads by this session.

This session checked the source statements relevant to the corrected positive embedding and second-adjointness conventions in Allen et al., *Potential automorphy over CM fields*, §2.1, Lemmas 2.1.10–2.1.13, and Bernstein's 1987 notes, §5. It read Stacks Theorem 19.12.6 (Tag 079P) and Section 20.26 (Tag 06Y7), including Definition 20.26.2 and Lemmas 20.26.7, 20.26.11–12, for K-injective/K-flat distinctions. The official cohomology chapter PDF, version ed88ff78 dated 14 July 2026, confirms the repeated-index misprint at Lemma 26.7, p. 56; new source issue E26 records the correction in our own words. Those Stacks tensor statements are non-equivariant and do not close the smooth-equivariant gap.

The 75 inherited baseline anchors were checked against pinned source files. This session read and added 8 further anchors: `CategoryTheory.Simple`, `Unitization`, `Rep.quotientToCoinvariantsFunctor`, `Rep.quotientToInvariantsFunctor`, `Representation.tprod`, `MonoidAlgebra.mapDomainRingHom`, `Module.compHom` and `CategoryTheory.Abelian.Ext.comp`.

Sources still missing or unread: Bushnell 2001; Bushnell–Kutzko 1998; the Bushnell–Henniart and Renard books; the published Inventiones/Duke versions of CG18, CG20, Gan–Savin and Boxer–Pilloni. Public author/arXiv versions used by the checkpoint are distinguished in the packet. No uncleared book copy, book file or source passage was copied into the deliverables. No scratch files are needed to resume: the packet, reader, suggested omission ledger and this note contain the handoff.
