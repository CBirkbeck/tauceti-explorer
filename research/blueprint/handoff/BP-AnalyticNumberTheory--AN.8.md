# BP-AnalyticNumberTheory--AN.8 — first checkpoint: the Bost–Connes system (AN.9)

Agent: Claude Code, session cc-fb70e5, 2026-09-28. Refs #1022. The claim is comment 5875036190, confirmed by the bot. No packet existed before this checkpoint. The restructure RS-07 is accepted, and it keeps AN.9 whole.

## What this checkpoint supplies

There are 15 AN.9 nodes on 28 baseline declarations: 2 definitions, 5 constructions, 6 theorems, 1 lemma and 1 comparison. They carry 45 API items, 29 unit tests and 6 planets. The whole branch is built on Tau Ceti's Hecke rings.

1. **The Hecke pair.** The ax+b pair (P⁺_ℚ, P⁺_ℤ) in GL₂(ℚ) is a Hecke pair (`IsHeckeTriple`). Its double cosets are parametrised, with degrees L = den a and R = num a.
2. **The algebra.** The Bost–Connes algebra BCHecke K = 𝕋 P⁺_ℚ P⁺_ℤ K. Tau Ceti's left-coset multiplicity is exactly Bost–Connes' convolution, so the algebra is not the opposite ring.
3. **The rational presentation (a′)–(f′).** The generators are ℚ-valued: x_n, x′_n, e(γ). The basis is x_n e(γ) x′_m = [class of [1 γ/m; 0 n/m]]. Over ℂ, the rescaling μ_n = n^{−1/2}x_n recovers Bost–Connes' Proposition 18.
4. **The two rational forms.** Bost–Connes' ℚ-span of the μ_n e(γ) μ*_m and the ℚ-valued functions are exchanged by σ_{−i/2}. Connes–Marcolli's Proposition 3.25 holds through this map.
5. **The time evolution σ_z.** It is defined for all complex z, and equals (L/R)^{−it} for real t.
6. **The representation on ℓ²(ℕ≥1).** It has Hamiltonian log k, and the partition function is Σ k^{−β} = ζ(β).
7. **States.** The Gibbs states and their values: Li_β at roots of unity, and 2^{1−β} − 1 at e(1/2). They are KMS_β states (algebraic KMS condition).
8. **The phase transition, stated.**
9. **The symmetries.** The Ẑ^× = Aut(ℚ/ℤ) symmetries are defined through the presentation.
10. **The ground states.** Their values on the rational form are cyclotomic, and Galois acts through the symmetries.

**Source issue AnalyticNumberTheory/E14 (new).** Bost–Connes' formula (7) (p. 433) prints the class of [1 γ; 0 n/m]; it should be [1 γ/m; 0 n/m]. As printed, e(1/2)μ*₂ = μ*₂, which contradicts relation (a). No erratum was found (Springer's page, a web search, Connes–Marcolli). The entry is recorded in PUBLISHED-ERRATA.md.

## Gaps and requests

There are no requests: no other roadmap plans the Bost–Connes system. There are three gaps:

- uniqueness of the KMS_β state for β ≤ 1, which needs an ergodicity theorem and measures on Ẑ;
- trace-class operators on ℓ², so the partition function and the Gibbs states are stated as diagonal sums;
- the C*-completion C*_r(P⁺_ℚ, P⁺_ℤ), and the equivalence of its KMS states with the algebraic ones.

## Validation

- `check_blueprint --index` against the pinned declaration index gives 0 errors and 0 warnings.
- The Connes–Marcolli excerpts match its text layer 3-gram by 3-gram.
- The Bost–Connes paper is a scan without a text layer. It was read on page images at 90–200 dpi (pp. 430–433), and its excerpts are transcriptions.
- Every name in the packet appears in the Lean file.
- **The suggested file was not compiled.** There is no pinned build on the shared machine. It imports Tau Ceti's `HeckeRing.{Basic, Multiplication, Associativity}`.

## Sources

- Bost–Connes, Selecta Math. (N.S.) 1 (1995), §4: the author-hosted scan on alainconnes.org.
- Connes–Marcolli, *Noncommutative Geometry, Quantum Fields and Motives*, Ch. 3 §§2.2 and 4: the author-hosted PDF on Marcolli's Caltech page.

Neither AN.8's Sato–Shintani sources nor any Selberg-zeta source has been acquired yet.

## Resume

1. AN.9 Bost–Connes:
   - the C*-completion;
   - the proof of the phase transition. The β > 1 part needs the measure-on-Ẑ scaling lemma. The β ≤ 1 part needs Neshveyev's ergodicity proof, arXiv math/0012110.
   - the type III₁ factor;
   - Connes–Marcolli's arithmetic subalgebra (§4.4).
2. AN.9 Selberg: pick a compact or finite-volume quotient and a complete source, and import AutomorphicSpectralTheory AS.4/AS.6.
3. AN.8: acquire Sato–Shintani (prehomogeneous zeta integrals) and one multiple-Dirichlet-series source, and import ArithmeticStatistics ST.0–ST.1 per RS-07.
