# RT-PAPER-KINGS-SPRANG-25

Red team of the accepted extraction PAPER-KINGS-SPRANG-25: Guido Kings and Johannes Sprang, *Eisenstein–Kronecker
classes, integrality of critical values of Hecke L-functions and p-adic interpolation*, Annals of Mathematics 202
(2025), 1–109 (arXiv 1912.03657v4). Issue #4037.

Red team: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write or review:
- the extraction (`cc-442dc5`, PRs #2046 and #2051);
- its review, REV-PAPER-KINGS-SPRANG-25 (`cc-d67081`, PR #2367).

**Result: 74 findings, 9 high, 37 medium and 28 low.**

## Method

**The source.** arXiv 1912.03657v4, the final version (<https://arxiv.org/abs/1912.03657v4>), was re-downloaded on
2026-10-01 with its LaTeX source. Its SHA-256 is `fab8e605…40fbb72`, equal to the extraction's. The published Annals
text is paywalled and was not read, so misprint findings are scoped to v4.

**The passes.** All 85 pages were read against the extraction in six parallel passes run by this session:
- the Introduction and §1 (pp. 1–13);
- §2 with Appendix A (pp. 13–30, 79–81);
- §3 (pp. 30–46);
- §4 with the appendices and references (pp. 46–55, 79–85);
- §5 (pp. 55–79);
- the routes and statuses, against `data/atlas.json`, the blueprint packets, the accepted restructures (RS-02, RS-08,
  RS-09, RS-14), the key-definition surveys, `make_queue.py`, other papers' accepted routes and the pinned libraries.

**Merging.** I merged findings reported by more than one pass:
- item 004's library status, Weil's theorem with item 005, and item 012 with good reduction;
- the planned statuses of items 003, 007 and 067, the CM.0/CM.1 route, and item 001's library status;
- E4's locator, and the three sign findings of Proposition 3.23;
- Lemma 3.25, and Proposition 2.27's model and orientation;
- the prerequisites, the library pointers and the TeX macro names.

**What I re-verified myself, in the TeX or the atlas:**
- Proposition 1.5 fails on torsion modules: for the golden ratio φ ∈ ℚ(ζ₅), φ³ − 1 = 2φ;
- RS-14 gives L3 Katz's differential operators, CM periods, Eisenstein measure and critical-character evaluation;
- the two sign slips in Proposition 3.23: ∂_z χ_l = −πh l̄ χ_l, and dz∧dz̄ = −2i dx∧dy;
- Proposition 3.13 for Λ = ℤ[i]: K⁰ = 4ζ(s)L(s, χ₋₄) has residue π at s = 1 and value −1 at s = 0;
- Notation 1.18's R[1/𝔣], built from one fixed embedding O_L ⊂ R;
- the two printed conventions for Katz's local factor, F̃(x, y) = χ_fin(x⁻¹, y) and (5.7.1) with t on O_L(Σ_p);
- Proposition 2.27: res∘cor is multiplication by |Γ_tors|, so for d = 1 and Γ = {±1} the map is ×2.

**Not re-derived.** Two high findings rest on the passes' computations: Lemma 3.25 (a numerical counterexample) and the
factor N𝔣 in Proposition 2.31. For the latter I confirmed only that the printed proof checks the connection and moment-
map squares and nothing else.

**Severities I changed.** Item 004 (a missed library status), item 067 (planned, with unplanned parts) and item 028 (one
misrouted item) are medium, not high. The full list of what was checked is in the result's `checked` field.

## The high findings

### /1 — error

**Where.** PAPER-KINGS-SPRANG-25/005 (Proposition 1.5 clause); sourceIssues

**Claim.** Proposition 1.5, copied into item 005, is false as stated: an 'algebraic T_{L,R}-module' is an arbitrary
R[I_L]-comodule, and for a module with R-torsion, Γ can act trivially on M(µ) although µ(Γ) ≠ 1. The proof ('This action
is trivial if and only if µ ∈ HChar_L(Γ)') needs µ(γ) − 1 to act injectively. The mistake is not recorded. Proposition
1.5 is never cited later, and Corollary 1.14 argues directly for locally free modules over the domain R ⊂ ℂ, where the
argument is right. So its reach is nil, but the item as written cannot be proved.

**Evidence.** Proposition 1.5, p. 8: 'Let M be an algebraic T_{L,R}-module and suppose that R is contained in an
algebraic number field k. Let Γ ⊂ O_L^× be a subgroup of finite index. Then the Γ-invariants of M are M^Γ =
⊕_{µ∈HChar_L(Γ)} M(µ). Proof. On M(µ) the group Γ ⊂ O_L^× acts via the character µ : O_L^× → R^×. This action is trivial
if and only if µ ∈ HChar_L(Γ) is of Hecke character type.' Counterexample: L = ℚ(ζ_5), a CM field with L^Gal = L and d_L
= 5^3. Take R = ℤ[ζ_5][1/5] ⊂ L and φ = (1+√5)/2 ∈ O_L^×. Since O_L^× = µ_10 × ⟨φ⟩, the subgroup Γ = ⟨φ^3⟩ has finite
index. Let µ = σ_1 be a single embedding, and let M = R/2R with coaction m ↦ m ⊗ [σ_1]. Since φ^3 − 1 = 2φ, σ_1(γ) − 1 ∈
2R for every γ ∈ Γ, so Γ acts trivially and M^Γ = M ≅ 𝔽_16 ≠ 0 (2 is inert in ℚ(ζ_5)). But σ_1(φ^3) = 2σ_1(φ) + 1 ≠ 1,
and σ_1 fails the weight condition (µ(σ_1) + µ(σ̄_1) = 1 but µ(σ_2) + µ(σ̄_2) = 0), so σ_1 ∉ HChar_L(Γ) and the right
side is 0. The label prop:decomposition is referenced nowhere in the TeX source.

**Fix.** In item 005, add the hypothesis 'M torsion-free (e.g. flat or locally free) over R' to Proposition 1.5; the
printed proof then works, since µ(γ) − 1 ≠ 0 acts injectively. Add sourceIssue PAPER-KINGS-SPRANG-25/E9: kind error,
locator 'Proposition 1.5, p. 8', printed as quoted, correction 'add: M is R-torsion-free', reason the ℚ(ζ_5)
counterexample, affects 'nothing' (never cited; Corollary 1.14 is proved directly for locally free modules), known
'new'.

### /2 — error

**Where.** PAPER-KINGS-SPRANG-25/042 (and /041; sourceIssues: missing entry)

**Claim.** The identity of Proposition 2.31, recorded in item 042, is off by the factor deg[f] = Nf. The refined class
of Theorem 2.30 (item 041) sends the factor Ω^d through Ω^d_A ≅ π^*ω^d_{A^∨} → π^*ω^d_{B^∨} ≅ Ω^d_B: the first and last
maps are the Grothendieck-duality isomorphism (1.2.2), the middle one is [f]^{∨*}. The comparison then applies
TSym^{α+1̲}([f]^*), whose 1̲-part maps ω^d_B back to ω^d_A. For any isogeny φ : A → B, write ι for the isomorphism of
(1.2.2), characterised by tr_A(ι_A(u) ∪ v) = u(v). Then tr_A(φ^*y) = deg φ · tr_B(y) on R^dπ_*Ω^d, and φ^* is dual to
dφ^∨ on R^dπ_*O. Together these give φ^* ∘ ι_B ∘ φ^{∨*} = deg(φ) · ι_A. So the correct identity is
TSym^{α+1̲}([f]^*)(_{[f]}EK^{β,α}_{Γ,B}(f,x)) = Nf · TSym^β([f]_#)(EK^{β,α}_{Γ,A}(f,x)), and the printed 'in particular'
does not follow from it. A second problem: when [f] is not étale, the operator [f]^*(∇^a) : [f]^*P^{♮(n)}_B →
[f]^*TSym^a(Ω^1_B) ⊗ [f]^*P^{♮(n)}_B used in Theorem 2.30 is not defined on O_A-sections. The Leibniz rule needs d_A g ∈
[f]^*Ω^1_B, but [f]^*ω_B → ω_A is not surjective. Example: [p] on an elliptic curve over Z_p has [p]^*ω = pω. The
integrality conclusion itself is true by a direct argument (see fix), so Theorem 4.9, which uses only the 'in
particular', survives.

**Evidence.** Theorem 2.30, proof, p. 24: 'Recall from (1.2.2) that Ω^d_{A/S} ≅ π^*ω^d_{A^∨/S}. Applying the maps [f]_#
: P^{♮(n)}_A → [f]^*P^{♮(n)}_B and [f]^{∨*} : ω_{A^∨/R} → ω_{B^∨/R} gives a class … where we have used the
identification π^*ω^d_{B^∨/R} ≅ Ω^d_{B/R}. This class can be derived with the operator [f]^*(∇^a) : [f]^*P^{♮(n)}_B →
[f]^*TSym^a(Ω^1_{B/R}) ⊗ [f]^*P^{♮(n)}_B.' (1.2.2), p. 9: 'R^dπ_*O_A ≅ Λ^d Lie(A^∨/S), which by Grothendieck duality
gives rise to an isomorphism ω^d_{A^∨/S} ≅ π_*Ω^d_{A/S} ≅ ω^d_{A/S}.' Proposition 2.31, p. 25:
'TSym^{α+1̲}([f]^*)(_{[f]}EK^{β,α}_{Γ,B}(f,x)) = TSym^β([f]_#)(EK^{β,α}_{Γ,A}(f,x)) … In particular,
TSym^β([f]_#)(EK^{β,α}_{Γ,A}(f,x))(ω(A)^{[α+1̲]}, ω(B^∨)^{[β]}) ∈ R.' The proof on p. 25 checks only the ∇-square and
the moment-map square, never the Ω^d factor. Checks: (i) d = 1, φ = [N] : E → E: [N]^* and [N]^{∨*} each act as N on
invariant differentials, so the composite is N^2 = deg[N], not 1. (ii) Over C, φ : C/Λ → C/Λ' with z ↦ z: the trace is
(1/2πi)∫, so ι_E(u) = −π u([dz̄]) dz/Area(Λ). The composite φ^*ι_Bφ^{∨*}ι_A^{-1} is then Area(Λ)/Area(Λ') = deg φ.

**Fix.** Rebuild item 041 on the A side. Define c := (orientation of Prop. 2.27) ∘ pr_Γ ∘ mom^b_{e_B} ∘ x^* ∘ (id ⊗
[f]_#)(∇^a EK^♮_{Γ,A}(f)) ∈ TSym^{α+1̲}(ω_{A/R}) ⊗ TSym^β(ω_{B^∨/R}). Here [f]_# : P̂^♮_A → [f]^*P̂^♮_B is the map of
Theorem 2.8, which exists for every isogeny and is horizontal for the pull-back connection with values in Ω^1_A. Use
x^*[f]^* = e_B^*, and leave the factor Ω^d_{A/R} = π^*ω^d_{A/R} unchanged. Every map is defined over R, so c is
R-integral. The paper's two squares give c = TSym^β([f]_#)(EK^{β,α}_{Γ,A}(f,x)) over R[1/Nf]. Restate item 042 as this
identity plus the unchanged 'in particular'. If the printed refined class is kept instead, item 042 must carry the
factor Nf, and the integrality cannot be deduced from it. Record a sourceIssue (kind error; affects the proof of
Proposition 2.31; the integrality used in Theorem 4.9 holds by the argument above). Update the Part II brief
accordingly.

### /3 — error

**Where.** PAPER-KINGS-SPRANG-25/039 (also /038, /040; sourceIssues: missing entry)

**Claim.** The proof of Proposition 2.27 claims that res : H_{d−1}(Γ, Z) → H_{d−1}(Γ', Z) is surjective. This is false
whenever Γ has torsion. For Γ = Γ^free × Γ^tors, the transfer composed with the inclusion H_{d−1}(Γ^free) → H_{d−1}(Γ)
is multiplication by |Γ^tors|, because conjugation is trivial. The other Künneth summands are torsion and map to 0 in
H_{d−1}(Γ^free) ≅ Z. So the image of res is |Γ^tors|·H_{d−1}(Γ'), and no ξ with res ξ = ξ' exists. With the
normalisation forced by diagram (2.4.2) and Corollary 2.29, the map takes the inflated generator of H^{d−1}(Γ, R) to
1/|Γ^tors|. It is therefore not a homomorphism into the integral module TSym^{α+1̲}(ω_{A/R}) ⊗ TSym^β(ω_{A^∨/R}) unless
|Γ^tors| ∈ R^×. If ζ_m ∈ L then the odd primes dividing m, and 2 when 4 | m, divide d_L, so they are units in an
O_{L^Gal}[1/d_L]-algebra. Only a factor 2 is at stake: −1 ∈ Γ with 2 ∤ d_L. This happens for Γ = O_L^× in the f = O_L
case of Theorem 4.10, and for Γ = O_f^× when f | 2 in Theorem 4.9. In those cases Definition 2.28's 'element of R' and
the resulting 2-integrality are not established by the paper's argument. They may still hold for the particular classes:
in d = 1 with x of order 2, the conditions Σ_t f(t) = 0 and f(t) = f(−t) force f(0) to be even, which absorbs the 1/2.

**Evidence.** Proposition 2.27, proof, p. 23: 'To treat the general case, we first show that res : H_{d−1}(Γ, Z) →
H_{d−1}(Γ', Z) is surjective. This follows by first decomposing Γ = Γ^free × Γ^tors into its free and torsion part. Then
res : H_{d−1}(Γ, Z) → H_{d−1}(Γ^free, Z) is surjective.' and 'Let ξ ∈ H_{d−1}(Γ, Z) be an element with res(ξ) = ξ' …
cor(res η ∩ res ξ) = η ∩ cor∘res ξ = [Γ : Γ']η ∩ ξ'. Smallest case: d = 1, L = Q(√−7) (d_L = −7, so 2 ∉ R^× for R =
O_L[1/7]), Γ = O_L^× = {±1}, Γ' = 1. The transfer H_0(Γ, Z) = Z → H_0(1, Z) = Z is multiplication by 2. Diagram (2.4.2)
then forces the map H^0(Γ, M) = M → M to be η ↦ η/2. Uses with torsion: proof of Theorem 4.10, p. 54, case f = O_L, sums
E^{β,α}(t+1, 0; b^{-1}, O_L^×).

**Fix.** Restate item 039 for torsion-free Γ, or with target TSym^{α+1̲}(ω_{A/R}) ⊗ TSym^β(ω_{A^∨/R}) ⊗ R[1/|Γ^tors|].
For general Γ, define EK^{β,α}_Γ(f,x) rationally through Corollary 2.29, and add the same restriction to items 038 and
040. Record a sourceIssue (kind error; affects the proof of Proposition 2.27 and the integrality at 2 of the classes for
Γ containing −1 when 2 ∤ d_L). Tell the Part II brief that the cases Γ = O_L^× and Γ = O_f^× with f | 2 need a separate
2-integrality argument, such as the parity of f(0), or a statement with 2 inverted.

### /4 — error

**Where.** PAPER-KINGS-SPRANG-25/053, /056, /057 (notes); sourceIssues E2 and E3 ('reach'), E6; route brief for
AutomorphicPadicLFunctionsPartIICriticalHeckeValues (the d = 1 sign test); PAPER-KINGS-SPRANG-25/053; sourceIssues (new,
proof of Proposition 3.23); PAPER-KINGS-SPRANG-25/053; sourceIssues (new, proof of Proposition 3.23)

**Claim.** The extraction says that with the corrections E2 and E3, the representative of Proposition 3.23 and the right
sides of Theorem 3.27 and Corollary 3.28 pick up the factor (-1)^{|beta|+1}. That bookkeeping is incomplete. The two
unrecorded slips above add (-1)^{|alpha|} and (-1)^d, so the net factor relative to the printed formulas is
(-1)^{|alpha|+|beta|+d+1}. This holds with the paper's own normalization of delta_f vol and of the orientation of B
Gamma. A formalizer who follows the notes and runs the brief's 'd = 1 including signs' test would get the wrong sign. E6
also uses the wrong factor. In Theorem 5.27 (Eis^{beta,alpha-1}) the factor becomes (-1)^{|alpha|+|beta|+1} = -(-1)^{d
w}, where w is the weight of the infinity type, since |beta| - |alpha| = d w for a type of Hecke character type. So it
depends only on the weight, not on beta. Also: The proof of Proposition 3.23 drops a sign (-1)^{|alpha|} when it
differentiates the Eisenstein–Kronecker series. The paper's characters are chi_l(w) = exp(2 pi i <l,w>), with <l,w> = Im
H(l,w) = Im sum_i l_i conj(w_i). The holomorphic derivative is therefore d/dz_i chi_l(z) = -pi conj(l_i) chi_l(z), and
for the Hr-scaled series it is -pi r_i conj(lambda_i). So the correct identity is d_z^alpha
K^{beta+1}(Hr,0,z-t,b+d,Lambda^{Hr,*}) = (-1)^{|alpha|} (pi r)^alpha K^{beta+alpha+1}(Hr,0,z-t,b+d,Lambda^{Hr,*}). The
paper prints it without (-1)^{|alpha|}. Item 053 copies the false identity into its statement. The error is not recorded
in sourceIssues. Also: The proof of Proposition 3.23 uses (2 pi i)^d/vol(A) = pi^d/vol_H(Lambda) = (pi
r)^1/vol_{Hr}(Lambda). This is false for odd d. With the complex orientation of A(C), dz_i ^ dzbar_i = -2i dx_i ^ dy_i,
so vol(A) = (-2i)^d vol_H(Lambda) and (2 pi i)^d/vol(A) = (-pi)^d/vol_H(Lambda). The paper's factor (2i)^d is (-2i)^d
only for even d. Item 053 copies the identity into its statement. The error is not recorded.

**Evidence.** An independent d = 1 computation from the paper's definitions (E Gamma a point, r = 1, Gamma trivial,
nabla'' = dbar + ubar dzbar from Theorem 3.5, d/dzbar chi_l = pi l chi_l). Solving nabla''phi = delta_f vol Fourier mode
by Fourier mode gives phi_l = -(2 pi i/vol(A)) chi_l(z-t) sum_b (-1)^b b! ubar^{[b]}/(pi l)^{b+1} dz. This agrees with
Definition 3.15 corrected by E2 and E3. Applying d_z^a contributes (-pi conj(l))^a. Then the functional equation of
Proposition 3.13 (z = 0, verified numerically) and 2 pi i/vol(A) = -pi/vol_H(Lambda) give Eis^{b,a}(f,x) = (-1)^{a+b} a!
sum_t f(-t) E^{b,a+1}(t+x,0;Lambda) dz^{[a+1]} (x) ubar^{[b]}. Theorem 3.27, p. 45, prints +a!. The extraction's
correction gives (-1)^{b+1} a!. These differ by (-1)^{a+1} = (-1)^{a+d}. Also: Proof of Proposition 3.23, p. 43:
'Combining this with d^alpha_z K^{beta+1}(Hr,0,z-t,b+d,Lambda^{Hr,*})|_{z=x} = (pi r)^alpha
K^{beta+alpha+1}(Hr,0,z-t,b+d,Lambda^{Hr,*})|_{z=x} gives the representative ...'. Section 3.4, p. 36: 'chi_l :
C^Sigma/Lambda -> C^x, w -> exp(2 pi i <l,w>)', where <.,.> = Im H and H(z,w) = sum z_i conj(w_i). The paper fixes the
same convention itself in the proof of Theorem 3.20, p. 40: 'iota_l~(A_l) = 2 pi i iota_l~ d(<l,.>) + l~ = pi ||l/sqrt
r||^2_H + l~'. This holds only if the (0,1)-part of 2 pi i d<l,.> is pi sum l_i dzbar_i. Its (1,0)-part is then -pi sum
conj(l_i) dz_i. Numerical check: for l = 0.7-1.3i and z = 0.2+0.45i, central differences give (d/dz chi_l)/chi_l =
-2.19911-4.08407i = -pi conj(l), and (d/dzbar chi_l)/chi_l = pi l. Also: Proof of Proposition 3.23, p. 43: 'Recall the
formula vol(A) = int_{A/C} wedge_i dz_i ^ dzbar_i. The measure wedge_i dz_i ^ dzbar_i differs from the measure mu_st
induced from the metric given by the standard scalar product by a factor (2i)^d, so (2 pi i)^d/vol(A) =
pi^d/vol_H(Lambda) = (pi r)^1/vol_{Hr}(Lambda).' Check for d = 1 and Lambda = Z[i] (vol_H = 1): vol(A) = int dz^dzbar =
-2i int dx^dy = -2i, so (2 pi i)/vol(A) = -pi, while the paper's right-hand side is +pi.

**Fix.** Replace (-1)^{|beta|+1} by (-1)^{|alpha|+|beta|+d+1} in the notes of items 053, 056 and 057, in the 'reach' of
E2 and E3, and in E6. Rework E6's discussion with the weight-only factor (-1)^{|alpha|+|beta|+1} = -(-1)^{dw}. Add the
two new sourceIssues. Keep the caveat that the absolute sign also depends on the orientation of B Gamma (Proposition
2.27) and on the trace normalization of delta_f vol (Corollary 3.22), and fix both conventions explicitly in the brief.
Also: Record a new sourceIssue (kind error, affects a stated result: Proposition 3.23, Theorem 3.27, Corollary 3.28). In
item 053, state the derivative identity with (-1)^{|alpha|}, and multiply the representative psi^{(beta,alpha)}(f,x) by
(-1)^{|alpha|} on top of the factors from E2 and E3. Also: Record a new sourceIssue: the factor is (-2i)^d and (2 pi
i)^d/vol(A) = (-pi)^d/vol_H(Lambda). In item 053, correct the identity, which gives psi^{(beta,alpha)} a further factor
(-1)^d. Alternatively, state explicitly that A(C) carries the non-complex orientation, and carry that orientation
through the trace normalization of delta_f vol in Corollary 3.22 (item 052).

### /5 — error

**Where.** PAPER-KINGS-SPRANG-25/047; sourceIssues (new, Proposition 3.13)

**Claim.** Proposition 3.13, and item 047 which copies it, says K^mu(H,z,w,s,Lambda) itself has simple poles at s = 0
and s = d, with residues -delta_{mu,z} e^{2 pi i<-z,w>} and delta_{mu,w}/vol_H(Lambda). These are the poles and residues
of the completed function pi^{-s} Gamma(s) K^mu, which is what the Mellin-transform proof produces. K^mu itself is
regular at s = 0, because 1/Gamma(s) vanishes there, with K^mu(H,z,w,0,Lambda) = -delta_{mu,z} e^{-2 pi i<z,w>}. Its
residue at s = d is pi^d delta_{mu,w}/((d-1)! vol_H(Lambda)). As stated, the item is false.

**Evidence.** Proposition 3.13, p. 35: 'The Eisenstein-Kronecker series K^mu(H,z,w,s,Lambda) has an analytic
continuation to C with possible poles in s=0 and s=d of order one, with residue -delta_{mu,z} e^{2 pi i<-z,w>} in s=0,
and residue delta_{mu,w}/vol_H(Lambda) in s=d.' The proof on the same page gives 'pi^{-s} Gamma(s) K^mu(H,z,w,s,Lambda)
= int_0^infty (theta^mu_t - delta_{mu,z} e^{2 pi i<-z,w>}) t^s dt/t'. Counterexample: d = 1, Lambda = Z[i], H standard,
z = w = 0, mu = 0. Then K = sum' |lambda|^{-2s} = 4 zeta(s) L(s,chi_{-4}), which is regular at s = 0 with value
4(-1/2)(1/2) = -1 and has residue 4 L(1,chi_{-4}) = pi at s = 1. The paper's statement predicts residues -1 and 1.
Mathlib's WeakFEPair.Lambda_residue_zero and Lambda_residue_k (Mathlib/NumberTheory/LSeries/AbstractFuncEq.lean:449,
:433) state the residues for the completed function, as here.

**Fix.** Record a new sourceIssue (error, affects nothing later, because the paper only uses the functional equation at
|mu| >= 1). Restate item 047: pi^{-s} Gamma(s) K^mu continues meromorphically with at most simple poles at s = 0
(residue -delta_{mu,z} e^{-2 pi i<z,w>}) and s = d (residue delta_{mu,w}/vol_H(Lambda)). K^mu is entire except possibly
for a simple pole at s = d, and it is entire when |mu| >= 1.

### /6 — error

**Where.** PAPER-KINGS-SPRANG-25/054; sourceIssues (new, Lemma 3.25); PAPER-KINGS-SPRANG-25/054 (Lemma 3.25; outside
this share, but §4 evaluates E^{β,α} at points that are not Γ-invariant)

**Claim.** Lemma 3.25, E^{beta,alpha}(t',s;Lambda,Gamma') = [Gamma:Gamma'] E^{beta,alpha}(t',s;Lambda,Gamma), is false
with Definition 3.24 as printed, whose summation set Lambda + Gamma t' depends on the group. Gamma acts freely on
nonzero lambda, and every Gamma-orbit in Lambda + Gamma t' meets Lambda + Gamma' t' in [Gamma' Gamma_{t'} : Gamma']
Gamma'-orbits, where Gamma_{t'} is the stabilizer of t' + Lambda. So the true factor is [Gamma' Gamma_{t'} : Gamma'] =
[Gamma_{t'} : Gamma_{t'} cap Gamma']. This equals [Gamma:Gamma'] only when Gamma = Gamma' Gamma_{t'}, for example when
t' is Gamma-fixed modulo Lambda. Item 054 states the false version. The use in the proof of Theorem 3.27, 'By Lemma 3.25
and Corollary 2.29 it suffices to prove the statement for a torsion free Gamma', is still valid with the correct count.
After summing over Gamma-orbits of c-torsion points, the right side of Theorem 3.27 scales by [Gamma:Gamma'], because
[Gamma : Gamma' Gamma_t][Gamma' Gamma_t : Gamma'] = [Gamma:Gamma']. Also: Lemma 3.25 as stated, and as copied into /054,
is false for a general t'. With Definition 3.24, E(t', s; Λ, Γ') = [Γ'S : Γ']·E(t', s; Λ, Γ), where S is the stabilizer
of t' + Λ in Γ. This equals [Γ:Γ']·E(t', s; Λ, Γ) only when Γ'S = Γ, for example when t' is Γ-invariant. The summed form
used in the proof of Theorem 3.27 (a sum over Γ-orbits of 𝔠-torsion t with x Γ-invariant) is still correct, as is
Proposition 4.12. I checked both against Definition 3.24.

**Evidence.** Definition 3.24 and Lemma 3.25, p. 43: 'E^{beta,alpha}(t',s;Lambda,Gamma) := sum'_{lambda in
Gamma\(Lambda+Gamma t')} ...' and 'For a subgroups of finite index Gamma' in Gamma ...
E^{beta,alpha}(t',s;Lambda,Gamma') = [Gamma:Gamma'] E^{beta,alpha}(t',s;Lambda,Gamma).' The proof given is 'This is a
straight-forward computation.' The commented-out proof in the TeX source sums over Lambda + O for a fixed Gamma-orbit O,
which is a different object. Counterexample: L = Q(i), d = 1, Lambda = Z[i], Gamma = {+-1}, Gamma' = {1}, t' = 1/3, beta
= 0, alpha = 2 (critical: mu(-1) = 1), s = 1 (inside the half-plane of Definition 3.24). Each {+-1}-orbit in (Z[i]+1/3)
cup (Z[i]-1/3) meets Z[i]+1/3 exactly once, so E(Gamma') = E(Gamma) = sum_{lambda in Z[i]+1/3} lambda^{-2}|lambda|^{-2},
which is approximately 84.84 and nonzero. That is not 2 E(Gamma). Also: Definition 3.24, p. 43: 'E^{β,α}(t',s;Λ,Γ) :=
Σ'_{λ∈Γ\(Λ+Γt')} …'. Lemma 3.25, p. 43: 'For a subgroups of finite index Γ' ⊂ Γ ⊆ 𝒪_L^×, … E^{β,α}(t',s;Λ,Γ') =
[Γ:Γ']E^{β,α}(t',s;Λ,Γ).' Counting fibres: the Γ'-orbits in Γλ ∩ (Λ + Γ't') correspond to Γ'S/Γ'. Take Γ' = S ≠ Γ: the
factor is 1, not [Γ:Γ'].

**Fix.** Record a new sourceIssue (error; affects the proof of Theorem 3.27, not its statement). In item 054, either
state Lemma 3.25 with the factor [Gamma' Gamma_{t'} : Gamma'], or define E(t',s;Lambda,Gamma') as a sum over
Gamma'\(Lambda + Gamma t') for the fixed Gamma-orbit, in which case [Gamma:Gamma'] is right. Add one line to item 056
saying that the reduction to torsion-free Gamma uses this corrected orbit count. Also: Add to /054 the hypothesis that
t' is Γ-invariant mod Λ, or state the general factor [Γ'S_{t'} : Γ']. Note that Theorem 3.27 uses only the summed
identity, which holds.

### /7 — error

**Where.** PAPER-KINGS-SPRANG-25/062, /064, /065 (rings of integrality; R[1/𝔣] as recorded in /011); sourceIssues
(missing entry)

**Claim.** The rings in Theorem 4.9 (R[1/(𝔣N(𝔟𝔠))]), Corollary 4.13 and Theorem 4.10 (𝒪_E R[1/(𝔣N𝔠)], and 'Spec R = Spec
𝒪_k[1/(d_L𝔣N𝔠)]') use R[1/𝔣] of Notation 1.18. That ring inverts only the maximal ideals 𝔪 with 𝔪∩𝒪_L | 𝔣 for the single
structural embedding σ_0 : 𝒪_L ⊂ 𝒪_{L^Gal} ⊂ R. The proof of Theorem 4.9 needs [𝔣] : 𝒜(𝔞) → 𝒜(𝔟^{-1}) to be étale. On
the σ-component of Lie this map has cokernel R/σ(𝔣)R, so it is étale exactly where σ(𝔣)R is the unit ideal for every σ
in the CM type Σ of 𝒜. With the paper's literal R[1/𝔣], Theorems 4.9 and 4.10 and Corollary 4.13 are false whenever some
σ ∈ Σ differs from σ_0. The extraction copies the rings and records no sourceIssue.

**Evidence.** Notation 1.18, p. 12: 'R[1/𝔣] := ∩_{𝔪 | 𝔪∩𝒪_L ∤ 𝔣} R_𝔪 where the intersection is taken over all
localizations at maximal ideals of R, such that 𝔪∩𝒪_L does not divide 𝔣.' Proof of Theorem 4.9, p. 50: 'Because the maps
Lie(𝒜(𝔞)/ℛ) → Lie(𝒜(𝔟^{-1})/ℛ) and Lie(𝒜/ℛ) → Lie(𝒜(𝔟^{-1})/ℛ) are isomorphisms over R[1/𝔣N(𝔟𝔠)], the isogenies [𝔣] and
[𝔟] are étale.' §5.1, p. 56 confirms the mechanism: over 𝒪_{ℂ_p}, [𝔭_Σ^n] is infinitesimal and [𝔭̄_Σ^n] is étale.
Counterexample (d = 1). Take L = K = ℚ(i) ⊂ ℂ, so σ_0 = id, and 𝔣 = (2+i). The ray class group mod 𝔣 is trivial. Let
χ((λ)) = λ̄^{-1} for λ ≡ 1 mod 𝔣: its conductor is 𝔣, μ = −σ̄_0, the attached CM type is Σ = {σ̄_0}, and α = 1, β = 0.
Let 𝒜 be E: y² = x³ − x over R = 𝒪_k[1/(6(2+i))], with k = ℚ(i)(E[2−i]). Let 𝒪_L act through complex conjugation, so the
CM type of 𝒜 is Σ. Take ω(𝒜) = dx/y, the 𝒪_L-structure from H_1 ≅ ℤ[i], and 𝔠 = (3). Under 𝒜(𝔣) ≅ E the isogeny [𝔣]
becomes [2−i], so 𝔞⊗ω(𝒜) = [𝔣]^*ω = (2−i)dx/y, and x_Ω ∈ E[2−i]. Let 𝔪 be a maximal ideal of R over (2−i). Then 𝔪∩𝒪_L =
(2−i) does not divide 𝔣, so 𝔪 survives in R[1/𝔣]. At 𝔪, [2−i] acts on Lie by 2−i ∈ 𝔪, so E[2−i] is infinitesimal and x_Ω
reduces to the origin. The identity in the proof of Theorem 4.9, from Corollary 3.28, gives (χ(𝔠)N𝔠 − 1)L_𝔣(χ,0)/Ω =
±χ(𝔠)(η/[𝔣]^*ω)(x_Ω). Here η is the differential with simple poles on E[3] whose residue at the origin is f_[𝔠](e) = N𝔠
− 1 = 8, a unit at 𝔪. Hence v_𝔪 = −v_𝔪(2−i) − v_𝔪(T(x_Ω)) < 0, where T is a parameter at the origin. Theorem 4.10
asserts membership in 𝒪_E R[1/(𝔣·9)], which does not invert 𝔪, so the theorem fails here. The proof of Theorem 5.27
(Step 4, p. 79; TeX: 'Applying Theorem 4.10 with 𝔣 = 𝔭̄_Σ shows that … is integral at p') also needs the Σ-relative
ring. With the literal ring and σ_0 ∈ Σ̄, the p-adic prime 𝔪_p has σ_0^{-1}(𝔪_p) ∈ Σ̄_p, so it is inverted and no
p-integrality follows.

**Fix.** Define R[1/𝔣]_Σ := ∩ R_𝔪 over the maximal ideals 𝔪 of R with σ(𝔣) ⊄ 𝔪 for all σ ∈ Σ, where Σ is the CM type of
𝒜, which equals the CM type attached to χ. Restate /011 (or state the ring inside /062, /064 and /065) and /062, /064
and /065 with it, including 'Spec 𝒪_k[1/(d_L N𝔠)][1/𝔣]_Σ'. With this ring the paper's proofs go through: [𝔣] is étale
and [𝔟](x_Ω) avoids 𝒟. Do not substitute R[1/N𝔣]: that is also true, but it breaks Step 4 of Theorem 5.27, because N𝔭̄_Σ
is a power of p. Add a a new sourceIssue with kind error, locator 'Notation 1.18 p. 12; proof of Theorem 4.9 p. 50;
Theorem 4.9 p. 50, Corollary 4.13 p. 52, Theorem 4.10 p. 51', and affects 'a stated result'. Algebraicity, and
integrality away from the primes over N𝔣, are unaffected.

### /8 — error

**Where.** PAPER-KINGS-SPRANG-25/083 (statement); sourceIssues (missed misprint)

**Claim.** Item 083 defines F̃(x, y) = χ_fin(x^{−1}, y) on (𝒪_L(Σ̄) ⊕ 𝒪_L(Σ))^×, so the inverted variable is the
𝒪_L(Σ̄_p)-component. The rest of §5 needs the 𝒪_L(Σ_p)-component (the t-variable, the one the partial Fourier transform
P acts on) to be inverted. The paper prints the same inconsistent order twice, and no sourceIssue records it. Read
literally, the item gives a different Local(χ, Σ), with the Gauss sum of χ_{fin,Σ_p} in place of that of its inverse and
χ_{fin,Σ̄_p}(c^{−1})^{−1} in place of χ_{fin,Σ̄_p}(c^{−1}), so the interpolation formula of item 084 becomes false for
characters ramified at Σ_p.

**Evidence.** Def. 5.26 context, p. 73, and proof of Thm 5.27, p. 75 (TeX): 'F̃ : (𝒪_L⊗ℤ_p)^× = (𝒪_L(Σ̄) ⊕ 𝒪_L(Σ))^× →
ℚ̄^× … F̃(x,y) := χ_fin(x^{−1},y)'. However, (5.7.1), p. 75, defines μ(𝔞_i) by ∫ρ dμ(𝔞_i) = ∫(ρ∘q)(t^{−1}, s) t^{−1}
dμ_Eis, which inverts t ∈ 𝒪_L(Σ_p); here t : 𝒪_L(Σ_p) → ⊕_{σ∈Σ}𝒪_{ℂ_p} by (5.4.1). With q(u) ↦ class of (λ) for u = λ_p,
χ(q(u)) = χ_fin(u)s(u)^β t(u)^{−α}, so the integrand is t^{α−1}s^β·χ_fin(t^{−1}, s), and Cor. 5.25 is then applied with
ρ = F̃ ((5.7.3), p. 75). Also p. 76: '(PF̃)(c^{−1}λ) = (PF)(c^{−1})·χ_fin(λ)'. Substituting x ↦ xλ^{−1} in P, which acts
on the 𝒪_L/𝔭_Σ^n variable ((5.5.11)), gives χ_fin(λ) only if the Σ_p-component is inverted. Inverting the Σ̄_p-component
gives χ_fin(λ)^{−1}, which does not reproduce the next display Σ χ_fin(λ)λ̄^β/λ^α N(λ)^{−s} = Σ χ((λ))N(λ)^{−s}. Also
(5.5.8), p. 70 writes 𝒪_L(Σ)/p^n ≅ (A[𝔭_Σ^n])^t, so 𝒪_L(Σ) means 𝒪_L(Σ_p).

**Fix.** In item 083 (and in the copy in item 084's proof sketch) write F̃(t, s) := χ_fin(t^{−1}, s) for (t, s) ∈
𝒪_L(Σ_p)^× × 𝒪_L(Σ̄_p)^×, so that F̃_𝔭 = χ_{fin,𝔭}∘inv for 𝔭 ∈ Σ_p and F̃_𝔭̄ = χ_{fin,𝔭̄} for 𝔭̄ ∈ Σ̄_p. Add a
sourceIssue (misprint; locator Def. 5.26 context, p. 73, and proof of Thm 5.27, p. 75; correction: (𝒪_L(Σ_p) ⊕
𝒪_L(Σ̄_p))^×; affects: nothing as intended).

### /9 — duplicate

**Where.** research/blueprint/papers/PAPER-KINGS-SPRANG-25.result.json, items PAPER-KINGS-SPRANG-25/060, /070, /071,
/072, /073, /074, /077, /079, /083 (all missing, routed to AutomorphicPadicLFunctionsPartIICriticalHeckeValues), against
AutomorphicPadicLFunctions:L3 and the planned item /069

**Claim.** The Part II plans Katz's p-adic apparatus again: CM periods, Γ_00(p^∞)/Γ_arith(p^∞) structures, formal tori,
p-adic periods, the p-adic differential operators, the Eisenstein measure and Katz's local factor. Its own parent layer
L3 owns all of these. The extraction admits that L3 plans the CM-field case in the notes of 070, 074 and 083. It even
marks the parallel generalization 069 (p-ordinary CM types) as planned at L3 ('the condition is the one on K'). Yet it
routes the rest as new. So the Part II does not 'start where the existing roadmap stops' (PROTOCOL §15), and two
roadmaps would build the same objects. Item 060's note, 'the CM-period definitions are not [planned]', is false.

**Evidence.** Atlas, AutomorphicPadicLFunctions:L3: 'The development includes CM abelian varieties and their integral
ordinary deformation/Igusa theory, algebraic and p-adic differential operators, CM periods, Eisenstein measure, and the
comparison of CM evaluations with critical Hecke L-values.' Accepted RS-14 (data/restructure/RS-14.result.json,
layers[AutomorphicPadicLFunctions:L3].keeps): 'For ordinary CM type ... own the Katz-specific ordinary deformation/lift
where not supplied, differential operators, CM periods, Eisenstein measure, critical-character evaluation and all
required integral comparisons.' Accepted PAPER-SKINNER-20/69, 'The complex and p-adic CM periods Ω and Ω_p', is planned
at [GrossZagierAndArithmeticHeights:GZ.9, AutomorphicPadicLFunctions:L3]. Paper, p-adic-interpolation section:
'Following Katz, we will say that the CM type Σ of L is ordinary', 'Similar as in [Katz-CM, §5.2] we will now associate
a local term Local(χ;Σ_p)', and Theorem 5.27 'generalizes results of Katz in case of a CM field'. The
AutomorphicPadicLFunctions packet has nodes only in L0/L2 (status partial, review pending), so L3 is not yet planned at
node level.

**Fix.** Give these objects one owner, as §15 requires ('plan it once, in the most general form those uses require, in
the roadmap that owns it'). Recommended: mark 060, 070–074, 077, 079 and 083 planned at AutomorphicPadicLFunctions:L3.
Add a request to L3's blueprint to state them for an abelian scheme with CM by O_L, L a totally imaginary field
containing the CM field K, with a lifted p-ordinary CM type; L = K is Katz's case. Then remove the items from the Part
II and have its brief import them from L3. Alternatively, narrow L3 so that it imports these definitions from the Part
II. Either way, record the choice in both briefs and correct the notes of 060, 070, 074 and 083.

## All findings

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | error | PAPER-KINGS-SPRANG-25/005 (Proposition 1.5 clause); … | Proposition 1.5, copied into item 005, is false as stated: an 'algebraic T_{L,R}-module' is an arbitrary R[I_L]-comodule, and for a module with R-torsion, Γ … |
| /2 | high | error | PAPER-KINGS-SPRANG-25/042 (and /041; … | The identity of Proposition 2.31, recorded in item 042, is off by the factor deg[f] = Nf. The refined class of Theorem 2.30 (item 041) sends the factor Ω^d … |
| /3 | high | error | PAPER-KINGS-SPRANG-25/039 (also /038, /040; … | The proof of Proposition 2.27 claims that res : H_{d−1}(Γ, Z) → H_{d−1}(Γ', Z) is surjective. This is false whenever Γ has torsion. For Γ = Γ^free × Γ^tors, … |
| /4 | high | error | PAPER-KINGS-SPRANG-25/053, /056, /057 (notes); … | The extraction says that with the corrections E2 and E3, the representative of Proposition 3.23 and the right sides of Theorem 3.27 and Corollary 3.28 pick up … |
| /5 | high | error | PAPER-KINGS-SPRANG-25/047; … | Proposition 3.13, and item 047 which copies it, says K^mu(H,z,w,s,Lambda) itself has simple poles at s = 0 and s = d, with residues -delta_{mu,z} e^{2 pi … |
| /6 | high | error | PAPER-KINGS-SPRANG-25/054; … | Lemma 3.25, E^{beta,alpha}(t',s;Lambda,Gamma') = [Gamma:Gamma'] E^{beta,alpha}(t',s;Lambda,Gamma), is false with Definition 3.24 as printed, whose summation … |
| /7 | high | error | PAPER-KINGS-SPRANG-25/062, /064, /065 (rings of integrality; … | The rings in Theorem 4.9 (R[1/(𝔣N(𝔟𝔠))]), Corollary 4.13 and Theorem 4.10 (𝒪_E R[1/(𝔣N𝔠)], and 'Spec R = Spec 𝒪_k[1/(d_L𝔣N𝔠)]') use R[1/𝔣] of Notation 1.18. … |
| /8 | high | error | PAPER-KINGS-SPRANG-25/083 (statement); … | Item 083 defines F̃(x, y) = χ_fin(x^{−1}, y) on (𝒪_L(Σ̄) ⊕ 𝒪_L(Σ))^×, so the inverted variable is the 𝒪_L(Σ̄_p)-component. The rest of §5 needs the … |
| /9 | high | duplicate | research/blueprint/papers/PAPER-KINGS-SPRANG-25.result.json, items … | The Part II plans Katz's p-adic apparatus again: CM periods, Γ_00(p^∞)/Γ_arith(p^∞) structures, formal tori, p-adic periods, the p-adic differential operators, … |
| /10 | medium | library-claim | PAPER-KINGS-SPRANG-25/004 (and routes[0] items; … | Item 004 (Theorem 1.1, weight decomposition of an algebraic T_{L,R}-module) is marked 'missing' and routed to the AutomorphicPadicLFunctions Part II on the … |
| /11 | medium | missing | PAPER-KINGS-SPRANG-25/005 and /058 (note); … | Weil's determination of the infinity types of algebraic Hecke characters is cited on p. 7 and used on the main line, but it has no item of its own: it survives … |
| /12 | medium | missing | PAPER-KINGS-SPRANG-25/008; … | Proposition 1.11 asserts that the type of an abelian scheme with CM by O_L is a lifted CM type, that is, lifted from a CM type of the maximal CM subfield K. … |
| /13 | medium | error | PAPER-KINGS-SPRANG-25/012 (status, planned, statement); … | Item 012 is marked planned at ComplexMultiplicationAndExplicitReciprocity:CM.2. CM.2 is the comparison of the CM reciprocity law with the CM.0 type and reflex … |
| /14 | medium | error | PAPER-KINGS-SPRANG-25/003 (status, planned, library); … | Item 003 is marked 'planned' at ComplexMultiplicationAndExplicitReciprocity:CM.0, but CM.0 plans only CM types, orders and reflex norms of CM fields. The other … |
| /15 | medium | error | PAPER-KINGS-SPRANG-25/007 (status, planned) | Item 007 is marked planned at AbelianSchemesAndArithmeticModuli A2 and A4, but two of its parts are planned by neither. First, the duality pairing H^1_dR(𝒜/𝒮) … |
| /16 | medium | error | routes[3] (source of ComplexMultiplicationAndExplicitReciprocity …; … | Items 006, 008 and 009 cover the Serre construction 𝔞 ⊗_T 𝒜 for abelian schemes of any dimension, the decomposition of Lie, ω_{𝒜^∨} and ℋ under the CM type … |
| /17 | medium | error | PAPER-KINGS-SPRANG-25/039 (sourceIssues: missing entry); … | Item 039 copies the printed definition L^1_R := ker(N_{L/Q} : (R⊗L)^× → R^×). For totally imaginary L this group is {z ∈ (C^×)^Σ : ∏/z_σ/^2 = 1} ≅ (S^1)^d × … |
| /18 | medium | error | PAPER-KINGS-SPRANG-25/041, PAPER-KINGS-SPRANG-25/042 | Items 041 and 042 drop the hypothesis that x factors through U_D = A ∖ A[c]. Item 042 also drops 'x fixed by Γ' and 'β − α − 1̲ ∈ Crit_L(Γ)'. Without the U_D … |
| /19 | medium | missing | PAPER-KINGS-SPRANG-25/021 (Theorem 2.15); … | Theorem 2.15 is the vanishing theorem on which the whole construction rests. It is deduced from three cited results, and none of them has an item. (a) The … |
| /20 | medium | missing | PAPER-KINGS-SPRANG-25/026, PAPER-KINGS-SPRANG-25/032 (Corollary 2.17) | Corollary 2.17 rests on an equivariant Leray spectral sequence H^p(S, Γ; R^qπ_*ℱ) ⇒ H^{p+q}(A, Γ; ℱ), for a Γ-equivariant (non-quasi-coherent) sheaf on A with … |
| /21 | medium | error | PAPER-KINGS-SPRANG-25/054; … | Definition 3.24, and item 054, define E^{beta,alpha}(t',s;Lambda,Gamma) for Re s > (b-a)/2 + d. For an infinity type of Hecke character type, beta_i - alpha_i … |
| /22 | medium | error | PAPER-KINGS-SPRANG-25/048, /050, /051, /043 | The items are not stated in corrected form consistently (PROTOCOL section 18: 'Items and nodes use the corrected statements'). Item 048 defines phi^{(b,j)}_s … |
| /23 | medium | missing | PAPER-KINGS-SPRANG-25/023 (Theorem 3.5); … | Theorem 3.5 is proved by composing Scheider's theorem (item 022) with a cited result of Levin: the C^infty description of the first logarithm sheaf, … |
| /24 | medium | missing | PAPER-KINGS-SPRANG-25/044, /052 (Lemma 3.8, Corollary 3.22) | Section 3 never compares algebraic and analytic coherent cohomology. Section 2 defines EK_Gamma(f) in algebraic equivariant cohomology H^{d-1}(U_D, Gamma; P^ … |
| /25 | medium | missing | PAPER-KINGS-SPRANG-25/023, /045, /047, /048, /051 | Three classical complex-analytic and harmonic-analysis inputs of Section 3 are cited or used without items. (a) The Dolbeault–Grothendieck lemma for … |
| /26 | medium | missing | PAPER-KINGS-SPRANG-25/056 (proof of Theorem 3.27) | The proof of Theorem 3.27 uses two topological inputs that have no items. (1) The de Rham comparison H^{d-1}(Gamma, C) = H^{d-1}_dR(B Gamma) for the Borel … |
| /27 | medium | error | PAPER-KINGS-SPRANG-25/062, /064, /065, /066 | These statements omit the standing hypotheses of §§4.3–4.5. (1) 𝒜 must have CM type Σ equal to the CM type attached to χ (in /062, to β − α), and in /066 𝒜_0 … |
| /28 | medium | error | PAPER-KINGS-SPRANG-25/059 | The statement never says that 𝔟 is integral (and prime to 𝔣), and item /058 lets [𝔟] range over all of ℐ(𝔣)/𝒫_𝔣. For a fractional 𝔟 both the bijection and … |
| /29 | medium | error | PAPER-KINGS-SPRANG-25/030; … | The proof of (A.2.1) in Appendix A.2 claims that Ĩ = q^Γ_*p^{-1}I is flabby for every injective Γ-equivariant I. That is false, and so is the step behind it, … |
| /30 | medium | error | PAPER-KINGS-SPRANG-25/082 and /084 (statements); … | The class field theory sequence is stated with G = (𝒪_L⊗ℤ_p)^×/E(𝒪_L^×). For conductor 𝔣 ≠ 𝒪_L the kernel of Gal(L(p^∞𝔣)/L) → Gal(L(𝔣)/L) is … |
| /31 | medium | error | PAPER-KINGS-SPRANG-25/084 (statement); … | Theorem 5.27 is stated without the hypotheses and data that give it meaning. (a) The standing assumption of §5 that p ∤ d_L is missing. Without it 𝒪_L⊗𝒪_{ℂ_p} … |
| /32 | medium | error | PAPER-KINGS-SPRANG-25/069 (statement); … | The item, following the paper, says that for Σ lifted from K, (ORD-p) 'means' that every prime of F over p splits in K. Splitting is necessary but not … |
| /33 | medium | missing | sourceIssues (missed gap); … | Γ-fixedness of the evaluation points. ϑ_Γ(f, y) (Def. 5.16) and Eis_Γ(f, y) (Def. 2.24) need y to be fixed by Γ, since otherwise Γ does not act on 𝒜̂_y. Thm … |
| /34 | medium | missing | sourceIssues (missed gap); … | Step 4 (𝔣 = 𝒪_L) concludes that the pseudo-measure μ_{𝔠,𝔠′}/(1 − 𝔠′) is a measure, and the justification does not suffice. (a) It cites Thm 4.10 with 𝔣 = 𝔭̄_Σ. … |
| /35 | medium | missing | items (no item); … | Step 2 of Thm 5.27, and Step 4 through it, removes the auxiliary ideal by citing de Shalit's argument. The pseudo-measure μ_{𝔣,𝔠}/δ_𝔠, with δ_𝔠 = N𝔠 − 𝔠^{−1}, … |
| /36 | medium | missing | items (no item); … | Prop. 5.6 deduces 𝒜̂ ≅ Ĝ_m ⊗_{ℤ_p} 𝒪_L(Σ_p) from the Γ_00(p^∞)-structure by 'the equivalence of p-divisible formal groups and infinitesimal p-divisible groups' … |
| /37 | medium | missing | research/blueprint/papers/PAPER-KINGS-SPRANG-25.result.json, item …; … | Item 067 is marked planned. Yet its statement includes motives M(χ) of critical algebraic Hecke characters (absolute Hodge cycles), the restriction of scalars … |
| /38 | medium | duplicate | research/blueprint/papers/PAPER-KINGS-SPRANG-25.result.json, item … | Item 028 is routed as new work for SF.2. It covers derived limits R lim of a tower via the triangle K → ∏K_n → ∏K_n, and the Milnor exact sequence 0 → R^1lim … |
| /39 | medium | library-claim | research/blueprint/papers/PAPER-KINGS-SPRANG-25.result.json, …; … | The extraction says 'Neither library has ... cohomology of O-modules on schemes', and item 026's note says 'cohomology of O_X-modules on a scheme ... [is] … |
| /40 | medium | library-claim | research/blueprint/papers/PAPER-KINGS-SPRANG-25.result.json, item …; … | Item 001 is marked library, but its statement goes beyond the cited declarations. It adds 'every torsion-free subgroup Γ ⊂ O_L^× of finite index is free … |
| /41 | medium | error | research/blueprint/papers/PAPER-KINGS-SPRANG-25.result.json, item … | The planned owner is wrong. Before this extraction was accepted, the accepted RS-14 moved complex Hecke characters, algebraic infinity types and finite … |
| /42 | medium | error | research/blueprint/papers/PAPER-KINGS-SPRANG-25.result.json, item … | Item 030 is the Borel construction: Γ ≅ Z^r acting on a smooth manifold X, sheaves on EΓ ×_Γ X with EΓ = Γ ⊗ R, and contractibility of EΓ. It is topological … |
| /43 | medium | error | research/blueprint/papers/PAPER-KINGS-SPRANG-25.result.json, … | Items 024 and 025 (Proposition 5.9, Lemmas 5.11–5.14) assume the setting of Notation 5.1. That setting is: CM by O_L, a p-ordinary lifted CM type, the … |
| /44 | medium | duplicate | research/blueprint/papers/PAPER-KINGS-SPRANG-25.result.json, item …; … | The AS Part II is justified with 'nothing in the atlas constructs the universal vector extension'. But an accepted extraction already routes the universal … |
| /45 | medium | error | research/blueprint/papers/PAPER-KINGS-SPRANG-25.result.json, … | The brief does not state the final theorems 'exactly as the paper does', as PROTOCOL §16 requires. For Theorem 5.27 it gives no interpolation formula … |
| /46 | medium | missing | research/blueprint/papers/PAPER-KINGS-SPRANG-25.result.json, items … | For d = 1 the generalized Eisenstein–Kronecker series K^μ and its functional equation specialize to series that an accepted, finished blueprint already plans. … |
| /47 | low | error | sourceIssues PAPER-KINGS-SPRANG-25/E4 (locator); … | The verdict on E4 is right: a critical central value can vanish. But E4's locator leaves out the Introduction, which states the same false ℚ̄^× claim. Also: … |
| /48 | low | error | PAPER-KINGS-SPRANG-25/084 (statement); … | Both the Introduction's p-adic theorem and Theorem 5.27 say 'for every fractional ideal 𝔣'. The modulus of the ray class field L(p^∞𝔣) must be an integral … |
| /49 | low | other | PAPER-KINGS-SPRANG-25/005 (statement) | Item 005 copies two notational slips of the paper. (i) The weight condition is printed 'for all σ_0 ∈ Σ_K' before any CM type Σ_K has been fixed; the intended … |
| /50 | low | error | PAPER-KINGS-SPRANG-25/033 (and /035; … | Item 033 reproduces a misprint: 'δ_# : 𝒫̂/_𝒟 ≅ π_𝒟^*𝒪̂_{𝒜'}'. By Corollary 2.9 the right-hand side is π_𝒟^*𝒪_{𝒜̂'^∨}, the completion of the dual A'^∨ at its … |
| /51 | low | other | PAPER-KINGS-SPRANG-25/035 (Theorem 2.20, §2.6), /034 | Item 035 records that the composite O_S[D]^Γ → H^d_D → H^0(S, O_S) is the trace. The paper asserts this without proof. Its normalisation depends jointly on … |
| /52 | low | missing | PAPER-KINGS-SPRANG-25/017, /019 | Corollary 2.11 turns the isomorphisms (γ_#)^{-1} into a Γ-equivariant structure. That needs the cocycle identity (γγ')_# = γ'^*(γ_#) ∘ γ'_#, together with id_# … |
| /53 | low | other | PAPER-KINGS-SPRANG-25/039, /038 | Proposition 2.27 maps into TSym^{α+1̲}(ω) but never says how TSym^α(ω) ⊗ TSym^{1̲}(ω) → TSym^{α+1̲}(ω) is formed. §3 uses the concatenation dz^{[α]} ⊗ ∧_i dz_i … |
| /54 | low | other | PAPER-KINGS-SPRANG-25/010, /037, /038, /039, /040, /041, /042; … | The items use the TeX macro names rather than the printed notation. They write 'Eis^{b,a}_Γ', 'Eis^{β,α}_Γ' and '_{[𝔣]}Eis' where the paper prints EK^{b,a}_Γ, … |
| /55 | low | missing | prerequisites; … | Four works that Section 3 cites for results it uses are missing from 'prerequisites': Siegel's Advanced analytic number theory (TIFR 1980; Theorem 3 and … |
| /56 | low | error | PAPER-KINGS-SPRANG-25/051, /052, /053 | Theorem 3.20, Corollary 3.22 and Proposition 3.23 sit in Section 3.5. The torsion-free assumption on Gamma is stated only 'in this subsection' for Sections 3.2 … |
| /57 | low | error | PAPER-KINGS-SPRANG-25/049, /053; … | Three misprints in Section 3 are unrecorded. One of them item 049 silently corrects. (1) Proof of Lemma 3.16(c), p. 38: after omega_1 = d (wedge_{i<d} dz_i ^ … |
| /58 | low | other | PAPER-KINGS-SPRANG-25/051, /052 (Definition 3.19) | Definition 3.19 calls delta_t 'the delta-distribution concentrated in t' without a normalization. The Fourier-mode equation in the proof of Theorem 3.20 forces … |
| /59 | low | other | sourceIssues (missing entry for the proofs of Theorem 4.10 and … | The proofs of Theorem 4.10 and Corollary 4.13 have two small gaps that the extraction does not record. (1) The intersection step needs the norms of the two … |
| /60 | low | error | PAPER-KINGS-SPRANG-25/067 (locator) | The locator 'proof of Corollary 4.15, p. 54' gives the wrong page: the proof is on p. 55. |
| /61 | low | other | PAPER-KINGS-SPRANG-25/029 | Lemma B.3 asserts in the equivariant derived category 𝒟(𝒪_X, Γ) results that the cited Stacks lemmas prove only for D^+(𝒜) or D(𝒪_X). The transfer is left … |
| /62 | low | missing | PAPER-KINGS-SPRANG-25/058 | /058 is a 'definition' item marked planned (L0, AL.1). It also contains a cited theorem that neither stage plans: the criticality criterion. For L containing a … |
| /63 | low | error | PAPER-KINGS-SPRANG-25/063, /064 (hypotheses) | /064 does not say that 𝔟 and 𝔠 are integral and pairwise coprime with 𝔣. /063 reads 'pairwise coprime integral 𝔣, 𝔟, 𝔠 ≠ 𝒪_L', which suggests all three are ≠ … |
| /64 | low | other | sourceIssues (misprints in Propositions 4.6 and 4.7 not recorded) | Two misprints in the proofs of §4.2 are not recorded. In the proof of Proposition 4.6, ξ_{𝒪_L}(1) ∈ H_1 is mapped by an isomorphism whose source is printed as … |
| /65 | low | error | PAPER-KINGS-SPRANG-25/082 (statement) | The defining identity of χ_fin is stated 'for λ prime to p𝔣'. If the prime-to-p conductor of χ is non-trivial, χ((λ)) depends on λ mod 𝔣, which a function of … |
| /66 | low | missing | sourceIssues (missed misprint); … | In (5.7.4) Katz's factor is printed with Chr_𝔭(λ) = 1 − 1/N𝔭 only for ord_𝔭(λ) = 0 and 0 'else', so it is 0 for ord_𝔭(λ) ≥ 1. P depends only on λ mod 𝒪_𝔭 at 𝔭 … |
| /67 | low | missing | sourceIssues (missed misprint) | Equation (5.5.8) swaps 𝔭_Σ and 𝔭̄_Σ in two places, against (5.1.2), Prop. 5.4(3) and Def. 5.24. |
| /68 | low | missing | sourceIssues (missed misprint); … | The proof of Lemma 5.11 swaps the labels Σ and Σ̄. It says ker(ℋ ↠ ω_{A^∨}) = ℋ(Σ̄) and calls ℋ(Σ̄) the unit-root space. By Prop. 1.11, however, ω_{𝒜^∨} = … |
| /69 | low | error | PAPER-KINGS-SPRANG-25/071 note | The note says the Weil pairing of an isogeny is planned in A3. A3 plans only the Weil pairing between A[n] and A^∨[n]. §5 uses the pairing ⟨·,·⟩_φ : ker φ × … |
| /70 | low | error | PAPER-KINGS-SPRANG-25/078, /079 (statements) | Prop. 5.20 and Thm 5.22 hold only after a Γ_00(p^∞)-structure (θ_p, θ_p^∨) is fixed. The identification (𝒜×𝒜^∨)^∧ = Hom_{ℤ_p}(𝒪_L⊗ℤ_p, Ĝ_m), ω_can, … |
| /71 | low | library-claim | research/blueprint/papers/PAPER-KINGS-SPRANG-25.result.json, …; … | Mathlib's abstract-measure carrier D(X, R) is defined for any topological space X, so measures on O_L ⊗ Z_p already have a library carrier, and Mathlib has the … |
| /72 | low | other | research/blueprint/papers/PAPER-KINGS-SPRANG-25.result.json, … | Both parents were retitled as Part IIs by accepted restructurings that are promoted into data/restructure/. The route titles still use the pre-restructure … |
| /73 | low | other | research/blueprint/papers/PAPER-KINGS-SPRANG-25.result.json, … | PROTOCOL §16 asks briefs to name imported roadmaps 'by title and id'. Most imports are given by id only (e.g. 'AutomorphicLFunctionsAndLocalFactors AL.1', … |
| /74 | low | other | research/blueprint/papers/PAPER-KINGS-SPRANG-25.result.json, routes[0]; … | Another accepted extraction proposes a Part II of the same parent, and make_queue merges all such proposals into one design job. The brief never mentions that … |

## Notes for the fix job

- **Signs.** Proposition 3.23's two further sign slips change the net correction recorded under E2 and E3, and E6's
  leftover factor in Theorem 5.27. Rework them together. The d = 1 case gives an independent check, (−1)^{a+b}·a!.
- **Source issues.** Record each paper mistake confirmed here under PROTOCOL §18.
- **Ownership.** Move the Katz apparatus to L3, as RS-14 directs. Settle the two Part IIs' mutual dependence and the d =
  1 compatibility with EllipticRegulators together, since `make_queue.py` merges design jobs by parent.
