# Red team: Feng–Galatius–Venkatesh (2022)

Issue [#4158](https://github.com/CBirkbeck/tauceti-explorer/issues/4158).
Codex, session `codex-rtOQ9t`, 1 October 2026. Complete.

Three high-severity findings concern precise construction contracts. They do
not contradict the paper's main Galois-action theorems. The result is in
[RT-PAPER-FENG-GALATIUS-VENKATESH-22.result.json](RT-PAPER-FENG-GALATIUS-VENKATESH-22.result.json).
The extraction and its review were by other worker sessions, `cc-39fac3`
and `cc-d67081`; this worker did neither job.

## Source and extent

I downloaded and reread the complete published article, including Appendix A
and references: Tony Feng, Soren Galatius and Akshay Venkatesh,
*The Galois action on symplectic K-theory*, Inventiones mathematicae 230
(2022), 225–319, [publisher article](https://doi.org/10.1007/s00222-022-01127-8),
[publisher PDF](https://link.springer.com/content/pdf/10.1007/s00222-022-01127-8.pdf).
All source accesses below were on 1 October 2026. The 95-page PDF's SHA-256 is
`5da9a2b28d13b2b22a262a81650188025020d92238ec2b47404d177ef91d7b4d`,
exactly the extraction's hash. Unlike the earlier review's access limitation,
this audit obtained the actual PDF. Page images 237–238, 255–256 and 302 were
also inspected to check the formulas underlying the findings.

The [arXiv record](https://arxiv.org/abs/2007.15078) identifies v3, 8 May 2022,
as the final accepted version. The
[Crossref record](https://api.crossref.org/works/10.1007/s00222-022-01127-8)
confirms the authors, pages, publication date and CC BY 4.0 licence. It has no
correction relation or update notice. A bounded title/erratum/correction search
found no separate correction; this does not establish that none exists.
The published article, rather than the separately downloaded author copy,
is the full-text basis of the findings.

I read all 57 items, five routes, 13 prerequisite entries and 17 source-issue
cores, the extraction's human report, and the JSON and human review. The
existing issues concerning Chern-character integrality, integral
indecomposables, the loop-space Postnikov splitting, componentwise étale
completion, and the other printed corrections were not counted again.

## 1. Normalize the hyperbolic splitting

**High; item /25 and its source route to
`GeometryOfNumbersAndQuadraticArithmetic:GN.6`.**

The item names both the first arrow and its alleged retraction:

\[
K(\mathbb Z)[1/2]^{(+)}\xrightarrow{H}KSp(\mathbb Z)[1/2],
\qquad c_B:KSp(\mathbb Z)[1/2]\longrightarrow K(\mathbb Z)[1/2]^{(+)}.
\]

Here `H` is the standard, unscaled hyperbolic construction and `c_B` forgets
the form. The paper's pp. 254–255 describe these same maps, and p. 255 says
the sequence is “canonically split” by the forgetful map. But p. 256 computes
the hyperbolic/Betti–Hodge composite as `(1 + ψ⁻¹, 0)`. Thus

\[
c_BH=1+\psi^{-1}=2\,\mathrm{id}
\quad\text{on the positive eigensummand}.
\]

The degree-zero check is decisive: a rank-one module becomes a hyperbolic
rank-two module, whose underlying module has rank two. Inverting two makes
this composite invertible; it does not make `2 = 1`.

**Repair.** With `H` as the inclusion, use `(1/2)c_B` as its retraction.
Alternatively use `(1/2)H` as the summand inclusion and retain `c_B` as the
projection. State explicitly how the homotopy-orbit summand is identified if
that identification absorbs the normalization. Keep the splitting theorem,
record the source normalization issue, and pass this map-level correction
to the GN.6 design task. Require the rank test above. Theorem 3.5 needs the
composite to be invertible at odd primes, so its conclusion survives.

## 2. Group completion alone does not give a ring-spectrum map

**High; item /2, supplied by `StableHomotopyKTheory:H.4` and
`H.5:spectra`.**

The item begins with an arbitrary symmetric monoidal groupoid `C`, then
calls its adjoint `Σ∞₊|C| → K(C)` a ring map. Published §2.2, pp. 237–238,
only supplies additive group completion and a spectrum. On p. 238 the
multiplication for commutative-ring K-theory comes from tensor product,
an additional operation distinct from direct sum. The ring-spectrum map
on p. 240 has the specific source `Σ∞₊|Pic(R)|` and target `K(R)`.

For a counterexample to the general claim, use the discrete groupoid with
objects `Q/Z`, only identity morphisms, and addition as its monoidal
operation. It is already group-like, so `π₀K(C) = Q/Z`. This cannot be the
additive group of a nonzero unital ring. Its hypothetical unit has some
finite additive order `n`, which would give `nx = (n1)x = 0` for every `x`.
The group `Q/Z` has elements of arbitrarily large order.

There is also a direct unit mismatch if the one monoidal operation is used
as multiplication on the suspension spectrum: its unit is the component
`[0]`, and the group-completion adjoint sends this to additive zero.

**Repair.** State the general adjoint as a map of spectra. State ring
multiplicativity separately when the compatible multiplicative structure
has been supplied. Retain item /17's specific Picard map into `K(R)`;
do not replace that target by `K(Pic(R), tensor)`. General ring products
remain with `GeneralAlgebraicKTheory:K.7` and their scheme extension with
`SchemeKTheoryOperations:S.6`. This is an error in the extraction's
generalization, not a claim that the paper's specific ring map is wrong.

## 3. Special Γ-spaces need a zeroth-space replacement

**High; item /51, supplied by `StableHomotopyKTheory:H.4` and
`H.5:spectra`.**

The item specifies the spaces of `B∞X` as `|X(Sⁿ)|` and then says specialness
makes this an Ω-spectrum. The source is more precise: p. 302 gives the
structure-map weak equivalences for `n ≥ 1`, and gives an equivalent
Ω-spectrum with zeroth space `Ω|X(S¹)|`. Its map from `|X(S⁰)|` is group
completion, not generally a weak equivalence.

Let `X(S) = N^(S minus basepoint)`, as a discrete simplicial set. A pointed
map acts by summation over each non-basepoint fibre. The Segal maps are
isomorphisms and `X({*})` is a point, so this is a special Γ-space even
under the paper's strict reduction convention. Nevertheless its zeroth
structure map has component map

\[
\mathbb N\longrightarrow\pi_0(\Omega B\mathbb N)=\mathbb Z,
\]

which is not bijective. The unmodified prespectrum is therefore not an
Ω-spectrum at zero. This example does not use the relaxed reduction
condition discussed in the extraction's existing E15.

**Repair.** Preserve the positive-level qualification and explicitly
replace the zeroth space by `Ω|X(S¹)|`. Alternatively, to claim the
unmodified prespectrum is an Ω-spectrum, require that `π₀X(S⁰)` is a group
(very specialness). Retain the group-completion map and use `N → Z` as
the regression example. This repairs a stronger assertion introduced by
the extraction; the source already distinguishes the two models.

## Libraries and ownership

At Mathlib commit `082e2d37e8b0463410cdb532e111cd43d5a66174`, I read
the actual definitions and surrounding hypotheses of all seven declarations
listed in item /1:

| Declaration | Pinned file and line |
|---|---|
| `NumberField.RingOfIntegers` | `Mathlib/NumberTheory/NumberField/Basic.lean:104` |
| `ClassGroup` | `Mathlib/RingTheory/ClassGroup/Basic.lean:90` |
| `CyclotomicField` | `Mathlib/NumberTheory/Cyclotomic/Basic.lean:654` |
| `IsCyclotomicExtension` | `Mathlib/NumberTheory/Cyclotomic/Basic.lean:76` |
| `NumberField.IsCMField` | `Mathlib/NumberTheory/NumberField/CMField.lean:71` |
| `Matrix.symplecticGroup` | `Mathlib/LinearAlgebra/SymplecticGroup.lean:101` |
| `groupHomology` | `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:230` |

These claims hold at the pin. I also read `ClassGroup.equivPic` at
`Mathlib/RingTheory/PicardGroup.lean:876` and
`IsPrimitiveRoot.adjoinEquivRingOfIntegers` at
`Mathlib/NumberTheory/NumberField/Cyclotomic/Basic.lean:839`, including its
prime-power version at line 165. They support the Picard/class-group and
cyclotomic-integer clauses. The library's block matrix `J` and the paper's
interleaved symplectic form require a coordinate permutation and sign
comparison, not a second symplectic-group definition.

I assembled the current atlas at base `58d7e52`, read all 26 cited stage
descriptions and their reviewed library-coverage entries, and checked the
active restructure records for A5, R02.2, S.6 and H.4–H.6. The source routes
to M.7, N.6 and GN.6 have the right general owners. The Part II has the
correct ArithmeticKTheory parent and title prefix. Every missing item is
routed exactly once: three to source routes, two to EtaleHomotopyTypes,
and 36 to the Part II. The 15 planned imports resolve. No new duplicate
owner was established.

The EtaleHomotopyTypes id, title and area still match the Schmidt–Stix
proposal. Its current brief is explicitly an **unaccepted candidate** with
unresolved foundation imports. Coalescence is appropriate, but is not
evidence that those imports are accepted or implemented. The design must
retain that status and its existing-owner boundaries, including generic
pro-categories at D0 and ordinary homotopy at its existing owners. This
audit does not certify those other jobs or turn a paper-extraction audit
into recursive proof closure of every cited reference.

The reviewed audits continue to distinguish the available algebraic inputs
from the planned spectrum, K-theory and étale-homotopy constructions. The
three findings require no new claim that a Tau Ceti declaration is absent.

## Validation and handoff

- The original extraction passes `scripts/check_paper.py`.
- The result passes `scripts/check_redteam.py`.
- Both deliverables pass `research/blueprint/intake.py check-files`.
- `git diff --cached --check` passes.
- No Lean file was requested, written or compiled; no library build, cache
  acquisition or Lean language server was run.

The verifier can check all three findings from the published pages and the
explicit examples above. If confirmed, amend the extraction and propagate
the corrected contracts through its existing owners; the accepted input
files were not edited in this red-team job.
