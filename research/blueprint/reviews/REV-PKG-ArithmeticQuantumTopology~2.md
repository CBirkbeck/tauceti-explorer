# Independent package review: ArithmeticQuantumTopology, revision 2

**Verdict: needs_changes.** This is a completed fixing review of issue #10891,
not a checkpoint. The remaining defects are (1) the unsupplied extension of the
K₃-indexed Habiro line to the full quadratic finite étale coefficient algebra,
including its split case, and (2) the unresolved upstream order of the
q-series foundations and their topological applications. Both require changes
outside this job's permitted files. The geometry supplier objection from the
first review is resolved at the interface required here.

Reviewer: Codex, session `codex-lBcnJK`, 2026-10-21. The package and revision
were written by other sessions; this reviewer did neither packaging job.
Input main commit: `9f7c9850b`; revision input includes `0810f29f0`.
Reviewed the whole accepted 106-node packet, the whole package, the previous
review and revision handoff, and the supplier sections identified below.
Only the package README, Suggested.lean, review.json and this report change.
The metadata remains the fitting single line `topic = "math.GT"`.

## Fidelity, form and local corrections

Every packet target is retained. The correspondence is by mathematical content,
not equal subsection numbering: some prerequisite definitions are separated
and some closely related targets share a subsection. The packet has 8, 14,
15, 7, 13, 12, 21 and 16 nodes in Layers 0–7, respectively. The README has
8, 14, 15, 6, 16, 13, 20 and 18 numbered subsections, respectively: 110 in all.
The ledger's `node` and `status` fields are described as the output's source
target and status; they have not been lost merely because their field names
are not repeated verbatim. APIs, hypotheses, worked examples and discriminating
Checks are retained. The plan's conjectures remain conjectures.

The prose follows the upstream layer format, with ownership, conventions,
explicit suppliers, routes, APIs, Checks and dependencies. Definitions have at
least three discriminating checks. No source passage, source-by-source précis,
packet catalogue or job narrative has been added to the roadmap. The suggested
file uses `import Mathlib`, specific Tau Ceti imports, one namespace, layer
comments, light real-bodied definitions and representative end statements.
Heavy carriers remain README targets and are named in its closing comment;
there is no attempt to construct them through admitted data.

Corrections made in this review:

1. **§0.7, Hoste proof.** For a band slide of L_i over L_j, the component to
   unknot first is L_j, the component being slid over. The two Hoste moves
   then use that component; undo the auxiliary moves afterward. The earlier
   wording chose L_i and a different auxiliary-unknot route without support
   at the cited locus.
2. **§1.11, topology of a core.** Separate the intrinsic h-adic topology of X
   from its ambient topology in H. The clasp bases tend to zero in H, while
   they are topological bases intrinsically in X. Coordinates of an element
   of X tend to zero; coordinates in the ambient closure may be arbitrary
   formal scalars. This is what makes the pairing converge. An infinite
   intrinsic basis itself cannot tend to zero in hX: each basis vector has
   a unit coordinate. Added that negative control.
3. **§5.1, flat shapes.** Four distinct vertices may lie on a generalized
   circle. Keep these flat tetrahedra, as §5.2 and the regular-refinement
   argument already require. The geometric ideal region is supplied for
   nonflat tetrahedra; extend its volume to flat shapes by zero using D's
   real-axis vanishing. Distinguish flatness from coincident vertices. Added
   the shape-2 check and a proved Lean test of its companions −1 and 1/2.
4. **§6.8 and supplier contract.** Name the missing
   `indexedLine_quadraticEtaleComparison` and spell out its full domain,
   charts, descent, tensor and scalar compatibilities, including both split
   projections and factor exchange. Do not claim the existing field-only
   scalar equivalence already proves it. Keep the membership target with
   its full generality and record its actual prerequisite gap.
5. **Supplier and consumer descriptions.** Remove the false assertion that
   no supplier depends on this roadmap. State the required separation of
   QM.0–QM.1 foundations from QM.5 Lawrence–Zagier applications. The latter
   consume Layers 3–4 of this roadmap.
6. **§6.16 locator.** BDH's normal topology is defined in §3, p. 5, before
   Definition 3.1; Definition 3.1 itself defines hypocontinuity.
7. **§7.14 locator.** Identify GZ Conjecture 5.4 explicitly for the analytic
   strengthening, alongside Conjecture 5.1 and conditional Proposition 5.2.

These fixes preserve the original general targets. None replaces a general
theory by a special case or converts a conjectural comparison into a theorem.

## Previous objections and remaining supplier defects

### R1: hyperbolic geometric supplier — resolved for this package's use

Read Polylogarithms §2.4, rather than infer its content from its section name.
It now supplies the upper-half-space metric, completeness and curvature −1,
ideal boundary ℙ¹(ℂ), the SL₂(ℂ) action, finite ideal regions and the
Lobachevsky-volume calculation. ArithmeticQuantumTopology §5.1 explicitly
transports the cross-ratio by exchanging the first two vertices. In particular,
its tuple (0,∞,1,i) has shape i, whereas the supplier's ordering gives −i.
Unsigned region volume is |D|, so this change of ordering is necessary for
the signed comparison. The present package uses D(z) for Im z>0 and its
zero extension for real z≠0,1. That contract now has the necessary geometry.
This does not certify every signed orientation convention elsewhere in the
Polylogarithms package.

### R2: full quadratic étale indexed-line comparison — still open

The consumer in §6.8 and HabiroNahmSeries §6.4 require

```text
R = O_K[1/Δ],   B = R[T]/(δ T² − 1),   H_(B,ξ|B),
```

with Δ inverting the specified bad primes, in particular 2 and the
discriminant factors, and with **all components of B** retained.
HabiroNahmSeries §6.4 explicitly passes the finite étale module extension
through as a proof obligation. Renaming that statement a membership theorem
does not supply the extension.

Read HabiroNumberFields §§3.8, 3.10, 3.11, 3.16, 3.18 and 3.19.
Its effective descent is for localized rings of integers of number fields.
Its scalar equivalence is along a number-field embedding F→E and uses
extension along arithmetic Habiro rings,

```text
H_S ⊗_(H_R) M_ξ  ≃  M_(res ξ).
```

It is not an assertion about S⊗_R M_ξ. The indexed line need not have that
naive R-module scalar structure. The finite-free local coefficient norms
of §3.18 and the field transfer of §3.19 do not construct a global indexed
line over a disconnected finite étale algebra.

**Witness.** If δ=a² in K, normality of R and δ∈Rˣ imply a,a⁻¹∈R; since
2∈Rˣ, B≅R×R. Selecting T=a⁻¹ keeps one projection and discards the other.
A field-component comparison therefore cannot imply a comparison over B.
The required ring and line are H_R×H_R and M_ξ×M_ξ, together with their
actual arithmetic charts, both projections and the factor-exchange action.
The nonsplit case must agree with the number-field comparison. This test
does not dispute that an extension can be proved componentwise; it shows
exactly which theorem is absent from the current supplier contract.

**Required action.** HabiroNumberFields Layer 3 must supply the full
quadratic finite étale construction/comparison, its effective global
rank-one descent and tensor compatibility. HabiroNahmSeries §6.4 must then
consume it in its membership proof. ArithmeticQuantumTopology §6.8 must
retain the full B and its root-order restrictions. No selected component,
scalar equivalence alone or formal series identification closes this gap.
Those supplier files are outside this review's allowed edits.

### R3: upstream supplier order — still open transitively

The revision correctly removed the direct QSeries supplier from this package:
finite q-products come from HabiroCyclotomicCompletions §1.1; the other
elementary analytic/formal inputs have explicit owners. The remaining
dependency cycle at whole-roadmap granularity is nevertheless

```text
ArithmeticQuantumTopology
  → HabiroNahmSeries / HabiroNumberFields
  → QSeriesPartitionsAndMockModularForms
  → ArithmeticQuantumTopology.
```

Read the suppliers' exact contracts and uses. HabiroNahmSeries consumes
QM.0 q-binomial/q-Lucas/Euler/Rogers–Ramanujan/Andrews–Gordon material
and QM.1 eta material; its Gaussian endpoint construction uses those
foundations. HabiroNumberFields consumes QM.0–QM.1 bilateral 1ψ1,
asymptotic and eta material, including its Pochhammer Frobenius defect.
In the QSeries reader, the QM.5 targets
`lawrence-zagier-radial-limit`, `lawrence-zagier-ohtsuki-expansion` and
`poincare-sphere-unified-invariant-radial-limit` explicitly consume the
WRT, unified invariant, determination and Ohtsuki results of Layers 3–4 here.

This is an upstream packaging/order obstruction, **not a claim of a
circular mathematical proof**: the foundational layers can precede the
topological applications. The issue is that WORKERS requires whole supplier
roadmaps already upstream, or an assigned admissible bundle. The checked
Caraiani–Newton order assigns none of these roadmaps such a bundle/order;
an area focus is not a bundle assignment. The six direct atlas suppliers
now have accepted local package reviews, but that does not establish
upstream availability or repair the transitive order. None of their
packages appears in the supplied current upstream checkout.

**Required action.** Separate QM.0–QM.1 foundations from the later
Lawrence–Zagier applications, move the foundational exports to a preceding
owner, or obtain a maintainer-assigned bundle covering the actual dependency
closure. Then verify the supplier packages in that order. This review does
not assign a new bundle or edit another roadmap. Its README now states
the true layer dependency instead of claiming all suppliers are independent.
The upstream availability observation is about the supplied checkout,
not an assertion about the current state of every remote pull request.

## Source verification

Personally read all eight flagged source families, then a reproducible random
sample of 15 other node/source pairs. To keep the latter genuinely additional,
exclude the packet source IDs `sawin`, `murakami`, `dg`, `dg2`, `gswz`, `bd`,
`center`, `rt1990`; enumerate the remaining 98 pairs in packet order and use
Python `random.Random(10891).sample(pool, 15)`. Repeated sources at distinct
locators are separate pairs. The following tables identify the actual loci
read; they are statement/hypothesis checks, not just checks that a PDF opens.
All statements in this report are paraphrases. No restricted book was used;
the public BDH paper supplied the additional distribution-topology check.

Flagged families:

| Source, fixed public version | Loci read | Finding used in this review |
| --- | --- | --- |
| [Sawin, math/0308281v2](https://arxiv.org/abs/math/0308281v2) | §4, pp. 18–22; §6, Theorems 3–5, pp. 24–26 | Retain the root bounds and the distinction between a finite-free tilting category and an abelian category. |
| [Murakami–Murakami, math/9905075v1](https://arxiv.org/abs/math/9905075v1) | §1, pp. 1–2; Theorem 4.9, §4, p. 15 | The N-dimensional reduced colour and root evaluation agree for N≥2; order one needs its declared convention. |
| [Dimofte–Garoufalidis, 1511.05628v1](https://arxiv.org/abs/1511.05628v1) | §§2.1–2.4, pp. 5–9; §2.8, pp. 11–12; §3, pp. 12–16 | Keep B-invertibility as an extra coordinate assumption, actual Kummer actions, radical/sign choices and cubic vertices. The root-refined topological invariance remains conjectural. |
| [Dimofte–Garoufalidis, 1202.6268v2](https://arxiv.org/abs/1202.6268v2) | §1.2, pp. 4–5; §§2.1–2.4, pp. 11–13 | Gluing matrices and flattening conditions match the qualified NZ datum; neither block is automatically invertible. |
| [Garoufalidis–Scholze–Wheeler–Zagier, 2412.04241v2](https://arxiv.org/abs/2412.04241v2) | §1.7, Theorem 5, pp. 13–14; §1.8, pp. 15–17 | Full B, nondegeneracy, integral Nahm matrix and localization matter. The geometric dictionary needs the extra unimodularity and parity checks. |
| [Bettin–Drappeau, 1905.02045v2](https://arxiv.org/abs/1905.02045v2) | §1, pp. 1–3, especially Theorem 1, p. 2 | Exactly the stated ten hyperbolic knots, bounded-denominator positive-q asymptotics; retain the 5₁/5₂ table correction and exclude 7₂. |
| [Habiro, math/0605313v1](https://arxiv.org/abs/math/0605313v1) | §11, Theorem 11.2, PDF pp. 30–31, printed p. 31 | The center target is the completed even center with its σ-basis, not the ordinary polynomial center. |
| [Reshetikhin–Turaev, author-hosted paper](https://people.math.harvard.edu/~opie/Reshetikhin_Turaev.pdf) | §§2.1–3.3, pp. 2–7; §§4.1–4.6, pp. 8–12; Theorem 5.1, pp. 12–13; §6.1, p. 17 | Right dual/pivotal conventions, flip after R, ribbon framing and the coloured graph functor match the stated interfaces. |

The additional random sample (packet node suffixes):

| Node | Public source and locus personally read | Result |
| --- | --- | --- |
| QT.1/topological-ribbon-hopf-algebras | [HL, 1503.03549v2](https://arxiv.org/abs/1503.03549v2), §§2.1–2.3, pp. 12–16 | Complete-base tensor topology and ribbon axioms retained. |
| QT.1/core-subalgebras-and-twist-forms | HL, Definition 3, §2.14, p. 28; §§2.15–2.16, pp. 29–35 | Corrected ambient versus intrinsic topology in §1.11. |
| QT.1/universal-invariant-integrality | [Hab08, math/0605314v1](https://arxiv.org/abs/math/0605314v1), Theorem 4.1, p. 16; §4.3, pp. 16–17 | Algebraic splitting and zero framing are essential. |
| QT.1/ribbon-structure | Hab08, §3.1, pp. 11–12 | Coproduct, antipode, ribbon and framing directions checked. |
| QT.5/strong-flattening | [Neumann, math/0307092v2](https://arxiv.org/abs/math/0307092v2), Definition 4.4/Theorem 4.5, §4.2, printed p. 429 (PDF p. 17); Theorem 14.2, printed p. 465 (PDF p. 53) | Keep ordering and normal-path parity, not edge-log equations alone. |
| QT.7/generalized-quantum-modularity | [GZ, 2111.06645v3](https://arxiv.org/abs/2111.06645v3), §3.1, (3.6), p. 16 | Representation weight, c>0 and bounded denominator retained; conjectural status retained. |
| QT.7/cocycle-analytic-extension | GZ, §5.2, Conjecture 5.1/conditional Proposition 5.2, pp. 34–37; §5.4, pp. 40–42; p. 7 | Added Conjecture 5.4; retain both cut planes and distinguish analytic extension from algebraic composition. |
| QT.5/extended-pre-bloch | Neumann, Definition 2.2, §2, printed pp. 417–418 (PDF pp. 5–6) | Five independent sheet parameters with their relations and the transfer quotient retained. |
| QT.7/the-quantum-modularity-conjecture | GZ, §1, (1.5)–(1.6), pp. 10–11 | Negative-q convention, c>0 and all-orders bounded-denominator meaning retained. |
| QT.0/refined-kirby-calculus | [HabK, math/0509039v2](https://arxiv.org/abs/math/0509039v2), Corollary 5.1, §5, printed pp. 1309–1310 (PDF pp. 25–26) | Corrected which component is unknotted. |
| QT.3/definition-of-JM | Hab08, §10.2, Theorem 10.2, p. 35 | Convergent admissible surgery formula and Habiro-ring codomain retained. |
| QT.4/general-simple-lie-type | HL, Theorem 8.1, §8.1, p. 90; Theorem 8.8, §8.5, p. 94 | Distinguish q=ζ^(2D), strong Kirby lifts and the separately defined root-one value. |
| QT.3/JM-connected-sum-and-orientation | Hab08, Proposition 12.1, §12.1, p. 39 | Product uses the second manifold; reversal sends q to q⁻¹. Existing correction retained. |
| QT.7/coefficient-asymptotics | GZ, §3.4, (3.16)–(3.18), pp. 20–22 | Retain the phase discrepancy, distinct-action assumptions and conjectural status. |
| QT.0/hoste-move | HabK, §5, printed p. 1309 (PDF p. 25) | Unit-framed unknotted twisting component and admissible endpoints retained. |

Additional targeted reading included [AK, 1109.6295v2](https://arxiv.org/abs/1109.6295v2),
Theorems 4–5, pp. 9–11, §12, pp. 32–34, Appendix A, pp. 34–35 and
Appendix B, pp. 37–39; [GSW, 2305.14884v2](https://arxiv.org/abs/2305.14884v2)
for the geometric formal invariant; GZ §7.1, pp. 52–56 for descendants;
Hab08 §§11.1, 12.3.2 and 16.3; Neumann §3, printed pp. 420–421 for
flat nondegenerate simplices; and [BDH, 1409.7662v2](https://arxiv.org/abs/1409.7662v2),
§1, pp. 2–3, §3, p. 5, and §6, Theorem 6.1/Corollary 6.2, p. 21.
The AK contour/tail estimates remain explicit proof obligations; a printed
formal saddle calculation does not certify them. PDF page numbers above
were checked against actual page extraction, not the number of form-feed
characters in a text export.

## Duplication and pinned interfaces

Read two current upstream models, PeripheralActions and Completed
ContourIntegration, together with their suggested files. Checked the current
roadmaps, including the nine newer roadmaps and four Completed roadmaps,
and current Tau Ceti by mathematical object and hypotheses. The read-only
roadmap checkout is at `0d144d044dacebca17b654695b6f1ad58f159b27`; current
Tau Ceti is at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Also read the
relevant library-coverage audits: there is no ArithmeticQuantumTopology
entry in that file, so an absent row was not treated as evidence of absence.
Related Habiro, K₃/Bloch, polylogarithm and QSeries audits were used only as
search guides and checked against declarations and ownership statements.

No further duplicate target needed removal in this review. Earlier removals
of generic hyperbolicity and general Borel functional calculus remain in
force. The important distinctions checked were:

| Existing supplier | Why the retained target adds something different |
| --- | --- |
| GeometricTopology Layers 4–5; current framed braid and Gauss-code APIs | Link presentations and Dehn filling do not supply pairwise linking numbers, surgery homology or Kirby calculus. Unframed Markov equivalence forgets the framing witness. |
| Current Jimbo representation and weighted trace | These are finite representation shadows, not a universal completed ribbon Hopf algebra invariant. They are consumed unchanged. |
| Current `HyperbolicMetric.HasFiniteVolume`, `IsFiniteVolumeHyperbolic`, `IsMostowRigid`, `MostowRigidity`, upper-half-space metric | Existing carriers/predicates are retained. The cusped rigidity theorem, ideal regions and their volume require the named additional suppliers. |
| IntegralLattices 6A; LieHighestWeight and RootSystems | Ordinary lattice classification, PBW and highest weights are consumed. They do not construct the quantum Serre algebra, integral core or tilting quotient. |
| Current `LinearAlgebra/TensorCoalgebra/Completed.lean` | Its completed tensor words are a product over tensor lengths with deconcatenation. This is not the h-adic completed tensor product of modules used for topological ribbon Hopf algebras. |
| OperatorTheory/SelfAdjointSpectralTheory Parts B–E | General unbounded spectral theory is consumed. The p,q domains, Schwartz core and conjugate closure of p+q are additional targets. Hermite eigenfunctions alone do not construct that closure. |
| Completed OrthogonalL2Bases and current tensor-basis APIs | An L² tensor basis is not the Schwartz kernel theorem or a wavefront-controlled distribution contraction. |
| Pinned Mathlib local and tempered distributions | Their carriers and existing operations are consumed. They have different test spaces; the new normal wavefront topology is explicit and is not silently the library's default topology. |

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, read the declarations behind
the monoidal/braided/rigid category, `ExactPairing`, `HopfAlgebra`,
Chebyshev S, local/tempered distribution, Schwartz multiplication and
Bernoulli interfaces before relying on them. In particular,
`SchwartzMap.smulLeftCLM` requires the growth condition for its intended
action; its total definition outside that condition does not prove an
unqualified smooth-multiplier theorem. No build was run in the current
read-only checkouts.

## Lean and prose signature audit

Read all of Suggested.lean. `lean-check` on the final file exits **0** with
exactly **19 warnings**, all uses of `sorry`; all proved examples elaborate.
The file is 636 lines, below the 5,000-line limit. There are no admitted data
definitions or examples, no auxiliary theory development, and at most two
proved examples per retained definition. This is elaboration evidence, not
a proof of the admitted theorems. The following signature checks exceed the
required sample of ten:

| Declaration or group | README agreement and boundary checked |
| --- | --- |
| `IsAlgebraicallySplit`, `IsAdmissible` | Integer matrices; off-diagonal vanishing, diagonal ±1; empty matrix admissible, Hopf matrix not admissible. |
| `handleSlide_apply_self`, `linkingCokernel_handleSlide` | Distinct indices and congruence by I+E_ji; symmetry is needed for the diagonal formula, but not for cokernel invariance. A single slide need not preserve admissibility. |
| `FramingCheck.oneStrand`, negative control | Forgetting 0/1 framings gives the same unframed object and different admissibility. |
| Ribbon-category structure | Natural twist, balancing and dual compatibility are extra structure on the pinned monoidal/braided/rigid carriers. |
| Quantum integer and colour definitions | Balanced Laurent sum, [0]=0, [1]=1; Chebyshev S colour V₂=X²−1, not its dimension image. |
| Cyclotomic colours and quantum dimension | P₁=X−v−v⁻¹ has quantum dimension zero; rescalings retain their different denominators. |
| Cyclotomic coefficient/truncation | Products indexed n−i+1 through n+i; finite truncation stabilizes for N>n, including colour zero. |
| Casimir σ evaluation | i>n gives zero; no assertion that every σ_i is zero. |
| First divisibility factor | Evaluation at 1 is zero and first derivative is 6, matching the necessary first Ohtsuki coefficient divisibility. |
| Kirby colour | r=2 gives 1; r=3 gives 1+[2]X; top negligible label excluded. |
| Shape companions/product | z≠0,1 for the product −1; proved z=2 companion check retains a flat shape. |
| Flattening and extended boundary expression | Sum of log parameters is zero; transfer has zero wedge sum; no admitted quotient carrier is introduced. |
| `NZDatum` symmetry and Hessian | det B≠0 for inverse; integral Nahm input separately requires unimodular B and parity. A=0,B=1,z=1/2 gives Hessian 2 only as an algebraic test. |
| Cyclic dilogarithm | k=1 gives 1; k=2, ζ=−1 gives 1+x; inverse-root convention is explicit. |
| Raw Faddeev integral and parameter predicate | A total raw integral does not imply analytic continuation at b=0 or outside its strip. The unitary parameter includes the allowed unit-circle branch. |
| Charge and level definitions | Strictly positive a,c and 1/2−a−c; level phase period 8ℏ for ℏ>0. |
| Denominator cocycle | Two finite-action conditions in composition; λ_T=0, λ_S(1)=1, λ_(−γ)=λ_γ. |
| Matrix cocycle | Inverse J(γx) occurs on the left; J and the automorphy matrices are units on the stated domain; noncommutative composition order retained. |
| Descendant finite truncations/recurrence | Arbitrary commutative coefficient ring and unit q; the N=0 quotient/unit-ideal boundary is not mistaken for a nonzero evaluation. At q=−1, m=0 gives 5 and m=1 gives −3. |

## Adversarial mathematics pass

This table covers **every numbered subsection**, including definitions,
identities, conventions and theorem/conjecture interfaces within it.
“Retained” means the stated hypotheses and negative controls survived the
check, not that its formal proof has been supplied. Degenerate parameters
outside a constructor's domain are rejection tests, not evaluations of a
total Lean expression advertised as analytic values.

| Subsection | Instances, signs, denominators and interfaces tested | Result/change |
| --- | --- | --- |
| 0.1 | 0- and +1-framed unknot; Hopf matrix [[0,1],[1,0]] with determinant −1; Borromean pairwise linking zero; forget 0/1 framing. | Retained distinct framing and linking data. |
| 0.2 | Empty surgery gives S³ and zero H₁; matrix (0) gives ℤ, (2) gives ℤ/2; determinant ±1 needs closed oriented duality to get all homology groups. | Exact cokernel domain and prerequisites retained. |
| 0.3 | Empty diagonal matrix and diag(1,−1) pass; (2) and Hopf matrix fail. | Admissibility is stronger than determinant ±1. |
| 0.4 | Congruence PᵀAP with P=I+E_ji; a single slide of diag(1,1) creates off-diagonal entries; ±1 stabilization changes signature as stated. | Classical moves retained without an admissibility assertion. |
| 0.5 | Isolated ±1 unknot can be removed; a knotted unit-framed component is not the specified twisting circle. | Unknot and unit-framing conditions retained. |
| 0.6 | Opposite paired slides cancel their algebraic effect; one slide need not preserve splitting. | Band-slide calculus kept distinct from single slides. |
| 0.7 | Slide L_i over L_j; test which component must become an unknot before the two Hoste twists. | Corrected to L_j; undo auxiliary moves. |
| 0.8 | Empty sphere presentation; even unimodular form versus indefinite odd stabilization and diagonal ±1 form. | IntegralLattices classification consumed with stabilization hypotheses. |
| 1.1 | Symmetric category with identity twist passes; arbitrary natural automorphism without balancing/dual compatibility fails. | Ribbon structure retains both conditions. |
| 1.2 | R=1⊗1/r=1 cocommutative example; nonconvergent infinite R expression fails; distinguish completed tensor products. | Continuity and zero-convergence retained. |
| 1.3 | Classical h=0 limit; K versus K² in odd/even integral forms; PBW monomials and integral versus formal coefficient rings. | No identification of distinct forms or inverse-limit injections. |
| 1.4 | R modulo h is 1; V₁ has qdim v+v⁻¹; positive/negative framing uses r⁻¹/r. | Ribbon and antipode signs retained. |
| 1.5 | Unit and completed integral tensor powers; noncompleted form need not contain structure-map images. | Completion and braided transmutation hypotheses retained. |
| 1.6 | Empty and one-component bottom tangles; closed component fails definition; two arbitrary bottom tangles cannot be vertically stacked. | B-action distinguished from tensor juxtaposition. |
| 1.7 | Empty graph 1, straight strand id, crossing followed by inverse id; a crossing alone need not square to id. | flip∘R, pivotal trace and framed domain retained. |
| 1.8 | Trivial bottom tangle unit; Hopf tangle nonunit; positive kink r⁻¹ and negative kink r cancel. | Ordered bead multiplication and framing retained. |
| 1.9 | U_h(sl₂) specialization; trivial ribbon structure gives no knot separation; closing uses pivotal quantum trace. | General complete-base target retained. |
| 1.10 | Zero-framed split unknot passes; nonzero framing and nonsplit Hopf link do not meet the theorem's hypotheses. | Even integral image and algebraic splitting retained. |
| 1.11 | Dual clasp bases pair by δ_ij; an intrinsic basis vector is outside hX; arbitrary closure coordinates paired with zero-convergent X coordinates. | Corrected topology and convergence explanation; added negative control. |
| 1.12 | Rank-one sl₂; a_ij=0 gives commuting roots; G₂ long-root d_i=3; transpose Cartan convention. | Root-length factors and F-weight sign retained. |
| 1.13 | Zero PBW multi-index has weight 1; positive root weight contains √((q;q)_n), unlike unweighted Lusztig lattice. | Weighted core and coefficient extension retained. |
| 1.14 | Odd/even root order gives different l′; root below stated bound rejected; negligible identity disappears in quotient. | Tilting and base-field conditions retained. |
| 2.1 | [0]=0,[1]=1,[2]=v+v⁻¹; v=1 gives dimensions; V₁⊗V₁=V₂+V₀. | Laurent sum avoids 0/0 and colour remains an independent variable. |
| 2.2 | Unreduced unknot V₁ gives [2], +1 framing gives q^(3/4)[2]; split union multiplies. | Reduced/unreduced and framing normalizations retained. |
| 2.3 | Trefoil at q=2 gives 9/16 versus bracket V(2)=−6; mirror exchanges the values. | Inverse-variable comparison retained. |
| 2.4 | P₀=1, P₁=X−v−v⁻¹; P′₁ and P″₁ have different denominators. | Rescalings not conflated; rational colours formed before specialization. |
| 2.5 | σ₀=1; σ₁=C²−q−2−q⁻¹; σ_i annihilates V_n for i>n. | Completed even center retained. |
| 2.6 | Pair σ₀,σ₁ with P″₀ to obtain 1,0; unscaled pairing has quantum-binomial factors. | Exact dual normalization retained. |
| 2.7 | Unknot expansion only σ₀; pairing recovers ordinary colours at finite truncations. | Coefficient integrality retained as a theorem. |
| 2.8 | n=1 uses only a₀=1; congruence ideal is nonzero and cannot be replaced by equality. | n≥1 and ideal retained. |
| 2.9 | N=0 truncation zero; N=1 recovers V₀; N=2 gives [2]+{3}{2}a₁ for V₁. | Truncate before root evaluation; no division by a vanished quantum dimension. |
| 2.10 | Product P′₁P′₁ has two rescaling-dependent coefficients; twist has infinitely many coefficients. | Algebra and its completion remain different. |
| 2.11 | Unit in colour P₀ traces to 1; mismatched PBW degrees trace to zero; arbitrary fractional colours need not be integral. | Colour-domain restriction retained. |
| 2.12 | One-component unlink gives divisibility; nonsplit Hopf link fails the splitting input; increasing filtration gives convergence. | Zero framing and algebraic splitting retained. |
| 2.13 | Arbitrary factorial series has no assigned knot; Hopf link is not a bottom knot expansion. | No converse topological realization promised. |
| 2.14 | Unknot and order one give 1; inverse-parameter product gives (−1)^n q^(−n(n+1)/2)(q;q)_n². | Sign, unit q and doubled factorial divisibility retained. |
| 2.15 | Figure-eight orders 1–6: 1,5,13,27,46+2√5,89; ζ₅↦ζ₅² gives 46−2√5; α↦α+1 unchanged. | Dimension-N reduction and Galois equivariance retained. |
| 3.1 | Pair ω± with V₀ gives 1; ω+ω−=1; surgery sign f inserts ω^(−f). | Completion and inverse twist sign retained. |
| 3.2 | Isolated ±1 surgery with no remaining components gives 1; opposite twists cancel; knotted surgery component excluded. | Unknot/unit-framing and convergence hypotheses retained. |
| 3.3 | Empty link and ±1 unknot give J_(S³)=1; nonadmissible link has no declared formula. | Factorial convergence required, no larger manifold domain. |
| 3.4 | Empty and +1-unknot presentations agree; arbitrary classical intermediate link may leave the formula's domain. | Refined calculus retained as the actual independence input. |
| 3.5 | J_(S³)−1=0; divisor has first Taylor term 6(q−1). | Stronger divisibility not inferred without its extra order-six input. |
| 3.6 | S³ is multiplicative unit; M#(−M) gives product under q↦q⁻¹. | Product uses both manifolds and orientation involution. |
| 4.1 | r=2 gives V₀; r=3 gives V₀+[2]V₁; V_(r−1) is absent. | Negligible top weight excluded. |
| 4.2 | Empty surgery and root one give 1; ±1 split unknots cancel different nonzero Gauss factors. | Root-one convention separate from colour quotient. |
| 4.3 | S³; even-order and non-prime-power roots, not just odd primes. | All-root comparison retained for integral homology spheres. |
| 4.4 | Algebraic integers versus arbitrary field elements; conjugating primitive root changes the value equivariantly. | No pointwise Galois invariance or unchecked rational-homology extension. |
| 4.5 | Finite root set killed by nonzero cyclotomic product; orders 2^n suffice by adjacency; 1–2–6 chain does not make 1 and 6 adjacent. | Exact Habiro uniqueness input retained. |
| 4.6 | If first possible nonzero integer coefficient is divisible by every odd prime, it is zero; p-adic evaluation requires convergence. | All odd primes, integral coefficients and induction retained. |
| 4.7 | S³ Taylor series 1; candidate 1+(q−1) fails divisibility by 6. | Ohtsuki characterization retained without an unsupplied Casson comparison. |
| 4.8 | Rational cyclotomic completion splits across orders; one Taylor component forgets others. | Integral determination not transported to arbitrary completions. |
| 4.9 | 2-framed unknot gives L(2,1) with H₁=ℤ/2. | Outside integral-homology-sphere domain; no false extension. |
| 4.10 | v² and K_α² have identity degree; tensor length zero retains central two-element group; A₂ anticommuting generators detect sign. | Nonabelian parity group retained. |
| 4.11 | K₀=ℤ[q±1], completion Habiro ring; odd v excluded; (q;q)_k vanishes at root order r when k≥r. | Filtration, grading and convergence retained. |
| 4.12 | Trivial colour qdim 1; sl₂ [n+1]; sl₃ fundamental [3]→3 at v=1. | Weyl dimension specializes without using a literal 0/0. |
| 4.13 | Small roots fail bound; odd A_ℓ with ord ζ≡2 mod4 has vanishing full Gauss sum. | Strong-colour exclusions and separate ξ=1 convention retained. |
| 4.14 | At r=3, V₂ has zero qdim and negligible identity; multiplication by 2 on integral rank-one trivial module is mono/epi but not invertible. | No abelian semisimplicity before the declared base change. |
| 4.15 | Separate positive/negative Gauss denominators; lift changes at admissible ξ; outside Z_g∪Z_Pg no conventional equality asserted. | Nonvanishing and admissible lift domain retained. |
| 4.16 | sl₂ recovers Layer 3; ξ=1 gives 1; other evaluations extend root-value function without analytic continuation. | Every simple Lie algebra target and restrictions retained. |
| 5.1 | z=i sign under first-vertex exchange; z=2 gives companions −1,1/2 and volume 0; z=0,1 rejected. | Fixed flat/nonflat definition and added proved negative control. |
| 5.2 | Two regular tetrahedra give figure-eight volume; cusp multiplier 2 is incomplete; regular refinement needs heights and no new interior vertices. | Orientation and flat-nondegenerate refinement qualifications retained. |
| 5.3 | Figure-eight complete solution; negative imaginary shape fails positive chart; cusp translation w↦w+1 has multiplier 1 but is not identity. | Completeness is not trivial holonomy; logarithmic branches retained. |
| 5.4 | Principal regular flattening gives (πi/3,πi/3,−2πi/3); sum zero; w₀ alone does not fix the sheet/shape data. | Full log triple retained. |
| 5.5 | Transfer [z;1,1]+[z;0,0]−[z;1,0]−[z;0,1]=0; arbitrary sheets violating p₂=p₁−p₀ rejected. | Lifted relation and transfer quotient retained. |
| 5.6 | Zero class lies in kernel; at z=1/2 changing p produces πi∧log 2, nonzero. | Boundary detects sheets and respects transfer. |
| 5.7 | Forget sheets recovers ordinary five-term relation; arbitrary unflattened move cannot be lifted. | Flattening compatibility retained. |
| 5.8 | Edge sums zero but odd normal-path parity fails; unordered triangulation can lose C₆ information. | Strong, ordered flattening target retained. |
| 5.9 | Figure-eight projects to 2[z₆]; full extended class needs cusp-compatible flattening; positive volume excludes zero class. | No unjustified double principal lift. |
| 5.10 | At z=1/2 principal R=−π²/12; p↦p+2 adds −πi log 2, not a real period. | Constant, sheet term and ℂ/π²ℤ target retained. |
| 5.11 | R=iVol−CS; orientation reversal changes signed class; figure-eight imaginary part 2D(z₆). | Neumann versus GZ complex-volume sign retained. |
| 5.12 | 1−z₆=z₆⁻¹ makes exterior boundary of 2[z₆] zero; numerical approximate shapes do not define a number field. | Embedding, torsion and factor-two convention comparisons retained. |
| 5.13 | Figure-eight supplies hyperbolic/geometric/algebraic data; trefoil fails hyperbolicity. | Knot diagram alone does not supply Bloch class. |
| 6.1 | det B=0 and z=1 rejected; A=0,B=1,z=1/2 yields Hessian 2 but no manifold witness. | Algebraic versus geometric datum and nondegeneracy retained. |
| 6.2 | Constant term 1; odd √h moment zero; changing DG/GSW ψ without exp(h/12−x√h/2) changes coefficients. | Gaussian normalization retained. |
| 6.3 | Regular Epstein–Penner refinements allow flat z≠0,1; arbitrary representation triangulations need not be connected. | Geometric formal invariance not generalized beyond its hypotheses. |
| 6.4 | B invertible rationally need not be unimodular; rewrite z″=−(1−z)/z to check parity sign. | Symmetric integral N and parity are separate required hypotheses. |
| 6.5 | k=1,2 cyclic products; weights (1,2) give 4/3, not 1; S=0 rejected; repeated shapes forbid independent rotations. | Radical choice, actual Kummer subgroup and primitive-root phase retained. |
| 6.6 | Constant term 1 and odd moments zero; two cubic vertices contribute at h¹. | n=0,j=3 vertex retained; omitted-source-block correction preserved. |
| 6.7 | Repeated roots/shape relations restrict actual Galois action; τ^(2k) removes root/sign ambiguity. | Arithmetic descent distinct from topological/asymptotic identification. |
| 6.8 | δ square yields full B≅R×R; selecting one factor loses a projection; figure-eight fourth root outside base field; bad root orders excluded. | Named full finite étale comparison gap R2; general target retained. |
| 6.9 | b=2 versus 1/2 self-duality; b=1 gives Φ₁(0)²=exp(iπ/6); b=0 and strip boundary excluded. | Contour prescription and zero/pole signs retained. |
| 6.10 | b=1 gives ℏ=1/4; b=exp(πi/3) gives ℏ=1; b=i and 2i fail admitted parameter conditions. | Both real and unit-circle branches retained. |
| 6.11 | Gaussian commutator (2πi)⁻¹; (1+|x|)⁻¹ in L² but outside position domain; derivative of exp(iπx²) fixes p+q conjugation. | Common core and closure not replaced by a bounded-operator claim. |
| 6.12 | Bounded unitary functional calculus on closures, not multiplication of unbounded expressions from a formal commutator. | Standard Schrödinger representation and admitted b retained. |
| 6.13 | Im z=−π reaches inverse-integrand pole; b=1 gives ℏ=1/4; χ₅₂(0)=exp(−iπ/3)g₃. | Pole-free contour and exact phase retained. |
| 6.14 | b→0+ decay has negative volume; compare to positive Kashaev growth; stationary phase needs tail and contour estimates. | Qualified analytic theorem, no automatic volume-conjecture proof. |
| 6.15 | Regular charges 1/6; gauge g=1/6 gives angles π/2,π/6, while g=1/3 reaches zero; vertex-deleted H₂ counterexamples. | Strict positivity, admissibility and level-shift conditions retained. |
| 6.16 | δ₀² forbidden; smooth tempered factors can have non-tempered product; kernel 1 differs from δ(x−y); constant contraction diverges. | Local/global carriers and enlarged-test-space estimates retained; topology locator corrected. |
| 6.17 | a=c=1/6 gives third charge 1/6; support on x₀+x₂=x₁; a=0 outside positive domain. | Charged phase, support and strict inequalities retained. |
| 6.18 | Five charge equations and P_e phase; omitting phase breaks equality; kernel product needs extension estimates. | Charged pentagon scalar retained for level cancellation. |
| 6.19 | Level +8ℏ phase 1, +4ℏ phase −1; ℏ=1 needs unit-circle parameter; δ₀² contraction excluded. | Full parameter domain, correct period and empty-boundary scalar output retained. |
| 6.20 | Vertex-deleted H₂=0 prevents repeated Dirac constraints; inadmissible composite or arbitrary vertex-adding move outside theorem. | Qualified categroid composition/invariance retained. |
| 7.1 | Ten named knots include 5₂ and exclude 7₂; positive-q bounded-denominator error estimates versus negative-q conventions. | Theorem scope and table correction retained. |
| 7.2 | Figure-eight one-loop constant 3^(−1/4); 5₂ requires Im ξ<0 root of ξ³−ξ²+1. | Branch and leading normalization retained. |
| 7.3 | Finite formal coefficient list provides no uniform O-error; positive-q BD ratio theorem has separately matched normalization. | Formal versus analytic distinction retained. |
| 7.4 | Trivial representation weight 3/2 and action 0; figure-eight has 3 selected representations, 5₂ has 4; degenerate saddle rejected. | Actual representation family and one-loop domain retained. |
| 7.5 | T has c=0 and lies outside asymptotic conjecture; S at integers gives volume specialization; possible zero J handled without division. | c>0, bounded denominator and undivided error statement retained. |
| 7.6 | Reduced before root evaluation; log growth uses 2π/N and positive root; AK limit has opposite decay sign. | General volume conjecture not promoted to theorem. |
| 7.7 | λ_T=0, λ_S(1)=1; x=0 pole for S; γ and −γ agree; composition needs both finite images. | Cocycle domain and sign retained. |
| 7.8 | σ₀ recovers weight 3/2 case, nontrivial σ weight 0 retains action twist; cX+d eventually positive. | Generalized relation remains conjectural. |
| 7.9 | h=0 recovers value relation; exact Möbius infinitesimal coordinate fixes h* denominator; rational asymptotics cannot simply be differentiated. | Coefficientwise conjectural error criterion retained. |
| 7.10 | Figure-eight anti/geometric relation cancels by i²=−1; adding trivial representation spoils relation. | Selected formal cancellation separated from general/5₂ conjecture. |
| 7.11 | Coincident actions invalidate inverse action-difference powers; 2π versus 2πi changes phase. | Distinct actions, branches and unresolved source phase retained. |
| 7.12 | Scalar completed row has negative weight factor; printed positive matrix weight requires comparison; singular J not invertible. | Matrix normalization/invertibility remain explicit conjectural targets. |
| 7.13 | J=j̃=I gives I; AB≠BA for elementary 2×2 unipotents; singular J fails GL-valued constructor. | Left inverse and noncommutative composition order retained. |
| 7.14 | S exceptional point 0 and opposite cuts for two half-lines; c=0 no finite exceptional point. | Algebraic cocycle does not establish analyticity; explicit Conjecture 5.4 locator added. |
| 7.15 | q=1 gives 1; q=−1 gives 1+4(−1)^m; cube root gives H₀=13; Q₂ Taylor coefficient −1/2. | Recurrence and integral/rational Habiro distinction retained. |
| 7.16 | General three-part AK comparison needs limits/existence; 4₁/5₂ explicit χ phases and negative volume limit survive. | Selected proved cases distinct from general conjecture and NZ identification. |
| 7.17 | H₀ integral but Q₂ not; formal NZ coefficients alone do not imply any Habiro membership. | Proved comparisons and missing R2 distinguished. |
| 7.18 | Figure-eight orders agree with Layer 2; order-two values 5 and 7 for 4₁/5₂; fields quadratic/cubic; unknown cells stay empty. | Status and source-target ledger data retained. |

## Validation and handoff

- `lean-check` on the final Suggested.lean: exit 0; exactly 19 warnings,
  all uses of `sorry`; all proved examples passed.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticQuantumTopology.json`:
  106 nodes; 0 errors, 0 warnings. The packet was checked without editing it.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/ArithmeticQuantumTopology/Suggested.lean`:
  exit 0.
- `python3 research/blueprint/intake.py check-files` on the four changed
  deliverables: 4 files, 0 problems.
- `git diff --check`: exit 0.

This report is also the self-contained handoff, within the issue's allowed
paths. Resume with R2 in HabiroNumberFields Layer 3 and HabiroNahmSeries §6.4,
and R3 at the roadmap ownership/order level. Once those are supplied, recheck
ArithmeticQuantumTopology §6.8 and the exact contracts; do not narrow B or
drop root-refined or matrix targets to obtain acceptance. R1 needs no further
package-level geometric target. All local fixes above are complete.

No suspicious instruction was encountered in the untrusted sources or other
workers' text. No source text or restricted library file was copied into the
repository. No subagents were used: the specifically permitted Haiku/Sonnet
agent models are unavailable in this environment. No claim of formalization
is made. Stop after this one review and its pull request.
