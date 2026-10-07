# RT-AREA-topology, fix round 4

Job `FIX-RT-AREA-topology~4`, issue #6520. Codex, session `codex-BLPWxk`,
7 October 2026. Base `c42baa36`. The bot confirmed the claim in comment
6036646206. This is a completed **fix job**, with the consumer and upstream
handoffs required by the issue; it does not assert that the three roadmaps are
mathematically closed or formalised.

The inputs are the [confirmed findings](RT-AREA-topology.result.json), their
[verification](RT-AREA-topology.review.json), the [round-three report](RT-AREA-topology.fixes-3.md)
and [round-three review](../reviews/REV-FIX-RT-AREA-topology~3.md). Every one of
the 27 findings assigned to this issue is accounted for below.

The issue's generated description says round three could not edit the finished
blueprints. The actual round-three report and review establish a more specific
starting point: the Polylogarithms reader was synchronised and accepted, and the
Habiro supplier corrections were already accepted. I checked the current files
rather than repeating those changes. The newly available QSeries packet also
already contains the shared QM.5 definitions and examples, but its exports and
knot boundary needed an explicit contract.

## Changes in the finished supplier blueprints

### /7: Polylogarithms owns the ideal-tetrahedron formula

`Polylogarithms:P.2/hyperbolic-volume` remains the single owner of the oriented
ideal-tetrahedron identity `vol I(x₁,x₂,x₃,x₄) = D(r(x₁,x₂,x₃,x₄))`, with its
stated cross-ratio and sign convention. QT.5 imports it and owns summation over
a geometric ideal triangulation and the manifold Bloch invariant. It does not
supply the formula to P.2.

I added the following **existing stage IDs** to this node's prerequisites and
the reader's corresponding Depends-on line:

- `tauceti:TauCetiRoadmap/GeometricTopology#layer-7-riemannian-geometric-structures-and-volume`
- `tauceti:TauCetiRoadmap/GeometricTopology#layer-8-thurston-geometries-and-the-jsj--geometric-decomposition`

The suggested Lean comment now records that these are explicit prerequisites.
Round three could encode them only as structured requests because the checker
mistook their `tauceti:` prefix for a baseline declaration. The current checker
resolves existing stages first, and both prerequisites now validate. Both
requests remain: layer 7 supplies Riemannian metric/measure foundations, layer 8
the hyperbolic model and its isometry action. Neither request claims that these
layers already supply ideal-boundary geometry or the Milnor integration proof.

The early ideal-boundary/oriented-tetrahedron/finite-region-volume extension
and its gap remain explicit. The assembled reader also records the separately
reviewed P.2 follow-up, including `P.2/milnor-angle-volume`, and distinguishes
that argument from the still-missing geometric carrier. I did not erase the
base packet's historical coverage and gaps, edit the part packet, or turn an
ambient-volume import into a proof of Milnor's formula. The later cusped-manifold
extension must follow this early geometric prefix to avoid making P.2 depend
on its QT.5 consumer.

### /11: Habiro supplies the formal and analytic tools once

The packet and suggested file already implement the accepted owner split. The
HB.10 knot-matrix node constructs formal Nahm data, with the figure-eight,
`5₂` and `(-2,3,7)` matrices of GSWZ Remark 4.2. It makes no claim of topological
invariance, independence of triangulation, a Chern–Simons identification, or
quantum modularity. QT.5 supplies the geometric dictionary; QT.6 and QT.7 are
consumers, not prerequisites of HB.10. The reader gives the same boundary.

The existing `HabiroNahmSeries:HB.10/export-interfaces-and-non-consequences`
application names the six precise exports to QT.6. These were checked and
preserved, including the following restrictions:

| Export (prefix `HabiroNahmSeries:`) | What the consumer must retain |
|---|---|
| `HB.4/euler-maclaurin-with-remainder` | Integrable derivatives vanishing at infinity, shift reduction and the uniform remainder estimate. |
| `HB.4/formal-gaussian-integration` | A symmetric invertible Hessian over a rational algebra and the stated formal completion. This construction does not require positive definiteness or a measure. |
| `HB.4/radial-asymptotic-expansion` | Positive-definite analytic Nahm data, radial approach, odd root order coprime to the denominator, branch choices and the all-orders remainder. Retain the packet's corrections to the printed GZ formula. |
| `HB.8/fgi-collection` | Symmetric integral matrix, the t-deformed solution, regularised factors, residue-class periodicity and its proof. |
| `HB.8/identification-theorem` | The precise Laurent/power-series coefficient ring and coprimality of the auxiliary root orders; the formal equality is not knot invariance. |
| `HB.9/module-membership` | A chosen non-degenerate solution, its Bloch index, inverse square root of the discriminant, coefficient extension and orders prime to the excluded integer Δ. It gives module membership, not scalar Habiro-ring membership without an additional zero/torsion/symmetrisation argument. |

The figure-eight matrix `[[1,1],[1,1]]` kills `(1,-1)`, so QT.6 cannot apply the
positive-definite analytic theorem to it. The formal route can still have an
invertible Hessian at its chosen non-real solution. GSWZ's NZ-to-Nahm dictionary
also retains the unimodular/integrality hypotheses on `B`; no general existence
of a suitable quad choice was inferred.

No correction to the accepted packet or non-comment Lean was needed. I corrected
the reader's stale opening inventory (74 nodes had become 109) and its claim
that closure means Lean. It now gives the current packet counts and `partial`
status, distinguishes source decomposition from closure, and keeps implementation
status `unchecked`. The packet and suggested file are byte-identical to the base.

### /13: QM.5 supplies the definition and shared q-series examples

The current QM.5 packet already owns Zagier's weak quantum-modular predicate,
the terminating Kontsevich function, the strange identity, its twisted-L-value
formula and scalar transformation theorem, and the Lawrence–Zagier
Poincaré-sphere WRT/false-theta, radial-limit and Ohtsuki examples. I did not
create a second definition or copy their proofs into QT.7.

I gave eight existing nodes an explicit `uses` contract for
`ArithmeticQuantumTopology:QT.7` (refining the existing use on the definition).
The reader has the same eight IDs and contract strings:

- `QSeriesPartitionsAndMockModularForms:QM.5/quantum-modular-form`
- `QSeriesPartitionsAndMockModularForms:QM.5/kontsevich-strange-series`
- `QSeriesPartitionsAndMockModularForms:QM.5/kontsevich-value-formula`
- `QSeriesPartitionsAndMockModularForms:QM.5/kontsevich-quantum-modular`
- `QSeriesPartitionsAndMockModularForms:QM.5/lawrence-zagier-radial-limit`
- `QSeriesPartitionsAndMockModularForms:QM.5/lawrence-zagier-ohtsuki-expansion`
- `QSeriesPartitionsAndMockModularForms:QM.5/poincare-sphere-unified-invariant-radial-limit`
- `QSeriesPartitionsAndMockModularForms:QM.5/poincare-sphere-quantum-modular`

The revised packet restructuring proposal, reader proposal/export table and
suggested Lean comment agree on the split. QT.7 owns the Kashaev modularity
conjecture, the Garoufalidis–Zagier matrix-valued cocycle and separately sourced
proved knot cases. Identification of Kontsevich's values with a trefoil Kashaev
invariant requires QT.2/QT.7 to prove colour, orientation and normalisation
comparisons. QT.4 supplies the exact normalised WRT, Ohtsuki and unified-invariant
formulas; QM.5 owns their analytic comparison. Formal root-of-unity evaluation
alone is not an analytic radial-limit theorem.

Zagier's *Quantum modular forms*, Example 5, explicitly places its knot cocycle
outside the real-analytic definition used in Examples 1–4. QT.7 must therefore
state the actual asymptotic or matrix-valued law. Its name does not establish
`IsQuantumModularForm`. This distinction is now explicit in all three edited
supplier files. The existing analytic, character/multiplier-extension and
finite-Weil-image gaps remain; the exported scalar theorems carry those proof
obligations.

The direction is **QM.5 → QT.7**, with QT.4 → QM.5 retained. The issue prohibits
editing the unfinished consumer packet or adding a link-file deliverable, so the
new consumer prerequisite is handed to BP-ArithmeticQuantumTopology. The
supplier-side `uses` and restructuring proposal do not themselves create a live
atlas edge. No inert packet `links` field was used to pretend otherwise.

## Consumer handoffs: /1–/16

The issue expressly assigns the ArithmeticQuantumTopology side to
**BP-ArithmeticQuantumTopology** and prohibits writing its packet here. Its
current partial material does not replace a completed consumer plan. These are
authorised handoffs, not claims that the missing consumer proofs have been done.
The three finished suppliers above have been corrected or checked in place.

| Finding | Consumer and required work |
|---|---|
| RT-AREA-topology/1 | **QT.0:** keep LI.0, replace the irrelevant LI.4 input by GeometricTopology layers 1, 4 and 5, and reuse pinned framed oriented link/diagram types. Build only the framed-tangle/bottom-tangle category and linking-matrix transformations. Lickorish–Wallace existence and Kirby/Fenn–Rourke calculus extend layer 5; propose **GeometricTopology, Part II: surgery calculus**, or explicitly mark a local extension with layer 5 first. Import the shared manifold-orientation convention. |
| RT-AREA-topology/2 | **QT.0/QT.3:** name admissible surgery presentations for integral homology spheres and Habiro's refined Kirby/Hoste theorem. State invariance under isotopies and Hoste moves of algebraically split ±1-framed links, using Habiro 2008 Theorems 9.4, 10.1 and 10.2. Ordinary Kirby moves leave that class. Alternatively choose Habiro §11's RT-plus-rigidity route and explicitly make QT.4's RT construction an input of QT.3. Record the chosen route and source the refined calculus from math/0509039. |
| RT-AREA-topology/3 | **QT.1–QT.3:** import existing braided/rigid-category and Hopf-algebra APIs; supply the missing pivotal, balanced, ribbon and quantum-trace structures. Add the h-adic `U_h(sl₂)`, R-matrix, ribbon element, Habiro even integral form/completions, braided Hopf structure, bottom-tangle invariant and centre. QT.2 constructs `P`, its completion and the Hopf-link pairing, with Theorem 8.2/Corollary 8.3. QT.3 constructs the twist ω and Theorem 9.4. Source math/0505219 and math/0605313 and the root-of-unity RT/Kirby–Melvin construction. |
| RT-AREA-topology/4 | **QT.4:** either supply Drinfeld–Jimbo quantum groups, integral forms, representations and ribbon/RT data for general simple Lie type before this target, or narrow the target to sl₂ and scope the general case later. Use Habiro–Lê, *Geom. Topol.* 20 (2016), no. 5, and transcribe its exact root-order restrictions rather than inferring them from the abstract. |
| RT-AREA-topology/5 | **QT.2:** import GeometricTopology layer 4's link type and Jones polynomial. Prove the two-dimensional-colour comparison with explicit `q^(1/2)`/`A` substitution, sign, framing and unknot normalisation. The existing Temperley–Lieb representation does not itself supply a Markov trace. Masbaum's twist-knot route can be a separately sourced comparison. |
| RT-AREA-topology/6 | **QT.5:** import K3BlochGroups V.3, V.4 and V.6, Polylogarithms P.1–P.2 and GeometricTopology layers 5, 7 and 8. Drop QT.0 and V.5 unless a named test actually needs them. P.1–P.2 supply D, the five-term identity and the weight-two regulator; V.3/V.4/V.6 supply the groups, Suslin sequence and certified Bloch elements. |
| RT-AREA-topology/7 | **QT.5:** cite `Polylogarithms:P.2/hyperbolic-volume` and add P.2 → QT.5. Own only the positively oriented geometric-triangulation volume sum and `D(β(M)) = Vol(M)`, with Neumann–Yang as source. **Supplier change made here:** the two geometric stage prerequisites are explicit; the early geometry gap is retained. |
| RT-AREA-topology/8 | **QT.5 and maintainer/design:** propose **GeometricTopology, Part II: cusped hyperbolic 3-manifolds and ideal triangulations**, after the early ideal-geometry prefix used by P.2. Import layers 5, 7, 8 and 11; source finite-volume interiors, cusps, Mostow–Prasad, face-pairings, shapes, Thurston gluing/completeness and Epstein–Penner. If QT.5 temporarily carries these extension nodes, layer 7 must be first and the extension explicit. Add Neumann–Zagier and Neumann–Yang. |
| RT-AREA-topology/9 | **QT.5:** source the extended pre-Bloch/Bloch relations, flattenings, extended Rogers function, its descent, the cusped Chern–Simons normalisation and Neumann 2004's comparison with complex volume. Import the connection through GeometricTopology layer 7/HopfRinow and K3BlochGroups V.4 for `K₃^ind`. Keep the earlier real-volume statement independent of this extension. |
| RT-AREA-topology/10 | **QT.6:** build the NZ datum and symplectic property, rooted Dimofte–Garoufalidis series and independence of triangulation/auxiliary choices. Prove the `A_Nahm = I − B⁻¹A` dictionary under its unimodular/integral-`B` hypotheses, then apply the exact HB.8/HB.9 exports and HabiroNumberFields HB.7 coefficient-module interface. Retain Δ, discriminant extension and Bloch index; the figure-eight has ξ = 2[ζ₆]. Source NZ 1985, DG/DG2, Garoufalidis–Storzer–Wheeler and GSWZ §1.8. A matrix recipe alone is not a topological invariance proof. |
| RT-AREA-topology/11 | **QT.6:** import the six exact Habiro exports in the table above, preserving the analytic/formal distinction and every hypothesis. QT.6 owns the knot identification, invariance, contours, Faddeev integrand and state-integral 2–3 analysis; QT.7 owns knot modularity. **Supplier disposition here:** accepted HB.10 formal-only contract preserved; reader inventory/status corrected. |
| RT-AREA-topology/12 | **QT.2/QT.7:** define the Kashaev invariant using the fixed N-dimensional colour and root evaluation, export its cyclotomic/Habiro lift, and compare or explicitly exclude the original R-matrix definition via Murakami–Murakami. Add QT.2 → QT.7. State the volume and Kashaev modularity conjectures as conjectures. Source and verify the precise knot/limit hypotheses of each requested proved case and Bettin–Drappeau's modularity theorem; do not promote a conjecture to a theorem for arbitrary knots. |
| RT-AREA-topology/13 | **QT.7:** import the eight exact QM.5 nodes above, add QM.5 → QT.7 and record the same owner split in its reader. Own the knot conjectures, matrix cocycle (Garoufalidis–Zagier, *SIGMA* 20 (2024), 055) and sourced proved cases. **Supplier change made here:** export contracts, discontinuous-cocycle boundary and prospective edge direction agree across packet, reader and suggested comments. |
| RT-AREA-topology/14 | **QT.6 and common-toolkit owner:** define Faddeev Φ_b and the sourced Andersen–Kashaev integrand, contour, convergence and 2–3 invariance. Label the state-integral/GSWZ perturbative comparison with its actual conjectural status. Route the formal quantum-pentagon identity once to HabiroCyclotomicCompletions HC.1, with HS.2 and QT.6 as consumers; do not rebuild it in both. |
| RT-AREA-topology/15 | **QT.7:** define the resurgence/summability inputs from Écalle or Mitschi–Sauzin and state the GGM conjectures for 4₁ and 5₂ precisely, or remove resurgence from the targets and name it as a non-goal. A generic aspiration is not an acceptance test. |
| RT-AREA-topology/16 | **QT.2 follow-up:** record the two-variable coloured Jones invariant, MMR expansion, the `q=1` inverse-Alexander identity and the Garoufalidis–Wheeler lift/Conjecture 7.4 consequence, requiring QT.2, HabiroRings HR.1 and GeometricTopology layer 4's Alexander supplier. Source Habiro §7.1/Proposition 7.2, Bar-Natan–Garoufalidis and Rozansky. Keep Bouis–Gazda out of scope as PLAN-HABIRO D7(iii) requires. |

The other jobs named by the issue receive these same supplier obligations:

| Job | Finding and handoff |
|---|---|
| `BP-Polylogarithms--P.2` | /7: retain the tetrahedron owner, the sign/cross-ratio convention, the early geometric prerequisite boundary and QT.5's manifold-level consumer role. Its reviewed part now exists; no part-packet edit was made here. |
| `BP-HabiroNahmSeries--HB.4` | /11: use the six-export table for the HB.4 analytic/formal boundary; the figure-eight is not positive definite. No part packet was written. |
| `BP-HabiroNahmSeries--HB.10` | /11: retain formal knot-matrix examples and forbid inferring topological invariance or quantum modularity from module membership. No part packet was written. |
| `BP-QSeriesPartitionsAndMockModularForms~2` | /13: retain QM.5 ownership and the exact contracts; resolve analytic/character/Weil proof gaps through their own source-reading and supplier jobs. This fix does not resolve unrelated findings in the packet's existing review. |

## upstreamNotes: /23, /24, /26, /29, /33, /81, /82, /87, /91, /103, /105

These eleven findings concern Tau Ceti's own roadmaps. WORKERS and PROTOCOL
§§10, 15 and 17 forbid swarm replanning or fixes there. Their roadmap documents,
`data/`, generated atlas extracts and links between two Tau Ceti roadmaps were
not changed. The following are exact maintainer actions, with the atlas-side
consumers named. No declaration absence below is a new blanket search claim;
these are the verified findings and required supplier contracts.

### RT-AREA-topology/23 — relative homotopy without an NDR restriction

Delete the NDR/cofibration condition on the **definition** in AlgebraicTopology
8.1. Define relative homotopy for every based pair: a pointed set at n=1, a
group at n≥2 and an abelian group at n≥3, with induced and boundary maps and
the long exact sequence. Retain NDR/CW conditions only in results that use them,
such as relative Hurewicz, compression and excision. Add Hatcher Theorem 4.41,
`π_n(E,F,x₀) ≅ π_n(B,b₀)` under disk homotopy lifting, as the Stage-8 export to
StableHomotopyKTheory H.2, or explicitly state that H.2 proves it from that
based-pair interface. The StableHomotopy blueprint job must import the chosen
contract. It is not an input of the three edited suppliers here.

### RT-AREA-topology/24 — one convergent chain-level spectral sequence

Correct the AlgebraicTopology inventory: the pinned baseline has
`SpectralObject`, `HasSpectralSequence` and the homotopy-category spectral
object, rather than the claimed exact-couple package; a convergence theorem is
still required. Before item 4.3, choose one owner for bounded-below exhaustive
filtered chain complexes and first-quadrant double complexes, providing
E⁰/E¹/E² identifications, strong convergence to the associated graded of the
induced homology filtration, edge maps and naturality, with the precise
boundedness/filtration hypotheses stated. Items 4.3, 5.1, 5.3, 5.5, 5.7 and 6.1
consume it and retain their specific E² identifications. Offer that contract to
StableHomotopyKTheory H.6, SchemeKTheoryOperations S.4 and DiamondsAndVStacks D0
for their chain-level cases; their jobs must not make a second generic owner.

### RT-AREA-topology/26 — the prerequisites of Hurewicz and CW comparison

Before AlgebraicTopology 8.3, add Hatcher Lemma 4.6 (compression), Propositions
4.13 and 4.15/Corollary 4.19 (CW approximation of spaces and pairs and uniqueness),
Proposition 4.21 (homology and cohomology with arbitrary coefficients), and
natural degree-one Hurewicz `H₁ ≅ π₁^ab`. Stage 5.5 consumes Proposition 4.21;
StableHomotopyKTheory H.1 imports degree-one Hurewicz. For connected covers used
by K3BlochGroups V.1, either export Hatcher §4.3's n-connected covers from this
owner or record a chosen K-theory-family owner. If 8.3 uses a Kan/simplicial
Hurewicz proof instead, state that route and retain Proposition 4.21. Those
consumer packets are not deliverables here.

### RT-AREA-topology/29 — AlgebraicTopology dependency records

Change the upstream dependency records and regenerate the atlas extract; do
not hand-edit `research/blueprint/atlas/roadmaps/tauceti_TauCetiRoadmap_AlgebraicTopology.json`.
With supplier → consumer and numerals denoting AlgebraicTopology stages, record:

- Internal: 2 → 3; 2,3 → 4; 2,3,4 → 5; 2,3,5 → 6;
  2,3,4,5,6 → 7; 2,3,4 → 8.
- Inbound: UniversalCovers 3 → 8, UniversalCovers 0 → 5,
  GeometricTopology 1 → 6, and a chosen smooth-triangulation/Morse supplier → 8.
- Outbound: 1 → BelyiMaps 5; 4,7,8 → FuchsianOrbifolds 5;
  6,7 → GeometricTopology 10; 1 → InverseGaloisAndArithmeticFundamentalGroups
  IG.3, the last explicitly marked **inferred**.
- Roadmap prerequisites: add UniversalCovers and GeometricTopology. Roadmap
  consumers: add BelyiMaps, FuchsianOrbifolds and GeometricTopology.

The IG.3 edge goes to its atlas-side blueprint/link job. All other named
roadmaps in these edges are upstream. Incorporate RS-09/RS-33-dependent changes
only when their proposals are accepted; a proposal is not already a live edge.

### RT-AREA-topology/33 — absolute homotopy already has an owner

Narrow AlgebraicTopology 8.1 to the relative theory. Import UniversalCovers
stage 3's absolute homotopy API and its pinned Tau Ceti implementation, and
record UniversalCovers 3 → AlgebraicTopology 8. Do not plan a second absolute
π_n construction. This is an upstream-only correction, separate from /23's
based-pair restriction.

### RT-AREA-topology/81 — corners, handles and collars

Extend GeometricTopology layer 1 with Dⁿ on the half-space model, boundary
sphere and orientation; quadrant-model manifolds with corners and their faces;
products such as Dᵏ×Dⁿ⁻ᵏ, S¹×D² and Σ×[0,1]; corner straightening for glued
handle regions with its uniqueness scope; and collars. State that the inclusion
of the interior of a compact manifold with corners is a homotopy equivalence.
Use Joyce's abstract boundary ∂X or individual faces: the whole subset boundary
is not automatically a manifold with corners, and the abstract-boundary map
need not be injective at corners. Record GT layer 1 → ArithmeticLocallySymmetricSpaces
ALS.2 and ALS.5. Their blueprint jobs import that interface. None of these
foundations is supplied merely by layer 7's Riemannian volume.

### RT-AREA-topology/82 — isotopy extension and cutting

Add smooth isotopy extension to GeometricTopology layer 1 (Hirsch, Chapter 8,
Theorem 1.3), with the compactness/support hypotheses, homogeneity for connected
manifolds, and the theorem that ambient-isotopic embeddings give diffeomorphic
gluings. Make connected-sum independence consume them. Add cutting along a
two-sided codimension-one submanifold. MordellLawrenceVenkatesh LV.5 and LV.9
import this supplier; their jobs should cite the general contract rather than
build their own surface-only version. No LV file was edited here.

### RT-AREA-topology/87 — Heegaard-splitting inputs

GeometricTopology layer 9 must import surface classification and `Mod(Σ_g)`
from LV.5 or the mapping-class-group roadmap chosen by restructuring, with an
edge from that owner; remove the attribution to layer 3's diffeomorphism groups.
Add boundary connected sum to layer 1 for handlebodies. Choose and record one
Heegaard-existence route: Moise/smooth triangulation from layer 11 or the chosen
smooth-triangulation stage, via a regular neighbourhood of the 1-skeleton; or
HeegaardFloer's self-indexing Morse supplier. Do not imply that a reference to
triangulations supplies their existence theorem. The surface-owner blueprint
and the maintainer coordinate the outbound edge.

### RT-AREA-topology/91 — GeometricTopology dependency records and misplaced targets

Record the following upstream directions, with L denoting a GeometricTopology
layer, AT an AlgebraicTopology stage, UC a UniversalCovers stage, and CHF the
CombinatorialHeegaardFloer roadmap:

- Internal: L1 → L2,L3,L5,L6,L7,L8,L9,L10,L11; L4 → L5,L6;
  L2 → L4,L6; L5 → L7,L8; L7 → L8. Reconcile L11/L1 PL groupoid conventions
  at the **reconciliation node**, not by introducing reciprocal stage edges.
- Move `freedman_alexanderOne_slice` from L4 and target 1.19 from L5 to L6.
  Move 4.82 from L1 to its topological-four-manifold supplier. Use the direct
  linear orthogonal action for L3's inclusion, or remove its later-L7 reference.
- AT6 → L4,L10; AT7 → L10; AT5 → L7; UC2 → L7; UC3 → L3.
  L1 → AT6; the chosen GT smooth-triangulation stage → AT8.
- HeegaardFloer Lane M → L9 if the Morse existence route is chosen.
  L7 → OptimalTransport L7,L14 and FuchsianOrbifolds L2.
  L4 → CHF Lane K and G-10; L6 → CHF G-10; CHF G-6,G-10 → L6's τ node.
- Add AlgebraicTopology, UniversalCovers and HeegaardFloer to the upstream
  roadmap prerequisites.

The atlas-side edges are L1 → ArithmeticLocallySymmetricSpaces ALS.2,ALS.5;
L1 → MordellLawrenceVenkatesh LV.5,LV.9; and LV.5 (or its successor) → L9.
Their blueprint/link jobs must encode them after the supplier/owner choice.
QT's GeometricTopology edges are covered by /1 and /6–/8 above. All upstream
records must be regenerated into the extracts rather than editing generated
`requires`, `consumers` or `stageEdges` locally.

### RT-AREA-topology/103 — differential forms and Stokes before Floer exactness

Record the missing manifold-level contract against HeegaardFloer F2.1 and F3.
Choose GeometricTopology layer 1 or a new **Differential forms and Stokes' theorem
on manifolds** roadmap as the single owner: smooth k-forms on manifolds with
corners, exterior derivative with d²=0, pullback, Cartan's formula, oriented
top-form integration and Stokes with its boundary convention. Use the shared
orientation supplier. F2.1's closed symplectic forms/Moser/Darboux and F3's
exactness/action-energy identity wait on this; remove the immediate-landing
claim. ArithmeticLocallySymmetricSpaces ALS.5 and AutomorphicFormsOnReductiveGroups
AF.1a import the same owner. A linear-space exterior derivative or a smooth
two-form without closedness is not this supplier.

### RT-AREA-topology/105 — four-dimensional topology and absolute grading

In HeegaardFloer F4.5, assign the Heegaard-triple four-manifold and the triangle
`Spin^c` map to HF itself, sourced from Ozsváth–Szabó math/0101206 §8.1,
Propositions 8.2, 8.4–8.5. Request four-dimensional `Spin^c` structures, the
H²-torsor and c₁, cobordism handles and their slides/creation/cancellation from
GeometricTopology layers 1/6 or **Part II: four-dimensional handlebodies**.
Request the intersection form and signature of oriented four-manifolds with
boundary from AlgebraicTopology stage 6. Add the absolute rational grading,
with the cobordism-degree formula involving c₁², χ and σ (math/0110169 §7),
before the d-invariant. Restrict the correction term to rational homology
spheres; b₁>0 requires separately stated variants.

QT.0's proposed three-manifold surgery/Kirby supplier is a candidate for a
shared handle-calculus development, not an already adequate four-dimensional
cobordism contract. BP-ArithmeticQuantumTopology must state exactly what it
exports before HF imports it; the maintainer must assign the stronger missing
four-dimensional interface. No such proof was manufactured in the supplier
packets edited here.

## Evidence and validation

The accepted `data/library-coverage.json` entries for P.2, HB.4, HB.8, HB.10 and
QM.5 were checked against the supplier payloads. Baseline declarations were
checked using the existing pinned declaration index. The actual statements of
`AnalyticOnNhd` and the Tau Ceti Gaussian/density results were read: the latter
require positive-definite covariance and do not supply the formal Gaussian
completion or all-orders asymptotic argument. No baseline declaration or
mathematical node was added by this fix. The pin remains Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

Primary-source passages re-read on 7 October 2026:

| Source | Passages used |
|---|---|
| [Zagier, Quantum modular forms](https://people.mpim-bonn.mpg.de/zagier/files/qmf/fulltext.pdf) | Definition in the introduction; Example 3 (Kontsevich), Example 4 (Poincaré sphere), Example 5, pp. 12–16 (the knot cocycle and its distinct modularity law). |
| [Zagier, Vassiliev invariants and a strange identity related to the Dedekind eta-function](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1016/S0040-9383%2800%2900005-7/fulltext.pdf) | §6, pp. 958–960: the scalar Kontsevich transformation and its indicated proof. The packet's recorded corrections/proof gap are retained. |
| [Lawrence–Zagier, Modular forms and quantum invariants of 3-manifolds](https://people.mpim-bonn.mpg.de/zagier/files/ajm/3-1/fulltext.pdf) | Theorems 1–2, p. 98, and §4, pp. 103–104: normalised WRT radial limits, Ohtsuki expansion and half-integral Eichler transformation. |
| [Garoufalidis–Scholze–Wheeler–Zagier, The Habiro ring of a number field, v2](https://arxiv.org/pdf/2412.04241v2) | Theorems 3/5 and §1.8, pp. 14–17, and Remark 4.2: formal identification, coefficient module restrictions, conditional NZ dictionary and knot matrices. |
| [Garoufalidis–Zagier, Asymptotics of Nahm sums at roots of unity, v1](https://arxiv.org/pdf/1812.07690v1) | Positive-definite analytic datum, §2, and Theorem 3.1: radial limit and root-order restrictions. Existing source issues are preserved. |

Validation performed on the finished deliverables:

- `python3 scripts/check_blueprint.py` on all three packets, with the pinned
  declaration index: **0 errors and 0 warnings each**.
- Semantic comparison with the base: P.2 has exactly two added prerequisites;
  QM.5 has exactly eight changed export-use fields and one revised restructuring
  proposal. Node sets, statements, hypotheses, proof outlines, API items, unit
  tests, planets, source records, gaps, requests, coverage and review metadata
  remain intact. The Habiro packet is unchanged.
- Reader checks: both new P.2 prerequisites are present on the volume node;
  all eight QM.5 export IDs and contract strings match the packet. The Habiro
  opening counts match its current checker inventory.
- Read-only atlas assembly and in-memory blueprint integration: the two P.2
  stage prerequisites produce the intended geometric supplier edges. In the
  accepted graph together with these supplier edges, neither has a reverse
  path; adding the prospective QM.5 → QT.7 consumer edge has no reverse path.
  QT.6/QT.7 have no path back into HB.4/HB.8/HB.9/HB.10. No atlas output was
  written, and the QM.5 consumer edge is still a handoff, not live.
- All three suggested files elaborate through the prescribed `lean-check`,
  sequentially: Polylogarithms **462**, HabiroNahmSeries **273**, QSeries **1467**
  warnings, all exclusively `declaration uses sorry`; **0 errors**. Available
  memory exceeded 20 GB. The shared build has the exact Mathlib pin; its Tau Ceti
  checkout is `cf386627e9176a3827c1a5fe804989fd94a4d216`, rather than the audit
  pin. These files import only Mathlib, so this confirms their signature
  elaboration against pinned Mathlib, not a new Tau Ceti baseline audit.
  The changed Lean text consists only of owner/prerequisite comments; no
  theorem was formalised. No language server or Lake build/update/cache run.
- `git diff --check` and `research/blueprint/intake.py check-files` on the job's
  changed files pass. Only the named deliverables and the job handoff change.

`REV-FIX-RT-AREA-topology~4` must independently assess these dispositions and
record its verdict in all three packet review objects. Prior review metadata
was retained as history; this worker did not accept its own changes. The
roadmaps' inherited gaps and follow-up work are not erased by completing this
bounded fix job.
