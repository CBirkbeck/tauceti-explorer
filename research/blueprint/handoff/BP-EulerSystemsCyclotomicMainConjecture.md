# BP-EulerSystemsCyclotomicMainConjecture — handoff

Agent: Claude Code — cc-39fac3. Issue #725. First checkpoint.

## What is done

**Layer L0 is source-decomposed**, with 27 nodes:
- 7 constructions, 14 lemmas, 4 theorems and 2 comparisons;
- 28 API items and 23 unit tests;
- 6 planets;
- 26 baseline declarations;
- 6 requests and no gaps.

L0 covers:
- the distribution relation for 1 − ζ over any cyclotomic step, with the sign dictionary to Rubin's
  ζ − 1 form;
- the p-extended numbers c̃_m and their real norms, with the tower and auxiliary relations;
- non-torsion of the family;
- the comparison with the smoothed units c(a) and the smoothing divisor θ_a;
- the verification of Rubin's Definition II.1.1 for (ℚ^ab, p);
- the Kummer classes and the Euler-system theorem;
- χ-components, twisted sums and the Frobenius-factor identity;
- ξ_{n,χ}, which is shown to be a unit, and C_{n,χ};
- Rubin's (4) and (6), and the generation lemma.

**Source findings** (`sourceIssues`, both new):
- **E1.** Rubin's display (III.2) is false at ℓ = 2 in his ζ − 1 convention, for example
  N_{ℚ(i)/ℚ}(i − 1) = 2 ≠ −2. It affects nothing downstream for odd p.
- **E2.** RJW §10.5's c_m = (ξ⁻¹ − 1)/(ξ − 1) equals −ξ⁻¹, which is torsion. Its relation
  "(1 − ℓ⁻¹)c_m" should use the Galois operator 1 − σ_ℓ⁻¹.

## Requests

1. `IntegralIwasawaTheory:L0` for the tower, Galois groups, real subfields, norms, units of
   subfields and the index formula. The suggested file uses stand-ins `zeta`, `Qmu`, `QmuPlus` and
   `unitsTensorRep` only to state signatures.
2. `IntegralIwasawaTheory:I.1` for ℚ_∞, the layers L_n and decomposition groups.
3. `EulerSystemsAndKolyvaginSystems:ES.2` for the carrier, hypotheses, conductor presentation and
   twisting. That roadmap's blueprint issues are blocked.
4. `SelmerIwasawaCohomology:L0` for H¹(F, ℤ_p(1)) and the restriction isomorphism (3).
5. Tau Ceti ProfiniteCohomology Layer 9 for the Kummer norm square.
6. Tau Ceti ClassFieldTheory Layer 12 for the ray class fields of ℚ.

The two Tau Ceti stage requests are carried in `requests` with `neededBy`, not as node
prerequisites, because the checker reads `tauceti:` prerequisites as declarations.

## Lean

`research/blueprint/suggested/EulerSystemsCyclotomicMainConjecture.lean` compiles with exit 0. The
only warnings are `sorry` warnings. It was a single run of the pinned Lean v4.34.0-rc2 against the
prebuilt Mathlib at 082e2d3, with no lake and at least 20 GB free.

The file imports Mathlib only. No Tau Ceti build at f790474 exists on this server, so the Kummer,
Euler-system and twisted-class signatures (nodes `qab-euler-hypotheses`,
`cyclotomic-kummer-classes`, `cyclotomic-euler-system`, `twisted-class-formula`) are recorded in a
comment block against `TauCeti.kummerMap` and the requested suppliers.

## Checks

- `scripts/check_blueprint.py` with the pinned index: 27 nodes, 0 errors, 0 warnings.
- The tower and auxiliary relations were checked numerically in 812 cases (p ∈ {2, 3, 5, 7},
  m < 30, ℓ ≤ 13), with no failure.
- The sign failures of Rubin's (2) were confirmed: exactly the cases with ℓ = 2, for m < 40.

## Sources

**Read:**
- Rubin, *Euler systems*, the author draft; its SHA-256 matches the integrated decomposition's
  record. Sections:
  - I §2 Example 2.1;
  - I §6.2;
  - II §1 and §4;
  - III §1 Lemma 1.1;
  - III §2.1–2.4.
- RJW, arXiv:2309.15692v2, §10.1–10.2 and §10.5.

**Not accessed:**
- the published monograph (Annals Studies 147);
- the published RJW (Essential Number Theory 4);
- Lang's *Cyclotomic Fields*, Theorem 6.3.1. The distribution relation is proved here from the
  minimal polynomials, so this citation is not needed.

## Next steps

L1–L4 are `not_read`, and their coverage records list the sections to read:
- L1: Rubin III §2.3–2.4 with Chapters IV–V.
- L2: Rubin II §3 and III §2.5–2.7.
- L3: Rubin III §2.8–2.10 and RJW §13.
- L4: Greither 1992, §§1–4, on Numdam.

The integrated decomposition's L1–L4 nodes are reviewed leads: reuse their locators and ids.
