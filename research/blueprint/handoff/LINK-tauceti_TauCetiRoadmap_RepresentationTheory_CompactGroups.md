# CompactGroups link job — partial checkpoint

## Identity, ownership and revisions

Job: `LINK-tauceti_TauCetiRoadmap_RepresentationTheory_CompactGroups`; issue **#59**.
Worker: **ChatGPT Pro — cgp-aae89b9faddc**. Date: 2026-09-16.
Claim comment: 5697553603; accepted workflow confirmation: 5697556004.
These were re-fetched during the work; another comment by the shared account is not assumed to be this worker's claim.

Mathematical input revision: `088ac3dcfb573a1e875fcea971ce54526bbe74d3`.
Pre-submission comparison revision: `be09b0fb85faab7fc6a8646e9f524140cfa0df2e`.
The comparison did not change the inspected source READMEs, atlas/extracts, baseline, link protocol or checker. It did add other link packets and Habiro-related roadmap definitions. Those new roadmaps require continuation screening; no completeness claim is based on their filenames.

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
Only the authorised link JSON and this handoff are submission files. Scratch scripts, working inventories and source excerpts are not repository changes. No git command, Lean implementation, default-branch write, merge, approval, issue closure or done-state operation was performed by this job.

The earlier #15 AdicSpaces submission was merged and released by the orchestrator. Its continuation belongs to local worker claude2/2; this job does not edit or reclaim it.

## Result and coverage boundary

The packet contains **six outward links, zero established inward links, one overlap, and eleven examination records**. This is `status: partial`, not a finished catalogue-wide inventory. The main consumers are LieGroups Layer 6, AdelicAlgebraicGroups AA.0, AutomorphicFormsOnReductiveGroups AF.1/AF.1a and ModularityAndLanglandsExtensions ML.3.

All seven target stage descriptions and its complete README were read. OrthogonalL2Bases was read in full. LieGroups, CharacterTheory and the selected campaign partners were read at the exact scopes recorded in `examined`. A partial keyword scan also examined the optional unitarian routes in LieHighestWeight and ClassicalGroups. Existing SpinRepresentations link-packet examination notes were used only for duplicate checking, not counted as this worker reading that source roadmap.

The finite-character overlap recommends **keep with a precise comparison**, not a merger. The real-polynomial B2/Hilbert-basis overlap is already in `research/blueprint/links/tauceti_Completed_OrthogonalL2Bases.json` and is deliberately not duplicated. At the pre-submission revision no LieGroups or CharacterTheory link packet was present at their expected paths. The target atlas extract had no recorded touching stage edges. Inferred edges specify documented reusable proof routes; they do not claim to be minimal prerequisites of every conceivable alternative proof.

The broad screen is unfinished: not all 212 roadmaps, all 60 upstream roadmaps or all same-area records have been examined. A result of `none` is scoped to the recorded reading, not a theorem that no relation exists. Repository code-search results are discovery aids, not certificates that every new file is indexed.

## Target input/output inventory

All general stages concern compact Hausdorff topological groups, normalized Haar probability, complex finite-dimensional continuous representations and the indicated Hilbert spaces. Smoothness, connectedness and Lie-group hypotheses are not standing assumptions on the general core.

| Layer | Inputs | Outputs and boundary |
|---|---|---|
| 0 | Haar measure, finite positive total mass, complete normed target, continuous orbit maps | Haar probability and left/right/inversion invariance; normed-space averaging. Not general Frechet-valued integration. |
| 1 | 0; finite-dimensional complex inner product and continuous action | Unitarity predicate, averaged positive Gram operator and equivalent invariant Hilbert structure. |
| 2 | 1; invariant subspaces, dimension induction, existing algebraic Schur | Orthogonal irreducible internal decomposition and semisimple-module comparison. Not infinite-dimensional admissibility. |
| 3 | 0–1; tensor/dual representations, continuous inner product | Continuous/L2 matrix coefficients, representative star algebra and translation rules. Point separation is not an input. |
| 4 | 2–3; averaging an actual linear intertwiner | Schur orthogonality and the normalized orthonormal system; first-slot conjugations require repair below. |
| 5 | 4; compact selfadjoint convolution, approximate identities, spectral truncation, continuous-to-L2 density | Uniform and L2 density, specified-element Hilbert basis and regular isotypic decomposition. Spectral decomposition is not generally finite. |
| 6 | 3–4 for trace algebra, 5 for completeness | Continuous trace characters, Haar orthogonality and the closed central L2 subspace with its character basis. Uniform central approximation requires an additional bridge. |

The SU(2) engine is expressly parallel to the general core but has **no independent registered stage** in this extract. It owns torus conjugacy, symmetric-power classification/exhaustion, the Weyl-weighted character formula and worked integration. No fictitious engine ID is introduced here. Do not charge its Lie prerequisites to the general Peter–Weyl layer.

## Checked baseline sources

These are source readings at the pins, not compilation or an exhaustive library audit. Search was made in both Mathlib and Tau Ceti. Names below are existing declarations only where their pinned source was actually read; repair names later in this note are proposed mathematical contracts.

1. `Mathlib/RepresentationTheory/Continuous/Basic.lean`, introductory documentation and the definition of `ContRepresentation` (file lines 1–125 read). It wraps `G →* V →L[R] V`. Its documentation explicitly says continuity of the group action is **not** assumed. The statements therefore need a separate continuity-in-G condition. Merely having continuous linear operators for individual g does not justify matrix-coefficient continuity or integration.
2. `Mathlib/Analysis/InnerProductSpace/Defs.lean`, introductory convention and inner-product definitions read. The convention is conjugate-linear in the first argument, linear in the second. This governs every correction below.
3. `Mathlib/Analysis/InnerProductSpace/l2Space.lean`, introductory documentation and the HilbertBasis constructor block, lines 485–565 read. `HilbertBasis.mk` takes an orthonormal family and density of its span; `HilbertBasis.mkOfOrthogonalEqBot` takes an orthonormal family and **equality** of the span's orthogonal complement with bottom. The `coe_mk` and `coe_mkOfOrthogonalEqBot` equations preserve the specified vectors. No countability requirement on the basis index is introduced by these constructors. They assemble a supplied dense family; they do not prove Peter–Weyl density.
4. `TauCeti/Analysis/SpecialFunctions/Trigonometric/Chebyshev/HilbertBasis.lean`, lines 1–165 read at the Tau Ceti pin. Its `chebyshevBasis` is a real, natural-number-indexed Hilbert basis for the specified interval/Chebyshev measure. It is not a generic complex L2(G) Peter–Weyl constructor. Chebyshev T's arcsine weighting is also not the SU(2) Weyl weighting.

Pinned source URLs are obtained by placing each path after the respective repository's `/blob/<pin>/`. Relevant repository READMEs and full stage extracts are fixed by the input revision above. Books and papers named in those READMEs (Bump, Knapp, Hewitt–Ross, Arthur, Newton–Thorne, etc.) were **not** independently read here. This is a stage-link analysis with independently derived mathematical checks, not a completed proof-interior source audit of those books.

## Mathematical findings and repairs

### CG-R1: linearity and the two Schur formulas

Target Layer 4 proposes averaging the rank-one map

`v -> <v,e_l> e_j`.

With conjugate-linearity in the first slot this is conjugate-linear, not complex-linear. Replace it by `v -> <e_l,v> e_j`, then check the intertwiner orientation and trace computation.

Write `c(v,w)(g)=<pi(g)v,w>`, and let pi be a nonzero irreducible unitary representation of dimension d. The two identities must be distinguished:

`integral c(v1,w1) conjugate(c(v2,w2)) = d^(-1) <v1,v2> conjugate(<w1,w2>)`,

but

`<c(v1,w1),c(v2,w2)>_L2 = d^(-1) <v2,v1> <w1,w2>`.

The second is the conjugate of the first. The README places its coordinate-free formula after a displayed L2-inner-product identity but gives the first formula's conjugations. If the intended theorem instead denotes the raw-product integral, say so explicitly. The basis-level real Kronecker-delta test alone cannot detect this error.

A one-point group on V=C detects the L2 version: v1=1, v2=i, w1=w2=1 gives coefficient functions 1 and -i, hence L2 inner product -i, whereas the printed coordinate-free right side is i. This is an elementary mathematical counterexample, not a claimed Lean test.

### CG-R2: trace and coefficient indexing

For the chosen `pi_ij(g)=<pi(g)e_j,e_i>`, the sum of the diagonal coefficients is **conjugate(trace(pi(g)))**, not trace. Thus Layer 6's identification of its trace character with `sum_i pi_ii` needs conjugation. Either retain the coefficient convention and conjugate the sum, or change the coefficient convention globally and rederive all translation, tensor, Schur and projector identities.

The circle test makes this visible: for pi_n(theta)=exp(i n theta), the chosen coefficient is exp(-i n theta), while the trace character is exp(i n theta). The basis-index comparison uses n -> -n. Do not mask this by only testing SU(2), whose irreducible characters are real-valued. Also prove the dual/conjugate-space identifications before using the informal swapped-vector involution formula.

### CG-R3: separability and spectral truncation

The standing convention calls L2(G) separable while allowing arbitrary compact Hausdorff G. This is false. Let G be the product of copies of the two-element group indexed by an uncountable set I. The coordinate sign characters are an uncountable orthonormal family in Haar L2(G): each has norm one, and the integral of the product of two distinct coordinates vanishes by translating in just one coordinate. They have pairwise distance sqrt(2), so this Hilbert space is not separable. Keep arbitrary basis indices, or state a sufficient countability hypothesis only in a separate specialization.

Layer 5 also says spectral decomposition writes **each convolution as a finite sum** of matrix coefficients. Compactness gives finite-dimensional nonzero eigenspaces and finite-rank approximations, not finite rank of the whole operator. On the circle with Haar probability let

`k(theta)=sum_(n in Z) 2^(-abs(n)) exp(i n theta)` and `f=k`.

The series converges absolutely uniformly and is symmetric; `k*f` has coefficient `4^(-abs(n))` at every n. It is not a finite Fourier polynomial.

A repair route, with its intermediate obligations exposed, is as follows. Use the convention

`T_k f(x)=integral k(x y^(-1)) f(y) dy`.

This operator commutes with **right** translations; arbitrary k does not make it commute with both regular actions. Prove `T_k : L2 -> C(G)` with bound `||T_k u||_infinity <= ||k||_2 ||u||_2`. Hence each nonzero eigenfunction is continuous. Its finite-dimensional translation-invariant eigenspace supplies representative functions via evaluation at the identity and the dual/inner-product dictionary.

Choose a nonnegative symmetric approximate-identity kernel k of integral one so T_k squared f is uniformly close to f. For a finite spectral projection P with `||T_k(1-P)||_(2->2) <= delta`, prove

`||T_k^2 f - T_k^2 P f||_infinity <= ||k||_2 delta ||f||_2`.

The right term is small and T_k squared P f lies in a finite sum of nonzero eigenspaces, hence in the representative algebra. This supplies uniform density without assuming point separation. Approximate identities are a **net** in general; a countable neighbourhood basis is not silently available. Construct and source-check each analytic lemma before considering this repair implemented.

### CG-R4: continuity and Layer 5/6 ordering

Pinned `ContRepresentation` does not carry continuity in g. Include continuous orbit maps/joint continuity where required; in finite dimension compare this with continuity into the operator norm topology. The implication must be proved, not obtained from the carrier name.

Layer 5's isotypic projector refers to characters 'from Layer 6', while Layer 6's completeness uses Layer 5. Split the **early trace character and Schur projector identities** from the **late completeness assertion**. Early trace algebra may be constructed after Layers 3–4; only the latter needs Peter–Weyl. Do not add a cyclic pair of whole-stage dependency edges.

### CG-R5: the SU(2) interface

Request stable stages for the separate engine, preserving the existing core IDs. Its torus/symmetric-power classification can then receive genuine Lie-theoretic inputs or a direct matrix proof, and export the symmetric-power character comparison to Sato–Tate. LieGroups Layer 7's assertion that complexification 'feeds' Peter–Weyl cannot be read as a prerequisite for general compact Hausdorff Peter–Weyl: arbitrary compact groups need not be Lie groups.

The character sine quotient must be extended at its removable singularities, with chi_n(0)=n+1 and chi_n(pi)=(-1)^n(n+1). Its orthogonality uses the **Weyl density**, not unweighted Haar measure on the torus. On the chamber it is `(2/pi) sin(theta)^2 dtheta`; under x=cos(theta) it is `(2/pi) sqrt(1-x^2) dx`, the Chebyshev U weight. Do not apply a Chebyshev T/arcsine basis without changing the measure. A complexification/scalar-extension comparison is still needed for a real polynomial result.

### CG-R6/CG-R7: consumer bridges

For AF.1, complete reducibility applies separately to finite-dimensional compact orbit spans. Algebraic isotypic decomposition does not by itself prove finite multiplicities or admissibility. For AF.1a, continuous orbit maps into a complete Frechet space need an integration construction and seminorm estimates. The normed Bochner theorem in Layer 0 does not already supply that theorem. Peter–Weyl supplies the finite-type kernels, not the full Casselman–Wallach equivalence.

For ML.3, let `C u(x)=integral u(h x h^(-1)) dh` on continuous functions. Prove continuity and the sup-norm contraction. With the coefficient convention above, averaging a coefficient of an irreducible pi gives

`C c(v,w)(x) = <v,w> conjugate(chi_pi(x)) / d`.

Thus C sends finite representative sums to finite character sums, and applying C to uniform approximations proves uniform density in continuous class functions. The trivial character has Haar mean one and nontrivial irreducible characters have mean zero. A three-term epsilon estimate then turns limiting character averages into convergence against every continuous class function, or every continuous function on the compact conjugacy quotient. This is the needed character-test Weyl criterion; L2 completeness cannot replace it for empirical measures. Construct the compact Sato–Tate groups, their actual test characters, Frobenius classes and analytic limiting averages separately. A specialized SU(2) polynomial route may avoid general Peter–Weyl, but must still prove its approximation and measure identifications.

## Continuation and validation

Continue this same packet. Finish the catalogue screen, especially the remaining algebra/representation overviews, SmoothRepresentationsOfLocalGroups, MetaplecticAutomorphicForms, compact K-type uses and neighboring topology/analysis sources. Read all candidate stages fully, and check new Habiro/analytic-stack definitions rather than assuming 'analytic' means the same theory. Resolve source-gated ambiguities as requests, not guessed arrows. Do not manufacture a stage for the unindexed engine.

At file creation, own-scratch JSON/schema/unique-pair checks are the local validation available. The full repository command is:

`python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_CompactGroups.json`

The repository's submission workflow runs this against its full atlas and other packets. **No local execution of the full repository validator is claimed here.** The PR/issue validation comment records the actual workflow output once inspected. A successful structural check would verify endpoint/quote/cycle conditions, not mathematical completeness or approval. No independent review has been performed by this author.

This checkpoint requires coordinated continuation and independent review. It is not a request to mark the job done. The session will not take another job while handing off this unfinished packet, and will not release a submitted claim unilaterally.
