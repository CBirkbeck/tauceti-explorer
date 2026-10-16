# Independent package review, round 2: heights, rational points and obstructions

**Verdict: accepted.** This verdict counts the corrections made in this review. Items 1–6 of the job hold: upstream form, fidelity to the plan, own words, no process language, `Suggested.lean` shape and elaboration, and metadata. Nothing that blocks a draft pull request remains. The last section lists four upstream coordination points for the maintainer. They concern other roadmaps' open TauCetiRoadmap pull requests, not defects of this package.

Reviewer: Claude (Opus 5.5), session claude-mKJkHb, as `independent-review-REV-PKG-HeightsRationalPointsAndObstructions~2`, on 2026-10-16. Two kinds of Sonnet subagent did mechanical cross-checks: supplier citations against supplier READMEs, and a section-by-section loss inventory against the first-reviewed text. Every finding they reported was checked here before any edit. Two Codex sessions wrote the package, codex-1FFBrj (first package) and codex-YFUI73 (revision, PR #10000). Codex session codex-9s58xl wrote the first review. This reviewer took no part in any of these.

## What the revision had to do

The first review returned the package for 17 closure gaps. The revision answered them with 79 new lettered subsections: owned proof adapters, named supplier contracts and scope narrowings. It also compressed the first-reviewed README from 378 KB to 285 KB. This review therefore (a) read every subsection, with the new ones read in full, (b) checked that no target, hypothesis or Check was lost in the compression, and restored what was, (c) cross-checked every supplier citation, (d) re-ran the duplication check against TauCetiRoadmap as it is today, (e) checked locators in the new material against the sources, and (f) re-checked the Lean file.

## Checks and results

| Check | Method | Result |
| --- | --- | --- |
| Targets preserved | Section diff keyed on numbers against the first-reviewed README (23624944f) | All 139 original numbered targets are present (titles shortened). The new §1.0 and the lettered subsections are additions. |
| Compression losses | Sonnet inventory of items in the old text absent from the new, 236 rows (46 hypotheses, 39 Checks, 24 API items, 55 locators, 72 dependencies), each row read here | 37 substantive items restored (list below). The remaining rows are merged duplicates, secondary locators replaced by primary ones, or dependencies covered by the supplier-contract section. |
| Supplier citations | 205 citation rows, 220 items, checked against the current supplier READMEs: TauCetiRoadmap main and the open roadmap pull requests | 192 found, 25 partial, 2 in the wrong section, 1 missing. Every non-found row was verified and corrected. |
| Duplication | Current TauCetiRoadmap main, read from GitHub on 2026-10-16, plus all 21 main roadmaps absent from the local checkout. The local checkout at 0d144d04 is a PR branch, not main. Also current Tau Ceti a91d3aaf and the open foundation PR EtaleCohomologyFoundations #938 | Three duplicates removed (below). Two overlaps with open PRs are recorded for the maintainer. |
| Locators | 21 public sources downloaded to scratch; each cited label tested on its cited page by script, with pages read where needed; labels of Cao 2020, Demarche, Harari–Skorobogatov and Gillet–Soulé spot-checked | Bombieri, Pink–Rössler and Fontaine citations corrected (below). Poonen, BGW, Lieblich, de Jong, Voloch, Halpern-Leistner, Colliot-Thélène–Skorobogatov (2019 text), SUZ, Zhang 1998, Poonen *Division group*, Billingsley, Abbes–Bouche, Poonen–Stoll, Rémond *Décompte* and the Stacks tags matched. |
| Rendering | GitHub-flavoured CommonMark rendered with markdown-it | 62 pullback asterisks produced spurious italics (`π*e*L`), and one underscore did too. They are now escaped, so only the intended italics remain. 824 missing spaces after prose commas were inserted outside code, links and brackets, a whitespace-only change verified by a space-stripped diff. |
| Lean | `lean-check` before and after; a `run_cmd` audit of every `TauCetiRoadmap.*` constant; declaration names against the README | Before: exit 0, 41 `sorry` warnings, 317 lines. After: exit 0, 36 `sorry` warnings and no other output, 297 lines. The audit covers 61 constants and finds no `sorry` in any type and none in any definition body. Every Lean declaration is named in the README. |
| Intake | `python3 research/blueprint/intake.py check-files` on the deliverables | 0 problems. `metadata.toml` is `topic = "math.NT"`. |

## Corrections made

**Duplicates of current upstream roadmaps (removed and cited instead).**
- **HeightsAndUnits** (TauCetiRoadmap main, merged 2026-10-14). Its §1.1 owns `instNorthcottProjectivizationLogHeight` and `instNorthcottProjectivizationMulHeight`, and its §0.1 owns `Height.mulHeightAff` with `mulHeight₁_le_mulHeightAff`. The package's §0.14 restated fixed-field projective Northcott, and its Lean file stated it as `northcott_projectivization`. That claim is now cited. §0.14 keeps only the bounded-degree absolute variant, proved from HU's coordinate bound and DA §0.3. §0.13 cites HU for its lower bound. The Lean theorem is deleted. HU is added to Scope, the supplier contracts and the Layer 0 dependencies.
- **AffineMorseLefschetz** (main, merged 2026-10-16). Its §A5 owns weak Lefschetz for hyperplane sections: H_j(X,A;ℤ)=0 and π_j(X,A)=0 below dim X. The revision's §2.25a re-planned the same relative-cell theorem by Morse theory. That subsection is deleted. The former §2.25b is now §2.25a and applies §A5 in a Veronese re-embedding. References were renumbered.
- **EtaleCohomologyFoundations** (the de-cycling foundation PR #938, which the lower suppliers IG and CC already cite). Its §0.10 `ClassicalAlgebraic.smoothBoundaryPurity` with the §0.9 classes is smooth-pair purity over any field, with invertible coefficients. The revision's §2.16a reproved it in characteristic zero by complex comparison. It is now imported. §2.16a keeps only the owned vanishing range H^j_W=0 for j<2c on arbitrary supports of codimension≥c. §2.25a notes its overlap with ECF §F.7 weak Lefschetz.

**Supplier citations.**
- "EtaleBaseChange 4", "ComplexComparison 8,10" and "CohomologicalPointCounting" named layers of the external TauCetiRoadmap PR #196 without identifying it. They are replaced by ECF §§F.2.2 and F.2.6 (smooth base change, Künneth), ECF §F.0.2 (fundamental groupoid), CC §§C6.2–C6.3 (Riemann existence, Artin comparison) and IG.2.5 (Lang–Weil).
- DA's Roth lemma is in §1.5, not §2.8. IG's Lang–Weil estimate is in IG.2.5, not Layer 4. "IG Layer 6" became ECF §F.0.2. "CC C3.2" became C1.3. "AM 7.10" became AM 3.4.
- Picard-space separatedness is CC §C3.2d.3 `relative_picard_separated`. Serre generation is AM §1.2 `serreGeneration`, not SF. Tame inertia is LocalFieldsRamification Layer 3, not ProfiniteCohomology. Krasner and Hensel are native Mathlib. The Weil pairings are AS A3.5 and A3.7.
- "period = index" had no supplier. It is now sourced to Poonen Theorem 1.5.36(iii)–(iv), p.26, resting on CFT Layers 5 and 10 and AGD R02.4.5b (Grunwald–Wang).
- JacobianChallenge supplies Abel–Jacobi for a pointed curve. The closed immersion is one of its acceptance criteria; no degree-one-class hypothesis was ever part of it. The contract now says so.
- "Projective fans" were not supplied by ReductiveGroups. They now come from AnalyticToricGeometry (toric varieties of finite regular rational fans), and the Galois-stable fan choice is part of the adapter.
- AGD's "two-term torus-complex duality" does not exist. The citation is now AGD R02.4.6 and D7.5, with the two-term form marked as the adapter.
- "Hilbert–Chow" and "moduli point" had no AM supplier. They became AM §§1.6, 2.1 and 4.9. The redundant "stable moduli point" sentence in §4.9b, which had no supplier, is removed: the preceding steps already put the equations over the constants.
- The Stacks citation in §1.9a is Lemmas 59.69.1–3 (tag 03RN, "Picard groups of curves") together with SF Kummer theory. It is not an SF section.

**Locators and source facts.**
- Bombieri, *The Mordell conjecture revisited*. The sections are Arabic-numbered: §6 is the lower bound, §7 derivatives, §8 Siegel, §9 Roth, §10 the proof. §5.10b cited "Lemmas 6–8 pp.627–633"; the lower bound at an admissible pair is Lemmas 3–4 (pp.623–626) with Lemma 6 (p.628). §5.10c cited "Lemmas 1–4 pp.618–625"; the small section is Lemma 7, §8 (pp.629–632), and the Vojta divisor is §3. §5.10d cited "Lemma 9/§V", but no Lemma 9 exists; the passage is §9, Roth's Lemma (pp.632–636) and Lemma 8 (pp.636–637). §5.12 cited "§VI pp.638–640"; it is §10, pp.637–640. The 1991 erratum, p.473, was read. It supports the README's D(0,z)≠0 exclusion and its effectivity remark.
- Pink–Rössler. §§5.6–5.6d cited the ICM 2002 paper (pp.539–546) for "Lemmas 3.1–2" and "Proposition 2.2", which do not exist; the paper has Theorem 3.1, Lemma 3.2, Theorems 2.2 and 2.4, and Lemmas 2.5–2.6. That paper also proves Manin–Mumford by two primes and Serre's ramification theorem. The README's route (a p-adic embedding of a finitely generated field, Boxall's displacement lemma, unramified formal torsion) is Roessler's *A note on the Manin–Mumford conjecture* (arXiv math/0409083): Proposition 6, Proposition 3, Theorems 4–5 and §2. Each subsection now cites the source of its own step, and the reference is added. §5.7–5.7c cited nonexistent "Theorems 2.1, 4.1" and "Propositions 8.1–5, 8.7–8" of the 2004 paper. They now cite Theorems 3.1, 3.6, 3.7, 8.5 and 8.8, Lemmas 8.2 and 8.7, and Proposition 8.3, at author-version pages.
- Fontaine, *Groupes p-divisibles sur les corps locaux*. §5.7a called his convention "covariant". Fontaine's M(G)=Hom(G,CW_k) is contravariant, an anti-equivalence (introduction, Théorème 1), and M(G)/FM(G) is the cotangent space (III §4, p.143). The text is corrected; the README's formulas were already the contravariant ones.

**Hypotheses, Checks and API restored from the first-reviewed text.**
- §2.9: `pairing_end` requires P finite projective of positive rank. §5.2: the degree bound requires X irreducible and L very ample; adds `add_stabilizer` and the disconnected stabilizer of B∪(t+B).
- §5.3: algebraically closed base; adds the translate-of-a-proper-subvariety non-example.
- §5.8: the uniform Manin–Mumford statement is restored with its finite set 𝓜 of abelian subvarieties and bound D, which the revision had reduced to "bounds numbers/degrees".
- §§5.10–5.12: smooth projective genus≥2 curves over number fields, with the names `vojta_inequality` and `mumford_gap` and the O(log T) count. §5.19: the definition of a generic sequence, geometric integrality and Galois orbits over the field of definition.
- §0.26: P, 2P≠O. §0.30: l≥1. §5.17: the function-field reading. §2.13: "smooth conic". §2.15: separated finite-type schemes over a number field.
- Discriminating Checks restored. §1.3: the Sha controls the first review had added (zero abelian variety; y²=−(x⁴+1) has no real point; BGW Theorem 10 with g=1 gives nonzero Sha). Also §1.12, §1.14, §2.5 (ℚ[t]/(t²−2) at p≡±3 mod 8), §2.11, §2.22, §3.3, §3.7, §5.4, §5.5, §5.7, §5.13, §5.15, §5.16, §5.18, §6.5 and §0.26.
- API items restored: `kummer_mem_selmerGroup`, `selmerGroup_baseChange`, `selmerGroup_elliptic`, `HasFiniteRank.of_fg`, Ueno-locus monotonicity and `isTorsionCoset_iff_eq_torsionEnvelope`.

**Form.** Removed process language ("higher-tier", "the missing counting inputs"). Removed the claims that the later Arakelov roadmap "imports" §§5.17a–g and that AdelicAlgebraicGroups is a downstream consumer: it is a lower roadmap and does not cite this one. Fixed §0.9's description of normalized versus genuine absolute values, the "height −1" Check in §0.24, a garbled phrase in §1.9b and seven duplicated *Needs* lines.

**Suggested.lean.**
- `northcott_projectivization` deleted (HeightsAndUnits §1.1).
- `faltingsZhang` renamed `differenceMap`, as in README §5.14.
- 29 arithmetic-only `example`s removed (`(2 : ℝ) * 1 * 3 = 6` and the like). They tested no declaration of the file or the libraries.
- `HeightClass.pullback` added: a real-bodied definition via `Submodule.mapQ`, `LinearMap.funLeft` and `IsBigO.comp_tendsto`, with an `rfl` example and a constant-map example.
- README names aligned for `discrete_closed_diagonal`, `logHeight_linearChange_bounded`, `tateLimit_unique`, `ellipticUnhalvedPolarization`, `finiteRank_iff_le_divisionHull`, `AbelianVariety.Points` and `AbelianVariety.torsion`. The README now records that the Lean `finite_quotient_nsmul` is the number-field case of §1.6.

## Adversarial mathematics pass

These rows record what this review recomputed or tested. The first review's 139-row table and the revision's 218-row table cover the rest; this pass concentrates on the revision's new material and on the conventions.

| Statement | Instances tried | Result |
| --- | --- | --- |
| §0.6–0.8 Northcott transfers | h=n, g=n+(−1)^n, C=1; reversed comparison with g=0 | Correct direction; the reversal fails as stated. |
| §0.9–0.10 place normalizations | ℝ⊂ℂ, ℂ⊂ℂ and p-adic local degrees; t on ℙ¹; q/x² on ℙ² | Exponent [K′_w:K_v]e_v/e_w gives genuine archimedean and normalized finite values (wording fixed); weighted orders 2−2=0. |
| §0.11, §0.13, §0.14 heights | h_ℚ([√2:1])=½log2; h(Re x), h(Im x)≤2h(x)+2log2; orbit d(d−1); ℙ¹(ℚ) points of height≤log2 | ½log2; bound and orbit count hold; eight points, four of height zero. |
| §0.20 Tate limit | Telescoping partial sum d^{−M}f(φ^M s); tail C d^{−M}/(d−1); id with d=2, f=1; successor with d=1 | All as stated; Tau Ceti `canonicalHeight` is ½lim h(2ⁿP)/4ⁿ, so f=naiveHeight/2 is right. |
| §0.21 | y²=x³−2, P=(3,5) | x(2P)=129/100, so log129≠log81. |
| §0.23 | Tau Ceti `neronTatePairing` = `QuadraticMap.associated'` | b=2·pairing and b(P,P)=2ĥ(P). |
| §0.25 | θ↦αθ | Scaling |α|^{−1/(q−1)}; local height +log|α|/3 at q=4. |
| §0.26 | Silverman versus Müller–Stoll local heights | ν(2P)=4ν(P)−log|ψ₂|; the Silverman form adds log|Δ|/4. P, 2P≠O added. |
| §0.28–0.29 | Constant Segre family | Errors ĥ−h−h_S and −3h_S(s). |
| §0.29a | Pic separatedness for geometrically integral fibres (CC §C3.2d.3) | A generically zero section is zero on a reduced integral base; the kernel theorem applies. |
| §1.1–1.2 | E(ℚ) for y²=x³−x; F_q Lang | (0,0)∉2E(ℚ); |E(K_v)/2|=|E(K_v)[2]| at odd p. |
| §1.5, §1.15 | H¹(G_{ℚ,S},E[2]) for S={2,∞}; reality and 2-adic exclusions; Kummer images of the four points | 16 triples; 8 survive reality; images (1,1,1), (−1,−1,1), (1,2,2), (−1,−2,2). |
| §1.13 | x⁶−2 over ℚ(√2) | (x³−√2)(x³+√2) is a Galois-stable odd partition. |
| §1.14 | δ₂(E[2](ℚ)) for y²=x³−x | Order four; E[4](ℚ)=E[2](ℚ). |
| §1.16–1.18 | nr−e·v_p(n)>r for n≥2; −2 at p=2; unramified quadratic ℚ₂; E mod 3 | Needs strict r>e/(p−1); index 16; four points inject. |
| §1.19 | y²=x³−x via E′ | Image {1, −1}. |
| §2.6b | Real 2-sphere tangent module | Stably free, rank 2=d, not free, so cancellation needs rank>d. Nilpotence argument for [P]−rank P checked over ℚ. |
| §2.6d | Degeneracy codimension (n+1)r^{n+1} versus r^{n+1} | Codimension n r^{n+1}+1; weights 1 and n+1≡1 mod n. |
| §2.8, §2.12 | (−1,p)_p for p≡3 mod 4; (t,−1) over ℝ | 1/2; sign-dependent evaluation. |
| §2.16a (now imported) | (A²,0), (A²∖0) | H² preserved, H³ not; n=1 gives zero. |
| §2.16b | (t,−1) pulled back along t=u² | Residues doubled and the class killed. |
| §2.20a | Cubic surface; H¹(K,Pic) by inflation–restriction | Pic rank 7; H¹(K,Pic)=H¹(G,Pic) is finite. |
| §2.20b–c | Lang–Weil counting when L′=L; C=ℤ/3 | Fibres cannot all split; 1/3+1/3+1/3=0. |
| §2.24 | ℚ(i), q=3,7, S={2,∞}; q=−1 | Rows vanish and columns fail; then the reverse. Hilbert symbols recomputed. |
| §2.25 | HS spectral sequence with Pic X̄=ℤ·O(1) descended | Br k≅Br X without a point; dim≥3 needed. |
| §3.3 | Squaring on G_m/ℚ | Selmer set is all of ℚ×/ℚ×², infinite. |
| §3.3a | Counting proper subfields over 𝔽_q | Dimension count ([E:k]/2)·deg D beats finitely many subspaces; Artin–Schreier unbounded conductor. |
| §3.3b | Sha¹ of G_m; simply connected groups over totally imaginary fields | 0; trivial. |
| §3.8f | SL₂/ℝ fundamental versus split torus; −w₀σ blocks; Sha²(T_sc) cokernel; H¹(S₃,𝔽₂²); Hamilton reduced norm | H²=0 versus ℤ/2; sign and pair blocks; cokernel 0; 0; real ab⁰ not onto. |
| §3.8f coflasque | H¹(H,N) from P^H→M^H onto; H³(k,N) | Coflasque; equal to the real H¹, which vanishes. |
| §3.13 | 1/3+2/3 and 1/3−2/3 | 0 and 2/3. |
| §3.17b–d | ℤ/p² characters; genus-one Br=BrauerPic0 | Detection as stated; Tsen and NS=ℤ. |
| §3.18b–c | dim V=n(n+1); local masses at g=1; τ(SL_n/μ₂) by the character index; realEffectiveFraction(4,1) and (4,3); local quotient (2c)c²/((2c)(2c)c) | Exponent n+1; 1/2 and 2; 2; 1/2 and 1; 1/2. |
| §3.19 | y²=(x²+1)(x⁴+1); X=2(w+1)/x², Y=4(w+1)/x³ | Eight points; the parametrization satisfies Y²=X³−4X; Jacobian of 2w²=x⁴+1 is y²=x³−x. |
| §4.4 | Genera for g=2 | g₁=17; 2g_P−2=2^{2g}(4g−3)=80, so g_P=41. |
| §4.7a | Σ_i c_iv and Σ_v max c_iv | 0 and ≤1 with λ=1+ε/(2n). |
| §4.8 | u+v=1 in ℤ[1/2]× | Exactly three pairs. |
| §4.9 | f(t)y²=f(x) at x=t^{q^n}; y²=x^p−t | Infinitely many points on an isotrivial curve; geometric genus 0. |
| §5.4a, §5.4c | Maximum of (d−e+1)(e−h+1); diagonal and antidiagonal in E² | (d−h+2)²/4; 2·2·2=4·2, N=|E[2]|=4. |
| §5.6b | Boxall (Roessler Proposition 3) | Exact hypotheses A[p]⊂A(L), p>2 confirmed in the source. |
| §5.9c | Siu inequality in dimension one | deg M−t deg N. |
| §5.10e–5.11 | V² for (2,2,1,2); cosine √(g+a)/g; (1+r²)/(2gr) on [1,2) | 4; <3/4; ≤5/8 with margin 1/8. |
| §5.13b | y²=x³−t²x+t² at t=2 | (0,2)=2·(2,2), so specialization is not injective there. |
| §5.17c–d | r=n^{−5/12}; norm scaling; constant shift of I | nr²→∞ and nr³→0; +6 in both examples; normalized height +1. |
| §5.17f | e₁≥h≥Σe_i/(d+1) | Zhang's form with the (d+1)deg normalization. |
| §6.5 | Vojta on ℙ¹ with D={0,∞}, x=2^m, S={2,∞} | Proximity 2m·log2, canonical term −2m·log2; sign reversal fails for ε<2 (restored). |

## Points for the maintainer (not defects of this package)

1. **ArakelovGeometryAndAbelianHeights, TauCetiRoadmap PR #1000.** Its upstream README restates this package's Weil machinery. §1.13 constructs `Height.weilClass` (Pic(X)→functions modulo bounded functions) with the ample lower bound and bounded-degree Northcott; this is §§0.17–0.19 here. Its §1.12 metrized point heights overlap §0.24, and its §1.8 ĈH¹ is the codimension-one case of §5.17a. The atlas package of that roadmap imports these from Layer 0 here, but the upstream PR does not. This roadmap is the lower one in the tier order, so #1000 should cite it once both are upstream.
2. **CrystallineCohomology, PR #857, §CR.4.7.** It owns the Dieudonné–Manin slope decomposition on Mathlib's isocrystal carrier. §5.7b here states the same decomposition, adds commuting-isogeny weights, and now says so. The two roadmaps share tier 9 but sit in different bundles, so the tier rule keeps the ownership here. If the merge order puts #857 first, §5.7b can cite it and keep only the weights. FiniteFlatGroupsAndIntegralPadicHodgeTheory #879 (§R07.2.16) also states Dieudonné modules; that PR is higher in the tier order than this roadmap.
3. **Issue template size.** The revision job's issue still asked for a 50–200 KB README. That conflicts with the binding 2026-10-12 shape rule, and it explains the over-compression repaired above. The template should be updated.
4. **Style.** API lists still use slash abbreviations such as `pullback_mk/id/comp`. They are unambiguous in context, but an upstream reviewer may ask for them to be written out. Secondary locators dropped by the compression, where a primary source replaced them, were not restored.

## Validation

- `lean-check research/blueprint/packages/HeightsRationalPointsAndObstructions/Suggested.lean`: exit 0, 36 warnings, all `declaration uses sorry`, 297 lines. The shared pinned build is Mathlib 082e2d37e8 with Tau Ceti f790474. No language server was started and nothing was left running.
- `run_cmd` audit on a scratch copy with examples renamed to theorems: 61 constants, no `sorry` in any type or definition body.
- `python3 research/blueprint/intake.py check-files` on README.md, Suggested.lean, metadata.toml, review.json and this report: 0 problems.
- The packet was not edited.
