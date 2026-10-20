# FIX-PKG-RefinedTraceMethods~adv2: fixes report

Claude (Opus), session **claude-dWptNm**, 20 October 2026. Refs #11304. Branch `claude-dWptNm-refined-trace-fix2`.

This job continues the blocked checkpoint `FIX-PKG-RefinedTraceMethods~adv` (Codex, #11282). It resolves the four findings of `REV-PKG-RefinedTraceMethods~codex.md`, the input named for this job. The issue's file `REV-PKG-RefinedTraceMethods~adv.md` does not exist; as in the checkpoint, the codex review supplied the findings. The verdict is `accepted`. Only the three package files and this note were edited.

## Ownership analysis that decides the fixes

The checkpoint treated "no upstream supplier yet" as a defect. WORKERS.md ("Upstream tiers") lets a package cite the layers of lower packages, and the build order then puts this roadmap upstream after them. The real test is whether a supplier sits below this roadmap or consumes it. I checked each supplier against its package README and its packets:

| Supplier | Uses RefinedTraceMethods? | Consequence here |
| --- | --- | --- |
| HabiroRings (accepted package) | No (0 citations in README or packets) | Cited by section: HR.1, HR.2 (with "Spherical coefficients and the solid comparison"), HR.5, HR.6. |
| HabiroCohomologyFoundations (accepted) | Only Layer 6 (HQ.5-trace) and Layer 9 (HQ.8 §§9.10, 9.15) | Layers 2–4 cited by section (§§2.4–2.7; 3.12, 3.15–3.16, 3.20–3.29; 4.1, 4.4, 4.9, 4.12, 4.17–4.20, 4.23, 4.25–4.27), plus the exported interface §4.28 and the finite-coefficient pairs §5.26 that FIX-PKG-HabiroCohomologyFoundations~adv (#11316) added for this roadmap while this job ran. Its Layers 6 and 9 are consumers. |
| K2SymbolsBrauer (needs_changes, fix #11306 claimed) | No | Cited: §13.1, §13.7 (relative K₂ and its exact sequence), §13.12, §13.13. |
| KTheoryLowDegrees, GeneralAlgebraicKTheory, StableHomotopyKTheory | No | Cited as before. KTheoryLowDegrees §§13.2–13.4 is added for K₂=π₂K. |
| KTheoryFiniteLocalFields | Yes: Layers 1–3 throughout L.1–L.7 (README §§4–5 and packet) | Above this roadmap. Its π₀TR, Bökstedt and Gabber inputs are now constructed here. |
| GeneralAlgebraicKTheoryPartII (accepted plan) | Yes: KII.5, KII.6, KII.8–KII.10 cite RT.2/RT.3/RT.5 | Above. Its KII.0 stable S-construction and nonconnective K are now planned here (§4.9). |
| ChromaticHomotopyTheory (accepted plan) | Yes: CH.1, CH.8, CH.9, CH.11 cite RT.2/RT.4:topological | Above. Bousfield localization and the K(1)-local sphere are now planned here (§6.8). |
| PrismaticCohomologyPartIII | Package does not cite RTM | §6.28 (Bhatt–Scholze Theorem 14.1) is added as a supplier. |

## Finding → change

| Finding | Change | Status |
| --- | --- | --- |
| 1. Habiro and low-degree suppliers | Removed the "Unresolved prerequisite contracts" section. Habiro supplier bullets now cite exact package sections. A Scope paragraph records the build order and that HabiroCohomologyFoundations Layers 6/9 consume §§6.9–6.13 and 8.13. π₀TR as Witt vectors is now a theorem of §2.14 (HM97 Theorem 2.3, p. 18; AN Theorem 6.1, p. 57), with a new Check `TR.pi0_witt_ZZ`. Bökstedt periodicity is a new §2.7 target (KN Theorem 1.1, p. 4; Proposition 2.1, p. 6; NS Cor. IV.4.16) with three Checks. Its earlier citations to KTheoryFiniteLocalFields L.5 (§§8.2, 8.6, Layer 8) and the downstream-ownership remarks in §§2.3, 2.7, 2.10, 2.11, 4.19 are replaced. §4.19 now uses only K2SymbolsBrauer §§13.1, 13.7, 13.12, 13.13 and KTheoryLowDegrees §§13.2–13.4. It no longer uses the fibre comparison of K2SymbolsBrauer §13.8 (a proof gap there); the splitting gives the relative groups as kernels. New Also-establish: K₂(ℤ[ε],(ε))=ℤ/2≠Ω¹. | Resolved |
| 2. K on small stable ∞-categories | New §4.9 targets: **Connective K-theory of small stable ∞-categories** (BGT Def. 7.1, Lemma 7.3, Rem. 7.4 p. 44; Thm 7.8 p. 47; Cor. 7.9, Prop. 7.10 p. 48) and **Nonconnective K-theory by the suspension construction** (BGT Def. 9.1, Lemma 9.4, Prop. 9.5 p. 57; Def. 9.6, Lemma 9.7, Thm 9.8 p. 58; end of proof p. 63, citing Schlichting §7 Lemma 6; Prop. 9.32, Rem. 9.33 p. 64). They have 9 Checks, including the four from the old contract. §§2.3, 4.6, 4.9, 4.10, 4.11 now point at these targets. | Resolved |
| 3. Chromatic input for j | §5.1 now allows k=−1 (an integral E∞ involution ψ^{−1}, a C₂-action from {±1} on K(ℤ,2)), with API and a Check. New §6.8 targets: **Bousfield localization of spectra** (L20 Example 4 p. 1, Examples 5 and 7 p. 2; R-Gal §5.5.1 p. 32) and **The K(1)-local sphere and its Adams fixed points**. The latter covers p odd via ψ^r for an integer topological generator r; p=2 via B₂=(KU₂)^{hC₂}, its spectral sequence with d₃(u²)=a³, then ψ³ (R-Gal Prop. 5.3.1 p. 23; §5.5.2 pp. 32–33). The E∞ structures are by construction: L_ES is initial among E-local E∞-rings, and ℤ-fixed points are taken in E∞-rings. j is rewritten on these; its "Prerequisite gap" text is removed. | Resolved |
| 4. Syntomic K-sheaf | New §4.17 target **Henselian rigidity of the trace with finite coefficients**: CMM Thm A p. 3, Thm 4.36 with Rem. 4.37 p. 36, Rem. 4.39 p. 37, Thm 6.1 p. 50, Cor. 6.9 p. 53; K-book IV.2.10 p. 283. It includes Gabber's rigidity, the strictly henselian and semiperfect cases, the CMM proof route and 5 Checks. The §8.12 K-sheaf target is restated with complete published proofs for every p-complete quasisyntomic ring, all i≥0 and n≥1, with sheafification before cohomology. Sources: BMS-arXiv §7.4 (Thm 7.15, Props 7.16–7.17 pp. 50–51), §8.4 (Prop. 8.20, Cor. 8.21 p. 66, Cor. 8.23 p. 67); BS Theorem 14.1/Cor. 14.2 p. 97, owned by PrismaticCohomologyPartIII §6.28. The new Checks include the perfect-field twist test A_crys(𝔽_p)^{φ=p^i}. | Resolved; see the note below |

**Note for the maintainer on finding 4.** Bhatt–Mathew Example 1.6 (p. 2) states the description of Z/pⁿ(i)_X as the derived syntomic-to-étale pushforward of a_syn K_{2i}(−;ℤ/pⁿ) for *every* p-quasisyntomic scheme (for example Spec ℤ). It says the result "will be discussed in more detail separately". I found no published proof: I searched, and read BM, CMM, BMS2, BS §14, AMMN and Hahn–Levy–Senger. Under the generality rule (state results at the level the sources support), the target is now stated on the p-complete quasisyntomic site, where every step has a published proof. The non-complete statement is named in the target's Checks and in "Proof inputs" as announced and not claimed. If a proof appears, it can be added as a separate target that glues this one with Gabber rigidity on X[1/p] (§4.17) and the BM fibre square.

## Notes for other roadmaps (not edited here)

- **HabiroCohomologyFoundations.** Layer 6 (HQ.5-trace: §§6.1–6.5) and Layer 9 (§§9.10, 9.15, HQ.8) cite RefinedTraceMethods. This roadmap cites that package's Layers 2–4, so at roadmap level the two form a cycle. The statements of HCF Layer 6 are RTM §§6.9–6.14 (Wagner Theorems 1.2, 4.17, 4.27, 5.63; Corollary 6.15). Suggested resolution: HCF Layer 6 and the trace squares of Layer 9 become consumers placed after this roadmap (an HCF Part II, or deletion in favour of citing RTM §§6.9–6.14, 8.13). HabiroRings HR.6 cites HCF HQ.3–HQ.5 but not HQ.5-trace, so it is unaffected.
- **KTheoryFiniteLocalFields.** §2.1 (Gabber rigidity) can now cite RTM §4.17 `gabberRigidity`. §4.2's π₀TRⁿ=Wₙ can cite RTM §2.14 `TR.pi0_witt`. §5.1's Bökstedt periodicity can cite RTM §2.7. (KTFLF already lists RTM as a prior supplier.)
- **GeneralAlgebraicKTheoryPartII.** KII.0/enhanced-s-construction and KII.0/nonconnective-k (and the stable-category parts of KII.0/perfect-categories) should import RTM §4.9. KII.5/connective-variants can use RTM §4.17.
- **ChromaticHomotopyTheory.** CH.0/homological-localization should import RTM §6.8 (Bousfield localization). The K(1)-local sphere and B₂=(KU₂)^{hC₂} in §6.8 are available to CH.7/CH.11.
- **K2SymbolsBrauer (fix #11306).** §13.13 (van der Kallen) has its own proof (van der Kallen 1971, pp. 1205–1207). It need not go through §13.9's Keune presentation, which K2SB marks as a proof gap. RTM §4.19 uses §13.12's general-k generation, so that gap remains K2SB's obligation.

## Adversarial pass on the touched statements

| Statement | Instances tried | Result / change |
| --- | --- | --- |
| Bökstedt periodicity | u^p in degree 2p vs divided powers in HH(𝔽_p/ℤ); k=𝔽_p(t) (π₁THH(k)∋dt≠0); THH(ℤ_p) with π_{2p−1}=ℤ/p | Perfectness hypothesis kept; Checks added |
| π₀TRⁿ=Wₙ | A=𝔽_p (ℤ/pⁿ); A=ℤ, p=3, n=2: ghost image {w₀≡w₁ mod 3}, torsion-free rank 2; index convention W_{n+1}↔C_{pⁿ} matches TR^{n+1}=X^{C_{pⁿ}} | Correct; `TR.pi0_witt_ZZ` added |
| Stable S-construction | C=0; S₀, S₁; R=k×k bounded free complexes (K₀=ℤ vs ℤ²); K₀(Perf F)=ℤ vs monoid ℕ | Idempotent-completion distinction kept |
| Suspension IK | κ=ω (F_ω=Idem, swindle fails); κ uncountable and ℕ not κ-filtered; regular A has no negative IK; degree 0 needs idempotent completeness | All-filtered colimits sourced to BGT p. 63 / Schlichting, part of target |
| Henselian rigidity | I=0; unit ideal excluded; (ℤ_p,p) non-nilpotent; 𝔽₂ not strictly henselian (π_{−1}(TC/2)=𝔽₂); (𝔽_p[[x]])^perf integral failure; n=p for ℤ_p outside Gabber; n invertible ⇒ TC/n=0 | Correct; 5 Checks |
| ψ^{−1} | Acts on π_{2i}KU by (−1)^i; square = id; k=−1 needs no inversion | Added to §5.1 |
| Bousfield localization | E=0; E=HQ; E-modules local; HF_p KU/p-acyclic but p-complete | Distinct from completion |
| K(1)-local sphere, p odd | p=3, r=2 (primitive mod 9) vs r=10 (≡1 mod 9: wrong π₃ and spurious π₁); valuation of r^{(p−1)k}−1 is 1+v_p(k); π_{−1}J_p=ℤ_p vs π_{−1}S^∧_p=0 | Correct |
| K(1)-local sphere, p=2 | B₂ spectral sequence: a⁴ must die because η⁴=0, forcing d₃(u²)=a³, so π₃B₂=0; fib(ψ³−1) on KU₂ has π₁=ℤ/2 (coker 2) vs order 4 on B₂ | Corrected my first draft of this Check (π₁ on KU₂ is ℤ/2, not 0) |
| j | p=3: π₀=ℤ₃, π₃=ℤ/3, π₁₁=ℤ/9; p=2: π₀=ℤ₂⊕ℤ/2 split by sphere unit; k=0 excluded | Unchanged values, re-derived from new targets |
| Syntomic K-sheaf | i=0 (H¹ ≅ K_{−1} fails, so the odd statement is i≥1 only); 𝔽_p twist test; K₁(ℤ_p;ℤ_p)≠0 pointwise; ℤ₂, n=i=1 Bockstein class −1; Spec ℤ outside domain | Index range corrected during the pass |
| §4.19 dual numbers | k=ℤ: K₂(ℤ[ε],(ε))=ℤ/2 ≠ Ω¹=0; ℚ[ε]: K₂ relative =0=HC₁; split ⇒ relative = kernel | Hypothesis 2∈k^× retained |

Degenerate-case sweep over the remaining standing hypotheses: trivial group, zero ring or category, p=2, n=0 excluded by n≥1. Each new target was instantiated at the zero object and at the smallest prime. No noncompactness or rank hypotheses enter the new statements.

## Sources read (data, own words only)

All public, accessed 20 October 2026: BGT arXiv:1001.2282v4; CMM arXiv:1803.10897v2; BM arXiv:2202.04818v2; BMS2 arXiv:1802.03261v2; Rognes arXiv:math/0502183v2; Krause–Nikolaus arXiv:1907.03477v1; Antieau–Nikolaus arXiv:1809.01714v2; AMMN arXiv:2003.12541v2; Hahn–Levy–Senger arXiv:2409.20543v2 (no relevant statement); Hesselholt–Madsen 1997 (author PDF); Weibel's K-book (author PDF, printed = PDF − 8); Lurie, 252x Lecture 20. From the maintainer's cleared library: Bhatt–Scholze, *Prisms*, arXiv v4 (§14, p. 97). No suspicious instructions were met in any fetched text, issue comment or PR. No downloaded code was run.

## Checks run

- `lean-check research/blueprint/packages/RefinedTraceMethods/Suggested.lean`: exit 0, with only the four existing `sorry` warnings (lines 55, 94, 151, 160); 83 GB available. Only the closing comment changed; declarations and examples are identical.
- Scratch cross-reference script: every `§k.n (Title)` resolves to a bold target in that section; every `(#anchor)` exists. There are 107 Checks blocks with 363 items, minimum 3 (was 103/343). No target heading was removed, and six were added.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: 0 problems.
