# PAPER-ANDRE-18-B — La conjecture du facteur direct

Yves André, *Publications Mathématiques de l’IHÉS* 127 (2018), 71–93.
[Published paper](https://www.numdam.org/item/10.1007/s10240-017-0097-9.pdf),
[DOI](https://doi.org/10.1007/s10240-017-0097-9).
The published 23-page version is authoritative; the shorter arXiv v1 has different numbering.

Status: **complete extraction, accepted after independent in-place corrections by REV-PAPER-ANDRE-18-B**.
The JSON is the declaration inventory: **191 items, 23 library, 9 planned, 159 missing**.
Missing means that the exact stated interface still needs implementation; proposed roadmaps and paper extractions are not pinned coverage. No Lean file has been compiled.

## Mathematical scope

The principal conclusions are finite direct summands over Noetherian regular rings (0.1.1), balanced big Cohen–Macaulay algebras over Noetherian local rings (0.7.1), faithfully flat domination of finite covers of regular rings (0.7.2), and the restricted CM descent theorem 4.4.2. The last retains an injective pure local map, a regular target, mixed characteristic and separable residue-field extension. It is not unrestricted weak functoriality.

The proof of the direct-summand theorem follows Hochster’s cited unramified reduction to A=W(k)[[T_1,…,T_n]], with k perfect. The normalized two-index tower adjoins cyclotomic, coordinate and discriminant roots. Theorem 2.5.2 proves almost faithful flatness by replacing T=g with tubular neighborhoods, applying sharp approximation, descending to Noetherian stages, proving generic-fibre flatness and special-fibre freeness, then passing through colimits, completions and almost adjoints. The companion’s Abhyankar theorem supplies the ramified almost finite étale input modulo p^m. Ext obstruction annihilation, the idempotent-annihilator lemma and compatible retractions turn this into an ordinary splitting.

The complete argument has distinct almost bases: the valuation almost base in 2.5.2 and the ramified root-ideal base in 3.2.1. No finite-level integral flatness follows merely from finite-level purity. PerfectoidQuotients:Q3 supplies an existential extension, not an identification with this specified normalized tower.

For big CM existence, use full algebra modifications to construct algebras and bounded partial modules to detect bad finite witnesses. Partial modules carry the image e of 1 explicitly. The relation polynomial is u−Σ(x_j e)T_j, and its multiplier ring is B[T]. The denominator lemma is applied to maps α with α(e)=1; the bound is N′=ND+D+N. The no-bad argument ranges over arbitrarily deep roots of π. Bartijn–Strooker balancing is a cited prerequisite theorem. The parenthetical claimed factorization through unlocalized D is not used.

## Ownership and imports

| Route | Kind | Owner | Missing items |
|---|---|---|---|
| 1 | new | `DirectSummandsAndBigCohenMacaulay` | 99 |
| 2 | source | `PerfectoidSpaces` / `PerfectoidSpaces:P0` | 6 |
| 3 | source | `PerfectoidSpaces` / `PerfectoidSpaces:P1`, `PerfectoidSpaces:P2` | 1 |
| 4 | part-ii | `PerfectoidRamification` | 29 |
| 5 | source | `DeformationAndDerivedPatchingAlgebra` / `DeformationAndDerivedPatchingAlgebra:R03.3` | 10 |
| 6 | source | `AdicSpacesPartII` / `AdicSpacesPartII:R0` | 7 |
| 7 | source | `DeformationAndDerivedPatchingAlgebra` / `DeformationAndDerivedPatchingAlgebra:R03.1` | 7 |

The new direct-summand direction owns ordinary purity, infinite algebra modifications and the application theorems. R03.1 supplies coefficient rings, Cohen presentations and completion adapters; R03.3 supplies finite CM/depth, parameters, normalization and Matlis/local cohomology. DD.1 supplies the single generic Koszul construction. Generic nonperfectoid Banach localization follows the companion’s AdicSpacesPartII:R0 owner and imports the existing upstream AdicSpaces foundations. The normalized Kummer/ramification adapters extend the *same* PerfectoidRamification Part II proposed by PAPER-ANDRE-18.

Keep a stage-level dependency order: ordinary purity and generic commutative algebra → almost comparisons and generic Banach interfaces → perfectoid ramification → direct-summand/big-CM applications. A coarse roadmap cycle is not a justification for a declaration cycle. Every missing item occurs in exactly one route; its `reviewAudit` records the independent search family and candidate exclusions. The library and planned imports remain explicit dependencies.

## Corrections that affect contracts

- The divided-trace argument requires a normal domain (after the regular local/domain reduction). Generic freeness alone is insufficient; Q[t²,t³]⊂Q[t] is a degree-one obstruction.
- The monomial noncontainment for m<n works in dimension zero; the membership iff m≥n requires positive dimension. The empty product is 1 and the empty generated ideal is zero.
- Products of pure module inclusions allow arbitrary index sets. The diagonal R→∏S_i additionally needs a nonempty index set.
- Adjoining roots of an extra g=1 gives an evaluation retraction after choosing all roots equal to 1; the universal root quotient need not be isomorphic to the original tower.
- Uniform Banach comparison uses the generic smoothed spectral seminorm. A nilpotent of norm 1 has spectral radius zero; mere topological nilpotence does not disprove uniformity.
- Both discrete and dense Weierstrass formulas are used. The ideal formula includes the Tate variable. Powers of a nonunit λ justify the torsion-freeness step.
- Pure completion is tested on every finite presented module over the completed base, by reduction modulo powers of the maximal ideal and Krull intersection. No assertion that such a module descends to R is needed.
- In the product proof of 0.7.2 retain only components dominating the completed regular base. R=k[[x,y]], S=R×R/(x) shows why taking all components introduces a nonflat torsion factor.
- The introductory §0.6 tower identity omits coordinate roots (E25); the body’s §§2.2–2.3 tower is the correct model.

## The appendix boundary

The printed A.3.1 is too general in two independent ways. E4 gives a zero-divisor counterexample to (c)⇒(b); the corrected functional criterion requires r=0 or r a non-zero-divisor. E5 disproves the reverse-direction local-duality formula for arbitrary modules. The correct identity is

`Hom_R(H^d_m(M), E) ≅ Hom_R(M, Rhat)`.

For a complete Noetherian local base, a pure R→S splits directly: purity embeds E into S⊗E, injectivity extends the identity of E, and tensor–Hom adjunction produces S→End_R(E)=R taking 1 to 1. This proves the complete-base repair, without finite generation of S.

Completeness cannot simply be discarded. [Datta–Murayama, arXiv:2007.10383v1](https://arxiv.org/pdf/2007.10383v1), Proposition 5.4.1(iii), constructs an excellent Henselian DVR V of characteristic p with `Hom_V(V^(1/p),V)=0`. Its integral Frobenius extension is faithfully flat, hence pure, but does not split. With r a uniformizer and σ=τ=id it satisfies A.3.1’s printed hypotheses. A V^+ retraction would restrict to this extension, so the arbitrary-DVR application fails already with no power-series variables. This is a later counterexample, not an identified author-issued corrigendum. It does not say that every noncomplete DVR fails to split its absolute integral closure.

The main direct-summand and big-CM existence theorems are retained. Their corrected application paths do not use the false arbitrary-DVR claim.

## Source issues and extraction boundary

Of 25 recorded findings, **20 are independently confirmed and five rejected**. Rejected: E13 (the footnote supplies the converse attributions), E14 (powers of λ supply the argument), E17 (both companion propositions give valid routes), E18 (the diagram already rules out bad sequences), and E23 (the printed prime was lost in transcription). Rejected allegations are preserved for audit with authoritative `review.verdict` fields; they must not become errata. E11 and E12 were already corrected between arXiv v1 and publication.

Every source issue has a personally checked reason in the JSON. The independent report contains the issue-by-issue disposition and proofs of the substantial counterexamples. Bibliographic checks use the primary DOI/author/publisher records. The search for explicit corrigenda was bounded and found none; it is not an exhaustive claim.

All 23 main-paper pages and all submitted items were read in review. Selected prerequisite passages were read, including the original Hochster 2002 §§3–5, the companion’s root and Riemann-extension passages, and Hochster’s local-cohomology notes. Earlier workers’ other source readings are attributed separately. Complete extraction of André’s uses does not claim that every cited prerequisite paper has been fully decomposed, or that a closed Lean blueprint has been elaborated.

## Validation

The extraction and review are checked with `scripts/check_paper.py`; the issue’s four deliverables are checked by the swarm intake validator. Independent structural checks cover unique ids, valid dependency targets, an acyclic item dependency graph, exactly one route for each missing item, definition/construction APIs and tests, source-issue review fields, and pinned source hashes. No Lean compilation was requested or performed.
