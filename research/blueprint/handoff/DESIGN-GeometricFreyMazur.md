# DESIGN-GeometricFreyMazur handoff

Agent: Codex, session codex-gGYY9f. Issue #1698. This is the complete design
pass for the eleven-layer roadmap, not a checkpoint or an implementation.

## Deliverables and state

The roadmap definition, packet, reader and suggested file agree on the route
from projective level frames to uniform geometric Frey–Mazur over the original
base. The reader contains every target, dependency, construction API, Check and
consumer, followed by detailed arguments for the delicate steps. All targets
remain implementationStatus unchecked.

The packet has 66 nodes: 10 constructions, 4 definitions, 48 theorems,
2 comparisons and 2 applications; 86 API items, 43 discriminating tests,
54 planets and 11 pinned baseline declarations. All eleven layers have status
planned. There are no unrecorded internal inputs and no entries in gaps.
There are **29 open supplier contracts**, so the packet is complete, not closed.
Exact existing supplier nodes are used wherever their statements suffice.
The contracts and consuming node IDs are listed in full in both packet and
reader. They include the existing ModularCurvesPartII R12–R14 objects,
surface finite quotients and relative cycles, named surface resolution and
contraction settings, relative point-ball volume, gonality under domination,
and characteristic-zero geometric finite-étale base change.

The proposed Scheme and stack foundations, Part II: complex surface
contractions gives the smooth-surface Castelnuovo/termination extension a
dedicated home. Its precise current requests are to SF.4 and SF.5. Nothing is
silently attributed to an existing exact supplier node. No higher-tier notion
was moved into this roadmap, and no other packet was changed.

## Mathematical points for independent review

The entire published Bakker–Tsimerman article and entire author erratum were
read. There are 20 source findings (IDs E1–E10 and E12–E21); none is assigned
an independent verdict here. The existing independently rejected E11 is not
revived. In particular the exact Hurwitz equality includes the negative term,
and its use as an upper inequality is separated from the source's compressed
little-o notation.

The new work requiring especially careful independent verification is:

* The compact systolic upper witness: the source's U(p)L(−p) dies after
  filling. The replacement M_p has exact word factorizations in both residue
  classes modulo three and compact triangle trace
  (27/(4π²))p²+O(p). The reader supplies the calculation.
* The compact lower bound counts deep visits, including repeated visits to
  the same cusp, and bounds their detour costs uniformly. It uses no
  unsupported one-cusp assertion.
* Cofactor reconstruction retains both determinant signs. The signed bicusp
  and overlap targets include conjugate Hecke loci. E18 gives the
  negative-reflection cusp check at p≡1 mod4; E19 records the uncontrolled
  sign in the overlap proof. The reader explains the cusp normalization and
  the ordinary-degree obstruction m≥p−1. These are additional findings,
  not corrections attributed to the author erratum.
* The signed SBC estimate uses independent exponents, an overlap count and
  the appropriate cosh/sinh relative-volume ratio. It gives the stronger
  p·mult_SBC=o(Deg), including the negative-sign branch.
* The unrestricted Proposition 27 fails on an ample curve inside T₁×T₁:
  its summed-multiplicity/canonical-degree ratio is 3p/(p−6). The planned
  theorem requires both projected cycles to be nonconstant and non-Hecke,
  and the pencil pullback proves those hypotheses. The reader expands the
  signed tube and radial-shell argument with the corrected sinh(R) angular
  count. It splits the area forms projectionwise, attaches a single order-p
  coset to a pair of projected centres, and uses a strengthened bicusp
  reconstruction giving both thin-tube proximity and cusp separation. It
  charges projected multiplicity at most two once globally; it does not
  infer a three-bicusp statement from three product centres.
* The point-ball comparison needed in that shell argument has a separate
  HV.4 request and a new Green-identity/coarea derivation. It proves
  V(r)≤C_n(1+r)exp(r−R)V(R), not a false monotonicity of V/a(r). The extra
  logarithmic factor is absorbed after fixing the enlargement constant
  and then the small exponent. E20/E21 identify the missing point-ball
  and overlap inferences in the published proof. This new bridge also
  requires careful independent review.
* The actual linear torsion isomorphism kills the quadratic character on a
  primitive rank-one geometric Hom lattice. Full SL₂ image, extension over
  U and finite-type spreading are proved as bridges, not assumptions in a
  family record.

Imported plans remain conditional: HyperbolicCurveVolumesAndGonality has a
needs-changes review; IG and NéronModels retain their named gaps;
AbelianSchemesAndArithmeticModuli retains its normal-extension gap; and
ComplexComparisonPartII records a current-upstream integration-carrier gap.
The packet does not describe any of these suppliers as implemented or closed.

## Reuse and sources

The pinned Mathlib and Tau Ceti source statements and relevant reviewed
library audits were read. Matrix.SL2.commutator_eq_top already supplies
perfectness and is imported, not planned again. Current TauCetiRoadmap main
0d144d044dacebca17b654695b6f1ad58f159b27 and Tau Ceti
a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 were checked read-only, including
the nine roadmaps missing from the atlas snapshot. The existing current
quadratic-twist point cocycle is noted for reuse; it is not misidentified as
a pinned declaration.

Sources read: the published article (709–744); all five pages of the author
erratum; Abramovich's full five-page preprint; and the cleared BLR volume in
place at §1.2 Proposition 8, page 15, and §1.4 Proposition 2, page 19.
Public source URLs, access dates and PDF hashes are recorded in the packet.
No restricted file or passage was copied. The source item ownership map
accounts for all 120 extraction items. Item 119 is explicitly excluded:
general type and uniqueness are unnecessary for existence of a smooth
minimal model with the stated known-curve support. No unread Hermann or
Kani–Schanz theorem is used. No missing source is used as an implicit input.

## Validation and continuation

* `python3 scripts/check_blueprint.py research/blueprint/packets/GeometricFreyMazur.json`
  with the pinned local declaration index: zero errors, zero warnings.
* The five deliverable paths pass the intake file check; JSON parsing,
  dependency acyclicity, reader/packet target and API/test coverage,
  source-item accounting, line limits and absence of placeholder data
  definitions are checked locally.
* `lean-check research/blueprint/suggested/GeometricFreyMazur.lean` at the
  pinned shared build: exit 0, zero errors, 37 declaration-uses-placeholder-proof
  warnings and no other warnings. The file is 233 lines and has real bodies
  for its light formulas and set adapters. No heavy carrier is fabricated.
  Available memory exceeded 80 GB; no build, update, cache download or
  language server was run. The imported Tau Ceti transvection module was
  compared with its pinned source.
* Integer determinant/word checks at p=7,11,31,101,1009,10007 agree with the
  witness formulas; the deformed trace ratios approach 27/(4π²). These
  numerical checks supplement, rather than replace, the reader's proof.
* Relative point-ball comparisons also pass scalar checks on the curves
  (z,az) and (z,z^d), including unequal coordinate growth.

No design continuation is requested. The next work is independent review,
especially of the new signed, point-ball and projectionwise repairs, then
fulfilment of the named supplier contracts before any claim of closure.
The mathematical proofs and all
resumption-relevant facts are in the committed files; no scratch file is
needed by the next worker.
