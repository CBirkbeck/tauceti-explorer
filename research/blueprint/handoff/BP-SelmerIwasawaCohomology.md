# BP-SelmerIwasawaCohomology — handoff

Agent: Claude Code — cc-39fac3. Issue #988. First checkpoint, within the RS-08 boundaries, which
its review accepted.

## What is done

The packet has 23 nodes:
- 10 constructions, 10 lemmas, 2 theorems and 1 comparison;
- 42 API items and 34 unit tests;
- 6 planets;
- 25 baseline declarations;
- 7 requests and no gaps.

**L0 (partial).**
- p-adic completion, and its comparison with the tensor product: true for units and S-units, false
  for local fields and for F^×.
- The Kummer maps along the μ_{p^m} tower, from Tau Ceti's δ⁰ naturality.
- The limit Kummer map.
- Mittag-Leffler for roots of unity.
- H¹(G_K, ℤ_p(1)) ≅ lim K^×/(K^×)^{p^m}.
- H¹(G_{F,S}, ℤ_p(1)) ≅ ℤ_p ⊗ 𝓞_{F,S}^×.
- The record of which inverse-limit hypotheses hold.

L0 still needs the compatibility of the identification with cup products and with Shapiro's
isomorphism, both RS-08 "keeps".

**L2 (partial).**
- Selmer data and the Selmer kernel.
- Change of conditions and functoriality.
- Propagation, and the passage V → T, W with saturation.
- The unramified and Greenberg conditions.
- Galois Selmer groups.
- Pontryagin duals with the contragredient action, and coranks.
- The elliptic p^∞-Selmer group.

L2 still needs the Selmer complex as a mapping fibre (Nekovář), primitive/imprimitive sequences and
lattice-change formulas.

**L1, L3, L4:** not read. Their coverage records name the sections, including the maintainer's
Burungale–Tian items that belong there.

## Source findings

Both are new; the register was checked.
- **E1.** RJW (10.7)/(10.8): F^× ⊗ ℤ_p ≅ H¹(F, ℤ_p(1)) is false with the algebraic tensor product.
  The map is not surjective for number fields and not injective for p-adic fields. The correct
  target is the completion.
- **E2.** RJW Definition 13.19 asks for a G_ℚ-invariant ordinary filtration. It must be
  G_{ℚ_p}-invariant; V_pE is the counterexample.

## Requests

- ArithmeticGaloisDuality R02.1 and R02.3.
- Tau Ceti ProfiniteCohomology Layers 5 and 9.
- Tau Ceti LocalFieldsRamification Layer 1.
- Tau Ceti GlobalNumberFields: the S-unit theorem.
- Tau Ceti EllipticCurves Layer 7.

The Tau Ceti stages are carried in `requests` with `neededBy`, because the checker reads `tauceti:`
prerequisites as declarations.

## Lean

`research/blueprint/suggested/SelmerIwasawaCohomology.lean` compiles with exit 0; the only warnings
are `sorry` warnings. It was a single run of the pinned Lean v4.34.0-rc2 against the prebuilt Mathlib
at 082e2d3, with no lake.

The file imports Mathlib only. It states the completion, Selmer-kernel, condition, dual and corank
declarations. The Kummer, Galois-Selmer, inflation and Λ-dual signatures are recorded in a comment
block: they are stated against Tau Ceti and the requested suppliers, and no Tau Ceti build at
f790474 exists on this server.

## Checks

- `scripts/check_blueprint.py` with the pinned index: 23 nodes, 0 errors, 0 warnings.
- `intake.py check-files`: 4 files, 0 problems.

## Sources

**Read**, with hashes in `sourceVersions`:
- Rubin, *Euler systems* (author draft): I §§2, 3.1–3.2, 5, 6.2–6.3, and Appendix B §2.
- Mazur–Rubin, arXiv:1312.4052v1: §§1–3.
- RJW, arXiv:2309.15692v2: §10.5 and §13.5.
- Burungale–Tian, arXiv:2506.03465v2: §§1–3.

**Not accessed:**
- the published versions;
- Greenberg, *Iwasawa theory for p-adic representations* (1989);
- Nekovář, *Selmer complexes* (Numdam; this is the source for the mapping-fibre construction the
  continuation needs).
