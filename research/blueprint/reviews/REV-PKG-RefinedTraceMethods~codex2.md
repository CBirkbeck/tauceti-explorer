# REV-PKG-RefinedTraceMethods~codex2

Independent review by Claude (Opus 5.5), session **claude-xDeQ5l**, 20 October 2026. Refs #11325. The input package is the one left by FIX-PKG-RefinedTraceMethods~adv2 (#11324, session claude-dWptNm), which marked itself accepted; that mark does not count. The previous independent review, REV-PKG-RefinedTraceMethods~codex, returned needs_changes. I did not write or fix any version of this package.

**Verdict: accepted, with the fixes below applied.** The four findings of the previous review are closed by stated, correctly sourced targets. This review found and fixed three further defects that the earlier rounds missed.

- **Duplication.** 45 targets duplicated planned or merged roadmaps lower in the build order. Most were in Layers 8–9; the rest were finite-group Tate, circle Tate, the Tate diagonal and Bousfield localization.
- **Gaps.** Two theorems were assigned to a non-existent owner, "the henselian Part II". The genuine-equivariant inputs that KTheoryFiniteLocalFields §§5.16–5.17 need had no owner.
- **Wrong supplier locators.** Several StableHomotopyKTheory, EnhancedDerivedSheaves, GeneralizedCohomology and KTheoryLowDegrees section ranges were wrong.

All three are fixed in place. The README now has 204 targets: 243 − 45 removed + 2 removals reversed as variants + 4 added. They carry 95 Checks blocks with 327 Checks, at least three in each block. `lean-check` exits 0 with only the four `sorry` warnings.

## 1. The previous review's four findings

| Finding | Closing target(s) | What I verified | Status |
| --- | --- | --- | --- |
| 1. Habiro, K₂ and low-degree suppliers unlocated | Supplier contracts cite HabiroRings HR.1, HR.2 (with its section on spherical coefficients and the solid comparison), HR.5 and HR.6; HabiroCohomologyFoundations §§2.4–2.7, 3.12, 3.15–3.16, 3.20–3.29, 4.1, 4.4, 4.9, 4.12, 4.17–4.20, 4.23, 4.25–4.28 and 5.26; K2SymbolsBrauer §§13.1, 13.7, 13.12–13.13; KTheoryLowDegrees §§3.2–3.7 and 13.2–13.4. π₀TR=W is a theorem of §2.14. Bökstedt periodicity is §2.7. | A section-by-section cross-check against each supplier README: every cited section exists and says what is claimed. HCF §4.28 states that no RTM statement enters it, and HCF Layers 1–5 never cite RTM. K2SymbolsBrauer, KTheoryLowDegrees and GeneralAlgebraicKTheory do not cite RTM. One correction: only KTheoryLowDegrees §13.3 identifies K₂ with π₂ of the plus construction; §§13.2–13.4 compare the relative boundaries. The README now says exactly that. | Closed |
| 2. K of arbitrary small stable ∞-categories | §4.9: *Connective K-theory of small stable ∞-categories*; *Nonconnective K-theory by the suspension construction* | BGT v4 read: Def. 7.1, Lemma 7.3, Rem. 7.4 (p. 44); Thm 7.8 (p. 47); Cor. 7.9, Prop. 7.10 (p. 48); Def. 9.1, Lemma 9.4, Prop. 9.5 (p. 57); Def. 9.6, Lemma 9.7, Thm 9.8 (p. 58); the closing citation of Schlichting §7 Lemma 6 for all filtered colimits (p. 63); Prop. 9.32, Rem. 9.33 (p. 64). I recomputed the Checks: idempotent completion for k×k (K₀=ℤ diagonal inside ℤ²); the ω versus uncountable swindle; the regular-ring vanishing of negative IK. | Closed |
| 3. Chromatic input for j | §6.8 *The K(1)-local sphere and its Adams fixed points*; §5.1 ψ^{−1} | R-Gal: Prop. 5.3.1 with proof (p. 23); §5.5.1, §5.5.2 (p. 32). L_{K(1)}=L_{KU/p}=(L_{KU}−)^∧_p is §5.5.1. I recomputed: v_p(r^{(p−1)k}−1)=1+v_p(k) for a primitive root r mod p²; r=10 fails at p=3 (π₃ would be ℤ/9); d₃(u²)=a³; π₁J₂ of order 4; π₀j=ℤ₂⊕ℤ/2 at 2; β₁ dies in j. The Bousfield-localization target was itself a duplicate (§2 below) and now cites BordismFormalGroups §F6.1. | Closed |
| 4. Syntomic K-sheaf | §4.17 *Henselian rigidity of the trace with finite coefficients*; §8.7, formerly §8.12, *Syntomic complexes from sheafified even K-groups* | CMM: Thm A, Thm 1.4 (p. 3); Def. 1.1 (p. 2, corrected from 3); Cor. 4.35 (p. 35, corrected from 36); Thm 4.36 and Rem. 4.37 (p. 36); Rem. 4.39 (p. 37); Thm 6.1 (p. 50); Cor. 6.9 (p. 53). CMM uses connective K, as the target does. BMS2 arXiv: Thm 7.15, Prop. 7.16 (p. 50); Prop. 7.17, Conj. 7.18, Rem. 7.19 (p. 51); Lemma 8.19 (p. 65); Prop. 8.20, Cor. 8.21 (p. 66); Cor. 8.23 (p. 67). BS: Thm 14.1, Cor. 14.2 (p. 97). Each step of the stated proof was re-derived: QRSP ⇒ henselian along p with semiperfect reduction; the two-degree window; discreteness kills sheafified odd groups; universal coefficients after exact sheafification. All Checks were recomputed (𝔽_p twist, K₁(ℤ_p;ℤ_p)≅ℤ_p, −1∈K₁(ℤ₂)[2], Spec ℤ outside the domain). The "Proof inputs" paragraph still described the old scope (weights 0 and 1 only); it now states the proven scope. | Closed |

On the remaining generality question in finding 4: the K-theoretic description on every p-quasisyntomic scheme, as announced in Bhatt–Mathew Example 1.6, has no published proof. The README states the theorem on the full p-complete quasisyntomic site, in every weight and with every coefficient ℤ/pⁿ, and names the non-complete statement as announced but unproved. I accept this. It restricts nothing that is proved in the literature.

## 2. Duplication removed (new finding)

The previous review compared the package with TauCetiRoadmap main at `0d144d0`. Main has since moved to `5753fe0`. It now contains **BordismFormalGroups** (merged 18 October), **NoncommutativeGeometry**, **DerivedModuleAlgebra** and others.

Separately, AInfCohomology, PrismaticCohomology (Parts I–III) and CohomologyComparisons are in the Caraiani–Newton 94. Their upstream pull requests are #1044, #1057/#1065/#1070 and #1064. This roadmap is outside the 94, so they precede it. The AInfCohomology package handoff records "38 targets moved down" into AI.7.2, including circle Tate, cyclotomic THH and Bökstedt periodicity. The upstream CohomologyComparisons PR (§3.7, l. 53) now imports the spectral trace from AInfCohomology §AI.7.2 and the graded square from PrismaticCohomologyPartIII §7.0. The package author had instead treated "AI.7 and PR.7" as consumers of this roadmap, which reverses the build order. Under WORKERS.md ("the notion moves down … the higher roadmap imports it") and PACKAGE_REVIEW.md ("a target that exists there is removed and cited instead"), these targets are removed here and cited. I compared every removed target by statement, not by name, against the upstream PR branches. Where this roadmap was strictly more general, the target is kept as a variant with one clause saying how it differs.

| Removed target (old §) | Now cited as |
| --- | --- |
| The norm map and the Tate construction (2.2); Tate constructions vanish on induced objects (2.3); Multiplicativity of the Tate construction (2.3) | BordismFormalGroups §F6.5 (finite-group Borel norm, Tate cofiber, induced ideal, lax symmetric monoidal Tate with `can`, residual quotient actions); the residual C_p⊂T form is AInfCohomology §AI.7.2 |
| The Tate orbit lemma (2.4) | AInfCohomology §AI.7.2 (`AInf.Trace.tateOrbit`) |
| The circle norm and the T-Tate construction (2.5) | AI.7.2, *Circle actions, homotopy fixed points and Tate constructions* |
| Iterated Tate constructions for bounded below spectra (2.5) | AI.7.2, `AInf.Trace.completedTateComparison` |
| The Tate diagonal (2.7) | AI.7.2, *Spectral Tate diagonal* |
| Bousfield localization of spectra (6.8) | BordismFormalGroups §F6.1. Its K(1) content (`kOneLocalization` and two Checks) moved into the K(1)-local sphere target. |
| THH of a perfectoid ring; Perfectoid TC⁻ and TP with can and Frobenius; TC⁻/v and TP/φ(ξ) (8.2) | AI.7.2, *Bökstedt periodicity* (perfectoid clause) and *Perfectoid trace coefficient calculation* |
| The five targets of 8.4 (even THH on QRSP covers, trace Nygaard filtration on covers, the trace Nygaard complex, Frobenius factorization, non-Nygaard-completed extension) | AI.7.2, *Quasisyntomic unfolding of the trace coefficient sheaf*; PrismaticCohomologyPartIII §7.0 (noncompleted comparison) |
| The five targets of 8.5 (BMS2 motivic filtrations, invertibility lemma, trace Breuil–Kisin twist, agreement with the BMS1 twist, filtered can/Frobenius/TC fiber) | PrismaticCohomologyPartIII §7.0 (`gradedTCMinus`, `gradedTP`, `gradedTC`, `gradedTC_can_phi`, twist compatibility); AInfCohomology AI.0:integral (`AInf.bkTwist`) |
| The three targets of 8.6 (root group algebra, crystalline comparison, Segal in characteristic p) | AI.7.2, *Characteristic-p trace and crystalline comparison* (BMS2 Thm 8.17, Cor. 8.18) |
| The three targets of 8.7 and five of 8.8 (root ideals, almost décalage, almost elements, animated AΩ, almost map, completed freeness, Cartier/Bockstein recognition, honest comparison) | AI.7.2, *Absolute trace comparison with AΩ* (BMS2 Thm 9.6; these are its proof steps) |
| The three targets of 8.9 (trace-to-prismatic, graded BMS2 comparison, syntomic complexes as graded TC) | PrismaticCohomologyPartIII §7.0 |
| THH of 𝕊[z], relative THH over 𝕊[z], two base changes, relative DVR coefficients, relative evenness (8.11) | AI.7.2's five relative-trace targets |
| Polynomial extension of the graded trace (9.5); graded Beilinson square, AMMN Thm 6.17 (9.6); filtered trace interface (9.7) | PrismaticCohomologyPartIII §7.0 (*Prismatic Beilinson square*, with the `gradedBeilinsonSquare` aliases recorded by CohomologyComparisons §3.7) |

Kept as variants, each with its one-clause difference:

- §2.1, *Spectra with an action of a group* and *Homotopy orbits and homotopy fixed points*: arbitrary topological groups, where F6.5 covers finite groups.
- §2.7, *THH of an E₁-ring* and *The cyclotomic Frobenius*: E₁-rings, where AI.7.2 covers connective E∞-rings.
- §2.7, *Bökstedt periodicity*: now only the free E₁ refinement (Krause–Nikolaus) and the cyclotomic identification. Its Dyer–Lashof input is cited from AI.7.2.
- §8.1, *Even HH on quasiregular covers* and *HC⁻/HP from derived de Rham*: over any quasisyntomic base R (BMS2 §5.2), where Part III works relative to ℤ. These two were first removed and then reinstated as variants.
- §9.4, *The Beilinson fibre square (AMMN Cor. 3.9)*: associative rings, where Part III covers commutative rings.

Sections 8.4–8.7, 8.9 and 9.5–9.7 became empty and were deleted. 8.8→8.4, 8.10→8.5, 8.11→8.6, 8.12→8.7 and 8.13→8.8 were renumbered. All 656 internal "§k.n (title)" references resolve. No other atlas package cites this roadmap's §8/§9 numbers; HabiroCohomologyFoundations cites "§§6.9–6.13 and 8.13", which is now 8.8 in the scope paragraph.

**An error removed with the duplicates.** Old §8.11 *The relative DVR coefficient calculation* had a monic Eisenstein E with can(u)=Eσ and φ(u)=σ. At K=ℚ_p, E=z−p, the residue specialization then gives can(ū)=−pσ̄ and φ(ū)=σ̄. Matching TC⁻(𝔽_p)→TP(𝔽_p) forces 2c=0 for a unit c, which is impossible. AI.7.2's version carries the unit α, φ(b)=ασ with α(0)=−1, and is the one now cited. The algebraic §8.2 presentation states in its text that it is the α=1 case.

NoncommutativeGeometry N1 (cyclic cochains of complex and locally convex algebras, with B and SBI) is now a boundary clause; Layer 1 is the chain-level theory over an arbitrary ring. EnhancedDerivedSheaves E5:presentability.4 (trace-class maps, rigidity over a base) was already cited correctly by §§4.1–4.3 as extended, not reconstructed. DerivedModuleAlgebra, ClassifyingSpaces, GeneralizedCohomology, the nested RepresentationTheory roadmaps and the current Tau Ceti library (`a91d3aaf`) contain no further overlap.

## 3. Gaps closed by new targets

1. **§2.14 *Representation spheres and representation-graded TR*.** KTheoryFiniteLocalFields §5.16 imports representation spheres "from genuine equivariant homotopy theory", and §5.17 computes TRⁿ_{q−λ}. No upstream or atlas roadmap owned either. The new target states:
   - S^V⊗S^W≃S^{V⊕W} and Φ^H(S^V⊗X)≃S^{V^H}⊗Φ^HX;
   - S^λ in TSp_F;
   - TRⁿ_{q−λ}(X;p), with R to λ′=ρ_p^*(λ^{C_p}), F and V;
   - the long exact sequence with the homotopy-orbit term.

   Sources: Hesselholt, *K-theory of truncated polynomial algebras* (Handbook of K-theory, 2005), §3.2 (3.8), p. 78; Proposition 1, p. 79; §3.10, p. 94; §3.12, pp. 99–100. Checks: λ=0; n=1 gives π_{q−2d}; λ′ for ℂ(1) and ℂ(p); the perfect-field formula. I verified its λ=0 case against W_n(k)[σ_n] and its λ=ℂ(1), n=2 case against the long exact sequence.
2. **§4.18 *Continuity of K-theory modulo p*** (CMM Thm F, p. 4; Prop. 5.4, p. 38; Thm 5.5 and Rem. 5.6, p. 39; Thm 5.21 in §5.2, p. 44; Rem. 2.8, p. 9). This was assigned to "the henselian Part II", which does not exist. It follows from §4.17 together with THH continuity.
3. **§9.4 *The K-theoretic Beilinson square (AMMN Theorem A)*** (p. 3), with AMMN Corollary B. It was also assigned to the non-existent Part II. It follows from §4.17 and the TC square. Non-example: for ℤ, π₁K(ℤ,(p);ℚ_p)=0, while π₁ΣHC(ℤ;ℚ_p)=ℚ_p.
4. **§9.5 *Integral refinement of the graded Beilinson square*** (AMMN Thm 6.17 with (56), pp. 44–45). Part III §7.0 supplies only the rational square. The integral isogeny of cofibres and the exact formula for i≤p−2 would otherwise have been lost with old §9.6. I checked it at i=1, R=ℤ_p, p≥3: H¹=pℤ_p≅1+pℤ_p. The §9.4 fibre sequence now also records the 2p−4 range of AMMN Thm 2.20(b) (p. 12).

## 4. Other corrections

- **StableHomotopyKTheory locators.** Checked against its README headings. The Burklund towers are §§7.32–7.34; the previous review's "correction" to §§7.29/7.31 was wrong, and all five occurrences are fixed. Milnor sequences are §7.10 (now §§7.9–7.10). Rationalization is §7.21 (was §7.19). The arithmetic fracture square is §7.23 (was §7.20). Filtered convergence is §§7.24–7.29 (was §§7.21–7.26).
- **Other supplier locators.**
  - EnhancedDerivedSheaves: the rational animated/commutative comparison is E5:animation.4 `animatedToCAlg`, not E5:cotangent-export.
  - GeneralizedCohomology: limits and completion are G3.8–G3.9; G3.7 is continuity.
  - CMM page fixes as listed in §1.
- **Scope, conventions, supplier contracts, layer introductions and downstream consumers** rewritten to match the imports. Supplier bullets now exist for BordismFormalGroups §§F6.1/F6.5, AInfCohomology §AI.7.2 (by target name) and PrismaticCohomologyPartIII §7.0 (by API name). Layer 8 fixes its notation C_A, and u for AI.7.2's b. The consumer paragraph no longer calls AInfCohomology, the Prismatic roadmaps or DerivedDeRhamCohomology consumers.
- **Suggested.lean.** The closing comment and the Layer 8 section comment were updated. No declaration changed, and none corresponds to a removed target: the `TracePresentation` quotient is the kept algebraic §8.2 target, and AInfCohomology's Suggested.lean has no such declaration.

## 5. KTheoryFiniteLocalFields-facing inputs (§§4.1–4.8, 5.16–5.17)

Every input those sections take from this roadmap is present:

| Input | Where |
| --- | --- |
| Ordinary THH | §2.7; E∞ via AI.7.2 |
| Genuine fixed points for C_{pⁿ}⊂T | §§2.12, 2.14 |
| R, F, V with the residual-norm FV and π₀TRⁿ=Wₙ | §2.14 |
| The norm–restriction sequence and the maps Γ, Γ̂ | §2.13, isotropy separation mapping to the norm sequence |
| The bounded-below genuine/modern comparison | §§2.15, 2.17 |
| TC(T) as a fibre product of the TC(T;p), and its p-completion | §2.10 |
| The cyclotomic trace | §4.11 |
| DGM and Goodwillie | §4.17 |
| HKR | §1.9 |
| Representation spheres and TRⁿ_{q−λ} | §2.14, new |

KTheoryFiniteLocalFields still plans π₀TRⁿ=Wₙ (its §4.2), Gabber rigidity (its §2.1) and the TC(T) fibre product (its §4.4) itself. Those are now duplicates owned here, a follow-up for that roadmap.

## 6. Generality

- **Genuine/modern foundations.** These are stated at full available generality:
  - finite G and F-genuine T;
  - the genuine/naive equivalence on all bounded-below objects (NS II.6.3/II.6.9, Acta pp. 280, 283);
  - the Barwick–Glasman model comparison as an explicit construction target.
- **Relative trace theorems.**
  - DGM for connective E₁-rings with π₀-surjective nilpotent kernel.
  - Goodwillie's theorem for nilpotent ideals and simplicial rings.
  - Henselian rigidity for every henselian pair and every n.
  - Continuity for noetherian I-complete rings with F-finite reduction, plus the derived form.
  - The Beilinson square for associative rings, and for commutative rings henselian along (p) in K-theory.
- **No narrowing.** No removal narrowed a statement. Wherever this roadmap was more general than the cited owner, the variant was kept.

## 7. Upstream form, own words, process, metadata

- **Shape.** The README follows the upstream shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read, layers with Examples and Dependencies, Downstream consumers, References.
- **Size.** 538 KB and 4,237 lines. The job template's "at most 200 KB" predates the maintainer's 2026-10-12 shape rule, which overrides older size notes: size is what the content needs, and tier 1–4 roadmaps run 4,000–15,000 lines. The de-duplication removed 56 KB net.
- **Own words and process.** No source passages and no process language: a grep for packet, job, review, checkpoint, coverage, deferred and optional finds nothing.
- **Metadata.** `metadata.toml` is `topic = "math.KT"`, which fits.

## 8. Sources checked

All sources were accessed on 20 October 2026, read as data, with own-words notes only. Each file is identified by the first 16 hex digits of its SHA-256.

**Fix-added targets:**

| Source | Version | SHA-256 prefix |
| --- | --- | --- |
| BGT | arXiv:1001.2282v4 | 08a8ae7fb5715d82 |
| CMM | arXiv:1803.10897v2 | ad23c1d7b818b85e |
| R-Gal | arXiv:math/0502183v2 | 1fc6c3d369576391 |
| Krause–Nikolaus | arXiv:1907.03477v1 | f969ef1304d4f1c7 |
| BMS2 | arXiv:1802.03261v2 | b2338ef19714f39a |
| BMS2 | Numdam published | 6b43d1ff3c3f345d |
| BS | arXiv:1905.08229v4 | 1d91a6eb85828feb |
| AN | arXiv:1809.01714v2 | 9ca2657c1f23542b |
| HM97 | author PDF | 833d5ded2fae2819 |

Verified on these: KN Thm 1.1 (p. 4) and Prop. 2.1 (p. 6); AN Thm 6.1 (p. 57); HM97 Thm 2.3 (printed p. 18).

**New targets:**

| Source | Version | SHA-256 prefix |
| --- | --- | --- |
| Hesselholt, Handbook chapter | author PDF, web.math.ku.dk/~larsh/papers/s01/handbook.pdf | 0f079627b73d2b13 |
| AMMN | arXiv:2003.12541v2 | 2a0224b2e8b7c5f1 |

**Random sample of 15 further locators**, drawn with seed 11325 from the 171 locator lines not already checked. All 15 are correct:

| Locator | Source file (SHA-256 prefix) |
| --- | --- |
| AN Defs 3.1, 3.6 and Prop. 3.8, pp. 15–19; Prop. 3.11, p. 21 | AN, as above |
| BMS Prop. 6.2, p. 245 | BMS2 Numdam, as above |
| Loday–Quillen Thm 1.6, p. 570 | GDZ scan, 461c68509eaeb1f9; read from the page image |
| Hoyois §2, pp. 4–5 | a51aa52ec74e195e |
| Efimov Def. 1.2 and §1.6, p. 20; §1.5, p. 18; Thm 2.1, p. 25 | 0969afe53a4f9f3f |
| Land–Tamme Thm B, p. 3 (Thm 3.3 and Cor. 3.5, p. 29) | 59adf6a7d0a8b20d |
| CMM Thm 4.33, p. 35 | CMM, as above |
| Cortiñas Main theorem 0.1, p. 1 | 3496320585a1415a |
| Wagner §3.1, p. 25; ¶2.6, p. 14; Lemma 2.15, p. 19 | fe9d7d71478eb546 |
| Pstrągowski Prop. 4.3, p. 30; Def. 4.4, p. 31; Prop. 4.14, p. 33 | 37cd80d462acf94f |
| NS (Acta) II.4.5–II.4.7, p. 263; IV.4.3, p. 357; IV.4.7, p. 359; Thm II.6.3, p. 280; Thm II.6.9, p. 283 | 8b1856fa8faefa3e |
| Raskin Def. 2.11.2 and Cor. 2.11.7, pp. 10–11; §5.5, pp. 32–33; Thm 5.6.1, p. 33; Rem. 2.3.1 and Var. 2.3.2, p. 6 | 3ae1b7a88baa13c9 |
| Meyer–Wagner Thm 3.14, p. 36; Convention 3.1, p. 29; high-powered integers, 3.3, p. 30 | 4479788e04da71cf |

The Meyer–Wagner 3.3 definition matches `HighPowered` in Suggested.lean exactly.

## 9. Adversarial pass

| Statements | Instances tried | Outcome |
| --- | --- | --- |
| Representation-graded TR (new) | λ=0; n=1 (π_{q−2d}); λ=ℂ(1), λ′=0; λ=ℂ(p), λ′=ℂ(1); perfect field at λ=0 and at λ=ℂ(1), n=2, against the long exact sequence | Correct |
| Continuity mod p (new) | ℤ_p with I=(p); only connective K; no rational claim | Correct |
| K-theoretic Beilinson square (new) | ℤ_p (π₁=ℚ_p via log); ℤ (π₁K rel = 0 ≠ ℚ_p; TC square still holds); Cor. B range i≤2p−5 | Correct |
| Integral graded square (new) | i=0; i=1, ℤ_p, p≥3: ℤ_p(1)(ℤ_p)≃pℤ_p[−1]; p=2 range | Correct |
| Henselian rigidity (fix) | I=0; unit ideal; (ℤ_p,p) non-nilpotent; 𝔽₂ not strictly henselian (π_{−1}(TC/2)=𝔽₂); (𝔽_p[[x]])^perf uniquely p-divisible K₁; Gabber at n=p for ℤ_p | Correct; locator fixes only |
| Syntomic K-sheaf (fix) | 𝔽_p twist; K₁(ℤ_p;ℤ_p)≅ℤ_p; −1∈K₁(ℤ₂)[2]; weight 0 sheaf; odd vanishing only after sheafification | Correct; "Proof inputs" made consistent |
| Stable-category K, IK (fix) | zero category; S₀, S₁; k×k idempotents; κ=ω swindle; ℕ not κ-filtered; regular rings | Correct |
| K(1)-local sphere, j (fix) | valuations at odd p; r=2 vs r=10 at p=3; d₃(u²)=a³; π₁J₂ order 4; π₀j at 2; β₁ | Correct |
| Old §8.11 relative DVR | K=ℚ_p residue specialization | Incorrect (α=1 inconsistent); removed in favour of AI.7.2 |
| Layer 1 and Layer 5 spot checks | B(x^m)=m x^{m−1}dx; HH_*(𝔽_p/ℤ); dual numbers; b=B=id non-example; ψ^{±1}, ψ² on π_{−2}KU; q−1=βt | Correct |
| Suggested.lean signatures | `CartierStructure` (FV=p only); `IsMorphism`; `isogeny_iff_underlying` (n·g argument: operator defects land in ker f, killed by n); `HighPowered` vs MW 3.3; `fourthPower`; `TracePresentation`, `lift`, `can_and_frobenius` | Correct, non-vacuous |

## 10. Lean and validation

- **lean-check.** `lean-check research/blueprint/packages/RefinedTraceMethods/Suggested.lean` exits 0 at the pins (Mathlib 082e2d37e8, Tau Ceti f790474). The only warnings are four `declaration uses sorry`, at lines 55, 94, 151 and 160. No `set_option`, no sorry'd data, no admitted examples. There is one `import Mathlib`.
- **Intake check.** `python3 research/blueprint/intake.py check-files` on the three package files reports 0 problems.
- **Cross-references.** A script check found 656 internal "§k.n (title)" references, all resolving. Every Checks block has at least three items. There are no missing anchors.
- **Builds.** No Lake command or build was run in either read-only checkout.

## 11. Follow-ups for other roadmaps (not edited here)

- **HabiroCohomologyFoundations.** Layers 6 (HQ.5-trace) and 9 (HQ.8) cite this roadmap, while this roadmap cites HCF Layers 2–5. At roadmap level that is a cycle, so neither can go upstream first. HCF Layers 6 and 9 should become a consumer part, or cite RTM §§6.9–6.14 and 8.8.
- **KTheoryFiniteLocalFields.** Cite RTM §2.14 for π₀TRⁿ=Wₙ, §4.17 for Gabber rigidity, §2.10 for the TC fibre product and p-completion, and §2.14 for representation spheres and TRⁿ_{q−λ}, instead of planning them.
- **ChromaticHomotopyTheory and GeneralAlgebraicKTheoryPartII.** Their packets point at this roadmap's former Bousfield-localization target and finite Tate constructions. Re-point them to BordismFormalGroups §§F6.1/F6.5.
- **CohomologyComparisons.** Line 1472 of its upstream README says this roadmap consumes its graded Beilinson square. Both now import Part III §7.0.
- **AInfCohomology.** Its downstream-consumer line naming this roadmap is accurate.
- **K2SymbolsBrauer.** The §13.12 proof-gap note from the fix handoff stands; RTM §4.19 uses only §13.12's statement.

No suspicious instructions were found in issue comments, pull-request text or fetched sources. No fetched content was executed, and no source passage was put in the repository.
