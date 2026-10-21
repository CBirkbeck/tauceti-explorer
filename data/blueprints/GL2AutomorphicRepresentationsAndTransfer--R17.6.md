# Characteristic-two soluble cases and transfer interfaces

R17.6 of **Modular forms — Hecke theory, newforms, and L-functions, Part II: GL₂ automorphic representations and transfer**, extending Tau Ceti’s [ModularForms roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms).

This layer constructs residual modularity witnesses for absolutely irreducible two-dimensional representations of G_Q in characteristic two with solvable projective image. It distinguishes the exact weight and conductor conclusion of Rohrlich–Tunnell from the more general existence of an odd dihedral lift. It also gives the conditions under which restriction, base change and descent preserve the representations required by compatible-system and potential-modularity consumers.

The boundary is the accepted RS-21 narrowing, reviewed in REV-FIX-RT-RS-21 on 7 October 2026. Residual modularity witnesses, Katz forms, Hasse invariants and Deligne–Serre lifting are imported from AlgebraicModularFormsAndSerreWeights. Generic Galois representations, quadratic induction, conductors and recognition are imported from ArithmeticGaloisRepresentations. Solvable transfer itself is R17.4. Carayol’s extraordinary dyadic cubic comparison belongs to the later arithmetic local-compatibility layer and is outside this stage.

The target-level pass is **complete** and R17.6 is **planned**. Two geometric proof gaps and an auxiliary-level removal gap are specified below; the Katz supplier contracts still need their owner’s implementation. This is a plan, and every target has implementation status unchecked.

## Conventions and reusable inputs

All finite residual representations are continuous for the discrete topology. Their images therefore factor through finite Galois quotients. “Absolutely irreducible” means irreducible after extension to an algebraic closure of the residue field. D_n denotes the dihedral group of order 2n. In the characteristic-two irreducible case n is odd and at least three. “Dihedral image” in the exact Rohrlich–Tunnell theorem means the **linear** image in GL₂, whereas Wiese’s convention uses the projective image.

A residual witness includes a normalized primitive cuspidal form f, its actual integer weight, exact primitive level and character, its coefficient field K_f, a chosen prime λ above 2, an integral stable lattice and an isomorphism between its residual semisimplification and the given representation after a common residue-field extension. Different primes of the same coefficient field are not interchangeable. This is the existing R15.6/residual-modularity-witness, not a new structure here.

Arithmetic Frobenius acts by x↦x^q on residue fields. The attached classical representation has good polynomial

\[
 P_q(X)=X^2-a_q(f)X+\chi(q)q^{k-1}.
\]

Geometric Frobenius on that same representation has the reciprocal roots. Contravariant cohomology, its dual and the coefficient diamond action are compared explicitly before using this polynomial. At every residual comparison, match both coefficients of P_q. Characteristic-two trace alone does not identify semisimplifications.

N(r̄) means the prime-to-two Artin conductor. For an unramified-at-two representation this is its full conductor. A local conductor inequality applies at odd primes; it must not be applied at the coefficient prime 2. For a signed fundamental discriminant D, the positive induction conductor uses |D|.

The following imports supply the objects and general operations used here.

| Owner | Exact imported content |
| --- | --- |
| R01.1 | Finite Galois factorization, stable lattices, reduction/semisimplification and lattice independence |
| R01.3 | Quadratic-induction conductor, conductor inequalities and global conductor of reduction |
| R01.4 | Dyadic solvable-image classification and the projective-dihedral iff induced theorem |
| R01.5 | Recognition by full characteristic polynomials and coefficient descent |
| R15.1–R15.2 | Hodge bundle, cusp ideal, q-expansion principle, integral Hecke operators and the actual reduction-module comparison |
| R15.3 | Hasse invariant of weight p−1, specialized here to p=2 |
| R15.5–R15.6 | Eigenvalue lifting, weight change and the existing residual witness |
| ModularCurvesPartII R14.3–R14.6 | Relative geometric coefficients, parabolic cohomology, Hecke comparison, actual modular quotient, rank-two weight-two Tate factor and special-fibre Eichler–Shimura |
| R16.2/R16.3 | Casselman newvectors, conductor-preserving LLC and the Tate/unitary normalization bridge |
| R17.4/R17.5 | Prime-cyclic and solvable transfer/descent, the exact descent fiber, quadratic-induction Artin automorphy and its Q weight-one interpretation |
| Current upstream roadmaps | Classical old/new forms and Fricke operators, Mackey decomposition, global class field/ray characters and Chebotarev |

## Canonical targets and assembly

The accepted R17.3 packet already contains fifteen R17.6 targets. They retain their identifiers. This packet imports them and supplies same-id replacement fields under `nodeRefinements`; it creates no second version of their nodes. Three input targets are added below because the binding tier rule disallows this layer’s old dependency on the later AutomorphicGaloisRepresentations roadmap. The later roadmap must import these classical inputs. Generic parabolic cohomology and modular quotients retain their lower owners.

At assembly, apply each refinement’s statement, hypotheses, proof steps, acceptance checks, prerequisites and sources to its canonical node, retaining its kind and planet. Then add the three new targets and check the combined graph. The unmodified canonical packet still contains the upward references removed by this follow-up; importing it without these replacements is insufficient.

There are six planets across the completed layer: Rohrlich–Tunnell weight and level lemma; Rohrlich–Tunnell theorem; Wiese’s dihedral lifting lemma; Dihedral Katz weight-one theorem; Characteristic-two solvable modularity; and Galois representations of classical newforms. Five are retained and one is added.

## Classical inputs that belong below the consumer

The eigencomponent is an application of the existing geometric coefficient/cohomology carriers. The construction is rational; a stable integral lattice is selected afterwards. This avoids inventing an integral Hecke idempotent or assuming semisimplicity in characteristic two. Its higher-weight comparison and odd-prime local geometric proof are exactly G1 and G2 below. The source statements are checked, but those proof interiors are not declared closed.

### The classical newform eigencomponent

Identifier: `GL2AutomorphicRepresentationsAndTransfer:R17.6/classical-eigencomponent`. New input target.

For a normalized primitive cuspidal eigenform f of integer weight k≥2, exact level M and character χ, let K_f include all a_n(f) and χ-values, and choose λ|2. Construct the two-dimensional K_{f,λ}-space V_{f,λ} with its continuous G_Q action and commuting scalar Hecke action. For k=2 it is the λ-factor of V₂(A_f), importing the actual modular quotient and its rank from R14.5. For k≥3 it is the dual of the f-component of rational geometric parabolic H¹ with Sym^{k−2}R¹π_* coefficients, using the Hecke action compared with classical a_q(f). At small levels use an auxiliary full level n≥3 divisible by M and take the finite-level invariants that recover Γ₁(M), before selecting the primitive f-component. The finite-level descent is Galois-equivariant, includes the cyclotomic descent datum and retains χ; it is not invariants only under an SL₂ deck group on one geometric component. Changes of auxiliary level give canonical Hecke/Galois-equivariant isomorphisms. No Chow-motive category or integral idempotent is asserted.

**Hypotheses and conventions.**

- f is primitive at its stated exact level, not an arbitrary oldform eigenvector.

- The scalar field is K_{f,λ}; finite extensions of it are allowed and recorded.

- Cohomology is rational when the Hecke projector is taken; denominators are not assumed invertible in an integral lattice.

**Proof route.**

1. Import the geometric relative coefficient system, its parabolic image and the comparison of Hecke actions from the named R14.3 nodes.

2. For weight two, use the actual quotient A_f and rational Tate exactness/rank two; take the chosen λ-factor, without asserting integral Tate exactness.

3. For k≥3, compare parabolic Betti cohomology with cuspidal forms, use semisimplicity of the rational good-prime Hecke algebra and primitive multiplicity one to isolate f, and transport the component to étale cohomology. Scholl §4.2.0 includes the upper-triangular GL₂(Z/n) invariants and the auxiliary-level correction.

4. Dualize the contravariant cohomological realization to put arithmetic Frobenius in the newform normalization; finite étale descent and trace/pullback identify auxiliary-level choices. The existence of the higher-weight rank-two projector/comparison is retained as G1, not inferred from the weight-two comparison.

**Checks.**

- The module has dimension two, not the dimension of the entire modular-curve cohomology.

- The k=2 realization agrees with the supplied A_f Tate factor.

- Record whether arithmetic or geometric Frobenius is used before comparing a characteristic polynomial.

**Direct prerequisites.** `ModularCurvesPartII:R14.3/relative-coefficient-system`; `ModularCurvesPartII:R14.3/parabolic-cohomology`; `ModularCurvesPartII:R14.3/geometric-hecke-coefficients`; `ModularCurvesPartII:R14.3/integral-comparison`; `ModularCurvesPartII:R14.3/weight-two-tate-comparison`; `ModularCurvesPartII:R14.5/modular-quotient`; `ModularCurvesPartII:R14.5/quotient-tate-exact`; `ModularCurvesPartII:R14.5/modular-quotient-dimension`; `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`.

**Source.** [A. J. Scholl, *Motives for modular forms*](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf.pdf), §§1.2.0–1.2.4, author pp.1–2; §4.2.0, author pp.8–9. Rational parabolic realization, f-component and auxiliary-level invariants; duality fixes arithmetic normalization.

**Source.** [Henri Darmon; Fred Diamond; Richard Taylor, *Fermat’s Last Theorem*](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), Lemma 1.48, pp.45–46; §3.1, pp.84–85. Weight-two modular quotient and its rank-two λ-factor.

**API derived from use.**

- `ClassicalEigencomponent.finrank` (characterisation): The chosen λ-factor V_{f,λ} has dimension two over K_{f,λ}.

- `ClassicalEigencomponent.hecke_scalar` (compatibility): At every good prime q, the compared Hecke operator acts on the selected f-component by a_q(f); diamonds act by χ(q), with pullback and Albanese conventions explicitly compared.

- `ClassicalEigencomponent.change_auxiliary_level` (equivalence): Changing between full-level covers dominating Γ₁(M) induces canonical Hecke- and G_Q-equivariant isomorphisms satisfying identity and composition.

- `ClassicalEigencomponent.extend_coefficients` (functoriality): For a finite extension E/K_{f,λ}, the component after extension is canonically E⊗V_{f,λ}, with the same Galois and Hecke actions.

- `ClassicalEigencomponent.weight_two` (compatibility): For k=2, comparison with the λ-factor of V₂(A_f) intertwines the chosen Albanese Hecke action and arithmetic Galois action.

- `ClassicalEigencomponent.projector` (constructor): On the descended rational primitive parabolic realization in the chosen arithmetic dual convention, construct the f-projector e_f with e_f²=e_f, commuting with Galois and the compared Hecke action. Its range is V_{f,λ}; its inclusion ι and projection π satisfy πι=id and ιπ=e_f. This is a rational splitting, not an integral idempotent.

- `ClassicalEigencomponent.map_ext` (extensionality): For linear maps u,v:V_{f,λ}→W, u=v iff u∘π=v∘π on the rational ambient realization. Maps w from the ambient realization satisfying w∘e_f=w factor uniquely through π. The same factorization respects Hecke/Galois actions when w does.

The construction is used as follows:

- `GL2AutomorphicRepresentationsAndTransfer:R17.6/classical-galois-realization`: Gives an actual two-dimensional module rather than assuming the desired Galois representation.

- `GL2AutomorphicRepresentationsAndTransfer:R17.6/classical-residual-conductor-bound`: Fixes the geometric action to which the local conductor comparison applies.

**Unit tests for the construction.**

- **primitive_rank**: A primitive form has a rank-two component; selecting its oldspace after adding an auxiliary prime must not double this rank.

- **weight_two_quotient**: For a rational-coefficient weight-two primitive form, V_{f,λ} is the two-dimensional rational Tate module of its elliptic quotient, not its untwisted contravariant H¹.

- **auxiliary_level_composition**: For covers at n|n′|n″ with all levels≥3 and divisible by M, the n″→n comparison equals the composition via n′.

- **coefficient_extension**: A quadratic extension of K_{f,λ} keeps dimension two over the extended field; restricting scalars gives dimension four over the original field.

- **frobenius_duality**: At a weight-two good prime with polynomial X²−a_qX+χ(q)q, the arithmetic realization has determinant χ(q)q; using geometric Frobenius on that same representation gives reciprocal roots, and cannot be silently substituted.

- **projector_splitting**: On the selected component πι is identity, while e_f kills any different primitive Hecke eigensummand present in the ambient realization. An identity projector on the whole cohomology fails this check.

### Galois representations of classical newforms

Identifier: `GL2AutomorphicRepresentationsAndTransfer:R17.6/classical-galois-realization`. New input target.

For the preceding primitive f of weight k≥2, exact level M, character χ and chosen λ|2, V_{f,λ} carries a continuous two-dimensional representation ρ_{f,λ}, unramified at all q∤2M. For arithmetic Frobenius at such q its characteristic polynomial is X²−a_q(f)X+χ(q)q^{k−1}. Its determinant character is χ·ε₂^{k−1}. After a finite coefficient extension choose a stable lattice; reduction followed by semisimplification is a continuous finite-image residual representation. Its full good-prime characteristic polynomials are the reductions of these polynomials. Up to a common residue-field extension the residual semisimplification is independent of the chosen lattice. The statement requires no condition 2≥k and no ordinary/crystalline condition at 2.

**Hypotheses and conventions.**

- K_f contains χ-values and the coefficient prime λ lies over 2.

- Arithmetic Frobenius and the arithmetic normalized Hecke operators are used.

- Residual comparisons specify the extension of λ and the embeddings into a common algebraic residue field.

**Proof route.**

1. Use classical-eigencomponent to construct the action and good reduction away from 2M; in weight two import special-fibre Eichler–Shimura.

2. For k≥3 use the coefficient correspondence trace and the decomposition of the good-prime isogeny correspondence into Frobenius and Verschiebung (Deligne Proposition 3.18, §4.6–Theorem 4.9). On the weight-k coefficient system, FV=q^{k−1}, and T_q=F+⟨q⟩V. Scholl §4.2.2 also uses duality/conjugation to ensure both polynomial roots occur; merely annihilating a two-dimensional space by that polynomial is insufficient. G1 records the remaining higher-weight geometric proof input.

3. Compare geometric Frobenius on cohomology with arithmetic Frobenius on its dual. Identify the determinant globally by good-prime density and continuous character recognition.

4. Apply the R01 stable-lattice and reduction nodes. Chebotarev and the full-polynomial recognition node give lattice independence and comparison with the supplied residual representation. DS Theorem 6.1 is the statement, not a proof of the geometric input; §§6.12–6.13 supply the residual comparison.

**Checks.**

- Good-prime trace and determinant both agree; trace alone in characteristic two is insufficient.

- Weight two has determinant χ(q)q, and weight five has determinant χ(q)q⁴.

- No weight-one attached-representation existence is taken as a prerequisite: the dihedral Artin representation is already given by quadratic induction.

- No global absolute-irreducibility or semisimplicity theorem for the characteristic-zero realization is required here; residual reduction is explicitly semisimplified.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.6/classical-eigencomponent`; `ModularCurvesPartII:R14.6/special-fibre-eichler-shimura`; `ArithmeticGaloisRepresentations:R01.1/continuous-representations-have-stable-lattices`; `ArithmeticGaloisRepresentations:R01.1/reduction-and-residual-semisimplification`; `ArithmeticGaloisRepresentations:R01.1/continuity-descent-and-lattice-independence`; `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`.

**Source.** [Pierre Deligne; Jean-Pierre Serre, *Formes modulaires de poids 1*](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Theorem 6.1, p.520; §§6.12–6.13, p.523. Classical and residual representations; the higher-weight geometric theorem is treated as an input in this source.

**Source.** [Pierre Deligne, *Formes modulaires et représentations ℓ-adiques*](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf), §3.12 p.155; Proposition 3.18 p.158; §§4.6–4.9 pp.163–167. Hecke trace, coefficient Frobenius relation and arithmetic/geometric bridge.

**Source.** [A. J. Scholl, *Motives for modular forms*](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf.pdf), Theorem 1.2.4(i), author p.2; §4.2.2, author p.9. Both roots of the good-prime polynomial on the selected rank-two realization.

### The odd residual conductor bound

Identifier: `GL2AutomorphicRepresentationsAndTransfer:R17.6/classical-residual-conductor-bound`. New input target.

Let f, λ|2 and ρ_{f,λ} be as in classical-galois-realization, and let r̄_{f,λ} be the semisimplified stable-lattice reduction. For every odd prime q, a_q(r̄_{f,λ})≤a_q(ρ_{f,λ})=v_q(M), hence the prime-to-two Artin conductor N(r̄_{f,λ}) divides M^(2), the odd part of the exact newform level. This uses local compatibility only at q≠2. Equality for the residual conductor is not asserted. A finite-order characteristic-zero twist is tracked on both the automorphic and Galois sides before applying the conductor-preserving local correspondence.

**Hypotheses and conventions.**

- The form is primitive at exact level M.

- Artin conductors are taken for full representations, not just determinants.

- q is different from the residual characteristic 2, so R01’s reduction inequality applies.

**Proof route.**

1. Apply the rank-two local newvector/conductor comparison and Carayol’s classical local comparison at odd q. In Carayol’s convention the Weil representation uses geometric reciprocity and a dual/unitary twist; translate to the arithmetic normalization fixed above. Unramified dual/absolute-value twists do not change inertia or the Artin conductor.

2. For odd q, the local comparison has the principal-series, special, and ordinary (quadratically induced) cuspidal cases. Carayol §§11.1–11.3 reduce the ordinary case to a global induced character with the same local component. The special case requires nonzero monodromy, not just equality of semisimplifications; §11.4 identifies its image using Picard–Lefschetz. G2 retains the proof of this geometric comparison at Q, rather than importing its later higher-roadmap statement.

3. Use the existing R01 reduction and semisimplification inequalities prime by prime. Multiply the odd-prime inequalities to obtain divisibility. Do not use Carayol §12.3’s extraordinary dyadic cubic argument.

**Checks.**

- Conductor may strictly decrease on reduction; equality must not be a test.

- If a constructed congruent primitive form has odd level M|N(r̄), divisibility forces M=N(r̄).

- Unramified twists preserve the odd local conductor; a ramified determinant twist does not automatically preserve the exact level.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.6/classical-galois-realization`; `ArithmeticGaloisRepresentations:R01.3/global-conductor-of-reduction`; `ArithmeticGaloisRepresentations:R01.3/conductor-of-residual-semisimplification`; `GL2AutomorphicRepresentationsAndTransfer:R16.2/casselman-newvector`; `GL2AutomorphicRepresentationsAndTransfer:R16.3/conductor-epsilon-comparison`; `GL2AutomorphicRepresentationsAndTransfer:R16.3/tate-unitary-normalization`; `ModularCurvesPartII:R14.6/semistable-tate-interface`.

**Source.** [Henri Carayol, *Sur les représentations ℓ-adiques associées aux formes modulaires de Hilbert*](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), §§0.4–0.8, pp.410–411; §§11.1–11.4, pp.449–451. Odd-prime local comparison with normalization and special monodromy retained; extraordinary dyadic §12.3 is excluded.

**Source.** [David E. Rohrlich; Jerrold B. Tunnell, *An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), Technical-lemma proof, p.302 and conclusion p.306. Residual conductor divides newform level, used to recover exact N.

**Source.** [Henri Darmon; Fred Diamond; Richard Taylor, *Fermat’s Last Theorem*](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), Theorem 3.1(d) and residual discussion, pp.84–87. Classical conductor and the weaker residual divisibility.

## Finite-image reduction and conductor calculations

### Solvable characteristic-two images are dihedral

Identifier: `GL2AutomorphicRepresentationsAndTransfer:R17.6/solvable-dihedral`. Imported canonical target; use the replacement fields in this follow-up.

A continuous absolutely irreducible r̄:G_Q→GL₂(F̄₂) with solvable projective image has projective image D_n of order 2n, for an odd n≥3. Its finite image is a central extension by a cyclic odd-order scalar group, so projective solvability implies linear solvability. The quadratic field cut out by the rotation subgroup is the inducing field after determinant normalization.

**Hypotheses and conventions.**

- F̄₂ has the discrete topology; continuity makes the image finite.

- Absolute irreducibility is required, not just nontriviality.

**Proof route.**

1. Factor through a finite Galois quotient. Apply the existing finite subgroup/dihedral induction classification from R01.4.

2. Scalar kernels are abelian, so pass from solvable projective to solvable linear image. The characteristic-two irreducible solvable classification rules out the Borel case (a normal 2-group fixes a line), cyclic diagonalizable image, and the nonsolvable PSL₂ cases.

3. The determinant normalization has the same projective image and trivial scalar intersection in SL₂; its image is the actual D_n.

**Checks.**

- D_1 and cyclic images are reducible; n≥3 is explicit.

- A reducible upper-triangular solvable representation is a non-example.

- No claim that arbitrary solvable Galois restriction preserves irreducibility.

**Direct prerequisites.** `ArithmeticGaloisRepresentations:R01.1/finite-galois-factorisation`; `ArithmeticGaloisRepresentations:R01.4/dyadic-solvable-projective-image`; `ArithmeticGaloisRepresentations:R01.4/dihedral-projective-image-iff-induced`; `GL2AutomorphicRepresentationsAndTransfer:R17.6/determinant-untwist`.

**Source.** [David E. Rohrlich; Jerrold B. Tunnell, *An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), Introduction pp.299–301. The irreducible characteristic-two solvable/dihedral reduction.

**Source.** [Gabor Wiese, *Dihedral Galois representations and Katz modular forms*](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), Introduction pp.123–125. Projective-dihedral convention, including the characteristic-two odd rotation order.

### Removing the characteristic-two scalar character

Identifier: `GL2AutomorphicRepresentationsAndTransfer:R17.6/determinant-untwist`. Imported canonical target; use the replacement fields in this follow-up.

For finite-image r̄ in characteristic two, det r̄ has odd finite order and has a unique square-root character ξ. The twist r̄₀=ξ⁻¹⊗r̄ has determinant one, the same projective image and irreducibility, and no nonidentity scalar in its image. The finite scalar character ξ is unramified at 2. If the projective image is D_n with n odd, the image of r̄₀ is linearly D_n. Twist a characteristic-zero modular lift back by the Teichmüller Dirichlet lift of ξ, and record its actual new level and character rather than asserting an unchanged minimal level.

**Hypotheses and conventions.**

- The character is lifted at the chosen prime over 2.

- Projective dihedral means n odd≥3 here.

**Proof route.**

1. Inverse Frobenius on F̄₂× supplies the unique square root, compatibly with multiplication. In any finite coefficient field its order is odd.

2. The determinant of a scalar in rank two is its square; in characteristic two a square equal to one forces the scalar to be one.

3. Local reciprocity for Q₂ sends the pro-2 unit group to a finite group of odd order trivially; global Kronecker–Weber/class field theory identifies the finite character with a Dirichlet character of odd conductor.

4. Apply the classical newform twist operation, extending coefficient field and the prime when necessary. Compare full residual polynomials and include the changed level in the witness.

**Checks.**

- A nontrivial odd-order determinant is allowed.

- The normalized linear image injects into its projective image.

- Untwisting is an algebraic operation and is not a proof of modularity or of level preservation.

**Direct prerequisites.** `ArithmeticGaloisRepresentations:R01.1/finite-galois-factorisation`; `mathlib:Matrix.GeneralLinearGroup.det`; `mathlib:Matrix.GeneralLinearGroup.scalar`; `mathlib:Matrix.GeneralLinearGroup.det_scalar`; `mathlib:Matrix.ProjGenLinGroup.mk`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`; `ArithmeticGaloisRepresentations:R01.4/dihedral-projective-image-iff-induced`; `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`.

**Source.** [David E. Rohrlich; Jerrold B. Tunnell, *An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), §2 p.307, dihedral image hypothesis. Normalization needed to apply the source’s linear-dihedral theorem.

**Source.** [Gabor Wiese, *Dihedral Galois representations and Katz modular forms*](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), Introduction p.124 and Lemmas 2–3 pp.125–127. The broader projective-dihedral lift allows a scalar twist; its coefficients/prime must be tracked.

**Source.** [Gabor Wiese, *Dihedral Galois representations and Katz modular forms*](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), Proof of Theorem 10, p.131. The odd-order square root of the determinant is unramified at 2 by Kronecker–Weber; this local character argument is used without importing the general weight/level-lowering theorem.

### Teichmüller lift and the four dyadic conductor cases

Identifier: `GL2AutomorphicRepresentationsAndTransfer:R17.6/teichmuller-conductor`. Imported canonical target; use the replacement fields in this follow-up.

For linearly dihedral r̄₀=Ind_{G_K}^{G_Q}φ of determinant one and rotation order n odd, let D be the fundamental discriminant of K and φ̃ its same-order Teichmüller lift at λ|2. Then the finite Artin lift ρ=Ind φ̃ has conductor |D| Norm(f_{φ̃})=2^νN(r̄₀). At each odd prime the conductor is unchanged on reduction. The dyadic possibilities are: (i) D odd and Norm(f) odd, ν=0; (ii) D≡5 mod8 and Norm(f)≡4 mod8, ν=2; (iii) D≡4 mod8 and Norm(f) odd, ν=2; (iv) 8|D and Norm(f) odd, ν=3. Rohrlich–Tunnell’s exact theorem uses (i), (ii) and (iv), not (iii).

**Hypotheses and conventions.**

- φ has odd finite order and φ^σ=φ⁻¹.

- D is the signed fundamental discriminant and |D| is used in the positive conductor.

- The Teichmüller lift is taken at the fixed residue embedding.

**Proof route.**

1. Import the quadratic-induction conductor formula. Teichmüller preserves the kernel of the odd-order rotation character.

2. For odd-prime inertia subgroups, compute fixed dimensions separately for rotations, a reflection, and noncyclic dihedral subgroups. In characteristic zero a reflection has ±1 eigenvalues; its reduction is a nonidentity unipotent with one-dimensional fixed space. Both noncyclic cases have no common fixed line. Repeat for ramification subgroups, not only tame inertia.

3. At 2, odd-order characters kill principal pro-2 units. Split or ramified quadratic residue field F₂ gives no unit character; inert residue field F₄ permits conductor norm 4. Combine with v₂(D)=0,2,3.

**Checks.**

- A characteristic-two reflection has trace zero but is not the identity.

- Case (iii) is present in the conductor classification and absent from the exact RT modularity theorem.

- Positive discriminant D≡3 mod8 cannot be a fundamental odd discriminant; interpret the source’s sign notation through the field splitting cases.

**Direct prerequisites.** `ArithmeticGaloisRepresentations:R01.3/quadratic-induction-conductor`; `ArithmeticGaloisRepresentations:R01.3/conductor-of-residual-semisimplification`; `ArithmeticGaloisRepresentations:R01.4/dihedral-projective-image-iff-induced`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`.

**Source.** [David E. Rohrlich; Jerrold B. Tunnell, *An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), §2, pp.306–307, cases (i)–(iv). Conductor classification and its retained dyadic cases.

**Source.** [Gabor Wiese, *Dihedral Galois representations and Katz modular forms*](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), Lemma 2, pp.125–126. Kernel-preserving odd-order lift and conductor comparison.

The dyadic lift’s level is classified before using the modularity theorem:

| Inducing field and character | ν in the lifted conductor 2^νN | RT output |
| --- | --- | --- |
| D odd, character conductor norm odd | 0 | Weight 2, exact N |
| D≡5 mod8, character conductor norm≡4 mod8 | 2 | Weight 2, exact N |
| D≡4 mod8, character conductor norm odd | 2 | Excluded from the exact theorem |
| 8 divides D, character conductor norm odd | 3 | Weight 4, exact N |

The source lists the second case with a ±5 residue notation. Because D is a fundamental odd discriminant, D≡1 mod4 already excludes the residue 3 mod8, leaving the inert class 5 mod8. The fourth case is the ν=3 case; inherited E1 records the misplaced case label in the sentence after the table.

## The exact Rohrlich–Tunnell construction

### Rohrlich–Tunnell’s weight and level lemma

Identifier: `GL2AutomorphicRepresentationsAndTransfer:R17.6/rt-technical-lemma`. Imported canonical target; use the replacement fields in this follow-up.

Let g=Σb(n)q^n be a normalized primitive cuspidal weight-one form of exact level 2^νNr and character χ with χ²=1, N odd and ν∈{0,2,3}. Let λ|2, with residual representation the given quadratic-induced Artin lift’s reduction r̄ and N=N(r̄). Here r=1 or an odd prime not dividing N; for r≠1 require b(r) modλ≠1. For ν=2 require b(n)=0 for every even n. For ν=3 require b(2) modλ≠0. Then a primitive form f of exact odd level N and trivial character gives the same residual semisimplified representation: its weight is 2 if ν=0 or 2, and 4 if ν=3. The coefficient field and prime may be extended. No general weight-one attached-representation theorem is needed when the Artin representation is supplied by induction.

**Hypotheses and conventions.**

- All Fourier coefficients used in the constructions are λ-integral; reduction is in a specified common finite field.

- The χ²=1 character reduces to the trivial character at λ|2.

- The integral trace identity is proved before reducing any expression with denominators.

**Proof route.**

1. For ν=0, square g. Its mod-2 q-expansion is Σb(n)²q^{2n}; inverse coefficient Frobenius gives the away-two eigenpacket of g at weight two. Choose a common eigenvector for the remaining commuting operators inside the nonzero away-two eigenspace, allowing a finite residue extension, then use R15.5 lifting for the full Hecke algebra; the T₂ eigenvalue is not claimed unchanged.

2. For ν=2, write m=Nr. The even-coefficient vanishing gives g|C=−g for C=(1,0;2m,1), via W_{4m}(1,−1/2;0,1)W_{4m}^{−1}; thus g² has level 2m. Choose 4a+mb=1. The three-coset trace and the determinant-four partial Atkin–Lehner matrix J=(4,1;−4mb,4a) yield h=2λ_J^{−2}Tr(g²) at level m, with integral q-coefficients and reduction Σb(n)²q^n. The specific local Atkin–Li input gives λ_J=±1 here; this is not an assertion for arbitrary nontrivial character. Apply inverse coefficient Frobenius and R15.5.

3. For ν=3, U₄(g²) is weight two of level 2m and has nonzero residual away-two packet because b(2) is a unit. Lift to a primitive weight-two g₁ with level dividing 2N after removing r. If its level is odd, square g₁. If it is 2L with L|N odd, use the determinant-two matrix J=(2,1;−2Lb,4a), 4a+Lb=1, and the three-coset trace of g₁². Twice the trace is integral with expansion Σc₁(2n)q^n+2Σc₁(n)q^n, and reduces to Σb₁(n)²q^n. Lift at weight four and level dividing N.

4. Use the source slash convention F∥_kγ=det(γ)^{k/2}(cz+d)^{−k}F(γz). Tau Ceti’s arithmetic slash has det(γ)^{k−1}; multiply by det(γ)^{1−k/2} before using these identities. The positive square root is taken for positive determinant.

5. Remove an auxiliary r by the trivial-character weight-two newform condition a_r=±1 when r divides its level exactly once: its eigenvalue is congruent to b(r)≠1. Finally full good-prime polynomials identify residual semisimplifications; classical-residual-conductor-bound and M|N force M=N.

**Checks.**

- Keep ν=3 separate: its asserted output weight is four.

- Inverse coefficient Frobenius is not the identity unless the coefficient field is F₂.

- Do not reduce 1/2 terms before the integral trace identity.

- Exact level N follows from both divisibilities, not merely from a trace construction.

**Direct prerequisites.** `AlgebraicModularFormsAndSerreWeights:R15.5/deligne-serre-eigenvalue-lifting-lemma`; `AlgebraicModularFormsAndSerreWeights:R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform`; `AlgebraicModularFormsAndSerreWeights:R15.6/residual-modularity-witness`; `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`; `GL2AutomorphicRepresentationsAndTransfer:R17.6/classical-galois-realization`; `GL2AutomorphicRepresentationsAndTransfer:R17.6/classical-residual-conductor-bound`; `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`; `tauceti:TauCetiRoadmap/ModularForms#layer-6-atkinlehner-and-fricke-operators`; `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction`; `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`.

**Source.** [David E. Rohrlich; Jerrold B. Tunnell, *An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), Technical lemma, p.302; proof pp.302–306. The three integral trace constructions, the removal of r, and the residual conductor argument, with all dyadic conditions retained.

### The real-quadratic odd-lift trick

Identifier: `GL2AutomorphicRepresentationsAndTransfer:R17.6/serre-odd-trick`. Imported canonical target; use the replacement fields in this follow-up.

For the real inducing quadratic K in RT cases (i), (ii) or (iv), there is an odd quadratic-induced Artin lift of level 2^νNr satisfying the technical lemma, with r an auxiliary odd split rational prime away from 2N and residual b(r)≠1. A quadratic character ξ_K, ramified at exactly one real place and the chosen degree-one prime 𝔯, and unramified at 2, changes the signature and reduces trivially mod2. Its induction is odd, has the required χ²=1 and preserves the stated dyadic coefficient conditions.

**Hypotheses and conventions.**

- Use a narrow ray class modulus 4f and an odd-order character φ̃.

- The auxiliary prime is chosen in the RT signature class, not the Wiese Frobenius-identity class.

**Proof route.**

1. In the narrow ray class group, split off the odd-order part and choose a class on which φ̃ is nontrivial, then combine it with the mixed-signature class. Chebotarev gives a degree-one prime 𝔯 in that class away from the forbidden primes.

2. For an odd exponent n, arrange 𝔯^n=(ρ) with mixed real signs and ρ≡1 mod4f. The extension K(√ρ)/K yields ξ_K. Its local properties follow from the ray congruence and the odd valuation at 𝔯.

3. Apply the induction conductor formula and quadratic-induction automorphy. The split r has residual trace different from one, unlike the primes used to kill a U-operator in Wiese’s argument. In ν=2 the relevant local ramification forces all even coefficients to vanish; in ν=3 the local factor makes b(2) a unit.

**Checks.**

- The sign change is invisible after reduction at 2.

- The rational auxiliary prime is split and coprime to 2N.

- Do not interchange this b(r)≠1 construction with Wiese’s trace-zero auxiliary primes.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.6/teichmuller-conductor`; `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction`; `GL2AutomorphicRepresentationsAndTransfer:R17.5/dihedral-artin`; `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Source.** [David E. Rohrlich; Jerrold B. Tunnell, *An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), §2, proof of theorem, pp.307–308. Mixed-signature quadratic twist and auxiliary prime conditions.

### Rohrlich–Tunnell characteristic-two modularity

Identifier: `GL2AutomorphicRepresentationsAndTransfer:R17.6/rohrlich-tunnell`. Imported canonical target; use the replacement fields in this follow-up.

Let r̄:G_Q→GL₂(F̄₂) be continuous absolutely irreducible with LINEAR image D_n of order 2n, n odd≥3. Let K be its quadratic inducing field, D its fundamental discriminant and N its prime-to-two Artin conductor. If D is odd or divisible by 8, r̄ is realized by a primitive cuspidal form of exact level N and trivial character, of weight two when D is odd and weight four when 8|D. The form, coefficient field, a chosen prime λ|2, lattice and residual isomorphism form the R15.6 witness. The claim does not include D≡4 mod8 or a projective-dihedral representation with a nontrivial scalar determinant.

**Hypotheses and conventions.**

- Linear dihedral image, rather than only projective dihedral image.

- The representation is supplied over a finite residue field embedded in F̄₂.

**Proof route.**

1. Apply teichmuller-conductor to separate cases (i), (ii), (iv). Correct the inherited source case label E1.

2. For imaginary K, the same-order lift is already odd; for real K use serre-odd-trick. Apply the technical lemma at the actual ν and N.

3. Package the form and all coefficient/prime/lattice choices as the existing witness. For a general scalar twist return to determinant-untwist, but no longer claim this exact level/character conclusion.

**Checks.**

- Both odd D cases, including the inert-at-two ν=2 lift, yield weight two.

- 8|D yields weight four.

- D≡4 mod8 is a non-example of the theorem’s hypotheses, not a missing subcase of its proof.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.6/teichmuller-conductor`; `GL2AutomorphicRepresentationsAndTransfer:R17.6/serre-odd-trick`; `GL2AutomorphicRepresentationsAndTransfer:R17.6/rt-technical-lemma`; `AlgebraicModularFormsAndSerreWeights:R15.6/residual-modularity-witness`; `GL2AutomorphicRepresentationsAndTransfer:R17.5/dihedral-artin`; `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`.

**Source.** [David E. Rohrlich; Jerrold B. Tunnell, *An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), Theorem and cases (i)–(iv), p.307; proof pp.307–308. Exact linear-dihedral conductor, weight and discriminant hypotheses.

### Integral trace identities that the proof must establish

Fix the source’s weight-normalized slash operator

\[
 (F\Vert_k\gamma)(z)=(\det\gamma)^{k/2}(cz+d)^{-k}F(\gamma z)
 \qquad(\det\gamma>0).
\]

The existing arithmetic slash operator uses det(γ)^{k−1}. Thus its value is multiplied by det(γ)^{1−k/2} to obtain the operator above. These scalar factors are part of the comparison; at weight four they affect the integrality argument. A determinant-two normalized Atkin–Lehner action on a trivial-character weight-two newform is an involution. A general nontrivial character does not have that property without the source’s specific local hypotheses.

For ν=2 put m=Nr and choose integers a,b with 4a+mb=1. Use

\[
 A=\begin{pmatrix}2a&b\\-m&2\end{pmatrix},\quad
 B=\begin{pmatrix}1&0\\m&1\end{pmatrix},\quad C=B^2,\quad
 W'=\begin{pmatrix}0&-1\\2m&0\end{pmatrix},\quad
 W''=\begin{pmatrix}0&1\\-m&0\end{pmatrix},\quad
 J=\begin{pmatrix}4&1\\-4mb&4a\end{pmatrix}.
\]

A,B,C are the three coset representatives lowering level 2m to m; det J=4. If g²=Σc(n)q^n, the source’s trace expression is

\[
 g^2\Vert_2 W'(A+B+C)W''
 =\sum c(2n)q^n+\tfrac12(g^2\Vert_2J)(z/2).
\]

Its specially normalized twice-trace h has integral coefficients. The local weight-one partial Atkin–Lehner relation gives g∥₁J=λ_Jg with λ_J=±1 in this case. Consequently the reduction of h is Σb(n)²q^n. Integrality is a theorem about that expression before reduction; writing a half in the residue field is invalid.

For ν=3, first lift U₄(g²) to the weight-two g₁. If its primitive level is 2L with L odd, replace m by L in A,B,C,W′,W″ and use

\[
 J=\begin{pmatrix}2&1\\-2Lb&4a\end{pmatrix},\qquad 4a+Lb=1.
\]

Here det J=2 and g₁∥₂J=±g₁. If g₁²=Σc₁(n)q^n, the weight-four twice-trace h₁ satisfies

\[
 h_1=\sum c_1(2n)q^n+2\sum c_1(n)q^n,
 \qquad \overline h_1=\sum\overline{b_1(n)}^2q^n.
\]

Apply inverse Frobenius to the coefficients, not to the q-exponents. It recovers the desired away-two eigenpacket over the actual residue field. These formulas are the integral computational acceptance contract of the technical lemma, rather than a new trace-map definition. Their source is Rohrlich–Tunnell pp.303–306.

## Broader odd lifts and the Katz boundary

### Odd characteristic-zero lifts of mod-two dihedral representations

Identifier: `GL2AutomorphicRepresentationsAndTransfer:R17.6/wiese-odd-lift`. Imported canonical target; use the replacement fields in this follow-up.

Every continuous absolutely irreducible projective-dihedral mod-2 representation of G_Q has an odd finite-image characteristic-zero quadratic-induced lift, integral over a cyclotomic coefficient ring at a specified prime above 2, whose reduction is the given representation. Without unramifiedness at 2, this assertion controls neither its conductor nor its minimal weight. If the residual representation is unramified at 2, either the same-level lift is odd, or infinitely many auxiliary split primes ℓ give odd lifts of conductor Nℓ with residual Frob_ℓ the identity (hence trace zero), where N is the odd residual conductor.

**Hypotheses and conventions.**

- The inducing character and its conjugate are distinct; the scalar character is retained.

- The cyclotomic coefficient field and prime above 2 are part of the construction.

- For the Nℓ alternative require residual unramifiedness at 2 and use the strengthened modulus 4D f σ(f).

**Proof route.**

1. Lift the inducing odd-order character by Teichmüller at the chosen prime. If the induction is even, K is real; twist the inducing lift by a quadratic character with mixed real signature, whose reduction is trivial. This proves the unrestricted existence assertion.

2. For the unramified-at-two conductor assertion, impose the ray congruence simultaneously for f and its conjugate σ(f), using inherited E6’s repair. Chebotarev then supplies split primes at which BOTH diagonal inducing characters are trivial.

3. Choose the signature-changing quadratic character ramified only at one real place and one degree-one prime above ℓ, and unramified at 2. The quadratic-induction conductor formula gives Nℓ.

**Checks.**

- Frob_ℓ identity is proved from two trivial characters, not merely from splitting in K.

- The residual identity has trace zero in characteristic two.

- No arbitrary-conductor lift is used as if it were a same-level Katz form.

**Direct prerequisites.** `ArithmeticGaloisRepresentations:R01.1/finite-galois-factorisation`; `ArithmeticGaloisRepresentations:R01.4/dihedral-projective-image-iff-induced`; `ArithmeticGaloisRepresentations:R01.3/quadratic-induction-conductor`; `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Source.** [Gabor Wiese, *Dihedral Galois representations and Katz modular forms*](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), Lemma 2, pp.125–127; Lemma 3, p.127. Unramified conductor-controlled and unrestricted odd-lift assertions are separate; E6 supplies the conjugate modulus.

### Unramified mod-two dihedral Katz weight one

Identifier: `GL2AutomorphicRepresentationsAndTransfer:R17.6/unramified-katz`. Imported canonical target; use the replacement fields in this follow-up.

For a continuous absolutely irreducible projective-dihedral r̄:G_Q→GL₂(F̄₂) unramified at 2, there exists a normalized cuspidal full-Hecke eigenform in the Katz space of weight one, level N=N(r̄) odd, and character det r̄ (with its prime-to-two Dirichlet interpretation). It has the good-prime residual characteristic polynomials of r̄. A finite coefficient-field extension is allowed. Scalar or nonsemisimple Frobenius at 2 is included. A characteristic-zero weight-one form at that same level is not asserted.

**Hypotheses and conventions.**

- Katz cusp conditions are imposed at every cusp.

- All T_q, the appropriate bad U-operators and diamonds are included in the eigenform conclusion.

- The two requested R15.2 oldform and independence/descent contracts are prerequisites.

- Level N names the Katz carrier at the residual conductor; this node asserts no separate Katz primitivity/minimality predicate.

**Proof route.**

1. Apply wiese-odd-lift. If its odd lift has conductor N, use quadratic-induction weight-one modularity and reduction. Otherwise, for infinitely many ℓ, obtain lifts at Nℓ.

2. Use Wiese Proposition 4/Corollary 5 to raise two powers and impose U_ℓ=0 at Nℓ³; the companion matrix works also with repeated roots. After reduction, coefficients at indices divisible by ℓ vanish.

3. Use the fixed finite group of the characteristic-zero monomial lifts to bound the possibilities at the finitely many primes dividing N, in a common finite residual coefficient field. The good-prime polynomials, including q=2, are fixed by r̄. Select distinct ℓ₁,ℓ₂ with matching prime coefficients. This gives agreement at primes only, not equality of all q-expansion coefficients.

4. The published comparison fails at ℓ₁²: U_{ℓ₁}g₁=0 gives a_{ℓ₁²}(g₁)=0, whereas g₂ is good at ℓ₁ with a_{ℓ₁}(g₂)=0 and determinant/character 1, hence a_{ℓ₁²}(g₂)=0²−1=1 in characteristic two. Proposition 7 pullback preserves these coefficients. Gap G3 requires a valid auxiliary-level removal argument before Proposition 7/Corollary 8 can descend an independent form to N, retaining cusps, character and the required full eigenpacket. Stabilizing both primes alone does not establish independence.

**Checks.**

- The Q(√229) class-group example gives an unramified dyadic reflection: its matrix is a nonidentity unipotent although its semisimplification is scalar.

- No hypothesis of two distinct dyadic Frobenius eigenvalues is added.

- No same-level characteristic-zero weight-one lift is substituted for Katz weight one.

- Agreement of every prime coefficient does not imply agreement at auxiliary prime powers; explicitly test the ℓ₁² discrepancy 0≠1.

- The G3 replacement must include scalar and nonsemisimple Frobenius at 2 and must not assume auxiliary-level independence from zero U-eigenvalues.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.6/wiese-odd-lift`; `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`; `AlgebraicModularFormsAndSerreWeights:R15.1/hodge-bundle-with-tate-curve-normalization`; `AlgebraicModularFormsAndSerreWeights:R15.1/cusp-ideal-section-forms`; `AlgebraicModularFormsAndSerreWeights:R15.2/q-expansion-principle-and-its-vanishing-theorem`; `AlgebraicModularFormsAndSerreWeights:R15.2/integral-hecke-operators-from-q-expansions`; `AlgebraicModularFormsAndSerreWeights:R15.3/frobenius-verschiebung-on-expansions`; `AlgebraicModularFormsAndSerreWeights:R15.2`; `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`.

**Source.** [Gabor Wiese, *Dihedral Galois representations and Katz modular forms*](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), Theorem 9 and proof, pp.130–131; Definition 6 and Proposition 7/Corollary 8, pp.129–130. Theorem 9 states the Katz conclusion, including exceptional Frobenius. Its pp.130–131 auxiliary-level proof has the failed q-expansion comparison E23/G3. Proposition 7/Corollary 8 give valid descent contracts only after independence is established.

### Characteristic-two solvable residual modularity

Identifier: `GL2AutomorphicRepresentationsAndTransfer:R17.6/qualitative-residual-modularity`. Imported canonical target; use the replacement fields in this follow-up.

Every continuous absolutely irreducible mod-2 representation of G_Q with solvable projective image has a residual modularity witness arising from a characteristic-zero cuspidal weight-one primitive form. The actual level, character, coefficient field, prime above 2, stable lattice and isomorphism after common residue extension are recorded. There is no assertion of prescribed minimal weight or level in this general existence statement.

**Hypotheses and conventions.**

- Use the R15.6 witness without defining a new modularity predicate.

- The odd lift and its weight-one modular form have matching full good-prime polynomials.

**Proof route.**

1. Apply solvable-dihedral and wiese-odd-lift to obtain a quadratic-induced odd finite-image lift.

2. Apply R17.5’s quadratic-induction automorphy and Q weight-one comparison, which retain the supplied Artin representation.

3. Choose a primitive form in the same packet and record its actual data. Compare reduction using full characteristic polynomials and R01 recognition; the already-given induced representation supplies the finite lift, avoiding a later-roadmap weight-one existence prerequisite.

**Checks.**

- Scalar determinants are permitted.

- The specific λ is part of the witness.

- Distinguish the unrestricted existence conclusion from the RT exact-level theorem.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.6/solvable-dihedral`; `GL2AutomorphicRepresentationsAndTransfer:R17.6/wiese-odd-lift`; `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction`; `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`; `AlgebraicModularFormsAndSerreWeights:R15.6/residual-modularity-witness`; `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`.

**Source.** [Gabor Wiese, *Dihedral Galois representations and Katz modular forms*](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), Lemma 3 p.127 and the weight-one modularity application in the proof of Theorem 9, p.130. Odd induced lift and its modular form; conductor control requires the extra hypotheses.

### Supplier contracts for auxiliary-level operations

These are additions to R15.2’s existing Katz/integral Hecke interfaces. The characteristic-zero oldform theory remains the existing ModularForms Layer 4. The contracts below describe comparisons on those carriers, never another modular-form definition.

**Contract 1: `AlgebraicModularFormsAndSerreWeights:R15.2`.** Add the Katz comparison of Wiese Proposition 4/Corollary 5 (pp.127–128) to the existing integral Hecke/q-expansion interface, importing the characteristic-zero oldform theorem from ModularForms Layer 4. On V_ℓ^i f=f(q^{ℓ^i}), i=0,…,r, r≥1, U_ℓ has companion matrix with first row (a_ℓ,1,0,…), second row (−δℓ^{k−1}ε(ℓ),0,1,…), subsequent superdiagonal ones, and characteristic polynomial X^{r−1}(X²−a_ℓX+δℓ^{k−1}ε(ℓ)). δ=1 if ℓ∤N and 0 otherwise. Two additional level powers give a full eigenform with U_ℓ=0 and the same away-ℓ packet, including repeated-root cases. Do not average over a group whose order is zero in the coefficient field. Include the geometric weight-one T₂ action on the prime-to-two Katz spaces at the levels used, with the q-expansion formula U+⟨2⟩V from R15.3; a formal-series formula alone does not construct the operator on these spaces.

API required by the consuming proof:

- `katz_oldforms_away_hecke`: V_ℓ^i commutes with T_n for gcd(n,ℓ)=1.

- `katz_oldforms_u_matrix`: U_ℓ has the stated companion action on the consecutive q-powers, with δ tracking ℓ|N.

- `katz_zero_u_stabilization`: At two additional ℓ-powers a common eigenvector has U_ℓ=0 and retains every away-ℓ eigenvalue.

Tests the supplier interface must pass:

- **three_oldforms**: For a_ℓ=0 and δℓ^{k−1}ε(ℓ)=1, the three-dimensional polynomial is X(X²+1); zero remains a root when X²+1 has a repeated root.

- **nilpotent_case**: When a_ℓ=0 and δ=0, U on three consecutive oldforms is a nonzero nilpotent of order three, not the zero operator.

- **missing_middle_oldform**: For r=1, the basis must include f(q^ℓ); skipping it leaves only one vector and cannot have the displayed 2×2 companion matrix.

**Contract 2: `AlgebraicModularFormsAndSerreWeights:R15.2`.** Wiese Definition 6, Proposition 7 and Corollary 8 (pp.129–130): for gcd(N,m)=1, Nm invertible in R and the indicated roots of unity in R, a Katz cusp form at Nm is independent of m iff its evaluation on (E,α_N,α_m) does not depend on α_m; equivalently it is the pullback of a unique Katz cusp form at N. The q-expansion at infinity agrees. Include base extension, identity m=1, composition for coprime auxiliary levels, preservation of cusps and away-m Hecke action; Corollary 8 gives a full eigenform at N with the same required eigenpacket using the finite commutative Hecke algebra. This is finite-level descent of the existing form carrier, not a second Katz definition. This conditional theorem does not assert independence of the forms produced in Theorem 9: that application requires G3.

API required by the consuming proof:

- `independent_auxiliary_level_iff_pullback`: Evaluation independence is equivalent to unique level-N pullback.

- `auxiliary_descent_q_expansion`: The descended form has the same q-expansion at infinity.

- `auxiliary_descent_composition`: Descent through two coprime auxiliary levels equals simultaneous descent and commutes with base extension.

Tests the supplier interface must pass:

- **identity_level**: m=1 gives identity descent with the original form.

- **pulled_back_normalized_cuspform**: A level-N normalized cusp form pulled back to Nm is independent of m and descends with a₁=1.

- **degeneracy_nonexample**: V_m f=f(q^m) for normalized f and m>1 has a₁=0, so it does not satisfy the same-q-expansion pullback assertion for f.

- **two_primes**: For distinct auxiliary primes ℓ₁,ℓ₂, a form independent of both descends to N; its q-expansion and away-ℓ₁ℓ₂ eigenvalues survive both orders.

For three consecutive oldforms f(q), f(q^ℓ), f(q^{ℓ²}), write a=a_ℓ(f), b=δℓ^{k−1}ε(ℓ). The operator matrix is

\[
 U_\ell=\begin{pmatrix}a&1&0\\-b&0&1\\0&0&0\end{pmatrix},\qquad
 \det(XI-U_\ell)=X(X^2-aX+b).
\]

Even when the quadratic factor has a double root in characteristic two, this polynomial has a zero root. Simultaneous eigenspaces are selected through the commutative finite Hecke algebra; diagonalizability is not required. The printed oldform list’s omitted middle entry is recorded as E20. The map’s sum over consecutive powers and the displayed matrix determine the correction.

## The weight-at-least-two witness

### Transfer to the weight-at-least-two residual witness

Identifier: `GL2AutomorphicRepresentationsAndTransfer:R17.6/weight-two-witness`. Imported canonical target; use the replacement fields in this follow-up.

The preceding residual witness can be replaced by one of weight at least two, with its actual new weight, primitive level M, character, coefficient field and chosen prime over 2 recorded. One unconditional characteristic-zero route multiplies the integral weight-one form by E₄≡1 mod2, obtains a weight-five residual eigenpacket, and applies R15.5 to produce a characteristic-zero primitive form of weight five at level dividing the input level. For a Katz weight-one form, multiplication by the p=2 Hasse invariant A of weight one gives weight two with the same q-expansion. Deligne–Serre lifting at weight two is allowed only when Af belongs to the reduction of the required finite-free integral cusp-form module; otherwise use a justified Hasse power/auxiliary level for which cusp-sheaf H¹ vanishes and record the resulting weight and level. The historical node id is not an unconditional weight-two assertion.

**Hypotheses and conventions.**

- Use the existing R15.3 Hasse invariant and R15.5 eigenvalue-lifting and R15.6 witness.

- A Katz section is not automatically a reduction of a characteristic-zero vector.

- All commuting Hecke operators used to select a normalized primitive form are included; eigenvalues, not a prescribed vector, lift.

- The initial weight-changed section is only guaranteed to be an eigenvector away from 2. Simultaneous diagonalizability is not assumed; finite commutative-algebra eigenvector selection precedes full-algebra lifting.

**Proof route.**

1. For the characteristic-zero witness, multiply by E₄ with constant term one and positive nonconstant coefficients divisible by 2. At every odd q the weight-one and weight-five determinant factors agree mod2.

2. The weight change preserves the common away-two Hecke eigensystem. On the nonzero away-two eigenspace in the finite-dimensional reduction of the actual finite-free integral module, choose a common eigenvector for the remaining commuting T₂/bad U/diamond operators after a finite residue extension. Its eigenvalue at 2 need not equal that of the weight-one form. Apply DS to this full commuting algebra, extend the coefficient prime, then normalize and select a primitive constituent of level dividing the input level. Use classical-galois-realization and full good-prime polynomial recognition away from 2.

3. For the Katz route, A has q-expansion one and weight p−1=1. State the exact cusp-sheaf base-change hypothesis before DS. If it is not available at Γ₁(N), pass to full auxiliary odd level n≥3, choose a high enough Hasse power to make the cusp-sheaf H¹ vanish, then use the supplied integral module and DS. The R15.2 full-level theorem is not a Γ₁(N) weight-two theorem.

4. Return the existing witness at the output form’s actual primitive level and chosen extended prime.

**Checks.**

- E₄ shifts weight one to five, not two.

- A at p=2 shifts one to two, but does not by itself prove classical liftability.

- The coefficient prime and any auxiliary level are recorded.

- No general minimal-weight level lowering is imported through this interface.

- Multiplication by E₄ or A need not preserve the T₂ eigenvalue; matching the residual representation uses the odd good primes.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.6/qualitative-residual-modularity`; `GL2AutomorphicRepresentationsAndTransfer:R17.6/unramified-katz`; `AlgebraicModularFormsAndSerreWeights:R15.3/hasse-invariant-as-a-form-of-weight-p-minus-one`; `AlgebraicModularFormsAndSerreWeights:R15.5/deligne-serre-eigenvalue-lifting-lemma`; `AlgebraicModularFormsAndSerreWeights:R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform`; `AlgebraicModularFormsAndSerreWeights:R15.6/residual-modularity-witness`; `AlgebraicModularFormsAndSerreWeights:R15.2/base-change-for-spaces-of-forms-and-the-weight-one-boundary`; `AlgebraicModularFormsAndSerreWeights:R15.2`; `GL2AutomorphicRepresentationsAndTransfer:R17.6/classical-galois-realization`; `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`.

**Source.** [Pierre Deligne; Jean-Pierre Serre, *Formes modulaires de poids 1*](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), §§6.8–6.12 and Lemma 6.11, pp.522–523. Integral weight change and eigenvalue lifting; finite-free module and dominating coefficient prime are explicit.

**Source.** [Gabor Wiese, *Modular Forms of Weight One Over Finite Fields*](https://math.uni.lu/wiese/thesis/Thesis.pdf), Chapter I introduction, p.2 footnote 3. The Γ₁(N) classicality qualification N≥5, not an all-level shortcut.

**Remaining Γ₁(N) supplier contract.** For the exact weight-two Katz route at Γ₁(N), N odd≥5, provide the cusp-sheaf reduction/base-change map and an explicit H¹-vanishing or equivalent surjectivity criterion guaranteeing Af belongs to the reduction of a finite-free integral Hecke module. The existing base-change node is for full level n≥3; it cannot alone be cited as Γ₁(N) weight-two classicality. At smaller levels use the stack/auxiliary-level descent conditions; absent this input the higher-weight/auxiliary-level route is the asserted witness.

The two routes have distinct acceptance checks. Starting with an integral characteristic-zero weight-one form, E₄ has expansion 1+240Σσ₃(n)q^n, so its reduction is 1 at 2; the product has weight five. Starting with a Katz form, A has weight one and expansion one at p=2, so Af has weight two. Only the first route automatically starts in an integral characteristic-zero module. For the second, the required surjectivity of reduction of the **cusp** sheaf must be proved. Merely knowing a Katz section exists, or an analogous statement for all sections, is insufficient.

For sufficiently high weight on a suitable fine full-level compactification, the Hodge bundle has positive degree and the cusp-sheaf H¹ vanishing supplies such a module; record the chosen auxiliary level and Hasse exponent. Eigenvalues then lift over a dominating DVR with a finite fraction-field extension. Do not claim the original mod-2 eigenvector itself lifts. A normalized primitive constituent can have smaller level than the initial integral form, so the witness records its output level M. These operations do not manufacture a general same-level minimal-weight theorem.

## Restriction, compatible base change and descent

### Residual irreducibility under disjoint base change

Identifier: `GL2AutomorphicRepresentationsAndTransfer:R17.6/disjoint-irreducibility`. Imported canonical target; use the replacement fields in this follow-up.

Let F be a number field and r̄:G_F→GL₂(k) continuous absolutely irreducible with finite projective image. Let M/F be the finite Galois extension cut out by its projective kernel. If a finite extension E/F is linearly disjoint from M, then r̄|_{G_E} has the same projective image and is absolutely irreducible. Disjointness from the extension cut out by the full linear kernel is a sufficient stronger condition. E/F need not be Galois for this restriction statement.

**Hypotheses and conventions.**

- The coefficient field is embedded in an algebraic closure when testing absolute irreducibility.

- Disjointness is from the actual projective-kernel field, not an arbitrary auxiliary extension.

**Proof route.**

1. Use finite Galois factorization and linear disjointness to make G_E→Gal(M/F) surjective.

2. A line is invariant under a matrix exactly when it is invariant under its projective class; the same projective image has precisely the same invariant lines.

3. For a stronger full-kernel field, surjectivity gives equal linear image and the existing Representation.IsIrreducible formulation applies directly.

**Checks.**

- A quadratic inducing field contained in E is a failure example: restriction splits.

- Solvability alone is not a disjointness hypothesis.

- The statement is unchanged by scalar twists.

**Direct prerequisites.** `ArithmeticGaloisRepresentations:R01.1/finite-galois-factorisation`; `ArithmeticGaloisRepresentations:R01.4/dihedral-projective-image-iff-induced`; `mathlib:Representation.IsIrreducible`.

**Source.** [Gabor Wiese, *Dihedral Galois representations and Katz modular forms*](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), §2, pp.125–126, finite kernel and quadratic induction. Finite-image restriction argument used with the projective kernel; the linear-disjointness conclusion is derived here.

### The bad-dihedral quadratic restriction condition

Identifier: `GL2AutomorphicRepresentationsAndTransfer:R17.6/quadratic-restriction`. Imported canonical target; use the replacement fields in this follow-up.

Let r=Ind_{G_K}^{G_F}θ be absolutely irreducible over an algebraically closed field, with K/F quadratic and θ≠θ^σ. For a finite E/F, r|_{G_E} is absolutely irreducible exactly when K is not contained in E and θ|_{G_{EK}}≠θ^σ|_{G_{EK}}. If K⊂E it splits into the two restricted characters. If K⊄E, restriction is the index-two induction from EK/E; its two eigenlines are exchanged when the restricted characters differ. This criterion holds in characteristic two without Maschke.

**Hypotheses and conventions.**

- All fields lie in a fixed separable closure; σ denotes the nontrivial quadratic conjugation.

- Characters are compared on the actual subgroup G_{EK}.

**Proof route.**

1. Use the existing Mackey decomposition over arbitrary coefficient rings, followed by the direct index-two character argument from R01.4.

2. When the characters differ, a stable line for their diagonal action must be one of the two eigenlines, and an element outside the index-two subgroup swaps those lines.

3. When they agree, over an algebraically closed field extend the common character using a root of the square of a coset representative; Frobenius reciprocity gives a one-dimensional quotient and reducibility. In characteristic two that square root still exists, even though the induction need not split semisimply.

4. The pinned characteristic-zero Mackey irreducibility theorem is a checked boundary, not a valid premise for this characteristic-two proof.

**Checks.**

- Containing K forces reducibility.

- Distinct characters before restriction can become equal after restriction.

- An equal-character index-two induction in characteristic two can be nonsplit and remains reducible.

**Direct prerequisites.** `ArithmeticGaloisRepresentations:R01.4/dihedral-projective-image-iff-induced`; `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction`; `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-3-the-mackey-decomposition-formula`.

**Source.** [Gabor Wiese, *Dihedral Galois representations and Katz modular forms*](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), Lemma 2 and proof pp.125–127. Quadratic-induced matrix description; the restriction criterion is an application of the generic induction owner.

### Base change of a supplied compatible system

Identifier: `GL2AutomorphicRepresentationsAndTransfer:R17.6/compatible-base-change`. Imported canonical target; use the replacement fields in this follow-up.

Let E/F be finite solvable Galois with a prime-cyclic tower. Supply a rank-two compatible family ρ_λ over F and a cuspidal GL₂ representation π whose arithmetic-normalized good local polynomials match that family. At each cyclic step take the R17.4 base change and impose its exact no-self-twist criterion for cuspidality. Then the iterated base change matches ρ_λ|_{G_E}: at a good v and w|v of residue degree f, the roots α_v,β_v become α_v^f,β_v^f, and the determinant becomes (α_vβ_v)^f. Residual absolute irreducibility is preserved when E is disjoint from the projective-kernel field, or when the explicit quadratic criterion holds at all steps. Existence of the family and of its coefficient field is supplied data, not proved by automorphic base change.

**Hypotheses and conventions.**

- Exclude a finite set containing the ramification of the family and π; record whether E/F is ramified locally.

- Use arithmetic Frobenius and the normalized local dictionary consistently.

- Cuspidality is checked at every cyclic step, not inferred from solvability of E/F.

**Proof route.**

1. Apply R17.4 prime-cyclic transfer successively; use its tower-independence and all-place local compatibility.

2. The local norm sends a uniformizer at w to valuation f at v, so an unramified parameter has roots raised to f even at a ramified local extension. q_w=q_v^f.

3. The restricted compatible family has those same full good polynomials. Apply the existing recognition theorem when its semisimplicity hypotheses hold, and separately use the residual restriction criteria.

**Checks.**

- For α=2, β=3 and f=2, the new trace is 13 and determinant 36, not trace 25.

- Self-twist may make a base change noncuspidal.

- No arbitrary nonsolvable extension is covered.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change`; `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-compatibility`; `GL2AutomorphicRepresentationsAndTransfer:R17.4/cuspidality`; `GL2AutomorphicRepresentationsAndTransfer:R17.6/disjoint-irreducibility`; `GL2AutomorphicRepresentationsAndTransfer:R17.6/quadratic-restriction`; `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`.

**Source.** [James Arthur; Laurent Clozel, *Simple Algebras, Base Change, and the Advanced Theory of the Trace Formula*](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter 3 Definition 1.2, p.199; Theorem 4.2(a),(b), p.202; Theorem 5.1, p.212. Root-wise local base change and prime-cyclic cuspidality, imported from R17.4.

### Automorphic descent with a consistent compatible-system twist

Identifier: `GL2AutomorphicRepresentationsAndTransfer:R17.6/compatible-descent`. Imported canonical target; use the replacement fields in this follow-up.

For cyclic E/F of prime degree ℓ and a cuspidal Π invariant under Gal(E/F), the cuspidal descents are exactly ℓ distinct forms π⊗η^i (0≤i<ℓ), where η cuts out E/F. Supply their rank-two attached compatible families and a rank-two compatible family ρ_λ over F whose restrictions are absolutely irreducible and match Π. Then the descent matching one specified member ρ_λ₀ is determined by full good-prime polynomials; the matching exponent i is independent of λ once the compared coefficient fields/embeddings are fixed and the common compatible polynomials agree. Determinants alone do not choose it when ℓ=2. Iterate only with this data and criterion at each prime-cyclic step.

**Hypotheses and conventions.**

- Π is cuspidal and Galois invariant.

- The restricted Galois members are absolutely irreducible; the families of the descents are supplied.

- A fixed common coefficient field and embeddings permit equality of good polynomials to be transported between λ.

**Proof route.**

1. Import R17.4 cyclic descent and its fiber theorem. It has exactly ℓ distinct descents; invariance alone does not specify one of them.

2. Schur’s lemma makes any two extensions of the same absolutely irreducible restricted representation differ by a character of Gal(E/F), yielding η^i at a chosen λ.

3. Good-prime polynomial equality in the common coefficient field transports the same i to every λ; use full-polynomial recognition with its semisimplicity hypotheses. Strong multiplicity one yields uniqueness of the matching cuspidal descent.

4. Record each intermediate descent and twist in a solvable tower; no canonical choice is inferred merely from the existence of an extension.

**Checks.**

- A quadratic twist in the kernel has the same determinant as π’s representation; determinant alone is a failure test.

- If restriction is reducible, the Schur argument and uniqueness criterion do not apply.

- At each stage the selected i is the same across the compatible system.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent`; `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent-fibers`; `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-descent`; `GL2AutomorphicRepresentationsAndTransfer:R16.4/strong-multiplicity-one`; `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`; `mathlib:Representation.IsIrreducible.algebraMap_intertwiningMap_bijective_of_isAlgClosed`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

**Source.** [James Arthur; Laurent Clozel, *Simple Algebras, Base Change, and the Advanced Theory of the Trace Formula*](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter 3 Theorem 3.1, p.201; Theorem 4.2(d), pp.202–203. Exact prime-cyclic descent fiber; the compatible-family selection is conditional on supplied families.

### Transfer interface for potential modularity

Identifier: `GL2AutomorphicRepresentationsAndTransfer:R17.6/potential-modularity-interface`. Imported canonical target; use the replacement fields in this follow-up.

Supply a finite solvable Galois E/F with a prime-cyclic tower, its prescribed local behavior, a rank-two compatible family ρ_λ over F, and a cuspidal Π over E matching its restriction. Require absolute irreducibility of every intermediate restriction (for example via projective-kernel disjointness) and attached compatible families for the intermediate descents. Then the compatible-descent criterion selects matching cuspidal descents step by step to F, with the stated local base-change compatibility and one coefficient-compatible twist at each step. Galois invariance of Π follows from the extending family and strong multiplicity one. No potential modularity existence theorem, coefficient-independent attachment theorem, or nonnormal cubic descent is asserted.

**Hypotheses and conventions.**

- The extension is solvable Galois, not merely some extension over which modularity is known.

- Prescribed local behavior and linear disjointness are explicit inputs supplied by the extension-construction owner.

- Matching means full normalized good local polynomials, with all relevant fields and embeddings recorded.

**Proof route.**

1. Use the extending family to compare Π and its Galois conjugates at almost all places; strong multiplicity one gives invariance.

2. Apply compatible-descent along the chosen tower, maintaining cuspidality and absolute irreducibility. Choose the character ambiguity using the common compatible polynomials.

3. Apply compatible-base-change for local comparisons, retaining any local types supplied by the all-place R17.4 dictionary. The extension-construction theorem and modularity-lifting theorem remain external consumers, not newly planned here.

**Checks.**

- A nonnormal cubic extension is outside this interface.

- A solvable extension containing K may violate residual irreducibility.

- Potential modularity does not automatically imply modularity over F without these descent inputs.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.4/prescribed-local-base-change`; `GL2AutomorphicRepresentationsAndTransfer:R17.6/disjoint-irreducibility`; `GL2AutomorphicRepresentationsAndTransfer:R17.6/compatible-base-change`; `GL2AutomorphicRepresentationsAndTransfer:R17.6/compatible-descent`; `GL2AutomorphicRepresentationsAndTransfer:R16.4/strong-multiplicity-one`.

**Source.** [James Arthur; Laurent Clozel, *Simple Algebras, Base Change, and the Advanced Theory of the Trace Formula*](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter 3 Theorem 4.2(d), pp.202–203 and Theorem 5.1, p.212. Cyclic invariant descent and all-place transfer, used through the existing R17.4 nodes.

### Worked restriction and transfer checks

For a residual dihedral representation with rotation eigenvalues t,t⁻¹, t of odd order greater than one, the rotation has two distinct eigenlines. A reflection exchanges them. On a quadratic extension containing the inducing field, only the diagonal characters remain and irreducibility fails. On an extension disjoint from the projective-kernel field, the full projective group still acts and no line can be invariant. In characteristic two the reflection can be represented by

\[
 \begin{pmatrix}1&1\\0&1\end{pmatrix};
\]

it squares to the identity but is not the identity. A semisimplification of its cyclic-subgroup action is scalar, which does not make the global dihedral representation reducible.

If a good parameter has roots 2 and 3 and the local extension has residue degree two, base change gives roots 4 and 9, trace 13 and determinant 36. Squaring the original trace would instead give 25. At a ramified local extension, the residue degree, rather than the total local degree, determines the uniformizer norm’s valuation and the unramified root exponent.

For quadratic descent, the two candidates π and π⊗η have attached determinants differing by η²=1, so their determinants are identical. The full good-prime polynomials can distinguish them when the restricted family is absolutely irreducible. Matching only one determinant does not choose a descent. Matching one λ fixes a twist across λ only after the compatible polynomials have been put into a common coefficient field with fixed embeddings.

## Baseline and current-upstream audit

The pinned baseline is Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The following twelve declaration statements were read in the pinned sources; the checker resolves their names through the provided declaration index. A boundary citation is not a proof input where its hypotheses fail.

- `mathlib:Matrix.GeneralLinearGroup` — GL(n,R) is the existing unit group of square matrices; the Satake computation uses GL(Fin 2,K), not a new matrix group.

- `mathlib:Matrix.GeneralLinearGroup.det` — Multiplicative determinant GL(n,R) → R units, for a commutative ring.

- `mathlib:Matrix.GeneralLinearGroup.map` — Coefficient ring maps induce multiplicative maps of existing general linear groups.

- `mathlib:Matrix.ProjGenLinGroup` — PGL(n,R) is the existing quotient of GL(n,R) by its center, with its group instance; no replacement projective matrix group.

- `mathlib:Matrix.ProjGenLinGroup.mk` — The canonical group homomorphism GL(n,R) → PGL(n,R), used to state arithmetic lifting on the existing carrier.

- `tauceti:TauCeti.Matrix.GeneralLinearGroup.not_isSolvable_fin_two` — GL₂(F) is not solvable if F contains a nonzero a with a²≠1; it does not prove an Artin modularity theorem.

- `tauceti:TauCeti.simple_indFDRep_ofLinearCharacter_iff` — Finite-group normal-subgroup induction criterion over an algebraically closed field OF CHARACTERISTIC ZERO. Read as a boundary check only; it does not prove the characteristic-two index-two criterion.

- `mathlib:Matrix.GeneralLinearGroup.scalar` — The scalar-units homomorphism into the matrix general linear group; used for determinant normalization.

- `mathlib:Matrix.GeneralLinearGroup.det_scalar` — For scalar u in GL(n,R), determinant equals u raised to Fintype.card n; rank two gives u².

- `mathlib:Representation.IsIrreducible` — Irreducibility is IsSimpleOrder of the invariant-subrepresentation lattice; equal operator images have the same invariant subspaces.

- `mathlib:Representation.IsIrreducible.algebraMap_intertwiningMap_bijective_of_isAlgClosed` — Schur: for an irreducible finite-dimensional representation over an algebraically closed field, scalar endomorphisms exhaust intertwining endomorphisms, in any characteristic.

- `mathlib:Matrix.charpoly_diagonal` — Characteristic polynomial of a diagonal matrix is the product of X minus its diagonal entries; the power-of-roots example is an application, not a new matrix theorem.

The pinned Mackey irreducibility theorem explicitly assumes characteristic zero. Mackey decomposition itself is imported in arbitrary characteristic, but the index-two irreducibility proof above uses the direct eigenline argument. Generic finite-group Schur works over an algebraically closed field in arbitrary characteristic and supplies the extension-character argument where irreducibility is assumed.

Current TauCetiRoadmap main `0d144d0` and Tau Ceti main `a91d3aa` were separately screened before planning. The ModularForms and InductionRestriction README documents were read for their full relevant convention and ownership contracts. All nine post-snapshot roadmap families, including LocalGaloisGroups and the eight OperatorTheory suggested files, were checked for overlapping carriers and targets. Existing local groups, class field theory, induction and arithmetic modular-form operations remain imports. Current `NumberTheory/ModularForms/GaloisProd` is the product of translates of a function used in the modular norm, not a modular form’s attached Galois representation. The audit does not treat current post-pin declarations as pinned proof inputs.

## Suggested statements and checks

The suggested file is 139 lines and elaborates at the two pins with only proof-placeholder warnings. It states seven end results over actual matrix groups, unit characters, existing representations and FDRep induction, together with ten substantive examples. It introduces no replacement Galois, Katz, geometric cohomology or compatible-family carriers.

| Reader target | Suggested declaration or reason for omission |
| --- | --- |
| Determinant normalization | square_root_character, determinant_untwist, scalar_det_one, involution_det_one, kernel_eq_projective_kernel |
| Disjoint irreducibility | irreducible_restriction_of_range, using the concrete equal-image conclusion of the Galois restriction argument |
| Quadratic restriction | simple_quadratic_induction over the existing FDRep induction carrier, with index exactly two and characteristic two explicit |
| Base-change polynomial check | Matrix diagonal powers, trace 13, determinant 36 and failure of trace-power substitution |
| Auxiliary oldforms | The 3×3 companion characteristic polynomial and nilpotency-index-three examples |
| Dyadic reflection | Its square is one and it is not one over ZMod 2 |
| Classical eigencomponent and attached representation | Actual geometric f-component and its Galois/coefficient interfaces are reader targets; G1 retains their proof |
| Classical conductor bound | Geometric local comparison and its full monodromy carrier are reader targets; G2 retains their proof |
| RT, Katz and weight transition | Actual integral/Katz modules, their Hecke algebras and residual witnesses are supplied by the named owners; no stand-in predicates are used |
| Compatible-family/descent interfaces | Actual attached-family and automorphic carriers are needed; conclusions remain conditional reader targets |

The seven algebraic signatures are consequences or applications of the existing general owners, not seven additional planned nodes. In particular, the matrix power and companion formulas are verification examples rather than a new matrix-polynomial API.

## Open proof inputs and ownership handoff

**G1: Higher-weight geometric realization proof.** The R14.3 nodes supply coefficient systems, parabolic images and Hecke comparison; their proved rank-two and Tate comparison is weight two. For k≥3, the primitive f-component must be compared with cuspidal Betti/étale realizations, including finite full-level GL₂ descent, and the geometric good-prime relation must give both roots on its rank-two factor. Scholl §4.2.0–§4.2.2 and Deligne §3.12, Proposition 3.18 and Theorem 4.9 give the checked source contract and proof route. This packet does not treat the supplied weight-two statement as that higher-weight proof. The three new targets are owned here, with the generic geometry retained in R14.3.

**G2: Odd-prime classical geometric local comparison proof.** The source contract at odd q is Carayol §0.7–§0.8 and §§11.1–11.4: principal series, special with nonzero monodromy, and ordinary cuspidal quadratic induction. Establish the Q-case comparison from the lower geometric cohomology and semistable Tate inputs, with the exact dual/reciprocity normalization. Equality only after semisimplifying the special representation does not prove its conductor. The R16.3 conductor-preserving LLC theorem is a separate supplier contract, not the geometric comparison itself. The extraordinary dyadic cubic proof remains out of scope.

**G3: Auxiliary-level removal for the unramified Katz route.** Replace the failed q-expansion equality in Wiese Theorem 9, pp.130–131 (E23), by an argument that removes the two distinct auxiliary primes from the real-quadratic odd lifts. The prime coefficients agree but their ℓ₁² coefficients are 0 and 1, so Proposition 7 cannot identify the pullbacks. Prove the required independence or give a different valid level-removal construction, preserving cusp conditions at every cusp, character det r̄ and the full required good-prime polynomials/Hecke packet, including T₂ and scalar or nonsemisimple dyadic Frobenius. Zero-U stabilization at both primes repairs coefficient agreement only; it does not prove independence. The R15.2 descent request remains a conditional supplier theorem, not a solution of this application gap.

The three classical input targets move the necessary notions down from R19 under the binding upstream tier rule. The later owner imports the rank-two classical realization and odd residual conductor bound, retaining its additional compatible-system, p-adic Hodge and extraordinary dyadic targets. Its broad weight-k and classical conductor nodes must be reconciled at assembly. R15.6’s residual-modularity-witness and modularity-formulations-and-determinant nodes still carry explicit R19 attachment dependencies. Their owner must make the witness constructor consume a supplied representation and lattice, and repoint the weight≥2 attachment applications here and the already-given weight-one induced Artin application to R17.5. This reconciliation must avoid a definition-level R15.6↔R17.6 cycle; the present direct effective-node graph is not a claim of closed transitive dependencies. No other packet is edited by this job.

The ten request records are the three open R15.2 contracts and seven already-supplied upstream-layer import contracts. The open requests are the oldform/Katz comparison (including geometric weight-one T₂ with its U+⟨2⟩V q-expansion formula), conditional auxiliary-level independence/descent, and the qualified Γ₁(N) cusp-sheaf base-change input. The conditional descent contract does not resolve G3. The exact Casselman and conductor/normalization nodes replace the earlier broad R16 stage requests.

A follow-up completes G1 and G2 at their actual geometric carriers and resolves G3 with a valid auxiliary-level removal argument, obtains the R15.2 contracts, applies these same-id refinements in assembly and then rechecks the combined dependency graph. It must not infer the omitted theorems from the compact suggested file or restart already-owned definitions. The stage is not closed.

## Source ledger and findings

All source statements and proof routes above are in the roadmap’s own words. No source passages or per-section source summary are included. The packet records SHA-256 hashes, versions and the exact sections actually read; the table below gives the stable public sources and the locators used here.

| Source | Version and target locators |
| --- | --- |

| [David E. Rohrlich; Jerrold B. Tunnell, *An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf) | Pacific Journal of Mathematics 181, special issue (1997), pp.299–309; published MSP PDF; §1 pp.299–306, including all three cases of the technical lemma; §2 pp.307–309: conductor cases, theorem and signature-changing argument |

| [Gabor Wiese, *Dihedral Galois representations and Katz modular forms*](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf) | Documenta Mathematica 9 (2004), pp.123–133; published EMIS PDF; Introduction pp.123–125 and Lemmas 2–3 pp.125–127; Proposition 4 and Corollary 5 pp.127–128; Definition 6, Proposition 7 and Corollary 8 pp.129–130; Theorem 9 and proof pp.130–131; Theorem 10 and its determinant-character argument p.131; Lemma 11 p.132 checked for the scope boundary |

| [Gabor Wiese, *Modular Forms of Weight One Over Finite Fields*](https://math.uni.lu/wiese/thesis/Thesis.pdf) | Leiden PhD thesis (2005), author PDF; Chapter I only used; Chapter I introduction pp.1–3, footnotes 1 and 3; Chapter I §1.3, Proposition 1.3.1 pp.5–6; comparison of the skipped oldform index; Chapter I §1.4, proof of Theorem 1.4.1 p.9, for the auxiliary-level comparison |

| [Pierre Deligne; Jean-Pierre Serre, *Formes modulaires de poids 1*](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) | Annales scientifiques de l’École Normale Supérieure (4) 7 (1974), pp.507–530; NUMDAM published scan; Introduction p.507 (status of the higher-weight input); §6 pp.520–523, Theorems 6.1 and 6.7, §§6.8–6.12 and Lemmas 6.11 and 6.13 |

| [A. J. Scholl, *Motives for modular forms*](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf.pdf) | Inventiones Mathematicae 100 (1990), pp.419–430; author preprint, internally numbered pp.1–10; §1.0.0, §§1.2.0–1.2.6, author pp.1–3; §4.0–§4.2.3, author pp.8–9: Hecke projection and good-prime comparison |

| [Pierre Deligne, *Formes modulaires et représentations ℓ-adiques*](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf) | Séminaire Bourbaki 1968/69, exposé 355, 1971 publication pp.139–172; NUMDAM scan; §3.12 p.155 and Proposition 3.18 p.158; §4.5–§4.9, pp.163–167: coefficient traces, geometric/arithmetic Frobenius and congruence relation |

| [Henri Carayol, *Sur les représentations ℓ-adiques associées aux formes modulaires de Hilbert*](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) | Annales scientifiques de l’École Normale Supérieure (4) 19 (1986), pp.409–468; NUMDAM scan; §§0.1–0.11 pp.409–412, Theorems A and B and normalization; §§11.1–11.4 pp.449–451: principal series, ordinary cuspidal and special cases; §12.3 pp.458–459 checked to exclude the extraordinary cubic comparison |

| [Henri Darmon; Fred Diamond; Richard Taylor, *Fermat’s Last Theorem*](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) | Author PDF, revision 9 September 2007; printed internal page numbers; §1.7 pp.45–46, Lemma 1.48 and Theorem 1.50; §3.1 pp.84–87, Theorem 3.1 and residual representations |

| [James Arthur; Laurent Clozel, *Simple Algebras, Base Change, and the Advanced Theory of the Trace Formula*](https://www.claymath.org/library/cw/arthur/pdf/30.pdf) | Annals of Mathematics Studies 120 (1989), Clay scan; Chapter 3 §1, Definitions 1.1–1.2 pp.199–200; Chapter 3 Theorem 3.1 p.201 and Theorem 4.2 pp.202–203; Chapter 3 Theorem 5.1 pp.212–213: strong transfer normalization |

Wiese’s [2005 thesis errata](https://math.uni.lu/wiese/thesis/Errata.pdf) were checked alongside the thesis footnotes. Scholl’s [author correction note](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf_corr.html) warns of misprints and a misstated Proposition 2.0.2; that proposition is not used here. His detailed replacement Chapter 7 and the final journal version were not collated. The higher-weight geometric proof is therefore left explicitly in G1, rather than asserting a proof through an uncorrected motive construction.

Inherited findings remain registered once in the canonical packet: E1 corrects RT’s fourth dyadic case label; E3 concerns D₂ in Wiese’s odd-characteristic convention; E6 adds the conjugate character modulus to the auxiliary-prime argument; E7 qualifies Γ₁(N) classicality by N≥5. Their earlier independent verdicts are not replaced by self-review.

**E20 (misprint).** Published Documenta PDF, Proposition 4, p.127 (PDF page 5), oldform list immediately before the companion matrix; compared with thesis Proposition 1.3.1, pp.5–6. Paraphrase: the list begins with f(q) and then f(q^{ℓ²}), omitting the term indexed by i=1, while the displayed defining map uses every index from 0 to r. Use the consecutive list f(q), f(q^ℓ), …, f(q^{ℓ^r}), with r+1 entries. For r=1 the defining map has two input copies, but the printed list would lack its second vector. The first two columns of the displayed U_ℓ matrix act on f(q) and f(q^ℓ); the q-expansion coefficient recurrence directly verifies this. The mathematical map and matrix are unchanged. Not corrected in the versions checked. It remains in thesis Proposition 1.3.1; the author’s 31 August 2005 thesis errata do not list this index. It changes no stated result.

**E21 (misprint).** Author PDF, §4.2.2 and §4.2.3, p.9; compare Theorem 1.2.4 p.2 and §1.4.2 p.4. Paraphrase: the proof points to parts (i) and (ii) of 1.4.2 when establishing the newform Frobenius and crystalline assertions. The references are to Theorem 1.2.4(i) and 1.2.4(ii). Theorem 1.2.4 has exactly those two newform assertions. Section 1.4.2 instead concerns an analogous absolute-Hodge cohomology sequence, so it cannot be the intended theorem. No mathematical claim changes. The author correction note acknowledges confusing misprints in general but does not enumerate this reference. The finding is restricted to the author version read. It changes no stated result.

**E22 (misprint).** Author PDF, Theorem 1.2.4, p.2, coefficient-field sentence; compare §1.2.3 and §4.2.0. Paraphrase: the theorem introduces the coefficient field L from the Fourier coefficients, then gives the motive coefficients in an undefined field E. Use the introduced field L as the coefficient field. The λ-adic realization in the theorem uses primes of L; §4.2.0 constructs the Hecke component after tensoring with L. There is no separate E introduced for that statement. The author correction note acknowledges misprints without enumerating this letter. This is a finding about the author PDF, not a claim about the final journal version. It changes no stated result.

**E23 (proof error, confirmed).** Published Documenta PDF, proof of Theorem 9, pp.130–131, comparison after Proposition 7 pullback; also thesis Chapter I §1.4, proof of Theorem 1.4.1, p.9. The auxiliary forms g₁ at Nℓ₁³ and g₂ at Nℓ₂³ are treated as having identical q-expansions because their coefficients at primes agree. For distinct auxiliary primes, both normalized forms have a₁=1 and a_{ℓ₁}=0. The zero U_{ℓ₁} eigenvalue on g₁ forces a_{ℓ₁²}(g₁)=0. The good-prime weight-one recurrence on g₂ gives a_{ℓ₁²}(g₂)=a_{ℓ₁}(g₂)²−ε(ℓ₁)=1 in characteristic two, since r̄(Frob_{ℓ₁})=Id has determinant ε(ℓ₁)=1. Proposition 7 pullback preserves q-expansions, so the images cannot coincide. That identity is false. Supply an alternative auxiliary-level removal argument (G3) before invoking the conditional independence/descent theorem. This finding does not refute the stated Theorem 9. Not corrected in the published PDF or the thesis passage checked; no correction of this comparison was found in the author publication list or the 31 August 2005 thesis errata.

The manager-added Newton–Thorne, Dospinescu–Le Bras, Calegari–Geraghty, Colmez–Dospinescu–Nizioł, Atobe–Kondo–Yasuda, BCGP and Pan source assignments in the issue belong to R16.2–R16.4, R17.1, R17.3 or R17.5. This stage imports their owners where needed and does not move their unrelated targets into R17.6. Wiese’s general ramified weight/level-lowering Theorem 10, full motivic categories and Carayol’s extraordinary dyadic cubic comparison are outside the accepted scope.
