# Handoff: LINK-tauceti_Completed_OrthogonalL2Bases

**Status: partial. This is a checkpoint, not a finished catalogue-wide link survey.**

Worker: **ChatGPT Pro — cgp-74e70e1a15ce**. Issue: [#37](https://github.com/CBirkbeck/tauceti-explorer/issues/37). The accepted claim is [bot comment 5696775287](https://github.com/CBirkbeck/tauceti-explorer/issues/37#issuecomment-5696775287), responding to this session's comment 5696773546. No other job was claimed.

Deliverables are this handoff and `research/blueprint/links/tauceti_Completed_OrthogonalL2Bases.json`. The packet has **zero new links, one rescope proposal, and three examined roadmaps**. Zero links does not mean that no other dependencies exist. A later worker should continue the same packet, preserving the existing findings unless an independent check corrects them.

Implementation status: **unchecked**. No Lean implementation, build, axiom audit, or claim of newly completed formalisation is included.

## Revisions and coverage

The mathematical inputs were read at Explorer commit `49f74b4d2bace99a76ceff4ac2199a3384c83c57`. A pre-submission comparison with `b82b494ac1b384423eacc1276c6716f15e186b6d` showed no changes to the three source READMEs or baseline pins. The latter revision added browser extracts, changed the browser/link protocols, and added other submissions. The changed instructions and validator were re-read. The submission branch starts from that newer revision; the mathematical source provenance remains the original pinned blobs below.

| Input | Blob SHA | Read scope |
| --- | --- | --- |
| `content/tau-ceti/Completed/OrthogonalL2Bases/README.md` | `6d96bb586dbc564970da66578acf0c523dcaf18a` | Complete README, Parts A-D and all subheadings |
| `content/tau-ceti/RepresentationTheory/CompactGroups/README.md` | `6c9dc496f2ef95e0d1ead78914114ed700507afc` | Complete README, Layers 0-6, SU(2) engine case and boundaries |
| `content/tau-ceti/StandardDistributions/README.md` | `754b87b5eb8d0e066a2ab00a94ed40f92768dfe6` | Complete README, Layers 0-6, boundaries, ordering and references |
| `research/blueprint/baseline.json` | `fdb00afdfae8e5728e070f310f5a880707764bc2` | Both pins |
| `data/atlas.json` | `37f2add06983c206067d1104e0f40a839cc3961a` | Metadata and returned prefix only; not a complete local atlas |

The revised browser instructions have blob `e4854be9cb94f4e9fe6f4ac76a5468f56c53d3a0`; revised blueprint protocol `41099c03ea64d701d05b1277a83141ef9d4868db`. The upstream guide and expansion protocol were read initially and were not changed in the comparison.

Both Mathlib and Tau Ceti were searched. Default-branch search results were discovery aids only; each declaration relied on below was opened at its baseline commit. No search failure is used to assert that a declaration is absent.

## Own-stage input/output inventory

This inventory was maintained in scratch during the reading and is preserved here for resumption. Source-heading descriptions were read completely; the separate atlas records have not all been independently cross-checked.

| Stage | Inputs | Outputs and important limits |
| --- | --- | --- |
| Part A | Hermite polynomial and Gaussian infrastructure | Parent of the concrete construction; prefer specific A-stages for links. |
| A1 | Probabilists' Hermite polynomials, Gaussian integral, integration by parts | Polynomial derivative/generating identities and weighted orthogonality, separately in Lebesgue and standard-Gaussian measure conventions. |
| A2 | A1 identities and Gaussian smoothness | Explicit real Hermite functions, Schwartz regularity, square integrability, pointwise ladder relations and oscillator eigen-equation. Not a construction of unbounded L2 operators and their domains. |
| A3 | A2, completeness via B1 | Scalar-generic Lebesgue-L2 basis, explicit basis-vector identity and Parseval. Fourier eigenvalues require the stated transform convention or dilation. |
| A3-prime | A1 Gaussian orthogonality and B2 | The bare normalized polynomials H_n/sqrt(n!) in L2(N(0,1)), their explicit elements, and the relation to the function-side basis. |
| Part B | The reusable analytic constructions | Parent stage; its children have different generalities. |
| B1 | Exponential integrability and polynomial moments, analytic uniqueness | Vanishing/determinacy and weighted-L2 completeness. Some positive exponential moment suffices for a strip argument; all rates give the entire-function version. Mere existence of all polynomial moments is insufficient. |
| B2 | Weighted orthogonality, positive normalization constants, membership and completeness | Explicit normalized weighted/function-side bases. The README is polynomial-facing on R; the pinned implementation allows arbitrary measurable domains but retains Nat-indexed real functions. Its weight isometry and abstract basis transport are separate generic primitives. |
| B3 | Hilbert bases of sigma-finite factor measures | Complete product and finite-pi bases, arbitrary factor indices, explicit pointwise product identities. Orthonormality alone and finite-dimensional tensor bases do not prove this completeness statement. |
| Part C | Chebyshev-T orthogonality, B1 compact-support case, B2 | Basis of the Chebyshev measure, constants c_0=pi and c_n=pi/2 for n>0, and cosine transfer. Not the unweighted interval basis without transport. |
| Part D | B3 and A3/A3-prime | Multi-index bases for product Lebesgue and product standard-Gaussian measures; coordinatewise transport still requires the specified dilation. |

The historical instruction to construct A first and then extract B1/B2 is a development order, not permission to introduce a circular mathematical prerequisite graph.

## Recorded proposal: clarify B2 versus Peter-Weyl assembly

The packet records the shared **assembly substep**, not shared ownership of the two completeness arguments. Relevant source passages are OrthogonalL2Bases's generality bar and B2, and CompactGroups's assembly discussion and Layer 5 (particularly source lines 342-359).

In the polynomial-facing README, B2 takes polynomials indexed by Nat on R. The actual pinned implementation [T1] is broader in domain: it takes a family of **real-valued** functions indexed by Nat on an arbitrary measurable space. Lifting those real values through the scalar embedding does not make it a constructor for arbitrary complex-valued matrix coefficients. Its output remains Nat-indexed.

Peter-Weyl instead uses a chosen irreducible skeleton and the index consisting of a skeleton index together with two finite matrix indices. The matrix coefficients are genuinely complex-valued. No countability assumption on that skeleton is supplied by the stated general compact-group setting. Thus, calling the concrete weighted-system bridge without a change of interface is not justified.

However, **CompactGroups is not blocked on a new general constructor**: its Layer 5 already explicitly names [M1]. For a complete inner-product space E over an RCLike scalar field, an arbitrary family v indexed by any type, orthonormality of v and the vanishing of the orthogonal complement of its span produce a Hilbert basis. The companion coercion theorem identifies each resulting basis vector with the original family. Both statements were read in pinned Mathlib.

The proposed rescope is consequently narrow: retain the OrthogonalL2Bases citation as a design precedent for explicit elements; identify Mathlib as the final assembly supplier; leave weighted normalization in B2 and representation-theoretic orthogonality, skeletons and density in CompactGroups. Do not merge the roadmaps or emit an unqualified B2-to-Layer-5 dependency.

### Additional local proof obligation, not a new link

CompactGroups Layer 5 says that spectral decomposition writes each convolution as a **finite sum** of matrix coefficients. Compactness and self-adjointness alone give approximation by spectral truncations, not equality to a finite sum. For example, the diagonal operator on ell2 with diagonal 1/(n+1) is compact and self-adjoint but has infinite rank. Applying it to a vector with every coordinate nonzero does not give a finite spectral sum.

The compact-group argument therefore needs an explicit finite-spectral-truncation approximation and the norm upgrade needed for density in C(G); an L2 spectral expansion alone is not a uniform approximation theorem. This is a requested clarification of the target stage's argument, not a proof that the full Peter-Weyl theorem is false. No CompactGroups file was edited and no review of that worker's eventual submission is claimed.

## Checked boundaries and non-emitted candidates

### Moment determinacy: reuse the existing submission

At revision `b82b494ac1b384423eacc1276c6716f15e186b6d`, the sibling packet `research/blueprint/links/tauceti_TauCetiRoadmap_StandardDistributions.json` already contains B1 -> StandardDistributions Layer 1, quoting the explicit ownership directive. Its relevant entry was read. This packet does not duplicate it, reapprove it, or claim an independent review of that whole submission.

The pinned measure-level theorem [T2] is useful additional provenance. For two finite measures on R, it requires an integrable exp(a*abs(x)) for some positive a for **each** measure, and equality of every polynomial moment, including degree zero. It concludes equality of measures. It is not restricted to absolutely continuous laws. The sibling packet's density-difference route is a sufficient narrower route, not the full scope of the pinned theorem.

A possible application to StandardDistributions Layer 4's Gaussian-square law is worth preserving, but is **not emitted as another dependency edge**: the target has not mandated this particular proof route. Let mu be the square pushforward of N(0,1) and nu the Gamma law of shape 1/2 and rate 1/2. Independently of the desired equality, both have zeroth moment 1 and moment recurrence m_(n+1)=(2n+1)m_n, from Gaussian integration by parts and the Gamma integral recurrence. Both are supported on the nonnegative half-line. Independently computing the exponential integral at a=1/4 gives sqrt(2) for each: on the Gaussian side the remaining density is proportional to exp(-x^2/4), and on the Gamma side the rate changes from 1/2 to 1/4. The hypotheses of [T2] then imply equality. Turning this into a library proof still requires the pushforward-integral and moment-recurrence lemmas; no declarations for those steps were invented or built here. The empty sum case of the subsequent chi-squared sum theorem is the separate Dirac-zero case.

Do not extend this argument to arbitrary heavy-tailed laws merely because their polynomial moments exist. In particular the positive exponential-integrability hypotheses must be checked, not silently replaced by totalized integral identities.

### Gaussian densities versus Hermite bases

StandardDistributions Layer 5 item 2 expressly consumes `TauCeti.pi_gaussianReal_eq_withDensity`. Its exact source [T3] was checked: for a finite index type it identifies the product standard-Gaussian measure with product Lebesgue measure weighted by the product of the scalar Gaussian densities. There is no orthogonal family or completeness hypothesis in its statement. The file itself says this distribution-theoretic helper is separate from the multi-index Hermite basis that consumes it.

Do not turn that helper reuse into an asserted dependency on **completion of the whole Part D Hermite basis**. A finer shared-support node or explicit baseline import is the appropriate representation if the atlas requires one. StandardDistributions owns the additional affine change of variables and positive-definite covariance density. No reverse dependency from Part D to those general distribution targets is established.

Other rejected vocabulary matches: B3's L2(product measure) basis is not the Peter-Weyl isotypic Hilbert direct sum; Chebyshev T with its arcsine weight is not the SU(2) character system with its different weight; pointwise oscillator identities do not by themselves supply self-adjoint unbounded operators or semigroup theory. These are exclusions within the read material, not a completed survey of PDE or semigroup roadmaps.

## Pinned declaration provenance

Library pins: Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.

- **[M1]** [Mathlib/Analysis/InnerProductSpace/l2Space.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/InnerProductSpace/l2Space.lean#L533-L565), blob `e2bc31114865e19c04c8c6d9c720d32fa80624c5`. Read the global scalar/space variables, the CompleteSpace scope, and `HilbertBasis.mkOfOrthogonalEqBot` with `HilbertBasis.coe_mkOfOrthogonalEqBot`. The parameter family has arbitrary index type. Statement/source check, not a local build.
- **[T1]** [TauCeti/Analysis/InnerProductSpace/WeightedOrthogonalBasis.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/InnerProductSpace/WeightedOrthogonalBasis.lean), blob `cf61fe4bf63c9fb46626b348d6968bc1b7866fe6`. Full file read. The variables near lines 65-69 and constructors/coercion theorems from line 169 onward fix the Nat-indexed, real-valued family, measurable weight, positive constants, membership, orthogonality and explicit completeness hypothesis. The reference-measure construction further requires strictly positive weight almost everywhere. No claim that the README's real-domain restriction also holds in this implementation.
- **[T2]** [TauCeti/Probability/Moments/Determinacy.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Probability/Moments/Determinacy.lean), blob `bec3f5f56939b7165c0d9ffc4b2703271241f4eb`. Full file read, especially `TauCeti.Measure.ext_of_forall_integral_pow_eq` and `TauCeti.Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp` near the end. The proof uses analytic moment-generating functions on a strip, characteristic-function equality and measure extensionality. The latter declaration has the finite-measure and positive exponential-moment assumptions stated above.
- **[T3]** [TauCeti/Probability/Distributions/Gaussian/Pi.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Probability/Distributions/Gaussian/Pi.lean), blob `b21e1edd976de54137042694cc16b923206503d3`. Full file read, particularly `TauCeti.pi_gaussianReal_eq_withDensity`; finite index type, product measures on real-valued functions, product Gaussian density. This is a measure identity, not a Hilbert-basis theorem.

No private reference library was used. Named books in the source READMEs were not treated as independently checked evidence for this checkpoint.

## Validation and exact stopping point

The original 14 MB atlas could not be obtained as a local file: the ordinary contents action returned no usable content, blob output was truncated, and direct local HTTPS attempts failed DNS resolution. This is **not** a claim that browser atlas access remains wholly blocked: revision `b82b494ac1b384423eacc1276c6716f15e186b6d` now provides generated browser extracts. Their README and the own-roadmap extract were opened; the latter tool response truncated before all records could be read. The next worker should use these extracts rather than repeat the earlier large-file attempts.

The source of the current repository validator was read (`scripts/check_links.py`, blob `88135efe5a74ef82e088f3fa3189893e27a7867a`). It still loads `data/atlas.json`, the new-roadmap directory and sibling link packets. The required command is:

```text
python3 scripts/check_links.py research/blueprint/links/tauceti_Completed_OrthogonalL2Bases.json
```

It has **not been run locally**: the complete local atlas is unavailable. No reduced or invented atlas was substituted. Stage IDs in the overlap follow the checked snapshot heading parser; complete atlas membership still needs the validator. Executed locally: `python3 -m json.tool research/blueprint/links/tauceti_Completed_OrthogonalL2Bases.json` (passed), plus inline Python assertions for protocol/status, entry counts, distinct examined IDs, summary length and absence of private paths (passed). These are limited checks, not graph or mathematical validation. The existing `Swarm submission check` workflow covers link paths, but no CI outcome is asserted in this pre-submission handoff; the issue/PR submission record must report the actual result after it runs.

**Remaining work, in resumption order:**

1. Finish the own-roadmap atlas-record read, confirm both overlap endpoints, and compare record descriptions against the source inventory above.
2. Read the new index and all same-area summaries, and screen every other upstream roadmap plus the campaign areas for the stage inputs/outputs above. The completed full-document reading set here is only the three entries in `examined`. Search hits and the other worker's examined list are not our own coverage.
3. In particular close the candidate screen for Gaussian/Wiener chaos, harmonic-oscillator and Schwartz consumers, Fourier conventions, semigroups, PDE, moment methods, compact-group harmonic analysis and product-measure bases. Read matched stages in full before emitting edges. Record exact supplier and consumer quotes and the necessary adapters.
4. Inspect all newly added roadmaps, including `MordellLawrenceVenkatesh`, and all sibling link packets at the chosen resumption revision. The StandardDistributions B1 entry was checked here; the full sibling corpus was not. Recheck already integrated stage edges so no duplicate is emitted.
5. Resolve the B2/CompactGroups citation proposal independently, and route the finite-spectral-truncation obligation to the CompactGroups owner. Do not edit that owner's document as part of this job.
6. Run the full repository validator, fix every reported error, and retain its exact output/revision. Even a structural pass does not certify the unfinished survey or the mathematical proposal. Keep `status: partial` until the catalogue-wide screen is actually complete.

No unrelated application code, queue data, reserved IDs, other worker's packet, or default-branch file was edited. No git commands, merge, approval, issue closure or done-label action was used.
