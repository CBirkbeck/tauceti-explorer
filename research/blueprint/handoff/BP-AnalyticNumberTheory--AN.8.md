# BP-AnalyticNumberTheory--AN.8 — completed target-planning pass

Codex, session `codex-rtOQ9t`, 2026-10-05. Refs #1022. The claim and bot confirmation are in the packet provenance. This continues the fifteen-node checkpoint merged from #3801; all its node identifiers are preserved.

The packet is **complete** under Protocol §0: AN.8 and AN.9 are **planned**, neither is closed. Every selected target is connected to the pinned baseline, an imported node, a requested supplier or a precise gap. The 73 additions cover quadratic double-series continuation, binary-cubic local/global zeta and analytic coefficient comparisons, compact scalar Selberg/spectral determinants, and the completed Bost–Connes phase transition, type III₁ and arithmetic subalgebra.

## Deliverables and validation

The packet has 88 nodes: 17 constructions, 20 theorems, 40 lemmas, 5 definitions and 6 comparisons; 94 API items, 74 unit tests, 12 planets, 37 baseline declarations, 15 gaps and 13 requests. Every node keeps implementation status unchecked. The reader is the mathematical specification; the suggested file contains concrete prototypes and explicit omissions.

- The packet checker with the pinned declaration index reports **0 errors and 0 warnings**.
- Cross-file audit verifies every node statement, declaration name, API obligation and test in the reader, and every canonical name in either a native signature/example or an explicit omission block. All fifteen inherited IDs survive.
- Source-issue structure and version receipts pass the errata helper checks. The five new identifiers E18–E22 do not collide with the other packet, paper or errata files in this checkout.
- Nine finite convention-check groups passed; their independently useful inputs and outcomes are recorded below and in `mathematicalChecks`.
- Deliverable-path/local-path/JSON intake checks and whitespace checks are run before submission.

**The suggested Lean file was not compiled.** No complete pre-existing build at both Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` was available. No build, cache download or language server was started. There are 132 actual native declarations, 68 named anonymous-example receipts, and 73 omitted canonical interfaces on 61 nodes. The unavailable adelic quotient and scaling-measure carriers and six associated tests remain mathematical obligations in explicit blocks. Narrow algebraic classification and pole-clearance prototypes have distinct names; they do not substitute for the full target interfaces.

## What remains and where to resume

Both stage coverage records and the following gap titles identify the consumers. A follow-up should refine these existing IDs, not restart the source or target survey.

### Quadratic first-moment proof

Read the complete source behind Blomer(16) and match the uniform first-moment estimate. The selected continuation proof cites it; this pass read its use, not the original large-sieve argument.

Consumers: `AnalyticNumberTheory:AN.8/quadratic-mean-bound-import`.

### Bounded tube-domain extension

Read DGH03 Propositions4.6–4.7 and match the shell-to-hull theorem. Mathlib AnalyticOnNhd on C² is a carrier, not the needed extension theorem.

Consumers: `AnalyticNumberTheory:AN.8/tube-hull-extension`.

### General O_F orbit-to-ring adapter

The current ST nodes supply the core orbit/stabilizer dictionary. The extension to nonprincipal locally free cubic modules and its trace-divisible dual lattice need the original Wright/Datskovsky–Wright source proof.

Consumers: `AnalyticNumberTheory:AN.8/cubic-orbit-to-coefficient`, `AnalyticNumberTheory:AN.8/cubic-shintani-series`.

### Binary-cubic local gamma and density tables

Acquire Datskovsky–Wright (1986), Theorems6.1–6.2 and local orbit integrals, and the original Sato–Shintani local functional-equation theorem. Pin self-dual Fourier measure, the s shift and every matrix entry including residue characteristics2 and3. This pass defines the integrals and shell interface, not these unread local proofs.

Consumers: `AnalyticNumberTheory:AN.8/pvs-local-zeta`, `AnalyticNumberTheory:AN.8/local-density-coefficient-comparison`.

### Global PVS unfolding and Poisson singular terms

The integral is source-scoped to the binary-cubic representation. Acquire the original Wright global zeta argument and match this action/exponent convention, dual pairing, singular orbit contributions, local products and quotient measure before asserting its full proof closure. LOWW Proposition3.7 reports the resulting analytic theorem but does not reprove this source chain.

Consumers: `AnalyticNumberTheory:AN.8/cubic-adelic-zeta`.

### Original global analytic theorem

Acquire Wright (1985) Theorem4.1 and Datskovsky–Wright (1986) Theorems6.1–6.2, cited in LOWW. The full LOWW statement is read; its original continuation, residue and order-one proofs are not decomposed here.

Consumers: `AnalyticNumberTheory:AN.8/cubic-global-functional-equation`, `AnalyticNumberTheory:AN.8/cubic-residues-and-entire-clearance`.

### Local order enumeration

The generating formula is LOWW Lemma3.9, cited from DW86 Theorem6.2. Read its original local proof before refining the order-count Euler factors.

Consumers: `AnalyticNumberTheory:AN.8/cubic-orders-generating-series`.

### Barnes G normalization and asymptotics

Acquire the primary Barnes-function proofs cited in JSS(2.8)–(2.9), match G(1)=1 and the logarithmic branches, and supply the determinant integration constant. The pinned gamma/Mellin declarations do not certify this interface.

Consumers: `AnalyticNumberTheory:AN.9/identity-barnes-transform`.

### Heat and Laplace–Mellin source leaves

Read the complete original heat-kernel/Weyl and JSS Propositions5.4–5.5 proofs, then refine the remainder, trace-class and parameter-integral leaves. The selected JSS §6 proof is read and decomposed; it relies on those earlier/source results.

Consumers: `AnalyticNumberTheory:AN.9/compact-spectrum-and-weyl`, `AnalyticNumberTheory:AN.9/heat-small-time-subtraction`, `AnalyticNumberTheory:AN.9/scalar-heat-trace-formula`, `AnalyticNumberTheory:AN.9/hyperbolic-laplace-mellin`.

### C*-completion and analytic-core operator leaves

Match the exact pinned bounded-operator star/C*-instances and prove the finite-degree l² bound, GNS norm1 bound, universal=reduced amenability comparison and analytic-core strip extension. The packet gives their statements; source-cited general operator-algebra proofs require a pinned-library audit and explicit source refinement; the retired LI.2 stage supplies none.

Consumers: `AnalyticNumberTheory:AN.9/bc-cstar-completion`, `AnalyticNumberTheory:AN.9/bc-convolution-norm-bound`, `AnalyticNumberTheory:AN.9/bc-bounded-state-extension`, `AnalyticNumberTheory:AN.9/bc-analytic-core-strip-equivalence`.

### Measure, Fourier and state-simplex carriers

Match the finite-adele restricted-product measure, compact-character density, Riesz state/measure map, conditional expectations and the KMS Choquet simplex theorem to pinned or requested declarations. Neshveyev 2000 is read in full; these named functional-analytic/arithmetic carrier interfaces remain open.

Consumers: `AnalyticNumberTheory:AN.9/bc-adelic-scaling-measure`, `AnalyticNumberTheory:AN.9/bc-kms-scaling-correspondence`, `AnalyticNumberTheory:AN.9/bc-finite-prime-projection`, `AnalyticNumberTheory:AN.9/bc-local-character-density`, `AnalyticNumberTheory:AN.9/bc-low-temperature-uniqueness`, `AnalyticNumberTheory:AN.9/bc-high-beta-barycentres`.

### Ratio-set and von Neumann factor interface

Neshveyev §1–2 is read, including prime-pair and cylinder proofs. Supply the precise nonsingular ratio-set definition, asymptotic-ratio inclusion, compact-quotient lifting, group-measure-space factor and full-corner type invariance. These general operator/measure foundations require an explicit pinned-library audit and source refinement; the retired LI.2 stage supplies none.

Consumers: `AnalyticNumberTheory:AN.9/bc-full-positive-ratio-set`, `AnalyticNumberTheory:AN.9/bc-type-three-one`.

### Arithmetic generation polynomial identities

The complete Connes–Marcolli Theorem3.30 proof was read. Match the exact Newton/polynomial-root multiplicity declarations and the cotangent finite-sum interface to the pinned libraries; do not hide the prime2 projection step in an undifferentiated generation theorem.

Consumers: `AnalyticNumberTheory:AN.9/bc-eisenstein-roots-recovery`, `AnalyticNumberTheory:AN.9/bc-arithmetic-algebra-generation`.

### Native carrier signatures

The native file must leave the canonical adelic quotient/Fourier test-space and finite-adele measure carrier signatures out until their supplier adapters are supplied. Corresponding names, API and tests are listed in explicit omission blocks. No unconstrained Prop fields substitute for these conditions; concrete integral/series/scalar/state signatures are given where possible.

Consumers: `AnalyticNumberTheory:AN.8/cubic-adelic-zeta`, `AnalyticNumberTheory:AN.9/bc-adelic-scaling-measure`, `AnalyticNumberTheory:AN.9/bc-kms-infinity-and-ground`.

### Native elaboration

No complete pre-existing build at both pinned revisions is available. The suggested file is uncompiled. Its source-based signatures and finite mathematics checks are not elaboration evidence; match the bounded-operator, polynomial and quotient coercions in the exact build before implementation.

Consumers: `AnalyticNumberTheory:AN.9/ax-plus-b-pair`, `AnalyticNumberTheory:AN.9/bost-connes-hecke-algebra`, `AnalyticNumberTheory:AN.9/time-evolution`, `AnalyticNumberTheory:AN.9/regular-representation`, `AnalyticNumberTheory:AN.9/gibbs-states`, `AnalyticNumberTheory:AN.9/kms-states`, `AnalyticNumberTheory:AN.9/symmetry-action`, `AnalyticNumberTheory:AN.8/characters-mod-eight`, `AnalyticNumberTheory:AN.8/quadratic-double-series`, `AnalyticNumberTheory:AN.8/double-functional-system`, `AnalyticNumberTheory:AN.8/pvs-local-zeta`, `AnalyticNumberTheory:AN.8/cubic-shintani-series`, `AnalyticNumberTheory:AN.8/cubic-archimedean-matrix`, `AnalyticNumberTheory:AN.8/cubic-adelic-zeta`, `AnalyticNumberTheory:AN.9/spectral-zeta-series`, `AnalyticNumberTheory:AN.9/selberg-primitive-product`, `AnalyticNumberTheory:AN.9/spectral-regularized-determinant`, `AnalyticNumberTheory:AN.9/bc-cstar-completion`, `AnalyticNumberTheory:AN.9/bc-completed-kms`, `AnalyticNumberTheory:AN.9/bc-kms-infinity-and-ground`, `AnalyticNumberTheory:AN.9/bc-adelic-scaling-measure`, `AnalyticNumberTheory:AN.9/bc-trigonometric-eisenstein`.

## Supplier boundaries

No orbit/discriminant/stabilizer structure, trace formula, compact-surface geometry or existing upstream number-field theory is replanned here. The exact requested interfaces and consumers are in the packet. Requests go to:

- **AnalyticNumberTheory:AN.2**: Supply the exact quadratic first-moment estimate Blomer(16), with squarefree discriminants, four mod8 twists and vertical-strip uniformity; the current AN.0 packet does not certify this exact interface.

- **AnalyticNumberTheory:AN.1**: Use the existing Dirichlet-character functional-equation chain with primitive conductor, parity and missing Euler factors; match its output to the four quadratic residue-class factors r in AN.8.

- **ArithmeticStatistics:ST.0**: Provide bounded-discriminant finiteness and inverse-automorphism-weighted coefficient sums for all locally free cubic O_F-algebras, retaining reducible and nonmaximal rings.

- **ArithmeticStatistics:ST.1**: Provide the binary-cubic twisted action, discriminant, local nondegenerate orbit types, trace-divisible dual lattice and adelic parametrization including nonprincipal locally free O_F-modules. Existing Delone–Faddeev nodes are used only in their proved base-ring scope.

- **LogicAndDefinabilityInNumberTheory:LD.3**: Supply specialization and rationality for the selected binary-cubic discriminant integral, with residue bounds, denominator powers and the actual dyadic/triadic exceptions. No general motivic transfer is asserted without its hypotheses.

- **AutomorphicLFunctionsAndLocalFactors:AL.0**: Supply local/adelic Schwartz–Bruhat functions, the binary-cubic Fourier pairing and self-dual measures, Poisson summation with the singular-orbit correction, and locally uniform holomorphic parameter integrals.

- **AdelicAlgebraicGroups:AA.2**: Supply GL2 adelic quotient measure and compatible local Haar factors for the twisted binary-cubic integral; also additive finite-adele measures for the Bost–Connes scaling construction.

- **ArithmeticStatistics:ST.3**: Supply LOWW Lemma3.5 cubic-extension count over F, including h2(F) and uniform discriminant powers, for the AN.8 reducible/field coefficient estimate.

- **AnalyticNumberTheory:AN.7**: Supply the normalized classical Barnes G-function, its logarithmic derivative and full large-real-s expansion as used in JSS(2.8)–(2.9). This is an extension request; the current AN.7 target pass covers Hurwitz/Lerch and does not yet provide Barnes G.

- **ArithmeticLocallySymmetricSpaces:ALS.0**: Supply the connected compact oriented hyperbolic surface Γ\H for a torsion-free cocompact Γ, curvature−1 and area4π(g−1), and the primitive conjugacy-class/length convention used in the scalar Selberg product.

- **AutomorphicSpectralTheory:AS.4**: Supply the scalar positive self-adjoint Laplacian, complete discrete eigenbasis, finite multiplicities, simple zero mode, Weyl counting and uniform heat-kernel asymptotics on the selected compact surface.

- **AutomorphicSpectralTheory:AS.6**: Supply the compact scalar heat trace formula, the Gaussian test-function extension and geodesic growth, with exactly the primitive-class convention and the identity/hyperbolic constants displayed here.

- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic**: Supply the Q cyclotomic character and the explicit class-field identification Aut(Q/Z)=Ẑ×=Gal(Qcycl/Q), preserving the source Artin-map convention. The elementary basis-value formula does not require continuity of field automorphisms of C.

The accepted restructuring retired LI.2/LI.4. Neither is used as a prerequisite or active supplier. Missing general operator/measure/tube interfaces remain explicit gaps requiring a pinned-library audit and source refinement. `upstreamNotes` preserves the audit worklist without assigning a new mathematical owner. The cyclotomic comparison imports the existing GlobalNumberFields layer10; its full authoritative section was read.

## Source readings and corrections

Public URLs, SHA-256 hashes and exact reading extents are in `sources` and `sourceVersions`, and reproduced in the reader. No PDF, extracted text or private machine path is required to resume.

- Bost–Connes, published scan: fresh full page-image reread of pp.430–433, including Proposition18 and its proof. E14’s γ/m correction was independently rechecked.
- Connes–Marcolli: KMS/ground definitions pp.445–448; the Q-lattice, Hecke, rational-form and arithmetic-generation chains pp.454–470; Theorem3.32 pp.474–476. General cited operator and class-field proofs are not claimed read.
- Neshveyev2000: all four pages of the actual ergodicity paper, arXiv math/0002141v1. The inherited math/0012110 link referred to an unrelated paper and is corrected as a blueprint citation error.
- Neshveyev2009: full introduction and §§1–2, pp.1–5, including the prime-pair/valuation ratio proof; the GL₂ branch is outside this scope.
- Blomer: published §2.1 p.358 and the complete Lemma2 proof pp.361–364, collated with arXivv1. E18 fixes two character signs, E19 the conductor4d₀ row, E20 the vertical-height absolute values and E21 the final tube’s missing square. Journal, arXiv and author correction searches found no correction. These new findings await independent verification.
- Lemke Oliver–Wang–Wood: complete §3.2 pp.11–14, including Proposition3.7 and Lemmas3.8–3.11. The accepted PAPER-LEMKEOLIVER-WANG-WOOD25/14 route supplies published provenance; this session freshly read the arXiv PDF and does not claim a fresh published-version reading. The original Wright/Datskovsky–Wright proof acquisition is a gap.
- Sarnak: full page images pp.601–606; the spectral/Mellin/determinant definitions use p.603.
- Zagier: full §1 pp.1–2 for compact Selberg conventions; it is not a continuation-proof certificate.
- Jorgenson–Smajlović–Spilioti: full v1 §6 Theorem6.1 and proof pp.20–24, relevant determinant formulae in §8; v2 introductory and §8.2–8.3 formulae collated. E22 is a v1 torsion sign already corrected by v2, 9February2026; the targets use the corrected constant. Earlier heat/Laplace–Mellin proofs remain precise gaps.

The two full upstream roadmap readings are ArithmeticDirichletSeries and Chebotarev. Their hashes, unchanged during this job, are in provenance.

## Finite convention-check evidence

Checks use exact fractions for the rational assertions and elementary complex evaluation for the finite numerical assertions. Infinite sums are truncated only for the stated Gibbs diagnostic; no approximation is presented as a proof.

- All residue products modulo8 and Hadamard orthogonality; E18 corrected signs.

- Exact rational16×16 A²=I; rows1 and3 agree with published(32).

- Involutions on25 rational points; αβ has exact order6 at(2,3).

- All256 evaluated block entries agree with published(33); B(s)B(1−s)=I at four complex points; max relative error8.82e-16.

- E14 half-coset separates afterγ/m; six local shell laws normalize with exact tails; six prime-pair ratios equal(q/p)^β.

- β=2,3 half-root Gibbs values and x2x′2 weights agree with the exact parity identities within the finite-tail bound2/20000.

- Exact finite Fourier sums at orders1,2,3; order6 presentation agrees at order3; degenerate P2(0)=−1/4.

- Complex-place second-order coefficient−π²/4; finite determinant2·3=6 and scaling exponentζ(0)=3.

- Genus2,3,5: corrected−χ=2(g−1)=2C; v1 plus sign disagrees with its own(8.8), as corrected inv2.

## Session handoff

The maintainer has moved workers to a runner that starts a fresh process for each job. This session submits #1022 and stops; it does not claim another issue. Source-download, image and script scratch files are deleted after the pull request is opened. All source hashes, reading boundaries, results and restart instructions needed for review are retained in the four deliverables. No background process is left running.
