# Global function fields, reciprocity and automorphic foundations, Part II: root stacks and ramified geometric class field theory

This roadmap begins with FunctionFieldArithmetic’s arithmetic reciprocity and constructs its geometric rank-one refinement. Its principal output is a multiplicative local system on every degree of the Picard stack with square-root ramification. For a geometrically connected double cover, the Frobenius trace of that sheaf is the quadratic idele class character. The construction also gives the local systems on symmetric powers and on the entire hat section spaces needed by Yun–Zhang’s ramified comparison. Their matrix stacks, relative trace formula and cycle-intersection identities remain with ShtukaSpecialCyclesAndHigherSiegelWeil.

The reusable foundation is the canonical finite and infinite root-stack API. Its owner is **FunctionFieldArithmeticPartII:key/root-stacks**. The definition is general in the exponent and in the line bundle with section; it is not restricted to square roots over finite fields. Bresciani’s roots of a DVR and the infinite reduced gerbe use the same construction. General quotient stacks, representability, atlases, ordinary Picard geometry and the scheme/function-field dictionary are imported from their existing owners. The roadmap does not create a second line-bundle category, Picard functor, adele ring or arithmetic reciprocity map.

The issue contains a second paper brief: Abdurrahman–Venkatesh’s central values of symplectic L-functions modulo squares. Its everywhere-unramified higher-rank systems, Hurwitz-stack argument and Hilbert–Siegel slicing do not consume the rank-one character-sheaf endpoint here. The packet therefore proposes the sibling SymplecticLFunctionsModSquares, with every one of its 38 routed items assigned below. This follows the issue’s instruction to plan the first independent direction and record a restructuring for the other. Neither route loses its parent or its existing suppliers.

## Conventions and source boundary

For RS.0–RS.2, n is a positive integer and the base is a scheme, or a stack when explicitly stated. Finite roots have effective fpqc descent and their usual fppf description, including characteristic dividing n. Infinite roots and torsors use the fpqc topology. A line bundle means the pinned native invertible sheaf; its full category includes arbitrary module maps, so root-object arrows must be isomorphisms. Tensor powers have fixed parentheses and coherent reassociation maps. A root of (L,s) is a triple (M,t,φ) with φ:Mⁿ≅L and φ(tⁿ)=s, including zero sections. The construction is relative over the actual base stack. Its n=1 specialization over BG is BG itself, not its coarse point.

The affine chart is [Spec A[t]/(tⁿ−f)/μ_n]. Its full closed fibre over f=0 retains tⁿ=0. Its reduced fibre is the classifying gerbe Bμ_n. These must remain distinct under nonreduced base changes. The diagonalizable action is evaluated on every A-algebra; geometric-point roots of unity alone lose μ_p in characteristic p. The section-invertible locus gives the original base even if p divides n. A characteristic-dividing exponent obstructs the DM condition at a genuine branch point, not on an empty divisor. For a stack base the projection is a relative coarse morphism; an absolute coarse algebraic space is a different construction.

The infinite root stack is an fpqc stack formed as a two-limit of the finite stacks along divisibility transitions. A compatible family includes transition isomorphisms and cocycles. It is not the inverse limit of their isomorphism-class sets, and it is not asserted to be an algebraic stack of finite type. The reduced DVR fibre is canonically a banded gerbe, while an equivalence with BẐ(1) requires a neutralization. Uniformizer-independent construction and choice of origin in its Kummer classes are separate statements.

For GC.0–GC.6, let k=F_q have characteristic p≠2, X/k be smooth, projective and geometrically connected, R⊂X be a reduced finite divisor, U=X−R, g the curve genus, and ρ=deg R. Over the algebraic closure, ρ counts geometric branch points. It is not the number of closed points over k. Use Q̄ℓ coefficients with ℓ≠p and geometric Frobenius. Rational averaging is available even if ℓ divides d!: finite torsion coefficients would require different invariant and cohomology assertions.

A root-Picard object is (L,K_R,ι:K_R²≅L|_R), without a section. The root-section version adds α_R but still no global section of L. The hat symmetric space additionally carries a global section a with ι(α_R²)=a|_R. Its effective open requires a to be nonzero on every geometric fibre. A nonzero element of a global section group over a general base is not enough. Negative Picard degrees are included; effective symmetric powers use d≥0. No rational point of degree one is chosen to identify Pic^d with Pic^0.

The character-sheaf input is any rank-one local system on the root curve, equivalently a tame system on U with inertia of order dividing two. Its global character need not be quadratic: an unramified character of order three is a decisive test. Quadratic monodromy appears only after specializing to a geometrically connected double cover. The symmetric local system L_d is unshifted and lies in ordinary cohomological degree zero; L_d[d] is the perverse normalization. Koszul signs occur when taking symmetric invariants of degree-one cohomology, not in the symmetry of degree-zero tensor lines.

The inherited reading receipt records every proof in Yun–Zhang’s Appendix A, pp. 514–526, for the first route. The published page images at 515, 519, 521 and 523 were checked against the extracted formulas. AGV Appendix B supplies the finite root universal property; Talpo–Vistoli §3 supplies divisibility transitions and infinite roots; the single-divisor specialization avoids constructing the general logarithmic theory. Bresciani’s version of record supplies the finite/infinite DVR interfaces. The AV primary reading establishes the separation and proof architecture, but is not a claimed proof reading of all §§3–6 and Appendix D. Source URLs, versions, read sections and hashes are recorded in the packet.

## Existing-library and ownership boundary

The Mathlib/Tau Ceti pins are recorded in the packet. Reviewed AUDIT-20 says the parent’s function-field carrier and much of its divisor theory are built, while function-field adeles, reciprocity and the geometric L-function targets are missing. AUDIT-01 distinguishes native line bundles and function-field Riemann–Roch from missing algebraic stacks, Picard schemes and coherent-family Riemann–Roch. Positive baseline claims here come from actual declaration statements, not names in an index. The pinned abstract stack condition is effective pseudofunctor descent; it has no algebraic atlas. The native exterior-power type does not by itself prove the graded cohomology comparison.

D0 supplies ordinary quotient groupoids and two-fibre products; R09.4 supplies finite-quotient algebraicity, R09.5 the coarse universal property, and SF.1 the scheme/affine descent comparisons; SF.3 integrates upstream JacobianChallenge and AlgebraicCurves for ordinary curve/Picard geometry. The parent supplies adeles and arithmetic reciprocity. IG.0–IG.1 supply the scheme fundamental group and tame inertia. Scheme EDC duality is an input, while the coordinated EtaleDualityAndPerverseSheavesPartIIStacks proposal must supply the required tame-DM lisse and sheaf operations. Its provisional stage keys are not registered prerequisites. This packet records that missing interface rather than treating a scheme theorem as a stack theorem.

The older paper extraction assigned generic roots to SF.1. This issue’s explicit reserved key-definition assignment fixes the owner here. The proposed rescope retains SF.1’s foundational stack infrastructure and moves root consumers to RS.0–RS.2. A broad reverse dependency from all of SF.1 to this packet would create a cycle and is not proposed. The unramified YZ17 character and exterior-power routes coalesce with the empty-R specializations here. Ordinary Picard and Jacobian targets remain upstream.

## Proof structure and acceptance boundaries

The ordered divisor map has nontrivial relative stabilizer at a branch collision: μ₂×μ₂→μ₂ has kernel μ₂. It is not representably finite there. Properness, quasi-finiteness and rational tame-groupoid cohomology are stated in their exact stack setting. The symmetric local system’s collision proof calculates the kernel action on the tensor line before using the perverse extension theorem. That theorem must cover this map, rather than a representably finite substitute.

High-degree descent uses B=ρ+max(2g−1,1). The fixed-object two-fibre of Abel–Jacobi is the scheme M of (a,α_R) satisfying the square equation; after splitting evaluation it is a punctured affine space. Scalar root-Picard automorphisms have weights two on the ordinary kernel coordinates and one on the ρ root-section coordinates. The weighted quotient maps to the moduli space and has the simple-connectivity argument. It is not the fixed-object fibre itself, and punctured affine space is not asserted simply connected in positive characteristic. The empty-R case uses the ordinary weight-one projective quotient.

All-degree extension uses effective auxiliary divisors away from R. Closed points of any positive degree suffice to cross the high-degree bound. Comparisons through a common sum and their cocycle are separate declarations. They give the canonical all-degree object, product multiplication, associativity, commutativity and normalized unit. The hat sheaf is the pullback of that object along hatAJ; extension by zero from the effective locus would wrongly kill its zero-section stalks.

The norm sheaf sequence has an explicit local proof. At a ramified stalk, a root-normalized norm-one unit u has residue one, so 1+u is invertible and u=(1+u)/σ(1+u). The printed Picard-stack sequence requires a separate exactness interpretation and proof. For the ramified cover P¹→P¹, t↦t², O(1) is σ-invariant but cannot be pullback from downstairs, since pullback doubles degree. The packet preserves the two short exact sheaf sequences and their connecting maps, and records NORM-2EXACT. This rejects ordinary kernel exactness without declaring every coherent interpretation of the source false. The published p. 525 and arXiv v2 p. 89 retain the same one-sentence implication. The trace comparison has an independent proof and does not require this unresolved Picard-stack consequence.

The endpoint tests inverse uniformizer ↔ O(x), the Frobenius cyclic tensor at a closed point of degree δ, split and inert signs, and support moving with the residue-root frames retained. Its trace function is multiplicative on isomorphism classes. Specialized integrations still retain the automorphism groups and 1/#Aut factors; the groupoid equivalence is never replaced by a set bijection.

## Affine continuation and baseline convention

The affine root action uses the existing Tau Ceti μ_n Hopf points and scheme group, rather than planning another group scheme. Its coordinate coaction has all character coefficients available even when geometric points do not separate them. The equalizer of the coaction and b↦1⊗b is the invariant subalgebra. For B=A[t]/(tⁿ−f), its native monic basis and the native group-algebra tensor basis identify that equalizer with the coefficient image. No averaging, reducedness or invertibility of n is required. At n=p over a field of characteristic p the nilpotent t is fixed by every field-valued root of unity but not by the universal coaction. This supplies the ring calculation in the coarse-space proof; R09.5 supplies the geometric coarse universal property; SF.1 supplies the scheme gluing comparisons.

The new coordinate signatures below use native Hopf algebra maps, native tensor-algebra unit and associator equivalences, and the actual unlifted pointsMulEquiv carrier. Tau Ceti's scheme group uses a lifted character group, so these carriers are not identified definitionally. General μ_n, polynomial quotient bases and tensor-product bases are baseline imports, never new nodes.

Continuation provenance: Codex — codex-a71f92 read the TV17 character grading, Lemma 3.7 proof and finite chart Corollary 3.13 at the recorded edition; its downloaded hash matches the existing TV17 receipt. The finite arbitrary-A invariant proof is the coefficient argument written here, not a claim that the source's infinite-monoid lemma literally states it. Prior YZ19, AGV08, B24 and AV23 reading and nine source findings are retained from the preceding worker; this continuation does not claim a fresh whole-paper or erratum audit. All stage coverage remains partial.

## This continuation: finite algebra and infinite fpqc roots

Codex — codex-5ebb6f preserves all 91 inherited node IDs, all 33 recorded source-coverage routes, all 38 AV sibling routes and the nine inherited source findings. The fresh primary reading is TV17 §3, pp. 13–16 (finite transitions, cofinality and the infinite fpqc quotient, including the cited proofs), and B24 pp. 133 and 135 (the classifying-stack topology and DVR gerbe/Kummer comparison). Older reading receipts remain attributed to their earlier workers; this is not a fresh reading claim for the whole YZ or AV papers.

For B_n=A[t]/(tⁿ−f), the transition to B_nm sends t to uᵐ. Its iterated monic-quotient presentation provides the basis 1,u,…,uᵐ⁻¹ over B_n, hence faithful flatness even for nonreduced or zero coefficient rings. Native signatures below expose the maps, composition, basis and coefficient reconstruction. Infinite frame-torsor limits, ordinary groupoid carriers and geometric comparisons retain explicit supplier requests.

The inherited H1_fppf(k,lim μ_n) claim is corrected to H1_fpqc(k,lim μ_n). Finite classes remain H1_fppf(k,μ_n). Two separate leaves prove injectivity using finite isomorphism sets and surjectivity by a factorial torsor tower; compatibility of classes is not silently replaced by compatibility of objects.

The distinction is witnessed over Q by the coherent torsors tⁿ=2. Their inverse limit is an fpqc lim μ_n-torsor. An fppf trivialization would specialize at a closed point of a finite-type chart to roots of 2 of every degree in a finite extension K/Q. Eisenstein at 2 and the minimal-polynomial degree bound give n≤[K:Q], a contradiction. This is a correction to the inherited packet, not a claimed erratum in either paper. The B24 bibliography is also corrected to Inventiones Mathematicae 235 (2024).

All ten stages remain partial. The Lean file uses native carriers for the six new finite-algebra declarations and records exact omissions for the seven new geometric declarations. It contains admitted proofs and the complete file has not been elaborated at the pinned build.

## Declaration plan

Each entry is an unchecked proposed declaration. Inputs, supplier requests and gaps are mathematical obligations; a signature sketch does not certify a proof.

## RS.0. Root-object and affine-chart interfaces

Native invertible-sheaf tensor and section powers, canonical trivial-power coordinates and the root equation with its unit coefficient; scalar equations for root arrows; isomorphisms of root data; root-specific universal Hopf coaction on A[T]/(Tⁿ−f), its counit/coassociativity, character weights and compatibility with the existing μ_n points. μ_n and monic quotient bases are baseline imports. Exact declarations, hypotheses, API and acceptance tests are in the companion packet and reader.

### Tensor powers used by root objects

Declaration: FunctionFieldArithmeticPartII:RS.0/tensor-power. Construction.

For a native invertible sheaf M on a scheme T define M⁰=O_T and Mⁿ⁺¹=Mⁿ⊗M, with coherent transport of line-bundle isomorphisms. This is a root-object interface over the existing tensor operation, not a new definition of line bundles.

Hypotheses:

- The exponent n is a positive integer; the scheme or stack base and all base changes use the stated fppf topology.

Construction or proof:

1. Recurse using the native trivial bundle and tensor product.
2. Transport an isomorphism by the native tensor congruences; the recursion fixes parentheses.

Inputs: tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf, tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial, tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProduct, tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProductCongrLeft, tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProductCongrRight, tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProductAssoc, tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorTrivialLeftIso, tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorTrivialRightIso.

API uses:

- AGV B.2 — The root identification has domain the n-th tensor power of M.

API:

- TauCeti.RootStack.tensorPower.zero (simp): M⁰ is the native trivial sheaf.
- TauCeti.RootStack.tensorPower.succ (simp): Mⁿ⁺¹=Mⁿ⊗M with the chosen parentheses.
- TauCeti.RootStack.tensorPower.mapIso (functoriality): An isomorphism M≅N induces Mⁿ≅Nⁿ and respects identity and composition.

Unit tests:

- TauCeti.RootStack.tensorPower.test_zero (degenerate): At exponent zero the output is O_T.
- TauCeti.RootStack.tensorPower.test_one (compatibility): At exponent one the output is isomorphic to M via the native unit isomorphism.
- TauCeti.RootStack.tensorPower.test_two (computation): At exponent two the output is O_T⊗M⊗M with the displayed parentheses, canonically M⊗M.

Acceptance:

- Zero exponent is the native trivial sheaf; exponent one is canonically M.

Source:

- AGV08, B.1–B.2 pp. 52–54. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Powers of sections

Declaration: FunctionFieldArithmeticPartII:RS.0/section-power. Construction.

For t∈Γ(T,M), define tⁿ∈Γ(T,Mⁿ) using the native sheaf tensor product; t⁰ is the unit section and tⁿ⁺¹=tⁿ⊗t.

Hypotheses:

- The exponent n is a positive integer; the scheme or stack base and all base changes use the stated fppf topology.

Construction or proof:

1. Use the canonical bilinear section map into the sheafified tensor product and the unit section.
2. Recurse with the same parentheses as tensor powers. The general sheaf tensor/unit identification is an upstream JacobianChallenge interface, recorded as request JAC-A.

Inputs: FunctionFieldArithmeticPartII:RS.0/tensor-power, mathlib:AlgebraicGeometry.Scheme.Modules.presheaf, SchemeAndStackFoundations:SF.3, mathlib:SheafOfModules.freeSection, mathlib:AlgebraicGeometry.Scheme.Modules.Hom.app.

API uses:

- AGV B.2 — Defines the actual equation relating the root section to the original section.

API:

- TauCeti.RootStack.sectionPower.zero (simp): t⁰ is the unit section of O_T.
- TauCeti.RootStack.sectionPower.succ (simp): tⁿ⁺¹ is the tensor product of tⁿ and t.
- TauCeti.RootStack.sectionPower.mapIso (compatibility): Transporting t through a line-bundle isomorphism commutes with section power.
- TauCeti.RootStack.sectionPower.tensorStep (data): For a section v of Mⁿ and t of M, the root-power recursion step tensors them into a section of Mⁿ⁺¹; it uses JAC-A’s native section tensor map.

Unit tests:

- TauCeti.RootStack.sectionPower.test_zero (degenerate): The zeroth power of the zero section is the unit.
- TauCeti.RootStack.sectionPower.test_one (compatibility): The first power maps to t under the native unit isomorphism.
- TauCeti.RootStack.sectionPower.test_zero_positive (non-example): The positive powers of the zero section are zero, rather than excluded root objects.

Acceptance:

- Under a trivialization this is ordinary fⁿ; zero sections are allowed.

Source:

- AGV08, B.2 p. 53. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Root objects over a test scheme

Declaration: FunctionFieldArithmeticPartII:RS.0/root-object. Definition.

For n≥1, (L,s) on T, an object consists of a native invertible sheaf M, t∈Γ(T,M), and an isomorphism φ:Mⁿ≅L satisfying φ(tⁿ)=s. Arrows are invertible sheaf isomorphisms preserving t and commuting with φ.

Hypotheses:

- The exponent n is a positive integer; the scheme or stack base and all base changes use the stated fppf topology.

Construction or proof:

1. Take triples of actual native sheaf data satisfying the section equality.
2. Use only invertible arrows from the core; impose the two compatibility equations on their isomorphisms.

Inputs: FunctionFieldArithmeticPartII:RS.0/tensor-power, FunctionFieldArithmeticPartII:RS.0/section-power, mathlib:CategoryTheory.Core.

API uses:

- AGV B.2 — Gives root-stack fibres.
- Yun–Zhang Definition A.2 — Permits nilpotent and zero section data.

API:

- TauCeti.RootStack.RootObject.mk (constructor): Create an object from M,t,φ and φ(tⁿ)=s.
- TauCeti.RootStack.RootObject.line (projection): Forget an object to its native invertible sheaf M.
- TauCeti.RootStack.RootObject.iso (characterisation): An arrow is exactly a line-bundle isomorphism preserving both section and root identification.
- TauCeti.RootStack.RootObject.canonicalOne (constructor): The canonical exponent-one root object has line L, section s and the native unit identification O⊗L≅L.

Unit tests:

- TauCeti.RootStack.RootObject.test_one (degenerate): For n=1 the object (L,s,id) is terminal up to unique isomorphism.
- TauCeti.RootStack.RootObject.test_zero (non-example): For L=O_T,s=0, the object (O_T,0,id) exists.
- TauCeti.RootStack.RootObject.test_trivialization (compatibility): For a trivialized object φ is a unit u and the equation is u tⁿ=s, with isomorphism scalars retained.

Acceptance:

- A zero section gives valid root objects; replacing arrows by all module maps is incorrect.

Source:

- AGV08, B.2 p. 53. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Diagonalizable action on the affine root chart

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-action. Construction.

For a commutative ring A, f∈A and n≥1, each ζ∈rootsOfUnity(n,A) induces an A-algebra automorphism of the existing AdjoinRoot(Tⁿ−f) sending T to ζT. The construction is natural on A-algebras and represents the μ_n group-scheme action, including infinitesimal points.

Hypotheses:

- The exponent n is a positive integer; the scheme or stack base and all base changes use the stated fppf topology.

Construction or proof:

1. The image ζT satisfies Tⁿ−f because ζⁿ=1; use the native quotient lift.
2. Use ζ⁻¹ for the inverse; generator evaluation proves identity and multiplication.
3. Apply the same construction on every A-algebra to retain the group-scheme action.

Inputs: mathlib:AdjoinRoot, mathlib:AdjoinRoot.eval₂_root, mathlib:AdjoinRoot.lift, mathlib:rootsOfUnity.

API uses:

- TV Corollary 3.13 — Supplies the diagonalizable action in the finite root quotient chart.

API:

- TauCeti.RootStack.affineAction.root (simp): The distinguished quotient root maps to ζ times itself.
- TauCeti.RootStack.affineAction.constant (simp): Every coefficient from A is fixed.
- TauCeti.RootStack.affineAction.mul (structure): The automorphisms for ζξ and ζ composed with ξ agree.

Unit tests:

- TauCeti.RootStack.affineAction.test_one (degenerate): The unit root of unity acts as the identity.
- TauCeti.RootStack.affineAction.test_sign (computation): For n=2 the element −1 sends T to −T.
- TauCeti.RootStack.affineAction.test_infinitesimal (non-example): On F_p[ε]/ε² at n=p, 1+ε has p-th power one and acts by T↦(1+ε)T.

Acceptance:

- In characteristic p the μ_p action is not detected by its geometric-point set.

Source:

- TV17, §3.1 pp. 14–16, P=N and Corollary 3.13. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Canonical quotient-root relation

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-root-relation. Lemma.

The distinguished root t of the actual quotient B=A[T]/(Tⁿ−f) satisfies tⁿ=algebraMap(f), including over nonreduced and zero coefficient rings.

Hypotheses:

- A is any commutative ring and f∈A. The root relation and character-power identity allow every natural n; Euclidean reduction uses n≥1. No reducedness, regularity, invertibility of n, or unit condition on f is imposed.

Construction or proof:

1. Evaluate the defining polynomial at the canonical quotient root using eval₂_root.
2. Expand evaluation of Xⁿ−C(f) and cancel the subtraction; the existing coefficient algebra map is the native quotient map.

Inputs: mathlib:AdjoinRoot, mathlib:AdjoinRoot.eval₂_root.

Unit tests:

- TauCeti.RootStack.affineRoot.pow_eq.test_wild_branch (computation): Over F₂, the canonical root of T² has square zero.
- TauCeti.RootStack.affineRoot.pow_eq.test_regular_nonunit (computation): Over Z, the canonical root of T²−2 has fourth power equal to the image of 4.

Acceptance:

- For A=F₂,n=2,f=0, t²=0 without any assertion that t vanishes.
- For A=Z,n=2,f=2, t⁴=4; f need not be a unit.

Source:

- TV17, §3.1 pp. 14–16, character grading before Lemma 3.7 and finite chart of Corollary 3.13, P=N. Root-specific calculation derived here from the finite P=N character grading and quotient chart. The native quotient and character algebra are imported. This is not a verbatim theorem attributed to the paper.

### Powers of the native root character

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-character-power. Lemma.

In H=A[Multiplicative(ZMod n)], the basis element e₁ at the existing roots-of-unity character generator satisfies e₁ⁱ=e_i for every i≥0. In particular e₁ⁿ=1, even when n is zero in A.

Hypotheses:

- A is any commutative ring and f∈A. The root relation and character-power identity allow every natural n; Euclidean reduction uses n≥1. No reducedness, regularity, invertibility of n, or unit condition on f is imposed.

Construction or proof:

1. Apply the native single_pow identity with coefficient 1.
2. Expand the existing generator to Multiplicative.ofAdd(1). Its i-th power is the additive multiple i•1, whose image is i modulo n. For i=n, natCast_self gives zero and e₀=1.

Inputs: tauceti:TauCeti.RootsOfUnityGroup.generator, mathlib:MonoidAlgebra.single_pow, mathlib:ofAdd_nsmul, mathlib:ZMod.natCast_self.

Unit tests:

- TauCeti.RootStack.affineCharacter.pow.test_wild_order (compatibility): In F₂[Multiplicative(ZMod 2)], the character basis element e₁ has square one.

Acceptance:

- Over F₂ at exponent two, e₁²=1 although μ₂ is not étale.

Source:

- TV17, §3.1 pp. 14–16, character grading before Lemma 3.7 and finite chart of Corollary 3.13, P=N. Root-specific calculation derived here from the finite P=N character grading and quotient chart. The native quotient and character algebra are imported. This is not a verbatim theorem attributed to the paper.

### Euclidean reduction of quotient-root powers

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-root-power-reduction. Lemma.

For n≥1 and every k≥0, the actual quotient root satisfies tᵏ=f^⌊k/n⌋ • t^(k mod n), using the native A-module structure on B. No division in A is performed.

Hypotheses:

- A is any commutative ring and f∈A. The root relation and character-power identity allow every natural n; Euclidean reduction uses n≥1. No reducedness, regularity, invertibility of n, or unit condition on f is imposed.

Construction or proof:

1. Write k=n⌊k/n⌋+(k mod n) in the natural numbers.
2. Use the power product identities and the canonical root relation tⁿ=f. Rewrite multiplication by the coefficient image as scalar multiplication.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-root-relation.

Unit tests:

- TauCeti.RootStack.affineRoot.pow_reduce.test_nilpotent (computation): In (Z/4)[T]/(T²−2), the canonical root has fourth power zero.

Acceptance:

- For A=Z/4,n=2,f=2, t⁴=0, retaining the nilpotent coefficient.
- At k<n the quotient coefficient is one; at k=n it is f.

Source:

- TV17, §3.1 pp. 14–16, character grading before Lemma 3.7 and finite chart of Corollary 3.13, P=N. Root-specific calculation derived here from the finite P=N character grading and quotient chart. The native quotient and character algebra are imported. This is not a verbatim theorem attributed to the paper.

### Root image of the universal coaction

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-coaction-root. Lemma.

δ(t)=e_1⊗t in the native H⊗_A B.

Hypotheses:

- A is any commutative ring, f∈A and n≥1. No reducedness, nonzerodivisor or invertibility-of-n hypothesis is imposed.

Construction or proof:

1. Evaluate the native quotient algebra lift at the distinguished root.
2. The lift uses the specified tensor e₁⊗t, so its root computation is exact.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-coaction, mathlib:AdjoinRoot.liftAlgHom.

Acceptance:

- This is the promoted root-evaluation API used by weight, counit and coassociativity proofs.

Source:

- TV17, §3.1 pp. 14–16, character grading before Lemma 3.7 and finite chart of Corollary 3.13, P=N. Root-specific calculation derived here from the finite P=N character grading and quotient chart. The native quotient and character algebra are imported. This is not a verbatim theorem attributed to the paper.

### Affine root-chart coaction

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-coaction. Construction.

Put B=A[t]/(tⁿ−f), using native AdjoinRoot, and H=A[Multiplicative(ZMod n)], using the native Hopf group algebra. Write e_i for its character basis element indexed by i modulo n. Define the unique A-algebra map δ:B→H⊗_A B with δ(t)=e_1⊗t. Constants map to 1⊗a. This is a universal coordinate map, not an action of the geometric-point set.

Hypotheses:

- A is any commutative ring, f∈A and n≥1. No reducedness, nonzerodivisor or invertibility-of-n hypothesis is imposed.

Construction or proof:

1. In the native group algebra e_1ⁿ=e_0=1 because the character index is modulo n. Hence (e_1⊗t)ⁿ=1⊗f and the quotient polynomial evaluates to zero.
2. Apply the native AdjoinRoot algebra lift with this root and the coefficient map to H⊗_A B. The algebra-map law fixes constants.
3. Native quotient algebra-hom extensionality proves uniqueness. Counit and coassociativity are proved in separate nodes, not assumed fields.

Inputs: mathlib:AdjoinRoot, mathlib:AdjoinRoot.eval₂_root, mathlib:AdjoinRoot.liftAlgHom, mathlib:AdjoinRoot.algHom_ext, mathlib:MonoidAlgebra.single, mathlib:MonoidAlgebra.single_pow, mathlib:Algebra.TensorProduct.includeRight, tauceti:TauCeti.RootsOfUnityGroup.generator, mathlib:MonoidAlgebra.instHopfAlgebra, FunctionFieldArithmeticPartII:RS.0/affine-root-relation, FunctionFieldArithmeticPartII:RS.0/affine-character-power, mathlib:Algebra.TensorProduct.algebraMap_apply', mathlib:Algebra.TensorProduct.tmul_pow.

API uses:

- FunctionFieldArithmeticPartII:RS.1/affine-chart; Talpo–Vistoli Corollary 3.13 — Supplies the universal diagonalizable coordinate action, including characteristic dividing n.
- FunctionFieldArithmeticPartII:RS.1/affine-invariants and FunctionFieldArithmeticPartII:RS.1/coarse-space — Defines invariants by δ(b)=1⊗b, not by geometric roots of unity.
- FunctionFieldArithmeticPartII:RS.0/native-point-action — Compares specialization with the native Hopf point equivalence and affineAction.

API:

- TauCeti.RootStack.affineCoaction.root (simp): δ(t)=e_1⊗t in the native H⊗_A B.
- TauCeti.RootStack.affineCoaction.constant (simp): For every a∈A, δ(algebraMap(a))=1⊗algebraMap(a).
- TauCeti.RootStack.affineCoaction.unique (universal-property): An A-algebra map ψ:B→H⊗_A B with ψ(t)=e_1⊗t equals δ.

Unit tests:

- TauCeti.RootStack.affineCoaction.test_one (degenerate): At n=1, δ(b)=1⊗b for every b∈A[t]/(t−f).
- TauCeti.RootStack.affineCoaction.test_sign (compatibility): At n=2, the native Hopf point corresponding to ζ=−1 through TauCeti.RootsOfUnityGroup.pointsMulEquiv, applied to the H factor of δ(t) and then the native A⊗_A B unit equivalence, gives −t.
- TauCeti.RootStack.affineCoaction.test_characteristic_p (non-example): For a field k of prime characteristic p, n=p and f=0, t≠0 and δ(t)≠1⊗t, while every ζ∈rootsOfUnity(p,k) fixes t. Field-valued point invariance is therefore not scheme invariance.

Acceptance:

- The map exists for f=0, nonreduced bases and the zero ring.

Planet: Affine root coaction.

Source:

- TV17, §3.1 pp. 14–16, character grading before Lemma 3.7 and finite chart of Corollary 3.13, P=N. Root-specific coordinate calculation derived here from the finite P=N character grading. Native Hopf, quotient and basis declarations are imported, not rebuilt. This is not a claimed verbatim theorem of the paper.

### Character weights of root powers

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-coaction-weight. Lemma.

For every integer i≥0, δ(t^i)=e_i⊗t^i, where e_i is indexed by the image of i in ZMod n; coefficients from A have weight zero.

Hypotheses:

- A is any commutative ring, f∈A and n≥1. No reducedness, nonzerodivisor or invertibility-of-n hypothesis is imposed.

Construction or proof:

1. Apply multiplicativity of δ to t^i and use δ(t)=e_1⊗t with native tensor multiplication.
2. Rewrite e_1^i as the basis element at the residue of i. At i=n this agrees with tⁿ=f having weight zero.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-coaction, mathlib:MonoidAlgebra.single_pow, FunctionFieldArithmeticPartII:RS.0/affine-coaction-root, FunctionFieldArithmeticPartII:RS.0/affine-character-power, mathlib:Algebra.TensorProduct.tmul_pow.

Acceptance:

- At i=0 the image is 1⊗1; at i=n it is 1⊗f even when n is zero in A.

Source:

- TV17, §3.1 pp. 14–16, character grading before Lemma 3.7 and finite chart of Corollary 3.13, P=N. Root-specific coordinate calculation derived here from the finite P=N character grading. Native Hopf, quotient and basis declarations are imported, not rebuilt. This is not a claimed verbatim theorem of the paper.

### Counit law for the root coaction

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-coaction-counit. Lemma.

Let ε:H→A be the native Hopf counit. The composite of δ, ε⊗id and the native tensor left-unit equivalence H⊗_A B→A⊗_A B→B is id_B.

Hypotheses:

- A is any commutative ring, f∈A and n≥1. No reducedness, nonzerodivisor or invertibility-of-n hypothesis is imposed.

Construction or proof:

1. The native group-like basis theorem gives ε(e_1)=1.
2. The composite sends t to t. Both maps are A-algebra maps, so native quotient extensionality establishes equality without an assumed counit predicate.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-coaction, mathlib:MonoidAlgebra.instBialgebra, mathlib:MonoidAlgebra.isGroupLikeElem_single_one, mathlib:Bialgebra.counitAlgHom, mathlib:Algebra.TensorProduct.map, mathlib:Algebra.TensorProduct.lid, mathlib:AdjoinRoot.algHom_ext, FunctionFieldArithmeticPartII:RS.0/affine-coaction-root, mathlib:MonoidAlgebra.counit_single.

Acceptance:

- The action identity holds also for n=1 and zero coefficient rings.

Source:

- TV17, §3.1 pp. 14–16, character grading before Lemma 3.7 and finite chart of Corollary 3.13, P=N. Root-specific coordinate calculation derived here from the finite P=N character grading. Native Hopf, quotient and basis declarations are imported, not rebuilt. This is not a claimed verbatim theorem of the paper.

### Coassociativity of the root coaction

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-coaction-coassoc. Lemma.

Let Δ:H→H⊗_A H be the native Hopf comultiplication. Under the native associator (H⊗_A H)⊗_A B≅H⊗_A(H⊗_A B), the maps (Δ⊗id)δ and (id⊗δ)δ are equal.

Hypotheses:

- A is any commutative ring, f∈A and n≥1. No reducedness, nonzerodivisor or invertibility-of-n hypothesis is imposed.

Construction or proof:

1. The native group-like basis theorem gives Δ(e_1)=e_1⊗e_1.
2. Both composites send t to e_1⊗(e_1⊗t) after reassociation; quotient extensionality proves equality. The associator is explicit, not a definitional identification of tensor parentheses.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-coaction, mathlib:MonoidAlgebra.instBialgebra, mathlib:MonoidAlgebra.isGroupLikeElem_single_one, mathlib:Bialgebra.comulAlgHom, mathlib:Algebra.TensorProduct.map, mathlib:Algebra.TensorProduct.assoc, mathlib:AdjoinRoot.algHom_ext, FunctionFieldArithmeticPartII:RS.0/affine-coaction-root, mathlib:MonoidAlgebra.comul_single.

Acceptance:

- This uses the existing tensor-algebra associator, not a new tensor carrier.

Source:

- TV17, §3.1 pp. 14–16, character grading before Lemma 3.7 and finite chart of Corollary 3.13, P=N. Root-specific coordinate calculation derived here from the finite P=N character grading. Native Hopf, quotient and basis declarations are imported, not rebuilt. This is not a claimed verbatim theorem of the paper.

### Native roots-of-unity point specialization

Declaration: FunctionFieldArithmeticPartII:RS.0/native-point-action. Comparison.

For ζ∈rootsOfUnity(n,A), let p_ζ:H→A be the algebra map underlying the inverse of TauCeti.RootsOfUnityGroup.pointsMulEquiv. The composite of δ with p_ζ⊗id and the native tensor left-unit equivalence is the algebra homomorphism underlying affineAction(f,n,ζ).

Hypotheses:

- A is any commutative ring, f∈A and n≥1. No reducedness, nonzerodivisor or invertibility-of-n hypothesis is imposed.

Construction or proof:

1. The native point equivalence on the actual unlifted group-algebra carrier gives p_ζ(e_1)=ζ.
2. Specialize δ(t) to ζt and compare the defining image of t under affineAction. Constants agree since both are A-algebra maps; quotient extensionality completes the comparison.
3. Apply the statement over every coefficient A-algebra to retain infinitesimal points. The scheme group object's ULift character carrier is not asserted to be definitionally this unlifted group algebra.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-coaction, FunctionFieldArithmeticPartII:RS.0/affine-action, tauceti:TauCeti.RootsOfUnityGroup.pointsMulEquiv, tauceti:TauCeti.RootsOfUnityGroup.pointsMulEquiv_symm_apply_single_generator, mathlib:Algebra.TensorProduct.map, mathlib:Algebra.TensorProduct.lid, mathlib:AdjoinRoot.algHom_ext.

Acceptance:

- For ζ=1 specialization is identity; at n=2, ζ=−1 gives the sign action. Nonreduced coefficient rings retain infinitesimal points.

Source:

- TV17, §3.1 pp. 14–16, character grading before Lemma 3.7 and finite chart of Corollary 3.13, P=N. Root-specific coordinate calculation derived here from the finite P=N character grading. Native Hopf, quotient and basis declarations are imported, not rebuilt. This is not a claimed verbatim theorem of the paper.

### Canonical coordinates for powers of the trivial line

Declaration: FunctionFieldArithmeticPartII:RS.0/trivial-power-isomorphism. Construction.

For any scheme X and n≥0, let O be the native free rank-one invertible sheaf. Construct c_n:Oⁿ≅O with c_0=id and c_{n+1}=(c_n⊗id_O) followed by the native right-unit isomorphism. The parentheses agree with tensorPower; these are canonical coordinates for that recursion, not a new tensor product.

Hypotheses:

- Scheme X arbitrary; n a natural number, including zero.

Construction or proof:

1. Start with the identity at zero.
2. At the successor compose native tensorProductCongrLeft(c_n) with tensorTrivialRightIso(O). Their actual domains match the recursive tensor power.
3. For the section-unit API use the existing bilinear tensor-section/unit contract JAC-A; no generic section tensor map is constructed here.

Inputs: FunctionFieldArithmeticPartII:RS.0/tensor-power, tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProductCongrLeft, tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorTrivialRightIso, SchemeAndStackFoundations:SF.3.

API uses:

- AGV B.2, trivial L=O calculation — Identifies the domain of the root identification with O while retaining its unit coefficient.
- FunctionFieldArithmeticPartII:RS.0/root-trivialization-equation — Computes powers in the same parentheses as the native root object.

API:

- TauCeti.RootStack.tensorPower.trivialIso_zero (simp): c_0 is the identity of O.
- TauCeti.RootStack.tensorPower.trivialIso_succ (simp): c_{n+1}=(c_n⊗id) followed by the right-unit map, with the native tensor congruence.
- TauCeti.RootStack.tensorPower.trivialIso_unit (compatibility): Under c_n the n-th power of the native unit section has coefficient 1 for every n≥0.

Unit tests:

- TauCeti.RootStack.tensorPower.trivialIso_test_zero (degenerate): c_0=id_O.
- TauCeti.RootStack.tensorPower.trivialIso_test_one (compatibility): c_1 equals the existing right-unit isomorphism O⊗O≅O.
- TauCeti.RootStack.tensorPower.trivialIso_test_two (computation): For a section of O with coefficient z, its square transported by c_2 has coefficient z², including nilpotent z.

Acceptance:

- The exponent-one comparison is the native right-unit map, not an arbitrarily chosen scalar multiple.

Source:

- AGV08, Appendix B.1–B.2, pp. 52–54, root triples and trivial-bundle quotient calculation. Root-specific coordinate derivation of the native object equation and its arrows. The source gives the geometric root data; the unit/coordinate proof decomposition here uses the pinned free-sheaf and tensor APIs, not a claimed printed standalone lemma.

### Section powers in native coordinates

Declaration: FunctionFieldArithmeticPartII:RS.0/section-power-in-trivialization. Lemma.

For an invertible sheaf M on X, a specified trivialization e:M≅O, a section t and n≥0, transporting tⁿ by eⁿ followed by c_n gives the global function zⁿ, where z is the coefficient of e(t). Coefficients use the existing freePUnitIsoUnit map on global sections.

Hypotheses:

- Scheme X arbitrary; M trivialized by the actual isomorphism e; n≥0; zero sections allowed.

Construction or proof:

1. Use sectionPower.mapIso to transport to the native trivial line.
2. At zero use its unit-section API. At the successor use JAC-A’s bilinear section tensor map and the native right-unit map: their coordinate evaluation is multiplication.
3. Induct with the same c_n recursion. Neither tensor-power parenthesization nor an unidentified scalar is discarded.

Inputs: FunctionFieldArithmeticPartII:RS.0/section-power, FunctionFieldArithmeticPartII:RS.0/trivial-power-isomorphism, tauceti:TauCeti.SheafOfModules.freePUnitIsoUnit, SchemeAndStackFoundations:SF.3, FunctionFieldArithmeticPartII:RS.0/section-power-transport.

Acceptance:

- At n=0 the result is 1 even for t=0. At positive n zero gives zero. Over Z/4 the coefficient 2 has square zero.

Source:

- AGV08, Appendix B.1–B.2, pp. 52–54, root triples and trivial-bundle quotient calculation. Root-specific coordinate derivation of the native object equation and its arrows. The source gives the geometric root data; the unit/coordinate proof decomposition here uses the pinned free-sheaf and tensor APIs, not a claimed printed standalone lemma.

### The unit coefficient of a root identification

Declaration: FunctionFieldArithmeticPartII:RS.0/root-identification-unit. Lemma.

For an actual n-th root object a=(M,t,φ) of (L,s), n≥1, and specified trivializations e:M≅O and l:L≅O, form α=c_n⁻¹ followed by (e⁻¹)ⁿ, φ and l, an automorphism of O. Let u be the coefficient of α(1). Then u is a unit in Γ(X,O_X); for every v∈Γ(X,Mⁿ), the coefficient of lφ(v) equals u times the coefficient of c_n eⁿ(v).

Hypotheses:

- Scheme X arbitrary; n≥1; actual native invertible-sheaf isomorphisms φ,e,l.

Construction or proof:

1. Construct α from the stated isomorphisms, so it has an actual inverse.
2. Use pinned freeHomEquiv/unitHomEquiv: maps from the free one-generator sheaf are determined by the image of its unit section. On each open, module linearity makes α multiplication by its unit-section coefficient; naturality makes those coefficients restrictions of the global coefficient.
3. Apply the inverse map to obtain u v=1=v u in global functions. This proves IsUnit(u), rather than postulating it.
4. Apply the scalar evaluation formula to c_n eⁿ(v) and use the inverse/cancellation identities.

Inputs: FunctionFieldArithmeticPartII:RS.0/root-object, FunctionFieldArithmeticPartII:RS.0/trivial-power-isomorphism, tauceti:TauCeti.SheafOfModules.freePUnitIsoUnit, mathlib:SheafOfModules.freeHomEquiv, mathlib:SheafOfModules.freeHomEquiv_apply, mathlib:SheafOfModules.unitHomEquiv, mathlib:AlgebraicGeometry.Scheme.Modules.Hom.app_smul.

Acceptance:

- Multiplication by 2 on O over Spec(Z/4) is not an allowed root identification. Nilpotents in the base do not invalidate multiplication by a unit.

Source:

- AGV08, Appendix B.1–B.2, pp. 52–54, root triples and trivial-bundle quotient calculation. Root-specific coordinate derivation of the native object equation and its arrows. The source gives the geometric root data; the unit/coordinate proof decomposition here uses the pinned free-sheaf and tensor APIs, not a claimed printed standalone lemma.

### The native root equation in coordinates

Declaration: FunctionFieldArithmeticPartII:RS.0/root-trivialization-equation. Theorem.

With the native root object and chosen trivializations above, the computed coefficient u is a unit and u zⁿ=f, where z is the coefficient of the root section under e and f is the coefficient of s under l. The coefficient u is part of the comparison; no choice of an n-th root of u is assumed.

Hypotheses:

- Scheme X arbitrary; n≥1; root object and two specified native trivializations.

Construction or proof:

1. Use root-identification-unit to evaluate φ on the actual section tⁿ and establish that u is a unit.
2. Use section-power-in-trivialization to identify the coordinate of tⁿ with zⁿ.
3. Transport the defining root equation φ(tⁿ)=s by l; this gives u zⁿ=f. The example quantifies over a bundled unit and asserts equality to the computed coefficient, not just a renamed defining equation.

Inputs: FunctionFieldArithmeticPartII:RS.0/root-identification-unit, FunctionFieldArithmeticPartII:RS.0/section-power-in-trivialization.

Acceptance:

- Over Spec(Z/4), n=2, u=3 and z=2 give f=0 with z nonzero; zero sections and nilpotent roots must remain. Over Q the root object u=2,z=1,f=2 exists without a rational square root of 2.

Planet: Root objects in coordinates.

Source:

- AGV08, Appendix B.1–B.2, pp. 52–54, root triples and trivial-bundle quotient calculation. Root-specific coordinate derivation of the native object equation and its arrows. The source gives the geometric root data; the unit/coordinate proof decomposition here uses the pinned free-sheaf and tensor APIs, not a claimed printed standalone lemma.

### Scalar equations for arrows of root objects

Declaration: FunctionFieldArithmeticPartII:RS.0/root-arrow-scalars. Comparison.

For root objects a,b of the same (L,s,n), chosen trivializations e_a,e_b of their root lines and l of L, every actual root arrow h:a→b has a unit coefficient w. The section coordinates satisfy z_b=w z_a and the computed root-identification coefficients satisfy u_b wⁿ=u_a. Retain both equations and the unit condition, including when sections vanish.

Hypotheses:

- Scheme X arbitrary; n≥1; h is a native invertible root arrow, not an arbitrary module map.

Construction or proof:

1. Conjugate the underlying line isomorphism by e_a and e_b. The native free-sheaf Hom equivalence and its actual inverse give its unit coefficient w.
2. The arrow section equation gives z_b=w z_a.
3. Evaluate the tensor-power transport on the native unit section; sectionPower.mapIso and section-power-in-trivialization identify its coefficient with wⁿ.
4. Conjugate the arrow power equation φ_b∘hⁿ=φ_a by the chosen trivializations to obtain u_b wⁿ=u_a.

Inputs: FunctionFieldArithmeticPartII:RS.0/root-identification-unit, FunctionFieldArithmeticPartII:RS.0/section-power-in-trivialization, FunctionFieldArithmeticPartII:RS.0/root-object, mathlib:SheafOfModules.freeHomEquiv.

Acceptance:

- For a=b with zero section and u_a=u_b, the power condition still forces wⁿ=1; forgetting it incorrectly makes every unit an automorphism. Composition multiplies w coefficients.

Source:

- AGV08, Appendix B.1–B.2, pp. 52–54, root triples and trivial-bundle quotient calculation. Root-specific coordinate derivation of the native object equation and its arrows. The source gives the geometric root data; the unit/coordinate proof decomposition here uses the pinned free-sheaf and tensor APIs, not a claimed printed standalone lemma.

### Isomorphism transport of section powers

Declaration: FunctionFieldArithmeticPartII:RS.0/section-power-transport. Comparison.

For any scheme X, invertible sheaves M,N, an actual isomorphism e:M≅N, section t of M and n≥0, eⁿ carries tⁿ to (e(t))ⁿ in the fixed recursive tensor powers. The transport at exponent zero is the identity of the native tensor unit; identity and composition use the coherent tensor-power transport.

Hypotheses:

- Scheme X arbitrary; actual native invertible-sheaf isomorphism e; n≥0; t may vanish.

Construction or proof:

1. Use the zero-degree identity transport and the native unit section.
2. At the successor use JAC-A’s natural bilinear section tensor map with the native tensor congruences. Apply the induction hypothesis to the first factor and e to the second.
3. Keep the recursive tensor parentheses and verify transport identity/composition via the existing tensor functor laws; these generic coherence contracts stay with JAC-A.

Inputs: FunctionFieldArithmeticPartII:RS.0/tensor-power, FunctionFieldArithmeticPartII:RS.0/section-power, SchemeAndStackFoundations:SF.3.

Acceptance:

- For n=0 even the zero section maps to the same unit. For multiplication by a unit w on a trivial line, the transported n-th section power has coefficient wⁿ.

Source:

- AGV08, Appendix B.1–B.2, pp. 52–54, root triples and trivial-bundle quotient calculation. Root-specific coordinate derivation of the native object equation and its arrows. The source gives the geometric root data; the unit/coordinate proof decomposition here uses the pinned free-sheaf and tensor APIs, not a claimed printed standalone lemma.

### Finite action comparison and its exact obstruction

Let A be any commutative ring, n≥1, f∈A, B=A[x]/(xⁿ−f), and H=A[Multiplicative(ZMod n)]. These are native AdjoinRoot and Hopf group-algebra types. The character vector e_i is indexed by a residue class, not a geometric root-of-unity point. The coordinate map Θ:B⊗_A B→H⊗_A B is δ on the left and the identity inclusion on the right.

In the monic source basis s_(i,j)=x^i⊗x^j and character/monic target basis t_(i,k)=e_i⊗x^k, the map is a weighted permutation:
Θ(s_(i,j))=f^⌊(i+j)/n⌋t_(i,(i+j) mod n).
The permutation inverse uses j=k−i for k≥i and j=n+k−i for k<i. There is no cancellation assumption on A. Over the zero ring, coordinate families and modules are singletons; do not assert that the quotient polynomial has natural degree n there.

Put W={(i,j):i+j≥n}, L={(i,k):k<i}, and E=n(n−1)/2. Source kernel coordinates outside W vanish and those on W lie in ann_A(f); target image coordinates on L lie in fA. Consequently ker_A Θ≃ann_A(f)^W and coker_A Θ≃(A/(f))^L by the specified coordinate maps. The cokernel is a module quotient by the linear range, not an algebra quotient or a reduced quotient. The ideal generated by that range contains 1.

Injectivity is equivalent to n=1 or injectivity of multiplication by f. Surjectivity and bijectivity are equivalent to n=1 or f being a unit. Thus Z,n=2,f=2 gives an injective non-surjective map. A nonzero nilpotent parameter is different: over Z/4, f=2 kills the nonzero tensor 2(x⊗x). Coefficient change preserves the displayed matrix, but Z→F₂ shows that it does not preserve kernels.

For a unit v, put X=x⊗1, Y=1⊗x. Then Y⁻¹=1⊗v⁻¹x^(n−1), χ=XY⁻¹, and χⁿ=1. The existing native μ_n points equivalence gives H→B⊗B taking e_1 to χ. Tensoring with the right inclusion constructs the inverse of Θ. No inverse of n is used; for F₂,n=2,f=1 it is still an isomorphism even though x−1 is a nonzero nilpotent.

The determinant in the specified pair bases is (−1)^((n−1)E)f^E. The sign comes from row block i, an ith cyclic rotation, and the E wrapping columns carry the f weights. At f=0 over any field the surviving nonwrapping columns have distinct unit pivots, giving range dimension n(n+1)/2 and kernel dimension E.

This calculation applies to normalized coframes of an actual root object, not to an arbitrary root chart as a torsor over its coarse base. Locally φ(eⁿ)=u is a unit and the section is b e with u bⁿ=f. Compatible coframes e↦a have aⁿ=u; their unit-parameter finite cover is a μ_n torsor. The equivariant map to the coarse root chart is x↦ab. The coordinate comparison checks that finite input to RS.1/affine-chart and TOWER-AFF. Scheme/site torsor criteria, coherent infinite limits, finite quotient comparisons and derived fpqc H¹ remain the existing foundational requests. These fifteen exports do not close those interfaces or the reserved root-stack key.

#### Affine action comparison

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-comparison. definition. Native name: TauCeti.RootStack.affineTorsorComparison.

Let B=A[x]/(xⁿ−f) be native AdjoinRoot and H=A[Multiplicative(ZMod n)] the native Hopf group algebra, with character basis e_i. Define the A-algebra map Θ:B⊗_A B→H⊗_A B by the tensor universal property applied to δ:B→H⊗B and c↦1⊗c. Thus the right B-factor is unchanged; this is the coordinate map of the action comparison, not a freely chosen linear map.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. Use the existing affine coaction and the native right-factor algebra inclusion. Their images commute because the target algebra is commutative.
2. Apply the native tensor-algebra lift, with these two specified maps. Its algebra-map laws fix coefficients and define a unique comparison; no torsor predicate or geometric-point set is introduced.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-coaction, mathlib:Algebra.TensorProduct.lift, mathlib:Algebra.TensorProduct.includeRight, mathlib:Algebra.TensorProduct.ext'.

- TauCeti.RootStack.affineTorsorComparison.test_branch_image (computation): At n=2 over any commutative ring, Θ(t⊗t)=f • (e₁⊗1). In particular the branch parameter f=0 gives zero without a regularity assumption.

Acceptance:

- Θ is defined even at f=0 and over the zero ring. Its coordinate-algebra direction is opposite to the scheme action comparison.

Uses:

- FunctionFieldArithmeticPartII:RS.1/affine-chart: Tests the finite normalized-coframe torsor, where the parameter is a unit.
- TOWER-AFF and FunctionFieldArithmeticPartII:RS.2/kummer-torsor-limit: Supplies the finite unit-parameter torsor equation, not a torsor assertion for arbitrary coarse charts.
- affineTorsorComparison kernel/cokernel criteria: Retains the branch obstruction and detects failure of kernel base change.

API:

- TauCeti.RootStack.affineTorsorComparison.left_root (simp): Θ(x⊗1)=e_1⊗x for the distinguished quotient root x.
- TauCeti.RootStack.affineTorsorComparison.right_factor (simp): Θ(1⊗c)=1⊗c for every c∈B.
- TauCeti.RootStack.affineTorsorComparison.unique (universal-property): Any A-algebra map h:B⊗B→H⊗B satisfying h(b⊗c)=δ(b)(1⊗c) for all b,c equals Θ.

Unit tests:

- TauCeti.RootStack.affineTorsorComparison.test_exponent_one (degenerate): For n=1 and arbitrary f, Θ is bijective; no unit condition is needed.
- TauCeti.RootStack.affineTorsorComparison.test_zero_ring (degenerate): For a subsingleton commutative ring A and every positive n,f, Θ is bijective.
- TauCeti.RootStack.affineTorsorComparison.test_branch_kernel (non-example): For n=2,f=0 over any field k, x⊗x is nonzero but Θ(x⊗x)=0.
- TauCeti.RootStack.affineTorsorComparison.test_regular_nonunit (non-example): For A=Z,n=2,f=2, Θ is injective but not surjective.
- TauCeti.RootStack.affineTorsorComparison.test_nilpotent_parameter (non-example): For A=Z/4,n=2,f=2, the source tensor 2(x⊗x) is nonzero and killed by Θ.
- TauCeti.RootStack.affineTorsorComparison.test_wild_unit (compatibility): For A=F₂,n=2,f=1, Θ is bijective while x−1≠0 and (x−1)²=0 in B. The finite fppf torsor is not thereby étale.
- TauCeti.RootStack.affineTorsorComparison.test_nonflat_kernel (non-example): The injective comparison for Z,n=2,f=2 becomes noninjective for F₂,n=2,f=0. Matrix coefficient change commutes, but kernels need not.
- TauCeti.RootStack.affineTorsorComparison.test_cokernel_nonreduced (computation): For A=Z/8,n=2,f=4, the A-module cokernel is A/(4) and contains z with 2z≠0,4z=0. Neither the reduced quotient F₂ nor the algebra quotient generated by im Θ has this property.

Sources: TV17 §3.1 pp.14–16, finite P=N grading and chart; [Stacks Tag 040N](https://stacks.math.columbia.edu/tag/040N), the unit-parameter finite-free cover. The coordinate calculations are derived here, not asserted to be printed standalone theorems in either source.

#### Pure-tensor comparison formula

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-tmul. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.tmul.

For all b,c∈B, Θ(b⊗c)=δ(b)(1⊗c) in H⊗_A B.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. Evaluate the native tensor lift on b⊗c using lift_tmul. The right input is exactly the native algebra inclusion.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-comparison, mathlib:Algebra.TensorProduct.lift_tmul.

- TauCeti.RootStack.affineTorsorComparison.test_branch_image (computation): At n=2 over any commutative ring, Θ(t⊗t)=f • (e₁⊗1). In particular the branch parameter f=0 gives zero without a regularity assumption.

Acceptance:

- Substitution b=x,c=1 and b=1 recovers the two construction projection APIs.

Sources: TV17 §3.1 pp.14–16, finite P=N grading and chart; [Stacks Tag 040N](https://stacks.math.columbia.edu/tag/040N), the unit-parameter finite-free cover. The coordinate calculations are derived here, not asserted to be printed standalone theorems in either source.

#### Source monic tensor coordinates

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-coordinates. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.source_coordinates.

Every z∈B⊗_A B has a unique coefficient family c:(Fin n×Fin n)→A with z=Σ_(i,j)c_(i,j)(x^i⊗x^j). This existence-and-uniqueness statement includes the zero ring; it does not assert that the polynomial has numerical natural degree n there.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. When A is nontrivial, monicity and n>0 give degree n; reindex the existing AdjoinRoot power basis by Fin n, and take its native tensor product basis.
2. Use its coordinate equivalence for existence and uniqueness. If A is subsingleton then every A-module is subsingleton and there is exactly one coefficient family; prove this branch directly, without the false degree assertion.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-comparison, mathlib:AdjoinRoot.powerBasis', mathlib:Module.Basis.tensorProduct, mathlib:Module.subsingleton, mathlib:Polynomial.monic_X_pow_sub_C, mathlib:Polynomial.natDegree_X_pow_sub_C, mathlib:Module.Basis.reindex, mathlib:Module.Basis.reindex_apply, mathlib:Module.Basis.equivFun, mathlib:Module.Basis.sum_equivFun, mathlib:Module.Basis.equivFun_symm_apply, mathlib:Module.Basis.tensorProduct_apply'.

- TauCeti.RootStack.affineTorsorComparison.test_branch_image (computation): At n=2 over any commutative ring, Θ(t⊗t)=f • (e₁⊗1). In particular the branch parameter f=0 gives zero without a regularity assumption.

Acceptance:

- At n=2 over Z/4 the four source monomials still have unique coefficients; independence is not a field-only claim.

Sources: TV17 §3.1 pp.14–16, finite P=N grading and chart; [Stacks Tag 040N](https://stacks.math.columbia.edu/tag/040N), the unit-parameter finite-free cover. The coordinate calculations are derived here, not asserted to be printed standalone theorems in either source.

#### Target character tensor coordinates

Checked native proof refinement: Split on whether A is subsingleton. In that branch Module.subsingleton makes the tensor module subsingleton, and the coefficient-function module is also subsingleton; the zero family is the unique expansion. In the nontrivial branch n>0 gives natDegree(Xⁿ−f)=n by Polynomial.natDegree_X_pow_sub_C. Polynomial.monic_X_pow_sub_C and AdjoinRoot.powerBasis' supply the actual quotient power basis; reindex its Fin(degree) index by the degree equality. Use the native power-basis vector formula and Module.Basis.reindex_apply to identify each vector as x^i. Module.Basis.tensorProduct and tensorProduct_apply' give the actual pure-tensor basis. The witness is that basis's equivFun(z). sum_equivFun gives its expansion, and equivFun_symm_apply plus injectivity of the inverse equivalence gives coefficient uniqueness. No root-chart carrier or basis axiom is postulated.

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-coordinates. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.target_coordinates.

Every z∈H⊗_A B has a unique coefficient family d:(Fin n×Fin n)→A with z=Σ_(i,k)d_(i,k)(e_i⊗x^k), where e_i is indexed by i modulo n, not by an A-valued root of unity.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. Take the native group-algebra character basis indexed by Multiplicative(ZMod n); reindex through Fin n using the residue value since n>0.
2. Tensor with the native quotient monic basis. The same direct subsingleton branch handles the zero ring. The finite coordinate map gives the stated formula and uniqueness.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-coordinates, mathlib:MonoidAlgebra.basis, mathlib:Module.Basis.tensorProduct, mathlib:AdjoinRoot.powerBasis', mathlib:Module.subsingleton, mathlib:Polynomial.monic_X_pow_sub_C, mathlib:Polynomial.natDegree_X_pow_sub_C, mathlib:Module.Basis.reindex, mathlib:Module.Basis.reindex_apply, mathlib:Module.Basis.equivFun, mathlib:Module.Basis.sum_equivFun, mathlib:Module.Basis.equivFun_symm_apply, mathlib:Module.Basis.tensorProduct_apply', mathlib:MonoidAlgebra.basis_apply, mathlib:ZMod.finEquiv, mathlib:ZMod.val_natCast_of_lt, mathlib:Multiplicative.toAdd.

- TauCeti.RootStack.affineTorsorComparison.test_branch_image (computation): At n=2 over any commutative ring, Θ(t⊗t)=f • (e₁⊗1). In particular the branch parameter f=0 gives zero without a regularity assumption.

Acceptance:

- Over F_p with n=p, all n character vectors remain independent although μ_p(k) has one element.

Sources: TV17 §3.1 pp.14–16, finite P=N grading and chart; [Stacks Tag 040N](https://stacks.math.columbia.edu/tag/040N), the unit-parameter finite-free cover. The coordinate calculations are derived here, not asserted to be printed standalone theorems in either source.

#### Weighted permutation formula

Checked native proof refinement: Handle the subsingleton coefficient ring by Module.subsingleton exactly as for the source coordinates. In the nontrivial branch construct the quotient basis from AdjoinRoot.powerBasis' and reindex by natDegree(Xⁿ−f)=n. Use the existing MonoidAlgebra.basis for all elements of Multiplicative(ZMod n). Reindex characters through Multiplicative.toAdd and the inverse of ZMod.finEquiv n. By ZMod.val_natCast_of_lt, the forward Fin index i corresponds to the canonical residue class of i.val; MonoidAlgebra.basis_apply identifies its vector with e_i. Tensor the actual character and root bases; tensorProduct_apply' fixes the vector e_i⊗x^k. The native equivFun sum and inverse formulas give existence and uniqueness. This uses the group-algebra basis, never the set of A-valued roots of unity.

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-monomial. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.monomial.

For 0≤i,j<n, Θ(x^i⊗x^j)=f^⌊(i+j)/n⌋(e_i⊗x^((i+j) mod n)). The exponent is zero or one. The target index σ(i,j)=(i,(i+j) mod n) is a permutation: its inverse sends (i,k) to (i,k−i) when k≥i and to (i,n+k−i) when k<i.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. Use the pure-tensor formula and the coaction weight law to obtain e_i⊗x^(i+j).
2. Use the actual quotient relation xⁿ=f and Euclidean division i+j=nq+r. Tensor balancing moves f^q to the coefficient.
3. Check the two displayed inverse indices are between zero and n−1, with sum wrapping exactly in the k<i branch. This proves bijectivity of σ without cancellation in A.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-tmul, FunctionFieldArithmeticPartII:RS.0/affine-coaction-weight, mathlib:AdjoinRoot.eval₂_root, FunctionFieldArithmeticPartII:RS.0/affine-root-power-reduction.

- TauCeti.RootStack.affineTorsorComparison.test_branch_image (computation): At n=2 over any commutative ring, Θ(t⊗t)=f • (e₁⊗1). In particular the branch parameter f=0 gives zero without a regularity assumption.

Acceptance:

- The n=2 column (1,1) maps to f times target (1,0), explaining both branch and nonunit obstructions.

Sources: TV17 §3.1 pp.14–16, finite P=N grading and chart; [Stacks Tag 040N](https://stacks.math.columbia.edu/tag/040N), the unit-parameter finite-free cover. The coordinate calculations are derived here, not asserted to be printed standalone theorems in either source.

#### Kernel coefficient criterion

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-kernel-coefficients. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.kernel_coefficients.

For c:(Fin n×Fin n)→A, Θ(Σ c_(i,j)(x^i⊗x^j))=0 iff c_(i,j)=0 when i+j<n and f c_(i,j)=0 when i+j≥n.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. Rewrite the source sum as the specified synthesis inverse. For a zero image, extract the target coefficient at σp and use the complete coefficient table.
2. The wrap/lower equivalence gives precisely the nonwrapping zero and wrapping f-annihilation conditions.
3. Conversely evaluate every target coefficient q using σ⁻¹q and apply the assumed equations. Injectivity of the native target coordinate equivalence gives the zero image.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-coordinates, FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-coordinates, FunctionFieldArithmeticPartII:RS.0/affine-torsor-monomial, FunctionFieldArithmeticPartII:RS.0/affine-torsor-coefficient-map, FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-synthesis, FunctionFieldArithmeticPartII:RS.0/affine-torsor-permutation-wrap.

- TauCeti.RootStack.affineTorsorComparison.test_branch_image (computation): At n=2 over any commutative ring, Θ(t⊗t)=f • (e₁⊗1). In particular the branch parameter f=0 gives zero without a regularity assumption.

Acceptance:

- The coefficient 2 in wrapping coordinate (1,1) lies in the kernel for A=Z/4,f=2.

Sources: TV17 §3.1 pp.14–16, finite P=N grading and chart; [Stacks Tag 040N](https://stacks.math.columbia.edu/tag/040N), the unit-parameter finite-free cover. The coordinate calculations are derived here, not asserted to be printed standalone theorems in either source.

#### Image coefficient criterion

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-image-coefficients. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.image_coefficients.

For d:(Fin n×Fin n)→A, Σ d_(i,k)(e_i⊗x^k) belongs to the A-linear range of Θ iff d_(i,k)∈fA for every k<i. There is no restriction on coordinates with k≥i.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. For a preimage z, use its actual source coordinates in the coefficient table. Every lower target coefficient is f times the source coefficient at σ⁻¹q.
2. Conversely choose a factor for each of the finitely many lower coefficients; use the coefficient itself elsewhere. Define the source family by transport along σ.
3. Synthesize that source family. Its image has exactly the target coefficients by the weighted table and the promoted target-extraction identity. Target coordinate injectivity proves equality.
4. The existing principal-ideal membership criterion identifies these f-multiple conditions with membership in fA.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-coordinates, FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-coordinates, FunctionFieldArithmeticPartII:RS.0/affine-torsor-monomial, mathlib:Ideal.mem_span_singleton', FunctionFieldArithmeticPartII:RS.0/affine-torsor-coefficient-map, FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-extraction.

- TauCeti.RootStack.affineTorsorComparison.test_branch_image (computation): At n=2 over any commutative ring, Θ(t⊗t)=f • (e₁⊗1). In particular the branch parameter f=0 gives zero without a regularity assumption.

Acceptance:

- At f=0 every strictly lower target coordinate must vanish, but upper and diagonal coordinates remain unrestricted.

Sources: TV17 §3.1 pp.14–16, finite P=N grading and chart; [Stacks Tag 040N](https://stacks.math.columbia.edu/tag/040N), the unit-parameter finite-free cover. The coordinate calculations are derived here, not asserted to be printed standalone theorems in either source.

#### Coordinate kernel equivalence

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-kernel. theorem. Native name: TauCeti.RootStack.affineTorsorComparison.kernel_equiv.

Let W={(i,j)∈Fin n×Fin n:n≤i+j}. The native A-linear kernel of Θ is A-linearly equivalent to functions W→ann_A(f), where ann_A(f) is the kernel of multiplication by f on A. The forward map sends a kernel tensor to its W-coordinates in the source monic basis.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. Map a kernel tensor to its unique wrapping coefficients, bundled in the multiplication kernel by the coefficient criterion.
2. Define the inverse by extension by zero outside W and source basis expansion. The criterion proves kernel membership. Unique coordinates prove both inverses and linearity.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-kernel-coefficients, FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-coordinates.

- TauCeti.RootStack.affineTorsorComparison.test_branch_image (computation): At n=2 over any commutative ring, Θ(t⊗t)=f • (e₁⊗1). In particular the branch parameter f=0 gives zero without a regularity assumption.

Acceptance:

- At n=1 W is empty, so the kernel is zero for every f, including f=0.

Sources: TV17 §3.1 pp.14–16, finite P=N grading and chart; [Stacks Tag 040N](https://stacks.math.columbia.edu/tag/040N), the unit-parameter finite-free cover. The coordinate calculations are derived here, not asserted to be printed standalone theorems in either source.

#### Coordinate module cokernel equivalence

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-cokernel. theorem. Native name: TauCeti.RootStack.affineTorsorComparison.cokernel_equiv.

Let L={(i,k)∈Fin n×Fin n:k<i}. The native A-module quotient (H⊗_A B)/range_A(Θ) is A-linearly equivalent to functions L→A/(f). On a target basis expansion its value at (i,k) is d_(i,k) modulo (f). This is not a quotient algebra, an orbit set or the reduced quotient of A/(f).

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. Define the A-linear map from the target module to L-indexed residues by taking exactly the strictly lower coefficients.
2. Lift each of the finitely many residues and set all other coordinates to zero to prove surjectivity. The image coefficient criterion identifies its kernel with range_A Θ.
3. Apply the native first isomorphism theorem and transport along this equality. Its formula on quotient representatives is the displayed residue map. The algebra ideal generated by range Θ contains 1 and would instead kill the whole algebra.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-image-coefficients, FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-coordinates, mathlib:LinearMap.quotKerEquivOfSurjective, mathlib:Submodule.Quotient.mk, mathlib:Ideal.mem_span_singleton'.

- TauCeti.RootStack.affineTorsorComparison.test_branch_image (computation): At n=2 over any commutative ring, Θ(t⊗t)=f • (e₁⊗1). In particular the branch parameter f=0 gives zero without a regularity assumption.

Acceptance:

- For Z/8,f=4,n=2 the cokernel retains an element of additive order four, rejecting reduction to F₂.

Sources: TV17 §3.1 pp.14–16, finite P=N grading and chart; [Stacks Tag 040N](https://stacks.math.columbia.edu/tag/040N), the unit-parameter finite-free cover. The coordinate calculations are derived here, not asserted to be printed standalone theorems in either source.

#### Sharp injectivity criterion

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-injective. theorem. Native name: TauCeti.RootStack.affineTorsorComparison.injective_iff.

The A-algebra comparison Θ is injective iff n=1 or the map a↦fa on A is injective.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. For n=1 every coefficient is nonwrapping, so the kernel criterion makes the kernel zero.
2. For n>1 the source position (1,n−1) is wrapping. Place a−b there; if fa=fb the kernel criterion kills its actual synthesized tensor. Injectivity and source coefficient extraction imply a=b.
3. Conversely apply the kernel criterion to the source coordinate family of z−w. Injectivity of multiplication by f kills every wrapping coefficient, and target equality gives z=w.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-kernel-coefficients, FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-coordinates, FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-synthesis.

- TauCeti.RootStack.affineTorsorComparison.test_branch_image (computation): At n=2 over any commutative ring, Θ(t⊗t)=f • (e₁⊗1). In particular the branch parameter f=0 gives zero without a regularity assumption.

Acceptance:

- For Z,n=2,f=2 the map is injective although f is not a unit.

Sources: TV17 §3.1 pp.14–16, finite P=N grading and chart; [Stacks Tag 040N](https://stacks.math.columbia.edu/tag/040N), the unit-parameter finite-free cover. The coordinate calculations are derived here, not asserted to be printed standalone theorems in either source.

#### Sharp surjectivity criterion

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-surjective. theorem. Native name: TauCeti.RootStack.affineTorsorComparison.surjective_iff.

The comparison Θ is surjective iff n=1 or f is a unit in A.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. For n=1 no strictly lower position exists; the image criterion gives every preimage.
2. For n>1 synthesize the target family single((1,0),1). Surjectivity and the image criterion give 1=fa for some a. The pinned commutative-ring unit criterion gives IsUnit f.
3. Conversely a right inverse of f multiplies each lower target coefficient to an explicit factor; apply the image criterion and target synthesis to an arbitrary native target element.
4. The zero ring is included, and no inverse of n enters.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-image-coefficients, FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-synthesis, mathlib:isUnit_iff_exists_inv, mathlib:IsUnit.exists_right_inv.

- TauCeti.RootStack.affineTorsorComparison.test_branch_image (computation): At n=2 over any commutative ring, Θ(t⊗t)=f • (e₁⊗1). In particular the branch parameter f=0 gives zero without a regularity assumption.

Acceptance:

- For Z,n=2,f=2 the target e_1⊗1 is not in the image.

Sources: TV17 §3.1 pp.14–16, finite P=N grading and chart; [Stacks Tag 040N](https://stacks.math.columbia.edu/tag/040N), the unit-parameter finite-free cover. The coordinate calculations are derived here, not asserted to be printed standalone theorems in either source.

#### Sharp bijectivity criterion

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-bijective. theorem. Native name: TauCeti.RootStack.affineTorsorComparison.bijective_iff.

The comparison Θ is bijective iff n=1 or f is a unit in A; invertibility of n is unnecessary.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. Bijectivity implies surjectivity and the preceding criterion.
2. Conversely a unit has injective multiplication by multiplying an equality by its inverse. Combine the injectivity and surjectivity criteria, including the exponent-one alternative.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-injective, FunctionFieldArithmeticPartII:RS.0/affine-torsor-surjective.

- TauCeti.RootStack.affineTorsorComparison.test_branch_image (computation): At n=2 over any commutative ring, Θ(t⊗t)=f • (e₁⊗1). In particular the branch parameter f=0 gives zero without a regularity assumption.

Acceptance:

- For F₂,n=2,f=1 the comparison is bijective despite the nilpotent x−1 in B.

Sources: TV17 §3.1 pp.14–16, finite P=N grading and chart; [Stacks Tag 040N](https://stacks.math.columbia.edu/tag/040N), the unit-parameter finite-free cover. The coordinate calculations are derived here, not asserted to be printed standalone theorems in either source.

#### Unit-parameter algebra inverse

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-unit-inverse. theorem. Native name: TauCeti.RootStack.affineTorsorComparison.unit_inverse.

For a specified unit v∈A×, f=v, there is an A-algebra equivalence E:B⊗B≃H⊗B whose forward homomorphism is Θ. Its inverse sends e_1⊗1 to x⊗(v⁻¹x^(n−1)) and 1⊗b to 1⊗b for every b∈B.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. Put X=x⊗1 and Y=1⊗x in B⊗B. Since Yⁿ=v, its explicit inverse is 1⊗v⁻¹x^(n−1). Thus χ=XY⁻¹ is a unit with χⁿ=1.
2. Use the existing native μ_n points equivalence to obtain the A-algebra map H→B⊗B taking e_1 to χ. Tensor-lift it with b↦1⊗b.
3. Check the two composites on X,Y and on e_1⊗1,1⊗x using the pure-tensor formula. Quotient and tensor extensionality and cyclic character generation give identity. No polynomial-quotient identification of H is assumed and no inverse of n is used.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-tmul, FunctionFieldArithmeticPartII:RS.0/affine-torsor-bijective, FunctionFieldArithmeticPartII:RS.0/affine-coaction-weight, FunctionFieldArithmeticPartII:RS.0/affine-coaction, mathlib:AdjoinRoot.algHom_ext, mathlib:Algebra.TensorProduct.lift, tauceti:TauCeti.RootsOfUnityGroup.pointsMulEquiv, tauceti:TauCeti.RootsOfUnityGroup.pointsMulEquiv_symm_apply_single_generator.

- TauCeti.RootStack.affineTorsorComparison.test_branch_image (computation): At n=2 over any commutative ring, Θ(t⊗t)=f • (e₁⊗1). In particular the branch parameter f=0 gives zero without a regularity assumption.

Acceptance:

- The inverse is fixed by its generator formulas, rather than an unrelated abstract algebra equivalence.

Sources: TV17 §3.1 pp.14–16, finite P=N grading and chart; [Stacks Tag 040N](https://stacks.math.columbia.edu/tag/040N), the unit-parameter finite-free cover. The coordinate calculations are derived here, not asserted to be printed standalone theorems in either source.

#### Weighted comparison determinant

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-determinant. theorem. Native name: TauCeti.RootStack.affineTorsorComparison.determinant.

In the specified source and target pair-indexed bases, the comparison matrix has entry M_(r,c)=f^⌊(c₁+c₂)/n⌋ if r₁=c₁ and r₂=(c₁+c₂) mod n, and zero otherwise. With E=n(n−1)/2, det M=(−1)^((n−1)E) f^E. The same pair ordering is used for rows and columns; this is not an endomorphism determinant without chosen identifications.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. The monomial formula gives a weighted permutation matrix. The Leibniz determinant has only the σ term.
2. In row block i the permutation is the ith power of the cyclic rotation on n letters. Its sign is (−1)^((n−1)i), using the native cycle-range sign at the last index; multiply block signs.
3. The wrapping columns in row i are exactly i, so there are Σ_i i=E weights f and all remaining weights are 1. Multiply weights and signs. Both calculations take place integrally before specialization to A.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-coordinates, FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-coordinates, FunctionFieldArithmeticPartII:RS.0/affine-torsor-monomial, mathlib:Matrix.det_apply, mathlib:Fin.sign_cycleRange.

- TauCeti.RootStack.affineTorsorComparison.test_branch_image (computation): At n=2 over any commutative ring, Θ(t⊗t)=f • (e₁⊗1). In particular the branch parameter f=0 gives zero without a regularity assumption.

Acceptance:

- For n=2 the determinant is −f, including f=0 and nonreduced coefficient rings.

Sources: TV17 §3.1 pp.14–16, finite P=N grading and chart; [Stacks Tag 040N](https://stacks.math.columbia.edu/tag/040N), the unit-parameter finite-free cover. The coordinate calculations are derived here, not asserted to be printed standalone theorems in either source.

#### Rank loss at the zero section

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-zero-rank. theorem. Native name: TauCeti.RootStack.affineTorsorComparison.zero_rank.

For any field k, n≥1 and f=0, dim_k range Θ=n(n+1)/2 and dim_k ker Θ=n(n−1)/2. No characteristic restriction is imposed.

Hypotheses:

- k is any field, n≥1 and f=0.

Construction or proof:

1. At f=0, the nonwrapping columns map to distinct target basis vectors with coefficient 1 and the wrapping columns vanish.
2. The range basis is indexed by the nonwrapping pairs, of cardinal Σ_i(n−i)=n(n+1)/2. Use the native basis-cardinality dimension theorem.
3. The source has dimension n² by the native tensor basis; rank-nullity gives the simultaneous kernel formula, equivalently the wrapping coordinates form its basis.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-monomial, FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-coordinates, FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-coordinates, mathlib:Module.finrank_eq_card_basis, mathlib:LinearMap.finrank_range_add_finrank_ker.

- TauCeti.RootStack.affineTorsorComparison.test_branch_image (computation): At n=2 over any commutative ring, Θ(t⊗t)=f • (e₁⊗1). In particular the branch parameter f=0 gives zero without a regularity assumption.

Acceptance:

- For n=2 over every field, the source dimension is four, the range dimension three and the kernel dimension one.

Sources: TV17 §3.1 pp.14–16, finite P=N grading and chart; [Stacks Tag 040N](https://stacks.math.columbia.edu/tag/040N), the unit-parameter finite-free cover. The coordinate calculations are derived here, not asserted to be printed standalone theorems in either source.

## RS.1. Finite root stacks

The canonical root stack of a line bundle with section, including stack bases, Cartier divisors, affine quotient charts, base change, full fibres and relative coarse space; the invariant-ring calculation via the universal Hopf coaction, valid in arbitrary characteristic; the regular tame DM case. Exact declarations, hypotheses, API and acceptance tests are in the companion packet and reader. Finite root data satisfy effective fpqc descent by the imported QCoh equivalence; algebraicity and coarse properties use their separate owners.

### Root stacks of line bundles and sections

Declaration: FunctionFieldArithmeticPartII:key/root-stacks. Definition.

For n≥1 and a line bundle with section (L,s) on a scheme X or an algebraic stack X, define √[n]{(L,s)/X} on T→X as the groupoid of root objects of (L_T,s_T). Pullback and its coherent isomorphisms define the fibred stack. For an effective Cartier divisor D use (O_X(D),s_D). Arbitrary exponents use the fppf topology; the étale description is asserted only when n is invertible.

Hypotheses:

- The exponent n is a positive integer; the scheme or stack base and all base changes use the stated fppf topology.

Construction or proof:

1. Use the supplier’s line-bundle pullback and descent, retaining the root isomorphism and section equation.
2. Root-object morphisms descend since equality of sheaf maps is local; glue the line bundles, sections and φ effectively.
3. For a stack base, pull back to an atlas and descend with the same definition; do not replace the stack base by a coarse space.

Inputs: FunctionFieldArithmeticPartII:RS.0/root-object, SchemeAndStackFoundations:SF.1, mathlib:CategoryTheory.Pseudofunctor.Grothendieck, mathlib:CategoryTheory.Pseudofunctor.IsStack, mathlib:AlgebraicGeometry.Scheme.fppfTopology, DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products, DiamondsAndVStacks:D0.

API uses:

- Bresciani pp. 135–136 — Finite and infinite DVR roots use arbitrary n.
- Yun–Zhang Appendix A — Square roots of evaluation sections define root symmetric powers.
- AGV Appendix B — Makes root constructions relative over algebraic stacks.

API:

- TauCeti.RootStack.rootStack.object (characterisation): The fibre over T→X is exactly the root-object groupoid of (L_T,s_T).
- TauCeti.RootStack.rootStack.forget (projection): Forget root data to the base T→X.
- TauCeti.RootStack.rootStack.baseChange (functoriality): A base morphism induces pullback of root data with identity/composition coherence.
- TauCeti.RootStack.rootStack.universalRoot (universal-property): The stack carries the universal line bundle, section and n-th-power isomorphism; maps into it are equivalent to such root data.

Unit tests:

- TauCeti.RootStack.rootStack.test_exponent_one (degenerate): The n=1 stack is equivalent to X over X.
- TauCeti.RootStack.rootStack.test_unit_section (compatibility): For (O_X,1), every exponent gives a stack equivalent to X.
- TauCeti.RootStack.rootStack.test_zero_section (non-example): Over an algebraically closed field, (O,0) at invertible n>1 has μ_n automorphisms and is not the coarse point.
- TauCeti.RootStack.rootStack.test_stack_base (compatibility): At n=1 over BG the output is BG, rather than Spec k.

Acceptance:

- At n=1 the projection is an equivalence. For an invertible section it is an equivalence for every n, including p|n.

Planet: Root stacks.

Source:

- AGV08, B.2 pp. 53–54; stack-base sentence p. 54; TV §3 pp. 12–13. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Root stacks as a two-fibre product

Declaration: FunctionFieldArithmeticPartII:RS.1/two-pullback. Comparison.

Let A=[A¹/G_m] classify a line bundle with section and [n]:A→A take its n-th tensor power. The root stack is X×_{A,[n]}A with its universal root. For a stack base this is a two-fibre product, including the specified isomorphism, not an equality pullback of coarse points.

Hypotheses:

- The exponent n is a positive integer; the scheme or stack base and all base changes use the stated fppf topology.

Construction or proof:

1. Unpack a two-pullback object: (x,(M,t),φ) with φ identifying (Mⁿ,tⁿ) and (L_x,s_x).
2. Identify arrows with the root-object compatibility equations.
3. Use the supplier’s two-Yoneda recognition of fibred-category equivalence.

Inputs: FunctionFieldArithmeticPartII:key/root-stacks, SchemeAndStackFoundations:SF.1, DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products, DiamondsAndVStacks:D0.

Acceptance:

- The isomorphism φ is retained, even when all geometric coarse points agree.

Source:

- AGV08, B.2 pp. 53–54 displayed fibre-product diagram. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Base change for finite root stacks

Declaration: FunctionFieldArithmeticPartII:RS.1/base-change. Lemma.

For any f:Y→X there is a canonical equivalence Y×_X√[n]{(L,s)/X}≃√[n]{(f*L,f*s)/Y}, compatible with identity and composition of f.

Hypotheses:

- The exponent n is a positive integer; the scheme or stack base and all base changes use the stated fppf topology.

Construction or proof:

1. Associate the two-fibre products in the classifying diagram.
2. The universal root objects match by pullback; two-Yoneda identifies the comparison and its coherence.

Inputs: FunctionFieldArithmeticPartII:RS.1/two-pullback.

Acceptance:

- Includes inseparable and nonreduced base changes.

Source:

- TV17, Proposition 3.4 p. 13. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Affine quotient presentation

Declaration: FunctionFieldArithmeticPartII:RS.1/affine-chart. Theorem.

If X=Spec A and (L,s) is trivialized with s=f, then √[n]{(L,s)/X}≃[Spec AdjoinRoot(Tⁿ−f)/μ_n], with the diagonalizable action already constructed. This is a quotient stack with torsors, not an orbit set.

Hypotheses:

- The exponent n is a positive integer; the scheme or stack base and all base changes use the stated fppf topology.

Construction or proof:

1. Use root-trivialization-equation and root-arrow-scalars on native trivializations: objects have unit u with u zⁿ=f and arrows have z_b=w z_a, u_b wⁿ=u_a. The generic quotient-stack/torsor construction remains SF.1; these scalar equations are its actual root-specific input.
2. Use the affine coaction and its laws. In trivial coordinates φ(eⁿ)=u with u a unit and section b e satisfying u bⁿ=f. Compatible normalized coframes e↦a form Spec A[a]/(aⁿ−u), which is the unit-parameter torsor by affine-torsor-unit-inverse and the imported finite-free/torsor criterion. The equivariant root-chart coordinate is x↦ab. It scales with weight one. Do not treat Spec A[x]/(xⁿ−f) as a torsor over Spec A at the branch locus.
3. On the torsor the root section is a function t satisfying tⁿ=f.
4. Conversely descend the trivial root line and function on an equivariant torsor; show the two operations inverse on objects and arrows.

Inputs: FunctionFieldArithmeticPartII:RS.1/two-pullback, FunctionFieldArithmeticPartII:RS.0/affine-action, SchemeAndStackFoundations:SF.1, FunctionFieldArithmeticPartII:RS.0/affine-coaction-counit, FunctionFieldArithmeticPartII:RS.0/affine-coaction-coassoc, FunctionFieldArithmeticPartII:RS.0/native-point-action, FunctionFieldArithmeticPartII:RS.0/root-trivialization-equation, FunctionFieldArithmeticPartII:RS.0/root-arrow-scalars, DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products, DiamondsAndVStacks:D0, AlgebraicModuliForArithmeticGeometry:R09.4, FunctionFieldArithmeticPartII:RS.0/affine-torsor-unit-inverse.

Acceptance:

- When f=0 the chart is Spec A[t]/tⁿ; its nilpotents remain present.

Planet: Affine root-stack charts.

Source:

- AGV08, B.2 p. 54; TV Corollary 3.13 p. 16, P=N. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Full and reduced root-stack fibres

Declaration: FunctionFieldArithmeticPartII:RS.1/closed-fibre. Theorem.

For a geometric point x with s(x)=0, the full fibre is [Spec κ(x)[t]/tⁿ /μ_n]. Its reduction is Bμ_n. If s(x)≠0 the fibre is the point. For n>1 the full closed fibre must not be identified with its reduced gerbe.

Hypotheses:

- The exponent n is a positive integer; the scheme or stack base and all base changes use the stated fppf topology.

Construction or proof:

1. Pull the chart back to the geometric field, keeping the quotient ring tⁿ.
2. For s(x)=0 pass to the reduction t=0, then identify the residual classifying gerbe.
3. For s(x)≠0 the solution scheme is a μ_n-torsor and its quotient stack is the point.

Inputs: FunctionFieldArithmeticPartII:RS.1/base-change, FunctionFieldArithmeticPartII:RS.1/affine-chart, SchemeAndStackFoundations:SF.1, DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products, DiamondsAndVStacks:D0.

Acceptance:

- Over Q at n=2 the full fibre has t≠0 and t²=0; only its reduction is Bμ₂.

Planet: Root-stack fibres.

Source:

- AGV08, B.2 p. 54 closed-locus discussion; YZ19 A.1.3 pp. 515–516 corrected; B24 p. 135. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Coarse-space projection

Declaration: FunctionFieldArithmeticPartII:RS.1/coarse-space. Theorem.

For a scheme base X, the projection of the root stack to X is its coarse-space morphism. For an algebraic-stack base, it is relative coarse over X: after scheme base change it has the preceding coarse property. It is not an assertion that X is an absolute algebraic space.

Hypotheses:

- The exponent n is a positive integer; the scheme or stack base and all base changes use the stated fppf topology.

Construction or proof:

1. Apply the affine-invariants theorem to the actual Hopf coaction, in arbitrary characteristic. The native monic basis also gives faithful coefficient inclusion in the nontrivial case.
2. Apply the supplier’s diagonalizable quotient coarse-space theorem, with its universal property; glue across trivializations.
3. Use base change to interpret the stack-base statement relatively.

Inputs: FunctionFieldArithmeticPartII:RS.1/affine-chart, FunctionFieldArithmeticPartII:RS.1/base-change, SchemeAndStackFoundations:SF.1, FunctionFieldArithmeticPartII:RS.1/affine-invariants, AlgebraicModuliForArithmeticGeometry:R09.5.

Acceptance:

- At n=1 over BG the projection is identity BG; the absolute coarse space remains the coarse space of BG.

Source:

- TV17, §3 p. 12 saturated finite roots; Corollary 3.13 p. 16. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Regularity and the tame DM condition

Declaration: FunctionFieldArithmeticPartII:RS.1/regular-dm. Theorem.

If X is regular and D is a regular effective Cartier divisor, √[n]{(O(D),s_D)/X} is regular; when n is invertible on X it is Deligne–Mumford with μ_n inertia over D and trivial inertia outside D. If a geometric branch point has characteristic dividing n, its μ_n inertia is not étale, so the stack is not DM there. An empty divisor still gives X in every characteristic.

Hypotheses:

- The exponent n is a positive integer; the scheme or stack base and all base changes use the stated fppf topology.

Construction or proof:

1. Locally choose a regular parameter f cutting out D; the equation tⁿ=f replaces that parameter and gives a regular chart.
2. For invertible n the finite diagonalizable stabilizer is étale; descend regularity through the atlas.
3. At an actual branch point use the computed μ_n inertia and its nonreduced characteristic-dividing part to obstruct the DM diagonal.

Inputs: FunctionFieldArithmeticPartII:RS.1/affine-chart, FunctionFieldArithmeticPartII:RS.1/closed-fibre, SchemeAndStackFoundations:SF.1, AlgebraicModuliForArithmeticGeometry:R09.4.

Acceptance:

- On a DVR the n=2 root is regular in odd residue characteristic; the assertion is not that arbitrary sections cut regular divisors.

Source:

- AGV08, B.2 p. 54 smooth/normal-crossing root construction; YZ19 A.1.4 pp. 516–517. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Invariants of an affine root chart

Declaration: FunctionFieldArithmeticPartII:RS.1/affine-invariants. Theorem.

For every b∈B=A[t]/(tⁿ−f), δ(b)=1⊗b if and only if b=algebraMap(a) for some a∈A. Thus the scheme-theoretic invariant subalgebra is precisely the coefficient image, for all commutative A, f∈A and n≥1, including characteristic dividing n.

Hypotheses:

- A is any commutative ring, f∈A and n≥1. No reducedness, nonzerodivisor or invertibility-of-n hypothesis is imposed.

Construction or proof:

1. Separate the subsingleton coefficient-ring case: its unital algebra B and tensor algebra are subsingleton, so both assertions hold with a=0. This avoids invoking the polynomial degree theorem without its nontriviality hypothesis.
2. For nontrivial A, Xⁿ−f is monic and has nat-degree n. Import the native monic AdjoinRoot power basis and reindex along that equality to write b uniquely as ∑_{0≤i<n} a_i t^i. The generic quotient basis is already library mathematics.
3. Use the weight lemma and the tensor-product basis of the native group-algebra basis and root power basis. In δ(b), a_i occurs at (i mod n,i); in 1⊗b it occurs at (0,i). For 0<i<n these index pairs differ, forcing a_i=0. This remains valid with torsion or nilpotents; it never divides by n or averages over field-valued points.
4. Only a_0 remains, giving b=algebraMap(a_0). Conversely the A-algebra-map law and tensor scalar relation give δ(algebraMap(a))=1⊗algebraMap(a).

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-coaction, FunctionFieldArithmeticPartII:RS.0/affine-coaction-weight, mathlib:Polynomial.monic_X_pow_sub_C, mathlib:Polynomial.natDegree_X_pow_sub_C, mathlib:AdjoinRoot.powerBasis', mathlib:MonoidAlgebra.basis, mathlib:Module.Basis.tensorProduct.

Acceptance:

- At n=1 every element is a coefficient. At f=0 the nilpotent root powers remain independent. In characteristic p, field-point invariance is strictly weaker than δ-invariance.

Planet: Affine root invariants.

Source:

- TV17, §3.1 pp. 14–16, character grading before Lemma 3.7 and finite chart of Corollary 3.13, P=N. Root-specific coordinate calculation derived here from the finite P=N character grading. Native Hopf, quotient and basis declarations are imported, not rebuilt. This is not a claimed verbatim theorem of the paper.

### Fpqc descent of finite root data

Declaration: FunctionFieldArithmeticPartII:RS.1/root-fpqc-descent. Theorem.

For every positive n and line bundle with section (L,s), the finite root-object pseudofunctor is a stack for the pinned fpqc topology, including on scheme test objects over a stack base. Thus its fppf restriction and its fpqc construction give the same root objects and arrows on every test scheme; the stronger descent assertion is a theorem, not an automatic change of topology.

Hypotheses:

- Any fpqc scheme cover; a fixed (L,s) and positive n.
- Tensor and unit pullback comparisons are the explicit JAC-A contract.

Construction or proof:

1. Apply the imported QCoh descent equivalence to the root line; rank-one finite-local-free detection makes the descended module invertible.
2. Regard a section as a module map O→M. Fullness descends that map, and the unit comparison identifies its domain.
3. Tensor/pullback comparisons identify the power of the descended line with the descent of the local powers. Descend the power isomorphisms and their inverses using full faithfulness.
4. The displayed section equation holds after the covering pullbacks; faithfulness makes it hold globally.
5. Apply the same full faithfulness to isomorphisms of root data and check their section and power equations; this proves effective object descent and sheaf descent for arrows.

Inputs: FunctionFieldArithmeticPartII:key/root-stacks, mathlib:AlgebraicGeometry.Scheme.fpqcTopology, AlgebraicModuliForArithmeticGeometry:R09.3/fpqc-quasicoherent-descent, AlgebraicModuliForArithmeticGeometry:R09.3/finite-locally-free-descent, FunctionFieldArithmeticPartII:RS.0/tensor-power, FunctionFieldArithmeticPartII:RS.0/section-power.

Acceptance:

- No reducedness, Noetherian or invertibility-of-the-exponent hypothesis is introduced.

Planet: Fpqc root descent.

Source:

- TV17, Proposition3.10 proof p.16 and Definition3.8 p.15; fpqc quotient description; QCoh supplier is Stacks023T. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

## RS.2. Infinite root stacks and DVR fibres

Divisibility transitions and coherent inverse limits; finite DVR reduced fibres and the infinite reduced gerbe, with neutralizations distinguished from canonical constructions. Exact declarations, hypotheses, API and acceptance tests are in the companion packet and reader. Native finite-free affine transition maps and their iterated-quotient basis; infinite affine fpqc quotient; factorial reindexing; compatible Kummer-torsor/class comparisons. Infinite H1 is fpqc, finite Kummer is fppf; the all-roots-of2 example rejects a change to fppf infinite torsors.

### Divisibility transition morphisms

Declaration: FunctionFieldArithmeticPartII:RS.2/transition. Construction.

For positive m,n the transition √[mn]{(L,s)}→√[n]{(L,s)} sends (M,t,φ) to (Mᵐ,tᵐ,φ), using the coherent identification (Mᵐ)ⁿ≅Mᵐⁿ. Transitions are compatible with base change and with multiplication of positive integers.

Hypotheses:

- The exponent n is a positive integer; the scheme or stack base and all base changes use the stated fppf topology.

Construction or proof:

1. Use tensor-power reassociation from the line-bundle supplier.
2. Apply the same reassociation to the section equation.
3. The supplier’s monoidal coherence identifies composite transitions on root objects and arrows.

Inputs: FunctionFieldArithmeticPartII:key/root-stacks, FunctionFieldArithmeticPartII:RS.0/tensor-power, FunctionFieldArithmeticPartII:RS.0/section-power, FunctionFieldArithmeticPartII:RS.1/base-change.

API uses:

- TV Proposition 3.5 — Provides the compatible diagram whose inverse limit is the infinite root stack.
- Bresciani p. 135 — Transition maps identify the finite DVR root tower.

API:

- TauCeti.RootStack.transition.object (simp): The root line and section become Mᵐ and tᵐ.
- TauCeti.RootStack.transition.one (simp): The m=1 transition is the identity.
- TauCeti.RootStack.transition.comp (functoriality): Transitions for a and b compose to the transition for ab with the specified coherence.

Unit tests:

- TauCeti.RootStack.transition.test_identity (degenerate): Transition from n to n is identity.
- TauCeti.RootStack.transition.test_four_to_two (computation): A fourth root (M,t) maps to the square root (M²,t²).
- TauCeti.RootStack.transition.test_base_change (compatibility): Pulling a transition back to Y gives the transition of the pulled-back section.

Acceptance:

- The map is over X; n divides mn, and the direction goes from the finer root to the coarser root.

Source:

- TV17, Proposition 3.2 and divisibility functors p. 13. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Infinite root stacks

Declaration: FunctionFieldArithmeticPartII:RS.2/infinite-root-stack. Definition.

Define √[infinity]{(L,s)/X} as the two-inverse limit of the finite root stacks indexed by positive integers ordered by divisibility, on the fpqc scheme site. Its objects over T are compatible finite root objects with transition isomorphisms satisfying cocycles; arrows are compatible systems of root isomorphisms. It is an fpqc stack, hence also an fppf stack by restriction, and is not asserted to be an algebraic stack of finite presentation. Its affine quotient uses fpqc torsors.

Hypotheses:

- All finite exponents are positive. Infinite root objects and quotient torsors use the fpqc scheme site.

Construction or proof:

1. Use the already planned compatible-family carrier, retaining objects, arrows and unit/composition equations.
2. Every finite root is an fpqc stack by root-fpqc-descent. Apply the imported limit-stack-descent theorem to those components and their finite transitions.
3. For a single effective Cartier divisor, TV17 Proposition3.5 identifies the compatible system with its logarithmic infinite root. The local quotient comparison is its separate infinite-affine-quotient leaf.

Inputs: FunctionFieldArithmeticPartII:RS.2/transition, mathlib:CategoryTheory.Pseudofunctor.IsStack, DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products, DiamondsAndVStacks:D0, FunctionFieldArithmeticPartII:RS.1/root-fpqc-descent, AlgebraicModuliForArithmeticGeometry:R09.4/limit-stack-descent.

API uses:

- Bresciani p. 135 — Defines the specialization gerbe for a DVR.
- TV Proposition 3.5 — Identifies the construction with the logarithmic infinite root in the single-divisor case.

API:

- TauCeti.RootStack.infiniteRootStack.projection (projection): Project a coherent system to its n-th root.
- TauCeti.RootStack.infiniteRootStack.lift (universal-property): A compatible family of maps into the finite roots determines a map into the two-limit, with compatible 2-morphisms.
- TauCeti.RootStack.infiniteRootStack.baseChange (functoriality): The two-limit commutes with base change in X.

Unit tests:

- TauCeti.RootStack.infiniteRootStack.test_unit_section (degenerate): The infinite root of (O_X,1) is X.
- TauCeti.RootStack.infiniteRootStack.test_projection (compatibility): Its n-th projection followed by a finite transition is the corresponding lower projection.
- TauCeti.RootStack.infiniteRootStack.test_coherence (non-example): Choosing unrelated n-th roots without transition isomorphisms does not define an infinite root object.

Acceptance:

- A set-theoretic inverse limit of isomorphism classes discards coherent automorphism data and is insufficient.

Planet: Infinite root stacks.

Source:

- TV17, Definition 3.3 p. 13 and Proposition 3.5 p. 14. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Base change for infinite root stacks

Declaration: FunctionFieldArithmeticPartII:RS.2/infinite-base-change. Lemma.

For f:Y→X the canonical map √[∞]{(f*L,f*s)/Y}→Y×_X√[∞]{(L,s)/X} is an equivalence, compatible with every finite projection.

Hypotheses:

- Finite roots are defined fppf and satisfy the stronger fpqc descent theorem. Infinite systems and infinite torsors use fpqc descent.

Construction or proof:

1. Apply finite base change at every exponent.
2. The comparisons preserve all transition isomorphisms and cocycles.
3. Construct inverse functors componentwise on compatible systems.

Inputs: FunctionFieldArithmeticPartII:RS.2/infinite-root-stack, FunctionFieldArithmeticPartII:RS.1/base-change.

Acceptance:

- This includes the closed fibre of a mixed-characteristic DVR.

Source:

- TV17, Proposition 3.4 p. 13. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### DVR roots and change of uniformizer

Declaration: FunctionFieldArithmeticPartII:RS.2/dvr-roots. Comparison.

For a DVR A with uniformizer π and closed divisor D, the n-th root is [Spec A[t]/(tⁿ−π)/μ_n]. Replacing π by uπ gives a canonically equivalent stack as a root of the same Cartier pair; it does not require choosing an n-th root of u in A.

Hypotheses:

- The exponent n is a positive integer; the scheme or stack base and all base changes use the stated fppf topology.

Construction or proof:

1. Identify the two trivializations of O(D), whose change-of-frame is u.
2. Transport the Cartier pair through this isomorphism and use the root universal property.
3. Keep the torsor of possible chart lifts rather than choosing a nonexistent scalar root of u.

Inputs: FunctionFieldArithmeticPartII:RS.1/affine-chart, FunctionFieldArithmeticPartII:key/root-stacks.

Acceptance:

- For A=Z_(p), a unit need not have an n-th root; the stack construction is nevertheless uniformizer-independent.

Source:

- B24, p. 135 finite-root definition and uniformizer independence. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### The infinite reduced DVR fibre

Declaration: FunctionFieldArithmeticPartII:RS.2/dvr-infinite-gerbe. Theorem.

The reduced closed fibre of the infinite root of a DVR with residue field k is the inverse system of the root gerbes of the normal line, banded by lim_n μ_n=Ẑ(1). It is noncanonically equivalent to B_kẐ(1); a chosen trivialization of the normal line gives a compatible neutralization. The neutralization is not part of the canonical root stack.

Hypotheses:

- Finite roots are defined fppf and satisfy the stronger fpqc descent theorem. Infinite systems and infinite torsors use fpqc descent.

Construction or proof:

1. Use the normal line to identify each reduced finite closed fibre with its n-th-root gerbe.
2. A trivialization of that one-dimensional k-space supplies compatible trivial root objects at all n.
3. The automorphisms form lim μ_n, and coherent descent gives the banded gerbe; use the source’s reduced-fibre convention for the infinite limit.

Inputs: FunctionFieldArithmeticPartII:RS.2/dvr-roots, FunctionFieldArithmeticPartII:RS.1/closed-fibre, FunctionFieldArithmeticPartII:RS.2/infinite-base-change, FunctionFieldArithmeticPartII:RS.2/infinite-root-stack, SchemeAndStackFoundations:SF.1.

Acceptance:

- The full fibre retains nilpotent finite charts; only the reduced gerbe is identified with the classifying gerbe.

Planet: Infinite DVR root gerbe.

Source:

- B24, p. 135–136 reduced fibre H_c and its band. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Kummer classes of infinite-gerbe points

Declaration: FunctionFieldArithmeticPartII:RS.2/dvr-kummer-classes. Comparison.

After choosing a neutralization of the infinite reduced DVR gerbe over k, its k-points up to isomorphism identify with H1_fpqc(k,G), where G=lim_n μ_n, and with lim_n H1_fppf(k,μ_n)=lim_n k×/(k×)^n. Infinite torsors are fpqc; the finite Kummer calculation is fppf. The full groupoid retains G(k) automorphisms, and changing the neutralization changes the chosen origin.

Hypotheses:

- A DVR with residue field k of arbitrary characteristic and a chosen compatible neutralization.
- G is the fpqc inverse-limit sheaf of all μ_n, with power transition maps.

Construction or proof:

1. The neutralization identifies the reduced gerbe with fpqc G-torsors.
2. The Kummer torsor-limit comparison gives its actual finite tower, including the quotient identifications.
3. Apply kummer-limit-iso-detection for injectivity on classes and kummer-limit-class-lift for surjectivity; do not commute isomorphism classes with limits without these leaves.
4. Apply the exact finite fppf Kummer comparison at each exponent and retain its transition maps. The result is an identification with a chosen origin, not a loss of the automorphism groupoid.

Inputs: FunctionFieldArithmeticPartII:RS.2/dvr-infinite-gerbe, SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.2, FunctionFieldArithmeticPartII:RS.2/kummer-torsor-limit, FunctionFieldArithmeticPartII:RS.2/kummer-limit-iso-detection, FunctionFieldArithmeticPartII:RS.2/kummer-limit-class-lift.

Acceptance:

- Changing neutralization translates the Kummer classes; no canonical origin is asserted.
- The compatible roots-of2 torsor overQ is retained despite having no fppf local trivialization; H1_fppf(k,G) is not substituted for H1_fpqc(k,G).

Source:

- B24, p. 135–136 displayed H_c(k) and Kummer limit. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Affine divisibility transition

Declaration: FunctionFieldArithmeticPartII:RS.2/affine-transition. Construction.

For B_n=A[T]/(T^n−f) and positive n,m, construct the A-algebra homomorphism j_(n,m):B_n→B_(nm) sending its distinguished root to the mth power of the target root. Constants are unchanged. This is the contravariant affine-chart map for the stack transition from an nmth root to an nth root.

Hypotheses:

- A is any commutative ring; all exponents appearing as denominators are positive.

Construction or proof:

1. In B_(nm), compute (root^m)^n=root^(mn)=f using its defining equation.
2. Apply the native algebra quotient lift, keeping the given A-algebra structures.
3. Use the native algebra-hom extensionality to verify the root/constant specification uniquely.

Inputs: mathlib:AdjoinRoot, mathlib:AdjoinRoot.liftAlgHom, mathlib:AdjoinRoot.eval₂_root, mathlib:AdjoinRoot.algHom_ext.

API uses:

- TV17 Proposition3.2 and Section3.1 — Makes the ring maps in the divisibility inverse system concrete.
- Bresciani p.135 — The finite DVR root tower uses these maps before taking its limit.

API:

- TauCeti.RootStack.affineTransition.root (simp): j_(n,m)(root_n)=root_(nm)^m.
- TauCeti.RootStack.affineTransition.constant (simp): j_(n,m) fixes the image of every coefficient in A.
- TauCeti.RootStack.affineTransition.unique (extensionality): An A-algebra map with the displayed root image equals j_(n,m).

Unit tests:

- TauCeti.RootStack.affineTransition.test_one (degenerate): The m=1 map is identity, with the evident exponent identification.
- TauCeti.RootStack.affineTransition.test_four_to_two (computation): For n=m=2 the coarse chart root maps to the square of the fourth-root chart variable.
- TauCeti.RootStack.affineTransition.test_nilpotent (non-example): For f=0, n=m=2 over a field, the source nilpotent root maps to the nonzero square of the target variable in k[u]/u^4; it is not killed.

Acceptance:

- No reducedness, Noetherian or invertibility-of-the-exponent hypothesis is introduced.

Source:

- TV17, Section3.1 pp.14–16, P=N specialization. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### Composition of affine root transitions

Declaration: FunctionFieldArithmeticPartII:RS.2/affine-transition-composition. Lemma.

With target exponents identified by associativity, j_(nm,k)∘j_(n,m)=j_(n,mk). The m=1 map is identity. These are equalities of actual algebra maps, not merely matches of closed points.

Hypotheses:

- A is any commutative ring; all exponents appearing as denominators are positive.

Construction or proof:

1. Both maps fix every coefficient.
2. Both send root_n to (root_(nmk)^k)^m=root_(nmk)^(mk).
3. Apply the native algebra-hom extensionality; at m=1 its root value is root_n.

Inputs: FunctionFieldArithmeticPartII:RS.2/affine-transition, mathlib:AdjoinRoot.algHom_ext.

Acceptance:

- No reducedness, Noetherian or invertibility-of-the-exponent hypothesis is introduced.

Source:

- TV17, Proposition3.2 p.13 and Section3.1 root charts. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### The transition as an iterated monic quotient

Declaration: FunctionFieldArithmeticPartII:RS.2/affine-transition-iterated. Comparison.

Using j_(n,m) to make B_(nm) a B_n-algebra, there is a B_n-algebra equivalence B_n[U]/(U^m−root_n)≃B_(nm). It sends U to root_(nm), and coefficient root_n to root_(nm)^m.

Hypotheses:

- A is any commutative ring; all exponents appearing as denominators are positive.

Construction or proof:

1. Construct the forward quotient lift by U↦root_(nm); its defining equation is exactly the transition root formula.
2. Give the iterated quotient its inherited A-algebra structure. Its new root has nmth power f, so the native quotient lift constructs the inverse A-algebra map.
3. Check that the inverse respects B_n coefficients by the transition formula, upgrading it to a B_n-algebra map.
4. Check both composites on their distinguished roots using native quotient extensionality.

Inputs: FunctionFieldArithmeticPartII:RS.2/affine-transition, mathlib:AdjoinRoot.liftAlgHom, mathlib:AdjoinRoot.algHom_ext, mathlib:AdjoinRoot.eval₂_root.

Acceptance:

- No reducedness, Noetherian or invertibility-of-the-exponent hypothesis is introduced.

Source:

- TV17, Section3.1 pp.14–16, P=N specialization. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### The finite-free transition basis

Declaration: FunctionFieldArithmeticPartII:RS.2/affine-transition-basis. Construction.

B_(nm), as a B_n-module through j_(n,m), has a specified basis indexed by Fin m, whose ith vector is root_(nm)^i. The assertion includes the zero ring; it supplies a linear equivalence with Fin m→₀B_n.

Hypotheses:

- A is any commutative ring; all exponents appearing as denominators are positive.

Construction or proof:

1. For a nonzero coefficient ring, the monic polynomial U^m−root_n has natDegree m; use the pinned monic power basis.
2. Transport the basis through the iterated quotient equivalence.
3. For a zero coefficient ring both the module and the Finsupp module are singleton; the unique linear equivalence gives the same indexed basis without claiming the polynomial has positive degree.

Inputs: FunctionFieldArithmeticPartII:RS.2/affine-transition-iterated, mathlib:AdjoinRoot.powerBasis'.

API uses:

- Infinite affine root quotient — Faithful flatness of chart transitions ensures the colimit chart is a valid fpqc cover.
- Kummer torsor tower — Finite monic root charts retain effective, nonempty covers without invertibility of n.

API:

- TauCeti.RootStack.affineTransitionBasis.apply (simp): The ith basis vector is root_(nm)^i.
- TauCeti.RootStack.affineTransitionBasis.repr (data): Every element has unique coefficients in B_n at powers 0,…,m−1.
- TauCeti.RootStack.affineTransitionBasis.repr_symm (simp): The inverse coefficient map forms the displayed finite sum of powers.

Unit tests:

- TauCeti.RootStack.affineTransitionBasis.test_one (degenerate): At m=1 the basis has one vector, namely1.
- TauCeti.RootStack.affineTransitionBasis.test_four (computation): At n=m=2 every class is uniquely a+b*u with a,b in B_2.
- TauCeti.RootStack.affineTransitionBasis.test_zeroRing (non-example): For the zero ring the indexed basis is still valid although the defining polynomial has natDegree0; no nontriviality premise excludes this case.

Acceptance:

- No reducedness, Noetherian or invertibility-of-the-exponent hypothesis is introduced.

Source:

- TV17, Section3.1 pp.14–16, P=N specialization. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### Faithful flatness of root chart transitions

Declaration: FunctionFieldArithmeticPartII:RS.2/affine-transition-faithfully-flat. Theorem.

For all positive n,m, j_(n,m):B_n→B_(nm) is finite free and faithfully flat. Its Spec map is finite, flat and surjective. This statement concerns chart morphisms; the corresponding map of root stacks need not be representable.

Hypotheses:

- A is any commutative ring; all exponents appearing as denominators are positive.

Construction or proof:

1. The specified basis gives finite freeness.
2. Fin m is nonempty because m>0; its Finsupp module is faithfully flat by the existing instance.
3. Transport faithful flatness through the coefficient linear equivalence.
4. Use the supplier’s affine ring/scheme comparison for the Spec properties; at a branch point the root-stack map has a nontrivial stabilizer kernel when m>1, so it is not inferred representable.

Inputs: FunctionFieldArithmeticPartII:RS.2/affine-transition-basis, mathlib:Module.FaithfullyFlat.finsupp, mathlib:Module.FaithfullyFlat.of_linearEquiv, SchemeAndStackFoundations:SF.1.

Acceptance:

- No reducedness, Noetherian or invertibility-of-the-exponent hypothesis is introduced.

Planet: Finite-free root transitions.

Source:

- TV17, Section3.1 pp.14–16, P=N specialization. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### Factorial reindexing of the root limit

Declaration: FunctionFieldArithmeticPartII:RS.2/factorial-root-limit. Comparison.

Restriction of compatible root systems from all positive divisibility indices to 1!,2!,3!,… is an equivalence of groupoids, naturally over every test scheme. It preserves actual root arrows and transition isomorphisms, not merely their isomorphism classes.

Hypotheses:

- A fixed pair (L,s), positive divisibility indices and the coherent finite transition maps.

Construction or proof:

1. The factorial subsequence is increasing for divisibility, and each positive n divides N! once N≥n.
2. Extend a factorial root system to level n by taking its finite transition from a factorial multiple. For two choices use a larger factorial and the supplied transition isomorphisms to compare them.
3. The root-system cocycles make this comparison independent of refinements and make the extended transitions coherent.
4. Perform the same extension on arrows; restriction and extension have componentwise natural inverse comparisons.

Inputs: FunctionFieldArithmeticPartII:RS.2/infinite-root-stack, mathlib:Nat.dvd_factorial, mathlib:Nat.factorial_dvd_factorial.

Acceptance:

- No reducedness, Noetherian or invertibility-of-the-exponent hypothesis is introduced.

Source:

- TV17, Proposition3.5 and Remark3.6 p.14, cofinal systems. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### The fpqc Kummer torsor tower

Declaration: FunctionFieldArithmeticPartII:RS.2/kummer-torsor-limit. Theorem.

Over a field k let G=lim_(n|m) μ_n in the fpqc topology, with transition μ_(nm)→μ_n given by the mth power. The groupoid of fpqc G-torsors is equivalent to the two-limit of the groupoids of finite μ_n-torsors, with specified quotient comparisons and their cocycles. No finite-presentation or etale-local-triviality assertion for G is made.

Hypotheses:

- A field k of arbitrary characteristic.
- Infinite torsors are fpqc; finite μ_n torsors may be computed fppf.

Construction or proof:

1. The compatible trivial finite torsors give an actual k-object of the two-limit; nonemptiness is supplied rather than assumed away.
2. Apply the imported affine fpqc limit-gerbe theorem. Its automorphism sheaf at that object is exactly G, because an automorphism is a compatible sequence of finite translations.
3. Use the imported neutralization equivalence with that fixed object. Evaluation at each level is extension of torsors through G→μ_n.
4. On an affine cover the inverse is the compatible affine limit of finite torsors; the exact affine faithful-flat limit contract remains TOWER-AFF.

Inputs: DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products, AlgebraicModuliForArithmeticGeometry:R09.4/classifying-abelian-gerbe, AlgebraicModuliForArithmeticGeometry:R09.4/nonempty-affine-limit-gerbe, AlgebraicModuliForArithmeticGeometry:R09.4/neutralization-equivalence, SchemeAndStackFoundations:SF.1, FunctionFieldArithmeticPartII:RS.2/factorial-root-limit, DiamondsAndVStacks:D0.

Acceptance:

- No reducedness, Noetherian or invertibility-of-the-exponent hypothesis is introduced.

Planet: Infinite Kummer torsors.

Source:

- B24, p.133 fpqc classifying-stack convention; p.135 infinite root gerbe. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### Finite stages detect Kummer tower isomorphisms

Declaration: FunctionFieldArithmeticPartII:RS.2/kummer-limit-iso-detection. Lemma.

Two compatible finite μ_n-torsor towers over a field k are isomorphic if their n-th torsors are isomorphic for every positive n. Individual finite-stage isomorphisms need not be chosen compatibly in advance.

Hypotheses:

- Compatible finite μ_n-torsor towers over a field; equality of their finite-stage isomorphism classes.

Construction or proof:

1. For each n take the set of equivariant k-isomorphisms between the two nth torsors. It is nonempty by the premise.
2. Once one isomorphism is fixed, this set is a torsor for μ_n(k); the pinned roots-of-unity equivalence and finite instance make it finite, even when μ_n is not etale.
3. The coherent tower quotient maps induce the restriction maps on these finite sets. Positive divisibility gives a cofiltered index category.
4. Apply the existing nonempty finite-system theorem to obtain a compatible sequence of isomorphisms. The groupoid limit comparison turns it into the required arrow.

Inputs: FunctionFieldArithmeticPartII:RS.2/kummer-torsor-limit, AlgebraicModuliForArithmeticGeometry:R09.4/classifying-abelian-gerbe, mathlib:nonempty_sections_of_finite_cofiltered_system, mathlib:rootsOfUnityEquivNthRoots.

Acceptance:

- No reducedness, Noetherian or invertibility-of-the-exponent hypothesis is introduced.

Source:

- B24, p.135 H1/Kummer inverse-limit statement, with the native finite-isomorphism proof supplied here. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### Compatible Kummer classes lift to a torsor tower

Declaration: FunctionFieldArithmeticPartII:RS.2/kummer-limit-class-lift. Lemma.

Every element of lim_n H1_fppf(k,μ_n) is the finite-stage class family of a coherent finite torsor tower, hence of an fpqc G-torsor. Compatible classes are converted to actual quotient isomorphisms, rather than treated as a preexisting compatible object.

Hypotheses:

- A field k; a compatible family of finite torsor classes.
- The finite torsor/H1 comparison is the stated SF.2 contract.

Construction or proof:

1. On the factorial subsequence choose a representative torsor at each level.
2. Equality of adjacent pushed-forward classes supplies an equivariant isomorphism from the quotient of the next torsor to the preceding torsor.
3. Compose these adjacent isomorphisms to obtain all transitions; a linearly ordered chain has no additional independent composition choices.
4. Extend the actual tower along the factorial cofinality equivalence and apply the fpqc torsor-limit comparison.

Inputs: FunctionFieldArithmeticPartII:RS.2/factorial-root-limit, FunctionFieldArithmeticPartII:RS.2/kummer-torsor-limit, SchemeAndStackFoundations:SF.2.

Acceptance:

- No reducedness, Noetherian or invertibility-of-the-exponent hypothesis is introduced.

Source:

- B24, p.135 inverse-limit Kummer statement; TV17 Remark3.6 for cofinality. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### The infinite affine fpqc root quotient

Declaration: FunctionFieldArithmeticPartII:RS.2/infinite-affine-quotient. Theorem.

For B_n=A[T]/(T^n−f) with the displayed divisibility maps, put B_infinity=colim_n B_n and G=lim_n μ_n, with its diagonalizable grading action. The infinite root stack of (O_A,f) is [Spec B_infinity/G] as an fpqc quotient stack. Its morphism groupoids and finite projections agree with the two-limit of the finite roots. This is not asserted to be an algebraic stack of finite presentation.

Hypotheses:

- Any commutative ring A and f∈A.
- Infinite quotient and torsors use the fpqc topology; TOWER-AFF is an explicit supplier obligation.

Construction or proof:

1. For every compatible root system over T, form the finite frame torsors respecting its power identifications. Their maps are the finite μ transitions and are affine faithfully flat.
2. The TOWER-AFF contract makes their inverse limit an affine fpqc G-torsor; its universal frames give an equivariant map to Spec B_infinity.
3. Conversely an equivariant G-torsor map supplies the finite root data by finite quotient and the root-coordinate functions.
4. Compare the two constructions on objects and torsor arrows, with their finite-stage and base-change coherence.

Inputs: FunctionFieldArithmeticPartII:RS.2/affine-transition-composition, FunctionFieldArithmeticPartII:RS.2/affine-transition-faithfully-flat, FunctionFieldArithmeticPartII:RS.2/infinite-root-stack, FunctionFieldArithmeticPartII:RS.1/root-fpqc-descent, DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products, SchemeAndStackFoundations:SF.1, DiamondsAndVStacks:D0.

Acceptance:

- No reducedness, Noetherian or invertibility-of-the-exponent hypothesis is introduced.

Planet: Infinite affine root charts.

Source:

- TV17, Definition3.8, Proposition3.10 with proof and Corollary3.13 pp.15–16, P=N. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### A degree bound for roots of two

Declaration: FunctionFieldArithmeticPartII:RS.2/kummer-degree-bound. Lemma.

If K/Q is a finite field extension and x∈K satisfies x^n=2 for positive n, then n≤[K:Q]. In particular no finite extension of Q contains compatible nth roots of2 for every positive n.

Hypotheses:

- K is a field with a Q-algebra structure and finite dimension over Q; n>0.

Construction or proof:

1. The monic integer polynomial X^n−2 satisfies Eisenstein at (2): nonleading coefficients are divisible by2 and its constant coefficient is not divisible by4.
2. Gauss comparison makes X^n−2 irreducible over Q.
3. Its root equation and monicity identify it with minpoly_Q(x).
4. The native degree bound gives n≤finrank_Q K. Choose n larger than that dimension to exclude roots at all levels.

Inputs: mathlib:Polynomial.irreducible_of_eisenstein_criterion, mathlib:Polynomial.IsPrimitive.Int.irreducible_iff_irreducible_map_cast, mathlib:minpoly.eq_of_irreducible_of_monic, mathlib:minpoly.natDegree_le.

Acceptance:

- For K=Q, only the n=1 case can have a root of2. A quadratic field may contain a square root but cannot contain a cube root of2. All positive n, including composite n, are covered by Eisenstein.

Source:

- B24, p.133 finite versus infinite torsor topology; explicit counterexample derivation by the listed Eisenstein and minimal-polynomial statements. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### An infinite Kummer torsor requiring fpqc descent

Declaration: FunctionFieldArithmeticPartII:RS.2/kummer-tower-not-fppf. Theorem.

Over Q, the compatible finite torsors P_n=Spec Q[T]/(T^n−2) define an fpqc G=lim_n μ_n torsor P_infinity. It has no section after any nonempty fppf Q-cover. Each individual P_n is fppf-locally trivial, so replacing all infinite torsors by fppf-locally trivial G-torsors loses this point of the infinite classifying gerbe.

Hypotheses:

- Base field Q; all positive root exponents.
- The finite-type chart and closed-point residue comparison are the exact SF.1 contract.

Construction or proof:

1. The element2 is a unit; each finite root chart is a μ_n torsor. The transition equations provide a coherent tower.
2. The fpqc torsor-limit comparison constructs P_infinity; the finite-free transition calculation also exhibits its affine fpqc cover.
3. Suppose it has a section on a nonempty fppf Q-scheme. Choose a nonempty affine finite-type open chart and a closed point. Its residue field is finite over Q by the pinned Zariski lemma.
4. Specialize the section to that field. It would contain an nth root of2 for every n, contradicting the degree-bound leaf.

Inputs: FunctionFieldArithmeticPartII:RS.2/affine-transition-faithfully-flat, FunctionFieldArithmeticPartII:RS.2/affine-transition-composition, FunctionFieldArithmeticPartII:RS.2/kummer-torsor-limit, FunctionFieldArithmeticPartII:RS.2/kummer-degree-bound, mathlib:finite_of_finite_type_of_isJacobsonRing, SchemeAndStackFoundations:SF.1.

Acceptance:

- Every finite P_n is an fppf torsor, while their actual fpqc limit admits no nonempty fppf trivializing cover. The contradiction retains the finite residue-field degree, rather than choosing a field of unbounded degree.

Source:

- B24, p.133 fpqc necessity for non-finite-type groups; explicit all-roots-of2 example supplied here. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

## GC.0. Root Picard stacks

Graded line bundles with square roots along the reduced finite divisor R; square-action quotient, forgetful gerbe and the version carrying a root section. Exact declarations, hypotheses, API and acceptance tests are in the companion packet and reader.

### The graded root Picard stack

Declaration: FunctionFieldArithmeticPartII:GC.0/root-picard. Definition.

Pic_X^√R(S) is the groupoid of (L,K_R,ι), where L is a line bundle on X×S, K_R a line bundle on R×S and ι:K_R²≅L|_{R×S}. Its degree-d component imposes degree d on every geometric fibre; d ranges over all integers. Tensor product and dual give the graded commutative Picard stack.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Import the ordinary line-bundle Picard stack and restriction to R.
2. Take the root-gerbe two-pullback for the restricted line bundle; do not require a section.
3. Tensor and dual root data with the imported coherent line-bundle isomorphisms.

Inputs: FunctionFieldArithmeticPartII:key/root-stacks, SchemeAndStackFoundations:SF.3, SchemeAndStackFoundations:SF.1, DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products, DiamondsAndVStacks:D0.

API uses:

- YZ19 A.2.2–A.2.3 — Carries the character local system in every integer degree.
- YZ19 A.3.1 — Receives the ramified norm.

API:

- TauCeti.RamifiedClassField.rootPicard.object (constructor): Create (L,K_R,ι) from the two line bundles and the square identification.
- TauCeti.RamifiedClassField.rootPicard.degree (projection): The degree is the fibrewise degree of L, additive under tensor product.
- TauCeti.RamifiedClassField.rootPicard.tensor (structure): Tensor two objects and their root identifications; dual gives inverse up to coherent isomorphism.
- TauCeti.RamifiedClassField.rootPicard.forget (projection): Forget K_R,ι to the ordinary Picard stack.

Unit tests:

- TauCeti.RamifiedClassField.rootPicard.test_empty_R (degenerate): At R=∅ this is the ordinary graded Picard stack.
- TauCeti.RamifiedClassField.rootPicard.test_degree_minus_one (non-example): Negative-degree components contain line bundles and are not declared empty.
- TauCeti.RamifiedClassField.rootPicard.test_stabilizer (characterisation): Over an algebraically closed field with r geometric branch points, forgetting roots has relative stabilizer μ₂^r.

Acceptance:

- Pic^d is a torsor component, with no chosen degree-one point required.

Planet: Root Picard stack.

Source:

- YZ19, Definition A.1 p. 514; A.1.1 p. 515. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Square-action presentation of the root Picard stack

Declaration: FunctionFieldArithmeticPartII:GC.0/square-action-quotient. Theorem.

Let Pic_{X,R} classify (L,γ:L|_R≅O_R). Then Pic_X^√R≃[Pic_{X,R}/[2]Res_{R/k}G_m], where the acting group changes the rigidification through its square. The forgetful morphism to Pic_X is a Res_{R/k}μ₂-gerbe.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Trivialize K_R fppf-locally; ι supplies the rigidification γ.
2. Changing the root-line frame by u changes γ by u², giving the square-action quotient.
3. The kernel is Res μ₂; verify the relative automorphism group and local lift property.

Inputs: FunctionFieldArithmeticPartII:GC.0/root-picard, SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.3, DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products, DiamondsAndVStacks:D0.

Acceptance:

- The unsquared action gives ordinary Pic_X and loses the ramification gerbe.

Planet: Square-action Picard quotient.

Source:

- YZ19, A.1.1 p. 515. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### The root Picard stack with a root section

Declaration: FunctionFieldArithmeticPartII:GC.0/root-picard-section. Definition.

Pic_X^{√R;√R}(S) additionally carries α_R∈Γ(R×S,K_R). It does not carry a global section of L. The zero root section is allowed.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Add the actual section of K_R to the root-Picard objects and require arrows to preserve it.
2. The quotient description is the associated vector bundle with weight-one action on Res A¹ and square action on the rigidification.

Inputs: FunctionFieldArithmeticPartII:GC.0/root-picard, FunctionFieldArithmeticPartII:RS.0/section-power.

API uses:

- YZ19 A.1.5 — The hat Abel–Jacobi map forgets the global section but retains α_R.
- YZ19 A.2.2 — Weighted affine charts use the root-section coordinate.

API:

- TauCeti.RamifiedClassField.rootPicardSection.object (constructor): Adjoin α_R to a root-Picard object, including α_R=0.
- TauCeti.RamifiedClassField.rootPicardSection.forget (projection): Forget α_R to Pic_X^√R.
- TauCeti.RamifiedClassField.rootPicardSection.squareEvaluation (projection): The squared section ι(α_R²) lies in L|_R.

Unit tests:

- TauCeti.RamifiedClassField.rootPicardSection.test_zero (degenerate): Every root-Picard object admits the zero root section.
- TauCeti.RamifiedClassField.rootPicardSection.test_empty_R (compatibility): At R=∅ the forgetful map is an equivalence.
- TauCeti.RamifiedClassField.rootPicardSection.test_weights (non-example): In the rigidified quotient α_R has weight one while the rigidification has weight two.

Acceptance:

- Requiring α_R≠0 or adding a global section changes this moduli problem.

Planet: Root Picard sections.

Source:

- YZ19, A.1.2 p. 515. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

## GC.1. Root divisors and Abel–Jacobi maps

Hat and nonzero-section spaces, evaluation pullbacks, smoothness, symmetric coarse spaces, tensor addition, ordered maps and both Abel–Jacobi maps. Exact declarations, hypotheses, API and acceptance tests are in the companion packet and reader.

### Hat and effective root symmetric powers

Declaration: FunctionFieldArithmeticPartII:GC.1/root-symmetric-space. Definition.

For d≥0 let hatX_d^√R classify (L,K_R,ι,a,α_R) of degree d with a∈Γ(X×S,L) and ι(α_R²)=a|_{R×S}. Define X_d^√R as the open where a is nonzero on every geometric fibre, and U_d^√R as the inverse image of Sym^d(X−R). Hat spaces admit zero global sections and nonreduced bases.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Impose the equality between the squared root section and the restriction of a.
2. Use the ordinary curve supplier to show fibrewise-nonzero sections define relative effective divisors of degree d.
3. Take the inverse image of divisors supported away from R.

Inputs: FunctionFieldArithmeticPartII:GC.0/root-picard-section, SchemeAndStackFoundations:SF.3.

API uses:

- YZ19 Lemmas A.6–A.10 — Carries symmetric local systems and Abel–Jacobi pullbacks.
- YZ19 §6.2.1 — Hat zero-section points are necessary for coefficient sheaves on matrix-stack consumers.

API:

- TauCeti.RamifiedClassField.rootSymmetricPower.hatObject (constructor): Construct a hat object from the five data and the restriction equation.
- TauCeti.RamifiedClassField.rootSymmetricPower.effectiveOpen (characterisation): The open X_d consists exactly of sections nonzero on every geometric fibre.
- TauCeti.RamifiedClassField.rootSymmetricPower.forgetRoot (projection): Forgetting the root line and section maps to the ordinary degree-d section space.
- TauCeti.RamifiedClassField.rootSymmetricPower.awayFromR (compatibility): On divisors disjoint from R the root-forgetting map is an equivalence.

Unit tests:

- TauCeti.RamifiedClassField.rootSymmetricPower.test_d_zero (degenerate): At d=0 the effective space is Spec k; the section nowhere vanishes.
- TauCeti.RamifiedClassField.rootSymmetricPower.test_empty_R (compatibility): At R=∅ the effective space is Sym^d X.
- TauCeti.RamifiedClassField.rootSymmetricPower.test_closed_fibre (non-example): Over a divisor containing a branch point the full fibre has the nilpotent root chart, rather than only Bμ₂.
- TauCeti.RamifiedClassField.rootSymmetricPower.test_hat_zero (non-example): The hat degree-d space admits a=0 and α_R=0 for any root-Picard object in that degree.

Acceptance:

- Nonzero means fibrewise nonzero, not merely a nonzero element of the total section group.

Planet: Root symmetric powers.

Source:

- YZ19, Definition A.2 p. 515; A.1.3 pp. 515–516. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Evaluation description of root symmetric powers

Declaration: FunctionFieldArithmeticPartII:GC.1/evaluation-pullback. Comparison.

The root symmetric-power stack is the two-pullback of the ordinary evaluation map to [Res_R A¹/Res_R G_m] along its square-power map. Over a splitting field the latter is a product of copies of [A¹/G_m], one for each geometric point of R.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Evaluate the universal line bundle with section along R.
2. Identify the square-root fibre data with K_R,α_R,ι by the root two-pullback.
3. Descent through the finite étale splitting of R identifies the Weil restriction and product description.

Inputs: FunctionFieldArithmeticPartII:GC.1/root-symmetric-space, FunctionFieldArithmeticPartII:RS.1/two-pullback, SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.3.

Acceptance:

- ρ is the number of geometric branch points after base change, not the number of closed points over k.

Source:

- YZ19, A.1.3 diagram (A.1) p. 516. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Incidence divisors meet transversely

Declaration: FunctionFieldArithmeticPartII:GC.1/incidence-transversality. Lemma.

After splitting R, in Sym^d X each incidence divisor D_x of effective divisors containing x is smooth, and intersections for a subset I of distinct branch points identify with Sym^{d−|I|}X when d≥|I|, with codimension |I|; the intersection is empty when d<|I|.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use addition of the fixed reduced divisor Σ_{x∈I}x to identify the intersection.
2. The ordinary symmetric-power supplier gives smoothness and dimension d−|I|.
3. Use the dimension calculation to obtain normal-crossing transversality.

Inputs: FunctionFieldArithmeticPartII:GC.1/root-symmetric-space, SchemeAndStackFoundations:SF.3.

Acceptance:

- Repeated roots of the moving divisor do not replace distinct branch points in I.

Source:

- YZ19, Proof of Lemma A.4 pp. 516–517. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### The evaluation smoothness criterion

Declaration: FunctionFieldArithmeticPartII:GC.1/evaluation-smooth-criterion. Lemma.

For a smooth Z over the algebraically closed base, a map Z→[A^r/G_m^r] given by r line bundles with sections is smooth exactly when their zero divisors are smooth and meet transversely, including the empty strata.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Trivialize the line bundles and pull back the standard torus atlas.
2. Translate smoothness to the differential rank of the section coordinates on every vanishing stratum.
3. Smooth divisors and independent conormals supply that rank; conversely smoothness pulls back the coordinate normal-crossing strata.

Inputs: FunctionFieldArithmeticPartII:RS.1/two-pullback, SchemeAndStackFoundations:SF.1.

Acceptance:

- A zero section on all of Z fails the smooth divisor condition.

Source:

- YZ19, Lemma A.3 p. 516. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Smoothness of root symmetric powers

Declaration: FunctionFieldArithmeticPartII:GC.1/root-symmetric-smooth. Theorem.

The effective root symmetric power X_d^√R is smooth over k of dimension d and is DM. Its evaluation map to [Res_R A¹/Res_R G_m] is smooth.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use the incidence calculation to show ordinary evaluation is smooth.
2. Pull that map back along the square-power classifying map to obtain root evaluation smoothness.
3. The root chart and invertibility of two give the smooth DM stack and its dimension.

Inputs: FunctionFieldArithmeticPartII:GC.1/incidence-transversality, FunctionFieldArithmeticPartII:GC.1/evaluation-smooth-criterion, FunctionFieldArithmeticPartII:GC.1/evaluation-pullback, FunctionFieldArithmeticPartII:RS.1/regular-dm.

Acceptance:

- This is not a claim that the whole hat section space is smooth in arbitrary degree.

Planet: Root symmetric-power smoothness.

Source:

- YZ19, Lemma A.4 pp. 516–517. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Coarse symmetric-power space

Declaration: FunctionFieldArithmeticPartII:GC.1/root-symmetric-coarse. Theorem.

The root-forgetting projection X_d^√R→Sym^d X is its coarse-space morphism and is an equivalence over Sym^d(X−R).

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Apply the relative root coarse-space theorem to the evaluation two-pullback.
2. Away from the incidence divisors the section is invertible, so the root universal property gives an equivalence.

Inputs: FunctionFieldArithmeticPartII:GC.1/evaluation-pullback, FunctionFieldArithmeticPartII:RS.1/coarse-space, FunctionFieldArithmeticPartII:RS.1/base-change.

Acceptance:

- The full fibre at an incidence divisor is still the quotient nilpotent chart.

Planet: Root symmetric coarse space.

Source:

- YZ19, A.1.3 p. 516. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Addition of root divisors

Declaration: FunctionFieldArithmeticPartII:GC.1/root-addition. Construction.

For d,e≥0 tensor L and K_R and multiply both sections to define hatadd_{d,e}:hatX_d^√R×hatX_e^√R→hatX_{d+e}^√R. Restriction gives addition on the effective opens; the same construction gives effective-divisor translation of the hat space.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use tensor products of the two root isomorphisms.
2. The product section satisfies the restriction equation because tensor and restriction commute.
3. A product of fibrewise-nonzero sections on an integral smooth curve is fibrewise nonzero.

Inputs: FunctionFieldArithmeticPartII:GC.1/root-symmetric-space, FunctionFieldArithmeticPartII:GC.0/root-picard, FunctionFieldArithmeticPartII:RS.0/section-power.

API uses:

- YZ19 A.2.1 — Defines p_d and the multiplicativity maps.
- YZ19 §6.1.4 — The specialized hat translation consumer imports this operation.

API:

- TauCeti.RamifiedClassField.rootAddition.object (simp): Root addition tensors line bundles and multiplies sections.
- TauCeti.RamifiedClassField.rootAddition.unit (simp): Adding the degree-zero unit object gives the original divisor.
- TauCeti.RamifiedClassField.rootAddition.coherence (structure): Associativity and symmetry are the imported coherent tensor isomorphisms, with the same section equations.

Unit tests:

- TauCeti.RamifiedClassField.rootAddition.test_empty (degenerate): Adding two empty divisors gives the empty divisor.
- TauCeti.RamifiedClassField.rootAddition.test_ordinary (compatibility): At R=∅ this is ordinary symmetric-power addition.
- TauCeti.RamifiedClassField.rootAddition.test_branch_section (non-example): Two zero root-section values multiply to zero, rather than cancel or become nonzero.

Acceptance:

- The empty degree-zero divisor is the addition unit; root sections are multiplied, not added.

Planet: Addition of root divisors.

Source:

- YZ19, A.1.4 pp. 517–518. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### The ordered root-divisor morphism

Declaration: FunctionFieldArithmeticPartII:GC.1/ordered-divisors. Construction.

Iterated addition defines p_d:(X_1^√R)^d→X_d^√R, with its S_d-equivariance and the degree-zero unit map.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Iterate addition using the fixed associativity coherence.
2. Permute factors through the tensor symmetry and prove the symmetric-group relations.
3. Define the empty product as the degree-zero unit object.

Inputs: FunctionFieldArithmeticPartII:GC.1/root-addition.

API uses:

- YZ19 Lemmas A.6–A.8 — Produces the invariant direct image and its symmetric-group action.

API:

- TauCeti.RamifiedClassField.orderedRootDivisors.one (simp): p_1 is the identity.
- TauCeti.RamifiedClassField.orderedRootDivisors.permutation (functoriality): Every σ∈S_d acts on the source and p_d is equivariant with coherent target isomorphisms.
- TauCeti.RamifiedClassField.orderedRootDivisors.blockAddition (compatibility): Concatenating ordered tuples agrees with root addition after their separate p_d maps.

Unit tests:

- TauCeti.RamifiedClassField.orderedRootDivisors.test_zero (degenerate): p_0 maps the point to the empty root divisor.
- TauCeti.RamifiedClassField.orderedRootDivisors.test_one (compatibility): p_1 is identity on the root curve.
- TauCeti.RamifiedClassField.orderedRootDivisors.test_collision (non-example): p_2 is not representable at two equal branch points: its relative inertia contains diagonal μ₂.

Acceptance:

- At a collision of two branch points the stabilizer map μ₂×μ₂→μ₂ has a nontrivial kernel.

Source:

- YZ19, A.1.4 (A.3) p. 518. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Properness and tame finite relative fibres

Declaration: FunctionFieldArithmeticPartII:GC.1/ordered-proper. Lemma.

The ordered map p_d is proper and quasi-finite in the nonrepresentable stack sense; the generic distinct-point locus is an S_d-cover. Its finite relative stabilizers are tame μ₂-products. No representably finite morphism is asserted at branch collisions.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. On coarse spaces use proper finite ordinary symmetric-power addition from the curve supplier.
2. The root stacks are proper over their coarse spaces and have finite tame inertia; apply the supplier’s properness comparison.
3. Compute collision stabilizers by the multiplication maps μ₂^m→μ₂; their kernels account for nonrepresentability.

Inputs: FunctionFieldArithmeticPartII:GC.1/ordered-divisors, FunctionFieldArithmeticPartII:GC.1/root-symmetric-coarse, FunctionFieldArithmeticPartII:RS.1/closed-fibre, SchemeAndStackFoundations:SF.1.

Acceptance:

- The two-equal-branch-point example detects misuse of a representable finite-map theorem.

Source:

- YZ19, A.1.4 and A.2.1 pp. 518–519; source gate G4. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Root Abel–Jacobi maps

Declaration: FunctionFieldArithmeticPartII:GC.1/root-abel-jacobi. Construction.

Define hatAJ_d:hatX_d^√R→Pic_X^√R,d by forgetting a and α_R, and the refined map retaining α_R to Pic_X^{√R;√R,d}. Restrict the first map to AJ_d:X_d^√R→Pic_X^√R,d. Addition commutes with the product AJ_d×AJ_e and Picard tensor multiplication.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Define both functors by explicit forgetful operations on objects and arrows.
2. Their composition forgets exactly the root section.
3. Compare tensoring and forgetting on data to obtain the product square with specified 2-isomorphism.

Inputs: FunctionFieldArithmeticPartII:GC.1/root-symmetric-space, FunctionFieldArithmeticPartII:GC.0/root-picard-section, FunctionFieldArithmeticPartII:GC.1/root-addition.

API uses:

- YZ19 A.2.2–A.2.3 — Defines high-degree descent and hat coefficient pullbacks.

API:

- TauCeti.RamifiedClassField.rootAbelJacobi.hat (projection): The hat map forgets both sections and retains the two root line bundles and ι.
- TauCeti.RamifiedClassField.rootAbelJacobi.refined (projection): The refined map forgets a and retains α_R.
- TauCeti.RamifiedClassField.rootAbelJacobi.addition (compatibility): AJ_{d+e}∘add≅mult∘(AJ_d×AJ_e).

Unit tests:

- TauCeti.RamifiedClassField.rootAbelJacobi.test_empty_R (compatibility): At R=∅ the effective map is the ordinary Abel–Jacobi map to Pic^d.
- TauCeti.RamifiedClassField.rootAbelJacobi.test_zero (degenerate): At d=0 the effective point maps to the tensor unit.
- TauCeti.RamifiedClassField.rootAbelJacobi.test_hat_zero (non-example): A zero global section still has a defined hatAJ image.

Acceptance:

- The refined target retains α_R; the ordinary target does not.

Planet: Root Abel–Jacobi maps.

Source:

- YZ19, A.1.5 p. 518. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

## GC.2. Adelic root Picard groupoids

Modified local-unit fibre products and the idele double-quotient groupoid, with stabilizers and degree retained. Exact declarations, hypotheses, API and acceptance tests are in the companion packet and reader.

### Modified local units at ramified places

Declaration: FunctionFieldArithmeticPartII:GC.2/root-units. Definition.

At x∈R let O_{√x}×={(u,v)∈O_x××k(x)× : ū=v²}, with componentwise multiplication. For x∉R use O_x×. Let O_{√R}× be their product. Its map to adelic units forgets v and has kernel ∏_{x∈R}μ₂(k(x)); do not assume it is injective.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use the parent’s local completions, valuation-ring units and residue map.
2. Take the fibre product of multiplicative groups along reduction and the square homomorphism.
3. Form the finite modification of the ordinary unit product, with its actual map to ideles.

Inputs: FunctionFieldArithmetic:FA.2.

API uses:

- YZ19 Lemma A.5 — Gives the action group used in the idele groupoid.
- YZ19 Proposition A.12 — The quadratic character is trivial on its image.

API:

- TauCeti.RamifiedClassField.rootUnits.mk (constructor): Create (u,v) with ū=v².
- TauCeti.RamifiedClassField.rootUnits.forget (projection): Project to u in O_x× and to the corresponding idele unit.
- TauCeti.RamifiedClassField.rootUnits.kernel (characterisation): The kernel consists of u=1 and v²=1.

Unit tests:

- TauCeti.RamifiedClassField.rootUnits.test_empty_R (degenerate): At R=∅ the product is the ordinary unit product.
- TauCeti.RamifiedClassField.rootUnits.test_minus_one (non-example): At a ramified place, (1,−1) is a nontrivial kernel element.
- TauCeti.RamifiedClassField.rootUnits.test_nonsquare (computation): A unit with nonsquare residue has no lift to this group.

Acceptance:

- The square operation on residue elements is not additive in odd characteristic; no fibre-product ring is defined here.

Planet: Ramified root units.

Source:

- YZ19, A.1.6 pp. 518–519. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### The adelic root Picard groupoid

Declaration: FunctionFieldArithmeticPartII:GC.2/adelic-root-groupoid. Theorem.

There is an equivalence Pic_X^√R(k)≃F×\A_F×/O_{√R}× as a double-action groupoid. The right action uses the actual noninjective homomorphism to idele units. Degree and all stabilizers are retained. At x∉R, π_x⁻¹ represents O_X(x)^♮.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Choose a generic trivialization of L and compatible local trivializations; the root-line frame along R yields the residue-square data.
2. Changing the generic and integral frames produces the left F× and right root-unit actions.
3. Reverse by gluing line bundles and root data, and identify automorphisms; use the divisor/idele dictionary with the π⁻¹ sign.

Inputs: FunctionFieldArithmeticPartII:GC.2/root-units, FunctionFieldArithmeticPartII:GC.0/root-picard, FunctionFieldArithmetic:FA.2, SchemeAndStackFoundations:SF.3.

Acceptance:

- For R=∅ recover the Picard groupoid, not just the class group; root-unit kernel elements remain stabilizers.

Planet: Adelic root Picard groupoid.

Source:

- YZ19, Lemma A.5 p. 519 and proof. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Root divisors supported away from R

Declaration: FunctionFieldArithmeticPartII:GC.2/root-divisor-groupoid. Comparison.

The groupoid of root divisors used in §6.2.3 is the effective open X_d^√R(k) with its root data and automorphisms; forgetting the root gives the ordinary divisor. The character on differences of such objects is evaluated through the adelic root-Picard equivalence, not through an unweighted set bijection.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Identify the effective global section with its Cartier divisor using the imported divisor dictionary.
2. Retain the line and root isomorphisms in the morphism groupoid.
3. Apply root Abel–Jacobi and the adelic equivalence to differences.

Inputs: FunctionFieldArithmeticPartII:GC.1/root-symmetric-space, FunctionFieldArithmeticPartII:GC.2/adelic-root-groupoid.

Acceptance:

- Any matrix-stack integration consumer retains the factor 1/#Aut; constructing that specialized matrix stack belongs to ShtukaSpecialCyclesAndHigherSiegelWeil.

Source:

- YZ19, §6.2.3 p. 499, Lemma 6.4 (6.9); Definition A.2 p. 515. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

## GC.3. Symmetric local systems

Tame rank-one coefficients, collision descent, graded symmetric powers, exterior-power cohomology and associative multiplicativity. Exact declarations, hypotheses, API and acceptance tests are in the companion packet and reader.

### Rank-one local systems on the root curve

Declaration: FunctionFieldArithmeticPartII:GC.3/tame-local-systems. Theorem.

Rank-one Q̄ℓ-local systems L on X_1^√R correspond to rank-one tame local systems on U=X−R whose geometric inertia characters have order dividing two. Their global monodromy can have arbitrary order; in particular an unramified character of order three is allowed.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use local root charts to identify tame inertia with the residual μ₂ action.
2. A tame character factors through this action exactly when its local inertia square is one.
3. Glue using full faithful étale-local-system restriction and descent; the fundamental-group comparison for root stacks is the precise stack extension recorded in gap ST-LISSE.

Inputs: FunctionFieldArithmeticPartII:GC.1/root-symmetric-smooth, FunctionFieldArithmeticPartII:RS.1/closed-fibre, InverseGaloisAndArithmeticFundamentalGroups:IG.0, InverseGaloisAndArithmeticFundamentalGroups:IG.1.

Acceptance:

- The quadratic cover supplies a special input, not the general definition.

Planet: Tame root-curve local systems.

Source:

- YZ19, A.2 first paragraph p. 519; A.2.3 p. 520. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Symmetric tensor local systems

Declaration: FunctionFieldArithmeticPartII:GC.3/symmetric-local-system. Construction.

For L as above and d≥0 define K_d=(p_{d,!}L^{⊠d})^{S_d} with no shift, and L_d=H⁰(K_d). The collision and middle-extension lemmas prove K_d≅L_d, with L_d lisse rank one and L_d[d] perverse. The invariant projector is d!⁻¹Σσ over Q̄ℓ, including when ℓ divides d!.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Take the external tensor product with its genuine symmetry maps.
2. Apply the source-qualified tame stack proper pushforward, then the rational invariant projector.
3. Use the collision kernel and middle-extension lemmas below to prove this is lisse and concentrated in degree zero; the construction itself is the unshifted invariant complex.

Inputs: FunctionFieldArithmeticPartII:GC.3/tame-local-systems, FunctionFieldArithmeticPartII:GC.1/ordered-divisors, FunctionFieldArithmeticPartII:GC.1/ordered-proper.

API uses:

- YZ19 Lemmas A.6–A.11 — Supplies the cohomology, translation and character-sheaf maps.

API:

- TauCeti.RamifiedClassField.symmetricLocalSystem.zero (simp): L_0 is the coefficient line on Spec k.
- TauCeti.RamifiedClassField.symmetricLocalSystem.one (simp): L_1=L under p_1=id.
- TauCeti.RamifiedClassField.symmetricLocalSystem.invariantProjector (characterisation): L_d is the image of d!⁻¹Σσ on the unshifted p_{d,!}L^{⊠d}.
- TauCeti.RamifiedClassField.symmetricLocalSystem.perverseShift (compatibility): L_d[d] is the perverse intermediate extension from the distinct-point open.

Unit tests:

- TauCeti.RamifiedClassField.symmetricLocalSystem.test_zero (degenerate): The zeroth symmetric local system is the coefficient line in degree zero.
- TauCeti.RamifiedClassField.symmetricLocalSystem.test_one (compatibility): The first symmetric local system is L in degree zero.
- TauCeti.RamifiedClassField.symmetricLocalSystem.test_shift (non-example): At d=1 the complex L[1] is perverse, while L is the unshifted lisse sheaf.
- TauCeti.RamifiedClassField.symmetricLocalSystem.test_order_three (non-example): An unramified order-three character still gives this construction.

Acceptance:

- L_0=Q̄ℓ and L_1=L; the shift does not belong in the degree-zero local-system definition.

Planet: Symmetric tensor local systems.

Source:

- YZ19, A.2.1 p. 519, corrected perverse shift (source issue E26). The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Collision kernels act trivially on the tensor line

Declaration: FunctionFieldArithmeticPartII:GC.3/collision-kernel. Lemma.

At a geometric divisor Σm_x x, the relative inertia of the ordered map over a branch point x is ker(μ₂^{m_x}→μ₂). It acts trivially on L_x^{⊗m_x}, since the same rank-one character occurs in every factor.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Describe root tensor addition on the stabilizer groups as multiplication.
2. Evaluate the tensor character as the product of the same character on each factor.
3. On the kernel this is the character of one, and permutation acts trivially on the ungraded rank-one tensor fibre.

Inputs: FunctionFieldArithmeticPartII:GC.1/ordered-divisors, FunctionFieldArithmeticPartII:GC.3/tame-local-systems, FunctionFieldArithmeticPartII:RS.1/closed-fibre.

Acceptance:

- If the factors had unrelated inertia characters, the same kernel-triviality assertion would fail.

Source:

- YZ19, Proof of Lemma A.7 pp. 519–520. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### The symmetric complex is a shifted middle extension

Declaration: FunctionFieldArithmeticPartII:GC.3/middle-extension. Lemma.

The rational invariant object (p_{d,!}L^{⊠d}[d])^{S_d} is the perverse intermediate extension of the distinct-point local system. Its unshifted stalks have no higher relative cohomology because the relative fibres are finite tame groupoids with rational coefficients.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Apply the supplier’s precise proper quasi-finite tame-DM pushforward and intermediate-extension theorem; it must allow the computed nonrepresentable map.
2. Average S_d over characteristic-zero coefficients.
3. At finite stabilizer fibres use rational group-cohomology vanishing to retain degree-zero stalks.

Inputs: FunctionFieldArithmeticPartII:GC.1/ordered-proper, FunctionFieldArithmeticPartII:GC.3/symmetric-local-system, FunctionFieldArithmeticPartII:GC.3/collision-kernel.

Acceptance:

- A representably finite-map theorem alone is not enough; this contract is explicitly gap ST-OPS.

Source:

- YZ19, A.2.1 pp. 519–520. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Lisse rank-one descent across collisions

Declaration: FunctionFieldArithmeticPartII:GC.3/collision-descent. Theorem.

L_d is a rank-one local system on all of X_d^√R, including repeated branch divisors.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Apply proper base change at a geometric divisor and factor the ordered fibre by its multiplicities.
2. The kernel acts trivially on each tensor line and its rational higher cohomology vanishes.
3. The intermediate-extension object has rank-one stalks on the smooth root stack; the supplier’s lisse rank-one extension criterion identifies it with a lisse sheaf.

Inputs: FunctionFieldArithmeticPartII:GC.3/collision-kernel, FunctionFieldArithmeticPartII:GC.3/middle-extension.

Acceptance:

- At 2x for x∈R the rank stays one even though the ordered map is nonrepresentable.

Planet: Collision descent.

Source:

- YZ19, Lemma A.7 pp. 519–520. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Vanishing outside degree one for a nontrivial input

Declaration: FunctionFieldArithmeticPartII:GC.3/cohomology-vanishing. Lemma.

If L is geometrically nontrivial on the proper root curve, H⁰(X_1^√R_kbar,L)=H²(X_1^√R_kbar,L)=0; its cohomology is concentrated in degree one.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Global invariant sections vanish for a geometrically nontrivial rank-one character.
2. The corresponding dual character is geometrically nontrivial, so smooth-DM Poincaré duality kills H².
3. Use the curve cohomological-dimension bound through the tame coarse-space comparison; its stack extension is recorded in ST-OPS.

Inputs: FunctionFieldArithmeticPartII:GC.3/tame-local-systems, EtaleDualityAndPerverseSheaves:EDC.2:pairings.

Acceptance:

- The constant sheaf is excluded: on P¹ it has nonzero H⁰ and H².

Source:

- YZ19, Proof of Lemma A.6 p. 519. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Graded symmetric invariants are exterior powers

Declaration: FunctionFieldArithmeticPartII:GC.3/koszul-exterior. Lemma.

For a vector space V concentrated in cohomological degree one, the S_d-invariants of its d-fold graded tensor power are ∧^dV in degree d. The permutation action includes the Koszul sign, so this is the exterior rather than the ordinary symmetric power.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. A transposition acts by minus the ordinary flip on degree-one factors.
2. Thus the invariant projector is the antisymmetrizer; use the native exterior-power universal property over Q̄ℓ.
3. The total degree of d degree-one factors is d. The required comparison to the native exterior-power type is an explicit algebra API obligation, not a new exterior-algebra definition.

Inputs: mathlib:ExteriorAlgebra.exteriorPower, FunctionFieldArithmeticPartII:GC.3/cohomology-vanishing.

Acceptance:

- For dim V=1 and d=2 the invariant space is zero; the ordinary symmetric square would be nonzero.

Source:

- YZ19, Proof of Lemma A.6 p. 519. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Exterior-power cohomology

Declaration: FunctionFieldArithmeticPartII:GC.3/exterior-cohomology. Theorem.

For geometrically nontrivial L, H^i(X_d^√R_kbar,L_d)=0 for i≠d, and H^d≅∧^dH¹(X_1^√R_kbar,L), naturally and Frobenius-equivariantly. This includes d=0; exterior powers vanish for d above dim H¹.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Apply the stack Künneth theorem and proper-pushforward cohomology comparison to the ordered product.
2. The rational invariant projector commutes with cohomology.
3. Identify the resulting graded invariants by the Koszul lemma.

Inputs: FunctionFieldArithmeticPartII:GC.3/collision-descent, FunctionFieldArithmeticPartII:GC.3/cohomology-vanishing, FunctionFieldArithmeticPartII:GC.3/koszul-exterior.

Acceptance:

- At d=0 the result is H⁰=Q̄ℓ; it does not contradict input H⁰ vanishing.

Planet: Exterior-power cohomology.

Source:

- YZ19, Lemma A.6 p. 519. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Multiplicativity on the distinct-point open

Declaration: FunctionFieldArithmeticPartII:GC.3/multiplicity-free-product. Lemma.

On the locus where the two effective divisors have mutually disjoint support away from R, add*L_{d+e}≅L_d⊠L_e by concatenating the tensor lines on ordered divisors.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Pull back to the finite ordered distinct-point cover.
2. Identify tensor products by block concatenation and descend the S_d×S_e-equivariant isomorphism.

Inputs: FunctionFieldArithmeticPartII:GC.1/root-addition, FunctionFieldArithmeticPartII:GC.3/symmetric-local-system.

Acceptance:

- The isomorphism is the tensor associativity map, not an arbitrary scalar choice.

Source:

- YZ19, Proof of Lemma A.8 p. 520. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Multiplicativity on every effective degree

Declaration: FunctionFieldArithmeticPartII:GC.3/symmetric-multiplicativity. Theorem.

The distinct-point isomorphism extends uniquely to α_{d,e}:add*L_{d+e}≅L_d⊠L_e on X_d^√R×X_e^√R.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Both sides are lisse on a normal connected product stack.
2. Restriction to its dense distinct-point open is fully faithful for lisse sheaves.
3. Extend the isomorphism and its inverse uniquely using the stack restriction theorem in ST-LISSE.

Inputs: FunctionFieldArithmeticPartII:GC.3/multiplicity-free-product, FunctionFieldArithmeticPartII:GC.3/collision-descent, FunctionFieldArithmeticPartII:GC.1/root-symmetric-smooth, InverseGaloisAndArithmeticFundamentalGroups:IG.0.

Acceptance:

- The extension includes repeated branch divisors.

Planet: Symmetric local-system multiplication.

Source:

- YZ19, Lemma A.8 p. 520. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Associativity of symmetric multiplicativity

Declaration: FunctionFieldArithmeticPartII:GC.3/symmetric-associativity. Lemma.

For d,e,f≥0 the two composites of α_{d,e}, α_{d+e,f} and α_{e,f}, α_{d,e+f} agree after the specified tensor/addition associators.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. On the distinct-point ordered cover both composites are the same reassociation of three tensor blocks.
2. Use full faithfulness of dense-open restriction on the normal product to extend that equality.

Inputs: FunctionFieldArithmeticPartII:GC.3/symmetric-multiplicativity, FunctionFieldArithmeticPartII:GC.3/multiplicity-free-product.

Acceptance:

- This equality is needed for auxiliary-divisor comparisons, not an unspecified coherence field.

Source:

- YZ19, Lemma A.8 p. 520 and A.2.3 p. 523 coherence argument. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Symmetry and degree-zero unit

Declaration: FunctionFieldArithmeticPartII:GC.3/symmetric-symmetry. Lemma.

The α_{d,e} isomorphisms commute with exchanging d,e and with the ordinary symmetry of rank-one sheaves; α_{0,d} and α_{d,0} are the canonical unit isomorphisms.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Check permutation of two tensor blocks on the ordered distinct-point locus.
2. At degree zero the empty tensor is the coefficient line and concatenation is identity.
3. Extend the equality using the same restriction full faithfulness.

Inputs: FunctionFieldArithmeticPartII:GC.3/symmetric-multiplicativity, FunctionFieldArithmeticPartII:GC.3/multiplicity-free-product.

Acceptance:

- There is no Koszul sign on these degree-zero local systems; the sign belongs to degree-one cohomology.

Source:

- YZ19, Lemma A.8 p. 520; A.2.3 p. 523. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

## GC.4. High-degree Abel–Jacobi descent

Evaluation-surjective affine fibre charts, weighted-quotient simple connectivity and effective descent above the precise degree threshold. Exact declarations, hypotheses, API and acceptance tests are in the companion packet and reader.

### High-degree section evaluation is surjective

Declaration: FunctionFieldArithmeticPartII:GC.4/evaluation-surjective. Lemma.

If d≥ρ+max(2g−1,1), then for a degree-d line bundle L, H¹(X,L(−R))=0. In families, π_*L and π_*L(−R) are vector bundles of ranks d−g+1 and d−ρ−g+1, commute with base change, and π_*L→π_*(L|_R) is surjective.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use Serre duality and the negative degree of ω_X⊗L⁻¹(R) to obtain H¹ vanishing.
2. Use the coherent base-change theorem for the smooth proper family to obtain locally free pushforwards and the evaluation exact sequence.
3. Apply cohomological Riemann–Roch for the ranks; none of these scheme-family facts follows just from the built function-field theorem.

Inputs: FunctionFieldArithmeticPartII:GC.0/root-picard, SchemeAndStackFoundations:SF.3.

Acceptance:

- The bound counts deg R, including residue-field degrees.

Source:

- YZ19, Lemma A.9 and proof pp. 520–521. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### The Abel–Jacobi affine fibre chart

Declaration: FunctionFieldArithmeticPartII:GC.4/affine-fibre-chart. Lemma.

At a fixed geometric root-Picard object (L,K_R,ι), the two-fibre of AJ_d is M=H⁰(X,L) minus {0}×_{H⁰(R,L|_R)}H⁰(R,K_R), with the second map α↦ι(α²). For ρ>0 and the degree bound, a splitting of evaluation identifies M≃A^n minus {0}, n=d−g+1. Scaling K_R by λ and L by λ² gives weights two on n−ρ coordinates and one on ρ coordinates.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.
- ρ>0 and d≥ρ+max(2g−1,1).

Construction or proof:

1. Use the definition of the two-fibre over a fixed object: there are no remaining compatible automorphisms of that object.
2. Choose a splitting of the surjective evaluation map; write a=u+split(ι(α²)).
3. The effective condition removes the origin; the scaling law gives the displayed weights. The weighted quotient maps to the moduli stack but is not identified with this fixed-object fibre.

Inputs: FunctionFieldArithmeticPartII:GC.4/evaluation-surjective, FunctionFieldArithmeticPartII:GC.1/root-abel-jacobi.

Acceptance:

- M itself is not asserted simply connected in positive characteristic.

Source:

- YZ19, Proof of Lemma A.9 p. 521. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### A projective cover of the weighted quotient

Declaration: FunctionFieldArithmeticPartII:GC.4/weighted-cover. Lemma.

For n≥ρ+1 and ρ≥1, set a=n−ρ. The coordinate map [x₁,…,x_a,y₁,…,y_ρ]↦[x₁²,…,x_a²,y₁,…,y_ρ] defines a finite cover P^{n−1}→[A^n minus {0}/G_m], with weights (2^a,1^ρ). Its generic Galois group is μ₂^a.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.
- ρ≥1; n≥ρ+1; a=n−ρ.

Construction or proof:

1. The coordinate map is equivariant for the ordinary weight-one source and weighted target.
2. Descend to the projective quotient and check finiteness on charts.
3. The independent signs of the x_i give the generic μ₂^a action.

Inputs: FunctionFieldArithmeticPartII:GC.4/affine-fibre-chart, SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.3.

Acceptance:

- The positive weight-one block is essential; the all-weight-two quotient has residual generic μ₂ inertia.

Source:

- YZ19, Proof of Lemma A.9 p. 521. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Nontrivial intermediate weighted covers ramify

Declaration: FunctionFieldArithmeticPartII:GC.4/weighted-ramification. Lemma.

A proper subgroup Γ⊊μ₂^a gives an intermediate cover of the weighted quotient that is ramified along at least one coordinate divisor x_i=0 in a chart where a weight-one coordinate y_ρ is nonzero. Hence such an intermediate cover cannot be finite étale.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.
- ρ≥1; n≥ρ+1.

Construction or proof:

1. Choose a nontrivial character of μ₂^a/Γ, represented by a nonempty coordinate subset I.
2. On y_ρ≠0 its invariant root is the monomial ∏_{i∈I}x_i with square ∏_{i∈I}z_i.
3. This quadratic subcover ramifies along each z_i=0 for i∈I since two is invertible.

Inputs: FunctionFieldArithmeticPartII:GC.4/weighted-cover.

Acceptance:

- The nonempty subset I and the weight-one affine chart are both required.

Source:

- YZ19, Proof of Lemma A.9 p. 521. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Simple connectivity of the weighted quotient

Declaration: FunctionFieldArithmeticPartII:GC.4/weighted-simply-connected. Theorem.

The weighted quotient [A^n minus {0}/G_m] with weights (2^{n−ρ},1^ρ), ρ≥1 and n≥ρ+1, has no nontrivial connected finite étale cover. Thus every rank-one lisse Q̄ℓ-local system on it is geometrically constant.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.
- ρ≥1; n≥ρ+1.

Construction or proof:

1. Pull a connected finite étale cover back to P^{n−1}; the supplier’s projective-space simple connectivity makes that pullback trivial.
2. A component supplies a lift of the projective cover, and the generic function field is an intermediate μ₂^a extension.
3. The ramification lemma forces Γ=μ₂^a; the cover has degree one, hence is an equivalence. Apply the stack lisse/fundamental-group comparison.

Inputs: FunctionFieldArithmeticPartII:GC.4/weighted-cover, FunctionFieldArithmeticPartII:GC.4/weighted-ramification, InverseGaloisAndArithmeticFundamentalGroups:IG.0, SchemeAndStackFoundations:SF.3.

Acceptance:

- At ρ=0 the proof does not apply; the ordinary Abel–Jacobi argument uses ordinary projective fibres.

Planet: Weighted quotient simple connectivity.

Source:

- YZ19, Claim in proof of Lemma A.9 p. 521. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Triviality of the symmetric sheaf along Abel–Jacobi fibres

Declaration: FunctionFieldArithmeticPartII:GC.4/fibre-triviality. Lemma.

Under the high-degree bound and ρ>0, L_d restricts to a constant sheaf on each geometric two-fibre M of AJ_d.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. The map M→X_d^√R factors through the weighted quotient by the scalar root-Picard automorphisms.
2. Pull L_d to that quotient; it is lisse because L_d is lisse.
3. Simple connectivity makes this pullback constant, hence constant on M.

Inputs: FunctionFieldArithmeticPartII:GC.4/affine-fibre-chart, FunctionFieldArithmeticPartII:GC.4/weighted-simply-connected, FunctionFieldArithmeticPartII:GC.3/collision-descent.

Acceptance:

- This does not invoke false simple connectivity of punctured affine space.

Source:

- YZ19, Proof of Lemma A.9 p. 521. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### High-degree descent with empty ramification

Declaration: FunctionFieldArithmeticPartII:GC.4/empty-ramification-descent. Lemma.

When R=∅ and d≥max(2g−1,1), the symmetric local system descends along the ordinary Abel–Jacobi map to the degree-d Picard stack. The ordinary scalar action has weight one; the projective fibre quotient is P^{d−g}.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use the ordinary coherent Riemann–Roch/base-change fibre description.
2. The weight-one scalar quotient is projective space and has trivial geometric fundamental group.
3. Apply the source-qualified effective lisse-sheaf descent theorem, with connected fibres.

Inputs: FunctionFieldArithmeticPartII:GC.3/collision-descent, FunctionFieldArithmeticPartII:GC.3/symmetric-multiplicativity, SchemeAndStackFoundations:SF.3, InverseGaloisAndArithmeticFundamentalGroups:IG.0.

Acceptance:

- This coalesces the unramified YZ17/49 route; no second unramified character-sheaf theory is planned.

Source:

- YZ19, Lemma A.9 p. 520, opening unramified case; proof p. 521. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### High-degree root Abel–Jacobi descent

Declaration: FunctionFieldArithmeticPartII:GC.4/high-degree-descent. Theorem.

For d≥ρ+max(2g−1,1), L_d descends to a rank-one local system L_d^Pic on Pic_X^√R,d with AJ_d*L_d^Pic≅L_d. Descent and its comparison are unique up to the canonical isomorphism compatible with pullback; the pullback functor is fully faithful in this setting.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. The evaluation vector-bundle charts prove AJ_d is a locally trivial fibration with geometrically connected fibres.
2. For nonempty R use fibre triviality; for empty R use ordinary descent.
3. Apply effective lisse descent and full faithfulness on this fibration. The precise nonproper affine-fibre theorem is requested in ST-LISSE; connected fibres alone are not silently treated as sufficient.

Inputs: FunctionFieldArithmeticPartII:GC.4/evaluation-surjective, FunctionFieldArithmeticPartII:GC.4/fibre-triviality, FunctionFieldArithmeticPartII:GC.4/empty-ramification-descent, FunctionFieldArithmeticPartII:GC.1/root-abel-jacobi.

Acceptance:

- Retain the threshold including ρ and the max with one.

Planet: High-degree Abel–Jacobi descent.

Source:

- YZ19, Lemma A.9 pp. 520–521. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

## GC.5. All-degree character sheaves

Effective auxiliary divisors, canonical comparison and cocycles, all-degree extension, Abel–Jacobi pullback, unit, associativity and commutativity. Exact declarations, hypotheses, API and acceptance tests are in the companion packet and reader.

### Effective auxiliary divisors away from R

Declaration: FunctionFieldArithmeticPartII:GC.5/auxiliary-divisors. Lemma.

For every integer d and bound B there exists an effective divisor D on U=X−R with d+deg D≥B. The construction requires no rational point of degree one. For two choices D,E, a common effective enlargement is D+E.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Choose a closed point of the nonempty affine open U.
2. A sufficiently large multiple of that point exceeds any prescribed degree bound.
3. Use sums of effective divisors for a common comparison enlargement.

Inputs: FunctionFieldArithmeticPartII:GC.1/root-symmetric-space, SchemeAndStackFoundations:SF.3.

Acceptance:

- A closed point of degree greater than one still suffices to reach the bound, though it need not produce every degree.

Source:

- YZ19, A.2.2 p. 521, translation by divisors; Lemma A.10 p. 522. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### The tensor line attached to an effective divisor

Declaration: FunctionFieldArithmeticPartII:GC.5/divisor-tensor-line. Construction.

For an effective D=Σn_x x supported on U, define the Frobenius line L_D as the tensor product of the fibres of L over all geometric points above x, each repeated n_x times, with its Frobenius permutation descent. This is the value of L_{deg D} at the canonical root divisor O(D)^♮.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use the ordered geometric divisor to form its tensor line.
2. Descend the permutation action and Frobenius cycles to k.
3. Identify the value with the invariant symmetric stalk. Multiplicativity canonically identifies L_{D+E} with L_D⊗L_E.

Inputs: FunctionFieldArithmeticPartII:GC.3/symmetric-local-system, FunctionFieldArithmeticPartII:GC.3/symmetric-multiplicativity, FunctionFieldArithmeticPartII:GC.2/adelic-root-groupoid.

API uses:

- YZ19 A.2.2 — Normalizes auxiliary-divisor translations.
- YZ19 Proposition A.12 — Computes the closed-point Frobenius trace.

API:

- TauCeti.RamifiedClassField.divisorTensorLine.zero (simp): L_0 is the coefficient line.
- TauCeti.RamifiedClassField.divisorTensorLine.sum (compatibility): L_{D+E}≅L_D⊗L_E with the inherited tensor coherence.
- TauCeti.RamifiedClassField.divisorTensorLine.closedPoint (characterisation): The Frobenius action for a closed point is the cyclic permutation with its local Frobenius action.

Unit tests:

- TauCeti.RamifiedClassField.divisorTensorLine.test_empty (degenerate): The empty divisor gives Q̄ℓ.
- TauCeti.RamifiedClassField.divisorTensorLine.test_rational (computation): For a rational point x outside R the line is L_x.
- TauCeti.RamifiedClassField.divisorTensorLine.test_degree_two (non-example): For a degree-two closed point the line is the tensor of both conjugate fibres with Frobenius descent.

Acceptance:

- At a nonrational closed point, use all geometric conjugates, not one arbitrarily chosen fibre.

Source:

- YZ19, A.2.2 p. 521 and A.2.3 p. 523. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Translation of high-degree descent

Declaration: FunctionFieldArithmeticPartII:GC.5/translate-high-degree. Lemma.

If D is effective away from R and both d and d+deg D satisfy the high-degree bound, there is a canonical isomorphism t_D*L_{d+deg D}^Pic≅L_d^Pic⊗L_D.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Pull the proposed comparison back along AJ_d.
2. The product Abel–Jacobi square and α_{d,deg D} identify both sides canonically.
3. Descend the isomorphism using full faithfulness of AJ_d pullback.

Inputs: FunctionFieldArithmeticPartII:GC.4/high-degree-descent, FunctionFieldArithmeticPartII:GC.5/divisor-tensor-line, FunctionFieldArithmeticPartII:GC.3/symmetric-multiplicativity, FunctionFieldArithmeticPartII:GC.1/root-abel-jacobi.

Acceptance:

- The divisor D is effective so the effective symmetric-power map exists.

Source:

- YZ19, A.2.2–A.2.3 pp. 521–523. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### The character local system in every Picard degree

Declaration: FunctionFieldArithmeticPartII:GC.5/all-degree-extension. Construction.

For d∈Z choose effective D⊂U with d+deg D≥B=ρ+max(2g−1,1) and set L_d^Pic=t_D*L_{d+deg D}^Pic⊗L_D⁻¹. The comparison and cocycle lemmas identify different choices canonically; the resulting graded sheaf is L^Pic on the whole root Picard stack.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Translation by O(D)^♮ is an equivalence from degree d to degree d+deg D.
2. Pull back the high-degree local system and remove the fixed divisor tensor line.
3. Use the following common-enlargement comparisons and cocycles to define a choice-independent object by effective descent.

Inputs: FunctionFieldArithmeticPartII:GC.5/auxiliary-divisors, FunctionFieldArithmeticPartII:GC.5/divisor-tensor-line, FunctionFieldArithmeticPartII:GC.4/high-degree-descent.

API uses:

- YZ19 Lemma A.10 — Supplies every effective-degree Abel–Jacobi pullback.
- YZ19 Proposition A.11 — Assembles the multiplicative character sheaf.

API:

- TauCeti.RamifiedClassField.picardCharacter.component (projection): The degree-d component is the normalized translated high-degree sheaf.
- TauCeti.RamifiedClassField.picardCharacter.comparison (characterisation): The sheaves from two effective choices are canonically isomorphic through their common enlargement.
- TauCeti.RamifiedClassField.picardCharacter.translation (compatibility): t_D*L_{d+deg D}^Pic≅L_d^Pic⊗L_D for every d and effective D away from R.

Unit tests:

- TauCeti.RamifiedClassField.picardCharacter.test_negative_degree (non-example): The construction gives a sheaf on degree −1 without choosing a degree-one rational point.
- TauCeti.RamifiedClassField.picardCharacter.test_common_sum (characterisation): The comparisons through D+E agree with comparisons through further effective enlargements.
- TauCeti.RamifiedClassField.picardCharacter.test_high_degree (compatibility): Above B it agrees with the original high-degree descent.

Acceptance:

- Negative degrees are included; no passage through a chosen Pic^0 origin is used.

Planet: All-degree Picard character sheaf.

Source:

- YZ19, A.2.2 pp. 521–522. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Canonical independence of the auxiliary divisor

Declaration: FunctionFieldArithmeticPartII:GC.5/choice-comparison. Lemma.

For effective D,E giving high degrees, the two constructions of L_d^Pic are canonically identified by translating each once more to the high degree d+deg D+deg E and using L_{D+E}≅L_D⊗L_E.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Compare the D construction to the D+E construction using high-degree translation by E.
2. Compare the E construction to D+E using translation by D.
3. Cancel the tensor lines and use symmetry to align their order.

Inputs: FunctionFieldArithmeticPartII:GC.5/translate-high-degree, FunctionFieldArithmeticPartII:GC.5/all-degree-extension, FunctionFieldArithmeticPartII:GC.3/symmetric-associativity, FunctionFieldArithmeticPartII:GC.3/symmetric-symmetry.

Acceptance:

- The comparison is a specified isomorphism, not just existence of isomorphic sheaves.

Source:

- YZ19, A.2.2 p. 522 independence exercise; A.2.3 p. 523. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Cocycle for auxiliary-divisor comparisons

Declaration: FunctionFieldArithmeticPartII:GC.5/choice-cocycle. Lemma.

For any three effective choices D,E,F the canonical comparison D→E followed by E→F is the comparison D→F. Comparisons are unchanged by further common effective enlargement.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Translate all three objects to the common degree d+deg(D+E+F).
2. Associativity and symmetry identify all tensor-line cancellations with one common composite.
3. Use full faithfulness in the high degree to descend that equality.

Inputs: FunctionFieldArithmeticPartII:GC.5/choice-comparison, FunctionFieldArithmeticPartII:GC.3/symmetric-associativity, FunctionFieldArithmeticPartII:GC.3/symmetric-symmetry.

Acceptance:

- A mere pairwise choice of isomorphisms would not satisfy this test.

Source:

- YZ19, A.2.2 pp. 521–522 and A.2.3 p. 523 coherence exercises. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Abel–Jacobi pullback in every effective degree

Declaration: FunctionFieldArithmeticPartII:GC.5/effective-pullback. Theorem.

For every d≥0, AJ_d*L_d^Pic≅L_d canonically. Choose an effective D away from R reaching B; the translated comparison and multiplication cancel L_D.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use the commuting translation–Abel–Jacobi square.
2. At the high translated degree use the defining pullback comparison.
3. Use multiplication by the effective divisor and tensor-line cancellation, then invoke the choice cocycle.

Inputs: FunctionFieldArithmeticPartII:GC.5/choice-cocycle, FunctionFieldArithmeticPartII:GC.5/all-degree-extension, FunctionFieldArithmeticPartII:GC.3/symmetric-multiplicativity, FunctionFieldArithmeticPartII:GC.1/root-abel-jacobi.

Acceptance:

- The proof cannot take an arbitrary signed divisor D because X_{deg D} is an effective space.

Planet: All-degree Abel–Jacobi comparison.

Source:

- YZ19, Lemma A.10 p. 522 (source issue E68). The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### The unit trivialization of the character sheaf

Declaration: FunctionFieldArithmeticPartII:GC.5/unit-trivialization. Theorem.

At the root-Picard tensor unit e, the pullback e*L^Pic is canonically Q̄ℓ, via the degree-zero effective Abel–Jacobi comparison.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Set d=0, where the effective symmetric power is the point.
2. Identify L_0 with the empty tensor coefficient line.
3. Pull through the canonical degree-zero Abel–Jacobi comparison.

Inputs: FunctionFieldArithmeticPartII:GC.5/effective-pullback, FunctionFieldArithmeticPartII:GC.3/symmetric-local-system, FunctionFieldArithmeticPartII:GC.1/root-abel-jacobi.

Acceptance:

- The unit fixes the scalar normalization of multiplication maps.

Planet: Character-sheaf unit.

Source:

- YZ19, Proposition A.11(1) p. 522. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Multiplication in high Picard degrees

Declaration: FunctionFieldArithmeticPartII:GC.5/high-degree-multiplication. Lemma.

For d,e≥B, mult*L_{d+e}^Pic≅L_d^Pic⊠L_e^Pic on the product Pic^√R,d×Pic^√R,e. The pullback comparison uses AJ_d×AJ_e, not AJ_{d+e}.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Pull back by the product of the two Abel–Jacobi maps.
2. The product square and α_{d,e} give the canonical isomorphism of symmetric local systems.
3. Use the supplier’s full faithfulness for the product fibration to descend it.

Inputs: FunctionFieldArithmeticPartII:GC.4/high-degree-descent, FunctionFieldArithmeticPartII:GC.3/symmetric-multiplicativity, FunctionFieldArithmeticPartII:GC.1/root-abel-jacobi.

Acceptance:

- The corrected diagram has a product domain, matching the multiplicative target.

Source:

- YZ19, Proof of Proposition A.11 p. 523 (source issues E35/E69). The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Multiplication in every integer degree

Declaration: FunctionFieldArithmeticPartII:GC.5/all-degree-multiplication. Theorem.

For all d,e∈Z there is a canonical isomorphism μ_{d,e}:mult*L_{d+e}^Pic≅L_d^Pic⊠L_e^Pic. It is the high-degree isomorphism transported by independent effective divisors D,E and normalized using L_{D+E}≅L_D⊗L_E.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Choose effective translations taking both degrees into the high range.
2. Transport high-degree multiplication through t_D×t_E and t_{D+E}.
3. Cancel the divisor lines; comparison/cocycle lemmas prove independence of both translations.

Inputs: FunctionFieldArithmeticPartII:GC.5/high-degree-multiplication, FunctionFieldArithmeticPartII:GC.5/choice-comparison, FunctionFieldArithmeticPartII:GC.5/choice-cocycle, FunctionFieldArithmeticPartII:GC.5/divisor-tensor-line.

Acceptance:

- All terms are sheaves on Picard components, never L_d on a symmetric-power space.

Planet: Picard character multiplication.

Source:

- YZ19, Proposition A.11(2) and (A.8)–(A.9) pp. 522–523. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Associativity of character multiplication

Declaration: FunctionFieldArithmeticPartII:GC.5/character-associativity. Lemma.

For all integers d,e,f, the two composites of μ for the three-degree product agree under the Picard and sheaf associators.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Translate all three degrees to the high range using three effective divisors.
2. Pull the equality back to the product of high-degree effective divisor spaces.
3. Use symmetric associativity and full faithfulness, then the translation cocycles, to descend the equality.

Inputs: FunctionFieldArithmeticPartII:GC.5/all-degree-multiplication, FunctionFieldArithmeticPartII:GC.5/choice-cocycle, FunctionFieldArithmeticPartII:GC.3/symmetric-associativity.

Acceptance:

- A multiplicative structure is proved through this equality; it is not assumed as a field.

Source:

- YZ19, Proposition A.11(3), p. 523 coherence exercise. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Commutativity and the normalized unit laws

Declaration: FunctionFieldArithmeticPartII:GC.5/character-symmetry-unit. Lemma.

The multiplication μ_{d,e} commutes with exchanging factors, and its restrictions along e×id and id×e are the identity unit maps after the canonical unit trivialization.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Translate to high degrees and compare the tensor block symmetry on effective divisors.
2. For the unit, use degree-zero effective comparison and the symmetric-sheaf unit law.
3. Descend the equalities with the fixed unit normalization and choice cocycles.

Inputs: FunctionFieldArithmeticPartII:GC.5/all-degree-multiplication, FunctionFieldArithmeticPartII:GC.5/unit-trivialization, FunctionFieldArithmeticPartII:GC.3/symmetric-symmetry, FunctionFieldArithmeticPartII:GC.5/choice-cocycle.

Acceptance:

- No extra scalar or Frobenius twist is permitted in the unit laws.

Source:

- YZ19, Proposition A.11(3) p. 523. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Character sheaves on hat section spaces

Declaration: FunctionFieldArithmeticPartII:GC.5/hat-character-pullback. Construction.

For every integer degree in which the hat section moduli problem is defined, set hatL_d=hatAJ_d*L_d^Pic. On the effective open it is canonically L_d for d≥0. This is a pullback along the entire hat map, so its zero-section stalks remain rank one.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use ordinary inverse image of the lisse character sheaf along hatAJ_d.
2. Restrict to the effective open and apply the proved Abel–Jacobi comparison.
3. The coefficient sheaf on specialized N_d matrix stacks is obtained by its existing owner’s pullback from these hat sheaves.

Inputs: FunctionFieldArithmeticPartII:GC.5/all-degree-extension, FunctionFieldArithmeticPartII:GC.5/effective-pullback, FunctionFieldArithmeticPartII:GC.1/root-abel-jacobi.

API uses:

- YZ19 §6.2.1 —  supplies the input sheaves pulled to N_d.
- YZ19 Theorem 6.3 — Its specialized consumer computes groupoid-weighted traces.

API:

- TauCeti.RamifiedClassField.hatCharacter.definition (characterisation): hatL_d is exactly hatAJ_d*L_d^Pic.
- TauCeti.RamifiedClassField.hatCharacter.effective (compatibility): Its restriction to the effective open is canonically L_d.
- TauCeti.RamifiedClassField.hatCharacter.zeroSection (compatibility): At a zero global section its stalk is the character line of the underlying root-Picard object.

Unit tests:

- TauCeti.RamifiedClassField.hatCharacter.test_effective (compatibility): The restriction agrees with the unshifted degree-zero symmetric local system.
- TauCeti.RamifiedClassField.hatCharacter.test_zero (non-example): The zero-section stalk is rank one, not zero.
- TauCeti.RamifiedClassField.hatCharacter.test_degree_zero (degenerate): At the effective empty divisor it is the coefficient line with the canonical unit.

Acceptance:

- Do not replace this by extension by zero from the effective open.

Planet: Hat Abel–Jacobi character pullback.

Source:

- YZ19, §6.2.1 pp. 496–497. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

## GC.6. Ramified norms and quadratic traces

Root multiplicative sheaf, root norm, two-categorical exactness, quadratic specialization and Frobenius trace equal to the quadratic idele character. Exact declarations, hypotheses, API and acceptance tests are in the companion packet and reader.

### The root multiplicative sheaf

Declaration: FunctionFieldArithmeticPartII:GC.6/root-multiplicative-sheaf. Definition.

On X_et define G_m,X^√R=G_m,X×_{i_*G_m,R,[2]}i_*G_m,R. Its sections are pairs (u,v) of a unit and a root unit on R satisfying u|_R=v². Its torsor stack is the root Picard stack.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Take the fibre product in sheaves of abelian multiplicative groups.
2. A torsor for this group is equivalently a G_m line-bundle torsor with a square-root torsor of its restriction and a compatible square identification.
3. Use effective line-bundle/torsor descent to identify the resulting Picard stack.

Inputs: FunctionFieldArithmeticPartII:GC.0/root-picard, FunctionFieldArithmeticPartII:GC.2/root-units, SchemeAndStackFoundations:SF.1.

API uses:

- YZ19 A.3.1–A.3.3 — Receives the root norm and its exact sheaf sequence.

API:

- TauCeti.RamifiedClassField.rootMultiplicativeSheaf.sections (characterisation): Its sections are exactly (u,v) with u|_R=v².
- TauCeti.RamifiedClassField.rootMultiplicativeSheaf.forget (projection): Forget v to G_m,X.
- TauCeti.RamifiedClassField.rootMultiplicativeSheaf.torsors (equivalence): Its torsor stack is Pic_X^√R.

Unit tests:

- TauCeti.RamifiedClassField.rootMultiplicativeSheaf.test_empty_R (degenerate): At R=∅ this is G_m,X.
- TauCeti.RamifiedClassField.rootMultiplicativeSheaf.test_kernel (computation): The forgetful kernel on R is μ₂.
- TauCeti.RamifiedClassField.rootMultiplicativeSheaf.test_nonadditive (non-example): For odd-characteristic residue rings the square map is multiplicative but does not define an additive ring map.

Acceptance:

- This is a sheaf of multiplicative groups, not a fibre-product ring using the square map.

Planet: Root multiplicative sheaf.

Source:

- YZ19, A.3.1 p. 524. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### The norm restricts to a square at ramification

Declaration: FunctionFieldArithmeticPartII:GC.6/norm-residue-square. Lemma.

For the smooth geometrically connected double cover ν:X′→X with reduced ramification R′≃R and involution σ, restriction of Nm(u) to R is (u|_{R′})². For a line bundle L′, Nm(L′)|_R≅(L′|_{R′})² canonically.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.
- ν:X′→X is finite flat of degree two, X′ smooth projective geometrically connected, R its reduced branch divisor, R′≃R.

Construction or proof:

1. At a branch point use the finite-flat local double-cover algebra, with involution t↦−t.
2. The product of u and σu restricts to the same residue twice.
3. For line bundles use the corresponding determinant norm and its base-change compatibility from the supplier.

Inputs: FunctionFieldArithmeticPartII:GC.6/root-multiplicative-sheaf, SchemeAndStackFoundations:SF.3.

Acceptance:

- The isomorphism is on the actual residue fibre, not an equality between unrelated line bundles.

Source:

- YZ19, A.3.1–A.3.2 p. 524. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Ramified norm of Picard objects

Declaration: FunctionFieldArithmeticPartII:GC.6/root-norm. Construction.

The sheaf map Nm^√R=(Nm,r_{R′}):ν_*G_m,X′→G_m,X^√R induces the root norm Pic_X′→Pic_X^√R, sending L′ to (Nm L′,L′|_{R′},ι). It lifts the ordinary norm and respects tensor products.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use the residue-square lemma to define the sheaf homomorphism.
2. Push out torsors along this map and identify them with the displayed line-bundle data.
3. The supplier’s norm tensor/base-change coherence gives the Picard functor and its multiplicativity.

Inputs: FunctionFieldArithmeticPartII:GC.6/norm-residue-square, FunctionFieldArithmeticPartII:GC.6/root-multiplicative-sheaf, SchemeAndStackFoundations:SF.3, SchemeAndStackFoundations:SF.1.

API uses:

- YZ19 A.3.2–A.3.3 — Gives the hat norm and the asserted Picard-stack sequence.

API:

- TauCeti.RamifiedClassField.rootNorm.object (simp): The object is (Nm L′,L′|_{R′},ι).
- TauCeti.RamifiedClassField.rootNorm.forget (compatibility): Forgetting roots gives the ordinary norm.
- TauCeti.RamifiedClassField.rootNorm.tensor (structure): Root norm preserves tensor product with the canonical coherent norm isomorphism.
- TauCeti.RamifiedClassField.rootNorm.baseChange (functoriality): It commutes with admissible base changes of the double cover.

Unit tests:

- TauCeti.RamifiedClassField.rootNorm.test_trivial (degenerate): The trivial upstairs line maps to the root-Picard tensor unit.
- TauCeti.RamifiedClassField.rootNorm.test_branch (computation): Its chosen root at a branch point is precisely the upstairs fibre of L′.
- TauCeti.RamifiedClassField.rootNorm.test_degree (non-example): The norm of a degree-one upstairs line has degree one, while pullback of a degree-one downstairs line has degree two.

Acceptance:

- The degree of the norm is the degree of L′, not twice that degree; ν* instead doubles degree.

Planet: Ramified root norm.

Source:

- YZ19, A.3.1 p. 524. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Étale-local surjectivity of the root norm on units

Declaration: FunctionFieldArithmeticPartII:GC.6/root-norm-surjective. Lemma.

Nm^√R:ν_*G_m,X′→G_m,X^√R is surjective as an étale sheaf under the odd-characteristic double-cover hypotheses.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Away from R split the double cover étale-locally; the product norm is surjective.
2. At a branch stalk, for (u,v) with ū=v² choose an étale-local square root a of u with a|_R=v, possible since two and v are units.
3. The scalar upstairs unit a has norm a²=u and residue v.

Inputs: FunctionFieldArithmeticPartII:GC.6/root-norm.

Acceptance:

- This is local surjectivity of sheaves, not surjectivity on every ring’s global units.

Source:

- YZ19, A.3.1 p. 524 local surjectivity calculation. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Local Hilbert 90 with root normalization

Declaration: FunctionFieldArithmeticPartII:GC.6/norm-kernel. Lemma.

As étale sheaves, ker Nm^√R is the image of u↦u/(σu), and ker(1−σ)=G_m,X inside ν_*G_m,X′. At ramification a root-normalized norm-one u has residue one, so w=1+u is locally a unit and u=w/(σw).

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. On the split locus use the explicit norm-one pair (u,u⁻¹).
2. At a branch point use σu=u⁻¹ and u|_{R′}=1; then 1+u is invertible because two is.
3. Invariant units descend through the finite-flat cover, giving the left kernel.

Inputs: FunctionFieldArithmeticPartII:GC.6/root-norm-surjective.

Acceptance:

- Ordinary norm-one residue −1 is excluded by the root normalization; 1+u would fail there.

Source:

- YZ19, A.3.3 p. 524. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### The exact ramified norm sheaf sequence

Declaration: FunctionFieldArithmeticPartII:GC.6/exact-sheaf-complex. Theorem.

The étale sheaf complex 1→G_m,X→ν_*G_m,X′→^{1−σ}ν_*G_m,X′→^{Nm^√R}G_m,X^√R→1 is exact, with specified zero composites. Passing to torsor groupoids requires its connecting obstruction data; this theorem does not claim a short exact sequence of Picard groups.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use the two local kernel calculations and sheaf surjectivity.
2. Check each composite equals the multiplicative unit by the norm/involution and residue relations.
3. Retain the intermediate kernel sheaf K=im(1−σ) for the two short exact sequences used in derived descent.

Inputs: FunctionFieldArithmeticPartII:GC.6/norm-kernel, FunctionFieldArithmeticPartII:GC.6/root-norm-surjective.

Acceptance:

- A nontrivial line bundle can become trivial under an étale pullback; group injectivity is not inferred.

Planet: Ramified norm sheaf exactness.

Source:

- YZ19, A.3.3 p. 524 displayed exact sheaf sequence. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Descent obstructions for the Picard-stack sequence

Declaration: FunctionFieldArithmeticPartII:GC.6/picard-descent-obstructions. Application.

Let K=ker Nm^√R. Interpret the exact sheaf complex as the two short exact sequences G_m→ν_*G_m→K and K→ν_*G_m→G_m^√R, and apply their derived cohomology and torsor descent. Any Picard-stack exactness statement must specify the connecting maps, coherent norm trivializations and effectiveness obstructions, rather than replacing the result by an ordinary kernel of 1−σ on line-bundle classes.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Apply the supplier’s derived torsor/cohomology comparison to each short sequence separately.
2. Track the H⁰(G_m^√R)→H¹(K) and H¹(K)→H²(G_m) connecting maps rather than dropping them.
3. For the displayed (A.11) fix a coherent exactness convention and prove its stated Picard-stack consequence; this remaining source gap is NORM-2EXACT, and is not treated as a proved theorem.

Inputs: FunctionFieldArithmeticPartII:GC.6/exact-sheaf-complex, FunctionFieldArithmeticPartII:GC.0/root-picard, SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.3.

Acceptance:

- For ν:P¹→P¹, t↦t², O_{P¹}(1) is σ-invariant but is not pullback from downstairs because pullback doubles degree. This rules out naive kernel exactness at the first upstairs Picard group.

Source:

- YZ19, A.3.3 p. 525 (A.11), source-interpretation gap. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### The norm on hat section spaces

Declaration: FunctionFieldArithmeticPartII:GC.6/hat-root-norm. Construction.

Send (L′,a′) on X′ to (Nm L′,L′|_{R′},ι,Nm a′,a′|_{R′}) on hatX_d^√R. It commutes with hat Abel–Jacobi and the root norm, and restricts to effective sections.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use the imported norm of line-bundle sections and its restriction-square compatibility.
2. Define the root section as the actual restricted upstairs section.
3. Compare the two forgetful composites directly on objects and arrows.

Inputs: FunctionFieldArithmeticPartII:GC.6/root-norm, FunctionFieldArithmeticPartII:GC.6/norm-residue-square, FunctionFieldArithmeticPartII:GC.1/root-abel-jacobi, SchemeAndStackFoundations:SF.3.

API uses:

- YZ19 A.3.2 — Exports norm compatibility to hat-space consumers.

API:

- TauCeti.RamifiedClassField.hatRootNorm.object (simp): The root line and root section are L′|_{R′} and a′|_{R′}.
- TauCeti.RamifiedClassField.hatRootNorm.abelJacobi (compatibility): hatAJ∘hatNorm≅rootNorm∘hatAJ′.
- TauCeti.RamifiedClassField.hatRootNorm.effective (characterisation): A fibrewise-nonzero upstairs section gives a fibrewise-nonzero norm section.

Unit tests:

- TauCeti.RamifiedClassField.hatRootNorm.test_zero (degenerate): A zero section maps to a zero global and root section.
- TauCeti.RamifiedClassField.hatRootNorm.test_branch (computation): At ramification the norm section restricts to the square of a′|_{R′}.
- TauCeti.RamifiedClassField.hatRootNorm.test_ordinary (compatibility): Forgetting roots recovers the ordinary norm on section spaces.

Acceptance:

- Zero upstairs sections map to zero sections with their root lines retained.

Source:

- YZ19, A.3.2 (A.10) p. 524. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### The quadratic root-curve local system

Declaration: FunctionFieldArithmeticPartII:GC.6/quadratic-input. Construction.

For the geometrically connected double cover, ν_*Q̄ℓ decomposes into the ± eigensheaves of σ; its anti-invariant restriction to U is rank one, geometrically nontrivial and has inertia −1 exactly at R. Extend it to the root curve through the tame correspondence. The parent’s arithmetic reciprocity gives η_{F′/F}:F×\A_F×→{±1}, which is trivial on the image of O_{√R}×.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use the idempotents (1±σ)/2 on rational coefficients, including ℓ=2.
2. Connectedness of X′ over kbar makes the quadratic geometric character nontrivial; the local branch calculation gives inertia sign.
3. Local reciprocity identifies the ramified unit character with the residue square character, which vanishes on modified root units.

Inputs: FunctionFieldArithmeticPartII:GC.3/tame-local-systems, FunctionFieldArithmeticPartII:GC.2/root-units, FunctionFieldArithmetic:FA.4.

API uses:

- YZ19 Proposition A.12 — Specializes the general Picard character sheaf to the quadratic idele character.

API:

- TauCeti.RamifiedClassField.quadraticInput.antiInvariant (characterisation): The input on U is the −1 eigensheaf of ν_*Q̄ℓ.
- TauCeti.RamifiedClassField.quadraticInput.inertia (compatibility): Every ramified inertia generator acts by −1.
- TauCeti.RamifiedClassField.quadraticInput.ideleCharacter (compatibility): The arithmetic character factors through the root-unit idele quotient.

Unit tests:

- TauCeti.RamifiedClassField.quadraticInput.test_split_point (computation): At a split unramified point the local Frobenius trace is +1.
- TauCeti.RamifiedClassField.quadraticInput.test_inert_point (computation): At an inert unramified point the local Frobenius trace is −1.
- TauCeti.RamifiedClassField.quadraticInput.test_geometric_connectedness (non-example): A constant quadratic cover is excluded from the geometrically nontrivial input assertion.

Acceptance:

- A geometrically disconnected constant quadratic cover would not satisfy geometric nontriviality.

Planet: Quadratic root-curve local system.

Source:

- YZ19, A.3.4 p. 525; §6.2.1 p. 496. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### The Frobenius trace is a character

Declaration: FunctionFieldArithmeticPartII:GC.6/trace-character. Lemma.

The Frobenius trace of L^Pic is a multiplicative Q̄ℓ×-valued function on isomorphism classes of Pic_X^√R(k), normalized to one at the tensor unit. Via the adelic equivalence it defines an idele character. For general input L its range is not restricted to {±1}.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Apply Frobenius to the multiplication isomorphism and take the trace of the rank-one tensor line.
2. Use the canonical unit to fix the value at e.
3. Transport through the groupoid equivalence, preserving descent invariance.

Inputs: FunctionFieldArithmeticPartII:GC.5/all-degree-multiplication, FunctionFieldArithmeticPartII:GC.5/character-associativity, FunctionFieldArithmeticPartII:GC.5/character-symmetry-unit, FunctionFieldArithmeticPartII:GC.2/adelic-root-groupoid.

Acceptance:

- The unramified order-three input has a character of order three, not a quadratic one.

Source:

- YZ19, A.2.3 p. 520 and proof of Proposition A.12 p. 525 (source issue E34). The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Closed-point tensor trace

Declaration: FunctionFieldArithmeticPartII:GC.6/closed-point-trace. Lemma.

For a closed point x∈U of degree δ, Tr(Fr_k,(L_δ)_{[x]})=Tr(Fr_x,L_x). On the tensor of δ conjugate rank-one fibres, Frobenius cyclically permutes factors and applies Fr_x on the wrapped factor.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use the symmetric stalk description for the divisor [x].
2. Choose identifications of successive Frobenius-conjugate fibres; the product tensor action wraps around once.
3. For a rank-one line its scalar is the local Fr_x scalar, independent of the choices.

Inputs: FunctionFieldArithmeticPartII:GC.5/divisor-tensor-line, FunctionFieldArithmeticPartII:GC.5/effective-pullback.

Acceptance:

- Using the δ-th power of that scalar on every tensor factor would give the wrong answer.

Source:

- YZ19, Proposition A.12 proof, (A.12) pp. 525–526. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Character determination away from the ramification divisor

Declaration: FunctionFieldArithmeticPartII:GC.6/away-ramification-generation. Lemma.

Every class of the root-Picard idele groupoid is a difference of canonical root-divisor classes supported on U, after multiplying by the modified-unit image. Thus a normalized idele character is determined by its values on π_x⁻¹ for x∈U.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use strong approximation with prescribed residue-square root frames at the finite set R to move a root-Picard object away from R.
2. Represent the resulting line bundle by a signed divisor on U through the divisor/idele dictionary.
3. Express that divisor as a difference of effective divisors; the canonical root data determine the normalized character values. This exact approximation statement is request FA-APPROX.

Inputs: FunctionFieldArithmeticPartII:GC.2/adelic-root-groupoid, FunctionFieldArithmetic:FA.2, FunctionFieldArithmetic:FA.4.

Acceptance:

- The finite residual root data cannot be discarded when moving support.

Source:

- YZ19, Proposition A.12 p. 525, character determination used in proof. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Quadratic geometric class field comparison

Declaration: FunctionFieldArithmeticPartII:GC.6/quadratic-trace. Theorem.

For the geometrically connected double cover, the Frobenius trace of its all-degree root-Picard character sheaf equals η_{F′/F} under the adelic groupoid equivalence, with π_x⁻¹↔O_X(x)^♮ and geometric Frobenius. At unramified x the value is +1 for split x and −1 for inert x.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Both functions are normalized multiplicative idele characters.
2. At x∈U use the effective-degree pullback and the cyclic tensor trace to identify the geometric trace with the local quadratic Frobenius sign.
3. Use away-ramification generation to conclude equality on every class.

Inputs: FunctionFieldArithmeticPartII:GC.6/quadratic-input, FunctionFieldArithmeticPartII:GC.6/trace-character, FunctionFieldArithmeticPartII:GC.6/closed-point-trace, FunctionFieldArithmeticPartII:GC.6/away-ramification-generation, FunctionFieldArithmeticPartII:GC.5/effective-pullback.

Acceptance:

- This endpoint is quadratic; the preceding general character construction remains unrestricted.

Planet: Ramified geometric class field theory.

Source:

- YZ19, Proposition A.12 pp. 525–526. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

## First-route coverage

All 28 routed YZ19 items are assigned. Additional finite/infinite-root consumers and the unramified overlap are coalesced with the same owner.

| Routed item | Declarations |
|---|---|
| PAPER-YUN-ZHANG-19/134 | FunctionFieldArithmeticPartII:GC.2/root-divisor-groupoid |
| PAPER-YUN-ZHANG-19/156 | FunctionFieldArithmeticPartII:GC.0/root-picard |
| PAPER-YUN-ZHANG-19/157 | FunctionFieldArithmeticPartII:GC.0/square-action-quotient |
| PAPER-YUN-ZHANG-19/158 | FunctionFieldArithmeticPartII:GC.0/root-picard-section |
| PAPER-YUN-ZHANG-19/159 | FunctionFieldArithmeticPartII:GC.1/root-symmetric-space |
| PAPER-YUN-ZHANG-19/161 | FunctionFieldArithmeticPartII:GC.1/evaluation-pullback, FunctionFieldArithmeticPartII:GC.1/root-symmetric-smooth |
| PAPER-YUN-ZHANG-19/162 | FunctionFieldArithmeticPartII:GC.1/root-addition, FunctionFieldArithmeticPartII:GC.1/ordered-divisors, FunctionFieldArithmeticPartII:GC.1/ordered-proper |
| PAPER-YUN-ZHANG-19/163 | FunctionFieldArithmeticPartII:GC.2/adelic-root-groupoid |
| PAPER-YUN-ZHANG-19/164 | FunctionFieldArithmeticPartII:GC.3/symmetric-local-system, FunctionFieldArithmeticPartII:GC.3/middle-extension |
| PAPER-YUN-ZHANG-19/165 | FunctionFieldArithmeticPartII:GC.3/cohomology-vanishing, FunctionFieldArithmeticPartII:GC.3/koszul-exterior, FunctionFieldArithmeticPartII:GC.3/exterior-cohomology |
| PAPER-YUN-ZHANG-19/166 | FunctionFieldArithmeticPartII:GC.3/collision-kernel, FunctionFieldArithmeticPartII:GC.3/collision-descent |
| PAPER-YUN-ZHANG-19/167 | FunctionFieldArithmeticPartII:GC.3/symmetric-multiplicativity, FunctionFieldArithmeticPartII:GC.3/symmetric-associativity, FunctionFieldArithmeticPartII:GC.3/symmetric-symmetry |
| PAPER-YUN-ZHANG-19/168 | FunctionFieldArithmeticPartII:GC.4/evaluation-surjective, FunctionFieldArithmeticPartII:GC.4/affine-fibre-chart, FunctionFieldArithmeticPartII:GC.4/fibre-triviality, FunctionFieldArithmeticPartII:GC.4/high-degree-descent, FunctionFieldArithmeticPartII:GC.4/empty-ramification-descent |
| PAPER-YUN-ZHANG-19/169 | FunctionFieldArithmeticPartII:GC.5/all-degree-extension, FunctionFieldArithmeticPartII:GC.5/choice-comparison, FunctionFieldArithmeticPartII:GC.5/choice-cocycle |
| PAPER-YUN-ZHANG-19/170 | FunctionFieldArithmeticPartII:GC.5/effective-pullback |
| PAPER-YUN-ZHANG-19/171 | FunctionFieldArithmeticPartII:GC.5/unit-trivialization |
| PAPER-YUN-ZHANG-19/172 | FunctionFieldArithmeticPartII:GC.5/high-degree-multiplication, FunctionFieldArithmeticPartII:GC.5/all-degree-multiplication, FunctionFieldArithmeticPartII:GC.5/character-associativity, FunctionFieldArithmeticPartII:GC.5/character-symmetry-unit |
| PAPER-YUN-ZHANG-19/173 | FunctionFieldArithmeticPartII:GC.6/root-norm, FunctionFieldArithmeticPartII:GC.6/hat-root-norm |
| PAPER-YUN-ZHANG-19/174 | FunctionFieldArithmeticPartII:GC.6/norm-kernel, FunctionFieldArithmeticPartII:GC.6/exact-sheaf-complex, FunctionFieldArithmeticPartII:GC.6/picard-descent-obstructions |
| PAPER-YUN-ZHANG-19/175 | FunctionFieldArithmeticPartII:GC.6/trace-character, FunctionFieldArithmeticPartII:GC.6/closed-point-trace, FunctionFieldArithmeticPartII:GC.6/away-ramification-generation, FunctionFieldArithmeticPartII:GC.6/quadratic-trace |
| PAPER-YUN-ZHANG-19/184 | FunctionFieldArithmeticPartII:GC.5/hat-character-pullback |
| PAPER-YUN-ZHANG-19/234 | FunctionFieldArithmeticPartII:GC.1/root-symmetric-coarse |
| PAPER-YUN-ZHANG-19/235 | FunctionFieldArithmeticPartII:GC.1/evaluation-smooth-criterion |
| PAPER-YUN-ZHANG-19/236 | FunctionFieldArithmeticPartII:GC.1/root-abel-jacobi |
| PAPER-YUN-ZHANG-19/237 | FunctionFieldArithmeticPartII:GC.3/tame-local-systems |
| PAPER-YUN-ZHANG-19/238 | FunctionFieldArithmeticPartII:GC.4/weighted-cover, FunctionFieldArithmeticPartII:GC.4/weighted-ramification, FunctionFieldArithmeticPartII:GC.4/weighted-simply-connected |
| PAPER-YUN-ZHANG-19/239 | FunctionFieldArithmeticPartII:GC.6/root-multiplicative-sheaf |
| PAPER-YUN-ZHANG-19/240 | FunctionFieldArithmeticPartII:GC.6/quadratic-input |
| PAPER-BRESCIANI-24/36 | FunctionFieldArithmeticPartII:key/root-stacks, FunctionFieldArithmeticPartII:RS.2/dvr-roots |
| PAPER-BRESCIANI-24/37 | FunctionFieldArithmeticPartII:key/root-stacks, FunctionFieldArithmeticPartII:RS.2/infinite-root-stack, FunctionFieldArithmeticPartII:RS.2/dvr-infinite-gerbe, FunctionFieldArithmeticPartII:RS.2/dvr-kummer-classes |
| PAPER-YUN-ZHANG-19/160 | FunctionFieldArithmeticPartII:RS.1/closed-fibre |
| PAPER-YUN-ZHANG-17/49 | FunctionFieldArithmeticPartII:GC.4/empty-ramification-descent, FunctionFieldArithmeticPartII:GC.5/all-degree-extension |
| PAPER-YUN-ZHANG-17/54 | FunctionFieldArithmeticPartII:GC.3/exterior-cohomology |

## Proposed symplectic L-value sibling

The split preserves the full reviewed contracts in the packet. The following six stages give the sibling’s exact item assignments. They are proposals, not existing atlas stages.

### SL.0. Normalized symplectic Frobenius and central square classes

| Item | Target |
|---|---|
| PAPER-ABDURRAHMAN-VENKATESH-25/39 | Functional equation and ε-factors with torsion coefficients |
| PAPER-ABDURRAHMAN-VENKATESH-25/40 | The normalized Frobenius is special orthogonal |
| PAPER-ABDURRAHMAN-VENKATESH-25/41 | The square classes L(X, ρ) and L^*(X, ρ) |
| PAPER-ABDURRAHMAN-VENKATESH-25/42 | Lemma 3.5.1 and §3.5: square discriminant of H^1 |
| PAPER-ABDURRAHMAN-VENKATESH-25/43 | The trace map and c_et(X, ρ) |
| PAPER-ABDURRAHMAN-VENKATESH-25/44 | Admissible and GSp-admissible pairs |
| PAPER-ABDURRAHMAN-VENKATESH-25/45 | Theorem 3.1: the main theorem |
| PAPER-ABDURRAHMAN-VENKATESH-25/46 | Equivalence of the Sp and GSp formulations |
| PAPER-ABDURRAHMAN-VENKATESH-25/47 | Lemma 3.9.1: even valuation of central values of compatible systems |
| PAPER-ABDURRAHMAN-VENKATESH-25/48 | Larsen's big-image theorem for compatible systems |
| PAPER-ABDURRAHMAN-VENKATESH-25/49 | §3.10 (*): Theorem 3.1 determines L-values of compatible systems |

### SL.1. Valuations and characteristic-zero compatible systems

| Item | Target |
|---|---|
| PAPER-ABDURRAHMAN-VENKATESH-25/50 | The defect δ(X, ρ) and Frobenius of k |
| PAPER-ABDURRAHMAN-VENKATESH-25/51 | Step A: the defect is a Dirichlet character |
| PAPER-ABDURRAHMAN-VENKATESH-25/52 | Step B: χ_{r,ℓ} is unramified outside 2ℓ |

### SL.2. Hurwitz-stack Step A

| Item | Target |
|---|---|
| PAPER-ABDURRAHMAN-VENKATESH-25/53 | Steps A and B imply Theorem 3.1 |
| PAPER-ABDURRAHMAN-VENKATESH-25/54 | Hurwitz stacks 𝔐^G_g and 𝔐^{G*}_g |
| PAPER-ABDURRAHMAN-VENKATESH-25/55 | Livingston–Dunfield–Thurston: mapping class group orbits on surjections |
| PAPER-ABDURRAHMAN-VENKATESH-25/56 | Lemma 5.1.1: irreducibility in large genus |
| PAPER-ABDURRAHMAN-VENKATESH-25/57 | The universal classes 𝔜 and 𝔜′ |
| PAPER-ABDURRAHMAN-VENKATESH-25/58 | Lemma 5.2.1: 𝔜 = 𝔜′ on the geometric generic fibre |
| PAPER-ABDURRAHMAN-VENKATESH-25/59 | Lemma 5.3.1: 𝔜 − 𝔜′ comes from Z[1/N] |
| PAPER-ABDURRAHMAN-VENKATESH-25/60 | §5.4 Claim: odd-degree cyclic covers preserve δ |

### SL.3. Hilbert–Siegel systems and unit-reduction fields

| Item | Target |
|---|---|
| PAPER-ABDURRAHMAN-VENKATESH-25/61 | §5.4.1: ε-factors of twists of symplectic systems |
| PAPER-ABDURRAHMAN-VENKATESH-25/62 | §5.5 Claim: raising the genus |
| PAPER-ABDURRAHMAN-VENKATESH-25/63 | §6.1 Claim: totally real fields with prescribed unit reduction |
| PAPER-ABDURRAHMAN-VENKATESH-25/64 | Compatible systems on the Hilbert–Siegel variety |
| PAPER-ABDURRAHMAN-VENKATESH-25/65 | Vanishing of H^1 of the Hilbert–Siegel variety |

### SL.4. Slicing, moments and Step B

| Item | Target |
|---|---|
| PAPER-ABDURRAHMAN-VENKATESH-25/66 | Lemma 6.3.1: α_C = 0 |
| PAPER-ABDURRAHMAN-VENKATESH-25/67 | Lemma 6.3.2: killing α on special fibres |
| PAPER-ABDURRAHMAN-VENKATESH-25/68 | Slicing down to a surface |
| PAPER-ABDURRAHMAN-VENKATESH-25/69 | Guralnick–Tiep: the eighth-moment criterion for SO |
| PAPER-ABDURRAHMAN-VENKATESH-25/70 | Lemma 6.4.2: points impose independent conditions on hypersurfaces |
| PAPER-ABDURRAHMAN-VENKATESH-25/71 | Lemma 6.4.1: slices with nonvanishing central value |
| PAPER-ABDURRAHMAN-VENKATESH-25/72 | Lemma 6.5.1: c_et of the slices |
| PAPER-ABDURRAHMAN-VENKATESH-25/73 | Lemma 6.5.2: L-value of the slices |

### SL.5. Quaternionic tests beyond the main hypotheses

| Item | Target |
|---|---|
| PAPER-ABDURRAHMAN-VENKATESH-25/91 | c_et on the quaternion group |
| PAPER-ABDURRAHMAN-VENKATESH-25/92 | Both sides of Theorem 3.1 for quaternionic covers of curves |
| PAPER-ABDURRAHMAN-VENKATESH-25/93 | Numerical examples beyond the hypotheses of Theorem 3.1 |

For a smooth projective geometrically irreducible curve X/F_q and geometrically surjective ρ:π₁(X)→Sp_{2r}(ℓ), ℓ finite of characteristic different from 2 and char F_q, require q coprime to #Sp_{2r}(ℓ), q a square in the prime field of ℓ, #ℓ≡±1 mod 8 and q≡1 mod 8. Outside (r,#ℓ)=(1,9) the v1 proof target is L*=trace_X(ρ*c_et) in ℓ×/(ℓ×)². When the central value is zero use the normalized-Frobenius spinor norm, not a nonexistent square class of zero. Preserve the source-scoped characteristic-zero §3.10 statement and its degree >4r²/density-one hypotheses.

The sibling imports: SymplecticReidemeisterTorsionModSquares: Theorem 2.1 and finite-coefficient extension of (1.5)/circle formula; StableReductionPartII:key/moduli-curves (reserved canonical moduli definition); FunctionFieldArithmetic:FA.3–FA.5; DeligneWeightsAndPurity:DWP.3/DWP.7–DWP.8; WeilConjectures:WC.2; EtaleDualityAndPerverseSheaves:EDC.2/EDC.4/EDC.8; LefschetzPencilsAndVanishingCycles:LPV.3; InverseGaloisAndArithmeticFundamentalGroups:IG.1/IG.5; AlgebraicModuliForArithmeticGeometry:R09.4; PELModuli:M1–M2; ShimuraVarieties:V2; ShimuraCompactifications:C5; ArithmeticLocallySymmetricSpaces:ALS.1; MotivicEtaleKTheory:M.8.

Required source corrections:

- AV E4: exclude r=1,#ℓ=9 from the v1-supported main theorem until Step A is repaired component by component; H₂(SL₂(F₉),Z)=Z/3 prevents the asserted geometric irreducibility.
- AV E25: require route A’s circle/mapping-torus formula over finite fields of odd characteristic; characteristic-zero Jacobson–Morozov is not enough.
- Keep all AV E1–E25 with the future route, including Poonen D≥r−1, the unramified-at-m wording and the zero-central-value quaternion cases; do not upgrade the version-of-record without reading it.

## Open contracts and precise continuation

### STACK-GEOM — SchemeAndStackFoundations:SF.1

Supply the algebraic-space representable-diagonal and atlas interface, scheme/space chart fibre products and effective fpqc descent of affine schemes and their morphisms. Identify faithful flatness of an affine ring map with flatness and surjectivity of its Spec map. Ordinary quotient stacks/two-fibre products are imported from D0; algebraicity of finite root quotients is requested from R09.4 and their coarse universal property from R09.5. No foundational stack carrier or root stack is rebuilt here.

Needed by: FunctionFieldArithmeticPartII:key/root-stacks, FunctionFieldArithmeticPartII:RS.1/two-pullback, FunctionFieldArithmeticPartII:RS.1/affine-chart, FunctionFieldArithmeticPartII:RS.1/closed-fibre, FunctionFieldArithmeticPartII:RS.1/coarse-space, FunctionFieldArithmeticPartII:RS.1/regular-dm, FunctionFieldArithmeticPartII:RS.2/dvr-infinite-gerbe, FunctionFieldArithmeticPartII:RS.2/dvr-kummer-classes, FunctionFieldArithmeticPartII:GC.0/root-picard, FunctionFieldArithmeticPartII:GC.0/square-action-quotient, FunctionFieldArithmeticPartII:GC.1/evaluation-pullback, FunctionFieldArithmeticPartII:GC.1/evaluation-smooth-criterion, FunctionFieldArithmeticPartII:GC.1/ordered-proper, FunctionFieldArithmeticPartII:GC.4/weighted-cover, FunctionFieldArithmeticPartII:GC.6/root-multiplicative-sheaf, FunctionFieldArithmeticPartII:GC.6/root-norm, FunctionFieldArithmeticPartII:GC.6/picard-descent-obstructions.

### CURVE-GEOM — SchemeAndStackFoundations:SF.3

Supply ordinary line-bundle Picard stacks in all integer degrees and Pic^d torsors without chosen k-rational point, Sym^d X and effective-section equivalence, smoothness of symmetric powers, coherent Riemann–Roch/Serre duality and family base change/evaluation, closed-point divisors, line-bundle norm and norm sections for finite-flat curve covers. Integrate upstream JacobianChallenge A/B/D/F and AlgebraicCurves’ comparison dictionary instead of constructing them here. The existing function-field Riemann–Roch theorem alone does not supply this family geometry.

Needed by: FunctionFieldArithmeticPartII:GC.0/root-picard, FunctionFieldArithmeticPartII:GC.0/square-action-quotient, FunctionFieldArithmeticPartII:GC.1/root-symmetric-space, FunctionFieldArithmeticPartII:GC.1/evaluation-pullback, FunctionFieldArithmeticPartII:GC.1/incidence-transversality, FunctionFieldArithmeticPartII:GC.2/adelic-root-groupoid, FunctionFieldArithmeticPartII:GC.4/evaluation-surjective, FunctionFieldArithmeticPartII:GC.4/weighted-cover, FunctionFieldArithmeticPartII:GC.4/weighted-simply-connected, FunctionFieldArithmeticPartII:GC.4/empty-ramification-descent, FunctionFieldArithmeticPartII:GC.5/auxiliary-divisors, FunctionFieldArithmeticPartII:GC.6/norm-residue-square, FunctionFieldArithmeticPartII:GC.6/root-norm, FunctionFieldArithmeticPartII:GC.6/picard-descent-obstructions, FunctionFieldArithmeticPartII:GC.6/hat-root-norm.

### FA-ADELES — FunctionFieldArithmetic:FA.2

Supply the function-field local rings/completions, residue maps and unit groups, ideles and degree, the divisor/idele gluing equivalence and strong approximation with specified finite local congruences. A number-field idele construction is insufficient.

Needed by: FunctionFieldArithmeticPartII:GC.2/root-units, FunctionFieldArithmeticPartII:GC.2/adelic-root-groupoid, FunctionFieldArithmeticPartII:GC.6/away-ramification-generation.

### FA-RECIPROCITY — FunctionFieldArithmetic:FA.4

Supply geometric-Frobenius-normalized quadratic reciprocity, local residue-square character at odd-characteristic ramified places, and the character-determination statement after finite congruence conditions. For x outside R, inverse uniformizer corresponds to O_X(x) and yields the local quadratic Frobenius sign. Infinite reciprocity keeps profinite completion/dense image.

Needed by: FunctionFieldArithmeticPartII:GC.6/quadratic-input, FunctionFieldArithmeticPartII:GC.6/away-ramification-generation.

### PI1 — InverseGaloisAndArithmeticFundamentalGroups:IG.0

Supply the scheme finite-étale-cover/fibre-functor equivalence and projective-space simple connectivity in the stated geometric setting. The packet’s existing IG.2 specialization nodes do not provide IG.0. Root-stack extensions are separately gap ST-LISSE, not silently asserted by this scheme request.

Needed by: FunctionFieldArithmeticPartII:GC.3/tame-local-systems, FunctionFieldArithmeticPartII:GC.3/symmetric-multiplicativity, FunctionFieldArithmeticPartII:GC.4/weighted-simply-connected, FunctionFieldArithmeticPartII:GC.4/empty-ramification-descent.

### TAME-INERTIA — InverseGaloisAndArithmeticFundamentalGroups:IG.1

Supply geometric/arithmetic scheme fundamental-group exact sequences and tame local inertia for punctured smooth curves, with the arithmetic/geometric Frobenius conventions. The root-stack inertia comparison is separately gap ST-LISSE.

Needed by: FunctionFieldArithmeticPartII:GC.3/tame-local-systems.

### DUALITY-SCHEME — EtaleDualityAndPerverseSheaves:EDC.2:pairings

Supply the scheme graded Poincaré pairing and its rank-one/dual-character vanishing interface. The smooth-DM and rational tame-coarse comparisons consumed here require the shared stacks Part II and remain gap ST-OPS.

Needed by: FunctionFieldArithmeticPartII:GC.3/cohomology-vanishing.

### JAC-A — SchemeAndStackFoundations:SF.3

Complete the upstream native invertible-sheaf interface: bilinear global-section tensor map, unit section, coherent n-th tensor powers, pullback preserving invertibility and compatibility of powers and section powers with identity/composition. Use the existing native sheaf and tensor operations; no replacement line-bundle category is acceptable. In trivial-line coordinates, the bilinear tensor-section map followed by the native unit isomorphism must evaluate to multiplication, and the free unit section must have coordinate 1. These are generic native sheaf tensor compatibility lemmas, not new root-specific geometric types.

Needed by: FunctionFieldArithmeticPartII:RS.0/tensor-power, FunctionFieldArithmeticPartII:RS.0/section-power, FunctionFieldArithmeticPartII:RS.0/root-object, FunctionFieldArithmeticPartII:key/root-stacks, FunctionFieldArithmeticPartII:RS.2/transition, FunctionFieldArithmeticPartII:RS.0/trivial-power-isomorphism, FunctionFieldArithmeticPartII:RS.0/section-power-in-trivialization, FunctionFieldArithmeticPartII:RS.0/section-power-transport.

### ORDINARY-STACKS — DiamondsAndVStacks:D0

On the fixed fpqc scheme site, use the existing ordinary quotient/two-fibre-product node and supply [A1/Gm] as the stack of native invertible modules with sections, with its monoidal power maps. The inverse-system carrier must retain transition isomorphisms and cocycles. Infinite affine-group quotients use fpqc torsors and do not assert algebraic finite presentation.

Needed by: FunctionFieldArithmeticPartII:key/root-stacks, FunctionFieldArithmeticPartII:RS.1/two-pullback, FunctionFieldArithmeticPartII:RS.1/affine-chart, FunctionFieldArithmeticPartII:RS.1/closed-fibre, FunctionFieldArithmeticPartII:RS.2/infinite-root-stack, FunctionFieldArithmeticPartII:RS.2/infinite-affine-quotient, FunctionFieldArithmeticPartII:RS.2/kummer-torsor-limit, FunctionFieldArithmeticPartII:GC.0/root-picard, FunctionFieldArithmeticPartII:GC.0/square-action-quotient.

### ROOT-ALGEBRAIC — AlgebraicModuliForArithmeticGeometry:R09.4

Apply the algebraic quotient criterion to [Spec A[t]/(t^n-f)/μ_n] for finite flat diagonalizable μ_n, using a smooth atlas obtained through μ_n→Gm. Supply inertia/DM criteria with actual branch-point and exponent-invertibility hypotheses and the regularity comparison. This is the general algebraic-stack criterion owned by R09.4, not the root construction itself. Do not call the infinite fpqc quotient algebraic of finite presentation.

Needed by: FunctionFieldArithmeticPartII:RS.1/affine-chart, FunctionFieldArithmeticPartII:RS.1/regular-dm.

### ROOT-COARSE — AlgebraicModuliForArithmeticGeometry:R09.5

For a finite diagonalizable group acting on an affine scheme, give the quotient stack’s coarse-space universal property from its invariant algebra, with compatibility under arbitrary base change in this linearly reductive case. Distinguish it from general finite-inertia flat/tame base-change statements and from a fine moduli object.

Needed by: FunctionFieldArithmeticPartII:RS.1/coarse-space.

### TOWER-AFF — SchemeAndStackFoundations:SF.1

For a positive-divisibility system of finite μ_n frame torsors over any test scheme T, with affine faithfully flat transition maps inducing μ_(nm)→μ_n, prove the affine inverse limit is faithfully flat over T and an fpqc lim μ_n torsor. Finite quotient gives the original torsors, with all comparisons and arrows; filtered colimit commutes with the tensor products in the torsor equation. Supply the finite-type affine-chart/closed-point residue-field comparison over Q used in the non-fppf example.

Needed by: FunctionFieldArithmeticPartII:RS.2/kummer-torsor-limit, FunctionFieldArithmeticPartII:RS.2/infinite-affine-quotient, FunctionFieldArithmeticPartII:RS.2/kummer-tower-not-fppf.

### KUMMER-FINITE — SchemeAndStackFoundations:SF.2

For every positive n over an arbitrary field k, the fppf Kummer sequence is exact and identifies μ_n torsor classes with H1_fppf(k,μ_n)=k×/(k×)^n, using H1(k,Gm)=Pic(k)=0. Retain the actual quotient maps μ_(nm)→μ_n and compatibility on classes. Identify torsor classes with derived H1 on the fpqc site for the affine inverse-limit band G. No assertion that every fpqc G-torsor is fppf-locally trivial is allowed.

Needed by: FunctionFieldArithmeticPartII:RS.2/kummer-limit-class-lift, FunctionFieldArithmeticPartII:RS.2/dvr-kummer-classes.

### ST-LISSE — Root-stack lisse categories and effective descent

The atlas scheme lisse/fundamental-group suppliers do not yet provide root-curve inertia comparison, full faithfulness on dense opens of normal DM stacks, or the nonproper high-degree Abel–Jacobi locally trivial-fibration descent theorem with the explicit affine fibre charts. Obtain source-qualified proofs from the coordinated EtaleDualityAndPerverseSheavesPartIIStacks proposal. Its ST.0–ST.6 keys are provisional, not registered stages or reserved node IDs, and are not used as pretend prerequisites. This is a typed-and-proof leaf, not a claim that connected fibres alone imply descent.

Needed by: FunctionFieldArithmeticPartII:GC.3/tame-local-systems, FunctionFieldArithmeticPartII:GC.3/symmetric-multiplicativity, FunctionFieldArithmeticPartII:GC.4/weighted-simply-connected, FunctionFieldArithmeticPartII:GC.4/empty-ramification-descent, FunctionFieldArithmeticPartII:GC.4/high-degree-descent.

### ST-OPS — Source-qualified sheaf operations for the nonrepresentable ordered map

Supply Q̄ℓ constructible/lisse categories on these tame DM stacks, external tensor/Künneth, proper base change, rational finite-groupoid cohomology vanishing, the precise quasi-finite nonrepresentable pushforward/intermediate-extension theorem and the lisse rank-one extension criterion. Supply smooth-DM duality and the curve cohomological bound. Scheme EDC.5 or EDC.7 alone cannot serve as these statements, and no unrestricted Artin-stack boundedness or decomposition theorem is inferred.

Needed by: FunctionFieldArithmeticPartII:GC.3/symmetric-local-system, FunctionFieldArithmeticPartII:GC.3/middle-extension, FunctionFieldArithmeticPartII:GC.3/collision-descent, FunctionFieldArithmeticPartII:GC.3/cohomology-vanishing, FunctionFieldArithmeticPartII:GC.3/exterior-cohomology.

### NORM-2EXACT — Picard-stack consequence of the four-term exact sheaf complex

Specify the coherent exactness notion intended in (A.11), its null-homotopies and descent obstructions, and prove the precise consequence from the two short exact sheaf sequences. For the ramified cover P¹→P¹, t↦t², O(1) is σ-invariant while pullback degrees are even; this rejects ordinary kernel exactness. A bare isomorphism L′≅σ*L′ does not supply the missing compatible root-normalized descent data. This is a new source-interpretation gap, not a proof of false intended two-categorical exactness. It does not block the independent Proposition A.12 trace proof.

Needed by: FunctionFieldArithmeticPartII:GC.6/picard-descent-obstructions.

### FA-APPROX — Support-moving approximation with all residue-root frames

The final character-determination step needs strong approximation that moves a root-Picard representative away from R while matching its chosen square-root frames, modulo the actual modified-unit image. The parent stages state general arithmetic objects but have no exact blueprint node giving this contract. The requested precise statement and its closed-point generator proof must be supplied.

Needed by: FunctionFieldArithmeticPartII:GC.6/away-ramification-generation, FunctionFieldArithmeticPartII:GC.6/quadratic-trace.

### EXTERIOR-COMP — Comparison of graded antisymmetrization with the native exterior power

Confirm or add the exact native exterior-power equivalence for graded degree-one tensor invariants, with rational averaging and Frobenius functoriality. The baseline declaration read gives the exterior-power type, not this comparison theorem; no claim that the comparison is already built is made.

Needed by: FunctionFieldArithmeticPartII:GC.3/koszul-exterior, FunctionFieldArithmeticPartII:GC.3/exterior-cohomology.

### LEAN-GEOMETRY — Signatures blocked by absent geometric carriers

The suggested file prototypes the native root-object and affine-action fragment. All other geometric signatures need the actual algebraic-stack, Picard-stack, torsor, root pullback and constructible/lisse sheaf types from the requests and ST-LISSE/ST-OPS. The file carries an exhaustive omission ledger by declaration/API/test name; it does not replace missing types or conditions with arbitrary predicate fields. Complete those typed signatures after their suppliers fix their concrete types, and compile with an existing pinned build. No such build is available in this worker session.

Needed by: FunctionFieldArithmeticPartII:key/root-stacks, FunctionFieldArithmeticPartII:RS.1/two-pullback, FunctionFieldArithmeticPartII:RS.1/base-change, FunctionFieldArithmeticPartII:RS.1/affine-chart, FunctionFieldArithmeticPartII:RS.1/closed-fibre, FunctionFieldArithmeticPartII:RS.1/coarse-space, FunctionFieldArithmeticPartII:RS.1/regular-dm, FunctionFieldArithmeticPartII:RS.2/transition, FunctionFieldArithmeticPartII:RS.2/infinite-root-stack, FunctionFieldArithmeticPartII:RS.2/infinite-base-change, FunctionFieldArithmeticPartII:RS.2/dvr-roots, FunctionFieldArithmeticPartII:RS.2/dvr-infinite-gerbe, FunctionFieldArithmeticPartII:RS.2/dvr-kummer-classes, FunctionFieldArithmeticPartII:GC.0/root-picard, FunctionFieldArithmeticPartII:GC.0/square-action-quotient, FunctionFieldArithmeticPartII:GC.0/root-picard-section, FunctionFieldArithmeticPartII:GC.1/root-symmetric-space, FunctionFieldArithmeticPartII:GC.1/evaluation-pullback, FunctionFieldArithmeticPartII:GC.1/incidence-transversality, FunctionFieldArithmeticPartII:GC.1/evaluation-smooth-criterion, FunctionFieldArithmeticPartII:GC.1/root-symmetric-smooth, FunctionFieldArithmeticPartII:GC.1/root-symmetric-coarse, FunctionFieldArithmeticPartII:GC.1/root-addition, FunctionFieldArithmeticPartII:GC.1/ordered-divisors, FunctionFieldArithmeticPartII:GC.1/ordered-proper, FunctionFieldArithmeticPartII:GC.1/root-abel-jacobi, FunctionFieldArithmeticPartII:GC.2/root-units, FunctionFieldArithmeticPartII:GC.2/adelic-root-groupoid, FunctionFieldArithmeticPartII:GC.2/root-divisor-groupoid, FunctionFieldArithmeticPartII:GC.3/tame-local-systems, FunctionFieldArithmeticPartII:GC.3/symmetric-local-system, FunctionFieldArithmeticPartII:GC.3/collision-kernel, FunctionFieldArithmeticPartII:GC.3/middle-extension, FunctionFieldArithmeticPartII:GC.3/collision-descent, FunctionFieldArithmeticPartII:GC.3/cohomology-vanishing, FunctionFieldArithmeticPartII:GC.3/koszul-exterior, FunctionFieldArithmeticPartII:GC.3/exterior-cohomology, FunctionFieldArithmeticPartII:GC.3/multiplicity-free-product, FunctionFieldArithmeticPartII:GC.3/symmetric-multiplicativity, FunctionFieldArithmeticPartII:GC.3/symmetric-associativity, FunctionFieldArithmeticPartII:GC.3/symmetric-symmetry, FunctionFieldArithmeticPartII:GC.4/evaluation-surjective, FunctionFieldArithmeticPartII:GC.4/affine-fibre-chart, FunctionFieldArithmeticPartII:GC.4/weighted-cover, FunctionFieldArithmeticPartII:GC.4/weighted-ramification, FunctionFieldArithmeticPartII:GC.4/weighted-simply-connected, FunctionFieldArithmeticPartII:GC.4/fibre-triviality, FunctionFieldArithmeticPartII:GC.4/empty-ramification-descent, FunctionFieldArithmeticPartII:GC.4/high-degree-descent, FunctionFieldArithmeticPartII:GC.5/auxiliary-divisors, FunctionFieldArithmeticPartII:GC.5/divisor-tensor-line, FunctionFieldArithmeticPartII:GC.5/translate-high-degree, FunctionFieldArithmeticPartII:GC.5/all-degree-extension, FunctionFieldArithmeticPartII:GC.5/choice-comparison, FunctionFieldArithmeticPartII:GC.5/choice-cocycle, FunctionFieldArithmeticPartII:GC.5/effective-pullback, FunctionFieldArithmeticPartII:GC.5/unit-trivialization, FunctionFieldArithmeticPartII:GC.5/high-degree-multiplication, FunctionFieldArithmeticPartII:GC.5/all-degree-multiplication, FunctionFieldArithmeticPartII:GC.5/character-associativity, FunctionFieldArithmeticPartII:GC.5/character-symmetry-unit, FunctionFieldArithmeticPartII:GC.5/hat-character-pullback, FunctionFieldArithmeticPartII:GC.6/root-multiplicative-sheaf, FunctionFieldArithmeticPartII:GC.6/norm-residue-square, FunctionFieldArithmeticPartII:GC.6/root-norm, FunctionFieldArithmeticPartII:GC.6/root-norm-surjective, FunctionFieldArithmeticPartII:GC.6/norm-kernel, FunctionFieldArithmeticPartII:GC.6/exact-sheaf-complex, FunctionFieldArithmeticPartII:GC.6/picard-descent-obstructions, FunctionFieldArithmeticPartII:GC.6/hat-root-norm, FunctionFieldArithmeticPartII:GC.6/quadratic-input, FunctionFieldArithmeticPartII:GC.6/trace-character, FunctionFieldArithmeticPartII:GC.6/closed-point-trace, FunctionFieldArithmeticPartII:GC.6/away-ramification-generation, FunctionFieldArithmeticPartII:GC.6/quadratic-trace, FunctionFieldArithmeticPartII:RS.1/root-fpqc-descent, FunctionFieldArithmeticPartII:RS.2/factorial-root-limit, FunctionFieldArithmeticPartII:RS.2/kummer-torsor-limit, FunctionFieldArithmeticPartII:RS.2/kummer-limit-iso-detection, FunctionFieldArithmeticPartII:RS.2/kummer-limit-class-lift, FunctionFieldArithmeticPartII:RS.2/infinite-affine-quotient, FunctionFieldArithmeticPartII:RS.2/kummer-tower-not-fppf.

### LEAN-SECTION-COMP — Native root-coordinate proofs after signature completion

The previously omitted RootObject.test_trivialization now has a native suggested signature, using actual line isomorphisms, the pinned freePUnitIsoUnit coordinate map and the computed image-of-one coefficient. Six nodes expose the canonical trivial-power comparison, section-power coordinates, unit coefficient, root equation and arrow scalar laws, including the promoted section-power transport API. The generic section-tensor multiplication/unit evaluation contract stays with JAC-A/SF.3. Its proof is not certified by source-only signature inspection, and no Tau Ceti build at the exact pin was found. Complete the actual supplier proofs, tensor-power coherence and full-file elaboration before closing this gap.

Needed by: FunctionFieldArithmeticPartII:RS.0/root-object, FunctionFieldArithmeticPartII:RS.0/trivial-power-isomorphism, FunctionFieldArithmeticPartII:RS.0/section-power-in-trivialization, FunctionFieldArithmeticPartII:RS.0/root-identification-unit, FunctionFieldArithmeticPartII:RS.0/root-trivialization-equation, FunctionFieldArithmeticPartII:RS.0/root-arrow-scalars, FunctionFieldArithmeticPartII:RS.0/section-power-transport.

### TOWER-TYPING — Typed infinite fpqc comparison and root-limit coherence

The finite affine maps/basis and root-specific proof leaves are explicit. Complete the TOWER-AFF limit-torsor verification on native affine schemes and the factorial compatible-object comparison with the actual root groupoid carrier. The infinite quotient/Kummer/geometric signatures still need those carriers; native finite algebra signatures do not certify the infinite comparison.

Needed by: FunctionFieldArithmeticPartII:RS.2/factorial-root-limit, FunctionFieldArithmeticPartII:RS.2/kummer-torsor-limit, FunctionFieldArithmeticPartII:RS.2/kummer-limit-iso-detection, FunctionFieldArithmeticPartII:RS.2/kummer-limit-class-lift, FunctionFieldArithmeticPartII:RS.2/infinite-affine-quotient, FunctionFieldArithmeticPartII:RS.2/kummer-tower-not-fppf.

### Remaining work by stage

- FunctionFieldArithmeticPartII:RS.0 (partial): Resolve JAC-A’s actual tensor-section/unit coordinate and pullback contracts. Implement and elaborate the five native root-coordinate comparison nodes and full-file signatures at the exact pins. The separate native proof extraction now checks the complete coefficient table, kernel/image criteria and sharp injectivity/surjectivity/bijectivity statements. Complete the specified module kernel/cokernel equivalences, unit inverse, determinant, field ranks and the still-open nonvanishing examples; then the geometric suppliers and full-file elaboration. Neither the whole Tau Ceti file nor this partial packet is certified.
- FunctionFieldArithmeticPartII:RS.1 (partial): Resolve supplier contract STACK-GEOM.; Resolve supplier contract JAC-A.; Resolve recorded gap LEAN-GEOMETRY.; Complete the imported arbitrary-QCoh fpqc equivalence and its tensor/unit comparisons before root-fpqc-descent closes.; Resolve the D0 ordinary quotient, R09.4 algebraicity and R09.5 coarse contracts under the accepted ownership boundary.
- FunctionFieldArithmeticPartII:RS.2 (partial): Resolve supplier contract STACK-GEOM.; Resolve supplier contract JAC-A.; Resolve recorded gap LEAN-GEOMETRY.; Complete the native finite affine transition, iterated quotient, finite-free basis and faithful-flatness proofs.; Complete TOWER-AFF, KUMMER-FINITE and TOWER-TYPING. Infinite torsors and H1 use fpqc; finite Kummer remains fppf. Preserve the roots-of2 counterexample.; Finish coherent factorial reindexing, infinite affine quotient and finite-stage injectivity/surjectivity on Kummer classes; neither set limits nor field points replace these comparisons.
- FunctionFieldArithmeticPartII:GC.0 (partial): Resolve supplier contract STACK-GEOM.; Resolve supplier contract CURVE-GEOM.; Resolve recorded gap LEAN-GEOMETRY.
- FunctionFieldArithmeticPartII:GC.1 (partial): Resolve supplier contract STACK-GEOM.; Resolve supplier contract CURVE-GEOM.; Resolve recorded gap LEAN-GEOMETRY.
- FunctionFieldArithmeticPartII:GC.2 (partial): Resolve supplier contract CURVE-GEOM.; Resolve supplier contract FA-ADELES.; Resolve recorded gap LEAN-GEOMETRY.
- FunctionFieldArithmeticPartII:GC.3 (partial): Resolve supplier contract PI1.; Resolve supplier contract TAME-INERTIA.; Resolve supplier contract DUALITY-SCHEME.; Resolve recorded gap ST-LISSE.; Resolve recorded gap ST-OPS.; Resolve recorded gap EXTERIOR-COMP.; Resolve recorded gap LEAN-GEOMETRY.
- FunctionFieldArithmeticPartII:GC.4 (partial): Resolve supplier contract STACK-GEOM.; Resolve supplier contract CURVE-GEOM.; Resolve supplier contract PI1.; Resolve recorded gap ST-LISSE.; Resolve recorded gap LEAN-GEOMETRY.
- FunctionFieldArithmeticPartII:GC.5 (partial): Resolve supplier contract CURVE-GEOM.; Resolve recorded gap LEAN-GEOMETRY.
- FunctionFieldArithmeticPartII:GC.6 (partial): Resolve supplier contract STACK-GEOM.; Resolve supplier contract CURVE-GEOM.; Resolve supplier contract FA-ADELES.; Resolve supplier contract FA-RECIPROCITY.; Resolve recorded gap NORM-2EXACT.; Resolve recorded gap FA-APPROX.; Resolve recorded gap LEAN-GEOMETRY.

## Baseline additions checked in this continuation

- mathlib:AlgebraicGeometry.Scheme.fpqcTopology — The pinned topology from jointly surjective quasi-compact families of flat scheme morphisms; it is subcanonical. Infinite torsors use this topology. Source: Mathlib/AlgebraicGeometry/Sites/Fpqc.lean.
- mathlib:Module.FaithfullyFlat.of_linearEquiv — Faithful flatness is transported through a linear equivalence; this works without a nonzero-ring assumption. Source: Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean.
- mathlib:Module.FaithfullyFlat.finsupp — A free Finsupp module on a nonempty index type is faithfully flat, including a zero coefficient ring. Source: Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean.
- mathlib:Nat.dvd_factorial — A positive m dividing a factorial once m≤n; gives cofinality of the factorial subsequence. Source: Mathlib/Data/Nat/Factorial/Basic.lean.
- mathlib:Nat.factorial_dvd_factorial — Factorials respect divisibility as their indices increase. Source: Mathlib/Data/Nat/Factorial/Basic.lean.
- mathlib:nonempty_sections_of_finite_cofiltered_system — A Type-valued functor on a cofiltered-or-empty category, whose values are finite and nonempty, has a compatible section; no surjectivity of transition maps is required. Source: Mathlib/CategoryTheory/CofilteredSystem.lean.
- mathlib:rootsOfUnityEquivNthRoots — For positive n and a commutative domain, rootsOfUnity n R is equivalent to the roots of X^n−1; the following pinned instance proves it finite. Source: Mathlib/RingTheory/RootsOfUnity/Basic.lean.
- mathlib:Polynomial.irreducible_of_eisenstein_criterion — Eisenstein irreducibility for a primitive positive-degree polynomial at a prime ideal, with the constant coefficient outside its square. Source: Mathlib/RingTheory/Polynomial/Eisenstein/Criterion.lean.
- mathlib:Polynomial.IsPrimitive.Int.irreducible_iff_irreducible_map_cast — Gauss irreducibility comparison from a primitive integer polynomial to its rational-coefficient polynomial. Source: Mathlib/RingTheory/Polynomial/GaussLemma.lean.
- mathlib:minpoly.eq_of_irreducible_of_monic — An irreducible monic polynomial vanishing at x is its minimal polynomial over the field. Source: Mathlib/FieldTheory/Minpoly/Field.lean.
- mathlib:minpoly.natDegree_le — The minimal polynomial degree is bounded by the ambient module finrank for a finite free algebra. Source: Mathlib/FieldTheory/Minpoly/Finite.lean.
- mathlib:finite_of_finite_type_of_isJacobsonRing — A finite-type field algebra over a Jacobson ring is finite as a module; used over Q for a closed point of a nonempty finite-type chart. Source: Mathlib/RingTheory/Jacobson/Ring.lean.

## Source findings

The packet carries the eight independently confirmed YZ19 corrections and the new (A.11) proof-interpretation gap. Their inherited review provenance is distinct from this packet’s pending independent review. The formulas used above incorporate the full-fibre, perverse-shift, general-character, product-Abel–Jacobi, restriction, effective-divisor and Picard-sheaf corrections. Version-of-record and v2 hashes distinguish the text inspected from inherited collation records.

## Public sources

- [Shtukas and the Taylor expansion of L-functions (II)](https://math.mit.edu/~zyun/GZW_ramified_published.pdf), Zhiwei Yun and Wei Zhang. Annals of Mathematics 189 (2019), 393–526, published author-hosted copy. Read scope: Appendix A, pp. 514–526, statements and proofs in full; Introduction pp. 393–396; §6.2.1 pp. 496–497 and §6.2.3 p. 499 for consumers; Page images pp. 515, 519, 521, 523 checked against extracted formulas.
- [Gromov–Witten theory of Deligne–Mumford stacks](https://arxiv.org/pdf/math/0603151v2), Dan Abramovich, Tom Graber and Angelo Vistoli. arXiv:math/0603151v2, 13 April 2008; Appendix B. Read scope: Appendix B.1–B.2 pp. 52–54; root gerbes and roots of line bundles with sections.
- [Infinite root stacks and quasi-coherent sheaves on logarithmic schemes](https://arxiv.org/pdf/1410.1164v2), Mattia Talpo and Angelo Vistoli. arXiv:1410.1164v2, 12 December 2017; published Proc. London Math. Soc. 116 (2018), 1187–1243. Read scope: §3 pp. 12–16, definitions and proofs of 3.2–3.5 and 3.7–3.13; single-divisor specialization.
- [On the birational section conjecture with strong birationality assumptions](https://link.springer.com/content/pdf/10.1007/s00222-023-01220-6.pdf), Giulio Bresciani. Inventiones Mathematicae 235 (2024), 129–150, open-access version of record. Read scope: pp. 135–136 root stacks over a DVR and the infinite reduced fibre; references pp. 149–150.
- [Symplectic L-functions and symplectic Reidemeister torsion (mod squares)](https://arxiv.org/pdf/2303.13436v1), Amina Abdurrahman and Akshay Venkatesh. arXiv:2303.13436v1, 23 March 2023; published 2025 version not inspected. Read scope: pp. 1–2 arithmetic target, §3.1–3.4 pp. 26–28, §4.2 p. 35 proof architecture; all 38 reviewed route contracts, not all proofs of §§3–6/App. D.

## Native finite-comparison baseline and checking boundary

- mathlib:Algebra.TensorProduct.lift — Tensor-algebra universal lift for two algebra maps with commuting images. Source: Mathlib/RingTheory/TensorProduct/Maps.lean.
- mathlib:Algebra.TensorProduct.lift_tmul — The lift evaluates b⊗c to the product of the specified two images. Source: Mathlib/RingTheory/TensorProduct/Maps.lean.
- mathlib:LinearMap.quotKerEquivOfSurjective — Native first isomorphism theorem identifying a module quotient by a surjective linear map's kernel. Source: Mathlib/LinearAlgebra/Isomorphisms.lean.
- mathlib:Submodule.Quotient.mk — Canonical native module quotient map; not an algebra quotient. Source: Mathlib/LinearAlgebra/Quotient/Defs.lean.
- mathlib:Ideal.mem_span_singleton' — Membership in (f) is an explicit scalar multiple; commutativity supplies the chosen factor order. Source: Mathlib/RingTheory/Ideal/Span.lean.
- mathlib:Matrix.det_apply — Finite Leibniz formula with permutation sign for the actual pair-indexed matrix. Source: Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean.
- mathlib:Fin.sign_cycleRange — Sign of cycleRange i is (−1)^i; at the last index this is the n-cycle rotation sign. Source: Mathlib/GroupTheory/Perm/Fin.lean.
- mathlib:Module.finrank_eq_card_basis — Over a nontrivial strong-rank-condition ring, a finite basis computes finrank; used only over a field here. Source: Mathlib/LinearAlgebra/Dimension/StrongRankCondition.lean.
- mathlib:LinearMap.finrank_range_add_finrank_ker — Rank-nullity for a linear map from a finite-dimensional vector space over a division ring. Source: Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean.

The finite comparison signatures and eight examples are checked as a targeted Mathlib-native fragment, with the native character generator expanded to its actual definition. The earlier extraction admitted the coaction; a separate proof prototype checks its native quotient lift, weight, counit and coassociativity and the elementary tensor comparison. The submitted suggested bodies are admitted as required by PROTOCOL §13. This is not compilation of the full suggested file: its native Tau Ceti line-bundle/points imports have no compiled build available at the pin. All mathematical implementations and all ten stages remain unchecked and partial; the unchanged geometric omission ledger is still binding.

## Native coaction proof continuation — codex-rtOQ9t

Four new lemmas expose the quotient relation, Euclidean root-power reduction, native character powers, and the promoted root-evaluation API. The separately checked native proof prototype constructs δ using AdjoinRoot.liftAlgHom and Θ using Algebra.TensorProduct.lift. Constants, weights, counit, coassociativity, pure tensors, root/right-factor values, uniqueness and the monomial formula use these actual maps. The weight signature now parenthesizes the right root power; the mathematical contract is unchanged.

Fresh reading is TV17 v2 §3.1 pp14–16, the full finite-chart setup and cited proofs. The PDF hash matches the inherited receipt. Current reviewed FA.0–FA.7 audit records and supplier scopes were checked. Earlier broad paper readings, AV sibling contracts and source findings retain their original provenance.

The separate Mathlib proof extraction checks this algebra branch and its wild-characteristic, nonunit, nilpotent and exponent-one computations. It leaves the coordinate equivalences, kernel/cokernel, inverse, determinant/rank and nonvanishing examples admitted. The exact-pin Tau Ceti compiled imports remain unavailable, so the complete suggested file is uncompiled. All123 proposed nodes stay unchecked and all ten stages remain partial; the geometric, stack, sheaf and infinite-tower gaps are retained.

Additional native baseline statements read at Mathlib082e2d3:

- mathlib:ofAdd_nsmul — Native conversion of an additive n-fold multiple into a power in Multiplicative. Source: Mathlib/Algebra/Group/TypeTags/Basic.lean.
- mathlib:ZMod.natCast_self — The image of n in ZMod n is zero, independent of the coefficient-ring characteristic. Source: Mathlib/Data/ZMod/Basic.lean.
- mathlib:Algebra.TensorProduct.tmul_pow — A power of a pure tensor is the tensor of the powers; parentheses distinguish the tensor power from the second-factor power. Source: Mathlib/RingTheory/TensorProduct/Basic.lean.
- mathlib:Algebra.TensorProduct.algebraMap_apply' — The native coefficient map into a tensor algebra equals 1 tensor the coefficient image in the right factor. Source: Mathlib/RingTheory/TensorProduct/Basic.lean.
- mathlib:Algebra.TensorProduct.ext' — Algebra homomorphisms out of a tensor algebra agree if their values on every pure tensor agree. Source: Mathlib/RingTheory/TensorProduct/Basic.lean.
- mathlib:MonoidAlgebra.counit_single — Native coefficient-coalgebra counit formula on a character basis element. Source: Mathlib/RingTheory/Coalgebra/MonoidAlgebra.lean.
- mathlib:MonoidAlgebra.comul_single — Native coefficient-coalgebra comultiplication formula on a character basis element. Source: Mathlib/RingTheory/Coalgebra/MonoidAlgebra.lean.

The separate proof extraction reports0 errors,20 admitted-body warnings and0 other warnings. All16 audited algebra declarations exclude admission axioms. The independent coordinate check passes57,628 assertions. These receipts certify only the checked extraction; full-file compilation and roadmap implementation remain unclaimed.

The submitted suggested file follows PROTOCOL §13: declaration and example bodies remain admitted. The separate proof prototype is preserved at commit063ebe93320a784b244ea5a73fe8236bc205830c; its evidence does not turn any node into an implementation claim.

## Native coefficient proof continuation — codex-5ebb6f

The separate native proof prototype now checks the source and target existence-and-uniqueness lemmas. The suggested file keeps admitted declaration and example bodies as required by PROTOCOL §13. Their subsingleton branch covers the zero ring without a degree assertion. Their nontrivial branch uses the native monic AdjoinRoot basis; the target uses every group-algebra character and therefore retains wild-characteristic information. Two specified coefficient linear equivalences make their inverse formulas available to the kernel and module-cokernel work.

Fresh reading is TV17 v2 §3.1 pp14–16 and the full Stacks040N unit-cover statement/proof. Other paper readings, source findings and AV sibling contracts keep predecessor provenance. The separate proof extraction, preserved at immutable commita7077b385885fa9b790ff4216098ad3871a87fa8, has554 lines and20 examples, with0 errors,18 admitted-body warnings and0 other warnings. All26 audited algebra declarations exclude admission axioms. At that predecessor checkpoint, the kernel/image criteria, sharp criteria, kernel/cokernel maps, inverse, determinant/rank and geometric work remained open. The current weighted-coefficient continuation below supersedes that proof boundary while preserving the distinct historical receipt. The full Tau Ceti file remains uncompiled and all ten stages partial.

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-coordinate-equivalence. construction. Native name: TauCeti.RootStack.affineTorsorComparison.sourceCoordinateEquiv.

Statement: For B=A[x]/(xⁿ−f), H=A[Multiplicative(ZMod n)] and any commutative ring A with positive n, construct the specified A-linear equivalence B⊗_A B ≃ ((Fin n×Fin n)→A) extracting the unique coefficients in the ordered vectors x^i⊗x^j. The inverse coefficient map sends c to Σ_p c_p(x^i⊗x^j). This is the native linear equivalence determined by synthesis, including the zero ring.

Hypotheses: A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-coordinates, mathlib:LinearEquiv.ofBijective.

Proof: Define the native synthesis linear map by the finite linear combination in the statement. Linearity follows from addition and scalar multiplication distributing over a finite sum. The listed coordinate existence-and-uniqueness lemma proves synthesis bijective: uniqueness gives injectivity and existence gives surjectivity. Apply LinearEquiv.ofBijective to synthesis and take its inverse. The inverse evaluation is the exact sum, the forward evaluation of a synthesized family follows from the inverse law, and synthesis of a single coefficient gives the generator formula.

Uses: FunctionFieldArithmeticPartII:RS.0/affine-torsor-kernel: Provides the specified native coefficient extraction for the module comparison; the explicit synthesis inverse keeps the actual tensor map visible. FunctionFieldArithmeticPartII:RS.0/affine-torsor-kernel-coefficients: Supports interpreting the coefficient criterion for a tensor through a fixed inverse formula and generator normalization.

Acceptance: The construction fixes coefficient order and basis normalization, rather than choosing an unspecified isomorphism of free modules. Its specified inverse also determines the map over the zero ring.

API: TauCeti.RootStack.affineTorsorComparison.sourceCoordinateEquiv_symm_apply (projection). The inverse coefficient map sends c to Σ_p c_p(x^i⊗x^j).

API: TauCeti.RootStack.affineTorsorComparison.sourceCoordinateEquiv_apply_sum (characterisation). Coefficient extraction of Σ_p c_p(x^i⊗x^j) is exactly c, for every coefficient family c.

API: TauCeti.RootStack.affineTorsorComparison.sourceCoordinateEquiv_monomial (simp). The coefficient family of the vector x^i⊗x^j indexed by p is single(p,1), zero at every other index.

Test: TauCeti.RootStack.affineTorsorComparison.sourceCoordinateEquiv.test_one (degenerate). For n=1 and arbitrary f, the coefficients of 1⊗1 are single((0,0),1).

Test: TauCeti.RootStack.affineTorsorComparison.sourceCoordinateEquiv.test_zero_ring (degenerate). If A is subsingleton, coefficient extraction of every element of B⊗_A B is the zero coefficient family.

Test: TauCeti.RootStack.affineTorsorComparison.sourceCoordinateEquiv.test_nonreduced (computation). For A=Z/4,n=2,f=2, the coefficient of x⊗x at (1,1) is 1. The calculation uses the nonreduced quotient, not its reduction.

Sources: TV17 §3.1 pp14–16 finite chart action; Stacks040N positive-exponent unit cover. These motivate a native coefficient derivation, not a quoted geometric theorem.

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-coordinate-equivalence. construction. Native name: TauCeti.RootStack.affineTorsorComparison.targetCoordinateEquiv.

Statement: For B=A[x]/(xⁿ−f), H=A[Multiplicative(ZMod n)] and any commutative ring A with positive n, construct the specified A-linear equivalence H⊗_A B ≃ ((Fin n×Fin n)→A) extracting the unique coefficients in the ordered vectors e_i⊗x^k. The inverse coefficient map sends c to Σ_p c_p(e_i⊗x^k). This is the native linear equivalence determined by synthesis, including the zero ring.

Hypotheses: A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-coordinates, mathlib:LinearEquiv.ofBijective.

Proof: Define the native synthesis linear map by the finite linear combination in the statement. Linearity follows from addition and scalar multiplication distributing over a finite sum. The listed coordinate existence-and-uniqueness lemma proves synthesis bijective: uniqueness gives injectivity and existence gives surjectivity. Apply LinearEquiv.ofBijective to synthesis and take its inverse. The inverse evaluation is the exact sum, the forward evaluation of a synthesized family follows from the inverse law, and synthesis of a single coefficient gives the generator formula.

Uses: FunctionFieldArithmeticPartII:RS.0/affine-torsor-cokernel: Provides the specified native coefficient extraction for the module comparison; the explicit synthesis inverse keeps the actual tensor map visible. FunctionFieldArithmeticPartII:RS.0/affine-torsor-image-coefficients: Supports interpreting the coefficient criterion for a tensor through a fixed inverse formula and generator normalization.

Acceptance: The construction fixes coefficient order and basis normalization, rather than choosing an unspecified isomorphism of free modules. Its specified inverse also determines the map over the zero ring.

API: TauCeti.RootStack.affineTorsorComparison.targetCoordinateEquiv_symm_apply (projection). The inverse coefficient map sends c to Σ_p c_p(e_i⊗x^k).

API: TauCeti.RootStack.affineTorsorComparison.targetCoordinateEquiv_apply_sum (characterisation). Coefficient extraction of Σ_p c_p(e_i⊗x^k) is exactly c, for every coefficient family c.

API: TauCeti.RootStack.affineTorsorComparison.targetCoordinateEquiv_monomial (simp). The coefficient family of the vector e_i⊗x^k indexed by p is single(p,1), zero at every other index.

Test: TauCeti.RootStack.affineTorsorComparison.targetCoordinateEquiv.test_one (degenerate). For n=1 and arbitrary f, the coefficients of 1⊗1 are single((0,0),1).

Test: TauCeti.RootStack.affineTorsorComparison.targetCoordinateEquiv.test_zero_ring (degenerate). If A is subsingleton, coefficient extraction of every element of H⊗_A B is the zero coefficient family.

Test: TauCeti.RootStack.affineTorsorComparison.targetCoordinateEquiv.test_wild_character (computation). For A=F₂,n=2,f=0, the coefficient of e₁⊗1 at (1,0) is 1. This character remains visible although μ₂(F₂) has only one element.

Sources: TV17 §3.1 pp14–16 finite chart action; Stacks040N positive-exponent unit cover. These motivate a native coefficient derivation, not a quoted geometric theorem.

Native baseline statements read at Mathlib082e2d3 for this continuation:

- mathlib:Module.subsingleton — Every module over a subsingleton coefficient ring is subsingleton; no numerical polynomial degree assertion is required. Source: Mathlib/Algebra/Module/Defs.lean.
- mathlib:Module.Basis.reindex — Transport an existing basis along an index equivalence; used with the degree equality and the character index equivalence. Source: Mathlib/LinearAlgebra/Basis/Defs.lean.
- mathlib:Module.Basis.reindex_apply — The transported basis vector at i is the original vector at the inverse image of i. Source: Mathlib/LinearAlgebra/Basis/Defs.lean.
- mathlib:Module.Basis.equivFun — An existing finite basis supplies the native linear equivalence to its full coefficient-function module. Source: Mathlib/LinearAlgebra/Basis/Defs.lean.
- mathlib:Module.Basis.sum_equivFun — The sum of the coordinate coefficients times their native basis vectors equals the original vector. Source: Mathlib/LinearAlgebra/Basis/Defs.lean.
- mathlib:Module.Basis.equivFun_symm_apply — The inverse of the finite coefficient equivalence is the specified finite linear combination. Source: Mathlib/LinearAlgebra/Basis/Defs.lean.
- mathlib:Module.Basis.tensorProduct_apply' — The basis tensor product at a pair is the pure tensor of the two basis vectors. Source: Mathlib/LinearAlgebra/TensorProduct/Basis.lean.
- mathlib:MonoidAlgebra.basis_apply — The native monoid-algebra basis vector is single(r,1), including in wild coefficient characteristic. Source: Mathlib/Algebra/MonoidAlgebra/Module.lean.
- mathlib:ZMod.finEquiv — For a positive modulus, the native equivalence from Fin n to ZMod n; its zero-modulus branch has a different source. Source: Mathlib/Data/ZMod/Basic.lean.
- mathlib:ZMod.val_natCast_of_lt — The canonical representative of a natural number smaller than n equals that natural number. Source: Mathlib/Data/ZMod/Basic.lean.
- mathlib:Multiplicative.toAdd — The native type-tag equivalence from Multiplicative α to α, inverse to ofAdd. Source: Mathlib/Algebra/Group/TypeTags/Basic.lean.
- mathlib:LinearEquiv.ofBijective — A bijective native linear map determines a linear equivalence; its forward function is the supplied map. Source: Mathlib/Algebra/Module/Submodule/Equiv.lean.

The current admitted Mathlib-only sketch also elaborates:411 extracted lines,20 examples,0 errors,56 admitted-body warnings and0 other warnings. Its hash is 724f1b3fbd4d8f6d59d69f0efe09bc80ff0940c6679715782873b822ccd7c810. The separately checked proof prototype and its26 axiom audits retain their distinct receipts; no admission-free proof claim is made about the current sketch.


## Weighted coefficient continuation — codex-J6LwjP

For I=Fin n×Fin n, use cyclic addition and subtraction to fix σ(i,j)=(i,i+j) and its inverse (i,k−i). Natural representatives give k=(i+j) mod n. Since i+j<2n, the native monomial weight is 1 off the wrapping triangle and f on it; wrapping is exactly k<i. The specified source and target coefficient equivalences turn the actual comparison into C_t Θ C_s⁻¹(c)(q)=w(q)c(σ⁻¹q). Each target coefficient therefore has exactly one source contributor. This is a calculation on the original AdjoinRoot quotient, group algebra and tensor map, including the zero ring.

The five refined declarations above now list the complete intermediate chain. Kernel coefficients outside the wrapping triangle vanish; wrapping coefficients are annihilated by f. An image family has arbitrary upper coefficients and lower coefficients divisible by f. The latter condition is constructive: choose one factor for each lower coefficient, transport by σ and synthesize the actual source tensor. For n>1 the single wrapping source position (1,n−1) detects injectivity of multiplication by f; the lower target position (1,0) with coefficient 1 detects that f is a unit. No invertibility of n, reducedness or integral-domain hypothesis enters. At n=1 neither position exists and the comparison is bijective for every f.

Fresh readings are Talpo–Vistoli v2 §3.1 pp14–16 and the complete Stacks040N unit-cover statement/proof. Their action/chart and positive-exponent cover motivate the calculation; the weighted table and criteria are derived here, rather than quoted as printed paper theorems. The 28 Yun–Zhang and 38 Abdurrahman–Venkatesh route records, all source findings and all other source-reading provenance are inherited unchanged. The reviewed parent FA.2 and FA.4 records and all parent target statuses were freshly inspected; the predecessor detailed FA.0/FA.1 evidence is preserved without claiming a new full reading. Upstream JacobianChallenge was read in full, with nearby SemisimpleAlgebras and RepresentationTheory read earlier in the same session.

The packet now contains137 unchecked nodes,98 required API items,99 required definition/construction tests (103 total test records),39 planets and96 baseline declarations. Twelve new records add one cyclic construction, four permutation APIs as lemmas, three coefficient lemmas and four consumed coordinate APIs as lemmas. All125 inherited IDs and mathematical statements,8 gaps,13 requests and ten partial stages remain. General root-stack geometry, AV sibling ownership and parent arithmetic boundaries are unchanged.

### Cyclic root coefficient permutation

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-coefficient-permutation. construction. Native name: TauCeti.RootStack.affineTorsorComparison.coefficientPermutation.

Statement: For positive n, construct the native equivalence σ:Fin n×Fin n≃Fin n×Fin n defined by σ(i,j)=(i,i+j) using cyclic addition on Fin n, with inverse σ⁻¹(i,k)=(i,k−i). Its representative is (i,(i+j) mod n); it reorders coordinates of the actual root action comparison.

Hypotheses: n≥1. The construction is independent of the coefficient ring.

Inputs: mathlib:Fin.addCommGroup.

Proof: Use the pinned cyclic additive group on Fin n, not addition of natural representatives without reduction. Define the two pair maps and verify their composites by additive cancellation. No coefficient ring or choice of a root of unity enters.

Uses:

- FunctionFieldArithmeticPartII:RS.0/affine-torsor-coefficient-map: Identifies the unique source coordinate contributing to each target coordinate.
- FunctionFieldArithmeticPartII:RS.0/affine-torsor-kernel-coefficients: Transfers wrapping source positions to strictly lower target positions without collisions.

API:

- TauCeti.RootStack.affineTorsorComparison.coefficientPermutation_apply (projection): σ(i,j)=(i,i+j) in the cyclic Fin n group.
- TauCeti.RootStack.affineTorsorComparison.coefficientPermutation_symm (projection): σ⁻¹(i,k)=(i,k−i) in the cyclic Fin n group.
- TauCeti.RootStack.affineTorsorComparison.coefficientPermutation_val (compatibility): The natural representative of the second component of σ(i,j) is (i+j) mod n.
- TauCeti.RootStack.affineTorsorComparison.wrap_iff_lower (characterisation): The second component of σ(i,j) is smaller than its first iff n≤i+j, for natural representatives 0≤i,j<n.

Unit tests:

- TauCeti.RootStack.affineTorsorComparison.coefficientPermutation.test_one (degenerate): At n=1 the permutation fixes every pair.
- TauCeti.RootStack.affineTorsorComparison.coefficientPermutation.test_wrap (computation): At n=2, σ(1,1)=(1,0).
- TauCeti.RootStack.affineTorsorComparison.coefficientPermutation.test_inverse (computation): At n=3, σ⁻¹(2,0)=(2,1); natural truncated subtraction would give the wrong answer.

Acceptance: At n=2 the wrapping position (1,1) maps to the lower position (1,0).

Sources: TV17 §3.1 pp14–16 finite P=N grading/action and Corollary3.13; Stacks040N, Lemma59.28.3 positive-exponent unit cover. These are root-specific native algebra derivations with the listed baseline and packet inputs.

### Cyclic permutation evaluation

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-permutation-apply. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.coefficientPermutation_apply.

Statement: σ(i,j)=(i,i+j) in the cyclic Fin n group.

Hypotheses: n≥1. The construction is independent of the coefficient ring.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-coefficient-permutation.

Proof: Unfold the specified native pair equivalence; for the representative use the Fin addition formula.

Acceptance: No assumption on the base ring is used.

Sources: TV17 §3.1 pp14–16 finite P=N grading/action and Corollary3.13; Stacks040N, Lemma59.28.3 positive-exponent unit cover. These are root-specific native algebra derivations with the listed baseline and packet inputs.

### Cyclic inverse evaluation

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-permutation-inverse. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.coefficientPermutation_symm.

Statement: σ⁻¹(i,k)=(i,k−i) in the cyclic Fin n group.

Hypotheses: n≥1. The construction is independent of the coefficient ring.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-coefficient-permutation.

Proof: Unfold the specified native pair equivalence; for the representative use the Fin addition formula.

Acceptance: No assumption on the base ring is used.

Sources: TV17 §3.1 pp14–16 finite P=N grading/action and Corollary3.13; Stacks040N, Lemma59.28.3 positive-exponent unit cover. These are root-specific native algebra derivations with the listed baseline and packet inputs.

### Natural representative of the cyclic permutation

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-permutation-representative. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.coefficientPermutation_val.

Statement: The natural representative of the second component of σ(i,j) is (i+j) mod n.

Hypotheses: n≥1. The construction is independent of the coefficient ring.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-coefficient-permutation.

Proof: Unfold the specified native pair equivalence; for the representative use the Fin addition formula.

Acceptance: No assumption on the base ring is used.

Sources: TV17 §3.1 pp14–16 finite P=N grading/action and Corollary3.13; Stacks040N, Lemma59.28.3 positive-exponent unit cover. These are root-specific native algebra derivations with the listed baseline and packet inputs.

### Wrapping and lower coordinates

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-permutation-wrap. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.wrap_iff_lower.

Statement: The second component of σ(i,j) is smaller than its first iff n≤i+j, for natural representatives 0≤i,j<n.

Hypotheses: n≥1. The construction is independent of the coefficient ring.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-coefficient-permutation, mathlib:Fin.coe_int_add_eq_ite.

Proof: Read the pinned integer formula for addition of two Fin representatives. Split at i+j<n; integer arithmetic gives exactly the wrap/lower equivalence, including n=1.

Acceptance: No assumption on the base ring is used.

Sources: TV17 §3.1 pp14–16 finite P=N grading/action and Corollary3.13; Stacks040N, Lemma59.28.3 positive-exponent unit cover. These are root-specific native algebra derivations with the listed baseline and packet inputs.

### Source coefficient synthesis

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-synthesis. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.sourceCoordinateEquiv_symm_apply.

Statement: The inverse coefficient map sends c to Σ_p c_p(x^i⊗x^j).

Hypotheses: A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-coordinate-equivalence.

Proof: The synthesis inverse is the defining finite linear combination of the native equivalence.

Acceptance: This promotes a consumed API to a declaration; it preserves the existing construction and API statement.

Sources: TV17 §3.1 pp14–16 finite P=N grading/action and Corollary3.13; Stacks040N, Lemma59.28.3 positive-exponent unit cover. These are root-specific native algebra derivations with the listed baseline and packet inputs.

### Target coefficient synthesis

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-synthesis. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.targetCoordinateEquiv_symm_apply.

Statement: The inverse coefficient map sends c to Σ_p c_p(e_i⊗x^k).

Hypotheses: A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-coordinate-equivalence.

Proof: The synthesis inverse is the defining finite linear combination of the native equivalence.

Acceptance: This promotes a consumed API to a declaration; it preserves the existing construction and API statement.

Sources: TV17 §3.1 pp14–16 finite P=N grading/action and Corollary3.13; Stacks040N, Lemma59.28.3 positive-exponent unit cover. These are root-specific native algebra derivations with the listed baseline and packet inputs.

### Target coefficients of a synthesized family

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-extraction. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.targetCoordinateEquiv_apply_sum.

Statement: Coefficient extraction of Σ_p c_p(e_i⊗x^k) is exactly c, for every coefficient family c.

Hypotheses: A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-coordinate-equivalence.

Proof: Apply the inverse law of the specified native coefficient equivalence.

Acceptance: This promotes a consumed API to a declaration; it preserves the existing construction and API statement.

Sources: TV17 §3.1 pp14–16 finite P=N grading/action and Corollary3.13; Stacks040N, Lemma59.28.3 positive-exponent unit cover. These are root-specific native algebra derivations with the listed baseline and packet inputs.

### Target coefficient of a basis vector

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-basis-coordinate. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.targetCoordinateEquiv_monomial.

Statement: The coefficient family of the vector e_i⊗x^k indexed by p is single(p,1), zero at every other index.

Hypotheses: A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-coordinate-equivalence, FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-synthesis.

Proof: The synthesis of single(p,1) is the named target basis vector by finite-sum evaluation. Apply the inverse law to extract its exact coefficient family.

Acceptance: This promotes a consumed API to a declaration; it preserves the existing construction and API statement.

Sources: TV17 §3.1 pp14–16 finite P=N grading/action and Corollary3.13; Stacks040N, Lemma59.28.3 positive-exponent unit cover. These are root-specific native algebra derivations with the listed baseline and packet inputs.

### Weighted permuted root monomial

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-monomial-permuted. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.monomial_permuted.

Statement: For p=(i,j), Θ(x^i⊗x^j)=w(σp)(e_i⊗x^k), where σp=(i,k) and w(i,k)=f when k<i, otherwise 1. This is the actual native comparison, not an arbitrary matrix.

Hypotheses: A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-monomial, FunctionFieldArithmeticPartII:RS.0/affine-torsor-permutation-representative, FunctionFieldArithmeticPartII:RS.0/affine-torsor-permutation-wrap.

Proof: Since 0≤i,j<n, the quotient (i+j)/n is either 0 or 1 by elementary integer arithmetic. Use the native monomial formula and the representative identity. The wrap/lower lemma identifies exactly the factor f.

Acceptance: At n=2, Θ(x⊗x)=f(e₁⊗1), including nilpotent f.

Sources: TV17 §3.1 pp14–16 finite P=N grading/action and Corollary3.13; Stacks040N, Lemma59.28.3 positive-exponent unit cover. These are root-specific native algebra derivations with the listed baseline and packet inputs.

### Coefficients of a compared monomial

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-monomial-coordinates. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.monomial_coordinates.

Statement: In the fixed target coefficient equivalence, Θ(x^i⊗x^j) has coefficient family w(σp) single(σp,1), with w(i,k)=f for k<i and 1 otherwise.

Hypotheses: A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-monomial-permuted, FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-basis-coordinate.

Proof: Use the preceding weighted monomial identity and linearity of target coefficient extraction. Apply its promoted basis-vector formula; the first permutation component remains i.

Acceptance: The universal character coordinate is retained in characteristic dividing n.

Sources: TV17 §3.1 pp14–16 finite P=N grading/action and Corollary3.13; Stacks040N, Lemma59.28.3 positive-exponent unit cover. These are root-specific native algebra derivations with the listed baseline and packet inputs.

### Complete weighted coefficient table

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-coefficient-map. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.coefficient_map.

Statement: For every coefficient family c and q=(i,k), C_t(Θ(C_s⁻¹(c)))(q)=w(q)c(σ⁻¹q), where C_s and C_t are the specified source and target coefficient equivalences and w(q)=f for k<i, otherwise 1.

Hypotheses: A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-synthesis, FunctionFieldArithmeticPartII:RS.0/affine-torsor-monomial-coordinates, FunctionFieldArithmeticPartII:RS.0/affine-torsor-coefficient-permutation.

Proof: Expand the specified source synthesis and distribute the native comparison and target coordinates over the finite linear combination. Each compared monomial is supported only at its permutation image. Bijectivity of σ leaves exactly the term indexed by σ⁻¹q in the coefficient sum. Ordinary scalar multiplication of coefficients gives the displayed product; no cancellation of f is used.

Acceptance: The formula works over the zero ring, over nonreduced rings and under arbitrary coefficient change. It asserts no preservation of kernels under nonflat change.

Sources: TV17 §3.1 pp14–16 finite P=N grading/action and Corollary3.13; Stacks040N, Lemma59.28.3 positive-exponent unit cover. These are root-specific native algebra derivations with the listed baseline and packet inputs.

### Checked evidence and remaining closure

The separate [native proof prototype](https://github.com/CBirkbeck/tauceti-explorer/blob/7660b60d3ed205f650aeefe6b1e46996ec36ff09/research/blueprint/suggested/FunctionFieldArithmeticPartII.lean) has828 extracted lines and23 examples, with0 errors,9 admitted-body warnings and0 other warnings. All39 printed algebra axiom lists exclude admission axioms. Nineteen examples have actual proof bodies, including the cyclic permutation cases, arbitrary exponent-one parameter, zero ring, integer regular nonunit and actual nonzero nilpotent-parameter kernel tensor. The nine warnings belong to five remaining module/inverse/determinant/rank assertions and four remaining examples. This is evidence for the unchecked plan; it certifies neither the complete Tau Ceti file nor the geometric root stack.

The current admitted sketch is a distinct receipt:466 extracted lines,23 examples,0 errors,67 admitted-body warnings and0 other warnings. Its full suggested-file hash is 106ce0892461a29355c944ccfe52101d5c97d726c1c8b6cde532b0a62ba28266. The proof extraction hash is 4ab15358f6cc7033abe508a1e3114b7a602a922ec2510c1f13fac4d9cac3a5bb. The handoff records exact reproduction and axiom/source/log hashes. Required compiled Tau Ceti imports remain absent; the complete suggested file was not compiled. No build, cache download or language server was started.

Complete the specified module kernel/cokernel equivalences with their exact forward maps, unit inverse, determinant sign, field ranks, branch-kernel/wild-unit/nonflat-kernel/nonreduced-cokernel examples and native geometry. The proof prototype resolves the scalar table and sharp criteria, not these remaining contracts. All eight gaps and thirteen requests remain binding.

Additional baseline statements read at the pinned commit:

- mathlib:Fin.addCommGroup — The existing cyclic additive group structure on Fin n for positive n, including subtraction and additive cancellation. Source: Mathlib/Algebra/Group/Fin/Basic.lean.
- mathlib:Fin.coe_int_add_eq_ite — The integer representative of u+v in Fin n is the sum if the natural sum is below n and otherwise the sum minus n. Source: Mathlib/Data/Fin/Basic.lean.
- mathlib:IsUnit.exists_right_inv — In any monoid, a unit a has b with a*b=1. Source: Mathlib/Algebra/Group/Units/Defs.lean.
- mathlib:isUnit_iff_exists_inv — In a Dedekind-finite monoid, including a commutative ring under multiplication, IsUnit a iff there exists b with a*b=1. Source: Mathlib/Algebra/Group/Units/Defs.lean.

The read-only atlas assembly overlay has3,056 stage vertices (including51 unchanged virtual supplier endpoints) and8,723 stage edges. The prerequisite graph augmented with188 recursively reachable declarations has3,205 vertices and9,168 edges; the own declaration graph has137 vertices and288 edges. All are acyclic, external prerequisites resolve, own skipped/pending links are empty and unrelated skipped/pending lists match the control assembly. These graphs check recorded prerequisites, without certifying the remaining supplier mathematics. No generated atlas data was written.
