# Independent review: Automorphic forms on reductive groups

**Completed review; verdict: needs_changes.** Issue #359, job
`REV-AutomorphicFormsOnReductiveGroups`; Codex session `codex-CRfBlG`,
6 October 2026. This session did none of the blueprint planning. The original
pass was submitted by Claude session `claude-OpNE3H` in PR #6704, commit
`95483aad`.

All 90 nodes and the entire original suggested file were checked at the
assigned **target** granularity. Clear errors are corrected in place. Twenty
nodes remain unverifiable at their claimed proof/supplier boundary, and the
suggested file does not cover the packet's signatures and tests. These are
reasons for `needs_changes`, independently of the packet's honest partial
coverage. The verdict does not reject a completed pass merely for having open
stages. The seven former `planned` rows overstated their prototype and supplier
coverage; each now has a precise `partial` continuation list. Every node remains
`unchecked`, and none of this work is claimed to be implemented.

## Counts

| Item | Result |
| --- | --- |
| Nodes | 90: 26 definitions, 18 constructions, 46 theorems; none added or removed |
| Node verdicts | 56 corrected, 14 verified, 20 unverifiable |
| Changed node records | 66; an unverifiable node may also contain a clear correction |
| API / unit tests | 236 / 167; all 44 definitions/constructions retain at least three planned tests |
| Planets | 30, unchanged; at most six in each stage |
| Baseline | 34 original declarations read at the pins; 2 genuine tensor/colimit building blocks added |
| Sources / node citations | 30 / 157; five public sources and five citations added |
| Requests / gaps | 40 / 18, formerly 38 / 9 |
| Source findings | 10: nine confirmed, E8 rejected; E10 is a published Harris correction |
| Coverage | Seven partial stages, zero planned or closed |
| Suggested-file correspondence | Eight packet main names represented, with partial specialization; seven exact named packet tests |

The counts of API items and tests are specifications in the packet, not executed
formal unit tests. The correspondence inventory below makes the shortfall
explicit.

## Corrections and mathematical limits

### AF.0: functions, growth and convolution

- The GL1 compact-open example is the congruence kernel **inside the units**,
  rather than an unrestricted `1 + N Zhat`. LF levels refer to the finite
  factor. The no-unit assertion for smooth convolution needs a positive
  dimensional archimedean group; the trivial discrete case is an exception.
  The finite idempotent is `vol(J)⁻¹ 1_J` for a specified Haar measure.
- The proposed GL1 Gaussian failed Schwartz decay as `x → 0`. Replace it by
  `exp(-π(x² + x⁻²))`, whose zero-order supremum is `exp(-2π)`.
  Modulus-character growth exponents depend on the chosen height; `|Re(s)|`
  belongs to the explicit standard maximum height convention.
- A positive filtered degree operator can contain a constant term (`1 + X`).
  Vanishing on constants therefore uses the augmentation ideal. Constant-term
  formation is a map, not an inclusion. Cuspidal negative-power estimates are
  on Siegel sets modulo the split centre.
- Convolution uses a continuous moderate-growth function. Differentiation
  transferred onto the kernel uses the minus left derivative and its genuine
  enveloping-algebra anti-involution. The corrected nonmoderate GL1 example
  gives an actual divergent integral; an arbitrary nonzero Schwartz kernel
  was not enough. A continuous nonsmooth example replaces the discontinuous
  one inconsistent with the stated hypotheses.

### AF.1a and AF.1: pairs and real representations

- Pair/module compatibility includes the differentiated K action and the
  Ad-covariance identity. A general theta-stable parabolic need not contain
  all of the compact Lie algebra. The Hodge stabilizer `K^h` contains
  `A_infinity` and is noncompact. The compact supplier pair uses
  `(p_h/a_infinity, K^h/A_infinity)` on centrally balanced coefficients;
  the actual comparison is a named gap, not an implicit type conversion.
- Local K-finiteness with smooth finite orbit spans does not assert that the
  whole module has countable dimension. For GL_n(C) **as a real group**, the
  complexified Lie algebra is `gl_n(C) ⊕ gl_n(C)`. Cup products include the
  coefficient flip in graded commutativity. Smoothing, invariant forms and
  the prototype van Est scope are finite dimensional; the more general
  quasi-complete theorem remains a separate obligation.
- Relative Ext requires the relative Koszul/PBW resolution. Exact compact
  invariants alone do not construct it. Smooth Frechet representations need
  completeness, metrizability, joint continuity and genuine smooth vectors;
  a representation by individually continuous operators is insufficient.
  The G-continuous norm example uses `(1+|n|)!` for both signs of the K index.
- For SL2 at the trivial infinitesimal character there are four irreducibles:
  the trivial module, the two weight-two discrete series, and the odd
  normalized principal series at parameter one. Normalized reducibility is
  `ν ∈ Z`, `ν ≡ ε+1 (mod 2)`, checked against Casselman.
- Tempered and discrete-series coefficient tests fix a unitary central
  normalization. Discrete series require a Cartan compact modulo the split
  centre, equivalently the rank criterion after subtracting its dimension.
  Standard parabolics in Langlands classification include `P=G` for tempered
  data; they are not restricted to cuspidal parabolics.
- Every element outside C× in W_R squares to `-|z|²`, which proves
  nonsplitting. Knapp's freely readable §§2–4 were located and inspected for
  the real/complex GL_n correspondence; §5 supplies general reduction context.
  This removes the false availability assertion without pretending to have
  audited a complete general classification proof.

### AF.2 and AF.3: automorphic and cuspidal modules

- A(G) has the `(g,K) × G(A_f)` action. General archimedean translation does
  not preserve K-finiteness; the example needs a noncentral translation.
  The whole A(G) is not claimed admissible. Harish-Chandra finiteness fixes a
  finite K-isotypic projector and a cofinite central ideal, not an arbitrary
  idempotent. The adelic/classical dictionary needs the actual component
  stabilizers and disjoint decomposition.
- A restricted **tensor** product is a module colimit of finite tensor
  products, not Mathlib's restricted product of points. Its prerequisites now
  use `PiTensorProduct` and `Module.DirectLimit`. Nonunital algebra transitions
  still require idempotent corners. Spherical invariants are bounded by one;
  zero is permitted. Eisenstein examples have nonzero Fourier/Whittaker
  coefficients without asserting genericity of every constituent.
- Zhang's rendered page six says **Q-bar**, not Q. Hilbert Fourier expansions
  use a totally positive multi-index, rather than one q variable except over Q.
- `Q\A` has the indicated measurable fundamental-domain parametrization,
  not a topological product with `[0,1)`. The adelic Heisenberg quotient is not
  itself a finite dimensional nilmanifold; its finite-level real quotients are.
- Pointwise constant terms are defined for continuous functions on the
  compact unipotent fibre. Ambient local integrability does not ensure every
  fibre restriction is integrable. `P=G` gives the identity constant term;
  only proper parabolics occur in the cusp condition. Fubini/transitivity uses
  base `N_Q ∩ M_P` and fibre `N_P`, with compatible quotient measures.
- Rapid decay is stated on Siegel sets modulo the split centre. The E4
  nonexample is its unitary adelization; square integrable residues are not
  ruled out. Essentially cuspidal norm twists are distinguished from the
  unitary cuspidal L2 realization. In the SL2 Bruhat calculation `NgN`
  contains `t(c)w`, which still conjugates the two unipotent groups.
- The Maass prototype lacked smoothness and its Laplace equation. It is
  removed pending the actual differential operator, Bessel and Hecke inputs.
  The cited DIT passage does not establish the proposed Selberg lower bound;
  that unsupported acceptance assertion is removed.

### AF.4: algebraic and coherent cohomology

- Highest weights for a general reductive algebraic group require its
  character lattice and integration. LieHighestWeight Layers 4 and 9 plus
  ReductiveGroups Layer 1 do not by themselves prove this. The coefficient
  field splits the restriction of scalars and contains all relevant embedding
  values. Pinned chamber existence supplies existence, not uniqueness.
- Buzzard–Gee's twisting element theta has simple-coroot pairings one;
  the character actually used is `theta-rho`. Theta itself is not asserted
  central. Bare L-algebraicity is distinguished from the additional
  Chenevier–Taibi parameter restrictions.
- With `D_k(μ)=D_k(0)⊗|det|^(μ/2)`, the coefficient highest weight `(a,b)`
  satisfies `a-b=k-2`, `a+b=-μ`. Unitary `D_k(0)` is cohomological in this
  algebraic sense only for even k; `D_k(2-k)` pairs with `Sym^(k-2)` for all
  k. There is no arbitrary compact-component twist of the algebraic
  coefficient. The common parameter purity weight is μ, not universally
  k-1 in the unitary convention.
- The tempered cohomology range uses the quotient by the split centre, with
  a balanced coefficient, or the equivalent enlarged compact-mod-central
  group. Raw GL1 relative cohomology has degrees zero **and one**; its central
  quotient has only zero. Compactness modulo the whole real centre alone
  does not imply the Q-split-centre invariant `ell0=0`. The Vogan–Zuckerman
  node is narrowed to the verified equal-rank Hermitian scope of its supplier.
- Coherent coefficients extend to the Hodge parabolic with p-minus acting
  trivially. For SL2 with p-minus weight -2, holomorphic `D_k+ ⊗ chi_-k`
  contributes degree zero, and antiholomorphic `D_k- ⊗ chi_(k-2)` degree one.
  These coefficients agree only at the weight-one limit. BHR parameter
  conversion is made explicit rather than described as a vague restriction
  of `sigma+rho`. Positive-similitude and full disconnected GSp4 conventions
  still need resolution.
- Large weights are quantified by a positive bound on `-lambda1`. The alleged
  E8 counterexample has been rejected: the four GSp4 Siegel Kostant
  representatives have lengths 0,1,2,3, with no two of length one. The
  parameterized `(kappa,w)` uniqueness is preserved; stronger
  uniqueness-from-degree is not certified. Harris's separate general
  other-degree vanishing claim has a published counterexample/correction,
  recorded as E10. It must not be extended to the full disconnected group.
- Coefficient lattices are compact-open stable, with transported arithmetic
  component actions, rather than globally G(F)-stable. The lattice orbit
  argument uses an open **setwise** stabilizer. General rank-one integral
  lattices can be nonprincipal fractional ideals; the principal example is
  restricted to Q with a finite-adelic scalar.
- Aut(C) twists the smooth finite part, not a continuous archimedean action.
  The classical newform field comparison uses the cohomological finite-part
  normalization; unitary square-root factors cannot be silently ignored.
  General rational cuspidal-cohomology summands remain ALS/AS obligations.
- Torsion eigenclass data include both the class and its eigenvalue system:
  a nonfaithful cyclic class need not determine the system uniquely. A
  maximal kernel uses the finite residue image (or a surjective field map in
  the abstract prototype). Integral `H^1(Gamma,Z)=Hom(Gamma,Z)` is torsion
  free; Bianchi torsion belongs to H1 homology or H2 cohomology. The former
  blanket mod-p lifting claim is replaced by its precise model/base-change
  prerequisites.

### AF.5: dictionaries and algebraic modular forms

- A GL1 conductor is the minimal ideal in the standard principal-unit
  filtration, not a largest open subgroup. GL2 uses the rotation matrix
  `[[cos,sin],[-sin,cos]]` and the positive-determinant adelization domain.
  Holomorphic f is bounded at cusps; `y^(k/2)|f|` need not be bounded for
  Eisenstein forms. The raising/lowering convention and the source Casimir
  correction are explicit. Newform multiplicity one imports ModularForms
  Layer 5 separately from the Layer 4 newform packaging.
- Prime right translation satisfies `R_p phi_f=p^(1-k/2) phi_(T_p f)`.
  Thus `p^(-1/2) R_p` on the already unitary adelization has eigenvalue
  `a_p/p^((k-1)/2)`, with no extra determinant twist. Diamonds use inverse
  right translation. Right coset representatives and inverse rational
  pullback are specified, not hidden in a scalar assertion.
- Algebraic modular forms require both compactness of `G_infinity/A_infinity`
  and finite-adelic discreteness of the rational centre. Full stabilizers are
  used; a neat level kills those finite groups, not merely their quotient by
  the centre. The coefficient action in the p-adic convention can have
  infinite image despite finite generation. Weighted Hecke operators require
  extension to the chosen semigroup. Rational/p-adic comparison is made for
  algebraic coefficients, not an arbitrary inertial type.
- The definite quaternion count is an **ideal class number**, not a type
  number. Constants are cuspidal because there are no proper rational
  parabolics. GL1/Q and GL1 over an imaginary quadratic field meet the
  stated compact-mod-A condition; the excluded higher archimedean-rank tori
  are distinguished. The central action is matched before the compact
  dictionary. An unspecified density statement is removed. Langlands
  Lemma 3 identifies the nonroutine central-translation finiteness proof
  dependency; finitely many commuting differential operators do not prove it.

## Full node ledger and change journal

This is also the record of every changed node field. IDs below omit the common
`AutomorphicFormsOnReductiveGroups:` prefix. “Unverifiable” records a specific
boundary; it does not mean every assertion in that node is wrong. The packet's
`review.checked` contains the same ninety individual explanations.

| Node | Verdict | Changed fields | Check / correction |
| --- | --- | --- | --- |
| AF.0/smooth-adelic-function | corrected | acceptance | Definition sound; fix GL1 compact-open example to kernel on units; prototype arbitrary DerivedAction cannot assert differential covariance. |
| AF.0/adelic-test-functions | corrected | statement, acceptance | Algebraic tensor/Hecke framework sound. No-unit claim requires nondiscrete archimedean group; finite idempotent requires Haar measure; LF topology level notation needs repair. |
| AF.0/adelic-schwartz-space | corrected | acceptance, tests | GL1 Gaussian lacks decay at zero; use exp(-pi*(x^2+x^-2)); discriminating inverse-height test missing in Lean; left/right derivatives and topology incomplete in prototype. |
| AF.0/moderate-growth | corrected | tests | Moderate growth definition verified; exponent for modulus character depends on height, standard max height needed for claimed \|Re(s)\|. |
| AF.0/uniform-moderate-growth-space | corrected | acceptance, api, tests | Uniform-growth derivative test needs augmentation ideal; constant term is a map not inclusion; cusp all-negative growth must be modulo split centre, not whole adelic group. |
| AF.0/growth-translation-differentiation | verified | none | BPCZ Proposition 2.5.5 matches translation/differentiation estimates, Ad(y)^-1 conjugation and uniform exponent. |
| AF.0/convolution-to-uniform-growth | corrected | statement, proofSteps, acceptance | BPCZ Proposition 2.5.3 matches convolution; derivative transfer sign, continuous test hypothesis, explicit divergent nonmoderate example require clarification. |
| AF.0/finite-hecke-action | verified | none | Finite Hecke action is finite double-coset convolution with Haar normalization; pinned modular-form slash APIs are special cases. |
| AF.1a/gk-pair | corrected | statement, hypotheses, sources | Pair needs differentiated compact action and adjoint compatibility; general theta-stable parabolic need not contain all k_C. Wockel citation is real cochains; formatting checked. K^h is noncompact; the compact-pair supplier needs the split-central quotient comparison on balanced coefficients. |
| AF.1a/gk-module | corrected | hypotheses | Local K-finiteness does not imply countable-dimensional decomposition; require smooth finite-dimensional K action and derivative compatibility. Prototype omits both. |
| AF.1a/relative-lie-cochain-complex | corrected | sources | Relative Chevalley-Eilenberg differential, disconnected component invariants, and SL2/O2 examples checked against Wockel section 3. |
| AF.1a/relative-cohomology-functoriality | corrected | statement, acceptance | Cup product graded commutativity involves flip of coefficient tensor; GLn(C) cohomology example must take real Lie algebra then complexify; relative Koszul/Ext proof supplier missing. |
| AF.1a/differentiable-cochains | corrected | statement, hypotheses | Finite-dimensional smoothing comparison and the compact-open exponential-law bridge checked; narrow the statement, leaving the wider quasi-complete coefficient hypotheses as an explicit source gap. |
| AF.1a/invariant-forms-complex | corrected | statement, hypotheses | Invariant V-valued forms evaluated at identity give relative cochains and correct differential; de Rham/manifold exterior-form gap remains disclosed. Restrict coefficients to the verified finite-dimensional scope. |
| AF.1a/van-est-isomorphism | corrected | statement, hypotheses | Wockel section 3 plus section 2 comparisons establish finite-dimensional van Est; relative normalization needed before differentiation; maximal compact/disconnected assumptions retained. |
| AF.1a/cartan-iwasawa-malcev | verified | none | Almost-connected Lie group maximal compact and Euclidean quotient statement correct; general structure proof is openly a source gap; reductive supplier read. |
| AF.1a/van-est-acceptance | verified | none | Compact/vector/complex GLn compact-dual/disconnected GL2 checks correct when Lie algebra of GLn(C) is over R. Higher compact-dual computation needs its stated proof supplier. |
| AF.1/real-points-lie-group | verified | none | Real points use the closed-subgroup theorem and algebraic/smooth Lie comparison, not a bare topological group. Finite-components argument requires semialgebraic finiteness. |
| AF.1/real-reductive-group | corrected | prerequisites, acceptance | GSp4 Hodge stabilizer contains the split centre and is not maximal compact. Distinguish full K=GSp4(R) intersect O4, positive-component U2, and K^h=R_{>0}U2. Prototype Cartan involution data insufficient. |
| AF.1/k-finite-vectors | corrected | sources | Compact continuous K actions, Haar projectors, algebraic K-finite direct sum and completed Peter-Weyl decomposition kept distinct; Haar completeness hypotheses checked. Correct Definition 5.10 locator to printed p.26 of the inspected 2015 PDF. |
| AF.1/admissible-gk-module | corrected | none | Harish-Chandra category follows BK4.3; finite-dimensionality must be a proposition, not the tautology that a natural-valued finrank is finite. Prototype pair omits derivative compatibility. |
| AF.1/infinitesimal-character | verified | none | Harish-Chandra isomorphism must import reductive extension LieHighestWeight9; pinned vermaCentralCharacter is semisimple with PBW hypotheses. Central normalization checked. |
| AF.1/harish-chandra-admissibility | corrected | acceptance, sources | SL2(R) trivial infinitesimal-character example omitted irreducible odd principal series I(sgn,nu=1). Casselman public notes 10.7-10.8 give four constituents/classes including D2 plus/minus. |
| AF.1/principal-series | corrected | hypotheses | Fix normalized SL2 induction f(a_tg)=t^(nu+1)sgn^epsilon; reducibility iff nu integral and nu=epsilon+1 mod2. Generic prototype lacks C-infinity and coefficient-dual pairing hypotheses. |
| AF.1/casselman-embedding | unverifiable | none | Embedding statement matches BK4.4. General finite-length embedding does not follow from irreducible coinvariant argument alone; full Casselman proof remains an explicit gap. |
| AF.1/sf-representation | corrected | none | SF means smooth jointly continuous representation on complete metrizable locally convex Frechet space. Original prototype only first differentiability and WithSeminorms, missing all three analytic requirements. |
| AF.1/g-continuous-norms | corrected | hypotheses, tests | G-continuous norm needs G realization of exact HC module as K-finite smooth vectors, not just dense K-equivariant map. Negative factorial example must use (1+abs(n))!, not n n!. |
| AF.1/casselman-wallach-globalization | unverifiable | none | BK equivalence has real reductive G, its genuine maximal compact pair and Frechet moderate smooth objects. Arbitrary-group prototype theorem is false; omitted faithfully pending supplier structures. |
| AF.1/dixmier-malliavin | unverifiable | hypotheses | Factorization statement checked in BK/BPCZ/Jiang-Zhang; original proof remains unread. Arbitrary measure and arbitrary smooth-vector predicate invalidate prototype. Single-term K-finite claim needs HC smoothing, not DM alone. |
| AF.1/real-reductive-representation-theory | verified | none | Irreducible admissible category and compact/GL1/dual tests checked, conditional on genuine compatible pair. |
| AF.1/tempered-square-integrable | corrected | hypotheses | Tempered and discrete coefficients modulo split centre require unitary central character/unitarization; otherwise GL1 quotient test incorrectly classifies nonunitary norm powers as tempered. |
| AF.1/discrete-series | corrected | statement, hypotheses | Modulo A_G criterion is rank(g_C)-dim(A_G)=rank(k_C); rank equality alone excludes GL1(R) incorrectly. Parametrization must include split-central character. |
| AF.1/langlands-classification | corrected | statement, hypotheses | Correct standard-parabolic scope and allow P=G for tempered data. Public Knapp §§2–4 supplies the GL_n classification and §5 the general reduction context; it is not a full proof of the general classification. |
| AF.1/weil-group-real | corrected | hypotheses | Weil-group relations checked; j order4 alone does not prove nonsplitting. Every element outside C* squares to a negative real scalar. Faithful excerpt needs bars restored. |
| AF.1/archimedean-llc-gln | corrected | sources | Public Knapp archimedean LLC source found; compare parameter powers, infinitesimal-character shifts and Dk(mu) twist exponent mu/2. Existing claim source unavailable is false. |
| AF.1/gl2-real-discrete-series | verified | none | Dk(mu) weight actions, reflection, Casimir k(k-2)/4 and central scalar mu checked directly against Getz 6.5. Complex central parameter is harmless extension of printed real parameter. |
| AF.1/vogan-generic-unitary-dual | unverifiable | none | Generic unitary dual statement checked as quoted in Jiang-Zhang Appendix B; full Vogan proof remains gap. Genericity owner AL3 must be precise. |
| AF.2/automorphic-form | corrected | acceptance | Five defining conditions verified. Noncompact translate counterexample needs a noncentral element; central noncompact translations preserve K-finiteness. |
| AF.2/automorphic-forms-uniform-growth | unverifiable | none | Uniform growth relies on nonroutine Harish-Chandra smoothing lemma; approximate identity route is not a proof without a precise prerequisite. Existing source gap retained. |
| AF.2/smooth-automorphic-forms | unverifiable | none | BPCZ smooth automorphic space verified mathematically. Fixed-level globalization/topology needs genuine Frechet supplier, not induced arbitrary action prototype. |
| AF.2/harish-chandra-finiteness | unverifiable | hypotheses | Fixed finite K-types and cofinite central ideal are essential; arbitrary idempotent prototype can be identity and does not imply finiteness. HC proof source and AA reduction prerequisites unresolved. |
| AF.2/adelic-classical-bijection | unverifiable | hypotheses | Componentwise dictionary needs the actual stabilizers and disjoint component decomposition; prototype arbitrary Gamma and surjective cover do not supply a bijection. |
| AF.2/automorphic-forms-module | corrected | hypotheses, sources | A(G) is a (g,K) x G(A_f) module, generally not stable under all G_infinity. Module needs K/U(g) covariance and all finite-action commutations. Noncompact counterexample needs noncentral g. Correct Definition 5.18 locator to printed p.29 of the inspected PDF. |
| AF.2/automorphic-representation | unverifiable | sources | Subquotient convention checked against Langlands/Borel-Jacquet distinction. Admissibility follows for irreducible cyclic ideal/type, not by claiming whole A(G) admissible. Correct Definition 5.18 locator to printed p.29 of the inspected PDF. |
| AF.2/restricted-tensor-product | corrected | prerequisites | Restricted tensor colimit is not Mathlib RestrictedProduct. Replace baseline use with PiTensorProduct and Module.DirectLimit, after pinned statements checked. Nonunital algebra transitions require idempotent corner convention. |
| AF.2/spherical-dimension-one | verified | none | Spherical invariants <=1 conditional on hyperspecial commutative Satake algebra and irreducibility; no invariants is permitted, consistent with RT26. |
| AF.2/flath-factorization | verified | none | Flath theorem and spherical distinguished vectors checked in Getz7.5. Finite and archimedean irreducibility suppliers remain explicit requests. |
| AF.2/nongeneric-automorphic | corrected | acceptance | Constants give nongeneric/noncuspidal example for isotropic GL2; Eisenstein forms should be claimed to have a nonzero Whittaker coefficient, not every subquotient generic. |
| AF.2/holomorphic-sl2-forms | corrected | statement | Rendered Zhang page6 has Q-bar, not Q. Correct rational structure to Q-bar; Hilbert q-expansions need multi-index totally-positive exponents, single q only for Q. |
| AF.3/unipotent-quotient-compact | corrected | hypotheses, acceptance | Compact unipotent quotient proof uses composition series and compatible quotient measure. Q\A represented measurably by Zhat x [0,1), not a topological product; adelic Heisenberg quotient not a finite-dimensional nilmanifold. |
| AF.3/constant-term | corrected | hypotheses | Pointwise constant-term convergence holds for continuous functions on compact unipotent quotient; locally integrable ambient function may not restrict integrably to every fibre. Allow top parabolic for phi_G=id, proper only in cusp test. |
| AF.3/constant-term-transitivity | corrected | proofSteps | Fubini base is quotient of N_Q intersect M_P and fibre N_P; original explanation reversed them. Compatible normalized quotient measures essential. |
| AF.3/cusp-form | verified | none | Proper-parabolic vanishing definition, a.e. L2 version, maximal standard test and closure verified conditional on correct parabolic/measure supplier. |
| AF.3/anisotropic-cuspidal | verified | none | Anisotropic modulo F-centre iff no proper rational parabolic; AA compactness modulo split centre imported, not duplicated. |
| AF.3/cusp-form-rapid-decay | unverifiable | hypotheses | Rapid decay is on Siegel sets modulo split centre, with unitary/fixed central behavior. Quotient Schwartz seminorms and HC proof source remain gaps; arbitrary-set Lean theorem is false. |
| AF.3/cusp-forms-square-integrable | corrected | hypotheses, acceptance | Square-integrability modulo central character needs quotient hypotheses. Blanket Eisenstein-not-L2 test excludes L2 residues incorrectly; use holomorphic E4. Smoothness converse requires elliptic regularity. |
| AF.3/cuspidal-spectrum-discrete | unverifiable | none | Arthur cuspidal discrete spectrum statement checked; compact kernel/Hilbert-Schmidt estimate is a nonroutine proof input, not a consequence of finite volume alone. |
| AF.3/cuspidal-automorphic-representation | corrected | hypotheses | Cuspidal representation unitary convention must restrict central characters/twists to unitary; nonunitary twists belong to essentially cuspidal category. Prototype does not require W itself stable. |
| AF.3/sl2-generation | corrected | proofSteps | Bruhat calculation gives t(c)w, not w, in NgN; conjugation yields lower N and elementary generation. Local-depth statement needs RG2.4 or explicit unresolved request. |
| AF.3/sl2-fourier-vanishing | verified | none | Zhang13.6 level and unit-index hypotheses checked; Fourier uniqueness suffices, no absolute convergence for arbitrary continuous functions claimed. |
| AF.3/maass-cusp-forms | unverifiable | acceptance | DIT normalized Maass operators/Fourier coefficients checked. Claimed Selberg-Roelcke bound not in cited passage; remove unsupported acceptance claim. Prototype omits actual Laplace equation and smoothness. |
| AF.4/algebraic-weight | corrected | statement, hypotheses, proofSteps | Splitting field must split Res_{F/Q}G and contain embedding values, not only G/F. Highest-weight algebraic group classification is not merely ReductiveGroups1 comodules. |
| AF.4/infinitesimal-character-of-weight | corrected | none | Dominant weights uniqueness requires root-system fundamental domain; pinned existence of chamber member insufficient. Reductive Harish-Chandra extension and central coordinates must remain explicit. |
| AF.4/c-l-algebraic | corrected | statement, sources, api | Buzzard-Gee twisting element is weight theta with coroot pairings1; actual twist theta-rho, not a central character theta. GLn twist is (n-1)/2 determinant. CT definition not equivalent to bare L-algebraicity. |
| AF.4/cohomological-representation | corrected | statement, acceptance, api, tests | For Dk(mu), coefficient (a,b) requires a-b=k-2 and a+b=-mu. Dk(0) cohomological only even k, with determinant correction; Dk(2-k) pairs with Sym^(k-2). Algebraic coefficient unique, no arbitrary K-component twist. |
| AF.4/wigner-lemma | unverifiable | hypotheses | Wigner lemma follows natural central action on relative Ext with genuine antipode; prototype accepts arbitrary algebra endomorphism, hence false. Relative Koszul/Ext justification missing. |
| AF.4/l0-q0-invariants | corrected | hypotheses, tests | Compact modulo all centre does not imply ell0=0 if real centre exceeds A_Q; compact group test valid. ResPGL formula and absolute complexified rank convention checked. |
| AF.4/borel-wallach-tempered-range | corrected | statement | Tempered cohomology range uses K_infinity^0 A_infinity or g/a; raw GL2 (g,SO2) adds central degree and contradicts stated range. Require central-balanced coefficient. |
| AF.4/vogan-zuckerman | corrected | hypotheses | Ichino-Prasanna7.1 covers equal-rank Hermitian scope, not arbitrary real reductive group with compact Cartan. Restrict or provide general Cartan t+a classification; original proof source remains gap. |
| AF.4/gln-tempered-cohomological | corrected | acceptance | BCG Remark1.2 checked. Raw gl1 relative cohomology has degrees0 and1; quotient by A has only0. Keep raw/quotient convention explicit. |
| AF.4/clozel-purity | corrected | hypotheses, acceptance | Clozel purity common parameter weight depends on determinant twist: Dk(mu) has p+q=mu, not k-1 independent of s. State normalization and AL3 genericity prerequisite. |
| AF.4/hermitian-positive-system | corrected | statement, hypotheses, api | Hermitian K^h includes split centre; compact K is different. Mod-centre rank convention and fixed compact Borel choice checked; E3 confirmed in its narrow forced-compact-choice sense; the selected source convention is retained. Correct the rank criterion and Hodge pair to their split-central quotient versions. |
| AF.4/coherent-relative-cohomology | corrected | statement, hypotheses, proofSteps, acceptance, api | Coefficient must extend to p_h with p^- acting trivially. For SL2 chosen p^- weight-2, antiholomorphic degree1 coefficient is chi_(k-2), not chi_-k; holomorphic degree0 uses chi_-k. K^h/A_∞ is the compact supplier group; the quotient comparison is explicitly required. |
| AF.4/gsp4-discrete-series | unverifiable | hypotheses | Four closed chambers and three limit families checked; compact-wall exclusion correct. Positive-similitude K^h versus full GSp4 component convention needs explicit supplier-compatible resolution. |
| AF.4/bhr-coherent-cohomology | unverifiable | statement, proofSteps, acceptance | BHR parameter conversion must be specified exactly; vague restriction of sigma+rho is not sufficient. SL2 degree1 coefficient has same mismatch as coherent construction. |
| AF.4/mirkovic-tempered-coherent | unverifiable | hypotheses, sources | Mirkovic statement as quoted needs equal-rank Hermitian group, compatible K^h and coefficient. Full proof source remains gap. |
| AF.4/bhr-large-weight | unverifiable | hypotheses | Large-weight threshold needs quantified bound and source sign conventions; original gaps honest, but claims derived from unconfirmed errata require repair. |
| AF.4/harris-limits-gsp2g | unverifiable | statement, hypotheses, sources | Public Harris §3.4–3.5 and Goldring–Koskivirta statement/correction read. E7 rational cone confirmed; E8 rejected because the asserted GSp4 same-length counterexample is false. Full parameter/chamber uniqueness and disconnected-component interpretation remain gaps; no degree-concentration claim is extrapolated. |
| AF.4/holomorphic-ds-sp2n-unn | verified | none | Scholze5.1 holomorphic DS scalar parameter ranges checked; metaplectic/GLn LLC not asserted as this node. |
| AF.4/coefficient-lattices | corrected | statement, hypotheses, proofSteps, tests | J-stable lattice is not globally G(F)-stable: arithmetic component stabilizers preserve transported lattice. Rank1 OE lattices may be nonprincipal fractional ideals; use Q or ideal statement. |
| AF.4/rationality-field | corrected | hypotheses, acceptance | Aut(C) twist belongs to finite-part representation; discontinuous automorphisms do not twist archimedean continuous actions. Modular eigenvalue field requires algebraic/cohomological normalization. |
| AF.4/clozel-rationality | unverifiable | none | Clozel rationality source excerpts are context rather than precise theorem; GLn cohomological algebraic scope verified conditionally, general G rational cuspidal Hecke summand is unresolved supplier assertion. |
| AF.4/torsion-hecke-eigenclasses | corrected | statement, hypotheses, acceptance, tests | Integral H1(Gamma,Z)=Hom(Gamma,Z) is torsion-free; Bianchi torsion example must use H2 or homology H1. Eigenclass over O/lambda^m does not uniquely determine eigen-system without faithful cyclic class; carry system as data. Maximal kernel needs finite image/surjectivity. |
| AF.5/gl1-dictionary | corrected | statement, hypotheses, sources | GL1 character polynomial decomposition checked; conductor is ideal characterized by standard principal unit subgroups, not largest open subgroup. The cited excerpt needs literal PDF wording repair. |
| AF.5/gl2-classical-to-adelic | corrected | hypotheses | Adelization transformation and central inverse nebentypus checked. SO2 rotation sign must match r_theta=[[cos,sin],[-sin,cos]]. Suggested file uses opposite sign; positive determinant domain explicit. |
| AF.5/gl2-dictionary | corrected | statement, hypotheses, proofSteps | Moderate growth implies f bounded at cusps, not y^(k/2)\|f\| bounded for Eisenstein forms. Raising constant and irreducibility require exact conventions/newform multiplicity-one import; Casimir source misprint confirmed. |
| AF.5/gl2-hecke-normalisation | corrected | statement, proofSteps | Right cosets and inverse rational pullback give p^(1−k/2) exactly. Correct normalized eigenvalue uses p^(−1/2)R_p on the already unitary adelization, with no extra determinant twist. Classical diamonds correspond to inverse right translation. |
| AF.5/algebraic-modular-forms | corrected | statement, hypotheses, proofSteps, acceptance | AMF requires discrete rational centre/compact-at-infinity condition, full stabilizers, coefficient action extending beyond J for weighted Hecke formula, and p-adic rather than locally constant coefficients. Class number differs from type number. |
| AF.5/algebraic-modular-forms-structure | corrected | statement, hypotheses, proofSteps, acceptance | Finite stabilizers require actual finite-adelic discreteness, not just compact modulo centre; neat level kills finite stabilizers only. Definite quaternion constants are cuspidal since no proper rational parabolics. Torus exclusion must match A_infinity definition. |
| AF.5/transport-compatibilities | unverifiable | statement, proofSteps | Weil restriction/products compatible after Lie/K/central data matched. Density statement has no specified topology; remove it. Generalized central-character decomposition needs Langlands Lemma3, not merely a vague finitely-many-operators argument. |

Other packet edits: status and summary now state partial coverage; all seven
coverage rows have stage-specific remaining work. Four baseline `provides`
descriptions are narrowed; the original pin metadata is retained and the two
added entries record their check provenance. Numdam source/version URLs use the working HTTPS `www` host
with unchanged PDF hashes; Getz–Hahn and Buzzard–Gee read-section metadata is
corrected. Five public source/version entries are added. Three existing request
scopes are corrected and two are added. Original gap descriptions are updated
for the sources actually read and nine gaps are added. All original source
findings gain individual independent verdicts and E10 is added. The complete
independent review object is new. No restructure proposal, planet or original
node ID is changed.

The suggested file is replaced by the faithful expressible subset described
below. The new report and handoff are the other changed deliverables. The
read-only reader and atlas/upstream documents were not edited.

## Pinned baseline audit

Every original declaration was opened at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, including the surrounding section
hypotheses. None of the original names was nonexistent. Near matches are not
treated as full analytic or representation-theoretic implementations.

The four corrected descriptions concern `ContRepresentation` (operator
continuity versus joint continuity), `vermaCentralCharacter` (split
Killing-semisimple/PBW/Cartan hypotheses), `haarAverage` (normed complete
coefficients), and `lieSubalgebraOfSubgroup` (span of exponential directions,
with embedded-subgroup comparison imported). `exists_mem_dominantChamber`
does not prove uniqueness; its consumers are corrected. `RestrictedProduct`
is removed from the tensor node's prerequisites, while its valid adelic-point
baseline entry is retained. `PiTensorProduct` and `Module.DirectLimit` are the
two added entries. No baseline declaration is deleted.

| Declaration and pinned source | Actual contribution / boundary |
| --- | --- |
| [mathlib:ContMDiff](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Geometry/Manifold/ContMDiff/Defs.lean) | C^n maps between manifolds with corners (ContMDiff I I' n f); used for smoothness at the archimedean places. |
| [mathlib:ContRepresentation](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Continuous/Basic.lean) | A monoid homomorphism into continuous linear endomorphisms; each operator is continuous. Joint continuity of the G action is an additional condition, not a structure field here. |
| [mathlib:CuspForm](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/Basic.lean) | Cusp forms: slash-invariant, holomorphic and zero at every cusp. |
| [mathlib:ExteriorAlgebra](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean) | The exterior algebra of a module (as the Clifford algebra of the zero form), with its graded pieces ⋀[R]^q M. |
| [mathlib:GroupLieAlgebra](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Geometry/Manifold/GroupLieAlgebra.lean) | The Lie algebra of a Lie group as the tangent space at 1, with its Lie algebra structure via invariant vector fields. |
| [mathlib:HasCompactMulSupport](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Support.lean) | Compact (multiplicative) support; the additive form HasCompactSupport is generated from it by to_additive. |
| [mathlib:IsCompactOperator](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Normed/Operator/Compact/Basic.lean) | Compact operators: preimage of a compact set is a neighbourhood of 0. |
| [mathlib:LieAlgebra.rank](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Lie/Rank.lean) | The rank of a finite free Lie algebra (via the characteristic polynomial of ad); for a reductive complex Lie algebra, the dimension of a Cartan subalgebra. |
| [mathlib:LieGroup](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Geometry/Manifold/Algebra/LieGroup.lean) | Lie groups: groups with C^n manifold structure and C^n multiplication and inversion. |
| [mathlib:LieModule](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Lie/Basic.lean) | Lie modules over a Lie algebra (bracket compatible with scalars; LieRingModule supplies the action). |
| [mathlib:LieSubalgebra](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Lie/Subalgebra.lean) | Lie subalgebras of a Lie algebra. |
| [mathlib:Matrix.GeneralLinearGroup](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean) | GL(n, R) as the units of the matrix ring. |
| [mathlib:Matrix.SpecialLinearGroup](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean) | SL(n, R) as matrices of determinant one. |
| [mathlib:ModularForm](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/Basic.lean) | Modular forms for a subgroup Γ of GL(2,ℝ): slash-invariant, holomorphic and bounded at every cusp. |
| [mathlib:NumberField.IdeleClassGroup](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/AdeleRing.lean) | The idele class group 𝔸_K^×/K^× of a number field. |
| [mathlib:NumberField.InfinitePlace](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean) | Infinite places of a number field, with nrRealPlaces and nrComplexPlaces. |
| [mathlib:NumberField.InfinitePlace.card_add_two_mul_card_eq_rank](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean) | nrRealPlaces K + 2·nrComplexPlaces K = [K:ℚ]. |
| [mathlib:Representation](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Basic.lean) | Linear representations G →* (V →ₗ[k] V) of a monoid on a module. |
| [mathlib:RestrictedProduct](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/RestrictedProduct/Basic.lean) | Restricted products Πʳ i, [R i, A i] of families with respect to a filter (cofinite for adelic constructions). |
| [mathlib:RootPairing](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/RootSystem/Defs.lean) | Root pairings (root data/root systems) with roots, coroots and reflections. |
| [mathlib:SlashAction](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/SlashActions.lean) | The slash action class; the weight-k action of GL(2,ℝ)^+ on functions on ℍ with Mathlib's det^{k−1} j^{−k} normalisation. |
| [mathlib:Subalgebra.center](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Algebra/Subalgebra/Basic.lean) | The centre of an algebra as a subalgebra; applied to U(𝔤_ℂ) it is Z(𝔤). |
| [mathlib:TopRep.homogeneousCochains](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean) | Homogeneous continuous cochains of a topological representation, as a cochain complex of topological modules. |
| [mathlib:UniversalEnvelopingAlgebra](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Lie/UniversalEnveloping.lean) | The universal enveloping algebra of a Lie algebra, with its universal property (lift). |
| [mathlib:continuousCohomology](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean) | Continuous cohomology of a topological representation as homology of the homogeneous continuous cochains. |
| [tauceti:HeckeRing.GL2.heckeSlashModularFormEnd](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/HeckeSlash/ModularForm.lean) | The double-coset Hecke operator acting on modular forms for a congruence subgroup (bundled endomorphism). |
| [tauceti:HeckeRing.GL2.twistedHeckeSlashModularFormCharEnd](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/ModularForm.lean) | The twisted double-coset Hecke operator on modular forms with nebentypus character χ (bundled endomorphism of the χ-eigenspace). |
| [tauceti:TauCeti.Lie.lieSubalgebraOfSubgroup](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Geometry/Lie/Subgroup/LieAlgebra.lean) | Lie span of real exponential directions whose one-parameter subgroups lie in the subgroup. The embedded closed-subgroup comparison and complexification require their separate LieGroups supplier theorems. |
| [tauceti:TauCeti.dominantChamber](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/Chamber.lean) | The closed dominant chamber of a base of a root pairing. |
| [tauceti:TauCeti.exists_mem_dominantChamber](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/Chamber.lean) | Every weight is Weyl-conjugate into the closed dominant chamber. |
| [tauceti:TauCeti.haarAverage](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Compact/Averaging.lean) | Normalized compact-group Haar average for the normed complete coefficient setting of the pinned file (finite-dimensional coefficients satisfy it); not an unrestricted locally convex integral. |
| [tauceti:TauCeti.peterWeylBasis](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Compact/PeterWeyl.lean) | The Peter–Weyl Hilbert basis of L²(G) by normalised matrix coefficients, for a skeleton of the unitary dual of a compact group. |
| [tauceti:TauCeti.vermaCentralCharacter](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Lie/HighestWeight/CentralCharacter.lean) | Central character for the split Killing-semisimple Lie algebra under its PBW/Cartan hypotheses. The general reductive extension (including arbitrary central weights) is an imported LieHighestWeight Layer 9 target, not supplied by this declaration alone. |
| [tauceti:lieMap](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Geometry/Lie/Functor.lean) | The Lie functor on smooth homomorphisms: the differential at 1 as a Lie algebra map between left-invariant derivations. |
| [mathlib:PiTensorProduct](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean) | Tensor product of an indexed family of modules; use finite-place tensor factors with its tprod/lift/reindex API. |
| [mathlib:Module.DirectLimit](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Colimit/Module.lean) | Module colimit for linear transition maps, with of/lift/universal property; directed-system hypotheses are needed for the canonical union description. |

The reviewed library audit was read for all seven layers. None is marked fully
built. Existing manifolds, Lie algebra/enveloping algebra, continuous cochains,
adelic rings, compact averaging and classical modular forms are imported.
General smooth differential forms, relative pair cohomology, globalizations,
automorphic dictionaries and the analytic estimates are not manufactured from
those near matches.

## Public sources, locators and excerpts

The cited passages and their hypotheses were inspected for all ninety nodes;
this is not a claim to have read every page of each paper or each proof cited
by those papers. Original PDF hashes matched the available bytes, including
the two Numdam scans after host correction. New hashes and versions are in
`sources` and `sourceVersions`; the open published Goldring–Koskivirta HTML
article is identified by DOI and has no artificial PDF hash.

Of 157 final excerpts, 142 match the extracted text after Unicode/whitespace
normalization. The other fifteen were checked by the actual surrounding text
or scanned page: mathematical superscripts and intervening formula layout
(Arthur, Getz–Hahn, Wockel), line-break hyphenation (Arthur, BPCZ and Getz–Hahn),
the Knapp and Harris scans, and the published Goldring–Koskivirta HTML formula.
This mechanical count is a reproducibility aid, not a replacement for checking
hypotheses. The pair/cochain and GL1 excerpts were repaired to literal short
wording. Definition 5.10 is on printed p.26 and Definition 5.18 on p.29 in the
inspected 2015 Getz PDF, not p.25/p.27. The Harris locator distinguishes printed
p.63 from PDF p.75.

| Source/version | Inspected scope and use |
| --- | --- |
| [getz-hahn](https://sites.math.duke.edu/~jgetz/aut_reps.pdf) — Lecture notes, version of 13 March 2015 (89 pp.), author-hosted PDF | §3 Hecke algebras and Definition 3.10, pp. 16-19; §5 smooth vectors, K-finite vectors and (g,K)-modules, pp.21–29, including Definition 5.10 p.26 and Definition 5.18 p.29; §6 automorphic forms, Definitions 6.7-6.15, Theorem 6.10, §6.4 Lemma 6.19, pp. 29-33; §7 restricted tensor products and Flath's theorem, pp. 34-38; §8 Gelfand pairs and Proposition 8.6, pp. 38-40; §10.1 Weil groups and GL1 reciprocity, pp.45–47 |
| [arthur-trace](https://www.claymath.org/library/cw/arthur/pdf/62.pdf) — Harmonic Analysis, the Trace Formula, and Shimura Varieties, Clay Math. Proc. 4 (2005), 1-263; Clay PDF | §1 adelic groups and Haar measure, pp. 7-13; §12 cuspidal functions and Theorem 12.1, pp. 63-66; §13 height functions (13.2)-(13.4), rapidly decreasing and uniformly tempered functions, pp. 69-71 |
| [bernstein-kroetz](https://arxiv.org/abs/0812.1684v3) — arXiv:0812.1684v3 (16 April 2013); Israel J. Math. 199 (2014) 45-111 | §1 Introduction and Theorem 1.1, pp. 2-4; §2 G-continuous norms, Sobolev norms and Remark 2.19 (Dixmier-Malliavin), pp. 5-13; §4 Harish-Chandra modules, Theorem 4.2, p. 21; §§5, 7, 8 statements (Theorems 5.5, 7.1, 8.1) |
| [langlands-notion](https://publications.ias.edu/sites/default/files/notion-ps.pdf) — Automorphic Forms, Representations and L-functions, Proc. Sympos. Pure Math. 33, Part 1 (1979), 203-207; IAS archive PDF | Whole note, pp. 1-7: constituents of induced representations, Proposition 2 |
| [wockel-vanest](https://arxiv.org/abs/1401.1037v1) — arXiv:1401.1037v1 (6 January 2014) | §1 recap of topological group cohomology, pp. 3-7; §2 Propositions 2.7-2.10, pp. 8-11; §3 relative Lie algebra cohomology, Remark 3.1, Lemma 3.2 and Theorem 3.3 (van Est), pp. 11-13 |
| [vogan-zuckerman](https://www.numdam.org/item/CM_1984__53_1_51_0.pdf) — Compositio Math. 53 (1984), 51-90; Numdam scan | §§2, 5-6: theta-stable parabolics, the modules A_q(lambda), Theorem 5.6 and Proposition 6.19 (as quoted in Ichino-Prasanna §7.1) |
| [franke98](https://www.numdam.org/item/ASENS_1998_4_31_2_181_0.pdf) — Ann. Sci. École Norm. Sup. (4) 31 (1998), 181-279; Numdam | §§1-2 spaces of functions of uniform moderate growth (scanned text, read for orientation only) |
| [zhang21](https://arxiv.org/abs/1909.02697) — Ann. of Math. 193 (2021), no. 3; arXiv:1909.02697 | §1.2 notation on automorphic forms (1.5)-(1.13); §13.3 Lemma 13.6 and its proof |
| [jiang-zhang20](https://arxiv.org/abs/1508.03205v4) — Ann. of Math. 191 (2020), no. 3; arXiv:1508.03205v4 | Appendix A, proof of Proposition A.1 (Dixmier-Malliavin), arXiv p. 84; Appendix B, proof of Theorem B.2 (Vogan's generic unitary dual), arXiv p. 86 |
| [gan-ichino18](https://arxiv.org/abs/1705.10106v3) — Ann. of Math. 188 (2018), no. 3; arXiv:1705.10106v3 | §1.1, §5.1, §6.1-6.2 (archimedean parameters), arXiv pp. 2-24 |
| [dit16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf) — Ann. of Math. 184 (2016), no. 3, 949-990; publisher PDF | §5, (5.6)-(5.11), pp. 961-963 |
| [kaletha16](https://arxiv.org/abs/1304.3292v5) — Ann. of Math. 184 (2016), no. 2; arXiv:1304.3292v5 | §5.1 and §5.6 (real groups, infinitesimal equivalence) |
| [boxer-pilloni](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/higherhidaSiegel.pdf) — Invent. Math. 244 (2026); authors' preprint PDF | §1.3, Theorem 1.3.8 and the definition of C(kappa); §4.3, paragraph after Remark 4.3.10 |
| [cg18](https://arxiv.org/abs/1207.4224) — Invent. Math. 211 (2018); arXiv:1207.4224 | §1 (the invariant l0); §5.5 Remark 5.14; §8.4 (l0 and q0 for Res PGL(n)) |
| [cg20](https://arxiv.org/abs/1907.08691v1) — Duke Math. J. 169 (2020); arXiv:1907.08691v1 (main text) and arXiv:1907.08694v1 (appendix) | §2.1-2.2 (roots of GSp4, positive system); §5.3 (relative Lie algebra cohomology, Theorems 5.5-5.6, Definition 5.7); §7.2 proof of Theorem 7.11 |
| [cg20-appendix](https://arxiv.org/abs/1907.08694v1) — arXiv:1907.08694v1 | §A.3.1 (l0, q0 over an imaginary CM field; proof of Lemma A.3) |
| [pilloni20](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/complexhidatheorygsp4.pdf) — Duke Math. J. 169 (2020), no. 9; author's PDF | §5.1-5.3 (GSp4 roots, (limits of) discrete series, cohomological weights); §15.2 (limits of discrete series and Theorem 15.2.2.1) |
| [ichino-prasanna23](https://arxiv.org/abs/1806.10563) — Forum Math. Pi 11 (2023); arXiv:1806.10563 | §7.1 (Vogan-Zuckerman modules and their cohomology) |
| [bcg25](https://arxiv.org/abs/2309.15944) — J. Amer. Math. Soc. (2025); arXiv:2309.15944 | §1, Remark 1.2 |
| [ding25](https://arxiv.org/abs/2407.21237) — Publ. Math. IHÉS 142 (2025); arXiv:2407.21237 | §4.2.2 (definite unitary groups and spaces of p-adic automorphic forms) |
| [bpcz22](https://arxiv.org/abs/2007.05601) — Publ. Math. IHÉS 135 (2022); arXiv:2007.05601 | §2.5 (F- and SLF-representations, Dixmier-Malliavin (2.5.3.2)) |
| [chenevier-taibi20](https://arxiv.org/abs/1907.08783v1) — Publ. Math. IHÉS 131 (2020); arXiv:1907.08783v1 | §1.4 (split classical groups with discrete series); §2.1 (the Langlands correspondence for GL_n(R), W_R) |
| [bcgp21](https://arxiv.org/abs/1812.09269v3) — Publ. Math. IHÉS 134 (2021); arXiv:1812.09269v3 | §3.10, proof of Theorem 3.10.1 (archimedean inputs) |
| [bcgp25](https://arxiv.org/abs/2502.20645v1) — arXiv:2502.20645v1 | §1.8 (conventions); §5.7 (definite unitary groups and algebraic automorphic forms, 5.7.2) |
| [scholze15](https://arxiv.org/abs/1306.2070) — Ann. of Math. 182 (2015), 945-1066; arXiv:1306.2070 | §5.1, Proposition 5.1.1 |
| [knapp94](https://www.math.stonybrook.edu/~aknapp/pdf-files/motives.pdf) — Public version read by independent reviewer; see readSections | §§2–4, pp.399–406: GL_n(ℝ), GL_n(ℂ), Weil representations and the correspondence; scanned PDF inspected; §5, pp.407–408: general real-group reduction and packet/local-factor context (not a full general classification proof) |
| [casselman-sl2](https://personal.math.ubc.ca/~cass/research/pdf/Irr.pdf) — Public version read by independent reviewer; see readSections | §10, Propositions 10.7–10.8, pp.26–27: parity and reducibility |
| [buzzard-gee](https://arxiv.org/pdf/1009.0785v3) — Public version read by independent reviewer; see readSections | §2.3: C- and L-algebraicity and the rho shift; §5.2: twisting elements and the theta-minus-rho character; §7.2: GL_n and twisting normalizations; §8.1: conjectural general algebraic field-of-definition discussion, distinguished from the established regular cuspidal Clozel theorem (whose original proof remains unread) |
| [harris90-survey](https://www.jmilne.org/math/Books/AA1988b.pdf) — Public version read by independent reviewer; see readSections | Article pp.41–91 in Automorphic Forms, Shimura Varieties, and L-functions II (1990); scanned printed pp.58–63 inspected, especially §§3.1–3.5 |
| [goldring-koskivirta](https://link.springer.com/article/10.1007/s00222-019-00882-5) — Published open-access article, Inventiones mathematicae (2019), DOI 10.1007/s00222-019-00882-5 | Theorem 10.1.2, Remark 10.1.3, Corollary 10.1.4 (website cross-numbered subsection 15.1.3): retained contributing degree and Harris correction |

The Vogan–Zuckerman and Franke scans are orientation or cited-statement
evidence where recorded, not certificates that their nonroutine proof interiors
were read. Public Knapp and Harris statements improve the source boundary but
do not discharge Harish-Chandra, Casselman/globalization, relative Ext,
Borel–Wallach, BHR, Clozel or the spectral kernel proof chains. “Not read” is
the gap asserted here; this review does not assert that an unread book or paper
has no public copy.

## Source findings

Each of the ten packet entries has a verdict with `by` equal to this review.
The printed-version scope matters; no correction is silently transferred to
an unread publisher revision.

| Finding | Verdict | Independent reason |
| --- | --- | --- |
| E1 — getz-hahn, §6.4, Lemma 6.19 and Remark 6.20 (p. 33), repeated in §6.5 (p. 34); notes version of 13 March 2015 | confirmed | At k=2 the stated Casimir on the trivial infinitesimal character is zero, while (k²−1)/4 is 3/4. The same notes’ discrete-series computation gives k(k−2)/4; the 2015 text is the version reviewed. |
| E2 — getz-hahn, §8, proof of Proposition 8.6, p. 40 | confirmed | The spherical argument bounds the invariant dimension by one; irreducibles with no K-fixed vector have dimension zero. The literal proof sentence is overstrong. |
| E3 — cg20, §2.2, p. 810 (arXiv:1907.08691v1 p. 8) | confirmed | The condition fixing noncompact positive roots leaves a choice of compact Borel. Both compact signs give a positive system with the prescribed noncompact roots. The correction is a clarification of the asserted forced choice, not a change to the selected convention. |
| E4 — cg20, §5.3, p. 828 (arXiv:1907.08691v1 p. 21) | confirmed | The immediately following list has C₀,C₁,C₂,C₃ and the earlier chamber definition is §2.1. The quoted C₄ and Section 2.0.1 are typographical errors in the cited version. |
| E5 — pilloni20, §5.1.6, p. 22, and §15.2.1, p. 107 (author's PDF) | confirmed | The first inequality includes the compact wall λ₁=λ₂; the later printed region −λ₁≥λ₂>−λ₁ is empty. The intended region is −λ₁≥λ₂>λ₁. Scope is the author PDF, not an unread published text. |
| E6 — pilloni20, §15.2.2, Theorem 15.2.2.1(2), p. 108 (author's PDF) | confirmed | The theorem fixes λ₂=0 and λ₁<0; its subsequent application sets k=−λ₁−1 and k≥R−1. This identifies the intended large-weight bound −λ₁≥R. The positive-R impossibility argument is evidence of intent, not by itself a contradiction when R is unquantified. |
| E7 — boxer-pilloni, §1.3.3, p. 3 (authors' preprint) | confirmed | The parity character lattice need not contain ρ. In genus 2, ρ=(−1,−2;0) in BP coordinates fails the central parity condition. The later rational-cone definition resolves the integrality typo. |
| E8 — boxer-pilloni, §1.3.7, Theorem 1.3.8, p. 4 (authors' preprint) | rejected | The asserted GSp₄ counterexample is false: its four minimal Siegel Weyl representatives have lengths 0,1,2,3, so there are no two of length 1. The source labels the representation by full data (κ,w); same-degree representations with other parameter data do not disprove that parameterized uniqueness. Do not silently delete source uniqueness on this evidence. A stronger uniqueness-from-degree reading remains a stated gap. |
| E9 — ding25, §4.2.2, arXiv:2407.21237 p. 72 | confirmed | The next definition acts through the product of U_v for v∈S_p\{℘}; therefore W must be the tensor product over those places with product-invariant lattice. A single unspecified v cannot type that action. |
| E10 — harris90-survey, §3, Theorem 3.4, printed p.63 (PDF p.75) | confirmed | Checked the printed theorem and its published correction; full-group component restriction is necessary. |

E8 remains in the historical source-finding list with its rejection. Its former
correction must not be applied. E10 is an already published corrective finding,
not a claim of a new discovery.

## Closure, ownership and supplier audit

No lemma-level splitting was done in this target-level job. The existing
ninety-node target decomposition is retained. Nonroutine proof steps that do
not follow from the actual prerequisites are recorded as gaps. The packet
validator reports an acyclic internal graph; it cannot prove the mathematical
closure of those steps or the existence of external exports.

- The 204-node AdelicAlgebraicGroups packet was read at all 35 exact exports
  this packet uses: restricted Haar/splitting, rational and local points,
  central quotients, unipotent/adelic quotients, heights and reduction theory.
  Its partial `needs_changes` review means these are conditional supplier
  statements. AA height comparison must avoid a circular reliance on AF.1;
  retain the RS-04 polynomial-height ownership boundary.
- ShimuraData D3/D5 exact root-coordinate, Kostant representative, longest
  Levi element, rational chamber, rho/parity and Hodge-centralizer statements
  were read. They support the four lengths 0,1,2,3 and rational-cone correction.
  That packet's `needs_changes` verdict is not accepted formal closure.
- The AL packet has a K-Bessel plan at AL.0. Its current AL.3 has no exact
  genericity export matching the purity request; that obligation stays open.
  The requested SR, ALS, AS and RG2 stage texts were read in their campaign
  documents, but exact supplier packets/declarations were absent. No campaign
  promise is counted as a proved or accepted export.
- Tau Ceti LieGroups and the RepresentationTheory overview were read in full.
  The requested CompactGroups (0,2,5), ReductiveGroups (1,2,5,6,7),
  LieHighestWeight (4,7,9), RootSystems (4), GlobalNumberFields (5,9,10) and
  ModularForms (0,2,4,5,8G) layers were read at their stated scopes. Root-space
  decomposition also remains its existing LieHighestWeight Layer 1 import.
  These are existing roadmaps and have not been replanned or edited.
- The corrected requests separate ReductiveGroups Layer 1's comodule carrier
  from the highest-weight integration theorem, and LieHighestWeight Layer 4's
  semisimple hypothesis from the reductive central/character-lattice extension.
  The latter is an owner Part II extension, not a duplicated classification.
  ModularForms Layer 4 supplies newform/conductor packaging, Layer 5 supplies
  multiplicity one, and the added Layer 8G request supplies the algebraic
  finite-part field/conjugation comparison.
- The remaining thirty-eight original requests, including SR.0/1/3/4,
  ALS.0/1/3/5, AS.4/5, AL.0/3 and RG2.0a/4, are precise conditional input
  contracts. Future closure must compare the eventual declaration hypotheses,
  central normalization and component action with the consumer; a stage ID
  alone does not satisfy that check.

The retained AF.1b classification sub-layer and exported AMF ownership are
proposals in `restructure`, not manual atlas edits. Cross-roadmap stage-order
changes belong to the orchestrator.

The eighteen lasting gaps, with consumer IDs in the packet, are:

1. **Smooth differential forms on manifolds**: The invariant-form complex Ω^•(G/K; V)^G needs smooth V-valued differential forms of every degree on a manifold with the exterior derivative and the Poincaré lemma. Mathlib has forms only on normed spaces (Analysis/Calculus/DifferentialForm) and Tau Ceti only smooth two-forms; no roadmap of the atlas plans the smooth de Rham complex of a manifold. The van Est proof can bypass forms through the smooth cochain complex (Wockel §3) for the cohomological statement, but the layer's invariant-form target needs the de Rham complex.
2. **Cartan–Iwasawa–Malcev for non-reductive Lie groups**: For general Lie groups with finitely many components the existence and conjugacy of maximal compact subgroups and G/K ≅ ℝ^d (Cartan–Iwasawa–Malcev–Mostow) are stated with their proof route only; no freely readable proof source was read. All consumers in the atlas (BorelRegulators, Polylogarithms, ALS.5) use reductive G(ℝ), which is covered through ALS.0 and Tau Ceti LieGroups Layer 9.
3. **Dixmier–Malliavin proof source not read**: The original proof (J. Dixmier, P. Malliavin, Factorisations de fonctions et de vecteurs indéfiniment différentiables, Bull. Sci. Math. (2) 102 (1978) 305-330) was not read in this review; the node states the theorem as quoted by Bernstein–Krötz Remark 2.19, BPCZ (2.5.3.2) and Jiang–Zhang Appendix A, with the proof route only. A follow-up must read the proof and decompose the factorization of rapidly decreasing sequences.
4. **Langlands classification and discrete series proofs not read**: The proofs of the Langlands classification (Langlands, Math. Surveys Monogr. 31, 1989) and of Harish-Chandra's discrete series theorems (Acta Math. 113 (1965), 116 (1966)) were not read in this review. The nodes state the theorems as the cited papers use them. A follow-up must read a proof source (for example Knapp, Representation theory of semisimple groups, Chapters IX-XIV) and refine the two nodes, at lemma level, into Casselman's asymptotics, the standard intertwining operators and Harish-Chandra's character theory.
5. **Proof source for the archimedean local Langlands correspondence**: Knapp’s public author-hosted survey has now been read in §§2–4, pp.399–406, including the explicit GL_n correspondence. Its construction and theorem statement are available; a complete classification/proof-closure audit and the local factor bridge to AL.2 remain required. The earlier assertion that this survey is not freely available is removed.
6. **Vogan's unitary dual not read**: Vogan, The unitary dual of GL(n) over an archimedean field, Invent. Math. 83 (1986) 449-505, was not read in this review; the node records the statement as Jiang–Zhang (B.5) use it.
7. **Harish-Chandra's convolution lemma: proof source not read**: The lemma 'a K-finite Z(𝔤)-finite smooth function satisfies φ = φ * α for some α ∈ C_c^∞' (Harish-Chandra, Automorphic forms on semisimple Lie groups, LNM 62, 1968, Theorem 1; Borel–Jacquet §1.? in Corvallis I) is used with its proof route only: neither original proof was read in this review.
8. **Proof source for rapid decay of cusp forms**: The proof of rapid decay (Harish-Chandra, LNM 62 (1968), Lemma 10; Moeglin–Waldspurger, Spectral decomposition and Eisenstein series, I.2.18; Borel–Jacquet §4 in Corvallis I) was not read in this review; the node records the statement and the proof route through the estimate φ − φ_P on Siegel sets.
9. **Proof sources for Borel–Wallach, Blasius–Harris–Ramakrishnan, Harris, Clozel not read**: Borel–Wallach (Continuous cohomology…, 2nd ed., 2000), Blasius–Harris–Ramakrishnan (Duke 73, 1994), Harris (Perspect. Math. 11, 1990; J. Differential Geom. 32, 1990), Clozel (Motifs et formes automorphes, 1990), Pitale–Schmidt (IMRN 2009) and the full Vogan–Zuckerman proofs were not read; the nodes record statements from the papers that use them, at their locators. A follow-up reads these sources and refines the proofs. Independent review located Harris’s published survey in the public Milne-edited volume and read pp.58–63; Theorem 3.5 is now a primary statement citation. The Schmid/Williams/Mirković proof interiors, BHR, Clozel and the other proof sources remain unread. Goldring–Koskivirta supplies a published correction to Harris’s general degree-vanishing claim.
10. **Relative Ext and Wigner lemma closure**: Construct the relative Koszul/PBW resolution and prove its relative projectivity/exactness in the locally K-finite smooth compatible category before identifying relative cohomology with Ext. The finite-dimensional compact-group invariants functor supplies exactness but not this resolution.
11. **Faithful real representation prototypes**: The existing arbitrary-group/pair/action/measure signatures did not state the real reductive group, derivative compatibility, joint continuity, smooth Fréchet topology, or actual smooth-vector conditions. Removed those Lean sections rather than encode missing mathematics as Prop fields. Restore the actual supplier structures, then all packet API/test names and classification/globalization signatures. This is a prototype gap, not a new owner for those structures.
12. **Maass Laplacian prototype and source bound**: The former prototype had neither smoothness nor Δf=λf, so it described many functions that are not Maass forms. Restore the actual hyperbolic differential operator and normalized Hecke action. The DIT cited passage does not prove a Selberg–Roelcke lower bound; any such acceptance assertion needs its own primary source.
13. **Algebraic group highest-weight classification supplier**: LieHighestWeight Layer 4 classifies semisimple Lie algebra modules; Layer 9 retains arbitrary central Lie weights. To obtain rational representations of a general reductive algebraic group, impose the integral character lattice/isogeny constraint and prove integration. ReductiveGroups Layer 1 only supplies comodules. Request the additional theorem from the owner as a Part II extension; do not infer it from the existing Layer 1 statement.
14. **Coherent component and vanishing conventions**: Resolve the positive-similitude Hodge stabilizer versus the full disconnected group for all discrete/limit modules. Goldring–Koskivirta Theorem 10.1.2 and Remark 10.1.3 retain the one-dimensional contributing degree but explicitly warn that Harris Theorem 3.4 vanishing in every other degree is false already for full GL_2; connected semisimple groups are a valid special case. Do not extend degree concentration or uniqueness-from-degree beyond verified hypotheses.
15. **Central-translation finiteness proof**: Langlands On the notion of an automorphic representation, Lemma 3, supplies Z(𝔸)-finiteness, but explicitly sends its proof to Borel–Jacquet. Read that proof or supply a complete reduction-theoretic proof. Do not infer it from a finite list of commuting differential operators.
16. **Unverified or incomplete supplier exports**: AA and ShimuraData packets were read and have needs_changes reviews; their matching statements are conditional prerequisites, not accepted closure. SR, ALS, AS and RG2 campaign statements were read, but exact packet declarations were absent. AL.0 has a Bessel plan; AL.3 has no genericity node in the current packet. Preserve these precise requests, verify the eventual declaration/hypotheses and resolve the algebraic-group classification extension; do not count absent exports as supplied.
17. **Packet and suggested-file correspondence**: The review removes unfaithful arbitrary-data prototypes and keeps the expressible subset listed explicitly in the suggested file. The omitted packet definitions, API signatures and named tests must be restored against actual supplier types, with at least three discriminating tests per object. The file is deliberately not represented as satisfying the complete correspondence requirement; this is a reason for needs_changes.
18. **Compact-pair versus Hodge-stabilizer quotient comparison**: K^h is noncompact because it contains A_∞. On coefficients where A_∞ acts trivially, identify the Hodge relative cochain complex for (𝔭_h,K^h) with that for (𝔭_h/𝔞_∞,K^h/A_∞), including the differentiated inclusion and component action. Import the actual central group/Lie quotient from AA/ALS/LieGroups suppliers, then prove this comparison in AF.1a; a general θ-stable parabolic does not contain all of k, and a compact-pair structure cannot silently accept K^h.

## Six required red-team findings and the read-only reader

The six findings in `RT-AREA-automorphic-1.result.json` were checked against
both the packet and the relevant reader passages. The reader is not one of
this issue's writable deliverables; the mismatch is recorded for revision.

| Finding | Packet result | Reader result / required revision |
| --- | --- | --- |
| 2: archimedean classification and Weil/LLC prerequisites | AF.1 retains Weil groups, GL_n archimedean LLC and D_k; normalization and parity corrected; AL local-factor bridge conditional | AF.1 and proposed AF.1b own the material. Update real/complex Lie conventions, rank/central character, parabolic scope and the stale “Knapp not read” statement at lines 60, 1173 and 1240. |
| 25: Wigner, Borel–Wallach and Vogan–Zuckerman | Nodes exist; Wigner/Ext proof gap, central quotient range and verified VZ scope explicit | AF.4 lists them at line 1926, but its coefficient/range and central conventions must follow the corrections above. |
| 26: spherical dimension | AF.2 says dimension at most one and requests SR.4 commutativity; zero invariants permitted | Lines 1496–1512 already retain the <=1 convention and the zero-invariant example; preserve it. |
| 29: relative Lie algebra cohomology owner | AF.1a owns the actual complex and comparison; compact/Hodge quotient gap explicit | AF.1a ownership is correct. Replace the incompatible compact pair/Hodge stabilization convention and revise its derivative/Ext and van Est scope. |
| 30: rational structures and integral torsion | ALS.1/3/5 and AS.5 requested, with finite-part cohomological normalization and genuine integral eigenclass data | Lines 1926, 2456–2530 retain the owners but need the field-normalization, H1 torsion and eigenvalue uniqueness corrections. |
| 31: general algebraic modular forms | AF.5 is the owner, with the R18.3 definite-quaternion specialization; full stabilizers, coefficients and compact/discrete-centre scope corrected | Lines 2645–2708 need the class-number, p-adic action, stabilizer, torus and definite constants corrections. Preserve the outgoing general AMF interface. |

Other reader synchronization required: GL1 Gaussian (lines 185–189), uniform
growth and convolution (AF.0), real GSp4 compact versus Hodge stabilizer
(line 698), factorial norm (line 963), nongeneric Eisenstein wording (line 1549),
constant-term fibre hypotheses, Q-bar Hilbert coefficients, SL2 Bruhat and
coherent coefficient signs, E8 rejection/E10 correction (line 2373), the lattice
setwise-stabilizer argument (line 2419), bounded-cusp and prime-Hecke
normalization, and every corrected locator/source list. The reader's coverage
claims and signature lists must agree with the partial packet and the omission
inventory; merely copying its old text would restore known errors.

## Suggested Lean file and test correspondence

The original 2,342-line file was read in full. Many statements used arbitrary
actions, measures, projectors or pair data in place of the objects specified
by the packet. Examples include a Maass object without a Laplace equation,
an arbitrary differential action without group differentiation, an arbitrary
central endomorphism for Wigner's lemma, and an arbitrary idempotent for
Harish-Chandra finiteness. `sorry` can stand for a proof, but does not make those
definitions faithful.

The corrected 349-line file keeps genuine smooth/test functions, an explicitly
supplied-height growth predicate, finite tensors/module colimit, local stable
lattices, eigenclass data and Gross's rational AMF convention. Convolution,
Frechet topology, relative cohomology and classification are not recreated
with arbitrary opaque carriers. The AMF Hecke/trace signatures require actual
coset representatives; the decomposition requires actual distinct double
cosets and full stabilizer invariants. Its local lattice and abstract eigenclass
statements are explicitly partial specializations of the packet.

Eight main packet names occur: SmoothAdelicFunction, TestFunction,
HasModerateGrowth, RestrictedTensor, StableLattice, TorsionEigenSystem,
AlgebraicModularForm, and AlgebraicModularForm.equivSum. Their presence does not
certify a complete API or the adelic specialization. Seven exact named packet
tests are retained: smoothAdelicFunction_const, testFunction_zero,
hasModerateGrowth_const, restrictedTensor_finite, restrictedTensor_polynomial,
amf_zero, amf_trivial_coeff. The real norm-character, exponential nonexample,
lattice scaling and full-level constants are additional small-case checks,
not substitutes for the omitted packet examples.

The following inventory records every definition/construction's missing
signatures and exact named tests. Names omit their `Automorphic.` prefix.
All omitted main theorem signatures are likewise identified by the full node
ledger. No absence is counted as an executed test.

| Object | Main name represented | Missing API names | Missing packet test names |
| --- | --- | --- | --- |
| AF.0/smooth-adelic-function | yes, partial scope | SmoothAdelicFunction.derivAction, SmoothAdelicFunction.derivAction_conj | smoothAdelicFunction_gl1_example, smoothAdelicFunction_not_of_continuous |
| AF.0/adelic-test-functions | yes, partial scope | TestFunction.convolution, TestFunction.tmulEquiv, TestFunction.restrictedTensor, TestFunction.unitIdempotent, TestFunction.ofLocal | testFunction_idempotent, testFunction_no_unit, testFunction_local_compat |
| AF.0/adelic-schwartz-space | no | SchwartzFunction, SchwartzFunction.seminorm, SchwartzFunction.convolution, SchwartzFunction.ofTestFunction | schwartzFunction_gaussian_gl1, schwartzFunction_const_not, schwartzFunction_compact_group |
| AF.0/moderate-growth | yes, partial scope | none in name scan; check scope | hasModerateGrowth_abs_det, hasModerateGrowth_exp_not, hasModerateGrowth_classical_compat |
| AF.0/uniform-moderate-growth-space | no | UniformModerateGrowth, UniformModerateGrowth.seminorm, UniformModerateGrowth.mono, UniformModerateGrowth.hasModerateGrowth, UniformModerateGrowth.ofParabolic | uniformModerateGrowth_const, uniformModerateGrowth_gl1_character, uniformModerateGrowth_not_of_moderate, uniformModerateGrowth_arthur_compat |
| AF.1a/gk-pair | no | RelativeLieCohomology.Pair, RelativeLieCohomology.Pair.ofLieGroup, RelativeLieCohomology.Pair.ofSubalgebra, RelativeLieCohomology.Pair.Hom, RelativeLieCohomology.Pair.identityComponent | pair_compact, pair_gl2_O2, pair_not_without_k, pair_ofLieGroup_compat |
| AF.1a/gk-module | no | RelativeLieCohomology.GKModule, RelativeLieCohomology.GKModule.abelian, RelativeLieCohomology.GKModule.tensorFinite, RelativeLieCohomology.GKModule.restrict, RelativeLieCohomology.GKModule.ofContRepresentation, RelativeLieCohomology.GKModule.deriv_eq | gkModule_trivial, gkModule_sl2_weight, gkModule_not_locally_finite, gkModule_fd_compat |
| AF.1a/relative-lie-cochain-complex | no | RelativeLieCohomology.cochains, RelativeLieCohomology.cochains_eq_hom, RelativeLieCohomology.d_comp_d, RelativeLieCohomology.cohomology, RelativeLieCohomology.H0_eq_invariants, RelativeLieCohomology.disconnected, RelativeLieCohomology.d_lowDegree_compat | relativeCochains_compact, relativeCochains_vector_group, relativeCochains_sl2_trivial, relativeCochains_O2_component |
| AF.1a/differentiable-cochains | no | VanEst.continuousCochains, VanEst.smoothCochains, VanEst.continuousCochainsEquivMathlib, VanEst.smoothing_quasiIso, VanEst.cochains_map | continuousCochains_compact, continuousCochains_R, continuousCochains_discrete_not, continuousCochains_mathlib_compat |
| AF.1a/invariant-forms-complex | no | VanEst.invariantForms, VanEst.invariantFormsEquivRelative, VanEst.invariantForms_d, VanEst.invariantForms_componentAction | invariantForms_vector_group, invariantForms_compact, invariantForms_not_all_forms |
| AF.1/real-points-lie-group | no | RealReductive.realPoints, RealReductive.realPoints_lieAlgebra, RealReductive.realPoints_map, RealReductive.realPoints_Ad, RealReductive.realPoints_orbitMap, RealReductive.realPoints_finite_components, RealReductive.realPoints_GL_compat | realPoints_gl1, realPoints_trivial, realPoints_SO2_not_dense, realPoints_deligne_torus |
| AF.1/real-reductive-group | no | RealReductive.Datum, RealReductive.Datum.cartanDecomp, RealReductive.Datum.componentGroup, RealReductive.Datum.ofAlgebraic, RealReductive.Datum.conj | datum_GLn, datum_compact, datum_not_any_compact, datum_lie_compat |
| AF.1/k-finite-vectors | no | RealReductive.isotypic, RealReductive.kFinite, RealReductive.kFinite_eq_iSup_isotypic, RealReductive.kFinite_dense, RealReductive.kFinite_iff_lie, RealReductive.isotypic_map | kFinite_SO2_L2, kFinite_trivial, kFinite_not_all, kFinite_peterWeyl_compat |
| AF.1/admissible-gk-module | no | RealReductive.IsAdmissible, RealReductive.IsZFinite, RealReductive.HCModule, RealReductive.HCModule.abelian, RealReductive.HCModule.dual, RealReductive.HCModule.tensorFinite, RealReductive.HCModule.iff_zFinite | hcModule_trivial, hcModule_discrete_series_SL2, hcModule_tensor_not_fg, hcModule_finiteDim_compat |
| AF.1/infinitesimal-character | no | RealReductive.InfChar, RealReductive.infCharOf, RealReductive.infCharOf_eq_iff, RealReductive.HasInfChar, RealReductive.genEigenspace, RealReductive.infChar_highestWeight, RealReductive.infChar_casimir | infChar_trivial_gl2, infChar_weyl_invariant, infChar_k_weight, infChar_not_linear_action |
| AF.1/principal-series | no | RealReductive.principalSeries, RealReductive.principalSeries_kFinite, RealReductive.principalSeries_restrictK, RealReductive.principalSeries_map, RealReductive.principalSeries_dual | principalSeries_GL1, principalSeries_SL2_ktypes, principalSeries_not_irreducible, principalSeries_hc_compat |
| AF.1/sf-representation | no | RealReductive.SFRep, RealReductive.SFRep.kFinite, RealReductive.SFRep.smoothVectors, RealReductive.SFRep.derivAction, RealReductive.SFRep.SAF | sfRep_trivial, sfRep_principalSeries, sfRep_L2_not_smooth, sfRep_kFinite_compat |
| AF.1/g-continuous-norms | no | RealReductive.GContinuousNorm, RealReductive.sobolevNorm, RealReductive.SobolevLE, RealReductive.exists_gContinuousNorm, RealReductive.smoothCompletion_nuclear | gContinuous_finiteDim, gContinuous_principalSeries, gContinuous_not_arbitrary |
| AF.1/real-reductive-representation-theory | no | RealReductive.IrrAdmissible, RealReductive.IrrAdmissible.infChar, RealReductive.IrrAdmissible.dual, RealReductive.IrrAdmissible.twist | irr_compact, irr_GL1R, irr_dual_not_conj |
| AF.1/tempered-square-integrable | no | RealReductive.IsSquareIntegrable, RealReductive.IsTempered, RealReductive.IsEssentiallyTempered, RealReductive.IsSquareIntegrable.isTempered, RealReductive.IsTempered.twist_unitary | tempered_SL2_ds, tempered_trivial_not, tempered_compact, tempered_GL1 |
| AF.1/weil-group-real | no | RealReductive.WeilGroupReal, RealReductive.WeilGroupReal.norm, RealReductive.WeilGroupReal.irreducible_classification, RealReductive.WeilGroupReal.restrict_complex, RealReductive.WeilGroupReal.IsTempered | weilReal_j_sq, weilReal_ab, weilComplex_irreducible_dim_one, weilReal_not_split, weilReal_character_compat |
| AF.1/gl2-real-discrete-series | no | RealReductive.GL2.discreteSeries, RealReductive.GL2.discreteSeries_casimir, RealReductive.GL2.discreteSeries_ktypes, RealReductive.GL2.discreteSeries_irreducible, RealReductive.GL2.classification | gl2DS_casimir_k2, gl2DS_casimir_k12, gl2DS_lowest, gl2DS_not_k2_minus_1 |
| AF.2/automorphic-form | no | AutomorphicForm, AutomorphicForm.leftInvariant, AutomorphicForm.exists_level, AutomorphicForm.exists_ideal, AutomorphicForm.withCentralChar, AutomorphicForm.fixedType, AutomorphicForm.toUniformModerateGrowth | automorphicForm_const, automorphicForm_gl1_character, automorphicForm_log_not_eigen, automorphicForm_not_K_finite, automorphicForm_classical_compat |
| AF.2/smooth-automorphic-forms | no | SmoothAutomorphicForm, SmoothAutomorphicForm.kFinite_eq, SmoothAutomorphicForm.globalization, SmoothAutomorphicForm.rightTranslate | smoothAutomorphic_const, smoothAutomorphic_kfinite_compat, smoothAutomorphic_not_kfinite |
| AF.2/automorphic-forms-module | no | AutomorphicForm.gkModule, AutomorphicForm.finiteAction, GlobalHeckeModule, AutomorphicSubquotient, AutomorphicForm.heckeAction_compat | automorphicModule_trivial, automorphicModule_gl1, automorphicModule_not_G_infty |
| AF.2/automorphic-representation | no | AutomorphicRepresentation, AutomorphicRepresentation.multiplicity, AutomorphicRepresentation.multiplicity_finite, AutomorphicRepresentation.centralCharacter, AutomorphicRepresentation.smooth, AutomorphicRepresentation.twist | autRep_trivial, autRep_gl1, autRep_mult_not_one |
| AF.2/restricted-tensor-product | yes, partial scope | RestrictedTensor.algebra | restrictedTensor_not_full |
| AF.2/holomorphic-sl2-forms | no | SL2.HolomorphicForm, SL2.HolomorphicForm.qExpansion, SL2.HolomorphicForm.rationalStructure, SL2.HolomorphicForm.flat, SL2.HolomorphicForm.coefficient | sl2Hol_weight12, sl2Hol_negative, sl2Hol_flat_compat, sl2Hol_not_exp_growth |
| AF.3/constant-term | no | constantTerm, constantTerm_leftInvariant, constantTerm_rightTranslate, constantTerm_automorphic, constantTerm_top, constantTerm_const | constantTerm_const, constantTerm_gl2_eisenstein, constantTerm_cusp_compat, constantTerm_not_full_N |
| AF.3/cusp-form | no | CuspForm, CuspForm.constantTerm_eq_zero, CuspForm.iff_maximal_standard, CuspForm.submodule, L2Cusp, CuspForm.classical_compat | cuspForm_anisotropic, cuspForm_delta, cuspForm_const_not, cuspForm_eisenstein_not |
| AF.3/cuspidal-automorphic-representation | no | CuspidalRepresentation, CuspidalRepresentation.multiplicity, CuspidalRepresentation.toAutomorphic, CuspidalRepresentation.kFinite | cuspidalRep_gl1, cuspidalRep_delta, cuspidalRep_trivial_not, cuspidalRep_subquotient_not |
| AF.3/maass-cusp-forms | no | MaassCuspForm, MaassCuspForm.heckeOperator, MaassCuspForm.hecke_mul, MaassCuspForm.hecke_selfAdjoint, MaassCuspForm.fourierCoeff_neg, MaassCuspForm.toAdelic | maass_hecke_mul_prime, maass_eigenvalue_third, maass_constant_not, maass_norm_not_one |
| AF.4/algebraic-weight | no | AlgebraicWeight, AlgebraicWeight.IsDominant, AlgebraicWeight.rep, AlgebraicWeight.rep_dual, AlgebraicWeight.IsRegular, AlgebraicWeight.rep_highestWeight | algWeight_gl2_dim, algWeight_zero, algWeight_dual_gl3, algWeight_not_nondominant |
| AF.4/c-l-algebraic | no | IsLAlgebraic, IsCAlgebraic, isCAlgebraic_iff_isLAlgebraic_twist, isLAlgebraic_iff_of_rho_integral, IsAlgebraicCT_compat | algebraic_gl1, algebraic_trivial_gl2, algebraic_sl2_rho_integral, algebraic_maass_not |
| AF.4/cohomological-representation | no | IsCohomological, IsCohomological.coefficient, IsCohomological.infChar, IsCohomological.twist | cohomological_trivial, cohomological_D_k, cohomological_D1_not, cohomological_ip_compat |
| AF.4/l0-q0-invariants | no | ell0, q0, ell0_resPGL, ell0_PGL2, two_q0_add_ell0 | ell0_PGL2_Q, ell0_imag_quad, ell0_compact, ell0_not_split_rank |
| AF.4/hermitian-positive-system | no | Hermitian.compactRoots, Hermitian.noncompactRoots, Hermitian.IsHCPositive, Hermitian.hodgeParabolic, Hermitian.gsp4_roots | hermitian_sl2, hermitian_gsp4_count, hermitian_choice_not_forced, hermitian_pilloni_compat |
| AF.4/coherent-relative-cohomology | no | coherentCohomology, coherentCohomology_eq, coherentCohomology_L2, coherentCohomology_cusp_to_L2 | coherent_sl2_H0, coherent_trivial_module, coherent_not_gK |
| AF.4/gsp4-discrete-series | no | GSp4.chamber, GSp4.dsRep, GSp4.dsRep_dual, GSp4.IsRegularWeight, GSp4.IsLimitWeight, GSp4.limitWeight_families, GSp4.holomorphicLimit | gsp4_chambers_union, gsp4_limit_family, gsp4_cohomological_weight, gsp4_compact_wall_not |
| AF.4/coefficient-lattices | yes, partial scope | StableLattice.reduction | lattice_trivial, lattice_sym2, lattice_not_unique, lattice_chevalley_compat |
| AF.4/rationality-field | no | galoisTwist, rationalityField, IsFieldOfDefinition, rationalityField_le | rationality_trivial, rationality_gl1_finite_order, rationality_not_definition, rationality_modularForms_compat |
| AF.4/torsion-hecke-eigenclasses | yes, partial scope | TorsionEigenSystem.of_char_zero, TorsionEigenSystem.lattice_indep | torsion_trivial_coeff, torsion_reduction, torsion_not_lift |
| AF.5/gl2-classical-to-adelic | no | GL2.adelize, GL2.adelize_left, GL2.adelize_weight, GL2.adelize_level, GL2.adelize_central, GL2.adelize_slash_compat, GL2.adelize_injective | adelize_Delta_level, adelize_zero, adelize_weight_sign, adelize_slash_mathlib |
| AF.5/algebraic-modular-forms | yes, partial scope | AlgebraicModularForm.rationalEquiv, AlgebraicModularForm.baseChange | amf_definite_quaternion, amf_not_small_basechange |

This is a declaration-name inventory with explicit StableLattice namespace
handling, not an inference that similarly named declarations have equivalent
types. In particular, the packet's adelic/API/test scope must still be restored
and checked for each local or abstract specialization.

All thirty planet names were read. They are key definitions, constructions or
named theorems, not source locators; their lengths and per-stage limits pass the
packet checker. They are retained rather than generating a naming job.

## Validation and orchestrator decisions

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicFormsOnReductiveGroups.json`:
  **0 errors, 0 warnings**. JSON shape, scoped nodes, prerequisite references,
  internal graph, API/test counts, planets and coverage metadata pass.
- `lean-check research/blueprint/suggested/AutomorphicFormsOnReductiveGroups.lean`:
  **exit 0, zero errors, 38 warnings, all `sorry`**. The final file was checked
  without commenting any code or imports, using the pre-existing shared pinned
  Mathlib build. It imports only Mathlib modules. The pinned Tau Ceti source
  statements were independently read; this does not claim compilation of
  imported Tau Ceti objects or the missing analytic signatures. Available
  memory exceeded 20 GB; no build, cache download or language server was used.
- The deliverable-path/private-path intake check and `git diff --check` are
  run before submission. Only the packet, suggested file, this report and the
  job handoff change. No atlas promotion, issue closure or manual merge occurs.

The orchestrator should issue a revision using the corrected packet and this
ledger, including the reader as a writable deliverable. It should arrange the
existing owner exports for algebraic-group highest-weight integration, the
compact-mod-central/Hodge comparison, and the ALS/AS rational summand before
claiming closure. It should also propagate E8's rejection to the source
extraction that supplied it, and retain E10's known published correction.
These are requests to the orchestrator, not edits to another job's files.

No work remains to finish this independent review. A revision and subsequent
independent check are necessary before this blueprint can be accepted.
