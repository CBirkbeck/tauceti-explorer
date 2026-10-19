# Handoff: independent Eisenstein package review

Job `REV-PKG-EisensteinIdealAndRationalTorsion~codex`, issue #11127. Codex session `codex-tGg63C`, 2026-10-19. The claim bot confirmed the claim before work began. Input author was the different session `codex-ThgUMA` (#11125, commit `4cda0476a`). No second job was claimed.

The fixing review is complete, with verdict **needs_changes**, recorded in the package's `review.json` and the report `research/blueprint/reviews/REV-PKG-EisensteinIdealAndRationalTorsion~codex.md`. This is not a checkpoint. The issue's mismatched Lawrence–Venkatesh title and nonexistent earlier review were treated as boilerplate errors; the named Eisenstein package was reviewed.

## Delivered

- Retained all 56 targets and their full all-prime, dyadic, bad-fibre and general-level scope.
- Fixed §7.9's use of good-reduction specialization in its bad-reduction argument. Existing heights §§1.15b–1.16 supply a torsion-free first formal kernel under e<q−1, even for the Néron model at bad reduction. Added the strict-bound, split-multiplicative and dimension-zero checks; updated sources and prerequisites.
- Corrected §8.3 to distinguish the generic sequence on Mazur–Tate p. 45 from the finite-flat Lemma on p. 47.
- Made commutativity and ℓ-power annihilation explicit in the admissible-group convention/contract.
- Left the valid compact Lean file and `math.NT` metadata unchanged. Added the independent report, verdict and this handoff only; no packet, supplier or upstream files were modified.

## Required next work

The four remaining defects are consumer contracts without owning supplier targets. The report's C1–C4 table gives exact hypotheses, existing limits, sources and affected consumers:

1. `ModularCurvesPartII`: integral cusp forms/relative-dualizing/Serre-dual H¹ comparison at all primes with stack/coarse and Hecke compatibility. Existing §7.2 and §§7.5–7.6 are characteristic-zero/rational.
2. `FiniteFlatGroupsAndIntegralPadicHodgeTheory, Part II`: marked global admissible quasi-finite groups, geometric δ/α and the fppf cohomology bound, global rank-one classification, odd purity and dyadic D/*-type saturation. Existing local classifications and Mayer–Vietoris are insufficient. §R07.1.39 does already discuss the μ/constant Ext computation; do not duplicate its general sequence.
3. `NeronModelsAndSemistableAbelianVarieties`: connected-model fppf sequences with component defects and Sha comparison (including weaker dyadic assertion), plus optimal-new-quotient cotangent injectivity away from 2 including p∥N. §6.4's same-dimension isogeny lattice comparison does not imply these.
4. `ClassFieldTheory, Part II`: χ_P⁻¹ ideal-class P-eigenspace vanishing via B₂, with equivariant unramified-extension interface. Idelic Herbrand quotient is not this theorem.

Add these in the general owners and connect actual numbered targets, with the new roadmap placed after all suppliers. This job did not authorise supplier/tier edits. Do not weaken to good primes, omit dyadic theory, assume regular primes, or remove the general formal-immersion theorem to hide the gaps.

Three apparent gaps were independently resolved by existing inputs: connected abelian quotients (heights §1.0/abelian-scheme §§A3.3,A6.3–A6.5), local formal π-inverse (heights §§1.15a–1.16), and level-primary generic torsion (Néron §§3.13–3.14 all-n Raynaud sequence). No generic theory was moved upward. The arithmetic full Hecke order and fixed level-13 certificates correctly remain here.

## Evidence and validation

Current-roadmap audit: `0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searched all current roadmap/Completed targets, including the nine newer roadmaps and integral Hecke determinants. No additional duplicate target needed deletion; the README already imports generic library and roadmap objects. No Lean command was run in those read-only checkouts. The library-coverage audit has no entry for this new roadmap.

The report records the reproducible 15-target source sample, additional source-sensitive readings, every-target adversarial pass, and all ten named Lean declarations (one definition and nine theorems). Public Mazur/Mazur–Tate/Mazur–Wiles sources and the two level-13 model sources were read directly. Cleared Deligne–Rapoport and Faltings–Chai volumes were read in place, never copied. Every committed mathematical statement is in our own words.

Exact independent arithmetic passed: genus-two counts 6,6,6,8 and Jacobian orders 19; cusp-relation determinant 19 and all degree-two residues; sextic discriminant −2¹²·13²; Bernoulli sums 8,32,88; six cyclotomic norms 13,27,53,79,131,157 and exhaustive small-prime bound <307; full generalized Weierstrass multiplication sequences of orders 2,3,5,7 with discriminants 64,−27,−11,−1664. Algorithms and full certificate data are recorded in the report/README; transient scripts are unnecessary for continuation.

- Independent `lean-check`: exit 0, nine warnings only for theorem `sorry`, no errors or other warnings, at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No Lean edits followed.
- Packet checker: zero errors/warnings on the unchanged input; nine planned layers and zero closed remain the input's status.
- Intake file check: zero problems on the four changed deliverables.
- `git diff --check`: passed.

No suspicious instructions were encountered in untrusted comments, PR material or sources. They were treated as data. No credential use or unrelated edits were requested by that material. No scratch file needs preservation, and no background Lean process remains.
