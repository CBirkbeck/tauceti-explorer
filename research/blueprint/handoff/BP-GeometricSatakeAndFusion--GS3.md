# BP-GeometricSatakeAndFusion--GS3 handoff

Issue #742; worker Codex, session codex-68Sdy9; 7 October 2026. The bot
confirmed the claim in issue comment 6030627907. Branch:
`codex-68Sdy9-geometric-satake-gs3`.

This is a complete target-level planning pass under PROTOCOL §0, continuing the
seven-node checkpoint. All six scoped stages are **planned**, none **closed**.
The packet contains 29 nodes: 3 definitions, 6 constructions and 20 theorems,
46 API items, 27 unit-test specifications, 16 planets, 23 baseline declarations,
16 supplier requests and 9 explicit gaps. All implementation statuses remain
unchecked. Its mathematical reader and signature prototype cover the same nodes.
No formalisation is claimed.

The existing seven node IDs are retained. Fusion now has disjoint restriction,
parity, finite-set coherence, Drinfeld realization, constant terms and duality.
The reconstruction chain imports the four precise relative MC.6 nodes rather
than duplicating abstract Tannaka. Generic recognition, rank-one recovery,
integral Prasad–Yu application, geometric pinning, normalized naturality,
Chevalley involution and enhanced Perf export are separated. The classical
trace branch includes both parity and half-Tate normalization.

Confirmed red-team findings /1, /16, /17 and /19 are addressed. The packet
proposes reversing the closure/fusion dependency; requests the general
Prasad–Yu theorem from RG2.3 and retains the characteristic-two adjoint
reduction; imports MC.6's reconstruction and recognition; and assigns the
Satake Perf export here with general LP3/LP4 inputs at all primes ℓ≠p.
The source correction E1 replaces the purported torus with the diagonalizable
component-grading group when its character group has torsion.

## What remains and where to resume

Independent review should check the full source matches, normalization and
supplier contracts before accepting the plan. Its stage-specific remaining
lists name the following refinements; none is hidden as an implementation.

- **Formal geometric and enhanced carriers in the suggested signatures.** Pinned libraries lack Div¹ local Hecke diamonds, flat-perverse ULA Satake categories, continuous Weil local systems, affine root-pinned integral dual identification and the stable enhanced D■/Perf(BG) carriers. The suggested file uses the imported carriers as category/type parameters, with every missing geometric or enhanced hypothesis explicitly omitted and named in comments. It gives no replacement Prop certificate. Actual formal carrier and condition signatures remain a refinement for each node; the numerical locus/parity/trace conventions can already be expressed.
- **Drinfeld and Frobenius convention adapter.** VS1 has ULA nodes but no finer IV7.3 node matching the full locally constant perfect Drinfeld statement. Request that exact statement and the action of the Tate root line under its equivalence. Check the contravariant stalk-action convention against the positive-power parameter formula in IX7.1 before a formal normalized Levi comparison; do not silently equate the two actions.
- **Bounded adjunction coefficient and coequalizer verification.** The source VI10.1 proof uses standard/costandard objects and a uniform coefficient-independent ℓ-torsion bound in VI7.5; the early Satake node supplies their carrier but does not isolate this bound or the full ℓ-adic adapter. The outlined proof here must be refined to establish the bound, coefficient inverse-limit compatibility and preservation (not just reflection) of F-split coequalizers required by the MC executable adapter.
- **RG2.3 needs the general Prasad–Yu scope addition.** Current RG2.3 scope is parahoric/congruence models and does not yet explicitly own the general affine finite-type closed-immersion theorem. The request records its exact no-normal-SO-odd hypothesis and proposes this single owner. The GS application retains its G_ad reduction for ℓ=2.
- **General relative Perf(BG) suppliers at all primes.** LP3 existing Donkin nodes require a prime-to-ℓ solvable group; LP4 existing parameter-stack generation/colimit nodes require the dual fundamental-group exclusion. Neither supplies the general FS IX2 p321 relative classifying-stack base-change and free stable completion used here. Requested LP3/LP4 additions must be proved with their all-ℓ≠p scope and Q-equivariant coefficient hypotheses.
- **Enhanced convolution and coefficient duality adapter.** D■ convolution is an enhanced monoidal structure using pullback/tensor/π♮, and its relation to ordinary perverse convolution is A↦D(A)^∨ with specified relative Verdier duality. S6/VS3 need the exact general coefficient adapter. Symmetry is carried by the Satake image, not asserted on the whole enhanced convolution category.
- **Classical comparison on unramified nonsplit groups.** Gross supplies the split transform normalization and Zhu the split Witt IC calculation. The source-to-node proof for the unramified nonsplit Frobenius/relative Weyl version is not established from those excerpts alone. SR4 supplies the classical nonsplit transform; refine its geometric trace-descent comparison with the pinned Weil action and relative weights, without using this comparison as an input to either theorem.
- **Finite-model Frobenius trace handoff.** The classical bridge requires a Frobenius-equivariant finite-type special-fibre model and the existing ordinary constructible trace theorem, not only geometric ULA equivalence. SF.2 integrates these suppliers but no exact trace/model transport node is isolated in its current packet; the request records the needed contract and the missing source-level adapter.
- **Weil-restriction local tensor comparison.** IX6.3 gives the precise chosen-embedding inflation/induction and local Grassmannian map. A detailed compatibility of that procedure with the field-specific half-root choices and multi-leg factorization remains to be refined. Finite-index induction is not itself a strong monoidal functor; the comparison must retain the conjugate-leg geometric diagram.

The packet's sixteen requests give each supplier, required statement and exact
consumers. In particular the unresolved Drinfeld convention and coefficient
adapter are not consequences of the known-Hopf baseline theorem. Normalized
Levi maps are expressed in the root-line character convention, and must be
translated to the positive-power parameter convention in FS IX.7.1.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/GeometricSatakeAndFusion--GS3.json --index "$TAUCETI_BASELINE/declarations.tsv"`
reports **0 errors and 0 warnings**. All 46 API names and 27 named tests appear
in the suggested file; all 27 tests are examples. Source excerpts and E1's
quotation were compared against the normalized downloaded text. Only the four
issue deliverables are changed.

**The full suggested file did not compile.** The existing shared build has the
pinned Mathlib commit but lacks the compiled object for
`TauCeti.Algebra.AlgebraicGroup.Representation.Tannaka.GroupFunctor`. The
full-file `lean-check` stopped at that import. Other available builds use
different Mathlib pins and were not used. No library build, cache fetch,
Lake project or language server was started.

A scratch projection removing the unavailable Tau Ceti imports and affine
carrier section, while retaining the Mathlib F-split-coequalizer and binary
tensor statements, elaborated with `lean-check` at Mathlib 082e2d3. Its only
warnings were admitted proofs. This checked syntax and the expressible types,
not the omitted geometry, not the affine group section, and not the full file.
Memory availability exceeded 100 GB; all checks ran sequentially and finished
within the wrapper's twenty-minute limit. No compile remains running.

## Sources and baseline read

The packet records public URLs, SHA-256 hashes, editions and exact read sections
for all five sources. Read FS VI.8–VI.12 in full, IV.7, VI.0, VI.6.5–6.8,
VI.7.5/7.7/7.10/7.12–13, IX.2 p321, IX.6.1–6.3 and IX.7.1; Zhu §2.1 and
§2.2 through the IC/classical equations; Gross §2, §3, §4 through (4.4) and §8;
Prasad–Yu's author preprint introduction/Corollary 1.3 and §5.3–5.4; and
Deligne–Milne's revised 2012 notes §2, Propositions 2.20/2.22/2.23 and proofs.
The author-hosted FS file matches the checkpoint hash. The published
Prasad–Yu text was unavailable (publisher access refused); its published
Corollary 5.2 is cited by FS, while our quotations use author-preprint
Corollary 1.3. No quotation is attributed to an unread edition.

The two upstream documents, ReductiveGroups and
RepresentationTheory/RootSystems, were read in full. AUDIT-21, every touching
blueprint link record, all six target descriptions and the actual statements of
every listed baseline declaration were checked. Zhu's original geometry is
imported from the early owner; the separately routed rational Gelfand proof
belongs to its Part II. These imports do not replan those sources here.

Review and follow-up work can resume entirely from the four committed files
and their public sources. Scratch downloads and compilation logs are temporary
and are not required for the next worker.
