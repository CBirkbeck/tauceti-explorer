# Independent package review: Drinfeld modules and t-modules

Issue: #10896 (`REV-PKG-DrinfeldModulesAndTModules`). Reviewer: Codex,
session `codex-Rx0q5f`, 20 October 2026. The package was written by a different
worker, Claude Opus 5.5, session `claude-JuTyFi`; this reviewer did not author it.

## Verdict and remaining work

**needs_changes.** The mathematical corrections below are applied, the suggested
file elaborates, and both input packets validate. One prerequisite-order defect
remains: the package imports the atlas roadmaps FiniteFieldsAndCharacterSums,
MotivesAndAlgebraicCycles and FunctionFieldArithmetic, but neither this roadmap
nor those three suppliers has a tier or bundle assignment in
`upstream/CaraianiNewton.md`. That file explicitly leaves FiniteFieldsAndCharacterSums
outside its order. I cannot certify these as lower-tier or same-bundle imports,
as PACKAGE_REVIEW check 3 requires. This is an absent ordering certificate, not
evidence of a particular upward edge.

Before upstream submission, establish an order or bundle for this roadmap and
those suppliers, or identify already-upstream owners for the exact contracts.
The contracts needing that decision are q-linearized polynomials over arbitrary
commutative finite-field algebras (Scope and ownership; §§0.1–0.3 and others),
neutral Tannakian reconstruction over arbitrary fields and tensor-generation
criteria (§§8.22, 8.30, 8.34, 8.47), and discrete cocompact function-field adelic
lattices (§6.2 and its consumers). The converse downstream use of DM.0 by
FunctionFieldArithmetic should be checked when choosing a layer order or bundle.
Do not replace these general contracts by polynomial-ring or characteristic-zero
special cases. Changing the global tier registry or the suppliers is outside
this review's allowed files. No such assignment is invented here.

This is a completed fixing review, not an unfinished checkpoint. Its remaining
work is the dependency decision just described. The packets were not edited.

## Material checked

Read WORKERS, PACKAGE_REVIEW, UPSTREAM_GUIDE and the applicable PROTOCOL and
expansion rules. Compared the form with AdicSpaces and LocalGaloisGroups, including
their suggested signatures. Read both accepted packets, all 123 nodes and their
19 gaps and 15 requests. The final README has 136 numbered subsections, including
60 marked definition subsections. Each definition has its API, at least three
Checks, and either a real-bodied declaration or a name in the closing Lean
comment. Additional adapters, including the residue-dual line, have named APIs
and their own negative controls. Heavy geometric, analytic and categorical
objects remain full README targets.

The build order is DM.0, DM.2, DM.4, DM.1, DM.3, DM.5, DM.6, DM.7, DM.8.
All internal *Needs* links resolve to earlier targets. In particular the algebraic
Carlitz tensor-power construction precedes its uniformizability theorem in
§8.18. There are no `FoundationsAndLibraryIntegration` or `UPSTREAM:` placeholder
suppliers. The arXiv category remains `math.NT`.

## Corrections applied

1. **Ore algebra and rank (§§0.2–0.3).** The pinned skew-polynomial module does
   not supply division. Added the right-division theorem, its degree proof and a
   Lean milestone, valid even over imperfect coefficient fields. Included zero
   remainders when the divisor has degree zero. The integrality proof now uses
   the commutative `L[T]` action by right multiplication by `φ_a`; it does not
   mistake a subring of the noncommutative Ore ring for this module action.
2. **Linearization and étaleness (§§1.1–1.3, 1.6).** Invertibility means
   invertibility of the Frobenius linearization. Raw Frobenius on a separably
   closed imperfect field need not be surjective. The étale iff statement for
   Anderson modules needs positive fibre dimension; the zero module is an
   exception. Its derivative is a scalar plus a nilpotent matrix.
3. **Lattice morphisms (§2.7).** The nonzero roots are
   `exp_φ(c⁻¹Λ_ψ/Λ_φ)`, not values of `exp_ψ` on its own lattice. Restored the
   leading normalization `cX`; the derivative and source/target lattices agree.
4. **Moduli and section rings (§§3.5, 3.7).** Read the reciprocal-ring normality
   proof, stated its finite-free/regular-sequence and codimension-one arguments,
   and made the grading reversal explicit. Normal section-ring reasoning uses
   the integer-graded ring on the punctured line bundle and intersection with
   nonnegative degrees. Negative sections need not vanish over a general
   Noetherian base; a dimension-zero DVR example detects this.
5. **Purity and exponentials (§§4.5–4.7, 8.18).** Positive rank is required for
   the weight `d/r`; zero is pure for every ratio. Existence of the normalized
   exponential is retained for all t-modules, not just abelian ones. The scalar
   t-module is uniformizable with exponential the identity but is not abelian.
   Carlitz tensor-power uniformizability is proved only after the analytic
   criterion, by the matrix `Ωⁿ`.
6. **Valued skew algebra (§§4.10–4.11).** Corrected the side of the ideal in a
   left-module quotient; separated nilpotent primary factors from the
   invertible single-edge decomposition; used the dimension of each summand in
   the lattice exponent. The slope criterion includes nonzero constant term
   and positive dimension. Rank modulo a uniformizer power counts invariant
   factors below that power, rather than asserting invertibility in the
   quotient ring. Added singular, nilpotent and noncommutative controls.
7. **Tate comparison (§§5.1–5.4, 5.8).** Hom modules are finite projective over
   general `A`, not globally free. Saturation is local at the prime and permits
   nonprincipal ideals. Injectivity is proved independently of finite generation.
   The simplicity argument uses the finite-dimensional Ore quotient and the
   explicitly named scalar-isogeny factorization theorem; a cokernel supported
   at the characteristic alone does not give an `A`-annihilator.
8. **Tate duality (§§5.1, 7.6).** The canonical pairing takes values in
   `D_λ = Hom_F(K_λ/A_λ,F)`. An ordinary `A_λ`-valued dual requires a parameter
   and residue trace. The precomposition action, its rank-one parameter basis,
   change under constant rescaling of a parameter, and inverse Carlitz
   characters are stated. Parameter-free division modules are distinguished
   from coordinates chosen on them (§1.8). Finite torsion is a dual of the
   motive invariants in the proof of §8.18.
9. **Period ring (§5.5).** The valuation conditions quantify over every
   extension of each base valuation to the separable closure, with consistent
   ramification normalization. This is necessary for Galois stability. The
   multiplicative set uses `σ(s)/s` in the rational tensor ring prescribed by
   Stalder Definition 6.6. The example `Σxⁿzⁿ = (1−xz)⁻¹` separates the bounded
   power-series ring from its localization and its fixed subring.
10. **Elliptic sheaves (§§7.1–7.4).** Shifts of chain maps are locally bounded;
    a global bound requires quasi-compactness. On a disjoint union the maps
    `τⁿ` provide a counterexample to a uniform bound. The inverse construction
    uses the sheaf pushforward on the affine curve, not global sections on an
    arbitrary base. Wiedmann's nonrational-infinity period `rδ` and pushforward
    line condition were read and retained.
11. **General prerequisites in DM.8.** Added the actual Hilbert polynomial
    and dimension targets in §8.41; the cited scheme dimension layer alone
    does not provide Hilbert–Serre. Kept the characteristic-p graded-vector-space
    equivalence, which is broader than the supplier's rational pure-Tate example.
    The quantitative two-radius entire-function estimate stays in §8.36;
    bounded-zero finiteness is an import from NewtonPolygons.
12. **Logarithm motive and group (§§8.45, 8.47).** Finite generation over the
    skew ring is established from an extension of Carlitz tensor powers before
    applying ABP's freeness proposition. For the particular scalar-action group,
    a lift above `t` has cyclic closure conjugate to `G_m`; this supplies a
    section after algebraic closure and proves the required differential
    surjectivity. A general smooth group surjection is not assumed separable.

## Source sample and provenance

No locator was marked unverified by the package author. For the required random
sample, enumerated the 138 numbered headings in the original package, then used
Python `random.Random(10896).sample(headings, 15)`. Numbers in the first column
are deliberately the original numbers; the last column records the final
location after two deletions. Opened the linked public PDFs, checked the
displayed statements and locators, and read the proof passages used for repairs.
This is a locator sample, not a claim that every cited proof has been verified.

| Original section | Source and checked locator | Result / final location |
| --- | --- | --- |
| 3.1 | Hartl–Yu §2, (2.4), Theorem 2.3, pp. 7–8 | Level convention verified; §3.1. |
| 8.29 | Papanikolas Lemma 4.2.3, p. 23 | Invariant ideal descent verified; §8.27. |
| 8.30 | Papanikolas Corollary 4.2.5, p. 24 | Difference simplicity verified; §8.28. |
| 2.8 | Brownawell–Papanikolas §2.2, pp. 3–5; Papanikolas §1.2.2, p. 4 | Exponential/logarithm normalizations verified. |
| 2.7 | Brownawell–Papanikolas §2.4, pp. 6–7 | Repaired root set and derivative normalization. |
| 3.8 | Pink Lemma 5.1, p. 19; Theorems 5.3, 5.6, Definition 5.4, Proposition 5.5, p. 20; Theorem 5.7, p. 21 | Section definition and full graded ring verified, with §3.7 repair. |
| 8.11 | Papanikolas §2.2.4, p. 7 | Duplicate removed; normalized factorization and PID contract now in boundaries. |
| 6.9 | Taelman Definitions 6–7 and Proposition 12, p. 385; extension argument, p. 386 | Tangency, determinant orientation and finite-factor extension verified. |
| 6.12 | Thakur §§2.2–2.3, pp. 536–537 | Generating-function proof and range `1≤s≤q` checked; outside-range example retained. |
| 8.50 | Papanikolas §6.3.1 and Theorem 6.3.2, pp. 36–37 | Relation sign, count including the period and group dimension verified; §8.48. |
| 8.47 | Papanikolas Proposition 6.1.3, pp. 34–35; ABP Proposition 4.3.2, p. 21 | Added the finite-generation step required before freeness; §8.45. |
| 3.2 | Hartl–Yu Theorem 2.3, p. 8; Definition 2.6, Lemma 2.7, Proposition 2.8, pp. 10–11 | Good-open representability and fine-subgroup extension verified. |
| 5.8 | Stalder introduction, p. 3; §§2.3–2.4, pp. 7–11; Brownawell–Papanikolas §4.2, p. 16 | Introduction states semisimplicity, not the claimed simple-motive proof. Replaced inference by Ore principal-ideal and scalar-isogeny argument. |
| 0.2 | Brownawell–Papanikolas §2.3, p. 5 | Degree formula verified; added separately sourced right division. |
| 4.9 | Brownawell–Papanikolas §4.4, pp. 17–18 | Anti-isomorphism, transpose, row action and covariance verified. |

Additional repair readings: Hartl Corollary 2.6, p. 7 and Theorem 6.6, p. 26;
Stalder Theorem 2.17(d), pp. 9–10, Proposition 2.20, p. 10, Definition 2.22,
p. 11, Proposition 6.2, pp. 35–36 and Definition 6.6, p. 37; Maurischat
Definition 1.10, p. 8, §3, pp. 14–20, Theorem 4.1, p. 22 and §6;
Wiedmann Definition 5.1 and §§5.2–5.4, pp. 72–84; Pink–Schieder
Theorems 1.6–1.7 and 1.11, pp. 5–6, Theorem 2.7 and proof of Theorem 1.7,
p. 9. For Hilbert polynomials, read Stacks Proposition 10.58.7 (Tag 00JV)
and Lemma 10.117.1 (Tag 00P6); for normal section rings checked Tags 030W,
0B5T and 0C6J. All passages are represented in the package in original words,
with locators; no source excerpt or section-by-section digest is stored.

All following public PDFs were accessed on 2026-10-20. SHA-256 identifies the
bytes read; page references use each source's printed pagination.

| Public PDF | SHA-256 |
| --- | --- |
| [pap](https://arxiv.org/pdf/math/0506078v2) | `6b5d3436da4d309fa77de77d23a0ed1781ee7fe90c544e55a229ef5cae026cf3` |
| [bp](https://arxiv.org/pdf/1806.03919v1) | `08b68132a113d44e588d95fbf4995f68d350f84cf212d24b716263d69272b82d` |
| [hy](https://arxiv.org/pdf/2009.13934v2) | `7c4fe158c3503fc2e7096ea237c1e1932dfa074b3a62416e6040c92d773da2af` |
| [pink](https://people.math.ethz.ch/~pink/ftp/Pink_DrinfeldModularForms_2012.pdf) | `408d485d17dbede3ae02b9b90f132a37947d567e8f2697bdcb6c6cb8c41c9639` |
| [taelman](https://annals.math.princeton.edu/wp-content/uploads/annals-v175-n1-p10-p.pdf) | `46699398350f09a5e9baf53ae7b414102633fa86c0fc1abc11dee82ee6d0032d` |
| [thakur](https://www.sas.rochester.edu/mth/sites/dinesh-thakur/ffafinal.pdf) | `d31f4a4be1e6cb1aaf9bdc574070066b1057f043df3ec437cd71784c0933168f` |
| [stalder](https://arxiv.org/pdf/0809.0224v1) | `ba000e658d82e781d46e5f550c221e100516c46ea881cd23c68bae5da063142a` |
| [hartl](https://arxiv.org/pdf/1706.06807v1) | `bca3f51ed9bf5f215a12bdf2390b4718cb3a951a3e71c01fb87541fefafcd31f` |
| [wiedmann](https://www.uni-math.gwdg.de/wiedmann/Diss_Englisch/master.pdf) | `dfb9028260ce487088763691bf55b9644a9598976fa9db183b936c491fec828d` |
| [maurischat](https://aif.centre-mersenne.org/item/10.5802/aif.3754.pdf) | `4cf80d50c882ee43b71f9e6fbe9a50eb1e88d94efb8afae17dcd9ae51bb2201e` |
| [abp](https://arxiv.org/pdf/math/0207168v1) | `a22c328ea63a1d2d43309bc125b5f377c88d853ff0f1b21039fba14b924ff8c2` |
| [ps](https://arxiv.org/pdf/1007.4796v3) | `550e22fe90bd13571a244ee9bef16ac27cc299868a6d71527d322c49e4c268a2` |


## Duplication and supplier audit

The read-only current roadmap checkout was at
`0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti was
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Also inspected remote roadmap
main at `0e8b058a97cc4f9401d2679313e0e937761c1024` for supplier changes.
The elaboration pins remain Mathlib `082e2d3` and Tau Ceti `f790474`.
No build was run in either current read-only checkout.

Searched README and Suggested files in all current roadmaps and `Completed`,
including AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices,
LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions,
ProfiniteArithmetic and RealAlgebraicGeometry, and Completed
ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts.
Queries used objects and hypotheses: finite-field semilinearity and Frobenius
invariants, skew coefficients and module sides, nilpotent differentials,
finite-flat group kernels, restricted norm and Weierstrass conditions,
curve modifications and line-bundle pushforwards, Fitting base change,
graded tensor categories, compact finite-field nuclear operators, local
completion factors and adelic lattices. The target-by-target table below
records the resulting arithmetic distinctions as well as the edge cases.

| Target range | Existing owner inspected and disposition |
| --- | --- |
| 0.1–0.11 | Mathlib skew-polynomial carrier and finite-field Frobenius; Tau Ceti additive group and Hopf kernel. Only Drinfeld actions, rank and nilpotent standardization are planned. No Ore division theorem was found at the pins, so it is explicitly added in §0.2. |
| 2.1–2.11 | AlgebraicCurves completions; RestrictedPowerSeries and NewtonPolygons analytic theory. Arithmetic lattice exponentials, Carlitz normalizations and Ω remain new. General restricted-ring factorization/PID subsection deleted. |
| 4.1–4.12 | AlgebraicVectorBundles for sheaves/relative spectra; FiniteFieldsAndCharacterSums for q-linearized polynomials. T-module differential/support conditions, opposite twist and valued-skew criterion are distinct. IntegralLattices' commutative Smith theory does not supply §4.10. |
| 1.1–1.12 | Tau Ceti finite group-scheme kernels, AlgebraicCurves completions and ordinary Tate modules inspected. Strict finite-field deformation actions and equal-characteristic local shtukas are local targets, not attributed to mixed-characteristic local-shtuka plans. `TauCeti.TateModule` for integer-primary group torsion is not the `A_λ`-module construction. |
| 3.1–3.10 | SchemeAndStackFoundations Proj, descent, normalization, finite projective quotients, moduli and cohomology; AlgebraicVectorBundles line bundles. Drinfeld compactifications and the normal section-ring comparison remain local targets. |
| 5.1–5.9 | Library semilinear and tensor constructions do not supply rational `A`-motives or Stalder's valuation-controlled ring. Galois and local completion prerequisites are imported; residue-dual line and scalar isogeny factorization are explicit local targets. |
| 6.1–6.13 | Tau Ceti Fitting/base-change API imported. §6.1 adds only the characteristic-polynomial/monic-generator identity for finite `F[t]`-modules. OperatorTheory's characteristic-zero operators do not supply compact finite-`F` nuclear determinants. Function-field adelic lattice contract is retained, with its unresolved order stated above. |
| 7.1–7.7 | JacobianChallenge cohomology and AlgebraicVectorBundles sheaves imported. Periodic curve chains with characteristic and infinity cokernel conditions, locally bounded maps and the contravariant Drinfeld dictionary remain new. |
| 8.1–8.9 | Library fixed submodules, tensor lifts, independence and dimensions are used. Exact-constant semilinear descent and comparison theorems remain explicit. |
| 8.10–8.20 | General entire/restricted series and bounded-zero finiteness are deferred; arithmetic entire series retain the finite coefficient-field condition. Mac Lane's general extension criterion is broader than the algebraic separable-extension API found at the pins. Inverse-twist fundamental matrices and t-module comparison are distinct arithmetic targets. |
| 8.21–8.34 | General generated tensor subcategory subsection deleted in favor of MotivesAndAlgebraicCycles §6.3. §8.21 is explicitly over any field, including characteristic `p`, whereas the supplier's pure-Tate example is rational. Tannakian reconstruction is imported, not replanned. Difference-ring descent, torsor and motivic identification are the new results. |
| 8.35–8.42 | Quantitative two-radius growth is retained; bounded-zero finiteness is deferred to NewtonPolygons §5.3. Scheme dimension theory alone does not give Hilbert–Serre: §8.41 now states the needed full standard-graded theorem in all characteristics. ABP arithmetic lifting and specialization remain new. |
| 8.43–8.51 | The Carlitz logarithm difference equations, particular group kernel, logarithm relations and denominator theorem have no matching target in the current roadmaps or library found by the object audit. General group smoothness, Tannakian tensor-functor criteria and additive-group cohomology are imported. |

Actual declarations inspected include Tau Ceti
`TauCeti.PowerSeries.IsDistinguished.existsUnique_isUnit_isMonicOfDegree_mul_eq`,
`TauCeti.PowerSeries.isUnit_iff_isDistinguished_zero`,
`TauCeti.PowerSeries.isPrincipalIdealRing_isRestricted_subring`, the Fitting-ideal
base-change theorem, and finite-type geometrically reduced Hopf-algebra
smoothness. At the pins inspected `TauCeti.AdditiveGroup.gaPointsMulEquiv`,
`TauCeti.CommHopfAlgCat.kernelSpec` and Mathlib's `SkewPolynomial/Basic`.
The remote ReductiveGroupsPartII supplier retains the q-Lang theorem
§3.7; ReductiveGroups defers it there. The remote SchemeAndStackFoundations
§1.17 has the finite-projective quotient target actually needed; its §0.7
has dimension theory, not the Hilbert polynomial theorem.

**Deletions, with renumbering.** Original §8.11 (general one-variable Tate-algebra
Weierstrass factorization and PID) and original §8.22 (general tensor-generated
subcategory) are removed as targets. Their semantic anchors are retained only
in boundaries and point to the supplying contracts. Final DM.8 ends at §8.51.
No `(removed)` subsection or duplicate summary entry remains. No target is
claimed absent solely because its proposed Lean name was not found.

## Adversarial mathematics pass

The following table covers all 136 final target subsections, including their
listed APIs; Checks in the README record further instances. A retained row
means that the displayed edge case agrees with the target, not that the target
has been formally proved. Finite fields have `q≥2`; `q=1` is impossible, and
rank-zero exceptions are handled explicitly. All divisions involving a
parameter, leading coefficient, determinant, period or exponential logarithm
radius have their nonvanishing or size hypotheses. The characteristic-two
sign checks use subtraction in the field rather than an integer sign rule.

| Section / target | Instances and computation | Disposition |
| --- | --- | --- |
| §0.1 Drinfeld modules (`DrinfeldModule`) | Scalar action fails; t↦τ in special characteristic has characteristic (t), not zero. | Retained characteristic-map convention. |
| §0.2 Rank over the polynomial ring (`DrinfeldModule.natDegree_eq_rank_mul`) | a=1 has degree zero; C_(t²)=θ²+(θ+θ^q)τ+τ²; division by 1 has zero remainder. | Added right division, nonzero divisor and zero-remainder disjunction. |
| §0.3 The general rank theorem (`DrinfeldModule.exists_rank`) | δ>1 multiplies the pole order; nonprincipal ideals have projective rank one. | Repaired commuting module action and right-division prerequisite; rank stays integral. |
| §0.4 The rank invariant (`DrinfeldModule.rank`) | Carlitz rank 1; τ² rank 2; δr is the wrong normalization. | Retained field and relative ranks distinctly. |
| §0.5 The Carlitz module (`carlitz`) | θ=0 gives C_t=τ; q=2 still gives degree-one action. | Retained special characteristic; no transcendence needed for rank. |
| §0.6 Morphisms and isogenies (`DrinfeldModule.Hom`) | Identity intertwines; zero intertwines but is not an isogeny; a nonzero constant is an isomorphism only when it intertwines. | Retained intertwining and nonzero conditions. |
| §0.7 Rank invariance and separability of isogenies (`DrinfeldModule.rank_eq_of_isogeny`) | τ on φ_t=τ² is inseparable; a nonzero constant has derivative itself. | Generic characteristic is necessary for automatic separability. |
| §0.8 Kernels of isogenies (`DrinfeldKernel`) | Constant nonzero kernel has order 1; τ kernel is α_q; zero map has infinite kernel. | Retained group-scheme kernel, not just geometric points. |
| §0.9 Relative Drinfeld modules (`RelativeDrinfeldModule`) | A line trivialization rescales coefficient i by u^(1−q^i); unit leading term remains a unit. | Retained line bundle and locally constant rank. |
| §0.10 Standardization over nonreduced bases (`RelativeDrinfeldModule.standardize`) | Dual-number nonlinear unit 1+ετ gives a nonstandard conjugate; degree-zero units still must intertwine. | Corrected test distinguishing arbitrary units from intertwining isomorphisms. |
| §0.11 Carlitz denominator products (`carlitzD`, `carlitzEll`) | D_0=ℓ_0=1; ℓ_1=−D_1, also when p=2; θ^q=θ makes D_1 zero. | Retained ring-level products; analytic nonvanishing uses norm q later. |
| §2.1 Coefficient Frobenius twist (`coefficientTwist`) | t is fixed; c maps to c^(1/q); twisting t−θ gives t−θ^(1/q). | Retained inverse coefficient twist and perfectness. |
| §2.2 The field `C_∞` (`CInfty`) | F(θ) completion has norm θ=q; residue degree δ remains arbitrary. | Retained normalized completion and extended norm. |
| §2.3 Projective `A`-lattices (`ALattice`) | A and a nonprincipal ideal are rank-one lattices; zero lattice is rank zero. | Retained projective rather than free general-A lattice. |
| §2.4 The exponential of a lattice (`ALattice.exp`) | Zero lattice gives z; coefficient of z is 1; scaling a lattice scales the exponential argument. | Retained normalized product, entire evaluation and derivative. |
| §2.5 The Drinfeld module of a lattice (`ALattice.drinfeldModule`) | a=1 gives X; nonzero constant a gives aX; leading factor cannot be omitted. | Retained a-normalized finite product. |
| §2.6 Drinfeld's uniformization theorem (`DrinfeldModule.uniformization`) | A nonprincipal ideal uniformizes a rank-one module without acquiring a free kernel. | Retained projective general-A kernel and normalized derivative. |
| §2.7 Morphisms under uniformization (`DrinfeldModule.homEquivLattice`) | Λφ=A, Λψ=t⁻¹A, c=1: expψ on Λψ would give only zero roots. | Repaired to expφ(c⁻¹Λψ/Λφ), with derivative c; c=0 treated separately. |
| §2.8 Carlitz exponential and logarithm (`carlitzExp`, `carlitzLog`) | Origin maps to 0; first coefficients are D_1⁻¹ and −D_1⁻¹; logarithm fails on boundary radius. | Retained strict radius and both functional equations. |
| §2.9 The Carlitz period (`carlitzPeriod`) | q=2 has ρ=θ, nonzero period of norm 4; rescaling ρ rescales period. | Retained root choice and F× ambiguity. |
| §2.10 The Anderson–Thakur function (`carlitzOmega`) | Ω(0)=ρ⁻q; inverse twist gives (t−θ)Ω; Ω(θ)≠0. | Retained normalization and inverse period specialization. |
| §2.11 The invariant period power (`carlitzPeriod_pow`) | q=2 gives exponent q−1=1 and period in K∞; changing ρ by F× does not change π^(q−1). | Retained invariant power, not a canonical period root. |
| §4.1 Anderson t-modules (`TModule`) | Dimension zero is allowed; scalar positive-dimensional t-module has nilpotent part zero but is not abelian. | Retained derivative and separate finiteness condition. |
| §4.2 Effective `A`-motives (`EffectiveAMotive`) | Carlitz has cokernel dimension 1; τ=1 has dimension 0; support at J alone does not impose skew freeness. | Retained projectivity, injectivity and J-power annihilation separately. |
| §4.3 The motive of a t-module (`TModule.motive`) | τ·1=(t−θ)·1; composition reverses an intertwiner's direction. | Retained contravariant Hom-to-Ga action. |
| §4.4 The abelian anti-equivalence (`TModule.motive_fullyFaithful`) | C^⊗n reconstructs from τ=(t−θ)^n; for nonpolynomial A freeness is over R{τ}, not A_L. | Scoped displayed polynomial basis; retained general anti-equivalence. |
| §4.5 Purity and weights (`EffectiveTMotive.IsPure`) | Zero motive is pure for every ratio; rank-one Carlitz powers have weight n. | Added positive rank for weight d/r and positive-rank tensor factors. |
| §4.6 Uniformizable t-modules (`TModule.IsUniformizable`) | Scalar Φ_t=θI has exp=id and is surjective despite nonabelianness; zero map has wrong derivative. | Extended exponential existence to all t-modules. |
| §4.7 Carlitz tensor powers (`carlitzTensor`) | n=1 is θ+τ; n=2 gives (θx+y,θy+x^q); n=0 is the zero object, not a positive-rank weight example. | Moved uniformizability proof to §8.18; algebraic construction stays earlier. |
| §4.8 Effective dual t-motives (`EffectiveDualTMotive`) | σ=(t−θ)^n has cokernel dimension n; forward Frobenius would give the wrong coefficient relation. | Retained perfect-field inverse-twist and independent A-finiteness. |
| §4.9 The star anti-isomorphism (`oreStar`) | (τa)*=aσ but τ* a*=a^(1/q)σ; d'×d becomes d×d'. | Retained multiplication reversal, transpose and covariant row map. |
| §4.10 Invariant factors over a discretely valued skew field (`SkewLaurent.lastInvariantFactor_slopes`) | D=0 and nilpotent Jordan block; scalar θ of slope 0; diag(1,σ) modulo σ²; noncommuting t−c. | Fixed nilpotent exception, left ideal, summand dimension and modular-rank meaning. |
| §4.11 Dual motives and t-module points (`TModule.dualRealization`) | Carlitz quotient gives x↦θx+x^q; the L-span of (σ−1)H gives the wrong quotient. | Retained F-linear quotient and corrected slope criterion input. |
| §4.12 Pre-t-motives (`PreTMotive`) | Unit has dimension 1; Hom(1,C)=0 by degree; zero object is admitted. | Retained K-rational semilinear category, duals and tensor/Hom rules. |
| §1.1 Finite shtukas and Drinfeld's functor (`FiniteShtuka`, `FiniteShtuka.drinfeldGroup`) | F=0 gives X^q and F=1 gives X^q−X; rank zero gives the trivial group. | Retained strict finite-F deformation action; positive-rank qualifier for nilpotence test. |
| §1.2 The finite shtuka equivalence (`FiniteShtuka.antiEquivalence`) | Invertible c gives étale X^q−cX; c=0 gives connected α_q; rank zero has order 1. | Retained linearization criterion and contravariant equivalence. |
| §1.3 The semilinear Lang lemma (`semilinear_lang`) | L=F(t)^sep, raw q-power not onto but its linearization invertible; fixed vectors are F. | Corrected invertibility hypothesis; no perfection silently assumed. |
| §1.4 Ideal torsion (`DrinfeldModule.idealTorsion`) | Unit ideal has zero torsion group; zero ideal would give all of E and is excluded. | Retained nonzero ideals and scheme-theoretic intersection. |
| §1.5 Torsion is finite locally free (`DrinfeldModule.idealTorsion_finiteLocallyFree`) | Nonprincipal I gives degree #(A/I)^r; unit ideal gives degree 1. | Retained finite-local-freeness independently of principal coordinates. |
| §1.6 Torsion is étale away from the characteristic (`DrinfeldModule.idealTorsion_etale_iff`) | C_t=τ is connected at (t), étale at (t−1); zero Anderson module is always étale. | Added positive fibre dimension for the iff; derivative scalar plus nilpotent. |
| §1.7 Torsion over separably closed fields (`DrinfeldModule.idealTorsion_free`) | Away from characteristic rank r gives #(A/I)^r points; characteristic torsion loses points. | Retained characteristic exclusion and residue-factor Lang argument. |
| §1.8 Tate modules (`DrinfeldModule.tateModule`) | Carlitz Tate rank 1; z↦uz rescales level-n coordinates by u⁻n. | Separated canonical division-module evaluation from chosen coordinates. |
| §1.9 The Tate representation (`DrinfeldModule.tateGaloisAction`) | Separably closed L gives trivial action; finite-field Frobenius generally acts nontrivially. | Retained continuity via finite torsion, not a discrete topology on the limit. |
| §1.10 Local shtukas and divisible local Anderson modules (`LocalShtuka`) | Residue degree f=1 uses τ; f>1 uses τ^f on the characteristic factor. | Retained every residue factor and equal-characteristic local parameter. |
| §1.11 The local shtuka equivalence (`LocalShtuka.antiEquivalence`) | τ=1 is constant étale height 1, dimension 0; τ=z−γ(z) is dimension 1. | Retained effective support condition and nilpotent characteristic parameter. |
| §1.12 The realization at the characteristic place (`DrinfeldModule.charLocalRealization`) | φ_t=τ² has connected t^n-torsion of order q^(2n), even though geometric points vanish. | Retained full finite-flat characteristic realization. |
| §3.1 Level structures (`DrinfeldLevel`) | Full (t)-level is an F-basis of ker φ_t away from (t); this fails at characteristic (t). | Retained level-open hypothesis and scheme-valued level structure. |
| §3.2 Fine moduli schemes (`DrinfeldModuli.fine`) | Rank 1 has relative dimension 0; rank 2 has relative dimension 1; level primes are removed. | Retained fine subgroup and good-open smoothness scope. |
| §3.3 The moduli stack (`DrinfeldModuli`) | Carlitz unlevelled stabilizer is F×; full nontrivial level kills it (q=2 already trivial). | Retained stack rather than a universal unlevelled scheme. |
| §3.4 Generalized Drinfeld modules (`GeneralizedDrinfeldModule`) | θ+τ+gτ² drops from rank 2 to rank 1 at g=0; scalar-only fibres excluded. | Retained rank upper bound and positive lower fibre rank. |
| §3.5 The reciprocal model (`DrinfeldReciprocalScheme`) | Rank 1 reciprocal Proj is a point; rank 2 gives P¹ with O(q), Hilbert function 1+qn. | Added direct normality proof route and explicit grading reversal. |
| §3.6 Pink's Satake compactification (`DrinfeldSatake`) | Rank 1 compactification adds no boundary; rank 2 has cusps and cannot be unchanged affine moduli. | Retained normal projective compactification and extended generalized family. |
| §3.7 Section rings of ample line bundles (`sectionRing_proj_iso`) | P¹,O(1) gives polynomial ring; Spec DVR,O has nonzero negative sections and normal R[T]. | Removed false negative-degree vanishing; included dimension zero. |
| §3.8 Algebraic Drinfeld modular forms (`DrinfeldModularForm`) | Weight 0 gives global functions; rank 2 level (t) has dim M_k=qk+1 and S_k=qk−q for k≥1. | Retained full graded ring, not only a high Veronese. |
| §3.9 Hecke correspondences and operators (`DrinfeldHecke`) | g=1 gives identity; multiplying g on both sides by level elements leaves correspondence unchanged. | Retained trace/pullback orientation and finite correspondence hypotheses. |
| §3.10 The arithmetic Satake compactification (`DrinfeldSatake.integral`) | Polynomial level (t) seed over F[t,1/t]; keeping bad level primes is outside the assertion. | Retained projective flat model; no special-fibre normality or flat level map asserted. |
| §5.1 Rational motives and their Tate realization (`AMotive.rationalTate`) | Zero-Frobenius L[t]/(t−θ) has no A-annihilator in generic characteristic; ℓ_z(z⁻¹)=1 and zℓ_z is not a basis. | Added two-support scalar-annihilator target and canonical residue-dual pairing. |
| §5.2 The Tate Hom map (`DrinfeldModule.tateHomMap`) | Identity realizes as identity; Hom between nonprincipal ideal lattices need not be free. | Corrected finite-free to finite-projective globally. |
| §5.3 Saturation of the Tate image (`DrinfeldModule.tateHomMap_saturated`) | Local generator z works at a nonprincipal prime; divisibility on every finite torsion level forces factorization through torsion quotient. | Repaired localized saturation proof, not a chosen global generator. |
| §5.4 Injectivity of the Tate comparison (`DrinfeldModule.tateHomMap_injective`) | A nonzero constant acts nontrivially; being divisible by all λ^n forces zero in separated completed Hom. | Separated injectivity proof from finite-generation theorem. |
| §5.5 The Tate period ring (`TatePeriodRing`) | z fixed; coefficient x in L=F(x) not fixed; Σxⁿzⁿ unbounded at infinity but rational in localization. | Included all extended valuations and corrected multiplicative set. |
| §5.6 Local algebraization (`AMotive.localAlgebraization`) | For finite coefficient L the two local rings coincide; transcendental coefficient requires algebraization. | Retained admissibility and actual distinct coefficient rings. |
| §5.7 The Tate theorem for Drinfeld modules (`DrinfeldModule.tateHomMap_bijective`) | Over finite L the RHS is a Frobenius centralizer; inseparable characteristic torsion is not a substitute for λ≠char. | Retained finitely generated field and away-prime hypotheses. |
| §5.8 Drinfeld motives are simple (`DrinfeldModule.motive_isSimple`) | A nonzero subobject gives a finite-dimensional quotient L{τ}/L{τ}f; an inseparable auxiliary action could change characteristic. | Replaced characteristic-shifting argument by equal-rank scalar isogeny. |
| §5.9 Semisimplicity of rational Tate modules (`DrinfeldModule.rationalTate_isSemisimple`) | Direct sum of simple motives realizes semisimply; integral Tate lattices need not be semisimple. | Retained rational semisimplicity, not integral splitting. |
| §6.1 Monic cardinalities (`finiteModuleCardinality`) | Zero module has monic cardinality 1; F[t]/(t²+t+1) gives T²+T+1. | Retained characteristic polynomial normalization and multiplicativity. |
| §6.2 Taelman's integral models (`TaelmanModel`) | Carlitz has good reduction; scalar model rank 0 is admitted; bad leading coefficient does not remove a local factor. | Retained all finite primes of the integral model. |
| §6.3 Nuclear determinants on compact `F`-vector spaces (`FiniteFieldNuclearDet`) | Zero operator series gives determinant 1; finite-dimensional case is det(1+Θ), fixing sign. | Retained local contraction and compact finite-F setting. |
| §6.4 The trace formula (`TaelmanModel.traceFormula`) | Θ=(1−E_t/T)/(1−θ/T)−1 inverts the local L-factor; swapping numerator reverses product. | Retained reciprocal Euler-product orientation. |
| §6.5 The `L`-value of an integral model (`TaelmanModel.lValue`) | Scalar model gives L=1; Carlitz good-prime local ratio is #(R/m)/#C(R/m). | Retained convergence in 1+T⁻¹F[[T⁻¹]]. |
| §6.6 The unit lattice (`TaelmanModel.units`) | Scalar model has U=R; Carlitz unit lattice generated by log_C(1). | Retained exp⁻¹(E(R)), not kernel alone. |
| §6.7 The class module (`TaelmanModel.classModule`) | Scalar model H=0 and cardinality 1; the q=2 bad-reduction example has H≠0. | Retained full quotient by integral points and exponential image. |
| §6.8 Normalized covolumes (`latticeCovolume`) | [A:A]=1; [A:θA]=T; [θA:A]=T⁻¹. | Retained monic determinant ratio and orientation. |
| §6.9 Infinitely tangent maps (`InfinitelyTangent`) | Identity has Δ=0; finite-module enlargement uses a piecewise F-linear map, not one linear over K∞. | Verified all-orders tangency and finite-factor extension. |
| §6.10 The tangent determinant identity (`tangentDelta_det`) | Identity quotient map gives determinant 1; adding a finite module multiplies by its monic characteristic polynomial. | Retained covolume and class-factor orientation. |
| §6.11 Taelman's class formula (`TaelmanModel.classFormula`) | Scalar case gives 1=1; Carlitz gives ζ_A(1)=log_C(1). | Retained class-module factor rather than assuming H=0. |
| §6.12 Depth-one Carlitz power sums (`carlitzPowerSum_eq`) | d=0 gives 1; q=2,d=1,s=3 gives an extra numerator θ²+θ+1. | Retained 1≤s≤q and sign ℓ_1=θ−θ^q. |
| §6.13 The Carlitz module and a nonzero class module (`TaelmanModel.carlitz_classFormula`) | q=2,E_t=θ+θ³τ gives E_t(θ⁻¹)=1+θ, \|H\|=T and regulator leading T⁻¹. | Retained nonzero class module and verified resulting L-value. |
| §7.1 Elliptic sheaves (`EllipticSheaf`) | Carlitz chain O(i); r=2,δ=1 period 2; disjoint union τ^n has no global shift bound. | Changed Hom to locally bounded shifts, with a global bound on qc bases. |
| §7.2 Normalized elliptic sheaves (`NormalizedEllipticSheaf`) | O(−1) on P¹ has H⁰=H¹=0; O has one section; twist normalization changes first index. | Retained Euler characteristic plus transversality. |
| §7.3 The elliptic sheaf of a Drinfeld module (`DrinfeldModule.ellipticSheaf`) | Carlitz motive gives O(i), τ factor t−θ; nonrational infinity period is rδ. | Retained residue-factor line condition and contravariant direction. |
| §7.4 The elliptic sheaf dictionary (`DrinfeldModule.ellipticSheafEquiv`) | Point-line generator is dual to section generator; nonaffine S cannot be reconstructed from Γ(S,−) alone. | Replaced global-section inverse by sheaf pushforward; locally bounded morphisms. |
| §7.5 The two-leg shtuka of an elliptic sheaf (`EllipticSheaf.shtukaDatum`) | Carlitz modification factor t−θ gives characteristic zero and infinity pole; reversing it interchanges legs. | Retained two-leg, not one-leg, shtuka export. |
| §7.6 Tate modules from elliptic sheaves (`EllipticSheaf.tateDual`) | Carlitz motive character is inverse to point character; rescaling parameter changes ordinary scalar duality. | Corrected canonical target to residue-dual line. |
| §7.7 The characteristic place for elliptic sheaves (`EllipticSheaf.charLocalShtuka`) | Connected τ²-torsion survives local comparison although geometric Tate points vanish. | Retained finite-flat characteristic comparison with τ^f. |
| §8.1 Fixed coefficients of fixed combinations (`coeff_fixed_of_sum_fixed`) | Conjugation on C has exact constants R; with σ=id and F=R the conclusion fails. | Retained exact constants and independence hypotheses. |
| §8.2 Descent of spans of fixed vectors (`mem_span_iff_of_fixed`) | Fixed part of C-span of 1 is R; dropping fixedness allows 1 and i. | Retained both fixedness and scalar-field distinction. |
| §8.3 Independence of finite fixed families (`linearIndependent_of_fixed_fin`) | n=0 empty family; n=1 nonzero vector in either field. | Retained all finite n without positive-rank assumption. |
| §8.4 Linear independence of fixed vectors (`linearIndependent_of_fixed`) | Infinite indexing allowed; σ=id on C over R violates exact constants. | Retained arbitrary-family statement with both hypotheses. |
| §8.5 Injectivity of the Betti comparison (`bettiComparison_injective`) | C⊗R R→C is injective; zero module has zero comparison. | Retained tensor domain and absence of unnecessary surjectivity claim. |
| §8.6 The fixed space is finite-dimensional (`fixedSubmodule_finiteDimensional`) | Conjugation fixed space dimension 1; zero ambient module has dimension 0. | Retained finite-dimensional ambient hypothesis. |
| §8.7 The dimension bound (`finrank_fixedSubmodule_le`) | Conjugation gives equality 1=1; zero fixed space gives 0≤r. | Retained distinct base fields in finrank comparison. |
| §8.8 The dimension criterion (`bettiComparison_bijective_iff`) | Identity over Q and conjugation have bijective comparison; unequal dimensions fail. | Retained dimension criterion after injectivity. |
| §8.9 Constant coordinates in a fixed basis (`fixed_iff_exists_unique_coords`) | Conjugation basis (1) has fixed coordinates exactly R; coefficient i is not fixed. | Retained unique constant coordinates. |
| §8.10 Arithmetic entire series (`IsArithmeticEntire`) | Zero and polynomials are arithmetic entire; an arbitrary infinite coefficient extension need not meet arithmetic finiteness. | Kept the arithmetic refinement, deferred ordinary entire series. |
| §8.11 Limits of Frobenius twists (`tendsto_twist_iterate`) | A constant in F_(q²) needs twist subsequence step 2; q=2 causes no sign exception. | Retained residue coefficient field and suitable iterate. |
| §8.12 Constants of the analytic rings (`fixedPoints_tateAlgebra`) | t and 1/(t−1) fixed; a nonconstant coefficient outside F_q is not fixed. | Retained polynomial versus rational fixed-ring distinction. |
| §8.13 Separability and geometric reducedness (`isSeparable_iff_not_exists_pthRoot`) | κ(t^(1/p))/κ(t) inseparable; perfect base has no missing pth roots. | Retained general extension criterion and geometric reducedness. |
| §8.14 The analytic difference fields (`analyticTower_admissible`) | Identity on the analytic fraction field has too many constants. | Retained actual inverse Frobenius and admissibility requirements. |
| §8.15 Rigid analytic triviality (`IsRigidAnalyticallyTrivial`) | Unit motive is trivial; zero object has rank-zero comparison. | Retained comparison isomorphism definition, not mere dimension inequality. |
| §8.16 Fundamental matrices (`IsFundamentalMatrix`) | Φ=Ψ=I is fundamental; zero Ψ is not fundamental in positive rank; rank 0 determinant 1. | Retained determinant condition and twist direction. |
| §8.17 Fundamental matrices and Betti bases (`isRigidAnalyticallyTrivial_iff_exists_fundamental`) | Unit basis gives Ψ=1; changing basis multiplies by a constant matrix on the right. | Retained row/column convention and fixed-field basis. |
| §8.18 Anderson's uniformizability criterion (`TModule.isUniformizable_iff`) | Scalar module is uniformizable but criterion assumes abelian; C^⊗n has Ω^n. | Repaired finite torsion duality and earlier/later dependency ordering. |
| §8.19 Integral trivializations (`exists_fundamental_tate`) | Ω is a Tate-algebra unit; t−a is not a unit when \|a\|≤1. | Retained integral GL, not merely nonzero determinant over fraction field. |
| §8.20 Exactness and tensor compatibility of the Betti realization (`betti_exact_tensor`) | C⊗C∨ has matrix ΩΩ⁻¹=1; zero exact sequence stays exact. | Retained exact tensor realization and dual compatibility. |
| §8.21 Graded vector spaces and `G_m` (`gradedVect_tannakaGroup`) | Degree zero is trivial, degree 1 has character a, degree −1 character a⁻¹, in characteristic p too. | Kept general-field equivalence distinct from rational pure-Tate variant. |
| §8.22 The neutral Tannakian category of t-motives (`tMotives_neutralTannakian`) | Unit and Carlitz lie in the category; duals/subquotients required, not just tensors. | Imports general generated-category construction; removed duplicate target. |
| §8.23 Admissible difference fields (`IsAdmissibleTower`) | Q⊂Q⊂Q with identities is admissible; identity on a larger extension need not have exact constants. | Retained full separability and constant-field conditions. |
| §8.24 Solution spaces (`solutionSpace`) | Identity twist Φ=1 gives all vectors; Φ=0 gives only 0. | Retained genuine solution subspace, with proved negative control. |
| §8.25 The solution ring (`solutionRing`) | Ψ=1 gives the base field; scalar Ψ requires adjoining Ψ⁻¹. | Retained determinant localization and basis-change invariance. |
| §8.26 The comparison algebra (`comparisonAlgebra`) | Ψ=1 gives D=1 and Δ=F0; swapping factors inverts D. | Retained tensor-factor order and Hopf structure. |
| §8.27 Invariant ideals descend (`invariantIdeal_descent`) | Zero and unit ideals descend to themselves; invariance means equality, not one-sided containment. | Verified exact constant-field and ideal hypotheses. |
| §8.28 The solution ring is difference-simple (`solutionRing_simple`) | Trivial solution ring is a field; a nonzero stable proper ideal would contradict minimal support. | Verified difference-simple, not ordinary simple as a field claim. |
| §8.29 Ideal descent over the solution ring (`solutionRing_invariantIdeal_descent`) | S=K1 reduces to §8.27; arbitrary base algebra permits zero/unit ideals. | Retained descent over the solution ring and all base algebras. |
| §8.30 The difference Galois group and its torsor (`differenceGaloisGroup`) | Trivial system has trivial group and point torsor; inversion sends D to D⁻¹. | Retained group scheme and torsor, not just field-valued automorphisms. |
| §8.31 `k̄(t)` is relatively closed in the solution field (`algebraicClosure_solutionField`) | Unit solution field equals kbar(t); Ω case is a one-variable transcendental field. | Retained relative algebraic closure in the solution field. |
| §8.32 Smoothness and dimension of the difference group (`differenceGaloisGroup_dim`) | Trivial system has dimension 0; inseparable field examples show why geometric reducedness is needed. | Retained all separability inputs before Hopf smoothness. |
| §8.33 The difference Galois action and its invariants (`differenceGalois_fixedField`) | Trivial system fixes everything in the base; right multiplication must preserve Φ-equation. | Retained difference automorphism group and fixed base field. |
| §8.34 The difference group is the motivic Galois group (`differenceGaloisGroup_eq_motivic`) | Unit gives trivial groups on both sides; tensor relations, not just entries, determine the identification. | Imports reconstruction and proves the comparison rather than replanning it. |
| §8.35 Restricted solutions are entire (`isArithmeticEntire_of_twist_eq`) | Ω solves ψ^(-1)=(t−θ)ψ and is entire; restricted analytic alone is insufficient. | Retained polynomial-coefficient arithmetic hypothesis. |
| §8.36 Zero counts and growth of entire functions (`entire_norm_le_of_zeros`) | f=z^N makes the two-radius estimate equality; zero function excluded from finite-zero statement. | Retained quantitative estimate and deferred bounded-zero finiteness. |
| §8.37 Arithmetic estimates for the ABP criterion (`abp_size_estimates`) | d=1, nonzero polynomial x has \|x\|≥1; x=0 excluded from lower bounds. | Retained nonzero denominators and field-degree exponents. |
| §8.38 The Anderson–Brownawell–Papanikolas criterion (`abp_lifting`) | Rank-one Ω(θ)≠0 has only zero scalar relation; determinant c(t−θ)^s needs c≠0. | Retained polynomial lifting with its exact determinant condition. |
| §8.39 Specialization preserves relation rank (`rank_relations_eq`) | Single Ω gives rank 1 at generic and special points; zero solution gives rank 0. | Retained module relation rank, not an equality of relation sets. |
| §8.40 Bounded monomial spans (`degreeSpan`) | d=0 and empty generators still contain 1; negative degrees are not used. | Retained bounded degree ≤d, not exactly d. |
| §8.41 Growth of bounded monomial spans (`finrank_degreeSpan_eventually_poly`) | k gives constant 1; k[x] gives d+1; k[x,y] gives (d+1)(d+2)/2; Artinian graded ring has zero high-degree Hilbert polynomial. | Added full standard-graded theorem and ℚ coefficients in characteristic p. |
| §8.42 Papanikolas's period theorem (`trdeg_periods_eq_dim`) | Unit: trdeg=dim=0; Carlitz: both 1, Ω(θ)=−1/π̃. | Retained algebraic base field and specialized period field. |
| §8.43 Deformations of Carlitz logarithms (`carlitzLogDeformation`) | α=0 gives zero deformation; α=1 constant term is log_C(1) in its convergence range. | Retained strict size bound and signed difference equation. |
| §8.44 The logarithm extension (`logPhi`, `logPsi`) | r=0 gives Carlitz; lower-left entry satisfies Ω^(-1)L^(-1)=(t−θ)Ω(α^(-1)+L). | Retained lower-triangular orientation and specialization. |
| §8.45 The logarithm extension is a t-motive (`logMotive_mem`) | r=0 gives C^⊗2 before twisting back; α_i=0 still gives split extensions. | Added finite generation before ABP freeness. |
| §8.46 The Carlitz motivic Galois group (`carlitz_galoisGroup`) | Carlitz has endomorphism field F_q(t); its group cannot be finite since Ω is transcendental. | Retained G_m with weight-one character. |
| §8.47 The logarithm group (`logGaloisGroup_linear`) | r=0 kernel 0; a=t has infinite order; conjugation of diag(a,I) yields any lift; Frobenius on G_m is a smooth-group surjection with zero differential. | Added explicit cyclic-closure section, avoiding false general separability inference. |
| §8.48 Linear relations among logarithms (`dim_logGaloisGroup_eq`) | r=0 leaves kπ̃ and group dimension 1; relation constant b0=−Σb_iL_i. | Verified relation sign and count including π̃. |
| §8.49 Reduction to small logarithms (`carlitzLog_division`) | A period has exponential 0 and is reduced using the lattice; division by t alone does not cover it. | Retained period-lattice branch separately from small-logarithm lemma. |
| §8.50 Algebraic independence of Carlitz logarithms (`algebraicIndependent_carlitzLog`) | r=0 is empty independence; a single nonzero period qualifies; dependent logarithms are excluded. | Retained algebraic exponentials and linear independence over F(θ). |
| §8.51 Frobenius-invariant denominators (`denominator_mem_constants`) | B=1/t, Φ1=Φ2=1 has fixed denominator t; t−θ is not fixed. | Retained monic constant-field denominator and polynomial matrix hypotheses. |


## Fidelity and gap reconciliation

The following mapping covers every input node, including the two nodes now
discharged by boundary imports. Semantic anchors were checked after renumbering;
no target was dropped to reduce size. Additional local prerequisite targets
resolve missing interfaces rather than weakening end theorems.

| Packet node (roadmap prefix omitted) | Final README location |
| --- | --- |
| `DM.0/drinfeld-module` | §0.1 |
| `DM.0/rank-polynomial-ring` | §0.2 |
| `DM.0/rank-general` | §0.3 |
| `DM.0/rank` | §0.4 |
| `DM.0/carlitz-module` | §0.5 |
| `DM.0/drinfeld-module-hom` | §0.6 |
| `DM.0/isogeny-rank` | §0.7 |
| `DM.0/kernel-scheme` | §0.8 |
| `DM.0/relative-drinfeld-module` | §0.9 |
| `DM.0/relative-standardization` | §0.10 |
| `DM.0/carlitz-products` | §0.11 |
| `DM.1/ideal-torsion` | §1.4 |
| `DM.1/finite-flat-torsion` | §1.5 |
| `DM.1/etale-torsion` | §1.6 |
| `DM.1/geometric-torsion-basis` | §1.7 |
| `DM.1/tate-module` | §1.8 |
| `DM.1/continuous-galois-action` | §1.9 |
| `DM.1/characteristic-local-realization` | §1.12 |
| `DM.2/c-infinity` | §2.2 |
| `DM.2/a-lattice` | §2.3 |
| `DM.2/lattice-exponential` | §2.4 |
| `DM.2/lattice-drinfeld-module` | §2.5 |
| `DM.2/uniformization` | §2.6 |
| `DM.2/exponential-morphisms` | §2.7 |
| `DM.2/carlitz-exponential` | §2.8 |
| `DM.2/carlitz-period` | §2.9 |
| `DM.2/omega` | §2.10 |
| `DM.2/period-power` | §2.11 |
| `DM.3/level-structure` | §3.1 |
| `DM.3/moduli-functor` | §3.3 |
| `DM.3/fine-moduli-scheme` | §3.2 |
| `DM.3/generalized-drinfeld-module` | §3.4 |
| `DM.3/satake-compactification` | §3.6 |
| `DM.3/reciprocal-compactification` | §3.5 |
| `DM.3/modular-forms` | §3.8 |
| `DM.3/hecke-correspondence` | §3.9 |
| `DM.3/integral-compactification` | §3.10 |
| `DM.4/t-module` | §4.1 |
| `DM.4/effective-a-motive` | §4.2 |
| `DM.4/contravariant-motive` | §4.3 |
| `DM.4/abelian-antiequivalence` | §4.4 |
| `DM.4/purity` | §4.5 |
| `DM.4/uniformizability` | §4.6 |
| `DM.4/carlitz-tensor-power` | §4.7 |
| `DM.4/inverse-twist-dual-motive` | §4.8 |
| `DM.4/star-adapter` | §4.9 |
| `DM.4/dual-realization` | §4.11 |
| `DM.5/rational-motive-realization` | §5.1 |
| `DM.5/tate-hom-map` | §5.2 |
| `DM.5/tate-injectivity` | §5.4 |
| `DM.5/local-algebraization` | §5.6 |
| `DM.5/period-ring` | §5.5 |
| `DM.5/tate-image-saturation` | §5.3 |
| `DM.5/tate-surjectivity` | §5.7 |
| `DM.5/tate-semisimplicity` | §5.9 |
| `DM.6/fitting-polynomial` | §6.1 |
| `DM.6/integral-model` | §6.2 |
| `DM.6/euler-l-value` | §6.5 |
| `DM.6/unit-lattice` | §6.6 |
| `DM.6/class-module` | §6.7 |
| `DM.6/lattice-covolume` | §6.8 |
| `DM.6/nuclear-determinant` | §6.3 |
| `DM.6/trace-formula` | §6.4 |
| `DM.6/tangent-comparison` | §6.9 |
| `DM.6/tangent-determinant` | §6.10 |
| `DM.6/class-number-formula` | §6.11 |
| `DM.6/small-power-sum` | §6.12 |
| `DM.6/carlitz-class-examples` | §6.13 |
| `DM.7/elliptic-sheaf` | §7.1 |
| `DM.7/normalized-elliptic-sheaf` | §7.2 |
| `DM.7/drinfeld-to-sheaf` | §7.3 |
| `DM.7/elliptic-antiequivalence` | §7.4 |
| `DM.7/shtuka-export` | §7.5 |
| `DM.7/tate-realization` | §7.6 |
| `DM.7/characteristic-comparison` | §7.7 |
| `DM.8/fixed-coefficients` | §8.1 |
| `DM.8/fixed-span-descent` | §8.2 |
| `DM.8/finite-fixed-independence` | §8.3 |
| `DM.8/fixed-independence` | §8.4 |
| `DM.8/betti-comparison-injective` | §8.5 |
| `DM.8/fixed-space-finite` | §8.6 |
| `DM.8/fixed-dimension-bound` | §8.7 |
| `DM.8/betti-comparison-dimension` | §8.8 |
| `DM.8/fixed-basis-coordinates` | §8.9 |
| `DM.8/coefficient-twist` | §2.1 |
| `DM.8/entire-series` | §8.10 |
| `DM.8/tate-analytic-interface` | Scope and ownership (supplier import) |
| `DM.8/twisting-limit` | §8.11 |
| `DM.8/analytic-fixed-fields` | §8.12 |
| `DM.8/analytic-separability` | §8.14 |
| `DM.8/rigid-triviality` | §8.15 |
| `DM.8/fundamental-matrix` | §8.16 |
| `DM.8/fundamental-betti-basis` | §8.17 |
| `DM.8/integral-trivialization` | §8.19 |
| `DM.8/betti-exact-tensor` | §8.20 |
| `DM.8/neutral-category` | §8.22 |
| `DM.8/admissible-fields` | §8.23 |
| `DM.8/solution-space` | §8.24 |
| `DM.8/solution-ring` | §8.25 |
| `DM.8/comparison-algebra` | §8.26 |
| `DM.8/invariant-ideal-descent` | §8.27 |
| `DM.8/solution-ring-simple` | §8.28 |
| `DM.8/solution-invariant-ideal-descent` | §8.29 |
| `DM.8/difference-torsor` | §8.30 |
| `DM.8/relative-algebraic-closure` | §8.31 |
| `DM.8/difference-smooth-dimension` | §8.32 |
| `DM.8/difference-invariants` | §8.33 |
| `DM.8/tannakian-identification` | §8.34 |
| `DM.8/entire-from-equation` | §8.35 |
| `DM.8/abp-estimates` | §8.37 |
| `DM.8/abp-lifting` | §8.38 |
| `DM.8/specialization-rank` | §8.39 |
| `DM.8/degree-span` | §8.40 |
| `DM.8/period-transcendence` | §8.42 |
| `DM.8/carlitz-deformation` | §8.43 |
| `DM.8/logarithm-matrices` | §8.44 |
| `DM.8/logarithm-motive-membership` | §8.45 |
| `DM.8/carlitz-group` | §8.46 |
| `DM.8/logarithm-group-linear` | §8.47 |
| `DM.8/logarithm-linear-relations` | §8.48 |
| `DM.8/logarithm-division` | §8.49 |
| `DM.8/carlitz-logarithm-independence` | §8.50 |
| `DM.8/constant-denominator` | §8.51 |


| Packet gap | Package treatment and review finding |
| --- | --- |
| DM.0 #1 General rank integrality | §§0.2–0.3: right division, finite projective A_L rank, correct degree-δ normalization. |
| DM.0 #2 Nilpotent-base standardization | §0.10: unique normalized nonlinear unit and finite nilpotent induction are explicit local targets. Not identified with a linear frame change. |
| DM.0 #3 Analytic surjectivity / kernel rank | §§2.4–2.6: normalized entire product, Newton/Weierstrass surjectivity and projective general-A kernel-rank proof chain; exact current analytic suppliers. |
| DM.0 #4 Reciprocal normality | §3.5: read PS proof of Theorem 1.7; regular sequence from finite freeness plus independent codimension-one regularity. |
| DM.0 #5 Integral saturation | §§5.2–5.4: finite projective Hom, nonprincipal-prime localization, quotient-isogeny divisibility; injectivity does not depend circularly on finite generation. |
| DM.0 #6 Drinfeld simple motive | §§5.1, 5.8: principal Ore ideal gives equal-rank submotive, scalar factorization inverts its inclusion. The earlier vague reference is replaced. |
| DM.0 #7 Elliptic morphisms / nonrational infinity | §§7.1–7.4: locally bounded maps, sheaf inverse, period rδ and pushforward line; actual Wiedmann definition read. |
| DM.0 #8 Native heavy signatures | Full carriers, support and continuity conditions retained in README; heavy constructions are closing-comment names rather than sorry'd data. This is the required roadmap form, not an implementation claim. |
| DM.0 #9 Valued skew proofs | §§4.10–4.11: §3 of Maurischat read; explicit local invariant-factor and Newton targets, with side, zero-primary and modular-rank repairs. |
| DM.0 #10 Fine charts / deformation | §§3.2–3.3: representability and local chart/deformation proof are local Drinfeld targets, with exact scheme suppliers. HY locators verified; not represented as an existing generic scheme theorem. |
| DM.0 #11 Strict finite shtukas | §§1.1–1.2: finite shtukas, strict F-actions, co-Lie/evaluation and the anti-equivalence are owned here, not attributed to a sites/cohomology layer. |
| DM.0 #12 Equal-characteristic local category | §§1.10–1.12: local shtuka and divisible Anderson category explicitly owned here, preserving all factors and τ^f. No mixed-characteristic substitute. |
| DM.0 #13 Torsion bases and limits | §§1.3, 1.7–1.9: linearized Lang, torsion freeness, parameter-free limits and chosen-coordinate comparison. |
| DM.0 #14 Projective quotient / section ring | Current SchemeAndStackFoundations §1.17 provides projective quotient; §3.7 locally plans and repairs the full normal section-ring comparison. |
| DM.0 #15 Completion / analytic quotient adapters | §§1.8, 1.10, 2.2, 5.1, 6.8 name coefficient, factor, norm, inverse-limit and covolume adapters; no rebuilt AlgebraicCurves completion theory. |
| DM.0 #16 New vector-bundle imports | Exact AlgebraicVectorBundles L0B, L1A–L1B and L2B contracts replace generic integration ids. No registry edits are made in this review. |
| DM.8 #1 Particular kernel separability | §8.47 adds conjugate cyclic-closure torus and differential surjectivity for this group. General smooth surjections are not assumed separable. |
| DM.8 #2 Pre-t-motive category | §4.12 explicitly owns the rational category, kernels, cokernels, tensors, duals and internal Hom before DM.8. |
| DM.8 #3 Analytic / dimension matching | Current RestrictedPowerSeries and NewtonPolygons supply ordinary analysis; §8.13 keeps general Mac Lane criterion and §8.41 adds Hilbert–Serre. Supplier order for the separate Tannakian contract remains uncertified as stated in the verdict. |

The gaps above concern proof or interface closure at roadmap level. Marking a
result as a local target does not claim its Lean implementation already exists.
No gap is discharged merely by a successful `sorry` elaboration.

| Packet request | Exact disposition |
| --- | --- |
| DM.0 #1 AdicSpaces analytic extension | RestrictedPowerSeries §§3.2, 4.3, 5.1–5.2 and NewtonPolygons supply the exact analytic contracts; arithmetic exponential targets stay local. |
| DM.0 #2 StableReduction / Fitting | Current Tau Ceti Fitting ideal and base change; only finite-F[t] characteristic-polynomial identity is local. |
| DM.0 #3 AlgebraicCurves 2 | Dedekind affine bridge and finite normalization imported. |
| DM.0 #4 AlgebraicCurves 3 | Divisor/ideal correspondence and degree with residue factors imported. |
| DM.0 #5 AlgebraicCurves 5 | Normalized completions imported; the additional coefficient and norm adapters are explicit local targets. |
| DM.0 #6 JacobianChallenge A | Line bundles, divisor twists and degree imported. |
| DM.0 #7 JacobianChallenge B | Curve Riemann–Roch and duality imported. |
| DM.0 #8 JacobianChallenge C | Relative cohomology and base change imported, with fibrewise vanishing proved for the normalized chain. |
| DM.8 #1 MC.6 | Exact arbitrary-field reconstruction and tensor-functor contracts checked; supplier-order gap remains. |
| DM.8 #2 FA.0 | Exact constants instead imported from AlgebraicCurves 0 and places from 5. The separate adelic-lattice FA §2.1 contract still needs an order. |
| DM.8 #3 SF.3 | General scheme dimension and field-extension dimension supplied by current §0.7; logarithm-kernel separability proved locally rather than inferred from smooth groups. |
| DM.8 #4 SF.1 | Torsors, descent, additive-group cohomology and field/Galois comparisons identified in current scheme contracts; no invented interface. |
| DM.8 #5 AdicSpaces | General restricted/entire analysis supplied by RestrictedPowerSeries and NewtonPolygons; duplicate Tate-algebra target removed. |
| DM.8 #6 JacobianChallenge B | Curve dimension/divisor inputs imported; no additional motive theory attributed to it. |
| DM.8 #7 SF.0 | Current §0.7 lacks full Hilbert polynomial theorem, so §8.41 now owns the general standard-graded targets needed for bounded monomial growth. |


## Lean signatures and validation

Suggested.lean has 569 lines, imports `Mathlib`, and uses one roadmap namespace.
It contains light definitions on pinned carriers, named milestone statements,
23 proved examples and no admitted examples. Its 24 `sorry` warnings arise
from theorem/proof obligations, not data definitions. There are no placeholder
`True` targets or hypotheses containing the conclusion. Heavy definitions
remain in the README and are named in the closing comment. In particular
elaboration does not assert that uniformization, motives, moduli or the
Tannakian category have been formalized.

| Signature spot-check | README agreement / negative control |
| --- | --- |
| `OrePolynomial.existsUnique_rightDivRem` | Any finite `F`, coefficient field possibly imperfect; nonzero divisor; `R=0 ∨ natDegree R<natDegree f`; quotient on the left of the right divisor. |
| `DrinfeldModule` / `charIdeal` | Characteristic uses the constant coefficient map; non-scalar action; special-characteristic `t↦τ` has characteristic `(t)` although the action map is injective. |
| `natDegree_eq_rank_mul` | Polynomial-ring statement with `a≠0`; general-`A` integrality is a separate README target, not falsely claimed by this signature. |
| `carlitz` / `carlitz_rank` | Any characteristic map `t↦θ`; rank one without a generic-characteristic assumption. Proof fields do not replace its real polynomial action. |
| `carlitzD_succ` / `carlitzEll_succ` | Correct Frobenius exponent in `D`; the first factors differ by sign, including characteristic two. |
| `coefficientTwist` | Ring automorphism of coefficients, variable fixed; no twist of `t`. |
| `carlitzLog_summable_iff` | Complete ultrametric field over finite `F`, `‖θ‖=q`; strict convergence radius, not boundary convergence. |
| `carlitzExp_eq_zero_iff` / `norm_carlitzPeriod` | Nonzero root `ρ` of `ρ^(q−1)=−θ`, correct period normalization and norm. General lattice uniformization stays in the README. |
| `carlitzTensor` | Real matrix over the Ore carrier; `n=1` is `θ+τ`, `n=2` has the superdiagonal one and lower-left Frobenius. No motive construction encoded as data. |
| `finiteModuleCardinality_quotient` | Monic quotient polynomial; finite `F`-module; monic polynomial `1` gives the zero module and determinant one. |
| `carlitzPowerSum_eq` | `1≤s≤q` and all `d`, including `d=0`; no claim outside that interval. |
| `linearIndependent_of_fixed` | Exact constants and semilinearity both present; no finite-dimensionality assumption for the independence statement. |
| `bettiComparison_bijective_iff` | Finite-dimensional ambient space; exact constants; equality of the appropriate `F` and `L` dimensions, not an untyped identification of fields. |
| `IsFundamentalMatrix` / `solutionSpace` | `σ(Ψ)=ΦΨ`, invertible determinant for fundamental matrices; zero remains in the solution subspace and `Φ=0` excludes the constant-one vector under identity twist. |
| `solutionRing` | Generated by entries and inverse determinant; the inverse-determinant example checks localization direction. |
| `degreeSpan` | Monomials of degree at most `d`, with degree-zero monomial one even for the empty family. |
| `transcendental_carlitzPeriod` / `algebraicIndependent_carlitzLog` | Algebraically closed complete ultrametric field, correct base field `F(θ)`, algebraic exponentials and linear independence hypotheses; `r=0` has the expected vacuous independence. |

Validation results:

- `lean-check` on the absolute Suggested.lean path: exit 0, exactly 24
  `declaration uses 'sorry'` warnings, no other warnings or errors. Used only
  the shared pinned build; checked available memory first.
- `python3 scripts/check_sorry_data.py` on Suggested.lean: exit 0.
- `python3 scripts/check_blueprint.py` on each packet: exit 0, zero errors,
  zero warnings (75 and 48 nodes respectively).
- Definition/declaration-or-closing-comment coverage, three-Check minimum,
  unique anchors, internal link targets and backward *Needs* order: passed.
- `python3 research/blueprint/intake.py check-files` on the package files and
  this report: exit 0, no problems.
- `git diff --check`: exit 0, no problems.

The report is the durable handoff; no scratch file or downloaded source is
needed to understand the remaining dependency decision. No suspicious
instructions were encountered in untrusted fetched material. No private
library book, source passage, credential or machine-local path is included.
