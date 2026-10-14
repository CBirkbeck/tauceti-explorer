# Handoff — PKG-FaltingsFinitenessAndIsogenyTheorems

Job `PKG-FaltingsFinitenessAndIsogenyTheorems`, issue #9170. Agent: Claude (Opus), session
`claude-SegtL4`, 14 October 2026. Upstream tier 17 of `research/blueprint/upstream/CaraianiNewton.md`.

## Deliverables

- `research/blueprint/packages/FaltingsFinitenessAndIsogenyTheorems/README.md` — the roadmap, six layers
  R28.1–R28.6 with 62 numbered subsections, 61 targets and one remark (every one of the 56 plan nodes, plus
  the new targets listed below),
  each with hypotheses, source locator, proof route, *Needs* and Checks.
- `research/blueprint/packages/FaltingsFinitenessAndIsogenyTheorems/Suggested.lean` — 265 lines: light
  real-bodied definitions (`fracIdealDegree`, `quatMatrix`, `matAct`, `sumForm`,
  `QuaternionIsotropic.subspace`) and the statements whose carriers exist at the pins (degree of a
  metrized fractional ideal, quaternion construction, `−1` as a sum of four squares in `ℤ_l`, finiteness of
  Weil polynomials, finiteness of stable lattices, the infinite-cyclic Hom lemma and the finiteness of
  elliptic isogeny classes over Tau Ceti's `Isogeny.Hom`), with a closing list of the README targets whose
  carriers are not at the pins.
- `research/blueprint/packages/FaltingsFinitenessAndIsogenyTheorems/metadata.toml` — `topic = "math.NT"`.

## Checks run

- `lean-check …/Suggested.lean`: **exit 0, `sorry` the only warning** (Mathlib 082e2d3, Tau Ceti f790474
  build). The two examples with real proofs (`fracIdealDegree 1 1 = 0` by `simp`; `deg (n • f₀)` by Tau Ceti
  `Hom.degree_zsmul`; the `ℚ` non-example by `nlinarith`) elaborate.
- `python3 scripts/check_sorry_data.py Suggested.lean`: exit 0 (no sorry'd data).
- `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems.
- Name check: every backticked supplier declaration or target name in the README was found in the named
  supplier's package README/Suggested.lean, the current TauCetiRoadmap checkout, the ShimuraCompactifications
  or HeightsRationalPointsAndObstructions packets, or the pinned declaration index; the remaining names
  are this roadmap's own API and Check names. Every Lean declaration and every name of the closing comment
  appears in the README.
- Duplication sweep (current TauCetiRoadmap, current Tau Ceti a91d3aaf, pinned Tau Ceti and Mathlib): no
  target is already there. Partial overlaps only: Mathlib's Hermite theorem (cited), the double centralizer
  theorem (cited), the elliptic Tate module in current Tau Ceti (cited through ArithmeticGaloisRepresentations).
- Locators: the Faltings 1983 labels and pages were re-checked against the GDZ per-page OCR (every Satz,
  Lemma, Korollar, Bemerkung and Definition cited is on the page given). Milne (AV v2.00), Deligne (Bourbaki
  616), Kleiman and Yu locators were read in the fetched PDFs (hashes below).
- A Sonnet whole-file proofread (cross-references, process language, verbatim source language, Checks per
  definition, conventions) was run; its findings were applied before submission.

## Supplier decisions (where the package departs from the plan's requests)

The plan's requests were split item by item and checked against the lower-tier packages
(scratch mapping, Sonnet). Exact targets are cited in the README's *Exact supplier contracts*. Changes:

1. **Faltings' Lemma 1** (extension of homomorphisms of semiabelian schemes over a normal base) is
   `ShimuraCompactifications:C4/roadmap/homomorphism-extension` (tier 15, Faltings–Chai I.2.7). The package
   imports it and keeps only the consequence "uniqueness of semiabelian models" (R28.1.2). This also gives
   "the semiabelian model is the identity component of the Néron model", which no lower package states.
2. **`M̄_g` over `ℤ`** (plan gap "no supplier"): SchemeAndStackFoundations SF.4 T400
   `SF.4/stable-curve-stack-algebraic` (proper DM stack over `ℤ`), T402 level covers.
3. **Zariski's main theorem** (plan gap): the pinned Mathlib has
   `AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite`; the remaining step (finite birational onto
   normal is an isomorphism) is a routine step through `Scheme.Hom.normalization` in R28.1.2.
4. **Baily–Borel and the Hodge power**: ShimuraVarieties V2 does not state the Hodge-line ampleness; cited
   instead are ShimuraCompactifications C5 (`minimal-hodge-ampleness`, `integral-minimal-space`,
   `integral-toroidal-space`) with PELModuli M6.9 and ShimuraVarieties §2.7/§8.18. C2 assumes no universal
   family, so the semiabelian extension over the toroidal model comes from C5.
5. **DM stacks**: AlgebraicModuliForArithmeticGeometry R09.4 is gerbes and bands in its package; DM-stack
   closures and normalisations are its §5.4 (`DMSchematicClosure.stack`, `DMNormalization.stack`).
6. **Tate–Sen / Hodge–Tate / Tate Prop. 12 / Raynaud**: FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.18,
   R07.1.19, R07.1.21, R07.1.33 and R07.1.17(ii) (the comparison `v(𝔇) = length ω`, recorded as unread in
   the plan, is stated there). The `C`-triviality of finite-image representations is PadicHodgeTheory R06.2,
   not R06.1.
7. **Trace criterion**: ArithmeticGaloisRepresentations §1.8 `Representation.brauerNesbitt_trace` and §5.3
   (lower tier), replacing the plan's citation of MordellLawrenceVenkatesh LV.1.
8. **Kronecker–Weber, Chebotarev, cyclotomic ramification, wild different bound, dual isogeny, elliptic Tate
   modules, Jacobians**: the TauCetiRoadmap layers named in the README (ClassFieldTheory 13, Chebotarev 10,
   GlobalNumberFields 10, NumberFieldArithmetic 6.4 / LocalFieldsRamification 3, EllipticCurves 1/2/4,
   JacobianChallenge D/E).
9. **ArakelovGeometryAndAbelianHeights** (tier 16) has no plan yet. The package cites R35.1–R35.4 as layer
   contracts (their stage texts cover them) and states Faltings' normalisation itself (R28.1.5, R28.2.1).
   The exact contract items are listed in the README; the Arakelov plan must state them.

## Targets planned here that the plan did not have as nodes (moved down or with no lower owner)

- R28.5.1 `finite_weilPolynomials` and R28.5.2 `frobeniusTestSet`: cited in the plan from
  MordellLawrenceVenkatesh LV.1, which is outside the 94 and cannot be cited; no lower-tier package states
  them (EllipticCurveModularityImaginaryQuadratic requests the test set from ArithmeticGaloisRepresentations
  R01.5, which does not have it). Sources: Deligne 616 Théorème 3.1, Milne IV Lemma 3.8, Faltings §6.
  **Move recorded:** MordellLawrenceVenkatesh LV.1 §§1.1–1.2 can import these.
- R28.3.5 `Polarization.kernelPairing`, `Polarization.descend`, `Polarization.prod`: descent of polarizations
  along isotropic subgroups (Milne I 13.8–13.9, Mumford §23). AbelianSchemesAndArithmeticModuli has only the
  line-bundle descent with a level structure (A3.6) and the pull-back degree formula (A6.13).
- R28.5.12 `zarhinTrick`, `finite_directFactors` (Milne I 13.11–13.12, 15.2–15.3): plan gap; no lower owner.
- R28.5.9 `finite_stableLattices`: the plan's "local Jordan–Zassenhaus" gap now has a proof route with free
  locators (Yu, arXiv:1105.2897, Theorem 1.1 and Theorem 4.8(2), after Reiner) and the trace-dual argument
  for maximal orders containing a given order.
- R28.5.14 `rationalTorelli`: plan gap; Milne AV III Theorem 12.1, Corollary 12.2 and §13 (proof).
- R28.6.1 `ellipticBridge`: plan gap ("no bridge from Weierstrass curves to abelian varieties"); assembled
  from ArithmeticGaloisRepresentations §6.1 (`tateModule_weierstrass_comparison`), AbelianSchemes A0.2/A1.6/A6.1
  and NeronModels §6.5; the Hom-group isomorphism with degrees is stated here.
- R28.6.7 `commutant_almostAll`: the plan had no proof source; Deligne 616 Théorème 2.7 (p. 39) states it with
  the method, and the README gives the mod-`l` Zarhin route.
- R28.1.2 is reduced to the uniqueness of semiabelian models (Lemma 1 itself is ShimuraCompactifications').
- R28.6.8 (Bemerkung 1, Siegel) is kept as a remark with no theorem; Siegel's theorem is
  HeightsRationalPointsAndObstructions RP.4's.

## Corrections to the plan (packets unchanged; for the plan's next revision)

1. `R28.4/quaternion-construction…`: the statement calls `v` left multiplication but prints the matrix of
   right multiplication (Milne's matrix in I 13.12); the API item says right. The README uses right
   multiplication with Milne's matrix; only `v vᵀ = N·1` matters.
2. `R28.6/semisimplicity-of-the-rational-tate-module-of-an-elliptic-curve`, acceptance 2: for `y² = x³ − x`
   over `ℚ(i)`, `V_l(E)` is a sum of two characters only for `l ≡ 1 (mod 4)`; for `l ≡ 3 (mod 4)` it is
   irreducible over `ℚ_l`. Corrected in R28.6.2.
3. `R28.5/finiteness-of-curves…`, acceptance 3 cites "Milne IV Exercise 4.4" for genus one; the exercise
   (p. 145) concerns dropping `g ≥ 2` with a genus-zero hint. The README check now gives both the conic and
   the genus-one torsor.
4. The plan's requests to ShimuraVarieties V2, ShimuraCompactifications C2, AlgebraicModuli R09.4, R09.5,
   PadicHodgeTheory R06.1 and NeronModels R11.1 should be re-pointed as in *Supplier decisions* 1–6.
5. Plan gaps closed: wild different bound (TauCetiRoadmap NumberFieldArithmetic 6.4 states it; not landed in
   the library), `M̄_g`, Zariski's main theorem, SGA 7 orthogonality (NeronModels §3.6 `Orthogonality` /
   `FiniteFlatOrthogonality`, `l` equal to the residue characteristic through the finite flat form), class
   field theory over `ℚ` (R28.5.6 with Kronecker–Weber and Mathlib's cyclotomic ramification indices),
   Torelli, local Jordan–Zassenhaus, the Weierstrass bridge, Zarhin's trick, Bemerkung 2.
6. The source record says the GDZ scan of Faltings 1983 has no text layer; GDZ serves per-page OCR
   (`https://gdz.sub.uni-goettingen.de/gdzocr/PPN356556735_0073/…`), which was used to re-check labels.

## Requests left for lower-tier owners (statements this package states or uses that their plans lack)

- AbelianSchemesAndArithmeticModuli: the polarization descent of R28.3.5 (Milne I 13.8, Mumford §23),
  Zarhin's trick and the finiteness of direct factors (R28.5.12), a quasi-inverse `ψ ∘ φ = [deg φ]` for an
  isogeny between different varieties, and the product polarization with its degree.
- NeronModelsAndSemistableAbelianVarieties: the number-field forms of Néron–Ogg–Shafarevich ("unramified
  outside `S` and the places above `l`"), and "good reduction ⇔ potentially good reduction" for semistable
  abelian varieties (used in R28.1.10).
- ArakelovGeometryAndAbelianHeights: R35.1–R35.4 as listed in the README contracts (degree in Faltings'
  normalisation, the positive Hodge product with the corrected factor `2^{−g} i^{g²}`, base-change invariance,
  the integral and archimedean halves of Lemma 5).
- ArithmeticGaloisRepresentations: R28.5.2 now states the Frobenius test set; EllipticCurveModularityImaginaryQuadratic's
  request to R01.5 for it can be pointed here or answered there.
- SchemeAndStackFoundations / AlgebraicModuliForArithmeticGeometry: no valuative criterion for DM stacks is
  stated anywhere; R28.1.4 routes the lifting through finite scheme covers and Mathlib's scheme criterion.

## Adversarial mathematics pass

| Statement | Instances tried | Result |
| --- | --- | --- |
| Hodge product `2^{−g} i^{g²} ∫ α ∧ ᾱ` | `g = 1` (`Im τ`), `g = 2` (`E_1 × E_2`) | printed `(i/2)^g` negative at `g = 2`; corrected factor positive (Conventions witness, R28.1.1 checks) |
| Degree weights `ε_v` | `K = ℚ(i)`, `P = R`, `p = 1` vs `p = 2` | weight 2 gives `0` both times; weight 1 gives `log 2` (R28.1.5 check); `fracIdealDegree_smul` pins it in Lean |
| Lemma 5 sign | `φ = [n]` | `h(A) = h(A) + g log n − g log n`; opposite sign fails |
| Bemerkung bounds | étale kernel of degree `p`, `μ_p`, `[p]` on `E` | `m`, `−m`, `0`: the factor `m` is needed |
| Determinant identity | `l` inert quadratic + supersingular; CM split | `2 = 2`, `1 = 1` |
| Erratum (b) | `T = ℤ_l²`, `V(H) = ℚ_l(1, l)`, `T(G) = ℤ_l(1, 0)` | defect of order `l` at `m = 0`, none for `m ≥ 1` (recomputed) |
| `−1` as four squares | `l = 2` (`a² = −7`), `l = 3`; over `ℚ` | holds `l`-adically; impossible over `ℚ` (Lean example) |
| Quaternion identity | `(2, 3, 5, 7)` | `87·1` (Lean example) |
| Polarization degrees | `n·λ_E`, `H = E[n]`, `m = p²` with `H = E[p]` | isotropy needed; `B[p]` isotropic by `e(x, py') = e(px, y')` |
| Weil polynomials | `n = 2`, `r = √2`; `X^n − 1` over all `n` | six polynomials; fixed degree needed |
| Hermite–Minkowski | `ℚ(√2)/ℚ` at `2` | `v(𝔇) = 3 = e − 1 + v(e)` |
| Mod-`l` characters | `l ≡ 3, 1 (mod 4)`, `l = 2` | quadratic character is `χ_0^{(l−1)/2}`, odd/even as stated; empty at `l = 2` |
| Raynaud | `K = ℚ`, `G = μ_l`; étale `G` | `χ = χ_0`, `d = 1`; `d = 0` |
| Satz 5/6 examples | curves over `ℚ` good outside `11`, outside `2` | an earlier draft claimed the class of `11a1` is the only one outside `11` (false: conductor 121 curves); replaced by Ogg's 24 curves outside `2` |
| CM elliptic `V_l` | `y² = x³ − x`, `l` split / inert | sum of characters only for split `l` (plan correction 2) |
| Torelli | genus `0` and `1` over non-closed fields | `g ≥ 2` needed |

## Sources read (public)

- Faltings 1983, GDZ scan LOG_0026, sha256 `f72a869f4a050e6e4a435cc790f4ac2e47b61fcac35d564041b5f43d89c2f87a`
  (printed page = PDF page + 347), with the GDZ per-page OCR.
- Deligne, Bourbaki exposé 616 (Numdam), sha256 `b0865c63f3c65e768c388e5d575a1395ab401c0edaf45a49305679fb16c73a77`.
- Milne, *Abelian varieties* v2.00, sha256 `f5ca4e63e5092a4b102daad1470e4cbed5fe8f82115e3a28c8881e3f67f6aaef`.
- Kleiman, *The Picard scheme*, arXiv:math/0504020v1, sha256 `cc14e62f0ebebb8617777651bbcd08bb7548cb9fe955f3a25bb6491c5f3beeaa`.
- Yu, *On the existence of maximal orders*, arXiv:1105.2897, sha256 `1e54bd7918be36710e5220ae415f7408644d44d55010e0edd4b3bacea9f3b610`.
- The Faltings 1984 erratum was not re-fetched (Springer returned a page, not the PDF); its content is
  taken from the plan's reviewed reading.

No cleared private source was used.
