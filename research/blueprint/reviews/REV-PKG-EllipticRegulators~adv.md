# Independent package review: EllipticRegulators

Issue #11069; reviewer Codex, session `codex-FHh5IB`; 2026-10-19. This session did not author or previously review the package. This report is also the handoff for the review; no packets were edited.

**Verdict: needs_changes.** The correctable mathematical and presentation defects described below are fixed. The remaining blocker is source verification of the Bloch-only truncation and CM constructions, including assertions about errors in that book. The authorized library does not contain the cited book. I did not obtain an unauthorized copy. The README now explicitly identifies this gap and treats the inherited locators as unverified. Numerical checks do not establish those general results or authenticate an erratum. This is a completed negative review, not an accepted package or a claim that its targets are formalized.

## Corrections applied

- **Projective-line companion (§3.10).** With the stated tame convention, the weighted tame logarithm has the sign of `J(β/α)`. The previous tame exponent was reversed. The scaled Steinberg relation also needs both entries scaled: putting `F = f/K`, expand `{f,K−f}` as `{F,1−F}+{K,1−F}+{F,K}+{K,K}`. The first term vanishes; the remaining weighted divisor logarithms vanish under the product-one conditions. Added the named general tame identity and a nonzero sign witness. For `f=(t−2)(t−3)/((t−1)(t−6))`, `g=(t−5)/(t−7)`, independently computed diamond and tame sums are respectively `−0.5746746306759741` and `−0.5746746306759742`; reflection gives `+0.5746746306759738`. A zero Steinberg sum cannot distinguish signs. Added `∂₀{t,2}=1/2` and the nonzero-entry restrictions in §§3.14–3.15.
- **Universal versus Brunault regulator (§5.14).** The divisor formula gives `r_E=conj(R_q)/2`; for compact classes the universal wedge coordinate is `r_D=2r_E=conj(R_q)`. Corrected the label in the CM normalization certificate; its two factors are now distinguished.
- **Character conjugations (§§7.6–7.9, 7.15).** PDF images, unlike the extracted text, show the bars. Corrected the divisor coefficient to `χ̄(v)`, primitive transform to `u_χ̂=τ(χ)u_χ̄`, diamond pullback to `χ̄(d)`, and the prime-level twist, Gauss denominator and homology eigenspace accordingly. For the order-five even character modulo 11 with `χ(3)=ζ₅`, a separate finite-sum computation gives `χ̂(3)=τ(χ)ζ₅⁻¹` with error below `5·10⁻¹⁵`; the unbarred alternative differs by more than 6. Quadratic examples do not detect this mistake.
- **Rational descent (§7.26).** A nonzero regulator does not survive an arbitrary unweighted trace: coefficient conjugation exchanges the entries of `{u_χ,u_χ̄}` and negates the symbol. Replaced that argument with named coefficient-field and all-embedding targets, the algebraic multiplier `a_χ`, and `Tr(a_χ⁻¹ξ_χ)`. Its regulator is `[ℚ(χ):ℚ]L(E,2)/(πi)`. The period is fixed while tracing algebraic coefficients. The input modular parametrization, primitive-character restrictions, and separate integrality step remain explicit.
- **Shimura interface (§7.30).** Replaced an undefined period normalization and a potentially zero imprimitive Gauss denominator by the associated primitive character, Shimura's coherent period system, the parity `u^{−χ(−1)}` at weight two, and its all-embedding algebraicity. Arbitrary independent period choices do not supply a coherent system. The trivial character displayed modulo 4 has Gauss sum zero, whereas its conductor-one primitive character has Gauss sum one. Imprimitive Euler factors are retained. The general character scope was preserved.
- **Missing light-definition documentation.** Added the coordinate formula and API for `torusCoord`, and exact order/period definitions, APIs and discriminating tests for `IsEllipticFunction` and `HasTorusDivisor`. Added the real-τ non-example, zero-function exclusion, and duplicate-point non-example. The algebraic Frobenius scalar is now stated over any field, matching Lean; its geometric uses still have characteristic zero and good-reduction hypotheses. Explained why the additive map in `WeightTwoBeilinsonRelation` is automatically rational-linear.
- **Sources and tests.** Corrected Siegel's second-limit proof locator and proof route, distinguished printed/PDF pages in Asakura–Chida, located footnote 10 precisely, and corrected M. Asakura's initial. Added proved Lean examples for the coordinate degeneracy, meromorphic predicates, Fourier phase/normalization, CM model discriminant, empty determinant witness, identity transfer, the nonzero Frobenius scalar and a positive common-scalar relation. All earlier tests remain.

## Scope, closure and duplication

Read the exemplar package, the current LocalGaloisGroups and ProfiniteArithmetic README/signature models, and the relevant current EllipticCurves and ModularForms boundaries. Checked all nine EllipticRegulators packets and their 151 target nodes against the package and the existing node-to-subsection inventory. All 143 numbered subsections and all 151 plan targets remain; the review adds interfaces and tests rather than dropping general targets. The packet inventory is input, not a table inserted into the roadmap.

The signature baseline remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Independently searched the current Tau Ceti library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, the current TauCetiRoadmap sources, and Completed sources by objects and operators: period lattices and orientation, regulator and cup pairings, real-analytic Eisenstein series, modular units, dilogarithms, Kronecker kernels, CM character transforms, syntomic/Deligne comparison, transfers and determinant lines. Included the nine newer roadmaps and all split OperatorTheory files, and ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts. Read the reviewed ER.1–ER.8 library-coverage entries. No additional target duplicates an existing definition or theorem, so there are **no removals**.

Existing material is already deferred to its owner: uniformization to ModularCurvesPartII; holomorphic modular forms and their L-functions/functional equations to ModularForms; reduction types to EllipticCurves; Siegel units and their pair symbol to KatoEulerSystems; general syntomic regulators and Coleman integration to their named suppliers. Holomorphic Eisenstein series do not supply the real-analytic two-variable family here. Number-field unit regulators, homological Kronecker pairings, and syntomic morphisms of rings are different objects from the proposed targets.

No `FoundationsAndLibraryIntegration` or `UPSTREAM:` placeholder remains. The existing move of Shimura's interface down from the consumer PeriodsAndSpecialValues PS.1 is preserved and corrected in §7.30; that consumer should import this interface. The roadmap lies outside the numbered Caraiani–Newton list; closure was checked against the stated stage contracts, without inventing a numeric tier. Absent heavy carriers remain README targets and in the closing Lean inventory. General base-field, complex-weight, all-embedding, oldform-multiplicity and transfer statements have not been replaced by their examples. Tate's thesis is not a supplier of any theorem here.

## Adversarial pass over the README

Each row covers the identities, definitions, API and conventions in that numbered subsection. “Retained” means no further defect found in the stated scope, not a formal proof. Exact algebraic boundary checks were performed directly. Existing long decimal special values were inspected as diagnostic tests and were **not all independently recomputed**. Book-dependent rows are explicitly marked **gap** even where their algebraic special cases pass. Cases such as characteristic p or a DVR apply only where the subsection's carriers admit them; complex-period theorems do not assert them.

| Statement | Instances or obstruction checked | Result / change |
|---|---|---|
| 1.1 Oriented period datum, τ, q, normalization, scaling | `(1,i)`, `(1,−i)`, scalar 1, scalar 0 | Positive imaginary ratio is essential; zero scaling excluded; retained. |
| 1.2 Normalized and multiplicative uniformization, torus coordinates | τ=i; T,S; τ real; `w=0,1+2i`; real locus with one/two components | Added explicit coordinate API, positive-imaginary domain and proved negative control. q never zero and has norm less than one. |
| 1.3 Homology, period comparison and intersection | Square lattice; swapped basis; nonzero differential | Intersection of `1,i` is +1; swapping reverses it. Comparison is supplied, not assumed from a matrix definition. |
| 1.4 SL₂ basis action | I,−I,S,T and inverse | −I fixes τ but negates normalized coordinates; matrix-entry convention retained. |
| 1.5 Conjugate periods | Square lattice; `1+i`; double conjugation | Ratio `−conj τ`, not `conj τ`; orientation restored by second-vector sign. |
| 1.6 Embeddings and total conjugation | Real embedding; one pair for ℚ(i) | Complex pair has both components; retained. |
| 1.7 Real periods and q sign | m=0,1; τ=i,1/2+i | q is respectively positive and negative; no positive-q assumption inserted. |
| 1.8 Primitive real cycles | m=0,1 | At m=1 anti-invariant generator `(−1,2)` has index two with the fixed generator. |
| 1.9 Multiplicative conjugation | z=i/2; z=0 | Image `e^π`, not `e^−π`; inversion includes conjugation. |
| 1.10 Differential for the regulator | Square and half-integral real lattices | Primitive fixed cycle has period one; transverse and primitive negative periods differ in the latter case. |
| 2.1 Deligne target | ℚ,ℚ(i); plus versus minus space | Dimensions 1,2; full embedding product would double them. |
| 2.2 Orbit equivalence | Real ε=0,1; complex pair; empty index | Minus eigenline and paired two-dimensional coordinate survive; diagonal complex pair fails. |
| 2.3 Dimension formula | ℚ,ℚ(i),ℚ(√2) | Gives 1,2,2 rather than counting complex places once. |
| 2.4 η comparison | Swap f,g; f=g; small puncture boundary | Alternating form vanishes on diagonal; factor i and boundary estimate retained. |
| 2.5 Symbol/torus regulator and meromorphic-divisor predicates | Constants 1,0; exp; empty divisor; duplicate points; Steinberg entries | Added missing predicate API/tests. Zero germs and coincident listed points excluded. Constant second entry is proved zero. |
| 2.6 Universal comparison | Compact symbol combination; normalization of η | `r_D=2r_E`, with no extra 2π; retained. |
| 2.7 Chern/cup/η constants | `{z,c}`, norm c≠1; unit-modulus non-torsion c | Residue `−2π log(norm c)`, tame `c⁻¹`; real-current and rational compact descent differ. |
| 2.8 Torsion lift ambiguity | Torsion difference; rationalization | Map to real vector space kills torsion; retained. |
| 2.9 Real coordinate | a(γ₂)=1; both ε; real orientation reversal | Coordinate −2π, regulator −i/2 when η-period is 1; orientation sign retained. |
| 3.1 Local D,J bounds | z=0 limit; small real and imaginary z | Continuous endpoint values understood; logarithmic modulus gives summable tails. |
| 3.2 Elliptic dilogarithm | x=1,−1; real q,x; shift qx; square distribution | Two-sided sum required; one-sided defect is −D(x). |
| 3.3 Companion and regularization | q-shift; norm x=1; unregularized two-sided sum | Bernoulli term cancels quadratic shift; divergent alternative remains a negative control. |
| 3.4 Kronecker summand | v=0,(1,0),(0,1),(2,0); τ=i | Values 0,1,−i,1/8 pin conjugate denominator; proved first/third cases retained. |
| 3.5 Fourier coefficients | Zero mode and axial modes | Zero constant; coefficients −y²/π and i/π at τ=i fix phase/prefactor. |
| 3.6 Reconstruction | Two-torsion; τ real; complex coefficients | Uniform cubic-kernel convergence needs Im τ>0; Green kernel cannot replace it. |
| 3.7 Modular change of basis | S,T,−I | S sends coordinates to `(b,−a)` and divides R by τ̄; retained. |
| 3.8 Green function | Mean zero; diagonal singularity; absolute-sum failure | Distributional series has logarithmic divergence in absolute value; no unjustified interchange. |
| 3.9 Goncharov function | P=Q; translation; swap P,Q | Alternation and `2R_ω=−conj R_q` agree with chosen diamond. |
| 3.10 Projective-line relation | Nonzero tame witness; `{t,2}`; scaled Steinberg | Fixed inverse tame sign and both-entry scaling; replaced vacuous sign check. |
| 3.11 Truncated theta products | Constant F; K=1; annular boundary on a zero | K≠0,1 and boundary-avoiding subsequence matter; **book-source gap**. |
| 3.12 Zeros and multiplicities | Repeated β; critical K; q-orbit translates | Simple-zero reduction explicitly required, not silently universal; **gap**. |
| 3.13 Uniform companion estimates | x versus qx; small M and ε limits | C_F correction cannot be erased; endpoint interpretation retained; **gap**. |
| 3.14 Companion Steinberg | Constant f; f=K; K=0,1; multiple zeros | Excluded zero entries; K=0 handled separately; continuity reduction remains target; **gap**. |
| 3.15 Dilogarithm Steinberg | Constant/zero entries; repeated roots | Added same entry restrictions; independent truncation route retained; **gap**. |
| 3.16 Descent to K₂ | Constants; Steinberg; permitted/nonpermitted lifts | Uses both real and imaginary relations; source gap in direct proof remains visible. |
| 4.1 Diamond convolution | `[1]⋄[3]` in ℤ/5; zero; reflection | Gives [2]; swap is reflection, not additive negation. |
| 4.2 Divisor formula | Constant entry, empty divisor; swapped entries | Half conjugation essential; no tame condition required; headline scope matches. |
| 4.3 Lift formula | Product-one lifts; one lift moved by q | Bernoulli cubic cancellation uses both degree and logarithmic moment zero; book locator unverified. |
| 4.4 Finite transform/duality | C=1,3; δ input; zero and character input | Added proved `exp(−2πi/3)/9` check; C=0 excluded by NeZero. |
| 4.5 Bloch-class regulator | C=1 has no nonzero torsion point; constant correction | C³ scalar, not C²; construction sourced only through supplier/book gap. |
| 4.6 Direct-sum convergence | Unit-circle row; x=1; complex weight | Closed-disc Li₂ and W(1)=0 avoid deleting boundary terms. |
| 4.7 Logarithmic term L | C=1; zero; character input; i times weight | Complex linearity preserves argument contribution; replacing log by log absolute value fails. |
| 4.8 Dilogarithmic term M | C=1,4; character; i times weight | Im applied before complex weighting; retained. |
| 4.9 Splitting M | ℓ=0 versus ℓ>0; inversion | Unit-circle endpoint correction M₂ retained; book attribution unverified. |
| 4.10 Bernoulli term | C=3 odd vertical difference; row absent | Horizontal series is nonzero for vertical difference, zero off row; retained algebra. |
| 4.11 Evaluation L | C=1,2 odd input; m=0 | Odd weights vanish in first two cases; omitted row is explicit. |
| 4.12 Forward sum | Nonzero row sum; complex scalar | H survives and Im stays inside scalar weighting. |
| 4.13 Unit-circle boundary | Same row weight; vanishing row sums | M₂=−H; deleting unit-circle values loses cancellation. |
| 4.14 Evaluation M | Zero weight; i times odd weight | Formula complex-linear with real-valued kernel cast before multiplication. |
| 4.15 Raw Fourier identity | w=mτ+n; m≠0 | Directly checked two-term kernel identity gives −2iy/(w²w̄); omitted row essential. |
| 4.16 Regularized Fourier identity | Horizontal row restored; C=1,2; i times weight | Bernoulli term restores full punctured lattice; Lean milestone matches. |
| 4.17 Bloch Fourier theorem | C=1,2; change to unitary normalization | C³ scales to C⁴ under changed transform; source-specific attribution remains gap. |
| 4.18 Transfer trace | Degree one; quadratic extension; two embeddings | Sum, not average; absolute source/target embedding bookkeeping retained. |
| 5.1 CM input and Hecke character | Gaussian curve; additive prime 2; nonmaximal order | All-local-factor maximal-order scope explicit; discriminant 64 now proved in Lean. |
| 5.2 Pairing/CM transform | Gaussian C=4; switched kernel | Independently found support `(1,1),(1,3),(3,1),(3,3)` and value 1+i; book comparison remains gap. |
| 5.3 Transform conventions | Delta input; C versus C² factor | Input coordinates swap, output does not; retained. |
| 5.4 Fourier theorem over O | Gaussian; zero and odd weights | Extra C from transform gives C⁴; raw/regularized distinction retained. |
| 5.5 Unit/distribution relation | ζ=i and inverse; norm-one endomorphism | Factor −i for i-action agrees with cubic kernel; source gap. |
| 5.6 Character transform support | Gaussian support; nonunit residues | Finite support check passes; universal conductor statement still source gap. |
| 5.7 CM Gauss coefficient | Zero weight; Gaussian/Eisenstein/√−7 | Independently computed Γ=2,3,7,28 at C=4,6,7,14; no norm formula for arbitrary weights. |
| 5.8 Primitive Gauss norm | Same finite examples; zero/nonprimitive weight | Positive norm needs primitivity; general result/source verification remains gap. |
| 5.9 Rational class U | S₀; roots of unity; rational descent | Indexing and descent are explicit targets, not consequences of numeric regulator; source gap. |
| 5.10 Conductor fibres | √−7 at C=7,14 | Independently counted W=42,168; units modulo 14 do not replace conductor-unit preimage. |
| 5.11 Root-of-unity orbits | Gaussian/Eisenstein/√−7 | Counts 2,3,21,84; primitivity/χ on roots gives free action; source gap for general identification. |
| 5.12 CM Euler convergence | s=2; ramified/conductor primes | Growth N(I)^1/2 puts 2>3/2; nonzero local factors and absolute product, not raw-series continuation. |
| 5.13 Generator versus ideal series | Unit ideal; 4,6,2 generators; C=14 | Unit multiplicity cancels later; primes above 2 cannot be deleted merely because 2 divides C. |
| 5.14 Normalization certificate | Gaussian coefficients; r_E versus r_D | Corrected factor-two label; scalar cancellation has nonzero y,C. |
| 5.15 CM L-value theorem | Gaussian/Eisenstein/√−7 scalars | Finite coefficients agree with π/2,2π/3,4π/7; general construction and alleged printed errors remain **gap**. |
| 5.16 Nonzero versus spanning | One nonzero class; hypothetical extra kernel | Euler product gives nonzero regulator; no injectivity/rank claim follows. |
| 5.17 Three CM examples | Γ and index counts above | Finite parts independently checked; quoted long L-value decimals not rerun. |
| 5.18 Enlarged level 14 | Γ=28, W has 168 elements, 84 orbits; units=42 | Exact conductor index differs from full-level units; general formula/erratum still gap. |
| 6.1 Integral regulator | CM input; bad vertical residue | Restriction requires integral membership, not just horizontal tame vanishing. |
| 6.2 Beilinson propositions | d=1,2; generic versus integral K₂ | Conjecture label and rank clause retained; no theorem asserts injectivity. |
| 6.3 Three different conclusions | d=1 versus d>1; extra kernel | Nonzero, determinant witness and full isomorphism remain separate. |
| 6.4 Horizontal versus vertical | Good fibre; nontrivial vertical residue | Horizontal kernel alone insufficient. |
| 6.5 Strict implications | Projection ℚ²→ℚ; v₂(j)=−6 | Constructed subspace need not control entire domain; negative j valuation excludes potential-good shortcut. |
| 6.6 Fibre-graph route | Tree versus cycle; type III tangency/IV triple point | Explicit unpublished proof route retained as such; published descent is separate. |
| 6.7 Local descent | Trivial good extension; bad prime; ramification | Rational degree division required; does not assert equality of integral groups. |
| 6.8 Functional-equation comparison | d=1,2; sign ±1 | Conditional on continuation/FE over general number field; scalar wN/(2π)^(2d). |
| 6.9 Modular leading coefficient | N=32,d=1; d=2; negative sign | Factors 8/π² and wN/(16π⁴); factorial in leading coefficient retained. |
| 6.10 Determinant and witness | d=0; zero regulator; swapped columns; ℓ=0 | Empty determinant=1; added positive empty witness. Signed determinant and rational basis mandatory. |
| 6.11 Full-basis criterion | Projection; irrational slope ℚ²→ℝ | Needs real-extension injectivity, not merely rational injectivity. |
| 6.12 Normalization witnesses | (d,N,w)=(1,32,1),(2,16,−1); L₂=0 | Rational factors 8,−1; both predicates reject zero value. |
| 6.13 Integral CM image | CM j integral; target dimension one | Nonzero image spans real target; does not show integral K₂ has dimension one. |
| 7.1 Real-analytic Eisenstein definitions | N=1; odd f; T,S; N>1 subtraction | Pole coefficient π/N²; row action correct; holomorphic library series differs. |
| 7.2 Limit formulas | Zero/nonzero residue pair; θ quasiperiod | Corrected second theorem to Siegel §3 Theorem 2 p.28 and actual proof route. |
| 7.3 Harmonicity | f=0; sum nonzero; elliptic fixed point | Degree-zero hypothesis removes Laplacian constant, including orbifold points. |
| 7.4 Manin–Drinfeld | N=1; five order-five cusps at 11 | Rational coefficients needed; no integral bad-prime assertion. |
| 7.5 Hecke separation | p=5,7 | p−1>2√p first holds at 7; good-prime restriction retained. |
| 7.6 Unit u_f | Zero f; odd/trivial character; nonreal character | Normalized unit 1 for odd input; trivial nonzero degree excluded; fixed primitive conjugation. |
| 7.7 Character-unit divisors | Quadratic mod5; order5 mod11 | Corrected χ̄ coefficient and diamond eigenvalue; nonreal check detects both. |
| 7.8 Rationality | Coefficient field and rational cusp divisor | Orders and leading coefficient determine descent; retained. |
| 7.9 Compact character symbols | All cusp boundaries; x,y example | Corrected conjugate diamond scalar; total horizontal tame vanishing is required. |
| 7.10 Regulator real structure | Rational symbols; coefficient complexification | Rational image lies in T⊗iℝ; not arbitrary complex symbol image. |
| 7.11 Convolution Euler identity | n=1; prime dividing modulus; zero-extended character | Imprimitive bad factors retained; formula first in convergence half-plane. |
| 7.12 Rankin–Selberg integral | Trivial/odd exclusion; M divides N | Meromorphic denominators at 2 nonzero by absolute convergence; correct isotypic projection. |
| 7.13 General formula | M=N versus M proper; M=1 excluded | Compactness only claimed in stated primitive same-level case. |
| 7.14 Explicit Beilinson | N=11 and N=14 | Primitive character restriction leaves no instance at 14; not weakened to all characters. |
| 7.15 Prime-level span | p=2,3,5 genus zero; nonreal characters | Corrected Gauss/twist/homology conjugations from source images; no L-value follows just from spanning. |
| 7.16 η of divisors | Equal l,m; degree zero; N=3,5 | Alternation; N=3 opposite residues coincide, so nonclosed example requires N≥5. |
| 7.17 Relative cycle | m=0; odd l; primitive χ | Zero/odd cases give zero cycle; boundary criterion preserved. |
| 7.18 Unfolding | Closed η versus nonclosed η | Error term with dη cannot be dropped in general; opposite-edge/cusp contributions accounted for. |
| 7.19 Cycle formula | Nonprimitive even character; symmetrization | Supports characters unavailable in same-level primitive unit theorem; no new primitivity assumption. |
| 7.20 Nonzero twist | N=11,14 | Nontrivial even twist need not be primitive; distinction retained. |
| 7.21 Geodesic period expression | Different curves of same conductor | Rational coefficients may vary; periods depend on level, not a universal coefficient choice. |
| 7.22 Prime-conductor sign | ε=+1 at 11; flip ε | Existing corrected root-number convention retained; long decimal check not independently rerun. |
| 7.23 Residue/squared-coefficient normalization | Residue of series versus partial sums | Pole at 2 means partial sum RX²/2, not RX; inherited corrected constants retained. |
| 7.24 X₁(11) value | P,2P,−P; real orientation | Odd dilogarithm and orientation sign consistent; rigorous sign certification remains a target. |
| 7.25 Pushforward regulator | Identity; finite degree; arbitrary symbol | Projection formula target not confused with Brunault's narrower Goncharov corollary. |
| 7.26 Parametrization and rational trace | Conjugate pair; full unweighted orbit | Unweighted trace can vanish; replaced with weighted coefficient descent at every embedding. |
| 7.27 Fixed-level subspace | Empty span; cancelling residues; vertical-axis nonmember | Span precedes comap; both cancellation and failure proved in Lean. |
| 7.28 Transfer subspace | Singleton; zero subspaces; empty/nondirected index | Added singleton identity example; finite witness theorem explicitly nonempty and directed. |
| 7.29 Compact correction | Rational cusps; nonrational cusp norms | ∂{a,h}=a^ord h; correction has minus sign; unweighted sum only over splitting field. |
| 7.30 Twisted period algebraicity | Trivial mod4; primitive mod5; even/odd parity; incoherent rescaling | Fixed Gauss conductor, denominator, sign branch and coherent period choices. |
| 7.31 Period inclusion | s=1 local prefactor; algebraic rescaling | πi prefactor retained; tuple across embeddings, not one arbitrarily chosen complex scalar. |
| 7.32 Higher-level nonvanishing | Primitive pq twist; χ=ω_π⁻¹ | Level change essential; exceptional central character excluded. |
| 7.33 Isotypic rational structure | Genus 0,1; two oldvectors | Zero-dimensional case and multiplicity two retained; image statement does not imply regulator injectivity. |
| 7.34 Determinant line | g=0,1,2; contragredient permutation | Empty determinant and derivative factorial handled modulo ℚ×; all finite factors kept. |
| 7.35 Normalized reduction | u=p; e=1,2; u·p³; change uniformizer | Exponent e_C required; no false unramified normalization over a ramified DVR. |
| 7.36 Supersingular orders | Multiple components; nontrivial ramification | Componentwise claim with pullback multiplicities; quotient by component constants retained. |
| 7.37 Full-level integrality | Good p; bad p; level failing coprime-factor condition | Proof uses sufficiently fine level, then transfer; does not make every unit integral. |
| 7.38 Transfer integrality | Graph resolution; Δ(pz)/Δ(z) | Uses total K-theory then Adams projection, not false integral Manin–Drinfeld shortcut. |
| 7.39 Elliptic subspace | Identity, zero, projection, ×3 | A nonzero source class need not have nonzero push; image construction alone makes no such promise. |
| 7.40 Adjointness and descent | Finite φ; coefficient conjugation | Proper covariance supplied; period/line descent requires all embeddings. |
| 7.41 Modular elliptic theorem | X₀(11); differential ×c | Transfer subspace, not zero same-level image, gives nonzero rational line; no rank/injectivity claim. |
| 8.1 Projective-line calibration | Constant path; reversed path | D(b)−D(a), sign fixed by endpoint direction. |
| 8.2 CM 36a1 setup | Six-torsion field versus rational torsion | Uses full six-torsion Bloch class, not the later quadratic substitute. |
| 8.3 Full six-torsion certificate | O; pole order 35; zero point omitted | Corrected tame factor needed; division polynomial exists but does not itself certify all residues. |
| 8.4 36a1 L-value | y²=3/4,C=6,Γ=3 | π/(324i) scalar; three index points; one-point reduction still separate target. |
| 8.5 Nonrational point trace | Quadratic embeddings; nontrivial residue field | Sum over both embeddings, norm on tame symbols; not the identity map. |
| 8.6 Quadratic corrected symbol | T,A,B,O; leading coefficients | Sixth powers kill explicit nonunit tame values; wrong B-row sign rejected. |
| 8.7 Explicit quadratic transfer | Product ℓℓ̄ and m m̄; constants | Norm uses both conjugates; rational functions H,J,F keep denominators/nonrational support visible. |
| 8.8 Quadratic regulator | Two embeddings; reversing diamond | Coefficient −18i after trace; imaginary projection cannot replace complex trace prematurely. |
| 8.9 Integral versus nonintegral examples | 11a3 cusps; vertical obstruction | Constant-symbol correction kills horizontal signs; separate bad-fibre certificate required. |
| 8.10 Levels 14,35,54 | Order-three point and its negative | Tame −1 values torsion after rationalization; special-value formulas diagnostic until certified. |
| 8.11 Example admissibility | Irreducible I₁ at 11; nonzero vertical residue elsewhere | Good reduction not assumed globally; explicit integral certificate, not horizontal-only shortcut. |
| 8.12 p-adic supplier order | Good versus bad p; symbol versus class | Syntomic map and Coleman primitive supplied before elliptic pairing; no bad-reduction extrapolation. |
| 8.13 Coleman pairing | Constant entry; general finite K/ℚ_p; p=2 | Additive logarithms and actual Coleman primitives used; p>2 scope retained. |
| 8.14 Frobenius scalar | r=0; symplectic ℚ²; v×7; zero denominator | Proved −9/2 example; field generality aligned; geometric coordinate requires γ and pairing nonzero. |
| 8.15 Syntomic/étale correction | p=5,γ=2; semilinear general K | Pairing factor 9/10 derived from B(Φa,Φb)=pB(a,b); linear Frobenius used only in stated ℚ_p setup. |
| 8.16 Refined interpolation | Trivial χ; odd quadratic mod3; critical CM | Square Euler factor, χ inverse and α^−ν retained; printed/PDF locators clarified. |
| 8.17 Common scalar predicate | Maps x,2x; (A,B)=(3,6),(3,5); zero map | Proved positive witness and zero-map rejection; no cross-field equality. |
| 8.18 p-adic conjecture | Bad vertical class; theta-critical refinement; zero regulators | Exclusions explicit; remains a conjecture even when an example agrees numerically. |

## Source audit

All sources below were read as mathematical data; no fetched commands or instructions were executed. No suspicious instruction was encountered. This report records locations and conclusions in my own words, without source excerpts. Public-source access date: 2026-10-19.

The package author's explicitly unverified public sources were opened, not merely located in search results:

| Source and accessible version | Locators inspected | Finding |
|---|---|---|
| [Siegel, Tata lectures](https://www-users.cse.umn.edu/~garrett/m/mfms/notes_2013-14/Siegel_AdvAnNoTh.pdf) | §1 pp.5–13, Theorem 1 p.13; §3 pp.21–28, Theorem 2 p.28 | Second limit formula is not just an unspecified following theorem; corrected locator and Abel/meromorphic-function proof route. Printed page 28 is PDF page 32. |
| [Shimura 1977, digitized Math. Ann. 229](https://resolver.sub.uni-goettingen.de/purl?PPN235181684_0229) | Page images 211–214; Theorem 1 p.212, Theorem 2 pp.212–213 and remark pp.213–214 | Associated primitive Gauss sum, parity and coherent all-embedding period system matter. Rewrote §7.30. Auxiliary primes can avoid a prescribed integer. |
| [Merel, author article](https://math.nyu.edu/~tschinke/.manin/final/merel/merel.pdf) and Brunault thesis appendix | Article pp.283–285 and Theorem 10 p.299; appendix Theorem A p.144 and Theorem D pp.154–155 | Modulus/conductor distinctions in modular symbols are explicit. The article's residue formula has the factor four missing from the appendix's displayed version; retained corrected package normalization. |
| [Deninger–Scholl](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/d-s.pdf) | §§1–2, pp.2 and 6–8 | Regulator with supports and proper covariance supply adjointness; not an arbitrary trace of a complex scalar. |
| [Nekovář, author copy](https://math.stanford.edu/~conrad/BSDseminar/refs/BeilinsonintroII.pdf) | §7, pp.21–24; (7.3.2), (7.4.1) p.23 | Form/cup conventions checked against the package's η_B=iη. The package explicitly distinguishes this copy's pairing normalization from its chosen wedge coordinate. |
| [Schneider, original chapter scan](https://ncatlab.org/nlab/files/SchneiderBeilinsonConjectures.pdf) | Deligne discussion p.7; §4 p.28 | Higher Chern sign and symbol cup sign cancel; retained positive rational cup product. |
| [Goncharov, arXiv:math/0207036v3](https://arxiv.org/abs/math/0207036v3) | Theorem 3.4 pp.28–29; Proposition 6.8 and Lemma 6.9 pp.56–58 | Compact current and projective-line comparison checked; the imported Polylogarithms normalization carries the real −1/(2π) factor. |
| Bloch, CRM Monograph 11 (2000) | Lectures 8–11, all inherited locators | **Not read: no authorized copy available.** Added a visible README source gap; finite computations below do not discharge it. |

Additional primary comparisons used [Brunault's thesis, arXiv:math/0602186v1](https://arxiv.org/abs/math/0602186v1), [Bull. SMF 2007](https://www.numdam.org/item/10.24033/bsmf.2532.pdf), [Schappacher–Scholl](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/RSS.pdf), [Dokchitser–de Jeu–Zagier v2](https://arxiv.org/abs/math/0405040v2), and [Asakura–Chida's accepted manuscript](https://eprints.lib.hokudai.ac.jp/repo/huscap/all/91491/Perrin-Riou-conj-v1.pdf) and [arXiv v2](https://arxiv.org/abs/2003.08888v2). In particular:

- Brunault pp.78,88,91,95,97 were also inspected as images where bars matter; (3.78)–(3.79), (3.84), and the character cycles in §3.4 expose the conjugation mistakes. The thesis PDF used has SHA-256 `8fd73faba5db08328c2884d9f35b79bc528145428766444f3eb8097f3b494fb7`.
- Schappacher–Scholl 1.1.0–1.1.3 pp.2–3, 1.2.4–1.3.2 pp.4–7, and §§4–7 give the distinction between fixed-level Q and transfer P, local test vectors, rational period structures and integrality. These are existence statements with transfers, not a same-level primitive-character formula at every conductor.
- The Asakura–Chida accepted manuscript has printed page one on PDF page two (SHA-256 `0395685c6be49d7ecdd6f88807830db0d11d7fb8488aa15a4bd4dccedbe6ec97`). Theorem 2.3 is printed p.7/PDF p.8, the elliptic interpolation formula printed p.16/PDF p.17, Conjecture 3.3 printed p.17/PDF p.18, and footnote 10 printed p.46/PDF p.47. The arXiv v2 distribution condition continues on p.6 and lacks α^−ν. Formula conventions were checked from these versions, not conflated by page number.

The random sample was drawn before edits with seed `codex-FHh5IB` from the source-bearing package paragraphs. The following are the 15 selected paragraphs (including distinct paragraphs from the same subsection); all were checked at the actual source locations.

| Sample | Package paragraph | Source locator and outcome |
|---|---|---|
| 1 | §1.3 integration pairing | Brunault (1.43)–(1.44), p.22 and footnote 2: period lattice and intersection; retained. |
| 2 | §6.4 vertical versus horizontal | DJZ §8 p.22; Brunault pp.19–20: integral restriction distinct; retained. |
| 3 | §8.17 common scalar predicate | Asakura–Chida §3.4, Conjecture 3.3: clarified printed/PDF pagination and additive-map scope. |
| 4 | §6.3 strength of conclusions | Brunault Theorem 5 p.11 and Remarks 84.2 p.93: spanning is weaker than rank/injectivity; retained. |
| 5 | §2.7 Chern/cup constants | Schneider §4 p.28; Nekovář §7.3–7.4 p.23; Brunault Proposition 67 pp.67–69, proof of Theorem 68 p.70: conventions explicit. |
| 6 | §7.13 formula's hypotheses | Brunault Theorem 81/(3.83) p.91: M-divisor and nontrivial-character restrictions retained. |
| 7 | §7.4 rational cuspidal divisors | Brunault (3.58)–(3.59) p.85: rational coefficients and leading-term splitting retained. |
| 8 | §7.19 cycle formula derivation | Brunault (3.124) p.106: nonprimitive scope and plus symmetrization retained. |
| 9 | §2.1 imaginary-valued real symbol | Brunault (2.116) p.67: image in iℝ, not ℝ, retained. |
| 10 | §6.6 graph proof | DJZ §8 p.22 supports the good-reduction vertical condition, not the entire unpublished graph proof; existing explicit proof-gap label retained, alternate §6.7 available. |
| 11 | §3.8 Green kernel | Brunault Proposition 9/(1.14)–(1.15) pp.16–17 and (1.57)–(1.58) p.24: kernel and normalization retained. |
| 12 | §8.5 quadratic transfer | Brunault Corollary 37 p.40 is the geometric comparison, not a source for unrestricted K₂ norm compatibility; package keeps the latter as a separately named target. |
| 13 | §6.10 determinant | DJZ Conjecture 3.11 p.6, Remark 3.14 p.7; Schappacher–Scholl 1.1.0–1.1.2 pp.2–3: rational Betti frame and determinant line retained. |
| 14 | §7.2 limit-formula proof | Brunault (3.10),(3.12) p.74; Siegel Theorems 1,2: corrected second theorem/proof route. |
| 15 | §2.4 integration-by-parts comparison | Brunault Definition 63/(2.107) p.66, Theorem 68 pp.69–70: factor and absolute-convergence scope retained. |

## Lean signatures and validation

The file has 479 lines, real-bodied light definitions only, one namespace and module docstring, and no sorry'd data or admitted examples. The 26 existing theorem goals remain goals. Heavy K-theory, Deligne and modular-unit objects were not encoded as substitute carriers just to add Lean tests. Their new character/period/descent controls are README targets; the kept light definitions have proved discriminating examples. This respects the current shape rule over the issue's older instruction to mirror every heavy definition in Lean.

All theorem signatures were compared with their README counterparts and their local variable blocks:

| Lean theorem(s) | README | Hypotheses / generality checked |
|---|---|---|
| `torusRegulator_eq_half_conj_diamond` | §4.2 | Im τ>0, both actual elliptic functions and full torus divisors; empty divisors allowed, no tame assumption. |
| `curve32a2_LSeries_two` | §5.15 | Fixed Gaussian example of the general README theorem, actual Weierstrass LSeries and ellipticR. |
| `torusRegulator_one_sub` | §2.5 | Both f and 1−f satisfy nonzero-germ elliptic predicate; constants 0,1 cannot violate relation. |
| `RegulatorPeriods.norm_q_lt_one` | §1.2 | Positive orientation from structure supplies norm bound. |
| `RegulatorPeriods.q_ne_zero` | §1.2 | Actual qParam; not an unconstrained field. |
| `RegulatorPeriods.rebase_ratio` | §1.4 | SL₂(ℤ) and oriented period ratio; correct entry order, denominator nonzero. |
| `RegulatorPeriods.conjugate_ratio` | §1.5 | Actual complex conjugation and second-vector minus sign. |
| `RegulatorPeriods.two_re_tau_of_real` | §1.7 | Both real-adaptation equations required. |
| `RegulatorPeriods.q_neg_of_re_half` | §1.7 | Re τ=1/2 plus structure positivity; strict negative real value. |
| `torusRegulator_swap` | §2.5 | Compact periodic meromorphic functions; antisymmetry by Stokes. |
| `torusRegulator_const_left` | §2.5 | Ellipticity of nonconstant entry; total log convention also permits constant zero. |
| `summable_kroneckerTerm` | §3.6 | Im τ>0 prevents degenerate lattice; any real coordinates. |
| `ellipticR_neg` | §§3.2–3.3 | Complex-valued oddness, not imaginary part alone. |
| `ellipticR_add_one_right` | §3.3 | Termwise character periodicity; does not require positive Im τ for this total formula. |
| `ellipticR_I_quarter_im` | §3.2 | Numerical interval is a named theorem goal, not a proved numeric claim. |
| `ellipticR_S` | §3.7 | Im τ>0; coordinate pair b,−a; conjugate denominator. |
| `diamond_comm` | §4.1 | Any additive commutative group; reflection equality, not negation. |
| `finiteFourier10_inversion` | §4.4 | C≠0; all complex functions, no oddness requirement. |
| `sum_finiteFourier10_mul_ellipticR` | §4.16 | Odd complex input, nonzero C, positive Im τ; C=1,2 force zero input. |
| `regulatorDet_changeFrame` | §6.10 | Arbitrary rational matrix, including singular; column convention and det factor. |
| `hasDeterminantWitness_rescale` | §6.10 | Nonzero rational scalar; no irrational normalization. |
| `HasDeterminantWitness.span_eq_top` | §6.10 | Nonzero signed determinant forces real spanning, not injectivity. |
| `hasDeterminantWitness_atTwo_iff` | §6.12 | w=±1, N>0, all dimensions including zero; zero L₂ rejected by both sides. |
| `mem_beilinsonSubspace_iff` | §7.28 | Nonempty directed transfer images; not an unrestricted iSup membership claim. |
| `normalizedUnitReduction_mul_zpow` | §7.35 | General commutative groups and homomorphisms; both valuation terms cancel for any integer power. |
| `frobeniusRegulatorScalar_smul_eigenvector` | §8.14 | Any field, c≠0 and nonzero pairing; algebraic invariance needs no extra γ condition. |

Validation completed:

- `lean-check research/blueprint/packages/EllipticRegulators/Suggested.lean`: exit 0; exactly 26 warnings, all `declaration uses sorry`; no errors or other warnings. Initial file also elaborated before edits. No Lake build, update, cache command or language server was used.
- Independently evaluated finite CM transforms: Γ=2 at Gaussian level 4, Γ=3 at Eisenstein level 6, Γ=7 and 28 at √−7 levels 7 and 14; conductor-unit sets have 8,18,42,168 elements, with 2,3,21,84 root-of-unity orbits. These are finite numerical diagnostics in addition to the exact algebraic reasoning, not certification of the general CM theorem.
- The nonreal-character and projective-line nonzero sign computations are reported above with their actual errors/values. They are review computations, not source excerpts or claimed formalizations.
- All nine input packets checked with `scripts/check_blueprint.py`; all target mappings and 143 adversarial rows checked against the unchanged subsection inventory.
- `research/blueprint/intake.py check-files` on all changed deliverables and `git diff --check`: no problems. JSON review object parsed successfully. `metadata.toml` remains `topic = "math.NT"`.

## What remains and where to resume

Before accepting the package, read an authorized Bloch CRM11 edition or locate a public primary replacement and verify:

1. The uniform theta-product, zero-count/multiplicity and tail estimates of §§3.11–3.15 (inherited Lemmas 8.2.1–8.2.4, 9.1.2–9.1.5, 9.2.2–9.2.3), including the continuity reduction and all quantifiers. The source is necessary even though the other regulator proof provides an independent endpoint identity.
2. The exact Bloch-class normalization and direct Fourier attributions in Layer 4 (Lectures 8 and 10), and the general CM conductor-support, primitive Gauss coefficient, rational descent of U and conductor-fibre argument in §§5.6–5.18 (Lecture 11). The finite examples above do not replace these general checks.
3. The claims about the printed kernel, the missing/extraneous factors, and index sets in Bloch's Theorem 11.2.1 and surrounding lemmas. Until the original is read, describe these as inherited proposed corrections, not independently authenticated errata.

The README's opening source-gap paragraph records this limitation. No general targets or tests should be removed to obtain acceptance. The already explicit unpublished graph route (§6.6), transfer proof target (§7.25), certified sign (§7.24), and three-point/one-point reduction (§8.4) remain named mathematical work with their alternative suppliers or stated proof requirements; they were not silently promoted to completed results.
