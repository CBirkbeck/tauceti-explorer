# Independent package review: PrismaticCohomologyPartIV (Layer 8, logarithmic prismatic cohomology)

**Verdict: accepted**, with the fixes below applied in place. With them the package is ready for its draft pull request on TauCetiRoadmap, together with the other members of its bundle.

Reviewer: Claude (Opus 5.5), session `claude-zm0UEa`, issue #10238, 2026-10-17. This package is Part IV of the compaction and split merged in #10228 (Codex session `codex-68yXMm`, job FIX-PKG-PrismaticCohomology~adv2). Earlier rounds were packaged by `codex-r34hIf`, `codex-TrnTU4` and `codex-2fDWWk`, and reviewed by `codex-6c8mLq` and `claude-Pb2mL7`. This reviewer took part in none of those jobs. The packets were read and not edited.

## 1. What was checked

| Check | Result |
| --- | --- |
| Form against the exemplar (PACKAGE_REVIEW.md, PadicMeasuresIwasawaAlgebras) | Title, Summary, Scope and ownership, Conventions, supplier contracts, How to read the build, `## Layer 8` with `### 8.n` subsections, per-layer Examples and Dependencies, Downstream consumers and References are all present. Fixed: the "How to read the build" paragraph repeated the Summary, so it now gives the seven construction stages of Layer 8. 44 theorem-only subsections had no named target, so each now opens with "Prove `Name`." Runs of blank lines were collapsed, and lower-case paragraph openings and the Conventions punctuation were fixed. |
| Size | README 243 KB (was 234 KB), within the manager's band; Suggested.lean 266 lines. |
| Sources | Twelve public sources were downloaded and read page by page: K1 (arXiv:2007.14037v3), KY (arXiv:2306.00364v1), KYcorr, BLRH, MW20, Inoue (arXiv:2505.01084v2), ČK (arXiv:1710.06145v3), SSV, CN21, BS22, DLLZ and KatoII (arXiv:1905.10678). Over 60 locators were checked against the text, including every K1, KY, KYcorr, Inoue and MW20 label in the package and all of §§8.0, 8.59–8.60, 8.62a and 8.76a. One locator was wrong (K1 has no "Construction 6.6"); it is fixed below. |
| Supplier order (`upstream/CaraianiNewton.md`) | PrismaticCohomology is in tier 13, bundled with AInfCohomology, PerfectoidQuotients and PadicHodgeTheory. Every supplier of this part is lower: SchemeAndStackFoundations (tier 2); AdicSpaces, AdicEtaleGeometry, PerfectoidSpaces and DiamondsAndVStacks (tier 3); EnhancedDerivedSheaves (tier 4); CrystallineCohomology and DerivedDeRhamCohomology (tier 9); ClassicalAdicEtaleCohomology (tier 10); DiamondEtaleCohomology (tier 11). AInfCohomology is an earlier bundle member, and Parts I–III precede this part. PadicHodgeTheory, CohomologyComparisons (tier 14) and HodgeTateAndCanonicalSubgroups (tier 16) appear only as consumers. No `FoundationsAndLibraryIntegration` or `UPSTREAM:` id occurs. |
| Supplier labels | A Sonnet cross-check found where every cited label lives in the supplier packages, and I read the flagged rows myself. PerfectoidSpaces `P4.15.2–P4.15.3` is not in the local package; it is in TauCetiRoadmap PR #818 (head 4624e66, §P4.15.2 "universal prisms and perfection"), but it covers only semiperfectoid perfectoidization. The §8.63 step needs integral perfectoidization (BS22 Theorem 1.17(1)), which PrismaticCohomology §2.31 owns, so the citation is retargeted. The DVS D1/D4/D6, EDS E5 and CAE "H0" glosses did not match their suppliers and were rewritten. |
| Duplication: Tau Ceti | The current TauCetiRoadmap main (all 58 roadmaps, including the nine newer than the atlas snapshot) and the Tau Ceti library have no log structures, δ-rings, prisms, Kummer-étale sites or log diamonds. `TauCeti.IsProP` exists at the pin (`Topology/Algebra/Group/Profinite/ProP/Basic.lean`). Mathlib's `Perfection M p` (monoid perfection), `Algebra.GrothendieckGroup` and Legendre's `Nat.Prime.multiplicity_factorial_pow` exist at 082e2d3 and are cited. |
| Duplication: atlas roadmaps | Kummer homomorphisms of monoids and Kummer morphisms of fs log schemes are planned by CrystallineCohomology (CR.5:log-algebra/kummer-morphism, `LogCrystalline.IsKummerHom` in its Suggested.lean). §8.59 restated them as `KummerEtale.IsKummerType`; that declaration is removed and §8.59 imports CR's notion, keeping the Kummer-étale site, which CR does not plan. No other roadmap plans the completed sheaves Ǒ_Y and Ô_Y on diamonds or Mann–Werner Z_p-local systems on diamonds (§8.62a), the Bhatt–Lurie algebraic Riemann–Hilbert correspondence (§8.0), δ_log-rings or log prisms. Log quasisyntomic sites and log QRSP rings are already imported from DD.6 (§§8.43–8.44). HodgeTateAndCanonicalSubgroups (tier 16) plans log adic sites but states that it consumes §8.60; it is now listed as a consumer. |
| Duplication with Parts I–III | No target restates an earlier part. The log constructions extend Layer 0 (δ-rings), Layer 1 (relative site), Layer 5 (q-PD pairs), Layer 6 (étale comparison) and Layer 7 (Laurent F-crystals). §8.0 is the algebraic, non-lisse generalization of Part III §7.7. A Check now records that, on lisse objects at n = 1, it restricts to §7.7(1). |
| Unit tests | Every definition subsection has at least three Checks, each of which a wrong definition fails. Added `Monoid.nat_not_perfect` (§8.14) and replaced the §8.59 Kummer-type Check by `KummerEtale.diagonal_not_cover`. Two Checks were repaired: §8.44 `LogQRSP.zero_ring` left the monoid unspecified, though with N → 0 the zero ring is not semiperfectoid; and §8.14 called a trivial tilt "0". |
| Lean | `lean-check research/blueprint/packages/PrismaticCohomologyPartIV/Suggested.lean`: exit 0, with four `sorry` warnings and no other warnings or errors. The theorems left as `sorry` are `exists_iff_dvd`, `IsPerfect.isPerfectoid`, `IsPerfectoid.isPseudoPerfectoid` and `isPerfectoid_units`. All examples and the other theorems have complete proofs. |
| Own words | No verbatim passages or section-by-section summaries. The proof routes are short and paraphrased. |
| `intake.py check-files` | 3 files, 0 problems. |

## 2. Changes made

**Suggested.lean**, brought to the exemplar's form and given real content. Before this review it had a single function `unitFactor` and theorems taking the δ_log axioms as hypotheses. Now:

- One module docstring, "PrismaticCohomologyPartIV: representative target signatures", states the design choices: δ is a parameter, monoid tilts are Mathlib's `Perfection`, and units are handled through `Associates`/`Associated`. The layer section comment is `/-! ## Layer 8 … -/`, and a closing comment lists by section every README target that cannot be typed at the pins.
- §8.1 gets the real-bodied structure `Log.DeltaLogStructure p δ α`, with fields `deltaLog`, `deltaLog_one`, `compat` and `deltaLog_mul` (Koshikawa Definition 2.2).
- §8.1 also gets `IsRankOne`, the rank-one constructor `rankOne`, and `deltaLog_unique_of_nonZeroDivisor` with a complete proof.
- `exists_iff_dvd` is stated with the δ product rule as an explicit hypothesis. It is true without p-torsion-freeness, since one cancels α(mn)^p.
- `Log.unitFactor_mul` and `Log.frobenius_chart` are restated for the structure, with complete proofs.
- Examples cover the unit section, uniqueness over the trivial monoid, non-existence on ℤ[x] with δ(x) = 1, the p = 2 values 3/4/9, and the non-determination of δ_log on a zero chart.
- §8.14 gets the predicates `Monoid.tilt`, `IsPerfect`, `IsPseudoPerfectoid` and `IsPerfectoid`, three theorems, and a proved example that ℕ is not perfect at p = 2.
- §8.40 keeps the merge and homotopy identities, and adds [2]_q − 2 = q − 1 and the negative-exponent identity [−1]_q(q − 1) = q⁻¹ − 1.
- §8.76a pins Legendre's formula with `#check` and keeps the dyadic valuations 1 and 3.

**README.md**

- Supplier contracts: the table is rewritten. It now has one row per supplier actually cited, with what each row supplies checked against that supplier's README. Rows were added for Parts I–III, AdicEtaleGeometry A1, SF.2/SF.4, EDS E1–E3, DD.0/DD.1, CR.0, AI.2/AI.5, DVS D2/D5 and DEC C2, all of which were cited but missing. The TauCetiRoadmap AdicSpaces row is cut to the Layers 0–3 actually used; the Fargues–Fontaine curve material is not used in this part. The unused FF abbreviation is dropped.
- Library table: the residual `frobenius` row ("Lemma 9.2") is dropped. Rows for `Associates`/`Associated`, `nonZeroDivisors`, `powersHom`, Legendre's formula and `Condensed` are added.
- §8.0: algebraic objects are perfect Frobenius W_n(R)-modules. Bhatt–Lurie prove the abelian equivalence and the Ext comparison (Theorem 9.6.1, Proposition 9.6.2, pp.84–85); the bounded derived equivalence is the deduced target. Extension by zero is stated for principal opens Spec R[1/t] ⊂ Spec R, as in BLRH Propositions 5.2.2 and 5.2.4, not for arbitrary étale open immersions. The compatibility with Part III §7.7 is added.
- §8.0b: `log-differentials` is CR.5, not CR.5:log-algebra.
- §8.1: added `Log.unitFactor` and `Log.DeltaLogStructure.rankOne`, and noted that `exists_iff_dvd` needs no p-torsion-freeness.
- §8.10: the monoid map to O_C♭∖{0} sends 1 to π♭, not to [π♭].
- §8.14: the tilt of the pseudo-perfectoid non-example is the trivial monoid. Added `Monoid.nat_not_perfect`.
- §8.30: "K1 Construction 6.6" does not exist; the weakly final free δ_log envelope is K1 Remark 6.9, p.34.
- §8.44: `LogQRSP.zero_ring` now fixes the trivial monoid and gives N → 0 as the non-example.
- §8.59: imports Kummer homomorphisms and morphisms from CrystallineCohomology, as described in §1.
- §8.63: integral perfectoidization is PrismaticCohomology §2.31 (BS22 Theorem 1.17(1), p.9), not PerfectoidSpaces §P4.15.2.
- §8.76a: the contraction exponent cites Mathlib's Legendre formula.
- §8.77: one sentence says which step of KY Proposition 8.9 the log PD deformation replaces (see §4).
- Theorem-only subsections §§8.4–8.6, 8.12–8.13, 8.16–8.17, 8.22–8.26, 8.28–8.29, 8.31–8.32, 8.34–8.35, 8.38–8.39, 8.41–8.42, 8.45, 8.47–8.51, 8.53–8.57, 8.61–8.62, 8.67–8.69, 8.72, 8.74–8.76, 8.78–8.79 now name their targets.
- Dependencies are listed by roadmap and layer. Downstream consumers add HodgeTateAndCanonicalSubgroups.
- References: the uncited Fargues–Fontaine and Lurie DAG XIII entries are removed. The cited but missing Kato 1989, Hyodo–Kato 1994, Nakayama 1997/2017, Huber 1996, Scholze–Weinstein 2020, Kedlaya–Liu II and Tsuji 2019 are added, with details checked against KY's bibliography. The BLRH and SSV entries now use the same format as the rest.

## 3. Adversarial pass

Each row records the statement, the degenerate or discriminating instances I computed, the result, and what changed. "Locator" means the label and page were checked in the downloaded source.

| § | Statement | Instances tried | Result | Change |
| --- | --- | --- | --- | --- |
| 8.0 | Algebraic Frobenius modules, solution equivalence, extension by zero (BLRH) | n = 1 vs Witt length n; R = F_p (constant sheaf); R = k algebraically closed (non-perfect direct sums); W_n(m_(C♭)) (non-lisse); t = 0 and t = 1; nilpotent Frobenius at n = 1 | Abelian equivalence and Ext comparison are BLRH 9.6.1/9.6.2; derived form is a deduction; BL's extension by zero is for A → A[1/t] | Perfect modules; derived form marked as deduced; principal opens; §7.7 compatibility Check |
| 8.0a | Formal integral log charts, exactification of surjections | 2N ⊂ Z; N² → N sum map (kernel units appear); Q_{≥0} base (non-fine) | Correct; K1 A.2–A.10 locators checked | — |
| 8.0b | Formal log smoothness | trivial log; semistable diagonal N → N^r; N → N, 1 ↦ p in characteristic p (excluded) | Correct; K1 A.11–A.20 locators checked | — |
| 8.0c | Completed log cotangent complex, unique lifting | (A,0) → (A⟨x⟩,N) gives dlog x; log point (k,N → 0) keeps degree −1; KY Rem 2.13 nonintegral chart | Correct (KY Thm 2.11, Rem 2.13 p.15; SSV Thm 4.17 p.19) | — |
| 8.0d | Completed log PD envelopes, big site | identity R = B with zero ideal and nonzero base PD ideal; torsion PD thickening | Correct as stated (K1 Rem 6.6–6.9) | — |
| 8.1 | δ_log-ring axioms | trivial monoid; ℤ[x], δ(x) = 1 (no structure); p = 2 zero chart with δ_log(n) = (3^n − 1)/2; units A^× with δ(x)x^(−p); existence criterion without p-torsion-freeness | All true; checked axiom (3) on each by computing 1 + pδ_log as φ(α m)/α(m)^p | Lean structure and proofs; `rankOne`; `exists_iff_dvd` note |
| 8.2 | Monoid Frobenius φ_M(m) = m^p α⁻¹(1 + pδ_log m) | rank one (pth power); trivial log (φ_A on units); free δ_log line (not the pth power); p ∉ rad(A) (1 + pδ_log not a unit) | Correct (K1 Rem 2.3 p.7) | — |
| 8.3 | Limits, colimits, free δ_log-rings | trivial M; Z_(p){x}_δlog ≠ Z_(p)[x]; p-divisible M on a p-complete ring: δ_log(n^(p^k)) ∈ p^k A, so δ_log = 0 | Correct (K1 Lem 2.11, Ex 2.10 p.9) | — |
| 8.4–8.6 | Completion, completely étale, associated log, extension to M^gp | (Z_(p)[x],x^N) completion; Z_p[[u]] log; N = x^Z (localisation vs completion); M = N², t = x/y | Correct (K1 Lem 2.9, 2.13, Prop 2.14, Cor 2.15, Prop 2.16) | Target names |
| 8.7 | Exactification of δ_log-triples | already exact; diagonal X₀, X₁ ↦ X₀ (computed M′ = N × Z, A′ = A[T^±]/(X₀T − X₁)) | Correct (K1 Constr 2.17 p.12) | — |
| 8.8–8.9 | Prelog and log prisms | (Z_p,(p),1 ↦ 0); (Z_p[x],(x),x^N) not a prism; Breuil–Kisin associated monoid N; global sections not inverse (K1 Rem 3.5) | Correct (K1 Def 3.3 p.14; BS22 Lem 3.5, 3.7 pp.29–30) | — |
| 8.10 | Standard prelog prisms | E(0) = p·unit; φ(u) = u^p + p admits no δ_log; Teichmüller δ = 0 | Correct; monoid image of 1 is π♭ | π♭ fixed |
| 8.11–8.13 | Prelog/log prismatic envelopes, flatness | identity envelope; trivial log; log line diagonal; non-exactified envelope gives ordinary Ω | Correct (K1 Prop 3.6 needs orientable, kept; Prop 3.7, Lem 3.8, Prop 3.9, 3.11) | Target names |
| 8.14 | Perfectoid, perfect, pseudo-perfectoid monoids | N[1/p] perfect; groups perfectoid; O_C∖0 perfectoid not perfect (μ_p); x_j^p = x_(j−1)y_j: computed that compatible root systems force exponent p^(j−1)k on y_j, so M♭ is trivial; N not perfect | Correct; "M♭ = 0" meant trivial | Wording; `nat_not_perfect`; Lean predicates; p = 0 and p = 1 checked for the Lean theorems |
| 8.15 | Perfect log prisms, perfection | (W(k),(p),N → 0) not perfect, perfection N[1/p]; Breuil–Kisin not perfect; trivial log | Correct (KY Def 2.35, Rem 2.36, Ex 2.37 p.21) | — |
| 8.16–8.17 | Perfectoid log cotangent vanishing; perfect log prisms ≃ perfectoid log rings | L̂_(S/R) = 0 for perfectoid R → S via θ-kernels; (O_C, O_C∖0) ↔ A_inf | Correct (KY Lem 2.28, Cor 2.29, Prop 2.39, Lem 2.40) | Target names |
| 8.18–8.19 | Relative log prismatic site and cohomology | X = Spf(A/I) with M_A (final object; RΓ = A); trivial logs; log line H¹ = R·dlog X, not R·dX | Correct (K1 Def 4.1, Rem 4.2–4.5) | — |
| 8.20 | Absolute (saturated) site | Breuil–Kisin covers (K1 Lem 4.14); A_inf weakly final; trivial log | Correct (K1 Rem 4.6; KY Def 7.34 p.80) | — |
| 8.21–8.26 | Čech–Alexander complexes, base change, étale localisation, covers, Lemma 5.7, log line | R = A/I; trivial log; G′ = G = X^Z; G = 0; S = R × R | Correct (K1 Constr 4.7, Rem 4.8, Lem 4.11 needs finite Tor amplitude (kept), Lem 4.12, Prop 4.13, Lem 4.14, Lem 5.7, Prop 5.8) | Target names |
| 8.27–8.29 | Log Hodge–Tate map and comparison, base change | dlog X₀ vs dX₀ (factor X₀); semistable chart rank (d choose i) with Σ dlog relation; trivial logs | Correct (K1 Lem 5.2, Thm 5.3, Cor 5.5) | Target names |
| 8.30–8.31 | δ_log-crystalline site and comparison | p-torsion PD thickening excluded; point; log line not weakly final | Correct; wrong locator "K1 Construction 6.6" | Locator → K1 Rem 6.9 p.34 |
| 8.32 | Cosimplicial relative Frobenius (App. B) | M = Q; N → N ⊕ N | Correct (K1 Prop B.1, B.3, Lem B.4) | Target name |
| 8.33–8.35 | Crystalline comparison map, local and global | log point N^(1) = N ⊔_(N,·p) N; untwisted functor fails; trivial logs | Correct (K1 Thm 6.1 and 6.3, both p.31) | Target names |
| 8.36–8.39 | Log q-PD triples, q-crystalline site, mod q − 1, prismatic comparison | A_inf with q = [ε]: [p]_q = φ(ξ) computed; A_inf/μ p-torsion-free (μ, p regular); q = 1; (q − 1) is not a prism ideal | Correct (K1 Def 7.1, Ex 7.2, Lem 7.3–7.4, Def 7.5, Rem 7.7, Thm 7.10, Lem 7.12, Thm 7.13) | Target names |
| 8.40 | Log q-de Rham complexes, merges and homotopy | [−n]_q = −q^(−n)[n]_q; X₀X₁ ↦ (1 + q)X² vs 2X²; swapped merge: G − F = t(Bu − Av) = H²d¹ with H² = (q − 1)·, checked in degrees 0, 1, 2 under d¹(u,v) = Bu − Av; 2N at p = 2 | Correct; the sign follows the stated Koszul convention | Lean examples for [2]_q − 2 and [−1]_q |
| 8.41–8.42 | Semistable AΩ comparison and the C_st diagram | radicals of (p, μ) and (p, φ(ξ)) agree; torus case; K1 Thm 8.5 misprints replaced by ČK Prop 6.8 diagram (p.66) | Correct (K1 Thm 8.1, Rem 8.3, 8.4, Thm 8.5 p.49) | Target names |
| 8.43–8.45 | Log quasisyntomic site, log QRSP, basis | (Z_p⟨T⟩,T^N); (Z_p, N → 0): transitivity gives degrees [−1, 0]; KY Rem 2.13 nonintegral étale map (char ≠ 2); zero ring: with N → 0 condition (3) fails | Correct except the zero-ring Check | Zero-ring Check fixed; target names |
| 8.46–8.50 | Derived log prismatic cohomology, conjugate filtration, properties, agreement, descent | base (A/I, M_A); log line; zero log (degrees −1 and 0, zero differential); coproduct of unit algebras is A | Correct (KY Def 4.3, Prop 4.5–4.8, Def 4.9, Rem 4.10, Prop 4.12) | Target names |
| 8.51 | Initial log prisms of semiperfectoid pre-log rings | O_C/p with trivial monoid; perfection vs p-saturation | Correct (KY Prop 4.14, 4.17, Cor 4.21) | Target names |
| 8.52–8.57 | Log Nygaard filtration, graded pieces, fibre sequence, Lη, de Rham, isogeny | Fil⁰; log line gr¹ = τ≤1 Δ̄{1}; for j ≥ D the fibre sequence gives I^i ⊗ Fil^j ≅ Fil^(i+j) (computed from Ω^(>D) = 0) | Correct (KY Ass 5.3, Def 5.5, Prop 5.7, Def 5.13, Cor 5.17–5.18, Prop 5.24, Cor 5.27, Prop 5.29, Cor 5.31, 5.35, Thm 5.1) | Target names |
| 8.58 | Breuil–Kisin log cohomology | point; good reduction (strict pullback, §8.48(1)); semistable curve H⁰ | Correct (K1 Ex 1.6 p.5) | — |
| 8.59 | Kummer-étale site of fs log schemes | log point over algebraically closed K: H¹ = Z/n(−1) ≠ 0; diagonal N → N² not Kummer; n = 0 not injective | Correct; Kummer homomorphisms duplicated CR.5 | Imports `LogCrystalline.IsKummerHom`; Check replaced |
| 8.60–8.61 | Fs log adic Kummer foundations; scheme vs adic comparison | geometric rank-one log point H¹ ≅ Z/n; trivial log H¹ = 0; n = 0 excluded | Correct (DLLZ Def 2.2.2, 2.3.1, Thm 4.4.15, Cor 4.4.18, 4.4.22, Lem 4.4.27–4.4.29 pp.62–65; KY Lem 6.5 p.60) | Target names |
| 8.62 | Affine Kummer-étale comparison | I = (p) (both sides zero); P trivial (BS22 Thm 9.1); y^p = 1 + pX: binomial coefficients of valuation −v_p(m!) give no section in C⟨X⟩ | Correct (KY Thm 6.1 p.59, which has the I ≠ (p) hypothesis) | Capitalisation; target name |
| 8.62a | Completed untilt sheaves, profinite coefficients | marked untilt C vs C♭; coordinate section on Y × Z_p (continuous, not locally constant); Z/p^n locally constant | Correct (MW20 Def 2.1, Lem 2.7, 2.9, Def 3.1–3.3, Lem 3.4, Prop 3.5, 3.7, 3.9, Cor 3.15); no other roadmap owns it | Supplier row D6 corrected (D6 does not supply these sheaves) |
| 8.63–8.65 | Log diamonds, generic fibre, stdisc log perfectoid spaces | n-root cover self-product splits into n copies only after choosing μ_n(C); punctured vs closed disc; Q_{≥0} chart (uniquely divisible) vs N chart; 1 ↦ p trivial on Ô | Correct (KY Def 7.3, Conv 7.5, Ex 7.6, Lem 7.7, Cor 7.9, Lem 7.11, Def 7.12, Rem 7.13) | §8.63 perfectoidization retargeted to Part I §2.31 |
| 8.66–8.68 | Quasi-pro-Kummer-étale site, Kummer towers, comparison | T^(1/n) cover; P = Z/2Z, n = 2: Q_p[t]/(t² − 1) with t ↦ t² = 1 misses t = −1, so KY Prop 7.22 needs P^gp torsion-free; strict Kummer map not étale at T = 0 | KY Prop 7.22 (p.75) as printed omits that hypothesis; the README's hypothesis repairs it | Target names; erratum noted in §4 |
| 8.69 | Kummer-étale comparison (global) | trivial log; semistable over O_C (generic log structure trivial) | Correct (KY Thm 7.30 p.78, Cor 7.31 p.80) | Target name |
| 8.70–8.72 | Kummer and p-Kummer local systems, inertia criterion | rank 0; p^a-root permutation (p-group inertia); prime-to-p n-root (cyclic order n, not p-Kummer); a unipotent image is pro-p (g^(p^k) → 1) | Correct (KY Def 7.32; KYcorr Lem 1, Def 2, Ex 3 pp.1–2, Def 4, Prop 5, Rem 6 pp.3–4; Inoue Def B.2, Lem B.3, Prop B.4 pp.66–67) | Target name |
| 8.73–8.75 | Laurent F-crystals, corrected realization, pushforward | unit crystal ↦ Z_p; trivial log; prime-to-p inertia excluded from the image | Correct, using the KYcorr Theorem 7 correction (p.4) of KY v1 Theorems 7.36–7.37, and KY v1 Prop 7.38 (p.83) kept | Target names |
| 8.76 | Étale comparison over A_inf[1/φ⁻¹(μ)] | X = Spf O_C | Correct (KY Prop 8.3 p.86) | Target name |
| 8.76a | Log PD deformation base and rigidity (original) | P = 0 (D = W(k)); P = N, p = 2: φ(t) = 2γ₂(t), φ²(t) = 24γ₄(t); P = N²; nonfree cone (1,0),(1,1),(1,2) (saturated, relation 2(1,1) = (1,0) + (1,2)); C = 0 and C = D; positive height bounds denominators | Sound as a sketch; see §4 | Legendre cited from Mathlib |
| 8.77 | Hyodo–Kato over A_crys (repair of KY Prop 8.9) | trivial chart (BMS1 Prop 13.21); X₀ = Spf O_C; 1 ↦ [π♭]: no map from the hollow chart, PD evaluation exists once π^(p^n) ∈ pO_C | Correct; KY Prop 8.9's proof has the gap described in §4 | Sentence naming the replaced step |
| 8.78 | BKF modules | X = Spf O_C; BMS1 Def 4.22 orientation (φ(ξ)) matches KY Def 8.1 | Correct (KY Def 8.1, Thm 8.2 p.85) | Target name |
| 8.79 | Standard semistable chart | d = r = 1; d = r = 2 (dlog y = −dlog x); rank of Ω^1_log = d − 1 | Correct (K1 App A Ex (2), Thm 8.1) | Target name |

## 4. Source notes for the maintainer

- **KY v1 Proposition 8.9 (pp.89–90).** The proof composes (W(k),N) → (A_crys,N) with φ^n into (A_crys,M_crys). Here N is the hollow log structure: positive elements go to 0. When a positive element of M₀ has nonzero image in A_inf (for example 1 ↦ [π♭]), the composite would have to send 0 to a nonzero element, so it is not a map of prelog rings. The KY corrigendum does not touch this. The package replaces the step by its own argument (§8.76a, generalising CN21 Lemma 2.4 and Theorem 2.6 to an arbitrary sharp fs chart, then §8.77). I checked the contraction v_p((rp^n)!/r!) = r·e(n), the PD structure on the augmentation ideal, the evaluation into A_crys, and the section and effectivity argument: a cone killed by p^a factors through the PD ideal, and superlinear contraction beats a linear isogeny bound. They hold at the level of a roadmap sketch. Because the argument is original to the roadmap, an expert should look at it before upstream formalisation starts.
- **KY v1 Proposition 7.22 (p.75)** is stated for every fs monoid P, but surjectivity fails for P = Z/2Z, n = 2 (§8.67 Examples). The package adds the hypothesis that P^gp is torsion-free, which a sharp chart satisfies.
- **KY v1 Theorems 7.36–7.37** are superseded by KYcorr Theorem 7, as the Conventions already say; Proposition 7.38 is unaffected (KYcorr p.1).
- **K1 Theorem 8.5 (p.49)** has the diagram misprints recorded in §8.42; the package follows ČK Proposition 6.8 (p.66).

## 5. What remains

Nothing blocks the pull request.

- The four Lean theorems are `sorry` by design. Each was checked for truth at p = 0 and p = 1 as well as for primes.
- The `CAE:H0` slugs name the ClassicalAdicEtaleCohomology packet stage. The supplier row maps them to README §§1.2–1.4.
- The PerfectoidSpaces row points at TauCetiRoadmap PR #818, whose head moves; Part IV uses only its Layer 1.
- HodgeTateAndCanonicalSubgroups plans further log adic site material (its §§6.12–6.34). Since it is in a higher tier and already cites §8.60, it should keep importing from here.
