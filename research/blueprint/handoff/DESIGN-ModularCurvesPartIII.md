# DESIGN-ModularCurvesPartIII — codex-8uXpDn

Completed import-only design for issue #3415, by Codex, session codex-8uXpDn.
The claim bot confirmed comment 6261194327 in reply 6261196412 before work began.
This is a finished ownership reconciliation, not a checkpoint. No second job was claimed.

## Result

The issue's sole route already explicitly names GeometricFreyMazur. Design #1698
and independent review #1725 supply an accepted plan for precisely this mathematics.
PROTOCOL §§9 and 15 require importing it, rather than assigning its declarations to
another owner. The five deliverables follow the accepted import-index precedent of
EllipticCurvesPartII and EllipticCurveModularityPartII.

All 64 routed extraction items are accounted for: 63 import planned mathematics;
item 119 (general type and uniqueness) retains the owner's explicit exclusion.
Minimal-model existence with known-curve contraction support does not require it.
All 67 canonical nodes are imported: 49 theorems, 9 constructions, 4 definitions,
3 comparisons and 2 applications. Their 80 API items, 40 definition tests and
53 planets retain their names and sole owner. The alias owns zero new nodes,
API items, definition tests or planets; its Lean examples are anonymous checks.
Eleven pinned baseline declarations are cited.

Each alias stage GF.0–GF.10 is `source_decomposed`, with empty remaining import
accounting. Each imports only the matching canonical stage. Every canonical stage
is still `planned`; none is closed, and implementation remains unchecked.
The checker reports these eleven import stages in its aggregate planned count.
The packet snapshots all canonical coverage records and nineteen open requests;
there are no newly owned gaps or requests. This does not certify proof closure.

The merger proposal keeps GeometricFreyMazur and all its identifiers, maps alias
GF.n to owner GF.n, and proposes retiring the four alias publication files only
after the maintainer checks inbound references and queue routes. No merger was
applied and no canonical, queue, atlas, application or upstream file was edited.

## Mathematical conditions preserved

- The compact systolic witness survives filling; the printed U(p)L(−p) does not.
  Both relevant lengths are 4 log p+O(1), with half-length radius 2 log p+O(1).
- Integral SL₂ lifts are component-preserving. Unique cusp lifting requires
  8δ<1. Reconstruction preserves determinant sign, hence ordinary and conjugate
  Hecke cases. Conjugate Hecke loci are not algebraic divisors.
- Cyclic Hecke degrees use ψ(m), not σ₁(m). Weighted cycles and multiplicities
  remain explicit. Constant cusp coordinates contribute zero area.
- The corrected rotation count retains the additive 1 and sinh R. SBC decay is
  p-weighted. The small-parameter ordering and p^(24δ₃) overlap factor remain.
  Big-diagonal decay requires nonconstant, non-Hecke projected cycles.
- Pencils use the scheme symmetric power and relative finite-flat cycles, not
  the native multiset carrier alone. Local cyclic inertia has at most one p
  factor. Hurwitz retains −2deg α and the independent Deg C/(2n) lower bound.
- The independently corrected Hecke lift gives f[p]=λΨ. The rank-one geometric
  Hom lattice has sign Galois action; actual Ψ and odd p eliminate the negative
  sign, then the isogeny extends over the original U. Full SL₂ monodromy is not
  an assumption of this descent. GF.8 spectral, gonality and monodromy statements
  are separate retained targets; characteristic-zero monodromy has its own bridge.
- Finite-type spreading embeds only a field of definition in C. Strict gonality
  thresholds are enlarged for the bounded-genus consequence. Minimal-model
  existence does not assert uniqueness or that every Hecke curve is contractible.

The nineteen requests remain with HyperbolicCurveVolumesAndGonality HV.0/HV.4/HV.6,
SchemeAndStackFoundations SF.1/SF.4/SF.5, AlgebraicCurves Layers 7/12,
FuchsianOrbifolds Layers 0–5, and ModularCurves §§0D/0E/2C/5B/5C. The reader lists
each contract; the packet gives exact consuming nodes and full statements.
The analytic supplier still has a `needs_changes` review. The owner's IG,
NéronModels, AbelianSchemesAndArithmeticModuli and ComplexComparisonPartII inputs
retain their own gaps. None was silently discharged.

The accepted review explicitly could not edit the canonical reader, which remains
stale in its sources, supplier contracts, tests and descent discussion. Re-render
that reader from the corrected packet before packaging. It is outside this job's
edit scope. This alias reads the corrected packet and flags this condition in
`upstreamNotes`; it does not repeat the old full-image descent premise.

## Sources and baseline boundary

Read the full published Bakker–Tsimerman article, pp.709–744, and all five pages
of the author erratum. Read Abramovich's Theorem 0.1 and §§1.1–1.7, preprint pp.1–3;
no claim to have read that entire preprint is made. Public URLs, access date
2026-10-19 and SHA-256 hashes are in packet and reader. No source excerpt, PDF or
section-by-section source summary is committed. No missing source was needed for
this import audit. No book was needed or copied; the canonical BLR extension
citation is retained through its owner, without claiming a fresh reading.
The twenty-one accepted source findings E1–E10 and E12–E22 are referenced by ID
and locator; no new errata review or independent acceptance is claimed.

Read all canonical node statements, hypotheses, proof routes and locators, the
thirteen definition/construction API/test inventories, the accepted review and
its handoff. Read the relevant reviewed library-coverage boundaries for
ModularCurvesPartII R12.2/R13.4a/R14.1, the parent level/Galois interfaces and
curve/area comparisons. The eleven native declarations and ambient hypotheses
were read at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. The shared-build Tau Ceti transvection
source was byte-identical to its pinned Git blob.

Current read-only inspection used TauCetiRoadmap main
0d144d044dacebca17b654695b6f1ad58f159b27 and Tau Ceti
a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Read FuchsianOrbifolds and
ConformalMapping readers in full, and ModularCurves §§0D/2C/5B with their
suggested interfaces. Whole-word searches in both current trees, including
roadmaps absent from the atlas snapshot, found no additional owner for the
route-specific rigidity and repulsion targets. This checks the import boundary;
it is not a new completeness audit of current libraries. Nothing there was run.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/ModularCurvesPartIII.json`:
  zero errors and zero warnings; complete, eleven covered import stages, zero closed.
- `python3 research/blueprint/intake.py check-files` on exactly the five deliverables:
  passed.
- `lean-check research/blueprint/suggested/ModularCurvesPartIII.lean`:
  exit 0, no errors or warnings. Seventeen anonymous acceptance examples; no
  admitted proof or data definition. Available memory exceeded 80 GB. No build,
  update, cache download or language server was run. The canonical suggested
  file was not recompiled and is not certified by this check.
- Structural checks: exact 64-item route set; 67 unique valid canonical imports;
  exact stage, API/test/planet inventories; retained inherited obligations;
  resolved local document links; no private paths, source excerpts or new source
  findings. JSON parsing and `git diff --check` pass.
- Concrete checks include witness determinants and traces at p=7,11, determinant
  sign under negation, Eisenstein norm, ψ(4)=6 versus σ₁(4)=7, small-exponent signs,
  native multiset repetition and mapping, the negative Hurwitz term and 7/800.
  The area check has s=(p²−1)/2 and 2g−2=(p²−1)(p−6)/12, so
  Area(Y)/Area(X)=1+6/(p−6), equal to 7 at p=7. Finite examples supplement the
  imported general arguments; they do not establish geometric estimates.

## Continuation

Independent review should check this import map and merger proposal, not design
another geometric Frey–Mazur plan. The maintainer handles the merger and canonical
reader synchronization; mathematical development stays with GeometricFreyMazur
and its named suppliers. No design continuation or scratch file is needed.
