# DESIGN-RealSurfacePeriodIndex: prerequisite checkpoint

Issue [#3470](https://github.com/CBirkbeck/tauceti-explorer/issues/3470),
Codex session `codex-Zs3gud`, 18 October 2026. The bot confirmed this session's
claim in [comment 6244376310](https://github.com/CBirkbeck/tauceti-explorer/issues/3470#issuecomment-6244376310).
This is a **checkpoint, not a completed design**. It updates the dependency
diagnosis from [checkpoint PR #8877](https://github.com/CBirkbeck/tauceti-explorer/pull/8877).
No second job was claimed. No mathematical target is claimed formalised.

## Current blocker and exact resume condition

The issue incorporates the `RealSurfacePeriodIndex` route in
[PAPER-BENOIST-19.result.json](../papers/PAPER-BENOIST-19.result.json).
Its final brief paragraph expressly requires the four continuation designs,
with all needed Benoist tranches present, before execution of this consumer.
Two required designs are still absent. The queue's `after: []` does not
encode that prerequisite, so the consumer's available label does not make
it ready. The request to wait is in the incorporated brief itself; this is
not an inference that supplier implementation must be finished first.

The current verification used atlas commit
`8e721db6a9d2c8782f4ce067416f946133bac337` and live issue metadata on
18 October 2026. Both base packets and follow-up packet names were checked.

| Required supplier | Current evidence | What the next worker should do |
| --- | --- | --- |
| `SemisimpleAlgebrasPartII`, tranche `BrauerPeriodIndexArithmetic` | [#3469](https://github.com/CBirkbeck/tauceti-explorer/issues/3469) is submitted. Its 55-node packet has an accepted review; SA.0 and SA.1 contain class index, splitting degrees, period and corestriction. | Reuse its exact node contracts and retain their explicit supplier gaps. Do not require implementation or closure before designing the consumer. |
| `AlgebraicTopologyPartII`, tranche `EquivariantTopologyRealVarieties` | [#3401](https://github.com/CBirkbeck/tauceti-explorer/issues/3401) is available; both roadmap definition and packet are absent, with no follow-up packet. | Wait for the design of the common C2 cohomology, fixed-locus components, twists, trace/norm, double-cover quotient, circle extensions, Gysin and real duality contracts. |
| `HodgeStructuresPartII`, tranche `DegeneratingHodgeStructures` | [#3371](https://github.com/CBirkbeck/tauceti-explorer/issues/3371) is submitted. The main packet still labels H.8 not read, but [the H.8 follow-up packet](../packets/HodgeStructuresPartII--H.8.json) has 31 nodes and an accepted independent review dated 8 October. Its planning and review queue jobs are done. | This tranche is present. Use the follow-up, including `HodgeStructuresPartII:H.8/normal-boundary-factorization`, `/real-green-open-cone` and `/voisin-product-surface`; preserve its five recorded gaps and requests. Do not repeat the previous checkpoint's claim that H.8 has no plan. |
| `QuadraticFormInvariantsPartII`, tranche `QuadraticFormsRealFunctionFields` | [#3385](https://github.com/CBirkbeck/tauceti-explorer/issues/3385) is available; both roadmap definition and packet are absent, with no follow-up packet. | Wait for the design of the shared ordering/real-closure, Harrison compactness, zero-signature u-invariant, deeper Pfister, Witt-curve, valuation/Springer and Amer–Brumer contracts. Reuse the parent's existing elementary Pfister theory. |

The main change since the previous checkpoint is the discovery of the accepted
H.8 follow-up. Its presence removes the earlier Hodge prerequisite blocker;
it does not supply either of the two absent designs. No changes to supplier
files or review verdicts were made. No new mathematical request was posted.
The manager can encode the two remaining design dependencies in the queue;
this worker has not edited the queue or issue labels.

## Current session checks and remaining work

Read WORKERS.md, both protocols, UPSTREAM_GUIDE.md, the claimed issue again
after confirmation, the incorporated route, the previous handoff, the supplier
coverage records and the relevant queue entries. Checked the accepted H.8
follow-up and its specific export statements, rather than relying on the
stale H.8 coverage in the main packet. The design still requires the full
source reading and pinned-library audit described in the resume procedure.

The current upstream roadmap checkout was inspected read-only at commit
`0d144d044dacebca17b654695b6f1ad58f159b27`; the current Tau Ceti checkout is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Scope and suggested-file searches
in AlgebraicTopology, QuadraticFormInvariants and RealAlgebraicGeometry are
ownership leads only, not a fresh exhaustive library audit. In particular,
RealAlgebraicGeometry's scope excludes semialgebraic homology, and elementary
Pfister forms already belong to the parent quadratic-form development.
No library absence claim or new baseline citation is certified by these searches.
No build or language server was started in either checkout.

No mathematical deliverable was added while the brief's explicit prerequisite
condition remains unmet. The remaining work is the whole consumer design:
all 100 routed items, roadmap layers, node statements, proof closure, API,
discriminating tests, planets, reader and compact suggested Lean file.
Counts remain zero for local nodes, API items, unit tests, planets, packet
baseline declarations and formal packet requests. There are no consumer stage
coverage records because the roadmap has not been designed. Lean was not
compiled; there is no suggested file. The blueprint checker is inapplicable
to this handoff-only checkpoint. The handoff assertions and `git diff --check`
are the applicable validation checks.

## Reading and checks inherited from the previous checkpoint

The previous worker (`codex-lzSsrV`, checkpoint PR #8877, 11 October 2026) reported the following reading. The current session has not reread the paper and does not claim this reading as its own. The published paper was read throughout, independently of the extraction:
Olivier Benoist, *The period-index problem for real surfaces*, Publications
Mathématiques de l'IHÉS 130 (2019), printed pp. 63–110. The public version is
[the Numdam PDF](https://www.numdam.org/item/10.1007/s10240-019-00108-7.pdf),
read on 11 October 2026, SHA-256
`8dfc0f221ab510ba1ecfe7c5b5fde12c217019f33d704ea89ce1a0c144398d3b`.
The PDF and extracted text were kept only in disposable scratch space.
No author-copy or preprint comparison is claimed in this run. The extraction's
other-version readings retain their original attribution.

The previous worker read WORKERS.md, the blueprint and expansion protocols, and UPSTREAM_GUIDE.md.
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

1. Recheck the two absent designs in the current supplier table, including their required Benoist tranches. Preserve the accepted H.8 follow-up as the Hodge supplier rather than consulting only the main Hodge packet. Resume the
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
