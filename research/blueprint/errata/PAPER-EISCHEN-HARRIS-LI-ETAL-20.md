# Reviewed errata: Eischen–Harris–Li–Skinner (2020)

Paper: *p-adic L-functions for unitary groups*, Forum of Mathematics, Pi 8 (2020), e9, [DOI 10.1017/fmp.2020.4](https://doi.org/10.1017/fmp.2020.4).

Independent review: Codex `codex-c83e7a`, job `REV-ERRATA-PAPER-EISCHEN-HARRIS-LI-ETAL-20`, 23 September 2026. This replaces the previous report's unsupported repairs and search claims. The [review](../reviews/REV-ERRATA-PAPER-EISCHEN-HARRIS-LI-ETAL-20.md) records provenance, source hashes, reading scope, correction searches and every verdict. The [JSON](./PAPER-EISCHEN-HARRIS-LI-ETAL-20.json) contains 166 findings: 162 confirmed and four rejected. "Confirmed" concerns the specified defect; it does not certify all downstream arguments after a local correction. Partial publication repairs are labelled explicitly.

## E1 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §1.1, p. 6, formula for the Garrett map, in arXiv v5; present in v4 at p. 6 Independent review source locations: v5 PDF pp. 6; v4 PDF pp. 6; published PDF pp. 6; v1 PDF pp. 5–7; v2 PDF pp. 5–7; v3 PDF pp. 5–7.

**Printed:** "G(f, φ, s)(g_2) = χ^{−1}∘det(g_2) · ∫_{U(V)(F)\U(V)(A)]} E(χ, s, f, (g_1, g_2))φ(g_1)dg_1"

**Correction or missing argument:** Domain of integration [U(V)(F)\U(V)(A)] (opening bracket missing), i.e. U(V)(F)\U(V)(A).

**Independent check:** The Garrett-map denominator visibly ends in an unmatched closing bracket in v5 p.6 and published p.6. Balancing the brackets leaves the intended left quotient unchanged. v4 p.6 additionally uses a forward slash.

## E2 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §1.1.2, p. 9, first paragraph, in arXiv v5; present in v4 at p. 8 Independent review source locations: v5 PDF pp. 5–6, 9; v4 PDF pp. 5–6, 8; published PDF pp. 5–6, 9; v1 PDF pp. 5–7; v2 PDF pp. 5–7; v3 PDF pp. 5–7.

**Printed:** "the global terms (L(0, π, χ), Q_{π,χ}) in Equation (2)"

**Correction or missing argument:** (L(0, π, χ), P_{π,χ}): Equation (2) contains the period P_{π,χ}, not Q_{π,χ}.

**Independent check:** Section 1.1.2 retains Q for the period called P in the displayed interpolation formula and adjacent discussion. The renaming is incomplete, rather than a new period. Both the v5 p.9 and published p.9 sentence retain Q.

## E3 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §1.4.3, p. 13, lines 1–3 after Hypotheses 1.4.4, in arXiv v5; present in v4 at p. 12 Independent review source locations: v5 PDF pp. 13; v4 PDF pp. 12; v1 PDF pp. 11; published PDF pp. 13.

**Printed:** "let Z ⊂ Z_G(A) be any closed subgroup such that Z_G(A)/Z is compact; for example, one can take Z to be the group of real points of the maximal F-split subgroup of Z_G"

**Correction or missing argument:** "such that Z · Z_G(F)\Z_G(A) is compact".

**Independent check:** For GL1/Q the displayed example gives A^times/R^times, whose finite-idele valuation map surjects onto the infinite discrete group direct_sum_l Z. It is not compact. The central quotient in the pairing includes rational points, so the compactness condition must include Z_G(F) too.

## E4 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** §1.4.3, p. 13, formulas (4)–(6), in arXiv v5; present in v4 at pp. 12–13 Independent review source locations: v5 PDF pp. 13; v4 PDF pp. 12; v1 PDF pp. 11; published PDF pp. 14.

**Printed:** "Assume moreover that we are given non-degenerate pairings of G(F_v)-spaces ⟨,⟩_{π_v}: π_v ⊗ π_v^∨ → C for all v. Then there is a constant C = C(dg, fac_π, fac_{π^∨}, ∏_v⟨,⟩_{π_v}) such that … ⟨φ, φ^∨⟩_Z = C(…) ∏_v ⟨φ_v, φ_v^∨⟩_{π_v}."

**Correction or missing argument:** Add the hypothesis that for almost all v the local pairings satisfy ⟨φ_v^0, φ_v^{∨,0}⟩_{π_v} = 1 for the distinguished vectors used to form the restricted tensor products ⊗′π_v, ⊗′π_v^∨ (implicit in fac_π, fac_{π^∨}); only then is ∏_v ⟨φ_v, φ_v^∨⟩_{π_v} a finite product and (6) meaningful.

**Independent check:** Arbitrary nondegenerate local pairings do not define the asserted product: take the trivial representation of GL1 and multiply the normalized pairing by 2 at every finite place. The spherical product diverges. Normalize distinguished vectors to pair to 1 at almost every place; Schur uniqueness then supplies C. The claim of existence as stated is false, so change gap/nothing to error/a stated result. This does not disprove the later application with normalized pairings.

## E5 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** §1.4.3, p. 14, sentence after (7), in arXiv v5; present in v4 at p. 13 Independent review source locations: v5 PDF pp. 14; v4 PDF pp. 13; v1 PDF pp. 11; published PDF pp. 14; v3 PDF pp. 12.

**Printed:** "In situation (2) of Hypotheses 1.4.4, we take K_v = ∏_i GL(n_i, O_i); however, the pairing (7) does not depend on the choice of K_v."

**Correction or missing argument:** Replace 'however, the pairing (7) does not depend on the choice of K_v' by 'changing K_v to bK_vb^{-1} (b ∈ B) multiplies the pairing (7) by δ_B(b); we fix K_v as stated'.

**Independent check:** The independence assertion is false. For GL2(Q_p), K=GL2(Z_p), b=diag(p,1), and the K-spherical delta_B-equivariant F with F(1)=1, averaging over bKb^{-1} yields 1/p rather than 1. Conjugation changes the functional by delta_B(b). Keep K fixed or state this scalar dependence. Correct reach to a stated result; absorption into C limits downstream impact but does not make the independence assertion true.

## E6 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §2.1, p. 15, last lines (equivalence of quadruples), in arXiv v5; present in v4 at p. 14 Independent review source locations: v5 PDF pp. 15; v4 PDF pp. 14; published PDF pp. 16.

**Printed:** "two quadruples (A, λ, ι, α) and (A′, λ′, ι′, α′) are equivalent if there exists a prime-to-□ isogeny f : A → A′ such that λ equals f^∨∘λ′∘f up to some positive element in Z_(□)^×, ι′(b)∘f = f∘ι(b) for all b ∈ O_B, and α′ = f∘α."

**Correction or missing argument:** "prime-to-□ quasi-isogeny" (a Z_(□)^×-isogeny as in Lan's isogeny-class formulation), or 'the equivalence relation generated by' the printed relation.

**Independent check:** Literal isogenies need not give a symmetric relation with the exact prime-to-p level condition. For an elliptic curve with End=Z, take f=[ell] with ell!=p and alpha_prime=ell*alpha. A reverse genuine endomorphism [m] would require m*ell to be a unit at ell in the compact integral level group, which is impossible. A prime-to-p quasi-isogeny has the necessary inverse; the intended equivalence is clear.

## E7 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §2.2, p. 16, definition of the signature of h, in arXiv v5; present in v4 at p. 15 Independent review source locations: v5 PDF pp. 16–17, 21–22; v4 PDF pp. 15–16; published PDF pp. 17–18, 21–23.

**Printed:** "The homomorphism h determines a pure Hodge structure of weight −1 on V = L ⊗ C. Let V^0 ⊂ V be the degree 0 piece of the Hodge filtration; this is an O_B ⊗ C-submodule. For each σ ∈ Σ_𝒦, let a_{σ,i} = dim_C e_i(V^0 ⊗_{O⊗C,σ} C)."

**Correction or missing argument:** V^0 should be V^{−1,0} ≅ V/V^{0,−1} (the summand on which h(z) acts by z; Lan's V_0, the Lie-algebra side of the Kottwitz determinant condition), not the degree-0 Hodge filtration step F^0V = V^{0,−1}.

**Independent check:** For a weight -1 Hodge structure F^0=V^{0,-1}, whereas Section 2.6.1 uses W=V/V^{0,-1} and Section 2.6.3 gives its sigma ranks a. Section 2.3 also assigns a=r for h(z)=diag(zI_r,zbarI_s). Thus the signature definition needs the V^{-1,0} summand (or the quotient), rather than F^0.

## E8 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §2.2, p. 17, lines 3–4, in arXiv v5; present in v4 at p. 15 Independent review source locations: v5 PDF pp. 17; v4 PDF pp. 15; v1 PDF pp. 14; published PDF pp. 17.

**Printed:** "(the O_B-action on Hom_{Z_p}(E_{i,w}, Z_p) factors through e_iO_B ⊗ Z_(p) and is given by bφ(x) = φ(b^∗x))"

**Correction or missing argument:** Hom_{Z_p}(O_w, Z_p) (the dual of a copy of O_w in e_iL_w⁺); E_{i,w} is never defined.

**Independent check:** The surrounding sentence identifies the dual of O_w, and the unexplained E_{i,w} in its parenthesis has no role in that identification. Replace it by O_w.

## E9 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** §2.3, p. 17, construction of P from hermitian pairs, in arXiv v5; present in v4 at pp. 15–16 Independent review source locations: v5 PDF pp. 14, 17; v4 PDF pp. 15–16; v1 PDF pp. 14; published PDF pp. 15, 18.

**Printed:** "Let δ ∈ O be totally imaginary and prime to p, and put ⟨·,·⟩_i = trace_{𝒦/Q} δ⟨·,·⟩_{V_i}. … let h_{i,σ} : C → End_R(V_{i,σ}) be h_{i,σ}(z) = diag(z1_{r_{i,σ}}, z̄1_{s_{i,σ}}). Let Σ = {σ ∈ Σ_𝒦 : p_σ ∈ Σ_p}. … Then P = (B, ∗, O_B, L, 2π√−1⟨·,·⟩, h) is a PEL datum of unitary type"

**Correction or missing argument:** δ must also satisfy a sign condition tied to the CM type Σ: Im σ(δ) > 0 for all σ ∈ Σ if ⟨·,·⟩_{V_i} is 𝒦-linear in the first variable (Im σ(δ) < 0 for all σ ∈ Σ if linear in the second). Such δ exist (weak approximation), so the fix is to choose δ after Σ.

**Independent check:** A merely imaginary p-unit delta does not guarantee the PEL positivity axiom. With the hermitian form linear in the first variable each nonzero sigma component contributes 2 Im(sigma(delta))*|x|^2. Replacing an allowed delta by -delta reverses positivity without changing the stated hypotheses. Require positive imaginary parts on the chosen CM type (negative for the other linearity convention). Classify as error because the asserted construction is false for permitted choices.

## E10 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §2.3, p. 18, line 13, in arXiv v5; present in v4 at p. 16 Independent review source locations: v5 PDF pp. 18; v4 PDF pp. 16; v1 PDF pp. 15; published PDF pp. 18.

**Printed:** "If dim_𝒦 V_1 is odd or m ≥ 1, this is no longer the case."

**Correction or missing argument:** "If dim_𝒦 V_1 is odd or m > 1, this is no longer the case (in general)."

**Independent check:** The m>=1 condition includes the m=1 even-dimensional case declared immediately before to satisfy the Hasse principle. The intended alternative is m>1, and the failure should be phrased as possible in general, not inevitable in every odd-dimensional example.

## E11 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §2.3, Remark 2.3.1, p. 18, in arXiv v5; present in v4 at p. 16 Independent review source locations: v5 PDF pp. 18; v4 PDF pp. 16; v1 PDF pp. 15; published PDF pp. 19.

**Printed:** "with a smooth, quasi-projective S_0-model provided by its scheme-theoretic closure in M_K"

**Correction or missing argument:** S_□-model (S_□ = O_F ⊗ Z_(□) as in §2.1).

**Independent check:** The smooth model is over the previously defined base S_square. S_0 in this remark is an inconsistent symbol for that base, not the later extension base used in Section 2.6.3. The later coefficient ring is S0, not S0-prime; the latter is itself the typo confirmed as E18.

## E12 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** §2.3.2, p. 18, lines 6–8 of §2.3.2, in arXiv v5; present in v4 at pp. 16–17 Independent review source locations: v5 PDF pp. 18; v4 PDF pp. 16–17; v1 PDF pp. 15; published PDF pp. 19.

**Printed:** "Suppose 𝒦_1, …, 𝒦_r are finite CM extensions of 𝒦 with Σ_{i=1}^r [𝒦_i : 𝒦] = n. … Let V′_i = 𝒦_i, viewed as a 𝒦-space of dimension [𝒦_i : 𝒦]. Each V′_i can be given a 𝒦_i-hermitian structure such that ⊕_i V′_i is isomorphic to V as an hermitian space over 𝒦."

**Correction or missing argument:** This must be a hypothesis on (𝒦_1, …, 𝒦_r) ('Suppose each V′_i can be given …'); it holds e.g. when all 𝒦_i = 𝒦, but not for arbitrary CM extensions.

**Independent check:** The claimed embedding for arbitrary CM extensions is false. For K=Q(i), K1=Q(i,sqrt2), V=<1,3>, trace forms Tr(alpha*x*ybar) with alpha=a+b sqrt2 have Gram matrix [[2a,4b],[4b,4a]] and determinant 8(a^2-2b^2). At 3 both quadratic norm valuations are even; the determinant ratio to 3 has odd valuation, obstructing isometry. Taking p=5 makes this compatible with the p-adic setup. Make the trace-form realization a hypothesis. Correct reach to a stated result while distinguishing the available special case Ki=K.

## E13 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** §2.3, p. 18, lines 3–5, in arXiv v5; present in v4 at p. 16 Independent review source locations: v5 PDF pp. 18; v4 PDF pp. 16; v1 PDF pp. 14; published PDF pp. 18.

**Printed:** "More precisely, the elements of ker¹(Q, G) classify isomorphism classes of hermitian tuples 𝒱′ = (V′_j, ⟨·,·⟩_{V′_j})_{1≤j≤m} that are locally isomorphic to 𝒱 at every place of Q."

**Correction or missing argument:** Replace isomorphic/isomorphism classes by locally similar tuples modulo global common similarity.

**Independent check:** The group G permits a common similitude factor. The exact sequence 1->U->G->G_m->1 and H^1(Q,G_m)=1 identify its torsors with hermitian tuples modulo common rational scaling; locally the same statement uses Q_v^times. Thus local triviality means local similarity with one common scalar at each place, not componentwise local isometry. Correct the equivalence relation and record reach as a stated classification result.

## E14 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §2.5, p. 20, second paragraph, in arXiv v5; present in v4 at p. 18 Independent review source locations: v5 PDF pp. 20; v4 PDF pp. 18; published PDF pp. 21.

**Printed:** "Generally, the scheme M̄_{K_r} (resp. M̄_{K_r,L}) is étale and quasi-finite but not finite over M^tor_K (resp. M^tor_{K_r,L})."

**Correction or missing argument:** (resp. M^tor_{K,L}).

**Independent check:** The preceding definition is a pullback along M^tor_{K,L}->M^tor_K. Its structure map therefore has target M^tor_{K,L}, not the undefined M^tor_{K_r,L}. The extra r persists in published p.21.

## E15 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** §2.5, p. 20, last lines before (14), in arXiv v5; present in v4 at pp. 18–19 Independent review source locations: v5 PDF pp. 20; v4 PDF pp. 18–19; published PDF pp. 21.

**Printed:** "and M̄_{K_r/F} (resp. M̄_{K_r,L/F}) is the normalization of M^tor_{K/F} (resp. M^tor_{K,L/F}) in M_{K_r/F} (resp. M_{K_r,L}/F)."

**Correction or missing argument:** Replace equality with the dense open subscheme of the normalization on which the multiplicative level structures extend; do not infer equality of cusp-form spaces from that open immersion.

**Independent check:** The normalization in the finite generic cover is finite over the excellent toroidal compactification. The moduli of multiplicative injections is only the open part where these injections extend; missing boundary branches already occur in characteristic zero. In the Tate elliptic-curve model, p^2-1 generic nonzero p-torsion choices reduce to p-1 choices on the toric fiber; the other branches require q^(1/p) and ramify. A normal separated quasi-finite cover is an open subspace of its finite normalization. Replace equality with this open immersion and retain the separate need to justify cusp-form comparisons. The normalization assertion itself is a stated result.

## E16 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** §2.5, p. 20, lines 5–3 from the bottom before (14), in arXiv v5; present in v4 at p. 18 Independent review source locations: v5 PDF pp. 20; v4 PDF pp. 18; published PDF pp. 21.

**Printed:** "The choice of a basis of Z_p(1) naturally identifies M_{K_r/F} (resp. M_{K_r,L}) with M_{I_rK^p/F} (resp. M_{I_rK^p,L/F} = S_{I_rK^p}(G, X_P))"

**Correction or missing argument:** State the basis-induced identification over F(mu_{p^r}), or on complex points. Over F keep the cyclotomic twist of the moduli problem; the corresponding subgroup has diagonal nu on L+ and unipotent diagonal on L-.

**Independent check:** The displayed identification induced by a chosen basis of Z_p(1) is not Galois equivariant over F unless the relevant roots of unity are present. In the I_r-level problem, the graded pieces of L+ have trivial Galois action; the multiplicative-level problem twists them by the cyclotomic character. After adjoining mu_{p^r} the chosen identification is valid. This identifies a descent error in the specified map, and does not rule out a different F-isomorphism involving an isogeny or a change of level subgroup. Record error/a stated result for the asserted F-identification.

## E17 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §2.6.1, p. 21 (definition of Λ_0^∨ and ⟨·,·⟩_can) and §2.6.3, p. 22 (Λ^∨_{0,σc}), arXiv v5 Independent review source locations: v5 PDF pp. 21–22; v4 PDF pp. 19–20; published PDF pp. 22–23.

**Printed:** Λ_0^∨ = Hom_{Z_(p)}(Λ_0, Z_(p)(1)) ... ⟨·,·⟩_can : Λ × Λ → Z_(p)(1)

**Correction or missing argument:** Define Lambda0^vee=Hom_{S_square}(Lambda0,S_square(1)), with the indicated twisted O_B action, and use the S_square-valued evaluation pairing. After extension to S0, use Lambda_{0,sigma c}^vee=Hom_{S0}(Lambda_{0,sigma},S0(1)). Alternatively specify the trace-dual identifications and base-change them before taking embedding components; merely changing p to square in the component formula is insufficient.

**Independent check:** For square=empty, Lambda0 is a nonzero F-vector space and Hom_{Z_(p)}(Lambda0,Z_(p))=0: the image of any element is divisible by every power of p. Thus the printed dual cannot supply its claimed complementary Hodge summand. The original replacement p->square addresses this vanishing but does not explicitly repair the coefficient-ring problem after base change in Section 2.6.3. Use the dual over the current coefficient ring, with evaluation valued there; trace duality recovers the Z_(p)-valued formulation over an unramified finite integral base before localization.

## E18 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §2.6.3, p. 22, first display and (15), arXiv v5 Independent review source locations: v5 PDF pp. 22; v4 PDF pp. 20; published PDF pp. 22–23.

**Printed:** O_B ⊗ S′_0 ≅ O_B ⊗_O (O ⊗ S_0) ... GL_{O_i⊗_{O,σ}S′_0}(e_iΛ^∨_{0,σ})

**Correction or missing argument:** O_B ⊗ S_0 and GL_{O_i⊗_{O,σ}S_0}(e_iΛ^∨_{0,σ})

**Independent check:** Both PDFs visibly define S0 and then insert S0-prime in the decomposition and the middle term of (15). The neighboring factors and the final GL_{b_sigma,i}(S0) all use S0. Remove the two primes; no separate ring S0-prime has been introduced here.

## E19 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §2.6.3, p. 22, formula for κ(t) after (16), arXiv v5 Independent review source locations: v5 PDF pp. 22; v4 PDF pp. 20; published PDF pp. 23.

**Printed:** κ(t) = t_0^{κ_0} · ∏_{σ∈K} ∏_{i=1}^m ∏_{j=1}^{b_{σ,i}} t_{σ,i,j}^{κ_{σ,i,j}}

**Correction or missing argument:** ∏_{σ∈Σ_K}

**Independent check:** The factors t_{sigma,i,j} are indexed by embeddings sigma in Sigma_K. A product over elements of the field K is not the finite character product. Formula (16) and the next line give the intended embedding index set.

## E20 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §2.6.5, p. 24, statement of (19) and footnote 2, arXiv v5 Independent review source locations: v5 PDF pp. 24; published PDF pp. 25.

**Printed:** except when F_0 = Q and G^der/Q has an irreducible factor isomorphic to SU(1,1)

**Correction or missing argument:** except when K^+ = Q (K imaginary quadratic) and G^der/Q has an irreducible factor isomorphic to SU(1,1)

**Independent check:** The field in the unitary setup is K^+, while F is the reflex field and F0 is not introduced here. The stated exceptional rank-one rational factor is the modular-curve exception over K^+=Q. Replace F0 with K^+ at both occurrences. This repairs the symbol, without claiming that every group over K^+=Q is exceptional.

## E21 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §2.6.9, p. 26, definition of t_{w′,i′,j}, arXiv v5 Independent review source locations: v5 PDF pp. 26; v4 PDF pp. 23; published PDF pp. 27.

**Printed:** diag(p1_j, 1_{n−j}) ... diag(p1_{a_w}, 1_{n−j}, p1_{j−a_w}) ... 1_n ... j ≤ a_w / j > a_w

**Correction or missing argument:** diag(p1_j, 1_{n_i−j}) for j ≤ a_{w,i}; diag(p1_{a_{w,i}}, 1_{n_i−j}, p1_{j−a_{w,i}}) for j > a_{w,i}; 1_{n_{i′}} otherwise

**Independent check:** The surrounding quantifiers use 1<=j<=n_i and the (w,i) component of (14). Consequently its matrix sizes and block cut must use n_i and a_{w,i}; an inactive (w-prime,i-prime) component has identity size n_{i-prime}. The omissions are harmless only in the later single-factor specialization.

## E22 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** §2.6.9, p. 26, 'Note that t^+_{w,i,j} has the property that t^+_{w,i,j} I_r^0 t^{+,−1}_{w,i,j} ⊂ I_r^0', arXiv v5 Independent review source locations: v5 PDF pp. 20, 26; v4 PDF pp. 23; published PDF pp. 21, 27.

**Printed:** t^+_{w,i,j} I_r^0 t^{+,−1}_{w,i,j} ⊂ I_r^0.

**Correction or missing argument:** For the B+ root groups, t N+(Z_p)t^{-1} is contained in N+(Z_p), and t^{-1}N-(p^r Z_p)t is contained in N-(p^r Z_p). These positivity statements replace the false conjugation inclusion for the full I_r^0.

**Independent check:** In a GL2 factor with a=1, t=diag(p,1), and g=1+p^r E21, g is in I_r^0 but tgt^{-1}=1+p^(r-1)E21 is not. The printed inclusion is therefore false even for the basic allowed factor. What holds is contraction of the positive unipotent and inverse contraction of the negative unipotent. Correct the reach to a stated result; the ordinary Hecke double coset still exists.

## E23 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §2.7.2, p. 28, lines 17–18 from the bottom, arXiv v5 Independent review source locations: v5 PDF pp. 28; published PDF pp. 29.

**Printed:** Let g = Lie(G(R))_C, and let g = p^− ⊕ k ⊕ p^+ be the Cartan decomposition for the involution h(√−1): ad h(√−1) acts as ±√−1 on p^±.

**Correction or missing argument:** Ad h(√−1) is the Cartan involution, acting as +1 on k and −1 on p = p^+ ⊕ p^−; p^± are the subspaces of p on which Ad h(z) acts by (z/z̄)^{±1} (equivalently the ±√−1-eigenspaces of the complex structure Ad h(e^{π√−1/4}) on p, or the ±2√−1-eigenspaces of ad(dh(√−1))).

**Independent check:** Conjugation by diag(iI_a,-iI_b) multiplies both off-diagonal Hom blocks by -1. It is an involution, so cannot have eigenvalues +i and -i there. The complex structure distinguishing p+ and p- is induced by h(exp(pi*i/4)); equivalently their h(z) characters are (z/zbar)^+/-1.

## E24 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §2.8, p. 29, lines 3–4, arXiv v5 Independent review source locations: v5 PDF pp. 29; published PDF pp. 30.

**Printed:** Let k > 0 be so large that the kth-power of the Hasse invariant has a lift to a section E ∈ M_{det^k}(K; Z_p).

**Correction or missing argument:** E ∈ M_{det^{k(p−1)}}(K; Z_p)

**Independent check:** Verschiebung induces omega->Frob^*omega; its determinant has weight det(omega)^(p-1). A kth power therefore has weight det^(k(p-1)), not det^k. One may instead let k denote the total exponent divisible by p-1 and lift Hasse^(k/(p-1)); only the nonvanishing locus is used here.

## E25 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §2.9.2, p. 30, display, arXiv v5 Independent review source locations: v5 PDF pp. 25, 30; published PDF pp. 31.

**Printed:** these actions give an action of G(A_f^p) on lim_{←K^p} V(K^p, R) and lim_{←K^p} V_κ(K^p, ψ, R)

**Correction or missing argument:** lim_{→K^p} V(K^p, R) and lim_{→K^p} V_κ(K^p, ψ, R) (direct limits over shrinking K^p, as in §2.6.7)

**Independent check:** Shrinking prime-to-p level gives pullback maps from forms at the larger compact subgroup to forms at the smaller one. The representation whose K^p-fixed vectors recover level K^p is their union/direct limit. Both left-pointing arrows conflict with that construction and the classical analogue in Section 2.6.7.

## E26 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §2.9.4, p. 31, first and third displays, arXiv v5 Independent review source locations: v5 PDF pp. 31; published PDF pp. 32.

**Printed:** O_B ⊗ O′ = ... ≅ ∏_{w|p} ∏_{σ: p_σ=p_w} ∏_{i=1}^m O = ∏_σ ∏_i O′ ; L^+ ⊗_{Z_p} O′ = ∏_{w|p} ∏_{i=1}^m e_iL_w ⊗_{Z_p} O′ = ∏∏ (O_w ⊗_{Z_p} O′)^{a_{w,i}}

**Correction or missing argument:** ∏_{w|p} ∏_{σ: p_σ=p_w} ∏_i O′ ; ∏_{w|p} ∏_i e_iL^+_w ⊗_{Z_p} O′

**Independent check:** The splitting algebra factors are O-prime, as the last term of the same chain already states. In the L+ decomposition each e_i L_w must also retain its + superscript: its stated rank is a_{w,i}, while the full e_i L_w has rank n_i. Both missing decorations persist in published p.32.

## E27 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §2.9.4, p. 32, lines 5–8, arXiv v5 Independent review source locations: v5 PDF pp. 32; published PDF pp. 33.

**Printed:** Fixing G_m = Spec(Z[x, 1/x]) ... yields ... an identification Lie_{Z_p}(μ_{p^n}) = Z x d/dx. For any scheme S, this identifies Lie_S(μ_{p^n}) with O_S, compatibly as n varies.

**Correction or missing argument:** For general S use Lie_S(mu_(p^n))=O_S[p^n]. Over a Z/p^n-scheme this is O_S times x d/dx. The following application over Z/p^m uses n>=m and is unchanged.

**Independent check:** Linearizing (1+epsilon*a)^(p^n)=1 gives p^n*a=0. Hence Lie(mu_{p^n}/S)=O_S[p^n], which vanishes over Z_p and equals O_S when p^n=0 on S. The immediately following application has S over Z/p^m with n>=m and is valid. Correct the introductory base condition and coefficient module.

## E28 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §2.9.4, p. 32, the two displayed formulas for f_{p-adic} and t·f_{p-adic}, arXiv v5 Independent review source locations: v5 PDF pp. 31–32; v4 PDF pp. 29; published PDF pp. 33.

**Printed:** f_{p-adic}(A, φ) = lim_{←m} f(A_m, φ_{m,m,r}, (Lie(φ_{m,m,r})^∨, id)) ... (t·f_{p-adic})(A, φ) = lim_{←m} f(A_m, φ_{m,m,t}∘t, (Lie(φ_{m,m}∘t)^∨, id))

**Correction or missing argument:** Take the inverse limit over m>=r of f(A_m,phi_{m,m,r},(Lie(phi_{m,m})^vee,id)); in the translated formula use phi_{m,m,r} composed with t for the level structure and Lie(phi_{m,m} composed with t)^vee for the frame. In the introductory sentence replace the claimed p-adic weight kappa by kappa_p.

**Independent check:** For m>r, the Lie algebra of mu_{p^r} over Z/p^m consists only of p^r-torsion scalars, so the restricted r-level map cannot trivialize the full Lie algebra. Use phi_{m,m} for the frame and phi_{m,m,r} for the finite level structure, taking the limit over the cofinal range m>=r. The t in phi_{m,m,t} is another index slip. The opening sentence of the same paragraph also needs p-adic weight kappa_p, as its final computation explicitly proves.

## E29 — confirmed

**Kind:** gap. **Reach:** the proof. **Existing correction:** new.

**Source:** §2.9.4, p. 32, justification of injectivity of (28), arXiv v5 Independent review source locations: v5 PDF pp. 20, 29, 32; v4 PDF pp. 29; published PDF pp. 21, 30, 34.

**Printed:** – these are injective because, as already noted, S_1 is dense in the special fiber of M^tor_{K,L} –

**Correction or missing argument:** Supply a level-K_r q-expansion or formal restriction theorem for the stated coefficient rings. For flat noetherian coefficients a possible route is to show every generic component meets the ordinary special fiber and that the space of sections is p-adically separated. The density assertion on the base alone does not establish these facts; general p-adic coefficient rings require a justified base-change argument.

**Independent check:** The stated reason gives density on the hyperspecial base, whereas the forms have level K_r on an open quasi-finite cover. That reason alone does not prove injectivity of completion/restriction on this cover: even an etale cover X disjoint_union X[1/p] of a proper base X has a generic-only component invisible in the formal special fiber. This example diagnoses the inference, not the actual Shimura moduli space. A proof needs a separation/density result for the actual cover and the permitted coefficients. Remove the unsupported claim that the report has supplied a full proof for all R; retain the conclusion as unrefuted.

## E30 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §2.9.6, (32), p. 33, arXiv v5 Independent review source locations: v5 PDF pp. 22, 31, 33; v4 PDF pp. 30; published PDF pp. 23, 33, 35.

**Printed:** V^{ord,cusp}_{κ_p}(K^p, ψ, R) = S^ord_κ(K_r, ψ; R) ... if κ_{σ,i,a_{σ,i}} + κ_{σc,i,b_{σ,i}} ≫ n_ir_i ∀σ ∈ Σ_K, 1 ≤ i ≤ m.

**Correction or missing argument:** Where both blocks are nonzero, write kappa_{sigma,i,b_{sigma,i}}+kappa_{sigma c,i,a_{sigma,i}} sufficiently large, equivalently (kappa_p)_{sigma,i,a_{sigma,i}}+(kappa_p)_{sigma c,i,b_{sigma,i}} sufficiently large. Supply the cited theorem's exact regularity hypothesis and its convention for zero-sized blocks; do not retain the undefined r_i.

**Independent check:** Classical kappa_{sigma,i} has b_{sigma,i} entries; its conjugate tuple has a_{sigma,i} entries. The printed terminal indices are reversed and can be out of range. Use the last entries of these actual tuples, or formulate the condition in kappa_p with the conjugation explicitly applied. The unexplained r_i cannot serve as a precise bound. Zero-sized blocks also require an explicit convention rather than indexing entry zero.

## E31 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** §2.9.6, pp. 33–34, arXiv v5 Independent review source locations: v5 PDF pp. 33–34; v4 PDF pp. 30; published PDF pp. 35; v1 PDF pp. 28.

**Printed:** Let R be as in Equation (32) and let O^+ denote the integral closure of Z_(p) in R. The fraction field Frac(O^+) of O^+ is a number field over which S_κ(K_r, ψ; R) ⊗ Q has a rational model

**Correction or missing argument:** Choose a number field E0 inside Frac(R) containing the coefficient data and carrying the rational model; take its ring of integers localized at the selected prime above p, with an embedding into R after any needed coefficient extension. Alternatively use the semilocal p-integers where appropriate, but do not identify the two rings or take the integral closure in the whole p-adic R.

**Independent check:** R contains Z_p, whose elements algebraic over Q do not lie in one number field. For odd p, each rational prime ell congruent to 1 modulo p has a square root in Z_p by Hensel, giving infinitely many distinct quadratic subfields. Thus the fraction field of the stated integral closure is not a number field. Choose a finite number field of definition instead. Also correct the proposed repair: localization at one prime above p is not generally equivalent to the integral closure of Z_(p), which is semilocal at all primes above p.

## E32 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** §2.10.2, p. 35, lines 1–5, arXiv v5 Independent review source locations: v5 PDF pp. 11, 35; v4 PDF pp. 31; published PDF pp. 36; v1 PDF pp. 29.

**Printed:** Let Δ ⊂ T_H(Z_p) be the torsion subgroup. Since p is unramified in K by hypothesis, (12) induces an identification Δ ≅ ∏_{w|p} ∏_{i=1}^m (k_w^×)^{a_{w,i}} ... In particular, Δ has order prime-to-p

**Correction or missing argument:** Add 'p odd' to the standing hypotheses of §1.4.1, or restrict to p > 2 here.

**Independent check:** The standing prime hypotheses allow p=2 and K=Q(sqrt(-7)), where 2 splits and O_w=Z_2. Its units have torsion {-1,1}, while the residue-field units are trivial. Thus both the displayed torsion identification and prime-to-p order claim are false. Add p odd to this construction; the integral isotypic decomposition also relies on that restriction. Classify as error rather than gap.

## E33 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §2.10.2, p. 35, line 13, arXiv v5 Independent review source locations: v5 PDF pp. 35; v4 PDF pp. 31; published PDF pp. 36.

**Printed:** Each S^ord_ω(K^p, R) is a Λ-module.

**Correction or missing argument:** Each S^ord_ω(K^p, R) is a Λ^o-module.

**Independent check:** The adjacent definition and specialization ring use Lambda^o=O-prime[[W]]. The sentence retaining Lambda missed the renaming; v4 p.31 consistently uses the earlier name Lambda.

## E34 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §2.10.2, (34), p. 35, arXiv v5 Independent review source locations: v5 PDF pp. 30–32, 34–35; v4 PDF pp. 31; published PDF pp. 31, 33, 36–37.

**Printed:** μ ↦ μ(κψ) : ... → S^ord_κ(K_r, ωω_κψ, R[ψ]) ... and ω_κ ∈ Δ̂ is κ|_Δ.

**Correction or missing argument:** Write kappa for the p-adic weight and kappa^cl for a classical weight with (kappa^cl)_p=kappa. Put eta=omega*(kappa|Delta)^-1*psi, with the Delta characters and W-character extended across T=Delta x W. The target is S^ord_{kappa^cl}(K_r,eta;R[psi]), and evaluate the measure at the full character whose restriction is omega on Delta and kappa*psi on W (equivalently kappa*eta).

**Independent check:** A classical form of nebentypus eta has p-adic Delta-character eta|Delta times kappa_p|Delta, by the computation in Section 2.9.4. On the omega branch this forces eta|Delta=omega*(kappa_p|Delta)^-1. With kappa explicitly taken from Section 2.9.1, the printed sign is wrong. The correction must also state how evaluation on the W-character is extended to Delta: it uses omega there, otherwise literal evaluation of a full character with a different Delta-part is zero. Restore the classical weight notation in the target.

## E35 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §3.1.3, Remark 3.1.4 and the following paragraph, p. 38, arXiv v5 Independent review source locations: v5 PDF pp. 36, 38, 49; published PDF pp. 38, 40, 51–52.

**Printed:** For each prime w of F^+ dividing p, let γ_{V_w} = (…) ∈ G_4(F^+_w); γ_{V_p} = (γ_{V_w})_{w|p} ∈ G_4(F^+_p). ... if K_i^p, i = 1, 2, 3, 4, are prime-to-p level subgroups of G_i(A_f)

**Correction or missing argument:** Index w by places of K^+ above p (with a chosen place of K above each); view gamma_{V_w} in the corresponding GL_{2n}(K_w) factor, and gamma_{V_p} in G4(Q_p) with similitude one. Write G_i(A_f^p) for the prime-to-p level ambient group.

**Independent check:** F is the reflex field; the split local factors in (35) are indexed by places of K^+. The displayed permutation matrix belongs to the corresponding GL_{2n}(K_w) factor of U(W)(Q_p), and the tuple belongs to G4(Q_p) with similitude one. Correct these coefficient-field labels and put the prime-to-p compact subgroups in G_i(A_f^p).

## E36 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §3.2.3, p. 39, arXiv v5 Independent review source locations: v5 PDF pp. 36–39; v3 PDF pp. 30–31, 34–36; published PDF pp. 38–41.

**Printed:** compatible with weights κ and characters ψ in the obvious way, as well as with the inclusion of spaces of modular forms and with restriction to similitude components. In particular, the isomorphisms described above extend to isomorphism of spaces of p-adic modular forms (with the tensor product ⊗_R replaced by the completed tensor product ⊗̂_R).

**Correction or missing argument:** Delete the references to similitude components and to 'the isomorphisms described above', or restore the removed material (v3 §3.1.5 and the isomorphisms ⊕_{α∈C_{K_3}} M_{κ_1}(K_1;R)^α ⊗_R M_{κ_2}(K_2;R)^α ≅ M_κ(K_3;R) when ν(K_1) = ν(K_2) and K_3 = (K_1 × K_2) ∩ G_3(A_f), and their level-K_r analogues).

**Independent check:** The v5 and published Section 3.2.1 display restriction maps, with no preceding isomorphisms of the kind invoked in 3.2.3. The referenced similitude-component decompositions occur in v3 Sections 2.11 and 3.1.5/3.2.1, read at pp.30-31,34-36, and were removed. Delete the dangling sentence or restore a precise componentwise statement with its hypotheses; this is an editorial omission, not evidence that all restriction maps are isomorphisms.

## E37 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** Proposition 3.2.5(ii), p. 40, arXiv v5 Independent review source locations: v5 PDF pp. 40; published PDF pp. 42.

**Printed:** (ii) Let f ∈ V^ord_{κ_p}((G, X); K^p, R). Suppose for every ordinary CM pair (J′_0, h_0) mapping to (G, X), the restriction res_{J′_0,h_0}(f) = 0. Then f = 0.

**Correction or missing argument:** res_{p,J′_0,h_0}(f) = 0

**Independent check:** The immediately preceding paragraph explicitly names res_{p,J0prime,h0} for p-adic forms and the diagram uses that symbol on its right arrow. Part (ii) applies to a p-adic f but drops p. Restore the subscript.

## E38 — confirmed

**Kind:** gap. **Reach:** the proof. **Existing correction:** new.

**Source:** Proposition 3.2.5(ii), proof, p. 41, arXiv v5 Independent review source locations: v5 PDF pp. 40–41; published PDF pp. 42–43; moonen04 PDF pp. 23–24.

**Printed:** Note that V^ord_{κ_p}((G, X); K^p, R) is the R-dual to a finite rank module over an appropriate Iwasawa algebra, by Hida theory; thus f belongs to a finite rank R module. Point (ii) follows from the Zariski density of the ordinary locus in the integral model of S(G, X) [Wed99], provided we know there are enough CM points in the ordinary locus. But every point on the ordinary locus over a finite field lifts ... to the generic fiber (see for example [Moo04, Proposition 2.3.12]).

**Correction or missing argument:** Supply a CM restriction/separation argument on each finite Igusa level, including coverage of its frames by the allowed CM pairs and coefficient base change. For torsion-free coefficients, once this coverage is established, reduced special-fiber detection and division by p can be iterated using zero evaluations at characteristic-zero lifts and p-adic separation. For arbitrary p-adic R a valid flat-base-change or devissage argument is still required; the existing report does not establish it.

**Independent check:** The cited Moonen Proposition 2.3.12 (arXiv math/0203288, pp.23-24) supplies canonical lift/CM facts for p-divisible groups. It does not itself establish that the maps of CM Igusa towers meet every finite-level frame or a separation theorem for functions with all the stated p-adic coefficient rings. Density on the underlying ordinary locus and finite rank over an Iwasawa algebra do not by themselves supply those steps. The report's claimed complete repair also assumes the needed frame coverage and says general R follows by devissage without justification. Confirm the gap in the presented proof, retain the theorem as unrefuted, and mark the missing steps explicitly.

## E39 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** §4.1.4, p. 45, lines 5–12 (the paragraph after the definition of I(φ, φ^♭, f, s)), in arXiv v5 Independent review source locations: v5 PDF pp. 44–45, 47; v4 PDF pp. 40; published PDF pp. 46–47, 49.

**Printed:** “Moreover, it follows from the unfolding in [GPSR87] that, for any pair π, π′ of automorphic representations of G_1, the map (φ, φ′) ↦ I(φ, φ′, f, s) defines a G_1(𝔸)-invariant pairing between π and π′. The multiplicity one hypothesis 7.3.3 implies that the space of such pairings is at most one-dimensional, and is exactly one-dimensional provided π′ = π^∨ (upon restriction to U(V). Thus: If ⟨φ, φ^♭⟩ = 0 then I(φ, φ^♭, f, s) = 0 for all s.”

**Correction or missing argument:** Remove fixed-section G1-invariance and the implication from <v,vdual>=0. State the appropriate equivariance when the section is translated too, with the chi twist from the integral. Unfolding pairs translates pi(u)v with vdual; vanishing for inequivalent representations is different from vanishing of one pair of vectors.

**Independent check:** Unfolding gives an integral of F(u)<pi(u)v,vdual>, with F(u)=f(u,1). Fixing f does not make this functional invariant: simultaneous translation of the two vectors conjugates the test function. At a finite place with dim(pi)>1 choose v and vdual orthogonal but <pi(g0)v,vdual> nonzero, and choose F supported on g0K for K fixing v. The local integral is nonzero. The open-cell model permits such a compactly supported section. Thus the asserted zero-pairing implication is false. Correct reach to a stated result; the subsequent formula with nonzero denominator may still be used.

## E40 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** Remark 4.1.6, pp. 45–46 (last two sentences of p. 45 and first sentence of p. 46), in arXiv v5; the remark is absent in v4 Independent review source locations: v5 PDF pp. 45–46; v4 PDF pp. 40–41; published PDF pp. 48.

**Printed:** “Thus for φ_1 ∈ π, φ_2 ∈ π⊗χ^{-1}∘det we define ⟨φ_1, φ_2⟩_χ to be the L_2 pairing of φ_1 with φ_2 ⊗ χ∘det.” and “… integral with respect to a structure native to the space π ⊗ π ⊗ χ^{-1}∘det”

**Correction or missing argument:** “φ_2 ∈ π^♭ ⊗ χ^{-1}∘det” and “π ⊗ π^♭ ⊗ χ^{-1}∘det”.

**Independent check:** The preceding line defines phi_chi^flat in pi^flat tensor chi^-1, and the next displayed equality uses precisely that dual vector. Restore pi^flat in the stated domain and integral structure. Correct the original reason: a pairing of pi with itself need not vanish when pi is self-dual; the defect is the wrong domain in the given construction.

## E41 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** §4.2.1, pp. 46–47, the displayed identity “d_{n,v}(s, χ_v) I_v(φ_v, φ′_v, f_v, s) = L_v(s + 1/2, π_v, χ_v)” with (53), in arXiv v5 Independent review source locations: v5 PDF pp. 42, 45–47, 49–50; v4 PDF pp. 38, 41–42; v1 PDF pp. 36, 39; published PDF pp. 44, 47, 49, 52–53.

**Printed:** “In either case, we have d_{n,v}(s, χ_v) I_v(φ_v, φ′_v, f_v, s) = L_v(s + 1/2, π_v, χ_v), where d_{n,v}(s, χ_v) = d_{n,v}(s) = ∏_{r=0}^{n−1} L_v(2s + n − r, χ_v|_{𝒦^+} η_v^r)” and “L_v(s, π_v, χ_v) = L_v(s, BC(π_v) ⊗ χ_v∘det)”

**Correction or missing argument:** Reconcile the inducing character with the unramified Euler-factor convention. In the verified rank-one model the actual integral is (1-XY)/((1-X)(1-Y)), where X=beta(varpi)chi_wbar(varpi)^-1 q^(-s-1/2) and Y=beta(varpi)^-1 chi_w(varpi)^-1 q^(-s-1/2). At beta=1 this requires the inverse character in both numerator and denominator Euler factors. For general rank and nontrivial beta, identify the base-change orientation explicitly before asserting a uniform replacement of chi by chi^-1. Alternatively change the inducing character consistently, including the paper's modulus convention, and recompute the factors.

**Independent check:** The upper-triangular inducing character read in (54)-(55) is chi_w(D) chi_wbar^-1(A)|A/D|^s. In rank one the two valuation ranges give X=beta(varpi)chi_wbar(varpi)^-1 q^(-s-1/2) and Y=beta(varpi)^-1 chi_w(varpi)^-1 q^(-s-1/2), hence I=(1-XY)/((1-X)(1-Y)). With beta=1, q=5, s=1/2, and both chi components equal to i, this is 12/13-5i/13, whereas the printed Euler factors give 12/13+5i/13. Such unitary local data occur for a quartic Dirichlet character composed with a CM norm. This confirms the inverse-character mismatch independently of any base-change orientation for beta. Remove the earlier overclaim that equality is possible only when chi|K+ is trivial: special characters can also make the two expressions coincide.

## E42 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** Lemma 4.2.3 and its proof, §4.2.2, p. 48, first display of the proof (“for g ∈ U_{1,v} × 1_n, f^-_{L_v}(g) = δ_{−1_n·𝒰_v×1_n}(g)”), in arXiv v5 Independent review source locations: v5 PDF pp. 47–48; v4 PDF pp. 42–43; v1 PDF pp. 39–40; published PDF pp. 49–51.

**Printed:** “The support of f^-_{L_v} in U_{1,v} × 1_n is −1_n·𝒰_v × 1_n, and for g ∈ U_{1,v} × 1_n, f^-_{L_v}(g) = δ_{−1_n·𝒰_v×1_n}(g) … I_v(φ_v, φ′_v, f_v, χ) = volume(𝒰_v).”

**Correction or missing argument:** Add to the conditions on L_v in §4.2.2 that χ_v(det(1_n − x)) = 1 for all x ∈ L_v, which is possible by shrinking L_v. Fix w := (−1_n, 1_n), or normalise f_{L_v} so that f^-_{L_v}(1) = 1. Then f^-_{L_v}|_{U_{1,v}×1_n} is the characteristic function of −1_n·𝒰_v × 1_n and I_v = vol(𝒰_v).

**Independent check:** The section acquires the factor chi(det(1-X))^-1 under the Cayley decomposition, even on a small unit-determinant neighborhood. The listed conditions control the vector stabilizer but not this character. At a split place of residue characteristic 3 take n=1, pi=1, L=3Z_3, chi_w of conductor 9 with chi_w(2)=zeta_3, and chi_wbar=1. The normalized integral is (1+zeta_3+zeta_3^2)/3=0, not the claimed normalized volume 1. Shrink L to trivialize the character and fix w=(-1,1) (or normalize the translated section at 1). This is a false lemma under the literal hypotheses, so classify as error/a stated result.

## E43 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** §4.3.1, (54), p. 50, and the sentence following it (“Then, as explained in [Eis15], f_p ∈ I_p(χ_p, s).”), in arXiv v5 Independent review source locations: v5 PDF pp. 42, 49–50; v4 PDF pp. 38, 44; v1 PDF pp. 41; published PDF pp. 44, 51–53.

**Printed:** “f_{p,s}(g) = |ν|_p^{sn/2} ⊗_{w∈Σ_p} f_{w,s}(g_w), g = (ν, (g_w)) ∈ G(ℚ_p). (54) Then, as explained in [Eis15], f_p ∈ I_p(χ_p, s).”

**Correction or missing argument:** (54) lies in I_p(χ_p, s) only after restriction to U_4(ℚ_p). To lie in I_p(χ_p, s) on all of G(ℚ_p), the factor |ν|_p^{sn/2} must be replaced by ∏_{w∈Σ_p} χ_{w̄}(ν)^n, reading the absolute values of §4.1.2 as the idelic module of 𝒦 (which makes the centre act unitarily). If |ν| is read as |ν|_{𝔸_ℚ}, the factor is instead |ν|_p^{sn/2}∏_{w∈Σ_p} χ_{w̄}(ν)^n |ν|_w^{-ns}.

**Independent check:** At s=0 take a central element with w-component 1 and conjugate component u, so nu=u. The inducing character requires chi_wbar(u)^n, while (54) gives no such factor. This proves failure on the similitude group independently of the absolute-value convention. For general s, Delta_wbar=nu times transpose(A_w)^-1 supplies the missing product chi_wbar(nu)^n, together with the norm adjustment already described in the correction. On nu=1 the discrepancy disappears. Record reach as the stated membership in I_p, rather than nothing.

## E44 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** §4.3.1, inequality (56), p. 51; used in Lemma 4.3.2(i),(ii), p. 52, and in the extension of μ′_w to Γ_R, ᵗΓ_R in §4.3.4, p. 55, in arXiv v5 Independent review source locations: v5 PDF pp. 49–52; v4 PDF pp. 45; v1 PDF pp. 42; published PDF pp. 52–54.

**Printed:** “t ≥ max_{w∈Σ_p, 1≤i≤r(w)} (1, ord_w(cond(μ_{i,w})), ord_w(cond(χ_w)))), (56)”

**Correction or missing argument:** t ≥ max_{w∈Σ_p, 1≤i≤r(w)} (1, ord_w(cond(μ_{i,w})), ord_w(cond(χ_w)), ord_{w̄}(cond(χ_{w̄}))), i.e. t must also bound the conductor of χ_{2,w} = χ_{w̄}^{-1}. With r ≥ 2t this also bounds the conductors of the μ′_{i,w}.

**Independent check:** The relevant nu_i contains chi_wbar^-1, whose conductor (56) does not bound. For p=3,t=1,a=b=1, mu_i=chi_w=1 and chi_wbar a primitive conductor-9 character, X=[[1,0],[1,1]] and gamma2=[[1,3],[0,1]] meet the stated conditions. The D-block changes from 1 to 4, multiplying phi_nu by chi_wbar(4)^-1!=1, while the asserted right side is unchanged. Thus Lemma 4.3.2(i) is false for allowed parameters. Add both conjugate conductors to the bound; this also restores the support/invariance and later extension bounds. Classify the finding as error.

## E45 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** Proof of Lemma 4.3.2(ii), p. 53, first line of the formula for Φ^{(4)}_w(D), in arXiv v5 Independent review source locations: v5 PDF pp. 53; published PDF pp. 55–56.

**Printed:** “Φ^{(4)}_w(D) = ∫_{𝔛^{(4)}} φ_{ν_w}((1 0; 0 δ)) e_w(−trace δ^tA) dα”

**Correction or missing argument:** “Φ^{(4)}_w(D) = ∫_{𝔛^{(4)}} φ_{ν_w}((1 0; 0 δ)) e_w(−trace ᵗδ D) dδ”

**Independent check:** The second Fourier-transform formula integrates the bottom-right block delta and evaluates at D. Its next line uses D correctly. Replace A,dalpha in the first line by D,ddelta; trace(delta transpose(D)) and trace(transpose(delta) D) agree.

## E46 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §4.3.3, p. 53, last display (definition of μ′_{a_w}), in arXiv v5 Independent review source locations: v5 PDF pp. 53, 55; published PDF pp. 56, 58.

**Printed:** “μ′_{a_w} = ⊗_{i=1}^{t(w)} μ_{i,w},  μ′_{b_w} = ⊗_{i=t(w)+1}^{r(w)} μ′_{i,w}, μ′_w = ⊗_{i=1}^{r(w)} μ′_{i,w} = μ′_{a_w} ⊗ μ′_{b_w}”

**Correction or missing argument:** “μ′_{a_w} = ⊗_{i=1}^{t(w)} μ′_{i,w}”

**Independent check:** The displayed factorization muprime_w=muprime_a tensor muprime_b immediately forces primes on all the factors defining muprime_a. The inducing character and (61) give the same correction.

## E47 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §4.3.4, equation (72), p. 57, in arXiv v5 Independent review source locations: v5 PDF pp. 57; published PDF pp. 60.

**Printed:** “⟨φ_w, φ̃_w⟩_{π_w} = Vol(Γ_{R,w}) ∏_{i=1}^{t(w)} ⟨φ_{i,w}, φ̃_{i,w}⟩_{π_{i,w}} ≠ 0. (72)”

**Correction or missing argument:** “⟨φ_w, φ̃_w⟩_{π_w} = Vol(Γ_{R,w}) ∏_{i=1}^{r(w)} ⟨φ_{i,w}, φ̃_{i,w}⟩_{π_{i,w}} ≠ 0.”

**Independent check:** Multiplying the a-block and b-block pairing formulas above (72) gives all factors i=1,...,r(w). The printed upper limit t(w) omits the b-block. The volume factor is unchanged.

## E48 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** Remark 4.3.5, p. 57, in arXiv v5 Independent review source locations: v5 PDF pp. 57, 134, 137; published PDF pp. 60–61, 141, 144.

**Printed:** “In Sections 8.3 and 8.4 we identify specific vectors … that satisfy the conditions imposed in this section (see especially Remarks 4.3.5 and 8.4.8).”

**Correction or missing argument:** “(see especially Remarks 8.3.10 and 8.4.8)”

**Independent check:** Remark 4.3.5 refers to the later identification of test vectors but cites itself. Remarks 8.3.10 and 8.4.8, read in both editions, are the corresponding later statements. Their own local reference slips are separate findings.

## E49 — rejected

**Kind:** misprint. **Reach:** nothing. **Existing correction:** Not an error: rejected by REV-ERRATA-PAPER-EISCHEN-HARRIS-LI-ETAL-20.

**Source:** §4.3.4, p. 57, line 5 (decomposition of k ∈ Γ_{a_w,b_w}), in arXiv v5 Independent review source locations: v5 PDF pp. 55, 57; published PDF pp. 58, 60.

**Printed:** “with B ∈ M_{a_w,b_w}(O_w), A ∈ GL_{a_w}(O_w), D ∈ GL_{b_w}(O_w), and C ∈ M_{b_w,a_w}(𝔭^t_w).”

**Correction or missing argument:** No mathematical correction is required. One may sharpen the displayed true bound to C in p^r M to make the next use of the definition more explicit.

**Independent check:** The printed bound C in p^t M is true because Gamma_{a,b} is defined at level p^r and r>=2t. In the displayed decomposition, C=D^-1 k21 is automatically in p^r M. Thus the stronger fact used on the next line already follows from the definition; replacing t by r would improve exposition but does not correct a false statement or a missing assumption. The report mistakes a true weaker bound for an erratum.

## E50 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §4.3.6, p. 58, lines 4–5, in arXiv v5; present in v4 p. 51 Independent review source locations: v5 PDF pp. 58; v4 PDF pp. 51; published PDF pp. 61.

**Printed:** “identifies GL_{K_w}(V_w) × GL_{K_w}(V_w) ⊆ GL_{K_w}(V_w ⊕ V_w) with GL_n(V_w) × GL_n(K_w) ⊆ GL_{2n}(K_w)”

**Correction or missing argument:** … with GL_n(K_w) × GL_n(K_w) ⊆ GL_{2n}(K_w)

**Independent check:** A basis of the Kw-vector space Vw identifies its automorphism group with GL_n(Kw). The coefficient Vw in GL_n(Vw) is a type error; the immediately adjacent second factor is correctly GL_n(Kw).

## E51 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** §4.3.6, p. 58, definition of Z_w and of Z_p, in arXiv v5; present in v4 p. 52 Independent review source locations: v5 PDF pp. 50, 58; v4 PDF pp. 52; published PDF pp. 53, 61–62.

**Printed:** “Z_w := ∫_{GL_n(K_w)} χ_{2,w}(g) |det g|_w^{s+n/2} ∫ Φ(…) …” and “Z_p := ∏_{w∈Σ_p} Z_w = ∏_{w∈Σ_p} Z_{w+}(φ_{w+}, φ̃_{w+}, f_{w+}, χ)”

**Correction or missing argument:** Write chi2(det g), and use Z_{w+}(phi,phitilde,ftilde,s) in Zp. For the literal translate ftilde(g)=f(g gamma) of (55), retain the multiplier chi2(det gamma)=chi2(-1)^b in Zw and every subsequent formula derived from it. A normalized translate could absorb it only if explicitly defined consistently.

**Independent check:** The notation slips in Zp are as reported, but the same finding includes a substantive missing scalar. Formula (55) contributes chi2(det g) to a section. Right translation by the permutation in (73) changes this to chi2(det g)chi2(det gamma), and det gamma=(-1)^b. There is no hypothesis forcing chi2(-1)^b=1. Classify the complete finding as error/a stated result, and keep its distinct phase separate from the coordinate and Fourier-sign errors E52/E57.

## E52 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** §4.3.6, p. 59, display “So Φ((Xg, X)) = Vol(Γ_w)^{-1}Φ_{1,w}(Z′_1, Z″_2)Φ_{2,w}(Z′_2, Z″_1)”, read against the definition (58) of Φ_w on p. 52, in arXiv v5. ; the same mistake at §4.3.6, p. 58 (first paragraph, definition of Z_w) and p. 59 (evaluation of Φ), in arXiv v5; also in v4 pp. 51–52 Independent review source locations: v5 PDF pp. 42, 50, 52, 58–59; v4 PDF pp. 46, 51–52; v1 PDF pp. 43, 46–47; published PDF pp. 44, 52, 54, 61–62.

**Printed:** p. 52: “For X = (X_1, X_2) ∈ Hom_{𝒦_w}(V_w, W_w) = Hom_{𝒦_w}(V_w, V_{d,w}) ⊕ Hom_{𝒦_w}(V_w, V^d_w), let Φ_w(X) = Φ_{χ,μ,w}(X_1, X_2) = vol(Γ_w)^{-1}Φ_{1,w}(−X_1)·Φ_{2,w}(2X_2).” p. 58: “With respect to this new decomposition [W_w = V_w ⊕ V_w], 𝐗 no longer consists of elements (0, X) but instead elements (X, X).” p. 59: “So Φ((Xg, X)) = Vol(Γ_w)^{-1}Φ_{1,w}(Z′_1, Z″_2)Φ_{2,w}(Z′_2, Z″_1)”

**Correction or missing argument:** Apply the displayed change of coordinates to Phi, or explicitly replace (58) by the product function in V+V coordinates and re-establish compatibility with the Eisenstein measure. Neither option by itself proves the subsequent factorization, which also needs E53, or fixes the signs and normalizations E51/E57/E58. Do not assert a complete repair of the main theorem here.

**Independent check:** The bases in 4.1.1 give (Y1,Y2)=(X1+X2,X2-X1), so (58) becomes vol^-1 Phi1((Y2-Y1)/2)Phi2(Y1+Y2). The evaluation on p.59 instead uses the product Phi1(Y1)Phi2(Y2). Independently take n=a=1,b=0 over Q3, chi1=chi2=1 and mu the nontrivial character mod 3, pi|units=mu^-1. On the literal support set z1=x(1-u)/2 in units and z2=x(1+u) in 3^-1 units. Then u=(z2-2z1)/(z2+2z1) lies in 1+3Z3, all norm weights are constant, and the Jacobian has constant absolute value. Integration contains the zero factor integral_units mu(z1)dz1. The product section instead gives the nonzero Gauss average -i/sqrt(3). This is a discrepancy of integrals, not just notation. Remove the inherited assertion that all of 4.3.6-4.3.10 is otherwise correct: E53/E57 remain separate problems.

## E53 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** Proposition 4.3.7, second statement (77), p. 60, and its proof pp. 60–61, in arXiv v5; present in v4 pp. 53–54 Independent review source locations: v5 PDF pp. 51, 55–56, 60–62; v4 PDF pp. 53–55; published PDF pp. 54, 58–59, 63–65.

**Printed:** “When all of the above conditions are met, we have the following factorization at each prime w ∈ Σ_p: Φ_{1,w}(Z_1', Z_2'')Φ_{2,w}(Z_2', Z_1'')⟨π_w(Z_1)φ_w, π̃_w(Z_2)φ̃_w⟩_{π_w} = Vol(Γ_{a_w,b_w})·J_1·J_2” (conditions: A_1 ∈ Γ_{a_w,w}(t), C_1 ∈ p_w^t M, D_2 ∈ Γ_{b_w,w}(t), B_2 ∈ p_w^t M, …); proof: “π_w(Z_1)φ_w = π_w((1 0; C_1 D_1))μ'_w((A_1 0; 0 1))φ_w, π̃_w(Z_2)φ̃_w = π̃_w((A_2 B_2; 0 1))(μ'_w)^{−1}((1 0; 0 D_2))φ̃_w” and, on p. 61, “A = 1 − B_2C_1 ∈ 1 + p_w^{2t}M_{a_w}(O_w) … D = (1 + CB_2)D_1 ∈ (1 + p^{2t}M_{b_w}(O_w))D_1. Therefore, applying the invariance conditions (66) and (69) we obtain ⟨π_w((1 0; C_1 D_1))φ_w, π̃_w((A_2 B_2; 0 1))φ̃_w⟩ = ⟨π_w((1 −B_2; 0 1)(1 0; C_1 D_1))φ_w, π̃_w((A_2 0; 0 1))φ̃_w⟩ = ⟨π_w((1 0; C_1 1)(1 0; 0 D_1))φ_w, π̃_w(A_2 0; 0 1)φ̃_w⟩ = …”

**Correction or missing argument:** Restrict any pointwise claim to hypotheses actually giving the required invariance, at least A1,D2 of level r and r=2t in this proof, and check the resulting statement. To retain the original section and final integral, supply a full integration argument that handles the level-t matrices and the discarded Levi factors. The existing report does not establish that argument; Corollary 4.3.8 and its uses remain dependent on this repair.

**Independent check:** The support gives level t for A1,D2 while (66)/(69) give level r>=2t. This is insufficient for the first simplification; the later discarded matrices in 1+p^(2t) additionally require r<=2t. The actual pointwise statement fails: n=a=2,b=0, partition 1+1, trivial inducing characters in the irreducible normalized principal series Ind_B(1,1), t=1,r=2. Take phi supported on B Iw2 and phitilde on B transpose(Iw2), with value 1 at 1. On K the latter is the indicator that k22 is a unit. For A1=[[1,0],[p,1]], A2=diag(p^-1,p), the bottom-row ratio of k A2^-1 A1 is p+p^2 k21/k22, outside p^2; hence the shifted coefficient is zero. Without A1 the ratio is p^2 k21/k22 and the integral is strictly positive. The Fourier coefficient at A2 is -(p-1)/p^2, obtained by summing the nontrivial additive character over a in units while d-bc/a is a unit. Finite diagnostics at p=3,5,7 confirm the ratios and coefficient. The report has not proved that the integrated corollary survives all these defects; delete that assurance.

## E54 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** Proof of Proposition 4.3.7, p. 60, last display, in arXiv v5; present in v4 p. 54 Independent review source locations: v5 PDF pp. 60, 62; v4 PDF pp. 54–55; published PDF pp. 64–65.

**Printed:** “Φ_{1,w}(Z_1', Z_2'')Φ_{2,w}(Z_2', Z_1'')⟨π_w(Z_1)φ_w, π̃(Z_2)φ̃_w⟩_{π_w} = χ_{2,w}^{−1}(det A_1)χ_{1,w}(det D_2)⟨π_w((1 0; C_1 D_1))φ_w, π̃_w((A_2 B_2; 0 1))φ̃_w⟩_{π_w}.”

**Correction or missing argument:** The right side should also carry Φ^{(1)}_w(A_2)Φ^{(4)}_w(D_1) (and π̃ should be π̃_w).

**Independent check:** The last display on p.60 drops both scalar Fourier factors from Phi2; they reappear in J1,J2 immediately before and after. Restore Phi^(1)(A2)Phi^(4)(D1) and the w index on pitilde. This editorial fix does not resolve the separate invariance error E53.

## E55 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** Proof of Corollary 4.3.8, p. 63, list of conditions, in arXiv v5; present in v4 p. 56 Independent review source locations: v5 PDF pp. 60, 63; v4 PDF pp. 56; published PDF pp. 63, 66.

**Printed:** “A_1 ∈ Γ_{a_w}(t), C_1 ∈ p_w^t ∏_{w|p} M_{b_w×a_w}(O_w), … A_2 ∈ p_w^{−t} ∏_{w|p} M_{a_w×a_w}(O_w), … D_1 ∈ p_w^{−t} ∏_{w|p} M_{b_w×b_w}(O_w).”

**Correction or missing argument:** A_1 ∈ Γ_{a_w,w}(t), C_1 ∈ p_w^t M_{b_w×a_w}(O_w), …, D_1 ∈ p_w^{−t} M_{b_w×b_w}(O_w) (a single place w), as in Proposition 4.3.7.

**Independent check:** Every matrix in this calculation is at the fixed place w. Products over all places are incompatible with the local matrix spaces and repeat the correctly typed list in Proposition 4.3.7 incorrectly. Remove those products and restore the w on Gamma_a,w and Gamma_b,w.

## E56 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** Proof of Theorem 4.3.10, p. 64, last display, in arXiv v5; present in v4 p. 57 Independent review source locations: v5 PDF pp. 53, 56, 64; v4 PDF pp. 57; published PDF pp. 56, 59, 68.

**Printed:** “= μ'_{b_w}(γ_1^{−1}) μ_{b_w}(γ_2^{−1}) ⟨φ_{b_w}, φ̃_{b_w}⟩_{π_{b_w}} = χ_{2,w}(D) φ_{ν_w}((1_{a_w} 0; 0 D))^{−1} ⟨φ_{b_w}, φ̃_{b_w}⟩”

**Correction or missing argument:** = μ'_{b_w}(γ_1^{−1}) μ'_{b_w}(γ_2^{−1}) ⟨φ_{b_w}, φ̃_{b_w}⟩ = χ_{2,w}(det D) φ_{ν_w}(diag(1_{a_w}, D))^{−1} ⟨φ_{b_w}, φ̃_{b_w}⟩

**Independent check:** The second vector transforms by inverse muprime_b under gamma2, so both scalar factors must carry primes. With those primes the next equality follows from nu and muprime. Write chi2(det D) for the scalar character.

## E57 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** Theorem 4.3.10, formula for I_2, p. 64 (and hence (83), (86) and L(s + 1/2, ord, π_w, χ_w)), in arXiv v5; present in v4 p. 57 Independent review source locations: v5 PDF pp. 53, 62, 64–65; v4 PDF pp. 57–58; published PDF pp. 56, 65, 67–69.

**Printed:** “I_2 = ε(−s + 1/2, π_{a_w} ⊗ χ_{1,w}) L(1/2 + s, π̃_{a_w} ⊗ χ_{1,w}^{−1}) / L(−s + 1/2, π_{a_w} ⊗ χ_{1,w}) · Vol(𝔛^{(1)}) · ⟨φ_{a_w}, φ̃_{a_w}⟩_{π_{a_w}}.” and “The computation of I_2 is similar.”

**Correction or missing argument:** With ψ = e_w (the additive character for which (85) holds and with which I_1 is correct): I_2 = L(s + 1/2, π̃_{a_w} ⊗ χ_{1,w}^{−1}) / [ε(s + 1/2, π̃_{a_w} ⊗ χ_{1,w}^{−1}) L(−s + 1/2, π_{a_w} ⊗ χ_{1,w})] · Vol(𝔛^{(1)})⟨φ_{a_w}, φ̃_{a_w}⟩ = ω(−1)·(printed expression), where ω = ω_{π_{a_w}}·χ_{1,w}^{a_w} is the central character of π_{a_w} ⊗ χ_{1,w} and ω(−1) ∈ {±1}. Accordingly Z_w and I_w carry the extra sign ω_{π_{a_w}⊗χ_{1,w}}(−1) relative to L(s + 1/2, ord, π_w, χ_w) as defined. This corrects the displayed Godement-Jacquet functional-equation factor; any assertion about the full local zeta integral is conditional on also repairing E51-E53 and E58.

**Independent check:** With the e_w Fourier transform used in (85), I2 is the Godement-Jacquet integral for Pi=dual(pi_a) tensor chi1^-1. Its dual integral is Vol(X1) times the pairing, so the coefficient is 1/gamma(s+1/2,Pi,e_w). Replacing inverse epsilon by epsilon at the dual argument requires the central sign of pi_a tensor chi1. Independent Tate test: Q3, n=a=1, b=0, chi1=chi2=1, pi=the quadratic character mod3, s=0. The negative Fourier transform of mu*1_units at a/3 is mu(a)(-i/sqrt(3)), hence I2=-i for unit multiplicative volume one. The printed epsilon(1/2,mu,e_w) is +i. The finite Gauss-sum diagnostic verifies ratio -1. Changing the additive character instead changes I1 in general; it is necessary to state a consistent convention.

## E58 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** Theorem 4.3.10, (83), p. 64, in arXiv v5; propagates to Remark 4.3.12 (p. 66), Theorem 4.6.1 and Remark 4.6.2 (p. 78); present in v4 p. 57 ((4.3.30)); the same mistake at §9.1.6 Corollary 9.1.8 (p. 144), §9.2 Corollary 9.2.1 (p. 144) and the proof of Main Theorem 9.2.2 (p. 145), in arXiv v5; inherited from Theorem 4.6.1 / Remark 4.6.2 (p. 78); present in v4 at pp. 133–134 Independent review source locations: v5 PDF pp. 45, 57–58, 64–66, 78, 137–138, 144–145; v4 PDF pp. 57–58, 69, 133–134; published PDF pp. 47, 60–61, 67–69, 82–83, 144–145, 152–153.

**Printed:** “and thus I_w = L(s + 1/2, ord, π_w, χ_w) · 𝔙_w · ⟨φ_w, φ̃_w⟩_{π_w}, (83)” and, in Theorem 4.6.1, “I_p = L_p(s, ord, π, χ) × ∏_w[𝔙_w · ⟨φ_w, φ̃_w⟩_{π_w}]”

**Correction or missing argument:** Divide the computed Zw by the nonzero local pairing in (51). Thus Iw is the corrected Euler coefficient times Vw, with no further pairing, and Ip is the product of these normalized factors. Apply the same deletion in 4.6.1/4.6.2 and the dependent corollaries. This matches the pairing normalization in 9.2.2, subject to E51-E53/E57 and the global factor corrections. In the proof of 9.2.2 the second repeated volume label should be -V.

**Independent check:** Equation (51) defines Iw=Zw/pair, and the theorem computes Zw=L*Vw*pair. Therefore (83) and 4.6.1 insert one pairing too many. Scaling a local vector already shows the false homogeneity: Iw is unchanged while their right side scales. The extra pairing is inherited in 4.6.2 and the values of 9.1.8/9.2.1; their cited formula cannot produce 9.2.2 without deleting it. The latter theorem has the normalization consistent with Iw=L*Vw. This establishes only consistency of this normalization, not validity of the main theorem after the other independent corrections.

## E59 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** Remark 4.3.11, p. 65, in arXiv v5; present in v4 p. 58 Independent review source locations: v5 PDF pp. 65; v4 PDF pp. 58; published PDF pp. 68–69.

**Printed:** “Let ω_{a_w} denote the central quasi-character of π_{a_w}. Then ε(−s + 1/2, π_{a_w} ⊗ χ_{1,w}) = ω_{a_w}(−1)/ε(s + 1/2, π̃_{a_w} ⊗ χ_{1,w}^{−1}). So we may rewrite I_2 as I_2 = ω_{a_w}(−1)L(1/2 + s, π̃_{a_w} ⊗ χ_{1,w}^{−1}) / [ε(s + 1/2, π̃_{a_w} ⊗ χ_{1,w}^{−1}) L(−s + 1/2, π_{a_w} ⊗ χ_{1,w})] · Vol(𝔛^{(1)}), and hence I_w/𝔙 as …”

**Correction or missing argument:** ω_{a_w}(−1) should be the value at −1 of the central character of π_{a_w} ⊗ χ_{1,w}, i.e. ω_{a_w}(−1)χ_{1,w}(−1)^{a_w}. The rewritten I_2 should end with ·Vol(𝔛^{(1)})·⟨φ_{a_w}, φ̃_{a_w}⟩_{π_{a_w}}, and 𝔙 should be 𝔙_w. (Given sourceIssues E57, the true I_2 and I_w/𝔙_w are these expressions without the sign.) This corrects the displayed Godement-Jacquet functional-equation factor; any assertion about the full local zeta integral is conditional on also repairing E51-E53 and E58.

**Independent check:** The epsilon-product identity uses omega_{pi_a tensor chi1}(-1)=omega_{pi_a}(-1)chi1(-1)^a. In rank one an odd chi1 shows the omitted factor cannot be discarded. In addition, the rewritten I2 loses its pairing and V loses its index. Correct the reach of the full finding: it includes a false scalar identity, not only harmless notation. After E57 is applied, the correct expression in inverse-epsilon form has no extra central sign.

## E60 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** Remark 4.3.12, pp. 65–66, in arXiv v5; present in v4 p. 58 Independent review source locations: v5 PDF pp. 55, 57, 65–66; v4 PDF pp. 58; published PDF pp. 58, 60, 69.

**Printed:** “From this we conclude that I_w/(Vol(Γ_{R,w})·Vol(ᵗΓ_{R,w})) = L(s + 1/2, ord, π_w, χ_w)⟨φ_w, φ̃_w⟩_{π_w}/Vol(Γ_{R,w} ∩ ᵗΓ_{R,w}). The right-hand side (and hence the left-hand side) is easily seen to be independent of r.”

**Correction or missing argument:** The geometric product volume V_w=Vol(Gamma_R)Vol(transpose(Gamma_R))/Vol(Gamma_R intersect transpose(Gamma_R)) is independent of r. The printed expression involving the fixed-normalization pairing is not: its index factor is q_w^(r dim N_R). Delete its r-independence assertion. A corrected expression for I_w requires the separate integral repairs E51-E53/E57/E58; the volume calculation alone does not establish it.

**Independent check:** With the vectors normalized in 4.3.4, (72) gives pair=Vol(Gamma_R) times fixed constituent pairings. The asserted right side is thus L times [Gamma_R:Gamma_R intersect transpose(Gamma_R)] times those pairings. The index is q^(r dim N_R), not constant. For GL2 upper Iwahori the exact finite counts give p,p^2,p^3 at r=1,2,3. The product volume Vw itself is constant by the integral Gauss-cell decomposition. The later trace-compatible normalization of vectors is different and does not validate this assertion with the currently specified vectors.

## E61 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §4.4.1, p. 66, lines 3–4, in arXiv v5; present in v4 p. 59 and v2/v3 p. 59 Independent review source locations: v5 PDF pp. 12, 66; v4 PDF pp. 59; v2 PDF pp. 58; v3 PDF pp. 58; published PDF pp. 69.

**Printed:** “we let G* = GU_1^+ = R_{K/Q}GU^+(V) where GU^+(V) denotes the full unitary similitude group of V. Thus G*(R) = ∏_{σ∈Σ_{K^+}} G_σ, with G_σ = GU^+(V)_{K^+_σ}”

**Correction or missing argument:** Replace R_{K/Q} by R_{K^+/Q}.

**Independent check:** Section 1.4 defines GU^+(V) over K^+, and the real factors here are indexed by embeddings of K^+. Its restriction of scalars is therefore from K^+, not K. Correct the earlier-version locator: the matching v2/v3 sentence is on p.58, not p.59.

## E62 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** §4.4.2, definition of J_{χ_σ} and Remark 4.4.3, p. 69, in arXiv v5; present in v4 p. 61 Independent review source locations: v5 PDF pp. 69, 76, 84; v4 PDF pp. 61; published PDF pp. 72–73, 80.

**Printed:** “ι(χ_σ)(v(χ_σ)) = J_{χ_σ}(g) := j(g)^{−m+a(χ_σ)} · j'(g)^{−m+b(χ_σ)}ν(g)^{n(m+a(χ_σ)+b(χ_σ))}” and “Remark 4.4.3. Note that J_{χ_σ} depends only on the archimedean character χ_σ = ||•||^m_σ χ_{0,σ}.”

**Correction or missing argument:** Restrict the independence statement to the unitary group, or specify and verify a central extension whose exponent depends only on the full character chi_sigma. The given nu exponent cannot be used as a factorization-independent definition on GU.

**Independent check:** For fixed chi_sigma, replacing (m,a,b) by (m-k,a-k,b-k) keeps both exponents -m+a,-m+b unchanged, but multiplies the displayed function by nu^(-3nk). Taking any positive real scalar similitude with nu !=1 disproves the stated factorization independence. The assertion is correct after restriction to nu=1. Remark 4.5.3 acknowledges omissions, but does not make this explicit assertion on GU true; its use in Definition 5.3.2 also needs the corrected central convention.

## E63 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §4.4.2, p. 70, line 1, in arXiv v5; present in v4 p. 62 and v2/v3 p. 61 Independent review source locations: v5 PDF pp. 70; v4 PDF pp. 62; v2 PDF pp. 61; v3 PDF pp. 61; published PDF pp. 73.

**Printed:** “(Compare [Har97, Lemma 3.3.7] when a(χ_s) = 0.)”

**Correction or missing argument:** a(χ_σ) = 0

**Independent check:** The character subscript is the archimedean embedding sigma throughout this construction; s is not such an index. All compared versions retain this slip.

## E64 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** Lemma 4.4.8, p. 72, in arXiv v5; present in v4 p. 64 and v2/v3 p. 64 Independent review source locations: v5 PDF pp. 72; v4 PDF pp. 64; v2 PDF pp. 64; v3 PDF pp. 64; published PDF pp. 76.

**Printed:** “where μ runs over r-tuples c_1 ≥ c_2 ≥ ⋯ ≥ c_u ≥ 0 such that Σ_i c_i = d. Moreover, if μ = c_1 ≥ c_2 ≥ ⋯ ≥ c_u ≥ c_{u+1} = 0, the highest weight space … is spanned by the polynomial Δ^μ = ∏_{i=1}^{r} Δ_i^{c_i−c_{i+1}}.”

**Correction or missing argument:** u-tuples; Δ^μ = ∏_{i=1}^{u} Δ_i^{c_i − c_{i+1}}

**Independent check:** The matrices have size u and the displayed partition has u parts. The leading minors exist for 1<=i<=u. Both occurrences of the unrelated r must be u.

## E65 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** Corollary 4.4.9, p. 73, in arXiv v5; present in v4 p. 64 Independent review source locations: v5 PDF pp. 73; v4 PDF pp. 64; published PDF pp. 76.

**Printed:** “pr^{hol}_{κ,σ}(δ(r̃_σ, s̃_s) · v(χ_σ)) = P_{κ_σ,χ,σ} · v_{κ_σ} ⊗ v_{κ^♭_σ⊗χ_σ}”

**Correction or missing argument:** δ(r̃_σ, s̃_σ)

**Independent check:** The differential operator is indexed by the two sequences at the same embedding sigma. The isolated s subscript on the second sequence is erroneous.

## E66 — confirmed

**Kind:** gap. **Reach:** the proof. **Existing correction:** new.

**Source:** Corollary 4.4.9, last statement, and its proof, p. 73, in arXiv v5; present in v4 pp. 64–65 Independent review source locations: v5 PDF pp. 71–73; v4 PDF pp. 63–65; published PDF pp. 74–77; harris86 PDF pp. 38–39, 44–48.

**Printed:** “Then for all κ† ≤ κ there exist unique elements δ(κ, κ†) ∈ U(p^+_3), defined over algebraic number fields, such that D(κ, χ) = Σ_{κ†≤κ} δ(κ, κ†) ∘ D^{hol}(κ†, χ); δ(κ, κ) is the scalar ∏_σ P_{κ_σ,χ,σ}.” … “The remaining statements are formal consequences of the decomposition (93) and the fact that the decomposition is rational over an appropriate reflex field, cf. Lemma 7.3.2 of [Har86].”

**Correction or missing argument:** Prove the missing cyclicity for the actual components, or formulate the decomposition using operators between the full minimal K-types. In the latter formulation recheck the ordinary-projector argument that uses it; the original report does not establish that every later use survives.

**Independent check:** PBW gives each summand as S(p3^+) tensor its full minimal K3-type, not just its highest-weight line. Thus decomposition (93) alone does not put every component of D(kappa,chi)v(chi) in S(p3^+) times the selected highest-weight vector. The cited Harris 1986 Lemma 7.3.2 (printed pp.359-360, PDF38-39) proves rationality and uniqueness of a decomposition of induced modules; its Section 7.11 (printed pp.365-369, PDF44-48) constructs vector-bundle-valued differential operators. Neither cited passage supplies the stronger scalar-operator cyclicity claimed here. Confirm this precise proof gap, without asserting a counterexample to the particular corollary or a completed repair of Section 8.

## E67 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §4.4.10, p. 74, last paragraph (before (105)), in arXiv v5; present in v4 p. 66 and v2/v3 p. 66 Independent review source locations: v5 PDF pp. 72, 74; v4 PDF pp. 63–64, 66; v2 PDF pp. 65; v3 PDF pp. 65; published PDF pp. 75, 78.

**Printed:** “Suppose Σ_σ[Σ_i r̃_{i,σ} + Σ_j s̃_{j,σ}] = d. Then we define p(r̃, s̃) = ∏_σ p(r̃_σ, s̃_σ) … δ^d_χ(r̃, s̃) = δ^d_χ(p(r̃, s̃))”

**Correction or missing argument:** Σ_σ[Σ_i i·r̃_{i,σ} + Σ_j j·s̃_{j,σ}] = Σ_σ[Σ_i r_{i,σ} + Σ_j s_{j,σ}] = d

**Independent check:** A leading i-by-i determinant has degree i. Consequently the degree is sum_i i(r_i-r_{i+1})+sum_j j(s_j-s_{j+1})=sum_i r_i+sum_j s_j. For example r=(1,1) produces Delta2 of degree 2 but the printed difference sum is 1. The v2/v3 occurrence is p.65, not p.66.

## E68 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** §4.4.12, p. 75, first sentence, in arXiv v5; present in v4 p. 66 and v2/v3 p. 66 Independent review source locations: v5 PDF pp. 75, 145; v4 PDF pp. 66, 134; v2 PDF pp. 66, 98, 131; v3 PDF pp. 66, 98, 130; published PDF pp. 79, 153; mok PDF pp. 32–36.

**Printed:** “If π is a cuspidal automorphic representation of GU(V) whose component at σ is an anti-holomorphic discrete series representation of the form D_c(τ_σ), then its base change Π to an automorphic representation of GL(n)_K (ignoring the split center) is cuspidal, cohomological, and satisfies Π^∨ ≅ Π^c”

**Correction or missing argument:** Require a simple cuspidal global parameter when asserting that the standard base change is cuspidal. In the generic tempered case allow an isobaric sum of conjugate-self-dual cuspidal constituents. For more general parameters state the appropriate transfer separately; the Hodge-type discussion does not by itself prove cuspidality.

**Independent check:** Cuspidality on a unitary group does not impose a simple global parameter. The local and global packet statements in Mok Theorems 2.5.1-2.5.2 (PDF32-35) allow endoscopic discrete-series members with a generic parameter phi1 boxplus phi2; their standard transfer is the corresponding noncuspidal sum. Holomorphic/anti-holomorphic discrete series at infinity do not remove that possibility. The paper itself separately requires cuspidal base change later. Remove the original unverified particular examples of CM forms and replace the overbroad corrected statement by a precise additional stable-cuspidal parameter assumption. In the tempered generic setting the transfer is an isobaric sum; no universal temperedness assertion is needed for this finding.

## E69 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §4.4.12, definition of the Hodge polygon, p. 75, in arXiv v5; present in v4 p. 67 (and the same wording in §8.3, p. 134) Independent review source locations: v5 PDF pp. 75, 134; v4 PDF pp. 67; published PDF pp. 79, 141.

**Printed:** “We define the Hodge polygon Hodge(κ, κ^c) = Hodge(D_c(τ)), to be the polygon in the right half-plane connecting the vertices (i, p_i) with (p_i, q_i) the pairs in (106).”

**Correction or missing argument:** Sort the p-values increasingly as h1,...,h_{2n}, then use vertices (0,0) and (i,sum_{j<=i}h_j). In 8.3.11 sum these cumulative ordinates over the indicated embeddings, with its specified normalization.

**Independent check:** A Hodge polygon has the sorted Hodge numbers as successive slopes, so its ordinate at i is their cumulative sum (and it starts at (0,0)). The printed ordinates are individual p_i in the unsorted order of (106). For n=2,a=b=1,kappa=2,kappa^c=-2 the listed p-values are 2,2,-1,-1, while the correct ordinates are 0,-1,-2,0,2. The same cumulative-sum correction is needed in 8.3.11 before its Newton comparison.

## E70 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §4.4.14, p. 76, and §4.5.4, p. 76 versus Proposition 4.5.6, p. 77, in arXiv v5; present in v4 pp. 67–68 Independent review source locations: v5 PDF pp. 66–67, 76–77; v4 PDF pp. 59, 67–68; v2 PDF pp. 59; v3 PDF pp. 59; published PDF pp. 70–71, 80–81.

**Printed:** §4.4.14: “with φ_v a vector in the minimal U_σ-type 1 ⊗ W^∨_{τ_σ} of D_c(κ) … φ_{κ,+} (resp. φ_{κ,−}) is an eigenvector for T_σ of weight −w_0(κ) (resp. of weight −κ).” §4.5.4: “Let φ_σ ⊗ φ^♭_σ be an anti-holomorphic vector in the highest weight subspace of the minimal K_σ-type of π_σ ⊗ π^♭_σ.” Proposition 4.5.6: “where φ_σ = φ_{κ_σ,−}, φ^♭_σ = φ_{κ^♭_σ,−}”

**Correction or missing argument:** Make 4.4.14 use the minimal type fixed in (88)/(90) and recompute its extremal weights in that convention. Specify the vector in 4.5.4 by the nonzero duality pairing with the selected holomorphic vector, and use the same choice in 4.5.5-4.5.6. Do not transplant the older dual convention selectively.

**Independent check:** In v5/published (88)/(90) put W_tau^dual in D and W_tau in Dc, whereas 4.4.14 uses W_tau^dual for Dc and its dual weights. Also 4.5.4 calls for a highest vector while 4.5.6 chooses the minus vector. Correct the report version history: v4 and v2/v3 used Dflat with W_tau and Dc with W_tau^dual, so their minimal-type convention itself is consistent with 4.4.14; only the highest/lowest wording conflict persists there. A consistent global convention must be chosen before using the pairing.

## E71 — confirmed

**Kind:** gap. **Reach:** the proof. **Existing correction:** new.

**Source:** Lemma 4.5.2 and §4.5.4, (107), p. 76, in arXiv v5 (with §4.4.2, p. 69); present in v4 p. 67 Independent review source locations: v5 PDF pp. 69, 76, 83–84; v4 PDF pp. 61, 67; published PDF pp. 72, 80; eischen-liu20 PDF pp. 9–11.

**Printed:** Lemma 4.5.2: “ι(m, χ_σ)(D²(m, χ_σ)) ⊂ I_σ(m − n/2, χ).” §4.5.4: “f_σ = f_σ(χ_σ, c) ∈ I(χ_{u,σ}, m) … f_σ(χ_σ, c, g) = B(χ_σ, κ_σ)D(κ_σ, m, χ_{u,σ})J_{m,χ_{u,σ}}(g) … where J_{m,χ_{u,σ}} ∈ C^∞(G_4) is the canonical automorphy factor introduced in Section 4.4.2”

**Correction or missing argument:** Introduce separate mu and m, write chi0 at infinity explicitly in terms of chiu, and calculate the parabolic transformation law of J and its derivatives in the chosen polarization. State the resulting I(chiu,s) and the value of s, including the n/2 normalization and central character. Do not claim a full repair without that calculation.

**Independent check:** The algebraic factorization chi=norm^mu chi0 and the unitary factorization chi=norm^m chiu have different exponents in general: m=mu-(a+b)/2. Nevertheless the same m and chi symbols are used for the archimedean model and its induced-representation placement, with an additional -n/2 shift in Lemma 4.5.2. Section 5.3.1 acknowledges the different factorizations but omits the conversion. The section (107) therefore needs an explicit character-and-parameter calculation to identify it in the global induced representation. This is a gap in the presented normalization, not a proof here that no consistent parametrization exists. Eischen-Liu Section 2.4 provides an explicit convention for a related classical section, which can guide a repair but is not automatically an identification with the literal GU formula.

## E72 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** Proposition 4.5.6, p. 77, in arXiv v5; present in v4 p. 68 Independent review source locations: v5 PDF pp. 12–13, 76–77; v4 PDF pp. 67–68; published PDF pp. 80–81; garrett06 PDF pp. 4, 11; harris08 PDF pp. 27, 31; eischen-liu20 PDF pp. 4–7, 9–11.

**Printed:** “In the meantime, we will be satisfied with the following result, due to Garrett [Gar08]. Proposition 4.5.6. … Then I_σ(χ_σ, κ_σ) is a non-zero algebraic number.”

**Correction or missing argument:** State the local Haar and rational-section normalizations explicitly and reconcile them with the global measure factor. With Garrett's measure the stated qualitative result includes pi^(ab); Harris 2008 explains a compensating measure. For arbitrary measures keep the corresponding explicit scalar. Eischen-Liu gives later precise archimedean values in its own stated normalization.

**Independent check:** The original report overlooks a relevant part of the cited reference: Harris 2008 Remark 4.4(iii) and Section 5 (PDF27,31) explicitly compensate Garrett's pi^(ab) by a measure choice. Garrett's qualitative theorem (PDF4,11) is local and not restricted to imaginary-quadratic global fields, so the claimed separate general-CM obstruction should be removed. The actual remaining defect is compatibility with EHLS Hypothesis 1.4.4, which fixes only the product of archimedean measures. With at least two real places, rescale their measures by pi and pi^-1; every listed measure condition is preserved, whereas the nonzero individual I_sigma is multiplied by pi. The assertion of algebraicity for all permitted choices cannot survive both choices. Specify each local normalization, not merely the adelic product. This affects the literal algebraicity assertion; no contradiction to Garrett's normalized theorem is claimed.

## E73 — confirmed

**Kind:** misprint. **Reach:** a stated result. **Existing correction:** new.

**Source:** Theorem 4.6.1, p. 78, definition of I_p and L_p (and Remark 4.6.2), in arXiv v5; present in v4 p. 69 and v2/v3 p. 68–69 (Proposition 4.6.1); the same mistake at §9.2, Main Theorem 9.2.2, p. 145 (interpolation formula), in arXiv v5; inherited from Theorem 4.6.1 (p. 78); present in v4 at p. 134 Independent review source locations: v5 PDF pp. 64–65, 78, 145; v4 PDF pp. 57–58, 69, 134; v2 PDF pp. 69; v3 PDF pp. 69; published PDF pp. 67–69, 82, 153.

**Printed:** “I_p = L_p(s, ord, π, χ) × ∏_w[𝔙_w · ⟨φ_w, φ̃_w⟩_{π_w}], … L_p(s, ord, π, χ) := ∏_{w|p} L(s, ord, π_w, χ_w).” and “D(χ) · I(φ, φ^♭, f, s) = ⟨φ, φ^♭⟩ · I_p(χ, κ)I_∞(χ, ρ^υ)I_S L^S(s + 1/2, π, χ_u) … I_∞(χ, κ) = ∏_σ I_σ(χ_σ, κ_σ)”

**Correction or missing argument:** With the printed definition Lp(x,ord)=product_w L(x,ord), use Lp(s+1/2,ord) in 4.6 and Lp(m+1/2,ord) in 9.2.2. Incorporate E57/E58 in the factor itself; consistently label the infinity product.

**Independent check:** Equation (83) names the displayed local ratio L(s+1/2,ord,...). Section 4.6 defines Lp(x,ord) as the product of L(x,ord) but then inserts x=s in the same global formula with L^S(s+1/2). Thus its argument is shifted by 1/2, and specializing s=m preserves the mismatch in 9.2.2. It can be fixed by renaming Lp or changing its argument, but the definition and uses must agree. The infinity labels denote the same previously defined product.

## E74 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** Theorem 4.6.1, p. 78, in arXiv v5; present in v4 p. 69 and v2/v3 (Proposition 4.6.1) Independent review source locations: v5 PDF pp. 45–48, 64, 77–78, 84, 144–145; v4 PDF pp. 69, 133–134; published PDF pp. 47, 49–51, 67, 81–82, 152–153.

**Printed:** “Assume the local components at finite places outside S = S_π are unramified vectors … assume the Siegel–Weil section f_s ∈ I(χ, s) … Write χ = ||•||^m χ_u. Then we have the equality D(χ)·I(φ, φ^♭, f, s) = ⟨φ, φ^♭⟩ · I_p(χ, κ)I_∞(χ, ρ^υ)I_S L^S(s + 1/2, π, χ_u) where I_S = ∏_{v∈S} D_v(χ)·volume(𝒰_v)”

**Correction or missing argument:** Use one common pair (chiu,m) for the sections and local integrals. Choose Sprime away from p containing all non-p bad places. The unconditional bookkeeping identity is D^p(chi) I = global_pair * Ip * Iinfinity * product_{v in Sprime}(Dv Iv) * product_{v outside Sprime union p}(Dv Iv). Under a valid compatible spherical quotient Dv Iv=Fv, the last product is F^{Sprime union p}; using D instead of D^p adds product_{v|p}Dv on the right. Specify Fv and Dv after the independent E41 convention correction; do not assert the original L^{Sprime union p}(m+1/2,pi,chiu) without that reconciliation.

**Independent check:** The factor D(chi) includes all finite places, but the p-integral contains no compensating Dp and replaces, rather than multiplies, the standard p-Euler factor. At a non-p bad place the formula requires the larger Sprime covering representation, character and field ramification. Moreover D(chi) is fixed by m, while the printed theorem uses variable s and alternates between chi and its unitary part. These are independent bookkeeping failures visible by multiplying the local factors in (51). The original correction silently reused the printed unramified formula, which E41 independently refutes, so it must be qualified: a fully corrected global L-function formula also requires resolving that character convention.

## E75 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** §5.1, p. 79, after the definition of Λ_{X,R}, in arXiv v5 Independent review source locations: v5 PDF pp. 79; v4 PDF pp. 78; published PDF pp. 83.

**Printed:** Λ_{X,R} = lim_i R[X/X_i]. This is a compact topological ring.

**Correction or missing argument:** This is a topological ring, compact when R is compact (e.g. R finite over Z_p).

**Independent check:** Take X to be a point and R=Z_p[[T]] with the stipulated p-adic topology. Then Lambda=R has the infinite discrete quotient F_p[[T]], so is not compact. Compactness follows if R itself is compact. This refutes the explicit assertion, even though no later use of compactness was identified.

## E76 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §5.2.1, pp. 81–82 (both definitions of admissible measures), in arXiv v5 Independent review source locations: v5 PDF pp. 81–82; v4 PDF pp. 79–80; published PDF pp. 85–86.

**Printed:** K_i^p ⊂ G_i(A_f^p), i = 1,2, be open compact subgroups such that ν(K_1) = ν(K_2); … μ(·) = μ(κ,ψ,·) ∈ Meas(X_p; V^ord_{κ'}(K_3^p, R)) …; μ(·) = μ(ρ,ψ,·) ∈ Meas(X_p; V^ord_{ρ^△·(α,β)}(K_3^p, R))

**Correction or missing argument:** Use nu(K_1^p)=nu(K_2^p) and Meas(X_p,V^ord(K_3^p,R)), together with the stated specialization conditions. Define ell on the corresponding full cuspidal space (or explicitly define an ambient subspace containing all specializations).

**Independent check:** The displayed tame levels are K_i^p. The nebentypus of the specialization varies with chi, whereas the printed target without a nebentypus is not defined in 2.9. Use the full ordinary space as the ambient target, retaining the specified weight/nebentypus for each specialization. The functional ell must likewise be defined on the appropriate full cuspidal ambient space.

## E77 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §5.2.2, p. 82, in arXiv v5 Independent review source locations: v5 PDF pp. 82; v4 PDF pp. 80–81; published PDF pp. 86.

**Printed:** suppose we are given a homomorphism sh : T_{H_3}(Z_p) → X_p as before. By duality this gives a map sh^* : C(X_p,R) → C(T_H(Z_p),R) for any ring R

**Correction or missing argument:** sh^* : C(X_p,R) → C(T_{H_3}(Z_p),R); and drop 'as before' (no homomorphism sh was introduced earlier).

**Independent check:** Pullback along sh has target functions on its domain T_H3, not T_H1. The shift earlier was a fixed character, so as before is also inaccurate.

## E78 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §5.3.1, p. 83, definition of Y_H^alg; and §5.3, p. 82, last sentence, in arXiv v5 Independent review source locations: v5 PDF pp. 82–83, 113–114; v4 PDF pp. 81; published PDF pp. 86–87.

**Printed:** c = ψρ^υ is a locally algebraic character of T_H(Z_p) … In other words, c ∈ C_r(T_H(Z_p), R) for some r ≥ 0, in the notation of Lemma 7.4.2.  /  Throughout this section, we take χ : K^×\A_K^× → C^× to be a unitary Hecke character.

**Correction or missing argument:** c ∈ C_r(T_H(Z_p), R) · ρ^υ for some r ≥ 0. / (drop 'unitary', or say χ_u is unitary)

**Independent check:** Section 7.4 defines C_r as functions on T/T_r. A nontrivial algebraic character is not locally constant. Lemma 7.4.2 itself correctly uses C_r times rho^upsilon. The unitary restriction also directly contradicts the following paragraph allowing nonunitary classical chi.

## E79 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §5.3.1, definition of U_{p,κ} before (111), p. 83, in arXiv v5 Independent review source locations: v5 PDF pp. 25, 83, 98; v4 PDF pp. 96; published PDF pp. 87, 102.

**Printed:** Let U_{p,κ} = ∏_{w∈Σ_p} ∏_{j=1}^n U_{w,j,κ}, with notation as in (23)

**Correction or missing argument:** U_{w,j,κ} = |κ'(t_{w,j})|_p^{-1} U_{w,j} as defined in §6.6 (p. 98), with U_{w,j} = K_r t^+_{w,j} K_r of (23).

**Independent check:** Equation (23) defines the unnormalized double cosets. The weight-normalized U used in the projector is explicitly defined only in 6.6, where its scalar is |kappa-prime(t_wj)|_p^-1. Replace the cross-reference accordingly.

## E80 — rejected

**Kind:** gap. **Reach:** nothing. **Existing correction:** Not an error: rejected by REV-ERRATA-PAPER-EISCHEN-HARRIS-LI-ETAL-20.

**Source:** §5.3.1, (110), p. 83, in arXiv v5 Independent review source locations: v5 PDF pp. 73, 83; v4 PDF pp. 81; published PDF pp. 77, 87.

**Printed:** (χ, c) ∈ Y_H^class ⇔ κ_σ ∈ C_3(μ, z_σ^{-a(χ_σ)} z̄_σ^{-b(χ_σ)}) ∀σ ∈ Σ

**Correction or missing argument:** No mathematical correction established; an optional restatement of (97) is editorial.

**Independent check:** The paragraph immediately preceding (110) explicitly cites (97) when introducing rho and the involution. Equation (97) supplies kappa=rho+(alpha,beta) and explains their mutual determination. Therefore the claim that this relation is supplied only in Section 8.2 is false. Repeating the definition would improve exposition but is not an established source gap.

## E81 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §5.3.1, p. 83, lines around (110), in arXiv v5 Independent review source locations: v5 PDF pp. 73, 83; v4 PDF pp. 81; published PDF pp. 77, 87.

**Printed:** recall the set C_3(μ, χ_σ) of (93) … This condition is independent of the choice of m as above, in other words is independent of the choice of factorization.

**Correction or missing argument:** C_3(μ, χ_{0,σ}) (notation of (93)–(94): C_3(χ_σ) = C_3(m, χ_{0,σ})); 'independent of the choice of μ as above'.

**Independent check:** The chosen algebraic factorization uses mu and chi_0, whereas m and chi_u are introduced only in the next paragraph. Correct those labels in the cone and independence sentence. This algebraic-weight observation does not repair the separate GU-function independence failure in E62.

## E82 — confirmed

**Kind:** gap. **Reach:** the proof. **Existing correction:** new.

**Source:** §5.3.1, p. 84, paragraph after Definition 5.3.2, in arXiv v5 Independent review source locations: v5 PDF pp. 78, 84, 145; v4 PDF pp. 82; published PDF pp. 82, 88, 153.

**Printed:** One obtains a measure normalized at S from an unnormalized measure by multiplying by the appropriate product of local Euler factors at S.

**Correction or missing argument:** Prove divisibility of the particular measure by the relevant Euler polynomials, impose sufficient unit hypotheses, or state the normalized object in a localization where those denominators can be inverted. A pseudomeasure formulation requires the usual non-zero-divisor hypotheses. Track this choice in the final interpolation theorem.

**Independent check:** The factor D_v is an inverse Euler polynomial. Such inverses need not preserve integral measures: for n=1,p=3,q_v=7 and trivial specialization, 1-q_v^-1=6/7 is a nonunit in Z_3 and its inverse is 7/6. Thus normalization does not follow formally from multiplying an arbitrary integral measure. Cancellation by this specific Eisenstein measure could still make the result integral, but the stated step supplies no divisibility argument. Do not claim an actual nonintegral Eisenstein specialization from this scalar example alone.

## E83 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §5.3.1, sentence after Definition 5.3.2, p. 84, in arXiv v5 Independent review source locations: v5 PDF pp. 84–85; v4 PDF pp. 82–83; published PDF pp. 88–89.

**Printed:** The measure dEis is said to be normalized at S if instead of the last relation one has ∫_{X_p×T_H(Z_p)} (χ,c) dEis = D(χ) · res_3 E_{f(χ,c)} for all (χ,c) ∈ Y_H^class.

**Correction or missing argument:** e_κ ∘ ∫_{X_p×T_H(Z_p)} (χ,c) dEis = D(χ) · e_κ ∘ res_3 E_{f(χ,c)}

**Independent check:** The unnormalized identity and (113) in v5 both have e_kappa on each side, but the adjacent normalized variant omits it. In v4 both variants omitted the projector consistently, so this particular mismatch was introduced in v5.

## E84 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** Definition 5.3.2, first condition, p. 84, in arXiv v5 Independent review source locations: v5 PDF pp. 83–84; v4 PDF pp. 82; published PDF pp. 87–88.

**Printed:** If v is a finite place outside S – so in particular χ_v is unramified for all χ ∈ Y_H^class – then f_v(χ_v,c) is the unramified vector in I_v(χ_{u,v},m) with f_v(χ_v,c)(1) = 1.

**Correction or missing argument:** If v is a finite place with v ∤ p and v ∉ S, then …; and one must assume that S contains the primes dividing N_0 (and those ramified in K/K^+), so that χ_v is unramified outside S ∪ {p} for all χ ∈ Y_H^class.

**Independent check:** S is defined from prime-to-p levels and excludes p, so its unramified-vector condition literally includes p even when chi is ramified there. Moreover the conductor N_0 is independently allowed. Those ramified induced representations have no spherical vector of the asserted kind. Restrict the first condition away from p and enlarge the bad set to cover all other ramification.

## E85 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** §5.3.1, (113), p. 85 (with Definition 5.3.2, third condition, p. 84), in arXiv v5 Independent review source locations: v5 PDF pp. 84–85; v4 PDF pp. 82–83; published PDF pp. 88–89.

**Printed:** e_κ ∘ ∫_{X_p×T_H(Z_p)} (χ,c) dEis = D^?(χ) · e_κ ∘ res_3 D(κ,m,χ_u) E^holo_{χ_u,c}(m)

**Correction or missing argument:** Insert product_{sigma in Sigma} B(chi_sigma,kappa_sigma) in (113) and subsequent formulas using that rewriting, or consistently construct and verify a normalization with every B=1.

**Independent check:** Definition 5.3.2 includes one scalar B at every archimedean place, while (112) uses the scalar-free J. Linearity of the Eisenstein series and differential operator therefore leaves a factor product B in (113). Renormalizing all B to 1 also requires checking the chosen measure and its integrality; it is not an automatic harmless change.

## E86 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §5.3.1, (112), p. 85, and Definition 5.3.2, third condition, p. 84, in arXiv v5 Independent review source locations: v5 PDF pp. 84–85; v4 PDF pp. 82–83; published PDF pp. 88–89.

**Printed:** f^holo(χ,c) = ⊗_{σ∈Σ_F} J_{m,χ_{u,σ}} ⊗ ⊗_{v∤∞} f_v(χ_v,c); E^holo_{χ_u,c}(m) = E_{f^holo(χ_u,c)}(m); and '… J_{m,χ_{u,σ}}(g), g ∈ G_{4,σ} where J_{m,χ_{0,σ}} ∈ C^∞(G_4) is the canonical automorphy factor …'

**Correction or missing argument:** Replace Sigma_F by Sigma; use f^holo(chi,c) consistently and the J subscript chi_u corresponding to the declared unitary factorization. Supply its relation to the algebraic factorization as required by E71.

**Independent check:** The archimedean factors run over the CM type Sigma, not embeddings of the reflex field. The arguments chi versus chi_u and the J subscript alternate within the definition. Use one explicit factorization throughout. Remove the original appeal to unconditional factorization independence on GU, which E62 refutes and E71 requires to be reconciled.

## E87 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** corrected in the published version, Section 6.1.2, p.91 (2020), DOI 10.1017/fmp.2020.4.

**Source:** §6.1.2, p. 86, first sentence, in arXiv v5 Independent review source locations: v5 PDF pp. 86; v4 PDF pp. 86; published PDF pp. 91.

**Printed:** We will write H^i(Sh(V), ω_κ) instead of H^0(Sh(V)^tor, ω_κ), which is imperfect shorthand for lim_{K,Σ} H^i(_KSh(V)_Σ, ω_κ)

**Correction or missing argument:** … instead of H^i(Sh(V)^tor, ω_κ) …

**Independent check:** The shorthand concerns degree i, not degree zero. Crucially the published p.91 already has H^i in both places. Confirm the v5 typo, but remove the report assertion that it survives verbatim in print.

## E88 — confirmed

**Kind:** gap. **Reach:** the proof. **Existing correction:** corrected in the published version, Section 6.1.2, p.91 (2020), DOI 10.1017/fmp.2020.4.

**Source:** §6.1.2, (114), p. 87, in arXiv v5 Independent review source locations: v5 PDF pp. 87; v4 PDF pp. 87; published PDF pp. 91.

**Printed:** Then over C there is a natural identification of G(A_f)-modules: H^i_!(Sh(V), ω_κ) = H^i(P_h, K_h; A_0(G) ⊗ W_κ).   (114)

**Correction or missing argument:** State (114) for i = 0 and i = d (the only degrees used), or give a reference for general i.

**Independent check:** The draft claims equality for every i without an argument covering the middle degrees. The published equation (114), p.91, explicitly adds for i=0 or d, exactly the proposed restriction. Confirm the draft proof gap without asserting that the unrestricted mathematical statement is false; mark it corrected in the version of record.

## E89 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** §6.1.3, p. 88, lines 12–16 (the characters κ_h^±), in arXiv v5 Independent review source locations: v5 PDF pp. 22–23, 86, 88; v4 PDF pp. 85, 87; published PDF pp. 90, 92.

**Printed:** The action of h = (h_0,(h_σ)) ∈ H_0(C) on Hom_C(∧^d p_h^±, C) is just multiplication by h_0^{∓d} ∏_{σ∈Σ_K} det(h_σ)^{±2a_σ}; this is just the character κ_h^± = (∓d, (κ^±_{h,σ})), κ^±_{h,σ} = (±2a_σ, …, ±2a_σ).

**Correction or missing argument:** Use the actual dimension d=(1/2)sum_{Sigma_K}a_sigma b_sigma and replace the determinant exponents by plus-or-minus a_sigma, with the overall sign chosen consistently with E90. Recompute explicit kappa^D and its Hecke normalization in that convention.

**Independent check:** With d the actual dimension, the center t maps to (t^2,(tI)); the printed character then evaluates to t^(plus-or-minus 2d), although adjoint tangent representations have trivial central action. Directly the determinant of Hom(Lambda_0,sigma,Lambda_0,sigma^dual) contributes h0^(-a_sigma b_sigma) det(h_sigma)^a_sigma det(h_sigma-c)^b_sigma. Multiplying over the CM type gives exponents a_sigma, not 2a_sigma. The published paper separately drops the factor 1/2 in its dimension formula (new E165); using that incorrect d would square the entire correct character and does not rescue E89.

## E90 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §6.1.3, p. 88, 'The identification of G(C) with G_0(C) in 2.6.1 identifies Lie(P_0(C)) with P_h and Lie(H_0(C)) with k_h', versus §2.7.2, p. 28, in arXiv v5 Independent review source locations: v5 PDF pp. 28, 87–88; v4 PDF pp. 87; published PDF pp. 29, 91–92.

**Printed:** p. 88: 'identifies Lie(P_0(C)) with P_h' (P_h = p_h^- ⊕ k_h, p. 87); p. 28: 'The identification of G(C) with G_0(C) identifies Lie(P_0(C)) with k ⊕ p^+, and so f corresponds to a holomorphic form if and only if p^- ∗ f = 0.'

**Correction or missing argument:** Choose one Harish-Chandra sign convention and transport the parabolic, tangent/cotangent, canonical character and cochain formulas consistently. Do not change only the sign in 2.7 without checking the other formulas.

**Independent check:** Section 2.7 identifies Lie(P0) with k+p^+, whereas Section 6 identifies it with k+p^-. These cannot both hold for the same decomposition. The printed canonical-weight sign follows the earlier choice, so the original assertion that 2.7 is likely the slip is not justified.

## E91 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §6.2.1, (117), p. 89, in arXiv v5 Independent review source locations: v5 PDF pp. 88–90; published PDF pp. 92–94.

**Printed:** (π ⊗_C W_κ)^{K_h} → (π̄ ⊗_C W_{κ^⋆})^{K_h} →(id⊗i_{κ^⋆}) Hom_C(∧^d p_h^+, ⊗ π̄ ⊗_C W_{κ^D})^{K_h}

**Correction or missing argument:** Hom_C(∧^d p_h^-, π̄ ⊗_C W_{κ^D})^{K_h}

**Independent check:** The defined i_kappa-star has target Hom(wedge^d p^-,W_kappaD), as also used by (122). The plus in (117) and its stray tensor sign are transcription slips.

## E92 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §6.2.2, (121), p. 90, in arXiv v5 Independent review source locations: v5 PDF pp. 90; published PDF pp. 94.

**Printed:** W_{κ^♭,−V} ≅ W_{κ^⋆,V}, φ ↦ ((h, (h_σ)) ↦ φ(h_0, (w_σ h_0 ᵗh_{σc}^{-1})))

**Correction or missing argument:** φ ↦ ((h_0, (h_σ)) ↦ φ((h_0, (w_σ h_0 ᵗh_{σc}^{-1}))))

**Independent check:** The first coordinate of the function variable is h0, which appears on the right of the same expression.

## E93 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §6.2.3, definition of δ_p and (125), p. 91, in arXiv v5 Independent review source locations: v5 PDF pp. 15, 42, 90–91; v4 PDF pp. 90; published PDF pp. 95–96.

**Printed:** Let δ_p = (1, D ᵗβ_w^{-1} β_w^{-1})_{w∈Σ_p} ∈ Q_p^× × ∏_{w∈Σ_p} GL_n(K_w) ≅ G(Q_p) … Then δ̄_p = δ_p^{-1}, δ_p^{-1} conj(G(Z_p)) δ_p = G(Z_p), and δ_p^{-1} Ī^0_{r,V} δ_p = I^0_{r,−V}.   (125)

**Correction or missing argument:** In the Section 2.1 left-action/basis convention use delta_p=(1,D^-1 beta_w^-T beta_w^-1). If switching to row coordinates, transport both the Gram matrix and basis-change convention explicitly rather than mixing them.

**Independent check:** For the left action of G on V in 2.1 and the endomorphism beta taking the old basis to the chosen basis, column matrices satisfy bar(g)=nu D^-1 g^-T D and g=beta gprime beta^-1. Hence M=D^-1 beta^-T beta^-1 gives bar(M)=M^-1 and M^-1 bar(g)M=nu beta gprime^-T beta^-1, as required. The printed D instead introduces D^-2 inside that conjugation and fails when D^2 does not commute with beta beta^T, e.g. D=diag(1,3), beta=[[1,1],[0,1]] at p=5. Section 4.1 explicitly adopts a right action on W for its separate block calculation; do not confuse that local convention with the left endomorphism/basis convention here. Also correct the report quotation: the middle identity of (125) contains G(Z_p), not its conjugate.

## E94 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** §6.2.3, p. 91, lines after the definition of g^†, in arXiv v5 Independent review source locations: v5 PDF pp. 91–92; v4 PDF pp. 90–91; published PDF pp. 96–97.

**Printed:** Given K ⊂ G(A_f) we let K^† be the image of K under †. As a consequence of (125), if K = G(Z_p)K^p, then K^† = G(Z_p)K̄^p

**Correction or missing argument:** Use K^dagger=G(Z_p){nu(k)^-1 bar(k):k in K^p}. Equality with G(Z_p)bar(K^p) needs an additional central-stability hypothesis. Do not simply redefine K^dagger without adjusting the subsequent dagger-equivariant maps.

**Independent check:** The central factor nu(k)^-1 away from p is omitted in the asserted level equality. At a split auxiliary prime take K={(nu,A):nu in Z_l^x,A in Gamma_1(l)}. In dual coordinates bar(K) has B/nu in Gamma_1(l)^-T, whereas K^dagger has B in Gamma_1(l)^-T with independent similitude. Choosing nu nontrivial modulo l and B=I distinguishes them. One may impose an extra neat level at another prime without changing this counterexample. The Shimura map g to bar(g)delta and the dagger map must therefore have their levels distinguished.

## E95 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §6.3, p. 93, normalization of measures before (133), and §6.4.1, p. 94, in arXiv v5 Independent review source locations: v5 PDF pp. 93–94; published PDF pp. 98–99.

**Printed:** we write dg_∞ = dk_∞ × dx × dt/t, where dk_h is the measure that gives K_h measure 1, dt is Lebesgue measure on the center Z_{G(R)} ≅ R^× … ⟨φ,φ'⟩^Ser_κ = ∫ … dg_f (133) … It we use the basis dx …; (§6.4.1) the volume … is taken with respect to the Tamagawa measure dg also appearing in (133)

**Correction or missing argument:** dg_∞ = dk_h × dx × dt/t with dk_h giving the compact part K_h/R_{>0} volume 1 and dt/t Haar measure on the split centre R_{>0}; 'If we use'; refer to the dg-form of (133) (unnumbered) for the Tamagawa measure.

**Independent check:** K_h contains the positive split center and cannot have finite Haar volume. The real center is R_{>0} times the compact CM norm-one torus, not just R^x. The intended measure decomposition must first quotient that positive center. The sentence following (133) and the reference to its dg version also contain the stated slips.

## E96 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §6.4.1, text after (136), (137) and (138), pp. 94–95, in arXiv v5 Independent review source locations: v5 PDF pp. 94–95; published PDF pp. 99–100.

**Printed:** the volume Vol(I_r^0) of K_r^0 is taken …; ⟨φ,φ'⟩_{κ,K} = (1/Vol(I_r^0)) ∫ …   (137); if r' ≥ r and if φ is invariant by K_r and φ' by K'_r, then …

**Correction or missing argument:** 'the volume Vol(I^0_r) of I^0_r'; ⟨φ,φ'⟩_{κ,K_r} in (137); 'φ' by K_{r'}'.

**Independent check:** The normalized pairing was defined with the volume of I_r^0 and subscript K_r; the trace identity compares levels r and rprime. Its ratio follows from [I_r:I_rprime] and [I_r^0:I_r] exactly as the following displayed volume identity says.

## E97 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** §6.5.3, p. 96, first paragraph (and the matching signs in §6.3, pp. 93–94), in arXiv v5 Independent review source locations: v5 PDF pp. 22–23, 28, 88, 93–94, 96–97; published PDF pp. 92, 98–99, 101–102.

**Printed:** If (π_∞ ⊗_C W_κ)^{K_h} ≠ 0 (for example, if π is holomorphic of type (κ,K)), then ξ_{π,∞}(t) = t^{a(κ)} for t ∈ R^×.  /  The function g ↦ ||ν(g)||^{-a(κ)} defines a global section of L(κ)^∨

**Correction or missing argument:** With the conventions of §§2.6.3 and 2.7.2 (W_κ = functions on H_0 with right-translation action; forms f with f(gu) = u^{-1}·f(g), i.e. diagonal K_h-invariants), ξ_{π,∞}(t) = t^{−a(κ)}, g ↦ ||ν(g)||^{-a(κ)} is a section of L(κ), and the factors ||ν||^{-a(κ)} in (133), (137), (146), (147) and ||ν||^{a(κ)} in (141) change sign. Alternatively, keep §6 as printed and declare that K_h acts on W_κ contragrediently to §2.7.2.

**Independent check:** Right translation on W_kappa makes a real central t act by t^a(kappa). A diagonal invariant in pi_infinity tensor W_kappa therefore forces xi_pi(t)=t^-a(kappa). Likewise sections satisfy f(gu)=u^-1 f(g), so norm(nu)^-a is a section of L(kappa), not its dual. The contraction in (133) scales by t^-2a, requiring norm(nu)^+a for center invariance. The printed signs thus affect the literal character and pairing assertions; describing their effect as nothing understates the issue. A global convention change can repair them but must be carried through all twists.

## E98 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §6.5.3, (143), p. 96, in arXiv v5 Independent review source locations: v5 PDF pp. 96; published PDF pp. 101.

**Printed:** π_ℓ^† ≅ (π_ℓ ∘ Ad(h_0)) ⊗ (ξ_π^{-1} ∘ ν) ≅ π^∨.   (143)

**Correction or missing argument:** π_ℓ^† ≅ (π_ℓ ∘ Ad(h_0)) ⊗ (ξ_{π,ℓ}^{-1} ∘ ν) ≅ π_ℓ^∨

**Independent check:** Equation (143) concerns the local representation at ell. Both its central character and its contragredient must carry that local subscript.

## E99 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** partially corrected in the published version, p.102: omega_i replaced by w_i; the other listed slips remain.

**Source:** §6.5.4, text before (146) and (147), p. 97, in arXiv v5 Independent review source locations: v5 PDF pp. 97; published PDF pp. 102.

**Printed:** let w_i^∨, …, w_m^∨ be the dual basis of W_κ^∨. As W_{κ^D} is the twist of W_κ^∨ by a character, the ω_i^∨ also defined a basis …; Recall that we have defined a twisted Petersson norm in (4.1.6) …; ⟨·,·⟩^Ser_{κ,χ} : π ⨂ π^♭ ⊗ χ^{-1} ∘ det

**Correction or missing argument:** w_1^∨, …, w_m^∨; the w_i^∨; 'in Remark 4.1.6'; ⟨·,·⟩^Ser_{κ,χ} : π ⊗ (π^♭ ⊗ χ^{-1} ∘ det) → C.

**Independent check:** The dual basis begins with w_1^dual, the pairing needs a scalar target, and 4.1.6 is a remark, not an equation. The omega-versus-w slip is already corrected in the published text, while the other listed slips remain.

## E100 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** Lemma 6.6.1(iii), p. 98, in arXiv v5; present in v4 at p. 96 Independent review source locations: v5 PDF pp. 98; v4 PDF pp. 96; published PDF pp. 103.

**Printed:** There exists a unique isomorphism T^-_{K_r,κ,R} ⥲ T^d_{K_r,κ^D,cR} that maps r ∈ R to c(r), U^-_{w,j,κ^D} to U^-_{w,j,κ^D}, and T(g) to T(g).

**Correction or missing argument:** … maps r ∈ R to c(r), U^-_{w,j,κ} to U^-_{w,j,κ^D}, and T(g) to T(g).

**Independent check:** The domain Hecke algebra is generated by U^- with weight kappa; kappaD is the target weight. The printed source generator therefore has the wrong subscript.

## E101 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** Lemma 6.6.1(ii), p. 98, in arXiv v5; present in v4 at p. 96 Independent review source locations: v5 PDF pp. 91, 98; v4 PDF pp. 90, 96; published PDF pp. 96, 103.

**Printed:** T(g)^♭ = T(g^†) = T(ḡ).

**Correction or missing argument:** Retain T(g^dagger)=T(nu(g)^-1)T(bar(g)), and justify any further simplification by the central character or the level. Separately reconcile the weight twist defining the flat map with E97.

**Independent check:** Away from p the dagger element is nu(g)^-1 bar(g). The associated central Hecke operator is generally nontrivial: it acts through the local central character. Thus the asserted last equality drops an actual factor. A unit similitude suffices only when that central unit lies in the level (as at the good hyperspecial places under discussion); it is not a general assertion for arbitrary tame levels.

## E102 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** partially corrected in publication: constituent (d) is corrected on p.109; constituent (o) is rejected in this review.

**Source:** Combined minor notational slips, §§6.6–7.5, pp. 99–121, in arXiv v5; all present in v4 at the corresponding places Independent review source locations: v5 PDF pp. 99, 103–106, 108, 111–112, 115–117, 120; published PDF pp. 104, 108–111, 114, 116–118, 122–123, 127.

**Printed:** (a) Lemma 6.6.2 (p. 99): T^d_{K_r,ψ^{-1},ω_{κ^D},R}; (b) p. 103: ‘is a T^ord_{K^r,κ,R}-module’; (c) Lemma 6.6.12(i) (p. 103): ‘π^{♭,a-ord}_{p,r} ⊗ π^{♭,K_S}_S ≅ π^{K_S}_S’; (d) Lemma 6.6.12(ii) (p. 104): ‘π′^{,♭,ord}_{p,r}’; (e) p. 105: ‘H^{d,ord}_{κ,ψ,V}(K_r, ℝ)[π]^⊥’; (f) Definition 6.7.2 (p. 105): ‘H^{d,ord}_{κ^♭,−V}(K^♭_r,ψ^{-1},R)_π’; (g) §6.7.5 (p. 106): ‘when F^+ = Q’; (h) p. 108: ‘we write T^{a-ord}_{K^p,r} for T^{a-ord}_{K^p,κ^D,R}’; (i) §7.3.4 (p. 111): ‘lim H^{d,ord}_κ(K_r,O)_π’ and ‘tensoring over Λ_π with Λ_π/I_κ’; (j) p. 112: ‘lim H^{d,ord}_{κ^♭}(K^♭_r,O)_π’; (k) Assumption 7.4.6 (p. 115): ‘Hom_{𝕋_{r,κ·a(χ)}}’; (l) Fact 7.4.7 (p. 116): ‘lies in Im(ι^*_r)’; (m) Proposition 7.4.10 (p. 117): ‘Hom_{𝕋_{r,κ,♭}}’; (n) p. 120: ‘where of course h_π ∈ π^♭’ with h = ∑_{π′∈S(K_r,κ,π^♭)} a_{π′}h_{π′}; (o) Remark 7.1.2 (p. 108): ‘Hida’s Theorems 7.1.1 and 7.3.1’

**Correction or missing argument:** Retain corrections (a)-(h), (j)-(m). In (i) restore kappaD and use the actual level-r control ideal as in E117-E118, rather than merely changing Lambda to Lambda^o. In (n), consistently use the Section 6.6 holomorphic pi: index by S(K_r,kappa,pi), with h_pi in pi; alternatively rename the representation throughout the paragraph. Delete proposed correction (o). Note that (d) was corrected in publication.

**Independent check:** Checked each component against its defining module, ring, index or map. Confirm (a)-(n), with revised readings for (i) and (n). Reject constituent (o): Theorem 7.3.1 is explicitly an immediate consequence of 7.2.1, so crediting it to Hida is not an erroneous reference. The claim that every slip survives publication is false: (d) already reads a-ord on published p.109. The v5 K^r and blackboard-bold R slips were checked visually. In (n), Lemma 7.5.1 expressly uses Section 6.6 notation, where pi is holomorphic; the footnote in Section 7.3 warns about the main theorem, not every paragraph of Section 7.

## E103 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** Lemma 6.6.5(ii), p. 100, in arXiv v5; present in v4 at pp. 97–98 Independent review source locations: v5 PDF pp. 100; v4 PDF pp. 97–98; published PDF pp. 105.

**Printed:** let S_κ(K_r,R)[λ] be the localization of the T_{K_r,κ,R}-module S_κ(K_r,R) at the prime ideal p_λ ⊂ T_{K_r,κ,R} that is the kernel of the character λ; in other words, S_κ(K_r,R)[λ] is the λ-isotypic component of S_κ(K_r,R). Then j_π defines an isomorphism j_π: π_S^{K_S} ⊗ π_p^{I_r}[λ] ⥲ S_κ(K_r,R)[λ] ⊗_R C = S_κ(K_r,C)[λ]. Here π_p^{I_r}[λ] is the subspace of π_p^{I_r} on which each U_{w,j,κ} acts as λ(U_{w,j,κ}).

**Correction or missing argument:** Use generalized joint eigenspaces on both sides. Alternatively replace localization by the actual eigencomponent and prove the resulting statement with that definition. Restricting to the ordinary simple-eigenvalue range is another option after adding E106 hypotheses.

**Independent check:** Localization of a finite-dimensional module at an eigencharacter gives its generalized eigenspace. True eigenspaces need not agree. Independently, in normalized Ind_B^GL2(1,1), the compact-model coordinates at w, lower(p), lower(p^2),1 on Gamma_0(p^3) give U/sqrt(p) matrix [[1,(p-1)/p,0,0],[0,0,1,0],[0,0,0,1],[0,0,0,1]]. This follows by summing right translates by [[p,i],[0,1]] for i modulo p. Its zero eigenspace has dimension 1 and generalized zero space dimension 2 (exact checks at p=3,5,7). The same nilpotent old-space block persists for nonzero unramified inducing parameters; scalar weight normalization does not remove it. Thus the printed identification mixes two different spaces.

## E104 — confirmed

**Kind:** gap. **Reach:** the proof. **Existing correction:** new.

**Source:** §6.6.8, sentence before Theorem 6.6.9, p. 101, in arXiv v5; present in v4 at p. 98 Independent review source locations: v5 PDF pp. 101, 128, 130; v4 PDF pp. 98; published PDF pp. 106.

**Printed:** This space has dimension at most one and it does not depend on r, in the sense that e_κπ_p^{I_r} = e_κπ_p^{I_{r′}} for all r′ ≥ r. This is a consequence of the following: Theorem 6.6.9 …

**Correction or missing argument:** State independence for sufficiently large r as in 8.3.2-8.3.3, or prove descent of a nonzero ordinary vector to every smaller level claimed. Do not use the dual supported-section construction as a proof of ordinary descent.

**Independent check:** A nested sequence of spaces of dimension at most one need not be constant before its first nonzero term. Theorem 6.6.9 alone therefore does not give the asserted equality for every rprime>=r. Lemma 8.3.2 and Corollary 8.3.3 explicitly state eventual independence, r sufficiently large. The original correction incorrectly describes the ordinary vector as the characteristic section supported on BI_r; 8.3.2 only says its support contains BI_r (the supported section occurs on the dual side in 8.3.4).

## E105 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** Lemma 6.6.7(i), p. 101, in arXiv v5; present in v4 at p. 98 Independent review source locations: v5 PDF pp. 99, 101; v4 PDF pp. 98; published PDF pp. 104, 106.

**Printed:** (i) T^ord_{K_r,κ,R} ⥲ T^{a-ord}_{K_r,κ^D,R} and T^ord_{K_r,κ,ψ,R} ⥲ T^{a-ord}_{K_r,κ,ψ^{-1},R},

**Correction or missing argument:** T^ord_{K_r,κ,ψ,R} ⥲ T^{a-ord}_{K_r,κ^D,ψ^{-1},R}.

**Independent check:** The nebentypus version of Serre duality has target weight kappaD, just as the immediately preceding version without nebentypus and Lemma 6.6.2 do.

## E106 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** §6.6.8, Theorem 6.6.9 (Hida), p. 101 — whose proof is given in §8.3 (Lemma 8.3.2, Corollary 8.3.3, pp. 128–130) — in arXiv v5; the same mistake at Theorem 6.6.9, p. 101, in arXiv v5; present in v4 at p. 98 Independent review source locations: v5 PDF pp. 101, 126–130; v4 PDF pp. 98; published PDF pp. 106.

**Printed:** Theorem 6.6.9 (Hida). For any representation π_p of G(ℚ_p), the ordinary eigenspace e_κπ_p^{I_r} ⊂ π_p^{I_r} is of dimension ≤ 1, for any r. … The proof, an adaptation of Hida's, is given in Section 8.3 below.

**Correction or missing argument:** Require an irreducible admissible local representation, the integrality/projector hypotheses, and the regularity condition (166) used in 8.3 (or a precisely established weaker regularity condition). State the level range justified by 8.3 and E104.

**Independent check:** Any representation includes a direct sum of two ordinary representations, immediately disproving the stated bound. Even for irreducible admissible representations the weight condition matters: in the split GL2 factor with a=b=1 take kappa_sigma=1,kappa_sigma-c=0, hence kappa_norm exponents (0,1). At p=5 let the unramified normalized inducing characters have values p^-1/2 and 2p^-1/2. Their ratio is not |.|^plus-or-minus-1, so the principal series is irreducible. On its two Iwahori-fixed vectors normalized U_1 has eigenvalues 1,2 and normalized U_2 is 2; both vectors are ordinary. Here kappa_sigma+kappa_sigma-c=1<2. Section 8.3 imposes irreducibility and (166), absent from 6.6.9. The local statement must be restricted; no global weight-one realization is needed for this local counterexample.

## E107 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** Lemma 6.6.10(ii), p. 102, in arXiv v5; present in v4 at p. 99 Independent review source locations: v5 PDF pp. 102; v4 PDF pp. 99; published PDF pp. 107.

**Printed:** ⊕_{π′∈S(K_s,κ,π)} π′^{,ord}_p ⊗ (π′_S)^{K_S}.

**Correction or missing argument:** ⊕_{π′∈S(K_r,κ,π)} π′^{,ord}_p ⊗ (π′_S)^{K_S}.

**Independent check:** K_s is not the level fixed in Lemma 6.6.10; every surrounding definition uses K_r.

## E108 — confirmed

**Kind:** gap. **Reach:** the proof. **Existing correction:** new.

**Source:** Lemma 6.6.10 (hypothesis on R), p. 102, and its uses in Lemma 6.6.12 and Lemma 6.7.1, pp. 103–105, in arXiv v5; present in v4 at pp. 99–101 Independent review source locations: v5 PDF pp. 102–106; v4 PDF pp. 99–102; published PDF pp. 107–110, 112.

**Printed:** Let R ⊂ C be the localization of a finite extension of R(λ_π) at the prime determined by incl_p or the p-adic completion of such a ring. … S^ord_κ(K_r,R)_π is identified with an R-lattice in ⊕_{π′∈S(K_s,κ,π)} π′^{,ord}_p ⊗ (π′_S)^{K_S}.

**Correction or missing argument:** Work over a complete (or suitable Henselian) coefficient DVR so localization is a finite direct factor, or prove that the relevant residual idempotent already exists over the chosen noncomplete coefficient ring. Then apply the lattice argument.

**Independent check:** A finite algebra over a non-Henselian DVR can acquire a localization that is not finite over that DVR. For example Z_(5)[i] localized at one prime above 5 contains arbitrarily high inverses of a generator of the other prime. One can include an R-valued eigencharacter by taking the finite order {(a,b) in R x R[i]:a mod5=b mod(2-i)} and localizing at the common residual character. Its second factor still has this failure. This is an algebraic obstruction to the stated lattice argument, not an exhibited automorphic counterexample. The complete-coefficient setting adopted later removes this particular obstruction. Remove the blanket assurance about every later pairing until its localized module is identified.

## E109 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §6.6.8, paragraph before Lemma 6.6.12, p. 103, in arXiv v5; present in v4 at p. 100 Independent review source locations: v5 PDF pp. 95–96, 103; v4 PDF pp. 100; published PDF pp. 100, 108.

**Printed:** Let π be a holomorphic cuspidal automorphic representation of G of type (κ,K_r). Then π^♭ is anti-holomorphic of type (κ^♭,K_r).

**Correction or missing argument:** Then π^♭ is anti-holomorphic of type (κ,K_r).

**Independent check:** The definition in 6.5.1 assigns type (kappa,K_r) to the anti-holomorphic conjugate, with coefficient W_kappaD. That is also the coefficient of the next display. The kappa-flat type instead refers to switching V to -V.

## E110 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** Lemma 6.6.12(iii), p. 104 (first pairing), in arXiv v5; present in v4 at p. 100 and in v2 at p. 101 (Lemma 6.5.12(iii)) Independent review source locations: v5 PDF pp. 102–105, 120; v4 PDF pp. 100, 102; published PDF pp. 107–110, 127.

**Printed:** (iii) Normalized Serre duality induces perfect T^ord_{K_r,κ,R}-equivariant pairings (with respect to the isomorphisms of Lemma 6.6.7) S^ord_κ(K_r;R)[π] ⊗_R H^{d,ord}_{κ^D}(K_r;R)[π] → R and S^ord_κ(K_r;R)_π ⊗_R H^{d,ord}_{κ^D}(K_r;R)_π → R

**Correction or missing argument:** Retain perfectness of the localized pairing under finite direct-factor hypotheses. The saturated eigenlattice pairing is perfect after inverting p; integral perfectness requires absence of the corresponding congruence obstruction. Under the later Gorenstein/freeness hypotheses its image is the congruence ideal described there.

**Independent check:** Perfect integral duality of the whole localization does not give perfect duality of saturated eigenspace lattices. In T={(a,b) in O^2:a=b mod varpi^n}, S=T and H=Hom_O(T,O), the first eigenspace lattices are O(varpi^n,0) and O pr_1. Their pairing has image varpi^n O, although evaluation S x H is perfect. This is exactly the congruence obstruction discussed by 6.7.3 and 7.5.2, so the two printed perfectness assertions cannot be justified in the same way. The defect of perfectness is controlled by the congruence module; do not identify every higher-rank pairing image with the congruence ideal without the additional freeness hypotheses.

## E111 — rejected

**Kind:** gap. **Reach:** nothing. **Existing correction:** Not an error: rejected by REV-ERRATA-PAPER-EISCHEN-HARRIS-LI-ETAL-20.

**Source:** §6.7, definition of C(π,M), p. 105, in arXiv v5; present in v4 at p. 102 Independent review source locations: v5 PDF pp. 105, 107; v4 PDF pp. 102–103; published PDF pp. 110–113.

**Printed:** More generally, the congruence ideal C(π,M) can be defined for any T^{♭,ord}_{K^♭,κ^♭,R}-module M as the annihilator of M_{π^♭}/(M[π^♭]+M[π]^⊥), where the notation has the same meaning as above.

**Correction or missing argument:** No correction required for M=T. Optionally define the complement by the generic spectral idempotent (or its preimage when needed) to make the general module convention explicit.

**Independent check:** The paragraph immediately before Definition 6.7.2 explicitly identifies the orthogonal complement with the intersection with the other generic eigenspaces. That spectral description extends to a module without choosing a new pairing, and for M=T it is precisely ker(lambda_pi). Thus the objection that a pairing must be supplied even for the application M=T is not established. One may spell out the spectral convention and finiteness/torsion hypotheses, but the displayed extension has the indicated standard meaning in its actual use.

## E112 — confirmed

**Kind:** misprint. **Reach:** a stated result. **Existing correction:** new.

**Source:** Lemma 6.7.6, display, p. 106, in arXiv v5; absent in v4 (§6.7.5 and Lemmas 6.7.6–6.7.7 are new in v5) Independent review source locations: v5 PDF pp. 104, 106; v4 PDF pp. 101–103; published PDF pp. 110–112.

**Printed:** L[π] = (1/Vol(I_{V,r} ∩ I_{−V,r}))⟨H^{d,ord}_{κ,V}(K,ψ,R)[π], H^{d,ord}_{κ^♭,−V}(K^♭_r,ψ^{-1},R)[π^♭]⟩^Ser_κ, L_π = (1/Vol(I_{V,r} ∩ I_{−V,r}))⟨H^{d,ord}_{κ,V}(K,ψ,R)[π], H^{d,ord}_{κ^♭,−V}(K^♭_r,ψ^{-1},R)_{π^♭}⟩^Ser_κ are rank one R-submodules of C, generated by positive real numbers Q[π,χ] and Q_{π,χ}, respectively.

**Correction or missing argument:** Use L[pi,chi] and L_pi,chi, the pairing <,>_kappa,chi, and the twisted second lattice/localization. Transport weight, finite nebentypus and level consistently under pi-flat tensor chi^-1 det, as in E166. Generator identities remain up to the stated units.

**Independent check:** Lemma 6.7.6 repeats the untwisted lattices, pairing, and L labels from 6.7.1 despite its preceding definition of a twisted lattice. Insert the twisted objects; otherwise the displayed modules have no chi dependence at all. This identifies period ideals, not canonical generators, so the original claim that the generators must literally be equal was too strong. The corrected twisted spaces must also have the appropriate twisted nebentypus and level (new E166).

## E113 — confirmed

**Kind:** gap. **Reach:** the proof. **Existing correction:** new.

**Source:** §6.7.5, paragraph after Lemma 6.7.7, p. 106, in arXiv v5 (and ‘as noted above, does not actually depend on χ’, p. 107); absent in v4 Independent review source locations: v5 PDF pp. 106–107, 145; published PDF pp. 111–113, 153.

**Printed:** However, since the family of p-adic Hecke characters is smooth, it is easy to see that C(π,χ) and c(π,χ) do not depend on χ.

**Correction or missing argument:** Prove that twisting transports the relevant lattices and spectral decomposition compatibly, up to one common nonzero scalar, with the correct twisted levels. Deduce equality of ideals and equality of chosen generators only up to units unless a normalization is fixed. Otherwise state independence as an additional expectation.

**Independent check:** Smoothness of the character parameter space alone does not compare the integral coherent-cohomology lattices at different twists. A compatible Hecke-module isomorphism, or a congruence-ideal argument under Gorenstein/freeness hypotheses, is needed. Correct the original proposed repair: a common nonzero scalar multiplying both lattices does not change their congruence quotient, so the CM period need not itself be a p-adic unit for that argument. Also c(pi,chi) is only defined up to a unit; literal equality needs compatible generator choices. The final theorem retains chi in c and its ratio cancels algebraically, so this gap alone does not refute that interpolation identity.

## E114 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** Equation (153) and the preceding sentence, p. 107, in arXiv v5; present in v4 at p. 103 (6.7.1) Independent review source locations: v5 PDF pp. 107; v4 PDF pp. 103; published PDF pp. 112–113.

**Printed:** 𝕋_E = 𝕋 ⊗_R E = ⊕E_i, indexed by the maximal ideals λ_{π_i} of 𝕋, with π = π_1. … C(π,𝕋) = sup_{c_{i1}≠0} −v(c_{i1}) (153)

**Correction or missing argument:** indexed by the characters λ_{π_i} (equivalently the minimal primes ker λ_{π_i} of 𝕋, or the maximal ideals of 𝕋_E); C(π,𝕋) = ϖ^m R with m = sup_{c_{i1}≠0}(−v(c_{i1})).

**Independent check:** The localized integral algebra is local, so its generic factors cannot be indexed by different maximal ideals of that integral algebra. They are the factors of T_E. The displayed supremum is an integer exponent: projecting the lattice to E_1 gives varpi^-m times its intersection with E_1, hence quotient R/varpi^m and annihilator varpi^m R.

## E115 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** Theorem 7.1.1, p. 108, in arXiv v5; present in v4 at p. 104 Independent review source locations: v5 PDF pp. 24, 35, 101, 108, 117; v4 PDF pp. 104; published PDF pp. 105, 113, 124.

**Printed:** Theorem 7.1.1. For any pair of characters κ_1, κ_2 of T_H, there is a canonical isomorphism T^ord_{K^p,κ_1,R} ⥲ T^ord_{K^p,κ_2,R}.

**Correction or missing argument:** For any pair of sufficiently regular characters κ_1, κ_2 of T_H (in the range of Hida’s classicality theorem (32)), there is a canonical isomorphism T^ord_{K^p,κ_1,R} ⥲ T^ord_{K^p,κ_2,R}.

**Independent check:** These Hecke algebras are defined from classical cusp forms at one fixed weight. On a noncompact connected Shimura curve the weight-zero cusp space is zero: a regular function on its proper compactification is constant, and vanishing at the nonempty boundary makes it zero. In a nonzero ordinary cuspidal family the sufficiently regular weight algebra is nonzero, so unrestricted weight independence cannot hold. The cited control statement (34) explicitly restricts weights by (32). Restricting the assertion to that range is substantive, even if later applications use regular weights.

## E116 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** partially corrected in the published version, p.114: H^1 becomes H^d, but the second target still has level rprime.

**Source:** §7.1, paragraph after Remark 7.1.2, p. 108, in arXiv v5; present in v4 at p. 104 Independent review source locations: v5 PDF pp. 95, 108; v4 PDF pp. 104; published PDF pp. 100, 114.

**Printed:** As noted in (140), the trace map trace_{K_r/K_{r′}} maps H^1_{κ^D}(K_{r′};R) to H^1_{κ^D}(K_r;R) for all r′ ≥ r > 0. It follows easily from the definition of the anti-ordinary projectors e^-_{κ^D} that this trace map also maps e^-_{κ^D}H^1_{κ^D}(K_{r′};R) to e^-_{κ^D}H^1_{κ^D}(K_{r′};R)

**Correction or missing argument:** … maps H^d_{κ^D}(K_{r′};R) to H^d_{κ^D}(K_r;R) … maps e^-_{κ^D}H^d_{κ^D}(K_{r′};R) to e^-_{κ^D}H^d_{κ^D}(K_r;R).

**Independent check:** The trace in (140) is in top degree d and has target level r. The published p.114 corrects H^1 to H^d but still repeats rprime in the second target. Mark this finding partially corrected, not wholly unchanged.

## E117 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** Theorem 7.2.1(ii), p. 109, and Theorem 7.3.1(ii), p. 110, in arXiv v5; present in v4 at p. 105 (with Λ_R, Λ_π instead of Λ^o) and in v2/v3 (Theorem 7.1.3(ii)) Independent review source locations: v5 PDF pp. 35, 99, 109–111, 114, 118; v4 PDF pp. 104–105; published PDF pp. 104, 115, 117, 120, 125.

**Printed:** (ii) (Control theorem) Let I_κ ⊂ Λ^o_R be the kernel of the map Λ^o_R → R ⊂ C_p defined by the character κ. Suppose κ is sufficiently regular. Then the natural homomorphism T_{K^p,R} ⊗_{Λ^o_R} Λ^o_R/I_κ → T_{K^p_r,κ,R} is an isomorphism. [7.3.1(ii): 𝕋_π ⊗_{Λ^o_π} Λ^o_π/I_κ → 𝕋_{K^p_r,κ,O_π}]

**Correction or missing argument:** Use the specialization at the full character kappa psi for a fixed nebentypus, or tensor by the level-r quotient Lambda/I_{r,kappa} to retain all level-r nebentypes. State the torsion-component and translation conventions explicitly. Apply the same correction to the module specialization in 7.3.4.

**Independent check:** The source specialization at one pro-p character is independent of r, while the level-r algebra allows all finite nebentypus characters at that level. On a nontrivial wild psi-part a diamond t acts by kappa(t)psi(t); thus t-kappa(t) does not vanish and the stated natural map cannot factor through I_kappa. Equation (34) supplies the correctly character-specific control, and 7.4.12 uses a level-dependent ideal. Avoid the original unconditional r=1 alternative at p=2: the earlier identification of the torsion/pro-p decomposition already fails there (E32).

## E118 — confirmed

**Kind:** gap. **Reach:** the proof. **Existing correction:** new.

**Source:** §7.3.4, first two displays, p. 111, in arXiv v5; present in v4 at p. 106 Independent review source locations: v5 PDF pp. 35, 110–111, 118; v4 PDF pp. 105; published PDF pp. 115–117, 125.

**Printed:** By part (ii) of Theorem 7.3.1, tensoring over Λ_π with Λ_π/I_κ gives an isomorphism 𝕋_{K^p_r,κ,O} ⊗_O Î_π ⥲ Hom_O(S^ord_κ(K_r,O)_{m_π},O) = H^{d,ord}_{κ^D}(K_r,O)_π.

**Correction or missing argument:** Invoke and verify dual module control from (33)-(34), using the same level-dependent quotient or full nebentypus specialization on both T and the module of forms. Impose its regularity hypotheses before deducing the finite-level free-module isomorphism.

**Independent check:** Specializing an isomorphism T tensor Ihat=M gives (T/I) tensor Ihat=M/IM. Control of T/I does not identify M/IM with the finite-level dual of cusp forms. That further statement is module control, available in (33)-(34) for regular weights, with the level-r/nebentypus ideal of E117. The original proposed correction still used I_kappa for arbitrary level r, so it was incomplete.

## E119 — confirmed

**Kind:** gap. **Reach:** the proof. **Existing correction:** new.

**Source:** Proposition 7.3.5 and the sentence before it, pp. 111–112, in arXiv v5; v4 p. 106 (‘a simple rephrasing of the preceding discussion’) Independent review source locations: v5 PDF pp. 109–112, 117; published PDF pp. 115–118, 124.

**Printed:** In view of the comment following Hypothesis 7.3.3, the following consequence of Hypotheses 7.3.2 and 7.3.3 follows from the preceding discussion and Theorem 7.1.1. Proposition 7.3.5. (Minimality Hypothesis) For every pair (κ^1, r^1), there is an isomorphism of 𝕋_{K^p_{r^1},κ^1,O,π}-modules …

**Correction or missing argument:** The derivation (specializing 𝕋_π ⊗ Î_π ≅ Hom_O(lim_r S^ord_κ(K_r,O)_{m_π},O) via the control theorem) gives the finite-level isomorphism only for κ^1 sufficiently regular, and needs the control theorem for the module of forms (Hida’s (33)) in its level-r/nebentypus form, not just Theorem 7.3.1(ii) for the Hecke algebra. The statement should read ‘for every pair (κ^1,r^1) with κ^1 sufficiently regular’.

**Independent check:** The derivation of 7.3.5 uses regular-weight control and does not establish its assertion for every weight. Neither weight independence of Hecke algebras nor the fixed-weight free-module isomorphism supplies control of nonregular classical forms. Restrict to the justified range and the corrected module control of E118. This is an uncovered part of the proof, not an independently constructed counterexample to this proposition.

## E120 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** Proposition 7.3.5, second diagram, p. 112, in arXiv v5; present in v4 at p. 107 Independent review source locations: v5 PDF pp. 112; published PDF pp. 118.

**Printed:** Moreover, the specialization of this isomorphism at the O-valued point λ_π (tensoring both sides over 𝕋_{K^p_{r^1},κ^1,O,π} with 𝕋_{K^p_{r^1},κ^1,O,π}/ker(λ_π) ≃ O) … Hom_O(S^ord_{κ^1}(K^p_{r^1},O)_{m_π},O) ⊗_{𝕋_{K^p_r,κ^1,O,π}} 𝕋_{K^p_{r^1},κ,O,π}/ker(λ_π)

**Correction or missing argument:** Restrict this specialization to kappa1=kappa and levels for which lambda_pi factors through the finite-level algebra. Tensor over T_{K_{r1},kappa,O,pi} with its lambda_pi quotient in every occurrence.

**Independent check:** The point lambda_pi is a character at the weight of pi and at a level admitting pi. It cannot be used in the displayed specialization for an arbitrary kappa1; the tensor subscripts also mix r and r1. State the specialization at kappa1=kappa and sufficiently large r1, then use that same algebra in both tensor factors.

## E121 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** Lemma 7.4.2(1), p. 114, in arXiv v5; present in v4 at p. 108; absent in v2/v3 (Lemma 7.2.2(i), p. 108) Independent review source locations: v5 PDF pp. 34, 113–114; published PDF pp. 119–120.

**Printed:** 1. 𝒱-valued measures φ on T satisfying φ(t·f) = ρ^υ(t)·φ(f), f ∈ C(T,O), t ∈ T;

**Correction or missing argument:** For the stated right-translation convention use phi(t f)=rho^upsilon(t)^-1 (t phi(f)); transport the inverse if a left-translation convention is chosen. Keep the output Lambda-action explicit. Do not simply restore the older formula while keeping the newer equivalence unchanged.

**Independent check:** With right translation (t f)(x)=f(xt), one has t(f rho^upsilon)=rho^upsilon(t)(t f)rho^upsilon. Lambda-linearity of the maps in (2) and the stated formula for the equivalence therefore require phi(t f)=rho^upsilon(t)^-1 t phi(f). The printed formula has no action on the output at all. For infinite-order rho it annihilates every locally constant f by choosing t in its stabilizer with rho^upsilon(t)!=1; on a torsion-free separated coefficient module the measure then vanishes. The correction follows directly from the displayed equivalence, independently of any assertion about existence of a nonzero particular automorphic measure.

## E122 — confirmed

**Kind:** gap. **Reach:** the proof. **Existing correction:** new.

**Source:** Proposition 7.4.10, ‘Moreover’ part and proof, p. 117, in arXiv v5; present in v4 at p. 112 Independent review source locations: v5 PDF pp. 110–112, 115, 117; published PDF pp. 116–118, 121, 123–124.

**Printed:** Moreover, if κ^1 is a second sufficiently regular character, then L(φ_κ) and L(φ_{κ^1}) are identified with respect to the identifications 𝕋 ⥲ 𝕋_{K^p,κ,O_π} ⥲ 𝕋_{K^p,κ^1,O_π} of Theorem 7.1.1 (after localization at π). … PROOF. This is a consequence of Lemma 7.4.9 and follows by unwinding the definitions.

**Correction or missing argument:** Use module control in the regular range to identify all weight realizations with specializations of a single Lambda-adic module, choose its free-module trivialization once, and use the already fixed big Gorenstein isomorphism. Then verify the measure maps specialize compatibly; the equality follows from that common construction.

**Independent check:** Lemma 7.4.9 only compares levels at fixed weight. The construction also depends on free-module trivializations. Hypothesis 7.3.2 does explicitly choose a single big Gorenstein isomorphism and its finite-level specializations, so the report should not claim that this compatibility is wholly absent. The missing part is the comparison of the modules/trivializations at different weights and of the corresponding measure specializations. Theorem 7.1.1 only identifies Hecke algebras, while 7.3.5 displays compatibility in level. Supply module control across weights and make every choice specialize from a single big module.

## E123 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** corrected in the published version, Section 7.4.8, p.123: the undefined Phi_X clause is deleted.

**Source:** §7.4.8, sentence before Proposition 7.4.10, p. 117, in arXiv v5; introduced in v4 (p. 112) Independent review source locations: v5 PDF pp. 117; published PDF pp. 123.

**Printed:** with appropriate modifications to accomodate a function Φ_X as above.

**Correction or missing argument:** Delete the dangling clause, as in the published version.

**Independent check:** The v5 clause refers to an undefined Phi_X. The published paragraph on p.123 omits the clause and ends the displayed isomorphism before continuing with Proposition 7.3.5. Thus the recorded publication correction is verified.

## E124 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §7.5, paragraph after (162), p. 120, in arXiv v5; present in v4 at p. 114 (‘Corollary 6.7.6’) Independent review source locations: v5 PDF pp. 107, 120; v4 PDF pp. 103; published PDF pp. 112, 127.

**Printed:** The denominator of a_π is bounded by the congruence ideal C(π) = C(π^♭). In what follows we are making use of Corollary 6.7.10.

**Correction or missing argument:** … making use of Lemma 6.7.10 (C_V(π) = C(π,𝕋) = C_{−V}(π^♭)).

**Independent check:** The result numbered 6.7.10 is a lemma, not a corollary; it is the Gorenstein congruence-ideal comparison invoked here.

## E125 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** Lemma 7.5.3, p. 121, in arXiv v5; present in v4 at p. 115; v2 (Lemma 7.3.3) had no volume factor Independent review source locations: v5 PDF pp. 87, 94, 120–121, 143; published PDF pp. 91, 99, 127.

**Printed:** L_φ(h) = (1/(Vol(I^0_{r,V})Vol(I^0_{r,−V}))) ∫_{G(Q)Z_G(R)\G(A)} [h(g),φ(g)]||ν(g)^{−a(κ)}||dg.

**Correction or missing argument:** Use one factor Vol(I^0_{r,V})^-1 for the single-group pairing, with the central-character convention corrected as in E97. In a doubled pairing use one such factor for each group and check its quotient measures separately.

**Independent check:** By definition L_phi(h)=<h,phi>_{kappa,K_r}, and (136)-(137) insert exactly one inverse volume into its Serre integral. Lemma 7.5.3 inserts two on the same single-group domain. No volume appears in the cohomology identification (114). One inverse volume per factor yields the displayed product when a pairing is genuinely doubled, but this observation does not verify the other normalization steps in Section 9. Also the central norm sign must be reconciled with E97.

## E126 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §8.1, Corollary 8.1.2 (p. 122), proof of Proposition 8.1.3 item (1) (p. 123), proof of Corollary 8.2.4 (p. 126), in arXiv v5; Corollary 8.1.2 and Proposition 8.1.3 present in v4 at p. 117; the Corollary 8.2.4 proof is new in v5 Independent review source locations: v5 PDF pp. 122–123, 126; v4 PDF pp. 117; published PDF pp. 129–130, 133.

**Printed:** Cor. 8.1.2: 'there are differential operators θ(κ, λ) : V_χ(G_4, K^p, 𝒪) → V(G_4, K^p, 𝒪)'; Prop. 8.1.3 proof: '(1) For κ† < κ, e_κ ∘ res_3θ(κ, κ′) ∘ θ^hol(κ†, χ)(F) = 0'; Cor. 8.2.4 proof: 'with e_κ ∘ ∘ D^hol(κ, χ)'; Cor. 8.2.4: 'on values in V(K^p_3, R)'

**Correction or missing argument:** Use theta(kappa,kappa-dagger) throughout, give it a domain containing the intermediate theta-hol image (or the appropriate ambient V), remove the duplicated composition sign, and write "with values in".

**Independent check:** The summation index is kappa-dagger throughout the identity; lambda and kappa-prime are stray names. The composition also requires the intermediate operator to act on the output of theta-hol, not merely on the original V_chi. The repeated composition sign and "on values" are typographical.

## E127 — confirmed

**Kind:** gap. **Reach:** the proof. **Existing correction:** new.

**Source:** §8.1, Corollary 8.1.2, p. 122, in arXiv v5; present in v4 at p. 117 Independent review source locations: v5 PDF pp. 122–123; v4 PDF pp. 117; published PDF pp. 129–130; efmv18 PDF pp. 25–26, 32–34.

**Printed:** The following corollary is the p-adic version of the last part of Corollary 4.4.9. Corollary 8.1.2. Under the hypotheses of the previous proposition, for all κ† ≤ κ there are differential operators … such that θ(κ, χ) = Σ_{κ†≤κ} res_3 ∘ θ(κ, κ†) ∘ θ^hol(κ†, χ).

**Correction or missing argument:** Establish the required polynomial identity after repairing the representation-theoretic input E66. Then prove that its p-adic realizations compose and restrict as required for these specific weights/operators, including any pure-weight projections; apply the commuting Serre-Tate operators only after those hypotheses have been checked.

**Independent check:** The identity is asserted as a p-adic version without establishing transfer of the underlying polynomial identity or compatibility with restriction. EFMV arXiv:1511.06771 Lemma 5.2.2 (p.26) gives commuting Serre-Tate differential operators and hence polynomial functional calculus. But Proposition 6.2.4 and Remark 6.2.5 (pp.32-33) restrict commutation with pullback to pure weights and exhibit failure for a nonpure determinant operator. Thus arbitrary restriction compatibility cannot be assumed. The earlier highest-weight generation issue E66 also remains. Remove the original assurance that the missing proof is routine and the result surely correct; this review establishes a proof obligation, not falsity of the particular identity.

## E128 — confirmed

**Kind:** gap. **Reach:** the proof. **Existing correction:** new.

**Source:** §8.1, proof of Proposition 8.1.3, p. 123, last sentence ('Part (1) above now follows from …') and the proof of Lemma 8.1.4, in arXiv v5; present in v4 at p. 117 Independent review source locations: v5 PDF pp. 123; v4 PDF pp. 117; published PDF pp. 130.

**Printed:** The condition κ† < κ is equivalent to the condition that the p-adic valuation of ∏_{w,j} κ′^{,−1}·κ^{†,′}(t_{w,j}) is positive. … Part (1) above now follows from the fact that the ordinary projector commutes with the differential operators.

**Correction or missing argument:** In the scalar contraction argument require v_p(y)<0, with kappa-prime interpreted through (30). Supply the actual Hecke/differential intertwining identity, including its weight-dependent scalar and restriction map, and prove that the resulting scalar is contracting on every strict lower-weight summand. Do not assert unqualified commutation.

**Independent check:** The contraction argument has a definite sign error: if v_p(y)=e>0 then |y|_p=p^-e has p-adic norm p^e>1, whereas the argument needs norm less than one. The normalization is (30), not the unrelated central twist in 2.6.11. Moreover unnormalized Hecke operators need not commute with differentials (U_p theta=p theta U_p in the elliptic q-expansion model). The specific normalized intertwining scalar and compatibility with restriction must be computed. The original proposed exact commutation formula was not proved and is not retained as a verified repair.

## E129 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §8.2, p. 124, display after 'Like in Section 4.4.7' (definition of s̃), in arXiv v5; present in v4 at p. 84 (and in v4 also at p. 63) Independent review source locations: v5 PDF pp. 72, 124; v4 PDF pp. 63, 84; published PDF pp. 131.

**Printed:** r̃_{i,σ} = r_{i,σ} − r_{i+1,σ}, i = 1, …, a_σ; s̃_{j,σ} = r_{j,σ} − r_{j+1,σ}, j = 1, …, b_σ.

**Correction or missing argument:** s̃_{j,σ} = s_{j,σ} − s_{j+1,σ}, j = 1, …, b_σ.

**Independent check:** The preceding sentence defines the s sequence, so its successive differences must use s_j-s_(j+1). The r sequence can even have too few entries. The Section 4.4 occurrence was corrected in v5, but this Section 8 occurrence persists in print.

## E130 — confirmed

**Kind:** gap. **Reach:** the proof. **Existing correction:** new.

**Source:** §8.2, Theorem 8.2.2, p. 125 (and the identification of sections on p. 124), in arXiv v5; present in v4 as Theorem 5.4.1 at pp. 84–85 (without the Y^class_H qualifier) Independent review source locations: v5 PDF pp. 49, 124–125; v4 PDF pp. 84–85; published PDF pp. 131–132; efmv18 PDF pp. 35–37; eis14-published PDF pp. 26; eis15 PDF pp. 20–21, 24–26.

**Printed:** From the p-adic q-expansion principle and the description of the q-expansion coefficients given in [Eis14, Section 3], we obtain the following theorem (similar to [EFMV18, Theorem 7.2.3]). Theorem 8.2.2 (The Eisenstein Measure). … There is a measure Eis_{a,b} … that satisfies ∫ χ̃ψ·ρ^υ Eis_{a,b} = θ^{(κ,a,b)}(G_{k,ν,χ_unitary,ψ}) whenever (χ, c = ψ·ρ^υ) ∈ Y^class_H.

**Correction or missing argument:** Repair and match the Section 4.3 Schwartz data to the Fourier-coefficient construction, check its Kummer congruences and normalization, and then apply the arbitrary-signature EFMV measure theorem with the actual differential operator and pullback. Do not describe arbitrary signature or the order of restriction as missing from EFMV.

**Independent check:** Narrow the finding to matching the actual local data and normalization. EFMV Theorem 7.2.4 (arXiv pp.36-37) explicitly constructs measures for arbitrary signature and applies res after Theta. Both contrary objections in the original reason are rejected. EHLS changes the p-adic Schwartz data and then identifies the resulting Eisenstein series with G without checking the corresponding Fourier coefficients; E52 supplies a concrete coordinate mismatch in that data. Eis14 equation (32), also checked in the published article p.2456/PDF26, is differential covariance, not a verification of this modified local section. A measure theorem for the precise modified data still needs the coefficient/Kummer and normalization comparison.

## E131 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §8.3, p. 126, definition of the modulus character δ_w, in arXiv v5; present in v4 at p. 118 Independent review source locations: v5 PDF pp. 126, 129; v4 PDF pp. 118, 120–121; published PDF pp. 133, 136.

**Printed:** δ_w(t) = |t_1^{n−1} ⋯ t_{a_w}^{b_w−a_w} t_{a_w+1}^{1−n} ⋯ t_n^{b_w−1−a_w}|_p.

**Correction or missing argument:** δ_w(t) = |t_1^{n−1} ⋯ t_{a_w}^{b_w−a_w+1} t_{a_w+1}^{1−n} ⋯ t_n^{b_w−1−a_w}|_p, i.e. exponent n+1−2i for i ≤ a_w and 2i−n−2a_w−1 for i > a_w.

**Independent check:** Direct root count in the order (1,...,a,n,...,a+1) gives exponents n+1-2i for i<=a and 2i-n-2a-1 for i>a. The exponent at a is b-a+1, and the sum is zero. The printed exponent fails already for the upper Borel of GL2. This is a typographical formula error; its contribution to the regularity calculation is repaired in E134.

## E132 — confirmed

**Kind:** gap. **Reach:** the proof. **Existing correction:** new.

**Source:** §8.2, proof of Corollary 8.2.4, p. 126, in arXiv v5 (the proof is new in v5; v4 Corollary 5.4.3, p. 85, has no proof) Independent review source locations: v5 PDF pp. 84–85, 124–126; v4 PDF pp. 85; published PDF pp. 131–133; eis15 PDF pp. 24–26.

**Printed:** Proof. We need to compare the expression in Theorem 8.2.2 with the specifications required in Definition 5.3.2. Bearing in mind the translation mentioned in Remark 8.2.1, this comes down to comparing the action of e_κ ∘ res_3θ^{(κ,a,b)} with e_κ ∘ ∘D^hol(κ, χ). But this follows from Proposition 8.1.3.

**Correction or missing argument:** After E130, compute the normalization ratio between G and the Section 4 Eisenstein series, including all local and archimedean factors, verify the last bullet of Definition 5.3.2 and its shift (109), and establish the claimed coefficient ring. The current review does not supply that missing global comparison.

**Independent check:** Proposition 8.1.3 addresses the differential part only. The passage between the local sections chosen in Definition 5.3.2 and G requires E130, and the scalar and shift remain to be checked. Eis15 Proposition 13 and the following normalization (arXiv pp.24-26) include archimedean constants, discriminants and inverse p-depleted L-factors; G=D^-1 E. They cannot simply be equated to EHLS (108) without tracking parameters and cancellations. E82 further prevents an automatic claim of integral inverses. Remove the assurance that the complete correction is standard bookkeeping.

## E133 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** partially corrected in publication, p.139: the final projector is e_w^-; the index slips remain.

**Source:** §8.3.1 p. 127 and §8.3.5 pp. 131–132 (projectors and index sets), in arXiv v5; present in v4 Independent review source locations: v5 PDF pp. 127, 131–132; v4 PDF pp. 118, 122–123; published PDF pp. 134, 138–139.

**Printed:** p. 127: 'e = lim_{m→∞}(∏_{w∈Σ_p}∏_{i=1}^n u_{w,j})^{m!}' and 'π_p^{I_r} = ⊗_{w∈Σ}π_w^{I_{w,r}}'; p. 131–132: 'e^− = lim_{m→∞}(∏_{w∈Σ_p}∏_{i=1}^n u^−_{w,j})^{m!}', 'e^−_w = … defines a projector on π_w^{I_r}', 'there existing 0 ≠ φ_w ∈ π_w^{I_{w,r}} ≠ 0 such that e_w·φ_w = φ_w; we call such a φ_w an anti-ordinary vector'

**Correction or missing argument:** ∏_{j=1}^n (product index j); ⊗_{w∈Σ_p}; projector on π_w^{I_{w,r}}; e^−_w·φ_w = φ_w.

**Independent check:** The product variable must be j; the tensor factors are indexed by p-adic places, and each local invariant space uses I_(w,r). The final projector is anti-ordinary. The published text p.139 already corrects that last e_w to e_w^-; the other slips remain.

## E134 — confirmed

**Kind:** misprint. **Reach:** the proof. **Existing correction:** partially corrected in publication, p.136: Weil becomes Weyl; the character, sign, exponent and index errors remain.

**Source:** §8.3.1, proof of Lemma 8.3.2, p. 129 (display 'β_x/β^x(t) = …', the definition of θ, the formula for θ(diag), the chain of inequalities, and the definition of m_i), in arXiv v5; present in v4 at p. 120 Independent review source locations: v5 PDF pp. 126, 129–130; v4 PDF pp. 118, 120–121; published PDF pp. 133, 136–137.

**Printed:** β_x/β^x(t) = |κ_norm(xtx^{−1}t^{−1})|_p^{−1} δ_w(xtx^{−1}t^{−1})^{−1/2} … That is, the character θ = |κ_norm|_p δ_w^{−1/2} satisfies θ^x = θ. … m_i = … −Σ_{σ,𝔭_σ=𝔭_w}(κ_{σc,i} − a_w) (i > a_w) … θ(diag(t_1, ..., t_n)) = |t_1^{m_1+(n−1)/2} ⋯ t_{a_w}^{m_{a_w}+(b_w−a_w)/2} t_{a_w+1}^{m_{a_w+1}+(1−n)/2} ⋯ t_n^{m_n+(a_w−2−b_w)/2}|_p^{−1}. … m_1 + (n−1)/2 > ⋯ > m_{a_w} + (b_w−a_w)/2 > m_n + (b_w−2−a_w)/2 > ⋯ > m_{a_w+1} + (1−n)/2.

**Correction or missing argument:** β_x(t)/β^x(t) = |κ_norm(xtx^{−1}t^{−1})|_p δ_w(xtx^{−1}t^{−1})^{1/2}; the invariant character is θ = |κ_norm|_p δ_w^{1/2} (equivalently its inverse |κ_norm|_p^{−1}δ_w^{−1/2}, which is what the θ(diag) display computes); m_i = −Σ_{σ,𝔭_σ=𝔭_w}(κ_{σc,i−a_w} − a_w) for i > a_w; θ(diag(t)) = ∏_i |t_i|_p^{m_i + e_i/2} with e_i = n+1−2i (i ≤ a_w), 2i−n−2a_w−1 (i > a_w), so the t_{a_w}-exponent is m_{a_w} + (b_w−a_w+1)/2 and the t_n-exponent m_n + (b_w−a_w−1)/2; the chain reads m_1 + (n−1)/2 > ⋯ > m_{a_w} + (b_w−a_w+1)/2 > m_n + (b_w−a_w−1)/2 > ⋯ > m_{a_w+1} + (1−n)/2. Also 'Weil group' should be 'Weyl group'.

**Independent check:** Canceling alpha in beta_x/beta^x gives |kappa_norm(xtx^-1t^-1)|_p delta(xtx^-1t^-1)^(1/2), the inverse of the printed ratio. Its invariant character is |kappa_norm|_p delta^(1/2), or the inverse of that whole character, not a mixed sign. Combine the root exponents of E131 with m_i=-sum(kappa_(sigma-c,i-a)-a) in the second block. The resulting exponents m_i+e_i/2 strictly decrease in the Borel order (1,...,a,n,...,a+1); the middle comparison is m_a>=m_n, supplied by (166). Only the affected boundary constants should be described as shifted; the original blanket description of all constants is inaccurate. Publication corrects Weil to Weyl but not these formulas.

## E135 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §8.3.1, proof of Lemma 8.3.2, p. 130, lines 3–4 after (169), in arXiv v5; present in v4 at p. 121 Independent review source locations: v5 PDF pp. 130; v4 PDF pp. 121; published PDF pp. 137.

**Printed:** those characters α^xδ^{−1/2}, x ∈ W, that appear in V_B via (169); the eigenvalue of u_j = |κ_norm(t_j)|_p^{−1}U_j on the eigenspace corresponding to α^xδ^{1/2} is β_x(t_j).

**Correction or missing argument:** those characters α^xδ_w^{1/2}, x ∈ W, that appear in V_{B_w} via (169)

**Independent check:** The Jacquet decomposition (169) has alpha^x delta^(1/2), and the eigenvalue calculation in the same sentence uses that positive exponent. The first negative exponent is a copy slip.

## E136 — confirmed

**Kind:** misprint. **Reach:** the proof. **Existing correction:** new.

**Source:** §8.3.5, pp. 131–132, normalisation of the anti-ordinary Hecke operators, in arXiv v5; present in v4 at p. 122 Independent review source locations: v5 PDF pp. 98, 101, 127, 131–133; v4 PDF pp. 122–123; published PDF pp. 138–140.

**Printed:** p. 131: 'the Hecke operators u^−_{w,j} = |κ_norm(t_{w,j})|_p U^−_{w,j}'; p. 132: 'the Hecke operator u^{GL,−}_{w,j} = |κ_norm(t_{w,j})|_p^{−1} U^{GL,−}_{w,j}'

**Correction or missing argument:** In Section 8.3.5 use u^-_(w,j)=|kappa_norm(t_(w,j))|_p^-1 U^-_(w,j), consistently with the immediately following local definition and (170)-(171). Explicitly reconcile this kappa with the Serre-dual weight used in Section 6.6.

**Independent check:** The global and local definitions assign opposite powers of the same scalar to the same double-coset operator; the similitude component is trivial here. For the invariant pairing, the adjoint of [ItI] is [It^-1 I], so (170)-(171) require the same scalar on the two adjoint operators. The local inverse-power convention supplies it. This is a convention inconsistency within Section 8; transporting it back to the Serre-dual weight in Section 6 requires that weight conversion, not a blanket change of all anti-ordinary operators.

## E137 — confirmed

**Kind:** misprint. **Reach:** a stated result. **Existing correction:** new.

**Source:** §8.3.5, Lemma 8.3.6(ii), p. 132 (statement), in arXiv v5; present in v4 (Lemma 8.2.6(ii)) at p. 123 Independent review source locations: v5 PDF pp. 132–133; v4 PDF pp. 123–124; published PDF pp. 139–140.

**Printed:** it is characterized by ⟨φ^{a-ord}_{w,r}, φ^{∨,ord}_w⟩_w ≠ 0 and ⟨φ^{a-ord}_{w,r}, φ⟩_w = 0 for all φ ∈ π_w^{I_{w,r}} belonging to a generalized eigenspace of some u^{GL,−}_{w,j} with non-unit eigenvalue.

**Correction or missing argument:** … for all φ ∈ π_w^{∨,I_{w,r}} belonging to a generalized eigenspace of some u^GL_{w,j} with non-unit eigenvalue.

**Independent check:** The second slot of the invariant pairing is in pi_w dual. The proof decomposes that dual space into generalized eigenspaces for the ordinary u^GL, so both the missing dual and the extra minus sign in the statement must be corrected.

## E138 — confirmed

**Kind:** gap. **Reach:** the proof. **Existing correction:** new.

**Source:** §8.3.5, proof of Lemma 8.3.6(i), pp. 132–133 (induction on j after (170), and 'as in the preceding proof' after (171)), in arXiv v5; present in v4 at p. 123 Independent review source locations: v5 PDF pp. 132–133; v4 PDF pp. 123–124; published PDF pp. 139–140.

**Printed:** Let V_{j−1} ⊂ π_w^{∨,I_{w,r}} be a maximal subspace that is a simultaneous eigenspace for u^GL_{w,1}, …, u^GL_{w,j−1} with respective eigenvalues a(1, r), …, a(j−1, r). Then by the commutativity of the u^GL_{w,j}s, the identity (170) holds for all φ ∈ V_{j−1}. In particular, there is a non-zero (maximal) subspace of V_j ⊂ V_{j−1} which is an eigenspace for u^GL_{w,j} with eigenvalue a(j, r).

**Correction or missing argument:** Work with joint generalised eigenspaces: ℓ = ⟨φ^{a-ord}_{w,r}, ·⟩_w satisfies ℓ∘(u^GL_{w,i} − a(i,r)) = 0, hence vanishes on every generalised u^GL_{w,i}-eigenspace for eigenvalues ≠ a(i,r); so ℓ ≠ 0 on the joint generalised eigenspace W_{j−1} for (a(1,r), …, a(j−1,r)); u^GL_{w,j} preserves W_{j−1} and u^GL_{w,j} − a(j,r) is not surjective there, so W_j ≠ 0; finally commuting operators on W_n have a common eigenvector.

**Independent check:** A nonzero eigenfunctional need not remain nonzero on a true eigenspace: for the Jordan matrix [[a,1],[0,a]], ell(x,y)=y is an eigenfunctional and vanishes on ker(U-a). Hence the displayed induction does not follow merely by restricting (170). The stated conclusion does follow from the joint generalized eigenspace argument: the functional vanishes on every other joint character, the required joint generalized space is nonzero, and commuting operators on it have a common eigenvector.

## E139 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §8.3.5 Remark 8.3.10 (p. 134) and §8.4.4 Remark 8.4.8 (p. 137), cross-references, in arXiv v5; present in v4 (Remarks 8.2.10, 8.3.8, citing 'Lemma 8.3.2') at pp. 125, 127 Independent review source locations: v5 PDF pp. 134, 137; v4 PDF pp. 125, 127; published PDF pp. 141, 144.

**Printed:** Remark 8.3.10: 'The description of the anti-ordinary vector φ^{a-ord}_{w,r} ∈ π_w provided by Lemma 8.4.2 shows …'; Remark 8.4.8: 'The description of the anti-ordinary vector φ^{♭,a-ord}_{w,r} ∈ π^♭_w provided by Lemma 8.4.2 shows … In particular, φ^{♭,a-ord}_{w,r} ∈ π_w is also a suitable test vector'

**Correction or missing argument:** Remark 8.3.10: 'provided by Lemma 8.3.7'; Remark 8.4.8: 'provided by Lemma 8.4.5' and '∈ π^♭_w'.

**Independent check:** The referenced lemma concerns ordinary G2 vectors, whereas these remarks require the anti-ordinary G1 and G2 constructions, respectively. The final G2 vector belongs to pi_w-flat. The old numbering in v4 has the same wrong target.

## E140 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §8.3.5 Corollary 8.3.8 (p. 134), Lemma 8.3.4 proof (p. 131), (167) (p. 128), in arXiv v5; present in v4 Independent review source locations: v5 PDF pp. 128, 131, 134; v4 PDF pp. 120, 122, 124; published PDF pp. 135, 138, 141.

**Printed:** Cor. 8.3.8: 'anti-ordinary vector φ^{a-ord}_r ∈ π_p^{I_{w,r}}'; Lemma 8.3.4 proof: 'c(π_w, r) := … = ∫_{I^0_w} dk = vol(I^0_r)'; (167): 'V^N_inv ≅ V_{B_v}'

**Correction or missing argument:** Use pi_p^(I_r), integral over I^0_(w,r) with volume Vol(I^0_(w,r)), and V_(B_w).

**Independent check:** The tensor-product p-component is fixed by I_r; a single w uses I_(w,r). The integration subgroup carries both w and r, and the Jacquet module here is for B_w. These are consistent index repairs.

## E141 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §8.3.11, (173), p. 134, in arXiv v5; present in v4 at p. 125 Independent review source locations: v5 PDF pp. 134–135; v4 PDF pp. 125; published PDF pp. 141–142.

**Printed:** for some character β_w : T → ℂ^×. We view β_w as n-tuple β_w = (β_{w,1}, ...., β_{w,n}) … H_w(T) = ∏_{i=1}^n (1 − α_{w,i}(ϖ_w)T)(1 − α_{w,i}^{−1}(ϖ_w)T)

**Correction or missing argument:** β_w : T_w → ℂ^×; H_w(T) = ∏_{i=1}^n (1 − β_{w,i}(ϖ_w)T)(1 − β_{w,i}^{−1}(ϖ_w)T).

**Independent check:** The section introduces the tuple beta_(w,i), unique up to permutation, immediately before forming the polynomial with an undefined alpha tuple. Use beta and the local torus T_w.

## E142 — confirmed

**Kind:** misprint. **Reach:** a stated result. **Existing correction:** new.

**Source:** §8.3.11, Proposition 8.3.12, p. 135, in arXiv v5; present in v4 (Proposition 8.2.12) at p. 125 Independent review source locations: v5 PDF pp. 75, 134–135; v4 PDF pp. 125; published PDF pp. 142.

**Printed:** Then Newt(π_w) and Hodge(π_w) meet at the midpoint (n, Σ_{σ∈Σ_w} p_{i,σ}).

**Correction or missing argument:** Write Newt(pi,w), Hodge(pi,w) and midpoint ordinate sum_(sigma in Sigma_w) sum_(j=1)^n h_(j,sigma), where h_(1,sigma)<=... are the correctly sorted Hodge slopes from (106), using cumulative vertices as in E69. Supply the comparison in E143.

**Independent check:** The index i at a point with abscissa n is unbound. Merely replacing i by n would preserve the erroneous Hodge-polygon definition E69. The standard ordinate is the cumulative sum of the n smallest sorted Hodge slopes, summed over the indicated embeddings. This repairs the notation and definition; it does not prove the asserted meeting with the Newton polygon.

## E143 — confirmed

**Kind:** gap. **Reach:** the proof. **Existing correction:** new.

**Source:** §8.3.11, Proposition 8.3.12, p. 135, in arXiv v5; present in v4 at p. 125 Independent review source locations: v5 PDF pp. 135; v4 PDF pp. 125; published PDF pp. 142.

**Printed:** The proof is an elementary calculation and is omitted; it will not be used in what follows. Details will be provided in a future article

**Correction or missing argument:** After repairing the Hodge polygon and the parameter names, compute the valuations of the ordinary inducing parameters using Lemma 8.3.2, compare them with the cumulative Hodge slopes of (106), and state the precise normalizations and hypotheses under which the midpoint equality holds.

**Independent check:** The text expressly omits the comparison and defers details; neither a computation with the normalizations of (106)/(173) nor an exact reference is supplied. The unbound midpoint and incorrect Hodge ordinate in E69/E142 mean that one cannot verify the assertion by reading the displayed formula literally. Record the missing comparison as a proof gap, not a demonstrated false proposition. It is explicitly unused in subsequent arguments.

## E144 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §8.4.1 (p. 135), §8.4.4 (p. 136), definitions of U^{♭,GL}_{w,j} and U^{♭,GL,−}_{w,j}, in arXiv v5; present in v4 at pp. 126–127 Independent review source locations: v5 PDF pp. 135–136; v4 PDF pp. 126–127; published PDF pp. 143–144.

**Printed:** U^{♭,GL}_{w,j} = ᵗI_{w,j} t_{w,j}^{−1} ᵗI_{w,j}; U^{♭,GL,−}_{w,j} = ᵗI_{w,j} t_{w,j} ᵗI_{w,j}

**Correction or missing argument:** ᵗI_{w,r} t_{w,j}^{−1} ᵗI_{w,r}; ᵗI_{w,r} t_{w,j} ᵗI_{w,r}.

**Independent check:** j labels the cocharacter while r labels the level subgroup. Both transposed double cosets must have subgroup I_(w,r).

## E145 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §8.4.4, Lemma 8.4.5, statement (last sentence) and proof, pp. 136–137, in arXiv v5; present in v4 (Lemma 8.3.5, 'Lemma 8.2.7(ii)') at p. 127 Independent review source locations: v5 PDF pp. 133, 136–137; v4 PDF pp. 124, 127; published PDF pp. 140, 144.

**Printed:** Furthermore, if β_w is as in Lemma 8.3.7(ii), then β^♭_w = β_w^{−1}. … it is identified (up to non-zero scalar multiple) with the image under the Ind^{G_w}_{B^op_w} α_w^{−1} → Ind^{G_w}_{B_w} α_w^{−1} of the function φ′_r ∈ Ind^{G_w}_{B^op_w} α_w^{−1}

**Correction or missing argument:** Refer to Lemma 8.3.7 without (ii), and use beta_w-flat=beta_w^-1 in all three induced representations in the proof, avoiding the ambiguous recycled alpha.

**Independent check:** Lemma 8.3.7 has no part (ii). The proof transports the inducing character beta_w under inverse transpose, so the unambiguous character on the G2 induced modules is beta_w^-1=beta_w-flat. If alpha is inherited from the proof of 8.3.7 it equals beta_w^-1, and alpha^-1 is wrong; a newly redefined alpha could remove that problem, but the text does not make such a redefinition. Use beta_w-flat consistently.

## E146 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §8.4.4, Corollary 8.4.6, p. 137, in arXiv v5; present in v4 (Corollary 8.3.6) at p. 127 Independent review source locations: v5 PDF pp. 137; v4 PDF pp. 127; published PDF pp. 144.

**Printed:** There is a unique anti-ordinary vector φ^{♭,a-ord}_r ∈ π_p^{♭,I^♭_r} of level r for each r ≫ 0. Furthermore, under the identification π^♭_p = μ^♭_p ⊗_{w∈Σ_p} π^♭_w, φ^{♭,a-ord}_{−r} = ⊗_{w∈Σ_p} φ^{♭,a-ord}_{w,r}

**Correction or missing argument:** 'Up to multiplication by a scalar, there is a unique …'; φ^{♭,a-ord}_r = ⊗_{w∈Σ_p} φ^{♭,a-ord}_{w,r}.

**Independent check:** No scalar normalization has been imposed in the statement, so its unique vector means a line, as in the adjacent corollaries. The subsequent remark imposes a normalization. The subscript -r is also a slip.

## E147 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §8.5, first paragraph, p. 138, in arXiv v5; present in v4 at p. 128 Independent review source locations: v5 PDF pp. 109–112, 138; v4 PDF pp. 128; published PDF pp. 145.

**Printed:** Suppose π satisfies the Gorenstein, Minimality, and Global Multiplicity One Hypotheses of section 7.1.

**Correction or missing argument:** … of Section 7.3 (Hypotheses 7.3.2, 7.3.3 and Proposition 7.3.5).

**Independent check:** The named hypotheses are in Section 7.3, not the big-Hecke-algebra definitions of 7.1.

## E148 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §8.5, Lemma 8.5.3, p. 139 (second sentence of the statement), in arXiv v5; present in v4 (Lemma 8.4.3) at p. 129 Independent review source locations: v5 PDF pp. 138–139; v4 PDF pp. 129; published PDF pp. 146–147.

**Printed:** If φ_{r′}(v_S, π′) ∈ H^{d,ord}_κ(K_{r′}, ψ′, R) and φ_{r′}(v^♭_S, π′) ∈ H^{d,ord}_{κ^♭}(K^♭_{r′}, ψ′^{,−1}, R)_χ, … for appropriate choices of φ_{r′}(v_S, π′) and φ_{r′}(v^♭_S, π′)

**Correction or missing argument:** φ_{r′}(v^♭_S, (π′)^♭) in both places.

**Independent check:** The second vector is the one constructed in (pi-prime)-flat in the preceding paragraph and the first display. Restore that representation in both subsequent occurrences, and keep its specialized weight and twisted nebentypus consistent with E166.

## E149 — confirmed

**Kind:** misprint. **Reach:** a stated result. **Existing correction:** new.

**Source:** §8.5, proof of Lemma 8.5.3, p. 139 ('The remaining claims of the lemma are consequences of the definition of Q[π′, χ]'), in arXiv v5; present in v4 at p. 129 Independent review source locations: v5 PDF pp. 104–106, 137–139, 145; v4 PDF pp. 100–102, 128–129, 134; published PDF pp. 110–111, 145, 147, 153.

**Printed:** The ratio ⟨φ_{r′}(v_S, π′), φ_{r′}(v^♭_S, (π′)^♭)_χ⟩_{π′,χ} / Vol(I^0_{r′,V} ∩ I^0_{r′,−V}) … its value is in R·Q[π′, χ] … The remaining claims of the lemma are consequences of the definition of Q[π′, χ].

**Correction or missing argument:** Use Vol(I^0_(r,V) intersect I^0_(r,-V)) consistently in the period definitions of Lemmas 6.7.1 and 6.7.6 and the displayed pairing before Definition 6.7.2. Track the resulting nonunit change in the periods if the old convention is retained. This fixes this normalization mismatch only.

**Independent check:** Section 6.7 divides by Vol(I intersect I-transpose), while 8.4.9, 8.5.3 and 9.2.2 divide by Vol(I^0 intersect (I^0)-transpose). Their ratio is the diagonal-unit index product_w #(O_w/p^r)^x raised to n, which has a nontrivial p-power for r>=2. It is not absorbable in the allowed unit ambiguity of periods. Replacing I by I^0 in the period normalization reconciles this particular discrepancy. Remove the original blanket assurance that the main theorem then holds: the independent local-integral, central-character, lattice and interpolation gaps are unaffected.

## E150 — confirmed

**Kind:** gap. **Reach:** the proof. **Existing correction:** new.

**Source:** §9, proof of Lemma 9.0.1, p. 140, in arXiv v5; present in v4 at p. 130 Independent review source locations: v5 PDF pp. 140; v4 PDF pp. 130; published PDF pp. 147–148.

**Printed:** The property of being ordinary is preserved under complex conjugation, and by twist by a power of the similitude character. On the other hand, duality exchanges ordinary with anti-ordinary representations, by Lemma 8.3.6. Since π is essentially unitary, it follows that it is both ordinary and anti-ordinary.

**Correction or missing argument:** Prove the precise conjugation compatibility of the normalized Hecke operators, weights, Borel and fixed p-adic embedding, or replace the argument by one that establishes ordinarity directly. Until then retain anti-ordinarity as the standing hypothesis without inferring extra interpolation points from this lemma.

**Independent check:** Complex conjugation does not generally preserve the valuation at a fixed p-adic embedding. Concretely, in Q(i) at the prime (2+i) above 5, 2+i has positive valuation and 2-i is a unit. Essential unitarity is an assertion involving complex conjugation and duality, so it does not itself prove the needed valuation invariance. The weight and Borel changes under conjugation must be tracked, especially given E136. This elementary scalar example disproves the general valuation inference, not the specific automorphic lemma under a correctly transported normalization. The original CM-character sketch is not presented as a fully checked global counterexample. The claim is not used to enlarge the proved interpolation range.

## E151 — rejected

**Kind:** misprint. **Reach:** nothing. **Existing correction:** Not an error: rejected by REV-ERRATA-PAPER-EISCHEN-HARRIS-LI-ETAL-20.

**Source:** §9.1.1 proof of Lemma 9.1.2 (p. 141) vs Remark 9.3.2(6) (p. 146), in arXiv v5; v4's proof (p. 131) cites Hypothesis 7.3.3 Independent review source locations: v5 PDF pp. 141, 146–147; v4 PDF pp. 131, 134; published PDF pp. 149, 154–155.

**Printed:** Lemma 9.1.2 proof: 'By Hypothesis 6.6.4 and strong multiplicity one, applied to the base change to GL(n)_𝒦, this in turn implies …'; Remark 9.3.2(6): 'Finally, the identification in Lemma 9.1.2 only depends on Hypothesis 7.3.3 and not on the stronger Hypothesis 6.6.4.'

**Correction or missing argument:** No mandatory correction established. An expanded proof could separate the standing hypothesis, the GL(n) strong multiplicity-one theorem, and the weaker packet-level formulation in Remark 9.3.2.

**Independent check:** The citation changes between v4 and v5, but a proof given under a stronger standing hypothesis and a later remark explaining that it can be weakened are not contradictory. Remark 9.3.2 is expressly a sketch for removing 6.6.4 and accounting for whole packets. No mistaken theorem number is established merely by the two different citations. Restore no old citation automatically: the global multiplicity-one hypothesis 7.3.3 is itself distinct from strong multiplicity one for GL(n). A fully minimal proof could be useful, but the recorded evidence does not establish a misprint.

## E152 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §9.1.6, (179) (p. 143) and Proposition 9.1.7 with its proof (p. 143), in arXiv v5; present in v4 at pp. 132–133 Independent review source locations: v5 PDF pp. 85, 120, 143–144; v4 PDF pp. 132–133; published PDF pp. 151–152.

**Printed:** (179): '= D(χ) · L_{φ⊗φ^♭}(res_3 D(κ, m, χ_0) E^holo_{χ_0,ψρ^υ}(m))'; Prop. 9.1.7: '= D(χ) · 1/(Vol(I^0_{r,V})Vol(I^0_{r,−V})) I(φ′, φ′^♭, D(κ, m, χ_0) f^holo(χ_u, ψρ^υ), m)' with 'π′ ∈ S(K_{r^1}, κ^1, π), for some r^1 and κ^1'

**Correction or missing argument:** Use chi_u consistently with (113), or explicitly identify the archimedean characters before changing notation. At a pi-prime specialization use its kappa^1 and choose a common sufficiently large r=r^1 for the test vectors and the measure, with the level trace comparison stated; then use those same indices in the volumes and both sides of (179).

**Independent check:** The local sections in the proposition use chi_u, while the differential operator and Eisenstein-series label use chi_0 without specifying the change from (113). Specializing to pi-prime also requires its weight kappa^1 and a common sufficiently large level for the measure and test vectors. Merely replacing every r by r^1 without that compatibility is insufficient. The v4 occurrence has no varying pi-prime; v5 introduces this additional indexing issue.

## E153 — confirmed

**Kind:** gap. **Reach:** the proof. **Existing correction:** new.

**Source:** §9.1.6, proof of Proposition 9.1.7, p. 143, in arXiv v5; present in v4 at p. 133 Independent review source locations: v5 PDF pp. 45, 94, 120–121, 142–143; v4 PDF pp. 133; published PDF pp. 47, 99, 127, 149–152.

**Printed:** Abbreviate [G_3] = G_3(ℚ)Z(ℝ)\G_3(𝔸), dg^χ_2 = χ(det(g_2))^{−1}dg_2. By doubling the formula in Lemma 7.5.3 … = 1/(Vol(I^0_{r,V})Vol(I^0_{r,−V})) ∫_{[G_3]} D(κ, m, χ_0)E^holo_{f(χ_0,ψρ^υ)}((g_1, g_2), m) φ′(g_1)φ′^♭(g_2) ||ν(g_1)^{a(κ)}|| dg_1 dg^χ_2. Comparing this with Equation (179) and the definition of the zeta integral, we obtain the equality.

**Correction or missing argument:** Starting from a consistent central-character/Serre convention (E97), write the identification of pi-flat with the appropriate twisted dual, verify central invariance of the full integrand, and calculate the quotient-measure factor between Z(R) and Z_3(A). Then reconcile the chi_u section and the normalization from E125. This review does not supply the missing global comparison.

**Independent check:** The Serre integral and the adelic-center zeta integral have different displayed quotient groups and similitude factors. Identifying them requires both a character calculation and the measure on the intervening central quotient. The sign discrepancy with 7.5.3 is real, but E97 shows that simply trusting the latter negative sign is not a valid repair. Remove the original speculative sign check and the assurance that the final formula is unaffected. The two inverse volumes are natural for a doubled pairing after E125, but this does not identify the remaining integrals.

## E154 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** partially corrected in publication, p.152: the local test-vector primes are restored; the pairing and volume factors are still absent.

**Source:** §9.1.6, Corollary 9.1.8, p. 144, first equality of the display, in arXiv v5; present in v4 at p. 133 Independent review source locations: v5 PDF pp. 45, 143–144; v4 PDF pp. 133; published PDF pp. 47–48, 151–152.

**Printed:** L_{φ′⊗φ′^♭}(∫_{X_p×T_H(ℤ_p)} (χ, ψρ^υ) dEis) = D(χ) ∏_v I_v(φ_v, φ^♭_v, f_v, m) = [Vol(I^0_{r,V})Vol(I^0_{r,−V})]^{−1}⟨φ′, φ′^♭_χ⟩_χ · I_p(χ, κ)I_∞(χ, ρ^υ)I_S L^S(m + 1/2, π′, χ_u)

**Correction or missing argument:** Insert [Vol(I^0_(r,V)) Vol(I^0_(r,-V))]^-1 times <phi-prime,phi-prime-flat>=<phi-prime,phi-prime-flat_chi>_chi before the product of normalized I_v, using the specialized local vectors and common level of E152. This repairs the factorization step conditional on Proposition 9.1.7, not its unresolved normalization proof.

**Independent check:** Combining Proposition 9.1.7 with the definition (51) gives the inverse product of the two level volumes times the global pairing before the product of normalized local integrals. Rescaling either test vector already detects the missing pairing: each I_v is invariant under that scaling but the left side is linear. Remark 4.1.6 identifies the untwisted pairing with the chi-twisted one. Publication fixes the local-vector primes but still omits the scalar factors.

## E155 — confirmed

**Kind:** gap. **Reach:** a stated result. **Existing correction:** new.

**Source:** §9.2, Main Theorem 9.2.2 (and Corollary 9.2.1), statement, pp. 144–145, in arXiv v5; present in v4 at pp. 133–134 ('for any π′ congruent to π') Independent review source locations: v5 PDF pp. 83–85, 117–118, 138–139, 143–145; v4 PDF pp. 132–134; published PDF pp. 151–153.

**Printed:** For any classical χ = ||•||^m χ_u : X_p → R^×, and for any π′ ∈ S(K_{r^1}, κ^1, π) for some r^1, the image of L(Eis, φ ⊗ φ^♭) … equals …

**Correction or missing argument:** State the interpolation property for pairs satisfying Y_H^class, m>=n, the regular-weight control hypotheses and (166) at kappa^1, with the compatible levels and parameters of E152. Any extension beyond that range needs a separate proof. Anti-ordinarity is already a standing assumption and need not be advertised as newly missing.

**Independent check:** The proof imports Proposition 9.1.7, which requires a classical pair in Y_H^class and m>=n, as well as regular-weight control and the local condition (166) at the specialization. Being a classical Hecke character alone does not impose these joint conditions. Corollary 9.2.1 starts by inheriting 9.1.8 hypotheses, and the sentence preceding 9.2.2 may import the archimedean inequalities; those are legitimate defenses and should be preserved. They do not justify an interpolation formula for arbitrary independent classical chi and pi-prime outside the established range. This is a range-of-proof gap, not a counterexample to every possible extension.

## E156 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §4.6 cross-references from §9: Corollary 9.1.8, Corollary 9.2.1 and the paragraph before Corollary 9.1.8, p. 144, in arXiv v5; present in v4 at p. 133 Independent review source locations: v5 PDF pp. 79–80, 144; v4 PDF pp. 133; published PDF pp. 152.

**Printed:** 'Corollary 9.1.8 below is then a consequence of the local computations summarized in Proposition 4.6.1'; 'where the factors are defined as in Proposition 4.6.1'

**Correction or missing argument:** Theorem 4.6.1.

**Independent check:** The numbered global result is Theorem 4.6.1. No proposition with that number is present. The archimedean factor may be indexed by kappa or rho^upsilon once chi and their relation are fixed.

## E157 — confirmed

**Kind:** misprint. **Reach:** a stated result. **Existing correction:** new.

**Source:** §9.2, Main Theorem 9.2.2 and Corollaries 9.1.8, 9.2.1 (pp. 144–145): meaning of the partial L-function L^S, in arXiv v5; present in v4 Independent review source locations: v5 PDF pp. 46, 79–80, 138, 144–145, 147; v4 PDF pp. 128, 133–134; published PDF pp. 145, 152–153, 155.

**Printed:** … I_S L_p(m, ord, π′, χ_u) L^S(m + 1/2, π′, χ_u)/P_{π′,χ} …, with S (§8.5, p. 138) 'the set of finite primes, not dividing p, at which K^p is not hyperspecial maximal'

**Correction or missing argument:** Use L^(S-prime union {v|p} union {infinity}) in the interpolation formulas, with the standard character convention independently reconciled as in E41/E74. In Remark 9.3.4 either retain L^(p,infinity) after absorbing the S factors, or divide the modified L_p by the ordinary p-Euler product before using the full finite L-function.

**Independent check:** S is explicitly away from p, whereas the Euler product contributed by spherical sections runs only over finite places outside S and p. Keeping the usual p-Euler factor inside L^S would count it in addition to the modified factor L_p. Define the product explicitly and distinguish rational primes S from places S-prime of K+. Remark 9.3.4 has the same issue: deleting only the S factors does not turn this p-depleted product into the full finite L-function. This correction does not settle the unramified character-orientation issue E41/E74.

## E158 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** §9.2, proof of Main Theorem 9.2.2, p. 145, in arXiv v5; present in v4 at p. 134 Independent review source locations: v5 PDF pp. 145; v4 PDF pp. 134; published PDF pp. 153.

**Printed:** In particular, the Vol(I^0_{r^1,V}) and Vol(I^0_{r^1,V}) terms cancel, leaving the factor Vol(I^0_{r^1,V} ∩ I^0_{r^1,−V})^{−1}.

**Correction or missing argument:** the Vol(I^0_{r^1,V}) and Vol(I^0_{r^1,−V}) terms cancel

**Independent check:** The two factors in the preceding formula are indexed by V and -V. The repeated V in the cancellation sentence is a copy slip. This confirms that sentence-level correction without asserting all the cited local-integral formulas are correct.

## E159 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** corrected in publication, p.158: a single [Hid96] entry, with unified citations.

**Source:** Bibliography, p. 150, entries [Hid96a] and [Hid96b], in arXiv v5; present in v4 at p. 137 and in v3 Independent review source locations: v5 PDF pp. 150; v4 PDF pp. 137; published PDF pp. 2, 156, 158; v1 PDF pp. 71; v3 PDF pp. 132–133.

**Printed:** [Hid96a] ———, On the search of genuine p-adic modular L-functions for GL(n), Mém. Soc. Math. Fr. (N.S.) (1996), no. 67, vi+110, … MR 1479362 (98i:11027) / [Hid96b] ———, On the search of genuine p-adic modular L-functions for GL(n), Mém. Soc. Math. Fr. (N.S.) (1996), no. 67, vi+110, … MR 1479362 (98i:11027)

**Correction or missing argument:** Use the single [Hid96] entry and unify its citations, as already done in the published version.

**Independent check:** The arXiv v4 and v5 bibliographies repeat the same Hida monograph, including the correction note and MR number. The published bibliography has a single [Hid96] on p.158, and the cited text uses that unified label. Thus this is an arXiv-only duplication already corrected in print, contrary to the inherited report of unchanged publication.

## E160 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** partially corrected in publication: parenthesis after U(V) (p.47), repeated neighborhood (p.50), parentheses around (9) (p.51), and parentheses in (56) (p.53); other slips remain.

**Source:** Minor typographical slips in §4.1–§4.3.5 of arXiv v5 (several places, listed in ‘printed’) Independent review source locations: v5 PDF pp. 44–45, 47–49, 51, 54–55, 57; published PDF pp. 47, 49–51, 53–54, 57–58, 60–61.

**Printed:** p. 45: “(upon restriction to U(V).” (unbalanced parenthesis). p. 47: “Let K_v be an open compact subgroup of G_{1,v} that fixes φ_v” and “φ′_v ∈ π′_v”. p. 48: “open neighborhood neighborhood 𝒰_v” and, in Lemma 4.2.3, “I_v(φ_v, φ′_v, f_v, χ)”. p. 49: “we make use of the isomorphisms 9”. p. 51: (56) with unbalanced parentheses, “ν_{t(w),w}(A)” and the stray “·×” in the formula for φ_{ν_v} (also ‘φ_{ν_v}’ for φ_{ν_w}). p. 54: “For all w ∈ Σ and 1 ≤ i ≤ r(w)”. p. 55: “By the choice of r, the character μ_w extends … μ′_w(γ) = ∏_{i=1}^{r_w} μ′_{i,w}(γ_{ii})”. p. 57, Remark 4.3.5: “These sections, denoted φ^{a-ord}_{w,r} and φ^{♭,a-ord}_{w,r}”.

**Correction or missing argument:** Balance the v5 punctuation, use U_(1,v), pi_v dual and spectral parameter s, remove repeated neighborhood and the stray multiplication symbol, use phi_(nu_w), Sigma_p, mu-prime_w and r(w). Retain matrix-character evaluation under the stated determinant convention; writing nu(det A), nu(det D) is optional if reverting to the original scalar-character notation. Record which punctuation changes are already in print.

**Independent check:** Confirm the punctuation/word/index slips, the dual representation in the pairing, and U_(1,v) for the ramified compact subgroup: (K_v,1) is required to lie in U_3, so an open compact of GU would not fit. Revise the character complaints: matrix evaluation via determinant has already been introduced explicitly, particularly for mu-prime_i on v5 p.54, so mu-prime_i(gamma_ii) is correct under that convention. Writing det explicitly is optional clarification, not a further error. The mu_w versus mu-prime_w mismatch and r_w versus r(w) remain. Publication repairs the parenthesis after U(V), repeated neighborhood, parentheses around (9), and the unbalanced parentheses in (56); other identified slips remain. Calling vectors in an induced model sections is also legitimate terminology, so that constituent complaint is rejected rather than treated as a mathematical correction.

## E161 — confirmed

**Kind:** misprint. **Reach:** nothing. **Existing correction:** new.

**Source:** Section 2.6.2, v5 p.21; published p.22

**Printed:** An R-valued point f in E can be viewed as a functorial rule assigning to a pair (A,epsilon) over an R-algebra S an element f(A,epsilon) in S.

**Correction or missing argument:** A regular function f on E_R, equivalently a section of pi_*O_E over the relevant base, gives such a functorial rule. An R-valued point is the tuple (A,epsilon), not a function on tuples.

**Independent check:** By the functor-of-points description, a natural assignment E(S)->S is a morphism E_R->A^1_R. It is not a morphism Spec R->E. The next sentence on sections of pi_{r,*}O_{E_r} uses the correct distinction.

## E162 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** Section 2.9, v5 p.29; published p.30, definition of D_m and V^{cusp}_{n,m}

**Printed:** D_m=S_m-S_m^0 (with reduced closed subscheme structure); V^{cusp}_{n,m}(R)=H^0(T_{n,m/R},O_{T_{n,m}}(-D_{n,m})).

**Correction or missing argument:** Take D_m to be the scheme-theoretic pullback to S_m of the horizontal toroidal boundary divisor, and D_{n,m} its pullback along the etale Igusa cover. Do not reduce the divisor after passage to Z/p^m. Its ideal must impose vanishing modulo p^m, not just modulo p.

**Independent check:** For m>1 a boundary chart is A=(Z/p^m)[q] with horizontal boundary ideal (q). Its reduced boundary has ideal (p,q), which contains the nonzero constant p. Thus the printed definition admits p times every form into the alleged cusp ideal; in the inverse limit it still admits the constant p although its boundary value is p!=0. The ideal (p,q) is also not a Cartier divisor ideal on this thickening. Etale pullback preserves this discrepancy. This is a defect in the stated cusp-module definition; no assertion that the intended, horizontally defined cusp theory is false.

## E163 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** Section 4.1.1, v5 p.42; published p.44; v4 p.38 and v1 p.36

**Printed:** The map Delta-prime identifies N with Herm_n(K), with the unipotent matrix [[1,Delta-prime(N)],[0,1]] in the specified polarization basis.

**Correction or missing argument:** In the stated bases inherited by projection from V, the upper-right block must be skew-adjoint for the hermitian Gram matrix H: XH+HX*=0 for the row-vector convention. To use ordinary Hermitian matrices as parameters, insert the required imaginary scalar and Gram-matrix change (or explicitly change the polarization bases).

**Independent check:** Take K=Q(i), n=1 and V=<1>. The specified V_d,V^d basis gives the doubled hermitian Gram matrix J=[[0,2],[2,0]]. The permitted Hermitian parameter X=1 gives g=[[1,1],[0,1]], but g J g*= [[4,2],[2,0]] != J. Thus this matrix is not in N or even U(W). Purely imaginary X instead satisfies the actual condition. The source says Hermitian and displays the block itself, so an abstract isomorphism between Hermitian and skew-Hermitian spaces does not repair the displayed coordinates without an explicit change.

## E164 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** Section 4.1.1, v5 p.42; published p.44; v4 p.38

**Printed:** The Levi element m(A,nu) has block matrix diag(nu*(A*)^-1,A), where A* is transpose-conjugate, in the bases inherited from the same basis of V.

**Correction or missing argument:** For the row-vector convention and Gram matrix H of V, the first block is nu*H*(A*)^-1*H^-1. Alternatively explicitly choose mutually dual polarization bases and change the coordinate identifications throughout.

**Independent check:** The doubled Gram matrix has cross block 2H. Preserving it requires B H A*=nu H. Over Q(i), take H=diag(1,3), nu=1 and A the coordinate swap. The printed B=A swaps the two diagonal entries of H, so diag(B,A) is not unitary. The corrected B=[[0,1/3],[3,0]] gives gJg*=J by exact rational multiplication. This is separate from E163: even a block-diagonal element, with no unipotent parameter, fails.

## E165 — confirmed

**Kind:** misprint. **Reach:** a stated result. **Existing correction:** new.

**Source:** Published version, Section 6.1, p.90, dimension display; compare arXiv v5 p.86 and v4 p.85

**Printed:** d = sum_{sigma in Sigma_K} a_sigma b_sigma.

**Correction or missing argument:** d = (1/2) sum_{sigma in Sigma_K} a_sigma b_sigma = sum_{sigma in Sigma} a_sigma b_sigma.

**Independent check:** Sigma_K contains both embeddings in each conjugate pair, with a_sigma=b_sigma-c. Each real factor has complex dimension a_sigma b_sigma, so the sum over all CM embeddings counts twice. For imaginary quadratic U(1,1), the symmetric domain is one-dimensional but the published formula gives 2. The factor 1/2 is present in arXiv v5 and v4 and absent in the published PDF, verified visually on p.90. This is a publication regression affecting the explicit dimension and its use in top cohomology.

## E166 — confirmed

**Kind:** error. **Reach:** a stated result. **Existing correction:** new.

**Source:** Section 6.7.5, definition of H[pi-flat]_chi, arXiv v5 p.106 and published p.111

**Printed:** H_{kappa-flat,-V}^{d,ord}(K_r-flat,psi^-1,R)[pi-flat]_chi := H_{kappa-flat star chi,-V}^{d,ord}(K_r-flat,psi^-1,R)[pi-flat tensor chi^-1 det].

**Correction or missing argument:** Transport the finite nebentypus and the tame/p level as well as the weight under twisting. For finite-order chi the new nebentypus is psi^-1 times the restriction of chi^-1 det to I_r^0; choose r and tame level so the twist is trivial on the corresponding pro-unipotent/level subgroup.

**Independent check:** Take a finite-order chi nontrivial on determinants of I_r^0 and trivial on I_r, and an ordinary pi-flat vector of nebentypus psi^-1. The twisted vector transforms by psi^-1 chi^-1 det, not psi^-1. Its algebraic weight is unchanged, so changing kappa-flat star chi cannot absorb this finite character. The printed fixed-nebentypus space can therefore lose the entire one-dimensional anti-ordinary component, contradicting the rank-one period assertion of Lemma 6.7.6 even after its E112 typographical repair. Increasing r alone does not make chi trivial on I_r^0 diagonal units. The same issue occurs away from p if chi ramifies outside the fixed tame level.
