# RT-AUDIT-29 — independent red-team report

Agent: Codex — codex-a71f92. Date: 2026-09-24.
Target: accepted AUDIT-29, including the corrections in REV-AUDIT-29.
Result: complete; no substantiated findings.

## Scope and method

I did not write or review the target audit. This attack covered
K2SymbolsBrauer, K3BlochGroups, KTheoryFiniteLocalFields and KTheoryLowDegrees.
I read their four documents, the audit's targets and notes, its accepted review,
and the relevant atlas descriptions. The explorer snapshot was
`283f7f90847999a66aa29c212c5db0887616b624`; the library baseline was Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

The accepted, enriched file contains 38 layers and 199 target occurrences
(177 distinct target strings): 154 absent, 35 partial, six Mathlib and four
Tau Ceti. There are 306 citation occurrences, 231 distinct declarations in
158 files, and 77 overlap references to 53 distinct destination layers.
These are post-review counts; the review's earlier citation/overlap totals
precede its additions and do not themselves establish an audit error.

I opened every cited declaration, read its statement and enclosing hypotheses,
and compared its claimed fit with the actual target. An independent index
reconciliation checked all 306 library/name/file/line tuples with zero
mismatches. I also compared the 38 audit records with
`data/library-coverage.json`: verdicts, target/library/note records and
duplicates agree exactly.

The five partly-built layers remain L.1, L.5, Z.1, Z.2 and Z.4. The other
33 remain not built. A layer containing useful partial ingredients is not
thereby a built K-theory construction.

## Searches for falsely missing mathematics

I searched the declaration index first, then both complete pinned Lean trees,
using 25 families of alternative names. The companion JSON enumerates them.
They cover higher K-groups and group completion; Steinberg, Milnor and
Dennis–Stein symbols; stable linear groups, Whitehead and Mennicke methods;
residues and reciprocity; local invariants, Kummer coefficients and Chern maps;
plus/Hurewicz and classifying spaces; Bloch groups and configuration methods;
finite-field K-theory, rigidity and coefficients; trace theories and
de Rham–Witt; completion; projectives, stable isomorphism and exterior powers;
rank, product rings, determinant and Picard groups; lambda operations;
scheme K-theory; and S-units.

Search hits were not accepted as theorems without inspecting the relevant
statements. No search established a missing higher K-group construction,
a stable general linear group tower, the claimed symbol presentations,
the scheme K-theory targets, or the missing comparisons. This is a bounded
negative result at the pins, not a claim about later versions or unpublished
formalizations.

Several close calls received additional checks:

- **U.1–U.6:** finite-rank transvections, commutator identities, determinant
  maps and elementary generation over fields or integers are genuine inputs.
  Their commutative-ring or field hypotheses do not supply the general-ring
  stable quotient, relative elementary group or arithmetic SK1 theorem.
  `LinearMap.GeneralLinearGroup.prodMap` is useful but does not itself
  construct the specified stabilized matrix-group tower. Restriction of
  scalars for free extensions is not the missing transfer on K1 of finite
  projective extensions.
- **Z.1–Z.2:** the exact category of finite projectives, split/exact K0,
  division-ring dimension calculation and locally constant rank are real
  positive results. I checked projective-to-flat/finite-presentation
  hypotheses, rather than treating rank as constant on an arbitrary spectrum.
  `Module.IsStablyFree` only covers the free comparison case of the requested
  stable-isomorphism criterion. Product-module rank formulas do not prove the
  product-*ring* K0 theorem.
- **Semilocal components:** the explicit discrete-topology premise on
  `PrimeSpectrum.ringEquivPiQuotientConnectedComponentsIdeal` does not
  invalidate the audit's finite-component note. Mathlib's
  `ConnectedComponents.totallyDisconnectedSpace`,
  `TotallyDisconnectedSpace.t1Space` and
  `Finite.instDiscreteTopology` supply it. The K0 decomposition itself
  remains missing.
- **T.4:** `TauCeti/FieldTheory/FunctionField/Divisor/Eval.lean` constructs
  divisor evaluation, including its admissibility and finite-residue-field
  qualifications. Its function/divisor laws, disjoint-support moving and
  degree-zero principal divisors do not state Weil reciprocity.
- **V.1:** `Mathlib/RepresentationTheory/Homological/Resolution.lean`
  defines `classifyingSpaceUniversalCover` as a simplicial G-set EG and
  constructs standard/bar resolutions. This is not the claimed connected-cover,
  plus-construction or K3/H3 comparison. Merely forming a nerve likewise
  does not establish the comparison.
- **L.1–L.6:** algebraic Clifford periodicity does not provide KU or Bott
  periodicity in topological K-theory. Witt-vector Frobenius/Verschiebung,
  ordinary completion, algebraic homotopy fibres and model-category
  terminology do not supply the missing de Rham–Witt, spectral trace,
  coefficient and derived K-completion constructions.
- **U.4:** `TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean` explicitly
  separates finite generation from the missing S-unit rank refinement. Its
  discussion of a later Mathlib pull request is not evidence that the result
  exists at the pin.
- **Z.3–Z.5:** the generic monoidal SplitK0 ring construction does not
  silently equip finite projectives with the required monoidal category
  structure. Free exterior-power results do not state projectivity for all
  finite projectives. `CommRing.Pic` and `ClassGroup.equivPic` concern
  rings. Tau Ceti's `LineBundleClass` ends at a commutative monoid, while
  `Curves/StableReduction/Picard/Basic.lean` constructs a numerical
  intersection-lattice cokernel and expressly does not construct line bundles
  on a model. Neither supplies the missing scheme Picard/K0 comparison.

## Overlap and ownership attack

Every one of the 77 references resolves. I read all 53 destination descriptions
and compared the mathematics with the associated note, including arithmetic
localisation and examples, the field-symbol and local-Hilbert interfaces,
Bloch/regulator conventions, trace and crystalline imports, general K-theory,
scheme operations, and the upstream curve/Picard and Grothendieck-group owners.

The audit uses “duplicates” to include explicit owner/consumer overlaps,
not only accidental independent definitions. In particular, N.1's imported
degree-zero/one arithmetic consequences and H.3's plus-construction test are
valid recorded overlaps, not evidence that those consumers must be deleted.
The review's two added overlap records survive rechecking.

The additional atlas vocabulary sweep did not establish a further duplicated
construction. Curve SK1 is distinct from stable-matrix SK1; a motivic/Bloch
comparison does not redefine the Bloch group; readiness aggregation nodes are
not new proof owners. General Hurewicz is an upstream input to the K3
comparison, not a second construction of that comparison.

## Validation and limits

The two deliverables pass:

```text
python3 scripts/check_redteam.py research/blueprint/redteam/RT-AUDIT-29.result.json
python3 research/blueprint/intake.py check-files research/blueprint/redteam/RT-AUDIT-29.result.json research/blueprint/redteam/RT-AUDIT-29.md
```

No Lean source was changed or compiled. The attack verifies the accepted
library audit and its overlap evidence; it is not a fresh extraction of every
paper behind the four roadmaps, nor a proof that their future formalizations
are complete. No source erratum or library-correction finding is asserted.
