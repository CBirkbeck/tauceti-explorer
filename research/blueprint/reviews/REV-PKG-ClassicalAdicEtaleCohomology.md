# Independent fixing review: ClassicalAdicEtaleCohomology

**Verdict: accepted with the fixes in this change.** Agent: Codex, session
codex-80qUG2, 13 October 2026. This completes issue #9202. The input was the
package supplied by codex-XoDduC in #9368, merged at `79c898e0f`; this reviewer
did not write that package or its input packets.

The package is ready for the maintainer's draft TauCetiRoadmap submission.
This is a mathematical roadmap review, not a claim that its proposed theory
has been formalised. Its heavy sites, functors, comparison objects and
cohomology constructions remain explicit README targets. The Lean file only
states signatures over available carriers and supplies light definitions.

## Coverage and fidelity

Read WORKERS.md, PROTOCOL.md, PACKAGE_REVIEW.md, UPSTREAM_GUIDE.md, the issue,
the expansion protocol and the cleared-source index. Used AdicSpaces and
LocalFieldsRamification as README models, and AdicSpaces and LocalGaloisGroups
as Suggested.lean models. Reviewed all eleven layers, their numbered
subsections, definitions, API promises, statements, worked examples and
dependencies, together with the opening scope and conventions.

Compared the package against the five accepted inputs H0,
H1-valuation-exports, H1-valuation-nearby-cycles, H3 and H4. The 390 input
nodes are accounted for by the package's retained targets and its eight
existing consolidations or deferrals. The extracted inventory of 659 explicit
input API entries had no missing names in the README. Name presence was used
for bookkeeping; the mathematical hypotheses and meanings were read
separately. No input packet was edited and no mathematical target was dropped
to shorten the package.

Read all 102 explicit Checks blocks and the surrounding worked examples.
Each retained definition or construction has at least three discriminating
checks. The five shorter blocks concern theorem statements, not definitions.
Corrections below replace false or insufficiently scoped checks. Definitions
absent from Lean are named in its closing block. The metadata remains
`topic = "math.AG"`.

## Fixes applied

1. **Huber's ambient hypothesis.** The first alternative of (1.1.1) is
   finite generation of the completed ring **as an algebra** over a noetherian
   ring of definition, not finiteness as a module. Restored this alternative
   and the discrete-ring alternative throughout the comparison layers.
   The witness is ℚ_p = ℤ_p[1/p]; discrete nonnoetherian rings are also allowed.
2. **Constructible colimits.** A sheaf is a filtered colimit of constructible
   sheaves mapping to it; these maps need not be monomorphisms. Removed the
   stronger assertion about constructible subsheaves in §5.2 and supplied the
   closed-point skyscraper on an infinite-rank valuation spectrum as a
   negative control. Its nonconstructible singleton support prevents such
   an expression by constructible subsheaves. Added Stacks Tags 03SA and 093C.
3. **Zero and empty cases.** Nonzero skyscrapers, failure of local constancy,
   failure of overconvergence, inequivalent support functors, nontrivial
   boundary maps and failure of perfectness now require nonzero coefficients
   or n > 1 as appropriate. The non-example contrasting a curve with an
   étale zero-dimensional morphism requires a nonempty domain. The empty
   space retains its legitimate vacuous properties.
4. **Support direction and localization.** In the rank-zero valuation-base
   case the nearby-cycle triangle is `0 → E → E`, with identity as the second
   map. The localization worked example computes Γ(X,j!Λ), and identifies it
   with compactly supported sections only when X is proper. For the affine
   line with empty closed support, ordinary cohomology is Λ whereas compactly
   supported cohomology is Λ(−1)[−2]. Closed formal supports are not assumed
   constructible at arbitrary valuation rank.
5. **Monodromy convention.** Scalar 2 and 3 are automorphisms over ℚ, not
   over ℤ. Added the noncommuting integral matrices
   `u = [[1,1],[0,1]]`, `v = [[1,0],[1,1]]`: `uv−1 = [[1,1],[1,0]]` and
   `vu−1 = [[0,1],[1,1]]`. This detects the order of the product in
   `Var(uv) = Var(u)+Var(v)+Var(u)Var(v)`; it is also a Lean example.
6. **Coefficient scope.** The plus-ring unit condition is independent of
   rank-one residue characteristic, even when the latter is zero. A
   residual higher-rank valuation can have positive residue characteristic.
   Repeated notation now says n is a unit in C⁺, hence prime to the rank-one
   exponent; exponent 1 is allowed in residue characteristic zero. The
   arithmetic-disc counterexample uses K = ℚ_p and ℓ = p explicitly.
7. **Numerical duality.** Relative duality over Spa(C,C⁺) retains arbitrary
   valuation rank. The pairing into Λ after taking global sections is
   restricted to C⁺ = O_C. Added the rank-two base with generic open η and a
   disc over η: `Rf!Λ = j!Λ(−1)[−2]`, whose global sections on the base vanish,
   while `H⁰(X,Λ) = Λ`. Thus the numerical pairing cannot silently replace
   relative duality at higher rank. Corrected Corollary 7.5.6 to pp. 396–397.
   The unbounded relative-Hom formulation now cites Theorem 7.5.3 together
   with the finite-amplitude enhancement in §§8.4–8.5, rather than leaving an
   unspecified continuation or treating j! objects as exhaustive.
8. **Semistable and normal-crossing controls.** In residue characteristic two,
   with e = 2 and m = 2, the threshold is 4 and the positive symbol of 1 is
   nonzero modulo B⁰ although its image modulo Z⁰ is zero. The binomial
   calculation is `(1+π)² ≡ 1+π² mod π³`.
   Added the arithmetic zero-ramification cutoff control and named
   `Semistable.filtrationCutoff_two`. The normal-crossing formula is stated
   for an ambient finite locally constant F and uses
   `F_x ⊗Λ ∧^q Λ(−1)^r`; a rank-two F on a one-branch crossing has rank-two
   H⁰ and H¹. A local system only on the complement is insufficient.
9. **Missing discriminating interfaces.** Added named fibre-product,
   composition, covering and sheaf-equivalence APIs and three tests for
   StrictAnalyticEtaleSite. The formal-curve non-example is now the
   two-dimensional formal polydisc, rather than an uninformative restatement
   of the curve assumption. Removed the obsolete additive Lean description
   of the annular Kummer generator: its target is the actual analytic class
   δ_n(T), using Layer 1.
10. **Dependency corrections.** Removed five spurious Layer 3 dependencies
    from Layer 2; Layer 1 supplies the needed sheaf and support theory.
    The dominant comparison map in §5.4 now refers to the earlier map in
    §5.1. The formal all-torsion comparison refers to scheme functors in
    §1.1, not the prime-to-p theorem in §5.2. The Berkovich affinoid supplier
    is the actual `AdicSpacesPartII` §R3.73 `GelfandSpectrum`, not a nonexistent
    node named `berkovich-affinoid-spectrum`.
11. **Conventions and prose.** Made the admissible cardinal contract explicit.
    Removed source quotations and malformed production labels; the nearby
    versus vanishing-cycle convention is stated in our own words, with the
    Ψ–Φ triangle and locators. Corrected malformed point terminology,
    repeated words and the doubled comma in the perfectoid-model comparison.

12. **Intrinsic constructibility of a support.** The pseudo-adic criterion in
    §§1.4 and 4.2 now uses locally closed, locally constructible strata in
    the support S itself, as in Huber Definition 2.7.2, p. 145. It does not
    require S or its strata to be ambient-constructible. Added singleton,
    zero-sheaf and full/empty-support controls: the constant finite module on
    a singleton support is constructible even when its ambient skyscraper
    is not. Removed the stale assertion that this definition still needed
    to be supplied in Layer 1.

## Source verification

No author-marked unverified locator was found. Selected a fixed random sample
of fifteen citation paragraphs from the input package, using seed 9202; the
table records those paragraphs by their subject and exact source locator,
without relying on line numbers changed by this review. Public papers and
Stacks statements were opened and read. Huber (1996), Kedlaya–Liu and SGA 7 II
were read from the maintainer-cleared copies. No restricted file or extracted
passage was copied into the repository or scratch directory.

| Sample | Claim checked | Locator read and result |
| --- | --- | --- |
| 1 | Small étale basis and cardinal-bounded pro-étale presentations | Kedlaya–Liu §8.2 before Proposition 8.2.20, p. 163; Scholze, Étale cohomology of diamonds, Lemma 7.18 proof, p. 36, and §14 before Proposition 14.10, p. 86. Locators agree; the subordinate cardinal conditions are now explicit. |
| 2 | Čech/descent comparison | de Jong–van der Put, Proposition 2.4.1 proof, p. 10; Scholze (2013), Proposition 3.7(iii) proof, p. 15. Both support the claimed comparison in their scopes. |
| 3 | Finite étale covering and filtered-colimit comparison | Kedlaya–Liu p. 163; de Jong–van der Put Lemma 3.4.3, p. 32, and Proposition 3.2.2, pp. 23–24. Locators and hypotheses agree. |
| 4 | Supported limit and étale-topos descent | Huber Proposition 2.4.4 and Remark 2.4.5, pp. 127–129. Adic transitions and the stated ambient hypotheses are needed; arbitrary strongly sheafy limits are not inferred. |
| 5 | Special subsets and local constructibility | Huber Definition 3.1.6, p. 166, and Corollary 3.1.8, p. 167. Strict versus weak inequalities and the henselization support agree. |
| 6 | Local finite-étale factorization | Kedlaya–Liu Lemma 8.4.1 and proof, pp. 167–168. Agrees with the lattice-localization input. |
| 7 | Image of an analytic covering | de Jong (1995), Lemma 2.2(iv), p. 92. The image is a union of connected components. |
| 8 | Lattice orbits and failure of a global lattice | de Jong (1995), Corollary 4.4 proof, p. 105; Kedlaya–Liu Remark 1.4.4, p. 21. The rational/isogeny distinction is retained. |
| 9 | Formal étale thickenings and specialization | Berkovich (1994), §2 before Lemma 2.1, printed p. 542; Stacks Tag 039R; Huber §3.5, p. 201. Completion and special-fibre étale comparison agree. |
| 10 | Positive logarithmic symbol calculation | Colmez–Dospinescu–Nizioł, Theorem 2.4 proof, pp. 23–24. Read the mod-p² logarithmic construction; the corrected p = 2 ramified example distinguishes the quotients. |
| 11 | BKH graded pieces and endpoint | Colmez–Dospinescu–Nizioł, Theorem 2.4(2)–(3), p. 23. Read the B/Z quotients and vanishing threshold. |
| 12 | Proper nearby-cycle comparison and topological invariance | Illusie §1.1(a)(i), equation (1.1.4), p. 2; Stacks Tags 095T, 0F0C, 0A3S and 04DY. The bounded-below and unbounded scopes are distinguished. |
| 13 | Supported perfectoid approximation and field-pair invariance | Scholze, Étale cohomology of diamonds, Lemma 14.6 proof, p. 84, and Lemma 16.3 proof, p. 93. The support and prime-to-residue restrictions agree. |
| 14 | Curve trace and flat quasi-finite compatibility | Berkovich (1993), Theorem 6.2.1(a), p. 112, and Theorem 5.4.1(d), p. 107. Read the trace normalization and the compatible finite-flat trace. |
| 15 | Compatibility with the algebraic trace | Berkovich (1993), Corollary 6.2.9, p. 118. Locators and the algebraic/analytic comparison agree. |

Additional readings used for fixes: Huber (1.1.1), p. 37; Theorem 7.5.3,
pp. 390–395, Corollary 7.5.5, p. 396, and Corollary 7.5.6, pp. 396–397;
Huber Definitions 2.7.1–2.7.2, p. 145, and Lemma 2.7.8 with proof, pp. 148–150, for intrinsic pseudo-adic constructibility and filtered colimits;
Stacks Tags 03SA and 093C for constructible filtered colimits; Lu–Zheng v7,
Example 4.26(2) and Theorem 4.27(2), pp. 37–38, for valuation-base Ψ-goodness.
Printed page numbers, rather than PDF offsets or OCR block labels, are used
in the corrected locators. No remaining sampled locator is unresolved.

## Prerequisite and current-upstream audit

Read the pinned declaration signatures used by the roadmap: Mathlib
`082e2d37e8` and Tau Ceti `f790474`. The qualified-name inventory contains
209 names; apparent search misses were resolved by reading namespace and
multiline declarations. Particularly important checks were:

- sheaf Grothendieck abelianness, enough injectives, sheafification and
  `rightDerivedFunctorPlus`; the Λ-module sheaf construction is a target,
  not an assumed existing analytic cohomology carrier;
- scheme small étale topology and geometric points, the actual ring/scheme
  étale base-change hypotheses, henselian ring and local-ring interfaces;
- Spa membership, continuity and plus-ring bounds, the rational-localization
  denominator condition, and the integral-closure comparison;
- `IsLocalHom.of_comap_surjective`, the flatness hypotheses of faithful-flat
  spectrum surjectivity, and the valuation-domain injectivity/locality
  equivalence rather than an assertion for arbitrary commutative rings;
- the connected-prime-spectrum tensor-product result, without adding
  nonexistent finite or reduced assumptions; roots of unity with their
  unit and order hypotheses.

Read the actual statements behind the 198 distinct qualified supplier nodes,
including the local curve and trace, formal-model, enhanced-functor and
valuation contracts. Dependencies terminate in these pinned declarations,
earlier layers, lower-tier roadmaps, or the tier-10 bundle partners
AdicCoefficientsAndComparisons, EtaleDualityAndPerverseSheaves and
LefschetzPencilsAndVanishingCycles. In particular CrystallineCohomology CR.5
is a lower-tier supplier. No upward roadmap citation,
FoundationsAndLibraryIntegration dependency or `UPSTREAM:` identifier remains.

For each mathematical target, searched by its object, hypotheses and
operators in the current TauCetiRoadmap checkout and the current Tau Ceti
library at `a91d3aaf`, and read the potentially overlapping statements.
This included the nine roadmaps newer than the atlas snapshot:
AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices,
LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions,
ProfiniteArithmetic and RealAlgebraicGeometry; also the Completed roadmaps
ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts.
The read-only checkouts were not built or modified.

No additional retained target was removed in this review. The closest
potential overlaps have different scopes:

- `TauCeti.GaussPoint` and the current
  `TauCeti.PowerSeries.gaussValuation` concern real-valued norms on restricted
  series. The retained §5.3 variant explicitly concerns arbitrary value
  groups on polynomials and the fraction field K(T).
- AlgebraicVectorBundles concerns scheme vector bundles; IntegralLattices
  and LocalGaloisGroups do not supply analytic bounded-lattice descent or
  rational analytic-cover monodromy. The retained variants say what their
  analytic carriers and locality conditions are.
- Existing topological covering and monodromy APIs do not provide locally
  finite étale analytic coverings. Henselian and strictly local algebraic
  inputs remain supplier contracts, not new copies of those targets.

The input package's eight consolidations/deferrals remain: two generic
tilde-limit/colimit-density results belong to PerfectoidSpaces P7; one H3
support carrier is absorbed by the pseudo-adic support construction in §1.2;
four H1 exported aliases point to the already stated mathematical results;
one pure-dimension target belongs to AdicEtaleGeometry A2. These are recorded
in scope and ownership, without removed-target stubs. No ownership move to a
higher roadmap is needed.

## Adversarial mathematics pass

The table covers every numbered subsection and its statement/API family,
including identities, definitions, conventions and worked examples. All
statements within a row were read; the listed instances are the controls used
to test that family, not an assertion that a finite sample proves each
theorem. A dash in the last column means no correction was needed after
checking the stated hypotheses and supplier contracts.

| Statements checked | Instances and distinctions tried | Changes |
| --- | --- | --- |
| Conventions and scope | n = 1; zero ring/module; exponent p = 1 and p = 2; rank-one versus rank-two plus ring; algebra-finite versus module-finite; left noncommuting monodromy | Explicit cardinal and plus-ring contracts; standing hypothesis and monodromy witnesses corrected. |
| §1.1 Module sheaves, stalks and derived direct images | Empty space; disconnected constant presheaf; rank-two closed-point skyscraper; bounded-below complexes | Require nonzero coefficients in the skyscraper non-example. |
| §1.2 Pseudo-adic support sites and extensions | Empty/full/open/closed support; rank-two closed point; j! versus j* on a proper subdisc | Restore discrete ambient scope; scope negative checks by Λ ≠ 0. |
| §1.3 Čech/descent and étale–pro-étale comparison | Identity cover; empty space; refinements; finite versus unrestricted cardinal presentations | Explicit admissible cardinal convention. |
| §1.4 Local systems, constructibility, lisse coefficients and twists | Zero/constant system; n = 1; finite Galois modules; rational-open j!; classical-point skyscraper | Nonzero hypotheses on non-examples; preserve noninjective filtered colimits; correct intrinsic support constructibility. |
| §1.5 Supported limits and continuity | Constant systems; strict localization; topology without function density; full versus closed support | Own-word locator prose and ambient hypothesis; no arbitrary nonnoetherian extension inferred. |
| §2.1 Henselian rings and rational henselization | Complete field; henselized ℚ; rational subdisc; algebraic henselization versus transcendental convergent series | Correct ambient finite-algebra terminology. |
| §2.2 Special/pro-special subsets and support henselization | Empty/full support; strict versus weak inequality; (p,T)-henselization; germs versus ind-étale algebra | Clarify formal-comparison cross-reference. |
| §2.3 Fibre products and comparison maps | Identity and closed fibres; q = 0 stalk; strict-local limit; morphism versus cohomological isomorphism | Remove forward Layer 3 dependencies; correct all three ambient alternatives. |
| §2.4 Normal models and Zariski–Riemann vanishing | Empty constraint sets; constant coefficients; generic versus residual valuation points | — |
| §2.5 Relative/constant comparison | Complete affinoid; noncomplete henselian field; proper versus arbitrary finite-type map; noetherian principal ideal | Remove forward dependencies and restore standing scope. |
| §2.6 Perfectoid noetherian models | Finite étale p-primary group; finite-stage descent; p-torsion-free model versus completed colimit | Remove model typo; apply noetherian theorem at the finite stage only. |
| §3.1 Taut spaces and strict analytic sites | Geometric point; empty space; disjoint union; joint surjectivity versus a single étale object | Name the strict-site APIs and three tests; correct affinoid Gelfand supplier. |
| §3.2 Overconvergence and sheaf equivalence | Constant sheaf; rank-two specialization; proper-open j!; n = 1 | Nontrivial coefficient hypothesis in the negative check. |
| §3.3 Integral/isogeny/rational categories | Rank zero; multiplication by p; connected point; countably many components with unbounded denominators | — |
| §3.4 Bounded lattices and affine comparison | Trivial lattice; p-rescaling; rational automorphism with unbounded orbit; local finite-étale refinement | — |
| §3.5 Analytic étale covers | Empty cover; trivial finite cover; non-surjective image on a disconnected space; locally finite versus finite | — |
| §3.6 Fibres, paths and fundamental group | Geometric base point; trivial cover; change of base point; specialization and path directions | — |
| §3.7 Rational monodromy and lattice orbits | Trivial representation; multiplication by p on a Tate-curve loop; orbit of ℤ_p; absent global lattice | — |
| §4.1 Formal étale sites and specialization | Identity; nilpotent thickening; affine formal disc; non-adic morphism | — |
| §4.2 Formal pairs and full supports | Empty/full closed support; whole inverse image versus tube interior; closed support at infinite rank | Do not call an arbitrary closed fibre ambient-constructible; test constructibility intrinsically on its support. |
| §4.3 Strict localization and tubes | Geometric closed point; q = 0; support stalk versus ambient global sections | — |
| §4.4 Completion data and derived comparison | Principal ideal; identity morphism; arbitrary versus torsion coefficients; support-preserving versus adic completion map | Correct explanatory cross-references. |
| §4.5 Microbial bases and trait comparison | Henselian DVR; smooth affine line; nodal xy = π; p-torsion versus prime-to-p comparison | Keep all-torsion formal comparison separate from locally acyclic prime-to-p examples. |
| §4.6 Semistable nearby symbols | Smooth formal disc; node; Kummer unit versus parameter; degree zero and empty wedge | — |
| §4.7 BKH filtration and symbol maps | q = 1; r = 0 and endpoint; p = 2; ramification e = 2; arithmetic e = 0 | Correct positive B⁰/Z⁰ witness; add cutoff control and Lean milestone. |
| §5.1 Valuation quadruples and strict localization | Field/rank zero; identity quadruple; chosen specialization and geometric points | — |
| §5.2 Nearby cycles and Galois actions | Field with empty special part; rank-two support; zero coefficient; infinite-rank closed-point sheaf | Fix localization triangle and constructible-colimit claim; scope negative examples. |
| §5.3 Amplitude, tame quotients and Gauss extension | Degree zero; constant polynomial; multiplicative Gauss value; arbitrary Γ versus real norm; p = 1 | Retained Gauss variant explicitly differs from existing series APIs. |
| §5.4 Base change and constructibility | Identity; finite extension; dominant versus nondominant maps; infinite valuation rank | Correct owner of the comparison map. |
| §5.5 Trait actions, Ψ versus Φ and variation | X = S; smooth affine line with Φ = 0; nodal annulus; noncommuting u,v; ramified trait change | Own-word Ψ/Φ convention; correct scalar-automorphism and order witnesses. |
| §5.6 Absolutely integrally closed generic extension | Geometric field; identity extension; sheaf extension and restriction; degree-zero adjunction | — |
| §6.1 Surjective valuation maps | Identity; field/rank zero; injective local DVR extension; fraction-field inclusion losing closed primes | Scope equivalence to valuation domains; Lean predicate itself remains general. |
| §6.2 Supported specialization comparison | Empty/full special support; proper Ψ; unbounded cohomology; prime-to-plus versus all-torsion statements | Preserve separate coefficient scopes. |
| §6.3 Total cohomology and adjunction | Identity; empty closed support on A¹; ordinary versus compact supports; unit/counit direction | Correct Γ(X,j!Λ) and the rank-zero support interpretation. |
| §6.4 Finite-rank descent and boundaries | Rank zero; finite specialization chain; higher/infinite-rank valuation descent | — |
| §7.1 Geometric field-pair extension | Identity; rank-one to higher-rank plus ring; zero coefficients; closed versus whole fibre | — |
| §7.2 Finite-type approximations | Trivial approximation; finite-stage étale data; supported prime-to-residue cohomology | — |
| §7.3 Connectedness and supports | Geometric connected point; disconnected union; tensor product over algebraically closed field | — |
| §8.1 Compactifiable maps | Identity; proper map; open immersion and compactification composition | — |
| §8.2 Universal/formal compactification and algebraic comparison | Closed disc and added boundary; proper scheme; formal curve versus formal two-disc; empty support | Replace vacuous formal-curve check with dimension-two non-example. |
| §8.3 Lower shriek and compactification independence | Proper f! = f*; open j!; zero object; two compactifications; disc over rank-two generic open | Nonzero hypotheses where j! and j* are distinguished. |
| §8.4 Base change, bounds and projection | Relative dimension zero; finite amplitude; proper fibre; zero complex; torsion including p | — |
| §8.5 Localization and enhanced descent | Open/closed pair; empty stratum; composition; unbounded input and finite cohomological amplitude | Explicitly use this enhancement for unbounded relative Hom. |
| §8.6 Flat quasi-finite trace | Identity; split finite cover; rank zero and degree; composition | — |
| §9.1 Berkovich proper-support comparison | Constant/overconvergent sheaf; strict point; support versus ordinary direct image | — |
| §9.2 Curves and relative-ball trace | P¹ point of degree +1; split finite map; nonempty étale zero-dimensional map; empty curve | Add nonempty/nonzero hypotheses in negative controls. |
| §9.3 Chern classes, boundary degrees and reciprocity | Rational point; exterior disc degree −1; opposite annulus boundaries; degree modulo n = 1 | Require n > 1 when a sign or boundary map must be nontrivial. |
| §9.4 Relative top degree and affine trace | d = 0; A¹; two disjoint balls; zero sheaf; Tate twist/shift | Require a nonzero sheaf for the disconnectedness non-example. |
| §9.5 General smooth traces | Smooth dimension zero; coordinate change; product of affine coordinates; composition of traces | — |
| §9.6 Relative and numerical duality | Rank-one geometric base; rank-two generic open; zero complex; unbounded G; nonunit plus-ring coefficient | Restrict numerical pairing to C⁺ = O_C; retain relative duality at all ranks; fix locator and enhancement contract. |
| §9.7 Proper pairings and integral trace | Proper smooth curve; degree zero; finite coefficients; integral reduction modulo powers | Keep numerical prime-to-plus-ring scope explicit. |
| §10.1 Closed radial loci | T = 0; T = 1; outer bound 0; equal radii; puncture | All six radial definitions retain actual Spa and valuative comparisons. |
| §10.2 Strict/open radial loci | Equal strict radii; outer boundary; constant exhaustion; zero coordinate; arbitrary versus cofinal sequences | Lean general set definition distinguished from analytic exhaustion hypotheses. |
| §10.3 Tame coverings and Kummer class | n = 1; parameter versus n-th power; p = 1; p divides n; plus-ring unit | Correct Kummer Lean description and characteristic-exponent terminology. |
| §10.4 Ordinary/compact radial cohomology | Closed disc; puncture/annulus; zero coefficient; arithmetic ℚ_p versus algebraically closed base | Scope arithmetic non-example to ℓ = p. |
| §10.5 Smooth-family constructibility | Constant smooth family; fibre dimension zero; geometric fibre and base change | — |
| §11.1 Algebraic comparison and normal crossings | One branch; r = 0; rank-two ambient F; complementary local system with monodromy | Correct coefficient tensor factor and require ambient finite local constancy. |
| §11.2 Polydiscs and affine exhaustion | d = 0; closed ball versus A¹; constant versus cofinal radii; derived inverse limit | — |
| §11.3 Frontier and compactification duality | Empty frontier; disc boundary; annulus two ends; trace sign | — |

## Lean and final validation

`lean-check Suggested.lean` exited 0 at the prescribed pins. The final file
has 252 lines, nine real-bodied definitions, three theorem signatures and
twenty examples. Its twenty-three warnings are exclusively declarations
using `sorry`. There are no sorry-defined data carriers, no theory
development, no `True` placeholders and no imported hypothetical analytic
cohomology type. The compilation tests elaboration; the mathematical review
and controls above supply the separate truth audit.

Spot-checked the following twelve signatures against the README (more than
the required ten):

| Signature | Generality and convention checked |
| --- | --- |
| `Semistable.filtrationCutoff` | Natural-number arithmetic defined by rational division and ceiling; geometric use has prime p and ramification e. |
| `Semistable.filtrationCutoff_two` | Every natural e, including zero; value is 2e. |
| `Trait.variation` | Arbitrary module endomorphism u gives u−1; monodromy is the automorphism specialization. |
| `Trait.variation_mul` | Noncommutative endomorphism composition in the left-action order. |
| `ValuationBase.IsSurjectiveValuationMap` | Surjectivity of the contravariant prime-spectrum map for a general commutative ring homomorphism. |
| `ValuationBase.isSurjectiveValuationMap_iff_injective_and_isLocalHom` | Both rings are valuation domains; rank-zero fields included. |
| `Radial.closedDisc` | Spa(A,A⁺) intersected with the weak outer bound, using the actual plus ring. |
| `Radial.puncturedDisc` | Removes the coordinate's zero locus, rather than replacing ≤ by <. |
| `Radial.closedAnnulus` | Two weak bounds and a nonzero coordinate; equal radii allowed. |
| `Radial.strictAnnulus` | Negations of reverse weak comparisons, valid at arbitrary rank. |
| `Radial.openAnnulus` | Union of supplied closed-annulus stages; cofinal analytic exhaustion is a README hypothesis. |
| `Radial.openDisc` | Union of supplied closed-disc stages; constant sequences correctly retain their boundary. |

Final local validation: `python3 research/blueprint/intake.py check-files`
reported **5 files, 0 problems**; `python3 scripts/check_sorry_data.py` exited
0; `git diff --check` reported no whitespace errors. These checks cover the
package README, Suggested.lean, metadata, review.json and this report. No
private filesystem path appears in the deliverables.

The final handoff is this report: no unfinished review task or unresolved
defect remains. The maintainer can use the revised README, Suggested.lean,
unchanged metadata and accepted review.json directly. The source sample,
fix list, dependency corrections and ownership decisions above are retained
here so no subsequent worker needs the disposable scratch notes.
