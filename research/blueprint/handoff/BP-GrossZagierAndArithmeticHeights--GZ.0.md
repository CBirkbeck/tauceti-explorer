# BP-GrossZagierAndArithmeticHeights--GZ.0 — first checkpoint: GZ.0 normalisations

Agent: Claude Code, session cc-fb70e5, 2026-09-28. Refs #744. The claim is comment 5875324525. No packet existed before this checkpoint.

## What this checkpoint supplies

There are 11 GZ.0 nodes on 36 baseline declarations: 4 definitions, 1 construction, 1 theorem, 2 lemmas and 3 comparisons. They carry 23 API items, 20 unit tests and 5 planets. Every convention is pinned to Tau Ceti's actual definitions at f790474.

**The main finding.** Tau Ceti's `Point.canonicalHeight` carries the factor ½: it is the (O)-height, Silverman's normalisation. Its `neronTatePairing` is the halved polar form, and `regulator` is the Gram determinant of that pairing. So `regulator` = 2^{−r}·Reg_BSD. For 37.a1 it is 0.02556, against LMFDB's 0.05111, and LMFDB's check is Ω·0.05111 = L′(E,1). This contradicts two statements in the Tau Ceti corpus:

- the EllipticCurves roadmap's Layer 6 pin (ĥ = lim h(x(nP))/n², "the regulator and the BSD quotient … are stated against this one");
- the `CanonicalHeight` docstring (the (O)-height is "the one the Néron–Tate pairing, the regulator and the BSD formula are stated with").

A request to EllipticCurves Layer 7 asks that the BSD quotient use `bsdRegulator`. The maintainer may also want the upstream docstring and roadmap text corrected; this worker did not touch Tau Ceti.

**What is defined.**
- `Point.xCanonicalHeight` (ĥ_x = 2ĥ), `bsdHeightPairing` (the polar form, = 2 • neronTatePairing) and `bsdRegulator` (= 2^r · regulator).
- Gram-determinant rescaling by c^r.
- The canonical height on E(K) ⊗ ℚ, and the trace-versus-average factor h².
- The centres s = 1 and ½, and Λ′(E,1) = N^{1/2}π⁻¹L′(E,1) with Mathlib's Γ_ℂ.
- The unit index u = #μ(K)/2.
- The Artin-map convention (χ ↦ χ⁻¹).
- The full real period Ω = c∞·Ω⁰.

**New source issue GrossZagierAndArithmeticHeights/E1.** Conrad's "Gross–Zagier revisited" defines u_x = #μ(K) on p. 69 but uses u_x ∈ {1, 2, 3} (= #μ(K)/2) on p. 119. It is recorded in PUBLISHED-ERRATA.md.

## Requests and gaps

**Request:** EllipticCurves Layer 7, for the BSD regulator and the full real period.

**Gaps:**
- the [K:ℚ] height normalisation (no number-field `AdmissibleAbsValues` instance exists in either library);
- the comparison of Cai–Shu–Tian's Poincaré pairing with ⟨,⟩_BSD, which needs GZ.1.

## Validation

- `check_blueprint --index` against the pinned declaration index gives 0 errors and 0 warnings.
- The intake file check is clean.
- The excerpts match the text layers of Müller–Stoll, Cai–Shu–Tian and Conrad.
- The LMFDB values were read from the curve page and its knowls on 2026-09-28.
- Every name in the packet appears in the Lean file.
- **The suggested file was not compiled.** There is no pinned build on this machine.

## Sources

**Read:**
- Müller–Stoll (arXiv 1509.08748v2), §§1 and 3.
- Cai–Shu–Tian (arXiv 1408.1733v2), §1.
- Conrad, "Gross–Zagier revisited" (MSRI 49), §1 and p. 119.
- LMFDB: 37.a1, ec.canonical_height and ec.q.real_period.

**Missing:** YZZ (not freely available) and Gross–Zagier 1986. The Haar/torus-volume normalisation (2L(1, η)) needs YZZ and AL.0–AL.3.

## Resume

1. GZ.0:
   - Haar and torus-volume normalisations;
   - the change of differential and degree under isogeny (EllipticCurves Layer 6's planned ĥ_{E′}(φP) = deg φ·ĥ_E(P));
   - the [K:ℚ] normalisation, once a number-field `AdmissibleAbsValues` instance exists.
2. GZ.1: the Poincaré-biextension pairing, compared with `bsdHeightPairing`.
3. GZ.2–GZ.7 from YZZ, once a public copy or the supplied book is available to the worker.
