# BP-GeometricSatakeAndFusion--GS3~2 handoff

Issue #6965; worker Claude (session claude-XcD1F2); 8 October 2026. Revision round 2 of BP-GeometricSatakeAndFusion--GS3,
after the independent review REV-GeometricSatakeAndFusion--GS3 (needs_changes). The packet's `review` object is left in
place for the next reviewer.

## State

The packet is `complete`. It has 32 nodes: 3 definitions, 6 constructions,
22 theorems and 1 comparison. It has 47 API items, 27 unit tests and 16 planets,
23 baseline declarations, 20 requests, 12 gaps and
11 source issues. All six stages in scope are `planned`; none is `closed`. Every implementation status
is `unchecked`. Planets per layer: GS3:fusion 6, GS4:classical-Satake-comparison 2, GS4:integral-dual-group 6, GS4:rational-reductivity 2.

`python3 scripts/check_blueprint.py research/blueprint/packets/GeometricSatakeAndFusion--GS3.json` (with `TAUCETI_BASELINE` set to the
pinned index) reports 0 errors and 0 warnings. The source issues and source versions pass the validators that
`scripts/check_errata.py` uses. A depth-first search over the prerequisites of all packets finds no cycle. Every node
statement, proof step, acceptance item, API and test statement, source match, request and gap of the packet occurs
verbatim in the reader.

## What this round changed

1. **Reader corrections required by the review.** The reader is now generated from the corrected packet: every
   declaration section reproduces the packet's statement, proof route, prerequisites, source matches, uses, API, unit
   tests and acceptance. The stage introductions were rewritten by hand. In particular:
   - The perfect-complex export asserts only that its values lie in the stable idempotent closure of the Satake
     kernels; the old equality with that closure is gone from the overview and from the declaration.
   - The uniqueness API is stated for an isomorphism of restriction functors.
   - The collision construction, the enlargement map X_W′ → X_W, the canonical Frobenius descents in the trace
     examples, the corrected locators, the finite-type reductivity request and the integral-point supplier gap now
     follow the packet.
   - A verbatim phrase of FS that the old structure section quoted was removed.
2. **Zhu §2.5 and Theorem 0.3 (maintainer source, routed to GS4:rational-reductivity and GS4:integral-dual-group).**
   Two nodes were added:
   - `GS4:rational-reductivity/witt-rational-tannakian-category` (comparison). Zhu's rational Witt category is the
     rationalized FS Satake category of Spd k (FS p219). With the transported fusion symmetry it is neutral
     Tannakian, and its group is the generic fibre of the Satake group (Zhu items T02, T03).
   - `GS4:integral-dual-group/witt-rational-satake-equivalence` (theorem, planet "Witt vector geometric Satake"). This
     is Zhu's Theorem 0.3 through the FS degeneration (FS Remark I.2.14), with the tensor constant term, the Borel
     filtration, IC_μ ↦ V_μ and the torus case (Zhu items T04–T07). It uses only the generic fibre.
   - Zhu sources were added to generic-fibre-reductivity (T03), torus-and-rank-one-identification (T04),
     symmetric-constant-term (T05, Proposition 2.36) and generic-root-datum (T06).
   - Zhu's notation item (dual group with B̂ ⊃ T̂, V_μ, V_μ(λ)) is imported from RG2.5 (extended request) and LP3 (new
     request for the characteristic-zero highest-weight classification).
   - To keep at most six planets in GS4:integral-dual-group, integral-recovery-and-adjoint-reduction no longer carries
     a planet.
   - Zhu's own proof (monoidal H* by equivariant bimodules, Gelfand constraint, Lusztig–Yun signs: §§2.3–2.4) stays
     with the Part II design (DESIGN-GeometricSatakeAndFusionPartII, issue #3354), whose roadmap does not exist yet.
     A new `restructure` entry asks that design not to feed its symmetry into GS4 as a prerequisite. It should state its
     rational equivalence for its own monoidal structure on H*, or prove that the two structures agree. Neither source
     proves this in mixed characteristic; Zhu states, without proof, that they agree in equal characteristic (§2.3.1).
   - Zhu's general setting (any algebraically closed k, any finite totally ramified F) is covered for k an algebraic
     closure of F_p: every such F then comes from a finite extension of Q_p, and every reductive group over O is split.
     A larger algebraically closed k is the new gap "Zhu's equivalence outside the FS comparison", which is in the
     coverage `remaining` lists of GS4, GS4:integral-dual-group and GS4:rational-reductivity.
3. **A new error in FS (source issue E8).** Lemma VI.11.2 (p237) is false at ℓ = 2. The normalizer N(T) = T ⋊ Z/2 of
   the diagonal torus in SL₂ over F₂ contains T, and its irreducible representations (the trivial one, and the induced
   ones with weights ±n) have distinct highest weights 0, 1, 2, …. Yet N(T) ≠ SL₂. Its non-reduced Frobenius preimages are
   further counterexamples. The proof breaks where it applies Deligne–Milne 2.22, which assumes characteristic zero. The
   lemma is true for ℓ odd.
   - The special-fibre rank-one claim moved to a new node, `GS4:integral-dual-group/rank-one-integral-identification`.
     `torus-and-rank-one-identification` keeps the torus, the generic fibre and the component grading. So the generic
     root datum and the rational Witt equivalence no longer depend on the ℓ = 2 step, and integral recovery depends on
     the new node.
   - At ℓ = 2 the new node excludes a special-fibre image H whose reduced subgroup is N(T) by counting invariants. If H
     lay in the a-th Frobenius preimage of N(T), the tilting summand T(6·2^a − 2) of V^{⊗n}, for n = 6·2^a − 2, would
     have an invariant that SL₂ lacks, by Donkin's tensor product formula. But over F₂, Hom(1, B₁^{⋆n}) is the top
     Borel–Moore homology of the base-point fibre of the n-step convolution map, which has the characteristic-zero
     dimension.
   - A first version of this round excluded only N(T) itself, through locality of End(B₁⋆B₁); the pre-submission
     review found that the Frobenius preimages escape it, and the invariant count replaced it.
   - The tilting facts are requested from LP3. The Frobenius-image reduction and the subgroups of SL₂ are requested from
     the Tau Ceti ReductiveGroups layers 3 and 7, which supply group theory the first round used without a supplier.
     The geometric count is the gap "Rank-one special-fibre image at ℓ = 2".
   - The search for an existing correction covered the arXiv history (v4 is the latest), the atlas errata and the web.
     The published Astérisque 466 (2026) text was not read.
4. **Reused Zhu errata.** E9, E10 and E11 are PAPER-ZHU-17/E35, /E2 and /E51 (k algebraically closed in Theorem 0.3;
   dominance by coroots; the filtration in the proof of Corollary 2.10), with `known` naming the extraction entries.
5. **Own words.** The correction fields of E2–E5 and E7, which paraphrased FS sentences closely, were rewritten. The
   packet has no `excerpt` field.
6. **Pre-submission review.** Two read-only review agents checked this round: an adversarial mathematical check of
   the new and changed statements against FS, Zhu and Deligne–Milne, and a consistency and protocol check. Every finding
   was verified and applied. The applied findings: the ℓ = 2 argument above; the new gap "Zhu's equivalence outside the
   FS comparison", which replaces a remaining entry that was not a gap; own-words rewrites of the E2–E5 and E7 fields;
   consumer lists of the requests and of the carriers gap; one owner for the convex-hull bound (RG2.5); and sharper
   statements of Zhu's coverage.
7. **Lean.** The review-added theorem `collisionFunctor_comp_assoc` did not elaborate, because it used the unqualified
   `isoWhiskerRight`/`isoWhiskerLeft`; it now uses `Functor.isoWhiskerRight`/`Functor.isoWhiskerLeft`. A section
   `WittRationalSatake` adds `wittRationalTannakianCategory` and `wittRationalSatakeEquivalence` over an algebraically
   closed field of characteristic zero, with their omitted conditions named. `rankOneIntegralIdentification` prototypes
   the new rank-one node. `Mathlib.Algebra.Category.FGModuleCat.Basic` and `Mathlib.FieldTheory.IsAlgClosed.Basic` are
   imported, and the header's list of parameter categories names SatW and Comod.

## Red-team findings handed to this job

- **RT-AREA-geomlanglands/1.** The fusion nodes import the closure and dualizability nodes of GS2:Satake-closure; the
  restructure proposal reverses the atlas edge GS3:fusion → GS2:Satake-closure (unchanged from round 1, confirmed by
  the review).
- **RT-AREA-geomlanglands/16.** Prasad–Yu is requested from RG2.3 with its residue-characteristic-two condition, next to
  the Bruhat–Tits material, and the G_ad reduction at ℓ = 2 is in integral-recovery-and-adjoint-reduction. This round
  also repairs the ℓ = 2 rank-one input (E8).
- **RT-AREA-geomlanglands/17.** Relative reconstruction imports the four MC.6 relative nodes, the rational Witt
  category imports MC.6's neutral reconstruction node, and the DM criteria come from MC.6's recognition nodes. No
  Tannakian reconstruction is planned here.
- **RT-AREA-geomlanglands/19.** GS4:integral-dual-group owns the local perfect-complex extension, with all-prime
  requests to LP3 and LP4; HS1 imports it. Its image statement is now containment only, in packet and reader.

## Lean

The shared `lean-check` build (Mathlib 082e2d3) has no compiled Tau Ceti Tannaka or affine-group modules, so the
file cannot be elaborated there directly; the review round stopped at that import. This round elaborated it as
follows: the pinned Tau Ceti sources (f790474) of its three Tau Ceti imports and their import closure (127 modules)
were concatenated ahead of the suggested file in one scratch file, with all Mathlib imports at the top, and that file
was run through `lean-check` (about 80 seconds, with more than 100 GB of memory free).

- The suggested file's own part elaborates with no errors. Its only warnings are the 89 "declaration uses `sorry`"
  warnings.
- Ten error messages occurred inside the inlined Tau Ceti text: notation ambiguities, instance failures, two rewrites and one
  heartbeat timeout. These are artifacts of merging 127 modules under one import set; upstream compiles each module
  separately. They are not in the suggested file.

This is a check of the signatures, not of the omitted geometric conditions. The scratch file and logs were not kept.

## What remains

The stages stay `planned` with these named refinements (each a packet gap):
- **Formal geometric and enhanced carriers in the suggested signatures.** Pinned libraries lack Div¹ local Hecke diamonds, flat-perverse ULA Satake categories, continuous Weil local systems, affine root-pinned integral dual identification and the stable enhanced D■/Perf(BG) carriers. The suggested file uses the imported carriers as category/type parameters, with every missing geometric or enhanced hypothesis explicitly omitted and named in comments. It gives no replacement Prop certificate. Actual formal carrier and condition signatures remain a refinement for each node; the numerical locus/parity/trace conventions can already be expressed.
- **Drinfeld and Frobenius convention adapter.** VS1 has ULA nodes but no finer IV7.3 node matching the full locally constant perfect Drinfeld statement. Request that exact statement and the action of the Tate root line under its equivalence. Check the contravariant stalk-action convention against the positive-power parameter formula in IX7.1 before a formal normalized Levi comparison; do not silently equate the two actions.
- **Bounded adjunction coefficient and coequalizer verification.** The source VI10.1 proof uses standard/costandard objects and a uniform coefficient-independent ℓ-torsion bound in VI7.5; the early Satake node supplies their carrier but does not isolate this bound or the full ℓ-adic adapter. The outlined proof here must be refined to establish the bound, coefficient inverse-limit compatibility and preservation (not just reflection) of F-split coequalizers required by the MC executable adapter.
- **RG2.3 needs the general Prasad–Yu scope addition.** Current RG2.3 scope is parahoric/congruence models and does not yet explicitly own the general affine finite-type closed-immersion theorem. The request records its exact no-normal-SO-odd hypothesis and proposes this single owner. The GS application retains its G_ad reduction for ℓ=2.
- **General relative Perf(BG) suppliers at all primes.** LP3 existing Donkin nodes require a prime-to-ℓ solvable group; LP4 existing parameter-stack generation/colimit nodes require the dual fundamental-group exclusion. Neither supplies the general FS IX2 p321 relative classifying-stack base-change and free stable completion used here. Requested LP3/LP4 additions must be proved with their all-ℓ≠p scope and Q-equivariant coefficient hypotheses.
- **Enhanced convolution and coefficient duality adapter.** D■ convolution is an enhanced monoidal structure using pullback/tensor/π♮, and its relation to ordinary perverse convolution is A↦D(A)^∨ with specified relative Verdier duality. S6/VS3 need the exact general coefficient adapter. Symmetry is carried by the Satake image, not asserted on the whole enhanced convolution category.
- **Classical comparison on unramified nonsplit groups.** Gross supplies the split transform normalization and Zhu the split Witt IC calculation. The source-to-node proof for the unramified nonsplit Frobenius/relative Weyl version is not established from those excerpts alone. SR4 supplies the classical nonsplit transform; refine its geometric trace-descent comparison with the pinned Weil action and relative weights, without using this comparison as an input to either theorem.
- **Finite-model Frobenius trace handoff.** The classical bridge requires a Frobenius-equivariant finite-type special-fibre model and the existing ordinary constructible trace theorem, not only geometric ULA equivalence. SF.2 integrates these suppliers but no exact trace/model transport node is isolated in its current packet; the request records the needed contract and the missing source-level adapter.
- **Weil-restriction local tensor comparison.** IX6.3 gives the precise chosen-embedding inflation/induction and local Grassmannian map. A detailed compatibility of that procedure with the field-specific half-root choices and multi-leg factorization remains to be refined. Finite-index induction is not itself a strong monoidal functor; the comparison must retain the conjugate-leg geometric diagram.
- **Integral-point supplier refinement.** RG2.0 supplies local/integral point topology and RG2.4 supplies Iwasawa/Cartan decompositions, but their present stage text does not explicitly give lattice preservation, hyperspecial maximal boundedness and torus/rank-one generation over the completed maximal unramified coefficient DVR used in VI.11.1 p238. The existing requests identify the stronger exact contract; these remain scope additions or imported upstream consequences to expose, not an already matching node.
- **Rank-one special-fibre image at ℓ = 2.** FS Lemma VI.11.2 does not exclude, at ℓ = 2, a special-fibre image whose reduced subgroup is the normalizer of the diagonal torus (source issue E8). The replacement argument counts invariants in tensor powers. Its group-theoretic inputs are requested from LP3 (tilting modules of SL₂ in characteristic two) and from the Tau Ceti ReductiveGroups layers 3 and 7. Its geometric input is isolated by no supplier node: with F₂ coefficients, Hom(1, B₁^{⋆n}) is the top Borel–Moore homology of the fibre over the base point of the semismall n-step convolution map, computed on the Witt special fibre and transported through the one-leg comparison. The rational Witt equivalence uses only the generic fibre and is not affected.
- **Zhu's equivalence outside the FS comparison.** Zhu states his equivalence for any algebraically closed k and any finite totally ramified F over W(k)[1/p], and for his own monoidal structure on H*. The comparison planned here covers k an algebraic closure of F_p, with the monoidal structure transported from fusion. A larger algebraically closed k needs either the invariance of these equivariant perverse categories under extension of algebraically closed base field, which no supplier node states, or Zhu's own Gelfand proof, routed to the Part II design (DESIGN-GeometricSatakeAndFusionPartII). That design must also state its rational equivalence for its own monoidal structure, or prove that the two monoidal structures on H* agree.

Requests that other roadmaps must answer are listed in the packet (`requests`) and in the reader's supplier section.
The next worker or reviewer resumes from the four committed files. Scratch downloads, build scripts and Lean logs were
temporary.

## Sources read in this round

FS author copy (SHA-256 9ab9efbd…, = arXiv v4): Remark I.2.14 p17, the VI introduction pp187–190, VI.7 p219, VI.11
pp235–239. Zhu, Annals publisher PDF (SHA-256 5d50b415…): §0.2, §0.5, §2 opening, §2.1, the statements of §§2.3–2.4,
and §2.5. Deligne–Milne revised notes (SHA-256 48f8af52…): Corollary 2.22 and its characteristic-zero hypothesis. The
extraction PAPER-ZHU-17 (routes 8 and 18, errata E2, E35, E51) and PAPER-FARGUES-SCHOLZE-21 (errata near §VI.11) were
consulted. The published FS (Astérisque 466) and published Prasad–Yu were not read.
