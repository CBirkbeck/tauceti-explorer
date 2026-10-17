# Independent package review: ModularityAndLanglandsExtensions, round 3

**Verdict: accepted.** With the fixes below applied, the package is ready for the draft TauCetiRoadmap pull request. Three ownership questions (§5 below) are for the maintainer. They concern neighbouring plans and the scope of Layer 5, not defects of this package.

Issue [#10232](https://github.com/CBirkbeck/tauceti-explorer/issues/10232), job `REV-PKG-ModularityAndLanglandsExtensions~3`. Reviewer Claude, session `claude-X031vr`, 2026-10-17; the bot confirmed the claim in [comment 6240512507](https://github.com/CBirkbeck/tauceti-explorer/issues/10232#issuecomment-6240512507). Input: `origin/main` at `a97d6c079`. I took part in none of the package jobs (PKG, PKG~2 and PKG~3 were Codex sessions `codex-8M65j7`, `codex-ajs4yM`, `codex-3KG6Vj` and `codex-4WaW5P`) and none of the earlier reviews.

I read the whole README (4,204 lines; 157 numbered targets after the change below) and the whole Suggested.lean. I also read the PKG~3 handoff, the round-2 review, the tier order and the neighbouring packages named below. The packet, the reader document and the neighbouring packages were not edited.

## 1. Fixes made

1. **Assertion record retired (old §0.1).** `EndpointRecord` was a proof-carrying status record with Checks such as "2+2=4", cited to Calegari–Geraghty Theorem 1.1(1). It is bookkeeping, not mathematics. It is replaced by a Conventions paragraph (same anchor): conditional results take their unproved inputs (TWFL with the trace-formula inputs, Conjecture B, `CNExceptionalCurveData(F)`, the regular-weight Serre statement) as explicit premises, and conjectures (§§0.4, 3.10, 5.2, 5.3, 5.6, 5.10) are proposition-valued definitions. Layer 0 is renumbered 0.1–0.4 and retitled in README and Lean, and its 13 "Needs" entries and three status phrases were rewritten. No other section number changed.
2. **Mixed-parity symmetric powers (§§4.22, 4.35, 4.37).** Newton–Thorne prove Theorem 6.5(1) from Theorem 6.4 and *Thorne 2024, Theorem 8.1* (SP_n ⇒ SP′_n; arXiv:2212.03591v2, p.48). They do not use Clozel–Thorne III Theorem 7.1, which the README credited. Thorne's Proposition 8.3 states that the published proof of the finite-place part of that theorem "appears incomplete" and supplies the argument; the infinite places need a further step (restriction to ℂ^×, and for odd n a sign fixed by ω_Π=ω_π^{m(2m+1)}). §4.22 now states the complete reduction with Thorne's construction, and §4.35's proof follows Newton–Thorne's actual route. §4.37 notes the completion, and Thorne 2024 is added to References.
3. **§2.51 (Qian Theorem 1.4).** The README's hypothesis l>n is hypothesis (4) of ACC+ Theorem 6.1.2 (ACC+ PDF p.134), which the proof applies. Qian's arXiv v1 statement omits it. This is now said explicitly, with the ACC+ locator.
4. **Hidden outside-order citations.** Proof sketches in Layer 2 and §4.22 cited PotentialAutomorphyInfrastructurePartII stages by raw ids: `PL.0/…`, `PL.5/pd-automorphy-lifting`, `pd-automorphy-lifting`, `dwork-potential-ordinary-automorphy`, `ordinary-lifts-with-local-conditions`, `potential-diagonalizability-criteria (2)`, `automorphy-twist-and-soluble-base-change`. That roadmap is outside the 94-roadmap order, and these pieces were already moved down into this package (§§2.1–2.2, 2.14–2.17). All such references now point to the package's own sections, or to AG2.0/AG2.2 and PotentialAutomorphyInfrastructure Layer 2.
5. **Packet residue.** About 40 bare packet slugs in proof prose became § links; every § link was checked against its anchor's number. Fixed: the `PM R24.5/…` and `AL.2/…` ids, "[sub-item …]", "test so3_generic_iff", "requested from AL.3", "remains a requested export", "Request the …", "This package owns", "that node could not claim", "theorem nodes of Layer …", and "Exact twist/descent … exports remain requested". 62 lowercase slug labels such as "(rs boundary nonvanishing)" and "(moret bailly theorem incomplete skolem data have integral points)" became readable labels. 13 duplicated Needs/Dependencies items were removed.
6. **Unverified journal pages removed.** Five "Invent. pp. … per routed locator(s)" page claims were deleted; the verified arXiv v1 locators remain. Two duplicated locators (§1.2, §5.11) were merged; KW §10.2 now reads pp.20–21.
7. **§1.10.** A self-referential Check ("For F = ℚ it agrees with [itself]") and a self-referential remark were replaced by a discriminating base-change Check: π=AI_{L/F}(θ) has non-cuspidal BC_L(π)=θ⊞θ^c, so the cuspidal-domain law does not apply.
8. **§5.2 Check.** "G′={1}, G=GL₁: functoriality says the trivial character is automorphic" is correct only for the trivial L-homomorphism. For w↦(r(w),w) it is global class field theory; the Check now says both.
9. **Duplication with SmoothRepresentationsOfLocalGroups SR.6** (tier 2, TauCetiRoadmap PR #785). §5.8 rebuilt the integral finite-wild cocycle scheme (finite presentation, flatness, fibre dimension, ℓ-adic continuous extension, wild strata), and §5.9 the excursion algebra. Both are planned in SR.6.1–SR.6.3. They are now imported. §5.8 keeps what is new here: the local-complete-intersection property, the quotient stack, Perf/Coh and singular support, and perfect generation. §5.9 keeps the action through the spectral action. §5.7 cites SR.0d for the derived smooth category. Scope, C-CATEGORICAL and Needs were updated.
10. **Agreement with the current Tau Ceti library (§3.1).** `TauCeti.HeisenbergGroup` (3×3 unipotent, law z+z′+xy′) is the polarized rank-one case of §3.1's Heisenberg group. A new Check gives the coordinate change z=t+xy/2 in characteristic ≠ 2; I checked it by hand. `TauCeti.hermiteFunction_oscillator` (eigenvalue 2m+1) gives the Mp₂ weights m+1/2, which pins the existing 1/2, 3/2 Check. Both are named in Scope.
11. **References.** Ten references were cited by name but never linked (Gulliksen, Jorgensen, Arinkin–Gaitsgory, KPX, Nakamura, Hellmann–Schraen, Emerton Jacquet, Gan–Savin, Gelbart–Jacquet, Fresán–Sabbah–Yu); each is now linked at its use. Eight bold-label entries were normalised to the list format, and the duplicated Schmidt 2017 entry was merged.
12. **§1.3 supplier names.** The ClassicalSerreModularity results are named by their stated Lean names rather than node ids.
13. **Suggested.lean.** Six unit-test `example`s were proved by `sorry`; all six now have real proofs:
    - the positive F₇ sandwich, using `ProjGenLinGroup.mk_surjective` and `map_id`;
    - the F₅ and a=0 negative controls;
    - the two sign-kernel examples;
    - the non-parallel weight example.

    The numerical-witness docstrings now name the README Check each one pins. The Layer 0 heading matches the README. The closing comment no longer lists the removed assertion records.

## 2. Source checks

The sample is `random.Random(10232).sample` of the 158 numbered subsections. I read each primary location myself; the PDFs were downloaded to scratch, and the CG 2020 page was viewed as an image because its text layer is garbled.

| Target | Primary location read | Result |
|---|---|---|
| 1.1 | NT I v3 §2 p.34 (accessible refinement), Def. 2.23 p.40 | Match. |
| 1.3 | KW I author copy Thm 10.1(ii) p.20; §5 begins p.7, compatible-system definition p.8 | Match. |
| 1.6 | NT I v3 Introduction "Context", p.1 | Match (all-place lift along R). |
| 1.7 | NT II v2 §2 and Thm 2.1, p.5 | Match: p^a>max(5,2n−1), PSL₂⊂Proj r̄⊂PGL₂(𝔽_{p^a}), n≥1, weight 2, non-ordinary. |
| 2.50 | Qian v1 Thm 1.1 p.1, Lemma 3.10 p.20, proof pp.21–24; thesis Remark 3.0.13 printed p.55 = PDF p.62 | Match. |
| 2.51 | Qian v1 Thm 1.4 p.2, proof p.26; ACC+ Thm 6.1.2(4) | **Fixed** (fix 3): l>n comes from ACC+. |
| 2.52 | CN v3 Thm 1.1 (Cor. 7.1.2) p.2, Thm 1.2 (Cor. 6.1.2) p.3 | Match. |
| 3.1 | Gan–Takeda v3 setup p.1, Thm 1.2 p.2, quaternionic remark p.3 | Match (char ≠ 2, any residue characteristic, Minguez for the split case). |
| 3.4 | Arthur 2011 manuscript Thm 1.5.3 on PDF p.64 = printed p.48 (offset 16, consistent with (1.4.8) p.35, Hyp. 3.2.1 p.137) | Match. |
| 3.20 | Adams–Johnson (2.1) p.277; Def. 2.9, Lemma 2.10, Def. 2.11 p.281; Thm 10.3 p.307 | Match (weak inequality ≥0). |
| 3.31 | Pilloni (cleared copy) Prop. 15.2.4.1 p.109; Schmidt 2017 §2.3 pp.2390–2391; Schmidt 2018 §1.1 p.3088, §1.2 p.3090 | Match. |
| 3.32 | CG 2020 Duke copy p.29 = publ. p.829, Thm 5.6(1)–(3) | Match; τ also reproduces CG Remark 5.12 (computed). |
| 4.6 | NT I v3 Thm 3.2 pp.53–54 | Match. |
| 4.36 | NT Hilbert v2 Thm 6.5(2) and proof p.50 | Match. Reading Thm 6.5(1)'s proof here led to fix 2 (§4.35). |
| 5.1 | CKPSS Thm 1.1 p.169, Thms 7.1–7.2 pp.195–196; BCG v3 Remark 2.5 p.8 | Match (trivial central character of the lift). |

Claims about errors in sources, checked:

- **Henniart 2009** prints ω_R² for the central character of ∧²R on PDF pp.2, 5 and 12. For a four-dimensional parameter, det ∧² = det³ (example 1⊕1⊕1⊕χ gives χ³). The README's correction stands.
- **Wang**'s table on p.5 gives +6 at −I for the six-dimensional SL₂(𝔽₅)-module. Orthogonality with the trivial character forces −6, since the module is faithful. The README's correction stands.
- **Pilloni Remark 5.3.2**, pp.25–26, with footnote 5: the Hodge–Tate weights are (0, r−2, r+k−1, k+2r−3) and the cohomological condition is r≠2, k+r≠1, k+2r≠3. This confirms the Lean definition `singularWeightHodgeList` and its `nodup_iff`.

## 3. Gaps and citations

- **Tier audit.** This roadmap is tier 26. Every tiered roadmap it cites lies in tiers 2–25. None of the 94-order names above 26 appears, and FoundationsAndLibraryIntegration and `UPSTREAM:` ids are absent. After fix 4, no PotentialAutomorphyInfrastructurePartII, MetaplecticAutomorphicForms or ExcursionOperatorsAndSpectralAction reference remains.
- **One outside-order citation remains, deliberately.** §2.30 cites EllipticCurveModularityPartIIGL2TypeAbelianVarieties GT.6 (geometric ℚ-curves over quadratic fields), which is upstream as TauCetiRoadmap PR #1036. It enters only the exceptional branch of the individual endpoint §2.52, which is already conditional on `CNExceptionalCurveData(F)`. The draft PR should state its dependence on #1036.
- Suppliers checked live: PadicFunctionalAnalysis, CompactOperators and RigidAnalyticGeometry are on TauCetiRoadmap main (`350e970ce`); LocallyAnalyticDistributions is PR #854 (tier 4).

## 4. Duplication against Tau Ceti

I searched by object in the current library (`a91d3aaf`) for Heisenberg, oscillator, Satake, Ramanujan, Sato–Tate, symmetric power, Artin, Langlands, theta, eigenvariety, Dwork, Moret–Bailly, compatible system and GSp. I also read the matching READMEs of the read-only roadmap checkout (`0d144d04`, on the PR #785 branch) and of live main: ModularForms, EllipticCurves, CompactGroups, ClassicalGroups, GlobalNumberFields, Chebotarev, SmoothRepresentationsOfLocalGroups.

- New cross-references: the Heisenberg group and Hermite oscillator (fix 10), and SR.6's cocycle scheme and excursion algebra (fix 9).
- Already handled as boundaries: Satake parameters and angles (ModularForms makes Ramanujan–Deligne a non-target; the angle is conditional), and the elliptic Tate-module representation and determinant.
- No other target exists upstream. Nothing else was removed.

## 5. For the maintainer (not blocking)

1. **Layer 5 geometrization (§§5.7–5.10).** The accepted packet node for §5.10 says the objects of Fargues–Scholze's categorical conjecture are "owned by the geometrisation roadmaps". The FIX~adv round instead built Bun_G, geometric Satake, the parameter stack and the spectral action here (§§5.7–5.9), about 30 KB. Nothing in this roadmap consumes §5.10. These sections overlap GeometricSatakeAndFusion (accepted package), BunGAndNewtonStrata and ExcursionOperatorsAndSpectralAction, all outside the 94-roadmap order. **Recommendation:** decide either (a) to keep §§5.7–5.10 here and have those roadmaps import them, or (b) to drop §5.10 and §§5.7–5.9 to the geometrization roadmaps, since the Caraiani–Newton chain does not need them. I did not delete accepted targets.
2. **CrystallineLocalGlobalCompatibilityCM (tier 27, accepted package).** Its Layers 1–7 and 9 plan Caraiani–Newton §§2–5 (P-ordinary control, degree shifting, crystalline local–global compatibility, Theorem 5.2), which overlap §§2.3, 2.4 and 2.6 here. This roadmap is lower in the order, so the rule makes CLGC import these targets, as EllipticCurveModularityImaginaryQuadratic already does for §2.6. CLGC needs a revision pointing at §§2.3–2.4 and 2.6.
3. **Size.** The README is 604 KB. If a smaller upstream unit is wanted, the natural split is Layers 0–2 and 4 (modularity, potential automorphy, symmetric powers) against Layers 3 and 5 (classical-group packets, Langlands frontier).

## 6. Unit tests

Every subsection that exposes an API has at least three Checks (scripted count). The new or replaced Checks (§§1.10, 3.1, 5.2) each fail a plausible wrong definition. Theorem targets keep their negative controls.

## 7. Lean

`lean-check` on Suggested.lean (Mathlib `082e2d37e8`): exit 0, 11 warnings, all `declaration uses sorry` on theorem statements. There are no errors and no other warnings, and no `example` uses `sorry`. `check_sorry_data.py`: exit 0. 350 lines.

I checked these signatures against the README and against the sources:

| Declaration | Checked against | Result |
|---|---|---|
| `singularWeightHodgeList`, `_length`, `_nodup_iff`, `_r_two` | Pilloni Remark 5.3.2 | The six pairwise differences reduce to the three stated exclusions because k+1>0. |
| `ProjectiveImageSandwich`, `.bound`, `.mono`, `.conjugation` | NT II Theorem 2.1 | `.mono` holds because 2m−1 ≤ 2n−1. Conjugating ρ by d is absorbed into c. |
| `orthogonalSignKernel` and its three lemmas | Arthur (1.4.8) | Match. |
| `IsParallelWeight`, `.twist`, `parallelWeight`, `_independent` | BCGNT §1.6 | Match. |

No `True`, `Prop := sorry` or sorry'd data. Light definitions only.

## 8. Adversarial pass (instances computed in this run)

| Statement | Instances tried | Outcome |
|---|---|---|
| §0.3 Hodge list | (2,1), (0,2), (0,1), (3,2); symbolic pairwise differences | Exactly r≠2, k+r≠1, k+2r≠3. |
| §1.7 / Lean sandwich | 𝔽₇, n=3; 𝔽₅; a=0; 𝔽₈, n=4 | Strict bound; all four now proved in Lean. |
| §1.10 base change | π=AI(θ) versus π not induced from L | New Check (fix 7). |
| §1.14 ∧² | diag(a,b,c,d); 1⊕1⊕1⊕χ; twist by χ | det³ and χ²; Henniart's ω² misprint confirmed. |
| §2.11 Dwork criterion | φ=diag(5,25), N e₂=e₁, Fil¹⁻³=⟨e₁+e₂⟩ | Nφ=5φN, t_N=t_H=3, the only stable line has t_H=0<1. The counterexample stands. |
| §2.18 supersingular | ℓ≥5 with Hasse | ℓ∣a_ℓ forces a_ℓ=0. |
| §2.23 genus | X(3), X(5), X(7), X₀(7) | 0, 0, 3, 0. |
| §2.30 conics | c=−33, 15, 12 | (3,2) solves the first; the other two have no ℚ₃-point (Hilbert symbol (−3,−1)₃=−1) and no real point. |
| §2.51 | l≤n | Excluded by ACC+ 6.1.2(4) (fix 3). |
| §3.1 Heisenberg; Mp₂ weights | z=t+xy/2 in characteristic ≠ 2; ψ_m | Law and commutator match `TauCeti.HeisenbergGroup`; weight m+1/2 (fix 10). |
| §3.4, §3.8 | N=1, 2; SO₃ with 1⊠ν₂, two quadratic blocks, one odd block for dual SO₃ | Types and component groups as stated. |
| §3.13 | SL₂ with Klein-four image; dihedral θ/θ^c not quadratic | S=(ℤ/2)², packet of size 4; S=ℤ/2. |
| §3.32 | CG Remark 5.12, μ=(a,b), w=a+b−6 | All four τ entries agree. |
| §4.13 icosahedral | B-dimensions; central signs; Sym⁵, Sym⁶ | Squares sum to 120; the faithful modules have even dimension; 6-dimensional sign −1; Sym⁶τ=3′+4 with sign +1. |
| §4.19 purity | Jacquet–Shalika for infinitely many n | |α|≤q^{m/2}; equality via det. |
| §4.26 | N𝔭=9, k=2 | Bound 6. |
| §4.35 | infinite places, n even and odd | Needs Thorne 2024 §8 (fix 2). |
| §5.1 | CKPSS 7.1/7.2 | Trivial central character of the total lift; summand types. |
| §5.2 | G′={1} with r trivial and nontrivial | Fixed (fix 8). |

## 9. Own words and checks run

- No verbatim source passages or section summaries were added. Cleared and public sources were read in place; nothing was copied into the repository.
- `python3 research/blueprint/intake.py check-files` on the four package files: 0 problems.
- `git diff --check`: clean. All internal links resolve, every reference is used, and every `[§k.n](#anchor)` matches its anchor's section number.
- `metadata.toml` is unchanged (`topic = "math.NT"`).

## 10. Source provenance

Accessed 2026-10-17; SHA-256 of the files read.

| File | SHA-256 |
|---|---|
| [NT I v3](https://arxiv.org/pdf/1912.11261v3) | `6d50b558a6182a8d1515a6715529a33079807bf405c8db775e4ed252f5a2f379` |
| [NT II v2](https://arxiv.org/pdf/2009.07180v2) | `0f08214ebe03344c2e2851be76c49213dc4adf7928ff561610b674c423a2a6bf` |
| [NT Hilbert v2](https://arxiv.org/pdf/2212.03595v2) | `6a156f7a5567226e0bd2209d5b237cbbc150dc10cfbd9ffd060a3245328cb82c` |
| [Thorne 2024 v2](https://arxiv.org/pdf/2212.03591v2) | `372ed2cbe894a75e01f8292963eeb9a50ffe7236098f183e3784aa09c98343b1` |
| [KW I](https://www.math.ucla.edu/~shekhar/papers/results.pdf) | `3c389dc33e09fe847f5d8189ffd8915b5c1a73424e64e4fed6769829883bad82` |
| [Qian v1](https://arxiv.org/pdf/2104.09761v1) | `4110023d4691d628adbc96842793696978de962b6109044e5d32779160835415` |
| [Qian thesis](https://stacks.stanford.edu/file/druid:yn815wp7042/Thesis%20Final%20Version-augmented.pdf) | `22a4ae5094188762e36b3ffb13415662f21029767f78703941e9087350fe5ab8` |
| [Caraiani–Newton v3](https://arxiv.org/pdf/2301.10509v3) | `57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3` |
| [Gan–Takeda Howe v3](https://arxiv.org/pdf/1407.1995v3) | `aace7712911aecfd2e7361b98704fb73bfd474a7f13b6e88f6dc4b75fd7df966` |
| [Arthur 2011 manuscript](https://web.archive.org/web/20120511125150id_/http://claymath.org/cw/arthur/pdf/Book.pdf) | `e8227d7c636903c568b6903b5d585edb912028f27c52d8687f463aaef8e1275f` |
| [Adams–Johnson](https://www.numdam.org/item/CM_1987__64_3_271_0.pdf) | `4c5a4c42a0254d9efb06119d7bff2725582605be84a772ca3807355ef341e849` |
| [Calegari–Geraghty 2020](http://www.math.uchicago.edu/~fcale/papers/Siegel.pdf) | `fff305877c7e6b9d32ca9a8b4a56f7f3b343695fc737184d1a3a1b78f195cfa5` |
| [Schmidt 2017](https://math.ou.edu/~rschmidt/papers/hodge.pdf) | `291401f12a55595c20cab21ef4d764fed9d774c3dcf50186bbd5b5bcad30c3b2` |
| [Schmidt 2018](https://sites.math.unt.edu/~schmidt/papers/packets_paramodular.pdf) | `e9e3fb40c1254487c1548b389f852884213ad28862b76f9b51111b2ad57abc9f` |
| [CKPSS](https://www.numdam.org/item/PMIHES_2004__99__163_0.pdf) | `ebc11f9b6ca0803ba296f9c1735df14064182a74a978ab258152ee3f882858a4` |
| [BCG v3](https://arxiv.org/pdf/2309.15944v3) | `abfa9eac9984aa5d0bd5e1700a08993bc3baa6f8435d18f5f0e37f5a84769684` |
| [Henniart 2009 (archived)](https://web.archive.org/web/20150922001048id_/http://www.ams.org/distribution/mmj/vol9-1-2009/henniart.pdf) | `f4b6d47675808e9a37a1824a239fc6bf76153bfcaa8b7ac1c8abab1087a1b239` |
| [Wang v3](https://arxiv.org/pdf/math/0301074v3) | `52c3066f0b03109957b4c3ff0ec154949aadc80a2bb5ba086e27483c360fe898` |

The Pilloni and ACC+ author copies were read in the cleared library under the catalogue's names, without copying.
