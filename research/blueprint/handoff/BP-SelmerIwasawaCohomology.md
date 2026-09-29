# BP-SelmerIwasawaCohomology — handoff

Agent: Claude Code — cc-39fac3. Issue #988. Fourth checkpoint, within the RS-08 boundaries.

## Checkpoint 4: L4 (6 nodes)

**Sources.** RJW §10.5 and §13.5 (arXiv v2, sha256 efa1e101…c039c4). Pages 52 and 71 were rendered, and the published
Essential Number Theory text (sha256 78d0479b…44a6), pp. 171 and 197, was compared.

**Nodes:**
- `local-units-iwasawa-cohomology`;
- `tate-twist-greenberg-selmer` (planet);
- `criticality` (definition);
- `greenberg-main-conjecture` (definition, planet; propositions only);
- `greenberg-conjecture-tate-twists`;
- `bloch-kato-condition` (construction).

**Cross-packet prerequisites:**
- EulerSystemsCyclotomicMainConjecture: L0 `cyclotomic-kummer-classes`, `cyclotomic-euler-system`, and L3
  `cyclotomic-main-conjecture`;
- PadicMeasuresIwasawaAlgebras L4: `characteristic-ideal`, `character-decomposition`.

**New requests:** IntegralIwasawaTheory L1 (X_∞, Y_∞) and PadicHodgeRegulators L1 (H¹_f). The ProfiniteCohomology
Layer 5 request is extended.

**Findings:**
- **E4** (error): the norm relation (1 − ℓ^{−1})c_m should be c_m^{1−Frob_ℓ^{−1}}.
- **E5** (misprint): "n ≥ 0" should read n ≤ 0.

Both are in the published version too.

**Remaining in L4:**
- the Gamma factor from Hodge data;
- the Bloch–Kato–Greenberg comparison;
- lattice changes and control;
- the IntegralIwasawaTheory exact sequence;
- determinants;
- Burungale–Tian.

**Checks.** `check_blueprint.py`: 46 nodes, 0 errors, 0 warnings. The Lean file compiles with exit 0 against the pinned
Mathlib. It adds two checked tests: the Tate-twist parity table for −6 ≤ n ≤ 6, and the non-criticality of ℚ_p.

## Checkpoint 3: L3 (7 nodes)

**Sources:**
- Nekovář, *Selmer complexes* (Astérisque 310, Numdam; sha256 61c84e5a…2153f), §§8.3–8.4, read on the page images.
  The OCR text layer is unreliable for formulas.
- Rubin, Appendix B §§3–5.
- Burungale–Tian (3.2).

**Nodes:**
- `iwasawa-cohomology`.
- `iwasawa-shapiro` (planet).
- `iwasawa-descent` (planet).
- `iwasawa-torsion-criterion`.
- `universal-norms-unramified` (planet).
- `semilocal-cohomology`.
- `iwasawa-twist`.

**Cited ArithmeticGaloisDuality nodes:**
- R02.1's `tate-inverse-limit`, `mittag-leffler-lim-one` and `carrier-comparison`.
- R02.2's Hochschild–Serre, `first-quadrant-spectral-sequence` and `finite-index-descent`.
- R02.3's `restricted-ramification-group`.
- R02.4's `global-finiteness`.

**New requests:**
- PadicMeasuresIwasawaAlgebras L1.
- Tau Ceti ProfiniteCohomology Layers 6, 7 and 12.

**Remaining in L3:**
- duality (Nekovář 8.5, 8.9);
- determinant lines;
- correction complexes;
- Selmer control;
- Burungale–Tian's lattice independence.

**Checks.** `check_blueprint.py`: 40 nodes, 0 errors, 0 warnings. The Lean file compiles with exit 0 against the pinned Mathlib. It adds two checked tests: the H⁰ vanishing argument over ℤ, and the twist at the augmentation.

# Checkpoints 1–2

## What is done

The packet has 33 nodes:
- 12 constructions, 14 lemmas, 6 theorems and 1 comparison;
- 58 API items and 42 unit tests;
- 10 planets;
- 25 baseline declarations;
- 12 requests and no gaps.

**L0 (partial, first checkpoint).**
- p-adic completion, true against the tensor product for units and S-units, and false for local
  fields and for F^×.
- The Kummer maps along the μ_{p^m} tower, and the limit Kummer map.
- H¹(G_K, ℤ_p(1)) ≅ lim K^×/(K^×)^{p^m}, and H¹(G_{F,S}, ℤ_p(1)) ≅ ℤ_p ⊗ 𝓞_{F,S}^×.
- The inverse-limit record.

**L1 (partial, this checkpoint).** RS-08 asks L1 to state the parametric pairing lemmas before L2
instantiates named conditions, and L2 depends on L1 in the stage graph. L1 therefore holds:
- `orthogonal-complement`: F^⊥ under a pairing, with double orthogonal, image/preimage, counting,
  and the quotient pairing. It is Mazur–Rubin's dual local condition.
- `lattice-pairing-compatibility`: the local pairings for T, V, W and W_M are compatible (Rubin
  Proposition 4.3's squares).

**L2 (partial).** From the first checkpoint:
- Selmer data and the Selmer kernel;
- change of conditions, functoriality and propagation;
- the passage V → T, W;
- the unramified and Greenberg conditions;
- Galois Selmer groups;
- Pontryagin duals and coranks;
- the elliptic Selmer group.

New in this checkpoint:
- `dual-selmer-structure` (Mazur–Rubin Definitions 2.1, 2.5).
- `unramified-dimension-count` (Rubin Corollary 3.3).
- `finite-unramified-comparison`: the bad-prime comparison terms (Rubin Lemmas 3.5 and 3.8,
  Remark 3.7).
- `finite-condition-rational-duality` (Proposition 4.2).
- `finite-condition-lattice-duality` (Proposition 4.3; Mazur–Rubin Proposition 1.7(i)).
- `selmer-limits` (Proposition 5.6, Lemmas 5.4 and 5.7, Remark 5.5).
- `selmer-structure-poitou-tate` (Theorem 7.3, Remark 7.4), built on ArithmeticGaloisDuality
  R02.4's `poitou-tate`.
- `selmer-poitou-tate-limit` (Corollary 7.5).

**L3 and L4:** not read.

## Source findings

- E1 and E2 (RJW) are unchanged.
- **E3** (misprint, new). In Rubin's proof of Theorem 7.3, p. 19, the snake-lemma map is printed
  (loc^f_{Σ,Σ})^∨; it is (loc^f_{Σ,Σ_0})^∨. The register's Rubin entries cover only Chapter III §2.1.

## Requests

- **ArithmeticGaloisDuality R02.4** (new): local Tate duality for V, W_M and T × W^* (Rubin Theorem
  4.1). Its `poitou-tate`, `restricted-product-cohomology` and `unramified-exact-annihilators`
  nodes are cited directly.
- **ArithmeticGaloisDuality R02.2** (new): Hochschild–Serre for inertia.
- **ArithmeticGaloisDuality R02.1 and R02.3**: extended; the nodes `tate-inverse-limit`,
  `continuous-section-long-exact`, `lattice-torsion-sequence`, `lim-one-six-term`,
  `mittag-leffler-lim-one` and `h1-finite` are cited.
- **Tau Ceti** ProfiniteCohomology Layers 11 and 12, and LocalFieldsRamification Layer 4 (new).
- The requests of the first checkpoint are kept.

The Tau Ceti stages are carried in `requests` with `neededBy`, because the checker reads `tauceti:`
prerequisites as declarations.

## Lean

`research/blueprint/suggested/SelmerIwasawaCohomology.lean` compiles with exit 0; the only warnings
are `sorry` warnings. It was a single run of the pinned Lean v4.34.0-rc2 against the prebuilt Mathlib
at 082e2d3, with no lake.

The new part defines:
- `orthogonal`, with `mem_orthogonal`, the image rule `orthogonal_map_eq_comap`, and the
  zero-pairing test, all proved;
- `IsPerfect`, the counting lemma over ℤ/n, and the quotient pairing;
- the dual conditions `SelmerData.dualCond` and `dualOf`, with the relaxed/strict swap and the double
  dual.

The Galois-carrier statements (Rubin 4.2, 4.3, 7.3) are sketched in a comment block.

## Checks

- `scripts/check_blueprint.py` with the pinned index: 33 nodes, 0 errors, 0 warnings.
- `intake.py check-files`: see the pull request.

## What remains

- **L0:** cup-product and Shapiro compatibilities.
- **L1:**
  - the Selmer-complex duality map from ArithmeticGaloisDuality D7;
  - the Greenberg-condition annihilators (Nekovář, *Selmer complexes*, §6.7).
  - The transverse condition and the finite–singular comparison are EulerSystemsAndKolyvaginSystems
    ES.1's.
- **L2:**
  - the Selmer complex as a mapping fibre (Nekovář);
  - primitive/imprimitive sequences and lattice-change formulas.
- **L3, L4:** as in the coverage records.

## Sources

**Read**, with hashes in `sourceVersions`:
- Rubin, *Euler systems* (author draft): I §§2–7 and Appendix B §2.
- Mazur–Rubin, arXiv:1312.4052v1: §§1–3.
- RJW, arXiv:2309.15692v2: §10.5 and §13.5.
- Burungale–Tian, arXiv:2506.03465v2: §§1–3.

**Not accessed:**
- the published versions;
- Greenberg, *Iwasawa theory for p-adic representations* (1989);
- Nekovář, *Selmer complexes*.
