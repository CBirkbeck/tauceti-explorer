# BP-NoncommutativeAndEquivariantIwasawa~2

Codex session **codex-tsn0Xi**, issue #10835, 2026-10-19. This is the completed target-level revision, ready for an independent review, not a checkpoint. All eight stages are **planned**, none **closed**. Every implementation status remains `unchecked`.

## Scope and review history

The packet now has 136 nodes, 240 API entries, 186 definition/construction tests, 33 planets, 35 baseline declarations, 28 supplier requests and 20 explicit source/proof obligations. One comparison node was added; none was removed. The reader carries all target statements, hypotheses, proof outlines, API entries, tests, checks and source locators. The suggested file remains a small sketch over carriers available at the pins.

The independent report `REV-NoncommutativeAndEquivariantIwasawa.md`, its earlier handoff, the packet's `review` object and the per-node review records are unchanged. Its 84 verified, 45 corrected and six unverifiable verdicts describe the pre-revision input. This revision does not approve itself. The six affected targets are `NE.6/phi-integral-log-sequence`, `NE.6/basic-congruence-values`, and the four NE.7 targets `fukaya-kato-zeta-isomorphism`, `tate-motive-interpolation`, `tate-motive-interpolation-rational`, `critical-motive-interpolation`.

## Multiplicative logarithm repair

The first exact-sequence map has component `(ζ,g) ↦ ζ^[G:U_P] ver(g)`. A scalar norm has the rank exponent; the group contribution is transfer. The last map is the additive inverse followed by the untruncated integral-log cokernel map, `ω_ψ=ω_Aδ`. It cannot be recovered from a generator-truncated cyclic top component.

The kernel argument descends through nontrivial cyclic subgroups, retaining the separate equation `x_1^p=ϕ(x_1)` at the central subgroup. It uses the finite abelian integral-log kernels `μ(O)×A_n`, their compatible compact limit, and the torsion-free quotient of units by `μ(O)×A`. Infinite-order group units are included. In the noncyclic case a power lying in the group-unit subgroup is sufficient; it does not imply the unit is torsion. Index-p trace rigidity identifies the scalar residues and then the two basis units. Because p is odd, an invariant support of size at most two consists of fixed points, whose trace coefficients are divisible by p. An index-p chain gives exactly the stated scalar exponent.

For the cokernel, first abelianize the additive inverse. In the cyclic case the untruncated logarithm follows from the θ–β identity. In the noncyclic case the weighted sum of cyclic components and the untruncated top component force `Σ|C|log α_C= p|Ḡ|log x_Ḡ`; substitution recovers the abelian integral logarithm. This proves the needed vanishing under ω; the integral-log exact sequence supplies the converse lift.

Locators: Kakde arXiv v3, §5.7, Lemmas 85–89, pp.58–65; Schneider–Venjakob, *K1 of certain Iwasawa algebras, after Kakde*, §4, Lemmas 4.7–4.9, pp.26–30. The latter's central α absorbs the extra Frobenius denominator, unlike Kakde's convention. Finite integral-log source inputs remain the separately recorded Oliver/Wall obligations.

## Replacement analytic route

The old cyclic-overgroup congruence is not retained as a target. For `G=C_(p²)×Γ`, `Z=Γ^p`, let `P=pC_(p²)×0` in `G/Z=C_(p²)×C_p`. There are p cyclic overgroups with p-th power subgroup P. The Weyl action is trivial, with order p². M3 identifies each transferred zeta value with ζ_P modulo p; Kakde v3 (12) would instead make the unit ζ_P congruent to pζ_P=0 modulo p. A fixed rational pair with unit ideal also contributes `1−p`, not zero. E33 records the version-scoped finding. E34 records the unsupported arbitrary-cusp comparison.

The replacement uses the full subgroup Möbius sum of Ritter–Weiss. `basic-congruence-values` constructs, for a given test function and its conductor, Hilbert Eisenstein series of weights `[L:F]k`, restricts them with relative factor `[F:K]`, and applies `U_[F:K]`. Every resulting weight is `[L:K]k`; the coefficient trace condition is `Tr(β)=[F:K]a`. Fixed pairs descend because the omitted primes include all ramified primes. Their stabilizer sum is over **all** subgroups, with Möbius coefficients, and has the correct stabilizer-order divisibility. The elementary-abelian Möbius formula, Teichmüller estimate and orbit count are stated in the proof outline.

At the special cusp, `diag(γ,γ⁻¹)` lies in the completed level group, so the relevant second cusp factor is the identity. The Hecke comparison therefore reduces to its standard-cusp coefficient formula. The relative norm powers match the smoothing exponents. This replaces the need for Kakde's omitted (29), rather than asserting its missing proof. Locators: Ritter–Weiss, *Congruences between abelian pseudomeasures, II*, arXiv:1001.2091v3, Propositions 5 and 9, pp.6–9, Lemma 10 and conclusion, pp.10–11.

**Uniform-g qualification:** the finite-conductor calculation gives a special g after choosing a test function. It does not establish one g for all test functions. `basic-congruence-reduction` now states that its g is fixed before all ε; its proof is the finite coefficient/trace argument of Proposition 4, pp.5–6. `basic-congruences` uses the precise **Theorem, p.2**, asserting a single g with the smoothed pseudomeasure trace congruence. Obligation 20 records that this revision has not independently justified the uniform quantifier passage from the conductor-dependent proof. No interchange of `∀ε ∃g` and `∃g ∀ε` is claimed. This is a precise primary-theorem proof leaf, not a claim that the theorem is false or that the complete analytic proof has been audited.

Normalization removal retains its Möbius coefficients. Universal pseudomeasures are localized only at the procyclic smoothing subgroup before deflation, then the common invariant `1−h` is inverted in the central localization. This avoids an invalid universal augmentation localization with a prime-to-p factor. Locators: Ritter–Weiss arXiv:1004.2578v2, Proposition 6 p.3 and §3, Lemma c, (3.1)–(3.3), pp.10–12. Its stated finite-over-cyclotomic hypotheses are retained.

The independent completed Ritter–Weiss construction supplies a multiplicative preimage with the complete abelian tuple; the packet includes its support reduction and torsion correction, rather than deducing M4 just from equality of logarithms. Earlier logarithm/trace inputs remain named obligations: RW3 Proposition 11 and Lemma 12; RW4 Proposition 9; RW5 Propositions 2.2, 2.4, 3.2; RW8 Lemma 1 and Proposition A. This revision read their use in RW2010 §§4–6, not all their original proofs.

## New completed-to-canonical comparison

The added node is `NE.6/completed-zeta-canonical-descent`. It chooses a characteristic lift f with boundary `−[C]`, using the boundary-surjectivity theorem that **allows p-torsion**. Abelian main conjectures and base change make `u_P=ζ_P/θ(f)_P` integral units, including their inverses. A completed preimage gives `u∈Φ̂`.

The node proves `Φ̂ ∩ ∏ integral units = Φ`. All relevant modules are finite free over `R=O[[Z]]`; `R/p^n` injects into its central-localized completion modulo p^n. For a finite Weyl action, the cosets modulo Z admit equivariant lifts because a finite stabilizer has no nonzero homomorphism to torsion-free Z. The trace image in this permutation basis imposes exactly stabilizer-order coefficient divisibility. These conditions, and their p multiples, contract to R, as do M1–M2 by injectivity and M4 by the integral α/Frobenius formula. Lift u by the integral θ-isomorphism, then multiply by f to impose both the tuple and arithmetic boundary.

No inverse map from the completion to the canonical localization is asserted. The Ritter–Weiss refined class is not identified with `[C]` by a sign guess. Locators: Kakde Lemma 85 pp.58–60, Theorems 52–53 p.36 with proof pp.64–65, Proposition 93 pp.66–67; RW2010 Lemma e pp.13–14; Venjakob's comparison article §§1–2 pp.1–5 and §6 Theorems 6.2–6.6 pp.18–22.

M4 and zeta-tuple membership use this comparison. The auxiliary enlarged-extension node is retained as a separate construction, not needed in the replacement proof. The new route never invokes the desired Kakde main theorem as an input.

## Global determinant orientation

For `C=RΓ_c`, the FK arithmetic map is `ζ:1→d(C)⁻¹`. Put `D=C[1]` and transport ζ along `d(D)≅d(C)⁻¹`; do **not** replace ζ by its inverse. Then `r(D)=−r(C)` and `∂[D,ζ_D]=+[C]`. The monoidal inverse trivialization on d(D) is distinguished from the composition inverse of the map on d(C).

For Tate multiplicity m, `B²=−c_γ⁻¹ log`, and the inverse determinant contributes `c_γ^m`. Thus the normalized shifted leading term is `c_γ^(−m)[D,ζ_D]^*`, with order `−m`. Changing γ to γ^a multiplies both the unnormalized leading coefficient and `c_γ^m` by a^m. The rational extension uses Q-valued characters, preserving the earlier independent repair.

For Selmer cohomology in degrees 1,2 and nondegenerate height rank h, `r(SC)=−h`, `r(SC[1])=h`. The inverse determinant contributes the height determinant, not its reciprocal. The critical-motive formula retains D2 or the specified regulator comparison, arithmetic semisimplicity, complex/p-adic periods and regulators, Γ factors, and the corrected Euler-factor conditions.

Locators: BV arXiv math/0511672v2 Definitions 2.5, 3.4, 3.7, 3.14; Theorem 5.5 and Remark 5.6 pp.25–27; Proposition 6.6 and Theorem 6.7 pp.32–35. Published comparison: Theorem 5.5 (24) p.193 and proof pp.194–196; Lemma 6.7(ii) pp.202–203; Theorem 6.5 p.201 and proof p.204. E35–E36 record the resulting source-formula/sign findings; all four new findings await independent verification. E26/E28 carry revision-resolution notes without changing their historical independent verdicts.

## Sources, baseline and ownership

Public PDFs read in this revision and hashed in the packet: Kakde arXiv:1008.0142v3; BV arXiv math/0511672v2 and the published EMIS copy; Schneider–Venjakob's after-Kakde author copy; Ritter–Weiss arXiv:1001.2091v3 (all 12 pages) and arXiv:1004.2578v2 (§§1–6); Venjakob's comparison article (§§1–6). Kakde's author-hosted *Congruences between abelian p-adic zeta functions*, Proposition 13.4, PDF pp.22–23, repeats the cyclic-overgroup argument. It is a separate chapter, not the Inventiones version of record. The latter was not readable through the publisher endpoint; no claim of comparing it is made. Source-version URLs, exact SHA-256 values, source-finding locators and bounded erratum-search records remain in the packet. No source passages or source files were copied into the repository.

The baseline remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All 35 cited declaration statements were read at the pins. The reviewed NE.0–NE.7 library audit was read. Current upstream was checked read-only at TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including the ProfiniteArithmetic and InductionRestriction documents and suggested files. No upstream build was run.

Generic completed group algebras, compact-module actions and lower-p-series declarations remain owned by current ProfiniteProPGroups/ProfiniteArithmetic. The coefficient-ring generalization of twisted group algebras remains with InductionRestriction; no duplicate generic construction was added. No ownership moves are proposed in this revision. The library index permits Schneider; uncleared DDMS, Oliver, Serre, FK and Nekovář books were not accessed. Their exact proof/supplier obligations remain explicit.

## Validation and next step

- `scripts/check_blueprint.py` with the shared pinned declaration index: no errors or warnings.
- Reader/packet parity: every node's statement, hypotheses, proof steps, API, tests, acceptance checks and source locators match; local anchors are unique and all local links resolve.
- Historical review preservation: packet review object and original per-node review fields compare equal to the input.
- `scripts/check_sorry_data.py`: passed; no sorry-defined data.
- Intake deliverable-path check and `git diff --check`: passed.
- `lean-check` on the suggested file: elaborates at the pins, with exactly eight expected `sorry` warnings and no other warnings or errors. Memory was checked before compiling. The file has 171 lines, five light real-bodied definitions and two layer milestones; there is no heavy construction or auxiliary development chain. New proved examples count the C₉×C₃ roots and three overgroups, check the full Möbius sum 486 modulo 9, and check the scalar norm and Tate/Selmer signs and normalizations.

The next action is an independent review of these replacements and the new comparison, particularly the finite-level logarithm passage, trace contraction, global signs and the explicitly retained uniform-g theorem input. Source/supplier obligations still prevent marking any layer closed. No claim that the main theorems are formalised, or that this is a gap-free closed roadmap, is made.
