# PKG-K2SymbolsBrauer~codex — package handoff

Issue #11065. Worker: Claude (session `claude-DmMdvr`), 2026-10-19. The claim bot confirmed this session's claim. This is the complete package submission, for independent review; it is not a claim that any target is formalised.

The run was handed #11067 first in its priority list, but that issue duplicates the package job #11082, which is already done (PR #11091) and under review (#11084). It was skipped, and #11065 is the first job on the list that was neither taken nor done.

## Delivered

- `research/blueprint/packages/K2SymbolsBrauer/README.md` (about 384 KB).
  - Layout: Summary; Scope and ownership, with a Prerequisites and boundaries subsection; Conventions; Exact supplier contracts; How to read the build.
  - 14 layers with 235 `###` subsections. Each layer ends with Examples and Dependencies.
  - Downstream consumers and References.
- `research/blueprint/packages/K2SymbolsBrauer/Suggested.lean` (416 lines). It imports `Mathlib`, `TauCeti.RingTheory.Valuation.Discrete.Order` and `TauCeti.FieldTheory.FunctionField.Divisor.Eval`.
- `research/blueprint/packages/K2SymbolsBrauer/metadata.toml` (`topic = "math.KT"`).

Inputs used:
- all 14 accepted packets `K2SymbolsBrauer--T.*`, 240 nodes in total;
- the support brief in the T.3 packet's restructure field (the four complete-DVR targets);
- the stage descriptions;
- the supplier packages GeneralAlgebraicKTheory, StableHomotopyKTheory and KTheoryLowDegrees;
- the MotivicEtaleKTheory packets;
- TauCetiRoadmap `origin/main`, read-only;
- the pinned and current Tau Ceti libraries.

The README was rendered from the packets and then edited:
- duplicate follow-up targets were merged;
- planning vocabulary was removed;
- every locator was normalised.

## Layer map

| Layer | Content | Plan stages |
|---|---|---|
| 1 | Central extensions, five-term sequence, Hopf, recognition theorem | T.1:classical (group theory) |
| 2 | Steinberg groups, classical K₂, centre theorem | T.1:classical, T.1 (T.1-2) |
| 3 | St(R) → E(R) universal; K₂ ≅ H₂(E) | T.1 (T.1-2) |
| 4 | K₂ ≅ π₂(BGL⁺) ≅ Quillen K₂ | T.1:plus |
| 5 | Steinberg pairings, Milnor K-theory, calculations | T.2, T.2:symbols |
| 6 | Steinberg symbols, Milnor §9 monomial kernel | T.2, T.2:symbols (incl. T.5 packet's seven nodes) |
| 7 | Matsumoto's theorem | T.2, T.2:symbols |
| 8 | Products and the graded map | T.2:graded-map |
| 9 | Tame symbols, Serre algebra, higher residues | T.3:symbols, T.3 (T.3-2) |
| 10 | Bass–Tate, Milnor norms, Kato, Suslin reciprocity | T.4 (T.3 and T.4 packets) |
| 11 | Localization comparison | T.3:localization-comparison |
| 12 | Tame kernels, K₂(ℤ), K₂(ℚ) | T.5 |
| 13 | Dennis–Stein symbols, relative K₂ | T.6 |
| 14 | Galois/Hilbert symbols, cyclic algebras, Tate comparison | T.7 |

## Merged duplicates

Two parallel follow-up packets elaborated the same targets. In each case below, the second target is rendered as a bold-titled paragraph inside the first target's subsection. Its statement, API, Checks and locator are kept there, so nothing was dropped.

- k2-is-centre / stable-centre-completion
- stabilisation / stable-elementary-surjection
- column-root-embedding / column-embedding
- finite-rank-splitting / finite-splitting-relations
- steinberg-is-uce / stable-splitting-completion
- k2-pi2 / chosen-k2-comparisons
- In Layers 5–7, between the T.2 packet and the T.2-symbols packet:
  - pairing-identities / field-calculus
  - tensor-square-presentation / tensor-realization
  - homogeneous-steinberg-ideal / homogeneous-components
  - finite-milnor-vanishing / cyclic-annihilator
  - field-lift-calculus / root-word-normalization
  - symbol-torus-extension / torus-factor-set
  - symbol-monomial-extension / normalizer-lift
  - symbol-extension / bruhat-fiber
  - symbol-extension-local-relations / rank-two-action
  - symbol-extension-exact / faithful-realization
  - infinite-symbol-injectivity / stable-separation
  - matsumoto-equivalence / matsumoto
  - finite-classical-vanishing / k2-finite-field
  - field-symbol-generation / symbols-generate
- unit-part / native-unit-part
- In Layer 10, the T.4 "completion" targets were paired with their T.3 originals (for example bass-tate-sequence / bass-tate-filtration-assembly).
- In Layer 13:
  - dennis-stein-symbol / modern-convention-calibration
  - dennis-stein-relations / general-relations-calculus
  - relative-presentation / guarded-relative-presentation
- In Layer 14:
  - symbol-formula / native-kummer-cup-comparison
  - brauer-valued-symbol / root-brauer-coefficient-adapter
  - local-comparison / normalized-local-invariant-comparison
  - global-reciprocity / global-brauer-reciprocity-adapter
  - chern-class-agreement / normalized-etale-chern-comparison

API names in merged pairs can collide, for example two `unitPart` definitions in §9.1. The second definition's names were renamed (`TameSymbol.ringUnitPart…`). A reviewer may prefer to cut each secondary paragraph down to its genuinely new content.

## Moved-down notions (stated here as targets)

1. **Complete discretely valued fields with arbitrary residue field.** These are §§10.15–10.18:
   - the normalized extension valuation;
   - the integral closure, which is a finite free complete DVR;
   - norm valuation and residue;
   - separable base change with residue component lengths.

   They come from the T.3 packet's support brief, written for an unregistered "LocalFieldsRamification Part II" proposal. TauCetiRoadmap LocalFieldsRamification covers finite residue fields only.
2. **The maximal prime-to-p extension** (Zorn), in §10.11. The plan cited `LocalFieldsRamificationPartII:GF.0`. That accepted node concerns prime-supported extensions, and it has no package.
3. **The Bruhat coordinate of SL_n(F)** (the unique middle monomial factor, with its root-coordinate formulas), in §7.4. ReductiveGroups Layer 7 has the Bruhat decomposition but not this coordinate.
4. **The commuting relation e_ij(a)e_kl(b) = e_kl(b)e_ij(a)** (j ≠ k, i ≠ l) over an associative ring, in §2.2. KTheoryLowDegrees §6.2 states only the chaining identities.
5. **The comparison of the biexact product with Loday's plus product in degree (1,1)**, in §8.1. The plan had requested it from GeneralAlgebraicKTheory K.7.
6. **The Keune–Loday comparison** of relative Steinberg K₂ with π₂ of the homotopy fibre, in §13.8.

## Duplication against TauCetiRoadmap and Tau Ceti

- **Steinberg groups, Milnor K-theory and tame symbols.** No Steinberg group, Milnor K-theory or tame symbol exists in Tau Ceti, pinned or current, nor in Mathlib at the pin. `TauCeti.Algebra.Quaternion.Steinberg` is the quaternion splitting ℍ[K, a, 1 − a] ≅ M₂(K). It is noted in the boundaries.
- **§14.6 norm residue symbol.** ClassicalArithmeticCompletion (TauCetiRoadmap main), §§1.14/1.25, already owns the degree-n norm-residue symbol (`normResidueSymbol`) and its relations. §14.6 was rewritten to cite it, and the duplicated API (8 names) was removed. Only the factorisation through K₂ (`normResidueK2`) is kept.
- **§14.7 quadratic Hilbert symbol.** It uses QuadraticFormInvariants 6C's `hilbertSymbol` and its bimultiplicativity. It adds the conic criterion and the K₂ factorisation.
- **Other ClassicalArithmeticCompletion material.** The degree-n Hilbert product formula is §1.52 there, and §14.9 cites it.
- **Weil reciprocity.** EllipticCurves Layer 2 has f(div g) = g(div f) for elliptic curves. §10.31 states it for every function field, and says that the elliptic case is EllipticCurves' milestone. Tau Ceti has `Divisor.eval` but not the reciprocity theorem.
- **Stable GL and E.** GL(R), E(R) and K₁ are KTheoryLowDegrees Layers 6–8 (equivalently GeneralAlgebraicKTheory §§3.3–3.4).
- **Library names.** A scripted check found all 212 Mathlib/Tau Ceti names cited by the plan at the pins. One exception: `TauCeti.GroupExtension.nonempty_equiv_iff_cohomologyClass_factorSet_eq` is really `TauCeti.FactorSet.GroupExtension.…`, and the supplier contracts use the correct name.
- **TauCetiRoadmap anchors.** All 19 cited anchors exist on `origin/main`.

## Supplier status and roadmap-level coupling

GeneralAlgebraicKTheory (#1212) and StableHomotopyKTheory (#1227) are open TauCetiRoadmap pull requests; the package cites their package section numbers. KTheoryLowDegrees is an atlas package whose README is titled "Grothendieck groups, Cartan maps and Euler forms, part II"; it is cited as KTheoryLowDegrees with section numbers. MotivicEtaleKTheory has no package. Layer 14 cites its accepted M.1, M.2, M.3 and M.8 nodes, and M.3 itself uses Matsumoto's theorem (Layer 7). The coupling is therefore acyclic at layer level (Layer 7 → M.3 → Layer 14) but mutual at roadmap level. Neither roadmap is in the CaraianiNewton tier list. Before going upstream, either the two go together, or Layer 14 moves into MotivicEtaleKTheory.

## What the README could not support

These targets are stated with their K-book or secondary locators, and their primary proofs were not read by the plan:
- the Bass–Tate computations of K_nᴹ for global fields in degree ≥ 3 (§§5.16–5.17);
- the Dennis–Stein completeness for nonfield local rings with residue field 𝔽₂ or 𝔽₃ (§13.6);
- Keune's Theorem 15 (§13.9).

The proofs are parts of those targets, and the README says so.

Tate's local, global and S-integer theorems belong to MotivicEtaleKTheory M.3, and are used only through the comparisons of §14.10.

Several source misprints are recorded in the text:
- the sign in Weibel Ex. III.6.2 (§10.2);
- the independence claim of Ex. III.7.1, since the specialisation depends on the uniformiser (§9.15);
- the normalisation of Ex. III.7.10 (§9.14);
- ⟨r, 1⟩ printed as 0 (§13.2);
- the missing degree restriction in III.7.2(b) (§5.14);
- the tame symbol of Lemma III.6.3, which is the inverse of this roadmap's (Conventions).

## Size

The README is about 384 KB, above the 50–200 KB range in the issue. It carries 244 targets (240 plan nodes and 4 moved-down targets), each with its hypotheses, locator and, for definitions, API and at least three Checks. PACKAGE_REVIEW says never to shrink by dropping tests, hypotheses or locators. Trimming the secondary merged paragraphs (about 40 KB) is a reviewer's option.

## Locators

Every Weibel citation now names the full K-book (2013) and its printed page. The page offset (printed = PDF − 8) holds on every page and was confirmed from the PDF footer. The K-book's SHA-256 matches the packets. Chapter-PDF page numbers were recomputed from theorem labels. A script checked each of the 176 distinct Weibel citations: 173 have their label on the cited page or the next one, and the remaining 3 are proofs continuing onto the cited page.

Other sources keep their own page numbers:
- Matsumoto's article pages;
- Löh's printed pages;
- Stacks tags.

## Adversarial pass

| Statement | Instances tried | Result | Change |
|---|---|---|---|
| Steinberg presentation (§2.1) | opposite roots at n = 3; reverse chaining over M₂(ℤ) with r = E₁₂, s = E₂₁ | relations as stated; opposite roots unconstrained; −sr ≠ −rs | Lean puts i ≠ j in the generator; reverse relation pinned |
| Finite-rank centrality (§2.12) | arbitrary R, n | not deducible from the stable theorem | kept conditional on kernel injectivity |
| Finite splitting (§3.2) | n = 3, 4 vs 5 (auxiliary index outside four) | needs n ≥ 5 | Lean `5 ≤ n` |
| UCE kernel = H₂ (§1.23), existence (§1.22) | trivial G; ℤ² (H₂ = ℤ, not perfect) | perfectness needed | Lean keeps `[Group.IsPerfect G]` |
| Superperfect (§1.8) | ℤ/2, A₅, free group of rank one | each one-condition variant fails a test | — |
| Transgression sign (§1.12) | unitriangular group over 𝔽₃, a = (1,0,0), b = (0,1,0) | ba(ab)⁻¹ = (0,0,2) recomputed | — |
| Marked-kernel equivalence (§1.1) | C₉ with kernels 1 ↦ 3 and 1 ↦ 6 | multipliers 1 and 2 mod 3: inequivalent | — |
| {a, a} (§§5.3, 6.9) | ℝ, characteristic 2, ℂ(t) at t = 0 | {a, a} = {a, −1} ≠ 0 integrally; ∂_t{t, −1} = −1 | Lean `symbol_self`, `symbol_neg_one_neg_one_real` |
| K₂(𝔽_q) (§§5.11, 7.10) | 𝔽₂, 𝔽₃; count (q − 1)/2 nonsquares vs (q − 3)/2 squares in 𝔽 ∖ {0, 1} | vanishes | — |
| Monomial image (§6.11) | 𝔽₃: 24; 𝔽₂: 6; 𝔽₅: h₁₂(2) ↦ diag(2, 3, 1) | n!(q − 1)^{n−1}; ±1-generated W too small | — |
| {−1,−1}₃ = h₁₃(−1)⁻² = w₁₂(1)⁴ (§6.13) | h(1) = 1, w(1)² = h(−1)⁻¹ | holds | — |
| Leading-coefficient retraction (§7.14) | deg f > 0, < 0, = 0 with lc ≠ 1 and lc = 1 | each case descends | — |
| Tame symbol (§9.2) | ℚ at 5: {2,5} = 2, {5,2} = 3, {5,5} = 4, {10,5} = 3; {1/5, 4/5} = 1 | sign factor needed; values recomputed | Lean examples pin ∂{u,π} = ū and ∂{π,u} = ū⁻¹ |
| Specialisation (§9.15) | uniformisers 5 and 10 at 5 | λ₅{5} = 1, λ₁₀{5} = 3 | Weibel Ex. III.7.1 corrected |
| Product formula (§9.14) | {5}·{2} at 5 | 3 in the last normalisation, 2 in the first | — |
| Rigidity (§9.17) | q = p for ℚ_p, p odd | (ℤ/p)² vs ℤ/p: hypothesis q prime to char k needed | kept |
| Degree reduction (§10.2) | expand {e₁/h, −e₂/h} = 0 | identity holds ({e₁, −1} is 2-torsion) | — |
| Prime-to-p closure (§10.11) | ℝ with p odd (closure ℂ); 𝔽_q | {−1,−1} dies in ℂ, killed by 2 | Zorn construction made part of the target |
| Complete-DVR norms (§§10.17–10.18) | s² = t over ℚ((t)); ℚ(i)((t)); α² + tα + a over 𝔽₂(a)((t)) | N(s) = −t, N(1+i) = 2, N(α) = a = N(√a); l ⊗ l ≅ l[ε]/ε² | targets added |
| Disjoint-support reciprocity (§10.31) | local factors on supp div f and supp div g | f(div g) = g(div f) with the stated signs | Lean theorem on Tau Ceti `Divisor` |
| Degree-two residue square (§11.8) | {2,5} at 5: 2 vs 3; {5,5}: −1 both | the inversion is needed; diagonal symbols do not detect it | — |
| Dennis–Stein word (§13.1) | 2 × 2 product with u = 1 − rs | image diag(u, u⁻¹)·h(u)⁻¹ = 1 | Lean word takes u and the equation u = 1 − rs as arguments |
| ℤ/4 detector (§13.14) | admissible ⇔ rs even; ⟨3, 2⟩ ↦ {−1, −1} | consistent | — |
| Milnor K of ℝ (§5.15) | n = 0 (ℤ, excluded), n = 1 (ℝ^× = ±1 × ℝ_{>0}) | decomposition only for n ≥ 1 | — |
| Hilbert symbol over ℚ (§14.7) | (3,−1), (7,−1), (21,−1) | all −1, so not bilinear over ℚ | local hypothesis kept |
| Norm residue symbol (§14.6) | ℚ₂: (−1,−1) = −1; ℚ₃: (3,−1) = −1 | — | duplicate of ClassicalArithmeticCompletion removed |
| Steinberg pairing (§5.1) | constant 1 at (1,1,1) | 1 = 2, rejected | Lean example proved |

## Suggested.lean and lean-check

`lean-check research/blueprint/packages/K2SymbolsBrauer/Suggested.lean` exits 0. Its only diagnostics are 23 `declaration uses 'sorry'` warnings. Memory was above 20 GB.

`scripts/check_sorry_data.py` passes: there are no sorry'd data definitions. Every definition has a real body:
- `IsCentralExtension`, `IsUniversalCentralExtension`, `IsSuperperfect`;
- `StGen`, `steinbergRels`, `Steinberg` (a `PresentedGroup`), `Steinberg.x`, `Steinberg.w`, `Steinberg.hDiag`, `Steinberg.finiteRankSymbol`, `Steinberg.dennisStein`;
- `IsSteinbergPairing`, `steinbergRelations`, `SymbolGroup`, `symbol`, `milnorRel`, `MilnorK`, `MilnorK.ofUnit`, `MilnorK.symbol`;
- `tameUnit`.

Proved results:
- the theorem `Steinberg.x_add`;
- 6 examples:
  - the identity is a central extension;
  - x_ij(0) = 1;
  - the constant pairing 1 is not a Steinberg pairing;
  - the Steinberg relation in `SymbolGroup` and in `MilnorK`;
  - the two tame-symbol normalisations.

The remaining theorems are stated milestones proved by `sorry`:
- the recognition theorem and UCE existence/kernel;
- the Steinberg relations, perfectness, finite splitting and existence of the elementary map;
- finite-rank symbol bilinearity and the Steinberg relation;
- symbol skew-symmetry, {a,a} = {a,−1}, {−1,−1} ≠ 0 over ℝ, finite-field vanishing and the universal property;
- Milnor symbol permutation and finite-field vanishing;
- tame-unit integrality, bimultiplicativity and the Steinberg relation;
- disjoint-support Weil reciprocity.

What cannot be typed at the pins is listed in the file's closing comment: the stable St(R) and K₂, the π₂ comparisons, Matsumoto's theorem, residues and norms, the localization comparisons and the arithmetic symbols.

## Checks run

- `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems.
- `lean-check` as above.
- Coverage: every one of the 240 plan nodes is placed in a layer.
- A script confirmed that no prerequisite of any target points to a later subsection.
- Process-word and stage-id scans of the README returned nothing beyond the deliberate supplier names (MotivicEtaleKTheory M.1/M.3/M.8).
- The locator script described above.

No untrusted text asked for any action. Issue #11065 has only the maintainer's and the claim bot's comments.

## Where to resume

For the reviewer:
- check the secondary merged paragraphs for redundancy;
- confirm the §14.6 rewrite against ClassicalArithmeticCompletion §1.14;
- decide the roadmap-level coupling with MotivicEtaleKTheory.
