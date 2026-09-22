# PAPER-MARTIN-25 — Markoff graphs and component divisibility

Codex — session `codex-c83e7a`; issue #1216; read on 21 September 2026.

The full published four-page paper has been extracted into 54 items. Six are existing library constructions or theorems. The 48 missing items have exactly one route each: 13 become sources for `ClassicalArithmeticCompletion:CA.4`, and 35 form **Arithmetic dynamics, Part II: Markoff actions and strong approximation** (`ArithmeticDynamicsPartIIMarkoff`). This is a complete paper inventory and routing proposal. It is not a claim that the proposed proofs have been formalized or that the longer prerequisite papers already have complete blueprints.

The extraction records a correction to the printed scope of Theorem 1.4. Its proof assumes `p>3`. For the paper’s equation with coefficient **3**, divisibility also holds at `p=2`, but fails at `p=3`: that graph is a connected cube with eight vertices. The valid endpoint is therefore component divisibility for primes `p≠3`, with the exceptional graph stated separately. This correction does not affect eventual connectivity or strong approximation for sufficiently large primes.

## Sources actually read

Daniel E. Martin, *A new proof of Chen’s theorem for Markoff graphs*, Inventiones mathematicae **241** (2025), 623–626, [DOI 10.1007/s00222-025-01346-9](https://doi.org/10.1007/s00222-025-01346-9). The publisher’s [PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01346-9.pdf), published 20 June 2025, was read completely: introduction, Conjecture 1.1, Theorems 1.2–1.4, the entire proof in §2, footnote and bibliography. Its SHA-256 is `3e1f4b7f99f18b71159463aaf2d9e649e11317272782f9105299a9d72369097c`. There is no version-match uncertainty for the primary source because the typeset published article was obtained directly.

The article is [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). The result and report adapt its mathematics into declaration-sized statements, supply explicit elementary proof steps and library interfaces, and add the documented scope correction. Those additions should not be attributed to the author as printed statements.

All acquisitions below were made on 21 September 2026. Downloading is distinguished from reading.

| Source | Reading used | SHA-256 |
| --- | --- | --- |
| [Martin arXiv PDF](https://arxiv.org/pdf/2502.15960) | Acquired as a comparison copy; the published PDF is authoritative for this extraction | `64545305d72b6a3476c980798c8133c4b034341de6145a0782a25b8669fbec7d` |
| [Bourgain–Gamburd–Sarnak, full paper v1](https://arxiv.org/pdf/1607.01530v1) | pp.1–5, including the actual group definition and Theorems 1–2; the later full proof was not read for this paper job | `50f3dcde0c4a3a841f4eb3556838ecd162a7988ea3d3c1235f53c9c427b03e9e` |
| [BGS announcement v2](https://arxiv.org/pdf/1505.06411v2) | pp.1–4, for the group convention, theorem versions and proof-outline context | `725daa8a867fcce0a95ddf1ca750807603fb00feda6db95794daf84a695bd525` |
| [Eddy–Fuchs–Litman–Martin–Tripeny, author PDF](https://www.math.ucdavis.edu/~efuchs/Markoffconnectivity.pdf) | pp.1–4, including Definitions 1.2 and Theorem 1.4 and the graph-convention comparison | `0795f7cd9c28c147ed642392919cd0879714a36e461ca353b379f7ea66bee8c0` |

The [published Eddy et al. article](https://doi.org/10.1112/plms.70027) was also checked for its stated exact primorial threshold. The general moduli theory in Chen’s paper and Penner’s decorated Teichmüller theory are credited historical context, not imported proof inputs in Martin’s §2. Brown’s and de Courcy-Ireland–Lee’s computations are mentioned as context; no algorithm or numerical connectivity claim from them is used or represented as checked here. The older Markoff tree claim is accompanied below by a complete elementary descent argument, without claiming that the 1879 article was read.

The `prerequisites` array identifies the uncovered BGS orbit estimates and Eddy et al. effective refinement. Their full source proofs belong in the proposed design’s subsequent blueprint. The precise input statements were checked here. This distinction is permitted by the paper-job separation between extraction/routing and the later design and blueprint jobs; it does not certify those imported proofs as decomposed.

## Coverage of the four-page paper

| Source portion | Extracted content |
| --- | --- |
| p.623, equation and Vieta moves | `/1`–`/8`: equation, nonzero and positive loci, mutations, involutivity and preservation |
| p.623, integer tree and lifting interpretation | `/9`–`/13`: descent, tree, permutations, reduction and strong approximation |
| Graph convention used throughout | `/14`–`/19`, `/35`, `/54`: Vieta and BGS groups, graph/orbit comparison, loops and zero coordinates |
| pp.624–625, (2.1)–(2.4) | `/20`–`/26`: extended Penner weights, normalization, both edge cases and fixed points |
| p.625, (2.5) and final calculation | `/27`–`/31`: finite invariant-set balance and component divisibility |
| Theorem 1.4’s small-prime boundary | `/32`–`/34`: `p=2`, the `p=3` counterexample and corrected scope |
| Theorems 1.2–1.4 and the corollary | `/36`–`/43`, `/53`: exact external orbit estimates, connectivity and lifting consequences |
| Effective refinement on p.624 | `/44`–`/46`: maximal divisors, coefficient normalization and the effective threshold |
| Conjecture 1.1 | `/47`: the all-prime proposition, recorded as a proposition rather than a proved result |
| Actual reusable substrate | `/18`, `/48`–`/52`: graph, finite-sum and prime-field declarations |

Every equation in the proof is accounted for, including the zero-coordinate cases and the fixed points of an involution. The statement that the usual nonzero weights are Penner coordinates is attribution of an explicit formula, not an instruction to construct moduli of decorated hyperbolic surfaces. Likewise, Martin’s theorem is the Markoff corollary of Chen’s theorem, not the full divisibility theorem for covers of elliptic curves.

## The prime-three correction

Martin defines

`x1²+x2²+x3² = 3x1x2x3`

and removes only the zero **triple**. Removing every triple with a zero coordinate would change the graph and break the proof’s case analysis.

At `p=3`, the right side vanishes. A square in `F3` is zero or one, so a nonzero solution must have all three coordinates nonzero. Thus there are exactly `2³=8` vertices, namely `{1,−1}³`. A Vieta move is `x_i↦−x_i`, independently of the other coordinates. These are precisely the edges of a cube. The graph is connected and its component cardinality is eight, which is not divisible by three.

At `p=2`, the four vertices are `111,011,101,110`. The three moves take `111` to the three other vertices, so the graph is connected and its cardinality is divisible by two. The extra moves at a leaf are fixed points. The published proof does not treat this case, but the direct calculation completes it.

The valid extraction is consequently:

- For every prime `p>3`, Martin’s proof gives `p ∣ #C` for every component.
- The same divisibility holds at `p=2` by enumeration.
- At `p=3`, the literal unqualified theorem sentence is false for the displayed equation.

Changing variables to the coefficient-one equation `z1²+z2²+z3²=z1z2z3` uses `z=3x`; this is an equivalence only when three is invertible. It cannot repair the prime-three statement. The corrected hypothesis and counterexample are part of the result, the route brief and the acceptance tests.

## Complete elementary proof dependencies

The Vieta maps preserve the defining polynomial by expansion, square to the identity, and fix the origin. They therefore permute the nonzero solution set over every commutative ring. Only the later weight construction needs a field and invertibility of two and three.

For a positive integer triple, the other root satisfies

`c(3ab−c)=a²+b²>0`.

Hence mutations preserve positivity. To justify the integer tree, order the coordinates `1≤a≤b≤c` and consider `q(t)=t²−3abt+a²+b²`. If `(a,b)≠(1,1)`, then

`q(b)=a²+(2−3a)b²<0`.

Indeed, for `a=1,b>1` this is `1−b²<0`; for `a≥2`, use `a²≤b²` to obtain at most `(3−3a)b²<0`. Since `c` is a root and `c≥b`, the other root is positive and strictly below `b`. If `a=b=1`, the roots are one and two: the nonroot triple `112` descends to `111`. The maximum coordinate is unique away from `111`, since a repeated maximum would give `q(b)=0` in the preceding strict case. Mutating any other coordinate increases the sum, whereas the maximum-coordinate mutation decreases it. This proves termination at the root and a unique descending neighbor. A cycle would have a maximal-height vertex with two descending neighbors, a contradiction. These arguments establish `/8`–`/10` without importing a black-box tree claim.

Reduction commutes with the integral polynomial moves. Since every positive triple is reached from `111` and every reduced move is a permutation fixing the origin, a positive triple never reduces to the origin. This proves the codomain of the reduction map; primitivity is not silently assumed. Lifting a finite sequence of reduced moves to integer moves preserves positivity at every step.

For weights, two zero coordinates force the remaining square to vanish. Thus a nonzero point has at most one zero coordinate. The three branches with a zero coordinate in (2.1) are unambiguous. Dividing the equation proves `∑y_i=1` when the product is nonzero; the other case is `0+1/2+1/2=1`.

For the `i`th move, if the other two coordinates are nonzero then `y_i=x_i/(3x_jx_k)` even when `x_i=0`; the two numerators sum to the denominator. If one of the other two coordinates vanishes, both weights are `1/2`. This proves `y_i(x)+y_i(R_i x)=1` for every vertex, including a fixed vertex. Fixed vertices therefore have weight `1/2`.

If `C` is stable under this involution, it restricts to a permutation of `C`. Reindexing the finite sum gives

`2 ∑_{x∈C} y_i(x) = #C`.

This argument covers fixed points and the empty set and needs no division into free two-element orbits. A component is stable under all three moves, so summing in the two orders gives `#C=(3/2)#C` in `Fp`. Thus `#C=0` in `Fp`, and the existing residue-cast theorem converts this to divisibility by `p`. Every step in this proof is an extracted item or ordinary algebra on a read library supplier.

## The BGS convention and the noncircular corollary

Bourgain–Gamburd–Sarnak use `Γ`, generated by the Vieta moves **and coordinate permutations**. Their larger group `Δ` additionally changes pairs of signs; `Δ` is not the input group here. Their giant-orbit theorem uses `≤p^ε`, whereas Martin writes a strict inequality. Replacing `ε` by `ε/2` gives a strict bound once `p>1`.

Let `V` be the Vieta subgroup. Coordinate permutations conjugate its generators to one another, so `V` is normal in `Γ`. The root `a=111` is fixed by every coordinate permutation. Moving permutations to the right in a word therefore gives

`Γ·a = V·a`.

Thus transitivity of `Γ` and connectivity of the Vieta graph are equivalent. This also transfers the exceptional-prime count in BGS Theorem 2 to Martin’s Theorem 1.3.

A giant `Γ`-orbit is not automatically a single Vieta component. The route uses the following proof order to avoid that assumption:

1. Prove Martin’s component divisibility directly, without any giant-orbit input.
2. Apply BGS Theorem 1 with exponent `1/2` at a sufficiently large prime, obtaining a `Γ`-orbit with complement smaller than `p`.
3. Every other `Γ`-orbit contains a nonempty Vieta component, whose size is at least `p`. Hence no other orbit exists.
4. Use the root-orbit identity to obtain connectivity for the Vieta-only graph, then lift its paths to positive integer triples.

This proves the eventual-connectivity and strong-approximation conclusions. Martin’s displayed giant-Vieta-component statement also follows after eventual connectivity, with empty complement; the route does not use that consequence as an input to its own proof.

## Effective threshold and external boundaries

The introduction cites Eddy et al. for a bound sufficient to make the giant-component argument effective. Their equation has coefficient one, so the route includes the conjugacy `x↦3x` over `Fp` for `p≠3`.

The exact displayed threshold in their Theorem 1.4 is

`T=(863#)(53#)(13#)(7#)(5#)·3³·2⁵`,

where `n#` is the product of primes at most `n`. Exact integer multiplication gives `T=3.44804838267768…×10^392`, and proves `T<3.489×10^392`, the bound quoted by Martin. The publisher HTML prints a `3.488…` approximation alongside the same product; this decimal discrepancy is another reason to retain the exact product. The author PDF’s approximate `3.45` agrees as a rounded upper bound. No rounded decimal is used as an exact constant.

The definition of maximal divisors is extracted because Martin explicitly names that ingredient. No full maximal-divisor estimate or threshold algorithm is represented as proved here. The design brief requires the original effective argument and certified threshold computation to be decomposed from [7]. Similarly, the BGS endgame, middle game and opening remain the source work for the later blueprint; the present extraction reads and states precisely the external results the short paper invokes.

## Library audit and ownership

Full source archives were searched at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Searches for Markoff, Markov triples, Penner weights, Vieta and component divisibility found no implementation of this equation or theorem. Vieta hits concern polynomial symmetric functions and elliptic-curve formulas, not Markoff mutations. Generic finite graph, residue-field and sum theory is present and reused.

The following actual statements were opened at those pins:

| Supplier | Checked source |
| --- | --- |
| `ZMod`, `ZMod.fintype`, `ZMod.card`, prime field structure | `Mathlib/Data/ZMod/Defs.lean:142,158,166`; `Mathlib/Algebra/Field/ZMod.lean:18–40` |
| `SimpleGraph` | `Mathlib/Combinatorics/SimpleGraph/Basic.lean:95` |
| `SimpleGraph.Reachable` | `Connectivity/Connected.lean:52` |
| `SimpleGraph.reachable_fromEdgeSet_fromRel_eq_reflTransGen` | `Connectivity/Connected.lean:119` |
| `SimpleGraph.ConnectedComponent` and `.supp` | `Connectivity/Connected.lean:390,548` |
| `Fintype.sum_equiv` | Additive declaration generated from `Algebra/BigOperators/Group/Finset/Defs.lean:738–744` |
| `ZMod.natCast_eq_zero_iff` | `Mathlib/Data/ZMod/Basic.lean:519` |

`Finset.sum_involution` was also inspected. Its cancellation formulation is not literally the desired weight-balance theorem; the extraction therefore imports finite-sum reindexing and plans the small weight-balance lemma. Existing simple graphs are loopless, so the coordinate-labelled moves are retained separately and the existing reflexive-transitive-closure theorem proves the reachability comparison.

The reviewed audits for `ArithmeticDynamics:DY.0`, `ClassicalArithmeticCompletion:CA.0`, `CA.4`, `FiniteFieldsAndCharacterSums:FF.0` and `AdditiveCombinatorics:AC.0` were read, together with the remaining dynamics targets. The built residue arithmetic and additive combinatorics are not planned again. The current descriptions of ArithmeticDynamics, ClassicalArithmeticCompletion, EffectiveDiophantineMethods, FiniteFieldsAndCharacterSums, AdditiveCombinatorics and the nearby Diophantine/geometry-of-numbers directions were inspected. Related accepted decomposition inventories, all incident link entries in the fetched link maps, reserved IDs, six new roadmaps and the one current packet were checked for an exact supplier. No accepted Markoff object, node or endpoint was found. The Multiquadratic and RootSystems upstream documents had already been read completely during this session and supplied the local model of statement and interface density.

`CA.4` owns classical Diophantine equations and elementary descent. The positive Markoff tree is a concrete source in that existing scope. The proposed Part II imports its equation and reduction interface. This keeps integer descent in one place.

`ArithmeticDynamics` is the closest existing direction for finite-field polynomial group actions. Its present DY.0–DY.6 focus on iterations, polarized heights, local dynamics, periodic points and arboreal representations. They do not supply this affine three-involution action or strong approximation. The extension therefore requires new layers, with a precise Part II brief. `EffectiveDiophantineMethods` concerns exhaustive algorithms for rational points and does not cover this infinite-orbit theorem. `FiniteFieldsAndCharacterSums:FF.5` is a process layer in the reviewed audit and is not a mathematical owner for the theorem. General finite-field curve bounds and reusable combinatorial estimates encountered in BGS must still be imported from their actual owners when the design decomposes that paper.

The concurrent `PAPER-CHEN-24` concerns a broader proof using moduli and Nielsen equivalence. It has no accepted result in the inspected tree. Its future result should consume the same Markoff carrier and distinguish its broader theorem from Martin’s elementary corollary. An unsubmitted job is not an existing supplier.

## Validation and acceptance

The paper schema checker and intake file checks are run on the two deliverables. A separate structural check verifies unique IDs, real route endpoints, and exact-once routing of every missing item. Six library items receive no new construction route.

An independent exact-arithmetic script enumerated all vertices and components for every prime through 43. It checked mutation preservation/involutivity, the zero-coordinate condition, all weight sums and edge-complement identities for `p>3`, component coordinate sums, and component divisibility except at three. It also checked the exact primorial threshold against Martin’s rounded bound. All checks passed. These finite checks are regression evidence, not a proof for arbitrary primes.

Selected acceptance cases are:

- `p=2`: four vertices, connected, including fixed moves.
- `p=3`: eight vertices forming a cube; divisibility by three must fail.
- `p=5`: 40 vertices, including `(0,1,2)` and its zero-coordinate weights.
- `p=7`: 28 vertices with fixed moves, exercising the half-weight case.
- `p=11`: 88 vertices; `(2,1,5)` is fixed by `R1` and its first weight is `1/2`.
- An empty invariant set has zero weight sum.
- The normalization `x↦3x` is rejected at characteristic three.

No Lean file belongs to this paper job. No Lean compilation was performed or claimed. The complete status records coverage and routing of this paper, with its source correction visible; the independent review remains necessary before these routes are accepted.

## Correction by the independent review

The independent review (REV-PAPER-MARTIN-25, `research/blueprint/reviews/REV-PAPER-MARTIN-25.md`) accepted this extraction and both routes. It changed route 2's `area` from `diophantine`, an atlas group name, to the galaxy id `arithmeticgeometry`.
