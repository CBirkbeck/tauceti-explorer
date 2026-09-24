# RT-AREA-combinatorics — red team of the Combinatorics area

**Result: 44 findings — 5 high, 22 medium, 17 low.**

The three roadmaps are sound in intent, and the two Tau Ceti roadmaps are mathematically careful. The high findings are
about proof routes and ordering: four in AdditiveCombinatorics, one in DenseGraphLimits.

- **AdditiveCombinatorics AC.2 and AC.3.** AC.2 must prove Szemerédi's theorem for every k, but it comes before AC.3. AC.3
  owns the Gowers norms and inverse theorems that every Fourier route for k ≥ 4 needs. The other routes, hypergraph removal
  and Furstenberg's ergodic proof, are planned nowhere.
- **AC.3's source.** Its only source, Green–Tao–Ziegler, is qualitative and set in nonstandard analysis. It also lacks its
  April 2026 correction (arXiv v5, Lemma 13.2). AC.3's consumers need the quantitative Leng–Sah–Sawhney inverse theorem.
- **AC.4's route.** Its text names the Conlon–Fox–Zhao dense-model route, but its decomposition follows Green–Tao 2008. The
  decomposition's open analytic gaps exist only on the 2008 route.
- **AC.5's inputs.** It receives Kai's number-field theorem from PAPER-ALPOGE-BHARGAVA-SHNIDMAN-26, but none of that
  theorem's inputs.
- **DenseGraphLimits Layer 6a.** The converse of separation is called self-contained, but every source proves it through
  the second sampling lemma of Layer 9c. Layer 9c is also declared to consume Layer 6b, so the layers form a cycle.

**Red team:** Claude Code, session `cc-2aeb03`, 24 September 2026 (issue #1545).

**Target:** `area:combinatorics`: AdditiveCombinatorics (6 stages, proposed), `tauceti:TauCetiRoadmap/AlgebraicCodingTheory`
(7 layers) and `tauceti:TauCetiRoadmap/DenseGraphLimits` (13 layers). This includes:
- the restructurings RS-03 and RS-07, which touch AdditiveCombinatorics;
- the three papers routed to the area: PAPER-ALPOGE-BHARGAVA-SHNIDMAN-26 and PAPER-HARPAZ-WITTENBERG-16 at AC.5, and
  PAPER-BENNETT-SIKSEK-20 at AC.2.

**Baseline:** Mathlib `082e2d3` and Tau Ceti `f790474`.

**Eligibility:** `cc-2aeb03` wrote and reviewed nothing in this area.

## Method

- **The roadmaps.** For each roadmap: its atlas extract and document, and every stage description. Also, where they exist:
  - its integrated decomposition (AdditiveCombinatorics);
  - its link map;
  - its entries in `data/library-coverage.json`;
  - the restructurings that touch it;
  - the routed paper items.
- **Libraries.** Every planned target was looked up at the pins. The Tau Ceti files behind every "built" claim were checked
  for `sorry`: all 51 files under `TauCeti/Combinatorics/DenseGraphLimits` are free of `sorry` and axioms.
- **Duplication.** `data/atlas.json` was searched across all roadmaps for the area's key notions: Gowers norms, nilmanifolds,
  finite Fourier analysis, regularity and removal, graphons and couplings, exchangeable arrays, lattices from codes,
  discriminant forms and Poisson summation.
- **Sources.** Public versions only, fetched 24 September 2026, with URLs in the findings. Among them:
  - Green–Tao–Ziegler (arXiv 1009.3998 v5) and its 2024 erratum;
  - Leng–Sah–Sawhney (arXiv 2402.17994/5);
  - Kai (arXiv 2306.16983 v5);
  - Conlon–Fox–Zhao and Zhao;
  - Green–Tao's "Linear equations in primes";
  - Lovász's *Large Networks and Graph Limits* (author's draft);
  - Bannai–Dougherty–Harada–Oura.

## Findings


### AdditiveCombinatorics — Additive combinatorics, higher Fourier analysis and primes — 20 findings (4 high, 10 medium, 6 low)

- **RT-AREA-combinatorics/1** (error, high). AC.2 must deliver Szemeredi's theorem for every k 'through one selected complete proof route', but it is placed before AC.3, which owns the Gowers norms and inverse theorems.
- **RT-AREA-combinatorics/2** (missing, medium). AC.2 asks for an arithmetic removal lemma but does not say what it rests on, and no layer owns its inputs.
- **RT-AREA-combinatorics/3** (library-claim, medium). AC.2 still plans Roth's theorem.
- **RT-AREA-combinatorics/4** (other, high). AC.3's only named source is out of date in two ways.
- **RT-AREA-combinatorics/5** (missing, high). The accepted source route sends Kai's Theorem 13.1 (linear patterns of prime elements in O_K[S^-1] for a number field K) to AC.5. AC.5 as written covers only Green-Tao's 'linear equations in primes' over Z, requires only AC.4, and records none of what Kai's proof uses: (a) the number-field setting on O_K ≅ Z^n, with multiparameter nilsequences and Gowers norms on boxes [-N,N]^n; (b) the quasipolynomial inverse theorem of Leng-Sah-Sawhney with Leng's equidistribution, not GTZ;
- **RT-AREA-combinatorics/6** (error, medium). The extraction says that the Kai route does not consume item 33 (Mitsui's generalized prime number theorem), and that Mitsui's input 'is not needed if the exact Kai proof is used'. This is false.
- **RT-AREA-combinatorics/7** (missing, medium). AC.5's own named source for Mobius-nilsequence orthogonality (Green-Tao 2012) uses Vinogradov's Type I/II method in Vaughan's form and the Siegel-Walfisz theorem for progressions of modulus (log N)^{O(1)}. Its ineffectivity comes from Siegel zeros.
- **RT-AREA-combinatorics/8** (error, high). The stage text and the accepted decomposition describe two different proofs.
- **RT-AREA-combinatorics/9** (error, medium). No proof route to any AC.4 or AC.5 target uses Bombieri-Vinogradov, which is SV.3's content.
- **RT-AREA-combinatorics/10** (other, medium). AC.1's inverse-theorem target is set by Tao-Vu (2006) and is out of date.
- **RT-AREA-combinatorics/11** (other, medium). AC.2 asks for quantified density bounds but names no bound.
- **RT-AREA-combinatorics/12** (missing, medium). AC.1 must show that Bohr sets contain large generalized arithmetic progressions, and prove Freiman's theorem over Z (via Ruzsa modelling, Bogolyubov-Ruzsa and a Bohr set). Both rest on Minkowski's second theorem on successive minima.
- **RT-AREA-combinatorics/13** (duplicate, medium). Compact nilmanifolds G/Γ (G a simply connected nilpotent Lie group, Γ a lattice) are planned twice: in AC.3, and in ALS.2, whose Borel-Serre boundary strata have nilmanifold fibres Γ_N\N(ℝ). No restructuring settles who owns them.
- **RT-AREA-combinatorics/14** (duplicate, medium). RS-03 makes AC.0 the owner of the 'missing arbitrary finite-abelian Fourier normalization/comparison interface', but links it only to FF.1 and FF.2. The same finite Fourier transform is planned in EllipticRegulators:ER.4, which is proposed and not covered by any restructuring.
- **RT-AREA-combinatorics/15** (error, low). AC.0's only recorded prerequisite, ClassicalArithmeticCompletion:CA.2 (recurrences, Bernoulli numbers, generating functions, Farey and automatic sequences), supplies nothing to sumsets, energy or finite Fourier analysis.
- **RT-AREA-combinatorics/16** (error, low). RS-03 names its upstream supplier for AC.0 as 'UPSTREAM:Mathlib audited cyclic Fourier, additive energy and Plunnecke-Ruzsa baseline (AUDIT-06; canonical audit pins)'. AUDIT-06 does not audit AdditiveCombinatorics: its roadmaps are FuchsianOrbifolds, OneParameterSemigroups, OptimalTransport and AnalyticNumberTheory.
- **RT-AREA-combinatorics/17** (error, low). As written, the set form is trivially true.
- **RT-AREA-combinatorics/18** (other, low). AC.3's only definition node defines the Gowers inner product and norms for real-valued functions on Z_N with N prime.
- **RT-AREA-combinatorics/19** (duplicate, low). PM.5 plans 'multiplicative-function correlations' with 'Chowla/Sarnak-type' statements.
- **RT-AREA-combinatorics/20** (missing, low). Even with Matthiesen's exact hypotheses supplied, AC.5 as written would not cover item 80. Matthiesen's theorem concerns the square-free representation function of norm forms, not primes.

### tauceti:TauCetiRoadmap/AlgebraicCodingTheory — Algebraic codes and code-lattice constructions — 10 findings (3 medium, 7 low)

- **RT-AREA-combinatorics/21** (error, medium). Layer 6 restricts higher-modulus Type II codes to Z/(2^r). It says this is the only published notion and forbids using the even-lattice theorem at other composite moduli.
- **RT-AREA-combinatorics/22** (missing, medium). Layer 7 asks for 'the reusable interface for an isometry from a coordinate finite quadratic module to the discriminant module of an orthogonal lattice sum'. The A2 and D4 coordinate checks exist to glue A2^ι and D4^ι. That interface needs mathematics that no layer plans and neither library has: (i) the orthogonal sum ⊕_{i:ι} L_i of a finite family of integral lattices (in particular the lattice power L^ι on ι → V); (ii) its dual carrier Π L_i^∨; (iii) the isometry A_{⊕L_i} ≅ Π A_{L_i}, bilinear, and quadratic when every L_i is even;
- **RT-AREA-combinatorics/23** (other, low). The coverage verdicts are correct at f790474, where only the Layer 1 carriers and matrix presentations and the Layer 2 coordinate power exist.
- **RT-AREA-combinatorics/24** (error, medium). The atlas records no dependency for this roadmap.
- **RT-AREA-combinatorics/25** (error, low). Layer 1 plans statements about objects that are defined only in later layers.
- **RT-AREA-combinatorics/26** (library-claim, low). The document names a gluing constructor that does not exist in the integral-lattices library: 'IntegralLattice.ofIsotropicSubgroup', or 'L₀.ofIsotropicSubgroup'. Layer 7 and the completion criterion both depend on it.
- **RT-AREA-combinatorics/27** (library-claim, low). The README says 'Tau Ceti has no general coding-theory layer'. This is false at the pin.
- **RT-AREA-combinatorics/28** (duplicate, low). Finite-group Poisson summation over a subgroup and its annihilator has two owners that do not know of each other.
- **RT-AREA-combinatorics/29** (other, low). GN.4 routes 'lattice codes' through FF.4, but FF.4 plans no construction of lattices.
- **RT-AREA-combinatorics/30** (error, low). Layer 3 asks for the 'invariance of the enumerator of a self-dual code under the normalized transform' without a coefficient ring.

### tauceti:TauCetiRoadmap/DenseGraphLimits — Dense graph limits and graphons — 14 findings (1 high, 9 medium, 4 low)

- **RT-AREA-combinatorics/31** (error, high). The converse of separation (cutDist_eq_zero_of_forall_homDensity_eq_cross, and with it cutDist_eq_zero_iff_forall_homDensity_eq_cross and graphonSpace_ext_homDensity) is declared 'self-contained' and scheduled before sampling, and Layer 9c is declared to consume Layer 6b, with its two modes such that 'neither consumes the other'. Both claims are false for every route in the cited sources.
- **RT-AREA-combinatorics/32** (missing, medium). The route of the in-probability target is given as 'point sampling (the analytic Azuma step on the weighted sampled graphon) plus Bernoulli edge rounding'. But the point-sampling half is the First Sampling Lemma for kernels (LNGL Lemma 10.6), not an Azuma step.
- **RT-AREA-combinatorics/33** (error, medium). The atomless mod-null equivalence exists_mpModNull_equiv_unitInterval is homed in Layer 5 'as the transport the compactness realignment (Layer 4) runs on'. Yet Layer 5 'does not block the other layers', and the Ordering says Layer 5 (coupling↔map) is 'gated on the measure-preserving mod-null equivalence'. Both are wrong at the pin.
- **RT-AREA-combinatorics/34** (missing, medium). Layer 4 names its two analytic inputs only in prose, with no statement: 'a measure-preserving realignment of cut-distance-Cauchy sequences (Birkhoff–von Neumann / Rokhlin) and a dyadic conditional-expectation + martingale L¹-Cauchy approximation'. The realignment is where the pinned migration source went wrong.
- **RT-AREA-combinatorics/35** (missing, medium). Layer 2 promises that 'Layer 3 later relates this [the block-average graphonPartitionEnergy / stepGraphonAvg] to the general AE / conditional-expectation interface'. Layer 3's own targets are toAEEqFun, a representative section, homDensity_congr_ae, cutNorm_congr_ae and cutDist_eq_zero_of_aeEq, and none of them makes that identification; no other layer states it either.
- **RT-AREA-combinatorics/36** (missing, medium). The iff lovasz_szegedy_representability has a pinned spine only for its hard direction.
- **RT-AREA-combinatorics/37** (duplicate, medium). Tau Ceti's roadmaps plan the coupling relation twice, and the library now has two unbridged coupling predicates.
- **RT-AREA-combinatorics/38** (missing, medium). The roadmap delegates to a 'companion graph-regularity roadmap'. That roadmap owns strong graph regularity and arity-3 hypergraph regularity, owns the adapters between finite densities and homDensityFin/injHomDensity, and consumes cutNorm, stepGraphon and weak_regularity_frieze_kannan.
- **RT-AREA-combinatorics/39** (duplicate, medium). The companion roadmap re-plans three things DenseGraphLimits has already built in carrier-generic form at f790474, requiring 'no graphon imports'. (a) Ordinary and injective homomorphism densities of finite graphs (PR #66 Layer 0) are homDensityFin and injHomDensity.
- **RT-AREA-combinatorics/40** (other, medium). The atlas records each of the 13 stages with status 'unknown', empty requires and no stage edges, although the README's Ordering states the dependencies.
- **RT-AREA-combinatorics/41** (missing, low). The finite↔infinite extension exchangeableGraphLawEquivInfinite ('the projective-limit extension of consistent marginals') needs an existence theorem for projective limits of probability measures on SimpleGraph ℕ ≅ (EdgeIndex → Bool). Mathlib 082e2d3 has only uniqueness (IsProjectiveLimit.unique) and the product and Ionescu-Tulcea constructions.
- **RT-AREA-combinatorics/42** (error, low). Three citations are wrong or incomplete.
- **RT-AREA-combinatorics/43** (library-claim, low). The README says Mathlib has only the measurable equivalence and 'not these measure-preserving refinements', and Layer 5 says to 'build' exists_measurePreserving_from_unitInterval (Janson A.9). Mathlib 082e2d3 already proves A.9: every probability measure on a nonempty standard Borel space is the pushforward of Lebesgue measure on I by a measurable map.
- **RT-AREA-combinatorics/44** (other, low). Layer 1 lists the arbitrary-carrier triangle inequality, and with it GraphonSpace, before any step-approximation input.


## What held

- **AlgebraicCodingTheory is mathematically careful.**
  - Every statement checked in Layers 1–7 is true as written, including Layer 5's numerical claims (checked by exhaustive
    enumeration) and the Construction A and discriminant formulas.
  - Its only error about the literature is the Z/2^r restriction on Type II codes.
  - Nothing else in the atlas plans Gleason's theorem, theta series of Construction A lattices, the Leech or Niemeier
    lattices, or the Golay–M24 identification.
- **Tau Ceti's DenseGraphLimits build is sorry-free at `f790474`.**
  - Built: Layers 1, 3 and 9a, most of Layers 2, 5, 7, 8a and 9c, and the graph-law half of 9b.
  - `data/library-coverage.json` matches the pin on every entry re-checked.
- **The AdditiveCombinatorics audit's absences hold.** Every target it marks absent is absent at both pins. Kneser's theorem,
  Balog–Szemerédi–Gowers, Bohr sets, Gowers norms, nilmanifolds, polynomial Freiman–Ruzsa and the Furstenberg correspondence
  are in neither library.
- **Already covered elsewhere.** The overlap of AC.2's ergodic prerequisites with Exchangeability Layer 5 is already a
  confirmed finding (RT-AREA-probability/12) and is not repeated. RS-03 and RS-07 settle AC.0 against ES.1, AC.5 against
  ES.3/ES.4, and SV.4 against AC.5.

## For the verifier and the fixer

- **High findings checked here.**
  - The GTZ correction is in the arXiv comment of 1009.3998v5: "This version corrects a mistake in the proof of Lemma 13.2
    (the wrong filtration was specified)".
  - The DenseGraphLimits cycle rests on Lovász, *Large Networks and Graph Limits*: Lemma 10.31 applies the Second Sampling
    Lemma 10.16, and Lemma 10.32 and Corollary 10.34 follow. The migration source the roadmap names proves the converse
    through its sampling lemma.
- **How the AdditiveCombinatorics highs fit together.** With the Conlon–Fox–Zhao route for AC.4 and the
  Leng–Sah–Sawhney route for AC.3:
  - the analytic inputs of the Green–Tao endgame shrink to Mathlib's Chebyshev bounds and the simple pole of ζ;
  - AC.5's Kai branch needs AC.3 but not AC.4.

  The suggested order is AC.0 → AC.1 → AC.2 (k = 3) → AC.3 → AC.3b (Szemerédi, k ≥ 4) → AC.4 → AC.5, with AC.3 → AC.5 direct.
- **Upstream changes.** Several fixes change Tau Ceti roadmap documents (AlgebraicCodingTheory, DenseGraphLimits). They are
  stated as maintainer notes, mirrored in the atlas.
- **A request to the orchestrator** (RT-AREA-combinatorics/23, low). Between 16 and 24 September, Tau Ceti merged dozens of
  coding and Construction A pull requests after the `f790474` pin. So a blueprint or fix job for AlgebraicCodingTheory would
  plan nodes that already exist upstream. The audit is right at the pin; whether to move the pin is the maintainer's call.
- **A possible new roadmap.** No atlas roadmap owns graph and hypergraph regularity and removal. DenseGraphLimits delegates
  them to a companion roadmap that exists only as an open Tau Ceti roadmap pull request, and AC.2 would need it for a removal
  route. See RT-AREA-combinatorics/38 and /39, and /1 on AC.2's routes.
