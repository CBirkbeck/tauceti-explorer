# Schur–Weyl link-map red team

One **medium omission**: the map does not import ClassicalGroups Layer 0's orthogonal
restricted action and invariant pairing into SchurWeyl Layer 9. A fresh pinned-library
check resolves the orthogonal carrier conflict recorded in overlap 4. The ten existing
links survive this attack; the separate symplectic sign problem remains.

Codex — `codex-J6LwjP`, issue #4374, 30 September 2026. This session wrote neither the
target link map nor its review. The original author was `cgp-8384bdb1c668` and the
reviewer `codex-c83e7a`. Claim comment 5910142135 was confirmed by bot comment
5910144736 before work began. This is a completed red-team investigation, with its
finding awaiting independent verification.

## Finding 1: import the existing orthogonal action and pairing

Source: ClassicalGroups **Layer 0**, “The classical groups and the standard
representation”. Its second bullet supplies the orthogonal inclusion into GL, the
restricted standard representation, the nondegenerate symmetric form and equivariance
of its pairing.

Consumer: SchurWeyl **Layer 9**, “Schur-Weyl duality for the orthogonal and symplectic
groups”. Its orthogonal construction needs precisely that inclusion and restricted
action for `orthAction`, and the invariant symmetric pairing for contractions and
copairings. The full canonical identifiers and two literal endpoint quotations are in
the result's `proposedLink`.

The accepted packet records this shared infrastructure only in **overlap 4**. It
observes that SchurWeyl warns against using `Matrix.orthogonalGroup` over ℂ whereas
ClassicalGroups names that carrier. It calls this a documentary conflict and correctly
does **not** claim to have verified the pinned declaration. Its proposal leaves the
group choice and comparison open.

The pinned declaration settles the orthogonal side. In
[Mathlib/LinearAlgebra/UnitaryGroup.lean at 082e2d3](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/UnitaryGroup.lean#L284),
the orthogonal section installs `starRingOfComm` as a local instance before defining
`orthogonalGroup`. The commutative-ring parameter is the relevant generality; no
caller-supplied complex-conjugation instance is captured. The two subsequent membership
theorems use ordinary transpose. In particular, the primed theorem identifies membership
with the equation `Aᵀ A = 1`, including for complex entries.

Thus Mathlib's existing carrier is already the bilinear orthogonal group required by
this consumer. The SchurWeyl warning confuses the trivial star fixed at definition time
with the usual conjugate star on ℂ. The distinction is visible for one-dimensional
matrices: multiplication by `i` is unitary for conjugation, but is not bilinear
orthogonal because its square is `−1`.

This permits a narrowly scoped dependency:

```text
ClassicalGroups Layer 0  →  SchurWeyl Layer 9
orthogonal inclusion, restricted action, equivariant symmetric pairing
```

The import is for the shared representation and pairing interface. It does not assert
that the library already contains the Brauer action, its relations, the first fundamental
theorem or the image-centralizer comparison. It also does not import the symplectic
Brauer action: correcting a group carrier cannot fix its separate crossing-sign convention.

**Fix:** add the inferred link provided in the JSON and update overlap 4 to name the
existing orthogonal carrier and its membership theorem. Record the correction to the
upstream warning for the Tau Ceti maintainer, preserving upstream ownership. Keep the
symplectic sign and Brauer proof obligations. This is one missing interface, rather than
a claim that overlap 4 itself asserted a false pinned theorem or that all of Layer 9 is
already formalized.

The omission affects the actual dependency graph. At the audit snapshot, neither the
raw/research/requires graph nor the assembled atlas has even an indirect path from this
source to the consumer. There is no reverse path. In-memory integration adds the single
edge without a cycle, so the overlap need not remain the only record of this supplier.

## Existing links and overlaps

I read the entire SchurWeyl document, all ten own stages, all 23 distinct endpoint stages
of the packet, the accepted review and the coverage ledger. All twenty evidence strings
remain literal substrings of their named stages. Link numbers below are array positions.

| Links | Result and boundary checked |
|---|---|
| 1: induction → permutation module | Valid over ℚ with left cosets. Ordered-block and tabloid/index comparisons remain with SchurWeyl. |
| 2: irreducible count → classification | Valid after absolute irreducibility and distinctness over ℂ; rational descent remains an obligation. |
| 3–4: character arithmetic/specification → character table | Trace base change and rational-integral descent give integer values. The ℂ-valued table specification needs all clauses and explicit labels. |
| 5: class functions → Frobenius characteristic | The finite-variable codomain for arbitrary rational class functions uses rational coefficients; the integral character lattice is separate. |
| 6: Young symmetrizer → classical Young image | Transport the fixed rational product and idempotent through scalar extension and the action. No reversal of multiplication is implicit. |
| 7: standard basis → tensor multiplicity | `f^λ` is the Specht dimension, not the GL Schur-module dimension. |
| 8: Schur polynomial → classical character | Only the recorded finite tableau/Jacobi–Trudi output is imported. Missing bialternant/Pieri/LR targets remain overlap 2. |
| 9: Schur–Weyl → classical tensor decomposition | Keep the surviving-partition bound, factor-order comparison and image algebras. Generic bicommutant does not identify the GL span by itself. |
| 10: rational Young idempotent → raw cohomology | A proved map into the correspondence algebra is still needed, with graded signs, chosen functor, twist, parity, degree and field. |

Overlaps 1–3 correctly retain the Young-image ownership issue, the unpinned symmetric
function exports and the GT/tableau comparison. The new finding refines overlap 4.
Overlap 5 correctly imports the existing image-bicommutant theorem; overlaps 6–7 correctly
separate cycle-data adapters from arithmetic and independent character-table algorithms
from shared test fixtures. None of those recorded limitations is presented as a newly
discovered finding.

For overlap 5, I read the actual statement and surrounding parameters of
[`TauCeti.centralizer_centralizer_range`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/Semisimple/DoubleCentralizer.lean#L315).
It assumes a commutative base, a module finite over that base, and an action of a
semisimple algebra. It returns the **image** under double centralization; injectivity of
the action is not required. The packet's correction from its original review is sound.

The pinned
[symplectic definition](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/SymplecticGroup.lean#L98)
uses preservation of the alternating matrix J. This does not discharge the separate
Brauer sign calculation. Repeating the small integer-matrix diagnostic gives
`E² = −2E` and `PE = EP = −E` for the inverse alternating cup/cap and unsigned flip.
The new orthogonal import therefore does not certify an unsigned symplectic generator.

The reviewed library-coverage file has no entries for SchurWeyl, ClassicalGroups or
SemisimpleAlgebras. That absence is not evidence that their targets are missing. The
three positive library checks above are scoped declaration checks, not a full audit.

## Completeness screen and graph checks

The current catalogue contains 221 roadmaps and 2,028 stages. One roadmap is retired,
leaving 219 active other roadmaps. Searches covered all ten own-stage topics: partitions
and tableaux, Young modules/symmetrizers, Specht modules, classification and dimensions,
characters and specification, Frobenius characteristic, symmetric functions and RSK,
tensor commutants, Brauer diagrams and invariant pairings. Focused searches returned
18 external stages; broader Schur/Young/Brauer/Pieri searches returned 81.

I followed the relevant candidate stages. Belyi's permutation data use the existing
full-cycle-type owner; its finite-group count does not require Murnaghan–Nakayama.
AutomorphicBundles B4 does not specify the rational projector/coefficient comparison
needed for another direct Young-idempotent edge. AG2.1 is an aggregate of the already
linked AG2.1a and its later consumer. The Lie/Spin minuscule Pieri theorem does not replace
the missing general combinatorial LR statement. Brauer groups and lifting, Schur
multipliers and orthogonality, Schur complements, and arithmetic Frobenius polynomials
are different constructions. No canonical TemperleyLieb roadmap is available in this
catalogue; the knot-theory mention does not supply nonplanar diagram composition.

The three additions since the accepted review are RiemannianGeometry,
SymplecticContactGeometry and SeveralComplexVariablesKahlerGeometry. I read all 21 of
their stage descriptions. Real tangent symplectic forms, curvature/Jacobi theory and
Hermitian/Kähler geometry provide no exact extra interface to the stated Schur/Brauer
tensor construction. The prior examined count is a historical snapshot, not a separate
error finding.

Validation at repository `9cabc40`:

- Original link checker: 10 links, 7 overlaps, 217 examined, no errors or warnings.
- Proposed packet in scratch: 11 links, the same overlaps, no errors or warnings.
- Raw atlas, all research links and raw/supplemental declared prerequisites: 4,501
  distinct edges; 4,502 with the proposed edge, acyclic.
- Actual `build.assemble(require_distances=False)`: 2,840 stages, 8,007 edges;
  in-memory `merge_links` adds one edge, giving 8,008. Repeating the merge leaves
  8,008 edges. No atlas or accepted packet was written by these diagnostics.
- Red-team, intake and whitespace checks pass on the two deliverables. Pinned file
  hashes and the target hash are recorded in the JSON. No Lean file or compilation.

Only this report and its result are submitted. The finding has no self-assigned
verification verdict, and the supplied link remains a proposed correction for the
independent verification/fix workflow.
