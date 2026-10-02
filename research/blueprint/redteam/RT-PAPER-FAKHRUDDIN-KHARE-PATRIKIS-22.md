# RT-PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22

Red team of the accepted extraction PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22: Najmuddin Fakhruddin, Chandrashekhar Khare and
Stefan Patrikis, *Lifting and automorphy of reducible mod p Galois representations over global fields*, Invent. Math.
228 (2022), 415–492 (arXiv 2008.12593v5). Issue #4164.

Red team: Claude Code, session `cc-c2c06b`, 2 October 2026. I did not write or review:
- the extraction (`cc-39fac3`, PR #2079);
- its review (`cc-38267a`, PR #2522).

**Disclosures.** Some findings cite, as existing owner decisions, work of mine:
- FIX-RT-PAPER-BOCKLE-HARRIS-KHARE-ETAL-19 (#5338), which set the route of BHKT item 12, edited item 45 and added item
  47;
- RT-PAPER-NEWTON-THORNE-26, my red team (#5334);
- PAPER-PASKUNAS-QUAST-26 and PAPER-BOXER-CALEGARI-GEE-25, whose red teams I verified (#5410, #5400).

The findings that cite them (/6, /7, /9, /11, /13, /17, /21, /23, /27, /38) carry coordinator notes, and none rests on a
verdict of mine.

**Result: 46 findings, 5 high, 21 medium and 20 low.**

The most serious finding, /2, is a gap in the paper itself: Lemma 3.7 is false as stated, and the proofs of Proposition
3.8 and Theorem 4.4 rely on it (/3 is the same gap in a second claim). This red team does not show that Theorems B, C or
E are false, only that their written proof has an unrecorded gap.

## Method

**The source.** arXiv 2008.12593v5 (<https://arxiv.org/pdf/2008.12593v5>), the authors' final version, 58 pages,
re-downloaded on 2026-10-02 with its LaTeX source. The PDF's SHA-256 (`6c260021…1e2`) equals the extraction's, and the
source's (`e28679d9…de43`) equals the review's. The published version is paywalled and was not read.

**The passes.** Four parallel passes were run by this session.
- Three read all 58 pages against the text, the TeX and page images: §§1–4 (pp. 1–22), §§5–9 (pp. 23–42), and the
  appendices with the references (pp. 43–58).
- One checked the five routes, the 13 planned statuses, the 23 prerequisites, the briefs and the report against the
  atlas, the stage graph, the packets, other accepted extractions and the pinned libraries.

**Merging.** Four pairs of findings reported by two passes were merged: item 8's planned stages, route 3's local
duality, items 68–69's ML.2 status and the stale reader report.

**What I re-verified myself.** Every high finding, against the TeX:
- **/1.** Route 2 sends FKP19 Proposition 4.7 (inside item 9) to R08.2, while route 1's layer (0) plans it (item 29) and
  imports R08.2 for every local lifting ring.
- **/2.** §3 fixes an arbitrary k-basis. For GL_2, any non-split ρ̄ and the basis H⊗ζ, (H+E)⊗ζ, F⊗ζ, the first two
  cyclic modules have the same quotient F_p(κ̄) with the same image vector, so f∘η_1^(v) − f∘η_2^(v) is unramified at v,
  and pigeonhole in a finite H¹ gives a linear relation between the fields for two primes v ≠ v′. The proof's second
  step overlooks that τ_v acts on the composite by the diagonal.
- **/3.** The proof on p. 18 uses τ_{t_0}, at which every h^(v) is ramified, in the same way.
- **/4.** M acts on 𝔲 by Λ²(std), so a non-zero H⁰(Λ²ρ̄_M ⊗ κ̄) is a form with multiplier κ̄^{−1}, not κ̄.
- **/5.** In PGL_2 the image of diag(1, −1) is centralised by (0 1; 1 0), so its centraliser is disconnected.

The full list of what was checked is in the result's `checked` field.

## The high findings

### /1 — error

**Where.** research/blueprint/papers/PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22.result.json item /9 (route 2,
LocalGaloisDeformationRings:R08.2) together with route 1 brief, layer (0) and 'Import, never re-plan'

**Claim.** Item 9, routed whole to R08.2, bundles a local input (Bellovin-Gee's generic-fibre analysis, Theorem 3.3.3
and Lemma 3.4.1, at places of a function field) with its consequence 'for the Zariski closure R of an irreducible
component of the generic fibre, [FKP19, Proposition 4.7] holds ... (allowing [FKP19, Lemma 4.9])'. FKP19 Proposition 4.7
and Lemma 4.9 are planned in the new Part II's layer (0) (and are item 29, route 1). The paper's own logic is that
Proposition 4.7 in equal characteristic needs the BG19 analysis, so the Part II's layer (0) must import R08.2; the brief
also tells it to import R08.2 'for every local lifting ring', which includes the trivial-prime rings Lift^{μ,α} that
layer (0) plans. With item 9 in R08.2, R08.2 also needs layer (0): the routes as written create the cycle R08.2 -> Part
II (0) -> R08.2.

**Evidence.** Paper p. 9: 'As in [FKP19, Proposition 4.7], we consider the lifting ring R^{□,µ}_{ρ̄} ... We require that
[FKP19, Proposition 4.7] continues to hold for R, and that R[1/ϖ] has an open dense regular subscheme (allowing us to
apply [FKP19, Lemma 4.9]). The input we need beyond the arguments of loc. cit. is that the analysis of generic fibers of
[BG19, Theorem 3.3.3] (or [BP19, Theorem 14]) continues to hold, as does [BG19, Lemma 3.4.1].' Item 9 statement: '... so
for the Zariski closure R of an irreducible component of the generic fibre, [FKP19, Proposition 4.7] holds and R[1/ϖ]
has an open dense regular subscheme (allowing [FKP19, Lemma 4.9])'. Route 1 brief: '(0) Foundations from FKP19 ...:
trivial primes and the rings Lift^{μ,α} with their duality pairings (FKP19 §3); Selmer conditions from formally smooth
points (FKP19 Prop. 4.7, Lemma 4.9)' and 'Import, never re-plan: ... LocalGaloisDeformationRings R08.2, R08.6 and L7 for
every local lifting ring'.

**Fix.** Split item 9. (9a), routed as a source of LocalGaloisDeformationRings:R08.2: 'For a place v of a global
function field of characteristic ℓ ≠ p and ρ̄ : Γ_{F_v} → G(k), the description of the generic fibre R^{□,µ}_{ρ̄}[1/ϖ]
of [BG19, Theorem 3.3.3] (or [BP19, Theorem 14]) and [BG19, Lemma 3.4.1] hold, via Grothendieck's ℓ-adic monodromy
theorem and Weil-Deligne representations; in particular each irreducible component of R^{□,µ}_{ρ̄}[1/ϖ] has an open
dense regular subscheme.' (9b), a new item routed to the Part II next to item 29: '[FKP19, Proposition 4.7 and Lemma
4.9] hold for the Zariski closure R of any irreducible component of R^{□,µ}_{ρ̄}[1/ϖ] at a place of a global function
field (using 9a).' In the route 1 brief, state that layer (0) imports (9a) and the trivial-prime local rings'
generic-fibre input from R08.2, and that nothing in R08.2 imports from the Part II.

### /2 — error

**Where.** research/blueprint/papers/PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22.result.json item /20 (Lemma 3.7); also items
/97, /22, /25 (notes), route 1 brief layer (1)-(2), sourceIssues (missing entry), report section 'How it is proved'

**Claim.** Lemma 3.7 is false as stated, and item 20 records it as true. For a fixed v the fields K_{eta_b^(v)} (b in B)
are strongly linearly disjoint (the t_b argument is correct), but as v varies they are not. The proof's second paragraph
uses 'tau_v generates Gal(K_{eta_b^(v)}/K)', whereas it would need tau_v to generate Gal(K^(v)/K) = (+)_b
F_p[Gamma_F]e_b^*. The image of tau_v there is the 'diagonal' vector (e_b^*)_b, which generates only the cyclic
submodule N. Whenever N is a proper submodule of (+)_b F_p[Gamma_F]e_b^*, the lemma fails. This happens in Theorem B's
own range (and is the multiplicity case m_i > 1 that the introduction says the t_b trick handles). Proposition 3.8 ('the
values eta_b^(v_m)(sigma_{v'_n}) may be independently (as m and b vary) specified', p. 18) and Theorem 4.4 (p. 22) rely
on the false statement, so the main chain (Theorems 4.4, 5.2 = E, 7.4 = B, Corollary 8.3 = C) has an unrepaired gap in
the paper. Coordinator note: Verified by the coordinator, with a simpler counterexample that needs no condition on χ̄.
§3 fixes an arbitrary k-basis of ρ̄(g^der)^* (p. 13: 'Fix a k-basis {e_b^*}_{b∈B}'). For G = GL_2 and any non-split ρ̄ =
(χ̄ ∗; 0 1) (Theorem B's range, Lemma 7.1), take the basis H⊗ζ, (H+E)⊗ζ, F⊗ζ. Since Ad(g)H = H − 2x(g)E and the
extension is non-split, both H⊗ζ and (H+E)⊗ζ generate ⟨H, E⟩⊗ζ, and both map to the same vector of its quotient Q =
F_p(κ̄). With f that quotient map, ζ_v := f∘η_1^(v) − f∘η_2^(v) vanishes on τ_v, so it is unramified at v, and the
pigeonhole argument above gives v ≠ v′ with f(η_1^(v) − η_2^(v) − η_1^(v′) + η_2^(v′)) = 0 on Γ_K. So the four fields
are not linearly disjoint. The first paragraph of the proof (fixed v) is right; the second uses that τ_v generates each
Gal(K_{η_b^(v)}/K), but τ_v acts on K^(v) by the diagonal (e_b^*)_b. When the cyclic modules F_p[Γ_F]e_b^* have pairwise
no common non-zero quotient, the diagonal generates their sum (Goursat) and the lemma holds; so a careful choice of
basis may repair it when such a basis exists. By the pass's multiplicity count, no basis works for G = GL_2 × GL_2 and
ρ̄ = (r, r). Whether Theorems B, C and E survive is not settled here.

**Evidence.** p. 15: 'Lemma 3.7. As the trivial prime v and the indices b in B vary, the fixed fields K_{eta_b^(v)} are
strongly linearly disjoint over K'; p. 16: 'As tau_v generates Gal(K_{eta_b^(v)}/K) as F_p[Gamma_F]-module, we as before
deduce that L must be ramified above v'. Counterexample: F = Q, p >= 5, k = F_p, rho-bar = (chi x; 0 1) non-split with
chi odd quadratic (allowed by Theorem B, Lemma 7.1 gives Assumption 3.1). Use rho-bar(g^der)^* = sl_2(1) (as in Lemma
7.1) and basis vectors e_1^* = E(x)zeta, e_2^* = F(x)zeta. Then M_1 = F_p e_1^* = F_p(chi kappa) and M_2 maps onto
(sl_2/b^0)(1) = F_p(chi^{-1} kappa) = F_p(chi kappa) =: Q. Take nonzero module maps f_i: M_i -> Q with f_1(e_1^*) +
f_2(e_2^*) = 0, and put zeta_v := f_1 eta_1^(v) + f_2 eta_2^(v). Then zeta_v(tau_v) = 0, so zeta_v - (f_1 theta_1 + f_2
theta_2) = f_1 theta_1^(v) + f_2 theta_2^(v) is unramified at v and lies in the finite group H^1(Gamma_{F,T_0}, Q), T_0
= T minus {t_0, t_b}. Hence zeta_v = zeta_{v'} for infinitely many pairs v != v'. On Gamma_K this is a nontrivial linear
relation f_1 eta_1^(v) + f_2 eta_2^(v) - f_1 eta_1^(v') - f_2 eta_2^(v') = 0. It is nontrivial because zeta_v(tau_{t_1})
= f_1(e_1^*) != 0, and the product of the four Galois groups contains (e_1^*,0,0,0), on which the relation takes the
value f_1(e_1^*) != 0. So Gal(K_{eta_1^(v)}K_{eta_2^(v)}K_{eta_1^(v')}K_{eta_2^(v')}/K) is a proper subgroup of the
product. Moreover f_1 eta_1^(v) lies in the span of the other three, so even K_{eta_1^(v)} meets the composite of the
others nontrivially. For G = GL_2 x GL_2 and rho-bar = (r, r) with r of large image, rho-bar(g^der)^* = S (+) S with S
absolutely irreducible of dimension 3. Every one of the 6 cyclic modules M_b contains a copy of S, while a cyclic
semisimple module has S-multiplicity at most 3. So N is a proper submodule and the lemma fails for every choice of
k-basis.

**Fix.** Add sourceIssue PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22/E45 (kind error; locator 'Lemma 3.7 and its proof, pp.
15-16; used in the proofs of Proposition 3.8, p. 18, and Theorem 4.4, p. 22'; printed: the two quotations above;
correction: 'For fixed v the K_{eta_b^(v)} (b in B) are strongly linearly disjoint over K and their composite K^(v) is
linearly disjoint from K_infty. For distinct v_1,...,v_s the inertia above v_j acts trivially on K^(v_i) (i != j) and on
K_infty, and generates inside Gal(K^(v_j)/K) = (+)_b F_p[Gamma_F]e_b^* only the cyclic submodule N generated by
(e_b^*)_b. The K^(v) are strongly linearly disjoint as v varies only if N is everything, which fails in general';
reason: the counterexamples above; affects: a stated result (Lemma 3.7) and the proof (Proposition 3.8, Theorem 4.4,
hence Theorems 5.2, 7.4 and Corollary 8.3 as proved); known: new). Replace item 20's statement by the corrected
statement and record the gap in its note. Restrict item 97's 'Hence' to families in which each class psi_i has its own
prime x_i at which psi_i(Gamma_K) = F_p[Gamma_F]psi_i(tau_{x_i}) and all psi_j (j != i) are unramified, and state that
this does not apply to {eta_b^(v)}_{v,b}. In items 22 and 25, and in the route 1 brief addendum, say that the
independence of the values eta_b^(v_m)(sigma_{v'_n}) must be re-proved, for example with FKP19 section 5's field K' and
End-linear pairings, or with an inertia-based argument. Note that with inertia alone a one-dimensional linear constraint
remains (see notes), so the repair is not routine. Change the report's 'make the fixed fields of the auxiliary cocycles
linearly disjoint (Lemma 3.7)' accordingly.

### /3 — error

**Where.** research/blueprint/papers/PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22.result.json items /22 and /25 (proof outlines
and notes); sourceIssues (missing entry); route 1 brief addendum

**Claim.** The proof of Proposition 3.8 makes a second disjointness claim with the same defect: that any composite K_h
of fields K_{h^(v)} is linearly disjoint over K from any composite K_eta of fields K_{eta_b^(v)}. Its proof notes that
tau_{t_0} generates the image of each single h^(v_0). But on K_h the element tau_{t_0} acts by (h^(v)(tau_{t_0}))_v,
which is nonzero in every coordinate, so a nonzero factor map does not force t_0 to ramify in K_h meet K_eta. The claim
is false, and so are the dependent claims: 'M and L_v as v varies are strongly linearly disjoint' (used for the density
bound in the limiting argument) and Theorem 4.4's 'K_{eta_b^(v)} ... and K_{h^(v)} ... are all strongly linearly
disjoint'. None of the items records this. Coordinator note: Verified by the coordinator against the text of p. 18. The
proof argues 'Since h^(v_0)(τ_{t_0}) generates the image of h^(v_0), t_0 must be ramified in L/K'. But every h^(v) is
ramified at t_0, so τ_{t_0} acts on K_h by the tuple (h^(v)(τ_{t_0}))_v. This is the same gap as /1. The claim is
applied to K_{h^(v_n)} and K_{η_b^(v_m)} for one tuple v, so the two families share primes, and private ramification at
v_n does not rescue it. The coordinator checked the counterexample in outline, not every step of the choice of l_E.

**Evidence.** p. 18: 'consider any composites K_h of fields of the form K_{h^(v)} and K_eta of fields of the form
K_{eta_b^(v)} (b can vary, and in both cases v can vary). ... Since h^(v_0)(tau_{t_0}) generates the image of h^(v_0),
t_0 must be ramified in L/K'; p. 19: 'all the fields M = prod_n M_n and L_v as v varies are strongly linearly disjoint
over K'; p. 22: 'the fields L = K(rho_{n-1}(g^der)), K(mu_{p^c}), K_{eta_b^(v)} (as v and b vary), and K_{h^(v)} (as v
varies) are all strongly linearly disjoint over K'. Counterexample (Theorem B range, Lemma 7.1): F = Q, p >= 5, k = F_p,
rho-bar = (kappa x; 0 1) non-split. Take Z = E in the second part of Proposition 3.6 (any root-vector family with Eq.
(1), e.g. one containing E and F, is allowed in Proposition 3.8). Then M_E = F_p E = F_p(kappa) =: Q. For a in l_E,
h^(a) = s(c_1 + c_2^(a)) with h^(a)(tau_a) = h^(a)(tau_{t_0}) = sE. With e_b^* = H(x)zeta, M_b = <H,E>(x)zeta surjects
onto (<H,E>/<E>)(1) = F_p(kappa) = Q via g. Choose lambda with lambda g(e_b^*) = sE, and put xi_a := h^(a) - lambda g
eta_b^(a) (Q-valued). Then xi_a is unramified at a, and on a subset of l_E where c_2^(a)(tau_{t_b'}) is constant, xi_a -
xi_{a'} is unramified at a, a', t_0 and every t_b'. So it lies in the finite group H^1(Gamma_{F,T_0}, Q), and xi_a =
xi_{a'} for some a != a'. Then h^(a) - h^(a') = lambda g(eta_b^(a) - eta_b^(a')) on Gamma_K, and it is nonzero (its
value at tau_a is sE). So K_{h^(a)}K_{h^(a')} meets K_{eta_b^(a)}K_{eta_b^(a')} nontrivially. Also xi_a = xi_{a'} is
nonzero (xi_a(tau_{t_0}) = sE), so L_v meets L_{v'} nontrivially for tuples with v_E = a, v'_E = a'.

**Fix.** Add sourceIssue PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22/E46 (kind error; locator 'proof of Proposition 3.8, pp.
18-19, and proof of Theorem 4.4, p. 22'; printed: the three quotations above; correction: 'K_h meets K_eta only inside
fields unramified at t_0; the subgroup generated by inertia at t_0 is F_p[Gamma_F](h^(v)(tau_{t_0}))_v, not the whole
product, so K_h and K_eta (and the L_v for different tuples) need not be linearly disjoint; the Cebotarev independence
used to intersect the conditions l_v with prod_m w_m, and the density bound delta(C_K cap ...) <= (1 - epsilon)^s, need
another proof'; reason: the counterexample; affects: the proof; known: new). In item 22's note replace 'a limiting
argument over Cebotarev sets using Proposition 3.6 and Lemma 3.7' by a sentence recording E45 and E46. Do the same in
item 25's note. Add E45 and E46 to the route 1 brief addendum and to the report's list of gaps, and do not describe
their repair as routine.

### /4 — error

**Where.** research/blueprint/papers/PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22.result.json item /82 (Lemma A.11, case (4)(b));
sourceIssues E40 (reason); new sourceIssue needed

**Claim.** Lemma A.11(4)(b) is false as printed and as kept by item 82. The proof (p. 48, item (iv)) identifies M = GL_n
so that M acts on u by the second exterior power of the standard representation, and the proof of (C2) needs (b) to kill
H^0(Gamma_F, rho(u)(1)) (p. 49). An invariant of Lambda^2(rho_M) tensor kappa is a skew form preserved by rho_M with
multiplier kappa^{-1}, not kappa. Counterexample: n = 2, G = SO_4 with form (0 I; I 0), P the stabiliser of span(e_1,
e_2), M = {diag(A, tA^{-1})}, u = {(I X; 0 I): X skew} on which A acts by det(A); take rho_M: Gamma_F -> GL_2(k)
absolutely irreducible with det rho_M = kappa^{-1} and [F(zeta_p):F] large, and rho a non-split extension in P(k) (a
class in H^1(Gamma_F, kappa^{-1}), which is nonzero e.g. for F = Q). Printed (b) holds (rho_M preserves the standard
skew form with multiplier det rho_M = kappa^{-1}, which is not kappa), but rho(u)(1) = det(rho_M) kappa is trivial and
is a Gamma_F-submodule of rho(so_4)(1) = rho(so_4)^*, so (C2) fails. Same failure for SO_8 with rho_M: Gamma_F ->
GSp_4(k) absolutely irreducible with similitude kappa^{-1}. The same sign error is present in case (2) even when delta =
1; E40's corrected (b) (multiplier delta kappa^{-1}) fixes it, but E40's reason attributes the change only to the
similitude. Coordinator note: Verified by the coordinator. With P the stabiliser of span(e_1, …, e_n) for the form (0 I;
I 0), M = {diag(A, ᵗA^{−1})} acts on u = {(0 X; 0 0): X skew} by X ↦ AXᵗA, which is Λ²(std), as the proof's (iv) says. A
non-zero invariant of Λ²ρ̄_M ⊗ κ̄ is, by Schur, the inverse of a non-degenerate alternating form J with ᵗρ̄_M J ρ̄_M =
κ̄^{−1}J. So the condition that (C2) needs is 'no form with multiplier κ̄^{−1}'. Case (1)'s printed (b) has the
consistent sign, and E40 already uses δκ̄^{−1} in case (2).

**Evidence.** p. 48: '(4) G = SO_2n ... (b) rho_M does not preserve a nondegenerate skew-symmetric form up to a scalar
with multiplier character kappa.' and '(iv) G = SO_2n and P as in (4): in this case the representation of M on u is the
second exterior power of the standard representation of GL_n.'; p. 49: 'As in case (C1), the assumption (b) implies that
H^0(Gamma_F, rho(u)(1)) = 0.' Case (1) has the consistent sign: H^0(rho(u)(1)) = Hom(rho'', rho' kappa)^Gamma, and the
printed (1)(b) is 'rho'_M not isomorphic to rho''_M tensor kappa^{-1}'.

**Fix.** In item 82 replace case (4) by: '(4) SO_2n (form (0 I; I 0)), stabiliser of a maximal isotropic subspace, M =
GL_n via A -> diag(A, tA^{-1}), so that u = Lambda^2(std): (a) rho_M preserves no non-degenerate alternating form
(multiplier 1), (b) rho_M preserves no non-degenerate alternating form with multiplier kappa^{-1}. The paper prints
multiplier kappa in (b).' Add a sourceIssue (kind error, affects 'a stated result', locator 'Appendix A.2, Lemma
A.11(4)(b), p. 48'): printed '(b) rho_M does not preserve a nondegenerate skew-symmetric form up to a scalar with
multiplier character kappa'; correction 'with multiplier character kappa^{-1}' (with M = GL_n acting on u by
Lambda^2(std), as in (iv)); reason: the SO_4 counterexample above. Append to E40's reason: 'Even for delta = 1 the
printed (b) has kappa where H^0(rho(u)(1)) = 0 requires kappa^{-1}.' Nothing in the body uses case (4).

### /5 — error

**Where.** research/blueprint/papers/PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22.result.json item /118

**Claim.** Item 118 states: 'In an adjoint group, or more generally one with simply connected derived group, the
centraliser of a semisimple element is a connected reductive subgroup.' This is false and is not Steinberg's Theorem
3.14. Adjoint groups are not a special case of groups with simply connected derived group, and in an adjoint group
centralisers of semisimple group elements can be disconnected: in PGL_2 over k of characteristic not 2, s = image of
diag(1, -1) is centralised by the image of (0 1; 1 0), since (0 1; 1 0) diag(1,-1) (0 1; 1 0)^{-1} = -diag(1,-1), so
Z(s) = N(T) has two components. Steinberg's Theorem 3.14 concerns semisimple elements of the Lie algebra: Z_G(X) is
connected for all semisimple X in Lie(G) if and only if p is not a torsion prime for G. It fails for adjoint groups at
torsion primes: in PGL_p the cyclic permutation matrix centralises the image of diag(0, 1, ..., p-1) in pgl_p. The
paper's use is correct (z lies in Z(m') inside Lie(G^ad) and p >> 0); the item's statement is not.

**Evidence.** p. 48: 'By [Ste75, Theorem 3.14] the centralizer in G^ad of z (in fact any semisimple element) is a
connected reductive subgroup, so by a standard Lie algebra computation (recall p >>_G 0) ...', where z is a nonzero
element of Z(m'), a Lie-algebra element. FKP19 (arXiv 1904.02374v5), proof of Lemma A.2, p. 61: 'The subgroup C_G(X) is
a connected reductive group containing T: for the connectedness, we use that p > 5 (ensuring p is not a "torsion prime")
so that we can invoke [Ste75, Theorem 3.14]', with X a semisimple element of g, G adjoint. arXiv 2411.07748, section
2.3.1, citing Steinberg: '(1) If [G, G] is simply connected, then G_s^0 = G_s for all s in T ... (2) p is not a torsion
prime for G if and only if G_xs^0 = G_xs for all xs in t ([46, Theorem 3.14])'.

**Fix.** Replace item 118's statement by: 'Let G be a connected reductive group over an algebraically closed field of
characteristic p. Then p is not a torsion prime for G if and only if, for every semisimple X in Lie(G), the centraliser
Z_G(X) is connected; it is then reductive, generated by a maximal torus T with X in Lie(T) and the root subgroups
U_alpha with d alpha(X) = 0. As used (Lemma A.11): for p >>_G 0 and 0 != z in Z(m') in Lie(G^ad), Z_{G^ad}(z) = M'. (For
semisimple elements of the group, connectedness needs a simply connected derived group, and fails in PGL_2.)'. Name:
'Centralisers of semisimple Lie-algebra elements ([Ste75, Theorem 3.14])'.

## All findings

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | error | result item /9 (route 2, LocalGaloisDeformationRings:R08.2) together … | Item 9, routed whole to R08.2, bundles a local input (Bellovin-Gee's generic-fibre analysis, Theorem 3.3.3 and Lemma 3.4.1, at places of a function field) with … |
| /2 | high | error | result item /20 (Lemma 3.7); … | Lemma 3.7 is false as stated, and item 20 records it as true. For a fixed v the fields K_{eta_b^(v)} (b in B) are strongly linearly disjoint (the t_b argument … |
| /3 | high | error | result items /22 and /25 (proof outlines and notes); … | The proof of Proposition 3.8 makes a second disjointness claim with the same defect: that any composite K_h of fields K_{h^(v)} is linearly disjoint over K … |
| /4 | high | error | result item /82 (Lemma A.11, case (4)(b)); … | Lemma A.11(4)(b) is false as printed and as kept by item 82. The proof (p. 48, item (iv)) identifies M = GL_n so that M acts on u by the second exterior power … |
| /5 | high | error | result item /118 | Item 118 states: 'In an adjoint group, or more generally one with simply connected derived group, the centraliser of a semisimple element is a connected … |
| /6 | medium | duplicate | result route 1 (brief layer (0), reason) and items /5, /95 | Layer (0) of the Part II plans 'the G-valued standing hypotheses and multiplier-fixed lifting functors', and item 5's note and the route reason say the … |
| /7 | medium | duplicate | result item /108 (route 1) | Item 108 (Serre's semisimplification of a G-valued representation: projection to a Levi of a minimal parabolic containing the image, unique up to conjugacy) is … |
| /8 | medium | error | result route 3 (stages and reason), item /6 note, route 1 brief … | Route 3, item 6's note and the Part II brief place the Greenberg-Wiles formula in ArithmeticGaloisDuality:R02.6. The accepted restructuring RS-08 and the … |
| /9 | medium | error | result route 3 and item /6; … | Route 3 sends all of item 6 to ArithmeticGaloisDuality as 'the equal-characteristic cases of those layers', but (i) the first sentence of item 6 is Tate local … |
| /10 | medium | duplicate | result items /68, /69 (route 4) and prerequisite 9 (BLGGT14); … | Items 68 and 69 are marked missing and their notes do not mention that the theorems they modify are already planned nodes of the … |
| /11 | medium | duplicate | result item /66 (route 5) versus items /89 and /119 (route 2) | Item 66 bundles two notions and sends both to PolarizedAutomorphyLifting. Its Galois half, ξ-ordinary representations ρ : Γ_K → GL_n(ℚ̄_p) with their de … |
| /12 | medium | error | result route 5 brief | The route 5 brief, which the design job reads, says that Allen-Newton-Thorne Theorem 1.1 is 'applied in Proposition 9.1 over L′ = LF′ with its hypotheses … |
| /13 | medium | missing | result route 1 brief, 'Import, never re-plan' | The brief's import list omits stages that route-1 items consume, so the design job has no instruction to import them: AlgebraicModularFormsAndSerreWeights … |
| /14 | medium | error | result item /8 (planned); … | Item 8 (the tame quotient of the Galois group of a local field with residue characteristic ≠ p is ℤ_p ⋊ Ẑ with στσ^{−1} = τ^{#𝔽}, in both characteristics) is … |
| /15 | medium | missing | result items (none); … | Proposition 3.6, Proposition 3.8 and Theorem 4.4 use results of FKP19 section 5 as black boxes, and no item records them (items 29, 96 and 102-107 cover FKP19 … |
| /16 | medium | missing | result item /24 (Lemma 4.3) and route 1 | Lemma 4.3 and Theorem 4.4 depend on two group-theoretic inputs that no item records. (i) For p >> G 0 and m >= 2, the abelianisation of Ĝ^der(O/varpi^m) is … |
| /17 | medium | missing | result item /72 (Proposition 9.1) and route 1 (no item records … | The proof of Proposition 9.1 produces its p-adic lift by [FKP19, Theorem A] (twice: the ordinary lift and the Steinberg place v_0), the main lifting input of … |
| /18 | medium | error | result item /110 (Local-global compatibility at p for newforms), used … | Item /110 states only 'rho_{f,iota}/_{Gamma_Qp} is de Rham with Hodge-Tate weights {0, r-1}, and crystalline when p does not divide N'. Theorem 7.4's second … |
| /19 | medium | missing | result sourceIssues (new gap) and items /53, /47 | In the proof of Theorem 7.4 the component at p is chosen as 'an irreducible component of R^{box,mu omega,v}[1/varpi'] that is ordinary ... of the same inertial … |
| /20 | medium | error | result item /94 (note); … | The proof of Lemma B.4(2) concludes that O^_{G_lambda[1/p], y~} = E[[X_1..X_h]]/(f_1..f_h') with h' = h^2(Gamma_Fv, r(b_0)). This is false: imposing the torus … |
| /21 | medium | missing | result (no item; … | Dickson's classification of finite subgroups of PGL_2(k) is used in Example A.16 to compute N (4 in general; 2 except for A_4, where it is 3, and the even … |
| /22 | medium | duplicate | result item /78 and route part-ii; … | Guralnick's Theorem A ('Small representations are completely reducible', J. Algebra 220 (1999)) now has two owners. PAPER-LIU-ETAL-22 routes it (item … |
| /23 | medium | duplicate | result item /117 and route part-ii; … | Item 117 bundles three things into the FKP Part II: the definition of an absolutely (G-)irreducible subgroup, [FKP19, Lemma A.2] (H^0(Gamma, g^der) = 0) and … |
| /24 | medium | error | result item /78 | Item 78 records [Gur99, Theorem A] only as semisimplicity: 'the k[Gamma_F]-modules rho(m'), rho(u), rho(u^-), hence rho(g^der)^ss, are semisimple, and likewise … |
| /25 | medium | error | result item /119 (also /90) | Item 119 drops the standing hypothesis that lambda is dominant (and regular). It states that any r: Gamma_Fv -> B_0(A) whose torus part on I_{F'_v} is … |
| /26 | medium | missing | result (no item; … | The proof of Lemma B.4 uses the local Euler characteristic formula and local Tate duality for Gamma_Fv, v / p, with coefficients in E-vector spaces: h^0 - h^1 … |
| /27 | low | missing | result prerequisites | Barnet-Lamb-Gee-Geraghty, 'Congruences between Hilbert modular forms: constructing ordinary lifts' (BLGG12) is used in a proof (Lemma 7.2(2), item 46: 'the … |
| /28 | low | error | result prerequisites 6, 9, 15, 16, 20, 21, 22 | Four prerequisites are papers the atlas already covers, contrary to PROTOCOL §16 ('the papers this one builds on that the atlas does not yet cover'), and they … |
| /29 | low | other | report (header list, 'What the atlas already has', 'Routes', 'Source …; … | The reader report repeats pre-review numbers and claims that the result file no longer has: '94 items: 8 planned, 86 missing', '15 prerequisite entries', '7 … |
| /30 | low | other | result sourceIssues E8 (correction field) | E8's correction, '… multiplicity-free as a k[Γ_Q]-module (and for ad⁰)', is itself not right as written. The full adjoint ad(rho-bar) = gl_2 contains the … |
| /31 | low | other | result sourceIssues E15 (misses) and item /25 note | Some slips on pp. 3 and 21-22 are not recorded. On p. 3, K is written F(rho-bar, μ_p), 'the minimal Galois extension of F', in the Γ_Q setting. On p. 22, 'v, … |
| /32 | low | missing | result items /3, /28, /53 (no definition item) | No item defines 'geometric' lift, the property that Theorems A, B and E assert (in the number-field case: unramified outside a finite set and de Rham at the … |
| /33 | low | other | result summary | The summary paraphrases Assumption 4.1 as 'no common subquotients of rho-bar(g^der) and rho-bar(g^der)^*'. That is strictly stronger than the assumption, which … |
| /34 | low | missing | result item /62 (Theorem 8.1), proof outline | The outline says Theorem 5.2 gives a finitely ramified lift and L. Lafforgue makes it automorphic. Lafforgue's correspondence (item /59) applies only to … |
| /35 | low | error | result item /51 (Pan), planned list and note | Item /51 is planned at GL2ModularityLifting:R32.4 and OrdinaryAutomorphicFormsAndModularityLifting:R21.5. Its note says R32.4 plans Pan 'for p >= 5' and that … |
| /36 | low | missing | result (no item for the local and global Kronecker-Weber theorems); … | The proof of Theorem 7.4 cites 'the local and global Kronecker-Weber theorems' to inflate omega to Gamma_Q. Items /53 and /109 say this is planned in Tau … |
| /37 | low | other | result item /69 (compatible systems via the argument of BLGGT14 … | Item /69 says only 'a rho that is automorphic over a suitable F' ... belongs to a strictly pure compatible system'. BLGGT14 Theorem 5.5.1 itself does not apply … |
| /38 | low | duplicate | result item /63 (Remark 8.2), note; … | Item /63's note says 'de Jong's conjecture is not in the atlas' and that Remark 8.2 is 'Recorded in the Part II's function-field application with those … |
| /39 | low | other | result item /70 (Booher's lifts and Steinberg points), note | The note says 'G-valued local deformation theory away from p is not planned (R08.2 is GL_2)'. The LocalGaloisDeformationRings packet plans R08.2 for GL_n: … |
| /40 | low | error | result item /40 (Lemma 6.5), locator | Lemma 6.5 and its proof are both on p. 30; the locator 'pp. 29-30' is a slip (p. 29 holds Lemma 6.4 and the start of its proof). |
| /41 | low | other | result item /32 (Lemma 5.3), note | The note 'uses Lemma 2.1 and the choice of M' covers only the first assertion. The second assertion (H^1(Gal(F*_N/F), rho_M(g^der)^*) = 0) uses Assumption 3.1 … |
| /42 | low | error | result item /84 (note on Remark A.15); … | Remark A.15 claims a constant n_G, depending only on G, such that D(s,t,N) holds for chi = kappa^n for all n mod p - 1 outside a set of at most n_G classes. … |
| /43 | low | error | result item /81; … | Section A.1.2 says 'The group G^der is the GL_n factor of G^0 and we denote its Lie algebra by g_n'. With the paper's convention (p. 9: G^der is the derived … |
| /44 | low | missing | result (no item; … | Lemma A.10 is stated for the Clozel-Harris-Taylor group G_n = (GL_n x GL_1) semidirect {1, j} with j(g, mu)j^{-1} = (mu tg^{-1}, mu) [CHT08, section 2.1]. No … |
| /45 | low | other | result sourceIssues E41 (and item /84 note) | The root cause of E41 is in the proof of Lemma A.14, which E41 does not mention. The sufficient condition for (C3) stated there compares only … |
| /46 | low | other | result item /117 (locator) | Item 117's locator omits two of the paper's citations of FKP19 Appendix A in this range. Lemma A.6 is cited on p. 46 (proof of Lemma A.9), and Lemma A.1 … |

## Notes for the fix job

- **The gap.** Record Lemma 3.7 and the disjointness claims of pp. 18–19 and 22 as new sourceIssues (gap, affecting the
  proof of the lifting theorem), correct item 20 and the notes of items 22, 25 and 97, and do not describe a repair as
  routine. A basis whose cyclic modules have pairwise no common quotient makes Lemma 3.7 true, but such a basis need not
  exist.
- **Statements.** Correct items 82 (κ̄^{−1}), 118 (Steinberg is about Lie-algebra elements), 110, 119 and 94's note, and
  add the new gap of /19 in Theorem 7.4.
- **Routes.** Split item 9; import G-valued functors, Serre's semisimplification, Guralnick's theorem and absolute
  G-irreducibility from their existing owners; fix route 3's stages and suppliers; complete the route 1 import list.
