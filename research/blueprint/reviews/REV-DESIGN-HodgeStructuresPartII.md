# Independent review: Hodge structures, Part II

Job `REV-DESIGN-HodgeStructuresPartII`, issue #3548. Codex session
`codex-JoCdgi`, 7 October 2026. **Completed review: accepted conditional
planning pass.** The top-level packet review contains a verdict for every node.
This supersedes the two partial review checkpoints reproduced below.

Acceptance concerns what this pass plans. H.0 remains **partial** and H.1–H.8
remain **not_read**, with precise follow-up work. The issue expressly permits
acceptance with honest gaps and requested suppliers. No stage is marked
planned or closed, no source correspondence is declared proved, and every
`implementationStatus` remains `unchecked`. The 36 native global omissions
are permitted by protocol §13: they are named missing interfaces, without
surrogate `Prop` fields or invented sheaf carriers.

## Counts and corrections

| Item | Completed review |
| --- | --- |
| Declaration nodes | 569: 532 verified, 37 corrected, none added |
| Definitions / constructions / theorems / lemmas / comparisons | 15 / 88 / 18 / 443 / 5 |
| Baseline declarations | All 280 exact pinned statements and ambient hypotheses read and confirmed; none removed or added in this continuation |
| API references | 540, representing 498 distinct names |
| Test references | 491, representing 442 distinct names |
| Source records / distinct node source-locator pairs | 57 / 64 after corrections |
| Joining route briefs / item memberships | All eight briefs read; all 149 memberships match their accepted extraction routes |
| Planets / requests / gaps | Six / five / 13, preserved |
| Native global signature omissions | 36: node indices 12–46 and 68 |

1. Corrected both `affineChartField.test_exterior_transition` and
   `test_exterior_zero_iff` descriptions at node 131, and classified them as
   compatibility tests. They had described the zero two-direction field.
   Their existing Lean examples actually test the exterior-square transition
   under two module/coefficient charts and equivalent vanishing on the
   receiving ring. The mathematical signatures were already correct.
2. Corrected the Stacks locator in **34 nodes**, indices 224–234 and 242–264:
   the opening connection definition in §60.15 is unnumbered;
   **60.15.1 is a lemma**. Its complete proof remains the cited proof.
3. Corrected the source attribution of `rees-parameter` and
   `rees-specialization` (45–46). Liu–Zhu Theorem 2.1/Remark 1.10 motivates
   nilpotent twisted Higgs functoriality, not the finite Rees construction.
   EG §4.2/Lemma 4.9 now supplies explicitly limited filtered/graded
   motivation. The generic finite Rees calculation is identified as an
   authored deduction, with explicit flat ordinary connection, finite bounded
   locally split Griffiths filtration and relative `dt=0` hypotheses.
   The proof sketch checks a split chart
   `Rees = ⊕ₚ Gₚ[t] t⁻ᵖ`, both fibers and localization, then uses the
   requested canonical sheaf comparisons. No Rees carrier was duplicated.
4. Replaced superseded current-summary/frontier prose in the packet and
   roadmap JSON with the actual current boundary. In particular,
   affine common-λ balancing, categorical triple pullback and finite-projective
   dual tower coherence already have nodes. They are not still missing affine
   tasks. Exact sheaf interfaces, universal exterior comparison and
   arbitrary-Q tensor-valued shuffles remain open. Historical continuation
   receipts retain their authorship and are explicitly historical.
5. Added fresh receipts for every baseline entry, every route manifest entry,
   all three source issues, the complete review, and exact-file validation.
   Earlier reviewer receipts are preserved in history. Added only a boundary
   comment to Lean; no mathematical body or import was changed.

## Sources and mathematical fidelity

The fresh primary readings cover every distinct locator used by a present
node, grouping repeated citations to the same passage. Sources support the
stated motivation or specialized convention; general affine/ringed-site
arguments are explicitly authored deductions. The eight joining briefs were
read in full, but their entire papers and undecomposed endpoints were not
re-reviewed. This distinction is retained in the route manifest.

- [Esnault–Groechenig published PDF](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/11915-ACTA-2020-0225-0001-a002.pdf):
  §2.1 pp.108–109 and §4.2 pp.131–132, including the complete printed
  Lemma 4.9 proof. SHA-256
  `0d81a6d3e9be477c58a725096c41f06a8a9262422fe596363c3f04c26ab1cfab`.
  [Author copy](https://www.mi.fu-berlin.de/users/esnault/preprints/helene/126_esn_gro.pdf):
  Definition 1.1/Remark 1.2 p.2, complete §2.1 pp.5–6 including Lemma 2.1,
  and §4.2 pp.23–24 with Lemma 4.9's whole printed proof. SHA-256
  `0bfa00b7dbae7a59c193d3523028df826741f15d3e88cb50526f8656a7fb8e35`.
  The regular-function parameter is narrowed explicitly to `dλ=0` in the
  reserved integrable carrier; variable-parameter affine defects are kept.
  The rigid-moduli theorem is not proved by this algebraic prefix.
- [Liu–Zhu v3](https://arxiv.org/pdf/1602.06282v3): Remark 1.10,
  §2.1/Theorem 2.1 with tensor/dual formulas and the exterior-complex
  explanation, Lemma 2.15 with its printed proof, and the filtered setup
  of Definitions 3.5–3.6/Theorem 3.8. SHA-256
  `8b11e55bffbfb1835a6da8975272670c9465601c08640e06f3a566a459a1da79`.
  The Tate line is retained. The unbounded period filtration does not become
  the finite split Rees filtration; its comparison remains a gap.
- [Heuer published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf):
  Definition 1.2 pp.262–263, complete Definition 4.1/Remark 4.2
  pp.297–298, Theorem 4.8/Remark 4.9 and whole displayed proof pp.300–302.
  SHA-256
  `7608fff18ccbc47b96bd54cfe01f31f8ccd9953889834cc9f6c39787563175cd`.
  [Preprint v3](https://arxiv.org/pdf/2307.01303v3): the same defining
  convention and Theorem 4.8/Remark 4.9 with displayed proof pp.27–28.
  SHA-256
  `df8caac5ee92e8bcd5a4f9de8dcd5901d61d5f6f4f5c1c3c5bd6b65880e18943`.
  The source's finite-dual symmetric action into associative End(E) is
  respected; the p-adic correspondence belongs to its consumer.
- Stacks [07J5](https://stacks.math.columbia.edu/tag/07J5): full displayed
  connection/extension conventions and Lemma 60.15.1 proof and both
  correction comments. [01CA](https://stacks.math.columbia.edu/tag/01CA):
  opening sheafified tensor/universal property, Lemmas 17.16.1–5 and the
  continuation explaining local finite-free tensors. [00H9](https://stacks.math.columbia.edu/tag/00H9):
  Definition 10.39.1, Lemmas 10.39.5 and 10.39.14 with their proofs.
  [00EN](https://stacks.math.columbia.edu/tag/00EN): Lemmas 10.23.1–2,
  all listed conditions and complete proofs.
  [0FNJ](https://stacks.math.columbia.edu/tag/0FNJ): Lemma 15.74.1 and
  complete proof. The dualizable/finite-projective criterion motivates,
  rather than already supplies, the planned connection duality.

All five fresh PDF hashes match the prior edition receipts. Reading a printed
proof does not certify every recursively cited proof (for example the Simpson
inputs in EG Lemma 4.9 or the local-correspondence inputs in Heuer).

All three `sourceIssues` are independently **confirmed** in this session:
EG's published p.108 `integrality`/Ω¹_X slips (visually checked), the historical
Stacks diagonal Δ→i slip (complete
[authors patch](https://github.com/stacks/stacks-project/commit/d90e73b0eb86c47faa4724d04a3f06a810a83d36.patch)
read), and Heuer's p.301 θ_j(e) missing component index (visually checked in
print and checked in v3). Retain the printed coefficient order. The Stacks
slip is already fixed. No new corrigendum search is claimed; inherited bounded
search receipts retain their dates. No additional source issue was found.

## Closure, API and signatures

All statements, hypotheses, proof steps, prerequisites, API entries and tests
were read, along with every line of the current suggested file. The per-node
review records the following checked families, with their concrete limitations.

| Indices | Mathematical check |
| --- | --- |
| 0–11 | Commuting coordinate derivations, one-λ Leibniz, curvature signs, negative gauge derivative, same-parameter tensor, negative dual, invertible constant-λ rescaling, ordered joint nilpotence. |
| 12–46 | Balanced additive exterior extension, `λ dλ` scalar defect, flat complex, intrinsic sheaf tensor/dual/pullback/descent, Tate twists, ordered nilpotence and kernels, bounded subbundle Griffiths symbol and relative finite Rees. Sheaf signatures remain conditional on precise supplier interfaces. |
| 47–70 | Rank-zero and characteristic-two determinant/trace formulas, actual alternating section action, integral Jacobi supplier, associative-target symmetric quotient action, source augmentation powers and exact ordered bound. The characteristic-two x,y example distinguishes ordered I₂≠0 from its zero symmetric image and gives I₃=0. |
| 71–130 | Actual arbitrary-order tensor steps and units, newest coefficient prepended/rightmost operator acting first, finite-basis detection, arbitrary-Q cross-ring comparison, specified-exponent preservation/reflection, coefficient retract/flatness and principal-cover uniformity. |
| 131–160 | Exterior projection and two-direction commutator without dividing by 2; finite-coordinate, all-dual, finite-projective retract and local-chart detection. Arbitrary coefficient maps preserve but need not reflect integrability. |
| 161–223 | Arbitrary-Q tensor curvature cancellation, same-receiving-ring monoidal scalar extension, integral binomial/mixed-word expansion and N+M−1 ordered bound for finite-basis/projective/local-projective coefficients. The full arbitrary-Q tensor-valued shuffle remains open. |
| 224–283 | Actual balanced same-λ additive tensor with one scalar correction, native horizontal associator/symmetry/unitors, exact variable-λ curvature defect and constant-λ linear curvature. |
| 284–367 | Supplied calculus maps and semilinear horizontality, actual balanced scalar pullback, generation of the whole receiving module, direct/tower operator equality and monoidal comparisons. Image flatness and source reflection have different hypotheses. |
| 368–507 | Native ModuleCat objects and faithful forgetful functor, induced symmetric monoidal category, pullback natural/monoidal identity, tower and triple comparisons, whole-map rather than only pointwise coherence. |
| 508–568 | Actual finite-projective dual/evaluation/bidual, nonconstant-parameter dual defect, dual scalar-extension comparison and whole-equivalence identity/two/three-step coherence; all four/six scalar factors and algebra maps retained. |

No later supplier node was trusted only by name. The own-node prerequisite
DAG is acyclic. All 19 proposed stage edges introduce no cycle with the frozen
atlas graph. H.0 is an independent algebraic prefix, followed by the
moduli/variation/period/deformation and degeneration/locus branches; the real
Noether–Lefschetz tranche remains mandatory. No reverse dependency on the
p-adic or rigid-arithmetic consumers was added.

Definitions/constructions have working constructor, extensionality, evaluation,
transport and compatibility outlines and at least three meaningful test
references. The repeated five reserved-key API names are references to the
same downstream construction APIs, not second definitions. Tests discriminate
noncommuting E12/E21, degree zero, nonreduced and characteristic-two bases,
nonidentity charts and polynomial substitutions, variable parameters,
new-scalar derivatives and tensor/dual/tower orientation. Admitted examples
check types, not the truth of their asserted conclusions; this review also
checks the mathematical reasoning.

## Ownership and follow-up contracts

The reviewed `data/library-coverage.json` rows and reviewer metadata were read:
AUDIT-02 for parent Hodge L0–L3, AUDIT-10 for D3, AUDIT-22 for E1.
The complete HodgeStructures and SchurWeyl upstream documents were read for
scope and density. The existing Hodge decomposition, polarization, mixed
strictness and period-domain point carriers are imported. Native tensor,
symmetric algebra, augmentation, exterior and monoidal carriers are reused.
The finite locally free key occurs once and includes all survey sample API/tests,
including locally varying unbounded rank. A finite trivializing cover is not
part of its definition. Smooth-manifold CovariantDerivative and scheme
InvertibleSheaf are genuine existing near misses, not replacements for the
requested general ringed-site connection category.

| Supplier | Independently checked boundary |
| --- | --- |
| CR.1 | The whole stage compares crystals with integrable quasi-nilpotent connections on suitable crystalline lifts. It does not yet promise the general ordinary carrier. The exact broader carrier/comparison remains an explicit request and gap; do not narrow the reserved Higgs/λ definition. |
| E1 | The ordinary sheaf carrier, local-freeness interface, presheaf tensor and underived sheaf pullback already exist. Underived sheaf tensor/dual/exterior/action coherence needed here remains requested on those carriers; do not create new carriers. |
| DD.1 | The stage promises filtered enhanced modules/Rees where applicable. Exact finite split sheaf Rees and operator-compatible fibers are requested, with the local weighted calculation now explicit. No completion assumptions are imposed on this finite specialization. |
| D3 | The whole stage owns the common local-system/holomorphic-filtered-bundle variation with opposedness and transversality. Its exact declaration remains requested; no second variation definition is planned here. |
| Coleman L1 | The existing `derivation-determinant-unit` node exactly supplies integral Jacobi for matrix units with finite decidable indices, including rank zero and characteristic two. Its statement, hypotheses and dual-number proof route were read in full. This is a planned supplier, not a compiled theorem imported into this file. |

The six planet names are mathematical noun phrases at the allowed six-per-layer
limit: Joint Higgs nilpotence, Higgs and λ-connections, Twisted Higgs bundles,
Griffiths filtrations, Graded Higgs field and Rees parameter connection.
The many affine plumbing lemmas and tests do not need separate planets.

The orchestrator should schedule follow-ups from the precise coverage lists:
exact global supplier contracts and their 36 signatures; universal exterior
comparison; arbitrary-Q tensor-valued shuffle; determinant/Tate/period/rank
adapters; and the eight undecomposed later stages. Accepted joining-route
item sets are preserved, including the DegeneratingHodgeStructures alias.
The reader Markdown is outside this review's authorized paths; a later
assembly can synchronize its historical frontier prose with the corrected
roadmap JSON and packet. No alteration of another owner is proposed here.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/HodgeStructuresPartII.json`
passes with **0 errors and 0 warnings**. Stable node identities, complete
per-node verdict coverage, all unchecked implementation statuses, the
three-test minimum, route membership equality and both dependency graph
checks pass. `git diff --check` passes.

`lean-check research/blueprint/suggested/HodgeStructuresPartII.lean` completed
with **exit 0**, **948 expected declaration-uses-sorry warnings**, **0 other
warnings** and **0 errors**, after checking 105 GB available memory. The exact
file SHA-256 is
`6ed48a7197148a1ff556fcb472350542fae5ac2b6776f3bd498ac5cbc404916a`.
It uses the existing shared build at pinned Mathlib, only individual Mathlib
imports, and admitted planning bodies. This is an elaboration check of the
written signatures, not a proof certificate for their conclusions or the
36 omitted global signatures. No Lean process remains running.

## Historical review checkpoints

The following reports preserve the predecessors' findings and exact historical
extent. Their unfinished worklists are superseded by the completed review above.

<details>
<summary>5 October 2026 checkpoints (codex-BjAqvx and codex-tUuT7s)</summary>

# Independent review checkpoint: Hodge structures, Part II

Job `REV-DESIGN-HodgeStructuresPartII`, issue #3548. Codex session
`codex-BjAqvx`, 5 October 2026. This continuation is a **partial review**.
It adds neither acceptance nor a final `needs_changes` verdict, and the packet
has no top-level `review` object. Read the current handoff before continuing.

## Current extent

The preceding checkpoint, merged in PR #6156, inspected array indices 0–46.
This session independently inspected the next **65 nodes**, indices **47–111**,
from `H.0/determinant-coordinate` through
`H.0/affine-ordered-iterate-base-change-one-zero-iff`: statements, hypotheses,
proof routes, prerequisites, API, tests and corresponding suggested signatures.
The accumulated inspected prefix is **112 of 569 nodes**; **457 remain**.
Inspection is conditional on the stated inputs and is not a final per-node
verdict. Later supplier nodes referenced by this prefix are still unfinished
review work. The predecessor's 47-node inspection is credited to
`codex-tUuT7s`, not claimed as a fresh review by this session.

There are **107 new pinned declaration-statement receipts**: 106 existing
entries and the newly cited native `LinearMap.mul'`. Together with the prior
15 receipts, **122 of 280 baseline entries** have been inspected for this job;
**158 remain**. Mathlib is pinned to
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti to
`f790474821cf4256814db967cb154e7af3d0c369`. Reading native declarations does
not certify the later uninspected consumers that also cite them.

The packet still has 569 nodes, 540 API entries, 491 tests, six planets, five
requests and 13 gaps. Every node remains `implementationStatus: unchecked`.
H.0 is partial and H.1–H.8 are not_read; the author's `status: complete`
continues to mean its budgeted planning pass ended, as permitted by section 0.
No stage was promoted. The reserved key occurs once under
`HodgeStructuresPartII:key/higgs-parameter-connections`, with its generality
and the predecessor's local finite-rank correction preserved.

## Corrections in this continuation

1. **A genuine change-of-chart test.** The affine ordered-iterate construction
   had a suggested example whose conclusion was the same equation on both
   sides of an iff. Replaced it with `test_scaled_chart`: over Q, the coefficient
   unit map is θ, ψ=2θ, f=3 id and u=2 id. The horizontal equation
   ψf=(f⊗u)θ holds with nonidentity isomorphisms; ψ≠θ and both order-n iterates
   are nonzero, including the tensor-unit boundary n=0. The packet and actual
   suggested signature now agree. This discriminates the coefficient change
   rather than asserting a tautology.
2. **The characteristic-two counterexample now has its whole signature.**
   The named suggested theorem only asserted that a nonzero raw two-slot
   tensor dies in the symmetric quotient. That did not supply the node's
   integrable Higgs field or its ordered nilpotence assertion. Added concrete
   native coordinate fixtures for multiplication by x and y on the monomial
   basis of F₂[x,y]/(x²,y²), and native multiplication after the two symmetric
   generators. The named node theorem now states commutation of all
   contractions, the value of the ordered square on 1, its nonvanishing, the
   vanishing symmetric image, and exact ordered bound 3. The old raw-tensor
   assertion remains a separately named supporting theorem. Added the direct
   ordered-square, ordered-iterate and native multiplication prerequisites,
   and a concrete-fixture proof step. The fixtures are definitions with actual
   bodies; the theorem is still an admitted plan. No generic carrier or new
   declaration node was introduced.
3. **Test metadata.** Corrected nine invalid test-kind values to the section 12
   vocabulary: `computation`, `degenerate`, `compatibility` or `non-example`.
   They occur at indices 76, 95, 148, 268 and 305. The statements at the last
   three indices were read to classify those tests; this does not enlarge the
   mathematical review beyond index 111. No tests were removed.
4. **Precise source pagination.** Nine citations in the inspected algebra
   prefix placed Heuer's Remark 4.2 on p.297. The published remark is on p.298;
   Definition 4.1 spans pp.297–298. Corrected the locators and recorded the
   exact published edition read, without replacing the authored general
   module arguments by the source's rigid-geometric hypotheses.
5. **Precise native evidence.** The `Fin.append_left_eq_cons` baseline entry
   now mentions its actual `Nat.add_comm 1 n` cast. The `Matrix.toLin'` entry
   also records its use by the characteristic-two fixture. Added
   `LinearMap.mul'` from `Mathlib/Algebra/Algebra/Bilinear.lean`, with the
   actual ambient assumptions, for the symmetric image map. No baseline
   citations were removed. The other new receipts record personally read
   statements and ambient hypotheses, not just declaration-index matches.
6. **Version-specific source findings.** Recovered the exact published EG20
   bytes from the Tsinghua archive and confirmed the inherited p.108
   `integrality`/Ω¹_X notation finding. The previous HTTP 403 boundary remains
   explicitly historical, with a resolution and fresh version-specific
   verdict. Added and confirmed
   `HodgeStructuresPartII/EHeuer25-Remark4-9-coefficient-index`: published
   Remark 4.9 applies θ_j(e) to input Σ_i e_i⊗ω_i; the output needs θ_j(e_i).
   The same slip occurs in arXiv v3 and the publisher HTML. The displayed
   coefficient order ω_i⊗ω_j is retained. This is a missing index, not a
   false correspondence theorem. A bounded correction search found no
   matching correction. The predecessor's confirmed, already-corrected
   historical Stacks finding is preserved with its original attribution.
7. **Review receipts.** Added selected primary-source reading receipts,
   an explicit ownership-audit boundary, and
   `verification.independentReviewCheckpoint`, which enumerates all 65 node
   ids, the 107 new native receipts, the next node and the full-file compile.
   No predecessor proof receipt is silently treated as this review's proof.

## Mathematical checks of indices 47–111

The table records the reasoning actually inspected. Global sheaf contracts
and later affine suppliers remain conditional unless explicitly read below.

| Indices and nodes (all H.0) | Check and practical boundary |
| --- | --- |
| 47–54: `determinant-coordinate` through `determinant-gauge-curvature` | Taking traces gives λδ(tr A)+trace commutator for curvature, hence trace κ. The dual sign and tensor rank factors affect A, not λ. Gauge curvature is conjugated, so determinant curvature is invariant. Rank zero gives the unit line and trace zero; arbitrary characteristic needs no division. Global top exterior powers are still requested from E1. |
| 55–56: `determinant-derivation-rows`, `determinant-row-action` | Derivation of the determinant expands by row replacement and Leibniz. Replacing each row by the corresponding row of A*S sums to tr(A) det(S); off-diagonal replacements vanish by alternation. This works for singular S and in characteristic two. |
| 57–59: `determinant-gauge-matrix`, `determinant-gauge`, `determinant-alternating-operator` | Read the exact `ColemanPowerSeries:L1/derivation-determinant-unit` supplier: finite indices, commutative algebra and a matrix unit, with no characteristic-zero assumption. Its Jacobi formula gives the scalar derivative correction. The full connection gauge identity uses that correction. Section vectors are columns, so their induced column variation is S*Aᵀ; applying the row identity to the transpose gives the required trace. The supplier remains a planned cross-packet theorem, not a compiled proof loaded here. |
| 60–64: `affine-contractions` through `symmetric-action-morphism` | Contraction needs Q duality and tensor-unit evaluation, not a basis of E. An action into associative End(E) must use `TensorAlgebra.lift` and the commuting-generator relation; the commutative-target `SymmetricAlgebra.lift` would be insufficient. Conversely the symmetric source forces commutation. Ordered word products act rightmost first and the empty word is the identity. Generator intertwining extends by symmetric-algebra induction. |
| 65–69: `ordered-coordinate-vanishing` through `truncated-symmetric-action` | Finite local freeness of Q detects all ordered coefficients. The existing Tau Ceti augmentation ideal equals the span of the generators; native `Submodule.span_pow` and `Set.mem_pow` give degree-N word generators without assuming End(E) commutative. Killing the source ideal is equivalent to killing those words and permits the quotient action. At N=0 the ideal is the whole source, so only the zero module admits that quotient action. Global tensor-power detection and the same uniform exponent remain sheaf obligations. |
| 70: `symmetric-projection-counterexample` | On E=F₂[x,y]/(x²,y²), X²=Y²=0, XY=YX≠0 and all length-three products vanish. The ordered square at 1 is xy⊗(q₀⊗q₁+q₁⊗q₀), nonzero in the ordered tensor basis, while its symmetric image is zero. This verifies why projecting to Sym² cannot replace ordered nilpotence. The suggested theorem was strengthened to this actual field and exact bound. |
| 71–74: `affine-contractions-reconstruction` through `affine-ordered-square-vanishing` | A finite basis of Q reconstructs θ while E is arbitrary. In (θ⊗id)θ the new coefficient is prepended. Evaluating the two slots against (v,w) gives a(v)a(w); the E12/E21 test distinguishes the opposite order. Vanishing of every coordinate pair detects the ordered square. |
| 75–80: `affine-ordered-step` through `affine-ordered-iterate-succ` | A singleton coefficient is converted to TensorPower degree 1, multiplied with degree n and cast from 1+n to n+1. The actual Fin cast was checked. I₀ uses the tensor unit, and the successor rule agrees on elementary tensors. No zero-degree vanishing is inferred for a nonzero module. |
| 81–87: `affine-ordered-step-zero` through `affine-ordered-iterate-zero-field` | Tensor induction establishes additivity and zero-step equations. Contracting a step prepends the endomorphism; induction gives ordered word products. A tensor-power basis detects the full iterate from those products. Zero field gives every positive iterate zero, while I₀ is unchanged. |
| 88–94: `affine-ordered-step-natural` through `affine-ordered-iterate-two` | Horizontality propagates through each step and every order. Vanishing at N propagates to larger bounds. Surjectivity of the module map transfers a bound to the receiver; two isomorphisms reflect the identical exponent. Degree-one and degree-two comparisons use the actual unit and associator identifications, not literal equality of different tensor carriers. The replacement chart test makes the compatibility nontrivial. |
| 95–99: `affine-base-change` through `affine-base-change-bound-faithful` | Scalar extension is distributor after `LinearMap.baseChange`, with the scalar placed on E and unit on Q. The native End base-change hom preserves ordered products. A finite basis of Q gives same-exponent preservation for every scalar extension and reflection under faithful flatness, with E arbitrary. Later arbitrary-Q tensor-power comparison nodes are not yet reviewed. |
| 100–104: `affine-coefficient-map` through `affine-coefficient-map-bound-retract` | Applying id⊗u gives the new field. Identity, composition and iterate maps follow on elementary tensors. Bounds are preserved for any u. A left inverse reflects the same exponent by applying its tensor powers; no flatness is needed for this retract case. |
| 105–106: `affine-ordered-iterate-flat-subobject`, `affine-coefficient-map-bound-flat` | For injective f and u, the stated flatness of F, Q and P suffices to make f⊗u^⊗n injective: first tensor f with flat Q^⊗n, then tensor the injective coefficient-power map with flat F. Reflection concerns the receiving iterate restricted along f, not arbitrary vectors outside its image. An injective Z→Z given by 2 becomes zero after tensoring with Z/2, so the unrestricted injectivity claim would be false. |
| 107–111: `affine-base-change-natural` through `affine-ordered-iterate-base-change-one-zero-iff` | The scalar-extension horizontal equation and coefficient-map equation use the distributor on each pure tensor. Iterate naturality is stated over the receiving ring; later general tensor-power suppliers remain conditional. Faithful-flat detection θ_S=0 iff θ=0 applies `one_tmul_eq_zero_iff` to E⊗Q and does not require a basis of Q. The same degree-one assertion follows through the singleton equivalence. |

## Pinned declarations and ownership

The new native receipts cover matrix trace/determinant/gauge interfaces;
derivation constants; associative tensor/symmetric-algebra quotient and ideal
power interfaces; tensor products, duals, finite bases and tensor powers;
scalar extension; faithful flatness; flat tensor injectivity; and the native
linear multiplication map. The packet lists each exact declaration/module
and its reading receipt. Ambient hypotheses, not just the named line, were
read. The two Tau Ceti augmentation interfaces were read at their exact
source pin. No new tensor, symmetric algebra, augmentation, quotient or
multiplication owner was planned.

The reviewed library-audit rows for parent HodgeStructures L0–L3 and the
relevant E1/D3 target/evidence/duplicate rows were read, including the
REV-AUDIT02/10/22 metadata. The complete upstream HodgeStructures and
SchurWeyl reader documents were read for scope and density. This is an
ownership check, not a fresh proof audit of their Tau Ceti implementation.
The broader route inventory and all uninspected stage suppliers still need
a complete review.

## Sources freshly read by this session

All hashes below identify the downloaded bytes, not an inferred equivalent
edition. Reading the printed proof is distinguished from recursively
checking every cited proof.

- [Esnault–Groechenig author copy](https://www.mi.fu-berlin.de/users/esnault/preprints/helene/126_esn_gro.pdf),
  SHA-256 `0bfa00b7dbae7a59c193d3523028df826741f15d3e88cb50526f8656a7fb8e35`:
  p.2 Definition 1.1/Remark 1.2, complete §2.1 and Lemma 2.1 proof on
  pp.5–6, and the parameter definition and complete printed Lemma 4.9 proof
  on pp.23–24. Simpson's cited inputs were not recursively audited.
- [EG20 published archive copy](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/11915-ACTA-2020-0225-0001-a002.pdf),
  SHA-256 `0d81a6d3e9be477c58a725096c41f06a8a9262422fe596363c3f04c26ab1cfab`:
  complete printed pp.108–109. Its bytes match the packet's expected
  published hash exactly. This resolves the previous inaccessible-version
  boundary for the inherited p.108 notation finding only.
- [Liu–Zhu arXiv v3](https://arxiv.org/pdf/1602.06282v3),
  SHA-256 `8b11e55bffbfb1835a6da8975272670c9465601c08640e06f3a566a459a1da79`:
  pp.6–9, Theorem 2.1 and equations (2.4)–(2.5), and pp.18–19, Lemma 2.15
  with its full printed quasi-unipotence proof. These do not verify a finite
  Rees construction; external correspondence proofs were not recursively read.
- [Heuer published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf),
  SHA-256 `7608fff18ccbc47b96bd54cfe01f31f8ccd9953889834cc9f6c39787563175cd`:
  p.262 Definition 1.2(2), pp.297–298 Definition 4.1/Remark 4.2, and
  pp.300–302 Theorem 4.8/Remark 4.9 and its complete displayed proof.
  Visual inspection of p.301 confirms the missing coefficient index.
- [Heuer arXiv v3](https://arxiv.org/pdf/2307.01303v3),
  SHA-256 `df8caac5ee92e8bcd5a4f9de8dcd5901d61d5f6f4f5c1c3c5bd6b65880e18943`:
  Definition 1.2 and complete pp.27–28 Theorem 4.8/Remark 4.9 proof.
  This is a selected comparison, not full version collation. The correction
  search inspected the existing PAPER-HEUER-25 findings E1–E13, the
  [publisher HTML](https://link.springer.com/article/10.1007/s00222-025-01321-4),
  [arXiv version history](https://arxiv.org/abs/2307.01303), and returned results
  for three erratum/corrigendum queries. No matching correction was found in
  that bounded search; the source issue records the exact extent.
- [Stacks tag 01CA](https://stacks.math.columbia.edu/tag/01CA): complete
  displayed section 17.16, its tensor-presheaf/sheafification definition,
  universal property, Lemmas 1–6 and comments. Proofs the source omits were
  not silently supplied. [Tag 00H9](https://stacks.math.columbia.edu/tag/00H9):
  selected flatness/injection statements and the complete displayed proof
  of Lemma 10.39.14, not the whole chapter.

## Remaining review and questions for the orchestrator

Continue at array index **112**,
`HodgeStructuresPartII:H.0/affine-tensor-power-base-change`. The 457 remaining
nodes end at `H.0/dual-three-step--triple-flat-iff`. Read their full contracts,
sources, APIs, tests and suggested signatures; do not infer correctness from
the admitted file's elaboration or historical proof receipts. Audit the 158
remaining baseline statements, and complete the new-roadmap scope/layer,
source-route, supplier/duplication and planet checks before a final verdict.

The prior unresolved contracts remain: CR.1's crystalline quasi-nilpotent
scope versus ordinary connections on an arbitrary differential site; E1's
precise underived tensor/exterior/dual/restriction/descent interfaces and the
35-node global omission ledger; and DD.1's exact finite Rees module-sheaf
construction and supporting primary source. LZ's nilpotence theorem does
not support the Rees citation. Preserve the reserved key's broader carrier
while resolving ownership. The source findings now have version-specific
verdicts, but source inventory closure is unfinished.

The issue does not authorize editing the reader document. An authorized
assembly or follow-up must synchronize both checkpoints' corrections into
`research/blueprint/readmes/HodgeStructuresPartII.md`. No reader, parent roadmap,
campaign or atlas data was edited in this session.

## Current validation

`python3 scripts/check_blueprint.py research/blueprint/packets/HodgeStructuresPartII.json`
reports **0 errors, 0 warnings**. The exact full edited suggested file was
elaborated by `lean-check` against the pinned Mathlib build: **exit 0, no errors,
948 warnings, all `declaration uses sorry`**. Its SHA-256 is
`96c8174ef8f9ebbe6511d8810f4d796910a9373e8e6e8c9bf712ce685f4acea1`.
It imports only Mathlib, so this check loads no Tau Ceti code. Native fixture
bodies elaborate; admitted theorem bodies remain plans. These checks do not
fill the global omission ledger or prove any mathematical claim. The
compilation finished, and no language server or library build was started.

## Archived predecessor report

The following report is preserved as the `codex-tUuT7s` checkpoint history.
Its 47-node/279-baseline counts and unresolved EG published-version boundary
describe that earlier submission. The current extent and resolution above
supersede them; the current handoff controls where to resume.

### Independent review checkpoint: Hodge structures, Part II (codex-tUuT7s)

Job `REV-DESIGN-HodgeStructuresPartII`, issue #3548. Codex, session
`codex-tUuT7s`, 5 October 2026. This is a **partial review**, not acceptance or
a finished `needs_changes` verdict. No top-level `review` object has been added.
The review must continue from the handoff before the packet can be promoted.

## Extent and counts

The incoming packet has 569 nodes, all in H.0: 15 definitions, 88 constructions,
443 lemmas, 18 theorems and five comparisons. It records H.0 as partial and
H.1–H.8 as not_read. Those coverage statuses are honest. Its `complete` status
means a planning pass ended after exceeding the 300-node budget; it does not
mean that these stages are planned or closed. Unread stages are not, by
themselves, grounds for rejecting that completed pass under section 0.

This checkpoint inspected the first **47 nodes**, from `H.0/coordinate-frame`
through `H.0/rees-specialization`, including their statements, hypotheses,
proof routes, prerequisite lists, API and tests. It checked the statements of
**15 of 279 baseline citations** at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. The other 264 statements and the
remaining 522 nodes have not been independently checked. An indexed structural
check validates all declaration names/modules, but is not a statement audit.

The edited packet still has 569 nodes and six planets. It now has 540 API
entries, 491 test entries, five requests and 13 gaps. No nodes were added or
removed, and no baseline citations were removed. Seven API entries and seven
tests were added, including one actual new affine Lean example. The additional
global tests remain explicitly omitted signatures, so their presence in JSON
does not satisfy the executable-signature requirement.

## Corrections made

1. **Local finite rank does not imply a finite trivializing cover.** The reserved
   node `key/higgs-parameter-connections` required a finite local trivializing
   cover in its first construction step. Its actual hypotheses impose neither
   quasi-compactness nor globally bounded rank. The step now permits an arbitrary
   covering family with a finite basis on each member. A new test uses the
   discrete space N, stalks Q^n, zero forms and zero Higgs operator: this is
   finite locally free with unbounded rank, and cannot have a finite covering
   family of free constant-rank charts. The affine-line nonzero example now
   specifies a field k, excluding the zero-ring ambiguity without restricting
   the general carrier.
2. **The reserved key's sample API is explicit.** The seven sample criteria in
   `data/keydefs/KEYDEF-algebraicgeometry.json` were compared with the reserved
   node. Its original tests included the unit line, parameter unit and
   noncommuting field, but omitted the integrable/non-nilpotent line, invertible
   rescaling, same-parameter tensor/dual/pullback and associated-graded checks
   from that node's own lists. These criteria now appear there with concrete
   values and named supplying nodes. They reuse existing constructions rather
   than adding second owners. The suggested file's global omission ledger was
   updated to match; actual global signatures and examples are still missing.
3. **Frame API and a discriminating test.** Added `Frame.ext` and
   `Frame.test_variable_parameter`. None of the three original frame tests
   detects deleting the constant-parameter field. The new example excludes
   λ=X with the direction ∂/∂X over Q[X], since ∂X=1. Both new signatures are
   present in the suggested file with admitted proofs.
4. **Use the edition independently read.** The 31 core/filtration nodes citing
   the inaccessible published EG20 passages now cite the existing
   `EG-author-2026` record with author-copy pagination. The source matches
   explicitly distinguish the relatively constant restriction and authored
   arbitrary-ring/site deductions from the source's complex-geometric
   statements. `H.0/intrinsic-rescale` additionally replaces its irrelevant
   Liu–Zhu nilpotence citation with the scaling formula in the proof of EG
   Lemma 4.9, author p.24. The original published source record and its
   historical evidence remain available for the rest of the review.
5. **Supplier and source boundaries are gaps.** Added a precise gap for the
   generality of the requested ordinary-connection supplier, and another for
   the two Rees nodes' source and supplier contract. No supplier scope was
   silently enlarged, and no prerequisite edge was redirected without a
   justified replacement.
6. **Source issues.** Added the missing `source: EG20` to the first source issue.
   The same notation slips occur in the author copy, but a verdict on its
   published-page assertion remains pending. Confirmed the second issue from
   the complete Stacks authors' correction patch: this is an acknowledged,
   already-fixed historical Delta/i misprint. No new source error is alleged.
7. **Planet.** The reserved key's planet is now “Higgs and λ-connections”, the
   key-definition survey's mathematical label. There remain six H.0 planets.

## Mathematical checks in the inspected prefix

These checks establish the indicated algebra or construction route **under its
listed inputs**. They do not verify all later affine prerequisites, discharge
the global supplier requests, or substitute for a final per-node verdict.

| Nodes (all H.0 unless specified) | Check and remaining boundary |
| --- | --- |
| `coordinate-frame`, `preconnection`, `operator` | Derivation carrier and parameter rule match the pin. Polynomial directions require a commutation argument, not merely `derivation_ext`. The actual suggested operator is base-linear, not R-linear. Added the constant-parameter rejection test. |
| `curvature`, `operator-commutator`, `flatness` | Expanded both operator compositions: commuting directions cancel second derivatives and δλ=0 removes the parameter derivative. The coefficient is λδ_iA_j−λδ_jA_i+[A_i,A_j]. Basis-column evaluation gives the converse flatness implication. |
| `gauge`, `tensor`, `dual`, `invertible-rescale` | The convention s′=Gs gives the negative derivative correction. Kronecker sums retain one λ; transpose reverses products, giving negative dual curvature. Constant inverse rescaling gives λ⁻² curvature. |
| `zero-parameter-curvature`, `joint-nilpotence` | Flatness is commutation, not nilpotence. E12 is nonzero with bound 2; a scalar 1 is flat without any positive bound. Nonreduced rank-one square-zero coefficients are correctly allowed. |
| `intrinsic-preconnection`, `extension-balancing`, `exterior-extension` | The whole sum D(e)∧ω+λe⊗dω is additive and balanced. The individual D term cannot be lifted as an O-bilinear map. Sheafification/restriction and all exterior degrees still need their exact supplied carriers. |
| `intrinsic-curvature`, `curvature-linearity`, `flat-extension-square` | The curvature composite is well-typed after extension. Its scalar defect is λe⊗dλ∧da. For dλ=0, D²(e⊗ω)=κ(e)∧ω. The local degree-two prototype does not establish all degrees or the global sheaf maps. |
| `key/higgs-parameter-connections`, `connection-morphism`, `unit-connection` | The reserved definition occurs once and carries actual equations, not arbitrary property fields. Finite local rank was corrected. Horizontal composition follows from the defining equation. λd is a flat unit when dλ=0; the requested global category signatures remain omitted. |
| `zero-fiber`, `ordinary-fiber` | λ=0 gives O-linearity and exterior-square Higgs integrability. λ=1 gives the ordinary equation, but the asserted comparison with the broad CR.1 carrier has not been supplied at that generality. |
| `tensor-balancing`, `intrinsic-tensor`, `tensor-curvature` | Expanding B(ae,f) and B(e,af) gives the same single derivative term. The mixed degree-one terms cancel in curvature, leaving the two factor curvatures. Later affine prerequisites and the native global sheaf construction remain unchecked. |
| `intrinsic-dual`, `dual-curvature` | In λd(φ(e))−φ(D(e)), the scalar derivative terms cancel when checking linearity in e. Finite local freeness gives the tensor-Hom identification; dλ=0 gives negative dual curvature. This still needs actual sheaf evaluation and biduality. |
| `intrinsic-pullback`, `local-descent`, `coordinate-comparison` | Pullback balancing uses the compatibility df(da)=d(fa). Zero curvature is preserved without flat base change. Horizontality makes the local operators glue. Arbitrary frames, especially zero directions, are correctly excluded from the universal-coordinate comparison. Sheaf restrictions/descent and later affine prerequisite statements remain open. |
| `intrinsic-rescale` | The generic inverse scaling is sound with λ a constant unit. Its source locator was corrected. |
| `twisted-higgs`, `higgs-commuting`, `symmetric-action` | Published Heuer Definition 1.2 retains Ω¹(−1). Definition 4.1 explicitly supplies contraction and the symmetric action into the associative endomorphism algebra. Exterior basis coefficients give commutation without dividing by 2; a commutative-target-only lift would not suffice. The cited later affine associative-target node has not yet been audited. |
| `ordered-iterate`, `nilpotence-filtration`, `nilpotence-equivalence` | Ordered tensors are correctly distinguished from exterior tensors. With finite locally free Q, kernels of all coefficient words give the lowering filtration. Steps/quotients need not be subbundles; the square-zero line example is correctly retained. |
| `tensor-nilpotence`, `dual-nilpotence`, `pullback-nilpotence`, `reduced-line-nilpotence` | The mixed-word shuffle route gives N+M−1 without dividing by binomial coefficients; dual words reverse and acquire (−1)^N. Zero composites remain zero under pullback. A reduced line has nilpotent scalar coefficients only when those coefficients vanish; Q's finite local freeness is explicit. Global shuffle/sheaf interfaces and the numerous later affine suppliers have not been fully audited. |
| `griffiths-filtration`, `graded-higgs`, `graded-higgs-integrable` | The scalar derivative and representative change vanish in F^{p−1}/F^p. For the E21 example the symbol lowers e₁ to e₂, whereas the skipped-two filtration is not transverse. Passing ∇²=0 to the degree−2 quotient gives exterior integrability. The quotient-symbol construction is used unbundled before flat Higgs bundling, avoiding a circular proof. |
| `rees-parameter`, `rees-specialization` | The signs t^(−p), t∇ and relative dt=0 are mutually consistent; the zero fiber has the degree-lowering symbol. The actual cited LZ passages do not state Rees modules or their fibers, and the exact finite module-sheaf supplier is not yet verified. Recorded as a gap. |

## Pinned baseline statements read

All entries below were read with their ambient hypotheses at the pinned Mathlib
commit; the packet records separate `independentCheck` receipts for these 15
entries. The indexed checker also found their names in the cited modules.

| Module | Declarations and fit |
| --- | --- |
| `Mathlib/RingTheory/Derivation/Basic.lean` | `Derivation`, `Derivation.leibniz`: base-linear map, zero on one and Leibniz; sufficient for the commutative-ring specialization. |
| `Mathlib/Algebra/MvPolynomial/PDeriv.lean` | `MvPolynomial.pderiv`: actual polynomial partial derivation, including monomial/constant formulas nearby. |
| `Mathlib/Algebra/MvPolynomial/Derivation.lean` | `MvPolynomial.derivation_ext`: equality from agreement on variables; not a theorem that arbitrary compositions are derivations or commute. |
| `Mathlib/Data/Matrix/Basis.lean` | `Matrix.single`: elementary entry and zero elsewhere, with decidable equality. |
| `Mathlib/Data/Matrix/Mul.lean` | `Matrix.mulVec`, `Matrix.mulVec_mulVec`: finite sums and composition; hypotheses are weaker than the finite commutative-ring models. |
| `Mathlib/LinearAlgebra/Matrix/Kronecker.lean` | `Matrix.kronecker`: multiplication on paired indices; does not by itself identify a tensor product of sheaves. |
| `Mathlib/LinearAlgebra/Matrix/Defs.lean` | `Matrix.transpose`: swaps the two indices. |
| `Mathlib/Algebra/Category/ModuleCat/Sheaf.lean` | `SheafOfModules`: module presheaf with underlying abelian presheaf a sheaf. This is already present and is not replanned. |
| `Mathlib/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean` | `SheafOfModules.IsLocallyFree`: local generator data giving local free isomorphisms; no finite rank or finite covering-family condition follows. The ambient over-site sheafification hypotheses must be retained when prototyping. |
| `Mathlib/Algebra/Category/ModuleCat/Presheaf/Monoidal.lean` | `PresheafOfModules.Monoidal.tensorObj`: objectwise tensor and semilinear restrictions, not a sheaf tensor identification. |
| `Mathlib/RingTheory/Kaehler/Basic.lean` | `KaehlerDifferential.D`: the universal relative derivation. An arbitrary specified differential calculus still requires its own given d; no universal-form identification is inferred. |
| `Mathlib/LinearAlgebra/TensorProduct/Basic.lean` | `TensorProduct.liftAddHom`, `TensorProduct.liftAddHom_tmul`: additive balanced lift and elementary-tensor evaluation; suitable for the non-R-linear connection extension. |

The reviewed audit of the parent HodgeStructures L0–L3 was read. It records
the implemented pure/mixed/polarization/period-point substrate, which these
core connection nodes do not rebuild. The parent's full document and the
AlgebraicCurves scope/convention/acceptance sections were read for boundaries
and granularity. This is not a new audit of the parent's Tau Ceti declarations.

## Sources and versions

- [Esnault–Groechenig author copy](https://www.mi.fu-berlin.de/users/esnault/preprints/helene/126_esn_gro.pdf),
  44 pages, SHA-256
  `0bfa00b7dbae7a59c193d3523028df826741f15d3e88cb50526f8656a7fb8e35`:
  definition paragraphs at pp.5–6 and 23–24, and the full printed Lemma 4.9
  statement/proof were inspected. Its Simpson inputs were not independently
  read. The [published Acta URL](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf)
  returned HTTP 403. Consequently neither its pagination nor its first
  source-issue assertion receives a fresh published-version verdict here.
- [Liu–Zhu arXiv v3](https://arxiv.org/pdf/1602.06282v3), SHA-256
  `8b11e55bffbfb1835a6da8975272670c9465601c08640e06f3a566a459a1da79`:
  conventions/setup, Remark 1.10, Theorem 2.1(i)–(v), the associated-graded
  passage and equations (2.4)–(2.5), printed pp.5–8. No correspondence proof
  or general nilpotence theorem was checked.
- [Heuer published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf),
  SHA-256 `7608fff18ccbc47b96bd54cfe01f31f8ccd9953889834cc9f6c39787563175cd`:
  Definition 1.2(2), p.262, and complete Definition 4.1/Remark 4.2,
  pp.297–298. The general algebra in the inspected nodes is distinguished
  from this source's rigid-geometric correspondence.
- [Stacks tag 07J5](https://stacks.math.columbia.edu/tag/07J5): the complete
  displayed section, proof and two comments. The
  [authors' historical patch](https://github.com/stacks/stacks-project/commit/d90e73b0eb86c47faa4724d04a3f06a810a83d36.patch)
  was read completely; SHA-256
  `e2baa6d2642f86c2ccb249335cabef74737876c5fc7b0bdee5462d6f9991eff7`.
  Linked crystalline proofs were not recursively audited.

## Supplier questions and remaining work

The descriptions of CR.1, E1, DD.1 and ShimuraData:D3 were read. D3 explicitly
includes the common variation carrier, with fibrewise opposedness and
Griffiths transversality; its use is appropriate as an open request. The other
boundaries require a more exact contract:

- **CR.1:** its stated connection comparison is over suitable crystalline
  lifts with quasi-nilpotence. Which declaration supplies ordinary integrable
  connections on every specified ringed differential site? The current request
  asks for a broader carrier than the stage explicitly promises. Resolve the
  general owner before asserting the comparison; do not add quasi-nilpotence
  to the reserved Higgs/parameter definition.
- **E1:** it describes derived sheaves, ringed pullback and monoidal operations,
  but the requested finite locally free underived tensor, exterior, dual,
  restriction and effective descent package still needs exact declarations.
  The 35-node global signature ledger expressly omits these signatures. An
  affine arbitrary-module prototype does not discharge the sheaf statements.
- **DD.1:** its filtered enhanced modules and “Rees descriptions where
  applicable” need a precise finite split module-sheaf specialization, with
  local freeness and both fibers. Read a primary Rees construction rather than
  using the LZ nilpotence theorem as its evidence.
- **Reader synchronization:** the issue does not authorize edits to
  `research/blueprint/readmes/HodgeStructuresPartII.md`. The assembler or an
  authorized follow-up must carry these corrections into that reader.
- **Final review:** independently inspect the remaining 522 nodes, 264 baseline
  statements, unvisited source records and their exact cross-packet suppliers;
  complete both source-issue verdicts and the source/route/stage screen; then
  write a final `review` object with justified per-node verdicts. This
  checkpoint must not be used as acceptance of the entire prefix or packet.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/HodgeStructuresPartII.json`
with the supplied pinned declaration index reports **0 errors and 0 warnings**.
The full edited suggested file was checked with `lean-check` against the shared
Mathlib pin. It elaborates with admitted statements; only the expected
`declaration uses sorry` warnings are permitted. The final hash and diagnostic
count are recorded in the handoff after the check finishes. These checks do
not prove the mathematical statements or fill the omitted global signatures.

</details>
