# Relative Fargues–Fontaine function theory, Part II

This roadmap builds the holomorphic function theory that connects the relative period rings to the absolute schematic Fargues–Fontaine curve over a general perfect field. Its endpoints are the Dedekind affine charts, the weighted curve, functoriality under field extensions, the positive-line presentations, and reconstruction of the adic quotient from the scheme equipped with its radial norms. Along the way it gives usable interfaces for zeros, locally finite divisors, closed ideals, interval bundles and continuous descent.

The parent `RelativeFarguesFontaine` already owns ramified Witt vectors, the relative annular carriers, primitive degree-one untilts, de Rham completions and the graded Proj construction. `VectorBundlesAndIsocrystals` already owns the geometric curve and its bundle classification. This continuation compares those constructions with the classical function theory and adds the arbitrary-perfect-field calculations they need. It imports general convex analysis, Fréchet–Stein theory, finite-group scheme quotients and relative Proj; their general theories are not additional targets here.

This is a complete **target-level planning pass**, with all twelve layers planned. It is not a closed plan or an implementation. Seven mathematical gaps and five open supplier extensions are named below; two further interfaces consume existing upstream roadmaps. Every packet node has implementation status `unchecked`. The compact suggested file states only milestones whose carriers are available at the pinned libraries. Definitions requiring future carriers, their APIs, tests and proof plans live in this document.

Independent review **REV-DESIGN-RelativeFarguesFontainePartII**, 19 October 2026: accepted after checking all 109 targets and 15 pinned interfaces. The packet records 72 verified and 37 corrected node verdicts, 51 confirmed source findings, and the exact open obligations. Acceptance concerns this planning pass; the seven gaps and five open supplier extensions remain unresolved.

## Conventions and carriers

Fix a prime p, a complete discretely valued coefficient field E with finite residue field F_q, q a power of p, and a uniformizer pi. Normalize its usual absolute value by |pi|_E=q^-1. Mixed characteristic means a finite extension of Q_p; equal characteristic permits E=F_q((pi)). Fix a nontrivially valued, perfect, complete rank-one field F of characteristic p, with a chosen embedding F_q→F. Its valuation is v_F=-log_q|.|_F, its valuation ring is O_F, its maximal ideal is m_F, and its residue field is k_F. The value group need not be discrete. Choose 0<|varpi|_F<1 only for the dense localization; comparisons must be independent of that choice.

A means the parent's W_OE(O_F), with its weak topology. A Witt element has a unique one-sided expansion sum_(n≥0)[x_n]pi^n. Write B^b=A[1/pi,1/[varpi]], B^{b,+}=A[1/pi], B_I for the imported separated completion at the family of radii in a nonempty interval I⊂[0,1], and B=B_(0,1). For 0<rho≤1 the raw Gauss norm of a dense element is sup_n|x_n|_F rho^n. The **separate endpoint-zero norm** is q^(-v_pi(x)); it is not evaluation of the same formula at rho=0. Put v_r=-log_q|.|_(q^-r), whereas v_0 in the positive-ring/boundary notation means inf_n v_F(x_n). Distinguish that v_0 from v_pi throughout.

For rho=q^-r strictly between zero and one, use n_rho=|.|_rho^(1/r) when a normed E-space API is needed. Then n_rho(pi)=q^-1. Use n_0=|.|_0, and the maximum of normalized endpoint norms on a compact interval avoiding 1. These norms give the same topology as the raw endpoint Gauss family. Raw Gauss norms are retained for multiplicative and Newton calculations. On intervals containing 1 the induced scalar topology on E is discrete; the usual Banach E-space theorems are applied only after removing that endpoint.

B_I^+ is the closure of B^{b,+} in B_I; B_rho^+ is its single-radius version, and B^+ is their intersection inside B. Superscript plus here is this positive-function subring, not the power-bounded subring B_I^circ. Write E-dagger=colim_(rho→0) B_[0,rho] and R=colim_(rho→0) B_(0,rho]; these are the parent's bounded overconvergent field and Robba germ, respectively. B and its Robba germ are different carriers. The classical point set Y_F consists of irreducible primitive principal ideals of A. A point has primitive degree deg(y) and radius ||y||. Y_(F,I) restricts that radius to I. It is a set of classical points, distinct from the whole adic or Berkovich spectrum.

A source slope of a Newton polygon is the negative of its geometric derivative. Its Legendre convention is L(P)(r)=inf_x(P(x)+rx)=-P*(-r), with P* the existing convex conjugate. Multiplicity is horizontal length, or the left-minus-right derivative of v_r at an interior slope. Thus pi-[a], 0<|a|<1, has source slope v_F(a) and valuation min(r,v_F(a)). Endpoint slopes are kept with their one-sided conventions; an interior convention is never silently imposed at radius 1.

Frobenius phi raises Teichmuller coefficients to q-th powers and fixes pi. On primitive ideals its point action sends (a) to (phi(a)); consequently ||phi(y)||=||y||^q and div(phi(f))=phi(div(f)). This fixes the action used in the product and interpolation formulas. Set P_d=B^{phi=pi^d} and import P=direct_sum_(d≥0)P_d and X=Proj(P) from the parent. For a chosen t∈P_1 minus zero, Be_t=(B[1/t])^{phi=1}=(P[1/t])_0. It is not the whole invariant rational-function field. De Rham rings at a point use the parent ramified completion; in the Q_p case compare with the existing Mathlib BDeRhamPlus and BDeRham rather than defining replacements.

Unless a target explicitly says geometric, F is only assumed perfect with the standing hypotheses. “Geometric” means F algebraically closed. E_h and arbitrary unramified constant twists require the indicated residue constants inside F; when these constants are absent, the target must use descent rather than insert them into F by notation. Put C=completion(Fbar), with G_F=Gal(Fbar/F). A continuous semilinear action is measured in the named Banach, weak Witt or finite-jet topology, not merely as an abstract module action. Finitely generated, finitely presented, finite free, finite projective, coadmissible and closed are separate conditions.

A locally finite divisor on Y_I meets each compact subannulus in finitely many points. A divisor on Y/phi^Z has finite support on the orbit set and uses the primitive-degree weight. These conventions match Tau Ceti's finite Weil divisor and weighted degree on finite supports; they do not assign the generally infinite E-vector-space dimension of K_y as a point weight. A weighted complete curve here means the source's regular noetherian one-dimensional scheme with the weighted product formula. It does not assert finite-type properness over E.

## Build order and ownership

Build HF0–HF7, then HF9–HF10, then HF8 and HF11. In particular, the Frobenius-line reconstruction in HF8 consumes interval bundle equivalence and effective continuous descent. Numerical labels retain the thematic grouping; the roadmap's stage list uses the actual build order.

| Layer | Output | Main inputs |
| --- | --- | --- |
| HF0 | Completed norm and Newton calculus, coefficient changes | Parent RF0; convex duality; locally convex limits |
| HF1 | Boundary and positive functions, explicit coordinate and PD models | HF0; annulus foundations; crystalline envelopes |
| HF2 | Primitive equations, marked untilts, metric and Lubin–Tate coordinates | HF0–HF1; parent RF2; perfectoid tilting; Lubin–Tate theory |
| HF3 | Geometric zeros and compact divisibility | HF2; existing geometric PID charts |
| HF4 | General-field points, weighted zeros and products | HF3; quantitative trace and cohomology |
| HF5 | Closed ideals, meromorphic functions and invariants | HF4; divisor majorants and inverse limits |
| HF6 | Eigenvector norms, orbit divisors and products | HF1, HF3, HF5; parent RF3 |
| HF7 | General Dedekind charts and weighted schematic curve | HF6; de Rham descent; positive eigenvector cohomology |
| HF9 | Interval sheaves, coherent systems and bundle gluing | HF5; ND.2 Fréchet–Stein theory; parent RF4 exact-square gluing |
| HF10 | Finite annular extensions and continuous descent | HF4, HF9; almost purity and quantitative matrix corrections |
| HF8 | Functoriality, positive-line Proj and Runge reconstruction | HF7, HF9–HF10; scheme quotients and relative Proj |
| HF11 | Arithmetic and maximal-completeness examples | HF7–HF8; analytic-field differentials and precise obstructions |

The following interfaces fix ownership and prevent an overly broad stage name from hiding a missing hypothesis.

- Parent RF0 supplies `ramified-witt-universal-property`, `ramified-v-adic-expansion`, `coefficient-weak-topology`, the annular rings, their coefficient/anchor comparisons and finite-etale compatibility. HF0 proves the absolute normalization and the completed Newton/zero calculus on those carriers.
- Parent RF2 supplies `primitive-untilt-correspondence`, `BdR-completion-and-filtration` and the complete de Rham DVR. HF2 adds arbitrary primitive degree, metric calculations and explicit division; HF4 adds finite-degree marked untilts. `PerfectoidSpaces:P3/untilt-of-algebraically-closed-field` supplies the algebraic-closedness route used instead of the unfinished p=2 root calculation.
- Parent RF3 supplies `graded-algebra-and-algebraic-curve-map` and `positive-frobenius-eigenvector-restriction`. `VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point` and its geometric PID comparison already own the geometric curve, Picard and Harder–Narasimhan theory. HF6–HF7 refine their function-theoretic interfaces and add the non-geometric character class group, without a second curve construction.
- `LocallyAnalyticDistributions:L0/locally-convex-limits` and `L0/nonarchimedean-locally-convex-spaces` supply the general topology of limits. `LocallyAnalyticDistributionsPartII:ND.2/frechet-stein-algebra`, `coadmissible-module` and `coadmissible-theorems` already own the general complete nonarchimedean-field theory, flat dense Banach systems, base change and exact global sections. HF9 verifies its annular hypotheses. This import does not prove that every coadmissible module is finitely generated; G-GENERATORS isolates that extra analytic obligation for bundles.
- Current upstream `OptimalTransport`, Layer 5(1)–(2), supplies proper EReal convex functions, conjugates and Fenchel–Moreau on real dual pairs. R-CONVEX records the exact import. HF0 specializes the signs and the coefficient polygon, rather than planning convex analysis again.
- `SchemeAndStackFoundations:SF.0/relative-proj` supplies the positive-Veronese isomorphism without a degree-one-generation assumption. For the coefficient twisting line, a basis gives a graded comparison; changing basis acts by a degree-dependent scalar whose action on degree-zero basic-open localizations is trivial. `SF.1/finite-group-quotient` requires every orbit in an affine open and freeness on geometric points. HF8 proves those conditions; freeness on underlying closed points would be the wrong condition.
- Parent `RF4:vector-bundles/finite-projective-glueing-over-exact-square` requires the module-surjectivity and maximal-spectrum conditions of its exact square. Ring Mayer–Vietoris alone does not discharge it. G-MATRIX records the missing analytic application. Current upstream `AlgebraicVectorBundles` already owns the generic affine finite-projective/finite-locally-free correspondence; it does not supply the noncompact interval theorem.
- `PerfectoidSpaces:P9/finite-galois-descent-of-modules` supplies effective finite descent. Its infinite-tower full-faithfulness target is not the effectivity needed in HF7 and HF10. R-TATE names the additional quantitative complete descent, instead of declaring that the P9 interface is stronger than its statement.
- `LubinTateFormalModulesAndQuasiCanonicalLifts` supplies the mixed-characteristic formal group, Tate module and logarithm. R-LT asks for its all-local-field continuation; equal characteristic is not deduced by dropping its finite-Q_p hypothesis. `CrystallineCohomology:CR.0` supplies the PD and completed-envelope carriers; R-CRYS specifies the pro-crystalline interpretation. R-KT and R-BC similarly keep general Berkovich differentials and Banach–Colmez representability obstructions with their existing owners.

The pinned audit for the parent does not replace these direct statement checks. The current read-only upstream roadmap and library trees were also screened, including the nine newer roadmap families absent from the atlas snapshot. The relevant additional ownership is the affine vector-bundle correspondence and the Q_p period-annulus/Frobenius-quotient construction for arbitrary perfect F. Current Tau Ceti already has `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf.finiteProjectiveEquiv` in `VectorBundle.Affine.Basic`, and the `TauCeti.FarguesFontaine.spaY`/`spaX` carriers, open quotient map and wandering windows. These existing objects are imported. The quotient module leaves the sheaf and affinoid-chart identifications to subsequent work; HF8 adds reconstruction from schematic charts and radial norms.

## Pinned library interfaces

The baseline is Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` with Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Each declaration below was read in its pinned source. Current-tree checks used TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The newer trees were read only; the suggested file elaborates at the pins.

| Declaration | Exact contribution to this plan |
| --- | --- |
| `mathlib:WittVector.fontaineTheta` | The p-typical Fontaine ring homomorphism for p-adically complete rings; the ramified Q-compatible construction must compare with it when E=Q_p. |
| `mathlib:WittVector.fontaineTheta_teichmuller` | Evaluation of Fontaine theta on a Teichmuller representative, used for the p-typical comparison. |
| `mathlib:surjective_fontaineTheta` | Surjectivity of p-typical theta under surjectivity of Frobenius modulo p, not an arbitrary ramified theorem. |
| `mathlib:fontaineThetaInvertP` | Theta after inverting p on source and target; comparison carrier for de Rham completion. |
| `mathlib:BDeRhamPlus` | The existing p-typical completion at ker(theta after inverting p). No new B_dR carrier is planned. |
| `mathlib:BDeRham` | Localization of the existing de Rham-plus ring at the images of generators of ker theta. |
| `mathlib:IsBezout` | Every finitely generated ideal is principal. It does not assert that all ideals are principal. |
| `mathlib:IsBezout.TFAE` | For a Bezout domain, noetherianity, principality, unique factorization and well-founded divisibility are equivalent. The degree milestone supplies a further hypothesis. |
| `mathlib:ContinuousLinearMap.isOpenMap` | A surjective continuous linear map between complete normed spaces over a nontrivially normed complete field is open. |
| `mathlib:ContinuousLinearMap.exists_nonlinearRightInverse_of_surjective` | Surjectivity provides a norm-bounded nonlinear right inverse; continuity or linearity of that section is not assumed in Newton correction. |
| `tauceti:TauCeti.AlgebraicGeometry.WeilDivisor` | The finite divisor carrier X -> finitely supported Z. Locally finite divisors on noncompact annuli need a refinement, not a replacement. |
| `tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.weightedDegree` | The additive weighted degree sum_x D(x)w(x), directly used on finite Frobenius-orbit divisors. |
| `tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.ofPoint` | The finite point divisor used by the orbit-divisor compatibility tests. |
| `tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.weightedDegree_ofPoint` | A single point divisor has degree its specified weight; validates the degree convention. |
| `mathlib:WittVector.Isocrystal` | Frobenius-semilinear automorphisms over the Witt fraction field of arbitrary perfect k; finite-dimensionality is separate. This replaces the narrower breve-E supplier for HF1. |

Mathlib's p-typical theta statements use a commutative p-adically complete ring R, a prime p and the indicated nonunit hypothesis; surjectivity additionally assumes Frobenius on R/p is surjective. They do not provide theta for every ramified coefficient field. Its BDeRhamPlus is the completion after inverting p, not a completed ramified annulus. `IsBezout` only says finitely generated ideals are principal. The open mapping input uses complete normed spaces over a nontrivially normed complete field; its bounded nonlinear section is sufficient for the quadratic iteration and need not be continuous or linear. The finite divisor API has a finite-support carrier; local finiteness on a noncompact annulus is a separate refinement.

## Targets, proof plans and checks

Each target below names its packet id, mathematical statement, direct dependencies, proof path, source locator and acceptance check. Additional hypotheses are part of the target, alongside the standing conventions above. Definition and construction targets include their use-derived API and three discriminating unit tests. These are mathematical acceptance tests for future implementation; they are not claims that the future objects have already been constructed.

## HF0 — Gauss norms, Newton polygons and completed annuli

Compare the parent period annuli with completion of ramified Witt Laurent series. Establish the coefficient norm formulas at radii 0 and 1, weak-topology comparison, Legendre duality, Newton slope multiplicities, compact norm stabilization, injective restrictions, and the ramified change-of-coefficient-field formula.

Layer status: **planned**. No additional local mathematical gap is claimed; target and interface review remains.

### Classical and relative period annuli

Target `HF0/absolute-annulus-comparison` (comparison).

For S=Spa(F,O_F), identify the completion of B^b=A[1/pi,1/[varpi]] for the norms |sum_n[x_n]pi^n|_rho=sup_n |x_n| rho^n (0<rho<=1), and the separately defined norm |x|_0=q^(-v_pi(x)), with the parent interval ring after its radius conversion. The comparison preserves E-algebra operations, each interior norm, restrictions and Frobenius. For E=Q_p it is the upstream AdicSpaces Layer 6 ring B^I. If 1 belongs to I, E is given the discrete topology; if 1 does not belong to I, use its local-field topology. For rho=q^-r with 0<rho<1, the Banach E-norm is n_rho(x)=|x|_rho^(1/r), so n_rho(pi)=q^-1. At rho=0 use n_0=|.|_0. On a compact interval avoiding 1 take the maximum of these normalized endpoint norms; its topology is that of the original Gauss norms. The unnormalized Gauss norms are used for Newton calculus, not as E-homogeneous norms.

Direct prerequisites: `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`, `RelativeFarguesFontaine:RF0:integral-Y/ramified-v-adic-expansion`, `RelativeFarguesFontaine:RF0:annuli/relative-extended-robba-rings`, `RelativeFarguesFontaine:RF0:annuli/annular-coefficient-choice-and-anchor-comparisons`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve`.

Proof plan:

1. Use the imported ramified Witt construction and the absolute specialization of its annular charts.
2. Compare norms on the common dense localization and extend by separated completion.
3. For I containing 1 verify the induced norm on E is trivial; do not transport a Banach E-structure with the usual norm across this endpoint.

Source: FF17, Def. 1.6.1–1.6.2 and Examples 1.6.3–1.6.5, pp. 68–70; §1.4.1, p. 61.

Check: The dense-ring comparison identifies topological rings and all restriction maps, including the exceptional endpoint-1 scalar topology.

### Ramified Gauss norm calculus

Target `HF0/gauss-coefficient-calculus` (theorem).

On B^b each interior Gauss norm is multiplicative, nonarchimedean and independent of pi. It is given by the coefficient formula sup_n |x_n| rho^n; in particular |[a]|_rho=|a| and |pi|_rho=rho. These two values and multiplicativity alone are not a uniqueness assertion without the coefficient formula or a continuity hypothesis. For x in A and k>=0 put N_k(x)=max_(0<=n<=k)|x_n|. Then N_k(x+y)<=max(N_k(x),N_k(y)), N_k(xy)<=max_(i+j=k)N_i(x)N_j(y), N_k(pi x)=N_(k-1)(x) with N_(-1)=0, and N_k(phi x)=N_k(x)^q. These estimates pass to the completions. For rho=q^(-r), v_r(phi x)=q v_(r/q)(x).

Direct prerequisites: `HF0/absolute-annulus-comparison`, `RelativeFarguesFontaine:RF0:annuli/witt-seminorm-lambda-mu`.

Proof plan:

1. Derive coefficient bounds from homogeneity and integrality of the ramified Witt addition and multiplication polynomials.
2. For multiplicativity use the first minimizing indices n_0,m_0; the distinguished product coefficient is at index n_0+m_0, with pi exponent n_0+m_0. Its initial term cannot cancel. The printed product of the indices is corrected.
3. Compare the coefficient norms under uniformizer substitution using the Witt coefficient estimates and continuity; compute Frobenius on Teichmuller coefficients.

Source: FF17, Lemma 1.4.2, Propositions 1.4.3 and 1.4.5, pp. 61–63; Proposition 1.4.9, p. 64.

Check: Check [a]pi^n has norm |a|rho^n and Frobenius sends its norm to |a|^q rho^n, fixing the radius variance.

### Radial limits and coefficient topology

Target `HF0/radial-limits-and-completeness` (theorem).

For x=sum[x_n]pi^n in B^b, the limits |x|_rho as rho approaches 0 from above and 1 from below recover respectively the pi-adic leading index and sup_n|x_n| in the precise rescalings v_r(x)/r -> v_pi(x) as r->infinity and v_r(x)->v_0(x):=inf_n v_F(x_n) as r->0. On A, every interior norm induces the imported weak topology, |.|_0 induces the pi-adic topology, and |.|_1 induces the [varpi]-adic topology; A is complete for all these norms. For mixed-characteristic E and epsilon near 1 but epsilon!=1, |[epsilon]-1|_1=1.

Direct prerequisites: `HF0/gauss-coefficient-calculus`, `RelativeFarguesFontaine:RF0:integral-Y/coefficient-weak-topology`.

Proof plan:

1. Bound the leading coefficient and the tail separately in the two limits; v_r is an infimum of affine functions.
2. Use the parent coefficient-topology theorem for interior radii. For endpoint 1 use the multiplicative [varpi]-adic filtration and coefficientwise convergence; the pi-adic endpoint is Witt completeness.
3. For the discontinuity test reduce the Witt subtraction identities and use Frobenius iteration; pointwise convergence of coefficients is insufficient for the supremum norm.

Source: FF17, §1.4.1, pp. 61–63; Definition 1.4.10, Proposition 1.4.11, Remark 1.4.12, Proposition 1.4.13 and Corollary 1.4.15, pp. 64–65.

Check: The limits distinguish |.|_0 from the ordinary rho=0 substitution and distinguish weak convergence from endpoint-1 convergence.

### Legendre transforms and Newton polygons

Target `HF0/legendre-newton-conventions` (definition). Atlas planet: **Newton polygons**.

Import proper lower-semicontinuous EReal-valued convex functions and Fenchel–Moreau duality from OptimalTransport Layer 5. In the real dual pair specialize its conjugate P* by L(P)(r)=-P*(-r)=inf_x(P(x)+rx), so P(x)=sup_r(L(P)(r)-rx). The source slope is the negative geometric derivative. For nonzero x in B^b define Newt(x) as the greatest lower-semicontinuous convex decreasing minorant of the coefficient data (n,v_F(x_n)), with value +infinity left of v_pi(x). Its epigraph is the closed convex hull of the upper vertical and right horizontal rays from those points. Its transform equals v_r(x) for r>=0, including the coefficient-infimum value at r=0; for r<0 it is -infinity. The separate norm at radius zero remains v_pi, not this r=0 value. Specialize infimal convolution to these polygons; finite-slope multiplicity is horizontal length. This node owns the polygon and sign bridge, not general convex duality.

Direct prerequisites: `HF0/gauss-coefficient-calculus`, `tauceti:TauCetiRoadmap/OptimalTransport#layer-5-convex-analysis-brenier-and-polar-factorization`.

Proof plan:

1. Specialize the imported proper closed convex carrier to the real dual pair, retaining infinite endpoint values. Transport the generic conjugate identities through r |-> -r and output negation.
2. Adjoin upper vertical and right horizontal rays to the coefficient points before taking the closed convex hull. Supporting lines with nonpositive geometric slope and the coefficient formula give the Gauss transform for r>=0; the right rays force value -infinity for r<0.
3. Use imported biduality to recover the polygon from that transform; use closed infimal convolution when needed.

Source: FF17, §1.5.1–1.5.2, pp. 66–67.

Check: The plus sign in the transform and the negative-geometric-slope convention give positive slopes for pi-[a] when 0<|a|<1.

API derived from uses: `HF3/linear-zero-extraction` — Recognize a zero from a positive slope.; `HF4/weighted-newton-zero-formula` — Read weighted zero multiplicity from the polygon..

| Proposed declaration | Role | Mathematical interface |
| --- | --- | --- |
| `legendre_newton_conventions.transform` | data | L(P)(r) is the infimum of P(x)+rx over x. |
| `legendre_newton_conventions.bidual` | characterisation | For proper closed convex P, taking the stated supremum recovers P. |
| `legendre_newton_conventions.coefficient_formula` | compatibility | For r>=0, L(Newt(x))(r)=inf_n(v_F(x_n)+nr); for r<0 it is -infinity. The r=0 coefficient-infimum is different from the radius-zero pi-adic norm. |
| `legendre_newton_conventions.convolution` | compatibility | L(P star Q)=L(P)+L(Q), with closure when the infimal convolution is not already closed. |

Unit tests:

- `legendre_newton_conventions.linear_factor` (computed): For pi-[a], 0<|a|<1, the polygon from (0,v_F(a)) to (1,0) has source slope v_F(a).
- `legendre_newton_conventions.monomial` (degenerate): For nonzero [a]pi^n, Newt is +infinity at x<n and equals v_F(a) for x>=n. Its transform is v_F(a)+nr for r>=0 and -infinity for r<0; a single finite point would fail this test.
- `legendre_newton_conventions.sign_and_sum` (non-example): The product of factors of distinct slopes s<t has slope multiset {s,t}; it does not have the single slope s+t.

### Newton products and Jensen formula

Target `HF0/newton-product-and-jensen` (theorem).

For nonzero x,y in B^b, Newt(xy)=Newt(x) star Newt(y). Source slopes concatenate with horizontal multiplicity. For x=product_(i=1)^d(pi-[a_i]), all 0<|a_i|<1, the slopes are v_F(a_i), and v_r(x)=sum_i min(r,v_F(a_i)). In particular integrating the jumps of the one-sided derivatives recovers the change in v_r, the nonarchimedean Jensen identity.

Direct prerequisites: `HF0/legendre-newton-conventions`.

Proof plan:

1. Apply multiplicativity of Gauss norms and Legendre biduality.
2. For a linear factor calculate the two affine terms directly.
3. Integrate the piecewise constant derivatives; keep finite products here, with locally finite products treated after convergence.

Source: FF17, §1.5.1–1.5.2, Example 1.5.3 and Remark 1.5.4, pp. 66–67.

Check: A two-factor example detects the erroneous interpretation of polygon multiplication as pairwise addition of slopes.

### Completed annuli and faithful restriction

Target `HF0/frechet-completion-and-restriction` (theorem).

For nonempty I subset [0,1], B_I is the inverse limit of B_J over compact nonempty subintervals J of I. On compact [a,b] its topology is given by max(|.|_a,|.|_b); on a general interval it is complete and metrizable. A embeds as a closed subring. Every nonempty restriction B_I->B_J for J subset I is injective. When 0 belongs to I, B_I embeds in B_{0}=W_OE(F)[1/pi].

Direct prerequisites: `HF0/radial-limits-and-completeness`, `HF0/newton-product-and-jensen`, `LocallyAnalyticDistributions:L0/locally-convex-limits`, `LocallyAnalyticDistributions:L0/nonarchimedean-locally-convex-spaces`.

Proof plan:

1. Concavity of v_r gives the endpoint maximum principle and a countable cofinal family of compact subintervals.
2. Extend completion and inverse-limit maps on the common dense B^b.
3. To prove injectivity first stabilize the nonzero value and one-sided slopes at a radius inside J, then propagate concavity to rule out zero on another subinterval.
4. Before invoking normed E-space results, normalize every positive endpoint by the power 1/(-log_q rho); combine with the already normalized endpoint-zero norm. The resulting ultrametric norm is E-homogeneous and equivalent topologically to the endpoint Gauss family. Endpoint 1 is excluded from these functional-analytic imports.

Source: FF17, §1.6.1, pp. 68–70; Lemma 1.6.10 and Proposition 1.6.15, pp. 71–73.

Check: A restriction to a single radius remains injective; the result concerns these period rings, not an arbitrary function sheaf.

### Newton data on completed annuli

Target `HF0/completed-newton-polygon` (definition).

For 0!=f in B_I, define v_r(f)=-log_q|f|_(q^-r) at positive radii in I and define its left and right derivatives by stabilization from any B^b-approximating sequence. Newt_I(f) is the closed polygon determined by the restriction of this concave function, truncated to the slopes corresponding to I. At an interior slope r the multiplicity is partial_left v_r(f)-partial_right v_r(f), a nonnegative integer. At an included endpoint use its one-sided convention, including vertical rays; at radius 1 a zero slope may accumulate.

Direct prerequisites: `HF0/frechet-completion-and-restriction`, `HF0/legendre-newton-conventions`.

Proof plan:

1. Show an approximation error with strictly larger valuation cannot change the first and last minimizing coefficient indices at a fixed radius.
2. Independence of approximants defines the derivatives, then Legendre duality defines the restricted polygon.
3. Specify endpoint half-lines explicitly before making assertions about multiplicity there.

Source: FF17, Lemma 1.6.10 and Definition 1.6.11, pp. 71–72; Corollary 1.6.17 and Definition 1.6.18, p. 74; Corollary 1.6.19, Proposition 1.6.20 and Corollary 1.6.21, p. 75.

Check: For an interior linear zero the derivative drops by one; on compact I avoiding 1 only finitely many nonzero slopes occur.

API derived from uses: `HF5/compact-field-pid-dichotomy` — Isolate all slopes to perform division.; `HF4/weighted-newton-zero-formula` — Identify each derivative jump with weighted orders of zeros..

| Proposed declaration | Role | Mathematical interface |
| --- | --- | --- |
| `completed_newton_polygon.valuation` | projection | v_r(f) is the negative base-q logarithm of the norm. |
| `completed_newton_polygon.derivative_independent` | characterisation | Left/right derivative stabilization is independent of the approximating sequence. |
| `completed_newton_polygon.multiplicity` | data | The multiplicity at r is partial_left v_r-partial_right v_r. |
| `completed_newton_polygon.restrict` | functoriality | Restriction of f corresponds to truncation of Newt_I(f), with the stated endpoint convention. |

Unit tests:

- `completed_newton_polygon.constant` (degenerate): A nonzero E-constant has no positive finite-slope segment.
- `completed_newton_polygon.double_zero` (computed): For (pi-[a])^2 with q^-r=|a| in the interior, the derivative jump at r is 2.
- `completed_newton_polygon.truncate` (compatibility): Restricting to an interval whose closure avoids |a| removes that slope of pi-[a].

### Uniform stabilization of approximating norms

Target `HF0/compact-norm-stabilization` (theorem).

If f_n in B^b converges to nonzero f in B_I, then for every compact J subset I there is N such that |f_n|_rho=|f|_rho for every rho in J and n>=N. Consequently Newt_J(f) is realized by a single element of B^b, and completed Newton products still obey infimal convolution.

Direct prerequisites: `HF0/completed-newton-polygon`.

Proof plan:

1. First take J contained in (0,1]. Stabilize the nonzero endpoint valuations and the available one-sided derivatives; use the corresponding supporting lines to bound the valuation on the compact parameter interval.
2. Choose the approximation error above this uniform finite bound. The ultrametric inequality forces equality at every radius in J. This is the positive-radius argument of Proposition 1.6.16, with the corrected endpoint bound.
3. If 0 belongs to J, pi-adic convergence fixes an initial finite coefficient segment and v_pi(f_n)=v_pi(f). A bound at one positive radius controls the remaining tail near zero; its higher pi powers are strictly smaller than the fixed first nonzero term on a sufficiently short initial interval. Combine that interval with the positive-radius compact argument. A singleton {0} uses only pi-adic stabilization.
4. Apply the equality of all positive-radius norms to the restricted Newton polygon. At radius zero record the stabilized v_pi separately.

Source: FF17, Proposition 1.6.16, p. 73; Corollary 1.6.19 and Proposition 1.6.20, p. 75.

Check: The positive-radius proof supplies a uniform finite bound even for opposite endpoint derivatives. An included radius zero is treated separately by pi-adic coefficient stabilization and a positive-radius tail bound, rather than by applying Proposition 1.6.16 outside its hypotheses.

### Directional rank-two Gauss valuations

Target `HF0/rank-two-gauss-valuations` (construction).

At an interior r define the lexicographically ordered rank-two valuations f |-> (v_r(f),partial_right v_r(f)) and f |-> (v_r(f),-partial_left v_r(f)); use the compatible ordered-group sign convention from additive valuations. They are continuous valuations on B_I. They lie in Spa(B_I,O_E+B_I^{circ circ}) but in general not in Spa(B_I,B_I^circ).

Direct prerequisites: `HF0/completed-newton-polygon`, `HF0/compact-norm-stabilization`.

Proof plan:

1. Use addition inequalities for initial indices and additivity of the appropriate one-sided derivatives under multiplication.
2. Order the second component only after the first component agrees.
3. Test boundedness on power-bounded functions with opposite directional derivatives.

Source: FF17, Proposition 1.6.12 and Remark 1.6.13, p. 72.

Check: The two points must be attached to the smaller plus ring; changing it to B_I^circ loses the intended specializations.

API derived from uses: `HF8/runge-and-adic-reconstruction` — Keep the directional valuations needed to recover the complete adic topology.

| Proposed declaration | Role | Mathematical interface |
| --- | --- | --- |
| `rank_two_gauss_valuations.right` | constructor | The right derivative gives the first displayed continuous valuation. |
| `rank_two_gauss_valuations.left` | constructor | Negating the left derivative gives the second displayed valuation. |
| `rank_two_gauss_valuations.coarsen` | compatibility | Forgetting the second component recovers v_r. |
| `rank_two_gauss_valuations.support` | projection | Both valuations have zero support on the domain B_I. |

Unit tests:

- `rank_two_gauss_valuations.monomial` (computed): The second components on pi^n are n and -n respectively.
- `rank_two_gauss_valuations.coarsening` (compatibility): Both first components on [a]pi^n equal v_F(a)+nr.
- `rank_two_gauss_valuations.plus_ring` (non-example): A power-bounded element with v_r=0 and inappropriate derivative is excluded from boundedness for the relevant directional valuation.

### Coefficient extensions and radius rescaling

Target `HF0/coefficient-change-norms` (comparison).

Let Eprime/E be finite with ramification index e and residue degree f, and suppose F contains its residue field. Put Eprime_0=W_OE(F_(q^f))[1/pi]. Then B_(E,I) completed-tensor_(Eprime_0) Eprime is canonically B_(Eprime,I^(1/e)), with pi prime on the right and phi prime=phi^f. For compact I the ordinary tensor already suffices. Interior norm formulas use the chosen normalization qprime=q^f; at rho=0 the transported norm is the appropriate [Eprime:E]-power, not literal equality. The unramified case keeps the underlying ring and changes Frobenius to phi^f.

Direct prerequisites: `HF0/absolute-annulus-comparison`, `HF0/gauss-coefficient-calculus`, `RelativeFarguesFontaine:RF0:integral-Y/perfect-coefficient-base-change`.

Proof plan:

1. Apply the parent perfect-coefficient Witt tensor comparison to A and its localization.
2. Use a basis 1,pi prime,...,pi prime^(e-1) to compare completed norms and convert each radius.
3. Check finite-dimensional completeness for compact I and the iterated Frobenius on the unramified coefficient field.

Source: FF17, §1.6.2, Lemma 1.6.8 and Proposition 1.6.9, pp. 70–71.

Check: The unramified case has no spurious tensor by the whole Eprime over E; the ramified case changes radii by the e-th root.

## HF1 — Boundary function theory and explicit models

Characterize extension to either boundary, identify the overconvergent field and Robba units, construct the Frobenius-stable positive subring and its bivector and crystalline descriptions, and prove the monomial, cyclotomic, equal-characteristic and Hahn-series comparison formulas with their exact norm rescalings.

Layer status: **planned**. Open mathematical inputs, including inherited inputs: `G-COORDINATE`, `R-CRYS`.

### Expansions at radius zero

Target `HF1/boundary-laurent-expansions` (theorem).

If 0 belongs to I and 1 does not, every f in B_I has a unique expansion sum_(n>=n0)[x_n]pi^n with x_n in F and |x_n|rho^n->0 as n->infinity for every positive rho in I. Under the common injection into B, B_[0,1]=B^b and its power-bounded subring is A. In mixed characteristic no assertion of existence, uniqueness or additivity of arbitrary two-sided Teichmuller expansions is made for B or B-plus.

Direct prerequisites: `HF0/frechet-completion-and-restriction`, `HF0/compact-norm-stabilization`.

Proof plan:

1. Embed into the pi-adic complete field B_{0}, whose Teichmuller expansion is unique and bounded below in index.
2. Use interior coefficient bounds to characterize the image, then impose endpoint-1 boundedness.
3. Contrast with the two-sided series class: the nonlinear Witt carry limits need not converge under mere interior convergence.

Source: FF17, Propositions 1.6.23–1.6.24, pp. 75–76; Remarks 1.6.6–1.6.7, p. 70, and 1.10.8, p. 91.

Check: The uniqueness theorem is confined to intervals including 0; its extension to all B is not an available theorem.

### Extension across either boundary

Target `HF1/boundary-extension` (theorem). Atlas planet: **Boundary extension theorem**.

Let I be an interval of positive radii. If 0 is in its closure, f extends uniquely to B_(I union {0}) exactly when Newt_I(f) is bounded to the left in its horizontal coordinate, equivalently pi^N f is bounded near 0 for some N. If 1 is in its closure, f extends uniquely to B_(I union {1}) exactly when its Newton polygon is bounded below, equivalently lim_(rho->1)|f|_rho is finite. The latter limit always exists in [0,infinity]. Both conditions give B_[0,1]=B^b. They do not imply extension across a missing boundary separated from the closure of I.

Direct prerequisites: `HF1/boundary-laurent-expansions`, `HF0/completed-newton-polygon`.

Proof plan:

1. Split dense approximants into their positive and negative index parts for radius 0, and into bounded/unbounded coefficient valuations for radius 1.
2. Use stabilized norms and slope monotonicity to make the excluded part tend to zero on every compact interval.
3. Sum the differences in the boundary-completed ring; invoke faithful restriction for uniqueness.

Source: FF17, Propositions 1.9.1–1.9.4 and Remark 1.9.6, pp. 87–89.

Check: Extension requires the boundary to be a limit point; a relatively compact annulus alone carries no such extension assertion.

### Newton criterion for units

Target `HF1/units-and-boundary` (theorem).

For 1 not in I, a nonzero f in B_I is a unit exactly when Newt_I(f) has no finite slope corresponding to a radius of I. For 1 in I it must have only possible slope 0 at that boundary and a finite right derivative there. Units extend across each boundary in the closure of I. In particular B^times=(B^b)^times and R^times=(E-dagger)^times, where R=colim_(rho->0) B_(0,rho] and E-dagger=colim B_[0,rho].

Direct prerequisites: `HF1/boundary-extension`, `HF0/newton-product-and-jensen`.

Proof plan:

1. On a slope-free compact interval factor out the uniquely dominant monomial and invert 1+h by a convergent geometric series.
2. Glue these inverses by faithful restriction and impose finite index at endpoint 1.
3. Apply both boundary-extension criteria to f and its inverse, then pass to the filtered union at 0.

Source: FF17, Propositions 1.6.25–1.6.26 and Corollary 1.6.27, pp. 76–78; Proposition 1.8.6, p. 86; Corollary 1.9.5, p. 89.

Check: A nonzero constant is a unit, a linear factor fails precisely on an interval containing its zero radius, and endpoint 1 requires its extra finite-index condition.

### Overconvergent field and Robba germs

Target `HF1/overconvergent-field-comparison` (comparison).

Identify the imported overconvergent bounded ring and Robba ring with E-dagger and R in the preceding colimits, for general perfect F and either characteristic of E. E-dagger is a Henselian discretely valued field for v_pi, with residue field F and completion W_OE(F)[1/pi]. For finite L/F the extension E-dagger_L/E-dagger_F has degree [L:F]. For F the completed perfection of k((t)), compare with the completed perfected classical bounded and Robba rings using the inverted-radius convention.

Direct prerequisites: `HF1/units-and-boundary`, `RelativeFarguesFontaine:RF0:annuli/robba-growth-units-and-invariants`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/overconvergent-witt-vectors-henselian`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/robba-ring`.

Proof plan:

1. Compute the residue field and discrete valuation from the boundary-0 expansion.
2. Solve a simple-root polynomial equation by Newton iteration on a sufficiently short annulus, shrinking that annulus once for the finitely many coefficient bounds.
3. Lift a residue-field basis for finite L/F and compare completions to compute the degree. The comparison with RD.0 does not import its discretely-valued-coefficient PID theorem for arbitrary F.

Source: FF17, Proposition 1.8.2, Corollary 1.8.3 and Remarks 1.8.4–1.8.5, pp. 85–86.

Check: The local field valuation here is v_pi with residue F; the original real valuation of F need not be discrete.

### Positive period subrings

Target `HF1/positive-annulus-subrings` (definition). Atlas planet: **Positive period ring**.

Inside B_I define B_I^plus as the closure of B^{b,plus}=A[1/pi]. For 0<rho<1 set B_rho^plus equal to the rho-norm completion of A[1/pi], and put B^plus=intersection_(rho>0) B_rho^plus inside B. If 0 belongs to I, B_I^plus=B^{b,plus}. If min I=rho>0, the underlying algebras B_I^plus, B_rho^plus, B_[rho,1)^plus and B_[rho,1]^plus agree, with the last topology generally strictly stronger.

Direct prerequisites: `HF1/boundary-extension`, `HF0/frechet-completion-and-restriction`.

Proof plan:

1. Use the norm inequality v_(rprime)(x)>=(rprime/r)v_r(x) for x in A[1/pi] and rprime<=r.
2. Prove restriction of each positive completion is injective using the common annular ring.
3. Define the intersection with its induced Frechet topology and distinguish algebraic identification from topological equivalence.

Source: FF17, Definition 1.10.2, Lemma 1.10.4, Proposition 1.10.5 and Remark 1.10.6, pp. 89–90.

Check: The endpoint-1 algebra equality must not be promoted to a Banach isomorphism.

API derived from uses: `HF6/eigen-banach-refinement` — Locate nonnegative Frobenius eigenvectors in the positive ring.; `HF1/crystalline-saturation` — Recover the maximal Frobenius-bijective part of a crystalline ring.

| Proposed declaration | Role | Mathematical interface |
| --- | --- | --- |
| `positive_annulus_subrings.dense_map` | constructor | A[1/pi] maps densely into each B_I^plus. |
| `positive_annulus_subrings.restrict` | functoriality | Restriction induces the specified compatible injections of positive rings. |
| `positive_annulus_subrings.intersection` | characterisation | B^plus consists precisely of elements in every B_rho^plus. |
| `positive_annulus_subrings.boundary_zero` | compatibility | Including radius 0 recovers A[1/pi] as an algebra. |

Unit tests:

- `positive_annulus_subrings.pi_inverse` (computed): pi^-1 belongs to every positive ring, so plus does not mean the unit ball.
- `positive_annulus_subrings.negative_teich` (non-example): For a in F with |a|>1, [a] is not in B^plus.
- `positive_annulus_subrings.endpoint_topology` (non-example): A sequence can converge in B_rho^plus without converging in the stronger [rho,1] topology; the canonical algebra bijection has no continuous inverse in that direction.

### Newton characterization of positivity

Target `HF1/positive-newton-and-frobenius` (theorem).

A nonzero f belongs to B_rho^plus exactly when its extended Newton polygon over [rho,1] lies in the nonnegative vertical half-plane, equivalently it extends to radius 1 with |f|_1<=1. B^plus is the corresponding intersection over rho and is the largest subring of B_rho^plus on which phi is bijective: B^plus=intersection_(n>=0) phi^n(B_rho^plus). This agrees with the classical B_rig^plus notation after the specified comparison.

Direct prerequisites: `HF1/positive-annulus-subrings`, `HF0/gauss-coefficient-calculus`.

Proof plan:

1. Use the closure description to bound coefficients vertically, then apply boundary extension.
2. Frobenius carries rho to rho^q and preserves nonnegative coefficient valuations.
3. Intersect the expanding domains under inverse Frobenius and use the same coefficient criterion.

Source: FF17, §1.10.1, Proposition 1.10.7 and Remark 1.10.9, pp. 90–91.

Check: Positivity is the coefficient bound |.|_1<=1 after extension, not the condition v_pi(f)>=0.

### Monomial completed-perfection model

Target `HF1/monomial-field-model` (construction).

Let k/F_q be perfect, F the completion of k((t^(1/p^infinity))), |t|=q^-1, T=[t]. Identify A with sums sum_(alpha>=0 in Z[1/p]) a_alpha T^alpha, a_alpha in W_OE(k), such that for every n and every real bound M only finitely many alpha<M have a_alpha nonzero modulo pi^n. This is the weak (pi,T)-adic completion of the perfected polynomial model, with coefficients already pi-adically complete. For interior rho=q^-r, |sum a_alpha T^alpha|_rho=sup_alpha q^(-r v_pi(a_alpha)-alpha). In B_I allow alpha in Z[1/p] and rational coefficients W_OE(k)[1/pi], requiring these terms to tend to zero off finite sets at each interior radius, with the extra boundary bounds.

Direct prerequisites: `HF1/boundary-laurent-expansions`, `HF0/gauss-coefficient-calculus`.

Proof plan:

1. Use the coefficientwise description of O_F and then lift successively modulo pi^n.
2. Apply the coefficient filtration N_k to identify the norm of each monomial and the supremum formula.
3. Complete the common Laurent algebra for all radii in I; impose bounded coefficient valuations at 0 and support bounded below at 1.

Source: FF17, §1.7.1 and Lemma 1.7.1, pp. 79–80.

Check: The weak completion allows arbitrarily high t-order tails; pi-adic completion of the bare polynomial ring is insufficient.

API derived from uses: `HF1/perfected-annulus-model` — Identify the dense tower of ordinary annulus functions.; `HF11/nonprincipal-positive-ideal` — Control irrational limiting coefficient valuations.

| Proposed declaration | Role | Mathematical interface |
| --- | --- | --- |
| `monomial_field_model.teich_variable` | constructor | T^alpha is the Teichmuller lift of t^alpha. |
| `monomial_field_model.support_mod_pi` | characterisation | The stated local finiteness modulo pi^n characterizes integral elements. |
| `monomial_field_model.norm_formula` | compatibility | The monomial supremum equals the intrinsic ramified Gauss norm. |
| `monomial_field_model.localize` | functoriality | Inverting pi and T gives the dense Laurent model of B_I. |

Unit tests:

- `monomial_field_model.t_root` (computed): |T^(1/p)|_(q^-r)=q^(-1/p).
- `monomial_field_model.pi` (computed): |pi|_(q^-r)=q^-r.
- `monomial_field_model.completion` (non-example): An infinite t-power series with all coefficients units is allowed when its t-exponents tend to infinity; it need not lie in the pi-adic completion of polynomials.

### Perfected annulus towers and norm powers

Target `HF1/perfected-annulus-model` (comparison).

For the monomial model set K0=W_OE(k)[1/pi] with |pi|=q^-1, and send X to T. With rho=q^-r and checkrho=q^(-1/r), |i(f)|_rho=||f||_checkrho^r, where ||.|| is the ordinary K0-Gauss norm. The completed direct limit of the annulus algebras under X->X^q, with transformed intervals and norms, is B_I. The dense initial Laurent algebra must invert both pi and X. In characteristic zero the annulus tower is finite etale; in equal characteristic p the q-power tower is radicial.

Direct prerequisites: `HF1/monomial-field-model`, `PadicHodgeTheory:P7:annulus-foundations/annulus-laurent-ring`, `PadicHodgeTheory:P7:annulus-foundations/frechet-topology`.

Proof plan:

1. Evaluate both sides on pi and X, then on arbitrary convergent Laurent series.
2. Use the monomial description to prove density and completion.
3. Differentiate X^q to separate the characteristic-zero etale assertion from its characteristic-p failure.

Source: FF17, §1.7.2 and Lemma 1.7.2, pp. 80–82.

Check: The r-th power is essential: the printed literal isometry fails already on pi. In characteristic p the tower is not etale.

### Cyclotomic coordinates on period annuli

Target `HF1/cyclotomic-annulus-model` (comparison).

For E=Q_p (q=p), use the Frobenius lift Q(X)=(1+X)^q-1 and the embedding X->[1+t]-1. For an ordinary annulus radius s>q^(-q/(q-1)), write s=q^(-1/r), so the period radius is rho=q^-r<q^(-(q-1)/q). In this range ||f||_s=|i(f)|_rho^(1/r). The completed perfected cyclotomic tower identifies with B_I for I contained in that strict period-radius range. For a ramified coefficient field the detailed Newton slopes must use v_pi(p) and the p-Frobenius iteration; no unramified slope formula is asserted for arbitrary E.

Additional hypotheses: E=Q_p for the displayed numerical radius and cyclotomic-coordinate theorem. For general mixed-characteristic E the target is the corresponding comparison after deriving a threshold from the actual ramified carry polygon, recorded as G-COORDINATE.

Direct prerequisites: `HF1/perfected-annulus-model`, `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-frobenius`, `RelativeFarguesFontaine:RF0:integral-Y/q-teichmuller-lift`.

Proof plan:

1. Compare [1+t]-1 with [t] on the stated short period annulus, using the Newton polygon of the cyclotomic element.
2. Transport the monomial comparison with its norm power and inverted radius.
3. Use the correct strict transformed threshold; separate the coefficient-ramification dependence of the auxiliary Newton calculation.

Source: FF17, Proposition 1.7.3 and §1.7.3, pp. 82–83.

Check: For E=Q_p, q=p, the ordinary radius threshold and its transformed period radius agree through s=q^(-1/r); the printed untransformed bound is not reused.

### Equal-characteristic exchange of variables

Target `HF1/equal-characteristic-symmetry` (comparison).

For E=F_q((pi)), B_I is the ordinary Laurent annulus algebra with coefficient field F and variable pi, with precisely the source boundary conditions. More generally for perfect k and E0=k((u)), F0=k((v)), exchange the two indices of a doubly convergent Laurent expansion to identify O(D_E0^*) and O(D_F0^*) as Frechet k-algebras. The Gauss parameters r and 1/r are exchanged and their numerical norms differ by the corresponding r-th power. The associated adic spaces are the common locus Spa(k[[u,v]],k[[u,v]]) minus V(uv), viewed over either valued field.

Direct prerequisites: `HF1/perfected-annulus-model`, `PadicHodgeTheory:P7:annulus-foundations/annulus-laurent-ring`, `PadicHodgeTheory:P7:annulus-foundations/annulus-limit-comparison`.

Proof plan:

1. Apply the imported Laurent-annulus construction for the first assertion.
2. On compact radial intervals bound the double family of coefficients to justify transposing convergent sums.
3. Compute u^a v^b on both sides to determine the power of the norm and identify the common formal adic chart.

Source: FF17, Example 1.6.5, p. 70; Proposition 1.7.4 and Remark 1.7.5, pp. 83–84.

Check: The symmetry is k-linear and topological; it is not a norm-preserving map with fixed numerical normalization on both coefficient fields.

### Hahn-series period rings

Target `HF1/hahn-period-model` (comparison).

Let Gamma be a nonzero subgroup of R with p Gamma=Gamma and F=k((t^Gamma)) the Hahn field of well-ordered support. In A write sum_(alpha in Gamma_nonnegative) a_alpha T^alpha with a_alpha in W_OE(k), whose nonzero support modulo pi^n is well ordered for every n. For interior I, B_I uses coefficients in W_OE(k)[1/pi] and, for every rho in I and positive c, the exponents on which |a_alpha|_rho q^-alpha>=c form a well-ordered set. The topology and Gauss norms are given by these coefficient bounds. Endpoint radii require the additional boundedness conditions, not merely interior convergence.

Direct prerequisites: `HF1/monomial-field-model`.

Proof plan:

1. Use the Hahn support condition to lift O_F through each truncated Witt ring.
2. Pass to the filtered union after inverting pi and T and complete at interior norms.
3. Verify the support condition is stable under the ramified Witt operations using finite truncations; compute the norm by N_k.

Source: FF17, §1.7.5, p. 84.

Check: The coefficient pi^-1 must be present in B_I, contradicting the printed formula with only integral W_OE(k)-coefficients.

### Ramified Witt covectors and bivectors

Target `HF1/witt-bivectors` (definition). Atlas planet: **Witt bivectors**.

For a discrete F_q-algebra R, define the unipotent covectors CWu(R)=colim_V W_OE,n(R); full covectors allow a negative tail generating a nilpotent ideal. Put BW(R)=lim_V CW(R), and BW(O_F)=lim_(0!=a ideal O_F) BW(O_F/a). It is an O_E-module whose elements have unique formal coefficients sum_(n in Z)[a_n]pi^n with a_n in O_F and liminf_(n->-infinity) q^n v_F(a_n)>0. Summation embeds this module in B^plus. Addition is the limit of the ramified Witt addition polynomials with the required q-power twists.

Direct prerequisites: `HF1/positive-newton-and-frobenius`, `RelativeFarguesFontaine:RF0:integral-Y/ramified-teich-frobenius-verschiebung`.

Proof plan:

1. Construct CW and BW as limits of the imported truncated ramified Witt functor, using Verschiebung transition maps.
2. Translate eventual nilpotence modulo every nonzero ideal into exponential growth of negative-tail valuations.
3. The stronger growth makes the Witt carry limits converge and yields an injective summation map; this does not extend to every two-sided convergent Teichmuller series.

Source: FF17, §1.10.2, Definition 1.10.11 and the coefficient/addition formulas, pp. 92–93.

Check: The negative-tail growth condition is stronger than convergence for each linear Gauss weight.

API derived from uses: `FF17 §1.10.2, p. 93` — Give a genuine module of uniquely summable two-sided expansions without an unsupported expansion theorem for B..

| Proposed declaration | Role | Mathematical interface |
| --- | --- | --- |
| `witt_bivectors.finite_laurent` | constructor | A finite Teichmuller Laurent coefficient family in the perfect valuation ring O_F determines a compatible bivector via the unique q-power roots. No canonical section CW(R)->lim_V CW(R) for arbitrary discrete R is asserted. |
| `witt_bivectors.coeff_ext` | extensionality | Equality of all bivector coefficients is equality in BW(O_F). |
| `witt_bivectors.sum_embedding` | coercion | Summation gives an injective O_E-linear map BW(O_F)->B^plus. |
| `witt_bivectors.add_coeff` | characterisation | The i-th sum coefficient is the limit of S_n on q-twisted coefficient windows. |

Unit tests:

- `witt_bivectors.finite_tail` (compatibility): A finite Teichmuller Laurent sum with coefficients in O_F lies in BW and sums to the same element of B^plus.
- `witt_bivectors.exponential_tail` (computed): Coefficients with v_F(a_n)=q^(-2n) for n<0 meet the growth condition.
- `witt_bivectors.linear_tail` (non-example): Coefficients with v_F(a_n)=n^2 for n<0 converge for every linear Gauss weight but fail the bivector condition.

### Radius-dependent crystalline period rings

Target `HF1/crystalline-radius-rings` (construction).

Assume E=Q_p and rho in |F^times|, 0<rho<1. Let a_rho={x in O_F:|x|<=rho} and b_rho=ker(W(O_F)->O_F/a_rho). Define A_cris,rho as the p-adic completion of the divided power envelope of b_rho compatible with the canonical divided powers on (p); put B_cris,rho^plus=A_cris,rho[1/p]. It is the pro-final p-adic PD thickening computing degree-zero crystalline sections, not a terminal object among individual nilpotent thickenings.

Direct prerequisites: `HF1/positive-annulus-subrings`, `CrystallineCohomology:CR.0/pd-envelope`, `CrystallineCohomology:CR.0/completed-envelope`, `CrystallineCohomology:CR.1`.

Proof plan:

1. Import the generic PD envelope and its completed universal property.
2. Choose a with |a|=rho; express the envelope inside W(O_F)[1/p] by the divided powers [a]^n/n!.
3. Compare the p-power truncations with the crystalline site and pass to the pro-object.

Source: FF17, §1.10.3, pp. 93–94.

Check: The construction is restricted to E=Q_p and retains the pro-object qualification in its site interpretation.

API derived from uses: `HF1/crystalline-saturation` — Sandwich the crystalline periods between two positive radii and compare invariant periods.

| Proposed declaration | Role | Mathematical interface |
| --- | --- | --- |
| `crystalline_radius_rings.pd_map` | constructor | W(O_F) maps to the completed PD envelope with the specified base divided powers. |
| `crystalline_radius_rings.universal` | universal-property | Compatible continuous maps to p-complete PD thickenings extend uniquely. |
| `crystalline_radius_rings.divided_power_model` | characterisation | For \|a\|=rho, A_cris,rho is the p-completion of the subalgebra generated by [a]^n/n!. |
| `crystalline_radius_rings.invert_p` | coercion | Inverting p produces the indicated subring B_cris,rho^plus of B. |

Unit tests:

- `crystalline_radius_rings.contains_p` (computed): b_rho contains p and its divided powers agree with the canonical ones.
- `crystalline_radius_rings.choice` (compatibility): Replacing a by another element of norm rho gives the same completed envelope by its universal property.
- `crystalline_radius_rings.site` (non-example): A_cris,rho is not itself an object with a globally nilpotent PD ideal in the ordinary finite-level crystalline site.

### Crystalline and holomorphic invariant periods

Target `HF1/crystalline-saturation` (theorem).

For E=Q_p, B_(rho^p)^plus is contained in B_cris,rho^plus, which is contained in B_rho^plus. Consequently B^plus=intersection_(n>=0) phi^n(B_cris,rho^plus). For a finite-dimensional isocrystal D over W(k)[1/p], k a perfect subfield of O_F (so the induced valuation on k is trivial), and a nonzero t in B_cris,rho^plus with phi(t)=pt, the phi-fixed vectors in D tensor B^plus[1/t] and D tensor B_cris,rho^plus[1/t] coincide.

Direct prerequisites: `HF1/crystalline-radius-rings`, `HF1/positive-newton-and-frobenius`, `mathlib:WittVector.Isocrystal`.

Proof plan:

1. Compare divided-power factorial denominators with the p-adic unit-ball presentation of each positive-radius ring.
2. Iterate Frobenius and use the characterization of its maximal bijective subring.
3. Use the finite-dimensional Frobenius matrix on D to move a fixed vector through all iterated radii after multiplying by one common power of t.
4. For the arbitrary perfect subfield k, use the pinned WittVector.Isocrystal structure on the fraction field of W(k), with a separate finite-dimensionality hypothesis. Its usual W(k)[1/p] comparison follows from the Witt DVR structure. VB0 fixes the different coefficient field breve E and cannot supply this arbitrary-k carrier.

Source: FF17, Proposition 1.10.12 and Corollary 1.10.13, p. 94.

Check: The equality is of invariant periods after the indicated localization, not equality of B^plus and B_cris,rho^plus.

### The local boundary valuation quotient

Target `HF1/boundary-valuation-quotient` (definition).

In B^{b,plus}=A[1/pi], put p_boundary={x:v_0(x)>0}, with v_0(x)=inf_n v_F(x_n), and m_boundary={sum[x_n]pi^n: every v_F(x_n)>0}. Define barB=B^{b,plus}/p_boundary. It is a local domain with maximal ideal m_boundary/p_boundary and residue field W_OE(k_F)[1/pi]. Frobenius is bijective on it and the quotient map extends to B^plus.

Direct prerequisites: `HF1/positive-newton-and-frobenius`, `HF0/gauss-coefficient-calculus`.

Proof plan:

1. The coefficient-infimum norm is multiplicative, hence p_boundary is prime.
2. If one coefficient is a unit, invert its reduction and solve successively modulo the uniformly positive ideal.
3. For 0<rho<1 restrict B^plus to B_[rho,1]^plus, then to B_1^plus. The latter completed positive ring has the coefficient-infimum valuation; quotienting its ideal v_0>0 gives the same algebraic barB as A[1/pi]. Compose these maps to extend the quotient map. This does not assign an inherited Banach topology to quotient eigenspaces.

Source: FF17, Definition 1.10.14 and Lemma 1.10.15, p. 95.

Check: Uniform positivity defining p_boundary differs from positivity of every coefficient defining m_boundary.

API derived from uses: `HF6/eigen-banach-refinement` — Give an algebraic quotient model for positive eigenspaces; its Banach topology is transported from the eigenspace, not inferred from the boundary quotient norm..

| Proposed declaration | Role | Mathematical interface |
| --- | --- | --- |
| `boundary_valuation_quotient.quotient` | constructor | The natural map A[1/pi]->barB has kernel p_boundary. |
| `boundary_valuation_quotient.local` | instance | barB is a local domain with the stated maximal ideal. |
| `boundary_valuation_quotient.residue` | compatibility | Its residue ring is W_OE(k_F)[1/pi]. |
| `boundary_valuation_quotient.positive_extension` | functoriality | The quotient map extends compatibly to B^plus and commutes with Frobenius. |

Unit tests:

- `boundary_valuation_quotient.unit_constant` (computed): pi maps to a unit of barB, so the defining ideal is not the pi-adic maximal ideal.
- `boundary_valuation_quotient.uniform_tail` (degenerate): [a] with 0<|a|<1 maps to zero in barB.
- `boundary_valuation_quotient.nonuniform_tail` (non-example): An element whose coefficient valuations are all positive but tend to zero lies in m_boundary and need not lie in p_boundary.

## HF2 — Primitive equations and the topology of classical points

Extend the parent primitive-untilt dictionary to all primitive degrees, general complete pi-adic algebras and Q-compatible inverse limits. Prove division, roots in degree-one quotients, the valued proximity metric, its completeness on bounded subsets, Lubin–Tate parametrization and continuity in the Berkovich spectrum.

Layer status: **planned**. Open mathematical inputs, including inherited inputs: `R-LT`.

### Q-compatible inverse limits

Target `HF2/q-compatible-tilt` (definition). Atlas planet: **Q-compatible tilt**.

For a pi-adically complete O_E-algebra R and Q in O_E[X] with Q(0)=0 and Q congruent to X^q modulo pi, let R^{flat,Q} be the set of sequences (x_n) with Q(x_(n+1))=x_n. Transport its perfect F_q-algebra structure from lim_(Frob_q) R/pi via reduction. Its zeroth projection is multiplicative for the monomial Q=X^q, but for a general Q it is not asserted to be an additive or multiplicative ring map. The construction is canonically independent of Q after passage to the common reduced inverse limit.

Direct prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/q-twisted-witt-functor`.

Proof plan:

1. Lift a compatible residue sequence by successive Q-iteration; the congruence gain makes the lifts Cauchy.
2. Prove independence of lifts and uniqueness using pi-adic separatedness.
3. Transport addition, multiplication and inverse Frobenius from the perfection inverse limit, checking functoriality in R.

Source: FF17, Definition 2.1.1, Proposition 2.1.2, Lemma 2.1.3, Corollary 2.1.4 and Remark 2.1.5, pp. 98–100.

Check: The Q-compatible sequence set is given its ring structure through reduction, rather than coordinatewise addition.

API derived from uses: `HF2/general-fontaine-map` — Construct the ramified Fontaine map for complete algebras.; `HF2/lubin-tate-points` — Interpret compatible Lubin–Tate division points.

| Proposed declaration | Role | Mathematical interface |
| --- | --- | --- |
| `q_compatible_tilt.reduce` | equivalence | Reduction gives R^{flat,Q} equiv lim_Frob R/pi. |
| `q_compatible_tilt.lift_limit` | constructor | The n-th coordinate is the limit of the iterates Q^m of arbitrary lifts at level n+m. |
| `q_compatible_tilt.map` | functoriality | A continuous O_E-algebra map induces a map of the transported perfect F_q-algebras. |
| `q_compatible_tilt.change_Q` | compatibility | The reduction equivalence identifies the Q and Qprime versions canonically. |

Unit tests:

- `q_compatible_tilt.perfect_char_p` (compatibility): For R perfect of characteristic p and Q=X^q, the zeroth coordinate identifies R^{flat,Q} with R.
- `q_compatible_tilt.zero` (degenerate): The zero sequence is the zero of the transported ring.
- `q_compatible_tilt.coordinate_addition` (non-example): For Q=(1+X)^p-1, coordinatewise ordinary addition of two compatible sequences need not be compatible.

### Reduction invariance of the Q-limit

Target `HF2/closed-ideal-tilt-invariance` (theorem).

If J is a closed ideal of R and R is complete for (J,pi), then reduction induces a bijection R^{flat,Q}->(R/J)^{flat,Q}. In particular the preceding comparison with the perfection of R/pi is valid. For a perfect F_q-algebra S, the Q-Teichmuller map identifies S with the Q-compatible inverse limit of W_OE(S).

Direct prerequisites: `HF2/q-compatible-tilt`, `RelativeFarguesFontaine:RF0:integral-Y/q-teichmuller-lift`.

Proof plan:

1. For congruent lifts use Q(x)-Q(y) in pi(x-y)+(x-y)^q to increase the (J,pi)-adic precision under iteration.
2. Construct compatible coordinates by a diagonal limit and show all choices have the same limit.
3. Apply the ramified twisted Teichmuller uniqueness in the perfect Witt case.

Source: FF17, Proposition 2.1.2, Lemma 2.1.3 and Remark 2.1.5, pp. 99–100.

Check: The completeness condition is (J,pi)-adic and the ideal is closed; an arbitrary quotient is not enough.

### Ramified Fontaine map for complete algebras

Target `HF2/general-fontaine-map` (construction).

For pi-adically complete R as above construct theta_Q:W_OE(R^{flat,Q})->R using the Q-twisted Witt ghost polynomials and the compatible-coordinate limits. It commutes with continuous algebra maps and with the Q-change identification. If Frobenius on R/pi is surjective, theta_Q is surjective. For E=Q_p and Q=X^p this map equals Mathlib WittVector.fontaineTheta on the existing PreTilt carrier, after the canonical inverse-limit identification. No new p-typical theta or Tilt carrier is introduced.

Direct prerequisites: `HF2/closed-ideal-tilt-invariance`, `RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-diagonal`, `mathlib:WittVector.fontaineTheta`, `mathlib:WittVector.fontaineTheta_teichmuller`, `mathlib:surjective_fontaineTheta`.

Proof plan:

1. Define compatible finite theta_n using twisted ghost components; Lemma 2.1.6 gives divisibility bounds making the coordinate limit converge.
2. Check the ring identities at finite levels and pass to the limit.
3. For surjectivity lift a residue preimage and correct one pi-adic digit at a time; compare the p-typical case by the Teichmuller characterization.

Source: FF17, §2.1.2, Lemma 2.1.6 and Proposition 2.1.10, pp. 100–103.

Check: The general ramified map restricts to the actual pinned p-typical construction and has the stated surjectivity hypothesis.

API derived from uses: `HF2/primitive-kernel-criterion` — Identify principal kernels by a primitive constant coefficient.; `HF4/finite-degree-untilts` — Compare the residue field of a general primitive point with its marked tilt.

| Proposed declaration | Role | Mathematical interface |
| --- | --- | --- |
| `general_fontaine_map.theta` | constructor | theta_Q is the continuous O_E-algebra map obtained from the twisted ghost limit. |
| `general_fontaine_map.naturality` | functoriality | For f:R->Rprime, f theta_R=theta_Rprime W(f^{flat}). |
| `general_fontaine_map.surjective` | characterisation | Surjective Frobenius on R/pi implies surjective theta_Q. |
| `general_fontaine_map.p_typical` | compatibility | For E=Q_p,Q=X^p it is Mathlib WittVector.fontaineTheta under the PreTilt comparison. |

Unit tests:

- `general_fontaine_map.perfect_residue` (compatibility): For a perfect characteristic-p R, theta reduces to the zeroth Witt coordinate.
- `general_fontaine_map.q_twist` (compatibility): Changing Q preserves theta after the canonical twisted-Witt and inverse-limit identifications.
- `general_fontaine_map.semiperfect_needed` (non-example): Surjectivity is not concluded for a complete R whose R/pi has nonsurjective Frobenius.

### Principal kernel criterion for theta

Target `HF2/primitive-kernel-criterion` (theorem).

Assume R is pi-torsion-free. If a=sum_n[a_n]_Q pi^n lies in ker theta_Q and the zeroth untilt coordinate of a_0 is pi times a unit of R, then ker theta_Q=(a). If pi has a compatible system of Q-roots represented by varpi in R^{flat,Q}, the kernel is generated by [varpi]_Q-pi. These are algebraic kernel assertions, with the induced pi-adic quotient topology.

Direct prerequisites: `HF2/general-fontaine-map`, `RelativeFarguesFontaine:RF2:untilts/primitive-untilt-correspondence`.

Proof plan:

1. Reduce modulo pi to divide an arbitrary kernel element by a_0 in the perfect inverse-limit algebra.
2. Subtract the multiple of a and iterate after dividing by pi, using torsion-freeness to preserve the kernel condition.
3. Sum the coefficients in the complete Witt ring; specialize to the chosen Q-root system.

Source: FF17, Lemma 2.1.9, p. 102.

Check: The kernel generator is conditional on torsion-freeness and the pi-times-unit hypothesis; the special [varpi]_Q-pi formula requires compatible roots.

### Primitive equations of arbitrary degree

Target `HF2/primitive-degree` (definition). Atlas planet: **Primitive equations**.

For a=sum_(n>=0)[a_n]pi^n in A define PrimitiveDegree(a,d) by a_0!=0, a_d a unit of O_F, and a_i in m_F for every i<d. Equivalently a is not divisible by pi and the reduction to W_OE(k_F) has pi-order d. Primitive equations form a graded multiplicative monoid, degree zero is A^times, and irreducible primitive means positive degree with no factorization into two positive-degree primitive equations. Degree-one equations and their untilts are imported from RF2.

Direct prerequisites: `HF0/legendre-newton-conventions`, `RelativeFarguesFontaine:RF2:untilts/primitive-untilt-correspondence`.

Proof plan:

1. Use the reduction to the residue-field Witt DVR to read the first unit coefficient.
2. Multiply reductions to prove additivity of degree and compare constant coefficients to exclude pi-divisibility.
3. Relate the condition to the horizontal and positive segments of the Newton polygon.

Source: FF17, Definition 2.2.1 and §2.2.1, p. 104.

Check: Primitivity includes a nonzero constant coefficient; pi itself is not primitive.

API derived from uses: `HF3/primitive-factorization` — Count the geometric linear factors.; `HF4/finite-orbit-points` — Identify degree with the number of conjugate geometric points.

| Proposed declaration | Role | Mathematical interface |
| --- | --- | --- |
| `primitive_degree.degree_iff` | characterisation | Degree d is equivalent to non-pi-divisibility and residue-Witt order d. |
| `primitive_degree.mul_degree` | structure | PrimitiveDegree(a,d) and PrimitiveDegree(b,e) imply PrimitiveDegree(ab,d+e). |
| `primitive_degree.zero_degree` | compatibility | Primitive degree zero is exactly membership in A^times. |
| `primitive_degree.degree_one` | compatibility | The d=1 predicate agrees with the parent primitive-untilt equation convention. |

Unit tests:

- `primitive_degree.linear` (computed): [c]-pi has degree 1 for 0<|c|<1.
- `primitive_degree.pi` (non-example): pi has zero constant coefficient and is not primitive.
- `primitive_degree.product` (computed): The product ([c]-pi)([d]-pi) has primitive degree 2, including c=d.

### Weierstrass division at a degree-one untilt

Target `HF2/degree-one-division` (theorem).

Assume F algebraically closed and a primitive of degree 1. For D=A/(a), the imported untilt theorem identifies D with the valuation ring of an algebraically closed complete untilt C. Every element of D is theta([x]) for x in O_F, every element has an n-th root for n>=1, and theta([x])=theta([y]) implies v_F(x)=v_F(y). The ideal (a) has a generator [c]-pi. Every b in A has b=wa+[d], d in O_F; the remainder representative d is not unique. More generally b has a convergent a-adic expansion sum_(n>=0)[d_n]a^n.

Direct prerequisites: `HF2/primitive-degree`, `HF2/primitive-kernel-criterion`, `PerfectoidSpaces:P3/untilt-of-algebraically-closed-field`.

Proof plan:

1. Use the parent untilt equivalence and preservation of algebraic closedness under tilting, rather than the incomplete special p=2 root calculation in the classical proof.
2. Choose compatible q-power roots in C for a given element, using algebraic closedness and completeness to obtain a Teichmuller value.
3. Lift the value of pi to get the linear generator; divide by matching a Teichmuller residue and iterate.

Source: FF17, Lemma 2.2.3, Proposition 2.2.6, Corollaries 2.2.8–2.2.12, Lemmas 2.2.13–2.2.14 and Proposition 2.2.16, pp. 105–111.

Check: Division supplies an existing element and a Teichmuller remainder, with no false uniqueness claim for that remainder.

### Primitive points and marked untilts

Target `HF2/classical-point-comparison` (comparison).

Let Y_cl be the set of irreducible primitive principal ideals of A. Its degree-one locus is canonically the parent classical-untilt point set. For a degree-one point y, the quotient A/p_y and its localization are O_(C_y) and C_y, and theta_y extends to B^b. Normalize v_y by v_y(theta_y([x]))=v_F(x); then v_y(pi)=v_F(a_0) for a degree-one generator. This normalization usually differs from the local-field normalization of E. Over algebraically closed F all degree-one residue fields are algebraically closed, and the cyclotomic polynomials split there. For the Q_p construction with F algebraically closed, spherical completeness of F implies spherical completeness of C_y.

Direct prerequisites: `HF2/degree-one-division`, `RelativeFarguesFontaine:RF0:integral-Y/classical-points-of-integral-period-disc`.

Proof plan:

1. Compare the parent kernel ideal and the classical principal ideal using the primitive-kernel criterion.
2. Localize and use the untilt valuation to identify the completed residue field.
3. Apply algebraic closedness for roots of unity; a separate generic rank-one solvability theorem is unnecessary along this proof route.
4. For spherical completeness, a chain of closed balls whose radii tend to zero is settled by completeness. Otherwise rescale into the valuation ring and a range below v_y(p); the sharp map modulo p identifies the needed truncated valuation balls with balls in F. A common point there lifts to a point in all the original balls. This uses the imported untilt quotient and valuation comparison, not a second construction of tilting.

Source: FF17, Definition 2.3.1, pp. 114–115; Proposition 2.2.15 and Corollary 2.2.22, pp. 109–114; Corollary 2.2.23, p. 114.

Check: The valuation preserves the F-Teichmuller normalization and need not give v_y(pi)=1.

### Valuative proximity of degree-one points

Target `HF2/valuative-point-metric` (definition). Atlas planet: **Metric on primitive points**.

For degree-one points y,z with p_z=(a_z), define delta(y,z)=v_y(theta_y(a_z)) in [0,infinity], independent of the primitive generator. It is symmetric, equals infinity exactly on the diagonal, and satisfies delta(y,w)>=min(delta(y,z),delta(z,w)). Thus d(y,z)=q^(-delta(y,z)), with q^-infinity=0, is an ultrametric. For a_r={b in A:v_0(b)>=r}, delta(y,z) is the largest r with p_y+a_r=p_z+a_r; this equality identifies the corresponding truncated untilt valuation rings.

Direct prerequisites: `HF2/classical-point-comparison`, `HF2/degree-one-division`.

Proof plan:

1. Use a-adic division to compare the two evaluations and deduce symmetry.
2. Translate the evaluation bound into equality of ideals modulo a_r.
3. Transitivity of those ideal equalities gives the strong triangle inequality and the comparison of truncated quotients.

Source: FF17, Proposition 2.3.2 and Remark 2.3.3, pp. 115–116.

Check: The source distance is valuative: larger delta means closer points; ordinary distance is q^-delta.

API derived from uses: `HF3/primitive-factorization` — Take limits of approximate roots.; `HF2/berkovich-topology-comparison` — Identify the metric and evaluation topologies.

| Proposed declaration | Role | Mathematical interface |
| --- | --- | --- |
| `valuative_point_metric.delta` | data | delta is the generator-independent valuation of the other primitive ideal. |
| `valuative_point_metric.truncation_iff` | characterisation | delta(y,z)>=r iff the ideals agree modulo a_r. |
| `valuative_point_metric.ultrametric` | structure | q^-delta satisfies the separated ultrametric axioms. |
| `valuative_point_metric.equal_characteristic` | compatibility | For E=F_q((pi)), y_a=(pi-a), delta(y_a,y_b)=v_F(a-b). |

Unit tests:

- `valuative_point_metric.diagonal` (degenerate): delta(y,y)=infinity and d(y,y)=0.
- `valuative_point_metric.equal_char` (computed): For equal-characteristic points pi-a and pi-b with a!=b, d is |a-b|.
- `valuative_point_metric.direction` (non-example): A larger truncation precision gives a smaller ordinary distance, so delta is not itself a usual real-valued distance.

### Completeness of bounded primitive-point loci

Target `HF2/bounded-point-completeness` (theorem).

For each R>0 let Y_le_R={degree-one y:v_y(pi)<=R}. This locus is complete for d=q^-delta, and y |-> v_y(pi) is continuous. No completeness of the whole union over R is inferred.

Direct prerequisites: `HF2/valuative-point-metric`, `HF0/radial-limits-and-completeness`.

Proof plan:

1. A Cauchy sequence of ideals stabilizes modulo each a_r.
2. Their compatible inverse limit is an ideal of A. Choose r>R so a lifted generator retains primitive degree one.
3. Show the limit ideal is generated by that primitive lift using the strict change in its truncated residue valuation ideals.

Source: FF17, Proposition 2.3.4, p. 116.

Check: The uniform upper bound on v_y(pi) prevents the limit generator from leaving the degree-one locus.

### Lubin–Tate primitive equations

Target `HF2/lubin-tate-points` (construction).

For a Lubin–Tate polynomial Q with Q congruent pi X modulo X^2 and Q congruent X^q modulo pi, and 0!=epsilon in m_F, set u_epsilon=Q([epsilon^(1/q)]_Q)/[epsilon^(1/q)]_Q=[epsilon]_Q/[epsilon^(1/q)]_Q and y_epsilon=(u_epsilon). It is primitive of degree one, with reduction epsilon^(1-1/q). The formal Lubin–Tate group on m_F gives an E-Banach space V with pi acting by q-Frobenius. For E=Q_p and Q=(1+X)^p-1, u_epsilon=sum_(i=0)^(p-1)[(1+epsilon)^(i/p)]. Normalize |pi|_E=q^-1 and use ||epsilon||_V=1/v_F(epsilon) for epsilon!=0, with ||0||_V=0. Then ||pi dot epsilon||_V=q^-1||epsilon||_V; the ordinary absolute value |epsilon|_F would not be a homogeneous E-vector norm.

Direct prerequisites: `HF2/primitive-degree`, `HF2/q-compatible-tilt`, `RelativeFarguesFontaine:RF0:integral-Y/lubin-tate-teichmuller-lift`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.1/lt-module`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.1`.

Proof plan:

1. Use the imported twisted Teichmuller lift and the integral polynomial Q(X)/X to define the quotient without division in a larger ring.
2. Its constant term pi and reduction X^(q-1) prove the primitive criterion.
3. Transport the formal group law to m_F; perfection makes pi invertible, and the valuation supplies the complete Banach norm.

Source: FF17, Lemma 2.3.5, Definition 2.3.6, Example 2.3.7 and §2.3.2, pp. 117–118.

Check: The cyclotomic formula has exactly p summands; an additional [1+epsilon] is incorrect.

API derived from uses: `HF2/lubin-tate-parametrization` — Parametrize degree-one points by unit orbits.; `HF6/lubin-tate-product-logarithm` — Identify the orbit product with a logarithmic period.

| Proposed declaration | Role | Mathematical interface |
| --- | --- | --- |
| `lubin_tate_points.primitive` | constructor | u_epsilon is the polynomial Q(X)/X evaluated at the twisted lift. |
| `lubin_tate_points.residue` | simp | u_epsilon modulo pi equals epsilon^(1-1/q). |
| `lubin_tate_points.point` | coercion | The principal ideal of u_epsilon defines a degree-one point. |
| `lubin_tate_points.pi_action` | compatibility | Multiplication by pi in V is epsilon \|-> epsilon^q. |

Unit tests:

- `lubin_tate_points.q_two` (computed): For Q=2X+X^2, u_epsilon=1+[(1+epsilon)^(1/2)].
- `lubin_tate_points.zero_excluded` (non-example): epsilon=0 gives pi rather than a primitive point and is excluded.
- `lubin_tate_points.norm_degree` (computed): v_(y_epsilon)(pi)=(1-1/q)v_F(epsilon).

### Lubin–Tate parametrization and topology

Target `HF2/lubin-tate-parametrization` (theorem).

For F algebraically closed, epsilon |-> y_epsilon induces a bijection (V minus {0})/O_E^times -> Y_degree1. Give the source quotient the valuative proximity sup_(a in O_E^times) v_F(epsilon_1-a dot epsilon_2), using ordinary subtraction in F after the formal scalar action. It is at least q/(q-1) times delta(y_1,y_2), and the bijection is a homeomorphism. Modding by pi^Z yields P_E(V) homeomorphic to Y_degree1/phi^Z. The induced isomorphism C_y->C_(phi^k y) scales the F-normalized valuation by q^k, not by 1.

Direct prerequisites: `HF2/lubin-tate-points`, `HF2/bounded-point-completeness`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/tate-module-comparison`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.1`.

Proof plan:

1. Identify epsilon as a generator of the Lubin–Tate Tate module of its untilt.
2. Equality of ideals is equality of the corresponding rank-one Tate submodules, hence precisely an O_E-unit orbit.
3. Compare valuations of the finite-level torsion polynomials, then pass to their inverse limit to prove the inequality and inverse continuity; compute Frobenius directly on [x].

Source: FF17, Propositions 2.3.8–2.3.9, Definition 2.3.11, Proposition 2.3.12 and Corollary 2.3.13, pp. 117–120.

Check: The projectivization uses E^times, the point parametrization O_E^times, and Frobenius rescales the residue valuation.

### Metric and Berkovich topologies

Target `HF2/berkovich-topology-comparison` (comparison).

Embed the degree-one classical points into the multiplicative seminorm spectrum of B^b by f |-> q^(-v_y(f)/v_y(pi)). Equip that spectrum with pointwise convergence and require restriction to E to be the fixed pi-adic norm. The induced topology on the degree-one locus equals its metric topology. Gauss points are normalized by v_r/r. The proof uses min(v_y(f),delta)=min(v_z(f),delta) for f in A and delta=delta(y,z), not the false lower bound v_y(f)-v_z(f)>=delta.

Direct prerequisites: `HF2/valuative-point-metric`, `HF2/bounded-point-completeness`, `RelativeFarguesFontaine:RF0:annuli/berkovich-period-deformation`.

Proof plan:

1. Continuity of evaluation on B^b follows from the norm bound at rho=|pi|_y.
2. First use equality below the common truncation precision only for f in A. Extend continuity to B^b by inverting pi and nonzero Teichmuller elements, whose evaluations never vanish, and divide by the continuous positive function y |-> v_y(pi). The truncated identity itself is not asserted on B^b.
3. For the reverse topology write a metric ball through the valuation of a primitive generator, adjusting for the continuous normalization denominator.

Source: FF17, §2.3.3, Lemma 2.3.14 and Proposition 2.3.16, p. 120.

Check: Constants immediately refute the printed difference bound; the truncated equality gives the required continuity.

### Primitive points under totally ramified coefficient change

Target `HF2/primitive-coefficient-norm` (comparison).

Let Eprime/E be finite separable and totally ramified and F algebraically closed. The determinant norm from A_Eprime to A_E sends a degree-one primitive equation to a degree-one primitive equation. Contraction gives Y_(Eprime),degree1->Y_E,degree1 with residue-field isomorphisms and fibres of cardinality [Eprime:E]. If the extension is Galois, each fibre is a Gal(Eprime/E)-torsor. The degree-one assertion concerns ramified Witt primitive degree, not multiplication of that degree by [Eprime:E].

Additional hypotheses: Eprime/E finite totally ramified and separable; automatic in the mixed-characteristic source setting. F algebraically closed.

Direct prerequisites: `HF0/coefficient-change-norms`, `HF2/classical-point-comparison`.

Proof plan:

1. Compute the determinant norm modulo pi using the finite free ramified Witt coefficient basis.
2. Use the untilt tensor decomposition over the algebraically closed residue untilt to identify the factors and contraction.
3. Count the embeddings of the separable local-field extension and identify the Galois action.

Source: FF17, §2.3.4, Lemma 2.3.18 and Proposition 2.3.19, p. 121.

Check: The source omits part of the norm argument; the determinant and residue-untilt calculation are both required. Separability is essential for the fibre cardinality and torsor statement; no such cardinality is asserted for a purely inseparable equal-characteristic coefficient extension.

## HF3 — Geometric zeros and Weierstrass factorization

Over algebraically closed F, prove factorization of primitive equations into degree-one factors, extraction of linear zeros from Newton slopes, geometric compact principal ideal rings, convergent products near radius 0, and the exact divisor criterion for divisibility.

Layer status: **planned**. No additional local mathematical gap is claimed; target and interface review remains.

### Factorization of primitive equations

Target `HF3/primitive-factorization` (theorem). Atlas planet: **Primitive factorization theorem**.

If F is algebraically closed, every primitive a in A of degree d>=1 is a product of exactly d degree-one primitive elements. Equivalently a=u product_(i=1)^d([c_i]-pi), with u in A^times and 0<|c_i|<1. Thus irreducible primitive equations have degree one.

Direct prerequisites: `HF2/degree-one-division`, `HF2/bounded-point-completeness`, `HF0/newton-product-and-jensen`.

Proof plan:

1. Let lambda be the least positive source slope. Choose a root of the coefficient polynomial in F of valuation lambda to obtain a first approximate untilt zero.
2. Expand a in powers of the current primitive generator and choose the root of largest valuation in the next finite coefficient polynomial. The evaluation precision rises by lambda while the proximity grows at least linearly in the iteration index.
3. The points stay on v_y(pi)=lambda; bounded-point completeness gives a zero. Divide by its degree-one equation and induct on d.

Source: FF17, Theorem 2.4.1 and Corollaries 2.4.2–2.4.3, pp. 122–124.

Check: The argument controls both increasing evaluation precision and a uniform radius bound before taking a limit.

### Evaluation and closed primitive ideals

Target `HF3/evaluation-and-closed-division` (theorem).

For degree-one y with ||y||=q^(-v_y(pi)) in I, evaluation theta_y extends continuously B_I->C_y, satisfies |theta_y(f)|<=|f|_(||y||), and has kernel m_y B_I. Multiplication by a primitive generator has closed image; division of an element in that image respects every compact annular norm. On B_I^plus use its corresponding primitive ideal. If lambda=v_y(pi) is not a slope of f in B^b, v_y(f)=v_lambda(f).

Direct prerequisites: `HF3/primitive-factorization`, `RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate`.

Proof plan:

1. Bound every Teichmuller summand by its Gauss value at ||y|| and complete.
2. Use the imported Cartier-divisor norm estimate to divide a Cauchy sequence of multiples and obtain a Cauchy sequence of quotients.
3. For the no-slope equality a unique dominant term survives evaluation, or apply the ordinary Laurent-series version in C_y.

Source: FF17, Lemma 2.4.4, p. 124; Lemmas 2.4.7–2.4.8, p. 126.

Check: The kernel assertion requires the closed-image estimate, not only continuity of evaluation.

### A zero at every Newton slope

Target `HF3/linear-zero-extraction` (theorem). Atlas planet: **Newton zeros theorem**.

Assume F algebraically closed. For nonzero f in B_I and every positive source slope lambda of Newt_I(f), there is y in Y_I with v_y(pi)=lambda and f(y)=0. One can divide off a degree-one primitive equation for y in B_I. For finitely many slopes listed with multiplicity one can divide off the corresponding product; the remaining polygon deletes exactly those segments.

Direct prerequisites: `HF3/evaluation-and-closed-division`, `HF3/primitive-factorization`, `HF0/compact-norm-stabilization`.

Proof plan:

1. For f in A truncate its Teichmuller expansion and use primitive factorization to choose zeros at the prescribed slope.
2. A uniform bound on the multiplicity at that slope forces a neighboring zero to approach each chosen zero; the proximity bound tends to infinity.
3. Pass to general B_I using compact norm stabilization and closed division, then iterate for finite multiplicities.

Source: FF17, Theorems 2.4.5–2.4.6 and 2.4.10; Corollary 2.4.11, pp. 124–127.

Check: The source slope is lambda=-log_q||y||, with multiplicity the local vanishing order, not the radius ||y|| itself.

### Geometric compact annuli and principal ideals

Target `HF3/geometric-compact-ring-comparison` (comparison).

Over algebraically closed F, compare the source compact interval ring with the imported geometric affinoid PID theorem whenever its endpoints define an annular affinoid. Extend the comparison to arbitrary compact I subset [0,1): I={0} and I={rho} with rho not in |F^times| give complete fields; every other I gives a PID with maximal spectrum Y_I. The integral subring {f in B_[0,rho]:v_pi(f)>=0}, 0<rho<1, is a PID with the extra maximal ideal (pi).

Direct prerequisites: `HF3/linear-zero-extraction`, `HF1/units-and-boundary`, `VectorBundlesAndIsocrystals:VB2:classification/classical-points-and-principal-ideal-domains`.

Proof plan:

1. Import the geometric affinoid PID theorem through the ring comparison, without adding a second affinoid-PID target.
2. For arbitrary compact I use the finite number of Newton slopes and linear-zero extraction to factor every nonzero element into a unit and finitely many point generators.
3. Use evaluation kernels to identify the primes and the factorization criterion for a PID; for a singleton with no allowed slope every nonzero element is invertible.

Source: FF17, Theorem 2.5.1, Lemma 2.5.2 and Theorem 2.5.3, p. 128.

Check: The arbitrary compact-interval refinement includes irrational singleton fields and the extra pi-prime in the integral boundary-zero ring.

### Weierstrass products near radius zero

Target `HF3/near-zero-weierstrass-product` (construction). Atlas planet: **Weierstrass products**.

For a finite or countable family 0!=z_i in m_F, tending to zero if infinite, define W=product_i(1-[z_i]/pi), with empty product 1. The product converges in B^plus, uniformly for every compact positive-radius interval. For a nonzero f in B_I whose radii approach 0, list all zeros below a fixed rho_0 with multiplicity and choose their linear generators pi-[z_i]. Then f=Wg with g in B_(I union {0}) and no zeros below rho_0. If f in B_(0,1], then g in B^b; if f in B^plus, then g in A[1/pi].

Direct prerequisites: `HF3/linear-zero-extraction`, `HF1/boundary-extension`, `HF1/positive-newton-and-frobenius`.

Proof plan:

1. On a compact J, the norm of [z_i]/pi tends uniformly to zero, so the nonarchimedean product converges.
2. Divide successively by the selected linear factors; the Newton norm formula bounds the quotient norms.
3. Show the quotient differences tend to zero on every compact J. The zero-free near-0 remainder extends by the boundary theorem.

Source: FF17, §2.6, Theorem 2.6.1 and Example 2.6.2, pp. 128–129.

Check: The construction produces the exact near-zero divisor, and the zero-free remainder, rather than the original function, extends to radius 0.

API derived from uses: `HF5/invariants-of-holomorphic-functions` — Descend the near-zero divisor to prove invariants of B.; `HF6/positive-weierstrass-product` — Construct the product over nonnegative Frobenius iterates..

| Proposed declaration | Role | Mathematical interface |
| --- | --- | --- |
| `near_zero_weierstrass_product.product` | constructor | Finite partial products converge in every positive annular norm. |
| `near_zero_weierstrass_product.divisor` | characterisation | The divisor of W is the locally finite sum of the chosen zero points. |
| `near_zero_weierstrass_product.reorder` | compatibility | A permutation of the sequence gives the same product, by uniform convergence of the factors to 1. |
| `near_zero_weierstrass_product.factorization` | universal-property | Dividing f by its selected factors gives the boundary-extending remainder g. |

Unit tests:

- `near_zero_weierstrass_product.empty` (degenerate): The empty product is 1 with zero divisor.
- `near_zero_weierstrass_product.single` (computed): A single factor gives 1-[z]/pi and the empty family gives 1. An infinite family with |z_i|->0 gives the same exact-divisor construction on every compact positive-radius interval.
- `near_zero_weierstrass_product.tail` (non-example): Repeating a fixed nonzero z infinitely often does not meet the convergence hypothesis.

### Locally finite divisors on period annuli

Target `HF3/locally-finite-divisors` (definition). Atlas planet: **Holomorphic divisors**.

For I subset (0,1), define Div(Y_I) to be integer functions on the classical point set whose support meets Y_J in a finite set for every compact J subset I; Div^plus is its pointwise nonnegative submonoid. Restriction is coefficient restriction. For finite support use exactly the pinned TauCeti WeilDivisor carrier and its weightedDegree, via the canonical finite-support comparison. For nonzero f define div_I(f)(y)=ord_y(f), where ord_y is imported from the completed de Rham DVR. This divisor is locally finite and div(fg)=div(f)+div(g). If an interval notation includes 0 or 1, Div(Y_I) means this divisor object on I intersect (0,1), and local finiteness is tested only on compact subintervals of that interior. No finiteness at a compact interval reaching radius 1 is imposed.

Direct prerequisites: `HF3/evaluation-and-closed-division`, `HF3/linear-zero-extraction`, `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`, `tauceti:TauCeti.AlgebraicGeometry.WeilDivisor`, `tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.weightedDegree`.

Proof plan:

1. Use imported completed-local DVRs to define the order, not an independently built B_dR carrier.
2. The Newton zero theorem bounds the sum of orders on every compact interval.
3. Construct the finite-support comparison with Finsupp and check coefficientwise agreement with TauCeti.

Source: FF17, Definitions 2.7.1–2.7.2 and Proposition 2.7.3, pp. 130–132; §3.5.2, p. 146.

Check: Local finiteness permits infinitely many points escaping to a missing boundary, while the finite-support specialization is the existing WeilDivisor type.

API derived from uses: `HF5/closed-ideal-divisor-classification` — Classify closed ideals by their pointwise orders.; `HF6/orbit-divisors` — Pass from locally finite phi-invariant divisors to finite divisors on the orbit set..

| Proposed declaration | Role | Mathematical interface |
| --- | --- | --- |
| `locally_finite_divisors.coeff_ext` | extensionality | Two locally finite divisors are equal iff every point coefficient agrees. |
| `locally_finite_divisors.restrict` | functoriality | Restriction commutes with interval inclusion and divisor addition. |
| `locally_finite_divisors.finite_support` | equivalence | Divisors supported in a fixed compact interval correspond to TauCeti finite Weil divisors on its point set. |
| `locally_finite_divisors.div_mul` | compatibility | Local DVR orders give div(fg)=div(f)+div(g). |
| `locally_finite_divisors.effective` | relation | D is effective iff every coefficient is nonnegative. |

Unit tests:

- `locally_finite_divisors.linear` (computed): A simple primitive generator has coefficient 1 at its point and zero elsewhere.
- `locally_finite_divisors.escaping` (compatibility): A sequence of points with radii tending to 0 defines a locally finite divisor on (0,1), though its total support is infinite.
- `locally_finite_divisors.accumulating` (non-example): Infinitely many distinct points in one compact annulus with coefficient 1 do not define an allowed divisor.

### Divisibility detected by zeros

Target `HF3/geometric-divisor-criterion` (theorem).

For F algebraically closed and I subset (0,1), nonzero f,g in B_I satisfy f in g B_I iff div_I(f)>=div_I(g). Hence div induces an injective map (B_I minus {0})/B_I^times -> Div^plus(Y_I), and the Newton polygon is determined by the divisor up to an integral horizontal and real vertical translation. On a compact interval the divisor map is surjective.

Direct prerequisites: `HF3/locally-finite-divisors`, `HF3/geometric-compact-ring-comparison`.

Proof plan:

1. Divide out the finitely many point factors on each compact subinterval, using closed division and the local DVR orders.
2. The quotients agree on overlaps by faithful restriction, so they glue in the Frechet inverse limit.
3. For a compact divisor multiply its finitely many primitive generators; compare unit criteria for injectivity.

Source: FF17, Proposition 2.7.3 and Theorem 2.7.4, pp. 130–132.

Check: The divisor inequality is pointwise and includes multiplicity; equality of supports alone does not imply divisibility.

## HF4 — Descent of points and zeros over perfect fields

Descend primitive ideals from the completed algebraic closure using almost traces and unit cohomology. Classify finite-orbit points by marked finite-degree untilts; define weighted radii and prove the slope/zero formula and degree-independent normalized product estimates.

Layer status: **planned**. Open mathematical inputs, including inherited inputs: `R-TATE`.

### Almost traces and completed fixed fields

Target `HF4/perfect-field-trace-cohomology` (theorem).

Let C=completion of an algebraic closure of the perfect rank-one field F and G_F=Gal(Fbar/F). For finite L/F, m_F is contained in Tr_(L/F)(O_L). Continuous cohomology satisfies m_F H^1(G_F,O_C)=0, H^1(G_F,m_C)=0 and H^1(G_F,1+m_C)=0. Moreover C^{G_F}=F and W_OE(O_C)^{G_F}=A_F.

Direct prerequisites: `PerfectoidSpaces:P3/almost-purity-theorem`, `PerfectoidSpaces:P3/etale-almost-acyclicity`, `PerfectoidSpaces:P3`.

Proof plan:

1. A nonzero trace exists by separability. Taking inverse q-power roots gives trace values whose valuations tend to 0, hence absolute values tend to 1; these generate an ideal containing m_F.
2. Use approximate finite-level averaging with these traces to correct continuous additive and multiplicative cocycles by successively smaller errors. For m_C choose the correction bounds summably inside its open unit ball.
3. The same approximation estimates give the Ax fixed-field assertion; apply uniqueness of Witt coefficients to obtain A-invariants. The completed fixed-field estimate is a requested PerfectoidSpaces P3 interface until supplied explicitly.

Source: FF17, Chapter 3 introduction, p. 133; Lemma 3.1.1 and Corollary 3.1.2, p. 134.

Check: The trace absolute values tend to 1, and all cohomology is continuous for the valued topologies.

### Vanishing for ramified Witt principal units

Target `HF4/witt-unit-cohomology` (theorem).

For U=1+W_OE(m_C), with the weak Witt topology, H^1_cont(G_F,U)=0. Set U_k=1+pi^k W_OE(m_C), k>=1. Then U=lim U/U_k, U/U_1=1+m_C and U_k/U_(k+1)=m_C. All maps have the quotient topologies, and the successive coboundary corrections converge in U.

Direct prerequisites: `HF4/perfect-field-trace-cohomology`, `RelativeFarguesFontaine:RF0:integral-Y/coefficient-weak-topology`.

Proof plan:

1. Use Teichmuller expansion and weak completeness for the exact filtration and the inverse-limit assertion.
2. Solve the initial multiplicative cocycle in 1+m_C and each subsequent additive graded cocycle in m_C.
3. Choose compatible corrections and take their pi-adic limit, checking weak continuity of the resulting cochain.

Source: FF17, Lemma 3.1.3–Lemma 3.1.4 and Proposition 3.1.5, pp. 134–135.

Check: This is a topological inverse-limit argument with explicit corrections, not a general claim that H^1 commutes with inverse limits.

### Descent of stable primitive ideals

Target `HF4/primitive-ideal-descent` (theorem).

If a primitive principal ideal of A_C is G_F-stable, it has a primitive generator in A_F. Normalize its residue-Witt image to pi^d; the ratio c_sigma=sigma(a)/a lies in U and is continuous, so a unit coboundary makes the generator invariant. Continuity uses |c_sigma-c_tau|_rho=|sigma(a)-tau(a)|_rho/|a|_rho, with a fixed nonzero denominator.

Direct prerequisites: `HF4/witt-unit-cohomology`, `HF2/primitive-degree`.

Proof plan:

1. Normalize by an A_C-unit to make the residue coefficient exactly pi^d.
2. The ideal invariance yields a U-valued multiplicative cocycle. Its continuity follows from multiplicativity of the Gauss norm; a primitive generator does not have norm 1 at every interior radius.
3. Apply the unit-cohomology vanishing and A_C^{G_F}=A_F.

Source: FF17, Proposition 3.1.6, p. 135.

Check: The norm divisor in the cocycle estimate is retained; omitting it gives a false equality.

### Primitive points as finite Galois orbits

Target `HF4/finite-orbit-points` (theorem). Atlas planet: **Galois orbit description**.

There is a surjection beta:Y_C^{G_F-finite}->Y_F whose fibres are exactly G_F-orbits. If y is represented by an irreducible primitive a, deg(y) equals the size of beta^-1(y). A finite G_F-orbit of a degree-one point is reduced, and its orbit product descends to an irreducible primitive equation. For a stabilizer G_L, products run over the coset set G_F/G_L; L/F need not be Galois.

Direct prerequisites: `HF4/primitive-ideal-descent`, `HF3/primitive-factorization`.

Proof plan:

1. Factor a over C and partition its finite divisor into Galois orbits. Stable factors descend; irreducibility permits exactly one orbit.
2. Conversely form the product of generators over a finite orbit, descend its stable ideal and prove irreducibility by transitivity.
3. Use separability and the degree sum to show each conjugate occurs once and the fibre cardinality is the primitive degree.

Source: FF17, Proposition 3.1.7 and Theorem 3.1.8, pp. 136–137.

Check: The coset-set formula handles nonnormal stabilizers without writing a nonexistent Gal(L/F).

### Points and finite-degree marked untilts

Target `HF4/finite-degree-untilts` (theorem). Atlas planet: **Finite-degree untilt classification**.

For y=(a) in Y_F of degree d, K_y=B_F^b/(a)=A_F[1/pi]/(a) is perfectoid over E, with an isometric embedding F->K_y^flat of degree d. Points of degree d classify such pairs (K,iota) up to continuous E-isomorphism compatible with iota, allowing a common rescaling to make iota isometric. If z above y has stabilizer G_L, then K_y=C_z^{G_L}, K_y^flat=L, C_z is the completed algebraic closure of K_y, and Gal(K_y^alg/K_y)=Gal(Fbar/L). The map A_F->O_(K_y) is surjective exactly for d=1.

Direct prerequisites: `HF4/finite-orbit-points`, `HF4/perfect-field-trace-cohomology`, `HF2/general-fontaine-map`, `RelativeFarguesFontaine:RF2:untilts/primitive-untilt-correspondence`, `PerfectoidSpaces:P3/almost-finite-etale-equivalence`.

Proof plan:

1. Use the orbit factorization to identify the C-valued quotient with a product of conjugate untilts.
2. Take invariants and use the almost-annihilation of Witt H^1, then invert [varpi], to identify the quotient field. Over L the degree-one primitive ideal gives its valuation ring.
3. Apply the imported finite-etale tilting equivalence to identify the marked tilt and Galois groups; reverse the construction by the ramified theta kernel.

Source: FF17, Theorem 3.1.11, Definition 3.1.13 and Remarks 3.1.14–3.1.15, pp. 138–139; Theorem 3.3.1, p. 141.

Check: The marking is continuous. A degree-one equation has the special form [c]-pi only if the untilt contains a compatible pi-root system.

### Radius and degree of a general primitive point

Target `HF4/weighted-radius` (definition).

For an irreducible primitive a=sum[a_n]pi^n of degree d set ||y||=|a_0|^(1/d). This is independent of the primitive generator and equals |pi|_(K_y) with the F-normalized untilt valuation. Set Y_(F,I)={y:||y|| in I}. The point degree is [K_y^flat:F], not [K_y:E]. The Newton polygon of a is linear with source slope -log_q||y|| on [0,d], zero thereafter, and infinite on negative abscissae.

Direct prerequisites: `HF4/finite-degree-untilts`, `HF0/newton-product-and-jensen`.

Proof plan:

1. Over C the d conjugate linear factors have equal radius, and their constant-term norms multiply.
2. Use generator independence of degree and the norm of its unit factor.
3. Compare the untilt norm through the finite-degree marked embedding.

Source: FF17, Definition 3.4.1 and Lemma 3.4.2, p. 142.

Check: A geometric factor has constant norm ||y||, while the original degree-d constant coefficient has norm ||y||^d.

API derived from uses: `HF4/weighted-newton-zero-formula` — Match slopes and their correct weighted multiplicities.; `HF4/uniform-normalized-generators` — Obtain estimates independent of primitive degree.

| Proposed declaration | Role | Mathematical interface |
| --- | --- | --- |
| `weighted_radius.radius` | data | radius(y)=\|a_0\|^(1/deg(y)) for any primitive generator. |
| `weighted_radius.untilt_norm` | compatibility | radius(y)=\|pi\|_(K_y). |
| `weighted_radius.base_change` | functoriality | Every geometric point above y has the same radius. |
| `weighted_radius.interval` | characterisation | Membership in Y_(F,I) means precisely radius(y) in I. |

Unit tests:

- `weighted_radius.degree_one` (compatibility): For y=([c]-pi), radius(y)=|c|.
- `weighted_radius.conjugates` (computed): For two conjugate linear factors of norm s, the descended degree-two point has radius s, not s^2.
- `weighted_radius.weight` (non-example): A degree-d point contributes d times its local vanishing order, even though it is one point of Y_F.

### Weighted Newton zero formula

Target `HF4/weighted-newton-zero-formula` (theorem). Atlas planet: **Weighted Newton zero formula**.

For 0!=f in B_(F,I), its positive finite source slopes are lambda=-log_q||y|| at the zeros y in Y_(F,I); the multiplicity at lambda is sum_(||y||=q^-lambda) deg(y) ord_y(f). Evaluation extends B_(F,I)->K_y with norm bound |f(y)|<=|f|_(||y||) and kernel m_y B_(F,I). The de Rham completion at y agrees with the imported ramified completed local ring, and geometric pullback repeats the local order at each of the deg(y) conjugates.

Direct prerequisites: `HF4/weighted-radius`, `HF3/linear-zero-extraction`, `HF3/evaluation-and-closed-division`, `RelativeFarguesFontaine:RF2:untilts/divisor-completion-base-change`.

Proof plan:

1. A zero at a slope exists over C; the finite multiplicity bound forces its G_F-orbit to be finite.
2. Descend the orbit point and use the radius identity.
3. Compare local primitive factors and the imported Cartier completion to calculate orders and evaluation kernels.

Source: FF17, Lemma 3.4.3 and Theorem 3.4.4, pp. 142–143.

Check: The slope is a logarithmic valuation, and its weight is deg(y) times the vanishing order.

### Degree-independent normalized primitive generators

Target `HF4/uniform-normalized-generators` (theorem).

If y_i in Y_F have ||y_i||->0, choose primitive generators a_i in A_F with a_i/pi^(deg y_i)->1 in B^plus. For a point of radius s, write its geometric factor product w=product_(j=1)^d(pi-[z_j]), all |z_j|=s. A descent unit u can be chosen with |u-1|_1<=s^(1/2); whenever s<rho<1, |uw/pi^d-1|_rho<=max(s^(1/2),s/rho). This estimate is independent of d.

Direct prerequisites: `HF4/primitive-ideal-descent`, `HF4/weighted-radius`, `HF4/witt-unit-cohomology`.

Proof plan:

1. The conjugate radii equal s, so the normalized product differs from 1 by at most s/rho in a rho-norm.
2. Apply the filtered unit-cocycle correction with a relaxed bound s^(1/2) to descend w.
3. Bound the product error by the maximum of the unit error and the normalized factor-product error. Do not divide a coarse endpoint-1 bound by rho^d.

Source: FF17, Lemma 3.4.5, pp. 143–144, with corrected proof.

Check: The estimate remains convergent if deg(y_i) tends to infinity, which the printed degree-dependent bound did not establish.

### Weierstrass products over a perfect field

Target `HF4/general-field-weierstrass-products` (construction).

For an effective locally finite divisor D supported in Y_(0,rho0], there is W in B_F^plus with div(W)=D, obtained from the normalized generators a_i/pi^(deg y_i). For an effective divisor supported in Y_[rho0,1), there is a nonzero H in B_F with div(H)>=D, using factors 1-(1-a_i/[a_(i,0)])^i after listing the points with multiplicity. The second assertion supplies a divisor majorant and does not assert equality.

Direct prerequisites: `HF4/uniform-normalized-generators`, `HF3/locally-finite-divisors`.

Proof plan:

1. For the near-zero part use the degree-independent uniform estimate on each compact annulus and take the convergent product.
2. For the near-one part use |1-a_i/[a_(i,0)]|_rho<=rho/||y_i|| for rho<=||y_i||; the increasing exponents make the errors tend uniformly to zero.
3. Identify the prescribed zeros and distinguish the possible additional zeros of the outer-boundary factors.

Source: FF17, Propositions 3.4.6–3.4.7, pp. 144–145.

Check: The exact divisor assertion is confined to the near-zero product; the outer product is a majorant.

API derived from uses: `HF5/half-open-bezout` — Principalize any effective divisor on a half-open annulus.; `HF5/meromorphic-fraction-comparison` — Clear polar divisors globally.

| Proposed declaration | Role | Mathematical interface |
| --- | --- | --- |
| `general_field_weierstrass_products.near_zero` | constructor | Construct W with the exact chosen divisor below rho0. |
| `general_field_weierstrass_products.outer_majorant` | constructor | Construct H whose divisor dominates the chosen outer-boundary divisor. |
| `general_field_weierstrass_products.compact_limit` | characterisation | Both products converge uniformly for every compact interval of positive radii. |
| `general_field_weierstrass_products.base_change` | compatibility | Geometric base change of W has the pulled-back weighted orbit divisor. |

Unit tests:

- `general_field_weierstrass_products.empty` (degenerate): For D=0 both constructions can return 1.
- `general_field_weierstrass_products.single_degree_d` (computed): One degree-d point is represented by a/pi^d and has local divisor coefficient 1, with Newton multiplicity d.
- `general_field_weierstrass_products.outer_extra_zeros` (non-example): An outer factor 1-(1-a/[a_0])^i for i>1 can have zeros besides those of a; equality of divisors is not an API theorem.

## HF5 — Closed ideals and meromorphic functions

For every perfect F prove the compact field/PID dichotomy, classify closed ideals by locally finite effective divisors, prove half-open Bezoutness, produce nonclosed maximal ideals, identify meromorphic functions with Frac(B), and establish Galois invariants of B and B-plus.

Layer status: **planned**. Open mathematical inputs, including inherited inputs: `R-TATE`.

### Compact period rings over a perfect field

Target `HF5/compact-field-pid-dichotomy` (theorem). Atlas planet: **Compact interval principal ideal theorem**.

For perfect F and compact nonempty I subset [0,1), B_(F,I) is a complete valued field if I={0}, or if I={rho} with rho not in |F^times|^(1/infinity). Otherwise it is a PID and its maximal ideals are exactly m_y B_(F,I) for y in Y_(F,I). If 0 belongs to I and I!={0}, the subring with v_pi>=0 is a PID whose maximal ideals are those point ideals together with (pi). The spectrum in the second assertion is Spm(B_I), not Spm(B_(I minus {0})).

Direct prerequisites: `HF4/weighted-newton-zero-formula`, `HF3/geometric-compact-ring-comparison`, `HF1/units-and-boundary`.

Proof plan:

1. A compact polygon has finitely many slopes. The general-field zero theorem provides an irreducible primitive equation at each slope; divide repeatedly until a unit remains.
2. Primitive factorization is unique because each point kernel is prime. Apply the factorial-type PID criterion already used in the geometric case.
3. A nonrational singleton permits no slope and is therefore a field; retain the extra pi-factor in the integral boundary-zero subring.

Source: FF17, Theorem 3.5.1, p. 145.

Check: The exceptional radius group is the divisible hull of |F^times|, and both singleton and integral boundary-zero cases are checked.

### General-field divisor criterion

Target `HF5/general-divisor-criterion` (theorem).

For I subset (0,1) and nonzero f,g in B_(F,I), f belongs to g B_(F,I) iff ord_y(f)>=ord_y(g) for all y in Y_(F,I). Equality of the divisors is equivalent to f/g in B_(F,I)^times. Thus div embeds nonzero elements modulo units in Div^plus(Y_(F,I)).

Direct prerequisites: `HF5/compact-field-pid-dichotomy`, `HF3/locally-finite-divisors`.

Proof plan:

1. On a compact subinterval use its PID factorization and the weighted local-zero comparison.
2. The compact quotients agree under restriction, hence define an element of the inverse limit B_(F,I).
3. Apply the criterion in both directions for equality, and compare the no-zero unit criterion.

Source: FF17, Theorem 3.5.5, p. 146.

Check: This statement avoids the special singleton boundary rings, where the ordinary interior divisor has no information.

### Closed ideals and effective divisors

Target `HF5/closed-ideal-divisor-classification` (theorem). Atlas planet: **Closed ideal divisor correspondence**.

For I subset (0,1), D |-> a_D={f in B_(F,I):ord_y(f)>=D(y) for every y}; this map is an order-reversing bijection from effective locally finite divisors to nonzero closed ideals. Its inverse takes the minimum local order attained by the ideal. In particular closed maximal ideals are exactly the classical points Y_(F,I). Under compact restriction a_D B_J is the compact principal ideal of D restricted to Y_J.

Direct prerequisites: `HF5/compact-field-pid-dichotomy`, `HF5/general-divisor-criterion`, `HF4/general-field-weierstrass-products`.

Proof plan:

1. Each finite jet-vanishing condition is closed; their intersection gives closedness. Near-zero exact products and outer-boundary majorants show a_D is nonzero.
2. For a closed ideal a, use its finite-generated extensions to compact PID rings and successive approximation to identify a with lim_J B_J a.
3. Read its compact multiplicities and glue them into D; verify both inverse identities and the maximal-ideal assertion.

Source: FF17, Proposition 3.5.2 and Corollary 3.5.3, p. 146.

Check: The ideal/divisor correspondence reverses inclusion and is restricted to nonzero closed ideals.

### Half-open Bezout theorem

Target `HF5/half-open-bezout` (theorem). Atlas planet: **Half-open Bezout theorem**.

For 0<rho<1, B_(0,rho] is Bezout and its nonzero closed ideals are exactly its nonzero principal ideals. More generally on any I subset (0,1) and for nonzero f,g, the ideal (f,g) is principal iff min(div f,div g) is principal. The Robba colimit is Bezout; its carrier and standard discrete-coefficient special cases remain imported from the parent and RD.0.

Direct prerequisites: `HF5/closed-ideal-divisor-classification`, `HF4/general-field-weierstrass-products`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/analytic-ring-bezout`.

Proof plan:

1. If the minimum divisor is principal, divide by its generator and reduce to two functions with disjoint zero divisors.
2. Each compact annulus supplies a Bezout relation. Lift compatible relations by successive small corrections along the dense Banach restriction maps; completeness makes the corrections converge, which is the needed lim-one vanishing argument.
3. On (0,rho] all effective divisors are principal by the exact near-zero product. Iterate the two-generator assertion and compare filtered unions.
4. Handle a zero generator separately: (f,0)=(f) and (0,0)=0, without using the divisor of zero.

Source: FF17, Proposition 3.5.6, Theorem 3.5.7 and Corollary 3.5.8, p. 147.

Check: The general-perfect-field theorem is new here; RD.0’s discrete coefficient hypothesis is not silently removed.

### A nonclosed maximal ideal of an open annulus

Target `HF5/nonclosed-maximal-ideal` (application).

If I subset (0,1) has a missing boundary and a sequence of distinct classical points escaping every compact subinterval towards it, B_I has a nonclosed maximal ideal. Choose a nonzero divisor majorant f for the sequence and a compact exhaustion J_n. Divide f by the finite product of all its primitive zero factors in J_n, with their full multiplicities, to obtain g_n in B_I. The increasing union of (g_n) is proper and dense. Any maximal ideal containing it is nonclosed. Removing only the prescribed sequence would not justify density if f had additional zeros.

Additional hypotheses: Use I=(0,rho], 0<rho<1, and points with radii tending to 0 for the explicit construction. No assertion is made that every interval automatically has such a sequence over every F.

Direct prerequisites: `HF5/closed-ideal-divisor-classification`, `HF3/near-zero-weierstrass-product`, `HF4/general-field-weierstrass-products`, `HF5/general-divisor-criterion`, `HF0/frechet-completion-and-restriction`.

Proof plan:

1. The general-field Weierstrass majorant gives a nonzero f with infinitely many escaping zeros. Its full divisor is locally finite. On each J_n form the finite product a_n of primitive generators with exactly the orders of f there; the divisor criterion shows g_n=f/a_n belongs to B_I.
2. For nested J_n, a_n divides a_(n+1), so (g_n) is contained in (g_(n+1)). Every g_n has at least one remaining escaping zero, hence is not a unit; the union is proper.
3. For a fixed J_m, a sufficiently late g_n has no zero there and is a unit in B_(J_m). Since B_I is dense in B_(J_m), (g_n) has dense image in B_(J_m). An exhaustion tests every finite family of seminorms, proving density in B_I.
4. A maximal ideal containing this proper dense ideal cannot be closed. In the near-zero case exact tail products give a direct example.

Source: FF17, Compare Theorem 3.5.7, p. 147, and the distinction between closed ideals and ideals in §3.5.2, p. 146; construction from these results.

Check: The compact deletion removes every zero of the chosen majorant, including extra zeros; a fixed compact restriction of a late generator is a unit. The ideal is therefore dense and proper without assuming an outer-boundary product is exact.

### Meromorphic functions on the period domain

Target `HF5/meromorphic-functions` (definition).

For I subset (0,1) define M(Y_I)=lim_(compact J subset I) Frac(B_J) with transition maps induced by the injective ring restrictions. A compatible family is a meromorphic function. Extend the local DVR order to its fractions and set div(f)=sum_y ord_y(f)[y], a locally finite integral divisor. This agrees with the imported finite Weil divisor operations on every compact subinterval.

Direct prerequisites: `HF5/compact-field-pid-dichotomy`, `HF3/locally-finite-divisors`.

Proof plan:

1. Use domain and faithful restriction to extend each map to fraction fields.
2. Define the inverse limit as a compatible subfield of the product.
3. Compute local orders by subtraction on numerator and denominator; compact PID factorization gives local finiteness and independence.

Source: FF17, Definition 3.5.9 and the divisor construction before Theorem 3.5.11, pp. 147–148.

Check: Compatibility in the inverse limit is required; arbitrary unrelated compact fractions are not global meromorphic functions.

API derived from uses: `HF5/meromorphic-fraction-comparison` — Identify the inverse-limit field with a single global fraction field.; `HF8/rational-functions-and-ind-quotient` — Take Frobenius invariants to compute rational functions of the curve..

| Proposed declaration | Role | Mathematical interface |
| --- | --- | --- |
| `meromorphic_functions.restrict` | functoriality | A meromorphic function restricts to every smaller interval and every compact fraction field. |
| `meromorphic_functions.fraction_map` | constructor | A fraction of global holomorphic functions gives a compatible meromorphic family. |
| `meromorphic_functions.div_quotient` | compatibility | div(f/g)=div(f)-div(g) when f,g are nonzero holomorphic functions. |
| `meromorphic_functions.local_order` | projection | The y-coordinate of the divisor is the normalized order in B_dR,y. |

Unit tests:

- `meromorphic_functions.one` (degenerate): The constant function 1 has zero divisor.
- `meromorphic_functions.inverse_primitive` (computed): The reciprocal of a primitive generator has order -1 at its point.
- `meromorphic_functions.incompatible` (non-example): Two compact fractions that differ on their common nonempty subinterval do not define an element of M(Y_I).

### Global fractions and divisors

Target `HF5/meromorphic-fraction-comparison` (theorem).

M(Y)=Frac(B). The divisor map induces an injection M(Y)^times/B^times -> Div(Y), and B={f in M(Y):div(f)>=0}, including 0. For nonzero meromorphic f,g, div(f)>=div(g) iff f/g belongs to B.

Direct prerequisites: `HF5/meromorphic-functions`, `HF4/general-field-weierstrass-products`, `HF5/general-divisor-criterion`.

Proof plan:

1. Separate the polar divisor into a near-zero and an outer-boundary part.
2. Use an exact near-zero product and an outer majorant to find a nonzero global denominator whose divisor dominates all poles.
3. Multiply to obtain a globally holomorphic numerator and apply the divisor criterion; use the unit criterion for injectivity.

Source: FF17, Proposition 3.5.10 and Theorem 3.5.11, p. 148.

Check: Clearing all poles needs a global divisor majorant, not just the compact PID theorem.

### Galois invariants of holomorphic period rings

Target `HF5/invariants-of-holomorphic-functions` (theorem). Atlas planet: **Galois invariants of period functions**.

For C=completion of Fbar, B_C^{G_F}=B_F and (B_C^plus)^{G_F}=B_F^plus. The equalities preserve the induced Frechet topologies and all annular restrictions where defined.

Direct prerequisites: `HF4/finite-orbit-points`, `HF4/general-field-weierstrass-products`, `HF5/general-divisor-criterion`, `HF4/perfect-field-trace-cohomology`.

Proof plan:

1. For invariant f, its zero divisor below rho descends as a finite-orbit divisor. Realize that divisor by g in B_F^plus.
2. Write f=gh. The remainder h has no zeros near 0 and therefore extends to B_(C,[0,1)); uniqueness makes it invariant.
3. The unique boundary-zero Teichmuller expansion then has F-coefficients by the completed fixed-field assertion. Positivity descends by its norm characterization. The printed claim that g is zero-free is replaced by the correct statement about h.

Source: FF17, Theorem 3.6.1, pp. 148–149.

Check: It is the quotient remainder h that extends across radius 0; the chosen factor g carries the zeros.

## HF6 — Frobenius eigenvectors, orbit divisors and products

Refine the imported eigenvector carriers by their Banach topology and coefficient changes. Prove homogeneous factoriality in the geometric case, injectivity and geometric surjectivity of the orbit-divisor map, construct positive and negative Weierstrass products, compare with Lubin–Tate logarithms, and prove the Banach fundamental exact sequence and its corrected interpolation ideal.

Layer status: **planned**. Open mathematical inputs, including inherited inputs: `R-LT`, `R-TATE`.

### Banach topology of Frobenius eigenspaces

Target `HF6/eigen-banach-refinement` (comparison).

For integers d>=0,h>=1, refine the imported space B^{phi^h=pi^d}=(B^plus)^{phi^h=pi^d} by its Banach E_h-topology: restriction to any fixed compact fundamental radial interval defines an equivalent norm. For d>0 its map to barB^{phi^h=pi^d} is an algebraic E_h-linear isomorphism, with inverse obtained by lim_k pi^(-kd) phi^(kh)(x) from a lift of a quotient eigenvector. The degree-zero space is E_h, and negative degrees have no nonzero vectors. The positive-eigenvector equality and carrier remain owned by RF3 and VB1. The quotient eigenspace is given the Banach topology transported by this algebraic comparison; it is not given the inherited boundary valuation topology, which is discrete on a positive eigenspace because each nonzero eigenvector has v_0=0.

Additional hypotheses: For the E_h-scalar description assume F contains F_(q^h); otherwise use the corresponding unramified constant subfield actually present in F.

Direct prerequisites: `HF1/boundary-valuation-quotient`, `RelativeFarguesFontaine:RF3/positive-frobenius-eigenvector-restriction`, `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`.

Proof plan:

1. Use the imported eigenvector comparison, and control all radial norms by a fundamental interval and the eigen-equation.
2. For d>0 the error between successive quotient lifts is uniformly positive in the boundary coefficient valuation, so the normalized iterates converge in every interior norm.
3. Prove the inverse identities algebraically. The fundamental-interval estimates prove equivalence and completeness of the norms on the original eigenspace. Transport this topology to the quotient eigenspace; do not invoke open mapping for its inherited boundary valuation. Treat d=0 separately.

Source: FF17, Propositions 4.1.1–4.1.3, Lemma 4.1.4 and Propositions 4.1.5–4.1.6, pp. 152–154.

Check: The quotient-limit formula is for d>0. The norm is on the stated eigenspace with its usual local-field scalars, not the endpoint-1 ring topology.

### Coefficient and uniformizer transport of eigenvectors

Target `HF6/eigen-coefficient-and-uniformizer-change` (theorem).

Changing pi to pi-prime transports the eigenspace canonically after tensoring with the d-th tensor power of the E_h-line L={u in W_OE(Fqbar)[1/pi]:phi^h(u)pi=u pi-prime}. A chosen nonzero u gives multiplication by u^d. For an unramified extension E_n/E, scalar extension from E_h to E_(nh) identifies B_E^{phi_E^h=pi^d} with B_(E_n)^{phi_(E_n)^h=pi^(nd)}. For a finite separable extension E-prime/E of degree N and residue degree f, the coefficient-ring comparison followed by the uniformizer twist converts degree d to degree Nd. These identifications respect products and the eigenvector Banach topologies.

Additional hypotheses: F contains an algebraic closure of the residue constants for the displayed unramified scalar fields and twisting solutions. General F is treated by descent, not by pretending these constants lie in F.

Direct prerequisites: `HF6/eigen-banach-refinement`, `HF0/coefficient-change-norms`.

Proof plan:

1. Solve phi^h(u)/u=pi-prime/pi in the unramified constant Witt field; the whole solution space is a line and includes zero.
2. Use finite cyclic descent for the unramified eigencondition, keeping phi_(E_n)=phi_E^n.
3. For a ramified extension compare pi_E^f with pi_(E-prime)^N and solve their unit ratio by the same unramified twist. Check the degree rescaling on an eigenvector before extending by continuity.

Source: FF17, §6.1.1–6.1.3, pp. 243–244; Proposition 4.1.5, p. 154; Theorem 6.5.2, pp. 255–256.

Check: The twisting line lies in the field after inverting pi; the set of integral unit solutions alone is not an E_h-line. Separable extensions are required when etaleness is used.

### Factoriality of the homogeneous monoid

Target `HF6/homogeneous-factoriality` (theorem). Atlas planet: **Homogeneous factoriality**.

Assume F algebraically closed. In the imported P=direct_sum_(d>=0) B^{phi=pi^d}, every nonzero positive-degree homogeneous element is a product of d degree-one elements, uniquely up to E-units and permutation of the associated point-orbits. Thus the multiplicative monoid of nonzero homogeneous elements modulo E^times is free on P_1 minus {0} modulo E^times. This does not assert that the whole ungraded ring P is a UFD.

Direct prerequisites: `HF6/orbit-product-eigenvectors`, `RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map`.

Proof plan:

1. Use a primitive factor at a zero and the orbit-product construction to divide off a degree-one eigenvector.
2. Induct on the weighted degree; a residual zero-free eigenvector has degree zero and belongs to E^times.
3. Uniqueness follows from equality of local orders and the fixed-field unit calculation. The argument is organized mutually with the product theorem below, without a circular prerequisite edge.

Source: FF17, Theorem 6.2.1, p. 245.

Check: The free object is a commutative monoid, not a group, and the theorem is restricted to homogeneous elements.

### Weighted divisors modulo Frobenius

Target `HF6/orbit-divisors` (definition). Atlas planet: **Frobenius orbit divisors**.

Let |Y|/phi^Z be the set of classical Frobenius orbits. Define Div(Y/phi^Z) as the imported finite Weil-divisor group on this orbit set, weighted by deg(y). Pullback repeats each orbit coefficient along all its translates and identifies this group with the phi-invariant locally finite divisors on Y. For any 0<rho<1 its weighted degree is the sum deg(y)D(y) over rho^q<||y||<=rho. No new copy of the finite Weil-divisor carrier or its degree map is introduced.

Direct prerequisites: `HF3/locally-finite-divisors`, `HF4/weighted-newton-zero-formula`, `tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.weightedDegree`.

Proof plan:

1. Frobenius acts freely on positive radii, with radius q-power, so every orbit meets the half-open fundamental annulus exactly once.
2. Local finiteness on that compact annulus gives finite support; a finite-support orbit divisor pulls back locally finitely.
3. Use the imported weightedDegree homomorphism and independence of the chosen fundamental annulus.

Source: FF17, Definition 6.2.2, p. 245; Lemma 6.2.3, Definition 6.2.4 and Lemma 6.2.5, p. 246.

Check: The weight is the primitive degree, not merely one per orbit. The orbit divisor has finite support even though its pullback generally has infinitely many points.

API derived from uses: `HF6/eigenvector-divisor-map` — Measure a homogeneous section by its orbit zeros.; `HF7/general-schematic-curve` — Define the weighted degree of closed points of the curve..

| Proposed declaration | Role | Mathematical interface |
| --- | --- | --- |
| `orbit_divisors.pullback` | constructor | Repeat each orbit coefficient over all Frobenius translates. |
| `orbit_divisors.pullback_bijection` | characterisation | Pullback is a group isomorphism onto phi-invariant locally finite divisors. |
| `orbit_divisors.degree` | compatibility | The degree is the imported weightedDegree with weight deg(y). |
| `orbit_divisors.fundamental_annulus` | characterisation | Any half-open annulus (rho^q,rho] computes the same degree. |

Unit tests:

- `orbit_divisors.degree_d` (computed): The orbit of a primitive degree-d point has weighted degree d, even though its orbit coefficient is 1.
- `orbit_divisors.translate` (compatibility): A point and its Frobenius translate define the same orbit divisor.
- `orbit_divisors.infinite_orbits` (non-example): An arbitrary infinite-support function on the orbit set is not an orbit divisor.

### Divisors of homogeneous eigenvectors

Target `HF6/eigenvector-divisor-map` (theorem). Atlas planet: **Eigenvector divisor theorem**.

For nonzero x in P_d the zero divisor is phi-invariant, descends to an effective orbit divisor, and has weighted degree d. The map from nonzero homogeneous elements modulo E^times to effective orbit divisors is injective for every F. It is surjective when F is algebraically closed. For a general perfect F its possible failure of surjectivity is measured later by the degree-zero character class, not erased by extending scalars.

Direct prerequisites: `HF6/orbit-divisors`, `HF6/orbit-product-eigenvectors`, `HF5/meromorphic-fraction-comparison`.

Proof plan:

1. Apply the Newton scaling v_r(phi x)=qv_(r/q)(x) and the eigen-equation to compute the fundamental-annulus degree by the endpoint derivative difference.
2. Equal divisors give a zero-free quotient in (B^b)^times; its eigen-equation forces equal degrees and then an E-scalar.
3. For geometric surjectivity multiply the full-orbit products of primitive equations constructed below.

Source: FF17, Proposition 6.2.6, pp. 246–247; Theorem 6.2.7, p. 247.

Check: Frobenius rescales the vertical Newton coordinate by q as well as rescaling its slope parameter.

### Positive Frobenius products

Target `HF6/positive-weierstrass-product` (construction).

For b in M_d={b in A minus pi A:b modulo W(m_F) equals pi^d}, d>=0, define Pi_plus(b)=product_(n>=0) phi^n(b)/pi^d. The product converges in B^plus, satisfies phi(Pi_plus(b))=pi^d Pi_plus(b)/b, and has divisor sum_(n>=0) phi^n(div b), with the geometric Frobenius action convention fixed in the reader. It is multiplicative in b. M_0 is the group of b congruent to 1 modulo W(m_F), and M_d/M_0 identifies with primitive degree-d ideals.

Direct prerequisites: `HF1/positive-newton-and-frobenius`, `HF4/uniform-normalized-generators`.

Proof plan:

1. On any compact radial interval the factors approach 1 exponentially in q^n by the positive coefficient bound.
2. Use complete nonarchimedean product convergence and shift the index to obtain the eigen-ratio identity.
3. Extract local orders after restricting to a compact annulus, where only finitely many factors have zeros. Compare normalizing two primitive generators by a unit.

Source: FF17, §6.2.3, pp. 247–248; Definition 6.2.11, p. 250.

Check: The normalized factors b/pi^d, not the unnormalized iterates, converge to 1.

API derived from uses: `HF6/orbit-product-eigenvectors` — Supply one half of a full-orbit eigenvector.; `HF6/lubin-tate-product-logarithm` — Compare the product with the formal logarithm..

| Proposed declaration | Role | Mathematical interface |
| --- | --- | --- |
| `positive_weierstrass_product.product_limit` | constructor | Partial normalized products converge on every compact annulus. |
| `positive_weierstrass_product.frobenius_ratio` | characterisation | phi(Pi_plus(b)) b=pi^d Pi_plus(b). |
| `positive_weierstrass_product.multiplicative` | compatibility | Pi_plus(bc)=Pi_plus(b)Pi_plus(c). |
| `positive_weierstrass_product.divisor` | characterisation | Its zeros are exactly the indicated nonnegative translates, counted with multiplicity. |

Unit tests:

- `positive_weierstrass_product.one` (degenerate): Pi_plus(1)=1 for d=0.
- `positive_weierstrass_product.constant_pi` (non-example): b=pi^d for d>0 is not in M_d, because it lies in pi A; it cannot serve as a primitive point.
- `positive_weierstrass_product.functional_equation` (compatibility): Shifting finite products leaves exactly the b/pi^d denominator, determining the sign in the Frobenius ratio.

### Negative Frobenius product as a difference equation

Target `HF6/negative-weierstrass-solutions` (theorem).

Assume F algebraically closed. For nonzero b in B^b with v_pi(b)=0, the solutions x in B^b to phi(x)=bx form an E-line. It has a generator in A minus pi A when b is in M_d. Its E^times-class is denoted Pi_minus(b); its divisor is sum_(n<0) phi^n(div b). This is a difference-equation construction and does not assert convergence of the naive unnormalized infinite negative product.

Direct prerequisites: `HF1/boundary-laurent-expansions`, `HF3/linear-zero-extraction`, `HF6/positive-weierstrass-product`.

Proof plan:

1. For general b in B^b with v_pi(b)=0, rescale the unknown by a nonzero Teichmuller constant to make its multiplier integral, using a (q-1)-st root in F. Then solve the coefficient-zero equation x_0^q=b_0x_0 over the algebraically closed field.
2. Lift one pi-adic digit at a time by solving additive polynomials U^q-b_0U-c over F, and use the coefficient bounds to keep the lift in B^b (in A for normalized b).
3. For uniqueness compare solutions in W_OE(F)[1/pi], whose phi-fixed field is E. Use the difference equation and local orders to identify the negative translates; the residual no-zero solution has the prescribed normalization.

Source: FF17, Proposition 6.2.10, p. 249; Definition 6.2.11, p. 250.

Check: The fixed-field uniqueness argument occurs in W_OE(F)[1/pi], not in Frac(B), whose Frobenius invariants are the nonconstant function field.

### Full Frobenius orbit products

Target `HF6/orbit-product-eigenvectors` (theorem).

Assume F algebraically closed. For b in M_d, Pi(b)=Pi_plus(b)Pi_minus(b), defined up to E^times, is a nonzero element of P_d and has divisor sum_(n in Z) phi^n(div b). It is multiplicative modulo E^times and invariant under the M_0 normalization equivalence. Thus any effective orbit divisor is represented by a homogeneous eigenvector.

Direct prerequisites: `HF6/positive-weierstrass-product`, `HF6/negative-weierstrass-solutions`, `HF6/orbit-divisors`.

Proof plan:

1. Multiply the two functional equations to get phi(Pi)=pi^d Pi.
2. Add their complementary zero divisors and apply the no-zero unit criterion to normalization changes.
3. Represent each of the finitely many orbit points by a normalized primitive equation and multiply; count degree with its primitive weight.

Source: FF17, Lemma 6.2.12, pp. 250–251.

Check: The construction is only canonical as an E^times-class, which is precisely the quotient used in the homogeneous monoid.

### Orbit products and Lubin–Tate logarithms

Target `HF6/lubin-tate-product-logarithm` (comparison).

For the Lubin–Tate primitive equation u_epsilon=Q([epsilon^(1/q)]_Q)/[epsilon^(1/q)]_Q, its full orbit product agrees up to E^times with log_LT([epsilon]_Q). The logarithm is the limit of pi^(-n)[pi^n]_LT on the open unit disc. Its product expansion is grouped by finite torsion levels; no unconditional ordering of individual torsion factors is asserted. In equal characteristic the logarithm and this identity require the all-local-field extension recorded in request R-LT.

Direct prerequisites: `HF6/orbit-product-eigenvectors`, `HF2/lubin-tate-points`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/analytic-log`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.1`.

Proof plan:

1. Use the imported formal and analytic logarithm in characteristic zero. Telescope the finite product of Q-iterates, then take the normalized-iterate limit on each compact subdisc.
2. The compatible root [epsilon^(1/q)]_Q gives the negative-half difference-equation solution.
3. Compare the full product through the eigen-equation and divisor; retain only the scalar-independent normalization, avoiding a spurious extra pi factor.

Source: FF17, Proposition 6.3.1, pp. 251–252; Remark 6.3.2, p. 252; comparison of Pi and the logarithm, p. 253.

Check: The existing LT.0 logarithm is characteristic-zero only; equal characteristic is an explicit supplier request.

### Fundamental exact sequence with finite jets

Target `HF6/fundamental-exact-sequence` (theorem). Atlas planet: **Fundamental exact sequence**.

Assume F algebraically closed. Let y_1,...,y_d be degree-one points such that two points on the same Frobenius orbit are equal, allowing repetitions. Choose t_i in P_1 with zero orbit y_i. Evaluation gives a strict exact sequence of Banach E-spaces 0 -> E product_i t_i -> P_d -> B/(product_i m_(y_i)) -> 0. For E=Q_p and one point repeated d times, this is 0 -> Q_p t^d -> B^{phi=p^d} -> B_dR^+/Fil^d -> 0.

Direct prerequisites: `HF6/eigenvector-divisor-map`, `HF6/lubin-tate-product-logarithm`, `VectorBundlesAndIsocrystals:VB3:positive-basic-examples/lubin-tate-universal-cover`, `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`.

Proof plan:

1. Read the kernel using the orbit-divisor injection; its quotient by the product t_i has degree zero.
2. For one point and d=1 identify evaluation with the surjective Lubin–Tate logarithm supplied by the universal-cover comparison.
3. Induct on the jet order by multiplication by t_i, and combine distinct points by the Chinese remainder theorem. Banach openness makes the resulting algebraic surjection strict.

Source: FF17, Theorem 6.4.1, pp. 253–254; Example 6.4.2, p. 254.

Check: The orbit separation hypothesis is checked before evaluation; repeated points mean higher de Rham jets, not multiple independent copies of the residue field.

### Graded fibres and the corrected interpolation ideal

Target `HF6/graded-fibre-and-interpolation-ideal` (theorem).

Assume F algebraically closed. For t in P_1 vanishing at y, P/tP identifies as a graded algebra with {f in K_y[T]:f(0) in E}. Let y_1,...,y_d be degree-one points, with repetitions allowed and y_i in phi^Z y_j implying y_i=y_j; choose primitive generators a_i in M_1. Set g=phi(product_i Pi_minus(a_i)), using integral generators of the negative-half products. Then g belongs to A, v_pi(g)=0 and v_0(g)=0. The ideal {x in A:phi^n(x) belongs to product_i p_(y_i) for every n>=0} is gA. After extension to B the analogous evaluation ideal is gB. The Frobenius shift supplies the n=0 zeros. Without orbit separation the required divisor is the pointwise supremum of the backward translates, not their sum.

Direct prerequisites: `HF6/fundamental-exact-sequence`, `HF6/negative-weierstrass-solutions`, `HF5/general-divisor-criterion`, `HF1/boundary-extension`, `HF1/positive-annulus-subrings`.

Proof plan:

1. Apply the fundamental sequence degree by degree, with evaluation of the degree-one variable, and check multiplication to identify the graded fibre.
2. The conditions on phi^n(x) give the backward divisor including n=0; orbit separation identifies its sum with div(g). The divisor criterion first proves x/g belongs to B.
3. For x in A the quotient has no poles near radius zero, where g extends and is invertible, so the boundary-zero extension criterion puts x/g in the ring with a lower-bounded pi expansion. Since v_pi(g)=0 and v_pi(x)>=0, this quotient has v_pi>=0.
4. The primitive normalization gives v_0(g)=0. Taking the radius-one limit of multiplicative norms with |x|_1<=1 gives |x/g|_1<=1, so all coefficients of the quotient lie in O_F; hence x/g is in A. Conversely g and all its forward transforms satisfy the required ideal conditions.
5. For overlapping backward tails compute a pointwise supremum. The pair y_2=phi^(-1)y_1 detects the duplicated-multiplicity error.

Source: FF17, Corollary 6.4.3 and Theorem 6.4.4, p. 254, with the Frobenius shift and orbit-separation correction.

Check: Retain the integral ideal in A from Theorem 6.4.4 as well as its B extension. Check the shift, the orbit condition and both integrality boundaries of x/g; a B-divisor argument alone does not prove the A assertion.

## HF7 — Dedekind charts and the schematic curve

Identify imported geometric Proj charts with the classical construction, obtain the almost-Euclidean degree and the Bezout-to-PID criterion, descend de Rham jets and positive eigenvectors, compute the general-field Dedekind chart class group, and prove regularity, degree-one generation, the weighted product formula and the completed-local-ring comparison for Proj(P).

Layer status: **planned**. Open mathematical inputs, including inherited inputs: `G-EQUALCHAR`, `R-LT`, `R-TATE`.

### Geometric Be chart and degree

Target `HF7/geometric-chart-comparison` (theorem). Atlas planet: **Geometric Be chart**.

For algebraically closed F and nonzero t in P_1, the imported chart D_+(t) is Spec(Be), where Be=(B[1/t])^{phi=1}=(P[1/t])_0. This identifies its closed points with the orbits outside div(t), and its completed local rings with B_dR,y^plus. The function nu(f)=-ord_infinity(f), f nonzero in Be, is a nonnegative integer, additive on products, and vanishes exactly on E^times. Be is Bezout, and the resulting minimum-degree argument proves it is a PID. The curve, its Picard group and geometric HN theory remain imported from VB2. For the geometric chart the source also supplies weak almost-Euclidean division: for a,b in Be, b nonzero, there are q,r with a=bq+r and either r=0 or nu(r)<=nu(b). This weak inequality alone is not used as a Euclidean-domain criterion.

Direct prerequisites: `HF6/homogeneous-factoriality`, `HF6/fundamental-exact-sequence`, `VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point`, `VectorBundlesAndIsocrystals:VB2:classification/classical-points-and-principal-ideal-domains`, `mathlib:IsBezout`, `mathlib:IsBezout.TFAE`.

Proof plan:

1. Identify the section-localization chart of the parent Proj and compare its vanishing ideals using the orbit-divisor map.
2. Use the weighted degree-zero formula for a principal divisor to see nu>=0 and nu=0 precisely for a unit.
3. For a nonzero ideal choose an element of minimum nu. For any other element use a Bezout gcd; its degree cannot be smaller, so the gcd is associated to the chosen element and that element divides every ideal member.
4. For weak almost-Euclidean division, divide homogeneous representatives and use surjectivity of evaluation of the required positive-degree section on the finite zero divisor of b. A correction with only the pole at infinity leaves remainder pole order at most nu(b); retain the non-strict inequality.

Source: FF17, Theorem 6.5.2, pp. 255–256; §5.1, pp. 202–203; Préface §1.1–1.2, note 8, p. 3.

Check: Be means invariant functions after inverting t; it is not Frac(B)^{phi=1}. The generic degree argument is one milestone statable over the pinned ring API.

### Continuous descent of de Rham jets

Target `HF7/de-rham-jet-descent` (theorem).

Let C be the completed algebraic closure of F and z a finite-orbit point above y with stabilizer G_L, identified by tilting with the absolute Galois group of K_y. The invariant ring (B_dR,z^plus)^{G_L} is B_dR,y^plus, and likewise for its finite jets. A finite-length B_dR,z^plus-module with continuous semilinear action has H^1_cont=0. Scalar extension gives an equivalence from finitely generated B_dR,y^plus-modules to finitely generated B_dR,z^plus-modules with semilinear G_L-action continuous on every finite jet; the inverse is fixed vectors. No higher-cohomology assertion is included. The perfectoid Tate–Sen estimates needed for effectivity are request R-TATE.

Direct prerequisites: `HF4/finite-orbit-points`, `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`, `PerfectoidSpaces:P3`.

Proof plan:

1. For n=1 use the marked-untilt field correspondence and the almost trace estimates after tilting.
2. Obtain quantitative cochain corrections for the finite-dimensional semilinear residue modules, not just the scalar invariant-field equality.
3. Induct through the finite filtration using its residue-field graded pieces, control continuity of the lifts, and identify the completed local comparison. Do not substitute the fully faithful statement of P9 for this effectivity step.
4. For a finitely generated module, descend its torsion and free pieces through all finite jets, prove compatibility of the descended presentations, and pass to the complete inverse limit with norm-controlled lifts. This extra inverse-limit effectivity is included in R-TATE.

Source: FF17, Proposition 7.1.1 and preceding topology conventions, p. 262.

Check: The scalar fixed-field result alone does not imply descent of all continuous semilinear modules. This target carries a recorded supplier gap.

### Galois cohomology of positive eigenvectors

Target `HF7/positive-eigenvector-galois-cohomology` (theorem).

For d>=1 and a finite-dimensional continuous E-representation V of G_F, H^1_cont(G_F,P_(C,d) tensor_E V)=0. If V is nonzero, its H^0 is nonzero. Both statements are compatible with the Banach topologies and finite scalar extension. The assertion of a nonzero H^0 explicitly excludes V=0.

Direct prerequisites: `HF7/de-rham-jet-descent`, `HF6/fundamental-exact-sequence`, `HF2/lubin-tate-parametrization`, `HF4/perfect-field-trace-cohomology`.

Proof plan:

1. Choose a G_F-stable O_E-lattice in V and use the small-ball filtration of the Lubin–Tate parametrization for d=1.
2. Identify the successive quotients with m_C,rho tensor the residue lattice, and apply quantitative almost trace cohomology. Correct the cochains with shrinking errors and use completeness.
3. Deduce d>1 through the fundamental exact sequences and jet descent; prove nonzero invariants by lifting a nonzero invariant in the first nonzero small quotient.

Source: FF17, Proposition 7.1.2 and proof, pp. 262–264.

Check: Continuous cohomology uses the Banach module topology. The arbitrary perfectoid-untilt estimates remain explicit in R-TATE.

### Dedekind Be over a perfect field

Target `HF7/general-dedekind-chart` (theorem). Atlas planet: **General-field Dedekind chart**.

For any perfect F and nonzero t in P_(F,1), Be_F=(B_F[1/t])^{phi=1} is a Dedekind domain with units E^times. Its maximal ideals correspond to classical Frobenius orbits outside div(t). If f is nonzero then Be_F/(f) is the finite product, over the zeros of f off t, of B_dR,y^plus/Fil^(ord_y f); in particular each completed maximal localization is B_dR,y^plus.

Direct prerequisites: `HF7/geometric-chart-comparison`, `HF7/positive-eigenvector-galois-cohomology`, `HF7/de-rham-jet-descent`, `HF5/invariants-of-holomorphic-functions`.

Proof plan:

1. Over C the chart is a PID. Descend its quotient by f using H^1-vanishing of the filtered union t^(-k)P_(C,k).
2. Group geometric zeros into induced Galois modules using finite-orbit cosets and apply jet descent to each factor.
3. Use the resulting finite-product DVR-quotient characterization of a Dedekind domain, then recover maximal ideals and completions from these quotients. The no-zero eigenvector calculation gives units E^times.

Source: FF17, Propositions 7.2.1 and 7.2.3 and Lemma 7.2.2, pp. 264–265.

Check: Dedekind replaces PID over general F; the quotient factors include higher jets and primitive-degree residue extensions.

### Ideal classes and continuous characters

Target `HF7/dedekind-class-group` (theorem). Atlas planet: **Be ideal class group**.

For the general-field chart Be_F, Cl(Be_F) is canonically isomorphic to Hom_cont(G_F,E^times). A nonzero ideal becomes principal over Be_C; if I Be_C=(f), the associated character is sigma(f)/f. This convention fixes the inverse in the construction back from a twisted invariant section. In particular the general chart need not be principal.

Direct prerequisites: `HF7/general-dedekind-chart`, `HF7/positive-eigenvector-galois-cohomology`.

Proof plan:

1. Independence of the generator follows from Be_C^times=E^times. Locate f in a Banach degree filtration to prove continuity.
2. Use invariant holomorphic functions and the local-ideal comparison to show an ideal is recovered from its geometric extension, proving injectivity.
3. For a character choose nonzero sections for both the character and its inverse using positive eigenvector cohomology; their product supplies a nonzero invariant ideal. Verify its geometric extension and character.

Source: FF17, Proposition 7.2.4, pp. 265–266.

Check: Both twists are needed to show the invariant ideal is nonzero; continuity of the character is part of the conclusion.

### Generation of P by degree one

Target `HF7/degree-one-generation` (theorem).

For every perfect F the E-algebra P_F is generated by P_(F,1): Sym^d_E(P_(F,1)) -> P_(F,d) is surjective for every d>=0. Thus each homogeneous section is a finite sum of products of degree-one sections. It need not itself be a single product when F is not algebraically closed.

Direct prerequisites: `HF7/positive-eigenvector-galois-cohomology`, `HF6/eigen-coefficient-and-uniformizer-change`, `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`.

Proof plan:

1. Choose two degree-one sections with disjoint orbit divisors, and use their Koszul sequence over the geometric curve.
2. Twist by a positive power, apply geometric H^1-vanishing, then descend surjectivity using positive-eigenvector Galois cohomology. This handles degrees above the initial quadratic step.
3. For the quadratic step use a separable totally ramified quadratic coefficient extension, its two-Veronese comparison and faithful scalar descent. In equal characteristic 2 use an Eisenstein polynomial with nonzero derivative, for example X^2+pi X+pi, and the uniformizer unit twist, rather than adjoining a purely inseparable square root.

Source: FF17, Proposition 7.3.1 and Remark 7.3.2, pp. 266–267.

Check: Generation means a sum of products. The source coefficient field is characteristic zero; its equal-characteristic transfer must retain a separable quadratic extension.

### The schematic curve over general F

Target `HF7/general-schematic-curve` (theorem). Atlas planet: **General-field schematic Fargues–Fontaine curve**.

The imported X_(F,E)=Proj(P_F) is a regular noetherian integral scheme of dimension one. Its closed points are |Y_F|/phi^Z, the completed local ring at [y] is B_dR,y^plus, and the weight deg([y])=deg(y) gives sum_x deg(x)ord_x(f)=0 for nonzero rational f and H^0(X,O_X)=E. This is completeness in the weighted-curve sense of Definition 5.1.3; no finite-type properness over E is asserted.

Direct prerequisites: `HF7/general-dedekind-chart`, `HF7/degree-one-generation`, `HF6/eigenvector-divisor-map`, `RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map`.

Proof plan:

1. Degree-one generation covers Proj by the Dedekind charts Be_t. Compare their localizations on overlaps through the common invariant meromorphic field.
2. Identify their maximal ideals and completions with the orbit-point and jet descriptions.
3. Use the homogeneous quotient degree formula for rational functions to obtain the weighted product formula; a regular global function has no poles and is a constant by the eigenvector unit calculation.

Source: FF17, Theorem 7.3.3, pp. 267–268; Definition 5.1.3, p. 203.

Check: The conclusion is a regular noetherian curve, with a specified weighted degree convention, rather than a finite-type E-curve.

## HF9 — The interval site and coherent modules

Prove endpoint splitting and Mayer–Vietoris for all intervals in [0,1]. On intervals avoiding 1 establish exact-square gluing, finite-projective bundle equivalence, Frechet–Stein structure, the coadmissible coherent-module description, and the bounded-fibre-rank criterion for finite presentation.

Layer status: **planned**. Open mathematical inputs, including inherited inputs: `G-GENERATORS`, `G-MATRIX`, `R-TATE`.

### The period interval site

Target `HF9/interval-site` (definition). Atlas planet: **Period interval site**.

Objects are nonempty intervals I in [0,1], with inclusion morphisms. A family (I_alpha) of subintervals is admissible if, for each compact subinterval K of I, there are finitely many compact subintervals K_j of K whose union is K and each K_j is contained in some I_alpha. This finite compact-refinement condition implies union_alpha I_alpha=I. Restriction sends I to B_I. Bundle and coherent-module categories are confined to intervals avoiding 1; the ring site includes both endpoints. Merely requiring finitely many original cover members over K gives an incorrect topology.

Direct prerequisites: `HF0/frechet-completion-and-restriction`.

Proof plan:

1. Omit empty intersections. Pull a finite compact refinement back by intersecting with a compact test interval. For composition, refine each compact piece by the finite compact refinements furnished by its member cover. These operations prove the pretopology axioms.
2. Use the imported faithful restrictions to form the contravariant ring functor.
3. Separate the topology of the whole interval site from the subsite [0,1) supporting noetherian annular algebra.

Source: FF17, Remark 11.2.8, p. 371; Definitions 11.2.1 and 11.2.4, pp. 369–370.

Check: Finite compact refinements give pullback and composition, admit closed overlapping chains and compact exhaustions, and reject the disjoint adjacent half-open cover. The source finite-original-subcover wording is too weak for the claimed ring sheaf.

API derived from uses: `HF9/mayer-vietoris-and-sheaf` — State the function sheaf and H^1-vanishing.; `HF9/interval-bundles-and-coherent-systems` — Interpret compatible compact systems as sheaves..

| Proposed declaration | Role | Mathematical interface |
| --- | --- | --- |
| `interval_site.restrict` | functoriality | Every interval inclusion gives the compatible ring restriction. |
| `interval_site.cover_comp` | compatibility | Refining each member of an admissible cover by an admissible cover again covers. |
| `interval_site.compact_test` | characterisation | Admissibility is exactly the existence of a finite compact refinement subordinate to the family on every compact test interval. |
| `interval_site.endpoint_subsite` | constructor | Intervals avoiding 1 form the full subsite used for coherent objects. |

Unit tests:

- `interval_site.identity` (degenerate): The one-member family {I} covers I.
- `interval_site.exhaustion` (computed): A nested compact exhaustion of an open interval is an admissible cover.
- `interval_site.singletons` (non-example): The family of all singleton subintervals of [a,b], a<b, has union [a,b] but is not admissible.
- `interval_site.adjacent_half_open` (non-example): For a<c<b, the family {[a,c),[c,b]} has a finite set-theoretic subcover but is not admissible: no finite compact refinement covers [a,c) up to c without a member crossing c. Otherwise the ring sheaf would force the domain B_[a,b] to be a product of two nonzero rings.

### Additive endpoint splitting

Target `HF9/endpoint-splitting` (theorem).

For any interval I in [0,1], let I_plus be the convex hull of I union {1} and I_minus the convex hull of I union {0}. Inside B_I, B_I=B_(I_plus)+B_(I_minus). A convergent expansion into Laurent approximants can be split by nonnegative and negative pi-indices: the nonnegative-index pieces sum in B_(I_minus), while the negative-index pieces sum in B_(I_plus). This is a convergent decomposition, not a claim of unique Teichmuller expansions for every completed element.

Direct prerequisites: `HF0/frechet-completion-and-restriction`, `HF1/boundary-laurent-expansions`.

Proof plan:

1. Write an element as a convergent sum of dense Laurent approximants with geometrically shrinking errors.
2. For each approximant split its finite/lower-bounded index expansion and apply the Gauss monotonicity separately.
3. The nonnegative-index norm is nondecreasing in rho; the negative-index norm is nonincreasing. These bounds give convergence in the respective enlarged intervals.

Source: FF17, Lemma 11.2.6, pp. 370–371, with the monotonicity and endpoint assignments corrected.

Check: The superscripts plus/minus on index pieces have the opposite assignments from I_plus/I_minus; the endpoint test on pi and pi^-1 determines them.

### Mayer–Vietoris and acyclicity on intervals

Target `HF9/mayer-vietoris-and-sheaf` (theorem). Atlas planet: **Annular Mayer–Vietoris theorem**.

For intervals I,J in [0,1] with nonempty intersection, 0 -> B_(I union J) -> B_I direct_sum B_J -> B_(I intersect J) -> 0 is exact, with last map (f,g) |-> f-g. Equivalently inside the intersection ring, B_(I union J)=B_I intersect B_J and B_(I intersect J)=B_I+B_J. The interval ring functor is a sheaf on the admissible site and H^1(I,O)=0.

Direct prerequisites: `HF9/endpoint-splitting`, `HF9/interval-site`, `HF1/boundary-extension`.

Proof plan:

1. Use endpoint splitting for additive surjectivity.
2. Use the explicit boundary-extension criteria to identify the intersection as the ring on the union, rather than inferring it just from injectivity.
3. Use the admissible finite compact refinements, order their endpoints and refine further to closed chains with nonempty adjacent overlaps. Induct by the two-interval exact sequence on each compact test interval. Dense complete restrictions remove the inverse-limit obstruction along an exhaustion, giving sheaf descent and H^1=0 on the stated site.

Source: FF17, Proposition 11.2.7 and Remark 11.2.8, p. 371.

Check: The equality of intersections takes place inside B_(I intersect J); arbitrary set-theoretic intersections of abstract rings are not intended.

### Period functions as a Frechet–Stein algebra

Target `HF9/frechet-stein-comparison` (theorem). Atlas planet: **Frechet–Stein structure of period annuli**.

For I subset [0,1), choose an increasing compact exhaustion J_n. The Banach rings B_(J_n) are noetherian, their restriction maps are flat and have dense image, and B_I=lim_n B_(J_n) is a Frechet–Stein E-algebra in the imported ND.2 sense. Its coherent systems and coadmissible modules therefore have exact global sections and B_J tensor_(B_I) Gamma(M)=M_J. Generic Frechet–Stein algebras, coadmissibility and their Theorems A/B are imported, not defined again here.

Direct prerequisites: `HF5/compact-field-pid-dichotomy`, `HF0/frechet-completion-and-restriction`, `LocallyAnalyticDistributionsPartII:ND.2/frechet-stein-algebra`, `LocallyAnalyticDistributionsPartII:ND.2/coadmissible-module`, `LocallyAnalyticDistributionsPartII:ND.2/coadmissible-theorems`.

Proof plan:

1. Use the compact field/PID dichotomy for noetherianity. A restriction is an injective map into a domain and hence torsion-free over the source PID, giving flatness.
2. Density follows from the common Laurent subring. Use endpoint maximum norms and a cofinal exhaustion for the defining seminorms.
3. Apply the imported coadmissible theorems, and compare an arbitrary compact J with a sufficiently large exhaustion member.

Source: FF17, §11.2.1, pp. 369–370.

Source: ST02, §3, definition and Theorems A/B, pp. 7–9; Corollaries 3.1–3.5, pp. 9–10; Lemma 3.6, pp. 10–11.

Check: The defining Banach algebras have the usual local-field scalar topology because 1 is excluded.

### Bundles and coherent systems on intervals

Target `HF9/interval-bundles-and-coherent-systems` (definition).

For I subset [0,1), define Fib(Y_I) as the 2-limit over compact nonempty J subset I of finite projective B_J-modules, and Coh(Y_I) as the corresponding 2-limit of finitely generated B_J-modules. Each object includes isomorphisms M_J tensor_(B_J) B_K ≅ M_K for K subset J, satisfying the identity and triple-inclusion cocycle conditions; morphisms commute with these isomorphisms. The categories of modules at a fixed ring use the existing generic finite-projective and coherent-module infrastructure.

Direct prerequisites: `HF9/interval-site`, `HF9/frechet-stein-comparison`.

Proof plan:

1. Form compatible systems in the imported module categories; the compact PID/field theorem makes each bundle system finite free at a compact stage.
2. Define restriction by retaining the smaller compact intervals and identify cofinal compact exhaustions.
3. Use the interval sheaf property and the gluing theorem to identify these systems with locally free, respectively coherent, O-modules on the subsite.

Source: FF17, Definitions 11.2.1 and 11.2.4, pp. 369–370; Remarks 11.2.13–11.2.14, p. 374.

Check: The transition maps are base-change isomorphisms with a cocycle; an arbitrary inverse system of modules is not a bundle.

API derived from uses: `HF9/finite-projective-bundle-equivalence` — Take compatible global sections and reconstruct compact systems.; `HF10/bundle-galois-descent` — State continuous descent on each compact module.

| Proposed declaration | Role | Mathematical interface |
| --- | --- | --- |
| `interval_bundles_and_coherent_systems.evaluate` | projection | A system evaluates at each compact J with its specified module category. |
| `interval_bundles_and_coherent_systems.base_change_iso` | projection | Every inclusion K subset J supplies an isomorphism after scalar extension. |
| `interval_bundles_and_coherent_systems.cofinal_comparison` | compatibility | Passing to a nested cofinal compact exhaustion gives equivalent categories. |
| `interval_bundles_and_coherent_systems.restrict` | functoriality | Interval restriction preserves all transition isomorphisms and tensor operations on bundles. |

Unit tests:

- `interval_bundles_and_coherent_systems.rank_n` (computed): The constant system B_J^n with its canonical transitions is a rank-n bundle.
- `interval_bundles_and_coherent_systems.zero` (degenerate): The zero system is the zero object of both categories.
- `interval_bundles_and_coherent_systems.rank_jump` (non-example): A nested system with changing positive rank cannot have the required base-change isomorphisms.

### Global sections of interval bundles

Target `HF9/finite-projective-bundle-equivalence` (theorem).

For I subset [0,1), Gamma: Fib(Y_I) -> finite-projective B_I-modules is an exact tensor equivalence, with inverse M |-> (M tensor_(B_I) B_J)_J. It commutes with restriction to compact intervals. For I=(0,rho], all these modules are finite free. The generic affine-scheme finite-projective/vector-bundle equivalence is existing work in current TauCetiRoadmap AlgebraicVectorBundles; the target here is the noncompact interval comparison.

Direct prerequisites: `HF9/interval-bundles-and-coherent-systems`, `HF9/frechet-stein-comparison`, `HF5/half-open-bezout`, `LocallyAnalyticDistributionsPartII:ND.2/coadmissible-theorems`.

Proof plan:

1. Apply the imported Frechet–Stein exactness and base-change theorem to the compatible compact bundle system.
2. Supply G-GENERATORS: produce one finite family of compatible global sections generating on every compact annulus, with bounded approximation estimates. This gives a surjection O^n->E of coherent systems and a kernel bundle K.
3. Because E_J is finite free on every compact J, Hom(E_J,O_J^n)->Hom(E_J,E_J) is surjective. Apply exact global sections to these coherent Hom systems and lift id_E to a global splitting E->O^n. The resulting finite B_I-module is a direct summand of B_I^n, hence finite projective. This avoids any false assertion that classical compact points cover every maximal ideal of B_I.
4. Use base change and exactness to prove the mutually inverse tensor functors. For I=(0,rho], finite projectives over the Bezout domain are free. The splitting also gives a finitely generated kernel; it is not an independent consequence of bounded coadmissible rank.

Source: FF17, Propositions 11.2.2–11.2.3, pp. 369–370.

Check: Uniform finite generation remains G-GENERATORS. Conditional on those generators, exactness on the coherent Hom systems produces a splitting and proves projectivity even at nonclassical maximal ideals.

### Coherent systems and bounded fibres

Target `HF9/coherent-module-classification` (theorem). Atlas planet: **Coherent period-module classification**.

For I subset [0,1), Gamma identifies Coh(Y_I) with the coadmissible B_I-modules. Such a module is noncanonically M direct_sum product_(y in Y_I) N_y, where M is finite projective, N_y is a finitely generated torsion B_dR,y^plus-module, and the nonzero N_y have locally finite support on compact annuli. It is finitely presented over B_I iff the dimensions of all fibres over k(y) are uniformly bounded. The lengths of the torsion modules themselves need not be bounded.

Direct prerequisites: `HF9/finite-projective-bundle-equivalence`, `HF9/frechet-stein-comparison`, `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`.

Proof plan:

1. Use the imported coadmissible equivalence for the first assertion. At each compact PID split off its finite torsion submodule, identify the torsion through the local DVR jets, and pass to the locally finite product.
2. Lift the projective quotient using exact global sections and the bundle equivalence; choose a splitting to obtain the noncanonical direct sum.
3. Finite presentation bounds all fibre dimensions. Conversely a uniform bound supplies uniformly bounded compact presentations; use the generator approximation obligation and coherent exactness to obtain a global finite presentation.

Source: FF17, Proposition 11.2.5, p. 370.

Check: The bound is on fibre dimension, not torsion length. A cyclic jet B_dR,y^plus/(xi_y^n) has fibre dimension one for every n.

### Matrix factorization with a surjective tangent map

Target `HF9/corrected-matrix-factorization` (theorem).

For Banach E-algebras B_1,B_2 mapping to A and Z in GL_n(A), assume the bounded linear map (U,V) |-> U+ZVZ^-1 from M_n(B_1) direct_sum M_n(B_2) to M_n(A) is surjective. Then a neighborhood of 1 in GL_n(A) is contained in {X Z Y Z^-1:X in GL_n(B_1),Y in GL_n(B_2)}. Additive surjectivity B_1+B_2=A alone is not the tangent hypothesis for arbitrary Z. The neighborhood may depend on Z.

Direct prerequisites: `mathlib:ContinuousLinearMap.isOpenMap`, `mathlib:ContinuousLinearMap.exists_nonlinearRightInverse_of_surjective`.

Proof plan:

1. Use the pinned Banach open mapping theorem to choose a bounded, possibly nonlinear, right inverse of the tangent map.
2. Apply Newton corrections to the analytic polynomial multiplication map (1+U)Z(1+V)Z^-1; a quadratic remainder estimate and the bounded lift force geometric error decay.
3. Use complete Banach balls small enough that both factors are invertible. This proof avoids characteristic-zero exponential/logarithm restrictions and does not require a continuous linear section.

Source: FF17, Lemmas 11.2.10–11.2.11, pp. 372–373, with the tangent hypothesis corrected.

Check: The source application must verify the conjugated tangent surjectivity. The theorem supplies no uniform neighborhood for a varying Z.

### Effective interval gluing of bundles and coherent systems

Target `HF9/interval-gluing` (theorem). Atlas planet: **Interval gluing theorem**.

For I_1,I_2 subset [0,1) with nonempty intersection, restriction identifies Fib(Y_(I_1 union I_2)) with triples (E_1,E_2,iota), where iota is an isomorphism on the overlap. The same holds for Coh. Finite-projective gluing is the imported exact-square theorem applied after the analytic surjectivity condition has actually been established. This condition is not inferred from the ring Mayer–Vietoris sequence alone.

Direct prerequisites: `HF9/mayer-vietoris-and-sheaf`, `HF9/corrected-matrix-factorization`, `HF9/interval-bundles-and-coherent-systems`, `RelativeFarguesFontaine:RF4:vector-bundles/finite-projective-glueing-over-exact-square`.

Proof plan:

1. Reduce by compact exhaustions to two compact intervals. Full faithfulness follows from the ring intersection theorem.
2. For essential surjectivity factor an overlap transition matrix into matrices from the two sides. Diagonalize an approximating common-ring matrix over its PID, split its scalar divisors between the sides, and verify the conjugated tangent map is onto.
3. The required approximation must lie in the Z-dependent factorization neighborhood. A uniform quantitative argument or a replacement exact-square surjectivity proof is still required (G-MATRIX); once supplied, apply RF4 gluing and extend to coherent modules by compact PID presentations.

Source: FF17, Proposition 11.2.12 and Remarks 11.2.13–11.2.14, pp. 373–374.

Check: The overlap comparison has target E_2 restricted to the intersection. The source proof’s moving-neighborhood approximation is explicitly open here.

### Closed submodules on a half-open annulus

Target `HF9/closed-submodules-of-half-open-free` (theorem).

For R=B_(F,(0,rho]), 0<rho<1, and a submodule N of R^d, N is closed iff it is finite free; in that case its rank is at most d. This includes general perfect F, rather than only the discrete-coefficient case of RD.0 or the classical cyclotomic case in PadicHodgeTheory.

Direct prerequisites: `HF9/finite-projective-bundle-equivalence`, `HF5/closed-ideal-divisor-classification`.

Proof plan:

1. For a closed submodule, extend to every compact PID annulus and use faithful restrictions to keep the generic rank bounded by d.
2. Identify the closed module with the compatible compact system by complete approximation; apply the bundle equivalence and half-open Bezout freeness.
3. Conversely for a finite free embedded submodule use a nonzero rank minor and the local DVR divisibility conditions to express membership as closed finite-jet and linear equalities.

Source: FF17, Préface Theorem 2.35, p. 26, compared with §§3.5.2 and 11.2.1, pp. 146–147 and 369–370.

Check: Free means finite rank here; an arbitrary infinite free module is not an asserted closed submodule of R^d.

## HF10 — Finite extensions and continuous module descent

For compact intervals in [0,1) with endpoints in the value group prove finite etaleness under finite F-extension with an almost trace estimate; establish completed-algebraic-closure invariants, effective continuous semilinear finite-free descent and its compatibility with interval bundles. Record why the boundary-1 assertion fails.

Layer status: **planned**. Open mathematical inputs, including inherited inputs: `G-BOUNDARY`, `G-GENERATORS`, `R-TATE`.

### Finite etale extension of compact period annuli

Target `HF10/finite-extension-annuli` (theorem). Atlas planet: **Finite etale descent on annuli**.

Let L/F be finite (hence separable, since F is perfect), and let I be a compact interval in [0,1) with nonzero endpoints in |F^times|. Then B_(L,I) is finite etale of constant degree [L:F] over B_(F,I); for a Galois extension its automorphism group is Gal(L/F). For the spectral unit balls, [epsilon] B_(F,I)^circ is contained in Tr_(L/F)(B_(L,I)^circ) for every nonzero epsilon in m_F. At I={0} this is the unramified Witt-field extension. Moreover the spectral unit-ball extension is almost finite etale for the ideal generated by [m_F] in the coefficient integral ring. Its almost finite projectivity and almost vanishing cotangent complex are proved through the same root-refined discriminant estimates; this is stronger than the displayed trace inclusion.

Direct prerequisites: `HF4/perfect-field-trace-cohomology`, `HF0/absolute-annulus-comparison`, `HF5/compact-field-pid-dichotomy`, `RelativeFarguesFontaine:RF0:annuli/period-rings-finite-etale-compatibility`.

Proof plan:

1. Choose an integral primitive element alpha and b with b O_L subset O_F[alpha]. Replace alpha by alpha^(1/p^k) so |b^(1/p^k)| exceeds the outer radius.
2. Lift the basis through Witt digits and contract the residual error on the compact annulus. This yields generation over B_(F,I), with rational coefficients, not generation of the whole ring over its unit ball.
3. Compare Galois conjugates for independence and degree. The discriminants of the root-refined bases approach norm 1 uniformly on I; the trace dual basis gives etaleness and the almost trace estimate.
4. Use discriminant-dual finite subalgebras with annihilator losses tending to the almost ideal to obtain almost finite projectivity and almost vanishing of differentials; compare with parent almost purity on the annular adic pair. Do not replace almost etaleness by trace-surjectivity alone.

Source: FF17, Proposition 11.2.15(1)–(2) and Remark 11.2.16, pp. 374–376.

Check: The coefficient sum in the printed proof must use B_(F,I), not only its unit ball. The strict exclusion of radius 1 is needed by the contraction.

### Completed algebraic-closure invariants on compact annuli

Target `HF10/completed-extension-invariants` (theorem).

For the same compact intervals I, B_(C,I)^{G_F}=B_(F,I) as topological E-algebras, C=completion(Fbar). Restrictions to smaller such intervals commute with this equality. This extends the global invariant assertion to each compact Banach annulus, including the boundary-0 field.

Direct prerequisites: `HF10/finite-extension-annuli`, `HF5/invariants-of-holomorphic-functions`.

Proof plan:

1. Use the finite-extension almost trace estimates uniformly on the compact interval.
2. Approximate a G_F-invariant C-coefficient function by finite-extension functions and correct the invariant error by traces whose norm loss tends to 1.
3. Take a complete Banach limit in B_(F,I), and prove the inclusion is isometric in the chosen endpoint norm. At radius 0 use the unique Witt expansion directly.

Source: FF17, Proposition 11.2.18, p. 376.

Check: This scalar invariant theorem is kept separate from the stronger effective module descent.

### Effective continuous semilinear descent

Target `HF10/effective-continuous-module-descent` (theorem). Atlas planet: **Continuous semilinear descent**.

For I compact in [0,1) with endpoints in the F-value group, extension of scalars gives an equivalence between finite free B_(F,I)-modules and finite free B_(C,I)-modules with continuous semilinear G_F-action; its inverse is fixed vectors and the canonical base-change map is an isomorphism. Continuity uses the Banach norm of the module. The necessary uniform matrix-cocycle corrections are the quantitative input in request R-TATE.

Direct prerequisites: `HF10/completed-extension-invariants`, `HF10/finite-extension-annuli`, `PerfectoidSpaces:P3`, `PerfectoidSpaces:P9/finite-galois-descent-of-modules`.

Proof plan:

1. Full faithfulness follows from the scalar invariant theorem applied to matrix entries.
2. For effectivity first approximate the cocycle on a sufficiently small open subgroup by finite-extension matrices. Use almost traces and a quantitative noncommutative cocycle correction to trivialize its small part with convergent norm bounds.
3. Descend the remaining finite-level action by faithful flat finite Galois descent. Prove the descended module is finite projective and hence free over the compact PID or field. The P9 full-faithfulness theorem by itself supplies none of the small-cocycle construction.

Source: FF17, Proposition 11.2.18, p. 376, and its stated appeal to Sen’s method.

Check: This is a theorem target with an explicit quantitative supplier gap, not an inference from completed scalar invariants.

### Continuous descent of interval bundles

Target `HF10/bundle-galois-descent` (theorem).

For every I subset [0,1), Fib(Y_(F,I)) is equivalent to bundles on Y_(C,I) with a semilinear G_F-action whose action on sections over every compact subinterval is continuous. The equivalence and fixed-vector inverse commute with interval restriction, tensor products and Frobenius. The compact descent theorem for value-group endpoints must be extended to arbitrary compact subintervals by G-RADIUS before taking the limit; density of |F^times| alone does not cover an irrational singleton or an included irrational endpoint.

Direct prerequisites: `HF10/effective-continuous-module-descent`, `HF9/finite-projective-bundle-equivalence`.

Proof plan:

1. Value-group compact intervals form convenient enclosing neighborhoods of any compact J away from 1, but need not be a cofinal exhaustion contained in the given interval. Prove G-RADIUS: finite-extension completed base change and the quantitative trace and matrix-cocycle estimates on J itself, with uniform constants from enclosing intervals, without assuming its object or cocycle extends to a neighborhood.
2. With this arbitrary-compact descent input, descend each compact module and its overlap identifications. Full faithfulness makes the cocycles and restriction comparisons unique.
3. Take the 2-limit over every compact subinterval and apply the interval bundle/global-section equivalence. Check continuity and Frobenius on exactly these compact module topologies.

Source: FF17, Conclusion of §11.2.4, pp. 376–377.

Check: The full interval theorem is conditional on G-RADIUS in addition to R-TATE and G-GENERATORS. Test an irrational singleton and a closed irrational endpoint; a contained value-group exhaustion cannot be used in either case.

### Why radius one is excluded from etale descent

Target `HF10/endpoint-one-failure` (application).

The finite-etale and continuous module descent statements above are not extended to intervals containing 1. For B_(0,1]=B^plus[1/[varpi]], finite F-extension need not produce the asserted finite-etale annular algebra. Likewise Frobenius modules over B^plus fail the Galois descent satisfied over B. The positivity boundary quotient retains residue-field Frobenius information that global B-descent loses.

Direct prerequisites: `HF1/boundary-valuation-quotient`, `HF10/finite-extension-annuli`.

Proof plan:

1. Inspect the proof’s required inequality outer_radius<|b^(1/p^k)|: it cannot hold at outer radius 1.
2. Remark 11.1.11 describes the essential image of B-plus Frobenius modules through representations factoring through G_F -> G_(k_F). Choose a continuous representation not factoring through this quotient; its associated B-module is outside that image. Identifying such a representation and checking the comparison is the concrete counterexample obligation G-BOUNDARY.
3. Give the unit/quotient comparison without turning failure of this proof into the sole reason for failure of the theorem; the concrete Frobenius counterexample is a source obligation recorded in G-BOUNDARY.

Source: FF17, Remark 11.2.17, p. 376, and Remark 11.1.11, p. 366.

Check: The target includes the actual counterexample obligation, since a failed contraction estimate alone does not disprove descent.

## HF8 — Curve functoriality, ample lines and reconstruction

Identify rational functions and the ind-scheme Frobenius quotient. Prove separable coefficient change and finite Galois base-field covers, distinguish algebraic-closure base change from completion, identify positive Frobenius-line section algebras, and prove Runge approximation and reconstruction of the adic quotient from the scheme together with its Gauss norms.

Layer status: **planned**. Open mathematical inputs, including inherited inputs: `G-EQUALCHAR`, `G-GENERATORS`, `R-LT`, `R-TATE`.

### Rational functions and the ind-scheme quotient

Target `HF8/rational-functions-and-ind-quotient` (theorem). Atlas planet: **Schematic Frobenius quotient**.

E(X_F)=Frac(B_F)^{phi=1}. For a nonempty open U, O_X(U) is the intersection of the nonnegative local valuation rings at the closed points of U inside this field. The natural phi-invariant map colim_(compact I subset (0,1)) Spec(B_I) -> X is universal for phi-invariant maps to schemes. Each Spec(B_I)->X is flat; for I=[rho_1,rho_2] with rho_1<=rho_2^q it is faithfully flat. The fpqc equivalence relation is the actual kernel pair over X, not an asserted disjoint union of Frobenius graphs.

Direct prerequisites: `HF5/meromorphic-fraction-comparison`, `HF7/general-schematic-curve`, `HF7/positive-eigenvector-galois-cohomology`.

Proof plan:

1. Geometrically write an invariant meromorphic function as a quotient of homogeneous sections of equal degree by clearing its positive and negative orbit divisors.
2. Over general F, coprime numerator and denominator transform by the same continuous character. Multiply both by a positive section with the inverse character, making them invariant.
3. Identify opens and regular functions by the Dedekind valuations. On each target affine open use the invariant localization B[1/t]^{phi=1}; glue to prove the universal property. Flatness follows from torsion-free modules over the Dedekind local rings, and the fundamental-annulus condition supplies surjectivity.

Source: FF17, Proposition 6.6.2, pp. 256–257; Proposition 6.7.1 and Remark 6.7.2, pp. 258–259; Proposition 7.4.1, p. 268.

Check: The quotient is characterized in schemes, with its genuine kernel pair. General-field rational-function descent uses an inverse-character section.

### Separable coefficient change of the curve

Target `HF8/coefficient-field-base-change` (theorem). Atlas planet: **Coefficient-field functoriality**.

Let E-prime/E be finite separable, and assume the residue constants of E-prime embed in F. Then X_(F,E) tensor_E E-prime is canonically X_(F,E-prime), and the projection is finite etale of degree [E-prime:E]. For the unramified part the underlying period ring is unchanged and Frobenius is iterated; for the totally ramified part use the completed tensor comparison and rescale radii by the ramification index. The generic printed identity B_(E-prime)=B_E tensor_E E-prime is not used in the unramified case.

Direct prerequisites: `HF8/rational-functions-and-ind-quotient`, `HF6/eigen-coefficient-and-uniformizer-change`, `HF0/coefficient-change-norms`, `SchemeAndStackFoundations:SF.0/relative-proj`.

Proof plan:

1. Split the extension into its unramified and totally ramified parts and use the eigenspace/Veronese comparisons in each case.
2. Compute the resulting invariant function fields, keeping the Frobenius iteration in the unramified calculation.
3. At a closed point decompose K_y tensor_E E-prime as a finite product of finite separable fields and compare the corresponding Dedekind localizations. Glue the normal affine charts.
4. The graded twist over the coefficient field is by tensor powers of a one-dimensional line. A choice of basis gives a graded comparison; changing that basis multiplies degree d by a scalar to the d-th power, hence acts identically on degree-zero basic-open localizations. The resulting Proj map is canonical. Import relativeProj.veroneseIso for every positive Veronese, without a finite-generation assumption.

Source: FF17, §6.1.3, p. 244; Theorem 6.5.2(2), pp. 255–256; Proposition 7.5.1, p. 269, with the unramified correction.

Check: For equal-characteristic inseparable coefficient extensions, the tensor can be nonreduced; they are outside this etale statement.

### Finite extensions of the tilt give etale covers

Target `HF8/finite-galois-field-cover` (theorem).

For finite Galois L/F, X_(L,E)->X_(F,E) is finite etale Galois with group Gal(L/F), of degree [L:F]. Closed-point stabilizers act faithfully as Gal(K_z/K_y) on the corresponding residue fields, so inertia is trivial. Non-Galois finite separable extensions give finite etale maps by passage to a Galois closure.

Direct prerequisites: `HF4/finite-orbit-points`, `HF7/general-dedekind-chart`, `SchemeAndStackFoundations:SF.1/finite-group-quotient`, `HF7/positive-eigenvector-galois-cohomology`.

Proof plan:

1. Use the finite-orbit point dictionary to identify quotient orbits and the stabilizer action on residue fields.
2. Radius preservation prevents a Galois element from identifying a point with a nontrivial Frobenius translate.
3. Choose invariant degree-one sections nonvanishing on a given finite orbit, using positive-eigenvector cohomology, to put each orbit in an invariant Dedekind affine chart. Identify the invariant chart ring with the F-chart. Faithfulness of the stabilizer on residue fields makes the action free on geometric points; apply the existing SF.1 finite-group quotient theorem to obtain the finite etale torsor.

Source: FF17, Proposition 7.6.1, pp. 269–270, invoking SGA 1, Exposé V, Corollary 2.4.

Check: Residue stabilizer faithfulness is the no-inertia input; it is stronger than knowing only the quotient set of closed points.

### Curve of the uncompleted algebraic closure

Target `HF8/algebraic-closure-tower` (construction). Atlas planet: **Algebraic-closure tower curve**.

Define X_(Fbar,E)=lim_(finite L/F in Fbar) X_(L,E) in schemes, with affine chart rings the filtered colimits of the finite-etale Dedekind chart rings. It is a regular noetherian curve with constant field E, despite the infinite tower. There are G_F-equivariant maps X_(C,E)->X_(Fbar,E)->X_(F,E), C=completion(Fbar). Finite-orbit points survive as closed points; a point of X_C with infinite G_F-orbit maps to the generic point of the tower curve.

Direct prerequisites: `HF8/finite-galois-field-cover`, `HF7/general-dedekind-chart`, `HF4/finite-orbit-points`.

Proof plan:

1. Use finite etale affine transition morphisms to construct the scheme inverse limit by its affine chart colimits.
2. For each finite-orbit point choose a normal finite L/F with G_L contained in all stabilizers of its finitely many geometric conjugates. Its primes are then inert at every later finite stage, with unchanged uniformizer because the chart extensions are etale.
3. For a nonzero element f from a finite-level chart, the number of primes above its zeros and their orders eventually stabilize. Each local colimit is an unramified DVR with that uniformizer and a growing residue field. Its quotient by the fixed power of the uniformizer is a truncated DVR of fixed length. Thus the colimit quotient is a finite product of such rings; apply the Dedekind quotient criterion. The finite-stage residue fields, and therefore the quotient rings themselves, need not stabilize.

Source: FF17, Definition 7.7.1, Proposition 7.7.2 and Lemma 7.7.3, pp. 270–271.

Check: The uncompleted algebraic closure and its completion give different curves; the noetherian claim uses eventual inertness, not an arbitrary filtered colimit theorem.

API derived from uses: `FF17 §7.7, p. 271` — Distinguish algebraic closure from completion when comparing curve points and pro-Galois covers..

| Proposed declaration | Role | Mathematical interface |
| --- | --- | --- |
| `algebraic_closure_tower.projection` | functoriality | The inverse-limit curve maps compatibly to each finite-level curve. |
| `algebraic_closure_tower.affine_ring` | characterisation | Over a fixed affine chart its ring is the filtered colimit of the finite-level chart rings. |
| `algebraic_closure_tower.completion_map` | constructor | Compatible point and function maps induce X_C->X_Fbar. |
| `algebraic_closure_tower.galois_action` | compatibility | The G_F-action and all finite projections agree with their quotient actions. |

Unit tests:

- `algebraic_closure_tower.finite_stage` (compatibility): Projection followed by a finite transition agrees with projection to the lower stage.
- `algebraic_closure_tower.infinite_orbit` (non-example): A geometric closed point with infinite G_F-orbit does not give a closed tower point.
- `algebraic_closure_tower.inert_prime` (computed): If a normal finite stage L has G_L contained in each stabilizer of a finite orbit, the associated primes remain prime at every later stage. Their residue fields may grow; only the number of primes and the ramification indices stabilize.

### Finite-projective Frobenius modules on B

Target `HF8/absolute-frobenius-module-category` (definition).

Specialize the existing finite-projective semilinear-module pattern of VB1 to the already imported ring B, not to its Robba germ. Objects are finite projective B-modules M with a semilinear Phi whose linearization phi^*M -> M is an isomorphism. Morphisms commute with Phi; tensor products and internal Homs carry the induced Frobenius, and H^0(M)=ker(Phi-1). By HF9 this is also the category of interval bundles on (0,1) with invertible Frobenius descent datum. No equivalence with Frobenius modules over the Robba germ is asserted here.

Direct prerequisites: `HF9/finite-projective-bundle-equivalence`, `VectorBundlesAndIsocrystals:VB1/robba-frobenius-modules`.

Proof plan:

1. Use finite-projective modules over the already imported B; require invertibility of linearized Frobenius in the data.
2. Use the global-section equivalence for (0,1), and its compatibility with pullback by the radius Frobenius, to compare B-modules with interval bundles carrying Frobenius datum.
3. Transport tensor, dual and Hom operations through this comparison; verify H^0 is the fixed-vector E-space.

Source: FF17, §7.8, pp. 271–272, with invertibility of Frobenius retained.

Check: A semilinear endomorphism alone would include zero Frobenius and fail to define a rigid tensor category.

API derived from uses: `HF8/rank-one-degree-and-characters` — Define the degree and character of a rank-one object.; `HF8/positive-line-proj` — Recover X from powers of any positive line.

| Proposed declaration | Role | Mathematical interface |
| --- | --- | --- |
| `absolute_frobenius_module_category.linearization_iso` | projection | The structure supplies an isomorphism phi^*M≅M. |
| `absolute_frobenius_module_category.interval_bundle_comparison` | compatibility | The B-ring specialization agrees with invertible-Frobenius interval bundles through HF9; the VB1 linearization convention is unchanged. |
| `absolute_frobenius_module_category.tensor_dual` | constructor | Finite projectivity and invertible Frobenius give tensor products and duals. |
| `absolute_frobenius_module_category.fixed_vectors` | characterisation | H^0 is the equalizer of Phi and the identity as an E-vector space. |

Unit tests:

- `absolute_frobenius_module_category.unit` (computed): (B,phi) is the tensor unit and H^0=E.
- `absolute_frobenius_module_category.twist` (computed): For (B,pi^(-d)phi), fixed vectors are B^{phi=pi^d}.
- `absolute_frobenius_module_category.zero_frobenius` (non-example): (B,0) is excluded, although zero is semilinear.

### Degree and characters of Frobenius lines

Target `HF8/rank-one-degree-and-characters` (theorem). Atlas planet: **Degree-zero Frobenius lines**.

For a rank-one object (M,Phi), after extension to B_C choose a basis with Phi(e)=lambda e and define deg(M)=-v_pi(lambda). It is independent of basis and additive on tensor products. Degree maps Pic(phi-Mod_B) onto Z, and its kernel Pic^0 is canonically Hom_cont(G_F,E^times) via the action on geometric fixed vectors. The character statement is about degree zero; arbitrary-degree lines do not have a one-dimensional fixed-vector space.

Direct prerequisites: `HF8/absolute-frobenius-module-category`, `HF6/negative-weierstrass-solutions`, `HF10/bundle-galois-descent`, `VectorBundlesAndIsocrystals:VB1/annular-frobenius-descent`, `VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles`, `HF1/units-and-boundary`.

Proof plan:

1. Use the imported annular Frobenius-descent equivalence and geometric bundle classification to send M tensor B_C to a rank-one bundle O(d) on X_C. Pull back its standard presentation, obtaining a free B_C-module with Frobenius multiplier pi^(-d). A general basis changes this by phi(u)/u, of pi valuation zero by the B-unit description. Half-open interval freeness alone would not provide a basis over B_C.
2. Solve the geometric degree-zero difference equation to identify its invariant E-line.
3. Apply effective continuous descent of interval bundles on all compact subintervals to reconstruct the line from its character; use HF9 to recover the B-module. Check inverse constructions and continuity on the same compact norms.

Source: FF17, §7.8, pp. 272–273.

Check: The inverse character construction depends on HF10 effectivity, not just full faithfulness of a completed-cover functor.

### Every positive Frobenius line presents the same curve

Target `HF8/positive-line-proj` (theorem). Atlas planet: **Positive-line presentation of the curve**.

For positive-degree Frobenius lines L_1,L_2, multiplication H^0(L_1) tensor_E H^0(L_2) -> H^0(L_1 tensor L_2) is surjective. For any positive-degree L its section algebra is generated in degree one and X≅Proj(direct_sum_(d>=0) H^0(L^tensor d)), canonically. In particular for lambda in B^times with v_pi(lambda)>0, X≅Proj(direct_sum_(d>=0) B^{phi=lambda^d}).

Direct prerequisites: `HF8/rank-one-degree-and-characters`, `HF7/degree-one-generation`, `HF7/positive-eigenvector-galois-cohomology`, `SchemeAndStackFoundations:SF.0/relative-proj`.

Proof plan:

1. Over C write both lines as positive integral twists with continuous characters. Use a two-section Koszul sequence that retains both character twists.
2. Use positive-eigenvector H^1-vanishing and the separable quadratic/Veronese argument to prove multiplication, including the smallest positive degrees.
3. For two positive lines replace one by a high tensor power and compare all maps between them on their section-covered affine charts; independence of the map follows from the rank-one interchange identity. Glue inverse scheme maps.

Source: FF17, Propositions 7.8.1–7.8.2 and Example 7.8.3, pp. 273–274.

Check: The multiplication argument keeps both twists. The Frobenius multiplier in the fixed-vector line is lambda^-1, so its degree is positive.

### Runge approximation and recovery of the adic curve

Target `HF8/runge-and-adic-reconstruction` (theorem). Atlas planet: **Runge approximation**.

Let I be a compact interval in (0,1) with endpoints in |F^times| and I intersect I^q empty. If t in P_1 has no zeros on Y_I, Be_t is dense in B_I. The ringed scheme (X,O_X), together with all radial Gauss norms, recovers the adic Frobenius quotient. The bare E-scheme without these norms is not asserted to determine that adic space.

Direct prerequisites: `HF8/rational-functions-and-ind-quotient`, `HF2/lubin-tate-parametrization`, `HF1/units-and-boundary`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve`.

Proof plan:

1. Use the Lubin–Tate period sum L(x)=sum_(n in Z)[x^(q^-n)]pi^n and isolate its dominant Teichmuller term on the whole interval.
2. Approximate the unit-ball generators [x], [a]/pi and pi/[b]. For the last use pi times (L(epsilon b^(-1/p^n))/L(epsilon))^(p^n), whose dominant term is pi/[b]. Its only denominator is a power of the chosen t=L(epsilon), so it belongs to Be_t. Division by this ratio would instead approximate pi[b] and introduce an inadmissible pole.
3. Obtain a uniform residue-ball surjection and iterate smaller corrections for density. Complete the chart functions in the specified norms, recover their adic spectra and glue using the radius action.
4. Import the existing AdicSpaces Layer 6 annular and Frobenius-quotient constructions. In the current Tau Ceti library the Q_p topological carriers spaY/spaX, open quotient map and wandering windows already exist. The target here is their comparison with the completed schematic charts and norms, not a second quotient construction.

Source: FF17, Proposition 7.9.1 and Corollary 7.9.2, pp. 274–276.

Check: The compact interval must avoid its Frobenius translate and the chosen pole. Recovery uses the family of norms as additional data.

## HF11 — Arithmetic examples and maximal completeness

Supply the strict-untilt and nonprincipal bounded-function examples, classify closed prime ideals of the integral period ring, and formulate maximal-completeness and automorphism-orbit results with the necessary valued homogeneity hypothesis. These discriminate the general-perfect-field theory from the geometric special case.

Layer status: **planned**. Open mathematical inputs, including inherited inputs: `G-EQUALCHAR`, `G-HOMOGENEITY`, `R-BC`, `R-KT`, `R-LT`, `R-TATE`.

### A nonprincipal ideal of B-plus

Target `HF11/nonprincipal-positive-ideal` (theorem). Atlas planet: **Nonprincipal positive-period ideal**.

For E=Q_p and F=C_p^flat, choose a convex decreasing sequence beta_j in Z[1/p] tending to an irrational beta>0. With Y=[p^flat], put f=sum_(i>=0) p^i Y^(beta_(2i)) and g=sum_(i>=0) p^i Y^(beta_(2i+1)). The two-generated ideal (f,g) is not principal in A[1/p], and remains nonprincipal in B^plus. Thus B^plus is not Bezout in this example. This does not settle whether B itself is Bezout.

Direct prerequisites: `HF1/monomial-field-model`, `HF1/positive-newton-and-frobenius`.

Proof plan:

1. Successively subtract the initial terms and divide by p to create elements of the ideal whose first residual coefficient valuations approach beta from above.
2. A hypothetical principal generator h can be normalized into A minus p A. The divisibility bounds from both sides force v_F(h mod p)=beta.
3. The value group of C_p^flat is rational, contradicting irrationality. In B^plus first use the Newton bounds to show a hypothetical generator can be chosen in the bounded subring, then apply the same argument.

Source: Berger08, Remark 1.1.3, p. 96; compare FF17 Préface Remark 3.10(ii), p. 35.

Check: The explicit example has rational value group. No universal non-Bezout statement over all algebraically closed F is inferred.

### A strict endomorphism of a completed algebraic closure

Target `HF11/strict-power-series-endomorphism` (theorem). Atlas planet: **Strict endomorphism of a power-series closure**.

Let k be a perfect field of characteristic p and C_k a completed algebraic closure of k((t)). There is a continuous k-linear field endomorphism C_k->C_k which is not surjective. One may first adjoin algebraic residue constants inside C_k to run the explicit construction, so it does not require the given k itself to contain infinitely many algebraic constants.

Direct prerequisites: `TropicalAndBerkovichArithmetic:TB.1`.

Proof plan:

1. Choose integers d_n prime to p with d_(n+1)-p d_n tending to infinity and p^(-n)d_n increasing to a finite limit. The associated partial sums define nested discs with positive limiting radius and a type-IV point over the completed algebraic closure.
2. Let x represent the resulting primitive extension of k((t)). The completed differential estimate kills d(t) relative to the constant field. After interchanging x and t, the extension over k((x)) is topologically algebraic by the primitive differential criterion.
3. Thus the completed algebraic closure of k((t)) embeds strictly into one of k((x)); identify the latter abstractly and topologically with the former to get the strict endomorphism. The analytic differential and type-IV inputs are the exact R-KT supplier request.

Source: KT16, Theorem 1.2, p. 1, and its proof, pp. 4–5; Lemma 2.4 and Remark 3.3, pp. 3–4.

Check: The differential vanishing is used after changing the ground field to k((x)); it is not a claim that a type-IV primitive extension has zero relative differentials.

### Untilts not topologically isomorphic to Cp

Target `HF11/exotic-untilt-residue-field` (theorem). Atlas planet: **Exotic untilt residue field**.

There is an algebraically closed perfectoid field K over Q_p with K^flat≅C_p^flat and K not isomorphic to C_p as a topological field. Consequently the Q_p-curve for C_p^flat has a degree-one closed point with residue field K; this point can be chosen away from the standard infinity point and hence appears as a maximal quotient of Be. No nonisomorphism of the underlying abstract fields is asserted.

Direct prerequisites: `HF11/strict-power-series-endomorphism`, `RelativeFarguesFontaine:RF2:untilts/primitive-untilt-correspondence`, `PerfectoidSpaces:P3/untilt-of-algebraically-closed-field`, `HF7/general-schematic-curve`.

Proof plan:

1. Apply the strict-endomorphism construction to C_p^flat. Transport the target through the perfectoid untilting equivalence relative to its source C_p to obtain a strict extension C_p->K.
2. The algebraic closure of Q_p is dense in C_p, while its integral/algebraic closure inside K is not dense. This property is preserved by a topological field isomorphism because Q_p is the closure of the prime field.
3. Use the parent primitive-untilt dictionary and the orbit-point curve comparison. A topologically nonisomorphic untilt cannot be in the standard point’s Frobenius orbit.

Source: KT16, Theorem 1.3, p. 2, and proof, p. 5; FF17 Préface note 11, pp. 4–5, and Remark 4.4(i), p. 40.

Check: The difference is topological. Abstract algebraically closed fields of this characteristic and transcendence degree are not distinguished by this theorem.

### Closed prime ideals of the integral period ring

Target `HF11/closed-primes-of-integral-period-ring` (theorem). Atlas planet: **Closed primes of the integral period ring**.

Assume F algebraically closed and E of mixed characteristic. For the weak topology on A=W_OE(O_F), the closed prime ideals are (0), the unique maximal ideal (pi)+W_OE(m_F), (pi), W_OE(m_F), and the primitive degree-one ideals (pi-[a]) for nonzero a in m_F modulo equality of ideals. Their residue fields are respectively Frac(A), k_F, F, W_OE(k_F)[1/pi], and the marked algebraically closed untilt K_a. Here residue field means Frac(A/p), not the quotient A/p in every case.

Direct prerequisites: `HF3/linear-zero-extraction`, `HF2/classical-point-comparison`, `HF1/boundary-valuation-quotient`.

Proof plan:

1. A prime containing pi corresponds to a prime of the rank-one valuation ring O_F, giving (pi) or the maximal ideal.
2. For a prime avoiding pi and the Teichmuller boundary, a nonzero Newton slope supplies a degree-one primitive factor; its untilt quotient is a valuation ring, so the remaining possibilities are its zero and maximal primes.
3. For the boundary case compare coefficient reductions A->W_OE(k_F) and use the flat-polygon criterion and closedness to exclude additional weakly closed primes. A has a unique maximal ideal; exotic nonclosed primes from localization are not extra maximal ideals of A itself.

Source: FF17, Préface Corollary 3.3 and note 26, pp. 32–33; §§2.2 and 2.4, pp. 103–113 and 124–127.

Check: W_OE(m_F) is the kernel of the coefficient-residue map and is not generally the principal ideal generated by one Teichmuller element.

### Automorphism orbits under valued homogeneity

Target `HF11/maximal-completeness-and-orbits` (theorem). Atlas planet: **Automorphism orbit description**.

Let F be an algebraically closed perfect complete rank-one field and let Aut_top,Fq(F) act on it, allowing positive rescaling of the real valuation. Assume the valued homogeneity property that this group is transitive on m_F minus {0}. Then its action on the degree-one primitive point space is transitive, and for a chosen untilt K the closed orbit-point set of X is Aut_top,Fq(F)/(Aut_top,E(K) times phi^Z), with the stabilizer product interpreted through the marked tilting action. Maximal completeness alone is not substituted for this homogeneity property for arbitrary value groups.

Direct prerequisites: `HF2/lubin-tate-parametrization`, `HF7/general-schematic-curve`, `LocallyAnalyticDistributions:L0/spherically-complete-fields`.

Proof plan:

1. Use the equivariant Lubin–Tate parametrization of nonzero m_F modulo O_E^times to pass transitivity to primitive points.
2. Identify the stabilizer of a marked untilt point by the tilting equivalence; the stabilizer of its Frobenius orbit includes the commuting phi^Z rescalings.
3. Apply the ordinary orbit-stabilizer bijection. To remove the extra homogeneity hypothesis in the intended maximally complete Cp-type setting, a valued-field extension theorem with the fixed residue and value group is required; that is G-HOMOGENEITY.

Source: FF17, Préface §1.4, p. 9, qualified by an explicit homogeneity hypothesis.

Check: Zero is excluded from the transitive set. Norm-preserving automorphisms cannot move elements of different norm; topological automorphisms allow only value-group-preserving rescalings.

### Higher eigenvectors and the boundary of representability

Target `HF11/higher-eigenvector-expansion-warning` (application).

For E=Q_p the eigensheaf B^{phi=p^2} must not be modeled by an asserted unique two-sided Teichmuller parametrization in two F-coordinates. Its Banach–Colmez diamond description is imported from VB3, while the stronger assertion that it is not represented by an analytic/perfectoid space needs a separate obstruction. The sufficient representability range 0<lambda<=1 does not by itself prove failure at lambda=2.

Direct prerequisites: `HF1/witt-bivectors`, `HF6/fundamental-exact-sequence`, `VectorBundlesAndIsocrystals:VB3:general-BC`.

Proof plan:

1. Compare the imported Banach–Colmez construction and the degree-two fundamental exact sequence.
2. Separate the unique boundary-zero Witt expansion from the much larger completed period ring, and compare the stricter growth defining bivectors.
3. Record the missing degree-two nonrepresentability proof as R-BC rather than deriving a converse from a one-sided sufficient criterion.

Source: FF17, Préface Remark 2.32(iii) and note 22, p. 25.

Check: This is a discriminating model constraint. The original qualitative nonrepresentability claim remains a supplier obligation, not a fabricated theorem.

## Worked checks across the layers

These calculations link the definitions to the final curve and expose mistakes that merely checking types would miss.

1. **Norms, scalar homogeneity and slope signs.** For f=([a]pi^n), its raw rho-norm is |a|rho^n. If rho=q^-r, then v_r(f)=v_F(a)+nr and n_rho(pi)=q^-1. For f=(pi-[a])(pi-[b]) with v_F(a)=2 and v_F(b)=5, v_r(f)=min(r,2)+min(r,5): its derivatives are 2, 1 and 0 on the three open ranges, so its two zero multiplicities are 1 at slopes 2 and 5. Replacing the polygon product by pointwise addition of abscissae or replacing the transform by an opposite sign fails this computation.
2. **Coordinate comparison.** In the monomial model |t|=q^-1. The ordinary annulus coordinate X has norm checkrho=q^(-1/r), whereas the period coordinate T=[t] has raw norm q^-1 at rho=q^-r. Thus ||X||_(checkrho)^r=q^-1=|T|_rho, and ||pi||^r=q^-r=|pi|_rho. A literal isometry without the r-th power fails on both generators. The Q_p cyclotomic model requires the strict transformed threshold. The general ramified carry calculation is G-COORDINATE.
3. **Metric normalization.** In equal characteristic the degree-one ideal y_a=(pi-a) has evaluation pi↦a. Therefore delta(y_a,y_b)=v_F(a-b), and the ordinary distance is |a-b|. Frobenius sends a to a^q and scales delta by q; it does not preserve the F-normalized untilt valuation. On the Lubin–Tate vector space the norm is 1/v_F(epsilon), so the pi action epsilon↦epsilon^q has norm factor q^-1. Using |epsilon|_F instead would fail scalar homogeneity.
4. **Weights and principal divisors.** A degree-d point becomes d geometric points after completed algebraic closure, each with the same local zero order. A local order m therefore contributes dm to the Newton multiplicity. On the finite orbit divisor carrier a weight-3 point plus a weight-2 point has weighted degree 5, exactly as the pinned `weightedDegree` calculation. Degree is not the number of orbit representatives and is not [K_y:E].
5. **Forward products and the interpolation shift.** For b∈M_d, shifting the convergent product gives phi(Pi_plus(b))=pi^d Pi_plus(b)/b. The negative-half divisor uses only n<0. To impose phi^n(x)∈m_y for all n≥0, the divisor of x must contain all backward translates including y itself. Applying phi to the negative-half product supplies that missing zero. Distinct neighboring orbit representatives require the pointwise supremum of tails, not their sum; repeated identical representatives retain their multiplicity.
6. **Geometric and general chart distinction.** In the geometric chart, a Bezout gcd of a minimum-degree nonzero ideal member a and any other b divides a. Additivity of nu and nu=0 exactly on units forces that gcd to be associated with a, so a divides b. This proves principality. In general F the descended generator can transform by a nontrivial continuous E-character; its character class measures the ideal class instead of disappearing in the minimum-degree argument.
7. **Corrected nonlinear factorization.** Expanding (1+U)Z(1+V)Z^-1 yields 1+U+ZVZ^-1+UZVZ^-1. The tangent is therefore U+ZVZ^-1. For Z=diag(T,T^-1) in an annular matrix algebra, the lower-left component of conjugation shifts an exponent by -2, so an unconjugated additive splitting cannot simply be reused. A bounded section of the actual tangent controls the quadratic term near 1. It gives a neighborhood for that Z, not a uniform neighborhood for every approximant chosen in a gluing proof.
8. **Bounded fibre dimension and torsion length.** Locally finite torsion supported at escaping points can have summands B_dR,y^+/Fil^(n_y) with n_y unbounded. Each such cyclic summand has fibre dimension 1. The finite-presentation criterion tests uniform fibre dimension; bounding all n_y would impose an extra, incorrect condition. Conversely the unrestricted coadmissible category permits unbounded fibre dimensions and cannot be replaced wholesale by finitely generated global modules.
9. **Scheme quotients and positive lines.** A nontrivial stabilizer of a closed point may act faithfully on its residue field; then it fixes no geometric point above that point, so inertia is trivial. This is the finite-group quotient condition used for etaleness. For a Frobenius line with Phi(e)=lambda^-1 e and v_pi(lambda)>0, its degree is positive and fixed sections are B^{phi=lambda}; the sign agrees with the positive section algebra. The Koszul map after (-s,t) is (a,b)↦ta+sb, whose composite is zero, with both character twists retained.

## Open inputs and follow-up obligations

A stage is planned when every target has a proof path ending in existing nodes, an exact supplier interface or one of these recorded gaps. It becomes closed only after the named inputs are resolved; independent review accepts the corrected plan without claiming those proofs exist. The packet propagates open input ids along its local dependency graph. The following obligations are part of the plan; a compilation of the suggested file does not settle any of them.

### G-MATRIX — A quantitative proof of interval matrix gluing

The corrected local factorization theorem has a neighborhood depending on the chosen matrix Z. The source then chooses Z to approximate U without bounding that dependence. Prove a uniform bound or a different bounded-ring approximation giving exact-square module surjectivity for every gluing datum. RF4 requires this surjectivity and maximum-spectrum coverage; ring Mayer–Vietoris alone supplies neither module effectivity nor the missing bound.

Consumed by: `HF9/interval-gluing`.

### G-GENERATORS — Uniform generation for interval bundles

Supply the analytic bounded-generator argument for compatible compact finite-free systems of bounded rank, producing one finite family of global sections generating every compact restriction. Generic Frechet–Stein coadmissibility does not imply finite generation. After this step, exactness on coherent Hom systems splits the finite-free presentation and proves projectivity, without claiming compact classical points exhaust the maximal spectrum. Prove the half-open freeness and closed-submodule conclusions with the same explicit compatible approximations.

Consumed by: `HF9/finite-projective-bundle-equivalence`, `HF9/closed-submodules-of-half-open-free`.

### G-BOUNDARY — Concrete boundary-one counterexample

Write out a finite F-extension for which the endpoint-one annular claim fails, and separately a continuous G_F-representation not factoring through G_(k_F) whose associated B-Frobenius module is outside the B-plus essential image of Remark 11.1.11. Check the relevant comparison rather than using failure of a contraction estimate as a counterexample.

Consumed by: `HF10/endpoint-one-failure`.

### G-HOMOGENEITY — Valued homogeneity in the maximally complete Cp-type case

Prove the automorphism extension theorem for a maximally complete algebraically closed field with the Cp-type residue field and value group, allowing positive valuation rescaling. The conditional orbit formula is established as a target; maximal completeness for an arbitrary value group is insufficient to infer the transitivity hypothesis. No available-source proof of this extension theorem has been read.

Consumed by: `HF11/maximal-completeness-and-orbits`.

### G-EQUALCHAR — Equal-characteristic transfer of the mixed-characteristic curve proofs

Verify the equal-characteristic Lubin–Tate supplier extension R-LT and the quantitative descent arguments R-TATE in that setting. For degree-one generation and multiplication of two twisted positive lines, use a separable Eisenstein quadratic extension in characteristic 2 and show the unit twist exists over the required constants. The mixed-characteristic source argument does not by itself prove this transfer.

Consumed by: `HF7/degree-one-generation`, `HF8/positive-line-proj`.

### G-COORDINATE — Ramified cyclotomic coordinate threshold

Derive the Newton polygon of [1+t]-1 for each mixed-characteristic coefficient field, with v_pi(p) and p-power carries, then give a sufficient strict transformed radius for the cyclotomic annulus comparison. The displayed Q_p formula is established as a target; the source q-only auxiliary polygon does not justify applying it literally to arbitrary E.

Consumed by: `HF1/cyclotomic-annulus-model`.

### G-RADIUS — Effective descent on arbitrary compact radii

Extend the value-group-endpoint compact descent theorem to every compact J subset [0,1), including an irrational singleton and an included irrational endpoint. Prove finite-extension completed base change B_(L,K) completed_tensor_(B_(F,K)) B_(F,J) = B_(L,J) for an enclosing value-group compact K, together with the trace and small-matrix estimates in the J-norm. Objects and cocycles over J are not assumed to extend to K. Alternatively supply an explicit approximation theorem giving exactly that extension with quantitative control. Density of the value group by itself does not produce a contained cofinal compact exhaustion.

Consumed by: `HF10/bundle-galois-descent`.

### R-TATE — PerfectoidSpaces:P3

Status: open.

For an arbitrary nondiscretely valued perfect complete rank-one F of characteristic p and C=completion(Fbar), supply quantitative almost-trace cochain contractions proving C^{G_F}=F and the continuous additive, principal-unit and small-ball cohomology used here. Transport these estimates through every marked perfectoid untilt; prove H^1=0 for finite-length B_dR-plus modules and effective finite-generated complete B_dR-plus descent. Supply convergent noncommutative small-matrix-cocycle correction on every compact B_I, I subset [0,1), uniform under the root-refined finite-extension approximation. State constants and continuity for each Banach norm. Include filtered principal-unit H^1 bounds strong enough to descend normalized primitive generators with the degree-independent square-root error. For arbitrary compact J subset [0,1), prove the trace and small-matrix bounds in its own norm; moving to an enclosing value-group interval must not assume the cocycle extends there.

P3 almost purity and the existing P9 finite-Galois theorem are inputs; P9 infinite-tower full faithfulness is weaker than this effectivity. Discretely valued Tate–Sen statements are not substituted for perfectoid fields.

Consumed by: `HF4/perfect-field-trace-cohomology`, `HF7/de-rham-jet-descent`, `HF10/effective-continuous-module-descent`, `HF4/uniform-normalized-generators`, `HF10/bundle-galois-descent`.

### R-CRYS — CrystallineCohomology:CR.1

Status: open.

For E=Q_p, a_rho={a in O_F:|a|<=rho} and b_rho=ker(W(O_F)->O_F/a_rho), identify the p-completed PD envelope of b_rho (compatible with the base divided powers on p) as the pro-final p-adic PD thickening computing H^0 of (O_F/a_rho)/Z_p. State the direction of the ring/affine-thickening universal property and the finite-level pro-object qualification; no terminal ordinary nilpotent thickening is asserted.

CR.0 supplies the PD envelope carrier; the crystalline site universal-property comparison belongs to CR.1.

Consumed by: `HF1/crystalline-radius-rings`.

### R-LT — LubinTateFormalModulesAndQuasiCanonicalLifts:LT.1

Status: open.

Extend the existing finite-Q_p Lubin–Tate module, inverse-division Tate module and convergent logarithm interfaces to a complete discretely valued coefficient field E with finite residue field, including equal characteristic. In equal characteristic use the corresponding additive E-action and prove the characteristic-p logarithmic period identity used by the positive-line function theory.

The existing LT.0–LT.2 nodes impose characteristic zero; equal-characteristic claims here cannot silently cite them.

Consumed by: `HF2/lubin-tate-points`, `HF2/lubin-tate-parametrization`, `HF6/lubin-tate-product-logarithm`.

### R-KT — TropicalAndBerkovichArithmetic:TB.1

Status: open.

Supply completed Kahler differentials with their canonical seminorm for analytic fields, the primitive-extension type-1/type-4 criterion of KT16 Lemma 2.4, and the positive-radius nested-disc construction and differential estimates in its Theorem 1.2. The vanishing after exchanging t and x must imply topological algebraicity over k((x)); it must not assert vanishing of relative differentials at a type-4 point over k((t)).

The analytic-field differential norm and type classification belong to the Berkovich direction, which does not yet provide this exact primitive-extension interface.

Consumed by: `HF11/strict-power-series-endomorphism`.

### R-BC — VectorBundlesAndIsocrystals:VB3:general-BC

Status: open.

Prove the explicit obstruction to representing the positive Banach–Colmez diamond B^{phi=p^2}, for F=C_p^flat, by an analytic or perfectoid space, as asserted in FF17 Préface Remark 2.32(iii), p. 25. Identify the obstruction and topology, rather than deriving nonrepresentability from the sufficient representability range 0<lambda<=1.

The existing negative-slope example and the one-sided positive representability criterion do not imply this degree-two assertion.

Consumed by: `HF11/higher-eigenvector-expansion-warning`.

### R-CONVEX — tauceti:TauCetiRoadmap/OptimalTransport#layer-5-convex-analysis-brenier-and-polar-factorization

Status: provided-by-roadmap.

Consume the already planned proper EReal-valued closed convex-function carrier, conjugation, Fenchel–Moreau and infimal-convolution identities specialized to the real dual pair. The annular sign convention is L(P)(r)=-P*(-r).

Current upstream OptimalTransport README, Layer 5(1)–(2), already owns this general theory; the compact Suggested file states only available-carrier milestones. This is an import interface, not a request for a second convex-analysis theory.

Consumed by: `HF0/legendre-newton-conventions`.

The supplier continuations remain with their existing directions. In particular, generic Fréchet–Stein theory stays with ND.2; quantitative almost-trace/descent extends PerfectoidSpaces, all-characteristic Lubin–Tate theory extends its formal-module roadmap, and completed analytic-field differentials extend the Berkovich direction. PerfectoidSpacesPartII already has a different scope, so this design does not reserve that identifier for Tate–Sen theory. No supplier file is changed by this job.

### R-ADIC — tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve

Status: provided.

Import the Q_p interval carrier B^I and its complete Tate topology from Layer 6.3, and the Frobenius quotient and annular-chart construction from Layers 6.1–6.4 for arbitrary perfect complete nonarchimedean F. Match raw period radius rho=q^(-r) to the window parameter kappa=alpha/r when |varpi|=p^(-alpha). Keep its power-bounded plus ring distinct from HF1 B_I^plus. Current Tau Ceti already supplies spaY, spaX, the open orbit projection and wandering windows; complete sheaf/chart claims are the upstream roadmap input.

Layer 6.3 explicitly defines the Q_p interval ring and radius dictionary; Layers 6.1–6.4 own the quotient. Their current statements and relevant Suggested signatures were read. Current library modules FarguesFontaine.Y and FarguesFontaine.Quotient provide the topological carriers; no existing topology or annular carrier is planned again.

Consumed by: `HF0/absolute-annulus-comparison`, `HF8/runge-and-adic-reconstruction`.

## Source versions and source issues

All statements and corrections are written in this roadmap's own words. FF17 means the public author copy of 16 April 2017, not a claim about the text of the published Astérisque 406 volume. Locators use the copy's printed page numbers. The publication was not collated. The 49 inherited source findings were independently reread at their locators and retain their extraction ids. E221 and E222 record this review's interval-cover and equal-characteristic etaleness findings. Every source finding has an independent confirmed verdict in the packet; E55 is classified as a proof gap rather than a false assertion. Their published correction status is not established. The separate packet interface note on Gauss normalization is a formal-interface clarification, not an allegation of a published error.

### FF17

Laurent Fargues and Jean-Marc Fontaine. [Courbes et fibrés vectoriels en théorie de Hodge p-adique](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf). Public author copy dated 16 April 2017, precursor to Astérisque 406 (2018); numbering not collated against the published volume. Accessed 2026-10-19.

Read for these targets: Préface pp. 3–5, 9, 25–26, 32–35, 37 and 40, for the routed auxiliary targets; §1.1, p. 52, and §1.3, pp. 56–58, for the standing characteristic conventions and Witt bivectors; §§1.4–1.10, pp. 61–95; §§2.1–2.7, pp. 98–132; §§3.1–3.6, pp. 133–149; §4.1, pp. 152–155; §5.1, pp. 202–203; §§6.1–6.7, pp. 243–259; §§7.1–7.9, pp. 261–276; Remark 11.1.11, p. 366; §§11.2.1–11.2.4, pp. 369–377.

Version fingerprint (SHA-256): `cc159f38a3801c736b71ecea363496abe7706550bfb416600718ee9933922ca3`.

### KT16

Kiran S. Kedlaya and Michael Temkin. [Endomorphisms of power series fields and residue fields of Fargues–Fontaine curves](https://math.huji.ac.il/~temkin/papers/Endomorphisms_of_Power_Series.pdf). Author PDF, version 6, 29 March 2016. Accessed 2026-10-19.

Read for these targets: Theorems 1.2 and 1.3, §2 and §3, pp. 1–5.

Version fingerprint (SHA-256): `d88a1ac1756cdc2be21af6ec03d5b49b89faf84b8d04e275b144c194c89da9c4`.

### Berger08

Laurent Berger. [Construction de (phi,Gamma)-modules: représentations p-adiques et B-paires](https://msp.org/ant/2008/2-1/ant-v2-n1-p04-p.pdf). Algebra & Number Theory 2 (2008), no. 1, pp. 91–120. Accessed 2026-10-19.

Read for these targets: Remark 1.1.3, p. 96.

Version fingerprint (SHA-256): `5716e770b65218295ada6f777789c9194336d2fdb2500b7ea451ac931738eda9`.

### ST02

Peter Schneider and Jeremy Teitelbaum. [Algebras of p-adic distributions and admissible representations](https://arxiv.org/abs/math/0206056). Public arXiv math/0206056 author version; use its printed page numbers. Accessed 2026-10-19.

Read for these targets: §3, definition, Theorems A/B and Corollaries 3.1–3.5, pp. 7–10; Lemma 3.6, pp. 10–11.

Version fingerprint (SHA-256): `e8a60a25f246692b048789235fb8efaf6d44ae65fdbb7cc738c8caeae67efcd5`.

The source issues below contain concise corrections and their mathematical reasons, organized as an audit of the targets rather than a section-by-section summary of the source. The packet retains the original extraction issue numbers for cross-checking. Each inherited entry records that both the extraction and the named author-copy location were checked.

| Finding | Locator | Correction used in the target | Reason/check |
| --- | --- | --- | --- |
| `E35` | Proposition 1.6.16, démonstration, p. 73, author copy courbe.pdf (16 avril 2017) | Use the same endpoint value and derivative in the bound, for example v_r1(x)+(r1-r2)\|partial_left v_r1(x)\|. | The compact bound must pair each supporting derivative with its own endpoint value; evaluating the supplied two-line polygon confirms the cross-endpoint failure. |
| `E42` | §1.7.1, p. 79, author copy courbe.pdf (16 avril 2017) | Take the weak (pi,T)-adic completion. | Reduction modulo pi must give the completed perfected power-series ring; the weak completion is required before forming the normed annular completion. |
| `E43` | Lemme 1.7.2, p. 81, and Proposition 1.7.3, p. 82, author copy courbe.pdf (16 avril 2017) | If rho=q^-r and s=q^(-1/r), then \|i(f)\|_rho=\|\|f\|\|_s^r. | Computing on pi and on the coordinate X forces the r-th power. The raw Gauss norms have different scalar restrictions. |
| `E44` | Proposition 1.7.3, démonstration, pp. 82–83, author copy courbe.pdf (16 avril 2017) | For E=Q_p the positive slopes are (p-1)/p^m; ramification index e divides those slopes by e and gives multiplicity e. State the weaker sufficient bound separately. | The successive cyclotomic levels give slopes (p-1)/p^m over Q_p; ramified pi normalization changes the slopes and horizontal lengths. This is not a formula for all E. |
| `E45` | §1.7.3, p. 83 (after Proposition 1.7.3), author copy courbe.pdf (16 avril 2017) | For E=Q_p and q=p, the short period-annulus range is rho<q^(-(q-1)/q), obtained by the stated reciprocal logarithmic radius conversion. Other coefficient fields require their actual Newton calculation, recorded in G-COORDINATE. | The reciprocal logarithmic conversion sends the ordinary radius threshold to the stated short period range only in the displayed Q_p model; scope is corrected here. |
| `E46` | §1.7.5, p. 84, author copy courbe.pdf (16 avril 2017) | Allow coefficients in W_OE(k)[1/pi], with the specified convergence conditions. | The Hahn construction is an E-algebra and contains pi inverse, so integral coefficient bounds cannot describe its entire carrier. |
| `E48` | Définition 1.10.1, p. 89, author copy courbe.pdf (16 avril 2017) | Inside B^b the condition is \|x\|_1<=1, equivalently all Teichmuller coefficients lie in O_F. | Inside B^b the coefficient-infimum bound selects A[1/pi]. Starting with the whole B^b is essential to recover the intended subring. |
| `E50` | §1.10.4, p. 95 (after Lemme 1.10.15), author copy courbe.pdf (16 avril 2017) | Use v_0(phi(x))=q v_0(x). | Taking q-th powers of every Teichmuller coefficient multiplies the infimum of their valuations by q. |
| `E54` | Proposition 2.2.6 (proof), p. 107, author copy courbe.pdf (16 avril 2017) | Subtract the first carry polynomial with the convention used there. | The p=3 first carry check modulo 9 fixes the sign independently of later formulas. |
| `E55` | Proposition 2.2.6 (proof), p. 107, author copy courbe.pdf (16 avril 2017) | Either lift the calculation modulo 8 or use the independent perfectoid untilt algebraic-closedness theorem, as HF2 does. | Confirmed as an explicit missing calculation in the p=2 proof, not as a false algebraic-closedness theorem. The independent perfectoid-untilt import bypasses this gap. |
| `E62` | §2.3.2, remark after Proposition 2.3.9, p. 118, author copy courbe.pdf (16 avril 2017) | The valuation scales by q^k under phi^k. | Evaluation on a Teichmuller constant gives the q^k rescaling directly; exact isometry without rescaling would fail. |
| `E63` | Proposition 2.3.16 (proof), p. 120, author copy courbe.pdf (16 avril 2017) | For f in A use min(v_y(f),delta(y,z))=min(v_z(f),delta(y,z)). Extend continuity to B^b by localization and the continuous normalization by v_y(pi); do not assert the truncated identity on all of B^b. | The ideal comparison yields equal truncated valuations on A. A nonzero constant refutes the printed lower bound; localization is needed for continuity on B^b. |
| `E64` | Proposition 2.3.19, p. 121, author copy courbe.pdf (16 avril 2017) | Supply the determinant norm calculation modulo pi and the separable untilt tensor decomposition. | The displayed norm conclusions require the mod-pi determinant and separable tensor computation. The source leaves that work, so the gap classification is retained. |
| `E67` | Lemme 3.1.1 (proof), p. 134, author copy courbe.pdf (16 avril 2017) | Their valuations tend to zero, so their absolute values tend to one. | A nonzero trace with iterated inverse Frobenius has valuation tending to zero and norm tending to one, precisely the direction required by the estimate. |
| `E68` | Proposition 3.1.6 (proof), p. 135, author copy courbe.pdf (16 avril 2017) | Divide \|sigma(a)-tau(a)\|_rho by \|a\|_rho. | Multiplicativity gives the relative-error denominator \|a\|_rho. Its omission is not harmless when a is a primitive element of norm below one. |
| `E69` | Théorème 3.3.1 (2), p. 141, author copy courbe.pdf (16 avril 2017) | Require a continuous embedding, isometric after a positive valuation rescaling. | A continuous valued embedding, with the stated possible rescaling, supplies the valuation-ring map. A bare field embedding does not. |
| `E70` | Théorème 3.4.4, p. 143, author copy courbe.pdf (16 avril 2017) | Replace a radius \|\|y\|\| by its valuation -log_q\|\|y\|\|. | Newton slopes are valuations, while the adjacent zero radius is q to the negative slope; the logarithm is forced by this convention. |
| `E71` | Lemme 3.4.5 (proof), p. 144, author copy courbe.pdf (16 avril 2017) | Each factor has radius s=\|\|y\|\|; use the degree-independent estimate max(sqrt(s),s/rho). | Each conjugate linear factor has radius s, while only their constant-term product has radius s^d. The corrected maximum estimate is independent of d; its filtered descent input remains R-TATE. |
| `E72` | Théorème 3.6.1 (proof), p. 148, author copy courbe.pdf (16 avril 2017) | Apply the no-zero assertion to the remaining quotient h=f/g. | Only the quotient after removing all chosen zeros is zero-free. Applying the extension criterion to the removed product would contradict its divisor. |
| `E73` | Proposition 4.1.1, proof, p. 152, author copy courbe.pdf (16 avril 2017) | For phi use vertical scaling by q. | The coefficient formula gives v_r(phi(x))=q v_(r/q)(x); the exponent h belongs only to an h-fold iterate. |
| `E74` | Lemme 4.1.4, proof, p. 153, author copy courbe.pdf (16 avril 2017) | Use [rho,rho^(1/q^h)]. | A q^h-th root of a number in (0,1) is larger. The corrected ordered interval is the compact fundamental domain used by the estimates. |
| `E124` | Lemme 6.2.3, p. 246, author copy courbe.pdf (16 avril 2017) | It is the free commutative effective-divisor monoid on \|Y\|/phi^Z. | The immediately preceding divisor definition is on Frobenius orbits. The orbit quotient is necessary for finite-support generators. |
| `E127` | Théorème 6.4.4, p. 254, author copy courbe.pdf (16 avril 2017) | Use phi(product_i Pi^minus(a_i)), with the orbit-separation condition recorded in E211. | The divisor of Pi_minus contains strictly negative iterates. One application of phi includes the original point, as required by the n=0 condition. |
| `E128` | no 6.1.3 (totally ramified change of E), p. 244, author copy courbe.pdf (16 avril 2017) | Take the line over W_OEprime(Fqbar)[1/pi_prime] and tensor the old degree piece with E-prime before its degree-dependent line twist. | The ramified coefficient ratio may lie outside the old coefficient field; the twisting line and the scalar extension must be formed over the new field. |
| `E130` | proof of Théorème 6.5.2(2), p. 256, author copy courbe.pdf (16 avril 2017) | Use the E-prime graded algebra and its [E-prime:E]-Veronese. | The Veronese comparison concerns the graded ring with the new uniformizer and coefficient field. The mismatched subscript otherwise denotes no such piece. |
| `E131` | proof of Proposition 7.3.1, p. 267, author copy courbe.pdf (16 avril 2017) | The next map is (a,b) -> ta+sb. | Composing the corrected Koszul maps gives -ts+st=0. The alternative order gives a generally nonzero expression. |
| `E132` | proof of Proposition 7.8.1, p. 273, author copy courbe.pdf (16 avril 2017) | Prove the Koszul multiplication statement with both characters before using the coefficient-extension argument. | Both positive-line characters must appear in the Koszul argument. Multiplication for their product character alone is too weak; the corrected target retains the two twists and G-EQUALCHAR. |
| `E133` | proof of Proposition 7.9.1, p. 276, author copy courbe.pdf (16 avril 2017) | Use pi times (L(epsilon b^(-1/p^n))/L(epsilon))^(p^n). | The leading Laurent term of the ratio is [b^(-1/p^n)]. The prefactor pi gives the desired limit pi/[b] and leaves the poles on the chosen section. |
| `E134` | §7.5 and proof of Proposition 7.5.1, p. 269, author copy courbe.pdf (16 avril 2017) | Split off E-prime_0: B is unchanged in the unramified step, Frobenius is iterated, and only then tensor over E-prime_0. | For an unramified extension, the same period ring is used with iterated Frobenius. A raw tensor over E splits it and cannot be the asserted domain. |
| `E135` | §7.8 (definition of ϕ-Mod_B), p. 271, author copy courbe.pdf (16 avril 2017) | Require its linearization to be an isomorphism. | An invertible linearization is necessary for the tensor category and its line classification. The zero Frobenius on a rank-one module is a direct counterexample to the weaker definition. |
| `E136` | §7.8 (description of Pic^0), p. 272, author copy courbe.pdf (16 avril 2017) | Restrict that construction to Pic^0. | Only geometric degree-zero lines have a one-dimensional fixed E-space. Negative twists have no sections and positive twists have the fundamental-sequence quotient. |
| `E178` | Proof of Lemme 11.2.6, p. 371, author copy courbe.pdf (16 avril 2017) | The norm of the negative-index part decreases when rho increases. | For negative Laurent exponents rho^n decreases as rho increases, giving the reversed endpoint monotonicity. |
| `E179` | Proof of Proposition 11.2.7, p. 371, author copy courbe.pdf (16 avril 2017) | Use the side extending to 1 for the first inclusion, then the boundary-0 Laurent expansion for the other side. | Restriction follows the reverse of interval inclusion. The endpoint-zero expansion and endpoint-one extension must be assigned to their respective sides. |
| `E180` | Lemme 11.2.10, statement and proof, p. 372, author copy courbe.pdf (16 avril 2017) | Require surjectivity of (U,V) -> U+ZVZ^-1. | The derivative at (1,Z) is U+ZVZ inverse. In the Laurent example with Z diagonal(T,T inverse), the lower-left image misses T inverse, so un-conjugated additive surjectivity is insufficient. |
| `E181` | Proof of Proposition 11.2.12, pp. 373–374, author copy courbe.pdf (16 avril 2017) | Bound that neighborhood uniformly in the chosen approximants or replace the approximation argument. | The contraction neighborhood depends on Z. Density before bounding that dependence is not a proof of factorization; G-MATRIX remains explicit. |
| `E182` | Proposition 11.2.12, statement, p. 373, author copy courbe.pdf (16 avril 2017) | Both sides of the comparison isomorphism are restricted to the intersection. | The transition isomorphism is over the overlap, so both vector bundles must be restricted there before comparing them. |
| `E193` | Lemme 1.6.8, p. 71, author copy courbe.pdf (16 avril 2017); page image checked | The E-prime norm restricts to the [E-prime:E]-th power of the E norm at radius zero. | On pi_E the new radius-zero norm is q^(-ef), equal to the [E-prime:E]-th power of the old norm. This independently checks the endpoint rescaling. |
| `E196` | §1.7.2, p. 81, author copy courbe.pdf (16 avril 2017); page image checked | Invert pi as well as the variable. | The dense algebra of an E-annulus must contain pi inverse as well as X inverse. Nonnegative pi powers cannot approximate pi inverse in the stated topology. |
| `E198` | Théorème 2.5.1 (2), p. 128, and Théorème 3.5.1 (2), p. 145, author copy courbe.pdf (16 avril 2017); page image checked | Keep B_I; remove radius zero only from the classical-point indexing set. | The compact theorem concerns Spm(B_I). Replacing the ring by a punctured noncompact ring introduces nonclosed maximal ideals and changes the assertion. |
| `E199` | Proposition 3.1.7, p. 136 (and proof of Théorème 3.1.8, p. 136), author copy courbe.pdf (16 avril 2017); page image checked | Index by G_F/G_L, equivalently the F-embeddings of L. | A separable nonnormal extension is indexed by its embeddings, or G_F/G_L, rather than by its possibly smaller automorphism group. |
| `E200` | Exemple 2.3.7, p. 117, author copy courbe.pdf (16 avril 2017); page image checked | Use sum_(i=0)^(p-1)[alpha^(i/p)]. | The geometric-series factorization of X^p-1 has p summands after dividing by X-1; the upper index is p-1. |
| `E203` | Corollaire 2.1.4, p. 100, author copy courbe.pdf (16 avril 2017); page image checked | Take Frob_q on A/pi A. | The coefficient Frobenius congruence is modulo pi. For ramified E, substituting p changes the quotient and is incorrect. |
| `E211` | Théorème 6.4.4 and its proof, p. 254, author copy courbe.pdf (16 avril 2017); page image checked | Require y_i in phi^Z y_j implies y_i=y_j; without it use the pointwise supremum of backward translates. | Adjacent orbit representatives impose a pointwise maximum on overlapping backward tails. Their sum overcounts orders; the separation condition prevents this. |
| `E212` | proof of Proposition 7.2.1, p. 265, author copy courbe.pdf (16 avril 2017); page image checked | Use the already defined P_(F,pi,k). | The numerator is in the previously defined degree-k homogeneous piece. The alternate positive-line notation is not yet available at this proof step. |
| `E28` | Proposition 1.4.9, proof, p. 64, author copy dated 16 April 2017 | Use pi exponent n_0+m_0 in both occurrences. | Multiplication of the two initial monomials adds their exponents; the coefficient being isolated is indexed by n_0+m_0. |
| `E38` | Proposition 1.6.25, proof, p. 77, author copy dated 16 April 2017 | Use v_r(tail)>=lambda-r>=lambda-r_1>0 in that step. | The supporting bound for negative exponents and the coefficient valuation bound imply an inequality; they do not identify a minimizing tail coefficient. |
| `E39` | Proposition 1.6.25, proof, p. 77, author copy dated 16 April 2017 | The expression at coefficient index N+1 is Newt(x)(N+1)+(N+1)r. | The Legendre convention in this chapter is inf(P(t)+rt); the monomial pi^(N+1) detects the sign. |
| `E58` | Proposition 2.2.16, proof, p. 111, author copy dated 16 April 2017 | Both displayed valuations v_F(epsilon) in that passage are 0. | The element epsilon lies in 1+m_F, hence has absolute value 1. Its difference from 1 can have positive valuation. |
| `E195` | Proposition 1.6.25, final norm comparison, p. 78, author copy dated 16 April 2017 | The last radius quantifier in this compact approximation step ranges over J. | The positive- and negative-tail estimates immediately preceding it are uniform on the chosen compact J; they do not provide an estimate on all of I. |
| `E221` | Remark 11.2.8, p. 371, author copy dated 16 April 2017; page image checked | Require a finite compact refinement subordinate to the cover on each compact test interval, as specified in HF9/interval-site. | The stated weaker condition admits [a,c),[c,b] covering [a,b]. The overlap is empty, so sheaf descent would identify the domain B_[a,b] with a product of two nonzero rings. The compact-refinement condition excludes this cover and is stable under pullback and composition. |
| `E222` | Section 1.7.2, p. 82, under the standing hypotheses of section 1.1, p. 52; author copy dated 16 April 2017 | Keep finite etaleness in characteristic zero; in equal characteristic p the q-power maps are finite radicial. HF1/perfected-annulus-model already makes this distinction. | The standing hypotheses in section 1.1 permit E=F_q((pi)). Then d(X^q)/dX=0, and the induced degree-q extension on the punctured-disc function field is purely inseparable. Thus the finite map is radicial in equal characteristic; etaleness holds only in characteristic zero. |

## Coverage, Lean outline and acceptance

The routing ledger in the packet accounts for all 348 input item ids. It identifies a target or existing import, a proof-step grouping, or a reason that the selected proof does not need an intermediate result. It contains no source passages. The complex three-circles analogy and the source's solvable-Galois reduction are not prerequisites of the chosen direct coefficient and perfectoid-untilt proofs. The original input ids make these omissions reviewable.

The suggested Lean file is a compact available-carrier outline, not a second development of period rings. Its two new statements are the generic multiplicative-degree/Bezout criterion used in HF7 and the corrected local Banach factorization theorem used in HF9. Its eight examples compare finite divisor degrees, p-typical theta, the existing de Rham-plus ring and the bounded nonlinear section. All future-carrier targets, including every definition's API and tests, are specified above. There are no data definitions supplied by unproved existence placeholders. The file elaborated at the pins through `lean-check` with exactly ten intended proof-placeholder warnings and no errors or other warnings.

Acceptance for this planning pass requires: the full HF0–HF11 target inventory and build order; exact existing-owner interfaces; all definition APIs and tests; all routing ids accounted for; acyclic local prerequisites; per-layer planets; source-version corrections used consistently; no hidden inference from a geometric special case to arbitrary F; and honest separation of the seven mathematical gaps from the five open supplier extensions. The blueprint checker validates the graph and inventories. The independent review REV-DESIGN-RelativeFarguesFontainePartII accepts this corrected planning pass. No layer is closed: the seven mathematical gaps and five open supplier extensions remain proof obligations, propagated through the actual prerequisite graph.
