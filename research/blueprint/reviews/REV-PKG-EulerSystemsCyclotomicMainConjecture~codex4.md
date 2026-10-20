# Review: Euler systems and the unconditional cyclotomic main conjecture (round after ~adv4)

Refs #11352. Reviewer: Claude (Opus 5.5), session `claude-F2i47f`, 20 October 2026.
This reviewer did not write, fix or review any earlier version of this package.
Three Sonnet helpers (read-only) mapped every supplier citation to the supplier
package or upstream README. I re-read in the supplier text or the source every
finding that changed the README.

**Verdict: accepted, with the fixes below applied in place.** All sixteen
findings D1–D16 of the ~codex3 review, and its four minor items, are closed.
Each is closed by a stated target with a locator, by a re-pointing to a section
that states the clause, or by a correction. The mathematics of the new owned
targets holds up under the adversarial pass, with two exceptions, both fixed
here:

- `rubinLocalFunctional` was stated for every prime p, but it is false at p=2.
- Rubin's defining display had lost its factor m.

The supplier audit found about twenty citations that point to the wrong
section or overstate what the supplier says. One supplier,
FiniteFieldsAndCharacterSums, has no package and is a dropped roadmap. Every
one of these had a clear owner, and all are re-pointed.

## Inputs read

- The package (README 334,362 bytes, Suggested.lean 322 lines, metadata.toml, review.json).
- The ~codex3 report and the FIX-PKG~adv4 handoff.
- The supplier package READMEs: IntegralIwasawaTheory, ColemanPowerSeries, EulerSystemsAndKolyvaginSystems, CyclotomicClassGroupsAndStickelberger, DirichletPadicLFunctions and SelmerIwasawaCohomology.
- The upstream TauCetiRoadmap main (`14e4aedb`) READMEs and Lean files of ClassFieldTheory, ProfiniteCohomology, Chebotarev, PadicMeasuresIwasawaAlgebras, ClassicalArithmeticCompletion, DiophantineApproximationAndTranscendence, LocalGaloisGroups, ProfiniteArithmetic and NumberFieldArithmetic.
- The open upstream pull request of LinearFormsInLogarithms (#451, another author), for its §8.10.

## D1–D16: closure

| # | Closed by | Checked |
|---|---|---|
| D1 | §2.2 `localUnitLimit_rank_one` (a)–(c) | Re-derived (a): total ramification of L_{m,w}/L_{n,w} from p∤[L_w:ℚ_p], Hilbert 90, local reciprocity, and the norm of a uniformizer. Re-derived (b) from normal-basis ranks and growth p^n. Re-derived (c): ψ-parts of p-units are free, f has finitely many zeros, the trace acts as p^j, and there is no p-power capitulation in a totally real tower. The correction to Rubin is right: for ℚ(√6) at p=3, ℚ_3(√6)=ℚ_3(√−3), and lim μ_{3^{n+1}}≅ℤ_3(1) is Λ-torsion in Y^χ_∞. |
| D2 | §3.3(f) `sinnottCorrection_primes`, (g) `sinnottStableIndex`, steps 14–15 | Rechecked the k=ℚ(√5) Check: C=⟨−1,ε²⟩, [E:C]=2=1·2·(2/2)·1. Rechecked c⁺_{ℚ_∞}=1/2. Added to (f) a pointer to Sinnott's intermediate lattices U_s, which (f) used before step 14 defines them; IntegralIwasawaTheory §1.8 defines only U. |
| D3 | §0.25 `restrictionKummer_chiEquiv` | Rubin III (3), p.35 and I Prop 6.3(i), (7), p.15 confirmed. Checked the ℚ(√5), p=3 Check (χ-sum −ε²) and the p=2, ℚ(i) non-injectivity. |
| D4 | §1.3 `selmer_eq_classGroupDual` | Rubin I Prop 6.1, p.14 and III (5), p.35 confirmed. ℚ(√−5), p=2: S≅ℤ/2, and the strict group is 0. |
| D5 | SelmerIwasawaCohomology §3.5(ii)–(iii) | SIC states (ii) and (iii), which are Rubin's B.3.4–B.3.5 (p.155, confirmed), although SIC itself cites only B.3.3. |
| D6 | (b) IntegralIwasawaTheory §2.7; (c) §4.17 `twoRamifiedCorrespondence`; (d) §0.30 `idelicCharacter_equiv` | Rubin III (9), (10), p.40 and Prop III.4.3, p.41 confirmed. Fixed the archimedean convention of C_2(F) and the corestriction layer (see below). |
| D7 | SelmerIwasawaCohomology §§4.16–4.17 with IntegralIwasawaTheory §2.7 | SIC §4.17 states the sequence for every closed C. |
| D8 | §4.27 `integralColemanImage_primeToP`, `cyclotomicMainConjecture_chi` | Rubin III.2.9–2.10, p.39 confirmed. Rechecked the k=1 variable change against L_p(0,χ)=−(1−χω^{−1}(p))B_{1,χω^{−1}}, and the conductor-5, p=11 Check. |
| D9 | §4.4 (Coleman 1979 Thm 22) | Re-derived the image condition g′(0)∈(1−Frob)𝒪 from the derivative of φ at 0. At p=2, log(1+2ℤ_2)=4ℤ_2 gives the extra condition g(0)∈2𝒪. Fixed one wrong section for ψ (below). |
| D10 | IntegralIwasawaTheory §6.3 | (m,p)=1 includes m=1, and IIT's Conventions fix q=4 at p=2. f_χ(u^s−1)=L_p(χ,s) is stated for nontrivial even χ, which is how §4.7 uses it. |
| D11 | §4.23 `padicClassNumberFormula`, `padicCircularLog_image` | ℚ(√5), p=3: ε^8=21ε+13≡4+3ε² mod 9, v_3(log_3ε)=1, and L_3(1,χ)=(4/3)·2·log_3ε/√5 is a unit. Added that CCGS §3.4 applies to F as the real subfield of F(√−1). |
| D12 | §4.10 `rubinUnitTateBound` | Re-derived the Herbrand quotient p^{(m−n)(s−1)}: fixed places contribute p^{m−n} each, free orbits 1, and the augmentation removes one copy. γ−1 factors Ĥ^{−1}(E) through a group of order ≤p^r. Re-pointed the Herbrand API (below). |
| D13 | §4.14 `exceptionalOmega_finite` | ω-part zero for ℚ(μ_p). |Δ|² torsion plus Ferrero–Washington gives finiteness. The p=37 Check: B_32 gives ω^5≠ω. |
| D14 | §4.17 `splitExtension_abelianization` | ℤ_p⋊ℤ_p: G/G′=ℤ/p×ℤ_p. |
| D15 | §0.30 `rubinLocalFunctional` | Fixed: restricted to odd p, and the factor m restored (below). The (iii) direction λ_{mℓ}\|=λ_m∘(−Fr_ℓ) agrees with the trace relation Tr x_{mℓ}=−Fr_ℓ^{−1}x_m of Rubin's proof; I re-derived it. Rubin's printed diagram literally gives −Fr_ℓ^{−1}, and the README follows the trace computation, as the fix handoff says. |
| D16 | §4.23 (1−e)A′(F)≅(1−e)Y/TY; §5.3 `pRamified_characterRank` | The odd components have rank one, because the minus units are torsion (CM index) and each e_ψU_∞ has rank one. With the total rank (p−1)/2, the even components have rank zero. |

The four minor items of ~codex3 are also closed: the componentwise Coleman
wording, Galois equivariance of norms (§0.10), the ℤ_p[[Γ′]] Amice form
(§4.6), and the Needs of §§4.9 and 4.11.

## Fixes applied in this review

Correctness:

1. **`rubinLocalFunctional` at p=2.** The constant −1 lies in 1+(2,X) and has log 0. So g≡1 mod (p,X) and log g=G_m do not determine g_m at p=2, and the step "log is injective on 1+(p,X)" is false there. Rubin's proof of Lemma D.1.1(v) makes the same claim. The target now assumes p odd, which is all that §0.30 uses, and a negative-control Check was added.
2. **Factor m.** Rubin's Definition D.1.2 (p.164, read on the page image) defines λ by ζ_{p^n}^{m·λ_{mp^n}(u)}. The README had dropped m, which is inconsistent with (ii), since x_{mp^n} carries m^{−1}. The factor is restored, with a Check (m=2, p=3) and a note that requiring the display for every k makes λ ℤ_p-valued.

Re-pointings, where the supplier cited does not state the clause:

3. **FiniteFieldsAndCharacterSums → TauCetiRoadmap.ClassicalArithmeticCompletion §§1.47, 1.55.** The old supplier has no package and is listed in drops.json. The upstream roadmap states Stickelberger's relation (`span_stickelbergerPhi`, `stickelbergerPhi_prime`) for every rational prime below P, including 2 with m odd, which is what §4.18 step 2 uses. Changed in Scope, the contracts, the Needs of §§4.18 and 4.21, and the Layer 4 Dependencies.
4. **Total ramification from level 0.** IntegralIwasawaTheory §0.3 gives only eventual total ramification, and the disjointness from "every finite prime-to-p extension". A Mathlib contract bullet was added, `IsCyclotomicExtension.Rat.ramificationIdx_eq_of_prime_pow` (pinned; e=p^k(p−1) for every p), with the multiplicativity consequence. §2.2 step 1, §3.3 step 10 (cutoff 0 for `inertiaClassControl`) and §4.10 cite it.
5. **Herbrand quotient (§4.10).** At the Tau Ceti pin only `herbrandQuotient`, `herbrandQuotient_eq_one_of_finite` and `herbrandQuotient_trivial_int_eq_card` exist. Multiplicativity and invariance under finite kernel and cokernel are TauCetiRoadmap.ClassFieldTheory Layer 0 (`herbrandQuotient_eq_mul_of_shortExact`, `herbrandQuotient_eq_of_finite_kernel_of_finite_cokernel`). Added to the contract and the Needs, with the permutation-module count written out.
6. **Corestriction (§0.30, `idelicCharacter_equiv`(c)).** It is ProfiniteCohomology Layer 6 (`explicitCor1Transversal`), not Layer 5. Fixed there, in the Needs and in the contract.
7. **ColemanPowerSeries.** Col=−Col₀ is §2.39, not §4.24 or §4.27. §4.27 is the real image ideal I(G⁺)ζ_p⁺. The normalized trace ψ with τ=pψ is §1.93, not §1.83. The contract, §4.4 step 6 and its Needs, and the Layer 4 Dependencies are corrected. The sentence that named this roadmap's §§0.30, 4.4 and 4.27 inside the ColemanPowerSeries bullet now links them as sections of this roadmap; CPS has an unrelated §0.30.
8. **EulerSystemsAndKolyvaginSystems §1.7** defines the Kolyvagin prime sets and gives Rubin's Frobenius criterion (`mem_rubinPrimes_of_frobenius`). It does not give the prescribed-class selection. §4.9 now says that the selection is its own steps 4–5 (Chebotarev in a compositum) at every p.
9. **ESKS §3.13(c)** states the rank-one order equality over K only. §1.5 now derives it over F as a direct sum over the split primes above q.
10. **The ESKS Layer 2 "torsion −ζ⁻¹" remark (§0.16 API)** is not stated in ESKS. It now points to ESKS §2.2 and to this roadmap's §0.11.
11. **PadicMeasuresIwasawaAlgebras** was cited by the atlas layer ids L1/L2/L4/L5 (42 times). These now cite the upstream sections: §1.1 finite projections, §1.3 unit reduction, §1.7 comparison, §2.6 kernel of ψ, §2.11 dilation pushforward, §4.2 structure, §4.4 invariants, §4.6 characteristic ideals, §4.7 growth, §5.2 topological Nakayama. The name `charIdeal_eq_span_mu_charPoly`, which PMIA does not have, became the clause of §4.6.
12. **Smaller citation fixes.**
    - CyclotomicClassGroupsAndStickelberger: N_m in the integral ideal needs §2.2 as well (now §§2.1–2.5). The real class-number product is stated for F⁺ of an abelian CM field, so it is applied to F(√−1).
    - IntegralIwasawaTheory §1.3 → §1.2 (`cyclotomicRatio`) in §0.14.
    - DiophantineApproximationAndTranscendence "DT.3" (an atlas id; no layer there states the p-adic Baker theorem) became IntegralIwasawaTheory's own import from LinearFormsInLogarithms §8.10.
    - The Chebotarev contract now cites Layer 10 (`hasDirichletDensity_frobeniusPrimeSet` and the derived infinitude), with simultaneous conditions imposed through a compositum.
    - "ClassFieldTheory supplies … idelic exact sequences" became a pointer to §0.30, where they are derived.

Form and wording:

13. **Cycle in Downstream consumers.** The section named IntegralIwasawaTheory and SelmerIwasawaCohomology as consumers. Both are suppliers here, and both list this roadmap downstream in their own READMEs. The section now names the actual consumer, SpecialValuesBirchTate (Greither's main conjecture of Layer 4, §§4.1, 4.13–4.14), and no supplier. Scope now says that IntegralIwasawaTheory §§6.5, 11.7 prove the integral abelian main conjecture by the Eisenstein route. §§3.5 and 4.14 here are independent proofs of abelian cases of that endpoint, shared statements and not second declarations, as the IntegralIwasawaTheory README itself says.
14. **Internal ids.** "L0–L3", "L4", "L0", "L1", "L2–L3", "(ES.3)", "FF.1" and "DT.3" became layer and section names.
15. **The archimedean convention of `twoRamifiedCorrespondence`.** The statement was ambiguous for fields with real places. U_q is now the identity component at archimedean q, matching IntegralIwasawaTheory §2.3 at 2. It is unchanged for the imaginary F used.
16. **§3.2.** Added the one-line reason that v_p(log_p a)=1 for a generator a of ℤ_p^×. It is not a DirichletPadicLFunctions statement, which treats only a=p+1.
17. **Suggested.lean.** Removed the `example` that `chiSum` over the trivial group is the identity (`5 = 5`). It is a numerical calculation that no plausible wrong definition fails, and `chiSum` already had three other proved tests. The README sentence listing the Lean tests was updated. No other Lean change.

The edits were made by an asserted-replacement script run on the files from
origin/main. Every replacement matched the expected number of times.

## Generality (every p, every tame level)

- **Every p.** The all-prime statements are in Layer 4, through Greither, for every abelian F unramified at p, that is every tame level, including p=2 with the ½ normalisation:
  - the real main conjecture (§4.12);
  - the main conjecture (§4.14);
  - Iwasawa–Leopoldt at 2 (§4.22);
  - the real Iwasawa–Leopoldt formula (§4.25);
  - Gras (§4.26);
  - the relative class-group bounds (§§4.20–4.21).

  §4.4 (Coleman's sequence) is stated at every p, with the {±1} term at 2.
- **Odd p only, each for a stated reason, with a pointer to the Layer 4 statement:**
  - Layers 1–3 and §§5.1–5.3 (Rubin's prime-to-p character theory and the RJW plus-tower form);
  - §4.27 (the integral Coleman image is known only when the character projections are exact; Greither's remark after 2.13);
  - `rubinLocalFunctional` (false at p=2 as stated; fixed here).
- **Tame level.** Layers 0–3 allow characters of any conductor whose order is prime to p. Layer 4 allows any abelian F unramified at p. Together with the p-power cyclotomic tower, this reaches every abelian field.

## Adversarial pass

| Statement | Instances tried | Result |
|---|---|---|
| `rubinLocalFunctional` normalisation | p=2: −1∈1+(2,X), log(−1)=0 | Not unique at 2: restricted to odd p, Check added. |
| `rubinLocalFunctional` display | Rubin p.164 page image; x_{mp^n} with m^{−1} | Factor m missing: restored. m=2, p=3 Check. |
| `rubinLocalFunctional`(iii) | Tr ζ_{mℓ}=−Fr_ℓ^{−1}ζ_m; λ_{mℓ}(u)=−λ_m(Fr_ℓu) | README direction is right; Rubin's diagram as printed is the inverse. |
| `rubinLocalFunctional` value Check | Σ_{i≥0}p^iχ(p)^{−i−1}=(χ(p)−p)^{−1} | Value χ(−1), matching Rubin p.166. |
| `localUnitLimit_rank_one`(a) | e(L_{m,w}/ℚ_p) from coprime degrees | Totally ramified from level 0. Correct. |
| `localUnitLimit_rank_one` Check | ℚ(√6), p=3 | ℤ_3(1) torsion in Y^χ_∞. Correct. |
| `rubinUnitTateBound` | Herbrand count; K_0=ℚ (s=1) | p^{(m−n)(s−1)}, and 1 for K_0=ℚ. Correct. |
| `selmer_eq_classGroupDual` Check | ℚ(√−5), p=2 | [𝔭] generates A_K; strict group 0. Correct. |
| `idelicCharacter_equiv` | p=2 real place; w∤p units | Kills B_F at every p. Correct. |
| `twoRamifiedCorrespondence` | F with real places | Convention fixed; imaginary F unchanged. |
| §4.4 image | 𝒪=ℤ_2, g=1; derivative of φ at 0 | g(0)∉2ℤ_2 is detected. Correct. |
| `padicClassNumberFormula` | F=ℚ; ℚ(√5), p=3 | Both checks recomputed. |
| `exceptionalOmega_finite` | p=37 (B_32→ω^5) | ω component zero. Correct. |
| `pRamified_characterRank` | p=3; ψ=1 | Rank one in ω; e_1X_∞=0. |
| §4.18 step 2 against the new supplier | ClassicalArithmeticCompletion §1.55 at p=2, m odd | (g)^m=P^γ gives (g)=∏(σ_b^{−1}𝔓)^{Σ⟨2^tb/m⟩}, with the inverse residue character as in §1.47. Matches. |
| §3.3(f) Check | k=ℚ(√5) | [E:C]=2. Correct. |
| Lean `minpoly_step_of_not_dvd` | m=1 | X^ℓ−1=(X−1)Φ_ℓ. The identity holds. |
| Lean `norm_one_sub_mul_of_not_dvd` | m=1 | 0=0. Holds. |

## Sources verified (printed pages)

Rubin's draft (swc-math, SHA-256 prefix `de47655d`; printed page = PDF − 10):

| Locator | Page | Confirmed |
|---|---|---|
| I Prop 6.1 | p.14 | yes |
| I Prop 6.3, (7) | p.15 | yes |
| III (3), (5) | p.35 | yes |
| III Prop 2.6 | p.37 | yes |
| III Thm 2.7, Cor 2.8 | p.38 | yes |
| III Thms 2.9–2.10 | p.39 | yes |
| III (9), (10), Def 4.1 | p.40 | yes |
| III Def 4.2, Prop 4.3 | p.41 | yes |
| B Prop 3.3 | p.154 | yes |
| B Cor 3.4–3.5 | p.155 | yes |
| D Lemma 1.1, Def 1.2 | p.164 (page image read) | yes |
| D Prop 1.3, Lemma 1.4 | p.165 | yes |
| D Lemma 1.5 | pp.165–166 | yes |

Coleman, *The dilogarithm and the norm residue symbol* (Numdam, `bf97591e`): Theorem 1, p.377, confirmed.

Sinnott's Lemma 5.1, Theorem 6.1 and §7, and Rubin 1988 Lemma 1.2, were read
by the fix worker and, for Sinnott, by the ~codex3 reviewer. I did not re-open
those scans.

## Lean and checks

- `lean-check …/Suggested.lean`, before the edits: exit 0, 15 `declaration uses sorry` warnings, no errors (322 lines).
- After the edits: exit 0, the same 15 warnings, no errors (318 lines).
- `scripts/check_sorry_data.py`: exit 0.
- The gate's mech_check is unchanged from main, apart from the line shift and the bold scope name Chebotarev replacing FiniteFieldsAndCharacterSums. Its 11 README Check/API names absent from Lean are as on main.
- Anchors: 76. Internal links: 190, all resolving.
- Every kept definition (`chiComponent`, `chiSum`) has real bodies and at most three proved tests.
- No `True`, no sorry'd data, no `#eval` and no process comments.

## Form, size, own words, metadata

- **Size.** 339,974 bytes after the fixes. That is above the issue template's 200 KB. PACKAGE_REVIEW's shape rule of 2026-10-12 overrides older size notes ("Size is whatever that content needs"). For comparison, ColemanPowerSeries is 987 KB and EulerSystemsAndKolyvaginSystems 758 KB. Nothing was cut.
- **Own words.** No verbatim passage was found in the sections read. Rubin's definitions are restated in the README's own notation.
- **Tate's thesis.** No theorem of Tate's thesis is a target.
- **metadata.toml.** `topic = "math.NT"`, which is correct.

## Duplication against current upstream

I searched TauCetiRoadmap main `14e4aedb` and Tau Ceti `a91d3aaf` for circular and cyclotomic units, Euler and Kolyvagin systems, main conjectures, Sinnott, Greither and Stickelberger. ClassicalArithmeticCompletion now owns Stickelberger's relation for Gauss sums. This package re-proves none of it; it cites §§1.47 and 1.55 (fix 3). Nothing else overlaps. No target was removed.

## Follow-ups for the maintainer (outside this job's files)

- The packet still lists the four old gaps and the twelve requests (as ~adv4 noted).
- The EulerSystemsAndKolyvaginSystems README names this roadmap with atlas ids ("EulerSystemsCyclotomicMainConjecture L0/L2", around its lines 4381, 5446 and 5486). ESKS is a supplier of this roadmap, so a supplier-graph reader may see a cycle. Rewording them as "given downstream by" would match the de-cycling of IntegralIwasawaTheory.
- SelmerIwasawaCohomology's package review is still needs_changes. If its revision renumbers §§0.6, 0.8, 2.7–2.9, 2.25, 3.1, 3.5, 4.16–4.17 or 4.20, these citations need to move with it.
- IntegralIwasawaTheory §0.3 could state total ramification from level 0 for the cyclotomic tower, and §6.3 could state its p=2 and m=1 coverage explicitly.
- LinearFormsInLogarithms (IntegralIwasawaTheory's Baker supplier) is an open upstream pull request by another author.

Untrusted text: the supplier READMEs, the earlier reports and handoffs, the open
upstream pull request and the fetched papers were read as data. None contained
instructions, and nothing suspicious was found.
