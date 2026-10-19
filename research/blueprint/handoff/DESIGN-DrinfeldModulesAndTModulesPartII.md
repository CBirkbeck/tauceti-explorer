# Handoff: DESIGN-DrinfeldModulesAndTModulesPartII

Issue #3393. Claude (session claude-Ic64mP), 19 October 2026.

## What this job delivers

- `research/blueprint/roadmaps/DrinfeldModulesAndTModulesPartII.json`: the new roadmap "Drinfeld modules, t-motives and characteristic-p special values, Part II: multiple zeta values and Thakur's basis". Its area is `functionfields` and its parent is `DrinfeldModulesAndTModules`. It has six stages, MZ.0 to MZ.5.
- `research/blueprint/packets/DrinfeldModulesAndTModulesPartII.json`: the blueprint packet, with status `complete` and every stage `planned`. It has 68 nodes (14 definitions, 7 constructions, 47 theorems), 131 API items, 85 unit tests and 24 planets. It cites 10 baseline declarations, has 3 gaps and makes no requests. There are 21 source issues, E1–E21, and a `routeCoverage` map that sends every item of the three paper routes to the nodes covering it.
- `research/blueprint/readmes/DrinfeldModulesAndTModulesPartII.md`: the reader document, about 31,000 words, generated from the packet.
- `research/blueprint/suggested/DrinfeldModulesAndTModulesPartII.lean`: the suggested file, 595 lines.

The brief's three paper routes all lie in one direction:
- Ngo Dac, Annals 2021;
- Chang–Chen–Mishiba, Forum Math. Pi 2023;
- Im–Kim–Le–Ngo Dac–Pham, Forum Math. Pi 2024.

They are planned together, with the shared material planned once, so no split is proposed. Two other Part II routes of the same parent stay separate roadmaps and are not planned here:
- AdmissibleAndersonClassFormulas (Anglès–Ngo Dac–Tavares Ribeiro);
- GammaValuesAndCMPeriods (Wei).

## Layers

- **MZ.0, values and indices.** Indices and arrays with their orders, the power sums of both realisations, Thakur's values ζ_A(s), Harada's alternating values and Carlitz multiple polylogarithms. Also Carlitz's identity on Thakur's range, the weight spans, and the index families with their counts d(w), s(w), t(w), c(w). Finally ζ_A(q−1) = −π̃^{q−1}/D_1, which is planned here because DM.6 does not state it, and Eulerian values.
- **MZ.1, products.** Chen's coefficients and formula, the index space with its harmonic and q-shuffle products, the realisation maps, the controlled product expansions, the value algebras, and π̃^{m(q−1)} ∈ Z_w.
- **MZ.2, binary relations and generation.** Binary relations, R_1, and Todd's B*, C and BC. The reduction step and admissible reduction, Brown's theorem in positive characteristic, and the bridges AZ_w = AL_w and Z_w = L_w. The rewriting operator U^• with its theorem, the IND_w generating set, the strong Brown theorem (with its proof completed, E9), and ζ_A(2q−1) + D_1ζ_A(1,2q−2) = 0.
- **MZ.3, periods and the ABP independence criterion.** Anderson–Thakur polynomials and interpolation, Chang's deformation series with its entireness and specialisation, and the dual t-motives M_{s,Q}. The MZ property, Chang's descent theorem, the merged prefix system, the independence criterion (Im–Kim–Le–Ngo Dac–Pham Theorem 2.4) and the Eulerian suffix constraint.
- **MZ.4, Frobenius systems.** (E_M), IND°_w and X_w; monic Frobenius descent and the θ-degree bound; the key lemma; dim X_w ∈ {0, 1}; the character-twisted system; and Ngo Dac's two-row system.
- **MZ.5, independence and dimension theorems.** Ngo Dac's Theorem B, Corollary C, Theorem 6.2 and Theorem D. The CMPL basis on IND_w, Thakur's basis theorem with dim_K Z_w = d(w), and all linear relations. For alternating values: character splitting, the ACMPL relations theorem, the Hoffman-like basis, dim_K AZ_w = s(w), and the CMPL lower bound. Finally the small-weight AMZV bounds and the v-adic bound.

## What remains (precise)

Three gaps are recorded in the packet:
1. **Degree monotonicity of power sums for general q.** The Thakur–Sheats input behind nonvanishing of ζ_A(s) with entries greater than q. The end theorems do not use it: CMPL nonvanishing on the small polydisc is elementary.
2. **Proof of the Anderson–Thakur interpolation formula.** The proof is in Anderson–Thakur, Annals 1990, §3.7, which is not freely available. The statement is taken from Chang 2014 Theorem 5.5.1. Only Ngo Dac's direct route and the MZ property of general MZVs use it; the CMPL route does not.
3. **v-adic multiple zeta values and the Chang–Mishiba homomorphism** (Invent. Math. 2021, Theorem 1.2.2). Only MZ.5/v-adic-bound rests on it. No atlas roadmap owns v-adic MZVs; a future paper job or a Part II on v-adic special values would.

Each stage's `remaining` list also names refinements for when the roadmap moves to lemma level, for example the dominance calculus, the three types in the reduction step, Steps I–II of Chang's descent, and the determinant in Theorem 4.3.5.

## Suppliers (imported by node, no requests)

All of the following are nodes of the accepted packets `DrinfeldModulesAndTModules--DM.0` and `--DM.8`:
- DM.0/carlitz-products;
- DM.2/{c-infinity, carlitz-exponential, carlitz-period, omega, period-power, lattice-exponential};
- DM.4/inverse-twist-dual-motive;
- DM.6/small-power-sum;
- DM.8/{coefficient-twist, entire-series, entire-from-equation, tate-analytic-interface, analytic-fixed-fields, fundamental-matrix (its API item fundamental_unique), abp-lifting, constant-denominator}.

The period convention is π̃ = 1/Ω(θ) = π_ND = −π_BP of DM.2/carlitz-period. No TauCetiRoadmap roadmap or open pull request covers characteristic-p multiple zeta values. I checked main 69bd802 and the open PR list on 19 October 2026; AnalyticNumberTheoryPartII #1167 is classical.

## Checks run

- `python3 scripts/check_blueprint.py` on the packet with the pinned declaration index: 0 errors, 0 warnings.
- `lean-check` on the suggested file: it elaborates at Mathlib 082e2d3 with 59 warnings, all `sorry`.
  - Every `decide` test passes: the counting sequences (d(w) for q = 2 is Fibonacci; d(4) = 6, s(4) = 46 and t(4) = 48 for q = 3), Chen's coefficients and the block map.
  - A `run_cmd` audit finds no `sorry` in any definition or statement.
  - All 215 API and test names of the packet occur in the file, either as declarations or in the closing register.
- The real-bodied definitions in the Lean file are: indices and their orders, the index families as finsets of `Composition w`, the counting sequences, monic polynomials of degree d, ℓ_d, the power sums of both realisations in `RatFunc Fq`, the values as `tsum`s in `RatFunc.CompletionAtInfty Fq`, the weight spans, Chen's coefficients and the harmonic product. The end theorems are stated: Thakur's basis theorem with `finrank = thakurDim`, the CMPL basis, Theorems B and D, dim AZ_w = s(w), and monic Frobenius descent. Objects on C_∞, T, E and dual t-motives are README targets.
- Numerical checks in truncated Laurent series in 1/θ (scratch script) confirmed these identities, each to the truncation order:
  - for q = 2: ζ(3) = D_1²(ζ(1,1,1) + ζ(2,1)), ζ(2) = D_1ζ(1,1) and ζ(1)ζ(2) = ζ(3) + ζ(1,2);
  - for q = 2 and 3: ζ(2q−1) + D_1ζ(1,2q−2) = 0 and ζ(q−1) = −π̃^{q−1}/D_1 (with π̃^{q−1} from DM.2/period-power);
  - for q = 3: Chen's S_d(2)² = S_d(4) + S_d(2,2);
  - also Li(1,2) = ζ(1,2), and Li(4) ≠ ζ(4) for q = 3.
- Sonnet supplier-contract check of the 41 (node, DM node) pairs: 1 flag and 7 caveats, all resolved.
  - The flag was that uniqueness of trivialisations is an API item of DM.8/fundamental-matrix. It is now cited explicitly.
  - The caveats included Ω ∈ E, which now comes from DM.8/entire-from-equation, and a dropped unused supplier.
- Two Sonnet locator sweeps over 168 locators: 6 wrong pages or overstatements, all fixed.
- Two Sonnet claim checks of the 68 node statements against the sources: 53 OK, 11 minor and 4 problems. All were verified against the sources and fixed.
  - MZ.2/strong-brown: the transition matrix is now indexed by all of AT_w, with contraction many-to-one onto AS_w, as in the source. This also exposed the misprint E21.
  - MZ.4/two-row-system: at k = q − 1 the system has solutions with a_2 = 0 and a_1 ∈ (t^q − t)F_q[t] (the Eulerian weight 2q − 2). The theorem now asserts a_2 = 0 and the absence of solutions with a_1a_2 ≠ 0, which is all that Theorem 6.2 uses.
  - MZ.4/monic-frobenius-descent: the twisted variant needs ε ∈ F_q^×.
  - MZ.3/mz-property-values: alternating values have the MZ property only after normalising by γ_1⋯γ_r, or when the total character is trivial.
  - The minor items: counting conventions in weight 0; Chen's proof indices; F_p versus F_q coefficients; the type conditions in the reduction step; Chang's route to entireness through DM.8/entire-from-equation; denominator clearing in the θ-degree bound; the q > 2 range of the small-weight AMZV bound.
- The reader was checked with a Python port of the site renderer's inline parser and with markdown-it: no stray emphasis, maths or links, and the only bold text is the intended labels.

## Source issues

E1 and E21 are new. E21: in the proof of Theorem 1.11, Im–Kim–Le–Ngo Dac–Pham write AJ_w for the index set of AT_w, although p. 24 defines AJ_w as the arrays with no entry divisible by q. E1: Chang–Chen–Mishiba Definition 2.2.2 sets 𝔏_{<d}(∅) = 1 only for d ≥ 1. The identity 𝔏_d(s)𝔏_{<d}(P) = 𝔏_d([s,P]) then fails at d = 0, P = ∅, which the proof of Proposition 2.3.5 uses; the proposition itself holds. The packet uses Ngo Dac's convention S_{<d}(∅) = 1 for all d.

E2–E20 restate in this packet's ids the findings of the reviewed paper extractions that the planned statements depend on. Each was rechecked at its locator. The main ones:
- B*_0 in Ngo Dac's Proposition 2.12;
- c ≠ 0 in the ABP criterion;
- A[t] instead of K[t] in Ngo Dac §6;
- the termwise convergence bound (IKLNDP Condition 2.1);
- the strong Brown congruences;
- Proposition 4.10's inclusion;
- Theorem 3.4's mixed-character step;
- the k̄-span in Corollary 1.2.7.

## Sources read (scratch copies, hashes in the packet)

- Ngo Dac HAL v1, fetched with a plain curl user agent, since HAL's bot check challenges browser agents.
- Chang–Chen–Mishiba arXiv v2 and Im–Kim–Le–Ngo Dac–Pham arXiv v2, each in full.
- Im–Kim–Le–Ngo Dac–Pham's Note, HAL v3, §§1–2.
- Chang 2014: §§2.2, 3.4, 4 and 5.
- Chang–Papanikolas–Yu: Propositions 2.2.1 and 2.3.3.
- Thakur 2009 (power sums), 2009 (relations) and 2010 (shuffles), at the cited theorems.
- Chen–Harada, Proposition 2.12.
- Lara Rodríguez–Thakur, Theorem 3.1.
- ABP and Papanikolas, consulted for the DM.8 interface only.

Not read:
- Anderson–Thakur 1990 and 2009 (not freely available; gap 2);
- Sheats 1998 (gap 1);
- Chang–Mishiba 2021 (gap 3);
- H.-J. Chen 2015, whose formula is derived directly in MZ.1/chen-product;
- Kuan–Lin 2016, whose lemma is proved in full in IKLNDP Lemma 3.3.

## For the reviewer

- Check E1 (new) at CCM pp. 7–9.
- Check that MZ.0/zeta-q-minus-one's derivation from the product expansion of e_C matches DM.2's conventions.
- Check the restated strong Brown argument (MZ.2/strong-brown), the character bookkeeping in MZ.5/acmpl-period-relations, and the two-row computation (MZ.4/two-row-system).
