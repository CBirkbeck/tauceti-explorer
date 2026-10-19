# Independent review: doubling and standard transfer

Accepted as a completed planning pass on 2026-10-19. Reviewer: Codex, session `codex-zSjBee`, job `REV-DESIGN-AutomorphicLFunctionsAndLocalFactorsPartII`, issue #3501. This session did not author the original design. Acceptance does not close the six recorded mathematical/source obligations or claim Lean implementation.

The [packet](../packets/AutomorphicLFunctionsAndLocalFactorsPartII.json) contains an individual decision and source-specific note for every node. The [reader](../readmes/AutomorphicLFunctionsAndLocalFactorsPartII.md) and [roadmap definition](../roadmaps/AutomorphicLFunctionsAndLocalFactorsPartII.json) have been synchronized with those decisions.

## Inventory and closure

| Item | Reviewed result |
| --- | --- |
| Targets | 62: 18 definitions, 11 constructions, 33 theorems |
| Node decisions | 33 corrected, 29 verified; none unverifiable |
| Nodes added or removed | 0 |
| Definition/construction API | 126 items, up from 87 |
| Distinguishing unit tests | 89, up from 87; every definition/construction has at least 3 |
| Planets | 50 across 11 layers; existing names retained, at most 6 per layer |
| Pinned baseline citations | All 6 confirmed; none removed or replaced |
| Source findings | All 36 inherited entries reviewed; E37 added; 34 confirmed, 3 rejected |
| Import contracts | 24, including precise extension requests |
| Coverage | 11 planned, 0 closed; 6 explicit gaps |
| Routed mathematics | 112 items assigned to targets/imports; separate 35-item Speh and 36-item Asai continuations retained |

The graph is acyclic and the layer order puts model estimates before continuation, local pole attainment before global entireness, and entireness before the converse theorem. All targets of each planned layer are realized. Its `remaining` entry names the applicable gaps and supplier contracts. The packet remains `complete` in the protocol's finished-pass sense. Nothing is marked closed while its inputs remain outstanding. The target-level granularity is appropriate: internal source-proof steps stay in sketches rather than becoming another list of lemma declarations.

## Corrections applied

1. **Concrete group ownership.** Complex `ClassicalGroups` Layer 0 does not supply arbitrary-hermitian U/GU groups or local GSpin carriers. Removed that attribution from D.0, D.4 and D.5. Current `OrthogonalSpinGroups` Layer 0 supplies general-field SO and its comparison API; current `ReductiveGroupsPartII` RG2.5 supplies dual groups from actual pinned reductive groups. G6 records the remaining hermitian/GSpin concrete carriers, reductivity, base-change and root-datum comparisons. The SO roadmap postdates the atlas stage index, so its exact pinned upstream URL is recorded in `classical-standard-data.upstreamImports` and the import contract, without inventing a baseline declaration or editing upstream. The dual-group dependency uses the existing RG2.5 node.
2. **Full GU modulus.** D.0 now gives `|λ|_F^(n²)|det B|_E^(−n)` for the row-action Levi. The λ=1 and scalar-similitude checks detect either an inverted modulus or a missing multiplier term. Added Levi-coordinate extensionality and unique Levi/radical factorization.
3. **Godement section.** D.1 now fixes the row `(0,X)`, rather than leaving its choice unresolved. For an upper block matrix the substitution is `Y=XD`, giving the two characters `χ₂(det A)χ₁(det D)` and norm `|det A/det D|^(n/2+s)`. Its general construction is on ν=1; the defective GU extension remains the G3 comparison. Added a test that distinguishes the other row and a native matrix milestone/example in the Lean companion. Made n≥1 explicit for the induced-family expression.
4. **Signed residual exponents.** Replaced D.8's incorrect scalar expression by Lemma 4.4's vector `Re(s)(a₁,…,a_c)+(b₁,…,b_c)`, with signs and all partial-sum bounds. The residue recursion gives `Σ_(i≤j)e_i≤−j Re(s₀)−(c−j)/2<0`, including j=c. The c=2, Re(s₀)=1/4 check has first exponent −3/4 and total at most −1/2. The hermitian-support contradiction is still an explicit AS.4 input, not a consequence of square-integrability alone.
5. **Conjugate parabolics.** Corrected the D.8 exceptional family to even `SO_(2kc)`/`GSpin_(2kc)` ambient H with odd k, as in CFK (4.8)–(4.9), pp.37–38. D.5/D.6 now identify `j^(kc)P`, with j trivial in the symplectic case. The generalized Eisenstein API distinguishes s_G from s_E=s_G−1/2.
6. **Global involution.** D.9 now displays `φ₂∘ι`, the Fourier character and both rational/connected-central quotients, matching CFK §4.3, p.38, and the local evaluation at `e₂(ι(g))`. Added a paired local/global involution test and trilinearity.
7. **API and ownership detail.** Added 39 items across all 29 definition/construction nodes: constructors, equality criteria, transported pairings/models, induced-module and image-model universal properties, normalization changes and uniqueness of continuation/divisors. Current SR.5.3 already owns GL segment/multisegment Z/L constructors; ET.6's requested Speh adapter must consume those. Ordinary Whittaker exactness alone is not the generalized orbit-support theorem, and MP.3's precise critical unitary-theta input is explicitly an extension request.
8. **Reader/source consistency.** Rebuilt the target, API, tests, contract, gap and source-decision blocks from the corrected packet; refreshed layer dependency summaries. No excerpt fields existed, and none were added. All source descriptions are paraphrases with theorem/section/page locators.

## Baseline verification

Each declaration was opened at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The Tau Ceti pin remains `f790474821cf4256814db967cb154e7af3d0c369`; none of these six declarations is falsely attributed to Tau Ceti.

| Declaration | Pinned module and line | Hypotheses and use checked |
| --- | --- | --- |
| `mathlib:Matrix.fromBlocks` | `Mathlib/Data/Matrix/Block.lean:46` | No algebraic typeclasses; produces a matrix on the two sum indices from four compatible rectangular blocks. |
| `mathlib:Matrix.fromBlocks_multiply` | `Mathlib/Data/Matrix/Block.lean:214` | Fintype only on the contracted block indices and NonUnitalNonAssocSemiring on coefficients; the four outputs are the block dot products. |
| `mathlib:Matrix.conjTranspose` | `Mathlib/LinearAlgebra/Matrix/ConjTranspose.lean:36` | Requires Star on coefficients; maps a rectangular matrix to its transposed, starred matrix. |
| `mathlib:Matrix.IsHermitian` | `Mathlib/LinearAlgebra/Matrix/Hermitian.lean:44` | Requires Star; the square matrix equals its conjugate transpose, with no hidden positivity condition. |
| `mathlib:Matrix.trace` | `Mathlib/LinearAlgebra/Matrix/Trace.lean:45` | Fintype index and AddCommMonoid coefficients; the sum of diagonal entries. |
| `mathlib:AddChar` | `Mathlib/Algebra/Group/AddChar.lean:70` | AddMonoid source and Monoid target; its two laws send zero to one and addition to multiplication. |

The AL.0–AL.5 reviewed audit was checked: native Fourier/Schwartz/Mellin tools are not a packaged all-local-field representation theory or doubling construction. No library result is replanned as a new theory. Ownership was additionally checked read-only at current TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The complete nearby ReductiveGroups and ClassicalGroups readers and the scoped OrthogonalSpinGroups, ReductiveGroupsPartII, SmoothRepresentations and AdelicAlgebraicGroups interfaces were read. General Langlands classification, Harish–Chandra support, Schur theory, SO/Spin comparisons and isobaric sums retain their owners.

## Source decisions and limits

All seven accessible sources listed in the reader were read at the target locators: CFK arXiv v5, the published EHLS text, MODELS arXiv v1, GK's EMS text, HLS's author text, Garrett's author preprint and Harris's Siegel–Weil author text. Their URLs, hashes, editions and internal page conventions remain in the packet. The node-specific review notes state the mathematical feature checked; the reader gives each source-finding decision and reason.

Three inherited objections are rejected:

- **E1:** Propositions 3.17/3.19 and Corollary 3.21 concern all-point meromorphic attainment. Moving a central determinant twist into the arbitrary GL coefficient does not refute them. Unitarity is retained for the separate fixed-half-plane Theorem 3.12 target.
- **E9:** An integer determinant growth bound can be obtained by rounding in the appropriate direction when the determinant is at most 1. The later exponent M need not be integral; no failed estimate is established.
- **E29:** EHLS Corollary 4.4.9 allows off-diagonal differential-operator coefficients; only its diagonal coefficient is scalar. The inherited scalar-only objection misreads the assertion. Removed that alleged gap from the projection target and reader.

The other 33 inherited findings are confirmed at the stated level. Several descriptions needed repair: E5 concerns the Υ twist of the essentially tempered classical **tail**, and the bound a_d>r, not an incorrectly named central-character exponent; E8 is the U_P⁻/U_R⁻ chart-domain mismatch; E20 is the missing flat label on the second vector's space. E34 is an exact Haar/kernel normalization gap, not a blanket disproof of every normalized algebraicity assertion. E36 records the compact-dual/Borel comparison obligation, not a disproof of branching after that comparison. New E37 records the harmless additive-character value typo in the proof of CFK Lemma 3.16, p.22: a vector in the right radical gives character value 1, not 0. No novelty claim is made.

The Annals publication record for CFK was checked, but its journal mathematical text was inaccessible; no claim that a v5 finding persists in Annals is made. The full corrected 2022 GAFA local-theory PDF was not obtained through the publisher/NSF routes. Its publisher correction cannot be dismissed as metadata. GK's theorem, distribution hypotheses, group setup and unfolding were checked; its complete distribution proof is still G4. Original MVW and CPS/CKPSS proofs remain G2/G5. No uncleared book or alternative copy was used. These are recorded closure limits, not missing review verdicts.

## Follow-up decisions for the orchestrator

Acceptance leaves G1 (classical unitary local/residual normalization), G2 (general MVW source), G3 (critical compact-dual/induced-fiber and Garrett-kernel comparison), G4 (corrected full local/distribution/pole/strip sources), G5 (converse proof and controlled globalization), and G6 (concrete U/GU/GSpin supplier comparisons). Obtain the cited missing sources and arrange these precise supplier extensions before claiming implementation closure. For G6, confirm the concrete-model owner in the ReductiveGroups direction while consuming current OrthogonalSpinGroups; do not open another SO construction.

The doubling-route alias merge and the separate Speh/Asai continuations remain proposals for the orchestrator under protocol §9. Their routing counts and consumer boundaries were checked against the extraction briefs. This review does not certify additional primary-paper proofs for those unplanned continuations or apply a restructuring to another roadmap.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicLFunctionsAndLocalFactorsPartII.json`: 0 errors, 0 warnings.
- `lean-check` on the suggested file at the shared pinned build: exit 0; exactly 15 warnings, all declaration-uses-`sorry`. Memory availability was checked before each run. The companion is 130 lines, with 4 light real-bodied definitions, 5 theorem goals and 10 examples; it develops no missing carriers and has no sorry-valued data definition.
- Packet/reader/roadmap semantic synchronization, individual review coverage, minimum test counts, source decisions, import resolution and gap references checked; `git diff --check` clean. Submission file rules: 6 files, 0 problems. `check_sorry_data.py`: exit 0.

No promotion, upstream edit, library build or manual label/merge action was performed.
