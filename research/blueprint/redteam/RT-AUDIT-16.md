# RT-AUDIT-16 — independent red team

**Complete. Three high-severity findings.** Each is a missing condition that makes the displayed target false. The corrections preserve the existing library verdicts; they do not request new implementations of already available mathematics.

Agent: Codex / `codex-7e92bd`. Date: 2026-09-24. Target: accepted `AUDIT-16`, reviewed by `REV-AUDIT-16`. The ledger assigns those jobs to `claude2/2` and `claude6/2`, respectively. This session did neither.

Input: [explorer snapshot 484485ee3599](https://github.com/CBirkbeck/tauceti-explorer/tree/484485ee359918e196c3bc0a09cd82dc38adf47a). Library sources were read at [Mathlib 082e2d3](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174) and [Tau Ceti f790474](https://github.com/CBirkbeck/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369).

## Findings

### RT-AUDIT-16/1 — Odd modulus requires nonempty coordinates

**Where:** research/blueprint/audit/AUDIT-16.result.json: tauceti:TauCetiRoadmap/AlgebraicCodingTheory#layer-6-construction-a-with-exact-hypotheses, target 3 (unimodularity/evenness).

The target drops the nonempty-coordinate hypothesis from the odd-modulus obstruction to evenness: it says "odd m never even" although empty coordinate types are explicitly allowed by the standing convention. It also leaves implicit that the lift-independent quadratic residue form q_m in this target is defined for even m.

**Evidence:** https://github.com/CBirkbeck/tauceti-explorer/blob/484485ee359918e196c3bc0a09cd82dc38adf47a/content/tau-ceti/AlgebraicCodingTheory/README.md#L347-L351 states: "If m is odd and ι is nonempty". The statement is at lines 350–351. Lines 39–44 allow arbitrary finite coordinate types, and lines 347–349 define q_m only when m is even. Counterexample: m=3 and ι=∅. There is one word and one additive code C={0}; P_3(C)={0}, every norm is 0, so the lattice is even. For nonempty ι the intended argument works: 3 e_i belongs to P_3(C) and B_3(3e_i,3e_i)=3. For odd m, changing a lift of the zero residue from 0 to m changes lift^2/(2m) by m/2, which is nonintegral.

**Fix:** Restore the roadmap hypotheses in the audit target: define q_m and the q_m|C=0 evenness criterion for even m; for odd m assert non-evenness only when ι is nonempty, and record the zero-dimensional exception. Keep the library status absent and reuse notes unchanged. Do not alter the source roadmap, which already has these hypotheses.

### RT-AUDIT-16/2 — Finite-graph compatibility requires a nonempty host

**Where:** research/blueprint/audit/AUDIT-16.result.json: tauceti:TauCetiRoadmap/DenseGraphLimits#layer-1--core-objects-and-their-basic-api, target 2 (finite-graph compatibility).

The built target displays t(F,W_G)=hom(F,G)/|V(G)|^{|V(F)|} without the positive-host-size hypothesis required by the cited theorem. The graphon constructor itself is total at host size zero, so that case cannot silently be excluded by typing.

**Evidence:** https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Combinatorics/DenseGraphLimits/StepGraphon/FiniteGraph/Basic.lean#L201-L207 explicitly requires (hm : 0 < m). The docstring at lines 202–203 explains the counterexample: m=0 and a nonempty edgeless pattern give graphon density 1 but finite homomorphism density 0/0=0. The constructor at line 89 has no positivity argument. https://github.com/CBirkbeck/tauceti-explorer/blob/484485ee359918e196c3bc0a09cd82dc38adf47a/content/tau-ceti/DenseGraphLimits/README.md#L613 retains 0 < m in Suggested signatures and the Reviewer checklist at line 819.

**Fix:** Add |V(G)|>0 to the audit target or its note, keeping the correct library status and citation. Record the empty-host exception; no new theorem or roadmap change is needed.

### RT-AUDIT-16/3 — The oldspace sum must exclude the current level

**Where:** research/blueprint/audit/AUDIT-16.result.json: tauceti:TauCetiRoadmap/ModularForms#layer-3-the-petersson-inner-product-adjoints-oldforms-and-newforms, target 5 (fixed-character oldspace indexing); inherited from content/tau-ceti/ModularForms/README.md:509.

The formula advertised as exact indexing sums over all M dividing N and therefore includes M=N, d=1, chi_M=chi. That summand is the whole S_k(N,chi), so the displayed oldspace is always the whole character space. The proper-level condition M != N is missing.

**Evidence:** https://github.com/CBirkbeck/tauceti-explorer/blob/484485ee359918e196c3bc0a09cd82dc38adf47a/content/tau-ceti/ModularForms/README.md#L503-L514 calls for proper divisors in the preceding bullet but omits that condition in the displayed fixed-character formula, which the audit repeats. The actual definition https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean#L99-L107 requires d*M | N AND M != N; cuspFormsOld_one at lines 146–150 states cuspFormsOld 1 k = bottom. At N=1, k=12 and trivial character, the faulty sum includes V_1 S_12(1)=S_12(1), which is nonzero: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean#L159-L167 gives dimension one. This directly contradicts the level-one oldspace theorem.

**Fix:** Add M != N (equivalently M < N for positive N) to the fixed-character oldspace sum in the audit target, alongside M | N and cond(chi) | M, retaining d | N/M. Keep the partial status: the conductor-indexed refinement is still not proved. Record the same correction as a maintainer patch to the existing upstream ModularForms Layer 3 formula under PROTOCOL section 15, without replanning that roadmap or creating a second oldspace definition.

The first two errors are losses in the audit summary: the source roadmaps already retain the required conditions. The third is inherited from the upstream roadmap formula. Its correction should be recorded as a maintainer patch under PROTOCOL §15, while the audit itself receives the corrected indexing. This red team changes only its two deliverables.

## Exhaustive audit scope

All 203 targets were read against the full four roadmap documents and their source declarations. The inventory contains 460 citation occurrences, 429 distinct declarations and 267 distinct source files. Each cited file was byte-compared with its pinned Git blob. The original review reported 451 occurrences before its corrections; the accepted result checked here contains 460. Repeated citations were compared with each target using them.

The following table gives every audited layer, with target and citation-occurrence counts. “Built” means the audit’s verdict, read together with its notes and the corrections above.

| Roadmap / layer | Targets | Citations | Verdict |
|---|---:|---:|---|
| ModularForms / `layer-0-diamond-operators-and-modular-forms-with-character-nebentypus` | 7 | 24 | partly built |
| ModularForms / `layer-1-the-valence-formula-general-level` | 5 | 15 | built |
| ModularForms / `layer-2-hecke-operators-and-the-hecke-algebra` | 10 | 37 | partly built |
| ModularForms / `layer-3-the-petersson-inner-product-adjoints-oldforms-and-newforms` | 6 | 18 | partly built |
| ModularForms / `layer-4-eigenforms-newforms-primitive-forms-the-conductor` | 7 | 15 | partly built |
| ModularForms / `layer-5-strong-multiplicity-one-and-the-eigenform-characterization` | 6 | 14 | partly built |
| ModularForms / `layer-6-atkinlehner-and-fricke-operators` | 6 | 16 | partly built |
| ModularForms / `layer-7-l-functions` | 6 | 17 | partly built |
| ModularForms / `layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields` | 8 | 16 | not built |
| ModularForms / `layer-8g-galois-stability-the-character-field-and-rationality` | 4 | 4 | not built |
| ModularForms / `layer-9-the-lmfdb-invariant-layer` | 8 | 12 | not built |
| ModularForms / `layer-10-the-modular-curve-γℍ-and-the-dimension-formulas` | 5 | 10 | partly built |
| ModularForms / `10a--the-analytic-modular-curve` | 3 | 12 | not built |
| ModularForms / `10b--compact-riemann-surface-cohomology` | 7 | 12 | not built |
| ModularForms / `10c--modular-forms-as-section-spaces-and-the-dimension-formulas` | 4 | 5 | not built |
| ModularForms / `layer-11-the-eichlerselberg-trace-formula-level-one` | 7 | 8 | not built |
| AdditiveCombinatorics / `AC.0` | 4 | 15 | partly built |
| AdditiveCombinatorics / `AC.1` | 4 | 9 | not built |
| AdditiveCombinatorics / `AC.2` | 5 | 11 | partly built |
| AdditiveCombinatorics / `AC.3` | 4 | 2 | not built |
| AdditiveCombinatorics / `AC.4` | 4 | 4 | not built |
| AdditiveCombinatorics / `AC.5` | 3 | 0 | not built |
| AlgebraicCodingTheory / `layer-1-finite-codes-matrices-and-elementary-constructions` | 6 | 13 | partly built |
| AlgebraicCodingTheory / `layer-2-hamming-data-and-dual-codes` | 6 | 18 | partly built |
| AlgebraicCodingTheory / `layer-3-weight-enumerators-and-macwilliams` | 3 | 4 | not built |
| AlgebraicCodingTheory / `layer-4-binary-doubly-even-and-type-ii-codes` | 4 | 2 | not built |
| AlgebraicCodingTheory / `layer-5-tetracode-hexacode-and-the-extended-golay-codes` | 4 | 0 | not built |
| AlgebraicCodingTheory / `layer-6-construction-a-with-exact-hypotheses` | 4 | 9 | not built |
| AlgebraicCodingTheory / `layer-7-codes-as-isotropic-discriminant-subgroups` | 5 | 13 | not built |
| DenseGraphLimits / `layer-0--finite-graph-and-measure-scaffolding` | 3 | 11 | partly built |
| DenseGraphLimits / `layer-1--core-objects-and-their-basic-api` | 6 | 22 | built |
| DenseGraphLimits / `layer-2--counting-regularity-total-boundedness` | 6 | 16 | partly built |
| DenseGraphLimits / `layer-3--the-ae--aeeqfun-view` | 2 | 7 | built |
| DenseGraphLimits / `layer-4--completeness-and-compactness` | 2 | 3 | not built |
| DenseGraphLimits / `layer-5--coupling-and-map-cut-distance-agree` | 3 | 5 | partly built |
| DenseGraphLimits / `layer-6--separation-and-convergence-equivalence-the-analytic-summit` | 4 | 5 | partly built |
| DenseGraphLimits / `layer-7--applications-and-validation` | 3 | 7 | partly built |
| DenseGraphLimits / `layer-8a--quantum-graphs-and-reflection-positivity` | 2 | 9 | partly built |
| DenseGraphLimits / `layer-8b--lovászszegedy-representability` | 3 | 4 | not built |
| DenseGraphLimits / `layer-9a--finite-and-joint-graphon-sampling` | 4 | 10 | built |
| DenseGraphLimits / `layer-9b--exchangeable-graph-laws-and-graphon-mixtures` | 6 | 16 | partly built |
| DenseGraphLimits / `layer-9c--sampling-convergence` | 4 | 10 | partly built |

The totals are four built, twenty partly built and eighteen not-built layers. All 42 IDs are exactly the four current roadmap stage sets. The 49 overlap entries name 42 distinct current, non-retired endpoints, whose complete descriptions were read. The reviewed coverage projection exactly matches the accepted audit after accounting for its deliberate flattening of targets and cap of twelve exported evidence entries per layer.

## Checks that control the conclusions

ModularForms: checked diamond operators and character decomposition; level-one and full-index valence/order/Sturm statements; convolution and GL_n/Gamma0 Hecke rings; classical composite versus single-double-coset operators; character and bad-prime coefficient conditions; Petersson pairing and old/new spaces; good versus full eigenforms; fixed-level multiplicity one; Atkin-Lehner and Fricke normalizations; width-dependent L-series, Mellin continuation and functional-equation scope; modular symbols, coefficient fields, twists, modular curves, analytic versus function-field Riemann-Roch, dimension formulas and trace-formula ingredients. Every missing/partial target was searched in the index and both source trees, including alternate spellings and concept names.

AdditiveCombinatorics: checked elementary energy/sumset/Fourier and Pluennecke-Ruzsa APIs; small-doubling versus general Freiman; Roth/corners versus higher Szemeredi; graph versus arithmetic regularity; recurrence and correspondence distinctions; Gowers/nilsequence/transference/prime-pattern absences. Searched both libraries under concept aliases. Read the integrated partial decomposition summary, all nine statements and acceptance blocks, and its seven explicit gaps; it does not establish the missing library targets.

AlgebraicCodingTheory: checked code aliases, generator/parity-check matrices, Hamming data, generic orthogonal complements and character duality, missing code enumerator/MacWilliams/Type-II APIs, named-code absences, Construction A versus existing integral-lattice gluing, coordinate discriminant modules, and A2/D4 normalization. Searched code-operation and named-code aliases. Exhaustive finite calculations from the roadmap generators verified the four named code cardinalities, weight distributions and minimum nonzero weights, and the stated hexacode conjugacy permutation; these are mathematical diagnostics, not Lean proofs.

DenseGraphLimits: checked arbitrary-carrier graphons and coupling cut distance, finite-host hypotheses, counting and weak regularity, total boundedness versus completeness, AEEqFun transport, standard-Borel representation versus mod-null equivalence, forward versus inverse separation, extremal examples, labeled-graph gluing and reflection positivity, representability absences, finite/joint sampling, exchangeable/dissociated laws, and concentration versus sampling convergence. Searched both source trees for aliases and closest candidates; read measure-product curry, conditional-expectation, de Finetti/Prokhorov and mod-null-equivalence ingredients without treating them as missing assembled results.

All 49 duplicate occurrences (42 distinct endpoints) resolve to current, non-retired atlas stages; read their full descriptions and compared the claimed overlaps. Distinguished analytic/algebraic comparisons, generic suppliers and specializations from duplicate implementations. Read the associated AlgebraicCodingTheory link map. No additional duplication finding established.

For modular forms, the full-index valence formula is compatible with the projective convention after the stabilizer and cusp-orbit factors are accounted for. The weaker full-index Sturm bound is explicitly disclosed in the audit. The scalar coset acts by χ(c)c^(k−2), and the normalized Fricke square is (−1)^k, with ±1 eigenspace complementarity only in even weight. Those qualifications are already present. Strong multiplicity one was checked at the fixed level, weight and character of the actual theorem; it was not promoted to cross-level multiplicity one. The symmetric-group recognition ingredients were read with their primitivity or prime-degree hypotheses; transitivity and merely containing one transposition are not a general recognition theorem.

For the modular-curve candidates, the existing disc linearizing coordinate and roots-of-unity disc-quotient homeomorphism were also inspected. They supply local ingredients, not an assembled compact modular curve or analytic Riemann–Roch theorem. The existing Kummer–Dedekind inertia-degree/factor-degree theorem likewise does not state the rational-polynomial Frobenius cycle-type certificate. Algebraic Riemann–Roch and generic smooth sheaves were read on their actual carriers.

For graph limits, the cut-distance triangle statement has arbitrary probability carriers. Its finite-partition reduction was distinguished from standard-Borel disintegration/gluing. The Lebesgue-to-standard-Borel measure-preserving representation allows atoms; it does not assert an atomless mod-null isomorphism. Finite and joint sampling and concentration do not by themselves prove the missing cut-distance sampling-convergence theorems.

Exact finite code diagnostics gave tetracode 9 words/minimum weight 3; hexacode 64/4; extended binary Golay 4096/8; extended ternary Golay 729/6. Their nonzero weight distributions are respectively 3:8; 4:45, 6:18; 8:759, 12:2576, 16:759, 24:1; and 6:264, 9:440, 12:24. Every code has one zero word. The specified hexacode permutation identifies the conjugate code, whose intersection with the original has four words. These computations do not certify untested duality or lattice isometries.

## Search coverage and limits

Every absent target and the missing part of every partial target received declaration-index searches followed by source-tree searches. Modular-form aliases covered Klein/j invariants, generalized/generalised Bernoulli, Eisenstein characters, eigenspaces/eigenbases/adjoints, old/new stability, conductor/primitive forms, Fricke and Atkin–Lehner, Satake/spherical Hecke, modular/Manin symbols, Eichler/period polynomials, coefficient/character fields, twists/self-duality, analytic rank/conductor, root number/Euler product, modular/Riemann surfaces, Leray/Dolbeault, Riemann–Roch/Serre duality, binary quadratic forms/Hurwitz numbers, Dickson/Chebyshev and trace formulas. The other three roadmap families used analogous concept and naming-variant searches described above; nearby results were opened and assessed, not accepted on names alone. Public declarations missing from the index were found in source.

Absence means no matching statement found in these pinned trees. It is not a proof of nonexistence. This is an exhaustive recheck of the accepted audit, not a new full proof extraction of every book or paper behind the roadmaps. The integrated additive-combinatorics decomposition remains partial and its explicit source gaps remain gaps. No Lean elaboration or build was run; source statements and exact finite mathematical diagnostics are the evidence.

## Validation

**PASS:** red-team checker; all-layer/target scope and reviewed-coverage consistency; exact two-file intake with zero problems. All 19 captured input blobs and both absent-output guards matched fresh main `f9236b81ec7f9a2347e8f1847216959995efff21`. The bot-confirmed claim and full issue instructions were unchanged before publication. No Lean compilation was performed.
