# RT-PAPER-LESLIE-25

Red team of the accepted extraction PAPER-LESLIE-25: Spencer Leslie, *The endoscopic fundamental lemma for unitary
Friedberg–Jacquet periods*, Annals of Mathematics 201 (2025), 551–645 (arXiv 1911.07907v3). Issue #4033.

Red team: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write or review:
- the extraction (`cc-39fac3`, PR #2088);
- its review, REV-PAPER-LESLIE-25 (`cc-7b31c4`, PR #2384).

**Result: 65 findings, 5 high, 26 medium and 34 low.**

## Method

**The source.** arXiv 1911.07907v3, the accepted version (<https://arxiv.org/abs/1911.07907v3>), was re-downloaded on
2026-10-01 with its LaTeX source. Its SHA-256 is `167574c8…b682b76`, equal to the extraction's. The published Annals
text is paywalled and was not read.

**The passes.** All 89 pages were read against the extraction in five parallel passes run by this session:
- §§1–2 (pp. 1–22);
- §§3–5 (pp. 22–43);
- §§6–8 (pp. 43–64);
- §§9–11 and the bibliography (pp. 64–89);
- the routes and statuses, against `data/atlas.json`, the blueprint packets, other papers' accepted routes,
  `make_queue.py` and the pinned libraries.

**Cited sources.** The §§3–5 pass read Beuzart-Plessis, arXiv:1901.02653v3, to check Proposition 5.1 and the Weil
representation.

**Merging.** I merged findings reported by more than one pass: Propositions 7.8 and 10.4, global base change for GL_n,
the residue-characteristic dependence of Lemma 10.6, the GN.2 statuses of items 30 and 111, the multiplicity-one clause
of item 76, and the MP.2 status of item 52.

**What I re-verified myself, in the TeX:**
- the matching definitions of §2.2.3 and Definition 2.10, and the n = 2, a = b = 1 case, where U(1) acts trivially;
- that §3.2 defines X_n^rss for the U(V_n)-action while Theorem 5.3 needs the U(V_{n−1}) notion (the source carries the
  author's commented note "I need better notation" at this display), and that Y = (2, b; b̄, 0) with Nm b = −1 is not
  semisimple;
- that §5.1 gives the unitary Weil representation only as "similar" to the linear one;
- the twist of the Rankin–Selberg periods in the proof of Theorem 9.11, against the definition of λ^η in §8.2;
- that the support region G[w_n, w_{n+1}] is carried onto the region of the both-non-split pair by right translation by
  an h with η(det h) = −1.

**Scope of the high findings.** All five are gaps or slips with repairs proposed in their fixes; none is known to refute
the paper's main theorem. The full list of what was checked is in the result's `checked` field.

## The high findings

### /1 — error

**Where.** PAPER-LESLIE-25/16, PAPER-LESLIE-25/20 (and through them PAPER-LESLIE-25/17, /21, /34); sourceIssues

**Claim.** The definitions of smooth transfer recorded in items 16 (endoscopic transfer on Herm(W_1), §2.2.3) and 20
(Definition 2.10) copy the paper's condition (2) verbatim. That condition quantifies over every regular semisimple
element of the endoscopic space, including elements that are H-regular but not G-regular: (y_a, y_b) where y_a and y_b
share an eigenvalue, or (δ_a, δ_b) where r(δ_a) and r(δ_b) do. No regular semisimple y or δ matches such an element, so
condition (2) forces SO = 0 (resp. SRO = 0) there. This is false for the paper's own matching functions. Read literally,
Theorem 3.5 (item 34) and Theorem 2.12 (item 21) are false, and the definitions are inconsistent with the
Laumon–Ngô/Waldspurger convention under which Theorem 2.9 (item 17) is proved. Counterexamples, with E/F unramified, n =
2 and a = b = 1. (i) Theorem 3.5 with φ = 1_{K_{2,E}}: ξ_(1,1)(1_{K_{2,E}}) = 1_{K_{1,E}} ⊗ 1_{K_{1,E}} (the d = 0 case
of (3.9)), so ξ_(1,1)(φ) ∗ 1_0 = 1_{O_F^×} ⊗ 1_{O_F^×} on X_1 × X_1 = F^× × F^×. The point (y_a, y_b) = (1, 1) ∈
Herm(V_1) ⊕ Herm(V_1) = F ⊕ F is regular semisimple: its centralizer U(1) × U(1) is a maximal torus. But φ_{1,1}(1, 1) =
I_2 is central, so no regular semisimple y ∈ Herm(V_2) matches it, while SO(ξ_(1,1)(φ) ∗ 1_0, (1, 1)) = 1 ≠ 0. (ii)
Theorem 2.12 with (α, β) = (I_1, I_1): in 𝔲(V_1 ⊕ V_1)_1 ⊕ 𝔲(V_1 ⊕ V_1)_1 = E ⊕ E, the element (δ_a, δ_b) = (1, 1) has
closed orbit E^1 × E^1 of maximal dimension, so it is regular semisimple. Here r_{α,β}(1, 1) = (−1, −1), and r(δ) = −I_2
is impossible for δ ∈ End(V_2)^rss, since r(δ) has distinct eigenvalues by Lemma 2.4. So no δ matches, yet
SRO(1_{End(Λ_1)} ⊗ 1_{End(Λ_1)}, (1, 1)) > 0. The introduction's definition (p. 4) has only the matching identity, so
Theorem 1.3 as printed is unaffected.

**Evidence.** §2.2.1, p. 17: 'Let y ∈ Herm(W_1) and (y_a, y_b) ∈ Herm(V_a) ⊕ Herm(V_b) be regular semi-simple.' §2.2.3,
p. 19: '(2) if there does not exist y matching (y_a, y_b), then SO(f_{a,b}, (y_a, y_b)) = 0.' Definition 2.10, p. 21:
'(2) If there does not exist δ matching (δ_a, δ_b), then SRO(f_{α,β}, (δ_a, δ_b)) = 0.' §1.5.1, p. 9: 'x ∈ Y^rss … if
and only if its G-orbit is of maximal possible dimension and is closed'. §1.5.4, p. 12: 'an element δ is regular
semi-simple if its centralizer is a maximal torus'. Proof of Lemma 2.4, p. 16: π(X, Y)(t²) = det(tI_{2n} − Z), and Z is
regular semisimple iff this polynomial has distinct roots. Theorem 2.12, p. 21: 'If (α, β) = (I_a, I_b), the functions
1_{End(Λ_n)} and 1_{End(Λ_a)} ⊗ 1_{End(Λ_b)} match.' The paper contains no G-regularity qualifier anywhere.

**Fix.** In items 12, 16 and 20 (and in the briefs that quote them), restrict the endoscopic elements to G-regular ones.
Call (y_a, y_b) ∈ [Herm(V_a) ⊕ Herm(V_b)]^rss G-regular when φ_{a,b}(y_a, y_b) is regular semisimple in Herm(W_{a,b}),
equivalently when char(y_a) and char(y_b) are coprime; call (δ_a, δ_b) G-regular when r_{α,β}(δ_a, δ_b) is. Then state
condition (2) as: 'if (y_a, y_b) is G-regular and no y matches it, then SO(f_{a,b}, (y_a, y_b)) = 0', and likewise for
SRO. Items 17, 21 and 34 then hold as stated. Record this as a new sourceIssue: kind error; locator §2.2.3, p. 19 and
Definition 2.10, p. 21; affects a stated result (Theorems 2.12 and 3.5 as literally defined); the intended meaning is
the standard (G, H)-regular convention of [LS87] and [LN08].

### /2 — error

**Where.** PAPER-LESLIE-25/56

**Claim.** The item copies Theorem 5.3's case split 'X matches Y ∈ X_n^rss … 0 otherwise'. But X_n^rss is defined in
§3.2 as X_n ∩ Herm(V_n)^rss, the locus that is regular semisimple for U(V_n)-conjugation. The matching in Theorem 5.3 is
the (4.7)-matching of GL_{n−1}(F) on gl_n(F) against U(V_{n−1}) on Herm(V_n), whose regular semisimple elements are the
relatively regular semisimple ones. These need not be semisimple. Read with the §3.2 definition, the '0 otherwise'
branch is false. Counterexample: n = 2, E/F unramified, odd residue characteristic, φ = 1_{K_{2,E}} (so BC(φ) =
1_{GL_2(O_F)} and φ ∗ 1_0 = 1_0). Choose b ∈ O_E^× with Nm b = −1 and put Y = (2, b; b̄, 0) ∈ Herm(V_2). Then det Y = 1
and the characteristic polynomial is (t − 1)^2, while Y ≠ I. So Y is not semisimple and lies outside X_2^rss. On the
other hand (y, w) = (2, b) is regular semisimple in Herm(V_1) × V_1 (⟨w, w⟩ ≠ 0), and Y ∈ X_2(O_F), so Orb^{U(V_1)}(1_0,
Y) = 1. The matching X = (2, 1; −1, 0) ∈ GL_2(F) gives ω(X) Orb^{GL_1(F),η}(1_{GL_2(O_F)}, X) = η(−1) ∫_{O_F^×} η(t) dt
= 1 ≠ 0. Also, 'X ∈ GL_n(F)^rss' needs the relative (GL_{n−1}) notion.

**Evidence.** v3 p. 26, §3.2: 'Set X_n^rss = X_n ∩ Herm(V_n)^rss; this agrees with the invariant-theoretic notion of
regular semi-simple locus of X_n as a U(V_n)-variety.' p. 43, Theorem 5.3: 'for any X ∈ GL_n(F)^rss, we have ω(X)
Orb^{GL_{n−1}(F),η}(BC(ϕ), X) = Orb^{U(V_{n−1})}(ϕ ∗ 1_0, Y) : X ↔ Y ∈ X_n^rss, 0 : otherwise.' The same display is
repeated on p. 86 (§11.2). In the LaTeX source of v3, this display carries a commented-out footnote at exactly this
spot: '%\footnote{I need better notation}'. Theorem 1.7 (p. 8) states the result correctly: '{(ϕ ∗ 1_0), 0} and BC(ϕ)
are transfers of each other with respect to the matching (4.7)'.

**Fix.** Restate item 56 in the form of Theorem 1.7. Hypotheses: E/F unramified, φ ∈ ℋ_{K_{n,E}}(GL_n(E)). Conclusion:
{φ ∗ 1_0, 0} and BC(φ) are Jacquet–Rallis transfers in the sense of (4.7), with gl_n(F) and Herm(V_{n−1} ⊕ Ee_0) in
place of gl_{n+1}(F) and Herm(V_n ⊕ Ee_0). Pointwise: let X ∈ gl_n(F) be relatively regular semisimple for GL_{n−1}(F).
If X matches a relatively regular semisimple Y ∈ Herm(V_{n−1} ⊕ Ee_0) = Herm(V_n), then ω(X) Orb^{GL_{n−1}(F),η}(BC(φ),
X) = Orb^{U(V_{n−1})}(φ ∗ 1_0, Y). If X matches an element of Herm(V′_{n−1} ⊕ Ee_0), the left side is 0. Record a
sourceIssue (misprint/notation, affects nothing) at p. 43 and p. 86.

### /3 — error

**Where.** PAPER-LESLIE-25/52; PAPER-LESLIE-25/53

**Claim.** Items 52 and 53 assert, for every Hermitian space V (and, implicitly, any quadratic E/F), that W(1, t; 0, 1)φ
= ψ(t q)φ together with W(0, 1; −1, 0)φ = Fφ defines a Weil representation of SL_2(F) on C_c^∞(Herm(V) × V). They also
assert that the linear and unitary representations descend to orbital integrals and coincide. This is false for the
non-split space V′.  The Weil representation of SL_2(F) attached to the quadratic space (V, ⟨w, w⟩) has r(w) = γ_ψ(q_V)
F, with γ_ψ the Weil index. In SL_2 one has w = n(1) w^{-1} n(1) w n(1). Hence r(w) = N F^{-1} N F N, with N the
multiplication by ψ(q), and this pins down the scalar in front of F. As F-quadratic spaces, V_n = ⊕(E, Nm) and V′_n =
⊕^{n−1}(E, Nm) ⊕ (E, ϖNm). Since γ_ψ(ψ_a ∘ Nm) = η(a) γ_ψ(Nm) and γ = 1 for (E, Nm) when E/F and ψ are unramified,
γ(V_n) = 1 and γ(V′_n) = −1. So on Herm(V′) × V′ the operator must be −F. A finite-field check of the same relation (F_5
hyperbolic plane versus the anisotropic norm form of F_25) confirms that exactly one scalar works and that the two signs
differ.  The cited source has a narrower hypothesis. Beuzart-Plessis's Proposition 1 is stated only for E/F unramified,
ψ unramified and the identity Hermitian form, and it uses γ_ψ(q) = 1 explicitly. It also uses Zhang's Fourier constant ν
= 1, which holds only in the unramified case. The paper itself applies Proposition 5.1 only to V_n split with E/F
unramified, so the proof of Proposition 5.2 is unaffected.

**Evidence.** v3 p. 40, §5.1: 'Now fix an additive character ψ : F → C^× of conductor O_F. Let V be an n-dimensional
Hermitian space … These transforms induce a Weil representation of SL_2(F) on these function spaces in the standard way
… W(0 1; −1 0)φ = Fφ … The formulas are similar for the unitary case.' p. 41, Proposition 5.1 ([BP21b, Proposition 1]):
'The Weil representations on C_c^∞(gl_n(F) × F^n × F_n) and C_c^∞(Herm(V) × V) descend … Moreover, these latter
representations coincide on the intersection.' Beuzart-Plessis, arXiv:1901.02653v3 (Duke 2021), §1: 'Let E/F be an
unramified quadratic extension'; 𝔥_n uses the identity form. §3: '(E^{n−1}, q) as an orthogonal direct sum of quadratic
planes of the form (E, N_{E/F}) and E/F is unramified … the Weil's constant γ_ψ(q) equals one in both cases'. Also:
'Zhang's [Theorem 4.17] … transfer commutes with F up to a constant ν … equal to 1 in the unramified case we are
considering'.

**Fix.** Restrict items 52 and 53 to E/F unramified, ψ of conductor O_F and V = V_n split, which is the case BP prove
and the case Proposition 5.2 uses. Alternatively, for general V, define W(0, 1; −1, 0) = γ_ψ(q_V) F on the unitary side,
with γ_ψ(q_V) = λ(E/F, ψ)^n η(det V), and include Zhang's constant. Record a sourceIssue (gap; affects nothing) at §5.1,
pp. 40–41: Proposition 5.1 is stated for arbitrary V and E/F without the Weil constant, while the cited result covers
only the unramified split case.

### /4 — error

**Where.** PAPER-LESLIE-25/97 (also /104, /105, /106; sourceIssues)

**Claim.** The step that turns (9.4) into the per-representation identity (9.5) uses a false local identity, and the
extraction does not record it. The proof of Theorem 9.11 asserts I_{π_v η_{v,i,j}}(f_v) = I_{π_v}(f_v·η_{v,i,j}) for the
G-characters η_{i,j}(g_1,g_2) = η(det g_1)^i η(det g_2)^j, and deduces Σ_{(i,j)} I_{πη_{i,j}}(f) = 4 I_π(f). The
identity fails for (i,j) = (1,0) and (0,1) at every nonsplit place. By the paper's own definition λ^η_{Π_n⊠Π_{n+1}} :=
λ_{Π_n·η⊠Π_{n+1}} (end of §8.2, p. 59), twisting by η_{1,0} or η_{0,1} restricts on H = GL_n to η(det h). This makes
λ_{πη_{1,0}} = λ^η_π and λ^η_{(πη_{1,0})^} = λ_{π̂}, so I_{π_vη_{1,0}}(f_v) = Σ_W λ^η_{π_v}(π_v(f_vη_{1,0})W)
λ_{π̂_v}(Ŵ)/[W,Ŵ]. That is the relative character with the η-twist moved to the other period. It is (H,η)-equivariant on
the left and H-invariant on the right, while I_{π_v} is H-invariant on the left and (H,η)-equivariant on the right.
Equality for all f_v would give I_{π_v}(R(h)F) = I_{π_v}(F) = η_v(det h) I_{π_v}(F), so I_{π_v} ≡ 0, contradicting the
nonvanishing quoted on p. 73. Restricting to f_v supported in G_v[x,y] does not rescue the identity: when π_v restricted
to {η(det g_1) = η(det g_2) = 1} is irreducible, π_v(C_c^∞) is all finite-rank smooth operators there, and the two
characters correspond to the non-proportional tensors λ⊗λ^η_{π̂} and λ^η⊗λ_{π̂}. Consequences: (9.5) is not established.
Neither is the step 'J^{x,y}_Π(f′) = 4I_π(f)' in the proof of Proposition 10.7 (p. 77), whose previous line also drops
the 4. Corollary 10.8 and the paper's route to (11.6) in the proof of Theorem 11.1 (p. 85) rest on these. What (9.4)
actually gives is only 4∏_v J^♮_{Π_v}(f′_v) = Σ_{(i,j)} ∏_v I^♮_{π_vη_{i,j,v}}(f_v).

**Evidence.** Theorem 9.11 proof, p. 72: 'Considering the local distribution I_{π_v}, we have I_{π_vη_{v,i,j}}(f_v) =
I_{π_v}(f_v·η_{v,i,j}). Combining this with the product formula (8.14) implies that Σ_{(i,j)} I_{πη_{i,j}}(f) =
Σ_{(i,j)} I_π(f·η_{i,j}) = 4I_π(f).' §8.2, p. 59: 'λ^η_{Π_n⊠Π_{n+1}} = λ_{Π_n·η⊠Π_{n+1}}'. §10.1, p. 73: 'for any
generic representation π, the relative character I^♮_π is a non-zero distribution [JPSS]'. Proposition 10.7 proof, p.
77: '1/L(1,η)² J^{x,y}_Π(f′) = I_π(f)' followed by 'CJ^{x,y,♮}_{Π_{v0}}(f′_{v0}) = J^{x,y}_Π(f′) = 4I_π(f) =
C′I^♮_{π_{v0}}(f_{v0})'. Proof of Theorem 11.1, p. 85: 'the argument in the proof of Theorem 9.11 implies that this
reduces to showing that for any such π, (11.6)', then 'Theorem 9.11 tells us … (9.5)' and 'Corollary 10.8 now tells us
…'.

**Fix.** (1) Add a new sourceIssue: kind error, affects 'the proof', locator 'Theorem 9.11 proof, p. 72'. Quote the
printed identity. The correction: for i+j odd, I_{π_vη_{v,i,j}}(f_v) is the swapped character Σ
λ^η_{π_v}(π_v(f_vη_{v,i,j})W)λ_{π̂_v}(Ŵ)/[W,Ŵ], not I_{π_v}(f_vη_{v,i,j}); give the equivariance argument above as the
reason. (2) Item 97: keep (9.4). Mark (9.5) as asserted but not established by the printed proof. It needs ∏_v
I^♮_{π_vη_{i,j,v}}(f_v) = ∏_v I^♮_{π_v}(f_v) for f_v supported in G_v[x,y] that match only (x,y), and the paper gives no
argument for this. (3) Items 104 and 105: same note; they are not needed downstream once (4) is used. (4) Item 106:
record a proof of the matching (11.2) that avoids (9.5), Proposition 10.7, Corollary 10.8 and the FLO normalization of
Lemma 8.6 (odd residue characteristic). Apply (9.4) to the efficient pair (1_{K′_{v0}}⊗f′^{v0}, 1_{K_{v0}}⊗f^{v0}),
which matches at v_0 by Theorem 7.12. Π(φ⊗f′^{v0}) = Sat(φ)(Π_{v0})·Π(1_{K′}⊗f′^{v0}), so J_Π(φ⊗f′^{v0}) =
Sat(φ)(Π_{v0}) J_Π(1_{K′}⊗f′^{v0}). Likewise, for each π ∈ B(Π), BC(π_{v0}) = Π_{v0} gives I_π(BC(φ)⊗f^{v0}) =
Sat(φ)(Π_{v0}) I_π(1_K⊗f^{v0}). Hence (1/L(1,η)²)J_Π(f̂′) = Σ_{π∈B(Π)} I_π(f̂) for every Π. The same holds class by
class for the classes with no cuspidal Π, which vanish by Proposition 9.9. With Lemma 9.4 and Proposition 9.6 this gives
Orb^η_ω(f̂,a) = Orb_{ω′}(f̂′,b).

### /5 — error

**Where.** PAPER-LESLIE-25/106 (vanishing part); PAPER-LESLIE-25/107; PAPER-LESLIE-25/56

**Claim.** The vanishing part of Theorem 11.1 is not proved for orbits matching the non-split pair of the same parity.
Write (x_0,y_0) = (w_n,w_{n+1}) and (x_1,y_1) for the pair with both forms non-split. The paper derives vanishing at
every (x,y) outside the G′(F)-orbit of (w_n,w_{n+1}) from supp BC(φ) ⊂ G[w_n,w_{n+1}]. That support condition only fixes
η(det x)η(det y): an orbit matching (x,y) has η(det γ_1^{-1}γ_2) = η(det x)η(det y) (proof of Lemma 7.11). So it kills
(x_0,y_1) and (x_1,y_0) but not (x_1,y_1). Every H(F)×H(F)-orbit meets both G[x_0,y_0] and G[x_1,y_1]: right translation
by h ∈ H with η(det h) = −1 swaps them. Which of (x_0,y_0), (x_1,y_1) an orbit matches is decided by the Jacquet–Rallis
invariant (the class of det(c A^{i+j} b)), not by the support. Example (n = 1): g = (1, b; c, 1) with bc = ϖ has unit
determinant but non-norm cb, so it matches (x_1,y_1). The global argument of §11.1 treats only pairs γ ↔^{w_n,w_{n+1}} δ
('We may thus focus on matching pairs γ ↔^{w_n,w_{n+1}} δ'). §11.2 takes the 'otherwise 0' of Theorem 5.3 (= Theorem
1.7) from this vanishing. For X matching U(V′_{n−1}) with V′ non-split, the case (x_1,y_1) is needed. So the chain to
Proposition 1.6, Theorem 3.5 and Theorem 2.12 has a gap.

**Evidence.** P. 78: 'Note that for ϕ ∈ H_{K′}(G′(F)), we automatically have supp(BC(ϕ)) ⊂ G[w_n,w_{n+1}]. In
particular, if γ ↔^{x,y} δ for some (x,y) not in the G′(F)-orbit of (w_n,w_{n+1}), then Orb^η(BC(ϕ),γ) = 0, giving the
vanishing statement of the theorem. We may thus focus on matching pairs …'. Lemma 7.11 proof, p. 56: 'the support of
f̃′_{x,y} lies in X^y_{y(x)} = {h ∈ X_{y(x)} : η(det(h)) = η(det(x))η(det(y)) = (−1)^{k(x,y)}}' and 'p(G[x_0,y_0]) =
p(G[x_1,y_1]) = G_0'. §11.2, p. 86: 'the vanishing component of Theorem 11.1 gives the correct vanishing of orbital
integrals for BC(ϕ), completing the proof of Theorem 5.3.'

**Fix.** Record a new sourceIssue: kind gap, affects 'the proof', at p. 78. In items 106 and 107, replace the note 'The
vanishing part is immediate from supp(BC(φ)) ⊂ G[w_n,w_{n+1}]' with: immediate only for the two pairs with η(det x det
y) = −1; for (x_1,y_1) a proof is required. Supply one by rerunning §11.1 with a global Hermitian pair (𝔵,𝔶) whose
component at v_0 is (x_1,y_1). Such a pair exists: take it non-split at v_0 and at one further non-split place, split
elsewhere. Take f̂′ = 0 at v_0. The unit-pair argument of RT-PAPER-LESLIE-25/4 then gives Σ_{π∈B(Π)} I_π(BC(φ)⊗f^{v0}) =
Sat(φ)(Π_{v0})·Σ_{π∈B(Π)} I_π(1_K⊗f^{v0}) = 0, because Theorem 7.12 matches 1_K with 0 at (x_1,y_1). Hence
Orb^η_ω(BC(φ),γ) = 0; Lemma 11.2's Fourier inversion and local constancy finish the argument. Add a dependency note on
item 56 that its 'and 0 otherwise' needs this case.

## All findings

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | error | PAPER-LESLIE-25/16, PAPER-LESLIE-25/20 (and through them …; … | The definitions of smooth transfer recorded in items 16 (endoscopic transfer on Herm(W_1), §2.2.3) and 20 (Definition 2.10) copy the paper's condition (2) … |
| /2 | high | error | PAPER-LESLIE-25/56 | The item copies Theorem 5.3's case split 'X matches Y ∈ X_n^rss … 0 otherwise'. But X_n^rss is defined in §3.2 as X_n ∩ Herm(V_n)^rss, the locus that is … |
| /3 | high | error | PAPER-LESLIE-25/52; … | Items 52 and 53 assert, for every Hermitian space V (and, implicitly, any quadratic E/F), that W(1, t; 0, 1)φ = ψ(t q)φ together with W(0, 1; −1, 0)φ = Fφ … |
| /4 | high | error | PAPER-LESLIE-25/97 (also /104, /105, /106; … | The step that turns (9.4) into the per-representation identity (9.5) uses a false local identity, and the extraction does not record it. The proof of Theorem … |
| /5 | high | error | PAPER-LESLIE-25/106 (vanishing part); … | The vanishing part of Theorem 11.1 is not proved for orbits matching the non-split pair of the same parity. Write (x_0,y_0) = (w_n,w_{n+1}) and (x_1,y_1) for … |
| /6 | medium | missing | items (none for §1.5.1); … | §1.5.1 sets up the invariant theory on which the whole relative theory rests, and no item records it. Its contents are: - the invariant-theoretic regular … |
| /7 | medium | missing | PAPER-LESLIE-25/5, PAPER-LESLIE-25/6 (no item for the cited criterion) | Proposition 2.1 and Lemma 2.2 assert categorical quotients and are proved by Igusa's criterion, cited from [Zha14b, §3]. The extraction mentions the criterion … |
| /8 | medium | missing | PAPER-LESLIE-25/10 (no item for the cited principle) | Item 10 states that r_!(f)(r(x)) = ∫_{U(W_2)} f(xu) du converges, lies in C_c^∞(Ω), and that r_! is surjective onto C_c^∞(Ω) and onto C_c^∞(Ω_reg). The paper … |
| /9 | medium | missing | PAPER-LESLIE-25/15, PAPER-LESLIE-25/50; … | The truth of Theorems 2.12 and 3.5 depends on how the transfer factor is normalized, and the extraction does not pin the normalization the proof uses. … |
| /10 | medium | error | PAPER-LESLIE-25/1 | Item 1 is marked planned at AdelicAlgebraicGroups:AA.2, but its statement includes local results that AA.2 does not plan. AA.2 plans only the general recipe: … |
| /11 | medium | error | PAPER-LESLIE-25/22 | The item reproduces the Satake transform (3.1) as printed: ∏/a_i/_E^{s_i − (n+1−2i)/2} with the Iwasawa decomposition g = nak. With this sign the transform is … |
| /12 | medium | error | PAPER-LESLIE-25/26; … | Item 26 states the Hall–Littlewood polynomial as P_λ(x; t) = V(t) Σ_{σ∈S_n} σ(x^λ ∏_{λ_i>λ_j} (x_i − t x_j)/(x_i − x_j)), with V(t) Macdonald's rational … |
| /13 | medium | error | PAPER-LESLIE-25/51 | Proposition 4.8 is extracted with its hypothesis only in rank n ('for every φ ∈ ℋ_{K_{n,E}}(GL_n(E))'). The proof also applies the hypothesis in ranks a and b. … |
| /14 | medium | missing | PAPER-LESLIE-25/51 (proof, p. 39); … | Two problems in the proof of Proposition 4.8: (1) It uses the identity BC(ξ_(a,b)(φ)) = ξ′_(a,b)(BC(φ)), with ξ′_(a,b)(f′) = μ′_b(det m_1) μ′_a(det m_2) … |
| /15 | medium | missing | PAPER-LESLIE-25/53 (cited input) | No item for W. Zhang's compatibility of Jacquet–Rallis transfer with the partial Fourier transform [Zha14b, Theorem 4.17]. The paper invokes it by name as the … |
| /16 | medium | missing | PAPER-LESLIE-25/54 (proof, pp. 42–43) | The heart of the third reduction is the identity (5.1). It says that for /q(a)/ = 1, O(a, (φ ∗ 1_0) ⊗ 1_{Λ_n}) = Orb^{U(V_{n−1})}(φ ∗ 1_0, y) and O(a, BC(φ) ⊗ … |
| /17 | medium | error | PAPER-LESLIE-25/57 | The item copies the paper's involution g^θ = w_n ᵗg^{-1} w_n and the claim U(V_n) = Res_{E/F}GL_n^{θ∘σ}. For even n this is not a group automorphism: w_n^2 = … |
| /18 | medium | error | PAPER-LESLIE-25/58 | Take w_n = antidiag(1, −1, …, (−1)^{n−1}). Then θ preserves the generic character ψ_0. For u ∈ N_n, u^θ = w_n ᵗu^{-1} w_n^{-1} ∈ N_n carries each superdiagonal … |
| /19 | medium | error | PAPER-LESLIE-25/82 | Items 82 (Proposition 8.7) and 78 (Jacquet's distinction theorem) omit the hypothesis that Π = BC(π) is cuspidal, equivalently π ≇ π⊗η. In §8.3 the paper … |
| /20 | medium | missing | PAPER-LESLIE-25/80 | The FLO functionals α^{π_v} are given only for tempered π_v: Theorem 8.5, and the space E(X_n, W(Π_v)^*) is introduced only for Π_v ∈ Temp. Yet they are used … |
| /21 | medium | missing | PAPER-LESLIE-25/80 | No item defines the notion of transfer that Theorem 8.5 quantifies over: 'transfers in the sense of [FLO12, §3]', which match test functions on GL_n(F_v) with … |
| /22 | medium | error | PAPER-LESLIE-25/109 (Proposition 11.4 (11.4) and part (2)); … | §11 conflates two different families both written η_{i,j}. Lemma 9.4 and Proposition 9.5 twist the central character: ω_{i,j} = ω·η(z_1)^iη(z_2)^j on Z_G. … |
| /23 | medium | error | PAPER-LESLIE-25/101 (Proposition 10.4); … | With the paper's involution g^θ = w_n ᵗg^{-1} w_n, θ does not preserve H = {(h, diag(h,1))}: θ(diag(h,1)) = ±diag(1, ·), so θ(H) = γ_0Hγ_0^{-1} for a signed … |
| /24 | medium | error | PAPER-LESLIE-25/103 (Lemma 10.6); … | Lemma 10.6 is false for (x,y) ∈ G′(F)∗(w_n,w_{n+1}) as printed. Its proof needs α^{π,♮}_{x,y}(W_0) = 1. Lemma 8.6 (= [FLO12, Lemma 3.9]) gives this only for x … |
| /25 | medium | error | PAPER-LESLIE-25/110 (Lemma 11.5); … | Lemma 11.5 lacks a hypothesis and its proof is incomplete. From b ∈ K′_v the proof gets only integrality of the invariants of bz, and concludes 'this forces … |
| /26 | medium | error | PAPER-LESLIE-25/108 (Lemma 11.3) | As proved, Lemma 11.3 does not give global elements matching with respect to (w_n,w_{n+1}), which Proposition 11.4 and the comparison of J^{w_n,w_{n+1}}_{ω′} … |
| /27 | medium | error | PAPER-LESLIE-25/109 (Proposition 11.4: auxiliary places S_aux) | The separation of the finitely many orbits in Q_f ⊂ H(F)\G(F)^{Z-rss}/Nm(Z_{G′}(F))H(F) compares raw invariants c_i of rational representatives with c_i(C[l]). … |
| /28 | medium | missing | PAPER-LESLIE-25 items (new); … | There is no item for the global base change facts for GL_n that §9.4 and §11 use. The paper cites [AC89] for them only in §6.3 (local). Used: (a) a cuspidal Π … |
| /29 | medium | missing | PAPER-LESLIE-25 items (new); … | The globalization steps of §11.1 have no items. (i) Given an unramified quadratic extension E/F of p-adic fields of characteristic 0, there is a quadratic … |
| /30 | medium | error | routes 1 (UnitaryFriedbergJacquetRelativeEndoscopy) and 2 …; … | The extraction says the two Part IIs depend on each other in one direction only. They don't. Route 1 imports route 2: Theorem 11.1, the Lie-algebra … |
| /31 | medium | duplicate | items PAPER-LESLIE-25/74 and PAPER-LESLIE-25/75 (route 2) | Items 74 and 75 are pure GL_n Rankin–Selberg facts. Item 74 is the canonical local pairing [W, Ŵ′] = L(n, 1)∫_{N_n\P_n} W Ŵ′ /det/^s: holomorphic at s = 0, … |
| /32 | low | error | PAPER-LESLIE-25/15 | In the general case, item 15 writes Δ = κ(inv(δ, δ′))·η_{E/F}(D(δ))/D(δ)/_F without saying which character κ is meant. Here inv(δ, δ′) lies in H^1(F, T_δ), and … |
| /33 | low | other | PAPER-LESLIE-25/15 (Remark 2.8); … | Remark 2.8, copied into item 15, calls D(δ) = ∏(x_a − x_b) 'precisely the quotient of the standard Weyl discriminants' in Δ_IV of [LS87]. That is not right. … |
| /34 | low | other | PAPER-LESLIE-25/1; … | §1.5.4 defines c(ψ) at an archimedean place using Tr_{E/ℝ}(ax), but ψ is a character of F and x ∈ F. If E/F is a field, Tr_{E/ℝ}(ax) = 2 Tr_{F/ℝ}(ax), and then … |
| /35 | low | other | PAPER-LESLIE-25/2; … | Lemma 1.8 states T_δ ≅ Z_{U(V)}(F)·E[δ]^×/F[δ]^× and T_{S_1} ≅ Z_{U(V)}(F)·∏_{S_1}E_i^×/F_i^× × ∏_{S_2}O_{F_i}^×, and item 2 copies both. The factor … |
| /36 | low | error | PAPER-LESLIE-25/111; … | Item 111 asserts that U(Λ_n) is hyperspecial and cites only GeometryOfNumbersAndQuadraticArithmetic:GN.2. GN.2 plans the classification of quadratic and … |
| /37 | low | missing | items (none for §1.5.2 and the twisted Lie algebra) | Two basic objects of §§1.3 and 1.5 have no item. (i) The quadratic character η_{E/F} of F^× attached to E/F by local class field theory, trivial when E is … |
| /38 | low | missing | PAPER-LESLIE-25/50; … | Xiao's construction (item 50) and the remark after Theorem 4.7 use the Jacquet–Langlands transfer of test functions f ↦ f̃ from Herm(V′) (or Herm(V_α) ⊕ … |
| /39 | low | error | PAPER-LESLIE-25/24 | The modular character of P_(a,b)(E) is written with /·/_F applied to det m_i ∈ E^×. §1.5.2 defines /·/_F only on F. The modular character of P(E) is /det … |
| /40 | low | error | PAPER-LESLIE-25/35 | Item 35 says Φ^n is r_!1_{End(Λ_n)} on Ω_reg, 'extended by zero to X_n', and 'is locally constant'. Extension by zero off Ω_reg is not locally constant at … |
| /41 | low | error | PAPER-LESLIE-25/36 | Item 36 equates 'T integral' with 'L ⊂ Λ_n ⊂ L^∨ = x^{−1}Λ_n', where L = x^τΛ_n. That condition is equivalent to x ∈ End(Λ_n) for the chosen x, not a property … |
| /42 | low | other | PAPER-LESLIE-25/52; … | Item 52's own note says MetaplecticAutomorphicForms MP.2 plans the general Weil representation. MP.2 computes the Weil representation on unipotent, Levi and … |
| /43 | low | error | PAPER-LESLIE-25/44; … | Two items omit hypotheses that the theorems need: - Item 44 (Zhang's existence of Lie-algebra Jacquet–Rallis transfer) states no hypothesis on the fields. … |
| /44 | low | other | PAPER-LESLIE-25/50 | Item 50 is a 'construction', but its last sentence is a cited theorem: Xiao's Theorem 6.1, that f^{a,b} is an endoscopic transfer of f. This is a second, … |
| /45 | low | other | sourceIssues (§5.2, p. 42) | Two unrecorded slips in the proof of Proposition 5.2, both affecting nothing: (1) 'Since q(y, w) ∈ Nm_{E/F}(E)' is false in general. In V_2 with form I_2, ⟨w, … |
| /46 | low | error | PAPER-LESLIE-25/73 | For whichever of n and n+1 is even, ᵗw_k = −w_k, so w_k is not Hermitian and w_k ∉ X_k; the paper's own §6.1 uses ξw_k in that case. Several statements are … |
| /47 | low | error | PAPER-LESLIE-25/66 | Remark 7.6 says the map from twisted Z-regular orbits to linear Z-regular orbits is 2-to-1 for F local and E/F a field. It is 4-to-1. The element (z_1, z_2) ∈ … |
| /48 | low | error | PAPER-LESLIE-25/86 | (8.14) has the wrong global L-value. Unfold Definition 8.8 using Corollary 8.4 for π and for π^∨, whose local factors λ^{η_v,♮}_{π̂_v} are normalized by the … |
| /49 | low | missing | PAPER-LESLIE-25/58 | The local distinction theorem cited in §6.3 has no item: every Galois-invariant generic Π of GL_n(E) has a nonzero U(V_x)-invariant functional for every x ∈ … |
| /50 | low | library-claim | PAPER-LESLIE-25/76; … | Item 76 is marked planned at AutomorphicLFunctionsAndLocalFactors:AL.3, but its statement includes the one-dimensionality of Hom_{H(F_v)}(Π_v, ℂ). That is the … |
| /51 | low | other | PAPER-LESLIE-25/58 | Item 58 is entirely 'missing', but part of it is planned. Whittaker models of generic representations of GL_n over a local field, with their existence and … |
| /52 | low | error | PAPER-LESLIE-25/67 | The two lines of (7.12) are not equal in general. Z_{H′_{x,y}} = Z_{U(V_x)} × Z_{U(V_y)} (≅ E^1 × E^1) lies inside Z_{G′}, and ω′ is trivial on it. Hence … |
| /53 | low | missing | PAPER-LESLIE-25/70 | The direction f ↦ {f′_{x,y}} of Theorem 7.9 needs the twisted-side analogue of the surjectivity of f ↦ f̃: every function in C_c^∞(X^y_{y(x)}) must be f̃′ for … |
| /54 | low | missing | PAPER-LESLIE-25/99, /100, /96, /107, /89 (cited results kept only in … | Several cited results used in §§9–11 appear only inside notes, although every cited result should be its own item: [Zha14b, Theorem A.2] (some f′ ∈ … |
| /55 | low | other | sourceIssues PAPER-LESLIE-25/E10 | E10's correction is right, but its 'reason' is false. The reason claims that the G-characters η_{i,j}(g_1,g_2) = η(det g_1)^iη(det g_2)^j of Theorem 9.11 … |
| /56 | low | other | sourceIssues PAPER-LESLIE-25/E10, E11, E12 (review) | None of the recorded source issues in this share has the reviewer's verdict object that §18 requires ('The independent reviewer checks each finding at its … |
| /57 | low | error | PAPER-LESLIE-25/98, /99 (Lemma 10.1) | Lemma 10.1's averaging has a central-character sign slip. f_ω(g) = ∫_{Z_G} f(gz)ω(z)dz satisfies f_ω(zg) = ω(z)^{-1}f_ω(g), as the paper says ('onto … |
| /58 | low | error | PAPER-LESLIE-25/109 (choice of f_{v_reg}) | The construction at v_reg asks for a compact open subset of G(F_{v_reg})^{rss} containing the orbit Z_G H γ_reg H. That orbit is closed and non-compact, so no … |
| /59 | low | error | PAPER-LESLIE-25/104 (Proposition 10.7 proof) | The constants in the proof of Proposition 10.7 are inconsistent. One line gives (1/L(1,η)²)J = I_π(f), and the next uses J = 4I_π(f); Theorem 9.11's proof … |
| /60 | low | error | PAPER-LESLIE-25/95 (Theorem 9.8) | The item, like the paper, states Ramakrishnan's theorem for 'global fields'. The cited result is proved for number fields (finite Galois K/F of number fields; … |
| /61 | low | other | prerequisites | The prerequisites miss papers that §9 builds on and that the atlas does not obviously cover: [Rog83] (Rogawski, Duke Math. J. 50 (1983); 'the foundational … |
| /62 | low | other | route 4 (source SmoothRepresentationsOfLocalGroups:SR.4), item … | Route 4 sends Hall–Littlewood polynomials (a ℤ[t]-basis of symmetric polynomials, homogeneity, branching coefficients c_{α,β}(λ)) to SR.4 as 'standard … |
| /63 | low | other | briefs of routes 1 and 2 | Both briefs name most imported roadmaps by id only, and one Tau Ceti layer by title only, although PROTOCOL §16 requires title and id. Route 1 also imports … |
| /64 | low | error | route 2 brief; … | Route 2's brief says the pending Jacquet–Rallis Part II is 'extended by ... PAPER-BEUZARTPLESSIS-CHAUDOUARD-25', and the review counts that paper among the … |
| /65 | low | other | routes 1 and 2, field area | Both Part II routes set area 'modular', which is not a galaxy id. make_queue gives the merged design job the most common area among its member routes. That … |

## Notes for the fix job

- **Source issues (/1–/5 and the medium findings).** Record each paper mistake confirmed here under PROTOCOL §18, and
  add verdict objects to E10–E12.
- **Theorem 9.11 and Theorem 11.1 (/4, /5).** The proposed repairs rerun the paper's own global argument with the unit
  pair, and with a global pair non-split at v_0. The fix job should record them in the items' notes as repairs, not as
  statements of the paper.
- **The two Part IIs.** `make_queue.py` merges every accepted Part II of EndoscopicTransferAndUnitaryTraceComparison
  into one design job. So the X_n dependency, the import ids and the area field should be fixed in both briefs together.
