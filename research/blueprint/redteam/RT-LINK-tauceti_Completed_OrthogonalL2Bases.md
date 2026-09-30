# RT-LINK-tauceti_Completed_OrthogonalL2Bases

Issue #4359. Red team: Codex, session `codex-5ebb6f`, 30 September 2026. Input checkout: `cc9d0f2`.

**Result: no new finding established.** The accepted map's zero new prerequisite edges and one narrow assembly rescope survive this attack. The checks below support that conclusion within a stated source scope; they do not certify every implementation or every unrelated roadmap proof.

The original link author is ChatGPT Pro `cgp-74e70e1a15ce`; its independent reviewer is Codex `codex-7e92bd`. This session did neither job. The bot confirmed claim comment5909614209 before work began. Only the two authorized red-team deliverables changed.

## Attack on the retained overlap

Both exact evidence quotations match their current raw source documents. I read the complete focal README, verified that all eleven extracted descriptions occur in it, and read the CompactGroups Layer5 assembly/density contract, Layer6 class-function application, and boundary paragraphs. The reviewed library audit was inspected as a source inventory, rather than accepted as a substitute for declaration checks.

The main possible failure was an unsupported prerequisite from B2 to Peter–Weyl. The packet expressly rejects that edge. B2's implementation accepts `Nat`-indexed real functions on an arbitrary measurable domain, lifting their values into an `RCLike` scalar. Peter–Weyl needs complex matrix coefficients indexed by an irreducible skeleton and two finite matrix indices. Neither the real scalar lift nor compactness supplies a conversion between those contracts.

Mathlib's existing constructor accepts an arbitrary index type and an orthonormal family in a complete inner-product space whose span has trivial orthogonal complement. Its coercion lemma returns exactly the input family. CompactGroups already names that constructor. The map's proposed correction therefore identifies the true generic supplier while leaving weighted normalization, Schur orthogonality, the skeleton and density with their respective owners. It does not require B2 generalization, roadmap merger or a new completeness theorem.

The weight distinction also withstands the attack. The weighted-measure constructor requires an a.e. nonnegative measurable weight and supplied membership, orthogonality and completeness. The reference-measure constructor additionally requires a.e. positivity, because it transports along an equivalence. On a two-point counting space with one zero weight, every square-root-weight image vanishes at that point; it cannot fill the reference L² space. This does not prevent the weighted space itself from having a basis. The accepted proposal records this distinction correctly.

CompactGroups still contains the overstrong sentence that spectral decomposition makes every convolution a finite sum. The link map and its handoff already identify and repair that sentence. The pinned implementation confirms the distinction: finite algebraic eigenspace sums convolve into the representative submodule; arbitrary inputs under a symmetric kernel convolve into its uniform closure. The density proof then uses approximate identities. This existing acknowledged prose action is not a new missing finding or a missing analytic implementation.

## Attack on the empty edge list

The fresh screen covered 221 raw README/proposed-definition files in the selected roots and all 211 generated roadmap extracts. It also covered 143 blueprint packets, 51 integrated decompositions and nine proposed-roadmap JSON definitions. Narrow queries concerned Hermite functions/bases, Hilbert bases, weight isometries, product bases, moment determinacy and Wiener chaos; broader discovery queries included Fourier, Schwartz, orthonormality, moments, cosine, tensor products and oscillator terminology. Search results were leads for source reads, not proofs of mathematical independence.

| Candidate | Checked decision |
|---|---|
| StandardDistributions Layer1 | Its moment-uniqueness edge from B1 already exists in the sibling map. The explicit ownership boundary supports it; no duplicate edge should be emitted. |
| StandardDistributions Layer5 | Its Gaussian-density proof explicitly imports `pi_gaussianReal_eq_withDensity`. That measure identity has no orthogonal-family or completeness hypothesis. Neither affine covariance work nor its finite covariance eigenbasis requires the multidimensional Hermite basis. |
| CompactGroups Layer6 | Character completeness follows from the Peter–Weyl blocks, rather than a fresh weighted real-function bridge. |
| Metaplectic MP.0–MP.3 and AL.0 | The source contracts ask for Schrödinger/Heisenberg realizations, Weil/Fourier formulas and general Schwartz–Bruhat/Fourier theory. They do not prescribe the Hermite Hilbert basis as a supplier. A particular eigenfamily does not supply general Fourier inversion or adelic Poisson summation. |
| PM.0/PM.1 | The limit-law contract allows moment or characteristic-function methods. Equality of measures from moments is not itself a weak-convergence theorem; tightness and limit passage would still need a specified proof route. |
| PDE and OneParameterSemigroups | The checked Dirichlet-spectrum route uses a bounded-domain compact inverse; the Bochner interface concerns positive-definite functions and Fourier representation. Neither specifies Hermite completeness or a total bounded ladder operator. |
| PMIA L0/L2 and PadicFamilies L2a | These concern nonarchimedean Banach/Mahler bases and Fredholm gluing. The real/complex inner-product-space APIs do not supply those contracts. |
| Exchangeability Layer3 | Its L² averaging route uses covariance estimates and a canonical conditional directing measure, without an orthogonal-polynomial basis or moment reconstruction of a second measure. |
| Arithmetic Hermite matches | Hermite–Minkowski and integer Hermite normal forms refer to number-field finiteness and lattice algorithms, respectively. They are not Hermite functions. |

The packet/decomposition screen found no new precise consumer. Its one narrow packet match was a disclaimer in DirichletPadicLFunctions stating that exact scalar checks do not establish generic moment determinacy. Broad tensor/Fourier/Jacobi matches were not converted into unsupported prerequisites. The current StandardDistributions boundary explicitly preserves the Hermite/determinacy owner and distinguishes its reused Gaussian `Basic`, `Pi` and `PolynomialMemLp` material.

A complete sibling-link scan found exactly the existing B1-to-StandardDistributions edge touching the focal roadmap. The focal generated extract contains no touching stage edges. The accepted map's empty new-edge list is therefore consistent with the checked explicit contracts. This is not a claim that alternative proofs can never use the focal APIs, nor a claim that all unrelated source proofs were read.

## Pinned primary evidence

All statements listed here were read with their surrounding assumptions on 30 September 2026. Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`.

| Primary source | Checked interfaces |
|---|---|
| [Mathlib l2Space](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/InnerProductSpace/l2Space.lean#L533) | `HilbertBasis.mkOfOrthogonalEqBot`, `coe_mkOfOrthogonalEqBot`; arbitrary index, `RCLike`, complete inner-product space. |
| [WeightedOrthogonalBasis](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/InnerProductSpace/WeightedOrthogonalBasis.lean#L169) | Both basis constructors and element/coercion statements; arbitrary measurable domain, real `Nat` family, nonnegative versus positive weight. |
| [EigenspaceRepresentation](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Compact/EigenspaceRepresentation.lean#L225) | Finite-span representative membership and arbitrary-input closure membership, with the symmetric-kernel hypothesis and compact topological-group/Borel assumptions. |
| [RepresentativeDensity](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Compact/RepresentativeDensity.lean#L117) | Uniform density statements and proof; Borel structure installed internally, point separation only afterwards. |
| [Moments/Determinacy](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Probability/Moments/Determinacy.lean#L145) | Equality of two finite real measures from every polynomial moment and exponential integrability on both sides; no density hypothesis. |
| [VanishingMoments](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Probability/Moments/VanishingMoments.lean#L229) | Function-level vanishing with one positive exponentially weighted integrability rate; arbitrary reference measure. |
| [Gaussian/Pi](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Probability/Distributions/Gaussian/Pi.lean#L74) | Finite-product Gaussian measure/density identity, rather than Hilbert-basis completeness. |
| [L2/Product](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/InnerProductSpace/L2/Product.lean#L327) and [L2/Pi](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/InnerProductSpace/L2/Pi.lean#L345) | Completeness, product/pi basis constructors and pointwise element statements; sigma-finite factors and finite coordinate type for pi, without finite factor-basis indices. |
| [Hermite Function/Operator](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/SpecialFunctions/Hermite/Function/Operator.lean#L44) | Real Schwartz-space annihilation/creation operators and their `sqrt(n)`/`sqrt(n+1)` actions. Continuity is in Schwartz topology, not a bounded extension on all L². |

The moment theorem requires the zeroth moment too. It cannot be applied to an arbitrary heavy-tailed law from existence of polynomial moments alone. The weighted Gaussian normalization also retains the source's dilation: multiplication by the square root of the standard Gaussian density gives `2^(-1/4) psi_n(x/sqrt(2))`, not the undilated function basis. Neither point yields an omitted edge in the accepted map.

These are source-statement and selected-proof checks, not a fresh compilation, transitive proof/axiom audit, or independent reading of the cited books. No missing implementation is inferred from a name search or from a historical README status paragraph.

## Validation

- The accepted target's full `scripts/check_links.py` check passed: zero errors and zero warnings.
- Both overlap quotations were checked as exact raw-source substrings; all eleven focal descriptions match the README.
- `scripts/check_redteam.py` on the result passed, with a nonempty `checked` inventory and empty findings.
- Intake validation on the two permitted deliverables and staged whitespace checks passed.

No Lean file was required or compiled. No Lake project, library build or language server was started. Existing acknowledged roadmap prose actions remain with the maintainer; this job changes no link packet, roadmap, audit or issue state by hand.
