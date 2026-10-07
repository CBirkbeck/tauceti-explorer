# BP-Polylogarithms--P.3~2 — complete revision

Codex — codex-IkzlXJ, 7 October 2026. Refs #6979.

This is a completed revision pass, not a checkpoint. The packet has status
**complete** and its sole stage **Polylogarithms:P.3** has coverage **planned**.
No mathematical stage is closed and no declaration is claimed formalized.
All 27 node IDs, their ownership, and every unchecked implementation status are
retained. The independent `review` object remains unchanged at `needs_changes`;
a fresh independent reviewer must replace it after checking this revision.

## Result and scope

There are **2 definitions, 10 constructions, 13 theorems and 2 comparisons**,
**68 API items**, **37 test examples**, **15 named target signatures**, and
**44 pinned Mathlib baseline citations**. This part proposes two planets,
Grassmannian configurations and Configuration comparison. Together with the
parent’s two P.3 planets there are four, without duplication.

Only the four issue deliverables changed. The parent Polylogarithms packet,
independent review report, atlas, queue, other packets and upstream roadmaps
were left untouched. Supplier helpers in the suggested file mirror existing
owner contracts; they are not new weight-three mathematical nodes.

## Changes requested by the review

The former arbitrary-module/function claims have been replaced by signatures
on concrete objects. Every missing API/test in the review inventory is now
supplied, and all 15 named targets are actual Lean theorem declarations.

- **Actual B₂/B₃ and Γ:** rational Finsupp quotients with admissible five-term,
  inversion, three-term and corrected 22-term relation generators; actual
  symbols, unit tensors, symbol-defined δ₃ and d₂, native cochain complexes,
  quotient lifts and field maps. This binds the comparison to the parent’s
  explicit B₃ rather than an arbitrarily chosen module or inductive quotient.
- **Bigrassmannian:** native row direct sums and the actual deletion/projection
  differential, row component formula, corner, field maps, identity and
  composition laws. The row-3 quotient boundary is retained. Native chain
  degree p contains BC_(p+1); the reversed Γ is supported at p=3,4,5.
- **Configuration maps:** projected homogeneous coordinates and the inverse
  adapter to V.4’s ordered cross-ratio, exterior/middle/top field maps and all
  previously omitted volume and quotient signatures. The coefficients are
  −3 Alt₄ and −(1/5) Alt₆, with unnormalized alternation and zero-based faces.
- **Geometric presentation:** actual projective six-tuples, GL/repeated-point/
  four-collinear/seven-term/intersection generators, and triangle vectors
  e₁,e₂,e₃,(1,1,0),(0,1,1),(−z,0,1). The type-B locus and T₁ combination are
  explicit. The T(1) nonzero regulator test is present. Skew symmetry is
  derived from the seven-term repeated-point relation, not a missing generator.
- **Duality:** general q,m matrix, involution and face statements with native
  Fin dimension transports, plus all three tests. The geometric negative
  duality theorem has the source’s no-four-collinear hypothesis.
- **Homology/K comparison:** actual native configuration-chain homology map
  into the reversed Γ, followed by its indexing equivalence; fixed V.4
  symmetrized-edge and primitive-Hurewicz owner contracts. APIs include
  stabilization, rank-three formula, field maps and rank-restricted K maps.
  Rank-two vanishing includes the actual rank≤3/rank≤2 quotient factorization.
  The stable fixture quantifies over native degree-5 GL₃(C) bar cycles, maps
  to the actual [1]₃ cycle, stabilizes to GL₄ and evaluates to Re ζ(3).
  A zero comparison cannot satisfy this fixture.
- **Transfers:** h3Transfer is the conjugate of the supplier’s degree-three
  Milnor norm by the actual H³ equivalence. Restriction/degree, both product
  splits 1+2 and 2+1, finite towers and residue norm statements are supplied.
  The residue signature names normalized valuations, finite integral closure,
  a complete family of extensions, residue fields and finite residue degrees;
  no extra ramification factor appears in the conclusion. The genuine
  quadratic test applies h3Transfer to native Γ homology restriction. The
  exterior d³ comparison is a separate coefficient-law non-example and makes
  no false nonzero assertion for number-field H³ over Q.
- **Analytic descent and arithmetic:** fixed Li₁=−log(1−z), positive-weight
  radial interval-integral recursion, and the real single-valued L₃ formula,
  with explicit values at 0 and 1. Descent, sum, conjugation, embedding
  regulators, ζ(3) and −3ζ(3)/4 tests use these actual objects. Number-field
  image containment and every-family determinants use native infinite places,
  the actual cycle regulator, discriminant and Dedekind zeta. The determinant
  orientation remains det=q·period, allowing q=0.
- **Borel model and normalization:** actual continuous and Borel-measurable
  homogeneous invariant bar cochains, signed deletion, native cohomology and
  continuous inclusion replace arbitrary cohomology spaces. R.7 still owes
  the comparison with the source configuration/Moore almost-everywhere model.
  Gon95’s two-dimensional configuration calculation is not asserted for all
  measurable group cohomology. Since Alt₆ M₃=720 M₃, the chosen corrected
  cocycle is −96 L₃(M₃). The triangle regulator itself is ζ(3). This scalar,
  and the separate π² Tate-coordinate adapter, are tracked explicitly.
- **Conditional derived transfer:** native DerivedCategory/localization,
  integer-indexed Γ, polynomial residue fields AdjoinRoot P, RatFunc F,
  actual cokernel of constants and shifted residue direct sum. The bridge is
  the fixed symbol-preserving chain map [x]₃↦[x]₃, identity in degrees 2,3;
  its invertibility is assumed at F and every polynomial residue field.
  Arbitrary scalar-twisted isomorphisms cannot be substituted. The theorem
  assumes invertibility of the actual weight-four residue resolution in the
  derived category, gives the negative-infinity-residue composition equation
  and requires its H³ map to agree with h3Transfer. No unconditional termwise
  transfer or tower independence is claimed.

The reader is synchronized with the packet: corrected signs, source dates and
locators, the rejected p. 298 allegation, all APIs/tests/acceptance criteria,
Suslin’s undetermined κ, the P.4 field-complex residue supplier, and the six
remaining gaps/five requests. The two former missing-interface/test coverage
items are discharged as planning work, without claiming proofs of their laws.

## Sources and baseline checks

Public PDFs were obtained again, their recorded SHA-256 hashes verified, and
read on 7 October 2026. Revision read scopes are separate from the preserved
original-worker and independent-review records:

- **G95 published scan:** pp. 202–220, 239–241, 255–259 and 264–312, including
  the complete §§4–5 geometric comparison/choice-independence proof, §§6–8
  comparisons and duality, and §§9–10 regulators/lifting. Sign/index-sensitive
  displays at pp. 208, 286–287, 293 and 298 were inspected visually.
- **GR arXiv v5, 15 July 2026:** §1.2, complete §5.1 pp. 53–56 and complete
  §§7.1–7.3 pp. 61–68, including the normalization footnote. Public version
  metadata was checked; no accessible version of record or correction was
  located. The two GR findings concern this v5 preprint.
- **Zhao supplement:** p. 2 formula (3) with its nondegeneracy conditions,
  used only for the coordinate sign check.
- **Missing primary source:** Suslin 1984 remains unavailable to this pass;
  its theorem/access gap is imported from K3BlochGroups V.4, not replanned.

All five source-finding objects, including their independent reviews, are
unchanged: E-P3-01 is rejected (published p. 298 already prints H²), E-P3-02
and E-P3-05 confirm the two GR coefficients, E-P3-03 confirms the omitted
higher-differential computation, and E-P3-04 confirms the coordinate minus sign.

All original 26 baseline statements and 18 additions were read at Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174. Added citations cover native complex
constructors, direct sums, GL/colimit/group-homology maps and cycles, homology
cycle constructors/projections, derived localization, AdjoinRoot, RatFunc,
Riemann zeta and interval integration. Every baseline is used in prerequisites.
The reviewed library audit and the Tau Ceti f790474821cf4256814db967cb154e7af3d0c369
source tree were checked for ownership/existing coverage. No Tau Ceti declaration
is cited as a baseline or imported by this suggested file.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/Polylogarithms--P.3.json`
  passes with **zero errors and zero warnings**, including source-finding and
  source-version checks. The shared declaration index was unavailable, so its
  baseline name check is form-only; the pinned-source readings above provide
  declaration evidence. No replacement index was manufactured.
- The final `lean-check research/blueprint/suggested/Polylogarithms--P.3.lean`
  completes with exit status zero at the pinned Mathlib commit; warnings are
  exclusively declaration-use-of-placeholder warnings. Memory availability
  exceeded 20 GB before each compilation. No language server, library build,
  update or cache operation was used; compiles ran serially.
- A declaration/example inventory confirms **68 actual API declarations,
  15 actual named targets and 37 uniquely labelled examples** agreeing with
  the packet and reader. It also checks unchanged node IDs, review and source
  findings, all unchecked statuses, and usage of all 44 baseline references.
- Portable exact rational prime-coordinate calculations reproduce 36/−24
  and 18/−12 for the two right-square fixtures, equality of all 31 coordinates
  for the nonconic five-tuple, all six displayed left-square coordinates,
  and all 722 coordinates for the nonconic six-tuple. The corrected negative
  coefficient agrees; the positive printed coefficient is its opposite.
  Inputs, formulas and expected coordinates are recorded in the reader;
  these calculations do not establish full B₂-valued chain compatibility.
- `git diff --check` passes. Changes are restricted to the four deliverables.

## Precise remaining work and where to resume

A fresh independent review should begin with its previous omission inventory,
compare every supplied signature with the supplier contracts, and check the
fixed normalization and native complex indexing. The source review and all
mathematical gap records remain evidence, not acceptance of this revision.

1. **Configuration normalization:** supply the full B₂-valued left square and
   geometric-to-explicit B₃/old-map adapter, including 3/2, −2/15 and duality.
   Source access and Fin/direct-sum signatures are no longer the obstacle.
2. **Analytic relation:** write the derivative, constant and continuation proof
   for the corrected explicit 22-term L₃ identity.
3. **Cycle lifting:** display Gon95 §9.2’s omitted higher differentials, identify
   the surviving edge with the actual comparison, pass PGL₃ to stable GL,
   and establish primitive pairing. Do not assume H¹Γ≃K₅^(3).
4. **Suslin adapter:** retain V.4’s primary-proof obligation, and compute the
   nonzero rational diagonal/primitive coefficient κ for corrected r₄=18 f₀.
5. **Regulator calibration:** R.7 must compare the actual bar/source models,
   isolate primitive conjugation-even parity, and compute the universal
   nonzero rational factor, retaining −96 and π² separately.
6. **Unconditional complex transfer:** P.4 must establish the canonical
   explicit/inductive bridge and weight-four homotopy/residue resolution,
   including infinity/constant annihilation; tower independence is separate.

The five supplier requests remain with **GeneralAlgebraicKTheory K.2**
(primitive Hurewicz/rank/κ), **K3BlochGroups V.4** (rational symmetrized
hyperhomology), **BorelRegulators R.7** (models and normalization),
**K2SymbolsBrauer T.3** (degree-three Milnor–Quillen transfer adapter), and
**Polylogarithms P.4** (canonical bridge and field-complex resolution/residues).
Their existing nodes are imported; extensions in their own direction are
proposed as Part II, without duplicating foundations here.

Assembly must reconcile three untouched parent targets: rank≤3/rank≤2 versus
an unrestricted K-domain, the π² R.4 coordinate convention, and det=q·period
for all families. Follow-up work closes the six mathematical gaps; this revision
has finished the requested concrete planning/signature/documentation pass.
