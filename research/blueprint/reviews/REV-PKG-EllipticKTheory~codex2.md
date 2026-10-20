# Review: K-theory of curves and elliptic curves (package, round 2)

Issue: #11373 (`REV-PKG-EllipticKTheory~codex2`). Reviewer: Claude (Opus), session
`claude-fvq9XX`. Date: 2026-10-20. **Verdict: accepted**, with the fixes below applied in place.

This report is also the handoff note. The issue allows only the package files, `review.json` and
this report, so no separate handoff file was written. No packet was edited.

## Inputs read

I read WORKERS.md, PACKAGE_REVIEW.md, PROTOCOL §§5, 12–13, 15 and 20, and UPSTREAM_GUIDE.md, then the
package in full: README (2,293 lines before review), Suggested.lean and metadata.toml. I also read
the previous independent review `REV-PKG-EllipticKTheory~adv`, which was needs_changes with one
finding, and the fix handoff `FIX-PKG-EllipticKTheory~adv`. The fix worker's self-marked
`accepted` does not count. The issue names a report `REV-PKG-EllipticKTheory~codex.md`, which does
not exist; the previous review on record is `~adv`.

Every supplier citation was checked against the supplier's own README:
- the atlas packages under `research/blueprint/packages/`;
- current TauCetiRoadmap main through the GitHub API for SchemeAndStackFoundations,
  EtaleCohomologyFoundations, JacobianChallenge, ModularCurves, EllipticCurves and
  ProfiniteCohomology;
- the PR #1212 branch for GeneralAlgebraicKTheory;
- the read-only checkout for AlgebraicCurves and StableReduction.

The global supplier order used is the maintainer's `ORDER.txt` (the decycling order).

## The previous finding (§7.7, Bloch's normalisation): closed

I read Bloch, *Algebraic K-theory and zeta functions of elliptic curves*, ICM Helsinki 1978,
vol. 2, printed p. 514 (PDF page 10 of the official IMU volume; SHA-256
`dc99c9009cff631d280a09b1da07d9762e7aa3803b4502f19ff59e5e28db55d5`, accessed 2026-10-20). What it
does:
- It works over a field of characteristic zero, with the `N`-torsion points rational.
- It corrects the `N`-th multiple of `{f, g}` by symbols whose first entry is a function and
  whose second entry is a constant, and lands in the kernel of the tame map.
- It specialises to `ρ`, with a simple pole at each nonzero `N`-torsion point and a zero of order
  `N² − 1` at the origin, and to `f_x`, with divisor `N(x) − N(0)`.
- It does not divide by `N`. It notes only that the regulator ignores symbols with a constant
  entry.

All of this matches the README:
- the divisors of §§7.5–7.6;
- the function-first correction;
- the comparison `C · blochClass a = π_C(S_a^ICM)`;
- the statement that the quotient by constants and torsion, and the positive-characteristic
  extension, are this roadmap's own argument.

The orientation remark is correct: inverting all tame values does not change the kernel. The
finding is closed as the fix claimed.

## Findings fixed in place

| # | Finding | Fix |
|---|---|---|
| 1 | **Upward ask / cycle.** Scope and Downstream consumers said MotivicEtaleKTheory and K2SymbolsBrauer consume §5.5. Both are suppliers of this roadmap: their packages list it only as a consumer, and K2SymbolsBrauer is at position 30 of the supplier order. | Removed both claims. The Scope paragraph now names, as a boundary, MotivicEtaleKTheory §3.4's neighbouring inputs to Tate's theorem: reciprocity for completions and finiteness of an affine tame kernel. |
| 2 | **Missing supplier.** Finite generation of `K_n` of curves over finite fields was attributed to ArithmeticKTheory "N.3". That package explicitly excludes curves over finite fields. Its §3.2 has Quillen's criterion for Dedekind domains, but verifies the Steinberg-homology input only for number rings. | Added the owned target `curveFiniteGeneration` to §5.5. It covers the affine curve and the projective curve, the latter via one localisation sequence. Its route is ArithmeticKTheory §3.2's criterion plus finiteness of `Pic(R)` (argued) and the function-field Steinberg-homology input (Grayson after Quillen, via Harder's reduction theory). Sources: K-book Theorem IV.6.9 and the paragraph before it, p. 325 (checked), and its use in the proof of VI.6.1, p. 502 (checked). `tameKernel_finite`, `harder`, the Scope, the contracts, the dependencies, the References (Grayson 1982) and the Lean closing list were updated. |
| 3 | **Stale stage ids.** Every citation of K2SymbolsBrauer T.2–T.5, KTheoryLowDegrees U.3/U.4/Z.5/Z.6, ArithmeticKTheory N.1–N.3 and MotivicEtaleKTheory M.4–M.7 used old atlas stage labels that do not exist in those packages. | Each was repointed to the section that states the claimed content (map below). The checker grep for the old labels is now empty. |
| 4 | **Wrong section or claim.** KTheoryFiniteLocalFields §1.7/§1.8/§1.9 did not hold the claimed content. Quillen's `K_*(F_q)` is GeneralAlgebraicKTheory §13.8c in its port, consumed by KTheoryFiniteLocalFields Layer 1; restriction and transfer are §1.5 and `F̄_p` is §1.6. K3BlochGroups §2.2 proves injectivity, not "kernel killed by two". The `K_0 = Chow.K0` identification is SchemeKTheoryOperations §2.5, not §7.2. ProfiniteCohomology does not state `H¹(Ẑ, M) = M/(F − 1)M`. | All corrected. The Ẑ formula now comes from SelmerIwasawaCohomology §2.7, with compact-coefficient Hochschild–Serre from ArithmeticGaloisDuality Layer D7 and the `α ↦ q/α` pairing from DeligneWeightsAndPurity DWP.0 §0.2(iii). WeightsInEtaleCohomology R34.2 is stated for arithmetic Frobenius on `T_ℓE`. |
| 5 | **Tau Ceti layer labels.** ModularCurves "2D: `[m]^* = [m]`" is not stated there; rank of the kernel is in 2C, not 2B. AlgebraicCurves' anti-equivalence is in 12A–12C, not 12B. JacobianChallenge A states `Cl ≅ Pic` on smooth curves, not for noetherian schemes with DVR stalks, and B does not state `H⁰(O) = F`. StableReduction "first kind" is Layers 4–5. | `[m]^* = m` is derived from 2D's Picard duality with `[m]^∨ = [m]` (EllipticCurves Layer 1). The other labels and hypotheses are corrected, with the noetherian form attributed to the current Tau Ceti `classGroupAddEquivLineBundleClass`. |
| 6 | **Duplicates of suppliers.** §§2.1/2.6 re-proved KTheoryLowDegrees §12.2's rank–determinant ring isomorphism and class formulas. §§3.1/3.3/3.6 re-derived SchemeKTheoryOperations §3.7's one-dimensional localisation sequence, its divisor boundary and its finite-pushforward compatibility. §5.4 restated §5.5's projective line. | Each now consumes the supplier and keeps only its curve- or elliptic-specific content: the elliptic coordinate product, naturality along finite maps, degrees 0–3 with the terms identified, the residue component and degree-two norm formula, and `projectiveLine_finiteField` with `elliptic_K0_generated_iff`. |
| 7 | **Newer Tau Ceti roadmaps.** Current upstream SchemeAndStackFoundations (merged after the checkout the previous review used) owns the Weil bound for curves over `F_q` (§5.11) and regularity of smooth schemes (§4.13). JacobianChallenge Layer D owns the Picard obstruction sequence. | §5.5 cites SchemeAndStackFoundations §5.11 for the curve Weil bound, §1.3 cites §4.13, and §2.5 is stated as the `T = Spec F` case of Layer D. Nothing upstream supplies a target of this roadmap outright, so nothing was removed. |
| 8 | **Generality** (maintainer rule 2026-10-19). Layer 6's model theory was limited to number fields with no reason given. | §6.1 states that the existence, minimality, uniqueness and localisation results of §§6.2–6.7 need only an excellent Dedekind base with torsion class group, so they hold over S-integers of global function fields. The integral part (§§6.8–6.10) stays over number fields. |
| 9 | **Locator.** Scholl 1.1.2 is on p. 3, not p. 4. | Fixed. |

### Supplier map (old label → package section)

- **K2SymbolsBrauer**
  - T.2 → §§5.12, 6.16 (`K_2(F_q)=0`), §§7.2, 8.3 (Matsumoto), §8.2 (graded map), §10.33 (Bass–Tate).
  - T.3 → §§9.2–9.4 (tame symbol), §9.7 (ramification), §§10.21, 10.27, 11.6 (norm–residue),
    §9.13 (finite support), §§9.11, 9.15 (higher residues), §11.1 (DVR boundary).
  - T.4 → §§10.29–10.30.
  - T.5 → §12.11 (`K_2(ℚ)`), §12.1 (unramified subgroup).
- **KTheoryLowDegrees**: U.3 → §8.1; U.4 → §11.1; Z.5 → §12.2; Z.6 → §12.3.
- **ArithmeticKTheory**: N.1 → §1.1; N.2 → §§2.1, 2.4; N.3 → §§3.2–3.4, number rings only.
- **MotivicEtaleKTheory**: M.4 → §§4.1–4.4, 4.7; M.5d → §7.4; M.6 → §§8.6–8.7, 9.3; M.7 → §§10.1–10.3.

All mappings were produced as Sonnet lookups and then confirmed by me against the supplier
headings and text.

### Order and cycles

Suppliers in ORDER.txt:
- GeneralAlgebraicKTheory, StableHomotopyKTheory, SchemeKTheoryOperations, KTheoryLowDegrees,
  K2SymbolsBrauer;
- ArithmeticGaloisDuality, NeronModels, SelmerIwasawaCohomology;
- KTheoryFiniteLocalFields, DeligneWeightsAndPurity, EtaleDualityAndPerverseSheaves and
  WeightsInEtaleCohomology.

The Tau Ceti main roadmaps are also suppliers. K3BlochGroups, ArithmeticKTheory and
MotivicEtaleKTheory are not yet registered, but none of their packages cites this roadmap as a
supplier.

After the fixes no supplier edge points to a roadmap that consumes this one, so there is no cycle.
This roadmap is not in ORDER.txt and should be inserted after its last supplier
(WeightsInEtaleCohomology).

## Source checks

The random sample used `random.Random(11373).sample` on 55 locator groups. I excluded the 15
groups the previous review sampled and the Bloch page checked above. Every item was read in a
primary source:
- K-book (combined draft of 29 Aug 2013, SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`, printed `n` = PDF `n+8`);
- Stacks statements from the tag API;
- DGJK arXiv:2605.11100v1 (SHA-256 `93ca7e61d0b9897ed6a9b8eab968ef7f31856900e7cf7a400eb7ccbe7fe3361b`);
- DJZ arXiv:math/0405040v2 (`a9d5c2cce63f2351991789add5ac9cd213b9783b9cbb0e648313e314eadb3ccf`);
- Scholl `k1.pdf` (`7bffc95825735b551d93cf8074dba61d28131c3b6302bf855fd1f0e38349a9e6`).

All were accessed 2026-10-20.

| Locator | Result |
|---|---|
| DGJK §10 after Remark 10.3, Table 10.4, p. 31 | `i*_P α = 0`, `i*_Q α = {−1, 1+u}` match §8.1 |
| DJZ (3.1), p. 4 | Tame convention `(−1)^{ab} a^{ord b}/b^{ord a}` matches |
| Scholl 1.1.2 and Theorem 1.1.6(iii) | Content matches; 1.1.2 is on p. 3 (fixed) |
| Scholl Proposition 1.3.6, p. 9 | Local–global intersection via the localisation diagram matches |
| Stacks 53.2.6 (0BY1) | Equivalence with regular projective curves matches |
| Stacks 53.9.2 (0BYC) | Plane curve iff irreducible form matches |
| Stacks 55.8.5 (0CD9), 55.8.6 (0C2W) | Contraction sequence to a minimal model; existence matches |
| K-book Definition VI.1.7 | Tate twist convention matches |
| K-book Example III.6.7.1, p. 239 | `K_2(F_q(t))` as a sum of residue units supports §3.8 |
| K-book Example VI.6.3, p. 503 | e-invariant splitting matches |
| K-book II.8.5, p. 149; V.1.5, p. 369 | Projective bundle theorem with stated bases matches |
| K-book III.6.5.3, p. 236 | Weil reciprocity with norms for `F(t)` matches |
| K-book Proposition II.8.2.1, p. 146 | `SK_0 = 0`, `K_0 = H⁰(ℤ) ⊕ Pic` matches |
| K-book Remark III.6.3.1, p. 234 | `∂_w = ∂_v^e` matches; III.6.3's symbol is the inverse convention, as stated |
| K-book V.6.6, p. 409, via V.6.1.2 (p. 406) | `∂(s) = [R/sR]` for a domain matches |

I also checked the touched locators:
- K-book III.2.5.1, p. 195 (BMS for smooth affine curves over finite fields);
- IV.6.9, p. 325;
- VI.6.1 and its proof, p. 502;
- III.7.2(a), which states only Bass–Tate vanishing, so the README's correction of the K-book's
  VI.6 opening stands.

The previous review's fifteen are not repeated.

## Adversarial pass (touched statements, and new samples)

| Statement | Instances tried | Result |
|---|---|---|
| `curveFiniteGeneration` | `F_q[t]` (Pic 0, `K_n = K_n(F_q)`); `F_q[t,t⁻¹]` (`K_1 = F_q^× × ℤ`: finitely generated but not finite); `ℙ¹`; deleted points of degree > 1; `n = 0` | Holds; the finiteness of Pic and the `n = 0` case of the localisation step are now explicit |
| Merged Lean orientation example | `n = 0` (both 1), `n = 1` (`ū`, `ū⁻¹`), `n = 3` (`8`, `1/8` at residue 2), `n = −1` | Matches the convention; proved for all `n : ℤ` |
| `[m]^* = m` on `Pic⁰` | `φ^t = λ⁻¹ Pic⁰(φ) λ` with `[m]^∨ = [m]` | Holds; L_{[m]} `m`-torsion argument unchanged |
| `H^i(F, ℤ(j)) = 0`, `i > j`, rationally | flatness of ℚ | Holds |
| Weil bound from SchemeAndStackFoundations §5.11 | Base change to `F_{q^n}`; genus 0; smooth geometrically connected ⇒ geometrically irreducible | Covers all degrees needed by `closedPoints_coprimeDegrees` |
| Layer 6 over global-function-field S-integers | Lipman resolution (excellent), contraction over a DVR, finite bad set, torsion class group for principal opens | Arguments use only these; integral part left over number fields |
| `rankDet_ringEquiv` (elliptic) | `(1,0,O)` unit; `(0,1,O)² = 0`; line bundle times line bundle | Holds |
| `K0Elliptic.addEquiv` | `[O_E] = (1,0,O)`; skyscraper at `P` is `(0,1,P)` | Holds |
| `elliptic_K0_generated_iff` | `[O(−O)] = (1,−1,O)`; `37a1/𝔽₂` (`ℤ/5`); `y²+y=x³+x+1/𝔽₂` | Holds |
| `certificate_11a3` | Local parameter `x`, `y ≈ −x²` at `(0,0)` | Values `−1,−1,1,1` for both symbols confirmed |
| `normed_product_36a1` | `x₀ = −1+√−3`; `N(x₀) = 4` | Normed product 1, unnormed `−1−√−3` confirmed |
| `transfer_x3_minus_2x` | `y` a local parameter at `x² = 2`; `ord(x²−2) = 2` | `x₀/2` on both sides confirmed |
| §8.1 divisors and tame values (u = 4) | DGJK Prop 10.2 general-`u` divisors | All eight values match |
| §8.3 bad fibre (u = 1/3) | `ord_η v = 1`, `ord_η w = 0` | Vertical value `1/w` of infinite order confirmed |
| §5.11 orders | `37a1/𝔽₂`: 13, 41; `a = 2/𝔽₂`: 5, 25; `y²=x³−x/𝔽₃`: 28 | Confirmed |
| §1.1 point counts | `y²=x³−x/𝔽₅`: 8, `ℤ/4×ℤ/2`; `y²=x³/𝔽₅`: 6 vs 5 | Confirmed |
| §6.1 regularity checks | 37a1 at `(5,18)`: `F = 222`; 11a1 at `(5,5)`; `y²=x³−81x` at 3 | Confirmed |
| `card_twistedFrobeniusKernel` | `i = 0` excluded; separability of `1−[q^i]π`; `D_i ≡ 1 mod p` | Statement correct with `1 ≤ i`; `frobeniusTrace = q + 1 − #W(F)` at the pin |

## Suggested.lean

The file now has:
- `import Mathlib` plus five Tau Ceti modules;
- one module docstring and the `TauCetiRoadmap.EllipticKTheory` namespace;
- no `set_option`, `#eval`, `#print`, `lemma` or `True` placeholders, and no sorry'd data.

Changes:
- **Merged:** the two orientation examples for `tameValue` (order 1 and order 3) became one
  proved example for every order `n`. `tameValue` now has two examples: orientation and sign.
- **Removed:** the example about `Finsupp`-over-ℚ arithmetic, which tested no definition of the
  roadmap.
- **Removed:** the example that followed from the sorry'd `Hom.subsingleton`, which was an
  admitted example in effect.
- **Docstring:** the stale "K2SymbolsBrauer T.4" docstring citation is now §10.30.
- **Closing list:** updated, adding `curveFiniteGeneration` and `projectiveLine_finiteField`.

Checks run:
- `lean-check` exits 0 with exactly 14 `declaration uses sorry` warnings and nothing else; 435
  lines.
- `scripts/check_sorry_data.py` exits 0.

I checked the signatures against the README:
- `card_twistedFrobeniusKernel`, `tame_last_point` and `blochCorrection` (all its hypotheses
  traced; the reciprocity step at `O` uses only degree-one places);
- `Hom.subsingleton`: Mathlib's `ext_of_isDominant_of_isSeparated` needs only a dominant `ι`,
  and the flat generic fibre over a domain is dominant;
- `baseChange_mem_…`, `map_mem_…`;
- the `tameValue` API (Steinberg, swap, self, leading-unit formula) and the certificate API.

## Validation

- `intake.py check-files` on the four package files: 0 problems.
- `review.json` parses.
- README is 179,508 bytes, below 200 KB.
- `metadata.toml` is `topic = "math.KT"`.
- `git diff --check` is clean.
- No private paths are in the deliverables.
- No Tate's-thesis statement or locator appears.
- No language server or build was started; lean-check used the shared pinned build with more
  than 20 GB free.

## Delegation and untrusted text

Four Sonnet subagents made the mechanical citation-to-section lookups:
- K2SymbolsBrauer/KTheoryLowDegrees;
- MotivicEtaleKTheory/ArithmeticKTheory/DeligneWeightsAndPurity/WeightsInEtaleCohomology/
  ArithmeticGaloisDuality;
- the §-style suppliers;
- the Tau Ceti roadmaps.

I confirmed every item I acted on in the supplier text myself. No fetched page, paper or other
package contained instructions, and nothing suspicious was encountered.

## Residual notes for the maintainer

These do not block the draft PR.

- **Order registration.** Register EllipticKTheory in ORDER.txt after WeightsInEtaleCohomology.
  Place K3BlochGroups, ArithmeticKTheory and MotivicEtaleKTheory before it.
- **Overlap with MotivicEtaleKTheory §3.4.**
  - That section states function-field reciprocity for completions and finiteness of the affine
    tame kernel as its own extension targets, without a proof route.
  - This package proves the tame-symbol forms on the projective curve in §5.5, from BMS, the new
    finite-generation target and Bloch–Gabber–Kato.
  - MotivicEtaleKTheory is lower, and its route would need the same finite-generation input.
  - Recommendation: if a single owner is wanted, move `BMS_functionField`,
    `curveFiniteGeneration`, `reciprocitySequence_exact` and `tameKernel_finite` down, into
    MotivicEtaleKTheory §3.4 or an ArithmeticKTheory Part II for curves over finite fields, and
    cite them here.
- **Stale ids in other packages.** KTheoryLowDegrees cites "K2SymbolsBrauer T.1/T.6", and
  SpecialValuesBirchTate cites "KTheoryFiniteLocalFields L.1". The explorer copy of
  GeneralAlgebraicKTheory lacks the §§13.8a–13.8c that its port (TauCetiRoadmap PR #1212) and
  KTheoryFiniteLocalFields cite.
- **EtaleCohomologyFoundations §0.11** (upstream main) now supplies the algebraic curve trace.
  EtaleDualityAndPerverseSheaves §0.3, cited here for `H²(X̄, μ_n) ≅ ℤ/n`, may wish to defer to
  it.
