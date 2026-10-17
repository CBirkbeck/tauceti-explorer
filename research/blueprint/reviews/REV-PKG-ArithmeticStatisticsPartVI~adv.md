# Independent package review: ArithmeticStatisticsPartVI (adversarial pass)

Claude (Opus), session `claude-24a9pG`, reviewing issue #10279 on 2026-10-17. This session did not write,
split, fix or previously review any part of ArithmeticStatistics.

**Verdict: accepted with the corrections in this pull request.** The part is a complete package in its own
right, cites only Parts I, II, III and V, AnalyticNumberTheory (Part II) and lower-tier roadmaps, keeps every
target of the original Layer 4, and leaves ModularityAndLanglandsExtensions downstream only. Three ownership
questions for the maintainer are listed at the end; none blocks the draft.

## What was read and checked

- PACKAGE_REVIEW.md, WORKERS.md, PROTOCOL §§5, 13, 20, UPSTREAM_GUIDE.md; the split handoff
  `FIX-PKG-ArithmeticStatistics~adv2.md` and the two earlier package reviews of the unsplit roadmap.
- The whole README (2,045 lines before the review), the Suggested.lean and metadata.
- **Nothing lost at the boundary.** The original Layer 4 (lines 12671–15078 of the pre-split README, commit
  `270eb2332^`) was compared with the part after normalizing blank lines and the two proof-opening phrasings.
  The only differences are the three forward links the split replaced by local facts and one added Examples
  paragraph. All 103 target anchors of the original Layer 4 are present; the original Lean Layer 4 block is the
  part's Lean file.
- **Links.** All 558 relative links resolve after the review: 348 within the part and 210 to Parts I, II, III, V
  and AnalyticNumberTheory Part II; none points to Parts VII–VIII. Parts VII and VIII link into this part at five anchors (height moments, rational p-torsion,
  local Selmer mass ratios, the two-Selmer average, the archimedean ratio), all unchanged.
- **Tiers.** Every external supplier cited is at a lower tier and upstream (stage `pr` or `main` in
  `upstream/tauceti_status.json`) or a TauCetiRoadmap roadmap. ModularityAndLanglandsExtensions is not cited;
  it consumes Part III's quantitative Hilbert irreducibility, not this part.
- **Library declarations.** The 44 Mathlib/Tau Ceti declarations named in the README were looked up in the
  pinned declaration index; 43 are there. One was misattributed: `WeierstrassCurve.naiveHeight` is not in Mathlib at the pin;
  the pointwise height is Tau Ceti's `WeierstrassCurve.Affine.Point.naiveHeight` (corrected).

## Sources

A seeded random sample of 15 targets (`random.Random(10279)` over the 103 target anchors), plus about 40
further locators, were checked page by page in the public texts: Bhargava–Shankar arXiv:1006.1002v3
(Propositions 2.8, 3.6, 3.7, 3.9, 3.16, 3.18, Corollary 3.8, Lemmas 3.15, 3.20, Theorems 3.17, 3.19, (23), (74));
Bhargava–Gross–Wang arXiv:1310.7692v2 (Theorems 5–7, 12, 15, 33, 40, 41, 44, Corollaries 3, 8, Remark 4,
Proposition 42, Definitions 39, 43, (23), Appendix A.1–A.5, A.8); Bhargava–Skinner arXiv:1401.0233v1 (Theorems
1, 3, 4, 7, 9, Lemmas 8, 14–16, Propositions 11, 12, 17); Bhargava arXiv:1402.1131v1 (Theorems 1, 2, 11–16,
Corollary 15); Bhargava–Shankar arXiv:1007.0052v2 (Theorems 1, 3, 41–44, Corollaries 2, 7, Lemma 33),
arXiv:1312.7333v1 (Theorems 2, 3), arXiv:1312.7859v1 (Theorems 2–6, Propositions 35–40, the .5501 mixture);
Bhargava–Shankar–Swaminathan arXiv:2110.09063v1 (Theorems 1.1, 1.2, 7.4, 7.7, 7.14, Lemmas 7.3, 7.8,
Proposition 7.10, (62)); Poonen–Rains arXiv:1009.0287v2 (Conjecture 1.1, §5 p. 21); BKLPR arXiv:1304.3971v2
(Lemma 5.7, Remark 5.12); Skinner, Annals 191 (Theorems B–D, pp. 331–332). **Every sampled locator was correct.**
The README's correction of the proof of Lemma 33 of arXiv:1007.0052v2 (one isomorphism class per j-invariant is
false; the count holds with automorphism weights) was confirmed against that proof. The coefficient condition
`16ℤ` in the hyperelliptic targets agrees with BGW Theorem 15 (κ=4, so κ²=16). Also read for the new supporting
target: Dokchitser–Dokchitser arXiv:math/0610290v3, Conjecture 1.2 and Theorem 1.4 (p. 2), Theorem 4.19 (p. 26).

## Corrections made

README:

1. **Scope and ownership, Exact supplier contracts** rewritten for this part. The split had copied the roadmap-wide
   paragraphs into every part, so this part's contracts listed suppliers it never uses (polynomial Galois groups,
   class groups, finite quadratic modules, moment determinacy, polar decomposition, Hurwitz spaces, étale duality,
   R09.1, IG.3–IG.5). The new sections list exactly the suppliers the targets cite, and say that the others are in
   the parts that use them.
2. **AnalyticNumberTheory links** pointed at the AN overview index; they now point to AnalyticNumberTheory Part II
   §§5.4–5.7 (`#s5-4`…`#s5-7`), the actual owner, and state that this part uses them only through Parts III and V.
3. **Duplication with HeightsRationalPointsAndObstructions §§3.18–3.18c** (tier 9, TauCetiRoadmap PR #1017),
   which owns the Bhargava–Gross–Wang route for locally soluble models. Added a Scope bullet naming the owned
   statements, and made the coinciding targets import them: `tamagawa_SLquotient_two` (Tamagawa central quotient,
   whose proof had imported a nonexistent "AdelicAlgebraicGroups, Part II"), the local masses `a_v` (hyperelliptic
   local mass ratio), the orbit-Jacobian constant (pencil measure comparison), `pencilOrbit_cuspBound` (pencil
   Selmer weighted count), `average_SelmerPicOne_le_two` and `codimensionTwo_congruenceTail` (hyperelliptic
   average two and the supporting paragraph), `biquadratic_SelmerParity` (four-twist local parity), the real
   effective fraction (real effective divisor image) and the qualitative real-root count (order-k vanishing
   average). The pencil weight's local factorization now cites HRPO §3.18a's oriented-ideal classification
   instead of a class-number statement "requested from AA.4" that AdelicAlgebraicGroups does not contain.
4. **Library and upstream overlaps.** The two-division quotient lemma now cites Tau Ceti's
   `AddSubgroup.index_range_nsmul_mul_card_ker` (at the pin), which is exactly its key step; the Cartan
   decomposition target cites TauCetiRoadmap.ReductiveGroupsPartII RG2.4.4 and states that it adds only the
   valuation invariants and the right-coset count. Both are recorded in Scope and ownership.
5. **New supporting target `support-p-parity`.** Balanced three rank zero imported "finite 3-Selmer parity as the
   requested Dokchitser theorem", and the five-Selmer balanced bounds and the rank-one torsion-image bound used
   p-Selmer parity, but no roadmap plans it. The supporting target states the Dokchitser–Dokchitser theorem with
   its locator, the finite form `s_p−t_p ≡` root-number parity (BS ternary Theorem 42, p. 21), its derivation for
   odd p with `E(Q)[p]=0`, and three Checks; the three consumers link to it.
6. **Process language and residue removed:** "request"/"requested" (eight places), "parent", "accepted paper
   route item 48", "moves to the present lower-tier plan", "upward tier20 roadmap", "G-five-density", "acceptance
   condition", "planned at Layer 2", "the generic n=0 interface", three references to Lean signatures that no
   longer exist ("suggested … signature", "Lean prototype"), the undefined abbreviations BS3 and JC2
   (JacobianChallengePartII, outside the 94; replaced by SchemeAndStackFoundations:SF.3), and "Layer d" → Layer D.
7. **Form:** seven hypothesis lists that had been run together without punctuation are now sentences; three
   expressions (`#E[3](F_p)`, `#J[2](Q_v)`, `#J[2](R)`) rendered as accidental Markdown links and are rewritten
   as `E(F_p)[3]` etc.; missing spaces between words and numerals in §§4.25–4.27 and `mod8`-style tokens
   were fixed; duplicated reference entries [123]–[126] (same papers as [30]–[33]) were merged; doubled periods in
   six locators removed; five duplicated Check bullets removed and one reduced to its new case.
8. **Mathematics:** the archimedean ratio in "Selmer average as product of local masses" is now taken at X>0
   (0/0 at X≤0); the σ(n) Checks no longer say "σ(p)=p+1" for n=4; the generic-p-torsion step of "rational p
   torsion has density zero" now states its generic input (the generic p-division polynomial has no root over
   Q(A,B)) as part of the target instead of pointing to an analytic input that does not contain it; the plane-cubic
   orbit transfer states its covering/integral-representative obligation and cites Part II's genus-one stabilizer
   schemes.

Suggested.lean:

- All nine `example`s were `by sorry`; every one, and every example added below, is now proved (`decide`, `simp`, `norm_num`), so the unit tests
  test something. Only the two milestone theorems keep `sorry`.
- `ternaryValue` was `private` but appeared in the public theorem `positive_plane_cubic_solubility`; it is now the
  public `ternaryCubicValue`, with a negative control pinning the monomial order (x²y gives 12, x²z gives 16 at
  (2,3,4)).
- Added negative controls for the odd-component bound (strictness `S₅(3)<2⁴`, saturation `S₄(5)=2³`).
- Added the light real-bodied definitions `pointCountModFive` and `RankOneFamily` (the Bhargava–Skinner family as
  a predicate on integral short pairs). The README's five Checks are now decided examples: `(-136,16)` is in the
  family (d=39277=7·31·181, #E(F₅)=8), and `(-136,-16)` (split at 7), `(136,16)` (negative Δ₀), `(-16,16)`
  (v₂(A)=4) and `(-1000,1136)` (#E(F₅)=6) are not. The last was checked by hand to satisfy every other condition.
- Module docstring states the design choices; a closing comment names the README definitions that are not Lean
  declarations.
- `lean-check` (Mathlib 082e2d3 / Tau Ceti f790474): exit 0, two warnings, both `declaration uses 'sorry'`
  (`component_bound_ratio_tendsto`, `positive_plane_cubic_solubility`). 163 lines. `scripts/check_sorry_data.py`
  clean; `intake.py check-files` 0 problems; `git diff --check` clean.

## Adversarial mathematics pass

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Rational orbit weight, orbit count | S₃ on Fin 3 with Γ=1, Y={0}: w=2, n=1; ZMod 6, Γ={0,3}, Y={0,1,3,4}: Y Γ-stable, w=n=2 | correct | merged a duplicated Check |
| Locally soluble set S(F) | x³y−16xy³: (I,J)=(48,0)=(2⁴·3,0), rational root; x³y−xy³: I=3; −x⁴−y⁴ definite | correct | merged three duplicated Checks |
| Local and archimedean masses | Δ>0 area ∫₀^{X^{1/3}}4I^{3/2}dI=(8/5)X^{5/6}; box 8X^{5/6}; Δ<0 (32/5); M₃=3⁻⁴(1−3⁻¹⁰), Π M_p=1/(81ζ(10)) | correct | one redundant Check reduced to the Δ≠0 case |
| Height-ordered average and rescaling | h(n)=n, φ(n)=n, X=5: 5/2 vs 3/2 for 2h; empty sublevel value 0 | correct; finite-cutoff averages differ | none |
| Cartan decomposition, coset count | diag(p,p) scalar; diag(1,p): p+1 cosets | correct | cites ReductiveGroupsPartII RG2.4.4 |
| Nonintegral translates, global weight product | p²x⁴+y⁴: Δ=256p⁶; 4x⁴+y⁴: Δ=2¹⁴, diag(1,2) gives x⁴+4y⁴ | correct | none |
| Nonsingular quartic count q²(q+1)(q−1)² | q=2,3,5,7: 12, 144, 2400, 14112; case split (q−1)(q⁴−q³)+(q−1)(q³−q²) | correct | none |
| Local solubility away from p²∣Δ | 2(x²+y²)²+3xy³: (I,J)=(64,538), Δ=28116=2²3²·781, values ≡2 mod 3 on primitive vectors; type (1²2) nonsquare step | correct | none |
| Orbit-map Jacobian −1/27 | recomputed all five columns (E₁₁, E₁₂, E₂₁, ∂_I, ∂_J); row swap gives lower-triangular, det −1/27 | correct | none |
| Volume of PGL₂(Z_p), change of measure | p=2: 3/4, p=3: 8/9; φ=1; p=3, {I≡3 mod 9}: integral orbits force J≡0 mod 27, both sides 24/3⁵ | correct | none |
| Two-division quotient, local descent index | Z₂×Z/2: 4=2·2; Z₃×(Z/2)²: 4=4; y²=x³+1 over Q₅ (−3 nonsquare mod 5) | correct | proof via Tau Ceti lemma |
| Archimedean ratio one half | y²=x³−x (Δ>0): 4 and 2; y²=x³+1: 2 and 1 | correct | none |
| Selmer average as a ratio | X≤0 gives M_∞=0 | **0/0 at X≤0** | ratio taken at X>0 |
| Real-soluble orbit counts | (8/135)ζ(2), (32/135)ζ(2) | correct | none |
| Tail and uniformity estimates | p>X^{1/2} empty since |4A³+27B²|<8X/27; min(X/p², X^{1/3}) ≤ X^{5/6}p^{−3/2}; μ_p{p²∣Δ}≤3p⁻² | correct; BS Prop 3.16 exponent 3/2 confirmed | none |
| Count of all curves | 8X^{5/6}/(81ζ(10)); in H(E): 2^{4/3}3^{−3/2}/ζ(10) | correct | none |
| Tamagawa PGL₂ | partial product to p≤3 ≈ 2.193 | correct | none |
| Rank and Sha bounds | 2k≤2^k (equality k=1,2); Jensen gives only log₂3 | correct | wording of one Check |
| Rational 2-torsion | |r|≥2α^{1/2} ⇒ |r³+Ar|≥6α^{3/2}>(X/27)^{1/2} | correct | none |
| 3-, 4-, 5-Selmer averages, rank bounds | 6r−3≤3^r, 20r−15≤5^r (equality r=1,2); 7/6, 1.05; 4-Selmer σ(4)=7 | correct | σ(n) Checks corrected |
| 5-Selmer group convention | (λI₅,λ⁻²I₅) acts trivially iff g₁ acts on the alternating matrices; det((g₁,g₂)) on V is ((det g₁)²det g₂)^10 | agrees with arXiv:1312.7859 (2), p. 5 | none |
| Second moment ≤15, marked bound ≤8, marked Jacobian ≤6 | N=1,2,4: (N−1)(N−2)=0,0,6, N(N−1)=0,2,12; N²=(N−1)(N−2)+3N−2; 8+9−2=15; 12/2=6 | correct | none |
| Odd component bound | S₃(1)=3, S₅(3)=15<16, S₃(9)=4, S₁(k)=1, S_m(0)=0, strictness needs k<m−1 (k=m−1 odd gives equality) | correct | Lean negative controls added |
| Admissibility, restricted Selmer set | empty local sets fail via (1,0,1); no places; one empty image | correct | residue removed |
| Hyperelliptic mass ratios, Tamagawa SL_n/μ₂ | g=1: 1/2, 2; g=2: 1/4, 4; τ(SL_n/μ₂)=2 vs τ(SL_n)=1 | correct | imported from HRPO §3.18b |
| Mod-eight parity family, density 2^{−4n−4} | y=2Y+x gives Y²+xY=x^{2g+1} mod 2 (split node); 8^{−n−1}2^{−n−1}; residues 1,7,2,6 | correct | none |
| Positive empty Selmer set | T≥2N+2E−4Z−4B gives liminf Z/N≥δ/2 | correct | none |
| Corrected two-prime criterion | (p,q)=(5,3): 2 inert in Q(√5), ramified in Q(√3), Q(√15), so one prime above 2 | correct | none |
| Rank-one family | (−136,16), (−136,−16), (136,16), (−16,16), (−1000,1136) all recomputed; 7 not a square mod 39 (source p. 16) | correct | decided in Lean |
| Rank-one family properties | −39≡1 mod 8 (2 splits), (−39/5)=1, (−39/7)=(3/7)=−1; Frobenius {−1,−7}≠{1,7} mod 5 | correct | none |
| Saturated count, simultaneous rank one | 1−2/(p−1): p=5 gives 1/2, p=3 gives 0 | correct | none |
| Plane-cubic heights | I=c₄/16=−3A, J=c₆/32=−27B; 27H_AB≤H_IJ≤(729/4)H_AB | correct | proof obligation made explicit |
| Five-Selmer balanced and full bounds | 12r+1≤5^r (even), 60r−55≤5^r (odd); LP optimum 3/4; 7/8, 3/8; .5501·.75+.4499·1.05=.88497; 100501/120000≥67/80=100500/120000; 16503/80000≥1031/5000 | correct | none |
| Two-Selmer nonlift | 5·2^a−8≤4^a−2^a (equality a=1,2); mean liftable ≤12/5, so ≥3/5 | correct | none |
| p-Selmer parity (new) | rank 0, Sha trivial, E(Q)[p]=0: s_p=0, w=+1; E(Q)[3]≠0 with Sel_{3∞}=0: s₃=t₃≥1 | consistent with DD Theorem 1.4 and BS Theorem 42 | supporting target added |

## Ownership questions for the maintainer

1. **HeightsRationalPointsAndObstructions §§3.18–3.18c vs. §§4.15–4.21 here.** This review made the imports explicit
   but deleted no accepted target. Still duplicated in substance: the regulator-constant route to BGW A.3 (selmer
   regulator parity, biquadratic parity formula, and the supporting regulator-constant paragraph) against HRPO's
   own `Selmer_isogenyEulerCharacteristic` route; the weighted pencil count and weight factorization; the real-root
   input (DPSZ rate here, the qualitative statement there). Either delete these from this part and import HRPO, or
   move this part's family generalizations into HRPO.
2. **p-Selmer parity** is now a supporting target of this part. A lower-tier owner (SelmerIwasawaCohomology or
   ArithmeticGaloisDuality) may be preferable, since ArithmeticStatisticsPartVII also uses Selmer parity.
3. **Integral representatives for the degree-3, 4 and 5 Selmer parametrizations** (BS ternary §3, BS 4- and 5-Selmer
   papers, Bhargava plane cubics Theorems 12–14 and Corollary 15) are not owned targets of Part II, which has the
   stabilizers and invariants. This part states them as proof obligations inside the 3-, 4- and 5-Selmer average
   targets and the plane-cubic transfer. Promoting them to Part II targets would be cleaner.

No defect remains that blocks the draft pull request.
