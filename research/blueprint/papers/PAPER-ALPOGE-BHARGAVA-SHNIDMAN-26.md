# PAPER-ALPOGE-BHARGAVA-SHNIDMAN-26: Rank stability in quadratic extensions and Hilbert's tenth problem for the ring of integers of a number field

Levent Alpöge, Manjul Bhargava, Wei Ho and Ari Shnidman, *Rank stability in quadratic extensions and Hilbert's tenth problem for the ring of integers of a number field*, [Inventiones mathematicae 243 (2025), no. 3, 1129–1139](https://doi.org/10.1007/s00222-025-01392-3), open access under CC BY 4.0; arXiv [2501.18774](https://arxiv.org/abs/2501.18774).

The queue entry lists the paper as Alpöge–Bhargava–Shnidman (2026). It has four authors, Wei Ho among them, as the paper, Crossref and the arXiv listing all agree. It appeared online on 1 December 2025.

Extraction by Claude Code, session `cc-39fac3`, 22 September 2026 (issue #1203). Status: **complete**. The whole paper was read, and every missing item is routed once.

The machine-readable extraction is [PAPER-ALPOGE-BHARGAVA-SHNIDMAN-26.result.json](PAPER-ALPOGE-BHARGAVA-SHNIDMAN-26.result.json). It has:
- 44 items: 2 library, 12 planned, 30 missing;
- 5 routes;
- 15 prerequisite entries;
- 6 recorded source issues.

**Sources read.**
- **Published version** (11 pages), read in full on 2026-09-22, SHA-256 `94190b392b135905918368a0f52bb0ec1491488f65d9228fdabcee0bf08281ec`. Locators are its printed pages.
- **arXiv v1** (30 January 2025, 10 pages, the only arXiv version), read in full from its TeX source and compared line by line with the published version.

**What the published version changes.**
- It corrects the cover π in Proposition 2.7 and the Fermat curve in the introduction (E1, E2).
- It replaces the proof of Lemma 2.6: a Northcott argument instead of Serre–Tate plus Weil bounds.
- It strengthens Corollary 1.2 from "ℤ has a diophantine model over 𝒪_K" to "ℤ is Diophantine over 𝒪_K".
- It adds to §1 the definition of a Diophantine set, the Denef–Lipshitz conjecture and the Eisenträger consequence.
- The theorem numbering is unchanged.

**Inputs read where the paper relies on them:**
- Yu, J. Number Theory 160 (2016) (arXiv:1511.07511): Theorem 4 = Theorem 4.13, and §§1–4.
- Mazur–Rubin–Shlapentokh, J. Number Theory 254 (2024) (arXiv:2208.09963): Definition 2.2, Proposition 2.3, Theorems 3.1 and 4.8, and Lemmas 4.3–4.7.
- Kai (arXiv:2306.16983): the statement of Theorem 13.1.

## What the paper proves

- **Theorem 1.1.** For every quadratic extension of number fields K/F there is an abelian variety A/F with rank A(F) = rank A(K) > 0.
- **Corollary 1.2.** For every number field K, ℤ is Diophantine over 𝒪_K. Hence Hilbert's tenth problem has a negative answer over 𝒪_K.
  - It follows from Theorem 1.1 and two results of Shlapentokh and Mazur–Rubin–Shlapentokh.
  - MRS Theorem 3.1: rank A(K) = rank A(F) ≥ 1 makes 𝒪_F Diophantine over 𝒪_K.
  - MRS Theorem 4.8: if this holds for every quadratic extension, then ℤ is Diophantine over every 𝒪_K. It reduces to the totally real field M^+ and applies Denef's theorem for totally real fields.
  - The paper adds that, by Eisenträger's thesis, the same holds over every finitely generated infinite ℤ-algebra.

Koymans–Pagano (arXiv:2412.01768) proved Corollary 1.2 independently, using 2-Selmer groups of elliptic curves with full 2-torsion.

### The proof

1. **Reduction.**
   - Take an odd prime ℓ ∤ Disc(K). Then K and ℚ(ζ_ℓ) are linearly disjoint.
   - So one may replace F and K by F(ζ_ℓ) and K(ζ_ℓ), and undo this at the end by Weil restriction.
   - Write K = F(√q), with K/F unramified above ℓ.
2. **The family.**
   - The curves C_n: y² = x^ℓ + n have Jacobians J_n with ℤ[ζ]-multiplication.
   - The quadratic twist of J_n is J_{q^ℓn}, and the μ_ℓ-twists are J_{nr²}.
   - φ = 1 − ζ is an isogeny of degree ℓ. J_n[φ] is spanned by (0, √n) − ∞, on which Galois acts by the quadratic character of F(√n).
   - Sel_φ = 0 forces rank 0 (Lemma 2.1).
3. **Silent primes** (Lemma 2.2).
   - Let 𝔭 ∤ ℓ be inert or ramified in F(√n).
   - Local duality and the Euler characteristic give H¹(F_𝔭, J_n[φ]) = 0, so 𝔭 imposes no local condition.
4. **A Selmer-trivial twist** (Lemma 2.3).
   - Yu's Mazur–Rubin-type theorem gives r with Sel_φ(J_{q^ℓr²}) = 0.
   - Take S = the bad or ℓ-adic primes that split in K, and Σ = S ∪ {inert primes}.
   - Twisting further by a Σ-unit t that is an ℓ-th power at every 𝔭 ∈ S leaves the Selmer group unchanged (Lemma 2.4).
   - Each prime of S is handled by a local isomorphism. Each inert or ramified prime is silent. Each remaining prime is good, where both local conditions are the unramified ones.
5. **A point on the other twist.**
   - Let a, b be Σ-units with a + 2rb = 1, and put t = a^{(ℓ−1)/2}b.
   - The twisted Fermat curve ax^ℓ + 2rby^ℓ = z^ℓ covers C_{r²t²}, via π(x, y) = (axy^{−2}, a^{(ℓ−1)/2}(y^{−ℓ} − rb)).
   - Its point (1, 1) gives P = (a, a^{(ℓ−1)/2}(1 − rb)).
   - Only finitely many twists acquire torsion beyond J[φ] (Lemma 2.6, by Northcott).
   - So for all but finitely many classes t, P is a point of infinite order (Proposition 2.7).
6. **Many Σ-unit solutions** (Proposition 2.5 via Proposition 3.1).
   - A three-primes theorem over number fields gives prime elements p_1 + βp_2 = p_3, with β = 2rγ^{nℓ} and congruence conditions.
     - The primes lie in a non-principal class when K/F is unramified.
     - When it is ramified, residues mod 𝔪 make them inert.
   - The theorem comes from Vinogradov's circle method as extended by Mitsui, or from Kai's number-field Green–Tao–Ziegler.
   - Then a = p_1/p_3 and b = γ^{nℓ}p_2/p_3.
   - Siegel–Mahler then shows the classes t_{a,b} are infinite in number.
7. **Assembly.** rank J_{r²t²}(K) = rank J_{r²t²}(F) + rank J_{q^ℓr²t²}(F) = rank J_{r²t²}(F) > 0.

## What the atlas already has

**Library, at the pinned commits:**
- Linear disjointness of K and ℚ(ζ_ℓ). Mathlib's `NumberField.linearDisjoint_of_isGalois_isCoprime_discr` does it with `IsCyclotomicExtension.Rat.discr_prime`. Tau Ceti's `IsCyclotomicExtension.inf_eq_bot_of_unramified` gives the intersection form directly.
- Units away from an arbitrary set of primes: Mathlib's `Set.unit`.
- Finiteness of the class group (used to build γ): Mathlib's `NumberField.RingOfIntegers.instFintypeClassGroup`.
- Mathlib's `Dioph` has Diophantine subsets of ℕ^α and Matiyasevich's exponential step `Dioph.pow_dioph`, but not the full MRDP theorem. Its TODO says so.
- Tau Ceti has:
  - abelian varieties and isogenies with their degree (`TauCeti.Isogeny.degree`);
  - ray class groups (`TauCeti.GlobalNumberFields.RayClassGroup`);
  - the Kummer map for fields (`TauCeti.kummerClassMap`);
  - the tame Hensel lemma for n-th powers (`TauCeti.HenselianRing.exists_pow_eq_and_sub_one_mem_of_sub_one_mem`);
  - canonical heights of elliptic curves.

**Planned:**
- LogicAndDefinabilityInNumberTheory LD.4: MRDP over ℤ.
- HeightsRationalPointsAndObstructions:
  - RP.1: Mordell–Weil for abelian varieties, Kummer maps, isogeny Selmer groups and good-prime local conditions;
  - RP.0: Northcott and Néron–Tate heights.
- AbelianSchemesAndArithmeticModuli A6: Weil restriction of abelian schemes.
- NeronModelsAndSemistableAbelianVarieties R11.5: Néron–Ogg–Shafarevich.
- DiophantineApproximationAndTranscendence DT.2: S-unit equations.
- In the Tau Ceti roadmaps:
  - Elliptic curves Layer 7: Selmer structures on general Galois modules.
  - Class field theory Layer 5: local duality and the local Euler characteristic.
  - Class field theory Layers 12–13: the global correspondence.
  - Chebotarev Layer 10.
  - Local fields Layer 1: units near 1 are ℓ-th powers, including at 𝔭 | ℓ.
  - The Jacobian Challenge (Layers D–F) and Algebraic curves Layer 10 (hyperelliptic function fields).

**Not in the atlas:**
- Diophantine subsets of rings other than ℕ, and transfer of undecidability to other rings.
- Denef's totally real theorem, and the Mazur–Rubin–Shlapentokh theorems.
- Rank stability, and the rank identity for quadratic twists of abelian varieties.
- The CM Jacobians of y² = x^ℓ + n, their (1 − ζ)-Selmer groups and silent primes, and Yu's twisting theorem.
- Three-prime equations over number fields, Mitsui's Siegel–Walfisz, and Kai's theorem.

No stage, packet or earlier extraction mentions Hilbert's tenth problem beyond LD.4.

## Routes

1. **Source of ExponentialSumsAndCircleMethod ES.3 and ES.4** (2 items): Proposition 3.1 and the I-primes it counts.
   - ES.4 owns sums-of-primes theorems through a prime-weighted branch, and asks that each endpoint be a separate source theorem. ES.3 owns singular series and their positivity.
   - Proposition 3.1 is Mitsui's number-field version of the Vinogradov–van der Corput theorem, for three primes in p_1 + βp_2 = p_3 with congruences.
   - The hypothesis β ∈ 2𝒪_F is what keeps the 2-adic factors of the singular series positive.
2. **Source of AnalyticNumberTheory AN.4** (1 item): Mitsui's generalized prime number theorem (Siegel–Walfisz for prime elements). RS-07 left AN.4 owning the prime-ideal applications of Hecke L-functions, which its audit records as absent.
3. **Source of AdditiveCombinatorics AC.5** (1 item): Kai's Theorem 13.1, the number-field form of AC.5's linear equations in primes, and the paper's alternative proof of Proposition 3.1.
4. **Source of AbelianSchemesAndArithmeticModuli A6** (1 item): rank A(K) = rank A(F) + rank A^K(F) for a quadratic K/F.
   - Res_{K/F}(A_K) is isogenous to A × A^K.
   - This general abelian-variety statement belongs with A6's Weil restriction. The atlas plans only the elliptic case over ℚ (RankZeroOneBSD BSD.1).
5. **New Part II: Logic, definability, valued fields and motivic integration, Part II: Hilbert's tenth problem over rings of integers** (`HilbertTenthProblemOverRingsOfIntegers`, area `modeltheory`; 25 items).
   - **Why a Part II.** LD.4 plans the negative answer over ℤ, and requires every other ring to get its own interpretation theorem. This roadmap starts at that endpoint and supplies it for rings of integers.
   - **Proposed layers.** The brief lays out:
     - (H0) Diophantine sets over arbitrary rings, transitivity and transfer of undecidability;
     - (H1) Denef's totally real theorem and Denef–Lipshitz;
     - (H2) MRS Theorems 3.1 and 4.8;
     - (H3) the CM Jacobians of y² = x^ℓ + n: twists, (1 − ζ)-Selmer groups, silent primes and Yu's theorem;
     - (H4) silent twists, Σ-unit solutions, torsion in twists, the Fermat cover and Theorem 1.1;
     - (H5) Corollary 1.2 and Eisenträger's extension to finitely generated ℤ-algebras.
   - **Kept here, not planned generally.** The Jacobian arithmetic is specific to this application, so it stays in the Part II. Every general input is imported from its owner: Jacobians, isogeny Selmer groups, duality, class field theory, Chebotarev, Weil restriction, S-units and the three-prime theorem.
   - **Instructions to the design job.** The brief asks for the corrected arguments of E3 and E6 below, and records Koymans–Pagano as a second route to Corollary 1.2.

## Source issues (`sourceIssues` E1–E6)

- **E1** (misprint, arXiv v1 only; corrected in print).
  - **The misprint.** In Proposition 2.7 the cover is printed as π(x, y) = (axy^{−1}, …). It should be (axy^{−2}, …).
  - **Check.** A symbolic computation for ℓ = 3, 5, 7 shows the printed map misses the curve by a^{ℓ−1}(y^{−ℓ} − 1)(y^{−ℓ} − 2rb). The corrected map lands on it identically.
  - **Effect.** The point P = π(1, 1), all the proof uses, is unaffected. The published version prints axy^{−2}.
- **E2** (misprint, arXiv v1 only; corrected in print). The introduction names the Fermat curve ax^ℓ + 2ry^ℓ = 1 instead of ax^ℓ + 2rby^ℓ = 1. On the printed curve the solution a + 2rb = 1 is not an F-point.
- **E3** (error, the proof; new, still in print). **The claim.** In the proof of Proposition 2.5, case 𝔪 ≠ 1, "since we are free to assume t_1 = t_3, there is no local obstruction at 2-adic primes 𝔭 | 𝔪".
  - **Counterexample.** This is false for F = ℚ(ζ_3) and K = F(i), which §4 produces from ℚ(i)/ℚ with ℓ = 3.
    - There 𝔪 = (4) and v_2(β) = 1, because r and γ are 2-adic units.
    - A unit w with w² ≡ 1 mod 2 has w² ≡ 1 mod 4, so tx² + βt_2y² ≡ tz² (mod 4) has no unit solution.
    - An exhaustive search over (ℤ[ζ_3]/4)^× confirms this for every unit β/2. Admissible residues do exist with t_1 ≠ t_3, for example u_1 = u_2 = 1 + 2ζ_3 and u_3 = 3 + 2ζ_3.
  - **Repair.** Replace r by rδ^ℓ, where δ is supported on the 2-adic primes dividing 𝔪 and divisible by their 𝔪-exponent.
    - Since C_{nλ^{2ℓ}} ≅ C_n, nothing earlier changes.
    - Now β ≡ 0 modulo the 2-adic part of 𝔪, and x = y = z = 1 works there.
    - The odd primes dividing 𝔪 still have r ∉ 𝔭, as the smooth-conic argument needs.
  - **Effect.** Theorem 1.1 stands.
- **E4** (misprint, new, still in print). The singular-series factor is missing the normalization Nm(𝔭^{n−1})^{−2}. As printed, each limit is infinite. Normalized, the local factor is 1 − (Nm𝔭 − 1)^{−2} for 𝔭 ∤ β.
- **E5** (misprint, new, still in print). In the sketch's congruence-detecting sum, α_i ∈ 𝒪_F/(C) detects p_i ≡ u_i only modulo C𝔡^{−1}. The α_i should run over 𝔡^{−1}/C𝔡^{−1}. This matters because C is divisible by primes above ℓ, which divide the different of F ⊇ ℚ(ζ_ℓ).
- **E6** (gap, the proof; new, still in print).
  - **The gap.** The infinitude argument for X says every produced triple has its large primes to multiplicity < ℓ, and that the ideals have infinite support.
    - Both fail for triples proportional to a unit solution ε_1 + βε_2 = ε_3. For these 𝔱 = (π)^ℓ, and they give one (a, b) for every π.
    - Proposition 3.1 as stated ("infinitely many triples (mod 𝒪_F^×)") does not exclude that almost all triples are of this kind.
  - **Repair.** Take pairwise non-proportional triples from the count in Proposition 3.1's proof: ≫ N^{2d}/(log N)^3 against O(N^d).

**Also checked and correct:**
- Lemma 2.2's Euler-characteristic computation.
- Every case of Lemma 2.4. The primes above ℓ lie in S because they divide ℓ!. A split prime outside S is outside S′, so it is good.
- The twist isomorphisms of §2.
- The generator of J_n[φ] and its Galois character.
- The published Northcott proof of Lemma 2.6, and v1's proof. A totally ramified extension giving good reduction exists because G_{F_𝔭} = I ⋊ Ẑ.
- The implicit non-torsion step of Proposition 2.7. A multiple k((0, √n) − ∞) equals P − ∞ only for P = (0, ±√n), by uniqueness of reduced divisors.
- The linear disjointness and base-change degree count of §4.
- Yu's hypotheses. For f(y) = y² − q^ℓ, Gal(f) ≅ S_2 exactly when q is not a square.
- The "moreover" clause of Lemma 2.3. Yu's twisting elements are ≡ 1 modulo every bad prime (Proposition 4.2), or trivial on a set containing them (Proposition 4.12).

**Where corrections were looked for:**
- arXiv has only v1.
- Crossref has no update or correction relation for the DOI.
- The authors' pages list no revision.

## Prerequisites not yet covered

- Yu 2016.
- Mazur–Rubin–Shlapentokh 2024.
- Mazur–Rubin 2010 and 2018.
- Denef 1980, and Denef–Lipshitz 1978.
- Shlapentokh 2008, and Poonen 2002.
- Mitsui 1956 and 1960.
- Kai 2023.
- Poonen–Schaefer 1997.
- McCallum 1988.
- Eisenträger's thesis (2003).
- Koymans–Pagano 2024.

Links and reasons are in the JSON. The DOIs were checked against Crossref. No working online copy of Eisenträger's thesis was found.

A later paper by Koymans–Pagano, "Hilbert's tenth problem for finitely generated rings" (arXiv:2602.04468), is related to the Eisenträger consequence and may be worth adding to a batch.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-ALPOGE-BHARGAVA-SHNIDMAN-26.result.json`: ok.
- Every missing item appears in exactly one route, and no route takes a planned or library item.
- Every layer cited was read in `data/atlas.json`, with the RS-07 and RS-30 restructurings and the library audits (`data/library-coverage.json`) for RP.1, DT.2, AC.5, ES.3, ES.4, AN.4, CM.0, R11.5, R02.5 and BSD.1.
- Mathlib citations were read at 082e2d3:
  - `NumberTheory/NumberField/Discriminant/Different.lean:134`;
  - `NumberTheory/Dioph.lean`;
  - `RingTheory/DedekindDomain/SInteger.lean:108`.
- Tau Ceti citations were read at f790474:
  - `NumberTheory/NumberField/Cyclotomic/IrreducibleOfUnramified.lean:216`;
  - `RingTheory/Henselian.lean:46`;
  - `AlgebraicGeometry/AbelianVariety/Basic.lean`.
- Scratch computations for E1 (sympy) and E3 (exhaustive search mod 4) are described in the JSON.
- No Lean was written or compiled; none is a deliverable of this job.
