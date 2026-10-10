# PKG-ArithmeticQuantumTopology — blocked checkpoint

Worker: Codex (GPT-6), session `codex-c2or2X`, issue #7889, 2026-10-10.
Continues `codex-MNQaDU` (PR #8222), following PRs #8210, #8192 and #8154.

This is **partial**, not a completed package. The README is assembled; the Lean
file is a compiled subset, now also including the explicit QT.7 diagonal
automorphy factor, its pole-free GL lift and composition/sign APIs. The native
color inverse limit, twists and finite formal-color interfaces remain.
Missing supplier carriers prevent the full signatures
required by PROTOCOL §20. No packet, review verdict or supplier file was changed.

## What is saved

- `research/blueprint/packages/ArithmeticQuantumTopology/README.md`: all 106
  accepted targets, grouped by their actual parent QT.0–QT.7. It retains the
  mathematical hypotheses, all original 221 API entries and 169 named tests,
  plus two API entries and five tests for the explicit automorphy factor.
  Every numbered/page source locator remains. The procedural application
  paragraph is replaced by its mathematical comparison boundary. It omits process
  narrative, repeated use lists and repetitive acceptance prose. The resulting
  document is 199,939 bytes, below the 200 KB ceiling. Comparison obligations
  and conjectures remain visibly distinct from established source results.
- `Suggested.lean`: the input's concrete native interfaces, without the long
  commented inventory masquerading as signatures, plus genuine meromorphic
  Faddeev, extended Bloch, formal finite-color and completed color-algebra
  interfaces. The README retains the omitted mathematical specifications;
  this handoff identifies where native signatures still have to be supplied.
- `metadata.toml` is deliberately **not submitted**. The intake's
  `issues.deliverables_complete` treats a package as complete whenever its three
  files exist, without reading a partial handoff. Leaving this new file absent
  preserves checkpoint routing. Once the signatures are complete, create it
  with exactly `topic = "math.GT"` and a newline.

## Why the complete job is blocked

The accepted input passes the structural checker, but it explicitly contains
8 gaps, 19 open requests, 8 planned stages and **0 closed stages**. Its suggested
file has numerous entries labelled “signature omitted”; acceptance of its
planning pass did not supply those carriers. In particular the first target
requires a framed multi-link quotient and the next requires actual surgery.
These cannot be made into native signatures by interpreting a knot Gauss code,
a matrix cokernel or an unconstrained `Type` as the required geometric object.
PROTOCOL §13 explicitly forbids a dummy condition replacing an unstated one;
WORKERS forbids replanning another owner. This issue permits editing neither
GeometricTopology nor the other supplier plans.

The read-only current upstream was checked at TauCetiRoadmap
`8c72a04753b11cab07fa593cc38ceaa7c0515380` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`:

1. `TauCetiRoadmap/GeometricTopology/Suggested.lean` contains schematic comments,
   not a native framed-link/surgery interface. Current
   `TauCeti/KnotTheory/SmoothLink/Basic.lean` supplies `SmoothLinkEmbedding`
   (smooth circle components with disjoint ranges), not Seifert framings,
   linking numbers or a framed isotopy quotient. The pinned `FramedMarkovBraid`
   supplies component framing data, but `MarkovEquiv` is explicitly unframed.
2. The current `TauCeti/LowDimTopology/DehnSurgery/` contains `Slope.lean`:
   actual first-homology slope arithmetic and `FramedBoundaryTorus`. Its scope
   explicitly leaves the complement and filled manifold for further work.
   It does not supply integral surgery, the H₁ comparison, or Kirby moves.
3. GeometricTopology layer 7's closed-manifold geometry does not provide the
   ordered cusped geometric triangulation, peripheral completeness, canonical
   refinement connectivity or relative CW/homology interface required in
   QT.5–QT.6. The precise extensions are already described in the input's
   GeometricTopology Part II requests; do not replace them with bare matrices.
4. `OperatorTheory/SelfAdjointSpectralTheory` now owns the unbounded spectral
   theory that the older AS.0 request partly describes. Its native choice is
   `LinearPMap`, and its Part E constructs the spectral PVM and generated
   unitary group. This owner is cited in the package instead of planning the
   spectral theorem again. The specific Schrödinger realization/common
   Schwartz core/closure of p+q and microlocal kernel product/pushforward
   extension still require precise imported interfaces. No global AK gluing
   operation is invented here.
5. The accepted `HabiroCyclotomicCompletions` package exists and provides
   `HabiroRing`, finite factorial projections, `evalAt`, `taylorAt` and rigidity
   in its own namespace. Those must be imported, not defined again. At this
   checkout there are no packages for HabiroNahmSeries, HabiroNumberFields,
   K3BlochGroups, Polylogarithms or QSeriesPartitionsAndMockModularForms.
   Their references in the README identify mathematical owners, but must be
   reconciled with the permitted lower-tier/bundle order before upstream use.
   In particular the integral NZ/HB.9 bridge cannot erase faithful coefficient
   transfer, signed Kummer orientation or full quadratic finite étale descent.

No messages or new issues were sent to suppliers; the existing requests remain
unchanged. The maintainer must route these owner extensions or provide their
native signatures. This is a dependency block, not exhaustion of the run time.

## Native QT.7 addition in this checkpoint

Garoufalidis–Zagier arXiv:2111.06645v3 was read directly at §3.1, equation
(3.5), Lemma 3.1 and (3.7), p. 16; §4.2, equations (4.14)–(4.15), p. 30.
PDF SHA-256:
`2a4826bd1c2f0823c99f8e3cccfd835c5044d70d30eb20b36fea38dcb8dd83de`.
The accepted E11 correction is retained: the second fraction in the displayed
proof of Lemma 3.1 must be subtracted. Its stated additive cocycle is unchanged.

- `tweakedAutomorphyEntry` is the actual scalar expression
  exp(v λγ(x)) times the real power |cx+d|^κ, coerced to ℂ. Here v=V/(2πi)
  in the knot application. Fixed representation volumes and weights are
  parameters; this does not replace the missing knot representation family.
- `tweakedAutomorphy` is that expression's diagonal matrix. Nonvanishing on
  `rationalPoleFree` gives `tweakedAutomorphyGL`, using Mathlib's native
  `GeneralLinearGroup.mkOfDetNeZero`. The matrix coercion is definitionally
  the diagonal formula. No complex-power branch is introduced.
- The composition API requires both the intermediate and composite rational
  image to be finite. `rationalPoleFree_mobius` and `rationalMobius_comp` name
  the domain/action obligations. Scalar, diagonal and GL factors compose in
  the order used by `matrixTransport`; the source's reverse order agrees
  because these factors are diagonal.
- Sign invariance of λ and the scalar/diagonal factor, scalar nonvanishing
  and the determinant lift have proofs. The action and scalar composition
  obligations still use `sorry`; diagonal and GL composition derive from
  the scalar obligation. Fourteen concrete examples are proved: T has factor
  one, S at one has factor exp(v), S at zero is outside the domain, and
  λ_S(2/3)=1/6 gives exp(v/6) at weight zero. The sign and both matrix carriers
  have corresponding checks.

Pinned Mathlib statements read before use: special-linear negation and the
native `ModularGroup.S/T`, matrix diagonal multiplication/determinant,
`GeneralLinearGroup.mkOfDetNeZero`, and positivity of `Real.rpow`.
The conditional knot-matrix transport is retained; the new diagonal factors
do not establish real analyticity or quantum modularity for any knot.

## Native color-completion addition inherited from PR #8222

Habiro arXiv:math/0605314v1 was read directly at §8.1, Lemma 8.1 and
(8.1), p. 28; §8.2, pp. 29–30; and §9.1, Propositions 9.1–9.2,
p. 33, with the twisting application in §9.2, p. 34. Its PDF SHA-256 is
`5fb8b89b432401ea28d10e34d348c5cdebe43cf3ddb95c0475aaee869fa276fc`.
The new `CyclotomicCompletion` section completes an owned algebraic boundary
without defining a surrogate framed link or importing an unspecified RT functor.

- `colorAlgebra` has exactly the carrier of the existing q-ground tilde lattice.
  `tildeColorBasis` and `colorIdeal` specify its basis and genuine tail ideals.
  `mul_P` gives the prime-basis product before rescaling. `ColorQuotient k`
  is the actual ideal quotient, and `colorTransition` is the canonical algebra
  homomorphism for nested ideals. Finite coordinates are a linear equivalence,
  never a ring equivalence with pointwise multiplication.
- `completedColorAlgebra` is the compatible subalgebra of the product of those
  quotients. Its projections, dense algebra map, finite partial sums and
  `fromCoordinates` are concrete constructions. `completionCoordinates`
  specifies the inverse linear equivalence with all sequences of q-ground
  coefficients. The topology is induced from the product of discrete finite
  quotients; completeness, Hausdorffness, ring continuity, the coordinate
  homeomorphism and partial-sum convergence have native signatures.
- `omega` is the resulting actual inverse-limit element. In the tilde basis,
  its positive coefficients are q^(n(n+1)/2), and its negative coefficients
  are (-1)^n q^(-n). The comparison with the prime-basis coefficients retains
  the v^(±n(n+3)/2) powers. Nonzero coordinates exclude finite support; the
  inverse relation uses quotient-ring multiplication.
- `evenEvaluation` is polynomial evaluation at
  v^(2p+1)+v^(-(2p+1)). Its vanishing on P_(p+1) gives an actual quotient lift,
  hence `evenCharacter` on the inverse limit. Finite evaluation, separation of
  points and the values v^(±2p(p+1)) on the twists have exact signatures.
  `evenHopfValue` restores the quantum dimension. This is the algebraic
  pairing value; comparison with the geometric Hopf-link RT invariant still
  needs that owner's native interface.
- Tests distinguish both basis normalizations and signs, P/P₀ from P/P₁,
  higher tails from lower coefficients, ordinary polynomial elements from
  the twists, and the true product from pointwise multiplication. The
  coefficient of tilde P₁ in its square is q−q⁻¹. V₀ and V₂ evaluate the
  twists separately.

These are definitions and theorem/signature plans with `sorry` obligations,
not formalized results. No scalar Habiro completion, quantum-group completion
or external owner is recreated. The README's twist coordinates now state the
same explicit tilde normalization. The algebraic completion target and twist
coordinates have native signatures; the geometric twisting theorem, universal
invariant and general link pairings remain in the dependency table.
Pinned sources read before use include `Subalgebra`, `Module.Basis`,
`Ideal.Quotient.mk/factorₐ/lift`, `Polynomial.evalRingHom`, discrete uniformity,
product uniformity and subtype topology. The older library search found no
ArithmeticQuantumTopology coverage row; the current owner interfaces were
checked again at the commits listed above.

## Native finite-color addition inherited from PR #8210

Habiro arXiv:math/0605314v1 was read directly at §2.1–2.3 (pp. 7–9),
§5.1 (pp. 18–19, equations (5.1)–(5.3)), and §§5.3–5.4 (p. 20).
The PDF SHA-256 is
`5fb8b89b432401ea28d10e34d348c5cdebe43cf3ddb95c0475aaee869fa276fc`.
The new `FormalColors` section uses actual `PowerSeries ℚ`, finite function
modules and matrices, with no assumed quantum-group carrier.

- The basis is the source's F̃^(i)v₀, with explicit H/E/F/K/K⁻¹ matrices.
  Balanced Laurent integers map to exp(ah/2); a separate unbalanced Gaussian
  recurrence supplies F̃^(m). The denominator v−v⁻¹ is never inverted in
  ℚ[[h]]. Signatures check generator relations, the precise K exponential,
  highest weight, divided-power normalizations and endpoint vanishing.
- `quantumTrace` is the linear functional Tr(K⁻¹A). Its constant-term
  comparison, quantum dimension and qualified cyclicity use that matrix.
  Tests distinguish ordinary dimension, the opposite pivot, arbitrary
  cyclicity, and ordinary F² from the divided-power basis.
- The module tensor product is compared with product-index coordinates on
  pure tensors. Coproduct matrices and the Clebsch–Gordan equivalence require
  intertwining H/E/F/K, rather than only equality of ranks. Weight characters,
  the Chebyshev representation algebra and their product comparison are
  separately stated. The zero color tests all four tensor generators.

These are construction/signature plans with `sorry` obligations, not a
formalization. The continuous completed U_h-module action and ribbon operators
still need QT.1's quantum algebra and completed tensor presentation.
Do not mark the entire finite-color target closed from these matrix interfaces.
No external owner is duplicated. Mathlib's `PowerSeries.exp/rescale`, Laurent
`eval₂`, `Pi.basisFun`, matrix trace/Kronecker and module tensor product
statements were read at the supplied pinned sources before use.

## Native QT.5 addition inherited from PR #8192

Neumann arXiv:math/0307092v2 was read directly: §2, pp. 416–420;
§3, pp. 420–424; Lemma 7.1/Proposition 7.2, pp. 439–440; and
Theorem 7.5, p. 441. The new namespace
`TauCeti.QuantumTopology.ExtendedBloch` builds the owned algebraic cover and
quotient without waiting for a manifold or triangulation carrier.

- `Flattening` is a subtype of ℂ³ with exp(2w₀)=z² and
  exp(−2w₁)=(1−z)², with its subspace topology. Both logarithms recover z.
  The explicit upper/lower cut banks, limiting logarithms and two sheet
  transitions define `CutCover` as a genuine quotient with quotient topology.
  `flatteningEquiv` is a homeomorphism obligation for its concrete log map.
  Tests distinguish odd sheets, equal w₀ with unequal shapes, and even-sheet
  path connectivity. The >1 cut's upper bank has +π imaginary part in w₁;
  the principal log chart there is the lower bank.
- `LiftedFiveTermZero` uses paths in the five-shape preimage from the FT⁺
  principal lifts. `LiftedFiveTerm` then translates by the exact five-coordinate
  sheet lattice V. It never admits independent arbitrary five lifts. The
  chart criterion and rejection test retain all five sheet equations.
- `extendedPreBloch` is the native free abelian quotient by the join of two
  explicitly generated subgroups: lifted five-term and transfer relations.
  Its universal map and extensionality have concrete signatures. Tests
  include a nonempty FT⁺ locus, transfer zero, and the nonzero order-two
  transfer class in the quotient that omits transfer.
- `extendedDehn` descends the actual logarithmic wedge to the quotient;
  `extendedBloch` is its kernel. The wedge uses `exteriorPower` over ℤ,
  not over ℂ. Tests retain the sheet-change term and assert existence of a
  generator outside the kernel.
- `forget` takes the ordinary supplier's actual shape-generator map with
  its five-term equation. The comparison square uses the concrete unit-valued
  exponential linear map and ε=−2 exterior-square(exp), into the exterior
  square of the additive synonym of ℂˣ. `extendedBloch_forget` restricts to
  the supplied boundary's kernel with the exact equation ν′[z]=2z∧(1−z).
  This is a genuine universal/import-facing API, **not** an instantiated
  K3BlochGroups import. Instantiate it only when that owner's native package
  exists, and retain the distinct ordinary Bloch conventions.

This implements definition/signature plans with `sorry` proof obligations;
none of the mathematical results is claimed formalized. It does not supply
strong flattenings, Pachner geometry, Rogers regulators, geometric Bloch
classes, or the ordinary K₃ comparison. Those remain in the README and the
remaining-work table below. No supplier plan was copied or redefined.

Pinned declarations read before use: `FreeAbelianGroup.of/lift`,
`Relation.EqvGen.setoid`, quotient topology, `Joined/JoinedIn`,
`QuotientAddGroup.mk'/lift`, and `exteriorPower.ιMulti/map`.
The source PDF SHA-256 is
`de2f7ddec49b2ce6ccafd5a9a0be350972ffcf2014a6a3601a6d650df0018650`.
Only own-word mathematics and exact source locators are retained.

## Native analytic addition inherited from PR #8154

AK v2, Definition 15 (p. 9) and Appendix A (pp. 34–35, (42), (44), (47)–(49)),
was read directly. `FaddeevParameter` uses Re b>0, a reciprocal-stable domain
containing the source's representatives Re b>0, Im b≥0. The extension beyond
those representatives is through the same contour prescription and reciprocal
symmetry; it is documented explicitly in the README.

`IsFaddeevPhi` specifies an actual `ℂ → ℂ` function: meromorphic normal form
on the whole plane and agreement with the prescribed above-zero strip contour.
An existence-and-uniqueness theorem supplies its choice. It is not an admitted
carrier or a field asserting an unspecified mathematical property. The strip
integrability theorem and the offset bound lie before any use of the totalized
Bochner integral. The normal form assigns zero at poles, so the divisor and
functional identities use `meromorphicOrderAt` and punctured-neighborhood
`EventuallyEq`, respectively. The finite lattice cardinalities retain colliding
zero/pole multiplicities. Tests distinguish orders +1 at −c_b and −1 at +c_b,
order k+1 at −i(k+1) for b=1, reciprocal self-duality, and the cubic singularity
and nonintegrability of the ordinary real-axis integral.

The two convergent products in (44) are written directly with Mathlib `tprod`,
with an actual `Multipliable` obligation for Im(b²)>0; no second generic
Pochhammer library is introduced. Both shifts, the inversion scalar, product
representation and unitarity have concrete signatures. `faddeevPhi_real_strip`
connects the new meromorphic object to the retained real-b strip interface.
The operator pentagon, global AK gluing and volume/comparison assertions
remain unstated where their native analytic or geometric interfaces are absent.
All proof obligations use `sorry`; nothing is claimed formalized.

## Work remaining, in dependency order

| Layer | Native pieces saved | Full signatures still required |
| --- | --- | --- |
| QT.0 | Algebraically split/admissible matrix conditions, integral matrix cokernel and handle-slide congruence, discriminating small matrices | Framed-link linking matrix and tests; actual surgery/H₁ comparison; ordinary Kirby import; admissible band-slide, Hoste and presentation-existence refinements on those carriers |
| QT.1 | Mathlib-backed ribbon twist/trace interface; concrete finite-color generator relations | Topological quantum algebra and completed tensor multiplication; integral PBW/even forms, ribbon/core/twist data and extension of finite matrices to continuous U_h-modules (QT-owned work); supplier framed tangles, RT functor and universal bottom-tangle invariant |
| QT.2 | Formal finite free colors/basis and explicit actions; divided powers and pivotal matrix trace; tensor/Clebsch–Gordan and character comparisons; Laurent Chebyshev polynomials, cyclotomic lattice/filtration and genuine quotient inverse limit, coordinate/topology/truncation APIs; scalar Kashaev kernel | Continuous quantum-module and ribbon comparisons, link invariant and normalization, divisibility and expansion, unified Kashaev construction on actual knots |
| QT.3 | Actual completed twist elements, prime/tilde coefficient comparison, nonfinite support, inverse relation and even-color characters | Geometric Hopf pairing comparison and twisting theorem, JM on an actual integral-homology-sphere/surgery carrier, independence, connected-sum and orientation comparisons |
| QT.4 | Earlier scalar conventions | Root categories, strong Kirby colors, WRT and JM evaluation, Ohtsuki series and rigidity on the exact integral coefficient ring; general Lie-type core/parity/filtration |
| QT.5 | Principal charts, actual cut quotient/homeomorphism, intrinsic four-component flattenings, exact lifted five-term lattice, two relation subgroups, extended pre-Bloch quotient/Dehn kernel, universal ordinary forget/boundary square | Instantiate ordinary pre-Bloch supplier and its convention comparisons; actual strong/geometric flattening and Pachner interface; regulator branch/period comparison; number-field Bloch and K₃ torsion comparison |
| QT.6 | Linear NZ/Hessian formulas, full scalar meromorphic Faddeev signatures, selected real-b integral formulas, charged kernel action under explicit integrability/continuity, scalar root-NZ weights | Geometric NZ/root datum, formal Gaussian vertex series and move invariance; qualified HB.8/HB.9 bridge; operator pentagon; leveled shape/gluing carrier, microlocal products, AK convergence/invariance and selected volume theorem |
| QT.7 | Finite figure-eight root sums/descendants, denominator cocycle and pole-free action API, explicit scalar/diagonal/GL automorphy factors with composition and sign APIs, conditional ordered matrix transport, a partial provenance ledger | Actual representation-indexed knot rows/matrices; precise scalar/matrix asymptotic and analyticity predicates, lifts/quadratic/coefficient conjectures; proved BD comparison signatures; full six-column ledger and its tests |

These are not all external tasks. Quantum completed tensors/PBW/cores and
the knot-specific series are this roadmap's own work. Their native prototypes
remain to be written; independent pieces can proceed while supplier boundaries
are resolved. The compiled elementary components do not discharge a whole geometric
or quantum target merely by sharing an API name.

Resume first at `QT.0/framed-link-and-linking-matrix`: obtain the owner’s actual
carrier and invariant linking-number/framing API, then the integral surgery
carrier and H₁/Kirby comparison. In parallel mathematical planning, not through
new worker claims, identify the lower-tier/bundle package interfaces for the
Bloch, dilogarithm and Habiro bridge. Replace each outstanding specification
with genuine Lean definitions/signatures and the named API/tests in the README.
The QT.2 color inverse limit and QT.3 algebraic twist elements now have native
interfaces: retain their quotient multiplication and instantiate the geometric
pairing comparison rather than substituting pointwise coefficient products.
The QT.5 cover and relation algebra stand independently: retain this
namespace and instantiate its universal maps rather than recreating it. A next
independent QT.5 step is the extended Rogers regulator once the ordinary
dilogarithm supplier has a usable native interface.
Do not restore a comment-only inventory as evidence of elaboration. Use the
accepted input for exhaustive target/name tracing; this checkpoint has changed
no mathematical verdict there. Only after all layers meet §20 should metadata
be added and the package submitted as complete.

## Sources and validation

This run read the current GeometricTopology and
OperatorTheory/SelfAdjointSpectralTheory roadmaps and suggested files, and the
actual smooth-link, isotopy, slope and framed-Markov library statements.
TauCetiRoadmap advanced from `dea8191cc6047d6142a65872ebce6eeeb841a29b`
during this run; neither inspected owner directory changed at the final commit
above. The reviewed library catalogue has no ArithmeticQuantumTopology row.
PR #8222 records its SemisimpleAlgebras/GrothendieckEulerForms reads;
PR #8192 records its earlier geometric/spectral audit.
The inherited checkpoint records rereading the input's 24 baseline declaration
statements in the supplied pinned sources, including the total Bochner integral, ordinary Hopf structure,
rigid/braided category APIs, cyclotomic positivity, framed braid boundary,
Schwartz/Fourier and pointwise-dual tempered distributions. Source locators in
the README are retained from the accepted input; this run does not claim a
fresh full audit of all seventeen papers.

Public source reads inherited from PR #8154: Andersen–Kashaev arXiv:1109.6295v2, specifically
Definition 15 and Appendix A, with the selected-integral/steepest-descent loci
in §12; Habiro arXiv:math/0509039v2, the framed-link/Kirby loci.
PDF SHA-256: AK `cbbac2dcec624a2a541fb770f312a5bd2a6051fe79f3ae7cd02a7d19ab9ba24d`;
Kirby `d30d9c69b652aa58539d2398f1a8424c968188d94cc2098ee462dd4e53a13416`.
Only own-word mathematics appears in the repository. No restricted source was
needed; scratch PDFs/texts are not retained.

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticQuantumTopology.json`:
  **0 errors, 0 warnings**, unchanged input.
- Final `lean-check research/blueprint/packages/ArithmeticQuantumTopology/Suggested.lean`:
  **exit 0, 0 errors, 237 warnings**, all `declaration uses sorry`. Available memory
  was 106 GB before the final check. Mathlib's build commit is the exact pinned
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. Only `lean-check` was used.
- Exact rational action/domain/denominator/sign checks: **79,812 passed**,
  over all 52 determinant-one integer matrices with entries in [−2,2] and all
  31 reduced rationals r/s with −5≤r≤5 and 1≤s≤4, excluding the two poles.
  Each checks the Mobius denominator product, action composition and additive
  λ formula. **239,436** complex factor compositions passed for
  (v,κ)=(0.37+0.2i,0), (−0.4+1.1i,3/2), (0.2−0.1i,−3/4), at relative/absolute
  tolerance 5×10⁻¹². The small S/T cases and the incorrect dropped-denominator
  value 3/2 are separate controls. These are finite checks, not proofs of the
  remaining `sorry` declarations.
- PR #8222 recorded exact-rational completion/twist checks: **1,311 passed**,
  at v=2, 3/2 and 3, color pairs m,n=0,…,6, precisions 1,…,9 and even-color
  parameters p=0,…,8. They check the product formula, tail ideals, prime/tilde
  rescaling, twist inverses modulo each tail, even-character values and
  vanishing, and the nonpointwise product. These are finite specialization
  checks, not proofs or execution of the `sorry` obligations.
- PR #8210 recorded **606** finite-color generator, divided-power, tensor and
  trace checks; this run retains those declarations without rerunning its
  now-deleted scratch script.
- README assertion audit: the same 106 unique target anchors plus 8 layer
  anchors, in their original order; all original 221 API names and 169 test
  names retained; updated source locators and size checked. Only the
  procedural application paragraph and the cocycle target's explanation change.
- `python3 research/blueprint/intake.py check-files` on the three changed files:
  **3 files, 0 problems**. Exact issue-output scope and `git diff --check` pass;
  only this job's permitted outputs and handoff are submitted.
