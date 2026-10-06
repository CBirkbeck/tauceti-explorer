# BP-EllipticKTheory--E.5 handoff

Issue: #6480. Worker: Codex, session `codex-jHS6hw`, 2026-10-06.
This is a completed target-level pass, not a checkpoint. The packet has status
`complete`; its sole stage, `EllipticKTheory:E.5`, has coverage `planned`.
The stage is not closed: three gap records and fourteen precise supplier
requests remain. No declaration is claimed implemented.

## Deliverables and completed work

- [Packet](../packets/EllipticKTheory--E.5.json): eleven new nodes, distinct
  from the accepted parent's IDs: eight theorems, one comparison, one
  application and one construction. Six API items, five unit tests, four
  planets and seven audited baseline declarations.
- [Reader](../readmes/EllipticKTheory--E.5.md): conventions, operations,
  determinant obstruction, projective-line comparison, Harder inputs,
  geometric groups, coefficient descent, twisted Frobenius kernel and
  finite-field group/order computations.
- [Suggested Lean file](../suggested/EllipticKTheory--E.5.lean): actual
  Mathlib point/subgroup signatures for the construction, its API, all five
  tests and its geometric cardinality theorem. Supplier-dependent named
  targets have explicit mathematical contracts in comments.

The reviewed AUDIT-28 entry in `data/library-coverage.json`, the accepted
parent and REV-EllipticKTheory, the accepted RS-18 boundary and the applicable
link entries were read. Generic scheme maps/projection formulas are imported
from S.2; the all-degree projective-line basis is S.5's. The accepted E.1–E.3
comparisons, E.2 coordinates and E.5 determinant statements remain imports.
The new computation keeps the determinant contribution in integral K-theory.
It proves degree multiplication only with the required triviality, rational
or odd-multiplication hypotheses, and keeps the degree-two counterexample.

The finite-field convention is arithmetic Frobenius on points. The even
group is the prime-to-p torsion kernel of `1−q^iπ`, with ℓ-primary component
the Tate-lattice cokernel, not the invariant subgroup of the lattice. Its
order is `1−a_q q^i+q^(2i+1)`. The two F₂ equations give first-twist orders
five and thirteen; the F₃ equation gives twenty-eight. These distinguish the
trace sign, the additional twist and characteristic-primary torsion.

## Confirmed red-team finding RT-AREA-ktheory-2/1

All four requested repairs are explicit in the packet and reader:

1. **Finite generation:** N.3's current packet proves the number-field case
   only. Request Quillen/GQ82 for global function-field S-integers and the
   proper-curve consequence by localization. No existing number-field node
   is presented as that theorem.
2. **Bass–Tate and tame kernels:** request both higher Milnor vanishing and
   finite prime-to-p K₂ tame kernels from a T.5 function-field extension.
   T.2:graded-map supplies the natural comparison from the existing Milnor
   functor. The n=2 route uses parent E.3 integral injectivity; III.7.2(a)
   does not prove its finiteness. T.4 also receives the exact global normed
   reciprocity/SK₁ contract needed for K₁, stronger than a zero composite.
3. **Geisser–Levine:** request VI.4.7's full characteristic-p Quillen
   comparison, absence of p-torsion and uniquely p-divisible comparison
   kernel/cokernel beside M.5d. The current logarithmic-differential packet
   does not supply it. The higher-degree localization argument retains the
   initial K_(n+1) field term, so injectivity of multiplication by p is proved.
4. **Tate/coefficient ancestors:** use direct upstream EllipticCurves
   Layers 1–3 prerequisites and M.6/M.7 coefficient spectral-sequence and
   ordinary-to-étale comparison requests. Curve Kummer/trace/pairing inputs
   belong to EDC.2; continuous finite-field Hochschild–Serre belongs to
   R01.1. The j≥2 restriction is retained, and K₁ is handled separately.

Four `restructure` proposals describe these missing general supplier
extensions as Part II work, starting with their existing roadmaps. They
change no other packet or upstream document. Pending those decisions, the
requests refer to actual current stage IDs and the gaps expose their narrower
scopes. Names of nonexistent declarations from the parent's earlier fix are
not imported.

## What remains and where to resume

Resume from `requests`, `gaps` and the E.5 coverage record in the packet:

- Discharge the N.3, T.5 and M.5d scope extensions with actual producer nodes;
  obtain the T.2 graded-map and strengthened T.4 exactness interfaces.
- Obtain the coefficient/edge-splitting/limit contracts from M.6 and M.7,
  geometric Kummer/trace/pairing contracts from EDC.2, continuous cohomology
  from R01.1, and the upstream Tate/isogeny comparisons. ModularCurves 2D
  supplies the Picard pullback identity for the inherited odd-[m] argument.
- Replace supplier-dependent commented signatures with signatures on those
  actual objects, and replace stage prerequisites with finer verified nodes
  when they exist. Recheck the graph and the continuous-coefficient ranges.

The four new planets are Isogeny projection formula, Harder finiteness,
Twisted Frobenius kernel and Finite-field elliptic K-groups. Assembly should
choose one stage-wide set of at most six; the parent's projective-bundle
landmark can be a fifth. It should not add S.2's generic operations as new
elliptic definitions.

## Validation and sources

`python3 scripts/check_blueprint.py research/blueprint/packets/EllipticKTheory--E.5.json`
passed with **zero errors and zero warnings**, using the pinned declaration
index. `lean-check research/blueprint/suggested/EllipticKTheory--E.5.lean`
exited successfully: **twelve declarations using `sorry`, and no other
warnings or errors**. Elaboration uses Mathlib at
`082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti declarations were read
at `f790474821cf4256814db967cb154e7af3d0c369`; no Tau Ceti code is imported
by this prototype. Its shared build lacks the PointCount object file, so the
order signature states the explicit `q+1−#E(k)` trace expression. The check
validates the expressed signatures, not their proofs or the omitted higher-K,
cohomology and Tate signatures. All implementation statuses are `unchecked`.

Primary sources read: Weibel's author-hosted K-book Chapters III, IV, V and VI
at the exact sections listed in `sources`. The packet preserves public URLs,
access dates and SHA-256 hashes. VI.6.4's displayed formulas were also checked
on a rendered page. The complete upstream JacobianChallenge and
GrothendieckEulerForms documents and the relevant EllipticCurves and
ModularCurves layers were read for style and ownership.

Parent confirmed source corrections E1, E2, E5 and E6 are retained by
reference. New E17 records a missing bar on X before VI.6.4's coefficient
table, explicitly scoped to the author chapter copy. The author's linked
errata PDF returned HTTP 404 on 2026-10-06; the printed volume was not
independently collated. The GQ82 original and original supplier proofs were
not separately extracted; their general formalization belongs to the named
producer extensions. No scratch file is needed to resume: sources, exact
contracts, remaining work and validation outcomes are preserved here and in
the packet.
