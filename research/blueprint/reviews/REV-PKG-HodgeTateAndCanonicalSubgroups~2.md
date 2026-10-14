# REV-PKG-HodgeTateAndCanonicalSubgroups~2

This is the independent review of revision 2 of the roadmap package `research/blueprint/packages/HodgeTateAndCanonicalSubgroups/`, which holds README.md, Suggested.lean and metadata.toml.

- The package was written by Codex, session `codex-u7tIH6` (PR #9808).
- The first package review, Claude session `claude-2BRfhd` (PR #9825), returned it as `needs_changes`.
- Claude session `claude-P5lshb` revised it (PR #9850, handoff `handoff/PKG-HodgeTateAndCanonicalSubgroups~2.md`).

The accepted plan is in three packets:

- `packets/HodgeTateAndCanonicalSubgroups.json`, the whole-roadmap packet;
- `packets/HodgeTateAndCanonicalSubgroups--T0.json`;
- `packets/HodgeTateAndCanonicalSubgroups--T6.json`.

Reviewer: Claude (Opus 5.5), session `claude-2BpkEQ`, 14 October 2026. I wrote none of the package, the plan, the assembly or the earlier reviews.

**Verdict: `accepted`.**

- Revision 2 resolves both defects of the first review: unsupplied supplier contracts, and duplication with lower-tier packages.
- I found and corrected in place two wrong Checks (1.4, 4.6) and two ambiguous ones (0.25, 3.12), four wrong section numbers in locators, a missing References entry, and about fifty supplier citations whose labels or wording did not match what the supplier states (35 of them ordinal ShimuraCompactifications labels).
- No defect remains that needs another revision.
- Section 6 lists coordination points for the maintainer. They concern other packages, not this one.

## 1. Scope and method

- **README.** I read the front matter in full (Summary through How to read the build, 176 lines), every one of the 21 targets added in revision 2, and the 20 targets it substantially rewrote. A section-level diff against the first-review version picked these out: 0.12, 0.17, 0.18, 0.23, 1.2, 2.6, 3.10, 4.6, 5.5, 5.6, 6.2, 6.4, 6.12, 6.15, 6.17, 7.4, 7.29, 7.30, 7.36 and 8.1. For each I read the statement, hypotheses, proof route and Checks. The remaining targets were read in full by the first review and are unchanged apart from renumbering.
- **Sources.** I downloaded FAR10, FAR11, SCH15, SCH13, BHW, CDM12, ZIE, DLLZ-adic, DLLZ-RH, PS16, AIPH, HALO, PIL20 and AIP15.
  - Every SHA-256 equals the README's value. SCH13's hash is ed9187b3…, recorded now in the References.
  - I extracted per-page texts and checked 378 theorem-label and page pairs from the README's locators by script. Every label occurs on its cited PDF page. The 13 apparent misses were multi-locator parsing artefacts, and I resolved each by reading the page.
  - I read the source passages myself for every locator of the new targets: FAR10 §§1.1–1.2, Définitions 3–5, Lemmes 1–2 and Exemple 2; FAR11 §2.2.1, Remarque 1, Théorèmes 5–6; SCH15 §III.2.1 and Proposition III.3.1; SCH13 Corollary 3.17, Lemma 3.18 and Proposition 6.16; ZIE §§3.2–3.5; PS16 §§1.4, 1.8 and Appendix A; PIL20 Lemma 6.3.4.1 and §12.2.1; AIP15 Theorem 3.1.1 and §3.2; BHW Propositions 5.18–5.19; DLLZ-adic Proposition 4.1.14, the proof of Theorem 6.2.1 (p. 87), the proof of Proposition 5.3.13 (p. 78) and Corollary 6.3.5; DLLZ-RH Definition 3.1.7 and §§3.3 and 5.5.
- **Suppliers.** A Sonnet agent quoted, for each of 112 items in "Exact supplier contracts" and for 36 further *Needs* citations, where the supplier states it. It used the supplier's package README where one exists, and otherwise its packets. I read every partial or mismatched finding against the supplier text (section 3).
- **Duplication.** A second Sonnet agent searched the lower-tier packages, the packets of the unpackaged suppliers and current TauCetiRoadmap main for each of the 21 new targets (section 5). I grepped current Tau Ceti a91d3aaf for the new targets' objects, by object and by name: Fitting ideals with valuations, co-Lie and cotangent complexes, Verschiebung, filtered fibre functors, derived limits, projection formulas, p-divisible groups. Nothing there plans them. Its `fittingIdeal` is already cited, and its "Verschiebung" occurrences are provenance comments in the elliptic-curve isogeny files.
- **Scripts.** All 154 subsection anchors and internal links resolve with matching link text. No *Needs* line cites a later layer, and the *Needs* graph has no cycle. All 61 definitions and constructions have at least three Checks and are named in Suggested.lean. Backticks are balanced on every line.

## 2. The first review's defects

| First review §5 | Revision 2 | Verified here |
|---|---|---|
| 5.1 R07.1 contract: ω over O_C, Faltings complex, embedding, Fitting degree, BT quotient | new 0.24, 0.25 and 0.28; 0.5 already owns the complex; R07.1.40 cited for the embedding | R07.1.10–11, 14–15 and 40 state what is cited. FiniteFlat's scope assigns the Fargues degree and canonical subgroups here, and the README now says so. 0.24–0.28 are correct (section 4). |
| 5.1 R07.2, R07.6, A2, A4 | 0.12 proves Pilloni's Lemma 6.3.4.1; R07.2.21 cited; new 0.26 (co-Lie complex, with the isogeny Hodge triangle) and 0.27 (Verschiebung) | R07.2.21, R07.6.6 and A4.2–A4.3 state what is cited; PIL20 Lemma 6.3.4.1, p. 34. The README's character-lattice form is the correctly varianced version of Pilloni's cocharacter statement. |
| 5.1 P8 relative comparison, character compatibility, HT sequence over C | Layer 1 narrowed to finite K/ℚ_p; new 1.4 and 1.5 | 1.5 uniqueness uses SCH13 Proposition 6.16(ii) (H⁰(gr^jOB_dR) = 0 for j ≠ 0 over a discretely valued base), read on p. 39. The argument is sound. |
| 5.1 C4/C5, H2/H4, P9, R11.3, B1/R09.1, Ziegler, AdicSpacesPartII, H0, E1/E2, ALS/V8, interfaces | new 2.14, 3.11, 3.12, 5.13, 6.1, 6.18, 6.25, 6.28, 6.31, 6.36, 6.37 and 7.6; narrowed to Hodge-type data in Layers 7–8, to Siegel p ≥ 3 in 0.17 and 5.5–5.7, to discretely valued K in 0.18, and to the strict BHW range for p ≥ 3 | Each new target is stated with its hypotheses and sourced, and I checked each mathematically (section 4). The narrowings are recorded in "Scope and ownership". The strict range for p ≥ 3 is justified: FAR11 Théorème 6 and AIP15 §3.2 assume the strict inequality, and BHW prints ≤. |
| 5.2 PrismaticCohomology §8.60 | Layer 6 rebuilt on §8.60, old 6.17 deleted, the rest narrowed and renumbered | §8.60 states each item Layer 6 imports (12 items quoted). The one exception, composition and base change of Kummer étale maps, appears there only inside a proof, so I added it to 6.12 as item (7) (DLLZ-adic Proposition 4.1.14, p. 46). |
| 5.2 CohomologyComparisons §6.1 | new 7.15: the general constructions specialize to §6.1 | §6.1 constructs the Kummer and pro-Kummer sites, OB⁺_dR,log, θ_log, its filtration, its connection and the log Faltings extension for modular curves. 7.15 is the right compatibility statement under PROTOCOL §15. |

## 3. Supplier contracts: findings and corrections

Of the 112 contract items, the agent found 100 stated as claimed, 9 partial and none absent. Its 36 further *Needs* citations gave four label mismatches. Reading the supplier texts, I corrected the following.

- **ModularCurves 0G.** 0G builds the relative Grassmannian for the Hopf algebra of a finite locally free group scheme, not for an arbitrary finite locally free module. The contract and the boundary paragraph now say this. 2.7 already relied on R09.1's flag bundle, and they now say that too.
- **ReductiveGroups Layers 3 and 7.**
  - Layer 3 states fppf quotients, with representability "a theorem with hypotheses".
  - Layer 7 has parabolics and Levi decompositions, and keeps the dynamic approach only as a parallel route.
  - The contract now says exactly this. The dynamic parabolic and Levi of a cocharacter are cited from the pinned `TauCeti.Cocharacter.parabolic` and `TauCeti.Cocharacter.levi`.
  - In 2.9, the representing scheme of G/P_μ is ShimuraData D3's projective scheme of parabolics of type μ, and D3 is added to its *Needs*.
- **AbelianSchemesAndArithmeticModuli.** The polarized Weil pairings are A3.7, not A3.5.
- **AdicSpacesPartII.** R0 has no dimension target. 6.36 now cites R1 (affinoid domain equidimensional; R1.40), and the contract now says so.
- **AutomorphicBundles B3.** Nilpotent residues come from B3.7 and B3.general.2, the zero-exponent logarithmic extension, and the contract now names both.
- **ShimuraCompactifications.** This supplier has no package, so its ordinal labels C3.1, C4.4, C4.15, C5.16 and C5.19 pointed at nothing a reader can find. "C5.16" was also given as the toroidal model, which is a different node. All 35 occurrences now cite the stage and the node by name: C3 (refinement map), C4 (polarized degeneration data), C4 (semiabelian hasse boundary comparison), C5 (integral toroidal space), C5 (integral minimal space) and C5 (higher level toroidal normalization). The README already used this form for its other ShimuraCompactifications citations. The C2 contract now names what C2 has: smooth normal-crossings boundary at neat level, algebraization and canonical models.
- **ClassicalAdicEtaleCohomology.** Revision 2 cited four items under "H0" by slugs that exist in no packet: Huber's comparison, the normal-crossings open comparison, the lisse-tower derived limit and the ordinary cohomological dimension. They now cite the package sections that state them: §11.1, §1.3 and §11.2 (the last as `ordinary_etale_cohomological_dimension`).
- **EnhancedDerivedSheaves and DiamondEtaleCohomology.** The citations now carry their section numbers: E2.2, C5.8 and C7.9.

The rest are wording differences, not defects:

- AutomorphicBundles B2's "centralizer" is its Levi Z_G(μ_h).
- "Over an arbitrary C" in P8 means an arbitrary complete algebraically closed C, which is the node's hypothesis.
- PadicHodgeTheory's early primitive-comparison node has id prefix P8 although its stage is P8:local-rational.

## 4. Adversarial mathematics pass

| Statement | Instances tried | Outcome |
|---|---|---|
| 0.24 torsion degree | O_C/p^{1/2}; ℤ_p/p^n; V/π with e > 1; V/p ⊕ V/p versus V/p² (Fitt₁ = (p) versus V); the lattice shift | correct, except that the p^k-shift extension of χ assumes V p-adic: **fixed** (general V uses ϖ^k and k·r·v(ϖ)). Fargues prints "+ k" in Définition 5; the README's −kr is the additive normalization and says so. |
| 0.25 conormal of a p-divisible group over O_C | μ_{p^∞}, ℚ_p/ℤ_p, E[p^∞]; levels versus other subgroups | correct; the third Check was worded as if μ_p were the failing case: **reworded** |
| 0.26 co-Lie complex | μ_{p^n} over R with p-torsion, α_p over 𝔽_p, étale G, [p] on an abelian scheme; the cone of f* on H¹_dR as an extension of ℓ_{G^D}^∨[1] by ℓ_G | correct; the displayed "triangle" is Fargues's own (FAR10 Lemme 2) |
| 0.27 Verschiebung | V := (F_{A^∨})^∨ : A^{(p)} → A; ordinary versus supersingular E; the divisibility argument for V∘F = [p] | correct |
| 0.28 truncated quotients | (H/D)[p^a] = p^{−a}D/D using a + 1 ≤ n; ker F ⊂ G[p]; equal orders give an isomorphism | correct |
| 1.4 degree-one HT sequence | dimension count g + g = 2g; twist T_pA^∨ = H¹(A, ℤ_p)(1); ℙ¹ and a point | correct, except the third Check: the integral cokernel was called "of length 1/(p−1)", which is only Fargues's bound, and "length" is the wrong invariant: **fixed**. The cokernel is nonzero because E[p] is connected (no étale subgroup) and is killed by p^{1/(p−1)}. |
| 1.5 uniqueness | Hom(T, ω) ⊗ Ô sequence; H⁰(Ô(j)) ⊂ H⁰(gr^jOB_dR) = 0 for j ≠ 0 over K; why it fails over C | correct |
| 2.14 filtered fibre functors | GL_n stabilizer of W; trivial filtration; O(−1) ⊂ O² on ℙ¹ = GL₂/B (Zariski-locally split, not split: Ziegler's own example) | correct; ZIE section numbers **fixed** (Definition 3.4 is §3.2, Theorems 3.14–3.15 are §3.3) |
| 3.11 normal formal models | ℤ_p⟨T⟩; the non-normal model ℤ_p⟨S, T⟩/(S² − p²T) with T′ = S/p; congruences modulo (p, T) | correct; (4) needs X reduced, as (3) does: **fixed** |
| 3.12 𝒪_F-structure | Q_𝔭 ≅ 𝒪/π^a ⊕ 𝒪/π^b with a + b = ne: n ≥ 2, e = 1 and level n + 1; split and ramified quadratic F at n = 1 | correct; the split-prime Check wrote the subgroup ambiguously: **reworded** to A[𝔭₁](C) = (𝔽_p × 0)² |
| 4.6 BHW range | strict for p ≥ 3 (FAR11 Théorème 6, AIP15 Theorem 3.1.1), inclusive for p = 2 | the Check used ε = 1/(2p), the endpoint the narrowed range excludes, and "HALO's range (3.9)" should be 3.10: **fixed** (ε = 1/(4p) gives x ≥ 27/16 > 1) |
| 5.13 pushforward modulo p^k | the dévissage (f_*O p-torsion-free, left exactness, five lemma); modular curve | correct; PS16 Corollaire 1.7 and Proposition 1.5 are in §1.4, not §1.3: **fixed** in 5.13 and 0.17 |
| 6.1, 6.18, 6.25, 6.28, 6.31 | R/I; H¹(disc, μ_p) ≠ 0; n-th power cover of the punctured disc; Ẑ(1)^n of cohomological dimension n; the completion of ℚ_p(μ_{p^∞}); ℤ ←p ℤ with R¹lim = ℤ_p/ℤ | correct |
| 6.36 analytic cohomological dimension | the Krull dimension of the space Spa A equals dim A; the Tate curve with H¹(ℤ) = ℤ | correct (de Jong–van der Put 2.5.8, quoted in DLLZ-adic p. 87) |
| 7.6 relative finiteness | Tate curve over the punctured disc; R¹j_*𝔽_p of the punctured disc is 𝔽_p(−1) at 0 | correct |
| 7.29–7.36 Hodge type | Gᶜ = G for Hodge-type data (SV5); the Lieberman and Hodge-tensor route | correct; "(so Gᶜ = G)" had attributed this to neat level: **fixed** |
| Suggested.lean | `autFactor_mul`, `coordAction_mul` (both need only j(δ, z) ≠ 0 and j(γδ, z) ≠ 0); `weakCanonicalRange_of_strong` (S_n ≤ p^n for p ≥ 2); `isCofiltered` (T2: meets of compact opens are compact); the BHW endpoint examples at p = 2 and p = 5 | true as stated |

## 5. Duplication against lower tiers and current Tau Ceti

A Sonnet agent searched the 19 supplier packages, the packets of ShimuraCompactifications, ShimuraData and PadicHodgeTheory, and current TauCetiRoadmap main for each of the 21 new targets and for 6.12 (7). It quoted the nearest statement each time, and I read every quoted passage.

- **No new target restates a supplier's result.** Three have no counterpart at all: 3.12, 6.36, and the Pilloni–Stroh A.10 statement of 5.13 (ShimuraCompactifications lists the formal version only as an open request). The others meet only special cases or weaker forms:
  - 0.25 and R07.1.17 (complete DVRs);
  - 0.27 and R07.1.1 (affine and finite groups);
  - 1.4 and PadicHodgeTheory R06.5 (finite K/ℚ_p);
  - 6.1 and AdicSpacesPartII R5.40 (finite projective modules only);
  - 6.25 and 6.31 and ClassicalAdicEtaleCohomology §1 (trivial log structure, lisse towers);
  - 6.37 and the rank-one twist;
  - 6.12 (7) and its log-diamond and log-scheme versions in PrismaticCohomology §8.66 and CrystallineCohomology.
- **0.26 and FiniteFlatGroupsAndIntegralPadicHodgeTheory.** R07.1.11 and R07.6.6 already use the co-Lie complex ℓ_G, built from DerivedDeRhamCohomology §0.1, without stating its perfectness, determinant divisor or triangles. 0.26 now says that it supplies these properties of the same complex. It cites DerivedDeRhamCohomology §0.1, §0.5, §0.6 and §0.9 (cotangent complex, transitivity, base change, two-term models) instead of "DD.0 (square-zero deformations)", which is not what 0.26 uses. The contract and boundary paragraph were updated to match.
- **6.28 and DiamondEtaleCohomology C0.17 and C0.23.** These prove F ≅ Rν_*ν^*F for locally spatial diamonds, but on the quasi-pro-étale site. 6.28 is the statement on the pro-étale site X_proét of a perfectoid space, which the pro-Kummer étale site of Layer 6 uses. It is kept, with one clause added saying how it differs, as PACKAGE_REVIEW requires for a kept variant.
- **Current Tau Ceti a91d3aaf and TauCetiRoadmap main.** Neither plans any new target (section 1). In particular TauCetiRoadmap ReductiveGroups and ReductiveGroupsPartII have no filtered fibre functors.

## 6. For the maintainer (other packages)

- **PrismaticCohomology** (tier 13; its package is currently `needs_changes`). Layer 6 rests on its README §8.60. Its revision must keep §8.60's statements, or this README's citations must follow its new numbering.
- **Plan packets.** The packets lag the package. Revision 2 added 0.24–0.28, 1.4–1.5, 2.14, 3.11–3.12, 5.13, 6.1, 6.18, 6.25, 6.28, 6.31, 6.36–6.37, 7.6 and 7.15, and deleted the old 6.17, 7.28 and 7.29. This review added item (7) to 6.12.
- **Scope narrowings** that consumers must know:
  - Layers 7–8 cover only Shimura data of Hodge type. PerfectoidShimuraVarieties S6 had assumed general data.
  - 0.17 and 5.5–5.7 cover only Siegel data with p ≥ 3. Hilbert–Siegel GSp₄/F models and the p = 2 modified bundles are outside the roadmap.
  - Layer 1 works over finite K/ℚ_p.
- **Carried over from the first review:**
  - AutomorphicBundles B4.21 and B5.20–B5.22 expect inputs from this higher-tier roadmap.
  - PerfectoidShimuraVarieties 0.2–0.4 still plan the tower of 2.1–2.3.
  - PadicFamilies cites T5 at the same tier.

## 7. Files and checks

Changed: `packages/HodgeTateAndCanonicalSubgroups/README.md` (57 lines), `Suggested.lean` (two blank lines removed), `review.json`, and this report. metadata.toml is unchanged: `topic = "math.NT"` fits.

- `lean-check` on Suggested.lean exits 0 with four `sorry` warnings only, on the theorems at lines 43, 111, 139 and 154. The file has 227 lines and imports Mathlib only.
- I ran a `run_cmd` audit on a scratch copy. Only `isCofiltered`, `weakCanonicalRange_of_strong`, `autFactor_mul` and `coordAction_mul` depend on `sorryAx`. Every definition and instance is sorry-free.
- `scripts/check_sorry_data.py`: no offenders.
- `research/blueprint/intake.py check-files` on the package files and this report: 0 problems.
