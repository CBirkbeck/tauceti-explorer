# REV-ClassicalArithmeticCompletion--CA.1

Independent review of `BP-ClassicalArithmeticCompletion--CA.1`, the continuation of layer CA.1 (residues and reciprocity). Done by Claude (Opus 5.5), session `claude-Ju3xNu`, issue [#9674](https://github.com/CBirkbeck/tauceti-explorer/issues/9674), on 2026-10-14. This session wrote neither the plan nor any earlier review of ClassicalArithmeticCompletion.

**Verdict: accepted.** The packet, its reader and its suggested Lean file were corrected in place. The review object is in the packet, with a verdict for every node.

## Scope and method

The review is at target level (PROTOCOL §2). Each of the 42 nodes was checked in four ways:

- against its sources at the locators;
- against the pinned Mathlib 082e2d3 and Tau Ceti f790474, for every cited declaration;
- against the TauCetiRoadmap statements it requests, for every named Class Field Theory, Global Quadratic Forms and Quadratic Form Invariants declaration;
- for closure, the truth of its statements and tests, and the coverage of its API.

All twelve sources were fetched again. Each SHA-256 equals the one the packet records. Pages that carry a source issue were checked on the rendered PDF, not only in the extracted text.

The arithmetic was re-checked by computations written for this review, independent of the worker's:

- **Quartic statements.** The primary criterion was checked for |a|, |b| ≤ 40, and each supplement on all 464 primary elements with |a|, |b| ≤ 30. Quartic reciprocity was checked on 9,570 coprime pairs, and the coprime-coordinates lemma with its final congruence on 6,746 pairs. The rational-denominator law was checked on 664 prime pairs in form (a) and 2,605 pairs in form (b). The rational lemma was checked for all odd |a| ≤ 41.
- **Quartic sums.** For 140 split primary primes, J(χ, χ) and g(χ)⁴ were checked numerically.
- **Stickelberger's relation.** Its orientation was checked by computing valuations of g(P)^m at the conjugates of P, for (m, p) = (3, 7), (4, 13), (5, 11), (5, 31), (7, 29), (7, 43) and (8, 17). With χ_P = (·/P)_m⁻¹, the exponent at σ_t⁻¹P is t. With (·/P)_m itself it is m − t.
- **Examples.** Every worked example and unit test with a value was recomputed: the tame symbols in ℚ_7 and ℚ_2, the cubic and quartic residue values, the Φ examples, and the FIMR and Calegari–Geraghty examples.

A Sonnet subagent pulled the 65 baseline signatures from the pinned trees. Every verdict on them is mine.

## Counts

| | Count |
| --- | ---: |
| Nodes | 42 (5 definitions, 1 construction, 11 theorems, 1 comparison, 24 lemmas) |
| Verified | 31 |
| Corrected | 11 |
| Added | 0 |
| Unverifiable | 0 |
| API items | 54 (one added) |
| Unit tests | 28 |
| Baseline declarations | 66 (65 confirmed, 1 added; 5 `provides` texts corrected, none removed) |
| Requests | 7 (2 added, 1 corrected) |
| Gaps | 2 (kept; one detail extended) |
| Source issues | 14: E1101–E1109 confirmed, E1110–E1114 added |
| Restructure entries | 3 (1 added) |

`python3 scripts/check_blueprint.py` reports 0 errors and 0 warnings. `lean-check` on the suggested file exits 0, with 73 warnings, every one "declaration uses `sorry`".

## Corrections

### Mathematics

1. **Steinberg relation and skew symmetry** (`norm-residue-symbol-steinberg-and-skew-symmetry`). This node had a hidden cycle and two proof errors.
   - Step 3 obtained (1 − a, a) = 1 "by the norm criterion (second form)", that is, b is a norm from F(ⁿ√a). That form is derived from skew symmetry, which this node proves later. The node listed the norm-criterion node as a prerequisite, and that node's proof of the second form needs this one. The step now uses the first form directly: by Class Field Theory Layer 6, the kernel of the Artin map of F(ⁿ√a)/F is the norm group. This is the order of Fesenko–Vostokov IV.5.1. The prerequisites are now `local-norm-residue-symbol` and Layer 6, and the norm-criterion node takes this node as a prerequisite.
   - Step 5 expanded (ab, −ab) using (x, −x) = 1. Only (−x, x) = 1 had been proved. The step now uses Fesenko–Vostokov's 1 = (−ab, ab) = (−a, a)(a, b)(b, a)(−b, b).
2. **The comparison with Class Field Theory's `localSymbol`** (`norm-residue-symbol-and-the-cohomological-symbol`). The node took the invariant coordinate tr to be `h2MuEquivZMod_mixed`. In the Class Field Theory roadmap that is only `Nonempty (H n F 2 (muNRep n F) ≃+ ZMod n)`, so it fixes no coordinate, and with an arbitrary coordinate the claimed universal sign ε is meaningless.
   - tr is now n · inv on H²(F, μ_n) → Br F. This is what the current Tau Ceti library, after the pin, defines as `h2MuEquivZMod F`, characterised by `toRatAddCircle_h2MuEquivZMod`.
   - The request to Layer 5 now asks for this named coordinate.
   - I also checked the orientation. `localSymbol_eq_zero_iff_mem_normGroup` vanishes exactly when a is a norm from F(ⁿ√b), as the packet's symbol does, and `kummerCupPairing ζ` is (x, y) ↦ log_ζ(x)·y. So the comparison is consistent, and ε does not depend on ζ.
3. **Φ(P)** (`stickelberger-gauss-sum-power`). A hypothesis claimed that with (·/P)_m in place of its inverse the ideal would be P^{Σ t σ_t}. It is the complex-conjugate ideal P^{Σ t σ_{−t}⁻¹}. For m = 3, 4 or 6, where σ_t = σ_t⁻¹, the claimed exponent equals the correct one for the inverse character, so the hypothesis contradicted the node's own non-example. The numerical check above confirms the correction.
4. **Functoriality (iii)** (`norm-residue-symbol-functoriality`). The statement named an undefined L. It is restated as Fesenko–Vostokov's (9), with its hypothesis μ_n ⊆ L, and the proof step applies `artinMap_congr` to σ|_L.
5. **Kummer theory citation** (`local-norm-residue-symbol`, step 1). `isSplittingField_X_pow_sub_C_of_root_adjoin_eq_top` concerns X^{[L:F]} − β^{[L:F]}, not X^n − b. The step now uses `X_pow_sub_C_splits_of_isPrimitiveRoot`, read at line 67 and added to the baseline, and keeps the other lemma for what it states.
6. **Missing suppliers.** The archimedean symbol compares itself, for n = 2, with Global Quadratic Forms 4.4's real norm-equation symbol and with Class Field Theory Layer 14's `infiniteHilbertInvariantAt`. The symbol at a place compares itself with `finiteHilbertInvariantAt`. These layers were not prerequisites. They are now, with two new requests.

### Sources and locators

7. Fesenko–Vostokov IV.5, Exercise 4 is on printed p. 152, not p. 150. The node's `match` said the exercise gives the real symbol "1 when a > 0 or b > 0". It prints 1 only when both arguments are positive, which is wrong. The node uses the correct value, as Milne gives it, and the error is E1112.
8. FIMR arXiv v2: Lemma 2.3 is on p. 7 (the packet said p. 6), and the proof of Proposition 2.2 runs over pp. 7–9 (the packet said pp. 6–8). §2 occupies pp. 5–9.
9. Calegari–Geraghty: the posted copy is paginated 1–96, so Lemma 8.21 is on its pp. 72–73. The packet cited Duke's pp. 872–873 as printed pages of that copy. Both page sets are now given.

### Suggested Lean file

10. Three theorems, `span_stickelbergerPhi`, `stickelbergerPhi_span_singleton` and `stickelbergerPhi_of_isEisensteinPrimary`, assumed `hσ : ∀ t, (σ t) ζ = ζ ^ t` for every natural number t. At t = 0 no ring automorphism sends a primitive root ζ to 1, so for m ≥ 2 the hypotheses were contradictory and the theorems vacuous. The hypothesis is now asked only for t prime to m (`∀ t, t.Coprime m → …`).
11. The comment block's form of `normResidueSymbol_eq_localSymbol` now names the invariant coordinate instead of `h2MuEquivZMod_mixed`. The new API item `normResidueSymbol_pairing` is listed there too.

Every packet API and unit-test name appears in the file. The norm-residue symbol stays in comments because the local Artin map is not at the pin, which is the right call under the 2026-10-12 shape rule.

### Bookkeeping

12. In the split proposal, the continuation has 42 nodes (the proposal said 41). The CA.1b list has four number-field quadratic nodes (it said five). CA.1c has nine cubic frontier lemmas (it said seven).
13. Five `provides` texts were corrected:
    - `Ideal.spanNorm_singleton` is about `spanNorm`; `relNorm` is `spanNorm` by definition (`Ideal.spanNorm_eq`).
    - `GaussianInt.sq_add_sq_of_nat_prime_of_not_irreducible` gives only ∃ a b, a² + b² = p.
    - `autAdjoinRootXPowSubCEquiv` runs from roots of unity to the Galois group.
    - `IsCyclotomicExtension.Rat.inertiaDeg_span_zeta_sub_one` is stated for {p^(k+1)}.
    - `isSplittingField_X_pow_sub_C_of_root_adjoin_eq_top` is stated for the exponent [L:K].

## Baseline

All 65 declarations exist under their names, at the cited modules and lines, at the pinned commits. Each provides what its citing nodes use, with the same or weaker hypotheses. Two stated hypotheses are worth knowing:

- `gaussSum_sq` needs a field and a nontrivial quadratic character.
- `jacobiSum_mul_nontrivial` needs no primitivity.

Neither weakens a use in the packet. No citation was removed, and one was added (`X_pow_sub_C_splits_of_isPrimitiveRoot`).

## Mistakes in the sources

**Confirmed (E1101–E1109).** All nine were confirmed at their locators. The pages of E1101, E1105, E1108 and E1109 were checked on the rendered PDF.

**Added by this review:**

- **E1110** (gap). Shastri, §5, Lemma 1. The proof establishes only ⟨1 − a, a⟩ = 1. Parts (iii) and (iv) rest on ⟨a, 1 − a⟩ = 1, which is obtained only through skew symmetry, which (iv) derives from (iii). The argument is circular as written.
- **E1111** (misprint). Shastri, §5, Lemma 1 (iii) is printed as one chain of equalities that would make the symbol trivial.
- **E1112** (error). Fesenko–Vostokov IV.5, Exercise 4, p. 152, prints a wrong real Hilbert symbol. With it the requested product formula fails at (2, −1): the real factor is −1, and every finite factor is 1 by Exercise 3.
- **E1113** (gap). Xu, Lemma 6.18. The proof assumes the prime below P odd, but primes above 2 occur. The same computation covers them.
- **E1114** (error). Xu, Proposition 4.8. The power sums are said to vanish "since (k, p − 1) = 1". That is false for k = (p − 1)/3. The right reason is 0 < k < p − 1.

## Closure

Every target of CA.1 that the continuation claims is realised. The twelve review-frontier targets of the first pass are each served, as the coverage note says: eight by the fourteen lemma nodes, and four by the norm-residue symbol and the Stickelberger nodes. Each frontier obligation in the first-pass gaps was compared with the lemma that answers it.

The proof sketches follow from their prerequisites. Prerequisite chains end in Mathlib, Tau Ceti, the first pass, the requested Tau Ceti roadmap layers, or the two recorded gaps.

- **The 1 + i supplement** is supported by its reduction sketch and by my machine check. A further search found no public proof, so the gap stays.
- **The value of ε** now has a lead. K2SymbolsBrauer:T.7/local-comparison, in a packet not yet accepted, gives −1 for the coefficient map ζ^i ⊗ ζ^j ↦ ζ^{ij}, which is `kummerCupPairing ζ`, under Milne's conventions.

The comparison node is still asserted up to that sign, as recorded.

## Reader

Every node section of the reader was regenerated from the corrected packet. I first confirmed that the renderer reproduces the committed reader's 42 node sections byte for byte from the committed packet. Eleven sections changed. The closing sections were edited by hand to match: the dependency table, boundaries, gaps, frontier and mistakes.

## Questions for the orchestrator

1. **Ownership of the local m-th power norm-residue symbol.** K2SymbolsBrauer's packet `K2SymbolsBrauer--T.3` plans T.7/classical-local-symbols and T.7/local-comparison. CA.1 plans the same objects in the same orientation. T.7 imports CA.1 and leaves the owner to the maintainer. The packet now carries a `rescope` entry: CA.1 owns them, and T.7 imports them and keeps the passage to K₂. If that is accepted, the K2SymbolsBrauer packet needs repointing. Its request to CA.1, for the m-th power Hilbert reciprocity law in this normalisation, is answered by the first pass's `hilbert-product-formula-of-degree-n` read through `CA.1/norm-residue-symbol-at-a-place`.
2. **Assembly.** The handoff's join instructions stand. For the first pass's `eisenstein-reciprocity`, follow the handoff, which adds three suppliers (`stickelberger-relation`, `stickelberger-unit-factor-of-a-primary-element` and `eisenstein-reciprocity-at-ideal-norms`); the packet's coverage note names only the last two. The first pass's `hilbert-symbol` and this part's `norm-residue-symbol-at-a-place` both compare with Global Quadratic Forms 4.4 and Class Field Theory 14, and the assembly can merge those requests.
3. **Class Field Theory roadmap.** It has no named invariant coordinate of H²(F, μ_n): `h2MuEquivZMod_mixed` is an existence statement, while the Tau Ceti library after the pin has `h2MuEquivZMod`. This is now a request from CA.1. The maintainer may wish to pass it upstream.
