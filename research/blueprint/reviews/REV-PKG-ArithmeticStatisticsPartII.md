# Independent review: ArithmeticStatisticsPartII

**Accepted with corrections.** Issue #10374, job `REV-PKG-ArithmeticStatisticsPartII`; Codex, session `codex-swUr5i`, 18 October 2026. I did not author the package or its earlier fixing review. This review checks the package as a mathematical specification; its theorem signatures still have `sorry` proofs.

I read the complete package, its original ST.1 material, the preceding split/fix reports, the reviewed library audit, and the supplier boundaries. The upstream style comparisons included JacobianChallenge and Multiquadratic, with Suggested files from JacobianChallenge and Completed/EffectiveBounds. The final README has 86 anchored target blocks and 250 anchored Check bullets, in addition to the supporting descent and multiplicity specifications. No target or existing Check was removed in this review.

## Corrections made here

1. The quartic stabilizer proof used trace zero for every self-equivalence. The identity matrix over Q has trace two. The corrected argument applies the trace-zero representative only to a nonidentity class and handles the identity separately. A README Check and a Lean example compare I₂ with diag(1,−1). The bilinear-factor/stabilizer proof references now point to Cremona–Fisher §5, Theorem 12, Remark 1 and the ensuing factorization, pp.9–10, rather than §6.
2. Integral quintic realization previously left an unnamed obligation between associativity and the rational tensor required by Lemma 14. The README now states `quinticComplexRealization` and `quinticRationalRealization`, specifying the scalar-first normalized basis, preservation of every nonconstant coefficient, and no nonzero-discriminant restriction. The rational statement is used before denominator clearing. HCL IV §10, p.84 explicitly leaves its nonétale rational case analysis unwritten; that case analysis is now an identified supporting target, with a local-Artinian decomposition route. Checks include Q[t]/(t⁵), the square-zero algebra, and the split algebra. This is a theorem to construct, rather than a claim that a complex realization automatically descends to Q.
3. The current generic quintic resolvent supplier is now identified by the four declarations `quinticF20Invariant`, `quinticF20Spec`, `card_renameOrbit_quinticF20Invariant` and `resolventSextic` in `TauCeti.FieldTheory.GaloisGroups.Resolvent.Quintic.Basic`. The boundary distinguishes the separation hypothesis and the integral sextic order/lattice, whose discriminant has the factor 16. No existing generic resolvent construction is assigned again.
4. The acceptance record now uses this queue job's exact reviewer id, `independent-review-REV-PKG-ArithmeticStatisticsPartII`. The previous `~adv` id was rejected by intake; the present verdict follows this fresh review, rather than merely changing that string.

## Public-source checks

There were no locators marked unverified. I sampled 15 of the 86 target anchors without replacement using Python's `random.Random(10374)` and read the cited passages in the public PDFs. All 15 locators support the stated result, with the package's declared normalization changes. The extra source checks for the corrections above were separate from this sample. Page numbers below are printed page numbers.

| Sampled target | Source and locator read | Result |
| --- | --- | --- |
| Covariant syzygy | Cremona–Fisher, §1, p.2 | Integral polynomial identity and covariant convention agree. |
| Reducibility versus zero divisors | BST, Proposition 11 and proof, pp.5–6 | Field/domain criterion agrees; zero form is treated separately. |
| Based sextic resolvent | HCL IV, Definitions 10–11, §9, pp.82–83 | The resolvent map and both ring structures are retained. |
| Primitive vector completion | CFS, Lemma 3.13, pp.14–15 | Primitive coordinates are required; determinant correction fixes the chosen column. |
| Integral pencil orbits | BGW, Theorems 16–17 and Remark 18, pp.7–8 | Oriented triples, endomorphism order and central quotient agree. |
| Quartic ring parametrization | HCL III, Theorem 1, p.1330; Proposition 13, p.1345 | Resolvent data and quotient bases are part of the correspondence. |
| Integral soluble pencils | BGW, Theorem 15, p.5; Proposition 34, pp.26–28 | Leading-coefficient scaling and divisibility assumptions remain. |
| Quartic of a point | Cremona–Fisher, §6, p.10; BS, Theorem 3.2, p.23 | The point at infinity and affine normalization agree. |
| Quintic minimal model | HCL IV, Lemma 16, Theorem 17, Corollaries 18–19, pp.88–89 | Maximality and nonzero discriminant are essential. |
| Cubic invariant construction | Cremona–Fisher, §2, Lemma 1/Proposition 2, pp.2–3; Fisher, §2, pp.2–3 | Unit squareclass and cubic-algebra conventions agree after T=−3φ. |
| Pencil existence | BGW, Theorems 24–25, pp.14–16 | The generalized Picard torsor and common obstruction are required. |
| Integral quintic realization | HCL IV, Theorem 12, Lemmas 13–15, §§10–11, pp.83–88 | Multiplier reduction is sourced; the rational precursor is now explicit. |
| Small cubic overrings | BST, Lemma 13 and proof, pp.6–7 | The two divided-lattice shapes and their congruences agree. |
| Comparison root gives equivalence | Cremona–Fisher, Lemma 10 and proof, pp.6–7 | The proof avoids division by a possibly zero p₁. |
| Auxiliary quartic root | Cremona–Fisher, Lemma 9, p.6 | Nonzero sextic seminvariants and the chosen square root are required. |

The versions accessed on 18 October 2026 were [Cremona–Fisher's public PDF](https://www.dpmms.cam.ac.uk/~taf1000/papers/quarticequiv.pdf), [HCL III's published PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v159-n3-p08.pdf), [HCL IV's published PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v167-n1-p02.pdf), [BGW v2](https://arxiv.org/pdf/1310.7692v2), [BST v3](https://arxiv.org/pdf/1005.0672v3), [CFS v1](https://arxiv.org/pdf/0908.1741v1), [BS v3](https://arxiv.org/pdf/1006.1002v3), and [Fisher v1](https://arxiv.org/pdf/2208.14977v1). No restricted book was needed, and no source passage was copied into the package or this report.

Downloaded-PDF SHA-256 values (the links and access date above identify the sources):

| Source | SHA-256 |
| --- | --- |
| cf | `22df2eb97dbf5ec3bde0177ce154e5a2f7f1b9ec9743fac425f9c417604cfcce` |
| hcl3 | `70c2d5bbedbd7e5e9e5d7d57001b93779d760cd6f2c0798c831e5f1f31d90f4b` |
| hcl4 | `9673d33b4e76d305fed02219962ee962ed9481ce134c649c3168f75bade46a26` |
| bgw | `8833a226eea99eab7e48b90de7d747fa535eafe032d5c62fd50812d38ad4c4f2` |
| bst | `d45b16cdb6b34655634f4305416ad68083d6e6e5674907aefc85a30ac8937f74` |
| cfs | `29248b806da3b4aacefecf8a4744905ed041afd27f13efc222435dee00a18126` |
| bs | `7670970aca5df135af4ab4da926d3b2e3acc937dd5a6c918f802552c528712cf` |
| fisher | `48a8502ffef7db9ca68866d56af96e10fec4f187840a2c07353abb833454a948` |

## Adversarial mathematics pass

The table covers every anchored target, including its definition, API, hypotheses and conventions. “Retained” means that the tried instances agree with the stated scope; it does not assert a formal proof. The identifiers are anchors in the [package README](../packages/ArithmeticStatisticsPartII/README.md). Symbolic reasoning was used for the small examples; the exhaustive finite checks are described after the table.

| README anchor | Instances and mathematical check | Review disposition |
| --- | --- | --- |
| `quotient-by-scalars-is-free` | Rank one gives zero quotient; in (Z/4)³, (1,1,1) is primitive; PID torsion-freeness uses integrality of scalar fractions. | Retained PID/local scope, rather than arbitrary-base freeness. |
| `index-form-of-a-based-cubic-ring` | Split Z³ gives xy²−x²y; doubling both nonconstant basis vectors scales the form by 2. | Determinant inverse and row-vector convention agree. |
| `normal-bases-of-a-cubic-ring` | In Z[∛2], translate the two basis vectors by 1 and 2, then recover shifts −1,−2; square-zero example also normalizes. | Retained unique shifts and multiplication signs. |
| `delone-faddeev-parametrization-of-cubic-rings` | Split form, x³, and zero form distinguish étale, truncated-polynomial and square-zero rings. | Degenerate forms remain in the ring dictionary. |
| `automorphisms-of-cubic-rings-are-stabilizers` | Split ring has S₃, while a non-Galois cubic field has trivial automorphism group. | Retained stabilizer correspondence. |
| `reducible-forms-and-zero-divisors` | y(x²+y²) gives nonzero factors with product zero; x³−2y³ gives a domain; zero form is excluded from the irreducibility test. | Field and integral criteria agree after clearing denominators. |
| `nondegenerate-forms-and-etale-cubic-algebras` | Split algebra has discriminant 1 in every characteristic; K[t]/t³ has discriminant zero. | Retained separable-algebra criterion. |
| `davenport-heilbronn-sets` | x³+2y³ at 3, x³+y³ at 3, and zero distinguish the two congruence obstructions. | Three distinct discriminating cases retained. |
| `nonmaximal-cubic-rings-have-small-overrings` | The translated x³+y³ has leading coefficient 0 and next coefficient divisible by 3; the two Smith shapes have indices p and p². | Scalar translations must preserve the divided lattice. |
| `davenport-heilbronn-maximality-criterion` | The pure cubic example is maximal at 2 and 3; x³+y³ has a proper index-three overring. | Small primes are included. |
| `index-p-subrings-of-a-cubic-ring` | Split Z³ has three projective roots and three coordinate-congruence subrings. | Retained projective-root direction. |
| `index-p-overrings-of-a-cubic-ring` | The repeated root of x³+y³ modulo 3 lifts modulo 9 and supplies the unique index-three overring. | Multiplicity and lift condition both remain. |
| `pairs-of-ternary-quadratic-forms` | Veronese first form has det4=1; proportional pairs have zero discriminant; over F₂, xy+xz+yz has det4=1 but singular polar matrix. | Integral coefficient polynomial, rather than division by 2, is essential. |
| `quartic-ring-and-cubic-resolvent` | Split order has content 1; Z+2Z⁴ has content 2; square-zero quartic rejects the spurious split cubic via the index-form condition. | Retained quadratic map, orientation and minus sign. |
| `quartic-ring-of-a-pair` | Zero tensor has square-zero augmentation; the specified Veronese pair checks discriminant and a structure coefficient. | All-discriminant integral formulas retained. |
| `bhargava-parametrization-of-quartic-rings` | Split order and dependent pairs exercise both generic and degenerate loci. | Resolvent data and quotient bases cannot be forgotten. |
| `existence-and-number-of-cubic-resolvents` | Primitive maximal order gives one; content two gives σ(2)=3. | Finite-content restriction retained. |
| `maximality-of-quartic-rings-at-p` | All coefficients divisible by p force nonmaximality; p²∤Δ excludes a proper p-overorder by the index-square formula. | Retained all congruence cases. |
| `splitting-types-of-pairs-of-ternary-quadratic-forms` | Four distinct rational intersection points give the split algebra; a double line tests nonreduced cases. | Ramified types remain separate from étale splitting. |
| `quadruples-of-quinary-alternating-forms` | Two disjoint unit entries give one unit sub-Pfaffian; scaling by 2 gives 4; in F₂, skew symmetry alone admits a forbidden diagonal. | Zero-diagonal alternating convention retained. |
| `bhargava-parametrization-of-quintic-rings` | Split and maximal orders test existence and uniqueness; zero tensor is allowed in existence. | Uniqueness remains a maximal-order assertion. |
| `maximality-of-quintic-rings-at-p` | Index-square obstruction when p²∤Δ works also for p=2,3. | The source's full four-index criterion is retained. |
| `pgl2-orbits-and-stabilizers-of-binary-quartic-forms` | Scalars act trivially; diag(2,1) gives weights (4,2,1,1/2,1/4); negation changes nonzero J. | Proper action and fixed-invariant domain agree. |
| `soluble-binary-quartic-forms` | Negative definite real quartic, a linear-factor quartic, rootless reducible quartic and the Lind example distinguish all predicates. | Rational points, roots and reducibility remain distinct. |
| `covariants-of-a-binary-quartic` | x³y gives (g₄,g₆)=(3x⁴,x⁶); g₄(1,1)=48 for x⁴−y⁴. | Signs and degrees agree. |
| `syzygy-of-binary-quartic-covariants` | Direct polynomial expansion for three quartics, including a leading-zero one. | All coefficients satisfy the specified identity. |
| `cubic-invariant-of-a-binary-quartic` | Computed both fixed-degree resultants for three forms; linear-factor form gives unit class. | Factors 81, 1 and resolvent factor 729 independently confirmed. |
| `cubic-invariant-is-an-orbit-invariant` | Proper diagonal substitution changes the representative by a square; scalar action is trivial. | Retained squareclass, rather than equality of representatives. |
| `linear-factor-forms` | x³y−xy³ has I=3,J=0 and neutral invariant; the finite F₅ classes give the same neutral orbit. | Retained characteristic exclusions. |
| `auxiliary-quartic-root-from-equal-cubic-invariants` | Equal forms give a comparison root; vanishing r is outside the denominator argument. | Both nonvanishing hypotheses retained. |
| `linear-factor-of-the-comparison-quartic-gives-equivalence` | Equal forms recover identity; branch p₁=0 is handled without dividing by it. | a₁=0 and a₁≠0 branches remain valid. |
| `cubic-invariant-determines-the-orbit` | diag(2,1) example has unchanged I,J and unit invariant; g and −g with J≠0 lie in different cubic-algebra comparisons. | Fixed pair (I,J) remains mandatory. |
| `quartic-of-a-point` | Infinity gives a linear factor; (0,0) gives x⁴+y⁴/12 on the specified curve; all F₅ points were also tested. | Monic affine normalization retained. |
| `cubic-invariant-of-the-quartic-of-a-point` | Identity maps to 1; root point uses the nonzero cofactor correction; the split example gives signs (−,−,+). | Zero cannot represent a unit squareclass. |
| `binary-quartic-parametrization-of-e-mod-2e` | Real component counts differ by a factor 2 from torsion counts; every nonsingular F₅ form is soluble and the point map matches doubling cosets. | Real and finite-field cases remain separate. |
| `bilinear-factor-criterion-for-proper-equivalence` | 518,400 F₅ matrix tests compare divisibility with the stated proper transformation; self-form over Q(i) has four factors. | Matrix direction confirmed; proof locator corrected to §5. |
| `stabilizer-of-a-binary-quartic-is-two-torsion` | Identity has trace 2; diag(1,−1) has trace 0 and square I; all F₅ stabilizer orders match two-torsion. | Corrected nonidentity restriction; added README/Lean control. |
| `image-of-the-cubic-invariant` | Unit class has an isotropic conic; 28+7φ has norm 98²; m=2 has isotropic conic but nonsquare norm. | Conic condition alone cannot bypass square norm. |
| `locally-soluble-quartics-and-the-two-selmer-group` | Neutral linear-factor form stays neutral at every place; locally soluble Lind form need not be globally soluble. | Kummer image and Selmer subgroup remain distinct. |
| `primitive-vectors-extend-to-special-linear-matrices` | The displayed projective vector has gcd 1; 2e₁ cannot be a unimodular column. | PID and unit-ideal hypotheses retained. |
| `ternary-cubic-forms-and-their-invariants` | Weierstrass cubic gives c₄=48; zero and xyz both have Δ=0 but different invariants. | Universal integral polynomials retain meaning at 2 and 3. |
| `invariance-of-ternary-cubic-invariants` | SL₃ substitution fixes c₄,c₆; a diagonal determinant tracks weights 4,6. | No division by 1728 is used to define the invariants. |
| `projection-of-a-plane-cubic-from-a-rational-point` | Weierstrass projection is (0,4,0,4A,4B); A=−7,B=10 gives I=336,J=−17280. | Base change and leading-zero convention retained. |
| `cubic-invariant-of-the-projected-quartic` | P=(−3,12) on the split cubic gives the same three squareclasses as Kummer evaluation. | Retained comparison with the explicit elliptic map. |
| `local-integral-representatives-of-soluble-quartics` | The 2-adic example has invariants (0,3456), including the powers of 2. | Integral representatives use the stated scaled invariants. |
| `integrality-from-local-integrality` | diag(1/3,1) repairs nothing at 3 despite being invertible at 2; Z[1/p] matrices isolate the bad prime. | CRT approximation requires control at the other primes. |
| `integral-representatives-of-locally-soluble-quartics` | The y²=x³−2 example retains (0,3456) globally. | Existence does not assert integral-orbit uniqueness. |
| `binary-quartic-parametrization-of-two-selmer` | y²=x³−x has four classes; omission of the 2⁴,2⁶ scales is not justified. | Integral representatives are quotiented by the rational group. |
| `comparison-with-the-cohomological-two-selmer-group` | The stated 571a1 example separates the zero Kummer image from three nonzero Sha classes. | Exact sequence and local conic comparison remain suppliers. |
| `embedding-into-pairs-of-ternary-quadratic-forms` | x³y gives resolvent x³; unipotent substitution on y⁴ gives x₁² coefficient 1. | Correct representation order is retained. |
| `special-orthogonal-group-of-the-veronese-form` | −I₂ lies in the scalar kernel; coordinate swap preserves the Veronese form with the determinant twist. | Arithmetic specialization uses the generic group supplier. |
| `orbit-bijection-for-the-embedding` | x³y and x³y+xy³ stay inequivalent after embedding. | Retained fixed-first-form orbit scope. |
| `fibres-of-the-embedding-are-uniformly-bounded` | f and −f separate when J≠0; the discriminant-49 example yields bound 18. | The corrected factor 2 is retained. |
| `refinement-quartic-minors` | Standard two rows give +1, swapping gives −1, dependent rows give 0. | Lean formula and determinant covariance match. |
| `refinement-integral-minor-fibres` | Primitive minors give one class; gcd 2 gives three; zero minors have no asserted finite divisor sum. | Full-rank/nonzero-minors domain retained. |
| `binary-density-formulas` | Exhaustion gives 384/1024 at 2 and 42768/59049 at 3 for quartics; degree-two/three maximality factors differ. | Exceptional degrees and squarefree/maximal distinction confirmed. |
| `refinement-quintic-multiplication` | A=0 gives square-zero augmentation with unit e₀; specified sparse tensor has a nonzero coefficient; scaling has weight 5/10. | Integral polynomial construction is valid on the degenerate locus too. |
| `refinement-sextic-multiplication` | Zero tensor and unit e₀ checked; Disc R=1 requires Disc S=4096. | The sextic lattice is not the split order of discriminant 1. |
| `refinement-based-sextic-resolvent` | A=0 works; keeping R fixed while changing S's discriminant fails. | Both multiplication tables and φ are required. |
| `refinement-nondegenerate-resolvent-comparison` | Rank-four/rank-five trace-dual annihilators have the correct source/target; Δ=0 prevents division by 16Δ. | Nondegenerate hypothesis retained. |
| `refinement-integral-quintic-realization` | Q[t]/t⁵ is normalized and nonétale; A=0 realizes the square-zero algebra but cannot realize Q⁵. | Added both field-realization targets and their use before Lemma 14. |
| `refinement-quintic-minimal-model` | Maximal order permits uniqueness; a nonmaximal order is outside that assertion; small primes cannot be omitted. | Full rational group and fixed quotient basis remain specified. |
| `refinement-monogenized-resolvent` | t and t+1 generate Z[t]/t³ with the same translated marking; t² does not generate. | Marking is stronger data than ordinary monogenicity. |
| `refinement-wood-ring-interpretation` | First-form det4 values have opposite signs; cyclic permutation plus first-form negation repairs the pair; zero form remains included. | Existing explicit pair adapter retained. |
| `refinement-common-isotropic` | Zero pencil, positive definite real pencil, mixed F₂ pairing, n=r=0 and r>n distinguish the predicate. | Bilinear isotropy is used over every field; torsor results exclude characteristic 2. |
| `refinement-oriented-ideal-triples` | Monic unit triple works; zero lattice fails; rank two is rejected before a negative exponent could truncate. | Degree, full rank and orientation restrictions retained. |
| `refinement-integral-pencil-orbits` | Noninvertible ideals in an étale algebra are allowed; a quotient group scheme has additional integral points. | Endomorphism order and Picard/unit extensions retained. |
| `refinement-oriented-norm-pairs` | Both unit orientations satisfy the equation; split cubic has a norm-minus-one square root; wrong algebra degree is rejected. | Orientation is retained until its actual equivalence is proved. |
| `refinement-field-pencil-stabilizers` | Split even degree gives 2^(n−2) geometric stabilizer; forgetting the sign can halve the orbit count. | Group-scheme and oriented-orbit conventions agree. |
| `refinement-pencil-existence` | Split infinity gives Gₘ; negative real leading coefficient gives the norm-one circle; Jₘ has one more dimension than J. | Full generalized-Picard obstruction, not smooth J¹ alone, retained. |
| `refinement-pencil-fano-torsor` | Common vector dimension is g; Picard point without an odd divisor cannot supply solubility. | Smooth and augmented torsors remain distinguished. |
| `refinement-locally-soluble-pencil-orbits` | Changing the chosen soluble base orbit translates the Selmer identification. | Torsor identification is not claimed canonical without a choice. |
| `refinement-integral-soluble-pencils` | 16∣fᵢ implies 16^i∣f₀^(i−1)fᵢ; no unscaled integral existence is inferred. | Exact scaling and existence-only scope retained. |
| `quartic-monicization` | (2,3,5,7,11) maps to (1,3,10,28,88); a=0 loses the twist comparison; negative definite form can become soluble. | Algebraic formula includes a=0; geometric comparison excludes it. |
| `marked-quartic-selmer-embedding` | Fixed first matrix has determinant 1; variable scaling preserves the curve; distinct source classes require rational-orbit weights integrally. | Even-degree adapter remains separate from odd-degree pencils. |
| `refinement-weak-discriminant-divisibility` | x³ is strongly divisible; x³−x²y+p²y³ is weak for odd p; modulo 4 the discriminant congruence rules out weakness. | p=2 exclusion is substantive. |
| `refinement-q-hyperdeterminant` | g=1 and the displayed g=2 staircase both give −1; zero blocks give 0. | Descending coefficient order and parity sign retained. |
| `refinement-q-discriminant-divisibility` | g=1 allows arbitrary lower blocks; Q=0 is a polynomial specialization. | Divisibility is an identity, not division by Q. |
| `refinement-marked-q` | Two integral adapted completions give signed −1 and +1 but absolute value 1; rational determinant-one completion changes absolute value to 2. | Integral lattice and total determinant restriction retained. |
| `refinement-weak-lift-odd` | m=1 has absolute Q=1; an arbitrary target tensor need not lie in the image. | Injection is not treated as surjection. |
| `refinement-one-matrix-slice` | Signed antidiagonal matrix makes the invariant monic in every degree; reducible forms do not inherit the irreducible orbit theorem. | Generic orthogonal theory remains a supplier. |
| `refinement-even-weak-lift` | Degree rises from n to n+1; different m retain disjoint images on the irreducible domain. | No same-degree lift is asserted. |
| `refinement-genus-one-stabilizer-schemes` | Degree 4/5 scalar pair acts trivially; generic stabilizer orders are 2d² versus d²; degree 2 retains the extra μ₂ in the larger group. | Differential-preserving, central-quotient and full stabilizers remain distinct. |
| `refinement-quartic-invariant-index` | Primitive order gives its unique resolvent; scaling the quartic quotient by n scales the invariant quotient by n². | Relative index and nonzero-discriminant scope retained. |
| `refinement-quartic-etale-resolvent` | Split quartic gives Q³; cyclic quartic gives Q times a quadratic algebra. | Integral comparison consumes the existing generic resolvent. |
| `refinement-good-prime-integral-pencils` | Odd p and p²∤Δ are used for uniqueness; dropping the latter is outside the claim. | Qₚ/Zₚ point-stabilizer statement is not generalized to all DVRs. |

The unanchored supporting specifications were also checked:

| Supporting target or convention | Instances and conclusion |
| --- | --- |
| `quinticComplexRealization`, `quinticRationalRealization` | Q[t]/t⁵ and Q⊕Q⁴ force coverage beyond the étale locus; preserving the coefficient table is stronger than preserving dimension or discriminant. These explicit theorem contracts are the new closure repair. |
| `generalizedPicardComparison` | Split/nonsplit quadratic infinity algebras give split/nonsplit one-dimensional tori; dimension g+1 prevents replacement by the smooth Jacobian. |
| Degree 3/4/5 covering and Selmer APIs | y²=x³−x gives I=3,J=0 from c₄=48,c₆=0; central scalar pairs satisfy the determinant constraints. The real nonidentity class of order two also has a linear-factor degree-four resolvent, so that test cannot detect only identity. |
| `Cubic.normalizedDisc` and API | (1,0,0,1) gives D=1 and ordinary Δ=−27; (0,1,0,1) gives affine degree two and discriminant −12, requiring the leading-coefficient condition. Characteristics 2,3 and scaling by 2 agree with the integral formula. |
| Three-isogeny mirror and integral triples | Constant kernel uses mirror −3, not the split kernel algebra; D=−3 has split mirror. Neutral cubic has D(f)=4Dhat; split norm pair (2,1) fails the cube-norm condition. Nonprincipal ideals cannot be replaced by generators. |
| Integral multiplicity and soluble mass | One or two equal-stabilizer integral classes give m=1 or 2. One class with stabilizer ratio 3 gives m=3 and mass 1/3. The weights sum to the rational-orbit mass on a nonempty fibre. |
| Shared signs, ranks and denominators | Empty determinant is 1; zero pencil in positive rank has invariant zero; positive prime powers exclude q=1; trace-dual and geometric divisions retain Δ≠0 and characteristic restrictions. |

### Independent finite calculations

I ran exact integer/rational polynomial calculations, independent of the sorry proofs. Covariants were built from their coefficient formulas; homogeneous resultants used fixed-degree Sylvester matrices and integer Bareiss elimination. This matters when the quartic's leading coefficient vanishes.

| Quartic coefficients | (I,J,Δ) | Res(g,g₄) | Res(g,g₆) |
| --- | --- | --- | --- |
| (1,0,0,0,−1) | (−12,0,−256) | 5308416 | −16777216 |
| (2,3,5,7,11) | (226,3296,1307744) | 138525743932416 | 2236496425594486784 |
| (0,1,0,−1,0) | (3,0,4) | 1296 | 64 |

All satisfy the syzygy and the resultant factors 81Δ² and Δ³. Enumerating the five coefficients modulo 4 and modulo 9 gives respectively 384 of 1024 and 42768 of 59049 tuples with p²∤Δ, agreeing with the two quartic local-density Checks.

For F₅, I enumerated all 3125 coefficient tuples, retained the 2400 with Δ≠0, and formed PGL₂ orbits using its 120 scalar-normalized invertible matrices with action det(M)⁻²g((x,y)M). There are 20 invariant pairs and 36 orbits: eight pairs have one orbit, ten have two, and two have four. Every retained form has a point; each orbit's stabilizer order and the number of orbits for its pair equal #E(F₅)[2]. Direct elliptic group addition partitions all points into doubling cosets; the point-quartic construction gives exactly those orbit classes, including infinity.

Finally, for each first-form orbit representative, every second form with the same invariants, and all 120 matrices, I tested divisibility of g₁h₂−g₂h₁ by the bilinear form. Substitution of the second row by the first row times adj(M) tests its vanishing on that bilinear graph. This is equivalent to divisibility for an invertible bilinear matrix. All 518400 tests agree with g₂=det(M)⁻²g₁∘M. Equivariance extends the first-form representative check to every first form. These are finite convention checks and supply the exceptional F₅ argument described in the README; they are not proofs of the general theorems.

## Closure, ownership and duplication

The current roadmaps were checked at `0d144d044dacebca17b654695b6f1ad58f159b27`, including all nine roadmap families newer than the atlas snapshot and the Completed directory. The current Tau Ceti library was checked at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches used mathematical objects and hypotheses, including binary quartics, cubic/quartic/quintic orders, sextic resolvents, monogenic markings, trace duals, alternating/Pfaffian tensors, common isotropic subspaces, norm-one torsors, Picard and theta-group data, rather than only the proposed names. Both checkouts were read only.

The generic quartic resolvent and discriminant theorem were already excluded by the preceding review. I confirmed that boundary against the actual current modules. The generic quintic resolvent also already exists; this review supplies its exact names and separates it from the integral lattice theorem. No further target was removed as a duplicate in this review. Current monogenicity of maximal number-field orders, finite quadratic-module isotropy, moment determinacy, generic orthogonal groups and finite-dimensional singular decomposition remain explicit suppliers. IntegralLattices' isotropic finite modules/overlattices do not give the symmetric-pencil Fano scheme or its integral orbit dictionary.

The original ArithmeticStatistics ST.1 has 57 target nodes, and its refinement has 33. Of these 90 nodes, 83 are in this part; the other seven are explicitly linked Part I suppliers: binary-cubic action, cubic-ring carrier, ring of a cubic form, its discriminant, symmetric pencil, fixed-degree binary discriminant, and binary-form order. The three additional anchored package targets are binary densities, quartic monicization and the marked quartic Selmer embedding. All remain present. The named new quintic support theorems complete the chain underneath these targets without altering packets.

I walked the dependency chains to pinned declarations, earlier local targets, the Part I links, current Tau Ceti roadmaps, or lower-tier/bundle suppliers in CaraianiNewton. AnalyticNumberTheory is consumed in the stated direction and takes no arithmetic-statistics input. Its general projective cubic-algebra dictionary supplies the based specialization here; the retained index form and normal-basis material fixes the actual sign/basis adapter. SF.3 supplies unpointed Picard degree torsors and the Brauer obstruction, while the local generalized-Picard comparison retains the particular modulus. There are no `UPSTREAM:` or FoundationsAndLibraryIntegration placeholders, higher-part suppliers, or newly introduced upward citations. No supplier ownership moves are needed.

At the pins I read the actual statements used for PID freeness, Smith normal form, bilinear determinant/nondegeneracy and field trace forms. Field trace nondegeneracy is used after étale decomposition, rather than assumed for an arbitrary algebra. The explicit elliptic `μ`, its kernel/localization and Selmer membership/cardinality declarations, and `card_ker_nsmul_two` have the required field and characteristic hypotheses. No affine discriminant identity is used through a degree drop.

## API, Lean and validation

Every definition block has its named API and at least three distinct discriminating Checks; duplicate bullets were not counted as independent tests. Zero, degenerate, characteristic-two and wrong-rank controls survive the split. The newly named quintic realization assertions are theorem targets on README-only carriers, not sorry-defined objects. All README definitions occur either as light definitions or as named families in the closing Lean comment.

Ten signatures were compared directly with the README: `monicize`, `quarticMinors`, `quarticMinors_mul`, `pencilPoly`, `pencilInvariant`, `pencilInvariant_congr`, `pencilInvariant_scalar`, `commonIsotropic`, `normalizedDisc`, and `ordinaryDisc_eq`. Ring versus field scope, matrix sizes, row/congruence directions, finite-rank condition, coefficient order, and the nonzero leading coefficient agree. The file has 177 lines, real bodies for all data definitions, no hypothetical carrier construction and no chain of theory development.

The final `lean-check` exited 0 at Mathlib `082e2d3` / Tau Ceti `f790474`, with 35 warnings, all `declaration uses sorry`. The README's added stabilizer control is among those examples. Intake checks, packet validation, local-link checks and whitespace checks are recorded in the handoff after final validation.

There is no outstanding review defect or unsourced assertion identified in this pass. The supporting theorem case analyses remain substantive formalization work, explicitly stated as targets. Acceptance means the corrected package is ready for its upstream draft-PR stage.
