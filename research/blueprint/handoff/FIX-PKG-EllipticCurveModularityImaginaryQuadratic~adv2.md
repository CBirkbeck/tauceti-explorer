# Fix report: unconditional imaginary-quadratic elliptic modularity

Complete fix for issue #10242, job
`FIX-PKG-EllipticCurveModularityImaginaryQuadratic~adv2`, by Codex, session
`codex-aBkUDa`, 17 October 2026. This is the implementation report for the
claimed fix, not an independent review. The bot confirmed the session's claim
before work began. No second job was taken.

The package now targets OpenAI's 4 October 2026 Theorem 1.1 for **every**
imaginary quadratic field and **every** elliptic curve. Its eight layers follow
the geometric prime-switch route. The final theorem has no auxiliary
modular-curve rank, model, torsion, Picard or Gaussian-data premise.
`review.json` records acceptance of this completed fix, with the prescribed
`fix-` reviewer identity; independent review remains the programme's next step.

## Inputs and disposition of the findings

Read WORKERS, PROTOCOL, PACKAGE_REVIEW, UPSTREAM_GUIDE, the expansion protocol,
the PadicMeasuresIwasawaAlgebras exemplar, the whole previous package and its
review record, all three available package reviews, and the preceding
`FIX-PKG-…~adv` handoff. The issue-named `REV-PKG-…~adv.md` is absent from the
clone. The available reports are the unnumbered report, `~2` and `~3`; none was
silently substituted for a nonexistent fourth report. The accepted round-three
report explicitly recognizes the binding 12 October compact Lean shape.

| Finding or binding instruction | Change and disposition |
|---|---|
| The previous endpoint was conditional on finite X₀(15)(K) and explicit arithmetic data. | Replaced it with `imaginary_quadratic_modularity`, the all-K, all-E endpoint of OpenAI Theorem 1.1, p.1. There is no rank-zero or finite-point premise. The non-CM cuspidal and CM induction/sum cases are separate. |
| Remove all named modular-curve data hypotheses. | `LevelFifteenModels`, `QuadraticLevelFifteenTorsion`, `GenusOneModel`, `GenusOneJacobian`, `GenusOneRationalPicard`, `GenusOneQuadraticPoints`, `GaussianComparisonData` and `ExceptionalCurveData` are absent from the new package. No replacement arbitrary proposition or bundled assertion hides them. |
| The old computation route must not survive as an unexplained supplier. | ComputationalNumberTheory remains dropped. Removed the old Cartan/modular-curve coordinate catalogue, genus-one/genus-two/quartic point classifications, Mordell–Weil ranks, saturation, sieves and Gaussian finite-data comparison from this retargeted package. Their old APIs and tests are not claimed to have been preserved: they belong to the superseded proof route. This deletion is the issue's explicit unconditional retarget, not a claim that those computations were proved or unnecessary in the old argument. No algorithms or certificates were added. |
| Supply the geometric prime switch in source order. | Layers 1–4 give the covers, both degenerations, integral regular-module marking, adjacent vanishing cycles, rank-two character systems, elliptic endpoints and integral p,3,p congruences. Layers 6–7 give local conditions and one simultaneous specialization. Layer 8 gives the three lifts, descent and all local factors. The section map below records the locators. |
| Automorphy inputs need exact owners and hypotheses. | The supplier table and §5.2 use ModularityAndLanglandsExtensions §2.6's **full** CN Theorem 5.2. CL.9's extra degree-three/A₄ qualification is identified and is not used to justify the arbitrary large-prime step. The actual applications are at 3 and p>100, so the exceptional lifting condition at 5 is not discarded from a theorem to which it applies. |
| The first modular curve must have an independently proved seed. | §§5.3 and 8.2 use the CN Theorem 6.1 consequence through `CMResidual.modular_curve_with_types`, with the independent AKT and R21.1/R21.4 inputs. The seed uses prime 5 exactly once; it is not obtained by invoking the final theorem. |
| Existing geometry and compatible systems must not be replanned. | Twists, Pic⁰, Jacobians, Néron models, comparison, generic Picard–Lefschetz, Hilbert irreducibility and automorphic transfer remain with their exact existing owners. `characterSystem` populates SmallRamification §5.0d's live `AutomorphicSystemData`; no new compatible-system carrier is introduced. |
| Coefficient and Frobenius conventions must agree. | H¹ is the dual of the covariant Tate module, with determinant ε⁻¹, Hodge degrees {0,1}, geometric Frobenius and the stated recᵀ normalization. Full covariant arithmetic Tate polynomials in Layer 6 are explicitly different local objects from invariant-space Euler factors. The q=4 determinant and two-root Euler witnesses occur in both README and Lean. |
| Residue-characteristic local assertions were easy to overstate. | Potential crystallinity and ordinary filtrations in §6.6 are restricted to coefficient primes above the local residue prime. Full N-rank in the totally toric case is stated at every coefficient prime, using potentially semistable comparison at the residue prime. Away from that prime the potentially good case is potentially unramified. |
| Simultaneous genericity must retain conjugates and constants. | §7.2 gives the d-conjugate trace bound, with a concrete original imaginary-quadratic specialization. §7.3 retains the arithmetic quotient and its constant-field kernel. §7.4 uses one compatible open at each specified place and the normal closure of the base field composited with the actual cyclotomic fields; an arbitrary extension that might kill the original image is not allowed. |
| Descent, local comparisons and CM cannot be left implicit. | §8.4 fixes the inverse descent character; §§8.1 and 8.5 separate Varma's semisimple Weil input from the additional arguments recovering N and coefficient-prime Euler factors. §8.6 uses CM eigenspaces, the existing rank-one geometric-character theorem and all-prime avatar dictionary, then quadratic induction or a sum. The main EllipticCurves roadmap's CM vocabulary is not misidentified as the main CM theorem. |
| Generality must be source-supported. | The geometric, congruence, local and specialization layers use arbitrary number fields where justified; elementary Lean formulas use arbitrary groups, fields or commutative rings as appropriate. The final theorem remains imaginary quadratic. The downstream section records Le Hung's totally real/CM generalization with its geometric hypotheses, and the CM repair proving the seed over K **before** adjoining roots of unity. |
| Every definition needs checks; fabricated Lean carriers are forbidden. | The README contains the full geometric definitions, API targets and discriminating controls. Six light formulas have genuine bodies on existing Mathlib carriers and at least three associated Lean examples each. Nine heavy definitions and the absent-carrier milestones are named in the closing Lean comment. No sorry-defined data, fake representation, arbitrary `Prop` input, or `True` placeholder was added. |
| Every touched statement needs a mathematical adversarial pass. | The two tables below cover all 22 Lean theorem signatures, the six light definitions, every geometric definition and the complete README target/API families. Degenerate and sign controls are explicit. Numerical calculations are not represented as proofs of geometric or automorphic theorems. |

## Primary-source reading and layer map

Read the **whole** supplied OpenAI paper and the whole supplied Le Hung
discussion draft, then checked the OpenAI PDF's actual printed pagination and
the fixed public repository revision. No source passage or sequential source
summary is deposited in the repository. The package is organized around the
mathematical dependencies and states the mathematics in original prose.

| Source result and printed pages | New package location |
|---|---|
| OpenAI §2, p.4; Theorem 1.1, p.1 | Conventions, summary and §8.6 endpoint. |
| §3, Lemma 3.1, pp.5–6 | Layer 1: normalized function, covers of twists, quotient exponents and dihedral action. |
| Lemma 3.2 and Proposition 3.3, pp.6–7; Remark 3.4 and Lemma 3.5, p.7 | Layer 2: regular models, compact-type E^m fiber, explicit exceptional function and nodal m-edge fiber. |
| §4, Lemma 4.1 p.8, Proposition 4.2 and Remark 4.3 p.9, Lemma 4.4 p.9, Theorem 4.5 pp.10–11 | Layer 3: integral marking, adjacent differences and two transformations in a common basis. There is no cited “Corollary 4.3.” |
| §5, Proposition 5.1 pp.12–13, Proposition 5.2 p.13, Lemma 5.3 pp.13–14, Corollary 5.4 p.14 | Layer 4: actual character eigenspaces, elliptic realizations and integral character evaluation giving the p,3,p chain. |
| §6, Definition 6.1 pp.14–15, Theorems 6.2–6.4 pp.15–16; auxiliary-prime choice §5 p.11 | Layer 5: large image, cyclotomic field, exact applied lifting and independent residual-modularity input. |
| §7, Lemmas 7.1–7.2 pp.16–17, Proposition 7.3 pp.17–18, Lemma 7.4 pp.18–19, Proposition 7.5 p.19 and Corollary 7.6 p.20 | Layer 6: torsion constancy, finite full Tate polynomials, reduction constancy, all-prime N-rank and local opens. |
| §8, Lemmas 8.1–8.3 pp.21–23, Proposition 8.4 pp.23–25 | Layer 7: regular monodromy word, original-endpoint genericity, full finite arithmetic quotient and one Hilbert specialization. |
| §9, Lemmas 9.1–9.2 pp.25–26, Proposition 9.3 p.26, Lemma 9.4 p.27, §9.4 pp.27–28 | Layer 8: coefficient changes, local type recovery, seed plus three lifts, descent, local parameters, complex parameter, L-shift and CM. |
| Le Hung Theorem 1.1 p.2, §2 pp.4–5, §3 pp.6–7, §4.4 p.8 and §4.6/Remark 4.2 p.9 | Generality boundary, reflected character comparisons, d-conjugate genericity and seed-before-cyclotomic-base-change distinction. |

Freshly inspected public primary versions:

| Source | Version, reading scope and checksum |
|---|---|
| [OpenAI PDF](https://github.com/openai/math/blob/adc7f1241b42e322a6451854ab7e4b4c146bf78a/preprints/Modularity-of-elliptic-curves-over-imaginary-quadratic-fields-October-4-2026/paper.pdf) | Fixed revision `adc7f1241b42e322a6451854ab7e4b4c146bf78a`; whole paper read. SHA-256 `c74cc37755f500be0c22ccb4d08ce81df309404a7175a7fb6cf7321330b5187c`. |
| Le Hung discussion draft | Supplied `hexagon:2610.00156v1`, dated 7 October 2026, whole draft read. Supplied text SHA-256 `f70f104352a2de66b20dbb00a51299407143568d35748e8e4a7f495554694337`. No independent public publication URL was established, and no refereed status is claimed. |
| [CN v3](https://arxiv.org/pdf/2301.10509v3) | Read Definition 2.1.27 p.25, full Theorem 5.2 and remarks pp.73–74, Theorem 6.1 p.87 and proof p.90, Lemma 6.1.3 p.88 and relevant residual constructions pp.88–90. Propositions 6.1.5–6.1.6 are not called lemmas. SHA-256 `57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3`. |
| [AKT v2](https://arxiv.org/pdf/1910.12986v2) | Checked the named independent suppliers and primary locators Theorems 7.1 p.67 and 8.1 pp.71–72, Proposition 9.12 p.79 and §9 pp.73–81. This report does not claim a fresh complete reading or checksum of the 97-page paper. |
| [Varma v1](https://arxiv.org/pdf/1411.2520v1) | Read the p.1 theorem statements and relevant local comparison passage. Theorem (1ss) supplies Weil semisimplification; Theorem (1) bounds N. SHA-256 `24076dfcc6ca9b9e3168efb0150e75d5200f66e64085625b3e52895cfd1e56ef`. |
| [ACC+ v2](https://arxiv.org/pdf/1812.09999v2) | Read §7.1, PDF printed pp.189–190, for data/predicate separation. These are PDF page locators, not the published Annals pagination. SHA-256 `7c882c4dc7208e08a0b1f4b3ce6e5c5234c9815f139a4c3a372898378a24d08c`. |
| [Algebraic Hecke-character notes](https://math.stanford.edu/~conrad/DarmonCM/2011Notes/algebraicHeckecharacters.pdf) | Read the second Lemma 1 and proof pp.9–10 for the rank-one bridge used through the existing geometric-character owner. |

The cleared-library index was consulted. No restricted book or passage was
used, and no source files or extracts are committed.

## Supplier and current-library audit

The README's exact supplier table is the authoritative contract list. In
particular:

- **Full CM lifting:** ModularityAndLanglandsExtensions §2.6,
  `TauCeti.PotentialAutomorphy.potentiallySemistableCM`, realizes CN Theorem 5.2.
  Its determinant, Hodge degrees, potentially semistable condition, decomposed
  genericity, cyclotomic absolute irreducibility and local alternatives are
  attached to each application. GL2ModularityLifting supplies rational/totally
  real closure, not this theorem. No unneeded adequacy, scalar-image or
  polarization premise was invented.
- **Independent seed:** the same owner's §2.29,
  `CMResidual.modular_curve_with_types`, and its CN Theorem 6.1 consequence,
  with OrdinaryAutomorphicFormsAndModularityLifting R21.1/R21.4 and the AKT
  input. EllipticCurveModularity R29.6 and ClassicalSerreModularity are
  transitive inputs only.
- **Shared systems:** SmallRamificationAndAbelianVarietyBaseCases live upstream
  PR #970, §5.0d at revision `2687dda174737b65c65d3abe257f848bfc77c444`, was
  fetched and read. Its raw arbitrary-number-field/rank carrier retains finite
  realization extensions, good polynomials and labelled Hodge data.
  PotentialModularityAndCompatibleSystems R24 and AutomorphicGaloisRepresentations
  §7.1 provide the compatibility predicates/operations through an explicit
  adaptation, not a second raw record or an automatic descent to M_λ.
- **Geometry:** current EllipticCurves Layer 5; JacobianChallenge A–D/F;
  AbelianSchemesAndArithmeticModuli A0.3/A3/A6; NeronModelsAndSemistableAbelianVarieties
  §§3.5/3.10/3.14, §§4.1–4.4/4.13, §§5.3/5.6 and §6.10
  `StrictCompatibleSystemExport`; LefschetzPencilsAndVanishingCycles LPV.2/LPV.7a.
  These general constructions are imported, not proposed again.
- **Specialization and descent:** InverseGaloisAndArithmeticFundamentalGroups
  IG.0/IG.2, and GL2AutomorphicRepresentationsAndTransfer R16.3–R16.6/R17.4.
  Hilbert density is applied on an open affine space after Weil restriction,
  with connected covers that may have a constant field. Cyclic descent uses
  actual irreducibility and a specified character correction.
- **Galois comparison and CM:** ArithmeticGaloisRepresentations R01.2/R01.4–6,
  Faltings R28.4, AG2.4–AG2.7 for the stated nonselfdual comparison, and
  AutomorphicGaloisRepresentations §3.13 plus AG2.0 for geometric rank-one
  characters and all-prime avatars. The CM application in §8.6 uses these
  existing interfaces. It does not add the outside-closure general explicit-CM
  reciprocity package as a new dependency or redevelop its theorem.

Read the reviewed library-coverage data, including relevant elliptic/Jacobian
entries. It contains no new audit entry for the geometric switch; absence of a
JSON key was not treated as proof of absence. Inspected actual definitions at
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Checked Finsupp, RatFunc constructor
and reduced evaluation, polynomial operations, ZMod, circulants, matrix
determinants/traces/actions, units/order and complex norm/conjugation. Generic
transvections/circulants already exist; the kept definitions are the specific
formulas used in this construction.

Compared by mathematical objects, rather than names alone, with current
TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The search included the nine
roadmaps newer than the atlas snapshot and Completed. Read current elliptic
twist/Tate and Jacobian/Picard interfaces and relevant nearby roadmap sections.
The library's existing `WeierstrassCurve.tateModuleGaloisRepresentation` is a
covariant ingredient, not a new target here. No second cover-specific integral
marking, adjacent-cycle monodromy or residue-prime character congruence theorem
was found. Current read-only checkouts were never edited or built. All consumed
in-order suppliers precede this tier-28 application; no ownership move is needed.

## Adversarial pass: light definitions and all Lean statements

All mathematical statements were checked against their actual binders. The
following table covers the six definitions, all 22 theorem signatures, their
README API promises and all 29 examples. Every definition has at least three
associated examples. The examples have admitted proofs, consistent with the
roadmap shape; the independent calculations below check the elementary values.

| Definition / statements | Instances and calculations | Result / repair |
|---|---|---|
| `coverDivisor`; `coverDivisor_degree`, `_abel`, `_abel_mul` | Arbitrary additive abelian group; Z and Z/m for m=1,2,3,5; n=0,1,2 and 303; colliding points. For n=3,R=1,S=3 coefficients are 1,−1,−3,3. S=4 has degree zero but Abel sum 2. | No collision-free or torsion-free premise is needed for the formula. Principality is a separate geometric assertion with S=nR. n=1,S=R gives zero, not a branched cover. Three Lean controls. |
| `exceptionalFunction`; `_eval`, `_cancel`, `_at_zero` | n=0 and 1 reduce to 1. At n=3, values at 0 and 2 are 1 and −27/5; n=2 at 0 gives −1. Checked cancellation for positive m dividing n, including non-squarefree n. In characteristic 3, n=3 gives −1 at 0. | `_at_zero` needs odd n and characteristic zero. Evaluation guards exclude zeros of the presented denominator even though reduced RatFunc evaluation can extend further; n=1 at 1 equals 1 after cancellation. `_cancel` retains m>0 and m∣n. Six controls. |
| `cyclicLaplacian`; `_symmetric`, `_row_sum`, `_pairing` | m=1 matrix zero; m=2 has diagonal 2 and off-diagonal −2; m=3 has 2,−1,−1. All basis pairings and row sums for m=1 through 7, including constant vectors. Delta at 0 for m=3 has energy 2. | Symmetry permits m=0 as an infinite indexed matrix; sums/pairings require NeZero m and hence finite ZMod m. Positive energy is not claimed on constants. Four controls. |
| `switchCoefficient`; `_factor`, `_inv`, `_ne_zero` | Unit 1 gives 0; unit 2 over Q gives −1/2; unit −1 gives 4. Primitive cubic roots give 3. Checked nonzero scalar over fields, including characteristics 2/3 and nontrivial units. | Formula −(u−1)²/u pins the sign. Unit and field hypotheses matter; a ring with nilpotents would invalidate the nonzero iff assertion. Three controls. |
| `switchMonodromyWord`; `_det`, `_trace` | General commutative ring, zero ring and c=0, k=0/1/2/3, all four sign choices. c=3,k=2 gives traces 20 or −16 and determinant one. Mod 5 the trace is 0, not ±2. At characteristic 2,k=2 trace regularity collapses. | Determinant/trace formula remains general; regularity is a separate odd-characteristic theorem. Four word controls plus the opposite-unipotent matrix example. |
| `prime_order_switch_regular` | Characteristic 3, prime-order u of order p>100. The two exceptional quartics have roots in extensions of degree at most four, giving order at most 80; tested the displayed plus factorization and cyclotomic minus case. | The order and prime lower bound are actual hypotheses. Not applied to order 1,2,3 or characteristic 2. The theorem is not a claim about arbitrary scalar c. |
| `opposite_unipotents_fixed`, `opposite_unipotents_noncommute` | Nonzero upper/lower coefficients over fields F3,F5,F101; solve both eigenline conditions. Direct products at coefficients 1 distinguish their two diagonal entries. Either coefficient zero defeats the assertion. | Both nonzero hypotheses retained. Field assumption excludes zero-divisor counterexamples; neither theorem asserts an arbitrary pair of unipotents is opposite. |
| `conjugate_trace_union_bound` | d=1,2,3,10,50; p>2d+1; exact fraction 2dp/(p²−1). p=1 makes the denominator zero; equality/borderline choices are outside the theorem. | Natural d>0 and strict lower bound on p give positive denominator and a strict inequality. No division by a totalized zero is used in the argument. |
| `unitary_euler_shift_witness` and polynomial example | Two roots α=β=2 at q=4 give 1−4T+4T². Unitary roots are both 1; substituting 2T in (1−T)² gives exactly that polynomial. | Pins both coefficients and the −1/2 analytic shift; a reversed scaling fails. Does not assert a new general local Langlands theorem. |
| `complexInfinityParameter`; `_det`, `_mul`, `_conj` | i gives diagonal (i,−i), trace 0 and determinant 1; 2 gives I, −1 gives −I. At 0 the totalized formula is zero with determinant 0. Checked multiplicativity using exact rational Pythagorean complex pairs and inputs involving zero. | Determinant theorem requires z≠0. Multiplicativity holds also at zero as a matrix identity, but the parameter group domain is C×. Conjugation exchanges the two entries. Three controls. |

Additional Lean examples pin quotient exponents 303/3 and 303/101, dihedral
inversion, the distinction between arithmetic Tate and dual determinants at
q=4, and inverse descent-character correction: 2·4=1 in F7 whereas 2·2=4≠1.
These are formula witnesses, not substitute carriers for curves or characters.

## Adversarial pass: geometric and arithmetic target families

The families below include their full `.mem`, `.sections`, base-change,
functoriality, rank, determinant, Hodge, reduction and congruence APIs in the
README. Heavy carriers stay there under the 12 October rule. “Pass” means a
source/hypothesis and mathematical-control audit of a proposed target, not a
formal proof.

| Statements / API family | Instances, counterexamples and boundaries | Result / change |
|---|---|---|
| `switchParameterOpen`, `markedTwistFamily`, `parameter_open_nonempty` | Singular h, h(t)=0, n=1 empty open, n=3 torsion exclusions; ±s choices on the constant-family cover. Number-field characteristic zero makes the nonzero multiplication kernels finite. | Kept separable cubic, h(t)≠0, pairwise distinct five points and n odd ≥3. R and S are actual sections; no global square root assumed. |
| `coverFunction` divisor, origin, negation and base change | Degree zero with nonzero Abel sum fails principality; scalar multiples preserve the divisor but generally fail f(−Z)=f(Z)⁻¹. O is outside support. | Unique normalization f(O)=1 gives descent and reflection; not every degree-zero divisor is principal. |
| `cyclicCover` branch/genus/dihedral/quotient | m=1 identity, m=3 genus 3 from two branch contributions; m=2 outside odd family; residue characteristic dividing m outside this characteristic-zero smooth family. Quotients to C3 and Cp use exponents p and 3. | Normalization and proper charts retained, with m>1,m∣n and exact ±1 branch valuations. Reflection is over k, rotations over k(μ_m). |
| `boundary_regular_model`, `compactTypeModel`, `compact_type_jacobian` | DVR uniformizer versus a unit, smoothing order one versus higher order; n0/n1 exceptional-function degeneration. Rational spine with m elliptic leaves has tree graph. | Local charts and blowups are targets on actual proper models. Compact-type Jacobian is E^m; arithmetic characteristic dividing m is not silently covered by the topological computation. |
| `nodalModel`, graph lattice and normalization/torus APIs | Two vertices and m parallel edges give b1=m−1; one elliptic component contributes 1, so genus m. m=3 gives toric rank 2. | Nodal Jacobian is not a product E^m. The unramified elliptic cover has exact m-torsion class; the smoothing coordinate includes −2n. |
| `slit_marking`, `integral_regular_module`, `integral_regular_module_etale` | Rank 2m over Z versus rank 2 over Z[Z/m]; unimodular pairing, m=1 identity case; coefficient primes dividing m. | Integral freeness precedes any character evaluation. No integral idempotent containing 1/m is assumed at a prime dividing m. Comparison transports the integral lattice with all cycle labels. |
| `vanishing_cycles_adjacent`, `common_basis_monodromy` | Adjacent differences sum to zero; constant vector in Laplacian kernel; all four Picard–Lefschetz signs and orientation reversal. | Both monodromies are in one transported basis. One cannot independently conjugate them or square the smoothing transvection. |
| `characterSystem`, `character_system_properties` | Trivial and primitive characters, θ versus θ⁻¹, coefficient primes dividing n, finite realization extension versus M_λ. H¹ rank 2, determinant ε⁻¹ and degrees {0,1}. | Uses actual deck eigenspaces on the shared raw carrier plus separate compatibility proofs. No assertion that a rational coefficient polynomial alone provides coefficient descent. |
| `character_order_quotient`, `trivial_character_twist` | Orders 1,3,p,3p, quotient degree divisible by the coefficient characteristic; trace/norm comparison is rational while residual congruence uses the marked integral lattice. | Quotient power and character label agree; V1 is H¹(B_t), not automatically H¹(E). |
| `auxiliaryEllipticCurve`, `cubic_character_elliptic` | C3 has genus 3; reflection quotient D has genus 1. D may have no k-rational point. | A_t is Pic⁰(D_t) over k before cyclotomic base change; it is not D with an invented origin. Non-CM is proved after specialization, not imposed on all fibers. |
| `characterLattice`, reduction/isomorphism/base-change APIs | Z_ℓ group-ring module free of rank 2; characters can reduce to the same map at a prime dividing n; nonflat arbitrary module would fail the dimension assertion. | Tensor evaluation of the actual free lattice gives the congruence, independent of unavailable integral character projectors. Semisimplification and a common coefficient extension are explicit. |
| `prime_switch_congruences` | χ=ηψ, with η of order 3 and ψ of order p, gives at p: χ→η and ψ→1; at 3: χ→ψ. Both coefficient primes dividing n are essential. | The chain is Vη ≡p Vχ ≡3 Vψ ≡p V1 with consistent labels and M embeddings. Character reduction is checked by the prime-order/binomial control. |
| `cyclotomic_switch_field`, original large-image and decomposed-genericity inputs | Non-CM excludes finite-image/toric CM failure. p>100 avoids small primes; at 5 an imaginary quadratic field has ramification index ≤2, not a multiple of 4. | F=K(μ3p) excludes ζ5 in the IQ case. The large-image argument uses the controlled cyclotomic extension and its commutators, not arbitrary base extension. |
| `switch_lifting_hypotheses`, full applied lifting statement | ℓ=3 or p>100; ordinary/potentially crystalline nonordinary/potentially multiplicative alternatives. Cyclotomic absolute irreducibility is stronger than irreducibility. | Exact CN theorem applied; no ℓ=2 use and no unjustified use of CL.9 at large p. No arbitrary representation is treated as geometric from its determinant alone. |
| `auxiliary_seed_automorphic`, `modular_elliptic_all_coefficients` | F CM without ζ5, mod-5 cyclotomic irreducibility and decomposed genericity; independence from subsequent p,3,p lifts. | Seed supplier used once. All-coefficient elliptic compatibility is invoked only after modularity; no circular endpoint premise. |
| `finite_torsion_locally_constant` | Every positive N, including powers of the local residue prime; characteristic-zero local field versus special fiber, N=1 trivial group. | Generic-fiber finite étale torsion/isomorphism space supplies local sections. Not an assertion that integral p-torsion is étale. |
| `full_tate_polynomial_finite` | g=0 gives polynomial 1; g=1 split Tate full polynomial has two roots whereas invariants give degree one. Residue size Q>1, not q=1. Torus/abelian/lattice roots have sizes Q,√Q,1. | Full covariant arithmetic polynomial has integral coefficients and explicit finite bounds. It is not det(1−Frob T on inertia invariants), and the coefficient bound uses Q^j. |
| `local_reduction_constancy` | Potentially ordinary versus supersingular elliptic fibers; higher-dimensional nonordinary need not have only slopes 1/2; finite extension fixed across a neighborhood. | Deep enough finite torsion and a finite polynomial census recover toric rank and Newton polygon after one extension. Odd auxiliary torsion and the separate −1 test retain their hypotheses. |
| `totally_toric_monodromy_rank` | g=0, g=1 Tate rank one, coefficient prime equal to residue prime; arbitrary Galois-invariant subspace versus an incorrectly descended kernel. | N has maximal rank g in dimension 2g for every coefficient prime. At the residue prime, use Q_r as kernel scalar field in the descent step, not Q. |
| `local_type_opens`, `character_local_types` | R0 near O is in a local punctured neighborhood; lifting a square unit preserves the twist; local opens can conflict if independently imposed at one place. | One nonempty open per place, including all finite bad places and those above 3,p. Potentially good, ordinary/supersingular and toric behavior are separate. Coefficient-prime restriction for crystalline/ordinary statements is explicit. |
| `character_geometric_irreducibility`, `character_regular_word` | θ=1 excluded from the nontrivial-character monodromy argument; nontrivial opposite unipotents have no common invariant line. Traces 20/−16 at 5; characteristic 3, p-order scalar and exceptional degree≤4. | Every required nontrivial character has cyclotomic absolute irreducibility and a regular word in the indicated residual characteristic. Small/zero scalar cases are excluded rather than assumed regular. |
| `original_endpoint_generic`, conjugate-counting API | Quadratic twists leave projective image unchanged. SL2(Fp) has p² elements of each trace ±2; d-conjugate union has fraction at most 2dp/(p²−1). | All original elliptic twists retain the genericity witness. d=2 specializes correctly; common conjugates/constant fields are tracked. |
| `hilbert_full_quotient` | Trivial cover, connected cover with constant field, disconnected products, empty opens and a general variety without Hilbert property. | Connected finite covers of open affine space, nonempty compatible local opens and full arithmetic image are the actual hypotheses. Its intersection with the constant-field kernel is preserved after the specified base change. |
| `simultaneous_specialization` and its all-character/residual/local APIs | Finite character set and three (m,ℓ) pairs; original endpoint; k rational versus arbitrary number field; extra ζ5 compositum; noncommuting odd-characteristic images. | Weil restriction gives an open affine space over Q. One t meets all opens and retains all arithmetic quotient images, including over cyclotomic extensions. A_t is non-CM by the odd-prime noncommutation control. No quantitative parameter bound is asserted. |
| `character_automorphy_change_prime`, `character_automorphic_local_type` | Change coefficient prime with fixed θ and coefficient embeddings; semisimple Weil equality with/without nonzero N. | Good-place polynomial recognition transfers automorphy. Varma gives only the stated ss input; purity/local Frobenius ratios force N=0 where needed, while the toric branch gives a quadratic Steinberg twist and its ordinarity. |
| `three_lift_automorphy` | Start at A and five, then coefficient sequence p,3,p. Check each row's congruence, both residual conditions, local alternative and automorphic companion. | No fourth unsupported lift. Local types from Layer 6 and specialization from Layer 7 discharge the full CN hypotheses in every row. |
| `cyclic_representation_descent`, `switch_descent_to_original_curve` | Irreducible representations agreeing on an index-one or cyclic subgroup differ by a quotient character; if rπ0=r⊗δ, twisting by δ gives the wrong answer unless δ²=1. | Twist by δ⁻¹ under fixed reciprocity, then descend through the CM soluble tower. Finally remove the B_t/E quadratic twist. Fixed direction witnessed over F7. |
| `elliptic_full_local_comparison` | Good, potentially good with nontrivial inertia, and potentially multiplicative: Euler degrees 2,0,1; v∤ℓ full WD versus v∣ℓ Euler comparison. | Full F-ss WD retains inertia and N away from ℓ; coefficient-prime local factors are proved by their separate cases. No all-place monodromy equality is inferred from Varma alone. |
| `elliptic_complex_parameter`, `elliptic_L_function_identity` | z=i,2,−1 and zero-domain exclusion; q=4 two roots equal 2; central determinant after unitary twist. | Complex parameter diag(z/|z|,bar z/|z|), trivial central character and L(E,s)=L(π,s−1/2) agree. Normalization witnesses are mirrored in Lean. |
| `cm_elliptic_realization`, `imaginary_quadratic_modularity` | K=Q(i), CM by Q(i) gives a sum; CM by Q(√−3) gives induction from KQ(√−3). Geometric non-CM differs from absence of K-rational extra endomorphisms. | All elliptic curves included. Cuspidality only required in the non-CM branch; CM induction need not be a sum over K. CM eigenspaces consume the geometric rank-one supplier, not an unowned main CM theorem. |
| Downstream totally real / wider CM contract | K without ζ5 can have K(μ3p) containing it; the draft's K=Q(ζ15+ζ15⁻¹,i) is the explicit counterexample. | Wider CM seed is proved over K before base change; the IQ ramification proof is not generalized incorrectly. The draft's geometric hypotheses remain attached, and ζ5∈K is not claimed. |

Global domain audit: geometric families and local arithmetic use characteristic
zero and number fields/local fields of the stated sort. Characteristic 2,
equal-characteristic local fields, ℓ∣n, m=0/1/2, trivial characters, zero modules
and rank-zero cases were tested only where the individual carrier permits
them; where excluded, the actual hypothesis is named. A residue field of size
one does not exist and no finiteness proof divides by q−1 under q=1.
No compactness, unit-ideal or integration assertion appears here to which an
unrelated noncompact or DVR example could be applied. Field-only scalar
nonvanishing is not promoted to a general ring statement. Sign controls are
computed in the README and Lean for all the retained light normalizations.

## Validation and completion

- Final `lean-check research/blueprint/packages/EllipticCurveModularityImaginaryQuadratic/Suggested.lean`:
  **exit 0, zero errors, 51 warnings, all `declaration uses sorry`**. The 309-line
  file has six real-bodied definitions, 22 theorem signatures and 29 examples.
  Available memory exceeded 20 GB before each run; no language server or
  prohibited Lake command was used, and no Lean process remains running.
- `python3 scripts/check_sorry_data.py` on the suggested file: **exit 0**.
- Independent standard-library exact arithmetic: **nine control families
  passed**. They cover formal divisors; rational-function cancellation and
  values; dihedral matrices/quotient powers; Laplacian basis pairings; scalar
  and unipotent formulas; characteristic-three quartics/order bounds; SL2
  trace counts/conjugate union bounds and character reduction; full Tate
  versus invariant polynomials/elementary slope controls/inverse descent;
  complex parameters/duality/Euler rescaling. These do not prove rank,
  specialization or automorphy targets.
- `python3 scripts/check_blueprint.py` on the **unchanged legacy packet**:
  **zero errors, zero warnings**, 68 nodes, 69 API entries, 69 tests. This
  validates that existing packet's syntax and closure, not the new retargeted
  package's mathematics. Its old target inventory is not represented as the
  inventory of the rewritten package.
- The four deliverables pass `research/blueprint/intake.py check-files`, JSON
  parsing, the package size and Lean shape limits, and `git diff --check`.
  The README carries the full statements rather than a fake formal endpoint.

Only the issue's four deliverable files change; metadata, packets, reader data
and upstream checkouts are untouched. This is a completed package fix, not a
checkpoint. There is no unresolved finding in the authorized package files.
The roadmap's future mathematical formalization remains the work it plans.

**Maintainer follow-up outside this issue's file scope:** the legacy blueprint
packet and upstream TauCetiRoadmap PR #1048 still describe the prior conditional
CN/modular-curve route. Port this new package as their unconditional replacement
and refresh that historical inventory/order description when updating those
files. The package's new theorem does not depend on their old arithmetic-data
hypotheses. No extra claim or unauthorized edit was made to update them.
