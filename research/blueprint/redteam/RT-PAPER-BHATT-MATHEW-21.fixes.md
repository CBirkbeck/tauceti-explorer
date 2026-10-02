# FIX-RT-PAPER-BHATT-MATHEW-21

Codex — `codex-J6LwjP`; issue #5513; 2 October 2026. All eight confirmed findings from
`RT-PAPER-BHATT-MATHEW-21.result.json` and its independent verification are applied to
the extraction JSON and reader. Only the three authorized deliverables change.
The original extraction's verification and the E1–E3 independent verdicts are preserved;
they do not certify this revision, which awaits REV-FIX review.

## 1. Kernel hypothesis and the unrestricted excision theorem

Item **/80** now requires `ker(V → W) ⊆ p` in addition to `pW ≠ W`.
Quotient by the kernel first, carrying p to its quotient, then apply the printed
injective-map argument. Quotients by primes of an aic valuation ring are aic.
**E4**, a stated-result error, records the source omission at v4 Lemma 4.3,
pp. 25–26, and its application in Lemma 4.4, pp. 26–27.

Item **/81's theorem is unchanged**. For a valuation-ring test algebra W and prime
kernel k, total ordering gives these cases:

* `p ⊊ k`: choose `s ∈ k ∖ p`. Then `pW = 0`, and inverting s makes
  `W ⊗_V V_p = W ⊗_V κ(p) = 0`, while `W/pW = W`. A sheaf sends the zero
  ring/empty scheme to a terminal object, so the square is cartesian.
* `k ⊆ p` and pW proper: use repaired /80 and the printed outer/bottom-square argument.
* `pW = W`: the original trivial-square case applies.

The regression is a nonfield aic V, `W = V/m`, and `p = 0`: pW is proper but
contracts to m, and the localization tensors are zero rather than localizations of W.
No failure of Theorem 4.1 is asserted. The arc-route brief carries this repair.

## 2. The rank bound in Remark 3.31

Item **/77** is renamed and restores **rank ≤ 1** in its negative assertion for
`k[x,y]`. Its positive assertion still gives every ring a v-cover with arbitrary-rank
valuation components, hence an arc-cover by /28. The reader and brief carry both
qualifiers. This was an extraction error; E1's separate environment-name misprint
is retained and no additional source diagnostic is filed for this finding.

## 3. Scheme v/arc comparisons

Item **/46** removes the false v-cover claim and retains the spectral versus
ordinary-submersion comparison with affine transition maps. Item **/96** states
that both v and arc on **all qcqs schemes** fail subcanonicity, while preserving
the fpqc contrast.

For the regression, `Spec(k) → Spec(k[ε]/ε²)` is a v-cover, since valuation domains
annihilate ε, and is a monomorphism. All its Čech terms are Spec(k), but A¹'s
descent map on sections is `k[ε]/ε² → k`, which identifies ε with 0. The reader
distinguishes this site from the canonical topology on perfect schemes of /118
and from perfectoid/diamond v-sites. Their covering conditions and categories
cannot be transferred by name.

## 4. Propagating the accepted vanishing correction

Item **/27** now uses **/141's Theorem 7.3**: d+1 for arbitrary torsion sheaves,
d for ℓ-power torsion with ℓ prime to the residue characteristic. It links the
already confirmed **E3**, without duplicating it. The smooth constant-coefficient
adaptation in Remark 7.4(2) is identified as a remark-level frontier; it does not
become an arbitrary-torsion theorem or an extra extraction item. /141 and the
already-correct vanishing contract in the route remain intact.

## 5. Formal glueing in K-theory

Item **/120** and its **K.6 source contract** require **noetherian A and t ∈ A**,
as in the paragraph preceding Example 6.1 on v4 p. 47. The **vertical**
localization fibres are `K(Perf_{V(t)}(A))` and `K(Perf_{V(t)}(Â_t))`;
completion identifies the support categories. **E5** records the horizontal/vertical
misprint as affecting the proof.

Support K-theory is distinct from relative `K(A → A/t)`. No arbitrary-ring
completion theorem, unqualified ideal generalization, or inference that K-theory
is an arc-sheaf is exported. The regression `A = k, t = 0` gives identity
horizontal arrows with zero fibres but vertical fibres K(k), with K₀(k) = ℤ.
This supplier request belongs to the K.6 blueprint; its base atlas layer is not edited.

## 6. Finite coefficients and reuse of the enhancement

Every item **/109–/113** explicitly fixes **finite Λ**. The finite-Tor-dimension
variant from Remark 5.9 remains separately identified and does not remove this
hypothesis. **/109** is now `planned`, importing the constructible category from
**EDC.0** and its enhancement from **EDS E1**. E2 supplies descent and
hypercompleteness. /109 leaves the new-roadmap construction route; **/110–/113**
remain the arc/v-specific missing descent results. Definition API and tests distinguish
the variants: over Λ = ℤ/4, the finite module ℤ/2 in degree 0 is constructible
but has infinite projective dimension.

## 7. Seven further source slips

Each is a separate version-scoped source record with correction-search provenance,
linked to the affected extraction items. Previously correct theorem statements
are retained.

| Record | v4 locator and affected items | Repair and discriminating check |
| --- | --- | --- |
| **E6** | Theorem 5.6 proof, p. 40; /107–/108 | Full subcategory of `Fun(chainᵒᵖ,FinSet)` on injective-transition diagrams, with **all natural transformations**. The fold of two copies of Spec(V) to one is a noninjective morphism that must be present. Rank n has n+1 points, indexed 0,…,n. |
| **E7** | Proposition 2.1 proof, p. 9; /28 | For field V take `Frac(W)` first. For `k → k[[t]]`, the printed maximal prime above 0 is (t), while the minimal prime above m=0 is 0, so they do not form the asserted interval. Then apply the rank-1 prime argument. |
| **E8** | Lemma 7.8 proof, p. 58; /145 | Replace minimum by maximum of generator norms. At X=0, `(f₁,g)=(X,1)` has minimum 0 and maximum 1. The bounded unit-ideal identity supplies the maximum's uniform lower bound. |
| **E9** | Definition 4.6, p. 27; /83 | For arbitrary V the interval rings are ordinary valuation rings; aic follows when V is aic. `V=ℤ_(p), I=Spec(V)` is not aic. |
| **E10** | Proposition 3.10 proof, p. 19; /58 | Products, matching the theorem and disjoint-open sheaf axiom. Two singleton values have singleton product and two-element coproduct. |
| **E11** | Proposition 3.32 proof, p. 24; /76 | Target G(S), not F(S), in the product comparison. |
| **E12** | Corollary 4.11 proof, p. 30; /88 | Lemma 4.9 concludes contractibility on arbitrary-rank aic valuation rings before the v-hypercover step; the theorem's detecting family stays rank ≤ 1. |

E6 and E7 are proof errors, E8 and E10–E12 proof misprints, and E9 a
misprint affecting the stated definition. E4–E12 have no self-issued review verdict.

## 8. Three supplier results and their owners

**/147** records **Bhatt 2016, Theorem 1.5**, with qcqs algebraic-space target Y,
arbitrary algebraic-space source X, and exact symmetric monoidal functors on
Perf (equivalently cocontinuous symmetric monoidal functors on D). No affine-diagonal
or perfection restriction is introduced. **/118** consumes it at `X_perf`.
The extraction requests
`SchemeAndStackFoundationsPartIIAlgebraicSpaceTannaka`, titled
**Scheme, stack, cohomology and intersection foundations, Part II: Algebraic-space
reconstruction from perfect complexes**. SF.1 alone does not promise this theorem.
Import **SchemeKTheoryOperations:S.1** and **EnhancedDerivedSheaves:E1** for the
shared enhancement; extend that model to algebraic spaces by SF.1 descent. Its brief
includes affine reconstruction, identity/composition compatibility and a projective-line
target test. It does not substitute or duplicate Hopf/comodule Tannaka duality.

**/148**, **Deligne SGA 4½, Corollary 1.11**, records constant-F_ℓ Künneth for
finite-type schemes over a separably closed field with invertible ℓ. Its qcqs use
requires a **separate étale limit comparison**. **/149**, **Huber 1996, Corollary
4.2.7 as used on v4 pp. 53–54**, records the specialized cohomology computation
for the tensor product of rank-1 aic valuation extensions, with π remaining a
pseudouniformizer and ℓ invertible in the residue field. Both are routed once as
sources of **SF.2**, and **/138** imports them. API/tests retain the hypotheses,
unit maps, symmetry and point/disjoint-point examples.

Bhatt and Deligne are added as prerequisites, and Huber's existing prerequisite
now names Corollary 4.2.7. No other job's packet is edited: these route briefs and
source contracts are the maintainer/design/blueprint handoff required by §16.

## Source and library audit boundaries

The arc v4 PDF was re-fetched to SHA-256
`4cdf5593067a425ca0aebc969d34efa4ef296cde613c3d9a6c671db65b9b6620`.
The relevant statements/proofs were read in PDF text, with page-image checks of
the substantive diagnostics. This is a targeted fix audit, not a new full extraction.
The published Duke PDF served an HTML challenge; **all new diagnostics are v4-only**.
On 2 October, arXiv still listed no post-v4 revision, the author-page/title searches
disclosed no erratum, and Crossref had no correction relationship. That does not
prove the published text has the same slips.

Bhatt's published statement was read on pp. 406–407 (PDF pp. 4–5), SHA-256
`891d2882c54816388eeda2b63c9c29d5531127d00a5c49a65e4b6499d691f1c4`.
Deligne's coefficient conventions and Corollary 1.11 were read in the modern
[retypeset SGA 4½ mirror](https://math.bu.edu/people/yangzhe/Cohomologie_Etale.pdf),
chapter 7, printed pp. 115–117, SHA-256
`3098a8d2c3633da06d07d8bbc80826f93dbb4a5e0dccb245606e303d339dc825`.
No 1977 print collation or full supplier-proof audit is claimed. **Huber Corollary
4.2.7 was not obtained**: publisher book/chapter pages give subscription previews.
/149's precise scope is checked against the primary consuming proof, and SF.2 must
obtain the supplier statement before claiming proof closure. Under Protocol §16,
this explicitly recorded supplier-audit frontier does not make an extraction partial.

At the pinned Mathlib **082e2d3** and Tau Ceti **f790474**, the actual statements of
`ModuleCat.ringEquivEndForget₂` and `fgPointTensorIsoEquiv` were read: these recover
a ring from additive module-forgetful endomorphisms and Hopf-algebra points from
comodule tensor automorphisms, respectively, not /147. Tau Ceti's
`geometricallyConnected_tensorProduct` and `Scheme.Modules.tensorProduct` supply
connectedness and ordinary module tensor products, not /148 or /149. Reviewed
coverage and full stage contracts for SF.1, SF.2, EDC.0, E1, E2, K.6 and S.1
were consulted; S.1's shared enhancement is a supplier plan, not a claim of a
completed derived ∞-category in the pinned library.

## Validation

The extraction has **149 items = 4 library + 4 planned + 141 missing**;
route sizes are **121, 8, 6, 3, 2, 1**, summing to 141. There are **20 prerequisites**
and **12 source diagnostics**. Each missing item is taken exactly once.

Validation checks paper/intake schemas, source-issue/version records, preservation
of historical verification, route accounting and prerequisite acyclicity. Mathematical
regressions cover the residue-quotient kernel case, the dual-number descent failure
(nine F₃[ε]/ε² sections restrict to three), noninjective finite-chain natural
transformations for ranks 0–6, and the maximum/minimum distinction at 81 points
of the 3-adic unit ball. The 140 prime/kernel pairs in finite chains of ranks 0–6
have exhaustive disjoint cases. The freshly assembled atlas plus requested theorem
dependencies has 2,588 incident vertices and 8,648 edges and is acyclic.
No Lean file is a deliverable for this extraction fix; no Lean compilation or build
was run, and no formalization is claimed.
