# Independent review: EHLS errata

Job: `REV-ERRATA-PAPER-EISCHEN-HARRIS-LI-ETAL-20`. Reviewer: Codex, session `codex-c83e7a`, 23 September 2026.

**Verdict: accept the corrected register.** All 160 inherited entries were checked individually: 156 confirmed and E49, E80, E111 and E151 rejected. Six additional findings, E161–E166, are confirmed. The resulting 166 entries have 162 confirmed and four rejected verdicts. E87, E88, E123 and E159 are already corrected in the published version; E99, E102, E116, E133, E134, E154 and E160 contain partial publication corrections, expressly identified below. A partial correction does not resolve an entire aggregate entry.

This is a completed independent errata review, not a proof that every argument in the paper is valid after the listed edits. Several proposed repairs in the input were themselves unproved or false. The revised entries distinguish a false statement, a specific missing proof step, and a harmless slip, and specify the remaining mathematical obligations. A confirmed gap records the missing argument; it does not assert a counterexample to its conclusion.

## Independence and sources

The reviewed inputs identify Claude Code sessions `cc-d67081` and `cc-2aeb03`. I checked their full text and this session's worker log before claiming; I wrote none of those inputs. Eleven input paths were acquired and guarded at commit `72c538852f91bde292a269b28c654d746515641d`, with original deliverable blob identities retained separately. Only the three paths named by issue #2179 are changed.

The fresh public PDFs below were retrieved on 23 September 2026. All page locators in this review are PDF page numbers; the EHLS versions number their pages accordingly. The published Cambridge file has a fresh download watermark and a different byte hash from the earlier worker's copy; no byte identity is claimed. Formula checks used the PDF text and page images where needed, not equality of surrounding prose as a substitute for reading a formula. The per-entry list below records the passages used. This was a targeted review of the findings and their dependencies, not a new line-by-line extraction of every cited external paper.

| Source | PDF pages | SHA-256 |
|---|---:|---|
| [published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/E1D22AA60E10A5B5CA5F838EB48467D7/S2050508620000049a.pdf) | 160 | `3a3b3cd8e8dccf614ee58916d65b41a0631ec0b2fa8dbcfc506bbded01975a27` |
| [v1](https://arxiv.org/pdf/1602.01776v1) | 73 | `6bf5665dd4a7aed5e84783b2b26d1dc90ded6dc0082fa6831aace4fbf5bb9b52` |
| [v2](https://arxiv.org/pdf/1602.01776v2) | 135 | `f5b0b24bcbab8b9b51ac5bc52ff686c3d2a3dc0c1843a630700514009905f994` |
| [v3](https://arxiv.org/pdf/1602.01776v3) | 135 | `c6e06b49361d6dc069e50243d3c6149beb3664720ee0dea03842d87689bc5e0b` |
| [v4](https://arxiv.org/pdf/1602.01776v4) | 139 | `0665b72ded62aa0615165df007e443785357d454ea166385e3e0e08d57af9287` |
| [v5](https://arxiv.org/pdf/1602.01776v5) | 152 | `881a496afe0a7f4707fed614a969af481ed737ae1174db1995be3164a90b9569` |
| [moonen04](https://arxiv.org/pdf/math/0203288) | 44 | `9b2a6c60ed006f79cd7a8daf8e4f5ca1750f414e9f682c98c78948cd2c1fbc68` |
| [garrett06](https://math.nyu.edu/~tschinke/princeton/papers/.aim05/submitted/garrett.pdf) | 18 | `af6b0264e0f7d6ad8ebd702b445e063487c3667b316773ff2ca35ae85b66d470` |
| [eischen-liu20](https://arxiv.org/pdf/2006.04302) | 29 | `9bdd2d1d38f231b4dbc3b9b23bba3e16d1b6ca049c876a4f68fb1775573c254a` |
| [harris08](https://webusers.imj-prg.fr/~michael.harris/SW.pdf) | 33 | `830e940e1b48925390257b07de152f5254fa2da1b1278b9d1a6b78f975b69fd5` |
| [mok](https://arxiv.org/pdf/1206.0882) | 274 | `48be19203a9dc55ffc6df58f68e391490c8411afb0af6d72aa7edb8c5d6136df` |
| [harris86](https://www.numdam.org/item/CM_1986__60_3_323_0.pdf) | 57 | `0d5186bdeb3356539746b1c587414b2667d571f0692b9ca12a875ef3122324a7` |
| [efmv18](https://arxiv.org/pdf/1511.06771) | 39 | `d7bab369ee660728f3c8d2fb1923172ea4c24a799008876b9d4f8474c25bae42` |
| [eis14](https://arxiv.org/pdf/1302.7229) | 32 | `2ac748f1e8ca07b86f3aa242f7422071ff2b9133daa3a7fb34e1ecee99ba98cf` |
| [eis15](https://arxiv.org/pdf/1106.3692) | 40 | `eefa5173f3c5238d03eba6ab34b552435b848b208a543f9a046ff15df31b1697` |
| [eis14-published](https://msp.org/ant/2014/8-10/ant-v8-n10-p03-p.pdf) | 42 | `a89ccfbbd92697fd3aa91d638d6d6815dfee50e447aabd7022c32677437b314d` |
| [harris-errata](https://www.math.columbia.edu/~harris/website/content/12-errata-publications-list-links-here/errata.pdf) | 5 | `6030666400c2f71af0bf702492cf041cab8b9cb2c35ef8a7b6b53dbaa11df959` |
| [marcil-current](https://pages.uoregon.edu/dmarcil/publications/Pord_padic_Lfunctions.pdf) | 142 | `9f7776289b2b683d63a28f491af1c814b61304e84280820255ea833d9fed1dfa` |

The external reading scope was: Moonen Proposition 2.3.12 (PDF pp.23–24); Garrett's qualitative local theorem (pp.4,11); Harris 2008 Remark 4.4(iii) and Section 5 (pp.27,31); Harris 1986 Lemma 7.3.2 and Section 7.11 (pp.38–39,44–48); Mok's classification statements (pp.32–36); Eischen–Liu's archimedean formulas and conventions (pp.4–7,9–11); EFMV's differential and restriction statements (pp.24–27,32–37); Eischen 2015's local sections, Fourier coefficients and normalization (pp.18–21,24–27); and Eischen 2014's corresponding construction and covariance, including the published equation (32) on PDF p.26 (printed p.2456). These are primary-source checks of specific inputs, not assertions that each entire paper was read.

## Material changes to the input

- The rejected entries have substantive defenses: E49 states a true weaker support bound; E80's weight relation is explicitly given in the preceding paragraph; E111's spectral complement is explicitly defined; E151 confuses a stronger-hypothesis proof with the later discussion of weakening that hypothesis.
- Aggregate E102 rejects its proposed cross-reference change (o), and revises the control-ideal and holomorphic-representation corrections. E160 rejects mandatory determinant insertions where determinant composition is already the declared convention. Both retain confirmed constituent slips.
- Local calculations E41–E60 have explicit rank-one, matrix, scaling or finite-index diagnostics. The review does not convert these into an unproved complete repair of the global interpolation formula. In particular E41's general base-change orientation, E52's changed Schwartz data, and E53's pointwise factorization remain separate obligations.
- E72 takes account of Harris's actual compensating measure; its remaining objection concerns the freedom in the individual local measures. E127 and E130 take account of what EFMV actually proves: arbitrary signature is covered, while restriction compatibility has specific hypotheses and the modified EHLS local data still need comparison.
- E110 isolates the congruence-lattice obstruction to integral perfectness. E113 no longer demands that a common CM period scalar be a unit. E117–E122 specify the needed level/nebentypus and module-control comparisons. E149 repairs one volume mismatch without claiming that it resolves all other normalization issues.
- E155 records the interpolation range actually supported by the cited propositions. E157 also corrects the later attempt to replace the partial Euler product by the full finite L-function.
- E161 distinguishes a regular function from a point; E162 distinguishes a horizontal boundary divisor from its reduced special-fiber support; E163–E164 give exact failures of the displayed unipotent and Levi coordinates; E165 records a dimension factor lost only in publication; E166 transports finite nebentypus and level under twisting.

## Independent verdicts

Each entry below states its verdict, reach, checked source locations and independent reason. The companion [errata notes](../errata/PAPER-EISCHEN-HARRIS-LI-ETAL-20.md) reproduce the quoted text and the corrected statement or explicit proof obligation; the [JSON register](../errata/PAPER-EISCHEN-HARRIS-LI-ETAL-20.json) is authoritative for machine-readable verdicts. Rejected entries remain for auditability.

### E1 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 6; v4 PDF pp. 6; published PDF pp. 6; v1 PDF pp. 5–7; v2 PDF pp. 5–7; v3 PDF pp. 5–7.

The Garrett-map denominator visibly ends in an unmatched closing bracket in v5 p.6 and published p.6. Balancing the brackets leaves the intended left quotient unchanged. v4 p.6 additionally uses a forward slash.

Correction/status: new.

### E2 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 5–6, 9; v4 PDF pp. 5–6, 8; published PDF pp. 5–6, 9; v1 PDF pp. 5–7; v2 PDF pp. 5–7; v3 PDF pp. 5–7.

Section 1.1.2 retains Q for the period called P in the displayed interpolation formula and adjacent discussion. The renaming is incomplete, rather than a new period. Both the v5 p.9 and published p.9 sentence retain Q.

Correction/status: new.

### E3 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 13; v4 PDF pp. 12; v1 PDF pp. 11; published PDF pp. 13.

For GL1/Q the displayed example gives A^times/R^times, whose finite-idele valuation map surjects onto the infinite discrete group direct_sum_l Z. It is not compact. The central quotient in the pairing includes rational points, so the compactness condition must include Z_G(F) too.

Correction/status: new.

### E4 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 13; v4 PDF pp. 12; v1 PDF pp. 11; published PDF pp. 14.

Arbitrary nondegenerate local pairings do not define the asserted product: take the trivial representation of GL1 and multiply the normalized pairing by 2 at every finite place. The spherical product diverges. Normalize distinguished vectors to pair to 1 at almost every place; Schur uniqueness then supplies C. The claim of existence as stated is false, so change gap/nothing to error/a stated result. This does not disprove the later application with normalized pairings.

Correction/status: new.

### E5 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 14; v4 PDF pp. 13; v1 PDF pp. 11; published PDF pp. 14; v3 PDF pp. 12.

The independence assertion is false. For GL2(Q_p), K=GL2(Z_p), b=diag(p,1), and the K-spherical delta_B-equivariant F with F(1)=1, averaging over bKb^{-1} yields 1/p rather than 1. Conjugation changes the functional by delta_B(b). Keep K fixed or state this scalar dependence. Correct reach to a stated result; absorption into C limits downstream impact but does not make the independence assertion true.

Correction/status: new.

### E6 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 15; v4 PDF pp. 14; published PDF pp. 16.

Literal isogenies need not give a symmetric relation with the exact prime-to-p level condition. For an elliptic curve with End=Z, take f=[ell] with ell!=p and alpha_prime=ell*alpha. A reverse genuine endomorphism [m] would require m*ell to be a unit at ell in the compact integral level group, which is impossible. A prime-to-p quasi-isogeny has the necessary inverse; the intended equivalence is clear.

Correction/status: new.

### E7 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 16–17, 21–22; v4 PDF pp. 15–16; published PDF pp. 17–18, 21–23.

For a weight -1 Hodge structure F^0=V^{0,-1}, whereas Section 2.6.1 uses W=V/V^{0,-1} and Section 2.6.3 gives its sigma ranks a. Section 2.3 also assigns a=r for h(z)=diag(zI_r,zbarI_s). Thus the signature definition needs the V^{-1,0} summand (or the quotient), rather than F^0.

Correction/status: new.

### E8 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 17; v4 PDF pp. 15; v1 PDF pp. 14; published PDF pp. 17.

The surrounding sentence identifies the dual of O_w, and the unexplained E_{i,w} in its parenthesis has no role in that identification. Replace it by O_w.

Correction/status: new.

### E9 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 14, 17; v4 PDF pp. 15–16; v1 PDF pp. 14; published PDF pp. 15, 18.

A merely imaginary p-unit delta does not guarantee the PEL positivity axiom. With the hermitian form linear in the first variable each nonzero sigma component contributes 2 Im(sigma(delta))*|x|^2. Replacing an allowed delta by -delta reverses positivity without changing the stated hypotheses. Require positive imaginary parts on the chosen CM type (negative for the other linearity convention). Classify as error because the asserted construction is false for permitted choices.

Correction/status: new.

### E10 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 18; v4 PDF pp. 16; v1 PDF pp. 15; published PDF pp. 18.

The m>=1 condition includes the m=1 even-dimensional case declared immediately before to satisfy the Hasse principle. The intended alternative is m>1, and the failure should be phrased as possible in general, not inevitable in every odd-dimensional example.

Correction/status: new.

### E11 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 18; v4 PDF pp. 16; v1 PDF pp. 15; published PDF pp. 19.

The smooth model is over the previously defined base S_square. S_0 in this remark is an inconsistent symbol for that base, not the later extension base used in Section 2.6.3. The later coefficient ring is S0, not S0-prime; the latter is itself the typo confirmed as E18.

Correction/status: new.

### E12 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 18; v4 PDF pp. 16–17; v1 PDF pp. 15; published PDF pp. 19.

The claimed embedding for arbitrary CM extensions is false. For K=Q(i), K1=Q(i,sqrt2), V=<1,3>, trace forms Tr(alpha*x*ybar) with alpha=a+b sqrt2 have Gram matrix [[2a,4b],[4b,4a]] and determinant 8(a^2-2b^2). At 3 both quadratic norm valuations are even; the determinant ratio to 3 has odd valuation, obstructing isometry. Taking p=5 makes this compatible with the p-adic setup. Make the trace-form realization a hypothesis. Correct reach to a stated result while distinguishing the available special case Ki=K.

Correction/status: new.

### E13 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 18; v4 PDF pp. 16; v1 PDF pp. 14; published PDF pp. 18.

The group G permits a common similitude factor. The exact sequence 1->U->G->G_m->1 and H^1(Q,G_m)=1 identify its torsors with hermitian tuples modulo common rational scaling; locally the same statement uses Q_v^times. Thus local triviality means local similarity with one common scalar at each place, not componentwise local isometry. Correct the equivalence relation and record reach as a stated classification result.

Correction/status: new.

### E14 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 20; v4 PDF pp. 18; published PDF pp. 21.

The preceding definition is a pullback along M^tor_{K,L}->M^tor_K. Its structure map therefore has target M^tor_{K,L}, not the undefined M^tor_{K_r,L}. The extra r persists in published p.21.

Correction/status: new.

### E15 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 20; v4 PDF pp. 18–19; published PDF pp. 21.

The normalization in the finite generic cover is finite over the excellent toroidal compactification. The moduli of multiplicative injections is only the open part where these injections extend; missing boundary branches already occur in characteristic zero. In the Tate elliptic-curve model, p^2-1 generic nonzero p-torsion choices reduce to p-1 choices on the toric fiber; the other branches require q^(1/p) and ramify. A normal separated quasi-finite cover is an open subspace of its finite normalization. Replace equality with this open immersion and retain the separate need to justify cusp-form comparisons. The normalization assertion itself is a stated result.

Correction/status: new.

### E16 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 20; v4 PDF pp. 18; published PDF pp. 21.

The displayed identification induced by a chosen basis of Z_p(1) is not Galois equivariant over F unless the relevant roots of unity are present. In the I_r-level problem, the graded pieces of L+ have trivial Galois action; the multiplicative-level problem twists them by the cyclotomic character. After adjoining mu_{p^r} the chosen identification is valid. This identifies a descent error in the specified map, and does not rule out a different F-isomorphism involving an isogeny or a change of level subgroup. Record error/a stated result for the asserted F-identification.

Correction/status: new.

### E17 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 21–22; v4 PDF pp. 19–20; published PDF pp. 22–23.

For square=empty, Lambda0 is a nonzero F-vector space and Hom_{Z_(p)}(Lambda0,Z_(p))=0: the image of any element is divisible by every power of p. Thus the printed dual cannot supply its claimed complementary Hodge summand. The original replacement p->square addresses this vanishing but does not explicitly repair the coefficient-ring problem after base change in Section 2.6.3. Use the dual over the current coefficient ring, with evaluation valued there; trace duality recovers the Z_(p)-valued formulation over an unramified finite integral base before localization.

Correction/status: new.

### E18 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 22; v4 PDF pp. 20; published PDF pp. 22–23.

Both PDFs visibly define S0 and then insert S0-prime in the decomposition and the middle term of (15). The neighboring factors and the final GL_{b_sigma,i}(S0) all use S0. Remove the two primes; no separate ring S0-prime has been introduced here.

Correction/status: new.

### E19 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 22; v4 PDF pp. 20; published PDF pp. 23.

The factors t_{sigma,i,j} are indexed by embeddings sigma in Sigma_K. A product over elements of the field K is not the finite character product. Formula (16) and the next line give the intended embedding index set.

Correction/status: new.

### E20 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 24; published PDF pp. 25.

The field in the unitary setup is K^+, while F is the reflex field and F0 is not introduced here. The stated exceptional rank-one rational factor is the modular-curve exception over K^+=Q. Replace F0 with K^+ at both occurrences. This repairs the symbol, without claiming that every group over K^+=Q is exceptional.

Correction/status: new.

### E21 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 26; v4 PDF pp. 23; published PDF pp. 27.

The surrounding quantifiers use 1<=j<=n_i and the (w,i) component of (14). Consequently its matrix sizes and block cut must use n_i and a_{w,i}; an inactive (w-prime,i-prime) component has identity size n_{i-prime}. The omissions are harmless only in the later single-factor specialization.

Correction/status: new.

### E22 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 20, 26; v4 PDF pp. 23; published PDF pp. 21, 27.

In a GL2 factor with a=1, t=diag(p,1), and g=1+p^r E21, g is in I_r^0 but tgt^{-1}=1+p^(r-1)E21 is not. The printed inclusion is therefore false even for the basic allowed factor. What holds is contraction of the positive unipotent and inverse contraction of the negative unipotent. Correct the reach to a stated result; the ordinary Hecke double coset still exists.

Correction/status: new.

### E23 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 28; published PDF pp. 29.

Conjugation by diag(iI_a,-iI_b) multiplies both off-diagonal Hom blocks by -1. It is an involution, so cannot have eigenvalues +i and -i there. The complex structure distinguishing p+ and p- is induced by h(exp(pi*i/4)); equivalently their h(z) characters are (z/zbar)^+/-1.

Correction/status: new.

### E24 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 29; published PDF pp. 30.

Verschiebung induces omega->Frob^*omega; its determinant has weight det(omega)^(p-1). A kth power therefore has weight det^(k(p-1)), not det^k. One may instead let k denote the total exponent divisible by p-1 and lift Hasse^(k/(p-1)); only the nonvanishing locus is used here.

Correction/status: new.

### E25 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 25, 30; published PDF pp. 31.

Shrinking prime-to-p level gives pullback maps from forms at the larger compact subgroup to forms at the smaller one. The representation whose K^p-fixed vectors recover level K^p is their union/direct limit. Both left-pointing arrows conflict with that construction and the classical analogue in Section 2.6.7.

Correction/status: new.

### E26 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 31; published PDF pp. 32.

The splitting algebra factors are O-prime, as the last term of the same chain already states. In the L+ decomposition each e_i L_w must also retain its + superscript: its stated rank is a_{w,i}, while the full e_i L_w has rank n_i. Both missing decorations persist in published p.32.

Correction/status: new.

### E27 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 32; published PDF pp. 33.

Linearizing (1+epsilon*a)^(p^n)=1 gives p^n*a=0. Hence Lie(mu_{p^n}/S)=O_S[p^n], which vanishes over Z_p and equals O_S when p^n=0 on S. The immediately following application has S over Z/p^m with n>=m and is valid. Correct the introductory base condition and coefficient module.

Correction/status: new.

### E28 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 31–32; v4 PDF pp. 29; published PDF pp. 33.

For m>r, the Lie algebra of mu_{p^r} over Z/p^m consists only of p^r-torsion scalars, so the restricted r-level map cannot trivialize the full Lie algebra. Use phi_{m,m} for the frame and phi_{m,m,r} for the finite level structure, taking the limit over the cofinal range m>=r. The t in phi_{m,m,t} is another index slip. The opening sentence of the same paragraph also needs p-adic weight kappa_p, as its final computation explicitly proves.

Correction/status: new.

### E29 — confirmed; gap; affects the proof

Checked: v5 PDF pp. 20, 29, 32; v4 PDF pp. 29; published PDF pp. 21, 30, 34.

The stated reason gives density on the hyperspecial base, whereas the forms have level K_r on an open quasi-finite cover. That reason alone does not prove injectivity of completion/restriction on this cover: even an etale cover X disjoint_union X[1/p] of a proper base X has a generic-only component invisible in the formal special fiber. This example diagnoses the inference, not the actual Shimura moduli space. A proof needs a separation/density result for the actual cover and the permitted coefficients. Remove the unsupported claim that the report has supplied a full proof for all R; retain the conclusion as unrefuted.

Correction/status: new.

### E30 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 22, 31, 33; v4 PDF pp. 30; published PDF pp. 23, 33, 35.

Classical kappa_{sigma,i} has b_{sigma,i} entries; its conjugate tuple has a_{sigma,i} entries. The printed terminal indices are reversed and can be out of range. Use the last entries of these actual tuples, or formulate the condition in kappa_p with the conjugation explicitly applied. The unexplained r_i cannot serve as a precise bound. Zero-sized blocks also require an explicit convention rather than indexing entry zero.

Correction/status: new.

### E31 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 33–34; v4 PDF pp. 30; published PDF pp. 35; v1 PDF pp. 28.

R contains Z_p, whose elements algebraic over Q do not lie in one number field. For odd p, each rational prime ell congruent to 1 modulo p has a square root in Z_p by Hensel, giving infinitely many distinct quadratic subfields. Thus the fraction field of the stated integral closure is not a number field. Choose a finite number field of definition instead. Also correct the proposed repair: localization at one prime above p is not generally equivalent to the integral closure of Z_(p), which is semilocal at all primes above p.

Correction/status: new.

### E32 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 11, 35; v4 PDF pp. 31; published PDF pp. 36; v1 PDF pp. 29.

The standing prime hypotheses allow p=2 and K=Q(sqrt(-7)), where 2 splits and O_w=Z_2. Its units have torsion {-1,1}, while the residue-field units are trivial. Thus both the displayed torsion identification and prime-to-p order claim are false. Add p odd to this construction; the integral isotypic decomposition also relies on that restriction. Classify as error rather than gap.

Correction/status: new.

### E33 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 35; v4 PDF pp. 31; published PDF pp. 36.

The adjacent definition and specialization ring use Lambda^o=O-prime[[W]]. The sentence retaining Lambda missed the renaming; v4 p.31 consistently uses the earlier name Lambda.

Correction/status: new.

### E34 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 30–32, 34–35; v4 PDF pp. 31; published PDF pp. 31, 33, 36–37.

A classical form of nebentypus eta has p-adic Delta-character eta|Delta times kappa_p|Delta, by the computation in Section 2.9.4. On the omega branch this forces eta|Delta=omega*(kappa_p|Delta)^-1. With kappa explicitly taken from Section 2.9.1, the printed sign is wrong. The correction must also state how evaluation on the W-character is extended to Delta: it uses omega there, otherwise literal evaluation of a full character with a different Delta-part is zero. Restore the classical weight notation in the target.

Correction/status: new.

### E35 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 36, 38, 49; published PDF pp. 38, 40, 51–52.

F is the reflex field; the split local factors in (35) are indexed by places of K^+. The displayed permutation matrix belongs to the corresponding GL_{2n}(K_w) factor of U(W)(Q_p), and the tuple belongs to G4(Q_p) with similitude one. Correct these coefficient-field labels and put the prime-to-p compact subgroups in G_i(A_f^p).

Correction/status: new.

### E36 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 36–39; v3 PDF pp. 30–31, 34–36; published PDF pp. 38–41.

The v5 and published Section 3.2.1 display restriction maps, with no preceding isomorphisms of the kind invoked in 3.2.3. The referenced similitude-component decompositions occur in v3 Sections 2.11 and 3.1.5/3.2.1, read at pp.30-31,34-36, and were removed. Delete the dangling sentence or restore a precise componentwise statement with its hypotheses; this is an editorial omission, not evidence that all restriction maps are isomorphisms.

Correction/status: new.

### E37 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 40; published PDF pp. 42.

The immediately preceding paragraph explicitly names res_{p,J0prime,h0} for p-adic forms and the diagram uses that symbol on its right arrow. Part (ii) applies to a p-adic f but drops p. Restore the subscript.

Correction/status: new.

### E38 — confirmed; gap; affects the proof

Checked: v5 PDF pp. 40–41; published PDF pp. 42–43; moonen04 PDF pp. 23–24.

The cited Moonen Proposition 2.3.12 (arXiv math/0203288, pp.23-24) supplies canonical lift/CM facts for p-divisible groups. It does not itself establish that the maps of CM Igusa towers meet every finite-level frame or a separation theorem for functions with all the stated p-adic coefficient rings. Density on the underlying ordinary locus and finite rank over an Iwasawa algebra do not by themselves supply those steps. The report's claimed complete repair also assumes the needed frame coverage and says general R follows by devissage without justification. Confirm the gap in the presented proof, retain the theorem as unrefuted, and mark the missing steps explicitly.

Correction/status: new.

### E39 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 44–45, 47; v4 PDF pp. 40; published PDF pp. 46–47, 49.

Unfolding gives an integral of F(u)<pi(u)v,vdual>, with F(u)=f(u,1). Fixing f does not make this functional invariant: simultaneous translation of the two vectors conjugates the test function. At a finite place with dim(pi)>1 choose v and vdual orthogonal but <pi(g0)v,vdual> nonzero, and choose F supported on g0K for K fixing v. The local integral is nonzero. The open-cell model permits such a compactly supported section. Thus the asserted zero-pairing implication is false. Correct reach to a stated result; the subsequent formula with nonzero denominator may still be used.

Correction/status: new.

### E40 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 45–46; v4 PDF pp. 40–41; published PDF pp. 48.

The preceding line defines phi_chi^flat in pi^flat tensor chi^-1, and the next displayed equality uses precisely that dual vector. Restore pi^flat in the stated domain and integral structure. Correct the original reason: a pairing of pi with itself need not vanish when pi is self-dual; the defect is the wrong domain in the given construction.

Correction/status: new.

### E41 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 42, 45–47, 49–50; v4 PDF pp. 38, 41–42; v1 PDF pp. 36, 39; published PDF pp. 44, 47, 49, 52–53.

The upper-triangular inducing character read in (54)-(55) is chi_w(D) chi_wbar^-1(A)|A/D|^s. In rank one the two valuation ranges give X=beta(varpi)chi_wbar(varpi)^-1 q^(-s-1/2) and Y=beta(varpi)^-1 chi_w(varpi)^-1 q^(-s-1/2), hence I=(1-XY)/((1-X)(1-Y)). With beta=1, q=5, s=1/2, and both chi components equal to i, this is 12/13-5i/13, whereas the printed Euler factors give 12/13+5i/13. Such unitary local data occur for a quartic Dirichlet character composed with a CM norm. This confirms the inverse-character mismatch independently of any base-change orientation for beta. Remove the earlier overclaim that equality is possible only when chi|K+ is trivial: special characters can also make the two expressions coincide.

Correction/status: new.

### E42 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 47–48; v4 PDF pp. 42–43; v1 PDF pp. 39–40; published PDF pp. 49–51.

The section acquires the factor chi(det(1-X))^-1 under the Cayley decomposition, even on a small unit-determinant neighborhood. The listed conditions control the vector stabilizer but not this character. At a split place of residue characteristic 3 take n=1, pi=1, L=3Z_3, chi_w of conductor 9 with chi_w(2)=zeta_3, and chi_wbar=1. The normalized integral is (1+zeta_3+zeta_3^2)/3=0, not the claimed normalized volume 1. Shrink L to trivialize the character and fix w=(-1,1) (or normalize the translated section at 1). This is a false lemma under the literal hypotheses, so classify as error/a stated result.

Correction/status: new.

### E43 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 42, 49–50; v4 PDF pp. 38, 44; v1 PDF pp. 41; published PDF pp. 44, 51–53.

At s=0 take a central element with w-component 1 and conjugate component u, so nu=u. The inducing character requires chi_wbar(u)^n, while (54) gives no such factor. This proves failure on the similitude group independently of the absolute-value convention. For general s, Delta_wbar=nu times transpose(A_w)^-1 supplies the missing product chi_wbar(nu)^n, together with the norm adjustment already described in the correction. On nu=1 the discrepancy disappears. Record reach as the stated membership in I_p, rather than nothing.

Correction/status: new.

### E44 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 49–52; v4 PDF pp. 45; v1 PDF pp. 42; published PDF pp. 52–54.

The relevant nu_i contains chi_wbar^-1, whose conductor (56) does not bound. For p=3,t=1,a=b=1, mu_i=chi_w=1 and chi_wbar a primitive conductor-9 character, X=[[1,0],[1,1]] and gamma2=[[1,3],[0,1]] meet the stated conditions. The D-block changes from 1 to 4, multiplying phi_nu by chi_wbar(4)^-1!=1, while the asserted right side is unchanged. Thus Lemma 4.3.2(i) is false for allowed parameters. Add both conjugate conductors to the bound; this also restores the support/invariance and later extension bounds. Classify the finding as error.

Correction/status: new.

### E45 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 53; published PDF pp. 55–56.

The second Fourier-transform formula integrates the bottom-right block delta and evaluates at D. Its next line uses D correctly. Replace A,dalpha in the first line by D,ddelta; trace(delta transpose(D)) and trace(transpose(delta) D) agree.

Correction/status: new.

### E46 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 53, 55; published PDF pp. 56, 58.

The displayed factorization muprime_w=muprime_a tensor muprime_b immediately forces primes on all the factors defining muprime_a. The inducing character and (61) give the same correction.

Correction/status: new.

### E47 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 57; published PDF pp. 60.

Multiplying the a-block and b-block pairing formulas above (72) gives all factors i=1,...,r(w). The printed upper limit t(w) omits the b-block. The volume factor is unchanged.

Correction/status: new.

### E48 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 57, 134, 137; published PDF pp. 60–61, 141, 144.

Remark 4.3.5 refers to the later identification of test vectors but cites itself. Remarks 8.3.10 and 8.4.8, read in both editions, are the corresponding later statements. Their own local reference slips are separate findings.

Correction/status: new.

### E49 — rejected; misprint; affects nothing

Checked: v5 PDF pp. 55, 57; published PDF pp. 58, 60.

The printed bound C in p^t M is true because Gamma_{a,b} is defined at level p^r and r>=2t. In the displayed decomposition, C=D^-1 k21 is automatically in p^r M. Thus the stronger fact used on the next line already follows from the definition; replacing t by r would improve exposition but does not correct a false statement or a missing assumption. The report mistakes a true weaker bound for an erratum.

Correction/status: Not an error: rejected by REV-ERRATA-PAPER-EISCHEN-HARRIS-LI-ETAL-20.

### E50 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 58; v4 PDF pp. 51; published PDF pp. 61.

A basis of the Kw-vector space Vw identifies its automorphism group with GL_n(Kw). The coefficient Vw in GL_n(Vw) is a type error; the immediately adjacent second factor is correctly GL_n(Kw).

Correction/status: new.

### E51 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 50, 58; v4 PDF pp. 52; published PDF pp. 53, 61–62.

The notation slips in Zp are as reported, but the same finding includes a substantive missing scalar. Formula (55) contributes chi2(det g) to a section. Right translation by the permutation in (73) changes this to chi2(det g)chi2(det gamma), and det gamma=(-1)^b. There is no hypothesis forcing chi2(-1)^b=1. Classify the complete finding as error/a stated result, and keep its distinct phase separate from the coordinate and Fourier-sign errors E52/E57.

Correction/status: new.

### E52 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 42, 50, 52, 58–59; v4 PDF pp. 46, 51–52; v1 PDF pp. 43, 46–47; published PDF pp. 44, 52, 54, 61–62.

The bases in 4.1.1 give (Y1,Y2)=(X1+X2,X2-X1), so (58) becomes vol^-1 Phi1((Y2-Y1)/2)Phi2(Y1+Y2). The evaluation on p.59 instead uses the product Phi1(Y1)Phi2(Y2). Independently take n=a=1,b=0 over Q3, chi1=chi2=1 and mu the nontrivial character mod 3, pi|units=mu^-1. On the literal support set z1=x(1-u)/2 in units and z2=x(1+u) in 3^-1 units. Then u=(z2-2z1)/(z2+2z1) lies in 1+3Z3, all norm weights are constant, and the Jacobian has constant absolute value. Integration contains the zero factor integral_units mu(z1)dz1. The product section instead gives the nonzero Gauss average -i/sqrt(3). This is a discrepancy of integrals, not just notation. Remove the inherited assertion that all of 4.3.6-4.3.10 is otherwise correct: E53/E57 remain separate problems.

Correction/status: new.

### E53 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 51, 55–56, 60–62; v4 PDF pp. 53–55; published PDF pp. 54, 58–59, 63–65.

The support gives level t for A1,D2 while (66)/(69) give level r>=2t. This is insufficient for the first simplification; the later discarded matrices in 1+p^(2t) additionally require r<=2t. The actual pointwise statement fails: n=a=2,b=0, partition 1+1, trivial inducing characters in the irreducible normalized principal series Ind_B(1,1), t=1,r=2. Take phi supported on B Iw2 and phitilde on B transpose(Iw2), with value 1 at 1. On K the latter is the indicator that k22 is a unit. For A1=[[1,0],[p,1]], A2=diag(p^-1,p), the bottom-row ratio of k A2^-1 A1 is p+p^2 k21/k22, outside p^2; hence the shifted coefficient is zero. Without A1 the ratio is p^2 k21/k22 and the integral is strictly positive. The Fourier coefficient at A2 is -(p-1)/p^2, obtained by summing the nontrivial additive character over a in units while d-bc/a is a unit. Finite diagnostics at p=3,5,7 confirm the ratios and coefficient. The report has not proved that the integrated corollary survives all these defects; delete that assurance.

Correction/status: new.

### E54 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 60, 62; v4 PDF pp. 54–55; published PDF pp. 64–65.

The last display on p.60 drops both scalar Fourier factors from Phi2; they reappear in J1,J2 immediately before and after. Restore Phi^(1)(A2)Phi^(4)(D1) and the w index on pitilde. This editorial fix does not resolve the separate invariance error E53.

Correction/status: new.

### E55 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 60, 63; v4 PDF pp. 56; published PDF pp. 63, 66.

Every matrix in this calculation is at the fixed place w. Products over all places are incompatible with the local matrix spaces and repeat the correctly typed list in Proposition 4.3.7 incorrectly. Remove those products and restore the w on Gamma_a,w and Gamma_b,w.

Correction/status: new.

### E56 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 53, 56, 64; v4 PDF pp. 57; published PDF pp. 56, 59, 68.

The second vector transforms by inverse muprime_b under gamma2, so both scalar factors must carry primes. With those primes the next equality follows from nu and muprime. Write chi2(det D) for the scalar character.

Correction/status: new.

### E57 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 53, 62, 64–65; v4 PDF pp. 57–58; published PDF pp. 56, 65, 67–69.

With the e_w Fourier transform used in (85), I2 is the Godement-Jacquet integral for Pi=dual(pi_a) tensor chi1^-1. Its dual integral is Vol(X1) times the pairing, so the coefficient is 1/gamma(s+1/2,Pi,e_w). Replacing inverse epsilon by epsilon at the dual argument requires the central sign of pi_a tensor chi1. Independent Tate test: Q3, n=a=1, b=0, chi1=chi2=1, pi=the quadratic character mod3, s=0. The negative Fourier transform of mu*1_units at a/3 is mu(a)(-i/sqrt(3)), hence I2=-i for unit multiplicative volume one. The printed epsilon(1/2,mu,e_w) is +i. The finite Gauss-sum diagnostic verifies ratio -1. Changing the additive character instead changes I1 in general; it is necessary to state a consistent convention.

Correction/status: new.

### E58 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 45, 57–58, 64–66, 78, 137–138, 144–145; v4 PDF pp. 57–58, 69, 133–134; published PDF pp. 47, 60–61, 67–69, 82–83, 144–145, 152–153.

Equation (51) defines Iw=Zw/pair, and the theorem computes Zw=L*Vw*pair. Therefore (83) and 4.6.1 insert one pairing too many. Scaling a local vector already shows the false homogeneity: Iw is unchanged while their right side scales. The extra pairing is inherited in 4.6.2 and the values of 9.1.8/9.2.1; their cited formula cannot produce 9.2.2 without deleting it. The latter theorem has the normalization consistent with Iw=L*Vw. This establishes only consistency of this normalization, not validity of the main theorem after the other independent corrections.

Correction/status: new.

### E59 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 65; v4 PDF pp. 58; published PDF pp. 68–69.

The epsilon-product identity uses omega_{pi_a tensor chi1}(-1)=omega_{pi_a}(-1)chi1(-1)^a. In rank one an odd chi1 shows the omitted factor cannot be discarded. In addition, the rewritten I2 loses its pairing and V loses its index. Correct the reach of the full finding: it includes a false scalar identity, not only harmless notation. After E57 is applied, the correct expression in inverse-epsilon form has no extra central sign.

Correction/status: new.

### E60 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 55, 57, 65–66; v4 PDF pp. 58; published PDF pp. 58, 60, 69.

With the vectors normalized in 4.3.4, (72) gives pair=Vol(Gamma_R) times fixed constituent pairings. The asserted right side is thus L times [Gamma_R:Gamma_R intersect transpose(Gamma_R)] times those pairings. The index is q^(r dim N_R), not constant. For GL2 upper Iwahori the exact finite counts give p,p^2,p^3 at r=1,2,3. The product volume Vw itself is constant by the integral Gauss-cell decomposition. The later trace-compatible normalization of vectors is different and does not validate this assertion with the currently specified vectors.

Correction/status: new.

### E61 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 12, 66; v4 PDF pp. 59; v2 PDF pp. 58; v3 PDF pp. 58; published PDF pp. 69.

Section 1.4 defines GU^+(V) over K^+, and the real factors here are indexed by embeddings of K^+. Its restriction of scalars is therefore from K^+, not K. Correct the earlier-version locator: the matching v2/v3 sentence is on p.58, not p.59.

Correction/status: new.

### E62 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 69, 76, 84; v4 PDF pp. 61; published PDF pp. 72–73, 80.

For fixed chi_sigma, replacing (m,a,b) by (m-k,a-k,b-k) keeps both exponents -m+a,-m+b unchanged, but multiplies the displayed function by nu^(-3nk). Taking any positive real scalar similitude with nu !=1 disproves the stated factorization independence. The assertion is correct after restriction to nu=1. Remark 4.5.3 acknowledges omissions, but does not make this explicit assertion on GU true; its use in Definition 5.3.2 also needs the corrected central convention.

Correction/status: new.

### E63 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 70; v4 PDF pp. 62; v2 PDF pp. 61; v3 PDF pp. 61; published PDF pp. 73.

The character subscript is the archimedean embedding sigma throughout this construction; s is not such an index. All compared versions retain this slip.

Correction/status: new.

### E64 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 72; v4 PDF pp. 64; v2 PDF pp. 64; v3 PDF pp. 64; published PDF pp. 76.

The matrices have size u and the displayed partition has u parts. The leading minors exist for 1<=i<=u. Both occurrences of the unrelated r must be u.

Correction/status: new.

### E65 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 73; v4 PDF pp. 64; published PDF pp. 76.

The differential operator is indexed by the two sequences at the same embedding sigma. The isolated s subscript on the second sequence is erroneous.

Correction/status: new.

### E66 — confirmed; gap; affects the proof

Checked: v5 PDF pp. 71–73; v4 PDF pp. 63–65; published PDF pp. 74–77; harris86 PDF pp. 38–39, 44–48.

PBW gives each summand as S(p3^+) tensor its full minimal K3-type, not just its highest-weight line. Thus decomposition (93) alone does not put every component of D(kappa,chi)v(chi) in S(p3^+) times the selected highest-weight vector. The cited Harris 1986 Lemma 7.3.2 (printed pp.359-360, PDF38-39) proves rationality and uniqueness of a decomposition of induced modules; its Section 7.11 (printed pp.365-369, PDF44-48) constructs vector-bundle-valued differential operators. Neither cited passage supplies the stronger scalar-operator cyclicity claimed here. Confirm this precise proof gap, without asserting a counterexample to the particular corollary or a completed repair of Section 8.

Correction/status: new.

### E67 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 72, 74; v4 PDF pp. 63–64, 66; v2 PDF pp. 65; v3 PDF pp. 65; published PDF pp. 75, 78.

A leading i-by-i determinant has degree i. Consequently the degree is sum_i i(r_i-r_{i+1})+sum_j j(s_j-s_{j+1})=sum_i r_i+sum_j s_j. For example r=(1,1) produces Delta2 of degree 2 but the printed difference sum is 1. The v2/v3 occurrence is p.65, not p.66.

Correction/status: new.

### E68 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 75, 145; v4 PDF pp. 66, 134; v2 PDF pp. 66, 98, 131; v3 PDF pp. 66, 98, 130; published PDF pp. 79, 153; mok PDF pp. 32–36.

Cuspidality on a unitary group does not impose a simple global parameter. The local and global packet statements in Mok Theorems 2.5.1-2.5.2 (PDF32-35) allow endoscopic discrete-series members with a generic parameter phi1 boxplus phi2; their standard transfer is the corresponding noncuspidal sum. Holomorphic/anti-holomorphic discrete series at infinity do not remove that possibility. The paper itself separately requires cuspidal base change later. Remove the original unverified particular examples of CM forms and replace the overbroad corrected statement by a precise additional stable-cuspidal parameter assumption. In the tempered generic setting the transfer is an isobaric sum; no universal temperedness assertion is needed for this finding.

Correction/status: new.

### E69 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 75, 134; v4 PDF pp. 67; published PDF pp. 79, 141.

A Hodge polygon has the sorted Hodge numbers as successive slopes, so its ordinate at i is their cumulative sum (and it starts at (0,0)). The printed ordinates are individual p_i in the unsorted order of (106). For n=2,a=b=1,kappa=2,kappa^c=-2 the listed p-values are 2,2,-1,-1, while the correct ordinates are 0,-1,-2,0,2. The same cumulative-sum correction is needed in 8.3.11 before its Newton comparison.

Correction/status: new.

### E70 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 66–67, 76–77; v4 PDF pp. 59, 67–68; v2 PDF pp. 59; v3 PDF pp. 59; published PDF pp. 70–71, 80–81.

In v5/published (88)/(90) put W_tau^dual in D and W_tau in Dc, whereas 4.4.14 uses W_tau^dual for Dc and its dual weights. Also 4.5.4 calls for a highest vector while 4.5.6 chooses the minus vector. Correct the report version history: v4 and v2/v3 used Dflat with W_tau and Dc with W_tau^dual, so their minimal-type convention itself is consistent with 4.4.14; only the highest/lowest wording conflict persists there. A consistent global convention must be chosen before using the pairing.

Correction/status: new.

### E71 — confirmed; gap; affects the proof

Checked: v5 PDF pp. 69, 76, 83–84; v4 PDF pp. 61, 67; published PDF pp. 72, 80; eischen-liu20 PDF pp. 9–11.

The algebraic factorization chi=norm^mu chi0 and the unitary factorization chi=norm^m chiu have different exponents in general: m=mu-(a+b)/2. Nevertheless the same m and chi symbols are used for the archimedean model and its induced-representation placement, with an additional -n/2 shift in Lemma 4.5.2. Section 5.3.1 acknowledges the different factorizations but omits the conversion. The section (107) therefore needs an explicit character-and-parameter calculation to identify it in the global induced representation. This is a gap in the presented normalization, not a proof here that no consistent parametrization exists. Eischen-Liu Section 2.4 provides an explicit convention for a related classical section, which can guide a repair but is not automatically an identification with the literal GU formula.

Correction/status: new.

### E72 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 12–13, 76–77; v4 PDF pp. 67–68; published PDF pp. 80–81; garrett06 PDF pp. 4, 11; harris08 PDF pp. 27, 31; eischen-liu20 PDF pp. 4–7, 9–11.

The original report overlooks a relevant part of the cited reference: Harris 2008 Remark 4.4(iii) and Section 5 (PDF27,31) explicitly compensate Garrett's pi^(ab) by a measure choice. Garrett's qualitative theorem (PDF4,11) is local and not restricted to imaginary-quadratic global fields, so the claimed separate general-CM obstruction should be removed. The actual remaining defect is compatibility with EHLS Hypothesis 1.4.4, which fixes only the product of archimedean measures. With at least two real places, rescale their measures by pi and pi^-1; every listed measure condition is preserved, whereas the nonzero individual I_sigma is multiplied by pi. The assertion of algebraicity for all permitted choices cannot survive both choices. Specify each local normalization, not merely the adelic product. This affects the literal algebraicity assertion; no contradiction to Garrett's normalized theorem is claimed.

Correction/status: new.

### E73 — confirmed; misprint; affects a stated result

Checked: v5 PDF pp. 64–65, 78, 145; v4 PDF pp. 57–58, 69, 134; v2 PDF pp. 69; v3 PDF pp. 69; published PDF pp. 67–69, 82, 153.

Equation (83) names the displayed local ratio L(s+1/2,ord,...). Section 4.6 defines Lp(x,ord) as the product of L(x,ord) but then inserts x=s in the same global formula with L^S(s+1/2). Thus its argument is shifted by 1/2, and specializing s=m preserves the mismatch in 9.2.2. It can be fixed by renaming Lp or changing its argument, but the definition and uses must agree. The infinity labels denote the same previously defined product.

Correction/status: new.

### E74 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 45–48, 64, 77–78, 84, 144–145; v4 PDF pp. 69, 133–134; published PDF pp. 47, 49–51, 67, 81–82, 152–153.

The factor D(chi) includes all finite places, but the p-integral contains no compensating Dp and replaces, rather than multiplies, the standard p-Euler factor. At a non-p bad place the formula requires the larger Sprime covering representation, character and field ramification. Moreover D(chi) is fixed by m, while the printed theorem uses variable s and alternates between chi and its unitary part. These are independent bookkeeping failures visible by multiplying the local factors in (51). The original correction silently reused the printed unramified formula, which E41 independently refutes, so it must be qualified: a fully corrected global L-function formula also requires resolving that character convention.

Correction/status: new.

### E75 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 79; v4 PDF pp. 78; published PDF pp. 83.

Take X to be a point and R=Z_p[[T]] with the stipulated p-adic topology. Then Lambda=R has the infinite discrete quotient F_p[[T]], so is not compact. Compactness follows if R itself is compact. This refutes the explicit assertion, even though no later use of compactness was identified.

Correction/status: new.

### E76 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 81–82; v4 PDF pp. 79–80; published PDF pp. 85–86.

The displayed tame levels are K_i^p. The nebentypus of the specialization varies with chi, whereas the printed target without a nebentypus is not defined in 2.9. Use the full ordinary space as the ambient target, retaining the specified weight/nebentypus for each specialization. The functional ell must likewise be defined on the appropriate full cuspidal ambient space.

Correction/status: new.

### E77 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 82; v4 PDF pp. 80–81; published PDF pp. 86.

Pullback along sh has target functions on its domain T_H3, not T_H1. The shift earlier was a fixed character, so as before is also inaccurate.

Correction/status: new.

### E78 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 82–83, 113–114; v4 PDF pp. 81; published PDF pp. 86–87.

Section 7.4 defines C_r as functions on T/T_r. A nontrivial algebraic character is not locally constant. Lemma 7.4.2 itself correctly uses C_r times rho^upsilon. The unitary restriction also directly contradicts the following paragraph allowing nonunitary classical chi.

Correction/status: new.

### E79 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 25, 83, 98; v4 PDF pp. 96; published PDF pp. 87, 102.

Equation (23) defines the unnormalized double cosets. The weight-normalized U used in the projector is explicitly defined only in 6.6, where its scalar is |kappa-prime(t_wj)|_p^-1. Replace the cross-reference accordingly.

Correction/status: new.

### E80 — rejected; gap; affects nothing

Checked: v5 PDF pp. 73, 83; v4 PDF pp. 81; published PDF pp. 77, 87.

The paragraph immediately preceding (110) explicitly cites (97) when introducing rho and the involution. Equation (97) supplies kappa=rho+(alpha,beta) and explains their mutual determination. Therefore the claim that this relation is supplied only in Section 8.2 is false. Repeating the definition would improve exposition but is not an established source gap.

Correction/status: Not an error: rejected by REV-ERRATA-PAPER-EISCHEN-HARRIS-LI-ETAL-20.

### E81 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 73, 83; v4 PDF pp. 81; published PDF pp. 77, 87.

The chosen algebraic factorization uses mu and chi_0, whereas m and chi_u are introduced only in the next paragraph. Correct those labels in the cone and independence sentence. This algebraic-weight observation does not repair the separate GU-function independence failure in E62.

Correction/status: new.

### E82 — confirmed; gap; affects the proof

Checked: v5 PDF pp. 78, 84, 145; v4 PDF pp. 82; published PDF pp. 82, 88, 153.

The factor D_v is an inverse Euler polynomial. Such inverses need not preserve integral measures: for n=1,p=3,q_v=7 and trivial specialization, 1-q_v^-1=6/7 is a nonunit in Z_3 and its inverse is 7/6. Thus normalization does not follow formally from multiplying an arbitrary integral measure. Cancellation by this specific Eisenstein measure could still make the result integral, but the stated step supplies no divisibility argument. Do not claim an actual nonintegral Eisenstein specialization from this scalar example alone.

Correction/status: new.

### E83 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 84–85; v4 PDF pp. 82–83; published PDF pp. 88–89.

The unnormalized identity and (113) in v5 both have e_kappa on each side, but the adjacent normalized variant omits it. In v4 both variants omitted the projector consistently, so this particular mismatch was introduced in v5.

Correction/status: new.

### E84 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 83–84; v4 PDF pp. 82; published PDF pp. 87–88.

S is defined from prime-to-p levels and excludes p, so its unramified-vector condition literally includes p even when chi is ramified there. Moreover the conductor N_0 is independently allowed. Those ramified induced representations have no spherical vector of the asserted kind. Restrict the first condition away from p and enlarge the bad set to cover all other ramification.

Correction/status: new.

### E85 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 84–85; v4 PDF pp. 82–83; published PDF pp. 88–89.

Definition 5.3.2 includes one scalar B at every archimedean place, while (112) uses the scalar-free J. Linearity of the Eisenstein series and differential operator therefore leaves a factor product B in (113). Renormalizing all B to 1 also requires checking the chosen measure and its integrality; it is not an automatic harmless change.

Correction/status: new.

### E86 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 84–85; v4 PDF pp. 82–83; published PDF pp. 88–89.

The archimedean factors run over the CM type Sigma, not embeddings of the reflex field. The arguments chi versus chi_u and the J subscript alternate within the definition. Use one explicit factorization throughout. Remove the original appeal to unconditional factorization independence on GU, which E62 refutes and E71 requires to be reconciled.

Correction/status: new.

### E87 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 86; v4 PDF pp. 86; published PDF pp. 91.

The shorthand concerns degree i, not degree zero. Crucially the published p.91 already has H^i in both places. Confirm the v5 typo, but remove the report assertion that it survives verbatim in print.

Correction/status: corrected in the published version, Section 6.1.2, p.91 (2020), DOI 10.1017/fmp.2020.4.

### E88 — confirmed; gap; affects the proof

Checked: v5 PDF pp. 87; v4 PDF pp. 87; published PDF pp. 91.

The draft claims equality for every i without an argument covering the middle degrees. The published equation (114), p.91, explicitly adds for i=0 or d, exactly the proposed restriction. Confirm the draft proof gap without asserting that the unrestricted mathematical statement is false; mark it corrected in the version of record.

Correction/status: corrected in the published version, Section 6.1.2, p.91 (2020), DOI 10.1017/fmp.2020.4.

### E89 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 22–23, 86, 88; v4 PDF pp. 85, 87; published PDF pp. 90, 92.

With d the actual dimension, the center t maps to (t^2,(tI)); the printed character then evaluates to t^(plus-or-minus 2d), although adjoint tangent representations have trivial central action. Directly the determinant of Hom(Lambda_0,sigma,Lambda_0,sigma^dual) contributes h0^(-a_sigma b_sigma) det(h_sigma)^a_sigma det(h_sigma-c)^b_sigma. Multiplying over the CM type gives exponents a_sigma, not 2a_sigma. The published paper separately drops the factor 1/2 in its dimension formula (new E165); using that incorrect d would square the entire correct character and does not rescue E89.

Correction/status: new.

### E90 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 28, 87–88; v4 PDF pp. 87; published PDF pp. 29, 91–92.

Section 2.7 identifies Lie(P0) with k+p^+, whereas Section 6 identifies it with k+p^-. These cannot both hold for the same decomposition. The printed canonical-weight sign follows the earlier choice, so the original assertion that 2.7 is likely the slip is not justified.

Correction/status: new.

### E91 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 88–90; published PDF pp. 92–94.

The defined i_kappa-star has target Hom(wedge^d p^-,W_kappaD), as also used by (122). The plus in (117) and its stray tensor sign are transcription slips.

Correction/status: new.

### E92 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 90; published PDF pp. 94.

The first coordinate of the function variable is h0, which appears on the right of the same expression.

Correction/status: new.

### E93 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 15, 42, 90–91; v4 PDF pp. 90; published PDF pp. 95–96.

For the left action of G on V in 2.1 and the endomorphism beta taking the old basis to the chosen basis, column matrices satisfy bar(g)=nu D^-1 g^-T D and g=beta gprime beta^-1. Hence M=D^-1 beta^-T beta^-1 gives bar(M)=M^-1 and M^-1 bar(g)M=nu beta gprime^-T beta^-1, as required. The printed D instead introduces D^-2 inside that conjugation and fails when D^2 does not commute with beta beta^T, e.g. D=diag(1,3), beta=[[1,1],[0,1]] at p=5. Section 4.1 explicitly adopts a right action on W for its separate block calculation; do not confuse that local convention with the left endomorphism/basis convention here. Also correct the report quotation: the middle identity of (125) contains G(Z_p), not its conjugate.

Correction/status: new.

### E94 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 91–92; v4 PDF pp. 90–91; published PDF pp. 96–97.

The central factor nu(k)^-1 away from p is omitted in the asserted level equality. At a split auxiliary prime take K={(nu,A):nu in Z_l^x,A in Gamma_1(l)}. In dual coordinates bar(K) has B/nu in Gamma_1(l)^-T, whereas K^dagger has B in Gamma_1(l)^-T with independent similitude. Choosing nu nontrivial modulo l and B=I distinguishes them. One may impose an extra neat level at another prime without changing this counterexample. The Shimura map g to bar(g)delta and the dagger map must therefore have their levels distinguished.

Correction/status: new.

### E95 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 93–94; published PDF pp. 98–99.

K_h contains the positive split center and cannot have finite Haar volume. The real center is R_{>0} times the compact CM norm-one torus, not just R^x. The intended measure decomposition must first quotient that positive center. The sentence following (133) and the reference to its dg version also contain the stated slips.

Correction/status: new.

### E96 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 94–95; published PDF pp. 99–100.

The normalized pairing was defined with the volume of I_r^0 and subscript K_r; the trace identity compares levels r and rprime. Its ratio follows from [I_r:I_rprime] and [I_r^0:I_r] exactly as the following displayed volume identity says.

Correction/status: new.

### E97 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 22–23, 28, 88, 93–94, 96–97; published PDF pp. 92, 98–99, 101–102.

Right translation on W_kappa makes a real central t act by t^a(kappa). A diagonal invariant in pi_infinity tensor W_kappa therefore forces xi_pi(t)=t^-a(kappa). Likewise sections satisfy f(gu)=u^-1 f(g), so norm(nu)^-a is a section of L(kappa), not its dual. The contraction in (133) scales by t^-2a, requiring norm(nu)^+a for center invariance. The printed signs thus affect the literal character and pairing assertions; describing their effect as nothing understates the issue. A global convention change can repair them but must be carried through all twists.

Correction/status: new.

### E98 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 96; published PDF pp. 101.

Equation (143) concerns the local representation at ell. Both its central character and its contragredient must carry that local subscript.

Correction/status: new.

### E99 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 97; published PDF pp. 102.

The dual basis begins with w_1^dual, the pairing needs a scalar target, and 4.1.6 is a remark, not an equation. The omega-versus-w slip is already corrected in the published text, while the other listed slips remain.

Correction/status: partially corrected in the published version, p.102: omega_i replaced by w_i; the other listed slips remain.

### E100 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 98; v4 PDF pp. 96; published PDF pp. 103.

The domain Hecke algebra is generated by U^- with weight kappa; kappaD is the target weight. The printed source generator therefore has the wrong subscript.

Correction/status: new.

### E101 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 91, 98; v4 PDF pp. 90, 96; published PDF pp. 96, 103.

Away from p the dagger element is nu(g)^-1 bar(g). The associated central Hecke operator is generally nontrivial: it acts through the local central character. Thus the asserted last equality drops an actual factor. A unit similitude suffices only when that central unit lies in the level (as at the good hyperspecial places under discussion); it is not a general assertion for arbitrary tame levels.

Correction/status: new.

### E102 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 99, 103–106, 108, 111–112, 115–117, 120; published PDF pp. 104, 108–111, 114, 116–118, 122–123, 127.

Checked each component against its defining module, ring, index or map. Confirm (a)-(n), with revised readings for (i) and (n). Reject constituent (o): Theorem 7.3.1 is explicitly an immediate consequence of 7.2.1, so crediting it to Hida is not an erroneous reference. The claim that every slip survives publication is false: (d) already reads a-ord on published p.109. The v5 K^r and blackboard-bold R slips were checked visually. In (n), Lemma 7.5.1 expressly uses Section 6.6 notation, where pi is holomorphic; the footnote in Section 7.3 warns about the main theorem, not every paragraph of Section 7.

Correction/status: partially corrected in publication: constituent (d) is corrected on p.109; constituent (o) is rejected in this review.

### E103 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 100; v4 PDF pp. 97–98; published PDF pp. 105.

Localization of a finite-dimensional module at an eigencharacter gives its generalized eigenspace. True eigenspaces need not agree. Independently, in normalized Ind_B^GL2(1,1), the compact-model coordinates at w, lower(p), lower(p^2),1 on Gamma_0(p^3) give U/sqrt(p) matrix [[1,(p-1)/p,0,0],[0,0,1,0],[0,0,0,1],[0,0,0,1]]. This follows by summing right translates by [[p,i],[0,1]] for i modulo p. Its zero eigenspace has dimension 1 and generalized zero space dimension 2 (exact checks at p=3,5,7). The same nilpotent old-space block persists for nonzero unramified inducing parameters; scalar weight normalization does not remove it. Thus the printed identification mixes two different spaces.

Correction/status: new.

### E104 — confirmed; gap; affects the proof

Checked: v5 PDF pp. 101, 128, 130; v4 PDF pp. 98; published PDF pp. 106.

A nested sequence of spaces of dimension at most one need not be constant before its first nonzero term. Theorem 6.6.9 alone therefore does not give the asserted equality for every rprime>=r. Lemma 8.3.2 and Corollary 8.3.3 explicitly state eventual independence, r sufficiently large. The original correction incorrectly describes the ordinary vector as the characteristic section supported on BI_r; 8.3.2 only says its support contains BI_r (the supported section occurs on the dual side in 8.3.4).

Correction/status: new.

### E105 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 99, 101; v4 PDF pp. 98; published PDF pp. 104, 106.

The nebentypus version of Serre duality has target weight kappaD, just as the immediately preceding version without nebentypus and Lemma 6.6.2 do.

Correction/status: new.

### E106 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 101, 126–130; v4 PDF pp. 98; published PDF pp. 106.

Any representation includes a direct sum of two ordinary representations, immediately disproving the stated bound. Even for irreducible admissible representations the weight condition matters: in the split GL2 factor with a=b=1 take kappa_sigma=1,kappa_sigma-c=0, hence kappa_norm exponents (0,1). At p=5 let the unramified normalized inducing characters have values p^-1/2 and 2p^-1/2. Their ratio is not |.|^plus-or-minus-1, so the principal series is irreducible. On its two Iwahori-fixed vectors normalized U_1 has eigenvalues 1,2 and normalized U_2 is 2; both vectors are ordinary. Here kappa_sigma+kappa_sigma-c=1<2. Section 8.3 imposes irreducibility and (166), absent from 6.6.9. The local statement must be restricted; no global weight-one realization is needed for this local counterexample.

Correction/status: new.

### E107 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 102; v4 PDF pp. 99; published PDF pp. 107.

K_s is not the level fixed in Lemma 6.6.10; every surrounding definition uses K_r.

Correction/status: new.

### E108 — confirmed; gap; affects the proof

Checked: v5 PDF pp. 102–106; v4 PDF pp. 99–102; published PDF pp. 107–110, 112.

A finite algebra over a non-Henselian DVR can acquire a localization that is not finite over that DVR. For example Z_(5)[i] localized at one prime above 5 contains arbitrarily high inverses of a generator of the other prime. One can include an R-valued eigencharacter by taking the finite order {(a,b) in R x R[i]:a mod5=b mod(2-i)} and localizing at the common residual character. Its second factor still has this failure. This is an algebraic obstruction to the stated lattice argument, not an exhibited automorphic counterexample. The complete-coefficient setting adopted later removes this particular obstruction. Remove the blanket assurance about every later pairing until its localized module is identified.

Correction/status: new.

### E109 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 95–96, 103; v4 PDF pp. 100; published PDF pp. 100, 108.

The definition in 6.5.1 assigns type (kappa,K_r) to the anti-holomorphic conjugate, with coefficient W_kappaD. That is also the coefficient of the next display. The kappa-flat type instead refers to switching V to -V.

Correction/status: new.

### E110 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 102–105, 120; v4 PDF pp. 100, 102; published PDF pp. 107–110, 127.

Perfect integral duality of the whole localization does not give perfect duality of saturated eigenspace lattices. In T={(a,b) in O^2:a=b mod varpi^n}, S=T and H=Hom_O(T,O), the first eigenspace lattices are O(varpi^n,0) and O pr_1. Their pairing has image varpi^n O, although evaluation S x H is perfect. This is exactly the congruence obstruction discussed by 6.7.3 and 7.5.2, so the two printed perfectness assertions cannot be justified in the same way. The defect of perfectness is controlled by the congruence module; do not identify every higher-rank pairing image with the congruence ideal without the additional freeness hypotheses.

Correction/status: new.

### E111 — rejected; gap; affects nothing

Checked: v5 PDF pp. 105, 107; v4 PDF pp. 102–103; published PDF pp. 110–113.

The paragraph immediately before Definition 6.7.2 explicitly identifies the orthogonal complement with the intersection with the other generic eigenspaces. That spectral description extends to a module without choosing a new pairing, and for M=T it is precisely ker(lambda_pi). Thus the objection that a pairing must be supplied even for the application M=T is not established. One may spell out the spectral convention and finiteness/torsion hypotheses, but the displayed extension has the indicated standard meaning in its actual use.

Correction/status: Not an error: rejected by REV-ERRATA-PAPER-EISCHEN-HARRIS-LI-ETAL-20.

### E112 — confirmed; misprint; affects a stated result

Checked: v5 PDF pp. 104, 106; v4 PDF pp. 101–103; published PDF pp. 110–112.

Lemma 6.7.6 repeats the untwisted lattices, pairing, and L labels from 6.7.1 despite its preceding definition of a twisted lattice. Insert the twisted objects; otherwise the displayed modules have no chi dependence at all. This identifies period ideals, not canonical generators, so the original claim that the generators must literally be equal was too strong. The corrected twisted spaces must also have the appropriate twisted nebentypus and level (new E166).

Correction/status: new.

### E113 — confirmed; gap; affects the proof

Checked: v5 PDF pp. 106–107, 145; published PDF pp. 111–113, 153.

Smoothness of the character parameter space alone does not compare the integral coherent-cohomology lattices at different twists. A compatible Hecke-module isomorphism, or a congruence-ideal argument under Gorenstein/freeness hypotheses, is needed. Correct the original proposed repair: a common nonzero scalar multiplying both lattices does not change their congruence quotient, so the CM period need not itself be a p-adic unit for that argument. Also c(pi,chi) is only defined up to a unit; literal equality needs compatible generator choices. The final theorem retains chi in c and its ratio cancels algebraically, so this gap alone does not refute that interpolation identity.

Correction/status: new.

### E114 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 107; v4 PDF pp. 103; published PDF pp. 112–113.

The localized integral algebra is local, so its generic factors cannot be indexed by different maximal ideals of that integral algebra. They are the factors of T_E. The displayed supremum is an integer exponent: projecting the lattice to E_1 gives varpi^-m times its intersection with E_1, hence quotient R/varpi^m and annihilator varpi^m R.

Correction/status: new.

### E115 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 24, 35, 101, 108, 117; v4 PDF pp. 104; published PDF pp. 105, 113, 124.

These Hecke algebras are defined from classical cusp forms at one fixed weight. On a noncompact connected Shimura curve the weight-zero cusp space is zero: a regular function on its proper compactification is constant, and vanishing at the nonempty boundary makes it zero. In a nonzero ordinary cuspidal family the sufficiently regular weight algebra is nonzero, so unrestricted weight independence cannot hold. The cited control statement (34) explicitly restricts weights by (32). Restricting the assertion to that range is substantive, even if later applications use regular weights.

Correction/status: new.

### E116 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 95, 108; v4 PDF pp. 104; published PDF pp. 100, 114.

The trace in (140) is in top degree d and has target level r. The published p.114 corrects H^1 to H^d but still repeats rprime in the second target. Mark this finding partially corrected, not wholly unchanged.

Correction/status: partially corrected in the published version, p.114: H^1 becomes H^d, but the second target still has level rprime.

### E117 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 35, 99, 109–111, 114, 118; v4 PDF pp. 104–105; published PDF pp. 104, 115, 117, 120, 125.

The source specialization at one pro-p character is independent of r, while the level-r algebra allows all finite nebentypus characters at that level. On a nontrivial wild psi-part a diamond t acts by kappa(t)psi(t); thus t-kappa(t) does not vanish and the stated natural map cannot factor through I_kappa. Equation (34) supplies the correctly character-specific control, and 7.4.12 uses a level-dependent ideal. Avoid the original unconditional r=1 alternative at p=2: the earlier identification of the torsion/pro-p decomposition already fails there (E32).

Correction/status: new.

### E118 — confirmed; gap; affects the proof

Checked: v5 PDF pp. 35, 110–111, 118; v4 PDF pp. 105; published PDF pp. 115–117, 125.

Specializing an isomorphism T tensor Ihat=M gives (T/I) tensor Ihat=M/IM. Control of T/I does not identify M/IM with the finite-level dual of cusp forms. That further statement is module control, available in (33)-(34) for regular weights, with the level-r/nebentypus ideal of E117. The original proposed correction still used I_kappa for arbitrary level r, so it was incomplete.

Correction/status: new.

### E119 — confirmed; gap; affects the proof

Checked: v5 PDF pp. 109–112, 117; published PDF pp. 115–118, 124.

The derivation of 7.3.5 uses regular-weight control and does not establish its assertion for every weight. Neither weight independence of Hecke algebras nor the fixed-weight free-module isomorphism supplies control of nonregular classical forms. Restrict to the justified range and the corrected module control of E118. This is an uncovered part of the proof, not an independently constructed counterexample to this proposition.

Correction/status: new.

### E120 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 112; published PDF pp. 118.

The point lambda_pi is a character at the weight of pi and at a level admitting pi. It cannot be used in the displayed specialization for an arbitrary kappa1; the tensor subscripts also mix r and r1. State the specialization at kappa1=kappa and sufficiently large r1, then use that same algebra in both tensor factors.

Correction/status: new.

### E121 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 34, 113–114; published PDF pp. 119–120.

With right translation (t f)(x)=f(xt), one has t(f rho^upsilon)=rho^upsilon(t)(t f)rho^upsilon. Lambda-linearity of the maps in (2) and the stated formula for the equivalence therefore require phi(t f)=rho^upsilon(t)^-1 t phi(f). The printed formula has no action on the output at all. For infinite-order rho it annihilates every locally constant f by choosing t in its stabilizer with rho^upsilon(t)!=1; on a torsion-free separated coefficient module the measure then vanishes. The correction follows directly from the displayed equivalence, independently of any assertion about existence of a nonzero particular automorphic measure.

Correction/status: new.

### E122 — confirmed; gap; affects the proof

Checked: v5 PDF pp. 110–112, 115, 117; published PDF pp. 116–118, 121, 123–124.

Lemma 7.4.9 only compares levels at fixed weight. The construction also depends on free-module trivializations. Hypothesis 7.3.2 does explicitly choose a single big Gorenstein isomorphism and its finite-level specializations, so the report should not claim that this compatibility is wholly absent. The missing part is the comparison of the modules/trivializations at different weights and of the corresponding measure specializations. Theorem 7.1.1 only identifies Hecke algebras, while 7.3.5 displays compatibility in level. Supply module control across weights and make every choice specialize from a single big module.

Correction/status: new.

### E123 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 117; published PDF pp. 123.

The v5 clause refers to an undefined Phi_X. The published paragraph on p.123 omits the clause and ends the displayed isomorphism before continuing with Proposition 7.3.5. Thus the recorded publication correction is verified.

Correction/status: corrected in the published version, Section 7.4.8, p.123: the undefined Phi_X clause is deleted.

### E124 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 107, 120; v4 PDF pp. 103; published PDF pp. 112, 127.

The result numbered 6.7.10 is a lemma, not a corollary; it is the Gorenstein congruence-ideal comparison invoked here.

Correction/status: new.

### E125 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 87, 94, 120–121, 143; published PDF pp. 91, 99, 127.

By definition L_phi(h)=<h,phi>_{kappa,K_r}, and (136)-(137) insert exactly one inverse volume into its Serre integral. Lemma 7.5.3 inserts two on the same single-group domain. No volume appears in the cohomology identification (114). One inverse volume per factor yields the displayed product when a pairing is genuinely doubled, but this observation does not verify the other normalization steps in Section 9. Also the central norm sign must be reconciled with E97.

Correction/status: new.

### E126 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 122–123, 126; v4 PDF pp. 117; published PDF pp. 129–130, 133.

The summation index is kappa-dagger throughout the identity; lambda and kappa-prime are stray names. The composition also requires the intermediate operator to act on the output of theta-hol, not merely on the original V_chi. The repeated composition sign and "on values" are typographical.

Correction/status: new.

### E127 — confirmed; gap; affects the proof

Checked: v5 PDF pp. 122–123; v4 PDF pp. 117; published PDF pp. 129–130; efmv18 PDF pp. 25–26, 32–34.

The identity is asserted as a p-adic version without establishing transfer of the underlying polynomial identity or compatibility with restriction. EFMV arXiv:1511.06771 Lemma 5.2.2 (p.26) gives commuting Serre-Tate differential operators and hence polynomial functional calculus. But Proposition 6.2.4 and Remark 6.2.5 (pp.32-33) restrict commutation with pullback to pure weights and exhibit failure for a nonpure determinant operator. Thus arbitrary restriction compatibility cannot be assumed. The earlier highest-weight generation issue E66 also remains. Remove the original assurance that the missing proof is routine and the result surely correct; this review establishes a proof obligation, not falsity of the particular identity.

Correction/status: new.

### E128 — confirmed; gap; affects the proof

Checked: v5 PDF pp. 123; v4 PDF pp. 117; published PDF pp. 130.

The contraction argument has a definite sign error: if v_p(y)=e>0 then |y|_p=p^-e has p-adic norm p^e>1, whereas the argument needs norm less than one. The normalization is (30), not the unrelated central twist in 2.6.11. Moreover unnormalized Hecke operators need not commute with differentials (U_p theta=p theta U_p in the elliptic q-expansion model). The specific normalized intertwining scalar and compatibility with restriction must be computed. The original proposed exact commutation formula was not proved and is not retained as a verified repair.

Correction/status: new.

### E129 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 72, 124; v4 PDF pp. 63, 84; published PDF pp. 131.

The preceding sentence defines the s sequence, so its successive differences must use s_j-s_(j+1). The r sequence can even have too few entries. The Section 4.4 occurrence was corrected in v5, but this Section 8 occurrence persists in print.

Correction/status: new.

### E130 — confirmed; gap; affects the proof

Checked: v5 PDF pp. 49, 124–125; v4 PDF pp. 84–85; published PDF pp. 131–132; efmv18 PDF pp. 35–37; eis14-published PDF pp. 26; eis15 PDF pp. 20–21, 24–26.

Narrow the finding to matching the actual local data and normalization. EFMV Theorem 7.2.4 (arXiv pp.36-37) explicitly constructs measures for arbitrary signature and applies res after Theta. Both contrary objections in the original reason are rejected. EHLS changes the p-adic Schwartz data and then identifies the resulting Eisenstein series with G without checking the corresponding Fourier coefficients; E52 supplies a concrete coordinate mismatch in that data. Eis14 equation (32), also checked in the published article p.2456/PDF26, is differential covariance, not a verification of this modified local section. A measure theorem for the precise modified data still needs the coefficient/Kummer and normalization comparison.

Correction/status: new.

### E131 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 126, 129; v4 PDF pp. 118, 120–121; published PDF pp. 133, 136.

Direct root count in the order (1,...,a,n,...,a+1) gives exponents n+1-2i for i<=a and 2i-n-2a-1 for i>a. The exponent at a is b-a+1, and the sum is zero. The printed exponent fails already for the upper Borel of GL2. This is a typographical formula error; its contribution to the regularity calculation is repaired in E134.

Correction/status: new.

### E132 — confirmed; gap; affects the proof

Checked: v5 PDF pp. 84–85, 124–126; v4 PDF pp. 85; published PDF pp. 131–133; eis15 PDF pp. 24–26.

Proposition 8.1.3 addresses the differential part only. The passage between the local sections chosen in Definition 5.3.2 and G requires E130, and the scalar and shift remain to be checked. Eis15 Proposition 13 and the following normalization (arXiv pp.24-26) include archimedean constants, discriminants and inverse p-depleted L-factors; G=D^-1 E. They cannot simply be equated to EHLS (108) without tracking parameters and cancellations. E82 further prevents an automatic claim of integral inverses. Remove the assurance that the complete correction is standard bookkeeping.

Correction/status: new.

### E133 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 127, 131–132; v4 PDF pp. 118, 122–123; published PDF pp. 134, 138–139.

The product variable must be j; the tensor factors are indexed by p-adic places, and each local invariant space uses I_(w,r). The final projector is anti-ordinary. The published text p.139 already corrects that last e_w to e_w^-; the other slips remain.

Correction/status: partially corrected in publication, p.139: the final projector is e_w^-; the index slips remain.

### E134 — confirmed; misprint; affects the proof

Checked: v5 PDF pp. 126, 129–130; v4 PDF pp. 118, 120–121; published PDF pp. 133, 136–137.

Canceling alpha in beta_x/beta^x gives |kappa_norm(xtx^-1t^-1)|_p delta(xtx^-1t^-1)^(1/2), the inverse of the printed ratio. Its invariant character is |kappa_norm|_p delta^(1/2), or the inverse of that whole character, not a mixed sign. Combine the root exponents of E131 with m_i=-sum(kappa_(sigma-c,i-a)-a) in the second block. The resulting exponents m_i+e_i/2 strictly decrease in the Borel order (1,...,a,n,...,a+1); the middle comparison is m_a>=m_n, supplied by (166). Only the affected boundary constants should be described as shifted; the original blanket description of all constants is inaccurate. Publication corrects Weil to Weyl but not these formulas.

Correction/status: partially corrected in publication, p.136: Weil becomes Weyl; the character, sign, exponent and index errors remain.

### E135 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 130; v4 PDF pp. 121; published PDF pp. 137.

The Jacquet decomposition (169) has alpha^x delta^(1/2), and the eigenvalue calculation in the same sentence uses that positive exponent. The first negative exponent is a copy slip.

Correction/status: new.

### E136 — confirmed; misprint; affects the proof

Checked: v5 PDF pp. 98, 101, 127, 131–133; v4 PDF pp. 122–123; published PDF pp. 138–140.

The global and local definitions assign opposite powers of the same scalar to the same double-coset operator; the similitude component is trivial here. For the invariant pairing, the adjoint of [ItI] is [It^-1 I], so (170)-(171) require the same scalar on the two adjoint operators. The local inverse-power convention supplies it. This is a convention inconsistency within Section 8; transporting it back to the Serre-dual weight in Section 6 requires that weight conversion, not a blanket change of all anti-ordinary operators.

Correction/status: new.

### E137 — confirmed; misprint; affects a stated result

Checked: v5 PDF pp. 132–133; v4 PDF pp. 123–124; published PDF pp. 139–140.

The second slot of the invariant pairing is in pi_w dual. The proof decomposes that dual space into generalized eigenspaces for the ordinary u^GL, so both the missing dual and the extra minus sign in the statement must be corrected.

Correction/status: new.

### E138 — confirmed; gap; affects the proof

Checked: v5 PDF pp. 132–133; v4 PDF pp. 123–124; published PDF pp. 139–140.

A nonzero eigenfunctional need not remain nonzero on a true eigenspace: for the Jordan matrix [[a,1],[0,a]], ell(x,y)=y is an eigenfunctional and vanishes on ker(U-a). Hence the displayed induction does not follow merely by restricting (170). The stated conclusion does follow from the joint generalized eigenspace argument: the functional vanishes on every other joint character, the required joint generalized space is nonzero, and commuting operators on it have a common eigenvector.

Correction/status: new.

### E139 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 134, 137; v4 PDF pp. 125, 127; published PDF pp. 141, 144.

The referenced lemma concerns ordinary G2 vectors, whereas these remarks require the anti-ordinary G1 and G2 constructions, respectively. The final G2 vector belongs to pi_w-flat. The old numbering in v4 has the same wrong target.

Correction/status: new.

### E140 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 128, 131, 134; v4 PDF pp. 120, 122, 124; published PDF pp. 135, 138, 141.

The tensor-product p-component is fixed by I_r; a single w uses I_(w,r). The integration subgroup carries both w and r, and the Jacquet module here is for B_w. These are consistent index repairs.

Correction/status: new.

### E141 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 134–135; v4 PDF pp. 125; published PDF pp. 141–142.

The section introduces the tuple beta_(w,i), unique up to permutation, immediately before forming the polynomial with an undefined alpha tuple. Use beta and the local torus T_w.

Correction/status: new.

### E142 — confirmed; misprint; affects a stated result

Checked: v5 PDF pp. 75, 134–135; v4 PDF pp. 125; published PDF pp. 142.

The index i at a point with abscissa n is unbound. Merely replacing i by n would preserve the erroneous Hodge-polygon definition E69. The standard ordinate is the cumulative sum of the n smallest sorted Hodge slopes, summed over the indicated embeddings. This repairs the notation and definition; it does not prove the asserted meeting with the Newton polygon.

Correction/status: new.

### E143 — confirmed; gap; affects the proof

Checked: v5 PDF pp. 135; v4 PDF pp. 125; published PDF pp. 142.

The text expressly omits the comparison and defers details; neither a computation with the normalizations of (106)/(173) nor an exact reference is supplied. The unbound midpoint and incorrect Hodge ordinate in E69/E142 mean that one cannot verify the assertion by reading the displayed formula literally. Record the missing comparison as a proof gap, not a demonstrated false proposition. It is explicitly unused in subsequent arguments.

Correction/status: new.

### E144 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 135–136; v4 PDF pp. 126–127; published PDF pp. 143–144.

j labels the cocharacter while r labels the level subgroup. Both transposed double cosets must have subgroup I_(w,r).

Correction/status: new.

### E145 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 133, 136–137; v4 PDF pp. 124, 127; published PDF pp. 140, 144.

Lemma 8.3.7 has no part (ii). The proof transports the inducing character beta_w under inverse transpose, so the unambiguous character on the G2 induced modules is beta_w^-1=beta_w-flat. If alpha is inherited from the proof of 8.3.7 it equals beta_w^-1, and alpha^-1 is wrong; a newly redefined alpha could remove that problem, but the text does not make such a redefinition. Use beta_w-flat consistently.

Correction/status: new.

### E146 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 137; v4 PDF pp. 127; published PDF pp. 144.

No scalar normalization has been imposed in the statement, so its unique vector means a line, as in the adjacent corollaries. The subsequent remark imposes a normalization. The subscript -r is also a slip.

Correction/status: new.

### E147 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 109–112, 138; v4 PDF pp. 128; published PDF pp. 145.

The named hypotheses are in Section 7.3, not the big-Hecke-algebra definitions of 7.1.

Correction/status: new.

### E148 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 138–139; v4 PDF pp. 129; published PDF pp. 146–147.

The second vector is the one constructed in (pi-prime)-flat in the preceding paragraph and the first display. Restore that representation in both subsequent occurrences, and keep its specialized weight and twisted nebentypus consistent with E166.

Correction/status: new.

### E149 — confirmed; misprint; affects a stated result

Checked: v5 PDF pp. 104–106, 137–139, 145; v4 PDF pp. 100–102, 128–129, 134; published PDF pp. 110–111, 145, 147, 153.

Section 6.7 divides by Vol(I intersect I-transpose), while 8.4.9, 8.5.3 and 9.2.2 divide by Vol(I^0 intersect (I^0)-transpose). Their ratio is the diagonal-unit index product_w #(O_w/p^r)^x raised to n, which has a nontrivial p-power for r>=2. It is not absorbable in the allowed unit ambiguity of periods. Replacing I by I^0 in the period normalization reconciles this particular discrepancy. Remove the original blanket assurance that the main theorem then holds: the independent local-integral, central-character, lattice and interpolation gaps are unaffected.

Correction/status: new.

### E150 — confirmed; gap; affects the proof

Checked: v5 PDF pp. 140; v4 PDF pp. 130; published PDF pp. 147–148.

Complex conjugation does not generally preserve the valuation at a fixed p-adic embedding. Concretely, in Q(i) at the prime (2+i) above 5, 2+i has positive valuation and 2-i is a unit. Essential unitarity is an assertion involving complex conjugation and duality, so it does not itself prove the needed valuation invariance. The weight and Borel changes under conjugation must be tracked, especially given E136. This elementary scalar example disproves the general valuation inference, not the specific automorphic lemma under a correctly transported normalization. The original CM-character sketch is not presented as a fully checked global counterexample. The claim is not used to enlarge the proved interpolation range.

Correction/status: new.

### E151 — rejected; misprint; affects nothing

Checked: v5 PDF pp. 141, 146–147; v4 PDF pp. 131, 134; published PDF pp. 149, 154–155.

The citation changes between v4 and v5, but a proof given under a stronger standing hypothesis and a later remark explaining that it can be weakened are not contradictory. Remark 9.3.2 is expressly a sketch for removing 6.6.4 and accounting for whole packets. No mistaken theorem number is established merely by the two different citations. Restore no old citation automatically: the global multiplicity-one hypothesis 7.3.3 is itself distinct from strong multiplicity one for GL(n). A fully minimal proof could be useful, but the recorded evidence does not establish a misprint.

Correction/status: Not an error: rejected by REV-ERRATA-PAPER-EISCHEN-HARRIS-LI-ETAL-20.

### E152 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 85, 120, 143–144; v4 PDF pp. 132–133; published PDF pp. 151–152.

The local sections in the proposition use chi_u, while the differential operator and Eisenstein-series label use chi_0 without specifying the change from (113). Specializing to pi-prime also requires its weight kappa^1 and a common sufficiently large level for the measure and test vectors. Merely replacing every r by r^1 without that compatibility is insufficient. The v4 occurrence has no varying pi-prime; v5 introduces this additional indexing issue.

Correction/status: new.

### E153 — confirmed; gap; affects the proof

Checked: v5 PDF pp. 45, 94, 120–121, 142–143; v4 PDF pp. 133; published PDF pp. 47, 99, 127, 149–152.

The Serre integral and the adelic-center zeta integral have different displayed quotient groups and similitude factors. Identifying them requires both a character calculation and the measure on the intervening central quotient. The sign discrepancy with 7.5.3 is real, but E97 shows that simply trusting the latter negative sign is not a valid repair. Remove the original speculative sign check and the assurance that the final formula is unaffected. The two inverse volumes are natural for a doubled pairing after E125, but this does not identify the remaining integrals.

Correction/status: new.

### E154 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 45, 143–144; v4 PDF pp. 133; published PDF pp. 47–48, 151–152.

Combining Proposition 9.1.7 with the definition (51) gives the inverse product of the two level volumes times the global pairing before the product of normalized local integrals. Rescaling either test vector already detects the missing pairing: each I_v is invariant under that scaling but the left side is linear. Remark 4.1.6 identifies the untwisted pairing with the chi-twisted one. Publication fixes the local-vector primes but still omits the scalar factors.

Correction/status: partially corrected in publication, p.152: the local test-vector primes are restored; the pairing and volume factors are still absent.

### E155 — confirmed; gap; affects a stated result

Checked: v5 PDF pp. 83–85, 117–118, 138–139, 143–145; v4 PDF pp. 132–134; published PDF pp. 151–153.

The proof imports Proposition 9.1.7, which requires a classical pair in Y_H^class and m>=n, as well as regular-weight control and the local condition (166) at the specialization. Being a classical Hecke character alone does not impose these joint conditions. Corollary 9.2.1 starts by inheriting 9.1.8 hypotheses, and the sentence preceding 9.2.2 may import the archimedean inequalities; those are legitimate defenses and should be preserved. They do not justify an interpolation formula for arbitrary independent classical chi and pi-prime outside the established range. This is a range-of-proof gap, not a counterexample to every possible extension.

Correction/status: new.

### E156 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 79–80, 144; v4 PDF pp. 133; published PDF pp. 152.

The numbered global result is Theorem 4.6.1. No proposition with that number is present. The archimedean factor may be indexed by kappa or rho^upsilon once chi and their relation are fixed.

Correction/status: new.

### E157 — confirmed; misprint; affects a stated result

Checked: v5 PDF pp. 46, 79–80, 138, 144–145, 147; v4 PDF pp. 128, 133–134; published PDF pp. 145, 152–153, 155.

S is explicitly away from p, whereas the Euler product contributed by spherical sections runs only over finite places outside S and p. Keeping the usual p-Euler factor inside L^S would count it in addition to the modified factor L_p. Define the product explicitly and distinguish rational primes S from places S-prime of K+. Remark 9.3.4 has the same issue: deleting only the S factors does not turn this p-depleted product into the full finite L-function. This correction does not settle the unramified character-orientation issue E41/E74.

Correction/status: new.

### E158 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 145; v4 PDF pp. 134; published PDF pp. 153.

The two factors in the preceding formula are indexed by V and -V. The repeated V in the cancellation sentence is a copy slip. This confirms that sentence-level correction without asserting all the cited local-integral formulas are correct.

Correction/status: new.

### E159 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 150; v4 PDF pp. 137; published PDF pp. 2, 156, 158; v1 PDF pp. 71; v3 PDF pp. 132–133.

The arXiv v4 and v5 bibliographies repeat the same Hida monograph, including the correction note and MR number. The published bibliography has a single [Hid96] on p.158, and the cited text uses that unified label. Thus this is an arXiv-only duplication already corrected in print, contrary to the inherited report of unchanged publication.

Correction/status: corrected in publication, p.158: a single [Hid96] entry, with unified citations.

### E160 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 44–45, 47–49, 51, 54–55, 57; published PDF pp. 47, 49–51, 53–54, 57–58, 60–61.

Confirm the punctuation/word/index slips, the dual representation in the pairing, and U_(1,v) for the ramified compact subgroup: (K_v,1) is required to lie in U_3, so an open compact of GU would not fit. Revise the character complaints: matrix evaluation via determinant has already been introduced explicitly, particularly for mu-prime_i on v5 p.54, so mu-prime_i(gamma_ii) is correct under that convention. Writing det explicitly is optional clarification, not a further error. The mu_w versus mu-prime_w mismatch and r_w versus r(w) remain. Publication repairs the parenthesis after U(V), repeated neighborhood, parentheses around (9), and the unbalanced parentheses in (56); other identified slips remain. Calling vectors in an induced model sections is also legitimate terminology, so that constituent complaint is rejected rather than treated as a mathematical correction.

Correction/status: partially corrected in publication: parenthesis after U(V) (p.47), repeated neighborhood (p.50), parentheses around (9) (p.51), and parentheses in (56) (p.53); other slips remain.

### E161 — confirmed; misprint; affects nothing

Checked: v5 PDF pp. 21; v4 PDF pp. 19; published PDF pp. 22.

By the functor-of-points description, a natural assignment E(S)->S is a morphism E_R->A^1_R. It is not a morphism Spec R->E. The next sentence on sections of pi_{r,*}O_{E_r} uses the correct distinction.

Correction/status: new.

### E162 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 29; published PDF pp. 30.

For m>1 a boundary chart is A=(Z/p^m)[q] with horizontal boundary ideal (q). Its reduced boundary has ideal (p,q), which contains the nonzero constant p. Thus the printed definition admits p times every form into the alleged cusp ideal; in the inverse limit it still admits the constant p although its boundary value is p!=0. The ideal (p,q) is also not a Cartier divisor ideal on this thickening. Etale pullback preserves this discrepancy. This is a defect in the stated cusp-module definition; no assertion that the intended, horizontally defined cusp theory is false.

Correction/status: new.

### E163 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 42; v4 PDF pp. 38; v1 PDF pp. 36; published PDF pp. 44.

Take K=Q(i), n=1 and V=<1>. The specified V_d,V^d basis gives the doubled hermitian Gram matrix J=[[0,2],[2,0]]. The permitted Hermitian parameter X=1 gives g=[[1,1],[0,1]], but g J g*= [[4,2],[2,0]] != J. Thus this matrix is not in N or even U(W). Purely imaginary X instead satisfies the actual condition. The source says Hermitian and displays the block itself, so an abstract isomorphism between Hermitian and skew-Hermitian spaces does not repair the displayed coordinates without an explicit change.

Correction/status: new.

### E164 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 42; v4 PDF pp. 38; published PDF pp. 44.

The doubled Gram matrix has cross block 2H. Preserving it requires B H A*=nu H. Over Q(i), take H=diag(1,3), nu=1 and A the coordinate swap. The printed B=A swaps the two diagonal entries of H, so diag(B,A) is not unitary. The corrected B=[[0,1/3],[3,0]] gives gJg*=J by exact rational multiplication. This is separate from E163: even a block-diagonal element, with no unipotent parameter, fails.

Correction/status: new.

### E165 — confirmed; misprint; affects a stated result

Checked: published PDF pp. 90; v5 PDF pp. 86; v4 PDF pp. 85.

Sigma_K contains both embeddings in each conjugate pair, with a_sigma=b_sigma-c. Each real factor has complex dimension a_sigma b_sigma, so the sum over all CM embeddings counts twice. For imaginary quadratic U(1,1), the symmetric domain is one-dimensional but the published formula gives 2. The factor 1/2 is present in arXiv v5 and v4 and absent in the published PDF, verified visually on p.90. This is a publication regression affecting the explicit dimension and its use in top cohomology.

Correction/status: new.

### E166 — confirmed; error; affects a stated result

Checked: v5 PDF pp. 99, 101–102, 106; published PDF pp. 103, 106–107, 111.

Take a finite-order chi nontrivial on determinants of I_r^0 and trivial on I_r, and an ordinary pi-flat vector of nebentypus psi^-1. The twisted vector transforms by psi^-1 chi^-1 det, not psi^-1. Its algebraic weight is unchanged, so changing kappa-flat star chi cannot absorb this finite character. The printed fixed-nebentypus space can therefore lose the entire one-dimensional anti-ordinary component, contradicting the rank-one period assertion of Lemma 6.7.6 even after its E112 typographical repair. Increasing r alone does not make chi trivial on I_r^0 diagonal units. The same issue occurs away from p if chi ramifies outside the fixed tame level.

Correction/status: new.

## Correction search and validation

The [arXiv history](https://arxiv.org/abs/1602.01776) ended at v5, 6 March 2020. The [Cambridge record](https://doi.org/10.1017/fmp.2020.4) linked no separate correction, and the [Crossref record](https://api.crossref.org/works/10.1017/fmp.2020.4) had no update-to/updated-by entry and an empty relation object. [Harris's publications](https://www.math.columbia.edu/~harris/website/fr/publications), entry 85, and his five-page errata PDF listed no correction for EHLS. The PDF is not assigned the unverified date used in the input. Title/author searches with erratum, corrigendum and correction found no dedicated notice. These are bounded search results, not a claim of discovery priority.

[Eischen's publications-page](https://www.elleneischen.com/publications.html) search excerpt listed EHLS; full retrieval failed, so this is only excerpt-level evidence. Marcil's downloaded current 142-page manuscript was mechanically searched for correction terminology, not read in full. The original report's claims of a failed published-PDF retrieval, an unverified errata date, a zbMATH inspection, and complete reading of several later papers are not carried forward. The `searched` fields now record the actual independent work.

Verification includes exact rational matrix and rank calculations, finite Iwahori/index counts, finite Fourier/Gauss sums, explicit local character examples, weight/root computations, scaling checks, and direct comparisons of the named formulas. The individual reasons give their mathematical inputs and limits. Numerical or finite diagnostics corroborate the accompanying algebra; they are not formal proofs of every global assertion. The Jordan-block example in E138 proves the failure of the supplied induction, while the generalized-eigenspace argument supplies that particular repair.

Repository checks passed:

- `python3 scripts/check_errata.py research/blueprint/errata/PAPER-EISCHEN-HARRIS-LI-ETAL-20.json`
- `python3 research/blueprint/intake.py check-files research/blueprint/reviews/REV-ERRATA-PAPER-EISCHEN-HARRIS-LI-ETAL-20.md research/blueprint/errata/PAPER-EISCHEN-HARRIS-LI-ETAL-20.json research/blueprint/errata/PAPER-EISCHEN-HARRIS-LI-ETAL-20.md`
- Stable E1–E160 identities, six sequential additions, complete individual verdict coverage, no unresolved verification-ledger items, original-deliverable and eleven-input concurrency guards before publication.

No Lean file is part of this job and no compilation or formalization is claimed. The review does not contact the authors or edit the generated public register; intake handles that register. The unresolved mathematical work is stated in the confirmed gap/correction fields rather than deferred as an unfinished errata verification.
