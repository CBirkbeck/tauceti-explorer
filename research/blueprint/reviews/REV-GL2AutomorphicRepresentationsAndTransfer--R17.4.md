# Independent review of R17.4: local and non-normal cubic base change

**Accepted after corrections.** Reviewer: Codex (GPT-6), session `codex-SNvlIZ`,
14 October 2026; [review issue #9384](https://github.com/CBirkbeck/tauceti-explorer/issues/9384).
The input was written by Claude, session `claude-aUA4oH`, for
[blueprint issue #9413](https://github.com/CBirkbeck/tauceti-explorer/issues/9413).
The reviewer did not write that input.

The verdict accepts a complete target-level planning pass. **R17.4 remains
planned, not closed.** Its two explicit gaps, nine supplier requests and
inherited R17.3 coverage limitations remain visible. No implementation or
formal proof is claimed. In particular, GL₃ local Langlands and the global
Weil-group route are conditional supplier contracts.

Reviewed and corrected together:

- [Packet](../packets/GL2AutomorphicRepresentationsAndTransfer--R17.4.json).
- [Reader document](../readmes/GL2AutomorphicRepresentationsAndTransfer--R17.4.md).
- [Suggested Lean file](../suggested/GL2AutomorphicRepresentationsAndTransfer--R17.4.lean).

## Inventory and verdicts

| Item | Input | Reviewed |
|---|---:|---:|
| Nodes | 12 | 12 |
| Definitions / theorems | 3 / 9 | 3 / 9 |
| API items | 26 | 29 |
| Definition unit tests | 15 | 17 |
| Baseline declarations | 11 | 13 |
| New planets | 0 | 0 |
| Supplier requests | 10 | 9 |
| Explicit gaps | 1 | 2 |
| Source findings | 0 | 1, confirmed |

The packet's ledger records **ten corrected nodes and two verified nodes**.
No nodes were added, removed or split: the proof details belong in the existing
target-level sketches. The three definitions now have respectively 13, 9 and
7 API items, and 7, 5 and 5 tests. The existing six R17.4 planets belong to the
R17.3 packet and are not duplicated here.

## Evidence and library boundary

Every cited source locator was checked. The five independently recomputed
source hashes match those recorded in the packet. The Bushnell–Henniart text
was read only in the maintainer-cleared published 2006 copy. No source passage
or restricted file is reproduced. All statements and source matches are in
our own words; mathematical formulas identify the claims being checked.

The relevant evidence is:

- Bushnell–Henniart, *The Local Langlands Conjecture for GL(2)* (2006):
  §27.1–27.4, pp. 170–171, and §27.7–27.8, pp. 174–176, for the local converse;
  §30.4, pp. 194–195, for λ; §33.4, p. 214, for the supercuspidal
  correspondence; §34.1, p. 215, for tame admissible pairs. The epsilon check
  also reads §23.4–23.5, pp. 142–144, §24.2–24.3, pp. 148–150, and §26.1,
  p. 162, and §26.6–26.8, pp. 168–169.
- [JPSS, *Automorphic forms on GL(3). II*](https://www.math.columbia.edu/~hj/Automorphic%20forms%20on%20GL(3)%20II.pdf):
  Theorem (14.2), equations (14.2.3)–(14.2.5), and the monomial remark,
  printed pp. 253–255. The scan was read as page images.
- [Carayol, *Sur les représentations l-adiques associées aux formes modulaires de Hilbert*](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf):
  §12.2.1–12.2.3, pp. 457–458, and §12.3.1–12.3.2, pp. 458–459.
- [Cogdell, *Piatetski-Shapiro's work on converse theorems*](https://people.math.osu.edu/cogdell.1/PSCT-www.pdf):
  §3, application (iv), p. 10, confirms the cubic-transfer converse/GL₃ route.
- [Milne, *Algebraic Number Theory*, version 3.08](https://www.jmilne.org/math/CourseNotes/ANT.pdf):
  Theorem 3.41, p. 62, and Proposition 8.21, Corollary 8.22 and Theorem 8.23,
  pp. 144–145, for splitting and Frobenius.

All thirteen baseline declarations were checked at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, including their hypotheses:

| Module | Confirmed declarations |
|---|---|
| `TauCeti/GroupTheory/Perm/Partition.lean` | `Equiv.Perm.fullCycleType`, `fullCycleType_def`, `sum_fullCycleType`, `fullCycleType_conj`, `fullCycleType_one`, `parts_partition_swap`, `parts_partition_of_isCycle`, `sign_of_parts_partition` |
| `Mathlib/GroupTheory/Perm/Fin.lean` | `cycleType_finRotate` |
| `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean` | `Matrix.GeneralLinearGroup`, `Matrix.GeneralLinearGroup.det` |
| `TauCeti/RepresentationTheory/Induction/Mackey/Decomposition.lean` | `Rep.mackeyDecomposition`, line 390, added to the baseline |
| `Mathlib/RepresentationTheory/Induced.lean` | `Rep.indResAdjunction`, line 155, added to the baseline |

No original baseline declaration was removed. The erroneous *roadmap supplier*
for Mackey decomposition was replaced: the upstream InductionRestriction plan
restricts its setup to finite groups, while the actual pinned declaration works
for arbitrary groups. The induction–restriction adjunction supplies Frobenius
reciprocity. Open finite-index Weil subgroups have finitely many cosets, so the
finite-coset function model and continuity adapter let these existing algebraic
results serve the packet. A second Mackey theorem is not planned.

The reviewed AUDIT14 entries, the current Tau Ceti library, and current
TauCetiRoadmap main were checked for duplication. The latter was read at
`0d144d044dacebca17b654695b6f1ad58f159b27`; the current library at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The complete upstream
InductionRestriction and Completed/RestrictedProducts reader documents were
read for roadmap form. LocalGaloisGroups introduces no conflicting local
Langlands/base-change target. No library or upstream roadmap was edited.

## Mathematical corrections

**Normalization and restriction.** The actual R16.3 supplier uses unitary LLC
and geometric Artin reciprocity, not the input's arithmetic label. The reader
and packet now agree. The arithmetic CFT map is inverted; norm and tower
diagrams commute after inversion. The WD degree map remains arithmetic.
Frobenius semisimplicity under restriction is justified through the finite
inertia image, rather than assuming a chosen extension Frobenius is literally
a power of the original lift. BH §33.4 is cited for supercuspidal LLC only;
the other rank-two cases are supplied by the explicit R16.3 nodes.

**Genericity and tame ramification.** The unitary genericity API now includes
the missing supercuspidal bounded-parameter case. Its hypothesis is necessary.
For `F = Q₃`, `E = Q₃(√3)`, let κ cut out E/F and ν be the absolute value.
The irreducible generic principal series with characters κν^{1/2}, ν^{−1/2}
has base change with parameter ν_E^{1/2} ⊕ ν_E^{−1/2}, N = 0: the trivial
one-dimensional Langlands quotient. This also refutes the former unconditional
irreducible-principal-series conclusion after killing tame ramification.
The corrected target asserts unramified spherical output, with irreducible
principal series exactly away from the two reducibility ratios; unitary input
suffices. The archimedean discrete-series target explicitly requires k ≥ 2.

**Cubic local induction and pair factors.** Arbitrary split quasicharacters
cannot all be made unitary by one common norm twist. The definition uses the
Langlands quotient for such data. The new test `(ν,1,ν⁻¹)` gives the trivial,
nongeneric GL₃ representation. AL.3 defines the pair factors for generic
inputs, so the factor identity now assumes a common real norm twist of unitary
components. Every character of a cubic local field and the components of every
global Hecke character satisfy this condition, preserving the intended uses.
The parameter characterizations for both definitions and the cubic
contragredient API give consumers the comparisons needed without unfolding.

**JPSS's scope.** Theorem (14.2) applies to an irreducible unitary *global*
three-dimensional Weil representation with the stated analytic hypotheses.
It does not independently construct a representation for every local
parameter. Its characterization uses the twisted L-functions of both the
representation and its contragredient, as well as epsilon factors and central
character. These dual data are restored. The local definition uses ET.6/AF.1;
the source characterization is used in its global local-component setting.
The monomial remark is not cited as a rank-two restriction theorem.

**Explicit lifts and splitting.** Non-Galois cubic norm surjectivity makes the
local principal-series conclusion irreducible. Mackey and norm limitation
give the two dihedral cases; the S₃ exception is θ/θ^σ ∈ {ξ,ξ⁻¹}.
BH's §34.1 tame theorem is not extended by attribution to arbitrary dyadic
parameters. For splitting, Milne's polynomial criteria require the generator
and reduction hypotheses. Decomposition-group orbits give the rule at every
place unramified in the normal closure, without assuming one fixed global
generator has squarefree reduction everywhere. Frobenius inversion preserves
these orbit lengths.

**Global converse.** The proof now verifies both completed L-functions,
quasicharacter norm shifts, central character and right-half-plane convergence.
A uniform Satake bound survives a residue-degree f extension because
`q_w = q_v^f`. Only the cuspidal branch is reduced to unitary input by one real
twist; arbitrary isobaric sums of characters are treated directly. The
exceptional all-place parameter has N = 0 and, after its scalar twist is
removed, factors through Gal(L/K) of order two. Its determinant gives the
claimed `1 ⊞ η_{L/K}` output. No converse theorem is applied to that branch.

## Confirmed source error E19

BH (26.1.2), p. 162, quantifies over arbitrary nontrivial ψ but gives, for
unramified φ, the epsilon equality ε(s,φ St,ψ) = −ε(s,φ,ψ). The same formula
appears in §26.8, p. 169. It agrees with the calculation for BH level-one ψ,
but cannot have the stated unrestricted scope. The GL₁ additive-character
scaling law in §23.5, p. 143, and the GL₂ law in §24.3, p. 150, have different
powers of φ(a) and |a|.

With self-dual measures the correction is

`ε(s,φ St,ψ) = −φ(ϖ) q^{1/2−s} ε(s,φ,ψ)^2`.

For conductor-O ψ and φ = 1, the WD determinant term gives `−q^{1/2−s}`,
where the printed formula gives `−1`. For level-one ψ, §23.5 gives
`ε(s,φ,ψ) = φ(ϖ)⁻¹ q^{s−1/2}`, and the corrected identity reduces to the
printed one. This both supplies a counterexample and checks the repair.
At s = 1/2 the quadratic Steinberg root numbers in this packet are unchanged;
their proof now uses the WD correction and trivial-central-character scaling.

E19 records the published edition, hash, locators, repair, reach and independent
verdict. The publisher record, author-domain/general errata searches and atlas
records revealed no existing correction for this formula. No claim about a
later edition is made. The mistaken fixed PDF-page offset is also removed.

## Closure, requests and handed findings

The statements of all 38 resolved supplier nodes were read, including the
rank restrictions, genericity, duals and analytic hypotheses of AL.3 and the
full rank-two converse of R16.5. ET.6 has no packet and is an exact stage request:
it must supply GL₃ LLC, bounded/tempered compatibility, character and GL₂×GL₃
factors, twists, duals, determinants and unramified Satake parameters.

Current ClassFieldTheory Layer 11 supplies finite global Artin reciprocity,
not global Weil groups for arbitrary infinite-order Hecke characters. The
GL₃-induction proof therefore needs a lower-tier extension with W_F,
W_F^{ab} ≃ C_F, finite-extension embeddings, induction and all-place localization.
It also needs the global Artin functional equation used by JPSS, or the
monomial equivalent with unsquared induction epsilon normalization. This is
now an explicit gap and request. Finite-image Galois induction cannot replace
that input. The λ-*square* product, in contrast, uses only the finite
permutation determinant and the existing global reciprocity contract.

The original 1981 JPSS note and the Mao–Rallis paper were not read. Their
absence remains a distinct source gap; the assembled modern proof route is
checked subject to its named supplier contracts. The review does not describe
that route as an independently read original proof.

Both handed findings are addressed at target level:

- **RT-AREA-automorphic-1/1:** nonnormal cubic transfer explicitly uses GL₃
  induction, GL₂×GL₃ factors and the full GL₂ converse. The existing R17.4a
  split proposal and AL.3 ownership are retained. No GL₃ theory is silently
  used as rank-two theory or re-owned here.
- **RT-AREA-langlands-2/4:** local parameter restriction and nonnormal cubic
  all-place compatibility are owned here, below the Carayol consumer. The
  R19.2 extraordinary-local/globalization construction is not an input to
  R17.4. Its proposed retargeting is recorded for the orchestrator.

## Validation and orchestrator actions

- `python3 scripts/check_blueprint.py` on this packet with the pinned
  declaration index: **0 errors, 0 warnings**.
- Source-issue and source-version validators: **0 errors**.
- `lean-check` on the suggested file: **elaborates, with twelve `sorry`
  warnings and no other diagnostics**. There is one real-bodied light
  definition, seven theorem statements and five examples; no sorry-backed
  data or missing-carrier placeholders were introduced.
- All node, API and test names are represented in the reader and suggested
  file. Reader hypotheses, proof sketches, prerequisites, sources, requests,
  gaps and coverage are reconciled with the packet.
- Whitespace and changed-path checks pass. Only the three reviewed files,
  this report and the job's handoff are changed.

The orchestrator should assign the global-Weil/functional-equation extension
(or a proved direct automorphic-induction alternative), retain the ET.6
contract until its owner supplies it, and apply the existing R17.4a/R19.2
ownership proposals at package time. The older R17.3 normalization label should
be reconciled at its next authorized edit. These are follow-up matters, not
unrecorded assumptions or edits to another worker's files.
