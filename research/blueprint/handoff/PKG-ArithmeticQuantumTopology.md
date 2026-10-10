# PKG-ArithmeticQuantumTopology — blocked supplier handoff

Worker: Codex (GPT-6), session `codex-1GioGy`, issue #7889, 2026-10-10.
Branch: `codex-1GioGy-arithmetic-quantum-topology`.
Starting explorer commit: `f9d4c17fd933f5012756238a55f02350f8a21fd0`.
The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7889#issuecomment-6097042316)
was [confirmed](https://github.com/CBirkbeck/tauceti-explorer/issues/7889#issuecomment-6097043377)
for this session. All forty manager-priority issues were checked; none was
`state:available`. WORKERS' fallback ordering selected this available focus
package before the available ordinary review and planning jobs. This session
claimed only #7889.

## Result and scope

**Blocked checkpoint; the package remains incomplete.** This submission changes
only this handoff. It consolidates the recursive checkpoint history into the
current obstruction and restart worklist. The README, Suggested.lean and
accepted packet are unchanged. The blocker is the unprovided G1 geometric
supplier interface, rather than this run's time limit or an elaboration error.

The complete prior handoff, including source URLs, hashes, exact formula
controls, historical checks and the provenance of each saved addition, remains
available at this immutable [historical handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/f9d4c17fd933f5012756238a55f02350f8a21fd0/research/blueprint/handoff/PKG-ArithmeticQuantumTopology.md).
Use it for the detailed receipts summarized below. Historical source readings
and axiom checks are not represented as new checks by this session.

Issue #7889 authorizes only its three package files and this handoff and
instructs the worker to change no packet and describe a plan mistake here.
PROTOCOL §§13, 15 and 20 require the plan's actual signatures and retain
shared foundations at their owner. Completing this package requires the exact
supplier interfaces below. Building them under private substitute types,
removing their consumers, or changing the supplier/accepted packet would not
meet those requirements within this issue's permitted files.

The accepted target-level pass explicitly has eight gaps, nineteen open
requests, eight planned stages and zero closed stages. Its acceptance records
those boundaries. In particular, a matrix cokernel does not instantiate the
homology of an actual filled manifold. The package Suggested.lean has no
active declaration named `linkingMatrix`, `surgery`, `homology_surgery`,
`isIntegralHomologySphere_iff` or `surgery_disjoint_union`, although the plan
and README require them. This targeted inventory is enough to disprove
completion; it is not an exhaustive audit of the other signatures.

## Fresh supplier verification

Read-only upstream checked at:

- TauCetiRoadmap: `48cda9fcc5dbdc8f8d51e717f6a3090e0c4cd688`.
- Current Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
- Baseline Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.
- Baseline Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.

Read GeometricTopology and RepresentationTheory/SemisimpleAlgebras READMEs in
full, and GeometricTopology's entire Suggested.lean. The geometric suggested
file has no active link, filling or Kirby declarations. The current library
statements below were read directly; `FramedMarkovBraid`, `MarkovEquiv` and
its reflexivity statement were also read with `git show` at the baseline
Tau Ceti commit.

| Supplier statement inspected | Actual output | Outstanding consumer interface |
| --- | --- | --- |
| `TauCeti/KnotTheory/SmoothLink/Basic.lean`, `SmoothLinkEmbedding` | `Fin n`-indexed smooth circle embeddings with disjoint component images | Transported Seifert framing, invariant pairwise linking numbers, and framed diagram/braid comparisons |
| `TauCeti/KnotTheory/SmoothLink/Isotopy.lean`, `SmoothAmbientIsotopic` and its setoid | One ambient diffeotopy transports all labeled embeddings simultaneously | Framing data and theorems transporting those data |
| `TauCeti/KnotTheory/Markov.lean`, `FramedMarkovBraid`, `MarkovEquiv`, `MarkovEquiv.refl` | Integer component framings; ordinary Markov equivalence on the forgotten braid | A framing-preserving presentation relation and invariant transport |
| `TauCeti/LowDimTopology/DehnSurgery/Slope.lean`, `BoundaryTorus.firstHomology`, `FramedBoundaryTorus`, `coord_symm_apply`, `meridian`, `longitude`, `slopeEquiv` | Actual torus singular H₁, an ordered basis, and primitive-class slopes modulo sign with rational coordinates | A link exterior and oriented filling, the filling's homology comparison, Kirby/Fenn–Rourke calculus and stable form realization |

Searched all current Tau Ceti Lean files and upstream suggested Lean files for
linking-number/matrix, framed-smooth-link, framed-Markov-equivalence,
Dehn-filling and Kirby names. No matching active declaration supplied the
missing interfaces. No GeometricTopology Part II packet, reader, roadmap
definition or package appeared in the atlas deliverable filename search.
These are targeted searches, not a comprehensive library audit. The reviewed
`data/library-coverage.json` has 1,316 layer entries and no direct
ArithmeticQuantumTopology entry; that absence certifies no implementation.
Neither read-only tree was modified or built. No new paper theorem or source
erratum is asserted, and no restricted book or source passage was used.

## Exact G1 contracts and ownership

The accepted packet's existing requests identify these owners; no mathematical
ownership was moved in this run.

1. `tauceti:TauCetiRoadmap/GeometricTopology#layer-4-knot-theory-done-properly-owned-here`:
   provide framed oriented link/tangle presentations, finite components,
   pairwise linking numbers, integer Seifert framing, framed isotopy, and
   diagram/braid comparisons. The linking matrix must be symmetric with
   diagonal framing entries and off-diagonal linking numbers. Supply the
   normalized Jones comparison, including the variable inversion and mirror
   conventions. The existing route assigns additions absent from the upstream
   layer to GeometricTopology, Part II.
2. `tauceti:TauCetiRoadmap/GeometricTopology#layer-5-dehn-surgery`:
   provide oriented surgery at slope fμ+λ, first homology identified with the
   integral linking-matrix cokernel, and the integral-homology-sphere criterion
   det A=±1. Supply ordinary Kirby/Fenn–Rourke equivalence, stable integral
   unimodular-form diagonalization and realization by ordinary moves. The
   existing request routes the missing contract to GeometricTopology, Part II.
   QT owns the admissible band-slide and Hoste refinements.

The first request feeds `QT.0/framed-link-and-linking-matrix`,
`QT.1/bottom-tangle`, `QT.1/reshetikhin-turaev-functor` and
`QT.2/jones-normalization-comparison`. The second feeds
`QT.0/surgery-presentation`, `QT.0/kirby-and-fenn-rourke-moves` and
`QT.0/refined-presentation-existence`; G1 also names `QT.3/JM-well-defined`.

Follow upstream's presentation conventions: a common geometric presentation
and framing transport suffice; no umbrella `Knot` or link-type hub is required.
A surgery result is a manifold type with the standard Mathlib instances and
explicit orientation data, compared by diffeomorphism in theorem statements.
Geometric handle slides retain the chosen band: equal matrix operations do not
identify different geometric bands.

Preserve the native `FramingChecks` regression already in Suggested.lean.
The one-strand identity braid with framing 0 and with framing 1 has identical
forgotten presentations, so ordinary `MarkovEquiv` relates them. Their
one-component coefficient matrices are [0] and [1]; `IsAdmissible` rejects
[0] and accepts [1]. `framing_change_admissibility` and
`admissibility_not_descends` express this distinction. They prevent using the
forgetful relation as framed transport. This run reread their proofs and
elaborated the whole file; their historical isolated no-`sorryAx` diagnostics
are in the archived handoff and were not rerun.

## Consolidated continuation worklist

The inherited eight-layer worklist, updated for the latest QT.0/QT.7 additions,
follows. These entries describe saved prototypes and remaining specification work; they do not certify mathematical
implementation or recertify the prior source audits.

| Layer | Native pieces saved | Full signatures still required |
| --- | --- | --- |
| QT.0 | Algebraically split/admissible matrix conditions, integral matrix cokernel and handle-slide congruence, discriminating small matrices and native framing regression | Framed-link linking matrix and tests; actual surgery/H₁ comparison; ordinary Kirby import; admissible band-slide, Hoste and presentation-existence refinements on those carriers |
| QT.1 | Native compatible-quotient U_h, PBW/classical comparison, integral forms and image completions, completed ordinary/integral tensors; continuous Hopf/R/ribbon and color actions; native finite free ribbon module category; adjoint/transmutation maps, laws and even image-filtration interfaces | Odd/graded transmutation refinements; general Lie-type core/twist data (QT-owned work); supplier framed tangles, RT functor and universal bottom-tangle invariant |
| QT.2 | Formal finite free colors/basis and explicit actions, continuous U_h-module and ribbon comparisons; divided powers and pivotal matrix trace; tensor/Clebsch–Gordan and character comparisons; Laurent Chebyshev polynomials, cyclotomic lattice/filtration and genuine quotient inverse limit, coordinate/topology/truncation APIs; native even image center, Casimir, sigma quotient limit, canonical integral realization and coefficient/color APIs; scalar Kashaev kernel | Link invariant and normalization, divisibility and expansion, unified Kashaev construction on actual knots |
| QT.3 | Actual completed twist elements, prime/tilde coefficient comparison, nonfinite support, inverse relation and even-color characters | Geometric Hopf pairing comparison and twisting theorem, JM on an actual integral-homology-sphere/surgery carrier, independence, connected-sum and orientation comparisons |
| QT.4 | Earlier scalar conventions | Root categories, strong Kirby colors, WRT and JM evaluation, Ohtsuki series and rigidity on the exact integral coefficient ring; general Lie-type core/parity/filtration |
| QT.5 | Principal charts, actual cut quotient/homeomorphism, intrinsic four-component flattenings, exact lifted five-term lattice, two relation subgroups, extended pre-Bloch quotient/Dehn kernel, universal ordinary forget/boundary square; conditional complex-period Rogers regulator and cut/sign/imaginary comparisons | Instantiate ordinary pre-Bloch and Polylogarithms suppliers and their convention/branch laws; actual strong/geometric flattening and Pachner interface; number-field Bloch and K₃ torsion comparison |
| QT.6 | Linear NZ/Hessian formulas, finite polynomial NZ/root vertices and exact prefactors; conditional normalized linear-bracket adapters with integer-power recovery and root weighted averages; full scalar meromorphic Faddeev signatures, selected real-b integral formulas, charged kernel action under explicit integrability/continuity, scalar root-NZ weights | Geometric NZ/root datum and HB.4 coefficient-field bracket instance; formal move invariance and root arithmetic descent; qualified HB.8/HB.9 bridge; operator pentagon; leveled shape/gluing carrier, microlocal products, AK convergence/invariance and selected volume theorem |
| QT.7 | Finite figure-eight root sums/descendants, denominator cocycle and pole-free action API, explicit scalar/diagonal/GL automorphy factors with composition and sign APIs, conditional ordered matrix transport, scalar bounded-denominator QMC/GQMC criteria, native descendant Taylor/h-series and half-row controls, a partial provenance ledger | Actual representation-indexed knot rows/matrices and geometric instantiation of the scalar criterion; matrix asymptotic and analyticity predicates, lifts/quadratic/coefficient conjectures; proved BD comparison signatures; full six-column ledger and its tests |

The most recent QT.7 additions also retain native Taylor and h-series for
figure-eight descendants and their half-integral first row, and scalar
QMC/GQMC criteria using finite `PowerSeries.trunc` evaluation and bounded
rational-denominator filters. Keep their nonvanishing hypotheses and
source-specific signs. They still need the knot/representation family and
geometric series adapters, and do not supply the remaining matrix rows or
prove the conjectures.

Preserve these load-bearing interfaces when completing the table:

- QT.1 uses actual quotient algebras and completed tensor constructions;
  the quantum integral image completion must retain its own injectivity
  boundary. Classical root/highest-weight theory is imported.
- QT.2/QT.3 use a genuine color quotient inverse limit and actual completed
  twists, including the prime/tilde normalization comparison and topological
  convergence. Pointwise coefficient multiplication does not replace the
  color product. Instantiate geometric Hopf pairings against the supplier.
- QT.5 retains its native cut cover, four flattening components, lifted
  five-term relations, ordinary forget/boundary square and conditional Rogers
  regulator. Obtain its concrete branch laws from Polylogarithms. Preserve
  integral factor-two/torsion distinctions and the ambiguity of a Suslin lift.
- QT.6 polynomial vertices and normalized linear Gaussian brackets need a
  coefficient-field instance and actual geometric NZ data. Formal contractions
  do not prove analytic remainder estimates. The HB.8/HB.9 comparison retains
  coefficient transfer, all-order identification/gluing, signed Kummer
  orientation, effective HB.7 descent and the full quadratic finite étale
  coefficient algebra, including split components and the allowed root orders.
- QT.7 retains representation twists, scalar/matrix weight conventions,
  pole-free domains and nonvanishing conditions. Complete the provenance
  ledger; keep conjectural claims distinct from the proved BD cases.

The other seventeen open requests remain in the accepted packet. Their owner
and purpose inventory is:

| Owner | Required interface |
| --- | --- |
| GeometricTopology layer 1 | Oriented gluing, connected sum/reversal, ordered pseudo-manifold face pairings and AK homological admissibility |
| GeometricTopology layer 7 | Complete finite-volume cusped ideal geometry, peripheral completeness, ordered hybrid flattenings, Epstein–Penner refinements/connectivity and nondegenerate geometric NZ data |
| Polylogarithms P.2 | Oriented ideal-tetrahedron volume and regulator comparison |
| K3BlochGroups V.3, V.4, V.6 | Integral Bloch-convention maps, Suslin exact sequence and lift/torsion bookkeeping |
| HabiroNahmSeries HB.4 | Filtered Gaussian bracket; requested analytic reciprocity/contour estimates with branch and uniformity hypotheses |
| HabiroNahmSeries HB.8, HB.9 | Corrected refined Gaussian normalization and the qualified all-order finite étale module comparison |
| HabiroNumberFields HB.6, HB.7 | Arithmetic Frobenius coefficient ring and full finite étale K₃-indexed module with effective descent |
| QSeriesPartitionsAndMockModularForms QM.0, QM.5 | Product/branch identities and generic multiplicative matrix cocycle/extension interfaces |
| AutomorphicSpectralTheory AS.0 | Self-adjoint Schrödinger calculus/common core and nuclear kernel interface; microlocal products/pushforwards require the separate PDE extension recorded in upstreamNotes |
| Polylogarithms P.1 | Concrete dilogarithm branch/continuation, Bloch–Wigner and rational nonpositive polylogarithms |
| LieHighestWeight layers 1 and 3 | Classical root-space/sl₂ data, enveloping/PBW/highest-weight interfaces |

For packaging, replace the old AS.0 bookkeeping with the current upstream
OperatorTheory/SelfAdjointSpectralTheory supplier where its statement matches;
the missing microlocal extension must remain explicit. The README already
records that boundary. Check each other supplier's exact current statement
before instantiation. General Lie-type cores, odd transmutation refinements
and knot-specific series are QT-owned work, not foreign requests.

## Restart steps

1. Have the existing GeometricTopology contracts supplied, or have the
   maintainer reconcile the scope and ownership in the authoritative plans.
   Repeating a package pass while those contracts are unchanged cannot close G1.
2. Instantiate the saved admissibility, slide and cokernel algebra on actual
   framed presentations and fillings. State the genuine band-slide/Hoste
   operations, refined existence and unified-invariant consumers. Preserve
   `FramingChecks` as a negative control on the forgotten relation.
3. Complete every remaining layer in the table against its exact suppliers,
   with the plan's named API and at least three discriminating tests per
   definition/construction. Use the historical handoff for source receipts
   and the accepted packet for exhaustive target tracing.
4. Reconcile all prerequisites with current upstream/lower-tier packages,
   keep source statements in our own words, rerun packet and Lean checks and
   check the README's 200,000-byte limit before declaring §20 complete.

The intended metadata is `topic = "math.GT"`. It remains absent: the package
is incomplete, and `issues.deliverables_complete` classifies it by existence
of all its output paths. Adding metadata now would route this checkpoint as
completion. No label, issue state or supplier was changed by hand.

## Validation in codex-1GioGy

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticQuantumTopology.json`:
  exit 0, zero errors and warnings; 106 nodes, 206 API items, 159 tests,
  36 planets, 24 baseline declarations, eight gaps, nineteen requests,
  eight planned stages and zero closed stages. Packet unchanged.
- `lean-check research/blueprint/packages/ArithmeticQuantumTopology/Suggested.lean`:
  exit 0, zero errors, 631 warnings, all `declaration uses sorry`, and zero
  other warnings. Available memory before the check was 102 GB. This proves
  elaboration of the signatures present, not completion of omitted targets.
  The managed helper identifies the baseline pins above and uses the existing
  shared build; no build/update/cache operation or language server was started.
  The check finished and no session-owned compile remains running.
- Scoped `python3 research/blueprint/intake.py check-files research/blueprint/handoff/PKG-ArithmeticQuantumTopology.md`:
  exit 0, one file and zero problems. `git diff --check` also passes.
  The changed-file inventory contains only this authorized handoff.
- Unchanged accepted packet SHA-256:
  `161dc9ce320280e75c2c5ebf1923d8bd0529dabbccc013ad3b9d547cc1ead951`.
- Unchanged README: 199,994 bytes; SHA-256
  `5bd56e1ce32e48ff22dcd7bdf47c2d37cd58d1fb1ae4bf3343877375ca5bdf6d`.
- Unchanged Suggested.lean: 228,706 bytes; SHA-256
  `3ebecbe368cb1de5cefec70e818f22eeeed0cd9064e1bad5cf6e37c6b514111f`.

All continuation information is in this note, the archived handoff and the
unchanged mathematical files. The next worker needs no scratch files. Stop
this run after its checkpoint pull request; do not claim a second job.
