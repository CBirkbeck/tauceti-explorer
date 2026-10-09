# Independent package review: AutomorphicBundles

Verdict: **needs_changes**. Reviewer: `independent-review-REV-PKG-AutomorphicBundles`.
Worker: Codex, session `codex-A9Lc8E`. Date: 9 October 2026.
Issue: [#7505](https://github.com/CBirkbeck/tauceti-explorer/issues/7505).
This is a completed independent review. This session wrote neither the package nor its inputs.

The README gives all 96 accepted mathematical targets, all 154 API specifications and all
102 test specifications. Nine target statements have been corrected in place to restore
hypotheses or constructions compressed out of the accepted plan. The package still fails
item 5 of the review instructions: successful elaboration covers a small collection of
functional prototypes and algebraic examples, while the geometric declarations required by
the README remain a comment inventory. Names in that inventory do not have checked Lean
signatures.

## The six review checks

| Check | Result | Evidence |
|---|---|---|
| 1. Upstream form | Pass | Introduction, boundaries, conventions, nine ordered layers, target-level statements, APIs/tests, prerequisites and references; corrected README is 166,600 bytes, below 200 KB. |
| 2. Accepted-plan fidelity | Pass after corrections | All 96 targets and their API/test specifications appear; nine compressed statements were repaired as described below. Supplier assumptions remain explicit. |
| 3. Own words and source locators | Pass | Mathematical presentation is organized by constructions and dependencies, not by a source's section sequence. It excludes the extraction passages. The corrected absolute-Hodge citation now names Principle B as well as the main theorem. |
| 4. No programme process in the roadmap | Pass | No packet names, job ids, review/checkpoint discussion or coverage statuses in the README. The mathematical scope restrictions and supplier contracts describe prerequisites. |
| 5. Lean elaboration and target agreement | **Needs changes** | `lean-check` exits 0, with 62 warnings, all admitted proofs, and no errors. However, 129 of the 154 planned API names have no active declaration. The geometric targets cannot be certified by compiling their comment inventory. |
| 6. Metadata | Pass | Exactly one line, `topic = "math.NT"`, including a terminal newline. Number theory fits the roadmap. |

For form and density I read the upstream HodgeStructures and AdicSpaces READMEs under
`content/tau-ceti/`, and compared the package with `UPSTREAM_GUIDE.md`. The package's prose
is considerably more detailed than a terse layer list, as its target statements require,
but remains below the size cap. Its examples distinguish the objects it plans: fibre
characters, homology versus cohomology, boundary ideals, parity, coefficient torsion and
infinite expansion support.

## Corrections made

The following are restorations of existing accepted statements, not additional targets.

1. **`hodgeParabolicConvention` (B0):** added the decreasing filtration
   `F^a = ⊕_{p≥a} H^{p,q}` alongside the action `z^(−p)`. This pins which
   filtration the inverse-cocharacter dynamic parabolic stabilizes.
2. **`analyticCoefficient` (B0):** restored the adelic-component expression
   `Γ\(G(ℝ)×V)/K_∞` and its fibre relation `(g,v)·k=(gk,ρ(k)⁻¹v)`, with the
   compact-dual holomorphic structure and ineffective-kernel restriction.
3. **`absoluteHodgePropagation` (B1):** replaced the instruction to state hypotheses
   with the hypotheses themselves: an algebraically closed characteristic-zero field
   with a complex embedding for the abelian variety, and a smooth proper abelian
   family over a connected smooth complex base for propagation. The horizontal
   type-(0,0) tensor and compatible realizations remain explicit. Added Deligne
   Theorems 2.12 and 2.15, pp.20–21, to the citations.
4. **`hodgeTensorRealizations` (B1):** restored the chosen symplectic embedding,
   sufficiently small level, canonical reflex field, finite defining family, and
   homology convention `H₁=(R¹π_*)∨`. Filtration, horizontality, Tate twists and
   arithmetic descent appear in the actual statement.
5. **`connectedPrincipalConjugation` (B1.general):** specified `σ∈Aut(ℂ)`, the
   special point, the source and transported datum, period-torsor normalization,
   algebraicity, connected Hecke action and independence of auxiliary choices.
6. **`generalPrincipalModel` (B1.general):** restored the neat effective tower,
   homogeneous analytification and canonical flat connection, retaining continuity
   and effectivity of descent.
7. **`bettiCoefficientLocalSystem` (B2):** restored finite-dimensionality, neat
   effective arithmetic component, the associated holomorphic flat bundle, and
   the pure-weight condition for the rational variation of Hodge structure.
8. **`filteredDeRhamCoefficient` (B2):** specified an algebraic full-group
   representation over a number field containing the reflex field, local freeness,
   and the Hodge-type relative-homology tensor comparison. Its boundary extension
   remains assigned to B3.
9. **`realizationComparison` (B2):** restored the rational representation,
   chosen complex embedding, the two comparison formulas, and the rational-weight
   and purity conditions on the Hodge conclusion. Defining tensors are included
   among the preserved structures.

`Suggested.lean` and `metadata.toml` are unchanged. No packet, assembly, link map,
upstream roadmap or atlas data was edited.

## Comparison with the accepted targets

Inputs were `AutomorphicBundles--B0.json` and `AutomorphicBundles--B5.json` and
the assembly/package handoffs. Both packet reviews accept a **target pass**, with
open supplier and signature gaps; neither certifies formal closure. I checked
statements and hypotheses, not just the occurrence of names. The name census is
an additional check, not a substitute for that reading.

| Layer | Targets | API specifications | Tests |
|---|---:|---:|---:|
| B0 | 9 | 24 | 15 |
| B1 | 10 | 9 | 9 |
| B1.general | 6 | 0 | 0 |
| B2 | 9 | 25 | 12 |
| B2.general | 3 | 0 | 0 |
| B3 | 10 | 31 | 15 |
| B3.general | 3 | 0 | 0 |
| B4 | 18 | 39 | 33 |
| B5 | 28 | 26 | 18 |
| Total | 96 | 154 | 102 |

B0 keeps the coefficient quotient separate from the adjoint group, the ineffective
arithmetic centre separate from tame finite stabilizers, and general parabolic
representations separate from Levi representations. B1 and its general layer retain
absolute-Hodge, CM-period and effective-descent inputs. B2 attaches connections and
local systems to full-group representations; a Levi coefficient alone does not
supply them. The rational-weight condition remains attached to the Betti conjugation
conclusion.

B3 distinguishes canonical extension from arbitrary extension across the boundary,
uses the reduced boundary ideal for subcanonical coefficients, and uses ideal
pushforward under refinement rather than equality of subcanonical pullbacks. Its
minimal pushforward is coherent without a local-freeness assertion. B4 retains
properness for finite-dimensional section spaces, all-cusp analytic comparison,
Hilbert parity and potentially negative determinant exponents, and actual descent
of embedding-labelled coefficients.

B5 preserves four different model settings. Scalar PEL coefficients use arbitrary
modules inside the sheaf, genuine torsor-valued coefficient families, infinite
products and full stabilizer invariants without averaging. Cone comparison requires
common-image sections on a common completion. Prime-quotient geometric detection
precedes prime-filtration induction and passage to arbitrary modules. That last
passage uses section colimits and injections of coefficient families; it does not
commute an infinite product with a colimit. Hecke constructions retain finite
locally free trace on the intermediate model and coefficient-sensitive toric
comparison for further refinements. Non-neat descent uses a stack equalizer and
common covers, with the AA.4 Cartesian hypothesis retained.

Vector coefficients require the actual boundary bundle. Ramified Hilbert expansions
retain the fractional positive lattice, coefficient line, trivial-unit-character
condition, prime-to-p level and determinant-component condition; the Iwahori
warning is preserved. The two Siegel comparisons retain all four coherent weights,
central character, parity, shifts, separate Tate twists and all four boundary
ideals for compact support.

I read the AutomorphicBundles entries of the reviewed library audit and the
accepted LieGroups link map. The README respects the generic associated-bundle
owner in ReductiveGroupsPartII, compact-dual/Hodge geometry in ShimuraData,
compactification suppliers in ShimuraCompactifications, modular specializations
in R15.1/R15.2, and the analytic VB and dual-BGG directions in their named owners.
It does not treat a Borel character line bundle as a general associated-bundle
functor or re-plan an existing analytic modular form or Hecke ring.

The integral B2–B4 contracts inherited from the assembly are still prerequisites:
arbitrary-module section functors, coefficient-sensitive fan/Hecke comparison,
finite-projective integral Levi bundles and ramified Hilbert lines for general
integer pairs. Stating them under B5 does not prove them or create missing earlier
nodes. The 24 packet gaps and 50 requests are not counted as newly discovered
package defects; they explain why target-level acceptance is not closure. Their
resolution belongs to their owners, outside this review's editable paths.

## Remaining defect: commented interfaces are not checked declarations

The final block comment, headed `Geometric interfaces` in `Suggested.lean`, runs
from line 801 to the end of the file. The missing interfaces are described
honestly in the header. There is no hidden implementation claim or opaque `Prop`
carrier. Nevertheless, a specification in a block comment has no Lean type, so it
cannot meet the package requirement to hold the plan's definitions, theorems,
API lemmas and examples with declarations matching the README.

A census after stripping both nested block comments and line comments found:

| Input | Planned API names | Names with active declarations | Names without active declarations |
|---|---:|---:|---:|
| B0 through B4 | 128 | 22 | 106 |
| B5 | 26 | 3 | 23 |
| Total | 154 | 25 | 129 |

Presence is not full semantic agreement. In the first part, eight of the 68
proposed target names are active; `AutomorphyFactor` omits holomorphy and
`classicalForms` takes an arbitrary supplied scheme and coefficient sheaf rather
than the actual canonical automorphic coefficient on its compactification.
These limitations are explicitly documented. In B5 the three active planned
API names are `FJCoefficient.map`, `.transport` and `.family_ext` under the joined
root namespace. They work on supplied scheme-module sheaves: `.map` takes a
sheaf morphism, `.transport` a same-chart sheaf isomorphism, and `.family_ext`
compares a degree-indexed family. They do not construct coefficient-module
change, cross-cusp transport or the full stack-valued coefficient definition.

Concrete missing declarations include `centralSplitQuotient_quotient`,
`compactDualCoefficient_map`, `canonicalExtension_restrict`, `cuspForms`,
`FourierJacobi.localExpansion`, `FourierJacobi.expansion`,
`ClassicalHecke.operator`, `VectorFourierJacobi.expansion` and
`HilbertQExpansion.map`. Their mathematical contracts are present in the
README/comment inventory, but no active signatures express them. Likewise the
integer-valued `SiegelHT` weight calculations do not state either cohomological
comparison. The algebraic diagram chase and direct applications of Mathlib's
short-complex and prime-filtration theorems are useful proof steps; they do not
instantiate the geometric coefficient functors or expansion maps.

The accepted B0 review expressly applies PROTOCOL §13's unavailable-condition
exception to sixty omitted geometric signatures. I retain that finding and do
not retroactively withdraw its target-pass acceptance. The distinction here is
PROTOCOL §20 and this issue's item 5: a package containing the plan's declarations
has not yet been supplied. Omitting an unavailable condition from a meaningful
signature is different from having only a prose inventory of that signature.
The successful compile therefore cannot establish the required target agreement.

**Revision needed:** obtain the actual supplier carriers and state the geometric
constructors, theorem signatures, named API lemmas and test examples against them,
with concrete hypotheses. Keep unavailable conditions explicit as limitations;
do not replace geometry with arbitrary `Type` parameters, whole-theorem premises
or opaque propositions. Recheck agreement by inspecting active declarations and
run `lean-check` again. Where suppliers cannot yet be expressed, resolve the
package-readiness requirement with the owning planning work before accepting the
package. Moving comments, counting names, or recompiling the present file does
not repair this defect.

## Sources and elaboration evidence

Source spot checks covered the restrictions that can easily change while joining
parts. They are a check of packaging fidelity, not a new proof-closure review of
every leaf of the two already reviewed plans.

| Source checked | Locators and retained distinction |
|---|---|
| [Milne, corrected canonical-model notes](https://www.jmilne.org/math/xnotes/AA.pdf) | III §1 p.52; Theorems 4.1, 4.3, 4.6 and 5.1 pp.59–61; §§6–8 pp.61–64; V Theorems 6.1–6.2 pp.90–91; VII Conjecture 4.1 p.102. Fields of definition, weight restrictions, tensor-normalized extension and the conjectural general boundary description remain distinct. |
| [Milne, connected bundles](https://jmilne.org/math/articles/1988aT.pdf) | Theorem 3.10/Corollary 3.11 pp.19–20; §9 Lemmas 9.1–9.5 pp.33–34. Rational-point reduction and algebraic-group generation are separate arguments; the adjoint comparison uses second jets. |
| [Deligne, Hodge cycles](https://www.jmilne.org/math/Deligne82.pdf) | Theorems 2.11–2.15 pp.19–21 and Proposition 3.1 pp.22–23. Absolute-Hodge propagation has a smooth proper family and a horizontal tensor; a tensor stabilizer is not simply the stabilizer of its span. |
| [Lan, arithmetic compactifications, 14 March 2021 revision](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf) | 7.1.1.1–7.1.1.5 pp.532–533 and 7.1.2.1–7.1.2.14 pp.534–540. Arbitrary modules, determinant-Hodge weight, full stabilizers, finite detecting collections and image recognition are preserved. |
| [Lan, Higher Koecher preprint](https://www.kwlan.org/articles/Koecher.pdf) | Proposition 5.6 and proof pp.11–13; Remark 5.7, Corollaries 5.8–5.9 and Definition 5.10 p.13. The coefficient is a boundary bundle on the abelian torsor; its filtration need not descend through the stabilizer. |
| [Diamond, arXiv:2211.06922v1](https://arxiv.org/pdf/2211.06922v1) | §§6.1–6.3 pp.24–26 and Proposition 6.5.1 pp.28–29. Ramified primes, coefficient lines, determinant-component detection, the Iwahori exception, flat-coefficient cuspidality restriction and the central Hecke operator are retained. |
| [BCGP, arXiv:2502.20645v1](https://arxiv.org/pdf/2502.20645v1) | §3.2.13–3.2.19 pp.44–45; end of §4.5 proof p.78; §4.8, Theorem 4.8.2 pp.101–102. Fibre highest weight differs from function character; VB has its μ normalization; coherent decomposition has its separate twists and compact-support boundary terms. |

Fresh public downloads reproduced the version hashes recorded by the package
writer for Lan's revision (`a7a454f5d0735f4bf11f00a8afc14c361c5fc2cefd691d7466f7620ab4c3a079`),
Higher Koecher (`5916b37f2e350a55947cf97ac0c6640086088e7d9617267655081a3369f58f0a`),
Diamond v1 (`672b6b4bc3bedb9081dbad088829cba95754e2461dcbb22a1a0453cf0585b24c`)
and BCGP v1 (`51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c`).
Faltings–Chai is not cleared in the maintainer's library index and was not read
from any copy. Its underlying BGG/logarithmic comparison remains a supplier
requirement, not a theorem newly certified by this review.

Library statement checks used Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. In particular I checked the slash
composition/scalar law, actual scheme-module sections/maps, finite-relative-index
analytic trace, short-complex monicity hypotheses, prime-filtration induction,
proper-ideal completion injectivity, trace of a base scalar, the strict-period
q-expansion injection, full-group constant-term cuspidality restriction, and
Tau Ceti's nebentypus Hecke action and scheme-module tensor product.

The independent command was:

```text
lean-check research/blueprint/packages/AutomorphicBundles/Suggested.lean
```

It completed with exit 0, no errors and exactly 62 `declaration uses sorry`
warnings. Available memory exceeded 20 GB before compiling. Only one
compilation ran, and no Lean server, cache download or build was started.
The shared build supplies the exact Mathlib pin. The three unused Tau Ceti
imports and their checks are commented together; their source statements were
read at the Tau Ceti pin. This run establishes Mathlib-only elaboration of the
active code, not a full Tau Ceti import check and not elaboration of the geometric
inventory. No Lean code was changed after this check.

Both unchanged input packets pass `scripts/check_blueprint.py` with zero errors
and warnings. The final deliverables also pass intake path/JSON checks and
`git diff --check`; the README name census, size and single-line TOML checks pass.
