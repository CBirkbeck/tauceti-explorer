# Checkpoint: DESIGN-HyperbolicCurveVolumesAndGonality

Issue [#1697](https://github.com/CBirkbeck/tauceti-explorer/issues/1697), Codex session `codex-bgxyWZ`, 11 October 2026. This continues the earlier `codex-I23epj` checkpoint. **The design remains partial.** Do not send it for acceptance as a gap-free blueprint or package. All implementations remain `unchecked`.

## Why this is a checkpoint

The issue expressly requires reading the original Hwang–To papers. Searches by title, authors and DOI, public author pages, and the Project MUSE PDF endpoints returned metadata, verification HTML or inaccessible pages. The maintainer’s cleared-library index lists no copy. Neither original was read. The HT02 point-comparison proof is therefore a real source blocker; BT’s alternative diagonal proof and an independent Hessian computation do not satisfy the original-reading requirement. The next worker needs lawful readable originals or a maintainer amendment to that requirement:

- Hwang–To, *Volumes of complex analytic subvarieties of Hermitian symmetric spaces*, AJM 124 (2002), 1221–1246; DOI `10.1353/ajm.2002.0038`; publisher endpoint `https://muse.jhu.edu/article/1000/pdf`.
- Hwang–To, *Injectivity radius and gonality of a compact Riemann surface*, AJM 134 (2012), 259–283; DOI `10.1353/ajm.2012.0007`; publisher endpoint `https://muse.jhu.edu/article/464633/pdf`.

There are also substantive unfinished proof inputs and global signatures, listed below. No failure has been hidden behind abstract predicates or records assuming an estimate.

## Saved work

The four issue deliverables are synchronized. The packet now has 76 target-level nodes (29 definitions, 8 constructions, 33 theorems, 4 lemmas, 1 comparison, 1 application), 152 API items, 112 discriminating tests, 38 planets, 24 pinned baseline declarations, 17 supplier requests and 8 explicit gaps. All eight layers have target specifications. HV.0/HV.1 have local signature coverage; HV.2–HV.7 remain planned and unclosed. Checker counts of planned stages are structural counts, not a mathematical completion verdict.

The reader includes every node’s statement, hypotheses, proof route, prerequisites, sources with locators, definition API and tests. The suggested file gives local metric/density/potential/integral models, form-valued chart test functions over Mathlib’s existing LF topology, chart currents, normalized distributional ddᶜ, local Poincaré–Lelong, concrete Hessians, metric tubes, cusp pullback density and function-field gonality. Its theorem proofs and examples use `sorry`. It is intentionally incomplete for global objects.

New source work includes Demailly’s current/psh/normalization/curvature sections, Osserman’s Brill–Noether proof, the 2006 limit-linear-series construction and linked-Grassmannian fibre-bound statements/construction, Li–Yau’s inequality and spherical specialization, Abramovich’s cusp argument, and BT’s full alternative proof/erratum. Editions, read sections, URLs and byte hashes where available are saved in the packet. Sources were read in scratch or through the public browser; no excerpts or paper files belong in these deliverables.

## Mathematical conventions to preserve

- Curvature −1 uses twice Tau Ceti’s PoincareDisc distance; UpperHalfPlane already uses curvature −1. Product neighborhoods use maximum distance; volume forms sum across factors. Curvature rescaling multiplies lengths by λ and areas by λ².
- `dᶜ=i(∂bar−∂)/(4π)`, `ddᶜ=i∂∂bar/(2π)`: half Demailly. On a complex line ddᶜ is Δ/(4π), giving `ddᶜlog|h|²=[div h]`. Canonical area is `2π(K·C)` for compact smooth hyperbolic X and weighted effective cycles.
- `μ=tanh²(d₁/4)` is smooth across Δ, by `μ=χ/(1+√(1−χ))²`. Its logarithm is extended-real with −∞ on Δ. At `(0,w)`, writing `t=√(1−|w|²)`, the log-Hessian is `[[t⁴,t²],[t²,1]]/(2t³)` off Δ. For `F=−8πlog(1−μ)`, the ddᶜ coefficients are `[[2−t,−1/t],[−1/t,(2−t)/t⁴]]`; the difference from the product area is `[[t,1/t],[1/t,1/t³]]`. The packet gives the derivative calculation. These local matrix identities do not themselves assemble global currents or justify singular Stokes.
- The midpoint lens uses simultaneous lifts: upstairs balls of radius `d(x,y)/2+R` have midpoint enclosure radius `M(R)=2artanh√tanh(R/2)`, with `cosh M=e^R` and `M−R→log 2`. Do not silently discard the quotient simultaneous-lift hypothesis.
- For compact X, `ρ=½ systole`; points use `r<ρ`, diagonal tubes `d(x,y)<2r` use `r<ρ/2`. A cusped quotient has no positive global ρ.
- Δ₂ in X⁴ has codimension two: use a point-multiplicity sum, never divisor intersection with Δ₂. The conjugate diagonal is totally real, never a complex divisor.
- Relative diagonal smooth current coefficient is `ω/(4π)`; the conjugate relative estimate uses `sinh(r)/sinh(R)` for `r<R`. These retain the existing errata E10/E4 provenance; this worker did not independently review that errata job.
- Cusp density is `1/(|q|²log²|q|)`. Treat a constant zero coordinate separately with zero pullback. For `q=t^e`, positive e, the punctured pullback density is independent of e and the disk mass is `−2π/log s`.
- Gonality minimizes positive degrees on a smooth projective model or equivalently rational subfield indices. Separate the RR bound `g+1` from the Brill–Noether bound `floor((g+3)/2)`. Genus zero without a rational point does not imply gonality one. Field-extension equality uses algebraically closed base and finite-type descent.
- The relative pencil functor requires universal injectivity after base change and fppf sheafification of the Picard quotient. Its supplier is JacobianChallenge Layers C/D, not Hilbert/Quot by name. The limit-pencil fibre dimension is **at most** the sum of excess vanishing orders; its map to EH aspects is set-theoretic, without an asserted scheme-theoretic factorization.
- Stable conformal area takes infima over dimensions and branched conformal immersions; `4π gon` is an upper envelope, not its definition. Finite energy is insufficient without closed-form-domain membership. Congruence applications remain conditional on an imported spectral gap.

## Existing-library and upstream boundaries

All 24 baseline statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` / Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed audit was consulted. Mathlib already supplies TestFunction’s LF topology/universal property, Distribution, ofFun, delta and lineDerivCLM. Do not plan another scalar LF space or Dirac derivative.

Current TauCetiRoadmap main was inspected read-only at `070dc2becd74419e76303ede84b465ed4a69461f`. FuchsianOrbifolds and ConformalMapping reader documents were read in full, and current DifferentialGeometry README/signatures and relevant AlgebraicCurves/StableReduction/JacobianChallenge/AlgebraicVectorBundles boundaries were read. DifferentialGeometry owns smooth forms/wedge (0), exterior derivative (1), integration/ordinary Stokes (5), de Rham (6), Brouwer degree/no-retraction (10), and Riemannian metric/gradient/Laplacian (12). Its Layer 11 is hairy ball, not the degree supplier. Exact commit-pinned URLs occur in `upstreamPrerequisites`, with an `upstreamRequests` entry. The atlas snapshot lacks these stages; G9 records the encoding and global-carrier gap. Never duplicate their targets to silence the checker.

Current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` includes RiemannSurface LocalMultiplicity/Degree and continuous real-valued SubharmonicOn beyond the pin. Reuse them when available, through the owner contracts. The latter does not supply extended-real logarithmic psh poles. No current-only declaration was claimed as pinned baseline. No upstream checkout was built or changed. No notion was moved down from a higher-tier roadmap in this pass.

## Resume worklist

1. Obtain/read the original HT02/HT12 papers and close G3 with exact theorem hypotheses and a point-estimate proof chain. Confirm every radius and curvature convention against them.
2. Close G1: analytic local-ring Noetherianity, universal denominators and analytic closure in Demailly II (5.4)/(7.12), then construct the actual normalization/cycle objects. Algebraic GAGA does not supply these by name.
3. Instantiate the current DifferentialGeometry form/manifold carriers (G9). Complete global test forms, current restriction/pushforward/derivatives, positive (1,1)-currents, extended-real psh regularization, singular Stokes, Hermitian curvature and canonical comparison. Keep ordinary smooth forms/Stokes imported.
4. Close G4: regularized maximum and positive tie-boundary limit for BT’s Δ₂ two-region argument. Carry multiplicities and singular branch limits through HV.4/HV.5.
5. Close G5: decompose linked-Grassmannian incidence equations, exactness, open-density and tangent dimension, and the full endpoint-fibre stratification from linked §4. The 2006 primary sources are now accessible and partly read, so this is a mathematical decomposition gap rather than a source-access blocker. Obtain StableReduction’s requested regular smoothing contract, and implement relative pencil/Picard signatures.
6. Close G6 with the restricted equatorial-sphere conformal-image/Gauss contracts, rather than importing an unplanned generic minimal-immersion theorem. Close G7 with logarithmic cusp/elliptic cutoffs converging in the chosen Friedrichs Dirichlet form.
7. Resolve G8 when design [#1699](https://github.com/CBirkbeck/tauceti-explorer/issues/1699) exposes its actual congruence-gap stage. Import the theorem and spectral-bottom identification; do not privately prove automorphic theory.
8. Complete Suggested coverage and retest. HV.2 omits quotient descent, normalization, effective cycles, intrinsic volume, branch multiplicity and global injectivity signatures; HV.3 omits global transport/positivity/psh and line-bundle signatures; HV.4 omits lift transport and all global estimates; HV.5 omits conjugate-quotient carriers/current estimates; HV.6 omits projective-model comparison, pencils, parameter spaces, base change and linked/BN signatures; HV.7 omits branched conformal maps, conformal area, Dirichlet-form domain, balancing and Li–Yau signatures. The reader/packet give the precise API/test names and mathematical statements to prototype. Local chart specializations are not substitutes for these global contracts.

Keep `status: partial` until these gaps and omitted signatures are closed. Run both the packet checker and the submission path check, and preserve the source-faithfulness rule of own words with locators.

## Validation receipt

On 11 October 2026, `python3 scripts/check_blueprint.py research/blueprint/packets/HyperbolicCurveVolumesAndGonality.json` returned **0 errors, 0 warnings**. It checks structure/references, not the eight remaining mathematical gaps.

`lean-check research/blueprint/suggested/HyperbolicCurveVolumesAndGonality.lean` returned **exit 0**, with 148 warnings, all `declaration uses sorry`, and no other diagnostics. Available memory exceeded 20 GB before each attempt. The wrapper used the existing shared build with pinned Mathlib 082e2d3 and newer Tau Ceti; imported Tau Ceti interfaces were separately read at f790474. This is a successful signature elaboration in that shared environment, not a proof check at an entirely pinned Tau Ceti build. No Lean server, dependency build, update or cache fetch was run; no compiler remains running.

The submission includes only the issue’s four deliverables and this handoff. Scratch files can be discarded; all continuation evidence is in the packet, reader and this note.
