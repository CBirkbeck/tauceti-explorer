# PKG-GL2ModularityLifting

Package for #10194, written by Claude, session `claude-1o16I8`, 2026-10-17. The bot confirmed the claim on comment 6235196244. The inputs were the three accepted packets of the plan: GL2ModularityLifting--R22.1 (accepted 2026-10-17, after its revision-2 review), --R32.3 (accepted 2026-10-14) and --R32.6 (accepted 2026-10-16). Their readers, the assembled reader and the earlier suggested files were also read. None of these inputs was edited. This job is packaging, not an independent review.

## Deliverables and validation

- `packages/GL2ModularityLifting/README.md` (about 345 KB, 2,929 lines). It contains the opening **Summary**, scope and ownership, conventions, exact supplier contracts with *Uses* and *Required in addition*, the conditional inputs from outside the build order, and twelve layers in build order (R22.1–R22.6 become Layers 1–6, R32.1–R32.6 become Layers 7–12). It also has worked examples, downstream consumers, corrections to the sources and references. The package has 121 targets: 30 definitions or constructions, each with at least three Checks (92 named tests in all), 106 API items, and Checks on every theorem section. Every target carries its locator and its *Needs* line.
- `Suggested.lean` (252 lines). It has `import Mathlib` plus two Tau Ceti modules, one module docstring, and the namespace `TauCetiRoadmap.GL2ModularityLifting`. Its real-bodied light definitions are `patchingRadius`, `pStar`, `normalizedWeight`, `panGoodComponent` and `panExtensionComponents`. It states twelve theorems by `sorry` and carries 20 `example`s, of which 17 are proved (`decide`, `norm_num`, `simp` or a short term) and three left as `sorry`. Two `#check`s pin the Tau Ceti baseline declarations. There is no sorry'd data, no `True` placeholder and no process comment.
- `metadata.toml`: `topic = "math.NT"`.
- `lean-check research/blueprint/packages/GL2ModularityLifting/Suggested.lean` exited 0 with 15 `declaration uses sorry` warnings and no other warning or error. It ran at Mathlib 082e2d3 and Tau Ceti f790474, with 90 GB of memory available; a single run, nothing left running.
- `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems. No local paths, packet ids or job ids appear in the package.

## Structural changes made while packaging (for the manager)

1. **Three restatements of lower-tier targets left the target list; their consumers now cite the owner.**
   - `R22.1/theorem-8-2-minimal-modular-lifts` restates SerreWeightAndLevelOptimisation R20.6/kw-minimal-modular-lifts (KW II Theorem 8.2). The R22.1~2 review had kept it only because PotentialModularityAndCompatibleSystems R23.3 and R24.1 cite it. **Those two consumers should cite R20.6/kw-minimal-modular-lifts.**
   - `R32.1/quadratic-cyclotomic-irreducibility` (DP Lemma 1.13) is the case F = ℚ, m = 1 of ArithmeticGaloisRepresentations R01.4/bad-dihedral-representations-and-the-oddness-criterion (b). §§8.8, 8.9 and 12.1 now cite R01.4.
   - `R32.5/p-three-residually-reducible-branch` is word for word OrdinaryAutomorphicFormsAndModularityLifting R21.5/theorem-a-at-three (Skinner–Wiles at p = 3, DP Theorem 1.7). A Sonnet duplicate sweep of all 50 R32 nodes and eight R22 nodes against 4,079 nodes of tier ≤ 20 packets found this as the only SAME pair. I read the pair. §§11.2, 12.5 and 12.8 now cite R21.5/theorem-a-at-three (§7.5 and §11.1 already did). The sweep's other overlaps (transfer-ordinary-three, ordinary-character-normalisation, transfer-residually-reducible, crystalline-weights-two-four-completion) add content of their own and stay.
2. **Upward citations of PotentialModularityAndCompatibleSystems (tier 22) removed.** The two R32.6 wrappers (`de-rham-lifting-and-almost-strict-systems` and `ramified-reducible-coefficient-prime`, now §12.7 and §12.6) cited R24.5/compatible-system and R24.5/rank-two-reducibility-independent-of-lambda. Following the R32.6 review's recommendation, both are restated on explicit "rank-two family data" (Conventions), with DP Definition 1.10's clauses (4)–(5) as hypotheses and irreducibility and oddness of the selected member as checked hypotheses. Nothing moves down. **PotentialModularityAndCompatibleSystems R24.5/R24.6 should compare its compatible-system carrier with this family data and import Layer 12.**
3. **New target §7.12 (geometric twists of modular representations).** The R32.6 packet had an open request to this roadmap's own Layer 7: classify the character χ in ρ ≅ ρ_h ⊗ χ, and exclude a weight-one witness. Its proof is short and uses only lower-tier inputs, so it is now a target. χ is a direct summand of ρ_h^∨ ⊗ ρ, hence de Rham (PadicHodgeTheory R06.2). A de Rham character is ε^m times a character finite on inertia (R06.2/hodge-tate-characters-are-de-rham). Kronecker–Weber (TauCetiRoadmap ClassFieldTheory, Layer 13) then makes the remaining character of finite order. Weight one would force equal Hodge–Tate weights. §12.8 now cites §7.12 instead of the stage R32.1.
4. **IntegralHeckeAndGaloisDeterminants is on TauCetiRoadmap main.** Its Layer 1 (semisimple reconstruction, generalized matrix algebras, two-block reducibility ideals, Ribet lattices) is cited as TauCetiRoadmap. The one item it lacks (Pan §2's completion and height-at-most-one comparisons) is listed under GlobalGaloisDeformations R04.2.
5. **HilbertModularVarietiesAndShimuraCurves R18.6 has no targets.** The seven citations of the stage now cite R18.3. The Khare–Wintenberger specialisations the old request listed appear under *Required in addition* in R18.3's contract.
6. **The 54 supplier requests** of the three packets appear as *Required in addition* under their suppliers, in our words, with the sections that depend on them. The fifteen suppliers are all of tier ≤ 20.
7. **Still cited outside the build order (needs a maintainer decision):** PadicLocalLanglandsForGL2Qp R30.6 and CompletedCohomologyAndLocalGlobalCompatibility R31.2–R31.6. Neither has a packet. The package states what each supplies as named inputs LL1–LL3 and CC1–CC5, with sources, in the supplier contracts. Every Layer 7–12 target that uses one names it in its *Needs* line and is conditional on it. This follows the precedent of the OrdinaryAutomorphicForms and Igusa packages. Caraiani–Newton needs only Layers 1–6 (6/12 layers), which do not use these inputs.

## Notes for other owners

- ClassicalSerreModularity R33.x nodes citing `R32.1/quadratic-cyclotomic-irreducibility` or `R32.5/p-three-residually-reducible-branch` should cite ArithmeticGaloisRepresentations R01.4 or OrdinaryAutomorphicFormsAndModularityLifting R21.5/theorem-a-at-three directly.
- AutomorphicGaloisRepresentations R19.3/classical-newform-irreducibility cites PotentialModularityAndCompatibleSystems R24.5/character-system, an upward edge in that roadmap. This roadmap uses R19.3 (§12.6–§12.8), so the edge should be resolved there.
- The R22.1~2 review's notes still apply: ArithmeticGaloisDuality R02.6 states KW II Lemma 7.10 for one place, where KW II states it for a finite set; PotentialModularityAndCompatibleSystems R23.1 should import R02.4/grunwald-wang.

## Source check

Public sources were downloaded into scratch and converted page by page. Three Haiku agents located the cited items and returned short quotes, and I read each quoted passage. The KW II file's SHA-256 (53f45f8b…) matches the packet record. Nothing was committed from the sources.

| README | Locator | Result |
| --- | --- | --- |
| §1.1 | KW II §9.1.1, pp. 78–79 | Confirmed: definite D ramified exactly at Σ and ∞; D_v^× at v ∈ Σ when p = 2; 𝔪 ⊂ 𝕋_ψ(U). |
| §1.4 | KW II Lemma 7.2, pp. 60–61 | Confirmed. The lemma states the Galois-side shape (χ_pγ_v ∗; 0 γ_v) with γ_v fixed; the README sentence was reworded to say so (it had attributed "twist of Steinberg" to the lemma). |
| §5.18 | KW I Theorem 4.1, p. 7; KW II §10.2, p. 92 | Confirmed, both parts; Berger–Li–Zhu residual weight 2 on p. 92. Duplicate locators merged. |
| §6.10 | KW I §9, Hypothesis (H) and Theorem 9.1, pp. 18–19 | Confirmed. |
| §6.11 | KW II Lemma 9.5, p. 87 | Confirmed. |
| §5.14 | BCDT Theorem 1.4.1, pp. 12–13; §10, pp. 77–78 | Confirmed, including the corrigenda E12–E14 (U′_S, V′ normal, ℓ-adic topology). |
| §8.8 | DP Theorem 1.4, p. 4 | Confirmed (ℚ(√p*), de Rham weights {0, k − 1}). |
| §7.2–§7.5 | DP Theorems 1.5–1.7, pp. 4–5 | Confirmed. |
| Conventions, §12.6–§12.7 | DP Definition 1.10, pp. 6–7 | Confirmed. Read in full: clause (4) also asks for crystallinity when ℓ ∉ S, and the almost-strict exception keeps (6) at a residually reducible coefficient prime only when p is odd and WD_p is unramified. The Conventions now state exactly this. |
| §10.15 | Pan Theorem 1.0.2, p. 3 | Confirmed, including the p = 3 exclusion. |
| §10.1 | Pan Definition 4.1.4, p. 39 | Confirmed. |
| §10.3 | Pan Definition 7.4.1, p. 116 | Confirmed. |
| §10.4 | Pan Definition 7.4.21, p. 121 | Confirmed: Z_B is the set of components whose generic points lie in the image of Spec R_B. |
| §10.5 | Pan Theorem 8.0.1 and Remark 8.0.4, pp. 124–125 | Confirmed. |
| §9.2 | Tung dyadic Proposition 3.2.7, p. 15; Theorem 8.0.3(3), p. 38 | Confirmed; the bar in (3) is the misprint E11. |
| §8.7 | Tung odd p Theorems 1.2 (p. 4) and 4.7 (p. 15); Hu–Tan Theorem 6.3 (p. 35) | Confirmed. |
| §8.2, §8.3 | Gee–Kisin B.1–B.5, pp. 38–41 | Confirmed, including the rank 2^{|R|} and the Lemma B.5.2 nonvanishing criterion. |
| §4.1 | Gee MLT §5.6, pp. 33–35 | Confirmed: (X − 1)² against (X − ζ)(X − ζ^{−1}); #k(v) ≡ 1 mod p. |
| §5.8 | Gee MLT Theorem 5.2, p. 29 | Read in full; hypotheses match the README hypothesis by hypothesis (p > 3, p unramified, crystalline, weights differing by at most p − 2, image ⊇ SL₂(𝔽_p)). |
| §5.3 | Gee MLT Proposition 4.25, p. 29 | Confirmed. |
| LL1, §8.7 | Paškūnas Theorem 1.1, pp. 1–2 | Confirmed; End ρ̄ = k is in the set-up on p. 1. |
| LL3, §7.9 | Emerton Theorem 3.3.22, p. 28; Remark 1.2.5, p. 5; §§7.3–7.4, pp. 95–96 | Confirmed (§7.3 begins on p. 95). |

The Kisin DVI files and CHT were not re-read; their locators are those of the accepted plan.

## Adversarial mathematics pass

| Statement | Instances tried | Result |
| --- | --- | --- |
| Oddness at 2 (§6.2, §6.10, §9.2, examples) | diag(1, −1), 1 and −1 over ℤ and mod 2 | Residual determinant cannot detect oddness. Oddness is a hypothesis on the lift everywhere at p = 2. The Lean examples pin det diag(1, −1) = −1 over ℤ and = 1 over 𝔽₂, and det(−1) = 1. |
| Oddness bridge (§7.11, `odd_det_of_odd_reduction`) | p = 3; p = 2 | Needs 2 ≠ 0 in the residue field and a domain; at p = 2 it fails (diag(1, −1) vs 1). Hypothesis present in the signature. |
| p* (§7.1) | p = 2, 3, 5, 7 | p* ≡ 1 mod 4 for odd primes only; pStar 2 = 2 fails it. At p = 3, ℚ(√−3) = ℚ(ζ₃). |
| Weight normalisation (§7.7) | {3, 7}; {0, 1}; {4, 4} | k = 5, 2, 1. Equal weights (weight one) give k = 1 and are outside every lifting theorem. |
| Geometric twist (§7.12) | weight-one h; χ through ℤ_p^× with non-algebraic weight; ρ_f ⊗ ε^{−a} | Weight one is excluded by equal weights. A non-de Rham χ violates the hypothesis. Returns m = −a, μ = 1. Finite order of μ uses finiteness of pro-ℓ images in ℚ̄_p^× for ℓ ≠ p, plus Kronecker–Weber. |
| Patching radius (§3.1) | s = 1, p = 3, m = 2, h + j = 1; h + j = 0 | r_m = 18; with no variables r_m = s·m. Monotone in m needs p ≥ 1 (in the signature). |
| Archimedean ring at p = 2 (§6.2, worked example) | ρ̄(c) = 1 | 𝒪⟦X₁, X₂, X₃⟧/(X₁² + X₂X₃ + 2X₁): relative dimension 2, not formally smooth mod 2 (X₁² + X₂X₃), regular after inverting 2. This is why §6.11 asks for a domain with regular generic fibre. |
| R = T kinds (Conventions, §3.7, §4.2, §4.5) | one vs two components of R^loc | Support on one component says nothing about another. Integral R ≅ 𝕋 needs formally smooth local rings (§4.2). |
| Pan's dimension counts (§10.7, §10.8, §10.11, §10.12) | d = 1, d = 4 | h¹ − h² = 2d; 1 + 2d − d = 1 + d; propagation needs 2d − 1 > d + 1, i.e. d > 2. So the degree enlargement d > |S∖Σ_p| + 2 is essential; Checks added. |
| Reducible locus (§10.11) | R_B/nilradical | It has the dimension of R_B, so the bound d + 1 would be false for it; the closed reducible subscheme is meant. Check added. |
| Pan's p = 3 exclusion (§10.15, §11.2) | residual 1 ⊕ ω₃ in either order | The ratio restricted to G_{ℚ₃} is ω in both orders (ω² = 1 mod 3), so the case is excluded and handled by Skinner–Wiles (§11.2). |
| Good components (§10.3, Lean examples) | empty seed; two-edge chain; shared non-nice point | No component is good with no seed (proved in Lean). All three components of the chain are good. A shared non-nice point does not propagate. |
| Extension components (§10.4) | identity; zero target; kernel not in P | All minimal primes; empty; not detected (the last proved in Lean). |
| DP Theorem 1.7 finite-order ψ (E10) | ψ = det ρ·ε^{1−k} | Without finite order the determinant condition is empty. ψ is of finite order wherever Skinner–Wiles is used. |
| Integral vs residual irreducibility at 2 (§12.2, §12.8) | residual image S₃ vs A₅ ≅ SL₂(𝔽₄) | Only the nonsolvable case enters the dyadic branch. |
| Weight-p + 1 endpoint (§5.17) | k = p + 1, residual weight 2 | Ind ω₂^p ≅ Ind ω₂ is irreducible of Serre weight 2; the nonordinary branch is the only one, as KW II p. 92 says. |

## Duplication against Tau Ceti

- **TauCetiRoadmap main at 350e970.** Listed via the GitHub API; the local checkout at 0d144d0 was read. Nothing there plans modularity lifting, Taylor–Wiles patching, Galois deformation rings or pseudodeformations. The only overlap is IntegralHeckeAndGaloisDeterminants Layers 0–1, which is now cited (item 4 above).
- **Tau Ceti library at a91d3aaf.** Searched for TaylorWiles, ModularityLifting, patching, deformation rings and pseudocharacters: nothing relevant.
- **Upstream contracts used.** ClassFieldTheory Layers 7, 12 and 13, Chebotarev Layer 10 and ModularForms Layer 9 are used as contracts.

No target was removed for duplicating Tau Ceti. The three removals in item 1 duplicated lower-tier atlas roadmaps.

## What remains

- The conditional inputs LL1–LL3 and CC1–CC5 belong to roadmaps outside the build order. Their placement is the maintainer's decision.
- The *Required in addition* items must be added to the suppliers' roadmaps; until then the sections named there depend on them.
- Independent package review (`REV-PKG-GL2ModularityLifting`) is next; this session must not take it.

Scratch work was deleted when the run ended.
