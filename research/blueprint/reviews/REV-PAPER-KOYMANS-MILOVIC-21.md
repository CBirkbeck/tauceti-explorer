# REV-PAPER-KOYMANS-MILOVIC-21: review of the Koymans–Milovic extraction

**Verdict: accept, after corrections made in place.** All five routes are accepted, two of them with amended reasons. All five recorded source issues are confirmed, and three new misprints are added.
- **Paper.** Koymans–Milovic, *Joint distribution of spins*, Duke Math. J. 170 (2021) 1723–1755.
- **Extraction.** cc-fb70e5, issue #1318.
- **Reviewer.** Claude Code, session cc-442dc5, which took no part in the extraction.

## Sources read

- **The paper.** The whole of arXiv 1809.09597v1, the only public version. Its SHA-256 (d56a738a…f433) is the same as the extraction's. The Duke version is not openly accessible:
  - Unpaywall lists only the arXiv submitted version.
  - Project Euclid returned no article text.
  - Crossref records no correction.
  - The first author's publication page lists no erratum.
- **FIMR.** Friedlander–Iwaniec–Mazur–Rubin, arXiv:1110.6331v2, for two points:
  - Proposition 5.2 (PDF24). Its exponent ϑθ/(2+θ) with ϑ = δ/(54n|S|²) and θ = 1/(6n) gives exactly Theorem 1's δ/(54|S|²n(12n+1)).
  - The remark that Burgess gives C₃ with δ = 1/48.

## 1. Items

All 28 statements and locators match the paper. I rechecked the following against the text:
- the exponents of Lemmas 3.1 and 3.2 (with A = M = Z^{1/3} and ord(σ) ≥ 3);
- the linear-independence argument at unramified primes;
- (3.26) with Z = x^{1/(3n)};
- the reduction of Theorem 2 to Theorem 1 (C_{tn} gives C_{mn} with δ scaled by m/t, by splitting sums);
- the §5 argument.

No definition or key theorem on the way to Theorems 1–3 is missing. The FIMR spin factorisation (4.3) and the boundary estimate ∂A(x) ≪ x^{1−1/n} sit inside items 20 and 14; they could be split out later without loss.

## 2. Statuses

The two library items are correct:
- `linearIndependent_monoidHom` (LinearIndependent/Basic.lean:502) is Dedekind's independence of characters.
- `NumberField.Units.exist_unique_eq_mul_prod` (Units/DirichletTheorem.lean:506) is Dirichlet's unit theorem in the form T_K × V_K.

Three items are planned by Tau Ceti roadmaps that the extraction did not cite. The protocol forbids re-planning those, so I corrected them:
- **Item 7, Chebotarev.** Tau Ceti's Chebotarev roadmap plans the natural-density theorem `hasNaturalDensity_frobeniusPrimeSet` in Layer 14. Its Layer 11.3 also discards the primes of residue degree ≥ 2, which is the fact §5 uses. Tau Ceti already has the Frobenius prime sets, but not the density theorem. AN.4 only connects Chebotarev to Hecke L-functions.
- **Item 2, Hilbert symbols.** Two Tau Ceti layers plan them:
  - QuadraticFormInvariants 6C defines the Hilbert symbol over every nonarchimedean local field, dyadic included.
  - ClassFieldTheory Layer 14 defines the finite and real Hilbert invariants and proves the product formula.

  CA.1 stays in the planned list for the μ₂, μ_∞ packaging.
- **Item 10, fundamental domains.** This was missing and routed to SV.5. It is now planned by Tau Ceti GlobalNumberFields Layer 3C, whose `rayFundamentalDomain 𝔪` is a fundamental domain for the units ≡ 1 mod 𝔪 with the signs prescribed by 𝔪∞, with Lipschitz frontier.
  - With 𝔪 = 𝔪∞ this gives FIMR's domain for totally positive units.
  - The trivial modulus is Mathlib's `fundamentalCone`, whose bounded norm-≤-1 part gives the coordinate bound |a_i| ≪ X^{1/n}.

The other planned items (CA.1 residue symbols, GN.1 Minkowski's second theorem) are right.

I searched both libraries for the missing items and found nothing. The searches covered residue symbols, Hilbert symbols, successive minima, lattice counts with Lipschitz boundary, the geometric sieve, governing fields, spins, squarefull numbers, Burgess and bilinear prime sieves.

## 3. Routes

Every missing item is routed exactly once (11 + 5 + 2 + 1 + 2 = 21).

- **1. SV.5: accept.** It owns advanced sieves with their own bilinear inputs as separate developments, and nothing else in the atlas plans spins.
- **2. ST.2/ST.3: accept.** Bhargava's geometric sieve belongs with ST.2's uniformity. Governing fields and Theorem 3 belong to ST.3, which the Koymans–Pagano Part II brief already assumes.
- **3. CA.1: accept, amended.** CA.1 must import Hilbert reciprocity (ClassFieldTheory 14) and the local symbol (QuadraticFormInvariants 6C). Tau Ceti derives quadratic reciprocity only over ℚ, so the number-field law with μ₂ and μ_∞ is CA.1's own.
- **4. GN.4: accept, amended.** GN.4 builds on Tau Ceti GlobalNumberFields 3A's Lipschitz lattice count for a fixed lattice. Widmer's Theorem 5.4 adds the uniformity in the lattice that Lemma 3.1 needs.
- **5. AN.6: accept.** Conjecture C_n and Corollary 2.2 belong in the register of conjectural inputs.

## 4. Mistakes in the paper

All five recorded issues are confirmed at their locators in v1:
- **E1.** Two misprints in §5: O_K should be O_E in (5.1), and h(−p) should be h(−4p) in (5.2).
- **E2.** Corollary 2.2 is missing the +ε, and its congruence is printed with the wrong variable.
- **E3.** (2.5) is claimed for every m, but proved only for m coprime to F and to all σ(m). The repair is correct: if a prime divides m and σ(m), every relevant spin is 0.
- **E4.** (3.16) uses Lemma 3.1 on the squarefull part, whereas the lemma controls the radical. Summing the lemma's proof over squarefull g > A gives exactly A^{−1/2+1/ord(σ)}.
- **E5.** In (P3) the sum over ξ should run modulo N(w), and w should range over S_f. One qualification of its reason: the conjugates of a ramified degree-one prime all coincide only in the totally ramified case. In general they collide through the decomposition group, and the unramified hypothesis rules that out.

The extraction missed three misprints. I found and confirmed them:
- **E6** (PDF18–19). "real quadratic fields K" and "If K is real quadratic" should both read "totally real". No real quadratic field admits a nonempty S with S ∩ S⁻¹ = ∅.
- **E7** (PDF7). (2.5) says "δ is as in Conjecture C_n". It must be δ(|S|n) from Conjecture C_{|S|n}, as in (3.6) and the definition of θ.
- **E8** (PDF20). Lemma 4.1 writes γ : S_f × O_F. It should be S_f × O_K, since F is an integer in this paper.

None affects a theorem.

## Checks

- `python3 scripts/check_paper.py` on the extraction: ok.
- The intake `check-files` on the four deliverables passes.

Lean: none.
