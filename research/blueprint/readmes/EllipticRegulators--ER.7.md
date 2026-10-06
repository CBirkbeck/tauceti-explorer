# Elliptic regulators: general modular elliptic curves

This document continues the accepted EllipticRegulators blueprint at **ER.7**. Its target is an integral rational K₂ class on every modular elliptic curve with nonzero real regulator, and the rational line determined by the leading L-value. It gives the three assertions of Schappacher–Scholl’s modular-curve theorem separately, then passes to an elliptic quotient. The existing character-unit formulas of Brunault remain imported declarations. They retain their exact level and character hypotheses; they do not become a proof that a suitable primitive character exists at every original level.

The declaration graph is target level. Smaller arguments live inside proof outlines rather than becoming individual atlas nodes. There are sixteen fresh declarations, four reusable algebraic interfaces, and six named proof-closure gaps. ER.7 is **planned**, with a complete planning pass and explicit supplier contracts. It is not closed and none of its declarations is asserted to be formalised. The original packet is unchanged. Its ER.7 declarations are referred to by their complete IDs; the new IDs below never replace them.

## Conventions and the baseline

Write G=GL₂, K for an open compact subgroup of G(A_f), Y_K for the open modular curve over Q and X_K for its smooth projective compactification. These schemes need not be geometrically connected. Cusp divisors have degree zero on each geometric component. Algebraic compactification, the scheme/analytic comparison, cusp parameters and regular differentials come from ModularCurvesPartII, building on the upstream Modular curves work. They are not rebuilt by defining a newform. A full level at least three removes the moduli stabilizer difficulties; quotient levels are handled by finite maps and the actual componentwise degrees.

The symbols in this part live in rational Adams weight two, H²_M(X,Q(2))=K₂^(2)(X)⊗Q. In the sources this is written as absolute cohomology H²_A. Its open-curve localization map and its identification with a subgroup of function-field K₂ require the E.3 kernel comparison. The integral part is the image of K₂^(2) of a regular proper model over Z in the generic curve’s rational K₂; it is model independent. Integral is a condition on the class’s arithmetic-surface boundary. It does not mean that every modular unit has no vertical divisor at every bad prime.

The real regulator target is H²_D(X/R,R(2)), identified with the real Betti H¹_B(X/R,R(1)) convention used by Schappacher–Scholl. Its dimension is the sum g of the genera of the components. The Tate twist and real involution must be retained when converting to the dual of holomorphic differentials. The conjugation on dlog(v) is essential: without it both differentials have type (1,0), so their wedge is identically zero. The source page image was checked because its text layer loses the overline. The projected open symbol pairing is (1/(2πi)) times the integral of log|u| conjugate(dlog(v)) ∧ ω. Brunault’s pairing uses η(u,v)=log|u| darg(v)−log|v| darg(u). The inherited ER.2 normalization comparison fixes their relation. Proper covariance is proved for the canonical regulator first, then transported through this comparison; the two formulas are never silently equated.

Automorphic L-functions are in arithmetic weight-two normalization, with functional equation s↦2−s. A finite coefficient field F is chosen for each Hecke summand and all its complex embeddings are retained. The Qbar in Schappacher–Scholl’s formulas is an algebraic closure, not Q; the text extraction of the PDF can lose its bar. Periods such as c⁺(π) are classes modulo F×. A statement about a period line is independent of choosing its representative. The projector on cohomology paired against V_π is e_{π̌}, with π̌ contragredient. Oldvector multiplicities are dimensions of V_π^K and are not suppressed.

The pinned libraries are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed ER.7 library audit says its targets are unbuilt. Actual source statements at those pins supply twelve references in this packet. Mathlib already provides span, map and comap of submodules, span of a linear image, and membership in a directed supremum. It also provides the q-parameter exp(2πiz/w), its norm, Dedekind eta, primitive Dirichlet characters, their meromorphic L-function, and a one-dimensional Poisson summation theorem. None supplies the modular K₂ classes or the Kronecker limit formulas themselves.

Tau Ceti’s `HeckeRing.GL2.Newform` extends an away-from-level eigenform. Its normalization and newness do not imply a missing bad-prime local-factor theorem. Its `UpperHalfPlane.peterssonInner` integrates conj(f)g y^k against invariant hyperbolic volume over the chosen domain. Merel’s Petersson pairing is first-linear and is divided by the congruence index. At weight two, after the same measure/domain conversion, Merel’s ⟨f₁,f₂⟩ is Tau Ceti’s peterssonInner(2,D,f₂,f₁) divided by [SL₂(Z):Γ]. This order and index distinction matters to the inherited factor-four discrepancy.

## Ownership and the two finite-level subspaces

KatoEulerSystems **L0** is the sole owner of Siegel units, their q-products, cusp divisors, good-base integrality and descent to algebraic modular curves. Its concrete nodes for c-independent rationalization, Galois action and distribution are imported. The generic pair-symbol construction belongs to an early **L1** interface. The existing `L1/beilinson-element-in-K2-of-Y-M-N` is a useful concrete declaration, but gives a distinguished pair, not every rational span and compact correction needed here. The extension request stays before the parametrization and Iwasawa machinery. The missing early interface is a named gap; it does not activate a whole L1 dependency.

This handles confirmed finding RT-AREA-ktheory-2/6. ER.7 does not introduce a second Siegel unit or a second generic Milnor symbol. Its retained work is the cusp relation, character-specific compactness, the regulator integral and its Rankin–Selberg evaluation, vertical integrality of compact combinations, and the elliptic image. The packet proposes the L0→ER.7 supplier edge and records the early-prefix requirement for L1.

For a fixed K, take the Q-span of all open modular-unit pair symbols, then intersect with compact classes via restriction. This is Q_K. Imposing compactness on each symbol before taking the span is wrong: residues of summands can cancel. Then close Q_K under transfers from finer levels, obtaining P_K. The images are directed because common refinement, transfer composition and norm–restriction multiplication by a degree allow a rational rescaling. Every element of P_K has one finite-level witness, even though its definition ranges over all smaller compact subgroups.

The distinction is essential. On X₀(p), there are only two cusps. Units modulo constants form a rank-one group; rational antisymmetry and the zero projected regulator of constant symbols give r_D(Q_K)=0. For X₀(11), genus is one, so Q_K cannot supply the required real line. P_K does. The general theorem is not a theorem about Q_K at an arbitrary initial level. Brunault’s prime-level spanning result for X₁(p) is a separate imported result, and it does not contradict the X₀(p) example.

## New declarations and their interfaces

Names for the four algebraic prototypes use the namespace `EllipticRegulators.Modular`. In the geometric instantiation, the modules, transfer maps, actual unit-symbol set and DVR valuation data must be supplied by their owners. The suggested file does not invent those missing carriers. Each object below has its complete API and four tests. The tests distinguish a wrong operation even before the geometric instantiation exists.

### The fixed-level modular-unit subspace

**ID:** `EllipticRegulators:ER.7/fixed-level-beilinson-subspace`. **Kind:** definition.

Let Y_K be the modular curve over Q for an open compact K⊂GL2(A_f), X_K its smooth projective compactification, and j the injective rational weight-two restriction H²_M(X_K,Q(2))→H²_M(Y_K,Q(2)). Define Q_K=j⁻¹(span_Q{{u,v}:u,v∈O(Y_K)×⊗Q}). The span is taken before the compactness condition; the condition is vanishing of the total horizontal tame boundary, not of each generator separately.

Hypotheses: Work componentwise if X_K is not geometrically connected. Symbols and restriction use the common rational weight-two K-theory convention.

Construction or proof:

1. Import algebraic modular units from Kato L0 and the early bilinear K2 symbol interface from L1; do not construct either here.
2. Use rational localization and the curve restriction kernel comparison from EllipticKTheory E.3 to identify the compact group with its image.
3. Take a Mathlib span and its comap; a linear combination of symbols can have cancelling cusp residues even when its summands do not.

Direct prerequisites: `KatoEulerSystems:L0/siegel-units-and-c-independent-rationalisation`, `KatoEulerSystems:L1/beilinson-element-in-K2-of-Y-M-N`, `EllipticKTheory:E.3/localisation-sequence-for-a-curve`, `EllipticKTheory:E.3/what-the-sequence-does-not-identify`, `mathlib:Submodule.comap`, `mathlib:Submodule.span_image`.

API, derived from use:

- `EllipticRegulators.Modular.fixedLevelBeilinson_mem` (characterisation): For Q-vector spaces A,B, j:A→B linear and S⊂B, x∈fixedLevelBeilinson(j,S) iff j(x)∈span_Q(S).
- `EllipticRegulators.Modular.fixedLevelBeilinson_id` (compatibility): For j=id, fixedLevelBeilinson(id,S)=Submodule.span Q S.
- `EllipticRegulators.Modular.fixedLevelBeilinson_mono` (functoriality): If S⊂T then fixedLevelBeilinson(j,S)≤fixedLevelBeilinson(j,T).
- `EllipticRegulators.Modular.fixedLevelBeilinson_empty` (simp): For injective j, fixedLevelBeilinson(j,∅)=0. Without injectivity it equals ker(j).
- `EllipticRegulators.Modular.fixedLevelBeilinson_pullback` (compatibility): For linear a:A→A′, b:B→B′ with j′a=bj and b(S)⊂span(S′), a carries fixedLevelBeilinson(j,S) into fixedLevelBeilinson(j′,S′).
- `EllipticRegulators.Modular.fixedLevelBeilinson_linearCombination` (constructor): Every finite Q-linear combination of vectors x_i with j(x_i) in span(S) belongs to fixedLevelBeilinson(j,S).

Unit tests:

- `EllipticRegulators.Modular.fixedLevelBeilinson_test_identity` (compatibility): On Q, j=id and S={1} give the whole one-dimensional Q-space.
- `EllipticRegulators.Modular.fixedLevelBeilinson_test_empty` (degenerate): For the injection Q→Q², x↦(x,0), an empty symbol set gives zero.
- `EllipticRegulators.Modular.fixedLevelBeilinson_test_cancellation` (computation): For that injection and S={(1,1),(0,1)}, 1 belongs to Q_K because (1,0)=(1,1)−(0,1), although neither chosen symbol is itself in the compact image.
- `EllipticRegulators.Modular.fixedLevelBeilinson_test_vertical` (non-example): For that injection and S={(0,1)}, 1 does not belong. This detects taking the whole compact group without the span condition.

Uses: SS 1.1.1 and 7.3.0: Forms the horizontally unramified subspace whose bad-fibre residues are studied. SS 1.1.3: Separates a fixed level from its transfer closure.

Acceptance: For X0(p), two cusps give one modular unit modulo constants; its same-level regulator image is zero, even for genus one. Residue cancellation is permitted in the span.

Source: SS.1988, 1.1.1.

### The transfer Beilinson subspace

**ID:** `EllipticRegulators:ER.7/beilinson-subspace`. **Kind:** definition.

Define P_K as the filtered union of θ_{K′/K,*}Q_{K′} over open compact subgroups K′⊂K. Equivalently it is the supremum of these image Q-submodules. Every element has a single finite-level witness after common refinement. Q_K⊂P_K; equality is not asserted.

Hypotheses: Finite level maps are proper, generically finite morphisms of equal-dimensional compact curves. Transfers and pullbacks are rational and satisfy θ_*θ^*=[K:K′] componentwise with the actual degree when stabilizers intervene.

Construction or proof:

1. Pull back finitely many modular-unit combinations to a common subgroup contained in all their levels.
2. Use transfer composition and norm–restriction equal to degree; divide by the nonzero rational degree to dominate each image by the common refinement image.
3. Apply Submodule.mem_iSup_of_directed; do not identify an arbitrary supremum with a set union.

Direct prerequisites: `EllipticRegulators:ER.7/fixed-level-beilinson-subspace`, `EllipticKTheory:E.5/pullback-and-pushforward`, `EllipticKTheory:E.3/naturality-for-finite-transfer`, `mathlib:Submodule.map`, `mathlib:Submodule.mem_iSup_of_directed`.

API, derived from use:

- `EllipticRegulators.Modular.beilinsonSubspace_transfer` (constructor): For a family of Q-submodules Q_i and linear transfers t_i to A, t_i(x)∈P when x∈Q_i.
- `EllipticRegulators.Modular.beilinsonSubspace_finiteWitness` (characterisation): If the image submodules are directed and the index type is nonempty, x∈P iff there exist i and y∈Q_i with t_i(y)=x.
- `EllipticRegulators.Modular.beilinsonSubspace_single` (compatibility): For one index, P=Q_i.map(t_i). This is precisely Mathlib Submodule.map.
- `EllipticRegulators.Modular.beilinsonSubspace_zero` (simp): If every Q_i=0 then P=0.
- `EllipticRegulators.Modular.beilinsonSubspace_mono` (functoriality): Increasing each Q_i while keeping the transfers fixed increases P.
- `EllipticRegulators.Modular.beilinsonSubspace_map` (functoriality): For a linear f:A→B, f(P) is the supremum of the images under f∘t_i.
- `EllipticRegulators.Modular.beilinsonSubspace_degree` (relation): Multiplying a transfer by a nonzero rational d leaves its image of a Q-submodule unchanged; this is why norm–restriction degrees do not change P.

Unit tests:

- `EllipticRegulators.Modular.beilinsonSubspace_test_single` (compatibility): A singleton level with identity transfer gives its prescribed submodule.
- `EllipticRegulators.Modular.beilinsonSubspace_test_zero` (degenerate): Every zero input submodule gives zero output, even when transfers are nonzero.
- `EllipticRegulators.Modular.beilinsonSubspace_test_newLevel` (non-example): On Q², take levels n∈N with Q_0=span{(1,0)}, Q_n=Q² for n>0, and identity transfers. The family is directed and P=Q²≠Q_0.
- `EllipticRegulators.Modular.beilinsonSubspace_test_degree` (computation): On Q, the transfer x↦2x from Q has full image. An integral span would incorrectly retain a degree-two index.

Uses: SS 1.2.9: Transfer at finer levels permits irreducibility to propagate nonvanishing to all vectors at the target level. SS 7.3.2: Transfers preserve the integral part. General elliptic application: Pushes P_K to the elliptic quotient, without a same-level twist assertion.

Acceptance: Check the statement with all its level, coefficient and covariance hypotheses; compare the cited passage.

Source: SS.1988, 1.1.1–1.1.3.

### The Hecke separation in Manin–Drinfeld

**ID:** `EllipticRegulators:ER.7/cuspidal-hecke-separation`. **Kind:** theorem.

For a full modular level n≥3 and a good prime p∤n with p≥7, the eigenvalues of T_p on the rational degree-zero cuspidal divisor module have the form pχ₁(p)+χ₂(p), of modulus at least p−1. On the Jacobian differential module they have modulus at most 2√p. Their spectra are disjoint; consequently the subgroup of the Jacobian generated by cusp differences is finite. For general K use a finite full-level cover and norm.

Hypotheses: Use the same geometric Hecke correspondence on divisors, Pic⁰ and regular differentials. The characters χ_i have finite order, and degrees are zero separately on each geometric connected component.

Construction or proof:

1. SS 3.4.0 decomposes the finite cusp permutation module into Eisenstein characters.
2. The characteristic polynomial of T_p on the Jacobian has rational coefficients and an integral multiple annihilates Pic⁰ by its endomorphism relation.
3. The good-prime Weil bound separates this polynomial from the cuspidal spectrum since p−1>2√p for p≥7.
4. Thus the cusp subgroup tensored with Q is zero; it is finitely generated, hence torsion finite. Transfer to quotients.

Direct prerequisites: `ModularCurvesPartII:R12.5`, `ModularCurvesPartII:R14.6`.

Acceptance: p=7 satisfies 6>2√7; the argument is not licensed at p=2. Matches the imported EllipticRegulators:ER.7/manin-drinfeld; it is a proof ingredient rather than a second statement of that declaration.

Source: SS.1988, 3.4.0.

### Compact correction without changing the regulator

**ID:** `EllipticRegulators:ER.7/constant-symbol-regulator-correction`. **Kind:** theorem.

After refining K to a full level n≥3, let X(n) be one connected component over F=Q(μ_n), with all cusps F-rational, and let α be a rational linear combination of symbols of units on Y(n). There is a rational combination γ of constant-unit symbols {a,h}, a∈F×, h∈O(Y(n))×, such that ξ=α+γ has zero horizontal tame boundary and lifts to compact weight-two K2. It remains in the unit-symbol span on this full-level Q-scheme component and has the same compact-projected regulator as α. Transfers of ξ belong to P_K. This is the full-level specialization needed of SS 1.3.1, not a claim that arbitrary field norms of symbols are single pairs.

Hypotheses: Manin–Drinfeld for degree-zero cusp differences, componentwise; full-level cusps are rational over the component constant field. Rational symbol/tame-boundary identification, curve localization, Weil reciprocity and the compact projection of the real Deligne regulator are supplied.

Construction or proof:

1. Choose a base cusp P0. For each other cusp P, Manin–Drinfeld gives h_P with div(h_P)=m_P(P−P0), m_P>0. Realize this principal divisor over F by the L0 unit/divisor descent interface.
2. Write t_P=∂_P(α) in F×⊗Q, additively. Weil reciprocity on X(n)/F gives Σ_P t_P=0 because every cusp is F-rational and α has no other boundary.
3. With ∂_P{a,h}=ord_P(h)a, take γ=−Σ_{P≠P0}(1/m_P){t_P,h_P}; bilinearity extends symbols to F×⊗Q. The boundaries at P≠P0 cancel, and the remaining boundary at P0 is zero by reciprocity. Reverse both signs if using the inverse tame-symbol convention.
4. Both constants in F× and h_P are global units on Y(n), viewed as a component of the full-level Q-scheme. Thus compactness does not leave the unit-symbol span. Finer-level transfer gives P_K; no arbitrary norm-generation assertion is needed.
5. SS 3.5.3 compact Stokes/orthogonality makes constant-unit symbols have zero compact pairing with every holomorphic differential; combine with the canonical compact/open regulator comparison. The vanishing is a period statement, not a pointwise claim that conjugate(dlog(h))∧ω=0.

Direct prerequisites: `EllipticRegulators:ER.7/fixed-level-beilinson-subspace`, `EllipticRegulators:ER.7/beilinson-subspace`, `EllipticRegulators:ER.7/cuspidal-hecke-separation`, `EllipticRegulators:ER.7/manin-drinfeld`, `SchemeKTheoryOperations:S.3/weil-reciprocity-k-theory`, `EllipticKTheory:E.3/localisation-sequence-for-a-curve`, `EllipticKTheory:E.3/naturality-for-finite-transfer`, `EllipticRegulators:ER.2/the-normalisation-factor`, `KatoEulerSystems:L0`, `ModularCurvesPartII:R12.3`.

Acceptance: The correction has tame vector −(t_P) at every cusp, including P0 by reciprocity. For nonrational cusps the norm-weighted relation cannot be replaced by an unweighted sum. Adding a constant symbol leaves the compact pairing with every holomorphic differential unchanged. Constants of F are units on the actual full-level component; this cannot be replaced by assuming they are Q-rational constants.

Source: SS.1988, 1.3.0–1.3.1, 3.5.3; full-level specialization using Weil reciprocity.

### Algebraicity of the modular regulator period

**ID:** `EllipticRegulators:ER.7/regulator-period-inclusion`. **Kind:** theorem.

For every weight-two cuspidal automorphic π occurring in Ω¹ of the modular tower, every level K, ω∈V_π^K and rational modular units u,v, the tuple over embeddings of ∫_{Y_K(C)}log|u| conjugate(dlog(v))∧ω lies in 2πi c⁺(π)L′(π̌,0)·Qbar inside Qbar⊗C. Period-line equality is understood modulo Qbar×; it is not an exact scalar identity for an arbitrarily chosen period representative.

Hypotheses: Arithmetic L-normalization has functional equation s↦2−s. π̌ is the contragredient; all embeddings of a finite coefficient field are tracked. The integral uses the indicated wedge order and the compact/open comparison.

Construction or proof:

1. Expand log|u| in degree-zero real Eisenstein series and dlog(v) in weight-two Eisenstein representations, using the inherited Kronecker and unit-divisor declarations.
2. Unfold the cuspidal Rankin–Selberg integral with SS Haar measures; 5.1.0 gives πiΓ(s+1)/(4π)^(s−1) times [GL2(Zhat):±K] times the finite-adelic integral.
3. At s=1, 4.5.3 gives an algebraic local factor times L(π,2)L(π⊗χ,1)/L(ω_πχ,2); absolute convergence makes the denominator nonzero.
4. Use SS §2 functional equations, Gauss-sum transformation and Shimura–Blasius period algebraicity over all embeddings. Supplier requests state this exact quotient.
5. Divide by 2πi only after the ER.2 regulator normalization comparison; no Brunault/SS factor is silently exchanged.

Direct prerequisites: `EllipticRegulators:ER.7/real-analytic-eisenstein-series`, `EllipticRegulators:ER.7/kronecker-limit-formulas`, `EllipticRegulators:ER.7/rankin-selberg-integral`, `KatoEulerSystems:L0`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`, `GL2AutomorphicRepresentationsAndTransfer:R16.5`, `PeriodsAndSpecialValues:PS.1`, `EllipticRegulators:ER.2/the-normalisation-factor`, `mathlib:DirichletCharacter.LFunction`.

Acceptance: At s=1 the analytic prefactor is πi times the congruence index. Changing a period by a nonzero algebraic scalar leaves the line unchanged.

Source: SS.1988, 1.3.2(i), 2.3, 4.5.3, 5.1.0 and 5.2.

### Nonvanishing with freely chosen auxiliary level

**ID:** `EllipticRegulators:ER.7/regulator-nonvanishing-after-level-change`. **Kind:** theorem.

For each such π there exist a finite level K, ω∈V_π^K and rational modular units u,v for which ∫log|u|conjugate(dlog(v))∧ω≠0. K is chosen after the auxiliary character and local test vectors; it need not be the original newform level. After cusp correction this gives a nonzero compact regulator in the transfer Beilinson subspace, using the full-level constant-symbol correction and the early pair interface G1.

Hypotheses: An even auxiliary character χ of unrestricted conductor exists with χ≠1,ω_π⁻¹ and L(π^σ⊗χ^σ,1)≠0 for every coefficient embedding σ. At bad primes one may choose vectors fixed by a smaller compact subgroup.

Construction or proof:

1. Shimura Theorem 2 and its following remark give nonzero odd twists at a prime p away from a prescribed M, then another odd twist at q away from pM; their product is primitive even of conductor pq. Take M divisible by the original level and the central-character conductor, excluding both 1 and ω_π⁻¹. The proof uses finite Fourier inversion of modular-symbol periods and parity injectivity. Theorem 1 algebraicity transports the nonzero normalized value through every coefficient embedding; PS.1 supplies this exact adapter.
2. At each bad prime use compactly supported Kirillov vectors with local integral I(1)=1 (4.5.4); at good primes use normalized spherical vectors.
3. Choose φ supported on the product of these compact stabilizers; factorization gives a nonzero product of the two L-values and nonzero local factors.
4. Subtract φ’s (1,1)-Eisenstein component ψ. It has the same degree, but its integral is zero by the nontrivial central character χω_π. Thus φ−ψ has degree zero and preserves the nonzero integral.
5. Apply Manin–Drinfeld and the rational unit realization of degree-zero cusp data; then the full-level compact correction using G1’s early pair interface.

Direct prerequisites: `EllipticRegulators:ER.7/regulator-period-inclusion`, `EllipticRegulators:ER.7/constant-symbol-regulator-correction`, `KatoEulerSystems:L0`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`, `PeriodsAndSpecialValues:PS.1`.

Acceptance: No primitivity at the fixed modulus N appears in the conclusion. For χ=ω_π⁻¹ the central-character cancellation step fails; exclude it.

Source: SS.1988, 1.3.2(ii), 4.5.4 and 6.0–6.1.1, Shimura.1977, Theorem 2 pp.212–213 and following remark pp.213–214; Theorem 1 p.212.

### The isotypic Beilinson regulator image

**ID:** `EllipticRegulators:ER.7/isotypic-regulator-image`. **Kind:** theorem.

For every K and every occurring π, e_{π̌}r_D(P_K⊗Qbar)=L′(π̌,0)c⁺(π) Hom_Qbar(V_π^K,Qbar), inside the corresponding real Betti component after extending coefficients. If dim V_π^K=m>1 this is a full m-dimensional period subspace, not a single newform line.

Hypotheses: The compact/open regulator normalization and G1 are supplied. Hecke action, duality and the full finite-level automorphic decomposition are available with all bad Euler factors.

Construction or proof:

1. Period inclusion at all levels and transfer/form-pullback adjointness give the displayed inclusion.
2. Choose the nonzero pairing at a finer level; Hecke stability makes the nonzero isotypic image an invariant submodule.
3. Apply irreducibility of the finite-level Hecke module and transfer adjointness as in 1.2.9 to get equality at the desired level.
4. Use the contragredient projector on cohomology when pairing against V_π; retain oldform multiplicities.

Direct prerequisites: `EllipticRegulators:ER.7/beilinson-subspace`, `EllipticRegulators:ER.7/regulator-period-inclusion`, `EllipticRegulators:ER.7/regulator-nonvanishing-after-level-change`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`, `ModularCurvesPartII:R12.5`, `EllipticRegulators:ER.2/the-normalisation-factor`.

Acceptance: A level where π has two independent oldvectors gets two-dimensional regulator image. The projector is π̌, not an untracked π-projector.

Source: SS.1988, 1.2.6–1.2.9.

### The Beilinson rational structure

**ID:** `EllipticRegulators:ER.7/beilinson-rational-structure`. **Kind:** theorem.

For every X_K, r_D(P_K) is a Q-structure on H²_D(X_{K/R},R(2))=H¹_B(X_{K/R},R(1)); its scalar extension to R is the whole real vector space of dimension g, the sum of component genera. This assertion is about the regulator image, not finite generation or injectivity of the full rational K2 group.

Hypotheses: All hypotheses of the isotypic image theorem, including G1, are met. The real structure and Tate twist use SS’s real Betti convention.

Construction or proof:

1. Sum the isotypic equalities over a coefficient field splitting the Hecke algebra.
2. The real/conjugation and coefficient-Galois compatibilities identify the resulting subspace as a rational structure before scalar extension.
3. Descend the finite-dimensional regulator image, not each arbitrarily chosen complex symbol individually.

Direct prerequisites: `EllipticRegulators:ER.7/isotypic-regulator-image`, `EllipticRegulators:ER.7/real-structure-of-the-regulator`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`.

Acceptance: For genus zero the image is the zero-dimensional rational structure. For X0(11), Q_K has zero regulator but P_K has a one-dimensional regulator image.

Source: SS.1988, 1.1.2(i), 1.2.4–1.2.9.

### Beilinson’s modular determinant formula

**ID:** `EllipticRegulators:ER.7/beilinson-determinant-formula`. **Kind:** theorem.

In the determinant line of H¹_B(X_{K/R},R(1)), det_Q r_D(P_K)=L^{(g)}(H¹(X_K),0)·det_Q H¹_B(X_{K/R},Q(1)), with equality of rational lines (hence modulo Q×). L^{(g)} denotes the g-th derivative at 0; replacing it by the leading Taylor coefficient divides by g! and gives the same rational line. For disconnected X_K, g is the sum of genera.

Hypotheses: The rational-structure theorem and the motive/automorphic L-factor comparison with all finite Euler factors hold. Use the arithmetic weight-two L-normalization, not unitary s↦1−s.

Construction or proof:

1. Take determinants of the isotypic image theorem with multiplicities m(π,K).
2. Compare Betti and automorphic period determinants using 1.2.4 and the full product L(H¹(X_K),s)=∏πL(π,s)^m.
3. Each factor has its simple trivial zero at s=0; the total order is g. Multiply leading terms and restore g! if using derivatives.
4. Coefficient conjugation permutes π and π̌ with equal multiplicities, so the global product is rationally defined.

Direct prerequisites: `EllipticRegulators:ER.7/beilinson-rational-structure`, `EllipticRegulators:ER.7/isotypic-regulator-image`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`, `ModularCurvesPartII:R14.6`.

Acceptance: For g=1 the derivative and leading coefficient coincide. For g=0 the empty determinant is Q and the L-value convention agrees.

Source: SS.1988, 1.1.2(ii), 1.2.2–1.2.6.

### Normalized reduction of a modular unit

**ID:** `EllipticRegulators:ER.7/ordinary-unit-reduction`. **Kind:** construction.

For a bad-fibre component C, put e_C=ord_C(p)>0. For u a modular unit define its normalized reduction u_C as the residue of u^{e_C}/p^{ord_C(u)}, which has valuation zero. In a DVR presentation with valuation v:F×→Z and angular component ac:F×→κ(C)× this is ac(u)^{v(p)}/ac(p)^{v(u)}. It is independent of the uniformizer used to present ac, and is a unit on the ordinary locus. The tame boundary ∂_C{u,p} agrees up to the conventional sign (torsion killed after rationalization).

Hypotheses: Use the regular full-level model with n=mp^k, m≥3 and p∤m. For actual geometric reduction the angular component and valuation arise from the component DVR; arbitrary algebraic input does not establish that identification.

Construction or proof:

1. The numerator and denominator have equal C-valuation e_C ord_C(u), so their quotient has a well-defined nonzero residue.
2. SS 7.2.3 supplies the component map to the prime-to-p modular curve, degree p^kφ(p^k), and ordinary-locus unit statement.
3. Multiplicativity, powers and change of uniformizer follow by the valuation homomorphism and angular-component law; the correction exponent is e_C, not 1.

Direct prerequisites: `KatoEulerSystems:L0`, `ModularCurvesPartII:R13.5`, `EllipticKTheory:E.3/naturality-for-finite-transfer`.

API, derived from use:

- `EllipticRegulators.Modular.normalizedUnitReduction_formula` (data): For groups F×,κ×, homomorphisms v:F×→Multiplicative(Z) and ac:F×→κ×, the value is ac(u)^{v(p)}/ac(p)^{v(u)}, reading v additively.
- `EllipticRegulators.Modular.normalizedUnitReduction_mul` (structure): reduction(p,uv)=reduction(p,u)reduction(p,v).
- `EllipticRegulators.Modular.normalizedUnitReduction_inv` (simp): reduction(p,u⁻¹)=reduction(p,u)⁻¹.
- `EllipticRegulators.Modular.normalizedUnitReduction_zpow` (simp): reduction(p,u^a)=reduction(p,u)^a for every integer a.
- `EllipticRegulators.Modular.normalizedUnitReduction_orderZero` (characterisation): If v(u)=0 then reduction(p,u)=ac(u)^{v(p)}.
- `EllipticRegulators.Modular.normalizedUnitReduction_multiplyBase` (relation): reduction(p,up^a)=reduction(p,u) for every integer a.
- `EllipticRegulators.Modular.normalizedUnitReduction_changeAngular` (compatibility): For t∈κ×, replacing ac(x) by ac(x)t^{−v(x)} leaves the reduction unchanged; this is change of DVR uniformizer.

Unit tests:

- `EllipticRegulators.Modular.normalizedUnitReduction_test_base` (degenerate): reduction(p,p)=1; the integral tame symbol has a possible sign, which must not survive the rational comparison.
- `EllipticRegulators.Modular.normalizedUnitReduction_test_unramified` (compatibility): If v(p)=1 and v(u)=0 then the reduction equals ac(u), the usual residue of a unit.
- `EllipticRegulators.Modular.normalizedUnitReduction_test_ramified` (computation): If v(p)=2 and v(u)=0 then the reduction equals ac(u)². Taking κ=Q and ac(u)=2 gives 4, not 2.
- `EllipticRegulators.Modular.normalizedUnitReduction_test_baseMultiple` (characterisation): Multiplying u by p³ does not change its normalized reduction, even when v(u)≠0.

Uses: SS 7.2.4–7.2.5: The ordinary unit has supersingular orders controlled by Hecke action. SS 7.3.1: Computes vertical tame boundaries for horizontally compact modular-unit combinations.

Acceptance: Account for ramification e_C at p. A tame-symbol sign convention change does not alter rational vanishing.

Source: SS.1988, 7.2.3–7.2.4.

### Uniform supersingular orders

**ID:** `EllipticRegulators:ER.7/supersingular-orders-of-modular-units`. **Kind:** theorem.

For the regular full-level model at p of level n=mp^k, m≥3, p∤m, the orders of the normalized reduction u_C at supersingular points of each component C are all equal. The statement refers to the divisor pulled through the finite component map of 7.2.3, with its ramification multiplicities.

Hypotheses: Use the ordinary reduction construction and the supersingular Hecke module Qbar[Σ]/Qbar[S] of 7.1.1. The component geometry and compatible away-from-p Hecke action are supplied.

Construction or proof:

1. The cusp divisor of u belongs to an Eisenstein Hecke module from Kato L0 and the inherited modular-unit divisor theorem.
2. The supersingular divisor modulo component constants is cuspidal by 7.1.1; its automorphic summands have local representation sp(1) at p.
3. Hecke separation forces the image of the unit-divisor module in this quotient to vanish.
4. Thus the supersingular content lies in the component-constant subspace Q[S], exactly the equal-order conclusion of 7.2.5.

Direct prerequisites: `EllipticRegulators:ER.7/ordinary-unit-reduction`, `ModularCurvesPartII:R14.6`, `ModularCurvesPartII:R13.5`, `KatoEulerSystems:L0`.

Acceptance: Uniformity is on each component; equality between unrelated constant-field components is not asserted. The quotient by Q[S] cannot be omitted.

Source: SS.1988, 7.1.1 and 7.2.5.

### Integrality at full modular level

**ID:** `EllipticRegulators:ER.7/full-level-modular-symbol-integrality`. **Kind:** theorem.

For a full level n chosen divisible by two coprime factors each at least 3, every class in Q_n lies in the integral rational weight-two part im(K2^(2)(X(n)/Z)→K2^(2)(X(n))). In particular, every vertical boundary of a horizontally compact linear combination of modular-unit symbols vanishes after tensoring with Q. Small levels are reached by refinement and transfer, not by applying the stated model argument outside its hypotheses.

Hypotheses: Use a regular proper arithmetic-surface model and its weight-two K/G localization comparison. The horizontal boundary vanishes for the total class, not necessarily each pair-symbol summand.

Construction or proof:

1. At primes not dividing n, the vertical boundary target vanishes by smooth-fibre localization in the indicated weight; do not assert that each modular unit extends as a unit across the cusps.
2. At p|n, write n=mp^k with p∤m and m≥3. The horizontal/vertical residue compatibility square (7.3.0) makes the vertical boundary have zero cusp orders.
3. The preceding theorem makes its supersingular orders uniform on each component; total divisor degree zero then forces all those orders to vanish.
4. The boundary therefore extends to a unit on each complete normalized component. Its finite constant field makes it torsion; rationalize to get zero.
5. Use arithmetic-surface localization including codimension-two terms and Adams weights to lift to the integral part. Killing only generic component orders without this comparison is insufficient.

Direct prerequisites: `EllipticRegulators:ER.7/fixed-level-beilinson-subspace`, `EllipticRegulators:ER.7/supersingular-orders-of-modular-units`, `SchemeKTheoryOperations:S.3/arithmetic-surface-localisation`, `EllipticKTheory:E.6/the-integral-part`, `ModularCurvesPartII:R13.5`.

Acceptance: The finite-field torsion argument is explicitly present; a zero divisor over a number field would not suffice. No assertion says every modular unit is integral at every bad prime.

Source: SS.1988, 7.3.0–7.3.1.

### Integrality of the Beilinson subspace

**ID:** `EllipticRegulators:ER.7/integral-beilinson-subspace`. **Kind:** theorem.

For every open compact K, P_K⊂im(K2^(2)(X_K/Z)→K2^(2)(X_K))⊗Q, independently of the regular proper model. This is Schappacher–Scholl 1.1.2(iii); it is independent of the analytic determinant and nonvanishing proofs.

Hypotheses: Every finite-level correspondence admits a resolved graph on regular proper arithmetic-surface models. Proper pushforward and pullback on the rational weight-two part are compatible with model localization.

Construction or proof:

1. Refine a finite-level witness to a full level satisfying the coprime-factor hypothesis and apply full-level integrality.
2. Extend the level map using a resolved graph on the models; proper push/pull preserves integral weight-two classes (7.3.2).
3. Transfer and divide by the rational covering degree; model independence in EllipticKTheory E.6 identifies the resulting integral parts.
4. Use the actual vertical-residue proof. The false integral Manin–Drinfeld assertion, corrected in SS 7.4, is not a substitute.

Direct prerequisites: `EllipticRegulators:ER.7/beilinson-subspace`, `EllipticRegulators:ER.7/full-level-modular-symbol-integrality`, `EllipticKTheory:E.6/model-independence`, `SchemeKTheoryOperations:S.2/k-theory-proper-pushforward`, `ModularCurvesPartII:R13.6`.

Acceptance: A transfer of a full-level class remains integral after resolving the graph. The function Δ(pz)/Δ(z) prevents an all-bad-primes integral-unit Manin–Drinfeld assertion.

Source: SS.1988, 1.1.2(iii), 7.3.2 and 7.4.

### The elliptic image of Beilinson classes

**ID:** `EllipticRegulators:ER.7/elliptic-beilinson-subspace`. **Kind:** definition.

Given a nonconstant Q-morphism φ:X_K→E to a smooth elliptic curve E/Q, define P_E,φ=φ_*(P_K)⊂K2^(2)(E)⊗Q. This is an image Q-submodule. Its nonzero regulator is proved from the modular isotypic theorem and φ^*ω_E≠0; it does not follow from nonzero norm of every individual symbol.

Hypotheses: The compact class source and the finite proper transfer have been constructed. No surjectivity or injectivity of φ_* on all K2 is assumed.

Construction or proof:

1. A nonconstant map of smooth projective curves is finite. Use the imported proper K2 transfer.
2. Take Mathlib Submodule.map of P_K; retain the witness from P_K and its finite-level origin.
3. Use regulator adjointness for the nonvanishing assertion, separately from this definition.

Direct prerequisites: `EllipticRegulators:ER.7/beilinson-subspace`, `EllipticKTheory:E.5/pullback-and-pushforward`, `mathlib:Submodule.map`.

API, derived from use:

- `EllipticRegulators.Modular.ellipticBeilinsonSubspace_mem` (characterisation): For a linear push:A→B, β∈ellipticBeilinsonSubspace(push,P) iff β=push(ξ) for some ξ∈P.
- `EllipticRegulators.Modular.ellipticBeilinsonSubspace_id` (compatibility): With push=id the image is P, agreeing with Submodule.map_id.
- `EllipticRegulators.Modular.ellipticBeilinsonSubspace_comp` (functoriality): For f:A→B and g:B→C the image under g∘f equals the image under g of the image under f.
- `EllipticRegulators.Modular.ellipticBeilinsonSubspace_zero` (simp): The zero linear push gives the zero image submodule.
- `EllipticRegulators.Modular.ellipticBeilinsonSubspace_regulator` (compatibility): If r_B∘push=t∘r_A, then r_B(P_E,φ)=t(r_A(P_K)) as image submodules.
- `EllipticRegulators.Modular.ellipticBeilinsonSubspace_integral` (compatibility): If P≤I_A and push(I_A)≤I_B, the elliptic image lies in I_B. For geometry these are model-independent integral parts.

Unit tests:

- `EllipticRegulators.Modular.ellipticBeilinsonSubspace_test_identity` (compatibility): For identity push on Q², a one-dimensional submodule stays the same submodule.
- `EllipticRegulators.Modular.ellipticBeilinsonSubspace_test_zero` (degenerate): Zero push maps a nonzero source submodule to zero.
- `EllipticRegulators.Modular.ellipticBeilinsonSubspace_test_projection` (non-example): The first-coordinate projection Q²→Q maps span{(0,1)} to zero, despite its nonzero source generator.
- `EllipticRegulators.Modular.ellipticBeilinsonSubspace_test_degree` (computation): Multiplication by 3 on Q has full image; rational transfer degree does not shrink it.

Uses: General elliptic application: Names the precise integral subspace with the asserted regulator line. Rational descent: Performs Galois descent after pushforward on E, using the exact E.7 supplier.

Acceptance: Constant algebraic maps in the prototype have zero image; geometric nonconstancy is indispensable for the elliptic theorem.

Source: SS.1988, 1.2.9 (adjointness), 1.1.2 applied to an elliptic quotient.

### Regulator adjointness and rational descent on E

**ID:** `EllipticRegulators:ER.7/elliptic-regulator-adjointness`. **Kind:** comparison.

For a finite Q-map φ:X_K→E and a compact rational weight-two class ξ, the properly normalized real Deligne regulator satisfies ⟨r_E(φ_*ξ),ω_E⟩=⟨r_{X_K}(ξ),φ^*ω_E⟩. For a finite Galois extension F/Q, an invariant pushed class β_F∈K2(E_F)⊗Q descends as β=(1/[F:Q])Norm(β_F), with res(β)=β_F. No nonzero-regulator conclusion is drawn from an unweighted trace of a single non-invariant character class.

Hypotheses: Same regulator, Tate twist, complex orientation and wedge order on both curves. The proper cycle-map interface from the early real Deligne supplier is supplied. Compact K2 classes are used, not arbitrary function-field symbols without boundary control.

Construction or proof:

1. Deninger–Scholl (2.6)–(2.8) constructs the regulator with supports; proper covariance gives r_Eφ_*=φ_*r_X. A finite map of curves has relative codimension zero, hence no degree or Tate shift.
2. Poincaré duality pairs cohomological pushforward with form pullback; ER.2 converts this canonical normalization to Brunault’s explicit pairing.
3. Use EllipticKTheory E.7 rational Galois descent after pushing to E; Norm∘res=[F:Q] and res∘Norm=Σσ prove the formula for invariant β_F.
4. Before using a character class, project or combine the coefficient representation so that an invariant class with a proved nonzero real regulator exists. Trace can otherwise vanish.
5. For integral classes use resolved-graph pushforward, not an unjustified smooth morphism between models.

Direct prerequisites: `EllipticRegulators:ER.7/elliptic-beilinson-subspace`, `EllipticRegulators:ER.7/regulator-under-finite-pushforward`, `EllipticRegulators:ER.2/the-normalisation-factor`, `EllipticKTheory:E.5/pullback-and-pushforward`, `EllipticKTheory:E.7/rational-galois-descent`, `EllipticKTheory:E.7/transfer-of-certified-classes`, `SchemeKTheoryOperations:S.2/k-theory-proper-pushforward`.

Acceptance: Identity map gives equality without a factor of two or a degree. A non-invariant class with σβ=−β has trace zero; rational descent does not certify its nonvanishing.

Source: DS.1991, (1.3)(1),(6); (2.6)–(2.8).

### Beilinson’s theorem for a modular elliptic curve

**ID:** `EllipticRegulators:ER.7/modular-elliptic-regulator-line`. **Kind:** theorem.

Let E/Q have conductor N and let φ:X0(N)→E be a nonconstant Q-parametrization with φ^*ω_E=c_φ·2πi f(z)dz, c_φ∈Q×, f the normalized weight-two newform having L(f,s)=L(E,s) including bad factors. Then P_E,φ is contained in the integral rational K2 part and r_D(P_E,φ)=L′(E,0)H¹_B(E/R,Q(1)) as rational lines in H¹_B(E/R,R(1)). For each nonzero rational Betti generator b there is an integral rational K2 class β with r_D(β)=L′(E,0)b. The modularity supplier makes this conclusion applicable to every elliptic curve over Q. No claim is made about the dimension of full K2(E)⊗Q.

Hypotheses: Use the exact-conductor modularity theorem and the nonconstant Q-parametrization; no optimality or c_φ=1 hypothesis. G1, period comparisons and the early proper regulator interface are supplied. The functional equation gives L′(E,0)≠0 from the absolutely convergent L(E,2)≠0.

Construction or proof:

1. Apply the full isotypic regulator image to the rational newform component containing φ^*ω_E; this differential is nonzero.
2. Regulator adjointness identifies the pushforward image with the nonzero elliptic period line. Pullback followed by pushforward on Betti cohomology multiplies by deg φ, a nonzero rational scalar.
3. The elliptic motive factor and its rational Betti comparison identify the line as L′(E,0) times the Betti Q-line; an unspecified period representative cannot change a rational-line equality.
4. The integral Beilinson theorem and resolved-graph proper covariance give the integral inclusion. Choose a rational multiple of a nonzero image class to get the prescribed generator b.
5. Import EllipticCurveModularity R29.6 for the unconditional existence of f and R29.5 for φ. The primitive-even-same-level condition is never used.

Direct prerequisites: `EllipticRegulators:ER.7/elliptic-beilinson-subspace`, `EllipticRegulators:ER.7/elliptic-regulator-adjointness`, `EllipticRegulators:ER.7/integral-beilinson-subspace`, `EllipticRegulators:ER.7/isotypic-regulator-image`, `EllipticRegulators:ER.7/beilinson-determinant-formula`, `EllipticCurveModularity:R29.5/modular-parametrisation`, `EllipticCurveModularity:R29.6/modularity-theorem`, `tauceti:HeckeRing.GL2.Newform`, `EllipticRegulators:ER.6/the-beilinson-statement`.

Acceptance: For E=X0(11), same-level Q_K has zero regulator while P_E,φ gives the required nonzero line. Replacing ω_E by a rational multiple changes c_φ consistently and leaves the rational line unchanged. This is existence with transfers, not an explicit same-level formula for every conductor.

Source: SS.1988, 1.1.2, 1.2.6–1.2.9; elliptic quotient specialization.

## Inherited source proofs and the exact explicit formulas

The complete Merel appendix, printed/PDF pp.143–155, has been read. Theorem A begins with the finite multiplicative Fourier transform of ξ_f(u,v)=−i∫_{g0}^{g∞}f(z)dz. Its input is a normalized primitive weight-two form with nebentypus, a full-order pair (u,v), the order N′ of uv, and a partition of primes compatible with their supports. The primitive conductors and their S/S-complement parts are filtered by N′. Partial Atkin–Lehner operators, Gauss sums and the local rational functions P_p and Q_p contribute Euler corrections. The proof uses additive translations, primitive/imprimitive character decomposition, the local recurrence at each prime, Proposition B’s transformed forms, and Mellin integration along the vertical path. Changing the path orientation or replacing N′ by N before the calculation changes the answer.

These are normalized period adapters to the upstream modular-symbol theory, requested as ModularForms Part II. The adapter is not a new generic modular-symbol definition in ER.7. Its complete formula must be imported with its conductor filters; no prime-level specialization stands in for the composite-level statement. Corollary 2 follows by finite Fourier inversion and injectivity of the plus/minus period maps. It yields a character of conductor dividing N in the chosen parity argument. For the generic form this is weaker than a primitive even character of conductor exactly N avoiding the nebentypus exception.

Theorem C calculates the Petersson form by Stokes’ theorem on a fundamental polygon, uses the σ and τ relations of Manin periods, and obtains the bilinear Haberland relation. The factor from quotient representatives and the first-linear convention must precede substitution of Theorem A. Theorem D applies that relation to the residue of the Dirichlet series Σa_n² n^(−s). This Dirichlet series is not, by definition, the complete tensor-product Euler L-function; the missing Euler denominators must be tracked separately. The original packet’s accepted E15 says its displayed coefficient is too small by four; E16 reverses the even-symbol sign; E17 corrects a π power in the derived ratio. Reading the printed proof does not constitute an analytic location of these discrepancies. Their corrected imported statements remain, and G3 records the exact calculation still required.

Siegel’s first limit formula uses Q(m,n)=y⁻¹|m+nz|² and sums over both signs of (m,n). The residue is π, with finite term 2π(γ−log2−log(√y|η(z)|²)). The regulator application uses degree-zero combinations so the constant/pole terms cancel before differentiation. The second formula concerns nonintegral characteristics; the singular integral-characteristic case cannot be substituted into it. Its theta product, Bernoulli term and logarithmic absolute value must be converted to the imported Brunault definitions with the same q-parameter. The Mellin/Poisson continuation proof is read, but Lean closure still needs explicit Gaussian summability and interchange estimates. The pinned one-dimensional Poisson statement is not an unrestricted two-dimensional theorem.

For Manin–Drinfeld, SS 3.4.0 gives a full proof, rather than a citation to the theorem’s name. On cusp divisors the good-prime Hecke eigenvalues are Eisenstein, of size at least p−1. On the Jacobian they are cuspidal, of size at most 2√p. A common annihilating polynomial and spectral separation force rational cusp classes to vanish. The resulting torsion statement is about the generic smooth curve. SS 7.4 explicitly corrects the false assertion that all modular units are a cyclotomic constant times a unit on the integral model. The unit Δ(pz)/Δ(z) provides the bad-prime obstruction. The vertical K₂ proof above replaces that false step.

Shimura’s original pp.212–214 are publicly readable as Göttingen GDZ scans. Theorem 2 proves nonvanishing in either parity for a prime conductor away from any prescribed integer M. Finite Fourier transforms of U(b/p,f) recover the even or odd periods. If every twist in that parity vanished, the corresponding real or imaginary periods of f and its conjugate would vanish on the modular-symbol generators, forcing f=0. The following remark applies the odd case first to f at p, then to its twisted form at a distinct q. The product of the two odd characters is primitive even of conductor pq. With M divisible by the original level and the central-character conductor it is neither the trivial character nor ω_π⁻¹. Theorem 1’s Gauss-sum-normalized period algebraicity transports nonzero values to every coefficient embedding. The exact normalized adapter is imported from PS.1; this is not the unresolved primitive-even-character assertion at the original level. Theorem 1 and the generator lemma cite Shimura’s earlier 1976 work, whose underlying proofs were not read in this pass.

The constant correction can also be made explicit at full level, where every cusp of a component is rational over F=Q(μ_n). For a base cusp P0, choose L0 cusp units h_P with divisor m_P(P−P0). If t_P is the tame boundary of α at P, subtract the rational constant-unit symbols (1/m_P){t_P,h_P}. Their boundaries cancel those of α away from P0. Weil reciprocity makes the last boundary cancel too. Constants of F are global units on this Q-scheme component, so the corrected class remains in the modular-unit span and hence transfers into P_K. This avoids requiring an unread general Bloch norm-correction lemma. It still needs the explicit early pair-symbol convention and component-field/unit-realization adapters recorded as G1. The regulator of the correction vanishes in the compact period pairing by SS 3.5.3, rather than by incorrectly wedging two holomorphic forms.

The inherited declarations receive the following proof-closure records. They are not copied into the new node list.

### `EllipticRegulators:ER.7/kronecker-limit-formulas`

Source proof read; analytic adapter still requested. Siegel §1 Theorem 1: split the m=0 term, apply one-dimensional Gaussian Poisson summation to the m≠0 terms, use Mellin inversion, isolate the pole and identify the eta product. §3 Theorem 2: shift the lattice, use nonintegral (u,v) to remove the pole, sum the Fourier geometric series, and identify the Bernoulli/quasi-period terms and logarithmic product. §5 Theorem 3 supplies analytic continuation through the theta–Mellin transform. Translate Siegel’s Q=y⁻¹|u+vz|² and the sum over both signs to Brunault’s series before using a constant. The Mathlib Poisson declaration is one-dimensional and has explicit summability hypotheses; verify them for the Gaussian and its iterates, not an arbitrary kernel.

### `EllipticRegulators:ER.7/manin-drinfeld`

Proof reduced to explicit supplier contracts. SS 3.4.0 supplies the complete spectral separation proof; the fresh cuspidal-hecke-separation node isolates its key ingredient. Componentwise degree-zero cusps become torsion over the generic curve. This says nothing about bad-fibre integral units.

### `EllipticRegulators:ER.7/nonvanishing-of-a-twisted-value`

Parity/conductor distinction audited. Merel Corollary 2 follows from Theorem A, finite Fourier inversion and injectivity of f↦ξ_f^±. For a generic primitive newform it supplies an even or odd primitive character of conductor dividing N, rather than a primitive even character of conductor exactly N avoiding the nebentypus exception. The inherited E/Q specialization remains the conditional finite-level input; SS 2.2.0 uses unrestricted conductor and separately excludes two characters.

### `EllipticRegulators:ER.7/prime-level-L-value-formula`

Proof normalization gap retained. Read all of Merel §§2–5, including Theorem A’s translation/Atkin–Lehner calculation, Theorem C’s Stokes/Haberland proof and Theorem D’s substitution. The accepted E15 factor-four, E16 even-sign and E17 pi correction remain authoritative imported findings, not new unproved global formulas. An analytic derivation locating E15/E16 is still required. Petersson is first-linear and divided by [SL2(Z):Γ] here, whereas Tau Ceti conjugates the first variable and has no index division.

### `EllipticRegulators:ER.7/regulator-under-finite-pushforward`

Proper-covariance proof supplied; convention interface open. Deninger–Scholl (2.6)–(2.8) gives proper functoriality of the real Deligne cycle map. For finite maps of curves, c=0 so no shift occurs. Pair against pullback forms using duality. This replaces the inherited proof’s invalid reduction of every norm to a projection-formula symbol, without changing its mathematical statement. The early M.8/ER.2 normalization interface is G2.

### `EllipticRegulators:ER.7/the-pushforward-and-its-hypotheses`

General route supplied, conditional formula preserved. Retain the explicit same-level formula only with its original primitive-character and c_φ hypotheses. General E/Q uses P_K and modular-elliptic-regulator-line instead. Rational Galois descent occurs on E after pushforward; the trace of a non-invariant single character class may be zero. Nonzero rational image is obtained from the Hecke-equivariant period subspace, not from an unproved orbit-sum noncancellation.

### `EllipticRegulators:ER.7/the-X1-11-example`

Inherited rigorous sign gap retained. E19 fixes the sign only by an uncertified computation in the source. The exact oriented modular-symbol computation or a certified error-bound evaluation is still necessary. The general existence theorem does not depend on this numerical example.

Other inherited ER.7 nodes remain imported under these exact IDs:

- `EllipticRegulators:ER.7/modular-units-and-their-divisors`.
- `EllipticRegulators:ER.7/the-regulator-integral-and-its-evaluation`.
- `EllipticRegulators:ER.7/the-explicit-theorem-for-an-elliptic-curve`.
- `EllipticRegulators:ER.7/real-analytic-eisenstein-series`.
- `EllipticRegulators:ER.7/dirichlet-series-convolution`.
- `EllipticRegulators:ER.7/rankin-selberg-integral`.
- `EllipticRegulators:ER.7/harmonicity-of-eisenstein-series`.
- `EllipticRegulators:ER.7/divisors-of-character-units`.
- `EllipticRegulators:ER.7/rationality-of-modular-units`.
- `EllipticRegulators:ER.7/symbols-of-modular-units-in-K2`.
- `EllipticRegulators:ER.7/explicit-beilinson-theorem-degeneracy`.
- `EllipticRegulators:ER.7/real-structure-of-the-regulator`.
- `EllipticRegulators:ER.7/spanning-for-prime-level`.
- `EllipticRegulators:ER.7/eta-form-of-divisors`.
- `EllipticRegulators:ER.7/manin-cycle-and-its-boundary`.
- `EllipticRegulators:ER.7/unfolding-over-the-fundamental-domain`.
- `EllipticRegulators:ER.7/cycle-formula`.
- `EllipticRegulators:ER.7/rational-combination-for-L-E-2`.

## Cusp widths and source issue E24

The source defines q_w=exp(2πiz/w). Thus log|q_w|=−2πy/w. SS 3.1.7 says E_φ is asymptotic to −2πyφ; its logarithmic singularity is therefore wφ log|q_w|. Since η_φ=2∂E_φ, its residue is wφ. Both the public author copy and the published-pagination mirror print φ/w in 3.1.8. This is incompatible with the stated q-coordinate and with 3.5.0–3.5.1, where div(u)=ord(u)/w and η_div(u)=dlog(u).

The new finding is `EllipticRegulators/E24`, with rendered-page checks and the correction searches recorded in the packet. No published correction was located. Width two with φ=1 gives residue two, whereas the printed inverse-width formula gives one half. This test prevents the typo from entering the algebraic divisor adapter. The main modular theorem is not rejected because of this local typo; its unit realization uses the consistent product convention.

## Supplier contracts and acyclic boundaries

The new graph follows definitions and key theorems until it reaches pinned declarations, exact existing supplier nodes, precise requested stages or named proof gaps. A stage name is never treated as evidence that the full requested theorem is already present. Requests below specify what must be supplied. Already suitable nodes of EllipticKTheory E.3, E.5, E.6 and E.7 and SchemeKTheoryOperations S.2 and S.3 are imported directly rather than requested afresh.

The general regulator covariance uses Deninger–Scholl’s cycle map with supports. It avoids the invalid argument that every norm of every K₂ symbol can be rewritten as a symbol {Nu,v}. The projection formula applies when one entry is pulled back from the target; it is not a generation theorem. Finite morphisms between compact curves have codimension zero, so proper covariance introduces no new weight or degree shift. A degree appears in norm–restriction, not in the basic pairing adjointness.

Likewise, rational Galois descent is an assertion about invariant classes. If a non-invariant class changes sign under a Galois element, its trace can be zero. The general elliptic proof obtains a nonzero rational regulator image from the Hecke-equivariant period subspace. When coefficient-valued explicit classes are used, their invariant combination must be justified before applying Norm/[F:Q]. The E.7 supplier is for elliptic curves, so descent is performed on E after pushforward, rather than pretending it already supplies generic modular-curve descent.

**`ModularCurvesPartII:R12.3`:** Full-level n≥3 compactification component over F=Q(μ_n), with its reduced generic cusp locus consisting of F-rational points, and finite full-level covers refining any K. Supply component constant fields and analytic/algebraic cusp identification; no assertion that an arbitrary integral cusp fibre is reduced.

**`KatoEulerSystems:L0`:** Single owner of Siegel/modular units, componentwise cusp-divisor realization after rationalization, q-product normalization, Galois action and descent to the algebraic modular curve. Supply units integral on the good open model over Z[1/n]. Do not assert every modular unit is an integral unit at all bad primes; SS §7 proves integrality of compact K2 combinations instead.

**`ModularCurvesPartII:R12.5`:** The same geometric good-prime T_p acts on cusp divisors, Pic⁰ and holomorphic differentials; its Jacobian characteristic polynomial annihilates Pic⁰ and its eigenvalues satisfy |a_p|≤2√p. Include the finite-level weight-two differential/form comparison and pullback/trace adjointness with ω=2πif(z)dz.

**`ModularCurvesPartII:R14.6`:** Full Hecke-equivariant comparison of motive H¹(X_K) and weight-two automorphic factors, including bad Euler factors and oldvector multiplicities. At p, supply SS 7.1.1: Qbar[Σ]/Qbar[S] is the sum of cuspidal supersingular modules with local representation sp(1); Q[S] consists of component constants. This is a specific model/Hecke comparison beyond merely a graph Laplacian.

**`ModularCurvesPartII:R13.5`:** The regular full-level model for n=mp^k, m≥3 and p∤m: reduced components indexed by constant-field components and P¹(Z/p^k), and their normalization maps to the prime-to-p special fibre with degree p^kφ(p^k), total supersingular ramification and the GZ/m action, as in SS 7.2.2–7.2.3. Include ordinary-locus unit reduction and the horizontal/vertical residue-content square of 7.3.0.

**`ModularCurvesPartII:R13.6`:** Resolved graphs of finite modular level maps and of a finite Q-parametrization on regular proper arithmetic-surface models; proper pullback/pushforward must preserve the rational weight-two integral image even when no smooth map between chosen models exists.

**`GL2AutomorphicRepresentationsAndTransfer:R16.2`:** Local Kirillov/Whittaker test-vector statements SS 4.5.2–4.5.4 with ψ_p(p^−r)=exp(−2πip^−r), vol(Z_p×)=1, and arithmetic s-normalization: spherical Euler quotient at good primes; at bad primes compactly supported vectors can be chosen with I(1)=1 after shrinking their stabilizers. A fixed-level newvector nonvanishing assertion is insufficient.

**`GL2AutomorphicRepresentationsAndTransfer:R16.4`:** The global modular tower Ω¹⊗Qbar=⊕πV_π, irreducibility of V_π^K under the finite-level Hecke algebra, semisimplicity and coefficient-Galois descent, with full oldvector multiplicities and contragredient duality. Use actual small-level/stabilizer degrees rather than blindly substituting an abstract group index.

**`GL2AutomorphicRepresentationsAndTransfer:R16.5`:** Import the RankinSelbergAndAutomorphicLFunctions owner for the global finite-adelic Rankin–Selberg factorization in SS 4.5.3 and unfolding 5.1.0: algebraic local factor A times L(π,2)L(π⊗χ,1)/L(ωπχ,2), Haar vol(GL2(Zhat))=1, analytic prefactor πiΓ(s+1)/(4π)^(s−1) times [GL2(Zhat):±K]. This request consumes the general theory, and adds only its classical arithmetic normalization adapter.

**`PeriodsAndSpecialValues:PS.1`:** SS 2.2.0–2.3 and Shimura 1977 pp.212–214 Theorems 1–2 plus the two-prime remark (read): even auxiliary χ of unrestricted conductor, excluding 1 and ωπ⁻¹, with all conjugate L(π⊗χ,1) nonzero; exact Shimura–Blasius algebraicity of L(π,2)L(π⊗χ,1)/L(ωπχ,2) in 2πic⁺(π)L′(π̌,0)·Qbar, tracking all embeddings, Gauss sums and arithmetic functional equations. Merel’s conductor-dividing-N corollary alone does not prove the finite-exception exclusion.

**`KatoEulerSystems:L1`:** Extend the concrete early pair-symbol declaration to the bilinear rational symbol interface on Y_K, arbitrary pairs of the L0 Siegel units and their rational span, compatible with field extension and transfer. Supply its tame-symbol convention and bilinearity for rational constants from the full-level component field. The ER.7 correction proof uses cusp-unit realization from L0 and Weil reciprocity from SchemeKTheoryOperations S.3; no generic Bloch correction is replanned in L1. L1 owns this before any modular-parametrization/Iwasawa machinery; no whole L1 edge is activated until an accepted early-prefix boundary exists.

**`MotivicEtaleKTheory:M.8`:** Accepted early real Deligne cycle-map prefix only: compact/open projection, proper covariance with supports for rational weight-two K2 of curves, real structure and Poincaré duality. Fix the identification of the canonical r_D pairing (1/(2πi))∫log|u|conjugate(dlog(v))∧ω with the inherited Brunault r_N convention, including the factor-two comparison in ER.2. Do not activate the whole late M.8 stage, whose D.2/R.7 dependencies can close a cycle.

**`tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`:** Use the existing modular-symbol period maps, parity injectivity and rational Hecke algebra. A ModularForms Part II adapter must supply Merel appendix Theorem A (§§1–3): its finite multiplicative Fourier expansion for ξ_f(u,v)=−i∫_{g0}^{g∞}f(z)dz, exact conductor N′, the conditions m_{χ,S},m_{ψχ,Sbar}|N′, Euler corrections P_p,Q_p, partial Atkin–Lehner pseudo-eigenvalues and completed Mellin values. Include the parity argument of Corollary 2 and the first-linear/index-normalized Petersson conversion of Theorem C. The prime-level specializations must use the corrected E15/E16/E17 statements and locate the sign and factor-four errors analytically before claiming proof closure.

## Remaining proof closure and acceptance

**G1 — Early pair-symbol interface and full-level cusp adapters.** The concrete early Kato L1 node supplies its distinguished pair on Y(M,N), not the arbitrary rational pair span with fixed tame-symbol convention needed here. The correction node now gives a full-level proof of span membership using F-rational cusps, L0 principal cusp units and SchemeKTheoryOperations Weil reciprocity. Their precise component-field and unit-realization adapters, together with the accepted early L1 boundary, remain supplier obligations. Bloch Chapter VIII Lemma 5.2 was not read, and no general version is claimed. No arbitrary norm-generation or noncancelling trace argument is used.

**G2 — Early regulator normalization and proper cycle-map prefix.** Canonical proper covariance was read in Deninger–Scholl, but the original ER.2 normalization node still requires the accepted early M.8 prefix. Spell out the compact/open projection and the factor comparing SS’s (1/(2πi))∫log|u|conjugate(dlog(v))∧ω and Brunault’s ∫η(u,v)∧ω with real Tate twists and orientation. No whole late M.8 edge is activated.

**G3 — Merel composite-level Fourier adapter and analytic error location.** The complete appendix was read. Theorem A’s conductor filters and P_p/Q_p Euler corrections require a normalized period adapter supplied by ModularForms Part II. The accepted E15 (factor four) and E16 (even-sign) corrections are imported without upgrading their numerical verification to a proof. Derive both analytically from oriented Mellin periods and the first-linear/index-normalized Petersson/Haberland formula; distinguish Σa_n²/n^s from the full tensor-product Euler L-function. E17 follows algebraically after the corrected convention.

**G4 — Certified sign in the X1(11) worked example.** Inherited source issue E19 requires exact oriented modular-symbol evaluation or a rigorous tail-bound computation. No new uncertified numerical run is a proof; the general transfer theorem is independent of this example.

**G5 — Primitive even twist at exactly the original modulus.** Brunault BSMF Remark 1.2 does not establish existence of a primitive even χ of conductor N avoiding 1 and ψbar with nonzero L(f,χ,1). Merel’s parity/conductor-dividing statement is weaker. Retain the explicit formula conditionally; use SS’s freely chosen auxiliary conductor and local level refinement for the general theorem. No assertion about the present research status of this question is made.

**G6 — Imported analytic and special-fibre supplier proofs.** The exact R12.3, R12.5, R13.5, R13.6, R14.6, R16.2, R16.4, R16.5 and PS.1 contracts are requested stages rather than completed declaration-level suppliers. Shimura pp.212–214 were read: the two-prime argument resolves finite-exception avoidance at unrestricted auxiliary level. Its period algebraicity and modular-symbol generator results invoke earlier 1976 work, not read; the normalized all-conjugates PS.1 adapter is still requested. Siegel’s limit proofs were read, but the pinned Gaussian Poisson hypotheses and all interchanges/eta constants still need a Lean-level analytic adapter, building on Completed/ContourIntegration. These are recorded obligations, not missing target nodes.

The stage acceptance checks include: residue cancellation before imposing compactness; the failure of Q_K on X₀(11); full oldvector multiplicities after finer-level transfer; conductor and parity filters in Merel’s formulas; nonzero local test vectors after shrinking level; componentwise degrees and finite-field torsion in the vertical argument; the ramification exponent in u_C; proper covariance at codimension zero; the difference between invariant descent and arbitrary orbit sums; and the conditional-to-unconditional transition through a genuine Q-parametrization and the complete modularity theorem.

All stage targets are accounted for. The primitive-even-same-modulus assertion is the expressly recorded open input from BSMF Remark 1.2, not a theorem in the graph and not a dependency of the general elliptic conclusion. The latter is an existence theorem using transfers from suitable levels; it does not produce an explicit same-level formula at every conductor. Likewise, equality of the regulator image with a rational line does not assert injectivity of the regulator or a rank statement for all K₂(E)⊗Q.

## Suggested file and atlas planets

The suggested file prototypes Q_K as a span comap, P_K as a supremum of transfer images, normalized unit reduction as an actual expression in group homomorphisms, and P_E,φ as a linear image. It gives all 26 API signatures and 16 unit-test examples. The baseline lacks the scheme K₂/Deligne/modular-unit carriers for the full geometric theorem signatures, so those omissions are named explicitly in comments, with their complete mathematical statements in this document and packet. No artificial carrier, predicate field or assumption disguises their absence. Elaboration of the algebraic file checks interface shapes, not the missing geometric theorem proofs.

The two new planets are **Beilinson subspace** and **Integral Beilinson subspace**. The ownership rescope removes the inherited generic modular-unit and pair-symbol planets from ER.7 during assembly and retains Explicit Beilinson theorem, Rankin–Selberg integral, Manin–Drinfeld theorem and L(E,2) from geodesic periods. The assembled layer then has six planets. The sixteen new nodes remain in the current ER.7 scope; no invented substage is used to bypass an unresolved early supplier boundary.

## Public sources and reading record

The upstream ModularForms and Completed/ContourIntegration documents were read in full. Their vocabulary and library-building order guide the interfaces here. The first supplies period maps, Hecke modules and analytic modular-form conventions; the second supplies improper-integral foundations. Their existing mathematics is imported. The reviewed library audit, stage descriptions, all relevant link-map entries and the original accepted packet were checked before assigning ownership.

**SS.1988 — Beilinson’s theorem on modular curves**, Norbert Schappacher and Anthony J. Scholl. 1988, pp.273–304; author retypeset copy dated 2010, 21 pages. Published-pagination mirror separately compared; locators below use numbered sections. [Public copy](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/RSS.pdf). Read 2026-10-06. SHA-256 `7c97475e330cd67c0de474e1d12096cec262f6ca1f045fe5d1e74b1dbfe8a10e`.

- Entire author copy §§1–7 and bibliography; especially 1.1.1–1.3.2, 3.4.0, 4.5, 5.1, 6.1 and 7.1–7.4.
- Published-pagination copy https://ncatlab.org/nlab/files/SchappacherScholl.pdf, SHA256 604efee0cc32f3a06e7915a3bd3f00cb7d2d218274f2d835ca93d6aa6964663e: pp.275–280, 284–289, 294–302. Page image of 3.1.8 checked in both copies.

**DS.1991 — The Beilinson conjectures**, Christopher Deninger and Anthony J. Scholl. 1991 survey; author public preprint, section locators [Public copy](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/d-s.pdf). Read 2026-10-06. SHA-256 `f4a31e86abb2e80a1b3a07a6158fa19ff4f8110a75c7db491890877b12dfcb27`.

- (1.3)(1),(6): proper functoriality and finite Galois descent.
- (2.6)–(2.8): regulator functoriality and construction of cycle maps with supports; degrees and weights checked.

**Siegel.1965 — Lectures on advanced analytic number theory**, Carl Ludwig Siegel; notes by S. Raghavan. Tata Institute lecture notes 23 (1965), reprint hosted by P. Garrett. Reprint pagination differs from the edition inherited by the original packet. [Public copy](https://www-users.cse.umn.edu/~garrett/m/mfms/notes_2013-14/Siegel_AdvAnNoTh.pdf). Read 2026-10-06. SHA-256 `97db8ec4f8477bea009f9264d17dfd4b76e9d6bd529c31316df4a07499f88643`.

- §1 Theorem 1 and proof, first Kronecker limit formula; §3 Theorem 2 and complete proof, second limit formula.
- §5 Theorem 3 and its Mellin/Poisson proof. Use theorem/section locators rather than inherited pp.17,40,69.

**Brunault.2005 — Valeur en 2 de fonctions L de courbes elliptiques**, François Brunault; appendix by Loïc Merel. arXiv:math/0602186v1, 155 pages; appendix printed and PDF pp.143–155 [Public copy](https://arxiv.org/pdf/math/0602186v1). Read 2026-10-06. SHA-256 `8fd73faba5db08328c2884d9f35b79bc528145428766444f3eb8097f3b494fb7`.

- Merel appendix pp.143–155 in full: definitions, Theorem A, Corollary 2, formulaire §2, Proposition B, Mellin calculation §3, Petersson Theorem C and proof, Theorem D and proof.
- Brunault chapter 3 is inherited from the accepted packet; the present pass uses that packet’s declaration statements rather than claiming a new complete reading of chapter 3.

**Brunault.2007 — Valeur en 2 de fonctions L de formes modulaires de poids 2 : théorème de Beilinson explicite**, François Brunault. Bull. Soc. Math. France 135 (2007), 215–246; version of record [Public copy](https://www.numdam.org/item/10.24033/bsmf.2532.pdf). Read 2026-10-06. SHA-256 `58f538cb38704615de15dee95a688dd576cd44513c118a41e434bde7e3a21b73`.

- Introduction pp.215–218: regulator conventions, Theorem 1.1, Remark 1.2, Question 1.3, Theorem 1.4. Bars lost in extracted text are read using the inherited corrected statement.

**Shimura.1977 — On the periods of modular forms**, Goro Shimura. Mathematische Annalen 229 (1977), 211–221, DOI 10.1007/BF01391466. Göttingen GDZ page scans, pp.211–214 read. SHA256 below identifies the volume IIIF manifest, not an article PDF. [Public copy](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002314584). Read 2026-10-06. SHA-256 `9527f45f13c9a0fd66ec49fd8b1b252bceaa3a129c6ddf19e07ab30fc978a132`.

- pp.211–214: Theorem 1 period algebraicity; Lemma 1 modular-symbol generators; Theorem 2, complete Fourier/period contradiction argument; the following two-prime even-character remark.
- Manifest: https://manifests.sub.uni-goettingen.de/iiif/presentation/PPN235181684_0229/manifest?version=29486bf2; article scans are volume sequence positions 217–220. Theorem 1 and Lemma 1 invoke the earlier 1976 paper, whose proofs were not read here.

Not publicly read in this pass: Bloch’s Chapter VIII Lemma 5.2 used for the general version of SS 1.3.1, and Shimura’s earlier 1976 proofs behind his 1977 Theorem 1 and generator lemma. The former is avoided by the explicit full-level correction; the latter remains within the PS.1 period adapter recorded in G6. The regular-model and supersingular comparison statements are extracted from SS and requested from their owners; their underlying Deligne–Rapoport/Katz–Mazur/Carayol proofs are not claimed newly read here.
