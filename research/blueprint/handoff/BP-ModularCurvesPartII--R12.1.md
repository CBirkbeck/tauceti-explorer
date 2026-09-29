# Handoff: BP-ModularCurvesPartII--R12.1 (first checkpoint)

Agent: Claude Code, session cc-fb70e5. Refs #773.

- The packet is partial, with 10 nodes and 4 planets. The checker reports no errors and no warnings.
- RS-06 (accepted) narrows every stage of this part. This checkpoint follows its keeps and suppliers for R13.1 and R13.2.

## What this checkpoint plans

Source: Conrad, *Arithmetic moduli of generalized elliptic curves* (J. Inst. Math. Jussieu 6, 2007), the author's copy
kmpaper.pdf (SHA-256 f53e4ff8…, 49 pages, printed page = PDF page). §1 and §§2.1–2.4 were read in full. For §§3–4 the
statements, and the structure of the proofs, were read. Every excerpt was matched against its page.

R13.1:
- `semistable-genus-one-curves-and-neron-polygons`: DR semistable genus-1 curves, the standard n-gons C_n and the 1-gon
  as the nodal cubic.
- `generalized-elliptic-curve` (planet): (E, +, e) with the group law on E^sm extending to an action on E, and
  translations acting by rotation on the n-gon fibres. Morphisms, and quotients by finite locally free subgroups.
- `non-smooth-locus-and-base-change`: the closed subscheme S^∞, the local n-gon structure, and base change.
- `contraction-away-from-a-divisor`: Deligne–Rapoport IV 1.2 contraction, with its uniqueness and base change.
- `deligne-rapoport-structure-criterion`: DR II 3.2, in the divisor form of Conrad's Theorem 2.2.4.
- `drinfeld-structures-and-cyclicity` (planet "Cyclicity criterion"): Drinfeld structures, cyclic subgroups, the
  scheme G^× of generators, and standard cyclic subgroups.

R13.2:
- `gamma-level-structures`: Γ₁(N), Γ(N), Γ₁(N; n) for admissible (N, n), and Γ₀(n).
- `moduli-stacks-are-proper-flat-artin` (planet): the stacks M_Γ are proper, flat and CM of relative dimension 1, and
  Deligne–Mumford exactly in the stated cases.
- `agreement-with-katz-mazur-schemes` (planet "X₁(N) as a fine moduli scheme"): the schematic loci, and agreement with
  Katz–Mazur and with the anchor's Layer 10 over ℤ[1/N]. RS-06 requires agreement on the overlap, not a rebuild.
- `contraction-maps-between-levels`: finite flat surjective of constant rank.

Two errors of mine were caught before submission.
- A draft non-example claimed that μ_p × ℤ/p is not cyclic. That is false: it is cyclic, and it is the cusp case where
  M_{Γ₁(p)} fails to be Deligne–Mumford. It was replaced by E[2] ≅ (ℤ/2)², étale in characteristic ≠ 2, which is not
  cyclic.
- A claim about N = 4 had no support in the passages read, and it was removed. The contraction ranks were recomputed:
  for N = p, map (4) has rank p − 1 (degree (p − 1)/2 on coarse spaces), and map (1) has rank p(p − 1).

## Requests (new)

- Tau Ceti ModularCurves 1A, 1D, 3C, 0B, 8D, 9D and Layer 10. These are RS-06's suppliers, placed in requests and not
  in prerequisites.
- AlgebraicModuliForArithmeticGeometry R09.5.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.

## Suggested Lean file

It imports Mathlib only. It was compiled with `lake env lean` against Mathlib 082e2d3 and exited with code 0, with no
warnings and no `sorry`. It contains:
- the nodal-cubic parametrisation identity;
- #DihedralGroup 5 = 10, for #Aut(C_n) = 2n;
- deg Φ₆ = 2, through the baseline declaration `Polynomial.natDegree_cyclotomic`;
- `AdmissibleLevel`, with its tests ((1, n) is admissible and (2, 4) is not);
- the ranks p(p − 1) and φ(11) = 10.

Curves over a base, stacks and level structures are named in comments only, because they are missing at the pinned
commits.

## Source issues

None found in the passages read.

## What remains (precisely)

- **R12.1–R12.6:** not planned. Read next: Darmon–Diamond–Taylor §§1.1–1.2 and 1.5, and Conrad's appendix to
  Ribet–Stein §5.1, against RS-06's keeps (the suppliers are ModularForms 10A and 10C, and ComplexComparisonPartII C4).
- **R13.1:** the proofs of Deligne–Rapoport II and IV, which are cited, not read (see the gap).
- **R13.2:** the proofs in §3 (universally embedded families, the valuative criterion, deformation rings), and the
  full/fixed-pairing refinement over ℤ[ζ_N] for levels other than Γ(N).
