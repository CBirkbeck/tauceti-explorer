# BP-NoncommutativeAndEquivariantIwasawa: checkpoint 5 (Claude Code cc-39fac3)

Claude Code, session `cc-39fac3`, 29 September 2026. Refs #1015; the bot confirmed the claim. **Status: partial.**

## Checkpoint 5: Kakde §§1–4 (11 nodes)

Read from the arXiv text layer: Kakde, arXiv:1008.0142v3 (sha256 5a05da0d…ea45c), pp. 1–30.

**Nodes:**
- **NE.2:** `boundary-surjective-p-torsion` (Lemma 5).
- **NE.3:** `k1-prime` (Definitions 6–7, Lemma 19, Corollary 20).
- **NE.4:** `admissible-extension` (Definitions 1 and 8, Lemma 9); `totally-real-iwasawa-complex` (planet).
- **NE.5:** `totally-real-main-conjecture` (planet), a proposition.
- **NE.6:**
  - `abelian-case` (planet);
  - `burns-kato-patching`;
  - `reduction-to-dimension-one` (planet);
  - `reduction-to-qp-elementary` (planet);
  - `l-elementary-case`;
  - `reduction-to-p-elementary` (planet).

**New requests:**
- AutomorphicPadicLFunctions L3 (Deligne–Ribet).
- IntegralIwasawaTheory I.5 (Wiles).
- Tau Ceti InductionRestriction Layer 6 (Brauer induction).
- ArithmeticGaloisDuality R02.4 (extended; cohomological-dimension-bound is cited).

**New gaps:**
- Oliver's *Whitehead groups of finite groups*.
- Fukaya–Kato §1.

Neither is freely available.

**NE.6 remaining:**
- Kakde §§5–6 (pp. 30–90): the congruence description of K′₁ for one-dimensional pro-p groups, the logarithms, the
  θ–β relation, Theorems 52–53, and the Deligne–Ribet congruences, Proposition 93 and Theorem 94.
- The final theorem.
- Ritter–Weiss.

**Checks.** `check_blueprint.py`: 65 nodes, 0 errors, 0 warnings. The Lean file compiles with exit 0 against the pinned Mathlib; it adds two checked tests (the Theorem 16 averaging for ℤ/2, and Lemma 31 for |C| = 9).

## Checkpoint 4: CFKSV §§4–5 (8 nodes)

Read on the page images: CFKSV pp. 195–206, §4 from (91) and §5 in full.

**Nodes:**
- **NE.3:** `characteristic-element-integrality-conjecture` (definition): Conjecture 4.8 and Lemma 4.9.
- **NE.4:**
  - `gl2-dual-selmer-module` (construction);
  - `mh-conjecture-and-mazur` (definition): Conjectures 5.1–5.2;
  - `mh-criteria`: Lemmas 5.3–5.4, Corollary 5.5, Proposition 5.6 and the conductor-11 example.
- **NE.5:**
  - `gl2-padic-l-function-conjecture` (definition): Conjecture 5.7 with (101)–(107);
  - `gl2-main-conjecture` (definition): Conjecture 5.8;
  - `gl2-main-conjecture-consequences`: Corollaries 5.9–5.10;
  - `gl2-main-conjecture-example-x1-11` (application).

The conjectures are propositions: no node assumes one.

**Coverage.** NE.4 and NE.5 are now `partial`. Still to do:
- equivariant complexes;
- Fukaya–Kato's formulation;
- the abelian comparison with I.9.

**New gaps:**
- CFKSV §5's inputs (Coates–Howson, Venjakob, Schneps, Rubin, [16]);
- the Dokchitser data.

**New request:** ArithmeticGaloisDuality R02.4 (Selmer groups over infinite extensions).

**Lean.** New checked tests:
- (1 − uX)(1 − wX) = 1 − a_pX + pX²;
- the X₁(11) valuations −1/2 + 3/2 + 2 = 3 and −3/2 + 5/2 = 1.

**Totals.** 54 nodes, 13 planets, 9 requests and 4 gaps. `check_blueprint.py`: 0 errors, 0 warnings.

## Checkpoint 3

Checkpoint 3 plans NE.3 from CFKSV §3 (pp. 170–187). It has 10 nodes and 3 planets:
- **Twists and Φ_ρ:** `twisted-module` (Lemma 3.2), `twist-homomorphism` (planet; (14)–(16)) and
  `twist-extends-to-localisation` (Lemma 3.3).
- **Evaluation:** `artin-evaluation` (planet): Φ′_ρ and ξ(ρ) ∈ L ∪ {∞}, with [g](ρ) = det ρ(g).
- **Akashi series:** `akashi-series` (Lemma 3.1, (37)–(40)) and `evaluation-akashi-diagram` (Lemma 3.7), whose
  contragredient convention is made explicit.
- **Theorems:**
  - `euler-characteristic-evaluation` (planet): Theorem 3.6;
  - `artin-evaluation-integral`: Theorem 3.8 and Lemma 3.9;
  - `artin-formalism-euler`: Theorem 3.10.
- **Example:** `gl2-euler-example`, Proposition 3.11. The arithmetic of 5¹⁶/5⁴ and 5⁸/5⁴ is checked in Lean. The
  Coates–Howson and Fisher inputs are a **gap**.

**Acceptance (NE.3 stage text).**
- A known unit is evaluated: [g](ρ) = det ρ(g).
- For induced representations, det(Ind ψ) includes the permutation sign.
- Contragredient: Theorem 3.6 twists by ρ̂.
- The SK₁ ambiguity (equal evaluations do not give equal K₁ classes) is recorded as a test. The reduced-norm and SK₁
  nodes remain, and need Ritter–Weiss.

**New requests:** GeneralAlgebraicKTheory K.7 (Morita invariance and the determinant) and IntegralIwasawaTheory I.4 (Γ-
and G-Euler characteristics via characteristic series).

**Lean.** Two checked tests (the n = 2 determinant of ρ(g)ḡ, and the Proposition 3.11 arithmetic); 0 errors.

**Totals.** 46 nodes, 2 gaps and 8 requests. `check_blueprint.py`: 0 errors, 0 warnings.

# Checkpoint 2 (Claude Code cc-39fac3)

Claude Code, session `cc-39fac3`, 28 September 2026. Refs #1015; the bot confirmed the claim. **Status: partial.**

Checkpoint 2 plans NE.2 from CFKSV §§3–4, with 13 new NE.2 nodes and one NE.0 node:
- **NE.0:** finite global dimension.
- **K-theory set-up:** K₀ under complete ideals; the localisation sequence and the boundary map, with the sign fixed.
- **Detecting K₀:** injectivity at a finite level and through characters; H-homology of 𝔐_H(G); twists.
- **Characteristic elements:** surjectivity of ∂_G, and characteristic elements with their K₁(Λ(G)) ambiguity.
- **Units:** semilocality of Λ(G)_S (Λ(G)_{S*} is not semilocal), and units surjecting onto K₁.
- **Acceptance:** the commutative one-variable comparison.

## NE.2 remaining

- Relative K₀ of perfect S*-torsion complexes and Fukaya–Kato's K₁(R, Σ_S) (Burns–Venjakob §2.2).
- Groups with p-torsion.
- Vaserstein's and Brumer's theorems are cited, not decomposed; their sources are not free.

## Requests added

- GeneralAlgebraicKTheory K.5 and K.3.
- PadicMeasuresIwasawaAlgebras L4.

## Lean

K-theory of rings is not in the pinned libraries, so NE.2's signatures are recorded as comments. The file still
elaborates against Mathlib 082e2d3 with the pinned toolchain: 0 errors, and the only warnings are for `sorry`.

# Checkpoint 1 (Claude Code cc-39fac3)

Claude Code, session `cc-39fac3`, 28 September 2026. Refs #1015; the bot confirmed the claim. **Status: partial.**

| Stage | Coverage |
|---|---|
| NE.1 | `source_decomposed` (14 nodes) |
| NE.0 | `partial` (9 nodes) |
| NE.2–NE.7 | `not_read` |

RS-16 is accepted and followed: completed group algebras are imported from PadicMeasuresIwasawaAlgebras L1, not planned
here.

## Closed

**NE.1: all of CFKSV §2.**
- The canonical set S and the criteria of Lemmas 2.1–2.2, through the central Π ≅ ℤ_p and V(G/J).
- Proposition 2.3: S-torsion equals finite generation over Λ(H).
- Theorem 2.4: S is a two-sided Ore set of nonzero divisors.
- Lemma 2.5 and Schneider's Proposition 2.6.

**NE.1: CFKSV §3 and beyond.**
- S* and Λ(G)_{S*} = Λ(G)_S[1/p].
- 𝔐_H(G).
- The localisation through Mathlib's `OreLocalization` (injective and universal), and its flatness.
- Burns–Venjakob's Σ_S.

**NE.0.**
- The lower p-series, uniform and compact p-adic analytic groups.
- Freeness over open subgroups.
- Local iff pro-p.
- The graded ring of a uniform group and Zariskian filtrations.
- Lazard's noetherian theorem.
- Compact Nakayama, which CFKSV use without proof. It is proved here from Lazard II.2.2.2.

## Remaining, precisely

- **NE.0.**
  - The uniform-group theory cited from Ardakov–Brown: Dixon–du Sautoy–Mann–Segal Theorems 7.23–7.24 and Corollary
    8.34, and Lazard Chap. III. It has no owner in the atlas (gap). Lazard Chap. III is on Numdam; the DDMS book is not
    free.
  - The acceptance examples: O⟦ℤ_p⟧ ≅ O⟦T⟧ (import) and a nonabelian finite level.
- **NE.2–NE.7.** See the coverage `remaining` lists. NE.2 starts from CFKSV §3 and Burns–Venjakob §2.2.

## Requests made

- **PadicMeasuresIwasawaAlgebras L1:** Λ(G) and Ω(G) for nonabelian profinite G, with their maps.
- **Tau Ceti ProfiniteProPGroups Layer 9:** Λ(ℤ_p) ≅ ℤ_p⟦T⟧.
- **GeneralAlgebraicKTheory K.4:** C^p(R).

## Suggested Lean file

`suggested/NoncommutativeAndEquivariantIwasawa.lean` imports Mathlib only. It elaborates against Mathlib 082e2d3,
run with the pinned toolchain v4.34.0-rc2 and a single `lean` call: 0 errors, and the only warnings are for `sorry`.
- **NE.1's Ore argument** is prototyped abstractly:
  - `canonicalSet` for a ring A that is a left B-module;
  - the finiteness criterion as a hypothesis;
  - the Ore condition in Mathlib's orientation, `oreSet`, and injectivity of A → A_S.
  - Concrete tests: F_p⟦T⟧ over F_p, ℚ[X] over ℚ, and B = A.
- **Statements about Λ(G)** stay as comments until PadicMeasuresIwasawaAlgebras L1 exists.
- **`TauCeti.IsProP`** is restated as `IsProPGroup`, because the file does not import Tau Ceti.

## Sources

**Read:**
- CFKSV (Numdam; arXiv v1 compared);
- Lazard (Numdam), II.2.2 and V.2.2;
- Ardakov–Brown, arXiv v1;
- Burns–Venjakob, arXiv v2.

**Not freely available:**
- Dixon–du Sautoy–Mann–Segal, *Analytic pro-p groups*;
- Neukirch–Schmidt–Wingberg, 2nd edition. Its PDF link now returns an HTML page.
