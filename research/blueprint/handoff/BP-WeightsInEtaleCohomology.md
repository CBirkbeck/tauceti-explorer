# Handoff: BP-WeightsInEtaleCohomology (first checkpoint)

Agent: Claude Code, session cc-fb70e5. Refs #1004.

- The packet is partial, with 7 nodes and 3 planets.
- The checker reports no errors and no warnings. The run used a check root with origin/main's DeligneWeightsAndPurity
  and AbelianSchemesAndArithmeticModuli packets: the shared clone's working tree predates them, and it was not switched.
- RS-17 (accepted) makes this roadmap Part II of DeligneWeightsAndPurity and narrows R34.1–R34.6 to adapters. This
  checkpoint follows that.

## What this checkpoint plans

Sources (every excerpt was matched against its page):
- Weil I (1.15), for the geometric Frobenius;
- Weil II (1.1.13) and (1.2.3)–(1.2.6);
- Lawrence–Venkatesh, arXiv:1807.02721v3 §§2.3–2.5, for the purity predicates as their Faltings lemma uses them;
- Milne, *Abelian Varieties*, I §12 and II §1.

R34.1, which is `source_decomposed`:
- `arithmetic-and-geometric-frobenius` (planet): Frobenius polynomials of Galois representations, and the convention
  switch through the contragredient.
- `pure-and-integral-galois-representations` (planet): the predicates MordellLawrenceVenkatesh LV.1 requests.
- `purity-under-linear-algebra-operations`: subquotients, sums, duals, tensor products, determinants and Tate twists.
  Integrality is kept separate, and fails for duals.
- `purity-under-restriction-and-induction`: Frob_u = Frob_v^f, and P_v(Ind ρ) = ∏_u P_u(ρ, T^f).
- `frobenius-eigenvalues-need-not-be-algebraic`: the stage's acceptance statement. Continuous characters with a
  transcendental Frobenius exist.
- `purity-at-every-embedding-versus-a-chosen-embedding`.

R34.2:
- `frobenius-on-tate-modules-and-first-cohomology` (planet): π_A equals the arithmetic Frobenius on points, and the
  geometric Frobenius on H¹ has characteristic polynomial P_{π_A}. The weight 1 is requested from DWP.1.

The integrated decomposition's nodes are superseded by RS-17 and are not kept. Its R34.1 definition node for pure and
mixed sheaves belongs to DWP.0 and DWP.5. Its R34.5 Weil II nodes belong to DWP.7 and DWP.8.

## Requests (new)

- ArithmeticGaloisRepresentations R01.1, R01.2 and R01.6.
- AbelianSchemesAndArithmeticModuli A4: H¹_ét ≅ Hom(T_ℓA, ℤ_ℓ).
- DeligneWeightsAndPurity DWP.1: the Weil estimate for abelian varieties.

## Suggested Lean file

It imports Mathlib only. It was compiled with `lake env lean` against Mathlib 082e2d3 (exit 0, 3 `sorry` warnings). It
has:
- `frobCharpoly` on `Representation`;
- the conjugacy-invariance and inverse-roots statements;
- `pow_ne_four_of_odd`, proved;
- the swap-matrix shape of the induction formula.

## Source issues

None. Lawrence–Venkatesh do not say which Frobenius, arithmetic or geometric, their Lemma 2.3 uses. The weight changes
sign between the two, so the convention is fixed here, as geometric.

## What remains (precisely)

- **R34.2.** The all-power bounds (Milne II.1.1) and genus-one agreement, once DWP.1 is planned; the export to
  FaltingsFinitenessAndIsogenyTheorems R28.4.
- **R34.3–R34.6.** Not planned. They are the degeneration, pencil, arithmetic-realization and eigenform adapters, over
  the RS-17 suppliers.

# Checkpoint 2 (R34.2 completed)

Agent: Claude Code, session cc-fb70e5. Refs #1004.

- The packet now has 9 nodes and 4 planets.
- The checker reports no errors and no warnings. The run used a check root with origin/main's DeligneWeightsAndPurity
  and AbelianSchemesAndArithmeticModuli packets, whose DWP.1 and A6 nodes are imported.
- R34.2 is `source_decomposed`.

## What checkpoint 2 plans

- `purity-of-tate-modules-with-good-reduction` (planet). H^i(A_K̄, ℚ_p) = ∧^i H¹ is pure of weight i and integral
  outside T ∪ {v | p}, with P_v = P_{π_{A_v}} independent of p; V_pA has weight −1 and is not integral. The same holds
  for curves, through the Jacobian. This is the export to FaltingsFinitenessAndIsogenyTheorems R28.4.
- `good-reduction-point-counts-and-traces`: point counts and bounds at good places, and a_v = Tr(Frob_v^geom | H¹),
  compatible with Tau Ceti's Hasse bound. These are imported from DWP.1 and not reproved.

## Requests (new)

- NeronModelsAndSemistableAbelianVarieties R11.5: Néron–Ogg–Shafarevich and the specialization isomorphism.

## Suggested Lean file

It adds the signatures for the good-reduction statements and a `decide` proof that y² = x³ − x has 8 points over
𝔽₅. It was compiled with `lake env lean` (exit 0, 3 `sorry` warnings).

## What remains

- **R34.3–R34.6.** The degeneration, pencil, arithmetic-realization and eigenform adapters, over their RS-17 suppliers.
