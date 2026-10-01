# RT-PAPER-LAWRENCE-SAWIN-25

Red team of the accepted extraction PAPER-LAWRENCE-SAWIN-25: Brian Lawrence and Will Sawin, *The Shafarevich conjecture
for hypersurfaces in abelian varieties*, Annals of Mathematics 202 (2025), no. 3 (arXiv 2004.09046v5). Issue #4039.

Red team: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write or review:
- the extraction (`cc-7b31c4`, PR #1904);
- its review (`cc-d67081`, PR #2357).

Disclosures. Three findings (/27, /35, /54) repeat defects already recorded as RT-AREA-algebraicgeometry /8, /46 and
/11. This session wrote that red team's fixes report (FIX-RT-AREA-algebraicgeometry, #5202), which handed them on
without editing this extraction. Finding /7 is independent of this session's LD.6 finding for another paper
(RT-PAPER-DIMITROV-GAO-HABEGGER-21/20, #5415). The findings that touch these carry coordinator notes; no finding rests
on my verdicts.

**Result: 86 findings, 7 high, 53 medium and 26 low.**

## Method

**The source.** arXiv 2004.09046v5 (<https://arxiv.org/pdf/2004.09046v5>), the version the extraction read, was
re-downloaded on 2026-10-01; its SHA-256 (`5e5f829e…21d97`) equals the extraction's. It has 121 pages, and PDF page =
printed page. The Annals version was not read.

**The passes.** Six parallel passes were run by this session.
- Five read every page: §§1–2, §§3–4, §5, §§6–9, and Appendices A–C, with formulas checked on rendered page images.
- One checked the five routes, the briefs, the 13 planned and library statuses and duplication against the atlas stages,
  other accepted extractions and packets, earlier red teams, `make_queue.py` and the pinned libraries (Mathlib 082e2d3,
  Tau Ceti f790474).

**Merging.** Findings that two or more passes reported were merged, among them the LD.6 transcendence input (three
findings), the dimension N, Definition 9.1, the page locators (four) and Appendix C's two owners.

**What I re-verified myself.** Every high finding, at its evidence: the Q̄_p coefficients on p. 14, N = (n!)d = [H]^n on
p. 21, Corollary 4.3's G^c on p. 30, Lemma 4.8 and its proof on pp. 34–35 (the ordinary-curve counterexample), Lemma A.5
on p. 91, Lemmas B.10–B.11 on pp. 100–101, and the LD.6 stage text against route 3 and brief 1.

The full list of what was checked is in the result's `checked` field.

## The high findings

### /1 — error

**Where.** research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json items /7, /8, /10 (and the coefficient-free
wording of /12 and route 'new' brief (1))

**Claim.** Section 2 works throughout with Q̄_p coefficients, but items /7, /8 and /10 state everything with Q_p: /7
'D^b_c(A,ℚ_p)', /8 'D^b(N) is thick in D^b_c(A,ℚ_p)' and '(P/N, ∗) is a rigid symmetric monoidal ℚ_p-linear abelian
category', /10 'an exact tensor functor from P^χ/N^χ to ℚ_p-vector spaces' and 'ℚ_p-linear'. This is inconsistent with
item /9, which correctly takes χ : π₁(A_k̄) → Q̄_p^×. With that χ, L_χ is a Q̄_p-sheaf, so H⁰(A_k̄, K ⊗ L_χ) is a
Q̄_p-vector space and K ↦ H⁰ is a tensor functor only over Q̄_p. Item /10(3)–(4) is therefore false as written, for
example for χ of order 3 with p = 2, whose values are not in ℚ_2. The algebraically closed coefficient field is also
what the later sections use: Theorem 3.5 is a statement over Q̄_p, and p. 86 says 'The Tannakian monodromy groups SO,
Sp, or SL are calculated over an algebraically closed field Q̄_p'.

**Evidence.** p. 14: 'Let D^b_c(A, Q̄_p) be the derived category of bounded complexes of p-adic sheaves on A with
constructible cohomology', 'Lemma 2.1. (D^b_c(A, Q̄_p), ∗) is a rigid symmetric monoidal category', 'Let P be the
category of perverse sheaves on A with Q̄_p-coefficients'. p. 15: 'Lemma 2.2 ... (9) (P/N, ∗) is a rigid symmetric
monoidal Q̄_p-linear abelian category'. p. 16: 'Lemma 2.5 ... (3) K ↦ H⁰(A_k̄, K ⊗ L_χ) is an exact tensor functor from
P^χ/N^χ to Q̄_p-vector spaces', and the proof of (4): 'faithful since exact Q̄_p-linear tensor functors ... are
automatically faithful if the endomorphisms of the unit are Q̄_p'. The overlines were checked on the 150-dpi renders of
pp. 14–16, since the text layer drops them.

**Fix.** Replace ℚ_p by Q̄_p (written ℚ‾_p, as item /9 does) everywhere in items /7, /8 and /10: '(D^b_c(A,ℚ‾_p), ∗)
...', '(P/N, ∗) is a rigid symmetric monoidal ℚ‾_p-linear abelian category', 'an exact tensor functor from P^χ/N^χ to
ℚ‾_p-vector spaces', '... a faithful exact tensor functor to ℚ‾_p-vector spaces'. In the brief of route 'new', item (1),
write 'the bounded constructible derived category D^b_c(A, ℚ‾_p)'.

### /2 — error

**Where.** research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item /15 (statement); item /18 (note); route
'new' SheafConvolutionOnAbelianVarieties brief, final theorem (3); PAPER-LAWRENCE-SAWIN-25.md, bullet 'Sheaf convolution
(§§2–3)'; research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json route 2 brief, final theorem (3); item /15
statement; item /18 note (also PAPER-LAWRENCE-SAWIN-25.md and the review's route-2 reason)

**Claim.** The dimension of the distinguished representation is stated as N = (−1)^{n−1}[H]^n. The paper's N is [H]^n =
n!·d, which is positive; (−1)^{n−1}[H]^n is the topological Euler characteristic of H (Lemma 3.3), and Lemma 3.7 says
the dimension is (−1)^{n−1} times that. For every even n the item's N is negative (n = 4: N = −24d), so 'G_H contains
SL_N, Sp_N or SO_N' is meaningless. The same wrong formula is in the route brief the design job will receive, in the
report, and in item /18's note on the elimination of the spin and exceptional cases, which actually uses that n!·d is
divisible by 6. Also: The brief, item /15 and item /18 state N = (−1)^{n−1}[H]^n for the rank of the distinguished
representation. The paper's N is [H]^n = n!·d. The expression (−1)^{n−1}[H]^n is the topological Euler characteristic of
H (Lemma 3.3), not N. For even n, which includes the main case dim A = 4, the brief's N is negative, so the stated final
theorem ('G_H contains SL_N, Sp_N or SO_N') is false as written.

**Evidence.** p. 21 (rendered): 'Let N = (n!)d = [H]^n.' Lemma 3.7 proof, p. 21: 'the dimension of the representation
associated to any object in the Tannakian category is the Euler characteristic of the corresponding perverse sheaf,
which is (−1)^{n−1} times the topological Euler characteristic of H. This now follows from Lemma 3.3.' Lemma 3.3, p. 20:
'The topological Euler characteristic of H is (−1)^{n−1}[H]^n.' Lemma 3.12 proof, p. 24: 'For n > 2, (n!)d is always a
multiple of 3! = 6.' Item /14 itself correctly gives the topological Euler characteristic as (−1)^{n−1}[H]ⁿ. Also: p.
21: 'Let N = (n!)d = [H]^n.' p. 20, Lemma 3.3: 'The topological Euler characteristic of H is (−1)^{n−1}[H]^n.' p. 21,
Lemma 3.7 proof: the dimension 'is the Euler characteristic of the corresponding perverse sheaf, which is (−1)^{n−1}
times the topological Euler characteristic of H.' Counterexample: n = 4 and H a smooth ample divisor with [H]^4 = 24 (d
= 1). The paper gives N = 24; the brief and item /15 give N = −24. Brief 2 reads '…as a normal subgroup, where N =
(−1)^{n−1}[H]^n'.

**Fix.** Replace 'N = (−1)^{n−1}[H]ⁿ' by 'N = [H]ⁿ = n!·d (= (−1)^{n−1} times the topological Euler characteristic of
H)' in item /15, in the new-route brief (3) and in the report. Replace item /18's note sentence by: 'For n ≥ 3, N = n!·d
is divisible by 6, while spin representations have dimension a power of 2 and the minimal representations of E₆ and E₇
have dimensions 27 and 56; none is divisible by 6.' Also: Replace 'N = (−1)^{n−1}[H]^n' by 'N = [H]^n = n!·d (the
topological Euler characteristic of H is (−1)^{n−1}[H]^n)' in brief 2, item /15 and the note of item /18. In /18's note,
write 'comparing them with N = n!·d, which is divisible by 6 when n ≥ 3'.

### /3 — error

**Where.** research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item /21 (statement, Corollary 4.3 part)

**Claim.** The item says that for the c coordinate inclusions i_j : A → A^c 'the convolution monodromy group of ⊕_j
i_{j*}K is G and contains (G^*)^c as a normal subgroup'. Corollary 4.3 says it is G^c. As written the statement is false
for c ≥ 2: G cannot contain (G^*)^c as a normal subgroup, since dim (G^*)^c = c·dim G^* > dim G^* = dim [G^0, G^0].

**Evidence.** Corollary 4.3, p. 30 (rendered): 'Then the convolution monodromy group of ⊕_{j=1}^c i_{j*}K is G^c and
thus contains (G^*)^c as a normal subgroup.' Proof: 'The convolution monodromy group is G^c by induction on Lemma 4.2.'

**Fix.** Replace 'is G and contains (G^*)^c' by 'is G^c (by induction on Lemma 4.2) and so contains (G^*)^c'.

### /4 — error

**Where.** research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json items /25 (Lemma 4.8) and /26 (Corollary 4.10);
sourceIssues (empty)

**Claim.** Lemma 4.8 is false for characters of p-power order, so Corollary 4.10 'for any prime ℓ' is unproved for ℓ =
p; the items copy both. The proof rests on the claim that σ = Frob_p^m acts on Π(A) with no root-of-unity eigenvalues,
because Frob_p acts on character values 'by multiplication by p^m' and on π₁ with Weil-number eigenvalues. That holds
only on the prime-to-p part. p is ramified in ℚ^cyc, so a Frobenius lift acts on μ_{p^∞} by an arbitrary unit u ∈ ℤ_p^×,
and a Frobenius lift acts on T_pA through a crystalline, not unramified, representation. Counterexample: E/ℚ an elliptic
curve ordinary at p, α ∈ ℤ_p^× the unit root of x² − a_p x + p, K = ℚ, m = 1. Take Frob_p = (g, τ) with g a Frobenius
lift at p and τ ∈ Gal(ℚ^cyc/ℚ) ≅ Ẑ^× with prime-to-p components p and p-adic component α (or α^{−1}, according to the
convention for the action). This is allowed by the definition on p. 34. The diagonal choice also works, since the
cyclotomic character takes every value of ℤ_p^× on Frobenius lifts in G_{ℚ_p}. Let λ : T_pE → ℤ_p be the projection to
the unramified étale quotient, on which g acts by α, and χ_k(x) = ζ_{p^k}^{λ(x)}. Then σχ_k = χ_k for every k, so there
are infinitely many σ-fixed torsion characters. E is simple, so its only proper subtorus is {1}, and S′ is a finite set
of points. With c = 2 and S = {T}, T = {(χ₁,χ₂) : χ₁ = χ₂} (the characters trivial on π₁ of the antidiagonal {(x,−x)}, a
proper subtorus), every χ_k ∉ S′ has (σ^{e₁}χ_k, σ^{e₂}χ_k) = (χ_k,χ_k) ∈ T for all e₁, e₂. The application only ever
uses characters of order prime to p.

**Evidence.** p. 34 (rendered): 'Fix inside the group Gal_ℚ × Gal_{ℚ^cyc/ℚ} an element Frob_p of elements projecting to
a lift of Frobenius inside the decomposition group at p'; Lemma 4.8: 'for any χ outside the union of S′, there exist
e₁,…,e_c ∈ ℤ such that the tuple (Frob_p^{me₁}(χ),…,Frob_p^{me_c}(χ)) does not lie in the union of S'; proof: 'the
action of σ on Π(A) is by invertible linear transformations, with no roots of unity as eigenvalues. (The action of
Frob_p^m ∈ Gal_{ℚ^cyc/ℚ} is by multiplication by p^m, while the action of Frob_p^m ∈ Gal_K ⊆ Gal_ℚ is invertible, with
eigenvalues the inverses of Weil numbers of absolute value p^{m/2}…'. Corollary 4.10, p. 36: 'Then for any prime ℓ,
positive integer c, and prime p where A has good reduction, there exist … a torsion character χ of π₁^et(A_ι), of order
a power of ℓ'. §5.5, p. 49: 'Let r be prime to p'.

**Fix.** In item /25, Lemma 4.8: 'for any χ of finite order prime to p outside the union of S′'. In item /26: 'for any
prime ℓ ≠ p'. Lemma 4.9 needs no change. Add sourceIssue PAPER-LAWRENCE-SAWIN-25/E1, kind error, locator 'Lemma 4.8 and
its proof, pp. 34–35; Corollary 4.10, p. 36', affects 'a stated result', with this counterexample. The correction is to
restrict to characters of order prime to p, which is the case used in §5.5 and §9; on that part Frob_p acts on μ_{ℓ^∞}
by ζ ↦ ζ^p and on T_ℓA (ℓ ≠ p) with eigenvalues of absolute value p^{1/2}.

### /5 — error

**Where.** research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item /61

**Claim.** Lemma A.5 is mis-transcribed. The item says 'if a0 > 1/2 then ... Σ_k k·a_k < 2'; the paper's Lemma A.5 is
Σ_k k²·a_k < 3/2. The recorded statement is vacuous (Σ_k k·a_k = 0 for every n, because a_{-k} = a_k) and cannot give
Lemma A.6: the paper's proof of A.6 for large n compares A.5 with the second moment (n+1)/6 of Lemma A.3, which needs
the k² form and the constant 3/2. As recorded, the item's lemmas do not imply its own conclusion a0 ≤ 1/2, which feeds
Lemma A.1 and Theorem 9.2. The item also never defines the sequence (a_i).

**Evidence.** p. 91: 'Lemma A.5. If a0 > 1/2 then Σ_k k²a_k < 3/2.' p. 92, proof of Lemma A.6: 'If n ≥ 9, this is
immediate from Lemmas A.3 and A.5.' p. 91: 'Let a_i = Σ_k A(n,k)A(n,k−i)/(Σ_k A(n,k))²'. Computed: Σ_k k·a_k = 0 and Σ_i
i²a_i = (n+1)/6 exactly for n = 1..15; Σ_{k≥1} k²/3^k = 3/2.

**Fix.** In /61 replace 'and Σ_k k·a_k < 2' with 'and Σ_k k²·a_k < 3/2 (Lemma A.5)', and begin the statement with the
definition 'For n ≥ 1 let a_i = Σ_k A(n,k)A(n,k−i)/(n!)² for i ∈ ℤ, so Σ_i a_i = 1.' Add to the note: 'A.3 and A.5 give
a0 ≤ 1/2 for n ≥ 8 (if a0 > 1/2 then (n+1)/6 < 3/2); for even n the symmetry gives a0 =
½·Σ_{k<n/2}A(n,k)²/(Σ_{k<n/2}A(n,k))² ≤ ½, and n = 3, 5, 7 are direct (a0 = 1/2, 0.3965, 0.3426).'

### /6 — error

**Where.** research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json items /63 and /64

**Claim.** Lemmas B.11–B.18 assume that one particular ratio is large, N(m^a_1)/N(m_0) =
m_H(w−1)(m_H(w)−m_0(w))/(m_0(w)+1) ≥ A(n,1)/2. The items say 'one ratio' (/63) and 'one of the two ratios' (/64)
instead. The two ratios always sum to A(n,1) (Lemma B.10, which /63 itself states), so one of them is always ≥ A(n,1)/2.
As written, /64 therefore claims that every solution has n ≤ 10 and that no solution has n ≥ 5, and credits this to
Lemmas B.15–B.18. The other regime, N(m^b_1)/N(m_0) ≥ A(n,1)/2, is not symmetric to the first, because reflecting i ↦ −i
swaps m_min and m_max. The paper treats it separately in Lemmas B.19–B.31 (/65), so as written /65 is redundant and the
outline credits the wrong lemmas. In the b-regime the paper explicitly allows N(m^a_1) = 0, so m_H(w−1) = 1 (/63) is not
a consequence there. The items also never define N, m_0 or the ratios ('attached to the extreme indices' is wrong: they
involve w−1, w, w+1).

**Evidence.** p. 101, Lemma B.11: 'If n ≥ 5 and (15) N(m^a_1)/N(m_0) ≥ A(n,1)/2 then m_H(w−1) = 1.' Lemmas B.12–B.18
(pp. 103–107) all assume N(m^a_1)/N(m_0) ≥ A(n,1)/2. p. 100, Lemma B.10: 'N(m^a_1)/N(m_0) + N(m^b_1)/N(m_0) = A(n,1)'.
p. 111, Lemma B.24: 'If n ≥ 5, N(m^a_1)/N(m_0) = 0, k ≤ n−1, and N(m^b_1)/N(m_0) ≥ A(n,1)/2, then m_0(w) = 1'. p. 112:
'if N(m^a_1) ≠ 0 then we must have m_H(w−1) ≠ 0'. p. 99: 'N(m^a_1)/N(m_0) = m_H(w−1)(m_H(w)−m_0(w))/(m_0(w)+1),
N(m^b_1)/N(m_0) = m_H(w+1)m_0(w)/(m_H(w)−m_0(w)+1)'.

**Fix.** In /63 add the definitions: 'Assume WLOG k ≤ m/2. Let m_0 = m_min (resp. m_max) be the function m_S with 0 ≤
m_S ≤ m_H and Σ m_S = k that minimises (resp. maximises) Σ i·m_S(i). Let w be the largest index with m_0(w) > 0 and w′
the least index with m_max(w′) > 0. Write N(m_S) = Π_i C(m_H(i), m_S(i)), m^a_1 = m_0 + [w] − [w−1], m^b_1 = m_0 + [w+1]
− [w], so that N(m^a_1)/N(m_0) = m_H(w−1)(m_H(w)−m_0(w))/(m_0(w)+1) and N(m^b_1)/N(m_0) =
m_H(w+1)m_0(w)/(m_H(w)−m_0(w)+1).' In /63 replace 'If n ≥ 5 and one ratio is at least A(n,1)/2' with 'If n ≥ 5 and
N(m^a_1)/N(m_0) ≥ A(n,1)/2'. In /64 replace 'If one of the two ratios is at least A(n,1)/2' with 'If N(m^a_1)/N(m_0) ≥
A(n,1)/2', and 'for n ≥ 5 the regime is impossible altogether' with 'for n ≥ 5 the regime N(m^a_1)/N(m_0) ≥ A(n,1)/2 is
impossible (Lemma B.18); the complementary regime N(m^b_1)/N(m_0) ≥ A(n,1)/2 is /65'. In /65 replace 'the second ratio'
with 'N(m^b_1)/N(m_0)'.

### /7 — error

**Where.** research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json route 3 (source
LogicAndDefinabilityInNumberTheory:LD.6, item /44); item /76 (planned LD.6); route 1 brief ('o-minimality and
Ax–Schanuel from LogicAndDefinabilityInNumberTheory LD.6');
research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item /76 (status planned at LD.6), route 3 (source route
sending /44 to LD.6), route 1 brief ('Import ... o-minimality and Ax–Schanuel from LogicAndDefinabilityInNumberTheory
LD.6'); research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item /44 (route 3) versus
PAPER-LAWRENCE-VENKATESH-20/transcendence-corollary (route 1, MordellLawrenceVenkateshPartII)

**Claim.** LD.6 does not plan Bakker–Tsimerman's Ax–Schanuel theorem or its corollary: it takes functional-transcendence
theorems as inputs that an application must supply. Routing Lemma 6.3 (item /44) to LD.6 also closes an import cycle.
Lemma 6.3 is stated 'in the above setting' of §6.1: it uses G_mon (item /30), P_mon and Φ_ℂ (item /43), all of which
live in MordellLawrenceVenkateshPartII. That Part II imports LD.6 for Lemma 6.3 (Theorem 6.4, item /45, is deduced from
it), so the edges run LD.6 → Part II → LD.6. The complex period map is also owned by HodgeStructuresPartII, which itself
imports LD.6. Finally, the same statement now has a second owner: PAPER-LAWRENCE-VENKATESH-20/transcendence-corollary
(LV Corollary 9.2, of which Lemma 6.3 is 'a mild generalization') is routed to MordellLawrenceVenkateshPartII, with
Bakker–Tsimerman in LogicAndDefinabilityPartII. Coordinator note: this session's red team
RT-PAPER-DIMITROV-GAO-HABEGGER-21 (PR #5415), finding /20, recorded that LD.6 plans no mixed Ax–Schanuel for another
paper; this finding is independent of it. Also: LD.6 does not plan the Ax–Schanuel theorem for variations of Hodge
structure ([3, Theorem 1.1], Bakker–Tsimerman), which is the only transcendence input of Lemma 6.3 and hence of Theorem
6.4, Theorem 8.17 and Theorem 9.2. LD.6 explicitly treats functional-transcendence theorems as inputs that an
application must supply. So /76's status 'planned' is false, the brief's import claim is false, and placing /44 (a
consumer of Ax–Schanuel) at LD.6 puts it upstream of its own input. The input is now owned by LogicAndDefinabilityPartII
(route 4 of PAPER-LAWRENCE-VENKATESH-20), which has LD as its parent and imports LD.6, so /44 at LD.6 creates a
dependency running backwards from LD.6 to its own Part II. The extraction contradicts itself: the route-3 reason and the
prerequisites say the atlas 'covers ... not Bakker–Tsimerman's Ax–Schanuel theorem', while /76 says LD.6 plans it. Also:
Lemma 6.3 is, in the paper's own words, LV Corollary 9.2 with the same proof. The paper changes only the ambient space,
from the full orthogonal or symplectic flag variety to G_mon/P. LV's Corollary 9.2 is already an item routed to
MordellLawrenceVenkateshPartII. The LV route-4 brief also asks LogicAndDefinabilityPartII to export the same corollary.
Sending /44 to LD.6 creates a third owner of one statement.

**Evidence.** LD.6 (atlas/roadmaps/LogicAndDefinabilityInNumberTheory.json) Acceptance: 'An application must provide
independent orbit and functional-transcendence suppliers and cannot treat counting alone as an unlikely-intersection
theorem'; requires only LD.0, DT.0, SF.0. Paper p. 64: 'Lemma 6.3. (Complex Bakker–Tsimerman theorem). In the above
setting, suppose that Z ⊆ (Gmon/P)C is an algebraic subvariety … Proof. (This is a mild generalization of [48, Corollary
9.2]. The proof is the same…)'; p. 63: 'Suppose V is a Hodge–Deligne system on X … Gmon is the differential Galois group
of VdR'. PAPER-MOK-PILA-TSIMERMAN-19 route 1 (accepted): 'LD.6's unlikely-intersection applications consume this Part
II, so importing LD.6 as a whole would close a stage cycle.' PAPER-BAKKER-KLINGLER-TSIMERMAN-20 route 8
(DegeneratingHodgeStructures, accepted) imports 'definable geometry/Chow from LogicAndDefinabilityInNumberTheory LD.6'.
PAPER-LAWRENCE-VENKATESH-20 route 4 reason: 'PAPER-LAWRENCE-SAWIN-25/44 (routed to LD.6) and /76 (planned at LD.6)
should follow Theorem 9.1 here, or else that corollary would sit at LD.6, upstream of the theorem it needs.' The route's
own reason concedes that Bakker–Tsimerman is 'listed under prerequisites' because the atlas lacks it, which contradicts
/76 being 'planned' at LD.6. Also: LD.6 description (atlas/roadmaps/LogicAndDefinabilityInNumberTheory.json): 'Build
Pila-Zannier-type applications from separate Galois-orbit bounds, definability of uniformization and
functional-transcendence theorems ... Acceptance. ... An application must provide independent orbit and
functional-transcendence suppliers ... Source route. ... independent Galois-orbit and Ax-Lindemann/Ax-Schanuel inputs.'
Paper p. 64, proof of Lemma 6.3: 'We will apply [3, Theorem 1.1]' (Ax–Schanuel for VHS). PAPER-LAWRENCE-VENKATESH-20
route 4 reason: 'Theorem 9.1 was marked planned at LD.6, but LD.6 takes Ax–Schanuel theorems as independent inputs ...
PAPER-LAWRENCE-SAWIN-25/44 (routed to LD.6) and /76 (planned at LD.6) should follow Theorem 9.1 here, or else that
corollary would sit at LD.6, upstream of the theorem it needs.' Also: p. 64, proof of Lemma 6.3: '(This is a mild
generalization of [48, Corollary 9.2]. The proof is the same; we reproduce it here for the reader's convenience.)'
PAPER-LAWRENCE-VENKATESH-20 route 1 items include 'PAPER-LAWRENCE-VENKATESH-20/transcendence-corollary'. Its route 4
brief: 'Lawrence–Sawin's Lemma 6.3 (PAPER-LAWRENCE-SAWIN-25/44) is the same corollary.'

**Fix.** Delete route 3. Move item /44 into route 1 (MordellLawrenceVenkateshPartII), where it is merged with
PAPER-LAWRENCE-VENKATESH-20/transcendence-corollary as the general form of LV Corollary 9.2. Set /76 to 'missing' for
the Ax–Schanuel part, noting that its owner is LogicAndDefinabilityPartII (PAPER-MOK-PILA-TSIMERMAN-19 route 1, extended
by PAPER-LAWRENCE-VENKATESH-20 route 4); o-minimal structures and definable Chow can stay planned at LD.6. Route /76
there, or to route 1 with an import note. In brief 1, replace 'o-minimality and Ax–Schanuel from
LogicAndDefinabilityInNumberTheory LD.6' with 'Bakker–Tsimerman's Ax–Schanuel theorem for variations of Hodge structure
from LogicAndDefinabilityPartII, the Part II of LogicAndDefinabilityInNumberTheory (design
DESIGN-LogicAndDefinabilityInNumberTheoryPartII)'. Also: Split /76. (a) 'o-minimal structures, definable sets,
Pila–Wilkie' stays planned at LD.0/LD.6, but Lemma 6.3 does not use it directly. (b) A new missing item
'Bakker–Tsimerman, Ax–Schanuel for VHS ([3, Theorem 1.1]): X smooth complex, V a pure polarized integral VHS, Ď the
compact dual of the weak Mumford–Tate domain of the identity component of the algebraic monodromy group, W ⊆ X × Ď the
graph of the period map, V' ⊆ X × Ď algebraic, U an irreducible analytic component of W ∩ V' with codim U < codim V' +
codim W; then the projection of U to X lies in a proper weakly special subvariety'. Route it to
LogicAndDefinabilityPartII, coalescing with PAPER-LAWRENCE-VENKATESH-20/bakker-tsimerman. Move /44 out of route 3 into
that part-ii route, or into route 1 next to PAPER-LAWRENCE-VENKATESH-20/transcendence-corollary (see the duplicate
finding). In the route-1 brief, replace 'o-minimality and Ax–Schanuel from LogicAndDefinabilityInNumberTheory LD.6' with
'Bakker–Tsimerman's Ax–Schanuel theorem for VHS and its corollary (LV Corollary 9.2 = Lemma 6.3) from
LogicAndDefinabilityPartII'. Also: Give /44 the same owner as PAPER-LAWRENCE-VENKATESH-20/transcendence-corollary,
stated in the general form of /44 (codim_{G_mon/P} Z ≥ dim X) so that it subsumes LV's form. Add to /44's note:
'Generalizes PAPER-LAWRENCE-VENKATESH-20/transcendence-corollary (LV Corollary 9.2); one item, one owner.' Remove route
3.

## All findings

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json items … | Section 2 works throughout with Q̄_p coefficients, but items /7, /8 and /10 state everything with Q_p: /7 'D^b_c(A,ℚ_p)', /8 'D^b(N) is thick in D^b_c(A,ℚ_p)' … |
| /2 | high | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item …; … | The dimension of the distinguished representation is stated as N = (−1)^{n−1}[H]^n. The paper's N is [H]^n = n!·d, which is positive; (−1)^{n−1}[H]^n is the … |
| /3 | high | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item … | The item says that for the c coordinate inclusions i_j : A → A^c 'the convolution monodromy group of ⊕_j i_{j*}K is G and contains (G^*)^c as a normal … |
| /4 | high | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json items …; … | Lemma 4.8 is false for characters of p-power order, so Corollary 4.10 'for any prime ℓ' is unproved for ℓ = p; the items copy both. The proof rests on the … |
| /5 | high | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item /61 | Lemma A.5 is mis-transcribed. The item says 'if a0 > 1/2 then ... Σ_k k·a_k < 2'; the paper's Lemma A.5 is Σ_k k²·a_k < 3/2. The recorded statement is vacuous … |
| /6 | high | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json items … | Lemmas B.11–B.18 assume that one particular ratio is large, N(m^a_1)/N(m_0) = m_H(w−1)(m_H(w)−m_0(w))/(m_0(w)+1) ≥ A(n,1)/2. The items say 'one ratio' (/63) … |
| /7 | high | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json route 3 …; … | LD.6 does not plan Bakker–Tsimerman's Ax–Schanuel theorem or its corollary: it takes functional-transcendence theorems as inputs that an application must … |
| /8 | medium | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item /7 … | Item /7 states Lemma 2.1 'for an abelian variety A over a field', and /8's note calls the construction one 'over an arbitrary field'. The paper's §2 has the … |
| /9 | medium | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item /12 | Item /12 has three defects. (a) It defines Gal_k as 'the Tannakian group of ℓ-adic Gal(k‾/k)-representations'. The lemma itself uses p-adic (Q̄_p) … |
| /10 | medium | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item /1 …; … | Item /1 copies Definition 9.1 word for word: 'H is primitive if it is not invariant under translation by any point of A(ℚ‾)'. Read literally, no hypersurface … |
| /11 | medium | missing | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json items … | Lemma 2.7, recorded in item /11, proves that the geometrically semisimple objects of P^χ/N^χ are closed under convolution, and does so only by citing … |
| /12 | medium | missing | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item … | Lemma 2.8, the exact sequence 1 → G_k̄ → G_k → Gal_k → 1 recorded in item /12, is proved entirely by checking the criteria of Esnault–Hai–Sun [19, Theorem … |
| /13 | medium | missing | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json items … | The paper's central object, the (geometric or arithmetic) convolution monodromy group of a perverse sheaf K, has no item. It is defined on p. 14 as the image … |
| /14 | medium | missing | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json … | The prerequisites list leaves out the papers that §2 is built on, though the atlas covers none of them. Lemma 2.1 is proved only by citing Weissauer [68, §2.1] … |
| /15 | medium | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json …; … | Two prerequisite entries are wrong. (a) The Krämer–Maculan entry links https://arxiv.org/abs/2005.11290, which is Cavallo–Harper, 'Internal Parametricity for … |
| /16 | medium | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item /74; … | Item /74 states the curve case as 'only finitely many curves of a given genus' with good reduction outside S. That is false for genus 1. For example, take K = … |
| /17 | medium | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item /6 …; … | Proposition 4.11 is stated, and copied, for n ≥ 2. Its proof gets 'G^* simple with irreducible representation' from Lemma 3.9, which assumes n > 2, and that … |
| /18 | medium | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item … | The acceptance test 'the theta divisor of a Jacobian, where the convolution group is the classical one of Krämer–Weissauer' is wrong. Krämer–Weissauer's … |
| /19 | medium | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json route …; … | The new-route brief says the Part II 'consumes Corollary 4.10 and nothing else from here', and the report repeats this ('import one statement, Corollary … |
| /20 | medium | library-claim | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item …; … | Item /77 claims that 'minuscule representations and the classification of simple groups with their representations' (used in Lemma 3.10) are planned by Tau … |
| /21 | medium | missing | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json items … | The proofs of Lemmas 3.8–3.11 use cited results and definitions that have no item, against §16 ('A result the paper cites from elsewhere is one item'). The … |
| /22 | medium | missing | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json items … | §4's proofs use cited results that have no item. (a) The Krämer–Weissauer generic vanishing theorem [45, Lemma 11.2]: for K perverse on A_ℂ, H^i(A, K⊗L_χ) = 0 … |
| /23 | medium | missing | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json items … | Item /14's note says the Euler characteristics are 'Proved by Hirzebruch–Riemann–Roch and the adjunction sequence'. That is true only for Lemmas 3.1–3.2. Lemma … |
| /24 | medium | missing | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json items …; … | The argument repeatedly identifies convolution monodromy groups computed over different algebraically closed base fields: in Lemma 4.1 (pr₁^*K and pr₂^*K over … |
| /25 | medium | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item … | The item puts K on the wrong space. It says 'Let K be a perverse sheaf of geometric origin on A_{ℂ(η)‾}' and then asserts H⁰(A_{ℂ(η)‾}, … |
| /26 | medium | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item … | Item /79 describes Π(A) as 'a torus over ℚ‾_p'. Π(A), the continuous characters π₁^et(A) → ℚ‾_p^×, is not an algebraic torus. Its prime-to-p part is the … |
| /27 | medium | duplicate | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item …; … | The same object is recorded twice with contradictory statuses. Item /73 (planned, AbelianSchemesAndArithmeticModuli:A2) includes 'the character group of the … |
| /28 | medium | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item /28 | The statement of Definition 5.2 departs from the paper in three ways. (a) It drops the hypothesis that p does not lie below any place of S, which is what lets … |
| /29 | medium | missing | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json, items … | §5.7 ('Structure of E-modules', pp. 54-55) has no numbered statements, and no item records it, though later items use what it establishes. Three facts are … |
| /30 | medium | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item … | Item /35 copies a misprint in the statement of Lemma 5.29 (repeated in §5.1): 'an H⁰-algebra E_I on O_{K,S} and an E_I-module V_I on 𝒳'. Here 𝒳 is a … |
| /31 | medium | other | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json … | The proof of Lemma 5.29 defines E_I wrongly: 'choose any (ι0, χ0) ∈ I, and let E_I be the pushforward of O_{ℚ[μr]} from K to ℚ'. That object has rank … |
| /32 | medium | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item … | Example 5.17, copied into /33 as 'E_cris = E ⊗ K_v with Frobenius σ₁ ⊗ σ₂', is false as soon as v has residue degree f ≥ 2 over p and Frob_v acts nontrivially. … |
| /33 | medium | duplicate | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item … | Item /36 (Definition 5.31, Lemmas 5.32–5.33) is 'missing' and names no import, though two of its ingredients are planned elsewhere. (a) Lemma 5.33 is announced … |
| /34 | medium | missing | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item /41 | The proof of Lemma 5.49 rests on two inputs that no item records. (1) Lawrence–Venkatesh Lemma 2.6, the finiteness of semisimple representations valued in a … |
| /35 | medium | library-claim | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item /72 | Item /72 covers 'variations of Hodge structure with Griffiths transversality, together with the period map to a period domain'. It is 'planned' by milestones … |
| /36 | medium | missing | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json, items … | Lemma 5.43 (item /39) uses Fontaine's theorem that D_cris is an exact faithful tensor functor (a fibre functor) on crystalline representations with values in … |
| /37 | medium | missing | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json, items … | Relative p-adic Hodge theory is used in two places. The comparison (4) of Definition 5.2 between V_cris ⊗ OB_cris and V_et ⊗ OB_cris on the pro-étale site … |
| /38 | medium | missing | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json items … | Six proofs in §§6-8 reduce to results of LV §§9-11 that the paper does not reprove: Lemma 6.3, Theorem 6.4, Lemma 8.2, Lemma 8.7, Lemma 8.12 and Lemma 8.15 … |
| /39 | medium | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item …; … | Lemma 6.5, which /46 states without restriction on N, is false for H = SO_2 and H = SO_4 (and degenerate for trivial H, where ∼ is not reflexive). The proof's … |
| /40 | medium | other | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json … | Definition 6.6 is internally inconsistent. It takes H to be SL_N, Sp_N or O_N and says G¹_dR is a form of SL_N^d, Sp_N^d or O_N^d, while Lemma 6.5, which … |
| /41 | medium | other | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json …; … | The proof of Theorem 9.2 asserts that, by properness, every S-integral point of Hilb lifts to an S-integral point of the resolution 𝒳. That is false: a proper … |
| /42 | medium | other | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json …; … | The proof of Lemma 8.14 applies Lemma 8.13 to ψ = Ad(φ) on the unipotent radical U of P. But ψ^r = Ad(φ^r) with φ^r ∈ M semisimple, and this is not the … |
| /43 | medium | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item … | The test 'for c = 1 the conditions are vacuous, which is why c must be large' is false and contradicts itself. At c = 1 the two conditions, Σ_{a>0}h^a ≥ e and … |
| /44 | medium | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item … | The assembly outline never says where the hypothesis 'n ≥ 4, or n = 3 and d ≠ C(a(i)+a(i+1), a(i+1))/6' is used. It goes straight from 'Y is not a translate of … |
| /45 | medium | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item /63 | The bounds of Lemmas B.13 and B.14 are recorded with the wrong Eulerian index and in a weaker form than the one later used. The item has m_H(w+j)(m_H(w+j)−1) ≤ … |
| /46 | medium | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item /65 | The proof outline stops at 'forcing r = 2 and d < 3A(n,4)/A(n,1)², which is impossible'. That bound alone is not impossible: 3A(n,4)/A(n,1)² exceeds 1 for … |
| /47 | medium | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item …; … | Lemma A.1 is stated, in the paper and in the item, for any smooth hypersurface Y, any n ≥ 2 and any H in {GL, GSp, GO}. It is false in two edge cases the … |
| /48 | medium | missing | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json items …; … | Lemmas A.2 and A.3 are quoted from other sources, and no item records those sources. The cited results are: the log-concavity of the Eulerian numbers [53, … |
| /49 | medium | missing | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json route 2 …; … | Brief 2 names no p-adic Hodge theory, although Lemma 3.13 is proved by the Hodge–Tate decomposition of the étale cohomology of the cover H′ and by the … |
| /50 | medium | library-claim | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item …; … | Item /27 is marked missing and routed to the Part II, but DeligneWeightsAndPurity:DWP.0 plans exactly this definition. DWP.0 plans Weil q-numbers of integer … |
| /51 | medium | duplicate | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item …; … | Lemma 8.1 is literally LV Lemma 2.9 over ℚ, as the paper's one-line proof says. MordellLawrenceVenkatesh:LV.1 already plans LV Lemma 2.9, and its acceptance … |
| /52 | medium | library-claim | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item … | The first half of /37 is already in Tau Ceti at the pin: the subgroups P_µ, U_µ, L_µ defined by limits of µ(t)gµ(t)⁻¹, and the decomposition of P_µ as the … |
| /53 | medium | duplicate | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json route 1 …; … | Brief 1 plans G-complete reducibility and semisimplification inside the Part II and imports from LV.1 only the GL_d finiteness lemma. Since … |
| /54 | medium | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json route 4 …; … | There are two problems. (1) The route's reason says 'no layer of the atlas mentions it', and the item note says 'no layer of the atlas plans it'. Both are … |
| /55 | medium | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item …; … | Item /71 states the crystalline comparison for an arbitrary smooth proper family. LV.4 plans it only for H¹ of abelian-by-finite families, and lists the … |
| /56 | medium | missing | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json route 1 …; … | Beyond the points above, the brief leaves out suppliers that the Part II's items need, all of which the atlas has. (a) The Hilbert scheme of smooth … |
| /57 | medium | missing | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json items …; … | Several results the proofs cite have no item, against PROTOCOL §16 ('every cited result used is an item'). (1) André's theorem [1, §5 Thm 1]: the Hodge … |
| /58 | medium | missing | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json route 5 …; … | The route-5 reason calls the paper 'a good source' for the inequalities because 'its appendices state and prove the inequalities in the form a consumer needs'. … |
| /59 | medium | other | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json route 2 …; … | Appendix C has two owners in the extraction. Route 2's reason and brief say SheafConvolutionOnAbelianVarieties keeps 'the Eulerian-number combinatorics of … |
| /60 | medium | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item … | Lemma 6.3 is stated 'in the above setting', which is an arbitrary Hodge–Deligne system: a graded-polarizable, possibly mixed and non-integral system. Its proof … |
| /61 | low | library-claim | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item … | The note says that, besides Mathlib's finite-group Tannaka duality, 'there is no Tannakian category with fibre functor in the sense used here', and it ignores … |
| /62 | low | missing | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json … | Apart from Definition 9.1 (separate finding), sourceIssues misses several misprints that bear on the main theorems and on §§1–2, and the extraction silently … |
| /63 | low | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.md 'What the paper … | The report's summary of the main theorems is imprecise in four places. (a) It explains the omission of d(1) = 6 by 'since a threefold class divisible by 6 is … |
| /64 | low | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json items … | Item /8 uses D^b(N) in parts (3), (4) and (6) without saying what it is: the complexes all of whose perverse cohomology sheaves lie in N. Item /9 defines P^χ … |
| /65 | low | other | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item …; … | Theorem 3.5 assumes n > 2 and then excludes '(1) n = 2 and d = 28'. That exception, and the E₇ alternative of Remark 3.6 attached to it, is vacuous: Lemma 3.12 … |
| /66 | low | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json items … | Item /17 records Lemma 3.11 as three 'only if' statements, as printed. Theorem 3.5 and item /15 need the converse: if H is not a translate of [−1]^*H, then … |
| /67 | low | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json items … | Item /24 starts 'Assume Y_η is not translation-invariant…' without the standing setup: X a variety over ℂ, Y ⊆ X × A a family of smooth hypersurfaces with … |
| /68 | low | other | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json … | Besides the Lemma 4.8, Proposition 4.11, Theorem 3.5(1)/Lemma 3.10 and base-field issues above, §§3–4 contain misprints that should be recorded under §18. (1) … |
| /69 | low | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.md, 'Eulerian … | The report says the check identified 'A(n,q) with (−1)^{n−1−q} χ(H, Ω^q_H)'. Lemma 3.4 has the factor d: χ(H,Ω^q_H) = (−1)^{n−1−q}·d·A(n,q). The report's … |
| /70 | low | other | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json … | Definition 5.44 prints the adjoint Hodge numbers as h^a = dim F^aV/F^{a−1}V. For the descending filtrations of Definition 5.40, F^{a−1} ⊇ F^a, so the quotient … |
| /71 | low | other | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json … | Four further slips in §5, none of them recorded. (a) §5.10 opens 'Compare also [48, Lemma 2.4], which applies when G is a connected reductive group', but the … |
| /72 | low | other | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item … | Lemma 5.12 makes Hodge–Deligne systems on X a Tannakian category 'with fiber functor given by V_sing,x for some x ∈ X(C)'. That functor is faithful only when … |
| /73 | low | other | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item … | Item /30 defines G_mon through Picard–Vessiot rings and puts that theory in the arithmetic Part II. Picard–Vessiot theory is a general foundation that no … |
| /74 | low | missing | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item /38 | Item /38 omits two facts from §5.8.2 that the proof of Lemma 5.42 relies on. First, the subgroups P and U attached to a filtration coincide with the Richardson … |
| /75 | low | other | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json … | The prerequisite for complete reducibility cites Bate–Martin–Röhrle, 'A geometric approach to complete reducibility', Invent. Math. 161 (2005) [5], with BHMR … |
| /76 | low | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item …; … | /58 copies the paper's 'T_G', but no group G is defined in Theorem 8.17. Under Definition 5.45's convention the natural reading is G = G⁰_dR, which gives the … |
| /77 | low | other | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json …; … | sourceIssues misses these misprints in §§8-9, all checked on the page images. (a) Theorem 9.2 typesets the n = 3 hypothesis as 'd is not C(a(i)+a(i+1), … |
| /78 | low | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json …; … | From §6.1 onward several page locators are wrong, and readSections gives wrong page ranges and the wrong title for §7. Since PDF page = printed page here, the … |
| /79 | low | missing | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item /4 … | The proof of Theorem 9.6 uses more than Faltings's theorem, and /4 records none of it and cross-references nothing (planned []). It uses: adjunction, which … |
| /80 | low | other | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.md, outline …; … | The report says 'A short induction on the dimension of the closure finishes the proof'. There is no induction. The argument is run once on each of the finitely … |
| /81 | low | other | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json … | Several statement-level slips in Appendices B–C are not in sourceIssues. (a) Lemma B.10's '<' is false when m_H(w−1)m_H(w+1) = 0. This happens for every n = 2 … |
| /82 | low | other | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json … | Misprints in Appendices A–B, all verified on the page images, each with a clear intended meaning, none recorded. A.4 proof: 'a_i < 1/(2·3^j) for all i > j' … |
| /83 | low | error | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item /65 | The item says 'm_H(w+1) ≥ A(n,1)/(2(n−1)) ≥ 4'. The second inequality is false at n = 5, where A(5,1)/(2·4) = 26/8 = 3.25. The paper gets m_H(w+1) ≥ 4 from … |
| /84 | low | library-claim | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json item /80 | All four cited declarations exist at 082e2d3 and say what the note says, so the status 'library' stands. But the list does not back the statement. The … |
| /85 | low | other | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json route 1 … | PROTOCOL §16 asks briefs to name imports by title and id, and the task asks for stage ids. Three imports give only a roadmap. Brief 1 has 'the Tau Ceti roadmap … |
| /86 | low | duplicate | research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json route 1 …; … | Six Part II items are the disconnected or Hodge–Deligne generalisations of LV statements that PAPER-LAWRENCE-VENKATESH-20 routes to the same … |

## Notes for the fix job

- **Statements first.** Fix the seven high findings in the items before anything is planned: Q̄_p coefficients (/1), N =
  [H]^n (/2), G^c (/3), Lemma 4.8 and Corollary 4.10 restricted to characters of order prime to p, with a sourceIssue
  (/4), Lemma A.5 (/5), and the ratio N(m^a_1)/N(m_0) in /63–/64 (/6).
- **The transcendence input.** Route 3 and item /76 cannot rest on LD.6 (/7). Either a new owner plans
  Bakker–Tsimerman’s Ax–Schanuel theorem for variations of Hodge structure, or the Part II plans it; in both cases Lemma
  6.3 stays with the Part II, next to the overlapping Lawrence–Venkatesh Corollary 9.2.
- **sourceIssues is empty.** The red team found genuine errors and gaps in the paper (Lemma 4.8, Definition 9.1, Lemma
  5.29, Example 5.17, Lemma 6.5, Proposition 4.11, Lemma A.1, Lemmas 8.14 and 5.49, the resolution step of §9) and many
  misprints; record each with its correction and use the corrected statements in the items.
- **Owners.** Point the items that other stages already plan at those stages: Weil numbers (DWP.0), Lemma 8.1 and
  complete reducibility (LV.1), Weil restriction (A6, RG2.0a), variations of Hodge structure (ShimuraData D3); and give
  Appendix C one owner.
