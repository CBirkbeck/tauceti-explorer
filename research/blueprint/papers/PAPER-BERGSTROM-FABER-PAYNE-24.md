# PAPER-BERGSTROM-FABER-PAYNE-24: Polynomial point counts and odd cohomology vanishing on moduli spaces of stable curves

Jonas Bergström, Carel Faber and Sam Payne, *Polynomial point counts and odd cohomology vanishing on moduli spaces of stable curves*, Ann. of Math. 199 (2024), 1323–1365 ([doi](https://doi.org/10.4007/annals.2024.199.3.7), [arXiv:2206.07759](https://arxiv.org/abs/2206.07759v2)).

Extraction by Claude Code, session `cc-39fac3`, 29 September 2026 (issue #1079). Status: **complete**. Every missing item is routed exactly once.

The machine-readable extraction is [PAPER-BERGSTROM-FABER-PAYNE-24.result.json](PAPER-BERGSTROM-FABER-PAYNE-24.result.json). It has:
- 80 items: 2 library, 6 planned, 72 missing (87 after the fixes at the end: 3 library, 7 planned, 77 missing);
- 5 routes: one new roadmap, which coalesces with an existing proposal, and four source routes (nine after the fixes);
- 19 prerequisite entries;
- 6 source issues, all misprints (seven after the fixes, the seventh an error in display (3)).

## Source read

arXiv:2206.07759v2 (17 October 2023, 31 pages; SHA-256 `36beb2d3…`), read completely.
- It is labelled "minor revisions, to appear in Ann. Math." and was posted three weeks after the 27 September 2023 acceptance.
- The Annals article has no free PDF and was not collated, which the `published-version` gap records.

**Computer check.** The paper's tables were recomputed with sympy.
- For n ≤ 3, Theorem 1.4 minus Theorem 1.5 equals Proposition 9.6 in every degree, and the closed counts are palindromic.
- For n = 0, 1, 2, the §10 assembly from Propositions 5.1, 6.2, 8.1–8.7 and 9.6 reproduces Theorem 1.4 in every degree ≥ (9+n)/2. For n = 0 the pieces are:
  - N^con = q^{15} − q^{14} − q^{13} + q^{12};
  - N^nsp = q^{15} − q^{12} − q^{11} + …;
  - N^spl = q^{15} − 2q^{13} − q^{12} + q^{11} + ….
- In Theorem 11.1, open plus boundary gives closed. The dimensions add up to Theorems 1.4–1.5, and the Euler characteristics are χ_{S₃}(M_{4,3}) = 2s₃ − 6s_{2,1} and χ(M_{4,3}) = −10.
- The hyperelliptic formulas of Proposition 5.1 agree with the equivariant counts of §11.1.

## What the paper proves

**Theorem 1.1.** H^k(M̄_{g,n}; Q) = 0 for all odd k ≤ 9 and all g, n. This is sharp, since H^{11}(M̄_{1,11}) ≅ Q². It answers a question of Arbarello and Cornalba.

**Theorems 1.4 and 1.5.** For n ≤ 3, #M̄_{4,n}(F_q) and #M_{4,n}(F_q) are explicit polynomials in q, so H^•(M̄_{4,n}) is pure Tate.

**Theorems 11.1 and 11.5.** The S_n-equivariant counts for n = 2, 3, and the Euler characteristics of the symplectic local systems V_λ on M₄ for |λ| ≤ 3.

**Method.**
1. **Induction (Arbarello–Cornalba).** Excision and weights embed H^k(M̄_{g,n}) into the cohomology of the normalized boundary whenever H^k_c(M_{g,n}) = 0.
   - By Harer's vcd and the vanishing of H^{4g−5}(M_g) and H^{4g−3}(M_{g,1}) (Church–Farb–Putman, Morita–Sakasai–Suzuki), this happens outside finitely many (g, n) (Proposition 2.1).
   - For k = 9 the new base cases are M̄_{4,n}, n ≤ 3.
2. **From point counts to cohomology.** For smooth proper DM stacks over Z, polynomial point counts are equivalent to Tate cohomology (van den Bogaart–Edixhoven). Approximate counts suffice (Proposition 3.1, Corollary 3.2). Point counts on stacks follow Behrend.
3. **Counting genus 4 curves.**
   - Hyperelliptic curves are counted through Arsie–Vistoli's quotient and quadratic-character sums (§5).
   - The others are counted as canonical (2, 3) complete intersections on the three F_q-types of quadric: cone, non-split and split (§6).
   - Smooth members are counted by the **Hasse–Weil sieve**. Singular members are removed in signed counts over Frobenius orbit types, and the counts are reorganized through coefficients of inverse zeta functions (Vakil–Wood). Proposition 7.4 makes non-reduced fibres cancel (§§7–8), and Proposition 8.8 bounds curves with four or more singularities.
4. **The boundary.** Its counts come from the Getzler–Kapranov formula applied to known equivariant counts in lower genus (§9). Poincaré duality, and for n = 3 Gorsky's Euler characteristic, fix the remaining coefficients (§10).

## What the atlas and libraries already have

- **Library (3 items).**
  - Mathlib's quadratic character (`quadraticChar`, `quadraticChar_sum_zero`).
  - Mathlib's order of GL_n(F_q) (`Matrix.card_GL_field`).
  - Tau Ceti's representation ring and its injective character map (`TauCeti.repRing`, `repRingCharacter`), added by the fixes.
- **Planned (6 items).** The WeilConjectures roadmap and its inputs plan the following for varieties:
  - the Grothendieck–Lefschetz trace formula (SF.2, WC.1; ultimately the upstream Cohomological Point Counting roadmap);
  - the Hasse–Weil zeta function and its cohomological formula (WC.1);
  - multiplicativity (WC.1);
  - the étale–singular comparison in smooth proper families (WC.4);
  - purity (WC.6 and DWP.7, corrected by the fixes from WC.3);
  - the Frobenius characteristic in a fixed degree (Tau Ceti SchurWeyl L7), added by the fixes.
- **Moduli of curves.** The moduli stacks M̄_{g,n} are owned by the proposed StableReductionPartII (PAPER-YUAN-26 route 10, widened to 2g − 2 + n > 0 by FIX-RT-AREA-etale /4); this extraction imports them (route 6).
- **Not planned anywhere.** The atlas has no point counting on stacks, no Hasse–Weil sieve and no modular operads.

## Routes

1. **New roadmap `MotivicStructuresInModuliOfCurves`, "Tautological rings and motivic structures in the cohomology of moduli of stable curves" (49 items).**
   - Coalesced with PAPER-CANNING-LARSON-PAYNE-24's accepted proposal, keeping its id, title and area. DESIGN-MotivicStructuresInModuliOfCurves is pending.
   - That brief already names "the vanishing of the low-degree Borel–Moore homology of M_{g,n} proved by Bergström–Faber–Payne" as a layer, and this paper is the proof. Everything specific to moduli of curves goes here:
     - the boundary strata (the stacks themselves are imported from StableReductionPartII, route 6, since the fixes);
     - the Arbarello–Cornalba method, Harer's vcd, Church–Farb–Putman/Morita–Sakasai–Suzuki, Keel;
     - known lower-genus counts;
     - Proposition 4.2;
     - the hyperelliptic stack and counts;
     - canonical genus 4 curves;
     - all genus 4 sieve computations;
     - twisted forms of M̄_{g,n}, Getzler–Kapranov and Gorsky;
     - the §10 assembly;
     - Theorems 1.1, 1.4, 1.5, 11.1 and 11.5, with the local systems V_λ.
   - The acceptance tests in the brief are the consistency checks above.
2. **Source of WeilConjectures WC.1, WC.2, WC.4, WC.5 and WC.5:power-sum-converse (19 items).** The general point-counting tools:
   - point counts of stacks and Behrend's trace formula (Proposition 1.3);
   - the van den Bogaart–Edixhoven theorem with its specialization comparison and finite-spectrum lemma, and Proposition 3.1;
   - the Vakil–Wood inverse zeta formula, Proposition 7.4, and the Hasse–Weil sieve (Propositions 7.1, 7.5, Remark 7.6);
   - twisted forms with equivariant counts (Definition 9.1, Proposition 9.3);
   - equivariant Poincaré duality (Remark 9.4).
3. **Source of DeligneWeightsAndPurity DWP.8 (1 item).** The Galois-equivariant weight spectral sequence of a normal crossings compactification (Petersen; Payne–Willwacher).
4. **Source of FiniteFieldsAndCharacterSums FF.1 and FF.3 (2 items).** The interpolation vanishing of quadratic-character correlation sums, and the count of squarefree polynomials.
5. **Source of GeometryOfNumbersAndQuadraticArithmetic GN.2 (1 item).** The three PGL₄(F_q)-orbits of reduced irreducible quadric surfaces and their automorphism-group orders: the finite-field case of the classification of quadratic forms.

## Prerequisites not covered by the atlas

These are the papers the moduli roadmap and its point-counting sources will need. All DOIs were checked through Crossref.
- **Point counting:** van den Bogaart–Edixhoven 2005, Behrend 1993, Kisin–Lehrer 2002, Vakil–Wood 2015.
- **Cohomology of moduli of curves:** Arbarello–Cornalba 1998, Keel 1992, Harer 1986, Church–Farb–Putman 2012, Morita–Sakasai–Suzuki 2013, Tommasi 2005, Bergström–Tommasi 2007.
- **Modular operads and Euler characteristics:** Getzler–Kapranov 1998, Gorsky 2014, Getzler 1998.
- **Genus 2–3 and hyperelliptic counts:** Bergström 2008 and 2009, Arsie–Vistoli 2004.
- **Structural inputs:** Boggi–Pikaart 2000, Petersen 2017.

## Source issues

All page references are to arXiv v2. There are six misprints and no mathematical error; the computer check above found none.

| id | where | finding |
|----|-------|---------|
| E1 | Corollary 3.2 | The conclusion reads H^k(M̄_{g,n}); it should be M̄_{4,n}. |
| E2 | Proposition 3.1, proof | The error term o(p^{md/2}) should be o(p^{ms/2}). |
| E3 | §10, the #M_{4,3} display | −11q⁴ should be −11q³. This follows from Proposition 9.6 and Theorem 1.5 and was checked by computer. |
| E4 | Remark 2.2 | "Proposition 2" should be "Proposition 2.1". |
| E5 | §9, first paragraph | [GK98, Theorem 8.3] should be Theorem 8.13. Getzler–Kapranov has no Theorem 8.3, and the paper cites 8.13 elsewhere. |
| E6 | Bibliography [Won22] | arXiv:22111.16061 should be arXiv:2211.16061. |

No erratum was found: Crossref records no update and the Annals page lists none. This is not an exhaustive novelty claim.

## Gap

- `published-version` (open): collate the locators and E1–E6 with the Annals text when a copy is available.

## Corrections by the independent review

The review `REV-PAPER-BERGSTROM-FABER-PAYNE-24` (Claude Code, session `cc-fb70e5`, 29 September 2026) accepts the extraction. All six source issues are confirmed on the page images of arXiv v2, and none is added.

The review recomputed the following independently in exact arithmetic, and everything agrees with the paper:

- the §10 assemblies for n = 0, 1, 2 from Propositions 5.1, 8.1–8.7 and 9.6;
- the Theorem 1.5 subtractions for n = 1, 2, 3, which confirm E3;
- the automorphism orders (6);
- Remark 8.11's orbit-type formula.

No status, statement or route changed.

## Fixes (FIX-RT-PAPER-BERGSTROM-FABER-PAYNE-24, 30 September 2026)

Claude Code, session `cc-c2c06b`, issue #4973. This fix applies the two high and five medium findings of
`RT-PAPER-BERGSTROM-FABER-PAYNE-24`, with the verifier's corrections. The full record is
`research/blueprint/redteam/RT-PAPER-BERGSTROM-FABER-PAYNE-24.fixes.md`.

- **/1: the moduli stacks have one owner.** `moduli-stacks` now states Knudsen's theorem for 2g − 2 + n > 0 and
  goes, with `boggi-pikaart`, to StableReductionPartII (new route 6). The new item `boundary-strata` keeps the
  stratification by stable graphs in route 1. Route 1 imports the stacks.
- **/2: the weight spectral sequence carries a sign.** `weight-spectral-sequence` has E₁ with det E(G). The
  paper's (3) omits it: new source issue E7, shown false by χ_c(M_{1,2}). It affects nothing. Route 1's brief says
  that only the E₁ page is twisted.
- **/3: Poincaré duality.** The scheme statement is the new `poincare-duality-equivariant` (WC.2). The DM-stack
  statement, `poincare-duality-dm`, goes to the stacks Part II (new route 7), which also owns
  CANNING-LARSON-PAYNE-24/14.
- **/4: the squarefree count** stays at FF.3, now named as its owner. The ArithmeticStatistics ST.4 node should
  import it.
- **/5: purity.** `deligne-purity` is planned at WC.6 and DWP.7, not WC.3. The new `deligne-purity-dm`, routed to
  WC.6, covers smooth proper DM stacks.
- **/6: Lemma 2.6 and the pure-Tate remark.** Lemma 2.6 is derived from the weight spectral sequence. The pure-Tate
  remark names its inputs, and the Hodge part is recorded as an import gap.
- **/7: representation rings and symmetric functions.** Four new items:
  - R(G) (library, Tau Ceti `repRing`);
  - the fixed-degree Frobenius characteristic (planned, SchurWeyl L7);
  - Λ with the stable characteristic and plethysm (new SchurWeyl Part II, route 8);
  - plethystic Exp/Log (QM.0, route 9).

  `local-systems` cites ClassicalGroups L3 and YU-23's ClassicalGroupsPartII.
- **Result:** 87 items (3 library, 7 planned, 77 missing), nine routes and seven source issues.
