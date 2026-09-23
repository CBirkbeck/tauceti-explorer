# PAPER-DASGUPTA-KAKDE-VENTULLO-18: On the Gross–Stark Conjecture

Samit Dasgupta, Mahesh Kakde and Kevin Ventullo, *On the Gross–Stark Conjecture*, [Annals of Mathematics (2) 188 (2018), no. 3, 833–870](https://doi.org/10.4007/annals.2018.188.3.3); arXiv [1605.08169](https://arxiv.org/abs/1605.08169) (v1).

Extraction by Claude Code, session `cc-d67081`, 22 September 2026 (issue #1147). Status: **complete**. Every missing item is routed exactly once. The machine-readable extraction is [PAPER-DASGUPTA-KAKDE-VENTULLO-18.result.json](PAPER-DASGUPTA-KAKDE-VENTULLO-18.result.json):

- 118 items: 1 in the libraries, 15 planned, 102 missing;
- 4 routes: one Part II and three source routes;
- 24 prerequisite entries;
- 9 source issues.

**Source.** The **published version is free**: the Annals article page advertises the full text through its `citation_pdf_url`, and that PDF (SHA-256 `974e6427…2fb659`, accessed 2026-09-22) was read in full on 2026-09-22. Every recorded misprint was checked on a page image. **All locators are to the published pages, 833–870.**

arXiv:1605.08169v1 (26 May 2016, the only version) was diffed word by word against it. The differences are front matter, an added cross-reference (which is itself a misprint, E5), an expanded Remark 3.4, a trimmed bibliography, and one typo corrected in print (E9). From equation (29) on, the published numbers run one higher than v1's.

The cited inputs were not read; each item that rests on one says so.

Two notational warnings for anyone reading the PDF through a text extractor. The paper prints **φ for the empty set** — "R′ = φ" means R′ = ∅ — and R′, T′ and φ′ are primed, not subscripted by zero; extraction renders them "R0", "T0", "ϕ0". Superscripts are lost: the dimensions on pp. 852 and 854 are 2^r + r_an − 1 and 2^r + 2r_an − 2, not "2r + ran − 1". Statements below use ∅, and L_an, L_alg for the script-L invariants.

## What the paper proves

**The conjecture.** F is totally real, χ : G_F → Q̄^* is totally odd, H/F is the CM extension it cuts out, p is a prime and E = Q_p(χ). The primes of F above p split as R ∪ R′ according to whether χ(p) = 1, and r = r_p(χ) = #R. On the χ-component U_χ of the p-units of H, the valuation and the p-adic logarithm of the norm give maps o_p^χ, ℓ_p^χ : U_χ → X_χ with o_p^χ an isomorphism; Gross's regulator is R_p(χ) = det(ℓ_p^χ ∘ (o_p^χ)^{-1}). Gross conjectured in 1980 that

- **Conjecture 1.** ord_{s=0} L_p(χω, s) = r, for the Deligne–Ribet p-adic L-function; and
- **Conjecture 2.** L_p^{(r)}(χω, 0) / (r! L(χ, 0)) = R_p(χ) ∏_{p ∈ R′}(1 − χ(p)).

**Theorem 1** is Conjecture 2: L_an(χ) = R_p(χ). Since the inequality ord ≥ r is known, Conjecture 1 becomes unconditionally equivalent to R_p(χ) ≠ 0. Gross proved both for F = Q; Dasgupta–Darmon–Pollack and then Ventullo proved Theorem 1 for r = 1.

**The obstruction.** In rank one the conjecture is equivalent to the existence of a cyclotomic class κ ∈ H^1_cyc(χ) with res_p κ = L_an(χ) o_p + ℓ_p, and that class is what the earlier papers construct. The construction rests on the injectivity of H^1_R(G_F, E(χ^{-1})) → H^1(G_p, E), which fails for r > 1. The authors say they do not know how to construct even one cyclotomic class in general, and believe the corresponding local statement to be false for r ≥ 3.

**The new method.** Do not compute L_alg(χ); use the orthogonality directly.

1. **Orthogonality (Proposition 2.1).** For κ ∈ H^1_R(G_F, V(χ^{-1})) and u ∈ U_χ, Σ_{i=1}^r (res_{p_i} κ)(u) = 0. Two proofs are given: one from Poitou–Tate duality and the Kummer map, one from class field theory alone. Proposition 2.2 supplies the substitute for the lost injectivity: no nonzero class in H^1_R is unramified at every p ∈ R.
2. **An infinitesimal eigenform (§3).** A combination of Hilbert Eisenstein series with Ventullo's family G gives a cuspidal Hida family F specializing in weight one to E_1(1, χ_S), whose constant terms carry L_p(χω, 1−k). F is **not** an eigenform modulo π^{r+1}; the idea drawn from Ventullo is to study its whole Hecke orbit, which is finite-dimensional over E[π]/π^{r_an+1}. This yields Λ-algebra homomorphisms ϕ from the Hecke algebra onto explicit local Artin rings — W_1 in Case 1 (R′ ≠ ∅), W_2 in Case 2 (R′ = ∅, ν_1(W) ≠ 0), W_3 in Case 3 (R′ = ∅, ν_1(W) = 0) — with T_l ↦ 1 + χε(l), U_{p_i} ↦ 1 + ε_i, and the single relation ε_1 ⋯ ε_r = −(−1)^{r_an} L*_an(χ) π^{r_an} holding the leading term of the p-adic L-function. Injectivity is a dimension count: dim W_1 = 2^r + r_an − 1, dim W_2 = 2^r + 2r_an − 2.
3. **A cohomology class (§4).** The Galois representations of Wiles and Hida attached to the Hida eigenfamilies glue, over the reduced localized Hecke algebra, to ρ : G_F → GL_2(L); its upper right entries give κ(σ) = b̄(σ)χ^{-1}(σ) ∈ H^1(G_F, B̄(χ^{-1})), unramified outside R. Ribet's wrench — comparing the global basis diagonalizing ρ(τ) with the local basis in which ρ|_{G_p} is triangular — and Lemma 4.4, which computes ϕ_m on the diagonal entries, bound B̄ from above (Lemmas 4.6–4.9).
4. **The regulator (§5).** The r orthogonality equations make a determinant vanish, because its rows sum to 0; pushing it through ϕ_m into the one-dimensional space m_W^r/m_W^{r+1} gives (−1)^{r+1} L_an(χ) det(o_i(u_j)) + det(ℓ_i(u_j)) = 0, which is Theorem 1. Case 3 requires the same argument with the lower left entries of ρ, which also fills a hole at the end of the rank one paper (Remark 5.2).

## What the libraries and the atlas already have

**The libraries have almost nothing of this.** The one library item is Dirichlet's unit theorem: Mathlib at 082e2d3 has `NumberField.Units.rank`, `NumberField.Units.unitLattice_rank` and `NumberField.Units.finrank_modTorsion` (the name `rank_modTorsion` is deprecated there). The S-unit theorem the paper actually uses is a separate, missing item.

Tau Ceti at f790474 has three near misses, recorded as notes on the items that need them: the local Teichmüller lift `TauCeti.teichmuller`, the formal logarithm `NormedSpace.logOneAdd` (which gives log on 1-units but not Iwasawa's log_p on Q_p^*), and Chebotarev infrastructure — `NumberField.Chebotarev.frobeniusPrimeSet`, the auxiliary prime, prime counting — but **not** the density theorem. Neither library has a p-adic L-function, an Artin map, a Hilbert modular form, a Hida family or continuous Galois cohomology duality.

**The atlas plans the inputs, but not the theorem.** Fifteen items are planned:

- the Deligne–Ribet p-adic L-function, Siegel's algebraicity, the Hilbert Eisenstein series E_k(1, η) and the Eisenstein family E(1, χ) — AutomorphicPadicLFunctions L3, with IntegralIwasawaTheory I.3;
- Λ-adic Hilbert modular forms, Hida families and the ordinary projector — PadicFamilies L5 and L0a;
- the Galois representations of Theorem 4.1 — OrdinaryAutomorphicFormsAndModularityLifting R21.3;
- local Tate duality and the Poitou–Tate orthogonality — ArithmeticGaloisDuality R02.4;
- Iwasawa's p-adic logarithm and the Teichmüller character — DirichletPadicLFunctions L3;
- the inequality ord_{s=0} L_p(χω, s) ≥ r, through Wiles's totally real main conjecture — IntegralIwasawaTheory I.5;
- the local Artin map in Serre's normalization, global reciprocity and the Hilbert class field — Tau Ceti's ClassFieldTheory, Layers 7, 11 and 13; Chebotarev's theorem — Tau Ceti's Chebotarev, Layers 9–10.

**Nothing plans the subject.** Searches across the atlas for "Gross–Stark" and "Gross regulator" return nothing at all. "p-adic regulator" returns only the K-theoretic regulators of PadicHodgeRegulators D.4, HabiroNumberFields HB.7, HabiroNahmSeries HB.9 and K3BlochGroups V.6; "L-invariant" and "exceptional zero" return the multiplicative exceptional-zero formula for elliptic curves (GrossZagierAndArithmeticHeights GZ.9), the instruction never to cancel an exceptional zero in an Euler factor (AutomorphicLFunctionsAndLocalFactors AL.5), and the leading-term and Bockstein/regulator data of the noncommutative equivariant theory (NoncommutativeAndEquivariantIwasawa NE.7). None of these is Gross's regulator or this conjecture. IntegralIwasawaTheory I.6–I.7 plan the integral Brumer–Stark theorem of Dasgupta–Kakde, the nearest neighbour, and I.5 Wiles's main conjecture, but no layer mentions this conjecture.

## Routes

**1. A Part II: `IntegralIwasawaTheoryPartII` (93 items).** Title "Arithmetic Iwasawa theory and the main conjecture, Part II: the Gross–Stark conjecture"; area `automorphic`.

The brief sets out six parts: the statement and the regulator; the cohomological reformulation, with both proofs of the orthogonality and with Proposition 2.2; Hida theory in weight one, up to the trichotomy of cases; the infinitesimal eigenform and the three Artin rings; the cohomology class, Ribet's wrench and Lemma 4.4; and the computation of the regulator, including the c-cocycle argument for χ^{-1} in Case 3. It imports the six atlas roadmaps and the two Tau Ceti roadmaps listed above.

It is a Part II of IntegralIwasawaTheory rather than a new roadmap because that roadmap already owns the Deligne–Ribet dictionary (I.3), Wiles's totally real main conjecture with its Hecke algebras, Eisenstein ideals and Galois representations (I.5), and the integral Brumer–Stark theorem of Dasgupta–Kakde (I.6–I.7) — the same authors, the same Hilbert modular congruences and the same generalised Ribet method. The Gross–Stark conjecture is that programme's neighbour, but it is a distinct theorem with its own machinery, so it does not belong inside the existing layers.

**2. Source of AutomorphicPadicLFunctions L0 (3 items).** The complex side: the Artin L-function L(χ, s) of the ray-class character attached to χ, the p-depleted L*(χ, s) with the paper's convention χ(p) = 0 at ramified primes, and the non-vanishing L(χ, 0) ≠ 0 for totally odd χ, which the paper states as well known with no reference and which both Conjecture 2 and L_an(χ) need to be defined. L0 owns ray-class characters, their avatars, conductors and local factors.

**3. Source of DirichletPadicLFunctions L3 (3 items).** The p-adic Gamma function, the Gross–Koblitz formula and the Ferrero–Greenberg theorem — the inputs to the case F = Q that motivated the conjecture. L3 already owns Iwasawa's logarithm, the branches and Leopoldt's p-adic formula, and Ferrero–Greenberg is the companion statement about the derivative at s = 0.

**4. Source of PadicFamilies L5 (3 items).** Three facts about Hida families over a totally real field used without proof: a cuspidal Hida family is determined by its Fourier expansion; the localized Hecke algebra is reduced, because tame level equal to the conductor of the tame character leaves no n-old forms; and its total ring of fractions is the product of the fields of the cuspidal Hida eigenfamilies. The paper stresses that the second was missing from the rank one paper and credits Hida for pointing it out.

## Source issues (`sourceIssues` E1–E9)

Two gaps, six misprints in the published text and one arXiv-only misprint already corrected in print.

**E1 (gap, affects the proof). §3.5, p. 856.** The injectivity of W_3 → ϕ(T) ⊗ E — the last step of Theorem 3.8, and so of the whole Case 3 — reduces to the linear independence of an explicit list of forms, and that "is similar to the previous cases and left to the reader". The Case 2 argument it refers to runs to two pages and splits into the subcases ν_1(W) ≠ −1 and ν_1(W) = −1, and W_3 has a different relation ideal, so the transfer is not mechanical.

**E2 (gap, affects nothing). §4.3, Remark 4.5, p. 863.** The remark takes I to be the kernel of "φ′ : T_m → E[π]/(π^{r_an+1})", but no such homomorphism has been constructed: the only φ′ in the paper is that of Remark 3.4, whose domain is the subalgebra T′ ⊂ T and whose target is E[π]/π^{r+1}. A map of the stated shape need not exist. Any Λ-algebra homomorphism W → E[π]/(π^{r_an+1}) must send each ε_i into the annihilator of π, that is into E·π^{r_an}; for r ≥ 2 the product ε_1 ⋯ ε_r then maps to 0, and the relation ε_1 ⋯ ε_r + (−1)^{r_an} L*_an(χ)π^{r_an} = 0 forces L*_an(χ) = 0. So no such φ′ factors through ϕ_m except when L*_an(χ) = 0 or r = 1. The remark is an aside, used nowhere else, and it ends by saying the class it builds is not known to be useful.

**Six misprints in the published text.** A wrong argument in the definition of L*_an(χ), which is printed with L_p^{(r_an)}(χ, 0) where L_p^{(r_an)}(χω, 0) is meant (E3, p. 841); a chain of equalities that begins and ends with r_an(χ), where the last term should be r_an(χ^{-1}), leaving the sentence vacuous (E4, p. 849); a cross-reference to equation (2), the p-depleted L-function, for the definitions of r_an and L*_an, which are in §1.3 (E5, p. 850 — this sentence is new in the published version); char(ρ_H(Frob_l)) for char(ρ(Frob_l)) in property (2) of the glued representation ρ (E6, (63), p. 860); the cocycle relation for c printed as c(σ)a(σ) + d(σ)c(σ′), for σσ′ ∈ G_F, where the matrix product gives c(σ)a(σ′) + d(σ)c(σ′) for σ, σ′ ∈ G_F (E7, p. 867); and a forward reference to the Poitou–Tate pairing (21) where the identity (10) is what is applied (E8, p. 842 — the same announcement at the end of §1.2 cites (10)). All six are also in arXiv v1 except E5. None affects the mathematics.

**E9 (corrected in print).** arXiv v1 defines o_P and ℓ_P on F_P^* where the completion is H_P — P is a prime of O_H, and F has no prime P. The published version prints H_P. Recorded so that anyone working from the arXiv text uses the corrected statement.

Remark 5.2, where the authors record that this argument fills a hole at the end of the proof of Theorem 4.4 of Dasgupta–Darmon–Pollack, is an item rather than a source issue: it is a correction to another paper, made here in full.

## Prerequisites not yet covered

**The conjecture and the earlier cases:** Gross's 1981 paper; Dasgupta–Darmon–Pollack and Ventullo for rank one; Gross–Koblitz and Ferrero–Greenberg for F = Q; Federer–Gross for the valuations; Burns and Dasgupta–Spiess for the later evidence and the open generalization of Remark 1.1.

**The p-adic L-function:** Deligne–Ribet, Cassou-Noguès, Charollois–Dasgupta, the two papers of Spieß and Beilinson–Kings–Levin.

**Hida theory and Galois representations:** Wiles's λ-adic representations (Theorem 4.1) and his Iwasawa conjecture for totally real fields; Hida's 1988 Annals paper, for Hilbert modular Hecke algebras and for the absence of n-old forms.

**Ribet's method:** Ribet 1976, Mazur–Wiles, Mazur's survey (for the wrench) and Skinner's CMI notes, for which no DOI or stable URL was found.

**Background:** Tate's Stark conjectures book (the classical regulator and U^- ⊗ Q ≅ X^- ⊗ Q), Serre's *Corps locaux* (the normalization of the reciprocity map) and Greenberg on trivial zeroes.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-DASGUPTA-KAKDE-VENTULLO-18.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the three files: 3 files, 0 problems.
- Lean: none. Nothing here is formalised, and no Lean file was written or built.
- Every library declaration cited was read at the pinned commits: Mathlib 082e2d3 and Tau Ceti f790474. The deprecation of `NumberField.Units.rank_modTorsion` in favour of `finrank_modTorsion` was checked in the file itself.
- Every prerequisite DOI was resolved on Crossref; the three entries without one (Gross 1981, Tate 1984, Serre 1962) link to MathSciNet, and Skinner's notes say that no stable link was found.
- Every misprint was checked on a page image rendered from the published PDF; E4, E6 and E7 were checked that way specifically because text extraction is unreliable for primes and superscripts.
- The dimension counts 2^r + r_an − 1 and 2^r + 2r_an − 2 were recomputed from the stated generators, and the sign in (87) was checked against (8) and (17): L_an(χ) = (−1)^r det(ℓ_i(u_j))/det(o_i(u_j)) = R_p(χ) in all three.
- The claim in E2 that no Λ-algebra homomorphism W → E[π]/(π^{r_an+1}) exists for r ≥ 2 unless L*_an(χ) = 0 was verified from the relations of W_1 by hand.

## Review (REV-PAPER-DASGUPTA-KAKDE-VENTULLO-18, 23 September 2026)

The review, by Claude Code (session cc-39fac3), accepted the extraction and its four routes after corrections made in place. The full record is `research/blueprint/reviews/REV-PAPER-DASGUPTA-KAKDE-VENTULLO-18.md`.

- **Statements and locators:** 27 statements and 10 locators corrected.
- **Statuses:**
  - ineq-4 changed from planned to missing, routed to the Part II;
  - local-tate-duality re-pointed to ClassFieldTheory Layer 5 and ArithmeticGaloisDuality:D7.
- **New items:** 7 (1 library, 6 missing). The Part II brief has a corrections paragraph.
- **Source issues:** E1 and E8 are rejected, and the other seven are confirmed. E10–E35 are new:
  - The published Theorem 3.2 lost arXiv v1's normalisation ν_1(t)E_1(1, χ_S) = E_1(1, χ_S), which the later proofs need (E18). Restoring it repairs them.
  - The rest are misprints and local slips that affect nothing.
  - Theorem 1 stands.
