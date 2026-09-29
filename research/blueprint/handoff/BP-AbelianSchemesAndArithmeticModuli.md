# Handoff: BP-AbelianSchemesAndArithmeticModuli (first checkpoint)

Agent: Claude Code, session cc-fb70e5. Refs #666.

- The packet is partial, with 16 nodes and 6 planets. The checker reports no errors and no warnings.
- RS-02 (accepted) makes this roadmap Part II of Tau Ceti's JacobianChallenge. This checkpoint follows its A6 and A2
  keeps.

## What this checkpoint plans

Source: J. S. Milne, *Abelian Varieties*, course notes v2.00 (2008), author's PDF (SHA-256 f5ca4e63…, printed page =
PDF page − 6). §10 was read in full, and §§11–14 in the parts used. The author's errata page for v2.00 was also read.
Every excerpt was matched against its page.

A6, field level, extending Tau Ceti's `AbelianVariety K` API (Hom group, End ring, IsIsogeny, mulBy, prod):
- `degree-of-an-endomorphism` (definition): deg on End(A), extended to End⁰(A).
- `degree-is-a-polynomial-function`.
- `characteristic-polynomial-of-an-endomorphism` (definition, planet): P_α ∈ ℤ[X] with P_α(r) = deg(α − r), and the
  trace.
- `endomorphisms-of-simple-abelian-varieties`. The node argues through the image of α, which works over any field; the
  source's kernel argument does not over imperfect fields.
- `poincare-complete-reducibility` (planet).
- `hom-to-tate-module-homs-is-injective`.
- `hom-is-free-of-finite-rank` (planet). The corrected proof route is planned, with the lattice step through Mathlib's
  discrete-submodule finiteness.
- `endomorphism-algebra-is-semisimple`, through Artin–Wedderburn in Mathlib.
- `polynomials-determined-by-l-adic-values` and `multiplicative-polynomial-functions` (lemmas 10.21 and 10.22).
- `characteristic-polynomial-on-tate-module` (planet): P_α equals the characteristic polynomial on V_ℓA, independent of
  ℓ.
- `trace-and-degree-on-a-subfield`.
- `degree-formulas-for-polarized-isogenies`.
- `rosati-positivity` (planet).
- `automorphisms-of-polarized-abelian-varieties`.

A2:
- `rosati-involution` (definition, planet).

## Mistakes found in the source (sourceIssues)

New ones; the author's errata page was checked and does not list them:
- **E1.** Proposition 14.4(b) is false as stated when char k divides n. A supersingular elliptic curve over 𝔽̄₂ has
  E[4](k̄) = 0 and 24 automorphisms, all of which preserve its principal polarization. The node adds the hypothesis
  char k ∤ n.
- **E2.** The proof of 14.4(a) calls End(A) ⊗ ℝ compact. The compact set it needs is {Tr(αα†) = 2g}.
- **E3.** The proof of 14.4(b) concludes from the nilpotence of β. It needs β†β to be nilpotent, which holds because β
  and β† commute (α† = α⁻¹).

Already on the author's errata page, recorded because nodes use the corrected forms:
- **E4.** Lemma 10.12 needs a bound on the degree.
- **E5.** The proof of 10.15 takes M in the wrong module and reasons circularly about dimension.
- **E6.** A misprint in (αβ)† = β†α†.

## Requests (new)

- SchemeAndStackFoundations SF.5: degrees of finite morphisms, intersection numbers and their degree formula, and
  positivity (D^{g−1} · E).
- Tau Ceti JacobianChallenge Layer E: the field dual, φ_L and polarizations.

## Gaps

- Rosati positivity: the formula is not proved in Milne (it cites his 1986 article §17), and neither that article nor
  Mumford §21 was read.
- Poincaré reducibility over imperfect fields (author's footnote 10).
- deg φ_L = χ(L)² is stated without proof. It is A2's.

## Suggested Lean file

It imports Mathlib only. The carrier, Tau Ceti's `AbelianVariety`, has no compiled modules in the local environment,
so the abelian-variety signatures are written out in the header comment.

The compiled part covers:
- uniqueness of P_α (`eq_of_eval_intCast`, proved);
- Lemmas 10.21 and 10.22 (over `PadicAlgCl ℓ` and matrices);
- the root-of-unity lemma;
- the positive trace form of the transpose;
- semisimplicity examples.

It was compiled with `lake env lean` against Mathlib 082e2d3 (exit 0, 4 `sorry` warnings).

## What remains (precisely)

- **A6.**
  - Weil restriction along finite locally free S′ → S, through AlgebraicModuliForArithmeticGeometry R09.3.
  - Finite-étale preservation of abelian schemes.
  - T_ℓ(Res_{L/K} A) ≅ Ind T_ℓ(A), from Poonen §4.6.
  - Compatibility with relative dualization and geometric fibres.
  - The gaps above.
- **A0–A5.** Not planned. Milne's notes treat only fields. A public source for the relative theory (rigidity over
  nonreduced bases, the dual abelian scheme, quotients by finite flat subgroups) is still to be chosen.
- **Stage prerequisites.** The A6 nodes use A1–A4 as stage prerequisites: the theorem of the cube, [n] of rank n^{2g},
  factorization through [n], the Weil pairings, and T_ℓ at field level. These are what A1–A4 must supply first.

# Checkpoint 2 (A6: Weil restriction)

Agent: Claude Code, session cc-fb70e5. Refs #666.

- The packet now has 21 nodes. The checker reports no errors and no warnings, and A6 has 6 planets, the maximum.
- Sources, as the atlas specifies:
  - Poonen, *Rational Points on Varieties*, §4.6 and Exercises 4.7–4.9 (the author's online version, printed page = PDF
    page − 14);
  - Stacks Project Tags 05YF and 05YC (and 05Y8, Section 97.11).
  Every excerpt was matched against its page. For the Stacks tags, the match was against the served HTML text.

## What checkpoint 2 plans (A6)

- `weil-restriction-functor` (construction, planet): the fppf sheaf, compatibility with base change, and the
  algebraic space (imported from R09.3).
- `weil-restriction-of-quasi-projective-schemes`: Poonen 4.6.3 and 4.6.5, with Bosch–Lütkebohmert–Raynaud's criterion
  requested and not read.
- `weil-restriction-over-a-separable-extension-splits`: Poonen Exercise 4.7.
- `finite-etale-weil-restriction-of-abelian-schemes`. This is the étale-splitting descent proof, through A2's
  algebraic-space-to-scheme theorem, with the negative example Res_{k[ε]/k}(E) = E × Lie(E) (Poonen 4.6.8).
- `tate-module-of-a-weil-restriction`: T_ℓ(Res A) ≅ Ind T_ℓA. As the atlas warns, it implies nothing about good
  reduction at ramified places.

## Why A0–A5 remain unplanned

Van der Geer–Moonen's *Abelian Varieties* chapters (public on Moonen's page) were checked. They treat abelian varieties
over fields and group schemes over bases, but never abelian schemes over a base. The relative A1–A3 statements (rigidity
over nonreduced bases, the dual abelian scheme, fppf quotients by finite flat subgroups of abelian schemes) still need a
public source.

## Requests (new)

- AlgebraicModuliForArithmeticGeometry R09.3: representability, including BLR §7.6.
- ArithmeticGaloisRepresentations G7 and R01.6.

## Suggested Lean file

It adds the Weil restriction signatures and a `linear_combination` check of Poonen's Example 4.6.2. It was compiled with
`lake env lean` (exit 0, 4 `sorry` warnings).
