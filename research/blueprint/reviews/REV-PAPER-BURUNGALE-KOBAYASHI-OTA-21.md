# REV-PAPER-BURUNGALE-KOBAYASHI-OTA-21 — independent review of the Burungale–Kobayashi–Ota extraction

**Verdict: accept, with corrections made in place.** Reviewer: Claude Code, session `cc-fb70e5`, 21–22 September 2026. This reviewer did no part of the extraction.

**Paper.** Ashay A. Burungale, Shinichi Kobayashi and Kazuto Ota, *Rubin's conjecture on local units in the anticyclotomic tower at inert primes*, Annals of Mathematics 194 (2021), 943–966, DOI 10.4007/annals.2021.194.3.8. The published version was fetched from the Caltech repository copy the extraction cites. Its SHA-256 (`77ff3290…790e`) matches the one recorded. The whole paper was read. Printed pp. 949 and 952–962 were also viewed as images to check bars, signs and denominators.

**Checks run.**

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BURUNGALE-KOBAYASHI-OTA-21.result.json` reports `ok` on the corrected file.
- Library claims were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
- No accepted restructure touches a cited stage.
- The other paper extractions were searched for overlapping proposals; see §4.

## 1. Items

Fidelity is high. The standing hypotheses are faithful throughout: p ≥ 5 inert, p ∤ h_K, Φ/Q_p unramified quadratic and π = −p, with parity by conductor and the trivial character in Ξ⁺. So are the normalisations (π^{n+1} against p^n, χ against χ⁻¹) and the locators, where printed page = 941 + PDF page. The extraction's three claimed corrections to the paper hold against the page images:

- the (−1)^n difference between the π-adic and p-adic Tate generators (p. 948 and footnote 2);
- the conjugation bars in (3.4), (3.6), (3.7), Proposition 3.3 and §6.0.1;
- the inverse-character denominator 𝓛_p(χ) = L(φ̄χ, 1)/(Ω·δ_{χ⁻¹}(v_ε)) on p. 961.

It also silently fixed four printed typos, correctly each time:

- Gal(Ψ_n/Φ), where the paper prints Gal(Ψ_n/Ψ) (p. 962);
- V*_∞/V*,⁻ in Corollary 5.6;
- [Ψ′_s : Φ], where the paper prints [Φ′_s : Φ] (p. 958);
- "conductor" for "order" l^m.

**An error inherited from the paper.** Lemma 5.2(ii) (p. 956) bounds the number of unramified supersingular points by μ(⌊(p − 1)/12⌋ − 3/2 + (−3/p) + ½(−1/p)). It concludes "in particular" that such a point exists if p ≡ 1 mod 12 or p ≥ 31. At p = 47 the bound is μ(3 − 3/2 − 1 − 1/2) = 0, which does not exceed the ramification bound μ/6. A computation over all primes 31 ≤ p ≤ 400 shows that 47 is the only such prime; beyond that the floor term dominates. The paper's final result survives, because 47 ≡ 2 mod 3 is covered by Lemma 5.2(iii). The item now states the corrected conclusion.

**Incomplete statements, now completed:**

- **`twisted-root-sign`.** It now includes φ̄ν(pO_K) = −p (Rubin, Lemma 3.1), W(φ̄ν) = W(φ̄) (Greenberg) and W(φ̄) = W(φ).
- **`augmentation-unit-generation`.** The paper writes δ : V*/V*,⁻ → O without saying why δ kills V*,⁻. It follows from δ₁ = (1 + p⁻¹)δ and 1 ∈ Ξ⁺.
- **`hecke-lattice-relation` and `optimal-point-boundary`.** They now include the step π∘T_p = a_p(E)π = 0 and the base point x₀ = π(z₀) = Q. The paper's "Δ" should read Δ′, and σx_s should read σx_{s+1}.
- **`cm-field-data`.** It gains the hypotheses α ∈ K^× ∩ O_K and a prime to f, and its locator moves to §3.0.1.

**Missing items, now added:**

- the relation δ₁ = (1 − π⁻¹)δ, with δ(λx) = aug(λ)δ(x);
- the identification of the CM formal group with the Lubin–Tate group of parameter −p (Rubin, Lemma 3.1), used on p. 953 and in §6;
- Wiles's explicit reciprocity in the dual-exponential form used on p. 953;
- the non-vanishing of δ_χ on V*_∞ (Rubin, Lemmas 2.1 and 10.1), the input to Corollary 2.2;
- Rubin's result for 5 ≤ p ≤ 1001 (Remark 2.3).

## 2. Statuses

**Library (6, all confirmed at the pinned commits):**

- Mathlib `FormalGroup` and `FormalGroup.IsComm`;
- Tau Ceti `WeierstrassCurve.formalGroup`, `isComm_formalGroup` and `map_formalGroup`;
- Tau Ceti `WeierstrassCurve.FormalGroupPoint` and its `instAddCommGroup`;
- Tau Ceti `teichmuller`, `residue_teichmuller` and `teichmuller_pow`;
- Mathlib `Submodule.le_of_le_smul_of_le_jacobson_bot`;
- Mathlib `continuousCohomology`.

One wording fix: the `formal-law` item claimed an inverse, but pinned Mathlib's `FormalGroup` has no inverse declaration. Only the elliptic law has one, in Tau Ceti.

**Planned (10).** Eight are confirmed. Two are partial, and notes now record the gaps:

- `cm-field-data`: CM.4 does not state the Gross Q-curve descent. The item is now also in route 1.
- `twisting-cohomology`: SelmerIwasawaCohomology L3 assumes a Z_p^d-extension, while K(gp^∞) has Galois group Z_p² times a finite group.

**Missing.** None is supplied by either library. Notes now cite the nearest planned suppliers:

- Tau Ceti EllipticCurves Layers 1, 3 and 4 for `scalar-frobenius`, `supersingular-auxiliary` and `elliptic-lt-comparison`;
- AlgebraicCurves Layer 7 for `ramification-count`;
- ModularCurvesPartII R14.1 for `hecke-lattice-relation`;
- ModularCurves 7D/7F/8C, which cover only the elliptic height-2 case, for `formal-module-deformation`;
- GrossZagier GZ.3, which leaves Manin constants general, for `manin-separability`.

## 3. Corrections made in place

- Route 2: `area` changed from "cohomology", which is not a galaxy id of data/galaxies.json, to "padic", the galaxy of its parent (integral p-adic Hodge theory).
- Item formal-law: statement no longer claims an inverse — pinned Mathlib's FormalGroup provides identity, associativity and commutativity but no inverse series.
- Notes added citing nearby planned suppliers or recording partial plans: cm-field-data (also added to route 1, so CM.4 receives the Gross Q-curve descent clauses), twisting-cohomology, scalar-frobenius, supersingular-auxiliary (importing Bennett–Siksek item 69), elliptic-lt-comparison, ramification-count, hecke-lattice-relation, formal-module-deformation and manin-separability. Route 2's brief now imports the elliptic formal logarithm and the height-2 statement.
- Locators of cm-field-data, canonical-character and generator-nonvanishing corrected (§3.0.1, not §3.0.2); cm-field-data now carries the hypotheses α ∈ K^× ∩ O_K in (3.1) and a prime to f in (3.2).
- Statements completed: generic-supersingular-count (the printed conclusion fails at p = 47, covered instead by Lemma 5.2(iii)), twisted-root-sign (inputs φ̄ν(pO_K) = −p and the root-number identities), augmentation-unit-generation (why δ kills V*,−), hecke-lattice-relation and optimal-point-boundary (π∘T_p = a_p(E)π = 0, base point, Δ′). Notes corrected on xi-trivial-value, coleman-series, finis-units (and route 4's brief), primitive-elliptic-unit, ringclass-local-tower, optimal-point-trace and the three rank items.
- Five items added: delta-trivial-relation, wiles-dual-exponential, delta-chi-nonzero and rubin-small-primes (route 3), and rubin-cm-lubin-tate (route 4, the CM formal group as the Lubin–Tate group of parameter −p).

The corrected file has 115 items: 6 library, 10 planned and 99 missing. Every missing item is routed exactly once.

## 4. Routes

All five routes are accepted; the reasons are in `PAPER-BURUNGALE-KOBAYASHI-OTA-21.review.json`.

A catalogue-wide search found no owner for any of the following:

- Lubin–Tate formal modules or quasi-canonical lifts;
- Tau Ceti ClassFieldTheory explicitly excludes Lubin–Tate theory, and ET.6a refers to a formal-module owner that does not exist;
- anticyclotomic Lubin–Tate local units;
- nonordinary CM p-adic L-functions; Katz and Hsieh require an ordinary CM type;
- the inert anticyclotomic CM main conjecture.

Two coordination points arise with the pending extraction PAPER-BURUNGALE-TIAN-26, whose review (#1049) is still open:

- **Elliptic units.** Its Part II `CMAllPrimeMainConjectures` also plans Kato's §15 elliptic units and explicit reciprocity. This extraction already defers to a single shared construction. Whichever roadmap is designed first should own it, and the other should import it.
- **Two Part IIs of one parent.** Its Part II and route 5 here are both Part IIs of ModularIwasawaMainConjectures. The theorems differ, and Burungale–Tian's equivariant main conjecture is rational while route 5 needs Rubin's integral two-variable equality, so neither supplies the other as proposed. If both are accepted, merging them into one "CM main conjectures" Part II with separate layers is worth considering.
