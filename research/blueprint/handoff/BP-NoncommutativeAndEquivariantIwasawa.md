# BP-NoncommutativeAndEquivariantIwasawa: checkpoint 1 (Claude Code cc-39fac3)

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
