# BP-ArithmeticKTheory--N.5 handoff

Agent: Codex; session codex-mDuyQK. Job: #6476. This is a complete target-level
planning pass for N.5, not a checkpoint and not a formalisation. It develops only
the three named deliverables and this handoff. The parent N.1 packet and all
other owners remain untouched.

## Result and coverage

The packet has six new nodes: three comparisons and three theorems. It imports
the seven accepted N.5 declarations by their existing N.1 ids. No definition or
construction is duplicated, hence zero new API items and zero definition unit
tests; the inherited e-invariant retains its five API items and four definition tests.
Every new node
has acceptance conditions. The suggested file has three group-theoretic
acceptance examples. Two new planets join four inherited N.5 planets, meeting
the six-per-layer limit. Six direct baseline declarations are cited.

N.5 coverage is **planned**, with precise remaining work; packet status is
**complete**. All original targets have an owner and a prerequisite chain ending
in existing plans, baseline facts or an exact request/gap. There are five gaps
and nine requests. No stage is claimed closed and no node is implemented.

The map-level results specify:

- the primary coefficient Bockstein and odd localisation;
- equality of the geometric descent edge with the actual e-invariant;
- the diagonal real-place extension class in degree three modulo eight,
  including its coordinate pushouts, lift relation and nonsplitting;
- the kernel/cokernel table, including the missing dyadic image in degree five;
- the torsion restriction of the edge-normalised first étale Chern map.

The reader is approximately 3,650 words and records conventions, inherited
outputs, proof routes, acceptance examples, boundaries and source locators.
The independent review should concentrate on the all-coordinate extension
argument and the explicit coefficient/edge compatibility contract. The first
Chern assertion is edge-normalised; the raw higher-class comparison is not
claimed established.

## Confirmed findings

**RT-AREA-ktheory-1/3:** the packet requests the specifically named M.7 theorem
`MotivicEtaleKTheory:M.7/suslin-real-finite-coefficient-comparison`, with
K_n(ℝ;ℤ/m) ≅ π_n(BO;ℤ/m) for n≥1,m≥2, real-to-complex torsion maps and a
precedence requirement before
`MotivicEtaleKTheory:M.7/real-place-dyadic-descent-output`. The latter includes
filtered maps and the nontrivial real extension at every place, rather than just
orders. A separate request and rescope proposal at RT.4:topological names
`RefinedTraceMethods:RT.4:topological/real-topological-k-theory` for KO/BO,
real Bott periodicity and the needed homotopy groups/maps. The existing complex
ku/KU stage and Tau Ceti Clifford periodicity do not supply it. Proposed ids in
requests are not pretended to be existing or reserved nodes. The named M.7
nodes must be written by M.7's owner; N.5 imports the output.

**RT-AREA-ktheory-2/22:** N.5 keeps the structure/localisation theorems and N.8
keeps certified ℤ,ℚ,ℚ(i) examples. The rescope proposal directs V.5 to import
N.5 and N.8 and retain its decomposable Milnor image/indecomposable quotient.
The current V draft already contains some N.5 imports, but still has arithmetic
calculation nodes; that is not the complete ownership correction and the atlas
stage lacks these prerequisites. No duplicate K₃ arithmetic-example node is
added here. Apply N.5→V.5 and N.8→V.5 in the owner files, alongside the separate
V.2 rank-cycle correction.

## Exact remaining work

1. H.6: prove the Q_ℓ/Z_ℓ coefficient-colimit UCT and Bockstein with localisation
   and completion compatibility. Its existing finite coefficient and Milnor
   nodes are imported; they do not explicitly supply this whole contract.
2. M.7: name general characteristic-zero separable-closure Suslin torsion and
   Aut-equivariance, the cd-two edge output and the edge/connecting-square
   compatibility. The local-field L.2 node is too narrowly scoped to replace
   the general Suslin result.
3. M.7 and RT.4:topological: supply the named real comparison, real topological
   input and all four positive even coefficient rows with their real-place
   restrictions and extension data. VI.9.3's approximation and cohomological
   restrictions belong to M.7.
4. M.2: continuous coefficient sequence, H¹ finite generation and rationalisation
   compatibility for R=O_{F,S}[1/ℓ], positive weight j≥2.
5. M.8: compare the full higher-Chern family with the first edge map, stating
   factorial/sign factors. Preserve the distinction from the early M.7 edge
   comparison used here.
6. L.1: read Harris–Segal's original §3 and plan its finite-field/wreath-product
   theorem and detected summand. The public K-book quotes it but does not prove
   it. Original article: *K_i groups of rings of algebraic integers*, Annals of
   Mathematics 101 (1975), 20–33, DOI 10.2307/1970984. Public publisher/author
   searches did not provide readable original §3 in this pass.
7. K.7: finite-coefficient localisation boundary linearity and transfer
   projection formula. The inherited Soulé refinement uses existing L.1 nodes
   at a multiple M of m with each primary factor outside {2,3,4,8}, then reduces
   residue targets to m. Do not import the unreviewed L.1 product node's broad
   exceptional-modulus clause as a general-ring ring-spectrum theorem.
8. Apply the V.5 ownership correction above. Resolve the inherited union cycle
   N.5→M.8→Borel R.7→Polylogarithms P.2→V.3→V.2→N.5 by changing the owning
   V.2/k3-rank-borel prerequisites to direct Borel R.3 and arithmetic finite
   generation, without N.5. The parent N.1 packet already records this proposal.
   The six new nodes add no full M.8 prerequisite. Global closure and global
   acyclicity are not claimed before that inherited correction.

The packet's five gaps group these precise needs: real supplier scope;
coefficient/edge/cohomology contracts; original Harris–Segal proof; inherited
Chern-family cycle; and safe-product localisation interface. Resume at these
supplier contracts rather than adding duplicate N.5 structure theorems.

## Verification and baseline

`python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticKTheory--N.5.json`
passes with **0 errors and 0 warnings**, using the supplied declaration index.
Additional checks confirm that all imported, refinement and target-coverage
node ids resolve, every new id is distinct from N.1, source SHA-256 values match,
and only the four authorised paths are changed.

`lean-check research/blueprint/suggested/ArithmeticKTheory--N.5.lean` exits zero
with **four placeholder warnings and no errors**. Available memory was 108 GB
before compilation. It ran only once; no language server, Lake project or
library build was started. The shared Mathlib source is exactly
082e2d37e8b0463410cdb532e111cd43d5a66174. The shared Tau Ceti checkout is newer
than f790474, so the suggested file deliberately imports only pinned Mathlib
modules. Tau Ceti baseline searches used the f790474 git object.

The suggested file states `diagonalExtension_normalForm` with actual
AddMonoidHom kernel/range, ZMod and additive equivalences. Five arithmetic
signatures are explicitly omitted because higher K-theory, its coefficients and
the required étale maps have no baseline carriers/API. No opaque K-group or
proposition-valued surrogate is introduced. Elaboration checks the proposed
signature and examples; it does not certify proofs.

The declaration index omits some generated additive names. Baseline entries
therefore cite the source declarations CommGroup.primaryComponent,
MonoidHom.ker and MonoidHom.range, explain their generated additive forms, and
read the actual definitions. The additive kernel/range names used by the
suggested file are confirmed by elaboration. ZMod, ZMod.addOrderOf_one and
ZMod.castHom are read directly at the pin.

## Sources and assembly

Public sources, read 6 October 2026, are in the packet with URLs and full hashes:

- Weibel's author-hosted combined K-book draft, 29 August 2013: IV.2, V.6.8,
  VI.1–3, VI.8 and VI.9. Printed draft pages and combined PDF pages are
  distinguished; the combined offset is eight.
- Weibel's published author copy of Handbook I.5: §§5.3,5.4,5.7,5.8. The first
  étale Chern convention is on printed pp. 153–154.
- Rognes–Weibel's published author PDF: §1 after Example 1.6, Theorem 5.6 and
  proof, and Theorems 6.7/6.9 with proofs. The extension argument is on printed
  p. 33; apply it to every real embedding to specify the diagonal class.

No new published-source error is asserted. The inherited ArithmeticKTheory corrections E6, E10,
E13, E15, E17 and E20, and KTheoryFiniteLocalFields/E3, E4 and E10, are
referenced without duplicate errata entries.
Harris–Segal original §3 remains unread and is the explicit source boundary.

Upstream style/API examples read were the Multiquadratic and IntegralLattices
roadmaps, with additional AlgebraicTopology, NumberFieldArithmetic and
ProfiniteCohomology material inspected. Assembly must retain all inherited ids,
attach the six new declarations to N.5, keep the original e API/tests and four
planets, and append the two new planets without exceeding six.

Scratch source downloads and extracted text are not deliverables and are
removed after the pull request opens. All mathematical inputs, locators,
checks and next actions needed by another worker are recorded here or in the
packet; no private path or source download is required to read the submission.
