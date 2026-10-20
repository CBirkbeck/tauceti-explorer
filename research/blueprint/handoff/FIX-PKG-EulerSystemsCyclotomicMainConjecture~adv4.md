# Fix: Euler systems and the unconditional cyclotomic main conjecture (after REV-PKG~codex3)

Refs #11342. Claude (Opus 5.5), session `claude-nUlO9n`, 20 October 2026.
This is a completed package fix, not a checkpoint.

The issue names `research/blueprint/reviews/REV-PKG-EulerSystemsCyclotomicMainConjecture~adv.md`
as the findings. That file does not exist. The open findings are those of
`research/blueprint/reviews/REV-PKG-EulerSystemsCyclotomicMainConjecture~codex3.md`
(needs_changes): the sixteen supplier statements D1–D16 that the cited
suppliers do not make, four minor citations, and the coarse supplier ids.
Its four closed obligations (§§3.3, 4.7, 4.18, 4.21) were not reopened.

Edited: `README.md`, `Suggested.lean` (comments only), `review.json`. No other
package, packet or ORDER.txt was touched. Section numbers were kept: each
missing statement became a named target inside its first consumer section,
and one new section §4.27 was added at the end of Layer 4.

## Finding → change

| # | Finding | Resolution |
|---|---|---|
| D1 | Y_∞^χ f.g., torsion-free, rank one (Iwasawa 1973 Thm 25 via Rubin p.38) | Owned: `localUnitLimit_rank_one` in §2.2. (a) local norm control (Hilbert 90, `localArtinEquiv`, norm of a uniformizer), moved from §3.3 step 5, which now cites it; (b) rank one from normal-basis ranks p^n and the control; (c) E′_∞^ψ torsion-free, by a no-p-th-power-capitulation argument in the totally real tower. **Correction:** torsion-freeness of Y_∞^χ itself is false in general: L=ℚ(√6), p=3 has ℚ_3(√6)=ℚ_3(√−3), and lim μ_{3^{n+1}}≅ℤ_3(1) lies in Y^χ_∞. Only (b)–(c) are used (§2.3 updated). |
| D2 | Sinnott Prop 5.1 and tower theorem | Owned: §3.3(f) `sinnottCorrection_primes` (Lemma 5.1 p.210, Prop 5.1 pp.211–212) and (g) `sinnottStableIndex` (p.182; Thm 6.1 p.226; §7 pp.232–233), proved in new steps 14–15; steps 3, 13 and §5.1 cite them. |
| D3 | χ-isotypic restriction–Kummer | Owned: `restrictionKummer_chiEquiv` in §0.25 (Rubin III (3) p.35; I Prop 6.3(i), (7) p.15), from ProfiniteCohomology L5, SelmerIwasawaCohomology §§0.8, 2.7. §§0.28, 1.2, 2.2 cite it. |
| D4 | Rubin I Prop 6.1 and limit (5) | Owned: `selmer_eq_classGroupDual` in §1.3 (p.14; III (5) p.35); §2.4 cites its tower clause. |
| D5 | Rubin Cor B.3.4 | Supplied: SelmerIwasawaCohomology §3.5 states Rubin B.3.3–B.3.5. §2.2 now derives lim H¹ = lim S^{Σp} from it (every ℓ≠p has infinite decomposition group, IntegralIwasawaTheory §0.3; H¹_ur⊆H¹_f, SIC §2.7). |
| D6 | infinite/idelic CFT | (b) supplied by IntegralIwasawaTheory §2.7 `finiteGlobalLocalSequence` (D_n=0 by §4.4, Σ_n=0 at odd p): §§3.1, 3.3 step 2. (c) owned `twoRamifiedCorrespondence` in §4.17 (Tau Ceti CFT L11–12 + IIT §2.3). (d) owned `idelicCharacter_equiv` in §0.30 (Rubin III (9),(10) p.40; cor↔inclusion p.41). |
| D7 | four-term sequence | Supplied: SelmerIwasawaCohomology §4.17 states 0→E^+/C→U^+/C→X^+→Y^+→0 for every closed C⊆E; general L via IIT §2.7. §3.1 and §3.3 step 8 re-pointed. |
| D8 | general abelian integral Coleman image (Rubin III.2.9(ii)) | Owned: new §4.27 `integralColemanImage_primeToP` and `cyclotomicMainConjecture_chi` (Rubin III.2.10), integral for characters of order prime to p, from §§4.3–4.8 with exact projections and a Gauss-sum unit generator. The χ-form was removed from §3.5, which now points to §4.27. |
| D9 | Coleman sequence over unramified rings at p=2 | §4.4 is now proved here: Coleman 1979 Thm 22, p.109 (Greither prints "Theorem 2.2"), image and kernel pp.109–110, Coleman 1983 Lemma 2/Thm 3 via Greither p.460; ColemanPowerSeries §§1.82–1.85, 1.117–1.120 supply norm, trace and interpolation over one unramified ring at every p. Two new Checks (p=2 constant term; derivative versus value). |
| D10 | Stickelberger series and L_p=G_p(u^s−1) | Supplied: IntegralIwasawaTheory §6.3 `bernoulliStickelberger_dictionary` (conventions include p=2 with q=4; m=1 covers p-power conductor). §4.7 step 4 re-pointed, with the vanishing of the −½ term (ρω^{−1} nontrivial on Δ′). The trivial zero is the interpolation at s=0 (§4.16). |
| D11 | p-adic class number formula | Owned: `padicClassNumberFormula` and `padicCircularLog_image` in §4.23 (from CCGS §3.4 `realClassNumber_log_product`, DirichletPadicLFunctions §3.6, IIT §4.3, group determinant); §4.26 step 3 cites the latter. |
| D12 | Rubin 1988 Lemma 1.2 | Owned: `rubinUnitTateBound` in §4.10 (p.703, proof pp.703–704); Iwasawa's capitulation bound replaced by IIT §2.8 `uniformCapitulationBound`. |
| D13 | exceptional ω control; minus class-number product | Owned: `exceptionalOmega_finite` in §4.14 (CCGS §3.2, IIT §3.1, §4.2, Ferrero–Washington); step 5 uses CCGS §3.4 `relativeClassNumber_character_product`. |
| D14 | Greither Prop 4.7 sequence | Owned: `splitExtension_abelianization` in §4.17. |
| D15 | Rubin App. D λ_m | Owned: `rubinLocalFunctional` in §0.30 (Lemma 1.1, Def 1.2, Prop 1.3, Lemma 1.4, pp.163–165; g_m from Coleman 1979 Thm 24; explicit formula from Coleman 1981 Thm 1, p.377). |
| D16 | characterwise ranks; A′(F)≅Y/TY | §4.23 corrected to (1−e)A′(F)≅(1−e)Y/TY (IIT §3.5); owned `pRamified_characterRank` in §5.3 (IIT §§2.4, 2.6, 2.7, CPS §3.46, Mathlib CM unit index). |
| minor | CPS "L1 over a product" | Contract reworded: one unramified ring, product componentwise (§§0.97, 0.148–0.150). |
| minor | Galois equivariance of norms | Proved in §0.10 step 3 (Mathlib `Algebra.norm_eq_prod_automorphisms`, `autEquivPow`). |
| minor | ℤ_p[[Γ′]] Amice form | Derived in §4.6 step 3 (PMIA L1 comparison + L2), with a Check. |
| minor | §§4.9, 4.11 Needs | Narrowed to ESKS §1.7. |
| ids | coarse supplier ids | All replaced by sections; contract block rewritten per supplier; Layer dependency lines rewritten. |

Extra correction found in the pass: §4.26 said |(R:U)_{χ′}| "can be a negative
power of p". Sinnott's Lemma 5.1 argument works verbatim for ℤ_p-lattices, so
each component index is the order of a finite group, a nonnegative power of p,
and 1 when p∤|Δ| (consistent with Corollary 4.15). Also §0.24's finiteness of
[E_L^χ:C_{L,χ}] is now derived from rank one and L(1,χ̄)≠0 instead of a
forward reference, and §0.23 step 1 uses Mathlib's Φ_g(1)=1.

## Adversarial pass on the touched statements

| Statement | Instances tried | Result |
|---|---|---|
| `restrictionKummer_chiEquiv` | χ=1, L=F; ℚ(√5), p=3; p=2, ℚ(i) | Plain Kummer; 3 has zero χ-part, ε has χ-sum −ε²≡ε²; −1 restricts to 0 in ℚ(i), so p∤|Δ| is needed. Checks added. |
| `idelicCharacter_equiv` | F=ℚ, odd p; principal units; real place at p=2 | H¹(ℚ,ℤ_p)≅ℤ_p; full local units needed in (b); sign character does not lift. |
| `rubinLocalFunctional` | ℓ=p; p∤f character sum; ℓ∤mp | Tautological; λ_{f,χ}(g_f(0)^{1/f})=χ(−1) exactly (geometric series (χ(p)−p)^{−1}); direction λ_{mℓ}|=λ_m∘(−Fr_ℓ) fixed by Tr x_{mℓ}=−Fr_ℓ^{−1}x_m (Rubin's diagram and his restatement in Prop III.4.3 can be read in opposite directions; the trace computation decides). |
| `selmer_eq_classGroupDual` | L=K, χ=1; ℚ(√−5), p=2 | Rubin I (4); unramified-at-p group ℤ/2 vs strict group 0. |
| `localUnitLimit_rank_one` | ℚ(√6), p=3; conductor 5 at p=3 and p=11; trivial ℤ_p | Y^χ_∞ has Λ-torsion ℤ_3(1): statement weakened to rank one and torsion-free p-unit limit; R^χ=0 vs O′; rank needs growth p^n. |
| `sinnottCorrection_primes` | prime-power conductor; ℚ(√5) | (R:U)=1; [E:C]=2. |
| `sinnottStableIndex` | k=ℚ | c⁺_{ℚ_∞}=1/2, v_p=0 for odd p; the exponent 2^{[k_n:ℚ]} fixed. |
| §4.4 Coleman sequence | p=2, 𝒪=ℤ_2, g=1; 𝒪=ℤ_p | 1 has g′(0)=0 but g(0)∉2ℤ_2; last map uses f′(0). |
| §4.6 Amice form | r=[1]−[a] | linear coefficient a−1. |
| §4.7 dictionary | −½ term; p=2 | vanishes as ρω^{−1} is nontrivial on Δ′ (ρ even, ω odd, also mod 4). |
| `rubinUnitTateBound` | K_0=ℚ; s≥1 | Herbrand quotient 1; γ−1 kills Ĥ⁰(R_m) only by total ramification. |
| `exceptionalOmega_finite` | p=3; p=37; Λ/p | class number 1; B_32 component is ω^5≠ω; μ=0 needed for finiteness. |
| `splitExtension_abelianization` | ℤ_p⋊ℤ_p, γ=1+p | G/G′=ℤ/p×ℤ_p. |
| `twoRamifiedCorrespondence` | ℚ(√−7) | two ℤ_2^× factors, separate inertia groups. |
| `padicClassNumberFormula` | F=ℚ; ℚ(√5), p=3 | trivial; ε^8=21ε+13≡1+3ε² mod 9, v_3(R_3)=1, L_3(1,χ) a unit; Euler factor needed. |
| `padicCircularLog_image` | trivial character | removed by e′ (pole of L_p(s,1)). |
| §4.23 A′(F) | full A′(F) | extension of Γ by Y_Γ; only (1−e)-parts identified. |
| §4.27 | L=ℚ(μ_p)^+; k=1 variable change; χ of conductor 5 at p=11 | agrees with CPS §4.30; L_χ(u−1)=G_p(0,χ); outer ℤ_p(1)-terms vanish. |
| `pRamified_characterRank` | p=3; distribution; ψ=1 | rank in ω-part; units force each odd rank 1; e_1X_∞=0. |

## Sources (public; read for this job)

- Rubin, *Euler systems*, author draft (swc-math): I §6 pp.13–16; III §2 pp.34–39; III §4 pp.40–42; App. B §3 pp.153–155; App. D pp.163–168.
- Greither 1992, Numdam, SHA-256 prefix `8e4db974`: pp.456–462, 468–476, 488–494.
- Sinnott 1980, GDZ scan `ca496fb4`, read as rendered pages: pp.182, 210–212, 226, 232–233.
- Coleman, *Division values in local fields*, Invent. Math. 53 (1979), GDZ `PPN356556735_0053/LOG_0011`, `6815542a`, journal page = PDF page + 89: pp.108–110.
- Coleman, *The dilogarithm and the norm residue symbol*, Bull. SMF 109 (1981), Numdam, `bf97591e`: Theorem 1, p.377.
- Rubin, Invent. Math. 93 (1988), GDZ `PPN356556735_0093/LOG_0034`, `a545c055`, journal page = PDF page + 699: pp.703–705.

Not freely available and only cited as invoked by the public sources:
Washington's book, Iwasawa's 1973 Annals paper, Wiles 1978, de Shalit,
Gillard 1979, Coleman 1983 (via Greither pp.460–461). No uncleared book was used.

## Validation

- `lean-check research/blueprint/packages/EulerSystemsCyclotomicMainConjecture/Suggested.lean`: exit 0, no errors, 15 `declaration uses sorry` warnings (322 lines; only comments changed).
- `python3 scripts/check_sorry_data.py` on Suggested.lean: exit 0.
- mech_check: 24 Lean declarations; the 11 README API names absent from Lean and the comment-only Layer 1–5 Lean sections are as on main.
- Anchor check: 76 anchors (new: `integral-coleman-image-prime-to-p`), 187 internal links, all resolving with matching numbers; no Needs link points forward.
- `intake.py check-files` on README and Suggested.lean: 0 problems. `git diff --check`: clean.

## Follow-ups for the maintainer (outside this job's files)

- The packet `research/blueprint/packets/EulerSystemsCyclotomicMainConjecture.json` still lists the four old gaps and the twelve requests. A packet follow-up can close the gaps against §§3.3, 4.7, 4.18, 4.21 and replace the requests by the owned targets listed above.
- Supplier notes, for their own revisions: SelmerIwasawaCohomology could state Rubin I Prop 6.1 (`L2/galois-selmer-group` lists it); ColemanPowerSeries could extend its Layer 2–3 sequence to unramified coefficients and p=2; IntegralIwasawaTheory §6.3 could state its p=2 and m=1 coverage explicitly.
- No ownership move.

Untrusted text: the codex3 report, earlier handoffs, supplier READMEs and the
fetched papers were read as data. None contained instructions; nothing
suspicious was found.
