# RT-PAPER-CALMES-ETAL-26

Red team of the accepted extraction PAPER-CALMES-ETAL-26: Calmès, Dotto, Harpaz, Hebestreit, Land, Moi, Nardin, Nikolaus
and Steimle, *Hermitian K-theory for stable ∞-categories III: Grothendieck–Witt groups of rings*, to appear in Annals of
Mathematics (arXiv 2009.07225v4). Issue #4031.

Red team: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write or review:
- the extraction (`cc-fb70e5`, PR #2208);
- its review, REV-PAPER-CALMES-ETAL-26 (`cc-7b31c4`, PR #2381).

**Result: 69 findings, 8 high, 33 medium and 28 low.**

## Method

**The source.** arXiv 2009.07225v4 (<https://arxiv.org/abs/2009.07225v4>) was re-downloaded on 2026-10-01, with its
LaTeX source. Its SHA-256 is `1e4b6720…f770c`, equal to the extraction's.

**The passes.** All 63 pages were read against the extraction in five parallel passes run by this session:
- the Introduction and the Recollection (pp. 1–11);
- §1, L-theory and algebraic surgery (pp. 11–33);
- §2, L-theory of Dedekind rings (pp. 33–49);
- §3, Grothendieck–Witt groups of Dedekind rings (pp. 49–63);
- the routes and statuses, against `data/atlas.json`, the accepted blueprints, other papers' accepted routes, KEYDEF-
  algebraicnt, `make_queue.py` and the pinned libraries.

**Cited sources.** The passes read Berrick–Karoubi (arXiv math/0509404v1), Berrick–Karoubi–Schlichting–Østvær (arXiv
1011.4977v3) and chapter VI of Weibel's K-book to check cited statements, and the auxiliary files of Papers I and II to
resolve cross-references.

**Merging.** I merged findings reported by more than one pass: the scope of Theorem 2, the GN.6 duplication, routes 2
and 5, the dependency edges, the Example 1.3.11 slip, the missing Tate and homotopy-orbit objects, the layers of item
424, route 7's bundled items, the library pointers and the prerequisites. E4's verdict is folded into the Example 2.3.14
finding.

**What I re-verified myself:**
- Theorems 2 and 7 against Theorem 2.2.4 (p. 38) and Theorem 3.1.7 (p. 51), and the ℤ[i] example;
- GN.6's stage text against route 1's reason and PROTOCOL §16, and K.3's stage text against route 2;
- Example 2.3.14, by hand: the dyadic Arf map W^q(𝔽₂) → W^q(𝔽₄) is zero, so L^q_0(ℤ[ω]) = 0 and L^q_3(ℤ[ω]) ≅ ℤ/4;
- Remark 3.1.12, for R = ℤ: π₋₁ of the fibre is ℤ/2, so π₀ of the mod 2 fibre is ℤ/2;
- that Berrick–Karoubi's Theorem B is the cited source of the 2-local half of Theorem 4 and has no item.

**Severities I changed.** The p^*/p_* swap (now medium: the items are consistent under the extraction's own renaming)
and the missing scheme-level BKSØ theorem (now medium: item 400 records the field case). The full list of what was
checked is in the result's `checked` field.

## The high findings

### /1 — error

**Where.** items PAPER-CALMES-ETAL-26/5 and /10; conventions[1]; sourceIssues (missing entry); PAPER-CALMES-ETAL-26/5
(and the paper's Theorem 2; no sourceIssue recorded)

**Claim.** Items 5 (Theorem 2) and 10 (Theorem 7) state the results for an arbitrary invertible Z-module with involution
M, as the introduction does, but the body proves them only for M a line bundle over R with R-linear involution (i.e.
involution +/-1). For a general M the statements are unproved, and Theorem 7 is not even well formed: for M = R(sigma)
built from a non-trivial ring involution sigma (Example R.2(ii) with epsilon = 1), e.g. R = Z[i], sigma = complex
conjugation, p = (2+i), sigma(p) = (2-i) != p, the right R-action on M/pM is through R/sigma(p), so M/p is not a module
with involution over F_p and Q^s_{M/p} is undefined. The extraction checked 'Theorem 2 against Theorem 3.1.7'
(validation) but missed this, and convention 2 ('for a commutative ring the examples are a line bundle with an
involution of sign epsilon') hides the R(sigma) case. This is a gap in the paper's introduction that sourceIssues does
not record. Also: Theorem 2 (item 5) is stated for an arbitrary invertible Z-module with involution M, but the paper
proves it only for M a line bundle over R with R-linear involution (necessarily +/-1). Hermitian dualities (a
non-trivial ring involution on R, e.g. complex conjugation on Z[i]) are invertible Z-modules with involution in the
sense of Definition R.1 and are not covered: the devissage Theorem 2.2.4 that the proof runs through needs an R-linear
involution. Item 5 copies the over-general statement, so the blueprint target is stronger than anything the paper
proves.

**Evidence.** p. 5, Notation and Conventions: 'We always denote by D = hom_R(-,M) the dualities on Proj(R) and D^p(R)
determined by an invertible Z-module with involution M.' p. 2, Theorem 2: 'Let R be a Dedekind ring whose fraction field
is a number field. Then the canonical map GW^s_cl(R;M) -> K(R;M)^{hC2} is a 2-adic equivalence in non-negative degrees.'
pp. 4-5, Theorem 7: '... induce a fibre sequence of spectra (+)_{p cap T != 0} GW^s(F_p;(M/p)[-1]) -> GW^s(R;M) -> ...'
with no hypothesis on M. Against: Theorem 3.1.7, p. 52: 'for every m in Z and every line bundle M over R with involution
+/-1'; Theorem 2.2.4, p. 38, and Corollary 2.2.5 ('Under the assumptions of Theorem 2.2.4'): 'M a line bundle over R
with R-linear involution'; Section 2.1, p. 34: 'Let now M be a line bundle ... over R with an R-linear involution'. The
extraction's own item 304 notes: 'the hypothesis that M be a LINE BUNDLE with R-linear involution, which is stronger
than being an invertible Z-module with involution'. Example R.2(ii), p. 7, shows R(epsilon) is an invertible Z-module
with involution for any epsilon-involution, so R(sigma) is admissible in the introduction's convention. Also: p. 2: 'Let
D be a duality on the category Proj(R) ... Then D is necessarily of the form DP = hom_R(P,M), where M := DR is an
invertible Z-module with involution (see Definition R.1)'. Theorem 2, p. 2: 'Let R be a Dedekind ring whose fraction
field is a number field. Then the canonical map GW^s_cl(R;M) -> K(R;M)^{hC2} is a 2-adic equivalence in non-negative
degrees.' It has no hypothesis on M. Section 3.1, p. 51: 'Recall that for a Dedekind ring R with line bundle M with
involution +/-1, the canonical map GW^s_cl(R;M) -> GW(R;Q^s_M) is an equivalence in non-negative degrees, by Corollary
1.3.15. Combining this with the following result gives Theorem 2'. Theorem 3.1.7: 'for every m in Z and every line
bundle M over R with involution +/-1'. Theorem 2.2.4, p. 38: 'M a line bundle over R with R-linear involution'. Example
R.2(ii), p. 7: for an eps-involution, M = R with 'r (x) s . x = r x s-bar' is an invertible Z-module with involution.

**Fix.** Add to items 5 and 10 the hypothesis 'M a line bundle over R with R-linear involution (equivalently, since R is
a domain, involution +1 or -1)', citing Theorem 3.1.7 and Corollary 2.2.5. Rewrite convention 2 so that it does not
suggest every M over a commutative ring is a line bundle with sign involution (R(sigma) for a ring involution sigma is
also allowed). Add a new sourceIssue: kind 'gap', locator 'Introduction, Theorems 2 and 7, pp. 2 and 4-5 (arXiv v4)',
printed = the two statements with M general, correction = restrict to line bundles with R-linear involution as in
Theorem 3.1.7 / Corollary 2.2.5, reason = the Z[i] example above and the body hypotheses, affects 'a stated result',
known 'new', searched: arXiv v4 only. Also: Add to item 5 the hypothesis 'M a line bundle over R with R-linear
involution (equivalently, involution +/-1)', and record a sourceIssue (kind gap, affects a stated result): Theorem 2 as
printed omits the hypothesis that Theorem 3.1.7 and Theorem 2.2.4 carry. Make item 5 use item 406 and item 278
(Corollary 1.3.15); see the uses finding below.

### /2 — error

**Where.** PAPER-CALMES-ETAL-26/338 (Example 2.3.14); sourceIssues (new entry needed); routes[part-ii
QuadraticArithmeticAtDyadicPrimes].brief ('the computation for the Eisenstein integers'); sourceIssues
PAPER-CALMES-ETAL-26/E4 (its 'reason' and 'affects'); extraction.md ('nothing downstream moves'); review.json notes
('The five findings are all ... correctly diagnosed')

**Claim.** The paper's quadratic L-groups of the Eisenstein integers R = Z[w] are wrong, and the extraction did not
catch it. The middle vertical map of the comparison diagram is printed as (pr,id): Z (+) Z/2 -> Z/4 (+) Z/2, i.e. it
claims L^q_0(Z^_2) -> L^q_0(R^_2) is the identity of Z/2. It is ZERO: by Proposition 2.3.7 this map is L^q_0(F_2) ->
L^q_0(F_4) on Arf invariants, F_2/P(F_2) -> F_4/P(F_4) with P(x)=x^2+x, and 1 = P(w) lies in P(F_4) (equivalently
x^2+xy+y^2 acquires the isotropic vector (w,1) over F_4). With the correct map (pr,0) the paper's deductions 'A =
coker(theta)' and '0 -> Z/2 -> ker(theta) -> L^q_0(R) -> 0' both fail, and the correct values are L^q_0(R) = 0 (not Z/2)
and L^q_3(R) = L^q_{-1}(R) = A = Z/4 (not Z/4 (+) Z/2). (The symmetric table and L^q_1 = 0, L^q_2 = Z/2 are right.) Item
338's statement repeats the false step: '...identifying A with the cokernel of the comparison map'. Also: E4's own
correction (<1,-2> should be <1,-3>) is right, but its verdict ends 'It affects only this step: the conclusion of the
example, and the L-group table it feeds, are correct.' That is false: the table of quadratic L-groups that Example
2.3.14 ends with is wrong (L^q_0 and L^q_3), for the reason given above. The review endorsed the verdict.

**Evidence.** v4 pp. 46-47, Example 2.3.14: diagram with middle arrow labelled '(pr,id)'; 'and deduce that A ≅ coker(θ)
and that there is an exact sequence 0 → Z/2 → ker(θ) → L^q_0(R) → 0'; '...We deduce that L^q_0(R) ≅ Z/2'; final table
'L^q_n(R) ≅ Z/2, 0, Z/2, Z/4 ⊕ Z/2 for n ≡ 0,1,2,3 (4)'. Recomputation: (1) W(R) = L^s_0(R) = Z/4 generated by <1>
(paper agrees; independently: residues force disc in {±1}, I^2 ∩ W(R) = 0 by Hasse invariants at odd primes + product
formula with one dyadic and no real place). (2) W^q(R^_2) = Z/2, generated by the lift N = x^2+xy+wy^2 of the
anisotropic F_4-form, whose symmetrisation is <2,-2δ> with δ = 1-4w, signed discriminant δ. (3) By the pullback square
(9) and L^s_1(R) ≅ L^s_1(R^_2), L^q_0(R) = {(x,y) ∈ W(R) ⊕ W^q(R^_2) : res x = sym y}; odd-rank x are excluded,
res(2<1>) = <1,1> has signed discriminant -1, and -1, δ, 1 are three distinct square classes of Q_4 (−1 is not a square
mod 4 in Z_2[w]; Q_4(√δ) is unramified, Q_4(√−1) ramified), so L^q_0(R) = 0. (4) Then |A| = |L^s_0(R^_2)|·|L^q_0(R)| /
|W(R) ⊕ W^q(R^_2)| = 32·1/8 = 4 (|W(Q_4)| = 4·|Q_4^×/sq| = 64, ∂ onto W(F_4) = Z/2). (5) A = W(Z_2[w])/(<<1>> + <sym N>)
≅ Z/4: for a unit u with (−1,−u)_{Q_4} = −1 (exists because Q_4(√−1)/Q_4 is ramified), y = <2,2u> has 2y = <2>·<<−1,−u>>
≠ 0 of discriminant 1, hence not in the order-8 subgroup. Machine check (the red team's own scripts, not committed):
brute-force Hilbert symbol on Q_4^×/sq (16 classes) verified symmetric, bimultiplicative, nondegenerate, (a,−a)=1,
trivial on units exactly for {1, δ}; enumerated W(Q_4) (64 classes), W(Z_2[w]) (32), <1> of order 4, <1,1> ∉ {0, sym N},
|A| = 4 with element orders {1,2,4,4}; the same code reproduces the paper's ker θ' = {0,<1,3>,<2,6>,4<1>} ≅ (Z/2)^2 and
coker θ' ≅ Z/4 ⊕ Z/2, and shows sym N ∉ im θ', which is exactly why A ≠ coker θ. Also: E4.reason: 'It affects only this
step: the conclusion of the example, and the L-group table it feeds, are correct.' v4 p. 47 table: 'L^q_n(R) ≅ Z/2 ...
Z/4 ⊕ Z/2 for n ≡ 3 (4)'; correct values L^q_0 = 0, L^q_3 = Z/4 (see above). The Z/4 ⊕ Z/2 that E4 certifies is
ker(·<1,3>) ≅ coker θ' — that is correct (recomputed), but it is not L^q_3(R).

**Fix.** Add a new sourceIssue (kind: error, affects: a stated result, known: new) at Example 2.3.14, pp. 46-47: printed
'(pr,id)', 'A ≅ coker(θ)', 'L^q_0(R) ≅ Z/2', 'L^q_3 ≅ Z/4 ⊕ Z/2'; correction: the middle map is (pr,0) because W^q(F_2)
→ W^q(F_4) is zero; the snake lemma gives 0 → (Z/2)^2 → ker θ → L^q_0(R) → Z/2 → ..., and the correct table is
L^q_n(Z[w]) = 0, 0, Z/2, Z/4 for n ≡ 0,1,2,3 mod 4, with A = coker(θ)/<[sym N]> ≅ Z/4. Per PROTOCOL §18 'Items and nodes
use the corrected statements': rewrite item 338 with the corrected table and without 'identifying A with the cokernel';
in the Part II brief replace 'the computation for the Eisenstein integers' by the corrected values (or flag it as
erroneous in the source). Nothing else in the paper cites Example 2.3.14 (checked by grepping all \ref's), so the damage
is confined to the example. Also: Edit E4.reason to say that the kernel computation is correct but that the example's
final quadratic table is wrong for a separate reason, cross-referencing the new source issue for Example 2.3.14; keep
affects = 'the proof'. Correct the sentence in extraction.md accordingly.

### /3 — error

**Where.** PAPER-CALMES-ETAL-26/411 (Remark 3.1.12); missing sourceIssue

**Claim.** Remark 3.1.12 claims that for a characteristic-0 Dedekind ring R whose dyadic residue fields are perfect, the
map GW^s(R;eps)/2 -> GW^s(R[1/2];eps)/2 is (-1)-truncated. This is false already for R = Z. The fibre is a sum of
GW(k;(Q^s)^{[-1]})/2, which is (K(k;[-1])/2)^{hC2} = (HF_2)^{hC2} and has pi_0 = F_2, not 0. The remark's own argument
('K(k)/2 is 0-truncated') gives only that the fibre is 0-truncated. Item 411 repeats the false claim.

**Evidence.** p. 53, Remark 3.1.12: 'let R be a Dedekind ring of characteristic zero such that all residue fields of
dyadic primes are perfect. Then the map GW^s(R;eps)/2 -> GW^s(R[1/2];eps)/2 is (-1)-truncated. For this, we simply need
to know that for a perfect field k of characteristic 2, K(k)/2 is 0-truncated'. Check with R = Z, whose dyadic residue
field F_2 is perfect. The fibre is F = GW(F_2;(Q^s)^{[-1]}). By the Bott-Genauer sequence (item 113), pi_{-1}F =
coker(hyp: K_0(F_2) = Z -> GW_0(F_2) = Z) = Z/2, because H + <1> = 3<1> over F_2. Also pi_0 F = coker(K_1(F_2) ->
GW_1(F_2)) = 0. Hence pi_0(F/2) contains pi_{-1}F[2] = Z/2. Second check from the groups: GW_0(Z) = Z+Z is torsion-free,
while GW_0(Z[1/2]) = Z+Z+Z/2 by [BK05, Theorem B, i=0], with torsion class <2>-<1> (2(<2>-<1>) = 0 since <2,2> = <1,1>
over Z[1/2]). GW_1 = (Z/2)^3 for both rings. So |pi_1(GW(Z)/2)| = 8 < 16 = |pi_1(GW(Z[1/2])/2)|: the map on pi_1 mod 2
is not surjective. The fibre therefore has pi_0 != 0, under either convention (fibre or cofibre) for truncated maps.

**Fix.** Correct item 411 to '... is 0-truncated, i.e. an isomorphism on pi_n(-/2) for n >= 2 and injective for n = 1',
and keep the 2-local statement for residue fields with K(k)_(2) = Z_(2). Record a sourceIssue (kind error, affects a
stated result, Remark 3.1.12, p. 53) with the Z computation above. State the paper's convention for n-truncated maps
(fibre n-truncated), which Propositions 3.1.11 and 3.1.13 also use.

### /4 — missing

**Where.** items (none); used by PAPER-CALMES-ETAL-26/426, 430, 433, 438

**Claim.** The calculation of Berrick and Karoubi [BK05, Theorem B] of the 2-local Grothendieck-Witt groups of Z[1/2]
has no item. The paper names it as one of the two external inputs of Section 3.2, and it alone supplies the 2-primary
half of every entry of Theorem 3.2.2 (Theorem 4) and Table 1, hence of Theorems 3.2.9 and 3.2.13. It appears only in
item 426's note and in prerequisites, and nothing in the atlas plans it.

**Evidence.** p. 54: 'The other external input is the calculation of Berrick-Karoubi [BK05] of the Grothendieck-Witt
groups of Z[1/2].' p. 56, proof of Theorem 3.2.2: 'One can then compare with [BK05, Theorem B], where the 2-local
GW-groups of Z[1/2] are determined as displayed.' [BK05] arXiv math/0509404v1, Theorem B (p. 5), modulo finite groups of
odd order, i mod 8 = 0..7: 1L_i(Z') = d_{i0}Z+Z+Z/2, (Z/2)^3, (Z/2)^2, Z/8, Z, 0, 0, Z/2^{t+1}; -1L_i(Z') = d_{i0}Z, 0,
Z, Z/16, Z/2, Z/2, Z, Z/2^{t+1}, with 2^t the 2-part of i+1. I checked these against the 2-parts of the paper's table
and they agree in every residue class, using v_2(w_{2n}) = v_2(8n).

**Fix.** Add a cited-theorem item 'Berrick-Karoubi, Theorem B: the 2-local epsilon-symmetric Grothendieck-Witt groups of
Z[1/2]', with the table above and status missing. Route it with item 426, or as a Part II of GN.6, since its proof
(Theorem A, a homotopy-cartesian square of GW(Z'), GW(R), GW(F_3), GW(C), 2-completed) is a substantial development.
Make 426, 430, 433 and 438 use it.

### /5 — other

**Where.** routes[4] (route 5, KTheoryFiniteLocalFields) for PAPER-CALMES-ETAL-26/400, 401, 402, 403, 404, 405, 409;
research/blueprint/papers/PAPER-CALMES-ETAL-26.result.json: route 5 (source, KTheoryFiniteLocalFields:L.1,
KU-finitefields, KU-localp), items /400-/405, /409

**Claim.** Route 5 sends seven hermitian items to K-theory layers whose statements contain no hermitian K-theory: the
homotopy limit problem for fields, for finite fields, the char-2 Proposition 3.1.4 with its multiplicative variant,
perfect fields of characteristic 2, and 2-adic local rings. The review accepted the route on a wrong description ('the
seven items on the K-theory of finite and local fields that the paper's computations consume'). A source route only adds
the paper to the named layers' instructions, so these GW statements, including Proposition 3.1.4 on the critical path to
Theorem 2 (3.1.7) and Theorem 4 (via 3.1.11), get no owner that builds them. Also: Route 5 asks the finite and local
fields K-theory roadmap to plan the hermitian homotopy limit problem, which its layers do not plan. L.1 is Quillen's
computation of K_*(F_q) and nothing else. Some items are not about finite or local fields at all: /400 is every field of
characteristic not 2 with finite vcd_2 (Hu-Kriz-Ormsby, BKSØ), and /405 is every perfect field of characteristic 2.
Their proofs use route 1's Poincaré machinery (/119, /266, /116, /267, /277), which would make KTheoryFiniteLocalFields
depend on the hermitian roadmap. Theorem 2 itself (/5, /406), which consumes them, is routed to GN.6. KU-finitefields
and KU-localp are readiness checkpoints, not proof layers. The roadmap's blueprint job, BP-KTheoryFiniteLocalFields, was
released on issue #763 before this extraction, and the current packet does not mention this paper.

**Evidence.** Atlas KTheoryFiniteLocalFields:L.1: 'Prove, for every finite field with q elements and every j>=1,
K_0(F_q)=Z, K_{2j}(F_q)=0, K_{2j-1}(F_q)=Z/(q^j-1)' ... no Grothendieck-Witt, duality or homotopy-fixed-point content.
Item 403 statement: 'the map of spectra GW(F_q;(Q^s)[m]) -> K(F_q;(Q^s)[m])^{hC_2} is an equivalence for every integer
m'. Review, route 5: 'Source of KTheoryFiniteLocalFields L.1 and its two checkpoints for the seven items on the K-theory
of finite and local fields that the paper's computations consume.' Also:
content/campaign/KTheoryFiniteLocalFields/README.md:16-29 (L.1): 'Prove, for every finite field with q elements and
every j≥1, K_0(F_q)=Z, K_{2j}(F_q)=0, K_{2j-1}(F_q) ≅ Z/(q^j−1)'. There is no form, GW or homotopy fixed point.
KU-finitefields: 'This is an aggregation of those owners, not a new proof construction.' Item /400: 'Let k be a field of
characteristic different from 2 such that ... vcd_2(k) is finite ... GW^s(k;epsilon) -> K(k;epsilon)^{hC_2} is an
equivalence after 2-completion'. Item /405: 'Let k be a perfect field of characteristic 2'.
research/blueprint/queue.json BP-KTheoryFiniteLocalFields: 'released on GitHub issue #763'.
research/blueprint/packets/KTheoryFiniteLocalFields.json contains no 'CALMES' or '2009.07225'.

**Fix.** Move items 400-405 and 409 to the route that owns 406-413 (route 8, GN.6). Alternatively, for 403-405, which
are proved with the Tate square and L-theory of F_q, move them to the new roadmap of route 1. Keep
KTheoryFiniteLocalFields:L.1 only as the planned owner of a new item for Quillen's computation (next finding). Also:
Move /400-/405 and /409 to route 8 (GN.6, beside Theorem 2), or into route 1's Part II if the first finding is applied.
Import KTheoryFiniteLocalFields:L.1 (K-theory of finite and local fields) for Quillen's K_*(F_q) and Adams operations,
and KTheoryFiniteLocalFields:L.6 for local fields. Delete route 5, or keep it only for an item the L-layers actually
plan.

### /6 — duplicate

**Where.** research/blueprint/papers/PAPER-CALMES-ETAL-26.result.json: route 1 (new,
HermitianKTheoryOfPoincareCategories), its reason and brief; research/blueprint/papers/PAPER-CALMES-ETAL-26.md, 'Why a
new roadmap and not more stages on GN.6'; PAPER-CALMES-ETAL-26.review.json route 1

**Claim.** Route 1 is not 'new' in the sense of PROTOCOL section 16 ('new: nothing in the atlas goes in its direction').
GeometryOfNumbersAndQuadraticArithmetic:GN.6 is titled 'Hermitian K-theory and Grothendieck-Witt groups' and already
plans the theory the new roadmap generalises: exact categories with duality, classical GW and Witt groups, higher
hermitian K-theory, localisation and Karoubi periodicity, sourced from Schlichting's papers. It plans them only with 2
invertible ('retain invertibility-of-two ... restrictions'). The paper describes its own contribution in exactly those
terms: the 2-invertible theory is Karoubi's and Schlichting's, and Papers II and III extend it to rings in which 2 is
not a unit. That is the case section 15 assigns to a Part II: 'When a proposed roadmap needs more than an existing
roadmap covers in the same direction ... the additions form a roadmap that extends the existing one, titled "<existing
roadmap>, Part II: ...", with the existing roadmap as its first prerequisite.' The route's reason says GN.6 'is about
Grothendieck-Witt groups of rings as an outcome, not about' a theory. That misreads the stage, which tells the builder
to construct the categorical theory. The review accepted the route on the same misreading. The brief does not mention
GN.6 at all, so the design job will not build on it.

**Evidence.** content/campaign/GeometryOfNumbersAndQuadraticArithmetic/README.md:87-98 (GN.6): 'Construct exact
categories with duality, symmetric/alternating forms, Grothendieck-Witt and Witt groups, higher hermitian K spaces,
localization and source-scoped periodicity. Reuse stable/exact K-theory and prove comparison/forgetful/hyperbolic maps;
retain invertibility-of-two and regularity restrictions.' Its source route names 'Schlichting Hermitian K-theory of
exact categories, and arXiv:1209.0848 for derived/Karoubi variants'. arXiv:1209.0848 is the paper's own [Sch17] (v4.txt
bibliography: 'Hermitian K-theory, derived equivalences and Karoubi's fundamental theorem, JPAA 221 (2017)').
data/library-coverage.json GN.6 lists 'Higher hermitian K-theory spaces/spectra, localization and periodicity' and
'Forgetful, hyperbolic and comparison maps between K-theory and Grothendieck-Witt theory' among its targets. Paper, p.
1: 'Many structural and computational features of the higher Grothendieck-Witt groups of rings R in which 2 is a unit
are well understood, prevalently due to extensive work of Karoubi ... and Schlichting [Sch10a, Sch10b, Sch17, Sch21].
Previously, in Paper [II] we have used the categorical framework of Poincaré ∞-categories to establish some fundamental
properties of the higher Grothendieck-Witt groups of rings in which 2 is not necessarily a unit'. Paper, p. 3: when 2 is
a unit 'the sequence of Theorem 1 is due to Schlichting [Sch17, §7]'. Remark R.9: 'If 2 ∈ R is a unit, Theorem R.8 is
due to Karoubi [Kar80]'. Already accepted: PAPER-FENG-GALATIUS-VENKATESH-22 route 3 puts this paper's fibre sequence,
for R = Z, at GN.6. research/blueprint/make_queue.py paper_designs() merges every part-ii proposal with the same parent
into one DESIGN-<parent>PartII job.

**Fix.** Change route 1 to route 'part-ii' with parent GeometryOfNumbersAndQuadraticArithmetic and title 'Geometry of
numbers, quadratic forms and homogeneous arithmetic, Part II: hermitian K-theory of Poincaré ∞-categories and the
flavours of L-theory'. Open the brief with: 'Starts where GeometryOfNumbersAndQuadraticArithmetic:GN.6 (Hermitian
K-theory and Grothendieck-Witt groups) stops. GN.6 builds exact categories with duality, classical GW/W, higher
hermitian K, localisation and Karoubi periodicity with 2 invertible (Schlichting [Sch10a], [Sch17]). This Part II
removes that restriction through Poincaré ∞-categories, and proves its GW spectra agree with GN.6's when 2 is a unit
(Appendix [II].B).' Merge route 3 into this route as its arithmetic layers, because make_queue.py merges them into the
same DESIGN-GeometryOfNumbersAndQuadraticArithmeticPartII job anyway. Rewrite the report's routing section and the
review's route 1 reason to match.

### /7 — duplicate

**Where.** research/blueprint/papers/PAPER-CALMES-ETAL-26.result.json: items /1, /2, /3, /12, /111 (route 1), and the
Witt-group definitions in /223 and /269 (route 1); items PAPER-CALMES-ETAL-26/1 and /2 (status, route 'new'); items
PAPER-CALMES-ETAL-26/3, /12, /115 (route 'new'); prerequisites (Schlichting entry)

**Claim.** Route 1 routes as 'missing' five items that GN.6 already owns, and accepted routes of another paper place the
same mathematics at GN.6. /1 is the duality on Proj(R) and the groupoid Unimod(R;M). /2 is the classical
GW^s_cl/GW^q_cl/GW^ev_cl spectra as group completions. /3 is Karoubi's splitting after inverting 2. /12 is the forgetful
map GW^s_cl → K^{hC2}, which states Thomason's problem. /111 is GW^{[2]} and symplectic forms. /223 and /269 define the
Witt group of an exact or abelian category with duality, W(Proj(R);Q) and W(C^♥,Q^gs), which is GN.6's
'Grothendieck-Witt and Witt groups' of an exact category with duality. The design job for route 1 would plan all of this
a second time. Also: Items 1 and 2 (dualities on Proj(R), the groupoid Unimod(R;M) of unimodular symmetric forms, and
the classical Grothendieck-Witt space GW^s_cl(R;M) as its group completion) are marked missing and routed to the new
roadmap HermitianKTheoryOfPoincareCategories, but the atlas already plans exactly this: GN.6 constructs exact categories
with duality, symmetric forms, Grothendieck-Witt groups and higher hermitian K spaces, and StableHomotopyKTheory:H.4
constructs the group completion of a symmetric monoidal groupoid. Proj(R) with D = hom_R(-,M) is a (split) exact
category with duality and Unimod(R;M) is its groupoid of symmetric spaces. Routing them to the new roadmap plans the
classical hermitian K-space twice (PROTOCOL section 15), and contradicts the extraction's own reasoning that GN.6 is the
home of the classical Grothendieck-Witt 'outcomes' while the new roadmap is the Poincare machine. The extraction also
cites no library declaration anywhere (no 'mathlib:' or 'tauceti:' entry in the file), although the commutative/field
special cases are in the libraries. Also: Three classical, 2-inverted or classical-GW statements are routed to the new
Poincare-category roadmap although they lie in GN.6's direction and the extraction routes their siblings to GN.6: item 3
(Karoubi's splitting of GW^s_cl[1/2]), item 12 (Thomason's homotopy limit problem, whose solution item 5 and Theorem
3.1.7 item 406 are routed to GN.6), and the first half of item 115 (R.9: when 2 is a unit, Theorem R.8 is Karoubi's
fundamental theorem), which GN.6 plans as 'source-scoped periodicity' from Schlichting's derived paper. In the same
vein, the prerequisites list Schlichting's JPAA 2017 paper [Sch17] as not covered by the atlas, but GN.6 already names
it as its source (arXiv:1209.0848, 'Hermitian K-theory, derived equivalences and Karoubi's fundamental theorem').

**Evidence.** GN.6 stage text as quoted in RT-PAPER-CALMES-ETAL-26/6. PAPER-FENG-GALATIUS-VENKATESH-22.result.json item
/8, 'Symplectic K-theory of Z: SP(Z) is the symmetric monoidal groupoid of free Z-modules with a perfect skew-symmetric
pairing ... KSp(Z) := K(SP(Z))', has status 'planned' and planned ['GeometryOfNumbersAndQuadraticArithmetic:GN.6']; this
is /2 and /111 for R = Z, M = Z(-1). FGV item /25, 'Karoubi's splitting of symplectic K-theory after inverting 2 ...
fibre sequence K(Z)_{hC_2} → KSp(Z) → τ_{≥0}L^{−s}(Z)', is on FGV route 3 (source, GN.6), which FGV's review accepted;
this is /3, and /4 for R = Z. research/blueprint/keydefs/KEYDEF-algebraicnt.json entry
'algebraicnt/classical-grothendieck-witt' has owners ['GeometryOfNumbersAndQuadraticArithmetic:GN.6'] and lists items
PAPER-CALMES-ETAL-26/2 and /111. That keydef's review is still needs_changes, so it corroborates rather than settles.
data/library-coverage.json GN.6 target: 'Grothendieck-Witt and Witt groups (degree zero), recovering classical forms'.
Packet research/blueprint/packets/GeometryOfNumbersAndQuadraticArithmetic.json, GN.6 coverage: 'GN.6 requires an exact
category with duality, coherent double dual, forms/isometries, exact-category GW/W, hyperbolic/forgetful maps and higher
hermitian K.' Also: data/atlas.json, GeometryOfNumbersAndQuadraticArithmetic:GN.6
(content/campaign/GeometryOfNumbersAndQuadraticArithmetic/README.md lines 87-98): 'Construct exact categories with
duality, symmetric/alternating forms, Grothendieck-Witt and Witt groups, higher hermitian K spaces, localization and
source-scoped periodicity. Reuse stable/exact K-theory and prove comparison/forgetful/hyperbolic maps'.
StableHomotopyKTheory:H.4: 'Construct the group completion of a symmetric monoidal groupoid, using a Segal Gamma-space
... Its pi_0 is the ordinary Grothendieck group of the monoid of components.' Item 2 statement: 'GW^s_cl(R;M) =
(Unimod(R;M),(+))^gp, a group-like E_infinity-space viewed equivalently as a connective spectrum'. Libraries at the pins
(declarations.tsv, mathlib 082e2d3, TauCeti f790474): mathlib LinearMap.BilinForm.IsSymm, LinearMap.IsPerfPair,
QuadraticMap.IsometryEquiv, Algebra.GrothendieckGroup (Mathlib/GroupTheory/MonoidLocalization/GrothendieckGroup.lean);
tauceti TauCeti.RegularFormClass (TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Basic.lean:150, a commutative
semiring by .../Semiring.lean), and Tau Ceti QuadraticFormInvariants Layer 4 plans `wittGrothendieckRing` = Grothendieck
group of (RegularFormClass K, perp), i.e. GW_0 of a field of characteristic not 2. Also: Introduction p. 2: 'After
inverting 2, ... by work of Karoubi, there is a natural splitting GW^s_cl,*(R;M)[1/2] = (K_*(R;M)[1/2])^{C2} (+)
(W_*(R;M)[1/2])'; 'The question whether this map is a 2-adic equivalence in positive degrees is known as Thomason's
homotopy limit problem'. Remark R.9, p. 10: 'If 2 in R is a unit, Theorem R.8 is due to Karoubi [Kar80].' GN.6 Source
route: 'Schlichting Hermitian K-theory of exact categories, and arXiv:1209.0848 for derived/Karoubi variants. State
exact duality and invertibility-of-two hypotheses.' Routes: items 3, 12 in route 'new'; items 5, 13, 406 in the GN.6
source route.

**Fix.** Set /2 to status 'planned' with planned ['GeometryOfNumbersAndQuadraticArithmetic:GN.6'], as FGV/8 is. Move /1,
/3, /12 and /111 to route 8 (source of GN.6). In /223 and /269, note that the Witt group of an exact category with
duality is imported from GN.6, and that only the identification with L^{0,0}_0 is new. In the brief of route 1, or of
its Part II replacement, say: 'import, never re-plan, GN.6's forms groupoid, classical GW/W, KSp(Z), forgetful and
hyperbolic maps, and Karoubi's splitting with 2 inverted'. Also: Split item 2 into (a) GW^s_cl(R;M) and its homotopy
groups: status planned, planned ['GeometryOfNumbersAndQuadraticArithmetic:GN.6','StableHomotopyKTheory:H.4'], and (b)
GW^q_cl(R;M) and GW^ev_cl(R;M) for quadratic and even forms over rings in which 2 need not be a unit (outside GN.6's
'symmetric/alternating forms'): missing, routed to GN.6 as a source route or kept in route 1. Make item 1 planned [GN.6]
for the form groupoid, keeping the unproved claim 'every duality on Proj(R) is hom_R(-,M)' as its own missing item.
Remove the planned parts from route 1's items, have route 1's brief import GN.6 for classical Grothendieck-Witt spaces,
and add to the notes the library reuse: for commutative R and M = R the forms are LinearMap.BilinForm.IsSymm +
LinearMap.IsPerfPair with QuadraticMap.IsometryEquiv, pi_0 is Algebra.GrothendieckGroup of the isometry-class monoid,
and for fields of characteristic not 2 that monoid is TauCeti.RegularFormClass with GW_0 planned as
QuadraticFormInvariants Layer 4's wittGrothendieckRing. Also: Move items 3 and 12 to the GN.6 source route (route 8).
Split item 115: the 2-invertible case (Karoubi's fundamental theorem) as an item planned by / routed to GN.6; the
2-torsion-free case without 2 invertible stays in route 1. In prerequisites, mark [Sch17] as already a GN.6 source (or
drop it) and keep only [Sch19]/[Sch24].

### /8 — error

**Where.** research/blueprint/papers/PAPER-CALMES-ETAL-26.result.json: route 2 (source,
GeneralAlgebraicKTheory:KU-fundamental, K.3), items /10, /300-/316; PAPER-CALMES-ETAL-26.review.json route 2; routes[1]
(route 2, source → GeneralAlgebraicKTheory:KU-fundamental, K.3) for items 300–316 (and 10); also routes[3] (route 4 →
ArithmeticKTheory) for 339–341

**Claim.** Route 2 sends 18 hermitian items to GeneralAlgebraicKTheory:K.3, a layer that plans no hermitian content. The
items are the localisation-dévissage sequence for GW and L, Poincaré-Verdier sequences, Poincaré functors, L-theoretic
dévissage through the heart of a t-structure, and second residue maps on Witt groups. Three things are wrong. (a) Wrong
owner. K.3 plans Quillen's additivity, resolution, dévissage and localisation for exact and abelian categories, with no
duality. The atlas owner of hermitian localisation is GN.6 ('higher hermitian K spaces, localization'); the
Poincaré-categorical form with 2 not inverted is route 1's machinery. (b) Cycle. Twelve 'uses' of these items point into
route 1, to eleven items (/105, /109, /113, /271, /9, /260, /102, /269, /214, /231, /267), while route 1's brief imports
'GeneralAlgebraicKTheory for K-theory of exact categories and its localisation theorems', which is K.3. So K.3 and the
new roadmap would each import the other. (c) Orphaned. The blueprint covering K.3 was accepted before the route could
reach it, so nothing in the atlas will plan these 18 items. RT-PAPER-LAND-MATHEW-MEIER-ETAL-24/1 found the same failure
and it was confirmed. The review's route 2 reason describes the items as 'K-theory of stable ∞-categories,
group-completion and the fundamental theorem', which is not what they are, so the route was not checked against its
items. Coordinator note: the published blueprint (data/blueprints/GeneralAlgebraicKTheory--K.1.json) is the version
accepted on 2026-09-28; the packet in research/blueprint/packets has since been reopened by a red-team fix and its
current review is needs_changes (2026-09-30). Neither version plans hermitian content. Also: Route 2 sends the whole
hermitian localisation–dévissage theory of §§2.1–2.2 — Poincaré–Verdier sequences (304), the symmetric Poincaré
structure on the torsion category (305), the lattice description of the L-theoretic boundary (306), Poincaré refinements
of restriction of scalars (307–309), dévissage for GW and L (310), Theorem 7 (311), the residue map on Witt groups (315,
316) — as a 'source' to GeneralAlgebraicKTheory K.3/KU-fundamental. A source route means the items 'belong inside
existing layers' (PROTOCOL §16), but those layers plan K-theory of exact categories only and contain no duality, form,
Witt, Grothendieck–Witt, Poincaré or L-theoretic content at all; the items depend on route 1's new roadmap (e.g. 304
uses 105 and 113, 310 uses 271). The review accepted route 2 on a description ('eighteen items on K-theory of stable
∞-categories, group-completion and the fundamental theorem') that matches none of these items. Route 4 does the same
with 339–341 (finite generation of L- and GW-groups) into ArithmeticKTheory's K-group finiteness layers, which plan no
hermitian content.

**Evidence.** content/campaign/GeneralAlgebraicKTheory/README.md:36-43 (K.3): 'Prove additivity for the exact category
of conflations ... Prove dévissage for an appropriate full abelian subcategory ... Prove Quillen localisation for a
Serre subcategory of a small abelian category'. There is no duality, form or Witt group. KU-fundamental reads: 'This is
an aggregation of those owners, not a new proof construction.' data/blueprints/GeneralAlgebraicKTheory--K.1.json has
review accepted on 2026-09-28 and coverage 'GeneralAlgebraicKTheory:K.3': 'source_decomposed'; it does not contain
'CALMES', 'Poincar', 'Grothendieck-Witt' or 'ermitian'. Its job, BP-GeneralAlgebraicKTheory--K.1, was released on issue
#737, before this extraction (#1055). The verifier of RT-PAPER-LAND-MATHEW-MEIER-ETAL-24/1 confirmed that 'make_queue.py
adds a source route's paper only to blueprint prompts generated later'. Paper, Remark 2.2.7: 'Hornbostel and Schlichting
prove a dévissage statement and obtain a localisation sequence of the type of Corollary 2.2.5 under the assumption that
2 is a unit'. That is the GN.6 (Schlichting) case. Also: atlas data/atlas.json: GeneralAlgebraicKTheory roadmap text and
all its stages contain 0 occurrences of 'hermitian', 'Witt', 'duality', 'Poincar', 'L-theory' (searched); K.3 text:
'Prove additivity ... Prove dévissage for an appropriate full abelian subcategory ... Prove Quillen localisation for a
Serre subcategory'. ArithmeticKTheory:N.3:finite-generation: 'Prove finite generation of K_n(O_{F,S})' (0 hermitian
mentions). By contrast GeometryOfNumbersAndQuadraticArithmetic:GN.6 plans 'exact categories with duality ...
Grothendieck-Witt and Witt groups, higher hermitian K spaces, localization' with 'invertibility-of-two' restrictions.
review.json route 2 reason quoted above.

**Fix.** Delete route 2. Move /10 and /300-/305, /307-/314 (localisation, Poincaré-Verdier sequence, Poincaré functors
along residue maps, dévissage) into route 1, or its Part II replacement, as a localisation-dévissage layer. That layer
imports GeneralAlgebraicKTheory:K.3 (Quillen localisation and dévissage) and
GeneralAlgebraicKTheoryPartIITelescopicLocalization (theorem of the heart, Antieau-Gepner-Heller dévissage) for the
K-theoretic halves, and cites GN.6's 2-invertible localisation (Hornbostel-Schlichting) as the special case. Put /306,
/315 and /316 (lattice description of the boundary, second residue map) in the same layer, importing Witt groups from
GN.2 and GN.6. Correct the review's route 2 reason and the report's routing table. Also: Re-route items 300–316 (and 10)
to route 1 (HermitianKTheoryOfPoincareCategories), adding Theorem 2.2.4 and Corollary 2.2.5 to its brief's final
theorems, or to a Part II of GN.6 ('localisation and dévissage without 2 invertible'); route 339–341 likewise to
GN.6/route 8. Keep GeneralAlgebraicKTheory:K.3 only as an import, via a planned item for Quillen's K-theoretic
dévissage–localisation sequence (next finding).

## All findings

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | error | items PAPER-CALMES-ETAL-26/5 and /10; … | Items 5 (Theorem 2) and 10 (Theorem 7) state the results for an arbitrary invertible Z-module with involution M, as the introduction does, but the body proves … |
| /2 | high | error | PAPER-CALMES-ETAL-26/338 (Example 2.3.14); … | The paper's quadratic L-groups of the Eisenstein integers R = Z[w] are wrong, and the extraction did not catch it. The middle vertical map of the comparison … |
| /3 | high | error | PAPER-CALMES-ETAL-26/411 (Remark 3.1.12); … | Remark 3.1.12 claims that for a characteristic-0 Dedekind ring R whose dyadic residue fields are perfect, the map GW^s(R;eps)/2 -> GW^s(R[1/2];eps)/2 is … |
| /4 | high | missing | items (none); … | The calculation of Berrick and Karoubi [BK05, Theorem B] of the 2-local Grothendieck-Witt groups of Z[1/2] has no item. The paper names it as one of the two … |
| /5 | high | other | routes[4] (route 5, KTheoryFiniteLocalFields) for …; … | Route 5 sends seven hermitian items to K-theory layers whose statements contain no hermitian K-theory: the homotopy limit problem for fields, for finite … |
| /6 | high | duplicate | research/blueprint/papers/PAPER-CALMES-ETAL-26.result.json: route 1 …; … | Route 1 is not 'new' in the sense of PROTOCOL section 16 ('new: nothing in the atlas goes in its direction'). GeometryOfNumbersAndQuadraticArithmetic:GN.6 is … |
| /7 | high | duplicate | research/blueprint/papers/PAPER-CALMES-ETAL-26.result.json: items /1, …; … | Route 1 routes as 'missing' five items that GN.6 already owns, and accepted routes of another paper place the same mathematics at GN.6. /1 is the duality on … |
| /8 | high | error | research/blueprint/papers/PAPER-CALMES-ETAL-26.result.json: route 2 …; … | Route 2 sends 18 hermitian items to GeneralAlgebraicKTheory:K.3, a layer that plans no hermitian content. The items are the localisation-dévissage sequence for … |
| /9 | medium | error | conventions[2]; … | The conventions field reverses the limits of the interpolating family: it says Q^{>=m} tends to Q^q as m -> -infinity and to Q^s as m -> +infinity. The paper … |
| /10 | medium | missing | Recollection p. 7 (no item); … | The constructions that Definition R.3 is built from have no items: (a) homotopy orbits, homotopy fixed points and the Tate construction X^{tC2} = cofib(N: … |
| /11 | medium | missing | Introduction pp. 2-3 (no item); … | The K-theory spectrum with C2-action, K(C,Q) for a Poincare infinity-category and K(R;M) for a ring, has no item, although Theorems 1 and 2, the homotopy-limit … |
| /12 | medium | missing | Recollection pp. 6 and 10 (no item); … | The notions of Paper II on which every structural statement of the Recollection rests have no definition items: Poincare-Verdier sequence, Verdier-localising … |
| /13 | medium | missing | Introduction p. 4 (no item) | The introduction states a quadratic version of Theorem 1, the fibre sequence K(R;M)_{hC2} --hyp--> GW^q_cl(R;M) -> tau_{>=0}(Sigma^4 L^gs(R;M)), obtained from … |
| /14 | medium | error | PAPER-CALMES-ETAL-26/274 (Example 1.3.11); … | Example 1.3.11 prints that L^gs(F_2) = 0, meaning the whole spectrum. That is false: L^gs_0(F_2) is the symmetric Witt group W(F_2), which is Z/2. What the … |
| /15 | medium | error | PAPER-CALMES-ETAL-26/273 (Corollary 1.3.10), field 'uses' and note; … | The proof of Corollary 1.3.10 cites Theorem 1 for the claim that the squares GW^gq → GW^gs → GW^s over L^gq → L^gs → L^s are pullbacks. Theorem 1 cannot give … |
| /16 | medium | error | PAPER-CALMES-ETAL-26/4, /8, /9, /6, /244 (field 'uses'); … | The dependency edges of the introduction's §1 theorems are wrong or reversed. Item 8 (Theorem 5) uses /4 (Theorem 1), but the paper derives Theorem 1 from … |
| /17 | medium | missing | PAPER-CALMES-ETAL-26/244 (Theorem 1.2.22) and /242 | No item records the comparison L^{short,ev}_n(R;M) ≅ L^{n,n+1}_n(R;Q^ge_M) ≅ L^ge_n(R;M) for n >= 0. It is proved inside the proof of Theorem 1.2.22, and it is … |
| /18 | medium | error | PAPER-CALMES-ETAL-26/216 (Construction 1.1.15) | Item 216 garbles Construction 1.1.15 and drops the definitions that later statements depend on. It says 'in particular if W = 0 then (X',q') is obtained … |
| /19 | medium | error | PAPER-CALMES-ETAL-26/242 (Remark 1.2.20(ii)) | The Wu class that defines Ranicki's even complexes is recorded with the wrong source: item 242 has 'v_0(phi) : H_n(C) -> Hhat^0(C_2;M)', but the paper has … |
| /20 | medium | missing | Section 1.2, 'Surgery for connective ring spectra', p. 26 (no item); … | No item defines the Poincaré structures over a connective ring spectrum that Corollary 1.2.33 and Example 1.2.35 are about. These are Q^q_M and Q^s_M on … |
| /21 | medium | missing | PAPER-CALMES-ETAL-26/281 (Example 1.3.18) | Item 281 stops at 'L^u_n(S) → L^b_n(Z) is an isomorphism for n <= 0 and a surjection for n = 1'. It omits the example's final result: L^q_1(Z) → L^b_1(Z) is … |
| /22 | medium | error | PAPER-CALMES-ETAL-26/280 (Remark 1.3.17) | The hypothesis 'over a 1-dimensional ring R' is not what the argument needs, and the item copies it. Both conclusions come from Corollary 1.3.9 (with d = 1, r … |
| /23 | medium | error | PAPER-CALMES-ETAL-26/307, /308, /309, /310, /311 (statements) | These items swap the paper's f^* and f_*. In the paper f^*: D(B) → D(A) is restriction of scalars and f_*: D(A) → D(B) its RIGHT adjoint (coinduction, p_*X = … |
| /24 | medium | missing | items (none) — inputs of Theorem 2.2.4 / Corollary 2.2.5; … | The three external theorems that the dévissage Theorem 2.2.4 is built from have no items, and two are not in prerequisites: (i) Quebbemann–Scharlau–Schulte … |
| /25 | medium | missing | items (none) — classical Witt-group inputs of §2.3; … | The classical quadratic-form theorems that §2.3 rests on have no items: (a) Milnor–Husemoller's second-residue exact sequence 0 → W(R) → W(K) → ⊕_p W(F_p) → … |
| /26 | medium | error | prerequisites (Wall entry); … | The prerequisite entry cites the wrong Wall paper and omits the one Proposition 2.3.7 is attributed to. The extraction lists 'C. T. C. Wall, On the axiomatic … |
| /27 | medium | library-claim | PAPER-CALMES-ETAL-26/301 (status missing); … | R_S, as the paper defines it ('the subring of K given by all x with ν_p(x) ≥ 0 for all p not in S', S an arbitrary, possibly infinite, set of non-zero primes), … |
| /28 | medium | error | PAPER-CALMES-ETAL-26/306 (statement) | The statement of Proposition 2.1.5 omits the formula that is its whole content. It says the boundary map 'sends the class of (V,b) to the class of (T,c)' and … |
| /29 | medium | error | PAPER-CALMES-ETAL-26/337 (statement); … | Item 337 ('The quadratic L-groups of the integers') stops at '/L^s_0(Z^_2)/ = 16' and never states the example's results: L^q_{-1}(Z) = 0; L^s_0(Z^_2) ≅ Z/2 ⊕ … |
| /30 | medium | missing | items (none); … | The scheme-level homotopy fixed point theorem [BKSO15, Theorem 2.2] has no item. It is the right-hand vertical map in the proof of Theorem 3.1.7 (Theorem 2), … |
| /31 | medium | error | PAPER-CALMES-ETAL-26/435 (Lemma 3.2.11 ii); … | The proof that pi_2 K(Z;Q^s_-)_{hC2} = 0 has a gap, and item 435 copies it. The paper shows only that K(Z) -> ko is an isomorphism on pi_i for i <= 2, then … |
| /32 | medium | missing | items (none); … | Quillen's computation of the K-theory of finite fields has no item, as a cited result with status. It is the engine of Proposition 3.1.4: K_*(F_q) is odd … |
| /33 | medium | missing | items (none); … | Lemma 3.2.11 (and so Theorem 3.2.13 ii-iv) needs facts about real topological K-theory that are neither items nor planned anywhere in the atlas: pi_0..pi_3 of … |
| /34 | medium | library-claim | PAPER-CALMES-ETAL-26/424, PAPER-CALMES-ETAL-26/425 (planned); … | Item 424 is 'planned' at ArithmeticKTheory:N.5, N.6, N.7. N.5 does plan the odd groups (K_{8k+3}(Z) = Z/2w, K_{8k+7}(Z) = Z/w). No cited layer plans the … |
| /35 | medium | error | research/blueprint/papers/PAPER-CALMES-ETAL-26.result.json: route 1 …; … | The import clause of route 1's brief is wrong in four ways. (1) 'HigherCategories material for stable ∞-categories and t-structures' names no roadmap: there is … |
| /36 | medium | error | research/blueprint/papers/PAPER-CALMES-ETAL-26.result.json: route 1 … | The brief's final theorems do not state the paper's final theorems for this route, as section 16 requires ('states the final theorems exactly as the paper … |
| /37 | medium | error | research/blueprint/papers/PAPER-CALMES-ETAL-26.result.json: route 3 …; … | The route's justification misstates GN.2. GN.2 is not limited to 'the classical ones, available once 2 is invertible': its acceptance clause and its … |
| /38 | medium | duplicate | research/blueprint/papers/PAPER-CALMES-ETAL-26.result.json: route 3 …; … | Both briefs tell their design jobs to cover field-level Witt theory that Tau Ceti roadmaps and an accepted Part II already own. Section 15 says Tau Ceti … |
| /39 | medium | library-claim | research/blueprint/papers/PAPER-CALMES-ETAL-26.result.json: route 3 … | Route 3's brief imports Picard groups and finiteness of class numbers from ArithmeticKTheory, which owns neither. Both are already in Mathlib at the pin. The … |
| /40 | medium | error | research/blueprint/papers/PAPER-CALMES-ETAL-26.result.json: route 7 …; … | H.4 plans the group-completion theorem for symmetric monoidal groupoids and its application to projective modules. None of route 7's six items is about that. … |
| /41 | medium | error | research/blueprint/papers/PAPER-CALMES-ETAL-26.result.json: route 4 … | N.3:finite-generation plans finite generation of K_n(O_{F,S}) only. Of the routed items, /339 (finite generation of symmetric and quadratic L-groups of number … |
| /42 | low | error | item PAPER-CALMES-ETAL-26/104 | Item 104 extracts only parts (i) and (ii) of Example R.2. It omits (iii), the sign twist -M (same R(x)R-module, involution negated, with -R = R(-1)), which … |
| /43 | low | error | item PAPER-CALMES-ETAL-26/107 | Item 107 says 'Among the Q^{>=m}_M, EXACTLY Q^{>=2}_M, Q^{>=1}_M and Q^{>=0}_M send a finitely generated projective R-module P ... to an abelian group.' That … |
| /44 | low | error | item PAPER-CALMES-ETAL-26/118 | Item 118 does not state Notation R.12. It gives only 'superscripts q, gq, ge, gs and s, and the abbreviation GW(R;Q) for GW(D^p(R),Q)'; the latter is from p. … |
| /45 | low | error | item PAPER-CALMES-ETAL-26/111 (locator) | Remark R.7 is on p. 9, not p. 10. Page 10 begins in the middle of the Bott-Genauer paragraph that follows R.7. |
| /46 | low | error | conventions[5] | Convention 6 says L-groups are 'indexed so that L^s_n(R;M) is 4-periodic in n and L^s_0 is the Witt group'. For general rings it is the genuine symmetric … |
| /47 | low | other | sourceIssues (missing entry): Example R.2(ii), p. 7 | The epsilon-involution convention in Example R.2(ii) is inconsistent for non-central epsilon. With the paper's requirements (bar bar r = eps r eps^{-1}, bar … |
| /48 | low | other | sourceIssues (missing entry): Remark R.7, p. 9; … | Remark R.7 identifies Hhat^0(C2; Hom(P(x)P, R(-1))) with hom_R(P, R_2), 'R_2 the 2-torsion in R', and says a skew-symmetric b goes to x -> b(x,x). That map is … |
| /49 | low | other | sourceIssues (missing entry): Recollection p. 7 | Two cross-references are missing in the printed text, leaving ungrammatical sentences: 'an invertible Z-module with involution in the sense of gives rise to an … |
| /50 | low | missing | prerequisites; … | The prerequisites omit works that items in this share quote and that the atlas does not cover: Karoubi, 'Le théorème fondamental de la K-théorie hermitienne' … |
| /51 | low | other | PAPER-CALMES-ETAL-26/266 (Corollary 1.3.4(ii)), note | For Q = Q^{>=m}_M, which is (2-m)-symmetric, the isomorphism L_{2k}(R;Q) ≅ W(Proj(R);Ω^{2k}Q(Ω^k-)) holds only for k >= 1-r = m-1. The clause 'quadratic forms … |
| /52 | low | duplicate | PAPER-CALMES-ETAL-26/8 vs /244; … | Theorem 5 appears as two missing items routed to the same roadmap: item 8 (intro) and item 244 (Theorem 1.2.22, named 'Theorem 5: ...'). Item 244 strictly … |
| /53 | low | other | sourceIssues (missing entry): proof of Proposition 1.2.29, p. 25 | The diagram of horizontal cofibre sequences in the proof of Proposition 1.2.29 puts Λ_{Q_M}(X)[r] and Λ_{Q_N}(f_!X)[r] in the third column. The cofibre of … |
| /54 | low | error | PAPER-CALMES-ETAL-26/243 (Remark 1.2.21), /257 (Remark 1.2.34) | There are small misstatements in two items. Item 243 says 'f^*q' = q', but the paper has f_*q = q'. Ranicki's q lies in H_n(Hom(DC,C)^{hC2}), which is … |
| /55 | low | other | PAPER-CALMES-ETAL-26/269, /271 (Corollary 1.3.8 setup) | Corollary 1.3.8 is proved by applying Proposition 1.3.1, which assumes a bounded t-structure. The setup of Corollary 1.3.8 (stated before Example 1.3.7) … |
| /56 | low | error | PAPER-CALMES-ETAL-26/304 (locator) | The locator leaves a placeholder: 'Corollary [II].4.4.x'. |
| /57 | low | other | sourceIssues (missed misprints in §2.1–2.2); … | Small slips the extraction did not record: (1) proof of Lemma 2.1.2, p. 34, 'fib[R → R_S] = R/R_S[−1]' should be (R_S/R)[−1] (the next line uses R_S/R); (2) … |
| /58 | low | missing | PAPER-CALMES-ETAL-26/428 (inputs) | Lemma 3.2.4 (Galatius's lemma) rests on cited theorems that have no items. They are the etale comparison K_n(O[1/l])^_l = pi_n K^et(O[1/l])^_l for n >= 2 … |
| /59 | low | other | sourceIssues (missing): Theorem 3.2.9 proof p. 59 and Theorem 3.2.13 … | Both proofs cite the wrong part of Lemma 3.2.7. The isomorphisms GW^gq_n(Z) = GW^gs_n(Z) for n >= 2, and GW^-gq_i = GW^-gs_i for i >= 4, need C_i = 0 for i >= … |
| /60 | low | error | PAPER-CALMES-ETAL-26/422 (and source p. 55) | The paper's quotation of Serre's Theoreme 5, 'every quadratic form (P,q) satisfies P + H_q = H_q^n + E_8^m for some n and m', is false for forms of negative … |
| /61 | low | error | PAPER-CALMES-ETAL-26/439 (Remark 3.2.14) | Remark 3.2.14 states its 2-inverted splitting for both eps = +/-1, then says the 2-inverted L-groups are non-zero only for n = 4k. For eps = -1 they are … |
| /62 | low | other | sourceIssues (missing): p. 49, p. 50, pp. 51-53 | The extraction recorded none of several printed slips in Section 3. (a) The opening of Section 3 says the devissage results are in Section 3.1; they are in … |
| /63 | low | error | PAPER-CALMES-ETAL-26/405, PAPER-CALMES-ETAL-26/406 (locators) | Two locators are a page out. Remark 3.1.6 lies entirely on p. 51, not pp. 51-52. Theorem 3.1.7 is stated on p. 51 and proved on p. 52, not pp. 52-53; p. 53 … |
| /64 | low | other | PAPER-CALMES-ETAL-26/424 (cited source [Wei13, Theorem 10.1]) | The cited source misprints exactly the values item 424 quotes from it, at least in the online K-book chapter VI that I read. Weibel's Theorem 10.1 prints (5) … |
| /65 | low | other | research/blueprint/papers/PAPER-CALMES-ETAL-26.result.json: stages … | Six of the thirteen stages named by the source routes are KU-* readiness checkpoints: KU-fundamental, KU-finitegeneration, KU-finitefields, KU-localp, … |
| /66 | low | duplicate | research/blueprint/papers/PAPER-CALMES-ETAL-26.result.json: route 6 … | Galatius's lemma (/428) says the duality involution acts by (-1)^n on K_{2n-1}(O)[1/2] and K_{2n-2}(O)[1/2] for S-integers, read off the étale descent spectral … |
| /67 | low | duplicate | research/blueprint/papers/PAPER-CALMES-ETAL-26.result.json: route 8, … | The odd-primary part of the symplectic column of /426, GW^{-s}_{cl,n}(Z) = KSp_n(Z), is also a missing item on FGV's accepted Part II, … |
| /68 | low | error | research/blueprint/papers/PAPER-CALMES-ETAL-26.result.json: route 8, … | Route 8's reason says 'The results are stated for rings of integers and their localisations'. Two of its items are general-ring statements about Poincaré … |
| /69 | low | library-claim | research/blueprint/papers/PAPER-CALMES-ETAL-26.result.json: items …; … | No item in the extraction cites a library declaration, but several build on carriers present at the pinned commits. None of these flips an item to 'library', … |

## Notes for the fix job

- **Route 1 (/6–/7).** Turning route 1 into a Part II of GeometryOfNumbersAndQuadraticArithmetic changes every brief
  that imports it, including route 3, so the routes should be rewritten together. The classical items (/1, /2, /3, /12,
  /111 of the paper) move to source routes at GN.6.
- **Routes 2 and 5 (/8, /5).** Their hermitian items have no owner in K.3 or L.1. Fold them into the Part II, or into
  route 8 at GN.6, rather than adding hermitian scope to finished K-theory blueprints.
- **New source issues.** Record the scope of Theorems 2 and 7, Example 2.3.14 (with E4's verdict corrected), Remark
  3.1.12, and the smaller slips listed in the medium and low findings, under PROTOCOL §18.
