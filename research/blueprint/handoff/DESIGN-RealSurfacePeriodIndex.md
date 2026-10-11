# DESIGN-RealSurfacePeriodIndex: prerequisite checkpoint

Issue [#3470](https://github.com/CBirkbeck/tauceti-explorer/issues/3470),
Codex session `codex-lzSsrV`, 11 October 2026. The bot confirmed this session's
claim at 11:11:47 UTC. This is a **checkpoint, not a completed design**.
No second job was claimed. No mathematical target is claimed formalised.

## Why execution is blocked

The issue incorporates the `RealSurfacePeriodIndex` route in
[PAPER-BENOIST-19.result.json](../papers/PAPER-BENOIST-19.result.json). That
route requires all four continuation designs, including their Benoist
tranches, before execution of this consumer. The queue's `after: []` does
not encode that requirement. Availability of the consumer issue therefore
does not establish readiness of its mathematical inputs.

The following checks were made against atlas commit
`897618096af2bb002a83d22044f03ed8e63fd066` and the live supplier issues on
11 October 2026:

| Required supplier | Evidence | Exact condition for resuming |
| --- | --- | --- |
| `SemisimpleAlgebrasPartII`, proposed tranche `BrauerPeriodIndexArithmetic` | [#3469](https://github.com/CBirkbeck/tauceti-explorer/issues/3469) is submitted. Its packet has 55 nodes; SA.0 and SA.1 are planned. | Recheck the class-index, splitting-degree, scalar-extension, period and corestriction statements and use their existing node IDs. The present plan has gaps and is not closed. |
| `AlgebraicTopologyPartII`, proposed tranche `EquivariantTopologyRealVarieties` | [#3401](https://github.com/CBirkbeck/tauceti-explorer/issues/3401) is available. Its roadmap definition and packet are absent. | The common C2 cohomology, fixed-locus components, twists, trace/norm, double-cover quotient, circle extensions, Gysin and real duality contracts must have a design. |
| `HodgeStructuresPartII`, proposed tranche `DegeneratingHodgeStructures` | [#3371](https://github.com/CBirkbeck/tauceti-explorer/issues/3371) is submitted and its queue job is done. The packet has 569 nodes, but `HodgeStructuresPartII:H.8` is `not_read`, with no nodes parented there or realising it. | Complete the actual H.8 real Noether–Lefschetz tranche: geometric weight-two variations, Kodaira–Spencer contraction, normal-boundary factorisation, Green's cone and Voisin's kernel-cone interfaces. Completion of another tranche is insufficient. |
| `QuadraticFormInvariantsPartII`, proposed tranche `QuadraticFormsRealFunctionFields` | [#3385](https://github.com/CBirkbeck/tauceti-explorer/issues/3385) is available. Its roadmap definition and packet are absent. | The shared ordering/real-closure, Harrison compactness, zero-signature u-invariant, Pfister, Witt-curve, valuation/Springer and Amer–Brumer contracts must have a design. |

This checkpoint does not replace those suppliers by new application-owned
definitions or by assumed propositions. It makes no edits to their files,
the queue, reserved IDs, or issue labels. These are recorded contract needs;
no supplier requests were posted separately.

## Reading and checks preserved for the next worker

The published paper was read throughout, independently of the extraction:
Olivier Benoist, *The period-index problem for real surfaces*, Publications
Mathématiques de l'IHÉS 130 (2019), printed pp. 63–110. The public version is
[the Numdam PDF](https://www.numdam.org/item/10.1007/s10240-019-00108-7.pdf),
read on 11 October 2026, SHA-256
`8dfc0f221ab510ba1ecfe7c5b5fde12c217019f33d704ea89ce1a0c144398d3b`.
The PDF and extracted text were kept only in disposable scratch space.
No author-copy or preprint comparison is claimed in this run. The extraction's
other-version readings retain their original attribution.

Read WORKERS.md, the blueprint and expansion protocols, and UPSTREAM_GUIDE.md.
Checked the current upstream semisimple-algebra and real-algebraic-geometry
carrier/boundary material and their suggested files. The upstream checkout
was read only: TauCetiRoadmap commit
`c251d2e42c66f14c279d1e5c2708c5a91d8c8aec`, current Tau Ceti commit
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
This was a preliminary ownership check, not a completed pinned-library audit.
The design's eventual baseline must remain Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

In particular, the current Tau Ceti source already has the algebra index
and an index-degree splitting field in
`TauCeti/Algebra/CentralSimple/Index.lean`, and a real Brauer-group equivalence
in `TauCeti/Algebra/BrauerGroup/Real.lean`. They must not be replanned here.
The current RealAlgebraicGeometry README expressly excludes semialgebraic
homology. Its CAD and quantifier-elimination targets do not supply the
Puiseux-field cohomology needed by Proposition 0.7, nor the branch-loop
approximation theorem. Read actual pinned declarations before turning these
ownership observations into packet baseline citations.

## Consumer obligations that must survive the design

These notes specify checks for the application plan; they are not a
section-by-section summary of the source. The extraction has exactly 100
distinct items routed to this consumer. It remains the canonical inventory;
do not silently discard repaired constructions or promote background results
to additional targets.

* **Preserve the scope of the final results.** Theorem 0.3, p. 64, covers
  every function-field Brauer class of a connected smooth projective real
  surface without real points, including ramified classes. Theorem 0.4,
  p. 64, uses a connected smooth real surface and a class unramified on it
  with zero evaluation everywhere on its real locus. Theorem 0.5, p. 64,
  concerns a class unramified on a projective surface: odd period gives
  equality; the even-period Kummer obstruction distinguishes index n from
  index 2n. It is not a criterion for arbitrary real closed base fields.

* **Separate the finite cover from its resolution.** At §3.1, pp. 76–77,
  use the finite rank-two algebra with underlying module
  O_S ⊕ L⁻¹(−R) and local equation z²=rs. The incidence model
  rv²=sw² is a partial resolution and has projective-line fibres over
  R∩D. Its remaining singular centres above Sing R have w=0.
  The resolved surface maps properly, not finitely, to S. State finiteness
  only on the correct open strata. Items 174–184 contain the repair and
  its consumers. The residue argument in Proposition 4.2, pp. 80–81,
  needs exceptional fibres from both kinds of branch crossing.

* **Test the curve lift as a strict transform.** In §5.1, p. 86,
  s restricted to the auxiliary curve is a₁rg² with a₁ positive.
  The two graph components have coordinates [±√a₁g:1]; exceptional
  fibres are not part of the component isomorphic to the curve.
  The trace-zero coefficient in (5.5), p. 87, is √a₁rg when the
  generator is z, or rg after rescaling z by √a₁. The extraction's
  withdrawn E19 must not become a fresh source error.

* **Use a compatible Kummer representative.** Lemmas 1.3–1.4,
  pp. 69–70, require choosing the integral class β with reduction
  equal to the pullback of the chosen mod-n lift. An arbitrary integral
  representative of the pulled-back Brauer class does not have this
  property. The complex hypersurface argument also retains the degree,
  rational-generic-fibre and canonical intersection hypotheses of its
  imported kernel-cone theorem. The alternative unramified complex proof
  is owned here; de Jong's characteristic-zero reduction is an imported
  input, and the finite-field discussion is background.

* **Keep the uniform repair distinct from the unrestricted statements.**
  Propositions 4.4–4.5, pp. 81–85, and Proposition 6.6, pp. 93–95,
  have the extraction's G4a/G4b obligations for nonconstant real
  evaluation. Items 161–167 give conditional uniform variants. In the
  even induction set a=(n/2)α and Ψ=Θ(α). The evaluation of a on Ψ
  is the constant t=(n/2 mod 2). It is zero when 4 divides n, so
  Ψ need not equal Θ(a). Multiply the Picard correction by t and
  retain the extra curve correction. Handle odd period separately.
  Corestriction, not merely a quadratic splitting of a, establishes
  the exact restricted period n/2. Check extension of the lift to the
  potentially larger maximal unramified open.

* **Retain two concrete proof gates.** G10 concerns the precise signed
  homological diagram needed for (4.3)–(4.5), pp. 82–83, citing Jannsen,
  p. 268. A general derived-category carrier does not settle it.
  G13/item 202 concerns the pair (T,p⁻¹R) in the final deformation
  argument, pp. 94–95. Normalize β modulo 2 on the open first,
  then verify the invariant stratification, proper stratified
  submersion and pullback comparison square. Ordinary Ehresmann
  triviality of T alone does not preserve that open or its Kummer class.
  The extracted proposed repair is an obligation, not a verified proof.

* **Preserve the geometric hypotheses of the branch construction.**
  Proposition 5.5, pp. 89–90, starts with an ample A₀ satisfying the
  restriction vanishing on R; the later very ample A is another choice.
  Equation (5.7), p. 88, uses a boundary into H¹ of the normal bundle,
  not H⁰. Lemma 6.4, p. 92, needs the exact algebraic approximation
  and signed-divisor inputs in items 196–197. Use the signed divisor
  H−R and control the poles in the positivity construction. Definable
  cell decomposition does not provide these inputs.

* **Check signs and coefficient groups in necessity.** Lemma 7.3,
  pp. 98–99, uses p*η−ψζ. The target-sheaf restriction property,
  rather than only injectivity for the quotient Q, is needed to extend
  the identity from the étale open. The circle extension in §7.4,
  pp. 100–101, has stalk F₂² when 4 divides n and Z/4 when n is
  2 modulo 4. Do not treat both as split F₂ vector spaces. The earlier
  suspicion about the printed projection labels was withdrawn.

* **Keep the special applications downstream.** In §8.1,
  pp. 106–107, import the Enriques carrier, canonical bundle,
  complex Brauer group and real Picard image. The half-detector
  statement requires a nonempty real locus. Prove the application
  of real duality to the surface annihilator formula, Proposition 8.1,
  pp. 105–106, rather than redefining generic topological invariants.
  For Proposition 0.7, §8.2, pp. 107–108, use semialgebraic
  cohomology over the real Puiseux field. The quaternion sign test
  must choose general points avoiding zeros and poles on both
  sign-test arcs of u=0; the extraction's G9 remains a proof obligation.

* **Keep the real quadratic convention and the corrected lower bound.**
  Theorems 0.10, 0.12 and 0.13, p. 66, use the Elman–Lam
  u-invariant, counting anisotropic forms with zero signatures at
  all orderings. In the arbitrary-extension descent, §6.4, p. 96,
  include a transcendence basis in the finitely generated subfield.
  For the rank-four example choose a smooth complex-residue point.
  Replacing a lift w of i by (w²−1)/(2w) makes w²+1 vanish to
  second order after replacement; the two prescribed sums of squares
  then form regular parameters. Use the current item 97/E10 repair,
  not the earlier inadequate separate conditions on their differentials.
  The degree-four del Pezzo application uses the shared Amer–Brumer
  criterion and a rank-five pencil over the no-real-points surface
  function field. These applications must not become prerequisites
  of their field-theoretic supplier.

## Resume procedure and validation status

1. Recheck the three missing tranches in the supplier table. Resume the
   consumer design only when the brief's prerequisite condition is met;
   an administrative queue repair belongs to the manager.
2. Read at least two upstream roadmap documents fully for the design pass,
   complete the reviewed and pinned library audit, and verify the other
   named suppliers' actual stage descriptions and declaration contracts.
3. Map all 100 routed items to application targets, proof sketches,
   imported statements or explicit gaps. Do not create one node for every
   small proof step at the default target granularity.
4. Write the four authorised deliverables together: roadmap definition,
   packet, reader and suggested Lean signatures. Derive API and three
   discriminating tests for every definition/construction from its uses.
   Preserve G4a/G4b, G9, G10 and G13 unless independently discharged.
5. Run `check_blueprint.py` with the pinned declaration index and
   `lean-check` on the suggested file, then update this handoff with exact
   coverage and checks before submitting a completed design.

No roadmap definition, packet, reader or suggested Lean file was created
in this checkpoint. Counts: zero nodes, API items, unit tests, planets and
packet baseline citations; zero formal packet requests. All consumer stages
remain undesigned. `check_blueprint.py` and Lean elaboration are inapplicable
to this handoff-only submission and were not run. No build or language
server was started. The durable work is the dependency diagnosis and reading
notes above; no disposable scratch file is needed to resume.
