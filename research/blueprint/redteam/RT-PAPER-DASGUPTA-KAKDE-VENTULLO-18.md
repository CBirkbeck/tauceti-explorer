# RT-PAPER-DASGUPTA-KAKDE-VENTULLO-18

Red team of the extraction PAPER-DASGUPTA-KAKDE-VENTULLO-18: Dasgupta, Kakde and Ventullo, *On the
Gross–Stark conjecture*, Ann. of Math. 188 (2018) 833–870. The red team is Claude Code, session
`cc-c2c06b`, 30 September 2026, issue #4106. The extraction is by `cc-d67081` and its review by
`cc-39fac3`. I did neither.

**Result: 4 findings, 2 medium and 2 low.**

The review already corrected the extraction heavily, with four checkers, 27 statement corrections
and 35 source issues. So I did not re-check the paper's statements line by line. I attacked what a
paper-by-paper review can miss: whether the routes send each item to the layer that owns it, given
the rest of the atlas.

What holds:
- **Prerequisites.** They match the paper's 24 references one for one.
- **Stage ids.** All 14 stage ids the extraction cites exist in the atlas.
- **Gross–Stark content.** Gross's regulator, the orthogonality proposition, the Artin rings
  W_1–W_3 and the determinant identity are planned nowhere else, so the Part II owns them alone.

## Findings

**1. The Part II's brief does not import the Ribet machinery that IntegralHeckeAndGaloisDeterminants
plans. (duplicate, medium)**

Much of §4 is abstract content:
- a rank-two representation over the total quotient ring of a reduced local Hecke algebra, whose
  residue field E (T/m) has characteristic 0;
- integrality of its characteristic polynomials, by Chebotarev and continuity;
- a Hensel-adapted basis at an element τ with χ(τ) ≠ 1;
- the module B and the class κ in H¹(G_F, B̄(χ^{-1}));
- local conditions from the change to the ordinary basis at p.

IntegralHeckeAndGaloisDeterminants plans this:
- IHG.1: generalized matrix algebras with residually distinct characters, and extension modules;
- IHG.4: Frobenius density with continuity;
- IHG.6: the integral generalized Ribet theorem.

The review noticed. Its notes on global-basis, cocycle-kappa and chebotarev-integrality say to
import IHG and keep only the specialization, and one says "the route brief does not list IHG as an
import". But the brief, which is all the design job reads, was not changed.

The Brumer–Stark side does this correctly. Stage I.7 tells its consumer to import the shared theorem
from IHG.6 and not to build "a second generic construction here", and PAPER-DASGUPTA-KAKDE-23 plans
the same steps at I.7 and IHG.6.

**Fix.** Add IHG.1, IHG.4 and IHG.6 to the brief's imports. Say the Part II proves only the
hypotheses for the Hida-family representation, plus the Gross–Stark-specific steps: τ in Lemmas
4.2–4.3, Lemma 4.4, and Lemmas 4.6–4.9 at R and R′.

**2. The two-character Eisenstein series is routed to a character layer. (error, medium)**
- The review's new item rev-the-eisenstein-series-e-k covers E_k(ψ, η) and the family E(χ, 1), with
  their Fourier coefficients, eigenvalues and congruence. It went onto route 2, whose only stage is
  AutomorphicPadicLFunctions:L0.
- L0 is "Ray-class character spaces and evaluation". Route 2's reason covers only L(χ, s), its Euler
  factors and L(χ, 0) ≠ 0.
- Hilbert Eisenstein series are L3's: RS-14 keeps "Hilbert Eisenstein construction … integral
  congruences" there.
- This paper's own E_k(1, η) and E(1, χ) are planned at L3, and so is DK23's E_k(ψ_S, 1).
- The AutomorphicPadicLFunctions packet has not reached either layer for this paper (L0 partial, L3
  not_read), so the route can still be corrected.

**Fix.** Mark the item planned at L3, or route it as a source to L3, and trim route 2's reason.

**3. I.3 is still described as building the Deligne–Ribet L-function. (error, low)**
- Route 1's reason says "I.3 plans the Deligne–Ribet p-adic L-function and its Hilbert modular
  Eisenstein input", and the brief imports it from I.3.
- RS-16 was accepted at 13:17 UTC on 23 September, eight hours before this review. It narrowed I.3 to
  the normalization dictionary with Stickelberger elements: I.3 "proves normalization/comparison,
  not their existence". The construction is AutomorphicPadicLFunctions:L3's.
- The items deligne-ribet and teichmuller-character still list I.3 as a planner.

**Fix.** Import Deligne–Ribet from L3 only, and drop I.3 from those two items.

**4. There is no `sourceVersions` list. (other, low)**
- Both hashes appear only in the free text of readSections.
- My download of the published PDF matches 974e6427…b659.

## What I checked

- **Restructurings.** Every restructuring decision on the cited stages:
  - IntegralIwasawaTheory I.3 (RS-16);
  - AutomorphicPadicLFunctions L0 and L3, and DirichletPadicLFunctions L3 (RS-14);
  - OrdinaryAutomorphicFormsAndModularityLifting R21.3 and ArithmeticGaloisDuality D7 (RS-08).
- **The Ribet stages.** The full text of I.5, I.6, I.7, IHG.1, IHG.4 and IHG.6.
- **DK23.** The 235-item list of PAPER-DASGUPTA-KAKDE-23, with its §§8–9 Hilbert-modular, Eisenstein
  and Ribet items in full.
- **Other extractions.** Every extraction, searched for Gross–Stark, Gross's regulator, L-invariants
  and this Part II id; nothing else plans them.
- **Packets.** The AutomorphicPadicLFunctions and PadicFamilies packets; neither cites this paper
  yet.
- **Libraries.** The library citations at the pins:
  - `NumberField.Units.rank`, `analyticOrderAt` and `iteratedDeriv` (Mathlib `082e2d3`);
  - `cyclotomicCharacter` (`Cyclotomic/CyclotomicCharacter.lean:307`) and
    `IsAdicComplete.henselianRing`, both already pointed to in the review's notes;
  - `TauCeti.teichmuller` (Tau Ceti `f790474`).

I did not re-verify the 35 source issues, which the review checked on page images.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-DASGUPTA-KAKDE-VENTULLO-18.result.json`: ok.
- No Lean was compiled.
