# Review: Euler systems and the unconditional cyclotomic main conjecture (round after ~adv3)

Refs #11331. Reviewer: Claude (Opus 5.5), session `claude-UDCa82`, 20 October 2026.
This reviewer did not write, fix or review any earlier version of this package.
Sonnet helpers (four, read-only) produced the supplier-section maps used in the
supplier audit below. Every finding that drives the verdict was re-read in the
supplier README or the source by the reviewer.

**Verdict: needs_changes.** The four obligations of the first package review
are closed by stated, correctly sourced arguments, and nothing from either
branch of the reconciliation was dropped. The verdict is not about them. The
package's *Exact supplier contracts* and Needs lines cite many statements that
the cited supplier packages do not make. They are the twelve requests of the
accepted plan, which the suppliers were packaged without. Four of the missing
inputs lie on the odd-prime main route (Layers 1–3 and §5.1). I corrected
everything that had a clear fix in place. The rest needs new owned targets,
or re-pointing to an owner that I could not establish. That is planning work
beyond a review, so it is listed in the table under "What remains".

The previous report has no `~codex` suffix. It is
`research/blueprint/reviews/REV-PKG-EulerSystemsCyclotomicMainConjecture.md`
(codex-6MfWGv), and its four obligations are the ones checked here.

## The four obligations

| Obligation | Where | Result |
|---|---|---|
| 1. Uniform circular-unit comparison | §3.3 (a)–(d), steps 1–8; second route (e), steps 9–13 | **Closed mathematically.** I rechecked every step. (a) Sinnott generators reduce to the ψ-projections. (b) Tate cohomology, Hilbert 90 and local reciprocity give the control. The ψ(p)=1 formula is exact: ρ₀ is an isomorphism U₀^ψ≅O′, so N₀=0 and U^ψ_∞=TY^ψ_∞. (c) Abelianisation of the split extension gives Z/ω_nZ, with the ν_n bound. (d) The growth formula and the four-term sequence give the totals. Step 3 and §5.1 rest on Sinnott Proposition 5.1 and the tower theorem, and **IntegralIwasawaTheory does not state them** (item D2). |
| 2. Odd-prime split lattices | §4.21, steps 1–8 (Solomon/Mazur–Wiles), steps 9–10 | **Closed.** I checked the group-ring step O′[G_p]/(N_C)=O′[x]/(Φ_{p^s})=O. Lengths are compared over a totally ramified O/O′. The faithful χ-quotient equals coker N_C, whose length is ℓ(A_s)−ℓ(A_{s−1}). Greither p.482 confirms that his proof of Theorem 4.1 is dyadic and refers odd p to Solomon. |
| 3. Exceptional nonvanishing | §4.18, steps 5–8 | **Closed.** I checked the minus-unit injectivity of log₂∘ι, the Baker–Brumer step and the direct route (IntegralIwasawaTheory §4.2, `algebraicLog_kernel`, `bakerBrumer_algebraicNumbers`, both stated there). Greither p.491 itself obtains λ_χ≠0 from Gross's abelian case, which is consistent with this route. |
| 4. Conductor-one Coleman image | §4.7, step 7 (steps 8–12 are an extra comparison) | **Closed.** I rechecked the smoothed unit c_b, the factor ρ(b)−1, the integrality through the poles at X=1−ζ_p^j, the evaluation identity at ν′≥2 and the p=5, ρ=ω² witness. ColemanPowerSeries §4.24 and §4.27 do state `Col=−Col₀` and `Col(q(a))=([a]−1)ζ_p`, as steps 8–12 use. |

Nothing from the two reconciled branches was dropped. §3.3 keeps (a)–(e) with
both routes, §4.7 keeps steps 7–12, §4.18 keeps steps 1–8, and §4.21 keeps
steps 1–10. All 75 targets of the plan have their anchors in the README, and
all 169 internal links resolve.

## Fixes applied in this round

1. **Duplication removed (§0.29).** The README proved smoothed Stickelberger annihilation of Cl(ℚ(μ_m)) at every conductor from a finite-field input. That is CyclotomicClassGroupsAndStickelberger §2.5 (`stickelberger_smoothing_annihilates`), with §2.3 (`smoothedStickelberger_cast`) and §2.4 (`gaussSum_smoothed_descent`). §0.29 now imports them. It proves only the half-norm shift: (b−σ_b)θ_m=s_{m,b}−((b−1)/2)N_m, where N_m kills the class group because ℚ has class number one. It also proves the extra Euler factor. A new Check records why b must be odd: at m=3, b=2 the coefficient −1/2 appears. §0.30 now uses §0.29 instead of the finite-field relation.
2. **Supplier citations by section.** All 163 fine-grained atlas ids in the README were replaced by the supplier package's own section numbers, for example "IntegralIwasawaTheory §4.4" or "EulerSystemsAndKolyvaginSystems §8.37". Each replacement was checked against the heading. The same was done for the bare slugs inside the contract bullets and for the `rjw2-fg-nonvanishing` mentions, which now name DirichletPadicLFunctions §4.14. The prose stage names ES.1–ES.8 became EulerSystemsAndKolyvaginSystems Layers 1–8 with sections, and the import paragraph now lists those sections. In ESKS the stage numbers coincide with the layer numbers; in IntegralIwasawaTheory they do not.
3. **Wrong supplier statements replaced.**
   - EulerSystemsAndKolyvaginSystems §8.39 (true-Selmer divisibility) does not apply to cyclotomic units; §8.39 says so itself, at line 5486. §§2.1, 2.4 and 4.12 now cite §8.16 (Iwasawa Poitou–Tate), as ESKS directs.
   - The coinvariant Euler characteristic was cited to PadicMeasuresIwasawaAlgebras L4, where it is only a lemma name. §§4.16, 4.20 and 4.21 now cite IntegralIwasawaTheory §10.4 (`arithmeticCharacter_eulerQuotient`), which states it.
   - §4.13 cited SelmerIwasawaCohomology §3.1 (Iwasawa cohomology) for Kummer duality. It now cites IntegralIwasawaTheory §2.4 (`classGroupDirectLimit_dual_finite_torsion`) and §2.7 (the discrete Kummer sequence and its dual).
4. **Tau Ceti ClassFieldTheory layers.**
   - Ray class fields and Kronecker–Weber are in Layer 13 (`rayClassField`, `kroneckerWeber`), not Layer 12. A Layer 13 contract bullet was added, and §0.15 step 3 now derives the ray class fields of ℚ from these declarations.
   - §3.3 step 5 needs units to map onto the Galois group of a totally ramified layer. Layers 6–7 state only "into inertia". The step now derives "onto" from `localArtinEquiv` and the norm of a uniformizer.
5. **Notation.** The heading of §3.4 said char(Y_∞^χ). In §3.3 Y denotes the semilocal module, and the statement is about A_∞^χ, so the heading now says char(A_∞^χ).
6. **Process wording.** Seven phrases were removed: "requested", "part of the request", "of the stage" and "this request". Thirteen duplicated `**Checks.**` headers were merged into the preceding list.
7. **Suggested.lean (2026-10-19 rule).** I deleted thirteen `example`s that were bare numerical or symbolic calculations about library objects. They were ZMod and polynomial identities, power-series coefficients, a field identity with its ζ=0 control, `¬IsUnit 2` and the ℤ/9 counts. The README keeps them as prose Checks, and its one sentence pointing to them was removed. What remains is two real-bodied definitions with two proved examples each, 15 sorry'd statements, and the six proved boundary theorems listed in the README table. The file has 314 lines and no sorry'd data.

## What remains: supplier statements the cited supplier does not make

Each row names a consumer section, the input it needs, and what the cited
supplier actually states. Supplier line numbers refer to the current package
READMEs. The remedy for every row is the same, unless a row says otherwise:
add the statement as a target of this roadmap, with the locator given, its
hypotheses and its Needs. These are requests the suppliers did not take, and
they are not re-planned there.

| # | Consumer | Needed statement (source) | Cited supplier: what it states |
|---|---|---|---|
| D1 | §§2.2–2.3 | Y_∞^χ=lim(L_n⊗ℚ_p)^× (completed) is finitely generated, torsion-free, of Λ_χ-rank one (Iwasawa [Iw3] Thm 25, as used in Rubin III.2.7) | IntegralIwasawaTheory: only finite generation of the principal-unit limit (§2.4). Not stated anywhere in the atlas packages. |
| D2 | §3.3 steps 3, 13; §5.1 | Sinnott Prop. 5.1, p.211: (R:U) is an integer divisible only by primes dividing [k:ℚ]. Sinnott's tower theorem (Introduction, p.182; Thm 6.1, p.226; §7, pp.232–233): [E_n:C_n]=h_n·2^{[F_n:ℚ]}·c⁺_{F∞} for large n | IntegralIwasawaTheory §1.8 states only Sinnott Theorem 4.1. I verified all three Sinnott statements on the scan; the README states them correctly. |
| D3 | §1.2–§1.3, §2.2, §0.25, §0.28 | χ-isotypic restriction–Kummer isomorphism H¹(ℚ,O(1)⊗χ⁻¹)≅(L^×)^χ (Rubin (3)), its tower version and its compatibility with twisting | SelmerIwasawaCohomology: untwisted pieces only (§§0.6, 0.8, 0.11). |
| D4 | §1.3, §2.4 | Rubin I Prop. 6.1 (S(ℚ,D_χ)≅Hom_O(A_L^χ,D)) and its Iwasawa limit (Rubin (5)) | SelmerIwasawaCohomology §2.9 is Lemma I.5.3 only. That package is itself still needs_changes, and its packet node `L2/galois-selmer-group` lists this use. Re-point there if its revision adds it. |
| D5 | §2.2 | Rubin Cor. B.3.4: H¹_∞(ℚ,T*)=lim S^{p}(ℚ_n,T*) | SelmerIwasawaCohomology §3.1 has lim H¹ but not the relaxed-Selmer identification (partial). |
| D6 | §3.3 step 2; §3.1; §4.17; §0.30 | Global class field theory in infinite and idelic form. (b) 0→U_K/Ē_K→Gal(M_K/K)→A_K→0 for the p-ramified pro-p extension of every totally real abelian K, and its F_n^+ form (Washington Cor. 13.6). (c) the C₂(F)=J_F/F^×∏_{q∤2}U_q correspondence. (d) the idelic sequence and ℤ_p-valued idele characters ↔ H¹(F,ℤ_p), with corestriction ↔ inclusion | Tau Ceti ClassFieldTheory has finite abelian reciprocity only (Layers 11–13; Layers 11–14 untouched upstream). These clauses of the "Layer 12" bullet are not stated. |
| D7 | §3.1 | The four-term sequence 0→E/C→U/C→X^+→Y^+→0 | IntegralIwasawaTheory §7.2 says only "derive the four-term sequence"; §2.7 displays a different sequence. Partial: can be proved here from §2.7 and §7.2 there. |
| D8 | §3.5 (χ-form) | General abelian char(U^χ_∞/C_{∞,χ})=L_χΛ (Rubin III Thm 2.9(ii), p.39, citing Gillard Thm 1; Rubin App. D §2) | ColemanPowerSeries: only the ℚ(μ_{p^∞})^+ tower at odd p (§4.30). The RJW form of §3.5 is supplied; the χ-form of Rubin III.2.10 is not. |
| D9 | §§4.4–4.5 | Coleman's exact sequence over a finite unramified coefficient ring at every p, with the {±1} term at p=2 (Coleman 1979 Thm 2.2; Coleman 1983 Lemma 2, Thm 3; Greither Thm 2.4–Cor 2.7) | ColemanPowerSeries: interpolation over one unramified E at every p (§§1.117–1.120). The principal Coleman sequence is ℤ_p-coefficient and odd-p only (§3.46; table line 83: "Odd p for the principal arithmetic sequence"). |
| D10 | §§4.7–4.8, 4.14, 4.16, 4.18, 4.20–4.21 | Greither's Stickelberger series G_p(T,ρ)=lim ξ_ν(ρ), and L_p(s,ρ)=G_p(u^s−1,ρ) at every p, including characters of p-power conductor; the trivial zero of G_p(T,χ̌) at T=0 | DirichletPadicLFunctions: no finite-sum construction. Its L_p is a Mellin quotient (§§3.1–3.2), and the trivial zero is stated for the branch at s=0 (§4.14). **Candidate owner:** IntegralIwasawaTheory §6.3 `bernoulliStickelberger_dictionary` (Stickelberger distribution → Kubota–Leopoldt, f_χ(u^s−1)=L_p(χ,s)). Re-point after confirming its p=2 and second-kind coverage. |
| D11 | §4.23, §4.26 | p-adic class number formula with R_p(F) for real abelian F unramified at p (Greither Thm 4.11, pp.493–494; Washington Thm 5.24) | DirichletPadicLFunctions has Leopoldt's formula for L_p(1,χ) only (§3.6). No package states the class-number formula. |
| D12 | §4.10 | Rubin, Invent. Math. 93 (1988), Lemma 1.2: uniform bounds on (γ−1)Ĥ^i(Γ_{mn},E_m), i∈{−1,0}, under Greither's weakened hypotheses | Not in IntegralIwasawaTheory (§2.8 bounds capitulation only). |
| D13 | §4.14 | Finite exceptional ω class-module control for Greither Thm 3.2; the minus analytic class-number product at Greither 4.14–4.15 generality | Not stated. IntegralIwasawaTheory §8.6 has a smoothed Dasgupta–Kakde ray version only. |
| D14 | §4.17 | Greither Prop. 4.7 exact sequence 0→E_{1−γ}→G/G′→Γ→0 (Washington Lemma 13.14) | Not stated (IntegralIwasawaTheory §3.1 has only the one-prime split extension). |
| D15 | §0.30 | Rubin App. D Def. 1.2 and Lemma 1.4 (pp.164–165): the local functionals λ_{mp^n} from Wiles's explicit reciprocity, with restriction compatibility | Not in ColemanPowerSeries or any package. |
| D16 | §5.3 step 3; §4.23 | Iwasawa's rank theorem by characters: each odd component of X_∞ for ℚ(μ_{p^∞}) has rank one and even components rank zero. A′(F)≅Y/TY for real F | IntegralIwasawaTheory §2.6 gives the total rank r₂ only. §3.5 gives A′(F) only up to a Γ-term, or after (1−e₀). Partial. |

Minor citations left for the same revision:
- ColemanPowerSeries "L1 over a product of unramified rings" is supplied componentwise (§§1.117–1.120 with §0.97). §4.4 step 1 already reduces to one factor, so this needs only rewording.
- IntegralIwasawaTheory §§0.2, 1.1 state norm transitivity and the restriction of σ_a, but not Galois equivariance of norms. This is an elementary step that can be stated here.
- PadicMeasuresIwasawaAlgebras L2 states the Amice dilation and the unit-measure ψ-kernel equivalence only over ℤ_p^×. The ℤ_p[[Γ′]]-version r↦r(1−X) of §4.6 step 3 is a short derivation to state here.
- §§4.9 and 4.11 still list EulerSystemsAndKolyvaginSystems §§4.3 and 4.17 (Rubin's finite bound). Their proofs here are Greither's all-prime arguments, whose prime selection is ESKS §1.7, so these Needs entries should be narrowed.

The coarse supplier ids that remain are `IntegralIwasawaTheory:I.1/L0/L1/L2/L4`, `ColemanPowerSeries:L1/L3/L4`, `DirichletPadicLFunctions:L0/L2/L3` and `SelmerIwasawaCohomology:L0/L2`. Each is a contract bullet that mixes supplied and unsupplied clauses, so it should be rewritten together with D1–D16. The supplied clauses map as follows.

| Atlas id | Supplied clause → section of the supplier package |
|---|---|
| IntegralIwasawaTheory I.1 | cyclotomic ℤ_p-extension §0.1; decomposition, no complete splitting, disjointness §0.3 |
| IntegralIwasawaTheory L0 | Galois-module unit theorem §4.3 (`unitRepresentation_augmentation`); Sinnott circular units §1.7; Theorem 4.1 index §1.8; prime-power index §1.5 |
| IntegralIwasawaTheory L1 | X/D_∞ dictionary §§2.3, 3.5; p-ramified module 𝔛_S §2.3; ambiguous-class formula §3.5; unramified module torsion §2.4 |
| IntegralIwasawaTheory L2 | coinvariant lemma §10.4; inertia control §3.2 (from a cutoff level, not Greither's Y₀); discrete limits §§2.1, 2.4, 2.7, 2.8 (partial) |
| IntegralIwasawaTheory L4 | abelian Leopoldt §4.4; Baker–Brumer §§4.1–4.2; Ferrero–Washington §5.6 |
| DirichletPadicLFunctions L0/L3 | Iwasawa logarithm §0.6; principal pole §3.7; Leopoldt's L_p(1,χ) §3.6; Gross–Koblitz §4.5; Ferrero–Greenberg §4.14 |
| SelmerIwasawaCohomology L2 | strict versus relaxed conditions §§2.18–2.19; Greenberg condition §2.8; unramified condition §2.7 (generic) |

The packet (not a deliverable of this job) still lists the four old gaps and
the twelve requests. A packet follow-up should close the gaps against
§§3.3, 4.7, 4.18 and 4.21, and replace the requests by the targets owned
after D1–D16.

## Size and form

- **Size.** The README is 279,731 bytes. That is above the 200 KB figure in the issue template, which is an older size note. PACKAGE_REVIEW's binding shape rule of 2026-10-12 overrides it ("Size is whatever that content needs"; packages of 100–300 KB are expected). Nothing was cut to reduce the size.
- **Form.** The README has the Summary, Scope and ownership, Conventions, supplier contracts, the ordered layers with Checks, Examples, Dependencies, Downstream consumers and References.
- **Own words.** No verbatim passages were found in the touched sections. The Sinnott Theorem 4.1 formula is mathematics, restated as notation.
- **Tate's thesis.** No Tate's-thesis theorem appears as a target.
- **metadata.toml.** It is `topic = "math.NT"`, which is correct.

## Duplication against current upstream

Current TauCetiRoadmap `0d144d04` and current Tau Ceti `a91d3aaf` were searched for circular or cyclotomic units, Stickelberger, Euler and Kolyvagin systems, and main conjectures. They contain only the Stickelberger discriminant congruence in NumberFieldArithmetic §4.5 and Tau Ceti `Discriminant/Stickelberger`, which the README already scopes out, and a bibliography mention of Rubin in EllipticCurves. No target was removed on this account. The duplication found was with the atlas roadmap CyclotomicClassGroupsAndStickelberger, fixed above. The README did not cite that roadmap before.

## Source verification

Downloads matched the earlier SHA-256 prefixes (Greither `8e4db974`, Solomon `c207989d`, Sinnott `ca496fb4`, Belliard `851ef8a6`). I read the scanned Sinnott pages as rendered images.

| Locator in README | Confirmed |
|---|---|
| Greither Thm 4.1, p.482: odd characters faithful on Δ_p; odd p referred to Mazur–Wiles and Solomon; proof written for p=2 "for simplicity" | yes |
| Greither Thm 2.13 and Cor 2.14, p.465; Lemma 2.15 and the right-hand-side computation, p.467 | yes |
| Greither definitions of W, M, μ, λ, the claim g∈F, and (G1), p.490; (G2), Lemma 4.8 and the nonvanishing via Gross, p.491 | yes |
| Solomon Thm II.1, p.472 (with its δ_χ term for ℚ(μ_p), ω, outside this target) | yes |
| Solomon (22), Lemma III.1 and V(K^i)=W(K^{i−1})+…, p.486 | yes |
| Sinnott Introduction and tower theorem, pp.181–182 | yes |
| Sinnott Thm 4.1 (real case h⁺2^{[k:ℚ]−1}∏[k_{p^e}:ℚ]/[k:ℚ]·(R:U)), p.207 | yes |
| Sinnott Prop 5.1, p.211 | yes |
| Belliard Thm 1.1(2), p.4; Lemma 4.2, p.12 | yes |
| Rubin III §2.1 display (2) and Remark 2.1, p.34; Prop 2.6, p.37; Thm 2.7 and Cor 2.8, p.38; Thms 2.9–2.10, p.39 | yes |
| Rubin App. D Def. 1.2 and Lemma 1.4, pp.164–165 | yes |

## Adversarial pass (touched statements and the obligations)

| Statement | Instances tried | Result |
|---|---|---|
| §0.29 shifted annihilator | m=3, b=5: (5−j)θ₃=−(1−j); m=3, b=2: coefficient −1/2; m=1 | Integral exactly for odd b. Check added. N_m kills Cl by norm to ℚ. |
| §3.3(a) | ψ(p)=1 versus ψ(p)≠1; prime-power generator ideals | The ψ-part of D_n is C_{n,ψ}+O′ξ_{0,ψ}. The unit property follows from Galois-invariant prime-power ideals. |
| §3.3(b), ψ(p)=1 | n=0; U₀^ψ≅U¹(ℚ_p)⊗O′ | ρ₀ is an isomorphism, so N₀=0 and the formula holds at every n≥0 with a_ψ. |
| §3.3 step 5, units onto Gal | totally ramified layer, f=1 | A uniformizer norm has valuation 1, so U_K·N L^×=K^×. Derived in place. |
| §3.3(d) | ε′_n per ψ; [O′:ℤ_p] scaling of μ, λ | The sums agree; the divisibility of §2.4 then forces units (§3.4). |
| §4.7 step 7 | p=5, ρ=ω², b=ω(2): ρ(b)−1=−2; polar sum 0; ρ=1 gives p−1 | Correct; integrality through all poles. |
| §4.18 steps 6–8 | u=2, F=ℚ(√−7); y=±2^k with y·j(y)=1 | Kernel torsion; λ_χ(g_F)≠0 needs e·g_F≠0, which (G1) supplies. |
| §4.18 tests | m=7: (g)=𝔭𝔭̄², B_{1,χ}=−1; m=217: σ₁₂₀ fixes F, s(151)=5, s(18120)=6 | Recomputed; correct. |
| §4.21 step 6 | O′[G_p]/(N_C)=O′[x]/Φ_{p^s} | Equals O; totally ramified O/O′ gives equal residue fields, so O′-length equals O-length. |
| §5.1 | p∤[L:ℚ]: the conductor factor and (R:U) are prime to p | Holds with Sinnott Prop. 5.1, which is the D2 input. |

## Lean and checks

- `lean-check research/blueprint/packages/EulerSystemsCyclotomicMainConjecture/Suggested.lean`, before the edits: exit 0, 15 `declaration uses sorry` warnings, no errors.
- After the edits (314 lines): exit 0, the same 15 warnings, no errors.
- Signatures spot-checked against the README: `minpoly_step_of_dvd`, `minpoly_step_of_not_dvd`, `norm_one_sub_of_dvd`, `norm_one_sub_mul_of_not_dvd`, `norm_one_sub_mul_frobenius`, `norm_sub_one_eq_neg_one_pow_mul`, `norm_one_sub_of_prime`, `chiComponent_trivial_eq_bot`, `chiSum_of_mem`, `chiSum_sub_frobenius` and `isUnit_one_sub_of_pow_eq_one`. All hypotheses are present, and none is vacuous or `True`.
- `scripts/check_sorry_data.py` on Suggested.lean: exit 0.
- `git diff --check`: clean.
- Anchors: 75. Internal links: 169, all resolving.
- `intake.py check-files` on the five deliverables: 0 problems.

Untrusted text: the supplier READMEs, the earlier reports and handoff notes,
and the fetched papers were read as data. None contained instructions.
