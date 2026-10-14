# Independent package review: HilbertModularVarietiesAndShimuraCurves, round 3

Reviewer: Claude (Opus 5.5), session `claude-iPUpmC`, 2026-10-14. Refs #9765. I wrote and reviewed none of the three package rounds. **Verdict: accepted**, with the corrections listed below applied in place. This is a completed fixing review.

The package under review is round 3: README.md (3,734 lines before this review), Suggested.lean (716 lines) and metadata.toml. It was checked against the five accepted packets (H0, R18.2–R18.5) and the round-2 report. The round-3 change set is the diff of commit 62726b4bb against 440be246b. I read all of it, together with every primary source it newly cites. No packet was edited.

## The five round-2 defects

| Round-2 defect | What round 3 did | Verified against | Outcome |
| --- | --- | --- | --- |
| 1. §H6.5 had no usable local realization contract | It added input conditions (C1)–(C6) and conclusions (O1)–(O4): the multiplicative case, the ordinary case, the place above p and the matching of pairings. It also added prime-ideal levels to §§H6.1–H6.2. | Tay02 §1, pp.6–13 (Lemma 1.1 on p.7; L, ψ and N on p.9; M on p.10; Lemma 1.2 on pp.10–12; Lemma 1.3 on p.12; the moduli space and local points on p.13). Rap78 §§2.9.1–2.9.6, pp.273–274. | Fixed. The derivations of the torsion comparisons are correct. Three small errors were corrected here; see below. |
| 2. Early Galois inputs for §R18.3.29 and §R18.4.27 | It added primary locators, narrowed the even-degree clause, and wrote out the l-adic factorization argument. | Car86a hypothesis (C), Theorem A. Tay89 Conjecture 1, p.265, and Theorem 2, p.266. Sai09 Theorem 0, pp.10–11, and Theorem 1, p.12, both under hypothesis (C). Kis08 §(4.1), p.542, and Theorem (4.3), p.543, assuming only an absolutely irreducible residual representation. KW09 Lemma 9.1, pp.80–81, for the factorization argument. | Fixed. A quaternion algebra split at exactly one real place forces (C), and the README notes this. The narrowing is stated in §R18.6. |
| 3. Ramified filtration and determinant step in §§R18.2.14 and R18.2.17–18 | §R18.2.14 now builds the saturated quotient M=D(H)/J·D(H) with W^t=ω_{H^t}/J·D(H). §§R18.2.17–18 are restricted to F_v/ℚ_p unramified. | YZ18 Theorem 4.9, pp.568–569; Theorem 4.10 and its proof, pp.569–570; Proposition 5.3, pp.574–575; Proposition 5.4, p.575; Corollary 5.5, p.576. | Fixed. I re-derived the construction (see the adversarial table). No roadmap outside this one cites `bridge-filtered-crystal` or `bridge-determinant`, so the restriction breaks no consumer. |
| 4. Hecke descent in §H3.8 | It wrote out the Kisin–Lai cyclic construction, the classes [ε] modulo U_N², representability and the union over narrow class representatives, and added descent to the arithmetic quotient. | KL05 §1.9, author DVI pp.7–9, and §1.10, p.9. BHW23 Lemma 8.22 and (8.7), pp.1776–1777. | Fixed. The u⁻¹ isomorphism, the Δ(N)-torsor of classes and the finiteness of π₁, π₂ away from primes dividing a match the source. Descent through O-linearity in λ is the package's own argument, and it is correct. |
| 5. Primary source for Kisin's quotient in §R18.4.19 | It constructs R_v as the image of R^□ in the reduced Kisin quotient. The dimensions are now derived. | Kis08 Corollary (2.6.2), p.532; Theorem (2.7.6), p.534; §(3.3.3) and Theorem (3.3.4), p.540. MS19 display (1). | Fixed. 4+[F_v:ℚ_l] for the framed generic fibre, 3+[F_v:ℚ_l] with the determinant fixed, and Krull dimension 4+[F_v:ℚ_l] all check out. |

## Corrections made in this review

All are in README.md. Suggested.lean and metadata.toml are unchanged.

1. **§H6.5 (C2), choice of λ₀.** b_v with β_v≡χ_v(φ_v) mod λ₀ exists only if π_l is a unit at λ₀. Since π_lπ_l^c=l and π_l+π_l^c=1, exactly one of the two lies in λ₀. With the wrong sign of √(1−4l), every β_v would be 0 mod λ₀. The README now fixes the sign of the square root, and says why.
2. **§H6.5 (C3), α′_w.** The README chose α′_w in ℤ[π_l], following Taylor. That order is maximal only when 1−4l is squarefree. Splitting in the Hilbert class field gives an element of norm p only in the maximal order. For example, l=19 gives 1−4l=−75, whose order has class number 2. α′_w is now taken in the integers of ℚ(π_l), with the existence argument stated. Honda–Tate in (O3) needs only a Weil p-number.
3. **§H6.5 (O2), l-torsion of A₀.** The README repeated Taylor's isomorphism A₀[l](k̄)≅O/(β_v^c), which fails when f_v>1. Over 𝔽_{l²} with β=π_l², the left side has order l and the right side order l². The correct statements are A₀[β_v^c](k̄)≅O/(β_v^c) (Verschiebung is β_v^c) and A₀[l](k̄)≅O/(l, β_v^c). Only the support is used afterwards, so no conclusion changes.
4. **§§H6.2 (construction, API and Construction paragraph).** Three phrases still said "full level" after round 3 introduced prime-ideal levels. They now say level-(𝔫₁, 𝔫₂).
5. **§R18.2.14.** O_v^{ur} is now stated to be the integers of the completed maximal unramified extension. The Grothendieck-existence step needs a complete base.
6. **§R18.4.19, two new Checks for the v|l quotient.** Round 3 constructed this quotient, but all three existing Checks tested only the q-local rings. `local_l_dimensionCount`: for F_v=ℚ_l, R_v has Krull dimension 5 and generic fibre dimension 4, against 6 and 5 without the determinant condition. `local_l_typeExclusion`: a potentially semistable lift whose type is nontrivial on I_{L′} is not a point of R_v.
7. **§R18.3.4 proof route.** It leaned on the Khare Duke Lemma 2.2, which no source examined here proves (Points the sources leave open). It now says that under the alternative hypothesis Γ_t is trivial, that §R18.3.16 supplies such levels, and that the Khare argument is not used.
8. **§R18.1.3.** The phrase "coverage if absent" was process-like and is restated as a fact: V8 covers a central weight that is not ℚ-rational.
9. **Locators.**
   - Tay06 Lemma 2.2 is on p.747, and the U-matrix computation of its proof is on p.748. §R18.3.28 now cites pp.747–748 and §R18.3.30 cites p.747; both previously cited pp.746–747.
   - MS19 Lemma 4.12 and its proof are on p.25 (§R18.4.24; previously pp.24–25).

## Source audit

All new round-3 locators are listed in the table of defects above; I opened and read every one. In addition, 15 target locator rows were sampled with seed 9765, excluding the round-2 sample and the round-3 targets:

| Target | Passage examined | Result |
| --- | --- | --- |
| R18.4.13 | Mil Theorem 21.1 and Remark 21.2 (p.130, inside the cited pp.129–131); Del80 Corollary 3.3.6, p.206 | Confirmed: comparison for constructible coefficients; inner cohomology is the image. |
| H2.1 | DP94 §3.2, p.68; §4.1, pp.70–71 | Confirmed: self-orthogonal local model, closed in the Grassmannian. |
| R18.4.24 | BR10 §1.5, pp.5–6; Theorem 18.1, pp.44–45; MS19 Lemma 4.12 | BR10 confirmed (preprint pages). MS19 corrected to p.25. |
| H4.9 | BHW23 Lemma 8.5, p.1766 | Confirmed: Cartesian squares and the Δ(N)-torsor. |
| H3.2 | BHW23 Proposition 8.4, p.1766; Lemma 8.12, p.1771 | Confirmed. I also recomputed the ℚ(√2), M=12 Check: ε⁴≡5 and ε⁸≡1 mod 12. |
| H4.10 | BHW23 Definition 8.14 and Lemma 8.16, pp.1771–1773 | Confirmed. I recomputed the ℚ(√2), p=3, N=4 non-injectivity: U₃∩U⁺=⟨ε⁸⟩, U₁₂²=⟨ε¹⁶⟩, and ε⁸ maps to 1 in Δ(4). |
| H1.10 | BHW23 §5.1.2, pp.1744–1745 | Confirmed. |
| H4.18 | BHW23 Lemma 8.20, p.1775 | Confirmed. The bound [U:U_N]·2^g was re-derived. |
| H1.2 | DP94 §§1.1–1.5 (pp.60–63) and §2.1 (p.64) | Confirmed. |
| R18.3.24 | KW09 Lemma 7.4(1) and proof, pp.64–65 | Confirmed: identification by evaluation, and Hecke-equivariance only after reduction. |
| H4.2 | BHW23 Definition 5.6 and (5.2), p.1743; (8.4), p.1769 | Confirmed. |
| H4.7 | BHW23 Corollary 8.11, p.1771 | Confirmed: induction through diag(η,1) and the antidiagonal (ℤ/pⁿ)^×. |
| R18.2.13 | YZ18 Theorem 4.9, pp.568–569 | Confirmed. |
| R18.5.9 | BC91 Part III §5.3.1, pp.141–142 | Confirmed: Schottky groups and the displacement-greater-than-two condition for gluing standard charts. |
| R18.3.28 | Tay06 Lemma 1.6(2), pp.744–745; Lemma 2.2; KW09 §7.4, pp.65–66 | Lemma 1.6 and KW confirmed. The Lemma 2.2 pages were corrected. |

## Adversarial mathematics pass

This round's pass covers every statement round 3 changed, plus the numeric Examples and Checks of every layer. Round 2's table partitioning all 182 targets still applies to the unchanged targets. I re-instantiated its degenerate cases where a changed statement touches them.

| Statements checked | Instances and witnesses | Outcome |
| --- | --- | --- |
| H6.5 (C2) | l=5: π₅²−π₅+5=0, β_vβ_v^c=q_v. l splits in ℚ(√(1−4l)) because 1−4l≡1 mod l. | The λ₀ sign condition was missing and is now added. |
| H6.5 (C3) | l=19: 1−4l=−75, ℤ[π₁₉] non-maximal, class number 2. α_wα_w^c=p. | Ring corrected. Ordinarity holds because α′_w and its conjugate generate distinct primes. |
| H6.5 (C5)–(C6) | 1−4l is a square at the primes above l and above p, so λ_M and ℘_M split. The l=5 example: 170+39√19 has norm +1, h=1, h⁺=2, and the genus field is ℚ(i,√−19). | Confirmed. (C6) is necessary, since Taylor's wide-class argument fails for N=N₀. |
| H6.5 (O1) | Twisting by χ_v quadratic. q₀ ∈ ℘_M-multiple (possible since ℘_M and λ_M are coprime). v(q) totally positive, which is stronger than Taylor's trace condition. Rap78 2.9.4: P(X)≅𝔡⁻¹·𝔡·O=O. | Confirmed: the λ-torsion has class q̄ and the ℘-torsion splits. |
| H6.5 (O2) | f_v=2: order l versus l². H¹_f=H¹ because β_v² is not a root of unity. H² vanishes by duality with H⁰((M_λ/O)(χ̃²)), since χ_v²≠1. ψ̄_{v₁^c}=ε̄_pψ̄_{v₁}⁻¹ at Frobenius gives q_v/β_v=β_v^c. | The torsion statement is corrected. The lift, descent and ℘-lines are confirmed. |
| H6.5 (O3) | λ-eigenvalues are α_w and α_w^c, with α_wα_w^c=p=det ρ̄(Frob_w). The ℘-part is étale because α′_w is prime to ℘₀. | Confirmed. |
| H6.5 (O4) | Split module: diag(u,1) has det u. Non-split extension: scalars only, so determinants are squares. Rescaling the class by u gives an isomorphism of determinant u. | Confirmed. This answers Taylor's remark, which is too quick in the non-split case. |
| H6.1–H6.2 | Fineness at prime level: the kernel of GL₂(O_λ)→GL₂(O/λ) is torsion-free when e=1<l−1. | Confirmed; the wording was made consistent. |
| H3.8 | Cyclic D≅O/a. ε↦u²ε with u∈U_N. η∈U⁺ changes λ′_ε by η⁻¹. h⁺ components; a with nontrivial [a]₊. | Confirmed against KL05 §§1.9–1.10. A single c-component is preserved only when [a]₊=1. |
| R18.2.14 | Unramified case: J·D(H) is the sum of the non-τ summands, so M=D(H)_τ. Ramified e≥2: O_v⊗W(k̄) is a product of DVRs permuted by Frobenius, so ranks are equal. The fibrewise flatness criterion over O_v⊗O_X applies. Split B_v: ω²=det W⊗det W^t, with W=Lie(H)^∨ (YZ's display of N has W^∨ where the composition requires W; Corollary 5.5 agrees with the README). Nodes xy=π_v. | Construction and identity confirmed. Grothendieck existence needs the completed base (clarified). |
| R18.2.17–18 | Ramified v: the raw τ-quotient is not exact, H″ is not strict, and no consumer exists outside this roadmap. | The restriction is correct. |
| R18.3.29 | Odd degree versus even degree. A Steinberg twist above p with k=2. Arithmetic versus geometric Frobenius: the characteristic polynomial is unchanged and the determinant is inverted (the Check computes X²−(t/Ns)X+1/(Ns) for the wrong choice). | Confirmed. The non-discrete-series clause in even degree is narrowed and not used. |
| R18.4.27 | B split at one real place forces (C). T is reduced and O-flat, so the intersection of the point kernels is zero. | Confirmed against KW09 Lemma 9.1. |
| R18.4.19 | F_v=ℚ_l: dimension counts 4/5 and 5/6. A type nontrivial on I_{L′}. l>2 is needed for the square root of the determinant twist. | Confirmed; two Checks added. |
| R18.3.4 | Stabilizer orders prime to p versus a trivial Γ_t; p=2, 3. | The proof no longer depends on the uncollated Khare lemma. |
| Examples of all layers | ℚ(√2) different (2√2). ℚ(√3) gives Δ(1) of order 2; ℚ(√2) gives Δ(1)=1. c=(2,√10) is nonprincipal (norms ±2 are not squares mod 5). Ball of radius one in the ℚ_p tree has p+2 vertices. Sym² pairing determinant 4. Gram q=2, T=3, S=2 sends (0,1) to (3/2,3). | All recomputed correctly. |

## Suggested.lean

`lean-check` on the package file (Mathlib 082e2d3, Tau Ceti f790474): exit 0, exactly 40 `declaration uses 'sorry'` warnings, and no errors or other warnings. `scripts/check_sorry_data.py` passes: there are no sorry'd data definitions, and every definition has a real body. The file has 716 lines and follows the 2026-10-12 shape, so no theory is developed in Lean.

I checked twelve signatures against the README and against their truth. Round 2 checked a different set of ten.
- `mem_congruenceUnits` matches the kernel of the residue map.
- `congruenceUnitSquares` is the image of the square map intersected with P. Squares are totally positive, so this is the README's S_M.
- `connectedDelta_eq` uses U_{pⁿN}.
- `HilbertFiniteGamma0` is a real subgroup, with the lower-left entry under the inverse via the adjugate. Lean allows any m, which is more general than the README.
- `DrinfeldHalfPlane.affineChart`: [z:1] is K-rational iff z∈K.
- `QuaternionHodgeLine.metric`: ‖dz‖=2 Im z.
- `divisionCharacterValue`: the root r^n.
- `twDiagonalTorsion_isSquare`: true for b<a.
- `QuaternionTWLevel.diamondFactor`: the N-torsion quotient, C₈ to C₄.
- `liftableResidueImage` and `normTwist_involutive`: χ²=1 is required.
- `componentT`: (q+1) times translation.

The milestones `oldspace_split`, `residual_injectivity_saturation` and `integral_ihara_split` are true as typed. For example, disc⁻¹·adj∘trace retracts δ, and the residual condition forces saturation over a DVR by Krull's intersection theorem.

## Other checks

- **Upstream form and own words.** The README keeps the TauCetiRoadmap shape (Summary; Scope and ownership; Conventions; Exact supplier contracts; How to read the build; layers with Examples and Dependencies; Downstream consumers; References). It has no target tables and no field lists. Round-3 text paraphrases its sources: no passage is quoted, and nothing is a section-by-section summary.
- **Process language.** I searched for packet and job ids, review and checkpoint words, and local paths. The only hit was "coverage if absent" (fixed above). "Points the sources leave open" lists mathematical obligations, not process.
- **Prerequisites.** Every internal anchor resolves, and no *Needs* points forward in the build order. Every cited atlas roadmap has a lower tier than this one (tier 14) in `upstream/CaraianiNewton.md`. The highest are PELModuli, ShimuraVarieties, PadicHodgeTheory and AutomorphicSpectralTheory, all in tier 13. No `FoundationsAndLibraryIntegration` or `UPSTREAM:` reference remains.
- **Duplication.** The read-only TauCetiRoadmap checkout is still at 0d144d044d and Tau Ceti at a91d3aaf, the same as in round 2, so round 2's ownership audit stands. For round 3's new material (Honda–Tate CM instances, the Tate HBAV, the Kisin–Lai Hecke correspondences, potentially semistable deformation rings), I searched by object. The hits were Tau Ceti's elliptic Tate curve and ReductiveGroupsPartII's Ihara amalgam, which are different objects. Nothing was removed.
- **Metadata.** `topic = "math.NT"` is unchanged and fits.
- **intake.py check-files** on the deliverables: 0 problems.

## What remains

Nothing blocks the draft pull request. The open obligations stay visible at their targets and in "Points the sources leave open":
- the Khare Duke field-degree lemma, which is now unused;
- the KW Lemma 7.2(i) case q_v≡−1;
- Taylor's narrow-class step, now hypothesis (C6);
- the algebraic-space status of the global DP model;
- the ramified bridge comparison;
- the AdicSpacesPartII and PELModuli supplier extensions.

The plan-revision suggestions and errata candidates in the round-3 handoff are endorsed. I add three errata candidates for the register:
- **Tay02 p.11.** The l-torsion of A₀ is given as O/(β_v^c); this is correct only when f_v=1.
- **Tay02 p.9 (choice of α′_w).** ℤ[(1+√(1−4l))/2] should be the maximal order of ℚ(√(1−4l)).
- **YZ18 p.569.** The line bundle N is defined there as det W^t⊗det W^∨. The displayed map det W^t→det W^∨⊗ω^{⊗2} and Corollary 5.5 require det W^t⊗det W, which is what the README uses.

## Retrieval provenance

Copies read on 2026-10-14. Their SHA-256 values are those of the round-2 report and the round-3 handoff for BHW23, KW09, YZ18, Sai09, Tay02, MS19, EGS15, Kis08, KL05, Rap78 and Tay89; all eleven were rehashed and match. Additional copies:
- DP94, Numdam: `CM_1994__90_1_59_0.pdf`.
- Del80, Numdam: `PMIHES_1980__52__137_0.pdf`.
- BR10, author preprint.
- BC91, Numdam full volume.
- Tay06, EMS Press chapter 27484.
- Mil, version 2.21.
