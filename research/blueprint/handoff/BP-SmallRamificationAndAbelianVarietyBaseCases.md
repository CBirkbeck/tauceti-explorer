# Handoff: BP-SmallRamificationAndAbelianVarietyBaseCases (third checkpoint)

Agent: Claude Code, session cc-fb70e5. Refs #995.

- Checkpoint 1 (R25.1, R25.2) merged in #3812.
- Checkpoint 2 (R25.3) merged in #3814.
- This checkpoint adds R25.4 and closes R25.1.

## What this checkpoint delivers

- **Packet** `research/blueprint/packets/SmallRamificationAndAbelianVarietyBaseCases.json`, status `partial`:
  - 42 nodes: 5 definitions, 24 lemmas and 13 theorems;
  - 32 API items, 21 unit tests, 13 planets;
  - 40 baseline declarations, 17 requests, 4 source issues;
  - `scripts/check_blueprint.py` reports 0 errors and 0 warnings against the pinned declaration index.
- **Roadmap document**, regenerated from the packet with the introduction revised for R25.4.
- **Suggested Lean file**, extended with the Schoof section.

RS-06 keeps R25.4 whole and links it to A6, R35.4, R28.1, R11.3 and R34.2 (components rerouted from Faltings's R28.5). The plan follows Schoof's point-counting route, not Brumer–Kramer's isogeny-chain route, so it uses A6 and R11.3 and needs neither R28.1 nor R35.4.

## Closed

- **R25.1:** the Odlyzko rows for R25.4 are planned (R25.1/totally-complex-degree-bounds-for-schoof). No list of fields is used anywhere.
- **R25.2:** Tate and Serre (checkpoint 1).
- **R25.3:** Fontaine (checkpoint 2).
- **R25.4 (new): Schoof's Theorem 1.1** for l ∈ {2, 3, 5, 7, 13}. The plan follows Schoof's proof in the semistable category D:
  1. R25.4/semistable-category-d: the category D(p, l). R25.4/torsion-of-semistable-abelian-varieties-in-d: A[pⁿ] lies in D (Grothendieck, via R11.3).
  2. R25.4/schoof-criterion (Proposition 3.1): if the simple objects of D are ℤ/pℤ and μ_p and Ext¹_{ℤ[1/l]}(μ_p, ℤ/pℤ) = 0, there is no such abelian variety. It uses the filtration and point count of R25.3, over ℤ[1/l, ζ_l] (R25.4/constant-over-cyclotomic).
  3. R25.4/ext-mu-p-by-z-mod-p-over-z-one-over-l (Corollary 4.2) for p ∈ {2, 3}. The class-group step needs no Herbrand or Spiegelungssatz here, because ℤ and ℤ[ζ₃] are principal ideal domains.
  4. R25.4/simple-objects-criterion (Proposition 5.1), with the field hypothesis checked in the five case lemmas:
     - (2, 3): rd < 8.25, n ≤ 14, and one class-field step over ℚ(ζ₃, ∛2) (the unit −1 generates 𝔽₃^×).
     - (3, 2): rd < 6.93, n ≤ 10, so [L:ℚ] ∈ {4, 8}. No class field theory is needed.
     - (5, 2): rd < 8.95, n ≤ 16. Degree 12 is excluded by the unit η = (1 + √5)/2 generating 𝔽₄^×.
     - (7, 3): Schoof's argument with n ≤ 279 (his n < 270). The unramified-extension rows at rd 13.18 and 16.83 are used, and the units −1 and ζ₇ + ζ₇^{−1} generate 𝔽₂₇^×.
     - (13, 2): Schoof's argument. Class number of ℚ(i, √13) = 1 by the Minkowski bound 7.90 (CA.5), and h(ℚ(i, √13, √η)) ≤ 2 by the row at rd 10.198.
  5. R25.4/schoof-theorem.

**Deviation from Schoof.** For l = 2, 3, 5, Schoof proves the stronger Theorem 1.3 (the tame category C) and deduces Theorem 1.1. This plan proves Theorem 1.1 directly in D. The root discriminants are smaller (8.25, 6.93, 8.95 against 10.39, 12, 20), so each case needs at most one class-field step. Theorem 1.3 has no consumer in the atlas and is not planned.

**Certified numerics.** Every row was evaluated with the kernel of R25.1/odlyzko-kernel and exceeds its threshold, and Odlyzko's 1976 Table 2 confirms each one. The tightest margins are:
- 0.2% at rd 10.198 (row j);
- 0.3% at rd 19.014 (row d).

## Remaining

- **R25.5** (GL₂-type and ordinary terminal cases) and **R25.6** (the base-case table): coverage `not_read`.
  - For R25.5, read DP23 Paso 6 with Theorems 1.7–1.9, and Khare's terminal weights.
  - The R25.6 table can already record the rows p = 2, 3 of level one (R25.2), the everywhere-good case (R25.3) and the five Schoof primes (R25.4).

## Requests added in this checkpoint

- R11.3: the monodromy criterion (σ − 1)² = 0.
- R11.1: an abelian scheme over ℤ[1/l].
- R07.1: Katz–Mazur G_ε, the twisted constant schemes V(ρ), and gluing over ℤ[1/l].
- A2 and A3: over ℤ[1/l].
- Tau Ceti ClassFieldTheory Layer 12: ray class groups in explicit form, Kronecker–Weber for conductors lᵏ∞, and the conductor–discriminant formula.
- ClassFieldTheory Layer 7: conductor exponents of local quadratic characters over dyadic fields.

## Source issues

The same four are recorded in the packet and in the local published-errata log.

- **E1** (new): 2·3^{3/2} printed as 10.49….
- **E2** (published in Schoof's errata note): Herbrand is cited for the ω²-eigenspace in Proposition 4.1.
- **E3** (new): "120/36" should be 120/54 in the case l = 7.
- **E4** (new): "for some a ⩽ 2" should be a ⩾ 0 in the case l = 13.

None affects a stated result.

## Lean

The suggested file was not compiled. No pinned build is available, and the shared-machine rules forbid builds.

## Sources

Read in this checkpoint:

- Schoof 2005: §§1–6 again, in the published author copy and on arXiv.
- Schoof's errata note.
- Odlyzko's 1976 tables: the description and Table 2.

Earlier sources are listed in the packet. Not accessible: Fontaine 1985, Tate 1994, Serre's Œuvres III note, and Martinet's tables (Schoof's [Mar81]).
