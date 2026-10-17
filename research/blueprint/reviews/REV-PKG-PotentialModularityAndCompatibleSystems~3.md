# Independent fixing review: Potential Modularity And Compatible Systems (round 3)

Issue #10010, job `REV-PKG-PotentialModularityAndCompatibleSystems~3`. Reviewer: Claude, session `claude-AXmCqR`, 2026-10-17. I wrote none of the three package rounds and none of the earlier reviews. **Verdict: accepted**, with the corrections below applied to the package. Two inputs remain conditional; the README now states them as explicit supplier contracts, the form GL2ModularityLifting's accepted package uses. Three cross-roadmap ownership items are for the maintainer and are listed at the end; none of them is a defect of this package.

## What was read

- The package README (99 numbered target subsections in 13 layers), Suggested.lean and metadata.toml.
- The four accepted packets (R23.1: 49 nodes, 22 recorded gaps; R24.3: 43 nodes, 7 gaps; R24.4 and R24.5: redirects with 4 and 8 gaps).
- The previous review `REV-PKG-PotentialModularityAndCompatibleSystems~2` with its review.json, and the round-3 handoff.
- PACKAGE_REVIEW.md, WORKERS.md, PROTOCOL.md §§5, 13, 20 and UPSTREAM_GUIDE.md.
- Supplier packages, checked where this README attributes a statement to them: ArithmeticGaloisRepresentations, AutomorphicGaloisRepresentations, AutomorphicGaloisRepresentationsPartII, GL2ModularityLifting, InverseGaloisAndArithmeticFundamentalGroups, PadicHodgeTheory and SerreWeightAndLevelOptimisation.
- The tier order in `upstream/CaraianiNewton.md`. This roadmap is tier 22 and alone in its tier. Every roadmap its targets cite is a Tau Ceti roadmap or sits in tier 21 or below. ClassicalSerreModularity, PotentialAutomorphyInfrastructure, ModularityAndLanglandsExtensions and EllipticCurveModularityPartIIGL2TypeAbelianVarieties appear only as downstream consumers.

## Fidelity

All 92 planned targets keep their anchors and statements, and there is no dead internal link. The 112 anchors are unique.

The earlier rounds added seven subsections, and this round adds two named sub-targets inside existing subsections. Each addition plans something the packets record as a gap or request, so none goes beyond the plan:

- `hodgeTateCocharacterInMonodromy` in §1.17 (packet R24.3/R24.5 gap 3);
- `schemeChebotarevPoints` in §2.20 (packet R23.1 gap 11).

## Corrections applied

1. **Two misattributed suppliers.**
   - §1.17 claimed that ArithmeticGaloisRepresentations §7.6 supplies the statement that the Hodge–Tate cocharacter lies in the identity component of the monodromy group. That section supplies only Zariski closures, identity components and the component field, and the same package excludes Sen theory from its scope. The statement (Sen 1973, Theorem 1, as applied in BLGGT v4 Lemma 5.3.1, p. 71) is now the target `hodgeTateCocharacterInMonodromy` of §1.17. It uses PadicHodgeTheory's Sen module and has a new Check: the cyclotomic character has Sen operator 1, and a finite-image character has Sen operator 0.
   - §2.20 assigned the prime-existence step to InverseGaloisAndArithmeticFundamentalGroups IG.2.6. That target is full-group specialization of covers of the projective line by Hilbert irreducibility, a different statement. The step Bianchi uses is Chebotarev for schemes of finite type over ℤ, cited in the proof of Proposition 4.5.1. It is now the target `schemeChebotarevPoints`:
     - choose a degree-one prime by number-field Chebotarev in the torsor's constant-field extension;
     - count residue-field points of the twists with the uniform Lang–Weil bound, using the twisting argument of §2.11.
2. **Conditional inputs.** A new subsection, "Conditional inputs", under Exact supplier contracts names the two inputs that no roadmap built before this one establishes, and lists their exact users.
   - The de Rham lifting theorems of GL2ModularityLifting (R32.2, R32.3) and its residually reducible transfer (R32.6). That roadmap proves them conditionally on its inputs LL1–LL3 and CC1–CC5. CC5 is the independence of the auxiliary globalizations from Serre's conjecture, the point the round-3 handoff raised. They are used only by `dieulefait_families`, `regularDeRhamPotentialModularity` and the residually reducible branches of §§13.2–13.3. The direct citation of CompletedCohomologyAndLocalGlobalCompatibility, which is outside the build order, is removed in favour of GL2ModularityLifting's inputs.
   - `solubleResidualRegularOrdinarySeed`, the soluble-image case of Taylor's Theorem 1.6. I read the Rogawski–Tunnell scan (Proposition 2.8, p. 25; Theorem 2.9, pp. 26–27) and confirmed the round-3 author's reading: the congruence theorem covers only coefficient places of norm at least a bound that depends on the form. §4.7 now states the seed precisely and marks it conditional. Downstream, §4.13 handles soluble images by Langlands–Tunnell and the Gross and Coleman–Voloch weight results (KW II, proof of Theorem 6.1, p. 54), so nothing else uses this seed.
3. **Larsen and Bogomolov.** §1.20 now states Larsen 1995, Theorem 3.17 with §§1.12–1.13, and Bogomolov 1980 as inputs of that subsection, cited at the places where BLGGT v4 applies them (pp. 65 and 68–69). This replaces a sentence about "independent supplier certification".
4. **Process residue and boilerplate.**
   - The 99 lines "Use `X` for this construction." were replaced. Where the API list already names the target the line was deleted; otherwise it now reads "Prove it as `X`." (or "Define it as" for the two constructions).
   - 53 README-only theorem names were renamed to Lean naming conventions, removing source-numbered names such as `theorem_5_1_part_1_minimal_crystalline`, `taylorLemma11` and `kw_theorem_4_1`. A search of the repository found no other file that uses the old names.
   - Removed:
     - "verified alternate locators";
     - "input from R22";
     - the ClassicalSerreModularity R27.1 stage id;
     - "is the R32.6 input";
     - stage ids in Downstream consumers.
   - The two link texts that did not match their headings now do.
   - Every Dependencies paragraph was regenerated from the layer's *Needs* lines. For example, Layer 1 named EndoscopicTransfer, which it does not use, and omitted AutomorphicGaloisRepresentations, AutomorphicGaloisRepresentationsPartII, GlobalNumberFields, ClassFieldTheory, ReductiveGroups and RepresentationTheory.
5. **Unit tests.**
   - §2.21 (the Isom torsor), §4.10 (the weight shift) and §8.4 (the Hecke–Galois representation) define objects but had no Checks. Each now has three or four discriminating Checks:
     - the trivial-group case;
     - the degree-#H cover versus a zero-dimensional reading;
     - the T_y·N(y) twist, which is ρ̄⊗ε̄_l;
     - weight l+3 against the Hasse shift to l+1;
     - semi-invariance of XˡY−XYˡ only under GL₂(F_l);
     - Eisenstein exclusion and nonreduced specializations.
   - In Suggested.lean, 22 of the 27 examples previously closed by `sorry` now have proofs:
     - the dual-polynomial values;
     - all archimedean multiplicity, Gamma and ε examples, including the elliptic-curve cancellation and the pole at s=1/2;
     - the norm-ten and norm-five virtual classes;
     - all lift-parameter examples, including the q=5 dyadic impossibility;
     - two presentation examples.
   - `Auxiliary.half_order_gt_one` is proved. `Fields.towerLinearDisjoint` is renamed `Fields.inf_sup_eq_of_linearDisjoint`, and the closing comment's family names now match the README.
6. **References.** The duplicate Snowden entry (`snowden-2009`) is merged into `snowden`. Bibliography entries were added for CDT, Savitt (corrected version and corrigendum) and Barnet-Lamb–Gee–Geraghty, which were cited without one, and for Sen 1973, Larsen 1995 and Bogomolov 1980.
7. **Locators.** These were corrected after source checks (details below):
   - Moret-Bailly II §3.1 starts on p. 186;
   - Larsen–Pink 4.9 is a Proposition and 4.10 a Lemma, both on p. 11;
   - KW I, proof of Theorem 9.1, pp. 18–19;
   - DP Definition 1.10, pp. 6–7;
   - Tung (dyadic) Lemma 4.3.3, p. 21;
   - Taylor (Fontaine–Mazur) introduces M on p. 10;
   - the Swinnerton-Dyer weight-12 congruences are on p. 4;
   - CG footnote 5 notation is normalised.
8. **Tau Ceti overlap noted.** §1.16's scope now cites the current library's finite-group norm-one criterion `TauCeti.exists_simple_character_eq_of_characterPairing_self_eq_one`. It also distinguishes that criterion from the continuous-G_F version needed here.

## Source inspection

The sample is `random.Random(10010).sample(headings, 15)` over the 99 numbered headings in README order:

- 8.3, 10.7, 2.14, 1.4, 2.21;
- 2.17, 3.1, 2.5, 4.8, 11.2;
- 11.1, 10.4, 10.11, 2.7, 1.7.

All sources these targets cite were downloaded from the public links. To that sample I added every locator the round-3 handoff flagged, and the cross-check covered about 150 locator rows in all. Haiku agents located items in the extracted text. I re-read every reported mismatch myself: the Moret-Bailly, Larsen–Pink, KW, DP, Tung, Taylor, Skinner–Wiles, Bianchi and BLGGT v4 passages, and the Rogawski–Tunnell page images.

| Source | Items checked | Result |
| --- | --- | --- |
| Moret-Bailly II | 1.1–1.10.1, 2.1–2.4, 3.1–3.10.4 | 3.1 starts p. 186 (fixed); the lemma printed as 3.30.2 is confirmed, as the README says |
| Taylor, Fontaine–Mazur | Lemmas 1.1, 1.5; Theorem 1.6 and its preceding remark; Corollary 1.7; Theorem G; choices of p, L, ψ, N, M | M on p. 10 (fixed); the soluble-image remark is on p. 15 |
| Taylor, Artin II | Lemma 2.1 and proof | printed pp. 11–12 match |
| Taylor 2006 | Lemma 1.3, Corollary 1.5, Theorems 3.2–3.3, Proposition 4.1 with Lemmas 4.4–4.5 and Corollary 4.6, Lemmas 5.1–5.6, Theorem 5.7, §6, Corrections | match; §4.5 matches Theorem 3.3 hypothesis by hypothesis |
| Skinner–Wiles | main theorem and following remark (p. 17), Lemma 1 (p. 20) | match; §4.4 agrees with D_v-distinguishedness, χ₂-goodness and the prescribed-splitting remark |
| KW I, KW II, KW Annals | Theorems 4.1, 5.1, §5 definitions, §8.2, Theorems 6.1, 10.1, §§2.7, 3.3, 9.1–9.3, 10.2–10.3; Annals Theorems 2.1, 3.3, Proposition 3.4, Lemma 3.6, Proposition 3.8 | KW I Theorem 9.1 proof starts p. 18 (fixed); §4.13 matches KW II Theorem 6.1 (i)–(iii) |
| Khare (level one), DDT | §2.1 p. 10; Proposition 3.1; DDT Lemma 4.11 and Theorem 2.47 | match. DDT Lemma 4.11 with a character of order two gives exactly the trace-nonvanishing element §4.12 uses |
| Dieulefait–Pacetti v2 | Theorem 1.9, Definition 1.10, Theorem 1.11, Remark 4, Lemma 1.14 (proof p. 9), Paso 5 | Definition 1.10 starts p. 6 (fixed) |
| Snowden v1 | §§1.4, 2.1–2.5, 3.1, 3.4–3.11, 4.1–4.4, 5.1–5.2, 6.1–6.4, 7.2–7.9, 8.1–8.2 | match; Theorem 4.1.1 is on p. 11, inside the README's range pp. 10–12 |
| Thorne 2012, Geraghty 2010 | §§3–6, 8–10; Geraghty §§2.2–2.7, 3.1, 4.3 | match; Geraghty 2.2.2 and 2.4.3–2.4.4 are Lemmas, so the README's "Definitions" range now reads "items" (fixed) |
| Calegari–Geraghty | Theorem 3.19, Theorem 4.8 and proof, Lemma 4.11, footnote 5 | match |
| BLGGT v1, v4 | v1 §§5.1, 5.2, 5.4; v4 §§2.1, 2.4, 3.1.1, 5.1–5.4, A.1.5, A.2 | match. v4 Proposition 5.2.2's proof cites Larsen 1995 Theorem 3.17 and §§1.12–1.13, and its setup cites Bogomolov 1980 for openness |
| Qian, BHKT, BPHT, Altman–Kleiman, Bianchi, Larsen–Pink | Qian §2 and Proposition 4.2; BHKT Lemma 9.1, Proposition 9.2, Theorem 9.3; BPHT p. 28; AK Theorems (2)–(4); Bianchi Proposition 4.5.1; LP §§4, 6, 8 | LP §4 locator fixed; Bianchi's proof cites Serre's scheme Chebotarev, which led to the §2.20 ownership correction |
| Tung (odd, dyadic), CHT, Swinnerton-Dyer | Theorem 4.7, Remark 4.8; Lemma 4.3.3, Theorem 8.0.3; CHT Lemmas 4.1.1–4.1.2; SD §2 Corollary 1, §4 | Tung Lemma 4.3.3 is on p. 21 (fixed); SD congruences are on p. 4 (fixed) |
| Rogawski–Tunnell (scan) | Proposition 2.8 p. 25, Theorem 2.9 pp. 26–27 | match; the large-norm restriction confirmed by reading the page images |

Sen 1973, Larsen 1995 and Bogomolov 1980 were not opened. They are cited at the BLGGT v4 pages that apply them, which I read. No source passage is copied into the package.

## Duplication against current Tau Ceti

Searched by mathematical object, not only by name: the Tau Ceti library at a91d3aaf, the 54 TauCetiRoadmap directories at 0d144d04, and Mathlib at 082e2d3 for the library-level items. A Sonnet agent did the mechanical search and I checked its hits. No target of this README exists there. The partial overlaps are:

- algebraic Hecke characters and their purity: the library has these, and they are already cited;
- the finite-group norm-one criterion: the library has it, and it is now cited (§1.16 scope);
- `isOpen_range_powMonoidHom`: the library has it, and the pinned name is cited in §2.15;
- the rigidified Picard functor: the library has it, already cited;
- symmetric powers and Abel maps for smooth curves: JacobianChallenge has these, already cited;
- `LinearDisjoint.inf_eq_bot` and `iff_inf_eq_bot`: Mathlib has these, already cited;
- `Matrix.reverse_charpoly`: Mathlib has it, but it is not the normalized dual polynomial of §1.7.

None of the following exists in either checkout:

- compatible systems, Artin systems, monodromy groups, Sen's theorem;
- Moret-Bailly, generalized or compactified Jacobians;
- function-field or scheme Chebotarev, Grunwald–Wang-type extension, soluble prescribed completions, Weil restriction;
- Hilbert or quaternionic forms, deformation rings, Hida theory, Serre weights.

## Adversarial mathematics pass

| Statement | Instances tried | Outcome |
| --- | --- | --- |
| §1.1 dual Δ polynomial | Q₂=X²+24X+2048 dualized | X²+(3/256)X+1/2048 is correct |
| §1.6 odd-rank purity | n odd, real place, H_τ=w−H_τ | forces w even: correct |
| §1.8 tensor/power multipliers | signs ±1, μ(c)=±1, k=0 | μμ′δ and μᵏδᵏ⁻¹ are forced by ε=−μ(c); correct |
| §1.15 archimedean factors | trivial, sign, cyclotomic (w=−2), elliptic (w=1), rank zero, pole at s=1/2 | all values recomputed; the elliptic and pole cases are now proved in Lean |
| §1.16 genuineness | 3·1−ε, 2[V₁]−[V₂] | norms 10 and 5 (proved in Lean); positivity of degree needed |
| §2.11 function-field Chebotarev | constant extension, quadratic constant field, trivial D | factor d·#C/#G correct; zero count in incompatible degrees |
| §2.13 avoidance | Galois K′, intersection with D | generation argument correct; a "simple" subextension means simple Galois group, as in BLGGT A.2.2 |
| §2.15 S-unit congruence | n=1; B=ℚ with T={∞,2}; eighth powers over ℚ | Γ²={4ʳ} excludes −1; cyclicity after adjoining i is needed at 2 |
| §2.7 regular nonsmooth curve | y²z=x³+tz³ over F₂((t)) | regular (the maximal ideal is principal), geometrically cuspidal, Pic⁰=G_a; the control is valid |
| §3.2 auxiliary data | l=5: N₀=ℚ(ζ₄,√−19), a²−a+5=0 | values correct; p>3 needed in §4.6 step 2 |
| §4.5 / §4.6 | l=3; k=l; Tate curve | excluded by hypotheses, matching Taylor Theorem 3.3 |
| §4.7 square-root adapter | ψ trivial at l, ψ(c)=1, local obstructions in Br(F)[2] | quadratic restriction kills local invariants; Hasse principle gives η; correct |
| §4.10 weight shift | k=2; F_(l²) coefficient | weight l+3; XˡY−XYˡ semi-invariant only under GL₂(F_l) (new Checks) |
| §4.12 l=3 | χ=ε̄₃ of order 2 | DDT Lemma 4.11 gives g with χ(g)=−1 and tr ρ̄(g)≠0 unless the kernel restriction is reducible; correct |
| §8.7 prolongation | ρ(c)=diag(1,−1) and ρ(c)=1 | symmetric versus skew matrix; square 1 versus −1 (Lean examples) |
| §8.8 CG local rings | Krull dimension at p and away from p; aI+bN determinant | 5 and 4; derivative 2a is a unit for odd p |
| §10.5 lift types | p=2: q=5 and q=7; p=3, q=5 | the range j<i≤q−1 already forces genuine level two; q=5 impossible (proved in Lean), q=7 exponent 6 of order 8 |
| §10.2 complete intersections | R finite over O, m≤n | dimension count forces m=n and regularity; the Lean signature is true as stated |
| §13.1 residual weights | a−b=1, l=3 | collision 2=(3+1)/2 shows l>2(a−b)+1 is needed (Lean example) |

No false statement was found beyond the ownership attributions corrected above.

## Lean

`lean-check` at Mathlib 082e2d3 and Tau Ceti f790474:

- before: exit 0 with 33 `declaration uses sorry` warnings;
- after: exit 0 with 10 such warnings and no other warning or error, 416 lines.

The ten remaining sorries are five theorem statements (the norm-one coordinate lemma, the two field lemmas, the complete-intersection theorem and the residual-weight inequality) and five presentation examples. `check_sorry_data.py` reports no sorry-bodied data. The file keeps the required shape: `import Mathlib`, one module docstring, one namespace, layer comments in README order, light real-bodied definitions, and a closing comment naming the README-only targets.

Signatures spot-checked against the README:

- `dualPolynomial`;
- `archimedeanD`, `archimedeanGammaFactor`, `archimedeanEpsilon`;
- `eq_single_one_of_norm_one`, `inf_sup_eq_of_linearDisjoint`, `eq_bot_of_fixed_by_generators`;
- `HasPresentation`, `IsFlatCompleteIntersection`, `finite_presentation_complete_intersection`;
- `RequiredLiftParameters`, `weight_ne_half_weights`.

None is vacuous, and none has a hypothesis that contains its conclusion.

## Disposition of the round-2 blockers

| Round-2 blocker | Now |
| --- | --- |
| §2.7 compactified Picard | Planned here: Altman–Kleiman construction, rational-point comparison, compactness |
| §§3.1, 4.7 S-unit congruence and determinant adapter | Planned with proofs in §2.15 and §4.7 |
| §§4.4–4.6 Skinner–Wiles | Statement and remark checked against the Duke paper |
| §4.12 l=3 | Khare §2.1 p. 10 with DDT Lemma 4.11 |
| §4.15 Snowden interfaces | Planned here as four stated inputs |
| §§8.3–8.6 Geraghty and Thorne | Locators checked; ownership below tier 20 is a maintainer item (see below) |
| §8.8 nonadequate images | Covered through Snowden's finiteness theorem with uniform local types |
| §12.1 Brauer overlap | Planned here (`brauerOverlapHomCharacters`) |
| §12.5 general regular de Rham | Conditional input, stated |
| Monodromy source leaves | Sen planned as a target; Larsen and Bogomolov stated as inputs of §1.20 with BLGGT locators |

## For the maintainer (not package defects)

1. AutomorphicGaloisRepresentationsPartII (tier 17, Tau Ceti PR #1006) still requires this roadmap's family operations. It cites `PotentialModularityAndCompatibleSystems:R24.5:operations`, and its order line lists nine moves down from here. The compatible-system carrier that this README imports is AutomorphicGaloisRepresentations §7.1, at tier 18, which is also above tier 17. The carrier and its operations need an owner at tier 17 or below.
2. OrdinaryAutomorphicFormsAndModularityLifting (tier 20) requests the BLGG13 A.4.1 ordinary seed and Thorne's Theorems 9.1 and 10.2 in rank two. This package plans the rank-two ordinary theory in Layer 8 (§§8.3–8.7). When that roadmap is packaged, either it plans these results and this roadmap imports them, or the order changes.
3. §12.5 and the residually reducible branches of §§13.2–13.3 inherit GL2ModularityLifting's outside-order inputs LL1–LL3 and CC1–CC5 (PadicLocalLanglandsForGL2Qp, CompletedCohomologyAndLocalGlobalCompatibility). The rest of the roadmap avoids them.
4. Some supplier contracts that this package imports are still recorded as open in the suppliers' own packets: the small-prime weight witnesses of SerreWeightAndLevelOptimisation and the R22.5 residual adapter (packet R24.4 gaps 2–3). They are imported here with their full hypotheses.

## Validation

- `lean-check …/Suggested.lean`: exit 0, 10 `sorry` warnings only.
- `python3 scripts/check_sorry_data.py …/Suggested.lean`: exit 0.
- `python3 research/blueprint/intake.py check-files` on README.md, Suggested.lean, metadata.toml, review.json and this report: 0 problems.
- Anchor and link audit: 112 unique anchors and no dead internal link. Every reference label is defined and listed.
- No packet, other package or source file changed. No source text or private path is committed.
