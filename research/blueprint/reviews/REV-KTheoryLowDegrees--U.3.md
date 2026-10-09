# Independent review: KTheoryLowDegrees, part U.3

Job `REV-KTheoryLowDegrees--U.3`, issue #7547. Reviewer: Codex,
session `codex-6xmqDr`, 2026-10-09. The planning session was
`codex-flY2Wo`; this reviewer did not write the plan.

**Verdict: accepted.** All six new nodes and all seventeen baseline citations
are verified. No mathematical correction, removed citation or added node was
necessary. The packet describes a complete planning pass with planned coverage,
one precise supplier request and one corresponding gap. It does not claim that
the retraction has been supplied or that any declaration is implemented.

The packet, suggested Lean file and reader were reviewed together. The only
changes are the packet's independent review object, this report and the review
handoff. The suggested file and reader already agree with the mathematics and
remain unchanged.

## Counts and declaration checks

There are one construction, four lemmas and one theorem, all still marked
`unchecked`; five construction API items; three unit tests; seventeen baseline
records; forty-four imported targets; one target refinement; and no new planets.
The parent already supplies the six U.3 planets.

Node names in the following table have prefix `KTheoryLowDegrees:U.3/`.

| Node | Verdict and closure check |
| --- | --- |
| `so-homotopy-transfer` | Verified. Joint continuity of the matrix homotopy and determinant-one membership give a bundled map into SL. Composition with the supplied continuous map gives a native SO homotopy. Retraction properties are needed only by subsequent boundary lemmas. |
| `so-homotopy-transfer-apply` | Verified. Bundled composition evaluates as ordinary composition; the SL constructor has exactly the specified underlying matrix. |
| `so-homotopy-transfer-zero` | Verified. The initial matrix equation identifies the SL value with its identity by subtype extensionality. The hypothesis that the supplied map fixes the identity then gives the initial SO equation. |
| `so-homotopy-transfer-one` | Verified. The coordinate equation identifies the final SL matrix with that of the specified native SO element. The coordinate-fixing contract gives the required final SO value. |
| `so-homotopy-transfer-basepoint` | Verified. The same subtype argument at the circle basepoint gives the identity for every time parameter. |
| `circle-no-sl-contraction-via-retraction` | Verified. Transfer an assumed SL contraction, apply the three boundary lemmas and contradict the imported native SO obstruction. Circle exponential surjectivity supplies an angle separately at each point; half that angle is the parent's Spin parameter. No continuous choice of angles is asserted or needed. |

These nodes split the application at lemma granularity. The remaining
construction congruence API follows by pointwise equality, proof irrelevance
and continuous-map extensionality. It is not a hidden prerequisite of another
node. The tests distinguish identity transfer, the positive quarter-turn and
the determinant-one diagonal matrix with entries 2 and 1/2. In the last test,
that diagonal matrix cannot be a native orthogonal coordinate matrix: it sends
the first basis vector, of quadratic value 1, to a vector of value 4. This checks
that determinant one alone has not been mistaken for orthogonality. The
quarter-turn's native witness is supplied by the parent Spin formula at angle
π/4, so the conditional example has a concrete intended specialization.

## Public sources and conventions

I opened the node locators in both public mathematical sources and confirmed
their file hashes against the packet. All descriptions here and in the packet
are in the workers' own words; no excerpt was introduced.

* [Weibel, *The K-book*, author-hosted combined draft, 29 August 2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf): III.1.5, printed p.184 (PDF p.192), and III.1.5.3–4, printed p.185 (PDF p.193). SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`.
* [Morris, *Introduction to Arithmetic Groups*, version 1.0, April 2015](https://deductivepress.ca/IntroArithGrps-FINAL.pdf): §7.1, Theorem 7.1.1 and Exercises 1–4, printed pp.152–154 (PDF pp.168–170). SHA-256 `b08e0faff5dd1e26a96dc838ffd1497e05a8a0f5fe46ce75a87c79d470c799fa`.

The elementary coefficient-scaling argument supplies the forward implication
from a finite elementary factorization to a matrix path. The plan does not
silently use the stronger continuous-function comparison to identify the whole
SK₁ of the polynomial circle ring. Weibel's displayed real-circle rotation is
the inverse of the parent's positive column rotation. Inversion preserves
nontriviality, and the packet explicitly reconciles that convention. This is
not a source error.

Morris's unique positive-diagonal KAN decomposition has continuously varying
factors. Its K projection fixes an orthogonal determinant-one input because
that input already has factors (itself, identity, identity). The determinant
and orientation conditions are those of SL and SO. This establishes the
classical supplier contract, while the packet correctly requires its public
comparison with Tau Ceti's native quadratic-form carrier. A bare factorization
or nonunique KAK factor would not supply the requested continuous retraction.

The packet's `sourceIssues` list is empty. The inspected passages disclose no
additional source mistake requiring an erratum.

## Pinned baseline

Every listed declaration's actual statement was read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The source reads used the recorded
commits, rather than assuming a shared build's current checkout was the pin.

| Pinned module | Confirmed declarations and role |
| --- | --- |
| [Mathlib: SpecialLinearGroup](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean) | `Matrix.SpecialLinearGroup`, `.coe_mk`, `.coe_one`: determinant-one subtype, constructor coordinates and identity coordinates. |
| [Mathlib: topology constructions](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Constructions.lean) | `Continuous.subtype_mk`: continuity with a pointwise membership proof. |
| [Mathlib: continuous maps](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/ContinuousMap/Basic.lean) | `ContinuousMap.comp`, `.comp_apply`: bundled composition and its evaluation. |
| [Mathlib: Circle](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Complex/Circle.lean) | `Circle.exp_surjective`: pointwise existence of a real angle. |
| [Tau Ceti: RealForm](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/CliffordAlgebra/RealForm.lean) | `TauCeti.realCliffordForm`, `.realCliffordForm_apply`, `.realCliffordForm_zero_eq_weightedSumSquares_one`: the compact-signature form is the sum of coordinate squares. |
| [Tau Ceti: OrthogonalGroup](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup.lean) | In `TauCeti.QuadraticMap`: `specialOrthogonalGroup`, `mem_specialOrthogonalGroup_iff`, `mem_orthogonalGroup_iff`, `specialOrthogonalToGeneralLinear`, `specialOrthogonalToGeneralLinear_apply`. These give determinant-one form preservation and the faithful column-coordinate representation. |
| [Tau Ceti: SpecialOrthogonal topology](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Topology/Algebra/QuadraticForm/SpecialOrthogonal.lean) | In `TauCeti.QuadraticMap`: `instTopologicalSpaceSpecialOrthogonalGroupPi`, `isEmbedding_specialOrthogonalToGeneralLinear`. These give exactly the induced topology and coordinate embedding required here. |

I also checked the pinned SL subtype topology and the matrix-to-native helpers
in `RealSpecialOrthogonal.lean`. The latter helpers are private; they cannot
serve as the requested public comparison. Targeted searches in the pinned
topology, analysis and linear-algebra sources supplied no usable retraction
API. The reviewed U.3 library audit, `AUDIT-29`, supplies finite determinant and
field transvection machinery; none of the six new nodes duplicates its
existing declarations.

## Imported targets and ownership

All forty-four imports resolve to the accepted U.1 packet, with the same target
identifiers. I read their statements and direct prerequisites, concentrating on
evaluation of the real-circle ring, elementary-path normalization, the ordered
coordinate frame, Spin coordinates, the lift endpoint and the based SO
obstruction. The transferred homotopy has precisely the obstruction's initial,
final-coordinate and based boundary equations. The final suggested signature
takes the parent's coordinate and obstruction outputs as explicit hypotheses;
these are mathematical contracts, not placeholder predicates.

The one refinement preserves `SK1-real-circle-nonzero` and its independent
Dedekind prerequisite. It asks assembly to add the new bridge theorem to that
target's prerequisites. A prospective dependency graph with this edge added is
acyclic under either source/reviewed packet precedence; the target reaches
forty-eight declaration nodes. No parent packet was edited or re-reviewed.

The request belongs to the existing LieGroups layer 9, whose multiplication
diffeomorphism and GL/SL Gram–Schmidt description I read. Its contract quantifies
over every rank at least two, states both topologies, fixes the identity and
requires the native coordinate-fixing equation. The incoming/outgoing stage
interfaces and link maps introduce no further U.3 obligation. The follow-up
does not re-plan LieGroups or the parent's algebraic targets. Planned coverage
is honest while this named supplier remains outstanding.

## Validation and limits

The packet checker reports six nodes, zero errors and zero warnings.
The intake file check and whitespace check also pass. The reader and suggested
file retain the same hypotheses, conventions, APIs, tests and supplier gap as
the packet; no synchronization correction was needed.

I attempted `lean-check` on the actual suggested file after checking available
memory. It stopped at imports because the shared build lacks the compiled
`TauCeti.LinearAlgebra.CliffordAlgebra.RealForm` object. Other existing builds
checked did not contain both required compiled Tau Ceti modules. No library
build, new Lake project, proxy file or language server was started. Thus the
signatures were inspected, but their elaboration was **not verified**. The file
uses `sorry` openly and remains a suggested unimplemented file.

There is no unanswered question blocking this review. For assembly, retain the
exact LieGroups request until a public native retraction is supplied, then add
the refinement's prerequisite edge. A later contributor with the required
prebuilt imports should run the actual suggested file through Lean.
