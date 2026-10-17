# Completed package fix: PotentialAutomorphyInfrastructure

Job #9892, `FIX-PKG-PotentialAutomorphyInfrastructure~adv`, completed by Codex, session `codex-jsQyDj`, on 2026-10-17. The winning claim and bot confirmation are issue comments 6233911314 and 6233912642. This is a complete fix, not a checkpoint. The issue's named `~adv` review file does not exist; its explicit round-3 instruction and the latest report, `reviews/REV-PKG-PotentialAutomorphyInfrastructure~3.md`, determine the findings repaired below. The verdict uses the date 2026-10-16 explicitly prescribed by the issue; the work date is recorded here.

## Finding dispositions

| Finding | Repair and source | Result |
| --- | --- | --- |
| R1: local ordinary operators and twisted Steinberg | §§3.44/3.46 give the precise characteristic-zero Jacquet comparison, including the inverse Borel modulus, and compute the Steinberg eigenvalues before applying the negative weight exponent. Geraghty's 12 March 2010 author manuscript, §5.1, Lemma 5.1.1, p. 59, Definition 5.1.2 and Lemma 5.1.5, p. 60, supply these inputs. The edition and its different numbering are explicit. | Resolved. Two computed rational examples pin the modulus and weight sign. |
| R1: nonsplit soluble ascent and descent | §3.47 uses Geraghty 2010 Lemma 5.1.6 and its proof, pp. 60–61, with the generic local segment argument and the separate descent argument producing a downstairs Jacquet character. Labelled weights and character slopes both scale by residue degree. §§5.21/5.23 consume this named target; the split argument is only a special case. | Resolved. The primary statement needs cuspidal base change for ascent, and permits descent from one place. Our stronger Galois CM/totally real hypotheses are sufficient. |
| R2: rank-one classification before de Rhamness | §2.8 adds `rational_abelian_is_locally_algebraic`, using the explicit published Henniart formulation in ERA 979, §5(a), Theorem 5.5, p. 48. Apply rationality to the entire semisimple abelian representation before extracting its de Rham characters and invoking CS §1.9. §2.9 uses this order in the isotypic case too. | Resolved. No full-member Hodge hypothesis is added. Representation comparisons do not identify arbitrary extremely weak Hodge metadata. |
| R2: rationalization and maximality | §2.12 adds `extremely_weak_rational_maximality`, checks Larsen's three Frobenius compatibility conditions, forms the sum over every coefficient place above ℓ, and restricts to one common connected-component field. Larsen, Theorem 3.17, author p. 25, supplies hyperspecial maximality of the simply connected inverse image. Larsen–Pink Proposition 6.14/§6.15, author p. 15, and Proposition 8.9, p. 18, supply connectedness and unramified monodromy separately. | Resolved. Density-one and simultaneous-all-λ quantifiers are retained. The conclusion is prime-field SL₂, with ℓ≤3 and the finite normal-closure obstruction excluded. |
| R3: triangulability and finite free tower models | §0.1 adds `arithmetic_finite_cell_models`: apply the smooth triangulation export of current Tau Ceti GeometricTopology to ALS.2.3/ALS.5a.1's rounded compact boundary pair, discharge ALS.2.4, and lift finitely many base cells to normal neat covers. This supplies free O[Δ] terms and bounds uniform in the cover; DP:P7 supplies reconstruction. §§5.8/5.17 retain the arithmetic verification. | Resolved. Compactness, neatness, free coefficient lattices and the relative boundary complex are explicit. No arbitrary topological-manifold triangulation theorem is asserted. |
| R3: Franke and Galois inputs | §0.1 adds `arithmetic_franke_inputs`, instantiating all three clauses of AS §5.14 `franke_input` through AS §§5.10/5.12. It specifies the two rational groups, dual-annihilator ideal, split-central balancing, full K∞, proper-support weight and normalized/unnormalized induction conversion. Finite quotient invariants descend from neat levels over C. AG2.4 and AG2.2/2.3/2.6 supply the GL and unitary Galois inputs for every Levi rank, with AG2.0/2.5 conventions. §§5.10/5.18 now separate concentration from nonzero automorphic contribution. | Resolved. Unconditional lifting targets are preserved; neither Franke nor triangulability is appended as an arbitrary lifting hypothesis. The unitary Siegel-weight condition remains essential. |

All older applied repairs are retained, including unramified integral Kostant theory, closed-alcove simplicity/Ext¹, continuous nonabelian H¹, residual Iwahori negative controls and spectral support. No packet, supplier, metadata, campaign or library file was edited.

The compatible-system supplier's existing stronger weak-system maximality statements are not used outside their hypotheses. The four new targets are arithmetic applications first needed here, not replacement compatible-system carriers or a second general Franke/triangulation theory. Consumers needing the pre-de-Rham rationality and extremely weak maximality applications should import §§2.8/2.12. No upward dependency or new external ownership move was introduced. The earlier auxiliary-CM ownership correction to §2.5 remains intact.

## Primary-source receipts

The mathematical statements in the repository are in our own words. Cleared sources were read in place; no restricted file, passage or image was copied. The Henniart input is sourced to its explicit published ERA 979 formulation, not to an unread numbered theorem in the 1982 chapter.

| Source inspected | Exact location and scope checked |
| --- | --- |
| [Geraghty, 2010 author manuscript](https://web.archive.org/web/20150927002339id_/https://www2.bc.edu/david-geraghty/files/oml.pdf) | §5.1, pp. 59–61, including proofs: smooth admissible characteristic-zero Jacquet comparison, ordinary normalization, generic constituents, Steinberg and soluble transport. Later publication numbers are not substituted for these locators. |
| [ERA 979, Les nombres transcendants](https://www.numdam.org/issue/MSMF_1984_2_13__1_0.pdf) | §5(a), especially Theorem 5.5, p. 48: rational abelian ℓ-adic representations and local algebraicity. The discussion credits Henniart and the underlying Waldschmidt transcendence theorem. |
| [Larsen, author manuscript](https://web.archive.org/web/20100712085741id_/http://mlarsen.math.indiana.edu/~larsen/papers/max.pdf) | Definitions 3.9–3.10/§3.11, pp. 22–23, and Theorem 3.17 and proof, pp. 25–26: compatible semisimple rational systems and density-one hyperspecial inverse images. No geometric-origin or Hodge assumption is present. |
| [Larsen–Pink, author manuscript](https://people.math.ethz.ch/~pinkri/ftp/LP2.pdf) | Definition 6.5, p. 14; Proposition 6.14/§6.15, p. 15; Proposition 8.9/Theorem 9.1, p. 18: compatibility, common connected field and unramified monodromy. |
| ACC, cleared author copy | Lemma 2.1.7 and proof, pp. 911–912; Theorem 2.4.10 and proof, pp. 948–951; §7.1 definitions and Lemmas 7.1.1–7.1.3 with proofs, pp. 1084–1089: actual arithmetic applications and weakened metadata. |
| Current supplier packages | ALS.2.3/2.4, ALS.5a.1, ALS.5b.4/5b.7–9; AS §§5.10/5.12/5.14; AG2.2–2.6; CS §§1.9/1.18–1.20. Read their contracts and the actual qualifications, rather than treating their titles as exports. |
| Current Tau Ceti GeometricTopology | Layer 11 and smoothing-and-triangulation comparison item 1, with its existing reference to relative smooth triangulation, Munkres Theorem 10.6, p. 104. The source book was not fetched. Only the owner's export/reference was used. |

The required additional sample was selected by `random.Random('codex-jsQyDj').sample(nodes, 15)` from the unchanged accepted packet. Each row was checked in the primary source. ACC numbers below are printed pages; the two other sources use author pages.

| Sample target | Locator checked | Verification |
| --- | --- | --- |
| `diamond_derived_augmentation` | ACC Lemma 6.5.9, p. 1066 | Derived diamond invariants and the selected-root comparison; dual augmentation retains derived tensor. |
| `hida_weight_specialization` | ACC Corollary 6.6.6, pp. 1077–1078 | Inverse weight character and Hecke-equivariant derived specialization. |
| `finite_ordinary_weight_control` | ACC Corollary 5.2.18, p. 1000 | Equality of the restricted lowest-weight characters modulo ϖ^m is required. |
| `ordinary_base_change_fields` | ACC §6.6.10, pp. 1082–1084 | Split test places, large p-adic degree, inertia and torsion-unit conditions; ordinary transport is a separate lemma. |
| `rank_two_symmetric_power_transport` | BCGNT §6.2, after Remark 6.2.2, p. 60 | Parallel weights and tensor application. Determinant exponent is the separately imported elementary symmetric-power calculation. |
| `completed_classical_ordinary_control` | ACC Proposition 5.2.15, p. 999 | Derived torus invariants, admissible depths and the finite ordinary complex. |
| `rank_two_member_irreducibility_equivalence` | BCGP Lemma 9.1.10(1), pp. 251–252 | One-member/all-member equivalence; ACC supplies the more general underlying classification. |
| `bruhat_evaluation_comparison` | ACC Lemma 5.3.5 and (5.3.6), pp. 1007–1008 | Evaluation at w and trace over the larger group modulo its contracted subgroup. |
| `ordinary_satake_homomorphism` | ACC §5.2.19, p. 1001 | Inverse central U and both conjugate-index formulas. |
| `corrected_rank_two_large_image` | BCGP Lemma 9.1.10(3), p. 252; ACC Lemma 7.1.3, pp. 1087–1089 | BCGP's full-residue-field statement is stronger than justified. The package retains the corrected prime-field subgroup. |
| `ordinary_unipotent_degree_shift` | ACC Lemma 5.3.7, pp. 1008–1010 | Orientation character, inverse Weyl action and shift −fn²+l(w). |
| `fontaine_laffaille_dimension_amplitude` | ACC proof of Theorem 6.5.4, pp. 1069–1070 | Dimension subtraction and nonzero rational dual fibre. |
| `split_test_prime_image_preservation` | ACC pp. 1072, 1082 | Residual/cyclotomic image equality and the preserved split generic witness. |
| `completed_arithmetic_cohomology` | ACC (5.2.11)–(5.2.13), p. 998 | Weight-zero full group action versus weighted monoid action. |
| `ramified_satake_descent` | ACC Theorem 2.4.8 and proof, pp. 946–948 | Trivial coefficients, different R/Rᶜ level branches and localization at positive operators. |

## Adversarial pass

Every numbered subsection was checked, including its API and existing Checks. The table records concrete computations or a reason a degenerate input is outside the hypotheses. A successful local computation is not presented as a formal proof of an arithmetic theorem. The global conventions exclude arithmetic rank zero; the independent finite combinatorial signatures still permit it. Fields of characteristic p and q=1 are used as negative or purely algebraic controls, not as mixed-characteristic local fields with those impossible residue cardinalities. “Retain” records no further change beyond the findings above.

| Statement | Instances tried and computed result | Disposition |
| --- | --- | --- |
| Conventions and both good-level profiles | n=2,f=2 gives d=8, qGL=2, ℓ₀=3 and dual range 3–6. At p=2 neither higher-rank profile holds. O/ϖ has an Ext¹ dual term. | Retain derived dual and strict bounds; explicitly exclude arithmetic n=0. |
| 0.1 | One cell, V=O², Δ=C₂ gives O[Δ]². V=0 gives zero. A C_p stabilizer has unbounded mod-p cohomology; noncompact triangulations need not be finite. GL₂ at q=5 gives traces 6 versus 2. | R3 repaired, with new Checks and polynomial Lean witness. |
| 0.2 | Identity retract has projector 1; actions 1 and 2 on Z cannot commute with identity inclusion. | Retain indexed equivariance and projector r≫i. |
| 0.3 | Rows (3,1), (−4,−6) give (6,4,3,1). Empty rows are allowed in the matrix core; dominance criterion needs n>0. | Retain negation and reversal. |
| 0.4 | λ=0 gives a rank-one lattice. In characteristic p, x^p,y^p span a proper stable subspace of Sym^p. Weight (p−1,0) is the closed endpoint. | Retain integral lattice and closed-alcove API. |
| 0.5 | Trivial representation splits; restriction of a standard Levi coefficient retains its particular direct summand. | Retain splitting, without claiming integral semisimplicity. |
| 0.6 | GL₂ weights (p−2,0) and (p,0) distinguish strict small-weight duality from unrestricted duality. | Retain strict bound distinct from closed simplicity. |
| 0.7 | Upper root scaled by ϖ has index q; at q=5 the correction is multiplication by 5. Trivial monoid gives identity. | Retain inverse modulus and evaluation's actual equivariance scope. |
| 0.8 | Identity level and trivial unipotent group reduce to the coefficient map. Nontrivial unipotents still require invariants. | Retain coefficient and subgroup domains. |
| 0.9 | Zero coefficient retract is zero; a nondominant lifted row cannot invoke the Weyl splitting. | Retain dominance. |
| 0.10 | Trivial weight recovers ordinary Satake; an Eisenstein ideal does not give the localized Siegel identification. | Retain non-Eisenstein condition. |
| 0.11 | R=∅ recovers unramified descent; R not stable under c requires two different level branches. | Retain trivial coefficients and both branches. |
| 0.12 | Rank-zero unipotent group has only H⁰; rank-one Z_p has exterior ranks 1,1. | Retain dual exterior action. |
| 1.1 | n=0 gives one permutation of length 0; n=1 gives lengths 0,1; n=2 internal transposition fails. | Retain inverse-increasing left-coset convention. |
| 1.2 | Ramified quadratic tensor reduction has nilpotents rather than distinct embedding factors. | Retain unramified-field hypothesis. |
| 1.3 | Trivial unipotent group has its single degree-zero term; ramified embeddings do not separate mod ϖ. | Retain unramified formality scope. |
| 1.4 | A zero localization shifts to zero; a missing split local identification cannot be replaced by a degree shift. | Retain standing field assumptions. |
| 1.5 | All-zero weights fail CTG even at rank one; two conjugate-pair sums 0 and 1 distinguish the condition. | Retain nonconstant-weight exclusion. |
| 1.6 | n=1 has no within-row strict pair; n=2 permits the prescribed single-embedding change. | Retain n≥2. |
| 1.7 | Zero cohomology has zero Hecke image; a map onto a Satake image need not be onto the whole GLₙ algebra. | Retain image scope. |
| 1.8 | Removing the auxiliary p-adic degree inequality removes the shift argument's hypothesis. | Retain the full inequality. |
| 1.9 | Two equal rank-one characters have diagonal image in B²; distinct residual characters yield both factors. | Retain henselian multiplicity-free condition. |
| 1.10 | J=0 is allowed; arbitrary scalar extension need not preserve a determinant kernel as an equality. | Retain kernel inclusion and quotient transfer. |
| 1.11 | Torsion-only cohomology becomes zero rationally; assertion about residual weights requires nonzero A. | Retain the separate nonzero clause. |
| 1.12 | For dimension 7, degree 2 reflects to 5; O/ϖ requires derived integral duality. | Retain compact-support comparison and twists. |
| 1.13 | The trivial character need not remove forbidden cross-ratios; a prescribed nontrivial finite character can. | Retain class-field prescription target. |
| 1.14 | m=1, C={4},D={1} tests recovery. Overlapping blocks fail the required union cardinality. | Retain positivity, separation and both cardinalities. |
| 1.15 | A zero degree cannot witness a nonzero eigensystem; complementary nonzero degrees use the dual ideal. | Retain localization and degree range. |
| 1.16 | A rank-one character is separate; in higher rank, ramified p-fields fail the FL input. | Retain alternatives (8a)/(8b) and weight bounds. |
| 2.1 | Identity extension preserves genericity; restriction to a residual splitting field can destroy it. | Retain normal-closure disjointness. |
| 2.2 | F′=F preserves images; overlap with the residual-cyclotomic field need not. | Retain both fields in the disjointness condition. |
| 2.3 | E=F is identity; reducible restriction may have noncuspidal base change. | Retain irreducible restriction for cuspidality. |
| 2.4 | Splitting every test place forbids the corresponding proper residual subextension; omitting one loses that test. | Retain separate V₀,V₁,V₂ roles. |
| 2.5 | Cyclic degree 1 gives F; prescribed unramified quadratic completion has degree 2, not splitting. | Retain distinct soluble-local and CM-cyclic contracts. |
| 2.6 | The identity field is insufficient if the p-adic degree inequality fails; quadratic composita preserve split test places. | Retain full auxiliary construction. |
| 2.7 | Whole-inertia agreement is stronger than open-inertia agreement; trivial residual inertia does not settle torsion units. | Retain field/character conditions separately from ordinarity. |
| 2.8 | 1⊕1 permits repeated constituents; 1⊕ε has true weights {0,−1}, but metadata {2,−3} has the same sum. A transcendental 5-adic character fails rationality. | R2 repaired; metadata Lean witness added. |
| 2.9 | Isotypic restriction needs classification before extracting the square root; an arbitrary square root of a de Rham character need not itself be de Rham. | Apply finite-extension descent after Henniart. Clarify representation versus metadata comparison. |
| 2.10 | H¹ of the trivial group is one point; trivial C₂ action on S₃ gives identity/transposition classes, not a 3-cycle. A ramified quadratic restriction of PGL₂ is not unramified-split. | Retain nonabelian quotient and form hypotheses. |
| 2.11 | Empty product gives trivial group; a diagonal PGL₂ in two factors is a subdirect product, not the full product. | Retain factor-surjection classification. |
| 2.12 | Norm of X²−√2X+1 is X⁴+1. Finite-image characters have trivial connected cover. SL₂(F₂/F₃) are not perfect. | R2 repaired; rationalization Lean identity added. |
| 2.13 | Empty family gives degree 1; repeated fields cannot be counted as independent factors. | Retain independent subfamily and finite nontrivial simple group. |
| 2.14 | Sym⁰ is one-dimensional; repeated root ratios violate higher-power genericity. | Retain rank and forbidden-ratio conditions. |
| 2.15 | Distinct independent simple factors give a product; duplicate extensions do not. | Retain both disjointness requirements. |
| 2.16 | Quadratic character agrees with 1 at density 1/2; characteristic-ℓ trace can miss ℓ repeated characters. | Retain density one and characteristic polynomials. |
| 2.17 | T=∅ is weak automorphy; deleting places preserves a witness, adding uncontrolled places does not. | Retain every-place quantifier. |
| 2.18 | Ratio |·| links two singleton segments; equal complex magnitudes exclude that ratio. | Retain normalized-induction convention. |
| 2.19 | Weak automorphy with no excluded places still needs purity for the finite local upgrade. | Retain purity. |
| 2.20 | Intersecting two density-one sets keeps density one; finitely many exceptions do not affect it. | R2 now supplies the maximality input. |
| 2.21 | Roots 2,3 give Sym² roots 4,6,9 and determinant 216=6³; m=0 repeats Hodge weights. | Retain exponent and m>0 regularity. |
| 2.22 | {1,0} equals {0,1}, while {0,0} fails. | Retain multiset equality. |
| 2.23 | diag(1,−1) is odd and identity is not in characteristic zero; without real places the condition is vacuous. | Retain characteristic-zero scope. |
| 2.24 | A sum of two weak characters is reducible at every member, including repeated characters. | R2 supplies the missing classification route. |
| 2.25 | Quadratic induction has reducible symmetric square; a strongly irreducible regular system excludes that case. | Retain regularity. |
| 2.26 | Extending coefficient residue field to F_{ℓ²} does not force projective image to enlarge from F_ℓ. | Retain corrected prime-field subgroup. |
| 3.1 | b=0 gives trivial diamonds; a unit ϖ gives the whole matrix group and trivial quotient. n=0 is trivial. | Retain generic congruence scope. |
| 3.2 | Zero and trivial modules are smooth; all functions on Z_p need not be, whereas locally constant functions are. | Retain open-monoid category. |
| 3.3 | (1,0) contracts the upper root and (0,1) expands it; n=0/1 has no root inequalities. | Retain descending valuations. |
| 3.4 | U invertible gives the entire module; U nilpotent or zero gives zero ordinary summand. | Retain actual Hecke image. |
| 3.5 | Weight 2 gives u² on units, and uniformizer powers contribute 1. | Retain unit-only character. |
| 3.6 | λ=(2,0) gives factors 1,u⁻²; changing ϖ to 3ϖ changes value 2 to 6. | Retain reversed weights and uniformizer coordinates. |
| 3.7 | Inverting a nilpotent action kills the module; inverting an already invertible action does nothing. | Retain localization and m≥1. |
| 3.8 | Invariants under the trivial torus subgroup give the module itself. | Retain subgroup action and quotient. |
| 3.9 | Zero injective is acyclic; ordinary modules without injectivity need not be. | Retain injective hypothesis. |
| 3.10 | An exact localization does not make every module injective. | Retain separate injective-preservation assertion. |
| 3.11 | At identity level the Borel intersection is unchanged; c<b is outside the level domain. | Retain subgroup and depth conditions. |
| 3.12 | Degree-zero injective complex gives the underived comparison; general bounded-below complexes need RΓ. | Retain derived scope. |
| 3.13 | λ=0 has the full local group action; nonzero weight uses its specified monoid. V=0 gives zero. | Retain both carriers. |
| 3.14 | Zero completed complex has zero ordinary complex; invertible torus actions survive. | Retain derived ordinary construction. |
| 3.15 | λ=0 recovers the unweighted comparison; arbitrary coefficient action would alter the U normalization. | Retain the ·p action. |
| 3.16 | Equal admissible depths give identity; c=0 is excluded. | Retain derived level change. |
| 3.17 | Equal weights specialize identically; torsion coefficient comparison is still derived. | Retain weight character twist. |
| 3.18 | A torus in rank one has character control; unequal reduced restricted characters do not satisfy the theorem. | Retain character-congruence hypothesis. |
| 3.19 | Conjugate index i=2n gives U₀/U₂ₙ, with U₀=1. | Retain inverse central operator. |
| 3.20 | The two index branches meet at the prescribed central normalization; removing Uₙ⁻¹ breaks invertibility. | Retain ordinary Satake target. |
| 3.21 | λ̃=0 gives the unweighted boundary complex; b=c=0 violates c≥1. | Retain boundary carrier. |
| 3.22 | Equal levels give identity; arbitrary coefficient changes do not. | Retain good level and ordinary comparison. |
| 3.23 | One local degree 2 and n=1 gives longest relative length 1, absolute length 2. | Retain place weighting. |
| 3.24 | Empty support gives zero functions; identity cell evaluation still uses its stabilizer. | Retain compact support modulo P. |
| 3.25 | Threshold 0 includes all cells; a threshold beyond maximum gives zero. | Retain filtration direction. |
| 3.26 | Invariants of an injective model give the indicated exact filtration; arbitrary invariants are not exact. | Retain acyclicity conditions. |
| 3.27 | Zero injective has vanishing higher invariants. Noninjective modules are not covered. | Retain compact-cell injectivity. |
| 3.28 | Positive powers kill each noncompact quotient contribution after ordinary localization. | Retain localization, not an unlocalized equality. |
| 3.29 | Index-one contracted subgroup gives identity trace; index q gives a q-term sum. | Retain trace from subgroup to larger group. |
| 3.30 | Evaluate at w to obtain N_w invariants; evaluation at 1 in another cell can vanish. | Retain conjugation by w. |
| 3.31 | Zero Lie space gives 1; adjoint scalar p gives 1; at p=2 a unit −1 gives −1. | Retain determinant inverse divided by norm. |
| 3.32 | Longest length fn² gives shift 0; identity gives −fn². | Retain absolute length and inverse Weyl twist. |
| 3.33 | Longest cell has zero degree shift but can retain a character twist. | Retain orientation and torus transport. |
| 3.34 | A nonequivariant section is insufficient for an equivariant direct-sum assertion. | Retain the stated retract/quotient scope. |
| 3.35 | A proper Satake image remains proper after its quotient comparison. | Retain image, not entire algebra. |
| 3.36 | n=1 cannot use this CTG perturbation; all-zero unchanged weights fail CTG. | Retain rank restriction. |
| 3.37 | Zero middle cohomology has zero image. | Retain nilpotent bound and image quotient. |
| 3.38 | f=1 gives a dimension-zero determinant torus; f=2 gives dimension one. | Retain component/lattice distinction. |
| 3.39 | f=1 removes the torus factor; non-neat action is not a product-model input. | Retain neatness and component choice. |
| 3.40 | Equal level gives identity index; allowed shrinking preserves the specified divisibility. | Retain index conditions. |
| 3.41 | Exterior ranks at f=2 are 1,1; at f=1 only degree 0 remains. | Retain central degree shift. |
| 3.42 | Equality on group elements alone does not identify arbitrary base-changed polynomial laws. | Retain named flat polynomial-law transfer. |
| 3.43 | n=1 is class field theory; n=2 needs the ordered identity at two independent arguments. | Retain full inertia and nilpotent quotient. |
| 3.44 | A unit multiple of ϖ changes raw eigenvalues and weight factors together. | R1 primary normalization supplied. |
| 3.45 | A local ordinary Galois flag without an ordinary automorphic witness does not satisfy the predicate. | Retain automorphic witness. |
| 3.46 | GL₂(Q₅), c=2, ψ(5)=25 gives normalized values 1,1; positive exponent gives nonunits. | R1 repaired; two proved Lean examples. |
| 3.47 | Unramified quadratic extension scales slopes by 2; totally ramified quadratic extension scales them by 1. Split extension is identity. | R1 repaired; two proved Lean examples. |
| 3.48 | Rank-one flag is the entire representation; merely upper-triangular residual data do not supply the lifted flag. | Retain full ordinary local comparison. |
| 4.1 | χ=1 gives identity; distinct characters trivial mod ϖ agree only after reduction. | Retain compatible reduced actions. |
| 4.2 | J=0 is valid; a nonzero nilpotent cannot be ignored as a module action. | Retain quotient deformation action. |
| 4.3 | Zero tower reconstructs to zero; finite free models require the arithmetic cellular hypothesis. | R3 now supplies that input. |
| 4.4 | n=2, μ=(2,0) gives ν+w₀μ=(0,3); μ=0 still gives (0,1). | Retain inverse Hida twist. |
| 4.5 | Equal weights give identity only in the specified twisted presentation. | Retain ν and reversal. |
| 4.6 | μ′=μ gives self-specialization; an arbitrary unrelated character is outside the target. | Retain exact derived specialization. |
| 4.7 | Zero localized Hida algebra cannot supply a nonzero lifting point. | Retain quotient action and bounded nilpotence. |
| 4.8 | Subtracting the displayed dimensions gives dim R∞=dim S∞−ℓ₀; smaller components need their separate bound. | Retain component hypotheses. |
| 4.9 | C=0 violates the nonzero characteristic-zero fibre; nilpotent quotient preserves spectrum but not length. | Retain spectral support. |
| 5.1 | Q=∅ gives K; n=2 gives flag count q+1≡2. At p=2 that is not invertible; p>n excludes it. | Retain prime-to-p trace use. |
| 5.2 | Swapping ordered distinct roots swaps the selected block. Repeated roots fail selection. | Retain ordered roots and FL q factors. |
| 5.3 | Zero M has zero spherical image. Opposite square root changes torus roots. X²−2 over F₅ separates only after extending to F₂₅. | Retain all revision-3 controls. |
| 5.4 | Distinct split roots yield a proper selected ideal; coincident roots do not give that argument. | Retain selected-block conditions. |
| 5.5 | Δ=1 is identity; otherwise coinvariants of a complex require derived tensor. | Retain augmentation order. |
| 5.6 | Zero localization has no residue eigensystem; locality concerns the selected nonzero block. | Retain source localization. |
| 5.7 | Δ=1 removes diamond data; arbitrary maps for Δ≠1 need not be diamond-linear. | Retain prescribed compatibility. |
| 5.8 | Q₀=∅ is base level; fixed finite base cells bound orbit-generator counts for every Δ_N. | R3 finite-cell proof supplies uniform ranks. |
| 5.9 | Agreement after forgetting scalars is weaker than agreement of images in the reduced derived category. | Retain common reduced image. |
| 5.10 | n=2,f=2 gives interval 3–6; C=0 cannot satisfy nonzero augmentation. | R3 inputs discharged; given π supplies nonzero fibre. |
| 5.11 | Nilpotent quotient leaves Spec unchanged; it does not assert integral R=T. | Retain full spectral support. |
| 5.12 | Existing π is a witness for its own point; a noncrystalline lift fails FL hypotheses. | Retain weights and unramified output. |
| 5.13 | Scalar Frobenius and q≠1 annihilate dual H⁰; q=1 does not. | Retain full endomorphism trace pairing. |
| 5.14 | Q=∅ gives the original Hida complex; at n=2 roots 2,5 give ordinary product 10 versus FL product 10/3 when q=3. | Retain distinct normalization. |
| 5.15 | Δ=1 gives identity; weight specialization follows diamond augmentation. | Retain derived order. |
| 5.16 | Trivial diamonds recover the base map; nontrivial diamonds impose actual linearity. | Retain compatibility. |
| 5.17 | χ=1 is untwisted; mod-ϖ agreement alone does not imply uniform ranks. | R3 supplies fixed-cell ranks; fixed ultrafilter retained. |
| 5.18 | An ordinary π gives a surviving ordinary eigensummand; nonzero classical cohomology alone is insufficient. | R3 route repaired; support only at the specified point. |
| 5.19 | Trivial residual inertia does not remove the torsion-unit condition or the i−1 shift. | Retain full ordinary profile. |
| 5.20 | Identity base change is harmless; loss of residual irreducibility prevents the cuspidal descent argument. | Retain test fields and local conditions. |
| 5.21 | Nonsplit local base change needs §3.47, even though split local change is identity. | R1 named descent input supplied. |
| 5.22 | n=1 uses characters; n≥2 retains p>n², enormousness and scalar-coset conditions. | End theorem unchanged. |
| 5.23 | n=1 uses characters; n≥2 retains p>n, ordinary flags and the residual scalar coset. | End theorem unchanged; R1/R3 routes completed. |

## Library and signature audit

The reviewed library audit was read before extending the package. The current roadmap commit checked is `0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The nine newer roadmap directories and Completed ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts were searched by objects as well as names. OperatorTheory has a README but no Suggested.lean in this checkout. Directly relevant GeometricTopology, SmoothRepresentationsOfLocalGroups, ReductiveGroupsPartII, IntegralHeckeAndGaloisDeterminants, Chebotarev and ClassFieldTheory exports were checked. ProfiniteArithmetic's assembled compatible characters are not rank-two Frobenius-compatible systems. IntegralLattices concerns quadratic lattices, and current Kostant/root-divided-power lattices do not implement the unipotent cohomology comparison. No additional duplicate target was found or removed.

The current local-field solubility instance and abelian continuous H¹ comparison were read with their variable blocks and remain boundary deferrals. The latter has an additive-group comparison; its topological upgrade has additional hypotheses. The new smooth triangulation and Franke uses import their owner exports rather than replan their theories. No build ran in the read-only checkouts.

The pinned Mathlib is `082e2d37e8b0463410cdb532e111cd43d5a66174`; pinned Tau Ceti is `f790474821cf4256814db967cb154e7af3d0c369`. Representative Lean signatures use Mathlib only. Their declaration and variable blocks were checked against README generality:

| Signature family | Scope checked |
| --- | --- |
| Equivariant retract, map, refl, idempotent | Indexed endomorphisms, both equivariance equations and r≫i projector direction. |
| Unitary weight/dominance | Antitone rows, n>0 for the cross-block criterion; empty rows otherwise allowed. |
| Kostant shuffle/length/minimal representative | Increasing inverse on both blocks, left Levi factor, n=0/1/2. |
| CTG and shifted partition recovery | Actual supplied weight table; positive cardinality, disjoint unions and separation. |
| Simple Galois composita | Separate finite-dimensional/Galois hypotheses and finite nontrivial simple group; empty family allowed. |
| Rank-two weight zero and odd | Multiset equality and characteristic zero; empty real-place family allowed. |
| Positive torus and lowest-weight character | CommGroup units, descending valuations, chosen unit/valuation coordinates and no uniformizer weight. |
| Iwahori diamond quotient | IsLocalRing; b≤c and c≥1; unit ideal gives trivial quotient, field and DVR scopes distinguished. |
| Relative cells and open union | Finite places, full-field cells and nontrivially normed fields; no false compact-cell openness. |
| Ordinary characters | Zero-based −i, reversed weight and U_(i+1)/U_i; no constructed Galois/continuity adapter. |
| Orientation | Unit-valued determinant prevents zero norm; p=2 unit sign retained. |
| Taylor–Wiles diamonds and trace index | Local ring, finite quotient, prime p for primary components; maximal ideal and q≡1 for the index statement. The trace is an arithmetic interpretation, not a constructed cohomology map in Lean. |

## Coverage, validation and remaining work

All 123 packet declaration names, 122 API names and 90 test names occur in the README. All 134 numbered subsections and all 32 definition targets are preserved. Every definition subsection has at least three discriminating Checks, and every old backticked name remains. The Lean file grows from 546 to 590 lines, preserving its nine theorems and 35 earlier examples and adding seven examples with actual proofs. No unavailable arithmetic carrier or new sorry-bodied data construction was added. These examples compute the polynomial twist, metadata mismatch, rational norm, ordinary modulus, weight sign, unramified slope and ramified weight sum.

- `lean-check` exited 0 at the pinned shared build: 47 warnings, all `declaration uses sorry`; zero errors and zero other warnings. Memory exceeded 20 GB and only one check ran at a time. This checks elaboration, not formal proof of the roadmap.
- `scripts/check_blueprint.py` on the unchanged accepted packet: zero errors and warnings, 123 nodes. Its seven historical gap records and 36 requests were not edited outside this job's allowed scope; the package dispositions above address R1–R3.
- `scripts/check_sorry_data.py`: passed.
- `research/blueprint/intake.py check-files` on all four deliverables: zero problems.
- `git diff --check`: passed.

There is no unresolved finding or handoff dependency on scratch material. The next step is the programme's independent fix review. No second job was claimed.
