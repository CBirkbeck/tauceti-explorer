# Independent package review: automorphic forms on reductive groups

**Verdict: accepted with the corrections below.** Codex, session `codex-WXRm5K`, reviewed issue #10164 on 2026-10-17. I did none of the package jobs #10141 or #10159. This is a completed fixing review. The package is ready for the maintainer's draft upstream PR; its construction targets remain mathematical work, rather than established Lean results.

## Scope, form and coverage

I read WORKERS.md, PROTOCOL.md, PACKAGE_REVIEW.md, UPSTREAM_GUIDE.md, the expansion protocol, the accepted revision-5 packet, its library audit, the package and its previous handoff. CompactGroups and LieHighestWeight supplied upstream README/Suggested models. The package retains all eight layers and all 48 mathematical subsections. Every subsection has a Checks block, with 4–13 checks; I inspected the defining properties, positive examples and negative controls, rather than using the count alone. Definitions retain their intended API, theorem hypotheses and source locators. Metadata remains `math.NT`.

The 100-node accepted packet and its seven planned stages remain covered, including its rationality, all-degree cohomology, torsion, coherent and classical interfaces. The previously omitted Ichino–Prasanna compatibility witness and explicit unitary-group Hodge example are now present. Packet files, reader documents and other jobs' files were not changed.

## Corrections applied

| Location | Correction |
| --- | --- |
| §0.4 | Included `1` in the matrix height, retaining `H≥1` also at rank zero. |
| §1.2 | Corrected the discrete-ℤ example: smooth and continuous cochains agree on a discrete group. Its nonzero first cohomology obstructs extending van Est to arbitrary component groups, rather than obstructing smoothing. |
| §2.2 and supplier boundary | Deleted the separate enveloping-product/abelian-enveloping and tensor-centre construction targets. Cited the existing equivalences and centralizer theorem instead. Retained only the reductive Harish-Chandra extension of the supplied semisimple isomorphism. |
| §2.4 | Local square-integrability now uses the full connected real split centre `A_G`, distinguished from the rational split centre `A∞`. Absolute values of unitary coefficients descend; the coefficients themselves need not. Added a real-quadratic torus divergence witness. |
| §2.5 | Added a nonsemisimple unipotent Weil representation with all eigenvalues one and unbounded image, discriminating relative compactness from bounded eigenvalues. |
| §3.1 | Scoped the explicit compact group `{±1}` to `GL₁/ℚ`; complex places have circle factors. |
| §3.2 | Added Lapid's precise multiplicity reference, Introduction, pp.157–158. |
| §4.4 | Clarified that a constant function of nonzero parallel weight must vanish. |
| §5.3 and Lean example | Distinguished the numerical zero extension at `n=0` from the group `PGLₙ`, which is used for `n≥1`. Added a proved Lean example computing all three formulas at `n=0,1`. |
| §5.4 | Added `U(2,1)` with `(R+,R−)=(2,0)`, `dim H^{2,0}=1`, `H^{1,1}=0`, and its conjugate. Restored the equal-rank Ichino–Prasanna comparison, including the dual finite-dimensional coefficient and shifted infinitesimal character. |
| §6.5 | Restricted principal-series vanishing to irreducible unitary principal series. The reducible odd `I(1,0)=D₁⁺⊕D₁⁻` has coherent classes in degrees zero and one at coefficient weight `−1`; it is now an explicit excluded case. |
| §7.1 and supplier boundary | Distinguished the current finite-order conductor API from the general conductor target in GlobalNumberFields Layer 9. Named positive `normPow F 1`, rather than confusing it with unitary `normCharacter F t`. Defined conductor exponent zero using `O_v×`, with `1+𝔭_v^a` only for `a≥1`. Required exact finite order in the cyclotomic value-field check. |
| §7.3 | Getz Remark 6.20 supplies adelization but does not state the Hecke scaling. Added the actual right-coset calculation deriving `p^{1−k/2}`, including a nonreal character witness to distinguish `χ(p)` from its inverse. |
| Supplier boundary and references | Added Arthur Theorem 12.1, p.64, and §13, equations (13.2)–(13.4), p.70; precise Kostant sections/pages; and the Ichino–Prasanna and Lapid references. Clarified that Langlands classification supplies an input to globalization. |
| Suggested.lean closing comment | Listed the heavy README definitions and comparisons explicitly; none is represented by a sorry'd data carrier. |

## Source verification

All source prose in the deliverables is original mathematical formulation with locators. Public scans were read as scans when text extraction was unreliable. The cleared Corvallis, Pilloni and Scholze copies were read in place; no files or passages from them were copied into the deliverables or scratch.

I checked every source family the package author listed as unverified:

| Source | Locators read and result |
| --- | --- |
| Clozel | Propositions 3.1–3.2, pp.102–104; Théorème 3.13, p.112; Lemme 3.14, pp.114–120; Proposition 3.16 and proof, pp.122–123; Lemme 4.9 and proof, pp.144–145. The local/finite-part exact descent and arithmetic number-field assertions have different hypotheses, as the package states. The general reductive rationality statement retains the rational cuspidal-summand hypothesis. |
| Knapp | Theorem 1, p.400; Weil-group presentation and characters, pp.401–402; Theorem 2, p.403; Theorem 5, p.406. Normalized quotients, the real/complex parameter carriers and twist conventions match. |
| Langlands classification | Lemma 3.13, p.44; Lemma 3.14, p.45; Lemma 4.2, p.50. Unique irreducible quotient, conjugacy and exhaustion by essentially tempered inducing data match. The IAS PDF was readable through the browser although direct shell download was refused. |
| Duke–Imamoğlu–Tóth | §5, pp.961–963, especially equations (5.6)–(5.7), p.962. These support the real spectral-parameter normalization. The imaginary-parameter decaying branch is separately formulated, with zero eigenvalue excluded from the cuspidal exceptional interval. |
| Kostant | §3.1, pp.334–335; Theorem 5.7, pp.353–354; Theorem 5.14, pp.362–363. Checked cochain signs, the Laplacian route and the parabolic theorem with its full Levi central weight. Added the precise locators to the references. |
| Casselman | §§2, 5–6, pp.9–11 and 17–20, including Proposition 6.1. Compact weights, the two-ray construction and reducibility match. Contrary to the earlier handoff, this PDF has printed page numbers. |
| Badulescu–Renard | Theorem 7.2, pp.15–16; Theorems 8.1–8.2 and §9.1, pp.16–17. Checked genericity separately from unitary-dual classification and the rank-one complex building blocks. |

For the additional fifteen checks, I used Python `random.Random(10164).sample` on the 48 subsection headings after excluding the five subsections containing the already flagged source families (§§2.4–2.6, 5.5, 5.7). Each sampled subsection had an independently opened locator checked:

| Subsection | Checked locator | Finding |
| --- | --- | --- |
| 0.4 | Beuzart-Plessis–Chaudouard–Zydor, §§2.5.7–2.5.8, p.18 | Common derivative exponent and LF topology; no unsupported strict-LF claim. |
| 7.2 | Getz, Lemma 6.19 and Remark 6.20, p.33 | Supports the adelization convention. |
| 3.2 | Borel–Jacquet, §§4.5–4.6, p.196; Langlands, Proposition 2, p.204, Lemmas 7–9, pp.206–207 | Finite central jets, including derivatives of Eisenstein families. |
| 5.8 | Scholze, Introduction, Conjecture I.2 and discussion, pp.5–6 | Residual/torsion context; the conjecture is not claimed as a theorem here. |
| 7.3 | Getz, Remark 6.20, p.33 | Does not supply the Hecke factor; fixed with the displayed coset derivation. |
| 0.1 | Borel–Jacquet, §4.1, p.194 | A global finite level is part of the smooth adelic carrier. |
| 2.7 | Bernstein–Krötz v3, Theorem 1.1, p.3; Theorem 5.5, p.25; Theorem 10.6, p.45 | Existence, uniqueness and topological hypotheses for globalization. |
| 5.6 | Ding v2, §4.2.2, pp.71–72 | Coefficient setting checked. Ding assumes a stable lattice there; the package supplies its construction rather than attributing that proof to Ding. |
| 6.5 | Harris, Theorems 3.4–3.5, p.63 | Dualized representation, matching coefficient, one-dimensional selected degree, vanishing elsewhere and tempered converse. |
| 4.5 | Duke–Imamoğlu–Tóth, equations (5.6)–(5.7), p.962 | Laplacian and Fourier–Bessel scaling. |
| 0.5 | Beuzart-Plessis–Chaudouard–Zydor, equation (2.5.8.6), p.18 | Smoothing identity and derivative control. |
| 6.1 | Boxer–Pilloni, §1.3.7, p.4 | Hodge stabilizer, real form and Levi. |
| 2.2 | Borel–Jacquet, §§1.2–1.4, pp.189–190, with continuation context p.191 | Infinitesimal characters, admissibility and finite generation; uniform central annihilation is distinguished from local central finiteness. |
| 5.4 | Vogan–Zuckerman, Theorems 5.3, 5.5–5.6, pp.74–75; Proposition 6.19, p.84 | Lowest compact type, matching coefficient, shifted Hodge bidegrees and exterior formula. |
| 6.7 | Boxer–Pilloni, §§1.3.1–1.3.8, pp.3–4 | Minimal left-coset representatives, coefficient convention and coherent chambers. |

Further direct checks covered Wockel §1(a), p.4, Proposition 2.8, pp.9–10, and Theorem 3.3, p.13; Bernstein–Krötz §§2.4–2.5; Flath Theorems 1–4, pp.179–183; Arthur Theorem 12.1 and §13; Ichino–Prasanna v2 §7.1, pp.40–41; Pilloni §§15.2.1–15.2.3, pp.107–108; and Scholze Proposition V.1.1, pp.79–80. Pilloni's printed positive inequality on a negative parameter is incompatible with the surrounding classical-weight limit; the package correctly keeps the sign-corrected direction and explicitly identifies it as such.

Lapid's primary PDF was available through indexed page text, including pp.157–158, although direct download from its host was refused. Page 158 states the Blasius cuspidal SLₙ multiplicity examples, so the new citation supports the negative multiplicity-one test. I do not claim a reading of the rest of that paper.

## Prerequisite and duplication audit

The pinned inputs are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. I read the statements of all 57 declarations in the packet's library-coverage audit, including their actual typeclass and continuity hypotheses. In particular, `ContRepresentation` alone does not supply a joint-continuity theorem; `PiTensorProduct` does not construct a reference-vector restricted tensor product; and the existing generated Lie subalgebra of a subgroup does not supply the closed-subgroup Lie comparison. The package's adapters remain necessary. Continuous group cohomology and low-degree Lie cohomology are reused on their existing carriers.

For current duplication I read the runner-provided upstream `origin/main` at `779644b8ca438ce9874ef0f09745b0e1dcc3b268`, rather than assuming the checked-out topic branch was main, and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches used mathematical objects, fields and hypotheses as well as names, across roadmap READMEs/Suggested files, Completed and the library.

| Existing material inspected | Disposition |
| --- | --- |
| LieHighestWeight and current central-character modules | Projection, evaluation, dot-orbit invariance and the semisimple isomorphism are supplied. Retain the reductive assembly, with trivial Weyl action on the central summand; do not impose a nondegenerate Killing form on `glₙ`. |
| `TauCeti.UniversalEnvelopingAlgebra.prodEquivTensor`, `.symmetricAlgebraEquiv` | Both already exist at the pin as well as currently. Removed their independent construction from §2.2 and cited them only in the supplier boundary. Product equivalence does not require freeness. |
| Mathlib `Subalgebra.centralizer_range_includeRight_eq_center_tensorProduct` | Already at the Mathlib pin. The first factor must be free; over ℂ, `S(𝔷)` is free and commutative, giving the tensor-centre formula. Removed the separate target for that formula and recorded the supplied result in the boundary. |
| Current Hecke-character modules / GlobalNumberFields Layers 9–10 | No second character, infinity-type or algebraicity construction. Current conductor requires finite order; general finite conductor is an existing roadmap target. Retain only the automorphic comparison and generalized-character expansion. |
| ModularForms and Hecke-ring modules | Both untwisted and character Hecke actions already exist at the Tau Ceti pin; the previous handoff's claim that the character action was current-only is incorrect. The new target is the normalized adelization dictionary. |
| CompactGroups / OrthogonalL2Bases | Averaging, Schur, compact Fourier and Peter–Weyl inputs are deferrals. Real-group admissibility and global restricted factorization remain different targets. |
| DifferentialGeometry / ContourIntegration | Forms, exterior differential, Poincaré lemma and integration remain supplied. Smooth group cochains, group-function topologies and the van Est adapters are distinct. |
| AlgebraicVectorBundles | Geometric bundles/coherent sheaves do not already construct the Lie-theoretic coherent complex of this package. Geometric comparison stays with consumers. |
| IntegralLattices and existing lattice modules | Integral quadratic lattices and smooth discrete Galois lattices differ from full finitely generated p-adic lattices stable under compact matrix groups. Keep §5.6 with its explicit span condition. |
| LocalGaloisGroups / ProfiniteArithmetic | Local-field Galois/profinite objects do not supply archimedean Weil groups or their representation classification. |
| OperatorTheory | Bounded Hilbert operators are supplied; smooth moderate-growth Fréchet globalization is distinct. |
| OrthogonalSpinGroups | Algebraic group/Clifford constructions do not supply real Harish-Chandra representation theory. |
| PeripheralActions / RealAlgebraicGeometry | No existing target for the analytic function spaces, automorphic occurrences or coherent parameter classification. |
| Completed RestrictedProducts | Topological restricted products are supplied arithmetic inputs, not the algebraic restricted tensor product with chosen spherical vectors. |
| Completed EffectiveBounds | Does not supply reductive-group weighted integrability, globalization or a large-weight automorphic classification. |

All nine post-snapshot roadmaps and all four named Completed roadmaps were included. The explicit removals are the enveloping-product equivalence, the abelian enveloping/symmetric equivalence and the tensor-centre identification; the remaining Harish-Chandra variant explains its additional reductive content.

The prerequisite walk uses only pinned libraries, earlier layers, existing upstream roadmaps, lower-tier suppliers, and ArithmeticLocallySymmetricSpaces in the tier-11 bundle. Shared foundational ALS carriers are consumed through their stated hypotheses; later geometric comparisons are not prerequisites. SmoothRepresentations supplies finite-place categories/corners/Satake, not an unstated spherical-line theorem. ShimuraData, AutomorphicSpectralTheory and AutomorphicLFunctionsAndLocalFactors are consumers, not suppliers. There are no `UPSTREAM:` or FoundationsAndLibraryIntegration dependencies. No new cross-roadmap ownership move was needed in this review.

## Adversarial mathematics pass

The table records a pass through every subsection's definitions, identities, theorem hypotheses and conventions. It includes the arithmetic coefficient variants as well as the complex analytic ones. The listed instances are concrete controls for the whole subsection; they do not assert that elaboration proves its analytic theorems.

| Statements / conventions | Instances and computations | Result / change |
| --- | --- | --- |
| 0.1 Finite level, rational invariance, right action | Trivial rational subgroup; constant function; noncommuting `S₃` translations and conjugated levels | Order `R(x)R(y)=R(xy)` and level `yJy⁻¹` retained. |
| 0.2 Group test functions and LF topology | Compact versus noncompact group; bump versus constant; support in a fixed compact set | Completeness/support hypotheses retained; no claim that pointwise local constancy gives one level. |
| 0.3 Schwartz decay and integrability | `ℝ_{>0}` integral `2/r`, divergent at `r=0`; inverse matrix coordinates; trivial group | Properness and a positive decay threshold retained. |
| 0.4 Growth and derivative bounds | Constants; height one; `t^s`; `sin(exp(t²))`; rank-zero matrices | Common derivative exponent is stronger than growth; height now includes `1`. |
| 0.5 Smoothing / Hecke normalization | Gaussian integration by parts; `XY` versus `YX`; mass-one bump; raw `T₂1=3`; arbitrary `vol(J)` | Minus sign, anti-automorphism order and volume factor retained. |
| 1.1 Relative complex and products | Zero module; trivial pair; `sl₂` bracket gives `−1`; `C₂` averaging at characteristic two; full `O(2)` reflection | Bracket/cup signs and characteristic-zero exactness retained. |
| 1.2 Smooth / continuous cochains | `dv=gv−v`; additive `x` is a cocycle; `d(x²)(1,2)=−4`; discrete ℤ | Corrected the interpretation of the ℤ counterexample. |
| 1.3 van Est | Compact group; `ℝ⁰,ℝ¹`; `GL₁(ℂ)`; `GL₂(ℝ)` full compact; arithmetic quotient | Finite component group, full compact action and the group/arithmetic distinction retained. |
| 2.1 Compact-finiteness / admissibility | Zero vector; trivial representation; infinite cyclic delta orbit; `O(2)` multiplicity two; tensor of lowest-weight modules | Orbit-span and multiplicity predicates distinguish finite generation. |
| 2.2 Central characters / reductive extension | Zero module; `gl₁`; Jordan block; dual scalar `2↦−2`; `gl₂` determinant Casimir `2` | Nonzero uniqueness, generalized support and dot shift retained; existing algebra inputs removed as targets. |
| 2.3 Normalized induction | `SL₂` at positive diagonal `t=2`; unitary imaginary exponent; opposite parabolic | Positive `δ_P^{1/2}` and quotient/submodule directions retained. |
| 2.4 Tempered / square-integrable / Langlands quotient | Compact group; `D₁` versus `D₂`; trivial quotient at `ν=1`; real-quadratic torus | Corrected local split-centre quotient; remaining positive-parameter convention retained. |
| 2.5 Weil groups / correspondence | `j²=−1`, `(j·2)²=−4`; norm exponent doubles; trivial GL₂ parameter; nonsemisimple unipotent parameter | Added eigenvalue-bounded but image-unbounded negative control; semisimplicity remains explicit. |
| 2.6 Explicit modules / generic unitary dual | `k=1,2,12` gives Casimir `−1/4,0,30`; compact matrix brackets; dual `(−b,−a)`; complementary endpoints | Two rays, full-group reflection and strict `0<β<1/2` retained. |
| 2.7 Globalization | Trivial finite-dimensional module; smooth vectors versus Hilbert completion; Sobolev order; morphisms | Completeness, moderate-growth and uniqueness/naturality contracts retained. |
| 3.1 Smooth vectors / components | GL₁ characters and log; trivial group; finite compact type; complex archimedean place | Scoped `{±1}` to ℚ; no hidden circle omission. |
| 3.2 Global algebra / automorphic representation | Extensions with Jordan centre; finite Eisenstein jets; SLₙ multiplicity examples | Generalized characters and admissible subquotients retained; added Lapid locator. |
| 3.3 Archimedean distributions | Compact finite type; compatible corner idempotents; infinite direct sum | Algebraic finite-support distribution algebra remains distinct from all distributions. |
| 3.4 Restricted tensor / finite corners | Empty product; changed reference vector; nonzero corner; algebraic versus Hilbert tensor | Nonzero spherical vectors and reference data retained. |
| 3.5 Spherical line / Flath | Vanishing invariant space; Steinberg Iwahori dimension one; principal Iwahori dimension two | Bound is `≤1` only for spherical compact, not arbitrary level. |
| 4.1 Constant terms | No proper parabolic; nested unipotents; normalized quotient volume; central character | Right covariance, transitivity and measures in stages retained. |
| 4.2 Cusp / discrete occurrence | Torus; constant on finite-volume SL₂ quotient; actual occurrence maps; zero vector | Discreteness does not imply cuspidality or multiplicity one. |
| 4.3 Whittaker / additive duality | GL₁; rational `1/3` product character; nondegenerate versus trivial character; cuspidal GLₙ | Additive duality is a named construction target, not an assumed supplier. |
| 4.4 Holomorphic / Fourier criterion | Weight zero constant; nonzero parallel weight; `p⁻¹` root subgroup; finite field of two elements | Local generation and full archimedean-variable hypotheses retained; wording clarified. |
| 4.5 Maass / Bessel / Hecke | Half-order Bessel equation gives `11/4−3/2−5/4=0`; even/odd parity; imaginary endpoint | Sign and scaling retained; λ=0 excluded from cuspidal exceptional interval. |
| 5.1 Algebraicity / character lattice | GL₂ trivial `(1/2,−1/2)`; half twist `(1,0)`; SL₂ versus PGL₂; CT `±1` | Group lattice and C/L distinction retained. |
| 5.2 Specified coefficient cohomology | `a−b=k−2`, `a+b=−μ`; `D₁`; full O₂ versus SO₂; central GL₁ direction | Dual coefficient, balancing and component invariants retained. |
| 5.3 Defect / tempered range | PGL₁; numerical n=0; PGL₂ real `(1,0)` and imaginary quadratic `(1,1)`; PGL₃ `(2,1)`; real-quadratic torus | Explicit zero-extension scope and Lean computation added. Full-component formula still requires invariants. |
| 5.4 Vogan–Zuckerman / Hodge | `q=g`; compact Levi; U(2,1) holomorphic and conjugate parabolics; non-self-dual coefficient | Restored bidegree and dual-coefficient comparisons; matching and positivity hypotheses retained. |
| 5.5 Purity / weight-zero GLₙ | `n=1,2`; `k=12` raw weight `−10`, Clozel weight `−11`, twist `5`; odd sign at level one | Twist sign, component action and generic cuspidal hypotheses retained. |
| 5.6 Stable lattices | n=0 versus n=1; p=2; noncompact diagonal powers; symmetric/divided powers at two; nonprincipal ideal | Full span and compactness essential; general local-field case uses its uniformizer, not p. |
| 5.7 Rationality / models | Trivial representation; quaternion Schur-index example; transcendental GL₁ value; unitary versus cohomological newform | Field of rationality, exact descent and number-field finiteness remain distinct. |
| 5.8 Torsion eigensystems | Zero module; `4∈ℤ/8`; proper finite-subfield image; `H¹(Γ,ℤ)` versus torsion in H² | Nonzero class, finite-field maximality and nonzero reduction retained. |
| 6.1 Hermitian datum | Compact group; SL₂ rotation; product over several real places; rational versus real centre | Quotient uses full real split centre so compactness is valid. |
| 6.2 Coherent complex | SL₂ coefficient `−k` versus `k−2`; k=1 meeting; p-minus weight `−2`; zero module | Inverse coefficient twist and coherent/ordinary distinction retained. |
| 6.3 GSp₄ lattices / chambers | `(4,2;−3)` central balance; no false split parity; compact/noncompact walls; dual `−w₀ᴹ` | Central `ρ` coordinate and all four chamber signs retained. |
| 6.4 Components | `ε²=1`; two exchanges with wrong sign square to `−1`; self-conjugate trivial module; characteristic two | Two distinct extensions only over characteristic zero with the stated intertwiner hypotheses. |
| 6.5 Coherent discrete / limit theorem | Compact group; trivial SL₂; holomorphic degree zero; k=1; reducible odd principal series | Corrected irreducibility restriction on principal-series vanishing. |
| 6.6 Three large-weight / lowest-weight results | `(20,10)`, `(12,12)`, `(12,2)`; equality at R=5; two generic real places; `E(k,1)` | Global occurrence, local essentially unitary exclusion and local lowest-weight theorem remain separate. |
| 6.7 Siegel packets | g=1,2; Levi multiplier equation; left-coset representatives; g=0 treated separately | Coherent degree alone does not identify coefficient/chamber data. |
| 6.8 Scalar holomorphic series | Rank one; symplectic k>n versus unitary k≥n; half-integer parameters; boundary failure | Different regularity bounds retained. |
| 7.1 GL₁ dictionary | Log norms at e and e²; trivial group; exact order m; positive versus unitary norm; conductor exponent zero | Corrected value-field hypothesis and principal-unit convention; supplier scope made precise. |
| 7.2 Adelization | Positive scalar; χ(−1) parity; finite-level inverse character; constant term; weight one | Positive determinant power, central compatibility and inverse covariance retained. |
| 7.3 Hecke / diamond | Right cosets of diag(1,p); χ(p)=i; k=12,p=2 gives `−3/4` from `a₂=−24` | Added explicit derivation of `p^{1−k/2}` and χ orientation. |
| 7.4 Coefficient algebraic forms | Zero form; trivial coefficient; nonfixed constant; inverse level covariance; semigroup extension | Genuine rational and p-adic coefficient actions retained. |
| 7.5 Stabilizers / base change | Trivial stabilizer; sign action of C₂ in characteristic two; nonfree integral coefficients | Base change requires invertible stabilizer orders; finiteness is arithmetic input. |
| 7.6 Central character | Nonzero vector over a field versus `4∈ℤ/8`; effective finite quotient; noncompact rational centre | Scalar compatibility is not inferred from nonzero torsion values; central descent remains explicit. |
| 7.7 Products / central transport | Trivial factor; two slices and evaluation matrix; GL₂ not Gₘ×SL₂ | Algebraic tensor factorization and actual group isomorphisms retained; no unjustified Hilbert completion. |

## Lean signature audit and validation

The companion has 484 lines. It contains light, real-bodied definitions, thirteen endpoint/milestone theorems, and examples. No theory development, sorry'd data definition, false carrier, `True` placeholder or conclusion-as-hypothesis was introduced. Definitions requiring new analytic/category carriers are listed by name in the closing comment, with their full construction targets retained in the README.

I compared every theorem signature to its README contract (more than the required ten):

| Lean theorem | Signature check |
| --- | --- |
| `moderateGrowth_iff_of_comparable` | Both heights ≥1, both positive comparison constants, both nonnegative real exponents. |
| `moderateGrowth_rightTranslate` | Height ≥1 and submultiplicative; arithmetic polynomial-height variants remain separately stated in prose. |
| `rightTranslate_mul` | Parameter order agrees with right translation. |
| `leftInvariant_rightTranslate` | Arbitrary supplied rational subgroup; no unnecessary normality. |
| `levelInvariant_rightTranslate` | Uses `Subgroup.map (MulAut.conj y)` in the correct direction. |
| `kFinite_of_finiteDimensional` | Algebraic finite-dimensional assertion for any group; compactness belongs only to analytic results. |
| `isCAlgebraicGL_iff_twist` | Adds `(n−1)/2`; twice the half shift is integral, so the convention is consistent. |
| `two_q0_add_ell0` | Exact natural-number identity; n=0 is the declared numerical extension. |
| `exists_localStableLattice` | Prime p, finite rank including zero, compact subgroup, finite generation and full span; no general-DVR claim in this signature. |
| `TorsionEigenSystem.maximalIdeal` | Finite field, unital character; surjectivity is unnecessary. |
| `separated_of_weight_gaps` | R>0, strict gap >R+2, and l=2 or l>R+2. |
| `weight_gaps_of_separated` | R>2, k≥l≥2, conclusion with the smaller bound R−1. |
| `algebraicModularForm_ext` | Actual double-coset covering supplied; arbitrary commutative coefficient ring; no unsupported finite-class-set theorem hidden in the statement. |

`lean-check` at the pinned shared build exited **0**, with **20 warnings, all “declaration uses sorry”**: thirteen theorems and seven examples. The new n=0,1 example is proved by simplification. This checks elaboration only; the mathematical review above supplies the separate truth/normalization audit.

`python3 research/blueprint/intake.py check-files` on the package files, verdict, report and handoff reports **0 problems**. `git diff --check` passes. A deliverable-only scan found no machine-local paths, process residue in the mathematical package, unmatched inline-code delimiters or source passages. No unresolved defect remains from this review.
