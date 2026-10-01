# Red team: PAPER-HE-21

Codex — `codex-rtOQ9t`, 2026-10-01. Issue [#4246](https://github.com/CBirkbeck/tauceti-explorer/issues/4246). Audited at atlas commit `b8085bc083252d20d3eaec03698a44b38bb4001b`.

Two corrections are needed in the extraction's explanations of previously recorded source issues. The first replaces a false universal claim about shrunken chambers; the second restores the semisimplicity hypothesis of an erratum's kernel calculation. Neither finding disproves He's main theorem or rejects the original source issues E1 and E13. The positive library claims and the item-level dependency graph survived the checks described below.

## RT-PAPER-HE-21/1 — singular does not imply non-shrunken

**High; error.** Locations: `PAPER-HE-21.result.json`, `sourceIssues[E1].reason` and its embedded `review.reason`; `PAPER-HE-21.md`, the paragraph beginning **Rewritten (6)**.

The extraction says that the element produced by Theorem 5.5 is not shrunken whenever its dominant translation part γ is not regular. The embedded review repeats the assertion. Its argument discards the sign of a root coordinate: from a coordinate of absolute value less than one, it infers membership in a critical strip for ±a(α).

That inference changes the definition. The strips are indexed by **positive roots** and use the interval **(−1,0)**. The interval (0,1) for a positive root is allowed. This is also exactly the distinction already made by item /28, test 2: the reflected A₁ base alcove is shrunken.

Here is a nonzero example from the actual construction, with full finite support. Work in split adjoint A₂ with σ=1, fundamental-coweight coordinates, and the negative base alcove

\[
\mathfrak a=\{(u,v):u<0,\ v<0,\ u+v>-1\}.
\]

The three positive-root coordinates are u, v, u+v. The simple reflections and translations act by

\[
s_1(u,v)=(-u,u+v),\qquad s_2(u,v)=(u+v,-v),\qquad
t^{(m,n)}(u,v)=(u-m,v-n).
\]

Take λ=(0,2), x=s₁, y=s₂, and w=x t^λ y. Then

\[
w(u,v)=(-u-v,u-2).
\]

Its positive-root intervals are (0,1), (−3,−2), (−2,−1), so w is shrunken. Also t^λy is a minimal left representative: its three root coordinates are negative, and its length is 3=ℓ(t^λ)−ℓ(y)=4−1.

The data of §5.4 are determined as follows:

| Datum | Value |
|---|---|
| J, ρ∨_J, λ−ρ∨_J | {s₂}, (0,1), (0,1) |
| J′ | {s₁} |
| η(w)=y x=x′z | s₂s₁, with x′=s₂ and z=s₁ |
| β=λ−ρ∨_J+(x′)⁻¹ρ∨_J | (0,1)+s₂(0,1)=(1,0) |
| γ, y′ | (1,0), 1 |
| a=(y′⁻¹z)∗(x′y′) | s₁∗s₂=s₁s₂ |

Thus γ is nonzero and singular, η(w) and a have full support, but

\[
a t^\gamma(u,v)=(1-u-v,u-1).
\]

Its three positive-root intervals are (1,2), (−2,−1), (0,1). It is **shrunken**. The entire open alcove has these intervals; this is not merely a computation at its center.

This example can also meet the main theorem's Newton hypotheses. Here η∨_J=(1,0), and λ♭♭=(1,0): adding α₁∨=(2,−1) to λ−ρ∨_J−η∨_J=(−1,1) gives (1,0), the least feasible dominant coweight. To see leastness, write another feasible dominant coweight as (−1,1)+n₁(2,−1)+n₂(−1,2). Its first coordinate forces n₁≥1, so its difference from (1,0) is a nonnegative integral coroot combination. Choose the basic class with κ=1 in P∨/Q∨≅Z/3. Its Newton point is zero; λ=(2/3)α₁∨+(4/3)α₂∨ has strictly positive coefficients, and λ♭♭≥0. Consequently excluding γ=0 or requiring the full support used in §6.3 does not rescue the assertion.

There is also a shorter rank-one counterexample: for w=s, λ=0 and y=1, the construction gives γ=0 and a=s, whose alcove is (0,1).

**Preserve the actual gap.** The extraction's other A₂ example is correct. For λ=(0,1), x=s₂s₁ and y=1, the construction gives γ=(0,1), a=s₁s₂. The input sends (u,v) to (v−1,1−u−v), with intervals (−2,−1), (1,2), (0,1); the output sends it to (1−u−v,u), with a second interval (−1,0). This genuinely shows that shrunken input does not guarantee shrunken output. He15 Theorem 2.27 requires a shrunken alcove, whereas He21 Theorem 5.5 does not promise one. E1 therefore remains a citation gap.

**Fix.** Replace the universal assertion in E1 and the reader document by “the construction need not preserve shrunkenness,” supported by the existing valid example. Correct the embedded review's reason while retaining its confirmation of the narrower gap. Keep the basic-seed obligations /119–122 and G3. Add the new nonzero A₂ example as a positive regression, alongside the old negative regression. Do not add regularity as a necessary condition for shrunkenness or remove E1.

## RT-PAPER-HE-21/2 — the erratum's torsion-kernel criterion needs semisimplicity

**Medium; error of limited scope.** Locations: `PAPER-HE-21.result.json`, `sourceIssues[E13].reason` and its embedded `review.reason`.

Both explanations attribute to the GHN erratum an unqualified identification

\[
\ker(\pi_0(\mathrm{Flag}_G)\longrightarrow\pi_0(\mathrm{Flag}_{G_{ad}}))
\simeq X_*(T)_{\Gamma,\mathrm{tors}},
\]

and the associated criterion that the component map is injective exactly when the cocharacter coinvariants are torsion-free. Page 2 of the erratum begins this calculation with **“Assume that G is semisimple.”** The general connected reductive setting of Proposition 0.0.1 must not be carried into this subsequent calculation without that additional assumption.

For split G=GL₂, the diagonal torus has X_*(T)_Γ=Z², which is torsion-free. But

\[
\pi_1(\mathrm{GL}_2)=\mathbb Z\longrightarrow
\pi_1(\mathrm{PGL}_2)=\mathbb Z/2
\]

is reduction modulo two. Its kernel is 2Z, not zero. Explicitly the quotient Z²/⟨(1,−1)⟩ is Z via the sum of coordinates; the image in the adjoint quotient is that sum modulo two. One may take equal residue characteristic 3, so the characteristic restriction in the corrected proposition is also satisfied. Central cocharacters contribute a free kernel in this reductive example.

**Fix.** Add “for semisimple G” to both attributions of the kernel formula and torsion-free criterion. Preserve the general componentwise isomorphism and the conditional global-immersion statement of item /104; it already keeps injectivity as a separate hypothesis. Preserve E13 as a known error corrected by the authors. This is a defect in the extraction's explanation, not a new mistake in the erratum. It has limited effect on the simple-group application in He21, which is why it is medium severity.

## Source coverage and versions

Read all 15 pages of the published He21 article, including the references. Inspected page images 5, 10 and 14 to check the strip signs, the construction, and the basic-seed citation. Compared arXiv pages 5–6 and 13–14 at the relevant conventions and proof steps. The preprint and published article are distinct versions; in particular the extra equal-characteristic sentence in E8 is in the publication only. The Cambridge download has a request-specific footer, so its hash need not match an earlier download.

| Source | Reading in this audit | SHA-256 |
|---|---|---|
| [He21 published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf) | pp.1–15; images 5,10,14 | `51d6d38f44d84a92236e406dddc45f778c7e0f9e6408008386f092e429af7d33` |
| [He21 preprint](https://arxiv.org/pdf/2001.03325) | pp.5–6,13–14 | `818873a568bf37ec0b336cb12bd6822879ca369865cceb332ba06b95910989a3` |
| [He15 survey](https://arxiv.org/pdf/1511.01386) | pp.37–38, including Theorem 2.27 and the Newton-stratum normalization of 2.30 | `f6170c52ce24599a5b1b6d7991ae9c9b98a8be8e5cf8753b9a335e74d3fe3cdc` |
| [GHN15 published](https://www.numdam.org/item/10.24033/asens.2254.pdf) | PDF pp.4–7,14; printed pp.648–651,658 | `f0c94caa4855416b4c1949307ea8c4f382d3310f5b27a349216203f5c9d81e3e` |
| [GHN erratum](https://www.esaga.uni-due.de/f/ulrich.goertz/pdf/Erratum-GHN.pdf) | all 3 pages | `cf7efbf887e8202c7efd7590e2eebd85c93c89bea81c26fa39a80af8082399c0` |
| [He14 published](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n1-p06-p.pdf) | printed pp.399–401, including Propositions 11.6–11.7 and the subsequent use | `372c913d305f2b9d5f285cfe830d00f5ad3fd98242e31a54991fbf2474b72cbf` |
| [MV20 preprint](https://arxiv.org/pdf/1902.02415) | pp.8–9, cordiality and saturation proof | `cac23ba66e8eddd933a6bb8e41da965cfbed8a554ab4c866f6d0847de41bc97b` |

Acquired these files on 2026-10-01 at approximately 11:07 and 11:16 UTC. A search for the article title and errata, the current Cambridge article record, and the arXiv record found no correction replacing the relevant He21 conventions. These findings concern the atlas extraction, so no new `sourceIssues` entry against a published author is proposed.

The extraction was checked at all 134 mathematical item cores: statements, library/planned classifications, dependencies, additional APIs, tests and proof outlines. Also read its reader document, review verdicts, all 11 routes, 13 prerequisite descriptions, 14 source-issue records with embedded reviews, and 11 gaps. Repetitive `uses` metadata was sampled rather than asserted to be a separate line-by-line audit.

The proof audit retained the following distinctions:

- The cordial saturation theorem needs a known nonempty lower endpoint. Items /43–46 preserve this; no unrestricted downward nonemptiness claim was found.
- Dominant subtraction uses the integral coroot order and needs nonemptiness, lower-directedness and existence of a least element. The extraction preserves these tasks and the corrected 2ρ∨ feasibility witness.
- Auxiliary full-coweight calculations do not provide integral lifts in every original group. The nontrivial diagram-action warning in /127 and the componentwise descent gate /61 are material, not gaps to erase by assumption.
- The finite-type dimension argument /68 uses a geometric generic fibre and the closure of one of its components. It does not require avoiding a union of proper closed sets or globally finite many ADLV components. Bounded models and compatible perfection are still explicit gates.
- The He14 induction uses saturated support and a descent outside the excluded parabolic. The extraction records both corrections; a generic Hecke cocenter is not a center or an algebra quotient.

This is a completed red-team pass, not a proof-closure certificate for the entire bibliography. In particular HN14's recursive cocenter proof, HY12's case analysis, the original Lang proof, Viehmann's closure proof, and the general ramified/perfect comparison trees were not independently closed here. They remain named frontiers in the extraction. The audit does not treat an explicitly recorded frontier as a newly discovered omission.

## Libraries, owners and dependency checks

Read the declarations below using `git show` at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, including the surrounding hypotheses. All nine library-status items match at the stated level; local-group and dual-root adapters remain separate work.

| Items | Pinned declarations read | File and declaration lines |
|---|---|---|
| /6,/7 | `CoxeterSystem.length`, `IsReduced`, `length_inv`, `length_mul_le` | Mathlib `GroupTheory/Coxeter/Length.lean`:75,81,110,119 |
| /8 | `CoxeterSystem.BruhatStep`, `BruhatLE`, `bruhatPartialOrder` | Tau Ceti `GroupTheory/Coxeter/Bruhat.lean`:84,156,240 |
| /24 | `TauCeti.dominantChamber`, `openDominantChamber` | `LinearAlgebra/RootSystem/Chamber.lean`:137,140 |
| /25 | `TauCeti.existsUnique_mem_orbit_inter_dominantChamber`, `stabilizer_eq_closure_wallReflections` | `LinearAlgebra/RootSystem/FundamentalDomain.lean`:232,186 |
| /26 | `TauCeti.posRootCone`, `mem_posRootCone` | `LinearAlgebra/RootSystem/Positive.lean`:278,283 |
| /27 | `TauCeti.finite_setOf_dominant_sub_mem_posRootCone` | `LinearAlgebra/RootSystem/DominantCone.lean`:119 |
| /130,/131 | `TauCeti.ringKrullDim_tensorProduct_field_of_finiteType`, `finiteRingKrullDim_of_finiteType` | `RingTheory/KrullDimension/FiniteType.lean`:97,64 |

There are 16 distinct named declarations. The /130 locator should navigate to line 97 at the pin, rather than the extraction's 103–107; its declaration name, file hash and mathematical statement are correct. This locator drift is recorded here as a minor navigation note, not another mathematical finding.

Pinned whole-tree searches for Demazure, cocenter/cocentre, class polynomials, shrunken chambers, affine Deligne–Lusztig and parabolic-factor/representative vocabulary found no matching implementation. All 229 Tau Ceti hits and two Mathlib hits for the broad expression were bibliographic or Chevalley–Demazure group-construction references. This search is scoped evidence, not a claim that every unnamed possible implementation was excluded.

Read the reviewed library-coverage entries for BG0/BG1, GS0 loop/Witt geometry, SF.0 and HS0/HS2, and the current descriptions of RG2.0–RG2.4, those stages and SR.1. Read the relevant RootSystems upstream scope and Layers 1–6, with the ReductiveGroups upstream scope already read during this worker session. The paper's root/Coxeter continuation imports the upstream work, and its three Part II routes distinguish combinatorics, classical ADLV geometry, and generic Hecke cocenters. Checked the relevant current peer routes in Kisin–Pappas18, Kisin–Pappas–Zhou26 and Kisin–Zhou25: the dominance candidate is coalesced, and the parahoric-center owner is reused. No competing owner established by these checks needs a new finding.

Reassembled the atlas from the audited checkout instead of trusting an old generated graph:

- 134 items, 376 internal dependency edges; the item graph is acyclic.
- 9 library, 10 planned, 115 missing items. All 125 non-library items are routed exactly once; only the nine library items are unrouted.
- All ten distinct source-route stage IDs resolve.
- 2,907 concrete stages, 8,322 stage edges; the subgraph on concrete stages is acyclic. The 76 edges with proxy/nonconcrete endpoints were counted separately.

Whole-roadmap contraction of the proposed roots and ADLV continuations can show mutual dependencies, because generic early combinatorics supplies later application-specific lemmas. That alone does not exhibit an item cycle. Design must preserve the actual acyclic item order and split early imports; this audit does not mistake the coarse contraction for a proved cycle in a finished blueprint.

## Reproduction and validation

This exact-rational script checks both A₂ transformations on the vertices of the closed base triangle. Since the coordinate functions are affine and nonconstant, their extrema give the open intervals for the interior. It also checks the coroot arithmetic used above and the GL₂ kernel witness.

```python
from fractions import Fraction as Q

vertices = [(0, 0), (-1, 0), (0, -1)]
def s1(p):
    u, v = p
    return (-u, u+v)
def s2(p):
    u, v = p
    return (u+v, -v)
def trans(lam, p):
    return tuple(a-b for a, b in zip(p, lam))
def intervals(f):
    points = [f(p) for p in vertices]
    return [(min(c), max(c)) for c in zip(*[(u, v, u+v) for u, v in points])]
def shrunk(ranges):
    return all(hi <= -1 or lo >= 0 for lo, hi in ranges)

lam = (0, 2)
rho = (0, 1)
beta = tuple(a-b+c for a, b, c in zip(lam, rho, s2(rho)))
assert beta == (1, 0)  # already dominant; y'=1
input_ranges = intervals(lambda p: s1(trans(lam, s2(p))))
output_ranges = intervals(lambda p: s1(s2(trans(beta, p))))
assert input_ranges == [(0, 1), (-3, -2), (-2, -1)]
assert output_ranges == [(1, 2), (-2, -1), (0, 1)]
assert shrunk(input_ranges) and shrunk(output_ranges)
old_input = intervals(lambda p: s2(s1(trans((0, 1), p))))
old_output = intervals(lambda p: s1(s2(trans((0, 1), p))))
assert old_input == [(-2, -1), (1, 2), (0, 1)]
assert old_output == [(1, 2), (-1, 0), (1, 2)]
assert shrunk(old_input) and not shrunk(old_output)
assert (2*Q(2, 3)-Q(4, 3), -Q(2, 3)+2*Q(4, 3)) == lam
assert (2*Q(2, 3)-Q(1, 3), -Q(2, 3)+2*Q(1, 3)) == beta
assert (lam[0]+2*lam[1]) % 3 == (beta[0]+2*beta[1]) % 3 == 1
assert 2 != 0 and 2 % 2 == 0  # nonzero GL2 component killed in PGL2
print('A2 positive/negative regressions, coroot/Kottwitz arithmetic, GL2 kernel: PASS')
```

The report's script was executed. A separate finite-Weyl-group enumeration also reconstructed the §5.4 data and found both the retained counterexample and the new positive example. The schema and intake checks pass; the target paper files were left unchanged. No Lean deliverable is requested by this issue, and no Lean build or language server was run.

Audited input SHA-256 values:

```text
a1bee792882084f9eba3764b7e1a2787463812cf132b219b570ccaa46f513ccd  PAPER-HE-21.result.json
4a70305c9d0ebb8e51765b4819309289d54dd2d4eabcf6e82d238aedba48fa51  PAPER-HE-21.md
ffa695ca7d033a54f8b116170c3df158fa66fd8277fe64ca4a613cf6473479be  PAPER-HE-21.review.json
6fe73095d574e7f98497e0dcc0eeec3a9ab0a2c04b4eed98ded8e678a3adea7a  data/library-coverage.json
```
