# Red team: Stevens’s classical-group supercuspidals extraction

Agent: Codex, session `codex-rtOQ9t`. Read date: 1 October 2026.
Issue: [#5100](https://github.com/CBirkbeck/tauceti-explorer/issues/5100).
Target: `PAPER-STEVENS-08`, accepted after `REV-PAPER-STEVENS-08`.
Atlas base: `716c33c5ffa866e7a203944b23e43b7fc5acff96`.

Neither the extraction nor its review was done by this agent/session. This
report changes only its two red-team deliverables. It proposes three findings:

| Finding | Severity | Effect |
| --- | --- | --- |
| 1 | High | The claimed extension criterion uses the wrong cohomology quotient; its determinant argument needs a relative version. |
| 2 | High | The unitary skew-lattice API uses the wrong scalar ring. |
| 3 | Medium | Two missing definition items plan the same disconnected cuspidality predicate. |

These are findings for independent verification. The first two include explicit
counterexamples. They do not refute the paper’s supercuspidal construction.

## Sources and scope

The primary source is the [accepted arXiv v2](https://arxiv.org/abs/math/0607622v2),
12 November 2007: the complete TeX was reread, including the introduction,
§§1–7, proofs and bibliography. Mathematical typography was checked in PDF
images at pages 8, 15 and 20. All page references below are to that 55-page
version. The 64-page published Inventiones article was not independently read.
The two passages implicated in findings 1–2 were also compared with v1; this is
not a claim to have reread v1 completely.

The [published Miyauchi–Stevens correction](https://ueaeprints.uea.ac.uk/id/eprint/43291/1/MiyauchiStevens2013MathAnnalen.pdf)
was checked at §2.2, §4, the exact-subordination correction in §5.1, and
Appendix A including A.1. It distinguishes maximal self-dual orders from
maximal parahoric subgroups, requires compact centralizer centre for cuspidal
types, and repairs the exhaustion proof. Those corrections are already
represented in the accepted extraction. The introduction of
[Kurinczuk–Stevens](https://arxiv.org/abs/1509.02212) was read to distinguish
later modular and intertwining/conjugacy results from the 2008 target. That
later paper was not reread in full.

The bounded correction search also checked the main paper’s arXiv history,
[Crossref metadata](https://api.crossref.org/works/10.1007/s00222-007-0099-1),
UEA records and title/erratum searches. Crossref returned no `update-to` entry
and an empty `relation` object. The
[Skodlerack–Ye 2026 abstract](https://arxiv.org/abs/2607.01074) concerns
quaternionic forms and compatible beta-extensions; only its abstract was used
as a scope check. These searches cannot establish the absence of all errata.

Downloaded source identities:

| File | SHA-256 |
| --- | --- |
| Stevens v2 PDF | `b5b409260344f0d86fbe98bee2c046971a5e9042ab8174f199343d10b5857109` |
| Stevens v2 compressed source | `071f2bb604b9c25e903b4cbc8af2eaefdfb69a19887ab4f3d50df51cd73d1a5d` |
| Stevens v1 compressed source | `a599f5651dfe7ba7e9683718b35df1b5021ed699000d583fb965324e3c5a9f53` |
| Miyauchi–Stevens published PDF | `81e8c1cbaa682176da3933de90fe5960e2ce53adc723e485b30fd31db00e37db` |
| Kurinczuk–Stevens PDF | `b21b71f866d42949b25fb116bb1eee15f970ed79b95ea82a8271ff7aad30b34c` |

The extraction’s 303 complete item objects, three route briefs, eight
prerequisites, reader, review result and review report were read. The
mathematical fields of all 54 source issues were checked; E16’s complete review
was read. This does not certify every historical search claim in those issues.

## 1. Relative extension versus absolute linearization

**Where:** items 111–114, especially 112–113; route 1; source issue E16.

Item 112 says that an invariant irreducible representation `η` of `N ◁ K`
extends to `K` exactly when a class on `K/ker η` vanishes. That is false. The
relative Clifford obstruction belongs to `H²(K/N, ℂˣ)`. Inflating this class
to the larger group can kill it while `η` still fails to extend.

Here is a counterexample entirely in odd characteristic. Let `ζ` be a primitive
cube root of unity and write the order-27 Heisenberg group as

```text
K = {(a,b,c) : a,b,c ∈ F₃},
(a,b,c)(a′,b′,c′) = (a+a′, b+b′, c+c′+ab′).
N = {(0,0,c)} = Z(K) = [K,K],
η(0,0,c) = ζ^c.
```

This `η` is irreducible, one-dimensional, faithful on `N`, and invariant under
`K`. A normalized projective extension is `ρ(a,b,c)=ζ^c`, with factor set

```text
ρ(g)ρ(h) = α(g,h)ρ(gh),     α(g,h) = ζ^(−ab′).
```

As a cocycle on `K/ker η=K`, `α=δρ`, so its class is zero. Nevertheless, `η`
cannot extend to a one-dimensional representation of `K`: every such character
kills `[K,K]=N`, whereas `η` is nontrivial there. This directly contradicts the
iff in item 112 with every stated hypothesis satisfied.

The factor set descends to `Q=K/N=F₃²`. Its descended class is nonzero:

```text
α((1,0),(0,1)) = ζ^(−1),    α((0,1),(1,0)) = 1.
```

Every coboundary on an abelian group with trivial coefficients is symmetric.
This cocycle is not, and its values lie in `μ₃`, so its class has order exactly
3. Thus changing just the quotient in item 113 would leave another false
claim: the relative class has order 3, while `dim η=1`.

The actual pinned theorem explains the mismatch. At Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`,
`TauCeti/RepresentationTheory/ProjectiveRepresentation/SchurMultiplier.lean:295`,
`IsProjectiveRep.cohomologyClass_eq_zero_iff` gives

```lean
h.cohomologyClass = 0 ↔
  ∃ (c : G → kˣ) (π : G →* (V ≃ₗ[k] V)),
    ∀ g, ρ g = (π g).trans (LinearEquiv.smulOfUnit (c g))
```

It puts no condition on `c|N`. Consequently it linearizes the projective
representation without preserving the given action on `N`. The determinant
argument for an arbitrary `d`-dimensional projective representation is valid
on its acting group, but cannot serve as the relative extension criterion.
Normalizing determinants may change the restriction to `N`.

The existing upstream InductionRestriction layer 7 already specifies the
Clifford obstruction on `T/N`. There is no upstream defect to fix here.
Stevens’s §4.1 proof on page 20 compresses the projective-extension step;
E16 repairs the missing superscript on the group but does not resolve this
absolute/relative distinction in the extraction’s expanded argument.

**Concrete repair.** Keep item 112 as an import of the relative Clifford
obstruction, with a chosen lift satisfying `ρ(nk)=η(n)ρ(k)` and a normalized
factor set on `K/N`. Split off the valid absolute determinant lemma from item
113. For the actual pro-p argument in item 111, set

```text
d = dim η,     m = order(det η).
```

Because `N` is pro-p and `η` is smooth and finite-dimensional, its kernel is
open and its image is a finite p-group. Invariance makes that kernel normal
in `K`. Thus `m` is a p-power; `d` is a p-power by the item’s hypothesis.
For `D(k)=det ρ(k)`, the function `D^m` descends to `K/N`, and

```text
δ(D^m) = α^(dm).
```

The relative class is therefore p-primary. Its restriction to `S/N` vanishes
when `η` extends to `S`; restriction/corestriction multiplies by the prime-to-p
index `[K:S]`, forcing the class to vanish. This repairs the criterion without
claiming the generally false bound `order [α] | dim η` on the relative class.

The fix should request this relative determinant/finite-quotient bridge from
the existing representation-theory owner, update the brief and proof-gap
record, and retain item 114’s explicit warning that continuous and algebraic
cohomology carriers still need comparison. A source typo correction alone is
insufficient.

## 2. The skew part is linear over the fixed field

**Where:** item 78; route 1’s skew-lattice API; source issues.

In §2.1, page 8, the paper calls the filtration of `A₋` one by
“o_F-lattices”. Item 78 repeats that scalar ring for the exact sequence used
in the proof of Lemma 3.6. The displayed sequence on page 15 itself is stated
in `A₋`; it does not assert the extra module structure. The §2.1 sentence is
the same in v1 and v2.

In the unitary case, the adjoint is semilinear for `F/F₀`. Its skew subspace
`A₋={x : x̄=−x}` is an `F₀`-vector space, generally not an `F`-vector space.
For example, choose

```text
F₀ = Q₃,   F = Q₃(i),   i² = −1,   ī = −i,
V = F,     h(x,y) = xȳ.
```

Here `A=F` and `A₋=Q₃i`. The lattice sequence
`Λ(k)=3^ceil(k/2)o_F` has period 2 and the paper’s normalization
`Λ(k)^#=Λ(1−k)`: the dual of `3^r o_F`, using values in `p_F`, is
`3^(1−r)o_F`. Its order is `a₀(Λ)=o_F`, whose skew part is `Z₃i`.
But `i∈o_F` sends the skew element `i` to `−1`, which is not skew.
Thus this is not an `o_F`-module. Taking a scalar skew simple stratum leaves
`B=A`, so the last term `b₀(Λ)₋` in item 78 exhibits exactly this failure.
For example one may use the scalar `β=3^(−1)i` with valuation `−2` on this
chain.

**Concrete repair.** Use `o_F₀`-lattices in `A₋` and `F₀`-linear restricted
maps. Keep the ambient `o_F`-lattices in `A` and the underlying `o_F`-lattice
sequence in `V`. Record the verified arXiv scalar slip in `sourceIssues` and
propagate it to item 78 and its route brief. The unitary-line example is a
useful API check: the corrected integral skew module is stable under `Z₃`,
while the erroneous `o_F` closure fails. The distinction disappears when
`F=F₀`, explaining why testing only symplectic/orthogonal examples misses it.

No new exactness theorem is claimed here; the finding corrects the scalar
contract of the sequence that the extraction already plans.

## 3. One disconnected cuspidality definition is listed twice

**Where:** missing definition items 246 and 306, both in route 1.

The source convention occurs before Definition 6.17, §6.4, page 43:
“connected component contains an irreducible cuspidal representation”. Both
items implement it. Item 246 specializes the quotient to the maximal-order
setting; item 306 states it more generally and lists later uses. Those uses
should share one definition. Both notes already point to
`PAPER-FINTZEN-21/33` for the connected predicate, also recorded by item 10.

**Concrete repair.** Retain one item, for example 246, with 306’s general
setting and consumer list. Mark 306 as merged, remove its redundant route
entry, and update references/counts/reader tables. Preserve the maximal-order
specialization as an application, and reuse the shared connected predicate.
This requests consolidation within the existing ownership arrangement, not a
new roadmap. No mathematical statement is false here, so severity is medium.

## Checks that did not produce further findings

The source reread followed all sections: depth-zero Morris input; lattice and
building conventions; semisimple characters and Heisenberg representations;
maximal/general beta-extensions; subordinate decompositions and Iwahori
factorizations; intertwining and types; and exhaustion. The extraction also
records unnumbered proof tools. No additional missing main theorem was found
in that pass.

The correction from maximal self-dual order to maximal **parahoric** is already
attached to the cuspidal-type target and exhaustion. It must not be substituted
globally into the earlier beta-extension construction, whose maximal-order
hypothesis serves a different purpose. The corrected exact-subordination
condition, compact-centre requirement and split `SO(1,1)` exception were
compared with Miyauchi–Stevens. No duplicate finding is raised against those
already documented repairs.

The three routes contain 281, 2 and 6 missing items, respectively; together
they are exactly the 289 missing items, with no repeated or unresolved IDs.
The finite Heisenberg input is distinguished from the local Weil theory, and
the finite-reductive commutator/Harish–Chandra facts have an explicit route.
The Stevens odd-p branch is not silently replaced by Fintzen’s stronger
`p ∤ |W|` hypothesis.

The freshly assembled atlas has 2,907 registered stages. The 8,246 stage edges
whose endpoints both occur in that registry admit a topological ordering.
There are another 76 edges involving upstream proxies, excluded from this
finite check. No claim is made to have expanded and certified the entire
upstream graph. The RG2.1–4 and SR.2–3 stage descriptions were checked against
the building/parahoric, induction and supercuspidality imports.

### Pinned library evidence

Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`.
Declarations were read using the pinned git objects, independently of local
working-tree HEAD. The six library-status items are supported with their
stated limitations:

| Item | Declaration(s) read | Scope |
| --- | --- | --- |
| 1 | Mathlib `IsNonarchimedeanLocalField`, `FixedPoints.subfield` | Base-field setting, not the later unitary structure. |
| 64 | Tau Ceti `MackeyDisjoint`, `mackeySubgroup`, `mackeyToH`, `resFDRep` | The finite-dimensional Hom-space for arbitrary groups; no named smooth intertwining set is claimed. |
| 198 | `Rep.mackeyDecomposition`, `TauCeti.Rep.indFunctorCompIso` | Algebraic induction/Mackey; smooth-category transport remains separate. |
| 199 | `TauCeti.simple_indFDRep_iff` | Finite ambient group, algebraically closed characteristic-zero field; compact applications require finite-quotient reduction. |
| 249 | `FDRep.clifford_restrict_iso`, `cliffordSum`, `clifford_restrict_finrank` | Finite-dimensional irreducible representations; finite inertia quotient is supplied. |
| 305 | Mathlib `Rep.indResAdjunction`; Tau Ceti `finrank_hom_indFDRep` | Algebraic reciprocity and its finite-index finite-dimensional form. |

Also read: `TitsSystem` and its `closure_simple` field,
`bruhatCells_eq_univ`, `exists_mem_doubleCoset`, `IsProjectiveRep`, the
linearization criterion quoted above, and
`ContCohomology.explicitCor2_comp_res2`. The generalized affine BN-pair still
needs the nontrivial length-zero subgroup handled separately. The last
cohomology theorem proves the index-multiplication formula on its explicit
continuous `H2` carrier; it does not itself supply the Clifford obstruction
or its carrier comparison.

The reviewed library audit was consulted, specifically the MP.0/MP.1 and
ProfiniteCohomology layer-6 rows and their duplicate-owner notes. No audit
entries occur under the current `SmoothRepresentationsOfLocalGroups:SR.2`
and `:SR.3` IDs. Their roadmap descriptions, rather than a nonexistent audit
row, were used for the planned-status checks. This red team does not certify
all 289 missing statuses through a new exhaustive library audit.

### Reproducible mathematical checks and submission validation

A finite-arithmetic scratch calculation verified all 19,683 associativity
triples in `U₃(F₃)`, that its centre and set of commutators equal `N`, and the
formula `α(g,h)=δρ(g,h)`. On `F₃²` it checked all 729 cocycle identities and
the displayed asymmetric pair. The asymmetry proof above establishes
nontriviality over `ℂˣ`; it is not inferred from a search over finitely many
cochains. A separate calculation in `F₉=F₃[i]` confirmed the skew-subspace
closure failure. These support the written counterexamples and are not Lean
formalizations.

Submission checks:

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-STEVENS-08.result.json`
- `python3 research/blueprint/intake.py check-files research/blueprint/redteam/RT-PAPER-STEVENS-08.result.json research/blueprint/redteam/RT-PAPER-STEVENS-08.md`
- `git diff --cached --check`

No Lean file is a deliverable for this job; no Lean elaboration, dependency
build, cache download or language server was run. No upstream roadmap change
is requested.
