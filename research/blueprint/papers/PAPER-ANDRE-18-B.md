# PAPER-ANDRE-18-B — La conjecture du facteur direct

Yves André, *Publications Mathématiques de l’IHÉS* 127 (2018), 71–93.
[Published paper](https://www.numdam.org/item/10.1007/s10240-017-0097-9.pdf),
[DOI](https://doi.org/10.1007/s10240-017-0097-9).
The published 23-page version is authoritative; the shorter arXiv v1 has different numbering.

Status: **complete extraction; FIX-RT-PAPER-ANDRE-18-B awaits independent fix review**.
The earlier acceptance applies to the pre-fix extraction. The JSON now inventories
**204 items: 23 library, 10 planned, 171 missing**.
Missing means that the exact stated interface still needs implementation; proposed roadmaps and paper extractions are not pinned coverage. No Lean file has been compiled.

## Mathematical scope

The principal conclusions are finite direct summands over Noetherian regular rings (0.1.1), balanced big Cohen–Macaulay algebras over Noetherian local rings (0.7.1), faithfully flat domination of finite covers of regular rings (0.7.2), and the restricted CM descent theorem 4.4.2. The last retains an injective pure local map, a regular target, mixed characteristic and separable residue-field extension. It is not unrestricted weak functoriality.

The proof of the direct-summand theorem follows Hochster’s cited unramified reduction to A=W(k)[[T_1,…,T_n]], with k perfect. That reduction now explicitly includes the equal-characteristic Frobenius and divided-trace inputs. The normalized two-index tower adjoins cyclotomic, coordinate and discriminant roots. Theorem 2.5.2 replaces T=g with tubular neighborhoods, applies sharp approximation and descends to Noetherian stages. The repaired flatness argument uses their torsion-free complete integral models and free special fibres; generic-fibre flatness follows by localization. Colimits, completions and almost adjoints finish the argument. The ramified Abhyankar comparison is an explicit missing adapter from the shared integral almost-purity theorem to the integral model, almost base and trace used here. Ext obstruction annihilation, the idempotent-annihilator lemma and compatible retractions then give an ordinary splitting.

The complete argument has distinct almost bases: the valuation almost base in 2.5.2 and the ramified root-ideal base in 3.2.1. No finite-level integral flatness follows merely from finite-level purity. PerfectoidQuotients:Q3 supplies an existential extension, not an identification with this specified normalized tower.

For big CM existence, use full algebra modifications to construct algebras and bounded partial modules to detect bad finite witnesses. Partial modules carry the image e of 1 explicitly. The relation polynomial is u−Σ(x_j e)T_j, and its multiplier ring is B[T]. The denominator lemma is applied to maps α with α(e)=1; the bound is N′=ND+D+N. The no-bad argument ranges over arbitrarily deep roots of π. Bartijn–Strooker balancing is a cited prerequisite theorem. The parenthetical claimed factorization through unlocalized D is not used.

## Ownership and imports

| Route | Kind | Owner | Missing items |
|---|---|---|---|
| 1 | new | `DirectSummandsAndBigCohenMacaulay` | 111 |
| 2 | part-ii | `PerfectoidRamification` | 43 |
| 3 | source | `DeformationAndDerivedPatchingAlgebra` / `DeformationAndDerivedPatchingAlgebra:R03.3` | 10 |
| 4 | source | `DeformationAndDerivedPatchingAlgebra` / `DeformationAndDerivedPatchingAlgebra:R03.1` | 7 |

The new direct-summand direction starts with ordinary and almost purity, big/balanced CM predicates for arbitrary modules, and splinters. André’s algebra predicates specialize those module definitions. Its later layers own infinite algebra modifications and applications. R03.1 supplies coefficient rings, Cohen presentations and completion adapters; R03.3 supplies finite CM/depth, parameters, normalization and Matlis/local cohomology. DD.1 supplies the single generic Koszul construction.

Uniform Banach and spectral norm comparisons are planned at the five named AdicSpacesPartII R0/R3 nodes. The six additional Weierstrass unit-ball contracts form the first layer of PerfectoidRamification. That Part II also owns the coordinate tower and six explicitly extracted companion root/tubular/Riemann inputs. PAPER-ANDRE-18 still has verdict `revise`; its IDs are reconciliation metadata, not accepted suppliers. P0 adjoints and P1/P2 foundations remain planned imports. P1’s stage covers compatible-root fields, but its current cyclotomic node only states the Q_p case: request `P1-WITT` specifies its generalization to Frac W(k) for arbitrary perfect k.

Keep the order: early ordinary/almost purity and CM predicates → Weierstrass/root inputs → Kummer flatness/purity → integral almost purity (Bhatt–Scholze 10.9) → the explicit Abhyankar comparison → splitting/CM applications. Bhatt–Scholze 10.9 uses André’s flatness, so importing the entire later ramification layer into Kummer flatness would be circular. No undeclared future node IDs are used. Every missing item occurs in exactly one route; earlier ownership audits survive as `reviewAuditHistory`, and the current checks are under `baseline.fixAudit`.

The shared CM owner also receives equal-characteristic balanced big-CM existence and the characteristic-p theorem for R⁺. This input is needed even inside the mixed-characteristic reduction: Z_p[[x,y]]/(px,py) has minimal primes (p) and (x,y), with quotient dimensions 2 and 1, so the only maximal-dimensional component has characteristic p. The sharper R⁺ theorem is shared with the characteristic-p branch of BHATT-ETAL-23/plus-completion-cm. Its characteristic-zero analogue is not asserted.

The [fix report](../redteam/RT-PAPER-ANDRE-18-B.fixes.md) gives exact maintainer edits for the other paper’s three predicate routes, the characteristic-p branch, P1’s node, and historical review route numbers. Those files are outside this issue’s output list. The existing BHATT-18 new route already coalesces under the same owner key.

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
- Corollary 2.6.1 covers every j,k∈N∪{∞}, using directed unions. Its proof first establishes the (∞,∞) case, then uses faithful flatness, purity of composition and purity of a left factor. The stable item ID `kummer-finite-purity` now states the full result.
- Theorem 2.5.2’s printed step (a) sketches a descent from affinoid polydiscs without the required nonfinite-module comparison. E26 records this as a proof gap that changes no statement. The replacement criterion is: over Noetherian A with regular ϖ, a ϖ-torsion-free, ϖ-adically complete module M is flat if M/ϖM is flat over A/ϖ. Flatness of the truncations and [Stacks 0912](https://stacks.math.columbia.edu/tag/0912) prove it. The pinned flatness of the completion of A itself does not supply this arbitrary-module criterion.

## The appendix boundary

The printed A.3.1 is too general in two independent ways. E4 gives a zero-divisor counterexample to (c)⇒(b); the corrected functional criterion requires r=0 or r a non-zero-divisor. E5 disproves the reverse-direction local-duality formula for arbitrary modules. The correct identity is

`Hom_R(H^d_m(M), E) ≅ Hom_R(M, Rhat)`.

For a complete Noetherian local base, a pure R→S splits directly: purity embeds E into S⊗E, injectivity extends the identity of E, and tensor–Hom adjunction produces S→End_R(E)=R taking 1 to 1. This proves the complete-base repair, without finite generation of S.

Completeness cannot simply be discarded. [Datta–Murayama, arXiv:2007.10383v1](https://arxiv.org/pdf/2007.10383v1), Proposition 5.4.1(iii), constructs an excellent Henselian DVR V of characteristic p with `Hom_V(V^(1/p),V)=0`. Its integral Frobenius extension is faithfully flat, hence pure, but does not split. With r a uniformizer and σ=τ=id it satisfies A.3.1’s printed hypotheses. A V^+ retraction would restrict to this extension, so the arbitrary-DVR application fails already with no power-series variables. This is a later counterexample, not an identified author-issued corrigendum. It does not say that every noncomplete DVR fails to split its absolute integral closure.

The main direct-summand and big-CM existence theorems are retained. Their corrected application paths do not use the false arbitrary-DVR claim.

## Source issues and extraction boundary

Of 26 recorded findings, **20 retain their earlier independent confirmations, five remain rejected, and new E26 awaits review**. Rejected: E13 (the footnote supplies the converse attributions), E14 (powers of λ supply the argument), E17 (both companion propositions give valid routes), E18 (the diagram already rules out bad sequences), and E23 (the printed prime was lost in transcription). Rejected allegations are preserved for audit with authoritative `review.verdict` fields; they must not become errata. E11 and E12 were already corrected between arXiv v1 and publication.

The earlier independent report contains the disposition of E1–E25 and the substantial counterexamples. Their same-file review objects are preserved with original attribution. E26 has the fix author’s assessment and a fresh bounded correction search; it has no invented independent verdict. `sourceVersions` identifies the published version read for this fix.

All 23 main-paper pages and the 191 original items were read in the earlier independent review. This fix reread all 23 published pages, checked images of pp.81,82,92, and read the affected companion passages, Bhatt et al. v3 §2.2, and Stacks 0912. The source reading log gives exact scopes and hashes. HH1992 publisher metadata and the theorem as quoted in Bhatt et al. were checked; neither HH1992 nor HH1995 was read in full here. Earlier workers’ readings remain attributed separately. Complete extraction does not claim that every prerequisite paper has been decomposed or that a closed Lean blueprint has been elaborated.

## Validation

The extraction is checked with `scripts/check_paper.py`; the three assigned outputs plus the fix handoff are checked by the swarm intake validator. The fix report preserves reproducible checks of unique IDs, all dependency targets and acyclicity, one route per missing item, referenced packet nodes, definition/construction APIs/tests, and finite arithmetic regressions for the flatness and minimal-prime arguments. No suitable existing Lean build at both pins was found; no setup, cache download or compilation was performed.
