# Review of PAPER-ESNAULT-GROECHENIG-20

**Job** REV-PAPER-ESNAULT-GROECHENIG-20 (issue #1467) · **Date** 2026-09-23 · Claude Code, session
`cc-7b31c4` · **Verdict: accept**, with three titles corrected in place. All six routes accepted; all
ten `sourceIssues` confirmed; nothing rejected or deleted.

Paper: Hélène Esnault and Michael Groechenig, *Rigid connections and F-isocrystals*,
[Acta Math. **225** (2020), 103–158](https://doi.org/10.4310/ACTA.2020.v225.n1.a2), read in the
published PDF, whose hash reproduces as
`0d81a6d3e9be477c58a725096c41f06a8a9262422fe596363c3f04c26ab1cfab`.

## Structure

136 items: 119 missing, 12 planned, 5 library. Every missing item is routed exactly once, both
source stages (`CrystallineCohomology` CR.1–CR.2, `GlobalGaloisDeformations` R04.1–R04.2) exist, all
twelve planned layer ids exist, all four Part II parents exist, all four areas are galaxy ids, and
`scripts/check_paper.py` passes. The planned items named inside the source routes are the provision
of PROTOCOL §16.

All eight declarations behind the five library items resolve at the pins: `Derivation`, `IsAzumaya`
with `AlgHom.mulLeftRight`, `WittVector` with `ext`, `frobeniusEquiv` with `coeff_frobenius_charP`,
and `WittVector.Isocrystal`.

## Correction: three Part II titles paraphrased their parents

PROTOCOL §16 asks a Part II title to be "`<parent title>`, Part II: `<topic>`". Three of the four
were paraphrases:

| id | printed prefix | parent's atlas title |
| --- | --- | --- |
| `SemisimpleAlgebrasPartIIGeometricMorita` | Semisimple algebras, Artin–Wedderburn and module structure | Semisimple algebras, Artin-Wedderburn, and the structure of their modules |
| `CrystallineCohomologyPartIICartierFlows` | Crystalline cohomology | Crystalline cohomology, de Rham–Witt and logarithmic foundations |
| `PadicDifferentialEquationsPartIIRigidCompanions` | P-adic differential equations and rigid cohomology | P-adic differential equations, rigid cohomology and p-adic weights |

Each of those three ids is proposed by this extraction alone, so restoring the parent titles breaks
nothing elsewhere. The fourth, `HodgeStructuresPartII`, already matched exactly, and it is shared
with `PAPER-KLEVDAL-PATRIKIS-25`, `PAPER-LANDESMAN-LITT-24` and `PAPER-LIU-ZHU-17` under the same
title — which is how I checked that the convention is exactness rather than paraphrase.

## The ten findings

All are printed as quoted, and I read each at its locator.

- **E1 (misprint, a stated result).** The introduction, p.106: "An irreducible flat connection
  `(E,∇)` with torsion determinant `L` is called cohomologically rigid, if `[(E,∇)]` is a reduced
  isolated [point of] `M_dR(X,L,r)`. This is equivalent to vanishing of
  `H¹_dR(X,(End(E),∇)) = 0`." Section 7, p.148, writes the same definition with `End⁰(E,∇)`. On a
  fixed-determinant moduli space the trace-free version is the one matching "reduced isolated
  point", so `End` should be `End⁰`.
- **E4 (error, a stated result).** Definition 5.2, p.139, defines `Def_ϱ` with no determinant
  condition, while the rest of the paper — and Lemma 5.6's comparison with the fixed-determinant
  moduli space — works with fixed determinant.
- **E2 (error, a stated result).** Page 118: "It is clear that there is at most one such
  `a ∈ A_{Z′,r}(S)` with this property, since `a` and `b` are monic polynomials." Monicity gives
  uniqueness of the factorisation over a reduced base; over a non-reduced `S` it does not, which is
  also what the essential-image half of Theorem 2.17 needs.
- **E3, E5, E6 (gaps).** Page 127 asserts that the `(m−1)`-truncation's Hitchin invariant "factors
  through `A⁰(m−1)`, but not through `A(k−1)` for `k < m`" — the first half is automatic, the second
  is not. Page 154 deduces from a vanishing after restriction that `m*θ − r*θ` "has support in
  `Z′_p`", which does not follow. Page 146 concludes from good points in infinitely many fibres that
  the Kodaira–Spencer class "vanishes everywhere on `X_S`", which needs the shrinking of `S` the
  correction supplies.
- **E7–E10 (misprints).** Remark 2.16(a)'s "vector space of degree-r sections" should be the monic
  ones with vanishing subleading term; Definition 4.1 defines `C₁` as an inverse-Cartier composition
  and then applies `C₁^{−1}` in (c), where Theorem 4.5 names the level-`n` version `C_n^{−1}`;
  Proposition 4.10(c)'s displays carry an index that does not occur in the term; and p.108 prints
  "integrality condition" for integrability, twice, with `Ω¹_X` where the base is `Z`.

## What this review did not do

I read the published text at every finding and the definitions each one turns on, together with the
statements the routes cite — not all 56 pages line by line, and I did not re-derive the main
theorems. I add no finding of my own.
