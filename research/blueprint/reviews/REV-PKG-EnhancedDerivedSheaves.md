# Review: roadmap package EnhancedDerivedSheaves

Job `REV-PKG-EnhancedDerivedSheaves` (issue #9683), by Claude (Opus 5.5, session claude-pmQSUx). I did no part of `PKG-EnhancedDerivedSheaves`, which was written in session claude-f92W0X (PR #9692).

Reviewed: `research/blueprint/packages/EnhancedDerivedSheaves/{README.md, Suggested.lean, metadata.toml}`. These were checked against the accepted plan (`EnhancedDerivedSheaves--E0.json` and `--E5.json`, 169 nodes) and against current TauCetiRoadmap main (55bfb67, 14 October 2026, fetched read-only). They were also checked against the current Tau Ceti library (a91d3aaf) and against Mathlib 082e2d3 and Tau Ceti f790474 at the pins. Sonnet helpers did three mechanical cross-checks: Stacks tags, library names, and PDF locators. I re-read every result they reported as a mismatch before acting on it, and two of their reported mismatches turned out to be wrong (see Sources).

**Verdict: accepted.** The fixes below have been applied in place. The package is ready for the draft pull request.

## Summary of what was checked

1. **Upstream form.** The README follows the shape of upstream roadmaps: the **Summary.** paragraph, then Scope and ownership, Conventions, Exact supplier contracts, How to read the build, and the layers in build order. Each target is written as prose, with its hypotheses, locator, API list, **Checks.**, proof route and *Needs:* line. Each layer ends with Examples and Dependencies, followed by Downstream consumers and References. The README contains no packet ids, job ids, review language or catalogue tables, and no source quotations. I read the whole README, all 2,650 lines.
2. **Fidelity to the plan.** A script matched every one of the 169 packet nodes to a README target. Every API name in the packets appears in the README, except the five renamings that the package's handoff lists: `detection`, `IsLeftKanExtension`, `coefficient_system_reconstruction`, `descendable` and `descendabilityIndex`. All 71 definition and construction nodes have at least three tests in the packets, and the README keeps at least three Checks for every definition; the targets with fewer Checks are all theorems. The structural decisions in the handoff (the build order and the cotangent complex moved down from DerivedDeRhamCohomology) agree with the packets' restructure proposals.
3. **Own words.** The README contains no source passages and no section-by-section summaries.
4. **No process language.** A grep for packet, review, job, checkpoint, gap, TODO, "moved down", "optional" and similar words finds nothing in the README or in `Suggested.lean`.
5. **Suggested.lean.** `lean-check` at Mathlib 082e2d37e8 exits 0 with 24 warnings, all `declaration uses sorry`. The file has 344 lines. Every definition has a real body (`IsCategoricalEquivalence`, `IsKFlat`, `frobeniusRootIdeal`, `valuationSaturationMap`, `IsValuationSaturated`, `IsProZero`, `IsProIsomorphism`, `pMultiplicationTower`, `IsReplete`, `IsWeaklyContractible`, `IsDerivedComplete`), and no data is defined by `sorry`. The file develops no theory. I checked 12 signatures against their README statements. Point-site versions (`IsKFlat`, `IsDerivedComplete`, `isAdicComplete_iff_derivedComplete_separated`) say so in their docstrings, and the README states the sheaf versions.
6. **metadata.toml.** It reads `topic = "math.AG"`, which fits: the sources are sheaf-theoretic and scheme-theoretic, and upstream SchemeAndStackFoundations uses the same topic.
7. `python3 research/blueprint/intake.py check-files` on the three package files reports 0 problems.

## Fixes made

### A. Duplication with current TauCetiRoadmap and Tau Ceti (removed and cited)

SchemeAndStackFoundations was merged into TauCetiRoadmap on 14 October 2026, after the plan was written. Its merged README states several of this package's targets. These targets were **removed** and are now cited:

| Removed target | Now cited as |
| --- | --- |
| `IsReplete` (definition), with API `IsReplete.projection` and `IsReplete.types` | `TauCetiRoadmap.SchemeAndStackFoundations` §2.17 `IsReplete` (same definition, BS-proet 3.1.1), with `IsReplete.lim_epi` and its Check `test_isReplete_types` |
| `IsReplete.lim_eq_rlim` (BS-proet Prop 3.1.10) | §2.17 `IsReplete.derived_limits` |
| `IsReplete.postnikov_unit` (K ≃ Rlim τ^{≥−n}K) | §2.17 `IsReplete.derivedCategory_leftComplete` |
| `IsLocallyWeaklyContractible.isReplete` (BS-proet 3.2.3(1)) | §2.17 `isReplete_of_locallyWeaklyContractible` |
| `flatBaseChange` (Stacks 02KH) | §2.6 `qcoh_higherDirectImages` (flat base change of quasicoherent higher direct images) |
| `properPushforward_coherent` (Stacks 02O5) | `TauCetiRoadmap.JacobianChallenge` Layer C (proper coherence; SchemeAndStackFoundations §§2.6 and 4.9 name it as the supplier) |
| `quasicoherentDerived_restrict` | §2.18 `DQCoh.restrict` (membership in Dqc is a condition on objects) |

The following targets are **kept as refinements**. Each now states in one clause how it differs from the upstream statement:
- `IsReplete.leftComplete` adds essential surjectivity onto coherent towers, as an equivalence of ∞-categories.
- `IsLocallyWeaklyContractible.compactlyGenerated` is stated for every locally weakly contractible topos, where §2.17 covers only the pro-étale topos.
- `QuasicoherentDerived` is now defined as the full ∞-subcategory over §2.18's `DQCoh`, and its affine comparison lifts `DQCoh.affineEquiv`.
- `derivedTensor`, `derivedInternalHom`, `enhancedPullback` and `enhancedPushforward` are functors of ∞-categories on arbitrary small ringed sites; their homotopy-category shadows on schemes are §2.18's functors.
- `perfectScheme_baseChange` is now derived as the perfect case of §2.18's `torIndependent_baseChange`, with the Tor-independence supplied by `perfectRing_tor_eq_zero`.

`IsReplete.of_equivalence` stays as extra API on the upstream predicate.

**Re-citations.**
- The atlas stage ids SF.0, SF.2b and SF.4c do not exist in the merged SchemeAndStackFoundations README. They are replaced by its sections: §§0.1, 0.4, 0.9, 0.17, 0.24–0.25, 2.1–2.2, 2.5, 2.6, 2.17, 2.18, 4.12 and 4.13.
- The DiamondsAndVStacks citations now use the numbering of its upstream pull request (#820), D0.17 and D0.18. The Čech-to-cohomology comparison is now cited from SchemeAndStackFoundations §2.2 (`cech_to_cohomology`), which PR #820's own D0.19 defers to.
- Scope and ownership now records two neighbouring results:
  - Mathlib's presheaf version of the slice-free modules: `PresheafOfModules.freeYoneda`, `freeYonedaEquiv`, `freeYoneda.isSeparating`, together with `PresheafOfModules.sheafification`. `sliceFree` is now described as their sheafification.
  - The current Tau Ceti closed symmetric monoidal structure on sheaves of modules: `TauCeti.SheafOfModules.monoidalCategory`, `symmetricCategory` and `monoidalClosed`. This is the ordinary tensor product and internal Hom under `IsKFlat`, `derivedTensor` and `derivedInternalHom`.

I searched the nine newer roadmaps, DGAInfinity, StablePeriodicCurved, ProfiniteCohomology, PadicMeasuresIwasawaAlgebras, GrothendieckEulerForms, AlgebraicTopology, ClassifyingSpaces and the current Tau Ceti library by object. They contain no simplicial join, quasicategory mapping space, dg nerve, K-flat complex, derived completion, descendability, animated ring, Koszul complex or full cotangent complex. In AlgebraicTopology and ClassifyingSpaces, spectra are explicitly out of scope.

### B. Gaps closed (new targets)

1. **Forward Kunz theorem.** `frobenius_flat_of_isRegular`, new in E1.6, sourced to Stacks 0EC0. `perfect_projectiveDimension_le` used "regular implies Frobenius flat" without an owner anywhere: not in Mathlib, Tau Ceti, any TauCetiRoadmap roadmap or any atlas package. The plan's gap "Perfect-ring algebra bridges" had left it to "existing commutative algebra", and DerivedDeRhamCohomology §5.18 lists it as an unsupplied proof input. It now has a target with Checks and a proof route through miracle flatness (Stacks 00R4) and the Cohen–Macaulay property of regular local rings (Stacks 00NQ). `isRegular_of_frobenius_flat` now also cites Stacks 0EC0.
2. **Global dimension of regular rings.** `isRegularRing_projectiveDimension_le` and `isRegularLocalRing_of_projectiveDimension_residueField`, new in E1.6, sourced to Stacks 00O7, 00OC, 00OE and 065T. They are used by `perfect_projectiveDimension_le` and by the converse Kunz theorem. The only plan for them was DeformationAndDerivedPatchingAlgebra R03.3, at tier 10, above this tier-4 roadmap, so they move down here.
3. **Dwyer–Kan localization.** `IsDwyerKanLocalization` and `dwyerKanLocalization`, new in E0.3, sourced to HA Definition 1.3.4.1 and Remark 1.3.4.2, p. 108. Eight targets use C[W⁻¹] (`monoidalDwyerKanLocalization`, `verdierQuotient`, `derivedFamily`, `animatedAlgebras`, `enhancedDerived`, `enhancedDerived_isPresentable`, `ringedDiagramDerived` and `monoidalModelLocalization`), but no target defined it. Their *Needs:* lines now cite it.
4. **Final maps and weak contractibility.** `IsWeaklyContractibleSSet` and `IsFinal`, new in E0.4, sourced to HTT Definition 4.1.1.1, Proposition 4.1.1.3, Proposition 4.1.1.8 and Theorem 4.1.3.1. `final_fibre_inclusion` and `IsSiftedInfinity` used "final" and "cofinal" with no definition. Weak contractibility is defined through maps into Kan complexes, because Mathlib has no Kan–Quillen weak equivalences at the pin.

The four new Lean theorems below were added and elaborate. The two new E0 notions remain README targets, because their carriers (Fun(D, E) between quasicategories, with a notion of fully faithful) are not at the pins.

### C. Locators corrected

I checked the corrections below against the sources. BS17 is read in the author PDF, Witt.pdf; BS-proet and ECD in the cleared arXiv copies; HTT, HA, Nikolaus–Scholze, Mathew v2, Fargues–Scholze, Berkovich motives and Bhatt (direct summand) in their public PDFs; and Stacks tag by tag.

- BS17 Lemma 6.14: p. 26, not pp. 25–26. The lemma and its proof are on p. 26.
- HTT Lemma 4.1.3.2 is about Cartesian fibrations with weakly contractible fibres. It is not the terminal-fibre statement, so `final_fibre_inclusion` now cites Theorem 4.1.3.1, printed p. 236, applied to comma categories.
- HA Proposition 1.4.4.1(3) characterises compact objects by maps into coproducts. It is not the right-adjoint criterion, so `rightAdjoint_preservesCoproducts_iff` now cites Fargues–Scholze Lemma IV.2.20, p. 123, and HTT Proposition 5.5.7.2, keeping HA 1.4.4.1(3) for the compactness test. ECD Proposition 23.7 is on pp. 144–145, not 144–146.
- Mathew: the README now fixes arXiv v2 and states that BS17 cites v1, which is numbered one higher from Proposition 3.21 on. The parts of `descendableCover_*` are re-attributed to v2's Proposition 3.25, Corollary 3.33 and Proposition 3.35. Part (4) is the lax-monoidal preservation that BS17 proves directly.
- Nikolaus–Scholze A.3 is a Remark, not a Definition.
- Bhatt's Definition 3.2 and Lemmas 3.4–3.6 (p. 6) are stated in the almost setting. The README now says so where it cites them for pro-zero towers. Lemma 2.6 is cited only for the use its proof makes of discreteness of perfections.
- Stacks, Cotangent Complex: Lemma 8.1 (08QZ) is change of base ring, not localization. Localization is now cited to Lemmas 8.4 and 8.6 (08R2, 08SF), and filtered colimits to Lemma 3.4 (08S9).
- Stacks 0D6F (Lemma 21.20.2) is the cohomology of a slice; its gloss was made accurate.

Two mismatches reported by the helpers turned out to be wrong, and nothing was changed for them:
- 08SH is Section 92.14, as the README says, and not Lemma 92.14.1.
- BS17 Proposition 11.41 is stated on p. 51, but the coconnective argument the README cites is in its proof on p. 53, as the README says.

The following locators were checked and found correct. I chose them as a sample beyond the 15 required, plus every locator the package author had flagged as unverified:
- every BS-proet §3 item (3.1.1 through 3.5.7) and Example 3.2.2;
- BS17: Definitions 2.5 and 11.1, Lemmas 3.16, 3.18, 11.20, 11.22, 11.23 and 11.36, Theorem 11.27, Proposition 11.25 and Corollary 11.35;
- HA: Construction 1.3.1.6, Proposition 1.3.1.10 (the horn-filler formula agrees symbol for symbol), Remark 1.3.1.12, 1.3.5.3, 1.3.5.15, 1.3.5.21, Theorem 4.7.3.5 and 7.1.2.13;
- HTT: 5.5.2.2, 5.5.2.9, 5.5.4.15, 5.5.7.2, 5.5.8.1 and 5.5.9.3;
- Fargues–Scholze Lemma IV.2.20 (flagged by the author);
- Berkovich motives Definition 2.7, Remark 2.8 and Lemma 10.5 (flagged by the author);
- Nikolaus–Scholze A.5, A.7, A.8, A.14–A.17, I.3.3, I.3.5, I.3.6 and III.3.2;
- ECD 17.1, 17.2, 17.8 and 26.2;
- all 72 Stacks tags the README cites, opened tag by tag.

### D. Other corrections

- The Check on `ℤ[a, b, c, d]/(ab + cd − 1)` called it "smooth of dimension 4 over ℤ". It now says relative dimension 3, Krull and global dimension 4, and notes that the Zariski cover gives a sharper bound.
- The open-immersion non-example for descendability now gives the actual reason: tensoring kills complexes supported on the complement, so extension of scalars is not conservative.
- In `reconstruction_counit`, the field was renamed (R = 𝔽_p[[x, y]]) to avoid a clash with the index k.
- The Summary, the E0, E1 and E2 introductions, the layer table, Conventions, Dependencies, Downstream consumers and References were updated to match. In particular, DeformationAndDerivedPatchingAlgebra and IgusaVarietiesAndTorsionConcentration are now listed as consumers of E1.6.

### E. Suggested.lean

- `IsReplete` is restated with the binders of SchemeAndStackFoundations' `Proetale.IsReplete`, and its docstring says that it restates that declaration. The duplicated tests `IsReplete.types` and the presheaf `example` were removed.
- A section `RegularRings` was added, with `isRegularRing_projectiveDimension_le`, `isRegularLocalRing_of_projectiveDimension_residueField`, `frobenius_flat_of_isRegular` and `isRegular_of_frobenius_flat`. All are stated against Mathlib's `IsRegularRing`, `IsRegularLocalRing`, `HasProjectiveDimensionLE`, `frobenius` and `RingHom.Flat`.
- Two docstrings named the wrong target and were corrected (`categoricalEquivalence_of_comp_left`, `frobeniusRootIdeal_root_mem`).

## Adversarial mathematics pass

| Statement | Instances computed | Result |
| --- | --- | --- |
| dg nerve 2-simplex, `dη = g∘f − h` (E0.6) | n = 2 from the Construction 1.3.1.6 formula | correct |
| horn filler, n = 2, j = 1 | f_{0,2} = g∘f with zero homotopy | correct, and matches HA 1.3.1.10 |
| ℤ ⊕ ℤε non-equivalence (E0.2, E0.6) | H₀ agrees; π₁ Map(x, x) = ℤ against 0 | correct |
| right mapping space of a nerve | the constant simplicial set on Hom_A(x, y) | correct |
| N(Mod_ℤ) not stable | the square 0, 0, 0, ℤ: pullback but not pushout | correct |
| homotopy pullback ∗ ×_{K(ℤ,1)} ∗ | ℤ | correct |
| Map_{Cat∞}(Δ[0], Δ[1]) | 2 components, while Fun(Δ[0], Δ[1]) = Δ[1] is contractible | correct |
| coCartesian sections for B = BG with G abelian | the centre of G gives spurious automorphisms in Fun(B, B) | correct |
| ⊕_ℕ ℤ not compact in D(ℤ); ℕ not compact in Spaces | identity does not factor through a finite stage | correct |
| (ℤ/p) ⊗ᴸ (ℤ/p); RHom(ℤ/p, ℤ); Map(ℤ/p, ℤ/p[1]) | H^{−1} = H⁰ = ℤ/p; ℤ/p in degree 1; π₀ = π₁ = ℤ/p | correct |
| (ℤ/p)[0] not K-flat | tensoring with the acyclic cone of [ℤ →p ℤ] → ℤ/p | correct |
| restriction of scalars ℤ/p → ℤ does not preserve injectives | ℤ/p is self-injective but not divisible | correct |
| Koszul K_A(0) | H^{−1} = H⁰ = A | correct |
| J_f = √(f) and the colimit presentation | transitions f^{1/p^n − 1/p^{n+1}}; J_0 = 0, J_1 = R; t^{1/p} ∈ J_t ∖ (t) | correct |
| Tor₂^R(R/(x), R/(y)) ≠ 0 for R = (k[x, y]/(xy))_perf | witness y ∈ Ann(x) ∖ y·Ann(x), by a monomial grading | correct |
| R/J_t has Tor dimension 1 | Tor₁(R/J_t, R/(t)) = (t)/tJ_t ≠ 0 | correct |
| Frobenius on 𝔽_p[ε]/(ε²) | not flat (kills ε) | correct |
| open and closed balls (E1.7) | Hom_V(𝔪, open ball) = closed ball | correct |
| cohomology base change fails without flatness | K = (ℤ/p)[−1], B = ℤ/p: 0 → Tor₁ = ℤ/p | correct |
| E × E Poincaré bundle (removed target) | f_∗L = 0 against H⁰ = k on the zero fibre | correct, but the target was removed as a duplicate |
| ℤ ←p ℤ ←p ⋯ | lim = 0, lim¹ = ℤ_p/ℤ, not pro-zero | correct |
| Milnor and lim¹ products (BS17 11.22) | matches the source proof for I = ℕ (index 2m) | correct |
| `truncation_cohomology_window` bound | recomputed from the triangle H^{−n−1}(E)[n+1]; b ≡ 0, m = 0 gives N = 1 | correct |
| local-dimension reduction b_V(t) = d_V + max(0, t) | dominates max(d_V, t) | correct |
| Ψ(A[1]) towers; RHom(ℤ[1], ℤ) = ℤ[−1] against contractible Map | computed | correct |
| BG with finite G | terminal G-set not weakly contractible; free G-sets cover | correct |
| continuous G-sets for infinite profinite G not replete | G/U_n tower has empty smooth limit | correct |
| hypercover non-example ({0, 1} → {0, 1}²) | the diagonal is not surjective | correct |
| uncountable injection system | surjective restrictions, empty limit | correct |
| ℤ_p → 𝔽_p not descendable | I^{⊗m} → ℤ_p is p^m; the Amitsur totalization is still ℤ_p | correct |
| locally nilpotent quotient | x_n^n ≠ 0, so I is not nilpotent and not descendable (BS17 11.21) | correct |
| Gorenstein index d + 1 | Q flat, F^{⊗m} = Q^{⊗m}[−m], Ext^m = 0 for m > injdim | correct |
| bounded totalization windows | Tot_r for r ≥ max(0, b − k + 1); Tot₁ for sets, Tot₂ for groupoids | correct |
| Witt vectors on 𝔽_p ⊗ᴸ_{𝔽_p[x]} 𝔽_p | π₁ = ∏_ℕ 𝔽_p; π₀W(𝔽_p) = ℤ_p | correct |
| derived completion | L_p ℤ = ℤ_p, L_p ℤ[1/p] = 0, L_p ℚ_p = 0; ⊕ℤ_p not complete | correct |
| Koszul tower for generator 0 | K ⊕ K[1] with the K[1] transitions zero | correct |
| ℤ_p ⊗ᴸ_ℤ ℤ_p not p-complete | rationally ℚ_p ⊗_ℚ ℚ_p ≠ ℚ_p | correct |
| system ℤ/p[0] with identity transitions | (ℤ/p) ⊗ᴸ_{ℤ/p²} ℤ/p has H^{−1} ≠ 0 | correct |
| constant sheaf ℤ_p against R̂_X in light condensed sets | locally constant against continuous maps | correct |
| L_{k[ε]/ε²/k}; L_{k/k[ε]/ε²}; H^{−2}L for (x, y)² | εB; H^{−1} = H^{−2} = k; nonzero (non-Koszul syzygies) | correct |
| free E∞-algebra over 𝔽₂ in degree 2 | H_∗(BΣ₂; 𝔽₂) | correct |
| new: global dimension Checks | ℤ/p has pd 1; κ over k[ε]/ε² has infinite pd; residue field of k[x₁, …, x_d] has pd d | correct |
| new: finality Checks | {0} → Δ[1] not final (empty comma); ∂Δ[2] not weakly contractible (maps to the nerve of ℤ) | correct |

**Generality audit.** The Lean declarations are either the README's statements or point-site cases that are labelled as such. The README's E4.5 hypothesis (a regular sequence, no Noetherian hypothesis) differs from BS-proet §3.5, which assumes R Noetherian. The README states this choice explicitly, and it is sound: the Koszul tower replaces Artin–Rees, as BS-proet Lemma 3.5.4 itself notes for regular ideals.

## Notes for other roadmaps and for the maintainer

- **Moved down to this roadmap (E1.6).** The global dimension of regular rings (`isRegularRing_projectiveDimension_le`, `isRegularLocalRing_of_projectiveDimension_residueField`) moves here from DeformationAndDerivedPatchingAlgebra R03.3; that plan should import it. Kunz's theorem (`frobenius_flat_of_isRegular`) had no owner before. DerivedDeRhamCohomology §5.18 (its "proof input gap") and IgusaVarietiesAndTorsionConcentration should import it from here.
- **Upstream note.** SchemeAndStackFoundations §2.17 names `isReplete_of_locallyWeaklyContractible` but does not define "locally weakly contractible". This roadmap's `IsLocallyWeaklyContractible` (E2.5, BS-proet 3.2.1, with coherent covers) is that predicate; whichever implementation lands first should be shared.
- **Upstream note.** The explorer package of DiamondsAndVStacks numbers its Layer 0 subsections §0.n. Its upstream pull request #820 uses D0.n and already defers the Čech and Leray comparisons to SchemeAndStackFoundations §§2.1–2.2; this package now cites D0.17 and D0.18.

## What remains

Nothing blocks the draft pull request. Other locators inherited from the packets that I did not sample keep the package author's checks.

## Checks run

- `lean-check research/blueprint/packages/EnhancedDerivedSheaves/Suggested.lean` (Mathlib 082e2d37e8): exit 0, 24 warnings, all `declaration uses sorry`.
- `python3 research/blueprint/intake.py check-files` on README.md, Suggested.lean and metadata.toml: 0 problems.
- By script:
  - every packet node and API name maps to the README;
  - every name in a *Needs:* line is a README target stated earlier, or a Mathlib, Tau Ceti or roadmap citation, with no forward references;
  - every definition keeps at least three Checks.
