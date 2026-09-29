# BP-ArithmeticGaloisDuality — handoff

Agent: Claude Code — cc-39fac3. Issue #675. Fifth checkpoint, within the RS-08 boundaries.

## Checkpoint 5: D7 (11 nodes)

**Source:** Nekovář, *Selmer complexes* (Astérisque 310, Numdam; sha256 61c84e5a…2153f). Chapter 5 §§5.1–5.4 and
5.6–5.7.2 were read on rendered pages (PDF 122–140), because the OCR is unreliable for formulas.

**Nodes:**
- `local-invariant-trivialization`;
- `local-duality-maps` (construction);
- `derived-local-duality` (planet);
- `local-duality-functoriality`;
- `compact-support-cochains` (construction, planet);
- `compact-support-cup-products` (construction);
- `compact-support-euler-characteristic`;
- `global-invariant-trivialization`;
- `derived-global-duality` (planet);
- `duality-after-localization`;
- `compact-support-without-p`.

They cite this packet's R02.1, R02.3 and R02.4 nodes.

**Coverage:**
- D7 is now `partial`.
- R02.3's compact-support item now points to D7.
- The ClassFieldTheory Layer 5 and ProfiniteCohomology Layer 12 requests are extended.

**Source findings:** none new.

**D7 remaining:**
- Nekovář Chapters 2–4 (cited, not decomposed);
- restricted products and unramified subgroups per coefficient regime;
- Shapiro and the projection formula for lattice coefficients;
- continuous Hochschild–Serre with lim¹;
- §5.7.2 onward and §5.5.

**Checks.** `check_blueprint.py`: 72 nodes, 0 errors, 0 warnings. The Lean file compiles with exit 0 against the pinned
Mathlib. It adds two checked tests: the cone differential squares to zero, and the ∪_c sign.

## Checkpoint 4: R02.5 and R02.6 (6 nodes)

**Source:** Darmon–Diamond–Taylor, author PDF revised 9 September 2007 (sha256 254f6e29…cbe8b3), §§2.3, 2.7–2.8.
Pages 62 and 83–84 were read on the images.

**Nodes:**
- `R02.5/greenberg-wiles-formula` (planet).
- `R02.5/selmer-condition-comparison`.
- `R02.6/taylor-wiles-local-count`.
- `R02.6/dual-selmer-killing` (planet).
- `R02.6/sl2-adjoint-h1-vanishing`.
- `R02.6/sigma-criterion` (planet).

They cite SelmerIwasawaCohomology's merged L1/L2 nodes and this packet's R02.2–R02.4 nodes.

**Requests served:**
- ArithmeticStatistics ST.5 and OrdinaryAutomorphicFormsAndModularityLifting R21.4 (the Greenberg–Wiles/Wiles formula).
- GlobalGaloisDeformations R04.3's relative tangent space (its dimension formula).
- GlobalGaloisDeformations R04.5 (`dual-selmer-killing` and `sigma-criterion` as the conditional input).

**New request:** ArithmeticGaloisRepresentations R01.4 (Dickson's classification).

**Source findings:** E5 and E6, two new DDT misprints.

**Remaining:**
- R02.5: the Selmer-complex comparison.
- R02.6: KW II (totally real fields, p = 2).
- R02.4: the lattice and rational versions.
- R02.3: compact support.
- R02.2: Jannsen's compact spectral sequence, and Harpaz–Wittenberg items 149–150.
- D7 and D8.

**Checks.** `check_blueprint.py`: 61 nodes, 0 errors, 0 warnings. The Lean file compiles with exit 0, with only `sorry` warnings; it adds two checked tests (the Greenberg–Wiles acceptance arithmetic and the Taylor–Wiles eigenvalue count).

# Checkpoint 3 and earlier

## Checkpoint 3: R02.2 (7 nodes)

**Source:** Neukirch–Schmidt–Wingberg, *Cohomology of Number Fields*, electronic version 2.3 (sha256
abbb7cde…dcb91), Chapter II §§1, 2, 4. The authors' errata file lists nothing for these sections. Also
Rubin, Proposition B.2.5.

**Nodes.**
- `first-quadrant-spectral-sequence`: the convergent spectral sequence of a first-quadrant double
  complex, on Mathlib's spectral objects. Mathlib's `IsFirstQuadrant` spectral sequence records no
  abutment; the node supplies it.
- `hochschild-serre-spectral-sequence` (planet): NSW (2.4.1), with the edge maps, the morphisms for
  res/cor, and cup products.
- `five-term-transgression` (planet): (2.4.3), identified with ProfiniteCohomology's transgression.
- `transgression-cup-product` (planet): (2.4.4), d₂ = −u ∪. This covers Harpaz–Wittenberg item 148.
- `hochschild-serre-degeneration`: (2.4.2), (2.4.5), (2.4.6), and Exercise 4.
- `finite-index-descent` (planet): cor ∘ res, res ≅ invariants for n invertible, and prime-to-ℓ
  injectivity. This is the maintainer's R02.2 item.
- `compact-five-term`: Rubin B.2.5.

**Requests served:**
- ClassicalAdicEtaleCohomology H0, DiamondEtaleCohomology C8 and ExcursionOperatorsAndSpectralAction
  ES7 (Hochschild–Serre for discrete torsion coefficients, edge maps).
- SelmerIwasawaCohomology L2 (the cd ≤ 1 sequences for its unramified dimension count, PR #3893).

**Remaining in R02.2:**
- the full compact-coefficient spectral sequence (Jannsen §§2–3). Its Göttingen digitisation timed
  out on 2026-09-29.
- Harpaz–Wittenberg items 149–150 (Gille–Szamuely, not read). They follow from the degeneration node
  for 1 → I → G_{F((t))} → G_F → 1.

**Checks.**
- `check_blueprint.py`: 55 nodes, 0 errors, 0 warnings.
- The Lean file compiles with exit 0. Its new section states NSW (1.6.2) on Mathlib's
  `groupCohomology` and the injectivity step, and sketches the spectral-sequence signatures in
  comments.

# Checkpoints 1–2

## What is done

The packet has 48 nodes:
- 11 constructions, 15 lemmas and 22 theorems;
- 69 API items and 41 unit tests;
- 14 planets;
- 28 baseline declarations;
- 29 requests and no gaps.

**R02.1 (partial, first checkpoint).** Its 19 nodes cover:
- derived limits and the Milnor sequence;
- continuous cochains into inverse limits, and the carrier comparison;
- Tate's inverse-limit theorem;
- continuous sections;
- rationalisation;
- the discrete quotient;
- Harpaz–Wittenberg's corrected pointwise-Hom and splitting torsor.

**R02.3 (partial, this checkpoint).** Ten nodes from Milne, *Arithmetic Duality Theorems*, I §4:
- K_S and G_{K,S};
- Hermite finiteness, and the finiteness of H¹ for any finite M (GlobalGaloisDeformations' Φ_p);
- localisation maps, with Tate cohomology at the archimedean places and unramified classes;
- S-ideles, S-units and S-idele classes (Lemma 4.1);
- C_S as a quotient of the idele classes (Proposition 4.3, Lemma 4.4);
- P-class formations, and (G_S, C_S) as one (Proposition 4.2);
- S-idele-class reciprocity (Lemma 4.5);
- the S-unit Kummer sequence (SelmerIwasawaCohomology L0).

**R02.4 (partial, this checkpoint).** Nineteen nodes, from Milne I §§0–2, 4 and 5:
- Ext of discrete modules (Mathlib's `Abelian.Ext` on Tau Ceti's `DiscreteRep`);
- Tate's duality for a P-class formation (Theorems 1.8 and 1.13), and global duality (Theorem
  4.6(a));
- the dual M^D;
- archimedean local duality (2.13), and unramified exact annihilators (2.6, counting proof);
- restricted products and Ш, with the properness of β¹ (4.8, 4.9);
- the self-duality of P^r_S;
- Ext into E_S and J_S (4.12, 4.13);
- **Poitou–Tate duality and the nine-term sequence** (4.10, with the explicit pairing and naturality
  in the coefficients: Harpaz–Wittenberg items 120–121);
- finiteness (4.15), the cohomological dimension with real places (4.10(c)), and surjectivity of
  H² (4.16);
- H^r of the S-units, including H³(K, K̄^×) = 0 (4.18: Harpaz–Wittenberg item 154);
- Tate's global Euler characteristic (5.1), with Lemma 5.3 and the modular induction lemma 2.10.
  Lemma 2.10 rests on the surjectivity of the decomposition map.

**Not read:** R02.2, R02.5, R02.6, D7 and D8. Their coverage records say what to read.

## Stage order: a restructure proposal

R02.3 asks for finiteness of H^i, cohomological dimension and the Euler characteristic, but Milne
(following Tate) proves all of these except H¹ finiteness from Poitou–Tate. They are therefore
planned in R02.4, and the packet's `restructure` proposes rescoping R02.3 and R02.4 accordingly.
Consumers citing R02.3 for the Euler characteristic should cite `R02.4/global-euler-characteristic`
instead: OrdinaryAutomorphicFormsAndModularityLifting R21.3, and EulerSystemsAndKolyvaginSystems
ES.0.

## Source findings

- **E2** (misprint, new). Proof of Proposition 4.3, p. 50: "When S is finite" should read "When S
  omits only finitely many primes".
- **E3** (misprint, new). P. 55: the unramified classes are defined "when v is archimedean"; it
  should read nonarchimedean.
- **E4** (gap, known). Theorem 4.6(b) needs L sufficiently large (the author's footnote 11, from
  W. McCallum). Poitou–Tate is planned without part (b): its first three terms come by Pontryagin
  duality, the alternative the source gives on p. 62.
- E1 (Harpaz–Wittenberg Lemma 5.5) is unchanged from checkpoint 1.

## Requests

These are carried in `requests` with `neededBy`, not as prerequisites.
- **ProfiniteCohomology** Layers 3–12.
- **ClassFieldTheory** Layers 2–7 and 10–13. Layer 13 is asked, as an extension, for the S-split
  Hilbert class field and the principal ideal theorem; if its owner declines, plan both here in
  R02.3.
- **GlobalNumberFields** Layers 6–8.
- **NumberFieldArithmetic** Layers 1, 4 and 6.
- **ProfiniteProPGroups** Layer 1.
- **RepresentationTheory/InductionRestriction** Layer 6.
- **ArithmeticGaloisRepresentations** R01.2.

## Requests from other roadmaps now served

- GlobalGaloisDeformations: R04.2 by `h1-finite`; R04.3, R04.5, G7 and G8 by `poitou-tate`.
- OrdinaryAutomorphicFormsAndModularityLifting: R21.3 by `global-euler-characteristic`.
- SelmerIwasawaCohomology: L0 by `s-unit-kummer-sequence`; L2 by `restricted-ramification-group`
  and `localisation-maps`.
- NoncommutativeAndEquivariantIwasawa: NE.4's duality by `poitou-tate`.
- ArithmeticStatistics ST.5 and OrdinaryAutomorphicFormsAndModularityLifting R21.4 ask for Selmer
  formulas with local conditions. These belong to R02.5 and follow from `poitou-tate` and
  `global-euler-characteristic`.

## Lean

`research/blueprint/suggested/ArithmeticGaloisDuality.lean` compiles with exit 0; the only warnings
are `sorry` warnings. It was a single run of the pinned Lean v4.34.0-rc2 against the prebuilt
Mathlib at 082e2d3, with no lake.

The new part states the following against Mathlib:
- the compositum of good finite subextensions (the shape of K_S);
- restricted products of local cohomology, β and Ш;
- exact annihilators and the duality of restricted products;
- the numerical Euler characteristic, with footnote 13's test proved by `norm_num`;
- the modified archimedean groups, as Tate cohomology of ℤ/2.

The statements on Tau Ceti carriers are sketched in comment blocks: G_S, the class formations, Ext
on `DiscreteRep`, and Poitou–Tate.

## Checks

- `scripts/check_blueprint.py` with the pinned index: 48 nodes, 0 errors, 0 warnings.
- `intake.py check-files`: see the pull request.

## What remains

- **R02.3:** compactly supported cohomology with the modified archimedean terms (Nekovář, *Selmer
  complexes*, §5, or Milne II §2).
- **R02.4:**
  - lattice and rational Poitou–Tate through R02.1;
  - Milne Theorem 4.20 and Corollaries 4.7, 4.17 and 4.21.
- **R02.1:** completed tensor products.
- **R02.2, R02.5, R02.6, D7, D8.**

## Sources

**Read:**
- Milne, *Arithmetic Duality Theorems*, 2nd edition, author PDF (01.07.06), sha256 2c6195ec…c5fb31,
  Chapter I §§0–2, 4 and 5.
- Harpaz–Wittenberg, author final version: §3 Remark 3.1 and §7 Lemmas 7.6–7.7.
- Checkpoint 1's sources: Rubin; the Stacks Project; Harpaz–Wittenberg §5.

**Not accessed:** Tate 1962 and 1966; Artin–Tate; Serre's *Linear representations*, which the
source cites for Lemma 2.10.
