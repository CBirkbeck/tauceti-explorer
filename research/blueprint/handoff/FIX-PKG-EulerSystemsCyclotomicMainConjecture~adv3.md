# Fix: Euler systems and the unconditional cyclotomic main conjecture (reconciliation)

Refs #11323. Claude (Opus 5.5), session `claude-F3n5Wj`, 20 October 2026.
This is a completed package fix, not a checkpoint.

The issue names `research/blueprint/reviews/REV-PKG-EulerSystemsCyclotomicMainConjecture~adv.md`
as the findings. That file does not exist; as the ~adv handoff records, the
findings are the four obligations of
`research/blueprint/reviews/REV-PKG-EulerSystemsCyclotomicMainConjecture.md`.
The ~adv repair on main resolved them. The work of this job was the
reconciliation: main (with the ~adv repair, codex-lf8pwI) and the closed
branch `claude-bibFuI-pkg-escmc2` (PR #11056, job PKG-…~2) each closed the
same four obligations by a different route. This package contains both. The
diff of the branch against its merge-base `b74f6edfa` was re-applied by hand
onto main. Branch text was treated as data, and no instruction was found in it.

## Findings and where each now stands

| Finding (REV-PKG) | Main (~adv) | Branch (PKG~2) | Merged package |
|---|---|---|---|
| 1. Uniform circular-unit descent, §3.3 | Belliard's global-unit descent `circularUnit_descent_bounded`, the adapter `primitiveCircularLimit_eq`, and `sinnottCorrection_bounded` | Exact statements (a)–(d): Sinnott's ψ-components, semilocal control (exact when ψ(p)≠1), p-ramified control, and equal μ/λ totals, without global-unit descent | Both kept. (a)–(d) with steps 1–8 are the primary proof. Main's statement is (e), with steps 9–13; step 9 now derives the adapter from (a). Corrections are listed below. |
| 2. Odd-prime split lattices, §4.21 | Solomon/Mazur–Wiles lattice route with four named targets; it also gives equality | Greither's dyadic proof rerun at odd p | Main's route stays the proof. The branch's χ(p)≠1 argument is step 9, valid for every odd p. Its χ(p)=1 adaptation is step 10, restricted to Δ_p=1, with the reason (below). |
| 3. Exceptional nonvanishing, §4.18 | `gaussIdealProjection_ne_zero`, `minusTwoUnit_log_rational_injective`, `gaussLogProjection_ne_zero` (Baker–Brumer for units) | A direct argument from Baker–Brumer for algebraic numbers, parts (a) and (b) | Main's three targets kept. The branch's argument is step 8, which needs neither the minus condition nor complete splitting; §4.21 uses it at odd p. |
| 4. Conductor-one Coleman image, §§4.7–4.8 | `pureCyclotomic_coleman_transport` and `pureCyclotomic_smoothed_stickelberger` through the ColemanPowerSeries L4 normalisation | A smoothed-unit computation in Greither's own normalisation | Branch's proof is step 7, with its integrality argument corrected. Main's comparison targets are steps 8–12, an additional statement that the image does not depend on. |

Other branch changes and how they were taken:

| Branch change | Disposition |
|---|---|
| §3.4: apply §3.3 to the field cut out by χ, sum over all ψ, work over O′, new Check | Taken (main had not changed §3.4). Main's Needs entries that §3.4 no longer uses are needed in §3.3, where they remain. |
| §5.1 and the IntegralIwasawaTheory L0 contract: Sinnott Theorem 4.1, Proposition 5.1 and the tower theorem, cited directly, with §3.3(a) at n=0 | Taken, after checking the three statements on the scan. Sinnott's factor is [k_{q^e}:ℚ] with k_{q^e}=k∩ℚ(μ_{q^e}), q^e‖m. That is the largest subfield ramified only at q, as the branch said; the text now uses Sinnott's notation. The contract no longer asks the supplier to prove the correction is a p-adic unit, because §5.1 proves it. |
| Dirichlet L2 (characters trivial on Gal(F/ℚ)) and L3 (every p, Ferrero–Greenberg and Gross–Koblitz at every p, nonvanishing not requested) | Taken, merged with main's L2 wording. |
| ColemanPowerSeries L4 contract: the m=1 comparison is not needed | Merged. Main's text, that the comparison is owned in §4.7, is kept, together with the branch's sentence that the image itself is proved in step 7. |
| IntegralIwasawaTheory L2 contract | Main's wording kept: it names the discrete-limit duality control that main's §4.21 route consumes. |
| New IntegralIwasawaTheory L4 bullet (Leopoldt, Ferrero–Washington, Baker–Brumer) | Taken, beside main's `baker-brumer-independence` bullet. A separate bullet now covers `baker-brumer-algebraic-numbers`. |
| ClassFieldTheory Layer 12 extended by the p-ramified sequence and by local reciprocity | The sequence was added to Layer 12. Local reciprocity is Tau Ceti ClassFieldTheory Layer 6 (`localArtinEquiv`) and Layer 7 (`artinMap_norm`, units into inertia), not Layer 12, so it has its own bullet. §3.3 cites those layers. |
| Mathlib Hilbert 90 | Taken; `groupCohomology.exists_div_of_norm_eq_one` was read at Mathlib 082e2d3. |
| References: Sinnott and Solomon locators and page offsets | Merged into main's entries. The offsets (+179 and +465) were checked on the scans. |
| Branch's §4.18 "See" line, which restored GROSS-1981 §4 | Not restored. Main removed that unverified locator, and the job forbids restoring ~adv removals. |
| Branch's Suggested.lean, which deleted six admitted examples | Main had turned them into named theorems. All six are now proved instead, which keeps main's names and the branch's rule. The branch's proof of `chiSum_regular_sign_test` is used, with `classical` in place of an added `DecidableEq` hypothesis. |

## Corrections made while merging

- **§3.3, step 2.** The branch says U^ψ_n is free over O′. It can have nonzero
  finite torsion from the p-power roots of unity of the completions. For
  example, at L=ℚ(√6) and p=3 the completion is ℚ₃(√−3)∋μ₃ and the
  nontrivial ψ-part contains μ₃. The text now says O′-rank p^n. The argument
  only needs finiteness of U/E.
- **§3.3(b), ψ(p)=1.** Sharpened from a two-sided bound to an exact formula.
  On U^ψ_0≅U^1(ℚ_p)⊗O′ the reciprocity map ρ_0 is injective, so N_0=0. Hence
  U^ψ_∞=TY^ψ_∞ and ω_nY^ψ_∞=ν_nU^ψ_∞, which gives
  ℓ(U^ψ_n/(C^S_n)^ψ)=ℓ(U^ψ_∞/(ν_nU^ψ_∞+C_{∞,ψ}))+a_ψ for every n≥0. The
  branch's extra error term ℓ(U^ψ_∞/TY^ψ_∞) is zero. N_n∩(C^S_n)^ψ is the
  image of C_{∞,ψ}, which also covers n=0.
- **§3.3 Check.** The branch's example of an error that grows with n was
  ℓ(O′[T]/(T²,ω_n)). Since ω_n≡pⁿT mod T², that module is O′⊕O′/pⁿ, of
  infinite length. It is replaced by ℓ(ℤ_p/pⁿ)=n.
- **§3.3, step 1.** Sinnott's D_k has generators for every n>1, including
  rational primes q∤m. The text now says that these, and the generators
  whose conductor does not divide that of L_n, are rational or products of
  the others. It no longer says that only conductors dividing the conductor
  occur.
- **§4.7, step 7.** The branch deduced integrality of ((1−φ)δ(X))_{χ⁻¹}
  from cancelling the pole at X=0. But (1−φ)δ(X)=r(Y)−r(Y^p) also has poles
  at X=1−ζ_p^j. Integrality now follows from αψ(c_b)∈𝒱(1) and the unit
  ρ(b)−1. The residues there cancel too, which stays as a check.
- **§4.21, step 10.** Greither proves Theorem 4.1 only for p=2, "for
  simplicity" (p.482–483). His split case replaces χ-quotients by
  Δ₀-quotients (pp.486–487), which is property (g) of §4.1 for minus modules
  and holds only at p=2. At odd p with Δ_p≠1, the Δ₀-quotient also carries
  the characters ξθ with θ not faithful on Δ_p. For example ℤ₃[C₃] has rank
  3, while the χ-quotient ℤ₃(ζ₃) has rank 2. So the branch's formulas with
  ξ-parts hold only when Δ_p=1, where ξ=χ; main's p-tower route covers
  Δ_p≠1. In that step, the Ferrero–Greenberg constant is stated as "a p-adic
  unit multiple of L′_p(0,χ̌)" (Solomon (22)) rather than the branch's exact
  "−m".

## Adversarial pass on the touched statements

| Statement | Instances tried | Result |
|---|---|---|
| §3.3(a) | ψ(p)≠1 with L=ℚ(μ_p)⁺ (every ψ ramified); ψ(p)=1 with L=ℚ(√13), p=3; trivial ψ; n=0 | Equality with C_{n,ψ} when ψ(p)≠1. When ψ(p)=1 the extra O′ξ_{0,ψ} lies outside ker ρ_n for n≥1. The trivial part is the ℚ_n circular units. At n=0 one gets O′ξ_{0,ψ}=C_{L,ψ}, which §5.1 uses. |
| §3.3(b) | ψ(p)=1 at n=0; L=ℚ(√6), p=3 (torsion) | Exact formula at n=0 reduces to a_ψ=ℓ(U^ψ_0/O′ξ_{0,ψ}). The torsion affects only the rank statement, now corrected. |
| §3.3(c) | n=0, where ν_0=1 | 0≤ℓ(Z/TZ)−0≤ℓ(𝔛^ψ_0), with equality. |
| §3.3(d)/(e) | Growing error ℓ(ℤ_p/pⁿ)=n; T and T−p | A growing error moves λ; equal μ,λ do not identify ideals, so §3.4 keeps the divisibility. |
| Sinnott Theorem 4.1 / §5.1 | k=ℚ(√5), p=3 | Formula gives [E:C]=1·2·(2/2)·1=2, matching C=⟨−1,ε²⟩ and §0.22's ε^{−2}; v₃=0=v₃(h). |
| §4.7, step 7 | p=5, ρ=ω², b of order 4; trivial ρ; ν′=1; p=2 | ρ(b)=−1, ρ(b)−1=−2 is a unit mod 5, and the polar sum is 0. Trivial ρ gives the sum p−1≠0, the pole. ν′=1 is excluded (x^p=1). m=1 is impossible at p=2. Two proved Lean examples. |
| §4.7, integrality | Poles of r(Y)−r(Y^p) | Poles at X=0 and X=1−ζ_p^j; integrality follows from αψ(c_b), not from the X=0 residue alone. |
| §4.18, step 8 | u=2; F=ℚ(√−7) | μ_χ(2)=λ_χ(2)=0, so a nonzero e·u is required. For g_F, (G1) gives it. The real 2 lies in K=ℚ·[2] and is killed by e. |
| §4.21, step 9 | p=3, χ=(odd quadratic)×(cubic of conductor 7), with 3 inert in the cubic field | χ(3)≠1 has order divisible by 3. Nχ(1−χ(3))>1 cancels with the Euler factor of G_p(0,χ̌). Only right exactness is used. |
| §4.21, step 10 | F=ℚ(√−2), p=3 (Δ₃=1, χ(3)=1); sextic F with Δ₃=C₃ | The first runs, with V₃=3^ℤ×{±1}. The second is excluded by the ξ-versus-χ rank count above. |
| Lean tests | Proved: quartic norm 2 (both signs); ζ₆−1=ζ²; C₂ sign sum; order-four Frobenius factor 1+i; (1+η⁴)(1−η²)≠1−η, using the degree of the minimal polynomial; domain eigenspace zero | All proved at the pins. Their hypotheses are unchanged from main's signatures. |

Statements of main's §3.3(e), §4.7 steps 8–12, §4.18 steps 1–7 and §4.21
steps 1–8 are unchanged in content. Main's ~adv handoff records their pass.
They were renumbered or moved only. Belliard Theorem 1.1(2), Lemmas 4.1–4.2,
Proposition 4.3, Lemmas 5.1–5.2 and Theorems 5.3, 6.1 were re-read and match.

## Sources read (public, SHA-256 identical to the ~adv handoff)

- Sinnott 1980, GDZ scan `ca496fb4…19637`: pp.182, 201, 207, 211, 226, read on rendered pages (no text layer).
- Greither 1992, Numdam `8e4db974…623da`: pp.461, 482–487.
- Solomon 1990, Numdam `c207989d…daed64`: pp.481–486.
- Belliard, arXiv:0912.2528v1 `851ef8a6…31c9`: pp.4–5, 12–16.
- Tau Ceti ClassFieldTheory README (current TauCetiRoadmap main, read-only): Layers 6–7 for local reciprocity.

No uncleared book was used. No passage is copied into the deliverables.

## Validation

- `lean-check research/blueprint/packages/EulerSystemsCyclotomicMainConjecture/Suggested.lean`:
  exit 0, no errors, 15 `declaration uses sorry` warnings (down from 21; the six test theorems are proved). The file has 403 lines.
- `python3 scripts/check_sorry_data.py` on Suggested.lean: exit 0.
- Machine `mech_check.py`: identical to main apart from the counts (96 bold
  targets, 152 backticked identifiers). The 11 inherited API names absent from Lean, and the three
  comment-only Lean sections for Layers 1, 2 and 5, are unchanged from main.
- Machine `depcheck.py --candidate … --only EulerSystemsCyclotomicMainConjecture`:
  exit 1, solely `NOT IN ORDER.txt`, identical to main (122 roadmaps, 1167 edges), and
  ignored as the issue says. No cycle or upward edge.
- Anchor check: all 75 anchors retained, every `[§x.y](#…)` resolves with a
  matching number, and every Needs link points backward. Every fine-grained
  external id resolves to a supplier packet node, including both Baker–Brumer ids.
- `intake.py check-files` on the four deliverables: 0 problems. `git diff --check`: clean.

## Follow-ups for the maintainer (outside this job's files)

- The packet `research/blueprint/packets/EulerSystemsCyclotomicMainConjecture.json`
  still lists the four gaps and the old requests. These are the Coleman L4
  and Dirichlet L2 m=1 comparisons, the Dirichlet L3 nonvanishing and the
  IntegralIwasawaTheory L2 odd-p lattices. A packet follow-up can close them
  against §§3.3, 4.7, 4.18 and 4.21. It can also add `sourceVersions` for
  Sinnott, Solomon, Belliard and Mazur–Wiles with the hashes above. The new
  prerequisites to add are Hilbert 90,
  `IntegralIwasawaTheory:L4/baker-brumer-algebraic-numbers`,
  `PadicMeasuresIwasawaAlgebras:L4/iwasawa-growth-formula` and ClassFieldTheory
  Layers 6–7.
- `IntegralIwasawaTheory:L0/general-conductor-index` still calls the
  correction unresolved. Sinnott Theorem 4.1 with Proposition 5.1 settles it
  for p∤[L:ℚ], and the tower theorem settles the bounded form.
- `DirichletPadicLFunctions:L3/rjw2-fg-nonvanishing` can point to §4.18,
  steps 5–8, for the arithmetic deduction.
- No ownership move.

Untrusted text: the closed branch's README, Lean file and handoff, and the
fetched papers, were read as data. They contained no instructions, and
nothing suspicious was found.
