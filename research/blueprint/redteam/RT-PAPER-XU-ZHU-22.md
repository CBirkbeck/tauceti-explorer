# RT-PAPER-XU-ZHU-22

Red team of the accepted extraction PAPER-XU-ZHU-22: Daxin Xu and Xinwen Zhu, *Bessel F-isocrystals for reductive
groups*, Invent. Math. 227 (2022), 997–1092 (arXiv 1910.13391v2). Issue #4166.

Red team: Claude Code, session `cc-c2c06b`, 2 October 2026. I did not write or review:
- the extraction (`cc-39fac3`, PR #2024);
- its review (`cc-fb70e5`, PR #2553).

**Disclosures.** Some findings cite, as existing owner decisions, work of mine:
- PAPER-DADDEZIO-23, whose red team I verified (#5365);
- PAPER-ZHU-17, which I red-teamed (#5497);
- PAPER-BERGSTROM-FABER-PAYNE-24, which I fixed (#5224).

The findings that cite them (/5, /7, /10, /17, /24, /26) carry coordinator notes, and none rests on a verdict of mine.

**Result: 52 findings, 4 high, 19 medium and 29 low.**

## Method

**The source.** arXiv 1910.13391v2 (<https://arxiv.org/pdf/1910.13391v2>), 71 pages, re-downloaded on 2026-10-02. Its
SHA-256 (`b8d153ef…67cd`) equals the extraction's. The journal version is paywalled and was not read.

**The passes.** Four parallel passes were run by this session.
- Three read all 71 pages, checking decisive formulas on page images and several counterexamples by brute force: §§1–2,
  §§3–4, and §5 with Appendix A.
- One checked the five routes, the 21 prerequisites, the planned statuses and the briefs.

**Merging and severity.** Nine sets of findings reported by two or three passes were merged. I downgraded /19
(Proposition A.9's dropped qualifier) from high to medium, because the paper's own qualifier repairs it.

**What I re-verified myself.** Every high finding, against the text:
- **/1.** Theorem 1.1.4(ii) with K = Q_p(µ_p) and normalised Kl would put √3 in Q_3(√−3). §4 itself assumes √p ∈ K.
- **/2.** With I(2) = Z(G)(1)[I(1), I(1)], det modulo squares kills I(2) but not diag(1 + y, 1) at p = 2.
- **/3.** The de Rham Kummer module of an algebraic character's differential has integral exponent, so it is trivial.
- **/4.** Lemma 4.2.6(i) rests on "τ is affine", but τ is the restriction to the complement of a codimension ≥ 2 locus.

The full list of what was checked is in the result's `checked` field.

## The high findings

### /1 — error

**Where.** research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /4 (and the §1 locator of item /41); report
PAPER-XU-ZHU-22.md section 'What the paper proves' (Main theorem); sourceIssues (missing entry)

**Claim.** Theorems 1.1.4 and 1.2.4(i) take K = Q_p(mu_p) and A^dagger with coefficients in K, but the traces they
assert are weight-0 normalised and need a square root of p in K. Item /4 copies this, so its statement is false: for n =
2, p = 3, a = 1 one has Kl(2; 1) = 1/sqrt(3), while Tr(phi_a) lies in K = Q_3(mu_3) = Q_3(sqrt(-3)), which does not
contain sqrt(3) (that would put sqrt(-1) in a ramified quadratic extension of Q_3, but Q_3(sqrt(-1)) is the unramified
one). The same happens in Theorem 1.2.4(i) for G-check = SL_2 at p = 2: Tr(phi_1, Std) = Kl(2; 1) = -1/sqrt(2), which is
not in Q_2 = Q_2(mu_2). The report's headline statement ('Let G-check be split reductive, K = Q_p(mu_p), ... There is a
unique phi in G-check(A^dagger) ...') is false for the same reason. The body is right: §4 assumes a square root of p in
K. No sourceIssue records this.

**Evidence.** p. 3, §1.1.3: 'We set K = Qp(µp) ... A† = { Σ an x^n | an ∈ K, ∃ρ > 1, ... }'. p. 3 (1.1.2.1): 'Kl(n; a) =
(−1/√q)^{n−1} Σ ...'. p. 3-4, Theorem 1.1.4: 'There exists a unique ϕ(x) ∈ GLn(A†) such that ... (ii) For a ∈ F×q, we
have ι Tr ϕa = Kl(n; a)'. p. 5, Theorem 1.2.4: 'Let K = Qp(µp) ... There exists a unique ϕ(x) ∈ Ǧ(A†) ... Tr(ϕa, V) =
Tr(Froba, (KlǦ,V)a)'. p. 37 (§4 standing hypotheses): 'We assume moreover that there exists an element π ∈ K satisfying
π^{p−1} = −p and a square root of p in K.' Computation: over F_3, S(1) = ψ(1+1) + ψ(2+2) = ψ(2) + ψ(1) = −1, so Kl(2; 1)
= −S/√3 = 1/√3; over F_2, S(1) = ψ(0) = 1, so Kl(2; 1) = −1/√2. In both cases Tr(ϕ_1)^2 = 1/p must hold in K, which is
impossible.

**Fix.** Item /4 statement: replace 'Let K = Q_p(μ_p)' by 'Let K = Q_p(μ_p, √p) (any finite extension of Q_p containing
π and a square root of p; for p ≡ 1 mod 4, or n odd, Q_p(μ_p) suffices)', and in (ii) note that ι depends on the choice
of √p through the normalisation (−1/√q)^{n−1}. Item /41: add the hypothesis 'K ⊇ Q_p contains π with π^{p−1} = −p and a
square root of p (§4, p. 37)', and write the target as F-Isoc^†(G_{m,k}/K) with k = F_q (the printed item mixes F_p with
the q-Frobenius equation). Report, Main theorem: replace 'K = Q_p(μ_p)' by 'K ⊇ Q_p(μ_p) containing √p'. Add sourceIssue
E31: printed 'K = Qp(µp)' in Theorems 1.1.4 and 1.2.4(i) (pp. 3, 5); correction 'K = Qp(µp, √p)'; reason as above;
affects 'a stated result'.

### /2 — error

**Where.** research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /31 (also item /35 part (i), route 2 brief part
(a); no sourceIssue)

**Claim.** Item 31 copies the paper's definition I(2) = Z(G)(1)[I(1), I(1)] ('so I(2) = [I(1), I(1)] for G semisimple')
together with (4.1.1.1) I(1)/I(2) ≅ ⊕_{α affine simple} U_α, and its note repeats that this I(2) 'agrees for GL_n' with
Heinloth–Ngô–Yun. With this definition (4.1.1.1) is false whenever p divides the order of the finite group X_•(T)/(ZΦ^∨
+ X_•(Z(G)°)), e.g. for GL_n and PGL_n with p | n, in particular for G = PGL_2 at p = 2, the group whose dual SL_2 gives
Dwork's Be_2. Then I(1)/I(2) is infinite-dimensional, so the big cell (4.1.1.2) and the generic linear functions φ are
not as described. The identification I′(1)/I′(2) ≅ I(1)/I(2) behind the trivial functoriality of §4.1.9 (item 35 (i))
also fails, for SL_2 → PGL_2 at p = 2. No sourceIssue records this.

**Evidence.** p. 37, §4.1.1: 'I(2) = Z(G)(1)[I(1), I(1)] ... If G is semisimple, I(2) = [I(1), I(1)] ... (So our
definition of I(2) is slightly different from [52] 1.2 when G is not semisimple, but for G = GL_n coincides with the one
in [52] 3.1.)' and '(4.1.1.1) I(1)/I(2) ≃ ⊕_{α affine simple} U_α'. p. 40, §4.1.9: 'Let G′ → G be a homomorphism of
reductive groups induces the same adjoint quotient G′_ad ≃ G_ad. Then it induces an isomorphism I′(1)/I′(2) ≃
I(1)/I(2)'. Counterexample for PGL_2 or GL_2 at p = 2. Lift g ∈ I(1) to ĝ ∈ GL_2(k[[y]]) with ĝ(0) upper unipotent; the
lift is unique up to λ ∈ 1 + yk[[y]]. Then g ↦ det ĝ mod (1 + yk[[y]])^2 is a homomorphism to an abelian group. It kills
commutators, and for GL_2 it also kills Z(G)(1), whose determinants are squares. In characteristic 2 the squares form 1
+ y^2 k[[y^2]] (the same holds over any k-algebra, so this is not an artefact of k-points). So diag(1 + y, 1) is not in
I(2), although it maps to 0 in U_α ⊕ U_{δ−α}. A brute-force computation over k = F_2 found the following. For PGL_2 mod
y^3 and mod y^4, [I(1), I(1)] has index 8 and 16 in I(1), not 4 = |U_α(F_2) × U_{δ−α}(F_2)|. For GL_2 mod y^3,
Z(G)(1)[I(1), I(1)] has index 8. In all three cases diag(1 + y, 1) lies outside. The same computation for p = 3 gives
index 9 = p^2 with diag(1 + y, 1) inside, as expected. The introduction (§1.2.3, p. 4) describes I(2) as 'the ith step
in the Moy-Prasad filtration of I(0)', which is the right object.

**Fix.** In item 31 replace 'I(2) = Z(G)(1)[I(1), I(1)] (so I(2) = [I(1), I(1)] for G semisimple and I(2) = I(1) for a
torus)' with: 'I(2) is the subgroup of I(1) generated by T(1) = ker(T(k[[y]]) → T(k)) and the root subgroups U_β of the
positive affine roots β that are not simple. For G almost simple this is the Moy–Prasad subgroup G_{x,2/h} at the
barycentre x of the alcove, as in §1.2.3. It contains Z(G)(1)[I(1), I(1)], strictly for example for GL_n and PGL_n with
p | n, and I(1)/I(2) ≅ ⊕_{α affine simple} U_α for every p.' In the note, delete 'but agrees for GL_n', which holds only
for p ∤ n. Add a sourceIssue: kind error; locator §4.1.1, (4.1.1.1), p. 37, and §4.1.9, p. 40; affects a stated result.
The construction is unaffected once I(2) is redefined. Say the same in part (a) of route 2's brief.

### /3 — error

**Where.** research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /37 (Theorem 4.2.1 with a character), with item
/36 (4.1.13) and route 2 brief part (d); no sourceIssue

**Claim.** Item 37 states Theorem 4.2.1 for a character χ̄ : T(k) → K^× 'lifting to χ : T → G_m', comparing Kl^dR(−πφ,
χ, s) with Kl^rig(φ, χ̄, s). The de Rham side is built (§4.1.13) from the Kummer D-module K⟨x, x^{−1}, ∂_x⟩/(x∂_x −
χ(1_i)), with χ : Lie(T) → K 'the differential of χ'. The differential of an algebraic character is integral, χ(1_i) =
n_i ∈ Z, and K⟨x, x^{−1}, ∂⟩/(x∂ − n) ≅ (O, d) because x^{−n}·1 is horizontal. So the left side of (4.2.1.1) does not
depend on χ̄: it is the χ̄ = 1 object. The right side does depend on χ̄, since for χ̄ ≠ 1 the Kummer F-isocrystal of
§2.1.5(ii) has exponent a ∈ (1/(q−1))Z ∖ Z. As stated, the theorem is false for χ̄ ≠ 1. The paper proves only χ̄ = 1,
and only χ̄ = 1 is used later, so the main chain is unaffected.

**Evidence.** p. 42, §4.2: 'Let χ̄ : T(k) → K^× be a character. There exists a homomorphism χ : T → G_m such that χ(x̃)
= χ̄(x) for x ∈ T(k) and some lifting x̃ of x in T(K). We denote abusively χ : Lie(T) → K the differential of χ.'
§4.1.13, p. 42: '⊠_{i=1}^r (K⟨x, x^{−1}, ∂_x⟩/(x∂_x − χ(1_i))) defines an algebraic D-module on T_K ... K_χ'. p. 43: 'we
will present the proof in the case where χ is trivial for simplicity and the general case follows from the same
argument'. §2.1.5(ii), p. 10: 'The isocrystal K_a has a Frobenius structure if and only if a ∈ (1/(q−1))Z ... χ(x) =
x̃^{(q−1)a}'. Counterexample: G = T = G_m, which §4 allows ('let G be a split reductive group'), so Ǧ = G_m and
I(1)/I(2) = 0. Here Bun_{G(1,2)} ≅ X_•(T) × T, and the Hecke eigenvalue of the tautological character is the Kummer
F-isocrystal of χ̄^{±1} on X. Its underlying isocrystal (O^†, d ± a dx/x) with a ∉ Z has no non-zero overconvergent
horizontal section (that section would be c·x^{∓a}), so it is not isomorphic to (O^†, d), which is the analytification
of the de Rham side.

**Fix.** In item 37, with item 36 and route 2's brief (d), give the de Rham side the parameter χ_dR : Lie(T) → K, 1_i ↦
n_i/(q − 1), where χ̄(x) = ∏_i x̃_i^{n_i} with Teichmüller lifts. With E23's convention K_χ̄ = (O^†, d + a dx/x), the
module (K⟨x, x^{−1}, ∂⟩/(x∂ − n_i/(q−1)))^† is then the Kummer F-isocrystal of χ̄_i. Restate as '(Kl^dR_{Ǧ,V}(−πφ, χ_dR,
s))^† ≅ Kl^rig_{Ǧ,V}(φ, χ̄, s) with χ_dR = (1/(q−1))·dχ', and note that the paper writes out only χ̄ = 1. Add a
sourceIssue: kind error; locator §4.2, p. 42, Theorem 4.2.1 and the paragraph before it; affects a stated result.

### /4 — error

**Where.** research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /38 (Lemma 4.2.6(i)), with the quasi-minuscule
step in item /37's note; no sourceIssue

**Claim.** Item 38 states Lemma 4.2.6(i): τ_{k,+}(𝓜)[1] and τ_{K,+}(M)[1] are holonomic, i.e. concentrated in degree 0.
This is false. The proof rests on 'τ is affine', and τ is not affine. τ = p°_2 ∘ j, where j : GR°°_V → GR°_V is the
complement of Z ≅ X, of codimension dim Gr_λ ≥ 2, so the fibres of τ are affine normal varieties minus a point. In the
paper's own triangle the cone C = i_+ i^!(j_{!+}(M)[1])[1] lies in D^{≥0} but not in degree 0, and H^1(τ_+(M)[1]) ≅
H^1(C) ≠ 0.

**Evidence.** p. 44, proof of Lemma 4.2.6(i): 'the second term has cohomological degrees ≤ 0 because τ is affine and the
last term has cohomological degrees ≥ 0 since p°_2|_Z is the identity. Then we deduce that each term in the above
triangle is holonomic.' §4.2.5, p. 44: 'Gr_{≤λ} contains a smooth open subscheme Gr_λ whose complement is isomorphic to
Spec(R)'. Proof of 4.2.6(i): 'Let i : Z → GR°_V be the complement of GR°°_V in GR°_V, which is isomorphic to X.'
Counterexample: G = PGL_2 (Ǧ = SL_2), V = Sym^2 (quasi-minuscule λ = α^∨), p odd. Near e, Gr_{≤α^∨} is the nilpotent
cone of sl_2, ≅ A^2/±1: a normal, rationally smooth surface. So IC_V is the constant object shifted by 2, and its
!-restriction to e is K(−2)[−4]. Take a fibre Y = GR°_{V,s}, which is affine and contains e, and set U = Y ∖ {e}. There
M_s = L[2] with L of rank one and smooth across e, and H^*(Y, j_{!+}M_s) is concentrated in degree 0 (it is the fibre of
Kl_V, by (4.1.8.3)–(4.1.8.4)). The excision sequence then gives H^1(U, M_s) ≅ H^2_e(Y, j_{!+}M_s) ≅ L_e(−2) ≠ 0, so
τ_+(M)[1] has non-zero H^1. U is not affine either (Hartogs on the normal surface Y).

**Fix.** Restate item 38 (i) as follows: H^i(τ_+(M)[1]) = 0 for i < 0; the map Kl_V = p°_{2,+}(j_{!+}M)[1] →
H^0(τ_+(M)[1]) is injective, because H^{−1}(C) = 0; and H^i(τ_+(M)[1]) ≅ H^i(C) for i ≥ 1, which is non-zero in general
(for example PGL_2 with V = Sym^2). The same holds over k. In item 37's note, run the quasi-minuscule step 4.2.7 with
the holonomic module H^0(τ_+(M)[1]) in place of τ_+(M)[1]; the relative specialisation (2.3.7.2) induces maps on each
cohomology module. Lemma 4.2.6(ii) and Theorem 4.2.1 are unaffected. Add a sourceIssue: kind error; locator Lemma
4.2.6(i) and its proof, p. 44; affects a stated result (Lemma 4.2.6(i); Theorem 4.2.1 still holds).

## All findings

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | error | research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /4 (and …; … | Theorems 1.1.4 and 1.2.4(i) take K = Q_p(mu_p) and A^dagger with coefficients in K, but the traces they assert are weight-0 normalised and need a square root … |
| /2 | high | error | research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /31 (also …; … | Item 31 copies the paper's definition I(2) = Z(G)(1)[I(1), I(1)] ('so I(2) = [I(1), I(1)] for G semisimple') together with (4.1.1.1) I(1)/I(2) ≅ ⊕_{α affine … |
| /3 | high | error | research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /37 …; … | Item 37 states Theorem 4.2.1 for a character χ̄ : T(k) → K^× 'lifting to χ : T → G_m', comparing Kl^dR(−πφ, χ, s) with Kl^rig(φ, χ̄, s). The de Rham side is … |
| /4 | high | error | research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /38 (Lemma …; … | Item 38 states Lemma 4.2.6(i): τ_{k,+}(𝓜)[1] and τ_{K,+}(M)[1] are holonomic, i.e. concentrated in degree 0. This is false. The proof rests on 'τ is affine', … |
| /5 | medium | error | research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /65 and …; … | Item 65 is the global statement: a convergent F-isocrystal on a smooth k-scheme with constant Newton polygons has a slope filtration, the polygons are constant … |
| /6 | medium | duplicate | research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /4, items …; … | Two accepted routes plan the GL_n p-adic Kloosterman F-isocrystal without reference to each other. PAPER-FRESAN-SABBAH-YU-22/61, 'The Kloosterman F-isocrystal … |
| /7 | medium | error | research/blueprint/papers/PAPER-XU-ZHU-22.result.json items /20 and … | GS.1 plans the Beilinson–Drinfeld Grassmannian over powers of a global curve C over F_q, with ℓ-adic coefficients. The paper needs more than that. (1) The … |
| /8 | medium | missing | research/blueprint/papers/PAPER-XU-ZHU-22.result.json route 3 brief …; … | Kl^dR_Ǧ is made by HNY's Hecke-eigensheaf construction with algebraic D-modules over a field of characteristic 0 (§4.1.13). That needs holonomic D-modules on … |
| /9 | medium | missing | research/blueprint/papers/PAPER-XU-ZHU-22.result.json prerequisites …; … | The prerequisite list leaves out several cited papers that the proofs depend on, none of them in the catalogue or the atlas. Main chain: Beilinson–Drinfeld, … |
| /10 | medium | error | research/blueprint/papers/PAPER-XU-ZHU-22.result.json route 3 brief …; … | Several imports in the briefs name the wrong supplier or none. (1) The trace comparison of §4.1.12 is the trace formula for holonomic complexes with … |
| /11 | medium | missing | research/blueprint/papers/PAPER-XU-ZHU-22.result.json items (none …; … | Baldassarri's theorem bounding p-adic slopes by formal slopes is a cited result on the main chain, but it is not an item. Lemma 4.5.5 uses it to exclude a … |
| /12 | medium | missing | research/blueprint/papers/PAPER-XU-ZHU-22.result.json items (none …; … | The proof of Theorem 5.4.2(i) (generic ordinarity) needs two cited inputs that the intro states and no item records. (a) Heinloth–Ngô–Yun's automorphic … |
| /13 | medium | missing | research/blueprint/papers/PAPER-XU-ZHU-22.result.json items /15, /16 … | No item records Abe's smoothness criterion, Around the nearby cycle functor [4] 3.8. Corollary 2.8.7 rests on it: vanishing of Φ along traits, given by … |
| /14 | medium | error | research/blueprint/papers/PAPER-XU-ZHU-22.result.json items /8 and …; … | Items /8 (Dwork and Kummer F-isocrystals) and /17 (local monodromy of p-adic differential modules) are marked missing, but the accepted RD packet already plans … |
| /15 | medium | duplicate | research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /9 (route …; … | Item /9 is planned twice inside this extraction, in two different roadmaps. Item /9 (the absolute specialisation ρ_M : RΓ_dR → RΓ_rig, the cospecialisation, … |
| /16 | medium | missing | research/blueprint/papers/PAPER-XU-ZHU-22.result.json items /44, /45 …; … | Theorem 4.5.2 also uses Lie-theoretic and ℓ-adic inputs that are cited, or used without citation, and recorded only as text inside item 45's statement or not … |
| /17 | medium | duplicate | research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /43 (and …; … | Item 43 plans as missing, in KloostermanSheavesAndBesselIsocrystals, the Tannakian monodromy groups of overconvergent (F-)isocrystals: G_geo for ⟨Be^†_Ǧ⟩ ⊂ … |
| /18 | medium | missing | research/blueprint/papers/PAPER-XU-ZHU-22.result.json items /10, /34, …; … | Lemma 4.1.6 shows that Hk_V(A_{ψφ})[1] is holonomic, which is the first step of Theorem 4.1.5 and so of the main chain. It uses the cited result that for an … |
| /19 | medium | error | research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /68 … | Item 68 states Proposition A.9 as '(i) there is an epimorphism M^log -> E_F on (U, 0) ... and (ii) E_F is the maximal-slope quotient M^log/M^{log,1}', having … |
| /20 | medium | missing | research/blueprint/papers/PAPER-XU-ZHU-22.result.json sourceIssues … | Unrecorded gap in the proof of Proposition A.1 (A.11). Theorem A.3 needs (1) M and N to admit slope filtrations on the curve X, and (2) an isomorphism h of … |
| /21 | medium | missing | research/blueprint/papers/PAPER-XU-ZHU-22.result.json items /4, /62, … | The cited inputs of Theorem 5.4.2(ii) are not items. (1) Ordinarity of Be^dagger_n at every closed point for all n and all p. Item 4 (Theorem 1.1.4(iii), … |
| /22 | medium | missing | research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /52 … | The convolution formula (5.3.9.1) (item 59, a stated result in route 3's brief (h)) is deduced from Miyatani's convolution theorem: hypergeometric … |
| /23 | medium | error | research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /56 | Item 56 states the Landau-Ginzburg description and Kl_{SO_{2n},Std}(a) = q^{-(n-1)} Sum_{(Q_{2n-2} - D)(F_q)} psi(Tr W(.; a)) with no restriction on n. For n = … |
| /24 | low | error | research/blueprint/papers/PAPER-XU-ZHU-22.result.json route 5 …; … | Route 5 says it 'coalesces with the PadicDifferentialEquationsPartIIMinimalSlope candidate proposed by PAPER-TSUZUKI-23 (same id, title and area)', but its … |
| /25 | low | duplicate | research/blueprint/papers/PAPER-XU-ZHU-22.result.json items /51, /53, … | Katz's ℓ-adic hypergeometric sheaves, defined as shifted multiplicative !-convolutions of rank-one sheaves on G_m (Katz, ESDE ch. 8), are also planned by … |
| /26 | low | duplicate | research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /19 and … | The attractor/repeller geometry behind Braden's theorem is coefficient-independent: X^0, X^+, X^− for a G_m-action, the closed and locally closed immersions, π … |
| /27 | low | other | research/blueprint/papers/PAPER-XU-ZHU-22.result.json route 3 field … | The area geomlanglands is 'Geometrisation of local Langlands': bundles on the Fargues–Fontaine curve, Hecke stacks and local shtukas, geometric Satake, the … |
| /28 | low | other | research/blueprint/papers/PAPER-XU-ZHU-22.result.json route 2 and … | PROTOCOL §16 requires a brief to state the final theorems exactly as the paper does and to name each import by title and id. Neither brief does. The final … |
| /29 | low | error | research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /4, clause … | Clause (ii) says 'for a ∈ F_q^×, ι Tr φ_a = Kl(n; a)' with φ_a = ∏_{i<deg a} φ(ã^{p^i}). Here Kl(n; a) is the sum over F_q, but φ_a is the Frobenius of the … |
| /30 | low | error | research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /3 and … | Katz's monodromy theorem as recorded, (1.1.2.3), needs n ≥ 2, but neither the item nor the route 4 brief says so, and the brief says the foundations are needed … |
| /31 | low | missing | research/blueprint/papers/PAPER-XU-ZHU-22.result.json sourceIssues … | In the weight formalism of §2.6.3(i) the duality rule is misprinted. It says 𝔻_X sends weight ≤ w to weight ≥ w; the correct rule (Abe–Caro, as in the ℓ-adic … |
| /32 | low | missing | research/blueprint/papers/PAPER-XU-ZHU-22.result.json sourceIssues … | Proposition 2.8.5(ii) says i^+M[−1] is LA with respect to f∘i : Z → S as well as f/_Z : Z → D. Read literally, the first claim is false whenever i^+M ≠ 0. Item … |
| /33 | low | missing | research/blueprint/papers/PAPER-XU-ZHU-22.result.json sourceIssues … | Seven misprints in §2 are not in sourceIssues. Only the first is mentioned anywhere, in item /10's note. None changes an item statement. (1) 2.3.2(i): internal … |
| /34 | low | error | research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /10 | Item /10 narrows two statements of the paper. (a) It says 'proper base change', but 2.3.2(iv) gives g^+f_! ≅ f′_!g′^+ for every morphism f and adds that for … |
| /35 | low | error | research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /62 (its …; … | Theorem 1.2.4(ii), and §5.4.1 again, declare 'ρ ∈ X^•(T) = X_•(Ť)'. This is false in general: for G = PGL_2, ρ = α/2 is not a character of T, and for GL_n with … |
| /36 | low | other | research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /47, … | Item /47's §1 locator is wrong. It says '§1.2.7, p. 7', but the local-monodromy discussion it cites is §1.2.10 on p. 7. §1.2.7 is Theorem 1.2.7 (monodromy … |
| /37 | low | missing | research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /30 …; … | Item 30 uses IC^Weil_μ = IC_μ(⟨ρ, μ⟩) and the weight-0 subcategory S, but no item gives the paper's half Tate twist. (n/2) multiplies the Frobenius structure … |
| /38 | low | error | research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /42 note …; … | The proof of Proposition 4.4.5 makes two compensating slips, and item 42's note repeats the first. It says φ_0^{−1}Nφ_0 = qN, but (4.4.3.1) at x = 0 (where x … |
| /39 | low | other | research/blueprint/papers/PAPER-XU-ZHU-22.result.json sourceIssues E6 …; … | Some locator and citation slips in §§4.1–4.5 are not recorded. (a) E6's sentence is on p. 53, not p. 52. (b) Item 45's note identifies the paper's '[9] 3.2' as … |
| /40 | low | error | research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /37 note … | The minuscule case concludes that ι_V ⊗ A^0 is an isomorphism of coherent A^0-modules because its fibre is an isomorphism at every R-point s ∈ X(R). For vector … |
| /41 | low | error | research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /46 note … | The proof of Corollary 4.5.6 concludes from a surjection G^ℓ_arith ↠ G_arith that the two groups are isomorphic 'since they are both closed subgroups of Ǧ', … |
| /42 | low | other | research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /44 …; … | Theorem 4.5.2 is stated for G split almost simple with any dual Ǧ. Part (i) excludes type A_{2n} in characteristic 2, and part (ii) treats only Ǧ = SL_{2n+1}. … |
| /43 | low | error | research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /5 … | Item 5 writes 'Be_Ǧ(ξ̌) = d + ξ̌ dx/x = d + (N + xE) dx/x ... equivalently ∇ = d + N dx/x + λ^h E dx', with the same letter E in both forms. In §4.3.1, E ∈ Σ_i … |
| /44 | low | missing | research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /34 note …; … | The smoothness of the Hecke eigenvalue (§4.1.7) moves vanishing cycles past an external tensor factor: Φ(A ⊠ E_V) ≅ A ⊠ Φ(E_V) and Φ(pr_1^+A ⊗ IC_V) ≅ pr_1^+A … |
| /45 | low | error | research/blueprint/papers/PAPER-XU-ZHU-22.result.json items /55, /59, … | Items 59 and 60(i) state the convolution formula and Kl_{SO_{2n+1},Std}(a) = -(1/sqrt q) Sum_{xy=a} Kl_{SO_3,Std}(x) Kl(2n-2; y) for all n. For n = 1 the … |
| /46 | low | missing | research/blueprint/papers/PAPER-XU-ZHU-22.result.json sourceIssues … | Unrecorded misprint. The proof of Proposition 5.3.8(i) lists the Frobenius eigenvalues at 0 of both sides as {q^-n, ..., q^-1, 0, q, ..., q^n}. The middle … |
| /47 | low | missing | research/blueprint/papers/PAPER-XU-ZHU-22.result.json sourceIssues …; … | Unrecorded misprints in the two explicit isomorphisms G_a^{n+1} = I(1)/I(2). In 5.3.3 (SO_{2n}) the affine term x^{-1}(E_{1,2n-1} + E_{2,2n}) is the … |
| /48 | low | missing | research/blueprint/papers/PAPER-XU-ZHU-22.result.json sourceIssues …; … | Unrecorded sign inconsistency. Theorem 1.1.4 and 4.4.1 fix lambda = -pi with pi^{p-1} = -p, so pi = -2 and lambda = 2 at p = 2, and Be_{2n+1} is (x … |
| /49 | low | missing | research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /50 note; … | The proof of Theorem 5.1.4 gets surjectivity of K(Rep G-check) tensor Qbar_l -> K(Rep G_geo) tensor Qbar_l from surjectivity onto K(Rep G-check^Sigma) tensor … |
| /50 | low | duplicate | research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /61 and … | Item 61 plans afresh the dominance order on X_*(T-check)^+_R (mu <= lambda iff lambda - mu is a non-negative real combination of positive coroots) and the … |
| /51 | low | missing | research/blueprint/papers/PAPER-XU-ZHU-22.result.json item /47 … | Item 47 concludes that I_infinity -> G-check is 'a simple wild parameter in the sense of Gross-Reeder' and that 'the only non-zero break ... is 1/h-check … |
| /52 | low | other | research/blueprint/papers/PAPER-XU-ZHU-22.result.json items /55, /57, … | Locator and cross-reference slips. Item 55's locator cites '(5.3.3.1)-(5.3.3.3)', but there is no (5.3.3.3). In its statement 'G_a^{n+1} = I(1)/I(2) as in … |

## Notes for the fix job

- **Source issues.** Record the four high findings, each with its local repair. None of them invalidates Theorem 4.4.4:
  - √p in K;
  - the Moy–Prasad I(2);
  - Theorem 4.2.1 restricted to χ̄ = 1, or the exponent dχ/(q − 1);
  - Lemma 4.2.6(i) replaced by the D^{≥0} statement the argument needs.
- **Statuses and owners.** Mark items 8, 17 and 43 as planned at their existing owners, give item 9 one owner, and send
  the mixed-characteristic Grassmannian inputs beyond GS.1 to their owners.
- **Inputs.** Add the missing cited results as items and the missing works as prerequisites.
