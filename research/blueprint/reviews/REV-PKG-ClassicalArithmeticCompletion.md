# Independent package review: ClassicalArithmeticCompletion

**Verdict: accepted.** Claude Opus 5.5, session `claude-JKnJm0`, completed this independent review of issue #9796 on 2026-10-14. The package is the PR #9834 work of Codex session `codex-IccSd7`; I did none of it. All corrections below are applied in place in `README.md` and `Suggested.lean`. `metadata.toml` (`topic = "math.NT"`) needed no change.

What remains is a set of explicitly marked source inputs whose proofs no openly available source gives (listed under *Sources* below). These are marked in the README as **Unverified source input** and are never claimed as library facts. None of them blocks the roadmap's structure.

## Form

I compared the README with current upstream TauCetiRoadmap `IntegralHeckeAndGaloisDeterminants` and `DiophantineApproximationAndTranscendence`, and with `UPSTREAM_GUIDE.md`. The README now has the upstream sections in this order: Summary; Scope and ownership with Prerequisites and boundaries; Conventions; Exact supplier contracts; How to read the build; Layers 0–7 with `### k.n` prose subsections, Checks, Examples and Dependencies; Downstream consumers; References.

The main form defects were planning residue and broken internal references. I fixed them as follows:

- I replaced 258 bare packet slugs with links to the README's own subsections.
- I rewrote about 140 sentences of process language. Examples include "node", "parent's", "acceptance", "inherited", "requested from DT.0", "sourceIssues", "unread", "has not been read" and "readable copy", unit-test identifiers given as citations, and download dates and reading-copy notes in the references.
- I replaced the plain-text supplier ids (`DT.0`, `GN.2`, `AA.4`, `IHG.0` and similar) with section links into the supplier roadmaps.
- I expanded the undefined citation shorthands (`CPT`, `T81`, `F76`, `F75`, `J68`, `PRR`, `W-I`, `W-II`, `LOGSURVEY`) into author citations.
- I merged seven duplicated reference entries: Johnston, Taylor 1981, Ullom, Voight, Koymans–Pagano, Dimitrov and Smyth's Mahler survey.
- I fixed three link titles that no longer matched their headings.
- I capitalised the proper names in the layer titles.

Final state: every subsection anchor matches its heading, no internal link is missing its anchor, and the numbering is consecutive in every layer (L0 1; L1 1–75; L2 1–81; L3 1–67; L4 0–120; L5 1–25; L6 1–77; L7 0–123).

## Prerequisites and suppliers

Tier 5. The lower-tier suppliers are AdelicAlgebraicGroups (tier 2), IntegralHeckeAndGaloisDeterminants (tier 3), GeometryOfNumbersAndQuadraticArithmetic (tier 3, TauCetiRoadmap PR #851) and DiophantineApproximationAndTranscendence (tier 4, merged on TauCetiRoadmap main). The package cited them through explorer paths that do not exist and through packet ids. I checked every supplier citation against the supplier README and repointed it:

| Citation in the package | Defect | Now |
| --- | --- | --- |
| DT Mahler measure, house, absolute height | packet id | DT §0.2 |
| DT primitive minimal polynomial | packet id | DT §0.1 |
| DT finiteness of bounded-house integers | packet id | DT §0.3 |
| DT `closedFormRecurrence` | packet id | DT §2.4 |
| DT product-form Siegel lemma over ℚ(α) | **not in DT**; DT §0.3 is the house form, which gives house(α)^{2dM} where the proof of 6.12 needs M(α)^{2M} | DT §2.8 `siegelRelativeKernelBasis` with F = ℚ(α), K = ℚ. It bounds the product of row heights, with the better constant √(N+1). 6.12 now explains the specialisation. |
| IHG characteristic-polynomial law | wrong locator §0.2 | IHG §0.5 (with §0.6 for the Azumaya reduced norm) |
| AA strong approximation | packet id | AA §4.2 (a statement is added to the supplier contracts) |
| AA arithmetic quotients of SL₁(D) | link | AA §3.4 |
| GN Minkowski's convex body theorem | GN no longer owns it | Mathlib `exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure` |
| GN Oppenheim/Duke | link | GN §4.3 (PR #851) |
| GN lattice pseudobases and Steinitz classes | **absent from GN and PR #851** | new target **7.0** *Pseudobases and Steinitz classes of lattices over a Dedekind domain* |
| GN Pell automorphs | **absent from GN and PR #851** | new target **4.0** *Proper automorphs of indefinite binary forms and the Pell equation* |
| GN Markoff fundamental-set count | absent | cited directly to Ghosh–Sarnak (1.6) and Lemmas 7.2–7.3 |

The new targets carry their own sources and Checks.

- **4.0**: Conrad, Pell I, Theorem 5.3 (p.6) and Theorem 7.1 (p.10); Conrad, Pell II, §3 (p.4); Ghosh–Sarnak, consequence (c), p.4. Checks: D = 5 with ε = φ², D = 12 with ε = 2 + √3, the −1 torsion, and the image of (3,1).
- **7.0**: Voight, Theorem 9.3.6 (printed p.138) and Theorems 9.3.9–9.3.10 (p.139); Weibel, K-book I, Propositions 3.4–3.5 (pp.17–18). Checks: ℤ, 𝔭 ⊕ 𝔭 ≅ A² in ℤ[√−5], rank 0, coefficient ideals that are not invariants, and invariant factors (1), (6).

The old supplier contract for automorphs said their group is **infinite cyclic**. That is false in SL₂(ℤ), which contains −I. Target 4.0 states the group of norm-one units as {±1} × ℤ, cyclic only modulo ±1, that is in PSL₂(ℤ).

I found no upward citation, no `FoundationsAndLibraryIntegration` prerequisite and no `UPSTREAM:` id.

## Duplication against current TauCetiRoadmap and Tau Ceti a91d3aaf

I searched by mathematical object across current TauCetiRoadmap main (including the nine newer roadmaps and `Completed/*`) and the current Tau Ceti library. A Sonnet agent ran a parallel name and structure search, and I read every hit.

- **Removed:** old 1.21, primitivity of the Kronecker character. It is `TauCeti.Multiquadratic.isPrimitive_fundamentalDiscriminantChar`. Layer 1 is renumbered, and its consumer (1.51) now cites the Tau Ceti theorem.
- **Reduced to an API variant:** 1.7 `kroneckerCharacter`. Its carrier is `TauCeti.Multiquadratic.fundamentalDiscriminantChar` (after the pin; at the pin, the bundled `genusCharFun`). The target is the rest of the value table. The API items at primes, at −1 and for quadraticity cite their Tau Ceti counterparts.
- **Kept variants, each with a one-clause difference:**
  - 5.21: the forward direction is `NumberField.exists_norm_eq_neg_one_of_sq_sub_mul_sq_eq_neg_one`.
  - 5.23 and 5.24: related to `NarrowClassGroup.toClassGroup_injective_iff_exists_norm_eq_neg_one` and `mkPrincipal_eq_mkPrincipal_gen_of_norm_neg`.
  - 7.2: global tameness of a Dedekind extension at all primes with separable residue fields, against the local `TauCeti.IsTamelyRamified`.
- All the Tau Ceti items above are listed in *Prerequisites and boundaries*. Nothing else overlaps. That covers power-residue symbols and reciprocity, Lucas and elliptic divisibility sequences, automatic sequences, Eulerian numbers, Farey sequences, normal forms, integer-valued polynomials, Markoff triples, Pisot/Salem numbers, capacity, normal integral bases, locally free class groups and the Fröhlich–Taylor theory.

## Unit tests

There are 136 definition blocks with an API list, and each has at least three Checks.

- **Layer 7:** 48 theorem subsections had a single Check that repeated the statement word for word. I replaced them with 123 computed or negative-control Checks, recomputed by hand. Examples:
  - 𝔭 ⊕ 𝔭 ≅ A ⊕ 𝔭² ≅ A² in ℤ[√−5];
  - Stickelberger valuations for ω⁻¹ over 𝔽₃ (1/2) and ω⁻⁴ over 𝔽₉ (1);
  - the trace filtration in ℤ[i] at 2, 3 and 5;
  - Hasse–Davenport for q = 5, n = 2 with χ of order 4 (both sides equal 5);
  - ℤ[i] ⊗ ℤ[ζ₃] = ℤ[ζ₁₂], against ℤ[i, √2], which has index 2 in ℤ[ζ₈];
  - the trace-dual bound r = −16 for ℤ[2i];
  - 2-adic reduced norms 1, 3, 5, 7 from units of the Hurwitz order;
  - the resolvent of 1 + i in ℚ(i);
  - L(a + bσ) = log(a − b)(1 − σ) on 1 + I for C₂ over ℤ₂, whose kernel is exactly {1, σ} = Det(G);
  - the definite quaternion algebra of discriminant 11, which has class number 2 against a trivial stable class group;
  - the resolvent and Gauss sum for ℚ(√−3), both of 3-adic valuation 1/2 and both negated by complex conjugation.

  Two degenerate checks that I could not justify from the sources (7.115 and 7.116) were dropped. 7.118 now has no Checks heading, because no honest small instance of Taylor's congruence families is available.
- **Layer 4:** I removed a duplicated Check in 4.33. Its proof route also referred to a Lean declaration that does not exist.

## Sources

**Flagged by the author.** I checked every flagged locator against a public copy. Sonnet agents did the mechanical page reading of the arXiv text of Chinburg–Pappas–Taylor and of the scanned Fröhlich 1976 and Taylor 1981. I re-read the disputed pages myself; one agent misreading is noted at 7.30.

| Subsection | Locator | Result |
| --- | --- | --- |
| 1.64 | Xu, §5, pp.14–16 | Confirmed; Xu does not state the 1 + i supplement. The formula ((1+i)/λ)₄ = i^{(a−b−b²−1)/4} was recomputed at λ = −1 + 2i (value −1). It stays a marked input, now worded without process language. |
| 2.58 | Silverman–Stange, Rem. 28, p.24; Silverman–Stephens, §1, p.3; Bhakta et al., Lemma 3.5, p.9 | Confirmed (sample). Ward's theorem at primes dividing W₂W₃ and for singular curves stays a marked proof input. |
| 3.15, 3.35 | Bary-Soroker–Koukoulopoulos–Kozma, Lemma 3.4 and proof, p.20 | Confirmed: the quoted Mignotte inequality and the bound for \|I(N)\| match the README exactly. Mignotte 1988 itself is not openly available, so it stays a marked input. |
| 6.34 | Berrevoets, Lemmas 4.5–4.6, p.16 | Confirmed. Rosser–Schoenfeld's paper sits behind a bot wall, so its Corollary 3 stays marked. The threshold check (five primes in (20.5, 41]) was recomputed. |
| 6.62, 6.67, 6.70, 6.73 | Smyth survey, §5.1, (15), p.328 | Confirmed. Smyth 1971 (Bull. LMS) is not openly available; the short-gap multiplier calculation stays marked. |
| 6.77 | Bary-Soroker–Koukoulopoulos–Kozma, §7, p.37; Smyth survey, §4.2, p.326 | **Corrected.** The README claimed their factor 1/2 in L(m) was a misprint. It is not: that form needs an asymptotic Dobrowolski constant above 2, which Louboutin's 9/4 − ε supplies (survey, p.326). The README's weaker form follows from Dobrowolski's 1 − ε, and the application (p.38) uses L only up to a constant. The subsection now states the bound with the survey as locator. Dobrowolski's 1979 proof remains marked. |
| 7.13 | Fröhlich 1976 | **Corrected:** the local Gauss sums are (2.11)–(2.19), pp.392–393, not (2.10)–(2.16); (2.10) is the unit statement. Theorem 3, p.392, is confirmed. |
| 7.29 | Conrad, (A.6), p.19 | Confirmed, including the χ(n)ⁿ factor and the j = 0 sign. The proof via Berndt–Evans–Williams stays marked. |
| 7.30 | Fröhlich 1976, (2.2)–(2.5) p.390; Theorem 9 p.410; (9.1) p.412 | Confirmed. The agent reported "Theorem 8"; the page image shows Theorem 9, so no change. |
| 7.46 | Chinburg–Pappas–Taylor, §3a | **Corrected:** the logarithm is (3.1)–(3.2), pp.12–13; (3.3)–(3.5) are later lemma equations. |
| 7.63 | Chinburg–Pappas–Taylor, Theorem 5.4, p.28 | **Corrected:** the proof of Theorem 1.2(b) runs over pp.35–36. The paraphrase now says Theorem 5.4 is the G₀ induction statement and the determinant application comes in the proof of 1.2(b). |
| 7.86 | Chinburg–Pappas–Taylor, Theorem 6.2 | **Corrected:** stated on p.31 and proved on pp.31–32 (set-up pp.29–30). The imported result is identified as Wall's crossed-product theorem (Norms of units in group rings, Theorem 8.3). A self-link was removed. |
| 7.93 | Chinburg–Pappas–Taylor, Theorem 6.6, Lemma 6.8, Propositions 6.9–6.10, pp.34–35 | Confirmed, including the citations of Fröhlich, Theorem 15A, p.66 and Reiner, Theorems 41.1 and 41.7. Those book arguments stay marked. |
| 7.101, 7.109, 7.73 | Chinburg–Pappas–Taylor, Theorem 1.2(b) p.3; Theorem 1.5 p.4; Theorem 4.1 p.23; Theorems 3.14–3.16 p.19 | Confirmed. Our ν = L/p accounts for their image pφ(A). |
| 7.112 | Taylor 1981, §3 (3.1)–(3.9) pp.46–47; Propositions 3.6–3.7 p.47; Proposition 3.10 pp.47–48 | Confirmed; the Fröhlich–Taylor 1980 inputs are cited at p.47 and p.66 (§9 Ia). |
| 7.118, 7.119 | Taylor 1981, Theorem 4 pp.59–61 with four cases; §§9–10 pp.65–75; Theorem 2(b) p.45; Theorem 3 p.49 | Confirmed. The Fröhlich–Taylor 1980 local identities stay marked. |
| 7.121–7.123 | Taylor 1981, Theorem 1 and Corollary, pp.41–42 | Confirmed. 7.122 now says that part (b) makes the symplectic signs the only obstruction. |

**Random sample of 15 other locators.** All were confirmed:

- Friedlander–Iwaniec–Mazur–Rubin, Lemma 2.3, p.7.
- Dimitrov, Theorem 1, p.1.
- Assi–García-Sánchez, Lemma 4, pp.3–4.
- Shoup, Exercise 1.30 (printed p.13 = PDF p.31; a Haiku agent's p.29 was wrong, and the README is right).
- Johnston, Proposition 6.6 (p.11) and Theorem 10.7 (p.20).
- Stein, Theorem 2.1.2 (p.15) and Proposition 2.1.5 (p.17).
- Bennett–Siksek, Proposition 8.2 (p.377) and Lemma 6.2 (p.367).
- Adhikari, Theorem 3.1 (p.59) and Theorem 4.1 (p.69).
- Smyth's Salem survey, pp.1 and 5.
- Yu, Lemma 7.2.2 (p.67).
- Conrad, quadratic factoring, Theorem 3.4 (p.2).
- Zhang, §3 (p.2).
- Kedlaya, Proposition 1 and Corollaries 2–3 (p.2).
- Stange, Proposition 5 (p.7) and Theorem 8 (p.8).
- Berrevoets, Lemmas 3.2, 4.5 and 4.8.

**Own words.** A 10-word shingle comparison of the README against every source text on disk found only titles, formulas and one standard definition phrase. There are no verbatim passages and no section-by-section summaries.

## Adversarial mathematics pass

Every theorem, identity, definition and convention was read against at least one instance computed by hand. The table records the instances and what changed.

| Layer | Statements checked | Instances tried | Outcome |
| --- | --- | --- | --- |
| 0 | the Chinese remainder theorem at non-coprime moduli | x ≡ 1 (mod 4), x ≡ 3 (mod 6) solvable mod 12; x ≡ 0 (mod 4), x ≡ 1 (mod 6) not solvable | correct |
| 1 | power-residue symbols, cubic and quartic reciprocity, supplements, Hilbert symbols, Gauss and Jacobi sums, Kronecker character | (7,2)/(2,7) at ℚ₇ orientation; ((1+i)/λ)₄ at λ = −1+2i; primary normalisations mod 3 and 2+2i; Jacobi-sum values | correct; 1.21 removed as a duplicate; 1.7 reduced to a variant |
| 2 | Lucas sequences and sign tables, EDS and strong divisibility, automatic sequences, Christol, Cobham, Eulerian numbers, Farey, Stern–Brocot | EDS discriminants 0, 37, −11321/27, −543211/81; Eulerian rows; Farey 3003; Thue–Morse kernel; Lehmer Q sign table | correct; Ward's singular-prime case remains marked |
| 3 | Smith and Hermite forms, Int(D), Pólya fields, Newton polygons, Mignotte bound | HNF of the 1..9 matrix; Smith of diag 1, 4, …, 81 with its determinant; Gregory–Newton coefficients; v-orderings | correct |
| 4 | Egyptian fractions, numerical semigroups, Apéry sets, Pell, Ramanujan–Nagell, Markoff and Markoff–Hurwitz, Hasse failures | greedy 5/31, 4/13, 2/7; Apéry sets of ⟨3,5⟩ and ⟨5,9,21⟩; Sylvester; Jacobi triple product coefficients; Δ values; Ghosh–Sarnak explicit points; N_p counts | correct, except the "infinite cyclic" automorph claim, now PSL₂ in 4.0 |
| 5 | class-number and regulator certificates, narrow class groups, cube formulas | Smith form (1,2,2) of the ℚ(√−30) relations; the d ≡ 5 mod 8 cube formula; the Hadamard determinant enclosure | correct; Tau Ceti variants noted in 5.21, 5.23, 5.24 |
| 6 | Pisot and Salem numbers, Mahler measure, Dobrowolski, Smyth, Dimitrov, transfinite diameter | the root 0.754788 of 40c⁴−93c²+40 against 1/θ₀ = 0.754878; Lehmer τ₁₀; Dobrowolski bounds at d = 10 and 21; dyadic prime counts; conformal radii | correct; 6.12 repointed to DT §2.8; 6.77 locator and erratum claim corrected |
| 7 | Steinitz classes, normal integral bases, Rim, Noether, locally free class groups, Eichler and Jacobinski, reduced norms, the group logarithm, Hasse–Davenport, Gauss sums and Fröhlich–Taylor | all of the replacement Checks listed under *Unit tests* | correct as stated; 7.0 added |

## Lean

`lean-check` on `Suggested.lean` (709 lines, Mathlib 082e2d37e8): exit 0. The only warnings are 90 placeholder-proof warnings. There is no data definition without a body and no theory developed in the file.

I checked every declaration's signature against its README statement. Three changes:

- `IsEgyptianExpansion` now has the README's form, `(r : ℚ) (D : Finset ℕ)` with `0 ∉ D ∧ ∑ d ∈ D, 1/d = r`. Its examples are now {2,3} expanding 5/6 and the negative control {3} for 2/3. `exists_egyptianExpansion` now matches target 4.56.
- `ramanujan_nagell` now quantifies over `x : ℤ`, matching 4.94, with solutions listed up to sign through `x.natAbs`.
- The Thue–Morse docstring no longer claims a kernel count that the example does not state.

The closing comment lists the README interfaces that stay targets.

## Checks run

- `lean-check` (above).
- `python3 research/blueprint/intake.py check-files` on README.md, Suggested.lean and metadata.toml: 3 files, 0 problems. There are no local paths.
- Anchor, numbering, link-title and duplicate-reference validation (above).
- Process-language grep (packet ids, node, parent, acceptance, unread, readable, downloaded, maintainer): no residue.
- Checks-count audit: 136 of 136 definition blocks have three or more Checks.
