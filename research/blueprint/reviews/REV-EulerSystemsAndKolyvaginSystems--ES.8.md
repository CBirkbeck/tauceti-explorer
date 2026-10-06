# Review: BP-EulerSystemsAndKolyvaginSystems--ES.8

Job `REV-EulerSystemsAndKolyvaginSystems--ES.8`, issue #401. Done on 2026-10-06 by Claude (Claude Code, session
`claude-cW6mGu`). The blueprint was written by session `claude-FjaNFZ` (pull request #6670); this session wrote
none of it.

**Verdict: accepted.** The packet is a complete target-level pass, and stage `EulerSystemsAndKolyvaginSystems:ES.8`
is correctly marked `planned`. Every node is either verified or corrected in place, and every baseline citation is
confirmed. No contradiction remains open. The two gaps and nine requests are recorded honestly; one request was
added by this review.

## Counts

| Item | Count | Result |
| --- | ---: | --- |
| Nodes | 35 | 17 verified, 18 corrected, 0 added, 0 removed, 0 unverifiable |
| Baseline declarations (Mathlib `082e2d3`) | 16 | all confirmed; none removed or replaced |
| Cross-roadmap node prerequisites | 28 | all resolve; statements read |
| Requests | 8 → 9 | one added: control at `(γ − 1)`, to `SelmerIwasawaCohomology` L3 |
| Gaps | 2 | kept; both precise |
| API items / unit tests | 120 / 64 | 4 API statements corrected; every definition and construction keeps ≥ 3 tests |
| Planets | 6 | kept: key definitions and named theorems, names from the sources |
| Source issues | 2 → 3 | E801 and E802 confirmed; E803 added and confirmed |
| Suggested Lean file | — | 5 false signatures corrected and 2 convention comments added; it elaborates |

`python3 scripts/check_blueprint.py` on the packet reports 0 errors and 0 warnings. The suggested file was elaborated
with `lean-check` in the shared build at Mathlib `082e2d3`, before and after the corrections. It exits with code 0
both times, and its only warnings are the 41 `declaration uses 'sorry'`.

## Sources read

All six sources were downloaded again, and their SHA-256 hashes match the packet.

| Source | URL | What was read |
| --- | --- | --- |
| Rubin, *Euler systems*, 1999 draft | https://swc-math.github.io/notes/files/99RubinES.pdf | Ch. II §§1, 3; III §2; VI in full; VII §§1–4 in full, §§5–7 statements and the proofs of 6.1–6.3, 7.1; IX §2; App. B §3 (B.3.4, B.3.5). Page image of p. 91. |
| Rubin, *Euler systems*, published (wstein.org copy) | https://www.wstein.org/people/rubin/book/hEulerSystems.pdf | Page images of printed pp. 43 (Prop. 2.3.7 and Thm 2.3.8 with proofs) and 122 (proof of Prop. 6.2.1, Cor. 6.2.2) |
| Mazur–Rubin, *Kolyvagin systems*, authors' version (20 Oct 2003) | https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf | §§3.1–3.2, §3.5, Cor. 4.5.3–Def. 4.5.5, §5.3 in full, App. A proof of 5.3.3, §6.1 to Remark 6.1.8 |
| Howard, *The Heegner point Kolyvagin system*, arXiv:1202.6340v1 | https://arxiv.org/pdf/1202.6340v1 | Introduction (Theorem B), §§2.1–2.2 in full |
| Büyükboduk, *Λ-adic Kolyvagin systems*, arXiv:0706.0377v2 | https://arxiv.org/pdf/0706.0377v2 | Theorem 3.23, Remarks 3.24–3.25, §4.1 (Propositions 4.1–4.2, Remark 4.3) |
| Castella–Grossi–Lee–Skinner, arXiv:2008.02571v2 | https://arxiv.org/pdf/2008.02571v2 | §3.1, §3.2 (Theorem 3.2.1), §3.4 in full, Theorem 4.1.1; the extraction's E29 and E32 |

## Corrections

Every node not listed here was verified against its source passages and proof. The packet's `review.checked` list
gives a note for each of the 35 nodes.

### Mathematical corrections

| Node | Correction |
| --- | --- |
| `true-selmer-iwasawa-divisibility` | **The acceptance item was wrong.** It said Theorem II.3.8 gives the cyclotomic bound `char(A∞^χ) ∣ J² char(E∞^χ/C_{∞,χ})`. With the unit condition, `H¹_{∞,s}(ℚ_p, T*) ≅ Y∞^χ/U∞^χ` is `O` or `0`, so `loc^s(c_{ℚ,∞})` is torsion and the theorem's hypothesis fails. Rubin's proof of Theorem III.2.7 uses Theorem II.3.3 and Proposition II.3.7 instead, and so does `EulerSystemsCyclotomicMainConjecture` L2. The item now says this. |
| `lambda-adic-selmer-structure` (and `lambda-adic-ind`, `lambda-index`, `restricted-iwasawa-selmer-module`) | **The ι-convention is now recorded.** Let `G_K` act on `Λ` through `Ψ`, as the node pins. Then multiplication by `γ` on `𝐓` corresponds, under Shapiro's lemma, to conjugation by `γ⁻¹` on `lim_n H¹(K_n, T)`; a direct computation on `H⁰` shows this. So `H¹(K, 𝐓) ≅ H¹_∞(K, T)` is ι-semilinear, as the supplier `SelmerIwasawaCohomology:L3/iwasawa-shapiro` records (`𝓕_Γ(M)^ι ≅ (M ⊗ R̄)⟨1⟩`). Likewise, Mazur–Rubin's `X∞`, with the usual action on a dual, is Rubin's `X∞` with `Λ` acting through `ι`. The API item `lambdaRep_cohomologyEquiv` claimed "Λ-linearly", and `canonical_X_eq` claimed equality with Rubin's `X∞`; both are corrected. The `Ind` versus `ind_Λ` comparisons now say that they are made in one module, and that `ι` is applied across the identification. No theorem changes, because both sides of each divisibility are transported together. The roadmap's own hand-off asks for an "oriented characteristic containment", and this is that orientation. |
| `error-tolerant-self-dual-lambda-adic-bound` | **The generic form said "in Λ localized at the primes of Σ′"**, which is the opposite of the intended statement. It now says "after inverting the primes of Σ′", i.e. `ord_𝔓 char(M) ≤ ord_𝔓 char(H¹/Λκ₁)` for `𝔓 ∉ Σ′`. Hypothesis (C′) now includes the finite-level structure `H¹(K, A_𝔔) ≅ D ⊕ M_𝔔 ⊕ M_𝔔` that the parity argument uses; (D) is not needed, since this theorem asserts no ι-symmetry. Corollary 3.4.2 needs control at `𝔓₀ = (γ − 1)` (E32), and no prerequisite supplied it. The node now cites `SelmerIwasawaCohomology:L3`, which owns Iwasawa control, and a precise request was added. |
| `blind-spot-and-lambda-primitivity`, `residual-primitivity-implies-lambda-primitivity` | Residual primitivity of a Λ-adic system must be read in `KS‾(T̄)`, the module through which the blind spot is defined. It agrees with `KS(T̄)` when `χ(T̄) = 1` (Mazur–Rubin, Corollary 4.5.3). Read in `KS(T̄)` alone, the lemma does not follow. |
| `kolyvagin-sequence-induction` | The statement now carries Rubin's twist assumption (5); §§5–7 use it through Proposition VII.3.4. The proof sketch said `z_k = x_k`, but Rubin takes `z₁ = x₁` and `z_i = x₁ + x_i`. It also now defines "relatively prime" as Rubin does: the sum of the two ideals has height at least two. |
| `characteristic-ideal-bound-with-error` | Added the missing reduction step. Twisting to obtain (1) and (5) changes neither `a_τ` nor `r`, so the bound for the twisted system gives it for `(T, c)`. |
| `weak-leopoldt-from-an-euler-system` | The vanishing step was attributed to torsion-freeness of `Λ`. It actually comes from `a_τ λ_γ Ev*(γ) = 0` with `Ev*(γ)` non-torsion; torsion-freeness enters afterwards, in passing to the open subgroup. The cyclotomic example now requires `χ` even, nontrivial and of prime-to-`p` order. |
| `self-dual-lambda-adic-kolyvagin-bound` | The statement asserted outright that (A)–(D) hold for `T_pE`. Verifying them, including Nekovář's functional equation, is the consumer HE.8's work, as the roadmap's HE.8 text says ("Apply the generic ES.8 and SelmerIwasawa control maps"). The sentence is reworded accordingly. |
| `exceptional-height-one-primes`, `rubin-rational-iwasawa-divisibility` | Over `O⟦Γ⟧` with `O` ramified, `pΛ` is not prime; `ϖΛ` replaces it. |

### Locators, excerpts and examples

| Node | Correction |
| --- | --- |
| `twisting-by-characters-of-gamma` | The excerpt of Proposition VI.2.1(ii) printed `S^Σ`. The page image (draft p. 91) shows the strict `S_Σ`, as the statement already has. `L` must lie in `𝒦`. |
| `restriction-control-over-the-tower` | The second acceptance item cited `T = ℤ_p(1)` as the case of Lemma VII.3.7 that uses Proposition 3.4(iii). It is `T = ℤ_p` (`W* = μ_{p^∞}`). |
| `restricted-iwasawa-selmer-module` | The coinvariant identity holds for every `d`, not only `d = 1`. |
| `lambda-adic-kolyvagin-systems`, `blind-spot-and-lambda-primitivity`, `residual-primitivity-implies-lambda-primitivity` | Büyükboduk's examples also assume `ρ` unramified at `p` (§4.1.1); added. |
| `euler-to-lambda-adic-kolyvagin` | Hypothesis note: §5.3's standing assumptions (H.0)–(H.4) and `P = P₁` are not used by the proof (Appendix A), so the node rightly omits them. |
| `rubin-rational-iwasawa-divisibility` | The `a_τ` example now names the hypotheses it still needs. |
| Restructuring (rescope) | ES.8b also depends on ES.8a through `admissible-zp-d-extension` (for the `ℤ_p`-extension datum). |

### Suggested Lean file

Five signatures were false as stated. Each is now corrected, with `sorry` still the only proof.

| Declaration | Problem | Fix |
| --- | --- | --- |
| `KolyvaginSystem.ind_eq_char` | false for a nonzero torsion `c`, where `ind = ⊥` but the characteristic ideal is nonzero | hypothesis `c ∉ Submodule.torsion Λ H` |
| `KolyvaginSystem.not_isLambdaPrimitive_smul` | false over a field with `a = 0`, since there are no height-one primes | hypothesis `¬ IsField Λ` |
| test `free_rank_one_primitive_iff` | the same | hypothesis `¬ IsField Λ` |
| `KolyvaginSystem.mem_exceptionalSet_iff` | with non-torsion local `H²`, `charIdeal = 0` makes every height-one prime exceptional | uses the torsion submodule of both `H²` |
| `KolyvaginSystem.perturb_quotient_equiv` | false when `p` is a unit of `O` (e.g. `p = 1`) | hypothesis `(p : O) ∈ maximalIdeal O` |

The comments for `lambdaRep_cohomologyEquiv`, `canonical_X_eq` and `Xinf_eq_mazurRubin` now record ι-semilinearity.
The `exceptionalSet` docstring notes `ϖΛ`. Every API item and test name of the packet still occurs in the file.

## Baseline citations

All 16 were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, in the cited modules and at the cited
lines. Each provides what its citing nodes use:

- `PontryaginDual`, `Module.Dual`, `Ideal.span`;
- `Module.IsTorsion` and `Submodule.torsion` (both relative to non-zero-divisors);
- `Ideal.height` (infimum over minimal primes), `IsIntegralClosure`, `IsDiscreteValuationRing`;
- `Polynomial.IsDistinguishedAt` (monic, weakly Eisenstein);
- `UniqueFactorizationMonoid`, with the instance for `R⟦X⟧` over a principal ideal domain read at
  `PowerSeries/Ideal.lean` l. 202;
- `PowerSeries`, `MvPowerSeries`, `IsRegularLocalRing`;
- `Module.length` and `Module.length_eq_add_of_exact` (injective–surjective–exact hypotheses);
- `Module.Finite`.

None was removed or replaced. The reviewed library audit (`AUDIT-24`) marks every ES.8 target absent, and the packet
plans nothing that the libraries contain.

## Closure and suppliers

- **Cross-roadmap node prerequisites.** All 28 were read.
  - `SelmerIwasawaCohomology` L2–L3 and `PadicMeasuresIwasawaAlgebras` L4 supply the statements the nodes use.
  - The L4 structure theory is one-variable; the multivariable needs are requested from L4.
  - `PadicMeasuresIwasawaAlgebras` is under review (`needs_changes`), and `SelmerIwasawaCohomology` is partial.
    The nodes cited exist with the stated content.
- **In-roadmap prerequisites.** These are the stages ES.0–ES.5; their stated scopes cover the Mazur–Rubin §5.2
  DVR theorems, Howard's Theorem 1.6.1 and the Castella–Grossi–Lee–Skinner Theorem 3.2.1 that the nodes import.
- **Tau Ceti.** `ClassFieldTheory` layer 12 exists in the atlas.
- **Targets of ES.8.** Every target of the stage text and of the September 2026 hand-off has a node:
  - the Iwasawa system maps;
  - specialization outside listed exceptional primes, with the local-control kernels and cokernels;
  - residual primitivity against Λ-primitivity;
  - Theorem 5.3.10's equality criterion;
  - the several-variable variants under Rubin's hypothesis, with pseudo-null modules distinguished from finite ones;
  - scaling and zero-system tests.

## Mistakes in the sources

| Id | Verdict | Notes |
| --- | --- | --- |
| E801 (Mazur–Rubin Def. 5.3.8) | confirmed | The printed `char((H¹/Λc)_tors)` gives `Λ` at `c = 0`, against the gcd description and the authors' `Ind(0) = 0` in the proof of 5.3.10. For `c ≠ 0` the two agree. A misprint, with no effect on the results. |
| E802 (Rubin, proof of II.3.8) | confirmed | The draft has `φ ∘ loc`; the published page 43 prints `ψ ∘ loc`. |
| **E803 (new)** (Rubin, proof of Prop. VI.2.1(ii), draft p. 91) | confirmed | "let I denote an decomposition group of w in G_L" should read "inertia group". The argument needs `ρ(I) = 1`. The published proof (p. 122) is rewritten. Misprint, already corrected in print. |

## Red-team finding RT-AREA-iwasawa-1/35

This finding is handled correctly:

- No node depends on ES.6 or ES.7, or on exterior biduals, Stark systems or Gorenstein orders.
- The in-roadmap prerequisites are ES.0–ES.5.
- The `split` proposal (ES.8 rank one on ES.5 and `SelmerIwasawaCohomology` L3; new ES.8h on ES.7 and ES.8, with no
  consumers) matches the confirmed fix.
- The reader document's scope section says the same.
- The atlas edge `ES.7 → ES.8` is still in `data/atlas.json`; the fixes report assigns that edit to the maintainer.

## The reader document

`research/blueprint/readmes/EulerSystemsAndKolyvaginSystems--ES.8.md` is not a deliverable of this review, and it was
not edited. Its node sections are generated from the packet, so it should be regenerated from the corrected packet.
One hand-written passage is also wrong: under "Application handoffs", the cyclotomic entry lists
`true-selmer-iwasawa-divisibility` among what ECMC L2 imports. It should not, for the reason given above.

## Questions for the orchestrator

1. Regenerate the reader document's node sections from the corrected packet, and remove
   `true-selmer-iwasawa-divisibility` from the cyclotomic hand-off entry. The ι-convention paragraph of
   `lambda-adic-selmer-structure` could also go into the document's "Standing conventions".
2. The new request asks `SelmerIwasawaCohomology` L3 for control at `(γ − 1)` for the anticyclotomic ordinary
   Selmer structure. It is the input missing from Castella–Grossi–Lee–Skinner's Corollary 3.4.2 (E32), which BSD.7a
   consumes. When that layer is blueprinted, its issue should list the request.
3. The restructuring proposals (ES.8h; sub-layers ES.8a and ES.8b) and the atlas edit for RT-AREA-iwasawa-1/35 are
   still to be applied.
