# REV-PKG-ConformalMappingPartII~2

Verdict: **accepted**, after the corrections below. Issue #9206; independent reviewer Codex, session `codex-jLTwC2`, 14 October 2026. Neither package author session (`codex-j8UyP2`, original package; `codex-C9UOVZ`, revision #9163) is this reviewer. The package is ready for the maintainer's draft TauCetiRoadmap PR. This verdict accepts a mathematical roadmap, not proofs of its targets.

## Corrections applied

1. Removed the former Layer 7 logarithmic-circle-integrability target and renumbered the remaining subsections. Both required integrability results are already in pinned Mathlib: `MeromorphicOn.circleIntegrable_log_norm` and `MeromorphicOn.circleIntegrable_posLog_norm`, module `Mathlib.Analysis.SpecialFunctions.Integrability.LogMeromorphic`. Added their actual sphere-only hypotheses to the supplier contracts and replaced the three dependencies on the removed target with these declarations. The native results even allow the identically zero function and arbitrary real radius; nonzero germ hypotheses remain where Jensen's trailing coefficient needs them.
2. Read the current generic power-descent and complex Herglotz implementations. Added their exact contracts and ownership deferrals. The retained targets specify the extra roots-cover derivative/omission/ramification assertions and the construction of the normalized logarithm, respectively. Added `PowerDescent.ramification` and its negative control so the prose promise of ramification has a named, precise interface.
3. Added the orientation witness F_N(iz): its derivative is iF_N′(0), preserving the norm but violating real orientation. Added the corresponding `example` to `Suggested.lean`.
4. Explained how Layer 1 supplies the punctured-sphere cover in Hempel's target: move a finite puncture to infinity, uniformize the resulting plane with at least two omitted points, and transport back. The cusp principal parts and rational descent remain owned proof targets.
5. Restricted zero removal to a nonzero analytic germ on the disc. Being nonzero somewhere in a disconnected neighbourhood would not ensure a finite disc zero divisor. Kept the boundary-zero warning and enlarged-circle smoothing route.
6. Added accessible NIST DLMF locators for zero-balanced continuation, the digamma reciprocal series and log-Gamma. Explicitly restored ordinary hypergeometric normalization from DLMF's scaled function and specified the principal branch before continuation. These formula checks do not purport to prove convergence or parameter differentiation in Lean.
7. Corrected the quotient-representation locator to Lemma 2.3.1 and its proof, pp.639–641; the lemma starts on p.639. The radial-smoothing proof locator is pp.640–641.

The accepted packet and all other jobs' files remain unchanged.

## Previous review and package shape

Read the first review and both package handoffs. The first review's demand that every heavy carrier and every API have a Lean declaration predates the binding 12 October shape rule. The revised file correctly puts germ-space constructions, continued branches, measured regions and chosen maps in the README and closing comment. Reintroducing admitted carriers would violate the current rule. The earlier mathematical corrections are retained: deleted-neighbourhood membership, full companion correspondence, native complex-cover atlas, normalized-map direction, rotated exceptional set and corrected Gauss/change-of-variable locators.

Compared the form with current ConformalMapping and FuchsianOrbifolds READMEs and suggested files, and read UPSTREAM_GUIDE. The README has the opening summary, ownership, conventions, supplier contracts, ten layers, worked examples, APIs and discriminating Checks. It contains no job or review narrative. Each numbered target has its statement, hypotheses, locator and prerequisites. Metadata is exactly `topic = "math.CV"`.

The input has 98 nodes, 18 definitions/constructions, 68 API items and 54 planned tests. All mathematical content is accounted for. The two previous native deferrals and this review's integrability removal explain the difference between 98 nodes and 95 numbered targets:

| Input layer | Input nodes | Retained numbered targets |
| --- | ---: | ---: |
| O0 / Layer 0 | 6 | 6 |
| U0 / Layer 1 | 13 | 11 |
| S0 / Layer 2 | 9 | 9 |
| L0 / Layer 3 | 9 | 9 |
| H0 / Layer 4 | 8 | 8 |
| R0 / Layer 5 | 8 | 8 |
| F0 / Layer 6 | 8 | 8 |
| V0 / Layer 7 | 11 | 10 |
| G0 / Layer 8 | 7 | 7 |
| M0 / Layer 9 | 19 | 19 |
| Total | 98 | 95 |

The 62 API names attached to retained constructions occur in the README, after removing the input's proposed namespace prefixes. The six Cayley/cover-atlas API items are native compatibility agreements under ownership; private replacement carriers are unnecessary. Their six planned checks remain there. The other 48 planned checks remain with their constructions. Additional checks cover the companion matrix, unscaled jets, pointed-cover record, real orientation, ramification and the scalar representative spike. Every definition has at least three discriminating prose Checks. The compact Lean keeps examples for each retained light definition; heavy definitions are specified in the README and closing comment.

## Sources personally checked

Read the author-hosted published [CDT offprint](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), JAMS 38 (2025), 627–702, DOI [10.1090/jams/1053](https://doi.org/10.1090/jams/1053): §1.1.6 p.632, the meromorphic-basis argument in the proof of Corollary 2.0.5 p.636, Lemma 2.3.1 and Remark 2.3.3 pp.639–641, §5 pp.667–678 and §6 through the proof on p.684. The PDF has SHA-256 `867026fbcc5592728173e5c4d6a87f58d57a55b0d0d8b0109b9774e84290ee1e`. Independently inspected page images for pp.670, 672, 675 and 678, including the reciprocal missing in the printed later horoball estimate. No source passage is reproduced here or in the package.

Selected the following 15 nodes using `random.Random(9206).sample(nodes, 15)` on the accepted input, before editing. Every locator was checked in the actual source; the mathematical adapters are distinguished from source theorems.

| Sampled node | Confirmed CDT locator | Result |
| --- | --- | --- |
| V0/power-law | (6.2.3), p.682; §6.1.1, p.679 | Source use plus native local divisor/power adapter. |
| F0/quadrilateral-domain | Corollary 5.2.4, p.675 | Correct vertices and fundamental domain. |
| G0/exceptional-cusp-set | Lemma 5.2.18, p.678 | Retain rotated large-value set and reciprocal diameter correction. |
| F0/largest-power-stabilizer | Corollary 5.2.4, p.675 | Full orientation-preserving stabilizer. |
| H0/digamma-difference-bound | Lemma 5.2.9 proof, p.676 | Correct shifted coefficient; NIST reciprocal series supplies an accessible input. |
| R0/log-gamma-taylor | Theorem 5.1.4 proof, p.673 | CDT invokes AS 6.1.33; added DLMF 5.7.3. |
| L0/quotient-representation | Lemma 2.3.1 and proof, pp.639–641 | Corrected the single-page locator. |
| M0/pivot-map | (6.2.4), p.682 | Correct factor x/N. |
| M0/uniform-mean-growth | Theorem 6.0.1, p.679 | Exact three-map endpoint; proof finishes p.684. |
| U0/power-descent | Definition 5.1.15, p.671 | G(z^N)=F(z)^N; not a universal cover. |
| S0/roots-schwarzian | Lemma 5.1.8, p.669; proof pp.670–671 | Correct rational coefficient. |
| L0/blaschke-factor | Lemma 2.3.1 proof, p.640 | Boundary factor is the constant −a. |
| S0/schwarzian-chain | Remark 5.1.10, p.669 | Weight is (g′)^2. |
| V0/translation-proximity | (6.1.5), p.680 | Absolute difference bounded by log⁺\|a\|+log 2. |
| V0/local-jensen | Poisson–Jensen discussion and (6.1.4), p.680 | Native closed-disc divisor/trailing coefficient is required. |

The author flags unread analytic interiors through the input's 15 gap records. Checked every corresponding invocation/locator and disposition:

| Flagged interior | Passage or independent supplier checked | Disposition |
| --- | --- | --- |
| Complex initial-value construction | CDT §1.1.6 p.632 | Owned complex analytic recursion/continuation target; a real-time ODE theorem does not substitute. |
| Cover atlas and surface uniformization | CDT §5.1 p.667; current native cover-manifold module | Atlas already supplied; abstract-surface uniformization and exclusion of the plane/sphere remain explicit targets. |
| Cover orientation and cusp | CDT Definition 5.1.1 pp.667–668; radius proof p.672 | Positive derivative, radial cusp and compatible inverse are stated separately. Added orientation control. |
| Hempel rationality | CDT Hempel invocation, (5.1.13)–(5.1.14), p.670 | Principal parts, descent and rationality are targets; added sphere-to-plane construction route. |
| Blaschke/smoothing | CDT Lemma 2.3.1 proof pp.640–641 | Boundary-zero obstruction and enlarged-circle limits retained. |
| Hypergeometric analyticity/ODE | CDT Lemma 5.1.16 proof p.672; pinned native series | Termwise differentiation and Gauss equation are explicit targets. |
| Zero-balanced continuation | CDT Lemma 5.1.20 p.672; DLMF 15.8.10 and 15.2.2 | Formula and normalization checked; convergence/overlap proof retained. |
| Parameter-differentiated tails | CDT Lemma 5.2.9 p.676; DLMF 5.7.6 | Shifted digamma bound and uniform derivative domination retained. |
| Log-Gamma/remainder | CDT radius proof p.673; DLMF 5.7.3 | Formula checked; locally uniform logarithm, sum interchange and effective remainder retained. |
| Polygon/reflection/triangle identification | CDT Proposition 5.2.1 p.674, Lemma 5.2.6 and Remark 5.2.8 p.675 | Actual regions, side pairings, analytic identification and native area required. |
| Quantitative Shimizu | CDT p.678; current Shimizu theorem | Generic inequality already supplied; roots-specific c=0 branch/full stabilizer remains a target. |
| Uniform cusp constants/horoballs | CDT Lemmas 5.2.9, 5.2.12, 5.2.16, 5.2.18 pp.676–678 | Correct reciprocals and branch constants; effective thresholds remain owned. |
| Local divisor/integrability | CDT §6.1 pp.679–680; pinned local divisor, order, Jensen, logarithmic integrability | Removed native integrability target; local counting/order adapters remain. |
| Radial monotonicity | CDT Corollary 6.2.9 proof p.683 | Holomorphic positive-log sub-mean adapter remains explicit, including zeros. |
| Effective fixed-level completion | CDT §5 opening p.667 and §6 opening pp.678–679 | Source invokes fixed-level asymptotics; all-radius effective C_N and the finite maximum remain explicit targets. |

Read the actual formulas in [DLMF 15.8.10](https://dlmf.nist.gov/15.8.E10), [15.2.2](https://dlmf.nist.gov/15.2.E2), [5.7.3](https://dlmf.nist.gov/5.7.E3) and [5.7.6](https://dlmf.nist.gov/5.7.E6). At m=0, b=a, multiply the scaled hypergeometric function by Γ(2a) to recover the ordinary prefactor Γ(2a)/Γ(a)^2. Combining 5.7.3 with log(1+z)'s series on |z|<1 gives the stated alternating zeta series. These were formula checks, not readings of the original AS proofs.

Did not obtain or certify the original Hempel, Goluzin, Carathéodory, EGM or Tsuji/Kraus–Roth proofs. The README attributes CDT's invocations and explicitly plans the missing proofs. Those proof obligations are normal roadmap work, rather than unstated supplier assumptions. In particular, neither surface uniformization nor effective fixed-level completion is falsely attributed to planar Riemann mapping or to an unspecified asymptotic constant.

## Library contracts, ownership and prerequisite closure

Personally read the actual declarations and surrounding variable/typeclass hypotheses for all 40 baseline declarations, at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The crucial boundaries are:

| Supplier family | Contract checked |
| --- | --- |
| Continuation and universal cover | Analytic-germ transport does not give ODE existence. The native cover needs path-connectedness, local path-connectedness and semilocal simple connectedness. Connected open plane domains discharge them. |
| Riemann mapping and Schwarz | Native normalized map runs Ω→𝔻, so radius comparison is reciprocal derivative norm. Schwarz is used after constructing the based lift. Planar RMT is insufficient for abstract-surface uniformization. |
| Poisson/Herglotz | `DiffContOnCl` and an interior evaluation point are required; differentiated boundary kernel additionally needs circle-integrable data. Normalized analytic log existence is separate. |
| Divisors and Jensen | Restrict genuine local meromorphic divisors to compact subdiscs. Preserve the centre log r term and the nonzero trailing coefficient. No global extension of the disc function is assumed. |
| Proximity/characteristic | Same probability circle normalization; native global logCounting/characteristic used only for globally meromorphic comparisons. Natural-power proximity includes n=0. |
| Native hypergeometric | Actual coefficient sum, value at zero and radius theorem under nonpositive-integer exclusions. Outside-radius totalized values do not provide continuation. |
| Digamma and Gamma | ψ(1)=−γ; reflection/recurrence with pole guards; positive real Gamma arguments, nonzero complex Gamma on positive real part, and real/complex agreement. Bohr–Mollerup's real limit is an input, not a complex Taylor theorem. |
| Disc Möbius factor | Native unphased factor is (z−a)/(1−conj(a)z) for interior a; the boundary constant extension is additional. |
| Meromorphic order | Nonnegative deleted-germ order gives a removable analytic extension; actual scalar analyticity additionally needs continuity. |
| Logarithmic circle integrability | Meromorphicity on sphere c \|R\| suffices; no nonzero-centre-germ assumption. Both log norm and positive log norm theorems exist at the pins. |

Read the reviewed library audit (ConformalMapping L0–L4 built), current ConformalMapping and FuchsianOrbifolds interfaces, UniversalCovers stages and DifferentialGeometry's induced-atlas scope. The package cites only Mathlib, Tau Ceti, itself and those existing upstream roadmaps. It has no upward atlas-layer dependency, `UPSTREAM:` id or `FoundationsAndLibraryIntegration` placeholder. Its three roadmap suppliers are already upstream; no new cross-tier move is required.

Screened every target by mathematical object as well as name against current TauCetiRoadmap/Completed and current Tau Ceti. In particular checked all nine post-snapshot roadmaps: AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory (including nested files), OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and RealAlgebraicGeometry; and Completed ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts. No extra overlap was found beyond the cover-atlas deferral. Real-time ODE/global-flow/Frobenius modules and the pre-Schwarzian chain rule do not supply this package's complex linear ODE germs or full Schwarzian targets.

Read current Cayley, universal-cover manifold, Shimizu, roots-of-unity quotient/descent and Herglotz sources. The exact ownership removals/variants are:

| Input target | Current supplier | Package disposition |
| --- | --- | --- |
| U0/cayley-coordinate | `TauCeti.Analysis.Complex.UpperHalfPlane.Cayley` | Previous removal retained; formulas/checks only under ownership. |
| U0/cover-complex-structure | `TauCeti.Geometry.Manifold.Instances.UniversalCover`: `instChartedSpace`, `instIsManifold`, `isLocalDiffeomorph_proj`, `contMDiff_iff`; DifferentialGeometry 2.3 | Previous removal retained; specialize complex atlas on the native carrier. |
| V0/local-log-integrability | Pinned Mathlib `MeromorphicOn.circleIntegrable_log_norm`, `circleIntegrable_posLog_norm` | Removed in this review; Layer 7 renumbered. |
| U0/power-descent | `TauCeti.Analysis.Complex.RootsOfUnity.Descent`: `descendPow_pow`, `differentiableOn_descendPow`; Quotient: `image_pow_ball` | Kept roots-cover derivative, omission and ramification variant; generic descent is imported. |
| L0/herglotz-log | `TauCeti.Analysis.Complex.Herglotz`: `DiffContOnCl.circleAverage_herglotzRieszKernel_smul_re_add` | Kept normalized-log construction/identification variant; general integral formula is imported. |
| G0/shimizu-specialization | `TauCeti.Analysis.Complex.Fuchsian.Shimizu`: `Subgroup.inv_le_abs_apply_one_zero_of_upperRightHom_mem` | Generic c≠0 inequality imported; retained roots-specific two-entry bound and c=0/full-stabilizer argument. |

Current roadmap checkout: `0d144d044dacebca17b654695b6f1ad58f159b27`.
Current Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Current Mathlib: `6b7abb3c7686292736be2955bd3eb9ebf63b456a`.
The current inputs were inspected read-only; no build or dependency update was run there.

## Adversarial mathematics pass

The following table covers every retained numbered target, the three native deferrals, auxiliary definitions and standing conventions. Instances are independent mathematical checks; they are not formal proofs of the admitted targets. “Retained” means the stated guards survived the check. For conventions, fixed explicit scalar witnesses in the README and corresponding Lean examples where statable at the pins.

| Statement checked | Instances, failure mode and conclusion |
| --- | --- |
| 0.1 Linear equation, initial jet, companion | n=1 with zero coefficient gives constants; n=2 gives affine functions. For x² the order-three jet is (0,0,2). The companion [[0,1],[0,0]] rejects constant vector (0,1). n=0 and a coefficient 1/x at zero excluded. Retained. |
| 0.2 Initial-value/germ equivalence | Inverses send c to c, (u,v) to u+v(x−x₀), and (0,0,2) to x². Checks detect loss of a coordinate or factorial normalization. Retained full linear-equivalence README target. |
| 0.3 ODE continuation | Exp(−x) for y′+y=0 continues uniquely; punctures of the coefficient domain cannot be crossed using the ordinary-point theorem. Retained path/domain guards. |
| 0.4 Global solution space | y″=0 on a simply connected disc has dimension two; a punctured domain can have monodromy. Retained simply-connected hypothesis and EqOn uniqueness. |
| 0.5 Meromorphic basis | 1/x is allowed with pole bound one; exp(1/x) is single valued but essential. A puncture outside Ω lacks even a zero germ represented on Ω. Retained deleted-neighbourhood/full-basis guards. |
| 0.6 Algebraic pole clearing | Powers of the rational minimal polynomial clear poles over algebraic points; a nonconstant map p is needed so q(p(x)) is not identically zero. Finite maximum controls all basis elements. Retained. |
| Native Cayley | C(0)=i, C(1/2)=3i; inverse directions agree; z=1 has no interior coordinate value. Imported. |
| Native cover atlas | Disc gives injective projection, annulus does not; lifted plane-chart overlaps are identity restrictions. Compatibility is not literal equality of chart records. Imported. |
| 1.1 Surface uniformization | ℂ and ℂ∖{0} show why two omitted values are needed; a cover surface need not be a planar subset. Retained actual surface-uniformization target. |
| 1.2 Pointed cover and uniqueness | Identity and dilation are covers; z² fails local covering at zero; a component-only cover fails surjectivity to a disconnected Ω. Retained genuine subtype covering. |
| 1.3 Radius | Identity radius one; dilation radius two; normalized map z/2 gives reciprocal derivative two. The infimum is a nonempty singleton only when a cover exists. Retained domain guards. |
| 1.4 Extremality | F(az), \|a\|<1, has strictly smaller derivative; equality gives a rotation. Retained full based-lift/equality statement. |
| 1.5 Radius monotonicity | Inclusion D(0,1)⊂D(0,2) gives 1≤2; disconnected component ambiguity excluded. Retained. |
| 1.6 Roots cover | N=2 omits ±1, but allows 0. Cusp at 1 is a limit. F(iz) has imaginary derivative despite unchanged norm. Added README and Lean orientation control. |
| 1.7 Étaleness | z² at zero is a non-example; a genuine holomorphic cover has nonzero derivative at every disc point. Retained. |
| 1.8 Equivariance/action sign | For N=3, τ=2i maps under the displayed matrix to (3√3+8i)/13; inverse Cayley gives ζ₃⁻¹/3. Retained inverse rotation for the standard left action. |
| 1.9 Power descent | z and −z agree at N=2; F=az+O(z^(N+1)) yields G=a^Nw+O(w²). Other zero lifts have order N. Added named ramification API/check; generic descent imported. |
| 1.10 Descent derivative | Nonzero a gives G′(0)=a^N; norm is \|a\|^N. n=0/root ambiguity excluded by N≥2. Retained. |
| 1.11 Projective deck realization | Disc deck identity versus annulus nontrivial deck action; disc automorphisms transport through C and act freely. Retained analytic-cover and effective PSL scope. |
| 2.1 Schwarzian | Affine map gives zero; x² gives −3/(2x²) away from zero; inversion gives zero away from its pole. Totalized critical-point value has no analytic meaning. Retained. |
| 2.2 Chain rule | Composing x² with 2x scales the outer Schwarzian by four; omitting the square fails. Retained nonzero derivatives. |
| 2.3 Möbius invariance | Inversion preserves Schwarzian off its denominator; determinant zero is excluded. Retained. |
| 2.4 Quotient ODE | Independent solutions 1,x give quotient x and Q=0. For x², Q=S/2=−3/(4x²); dependent solutions or vanishing denominator fail. Retained. |
| 2.5 Hempel formula | Three finite punctures leave infinity unpunctured; two finite punctures are outside hyperbolic scope. Moving one puncture to infinity gives a plane-domain cover. Added explicit construction route. |
| 2.6 Infinity constraints | Laurent coefficients of X⁻¹,X⁻²,X⁻³ are Σm, Σ(mp+1/2), Σ(mp²+p). Their vanishing gives O(X⁻⁴). Retained. |
| 2.7 Symmetric accessories | For N=2, m₀=0 and root coefficients ∓3/4 satisfy all three constraints; root sums verify general N≥2. Retained sign. |
| 2.8 Roots rational Schwarzian | N=2 at x=0 gives 3/2; roots are poles. Terms x^(N−2) require N≥2. Retained. |
| 2.9 Inverse equation | N=2 at zero gives η″+3η/4=0, agreeing with half the Schwarzian. Retained sign and factor four in denominator. |
| 3.1 Boundary factor | a=0 gives z; a=1 gives −1 even at z=1; a=1/2 at zero gives −1/2. Interior factor is native unphased Möbius map. Retained guarded branch. |
| 3.2 Finite product | Empty product one; boundary-only product norm one; multiplicity two at zero gives z². Strict interior norm needs an interior factor of positive multiplicity. Retained. |
| 3.3 Zero removal | g=z² removes both multiplicities; g=z−1 leaves 1−z after boundary factor −1, so boundary zeros remain. Clarified nonzero disc germ. |
| 3.4 Normalized log | g=1 gives L=0; g=exp z gives L=z; g with a zero on the closed circle violates the input. Native formula applied only after constructing L. Clarified variant. |
| 3.5 Derivative integral | g=exp z gives g′/g=1; constant g gives zero; 2w/(w−z)² is derivative of the kernel. Retained interior and boundary-integrability guards. |
| 3.6 Phase | g=i produces integral exponential one; multiplying by phase i reconstructs g. Retained. |
| 3.7 Smoothing | Boundary-zero g=z−1 requires an enlarged radius avoiding zeros; open-disc zero freeness alone cannot supply closed-disc Herglotz. Retained limiting construction. |
| 3.8 Quotient representation | g=0 handled separately; g=h=1 has zero log bounds; sup\|h\|≤0 would be false. Retained ε>0 and logarithmic bounds; locator fixed. |
| 3.9 Quotient optimality | Constants g=1 and g=2 give lower bounds 0 and log 2; isolated h zeros use a.e. log identities. Retained h(0)=1. |
| 4.1 Gauss equation | Value one and derivative ab/c at zero satisfy c y′−ab y=0; c=0 would invalidate division. Retained all parameter pole guards. |
| 4.2 Transformed equation | At N=2 the coefficients are x(x−1)², (x−1)²/2 and 1/4+(x−1)/16. Branch differentiation supplies 1/N powers. Retained punctured branch. |
| 4.3 Special solutions | Leading terms x^(1/N),1 become u,1 after x=u^N; they are independent near zero. Retained branch and normalized ODE matching. |
| 4.4 Inverse ratio | J₂(0)=0, J₂′(0)=1, J₂‴(0)=3/2. First coefficient difference is 1/(2N). Denominator one at zero supplies a neighbourhood. Retained germ scope. |
| 4.5 Actual inverse | Positive derivative a gives ψ=J/a; source rotation by i requires division by ia rather than \|a\|. Retained orientation and both inverse germ compositions. |
| 4.6 Connection | k=0 gives −log x−2γ−2ψ(a); at a=1/2 the constant is 4log 2. DLMF scaled normalization must be multiplied by Γ(2a). Added locator/branch clarification. |
| 4.7 Digamma bound | k=1,a=1/4 is maximal for ψ(k+1)−ψ(k+a). The unshifted ψ(k) coefficient has opposite a-monotonicity. Retained corrected shift; added reciprocal-series locator. |
| 4.8 Tail | a_± stay in [1/4,3/4] including N=2; comparing them needs an a-derivative bound to gain 1/N. Retained M₀>0 and dominated differentiation target. |
| 5.1 Gamma expression | All arguments positive for N≥2; native N=1 expression zero through Γ(0), not a hyperbolic radius. Retained guard. |
| 5.2 Gamma positivity | N=2 has positive denominator; N=1 violates the positive-argument proof. Retained. |
| 5.3 Alternative Gamma | N=2 and N=3 numerical/special-value comparisons agree; duplication and reflection use positive arguments. Retained. |
| 5.4 Cusp ratio | As x→1 from below, both zero-balanced solutions have the same leading logarithm with different Gamma factors; radial inverse limit fixes real phase. Retained. |
| 5.5 Radius summit | N=2 gives Γ(1/4)^4/(4π²), N=3 gives Γ(1/6)^3/(12π^(3/2)); source rotations change derivative phase only. Retained every pointed cover. |
| 5.6 Log-Gamma | z=0 gives zero; linear term −γz, quadratic term ζ(2)z²/2. z=−1 is a pole. Added accessible locator; retained \|z\|<1/branch. |
| 5.7 Odd-zeta series | Even terms cancel; first coefficients are ζ(3)/(2N³), 3ζ(5)/(8N⁵). Every remaining coefficient is positive for k≥1. Retained. |
| 5.8 Positive remainder | Exponentiating gives positive ζ(3)^2/(8N⁶) in addition to higher odd terms; an upper O(N⁻⁶) alone would not give positivity. Retained effective tail target. |
| 6.1 Ideal polygon | N=2 gives four ideal sides and area 2π; vertices alone do not prove a fundamental domain. Retained side pairings/reflection identification. |
| 6.2 Primitive width | h₂=2; displaying translation 2h is not proof of primitiveness. Retained full stabilizer generator. |
| 6.3 Free deck group | N=2 gives rank two; elliptic rotation fixing i cannot belong nontrivially to a free deck action. Retained distinction between deck and larger group. |
| 6.4 Power stabilizer | At N=2 quotient order two; r^k belongs to deck subgroup exactly for N dividing k. Actual Cayley conjugation required. Retained. |
| 6.5 Full invariance | Equal Nth powers imply a constant root-of-unity ratio on the connected nonzero locus, then analytic continuation and a deck transformation. Retained full group, not just one generator. |
| 6.6 Quadrilateral | N=2 gives area π versus deck area 2π; centre angle 2π/N. Retained native hyperbolic area and ordering. |
| 6.7 Half rotation | With X=F^N, transform is X↦X/(X−1), an involution. X=1 is omitted. Either half-rotation direction gives the same power identity by Φ invariance. Retained. |
| 6.8 Triangle supergroup | N=2 areas π/2 and π; s²∈Φ. Reflection is antiholomorphic, hence outside PSL action. Retained measured actual triangle and index two; no erroneous Φ orbifold signature assigned to Ψ. |
| 7.1 Local counting | 1/z gives log r<0; one gives zero; boundary pole at a with r=\|a\| has zero weight. Retained closed-ball divisor plus separate centre term. |
| 7.2 Local characteristic | z gives zero below radius one; 1/z has proximity −log r cancelled by counting log r; constant c gives log⁺\|c\|. Retained native proximity. |
| 7.3 Counting positivity | Centre pole 1/z is a counterexample without order≥0; identically zero has infinite order and zero counting. Retained. |
| 7.4 Zero criterion/spike | Scalar spike is 2 at zero, one elsewhere, order zero and zero counting, but discontinuous/nonanalytic. A boundary pole is permitted. Retained continuity guard and open-disc conclusion. |
| Native log integrability | f=0 and a pole on the circle satisfy native totalized/a.e. theorem; no nonzero-centre assumption needed. Removed redundant target. |
| 7.5 Local Jensen | f=z gives mean log r, zero count log r, trailing coefficient one; 1/z gives opposite signs. Retained nonzero germ. |
| 7.6 First inversion | f=2z gives T(f)−T(1/f)=log 2, fixing sign; a centre pole is allowed. Retained trailing coefficient, not f(0). |
| 7.7 Translation proximity | f=0,a=1 gives zero; f=0,a=2 gives log 2. Pointwise positive-log triangle bounds both directions. Retained. |
| 7.8 Translated first main | f−a identically zero is excluded; leading coefficient of F^N−1 is −1, norm one. Retained coefficient/domain guards. |
| 7.9 Power law | n=0 gives constant one and zero on both sides; centre poles scale negative counting and positive proximity separately. Retained n∈ℕ. |
| 7.10 Radial monotonicity | Constants give equality; z has zero proximity for r<1; poles would invalidate holomorphic sub-mean reasoning. Retained zeros-compatible target. |
| 8.1 Ratio asymptotic | N=2 has a_−=1/4,a_+=3/4; common −2γ sign and parameter derivative gain 1/N. Retained compatible branch and denominator bounds. |
| 8.2 Cusp height | M≥M₀>0 and large N needed for effective expansion; ε lies strictly between zero and one. Retained selected quadrilateral cusp. |
| 8.3 Horoball | Identity with D=1 gives centre 1/2, radius 1/2. Negating matrix leaves diameter/tangency unchanged. Determinant one ensures a²+c²>0. Retained intersection with 𝔻 and excluded tangent point. |
| 8.4 Shimizu specialization | c≠0 uses \|c\|≥1/h; c=0 requires full primitive cusp stabilizer. h₂=2, identity gives h₂≥1. Retained full Φ group. |
| 8.5 Exceptional set | 0 is outside for M>0; large values have \|F^N−1\|>exp(MN), so cannot be in S itself. Retained sS and radius invariance. |
| 8.6 Exclusion | a²+c²≥1/(2h²) gives E≤4h²/D. With D=N²M/π², M=N/(1−r), get A(1−r)/N and require N>A. Retained strict threshold. |
| 8.7 Maximum growth | Large values would enter excluded sS; then log\|F\|≤log(exp M+1). Small N not covered by this argument. Retained effective N₀. |
| 9.1 Kernel mean | r=0 limit is 1/R²; for r<R the probability mean is 1/(R²−r²). R=r is divergent and excluded. Retained normalization. |
| 9.2 Boundary log L1 | g=1 gives zero; g=exp z has positive/negative means equal, so L1 is twice proximity. Retained g(0)=1 and zero freeness. |
| 9.3 Entropy bound | H=0,1 satisfy bound; mass 1/e at H=e reaches the 1/e correction. Retained normalization/nonnegativity. |
| 9.4 Log derivative | g=1 gives zero; exp(az) gives constant derivative a. Denominators r,R−r and g are guarded. Retained explicit log 2+1/e. |
| 9.5 Small-radius transfer | r→0 gives ρ=1/4,R→1/2; r=3/4 gives ρ=3/4,R=7/8. Two cases give R−ρ≥(1−r)/4. Retained. |
| 9.6 Omitted-power derivative | f=1−F^N has f(0)=1 and no zeros; bounds at ρ remove unbounded 1/r. Retained outer R=(1+r)/2. |
| 9.7 Pivot | p₂(2)=4/3, p_N(0)=0; totalized p₂(1)=0 is still a meromorphic pole. Retained omitted-root domain. |
| 9.8 Partial fractions | N=2,x=2 gives (2/2)(1+1/3)=4/3; coefficient 1/N is essential. Retained finite distinct roots. |
| 9.9 Chain identity | f′=−NF^(N−1)F′ and f=1−F^N cancel both signs; near zero both sides start −a^Nz^N. Retained N,F′,f nonzero. |
| 9.10 Lower bound | Power law and first main theorem lose only log 4, since trailing coefficient of F^N−1 has modulus one. Retained local characteristic. |
| 9.11 Fixed-level effective bound | N=2 is a required finite level; an r→1 asymptotic does not bound small r effectively by itself. Retained explicit C_N construction over all 0<r<1. |
| 9.12 Three maps | q and u compare by inversion/translation, p=1+u; at zero values 0,−1,0 fix coefficient modulus one. Retained log 4 difference. |
| 9.13 Omitted-linear derivative | g=1−F is zero free and g(0)=1; R=(1−r)/2 fails r<R at r=3/4. Retained corrected outer radius. |
| 9.14 Étale pole divisor | Simple local zero F=az gives F′/F≈1/z and 1/F≈1/(az), equal pole orders; critical-point zeros would fail simplicity. Retained F′≠0. |
| 9.15 Derivative reciprocal | F/F′ holomorphic even at F=0; first main theorem controls inverse of F′/F using its true centre coefficient. Retained radius positivity/odd-zeta bound. |
| 9.16 Pivot upper bound | Both factors F/(NF′) and f′/f are holomorphic; proximity product inequality applies without a global divisor. Retained. |
| 9.17 Large-N mean | Absorption uses N−1>0 and N/(N−1)≤2; outer maximum controls L_N. Retained large-N range. |
| 9.18 Finite completion | Empty small-level list when N₀=2 causes no problem; otherwise maximum of explicitly produced finite constants is effective. Retained. |
| 9.19 Uniform summit | N=1 would make the fixed-puncture argument and absorption fail; all three means use probability normalization. Retained N≥2 and rotation independence. |
| Standing conventions | Derivatives over ℂ; unscaled jets; positive real cover orientation; effective PSL/SL-lift sign invariance; full primitive stabilizer; local centre correction; totalized division distinguished from analytic extension; effective constants distinguished from bare existence. Witnesses appear in the rows above and Lean controls. |

Additional scalar verification used 449 successful independent checks: exact rational coefficient comparisons; finite root sums and pivot identities; N=2,3 Gamma special values and alternative formulas; random determinant-one horoball boundary circles and lift negation; chain identities; small-radius inequalities; probability-kernel quadrature; and the entropy extremizer. Numerical checks used ordinary floating-point arithmetic and are only diagnostics. The explicit witnesses and computation rules are recorded in the table; no scratch output is needed to interpret the verdict.

## Lean signature comparisons and validation

Read every Lean declaration. All data bodies are real expressions over native carriers; there are no admitted definitions/abbreviations/instances or theory-development chains. Every theorem and example is scoped to the relevant open domain, germ or genuine light covering record. The requested signature sample exceeds ten:

| Lean signature | README comparison |
| --- | --- |
| `LinearEquation.initial_value` | 0.2: ordinary point, positive order, analytic coefficients, arbitrary jet; germ equality rather than arbitrary global representatives. Full linear equivalence is additionally specified in the README. |
| `LinearEquation.global_initial_value` | 0.4: simply connected subtype and analytic equation; uniqueness is EqOn Ω. |
| `PointedCover.extremal` | 1.4: Ω open, actual based covering, holomorphic map into Ω; unique based lift, derivative bound and rotation equality case all present. |
| `RootsCover.exists_cover` | 1.6: N≥2; real positive derivative encoded by actual fields, cusp theorem separately stated. |
| `RootsCover.power_descent` | 1.9–1.10: holomorphy, omitted one, zero, root equation, derivative and EqOn uniqueness; no claim of a covering. |
| `schwarzian_comp_apply` | 2.2: analytic germs at x and g(x), both derivatives nonzero, squared derivative weight. |
| `roots_inverse_schwarzian` | 2.8: inverse germ whose value is in 𝔻, x^N≠1, exact rational numerator/denominator. |
| `herglotz_log` | 3.4: R>0, neighbourhood analyticity, nonzero on closed disc, g(0)=1; genuine L with exp L=g and L(0)=0. |
| `quotient_representation` | 3.8: closed-disc neighbourhood, ε>0, h(0)=1, both pointwise boundary log bounds. |
| `gauss_equation` | 4.1: all three parameter exclusions and \|x\|<1; actual native series and complex derivatives. |
| `inverseRatio.cover_inverse` | 4.5: actual oriented cover; inverse derivative scalar and both germ compositions. |
| `roots_conformal_radius` | 5.5: every pointed cover, N≥2, exact derivative norm γ_N; no orientation unnecessarily imposed. |
| `discCounting.zero_iff` | 7.4: disc meromorphicity, nonnegative centre order and 0<r<1; conclusion detects nonnegative germ orders, without asserting pointwise analyticity. |
| `gammaRadius.positive_expansion` | 5.8: N≥2, positive remainder and an absolute N⁻⁶ bound, with native real parts of zeta values. |
| `local_first_main_translation` | 7.8: nonzero shifted germ and correct translation error/sign. |
| `half_rotation_involution` | 6.7: actual oriented roots cover and interior z; positive half-rotation gives the same power involution as the displayed inverse-direction matrix by Φ invariance. |
| `large_n_max_growth` | 8.7: absolute C and N₀, every pointed roots cover, circle radius 0<r<1. README additionally requires effective extraction of constants. |
| `normalized_log_derivative` | 9.4: zero-free closed-disc neighbourhood, g(0)=1, 0<r<R; same explicit constant and rational factor. |
| `uniform_mean_growth` | 9.19: absolute C, N≥2, arbitrary source phase, 0<r<1, all three native proximity bounds. README retains the additional effective-constant construction. |

The final `Suggested.lean` is **458 lines**, with 13 definitions, three structures, 19 theorems and 35 examples. Ran `lean-check` on the submitted revision and after the added orientation example. Final result: **exit 0, 54 warnings, all `declaration uses sorry`; zero errors and zero other warnings**. Available memory was 99 GiB before the final serial compile. No language server or library build was started. Elaboration verifies types, not the truth of the admitted statements.

Other checks:

- `python3 scripts/check_blueprint.py research/blueprint/packets/ConformalMappingPartII.json`: zero errors and zero warnings on the unchanged input.
- Target count, namespace-normalized API comparison, source/Needs paragraphs and definition Checks: passed.
- `python3 research/blueprint/intake.py check-files` on all changed deliverables and handoff: zero problems.
- JSON and metadata validation, package shape/admitted-data scan, private-path scan and `git diff --check`: passed.

No unresolved package defect remains. Formal proofs, heavy carrier constructions, source-invoked analytic interiors and effective constants remain the work specified by this accepted roadmap.
