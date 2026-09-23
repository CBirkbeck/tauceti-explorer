# PAPER-KOYMANS-PAGANO: On Stevenhagen's conjecture

Peter Koymans and Carlo Pagano, *On Stevenhagen's conjecture*, arXiv [2201.13424](https://arxiv.org/abs/2201.13424); to appear in Acta Mathematica.

Extraction by Claude Code, session `cc-39fac3`, 23 September 2026 (issue #2194). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-KOYMANS-PAGANO.result.json](PAPER-KOYMANS-PAGANO.result.json). It has:
- 264 items: 6 library, 17 planned, 241 missing;
- 6 routes: one Part II and five sources of existing layers;
- 12 prerequisite entries;
- 51 recorded mistakes (38 misprints, 7 gaps, 6 errors).

## Venue (the maintainer's question)

The Acta Mathematica volume and year are **not yet established**. As of 23 September 2026:
- Peter Koymans's publication page lists the paper as "To Appear in Acta Mathematica".
- Crossref has Acta Mathematica (ISSN 0001-5962, DOI prefix 10.4310/ACTA) registered through volume 236, no. 2 (2026), and no record matches this title.
- zbMATH Open lists only the arXiv preprint.
- International Press's Acta pages refused automated access (HTTP 403), so their list of accepted papers could not be read.

The `venue` field therefore says "to appear (accepted; not yet assigned to a volume or issue)". A later worker should fill in the volume, year and DOI once the paper appears, and compare the published text with v1.

## Sources read

- **arXiv v1** (31 January 2022), the only public version, read in full (110 pages). Item locators are v1 pages.
- **Method:** three readers covered §§1–3, §§4–6 and §§7–8 with the bibliography. Each has a coverage table mapping every numbered statement to an item.
- **Page images:** every recorded mistake was checked on the page images by an independent verifier.

## What the paper proves

**Theorem 1.1 (Stevenhagen's conjecture).**
- Let 𝒟 be the squarefree d > 0 whose prime factors are all 2 or ≡ 1 mod 4. These are exactly the d for which x² − dy² = −1 is soluble over Q.
- Let 𝒟⁻ be those d for which the negative Pell equation is soluble in integers.
- Then lim_{X→∞} |𝒟⁻(X)|/|𝒟(X)| = 1 − α, where α = ∏_{j odd}(1 − 2^{−j}) ≈ 0.41942.

**The route: Smith's method for 2^∞-class groups.** Solubility of the negative Pell equation means that (√d) is trivial in the narrow class group of Q(√d). That is decided by the Artin pairings Art_k on the 2-power torsion of the narrow class group.
- **§2:** raw cocycles, expansion maps and the higher Artin pairings.
- **§3:** a higher Rédei reciprocity law (Theorem 3.2), strengthening the authors' earlier one.
- **§§4–5:** two problems block a direct adaptation of Smith's reflection principles. The first Artin pairing is symmetric on 𝒟, and the relevant cubes are one dimension short. The paper therefore introduces **profitable triples** and proves new reflection principles:
  - one for the place ∞;
  - one for the self-pairing, whose right-hand side is a spin symbol shown to be trivial through Massey symbols and Hilbert reciprocity;
  - the standard ones.
- **§6:** Smith's combinatorics (additive systems, a Ramsey lemma) and the Galois groups of the governing fields.
- **§7:** equidistribution of the first Artin pairing in boxes. It uses prime-divisor statistics on 𝒟, effective Chebotarev with control of exceptional zeros, and Heath-Brown's large sieve for Legendre symbols.
- **§8:** the endgame: genericity, a second-moment computation, and the Markov chain whose limit P_Sym on symmetric matrices over 𝔽₂ produces 1 − α.

## What the atlas already has

**Library (6).**
- Mathlib: `Field.absoluteGaloisGroup`, `Squarefree` and `legendreSym.quadratic_reciprocity_one_mod_four`.
- Mathlib's sub-Gaussian (Hoeffding) and variance (Chebyshev) bounds.
- Tau Ceti: `NumberField.NarrowClassGroup`.

**Planned (17).** These are standard inputs:
- places, ramification and maximal pro-2 quotients: GlobalNumberFields, LocalFieldsRamification and ProfiniteProPGroups;
- cochains, Kummer theory and H²: ProfiniteCohomology;
- the Hasse principle and Hilbert reciprocity for H²(G_K, 𝔽₂): ClassFieldTheory Layers 10 and 14, and QuadraticFormInvariants Layers 6–7;
- genus theory: Multiquadratic Layers 2–3.

**Nothing in the atlas plans Smith's method.** A search of every stage description finds nothing relevant for Rédei, governing fields, reflection principles, additive systems, raw cocycles, expansion maps or Artin pairings. PAPER-KOYMANS-MILOVIC-21 routed governing fields and 2^k-ranks to ArithmeticStatistics ST.3, but only as statements.

## Routes

1. **New Part II `ArithmeticStatisticsPartIISmithMethod`** (219 missing).
   - Title: "Arithmetic statistics, counting fields and Selmer distributions, Part II: Smith's method and the 2-primary class groups of real quadratic fields". Parent: ArithmeticStatistics. Area: `algebraicnt`.
   - Its final theorem is Theorem 1.1. Its layers follow the paper:
     1. algebraic foundations (§2);
     2. higher Rédei reciprocity (§3);
     3. reflection principles (§§4–5);
     4. combinatorics (§6);
     5. equidistribution of the first Artin pairing (§7);
     6. the endgame (§8).
   - It also takes:
     - Rédei's 4-rank formula and the lemma identifying cocycles with homomorphisms to a semidirect product, because their natural Tau Ceti homes (Multiquadratic, ProfiniteCohomology) cannot be re-planned;
     - the Ramsey lemma for product sets.
   - **Why a Part II:** ArithmeticStatistics owns class-group distributions, but no stage plans this method, which is about two hundred items in its direction.
2. **Source of ClassicalArithmeticCompletion [CA.4]** (6 missing). CA.4 plans Pell equations. The negative-Pell basics go here:
   - rational solubility (Hasse–Minkowski);
   - Dirichlet's theorem for primes ≡ 1 mod 4;
   - the narrow-class-group criterion;
   - the Galois-module form of the unit group.
3. **Source of ArithmeticStatistics [ST.0, ST.3, ST.5]** (5 missing):
   - the family 𝒟, to ST.0;
   - the prior bounds towards the conjecture and the sets D_{2,n}, to ST.3;
   - MacWilliams' count of symmetric matrices over 𝔽₂, the limit P_Sym and the KP3 rank identity, to ST.5.
4. **Source of AnalyticNumberTheory [AN.2, AN.4, AN.5]** (9 missing):
   - to AN.2: the prime number theorem for quadratic characters uniform in the conductor; Landau's repulsion of exceptional zeros and the effective bound for them;
   - to AN.4: effective Chebotarev with an exceptional-zero term; Heilbronn's theorem;
   - to AN.5: the asymptotic for |𝒟(X)| and Sathe–Selberg bounds on 𝒟.
5. **Source of SieveMethodsAndPrimePatterns [SV.2]** (1 missing): the bilinear Legendre-symbol estimate from Heath-Brown's quadratic large sieve.
6. **Source of ProbabilisticAndMetricNumberTheory [PM.1]** (1 missing): the Erdős–Kac-type bound for ω(d) on 𝒟.

## Source issues (`sourceIssues` E1–E51)

51 mistakes are recorded: 38 misprints, 7 gaps and 6 errors. Each was checked on the page images of arXiv v1 and re-derived from the paper's own definitions. About fifteen further candidates were rejected.
- **Published version:** it was not available to compare, so each entry is marked `new`.
- **Effect:** none threatens Theorem 1.1. Every error is either in a proof, or in a stated lemma whose uses in the paper all satisfy the corrected hypothesis.

**Errors.**
- **E4, Proposition 2.9 and Corollary 2.11** are stated for arbitrary x₀ ∈ C. The proof's step χ_{xx₀}(σ) ≡ |T_x ∩ T_σ| holds only for x₀ = d₀∏p_i(1).
  - A counterexample with s = 1 gives ½ on one side and 0 on the other.
  - Every later use (pp. 29–34, 46, 50, 97) has the right x₀, and the items carry the corrected statement.
- **E7, Lemma 2.18:** L(φ_{a;a}) ramifies exactly where Q(√a) does, but only at the finite places. For a = 5 the field is Q(ζ₅), which is ramified at ∞.
- **E9:** at the place (2), the remark before Proposition 3.6 and the case split in the proof of Theorem 3.2 use an undefined Artin symbol when the pointers involve χ₋₁ and χ₂. Treating the places above (2) through Proposition 3.6(b) repairs it, and Theorem 3.2 stands.
- **E15:** the second condition of Definition 3.1 is printed with L(ψ_i) where the paper means ℚ(χ_i). As printed, the proof of Theorem 5.2 never verifies it; with ℚ(χ_i), as the paragraph after the definition already reads it, the proof is complete.
- **E21 and E35:** in the proof of Theorem 5.10(i), and in Definition 7.9, where boxes can be empty for large C_compr. Neither affects anything.

**Gaps.**
- **E13:** Theorem 4.6 for s = 1 applies Theorem 3.2 with an empty base set, which that theorem excludes. Theorems 5.2 and 5.3 inherit this.
- **E17, E18:** the end of the proof of Theorem 5.5 needs a vanishing that is left unsaid (Hilbert reciprocity supplies it), and the proof of Theorem 5.6 never checks that its expansion map is Pellian.
- **E41:** the telescoping in §8.1 starts with Theorem 8.2 at m = 2, which that theorem excludes. The 8-rank step needs a box form of [CKMP, Theorem 6.1].
- **E46:** (8.17) does not follow from the displayed estimates, but the weaker bound that does is enough.
- **E48:** the trivial bound Λ(x) ≤ R does not close the proof that Theorem 8.13 implies Theorem 8.10. Cauchy–Schwarz with (8.20)–(8.21) does.
- **E12:** Lemma 4.5 assumes all decomposition groups are cyclic, but only cyclicity at p is used.

**Misprints worth knowing.**
- **Statement slips:**
  - E3: Proposition 2.6 omits χ ≠ 0.
  - E5: Lemma 2.13 omits linear independence.
  - E24: Definition 6.1's inclusions are reversed.
  - E22: Theorem 5.11 pairs with χ_a where it should be χ_{π_{s+1}(x)a}.
- **E19:** the §5.3 set-up imposes its congruence conditions only for i ∈ [s], but the proofs use them at s + 1. The §8 application satisfies the weaker condition that is actually needed.
- **E51:** the page range of Gerth's paper is 489–515, not 498–515.

## Prerequisites not yet covered

Twelve entries:
- Smith's two papers on 2^∞-Selmer groups and governing fields (arXiv);
- Koymans–Pagano's "Higher genus theory" (IMRN 2022), "Higher Rédei reciprocity" (arXiv) and cyclic-fields paper (JEMS 2022);
- Fouvry–Klüners (Ann. of Math. 2010);
- Friedlander–Iwaniec–Mazur–Rubin (Invent. Math. 2013, with its 2015 erratum);
- Heath-Brown's quadratic large sieve (Acta Arith. 1995);
- Stevenhagen (Exp. Math. 1993; Math. Proc. Cambridge 2022);
- Chan–Koymans–Milovic–Pagano (arXiv);
- Gerth (Invent. Math. 1984).

Every DOI was checked against Crossref.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-KOYMANS-PAGANO.result.json` reports no errors.
- `python3 research/blueprint/intake.py check-files` reports no problems.
- Every planned and route stage id exists in `data/atlas.json`. The Part II parent is an atlas roadmap, its title begins with the parent's title, and its area `algebraicnt` is a galaxy id.
