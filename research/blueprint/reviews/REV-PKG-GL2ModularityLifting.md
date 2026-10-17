# REV-PKG-GL2ModularityLifting

This is the independent package review of `research/blueprint/packages/GL2ModularityLifting/` (README.md, Suggested.lean, metadata.toml). It checks the package against the accepted plan: `research/blueprint/packets/GL2ModularityLifting--R22.1.json`, `--R32.3.json` and `--R32.6.json`. The reviewer was Claude, session claude-s8wZqU, on 2026-10-17, and did no part of PKG-GL2ModularityLifting.

**Verdict: accepted, with the corrections below applied in place.** One open question remains for the maintainer, and it is not a defect of this package. Layers 7–12 rest on the conditional inputs LL1–LL3 and CC1–CC5. These belong to PadicLocalLanglandsForGL2Qp and CompletedCohomologyAndLocalGlobalCompatibility, which lie outside the build order (see "For the maintainer"). Layers 1–6 do not use them, and those are the six layers Caraiani–Newton needs.

## What was checked

1. **Upstream form.** The package was compared with TauCetiRoadmap `AdicSpaces/README.md`, `IntegralHeckeAndGaloisDeterminants/README.md` and `ClassFieldTheory/README.md` (current main 0d144d0), and with UPSTREAM_GUIDE.md. The README has the upstream shape:
   - Summary, Scope and ownership, Conventions, Exact supplier contracts and How to read the build.
   - Twelve layers, each closing with Examples and Dependencies.
   - Worked examples, Downstream consumers, Corrections to the sources and References.

   A script checked every `### k.n` section. Each has a locator and a *Needs* line, and every definition has at least three Checks. One theorem section, §7.10, was flagged because its API bullet has only two Checks; a third, negative-control Check was added.
2. **Fidelity to the plan.** The three structural changes the packager recorded were read against the packets and kept: three lower-tier restatements were removed, the upward PotentialModularityAndCompatibleSystems citations were removed, and the twist classification became a new target (§7.11, formerly §7.12). A script then resolved all 121 `Rxx.y/slug` citations against the node ids of every packet. One was dead:
   - The citation was `OrdinaryAutomorphicFormsAndModularityLifting R21.5/crystalline-reducible-reduction-is-ordinary`, in the supplier contract and in §11.2.
   - The node left R21.5 in #9691, which pointed its consumers to PadicHodgeTheory R06.4. The citation was repointed (see Corrections).

   Supplier tiers were checked with `upstream/CaraianiNewton.md`. All fifteen suppliers have tier ≤ 20, against tier 21 for this roadmap. PotentialModularityAndCompatibleSystems (22), ClassicalSerreModularity (24), EllipticCurveModularity (25) and ModularityAndLanglandsExtensions (26) appear only as downstream consumers. No `FoundationsAndLibraryIntegration` or `UPSTREAM:` id appears.
3. **Own words.** No source passage or section-by-section summary was found. One clause of Gee's notes had been copied verbatim (§1.10, quoting p. 35), and it is now paraphrased. The remaining quoted strings are paper titles or two- and three-word terms.
4. **No process.** The following residue was removed:
   - Packet-node slugs used as words: `patched-support` ×4, `component-patching` ×3, `dyadic-oddness` ×2, `good-component`, `nice-prime` and `transfer-dyadic`.
   - Slug text in *Needs* lines, such as "(layer 10 dirichlet density chebotarev)", ×7.
   - Doubled roadmap names left by a substitution ("Global GlobalGaloisDeformations" and similar), ×8.
   - Stage ids of a downstream roadmap ("R33", "R33.1").
   - "that paper was not read", "which was not read here" and "the author PDF read".
   - "The current §7.2 defines only the odd-prime statement", which was stale and wrong.
   - The boilerplate "Define the stated predicate or arithmetic function …", ×4.
   - Lowercase hypothesis fragments without full stops, in §§9.3, 10.15, 12.1, 12.2 and 12.3.
   - Orphan labels "(i)", "(ii)" and "(iii)" in §§7.6, 7.9 and 7.10.
5. **Suggested.lean.** `lean-check` (Mathlib 082e2d3, Tau Ceti f790474) was run twice.
   - Before the edits: exit 0, with 15 `declaration uses sorry` warnings.
   - After the edits: exit 0, with 10 `declaration uses sorry` warnings, one on each of the ten theorem statements, and no other warning or error.

   The file has 280 lines and the 2026-10-12 shape. It has two light real-bodied definitions of carriers at the pins (`patchingRadius`, `normalizedWeight`), two predicates and sets over concrete data (`panGoodComponent`, `panExtensionComponents`), and ten theorem statements. It has 19 `example`s, all proved, and `#check`s that pin four library declarations. There is no sorry'd data, no `True` placeholder and no process comment.

   All ten theorem signatures were checked against the README statements and checked to be true:
   - `patchingRadius_mono_level` (p ≥ 1).
   - `normalizedWeight_shift` and `two_le_normalizedWeight`.
   - `odd_det_of_odd_reduction`. The proof sketch: det c = ±1 over a domain, and 2 ≠ 0 in k excludes +1.
   - `panGoodComponent_seed`, `_step` and `_mono`.
   - `panExtensionComponents_kernel_le`, `_id` and `_comp_subset`.

   The closing comment now names every README-only definition by layer.
6. **metadata.toml** is the single line `topic = "math.NT"`, which fits.
7. `python3 research/blueprint/intake.py check-files` on the three package files reports 0 problems, and the files contain no local paths.

## Duplication against Tau Ceti

- **TauCetiRoadmap main (0d144d0).** Its README and Suggested files were searched for Taylor–Wiles, patching, modularity lifting, Khare–Wintenberger, deformation rings and pseudodeformations. No roadmap plans this material. IntegralHeckeAndGaloisDeterminants Layers 0–1 are already cited as a contract.
- **Tau Ceti library (a91d3aaf, and f790474 at the pin).** One duplicate was found and removed. README §7.1, "The signed prime p*", and the Lean declarations `pStar`, `pStar_natAbs` and `pStar_emod_four` restated Tau Ceti's `TauCeti.Multiquadratic.oddPrimeDiscriminant` (TauCeti/NumberTheory/Multiquadratic/Prime/Discriminant/Basic.lean). That file has `oddPrimeDiscriminant_natAbs`, `oddPrimeDiscriminant_mod_four_eq_one` (for odd p) and `oddPrimeDiscriminant_eq_neg_one_pow_pred_div_two_mul`. Tau Ceti's `exists_mem_sq_eq_oddPrimeDiscriminant` (…/Cyclotomic/GaussSum.lean) gives √p* ∈ ℚ(ζ_p). All of these exist at f790474 and compile in the shared build.
  - The README section was deleted, and Layer 7 was renumbered: §7.2–§7.12 became §7.1–§7.11. Every internal reference was renumbered by script. The script left source references such as "KW II §7.4", "Pan §7.1" and "Emerton's §7.3" unchanged.
  - The Tau Ceti declarations are now cited in Scope and ownership, in the Mathlib and Tau Ceti contract, in the Conventions, in the *Needs* lines of §7.1 and §7.5 and in the Layer 7 dependencies.
  - The Lean file imports the two Tau Ceti modules, pins `oddPrimeDiscriminant_mod_four_eq_one` and `exists_mem_sq_eq_oddPrimeDiscriminant` with `#check`, and pins the sign convention with three `decide` examples: 3* = −3, 5* = 5, and the value −2 at p = 2.
  - The Tau Ceti definition differs from the old `pStar` only at p = 2 (−2 against 2). The roadmap uses p* only for odd p, and the README says so.

## Corrections made

**Citations and locators.**
- §11.2 and the contracts: the dead R21.5 node was replaced by PadicHodgeTheory R06.4/two-dimensional-ordinarity-criterion, part (c), including its endpoint k = p + 1 over ℚ_p. The argument now says why a reducible reduction forces ordinarity for 2 ≤ k ≤ 4 at p = 3: a nonordinary crystalline representation in this range has irreducible reduction. R06.4 was added to the PadicHodgeTheory *Uses* and to the Layer 11 dependencies.
- §5.10 and §5.11: the plan's labels "(2)" and "(3)" were read as parts of a single statement. The source check shows they are two results. §5.10 is Kisin's Theorem (3.5.7), and §5.11 is his Corollary (3.5.8), whose hypotheses are (1)–(3). The text now says so. §5.11's irreducible branch uses §5.10, as Kisin's proof does.
- §5.6: Kisin's (3.4.11) is on p. 68, not pp. 69–70.
- §6.2: the archimedean presentation 𝒪⟦X₁, X₂, X₃⟧/(X₁² + X₂X₃ + 2X₁) is in the remark after the proof of KW II Proposition 3.3, so the locator now reads pp. 19–21.
- The ModularCurvesPartII contract and E12: BCDT §10 corrects the levels only at q ∈ T(ρ̄), with U′_{S,q} = V′_{S,q} = U₁(q^{c_q}), and leaves U_{S,q}, V_{S,q} elsewhere. The old text stated a global equality U′_S = V′_S. §5.2 already had it right.
- The DeformationAndDerivedPatchingAlgebra contract now lists the eleven R03.3 and R03.6 nodes that §§4.2, 4.4, 4.5 and 6.14 cite in their proofs. §6.14's *Needs* now include R03.6/torsion-in-kernel and r-equals-t-torsion-free-quotient.
- §6.14: "Auslander–Buchsbaum … is required in addition from R03.3" contradicted §3.7 and the contract. It now cites R03.3/depth-auslander-buchsbaum-and-dimension-bounds, as §3.7 does. The regularity citation "(regular, §6.7)" was corrected to §6.12.

**Interfaces promised and supplied.** Layer 7 defines four propositions, (a)–(d), but only (a) had a proof pointer (§8.8). The three missing pointers are now stated in the definitions and in the proving sections:
- (b) DyadicLifting is proved by §9.3, with descent to a finite coefficient field and the twist normalised by §7.11 and §7.9.
- (c) ResiduallyReducibleLifting(p) is proved by §10.15, with the de Rham to potentially semistable passage and the same normalisation.
- (d) OrdinaryThreeLifting holds by R21.5/theorem-a-at-three, which is imported.

The labels (a)–(d) were used in §§7.1 and 7.5 but never defined. The Layer 7 introduction now defines them.

**Mathematical precision.**
- §5.3: the equivalence "ρ modular iff ρ|G_{F′} modular" now carries its hypothesis that ρ|G_{F′} is irreducible (Gee Proposition 4.25) in the statement. Before, the hypothesis appeared only in a later paragraph.
- §1.11–§1.13: the framing variables are y₁, …, y_j in Layer 1 and y_{h+1}, …, y_{h+j} from Layer 2 on. This renaming is now stated, and §1.12 and §1.13 no longer mix the two.
- §7.6, `normalizedWeight`: the definition had one Check. It now has four:
  - k = 5 for weights {3, 7}, where dropping the + 1 would give 4;
  - k = 2 for weights {0, 1};
  - 1 for equal weights, which the hypothesis a < b excludes;
  - invariance under a common shift.
- §7.10: a negative control was added for the domain hypothesis. Over ℤ × ℤ, c = diag((1, 1), (−1, 1)) has residual determinant −1 under ℤ × ℤ → 𝔽₃, but det c ≠ −1.
- §6.11 and §6.12 had copies of §6.13's Checks and of its paragraph on T[2]-twist faithfulness. They now have Checks of their own:
  - §6.11: the dimension count h + j + t + 1, the case t = 0, and the role of the domain hypothesis on B.
  - §6.12: the case t = 0. Also the archimedean factor, which is regular after inverting 2 but not formally smooth. Also étaleness of μ₂ only after inverting 2.
- §1.2 and §1.3 had three identical prose Checks. They are now specific to α and to β respectively.
- Layer 7 repeated each named Check as an unnamed copy in §§7.1–7.4; the copies were removed.
- §8.5 repeated three paragraphs of §8.3 and now cites §8.3.
- §8.8's proof described the coefficient descent twice and normalised the twist by a non-existent "§7.7 (ii)". It now cites §7.11 and §7.9.
- §12.3 had a Check about "the two lifts" in a one-representation statement. It now has two Checks: irreducibility of the lift, and the p = 3 ω case.
- In §§12.1–12.3, "the imported twist convention" now cites §7.11 and §7.9.

**Lean.** `pStar` and its two theorems and four examples were removed (see Duplication); the Tau Ceti imports, pins and sign examples were added. The three examples left as `sorry` are now proved:
- the two-edge good-component chain, by `fin_cases`;
- the non-nice shared point, by `Relation.ReflTransGen.cases_tail`;
- the zero target of `panExtensionComponents`, since a prime of a zero ring would be the unit ideal.

The section numbers in docstrings were updated, and the closing comment now lists the README-only definitions by name.

## Source check

The sources were read from public copies downloaded into scratch:
- Kisin's four author DVI files, converted page by page with a small DVI-to-text tool;
- KW II, Gee MLT, CHT (Numdam), Pan, Tung (dyadic), Dieulefait–Pacetti, BCDT and CDT, as PDF.

Three Haiku agents located the passages and returned quotes. The reviewer read the quoted lines for every row marked "fixed" and for Kisin (3.3.1) and (3.5.7)–(3.5.8).

The packager flagged the Kisin DVIs and CHT as not re-read. All of them were checked here.

| README | Locator | Result |
| --- | --- | --- |
| §3.1 | Kisin, finite flat, Prop. (3.3.1), p. 62 | Confirmed: r_m = s·m·p^{m(h+j)} and c_m as stated. |
| §5.6 | Kisin, finite flat, (3.4.11), (3.4.12) | (3.4.11) is on p. 68 (fixed); (3.4.12) pp. 69–70 confirmed, including geometric integrality and formal smoothness. |
| §5.1, §5.7 | Kisin, finite flat, (3.5.4)–(3.5.5), pp. 72–73 | Confirmed: "strongly residually modular", not special above p, residue field 𝔽_p where not potentially ordinary, the p = 5 PGL₂(𝔽₅) condition, and condition (iii) in the proof (p. 73); footnote: Gee removes the residue-field hypothesis. |
| §5.10, §5.11 | Kisin, finite flat, (3.5.7)–(3.5.8), pp. 74–75 | Two separate results; labels fixed (see above). |
| §6.8–§6.9, E1 | Kisin, 2-adic BT, (0.1) p. 2, (0.9) p. 4, (3.2.9) pp. 40–41, (3.3.1)–(3.3.5) pp. 41–46 | Confirmed; (0.9)(2) and (3.3.5)(2) print "Barsotti-Tate" (E1 stands). |
| §7.8, §8.1–§8.6, E2–E6 | Kisin, FM: (1.2.6)–(1.2.8) p. 9, (1.7.5) p. 31, (1.7.14) p. 34, (2.2.1) p. 38, (2.2.10) p. 42, (2.2.14) p. 44, (2.2.16)–(2.2.17) pp. 45–46, intro p. 2 | Confirmed, including the p = 3 exceptions of (1.2.7) and hypotheses (1)–(3) of (2.2.17). |
| §5.16–§5.17 | Kisin, Durham, (3.9)(1), (3.13) p. 19, (3.14) pp. 20–21 | Confirmed: Ind ω₂^{k−1} for 2 ≤ k ≤ p + 1; 2 ≤ k ≤ 2p − 1 and scalar endomorphisms; the weight-two level-lowering remark (p. 21). |
| §1.7 | CHT Lemma 4.1.2, pp. 116–117 | Confirmed. |
| §2.1 | KW II §7.4, p. 63 | Confirmed: Δ_v = Δ′_v modulo N-torsion, N the Sylow-p exponent bound. |
| §2.5 | KW II Cor. 7.5, pp. 65–66 | Confirmed. |
| §2.9 | KW II Prop. 7.6, pp. 66–67 | Confirmed, including (f\|⟨h⟩)_χ = χ^{−1}(h)f_χ\|⟨h⟩. |
| §3.4–§3.7 | KW II Prop. 9.2 (I)–(III), p. 81 | Confirmed. |
| §5.4, §6.15 | KW II Thm 9.7, p. 89 | Confirmed, including "split at p if ρ̄\|D_p irreducible or k(ρ̄) = p + 1" and (α) at p = 2 only for k(ρ̄) = 2. |
| §6.2 | KW II §3.1, Prop. 3.3 | Presentation is in the remark after the proof, p. 21 (fixed). |
| §6.12–§6.13 | KW II Lemma 9.6, p. 88 | Confirmed. |
| §1.1 | KW II §9.1.1, p. 78 | Confirmed ([F : ℚ] and \|Σ\| even after base change). |
| §5.5, §5.18 | KW II §10.2, p. 92 | Confirmed (Gross's N > 4; the k = p + 1 cases from Kisin and Diamond). |
| §4.5 | Gee MLT Lemma 5.7, p. 35 | Confirmed. |
| §2.5, §2.7 | Gee MLT Props 5.8–5.9, pp. 36–37 | Confirmed. |
| §4.1 | Gee MLT §5.6, pp. 33–34 | Confirmed: (X − 1)² and (X − ζ)(X − ζ^{−1}). |
| §10.1 | Pan Def. 4.1.4, p. 39 | Confirmed (four conditions). |
| §10.6 | Pan Cor. 4.1.8, pp. 39–40 | Confirmed; the p = 3 condition comes from Thm 4.1.7. |
| §10.2, §10.7, §10.12, §10.14 | Pan §7.2.4 p. 114; Lemma 7.1.3 p. 112; Cor. 7.4.22 p. 121; Thm 7.1.1 p. 111 | Confirmed. |
| §9.1, §9.2, §9.3, E11 | Tung dyadic Lemma 5.3.2 p. 28; Prop. 3.2.7 p. 15; Thm 8.0.3 p. 38; Thm A p. 2 | Confirmed; the bar in 8.0.3(3) is present (E11 stands). |
| §8.9 | DP Lemma 1.14 p. 8; Paso 1 p. 10; Lemma 2.3 pp. 12–13 | Confirmed (Lemma 2.3 applies Theorem 1.4 at p = 3). |
| §7.3, E10 | DP Thms 1.6–1.7, p. 4 | Confirmed: p ≥ 5 in 1.6; no finite-order condition on ψ in 1.7 (E10 stands). |
| §5.15 | BCDT Thm 1.4.2, p. 13 | Confirmed. |
| §5.2, E12 | BCDT §10, pp. 77–78 | Corrected levels only at T(ρ̄) (contract and E12 fixed). |
| §5.13 | CDT Thm 5.4.2, p. 22 | Confirmed. |

## Adversarial mathematics pass

| Statement | Instances tried | Result |
| --- | --- | --- |
| §1.8 quadratic case | F = ℚ, p = 5, S₀ = {5}, u = 3, ℚ(√11) | 11 ≡ 1 mod 5 is a square, so 5 splits; 11 ≡ 2 mod 3 is not, so 3 is inert. The example holds. |
| §5.3 Check | L₃ = ℚ₃(√−3), F′ = ℚ(√6) | −2 ≡ 1 mod 3 is a 3-adic square, so ℚ₃(√6) = ℚ₃(√−3). Holds. |
| §5.3 statement | ρ\|G_{F′} reducible | The iff needs ρ\|G_{F′} irreducible; that hypothesis was added to the statement. |
| §5.4, §5.18 examples | 11a1 at p = 3 | The mod-3 image is GL₂(𝔽₃) (11a1's only non-maximal prime is 5) and good ordinary reduction at 3 gives k(ρ̄) = 2. Holds. |
| §5.9 example | 11a1 at p = 11 | Split multiplicative reduction (a₁₁ = 1) gives type (C), and the mod-11 representation is irreducible. Holds. |
| §5.11 | p = 5 PGL₂(𝔽₅) condition over ℚ | Automatic: S₅ has no cyclic quotient of order 4, so the kernel cannot fix ℚ(ζ₅). Oddness is automatic for p > 2. |
| §5.17 | k = p + 1, nonordinary | V̄ ≅ Ind ω₂^{p} ≅ Ind ω₂, irreducible of Serre weight 2 (Kisin, Durham (3.9)(1)). Holds. |
| §3.2 pigeonhole | b = 2, r_m = 3 | Degree-6 monomials in two generators have an exponent ≥ 3. Holds. |
| §3.1, Lean | s = 1, p = 3, m = 2, h + j = 1; h + j = 0 | r_m = 18; r_m = s·m. Monotonicity in m holds for p ≥ 1. |
| §6.2 | (1 1; 0 −1), diag(1, −1), −1 | Squares to 1, odd, reduction ≠ 1 / = 1; −1 is even. Eigenvalues {1, 1} with c² = 1 force c = 1 in characteristic 0. Holds. |
| §6.10 | ψ = det ρ·χ₂^{−1} | Finite on every inertia group (Sen at 2; pro-ℓ to 2-adic is finite) and unramified almost everywhere, so finite order by Kronecker–Weber. Holds. |
| §7.6 `normalizedWeight` | {3, 7}, {0, 1}, {4, 4}, a common shift | 5, 2, 1, invariant; the variant b − a fails the first. Checks added. |
| §7.9 | k, k′ ≥ 2, {m, m + k′ − 1} = {0, k − 1} | m = 0 and k′ = k. Holds. |
| §7.10 Lean | Domain vs ℤ × ℤ; char k = 2 | True over a domain with 2 ≠ 0. It fails over ℤ × ℤ (negative control added) and in characteristic 2 (§6.2). |
| §7.11 | Weight-one h; χ through ℤ_p^× with a non-algebraic weight | Hodge–Tate characters of G_{ℚ_p} are ε^m times finite-on-inertia (Sen), so χ = ε^m μ. Weight one gives equal weights. Holds. |
| §8.9 (iii) | det ρ = ψε^{k−1} | Oddness ⟺ ψ(c) = (−1)^k. Holds. |
| §10.7–§10.12 | d = 1, d = 4 | h¹ − h² = 2d. Dimension counts 1 + d. The bound 2d − 1 > d + 1 needs d > 2. Holds; the Checks already record this. |
| §11.2 | p = 3, k ∈ {2, 4}, reducible reduction | Nonordinary crystalline in 2 ≤ k ≤ p + 1 has irreducible reduction (Ind ω₂^{k−1}), so the representation is ordinary and the inertial ratio is ω^{k−1} = ω ≠ 1. Holds with the R06.4 citation. |
| Lean `panGoodComponent` examples | Chain {0}, {0, 1}, {1, 2}; non-nice shared point | Both proved. |
| Lean `oddPrimeDiscriminant` | p = 2, 3, 5 | −2, −3, 5 (`decide`). The p = 2 value differs from the old `pStar`; this roadmap uses p* only for odd p. |

## For the maintainer

1. **Conditional inputs from outside the build order.** Layers 8–10 and parts of Layers 7 and 12 are conditional on the named inputs LL1–LL3 and CC1–CC5:
   - LL1–LL3 come from PadicLocalLanglandsForGL2Qp R30.6 (Breuil–Mézard, Kisin's local inequality, Emerton's locally algebraic vectors).
   - CC1–CC5 come from CompletedCohomologyAndLocalGlobalCompatibility R31.2–R31.6 (completed Hecke algebras, patched modules and the independence of the auxiliary globalisations).

   The README states each input with its source, and every target that uses one names it in its *Needs* line. Layers 1–6 do not use them (checked by script). The OrdinaryAutomorphicForms package also states inputs as conditional, so there is precedent. Where these layers go upstream is the maintainer's decision, as the packager's handoff also says.
2. **Required in addition.** The supplier requests of the plan (54, per the packager) are listed under *Required in addition* for 12 of the 14 suppliers, all of tier ≤ 20; the sections that use them depend on the suppliers adding them. One of them is the PadicHodgeTheory R06.4 endpoint. Several suppliers are already open pull requests on TauCetiRoadmap: AutomorphicGaloisRepresentations (#1007), SerreWeightAndLevelOptimisation (#1013), HilbertModularVarietiesAndShimuraCurves (#1005) and GL2AutomorphicRepresentationsAndTransfer (#931). Their additions should be carried there.
3. **Node moved.** Consumers of the removed `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/crystalline-reducible-reduction-is-ordinary` should cite `PadicHodgeTheory:R06.4/two-dimensional-ordinarity-criterion`. The packet `GL2ModularityLifting--R32.3.json` (node `R32.5/crystalline-weights-two-four-completion`, three occurrences) still cites the old id; a package reviewer may not edit packets.
4. The packager's notes for other owners still apply: ClassicalSerreModularity's citations of R32.1 and R32.5, and the AutomorphicGaloisRepresentations R19.3 upward edge.
