# REV-EllipticCurveModularity: independent review

Reviewer: Claude Code, session cc-fb70e5 (issue #391; claim comment 5879897888, confirmed by the bot). Date: 2026-09-28.

The blueprint under review, BP-EllipticCurveModularity, was written by another session, Claude Code cc-39fac3, in PR #3833 (checkpoint 1, status partial). It covers stages R29.1–R29.6 under the accepted RS-06.

**Verdict: accepted after corrections.** All 20 nodes were checked, and one node was added:

| Stage | Nodes |
| --- | --- |
| R29.1 | 4 |
| R29.2 | 3 |
| R29.3 | 5 + 1 added |
| R29.4 | 3 |
| R29.5 | 2 |
| R29.6 | 3 |

- 8 nodes were corrected, 12 verified, and 1 added.
- The main defect is a near miss of a baseline citation. `newform-of-E` claimed uniqueness among newforms of all levels dividing N from Tau Ceti's strong multiplicity one, but that theorem is stated for one fixed level and nebentypus. This is corrected by an added lemma and a more precise request.
- The suggested Lean file had one false statement, which is fixed. The file elaborates at the pin.
- No mistakes were found in the passages of the sources the packet uses. The packet had no `sourceIssues` list, meaning "not checked"; it now has an empty one, with `sourceVersions`.

## What was checked

- **Sources.**
  - All 5 sources were downloaded from the cited URLs, and every sha256 reproduces the packet's:
    - Serre 1987 (Collège de France scan of the Duke article);
    - Faltings 1983 (scan);
    - Carayol 1986 (Numdam);
    - Deligne–Serre 1974 (Numdam);
    - Cremona's *Algorithms*, Chapter II (author's site).
  - All 29 excerpts were found, word by word in order, on the page their locator names. 26 match at ≥ 0.9 and the other 3 differ only by OCR of subscripts and formulas.
  - Page offsets were checked:
    - Serre: printed = PDF + 178;
    - Faltings: printed = PDF + 348;
    - Cremona: printed = PDF + 6.
  - Statements were compared with their sources:
    - Serre §2.8, Proposition 4 and its proof. The proof is written for p ≠ 2, with p = 2 called analogous, as the node says.
    - Serre §3.3: (b′) and the oddness argument, and (3.3.1?).
    - Serre §4.6: Théorème 4, Lemme 5 and the criterion "si p > 5, on vérifie que N_p = N si et seulement si (a), (b)", the pigeonhole, (4.6.4) and Remarque (2).
    - Serre §4.7, Théorème 5.
    - Carayol 0.8 Corollaire, and his 0.7 Remarque that irreducibility of σ is Ribet's unpublished result.
    - Faltings, Korollar 2.
    - Deligne–Serre, Lemme 6.11.
    - Cremona §§2.6, 2.7 and 2.15.1.
- **Baseline.** All 16 declarations exist at the cited modules in the pinned index. The statements used were read in the pinned trees:
  - Mathlib: `Finite.exists_infinite_fiber`, `Int.eq_zero_of_abs_lt_dvd`, `Algebra.norm_eq_zero_iff`, `CuspForm`, `WeierstrassCurve.localPolynomial` / `LFunction` / `LSeries`. The sign convention is split multiplicative 1 − X and nonsplit 1 + X, as `bad-euler-factors` says.
  - Tau Ceti: `HeckeRing.GL2.Newform` and `Newform.eq_of_forall_notMem_eigenvalue_eq`.
  - Four `provides` texts were inaccurate and are corrected (below).
- **Closure.** Every proof sketch was read against its prerequisites. The following were re-derived:
  - the finiteness of Σ_E from the two R28.6 nodes (degree n²·deg f₀);
  - the 24-argument at additive places;
  - the Tate-curve criterion at multiplicative places;
  - the norm argument;
  - the conjugation argument for rationality;
  - the functional-equation sign (Λ(f, s) = −ε_N Λ(f, 2 − s) in weight 2, so w_E is the eigenvalue of −W_N).
- **Cross-roadmap references.** All 26 stage and 5 node references resolve on origin/main. The supplier texts were read:
  - R28.6 nodes: finiteness of the isogeny class, the infinite-cyclic Hom, semisimplicity and the isogeny criterion;
  - R15.5 node: the Deligne–Serre lifting;
  - stage texts of R01.4, R01.5, R01.6, R15.4, R19.4, R19.6, R27.6, R14.5, R14.6 and R07.6.

  Each covers what it is asked for. R27.6's text says it produces the characteristic-zero newform of level N(ρ̄) and exports the finite-flat weight-two case to R29. R19.6 proves V_ℓ(A_f) ≅ ⊕ρ_{f,λ} for weight two. R14.6 supplies the rational cusp and the normalised Abel–Jacobi map.
- **Library audit.** `data/library-coverage.json` has no entries for this roadmap. Its Layer 4 entry for Tau Ceti's ModularForms (AUDIT-16) records that "all newform statements are at one fixed level". The newform decomposition (Miyake Cor. 4.6.20) and the bad-prime U_ℓ eigenvalues (Miyake 4.6.17) are absent. This confirms the main correction, and nothing in the libraries is planned again here.
- **API, tests, planets.**
  - The four definitions and constructions each have at least three tests and adequate API.
  - The tests were checked:
    - 11a1 has rational 5-torsion and v₁₁(j) = −5;
    - 7 ∉ Σ_{11a1};
    - a₂(11a) = −2;
    - the modular degrees of 11a1 and 37a1 are 1 and 2;
    - 32a has CM.
  - The 7 planets are definitions, constructions and named theorems, at most two per stage.
- **Checker.** `scripts/check_blueprint.py` reports 0 errors and 0 warnings against the pinned index, before and after the review, with the other packets taken from origin/main.

## Corrections

1. **Added `R29.3/strong-multiplicity-one-across-levels`** (lemma, `addedBy`).
   - `newform-of-E` said: "Uniqueness among newforms of all levels dividing N (Tau Ceti HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq)". That theorem requires `f g : Newform N k` at one level with `f.χ = g.χ`.
   - The new node derives the cross-level statement from the Atkin–Lehner–Li decomposition, which is requested, and then applies the fixed-level theorem at the common level.
2. **`newform-of-E`** now cites the added lemma.
3. **Request to Tau Ceti ModularForms Layer 4** made precise:
   - the cross-level newform decomposition and eigenspace description (Miyake Cor. 4.6.20; Diamond–Shurman Thm 5.8.3);
   - newforms as U_ℓ-eigenvectors, with a_ℓ ∈ {±1} for ℓ ∥ N and 0 for ℓ² | N (Miyake 4.6.17), which `bad-euler-factors` uses.

   The added node, `newform-of-E` and `bad-euler-factors` are added to `neededBy`.
4. **`tate-module-comparison`**: V_r(F_E) was called semisimple as "irreducible, from the Eichler–Shimura construction".
   - Irreducibility is Ribet's theorem, which Carayol cites as unpublished.
   - Semisimplicity now comes from V_r(F_E) ≅ V_r(A_{F_E}) (R19.6, R14.5; K_F = ℚ) and Faltings. The prerequisites are added.
5. **`isogeny-to-E`**: added the prerequisite `exact-conductor`. A_{F_E} is a quotient of J₀(N) only once the level of F_E is known to be N.
6. **`modular-parametrisation`**:
   - The composite depends on the chosen isogeny λ : A_{F_E} → E, which is now explicit.
   - The constant c lies in ℚ^×; it is Manin's constant only for the optimal curve with a Néron differential.
   - The 11a3 test fixes λ of minimal degree 5.
7. **`modularity-theorem`**: the converse (iii) ⇒ (i) said the pullback of ω_E is a Hecke eigenform "by the Hecke compatibility of the Jacobian quotient", which does not follow. It is replaced by:
   - (iii) ⇒ (ii), via the Abel–Jacobi universal property (R14.6);
   - (ii) ⇒ (i), via Eichler–Shimura (R19.6), semisimplicity (R28.6), Jordan–Hölder and Frobenius recognition (R01.5), then R29.3–R29.4.

   (ii) also records Serre's parenthetical remark that E is itself a quotient of J₀(N).
8. **`residual-conductor-equality`**:
   - The level-lowering test claimed N(ρ̄) = N/ℓ. That needs p ∤ v_{ℓ′}(j_E) at the other bad primes too.
   - The node's p ≥ 5 extends Serre's p > 5. The 24-argument covers p = 5, and this is now said.
9. **`weight-two-and-level-N-from-the-weight-recipe`**: "equivalently a normalised newform" was wrong, since a mod-p eigenform of level N is not equivalent to a newform of level N. The statement now says that R27.6 gives the newform and f_p is its reduction.
10. **`residual-conductor-divides`**: the proof now compares E[p] with T_p(E) (p ≠ ℓ) and only then uses independence of r. Before, it mixed V_r for arbitrary r with the reduction of the p-adic lattice.
11. **Baseline `provides` texts corrected:**
    - `mathlib:CuspForm` is for a subgroup of GL₂(ℝ), not SL₂(ℤ);
    - `mathlib:Algebra.norm_eq_zero_iff` is for finite free extensions of domains, not fields;
    - `tauceti:HeckeRing.GL2.Newform` is on Γ₁(N) with a nebentypus;
    - `tauceti:HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq` holds at a fixed level and nebentypus only.
12. **Source `carayol86-hilbert`**: the edition named a local file (`references/text/SS_Carayol.txt`). It now names the Numdam PDF, whose hash matches.
13. **`sourceIssues` and `sourceVersions` added** (see below).

## Suggested Lean file

- `eq_one_of_pow_eq_one_of_sub_mem` (for `trivial-nebentypus-by-reduction`) was **false**, because it did not require p to be prime. With p = 4, m = 2, ζ = −1 and 𝔭 = (2) in ℤ, every hypothesis holds and ζ ≠ 1. p = 0 fails similarly. `(hp' : p.Prime)` is added.
- The cross-level lemma is added to the commented block of newform statements.
- The file was elaborated once with `lake env lean` against Mathlib 082e2d3, on toolchain v4.34.0-rc2, with 96 GB free and taking 8 s. It gave 0 errors; the only warnings are for the declarations proved by `sorry`.

## Source issues

The packet had no `sourceIssues` key, which PROTOCOL §18 reads as "not checked". Every passage the packet quotes or relies on was checked at its locator, and no mistake was found:
- Serre §§2.8, 3.3, 4.6 and 4.7;
- Carayol 0.8;
- Faltings, Korollar 2;
- Deligne–Serre 6.11;
- Cremona §§2.6, 2.7 and 2.15.1.

The list is therefore added empty, with `sourceVersions` for the five texts read.

Two checks came close to findings:
- Serre's criterion is stated for p > 5 and is also true for p = 5. That is not a mistake.
- Serre's proof of Théorème 4 derives level "un diviseur de N" and reaches level N only through Faltings' isogeny, since isogenous curves have equal conductors. That is correct as written.

## Gap

The one gap, "Mazur's rational-isogeny theorem is an unread import", is correctly recorded. Its own update says the argument no longer needs Mazur, since finiteness comes from R28.6. It is kept as the record of an unread sharper input.

## Questions for the orchestrator

1. `finite-flat-weight-two` requests "E[p] of a good-reduction curve is finite flat over ℤ_p" from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.6. R07.6's stage text ("the Galois-module comparison for abelian-scheme torsion") covers it. However, the finite local freeness of E[p] for an elliptic curve over ℤ_(p) is also Katz–Mazur material (Tau Ceti ModularCurves 7E, PD-1), so a lighter supplier exists.

   Disclosure: the reviewer wrote the FiniteFlat blueprint, which is a supplier here only through this request.
2. The requests to Tau Ceti ModularForms Layers 4 and 8g name results the library audit lists as absent. They are prerequisites of the planet `newform-of-E`, so upstream work on the Tau Ceti roadmap is needed before R29.3 can be formalised.
