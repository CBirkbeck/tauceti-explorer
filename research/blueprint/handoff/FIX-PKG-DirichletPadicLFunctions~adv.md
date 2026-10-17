# Completed repair: DirichletPadicLFunctions

Issue [#10181](https://github.com/CBirkbeck/tauceti-explorer/issues/10181), job
`FIX-PKG-DirichletPadicLFunctions~adv`; Claude (Opus), session `claude-VzkvWU`,
17 October 2026. The bot confirmed the claim at 13:55 UTC. This is a completed
package repair, not a checkpoint. No second job was claimed.

Only the package README, `Suggested.lean`, `review.json` and this handoff change.
`metadata.toml` and the six input packets are unchanged. The package's mathematical
contracts remain proposed work: neither the case analysis below nor the elaboration
of the signatures claims that any of this mathematics has been formalized.

## Findings of the adversarial review

The adversarial review (`research/blueprint/reviews/REV-PKG-DirichletPadicLFunctions~adv.md`,
issue #10142) accepted the package and applied its six corrections in its own
submission. Each was re-checked in the current files.

| Finding | State in the files | Change in this job |
|---|---|---|
| GL₁ finite-unit inversion (§0.5) | Check with the quartic character modulo 5 and `χ(2)=i`; Lean example `(Complex.I)⁻¹ = -Complex.I` | none |
| Complex logarithm sign witness (§3.4) | README value `π/(3√3)`; Lean example proved without a placeholder | none |
| Weighted trivial-group quotient (§4.7) | `S={2}` gives `Z/3`; adding 3 gives the relator `8[0]` and `3·3−8=1`; Lean examples present | none |
| Native cohomology reuse (§4.12) | Tau Ceti `H0IsoNormQuotient`, `HNegOneIsoNormKernelQuotient` and Mathlib `groupCohomologyIsoOdd` cited; the three renamed parity targets in README and in the Lean closing comment | none |
| Eisenstein parity (§5.3) | "For even `k≥4`" as standing hypothesis; Lean example `bernoulli 5 = 0` with `σ₄(1)=1` | none |
| Sources (Morita, Robert, Kubert) | Yasuo Morita; Morita §2 and Theorem 2; Kubert Proposition 3.3 and Lemma 3.4, pp.189–191 | none |

## The manager's de-cycling directive (2026-10-17)

ColemanIntegration consumes this package's Layer 3, so it must not also supply it.
The only thing taken from it was the Iwasawa branch of the p-adic logarithm, with
its local series law, finite product and norm law, and the exponential inverse on
small principal units. Current Tau Ceti has the series on `U(K,1)` of finite
extensions (`TauCeti.NumberTheory.LocalField.Logarithm`) and the exp/log inverse on
deep units (`…LocalField.ExpLog`, `…LocalField.Exponential`). It does not have the
addition law of the series (the ExpLog module says so) or the branch on all
nonzero elements. The logarithm is therefore constructed in this package.

| Supplier mention | Change |
|---|---|
| Scope: "General logarithm branches, Frobenius traces and Coleman primitives belong to ColemanIntegration, in the same bundle." | Replaced: the Iwasawa branch is constructed in §0.6; general branches, Coleman integration and polylogarithms are developed downstream in ColemanIntegration, which supplies nothing here. |
| Inputs bullet: "The global Iwasawa logarithm still comes from ColemanIntegration." | Replaced by a pointer to §0.6; the bullet now also lists Tau Ceti's exponential inverse on deep units. |
| Heading "From LocallyAnalyticDistributions and ColemanIntegration" and its ColemanIntegration paragraph | Heading is now "From LocallyAnalyticDistributions". The paragraph is replaced by the local series law `log(b(1+z))=log b+Σ…` as a consequence of §0.6. |
| Layer 3 Dependencies: "ColemanIntegration's logarithm and finite norm law" | "the Iwasawa logarithm of §0.6 with its finite product and norm laws" |
| Layer 4 Dependencies: "ColemanIntegration for logarithm and exp/log" | "§0.6 for the Iwasawa logarithm and its exponential inverse on deep principal units" |
| §3.6: higher-weight formulas "consume ColemanIntegration's actual polylogarithms" | Reworded: these formulas are not targets here; the downstream roadmap ColemanIntegration proves them on top of the weight-one comparison. |
| Layer 1 Dependencies: "no … Coleman primitive" | "no … logarithmic primitive" (wording only) |
| Downstream consumers | ColemanIntegration is described as the later roadmap of the bundle that consumes this one; its branch with value 0 at p is the Iwasawa logarithm of §0.6. |

There is no `*Needs:*` line and no Conventions bullet naming ColemanIntegration in
this README. The Conventions sentence on the scalar logarithm now points to §0.6.
The remaining occurrences of "Coleman" are the downstream mentions, and the
citation of R. F. Coleman's 1982 paper as a source.

**New Layer 0 subsection §0.6 "The Iwasawa logarithm".** The layer title, the
Summary, "How to read the build", Layer 0 Examples and Layer 0 Dependencies were
updated to match. The subsection contains:
- ultrametric convergence of Tau Ceti's pinned `NormedSpace.logOneAdd`. Its radius
  theorem assumes `ContinuousSMul ℚ≥0`, which fails p-adically.
- the addition law, proved by a multinomial regrouping argument.
- the decomposition hypothesis `HasIwasawaDecomposition`, proved for finite
  extensions and for ℂ_p from Mathlib's spectral-norm theorems.
- existence and uniqueness of `IsIwasawaLog`.
- `map_one`, `map_pow`, `map_inv`, `eq_zero_of_pow_eq_one`, `map_neg` and `map_prod`.
- the branch comparison `ℓ=log_p+ℓ(p)·v_p`, which §3.5 now cites.
- equivariance under isometric ℚ_p-algebra maps and continuous automorphisms of
  ℂ_p, and values of `iwasawaLog` on finite subfields.
- the norm–trace law.
- the exponential inverse on `m_K^i` for `e<(p−1)i`, from current Tau Ceti.

The subsection has seven Checks.

The `Suggested.lean` changes are these:
- import `TauCeti.Analysis.Normed.Algebra.LogOneAdd.Basic`, which is compiled in the
  pinned build.
- two light definitions, `HasIwasawaDecomposition` and `IsIwasawaLog`.
- eleven target theorems.
- six API theorems with complete proofs: `map_one`, `map_pow`, `map_inv`,
  `eq_zero_of_pow_eq_one`, `map_neg` and `map_prod`.
- nine examples. Five have complete proofs: `p^k`, `63` versus `7` in ℚ₃, `−1` in
  ℚ₂, the conjugates `1±3i`, and the value-one branch control. Four are numerical
  witnesses left as placeholders.
- `iwasawaLog`, `localIwasawaLog`, `localIwasawaLog_norm_eq_trace` and
  `localIwasawaLog_exp` added to the closing list of README targets.

## Adversarial pass on the touched statements

| Statement | Instances tried | Result |
|---|---|---|
| `hasSum_logOneAdd_of_norm_lt_one` | z=0; p=2, z=−2 (`‖z‖=1/2`); odd p, z=p−1 (excluded, norm 1) | Term bound `n‖z‖^n` from `‖(n:E)‖=|n|_p≥1/n`. At z=−2 in ℚ₂ the sum is `−Σ2^n/n`, which must be 0; that is a Check. At norm 1 the terms do not tend to 0. |
| `logOneAdd_add_mul_of_norm_lt_one` | z=w=0; w=−z/(1+z); p=2, z=w=−2 | `‖z+w+zw‖<1` by the ultrametric inequality. z=w=−2 gives `2log(−1)=log 1=0`, consistent with the Check. |
| `HasIwasawaDecomposition` | ℚ_p (N=1 or p−1); ℚ₂, x=3 (N=1, m=0); ℚ₃, x=2 (N=2, m=0); Gauss-norm completion of ℚ_p(T) | It holds for finite extensions and ℂ_p. It fails for the Gauss norm, where the residue of T is transcendental; a Check records this. |
| `existsUnique_isIwasawaLog` | E=ℚ_p, p=2 and p=3; E=ℂ_p; Gauss-norm field (hypothesis fails; uniqueness genuinely fails, since a homomorphism may send T anywhere) | Completeness is needed for the series. The decomposition is needed for uniqueness. Characteristic zero is used to divide by N. |
| `map_pow`, `map_inv`, `map_prod` | n=0; empty product; x=−1 | Proved in Lean. n=0 and the empty product reduce to `L(1)=0`, from the series at 0. |
| `eq_zero_of_pow_eq_one` | n=0 (excluded); ζ=−1; ℚ₃, ζ of order 2 | Proved in Lean. The control `2^0=1` against `log_3 2≠0` shows that `n>0` is needed. |
| `map_neg` | x=0 (junk value); p=2 where −1 lies in the disc | Proved in Lean, for every p and with no disc hypothesis. |
| `natCast_mul_eq_of_map_mul` | n=0 (forces m=0, trivial); x=p, N=1, m=1; ℓ=L | Pure algebra from multiplicativity, `ℓ(1)=0` and agreement on the disc. It is true for any multiplicative ℓ. p is prime, so `(p:E)≠0`. |
| `map_algHom` | σ=id; non-isometric σ (excluded by hypothesis); a non-complete source | **Changed during the pass:** completeness of the source was added (Lean and README). Without it the series in the source may not converge, and its junk value 0 would not match the target. |
| `map_padicComplex_ringEquiv` | discontinuous automorphisms (exist under choice; excluded); complex conjugation analogue | Continuity gives ℚ_p-linearity and preservation of `PadicAlgCl`. Uniqueness of the extended norm and density give the isometry. |
| `mem_intermediateField` | x=0; F=ℚ_p; F=ℚ₃(i), x=1+3i | Admissible pairs exist inside F. F is complete, hence closed in ℂ_p. |
| `localIwasawaLog_norm_eq_trace` (README) | ℚ₃(i)/ℚ₃, x=1+3i; F'=F | The norm is 10 and `log(1+3i)+log(1−3i)=log 10`. For F'=F both sides are equal. Characteristic zero makes the extension separable. |
| exp/log on deep units (README) | ℚ_p, i=1 at odd p and i=2 at p=2; ℚ₂, i=1 (excluded) | At p=2, `v(log 3)=2≠v(2)=1`, so depth 1 fails, as the depth condition predicts. γ=5 at p=2 has `‖log 5‖=1/4`. |

## Sources

- Rodrigues Jacinto–Williams (published, free). Theorem 6.1(ii) is printed p.149
  (PDF p.50). The identity `log_p(x)=log_p(−x)` is in its proof, printed p.153.
- Furusho, arXiv:math/0304085v2, §2.1, p.7 (free). It characterizes the branches
  by their value at p.
- Coleman, Invent. Math. 69 (1982), §I, p.171 (GDZ scan, free). It names the
  Iwasawa logarithm as an example of a branch.
- Washington, *Introduction to Cyclotomic Fields*, §5.1, Proposition 5.4. This is
  cited for the classical statement but is not freely available and not in the
  cleared library, so its page was not checked. arXiv:2410.20934, §2.1, cites the same
  proposition number for this result. The proof route in §0.6 is complete without
  the book.
- The Tau Ceti declarations were read in the current library (a91d3aa); the pinned
  `NormedSpace.logOneAdd` was read at f790474.
- The Mathlib spectral-norm theorems were read at 082e2d3.

## Notes for other jobs

- **ColemanIntegration** (sibling fix #10180) keeps its own L0.15 branches, as its
  directive says. Its L0.10, L0.13, L0.14 and L0.18 overlap §0.6 here: the series
  convergence, the addition law, the decomposition, and the Iwasawa branch with
  its equivariance. A later revision of ColemanIntegration could import those from
  DirichletPadicLFunctions §0.6, keeping only the general branches
  `log_a=log_p+a·v_p`. This job does not edit ColemanIntegration.
- Owner moved down: the Iwasawa logarithm (and the addition law of the series) is
  now owned by DirichletPadicLFunctions Layer 0, the earlier roadmap of the bundle.

## Checks run

- `lean-check research/blueprint/packages/DirichletPadicLFunctions/Suggested.lean`
  at Mathlib 082e2d3 / Tau Ceti f790474: exit 0. There are 70
  declaration-uses-placeholder warnings and no other messages; the file had 55
  before.
- A scratch `run_cmd` audit over all 65 constants in the namespace found no
  placeholder in any statement type or definition body.
- `scripts/check_sorry_data.py` passes.
- `research/blueprint/intake.py check-files` on the changed files reports
  0 problems.
- `git diff --check` is clean.
