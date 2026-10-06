# Explicit K₃ and Bloch groups: V.6

## Purpose and dependencies

V.6 turns finite symbol expressions into objects that another layer can use:
an element of a specified Bloch group, a finite relation certificate, a root
class in a specified coefficient group, or a certified representative in the
homological model of K₃. This part continues the reviewed
[parent packet](../packets/K3BlochGroups.json). Its scope is exactly
**K3BlochGroups:V.6 — Explicit elements and certificates**. The new declarations
are the integral root multiple, the root class over a coefficient ring, the
fibre of the Suslin map, a certified finite bar-cycle lift, and the good-prime
finite-coefficient identification. The parent declarations retain their ids and
their ownership.

The plan starts with the reviewed V.6 audit in
[library-coverage.json](../../../data/library-coverage.json). That audit finds
the field-specific objects unbuilt. At the pinned Mathlib commit
`082e2d37e8b0463410cdb532e111cd43d5a66174`, additive kernels, tensor products,
primitive roots, finite-support bar chains, cycles and group homology already
exist. They are baseline inputs, not new nodes. The pinned Tau Ceti commit is
`f790474821cf4256814db967cb154e7af3d0c369`; no Tau Ceti declaration is cited from
a different revision. The suggested file imports only the verified Mathlib
modules.

The input order is important. V.3 defines the Bloch conventions, V.4 supplies
the Suslin map and its enhanced torsion term, V.1 supplies the stable Steinberg
homological model, and the retained V.6 nodes supply element constructors and
certificates. HB.1 supplies finite-coefficient K-theory and its universal
coefficient sequence; HB.2 owns the CGZ étale Bloch group and its good-prime
comparison. M.7 and M.8 supply the finite Chern comparison and its exact
normalization. V.6 builds its arithmetic finite-coefficient identification
after those inputs.

Real regulator agreement belongs to **Polylogarithms:P.2**, with its scalar
checked against **BorelRegulators:R.7**. P-adic regulator agreement belongs to
**PadicHodgeRegulators:D.2**. Those targets are removed from the V.6 specification
in this document, implementing RT-AREA-ktheory-2/23. P.2 already imports
V.4/psi-map and V.4/suslin-exact-sequence; D.2 can import V.4/suslin-functoriality
and the V.3 Bloch model directly. Their regulator proofs are not prerequisites
for the algebraic root and lift constructions.

## Conventions and retained interfaces

Write P(F) for the abelian group on symbols [x], x∈F\{0}, modulo [1]=0 and
the five-term relations

\[
R(x,y)=[x]-[y]+[y/x]
 -[(1-x^{-1})/(1-y^{-1})]+[(1-x)/(1-y)]
\]

for x,y∈F\{0,1}, x≠y. The boundary takes values in the **antisymmetric
tensor quotient**

\[
\widetilde{\bigwedge}^{2} F^\times
 = (F^\times\otimes_{\mathbb Z}F^\times) /
    \langle a\otimes b+b\otimes a\rangle,
\qquad \partial[x]=x\wedge(1-x).
\]

Multiplicative units are read as an additive abelian group in the tensor
product. The value at [1] is zero. Define B(F)=ker ∂. Diagonal classes a∧a
are retained; replacing this quotient by the exterior square changes the
integral problem. B_CGZ(F) denotes the distinct convention in the parent’s
V.3/cgz-bloch-group. The comparison κ:B(F)→B_CGZ(F) has two-primary kernel
and cokernel, and is an isomorphism after odd coefficients or rationalization.
No integral identification of the two groups is used here.

These definitions and comparisons are owned by V.3. The conventions follow
[Weibel, VI.5.1](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf),
printed p23, and the comparison is imported from the reviewed parent.

The following retained V.6 interfaces cover the stage’s original targets.
Each reference is an existing node, rather than a duplicate declaration in this
part.

| Target | Retained node under `K3BlochGroups:V.6/` | Contract |
|---|---|---|
| Bloch elements | `bloch-element-constructor` | A finite sum ξ and a proof ∂ξ=0 determine an element of the actual kernel B(F). |
| Boundary certificates | `boundary-certificate` | Factor the support elements and their complements into roots and multiplicative generators; check the antisymmetric tensor components. |
| Equality certificates | `five-term-certificate` | A finitely supported integer combination of admissible R(x,y), together with an integer multiple of [1], evaluates to a specified difference of free symbol sums. |
| Equality criterion | `certificate-soundness` | A valid finite certificate proves equality in P(F); equality implies existence of some finite certificate, without a length bound. |
| Root boundary | `root-of-unity-symbol` | For ζ of exact order m≥2, m∂[ζ]=0; the raw symbol is integral precisely when its antisymmetric boundary vanishes. |
| Existing root specializations | `root-of-unity-class` | Constructs the modulo, localized and p-adic substitutes with their invertibility hypotheses. |
| Homological lifts | `certificate-to-bar-cycle` | For infinite F, a Bloch element has Quillen K₃ and finite Steinberg bar-cycle representatives, with the stated ambiguity; this is an existence result. |
| Rational comparison | `comparison-rational` | For |F|≥4, K₃^ind(F)⊗ℚ≅B(F)⊗ℚ; for a number field K₃⊗ℚ=K₃^ind⊗ℚ has dimension r₂. |
| Integral comparison | `comparison-integral` | For |F|≥4, 0→T(F)→K₃^ind(F)→B(F)→0, with the enhanced torsion term and no splitting assertion. |
| Ordinary quotient comparison | `comparison-finite-coefficients` | Exports the full snake sequence for multiplication by n, and the odd-n isomorphisms under the required root hypotheses. |

For clarity, the parent’s last comparison is a statement about torsion and
**ordinary quotients**:

\[
0\to T[n]\to K_3^{\mathrm{ind}}[n]\to B[n]\to T/n
 \to K_3^{\mathrm{ind}}/n\to B/n\to0.
\]

If n is odd and μ(F)⊗ℤ/n=0, K₃^ind(F)/n≅B(F)/n. For a number field,
K₃^M(F)=(ℤ/2)^{r₁}, so odd n also gives K₃(F)/n≅K₃^ind(F)/n. The CGZ
convention agrees at odd n. The good-prime finite-coefficient identification
below has a further K₂[n] term and uses different objects.

The boundary certificate retains diagonal information as well. For a chosen
factorization group A=ℤ/m₀×ℤˢ, its antisymmetric square has components
ℤ/gcd(m₀,2), (ℤ/m₀)ˢ, (ℤ/2)ˢ and ℤ^{s(s−1)/2}. The checked boundary sums
are the torsion diagonal, torsion/free cross terms, free diagonals and integer
cross minors. Vanishing is sufficient without an independence assumption on
the chosen generators. The converse requires that they give a basis of a
direct summand in F×, exactly as in the retained node. Thus a finite boundary
certificate and a finite five-term equality certificate certify different
facts; neither is already a bar-cycle representative.

## New declarations

The node suffixes below are new ids in this part. Names in the API tables are
the names used in the suggested file. Every construction has four unit tests;
the tests use actual library kernels and group homology, and the arithmetic
acceptance cases use the imported field objects.

### Integral root-of-unity multiple

Node: `K3BlochGroups:V.6/integral-root-multiple`.

Let F be a field, ζ a primitive m-th root with m≥2, P(F) the pre-Bloch group and ∂ its boundary to Suslin’s antisymmetric square. Define rootMultiple(ζ,m)=(m[ζ], h_m) in B(F)=ker ∂, where h_m is the boundary vanishing supplied by V.6/root-of-unity-symbol. The reusable construction takes any abelian groups P,W, homomorphism δ:P→W, x∈P, natural m and proof δ(mx)=0, and returns (mx,h)∈ker δ. The proof is not data on which the resulting element depends. Exact order is needed only for the field specialization, not the generic kernel construction.

The primary value is the integral numerator. For a primitive sixth root ω,
1−ω=ω⁻¹ and the retained boundary calculation gives
∂[ω]=(−1)∧(−1). Over ℚ(√−3) this diagonal obstruction is nonzero, so the
raw symbol fails the integral membership test, while 6[ω] passes. Over a
field in which −1 is a square, the raw symbol passes and the constructor
agrees with six times that raw Bloch element. These acceptance cases prevent
an exterior-square convention from entering the construction unnoticed.

An annihilator need not be minimal. The generic constructor therefore accepts
any natural m and a zero-boundary proof. Multiplying an annihilator multiplies
the integral numerator; division belongs to the next construction. The
annihilator-zero test exercises the generic kernel interface, not an assertion
that a primitive root has order zero.

**Hypotheses.**

- F is a field, m≥2 and IsPrimitiveRoot ζ m for the field specialization; hence ζ≠0,1.
- Use the antisymmetric quotient, retaining diagonal two-torsion, throughout the integral construction.

**Construction or proof.**

1. Import the actual boundary formula and m∂[ζ]=0 from V.6/root-of-unity-symbol; bilinearity turns the first factor ζ^m into 1.
2. Insert m[ζ] into the kernel using V.3/bloch-group. Equality and change of annihilating multiple follow from equality of underlying elements and proof irrelevance.
3. Under a field map transport the symbol and the boundary; kernel functoriality gives the stated compatibility.

**API.**

| Declaration | Role | Mathematical contract |
|---|---|---|
| `rootMultiple` | constructor | For δ,x,m,h:δ(mx)=0, return the kernel element with underlying value mx. |
| `rootMultiple_coe` | projection | The inclusion of rootMultiple(δ,x,m,h) into P is mx. |
| `rootMultiple_proof_irrel` | extensionality | For two proofs h,h′ of δ(mx)=0, the resulting kernel elements are equal. |
| `rootMultiple_zero` | simp | rootMultiple(δ,0,m,h)=0; rootMultiple(δ,x,0,h)=0. |
| `rootMultiple_of_mem` | compatibility | If b∈ker δ has underlying x, rootMultiple(δ,x,m,h)=mb. |
| `rootMultiple_mul` | relation | If δ(mx)=0 and δ((mk)x)=0, rootMultiple at mk is k times rootMultiple at m. |
| `rootMultiple_map` | functoriality | For f:P→P′ and g:W→W′ with δ′f=gδ, the induced kernel map sends rootMultiple(δ,x,m,h) to rootMultiple(δ′,f(x),m,h′). |

**Unit tests.**

- `rootMultiple_mod_two` (computation): For δ:ℤ→ℤ/2 reduction, x=1 and m=2, the underlying rootMultiple is 2, not 1.
- `rootMultiple_zero_multiplier` (degenerate): For every δ and x, the kernel element built with annihilator 0 is zero.
- `rootMultiple_kernel_compat` (compatibility): For b in the Mathlib additive kernel of δ and m=3, rootMultiple built from the underlying b equals 3b in that kernel.
- `rootMultiple_raw_rejected` (non-example): For δ:ℤ→ℤ/2 reduction, 1 is not in ker δ although 2 is. A constructor returning the raw symbol fails this test.

**Acceptance.**

- For a primitive sixth root ω over ℚ(√−3), 6[ω] is accepted although [ω] is rejected by the diagonal obstruction.
- Over a field where −1 is a square, the same construction agrees with six times the integral raw class of ω.

**Direct prerequisites.** `K3BlochGroups:V.6/root-of-unity-symbol`, `K3BlochGroups:V.3/bloch-group`, `mathlib:MonoidHom.ker`, `mathlib:IsPrimitiveRoot`.

### Root-of-unity class over a coefficient ring

Node: `K3BlochGroups:V.6/root-coefficient-class`.

Let δ:P→W be an additive homomorphism of abelian groups, B=ker δ, x∈P, m∈ℕ, and h:δ(mx)=0. Let R be a commutative ring and u∈R× with underlying value the image of m. Define rootCoefficient(δ,x,m,h,u)=(mx,h)⊗u⁻¹ in B⊗_ℤ R. Its image under B⊗R→P⊗R is x⊗1. This construction, without any flatness assumption, specializes for x=[ζ] to the parent’s rootClassMod (R=ℤ/n, gcd(m,n)=1), rootClassLoc (R=ℤ[1/m]) and rootClassPadic (R=ℤ_p, p∤m). It does not assert that tensoring the kernel identifies it with the kernel of the reduced boundary.

The coefficient ring is supplied together with an actual unit over m. The
equation on its value records the denominator that the caller is allowed to
invert. The image calculation is

\[
(m[\zeta])\otimes m^{-1}=[\zeta]\otimes1
\quad\text{in }P(F)\otimes_{\mathbb Z}R.
\]

The constructed element lives in B(F)⊗R before projecting to this tensor.
That order is essential when R is not flat. For δ:ℤ→ℤ/2, the kernel is
2ℤ. Tensoring its inclusion with ℤ/2 gives the zero map
2ℤ⊗ℤ/2→ℤ⊗ℤ/2, even though its source is nonzero. Thus the image in the
pre-Bloch tensor cannot characterize arbitrary lifts. The API characterizes
the chosen divided numerator and its compatibility, without asserting a
kernel-tensor interchange.

For R=ℤ/n the hypothesis is gcd(m,n)=1; the standard tensor-to-quotient
identification gives the parent’s rootClassMod. For ℤ[1/m] it gives
rootClassLoc; for ℤ_p with p∤m it gives rootClassPadic. These existing
constructors are compared with the general formula, not defined again.
For a sixth root over ℚ(√−3), n=5 is an admissible quotient coefficient
even though the raw integral symbol fails membership. Coefficients at a prime
dividing m do not meet this construction’s denominator hypothesis.

The independence of the denominator follows inside B: if m and l annihilate
∂x, then l(mx,h_m)=m(lx,h_l). Tensor balancing and the two specified
units give equality of the divided classes. This proof does not rely on the
projection B⊗R→P⊗R being injective.

**Hypotheses.**

- δ(mx)=0, R commutative and u a unit whose value is m in R.
- For the field specialization ζ has exact order m≥2. Coprimality or localization supplies the unit; when m is not invertible no raw coefficient class is constructed by this recipe.

**Construction or proof.**

1. Use the integral kernel element from integral-root-multiple and the canonical Mathlib tensor product; take its pure tensor with u⁻¹.
2. Apply the tensor of the kernel inclusion. The ℤ-balancing relation and uu⁻¹=1 give x⊗1.
3. For two annihilators m,l with invertible images, the equality l(mx,h_m)=m(lx,h_l) inside B proves equality of the two divided tensors. No injectivity after tensoring is used.
4. Tensor functoriality gives field maps and change of coefficient ring. Compare the three specializations with the already planned V.6/root-of-unity-class, including the standard B⊗ℤ/n≅B/n identification exported there.

**API.**

| Declaration | Role | Mathematical contract |
|---|---|---|
| `rootCoefficient` | constructor | The pure tensor rootMultiple(δ,x,m,h)⊗u⁻¹ in B⊗R, for the specified unit u. |
| `rootCoefficient_toPre` | projection | Under the tensor of the kernel inclusion, rootCoefficient maps to x⊗1. |
| `rootCoefficient_zero` | simp | For x=0 and any valid denominator, rootCoefficient=0. |
| `rootCoefficient_of_mem` | compatibility | If b∈B has underlying x, rootCoefficient=b⊗1. |
| `rootCoefficient_denominator_independent` | characterisation | For two annihilating positive or zero natural numbers m,l with invertible images u,v in R, the divided tensor classes coincide. |
| `rootCoefficient_changeRing` | functoriality | For a ring map ρ:R→S, tensoring id_B with ρ sends the class to the class with unit ρ(u). |
| `rootCoefficient_map` | functoriality | For a commuting boundary square f:P→P′,g:W→W′, tensoring its kernel map with id_R sends the class at x to that at f(x). |
| `rootCoefficient_specializations` | compatibility | Under B⊗ℤ/n≅B/n this is rootClassMod; for ℤ[1/m] it is rootClassLoc; for ℤ_p with p∤m it is rootClassPadic, with the parent’s conventions. |

**Unit tests.**

- `rootCoefficient_mod_five` (computation): For δ:ℤ→ℤ/2 reduction, x=1,m=2,R=ℤ/5 and u=2, the image in ℤ⊗ℤ/5 is 1⊗1 and the defining tensor in B⊗ℤ/5 is (2,h)⊗3.
- `rootCoefficient_zero_test` (degenerate): The class at x=0 equals zero for every unit denominator.
- `rootCoefficient_two_denominators` (compatibility): For δ:ℤ→ℤ/2 reduction, x=1,R=ℤ/5, the classes using annihilators 2 and 4 coincide; they both agree with pure tensor division in Mathlib.
- `rootCoefficient_nonflat` (non-example): For δ:ℤ→ℤ/2 reduction and R=ℤ/2, there is a nonzero tensor in (ker δ)⊗R whose image in ℤ⊗R is zero. Thus projection to the raw tensor does not characterize an arbitrary class and 2 cannot be used as a unit denominator in this R.

**Acceptance.**

- Modulo n requires gcd(m,n)=1; p-adic coefficients require p∤m.
- Over ℚ(√−3) and n=5 the class for a sixth root is defined even though the raw integral symbol is not in B.
- For a nonflat coefficient ring the inclusion of B⊗R into P⊗R can have a kernel; projection to the raw tensor does not imply uniqueness of arbitrary lifts.

**Direct prerequisites.** `K3BlochGroups:V.6/integral-root-multiple`, `K3BlochGroups:V.6/root-of-unity-class`, `mathlib:TensorProduct`, `mathlib:TensorProduct.tmul`, `mathlib:TensorProduct.map`, `mathlib:AddMonoidHom.toIntLinearMap`.

### Fibre of the integral Suslin comparison

Node: `K3BlochGroups:V.6/suslin-lift-fibre`.

For an infinite field F write the imported exact sequence as 0→T(F) --i→ K₃^ind(F) --q→ B(F)→0, with T(F) the enhanced Tor term in the parent. For β∈B(F), define SuslinLift(q,β)={k∈K₃^ind(F) | q(k)=β}. It is a nonempty fibre; T acts freely and transitively by k↦k+i(t). This is a torsor of witnesses, without a distinguished origin. For the generic API, q:K→B and i:T→K are homomorphisms of abelian groups, q surjective, i injective, and im i=ker q. The fibre definition itself needs only q and β.

Write T for the natural enhanced Tor term, rather than choosing an abstract
identification with a group of roots of unity. For infinite fields the source
is [Weibel, VI.5.2](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf),
printed p23; its natural realization is imported from V.4. A lift of β is
an actual representative and its equation under q. Translation acts in that
fibre, and exactness gives a unique difference in T. Choosing a basepoint
identifies the fibre with T, but the fibre itself has no preferred basepoint.

The ℚ example is modeled by reduction ℤ/24→ℤ/6. The four representatives
over 1 are 1,7,13,19. A section as an additive homomorphism does not exist:
all elements mapping to 1 have order 24, whereas a homomorphism from ℤ/6
must send its generator to an element annihilated by 6. In particular, an
existence proof cannot justify a natural additive lift operation.

This fibre is in K₃^ind. Passage to Quillen K₃ introduces the Milnor subgroup
as additional ambiguity. The bar-cycle witness below uses that full Quillen
model; it does not equate the two kinds of fibre.

**Hypotheses.**

- F infinite for the source cited here; the parent’s separately justified finite-field comparisons are reused in their own ranges.
- The torsor statements use exactness, including the enhanced two-primary extension, not ordinary Tor or a chosen direct sum decomposition.

**Construction or proof.**

1. Define the subtype fibre using the actual q of V.6/comparison-integral.
2. Use its surjectivity for nonemptiness. Exactness says the difference of two representatives is i(t); injectivity of i gives the unique t.
3. Translation and its laws use the additive group structure. A field map induces a fibre map by naturality of the parent comparison.
4. The generic finite-group example uses the actual Mathlib reduction ℤ/24→ℤ/6 and detects the nonsplit extension.

**API.**

| Declaration | Role | Mathematical contract |
|---|---|---|
| `SuslinLift` | data | The fibre subtype of q at β. |
| `SuslinLift.ofRep` | constructor | Given k and q(k)=β, produce a witness. |
| `SuslinLift.over` | projection | Every witness has q(value)=β. |
| `SuslinLift.ext` | extensionality | Two witnesses are equal iff their underlying K-elements are equal. |
| `SuslinLift.choose` | constructor | Surjectivity of q provides a noncomputable witness for each β; no additivity or naturality of choose is asserted. |
| `SuslinLift.translate` | structure | For t∈T and q∘i=0, translate k by i(t) within the same fibre. |
| `SuslinLift.translate_zero_add` | simp | Translation by 0 is the identity and successive translations by t and s equal translation by s+t. |
| `SuslinLift.unique_difference` | characterisation | When i is injective and im i=ker q, for witnesses a,b there is a unique t∈T with b.value=a.value+i(t). |
| `SuslinLift.map` | functoriality | For f:K→K′,g:B→B′ with q′f=gq, map a witness above β to the witness with representative f(k) above g(β). |
| `SuslinLift.map_id_comp` | functoriality | The fibre maps respect identity maps and composition of commuting squares. |

**Unit tests.**

- `SuslinLift_zero_test` (degenerate): For every additive q, 0 with q(0)=0 is an element of SuslinLift(q,0).
- `SuslinLift_Q_fibre` (computation): For q:ℤ/24→ℤ/6 reduction, the fibre over 1 has cardinality 4 and underlying representatives 1,7,13,19.
- `SuslinLift_kernel_compat` (compatibility): For β=0 and q:K→B, the underlying representatives are exactly Mathlib’s additive kernel q.ker.
- `SuslinLift_Q_nonsplit` (non-example): The reduction ℤ/24→ℤ/6 has no additive section. Fibre nonemptiness cannot justify an additive canonical choice of lifts.

**Acceptance.**

- For β=0, zero is a witness but other kernel elements can be witnesses.
- For F=ℚ the parent’s nonsplit ℤ/4→ℤ/24→ℤ/6 model gives four witnesses over each β. It cannot be replaced with ℤ/6⊕ℤ/4.

**Direct prerequisites.** `K3BlochGroups:V.6/comparison-integral`, `K3BlochGroups:V.2/k3-indecomposable`, `mathlib:MonoidHom.ker`, `mathlib:ZMod.castHom`.

### Certified finite bar-cycle lift

Node: `K3BlochGroups:V.6/bar-lift-witness`.

Let F be infinite, G=St(F) the imported stable Steinberg group, A the trivial integral representation, and ψ:H₃(G,ℤ)→B(F) the composite H₃(St(F),ℤ)≅K₃(F)→K₃^ind(F)→B(F). For β∈B(F), define BarLiftCertificate(ψ,β)={z∈Z₃(G,ℤ) | ψ(π(z))=β}. Here Z₃ and π are Mathlib’s cycles and their projection to homology. The underlying chain is a finitely supported integral function on triples (equivalently Fin 3→G), with bar boundary [g|h|k]↦[h|k]−[gh|k]+[g|hk]−[g|h]. Its data are a finite chain, proof its boundary vanishes, and proof its homology image is β. This does not include an algorithm producing a chain from a five-term certificate.

The three-chain module and its differential already exist in Mathlib.
The witness reuses the actual degree-three cycle module and homology
projection. Its condition is the equation under the actual imported composite
ψ:H₃(St(F),ℤ)→B(F). A proof of vanishing boundary in the symbol tensor
alone does not supply this cycle or this equation.

For the unnormalized bar complex the chain [1|1|1] is a nonzero finite chain
with zero differential. It is the boundary of [1|1|1|1], so its homology
class is zero. This distinguishes equality of witnesses, which remembers
their finite chains, from equality of their evaluations. A general triple
[g|1|h] is not automatically a cycle: its boundary is [1|h]−[g|1]. The
interface cannot simply evaluate every formal triple as though it were a cycle.

Adding a four-boundary preserves the homology representative and the Bloch
target. Two witnesses with the same Bloch target can still have different
homology classes, because ψ itself has a kernel. The imported K₃/H₃(St)
comparison then gives their Quillen K₃ representatives. The kernel of
K₃→B accounts for both Milnor and enhanced-Tor ambiguity.

[Weibel, VI.5.12](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf),
printed p29, supplies the surjectivity of the GL₃ comparison; the parent
supplies its compatibility with the stable Steinberg model. Classical choice
can select a witness after those surjectivity results. The requested
computational certificate-to-cycle synthesis still needs a sourced
chain-level construction, auxiliary choices and an exact range or termination
statement. It is a named gap, not a property of choose.

**Hypotheses.**

- The field-specific ψ and its surjectivity come from the parent’s V.1 and V.6 nodes. The witness type itself is defined for any group G and supplied ψ to any abelian B.
- Use the unnormalized inhomogeneous bar complex with trivial integral coefficients. A proof that a pre-Bloch symbol combination has boundary zero and a bar cycle are different kinds of certificate.

**Construction or proof.**

1. Import V.1/bar-cycle-model and k3-h3-steinberg, and compose their homology identification with the integral Suslin comparison and K₃→K₃^ind.
2. Use the existing Mathlib cycle type and π; define the subtype imposing ψπ(z)=β. Its chain inclusion is finite support and carries the required cycle equation.
3. A supplied finite chain and both proofs construct a witness. Adding a degree-four boundary leaves its homology class, hence its certified Bloch target, unchanged.
4. The parent’s existential certificate-to-bar-cycle theorem and the surjectivity of cycles→homology yield a noncomputable chosen witness. They give no bounded or executable synthesis procedure.
5. Map along a group/field homomorphism using the imported bar functor and a commuting ψ square; identity and composition follow from the supplied maps.

**API.**

| Declaration | Role | Mathematical contract |
|---|---|---|
| `BarLiftCertificate` | data | The subtype of actual degree-three cycles z with ψπ(z)=β. |
| `BarLiftCertificate.chain` | projection | Include the witness cycle into Mathlib’s finite-support chain module. |
| `BarLiftCertificate.cycle_eq` | characterisation | The differential of chain(c) is zero. |
| `BarLiftCertificate.homology` | projection | The homology representative is π(cycle(c)) in the imported H₃. |
| `BarLiftCertificate.over` | projection | ψ(homology(c))=β. |
| `BarLiftCertificate.ofCycle` | constructor | Given z∈Z₃ and ψπ(z)=β, construct the witness; the standard cyclesMk constructor accepts a finite chain and its zero-boundary proof. |
| `BarLiftCertificate.ext` | extensionality | Witnesses are equal iff their underlying cycles are equal, equivalently iff their chains are equal. |
| `BarLiftCertificate.addBoundary` | relation | For w∈C₄, replacing z by z+d₄w is a witness above the same β and has the same homology representative. |
| `BarLiftCertificate.choose` | constructor | If ψ is surjective, classical choice and the surjectivity of π provide a witness over every β. This API has no executable or functorial-choice guarantee. |
| `BarLiftCertificate.map` | functoriality | A map of cycle modules compatible with ψπ maps witnesses over β to witnesses over the image of β; the maps induced by group/field maps are those from V.1. |
| `BarLiftCertificate.map_id_comp` | functoriality | Maps of witness fibres respect identity and composition. |

**Unit tests.**

- `BarLiftCertificate_zero_test` (degenerate): The certificate of the zero cycle above 0 has zero chain and zero homology representative.
- `BarLiftCertificate_boundary_test` (compatibility): For any c and four-chain w, the witness addBoundary(c,w) has the same image under Mathlib’s homology projection π as c.
- `BarLiftCertificate_trivial_group` (non-example): For the trivial group and any ψ:H₃(1,ℤ)→B, no witness exists over β≠0, because H₃(1,ℤ)=0.
- `BarLiftCertificate_one_cube` (computation): For the trivial group, the single chain [1|1|1] with coefficient 1 is a cycle representing zero homology. It is a witness above 0 distinct as a finite chain from the zero witness. Thus equality of homology must not be used as extensionality of witnesses.

**Acceptance.**

- The zero chain certifies β=0. A noncycle cannot be certified merely because an informal symbolic expression evaluates to a Bloch element.
- Adding a four-boundary changes the chain while preserving its homology image. Two witnesses over β need not have equal homology classes; their Quillen K₃ representatives differ by ker(K₃→B), including Milnor and enhanced-Tor contributions.
- The computational synthesis gap remains explicitly recorded.

**Direct prerequisites.** `K3BlochGroups:V.1/bar-cycle-model`, `K3BlochGroups:V.1/k3-h3-steinberg`, `K3BlochGroups:V.6/certificate-to-bar-cycle`, `K3BlochGroups:V.6/comparison-integral`, `K3BlochGroups:V.6/suslin-lift-fibre`, `mathlib:Rep.trivial`, `mathlib:groupHomology.cycles`, `mathlib:groupHomology.iCycles`, `mathlib:groupHomology.π`, `mathlib:groupHomology.toCycles`, `mathlib:groupHomology.inhomogeneousChains.d`, `mathlib:isZero_groupHomology_succ_of_subsingleton`.

### Good-prime finite-coefficient K₃ and étale Bloch identification

Node: `K3BlochGroups:V.6/finite-coefficient-identification`.

Let F be a number field, p an odd prime, a≥1, n=p^a and p∤w₂(F). Use the imported finite-coefficient Quillen group K₃(F;ℤ/n), whose exact sequence is 0→K₃(F)/n --j_K→ K₃(F;ℤ/n) --∂_K→ K₂(F)[n]→0. Use the Habiro-owned CGZ étale Bloch group B_CGZ(F;ℤ/n), with its exact sequence 0→B_CGZ(F)/n --j_B→ B_CGZ(F;ℤ/n) --δ_B→K₂(F)[n]→0. The finite Chern isomorphism c̄₂,₁:K₃(F;ℤ/n)≅H¹(F,ℤ/n(2)) and the CGZ isomorphism R_ζ:B_CGZ(F;ℤ/n)≅H¹(F,ℤ/n(2)), transported through the same chosen twist/Kummer convention for a primitive n-th root ζ, give Φ_ζ=R_ζ⁻¹∘c̄₂,₁. In the additional range n prime to M_F of Habiro HB.1, write R_ζ∘κq=c_ζ^γ on K₃(F)/n using HB.2/the-comparison-with-the-chern-class. Then Φ_ζ∘j_K=j_B∘(γ⁻¹κq), with multiplicative powers interpreted as scalar multiplication on the additive target. No assertion δ_BΦ_ζ=∂_K is made without checking the right-hand normalization. In particular Φ is not asserted to extend the unscaled Suslin map.

The common cohomology target is H¹(F,ℤ/n(2)), with the same ζ twist and
Kummer transport on both sides. The comparison is the composite of the
finite Chern isomorphism with the inverse CGZ isomorphism, Φ_ζ=R_ζ⁻¹c̄₂,₁.
Its definition makes R_ζΦ_ζ=c̄₂,₁ immediate once the supplied equivalences
have been constructed. This compares actual finite-coefficient middle groups.

The finite Chern input over F is requested from M.7 and M.8.
[Hutchinson, Theorem 2.10](https://arxiv.org/pdf/2104.14413v4), printed p4,
identifies the finite-coefficient indecomposable group with H¹ for fields of
characteristic prime to n. For number fields and odd n, the imported Milnor
calculation removes the decomposable quotient. Hutchinson’s Corollary 2.11
has the narrower hypothesis μ_n⊂F, and cannot be applied over the original
good-prime field F without checking this reduction. The request specifies
the exact finite-coefficient quotient convention that must support it.

The other isomorphism and the étale Bloch exact sequence are already owned by
**HabiroNumberFields:HB.2/etale-bloch-group-and-K2**, using
[CGZ, equations (37)–(38)](https://arxiv.org/pdf/1712.04887v3), pp32–33.
Only its number-field, n=pᵃ, p∤w₂(F) range is used. The absence of primitive
p-th roots in F supplies the torsion-freeness needed by the coefficient Bloch
argument. V.6 does not generalize that argument to fields with those roots or
to even coefficients.

On the ordinary quotient subgroup, the additional n prime to M_F condition
allows the existing HB.2 comparison R_ζκq=c_ζ^γ, with γ a unit. In additive
notation this yields

\[
\Phi_\zeta j_K=j_B\,\gamma^{-1}\kappa q.
\]

The exact value of γ is owned by the existing Habiro/Hutchinson comparison
chain; this part uses its unit property. The definition R_ζ⁻¹c̄ is not
silently normalized to extend the unscaled Suslin map. The corresponding
right-end equality for δ_BΦ_ζ and the K-theory Bockstein ∂_K needs its
own degree-two scalar/sign check, requested from M.8 and recorded as a gap.

The concrete distinction appears already over ℚ at n=5. The imported
calculation gives K₃(ℚ)=ℤ/48, hence K₃(ℚ)/5=0. But HB.2’s coefficient
Bloch class [32] has δ_B([32])={2,−31} in K₂(ℚ)[5]. Its tame symbol at
31 is 2 of order 5, so it is nonzero. The finite-coefficient middle groups
therefore carry information absent from the ordinary quotient. The suggested
file states the composition and its scaled quotient restriction for genuine
supplied equivalences and linear maps; the unavailable arithmetic types and
the [32] acceptance statement are identified precisely in comments.

**Hypotheses.**

- F a number field; n=p^a, p odd, a≥1 and p∤w₂(F). These hypotheses imply F has no primitive p-th root of unity and put the two imported isomorphisms in their stated ranges.
- c̄ uses the Soulé convention of M.8, and R_ζ uses the HB.2 twist convention. The equality on the modulo subgroup additionally uses n prime to M_F; γ is the unit from the existing HB comparison, without asserting a value here.
- The finite Chern isomorphism for number fields without adjoining μ_n is requested from M.7: use Hutchinson Theorem 2.10 and K₃^M(F)/n=0, not the narrower corollary requiring μ_n⊂F.

**Construction or proof.**

1. Import finite-coefficient K-theory and its universal coefficient sequence through HB.1/finite-coefficient-K3-and-the-chern-class. Import the finite Chern class and its compatibility with j_K from M.8.
2. Obtain the degree-three finite Chern isomorphism from M.7, with the odd-prime Milnor quotient zero by V.2/milnor-k3-number-field. The source proof input is Hutchinson Theorem 2.10, not an application of Corollary 2.11 over the wrong field.
3. Import both the étale Bloch object and R_ζ isomorphism from HB.2/etale-bloch-group-and-K2. Use only its number-field good-prime statement. It is not rebuilt in V.6.
4. Compose the inverse of R_ζ with the finite Chern isomorphism. For the modulo restriction, HB.1/hutchinson-chern-class-agrees identifies c̄j_K with c_ζ, and HB.2’s γ comparison gives the factor γ⁻¹.
5. Keep the right-end Bockstein normalization as a recorded gap. The exact sequences already show why ordinary quotient comparison does not remove K₂(F)[n].

**API.**

| Declaration | Role | Mathematical contract |
|---|---|---|
| `finiteCoefficientBlochEquiv` | constructor | For genuine additive equivalences c:K≃H and r:E≃H, the resulting Φ:K≃E is r⁻¹c. For the field specialization, c is the supplied finite Chern equivalence and r is the supplied R_ζ equivalence. |
| `finiteCoefficientBlochEquiv_spec` | characterisation | r(Φ(x))=c(x), and Φ⁻¹(y)=c⁻¹(r(y)). The first equation uniquely characterizes Φ. |
| `finiteCoefficientBlochEquiv_def` | compatibility | The generic construction is exactly Mathlib’s AddEquiv composition c.trans r.symm. |
| `finiteCoefficientBlochEquiv_on_quotient` | relation | For n-torsion modules L,H, a linear map h₀:L→H, a unit γ∈ℤ/n, and inclusions j_K:L→K,j_B:L→E satisfying c j_K=h₀ and r j_B=γh₀, one has Φ j_K(x)=j_B(γ⁻¹x). This is the field restriction after L=K₃(F)/n is identified with B_CGZ(F)/n. |
| `finiteCoefficientBlochEquiv_natural` | functoriality | Given supplied equivalences c′:K′≃H′,r′:E′≃H′ and homomorphisms f:K→K′,g:E→E′,h:H→H′ with c′f=hc and r′g=hr, one has Φ′f=gΦ. Field-extension naturality uses exactly these supplied commuting comparisons in their common good-prime range. |

**Unit tests.**

- `finiteCoefficientBlochEquiv_mod_five` (computation): In K=E=H=ℤ/5, let c(x)=2x and r(x)=3x. Then Φ(1)=4. Reversing the equivalences gives the wrong answer.
- `finiteCoefficientBlochEquiv_zero` (degenerate): For K=E=H=ℤ/1 and any supplied equivalences, Φ(0)=0.
- `finiteCoefficientBlochEquiv_composition` (compatibility): For actual Mathlib additive equivalences c,r, Φ equals c.trans r.symm, including its inverse map c⁻¹r.
- `finiteCoefficientBlochEquiv_middle_not_left` (non-example): The exact sequence 0→0→ℤ/5→ℤ/5→0 has middle group not isomorphic to its left group: there is no additive equivalence ℤ/1≃ℤ/5. This tests the finite-coefficient K₂-term distinction in a finite model; the arithmetic acceptance instance is F=ℚ,n=5 and [32].

**Acceptance.**

- The prototype named finiteCoefficientBlochEquiv takes two genuine additive equivalences into the same group H and has R(Φ(x))=c(x), with inverse c⁻¹R. This tests the construction without inventing missing K-theory/cohomology types.
- The prototype named finiteCoefficientBlochEquiv_on_quotient requires the actual commutative equations c j_K=h₀ and R j_B=γh₀ and yields the γ⁻¹ factor.
- For F=ℚ,n=5, K₃(ℚ)/5=0, while HB.2’s class [32] has δ_B([32])={2,−31}≠0 with tame symbol 2 of order 5 at 31. Thus neither finite-coefficient middle group can be replaced by the ordinary quotient.
- No arbitrary-field comparison or good-prime extension at 2 is exported.

**Direct prerequisites.** `K3BlochGroups:V.6/comparison-finite-coefficients`, `K3BlochGroups:V.3/cgz-convention-comparison`, `K3BlochGroups:V.2/milnor-k3-number-field`, `HabiroNumberFields:HB.1/finite-coefficient-K3-and-the-chern-class`, `HabiroNumberFields:HB.1/hutchinson-chern-class-agrees`, `HabiroNumberFields:HB.2/etale-bloch-group-and-K2`, `HabiroNumberFields:HB.2/the-comparison-with-the-chern-class`, `MotivicEtaleKTheory:M.7`, `MotivicEtaleKTheory:M.8`, `mathlib:MulEquiv.trans`, `mathlib:MulEquiv.symm`.

## Atlas structure and ownership

The four new root/lift nodes have planets named **Root of unity multiples**,
**Root of unity classes**, **K₃ lifts**, and **Bar cycle certificates**. Together
with the parent’s **Five-term certificate** and **Bloch element constructor**,
the combined V.6 layer has exactly six planets. Comparisons still appear as
declarations in the layer; the new comparison adds no planet.

The packet proposes a structural split for assembly: V.6a contains the
algebraic elements, certificates, root classes and lift witnesses; V.6b contains
the arithmetic finite-coefficient identification. The actual input order is
V.6a → HB.2 → V.6b, with M.7/M.8 supplying V.6b. Replacing those node-level
arrows with two whole-stage V.6/HB.2 arrows would create a cycle. The proposed
split keeps all node ids and the current issue’s exact scope.

The regulator rescope and this split are proposals in the deliverable packet;
they do not edit the parent, campaign document or atlas. If P.2 or D.2 require
an additional V.6-specific certificate interface, its outgoing edge comes from
V.6a. The current analytic comparisons already have the needed Suslin maps in
V.4. Adding an outgoing edge from the whole arithmetic V.6 layer would cycle
through M.8, which consumes the analytic regulators. D.3 remains the consumer
of the p-adic root-class inputs in its stated completed, unramified setting.

## Coverage and acceptance gate

V.6 has coverage **planned** and this planning pass has status **complete**.
Every algebraic target is assigned to a new node or an exact retained node.
The two regulator targets are assigned to their analytic owners. All new
declarations remain unchecked implementation plans.

The remaining inputs are precise:

1. A sourced effective lifting procedure from finite symbol/boundary/equality
   certificates to a checked finite Steinberg three-cycle. Noncomputable choose
   does not resolve this gap.
2. M.7’s degree-three finite Chern isomorphism over the original number field
   and M.8’s finite reduction/twist compatibility. The comparison of the
   right-hand K₂[n] terms also requires the exact scalar/sign.
3. The inherited V.1 proof input: the degree-three absolute Hurewicz theorem
   for the two-connected BSt(F)⁺ and the bar/singular comparison. The parent
   records an upstream-citation gap for the Hurewicz input. Its owner resolves
   that input; V.6 does not reconstruct it.

Assembly retains the parent’s certificates, comparison statements and their
honest input gaps. A closed coverage claim requires these unresolved inputs
and the two supplier requests to be resolved. In particular, successful
elaboration of the generic signatures does not prove a field comparison or
provide the requested algorithm.

The mathematical acceptance gate includes the sixth-root diagonal obstruction,
the modulo-five divided numerator, the nonflat tensor example, the nonsplit
ℤ/24→ℤ/6 lift fibre, the nonzero zero-homology cube, and the nonzero K₂(ℚ)[5]
image of [32]. These distinguish the relevant integral and finite-coefficient
objects as well as the kind of evidence supplied by each certificate.

## Sources and suggested forms

The source versions, read sections, access date 2026-10-06 and SHA-256 values
are recorded in the [packet](../packets/K3BlochGroups--V.6.json). The public
sources read for the new nodes are Weibel’s separately hosted Chapter VI,
CGZ arXiv v3, and Hutchinson arXiv v4. The read VI chapter states the cited
Suslin theorem for infinite fields; the broader finite-field range in the
retained comparison is the parent’s separately justified input. This part
does not silently widen the chapter’s theorem.

For the source collation, the author-hosted printed CGZ article was also read
at §6, printed p415. Finding `K3BlochGroups/E-V6-1` records the missing
n-torsion brackets in the sentence identifying Q/nR: the intended value is
K₂(F)[n], as the adjacent exact sequences show. The same omission is present
in arXiv v3 p32. It changes no result, and the constructions here use the
corrected torsion term. Finding `K3BlochGroups/E-V6-2` records the adjacent
variable slip in the definition of δ: the boundary used to choose y is that
of x; z is introduced as the image of y only in the next sentence. Both copies
have that slip. The packet records both copies and the correction search;
the independent reviewer checks the findings.

The [suggested file](../suggested/K3BlochGroups--V.6.lean) uses individual pinned
Mathlib imports and actual kernel, tensor, subtype and homology objects. It
contains the named interfaces and all twenty unit tests. The one API that
needs the unavailable parent field types, rootCoefficient_specializations,
is stated precisely in a comment with all three supplier equalities. The
finite-coefficient arithmetic specialization is similarly recorded alongside
its typed generic composition. No missing condition is represented by a bare
proposition or a substitute object.
