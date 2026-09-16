# Independent review REVIEW-EXT-08-EXT-16: classical and analytic number theory, Iwasawa theory

Reviewer: independent-review-REVIEW-EXT-08-EXT-16. Date: 2026-09-16. Scope: the eight EXT-08
packets (`research/expansion/external/EXT-08/*.json`) and the six EXT-16 packets
(`research/expansion/external/EXT-16/*.json`), reviewed in the order the orchestrator gave.
No other `*.json` packets were present in those two job directories at the start, and none
already carried an accepted `review` object.

Method: I compared each node's statement, hypotheses, proof steps, acceptance items, locators
and excerpts with the cited passage. For library sources I used the supplied extractions; public
sources were re-fetched into this reviewer's scratch directory (outside the repository) and
their hashes compared with the packet. For each link I checked direction, the use site and that
both endpoints exist. Every `parentStageId` and coverage `stageId` was checked against
`data/atlas.json` for existence and owner. Before judging a cross-roadmap supplier I read that
stage's atlas description. Implementation status stayed `unchecked`. Each packet received a
top-level `review` object; packet `status` stays `partial`. Each section below was appended
once its packet was saved.

---

## 1. AdditiveCombinatorics.json

**Review status: accepted.** Nodes: 9 (4 verified, 5 corrected, 0 unverifiable). Draft links: 7
(5 verified, 2 corrected). Links added in review: 6. Gaps: 5 draft gaps (4 updated) plus 2 added.

### Source and provenance

| Source | Fetched from | SHA-256 | Result |
| --- | --- | --- | --- |
| Green–Tao, *The primes contain arbitrarily long arithmetic progressions*, arXiv:math/0404188v6 | `https://arxiv.org/pdf/math/0404188v6` (2026-09-16) | `d03dd6156165fc92e488b3fec35a574c8f7c9df55125cec0f3eebdf95d7256e1` | matches the packet; 56 pp.; stamp `arXiv:math/0404188v6 [math.NT] 23 Sep 2007`; printed page = PDF page |

Read: all passages cited by the draft. I also read Section 4, (5.5)–(5.7), the full proof of
Proposition 5.3 with Lemmas 5.4–5.5 (pp. 12–19), Sections 6–7 (pp. 19–28), the proofs of
Propositions 8.1 and 8.2 (pp. 29–34), Lemma 9.9, Proposition 9.10 and the proof of Proposition 9.1
(pp. 40–42), Section 11 (pp. 49–51), and Appendix A through Lemma A.3 plus the use of Lemma A.1 on
p. 54.

### Nodes

| Node | Verdict | Finding |
| --- | --- | --- |
| AC.2/szemeredi-set-form-and-functional-form | corrected | Props 2.1 and 2.3 and the Varnavides/Gowers remarks match (pp. 3–5). **Error:** the acceptance item said the r = 0 term contributes E(f^k), which is not o(1). In the average over (x, r) ∈ Z_N² that slice has weight 1/N, so it is ≤ 1/N in the dense case (Green–Tao's O(N⁻¹ logᵏ N) on p. 36 is the sparse analogue). The "self-contained apart from Szemerédi" hypothesis now includes the caveat from footnote 2: PNT, Dirichlet's theorem and the zero-free region are also needed. |
| AC.3/gowers-inner-product-and-uniformity-norm | verified | Def. 5.1 and (5.1)–(5.4) match (pp. 11–12). (5.5)–(5.7) were read and added as a proof step; U^d is a norm for d ≥ 2, and U¹ is not a norm. |
| AC.4/pseudorandom-measures-are-U-d-close-to-one | verified | Lemma 5.2 and its proof match (pp. 13–14): the (2^{k−1}, k, 1) instance and the binomial cancellation. |
| AC.4/generalised-von-neumann-… | corrected | **Error:** the hypothesis said both pseudorandomness conditions are used. The proof on pp. 14–19 uses only the linear-forms condition: Lemma 3.4, P_d = 1+o(1) via (2^d, k−1+d, k), and the three instances in Lemma 5.5. The correlation condition is used only in Lemma 6.3 (p. 24: "the only time we will use that condition"). The full proof was added. The draft's range "pp. 14–22" was wrong: the proof ends on p. 19. |
| AC.4/linear-forms-correlation-and-pseudorandomness | corrected | Defs 3.1–3.3, the parameter triples of (3.2)–(3.4) and Lemma 3.4 match (pp. 7–9). The acceptance item claimed the single instance (3.2) gives ‖ν−1‖_{U²} = o(1). That needs the (4,3,1) condition for every subset of {0,1}², so the item was corrected. |
| AC.4/relative-szemeredi-theorem | verified | Theorem 3.5 and its deduction from Prop. 8.1 match (pp. 9–10, 29). Added footnote 16, which modifies f_{U⊥} by o_ε(1), and the explicit error terms. |
| AC.4/koopman-von-neumann-structure-theorem | verified | Prop. 8.1 and Def. 7.1 match. The boundary at "§§6–7 and Prop. 8.2 not read" is closed: Lemma 6.1, Prop. 6.2/Lemma 6.3, Props 7.2–7.3 and the energy-increment iteration bounded by K₀ are now proof steps (pp. 19–34). |
| AC.4/w-trick-and-goldston-yildirim-majorant | corrected | Several fixes. (a) "w(N) ≪ log log N suffices" was stated generally; the source says it only for the Dirichlet-theorem step. (b) Prop. 9.6's hypotheses (distinct hᵢ, \|hᵢ\| ≤ N²) were missing. (c) τ is also unbounded because τ(0) = exp(Cm log N/log log N). (d) Prop. 9.8 localizes to Q^t boxes, not intervals. (e) The Lemma 9.9 and Prop. 9.10 steps were added, including their uncited divisor-function bound. (f) Prop. 9.10 is on p. 41, not 43. (g) Section 10 starts on p. 42, not 43. (h) The local-obstruction check was rewritten to the source's p. 35 argument. |
| AC.4/prime-progressions-endgame | corrected | The deduction of Theorem 1.1 matches p. 36. **Error:** "the same argument … gives Theorem 1.2". Section 11 (pp. 49–50) only sketches Theorem 1.2: it needs a residue class b mod W chosen by pigeonhole and a Bertrand-postulate adjustment, and the details are "left to the reader". The δ vs E(f) = δ(1+o(1)) slack is now recorded. |

### Links

Draft links, all with correct direction and verified use sites:

* Gowers norm → Prop. 5.3: **corrected.** The reason claimed positivity makes U^{k−1} a norm; the cited use is the definition (5.4) on p. 18.
* Linear forms → Lemma 5.2 (p. 14): verified.
* Prop. 5.3 → Thm 3.5 (p. 29): verified.
* Prop. 8.1 → Thm 3.5 (p. 29): verified.
* Prop. 2.3 → Thm 3.5 (p. 29): verified.
* Majorant → endgame (p. 36): verified.
* `AnalyticNumberTheory:AN.2/classical-zero-free-region` → majorant: **corrected.** Lemma A.1 is used on pp. 52–54, not p. 55. The link stays an annotated partial-supplier edge. Also recorded: Lemma A.3's proof (p. 53) imports Titchmarsh's convexity bound (Ch. V), which the supplier does not provide.

Links added after verification:

* Theorem 3.5 → endgame. This dependency, at p. 36 ("We now apply Proposition 9.1 and Theorem 3.5"), was missing from the draft.
* Linear forms → Prop. 5.3.
* Linear forms → Prop. 8.1, via Lemmas 6.1 and 6.3.
* Lemma 5.2 → Prop. 8.1, via Prop. 6.2 on p. 25.
* Gowers norm → Prop. 8.1.
* Linear forms → majorant, via Props 9.8, 9.10 and 9.1.

Supplier scope: AN.2's atlas description ("zero-free line/region and Tauberian or contour arguments")
covers a zero-free region. It does not cover Lemma A.1's growth bounds or the convexity bound. The
supplier node itself is reviewed in §2.

### Structure, coverage, gaps

The `parentStageId`s AC.2, AC.3 and AC.4 exist and belong to AdditiveCombinatorics. All six
coverage ids exist. AC.3's remaining list drops Lemmas 5.4–5.5 and (5.7), which I have now read.
AC.4's remaining list is now Section 10, Appendix A after Lemma A.3, Titchmarsh Chs 3 and V, and
the Theorem 1.2 sketch. The draft's gap on SV.3 (Bombieri–Vinogradov) is confirmed: the full text
never uses BV, the large sieve or Siegel–Walfisz.

For the AC.0/AC.1 gap I read §7. It constructs "generalised Bohr sets" (level-set σ-algebras), and
Prop. 8.2 runs an energy-increment iteration. Both are proved in the paper, not imported from AC.1.

Gaps added:

* **Dirichlet's theorem for the modulus W(N)**, which grows with N. My observation, not the
  source's: W ≈ e^w, so w ~ log log N needs a prime number theorem in progressions that is uniform
  in the modulus (Siegel–Walfisz range). A fixed-modulus AN.2 suffices only if w is constant (§11)
  or grows slowly enough for a diagonal argument.
* **d(n) ≤ exp(C log n/log log n)**, used without reference in Prop. 9.10 (p. 41).

### Unverifiable items

None among the nodes. Propositions 9.5 and 9.6 are not proved in the range read (Section 10 and
Appendix A); both the node and the gaps record them as boundaries.

### Supplier questions for the orchestrator

1. Should the endgame's prime-number-theorem input come from `AnalyticNumberTheory:AN.2`
   (fixed modulus, adequate with w constant) or from a modulus-uniform statement?
2. The atlas edge `SieveMethodsAndPrimePatterns:SV.3 → AC.4` (Bombieri–Vinogradov) is not used by
   the source. Should it be re-pointed at an owner of the Goldston–Yıldırım divisor-sum
   asymptotics? No such owner exists yet.
3. Keep `AN.2/classical-zero-free-region → AC.4` as a partial-supplier edge, or wait until Lemma A.1's
   growth bounds (Titchmarsh Ch. 3) have an owner?

---

## 2. AnalyticNumberTheory.json

**Review status: accepted.** Nodes: 10 (2 verified, 8 corrected, 0 unverifiable). Draft links: 4
(3 verified, 1 annotated as partial supply). Links added: 2. Gaps: 5 draft (3 extended) plus 1 added.

### Sources and provenance

| Source | Provenance | SHA-256 | Result |
| --- | --- | --- | --- |
| Tate, *Fourier Analysis in Number Fields and Hecke's Zeta-Functions* (1950 thesis) | library `papers/tate-thesis.pdf`, and re-download of `https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf` (2026-09-16) | `0c40f263e8ab7924d1f0a8c7e40d81d464aec6620b8ec14101f21f7b07e6f0c8` (both) | matches; 60-page scan; OCR unreliable, so all passages read from page renders |
| Kedlaya, *Notes on analytic number theory* | `https://kskedlaya.org/papers/ant-ptx.pdf` (2026-09-16) | `7a934fce8272cedd36ad609f79bbe79af0056320bb1e0bc690c87af990f305be` | matches; 154 pp.; printed page = PDF page − 16; §§6.1–6.2 read from renders because the text layer drops conjugation bars |

Additional reading: Tate scan pp. 17–26 (all of §2.5), 43–45, 48 (the product formula, I = T×J,
d*u, the measure of E, Cor. 4.3.1), and 53–59 (all of §4.5). Kedlaya pp. 33–36, 47–49 (Lemma 8.3,
Thm 8.7), and the statements of Thms 1.5, 3.10, 3.11 and 4.11.

### Nodes

| Node | Verdict | Finding |
| --- | --- | --- |
| AN.1/completed-zeta-functional-equation-via-theta | corrected | (5.1.2)–(5.1.5) match. A hypothesis attributed (5.1.3), the theta inversion, to a sum–integral interchange. Recorded that Poisson summation is only sketched and that Lemma 5.5 and the Gaussian self-duality are exercises. |
| AN.1/dirichlet-L-functional-equation-… | corrected | **Wrong conjugations** (see below). |
| AN.2/classical-zero-free-region | corrected | Thm 8.8's printed region degenerates at Im s = 1 (log 1 = 0), and the proof needs log\|t\| bounded below, so as proved it covers only Im s ≥ t₀ > 1. The acceptance item claimed Remark 7.4 handles the band near the real axis; Remark 7.4 only excludes *real* zeros. |
| AN.3/von-mangoldt-explicit-formula-and-pnt-error | verified | Thm 7.2 with R(x,T), Def. 7.3 and Thms 7.5–7.7 match. Added: the Thm 7.7 proof ignores zeros with small or negative imaginary part. |
| AN.4/adelic-zeta-integral-and-admissible-class | corrected | Z1–Z3 and Def. 4.4.1 match. The draft said Z2 is "precisely" the Riemann–Roch hypothesis; the source says "in view of Z1) and Z2)". The verification locators for the special f were fixed to pp. (4.22) and (4.24). |
| AN.4/riemann-roch-and-lemma-A | corrected | **Error:** "k* discrete and cocompact of covolume 1 in J". The measure of E is κ = 2^{r₁}(2π)^{r₂}hR/(√\|d\| w) (Lemma 4.3.2(2), Cor. 4.3.1, scan p. 48). The value 1 is the *additive* covolume of k in V. |
| AN.4/global-functional-equation-and-class-number-residue | verified | Main Thm 4.4.1 and its proof match scan pp. 50–52. Locator sharpened; the entire-function check now covers every c non-trivial on J. |
| AN.4/local-functional-equation-gamma-factors-and-root-numbers | corrected | Real and p-adic ρ formulas match. **Error:** the p-adic f_n is e^{2πiΛ(ξ)}·1_{𝔡⁻¹𝔭⁻ⁿ}, not "the characteristic function of a suitable coset", and its transform is N𝔡^{+1/2}N𝔭ⁿ·1_{1+𝔭ⁿ}. The draft copied a slip on p. (2.19), which contradicts p. (2.17). Also fixed: \|ρ\| = 1 "exactly on the line"; measures cited to an unread §2.2. The complex ρ was added, and the Gauss-sum cross-check restricted to conductor exponent 1. |
| AN.4/hecke-L-function-euler-product-comparison | verified | Matches scan pp. 57–59, with χ⁻¹(𝔡_𝔭) checked at 300 dpi. Added the character construction (conditions A–C) and the special-f construction with its Z1–Z3 check. |
| AN.4/artin-induction-versus-artin-holomorphy | corrected | The source does not restrict the Langlands–Tunnell solvable case to odd ρ. The draft's Chebotarev proof outline is unsourced; the source says only "by imitating the proof of Dirichlet's theorem", and its Dirichlet theorem (Thm 4.11) gives *Dirichlet* density, whereas Thm 22.5 asserts *natural* density. |

**Dirichlet L-function correction in detail.** The page renders show (6.1.4) with `N^{1/2} c_{χ̄,1}`
and (6.2.2) with `−i τ(χ̄) N^{−1/2}`. The draft, working from the bar-less text layer, had
`c_{χ,1}` and `τ(χ)`. I re-derived both equations from the source's integral representations. With
the source's definition c_{χ,m} = N⁻¹Σχ(l)e^{−2πilm/N}, the correct even equation is
Λ(1−s, χ̄) = τ(χ̄)N^{−1/2}Λ(s,χ). The source has two misprints, both now recorded: `π^{−s}` in
(6.1.4), which should be π^{−s/2}; and the display `τ(χ) = N c_{χ̄,1}`, although N c_{χ̄,1} is the
complex conjugate of τ(χ). The identity c_{χ,1}c_{χ̄,1} = N⁻¹ holds only for even χ.

### Links

Draft links:

* Lemma A/B → Main Thm (scan p. 52): verified.
* Local FE → Hecke comparison (scan pp. 58–59): verified.
* Zero-free region → PNT error (p. 45): verified.
* Hecke comparison → Artin continuation: **annotated as partial supply.** Tate gives continuation, the
  functional equation and the poles. The base case of Thm 22.4 also needs three inputs that neither
  source supplies: Artin inductivity L(Ind σ, s) = L(σ, s), non-vanishing of Hecke L-functions on
  Re s = 1, and the class-field-theory identification.

Links added after verification:

* Admissible class → Lemma A. The Lemma A proof cites Z2 on scan p. 51.
* Main Thm 4.4.1 → Hecke comparison. The comparison takes the continuation and the global
  functional equation from it (scan p. 58).

Supplier scope: FF.1's atlas description (characters and Gauss/Jacobi sums, built on the
finite-field stage FF.0) confirms the draft's under-scoping gap for composite-modulus Gauss sums.
AN.4's atlas source route names KED-CFT; the packet instead uses Tate's thesis and KED-ANT Ch. 22,
and this is recorded.

### Structure, coverage, gaps

The `parentStageId`s AN.1–AN.4 exist and belong to AnalyticNumberTheory, and all ten coverage ids exist.

Coverage changes:

* AN.1: the L(1,χ) ≠ 0 locator was corrected to Thms 3.10–3.11 (the draft said 4.11). The exercise
  boundaries of §§5–6 are recorded.
* AN.2: Lemma 8.3 and Thm 8.7 are now read; their exercises remain. The t₀ range is recorded.
* AN.4: Lemma 3.3.3, Landau's Euler-product convergence ("a keystone of the whole theory",
  Landau, *Algebraische Zahlen*, pp. 55–56), the S-unit rank and the Chebotarev density type added.

Gaps:

* Added: "Zero-free region near Im(s) = 1 and for negative imaginary parts". It is also needed by
  AdditiveCombinatorics:AC.4, whose link annotation was extended accordingly.
* Extended: the class-field-theory gap (inductivity, Hecke non-vanishing on Re s = 1, density type)
  and the κ computation (Lemma 4.3.1 on scan pp. 46–47 unread).

### Unverifiable items

None.

### Supplier questions for the orchestrator

1. Composite-modulus Gauss sums: widen FF.1, or give AN.1 its own Dirichlet-character node? This is
   the draft's recommendation; I confirmed the scope mismatch.
2. Is Chebotarev with natural density (as AN.4's text and Kedlaya Thm 22.5 state) required, or does
   Dirichlet density suffice for consumers? The only argument in the read sources gives Dirichlet
   density.
3. Which stage owns Artin L-function inductivity and the non-vanishing of Hecke L-functions on
   Re s = 1?

---

## 3. ArithmeticStatistics.json

**Review status: accepted.** Nodes: 8 (1 verified, 7 corrected, 0 unverifiable). Draft links: 6
(3 verified, 3 corrected). Links added: 3. Gaps: 5 draft (3 updated).

### Source and provenance

| Source | Fetched from | SHA-256 | Result |
| --- | --- | --- | --- |
| Bhargava–Shankar, *Binary quartic forms having bounded invariants, and the boundedness of the average rank of elliptic curves*, arXiv:1006.1002v3 | `https://arxiv.org/pdf/1006.1002v3` (2026-09-16) | `7670970aca5df135af4ab4da926d3b2e3acc937dd5a6c918f802552c528712cf` | matches; 36 pp.; printed page = PDF page |

I read pp. 1–34 with all proofs. The draft had read §§2.1–2.8 and 3.2–3.5 only at statement
level or not at all.

### Nodes

| Node | Verdict | Finding |
| --- | --- | --- |
| ST.0/invariants-height-and-eligible-pairs | corrected | **H vs H′ constant in the wrong direction.** Since H′ = (27/4)H, the H′-ordering constant is (4/27)^{5/6} times the H-constant. **Stabilizer weights misidentified:** Lemma 2.2 gives GL₂(R)-stabilizers of order 8, 4, 8, which define n₀ = 4, n₁ = 2, n_{2±} = 4 (p. 9); Theorem 1.8's n₂ = 2 lumps the two definite components. Theorem 1.8's sign condition (−1)^iΔ > 0 was missing. (3)–(6) are on p. 7, not p. 6. The proof of Theorem 1.7 (§2.8) was read and added. |
| ST.1/binary-quartic-parametrization-of-two-selmer | corrected | Statements match p. 23 verbatim. **Misattribution:** [16] is Cremona–Stoll and [15] is Cremona–Fisher; the draft wrote "Cremona–Fisher–Stoll [16]" and "Cremona [15]". E(R)[2] has order 2 or 4 by the sign of Δ, not "1, 2 or 4 by the number of real roots". |
| ST.1/embedding-into-pairs-of-ternary-quadratic-forms | corrected | g_α = 4·Det(A₁x − B_αy), not ¼·Det. The g_α are pairwise F_{Z,1}-inequivalent but all GL₂(Z)-equivalent. The 12 bound imports the Thue-equation results of Delone [22] and Evertse [25], which the draft did not name. |
| ST.2/averaging-over-the-fundamental-domain-and-cutting-the-cusp | corrected | **Lemma 2.4 misdescribed** as a reducibility bound; it counts orbits with GL₂(Q)-stabilizer larger than 2. Theorem 2.5 holds for any subset S. The cusp mechanism was restated, and Prop. 2.6 is on p. 12. §§2.1 and 2.4 were read, and their imports recorded ([14], [39], [33]). |
| ST.2/uniformity-estimate-… | corrected | **The proof steps misdescribed the proof.** The quartic-to-ternary embedding handles only the weakly divisible part W_p^{(2)}. The strongly divisible part uses Theorem 2.17, an Ekedahl sieve quoted from [6, Thm 3.3]. Theorem 2.20 also needs the direct count (39), and Theorem 2.13 an O(εX^{5/6}) cusp bound. The proofs of Theorems 2.13, 2.18, 2.20 and 2.21 were read. |
| ST.3/quoted-classical-counts-… | verified | Theorems 1.4 and 1.5 match p. 3. A cross-reference was fixed. |
| ST.4/average-size-of-the-2-selmer-group-is-three | corrected | Theorem 3.1, the proof of Theorem 3.19, Lemma 3.20, (74) and the Tamagawa evaluation match. **False acceptance check:** "a family excluding a positive-density set at infinitely many p is NOT large". The semistable family excludes additive-reduction pairs, a set of positive density contained in {p²\|Δ}, at every p and is large. Lemma 3.20 is imported from [12]. §§3.2–3.5 were read; Theorem 3.17 has no written proof. |
| ST.4/rank-bound-from-the-selmer-average | corrected | The loss check spoke of Selmer groups "of size exactly 3", which is impossible, and conflated the conjectured rank ½ with a Selmer quantity. The check was rewritten. Added: identity (2) presupposes Mordell–Weil. |

### Links

Draft links:

* ST.0 → ST.2: verified; the (6) page was corrected.
* Embedding → uniformity: verified. The embedding is used only for the weakly divisible part (37).
* Uniformity → Selmer average: verified.
* Parametrization → Selmer average: verified; the page was corrected to p. 33.
* Theorem 1.1 → Corollary 1.2: verified.
* `HeightsRationalPointsAndObstructions:RP.1` → rank bound: **corrected.** The draft said the consumer
  "does NOT need finite generation". The rank identity (2) needs Mordell–Weil. RP.1's atlas
  description ("combine finite descent with a height argument to prove finite generation") supplies
  it, so the edge stands with the corrected reason.

Links added after verification:

* Theorem 3.2 (stabilizer) → counting, used in the proofs of Lemmas 2.2 and 2.4 (pp. 20–21). The
  source notes that Theorem 3.2 does not rely on §2.
* Counting → uniformity (proof of Theorem 2.13, p. 18).
* Counting/volumes → Selmer average (p. 33).

### Structure, coverage, gaps

The `parentStageId`s ST.0–ST.4 exist and belong to ArithmeticStatistics, and all six coverage ids
exist. The coverage lists were rebuilt from the full reading. Still unread imports:

* Davenport [17] and Theorem 2.19 [4, Prop. 23].
* Theorem 2.17 [6, Thm 3.3].
* The Thue bound [22]/[25].
* Borel–Harish-Chandra [10] for finiteness.
* Brumer–Kramer [12, Lemma 3.1] and class number one of PGL₂ [35].
* [13, Ch. 3.6], [19, Prop. 1], [36] and [38].

Two statements have no written proof in the source: Prop. 2.8's "Jacobian computation" and
Theorem 3.17.

The Davenport-owner gap was re-run against the atlas. The closest existing owner is
`tauceti:TauCetiRoadmap/GlobalNumberFields` layer 3A (Lipschitz lattice-point counting), but it
covers dilates of a fixed domain, not Davenport's projection bound for skewed regions. The
parametrization gap's next action now names the works actually cited ([15], [16], [7], [9]).

### Unverifiable items

None.

### Supplier questions for the orchestrator

1. Owner for Davenport's semialgebraic lattice-point lemma. GN.1 (Minkowski) is the wrong theorem;
   GlobalNumberFields 3A is the nearest but covers only homothetic dilates.
2. Owner for the cubic Thue-equation bound (≤ 12 solutions; Delone 1930, Evertse 1983), used twice
   in this proof.
3. Should Bhargava's geometric sieve [6] and quartic-ring uniformity [4, Prop. 23] be acquired as
   ST.2 prerequisites?

---

## 4. ClassicalArithmeticCompletion.json

**Review status: accepted.** Nodes: 3 (0 verified, 3 corrected, 0 unverifiable). Links: 1 (corrected).
Gaps: 3 (1 corrected).

### Source and provenance

| Source | Fetched from | SHA-256 | Result |
| --- | --- | --- | --- |
| Shoup, *A Computational Introduction to Number Theory and Algebra*, Version 2 | `https://shoup.net/ntb/ntb-v2.pdf` (2026-09-16) | `8e1abc54f4510c3f274dfbed07ea602a6a439ee24b2c916e61abe829b402ec06` | matches; 598 pp.; printed page = PDF page − 18 |

Read: §2.4 with Exercises 2.14–2.18 (pp. 22–24), Theorems 2.18–2.21 (pp. 36–38), and §12.1 in
full (pp. 342–346).

### Nodes

| Node | Verdict | Finding |
| --- | --- | --- |
| CA.0/chinese-remainder-theorem-with-its-bijection-form | corrected | Theorem 2.6 and the bijection match. **Wrong exercise:** the non-coprime CRT is Exercise 2.18 (two moduli, existence iff a₁ ≡ a₂ mod gcd, no uniqueness), not Exercise 2.16, which concerns linear congruences with coprime moduli. The coverage entry is fixed too. |
| CA.1/legendre-symbol-euler-criterion-and-gauss-lemma | corrected | Statements and Gauss's lemma proof match. **Euler's criterion proof misdescribed:** Shoup computes the product of all units by two pairings (κ↔α/κ and κ↔κ⁻¹), not via the order of α in the cyclic group Z_p^*; cyclicity is not used. |
| CA.1/quadratic-reciprocity-with-the-supplementary-law-at-two | corrected | Theorems 12.3–12.4 with proofs match. **Arithmetic error** in the acceptance check: for (p,q) = (3,5) the exponent is 1·2 = 2, not 1·1, so the example agrees with reciprocity instead of conflicting with it. Also removed the unsourced claim that the real-place residue symbol "corresponds to" (−1\|p); Shoup has no infinite-place symbol. |

### Links

Gauss's lemma → reciprocity: direction and use sites are correct (pp. 344–346). **Reason corrected.**
Combining the two applications of Theorem 12.3 needs no multiplicativity of the symbol. Euler's
criterion enters instead in the last line of the proof of Gauss's lemma.

### Structure, coverage, gaps

The `parentStageId`s CA.0 and CA.1 exist and belong to ClassicalArithmeticCompletion, and all eight
coverage ids exist. The gap title said CA.3 has five consumers; the atlas lists six (ST.1, CA.4,
CA.6, CN.0, FF.0, GN.5), so it was corrected. The gaps on composite-modulus Gauss sums and on the
unread class-field-theory source were confirmed against CA.1's atlas text ("Gauss/Jacobi sums …
higher reciprocity through class field theory. Record residue symbols at 2 and at infinite places").

### Unverifiable items

None.

### Supplier questions for the orchestrator

1. CA.0's acceptance asks for CRT at non-coprime moduli. The only source statement is an unproved
   two-moduli exercise, so a proof source (or an in-house proof) is needed.
2. The infinite-place residue symbols required by CA.1 have no source. Should this be routed through
   the KED-CFT reading shared with AnalyticNumberTheory?

---

## 5. ComputationalNumberTheory.json

**Review status: accepted.** Nodes: 4 (0 verified, 4 corrected, 0 unverifiable). Draft links: 3
(1 verified with reworded reason, 1 corrected, 1 **removed**). Gaps: 4 draft plus 1 added.

### Source and provenance

Shoup, Version 2: the same file as §4 (SHA-256 `8e1abc54…`, matches). Read: §3.2 including the cost
conventions (pp. 53–55); Theorem 3.1; §10.2 with the full proof of Theorem 10.3; §§10.3.1–10.3.2
(Algorithm MR, (10.5)–(10.7), Theorem 10.4, Algorithm MRS); Theorem 19.10; §§20.1, 20.3–20.5
through B1; Ch. 21 through Lemma 21.6.

### Nodes

| Node | Verdict | Finding |
| --- | --- | --- |
| CN.0/ram-machine-model-and-bit-complexity | corrected | The instruction set matches. **Missing and contradicted conventions:** Shoup charges 1 unit per instruction, measures input size in memory cells, and requires stored numbers to be polynomially bounded (pp. 54–55); integers are base-B digit vectors. The draft called unit cost "unrealistic" and said RAM steps and bit operations "differ by an unbounded factor in this model". The magnitude restriction rules that out. |
| CN.1/miller-rabin-probabilistic-primality | corrected | Theorems 10.1–10.3 match. **Theorem 10.4 misdescribed** as "the distribution of the number of tests". It is γ(m,1) ≤ exp[−(1+o(1)) log m·log log log m/log log m], proved by "Literature". Also fixed: the L′_n description missed the α^t = 1 case; Theorem 10.2 was completed ((p_i − 1) \| (n − 1)); the three-case proof of Theorem 10.3 is now recorded. |
| CN.1/aks-deterministic-primality | corrected | Theorems 21.1–21.5 match. The claim that "without step 1 the argument in step 5 can be satisfied by prime powers" is not in the source; step 1 only supplies assumption (A1). Theorem 21.2 imports Chebyshev's bound (Theorem 5.7), which is now named. The checks at n = 2, 3, 9 hold. |
| CN.1/polynomial-factorization-over-finite-fields | corrected | Theorems 20.3–20.10 match. **Berlekamp B1 misrepresented** as "the deterministic alternative": B1 only computes a basis of the Berlekamp subalgebra, and Stage 2 splitting is probabilistic (≥ 1/2 or ≥ 4/9 per split). The EDF analysis is a union bound over pairs plus E[S] = O(r²), not a "coupling argument". **Placement:** finite-field polynomial factorization is FF.3's atlas scope. |

### Links

* CN.0 → AKS: verified. The reason was reworded from "bit-complexity" to the source's RAM-time convention.
* `FiniteFieldsAndCharacterSums:FF.0/irreducible-polynomial-census-and-existence` → factorization:
  verified at the use site (DDF, "easily solved using Theorem 19.10", p. 530). **Reason corrected:**
  the draft called this the node-level content of the atlas edge FF.3 → CN.1, but the supplier is
  an FF.0 node, so the stage projection is a transitive shortcut.
* **Removed:** Miller–Rabin → AKS. The draft itself stated "NOT a mathematical dependency"; it was
  recording a result-type contract. The protocol forbids edges without a supplied output, and both
  nodes' acceptance items already carry the probable-vs-proven distinction.

### Structure, coverage, gaps

The `parentStageId`s CN.0 and CN.1 exist and belong to ComputationalNumberTheory, and all six
coverage ids exist. CN.1's coverage now records the unread internal imports: Theorems 6.32 and 6.37
(used by Theorem 10.3) and 5.7 (used by Theorem 21.2). Theorem 10.4 has no proof in the source.

Gap added: CN.1 decomposes Shoup Ch. 20 while FF.3, whose atlas description is "Prove finite-field
polynomial factorization …", lists the same chapter as unread. This is a duplicate-supplier risk.

### Unverifiable items

None.

### Supplier questions for the orchestrator

1. **Placement:** move the finite-field factorization node to FF.3, keeping a checked-factor
   contract under CN.1, or declare CN.1 the owner and narrow FF.3?
2. The probable-prime vs proven-prime result-type contract is no longer a graph edge. Record it in
   CN.1's stage text if it is wanted.

---

## 6. DiophantineApproximationAndTranscendence.json

**Review status: accepted.** Nodes: 7 (2 verified, 5 corrected, 0 unverifiable). Draft links: 4
(2 verified, 2 **removed**). Gaps: 5 draft plus 1 added.

### Sources and provenance

| Source | Fetched from (2026-09-16) | SHA-256 | Result |
| --- | --- | --- | --- |
| Evertse, *Diophantine Approximation* notes, ch. 1 | `http://pub.math.leidenuniv.nl/~evertsejh/dio19-1.pdf` | `299eabc4…2e23` | matches; PDF created 24 Aug 2025; PDF p. 3 = printed 1 |
| ch. 4 | `…/dio19-4.pdf` | `1d120934…ee54` | matches; created 23 May 2023; printed pp. 63–84 |
| ch. 5 | `…/dio19-5.pdf` | `1f60cf27…e3b5` | matches; created 26 Oct 2023; printed from p. 85 |
| ch. 6 | `…/dio19-6.pdf` | `07430cdb…da97a` | matches; created 6 Oct 2023; printed from p. 107 |
| ch. 7 | `…/dio19-7.pdf` | `8535b816…6610` | matches; created 8 Aug 2023; printed from p. 137 |

The packet's edition label "2019 edition" refers to the course; the files are later regenerations,
now recorded in `readSections`. The packet's Chapter 4 page range "printed pp. 1–20" used PDF page
numbers; it was corrected to printed pp. 63–82.

### Nodes

| Node | Verdict | Finding |
| --- | --- | --- |
| DT.0/dirichlet-approximation-from-minkowski | corrected | Statements and both proofs match (pp. 1–3). **Inverted claim:** "Schmidt's subspace theorem later improves [the exponent 1+1/n] to 1+1/n+δ". Theorem 1.6 (Schmidt 1971, p. 4) shows the opposite for real algebraic αᵢ with {1, α₁, …, αₙ} linearly independent: exponent 1+1/n+δ has only finitely many solutions, so 1+1/n cannot be improved. **False check:** "with Q = 1 the statement is false". Only the Minkowski derivation fails there, since (±1,0) ∈ C₁; the theorem holds trivially. Also added the closed, bounded, 0-interior definition of a convex body, on which the ≥ 2ⁿ form depends. |
| DT.1/liouville-inequality-with-explicit-constant | verified | Theorem 6.1 and the proof via (6.2) match exactly (pp. 107–108). |
| DT.1/thue-approximation-theorem-and-the-auxiliary-polynomial-method | verified | Theorems 6.2 and 6.9, Siegel's Lemma and Lemmas 6.10–6.12 match. The reviewer read Lemma 6.13 and the end of the proof (pp. 121–123): ε = (κ−1−d/2)/((2κ+2)d), (6.21), \|A_{r,k}\| ≤ 2C₂^r H(ξ₁)^{−εdr/2}. The draft's range "pp. 121–127" ran into §6.3. |
| DT.2/subspace-theorem-and-its-exceptional-subspaces | corrected | Theorem 7.1, Corollary 7.2, Lemma 7.3 and the example (7.5) match. **Theorem 7.8 step wrong:** the draft applied Theorem 7.7 "to the d+1 linear forms"; it is one linear form in d+1 variables. The step also omitted the exclusion of the conjugates of α, needed for the strict lower bound 0 < \|F(α)\|. The source misprints "By Theorem 7.8 with n = d+1" for Theorem 7.7; recorded. |
| DT.3/lindemann-weierstrass-in-bakers-form | corrected | Statements match (pp. 64–73). **Reduction step wrong:** the draft attributed the "replace δᵢ by mδᵢ" remark to the reduction 4.11 ⇒ 4.8; it belongs to the proof of Theorem 4.11. The draft also omitted the real argument, that the maximal exponent under the (Re, Im) order is unique, so some δ_k ≠ 0. Lemma 4.15 is Exercise 4.3 with no proof; Lemma 3.6 (ch. 3) is an unread import. Locators changed from PDF to printed pages. |
| DT.3/baker-lower-bounds-for-linear-forms-in-logarithms | corrected | Theorems 5.1, 5.2, 5.4 and 5.16 and Corollaries 5.3, 5.5 match. The Corollary 5.3 derivation now carries the 2k·log(−1) term. **Numerical check mismatched:** (a,b,k) = (2,3,1) was paired with 3² − 2³ = 1, which belongs to (3,2,1). |
| DT.4/effective-finiteness-for-unit-and-thue-equations | corrected | **"Theorem 5.14 read in outline"** is wrong: the source states it "without proof" and works only one example. The unit-equation proof applies Corollary 5.3 to Λ_i at the smallest conjugate of y. Matveev's Theorem 5.4, offered as an alternative, only covers rational aⱼ. Theorem 5.13 (Thue equations, fully proved via Siegel's identity), promised by the node title but missing, was added. Unread imports recorded: the unit theorem is quoted from textbooks; ch. 3 lemmas and exercises; constructive algebraic number theory. |

### Links

* `GeometryOfNumbersAndQuadraticArithmetic:GN.1` → DT.0: verified. GN.1's atlas scope is
  "Blichfeldt and Minkowski first/second theorems … boundary conventions", which matches Theorem 1.3.
* Baker lower bounds → DT.4: verified at the proofs of Theorems 5.12 and 5.13; locator sharpened.
* **Removed:** Liouville → Thue. Thue's proof (Lemmas 6.10–6.13) never uses Liouville's inequality;
  the reason described a "baseline", i.e. context only.
* **Removed:** Lindemann–Weierstrass → Baker. Theorems 4.19 and 5.1–5.4 are stated without proof and
  are not derived from Theorem 4.8. "Context" is not a dependency, and the draft's claim that
  Chapter 4 "establishes" the qualitative statement is false (§4.3 is "without proof").

### Structure, coverage, gaps

All `parentStageId`s exist and belong to DiophantineApproximationAndTranscendence, and all six
coverage ids exist.

Coverage changes:

* DT.1: Theorem 6.14 was mischaracterized as an effective count. It is an effective gap principle.
* DT.3 and DT.4: reading notes updated, with the imports listed above.

Gap added: every DT stage names WALDSCHMIDT and SCHMIDT as its source route, but the packet uses
only Evertse. That is acceptable for what Evertse proves, but the declared route is unread.

### Unverifiable items

None.

### Supplier questions for the orchestrator

1. Accept Evertse as a substitute source for DT.0–DT.4, or require the declared WALDSCHMIDT/SCHMIDT
   route? The Roth, Subspace and Baker proofs remain unread either way.
2. Owner for Dirichlet's unit theorem and constructive computation of fundamental units, which are
   imported by the unit-equation proof.

---

## 7. ExponentialSumsAndCircleMethod.json

**Review status: accepted.** Nodes: 6 (1 verified, 5 corrected, 0 unverifiable). Draft links: 6
(4 verified, 1 corrected, 1 re-pointed). Gaps: 5 draft (1 corrected) plus 1 added.

### Sources and provenance

| Source | Fetched from | SHA-256 | Result |
| --- | --- | --- | --- |
| Bourgain–Demeter–Guth, arXiv:1512.01565v3 | `https://arxiv.org/pdf/1512.01565v3` (2026-09-16) | `5a6b7f66580d3f7db123f4e715aed5ef373cb0c96ee28b226be823cb68759abe` | matches; 39 pp.; printed page = PDF page |
| SGA 4½ [Sommes trig.] (library `Weil_SGA4Half.pdf`) | — | checked in §8 | used here only for the FF.2 → ES.0 link |

I additionally read Prop. 6.2, Lemma 6.3 and Prop. 6.4 with proofs; the statement of Theorem 8.3
and the start of §8.1; the opening of §9 with Theorem 9.1 and the induction base; and every
invocation of Theorem 6.6 in §8.

### Nodes

| Node | Verdict | Finding |
| --- | --- | --- |
| ES.1/analytic-representation-of-the-vinogradov-mean-value | corrected | The identity matches p. 1. **False check:** "the count with only the first n−1 equations is strictly larger". For s ≤ n−1, Newton's identities force permutations, so the counts coincide. An example (s = n = 2) was given where it is strictly larger. |
| ES.2/vinogradov-main-conjecture-all-degrees | corrected | **Degree scope wrong:** "proved here for all n ≥ 2". The source proves Theorem 1.2 only for n ≥ 3 (§§8–9), by induction with base case n = 2 imported from Bourgain–Demeter [7] ("Theorem 1.2 holds true for n = 2, as proved in [7]", p. 17). For n = 2, Theorem 1.1 is only attributed to divisor estimates. ES.2's low-degree acceptance item was rewritten. |
| ES.2/l2-decoupling-for-the-moment-curve | corrected | Statement matches p. 2. Added the n ≥ 3 proof scope and the [7] import. Removed three unsourced claims: a smaller ball fails; decoupling fails above n(n+1); a sharp cutoff breaks (3). |
| ES.2/discrete-restriction-and-well-separated-generalization | corrected | Theorem 4.1 and Corollary 4.2 match pp. 4–5. **False hypothesis:** "for integer Xᵢ and i = n this forces Zₙ = 0". Only \|Zₙ\| ≤ 1 follows, so Theorem 1.1 follows by domination, J_{s,n}(N) ≤ J_{s,n}(S_X), not as an exact special case. |
| ES.2/ball-inflation-and-multilinear-kakeya | corrected | "M^n families" should be M_n = n!. **Hierarchy misidentified:** the thin tubes of Bennett–Carbery–Tao are k = n−1, while k = 1 is the weakest case, used in [9] (pp. 3, 9). The draft's "Theorems 6.2–6.4" are Prop. 6.2, Lemma 6.3 and Prop. 6.4; now read and summarized, including the Brascamp–Lieb stability import [3]. |
| ES.2/epsilon-removal-above-the-critical-exponent | verified | Arcs, (5), (6), the interpolation and (7) match p. 6; [22] is Wooley arXiv:1508.05329. |

### Links

* **Re-pointed:** ES.1 identity → Theorem 1.1 became ES.1 identity → ε-removal. BDG prove Theorem 1.1
  through Corollary 4.2's Schwartz-majorant expansion on Rⁿ, which never uses the torus identity. The
  identity is used in §5, where Theorem 1.1 is read as a bound on ∫|F|^{n(n+1)}.
* Decoupling → Theorem 4.1: verified.
* Corollary 4.2 → Theorem 1.1: verified; the reason now says "domination".
* Ball inflation → decoupling: verified; the locator now cites the actual invocations on pp. 18, 20,
  22, 29, 30.
* Theorem 1.1 → ε-removal: verified.
* `FiniteFieldsAndCharacterSums:FF.2/multivariable-polynomial-exponential-sum-bound` → ES.0: scope
  matches ES.0's atlas text ("connect to finite-field character-sum producers and explicit
  derivative/degree bounds"); the supplier node is reviewed in §8.

### Structure, coverage, gaps

All `parentStageId`s and coverage ids exist. The degree-scope gap was corrected. The ES.2 coverage
now lists two unread imports: the [7] base case and the Bennett–Bez–Flock–Lee stability result [3].
A gap was added for both.

### Unverifiable items

None.

### Supplier questions for the orchestrator

1. ES.2's acceptance ("do not cite a degree-greater-than-three source for unproved low-degree
   cases") is **not** met for n = 2 by BDG. Acquire Bourgain–Demeter, Annals 182 (2015), or a
   divisor-function proof as the n = 2 source.
2. The draft's EXT-08 handoff claim "BDG's Theorem 1.1 is stated and proved for all n ≥ 2" is
   incorrect and should not be propagated.

---

## 8. FiniteFieldsAndCharacterSums.json

**Review status: accepted.** Nodes: 13 (8 verified, 5 corrected, 0 unverifiable). Draft links: 7
(5 verified, 1 re-pointed and corrected, 1 annotated as partial supply). Links added: 9.
Gaps: 6 draft (1 extended).

### Sources and provenance

| Source | Provenance | SHA-256 | Result |
| --- | --- | --- | --- |
| SGA 4½, [Sommes trig.] | library `papers/Weil_SGA4Half.pdf` | `fb2939521f4c0ea0cdd55a90bec2e618e32fb433c78b194e705c6d989f4e42a6` | matches; exposé p. n = vol. p. n+167 = PDF p. n+206; read from the extraction, with renders of vol. pp. 172, 190, 198 |
| Shoup, Version 2, Ch. 19 | re-fetched from `https://shoup.net/ntb/ntb-v2.pdf` | `8e1abc54…ec06` | matches |
| Deligne, *Weil II* | re-fetched from Numdam; also library `papers/SS_WeilII.pdf` | `b06eea61…cc71` | matches both; the source is not cited by any node or link |

### Nodes

| Node | Verdict | Finding |
| --- | --- | --- |
| FF.0/irreducible-polynomial-census-and-existence | verified | Theorems 19.1–19.4 and 19.9–19.11 match; Theorem 19.12 added as the positivity statement. |
| FF.0/frobenius-automorphism-and-exact-order | corrected | Theorems 19.7–19.9 match. **Two false acceptance items.** (1) "σ(α) = α with α outside the prime field is impossible by Thm 19.8": false when F ≠ Z_p. (2) The absolute/relative exponent example was self-inconsistent. |
| FF.0/subfield-lattice-and-uniqueness-up-to-F-isomorphism | verified | Theorems 19.13–19.14 match. |
| FF.0/norm-and-trace-surjectivity | verified | Theorems 19.15–19.18 match. |
| FF.1/lang-torsor-character-sheaves | verified | 1.2–1.7, Scholie 1.9 and Remarque 1.9.4 match; (1.5.1) F* = g ↦ gγ⁻¹ checked on the render. |
| FF.1/gauss-sum-cohomological-realization | verified | (4.1.1) and Props 4.2–4.3 match. |
| FF.1/gauss-sum-absolute-value-by-duality | verified | Remarque 4.4 matches. |
| FF.1/etale-algebra-gauss-sums-and-hasse-davenport-shape | corrected | **Misread special case.** The render of vol. p. 198 reads "pour k = F_q^N, et χ un caractère de F_q^*". This is the *split* algebra, of which F_{q^N} is a twisted form. The draft had k = F_{q^N} with χ on F_{q^N}^*, where χ∘N_{k/F_q} is undefined. Statement, step and excerpt corrected. |
| FF.2/modified-pole-order-and-artin-schreier-normalization | verified | Matches vol. pp. 190–191. The draft's printed misstatement "ψ(a^p − a) = 0 … Cette somme est nulle" is confirmed on the render. |
| FF.2/one-variable-artin-schreier-weil-bound | corrected | (3.5.2)–(3.5.5), the Serre citation, 3.2.1 and 3.4 match. U₀ is where f ≠ ∞ ("l'ouvert où f ≠ ∞"), not where v*ₓ(f) = 0. |
| FF.2/kloosterman-rank-two-and-eigenvalue-pairing | corrected | 3.6 and Exemple 3.7 match. The p = 2 check called the hypothesis f∘σ = −f "vacuous"; for p = 2 it reads f∘σ = f. |
| FF.2/multivariable-polynomial-exponential-sum-bound | corrected | Prop. 3.8 and Lemme 3.9 match. **Counting error in the summation:** the exceptional hyperplane S₁ = λ has q^{n−2} points (bound q each, total q^{n−1}), not "q^{n−1} tuples". |
| FF.1/euler-poincare-with-swan-conductors | verified | (3.2.1) matches vol. p. 189; import status correct. |

### Links

* **Re-pointed and corrected:** FF.0 norm/trace → Lang torsor became FF.0 norm/trace → étale-algebra
  Gauss sums. Trace surjectivity is needed so that ψ∘Tr_{k_i/F_q} is non-trivial in (4.5.3). The
  draft's claim that (1.7.7) needs norm surjectivity is false: (1.7.7) comes from N L(q^n) = L(q).
* Lang torsor → one-variable bound: verified (Exemple 3.5 a) uses 1.7.6 and 1.3).
* Euler–Poincaré → Gauss sums: verified (proof of Prop. 4.3).
* Euler–Poincaré → one-variable bound: verified (sentence after (3.5.5)).
* `DeligneWeightsAndPurity:DWP.7` → one-variable bound: verified. DWP.7's atlas text includes "for
  smooth X and lisse pure F the image of H^i_c → H^i is pure of weight w+i"; the residual curve step
  is already a gap.
* `WeilConjectures:WC.3` → one-variable bound: **annotated as partial supply.** WC.3's atlas scope is
  all-conjugates RH for integral factors of a variety's zeta function (constant coefficients).
  Applying it to j_*L(ψf) needs a transfer through the Artin–Schreier covering (ψ-isotypic part),
  which is neither in WC.3's scope nor read.
* FF.2 → `ExponentialSumsAndCircleMethod:ES.0`: verified.

Links added after verification:

1. Frobenius → census (proof of 19.10).
2. Census → uniqueness (proof of 19.14).
3. Frobenius → norm/trace (§19.4).
4. Lang torsor → Gauss sums (4.1, "d'après le paragraphe 1").
5. Gauss sums → modulus (Remarque 4.4 uses 4.2).
6. Gauss sums → étale-algebra sums ((4.5.3) is built from (4.1.1)).
7. Modified pole order → one-variable bound.
8. One-variable bound → Kloosterman (3.6–3.7).
9. One-variable bound → Prop. 3.8 (both cases cite 3.5.2).

### Structure, coverage, gaps

All `parentStageId`s and coverage ids exist. Coverage FF.3 now notes that the ComputationalNumberTheory
packet decomposed Shoup Ch. 20 under CN.1, although this is FF.3's atlas scope. The gap on
H¹(X̄, j_*L) was extended with the WC.3 partial-supply note. The union of all EXT-08 and EXT-16
links with the atlas `stageEdges` is acyclic (checked after this packet).

### Unverifiable items

None.

### Supplier questions for the orchestrator

1. Owner for the Grothendieck–Ogg–Shafarevich formula; the draft's request stands, and no stage owns it.
2. Weight input for Artin–Schreier sheaves on curves. Either extend WC.3 to twisted coefficients or
   route through DWP.7, which additionally needs H¹(X̄, j_*L) = im(H¹_c → H¹).
3. Placement of finite-field polynomial factorization: FF.3 or CN.1 (see §5).

## 9. ModularSymbolsPadicLFunctions.json

**Review status: accepted.** Nodes: 7 (1 verified, 6 corrected, 0 unverifiable). Draft links: 4
(2 verified, 1 verified with an annotation, 1 removed). Links added: 5. Gaps: 7 draft (6 corrected
or extended), 6 added.

### Sources and provenance

| Source | Provenance | SHA-256 | Result |
| --- | --- | --- | --- |
| Rodrigues Jacinto–Williams, arXiv:2309.15692v2 | library `papers/KI_RJW_PadicLFunctions_v2.pdf` | `efa1e101…c039c4` | matches; PDF page = printed page; Theorem B.1 checked on a render of p. 80 |
| Pollack–Stevens, *Critical slope p-adic L-functions* (author PDF) | library `papers/KI_PollackStevens_CriticalSlope.pdf` | `b0ca4fa8…360430` | matches; 24 printed pages (edition field said 23); (2) and Theorem 8.1 checked on a render of p. 21 |
| Bellaïche, arXiv:0912.2925v1 | library `papers/KI_Bellaiche_CriticalPadicL.pdf` | `0a1c068c…701032` | matches; (4)–(5) checked on a render of p. 8 |
| Amice–Vélu, Astérisque 24–25 | library `papers/KI_AmiceVelu_HeckeDistributions.pdf` | `badff36a…69169c` | matches; PDF p. 2 = printed p. 119; pp. 119–120 and 125–129 read from renders |

No sources were fetched.

### Nodes

| Node | Verdict | Finding |
| --- | --- | --- |
| L0/modular-symbols-as-compactly-supported-cohomology | verified | Sec. 2.1–2.2 match, including the example "whenever N ≥ 4" and [2] = Ash–Stevens. Added r ≥ 0 for twists, and reworded an acceptance item that assumed failure at small level. |
| L1/period-normalized-interpolation-formula-two-printed-conventions | corrected | **Misread formula.** The render of RJW p. 80 shows L_p^an(f, χ̄, j+1) and L(f, χ̄, j+1). The text layer drops the bars, so the packet's claim that RJW and Pollack–Stevens use different twists was false. The authored Gauss-sum reconciliation left out (−1)^j and RJW's minus sign; the residual is −χ(−1)(−1)^j·2πi, which can be absorbed into the periods only if the sign is indexed by χ(−1)(−1)^j. Also added: the n = 0 Euler-factor disagreement, the parity tension in Bellaïche (4), and the fact that RJW's G(χ) is defined only for n ≥ 1. The Amice–Vélu domain is X(Z*_Δ), not X(Z_p^×). |
| L2/refinements-and-the-two-euler-factors | corrected | The statement dropped the condition that f_α, f_β are **U_p-eigenforms**; without it the two forms are not singled out. The α/β reading of Bellaïche (5) is confirmed from the render and now backed by an explicit computation from L(f_β,s) = (1 − αp^{−s})L(f,s) and αβ = ε(p)p^{k+1}. |
| L2/stevens-control-theorem-for-small-slope | corrected | **False claim about the source.** The packet said Pollack–Stevens do not reproduce the proof. In fact Sec. 5.2 proves it as Theorem 5.4, via Lemma 5.1 (with Lemma 5.2), Prop. 4.8, Lemma 5.3, and Lemma 4.9(2) with the norm bound p^{−(k+1)}. Steps and acceptance items were rewritten to follow that proof; Prop. 3.3 is the D†-level kernel. |
| L3/theta-operator-criterion-for-the-critical-slope-lift | corrected | Theorem 8.1 and Remarks 8.2–8.3 match the render. **Missing hypothesis:** Theorem 6.7 also assumes Γ₀ has no elements of order p. The exact sequence was traced to Lemma 5.1, Prop. 4.8 and Lemma 6.4 (Lemma 6.4 needs generalized eigenspaces, Remark 6.5). |
| L3/bellaiche-eigencurve-construction-and-theta-critical-vanishing | corrected | **Wrong derivation.** Theorem 1(iii) is equivalent to f_β being *critical*, not θ-critical. For Eisenstein series θ-critical means critical slope, so "Theorem 2 follows from (iii)" fails there. Also: the secondary L-functions' interpolation properties assume f cuspidal (omitted), and Bellaïche's D[r] (r = 1/p) and ι = diag(1,−1) differ from Pollack–Stevens' conventions. The log^{[k]} index misprint and the exceptional divisor are now noted. |
| L4/three-constructions-and-the-main-conjecture-for-a-modular-form | corrected | B.2–B.4 and the attributions ([Kat04a] = Astérisque 295, [SU14], [Del98], [RJ18]) match. An acceptance item required "a measure exactly when v_p(α_p) = 0", but RJW state only one direction. |

### Links

* L0 → control theorem: verified. The reason was sharpened: the torsion hypothesis is automatic for
  Q_p-vector-space coefficients, while Sec. 6 separately assumes Γ₀ has no elements of order p.
* Control theorem → θ criterion: verified; locator extended to Lemma 5.1, Prop. 4.8 and Lemma 6.4.
* θ criterion → Bellaïche: verified and annotated. Bellaïche actually consumes Pollack–Stevens:
  pp. 7–8 identify his L-function with theirs in the non-θ-critical case and cite them for (4).
* `PadicMeasuresIwasawaAlgebras:L3/pseudo-measures-and-evaluation-at-nontrivial-characters` → L1:
  **removed.** The supplier supplies (3.11), the evaluation of a *pseudo-measure* at a *nontrivial*
  character. The L1 node integrates χ(x)x^j against a locally analytic distribution, including
  trivial χ. The link's own reason conceded that the pseudo-measure theory is not consumed.

Links added after verification (all follow existing atlas stage order):

1. `DirichletPadicLFunctions:L0` → L1: Gauss sums. **Partial:** the stage names Gauss sums, their
   nonvanishing and the inversion formula, but not G(χ)G(χ⁻¹) = χ(−1)pⁿ.
2. `LocallyAnalyticDistributions:L4` → control theorem (slope decompositions, Lemma 5.3).
3. `LocallyAnalyticDistributions:L2` → θ criterion ((k+1)-admissibility and non-uniqueness).
4. `LocallyAnalyticDistributions:L2` → L4 (order zero = measures, one direction).
5. `PadicFamilies:L3` → Bellaïche (eigencurve smoothness and local structure; see the ownership gap).

### Structure, coverage, gaps

All `parentStageId`s and coverage ids exist. Coverage corrections:

* **L1:** Amice–Vélu p. 120 *does* quote the algebraicity theorem (Théorème I, attributed to Manin,
  with parity-selected periods and the integrality statement for D^k Q_k^ε(x)). The packet said
  Amice–Vélu mention algebraicity only through the functional equation and attributed it to Shimura.
* **L2:** the proof of the control theorem is in Pollack–Stevens Sec. 5.
* **L3:** records which proofs were read in review.

Gap corrections:

* Bellaïche's published venue is Invent. Math. 189 (2012), per RJW [Bel12], not Ann. Sci. ENS.
* In the Bellaïche gap, "Euler factors vanish" for ramified φ now reads "reduce to 1".
* The Amice–Vélu gap now assigns the euclidean-division estimate to Prop. IV.1.
* The unverified section pointer "MTT Sec. I" was removed.

Gaps added:

1. The atlas L1 transcription of B.1 lacks the bar on χ.
2. The printed sources disagree on the Euler factor at n = 0 (RJW vs Pollack–Stevens (2) and
   Amice–Vélu III(a)). A reviewer computation from the U_p-eigen relation supports RJW.
3. The parity condition in Bellaïche (4) conflicts with his p. 7 support statement and with
   Amice–Vélu (1).
4. Imported results in the Pollack–Stevens proofs, with locators.
5. Record of the removed pseudo-measure link, and the question whether L1 needs
   `LocallyAnalyticDistributions:L2`.
6. Ownership overlap between `PadicFamilies:L3` and this roadmap's L3.

The union of all EXT-08 and EXT-16 links with atlas `stageEdges` remains acyclic.

### Unverifiable items

None at node level. The following were not verified:

* The Mellin formula linking moments to L(f, j+1)/Ω.
* Amice–Vélu Sec. II.1 notation.
* The published versions of Pollack–Stevens and Bellaïche. Pollack–Stevens [15], [18], [19],
  Ash–Stevens, Manin and MTT are not in the library.

### Supplier questions for the orchestrator

1. Correct the RJW B.1 formula quoted in the atlas description of `ModularSymbolsPadicLFunctions:L1`
   to L(f, χ̄, j+1).
2. L1/L2 ordering of the newform comparison. The roadmap summary ("the good-prime p-stabilization
   comparison is a separate result") favours keeping L1 at fixed level.
3. Should stage L1 require `LocallyAnalyticDistributions:L2`? Otherwise B.1's growth and uniqueness
   clauses should move to an L2 node.
4. Who owns the Pollack–Stevens and Bellaïche critical-slope proofs: `PadicFamilies:L3` or
   `ModularSymbolsPadicLFunctions:L3`?
5. Does `DirichletPadicLFunctions:L0` include G(χ)G(χ⁻¹) = χ(−1)pⁿ?

## 10. NoncommutativeAndEquivariantIwasawa.json

**Review status: accepted.** Nodes: 8 (3 verified, 5 corrected, 0 unverifiable). Draft links: 7
(3 verified with locator fixes, 3 annotated, 1 removed). Links added: 3. Gaps: 6 draft (5 corrected or
extended, the sign-convention gap retitled), 3 added.

### Sources and provenance

None of these papers is in the library; a catalogue scan for Coates, Fukaya, Venjakob, Sujatha, Kakde,
Ritter and Weiss finds only unrelated Dasgupta–Kakde records and a file-less Coates–Sujatha book.
All four were re-fetched into scratch on 2026-09-16:

| Source | Fetched from | SHA-256 | Result |
| --- | --- | --- | --- |
| Coates–Fukaya–Kato–Sujatha–Venjakob | `https://arxiv.org/pdf/math/0404297v1` | `a46184ea4221c87e134c0955d0d539e4246e8fcebe0e42321623f5732d3c8a71` | matches; 39 pp.; PDF page = printed page |
| Kakde | `https://arxiv.org/pdf/1008.0142v3` | `5a05da0d58f2717422fb401510d9cad4aeeac707313929a796870b92e27ea45c` | matches; 92 pp. |
| Burns–Venjakob | `https://arxiv.org/pdf/math/0511672v2` | `4b33fb11251340c88a8f8a590d9f9296a413aadf4fae98968ea7191a14c857bc` | matches; 38 pp. |
| Ritter–Weiss (not a packet source entry) | `https://arxiv.org/pdf/1004.2578` | `48811a99c75f3b826f2315cc914563ffab1dd98381fd0af141816e05b99f2dee` | matches the hash recorded in the gaps; not read, as in the draft |

Unconfirmed bibliographic details were annotated:

* CFKSV volume and pages: Kakde confirms only "Publ. Math. IHES, 2005".
* The Documenta publication of Burns–Venjakob.
* The Fukaya–Kato AMS Translations volume: Kakde gives vol. 12 (2006), Burns–Venjakob vol. 11 (2005).
* Burns's J. reine angew. Math. reference: Kakde cites a "Preliminary version, 2010".

### Nodes

| Node | Verdict | Finding |
| --- | --- | --- |
| NE.0/completed-group-rings-and-the-standing-group-hypotheses | verified | Matches CFKSV p. 3 (the draft said p. 2). The claim that non-pro-p J gives a non-local ring is marked as authored. |
| NE.1/canonical-ore-set-and-its-characterizations | corrected | Lemmas 2.1–2.2 and Prop. 2.3 match pp. 3–5 (locators were one page early). **False acceptance item:** "for G = Z_p, S is the set of nonzero elements". In fact p ∉ S (CFKSV p. 7), S = {f : μ(f) = 0}, and S* is the set of nonzero elements. A valid test for nontrivial H was substituted. |
| NE.1/ore-property-non-zero-divisors-and-the-nilradical-characterization | verified | Theorem 2.4 (p. 5, not p. 4), Lemma 2.5 and Prop. 2.6 match. Noted CFKSV's citation slip "2.2(iii)" for 2.2(iv) and the imported McConnell–Robson facts. |
| NE.2/localization-sequence-surjectivity-and-characteristic-elements | corrected | **Overclaim.** The draft said surjectivity of ∂ *requires* that G have no element of order p. Kakde Lemma 5 (p. 8) proves surjectivity onto the relative K₀ for every G "by the same technique". Also: (24) is itself stated under CFKSV's hypothesis, and the Prop. 3.4 proof summary omitted λ₃, λ₄ and (32). Locators pp. 9/11/21 corrected to pp. 10/12/22. |
| NE.3/evaluation-at-representations-akashi-series-and-euler-characteristics | corrected | **Misquoted hypothesis.** Theorem 3.8's condition (51) ranges over open subgroups H′ *of H* normal in G, not all open normal subgroups. The evaluation now carries the localization at ker φ and the ∞ convention. Recorded the imported inputs of Theorem 3.6: (44) from Coates–Schneider–Sujatha, and Bourbaki's norm relation. |
| NE.5/cfksv-interpolation-contract-and-main-conjecture | corrected | **Missing assumptions.** CFKSV state Conjecture 5.7 only after assuming analytic continuation of L(E,ρ,s) at s = 1 and Deligne's period conjecture (103). Also added the definitions of R (primes with ord_q(j_E) < 0, plus p), f_ρ, u, w and the ε-factor conventions. Locators p. 34 corrected to p. 35. |
| NE.6/kakde-main-conjecture-for-totally-real-fields | verified | Definitions 1 and 8, Lemma 9, the complex C, Theorem 11 and Remarks 12–14 match. Completed Remark 12's list of sources and its history (Ritter–Weiss for dimension one, Burns for the general case). Noted that CFKSV prove the Ore property only for Z_p coefficients, while Kakde uses O coefficients. |
| NE.7/leading-terms-via-bockstein-homomorphisms | corrected | Quotes match pp. 1–3. **Wrong use of a paraphrase:** Burns–Venjakob's summary of CFKSV omits ordinarity and p ≥ 5, so it cannot check completeness of NE.0 and NE.5. A step implied that the Sec. 3 Bockstein definition had been recorded, but Sec. 3 was not read. |

### Links

* NE.0 → NE.1, NE.1 (Ore) → NE.2, NE.1 → NE.3: verified; locators fixed.
* NE.2 → NE.5: verified and annotated. "L_E is a characteristic element" is meaningful by definition;
  surjectivity supplies ξ_E for Corollary 5.9.
* NE.3 → NE.6: annotated. Deducing uniqueness in K₁′ from Remark 12 also needs the twisting identity
  (94) and Weierstrass preparation, because Kakde interpolates at ρκ^r. Kakde's own uniqueness argument
  is in the proof of Theorem 21.
* NE.5 → NE.7: annotated as **partial**. The vanishing sentence concerns the Fukaya–Kato formula, and
  Burns–Venjakob's use of CFKSV is in Secs. 3.4–3.5 and 6.9, which were not read.
* `SelmerIwasawaCohomology:L2/selmer-complex-…` → NE.7: **removed.** Burns–Venjakob cite Nekovář's
  Selmer complexes only in Sec. 1 and Sec. 6.2, not in Sec. 3 where leading terms are defined, and the
  atlas has no such edge. Recorded as a gap.

Links added (all follow existing atlas stage order):

1. NE.3 → NE.5: the evaluation convention, and Theorems 3.6 and 3.8 used for Corollaries 5.9–5.10.
2. NE.1 (Ore) → NE.6: Kakde Sec. 2.1 takes S and its Ore property from CFKSV. **Partial:** O
   coefficients versus Z_p.
3. NE.2 → NE.6: Kakde's Lemma 5 reuses the proof technique of CFKSV Prop. 3.4.

### Structure, coverage, gaps

All `parentStageId`s and coverage ids exist. Coverage was updated for NE.2 (CFKSV [28] is Swan only;
the proofs of Prop. 3.4 and Theorem 4.4 were read in review, with their imports), NE.3, NE.5
(bibliographic note) and NE.6 (Kakde Secs. 2.2–4.1 read in review).

**Main gap correction.** The draft's "sign conventions disagree" gap is retitled. Both boundary maps
send a denominator element to the class of its cokernel: CFKSV p. 24 has ∂(f(a)) = [Coker α], and
Kakde p. 7 has [(P, s⁻¹a, Q)] ↦ [Q/a(P)] − [Q/Qs]. Kakde's minus sign comes from the complex
C(F∞/F), which has X in degree −1 and Z_p in degree 0. His abelian Theorem 16 derives ∂ζ = −[C] from
Wiles's theorem, where it reads [X] − [Z_p]. What remains open is the unwritten degree convention for
complexes and the passages S ↔ S* and module ↔ complex.

Gaps added:

1. Consolidated imported results in the CFKSV proofs: McConnell–Robson, Brumer, Serre, Swan,
   Vaserstein, Bass, NSW, Bourbaki, Coates–Schneider–Sujatha.
2. The K-theory localization sequence for **non-central** Ore sets is not supplied by
   `GeneralAlgebraicKTheory:K.5/relative-K-theory-and-excision-boundary`, which covers central
   multiplicative sets only (Weibel V.2.6.3), nor by the K.6 Schlichting node.
3. The removed Selmer-complex link.

### Unverifiable items

None at node level. Not verified:

* Fukaya–Kato (not obtained).
* Burns's SK₁ paper.
* Ritter–Weiss (fetched, not read).
* Burns–Venjakob Secs. 3–6.
* CFKSV's numerical example, only partly read.
* The degree convention in Kakde's relative K₀ of complexes.

### Supplier questions for the orchestrator

1. Which K-theory stage proves the localization sequence and explicit boundary map for a non-central
   Ore set of non-zero divisors? The K.5/K.6 nodes do not.
2. NE.4 needs a source for the equivariant complex. Kakde defers perfectness and base change of
   C(F∞/F) to Fukaya–Kato.
3. Should Ritter–Weiss (already fetched) be read before NE.3/NE.6 are extended? The stage demands a
   source-by-source uniqueness table.

## 11. PadicMeasuresIwasawaAlgebras.json

**Review status: accepted.** Nodes: 25 (17 verified, 8 corrected, 0 unverifiable). Draft links: 8
(4 verified, 2 annotated, 2 removed). Links added: 11. Gaps: 7 draft (3 extended), 2 added. One node
re-parented (L4 → L5).

### Sources and provenance

| Source | Provenance | SHA-256 | Result |
| --- | --- | --- | --- |
| Rodrigues Jacinto–Williams v2 | library `papers/KI_RJW_PadicLFunctions_v2.pdf` | `efa1e101…c039c4` | matches; §3, §13.1, App. A.1 re-read; render of p. 20 |
| Colmez, *Fonctions d'une variable p-adique* | library `papers/KI_Colmez_PadicVariable.pdf` | `452cae8f…23f5ffa` | matches; PDF p. = printed p. − 11; renders of pp. 16–17 |

No sources were fetched. Catalogue claims in coverage and gaps were checked: Washington, Coates–Sujatha
and NSW have records without files; BGR has only a bibliography pointer; Buzzard and Emerton are
present; BSS II v1 is present.

### Nodes

| Node | Verdict | Finding |
| --- | --- | --- |
| L0/orthonormal-basis-criterion… | verified | Prop. I.1.5 matches. v′_B uses the integer part (render), not the ceiling. One value-group example reworded. |
| L0/strong-and-weak-topologies… | corrected | **Overstated completeness.** Weak completeness of B* is only *sequential* (Banach–Steinhaus). The stage forbids asserting unrestricted weak completeness, and for spherically complete L the weak completion is the algebraic dual. Added x ≠ 0 to v*. |
| L0/bounded-measures… | verified | Matches. Noted that RJW Remark 3.9 ("any subset X") is too broad (1/x on Z_p ∖ {0}); the node's compact restriction had been wrongly attributed to RJW. |
| L0/locally-constant-density… | verified | Remarks 3.11–3.12 match. |
| L0/dual-of-c0… | verified | Prop. I.1.6 and Remark I.1.7 match. |
| L0/completed-tensor… | verified | Prop. I.1.8 and Cor. I.1.9 match. Annotated an acceptance item that conflated the Banach completed tensor with the compact one needed for Λ(G×H). |
| L0a/weight-space… | verified | Remark 3.47 matches. Amice's theorem is an import (gap); the simple-pole clause is L3 content (placement gap). |
| L1/measures-are-the-completed-group-algebra | verified | Props. 3.15 (over Z) and 3.16 match. |
| L1/convolution… | corrected | The density step cited Colmez II.4.1 beyond its scope: that result covers distributions on Z_p, and the weak topology on D_r only for r > 0, not measures on a general profinite G. |
| L1/units-measures… | verified | Cor. 3.32 and Remark 3.33 match. Placement note: the ψ-criterion is L2 content. |
| L2/mahler… | verified | Colmez I.2.1–I.2.5 and RJW 3.21–3.22 match. |
| L2/amice-transform… | verified | Thm. 3.25 and its proof match. Recorded that Λ(Z_p) ≅ O_L[[T]] is only asserted ("one may check"). Reworded one acceptance item. |
| L2/moment-operator… | corrected | **Misread formula.** RJW p. 20 and Colmez p. 46 print A_{z^x μ}(T) = A_μ((1+T)z − 1). The node had A_μ((1+T)^z − 1), which is the σ_z formula. Its own proof step derived the correct formula, and its acceptance item recorded an unresolved mismatch. Statement, excerpt, step and acceptance item fixed. |
| L2/restriction… | verified | (3.5), (3.6) and Colmez II.4.3 match. |
| L2/phi-psi… | verified | (3.7)–(3.9) and Colmez II.4.5 match. |
| L2/two-topologies… | verified | Remark 3.28(3) matches; noted that it is asserted without proof. |
| L3/pseudo-measures… | corrected | The Remark 3.35 critique is correct. The acceptance item allowed a zero divisor as a denominator. Replaced by a non-zero-divisor example: s = [1+p] − [1] with χ the Teichmüller character (χ(s) = 0, moments (1+p)^k − 1 ≠ 0). |
| L3/moment-vanishing… | corrected | **Slip in RJW, repeated in the node.** Lemma 3.36(iii) needs a ≠ ±1, not just a ≠ 1: [−1] − [1] is a zero divisor, and (3.11) with g = −1 fails for even k. |
| L3/principal-augmentation-ideal-for-odd-p | verified | Lemma 3.38 and the odd-p first line match. |
| L4/weierstrass… | verified | Step 1 and (A.1) match; the BGR gap stands. |
| L4/structure-theorem… | verified | §13.1 matches. |
| L4/iwasawa-growth-formula… | verified | Prop. A.10 and Lemma A.11 match. |
| **L5**/topological-nakayama… (was L4) | corrected | Lemma A.7 and Prop. A.8 match. Re-parented to L5, which the atlas assigns "topological Nakayama". The id changed; no other file referenced the old id. |
| L5/control-of-coinvariants… | corrected | Lemma A.9 matches. Added the finiteness of Y/φ_n(T)Y, without which the compared orders are infinite. |
| L5/cyclotomic-specialization… | corrected | **Missing hypothesis.** Props. A.5–A.6 match, but RJW assume that F has exactly one prime above p (Remark A.4(2)); with several primes all inertia groups must be quotiented. Restored. |

### Links

* Orthonormal criterion → Mahler: **removed.** Colmez proves Mahler directly; Prop. I.1.5 is unused
  and needs discretely valued L.
* Cyclotomic specialization → control lemma: **removed.** It is not a proof input; both results feed
  Theorem A.3, which has no node.
* c₀-dual → Amice: verified (RJW makes the argument inline).
* Density → Prop. 3.16: verified.
* ψ → Lemma 3.36: verified.
* Weierstrass → growth: verified.
* Principal ideal → weight space: annotated. It creates an L3 → L0a stage dependency that the atlas
  lacks, and `LocallyAnalyticDistributions:L3` owns the pseudo-measure/meromorphic statement.
* Nakayama → control: annotated as a setup dependency; source id updated after re-parenting.

Added links (verified from the proofs):

1. Bounded measures → density.
2. Prop. 3.16 → convolution.
3. Mahler → Amice.
4. Prop. 3.16 → Amice.
5. Amice → moment operator.
6. Moment operator → restriction.
7. Restriction → φ/ψ.
8. Amice → two topologies.
9. Dual topologies → two topologies.
10. Pseudo-measures → Lemma 3.36.
11. Structure theorem → control lemma.

### Structure, coverage, gaps

All `parentStageId`s and coverage ids exist.

Coverage notes added:

* L0: weak compactness for Z_p via Remark 3.28(3), asserted only.
* L1: placement, and the scope of Dirac density.
* L2: unproved identifications.
* L5: the Nakayama move, and that Theorem A.3 is not decomposed.

Gaps extended:

* Weierstrass/BGR: catalogue wording.
* Determinant: Burns–Sano I *uses* det of perfect complexes but does not construct it, and Burns–Venjakob
  §2.1 states the determinant functor's properties.
* Weak compactness: sequential completeness only; the Z_p comparison is asserted in Remark 3.28(3).

Gaps added:

1. Placement: the ψ-criterion in L1 and the simple-pole clause in L0a.
2. The removed links.

The union graph remains acyclic.

### Unverifiable items

None at node level. Not proved in any source read:

* Amice's theorem.
* Weierstrass division in general.
* The structure theorem.
* Coates–Sujatha A.1.
* Λ(Z_p) ≅ O_L[[T]] and the topology comparison (both "one may check").
* The full proof of Lemma A.9.
* Determinant functors.

### Supplier questions for the orchestrator

1. Move the image-of-ι (ψ = 0) clause from L1 to an L2 node, and the pseudo-measure simple-pole clause
   from L0a to L3 or `LocallyAnalyticDistributions:L3`, or accept the new stage dependencies.
2. Confirm re-parenting the Nakayama node to L5.
3. Source choice for determinant lines (L5): Knudsen–Mumford, Fukaya–Kato §1, or Burns–Venjakob §2.1
   as a statement-level interim source.
