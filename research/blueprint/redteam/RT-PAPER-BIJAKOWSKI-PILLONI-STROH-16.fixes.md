# FIX-RT-PAPER-BIJAKOWSKI-PILLONI-STROH-16

Codex — codex-J6LwjP, 2 October 2026. Refs #5503.

All four findings confirmed by the independent RT review are addressed in the extraction and reader. The mathematical target remains Theorem 5.3.1. The corrected planning interfaces go to the existing owners; no atlas base, independent review file or other packet is edited. The future HigherHidaAndColemanTheory design must prove these interfaces before importing them. No full proof completion or formal implementation is claimed.

## 1. Restrict the formal-étaleness assertion

Item /7 retains the algebraic morphism P, its Barsotti–Tate targets, proper Iwahori forgetful map and algebraic fibre product X_Iw. Its formal-étaleness assertion now applies only to test schemes where p is locally nilpotent, equivalently the relevant p-adic formal completions with fixed dimension/signature components. It imports /6, the PEL Serre–Tate equivalence owned by AbelianSchemesAndArithmeticModuli A4, with action, polarization and prime-to-p level. Item /6's note, the reader and the Part II brief carry this qualification.

[Katz, Theorem 1.2.1, printed p. 143](https://web.math.princeton.edu/~nmk/old/serretatelocmod.pdf) explicitly assumes p nilpotent. In characteristic zero the étale BT group lifts uniquely across dual numbers, whereas the Legendre elliptic family at t=3+ε has a nonzero j-derivative. Direct exact dual-number calculation gives j′(3)=31360/27. Prime-to-p level lifts uniquely and principal polarization does not remove this elliptic deformation. Thus unrestricted P is not even formally unramified. The characteristic-zero test is deliberately outside the corrected theorem's domain. New E15 records the missing qualification in the published p. 984 sentence, rather than declaring the algebraic construction invalid.

## 2. Qualify the norm bound and discharge its hypothesis in the application

Item /28 exports the degree-lower-bound lemma only with c_i≥0, where c_i is the minimum last entry of the weight in type C and the minimum sum of the two last entries in type A. If n_i denotes the stated normalization exponent, the repaired conclusion is `‖U_i^bad‖≤p^(n_i−ν c_i)` for complements of degree at least ν. Dominance alone does not imply the sign hypothesis. For general dominant integral weights the API retains actual partial degrees/elementary-divisor valuations and signed weight contributions before taking the branch supremum and trace bound; it never substitutes ν against a negative coefficient.

The scalar genus-two weight (−1,−1) provides the regression. For its canonical multiplicative complement of degree 2, the pullback is p on each invariant differential, by [Katz, Lemma 4.1.3, printed p. 170](https://web.math.princeton.edu/~nmk/old/serretatelocmod.pdf). The det^(-1) weight contributes p^(-2); the branch normalization contributes p^(-3). The p-adic norm is p^5, whereas the permitted lower bound ν=1 would give p^4. At p=5 these are 3125 and 625. The API includes this rejection test, the zero-weight boundary and the type-A sum convention.

Items /29 and /30, the reader and the Part II brief explicitly use the source normalization's `v(α_i)≥0` on p. 994. Together with Hypothesis 4.5.1 and n_i≥0 this gives c_i>0. A sufficiently small positive ε gives `n_i+v(α_i)−(1−ε)c_i<0`, so the repaired /28 yields the contraction used in the Kassaei series. A changed normalization must re-establish or assume its valuation input. New E16 records the missing sign condition in the published lemma on p. 1004; the intended small-slope theorem survives.

## 3. Replace the false simultaneous-product helper

Item /27 retains Lemma 4.4.3 and Theorem 4.4.1. New E17 marks the p. 1003 helper that asserts simultaneous q into the k-fold product is finite étale. In nonempty positive-dimensional moduli its source has dimension D and the product target kD. For genus-two moduli and k=2 these are 3 and 6, so q cannot be étale. No product-map étaleness is imported.

The replacement works on the E12 closed quasi-compact degree boxes. Use the full distinct-complement tuple cover B_k^rig, finite étale over the moduli space by the forgetting map p. Each coordinate quotient q_j factors through a finite coordinate-forgetting map to C_i^rig and then the finite correspondence projection p2 (§2.2, pp. 989–990). Therefore each `q_j^(-1)(V_l)` is quasi-compact open. Intersect these finitely many preimages with `p^(-1)(U)` in the separated full cover; quasi-separatedness ensures the intersection is quasi-compact. Its p-image is quasi-compact open by Proposition 4.1.4, and counts exactly points with at least k distinct bad complements. This yields Lemma 4.4.3's conclusion and the decomposition it serves.

The proof does not infer finiteness for the restriction of a coordinate map to an arbitrary open. Empty tuples, one coordinate, repeated quotient values with distinct complement labels and the dimension obstruction are tests. The design carries the prior E12 correction: construct on closed boxes and exhaust/glue to reach half-open boxes, without pretending those boxes are quasi-compact.

## 4. Reuse the planned Conrad criterion

Item /21 now has status planned at AdicSpacesPartII R2 and R0 and names the exact integrated node `AdicSpacesPartII:R2/fibral-finiteness-criterion`. [Conrad, Theorem A.1.2, p. 37](https://math.stanford.edu/~conrad/papers/genpaper.pdf) applies to a flat, quasi-compact, separated rigid morphism with finite fibres and locally constant fibre rank. For f|U, étaleness supplies flatness and identifies fibre rank with geometric cardinality; the quasi-compact open immersion and finite f supply quasi-compactness; separation and finite fibres are retained. Thus the existing criterion gives finiteness. Since U is finite over Y and X is separated over Y, U→X is proper; as an open immersion it is also closed. The complement is finite étale by the R0 API. Existing E4's U→X correction is retained.

Route 1 keeps /21 as a BPS application/alternate source allowed by §16, explicitly not as a missing frontier. It now has four missing items plus this planned application. The result summary and reader give current counts 1 library / 8 planned / 34 missing. The accepted AdicSpacesPartII packet remains partial, the criterion's implementation status remains unchecked, and its documented unread formal-model imports remain imports. Planned does not mean built. The criterion and its formal-model proof are not commissioned a second time.

## Version provenance, correction search and reuse

The exact published [Annals PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p05-p.pdf) was fetched on 2 October 2026, SHA-256 `13c159cde16c09c98de6b29ed1cf0e293ae78e5dc250399a1ee9203b3601d92c`, matching the independent RT record. Targeted reading covered pp. 984,989–990,994–999,1003–1004; page images 984,1003,1004 were checked. The three new source issues are against this published text. Existing E1–E14 and their independent review objects are unchanged; neither the new issues nor the extraction acquire a self-authored review.

Supplementary exact files and limits are recorded in `sourceVersions`: Katz Theorem 1.2.1 and Lemma 4.1.3, Conrad Appendix A.1 pp. 37–39 including proofs, Pilloni author PDF pp. 27,29, and the undated 33-page [Stroh author copy](https://webusers.imj-prg.fr/~benoit.stroh/surconv_trois.pdf), pp. 8,24,25. The latter repeats the unrestricted étaleness, product helper and norm statement. It is not treated as a later corrigendum. Pilloni's earlier genus-two norm argument likewise does not repair the signed degree-substitution step. These are targeted readings, not a full proof audit of all supporting literature. Conrad's explicit BL/EGA imports remain outside this reading.

The bounded correction search on 2 October 2026 checked the [Annals article page](https://annals.math.princeton.edu/2016/183-3/p05), Crossref DOI 10.4007/annals.2016.183.3.5 (empty relation, no update-to/updated-by fields), title-specific erratum/corrigendum searches, [Stroh's publications](https://webusers.imj-prg.fr/~benoit.stroh/), [Pilloni's publications](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/) and [arXiv:1212.2035's version history](https://arxiv.org/abs/1212.2035). No relevant correction was located. Stroh's listed errata concern other papers. The precursor ends at v2, 28 April 2015, before publication. This is not a claim that no correction exists.

Pins were confirmed: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Read the reviewed A4 audit (not built) and its actual contract, the integrated Conrad node and its accepted partial packet. No reviewed R0/R2 audit entries were present; that is not an absence certificate. Whole-Lean-text searches of both pinned libraries for the specialized subjects found only unrelated Fontaine bibliography matches. Read actual Mathlib `moritaEquivalenceMatrix` and `IsMoritaEquivalent.matrix` (requiring a nonempty matrix index), preserving the existing library item. Read Tau Ceti `kaehlerBasisOfFormallyEtale`: it extends a differential basis along a formally étale ring extension; it does not give the PEL stack deformation theorem. No specialized library-complete claim or new general carrier is added.

## Validation and handoff

The inventory has 43 items, five routes, 19 prerequisite records and 17 source issues. All 34 missing items are routed once; route owner metadata and the original Morita library item are unchanged. All fourteen prior source-issue records compare identically to the input. The planned criterion still exists with status unchecked.

Exact finite checks passed the dual-number derivative and negative-weight canonical branch; 210 valid sign/degree cases, 150 negative sign countercases, 336 strict-contraction cases and 3,584 distinct-tuple coordinate-count cases. A fresh read-only `scripts.build.assemble(require_distances=False)` resolved every planned and route stage. Its 2,956-stage atlas has 8,634 distinct dependency edges and 2,581 incident vertices and is acyclic. This fix proposes no new atlas edges.

A minimal arithmetic reproduction is:

```python
from fractions import Fraction as Q
# For scalar determinant weight, use actual degree before substituting a bound.
n, degree, nu, c = 3, 2, 1, -1
assert n-degree*c == 5 > n-nu*c == 4
assert 5**5 == 3125 > 5**4 == 625
# Small-slope positivity and explicit contraction margin.
v, n, gap = Q(1, 2), Q(3), Q(1, 3)
c = v+n+gap
epsilon = min(Q(1, 2), gap/(2*c))
assert 0 < epsilon < 1
assert n+v-(1-epsilon)*c < 0
```

The models check arithmetic and planning contracts, not geometric quasi-compactness or full deformation, norm or classicality proofs. Required paper, intake, shared source-issue/version and whitespace checks pass. No Lean file is required by the job and no usable existing compiled build at the pins was available, so no Lean compilation ran. The independent fix reviewer should check the three new source issues and the replacement argument; future design work must supply the actual geometric and analytic proofs at the stated owners.
