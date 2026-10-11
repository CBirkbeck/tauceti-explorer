# NC.5 — Quadratic Chabauty and height equations

This layer produces finite p-adic height loci containing the rational points of a proper curve over Q. Its two principal results are the strict rank bound r < g + rho_Q − 1 and, when r = g with a proved logarithm isomorphism, the construction of quadratic Chabauty pairs and their basis-certified determinant equations. It includes every one of the nineteen BDMTV2019 items routed to NC.5. The split Cartan curve X_s(13) is the worked consumer: its model, rank and complete point computation already belong to EffectiveDiophantineMethods ED.6, whose exact targets are identified below.

This is a complete target-level planning pass with NC.5 **planned**, not closed. Three explicit gaps and four supplier requests remain. The native suggested interfaces use the pinned Mathlib carriers; the geometric realizations and generic height foundations that cannot yet be expressed are individually identified. No implementation of those missing objects, proof of a geometric theorem, or replay of the numerical computation is claimed.

## Objects and conventions

Throughout the proper-curve application, X/Q is smooth, projective and geometrically connected, g > 1, b is a rational point, J is its Jacobian, and p is a prime of good reduction. Write V = V_p J = H1_et(Xbar,Qp)*, H = H1_dR(X/Qp), and W = H0(X_Qp,Omega1)*. The cup-dual relation is Qp(1) → wedge² V. The universal module of augmentation length two is A/I³; length and lower central degree are separate indices.

The arithmetic invariant is rho_Q = rank NS(J/Q) from rationally defined line classes. The A2 owner also defines the geometric Picard number; that larger number cannot replace rho_Q in this criterion without rational descent. NS, its injection into symmetric Hom and its finite rank are imported from A2/A6, never defined again here. The general rank proof needs the injection into H2(J), not equality with the whole Galois-invariant cohomology space. It has no absolute-simplicity hypothesis. The selected nice-correspondence-to-alternating lemma retains the absolutely-simple-J hypothesis of its cited source; the explicit height-pair application through that lemma retains it too.

The global Selmer condition projects to the actual Mordell–Weil Kummer image. The transport of a global height to W needs the logarithm map J(Q) tensor Qp → W to be an isomorphism. Rank g alone is insufficient. Neither this transport nor the rank theorem identifies all global H1_f with the Mordell–Weil image. No ordinary-reduction or Panchishkin hypothesis is imposed on this selected curve construction.

Every height uses one continuous global idele-class character and its compatible local components, with a nonzero p-component, together with a chosen Hodge splitting. In a normalized Tate-line de Rham coordinate, the local character is a Qp-linear functional. It is not evaluated on a multiplicative scalar. Our sign convention is

h_global = h_p + sum_(v != p) h_v,     Upsilon = {−sum_(v != p) t_v : t_v in Gamma_v}.

Thus theta − B lies in the **negative** away-place correction set. Actual local image sets or proved finite supersets must account for every bad place. The zero character is excluded. A Tate tensor satisfying Frobenius, filtration, cup and alternating conditions is not thereby a rational algebraic correspondence.

## Existing suppliers and ownership

| Supplier | Contract used here |
|---|---|
| AbelianSchemesAndArithmeticModuli A2/abelian-neron-severi, A6/neron-severi-rank | k-defined NS, injection into Hom, rational/geometric distinction and finite rank. A2/rosati-involution fixes the polarized adjoint. The A2 rational symmetric-Hom isomorphism is stated over an algebraically closed field; its Q-descent is explicitly requested. |
| NC.2/central-quotients, /length-algebra, /finite-path-module, /tensor-paths | Genuine finite path groups/modules, proper relations, pointer and tensor/endpoint transport. A single augmentation quotient is a module rather than a Hopf-algebra quotient. |
| NC.2/finite-path-comparison, /crystalline-path-coordinates, /depth-one-jacobian | Strict nonlinear crystalline comparison and the Jacobian depth-one identification. The p-comparison is not an away-from-p unramified-path theorem. |
| NC.3/torsor-classification, /twisting, /central-extension, /exact-sequence | Continuous nonabelian torsors, contracted products, central cohomology and the exact sequence for an arbitrary closed embedding. The latter does not require normality. |
| NC.4, requested | MW-cut Selmer varieties/dimensions, finite away-place local images, potentially unramified proper paths, every-subdisc density, and analytic zero finiteness on compact charts. |
| SelmerIwasawaCohomology L0/s-unit-kummer-identification, L2/finite-condition-rational-duality, L4/bloch-kato-condition | Actual Tate Kummer/local conditions and crystalline logarithm dimensions. For Q the imposed away-place unramified conditions remove the S-unit directions, leaving zero global crystalline Tate dimension. |
| PadicHodgeTheory R06.2/period-functors, /dst-exact-tensor-fully-faithful; R06.5/crystalline-comparison-good-reduction | Genuine D_cris, strict exact tensor compatibility and the proper H1/cup/cycle comparison. H1 comparison alone does not establish crystallinity of a whole path mixed extension. |
| ColemanIntegration L1/coleman-integral and /coleman-integration-characterisation | Coleman/Jacobian logarithms and convergent integral coordinates with the imported branch and endpoint conventions. |
| MotivesAndAlgebraicCycles MC.0, requested | Picard/cycle correspondences, proper intersections, moving, Kunneth action and cup/trace compatibility. The relative-cohomology bridge is the sharper unresolved G1 input. |
| HeightsRationalPointsAndObstructions RP.1, requested | Mordell–Weil finite generation, rank and Kummer image; not a certificate for the rank of this concrete genus-three Jacobian. |
| Pending shared SelmerIwasawaCohomology Part II | Generic mixed extensions and heights; its precise contract is G2. No stage identifier is invented. |

The pinned Mathlib declarations are listed in the packet with exact modules, source lines and commit URLs. Fourteen actual statements were read at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti is pinned at f790474821cf4256814db967cb154e7af3d0c369. The current read-only roadmap main (070dc2becd74419e76303ede84b465ed4a69461f) and library (a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039) were also screened, including the nine roadmaps newer than the atlas snapshot. Existing Jacobian, vector-bundle and Tannakian targets remain imports. The elliptic real-valued canonical height is not a substitute for the mixed-extension p-adic height.

## Target statements, APIs and tests

Each identifier below has prefix `AnabelianGeometryAndNonabelianChabauty:NC.5/`. Dependencies name the precise nodes whenever those exist. Linear examples over Q are distinguishing interface tests; they do not claim that their supplied modules are cohomology of a curve. The native analytic charts use finitely many rescaled closed p-adic unit balls and require polynomial density on every open subdisc; this prevents a locally analytic function from vanishing identically on one unchecked component.

### Rational classes and the rank obstruction

#### Nice rational correspondence

Target `nice-correspondence`; proposed declaration `IsNiceCorrespondence` (definition).

Let X/Q be smooth, proper and geometrically connected, of genus g>1, with b in X(Q). In C=Pic(X×X)⊗Q let P be the sum of the two pullback subspaces. A correspondence Z is nice when swap*Z−Z belongs to P, its H1⊗H1 Kunneth component cl(Z) is nonzero, and the induced endomorphism E_Z of H1 has trace zero. Nontrivial means nonzero in this component, not merely a nonzero divisor or Picard class. The same predicate applies after scalar extension, but a p-adic class is not thereby a rational correspondence.

**Hypotheses and conventions.** The Kunneth cycle-class map, correspondence action and principal polarization come from their geometric owners. Rational coefficients permit subtracting the scalar trace part.

**Construction or proof.** 1. Form the pullback subspace in the rational Picard group and impose symmetry in its quotient. 2. Extract the H1⊗H1 component; impose its nonvanishing and trace zero. On supplied native modules the three conditions are an explicit predicate.

**Uses.** BDMTV §2.3: Selects a nonzero primitive rational cycle for a one-dimensional central quotient. NC.5 worked curve: Distinguishes certified rational Hecke correspondences from arbitrary p-adic Tate classes.

**API.**

- `IsNiceCorrespondence.nonzero`: A nice class is nonzero.
- `IsNiceCorrespondence.smul`: Multiplication by a nonzero coefficient preserves niceness.
- `IsNiceCorrespondence.add_pullback`: Adding d in the pullback subspace preserves niceness when swap(d)−d stays in that subspace and both trace and cl vanish on it.

**Distinguishing tests.**

- `nice_nonzero_primitive`: For C=Q², P=0, swap=id, trace=first coordinate and cl=second coordinate, (0,1) is nice.
- `nice_nonzero_trace`: With these data (1,1) is not nice.
- `nice_zero_class`: For trace=0 and cl=second coordinate, the nonzero element (1,0) is not nice.

**Needs.** `AbelianSchemesAndArithmeticModuli:A2/abelian-neron-severi`; `MotivesAndAlgebraicCycles:MC.0`; `mathlib:LinearMap.ker`.

**Source.** [Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §2.3, definition before Lemma2.4, p.900. Specifies symmetry modulo pullbacks and the trace-zero correspondence used to construct U_Z.

**Acceptance.** Zero and a nonzero pullback class cannot be nice. Symmetry modulo pullbacks is distinct from equality of divisors under swapping.

**Prototype boundary.** Native linear predicate and its three API items/tests are present. Pic(X×X), cycle action and the geometric instantiation IsNiceCorrespondence.geometric are omitted at G1.

#### Primitive class and trace criterion

Target `nice-trace-criterion`; proposed declaration `nice_trace_criterion` (theorem).

For a symmetric rational correspondence Z on X whose Jacobian is absolutely simple, its Kunneth tensor is alternating (with the graded Kunneth sign). Its cup product is zero exactly when E_Z has trace zero, under the trace H2(X)(1)≅coefficient field. Consequently Z is nice exactly when cl(Z) is nonzero and cup(cl(Z))=0. The nonzero qualification is essential; the zero correspondence satisfies the latter equation alone.

**Hypotheses and conventions.** X and the polarization as in nice-correspondence. Use the duality conventions of H1 and V=H1_et(Xbar,Qp)*, with their Tate twist.

**Construction or proof.** 1. Import the rational NS-to-Rosati-symmetric-Hom identification from A2; the alternating tensor is its cohomological realization. 2. The correspondence trace equals cup followed by H2 trace. Combine with the explicit nonzero condition; do not use the unqualified converse in the printed Lemma2.4.

**Needs.** `AnabelianGeometryAndNonabelianChabauty:NC.5/nice-correspondence`; `AbelianSchemesAndArithmeticModuli:A2/abelian-neron-severi`; `MotivesAndAlgebraicCycles:MC.0`.

**Source.** [Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Lemma2.4 and proof, p.900. Provides the Rosati and cup/trace comparisons; the zero-class qualification repairs the final equivalence.

**Acceptance.** A primitive zero class is rejected. The Kunneth sign explains why geometric symmetry gives an alternating H1 tensor.

**Prototype boundary.** Full geometric signature is omitted at G1; the native IsNiceCorrespondence predicate keeps nonvanishing explicit.

#### Depth-two height quotient

Target `depth-two-quotient`; proposed declaration `DepthTwoHeightQuotient` (construction).

Put V=VpJ and W2=coker(Qp(1)→∧²V), the cup-dual relation. The imported proper depth-two group has central exact sequence 1→W2→U2→V→1. A nonzero alternating cup-zero rational cycle class gives a G_Q-equivariant surjection q_Z:W2→Qp(1). Define U_Z=U2/ker(q_Z), as an fpqc group-scheme quotient, so 1→Qp(1)→U_Z→V→1 is central and its commutator is q_Z applied to the imported commutator. At the linear central grade the carrier is W2/ker q_Z, identified with Qp(1) by the existing first isomorphism theorem.

**Hypotheses and conventions.** A nonzero alternating cup-zero rational cycle class supplies q_Z by duality. The kernel is closed, normal and Galois stable; characteristic zero and finite type come from NC.2. A nice correspondence supplies this class under nice-trace-criterion, which retains its absolutely-simple-J hypothesis. The general rank criterion instead obtains primitive classes directly from rational NS and does not use that hypothesis.

**Construction or proof.** 1. Use the proper cup-dual presentation of U2, not the affine free fundamental group. 2. Factor the cycle functional through W2 because it kills the cup-dual relation. Nonzero to a one-dimensional target is surjective. 3. Import the schematic central pushout and preserve the Galois action; use the native module quotient only for its central grade.

**Uses.** BDMTV §3.4: Supplies the group acting on the height module. NC.4 / NC.5: Projects the depth-two Selmer locus to a smaller height quotient without losing rational points.

**API.**

- `DepthTwoHeightQuotient.centralMap`: The central projection is the native quotient map W2→W2/ker q.
- `DepthTwoHeightQuotient.centralEquiv`: For surjective q, the central quotient is linearly equivalent to its Tate target.
- `DepthTwoHeightQuotient.centralEquiv_apply`: The equivalence takes the class of z to q(z).
- `DepthTwoHeightQuotient.centralMap_eq_zero`: The central class of z is zero exactly when q(z)=0.
- `DepthTwoHeightQuotient.central_exact`: The geometric central extension has the stated kernel, projection and commutator.

**Distinguishing tests.**

- `quotient_coordinate`: For q:Q²→Q the first coordinate, (3,5) and (3,0) give the same central class and q is surjective.
- `quotient_zero_map`: For q=0 every central class vanishes.
- `quotient_retains_nonzero_class`: For the coordinate projection, the class of (1,0) is nonzero.

**Needs.** `AnabelianGeometryAndNonabelianChabauty:NC.5/nice-correspondence`; `AnabelianGeometryAndNonabelianChabauty:NC.2/central-quotients`; `AnabelianGeometryAndNonabelianChabauty:NC.3/central-extension`; `mathlib:LinearMap.quotKerEquivOfSurjective`.

**Source.** [Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §2.3, pp.900–901 and exact sequence(10), p.897. Constructs U_Z by pushing the proper central quotient to a Tate line.; [Quadratic Chabauty and rational points I: p-adic heights](https://arxiv.org/pdf/1601.00388v2), §3, Lemma3.2, pp.11–12. Uses the same primitive NS contributions for the rank criterion.

**Acceptance.** The centre is a Tate line only for a nonzero functional. Retain the proper cup relation and the schematic quotient.

**Prototype boundary.** The geometric DepthTwoHeightQuotient constructor is explicitly omitted. Its central module carrier and four API signatures are native. Geometric quotient, projection, central_exact and commutator are individually omitted at G1; an abstract quotient of point groups is insufficient.

#### Quadratic Chabauty rank criterion

Target `rank-picard-criterion`; proposed declaration `rank_picard_criterion` (theorem).

Let X/Q be smooth, projective and geometrically connected with genus g>1 and rational basepoint, J its Jacobian, p a prime of good reduction, r=rank J(Q), and rho_Q=rank NS(J/Q). With the NC.4 Selmer locus defined by crystalline conditions at p, actual local Kummer images at all bad places and projection to the global Mordell–Weil Kummer image, r<g+rho_Q−1 implies X(Qp)_2 is finite. It contains X(Q). No equality between global H1_f(G_T,V) and J(Q)⊗Qp, no ordinary-reduction hypothesis and no replacement of rho_Q by the geometric Picard number are assumed.

**Hypotheses and conventions.** Use p-adic coefficients and the reduced Selmer variety convention of BD I §2.3, as fixed in NC.4. The number field is Q; the extra unit and splitting hypotheses for other fields are outside this selected theorem.

**Construction or proof.** 1. From A2/A6 import rational NS and its symmetric-Hom injection and finite rank. Primitive rational NS classes form a space of dimension rho_Q−1 after removing the theta/trace direction. 2. Push U2 to an extension of V by rho_Q−1 Tate lines. The global crystalline/unramified Tate-line kernel has dimension zero over Q, using the S-unit/Kummer and local conditions; finite bad Kummer images contribute no dimension. The Mordell–Weil cut bounds the global Selmer dimension by r. 3. The local crystalline quotient has dimension g+rho_Q−1 by strict extension classification and the Bloch–Kato dimension formula. The strict inequality gives non-dominance. Import NC.4 discwise density and analytic finiteness to conclude.

**Needs.** `AnabelianGeometryAndNonabelianChabauty:NC.5/depth-two-quotient`; `AbelianSchemesAndArithmeticModuli:A2/abelian-neron-severi`; `AbelianSchemesAndArithmeticModuli:A6/neron-severi-rank`; `AnabelianGeometryAndNonabelianChabauty:NC.4`; `SelmerIwasawaCohomology:L0/s-unit-kummer-identification`; `SelmerIwasawaCohomology:L4/bloch-kato-condition`; `HeightsRationalPointsAndObstructions:RP.1`.

**Source.** [Quadratic Chabauty and rational points I: p-adic heights](https://arxiv.org/pdf/1601.00388v2), §2.3 and Remark2.3, p.9; §3, Lemma3.2 and proof, pp.11–12. Defines the Mordell–Weil cut and proves the selected rank/Picard criterion.; [Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Theorem2.3, p.899. Restates the criterion; its global dimension sketch is used only after the Mordell–Weil cut.

**Acceptance.** When rho_Q=1 the strict bound reduces to r<g. The boundary r=g+rho_Q−1 does not assert finiteness. A larger geometric NS rank without rational descent does not improve this bound.

**Prototype boundary.** The geometric locus and dimension theorem signature are omitted at G1 and the NC.4 contract. The node is a theorem plan, not a numerical surrogate.

#### Admissible de Rham Tate class

Target `admissible-tate-class`; proposed declaration `IsAdmissibleTateClass` (definition).

For H=H1_dR(X/Qp) with Frobenius phi at a good prime p, define admissibility of Z in H⊗H by five explicit conditions: Z≠0; (phi⊗phi)(Z)=pZ; Z belongs to Fil1(H⊗H); cup(Z)=0; and swap(Z)=−Z. The filtration is the tensor filtration; phi is on H1, not on its Tate dual. These are necessary conditions for a nice rational correspondence, and they do not construct one.

**Hypotheses and conventions.** The geometric specialization is over Qp, so phi is linear; a ramified coefficient-field extension requires its imported semilinear comparison. The nonzero condition is added to the four source conditions for use as a quotient.

**Construction or proof.** 1. Use the native tensor product, its commutor and the tensor of phi with itself. 2. Impose membership in the supplied tensor filtration and the kernel of cup, with the eigenvalue and alternating condition. 3. Keep algebraicity and rational descent as separate evidence in nice-class-realization.

**Uses.** BDMTV §4.4 / §5.4: Defines the linear conditions used to construct the specialized height connection. NC.5 worked curve: Checks the cohomological matrices only after rational Hecke-cycle provenance is supplied.

**API.**

- `IsAdmissibleTateClass.nonzero`: An admissible class is nonzero.
- `IsAdmissibleTateClass.smul`: A nonzero scalar multiple remains admissible.
- `IsAdmissibleTateClass.not_zero`: The zero tensor is never admissible.

**Distinguishing tests.**

- `tate_wedge_eigenvalue`: For H=Q², phi=diag(1,2), Fil1=all and cup=0, e1⊗e2−e2⊗e1 is admissible with eigenvalue2. This is a linear test, not a geometric curve.
- `tate_zero_rejected`: With the same data zero is rejected.
- `tate_symmetric_tensor_rejected`: e1⊗e1 is rejected.
- `tate_wrong_frobenius`: The nonzero wedge is rejected with phi=id and required eigenvalue2.

**Needs.** `mathlib:TensorProduct.map`; `mathlib:TensorProduct.comm`; `mathlib:LinearMap.ker`; `PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction`.

**Source.** [Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §4.4, conditions(a)–(d), pp.913–914. Lists the de Rham constraints for the height connection.; [Quadratic Chabauty for modular curves: algorithms and examples](https://arxiv.org/pdf/2101.01862v4), §3.5.2, Remark3.17, p.16. Explains why the earlier converse does not follow from these constraints.

**Acceptance.** Changing to the dual Frobenius without the twist changes the eigenvalue and is rejected. Admissibility is never used as an algebraic-cycle lifting theorem.

**Prototype boundary.** Native tensor predicate, API and all four linear tests elaborate. Its H1_dR geometric instantiation uses the imported period/cycle interface at G1.

#### Realization of a rational nice class

Target `nice-class-realization`; proposed declaration `nice_class_realization` (theorem).

A nonzero rational nice correspondence produces an admissible de Rham Tate class at every good prime, under the tensor-compatible crystalline cycle comparison. Only this forward implication is asserted. An arbitrary p-adic linear combination satisfying the admissibility conditions need not belong to the rational algebraic-correspondence space, even when the two stated Picard ranks agree.

**Hypotheses and conventions.** Use the rational class, its symmetric Hom/NS realization and the good-reduction crystalline cycle class, with tensor and cup compatibility. The nice-to-alternating implication here uses nice-trace-criterion, including absolute simplicity. For the general rank theorem, rational NS classes give alternating classes on H2(J) directly; that theorem does not depend on this specialized correspondence implication.

**Construction or proof.** 1. A rational divisor cycle has the required Frobenius eigenvalue and Hodge filtration by cycle comparison. 2. Apply the alternating and cup/trace criterion and injectivity on rational divisor classes. 3. The proposed converse would confuse the intersection of a rational lattice with a filtration with the intersection of its p-adic span; it is excluded.

**Needs.** `AnabelianGeometryAndNonabelianChabauty:NC.5/admissible-tate-class`; `AnabelianGeometryAndNonabelianChabauty:NC.5/nice-trace-criterion`; `AbelianSchemesAndArithmeticModuli:A2/abelian-neron-severi`; `PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction`; `MotivesAndAlgebraicCycles:MC.0`.

**Source.** [Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Lemma4.7, pp.913–914, forward part only. The forward cycle-class properties suffice for constructing the height module.; [Quadratic Chabauty for modular curves: algorithms and examples](https://arxiv.org/pdf/2101.01862v4), Remark3.17, p.16. Supplies the published correction to the converse.

**Acceptance.** Input includes an actual rational cycle, with no inferred lift from de Rham linear algebra.

**Prototype boundary.** Omitted geometric realization signature at G1.

### The height representation and its local realization

#### Depth-two height module

Target `height-module`; proposed declaration `DepthTwoHeightModule` (construction).

Let A2(b)=A(b)/I³ be the imported length-two pointed universal module for the proper curve. Its central grade T=coker(Qp(1)→V⊗²) embeds in A2(b). The correspondence functional q_Z:T→Qp(1) factors through the proper relation. Define A_Z(b)=A2(b)/i(ker q_Z), with its Galois action, weight filtration and identified grades Qp,V,Qp(1). Its U2 action factors faithfully through U_Z. Its de Rham version is the analogous pushout of the proper universal connection; it is a module, not a Hopf-algebra quotient.

**Hypotheses and conventions.** The augmentation length is2, so the exponent is3; it is separate from the lower central indexing. The functional on V⊗² restricts to the alternating quotient and kills the cup-dual relation. Use the alternating cup-zero rational class as input. When it is selected through the named nice-correspondence theorem, retain the absolutely-simple-J hypothesis.

**Construction or proof.** 1. Import A2 and its graded representation from NC.2/length-algebra and finite-path-module. 2. Quotient only the kernel in the central grade; keep the top and middle grades and the pointer. 3. The kernel of the U2 representation is exactly ker q_Z, by the explicit unipotent action on the length-two quotient. Descend the action and connection.

**Uses.** BDMTV equation(18): Its twists are the inputs to the height function. BDMTV Lemma5.4: Compares its Galois and de Rham realizations with the same quotient relation.

**API.**

- `DepthTwoHeightModule.mk`: The projection A2→A_Z is the native quotient map.
- `DepthTwoHeightModule.relation`: If q(z)=0, the class of i(z) vanishes.
- `DepthTwoHeightModule.lift`: A linear map on A2 killing i(ker q) descends uniquely to A_Z.
- `DepthTwoHeightModule.lift_mk`: The descended map evaluates on a quotient class as the original map.
- `DepthTwoHeightModule.grades`: Identifies the weight grades with Qp,V,Qp(1), preserving their specified identifications.
- `DepthTwoHeightModule.action`: The imported U2 action descends to a faithful U_Z action.
- `DepthTwoHeightModule.deRham`: Gives the proper filtered connection pushout with its pointer.

**Distinguishing tests.**

- `module_zero_quotient`: For A=T=Q, i=id and q=0, the whole quotient vanishes.
- `module_identity_quotient`: For i=q=id on Q, the class of1 survives.
- `module_other_grades_preserved`: For i:Q→Q² the second-coordinate inclusion and q=0, the class of (1,0) survives. This detects quotienting the whole ambient module.

**Needs.** `AnabelianGeometryAndNonabelianChabauty:NC.5/depth-two-quotient`; `AnabelianGeometryAndNonabelianChabauty:NC.5/nice-class-realization`; `AnabelianGeometryAndNonabelianChabauty:NC.2/length-algebra`; `AnabelianGeometryAndNonabelianChabauty:NC.2/finite-path-module`; `mathlib:Submodule.mkQ`; `mathlib:Submodule.liftQ`.

**Source.** [Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §3.4, pp.906–907; §4.4, pp.914–915. Uses the central pushout of A2 to produce the height module and connection.; [Quadratic Chabauty and rational points I: p-adic heights](https://arxiv.org/pdf/1601.00388v2), §5.1, pp.17–20. Constructs the mixed extension module, its action and twisting realization.

**Acceptance.** The retained dimension is2g+2. No Hopf structure on the single augmentation quotient is asserted.

**Prototype boundary.** Native central-submodule quotient and four API signatures/tests elaborate. Geometric grades, action and deRham instantiation are named omissions at G1.

#### Twisted height module

Target `height-module-twist`; proposed declaration `HeightModuleTwist` (construction).

For a right U_Z torsor P with compatible Galois action, define HeightModuleTwist(P)=P×^{U_Z}A_Z(b), using the faithful left U_Z action on the module. It is a mixed extension with the fixed graded identifications Qp,V,Qp(1). For the path torsor from b to x write A_Z(b,x). Contracted product, endpoint transport and the neutral torsor identification are those of NC.3; NC.5 applies them to this particular representation.

**Hypotheses and conventions.** P is a genuine nonabelian torsor, not an arbitrary cocycle without quotient equivalence. Retain top and bottom grade rigidifications; isomorphisms induce the identity on the named grades.

**Construction or proof.** 1. Import torsor classification and twisting, then descend the U_Z-equivariant vector-space/representation sheaf along P. 2. The central weight flag is U_Z stable and therefore descends with the graded identifications. 3. Use neutral torsor and composition compatibility to recover A_Z(b) and endpoint functoriality.

**Uses.** BDMTV equation(18): Defines theta by applying h_p to this mixed extension. NC.6 and ED.6: Retains the cohomological object underlying any numerical height value.

**API.**

- `HeightModuleTwist.neutral`: Twisting by the neutral torsor recovers A_Z(b) with its flag and grades.
- `HeightModuleTwist.compose`: Composing endpoint path torsors induces the corresponding transport isomorphism of twisted modules.
- `HeightModuleTwist.classes`: The upper and lower extension projections are the imported mixed-extension pi1 and pi2, with the fixed graded identifications.

**Distinguishing tests.**

- `twist_neutral`: For P=U_Z with its neutral torsor structure the twist is A_Z(b).
- `twist_endpoint`: For x=b the depth-one upper class is0; the lower class is the Chow–Heegner constant c, which need not vanish.
- `twist_nontrivial_center`: Twisting a fixed pair of adjacent extensions by a nonzero crystalline Tate-line class changes the central mixed-extension class; it is not killed by forgetting the centre.

**Needs.** `AnabelianGeometryAndNonabelianChabauty:NC.5/height-module`; `AnabelianGeometryAndNonabelianChabauty:NC.3/torsor-classification`; `AnabelianGeometryAndNonabelianChabauty:NC.3/twisting`; `AnabelianGeometryAndNonabelianChabauty:NC.2/tensor-paths`.

**Source.** [Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §3.4, definition of A_Z(b,x), pp.906–907. Applies the twisting map to the height module.; [Quadratic Chabauty and rational points II: generalised height functions on Selmer varieties](https://arxiv.org/pdf/1705.00401v2), §3.1, pp.12–14. Explains the general twist of the length-two module and its two extension projections.

**Acceptance.** Transport acts on the source side with the convention inherited from NC.2. Changing a torsor representative does not change the mixed-extension isomorphism class.

**Prototype boundary.** HeightModuleTwist and all three API and test signatures are omitted, individually named in Suggested.lean, because the imported geometric representation/torsor/mixed-extension categories have no native instantiation at this pin (G1,G2).

#### Adjacent extension classes of the twist

Target `twist-two-classes`; proposed declaration `twist_two_classes` (theorem).

For x in X(Q), pi1(A_Z(b,x))=kappa(x−b) and pi2(A_Z(b,x))=E_Z kappa(x−b)+c_Z, where c_Z=[I A_Z(b)] is the Kummer realization of a rational Chow–Heegner point. After localization and the Bloch–Kato logarithm these become AJ_b(x) and E_Z AJ_b(x)+c_Z in W=H0(X_Qp,Omega1)*. Both global classes lie in the Mordell–Weil Kummer image; the statement does not identify that image with the entire global H1_f.

**Hypotheses and conventions.** Duality identifies V*(1) with V via the chosen principal polarization. Use the actual rational-cycle Chow–Heegner comparison; no assumption that c_Z=0.

**Construction or proof.** 1. The upper quotient of the length-two twist is the depth-one path representation, giving kappa(x−b). 2. The lower subextension is the correspondence image of this class plus its value at b; compare with the divisor construction in chow-heegner-class to establish rational Mordell–Weil provenance. 3. Apply the imported Bloch–Kato and Coleman/Jacobian logarithm compatibility.

**Needs.** `AnabelianGeometryAndNonabelianChabauty:NC.5/height-module-twist`; `AnabelianGeometryAndNonabelianChabauty:NC.5/chow-heegner-class`; `AnabelianGeometryAndNonabelianChabauty:NC.2/depth-one-jacobian`; `SelmerIwasawaCohomology:L4/bloch-kato-condition`; `ColemanIntegration:L1/coleman-integral`.

**Source.** [Quadratic Chabauty and rational points I: p-adic heights](https://arxiv.org/pdf/1601.00388v2), §5.2, Proposition5.5, pp.20–22. Describes the two classes and restricts the pairing to the required Mordell–Weil image.; [Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Lemma3.7 proof and Remark3.11, pp.907–908. Identifies E and c for the height equations.

**Acceptance.** At b the first class is0 and the second is c_Z. No Tate–Shafarevich finiteness assumption is inserted.

**Prototype boundary.** Omitted geometric mixed-extension projection theorem at G1,G2.

#### Injectivity of the specialized twisting map

Target `twist-injective`; proposed declaration `twist_injective` (theorem).

The twisting map tau:H1_f(G,U_Z)→mixed extensions with graded pieces Qp,V,Qp(1) is injective for the specified global or local Galois group and height-module representation. The proof must show that, for every twist arising from a torsor, the G-fixed locus of the pointed quotient Aut_gr(A_Z)/U_Z consists exactly of its distinguished coset. It is never empty: the neutral coset is fixed. Faithfulness of U_Z→Aut_gr(A_Z) alone does not imply injectivity on H1.

**Hypotheses and conventions.** Aut_gr means flag-preserving automorphisms inducing the identity on all named graded pieces. The negative-weight quotient representations and their torsor twists have no invariant vectors for these Galois groups; finite-dimensional continuity and the group-theoretic exact sequence come from NC.3.

**Construction or proof.** 1. Translate a fibre of H1(U_Z)→H1(Aut_gr(A_Z)) to the neutral fibre by the imported nonabelian twisting equivalence. 2. Filter the homogeneous quotient by its negative-weight vector-space pieces and prove that a fixed coset is the neutral one, successively; rational Frobenius weight arguments also hold on the twisted graded pieces. 3. Use the fixed-coset/nonabelian exact sequence, not an empty fixed-locus claim, to obtain injectivity on every fibre.

**Needs.** `AnabelianGeometryAndNonabelianChabauty:NC.5/height-module-twist`; `AnabelianGeometryAndNonabelianChabauty:NC.3/twisting`; `AnabelianGeometryAndNonabelianChabauty:NC.3/exact-sequence`.

**Source.** [Quadratic Chabauty and rational points II: generalised height functions on Selmer varieties](https://arxiv.org/pdf/1705.00401v2), §4, Lemma4.2 and proof, pp.21–22. Proves injectivity via the pointed automorphism quotient; the printed fixed-point claim is corrected.; [Quadratic Chabauty and rational points I: p-adic heights](https://arxiv.org/pdf/1601.00388v2), §5.1, pp.18–20. Provides the specialized faithful action and mixed-extension classifier.

**Acceptance.** The neutral coset is fixed. The argument addresses every twisted fibre, not just the kernel of a map of pointed sets.

**Prototype boundary.** Omitted native Galois torsor/flag automorphism signature at G1,G2; the proof obligation on every twisted quotient is explicit.

#### Crystalline comparison for the height module

Target `height-module-comparison`; proposed declaration `height_module_comparison` (comparison).

For X/Qp with good reduction and the actual rational cycle Z, the crystalline path comparison induces a strict, tensor- and cycle-compatible isomorphism D_cris(A_Z^et(b,x))≅A_Z^dR(b,x). It preserves the pointer, weight grades, Hodge filtration, Frobenius and the cup-dual quotient functional, after passing to the proper quotient and its central pushout. Applying ordinary H1 comparison alone does not prove that the mixed extension is crystalline.

**Hypotheses and conventions.** The whole finite path module is crystalline by the imported nonlinear comparison; b,x are good-reduction local points. The good-reduction cycle class comparison sends the same rational correspondence to its de Rham functional.

**Construction or proof.** 1. Import NC.2 finite path comparison and genuine D_cris with its exact strict tensor structure from R06.2. 2. Pass to the proper quotient, and use compatibility of cycle classes, cup and tensor duality to identify the two central kernels. 3. Apply strict exactness to the quotient A_Z and to its path twist; preserve the pointed normalization.

**Needs.** `AnabelianGeometryAndNonabelianChabauty:NC.5/height-module`; `AnabelianGeometryAndNonabelianChabauty:NC.2/finite-path-comparison`; `AnabelianGeometryAndNonabelianChabauty:NC.2/crystalline-path-coordinates`; `PadicHodgeTheory:R06.2/period-functors`; `PadicHodgeTheory:R06.2/dst-exact-tensor-fully-faithful`; `PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction`.

**Source.** [Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §5.4, Lemma5.4 and proof, pp.923–924. Compares A_Z using Olsson for the path object and Faltings for the cycle quotient.

**Acceptance.** Use the mixed extension, not only its semisimplified graded pieces. The comparison is strict filtered and phi-equivariant.

**Prototype boundary.** Full geometric comparison signature is omitted at G1,G2. Existing native quotient does not stand for a period functor.

#### Specialized local height formula

Target `height-prevalue`; proposed declaration `HeightPrevalue` (construction).

Choose the Hodge splitting V_dR=Fil0⊕W, with complementary projections s1 onto Fil0 and s2 onto W. In a fixed weight-graded frame, let alpha_phi,beta_phi,gamma_phi be the Frobenius splitting coordinates and beta_Fil,gamma_Fil the Hodge coordinates of the compared A_Z(b,x). Define HeightPrevalue=gamma_phi−gamma_Fil−beta_phi(s1 alpha_phi)−beta_Fil(s2 alpha_phi). The local height is the chosen Qp-linear character functional chi_p on the Tate-line de Rham quotient applied to this prevalue. This is linear evaluation after identifying the Tate-line coordinate, not an application of an idele character to a multiplicative scalar.

**Hypotheses and conventions.** The lower and upper splitting coordinates have the imported weight-graded normalization. The two projections sum to the identity and come from the same Hodge splitting; the native formula itself is defined for arbitrary supplied linear maps.

**Construction or proof.** 1. Apply the shared mixed-extension height construction to the strictly compared module. 2. Compute the difference of the unique Frobenius splitting and the chosen Hodge splitting; use the chosen projection to subtract both beta terms with negative signs. 3. Identify the resulting Tate-line class and apply the local linear functional.

**Uses.** BDMTV equation(18) and Lemma5.5: Computes theta from explicit connection splitting coordinates. ED.6: Specifies the exact sign and character normalization a certified numerical routine must implement.

**API.**

- `HeightPrevalue.zero_alpha`: For alpha=0 the prevalue is gamma_phi−gamma_Fil.
- `HeightPrevalue.gamma_add`: Adding a to gamma_phi adds a to the prevalue.
- `HeightPrevalue.character_smul`: A Qp-linear local character sends a*z to a*chi(z).
- `HeightPrevalue.local_height`: Under the genuine mixed-extension splitting hypotheses, h_p(A_Z(b,x)) equals chi_p(HeightPrevalue).

**Distinguishing tests.**

- `preheight_two_negative_terms`: For V=Q², s1(x,y)=(x,0), s2(x,y)=(0,y), alpha=(1,2), beta_phi=2*first, beta_Fil=3*second, gamma_phi=7 and gamma_Fil=1, the result is−2.
- `preheight_zero_alpha`: Changing alpha to0 gives6.
- `preheight_central_variation`: With alpha=(1,2) as before, changing gamma_phi from7 to8 gives−1.

**Needs.** `AnabelianGeometryAndNonabelianChabauty:NC.5/height-module-comparison`; `mathlib:Module.Dual`.

**Source.** [Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §3.3, equations(16)–(17), pp.905–906; Lemma5.5, p.924. Gives the scalar preheight and its evaluation on the compared module.

**Acceptance.** Both beta terms have negative signs. Holding the adjacent classes fixed does not force the local height to be fixed under a central change.

**Prototype boundary.** The scalar formula, three linear API items and three tests elaborate. HeightPrevalue.local_height is omitted at G2 until actual filtered mixed extensions and heights exist.

#### Height and first extension as local coordinates

Target `local-height-coordinates`; proposed declaration `local_height_coordinates` (theorem).

For a nonzero nice quotient U_Z and a nonzero chosen local height functional chi_p, the map (pi1,h_p∘tau_p):H1_f(G_p,U_Z)→H1_f(G_p,V)×Qp is an isomorphism of schemes. In an affine presentation of a central fibre, h_p has the form a*(gamma−F(alpha)) with a≠0, so its inverse is gamma=h/a+F(alpha). The height is algebraic on this Selmer variety even though its pullback to the curve is analytic. Nonzero chi_p is indispensable.

**Hypotheses and conventions.** The mixed-extension classifier, crystalline extension groups and the faithful twist are genuine imported objects. Over Qp, the chosen local character is an isomorphism on the Tate-line de Rham quotient.

**Construction or proof.** 1. Classify the crystalline central fibre as a torsor for H1_f(G_p,Qp(1))≅Qp. 2. The preheight formula has a nonzero linear coefficient in the central coordinate, giving a polynomial fibre inverse. 3. Use the imported global algebraic classifier and strict filtrations to patch these coordinates; the native set equivalence alone does not prove a scheme isomorphism.

**Needs.** `AnabelianGeometryAndNonabelianChabauty:NC.5/height-prevalue`; `AnabelianGeometryAndNonabelianChabauty:NC.5/twist-injective`; `SelmerIwasawaCohomology:L4/bloch-kato-condition`.

**Source.** [Quadratic Chabauty and rational points II: generalised height functions on Selmer varieties](https://arxiv.org/pdf/1705.00401v2), §3.3, Lemmas3.6–3.7, p.18. Constructs the preheight fibre coordinate and algebraic inverse; specialize the central grade to a Tate line and evaluate by a nonzero local character.; [Quadratic Chabauty and rational points I: p-adic heights](https://arxiv.org/pdf/1601.00388v2), §4.3.2, Lemma4.8, p.16. Establishes algebraicity of the scalar local height; it alone is not the coordinate-isomorphism theorem.; [Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Lemma3.7 proof, pp.907–908. Uses the specialized height-coordinate isomorphism for joint density.

**Acceptance.** A zero local functional collapses the central fibre and gives no such isomorphism.

**Prototype boundary.** heightCoordinates is the native fibre set equivalence with a nonzero coefficient. The scheme-theoretic/Galois specialization is individually omitted at G1,G2.

#### Rational Chow–Heegner constant

Target `chow-heegner-class`; proposed declaration `chow_heegner_class` (comparison).

For a rational divisor correspondence Z intersecting the endpoint fibres and diagonal properly, choose a rational auxiliary point o avoiding the supports. Put D_Z(b,x)=Delta*Z−i_b*Z−i_x*Z+(Z·X_b+Z·X_x−Z·Delta)o, a degree-zero divisor. The relative-cohomology mixed-extension comparison identifies the twist A_Z(b,x) with the generic divisor-height mixed extension for x−b and D_Z(b,x), with the Tate dual convention fixed. Hence c_Z=[I A_Z(b)] is the Kummer class of the associated rational Chow–Heegner divisor class. In the normalized de Rham frame its local logarithm is C*(beta_phi(b,b)−beta_Fil(b)), with C the cup matrix in the stated H1 convention. The first statement, not this numerical formula alone, proves rational Mordell–Weil provenance.

**Hypotheses and conventions.** Use proper intersections or a proved moving lemma; handle x=b by the pointed limiting/base-fibre construction rather than the distinct-endpoint relative cohomology formula alone. Auxiliary-point and representative changes are controlled by the imported cycle/relative-cohomology functoriality.

**Construction or proof.** 1. Check degree zero using the intersection-number correction. Import the general relative-cohomology realization of the length-two path module. 2. Pull it back by the rational cycle class and compare via cycle support/excision with the divisor-height mixed extension. This is the BD I Theorem6.3 comparison, not a new definition of generic heights. 3. Take the lower extension at the basepoint to obtain the rational class, then use strict path comparison and cup duality to obtain the local formula.

**Needs.** `AnabelianGeometryAndNonabelianChabauty:NC.5/height-module-twist`; `AnabelianGeometryAndNonabelianChabauty:NC.5/height-module-comparison`; `MotivesAndAlgebraicCycles:MC.0`; `AnabelianGeometryAndNonabelianChabauty:NC.2/finite-path-module`.

**Source.** [Quadratic Chabauty and rational points I: p-adic heights](https://arxiv.org/pdf/1601.00388v2), §6.3, Theorem6.1, pp.24–25; Definition6.2 and Theorem6.3, pp.26–29. Supplies the relative-cohomology and divisor comparison identifying the rational class.; [Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Remark3.11, p.908; Remark5.6 and equation(47), p.925. Identifies the Chow–Heegner constant and its de Rham logarithm.

**Acceptance.** Its degree is0 after the explicit correction. The constant c is not forced to0 by pi1(A_Z(b,b))=0.

**Prototype boundary.** Omitted Picard/divisor/relative-cohomology/mixed-extension signature at G1,G2; the exact Beilinson realization and endpoint specialization are requested/recorded in G1.

### All local terms and the height pair

#### Vanishing for potentially unramified extensions

Target `away-height-vanishes`; proposed declaration `away_height_vanishes` (application).

For v≠p, a mixed extension M of Qp,V,Qp(1) which becomes unramified over a finite local extension satisfies h_v(M)=0. The hypothesis is on the whole mixed extension, not merely its graded pieces. In particular, proper path modules and their height pushouts at places of potential good reduction satisfy it by the imported path theorem after good-reduction base change.

**Hypotheses and conventions.** Use the shared generic away-from-p height and its functorial splitting/extraction. The finite local extension may be chosen Galois.

**Construction or proof.** 1. Invoke the generic vanishing theorem; its proof splits the V extensions away from p and reduces to a Tate-line extension. 2. The Tate-line class becomes zero over the unramified extension. Inflation–restriction and zero local Tate invariants make restriction injective, so it was zero already. 3. Apply to the actual path twist using proper potential-good reduction, not to an arbitrarily manufactured unramified semisimplification.

**Needs.** `AnabelianGeometryAndNonabelianChabauty:NC.5/height-module-twist`; `AnabelianGeometryAndNonabelianChabauty:NC.4`; `SelmerIwasawaCohomology:L2/finite-condition-rational-duality`.

**Source.** [Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §3.2, Lemma3.2 and proof, p.903. Specializes away-from-p height vanishing to potentially unramified mixed extensions.

**Acceptance.** A ramified extension with unramified graded pieces is not covered.

**Prototype boundary.** Omitted actual local mixed-extension/height signature at G2; the generic theorem belongs to the shared height owner.

#### Finitely many bad-place heights

Target `finite-bad-height-image`; proposed declaration `finite_bad_height_image` (application).

For every finite place v≠p, the proper depth-two local Kummer map j2,v:X(Qv)→H1(G_v,U2) has finite image. Projecting to U_Z, twisting by A_Z and applying h_v therefore gives a finite set Gamma_v. At good places Gamma_v={0}. Thus only finitely many bad places enter the correction set, and all of them must be retained. Finiteness supplies no algorithm for computing Gamma_v.

**Hypotheses and conventions.** X is a proper smooth curve over Q; for an affine integral variant the corresponding local domain and boundary hypotheses must be supplied separately. Use the p-adic unipotent quotient of the local path fundamental group with v≠p.

**Construction or proof.** 1. Import the local finite-image theorem from NC.4, where the general Kim–Tamagawa specialization belongs. 2. Take the image through the actual quotient, twist and height maps; a function on a finite image still has finite image. 3. Use generic good-place vanishing outside a finite set. No bad contribution is discarded on grounds of finiteness alone.

**Needs.** `AnabelianGeometryAndNonabelianChabauty:NC.4`; `AnabelianGeometryAndNonabelianChabauty:NC.5/height-module-twist`; `AnabelianGeometryAndNonabelianChabauty:NC.5/away-height-vanishes`; `mathlib:Set.Finite.image`.

**Source.** [A refined Selmer variety for the thrice-punctured projective line](https://ora.ox.ac.uk/objects/uuid:debfa65b-85aa-4877-96f7-40dc0f29c272/files/mb07826c07e1bc11e2aa481362bb229ae), Corollary0.2, p.2; §2, p.6. The finite-image result extends to the proper curve local points and unipotent quotients.; [Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Theorem3.6 and equation(19), p.907. Applies this finite-image result to the height constants.

**Acceptance.** The result is finite image, not identically zero at every bad place.

**Prototype boundary.** Omitted local Kummer/height signature at G1,G2 and the NC.4 supplier contract.

#### Signed away-place correction set

Target `away-height-constants`; proposed declaration `AwayHeightConstants` (construction).

For a finite index set T0 of all bad places different from p and finite local image sets Gamma_v⊆Qp, define Upsilon={−sum_v t_v : t_v in Gamma_v for every v}. It is finite, equals{0} for T0 empty or all Gamma_v={0}, and is a sound correction set even if Gamma_v are finite proved upper bounds rather than exact images. For globalHeight=heightAtP+sum_v t_v, the residual heightAtP−globalHeight lies in Upsilon. This fixes the positive sign printed in BDMTV equation(19).

**Hypotheses and conventions.** Finite local images or proved finite supersets are supplied for every bad place. All height functions use one common idele character and compatible global/local normalization.

**Construction or proof.** 1. Form the finite product of the Gamma_v and map it by negative summation. 2. For a global path extension, apply the generic local-to-global height sum identity and the membership of each local term. 3. A proved finite enlargement preserves rational containment; exact equality of local images is separate evidence.

**Uses.** pair-of-heights: Supplies the residual values containing every rational point. HeightDeterminant: Determines the correction in every candidate and anchor row.

**API.**

- `AwayHeightConstants.finite`: Finite local sets and a finite index set give a finite correction set.
- `AwayHeightConstants.mem`: Every tuple of allowed local values yields its negative sum in Upsilon.
- `AwayHeightConstants.mono`: Enlarging each local set enlarges Upsilon.
- `AwayHeightConstants.all_zero`: All singleton-zero local sets give Upsilon={0}.
- `AwayHeightConstants.height_sum`: The global height sum identity puts heightAtP−globalHeight in Upsilon.

**Distinguishing tests.**

- `away_empty`: For the empty place set the correction set is{0}.
- `away_nonzero_one_place`: One local set{2} gives correction set{−2}.
- `away_nonzero_two_places`: Local sets{1} and{2} give{−3}.
- `away_nonzero_cannot_be_dropped`: For local set{3}, neither3 nor0 belongs to the correction set.

**Needs.** `AnabelianGeometryAndNonabelianChabauty:NC.5/finite-bad-height-image`; `mathlib:Set.Finite.image`.

**Source.** [Quadratic Chabauty and rational points I: p-adic heights](https://arxiv.org/pdf/1601.00388v2), Theorem1.2(ii), p.4 and Proposition5.5, p.21. Uses the negative sum of away-place heights as the finite correction set.; [Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), equations(18)–(19), Lemma3.7, pp.907–908. Provides the construction and local/global identity; the equation(19) sign is repaired.

**Acceptance.** A singleton away-place value3 produces correction−3, not3 or0. Upper bounds do not certify the exact depth-two locus.

**Prototype boundary.** The finite-index set definition, five API items and all four tests are native. Actual arithmetic Gamma_v require G2 and NC.4.

#### Quadratic Chabauty pair

Target `quadratic-chabauty-pair`; proposed declaration `IsQuadraticChabautyPair` (definition).

Fix W=H0(X_Qp,Omega1)*, AJ_b:X(Qp)→W, a finite correction set Upsilon⊆Qp, an endomorphism E:W→W, a constant c in W and a Qp-bilinear form B:W×W→Qp. A quadratic Chabauty pair consists of theta:X(Qp)→Qp and Upsilon with these associated data such that: on every residue disc the joint map (AJ_b,theta) is given by convergent power series and is Zariski dense on every nonempty open subdisc; and for every x in X(Q), theta(x)−B(AJ_b(x),E AJ_b(x)+c) belongs to Upsilon. Native charts cover the local domain by finitely many images of the closed p-adic unit ball after rescaling. Native density is the explicit assertion that a polynomial vanishing on any such open subdisc is the zero polynomial.

**Hypotheses and conventions.** The curve application has g>1; the native genus-zero example only tests the interface. Charts are analytic on neighborhoods of the compact rescaled domains. The residue-disc power-series theorem supplies density on subdiscs.

**Construction or proof.** 1. Form joint coordinates indexed by one height coordinate and g Abel–Jacobi coordinates. 2. Express analyticity with the native power-series predicate and density by multivariate polynomial evaluation, with no opaque density placeholder. 3. Require finite corrections and rational containment in the residual locus. A theta-only density statement is insufficient.

**Uses.** BDMTV Lemma1.5: Supplies the finite height relation expressed by a determinant. NC.6 and ED.6: Exports rational containment and analytic finiteness separately from rational-point completeness.

**API.**

- `IsQuadraticChabautyPair.rational_mem`: A rational point belongs to the local domain and has residual in Upsilon.
- `IsQuadraticChabautyPair.weaken_constants`: Replacing Upsilon by a finite superset preserves the pair.
- `IsQuadraticChabautyPair.non_graph`: On no nonempty open subdisc can theta equal a polynomial in the Abel–Jacobi coordinates.

**Distinguishing tests.**

- `pair_identity_height`: For g=0, X=Qp, one identity chart on Zp, theta(t)=t, rational test set{0}, Upsilon={0}, and E=c=B=0, the native pair predicate holds. This is not a geometric genus-zero QC theorem.
- `pair_constant_abel_jacobi_rejected`: With g=1 and AJ=0 constant, theta(t)=t and the same chart, the pair predicate fails since the polynomial AJ-coordinate vanishes.
- `pair_wrong_correction_rejected`: For the g=0 identity interface, replacing Upsilon={0} by{1} loses the rational test point0.

**Needs.** `mathlib:AnalyticOnNhd`; `mathlib:Padic`; `mathlib:MvPolynomial.eval`.

**Source.** [Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §1.4, conditions(a)–(b), equation(5), pp.890–891. Defines the joint analytic pair and its finite residual values.

**Acceptance.** A constant Abel–Jacobi coordinate violates joint density even when theta is nonconstant. Analyticity only on an arbitrary disconnected neighborhood does not justify a zero bound without the subdisc density condition.

**Prototype boundary.** Native analytic/density/containment predicate and three unit tests elaborate. rational_mem is native; weaken_constants and non_graph are added as native APIs. Geometric AJ/height instantiation is omitted at G1,G2.

#### Quadratic Chabauty pair from heights

Target `pair-of-heights`; proposed declaration `pair_of_heights` (theorem).

Assume the good-reduction proper-curve hypotheses, a nonzero rational nice correspondence, r=g and an isomorphism J(Q)⊗Qp→W induced by the p-adic logarithm (equivalently the required finite-index closure hypothesis together with r=g). Choose the nonzero idele character and Hodge splitting of the shared height theory. Set theta(x)=h_p(A_Z(b,x)), Upsilon to the negative sum of all away-place image sets, E=E_Z, c=c_Z, and B to the global bilinear height restricted to the Mordell–Weil image and transported to W. These data form a quadratic Chabauty pair. No assertion that the entire global H1_f equals this image is needed.

**Hypotheses and conventions.** The two adjacent extension classes lie in the Mordell–Weil image by twist-two-classes, including the rational Chow–Heegner constant. The nonzero local character gives the height-coordinate isomorphism. The splitting is any allowed shared-height splitting; ordinary reduction or Panchishkin conditions are not added to this selected proper-curve theorem. For the selected nice-correspondence source chain, J is absolutely simple. An extension to nonsimple J needs a separately verified correspondence-to-alternating comparison; the general rank/Picard theorem is already nonsimple.

**Construction or proof.** 1. Use local-height-coordinates and NC.4 subdisc unipotent Albanese density to obtain the required joint density. Import Coleman/NC.2 power-series descriptions for analyticity. 2. Restrict the shared global bilinear pairing to the two Mordell–Weil classes and transport it along the actual logarithm isomorphism. 3. Apply the global sum of local heights: theta−B=−sum_away h_v, so the corrected Upsilon gives containment. Use finite-bad-height-image for finiteness of Upsilon.

**Needs.** `AnabelianGeometryAndNonabelianChabauty:NC.5/quadratic-chabauty-pair`; `AnabelianGeometryAndNonabelianChabauty:NC.5/local-height-coordinates`; `AnabelianGeometryAndNonabelianChabauty:NC.5/twist-two-classes`; `AnabelianGeometryAndNonabelianChabauty:NC.5/away-height-constants`; `AnabelianGeometryAndNonabelianChabauty:NC.4`; `ColemanIntegration:L1/coleman-integration-characterisation`.

**Source.** [Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §1.4, p.890; Lemma3.7 and proof, pp.907–908. Builds the pair from heights, with the corrected MW-image and correction-set sign.; [Quadratic Chabauty and rational points I: p-adic heights](https://arxiv.org/pdf/1601.00388v2), Proposition5.5, pp.20–22. Supports the restriction to the actual global point classes and the negative away sum.

**Acceptance.** Rank g alone does not certify the logarithm isomorphism. The local height is used without falsely asserting that it is itself globally bilinear.

**Prototype boundary.** Omitted actual geometric height-construction theorem at G1,G2. No fake geometry structure assumes this conclusion.

#### Finiteness of the residual height locus

Target `pair-finite-locus`; proposed declaration `pair_finite_locus` (theorem).

For a quadratic Chabauty pair, the set {x in X(Qp): theta(x)−B(AJ_b(x),E AJ_b(x)+c) in Upsilon} is finite and contains X(Q). More generally the native finite-chart interface has a finite residual locus on its covered local domain. This is a finite p-adic superset, not a rational-point completeness theorem and not in general the exact depth-two Chabauty–Kim locus.

**Hypotheses and conventions.** Use the compact closed chart domains and density on every nonempty open subdisc. NC.4 supplies the analytic zero theorem for the imported convergent series, with the relevant compactness/subdisc hypotheses.

**Construction or proof.** 1. For each alpha in Upsilon the polynomial T−B(W,E W+c)−alpha is nonzero because its T coefficient is1. Joint subdisc density makes its analytic pullback nonzero on every open subdisc. 2. Invoke the NC.4 analytic zero theorem on each compact chart, then take finite unions of finite zero sets and their chart images. 3. Use rational_mem for containment. Identifying every surviving point as rational requires a separate certified exclusion argument.

**Needs.** `AnabelianGeometryAndNonabelianChabauty:NC.5/quadratic-chabauty-pair`; `AnabelianGeometryAndNonabelianChabauty:NC.4`; `mathlib:Set.Finite.image`.

**Source.** [Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §1.4, explanation after equation(5), p.891. Explains the analytic finite-superset conclusion of a quadratic Chabauty pair.

**Acceptance.** A density assertion on one disc cannot be applied to an unchecked disc. An analytic function allowed to vanish identically on an open subdisc is rejected.

**Prototype boundary.** The geometric theorem is omitted at G1. A native conditional form importing the missing NC.4 analytic zero theorem is not fabricated.

#### Pair for potentially good reduction

Target `potential-good-pair`; proposed declaration `potential_good_height_constants` (application).

Under the pair-of-heights hypotheses, if X has potentially good reduction at every finite place, every away-from-p height image is{0}, so the corrected correction set is{0}. Then (theta,{0}) is a quadratic Chabauty pair. Potential good reduction at a single bad place does not dispose of another bad place.

**Hypotheses and conventions.** The imported path representation is potentially unramified at every v≠p after a good-reduction extension. The same nonzero character and Hodge splitting are used throughout.

**Construction or proof.** 1. Apply away-height-vanishes at each place to the actual path twist. 2. Use AwayHeightConstants.all_zero, and then pair-of-heights with that set.

**Needs.** `AnabelianGeometryAndNonabelianChabauty:NC.5/pair-of-heights`; `AnabelianGeometryAndNonabelianChabauty:NC.5/away-height-vanishes`; `AnabelianGeometryAndNonabelianChabauty:NC.5/away-height-constants`.

**Source.** [Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Corollary3.8 and proof, p.908. Applies potential good reduction to make every local correction vanish.

**Acceptance.** All finite places are accounted for before the singleton-zero set is used.

**Prototype boundary.** Omitted actual arithmetic height/path signature at G1,G2.

#### Independence of height choices

Target `choices-independence`; proposed declaration `choices_independence` (theorem).

Changing the allowed Hodge splitting changes theta and the transported global bilinear pairing by the same bilinear expression D(AJ_b(x),E AJ_b(x)+c), so their residual and its height locus agree. Rescaling the idele character by a nonzero scalar a changes theta,B and every local image set by a; Upsilon becomes a*Upsilon and the residual-membership locus agrees. The zero character is excluded. Arbitrary unrelated characters are not identified by this scaling argument.

**Hypotheses and conventions.** Use the shared generic height variation theorem, restricted to the two Mordell–Weil classes. Use a single global character with its compatible local components; in the selected Q setting the stated nonzero rescaling is the comparison.

**Construction or proof.** 1. Apply the generic splitting-change formula to the local height and the global pairing; cancel identical bilinear changes. 2. All away-place height values scale with the character. The signed correction set scales likewise. 3. Multiplication by a nonzero scalar is injective, giving equivalence of memberships. A zero scalar destroys the obstruction.

**Needs.** `AnabelianGeometryAndNonabelianChabauty:NC.5/pair-of-heights`; `AnabelianGeometryAndNonabelianChabauty:NC.5/away-height-constants`.

**Source.** [Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Remark3.12, pp.908–909. Discusses cancellation under splitting changes and character rescaling.; [Quadratic Chabauty and rational points I: p-adic heights](https://arxiv.org/pdf/1601.00388v2), Remark4.9, p.17. Gives the bilinear splitting-change formula.; [Quadratic Chabauty and rational points II: generalised height functions on Selmer varieties](https://arxiv.org/pdf/1705.00401v2), §3.4, after Lemma3.8, p.19. Describes the more general preheight variation.

**Acceptance.** The change in theta alone is not claimed to vanish. For a=0, the example residual7−2 is falsely accepted after scaling; this is excluded.

**Prototype boundary.** Native splitting_residual and character_scale express both identities, with an explicit zero-character counterexample. The geometric specialization is omitted at G2.

### Determinants and equivariant features

#### Corrected height determinant

Target `height-determinant`; proposed declaration `HeightDeterminant` (construction).

Let psi(x) in k^m be the coordinate vector of the height feature AJ_b(x)⊗(E AJ_b(x)+c), in a selected tensor-feature space, and anchors P1,…,Pm with known residuals alpha_i. For a candidate residual alpha form the (m+1)×(m+1) matrix whose first row is (theta(x)−alpha,psi(x)) and ith anchor row is (theta(P_i)−alpha_i,psi(P_i)). HeightDeterminant is its native Matrix.det. Candidate and anchor residuals are subtracted separately. To use its vanishing as a height equation, the anchor feature matrix must have nonzero determinant.

**Hypotheses and conventions.** k is a field; the geometric application uses Qp. For arithmetic use alpha and all alpha_i belong to the complete signed correction set. X may index pairs (correspondence, point): candidate and anchor features may come from different correspondences if their corrected heights are evaluations of the same global functional on the same balanced feature space. This is the cross-class anchor convention used by ED.6 for X_s(13).

**Construction or proof.** 1. Index rows and columns by a distinguished height entry and m feature coordinates. 2. Construct the matrix from the explicit formula and apply the existing determinant. 3. Use row subtraction to prove the equation theorem when the anchor feature matrix is invertible.

**Uses.** BDMTV §6.4.1: Recovers the two height equations from three independent balanced features. ED.6: Specifies what the anchor and correction certificates must establish before numerical root searches.

**API.**

- `HeightDeterminant.matrix_first`: The top-left matrix entry is theta(x)−alpha.
- `HeightDeterminant.duplicate_row`: At an anchor with the same residual correction, the candidate row repeats an anchor row, so the determinant is0.
- `HeightDeterminant.equation`: If the feature matrix is invertible and anchor corrected heights equal a linear functional L on their features, determinant0 is equivalent to theta(x)−L(psi(x))=alpha.

**Distinguishing tests.**

- `determinant_empty_features`: For m=0, theta(x)=x, candidate x=7 and alpha=2, the determinant is5.
- `determinant_nonzero_corrections`: For m=1, psi(x)=x, theta(x)=x+5, anchor4 with correction−1 and candidate2 with correction2, the matrix is ((5,2),(10,4)), so its determinant is0; dropping the corrections gives10.
- `determinant_basis_cannot_be_omitted`: For m=1 and the identically zero feature, any candidate has determinant0, including x=7 with theta(x)=x and alpha=0. This is not a finite equation.

**Needs.** `mathlib:Matrix.det`; `AnabelianGeometryAndNonabelianChabauty:NC.5/away-height-constants`.

**Source.** [Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Lemma1.5, equation(6) and proof, pp.891–892. Gives the corrected-height determinant using a basis of the feature space.

**Acceptance.** A singular anchor feature matrix can make the determinant vanish identically. m counts independent features, not merely available rational points.

**Prototype boundary.** Matrix, determinant, three API signatures and three tests are native. Actual height features and certified basis data use G1--G3.

#### Basis-certified determinant criterion

Target `determinant-criterion`; proposed declaration `determinant_height_equivalence` (theorem).

Under the pair hypotheses, suppose the selected feature vectors psi(P_i) form a basis of the height-feature space and the anchor residuals alpha_i are correct. Then for each alpha in Upsilon, HeightDeterminant_alpha(x)=0 is equivalent to theta(x)−B(AJ_b(x),E AJ_b(x)+c)=alpha. Its zero set is therefore finite; the union over alpha contains X(Q). Without the feature-basis certificate none of these finiteness or equivalence conclusions follows merely from a determinant.

**Hypotheses and conventions.** The bilinear pairing factors through a linear functional on the selected feature space. Feature coordinates are expressed in a fixed basis and the anchor feature matrix is invertible.

**Construction or proof.** 1. Subtract the column combination representing the actual height functional from the height column; anchor height entries become zero. 2. Expand by that column: determinant is the candidate residual minus alpha, times the nonzero anchor feature determinant. 3. Apply pair-finite-locus for the finite union of residual levels.

**Needs.** `AnabelianGeometryAndNonabelianChabauty:NC.5/height-determinant`; `AnabelianGeometryAndNonabelianChabauty:NC.5/pair-finite-locus`.

**Source.** [Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Lemma1.5, pp.891–892. Derives determinant vanishing from the height linear functional and its basis data.

**Acceptance.** The zero-feature determinant example fails the required basis hypothesis.

**Prototype boundary.** The native linear-algebra equivalence is HeightDeterminant.equation. Geometric finiteness specialization is omitted with pair_finite_locus at G1.

#### Equivariant balanced height features

Target `balanced-height-features`; proposed declaration `equivariant_height_balanced_tensor` (comparison).

Let K_p=K⊗Qp be a commutative finite etale Qp-algebra acting on W. If the chosen Hodge splitting is K_p-equivariant and the polarized height satisfies B(a u,v)=B(u,a v), the Qp-valued bilinear form factors through a Qp-linear functional on W⊗_{K_p}W. If W is free of rank1 over K_p and dim_Qp K_p=g, this balanced feature space has Qp dimension g, whereas W⊗_{Qp}W has dimension g². The selected rational-point features must still be a Qp-basis. A Qp-valued form is not asserted K_p-linear into Qp without a K_p-module structure on that target.

**Hypotheses and conventions.** The balancing action is the adjoint-compatible action for the selected polarization; equality with the same a on each side is verified for the real-multiplication application. K_p can be a product of fields. Freeness over K_p, rather than vector-space dimension alone, is required.

**Construction or proof.** 1. Import tensor-product universal properties and the shared equivariant splitting variation theorem. Balancing kills the defining tensor relations. 2. Use a rank-one K_p basis to identify the balanced tensor with K_p, then restrict scalars to Qp. 3. Read off dimensions and require the anchor feature determinant to certify the basis used for interpolation.

**Needs.** `AnabelianGeometryAndNonabelianChabauty:NC.5/height-prevalue`; `mathlib:TensorProduct`; `mathlib:TensorProduct.lift`; `AbelianSchemesAndArithmeticModuli:A2/rosati-involution`.

**Source.** [Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §1.7, pp.894–895; Remark3.9, p.908; §6.4.1, p.932. Uses equivariant heights to reduce the number of features from g² to g.; [Quadratic Chabauty and rational points II: generalised height functions on Selmer varieties](https://arxiv.org/pdf/1705.00401v2), §4.1, Lemma4.3, p.23; §5, Lemma5.2(1), p.24 and Lemma5.3, p.25. Establishes the equivariant height factorization supporting these balanced relations.

**Acceptance.** For K_p=Qp×Qp and W=K_p, the balanced dimension is2 while the ordinary tensor dimension is4. For the cubic real-multiplication example dimensions are3 and9; three dependent vectors still do not form a basis.

**Prototype boundary.** Generic tensor algebra is imported. The actual equivariant height/action/adjoint realization signature is omitted at G1,G2.

## Worked consumer: X_s(13), owned by ED.6

The existing targets `EffectiveDiophantineMethods:ED.6/xs13-plane-model`, `/xs13-endomorphism-algebra`, `/xs13-rank-three`, `/xs13-tate-classes`, `/xs13-equivariant-height-matrices`, `/xs13-first-chart-points`, `/xs13-second-chart-points`, `/xs13-p0-disc` and `/xs13-rational-points` already plan the concrete model and complete computation. They consume this layer's pair, local height and determinant results. This section illustrates those interfaces; it creates no new worked-curve node or reverse prerequisite.

The published result is that the monic homogeneous quartic model has exactly the seven rational points

(1:1:1), (1:1:2), (0:0:1), (−3:3:2), (1:1:0), (0:2:1), (−1:1:0).

The source is [BDMTV2019](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Theorem1.1 p.886 and §6 pp.926–934. The ED.6 model node fixes the quartic and its rational change of coordinates. The first Baran model has good reduction away from13, including2; Theorem6.6 supplies potential good reduction at13. The apparent bad2-fibre of the monic model therefore does not leave a nonzero local-height term unaccounted for.

The height application uses p=17, g=r=rho_Q=3 and the real cubic multiplication field K=Q(alpha), alpha³+2alpha²−alpha−1=0. The arithmetic owner must certify the rank using the exact modular RM Gross–Zagier/Kolyvagin–Logachev inputs and certified conjugate derivative bounds. That assertion is not a genus-one rank theorem applied to an arbitrary abelian variety. Since17 is inert in K, the actual K-equivariant logarithm span is checked through a nonzero point logarithm; rank3 alone does not certify that map.

The two Hecke correspondences from T7 and T11 are actual rational cycles. Their trace-zero matrices supply two independent nice classes: entries(1,4),(1,5) give the minor determinant24. Checking Frobenius, filtration and cup equations on p-adic matrices cannot replace rational Hecke-cycle provenance. With a K_p-equivariant splitting, the height functional factors through W tensor_(K_p) W, a Q17-space of dimension3. The published anchor coefficient rows (352,818,294), (162,406,150), (−36,−62,−18) have determinant13440. The actual logarithm and tensor basis certificates still belong to the ED.6 computation. Z1 anchor rows can interpolate a Z2 candidate row because they evaluate the same global height functional on the same balanced space; the abstract determinant interface permits an index including both the class and the point.

The supplementary [numerical data](https://raw.githubusercontent.com/jtuitman/Cartan13/e0dad89b5771312da3354531fc51e1e335a72ee3/data.pdf), §§1–3 pp.1–5, enumerates all 20 smooth F17 points. Seventeen discs are covered by the first chart, two infinity discs by the second, and the exceptional P0=(1:1:1) disc by basepoint change and overconvergent continuation. On those three regions the common zeros recover respectively P1,P2,P3,P5; P4,P6; and P0. Exact rational substitutions establish membership only. Completeness uses the existing ED.6 `/qc-certificate-sound` and `/padic-candidate-comparison` contracts with a certificate for every disc, every omitted series tail, root uniqueness and exact matching or exclusion.

A new reproducibility finding affects the exceptional-disc code. At the recorded commit, [U1.m line358](https://github.com/jtuitman/Cartan13/blob/e0dad89b5771312da3354531fc51e1e335a72ee3/U1.m#L358) gives the Z2 tensor-feature helper the vector betafil1. The [helper](https://github.com/jtuitman/Cartan13/blob/e0dad89b5771312da3354531fc51e1e335a72ee3/heights.m#L318) subtracts that vector in forming the lower extension; the published vectors differ. It must receive betafil2. Its vanishing upper class at P0 can hide the mismatch at the known point. ED.6 must replay the corrected function and full root certificates. This finding questions that particular reproduction, not the independently stated seven-point theorem. The supplementary code was read, not run.

## Gaps and precise supplier requests

### G1: native geometric realizations and the relative-cohomology bridge

The cited NC.2/NC.3, A2/A6, period and integration suppliers are genuine mathematical plans, not native implementations of these geometric signatures at the pins. Missing instances are Pic(X×X) with pullbacks/cycle action, the proper finite path group and cup relation, equivariant schematic central pushout, universal length-two Galois module and faithful quotient action, contracted-product twist, actual graded automorphism quotient on every twisted fibre, strict filtered D_cris pushout comparison, and Abel–Jacobi chart specialization. The specific Beilinson length-two relative-cohomology comparison used in BD I Theorem6.1 pp.24–25 and its divisor specialization in Theorem6.3 pp.26–29, including the x=b endpoint specialization, has no confirmed exact native supplier. MC.0 cycle formalism alone is insufficient. Verify and assign that comparison to the geometric path/cycle owners without rebuilding generic mixed extensions here; retain it as a proof input until then. The helper module quotient and fibre equivalence do not stand for these geometric objects.

### G2: shared generic mixed extensions and p-adic heights have no stage yet

The pending SelmerIwasawaCohomology Part II design, alias SelmerComplexesAndPadicHeights, is coordinated by issue3430 and has no stage/node identifier to cite. It must supply actual flagged Galois mixed extensions with grades Qp,V,Qp(1), rigidified isomorphisms and pi1/pi2, their nonabelian classifier, crystalline filtered-phi mixed extensions and strict D_cris compatibility; a continuous global idele-class character chi with nonzero p-component and a chosen Hodge splitting; local height extraction away from p, potential-unramified vanishing, local Frobenius/Hodge preheight coordinates at p, the global bilinear pairing and its sum of local terms; equivariance, splitting variation and common-character scaling. This is the curve specialization in BD I §4 pp.12–17 and BD II §3.2–3.4 pp.15–20; ordinary/Panchishkin assumptions from the separate cycle branch are not inserted. Nekovar’s original height construction was not obtained at the author URL and is not cited as read. The supplier must verify its original proof. It must not import NC.5. These generic objects are not locally duplicated, and no fabricated stage reference or opaque proposition replaces them.

### G3: imported worked-curve evidence needs corrected replay

The complete X_s(13) computation and its arithmetic/numerical certificates belong to EffectiveDiophantineMethods:ED.6, not a second NC.5 plan. Its existing model, RM/rank, Hecke classes, anchor, first-chart, second-chart, P0-disc and rational-points nodes were read and matched with the primary passages. The published conclusion is the seven-point theorem, not a claim of replay in this run. Require ED.6 to replay the two actual height functions on all 20 discs, with correct class-specific Hodge vectors: supplementary U1.m line358 passes betafil1 to the Z2 feature, while the helper subtracts that vector from the lower extension class. Replace it by betafil2 and certify the resulting root lists before using them. Require bounds for every omitted coefficient after t=17s, root uniqueness/Hensel and disjointness or exact matching, the actual global logarithm isomorphism, rational cycle provenance, and the shared-functional anchor basis. Code and data were read, not executed; precision20 and a list agreeing with known points are not these proof certificates. The arithmetic rank assembly must use the exact GZ.8/HE.7 RM contracts and CN.4 enclosures already requested by ED.6; no rank theorem or root-certification algorithm is replanned here.

The four requests already point to real suppliers; G2 is recorded as a gap because its design has no stage yet.

- `MotivesAndAlgebraicCycles:MC.0`: Rational Picard/divisor correspondences on X×X modulo pullbacks; proper intersection/moving and Kunneth H1⊗H1 cycle action; compatibility of swapping, cup contraction and polarized trace. The specific Beilinson/relative-cohomology mixed-extension comparison is not claimed supplied by MC.0: G1 records it.
- `HeightsRationalPointsAndObstructions:RP.1`: Finite generation of the actual rational Jacobian Mordell–Weil group and the rational Kummer image, with rank and localization conventions. This is not a certificate of rank for the concrete genus-three Jacobian.
- `AnabelianGeometryAndNonabelianChabauty:NC.4`: The depth-two proper-curve Selmer variety with a Mordell–Weil cut, crystalline p-condition and actual bad-place local images; finite image for v≠p from Kim–Tamagawa; nonlinear Albanese density on every open residue subdisc; the compact-chart analytic zero theorem. Also supply good-reduction proper etale paths unramified at v≠p, and potential good reduction implies potentially unramified paths after finite base change. NC.2 crystalline p-comparison alone is not this away-place theorem.
- `AbelianSchemesAndArithmeticModuli:A2/abelian-neron-severi`: Use the existing k-defined NS injection, together with A6 finite rank. Supply rational coefficient descent for the Rosati-symmetric-Hom comparison when it is invoked over Q: A2/rational-ns-and-ample-cone states its isomorphism over an algebraically closed field. Do not identify geometric NS or its integral Galois invariants with Q-defined line classes without descent. The generic rank bound needs only the rational NS injection into H2(J), not the Tate-conjecture equality.

The missing geometric prototype names are stated at the corresponding targets above and in the suggested file. In particular, the contracted-product constructor, its three APIs and three tests have explicit omissions; no opaque type or proposition fills those signatures. The native fibre equivalence is an equivalence of supplied coordinates, not a scheme comparison. The native pair predicate is analyticity, density and containment written directly on actual functions, not a fake geometric object assuming the target theorem.

## Source corrections used in this plan

All claims in the following register are paraphrased in our own words. A new finding means no correction was located in the sources checked; independent review must confirm it. The packet records locators, reasoning and correction searches for every entry.

- **E501 (error).** BDMTV2019 Lemma4.7 and proof, pp.913–914; sequel arXiv2101.01862v4 Remark3.17 p.16. Use only rational nice correspondence implies admissible class. Preserve rational algebraic provenance as input; equality of the stated ranks does not supply the inverse lift. Intersection of a rational lattice with a filtration can differ from the intersection of its Qp-span with that filtration. The authors explicitly correct this argument in the sequel. Status: Corrected in BDMTV2023 Remark3.17; also PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/E5.
- **E502 (gap).** BDMTV2019 Lemma3.7 proof p.907; Theorem2.3 sketch p.899. Restrict the global pairing and Selmer projection to the actual Mordell–Weil Kummer image, and establish both twist projections lie in that image using Chow–Heegner provenance. Do not identify full global H1_f without the missing Sha input. Rank/logarithm information only gives the MW-image isomorphism. BD I §2.3 and Proposition5.5 use that image, and the two rational divisor classes suffice. Status: Already recorded in PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/E8.
- **E503 (gap).** BDMTV2019 Corollary6.7 proof p.929; first model p.930. Combine Theorem6.6 for13 with good reduction of the first Baran model away from13. Its intrinsic good reduction at2 is retained even though the monic model has a bad2-fibre. A local theorem at13 says nothing about2. The first rationally isomorphic model supplies the missing good-away13 argument. Status: Already recorded in PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/E12.
- **E504 (misprint).** BDMTV2019 equations(18)–(19) and Lemma3.7, pp.907–908; BD I Theorem1.2(ii) p.4 and Proposition5.5 p.21. Use negative sums: Upsilon={−sum_v h_v}. Every local value and every anchor correction follows the same convention. The source global identity is h=h_p+sum_away h_v; subtracting h from h_p gives the negative away sum. A local value3 therefore contributes−3. The worked example with all heights0 hides the sign. Status: new
- **E505 (error).** BDMTV2019 Lemma2.4, p.900. Require both a nonzero Kunneth class and zero cup image. Keep the absolutely-simple-J hypothesis of this source lemma. The zero correspondence is symmetric and cup-zero but fails the nontrivial condition in the immediately preceding definition. The repaired criterion explicitly includes nonvanishing. Status: new
- **E506 (error).** BD II arXiv1705.00401v2 Lemma4.2 proof, p.22. Its G-fixed locus must consist only of its distinguished neutral coset, on every cocycle twist. Apply the arbitrary-closed-embedding exact sequence from NC.3 and the weight argument to all fibres. The neutral coset of the Galois-stable subgroup is automatically fixed. Faithfulness of the group representation alone cannot prove injectivity on H1. The intended negative-weight argument rules out additional fixed cosets. Status: new
- **E507 (misprint).** Cartan13 U1.m at commit e0dad89b5771312da3354531fc51e1e335a72ee3, line358; heights.m lines318–334; BDMTV2019 §6.4 p.931. Pass betafil2 to E1_tensor_E2 for PhiAZ2P0_to_z. ED.6 must replay the corrected determinants and root certificates. The helper subtracts the supplied Hodge vector to form the lower extension. The two source Hodge vectors differ, so using the first vector changes the Z2 feature. Agreement at the basepoint, where the upper class is0, cannot detect the error. Status: new
- **E508 (misprint).** BDMTV2019 §4.5 step(i), p.918, compared with equation(30) p.916. Use Omega transpose times Z times dOmega minus eta, with vanishing residues at the boundary. This is a normalization requirement on ED.6 connection certificates. For alternating Z, exchanging the differentiated factor changes the sign. The gauge equation(30) fixes the orientation. Status: Already recorded in PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/E2.
- **E509 (misprint).** BDMTV2019 §5.3.2 transport display p.923, compared with equation(41) p.921. Use left multiplication by I(x0,x) and right multiplication by I(b,b0), consistently in all entries. This is required for ED.6 to supply actual height coordinates. Equation(41) fixes the two ordered endpoint transports; the printed integrals reverse them and conflict with the already correctly oriented iterated entry. Status: Already recorded in PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/E3.
- **E510 (gap).** BDMTV2019 §4.1 p.909 and Hodge computation §4.5 pp.916–918. Require its first g elements to form H0(X,Omega1), as in the actual worked-curve basis. The ED.6 Hodge certificate must use that adapted basis. The Hodge construction distinguishes the first g coordinates; a general symplectic basis need not be adapted to that filtration. Status: Already recorded in PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/E4.

## Coverage, routing and acceptance

The pass has 25 own targets:3 definitions,6 constructions,10 theorems,3 comparisons and3 applications;36 API items and 29 distinguishing tests;14 pinned baseline declarations and 5 planets. Every new definition/construction has at least three APIs and tests. All prerequisites end at existing declarations, actual blueprint nodes, a precise requested stage or one of G1–G3. Coverage is planned with the remaining list in the packet; no gap-free closure is claimed.

The nineteen BDMTV source items are preserved as follows. Each row is a target relation, not a section-by-section summary of the paper.

| BDMTV item | NC.5 target |
|---|---|
| 11 | `AnabelianGeometryAndNonabelianChabauty:NC.5/quadratic-chabauty-pair` |
| 12 | `AnabelianGeometryAndNonabelianChabauty:NC.5/height-determinant` |
| 13 | `AnabelianGeometryAndNonabelianChabauty:NC.5/balanced-height-features` |
| 22 | `AnabelianGeometryAndNonabelianChabauty:NC.5/nice-trace-criterion` |
| 28 | `AnabelianGeometryAndNonabelianChabauty:NC.5/away-height-vanishes` |
| 32 | `AnabelianGeometryAndNonabelianChabauty:NC.5/height-prevalue` |
| 33 | `AnabelianGeometryAndNonabelianChabauty:NC.5/height-module-twist` |
| 35 | `AnabelianGeometryAndNonabelianChabauty:NC.5/pair-of-heights` |
| 36 | `AnabelianGeometryAndNonabelianChabauty:NC.5/potential-good-pair` |
| 37 | `AnabelianGeometryAndNonabelianChabauty:NC.5/choices-independence` |
| 38 | `AnabelianGeometryAndNonabelianChabauty:NC.5/chow-heegner-class` |
| 46 | `AnabelianGeometryAndNonabelianChabauty:NC.5/admissible-tate-class` |
| 47 | `AnabelianGeometryAndNonabelianChabauty:NC.5/nice-class-realization` |
| 48 | `AnabelianGeometryAndNonabelianChabauty:NC.5/height-module` |
| 62 | `AnabelianGeometryAndNonabelianChabauty:NC.5/height-module-comparison` |
| 20 | `AnabelianGeometryAndNonabelianChabauty:NC.5/rank-picard-criterion` |
| 21 | `AnabelianGeometryAndNonabelianChabauty:NC.5/nice-correspondence` |
| 23 | `AnabelianGeometryAndNonabelianChabauty:NC.5/depth-two-quotient` |
| 34 | `AnabelianGeometryAndNonabelianChabauty:NC.5/finite-bad-height-image` |
| 9 | `AbelianSchemesAndArithmeticModuli:A2/abelian-neron-severi` |

Item9 is logically retargeted to the existing A2 NS owner, with finite rank from A6. This handles RT-AREA-algebraicgeometry/8 without locally rebuilding the group or editing the paper job. Generic height items24,25,26,27,30,31 remain assigned to the pending shared Part II design, coordinated by [issue3430](https://github.com/CBirkbeck/tauceti-explorer/issues/3430). Its dependency direction is generic heights → NC.5 → ED.6; no generic height foundation depends on this application.

Acceptance of the mathematical plan requires:

- The rank inequality is strict, uses rational NS and the MW-cut Selmer locus, and specializes to r<g when rho_Q=1. The equality boundary makes no finiteness claim.
- Nice quotient classes are nonzero. Admissibility is used only forward from rational cycles. Proper cup relations, schematic quotient and weight-grade rigidifications survive all realizations.
- Both adjacent twist classes have rational Mordell–Weil provenance; the Chow–Heegner constant is retained. Every twisted automorphism quotient has exactly the neutral invariant coset, not an empty invariant set.
- The height prevalue subtracts both beta terms. Every bad place is included, negative correction signs appear in both candidate and anchor rows, and nonzero character scaling also scales all local sets.
- Joint analytic density holds on every open subdisc of all covered compact charts. A constant Abel–Jacobi coordinate, singular feature matrix or zero character cannot masquerade as a finite obstruction.
- The worked example consumes existing ED.6 targets and distinguishes finite p-adic containment from complete rational identification. The corrected exceptional-disc function and all 20 certificate cases must be supplied by that owner.
- Independent review checks the ten source findings and the requests rather than treating successful native elaboration as proof of the geometric comparisons.

## Planets

- Nice correspondence
- Quadratic Chabauty rank criterion
- Depth-two height module
- Quadratic Chabauty pair
- Quadratic Chabauty determinant

## Sources actually read

- [Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Jennifer S. Balakrishnan, Netan Dogra, J. Steffen Muller, Jan Tuitman and Jan Vonk, Annals of Mathematics 189 (2019), 885–944. Read §1.4–1.7, pp.890–895; §2, pp.896–901; §3, pp.901–909; §4.4, pp.913–915; §5.4–5.5, pp.923–926; §6, pp.926–934. SHA-256 `e1aa5f9662b4875404e25e45dd808e2b73223d562191018242ef357a13dff1f8`; accessed 2026-10-11.
- [Quadratic Chabauty and rational points I: p-adic heights](https://arxiv.org/pdf/1601.00388v2), Jennifer S. Balakrishnan and Netan Dogra, arXiv:1601.00388v2, 1 May 2018; PDF pagination. Read §1, pp.3–6; §2.3–2.5, pp.9–10; §3, pp.11–12; §4, pp.12–17; §5.1–5.2, pp.17–22; §6.1–6.4, pp.23–29; §8.1–8.3, pp.32–36. SHA-256 `1b8006eed69c262ab051e398e614478da38d46be73f8ed91a892834d2b38ae25`; accessed 2026-10-11.
- [Quadratic Chabauty and rational points II: generalised height functions on Selmer varieties](https://arxiv.org/pdf/1705.00401v2), Jennifer S. Balakrishnan and Netan Dogra, arXiv:1705.00401v2, July 2018; PDF pagination. Read §1.1, pp.3–6 (scope screen); §3.1–3.4, pp.12–20; §4, pp.20–22; §4.1 and §5, pp.23–26; §7.5, pp.45–46 (boundary screen). SHA-256 `ed0c4e8aa3296c7b986a01216c798ccfd0541978e7d9e26367983e6531c0319f`; accessed 2026-10-11.
- [A refined Selmer variety for the thrice-punctured projective line](https://ora.ox.ac.uk/objects/uuid:debfa65b-85aa-4877-96f7-40dc0f29c272/files/mb07826c07e1bc11e2aa481362bb229ae), Minhyong Kim and Akio Tamagawa, Author accepted manuscript, 2 February 2008; PDF pagination. Read Theorem0.1 and Corollary0.2, pp.1–2; §1, pp.2–5; §2, p.6. SHA-256 `fb2365247c678e992ef313b373d625373f62d78ba1ae5fc3b0d0d7c6b662a1a9`; accessed 2026-10-11.
- [Quadratic Chabauty for modular curves: algorithms and examples](https://arxiv.org/pdf/2101.01862v4), Jennifer S. Balakrishnan, Netan Dogra, J. Steffen Muller, Jan Tuitman and Jan Vonk, arXiv:2101.01862v4, 2023; PDF pagination. Read §3.5.2, Remark3.17, p.16 (correction to the Tate-class converse). SHA-256 `738f0ec0cd588e20a569bc029fe2bb9611abc5d16fee7d36f9e966357c25f61d`; accessed 2026-10-11.
- [Numerical data for X_s(13)](https://raw.githubusercontent.com/jtuitman/Cartan13/e0dad89b5771312da3354531fc51e1e335a72ee3/data.pdf), Balakrishnan, Dogra, Muller, Tuitman and Vonk, Supplement to BDMTV2019; Git commit e0dad89b5771312da3354531fc51e1e335a72ee3. Read §1, pp.1–3: model, twenty residues and first-chart roots; §2, pp.3–4: second chart and roots; §3, pp.4–5: exceptional-disc data. SHA-256 `a94006979deaa4187aaf1332b396536fef329a71b96ed1000a07decaaa2d52e9`; accessed 2026-10-11.
- [Cartan13 supplementary first-chart Magma script](https://raw.githubusercontent.com/jtuitman/Cartan13/e0dad89b5771312da3354531fc51e1e335a72ee3/U1.m), Balakrishnan, Dogra, Muller, Tuitman and Vonk, Supplement to BDMTV2019; Git commit e0dad89b5771312da3354531fc51e1e335a72ee3. Read First-chart setup, Hodge vectors, anchor features and root enumeration; Lines305–373: exceptional-disc basepoint change and the two height determinants; line358 checked against the helper. SHA-256 `306fbaf1cbfe337b78ab364860b135ef24991853fdff3edbc1d679163e5e89ef`; accessed 2026-10-11.
- [Cartan13 supplementary height and tensor helpers](https://raw.githubusercontent.com/jtuitman/Cartan13/e0dad89b5771312da3354531fc51e1e335a72ee3/heights.m), Balakrishnan, Dogra, Muller, Tuitman and Vonk, Supplement to BDMTV2019; Git commit e0dad89b5771312da3354531fc51e1e335a72ee3. Read Height formula and E1_tensor_E2, lines287–334. SHA-256 `21d4a797a1981d1419770ac6fe705a7401b5966fdad8eaad13dcfd9d40b640fd`; accessed 2026-10-11.

No passages from a restricted book were copied. The original Nekovar height PDF was not obtained, so it is an explicit missing source for G2 rather than a citation claimed read. Statements and proof outlines above are target-oriented original prose, with theorem, section and page locators.
