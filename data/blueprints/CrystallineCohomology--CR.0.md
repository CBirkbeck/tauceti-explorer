# Crystalline cohomology, de Rham–Witt and logarithmic foundations

This part constructs the classical divided-power, crystalline and de Rham–Witt interfaces used by integral p-adic cohomology. It begins with the existing divided-power algebra, develops relative envelopes and crystalline coefficients, and computes cohomology by PD de Rham complexes. Proper smooth finiteness, Frobenius and duality follow before the ordinary and relative Witt complexes. The logarithmic model contracts at the end use the separately owned logarithmic foundations.

The notation is cohomological: differentials raise degree, and RΓ, Ru_* and tensor products marked with L are derived. A PD ring is a commutative ring with a divided-power ideal. Divided-power operations are zero outside that ideal in the pinned Mathlib convention. The prime p may be 2. Strict graded commutativity includes vanishing of odd squares; signs alone are insufficient at p=2. A p-completed complex is a derived inverse limit unless an ordinary degreewise completion is explicitly identified.

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The existing carriers are reused. Generic Γ grading, base change and the free Γ^d–TSym comparison are supplied by the current IntegralHeckeAndGaloisDeterminants roadmap, §0.4. Ordinary de Rham complexes and the Cartier isomorphism come from DerivedDeRhamCohomology; the derived-versus-classical lci comparison belongs to its DD.4. The contracts below specify every additional hypothesis used here.

Each layer lists definitions and target results with their exact interfaces. A dependency on a supplier includes the mathematical contract recorded below; the handoff distinguishes completed planning from proof inputs still requiring verification. The suggested Lean file is a signature prototype. Its comment register and the per-node component notes identify statements that cannot yet be typed against the pinned carriers.

## CR.0 — Divided powers and universal thickenings

**Targets.** Divided powers on a compatible sum of ideals, Flat extension of divided powers, Divided power filtration, Relative divided power polynomial algebras, Universal base-compatible divided power envelope, The crystalline period ring A_cris of a p-adically complete ring.

### additive-powers — Additive divided-power candidates

**Definition:** `TauCeti.PD.AdditivePowers`. For an ideal I⊂A, an additive divided-power candidate consists of maps δₙ:A→A, n≥0, zero outside I, such that for all x,y∈I and a∈A: δ₀(x)=1, δ₁(x)=x, δₙ(x)∈I for n>0, δₙ(x+y)=Σᵢ₊ⱼ₌ₙδᵢ(x)δⱼ(y), and δₙ(ax)=aⁿδₙ(x). The multiplication and iteration identities are not assumed. Every divided power structure on I is an additive candidate with the same operations.

**Hypotheses and conventions.**

- A is a commutative ring and I⊂A is an ideal.
- The operations δₙ, n≥0, are maps A→A that vanish outside I in every degree, including degree 0; this is the convention of Mathlib's DividedPowers.

**API.**

- `TauCeti.PD.AdditivePowers.ofDividedPowers` (constructor): Every existing PD structure gives its additive candidate without changing any operation.
- `TauCeti.PD.AdditivePowers.ofDividedPowers_dpow` (compatibility): The candidate operation obtained from γ is exactly γₙ on every element, including outside I.
- `TauCeti.PD.AdditivePowers.ext` (extensionality): Candidates with equal operations on I coincide.

**Unit tests.**

- `TauCeti.PD.test_candidate_zero_index` (degenerate): For every additive candidate δ on I: δ₀(0)=1.
- `TauCeti.PD.test_candidate_positive_at_zero` (computation): For every additive candidate δ on I: δ₂(0)=0.
- `TauCeti.PD.test_candidate_rational` (compatibility): For a commutative ℚ-algebra R, an ideal I of R, a divided power structure γ on I, x∈I and n≥0: the candidate of γ has value TauCeti.Associative.dividedPower n x=(n!)⁻¹·xⁿ at x. Instance: R=ℚ[X], I=(X), x=X.
- `TauCeti.PD.test_candidate_not_pd` (non-example): On A=F₂[ε]/(ε²) with I=(ε), the maps with δ₀=1, δ₁=δ₃=id and δₙ=0 for n=2 and n≥4 on I, and δₙ=0 outside I for all n, form an additive candidate on I, and δ₁(ε)·δ₂(ε)=0≠ε=3·δ₃(ε). So an additive candidate need not satisfy the multiplication identity.
- `TauCeti.PD.test_candidate_outside` (non-example): For every additive candidate δ on I and every x∉I: δ₀(x)=0.

**Uses.** Stacks Lemma 23.2.4, hypothesis (a); CR.0/generator-criterion: is the data to which the generator criterion adds the multiplication and iteration identities on a generating set Stacks Lemmas 23.2.5 and 23.4.2, proofs; CR.0/sum-candidate, flat-candidate: the operations on I+J and on IB are first constructed as candidates satisfying axioms (1), (3), (4), and become divided power structures through the generator criterion

**Construction or proof.**

1. Collect precisely axioms (1),(3),(4) and ideal membership from Stacks 23.2.4.
2. Use total functions with the same outside-ideal convention as the existing DividedPowers structure.

**Depends on:** `mathlib:DividedPowers`, `tauceti:TauCeti.Associative.dividedPower`, `tauceti:TauCeti.Associative.dividedPower_eq_dpow`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.2.4 (tag 07GP), statement, hypothesis (a); Definition 23.2.1 (tag 07GL), axioms (1), (3), (4). The node packages hypothesis (a) of the lemma: maps γₙ:I→I satisfying axioms (1), (3) and (4) of Definition 23.2.1. Beyond the source it sets δ₀=1 on I and extends every δₙ by zero outside I, as Mathlib's DividedPowers does.

**Acceptance.**

- Every divided power structure γ on I gives a candidate with the same operations.
- On A=F₂[ε]/(ε²) with I=(ε), the maps δ₀=1, δ₁=δ₃=id and δₙ=0 for n=2 and n≥4 on I, and 0 outside I, form an additive candidate that is not a divided power structure: δ₁(ε)δ₂(ε)=0 but 3δ₃(ε)=ε.

### multiplication-addition — The multiplication identity is stable under sums

**Lemma:** `TauCeti.PD.AdditivePowers.mul_at_add`. For an additive candidate δ, suppose the identities δₘ(z)δₙ(z)=choose(m+n,m)δₘ₊ₙ(z) hold for every m,n at each of x,y∈I. They then hold at x+y.

**Hypotheses and conventions.**

- A is a commutative ring, I⊂A an ideal and δ an additive candidate on I.
- x,y∈I, and δₘ(z)δₙ(z)=choose(m+n,m)·δₘ₊ₙ(z) holds for all m,n≥0 at z=x and at z=y.

**Uses.** Stacks Lemma 23.2.4, proof; CR.0/generator-criterion: is the induction step on sums by which the multiplication identity passes from a generating set to the whole ideal

**Construction or proof.**

1. Expand both operations at x+y by the addition law and rearrange the finite four-index sum.
2. Apply the multiplication identity separately at x and y. For fixed exponents a+b=m+n, the resulting coefficient is the Vandermonde sum Σ choose(a,i)choose(b,m−i)=choose(m+n,m).
3. This is an identity of natural integers before casting to A; the source also checks its coefficients in Q[X,Y].

**Depends on:** `CR.0/additive-powers`, `mathlib:Nat.add_choose_eq`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.2.4 (tag 07GP), proof, paragraph "Proof of (2) for x + y". The node is this step of the proof. The source verifies the displayed coefficient identity by a computation in ℚ[x,y]; the node proves it as Vandermonde's identity of natural numbers.

**Acceptance.**

- For m=n=1: from x²=2δ₂(x) and y²=2δ₂(y) the lemma gives (x+y)²=2δ₂(x+y)=2δ₂(x)+2xy+2δ₂(y).
- The coefficient identity is Vandermonde's Σᵢchoose(a,i)·choose(b,m−i)=choose(a+b,m); for a=b=m=1 it reads 1+1=2.

### iteration-addition — The iteration identity is stable under sums

**Lemma:** `TauCeti.PD.AdditivePowers.comp_at_add`. For an additive candidate δ satisfying the multiplication identity on all I, suppose δₘ(δₙ(z))=uniformBell(m,n)δₘₙ(z) for all m and n>0 at x,y∈I. It holds at x+y.

**Hypotheses and conventions.**

- A is a commutative ring, I⊂A an ideal and δ an additive candidate on I such that δₘ(z)δₙ(z)=choose(m+n,m)·δₘ₊ₙ(z) for all m,n≥0 and all z∈I.
- x,y∈I, and δₘ(δₙ(z))=uniformBell(m,n)·δₘₙ(z) holds for all m≥0 and all n>0 at z=x and at z=y.

**Uses.** Stacks Lemma 23.2.4, proof; CR.0/generator-criterion: is the induction step on sums by which the iteration identity passes from a generating set to the whole ideal

**Construction or proof.**

1. Expand δₙ(x+y) by the addition law, then expand δₘ of that finite sum by DividedPowers.dpow_sum' applied to the candidate. The positive inner degree ensures every summand is in I.
2. Apply scalar homogeneity to δₖ(δᵢ(x)δⱼ(y)); use iteration at x if i>0 and at y if i=0. Reduce repeated products using the multiplication identity.
3. Collect coefficients of δₐ(x)δᵦ(y), a+b=mn. Verify their universal integer values by the same calculation in Q[X,Y] with its divided power structure fⁿ/n! on (X,Y) (DividedPowers.RatAlgebra.dividedPowers), where these divided monomials are linearly independent. The coefficient is uniformBell(m,n). No injection of A into a rational algebra is assumed.

**Depends on:** `CR.0/additive-powers`, `mathlib:DividedPowers.dpow_sum'`, `mathlib:MvPolynomial.basisMonomials`, `mathlib:DividedPowers.RatAlgebra.dividedPowers`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.2.4 (tag 07GP), proof, paragraph "Proof of (5) for x + y". The node is this step of the proof, with the same reduction to an identity of universal integer coefficients checked in ℚ[x,y]. The source's coefficient (nm)!/(n!(m!)ⁿ) in axiom (5) is Mathlib's uniformBell.

**Acceptance.**

- For m=n=2: δ₂(δ₂(x+y))=3δ₄(x+y); the coefficient of δ₂(x)δ₂(y) on the left is 2, from δ₂(xy)=y²δ₂(x)=2δ₂(y)δ₂(x), plus 1, from the cross term δ₂(x)·δ₂(y), and uniformBell(2,2)=3.
- For n=1 the conclusion is δₘ(δ₁(z))=δₘ(z), and uniformBell(m,1)=1.

### generator-criterion — Divided powers from identities on generators

**Construction:** `TauCeti.PD.AdditivePowers.toDividedPowers`. Let δ be an additive candidate on I and S⊂A with I=span(S). If multiplication and positive-inner-index iteration hold at every s∈S, construct the existing DividedPowers I with operation δ. No freeness, factorial invertibility, or nilpotence is required.

**Hypotheses and conventions.**

- A is a commutative ring, I⊂A an ideal, δ an additive candidate on I and S⊂A a subset with I=span(S).
- For every s∈S: δₘ(s)δₙ(s)=choose(m+n,m)·δₘ₊ₙ(s) for all m,n≥0, and δₘ(δₙ(s))=uniformBell(m,n)·δₘₙ(s) for all m≥0 and all n>0.

**API.**

- `TauCeti.PD.AdditivePowers.toDividedPowers_dpow` (simp): The result uses δₙ exactly on all A.
- `TauCeti.PD.AdditivePowers.toDividedPowers_unique` (characterisation): Every PD structure with these candidate operations equals the constructed structure.
- `TauCeti.PD.AdditivePowers.toDividedPowers_generators` (compatibility): Different generating sets and valid identity proofs yield the same structure.

**Unit tests.**

- `TauCeti.PD.test_generators_degree_two` (computation): For x,y∈I the constructed structure θ satisfies θ₂(x+y)=δ₂(x)+x·y+δ₂(y).
- `TauCeti.PD.test_generators_outside` (non-example): For x∉I the constructed structure θ satisfies θ₀(x)=0.
- `TauCeti.PD.test_generators_inner_one` (compatibility): For x∈I and every n≥0 the constructed structure θ satisfies θₙ(θ₁(x))=δₙ(x).
- `TauCeti.PD.test_generators_roundtrip` (compatibility): For every divided power structure γ on I: the structure constructed from the candidate of γ with S=I (the hypotheses on generators being the axioms of γ) is equal to γ.
- `TauCeti.PD.test_generators_hypothesis_needed` (non-example): On A=F₂[ε]/(ε²) with I=(ε) and S={ε}: the additive candidate with δ₀=1, δ₁=δ₃=id and δₙ=0 for n=2 and n≥4 has δ₁(ε)·δ₂(ε)=0≠3·δ₃(ε)=ε, so the multiplication hypothesis fails at the generator ε, and no divided power structure on I has these operations.

**Uses.** Stacks Lemma 23.2.5, proof; CR.0/compatible-sum: reduces the multiplication and iteration identities of the glued operations to the generating set I∪J Stacks Lemma 23.4.2, proof, flat case; CR.0/flat-extension: reduces the multiplication and iteration identities of the extended operations to the generating set f(I) of IB

**Construction or proof.**

1. Propagate multiplication from S to its scalar multiples using homogeneity; use multiplication-addition and induction on ideal span to obtain the identity everywhere.
2. Propagate iteration under scalar multiplication using homogeneity twice. Apply iteration-addition and span induction to obtain the iteration identity on all I.
3. Fill exactly the two missing fields of DividedPowers. The underlying operations are unchanged.

**Depends on:** `CR.0/additive-powers`, `CR.0/multiplication-addition`, `CR.0/iteration-addition`, `mathlib:DividedPowers`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.2.4 (tag 07GP), statement. The node is the lemma: maps satisfying (1), (3), (4) on I and (2), (5) on a set of ideal generators form a divided power structure. The source's maps γₙ:I→I, n≥1, are here maps A→A that vanish outside I, with δ₀=1 on I.

**Acceptance.**

- For a divided power structure γ on I, the construction applied to the candidate of γ with S=I returns γ.
- On A=F₂[ε]/(ε²) with I=(ε) and S={ε}, the candidate δ₀=1, δ₁=δ₃=id, δₙ=0 for n=2 and n≥4 fails the multiplication hypothesis at ε (δ₁(ε)δ₂(ε)=0, 3δ₃(ε)=ε), and it is not a divided power structure.

### sum-convolution — Convolution of two divided-power systems

**Definition:** `TauCeti.PD.convolution`. For γ on I and ε on J define Cₙ(x,y)=Σᵢ₊ⱼ₌ₙγᵢ(x)εⱼ(y). Its gluing interpretation uses x∈I and y∈J; outside these domains it is simply the displayed total function.

**Hypotheses and conventions.**

- A is a commutative ring with ideals I and J; γ is a divided power structure on I and ε a divided power structure on J.
- n≥0, and x,y∈A are arbitrary; γ and ε vanish outside their ideals in every degree.

**API.**

- `TauCeti.PD.convolution_eq` (data): C is the antidiagonal sum of the two systems.
- `TauCeti.PD.convolution_swap` (compatibility): Exchanging the two ideals and elements leaves C unchanged.
- `TauCeti.PD.convolution_mem` (structure): For n>0, Cₙ(x,y) lies in I+J when x∈I and y∈J.
- `TauCeti.PD.convolution_eq_coeff_exp_mul` (compatibility): For all x,y∈A and n≥0, Cₙ(x,y) is the n-th coefficient of the product of power series (DividedPowers.exp γ x)·(DividedPowers.exp ε y), where DividedPowers.exp γ x=Σₙγₙ(x)Tⁿ.

**Unit tests.**

- `TauCeti.PD.test_convolution_zero` (degenerate): C₀(0,0)=1.
- `TauCeti.PD.test_convolution_quadratic` (computation): For x∈I and y∈J: C₂(x,y)=γ₂(x)+xy+ε₂(y).
- `TauCeti.PD.test_convolution_same` (compatibility): For I=J, γ=ε and x,y∈I: Cₙ(x,y)=γₙ(x+y) for every n≥0.

**Uses.** Stacks Lemma 23.2.5, proof; CR.0/sum-independence, sum-candidate, sum-universal-property: is the value at x+y, for x∈I and y∈J, of the glued divided powers and of every divided power structure on I+J that restricts to γ and ε

**Construction or proof.**

1. Use the finite antidiagonal sum in A.
2. Record the quadratic mixed term x y explicitly; there is no binomial coefficient on it.

**Depends on:** `mathlib:DividedPowers`, `mathlib:DividedPowers.exp`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.2.5 (tag 07GQ), proof, second paragraph, the display defining ε_n. The node names the right-hand side of this display, Σγᵢ(x)δ_{n−i}(y), as a function of n≥0 and of an arbitrary pair (x,y); the source uses it only for x∈I, y∈J and n≥1.

**Acceptance.**

- For x∈I and y∈J: C₀(x,y)=1, C₁(x,y)=x+y and C₂(x,y)=γ₂(x)+xy+ε₂(y).
- Cₙ(x,y) is the coefficient of Tⁿ in the product of the power series Σγᵢ(x)Tⁱ and Σεⱼ(y)Tʲ.

### sum-independence — Convolution is independent of the decomposition

**Lemma:** `TauCeti.PD.convolution_independent`. If γₙ(w)=εₙ(w) for every n and w∈I∩J, then Cₙ(x,y)=Cₙ(x′,y′) whenever x,x′∈I, y,y′∈J and x+y=x′+y′.

**Hypotheses and conventions.**

- A is a commutative ring with ideals I and J; γ is a divided power structure on I and ε a divided power structure on J, with γₙ(w)=εₙ(w) for every n≥0 and every w∈I∩J.
- x,x′∈I and y,y′∈J satisfy x+y=x′+y′; n≥0.

**Uses.** Stacks Lemma 23.2.5, proof; CR.0/sum-candidate: makes the convolution a function of the element x+y alone, so that the operations on I+J are well defined

**Construction or proof.**

1. Set w=x−x′=y′−y; it lies in I∩J.
2. Write exp_γ(x) for the power series Σγᵢ(x)Tⁱ (DividedPowers.exp). By DividedPowers.exp_add on I, exp_γ(x)=exp_γ(x′)·exp_γ(w); by hypothesis exp_γ(w)=exp_ε(w); by DividedPowers.exp_add on J, exp_ε(w)·exp_ε(y)=exp_ε(y′). Hence exp_γ(x)·exp_ε(y)=exp_γ(x′)·exp_ε(y′), and comparing n-th coefficients gives Cₙ(x,y)=Cₙ(x′,y′). In finite sums this is the source's regrouping of Σγᵢ′(x′)γₗ(w)εⱼ(y).
3. This proves equality in A, without assuming I∩J=IJ.

**Depends on:** `CR.0/sum-convolution`, `mathlib:DividedPowers`, `mathlib:DividedPowers.exp`, `mathlib:DividedPowers.exp_add`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.2.5 (tag 07GQ), proof, second paragraph, the well-definedness computation. The node is the well-definedness computation of the proof, stated for all n≥0.

**Acceptance.**

- For I=J and γ=ε both sides equal γₙ(x+y).
- The hypothesis is needed: in ℤ/4 with I=J=(2), take γ the canonical divided powers (γ₂(2)=2) and ε the square-zero structure (ε₂(2)=0); then 2+0=0+2, but C₂(2,0)=2 and C₂(0,2)=0.

### sum-candidate — The candidate on the sum of compatible ideals

**Construction:** `TauCeti.PD.supCandidate`. Assume γ and ε agree on I∩J. Define an additive candidate on I+J by δₙ(z)=Cₙ(x,y) for any decomposition z=x+y with x∈I,y∈J, and zero outside I+J.

**Hypotheses and conventions.**

- A is a commutative ring with ideals I and J; γ is a divided power structure on I and ε a divided power structure on J, with γₙ(w)=εₙ(w) for every n≥0 and every w∈I∩J.

**API.**

- `TauCeti.PD.supCandidate_dpow_add` (simp): For x∈I, y∈J and every n≥0: δₙ(x+y)=Cₙ(x,y).
- `TauCeti.PD.supCandidate_left` (compatibility): For x∈I and every n≥0: δₙ(x)=γₙ(x).
- `TauCeti.PD.supCandidate_right` (compatibility): For y∈J and every n≥0: δₙ(y)=εₙ(y).

**Unit tests.**

- `TauCeti.PD.test_supCandidate_zero` (degenerate): δ₀(0)=1.
- `TauCeti.PD.test_supCandidate_mixed` (computation): For x∈I and y∈J: δ₂(x+y)=γ₂(x)+xy+ε₂(y).
- `TauCeti.PD.test_supCandidate_outside` (non-example): For x∉I+J: δ₀(x)=0.

**Uses.** Stacks Lemma 23.2.5, proof; CR.0/compatible-sum: is the candidate on I+J to which the generator criterion is applied with the generating set I∪J

**Construction or proof.**

1. Use membership in I+J to choose a decomposition; sum-independence removes the choice.
2. Membership and degrees zero/one follow termwise. For homogeneity choose ax,ay as the decomposition of az.
3. For addition choose (x+x′)+(y+y′), expand both factors and reindex the finite four-index sum; this gives the candidate addition law.

**Depends on:** `CR.0/additive-powers`, `CR.0/sum-convolution`, `CR.0/sum-independence`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.2.5 (tag 07GQ), proof, from "Hence, we have defined maps" to the verification of properties (1), (3) and (4). The node is the family of maps ε_n:I+J→I+J of the proof together with its properties (1), (3), (4), as an additive candidate. Beyond the source it sets δ₀=1 on I+J and the value 0 outside I+J.

**Acceptance.**

- For J=0 the candidate on I+0=I is the candidate of γ.
- For x∈I and y∈J: δ₂(x+y)=γ₂(x)+xy+ε₂(y), whatever decomposition of x+y is used.

### sum-restrictions — The sum candidate extends both structures

**Lemma:** `TauCeti.PD.supCandidate_restrict`. The sum candidate agrees with γ on I and with ε on J, in every degree.

**Hypotheses and conventions.**

- A is a commutative ring with ideals I and J; γ is a divided power structure on I and ε a divided power structure on J, with γₙ(w)=εₙ(w) for every n≥0 and every w∈I∩J.

**Uses.** Stacks Lemma 23.2.5, proof; CR.0/compatible-sum: transfers the multiplication and iteration identities of γ and ε to the generators I∪J, and shows that the glued structure restricts to γ and to ε

**Construction or proof.**

1. Choose x=x+0 or y=0+y and use the positive-degree vanishing at zero.
2. For degree zero use γ₀(0)=ε₀(0)=1.

**Depends on:** `CR.0/sum-candidate`, `CR.0/sum-convolution`, `mathlib:DividedPowers.dpow_eval_zero`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.2.5 (tag 07GQ), proof, the sentence after the well-definedness computation. The node is this sentence, for all n≥0 (the source has n≥1).

**Acceptance.**

- At 0 both restrictions give 1 in degree 0 and 0 in every positive degree.
- For w∈I∩J the two restrictions give γₙ(w) and εₙ(w), which are equal by hypothesis.

### compatible-sum — Divided powers on a compatible sum of ideals

**Construction:** `TauCeti.PD.sup`. For PD structures γ on I and ε on J that agree on I∩J, construct the unique PD structure on I+J restricting to both.

**Hypotheses and conventions.**

- A is a commutative ring with ideals I and J; γ is a divided power structure on I and ε a divided power structure on J, with γₙ(w)=εₙ(w) for every n≥0 and every w∈I∩J.

**API.**

- `TauCeti.PD.sup_dpow_add` (simp): For x∈I, y∈J and every n≥0, the glued operation at x+y is Cₙ(x,y).
- `TauCeti.PD.sup_left` (compatibility): The identity ring map from (A,I,γ) to the glued PD ring is a PD morphism.
- `TauCeti.PD.sup_right` (compatibility): The identity ring map from (A,J,ε) to the glued PD ring is a PD morphism.
- `TauCeti.PD.sup_isDPMorphism_iff` (universal-property): Let g:A→C be a ring map and κ a divided power structure on an ideal K of C. Then g is a PD morphism from I+J with the glued structure to (K,κ) if and only if g is a PD morphism from (I,γ) to (K,κ) and from (J,ε) to (K,κ).

**Unit tests.**

- `TauCeti.PD.test_sup_same` (compatibility): For J=I and ε=γ: the glued operation on I+I=I equals γₙ(x) for every n≥0 and every x∈A.
- `TauCeti.PD.test_sup_zero_ideal` (degenerate): For J=0 with the divided power structure dividedPowersBot A: the glued operation equals γₙ(x) for every n≥0 and every x∈I.
- `TauCeti.PD.test_sup_quadratic` (computation): For x∈I and y∈J: the glued operation in degree 2 at x+y is γ₂(x)+xy+ε₂(y).

**Uses.** Stacks Lemma 23.5.1, proof; CR.0/pd-polynomial, through product-intersection-gluing: glues the extension of γ to I·A⟨x⟩ with the divided powers on A⟨x⟩₊ into the divided power structure on I·A⟨x⟩+A⟨x⟩₊ Stacks Definition 60.4.1: the structure on J+IB required there, restricting to δ on J and making A→B a homomorphism of divided power rings, is the glued structure of δ and of the extension of γ to IB

**Construction or proof.**

1. Apply the generator criterion to the sum candidate and generating set I∪J.
2. Use sum-restrictions to transfer multiplication and iteration from γ or ε to each generator. For iteration, the inner positive divided power stays in the corresponding ideal.
3. Uniqueness: two divided power structures on I+J that restrict to γ on I and to ε on J agree on the generating set I∪J, so they are equal by DividedPowers.dpow_eq_from_gens.

**Depends on:** `CR.0/generator-criterion`, `CR.0/sum-candidate`, `CR.0/sum-restrictions`, `mathlib:DividedPowers.dpow_eq_from_gens`, `mathlib:DividedPowers.IsDPMorphism`, `mathlib:DividedPowers.IsDPMorphism.on_span`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.2.5 (tag 07GQ), statement, part (2). The node is part (2) of the lemma, with the explicit formula of its proof for the operation at x+y.

**Acceptance.**

- The case used in the proof of Stacks Lemma 23.5.1: on A⟨x⟩ the structures on I·A⟨x⟩ and on A⟨x⟩₊ glue to one on I·A⟨x⟩+A⟨x⟩₊.
- Gluing γ with itself returns γ, and gluing γ with the zero ideal returns γ.
- In ℤ/4 with I=J=(2), the canonical structure (γ₂(2)=2) and the square-zero structure (operation 0 in degree 2) do not agree on I∩J, and no divided power structure on (2) restricts to both.

### sum-universal-property — Existence and uniqueness of the glued divided powers

**Theorem:** `TauCeti.PD.sup_exists_unique_iff`. (1) Assume γ and ε agree on I∩J in every degree. A divided power structure θ on I+J satisfies θₙ=γₙ on I and θₙ=εₙ on J for all n if and only if θ is the glued structure of compatible-sum. (2) A divided power structure on I+J restricting to γ on I and to ε on J exists if and only if γₙ(w)=εₙ(w) for all n≥0 and all w∈I∩J; it is then unique.

**Hypotheses and conventions.**

- A is a commutative ring with ideals I and J; γ is a divided power structure on I and ε a divided power structure on J.
- In part (1), γₙ(w)=εₙ(w) for every n≥0 and every w∈I∩J; in part (2) no agreement is assumed.

**Uses.** Stacks Lemma 23.2.5, part (2); CR.0/product-intersection-gluing: gives the uniqueness of the glued structure and the exact condition for its existence

**Construction or proof.**

1. Necessity is equality of the two restrictions at every element of the intersection.
2. Sufficiency is compatible-sum. For uniqueness, the addition law evaluates θₙ(x+y) as Cₙ(x,y), which also computes the glued operation; use DividedPowers.ext.

**Depends on:** `CR.0/compatible-sum`, `CR.0/sum-convolution`, `mathlib:DividedPowers.ext`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.2.5 (tag 07GQ), statement, part (2), and last paragraph of the proof. The source states existence and uniqueness when γ and δ agree on I∩J. The converse in part (2) of the node, that existence forces agreement on I∩J, is not in the source; it holds because such a structure equals both γ and δ on I∩J.

**Acceptance.**

- If I=J, existence forces γ=ε.
- In ℤ/4 with I=J=(2): the canonical structure (γ₂(2)=2) and the square-zero structure (operation 0 in degree 2) are two divided power structures on (2), and no divided power structure on (2) restricts to both.

### product-intersection-gluing — Gluing when intersection equals product

**Lemma:** `TauCeti.PD.agree_on_inf_of_inf_eq_mul`. If I∩J=IJ, then every divided power structure γ on I and every divided power structure ε on J agree in every degree at every element of I∩J. Consequently the glued structure of compatible-sum on I+J is defined for every such pair, and it is the unique divided power structure on I+J restricting to γ on I and to ε on J.

**Hypotheses and conventions.**

- A is a commutative ring with ideals I and J such that I∩J=IJ; γ is a divided power structure on I and ε a divided power structure on J.

**Uses.** Stacks Lemma 23.5.1, proof; CR.0/pd-polynomial: since I·A⟨x⟩∩A⟨x⟩₊=I·A⟨x⟩·A⟨x⟩₊, the divided powers on the two ideals glue with no further compatibility to check

**Construction or proof.**

1. Rewrite I∩J as the ideal product IJ and apply DividedPowers.coincide_on_smul: two divided power structures agree at every element of the product of their ideals.
2. The glued structure and its uniqueness are compatible-sum and sum-universal-property applied to this agreement.

**Depends on:** `CR.0/sum-universal-property`, `mathlib:DividedPowers.coincide_on_smul`, `CR.0/compatible-sum`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.2.5 (tag 07GQ), statement, parts (1) and (2); combined in this way in the proof of Lemma 23.5.1 (tag 07H5). Part (1) gives agreement of any two structures on IJ; when I∩J=IJ, part (2) therefore applies to any two structures. The source makes this combination in the proof of Lemma 23.5.1, not as a separate statement.

**Acceptance.**

- In Γ_R(M) one has IΓ∩Γ_R(M)₊=IΓ·Γ_R(M)₊ (gamma-base-ideal-intersection), so any divided power structures on IΓ and on Γ_R(M)₊ agree on the intersection and glue.
- The hypothesis cannot be dropped: in ℤ/4 with I=J=(2), I∩J=(2) and IJ=0, and the canonical structure (γ₂(2)=2) and the square-zero structure (operation 0 in degree 2) differ at 2.

### extension-uniqueness — Uniqueness of extension to the generated ideal

**Lemma:** `TauCeti.PD.extension_unique`. Let f:A→B and let θ,θ′ be PD structures on IB=I.map(f). If f is a PD morphism from γ to both, then θ=θ′. No flatness or injectivity of f is needed.

**Hypotheses and conventions.**

- A and B are commutative rings, f:A→B a ring map, I⊂A an ideal and γ a divided power structure on I; IB=I.map(f) is the ideal of B generated by f(I).
- θ and θ′ are divided power structures on IB, and f is a PD morphism from (I,γ) to (IB,θ) and to (IB,θ′).

**Uses.** Stacks Lemma 23.4.2, first assertion; CR.0/principal-extension, flat-extension: gives the uniqueness clause of both extension constructions

**Construction or proof.**

1. Apply DividedPowers.le_equalizer_of_isDPMorphism with K=IB: every element of IB lies in the ideal on which θ and θ′ have equal operations.
2. By DividedPowers.mem_dpEqualizer_iff, θ and θ′ have the same operation at every element of IB in every degree; conclude θ=θ′ by DividedPowers.ext.

**Depends on:** `mathlib:DividedPowers.le_equalizer_of_isDPMorphism`, `mathlib:DividedPowers.mem_dpEqualizer_iff`, `mathlib:DividedPowers.ext`, `mathlib:DividedPowers.IsDPMorphism`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.4.2 (tag 07H1), statement, first assertion, and first paragraph of the proof. The node is this assertion; by Definition 23.4.1 'γ extends to B' means that there is a divided power structure on IB for which A→B is a homomorphism of divided power rings.

**Acceptance.**

- On ℤ/4 the ideal (2) carries two divided power structures, one with γ₂(2)=2 and the square-zero one with γ₂(2)=0; only the first makes ℤ₂→ℤ/4 a PD morphism from PadicInt.dividedPowers 2, because the image of γ₂(2)=2 is 2. So the uniqueness is of extensions of a fixed γ, not of divided power structures on IB.
- For f=id: a divided power structure θ on I with θₙ=γₙ on I for all n is γ.

### principal-independence — The principal extension formula is well defined

**Lemma:** `TauCeti.PD.principal_independent`. If I=(x), γ is a PD structure on I and f:A→B, then bⁿf(γₙ(x))=cⁿf(γₙ(x)) whenever bf(x)=cf(x), for all n≥0.

**Hypotheses and conventions.**

- A and B are commutative rings, f:A→B a ring map, x∈A, I=(x) and γ a divided power structure on I.
- b,c∈B with b·f(x)=c·f(x); n≥0.

**Uses.** Stacks Lemma 23.4.2, proof, principal case; CR.0/principal-extension: shows that bⁿ·f(γₙ(x)) depends only on the element b·f(x) of IB

**Construction or proof.**

1. At n=0 both expressions equal one. For n>0, γₙ(x) lies in (x); write γₙ(x)=a x.
2. The hypothesis says (b−c)f(x)=0. The polynomial bⁿ−cⁿ is divisible by b−c. Multiplying by f(a)f(x) proves the claimed equality.
3. This argument uses principal membership rather than division by n!, and applies even when f has a kernel.

**Depends on:** `mathlib:DividedPowers`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.4.2 (tag 07H1), proof, second paragraph, the well-definedness computation for I=(x). The node is this computation: bⁿ−(b′)ⁿ is a multiple of b−b′, and γₙ(x) is a multiple of x for n≥1. The node includes n=0, where both sides are 1.

**Acceptance.**

- A=ℤ₂ with PadicInt.dividedPowers 2, x=2, B=ℤ/4, b=1, c=3: b·2=c·2 in ℤ/4, and b²·γ₂(2)=2 and c²·γ₂(2)=18=2 in ℤ/4.
- For n=0 both sides are 1.

### principal-extension — Extension of divided powers on a principal ideal

**Construction:** `TauCeti.PD.extendPrincipal`. For I=(x) and any ring map f:A→B, construct γᴮ on IB by γᴮₙ(bf(x))=bⁿf(γₙ(x)), zero outside IB. It is the unique extension of γ; no flatness hypothesis is imposed.

**Hypotheses and conventions.**

- A and B are commutative rings and f:A→B is any ring map.
- x∈A, I=(x), and γ is a divided power structure on I; IB is the ideal of B generated by f(x).

**API.**

- `TauCeti.PD.extendPrincipal_dpow` (simp): For every b∈B and every n≥0: γᴮₙ(b·f(x))=bⁿ·f(γₙ(x)).
- `TauCeti.PD.extendPrincipal_isDPMorphism` (compatibility): f is a PD morphism from (I,γ) to (IB,γᴮ).
- `TauCeti.PD.extendPrincipal_generator_independent` (characterisation): If I=(x) and I=(y), the structures on IB constructed from the generator x and from the generator y are equal.

**Unit tests.**

- `TauCeti.PD.test_principal_identity` (compatibility): For B=A and f=id: γᴮₙ(z)=γₙ(z) for every z∈I and every n≥0.
- `TauCeti.PD.test_principal_zero` (degenerate): For I=0, x=0 and γ=dividedPowersBot A: γᴮₙ(0) equals the value at 0 of dividedPowersBot B in degree n, that is 1 for n=0 and 0 for n>0.
- `TauCeti.PD.test_principal_quadratic` (computation): For every b∈B: γᴮ₂(b·f(x))=b²·f(γ₂(x)).
- `TauCeti.PD.test_principal_p_two` (computation): For A=B=ℤ₂, f=id, x=2 and γ=PadicInt.dividedPowers 2: γᴮ₂(2)=2.

**Uses.** Stacks Example 23.2.3; CR.0/canonical-p-divided-powers: extends the divided powers of pℤ₍p₎ to pA for every ring A in which the integers prime to p are invertible, with no flatness assumption

**Construction or proof.**

1. Every element of IB is bf(x); use principal-independence to descend the displayed formula.
2. For addition expand (b+c)ⁿ and use the multiplication identity for γ at x. Degrees zero/one, ideal membership, scalar homogeneity and multiplication follow directly.
3. For iteration with n>0 write γₙ(x)=a x. Then γᴮₘ(γᴮₙ(bf(x)))=bⁿᵐ f(aᵐγₘ(x)); apply homogeneity and the source iteration identity to a x.
4. For any y∈I write y=a x to verify the PD-morphism condition for f. Uniqueness is extension-uniqueness.

**Depends on:** `CR.0/principal-independence`, `CR.0/extension-uniqueness`, `mathlib:DividedPowers`, `mathlib:PadicInt.dividedPowers`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.4.2 (tag 07H1), statement, condition (2), and proof, second paragraph. The node is case (2) of the lemma with the formula of its proof, and the uniqueness assertion of the lemma. The source calls axioms (1), (2), (3), (5) obvious; the node's proofSteps verify the iteration identity (5) explicitly.

**Acceptance.**

- Along ℤ₂→ℤ/4 with x=2 and γ=PadicInt.dividedPowers 2 the extension has γᴮ₂(2)=2, γᴮ₃(2)=0 and γᴮ₄(2)=2 in ℤ/4, a ring in which 2ⁿ/n! cannot be formed by division.
- Along the identity the extension is γ.

### extension-coefficient — The scalar-extension coefficient formula

**Definition:** `TauCeti.PD.extensionCoefficient`. For f:A→B, γ on I, a finite list x₁,…,xᵣ in A and coefficients bᵢ∈B, define Eₙ(b,x)=Σₑ₁₊⋯₊ₑᵣ₌ₙ ∏ᵢ bᵢᵉⁱ f(γₑⁱ(xᵢ)). It is a total finite formula. Its PD interpretation assumes every xᵢ∈I. For r=0 it is one at n=0 and zero otherwise.

**Hypotheses and conventions.**

- A and B are commutative rings, f:A→B a ring map, I⊂A an ideal and γ a divided power structure on I.
- r≥0, n≥0, x₁,…,xᵣ∈A and b₁,…,bᵣ∈B. The formula is defined for all xᵢ∈A; it computes divided powers only when every xᵢ lies in I.

**API.**

- `TauCeti.PD.extensionCoefficient_eq` (data): Eₙ is the multiset-indexed finite sum without multinomial coefficients.
- `TauCeti.PD.extensionCoefficient_one` (simp): For r=1, every b∈B, every x∈A and every n≥0: Eₙ(b,x)=bⁿ·f(γₙ(x)).
- `TauCeti.PD.extensionCoefficient_mem` (structure): For n>0 and xᵢ∈I the coefficient lies in IB.
- `TauCeti.PD.dpow_sum_mul_map_eq_extensionCoefficient` (characterisation): If θ is a divided power structure on IB and f is a PD morphism from (I,γ) to (IB,θ), then for all x₁,…,xᵣ∈I, all b₁,…,bᵣ∈B and all n≥0: θₙ(Σᵢbᵢ·f(xᵢ))=Eₙ(b,x).

**Unit tests.**

- `TauCeti.PD.test_coefficient_empty_zero` (degenerate): For r=0: E₀=1.
- `TauCeti.PD.test_coefficient_empty_positive` (degenerate): For r=0: E₁=0.
- `TauCeti.PD.test_coefficient_quadratic` (computation): For r=2, x₀,x₁∈I and b₀,b₁∈B: E₂(b,x)=b₀²·f(γ₂(x₀))+b₀b₁·f(x₀x₁)+b₁²·f(γ₂(x₁)).

**Uses.** Stacks Lemma 23.4.2, proof; CR.0/flat-candidate, flat-extension: is the formula that defines the extension on a finite expression Σbᵢf(xᵢ), and the value that every extension takes there

**Construction or proof.**

1. Represent multiindices of total weight n by multisets of cardinality n on Fin r; their multiplicities are the exponents.
2. Take the finite product in B and sum over these multisets. Each multiindex appears exactly once; there is no multinomial coefficient.

**Depends on:** `mathlib:DividedPowers`, `mathlib:DividedPowers.dpow_sum`, `mathlib:DividedPowers.IsDPMorphism`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.4.2 (tag 07H1), proof, flat case, first display. The node names the right-hand side of this display as a function of n, of b₁,…,bᵣ∈B and of arbitrary x₁,…,xᵣ∈A; the source uses it for xᵢ∈I, where it is the only possible value of an extension at Σbᵢxᵢ.

**Acceptance.**

- For r=1: Eₙ=bⁿ·f(γₙ(x)).
- For r=2, n=2 and x₀,x₁∈I: E₂=b₀²·f(γ₂(x₀))+b₀b₁·f(x₀x₁)+b₁²·f(γ₂(x₁)).
- For r=0: E₀=1 and Eₙ=0 for n>0.

### coefficient-substitution — Invariance under a finite scalar substitution

**Lemma:** `TauCeti.PD.extensionCoefficient_substitution`. Let aᵢⱼ∈A, cⱼ∈B and xᵢ∈I. Put bᵢ=Σⱼf(aᵢⱼ)cⱼ and yⱼ=Σᵢaᵢⱼxᵢ. Then Eₙ(b,x)=Eₙ(c,y) for every n, without a flatness assumption.

**Hypotheses and conventions.**

- A and B are commutative rings, f:A→B a ring map, I⊂A an ideal and γ a divided power structure on I.
- x₁,…,xᵣ∈I, aᵢⱼ∈A for 1≤i≤r and 1≤j≤s, c₁,…,cₛ∈B; bᵢ=Σⱼf(aᵢⱼ)cⱼ and yⱼ=Σᵢaᵢⱼxᵢ; n≥0.

**Uses.** Stacks Lemma 23.4.2, proof, flat case; CR.0/flat-presentation-independence: rewrites the formula of a presentation in terms of common elements cⱼ, the step by which two presentations of one element are compared

**Construction or proof.**

1. Expand γ_d(yⱼ) by DividedPowers.dpow_sum and homogeneity: γ_d(Σᵢaᵢⱼxᵢ) is the sum, over (m₁ⱼ,…,mᵣⱼ) of total d, of ∏ᵢaᵢⱼ^{mᵢⱼ}γ_{mᵢⱼ}(xᵢ). Expand each power bᵢ^e=(Σⱼf(aᵢⱼ)cⱼ)^e by the multinomial theorem (Finset.sum_pow_eq_sum_piAntidiag).
2. Both sides become sums over matrices m=(mᵢⱼ) of non-negative integers with total sum n. On the right, reduce ∏ⱼγ_{mᵢⱼ}(xᵢ) to multinomial(mᵢ₁,…,mᵢₛ)·γ_{eᵢ}(xᵢ), eᵢ=Σⱼmᵢⱼ, by DividedPowers.prod_dpow.
3. For every matrix m both sides have the coefficient ∏ᵢmultinomial(mᵢ₁,…,mᵢₛ) on ∏ᵢⱼ(f(aᵢⱼ)cⱼ)^{mᵢⱼ}·∏ᵢf(γ_{eᵢ}(xᵢ)): on the left from the multinomial theorem, on the right from prod_dpow. The two sums agree term by term.

**Depends on:** `CR.0/extension-coefficient`, `mathlib:DividedPowers`, `mathlib:DividedPowers.dpow_sum`, `mathlib:DividedPowers.prod_dpow`, `mathlib:Finset.sum_pow_eq_sum_piAntidiag`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.4.2 (tag 07H1), proof, flat case, the claim introduced by "Next suppose that". The node is the claimed equality. The source proves it by comparing universal coefficients in ℚ[x₁,…,xᵣ,c₁,…,cₛ,aᵢⱼ]; the node's proof compares the coefficients directly, as products of multinomial coefficients.

**Acceptance.**

- For r=1, s=2: (f(a₁)c₁+f(a₂)c₂)ⁿ·f(γₙ(x))=Σ_{d₁+d₂=n}c₁^{d₁}c₂^{d₂}·f(γ_{d₁}(a₁x)γ_{d₂}(a₂x)), which is the binomial theorem together with γ_{d₁}(x)γ_{d₂}(x)=choose(n,d₁)·γₙ(x).
- For r=2, s=1: Σ_{e₁+e₂=n}(f(a₁)c)^{e₁}(f(a₂)c)^{e₂}·f(γ_{e₁}(x₁)γ_{e₂}(x₂))=cⁿ·f(γₙ(a₁x₁+a₂x₂)), which is the addition law of γ.

### flat-presentation-independence — Independence of the expression over a flat algebra

**Lemma:** `TauCeti.PD.extensionCoefficient_independent`. For a flat A-algebra B and xᵢ,x′ⱼ∈I, equality Σbᵢxᵢ=Σb′ⱼx′ⱼ in B implies Eₙ(b,x)=Eₙ(b′,x′) for every n.

**Hypotheses and conventions.**

- A is a commutative ring, B a flat commutative A-algebra with structure map f:A→B, I⊂A an ideal and γ a divided power structure on I; IB is the ideal of B generated by f(I).
- x₁,…,xᵣ,x′₁,…,x′ₛ∈I and b₁,…,bᵣ,b′₁,…,b′ₛ∈B with Σᵢbᵢf(xᵢ)=Σⱼb′ⱼf(x′ⱼ) in B; n≥0.

**Uses.** Stacks Lemma 23.4.2, proof, flat case; CR.0/flat-candidate: makes Eₙ(b,x) a function of the element Σbᵢf(xᵢ) of IB alone

**Construction or proof.**

1. Apply the equational criterion of flatness (Module.Flat.isTrivialRelation_of_sum_smul_eq_zero) to the combined relation with coefficients xᵢ and −x′ⱼ, and module elements bᵢ and b′ⱼ. It expresses both coefficient families in common elements cₖ with matrices aᵢₖ,a′ⱼₖ.
2. For each k the relation gives Σaᵢₖxᵢ=Σa′ⱼₖx′ⱼ inside A. These common elements lie in I.
3. Apply coefficient-substitution to both sides. They become the same coefficient formula on the common list.

**Depends on:** `CR.0/coefficient-substitution`, `mathlib:Module.Flat.isTrivialRelation_of_sum_smul_eq_zero`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.4.2 (tag 07H1), proof, flat case, footnote. The node follows the footnote: the equational criterion of flatness, applied to the relation Σxᵢbᵢ−Σx′ᵢ′b′ᵢ′=0, gives the common elements cⱼ and the matrices. The main text of the proof uses Lazard's theorem instead.

**Acceptance.**

- Flatness cannot be dropped: for A=F₂⟨t⟩ with I=A₊ and its divided powers (γ₂(t)=t^[2]) and B=A/(t), the element t maps to 0 but t^[2] does not, because the ideal (t) is spanned by the t^[m] with m odd; so E₂(1;t)≠0=E₂ of the empty presentation of 0.
- For B=A and f=id both sides are γₙ(Σbᵢxᵢ), by the addition and homogeneity laws of γ.

### flat-candidate — The additive candidate on a flat extension

**Construction:** `TauCeti.PD.flatCandidate`. For B flat over A, define the candidate on IB by δₙ(z)=Eₙ(b,x) for any finite presentation z=Σbᵢ·f(xᵢ) with xᵢ∈I and bᵢ∈B; set it to zero outside IB.

**Hypotheses and conventions.**

- A is a commutative ring, B a flat commutative A-algebra with structure map f:A→B, I⊂A an ideal and γ a divided power structure on I; IB is the ideal of B generated by f(I).

**API.**

- `TauCeti.PD.flatCandidate_formula` (data): For x₁,…,xᵣ∈I, b₁,…,bᵣ∈B and n≥0: δₙ(Σᵢbᵢ·f(xᵢ))=Eₙ(b,x).
- `TauCeti.PD.flatCandidate_base` (compatibility): For x∈I and every n≥0: δₙ(f(x))=f(γₙ(x)).
- `TauCeti.PD.flatCandidate_outside` (simp): For z∉IB and every n≥0: δₙ(z)=0.

**Unit tests.**

- `TauCeti.PD.test_flatCandidate_zero` (degenerate): δ₀(0)=1.
- `TauCeti.PD.test_flatCandidate_scalar` (computation): For b∈B, x∈I and n≥0: δₙ(b·f(x))=bⁿ·f(γₙ(x)).
- `TauCeti.PD.test_flatCandidate_quadratic` (computation): For x,y∈I: δ₂(f(x)+f(y))=f(γ₂(x)+xy+γ₂(y)).

**Uses.** Stacks Lemma 23.4.2, proof, flat case; CR.0/flat-extension: is the candidate on IB to which the generator criterion is applied with the generating set f(I)

**Construction or proof.**

1. Membership in the generated ideal supplies a finite presentation. Flat-presentation-independence proves choice independence.
2. At n=0, every γ₀(xᵢ)=1 so the sole zero-weight multiindex gives one. At n=1 the coefficient is z; positive coefficients lie in IB.
3. Concatenate two presentations to prove addition: splitting a multiset between the two disjoint finite index sets gives the antidiagonal sum. For homogeneity multiply each bᵢ by a; total weight n gives the factor aⁿ.

**Depends on:** `CR.0/additive-powers`, `CR.0/extension-coefficient`, `CR.0/flat-presentation-independence`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.4.2 (tag 07H1), proof, flat case, last paragraph. The node is the well-defined map γ̄ₙ on IB of the proof with its properties (1), (3), (4), as an additive candidate. Beyond the source it sets δ₀=1 on IB and the value 0 outside IB.

**Acceptance.**

- For B=A and f=id the candidate is the candidate of γ.
- For b,c∈B and x,y∈I: δ₂(b·f(x)+c·f(y))=b²·f(γ₂(x))+bc·f(xy)+c²·f(γ₂(y)).

### flat-candidate-base — The flat candidate preserves the base operations

**Lemma:** `TauCeti.PD.flatCandidate_base`. For x∈I and every n, the flat candidate has δₙ(f(x))=f(γₙ(x)). In particular multiplication and iteration hold on the generating subset f(I) of IB.

**Hypotheses and conventions.**

- A is a commutative ring, B a flat commutative A-algebra with structure map f:A→B, I⊂A an ideal and γ a divided power structure on I; IB is the ideal of B generated by f(I).
- x∈I and n≥0.

**Uses.** Stacks Lemma 23.4.2, proof, flat case; CR.0/flat-extension, flat-extension-map: gives the multiplication and iteration identities on the generators f(I), and the PD-morphism property of A→B

**Construction or proof.**

1. Use the singleton presentation f(x)=1·f(x) in the flat-candidate formula.
2. For multiplication apply f to the corresponding γ identity. For iteration with positive inner degree, γₙ(x) is again in I so apply the formula twice.

**Depends on:** `CR.0/flat-candidate`, `CR.0/extension-coefficient`, `mathlib:DividedPowers`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.4.2 (tag 07H1), proof, flat case, last paragraph. The node is this sentence, together with the consequence the source draws from it in the next sentence: axioms (2) and (5) hold on the generators f(I) of IB.

**Acceptance.**

- δₙ(f(0)) is 1 for n=0 and 0 for n>0.
- For x∈I: δ₂(f(x))·δ₁(f(x))=3·δ₃(f(x)), the image of γ₂(x)γ₁(x)=3γ₃(x).

### flat-extension — Flat extension of divided powers

**Construction:** `TauCeti.PD.extendFlat`. If B is a flat A-algebra, construct the unique PD structure γᴮ on IB for which A→B is a PD morphism. Its operation on a finite expression Σᵢbᵢ·f(xᵢ) with xᵢ∈I and bᵢ∈B is Eₙ(b,x).

**Hypotheses and conventions.**

- A is a commutative ring, B a flat commutative A-algebra with structure map f:A→B, I⊂A an ideal and γ a divided power structure on I; IB is the ideal of B generated by f(I).

**API.**

- `TauCeti.PD.extendFlat_formula` (data): For x₁,…,xᵣ∈I, b₁,…,bᵣ∈B and n≥0: γᴮₙ(Σᵢbᵢ·f(xᵢ))=Eₙ(b,x).
- `TauCeti.PD.extendFlat_isDPMorphism` (compatibility): f is a PD morphism from (I,γ) to (IB,γᴮ).
- `TauCeti.PD.extendFlat_unique` (characterisation): If θ is a divided power structure on IB and f is a PD morphism from (I,γ) to (IB,θ), then θ=γᴮ.
- `TauCeti.PD.extendFlat_isDPMorphism_iff` (universal-property): Let g:B→C be a ring map and κ a divided power structure on an ideal K of C. Then g is a PD morphism from (IB,γᴮ) to (K,κ) if and only if g∘f is a PD morphism from (I,γ) to (K,κ).
- `TauCeti.PD.extendFlat_trans` (functoriality): Let B be a flat A-algebra and C a flat B-algebra. Then C is a flat A-algebra, (IB)C=IC, and the extension of γᴮ along B→C is equal to the extension of γ along A→C.
- `TauCeti.PD.extendFlat_eq_ofRingEquiv` (compatibility): If the structure map f:A→B is bijective, with associated ring isomorphism e, then γᴮ is DividedPowers.ofRingEquiv applied to γ along e: γᴮₙ(e(x))=e(γₙ(x)) for all x∈A and all n≥0.

**Unit tests.**

- `TauCeti.PD.test_flat_identity` (compatibility): For B=A and f=id: γᴮₙ(x)=γₙ(x) for every n≥0 and every x∈A.
- `TauCeti.PD.test_flat_principal` (compatibility): If I=(x), then γᴮ is equal to the principal extension of γ along f constructed from the generator x.
- `TauCeti.PD.test_flat_quadratic` (computation): For b,c∈B and x,y∈I: γᴮ₂(b·f(x)+c·f(y))=b²·f(γ₂(x))+bc·f(xy)+c²·f(γ₂(y)).
- `TauCeti.PD.test_flat_equiv` (compatibility): For a ring isomorphism e:A→B, taken as the structure map of the flat A-algebra B: γᴮₙ(e(x))=e(γₙ(x)) for every x∈A and every n≥0; for x∉I both sides are 0.

**Uses.** Stacks Lemma 23.5.1, proof; CR.0/pd-polynomial: extends γ to I·A⟨x⟩ along the flat map A→A⟨x⟩ Stacks Section 60.2, paragraph before Lemma 60.2.4, and Lemma 60.2.6, proof; CR.0/envelope-base-change: extends γ to IP for a polynomial A-algebra P, and extends the divided powers of an envelope D along the flat map D→D⊗_B P CR.0/localization-formula: gives the divided powers on S⁻¹A, which is flat over A

**Construction or proof.**

1. The image of I generates IB. Apply the generator criterion to the flat candidate using this generating set.
2. Flat-candidate-base transfers the multiplication and iteration identities on generators from γ.
3. Apply extension-uniqueness to identify all possible extensions.

**Depends on:** `CR.0/generator-criterion`, `CR.0/flat-candidate`, `CR.0/flat-candidate-base`, `CR.0/extension-uniqueness`, `mathlib:DividedPowers.IsDPMorphism`, `mathlib:DividedPowers.IsDPMorphism.of_comp`, `mathlib:DividedPowers.ofRingEquiv`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.4.2 (tag 07H1), statement, condition (3), and proof, flat case. The node is case (3) of the lemma together with its uniqueness assertion; the formula Eₙ(b,x) is the first display of the flat case of the proof.

**Acceptance.**

- For A=ℤ_p, I=(p) with PadicInt.dividedPowers p and B=ℤ_p[T]: γᴮₙ(p·g)=(pⁿ/n!)·gⁿ for every g∈ℤ_p[T].
- Along a ring isomorphism the extension is Mathlib's DividedPowers.ofRingEquiv.
- When I is principal the extension equals the principal extension.

### flat-extension-map — The base map preserves flatly extended divided powers

**Lemma:** `TauCeti.PD.extendFlat_isDPMorphism`. The algebra map A→B is a PD morphism from (I,γ) to (IB,γᴮ). Consequently it evaluates γᴮₙ on every base image in all degrees.

**Hypotheses and conventions.**

- A is a commutative ring, B a flat commutative A-algebra with structure map f:A→B, I⊂A an ideal and γ a divided power structure on I; IB is the ideal of B generated by f(I).

**Uses.** CR.0/localization-formula: evaluates the extended divided powers on the image of I, the step that gives γₙ(x/s)=γₙ(x)/sⁿ

**Construction or proof.**

1. The extended ideal condition is equality by definition.
2. Use flat-candidate-base and the unchanged-operation API of the generator criterion.

**Depends on:** `CR.0/flat-extension`, `CR.0/flat-candidate-base`, `CR.0/generator-criterion`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Definition 23.4.1 (tag 07H0), applied to the extension of Lemma 23.4.2 (tag 07H1), condition (3). By Definition 23.4.1, 'γ extends to B' means that A→B is a homomorphism of divided power rings for the structure on IB; the node states this for the flat extension.

**Acceptance.**

- For x∈I and every n: γᴮₙ(f(x))=f(γₙ(x)); in particular γᴮ₀(f(x))=1.
- For B=A and f=id the statement is that the identity is a PD morphism of (I,γ).

### localization-formula — Divided powers after localization

**Theorem:** `TauCeti.PD.localization_dpow`. Let S⊂A be multiplicative, B=S⁻¹A and γ on I. The unique extension to IB exists by flatness, and γᴮₙ(x/s)=γₙ(x)/sⁿ for x∈I, s∈S, n≥0.

**Hypotheses and conventions.**

- A is a commutative ring, S⊂A a multiplicative subset, B a localization of A at S, I⊂A an ideal and γ a divided power structure on I.
- x∈I, s∈S and n≥0.

**Uses.** CR.0/envelope-localization: gives the divided powers of a localized envelope by the formula for x/s CR.1/pd-scheme: the divided powers on the localizations of an affine PD ring are given by this formula, so they are compatible with restriction and define operations on a quasi-coherent ideal

**Construction or proof.**

1. B is flat over A by IsLocalization.flat, so flat-extension applies.
2. Write x/s=(1/s)f(x). Apply scalar homogeneity and flat-extension-map.
3. The displayed denominator is sⁿ, including denominator one in degree zero.

**Depends on:** `CR.0/flat-extension`, `CR.0/flat-extension-map`, `mathlib:IsLocalization.flat`, `mathlib:DividedPowers`, `mathlib:IsLocalization.mk'`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.4.2 (tag 07H1), statement, condition (3). The source gives the extension along a flat ring map, here A→S⁻¹A. The formula γₙ(x/s)=γₙ(x)/sⁿ is not stated in the source; it follows from homogeneity and from A→S⁻¹A being a homomorphism of divided power rings.

**Acceptance.**

- For n=0, x=0 and s=1 both sides are 1.
- For A=ℤ₂ with PadicInt.dividedPowers 2 on I=(2) and S the powers of 2: B=ℚ₂, IB is the unit ideal, and γᴮₙ(x/2ᵏ)=γₙ(x)/2^{kn}=(x/2ᵏ)ⁿ/n!, the only divided power structure on an ideal of a ℚ-algebra.
- When I is principal, γᴮ is the principal extension of γ along A→S⁻¹A.

### gamma-augmentation — Augmentation of the divided power algebra

**Construction:** `TauCeti.Crystalline.Augmentation.augmentation`. Construct the R-algebra homomorphism ε:Γ_R(M)→R taking dp(0,m) to 1 and every dp(n,m) with n>0 to 0. It is the existing lift into the canonical zero PD ideal of R along the zero linear map M→R.

**Hypotheses and conventions.**

- R is a commutative ring; M is an R-module. No freeness, finite generation, characteristic, factorial invertibility or nilpotence hypothesis is imposed.

**API.**

- `TauCeti.Crystalline.Augmentation.augmentation_eq_lift` (compatibility): ε equals DividedPowerAlgebra.lift of dividedPowersBot R along the zero linear map M→R.
- `TauCeti.Crystalline.Augmentation.augmentation_dp` (simp): ε(dp(n,m)) is 1 when n=0 and 0 otherwise.
- `TauCeti.Crystalline.Augmentation.augmentation_scalar` (simp): ε(algebraMap(r))=r for all r∈R.
- `TauCeti.Crystalline.Augmentation.augmentation_natural` (functoriality): For every R-linear f:M→N, ε_N∘Γ(f)=ε_M.
- `TauCeti.Crystalline.Augmentation.augmentation_unique` (extensionality): An R-algebra homomorphism Γ_R(M)→R killing every dp(n,m) with n>0 equals ε.
- `TauCeti.Crystalline.Augmentation.augmentation_map` (functoriality): For an R-algebra S, an S-module N whose R-module structure is the restriction of its S-module structure, and an R-linear map f:M→N: ε_S(DividedPowerAlgebra.map S f (z))=algebraMap R S (ε_R(z)) for all z∈Γ_R(M), where ε_R and ε_S are the augmentations of Γ_R(M) and Γ_S(N). For S=R this is augmentation_natural.

**Unit tests.**

- `TauCeti.Crystalline.augmentation_test_positive_with_scalar` (computation): For every m, ε(3+dp(2,m))=3, including characteristic two and torsion modules.
- `TauCeti.Crystalline.augmentation_test_degree_one` (computation): For every m∈M: ε(dp(1,m))=0; that is, ε∘embed=0, where embed:M→Γ_R(M) is m↦dp(1,m).
- `TauCeti.Crystalline.augmentation_test_not_evaluation` (non-example): For R=M=ℚ: the R-algebra map DividedPowerAlgebra.lift of DividedPowers.RatAlgebra.dividedPowers on the unit ideal of ℚ along the identity ℚ→ℚ sends dp(2,1) to 1/2, whereas ε(dp(2,1))=0; so ε is not this map.

**Uses.** Stacks Section 23.5, opening paragraph; CR.0/gamma-augmentation-ideal: its kernel is the ideal Γ_R(M)₊ that carries the canonical divided powers CR.0/gamma-remainder-positive-span, gamma-base-ideal-remainder: subtracting algebraMap(ε(z)) from z separates the scalar part of an element from its part in Γ_R(M)₊

**Construction or proof.**

1. Use dividedPowersBot R, the zero R-linear map M→R and its range containment in the zero ideal as the inputs of DividedPowerAlgebra.lift.
2. Use lift_apply_dp, the degree-zero PD axiom and dpow_eval_zero in positive degree to calculate ε on every generator.
3. The algebra-homomorphism structure gives ε(algebraMap(r))=r. For naturality and uniqueness use algHom_ext on all dp(n,m), splitting n=0 from n>0.

**Depends on:** `mathlib:dividedPowersBot`, `mathlib:DividedPowerAlgebra.lift`, `mathlib:DividedPowerAlgebra.lift_apply_dp`, `mathlib:DividedPowers.dpow_eval_zero`, `mathlib:DividedPowerAlgebra.algHom_ext`, `mathlib:DividedPowerAlgebra.dp_zero`, `mathlib:DividedPowerAlgebra.map_apply_dp`, `mathlib:DividedPowerAlgebra.map`, `mathlib:DividedPowers.RatAlgebra.dividedPowers`, `mathlib:DividedPowerAlgebra`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Section 23.5 (tag 07H4), opening paragraph, before Lemma 23.5.1. The source defines this map for the free divided power polynomial algebra A⟨x₁,…,x_t⟩. The node defines it for Γ_R(M) of an arbitrary module, by the weak universal property of Γ_R(M); nothing about a monomial basis is taken from the source.

**Acceptance.**

- ε(dp(0,m))=1 for every m, including m=0, and ε(dp(n,m))=0 for every n>0.
- ε(3+dp(2,m))=3.
- ε(algebraMap(r))=r for every r∈R, so ε is surjective.

### gamma-augmentation-ideal — Augmentation ideal

**Definition:** `TauCeti.Crystalline.Augmentation.augmentationIdeal`. Define Γ_R(M)_+ as the existing ring-homomorphism kernel ker(ε), an ideal of the existing algebra Γ_R(M). Membership means ε(z)=0. In positive degree dp(n,m) belongs to this ideal, and a scalar belongs exactly when it is zero.

**Hypotheses and conventions.**

- R is a commutative ring; M is an R-module. No freeness, finite generation, characteristic, factorial invertibility or nilpotence hypothesis is imposed.

**API.**

- `TauCeti.Crystalline.Augmentation.augmentationIdeal_eq_ker` (compatibility): Γ_R(M)_+=RingHom.ker(ε).
- `TauCeti.Crystalline.Augmentation.mem_augmentationIdeal` (characterisation): z∈Γ_R(M)_+ if and only if ε(z)=0.
- `TauCeti.Crystalline.Augmentation.dp_mem_augmentationIdeal` (characterisation): For n≠0, dp(n,m)∈Γ_R(M)_+.
- `TauCeti.Crystalline.Augmentation.scalar_mem_augmentationIdeal` (characterisation): algebraMap(r)∈Γ_R(M)_+ if and only if r=0.
- `TauCeti.Crystalline.Augmentation.map_mem_augmentationIdeal` (functoriality): For an R-algebra S, an S-module N whose R-module structure is the restriction of its S-module structure, and an R-linear map f:M→N: DividedPowerAlgebra.map S f carries Γ_R(M)₊ into Γ_S(N)₊. In particular Γ(f)(Γ_R(M)₊)⊂Γ_R(N)₊ for every R-linear f:M→N.

**Unit tests.**

- `TauCeti.Crystalline.augmentationIdeal_test_positive` (computation): dp(2,m) belongs to Γ_R(M)_+ for every m.
- `TauCeti.Crystalline.augmentationIdeal_test_unit` (non-example): 1 does not belong to Γ_Z(Z)_+.
- `TauCeti.Crystalline.augmentationIdeal_test_degree_one_insufficient` (non-example): For R=M=F₂: dp(2,1) belongs to Γ_R(M)₊, and dp(2,1) does not belong to the ideal generated by the elements dp(1,m), m∈M.

**Uses.** Stacks Lemma 23.5.1: Names the ideal receiving the canonical divided powers before gluing with the extended base PD ideal. CrystallineCohomology:CR.0/gamma-augmentation-ideal-generators: Translates the source’s all-positive-divided-degrees generators into an exact ideal equality.

**Construction or proof.**

1. Apply RingHom.ker to ε; use RingHom.mem_ker for membership.
2. The generator and scalar assertions follow by the computed values of ε. Properness over a nonzero ring follows because ε(1)=1.

**Depends on:** `CR.0/gamma-augmentation`, `mathlib:RingHom.ker`, `mathlib:RingHom.mem_ker`, `mathlib:DividedPowerAlgebra.map`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Section 23.5 (tag 07H4), opening paragraph, before Lemma 23.5.1. The source names the kernel of the augmentation of A⟨x₁,…,x_t⟩; the node makes the same definition for Γ_R(M) of an arbitrary module.

**Acceptance.**

- For R=M=Z, neither 1 nor any dp(0,m) belongs. Every positive divided-power generator does belong.

### gamma-remainder-positive-span — Positive-degree remainder

**Lemma:** `TauCeti.Crystalline.Augmentation.remainder_mem_positive_span`. For every z∈Γ_R(M), z−algebraMap(ε(z)) belongs to the ideal H generated by all dp(n,m) with n>0 and m∈M.

**Hypotheses and conventions.**

- R is a commutative ring; M is an R-module. No freeness, finite generation, characteristic, factorial invertibility or nilpotence hypothesis is imposed.

**Construction or proof.**

1. Apply DividedPowerAlgebra.induction_on to the predicate 'z−algebraMap(ε(z)) lies in H'.
2. For a scalar the remainder is zero. For a sum it is the sum of the two remainders.
3. For z·dp(0,m), dp_zero reduces to the induction hypothesis. For z·dp(n,m) with n>0, the augmentation is zero and dp(n,m) is one of H’s generators, so ideal closure under multiplication proves membership.

**Depends on:** `CR.0/gamma-augmentation`, `mathlib:DividedPowerAlgebra.induction_on`, `mathlib:DividedPowerAlgebra.dp_zero`, `mathlib:Ideal.subset_span`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.5.1 (tag 07H5), proof, second paragraph. The source asserts, for one divided power variable, that the kernel of the augmentation is the ideal generated by the x^[n], n≥1. The node is the step that proves this for Γ_R(M): every element differs from its scalar part by an element of the ideal generated by the dp(n,m) with n>0.

**Acceptance.**

- For z=3+dp(2,m)·dp(1,m′): ε(z)=3 and z−3=dp(2,m)·dp(1,m′) is a multiple of the generator dp(2,m).
- For a scalar z=algebraMap(r) the remainder is 0.

### gamma-augmentation-ideal-generators — Positive-degree generators of the augmentation ideal

**Lemma:** `TauCeti.Crystalline.Augmentation.augmentationIdeal_eq_span`. Γ_R(M)_+ is exactly the ideal generated by {dp(n,m) | n>0, m∈M}. The degree-zero generators are excluded.

**Hypotheses and conventions.**

- R is a commutative ring; M is an R-module. No freeness, finite generation, characteristic, factorial invertibility or nilpotence hypothesis is imposed.

**Construction or proof.**

1. Every listed generator has augmentation zero; Ideal.span_le gives H⊆ker(ε).
2. If ε(z)=0, the positive-degree remainder lemma gives z−algebraMap(0)=z∈H, proving the reverse inclusion.

**Depends on:** `CR.0/gamma-augmentation-ideal`, `CR.0/gamma-remainder-positive-span`, `mathlib:Ideal.span_le`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.5.1 (tag 07H5), proof, second paragraph. The source describes A⟨x⟩₊ as the ideal generated by x, x^[2], x^[3], …, without proof; the node proves the same description of Γ_R(M)₊ for an arbitrary module.

**Acceptance.**

- For R=M=ℤ the ideal is proper: the element 1=dp(0,m) is not in it.
- The degree-one elements dp(1,m) do not suffice as generators: in Γ_{F₂}(F₂), dp(2,1) is not in the ideal they generate (gamma-degree-one-insufficient).

### gamma-augmentation-splitting — Scalar and augmentation splitting

**Construction:** `TauCeti.Crystalline.Augmentation.augmentationSplitting`. Construct an R-linear equivalence Γ_R(M)≃R×Γ_R(M)_+ by z↦(ε(z),z−algebraMap(ε(z))). Its inverse is (r,u)↦algebraMap(r)+u. The second coordinate uses the kernel-membership proof; multiplication on the two summands has cross terms.

**Hypotheses and conventions.**

- R is a commutative ring; M is an R-module. No freeness, finite generation, characteristic, factorial invertibility or nilpotence hypothesis is imposed.

**API.**

- `TauCeti.Crystalline.Augmentation.augmentationSplitting_fst` (simp): The first coordinate of the image of z is ε(z).
- `TauCeti.Crystalline.Augmentation.augmentationSplitting_snd` (simp): The underlying algebra element of the second coordinate is z−algebraMap(ε(z)).
- `TauCeti.Crystalline.Augmentation.augmentationSplitting_symm` (simp): The inverse sends (r,u) to algebraMap(r)+u.

**Unit tests.**

- `TauCeti.Crystalline.augmentationSplitting_test_scalar` (compatibility): Every scalar r maps to (r,0).
- `TauCeti.Crystalline.augmentationSplitting_test_ideal` (compatibility): Every u∈Γ_R(M)_+ maps to (0,u).
- `TauCeti.Crystalline.augmentationSplitting_test_addition` (computation): For r∈R and u∈Γ_R(M)₊: algebraMap(r)+u maps to (r,u).

**Uses.** Stacks Section 23.5, opening paragraph: the source's A⟨x₁,…,x_t⟩ is by definition the direct sum of A·1 and of the span of the other divided monomials, which is the kernel of the augmentation; the node records the corresponding decomposition of Γ_R(M), where no monomial basis is available

**Construction or proof.**

1. Augment the remainder: ε(z)−ε(algebraMap(ε(z)))=0; this gives the subtype membership proof.
2. Both coordinate functions and the proposed inverse are R-linear by the algebra maps and submodule structure.
3. Substitute each composite. Cancellation gives z in one direction; ε(u)=0 gives (r,u) in the other. Package the linear maps with LinearEquiv.ofLinearMap.

**Depends on:** `CR.0/gamma-augmentation`, `CR.0/gamma-augmentation-ideal`, `mathlib:LinearEquiv.ofLinearMap`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Section 23.5 (tag 07H4), opening paragraph, before Lemma 23.5.1. Not stated in the source: the source defines the augmentation of A⟨x₁,…,x_t⟩ and its kernel. The splitting into scalars and kernel is the general fact about an algebra with an augmentation, written here for Γ_R(M).

**Acceptance.**

- A scalar r maps to (r,0), and an element u of Γ_R(M)₊ maps to (0,u).
- 3+dp(2,m) maps to (3,dp(2,m)).

### gamma-base-ideal-remainder — Remainder of an extended base ideal

**Lemma:** `TauCeti.Crystalline.Augmentation.baseIdeal_remainder`. For every ideal I⊂R, put IΓ=I.map(algebraMap R Γ_R(M)). If z∈IΓ, then z−algebraMap(ε(z))∈IΓ·Γ_R(M)_+.

**Hypotheses and conventions.**

- R is a commutative ring; M is an R-module. No freeness, finite generation, characteristic, factorial invertibility or nilpotence hypothesis is imposed.

**Construction or proof.**

1. The definition of Ideal.map and the finite-span criterion express z as a finite sum Σ_j b_j·algebraMap(a_j), where a_j∈I and b_j∈Γ_R(M). No injectivity, flatness or basis is used.
2. The augmentation is Σ_j ε(b_j)a_j. Subtract its scalar image and distribute to obtain Σ_j (b_j−algebraMap(ε(b_j)))·algebraMap(a_j).
3. Each first factor lies in Γ_R(M)_+ by the augmentation calculation, and each second factor lies in IΓ. Ideal product membership and finite-sum closure give the result.

**Depends on:** `CR.0/gamma-augmentation`, `CR.0/gamma-augmentation-ideal`, `mathlib:Ideal.map`, `mathlib:Ideal.mem_map_of_mem`, `mathlib:Finsupp.mem_ideal_span_range_iff_exists_finsupp`, `mathlib:Ideal.mul_mem_mul`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.5.1 (tag 07H5), proof, second paragraph, displayed equality. The source asserts this equality for A⟨x⟩ without proof. The node is the step that proves the inclusion of the intersection in the product for Γ_R(M): an element of IΓ differs from its scalar part by an element of IΓ·Γ_R(M)₊.

**Acceptance.**

- For I=0: z=0 and the remainder 0 lies in the zero ideal.
- For R=M=ℤ, I=(2) and z=2·(1+dp(1,1)): ε(z)=2 and z−2=2·dp(1,1) lies in IΓ·Γ_R(M)₊.

### gamma-base-ideal-intersection — Base ideal and augmentation intersection

**Lemma:** `TauCeti.Crystalline.Augmentation.baseIdeal_inf_augmentation`. For every ideal I⊂R, IΓ∩Γ_R(M)_+=IΓ·Γ_R(M)_+. This is an equality of ideals in Γ_R(M), without a flatness or freeness assumption.

**Hypotheses and conventions.**

- R is a commutative ring; M is an R-module. No freeness, finite generation, characteristic, factorial invertibility or nilpotence hypothesis is imposed.

**Construction or proof.**

1. The ideal product is contained in the intersection by Ideal.mul_le_inf.
2. For z in the intersection, ε(z)=0. The preceding base-ideal remainder statement reduces to z∈IΓ·Γ_R(M)_+, proving the reverse inclusion.

**Depends on:** `CR.0/gamma-augmentation-ideal`, `CR.0/gamma-base-ideal-remainder`, `mathlib:Ideal.mul_le_inf`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.5.1 (tag 07H5), proof, second paragraph, displayed equality. The node is the displayed equality of the proof, for Γ_R(M) of an arbitrary module and an arbitrary ideal I of R; the source states it for A⟨x⟩ without proof.

**Acceptance.**

- For I=0 both sides are 0; for I=R both sides are Γ_R(M)₊.
- For R=M=ℤ and I=(2), the element 2·dp(1,1) lies in both sides.

### gamma-degree-two-detector — A degree-two detector in characteristic two

**Lemma:** `TauCeti.Crystalline.Augmentation.exists_degreeTwo_detector`. Let B=TrivSqZeroExt(F₂,F₂) and write inr(a)=(0,a). There exists an F₂-algebra homomorphism f:Γ_F₂(F₂)→B with f(dp(0,a))=1, f(dp(2,a))=inr(a), and f(dp(n,a))=0 for every n other than 0 and 2.

**Hypotheses and conventions.**

- The base ring and module are both F₂=ZMod 2. The target is the existing trivial square-zero extension TrivSqZeroExt(F₂,F₂).

**Uses.** CR.0/gamma-degree-one-insufficient: the map vanishes on the ideal generated by the degree-one elements and not on dp(2,1)

**Construction or proof.**

1. Use DividedPowerAlgebra.lift′ for the displayed total generator family; this is an ordinary algebra homomorphism, not a PD morphism.
2. The degree-zero relation is immediate. Scalar homogeneity in degree two uses r²=r for r∈F₂; all other positive degrees are zero.
3. For the product relation, an index zero is immediate. When both indices are positive, the only nonzero possible left side is inr(a)²=0; the only possibly nonzero target degree is 1+1=2, whose coefficient choose(2,1)=2 vanishes in F₂.
4. For the additive relation, degree zero gives one and degree two gives inr(a+b)=inr(a)+inr(b). The only other possible convolution term is degree four, inr(a)·inr(b)=0. All remaining terms vanish. Apply lift′_apply_dp for the stated formula.

**Depends on:** `mathlib:DividedPowerAlgebra.lift'`, `mathlib:DividedPowerAlgebra.lift'_apply_dp`, `mathlib:TrivSqZeroExt.inr`, `mathlib:TrivSqZeroExt.inr_mul_inr`, `mathlib:ZMod.natCast_self`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.5.1 (tag 07H5), proof, second paragraph. Not in the source. The source lists every x^[n], n≥1, among the generators of A⟨x⟩₊; this node is the packet's own example, over F₂, of an algebra map that kills x=x^[1] and not x^[2], used to show that the generator x alone does not suffice.

**Acceptance.**

- f(dp(1,a))=0 for every a∈F₂, and f(dp(2,1))=inr(1)≠0.
- f(dp(2,1))²=0, in agreement with dp(2,1)²=6·dp(4,1)=0 in characteristic 2.

### gamma-degree-one-insufficient — Degree one does not generate the augmentation ideal

**Lemma:** `TauCeti.Crystalline.Augmentation.degreeTwo_not_mem_degreeOne_span`. In Γ_F₂(F₂), dp(2,1) is not in the ordinary ideal generated by {embed(a) | a∈F₂}.

**Hypotheses and conventions.**

- The base ring and module are both F₂=ZMod 2.

**Uses.** CR.0/gamma-augmentation-ideal, test augmentationIdeal_test_degree_one_insufficient; CR.0/gamma-augmentation-ideal-generators: shows that the generators of Γ_R(M)₊ must include dp(n,m) for every n>0 and not only for n=1

**Construction or proof.**

1. Take the preceding ordinary algebra homomorphism to the square-zero extension. Every embed(a)=dp(1,a) maps to zero, so the ordinary ideal they generate lies in its ring kernel by Ideal.span_le.
2. The image of dp(2,1) is inr(1), which is nonzero by inr_injective and 1≠0 in F₂. Kernel membership therefore rules out membership in the degree-one ideal.

**Depends on:** `CR.0/gamma-degree-two-detector`, `mathlib:DividedPowerAlgebra.embed_def`, `mathlib:RingHom.mem_ker`, `mathlib:Ideal.span_le`, `mathlib:TrivSqZeroExt.inr_injective`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.5.1 (tag 07H5), proof, second paragraph. Not in the source. The source's generating set of A⟨x⟩₊ contains every x^[n], n≥1; this node is the packet's own example showing that over F₂ the element x^[2] is not in the ideal generated by x.

**Acceptance.**

- In F₂⟨x⟩ one has x·x^[n]=(n+1)·x^[n+1], so the ideal (x) is spanned by the x^[m] with m odd and does not contain x^[2].
- Over ℚ the degree-one elements do generate: dp(2,m)=½·dp(1,m)² in Γ_ℚ(M).

### pd-filtration — Divided power filtration

**Definition:** `TauCeti.PD.pdFiltration`. For n≥0 define Fⁿ_γI, also denoted I^[n], as the ideal generated by all finite products γ_(e₁)(x₁)⋯γ_(eₜ)(xₜ), where xⱼ∈I, eⱼ≥0 and ∑eⱼ≥n. Include the empty product with total degree zero. Thus the convention at n=0 is intrinsic to the same formula. The carrier is Ideal R and the operations are those of the given DividedPowers I.

**Hypotheses and conventions.**

- R is a commutative ring, I an ideal of R and γ a divided power structure on I (γ : DividedPowers I).
- n and the weights e_j are natural numbers, the x_j are elements of I, and the empty product (value 1, weight 0) is allowed.

**API.**

- `TauCeti.PD.pdFiltration_le_iff` (characterisation): For any ideal K of R, Fⁿ_γI⊆K if and only if every finite weighted product of total degree at least n belongs to K.
- `TauCeti.PD.prod_dpow_mem_pdFiltration` (constructor): For xⱼ∈I and natural weights eⱼ whose sum is at least n, the product ∏ⱼγ_(eⱼ)(xⱼ) belongs to Fⁿ_γI, including the empty word when n=0.
- `TauCeti.PD.dpow_mem_pdFiltration` (simp): For x∈I and n≥0, γ_n(x) belongs to Fⁿ_γI.
- `TauCeti.PD.pdFiltration_eq_span_of_span` (characterisation): If I=Ideal.span(S), then Fⁿ_γI is the ideal generated by the finite products ∏_j γ_(e_j)(s_j) with s_j∈S and Σ_j e_j≥n.

**Unit tests.**

- `TauCeti.Crystalline.pd_filtration_empty_word` (degenerate): For the zero ideal with the divided power structure dividedPowersBot, F⁰(0)=R: the empty word supplies 1.
- `TauCeti.Crystalline.pd_filtration_zero_ideal` (computation): For the zero ideal with dividedPowersBot and every n>0, Fⁿ(0)=0, because a word of positive total weight has a positive-weight factor evaluated at zero.
- `TauCeti.Crystalline.pd_filtration_two_adic_counterexample` (non-example): For R=ℤ₂, I=(2) and the canonical PadicInt.dividedPowers 2, the element 2 lies in F²I but not in I². Indeed γ₂(2)=2 and v₂(2)=1<2.
- `TauCeti.Crystalline.pd_filtration_two_adic_constant` (computation): For R=ℤ₂, I=(2) and γ=PadicInt.dividedPowers 2: Fⁿ_γI=(2) for every n≥1.

**Uses.** Stacks Lemma 60.6.3 (07HT): The divided-power square (K∩J(1))^[2] appears in the quotient K/(K²+(K∩J(1))^[2]) presenting the module of PD differentials. Stacks Definition 60.6.1 (07HR); CrystallineCohomology:CR.2/smooth-lift-filtration: The rule θ(δ_n(x))=δ_(n−1)(x)θ(x) gives d(Fⁿ)⊆F^(n−1)·Ω¹, so that Fil^r(D⊗Ω^q)=F^(r−q)J̄⊗Ω^q is a subcomplex of the PD de Rham complex. Bhatt, Proposition 9.9; PrismaticCohomology:PR.4/acrys-divided-frobenius-surjective: The Hodge filtration of A_cris is the completed PD filtration of the divided power ideal generated by ker θ; it is computed on generators by pdFiltration_eq_span_of_span.

**Construction or proof.**

1. Let W_n be the set of all products γ_(e₁)(x₁)⋯γ_(eₜ)(xₜ) over finite lists of pairs (e_j,x_j) with x_j∈I and Σe_j≥n. Put Fⁿ_γI=Ideal.span(W_n).
2. Ideal.span_le gives the containment criterion Fⁿ_γI⊆K ⇔ W_n⊆K; Ideal.subset_span gives membership of every word; the one-term list (n,x) gives γ_n(x)∈Fⁿ_γI. A factor of weight 0 equals γ₀(x)=1 and can be deleted without changing the product or the total weight.
3. Generators: if I=Ideal.span(S), expand each factor γ_e(x) with x=Σa_i s_i by DividedPowers.dpow_sum and the scalar rule γ_e(a s)=a^e γ_e(s) into an R-combination of products of γ_(e′)(s), s∈S, of the same total weight; hence Fⁿ_γI is generated by the words with all x_j∈S.
4. Examples: for the zero ideal a word of positive weight has a factor γ_e(0) with e>0, which is 0 (DividedPowers.dpow_eval_zero). In ℤ₂, PadicInt.coe_dpow_eq gives γ₂(2)=2²/2!=2, and 2∉(2)²=(4) by Ideal.span_singleton_pow, PadicInt.mem_span_pow_iff_le_valuation and PadicInt.valuation_p.

**Depends on:** `mathlib:DividedPowers`, `mathlib:Ideal.span`, `mathlib:Ideal.span_le`, `mathlib:Ideal.subset_span`, `mathlib:dividedPowersBot`, `mathlib:DividedPowers.dpow_eval_zero`, `mathlib:DividedPowers.dpow_sum`, `mathlib:PadicInt.dividedPowers`, `mathlib:PadicInt.coe_dpow_eq`, `mathlib:PadicInt.valuation_p`, `mathlib:PadicInt.mem_span_pow_iff_le_valuation`, `mathlib:Ideal.span_singleton_pow`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section 60.6 (07HQ), unnumbered paragraph between Lemma 60.6.2 (07HS) and Lemma 60.6.3 (07HT). The source defines I^[n] by exactly these generators, notes Iⁿ⊆I^[n] and I^[1]=I, and adds 'Sometimes we also set I^[0] = A'; the node makes n=0 part of the same formula by allowing the empty product.

**Acceptance.**

- F⁰_γI=R and F¹_γI=I for every (I,γ); for the zero ideal Fⁿ=0 for all n≥1.
- For I=(2)⊂ℤ₂ with the divided powers PadicInt.dividedPowers 2: γ₂(2)=2 lies in F² but not in I²=(4); more precisely Fⁿ=(2) for every n≥1, because γ_(2^a)(2)=2^(2^a)/(2^a)! has 2-adic valuation 1.

### pd-filtration-zero — Zeroth divided power filtration step

**Lemma:** `TauCeti.PD.pdFiltration_zero`. For every divided-power ideal (I,γ), F⁰_γI=R, as an equality of ideals.

**Hypotheses and conventions.**

- R is a commutative ring, I an ideal of R and γ a divided power structure on I (γ : DividedPowers I).

**Construction or proof.**

1. The empty list has weight zero and product 1, so Ideal.subset_span puts 1 in F⁰_γI.
2. Apply Ideal.eq_top_iff_one. This proof also covers the zero ring.

**Depends on:** `CR.0/pd-filtration`, `mathlib:Ideal.subset_span`, `mathlib:Ideal.eq_top_iff_one`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section 60.6 (07HQ), unnumbered paragraph between Lemma 60.6.2 (07HS) and Lemma 60.6.3 (07HT). The source sets I^[0]=A by convention; with the empty product allowed this is a consequence of the definition.

**Acceptance.**

- For the zero ideal of a non-zero ring R: F⁰=R≠0, while Fⁿ=0 for n≥1.

### pd-filtration-one — First divided power filtration step

**Lemma:** `TauCeti.PD.pdFiltration_one`. For every divided-power ideal (I,γ), F¹_γI=I.

**Hypotheses and conventions.**

- R is a commutative ring, I an ideal of R and γ a divided power structure on I (γ : DividedPowers I).

**Construction or proof.**

1. A list of total weight at least one has a term with eⱼ>0. The field DividedPowers.dpow_mem puts γ_(eⱼ)(xⱼ) in I, and multiplying by the other factors stays in I. Apply Ideal.span_le.
2. For x∈I the singleton list (1,x) generates γ₁(x)=x, by DividedPowers.dpow_one and Ideal.subset_span.

**Depends on:** `CR.0/pd-filtration`, `mathlib:DividedPowers`, `mathlib:Ideal.span_le`, `mathlib:Ideal.subset_span`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section 60.6 (07HQ), unnumbered paragraph between Lemma 60.6.2 (07HS) and Lemma 60.6.3 (07HT). The source notes I^[1]=I; the node proves it from the definition.

**Acceptance.**

- For I=(2)⊂ℤ₂ with its canonical divided powers F¹=(2); for the zero ideal F¹=0.

### pd-filtration-antitone — Decreasing divided power filtration

**Lemma:** `TauCeti.PD.pdFiltration_antitone`. The function n↦Fⁿ_γI is antitone: if n≤m, then Fᵐ_γI⊆Fⁿ_γI.

**Hypotheses and conventions.**

- R is a commutative ring, I an ideal of R and γ a divided power structure on I (γ : DividedPowers I).

**Construction or proof.**

1. A word of total weight at least m also has total weight at least n. Apply Ideal.span_mono to the inclusion of generating sets.

**Depends on:** `CR.0/pd-filtration`, `mathlib:Ideal.span_mono`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section 60.6 (07HQ), unnumbered paragraph between Lemma 60.6.2 (07HS) and Lemma 60.6.3 (07HT). The source gives only the definition of I^[n]; the statement is a routine consequence, proved in proofSteps.

**Acceptance.**

- For I=(2)⊂ℤ₂: F⁰=ℤ₂⊋F¹=(2), and Fⁿ=(2) for all n≥1, so the filtration need not be strictly decreasing.
- For the zero ideal: F⁰=R⊇F¹=0.

### pd-filtration-mul — Multiplicativity of divided power filtration

**Lemma:** `TauCeti.PD.pdFiltration_mul`. For all m,n≥0, (Fᵐ_γI)(Fⁿ_γI)⊆F^(m+n)_γI.

**Hypotheses and conventions.**

- R is a commutative ring, I an ideal of R and γ a divided power structure on I (γ : DividedPowers I).
- m and n are natural numbers.

**Construction or proof.**

1. Use Ideal.span_mul_span to reduce the product of generated ideals to pairwise products of generating words.
2. Concatenate the two finite lists. Its total weight is the sum of the weights and its value is the product of the two values. Ideal.subset_span puts this concatenated word in F^(m+n)_γI; Ideal.span_le completes the inclusion.

**Depends on:** `CR.0/pd-filtration`, `mathlib:Ideal.span_mul_span`, `mathlib:Ideal.span_le`, `mathlib:Ideal.subset_span`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section 60.6 (07HQ), unnumbered paragraph between Lemma 60.6.2 (07HS) and Lemma 60.6.3 (07HT). The source gives only the definition of I^[n]; the statement is a routine consequence, proved in proofSteps.

**Acceptance.**

- For I=(2)⊂ℤ₂ with its canonical divided powers: F¹·F¹=(4)⊊F²=(2), so the inclusion can be strict.

### pd-filtration-ordinary-powers — Ordinary powers inside divided powers

**Lemma:** `TauCeti.PD.pow_le_pdFiltration`. For every n≥0, Iⁿ⊆Fⁿ_γI, with the usual ideal power on the left.

**Hypotheses and conventions.**

- R is a commutative ring, I an ideal of R and γ a divided power structure on I (γ : DividedPowers I).

**Construction or proof.**

1. Induct on n. The base case is pdFiltration_zero and I⁰=R.
2. For the successor multiply the induction inclusion by I=F¹_γI using pdFiltration_one. Apply pdFiltration_mul and the ordinary ideal-power recursion.

**Depends on:** `CR.0/pd-filtration-zero`, `CR.0/pd-filtration-one`, `CR.0/pd-filtration-mul`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section 60.6 (07HQ), unnumbered paragraph between Lemma 60.6.2 (07HS) and Lemma 60.6.3 (07HT). The source notes Iⁿ⊆I^[n]; the node proves it by induction from the zeroth and first steps and multiplicativity.

**Acceptance.**

- For the canonical divided powers on (2) in ℤ₂ the n=2 inclusion is strict.

### pd-filtration-map — Divided power maps preserve filtration

**Lemma:** `TauCeti.PD.map_pdFiltration_le`. Let f:R→S be a ring homomorphism, J an ideal of S and δ a divided-power structure on J. If f is a divided-power morphism from (I,γ) to (J,δ), then f(Fⁿ_γI)S⊆Fⁿ_δJ for every n≥0, where the left side is Ideal.map.

**Hypotheses and conventions.**

- R is a commutative ring, I an ideal of R and γ a divided power structure on I (γ : DividedPowers I).
- S is a commutative ring, J an ideal of S and δ a divided power structure on J; f:R→S is a ring homomorphism that is a divided power morphism from (I,γ) to (J,δ) (DividedPowers.IsDPMorphism γ δ f).

**Construction or proof.**

1. Use Ideal.map_span and Ideal.span_le to test images of generating words.
2. The defining ideal-containment condition sends every xⱼ∈I into J. DividedPowers.IsDPMorphism.map_dpow and multiplicativity of f identify the image with the word of the same weights in J. Apply Ideal.subset_span.

**Depends on:** `CR.0/pd-filtration`, `mathlib:DividedPowers.IsDPMorphism`, `mathlib:DividedPowers.IsDPMorphism.map_dpow`, `mathlib:Ideal.map_span`, `mathlib:Ideal.span_le`, `mathlib:Ideal.subset_span`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section 60.6 (07HQ), unnumbered paragraph between Lemma 60.6.2 (07HS) and Lemma 60.6.3 (07HT). The source gives only the definition of I^[n]; the statement is a routine consequence, proved in proofSteps.

**Acceptance.**

- For the identity of R viewed as a divided power morphism from (0,dividedPowersBot) to (I,γ), the inclusion reads Fⁿ(0)=0⊆Fⁿ_γI for n≥1; it is strict for n=1 when I≠0.

### pd-filtration-map-surjective — Divided power filtrations under ideal-generating maps

**Lemma:** `TauCeti.PD.map_pdFiltration_of_surjective`. Let f:(R,I,γ)→(S,J,δ) be a divided power morphism with I.map(f)=J. Then (Fⁿ_γI).map(f)=Fⁿ_δJ for every n≥0. The ring map need not be surjective.

**Hypotheses and conventions.**

- R is a commutative ring, I an ideal of R and γ a divided power structure on I (γ : DividedPowers I).
- S is a commutative ring, J an ideal of S and δ a divided power structure on J; f:R→S is a ring homomorphism that is a divided power morphism from (I,γ) to (J,δ) (DividedPowers.IsDPMorphism γ δ f).
- I.map(f)=J; no surjectivity hypothesis on f.

**Construction or proof.**

1. The inclusion from left to right is pd-filtration-map.
2. Every y∈J is a finite sum Σ a_i f(x_i), with a_i∈S and x_i∈I. Apply the divided-power addition and scalar axioms to δ_e(y): its summands are products ∏ a_i^{e_i} f(γ_{e_i}(x_i)) with Σ e_i=e. Terms of exponent zero contribute 1.
3. Expand every factor of a generating word of Fⁿ_δJ in this way. Each resulting summand is an S-multiple of the image of a word in the γ_{e_i}(x_i), of the same total weight ≥n. Thus it belongs to Ideal.map f (Fⁿ_γI). Ideal.span_le gives the reverse inclusion; degree zero is immediate.

**Depends on:** `CR.0/pd-filtration-map`, `mathlib:DividedPowers.IsDPMorphism.map_dpow`, `mathlib:Ideal.map_span`, `mathlib:Ideal.span_le`, `mathlib:Ideal.subset_span`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section 60.6 (07HQ), unnumbered paragraph between Lemma 60.6.2 (07HS) and Lemma 60.6.3 (07HT). The source gives only the definition of I^[n]; the statement is a routine consequence, proved in proofSteps.

**Acceptance.**

- For the quotient map ℤ₂→ℤ/4 and the canonical divided powers on (2), with the induced ones on (2)⊂ℤ/4: the image of Fⁿ((2))=(2) is (2)=Fⁿ((2)⊂ℤ/4) for all n≥1.
- The hypothesis I.map(f)=J is needed: for the identity of R from (0,dividedPowersBot) to (I,γ) with I≠0 the image of F¹(0)=0 is not F¹_γI=I.
- For the non-surjective inclusion ℤ_(p)→ℤ_(p)[t] and the canonical divided powers on (p), the image ideal of every PD filtration level equals that level on (p)⊂ℤ_(p)[t]; the coefficients t in sums are handled by the scalar axiom.

### pd-filtration-rational — Rational divided powers equal ordinary powers

**Lemma:** `TauCeti.PD.pdFiltration_eq_pow_of_ratAlgebra`. If R is a ℚ-algebra, then for every ideal I, every divided-power structure γ on I and n≥0, Fⁿ_γI=Iⁿ.

**Hypotheses and conventions.**

- R is a commutative ring, I an ideal of R and γ a divided power structure on I (γ : DividedPowers I).
- R is a ℚ-algebra.

**Construction or proof.**

1. For x∈I, DividedPowers.RatAlgebra.dpow_eq_inv_fact_smul gives γ_e(x)=(1/e!)xᵉ, including e=0.
2. By Ideal.pow_mem_pow, xᵉ belongs to Iᵉ. Multiplication by the rational scalar preserves that ideal. Induction on word length places each product of weight w in Iʷ.
3. For w≥n, Ideal.pow_le_pow_right gives Iʷ⊆Iⁿ. Ideal.span_le yields Fⁿ_γI⊆Iⁿ. The reverse inclusion is pd-filtration-ordinary-powers.

**Depends on:** `CR.0/pd-filtration-ordinary-powers`, `mathlib:DividedPowers.RatAlgebra.dpow_eq_inv_fact_smul`, `mathlib:Ideal.pow_mem_pow`, `mathlib:Ideal.pow_le_pow_right`, `mathlib:Ideal.span_le`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section 60.6 (07HQ), unnumbered paragraph between Lemma 60.6.2 (07HS) and Lemma 60.6.3 (07HT). The source gives only the definition of I^[n]; the comparison with ordinary powers over a ℚ-algebra is proved in proofSteps from DividedPowers.RatAlgebra.dpow_eq_inv_fact_smul.

**Acceptance.**

- For R=ℚ[x], I=(x): Fⁿ_γI=(xⁿ).
- For I=(2)⊂ℤ₂, which is not a ℚ-algebra, F²=(2)≠I²=(4).

### gamma-canonical-pd — Canonical divided powers on the augmentation ideal

**Construction:** `TauCeti.Crystalline.gammaPD`. For a commutative ring A and an A-module M, let Γ_A(M)=DividedPowerAlgebra A M and Γ⁺ its augmentation ideal, the ideal generated by the dp_n(m), n≥1. There is a unique divided power structure δ on Γ⁺ with δ_n(dp₁(m))=dp_n(m) for all n≥0 and m∈M; it satisfies δ_n(dp_k(m))=uniformBell(n,k)·dp_(nk)(m) for k≥1, where uniformBell(n,k)=(nk)!/(n!(k!)ⁿ). For every A-algebra C with a divided power ideal (K,ε) and every A-linear map g:M→C with values in K, the algebra map DividedPowerAlgebra.lift ε g:Γ_A(M)→C is a divided power morphism (Γ⁺,δ)→(K,ε), and it is the only A-algebra map Γ_A(M)→C that is a divided power morphism and sends dp₁(m) to g(m) for all m.

**Hypotheses and conventions.**

- A is a commutative ring and M an A-module; no freeness, finiteness or torsion hypothesis.
- For the universal property: C is a commutative A-algebra, K an ideal of C with a divided power structure ε, and g:M→C is A-linear with g(M)⊆K.

**API.**

- `TauCeti.Crystalline.gammaPD_generator` (simp): δ_n(dp₁(m))=dp_n(m) for m∈M.
- `TauCeti.Crystalline.gammaPD_lift` (universal-property): For an A-algebra C with a divided power ideal (K,ε) and an A-linear map g:M→C with g(M)⊆K there is a unique A-algebra map Γ_A(M)→C that is a divided power morphism (Γ⁺,δ)→(K,ε) and sends dp₁(m) to g(m); it is DividedPowerAlgebra.lift ε g.
- `TauCeti.Crystalline.gammaPD_map` (functoriality): For an A-linear map f:M→N, DividedPowerAlgebra.map A f:Γ_A(M)→Γ_A(N) is a divided power morphism for the canonical divided powers on the augmentation ideals.
- `TauCeti.Crystalline.gammaPD_unique` (extensionality): A divided power structure δ′ on Γ⁺ with δ′_n(dp₁(m))=dp_n(m) for all n≥1 and m∈M is equal to δ.
- `TauCeti.Crystalline.gammaPD_dp` (simp): δ_n(dp_k(m))=uniformBell(n,k)·dp_(nk)(m) for all n≥0, k≥1 and m∈M.

**Unit tests.**

- `TauCeti.Crystalline.test_gammaPD_zero` (degenerate): For M=0, Γ⁺=0 and its PD structure is the zero-ideal structure.
- `TauCeti.Crystalline.test_gammaPD_free_generator` (computation): In Γ_A(A), δ₂(dp₁(1))=dp₂(1), while dp₁(1)²=2dp₂(1).
- `TauCeti.Crystalline.test_gammaPD_F2` (non-example): Over F₂ the free rank-one generator has square zero but its second divided power is nonzero.
- `TauCeti.Crystalline.test_gammaPD_torsion_module` (computation): In Γ_ℤ(ℤ/2): dp₂(1) has additive order 4, dp₁(1) has order 2, δ₂(dp₁(1))=dp₂(1) and dp₁(1)²=2·dp₂(1)≠0.

**Uses.** Stacks Section 23.5 (07H4), Lemma 23.5.1 (07H5); CrystallineCohomology:CR.0/pd-polynomial: For free M this is the divided power structure on the ideal A⟨x_w⟩₊ of the divided power polynomial algebra. CrystallineCohomology:CR.0/pd-envelope: The envelope of an ideal J⊆B is constructed as a quotient of Γ_B(J) with these divided powers; J is not a free B-module in general, so the arbitrary-module case is needed.

**Construction or proof.**

1. Free case, basis. Let M=A^(W) with basis (e_w). The divided monomials x^[e]=∏_w dp_(e_w)(e_w), e:W→₀ℕ, span Γ_A(M) (DividedPowerAlgebra.submodule_span_prod_dp_eq_top). They are linearly independent: on the free module ⊕_e A·y^[e] put the product y^[e]y^[f]=∏_w binom(e_w+f_w,e_w)·y^[e+f]; DividedPowerAlgebra.lift' applied to (n,Σa_w e_w)↦Σ_(|e|=n)∏_w a_w^(e_w)·y^[e] (its four relations are the multinomial and Vandermonde identities) gives an algebra map sending x^[e] to y^[e].
2. Free case, divided powers. For e≠0 and k≥0 put c(k,e)=(1/k!)·∏_w (k·e_w)!/(e_w!)^k, an integer, and define on Γ⁺=⊕_(e≠0)A·x^[e] the maps δ_n(Σa_e x^[e])=Σ_(Σn_e=n)∏_e a_e^(n_e)·c(n_e,e)·x^[n_e·e]. They satisfy δ₁=id, δ_n(ay)=aⁿδ_n(y) and the addition rule, and the multiplication and iteration identities hold at the generators x^[e]; all of these reduce to identities between integers, valid because x^[e]↦∏_w x_w^(e_w)/e_w! embeds the case A=ℤ into ℚ[x_w]. Apply generator-criterion with the generating set {x^[e]:e≠0}. For m=Σa_w e_w, δ_n(dp₁(m))=dp_n(m) by DividedPowerAlgebra.dp_sum_smul.
3. General case, kernel. Choose a surjection π:F→M from a free module, with kernel N. Γ_A(π):Γ_A(F)→Γ_A(M) is surjective (DividedPowerAlgebra.lift_surjective) and its kernel is the ideal 𝔞 generated by the dp_n(k), k∈N, n≥1: these lie in the kernel, and conversely (n,m)↦dp_n(m̃) mod 𝔞, for any lift m̃ of m, is well defined because dp_n(m̃+k)=Σ_(i+j=n)dp_i(m̃)dp_j(k)≡dp_n(m̃), satisfies the relations of DividedPowerAlgebra.lift', and gives a map Γ_A(M)→Γ_A(F)/𝔞 inverse to the map induced by Γ_A(π).
4. General case, descent. 𝔞⊆Γ_A(F)⁺ is a sub-PD ideal by DividedPowers.span_isSubDPIdeal_iff, since δ_m(dp_n(k))=δ_m(δ_n(dp₁(k)))=uniformBell(m,n)·dp_(mn)(k)∈𝔞. DividedPowers.Quotient.OfSurjective.dividedPowers gives divided powers on the image Γ_A(M)⁺ of Γ_A(F)⁺ with δ_n(dp₁(m))=dp_n(m). Uniqueness: Γ⁺ is generated by the dp_k(m), k≥1 (gamma-augmentation-ideal-generators), on which δ is forced by the iteration rule; apply DividedPowers.dpow_eq_from_gens.
5. Universal property. lift ε g sends dp_n(m) to ε_n(g(m)) (DividedPowerAlgebra.lift_apply_dp), hence Γ⁺ into K, and commutes with the divided powers on the generators dp_k(m), k≥1, by the iteration rule in both rings; DividedPowers.IsDPMorphism.on_span extends this to Γ⁺. A divided power A-algebra map h with h(dp₁(m))=g(m) has h(dp_n(m))=ε_n(g(m)), so h=lift ε g by DividedPowerAlgebra.lift_unique.

**Depends on:** `CR.0/gamma-augmentation-ideal`, `CR.0/generator-criterion`, `CR.0/gamma-augmentation-ideal-generators`, `mathlib:DividedPowerAlgebra.lift`, `mathlib:DividedPowerAlgebra.lift'`, `mathlib:DividedPowerAlgebra.lift_apply_dp`, `mathlib:DividedPowerAlgebra.lift_unique`, `mathlib:DividedPowerAlgebra.lift_surjective`, `mathlib:DividedPowerAlgebra.submodule_span_prod_dp_eq_top`, `mathlib:DividedPowerAlgebra.dp_sum_smul`, `mathlib:DividedPowers.span_isSubDPIdeal_iff`, `mathlib:DividedPowers.Quotient.OfSurjective.dividedPowers`, `mathlib:DividedPowers.dpow_eq_from_gens`, `mathlib:DividedPowers.IsDPMorphism.on_span`, `mathlib:DividedPowerAlgebra.map`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Section 23.5 (07H4), Lemma 23.5.1 (07H5) with proof and Remark 23.5.2 (07H6). The source constructs the divided powers on the augmentation ideal of A⟨x₁,…,x_t⟩ (by the remark, for any set of variables), that is for free M, and proves the universal property there. The statement for an arbitrary module M and the uniqueness clause go beyond the source; they are obtained in proofSteps by descent along a free presentation.

**Acceptance.**

- For A=ℤ and M=ℤ/2: the degree-two part of Γ_ℤ(ℤ/2) is ℤ/4·dp₂(1); so δ₂(dp₁(1))=dp₂(1) has additive order 4 although dp₁(1) has order 2, and dp₁(1)²=2·dp₂(1)≠0.
- A torsion ring where division by n! is invalid: for M=A=F_p, Γ_A(A)=F_p⟨x⟩ with x=dp₁(1); x^p=p!·dp_p(1)=0 and δ_p(x)=dp_p(1)≠0, so δ_p(x) is not x^p/p!.

### pd-polynomial — Relative divided power polynomial algebras

**Construction:** `TauCeti.Crystalline.pdPolynomial`. Let (A,I,γ) be a divided power ring and W a set. Put A⟨x_w:w∈W⟩=Γ_A(A^(W)) (DividedPowerAlgebra A (W →₀ A)) and x_w^[n]=dp_n(e_w). (1) The divided monomials x^[e]=∏_w x_w^[e_w], e:W→₀ℕ, form an A-basis, with x^[e]x^[f]=(∏_w binom(e_w+f_w,e_w))·x^[e+f]. (2) On the ideal J=IA⟨x_w⟩+A⟨x_w⟩₊, where A⟨x_w⟩₊ is the augmentation ideal, there is a unique divided power structure δ such that δ_n(x_w)=x_w^[n] for all n and w, and A→A⟨x_w⟩ is a divided power morphism (I,γ)→(J,δ). (3) For every divided power ring (C,K,ε), a divided power morphism (A⟨x_w⟩,J,δ)→(C,K,ε) is the same as a divided power morphism φ:(A,I,γ)→(C,K,ε) together with a family (k_w) of elements of K; the morphism acts by φ on coefficients and sends x^[e] to ∏_w ε_(e_w)(k_w).

**Hypotheses and conventions.**

- (A,I,γ) is a divided power ring (A commutative) and W is an arbitrary set.
- For the universal property (C,K,ε) is an arbitrary divided power ring.

**API.**

- `TauCeti.Crystalline.pdPolynomial_basis` (structure): The finite-support divided monomials give an A-basis.
- `TauCeti.Crystalline.pdPolynomial_lift` (universal-property): For a divided power ring (C,K,ε), a divided power morphism φ:(A,I,γ)→(C,K,ε) and elements k_w∈K (w∈W) there is a unique divided power morphism (A⟨x_w⟩,J,δ)→(C,K,ε) extending φ with x_w↦k_w; it sends x^[e] to ∏_w ε_(e_w)(k_w).
- `TauCeti.Crystalline.pdPolynomial_monomial_mul` (simp): x^[e]·x^[f]=(∏_w binom(e_w+f_w,e_w))·x^[e+f] for e,f:W→₀ℕ.
- `TauCeti.Crystalline.pdPolynomial_algebraMap_isDPMorphism` (compatibility): The structure map A→A⟨x_w⟩ is a divided power morphism from (I,γ) to (J,δ).
- `TauCeti.Crystalline.pdPolynomial_dpow_var` (simp): δ_n(x_w)=x_w^[n] for all n≥0 and w∈W.
- `TauCeti.Crystalline.pdPolynomial_dpow_unique` (extensionality): A divided power structure δ′ on J such that δ′_n(x_w)=x_w^[n] for all n, w and such that A→A⟨x_w⟩ is a divided power morphism (I,γ)→(J,δ′) is equal to δ.

**Unit tests.**

- `TauCeti.Crystalline.test_pdPolynomial_no_variables` (degenerate): With W empty the relative PD algebra is (A,I,γ).
- `TauCeti.Crystalline.test_pdPolynomial_two` (computation): x^[1]x^[1]=2x^[2] over Z, and x^[2] remains a nonzero basis vector over F₂.
- `TauCeti.Crystalline.test_pdPolynomial_eval` (characterisation): For a divided power morphism g:(A⟨x_w⟩,J,δ)→(C,K,ε) and w∈W: g(x_w^[n])=ε_n(g(x_w)) for all n≥0.
- `TauCeti.Crystalline.test_pdPolynomial_base_gluing` (computation): For (A,I,γ)=(ℤ_(p),(p),canonical) and one variable x: δ₂(p+x)=γ₂(p)+p·x+x^[2] in ℤ_(p)⟨x⟩.

**Uses.** Stacks §§60.2,60.6; CR.2/pd-poincare: Provides graph-envelope divided coordinates, their finite monomial basis and the contraction d(x^[n])=x^[n−1]dx; the universal tuple API avoids expanding the presentation.

**Construction or proof.**

1. Import the homogeneous grading and the free-module divided-monomial basis from current IntegralHeckeAndGaloisDeterminants §0.4 (degree, grading, graded_mul, degree_baseChange, symmetricTensor_equiv). Sum the homogeneous bases over degrees to obtain the basis indexed by W→₀N. Its product formula is the existing dp multiplication relation. This node adds the relative PD base ideal and its universal property; it does not plan a second general Γ grading or tensor-symmetry theory.
2. Existence of δ. A⟨x_w⟩ is a free A-module, hence flat (Module.Flat.of_free), so γ extends uniquely to IA⟨x_w⟩ (flat-extension). The augmentation ideal carries its canonical divided powers (gamma-canonical-pd). By gamma-base-ideal-intersection, IA⟨x_w⟩∩A⟨x_w⟩₊=IA⟨x_w⟩·A⟨x_w⟩₊, so the two structures glue uniquely to δ on J (product-intersection-gluing); δ_n(x_w)=δ_n(dp₁(e_w))=dp_n(e_w).
3. Uniqueness of δ. J is generated by the image of I and the x_w^[k], k≥1; a structure with the two properties is determined on these (by γ, and by δ_n(x_w^[k])=uniformBell(n,k)·x_w^[nk]); apply DividedPowers.dpow_eq_from_gens.
4. Universal property. Given φ and (k_w), view C as an A-algebra by φ and let g:A^(W)→C be the linear map e_w↦k_w. DividedPowerAlgebra.lift ε g is a divided power morphism on A⟨x_w⟩₊ (gamma-canonical-pd) and on IA⟨x_w⟩ (because φ is one and the structure there is the extension of γ), hence on J (DividedPowers.IsDPMorphism.on_span); it sends x^[e] to ∏_w ε_(e_w)(k_w). Conversely a divided power morphism restricts to φ on A and is determined by the images k_w of the x_w.

**Depends on:** `CR.0/gamma-canonical-pd`, `CR.0/flat-extension`, `CR.0/gamma-base-ideal-intersection`, `CR.0/product-intersection-gluing`, `mathlib:Module.Flat.of_free`, `mathlib:DividedPowerAlgebra.lift`, `mathlib:DividedPowerAlgebra.lift'`, `mathlib:DividedPowerAlgebra.submodule_span_prod_dp_eq_top`, `mathlib:DividedPowers.dpow_eq_from_gens`, `mathlib:DividedPowers.IsDPMorphism.on_span`, `mathlib:DividedPowerAlgebra`, `IntegralHeckeAndGaloisDeterminants:IHG.0`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Section 23.5 (07H4): Lemma 23.5.1 (07H5) with proof, Remark 23.5.2 (07H6). Clauses (2) and (3) are the lemma (existence, uniqueness, universal property), with the remark for an arbitrary set of variables. The source defines A⟨x⟩ as the free module on the divided monomials; the node takes Γ_A(A^(W)) of Mathlib, so clause (1) (the divided monomials form a basis) is proved in proofSteps.

**Acceptance.**

- For W empty the result is (A,I,γ).
- A torsion ring where division by n! is invalid: for A=F_p, I=0 and one variable, F_p⟨x⟩ has basis x^[n], n≥0, with x^p=0 and x^[p]≠0; the divided power ideal is spanned by the x^[n], n≥1.
- For (A,I,γ)=(ℤ_(p),(p),canonical) and one variable: δ₂(p+x)=γ₂(p)+p·x+x^[2].

**Signature component.** The prototype gives the relative PD ideal, universal property, monomial basis and multiplication. The generic grading and free Γ^d–TSym input is already owned by IntegralHeckeAndGaloisDeterminants §0.4; an implementation imports that owner before proving the relative base-ideal gluing here.

### pd-filtration-stability — Divided power stability of the weighted filtration

**Lemma:** `TauCeti.Crystalline.pdFiltration_dpow`. For n≥1, m≥1 and x∈Fⁿ_γI: γ_m(x)∈F^(mn)_γI. In particular Fⁿ_γI (n≥1) is a sub-PD ideal of (I,γ) (DividedPowers.IsSubDPIdeal), and γ induces a divided power structure on the image of I in R/Fⁿ_γI (DividedPowers.Quotient.dividedPowers).

**Hypotheses and conventions.**

- R is a commutative ring, I an ideal of R and γ a divided power structure on I (γ : DividedPowers I).
- m≥1 and n≥1 are natural numbers.

**Construction or proof.**

1. Words. Let w=∏_j γ_(e_j)(x_j) be a generating word with Σe_j≥n≥1 and pick t with e_t≥1. Writing w=u·γ_(e_t)(x_t), the scalar rule and the iteration rule give γ_m(w)=u^m·uniformBell(m,e_t)·γ_(m·e_t)(x_t), and u^m is an integer multiple of ∏_(j≠t)γ_(m·e_j)(x_j) by the multiplication rule. So γ_m(w) is a multiple of a word of weight m·Σe_j≥mn.
2. Span. γ_m(a·x)=a^m·γ_m(x), γ_m(0)=0, and γ_m(x+y)=Σ_(i+j=m)γ_i(x)γ_j(y) lies in Σ_(i+j=m)F^(in)·F^(jn)⊆F^(mn) by pd-filtration-mul once the claim is known for x and y and all smaller indices (γ₀=1∈F⁰). Induct over the span Fⁿ_γI=Ideal.span(W_n), for all m≥1 simultaneously.
3. Consequences. Fⁿ_γI⊆F¹_γI=I (pd-filtration-antitone, pd-filtration-one) and γ_m(Fⁿ_γI)⊆F^(mn)_γI⊆Fⁿ_γI, so Fⁿ_γI is a sub-PD ideal; DividedPowers.Quotient.dividedPowers applies with Fⁿ_γI∩I=Fⁿ_γI.

**Depends on:** `CR.0/pd-filtration`, `CR.0/pd-filtration-one`, `CR.0/pd-filtration-antitone`, `CR.0/pd-filtration-mul`, `mathlib:DividedPowers`, `mathlib:DividedPowers.IsSubDPIdeal`, `mathlib:DividedPowers.Quotient.dividedPowers`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section 60.6 (07HQ), unnumbered paragraph between Lemma 60.6.2 (07HS) and Lemma 60.6.3 (07HT). The source gives only the definition of I^[n]. That I^[n] is stable under the γ_m, with the bound γ_m(I^[n])⊆I^[mn], is not stated there and is proved in proofSteps from the axioms.

**Acceptance.**

- In ℤ₂ with the canonical divided powers on (2): Fⁿ=(2) for all n≥1, and γ_m maps (2) into (2)=F^(mn).
- For x∈I and m,n≥1: γ_m(γ_n(x))=uniformBell(m,n)·γ_(mn)(x) lies in F^(mn)_γI.

### nilpotence-predicates — PD-nilpotent divided power ideals and ordinary nilpotence

**Definition:** `TauCeti.Crystalline.IsPDNilpotent`. A divided power ideal (I,γ) of a commutative ring R is PD-nilpotent if Fⁿ_γI=0 for some n≥1. Relation to the ordinary notions of Mathlib: PD-nilpotent ⇒ IsNilpotent I (Iᴺ=0 for some N; N=n works because Iⁿ⊆Fⁿ_γI) ⇒ I≤nilradical R (every element of I is nilpotent). Neither implication is an equivalence: (2)⊂ℤ/4 with the divided powers induced from ℤ₂ satisfies (2)²=0 and is not PD-nilpotent; the augmentation ideal of F_p⟨x⟩ lies in the nilradical (y^p=p!·γ_p(y)=0) and is not nilpotent. If p is a prime that is nilpotent in R/I, then I≤nilradical R if and only if p is nilpotent in R.

**Hypotheses and conventions.**

- R is a commutative ring, I an ideal of R and γ a divided power structure on I (γ : DividedPowers I).
- In the last sentence p is a prime number and some power of p lies in I.

**API.**

- `TauCeti.Crystalline.pdNilpotent_iff` (characterisation): PD nilpotent iff FⁿI=0 for some n>0.
- `TauCeti.Crystalline.pdNilpotent_ordinary` (compatibility): If Fⁿ_γI=0 with n≥1 then Iⁿ=0; in particular a PD-nilpotent ideal I satisfies IsNilpotent I.
- `TauCeti.Crystalline.pdNilpotent_map` (functoriality): If f:R→S is a surjective divided power morphism from (I,γ) to (J,δ) with I.map(f)=J and (I,γ) is PD-nilpotent, then (J,δ) is PD-nilpotent.
- `TauCeti.Crystalline.pdIdeal_le_nilradical_iff` (relation): Let (I,γ) be a divided power ideal of R and p a prime nilpotent in R/I. Then I≤nilradical R if and only if p is nilpotent in R.

**Unit tests.**

- `TauCeti.Crystalline.test_nilpotent_zero` (degenerate): The zero PD ideal is PD nilpotent with bound1.
- `TauCeti.Crystalline.test_nilpotent_q` (compatibility): For a rational algebra PD nilpotence equals ordinary ideal nilpotence.
- `TauCeti.Crystalline.test_nilpotent_two` (non-example): In Z/4 with the canonical 2-PD structure, (2)²=0 but γ_(2^a)(2) is twice an odd unit for every a≥0, so the PD ideal is not PD nilpotent.
- `TauCeti.Crystalline.test_nilpotent_two_structures` (non-example): On the ideal (2) of ℤ/4, which has square zero, the divided power structure with γ_n=0 for n≥2 (DividedPowers.OfSquareZero.dividedPowers) is PD-nilpotent with F²=0, whereas the structure induced from ℤ₂, with γ₂(2)=2, is not PD-nilpotent.
- `TauCeti.Crystalline.test_nilpotent_mod_p_power` (computation): For e≥1 and the divided powers on (p)⊂ℤ/p^e induced from the canonical ones on (p)⊂ℤ_(p): the ideal is PD-nilpotent if and only if p is odd or e=1.

**Uses.** Stacks Definition 60.5.2 (07HM) and Section 60.7 before Situation 60.7.5 (07MF); CrystallineCohomology:CR.1/pd-scheme, CR.1/crystalline-site: A divided power thickening in which p is nilpotent has its divided power ideal inside the nilradical (Stacks 23.2.6), which makes U→T a thickening; no uniform bound Iᴺ=0 and no PD-nilpotence is implied or required. Stage CR.0: 'Treat p=2 explicitly for the canonical divided powers on p and any source nilpotence condition': The canonical divided powers on (p) are PD-nilpotent modulo p^e for odd p and not for p=2; a source statement that assumes PD-nilpotence must be restricted accordingly.

**Construction or proof.**

1. Define IsPDNilpotent γ as: there is n≥1 with Fⁿ_γI=0.
2. If Fⁿ_γI=0 then Iⁿ⊆Fⁿ_γI=0 (pd-filtration-ordinary-powers), so IsNilpotent I. If Iᴺ=0 then xᴺ=0 for x∈I, so I≤nilradical R.
3. Criterion. Let p^r∈I. If p^N=0 in R, then for x∈I, x^(pN)=(pN)!·γ_(pN)(x)=0 (DividedPowers.factorial_mul_dpow_eq_pow; p^N divides (pN)!), so I≤nilradical R. Conversely, if I≤nilradical R then p^r is nilpotent, hence so is p.
4. Examples. On (2)⊂ℤ/4 the divided powers induced from PadicInt.dividedPowers 2 have γ_(2^a)(2)=2 for all a≥0, because the 2-adic valuation of 2ⁿ/n! is the binary digit sum of n; so no Fⁿ vanishes although (2)²=0. In F_p⟨x⟩ the product x^[1]·x^[p]⋯x^[p^k] is a unit multiple of x^[1+p+…+p^k] for every k, so no power of the augmentation ideal vanishes.

**Depends on:** `CR.0/pd-filtration`, `CR.0/pd-filtration-ordinary-powers`, `mathlib:PadicInt.dividedPowers`, `mathlib:IsNilpotent`, `mathlib:nilradical`, `mathlib:DividedPowers.factorial_mul_dpow_eq_pow`, `mathlib:DividedPowers.OfSquareZero.dividedPowers`, `CR.0/pd-filtration-map-surjective`, `CR.0/pd-filtration-rational`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section 60.5 (07HL): Definition 60.5.2 (07HM) and the sentence after it; Section 60.7 (07I1): the observation before Situation 60.7.5 (07MF). The source uses only 'locally nilpotent' (every element nilpotent) and deduces it for the divided power ideal of a thickening in which p is nilpotent. PD-nilpotence (I^[n]=0) is not defined in the Stacks chapters; the node adds it and compares it with the ordinary notions.; [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Section 23.2, Lemma 23.2.6 (tag 07GR) with proof. The last sentence of the statement is this lemma.

**Acceptance.**

- Zero ideal: the zero ideal is PD-nilpotent, with F¹=0.
- Canonical p-PD ideal: for the divided powers on (p)⊂ℤ/p^e induced from the canonical ones on (p)⊂ℤ_(p), the ideal is PD-nilpotent if and only if p is odd or e=1; for p=2 and e≥2, γ_(2^a)(2)=2≠0 for all a.

**Signature component.** The typed predicate uses vanishing of a stage of the PD filtration; its ordinary nilpotence consequence and the rational and p=2 examples are typed. pdNilpotent_map still has an unnecessary ring-surjectivity hypothesis, whereas the packet only needs I.map f=J; the stronger filtration equality now makes that extra hypothesis removable.

### canonical-p-divided-powers — Canonical divided powers on the ideal generated by p

**Construction:** `TauCeti.PD.canonicalP`. Let p be a prime and A a commutative ring in which every integer not divisible by p is invertible; equivalently, A is a ℤ₍p₎-algebra, in a unique way. Construct the divided power structure γ on the ideal pA with γₙ(p·a)=cₙ·aⁿ for all a∈A and n≥0, where c₀=1 and, for n≥1, cₙ is the image in A of pⁿ/n!, an element of pℤ₍p₎. It is the unique extension to pA of the divided power structure x↦xⁿ/n! on pℤ₍p₎, and the only divided power structure on pA with γₙ(p)=cₙ for all n≥1. Every ring map between two such rings is a PD morphism for these structures, and for A=ℤ_p the structure is PadicInt.dividedPowers p. The prime p=2 is included, and nothing is assumed about p-torsion in A.

**Hypotheses and conventions.**

- p is a prime number.
- A is a commutative ring in which every integer not divisible by p is invertible. A may have p-torsion, and p may be nilpotent or zero in A; A need not be flat over ℤ₍p₎.

**API.**

- `TauCeti.PD.canonicalP_dpow_mul` (simp): For all a∈A and n≥0: γₙ(p·a)=cₙ·aⁿ, where c₀=1 and cₙ is the image in A of pⁿ/n!∈ℤ₍p₎ for n≥1. In particular γₙ(p)=cₙ.
- `TauCeti.PD.pow_div_factorial_mem_span` (relation): For a prime p and n≥1, the rational number pⁿ/n! lies in pℤ₍p₎: the p-adic valuation of n! is less than n. Consequently cₙ∈pA for n≥1.
- `TauCeti.PD.canonicalP_unique` (characterisation): If θ is a divided power structure on pA with θₙ(p)=cₙ for all n≥1, then θ=γ. In particular γ is the only divided power structure on pA for which ℤ₍p₎→A is a PD morphism from the structure x↦xⁿ/n! on pℤ₍p₎.
- `TauCeti.PD.canonicalP_isDPMorphism` (functoriality): Every ring map g:A→A′ between commutative rings in which the integers not divisible by p are invertible is a PD morphism from (pA,γ) to (pA′,γ′).
- `TauCeti.PD.canonicalP_padicInt` (compatibility): For A=ℤ_p the structure γ on pℤ_p is PadicInt.dividedPowers p.

**Unit tests.**

- `TauCeti.PD.test_canonicalP_two_mod_four` (computation): p=2, A=ℤ/4: γ₂(2)=2, γ₃(2)=0 and γ₄(2)=2.
- `TauCeti.PD.test_canonicalP_not_squareZero` (non-example): p=2, A=ℤ/4: the ideal (2) has square zero, and γ is not DividedPowers.OfSquareZero.dividedPowers on (2): that structure has operation 0 in degree 2 at the element 2, whereas γ₂(2)=2.
- `TauCeti.PD.test_canonicalP_mod_p_sq` (computation): p odd, A=ℤ/p² (the ring W₂(F_p)): γₙ(p)=0 for every n≥2, and γ is DividedPowers.OfSquareZero.dividedPowers on (p).
- `TauCeti.PD.test_canonicalP_three` (computation): p=3, A=ℤ/27: γ₂(3)=18, γ₃(3)=18 and γ₄(3)=0.
- `TauCeti.PD.test_canonicalP_char_p` (degenerate): If p=0 in A, for example A=F_p, then pA=0 and γ=dividedPowersBot A.

**Uses.** CR.0 stage description: "Treat p=2 explicitly for the canonical divided powers on p"; Acceptance: "canonical p-PD ideal": is that object, for every prime p including 2 and for every ring in which the integers prime to p are invertible CR.0/nilpotence-predicates, CR.0/completed-envelope, CR.0/fontaine-envelope: their statements and tests take the ideal (p) of ℤ/4, ℤ₍p₎, ℤ_p and A_cris with these divided powers: (2)⊂ℤ/4 as a PD ideal of square zero that is not PD-nilpotent, the completion of (ℤ₍p₎,(p)) as (ℤ_p,(p)), and the crystalline ideal (p)+ker θ as compatible with the base (p) Stacks Situations 60.5.1 and 60.7.5; CR.1/pd-scheme, CR.1/crystalline-site: gives the PD bases over ℤ₍p₎ whose divided power ideal contains p, such as (ℤ/pⁿ,(p)) and (W_n(k),(p)) for a perfect field k of characteristic p; the source notes after Situation 60.5.1 that p is usually contained in the divided power ideal of the base

**Construction or proof.**

1. For n≥1 the p-adic valuation of n! is less than n (padicValNat_factorial_lt_of_ne_zero), so pⁿ/n! lies in pℤ₍p₎.
2. On ℤ₍p₎, the localization of ℤ at the prime ideal (p) (Localization.AtPrime), which embeds in ℚ, define the divided power structure on pℤ₍p₎ by γₙ(x)=xⁿ/n!: apply DividedPowers.ofInjective to ℤ₍p₎→ℚ and to DividedPowers.RatAlgebra.dividedPowers on the unit ideal of ℚ; for x=p·a the required element is (pⁿ/n!)·aⁿ, which lies in pℤ₍p₎ for n≥1 by step 1. This is the construction of PadicInt.dividedPowers with ℤ₍p₎ in place of ℤ_p.
3. The hypothesis on A gives the unique ring map f:ℤ₍p₎→A (IsLocalization.lift), and the ideal of A generated by f(pℤ₍p₎) is pA. Apply principal-extension with x=p: the result is γₙ(b·p)=bⁿ·f(pⁿ/n!) for b∈A. This is case (2) of Stacks Lemma 23.4.2, which needs no flatness; A need not be flat over ℤ₍p₎, for example A=ℤ/p².
4. Uniqueness of the extension is extension-uniqueness. Two divided power structures on pA=span{p} with the same values at p are equal by DividedPowers.dpow_eq_from_gens.
5. For a ring map g:A→A′ between two such rings, g∘f=f′ by the uniqueness of the map from ℤ₍p₎, the ideal generated by g(pA) is pA′, and g(γₙ(p·a))=g(a)ⁿ·f′(pⁿ/n!)=γ′ₙ(p·g(a)); so g is a PD morphism. For A=ℤ_p, PadicInt.dividedPowers p is a divided power structure on pℤ_p whose value at p in degree n is pⁿ/n! (PadicInt.coe_dpow_eq), so it equals γ by step 4.

**Depends on:** `CR.0/principal-extension`, `CR.0/extension-uniqueness`, `mathlib:padicValNat_factorial_lt_of_ne_zero`, `mathlib:Localization.AtPrime`, `mathlib:IsLocalization.lift`, `mathlib:DividedPowers.ofInjective`, `mathlib:DividedPowers.RatAlgebra.dividedPowers`, `mathlib:DividedPowers.dpow_eq_from_gens`, `mathlib:DividedPowers.IsDPMorphism`, `mathlib:PadicInt.dividedPowers`, `mathlib:PadicInt.coe_dpow_eq`, `mathlib:DividedPowers.OfSquareZero.dividedPowers`, `mathlib:dividedPowersBot`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Example 23.2.3 (tag 07GN). The node is this example. It follows the second route the example gives (the definition works for ℤ₍p₎, and the result then follows from Lemma 23.4.2), using case (2) of that lemma, the principal case, which needs no flatness; the example does not say which case it means. The functoriality and the comparison with ℤ_p are not in the source; they follow from uniqueness.

**Acceptance.**

- p=2, A=ℤ/4: γ₂(2)=2, γ₃(2)=0 and γ₄(2)=2; this is not the square-zero structure on (2), whose operations of degree at least 2 vanish.
- p odd, A=ℤ/p² (the ring W₂(F_p)): γₙ(p)=0 for every n≥2, so γ is the square-zero structure on (p). For p=3 and A=ℤ/27: γ₂(3)=18, γ₃(3)=18 and γ₄(3)=0.
- A=F_p: pA=0 and γ is the divided power structure of the zero ideal.

### pd-square-zero-extension — Divided powers on a square-zero extension

**Construction:** `TauCeti.Crystalline.pdSqZeroExt`. Let (A,I,γ) be a divided power ring and M an A-module. On the trivial square-zero extension B=A⊕M (TrivSqZeroExt A M; M·M=0) the ideal J=I⊕M carries the divided power structure δ with δ₀=1 and δ_n(x+z)=γ_n(x)+γ_(n−1)(x)·z for n≥1, x∈I, z∈M. The inclusion A→B is a divided power morphism (I,γ)→(J,δ).

**Hypotheses and conventions.**

- (A,I,γ) is a divided power ring (A commutative) and M an A-module.
- B=A⊕M has the multiplication (a,m)(a′,m′)=(aa′,am′+a′m).

**API.**

- `TauCeti.Crystalline.pdSqZeroExt_dpow` (simp): δ_n(x+z)=γ_n(x)+γ_(n−1)(x)·z for n≥1, x∈I, z∈M.
- `TauCeti.Crystalline.pdSqZeroExt_dpow_inr` (simp): δ₁(z)=z and δ_n(z)=0 for z∈M and n≥2.
- `TauCeti.Crystalline.pdSqZeroExt_inl_isDPMorphism` (compatibility): The inclusion A→A⊕M is a divided power morphism from (I,γ) to (I⊕M,δ).
- `TauCeti.Crystalline.pdSqZeroExt_fst_isDPMorphism` (projection): The projection A⊕M→A is a divided power morphism from (I⊕M,δ) to (I,γ).
- `TauCeti.Crystalline.pdSqZeroExt_map` (functoriality): An A-linear map u:M→N induces a divided power morphism A⊕M→A⊕N, a+m↦a+u(m), compatible with composition and identities.
- `TauCeti.Crystalline.pdSqZeroExt_derivation_iff` (characterisation): Let A₀→A be a ring map and θ:A→M an A₀-derivation. The ring map A→A⊕M, a↦a+θ(a), is a divided power morphism from (I,γ) to (I⊕M,δ) if and only if θ(γ_n(x))=γ_(n−1)(x)·θ(x) for all x∈I and n≥1.

**Unit tests.**

- `TauCeti.Crystalline.test_pdSqZeroExt_zero_module` (degenerate): For M=0 the divided power ring (A⊕0,I⊕0,δ) is (A,I,γ).
- `TauCeti.Crystalline.test_pdSqZeroExt_dpow_two` (computation): δ₂(x+z)=γ₂(x)+x·z for x∈I, z∈M, and 2·δ₂(x+z)=(x+z)².
- `TauCeti.Crystalline.test_pdSqZeroExt_F2` (non-example): For A=F₂, I=0 and M=F₂, so that B=F₂[ε]/(ε²) and J=(ε): the structure δ has δ₂(ε)=0. The ideal (ε) carries a second divided power structure δ′, with δ′_n(ε)=ε when n is a power of 2 and δ′_n(ε)=0 for the other n≥2; δ′ is not δ.

**Uses.** Stacks Lemma 60.6.3 (07HT) and Lemma 60.6.6 (07HW), first proof: A divided power derivation θ:B→M is the same as a divided power morphism b↦b+θ(b) into the square-zero extension B⊕M; this gives the universal property of Ω_(B/A,δ) and the formula Ω_(D/A,γ̄)=Ω_(B/A)⊗_B D for an envelope D. CrystallineCohomology:CR.1/envelope-differentials: Its proof extends an A-derivation of P to the square-zero divided power target D⊕M by the universal property of the envelope.

**Construction or proof.**

1. δ₁ is the identity and δ_n(J)⊆J by the formula. Scalar rule: for b=a+m and y=x+z, b·y=ax+(az+xm), bⁿ=aⁿ+n·aⁿ⁻¹m, and δ_n(by)=bⁿδ_n(y) reduces to n·γ_n(x)=x·γ_(n−1)(x).
2. Multiplication rule: δ_n(y)δ_m(y)=γ_n(x)γ_m(x)+(γ_n(x)γ_(m−1)(x)+γ_(n−1)(x)γ_m(x))z, and binom(n+m−1,n)+binom(n+m−1,m)=binom(n+m,n). Iteration rule: δ_n(δ_m(y))=γ_n(γ_m(x))+γ_(n−1)(γ_m(x))γ_(m−1)(x)z, and uniformBell(n−1,m)·binom(nm−1,m−1)=uniformBell(n,m).
3. Addition rule: compare the coefficients of 1, z and z′ in δ_n(x+x′+z+z′) and in Σ_i δ_i(x+z)δ_(n−i)(x′+z′), using the addition rule for γ.
4. The inclusion and the projection are divided power morphisms by the formula (z=0, respectively forgetting z).

**Depends on:** `mathlib:DividedPowers`, `mathlib:DividedPowers.IsDPMorphism`, `mathlib:TrivSqZeroExt`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section 60.3, Lemma 60.3.1 (tag 07HH) with proof. The statement is the lemma; the proof steps follow its direct verification of the axioms. The API items on the projection and on derivations are immediate from the formula and are how Lemmas 60.6.3 and 60.6.6 use the lemma.

**Acceptance.**

- For A=ℤ_(p), I=(p) with its canonical divided powers and M=A: δ_p(p+z)=p^p/p!+(p^(p−1)/(p−1)!)·z.
- For I=0 the structure on J=M is δ_n(z)=0 for n≥2, the divided powers of an ideal of square zero.

### compatible-divided-powers — Compatibility of divided powers with a base

**Definition:** `TauCeti.Crystalline.IsCompatibleWith`. Let (A,I,γ) and (B,J,δ) be divided power rings and φ:A→B a ring map (I need not map into J). δ is compatible with γ if there is a divided power structure γ̄ on the ideal J+IB such that φ is a divided power morphism (I,γ)→(J+IB,γ̄) and the identity of B is a divided power morphism (J,δ)→(J+IB,γ̄).

**Hypotheses and conventions.**

- (A,I,γ) and (B,J,δ) are divided power rings; φ:A→B is a ring homomorphism.

**API.**

- `TauCeti.Crystalline.IsCompatibleWith.unique` (extensionality): If δ is compatible with γ, the divided power structure γ̄ on J+IB of the definition is unique.
- `TauCeti.Crystalline.isCompatibleWith_iff_isDPMorphism` (characterisation): If IB⊆J, then δ is compatible with γ if and only if φ is a divided power morphism from (I,γ) to (J,δ).
- `TauCeti.Crystalline.isCompatibleWith_iff_extends_agree` (characterisation): δ is compatible with γ if and only if γ extends to a divided power structure γ_B on IB (φ a divided power morphism (I,γ)→(IB,γ_B)) and γ_B and δ agree on IB∩J.
- `TauCeti.Crystalline.isCompatibleWith_of_inf_eq_mul` (constructor): If γ extends to IB and IB∩J=IB·J, then δ is compatible with γ.
- `TauCeti.Crystalline.isCompatibleWith_bot` (example): Every divided power structure δ on every ideal J of B is compatible with the trivial structure on the zero ideal of A.

**Unit tests.**

- `TauCeti.Crystalline.test_isCompatibleWith_zero_base` (degenerate): For I=0 every (B,J,δ) is compatible with γ, and γ̄=δ.
- `TauCeti.Crystalline.test_isCompatibleWith_Z4` (non-example): For (A,I,γ)=(ℤ_(2),(2),canonical), B=ℤ/4 and J=(2): the divided power structure with δ₂(2)=2 is compatible with γ; the one with δ₂(2)=0 (DividedPowers.OfSquareZero.dividedPowers) is not.
- `TauCeti.Crystalline.test_isCompatibleWith_sqZero` (compatibility): For a divided power ring (A,I,γ), an A-module M and B=A⊕M: the square-zero structure on J=M (δ_n=0 for n≥2) is compatible with γ, and γ̄ is the structure of pd-square-zero-extension on I⊕M.

**Uses.** Stacks Section 60.4 (07HJ): Berthelot's crystalline site uses thickenings (B,J,δ) with δ compatible with γ; when IB⊆J this is the condition that A→B is a divided power morphism, the convention of the rest of the chapter and of this roadmap. Bhatt, Lemma 3.38; BMS1 Definition 3.22(i): 'pd-envelope compatible with divided powers on p' and 'PD thickening compatible with the PD structure on ℤ_p' are this notion for (A,I,γ)=(ℤ_p,(p),canonical); CR.0/regular-envelope and CR.0/fontaine-envelope translate them into envelopes of J+(p). CrystallineCohomology:CR.0/pd-envelope: The API items PDEnvelope.compatible_lift and PDEnvelope.eq_of_isCompatible compare envelopes with and without the base ideal.

**Construction or proof.**

1. State the predicate as the existence of a divided power structure γ̄ on J+IB with DividedPowers.IsDPMorphism γ γ̄ φ and DividedPowers.IsDPMorphism δ γ̄ (identity of B).
2. γ̄ is unique: J+IB is generated by J∪φ(I), on which γ̄ is prescribed (DividedPowers.dpow_eq_from_gens).
3. Equivalent form: γ̄ restricts to δ on J and, IB being stable under γ̄ by the sum and scalar rules, to an extension of γ on IB; conversely an extension of γ to IB that agrees with δ on IB∩J glues with δ (compatible-sum). If IB∩J=IB·J the agreement is automatic (DividedPowers.coincide_on_smul).

**Depends on:** `mathlib:DividedPowers`, `mathlib:DividedPowers.IsDPMorphism`, `mathlib:DividedPowers.dpow_eq_from_gens`, `mathlib:DividedPowers.coincide_on_smul`, `mathlib:DividedPowers.OfSquareZero.dividedPowers`, `CR.0/compatible-sum`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section 60.4 (07HJ), Definition 60.4.1 (tag 07HK) and the last paragraph of the section. The statement is the definition. The first acceptance item is the last sentence of the section ('compatibility is equivalent to the condition that (A, I, γ) → (B, J, δ) is a homomorphism of divided power rings' when IB⊆J); uniqueness of γ̄ and the criteria in the API are added and proved in proofSteps.

**Acceptance.**

- If IB⊆J, δ is compatible with γ exactly when A→B is a divided power morphism (I,γ)→(J,δ).
- On B=ℤ/4, J=(2), over (A,I,γ)=(ℤ_(2),(2),canonical): the structure with δ₂(2)=2 is compatible with γ, the one with δ₂(2)=0 is not.

### pd-envelope — Universal base-compatible divided power envelope

**Construction:** `TauCeti.Crystalline.PDEnvelope`. Let (A,I,γ) be a divided power ring, B an A-algebra and J an ideal of B with IB⊆J. There is a divided power ring (D,J̄,γ̄) with a divided power morphism (A,I,γ)→(D,J̄,γ̄) and an A-algebra map B→D sending J into J̄ such that, for every divided power ring (C,K,ε) with a divided power morphism (A,I,γ)→(C,K,ε), composition with B→D is a bijection from the divided power morphisms (D,J̄,γ̄)→(C,K,ε) over (A,I,γ) to the A-algebra maps B→C sending J into K. It is unique up to unique isomorphism and is called the divided power envelope D_(B,γ)(J) of J in B relative to (A,I,γ). The map B/J→D/J̄ induced by B→D is an isomorphism.

**Hypotheses and conventions.**

- (A,I,γ) is a divided power ring, B a commutative A-algebra with structure map φ, and J an ideal of B with IB⊆J.
- The targets of the universal property are divided power rings (C,K,ε) together with a divided power morphism (A,I,γ)→(C,K,ε).

**API.**

- `TauCeti.Crystalline.PDEnvelope.lift` (universal-property): For a divided power ring (C,K,ε) with a divided power morphism from (A,I,γ) and an A-algebra map f:B→C with f(J)⊆K there is a unique divided power morphism g:(D,J̄,γ̄)→(C,K,ε) of A-algebras with g∘(B→D)=f.
- `TauCeti.Crystalline.PDEnvelope.quotient` (equivalence): D/J̄≅B/J compatibly with B.
- `TauCeti.Crystalline.PDEnvelope.map` (functoriality): Let (A,I,γ)→(A′,I′,γ′) be a divided power morphism, B→B′ a ring map over A→A′, and J⊆B, J′⊆B′ ideals with IB⊆J, I′B′⊆J′ and JB′⊆J′. There is a unique divided power morphism D_(B,γ)(J)→D_(B′,γ′)(J′) compatible with B→B′; these maps are compatible with composition, and the identity induces the identity.
- `TauCeti.Crystalline.PDEnvelope.span_dpow_image` (relation): The elements γ̄_n(x), n≥1, x in the image of J, generate J̄ as an ideal of D and generate D as a B-algebra.
- `TauCeti.Crystalline.PDEnvelope.presentation` (characterisation): Let (B,I,γ) be a divided power ring, J an ideal with I⊆J⊆B and (f_t)_(t∈T) elements of J with J=I+(f_t). The divided power morphism Ψ:(B⟨x_t⟩,IB⟨x_t⟩+B⟨x_t⟩₊,δ)→D_(B,γ)(J) with x_t↦(image of f_t) is surjective, and its kernel is the ideal generated by the x_t−f_t and the δ_n(Σ_t r_t x_t−r₀), n≥1, for all r₀∈I and finitely supported (r_t)∈B^(T) with Σ_t r_t f_t=r₀.
- `TauCeti.Crystalline.PDEnvelope.compatible_lift` (universal-property): Let J₀ be any ideal of B, D=D_(B,γ)(J₀+IB) with divided power ideal J̄, and J̄₀⊆J̄ the sub-PD ideal generated by the image of J₀. Then J̄=J̄₀+ID, the divided powers of J̄₀ are compatible with γ, and for every A-algebra C with a divided power ideal (K,ε) compatible with γ and every A-algebra map f:B→C with f(J₀)⊆K there is a unique A-algebra map g:D→C with g∘(B→D)=f that is a divided power morphism (J̄₀,γ̄)→(K,ε).
- `TauCeti.Crystalline.PDEnvelope.eq_of_isCompatible` (equivalence): Let J₀ be an ideal of B and (D₀,J̄₀,δ₀) the envelope of J₀ in B relative to the trivial divided power structure on the zero ideal of A. If δ₀ is compatible with γ, with glued structure γ̄ on J̄₀+ID₀, then (D₀,J̄₀+ID₀,γ̄) is the envelope D_(B,γ)(J₀+IB): the canonical map D₀→D_(B,γ)(J₀+IB) is an isomorphism of B-algebras. The hypothesis holds if γ extends to ID₀ and ID₀∩J̄₀=ID₀·J̄₀; for (A,I,γ)=(ℤ_(p),(p),canonical) this is the case when B/J₀ is p-torsion-free, and when B is a ℤ/p^n-algebra with B/J₀ flat over ℤ/p^n.

**Unit tests.**

- `TauCeti.Crystalline.test_envelope_zero` (degenerate): If I=J=0, D=B with zero PD ideal.
- `TauCeti.Crystalline.test_envelope_existing` (characterisation): If (B,J,δ) is a divided power ring and A→B is a divided power morphism (I,γ)→(J,δ), there is a divided power morphism r:D_(B,γ)(J)→B with r∘(B→D)=id_B; in particular B→D is injective.
- `TauCeti.Crystalline.test_envelope_Fp_t` (computation): For A=F_p, I=0, B=F_p[t], J=(t): D=F_p⟨t⟩ and t^p=0 in D, so B→D is not injective.
- `TauCeti.Crystalline.test_envelope_truncated` (non-example): For A=F_p, I=0, B=F_p[t]/(t^p) and J=(t) with the divided powers γ_n(t)=tⁿ/n! for n<p and γ_n(t)=0 for n≥p: D_B(J)=F_p⟨t⟩, and the retraction D→B kills t^[n] for n≥p; so D≠B although J has divided powers.
- `TauCeti.Crystalline.test_envelope_two_bases` (non-example): For B=ℤ_(p) and J=(p): relative to (ℤ_(p),(p),canonical) the envelope is ℤ_(p); relative to the trivial base (ℤ_(p),0) it is ℤ_(p)⟨x⟩/(x−p), in which the class of x^[p]−p^p/p! is non-zero and killed by p.

**Uses.** Stacks §§60.2, 60.5, 60.6, 60.17, 60.21, 60.25; Langer–Zink §3; CR.1/crystalline-site: Turns an embedding or graph ideal into a universal PD thickening; lift, quotient and functoriality supply crystal evaluation and comparison maps.

**Construction or proof.**

1. Construction. Let Γ=Γ_B(J) be the divided power algebra of the B-module J with its canonical divided powers on Γ⁺ (gamma-canonical-pd). Let 𝔎 be the smallest ideal of Γ that contains dp₁(j)−j for j∈J and dp_n(φ(a))−φ(γ_n(a)) for a∈I, n≥1, and whose intersection with Γ⁺ is a sub-PD ideal of Γ⁺; it exists because an intersection of ideals with these properties has them and Γ itself has them. Put D=Γ/𝔎, let J̄ be the image of Γ⁺ and γ̄ the quotient divided powers (DividedPowers.Quotient.dividedPowers).
2. The map B→D sends j∈J to the class of dp₁(j), which lies in J̄. A→D is a divided power morphism: for a∈I, φ(a)∈J because IB⊆J, and γ̄_n(φ(a))=dp_n(φ(a))=φ(γ_n(a)) in D.
3. Universal property. Given (C,K,ε) over (A,I,γ) and an A-algebra map ψ:B→C with ψ(J)⊆K, gamma-canonical-pd gives the unique divided power B-algebra map g:Γ→C with g(dp₁(j))=ψ(j). Its kernel contains both families of relations and meets Γ⁺ in a sub-PD ideal (DividedPowers.isSubDPIdeal_ker), hence contains 𝔎; so g factors through D. Uniqueness holds because D is generated as a B-algebra by the γ̄_n of the images of elements of J.
4. Quotient. With ε_Γ:Γ→B the augmentation, D/J̄=Γ/(𝔎+Γ⁺)=B/ε_Γ(𝔎). ε_Γ(𝔎) contains J (image of dp₁(j)−j). Conversely 𝔎⊆ε_Γ⁻¹(J)=JΓ+Γ⁺, because this ideal contains the relations (φ(γ_n(a))∈IB⊆J) and meets Γ⁺ in Γ⁺. Hence D/J̄=B/J.

**Depends on:** `CR.0/gamma-canonical-pd`, `CR.0/gamma-augmentation`, `CR.0/gamma-augmentation-ideal`, `CR.0/pd-polynomial`, `CR.0/compatible-divided-powers`, `CR.0/product-intersection-gluing`, `mathlib:DividedPowers.Quotient.dividedPowers`, `mathlib:DividedPowers.isSubDPIdeal_ker`, `mathlib:DividedPowers.IsDPMorphism.on_span`, `mathlib:DividedPowerAlgebra`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section 60.2 (07H7): Lemma 60.2.1 (07H8), Definition 60.2.2 (07H9) and the properties listed after it; presentation: Lemma 60.2.4 (07HC). The statement is Lemma 60.2.1 with Definition 60.2.2 and the properties listed after it (B→D→B/J, J̄ the kernel). The source proves existence by a representability lemma (Divided Power Algebra, Lemma 23.3.3); the node constructs D as a quotient of Γ_B(J) and proves the universal property directly. The presentation of Lemma 60.2.4, valid when the base divided powers live on an ideal of B itself, is the API item PDEnvelope.presentation.

**Acceptance.**

- Zero ideal: for I=0 and J=0, D=B with zero divided power ideal.
- Canonical p-PD ideal: relative to (ℤ_(p),(p),canonical) the envelope of (p) in ℤ_(p) is ℤ_(p); relative to the trivial base (ℤ_(p),0) it is ℤ_(p)⟨x⟩/(x−p), which has p-torsion.
- A torsion ring where division by n! is invalid: for A=F_p, I=0, B=F_p[t], J=(t): D=F_p⟨t⟩, in which t^p=p!·t^[p]=0 while t^[p]≠0; B→D is not injective.

**Signature component.** The basic relative envelope, lift, quotient, general map, generators and presentation have typed signatures. The compatible-lift statement uses the sub-PD ideal generated by J₀; ideal_eq_subIdeal_sup and subPowers_isCompatibleWith supply its other clauses. Equalities of envelopes are ring equivalences compatible with B and PD operations, rather than literal carrier equalities.

### envelope-quotient-transitivity — Envelope quotient and transitivity

**Theorem:** `TauCeti.Crystalline.envelopeQuotientTransitivity`. (1) Quotients. Let (A,I,γ) be a divided power ring, φ:B′→B a surjection of A-algebras with kernel K, J an ideal of B with IB⊆J and J′=φ⁻¹(J). Write (D′,J̄′,γ̄′)=D_(B′,γ)(J′). The divided power morphism D′→D_(B,γ)(J) induced by φ is surjective, and its kernel is the ideal K′ generated by the γ̄′_n(k), n≥1, k in the image of K; K′ is a sub-PD ideal of J̄′ and D_(B,γ)(J)=(D′/K′,J̄′/K′,γ̄′). Consequently, for ideals K⊆L⊆J′ of B′, the envelope of J′/L in B′/L is the quotient of the envelope of J′/K in B′/K by the ideal generated by the divided powers of the image of L. (2) Change of base. If A→A′ is a ring map such that γ extends to a divided power structure γ′ on IA′, B is an A′-algebra and J an ideal of B with IB⊆J, then D_(B,γ)(J)=D_(B,γ′)(J): the two universal properties coincide. (3) Envelope over an envelope. Let A″ be an A-algebra, J″ an ideal of A″ with IA″⊆J″ and (A′,I′,γ′)=D_(A″,γ)(J″). Let B″ be an A″-algebra and J an ideal of B″ with J″B″⊆J. Then the canonical divided power morphism D_(B″,γ)(J)→D_(B″⊗_(A″)A′,γ′)(J̃), where J̃ is the ideal generated by the images of J and of I′, is an isomorphism.

**Hypotheses and conventions.**

- (A,I,γ) is a divided power ring; all rings are commutative.
- (1): φ:B′→B is a surjective A-algebra map with kernel K; J is an ideal of B with IB⊆J and J′ its preimage (equivalently K⊆J′ and J=φ(J′)); in the last sentence K⊆L⊆J′.
- (2): γ′ is a divided power structure on IA′ for which A→A′ is a divided power morphism (I,γ)→(IA′,γ′); B is an A′-algebra and J an ideal of B with IB⊆J.
- (3): (A′,I′,γ′) is the divided power envelope of J″ in A″ relative to (A,I,γ); B″ is an A″-algebra and J an ideal of B″ containing J″B″.

**Construction or proof.**

1. (1) The map D′→D=D_(B,γ)(J) exists by the universal property of D′. It is surjective because D is generated as a B-algebra by the γ̄_n of the image of J (PDEnvelope.span_dpow_image) and J′→J is surjective. Being a divided power morphism, it kills γ̄′_n(k) for k∈K and n≥1.
2. K′ is the carrier of the sub-PD ideal generated by the image of K (DividedPowers.SubDPIdeal.span_carrier_eq_dpow_span), so D′/K′ carries the quotient divided powers (DividedPowers.Quotient.dividedPowers). B′→D′/K′ kills K (take n=1), hence factors through B and sends J into J̄′/K′; the universal property of D gives D→D′/K′, inverse to D′/K′→D. The sentence about K⊆L is (1) applied to B′→B′/K and to B′→B′/L.
3. (2) Let C be an A′-algebra with a divided power ideal (K,ε). If A→C is a divided power morphism for γ, then A′→C is one for γ′: γ′_n(Σa′_i y_i)=Σ_(Σn_i=n)∏a′_i^(n_i)γ_(n_i)(y_i) for y_i∈I (API item dpow_sum_mul_map_eq_extensionCoefficient of CR.0/extension-coefficient; γ′ is unique by CR.0/extension-uniqueness), and ε obeys the same sum and scalar rules. The converse is composition. So the two envelopes corepresent the same functor.
4. (3) Let (C,K,ε) be a divided power ring over (A,I,γ) and ψ:B″→C an A-algebra map with ψ(J)⊆K. Its restriction to A″ sends J″ into K and extends uniquely to a divided power morphism α:A′→C; then (C,K,ε) is a divided power ring over (A′,I′,γ′) and ψ⊗α:B″⊗_(A″)A′→C sends J̃ into K. Conversely restrict along B″→B″⊗_(A″)A′, using that A→A′ is a divided power morphism. The two assignments are inverse to each other, so both sides corepresent the same functor.

**Depends on:** `CR.0/pd-envelope`, `CR.0/extension-uniqueness`, `mathlib:DividedPowers.Quotient.dividedPowers`, `mathlib:DividedPowers.SubDPIdeal.span_carrier_eq_dpow_span`, `CR.0/extension-coefficient`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section 60.2 (07H7), Lemma 60.2.3 (tag 07HB) with proof. Part (1) is the lemma; the sentence about nested kernels is the lemma applied twice. Parts (2) and (3) are not stated as results in the source: (2) is used in the paragraph before Lemma 60.2.4, (3) is proved in proofSteps from the universal properties.; [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section 60.2, paragraph between Lemma 60.2.3 (07HB) and Lemma 60.2.4 (07HC). The source uses part (2) for a polynomial algebra P over A, where γ extends by flatness, without proof.

**Acceptance.**

- (1) For A=F_p, I=0, B′=F_p[t]→B=F_p[t]/(t^p), J′=(t): the image of t^p in D′=F_p⟨t⟩ is p!·t^[p]=0, so K′=0 and D_B((t))=F_p⟨t⟩: the envelope does not see the relation t^p=0.
- (1) For a ℤ_(p)-algebra A, the base (ℤ_(p),(p),canonical), an ideal J⊇pA and K=pA: K′=pD because γ̄_n(pa)=aⁿ·(pⁿ/n!)∈pD; hence D_(A/p)(J/pA)=D_A(J)/pD.
- (2) needs γ′ to be an extension of γ: for A=F_p, I=0 and A′=B=F_p[t]/(t^p) with I′=J=(t) and γ′_n(t)=tⁿ/n! (n<p), 0 (n≥p), D_(B,γ′)(J)=B but D_(B,0)(J)=F_p⟨t⟩.

**Signature component.** The typed envelopeQuotientTransitivity states the surjection in part (1), identifies its kernel with the ideal generated by positive divided powers, and gives compatibility on generators and divided powers. It does not separately type sub-PD stability or the quotient PD structure, the repeated-quotient consequence, part (2) change of base, or part (3) envelope over an envelope. Those additional clauses remain the full packet contract.

### envelope-base-change — Exact base change of divided power envelopes

**Comparison:** `TauCeti.Crystalline.envelopeBaseChange`. (1) Let (A,I,γ) be a divided power ring and B→B′ a homomorphism of A-algebras such that B/IB→B′/IB′ is flat and Tor₁^B(B′,B/IB)=0 (equivalently, IB⊗_B B′→B′ is injective). Then for every ideal J of B with IB⊆J the canonical map D_(B,γ)(J)⊗_B B′→D_(B′,γ)(JB′) is an isomorphism. (2) Let (B,I,γ)→(B′,I′,γ′) be a homomorphism of divided power rings and I⊆J⊆B, I′⊆J′⊆B′ ideals such that B/I→B′/I′ is flat and J′=JB′+I′. Then the canonical map D_(B,γ)(J)⊗_B B′→D_(B′,γ′)(J′) is an isomorphism. In both cases the canonical map is the B′-linear extension of the divided power morphism between the envelopes given by PDEnvelope.map.

**Hypotheses and conventions.**

- (1): (A,I,γ) is a divided power ring; B→B′ is a map of A-algebras; B/IB→B′/IB′ is flat; Tor₁^B(B′,B/IB)=0; J is an ideal of B with IB⊆J.
- (2): (B,I,γ)→(B′,I′,γ′) is a divided power morphism; I⊆J⊆B and I′⊆J′⊆B′ are ideals; B/I→B′/I′ is flat; J′=JB′+I′.

**Construction or proof.**

1. (1) It suffices to put divided powers, compatible with those of D=D_(B,γ)(J), on the ideal generated by J̄ in D⊗_B B′; the universal property of D_(B′,γ)(JB′) then gives the inverse of the canonical map.
2. Choose a polynomial B-algebra P with a surjection P→B′, with kernel 𝔞. D→D⊗_B P is flat, so γ̄ extends to the ideal generated by J̄ in D⊗_B P (flat-extension). Tor₁^B(B′,B/IB)=0 gives 𝔞∩IP=I𝔞, and flatness of B′/IB′ over B/IB then gives that B/J⊗_B 𝔞→B/J⊗_B P is injective; hence the kernel of D⊗_B P→D⊗_B B′ meets J̄⊗_B P in the image of J̄⊗_B 𝔞.
3. That image is generated by the elements f⊗a (f∈J̄, a∈𝔞), and γ̄_n(f⊗a)=γ̄_n(f)⊗aⁿ lies in it; so it is a sub-PD ideal (DividedPowers.span_isSubDPIdeal_iff) and the divided powers descend to D⊗_B B′ (DividedPowers.Quotient.OfSurjective.dividedPowers).
4. (2) Choose f_t∈J generating J modulo I and write D=B⟨x_t⟩/K by PDEnvelope.presentation. Then D⊗_B B′=B′⟨x_t⟩/K′ with K′ generated by the images of the generators of K, and the images f′_t of the f_t generate J′ modulo I′ because J′=JB′+I′. It remains to show δ′_n(Σ_t r′_t x_t−r′₀)∈K′ for every relation Σ_t r′_t f′_t=r′₀∈I′ over B′ and n≥1.
5. By the equational criterion for the flat map B/I→B′/I′ (Module.Flat.isTrivialRelation_of_sum_smul_eq_zero) there are relations Σ_t r_(jt)f_t=r_(j0)∈I over B and elements c_j∈B′ with i′_t=r′_t−Σ_j c_j r_(jt)∈I′. Then Σ_t r′_t x_t−r′₀=Σ_t i′_t(x_t−f′_t)+Σ_j c_j(Σ_t r_(jt)x_t−r_(j0)); expanding δ′_n by the sum and scalar rules, every term has a factor δ′_m(i′_t(x_t−f′_t))=(x_t−f′_t)^m·γ′_m(i′_t) or δ_m(Σ_t r_(jt)x_t−r_(j0)) with m≥1, and both lie in K′.

**Depends on:** `CR.0/pd-envelope`, `CR.0/pd-polynomial`, `CR.0/flat-extension`, `mathlib:Module.Flat.isTrivialRelation_of_sum_smul_eq_zero`, `mathlib:DividedPowers.span_isSubDPIdeal_iff`, `mathlib:DividedPowers.Quotient.OfSurjective.dividedPowers`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section 60.2 (07H7), Lemma 60.2.6 (tag 07HD) with proof. Part (1) is this lemma with its two hypotheses.; [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section 60.2, Lemma 60.2.7 (tag 07HE) with proof. Part (2) is this lemma with its two hypotheses.

**Acceptance.**

- Flat case: for B′=B[y] the canonical map D_(B,γ)(J)[y]→D_(B[y],γ)(JB[y]) is an isomorphism.
- Hypothesis (1) is needed: for A=ℤ_(p), I=0, B=ℤ_(p)→B′=F_p and J=(p), D_B(J)=ℤ_(p)⟨x⟩/(x−p), so D_B(J)⊗_B B′=F_p⟨x⟩/(x) has F_p-basis x^[pj], j≥0, whereas D_(B′)(JB′)=D_(F_p)(0)=F_p; here B/IB→B′/IB′ is not flat.

**Signature component.** Neither part (1) nor part (2) is an executable Lean declaration in this file. The exact two tensor-product comparisons, their flatness and Tor hypotheses, and the canonical maps are recorded in the omission register. The general PDEnvelope.map is typed, but is not a proof or a typed signature of these base-change isomorphisms.

### envelope-localization — Localization of divided power envelopes

**Comparison:** `TauCeti.Crystalline.envelopeLocalization`. Let (A,I,γ) be a divided power ring, B an A-algebra, J an ideal of B with IB⊆J and S⊆B a multiplicative subset. Write (D,J̄,γ̄)=D_(B,γ)(J). Then S⁻¹D=S⁻¹B⊗_B D, with the divided powers γ̄_n(x/s)=γ̄_n(x)/sⁿ (x∈J̄, s∈S) on S⁻¹J̄, is the divided power envelope of S⁻¹J in S⁻¹B relative to (A,I,γ): the canonical map S⁻¹B⊗_B D_(B,γ)(J)→D_(S⁻¹B,γ)(S⁻¹J) is an isomorphism. If T⊆A is a multiplicative subset whose image in B lies in S and γ_T denotes the extension of γ to T⁻¹I⊆T⁻¹A, the same ring is also the envelope of S⁻¹J relative to (T⁻¹A,T⁻¹I,γ_T).

**Hypotheses and conventions.**

- (A,I,γ) is a divided power ring, B a commutative A-algebra, J an ideal of B with IB⊆J, and S a multiplicative subset of B.
- In the last sentence T is a multiplicative subset of A whose image in B is contained in S.

**Construction or proof.**

1. localization-formula, applied to (D,J̄,γ̄) and the image of S, gives the divided power structure on S⁻¹J̄ with γ̄_n(x/s)=γ̄_n(x)/sⁿ, and D→S⁻¹D is a divided power morphism. So (S⁻¹D,S⁻¹J̄) is a divided power ring over (A,I,γ) receiving S⁻¹B, and S⁻¹J maps into S⁻¹J̄.
2. Universal property. For a divided power ring (C,K,ε) over (A,I,γ), an A-algebra map S⁻¹B→C sending S⁻¹J into K is a map B→C sending J into K and S to units, that is a divided power morphism g:D→C sending S to units, that is a ring map S⁻¹D→C whose restriction to D is a divided power morphism; such a map is a divided power morphism on S⁻¹J̄ because ε_n(g(x)/g(s))=g(s)^(−n)·ε_n(g(x)).
3. Alternatively B→S⁻¹B is flat (IsLocalization.flat), so the hypotheses of envelope-base-change (1) hold. The last sentence is envelope-quotient-transitivity (2) for A→T⁻¹A.

**Depends on:** `CR.0/pd-envelope`, `CR.0/localization-formula`, `CR.0/envelope-base-change`, `CR.0/envelope-quotient-transitivity`, `mathlib:IsLocalization.flat`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section 60.2 (07H7), the paragraph before Lemma 60.2.6 (07HD), and Lemma 60.2.6. The source states that the envelope commutes with localization as a consequence of Lemma 60.2.6. The formula for the divided powers on the localization and the statement over a localized base are added and proved in proofSteps.

**Acceptance.**

- For A=F_p, I=0, B=F_p[t], J=(t) and S the powers of t: S⁻¹D_B(J)=F_p⟨t⟩[1/t]=0 because t^p=0 in F_p⟨t⟩, and D_(F_p[t,1/t])((1))=0 because 1=1^p=p!·γ_p(1)=0.
- If S consists of units of B, both sides are D_(B,γ)(J).

**Signature component.** The typed envelopeLocalization supplies the canonical A-algebra map, inversion of the image of S, and the ordinary ring localization universal property. The divided-power formula is typed separately by TauCeti.PD.localization_dpow. This theorem does not itself type compatibility of its canonical map with divided powers, the displayed tensor-product equivalence, or simultaneous localization of the base A at T; these are additional clauses of the full contract.

### completed-envelope — Completed PD envelopes and the derived-completion comparison

**Construction:** `TauCeti.Crystalline.completedEnvelope`. Let p be a prime and (D,J̄,γ̄) a divided power ring in which p is nilpotent in D/J̄; this holds for an envelope D=D_(B,γ)(J) whenever p is nilpotent in B/J. Let D^=lim_e D/p^eD be the p-adic completion (AdicCompletion (p) D). Then: (1) D^→D/J̄ is surjective and its kernel J̄^ is the p-adic completion of J̄; (2) each γ̄_n is continuous for the p-adic topology of J̄ and extends uniquely to maps γ̄^_n:J̄^→J̄^, which form a divided power structure on J̄^, and D→D^ is a divided power morphism; (3) if D is a ℤ_(p)-algebra and p^t∈J̄, then for every e>t the ideal p^eD⊆J̄ is a sub-PD ideal and (D^,J̄^,γ̄^)=lim_e(D/p^eD,J̄/p^eD,γ̄) as divided power rings. Relation with derived completion: if D has bounded p-power torsion, the derived p-completion of D is D^ placed in degree 0; if D is p-torsion-free, D⊗^L_ℤ ℤ/p^e=D/p^eD for all e≥1.

**Hypotheses and conventions.**

- p is a prime; (D,J̄,γ̄) is a divided power ring with p^t∈J̄ for some t≥1 (p is nilpotent in D/J̄).
- (3): every integer prime to p is invertible in D.
- Derived statements: D has bounded p-power torsion (D[p^∞]=D[p^N] for some N), respectively D is p-torsion-free.

**API.**

- `TauCeti.Crystalline.completedEnvelope_reduction` (compatibility): For p-torsionfree D, LΛ_p(D)⊗^L Z/p^e≅D/p^e.
- `TauCeti.Crystalline.completedEnvelope_lift` (universal-property): Let (C,K,ε) be a divided power ring with C p-adically complete and separated and K p-adically closed. Every divided power morphism (D,J̄,γ̄)→(C,K,ε) extends uniquely to a divided power morphism (D^,J̄^,γ̄^)→(C,K,ε). In particular this applies when p is nilpotent in C/K, since then K contains a power of p and is open and closed.
- `TauCeti.Crystalline.completedEnvelope_functorial` (functoriality): A divided power morphism f:(D,J̄,γ̄)→(D′,J̄′,γ̄′) between divided power rings with p nilpotent in D/J̄ and in D′/J̄′ induces a divided power morphism f^:(D^,J̄^,γ̄^)→(D′^,J̄′^,γ̄′^) extending f; (g∘f)^=g^∘f^ and id^=id.
- `TauCeti.Crystalline.completedEnvelope_mod_pow` (equivalence): Let (A,I,γ) be a divided power ring with A a ℤ_(p)-algebra, A→C a ring map with IC=0 and p^t·C=0, P→C a surjection of A-algebras with kernel J and D=D_(P,γ)(J). For e≥1 let D_e=D_(P/p^eP,γ)(J_e), J_e the image of J. Then for every e>t: D^/p^eD^=D/p^eD=D_e as divided power rings.
- `TauCeti.Crystalline.completedEnvelope_eq_limit` (characterisation): In the situation of completedEnvelope_mod_pow, (D^,J̄^,γ̄^)=lim_e(D_e,J̄_e,γ̄) in the category of divided power rings.

**Unit tests.**

- `TauCeti.Crystalline.test_completedEnvelope_Zp` (compatibility): For (D,J̄,γ̄)=(ℤ_(p),(p),canonical), p is nilpotent in D/J̄=F_p and the completed divided power ring (D^,J̄^,γ̄^) is (ℤ_p,(p),PadicInt.dividedPowers p), for every prime p including p=2.
- `TauCeti.Crystalline.test_completedEnvelope_modp` (computation): A p-killed envelope has derived completion equal to itself in degree0.
- `TauCeti.Crystalline.test_completedEnvelope_p2` (non-example): In ℤ₂ with the canonical divided powers on (2): γ_(2^a)(2) is 2 times a unit for every a≥0, so γ_n(2) does not tend to 0 and Fⁿ((2))=(2) for all n≥1; in ℤ_p with p odd, γ_n(p)→0 and the intersection of the Fⁿ((p)) is 0.

**Uses.** Stacks Lemma 60.5.5 (07KG) and Section 60.17 (the rings D, D(n) and D_e); CrystallineCohomology:CR.1/pd-stratification: The p-adically completed envelope of a polynomial embedding and its reductions D_e=D/p^eD, which are the envelopes of the reductions, are the rings on which crystals and their connections are evaluated. BMS1 Definition 3.22(i); CrystallineCohomology:CR.0/fontaine-envelope: A_cris is the p-adic completion of an envelope whose divided power ideal contains p; its divided powers and its universal property among p-adically complete targets come from this node.

**Construction or proof.**

1. Let p^t∈J̄. D^→D/J̄ is the composite D^→D/p^tD→D/J̄, hence surjective; p^eJ̄⊆p^eD∩J̄⊆p^(e−t)J̄ for e≥t shows that its kernel is the p-adic completion of J̄.
2. For x,y∈J̄, γ̄_n(x+p^e y)=Σ_(i+j=n)p^(je)γ̄_i(x)γ̄_j(y)≡γ̄_n(x) modulo p^eJ̄; so γ̄_n induces compatible maps J̄/p^eJ̄→J̄/p^eJ̄ and a map γ̄^_n on J̄^, and the axioms pass to the limit.
3. If D is a ℤ_(p)-algebra and e>t: for n≥2, γ̄_n(p^e a)=pⁿ·γ̄_n(p^(e−1)a)=(pⁿ/n!)·p^(n(e−1))·aⁿ∈p^eD, because pⁿ/n!∈ℤ_(p) and n(e−1)≥e. So p^eD is a sub-PD ideal, D/p^eD inherits divided powers (DividedPowers.Quotient.dividedPowers), and (D^,J̄^,γ̄^) is their limit.
4. Derived completion. For a ring D with bounded p-power torsion the derived p-completion is Rlim_e D/p^eD (comparison of derived completion with the tower of ordinary quotients, DerivedDeRhamCohomology:DD.1); the tower has surjective transition maps, so this is D^ in degree 0. For p-torsion-free D, multiplication by p^e is injective, so D⊗^L_ℤ ℤ/p^e=D/p^eD.
5. For the extension property, the completion universal property gives the ring map. Closedness of K ensures that it carries J̄^ into K. Continuity of each divided power and density then give the PD identities. The hypothesis p nilpotent in C/K is a sufficient special case, not necessary.

**Depends on:** `CR.0/pd-envelope`, `DerivedDeRhamCohomology:DD.1/derived-completion`, `mathlib:AdicCompletion`, `mathlib:DividedPowers.Quotient.dividedPowers`, `DerivedDeRhamCohomology:DD.1/ordinary-quotient-completion`, `EnhancedDerivedSheaves:E2/surjective-system-derived-limit`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section 60.5 (07HL): Remark 60.5.4 (07KH) and Lemma 60.5.5 (07KG) with proof. The source applies Lemma 23.4.5 to an envelope D_(P,γ)(J) with p nilpotent in P/J and lists the properties of the completion; the API items completedEnvelope_mod_pow and completedEnvelope_eq_limit are parts (2) and (4) of Lemma 60.5.5. The sentences on derived completion are not in this source.; [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Section 23.4, Lemma 23.4.5 (tag 07KD) with proof. Parts (1)–(3) of the statement are this lemma, with its hypothesis 'p is nilpotent in A/I' and, for the last part, 'A is a ℤ_(p)-algebra'.

**Acceptance.**

- Canonical p-PD ideal: for (D,J̄,γ̄)=(ℤ_(p),(p),canonical) the completed divided power ring is (ℤ_p,(p),PadicInt.dividedPowers p), for every prime p including 2.
- For P=ℤ_(p)[t]→F_p (t↦0), J=(p,t), relative to (ℤ_(p),(p),γ): D=ℤ_(p)⟨t⟩; D^ is its p-adic completion, J̄^ the closure of (p)+(t^[n]:n≥1), and D^/p^eD^=(ℤ/p^e)⟨t⟩=D_((ℤ/p^e)[t],γ)((p,t)) for every e≥2.
- If pD=0 then D^=D, and the derived p-completion of D is D in degree 0.

**Signature component.** The typed lift now assumes K=⋂_n(K+p^nC), expressing p-adic closedness directly in ideals. The derived-completion clauses remain dependent on DD.1; the typed inverse-limit assertion is given by its compatible-family universal property.

### envelope-add-variables — Divided power envelopes after adjoining variables

**Lemma:** `TauCeti.Crystalline.PDEnvelope.addVariables`. Let (A,I,γ) be a divided power ring, B an A-algebra, J an ideal of B with IB⊆J, and W a set. Write (D,J̄,γ̄)=D_(B,γ)(J). Then the divided power envelope of the ideal JB[x_w]+(x_w:w∈W) of the polynomial ring B[x_w:w∈W], relative to (A,I,γ), is the divided power polynomial algebra D⟨x_w:w∈W⟩ over the divided power ring (D,J̄,γ̄), with divided power ideal J̄·D⟨x_w⟩+D⟨x_w⟩₊ and the ring map B[x_w]→D⟨x_w⟩ extending B→D and sending x_w to x_w: the canonical divided power morphism D_(B[x_w],γ)(JB[x_w]+(x_w))→D⟨x_w⟩ is an isomorphism.

**Hypotheses and conventions.**

- (A,I,γ) is a divided power ring, B a commutative A-algebra and J an ideal of B with IB⊆J.
- W is an arbitrary set of variables.

**Construction or proof.**

1. For a divided power ring (C,K,ε) over (A,I,γ), pd-polynomial applied to the divided power ring (D,J̄,γ̄) identifies divided power morphisms D⟨x_w⟩→C over (A,I,γ) with pairs (g,(k_w)) of a divided power morphism g:D→C and elements k_w∈K.
2. pd-envelope identifies such g with A-algebra maps f:B→C with f(J)⊆K. A pair (f,(k_w)) is the same as an A-algebra map B[x_w]→C sending JB[x_w]+(x_w) into K.
3. Hence D⟨x_w⟩, with the map from B[x_w], has the universal property of the envelope of JB[x_w]+(x_w), and the canonical map is an isomorphism.

**Depends on:** `CR.0/pd-envelope`, `CR.0/pd-polynomial`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section 60.2 (07H7), Lemma 60.2.5 (tag 07KE) with proof. The statement is the lemma. The proof steps are the second proof indicated in the source, from the universal properties of the divided power polynomial algebra and of the envelope.

**Acceptance.**

- For B=A=F_p, I=J=0 and one variable t: D_(F_p[t])((t))=F_p⟨t⟩, in which t^p=p!·t^[p]=0.
- For (A,I,γ)=(ℤ_(p),(p),canonical), B=A, J=(p) and one variable t: D_(ℤ_(p)[t],γ)((p,t))=ℤ_(p)⟨t⟩ with divided power ideal (p)+(t^[n]:n≥1).

### regular-envelope — Envelopes of regular immersions

**Comparison:** `TauCeti.Crystalline.regularEnvelope`. For elements f₁,…,f_r of a ring, the Koszul relations are the elements f_j e_i−f_i e_j of its r-th power. (0) General divided power base. Let (B,I,γ) be a divided power ring, f₁,…,f_r∈B and J=I+(f₁,…,f_r). Assume (K): every (r_t)∈B^r with Σ_t r_t f_t∈I is congruent modulo I·B^r to a B-linear combination of Koszul relations. Then the surjection Ψ:B⟨x₁,…,x_r⟩→D_(B,γ)(J), x_t↦f_t, of PDEnvelope.presentation has kernel (x₁−f₁,…,x_r−f_r): D_(B,γ)(J)=B⟨x₁,…,x_r⟩/(x_t−f_t), with divided power ideal generated by I and the x_t^[n], n≥1. For r=1, (K) says that f₁ is a non-zero-divisor on B/I; in general (K) holds when the images of f₁,…,f_r in B/I form a regular sequence, or a Koszul-regular one. (1) Characteristic p (Bhatt, Lemma 3.37). Let A be an F_p-algebra and f₁,…,f_r a regular sequence in A, I=(f₁,…,f_r), with the trivial divided power base; for (b), (c) and the Tor statement in (d) assume moreover that each f_t is a non-zero-divisor on A (automatic when A is Noetherian local; without it D_A((f_t)) is a proper quotient of A⟨x_t⟩/(x_t−f_t) in general, and (b), (c), (d) hold for the rings A⟨x_t⟩/(x_t−f_t) in place of D_A((f_t))). Then (a) D_A(I)=A⟨x₁,…,x_r⟩/(x_t−f_t); (b) the natural map ⊗_A D_A((f_t))→D_A(I) from the tensor product of the principal envelopes D_A((f_t))=A⟨x_t⟩/(x_t−f_t) is an isomorphism; (c) D_A((f_t)) is a free A/(f_t^p)-module on the γ_(jp)(f_t), j≥0, so D_A(I) is a free A/(f₁^p,…,f_r^p)-module on the products ∏_t γ_(j_t p)(f_t), j₁,…,j_r≥0; (d) x₁−f₁,…,x_r−f_r is a regular sequence on A⟨x₁,…,x_r⟩=⊗_A A⟨x_t⟩, so the Koszul complex on it is a resolution of D_A(I) by free A-modules and the derived tensor product ⊗^L_A D_A((f_t)) is D_A(I) in degree 0 (Tor_k^A(D_A((f₁,…,f_(t−1))),D_A((f_t)))=0 for k>0). (2) Flat ℤ/p^n-algebras (Bhatt, Lemma 3.38). Let A be a flat ℤ/p^n-algebra, f₁,…,f_r a regular sequence in A with A/I flat over ℤ/p^n, I=(f₁,…,f_r), and D=D_(A,γ)(I+pA) the envelope relative to (ℤ_(p),(p),γ), γ the canonical divided powers on (p). Then D=A⟨x₁,…,x_r⟩/(x_t−f_t), it coincides with the envelope of I over the trivial base, D is flat over ℤ/p^n, and D/pD=D_(A/p)((I+pA)/pA), the envelope of the image of I in the F_p-algebra A/p.

**Hypotheses and conventions.**

- (0): (B,I,γ) is a divided power ring, f₁,…,f_r∈B, and (K) holds: if Σ_t r_t f_t∈I with r_t∈B, then (r_t)−Σ_(i<j)c_(ij)(f_j e_i−f_i e_j)∈I^r for some c_(ij)∈B.
- (1): p is a prime, A an F_p-algebra and f₁,…,f_r a regular sequence in A (RingTheory.Sequence.IsRegular A [f₁,…,f_r]; only weak regularity is used); the divided power base is (F_p,0). For (1)(b), (1)(c) and the Tor statement of (1)(d) each f_t is moreover a non-zero-divisor on A.
- (2): p is a prime, n≥1, A a flat ℤ/p^n-algebra, f₁,…,f_r a regular sequence in A and A/(f₁,…,f_r) flat over ℤ/p^n; the divided power base is (ℤ_(p),(p),γ) with the canonical divided powers.

**Construction or proof.**

1. (0) By PDEnvelope.presentation the kernel of Ψ is generated by the x_t−f_t and the δ_n(Σ_t r_t x_t−r₀), n≥1, for relations Σ_t r_t f_t=r₀∈I. By (K) write r_t=k_t+i_t with i_t∈I and (k_t)=Σ_(i<j)c_(ij)(f_j e_i−f_i e_j). Then Σ_t k_t f_t=0, r₀=Σ_t i_t f_t and Σ_t r_t x_t−r₀=Σ_(i<j)c_(ij)(f_j x_i−f_i x_j)+Σ_t i_t(x_t−f_t), a sum of elements of the divided power ideal IB⟨x⟩+B⟨x⟩₊.
2. δ_n of this sum is a sum of products of δ_m of the summands, each product having a factor with m≥1. δ_m(i_t(x_t−f_t))=(x_t−f_t)^m·γ_m(i_t) lies in 𝔟=(x₁−f₁,…,x_r−f_r). δ_m(f_j x_i−f_i x_j)=Σ_(a+b=m)(−1)^b f_j^a f_i^b x_i^[a]x_j^[b]; modulo 𝔟 replace f_i,f_j by x_i,x_j and use x^b·x^[a]=(m!/a!)·x^[m] to get m!·x_i^[m]x_j^[m]·Σ_b(−1)^b binom(m,b)=0 for m≥1 (the computation in the proof of Bhatt's Lemma 3.37). Hence the kernel of Ψ is 𝔟.
3. (1)(a) is (0) for (A,0); (K) is the statement that the relations among the members of a regular sequence are generated by the Koszul relations. (b) A⟨x₁,…,x_r⟩=⊗_A A⟨x_t⟩ by the divided monomial bases (pd-polynomial), and the tensor product is right exact.
4. (1)(c) F_p⟨t⟩ is free over F_p[t]/(t^p) on the t^[jp]: t^a·t^[jp]=a!·binom(a+jp,a)·t^[a+jp] with binom(a+jp,a)≡1 mod p for 0≤a<p (Choose.choose_modEq_choose_mod_mul_choose_div_nat), and t^p=p!·t^[p]=0. F_p[t]⟨x⟩/(x−t) and F_p⟨t⟩ are both the envelope of (t) in F_p[t] (by (0) and by envelope-add-variables); base change along F_p[t]→A, t↦f_t, gives A⟨x_t⟩/(x_t−f_t)=⊕_j A/(f_t^p)·γ_(jp)(f_t). The identification with the actual principal envelope uses the additional assumption that f_t is a non-zero-divisor on A. Without that assumption this argument establishes the module basis for the presentation ring only.
5. (1)(d) x₁−f₁ is a non-zero-divisor on A⟨x₁,…,x_r⟩ because f₁ is one on A (compare coefficients of x₁^[n]). By (c) the quotient is ⊕_j (A/f₁^p)⟨x₂,…,x_r⟩, on which x₂−f₂ is a non-zero-divisor because f₂ is one on A/(f₁^p); continue, using that f₁^p,…,f_(t−1)^p,f_t is a regular sequence. The Koszul complex of a regular sequence is a resolution. Raising members of a weakly regular sequence to positive powers preserves weak regularity. At step t use this with f₁^p,…,f_(t−1)^p,f_t; this input is included explicitly in the DD.1 contract. The two-term resolution for each actual principal envelope also uses the added non-zero-divisor assumption on A. Tensoring these free resolutions yields the Koszul resolution on all x_t−f_t, so its concentration in degree zero proves the asserted Tor vanishing.
6. (2) Each A/(f₁,…,f_i) has a finite resolution by flat ℤ/p^n-modules (A is flat and the sequence regular), hence is flat; so f₁,…,f_r stays a regular sequence on A/p. Let D₀=D_(A,0)(I)=A⟨x⟩/(x_t−f_t) by (0), with divided power ideal J̄₀ and D₀/J̄₀=A/I. Flatness of A/I gives pD₀∩J̄₀=pJ̄₀, so the divided powers of J̄₀ and the canonical ones on pD₀ glue and D₀=D (PDEnvelope.eq_of_isCompatible).
7. Flatness of D. For r=1, x−f is a non-zero-divisor on the flat module A⟨x⟩, so D has a two-term flat resolution and is flat. For r>1 induct, replacing A by A₁=A⟨x₁⟩/(x₁−f₁): f₂,…,f_r is regular on A₁/p=⊕_j (A/p)/(f₁^p)·γ_(jp)(f₁) by (1)(c) over A/p, hence on the flat ℤ/p^n-module A₁. Reduction. envelope-quotient-transitivity (1) with kernel pA gives D_(A/p)((I+pA)/pA)=D/K′ with K′ generated by the γ̄_n(pa)=aⁿ·γ_n(p)∈pD, so K′=pD.

**Depends on:** `CR.0/pd-envelope`, `CR.0/pd-polynomial`, `CR.0/envelope-quotient-transitivity`, `CR.0/envelope-add-variables`, `CR.0/compatible-divided-powers`, `CR.0/canonical-p-divided-powers`, `mathlib:RingTheory.Sequence.IsRegular`, `mathlib:Choose.choose_modEq_choose_mod_mul_choose_div_nat`, `DerivedDeRhamCohomology:DD.1/koszul-complex`, `DerivedDeRhamCohomology:DD.1`.

**Sources:** [bhatt-pd](https://arxiv.org/pdf/1204.6560), Section 3.3, Lemma 3.37 with proof, p.16. Part (1) is this lemma: (c) is the module decomposition established in its proof and (d) is the content of 'where all tensor products are derived' (the proof shows that the derived tensor product is discrete). The proof also contains the Koszul computation used for part (0).; [bhatt-pd](https://arxiv.org/pdf/1204.6560), Section 3.3, Lemma 3.38: statement p.16, proof p.17. Part (2). The source's 'pd-envelope D_A(I) (compatible with divided powers on p)' is D_(A,γ)(I+pA) in the convention of this roadmap. The source states flatness and the reduction modulo p and asserts the presentation by reference to the proof of Lemma 3.37.; [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section 60.24, Remark 60.24.9 (tag 07MU), hint. Part (0) is asserted there, for a polynomial algebra over a divided power ring and a sequence that is Koszul-regular modulo the divided power ideal, inside a hint and with a reference to Lemma 60.2.4 only; the derivation from that lemma is in proofSteps.

**Acceptance.**

- Regular principal ideal: for A=F_p[t] and f=t, D_A((t))=F_p⟨t⟩ is free over F_p[t]/(t^p) on the t^[jp], j≥0, and t^p=0 in it.
- For A=(ℤ/p^n)[t] and f=t, relative to (ℤ_(p),(p),γ): D=(ℤ/p^n)⟨t⟩, flat over ℤ/p^n, with D/pD=F_p⟨t⟩.
- (0) with r=1 over a general base: for a divided power ring (D,J̄,γ̄) and λ∈D, the monic polynomial z^p−λ is a non-zero-divisor on (D/J̄)[z], and D_(D[z],γ̄)(J̄D[z]+(z^p−λ))=D[z]⟨ξ⟩/(ξ−(z^p−λ)), the ring of Stacks Lemma 60.25.3 before completion.

**Signature component.** regularEnvelope types the characteristic-p monomial module basis for a regular sequence, part (1)(c) for the full ideal. PDEnvelope.presentation separately types the general generators-and-relations presentation. No executable declaration gives the general (K)-criterion simplification, the principal-envelope tensor equivalence, Tor/Koszul assertions, or flat Z/p^n comparison. The extra individual non-zero-divisor hypothesis in (1)(b,c,d) is kept in the full packet; the displayed monomial module basis does not require it.

### fontaine-envelope — The crystalline period ring A_cris of a p-adically complete ring

**Construction:** `TauCeti.Crystalline.fontaineEnvelope`. Let p be a prime and R a commutative ring that is p-adically complete and in which p is not a unit. Let R♭=PreTilt R p be the perfection of R/p, A=𝕎(R♭) its ring of Witt vectors (a p-torsion-free, p-adically complete ring with A/p=R♭) and θ=WittVector.fontaineTheta R p:A→R Fontaine's map, the ring homomorphism with θ([x])=x^♯ on Teichmüller representatives; θ is surjective when Frobenius is surjective on R/p. Write γ for the canonical divided powers on (p), in A and in R. (a) Definition. D(R)=D_(A,γ)(ker θ+pA) is the divided power envelope of ker θ+pA relative to (A,pA,γ) (equivalently relative to (ℤ_p,(p),γ)), with divided power ideal J̄∋p, and A_cris(R) is the p-adic completion of D(R), with the divided powers on the closure J̄^ of J̄ given by completed-envelope. (b) Comparison of bases. If A/ker θ is p-torsion-free (for instance if R is), the canonical map D_(A,0)(ker θ)→D(R) from the envelope of ker θ over the trivial divided power base is an isomorphism of A-algebras; under it J̄=J̄₀+pD(R), where J̄₀ is the divided power ideal of D_(A,0)(ker θ). (c) Principal case. Assume ker θ is generated by an element ξ whose image in A/p=R♭ is a non-zero-divisor (so that (p,ξ) is a regular sequence in A). Then D(R)=A⟨x⟩/(x−ξ) is p-torsion-free and equals the subring A[ξⁿ/n!:n≥0] of A[1/p] (x^[n]↦ξⁿ/n!); A_cris(R) is its p-adic completion and is p-torsion-free. (d) Maps. θ extends uniquely to a divided power morphism θ_cris:(A_cris(R),J̄^)→(R,pR,γ); it kills γ_n(x) for x∈ker θ and n≥1, and if θ is surjective and R is p-torsion-free it is surjective with kernel the closure of J̄₀. For a perfect ring k of characteristic p and a ring map π:R→k, the map A→𝕎(k) induced on Witt vectors by R♭→R/p→k (zeroth coefficient followed by π) sends ker θ+pA into p𝕎(k) and extends uniquely to a divided power morphism (A_cris(R),J̄^)→(𝕎(k),p𝕎(k),γ).

**Hypotheses and conventions.**

- p is a prime; R is a commutative ring, p-adically complete (IsAdicComplete (p) R), and p is not a unit of R.
- (b): 𝕎(R♭)/ker θ is p-torsion-free.
- (c): ker θ=(ξ) and the image of ξ in 𝕎(R♭)/p=R♭ is a non-zero-divisor.
- (d), second map: k is a perfect ring of characteristic p and π:R→k a ring homomorphism.

**API.**

- `TauCeti.Crystalline.fontaineEnvelope_initial` (universal-property): Let (C,K,ε) be a divided power ring with C p-adically complete and separated, p∈K and ε_n(p)=pⁿ/n! for all n. Every ring map f:𝕎(R♭)→C with f(ker θ)⊆K extends uniquely to a divided power morphism (A_cris(R),J̄^)→(C,K,ε).
- `TauCeti.Crystalline.fontaineEnvelope_theta` (projection): θ_cris:(A_cris(R),J̄^)→(R,pR,γ) is the unique divided power morphism restricting to θ on 𝕎(R♭); θ_cris(γ_n(x))=0 for x∈ker θ and n≥1. If θ is surjective and R is p-torsion-free, θ_cris is surjective and its kernel is the closure of the sub-PD ideal generated by ker θ.
- `TauCeti.Crystalline.fontaineEnvelope_identify` (equivalence): In the principal case (c), the p-adic completion of the subring 𝕎(R♭)[ξⁿ/n!:n≥0] of 𝕎(R♭)[1/p] is isomorphic to A_cris(R) as a 𝕎(R♭)-algebra, by the completion of the isomorphism 𝕎(R♭)⟨x⟩/(x−ξ)→𝕎(R♭)[ξⁿ/n!], x^[n]↦ξⁿ/n!; both rings are p-torsion-free.
- `TauCeti.Crystalline.fontaineEnvelope_eq_trivialBase` (equivalence): If 𝕎(R♭)/ker θ is p-torsion-free, the canonical map D_(𝕎(R♭),0)(ker θ)→D(R) is an isomorphism of 𝕎(R♭)-algebras, and the divided power ideal of D(R) is J̄₀+pD(R).
- `TauCeti.Crystalline.fontaineEnvelope_wittResidue` (projection): For a perfect ring k of characteristic p and a ring map π:R→k, the map 𝕎(R♭)→𝕎(k) induced by R♭→R/p→k sends ker θ+(p) into p𝕎(k) and extends uniquely to a divided power morphism (A_cris(R),J̄^)→(𝕎(k),p𝕎(k),γ).
- `TauCeti.Crystalline.fontaineEnvelope_map` (functoriality): A ring homomorphism f:R→R′ between p-adically complete rings in which p is not a unit induces 𝕎(f♭):𝕎(R♭)→𝕎(R′♭) with θ′∘𝕎(f♭)=f∘θ and a divided power morphism A_cris(f):A_cris(R)→A_cris(R′) with θ′_cris∘A_cris(f)=f∘θ_cris; A_cris(g∘f)=A_cris(g)∘A_cris(f) and A_cris(id)=id.

**Unit tests.**

- `TauCeti.Crystalline.test_fontaineEnvelope_theta` (computation): For x∈ker θ and n≥1: θ_cris(γ_n(x))=0 in R; and θ_cris(γ_n(p))=pⁿ/n!.
- `TauCeti.Crystalline.test_fontaineEnvelope_identity` (degenerate): For R=ℤ_p: R♭=F_p, 𝕎(R♭)=ℤ_p, θ is the identity, ker θ=0, and A_cris(ℤ_p)=ℤ_p with divided power ideal (p), its canonical divided powers and θ_cris the identity.
- `TauCeti.Crystalline.test_fontaineEnvelope_p2` (computation): For p=2: in A_cris(ℤ₂)=ℤ₂ the divided powers γ_(2^a)(2) have 2-adic valuation 1 for every a≥0, so γ_n(2) does not tend to 0; for odd p, γ_n(p)→0 in A_cris(ℤ_p).
- `TauCeti.Crystalline.test_fontaineEnvelope_mod_p` (computation): In the principal case (c): ξ^p∈pA_cris(R), and A_cris(R)/p is a free R♭/(ξ̄^p)-module on the classes of the γ_(jp)(ξ), j≥0; in particular the kernel of R♭=𝕎(R♭)/p→A_cris(R)/p is (ξ̄^p).

**Uses.** BMS1 Definition 3.22(i), p.27; Bhatt, Proposition 9.9, p.35: For R the ring of integers of a perfectoid field of characteristic 0 (BMS1), or the p-adic completion of the ring of integers of an algebraic closure of a p-adic field (Bhatt), A_cris(R) is their A_crys; clause (c) identifies the completed envelope with the completion of A_inf[ξ^m/m!]. AInfCohomology:AI.0; PerfectoidQuotients:Q0:integral-algebra: For an integral perfectoid ring R, in particular R=O_C, the perfectoid owner proves that θ is surjective and that ker θ is generated by an element ξ which is a non-zero-divisor modulo p; this is the hypothesis of clause (c). It is supplied there and is not a prerequisite of this node. PadicHodgeTheory:R06.1/acris-embedding-into-bdr-plus, R06.1/crystalline-period-ring; DerivedDeRhamCohomology:DD.4/acris-derived-description; CohomologyComparisons:CP.0/ainf-specialization-dictionary: Consumers use A_cris with θ_cris, its dense subring A_inf[ξ^m/m!], the Witt reduction map to W(k) and functoriality in R (Galois action).

**Construction or proof.**

1. (a) R♭ is a perfect ring of characteristic p, so A=𝕎(R♭) is p-torsion-free (WittVector.eq_zero_of_p_mul_eq_zero) and p-adically complete (WittVector.isAdicCompleteIdealSpanP). Integers prime to p are units in A and in R, so (p) carries its canonical divided powers in both (canonical-p-divided-powers). Form D(R) by pd-envelope; since p∈J̄, p is nilpotent in D(R)/J̄ and completed-envelope gives the divided powers on J̄^.
2. (b) Let D₀=D_(A,0)(ker θ) with divided power ideal J̄₀. D₀/J̄₀=A/ker θ is p-torsion-free, so pD₀∩J̄₀=pJ̄₀=(pD₀)·J̄₀. Hence the divided powers of J̄₀ are compatible with γ (product-intersection-gluing, compatible-divided-powers), and (D₀,J̄₀+pD₀) is the envelope of ker θ+pA relative to (A,pA,γ) (PDEnvelope.eq_of_isCompatible).
3. (c) ξ is a non-zero-divisor in A: if ξa=0 then a∈pA because ξ is a non-zero-divisor modulo p, a=pa₁ with ξa₁=0, and so a∈∩pⁿA=0. A/ξ is p-torsion-free: pa=ξb implies b∈pA, b=pb₁ and a=ξb₁. By regular-envelope (0) with r=1 over (A,0), D₀=A⟨x⟩/(x−ξ). x−ξ is a non-zero-divisor on A⟨x⟩ and on (A/p)⟨x⟩ (compare coefficients of x^[n]), so D₀ is p-torsion-free; D₀[1/p]=A[1/p]⟨x⟩/(x−ξ)=A[1/p] identifies D₀ with A[ξⁿ/n!]. Apply (b). The p-adic completion of a p-torsion-free ring is p-torsion-free.
4. (d) (R,pR,γ) is a divided power ring over (A,pA,γ) through θ, and θ(ker θ+pA)⊆pR. pd-envelope gives a divided power morphism D(R)→R, and completedEnvelope_lift extends it to A_cris(R), since R is p-adically complete and R/pR is killed by p. It kills γ_n(x) for x∈ker θ because γ_n(0)=0. If R is p-torsion-free and θ is surjective, the p-adic completion of 0→J̄₀→D₀→R→0 is exact (p^eD₀∩J̄₀=p^eJ̄₀) and R is complete.
5. Witt map. Let w=WittVector.map(π̄∘coeff₀):A→𝕎(k), where coeff₀:R♭→R/p and π̄:R/p→k is induced by π. For x∈ker θ, WittVector.mk_fontaineTheta gives coeff₀(x₀)=θ(x) mod p=0, so w(x) has zeroth coefficient 0 and lies in p𝕎(k) (WittVector.mem_span_p_iff_coeff_zero_eq_zero). (𝕎(k),p𝕎(k),γ) is a divided power ring over (A,pA,γ) and 𝕎(k) is p-adically complete (WittVector.isAdicCompleteIdealSpanP); conclude as for θ.
6. Functoriality. A ring map f:R→R′ induces R/p→R′/p, f♭:R♭→R′♭ on perfections and 𝕎(f♭). Both θ′∘𝕎(f♭) and f∘θ send [x] to f(x^♯)=(f♭x)^♯ (WittVector.fontaineTheta_teichmuller; the untilt is a limit of p^n-th powers of lifts and f is p-adically continuous), so they agree modulo every power of p (WittVector.eq_of_apply_teichmuller_eq) and are equal. Hence 𝕎(f♭) maps ker θ+pA into ker θ′+pA′ and induces divided power morphisms D(R)→D(R′) and A_cris(R)→A_cris(R′).

**Depends on:** `CR.0/pd-envelope`, `CR.0/completed-envelope`, `CR.0/canonical-p-divided-powers`, `CR.0/compatible-divided-powers`, `CR.0/product-intersection-gluing`, `CR.0/regular-envelope`, `mathlib:PreTilt`, `mathlib:WittVector.fontaineTheta`, `mathlib:WittVector.fontaineTheta_teichmuller`, `mathlib:WittVector.mk_fontaineTheta`, `mathlib:surjective_fontaineTheta`, `mathlib:WittVector.eq_zero_of_p_mul_eq_zero`, `mathlib:WittVector.isAdicCompleteIdealSpanP`, `mathlib:WittVector.mem_span_p_iff_coeff_zero_eq_zero`, `mathlib:WittVector.map`, `mathlib:WittVector.eq_of_apply_teichmuller_eq`.

**Sources:** [bhatt-pd](https://arxiv.org/pdf/1204.6560), Section 9, Proposition 9.9 (statement), p.35. For R the p-adic completion of the ring of integers of an algebraic closure of a p-adic field, the source identifies its ring A_crys, defined there by derived de Rham cohomology (Definition 9.7), with the p-adic completion of the divided power envelope of ker θ. The node takes the completed envelope as the definition, for any p-adically complete R; the derived de Rham description is DerivedDeRhamCohomology:DD.4/acris-derived-description.; [bms1](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), Section 3.3, Definition 3.22(i), p.27. For O the ring of integers of a perfectoid field of characteristic 0 containing all p-power roots of unity, the source defines A_crys as the p-adic completion of the A_inf-subalgebra of A_inf[1/p] generated by the ξ^m/m! and states this universal property: clause (c) and the API item fontaineEnvelope_initial for R=O.

**Acceptance.**

- R=ℤ_p: R♭=F_p, 𝕎(R♭)=ℤ_p, θ is the identity and ker θ=0; D(ℤ_p)=ℤ_p and A_cris(ℤ_p)=ℤ_p with divided power ideal (p) and its canonical divided powers.
- In case (c): ξ^p=p!·γ_p(ξ)∈pA_cris(R), and A_cris(R)/p is a free R♭/(ξ̄^p)-module on the classes of the γ_(jp)(ξ), j≥0; so the kernel of R♭=A/p→A_cris(R)/p is (ξ̄^p), although A→A_cris(R) is injective.
- p=2: in A_cris(ℤ₂)=ℤ₂ the divided powers γ_(2^a)(2)=2^(2^a)/(2^a)! have 2-adic valuation 1 for every a≥0, so γ_n(2) does not tend to 0; for odd p, γ_n(p)→0 in A_cris(ℤ_p)=ℤ_p.

**Signature component.** The prototype constructs A_cris from the existing fontaineTheta and completed relative envelope. The explicit subalgebra comparison assumes the primitive-kernel/non-zero-divisor hypothesis; its mod-p basis test is a generators-and-relations criterion. It does not make A_cris universal among all semiperfect PD thickenings without a specified incoming Witt map.

### pd-square-zero-thickening — Divided powers on a second-order thickening

**Lemma:** `TauCeti.Crystalline.pdSquareZeroThickening`. Let (A,I,γ) be a PD ring, M and N A-modules and q:M×M→N an A-bilinear map. Let B=A⊕M⊕N with multiplication (x,z,w)(x′,z′,w′)=(xx′,xz′+x′z,xw′+x′w+q(z,z′)+q(z′,z)) and J=I⊕M⊕N. Then δ_n(x,z,w)=(γ_n(x),γ_{n−1}(x)z,γ_{n−1}(x)w+γ_{n−2}(x)q(z,z)), for (x,z,w)∈J and n≥1, with the conventions γ₀=1 and γ₋₁=0, is a PD structure on J, and A→B is a PD homomorphism (A,I,γ)→(B,J,δ) (Stacks Lemma 60.3.2). For N=0 this is the PD structure on A⊕M of CR.0/pd-square-zero-extension.

**Hypotheses and conventions.**

- (A,I,γ) is a PD ring; M and N are A-modules; q:M×M→N is A-bilinear, not assumed symmetric.
- The formula uses γ₀(x)=1 and γ₋₁(x)=0, so δ₁(x,z,w)=(x,z,w).

**Construction or proof.**

1. B is a commutative ring: the product is symmetric because q(z,z′)+q(z′,z) is, and associative because every product of three elements of M⊕N has zero component in M and component in N determined by A-bilinearity.
2. Each axiom involves finitely many elements, so it is enough to prove it for A₀=ℤ⟨s,s′⟩ with free modules M₀, N₀ and the universal bilinear map, where everything is torsion free; there it suffices that n!·δ_n(x,z,w)=(x,z,w)ⁿ, and by induction (x,z,w)ⁿ=(xⁿ,nxⁿ⁻¹z,nxⁿ⁻¹w+n(n−1)xⁿ⁻²q(z,z)) (proof of Stacks Lemma 60.3.2).

**Depends on:** `CR.0/pd-square-zero-extension`, `mathlib:DividedPowers`, `mathlib:DividedPowers.IsDPMorphism`, `CR.0/pd-polynomial`, `mathlib:DividedPowers.ofInjective`, `mathlib:DividedPowers.RatAlgebra.dividedPowers`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section 60.3, Lemma 60.3.2 (tag 07HI) with proof. The statement is Lemma 60.3.2; the reduction to the torsion-free ring ℤ⟨s,s′⟩ is the proof printed there. The check that B is a commutative ring is not printed.

**Acceptance.**

- For N=0 the formula is δ_n(x,z)=(γ_n(x),γ_{n−1}(x)z), the structure of CR.0/pd-square-zero-extension.
- For A=ℤ, I=0, M=N=ℤ and q(z,z′)=zz′: B=ℤ⊕ℤε⊕ℤη with ε=(0,1,0), η=(0,0,1), ε²=(0,0,2)=2η and εη=η²=0 (the subring ℤ[ε]≅ℤ[ε]/(ε³) has index 2 in B and does not contain η), and δ₂(ε)=η, so 2·δ₂(ε)=ε².

### pd-ring-pushout — Pushouts of divided power rings

**Lemma:** `TauCeti.Crystalline.pdRingPushout`. The category of PD rings, with objects the triples (A,I,γ) and morphisms the PD homomorphisms, has all colimits (Stacks, Divided Power Algebra, Lemma 23.3.4). Let (B,J,δ)←(A,I,γ)→(B′,J′,δ′) be PD homomorphisms and (B″,J″,δ″) their pushout. Then (1) B″/J″=B/J⊗_{A/I}B′/J′; (2) the map φ:B⊗_AB′→B″ is surjective; (3) φ maps J⊗_AB′+B⊗_AJ′ onto J″ (Remark 23.3.5). The map φ need not be an isomorphism: the forgetful functor (A,I,γ)↦A does not commute with colimits (Remark 23.3.6).

**Hypotheses and conventions.**

- (A,I,γ), (B,J,δ) and (B′,J′,δ′) are PD rings, with PD homomorphisms from the first to the other two.

**Construction or proof.**

1. For a small diagram of PD rings, take its underlying commutative-ring colimit R using Mathlib CommRingCat.Colimits.hasColimits_commRingCat. Let J⊂R be the ideal generated by the images of all source PD ideals. Form the envelope D_R(J) over the PD base (ℤ,0) by CR.0/pd-envelope.
2. For every source object i, x∈I_i and n≥1 impose γ_D,n(image(x))−image(γ_i,n(x))=0. These relations lie in the envelope PD ideal. Take their PD-ideal closure with DividedPowers.SubDPIdeal.span_carrier_eq_dpow_span and quotient using DividedPowers.Quotient.dividedPowers. The quotient carries a PD cocone. Any PD cocone first induces R→C, then extends uniquely to D by the envelope property; it kills the relations and their PD closure, so factors uniquely through the quotient. This gives all small colimits without a representability criterion.
3. For a pushout, test the universal property on (C,0) to identify B″/J″ with B/J⊗_(A/I)B′/J′. The image of B⊗_A B′ in B″ and the ideal generated there by images of J,J′ are stable under all divided powers: expand sums and use γ_n(ax)=a^nγ_n(x), with the source PD compatibility on each generator. This image PD subring is itself a cocone; the pushout property forces its inclusion into B″ to be an isomorphism. Thus the tensor map is surjective and its ideal image is J″, as in Stacks Remark 23.3.5.

**Depends on:** `mathlib:DividedPowers`, `mathlib:DividedPowers.IsDPMorphism`, `mathlib:CommRingCat.Colimits.hasColimits_commRingCat`, `CR.0/pd-envelope`, `mathlib:DividedPowers.SubDPIdeal.span_carrier_eq_dpow_span`, `mathlib:DividedPowers.Quotient.dividedPowers`.

**Sources:** [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), §23.3, Lemma 23.3.4 and Remarks 23.3.5–23.3.6. The statement combines Lemma 23.3.4 and Remarks 23.3.5–23.3.6. The proof here replaces the source’s representability argument by a PD envelope with imposed compatibility relations; the final tensor-image argument is that of Remark 23.3.5.; [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.2, Lemma 60.2.1 (tag 07H8), universal envelope construction. The envelope universal property, applied over (ℤ,0), supplies the free compatible PD extension used before imposing the diagram’s PD relations.

**Acceptance.**

- For (A,I,γ)=(ℤ,0,∅) and B=B′=ℤ/4 with J=J′=(2), δ₂(2)=2 and δ′₂(2)=0: the pushout is (F₂,0,∅), because 2=δ₂(2)=δ′₂(2)=0 in it, whereas ℤ/4⊗_ℤℤ/4=ℤ/4 (Remark 23.3.6).

### envelope-etale-extension — Étale extension of PD envelopes

**Theorem:** `TauCeti.Crystalline.envelope_etale_extension`. Let (A,I,γ) be a PD ring, P an A-algebra, J⊂P an ideal containing IP, and P→P′ an étale map. Put J′=JP′. Then D_(P′,γ)(J′)≅P′⊗_P D_(P,γ)(J), with the divided powers extended from D along the flat map, compatibly with the quotient P′/J′. The construction commutes with composition and localisation. At compatible finite p-power quotients the same statement holds; the completed version is the inverse limit of these isomorphisms, without replacing completed tensor product by ordinary tensor product.

**Hypotheses and conventions.**

- The base divided powers extend compatibly to each envelope; P→P′ is étale, hence flat.
- For the completed statement use the finite quotients on which the given divided powers descend.

**Construction or proof.**

1. Extend the divided powers of D to P′⊗_P D by flat-extension. Its quotient by the image PD ideal is P′/J′.
2. For every compatible PD target C receiving P′ with J′ mapping to its PD ideal, the P-map gives D→C; together with P′→C it gives a unique map P′⊗_P D→C. The flat-extension uniqueness shows this is a PD morphism, so it has the envelope universal property.
3. Localisation and composition follow from uniqueness. Apply the argument at finite levels and then take the inverse limit for the completed statement.

**Depends on:** `CR.0/pd-envelope`, `CR.0/flat-extension`, `CR.0/extension-uniqueness`, `CR.0/envelope-base-change`, `mathlib:Algebra.Etale`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.2, Lemma 60.2.6 (07HD), base-change proof. Apply envelope base change to the flat étale algebra.; [stacks-dpa](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), §23.4, Lemma 23.4.2 (07H1), flat-extension case. The flat extension equips the tensor-product envelope with its compatible PD structure.

**Acceptance.**

- For P′=P[1/f], the envelope of JP′ is D[1/f] with its extended divided powers.
- For P′=P the map is the identity.
- Completed base change is stated levelwise and uses the completed tensor product.

## CR.1 — Crystalline sites, structure sheaves and crystals

**Targets.** Small and big crystalline sites, Quasi-coherent and finite locally free crystals, Rational crystals and nondegenerate F-crystals, Universal PD differentials and the PD de Rham complex, Integrable topologically quasi-nilpotent connections, Crystals, stratifications and quasi-nilpotent connections.

### pd-scheme — Schemes with a quasi-coherent PD ideal

**Definition:** `TauCeti.Crystalline.PDScheme`. A PD scheme (divided power scheme) is a triple (T,J,γ): a scheme T, a quasi-coherent sheaf of ideals J⊂O_T and maps of sheaves γ_n:J→J (n≥1, with γ₀=1) such that (O_T(W),J(W),γ) is a PD ring for every open W⊂T. A morphism of PD schemes (T,J,γ)→(T′,J′,γ′) is a morphism of schemes f:T→T′ with f⁻¹J′·O_T⊂J such that (O_T′(W′),J′(W′),γ′)→(O_T(f⁻¹W′),J(f⁻¹W′),γ) is a PD homomorphism for every open W′⊂T′. Let U=V(J)→T be the closed immersion defined by J. The triple (U,T,γ) is a PD thickening if U→T is a thickening, that is, a closed immersion inducing a homeomorphism of underlying spaces. If p is a prime, T is a scheme over ℤ_(p) and p is locally nilpotent on U, then U→T is a thickening if and only if p is locally nilpotent on T.

**Hypotheses and conventions.**

- T is a scheme, J⊂O_T a quasi-coherent sheaf of ideals, and γ_n is given for every n≥1.
- In the last sentence p is a prime number, T is a scheme over ℤ_(p) and p is locally nilpotent on U=V(J).

**API.**

- `TauCeti.Crystalline.PDScheme.affine` (data): On an affine open, J gives its ring ideal and the restricted powers.
- `TauCeti.Crystalline.PDScheme.localize` (compatibility): The powers on a basic open D(s) are γ_n(x/sᵏ)=γ_n(x)/sᵏⁿ for x∈I(Spec A), k≥0.
- `TauCeti.Crystalline.PDScheme.map_comp` (functoriality): Identity and composite PD morphisms preserve all powers.
- `TauCeti.Crystalline.PDScheme.fiberProduct` (universal-property): For morphisms of PD schemes f:(T,J,δ)→(S,I,γ) and f′:(T′,J′,δ′)→(S,I,γ) there are a PD scheme (T″,J″,δ″) and a cartesian square in the category of PD schemes; T″→T×_ST′ is a closed immersion and T″₀→T₀×_{S₀}T′₀ is an isomorphism, where T₀=V(J) and similarly for the others (Stacks Lemma 60.7.4; affine-locally T″ is the spectrum of the pushout of PD rings, CR.0/pd-ring-pushout).
- `TauCeti.Crystalline.PDScheme.isThickening_iff` (characterisation): For a PD scheme (T,J,γ) over ℤ_(p) with p locally nilpotent on U=V(J): U→T is a thickening if and only if p is locally nilpotent on T.

**Unit tests.**

- `TauCeti.Crystalline.test_pdScheme_zero` (degenerate): An identity immersion has the zero PD ideal.
- `TauCeti.Crystalline.test_pdScheme_affine` (compatibility): Spec(A/I)→Spec A for a PD ideal recovers precisely the original affine PD ring.
- `TauCeti.Crystalline.test_pdScheme_two` (non-example): Spec F₂→Spec ℤ/4, with the PD structure γ_n(2)=2ⁿ/n! on (2), is a PD thickening on which 2 is nilpotent, although the ideal (2) is not PD-nilpotent.

**Uses.** Stacks §§60.7–60.9; CR.1/crystalline-site: Glues affine PD operations with localization and checks each thickening against its given base powers; affine and restriction APIs supply actual site objects.

**Construction or proof.**

1. A PD structure on a quasi-coherent ideal is determined by its values on affine opens: on a basic open D(s) of an affine open the powers are γ_n(x/sᵏ)=γ_n(x)/sᵏⁿ (CR.0/localization-formula), which is the compatibility with restriction.
2. Morphisms are defined by preservation of the powers on sections; identities and composites of PD morphisms are PD morphisms.
3. Last sentence: on an affine open with ring A and PD ideal I, p is nilpotent in A/I. If pᴺ=0 in A then for x∈I, x^{pN}=(pN)!·γ_{pN}(x)=0 because pᴺ divides (pN)!; conversely if I is locally nilpotent then pʳ∈I is nilpotent (Stacks, Divided Power Algebra, Lemma 23.2.6). A closed immersion is a thickening exactly when its ideal is locally nilpotent.

**Depends on:** `CR.0/localization-formula`, `CR.0/nilpotence-predicates`, `CR.0/pd-ring-pushout`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.7, Definitions 60.7.1–60.7.3 and observation (1) before Situation 60.7.5. Definitions 60.7.1–60.7.3 give PD structures on sheaves of ideals, PD schemes with their morphisms, and PD thickenings; the last sentence of the node is observation (1) before Situation 60.7.5, which rests on Divided Power Algebra Lemma 23.2.6. The node states nothing beyond these.

**Acceptance.**

- On Spec ℤ/4 the ideal (2) carries exactly two PD structures, with γ₂(2)=2 and with γ₂(2)=0 (Stacks, Divided Power Algebra, Lemma 23.5.3 and Remark 23.3.6); the identity of Spec ℤ/4 is not a morphism of PD schemes from one to the other.
- For a PD ring (A,I,γ) and s∈A, the affine PD scheme (Spec A,Ĩ,γ) restricted to D(s) has powers γ_n(x/sᵏ)=γ_n(x)/sᵏⁿ.

### crystalline-site — Small and big crystalline sites

**Definition:** `TauCeti.Crystalline.CrisSite`. Let p be a prime, (S,I,γ) a PD scheme over ℤ_(p), S₀=V(I)⊂S, and X→S₀ a morphism of schemes such that p is locally nilpotent on X (Stacks Situation 60.7.5; p need not be nilpotent on S). A PD thickening of X relative to (S,I,γ) is a PD thickening (U,T,δ) together with a morphism of PD schemes (T,J,δ)→(S,I,γ) and an S-morphism U→X; a morphism of such objects is a morphism of PD schemes over S compatible with the maps to X. They form the category CRIS(X/S); for every object, p is locally nilpotent on T. A family {(U_a,T_a,δ_a)→(U,T,δ)} is a Zariski covering if U_a=U×_TT_a for all a and {T_a→T} is a Zariski covering. The big crystalline site of X over (S,I,γ) is CRIS(X/S) with the Zariski topology. The small crystalline site Cris(X/S) is the full subcategory of the objects (U,T,δ) for which U→X is an open immersion, with the Zariski topology.

**Hypotheses and conventions.**

- p is a prime number; (S,I,γ) is a PD scheme over ℤ_(p) and S₀=V(I).
- X→S₀ is a morphism of schemes and p is locally nilpotent on X; no nilpotence of p on S is assumed.

**API.**

- `TauCeti.Crystalline.CrisSite.object` (constructor): A compatible p-nilpotent PD thickening with U→X gives a big object; U open gives a small object.
- `TauCeti.Crystalline.CrisSite.cover_pullback` (structure): The pullback of a jointly surjective family of opens of T is a cover.
- `TauCeti.Crystalline.CrisSite.small_inclusion` (functoriality): The small-object inclusion preserves the displayed covers and composition of morphisms.
- `TauCeti.Crystalline.CrisSite.finiteLimits` (structure): CRIS(X/S) and Cris(X/S) have all finite nonempty limits, in particular products of pairs and fibre products; the functor (U,T,δ)↦U to schemes over X and the inclusion Cris(X/S)→CRIS(X/S) commute with them (Stacks Lemmas 60.8.2 and 60.9.2).
- `TauCeti.Crystalline.CrisSite.flat_baseChange` (characterisation): In a fibre square of CRIS(X/S) with corners (U₃,T₃,δ₃), (U₂,T₂,δ₂), (U₁,T₁,δ₁) over (U,T,δ): if T₂→T is flat and U₂=T₂×_TU, then T₃=T₁×_TT₂ as schemes (Stacks Lemma 60.8.3).
- `TauCeti.Crystalline.CrisSite.trivialThickening` (constructor): U↦(U,U,∅) is a functor from schemes over X to CRIS(X/S), and from X_Zar to Cris(X/S), left adjoint to (U,T,δ)↦U (Stacks, after Definitions 60.8.1 and 60.9.1).

**Unit tests.**

- `TauCeti.Crystalline.test_crisSite_identity` (degenerate): If I=0, X=S₀=S and p is locally nilpotent on S, then (S,S,∅) is an object of Cris(X/S) whose map to X is an isomorphism.
- `TauCeti.Crystalline.test_crisSite_Wn` (computation): For k a perfect field of characteristic p, n≥1 and S=Spec W_n(k) with the canonical PD structure γ_m(pa)=(pᵐ/m!)aᵐ on (p): (Spec k,Spec W_n(k),γ) is an object of Cris(Spec k/S), and it is a final object.
- `TauCeti.Crystalline.test_crisSite_non_nilp` (non-example): No PD scheme with underlying scheme Spec ℤ_p is the thickening of an object of a crystalline site, because p is not nilpotent in ℤ_p. In particular (Spec F_p,Spec ℤ_p,γ) is not an object of Cris(Spec F_p/Spec ℤ_p).
- `TauCeti.Crystalline.test_crisSite_product_Z4` (computation): In Cris(Spec F₂/Spec ℤ_(2)) with the zero PD ideal on the base, the product of (Spec F₂⊂Spec ℤ/4,δ) and (Spec F₂⊂Spec ℤ/4,δ′), where δ₂(2)=2 and δ′₂(2)=0, is (Spec F₂,Spec F₂,∅).

**Uses.** Stacks §§60.7–60.10; CR.1/structure-sheaves and crystal: Provides the small and big thickening categories and their open-cover topologies on which coefficient modules and structure sheaves are evaluated.

**Construction or proof.**

1. CRIS(X/S) has all finite nonempty limits and (U,T,δ)↦U commutes with them (Stacks Lemma 60.8.2). In the affine case the product of two thickenings is obtained from the pushout (B″,J″,δ″) of PD rings (CR.0/pd-ring-pushout) by taking the PD envelope of the kernel of B″→B/J⊗_CB′/J′ (Stacks Lemma 60.5.3); the general case glues these (CR.1/pd-scheme, fibre products).
2. For a fibre square of thickenings in which T₂→T is flat and U₂=T₂×_TU, T₃=T₁×_TT₂ as schemes, because divided powers extend uniquely along flat maps (Stacks Lemma 60.8.3, CR.0/flat-extension). Hence the base change of a Zariski covering is the restriction to open subschemes, and Zariski coverings define a topology.
3. The objects with U→X an open immersion are stable under finite nonempty limits, so the same coverings define the topology of Cris(X/S) (Stacks, before Definition 60.9.1).

**Depends on:** `CR.1/pd-scheme`, `CR.0/pd-envelope`, `CR.0/pd-ring-pushout`, `CR.0/flat-extension`, `mathlib:CategoryTheory.ObjectProperty.FullSubcategory`, `mathlib:CategoryTheory.ObjectProperty.ι`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Situation 60.7.5; §60.8, Definitions 60.8.1 and 60.8.4, Lemmas 60.8.2–60.8.3; §60.9, Definition 60.9.1. Objects, morphisms and Zariski coverings are Definitions 60.8.1 and 60.8.4 in Situation 60.7.5, and the small site is Definition 60.9.1. The node states nothing beyond the source; the proof of Lemma 60.8.2 is omitted there.

**Acceptance.**

- For k a perfect field of characteristic p and S=Spec W_n(k) with the canonical PD structure on (p): (Spec k,Spec W_n(k),γ) is an object of Cris(Spec k/S) and is its final object.
- In Cris(Spec F₂/Spec ℤ_(2)), with the zero PD ideal on the base, the product of (Spec F₂⊂Spec ℤ/4,δ₂(2)=2) and (Spec F₂⊂Spec ℤ/4,δ′₂(2)=0) is (Spec F₂,Spec F₂,∅), not Spec(ℤ/4⊗ℤ/4): the pushout of the two PD rings is (F₂,0) (Stacks, Divided Power Algebra, Remark 23.3.6).

### site-morphisms — Morphisms and comparisons of crystalline sites

**Construction:** `TauCeti.Crystalline.crisSiteMap`. (Big sites.) Let (S,I,γ)→(S′,I′,γ′) be a morphism of PD schemes over ℤ_(p) and X→Y a morphism of schemes lying over S₀→S′₀, with p locally nilpotent on X and Y. The functor CRIS(X/S)→CRIS(Y/S′) sending (U,T,δ) to (U,T,δ) with U→X→Y is continuous and cocontinuous and defines a morphism of topoi f_CRIS:(X/S)_CRIS→(Y/S′)_CRIS (Stacks Remark 60.8.5). (Big and small.) The inclusion Cris(X/S)→CRIS(X/S) is fully faithful, continuous and cocontinuous and commutes with finite nonempty limits; it gives morphisms of topoi i:(X/S)_cris→(X/S)_CRIS and π:(X/S)_CRIS→(X/S)_cris with π⁻¹=i_!, π_*=i⁻¹ and π∘i=id (Stacks Lemma 60.9.2). (Small sites.) f_cris:=π_Y∘f_CRIS∘i_X:(X/S)_cris→(Y/S′)_cris (Stacks Remark 60.9.3); there is no functor of small sites underlying it. (Zariski projection.) The functor Cris(X/S)→X_Zar, (U,T,δ)↦U, is continuous and cocontinuous and commutes with products and fibre products; it defines a morphism of topoi u_{X/S}:(X/S)_cris→Sh(X_Zar) (Stacks Remark 60.9.4). (Localisation.) For open subschemes X′⊂X and S_open⊂S with X′ mapping into S_open, Cris(X′/S_open)→Cris(X/S) is fully faithful and identifies Cris(X′/S_open) with the localisation of Cris(X/S) at u⁻¹h_{X′}, compatibly with u_{X′/S_open} and u_{X/S} (Stacks Lemma 60.9.5).

**Hypotheses and conventions.**

- p is a prime number; (S,I,γ)→(S′,I′,γ′) is a morphism of PD schemes over ℤ_(p).
- X→S₀ and Y→S′₀ are morphisms of schemes with p locally nilpotent on X and Y, and X→Y lies over S₀→S′₀.
- For localisation: X′⊂X and S_open⊂S are open subschemes with X′ mapping into S_open. S_open is independent of the target PD scheme S′ in the first paragraph.

**API.**

- `TauCeti.Crystalline.crisSiteMap_comp` (functoriality): For composable squares X→Y→Z over (S,I,γ)→(S′,I′,γ′)→(S″,I″,γ″): (g∘f)_CRIS=g_CRIS∘f_CRIS, and id_CRIS=id.
- `TauCeti.Crystalline.cris_u_sections` (characterisation): For a sheaf F on Cris(X/S) and V⊂X open, Γ(V,u_{X/S,*}F)=Γ((V/S)_cris,F|_{Cris(V/S)}), where Cris(V/S)⊂Cris(X/S) is the full subcategory of objects (U,T,δ) with U⊂V (Stacks Lemma 60.9.5).
- `TauCeti.Crystalline.cris_small_big` (compatibility): π∘i=id as morphisms of topoi, π_*=i⁻¹ and π⁻¹=i_!; consequently Hⁿ((X/S)_CRIS,G)=Hⁿ((X/S)_cris,i⁻¹G) for every abelian sheaf G on CRIS(X/S) and every n.
- `TauCeti.Crystalline.cris_u_inverse_eval` (characterisation): For a Zariski sheaf G on X, u⁻¹G evaluated on (U,T,δ) is G(U), with sheafification understood. In particular (u⁻¹O_X^×)(U,T,δ)=Γ(U,O_U)^×; the homomorphism O_crys^×→u⁻¹O_X^× is restriction along U→T. This is the evaluation used in first-chern-class.

**Unit tests.**

- `TauCeti.Crystalline.test_crisMap_identity` (degenerate): For f=id_X over id_S: f_CRIS is the identity of (X/S)_CRIS and f_cris=π∘i is the identity of (X/S)_cris.
- `TauCeti.Crystalline.test_crisMap_open` (compatibility): For X′⊂X open and S′=S, the morphism (X′/S)_cris→(X/S)_cris is the localisation of (X/S)_cris at u⁻¹h_{X′}, and u_{X/S} restricts to u_{X′/S} (Stacks Lemma 60.9.5).
- `TauCeti.Crystalline.test_crisMap_variants` (non-example): For X=S=Spec F_p with the zero PD ideal, the sheaf G:(U,T,δ)↦Γ(U,Ω_{U/X}) on CRIS(X/S) has i⁻¹G=0 but G(𝔸¹_X,𝔸¹_X,∅)=F_p[t]dt≠0; hence π⁻¹i⁻¹G≠G and i∘π is not isomorphic to the identity.

**Uses.** Stacks §§60.8–60.9; CR.1/crystal; CR.2/crystalline-cohomology; CR.3/frobenius-map: f_CRIS and f_cris give the pullback of crystals along maps of schemes and of PD bases, in particular along Frobenius; u_{X/S} is the morphism along which Ru_* is taken; the localisation lemma reduces statements about Ru_* to affine opens.

**Construction or proof.**

1. A cocontinuous functor of sites defines a morphism of topoi. The functor of Remark 60.8.5 is continuous and cocontinuous because coverings of (U,T,δ) are defined by Zariski coverings of T alone.
2. The inclusion gives i together with a left adjoint i_! of i⁻¹ satisfying i⁻¹i_!=i⁻¹i_*=id; i_! is right exact and commutes with fibre products, so it is exact once i_!(∗)=∗. By the proof of Lemma 60.9.2 this holds when a set of objects of Cris(X/S) covers the final object of (X/S)_CRIS; for X and S affine every object of CRIS(X/S) with T affine maps to an object (X,Spec D_e,γ̄) of Cris(X/S) (Stacks Lemma 60.5.6). Then π⁻¹:=i_! and π_*:=i⁻¹.
3. u and the localisation square are Stacks Remark 60.9.4 and Lemma 60.9.5; the latter gives Γ(V,u_*F)=Γ((V/S)_cris,F) for V⊂X open.
4. The inverse-image evaluation is the functor (U,T,δ)↦U defining u; covers of T induce covers of U. Apply this to units to obtain the reduction map used by first-chern-class (Bhatt–de Jong §3.1, p.7).

**Depends on:** `CR.1/crystalline-site`, `CR.0/pd-envelope`, `mathlib:CategoryTheory.Functor.sheafAdjunctionContinuous`, `mathlib:CategoryTheory.Functor.sheafAdjunctionCocontinuous`, `mathlib:SheafOfModules.pullbackPushforwardAdjunction`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.8, Remark 60.8.5; §60.9, Lemma 60.9.2, Remarks 60.9.3–60.9.4, Lemma 60.9.5. Remark 60.8.5 gives f_CRIS, Lemma 60.9.2 gives i and π with π∘i=id and π_*=i⁻¹ (its proof is complete only when X and S are affine), Remark 60.9.3 defines f_cris, Remark 60.9.4 gives u and Lemma 60.9.5 the localisation. The node states nothing beyond these.; [bhatt-dejong](https://arxiv.org/pdf/1110.5001v1), §3.1, p.7, displayed characterization of u⁻¹. Evaluation of inverse image on the Zariski open U and the ringed-topos coefficient f⁻¹O_Σ.

**Acceptance.**

- For f the identity of X over the identity of S, f_CRIS=id and f_cris=π∘i=id (Stacks Lemma 60.9.2).
- i∘π is not the identity: for X=S=Spec F_p with the zero PD ideal, the sheaf G:(U,T,δ)↦Γ(U,Ω_{U/X}) on CRIS(X/S) has i⁻¹G=0 and G(𝔸¹_X,𝔸¹_X,∅)≠0, so π⁻¹i⁻¹G=0≠G.

### structure-sheaves — Structure, quotient and PD-ideal sheaves

**Construction:** `TauCeti.Crystalline.crisStructure`. On either fixed crystalline site, define O_crys(U,T)=Γ(T,O_T), O_X^cris(U,T)=Γ(U,O_U), and J_crys=ker(O_crys→O_X^cris) as sheaves, with pointwise PD operations. The sequence 0→J_crys→O_crys→O_X^cris→0 is exact as sheaves; the map O_crys(U,T,δ)→O_X^cris(U,T,δ) need not be surjective for every object (U,T,δ). These ring/ideal sheaves provide the ringed crystalline topos.

**Hypotheses and conventions.**

- p is a prime number; (S,I,γ) is a PD scheme over ℤ_(p) and S₀=V(I)⊂S; X→S₀ is a morphism of schemes with p locally nilpotent on X (Stacks Situation 60.7.5).
- The site is CRIS(X/S) or Cris(X/S) with the Zariski topology.

**API.**

- `TauCeti.Crystalline.crisStructure_eval` (simp): Evaluation gives O_T on the Zariski slice of a thickening.
- `TauCeti.Crystalline.crisPDideal_kernel` (characterisation): J_crys is the kernel sheaf of the displayed quotient map.
- `TauCeti.Crystalline.crisPDideal_restrict` (compatibility): Restriction maps preserve every divided power.
- `TauCeti.Crystalline.crisRestrict` (data): For a sheaf F on the site and an object (U,T,δ), the restriction F_T is the Zariski sheaf on T with F_T(W)=F(U∩W,W,δ|_W) for W⊂T open; F↦F_T is exact, and (O_crys)_T=O_T.
- `TauCeti.Crystalline.crisComparison` (data): For a morphism f:(U,T,δ)→(U′,T′,δ′) the restriction maps of F define c_f:f⁻¹F_T′→F_T and, for an O_crys-module F, an O_T-linear map c_f:f^*F_T′→F_T; c_f is an isomorphism when f:T→T′ is an open immersion with U=U′×_T′T (automatic on Cris(X/S), not on CRIS(X/S)), and c_{g∘f}=c_f∘f^*(c_g).
- `TauCeti.Crystalline.crisSheaf_ofRestrictions` (constructor): Zariski sheaves F_T for all objects (U,T,δ), with maps c_f:f⁻¹F_T′→F_T for all morphisms f that are isomorphisms for open immersions f:T→T′ with U=U′×_T′T and satisfy c_{g∘f}=c_f∘f⁻¹(c_g), define a sheaf on the site with these restrictions and comparison maps (Stacks §60.10).
- `TauCeti.Crystalline.crisPDideal_pdPower` (data): For r≥0 the PD power J_crys^{[r]}⊂O_crys is the sheaf of ideals whose restriction to T is the quasi-coherent ideal J_T^{[r]} generated on affine opens by the products γ_{e₁}(x₁)⋯γ_{e_t}(x_t) with x_j in the ideal of U and Σe_j≥r (CR.0/pd-filtration); J_crys^{[0]}=O_crys and J_crys^{[1]}=J_crys.

**Unit tests.**

- `TauCeti.Crystalline.test_crisStructure_affine` (computation): For T=Spec B,U=Spec(B/J), the sequence evaluates to0→J→B→B/J→0.
- `TauCeti.Crystalline.test_crisStructure_zero` (degenerate): For an identity thickening the evaluated ideal is0.
- `TauCeti.Crystalline.test_crisStructure_sheaf_epi` (non-example): For k a field of characteristic p, U=𝔸²_k∖{0} over S=Spec k with the zero PD ideal, and T the first-order deformation of U over k[ε] glued from D(x)[ε] and D(y)[ε] by 1+ε·x⁻¹y⁻¹∂_x on D(xy)[ε], with γ_n=0 on εO_T for n≥2: (U,T,γ) is an object of Cris(U/S), and x∈Γ(U,O_U) has no lift to Γ(T,O_T). So O_crys(U,T,γ)→O_X^cris(U,T,γ) is not surjective although the map of sheaves is.

**Uses.** Stacks §§60.9–60.10; CR.1/crystal and CR.2/linearization: Evaluates O_crys and its quotient on a thickening and identifies the PD ideal sheaf as their kernel. The sheaf epimorphism API is needed for exact coefficient constructions.

**Construction or proof.**

1. Open descent proves the two presheaves are sheaves. Affine-local surjectivity proves sheaf epimorphism.
2. The kernel restrictions preserve all PD operations, yielding the sheaf PD ideal.

**Depends on:** `CR.1/crystalline-site`, `CR.1/pd-scheme`, `CR.0/pd-filtration`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.10 (Sheaves on the crystalline site): the restriction F_T, the comparison maps c_f, the structure sheaf O_{X/S}, and the sequence 0→J_{X/S}→O_{X/S}→underline(G_a)→0. §60.10 defines O_{X/S}, the sheaf (U,T,δ)↦Γ(U,O_U), the kernel J_{X/S} and its PD structure, exactly as in the node (which writes O_crys, O_X^cris, J_crys). The PD powers of J_crys in the API are not in §60.10.

**Acceptance.**

- On an affine object (Spec B/J,Spec B,δ) the sequence evaluates to 0→J→B→B/J→0, and the PD structure of J_crys there is δ.
- The map of sheaves O_crys→O_X^cris is not surjective on sections of every object: for k a field of characteristic p, U=𝔸²_k∖{0} over S=Spec k (zero PD ideal) and T the first-order deformation of U over k[ε] glued from D(x)[ε] and D(y)[ε] by the automorphism 1+ε·x⁻¹y⁻¹∂_x of D(xy)[ε], with γ_n=0 on εO_T for n≥2, the function x∈Γ(U,O_U) has no lift to Γ(T,O_T).

### crystal — Quasi-coherent and finite locally free crystals

**Definition:** `TauCeti.Crystalline.Crystal`. Let the site be CRIS(X/S) or Cris(X/S), ringed by O_crys. An O_crys-module E is a crystal in O_crys-modules if for every morphism f:(U,T,δ)→(U′,T′,δ′) the comparison map c_f:f^*E_T′=O_T⊗_{f⁻¹O_T′}f⁻¹E_T′→E_T is an isomorphism. It is a crystal in quasi-coherent modules, respectively of finite type, respectively in finite locally free modules, if moreover every restriction E_T is a quasi-coherent O_T-module, respectively quasi-coherent of finite type, respectively finite locally free. An O_crys-module is quasi-coherent as a module on the ringed site if and only if it is a crystal in quasi-coherent modules (Stacks Lemma 60.11.2). For O_crys-modules E, F one has (E⊗F)_T=E_T⊗_{O_T}F_T, and the tensor product of two crystals is a crystal; for a crystal E in finite locally free modules the dual E^∨=Hom(E,O_crys) is a crystal with (E^∨)_T=Hom_{O_T}(E_T,O_T). Crystals in finite locally free modules, with the sequences that are exact on every thickening, form a rigid tensor exact category; they are not closed under cokernels.

**Hypotheses and conventions.**

- p is a prime number; (S,I,γ) is a PD scheme over ℤ_(p) and S₀=V(I)⊂S; X→S₀ is a morphism of schemes with p locally nilpotent on X (Stacks Situation 60.7.5).
- The site is CRIS(X/S) or Cris(X/S), ringed by O_crys; E_T and c_f are the restrictions and comparison maps of CR.1/structure-sheaves.
- A sequence of O_crys-modules is exact if and only if its restriction to T is exact for every object (U,T,δ).

**API.**

- `TauCeti.Crystalline.Crystal.pullback_iso` (data): The canonical f^*E_T′→E_T is O_T-linear and invertible.
- `TauCeti.Crystalline.Crystal.tensor_eval` (compatibility): Evaluation of E⊗F is E_T⊗_(O_T)F_T.
- `TauCeti.Crystalline.Crystal.dual_eval` (compatibility): For finite locally free E, evaluation of E∨ is Hom_(O_T)(E_T,O_T), with evaluation/coevaluation.
- `TauCeti.Crystalline.Crystal.quasiCoherent_iff` (characterisation): An O_crys-module is quasi-coherent on the ringed site if and only if every restriction E_T is a quasi-coherent O_T-module and E is a crystal (Stacks Lemma 60.11.2).
- `TauCeti.Crystalline.Crystal.pullback` (functoriality): For f_cris:(X/S)_cris→(Y/S′)_cris (CR.1/site-morphisms) and a crystal E in quasi-coherent O_crys-modules on Cris(Y/S′), f_cris^*E is a crystal in quasi-coherent modules on Cris(X/S); for every object (U,T,δ) of Cris(X/S) and every morphism g of CRIS(Y/S′) from (U,T,δ) to an object (V,T′,δ′) of Cris(Y/S′), (f_cris^*E)_T≅g^*E_T′. Pullback preserves finite type, finite local freeness, tensor products and duals.

**Unit tests.**

- `TauCeti.Crystalline.test_crystal_structure` (degenerate): O_crys with canonical comparisons is a rank-one crystal.
- `TauCeti.Crystalline.test_crystal_constant` (compatibility): The crystal from a finite free base module evaluates as its tensor extension to O_T.
- `TauCeti.Crystalline.test_crystal_not_abelian` (non-example): For k a perfect field of characteristic p, X=Spec k and S=Spec W₂(k) with the canonical PD structure on (p): the cokernel of p:O_crys→O_crys is a crystal in quasi-coherent modules whose value on (Spec k,Spec W₂(k),γ) is k, which is not a free W₂(k)-module; so crystals in finite locally free modules are not closed under cokernels.
- `TauCeti.Crystalline.test_crystal_quotient_sheaf` (non-example): For X=𝔸¹_{F_p} over S=Spec F_p with the zero PD ideal, O_X^cris:(U,T,δ)↦Γ(U,O_U) is an O_crys-module with quasi-coherent restrictions and with c_f an isomorphism for every open immersion f:T→T′ with U=U′×_T′T, but it is not a crystal: for the first-order thickening p₀:T′→T=X with O_T′=O_X⊕Ω_{X/F_p}, the map c_{p₀}:O_T′→O_X is not injective.

**Uses.** Stacks §§60.10,60.15,60.17; Esnault–Groechenig §2.6; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07: Encodes cartesian pullback isomorphisms of modules on thickenings, and exposes evaluation, tensors and duals for the Taylor equivalence and Dieudonné coefficients.

**Construction or proof.**

1. Restriction E↦E_T is the pullback along the morphism of ringed topoi (Sh(T_Zar),O_T)→(Sh(C),O_crys) defined by the continuous and cocontinuous functor W↦(U∩W,W,δ|_W) (CR.1/structure-sheaves); it is exact and commutes with tensor products and with Hom out of finite locally free modules.
2. Lemma 60.11.2: a presentation of a quasi-coherent module over the localised site C/(U,T,δ) restricts to a presentation of E_T and of E_T′ for every T′→T, which gives quasi-coherence of E_T and the crystal property; conversely a presentation of E_T on an affine T pulls back to every T′→T by the crystal property.
3. Tensor products and duals of crystals: apply f^* to the formulas of step 1. A short sequence of crystals in finite locally free modules that is exact on every T is locally split on T, which gives the exact structure.

**Depends on:** `CR.1/structure-sheaves`, `CR.1/site-morphisms`, `mathlib:SheafOfModules`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.11, Definition 60.11.1, Lemma 60.11.2 and Definition 60.11.3. Definition 60.11.1(3) is the crystal condition, Lemma 60.11.2 the equivalence with quasi-coherent modules on the ringed site, Definition 60.11.3 the quasi-coherent and finite locally free variants. Crystals of finite type, tensor products, duals and the exact structure are not in §60.11; they follow from §60.10 as in the proof steps.; [eg](https://page.mi.fu-berlin.de/esnault/preprints/helene/126_esn_gro.pdf), §2.6, p. 14 of the author-hosted manuscript (definition of Crys(Z/W_n)). Esnault–Groechenig work with crystals whose underlying O-modules are of finite type; this is the source of the finite-type variant in the node.

**Acceptance.**

- The structure crystal: O_crys is a crystal in finite locally free modules of rank one.
- A constant crystal: for S=Spec A and a finite free A-module M of rank one, M⊗_AO_crys has value M⊗_AΓ(T,O_T) on (U,T,δ), with the identity comparison maps.
- For X=𝔸¹_{F_p} over S=Spec F_p with the zero PD ideal, the O_crys-module O_X^cris:(U,T,δ)↦Γ(U,O_U) has quasi-coherent restrictions but is not a crystal: for the first-order thickening p₀:T′→T=X with O_T′=O_X⊕Ω_{X/F_p} (Stacks Remark 60.13.1), c_{p₀}:p₀^*O_X=O_T′→O_X has kernel Ω_{X/F_p}≠0.

### isocrystal — Rational crystals and nondegenerate F-crystals

**Definition:** `TauCeti.Crystalline.Isocrystal`. (Crystals and isocrystals over W.) Let k be a perfect field of characteristic p, W=W(k) and W_n=W/pⁿ with the canonical PD structure on (p), and Z a smooth k-scheme. Crys(Z/W_n) is the category of crystals of finite type on Cris(Z/Spec W_n), and Crys(Z/W) the category of crystals of finite type on Cris(Z/Spec W); every object of Cris(Z/Spec W) is Zariski locally an object of some Cris(Z/Spec W_n). The category of isocrystals is the ℚ-linearization Isoc(Z/W)=Crys(Z/W)_ℚ: the same objects, with Hom_Isoc(E,F)=Hom_Crys(E,F)⊗_ℤℚ (Esnault–Groechenig §2.6). Crystals in finite locally free modules form a full subcategory of Crys(Z/W); Isoc(Z/W) is formed from all crystals of finite type, not only from these. (F-crystals.) Let (A,I,γ) be a PD ring with A a ℤ_(p)-algebra and p∈I, S=Spec A, σ:A→A a PD homomorphism with σ(x)≡xᵖ mod pA for all x∈A, and X→S₀=Spec A/I a morphism of schemes with p locally nilpotent on X (Stacks Situation 60.26.1). The absolute Frobenius F_X lies over Spec σ and gives (F_X)_cris:(X/S)_cris→(X/S)_cris. An F-crystal on X/S relative to σ is a pair (E,Φ) of a crystal E in finite locally free O_crys-modules and a map Φ:(F_X)_cris^*E→E. It is nondegenerate if there exist an integer i≥0 and a map V:E→(F_X)_cris^*E with V∘Φ=pⁱ·id (Stacks Definition 60.26.2). If the rank of E is at most r, then V′=p^{ri}V satisfies V′∘Φ=Φ∘V′=p^{ri+i}·id (Stacks Remark 60.26.3). The case A=W(k) or W_n(k), I=(p), σ the Frobenius of Witt vectors is the instance over a perfect field. (F-isocrystals.) For Z smooth over perfect k, (F_Z)_cris^* induces an endofunctor F^* of Isoc(Z/W); an F-isocrystal is an object E of Isoc(Z/W) with an isomorphism Φ:F^*E→E in Isoc(Z/W), and E has a Frobenius structure in the sense of Esnault–Groechenig if (F^*)^fE≅E for some integer f≥1.

**Hypotheses and conventions.**

- p is a prime number.
- For Crys and Isoc: k is a perfect field of characteristic p, W=W(k) carries the canonical PD structure γ_n(pa)=(pⁿ/n!)aⁿ on (p), and Z is a smooth k-scheme.
- For F-crystals: (A,I,γ) is a PD ring with A a ℤ_(p)-algebra and p∈I, σ:A→A is a PD homomorphism with σ(x)≡xᵖ mod pA, X→Spec A/I is a morphism of schemes with p locally nilpotent on X, and E is a crystal in finite locally free O_crys-modules.
- Nondegeneracy is a condition on (E,Φ); it is not part of the definition of an F-crystal.

**API.**

- `TauCeti.Crystalline.Isocrystal.hom` (data): For E, F in Crys(Z/W): Hom_{Isoc(Z/W)}(E,F)=Hom_{Crys(Z/W)}(E,F)⊗_ℤℚ, with composition induced from Crys(Z/W).
- `TauCeti.Crystalline.FCrystal.linearize` (compatibility): Evaluation of Φ is linear from the Frobenius-twisted module; its associated endomorphism is σ-semilinear.
- `TauCeti.Crystalline.FCrystal.dual` (structure): For a finite locally free rational crystal E with an isomorphism Φ:F^*E≅E, define E^∨=Hom(E,O_crys)[1/p]. Its Frobenius is (Φ⁻¹)^∨:F^*(E^∨)≅E^∨ using F^*(E^∨)≅(F^*E)^∨. In a basis it is the inverse transpose of Φ, and evaluation E^∨⊗E→O_crys[1/p] commutes with Frobenius. This gives a dual in F-isocrystals, without asserting an integral F-crystal structure on E^∨.
- `TauCeti.Crystalline.Isocrystal.frobeniusPullback` (functoriality): For Z smooth over a perfect field k, pullback by (F_Z)_cris preserves crystals of finite type and induces a ℚ-linear endofunctor F^* of Isoc(Z/W).
- `TauCeti.Crystalline.FCrystal.nondegenerate_twoSided` (characterisation): If (E,Φ) is a nondegenerate F-crystal with V∘Φ=pⁱ·id and E has rank at most r, then for every N≥ri the map V′=pᴺV satisfies V′∘Φ=Φ∘V′=p^{N+i}·id; in particular Ker Φ and Coker Φ are killed by p^{ri+i} (Stacks Remark 60.26.3).

**Unit tests.**

- `TauCeti.Crystalline.test_isocrystal_unit` (degenerate): The unit W-crystal with Witt Frobenius gives the unit F-isocrystal.
- `TauCeti.Crystalline.test_isocrystal_p` (computation): For E in Crys(Z/W), multiplication by p on E is an isomorphism in Isoc(Z/W), with inverse id_E⊗p⁻¹ in Hom(E,E)⊗_ℤℚ; for E=O_crys and Z nonempty it is not an isomorphism in Crys(Z/W).
- `TauCeti.Crystalline.test_isocrystal_zeroF` (non-example): For X=Spec k: over A=W(k) the pair (O_crys,Φ=0) is not a nondegenerate F-crystal; over A=W_e(k) it is nondegenerate in the sense of Stacks Definition 60.26.2, with V=0 and i=e.
- `TauCeti.Crystalline.test_fcrystal_p` (computation): For X=Spec k and A=W(k), (O_crys,Φ=p·can) is a nondegenerate F-crystal with V=can⁻¹ and i=1; Φ is not an isomorphism of crystals, and its image in Isoc(Spec k/W) is an isomorphism.

**Uses.** Stacks §60.26; Esnault–Groechenig §2.6; CR.3:Frobenius-isogeny: Separates the site coefficient, rationalization and Frobenius pullback; nondegeneracy and its bounded two-sided inverse are inputs to the rational cohomological Frobenius theorem.

**Construction or proof.**

1. Crys and Isoc: apply CR.1/crystal to Cris(Z/Spec W_n) and Cris(Z/Spec W); the ℚ-linearization keeps the objects and tensors the Hom groups with ℚ.
2. (F_X)_cris is the morphism f_cris of CR.1/site-morphisms for the square formed by F_X and Spec σ; the pullback of a crystal in finite locally free modules is again one (CR.1/crystal, pullback).
3. Instance over a perfect field: W(k) is Mathlib's ring of Witt vectors, W_n(k) its truncation (WittVector.truncate, TruncatedWittVector) and σ is WittVector.frobenius, which satisfies σ(x)≡xᵖ mod p and preserves the canonical powers γ_n(pa)=(pⁿ/n!)aⁿ; σ descends to W_n(k) because in characteristic p the m-th coefficient of σ(x) is the p-th power of the m-th coefficient of x.
4. Remark 60.26.3: for r×r matrices K, L over a ring with KL=pⁱ one has det(K)det(L)=p^{ri}; with L′ the adjugate of L, L·(p^{ri}K)=det(K)·LKLL′=det(K)·pⁱ·det(L)=p^{ri+i}. Apply this locally to V and Φ.
5. Duality: finite local freeness identifies the pullback of the dual with the dual of the pullback. Rational invertibility of Φ then yields the stated inverse dual map, and evaluation compatibility follows by applying Φ⁻¹ before a functional. No integral inverse is used.

**Depends on:** `CR.1/crystal`, `CR.1/site-morphisms`, `mathlib:WittVector.frobenius`, `mathlib:WittVector.truncate`, `mathlib:TruncatedWittVector`, `mathlib:WittVector`, `CR.0/canonical-p-divided-powers`.

**Sources:** [eg](https://page.mi.fu-berlin.de/esnault/preprints/helene/126_esn_gro.pdf), §2.6, pp. 14–15 of the author-hosted manuscript (Crys(Z/W_n), Crys(Z/W), Isoc(Z/W)); Introduction, p. 3 (Frobenius structure) and Remark 1.7. Esnault–Groechenig define Crys(Z/W_n) and Crys(Z/W) with O-modules of finite type on the small crystalline sites (the site of Z/W as the union of those of Z/W_n) and Isoc(Z/W) as the ℚ-linearization; a Frobenius structure is an isomorphism (F^*)^fE≅E for some f≥1. The remark on finite locally free crystals and the notion with f=1 are the node's.; [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.26 (tag 07N0), Situation 60.26.1, Definition 60.26.2 and Remark 60.26.3. Situation 60.26.1 and Definition 60.26.2 are taken as they stand; the two-sided inverse for bounded rank is Remark 60.26.3 (in which det(M) is a misprint for det(K)).

**Acceptance.**

- For X=Spec k and A=W(k): (O_crys,Φ=p·can), with can:(F_X)_cris^*O_crys→O_crys the canonical isomorphism, is a nondegenerate F-crystal (V=can⁻¹, i=1); Φ is not an isomorphism of crystals and becomes one in Isoc(Spec k/W).
- For X=Spec k: over A=W(k) the pair (O_crys,Φ=0) is not nondegenerate, since pⁱ≠0 on O_crys for every i; over A=W_e(k) it is nondegenerate in the sense of the definition, with V=0 and i=e.

### pd-stratification — PD stratifications on a smooth lift

**Definition:** `TauCeti.Crystalline.PDStratification`. In Stacks Situation 60.5.1 (p a prime, (A,I,γ) a PD ring with A a ℤ_(p)-algebra, A→C a ring map with IC=0 and p nilpotent in C), let P=A[x_i] be a polynomial algebra with a surjection P→C of A-algebras, and for n≥0 let J(n) be the kernel of P⊗_A⋯⊗_AP→C (n+1 factors). D(n) is the p-adic completion of the PD envelope of J(n) relative to γ, and D=D(0). The D(n) form a cosimplicial object in PD rings, and D(n) is the coproduct of n+1 copies of D in the category Cris^∧(C/A) of p-adically complete PD thickenings of C (Stacks Remark 60.5.4, Lemma 60.17.2). Write p₀,p₁:D→D(1), q₀,q₁,q₂:D→D(2) and q₀₁,q₁₂,q₀₂:D(1)→D(2) for the coprojections and Δ:D(1)→D for the codiagonal. A PD stratification on a p-adically complete D-module M is a D(1)-linear isomorphism ε:M⊗^∧_{D,p₀}D(1)→M⊗^∧_{D,p₁}D(1) such that Δ^*ε=id_M and q₀₂^*ε=q₁₂^*ε∘q₀₁^*ε as maps M⊗^∧_{D,q₀}D(2)→M⊗^∧_{D,q₂}D(2). Here ⊗^∧ is the p-adically completed tensor product.

**Hypotheses and conventions.**

- p is a prime number; (A,I,γ) is a PD ring with A a ℤ_(p)-algebra; A→C is a ring map with IC=0 and p nilpotent in C (Stacks Situation 60.5.1).
- P=A[x_i] is a polynomial algebra on any set of variables, with a surjection P→C of A-algebras.
- M is a p-adically complete D-module.

**API.**

- `TauCeti.Crystalline.PDStratification.diagonal` (simp): Pulling ε to the diagonal gives id_M.
- `TauCeti.Crystalline.PDStratification.cocycle` (relation): q₀₂^*ε=q₁₂^*ε∘q₀₁^*ε as maps M⊗^∧_{D,q₀}D(2)→M⊗^∧_{D,q₂}D(2).
- `TauCeti.Crystalline.PDStratification.from_crystal` (constructor): The crystal pullback isomorphisms on D(1) define ε and satisfy the cocycle.
- `TauCeti.Crystalline.PDStratification.taylorCoefficients` (characterisation): For a PD stratification ε and m∈M there are unique elements θ_K(m)∈M, K running over the multi-indices of finite support, with ε(m⊗1)=Σ_Kθ_K(m)⊗∏_iξ_i^{[k_i]} in M⊗^∧_{D,p₁}D(1), where ξ_i=x_i⊗1−1⊗x_i=p₀(x_i)−p₁(x_i); the sum converges p-adically. One has θ_0=id and θ_K∘θ_L=θ_{K+L}; so the θ_i=θ_{e_i} commute and θ_K=∏_iθ_i^{k_i} (proof of Stacks Lemma 60.17.3).

**Unit tests.**

- `TauCeti.Crystalline.test_stratification_unit` (degenerate): The structure module has its canonical identity-after-base-change stratification.
- `TauCeti.Crystalline.test_stratification_three` (computation): For A=F_p with the zero PD ideal, C=P=F_p[t] and M=D=F_p[t] with ε the identity of D(1)=F_p[t]⟨ξ⟩, ξ=t⊗1−1⊗t: ε(f⊗1)=p₀(f)=Σ_kp₁(f^{(k)})·ξ^{[k]} for every f, so θ_k is the k-th derivative.
- `TauCeti.Crystalline.test_stratification_connection` (non-example): For A=F_p with the zero PD ideal and C=P=F_p[t], the module M=F_p[t]·e with the integrable connection ∇e=e⊗dt has no PD stratification whose coefficient θ_1 is the operator θ of ∇: such an ε would satisfy ε(e⊗1)=Σ_kθᵏ(e)⊗ξ^{[k]} with only finitely many nonzero terms, but θᵏ(e)=e for all k.

**Uses.** Stacks §60.17; Esnault–Groechenig §2.6; CR.1/taylor-equivalence: Packages the PD diagonal and triple-diagonal cocycle used to reconstruct crystals from a local module with connection; diagonal and cocycle APIs certify coordinate transitions.

**Construction or proof.**

1. D(n) is, as a D-algebra through the first coprojection, the p-adic completion of the PD polynomial algebra D⟨ξ_i(j)⟩, j=1,…,n, with ξ_i(j)=x_i⊗1⊗⋯⊗1−1⊗⋯⊗x_i⊗⋯⊗1 (x_i in slot j+1): P^{⊗(n+1)}=P[ξ_i(j)] and J(n) is generated by J and the ξ_i(j) (Stacks Lemmas 60.2.5 and 60.17.1; CR.0/pd-polynomial).
2. For an object (B→C,δ) of Cris^∧(C/A), morphisms D→B are the A-algebra maps P→B sending J into Ker(B→C); since P^{⊗(n+1)} is a coproduct of A-algebras, D(n) is the (n+1)-fold coproduct of D (Stacks Lemma 60.17.2). This gives the coprojections, the codiagonal and the cosimplicial structure.
3. For a crystal F in quasi-coherent modules with M=lim_eΓ((X,Spec D_e,γ̄),F), the crystal property on Spec D(1)_e gives isomorphisms M⊗^∧_{D,p₀}D(1)→M(1)←M⊗^∧_{D,p₁}D(1); their composite is a PD stratification, the cocycle identity being the commutative triangle on Spec D(2)_e (proof of Stacks Lemma 60.17.3).

**Depends on:** `CR.0/pd-envelope`, `CR.0/completed-envelope`, `CR.0/pd-polynomial`, `CR.1/crystalline-site`, `CR.1/crystal`, `mathlib:IsAdicComplete`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.17, the rings D(n) before Lemma 60.17.1, Lemmas 60.17.1–60.17.2, and the proof of Lemma 60.17.3. Stacks has no named definition of a stratification: the node packages the isomorphism c on D(1) and its cocycle identity on D(2) from the proof of Lemma 60.17.3, with the rings D(n) of §60.17 and Lemmas 60.17.1–60.17.2.

**Acceptance.**

- For A=F_p with the zero PD ideal and C=P=F_p[t]: D=F_p[t], D(1)=F_p[t]⟨ξ⟩ with ξ=t⊗1−1⊗t, and for M=D with ε the identity of D(1) one has p₀(f)=f(p₁(t)+ξ)=Σ_k p₁(f^{(k)})·ξ^{[k]}, the Taylor formula with divided powers.
- On M=F_p[t]·e with the connection ∇e=e⊗dt there is no PD stratification inducing ∇: by the cocycle identity such an ε satisfies ε(e⊗1)=Σ_kθᵏ(e)⊗ξ^{[k]}, a finite sum in M⊗D(1), whereas θᵏ(e)=e for all k.

### pd-differentials — Universal PD differentials and the PD de Rham complex

**Construction:** `TauCeti.Crystalline.pdDifferentials`. Let A be a ring, (B,J,δ) a PD ring and A→B a ring map. A PD A-derivation into a B-module M is an A-derivation θ:B→M with θ(δ_n(x))=δ_{n−1}(x)θ(x) for all x∈J and n≥1 (δ₀=1). Ω¹_PD(B/A) is the quotient of the Kähler module Ω_{B/A} by the B-submodule generated by the elements dδ_n(x)−δ_{n−1}(x)dx for x∈J and n≥1, and d:B→Ω¹_PD(B/A) is the universal PD A-derivation. Put Ω^q_PD(B/A)=∧^q_BΩ¹_PD(B/A). The exterior derivative of Ω^•_{B/A} descends to Ω^•_PD(B/A), because for n≥2 the element d(dδ_n(x)−δ_{n−1}(x)dx)=−dδ_{n−1}(x)∧dx maps to −δ_{n−2}(x)dx∧dx=0 in Ω²_PD(B/A); the resulting complex is the PD de Rham complex (Stacks Remark 60.6.7). It is initial among the strictly graded-commutative differential graded A-algebras P (ωη=(−1)^{ij}ηω for ω∈Pⁱ, η∈Pʲ, and ω²=0 for ω of odd degree) with an A-algebra map B→P⁰ such that B→P⁰→P¹ is a PD derivation.

**Hypotheses and conventions.**

- A is a commutative ring, (B,J,δ) a PD ring and A→B a ring map; no PD structure on A is used.
- Exterior powers are alternating (ω∧ω=0 for ω of degree one), also when 2 is not invertible; δ₀(x)=1.

**API.**

- `TauCeti.Crystalline.pdDifferentials_lift` (universal-property): B-linear maps Ω¹_PD→M correspond bijectively to PD A-derivations B→M.
- `TauCeti.Crystalline.pdDifferentials_dpow` (simp): dδ_n(x)=δ_(n−1)(x)dx for x∈J,n>0.
- `TauCeti.Crystalline.pdDifferentials_map` (functoriality): A compatible PD A-map gives its base-changed differential map, preserving wedges and d.
- `TauCeti.Crystalline.pdDifferentials_adjoin` (compatibility): (1) For the polynomial algebra B[x] with PD ideal JB[x] and the extended divided powers, Ω¹_PD(B[x]/A)=Ω¹_PD(B/A)⊗_BB[x]⊕B[x]·dx. (2) For the PD polynomial algebra B⟨x⟩ with PD ideal JB⟨x⟩+B⟨x⟩₊, Ω¹_PD(B⟨x⟩/A)=Ω¹_PD(B/A)⊗_BB⟨x⟩⊕B⟨x⟩·dx, with d(x^{[n]})=x^{[n−1]}dx (Stacks Lemma 60.6.2(1)–(2)).
- `TauCeti.Crystalline.pdDifferentials_quotient` (compatibility): For an ideal K⊂J with δ_n(K)⊂K for all n≥1, B′=B/K and the induced divided powers on J/K: Ω¹_PD(B′/A) is the quotient of Ω¹_PD(B/A)⊗_BB′ by the B′-submodule generated by the dk, k∈K (Stacks Lemma 60.6.2(3)).
- `TauCeti.Crystalline.pdDifferentials_diagonal` (characterisation): For a PD homomorphism (A,I,γ)→(B,J,δ), let (B(1),J(1),δ(1)) be the coproduct of (B,J,δ) with itself over (A,I,γ) (CR.0/pd-ring-pushout), s₀,s₁:B→B(1) the coprojections and K the kernel of B(1)→B. Then K∩J(1) is stable under the divided powers and Ω¹_PD(B/A)=K/(K²+(K∩J(1))^{[2]}), with d(b) the class of s₁(b)−s₀(b) (Stacks Lemma 60.6.3).
- `TauCeti.Crystalline.pdDifferentials_completion` (compatibility): Let p be a prime, A a ℤ_(p)-algebra and p nilpotent in B/J. Then δ extends to B_e=B/pᵉB for e≫0 and to the p-adic completion B^∧, and lim_eΩ¹_PD(B_e/A)=lim_eΩ¹_PD(B/A)/pᵉ=lim_eΩ¹_PD(B^∧/A)/pᵉ (Stacks Lemma 60.6.10).

**Unit tests.**

- `TauCeti.Crystalline.test_pdDifferentials_base` (degenerate): If J=0 then Ω¹_PD(B/A)=Ω_{B/A}, the ordinary Kähler module; and Ω¹_PD(A/A)=0 for every PD structure on an ideal of A.
- `TauCeti.Crystalline.test_pdDifferentials_polynomial` (computation): For A⟨t⟩, d(t^[n])=t^[n−1]dt and Ω¹_PD is free on dt.
- `TauCeti.Crystalline.test_pdDifferentials_Fp` (non-example): Over F_p⟨t⟩ the relation d(t^[p])=t^[p−1]dt remains nonzero despite d(t^p)=0.

**Uses.** Stacks §60.6; LZ §1.1; CR.1/envelope-differentials and pd-poincare: Quotients ordinary Kähler forms by the derivative-of-divided-powers relations, giving the coefficient complex and the divided-polynomial contraction. The degree-one lift API is its universal property.

**Construction or proof.**

1. Ω_{B/A} is the Kähler module (Mathlib KaehlerDifferential); the complex Ω^•_{B/A}=∧^•_BΩ_{B/A} with its exterior derivative is taken from DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex.
2. Let N be the kernel of Ω_{B/A}→Ω¹_PD(B/A). It is generated by the ω=dδ_n(x)−δ_{n−1}(x)dx, and dω=−dδ_{n−1}(x)∧dx lies in N∧Ω_{B/A} because dδ_{n−1}(x)≡δ_{n−2}(x)dx modulo N. By the graded Leibniz rule d preserves the ideal of ∧^•Ω_{B/A} generated by N, so it descends to ∧^•Ω¹_PD(B/A) with d²=0.
3. Degree one: B-linear maps Ω¹_PD(B/A)→M correspond to PD A-derivations B→M (Stacks Definition 60.6.1). All degrees: for P as in the statement the PD derivation B→P¹ factors through a B-linear map Ω¹_PD(B/A)→P¹, which extends uniquely to a map of graded algebras ∧^•Ω¹_PD(B/A)→P because squares of elements of P¹ vanish; it commutes with d since both differentials are derivations that agree on b and db.

**Depends on:** `mathlib:KaehlerDifferential`, `mathlib:DividedPowers`, `CR.0/pd-polynomial`, `CR.0/pd-ring-pushout`, `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex`, `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-universal-property`, `mathlib:KaehlerDifferential.linearMapEquivDerivation`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.6, Definition 60.6.1, Lemma 60.6.2 and Remark 60.6.7 (Lemmas 60.6.3 and 60.6.10 for the API). Definition 60.6.1 and Remark 60.6.7 give PD derivations, Ω_{B/A,δ} as this quotient of Ω_{B/A}, and the PD de Rham complex; the remark refers to an Algebra lemma for the descent of d, which the proof steps verify directly. The universal property in all degrees is not in Stacks.; [lz-relative](https://www.math.uni-bielefeld.de/~zink/dRW.pdf), §1.1, Definition 1.1 (p. 11) and the paragraph after Lemma 1.2 (p. 13). Langer–Zink define pd-derivations and the same quotient, and state that its exterior algebra is the universal pd-differential graded algebra. As printed, with graded commutativity only (relations (1.4)), that universal property fails when 2 is not invertible; the node requires ω²=0 in odd degree.

**Acceptance.**

- Ω¹_PD(A⟨t⟩/A)=A⟨t⟩·dt with d(t^{[n]})=t^{[n−1]}dt (Stacks Lemma 60.6.2(2)); for A=F_p the ordinary Kähler module of F_p⟨t⟩≅F_p[y_0,y_1,…]/(y_iᵖ), y_i=t^{[pⁱ]}, is free on the infinitely many dy_i.
- If J=0 then Ω^•_PD(B/A)=Ω^•_{B/A}.
- For A=F₂, B=F₂[x] with J=0, the commutative graded algebra P=B[e] with e in degree one and d(feⁿ)=f′eⁿ⁺¹ is a differential graded A-algebra with ωη=(−1)^{ij}ηω and e²≠0; there is no map of differential graded algebras Ω^•_{B/A}→P extending the identity of B, which is why ω²=0 in odd degree is required.

### envelope-differentials — Differentials of a smooth envelope

**Comparison:** `TauCeti.Crystalline.envelopeDifferentials`. Let (A,I,γ) be a PD ring, A→P a ring map, J⊂P an ideal with IP⊂J, and (D,J̄,γ̄)=D_{P,γ}(J) the PD envelope. The canonical map Ω_{P/A}⊗_PD→Ω¹_PD(D/A) is an isomorphism (Stacks Lemma 60.6.6); no flatness of D over P is needed. Hence Ω^q_PD(D/A)=Ω^q_{P/A}⊗_PD for every q≥0. If P is smooth over A these D-modules are finite locally free. If p is a prime, A is a ℤ_(p)-algebra and p is nilpotent in P/J, then with D_e=D/pᵉD the p-adic completion of Ω¹_PD(D/A) is lim_eΩ¹_PD(D_e/A) (Stacks Lemma 60.6.10); for P=A[x_i] it consists of the sums Σf_idx_i with f_i in the p-adic completion D^∧ of D and, for every e, f_i∈pᵉD^∧ for all but finitely many i.

**Hypotheses and conventions.**

- (A,I,γ) is a PD ring, P an A-algebra and J⊂P an ideal containing IP.
- Smoothness of P over A is used only for finite local freeness.
- For the completed statement: p is a prime, A is a ℤ_(p)-algebra and p is nilpotent in P/J.

**Construction or proof.**

1. For a D-module M, the square-zero extension D⊕M carries the PD structure δ_n(x+m)=γ̄_n(x)+γ̄_{n−1}(x)m on J̄⊕M (CR.0/pd-square-zero-thickening).
2. An A-derivation ϑ:P→M gives the A-algebra map P→D⊕M, b↦(b,ϑ(b)), which sends J into J̄⊕M; by the universal property of the envelope it extends uniquely to a PD homomorphism D→D⊕M, whose second component is a PD A-derivation D→M restricting to ϑ. So A-derivations P→M correspond to PD A-derivations D→M, and the Yoneda lemma gives the isomorphism (first proof of Stacks Lemma 60.6.6).
3. Exterior powers commute with base change. Completion: the kernel of Ω¹_PD(D/A)→Ω¹_PD(D_e/A) is pᵉΩ¹_PD(D/A) by the quotient formula of CR.1/pd-differentials and d(pᵉ)=0 (proof of Stacks Lemma 60.6.10).

**Depends on:** `CR.1/pd-differentials`, `CR.0/pd-envelope`, `CR.0/pd-square-zero-extension`, `CR.0/pd-square-zero-thickening`, `mathlib:AdicCompletion`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.6, Lemma 60.6.6 (tag 07HW), first proof, and Lemma 60.6.10; §60.3, Lemma 60.3.1. Lemma 60.6.6 is the degree-one statement, with no flatness or smoothness hypothesis, and Lemma 60.6.10 the completed form. The statement for exterior powers and the local freeness for smooth P are immediate consequences added by the node.

**Acceptance.**

- For P=A[x] and J=IP+(x): D=A⟨x⟩ and Ω¹_PD(D/A)=D·dx with d(x^{[n]})=x^{[n−1]}dx.
- No flatness: for A=ℤ_p, P=ℤ_p[x,y] and J=(x²,xy,y²,p) (Stacks Example 60.22.1), Ω¹_PD(D/A) is free on dx and dy although D is not flat over P: τ=γ̄_p(x²)γ̄_p(y²)−γ̄_p(xy)² is a nonzero element of D with pτ=0.

### integrable-connection — Modules with integrable connection and their de Rham complexes

**Definition:** `TauCeti.Crystalline.Connection`. (Rings.) Let A→B be a ring map and π:Ω_{B/A}→Ω a surjection of B-modules such that the exterior derivative of Ω^•_{B/A} descends to Ω^•:=∧^•_BΩ; this holds if Ker π is generated as a B-module by elements ω whose differential dω maps to zero in Ω², as for Ω=Ω_{B/A} and for Ω=Ω¹_PD(B/A) (CR.1/pd-differentials). Write d:B→Ω for the induced derivation. A connection on a B-module M is an additive map ∇:M→M⊗_BΩ with ∇(bm)=b∇(m)+m⊗db for b∈B and m∈M. It extends to additive maps ∇:M⊗_BΩⁱ→M⊗_BΩ^{i+1}, ∇(m⊗ω)=∇(m)∧ω+m⊗dω. The connection is integrable if the composite M→M⊗_BΩ¹→M⊗_BΩ² is zero; then (M⊗_BΩ^•,∇) is a cochain complex of A-modules, the de Rham complex of (M,∇) (Stacks Remark 60.6.8). (Base change.) Given a commutative square of rings A→A′, B→B′ and a B-linear map φ:Ω→Ω′ compatible with Ω_{B/A}→Ω_{B′/A′}, the base change of (M,∇) is M⊗_BB′ with ∇′(m⊗b′)=Σm_i⊗b′φ(db_i)+m⊗db′ whenever ∇(m)=Σm_i⊗db_i; it is integrable if ∇ is, and m⊗η↦m⊗φ(η) is a map of de Rham complexes M⊗_BΩ^•→M⊗_B(Ω′)^• (Stacks Remark 60.6.9). (Crystalline site.) In the situation of CR.1/crystalline-site, Ω_{X/S} is the O_crys-module on Cris(X/S) with the universal PD S-derivation d_{X/S}:O_crys→Ω_{X/S}; its restriction to T is the quasi-coherent O_T-module Ω_{T/S,δ}, whose sections over an affine open W⊂T mapping into an affine open V⊂S are Ω¹_PD(Γ(W,O_W)/Γ(V,O_V)) (Stacks Lemmas 60.12.2–60.12.4). A connection on an O_crys-module F is a map of abelian sheaves ∇:F→F⊗_{O_crys}Ω_{X/S} with ∇(fs)=f∇(s)+s⊗df; it is integrable if ∇∘∇=0, and then F⊗Ω^•_{X/S} is its de Rham complex on Cris(X/S) (Stacks §§60.14–60.15).

**Hypotheses and conventions.**

- A→B is a map of commutative rings, π:Ω_{B/A}→Ω a surjection of B-modules to which the exterior derivative descends, and M a B-module.
- For the sheaf version: p is a prime, (S,I,γ) a PD scheme over ℤ_(p), X→S₀ a morphism with p locally nilpotent on X, and F an O_crys-module on the small site Cris(X/S).

**API.**

- `TauCeti.Crystalline.Connection.extend` (data): ∇:M⊗_BΩⁱ→M⊗_BΩ^{i+1}, ∇(m⊗ω)=∇(m)∧ω+m⊗dω, is well defined, and ∇(η∧ω)=∇(η)∧ω+(−1)ⁱη∧dω for η∈M⊗_BΩⁱ and ω∈Ωʲ.
- `TauCeti.Crystalline.Connection.curvature` (characterisation): The curvature ∇∘∇:M→M⊗_BΩ² is B-linear and (∇∘∇)(m⊗ω)=(∇∘∇)(m)∧ω; ∇ is integrable if and only if the curvature vanishes, and then ∇∘∇=0 on every M⊗_BΩⁱ.
- `TauCeti.Crystalline.Connection.deRhamComplex` (data): For an integrable connection, (M⊗_BΩ^•,∇) is a cochain complex of A-modules in degrees ≥0; a horizontal B-linear map M→N induces a map of de Rham complexes.
- `TauCeti.Crystalline.Connection.baseChange` (functoriality): For a commutative square A→A′, B→B′ and φ:Ω→Ω′ compatible with Ω_{B/A}→Ω_{B′/A′}: ∇′(m⊗b′)=Σm_i⊗b′φ(db_i)+m⊗db′ (where ∇(m)=Σm_i⊗db_i) is a connection on M⊗_BB′, integrable if ∇ is, and m⊗η↦m⊗φ(η) is a map of complexes M⊗_BΩ^•→M⊗_B(Ω′)^• (Stacks Remark 60.6.9).
- `TauCeti.Crystalline.Connection.tensor` (structure): For connections on M and N, ∇(m⊗n)=∇(m)⊗n+m⊗∇(n) is a connection on M⊗_BN; its curvature is R_M⊗1+1⊗R_N, so it is integrable if both are.
- `TauCeti.Crystalline.Connection.hom` (structure): For M finitely generated projective, (∇φ)(m)=∇_N(φ(m))−(φ⊗1)(∇_M(m)) is a connection on Hom_B(M,N), integrable if both are; a B-linear map φ is horizontal if and only if ∇φ=0. With N=(B,d) this is the dual connection.
- `TauCeti.Crystalline.crisDifferentials` (data): On Cris(X/S), Ω_{X/S} with d_{X/S}:O_crys→Ω_{X/S} is the universal PD S-derivation; (Ω_{X/S})_T=Ω_{T/S,δ} and d_{X/S} restricts to d_{T/S,δ}; Ω_{X/S} has quasi-coherent restrictions and c_f:f^*(Ω_{X/S})_T′→(Ω_{X/S})_T is surjective when f:T→T′ is a closed immersion, but Ω_{X/S} is in general not a crystal (Stacks Lemmas 60.12.3 and 60.12.6).
- `TauCeti.Crystalline.Connection.ofCrystal` (constructor): A crystal F in O_crys-modules on Cris(X/S) carries a canonical integrable connection: for an object (U,T,δ), with T′ the first-order thickening O_T′=O_T⊕Ω_{T/S,δ}, projections p₀,p₁:T′→T and c=c_{p₁}⁻¹∘c_{p₀}:p₀^*F_T→p₁^*F_T, one has ∇(s)=p₁^*s−c(p₀^*s) in F_T⊗_{O_T}Ω_{T/S,δ} (Stacks Lemma 60.15.1).

**Unit tests.**

- `TauCeti.Crystalline.test_connection_unit` (degenerate): (B,d) is an integrable connection on B, with de Rham complex (Ω^•,d); the canonical connection of the structure crystal O_crys is d_{X/S}.
- `TauCeti.Crystalline.test_connection_exponential` (computation): For A=F_p, B=F_p[t], Ω=Ω_{B/A} and M=B·e with ∇(e)=e⊗dt: ∇(fe)=(f′+f)e⊗dt, the connection is integrable, and its de Rham complex is B→B·dt, f↦(f′+f)dt.
- `TauCeti.Crystalline.test_connection_not_integrable` (non-example): For B=A[x,y] with A≠0, Ω=Ω_{B/A} and M=B·e with ∇(e)=e⊗x·dy: ∇(∇(e))=e⊗dx∧dy≠0, so ∇ is not integrable and M⊗_BΩ^• is not a complex.
- `TauCeti.Crystalline.test_connection_pd` (compatibility): For Ω=Ω¹_PD(B/A) with J=0, a connection is a connection relative to the ordinary Kähler differentials Ω_{B/A}; for B=A⟨t⟩ with PD ideal B₊, Ω=B·dt and a connection on M is ∇(m)=θ(m)⊗dt for an additive map θ:M→M with θ(bm)=∂_t(b)m+bθ(m) for all b∈B, where ∂_t is the A-linear map with ∂_t(t^{[n]})=t^{[n−1]} and ∂_t(1)=0.

**Uses.** Stacks Remarks 60.6.8–60.6.9, Lemma 60.15.1, Proposition 60.17.4, Lemma 60.20.2, Proposition 60.21.3, Proposition 60.23.1: The complexes M⊗Ω^• that compute crystalline cohomology are de Rham complexes of integrable connections, and base change of connections gives the maps between them. CR.1/quasi-nilpotent-connection, CR.1/taylor-equivalence, CR.2/pd-poincare, CR.2/embedding-computation, CR.2/smooth-lift-filtration, CR.2/formal-and-end0: These nodes state their results for modules with integrable connection relative to Ω¹_PD or to ordinary differentials; the connection of a crystal is the functor of the crystal–connection equivalence. HodgeStructuresPartII:H.0/ordinary-fiber and the request of the HodgeStructuresPartII packet to CrystallineCohomology:CR.1: The λ=1 case of its parameter connections is identified with the integrable connections defined here (Ω=Ω_{B/A}, exterior derivative and curvature as above). Esnault–Groechenig §2.1 and §2.6 (paper item PAPER-ESNAULT-GROECHENIG-20/005): Relative integrable connections on a smooth scheme, of which the quasi-nilpotent ones form a full subcategory.

**Construction or proof.**

1. Descent of d: if N=Ker π is generated by elements ω with dω∈N∧Ω_{B/A}, then by the graded Leibniz rule d preserves the ideal of ∧^•Ω_{B/A} generated by N.
2. The extension ∇(m⊗ω)=∇(m)∧ω+m⊗dω respects bm⊗ω=m⊗bω: the difference of the two values is b∇(m)∧ω+m⊗db∧ω+bm⊗dω−b∇(m)∧ω−bm⊗dω−m⊗db∧ω=0 (Stacks Remark 60.6.8).
3. ∇∘∇:M→M⊗_BΩ² is B-linear and (∇∘∇)(m⊗ω)=(∇∘∇)(m)∧ω, so integrability gives ∇∘∇=0 in all degrees. Base change: Stacks Remark 60.6.9.
4. Sheaf version: Ω_{X/S} is the quotient of the module of differentials of O_crys over the pullback of O_S by the local sections dδ_n(x)−δ_{n−1}(x)dx (Stacks §60.12); Lemmas 60.12.2–60.12.4 identify its restrictions.
5. Connection of a crystal (Stacks Lemma 60.15.1): with the first-order thickening T′ of Remark 60.13.1 (CR.0/pd-square-zero-thickening), c pulled back along the diagonal T→T′ is the identity, so p₁^*s−c(p₀^*s) lies in the kernel F_T⊗Ω_{T/S,δ} of p₁^*F_T→F_T; integrability follows from the commutative triangle of comparison maps on the second-order thickening of Remark 60.13.2.

**Depends on:** `CR.1/pd-differentials`, `CR.1/structure-sheaves`, `CR.1/crystal`, `CR.0/pd-square-zero-extension`, `CR.0/pd-square-zero-thickening`, `mathlib:KaehlerDifferential`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.6, Remarks 60.6.8–60.6.9; §60.12, Definition 60.12.1 and Lemmas 60.12.2–60.12.4; §60.14; §60.15, Lemma 60.15.1. Remarks 60.6.8–60.6.9 give connections, their extension to M⊗Ωⁱ, integrability, the de Rham complex and base change for a quotient Ω of Ω_{B/A} satisfying the hypothesis of an Algebra lemma on de Rham complexes (the node states the hypothesis directly and proves its sufficient condition). §§60.12, 60.14 and 60.15 give Ω_{X/S}, connections on O_{X/S}-modules and the connection of a crystal; the proofs of Lemmas 60.12.2 and 60.12.3 are omitted in the source. Tensor products and duals of connections (API) are not in the source.

**Acceptance.**

- (B,d) is an integrable connection on M=B with de Rham complex (Ω^•,d).
- For A=F_p, B=F_p[t] and Ω=Ω_{B/A}: on M=B·e the connection ∇(e)=e⊗dt is integrable (Ω²=0) and its de Rham complex is B→B·dt, f↦(f′+f)dt.
- For B=A[x,y] with A≠0, Ω=Ω_{B/A} and M=B·e with ∇(e)=e⊗x·dy: ∇(∇(e))=e⊗dx∧dy≠0, so ∇ is not integrable.

### quasi-nilpotent-connection — Integrable topologically quasi-nilpotent connections

**Definition:** `TauCeti.Crystalline.QNConnection`. In Stacks Situation 60.5.1 let P=A[x_i]_{i∈Λ} be a polynomial algebra with a surjection P→C of A-algebras with kernel J, D the p-adic completion of the PD envelope D_{P,γ}(J), D_e=D/pᵉD, and Ω_D=lim_eΩ¹_PD(D_e/A). Ω_D is the p-adic completion of Ω¹_PD(D_{P,γ}(J)/A)=D_{P,γ}(J)⊗_PΩ_{P/A}, which is free on the dx_i; every element of Ω_D is uniquely a sum Σf_idx_i with f_i∈D and, for every e, f_i∈pᵉD for all but finitely many i; and d:D→Ω_D is the limit of the universal PD derivations of the D_e. Let M be a p-adically complete D-module. A connection on M is an additive map ∇:M→M⊗^∧_DΩ_D with ∇(fm)=m⊗df+f∇(m); it is integrable if ∇∘∇=0 (CR.1/integrable-connection, with completed tensor products). Write ∇(m)=Σ_iθ_i(m)dx_i with operators θ_i:M→M. The connection is topologically quasi-nilpotent if for every m∈M there are only finitely many pairs (i,k) with k≥1 and θ_iᵏ(m)∉pM (Stacks §60.17, conditions (1)–(4)). If ∇ is integrable then θ_i∘θ_j=θ_j∘θ_i, and θ_K:=∏_iθ_i^{k_i} is defined for every multi-index K of finite support. If ∇ is integrable and topologically quasi-nilpotent, then for every m∈M and e≥1 only finitely many K have θ_K(m)∉pᵉM. For ring maps A→P′→C with P′ smooth over A and P′→C surjective, and D′ the p-adic completion of the PD envelope of its kernel, an integrable connection (M′,∇′) over D′ is called topologically quasi-nilpotent if its base change along a PD map b:D′→D as in Stacks Lemma 60.17.5 is.

**Hypotheses and conventions.**

- p is a prime number; (A,I,γ) is a PD ring with A a ℤ_(p)-algebra; A→C is a ring map with IC=0 and p nilpotent in C (Stacks Situation 60.5.1).
- P=A[x_i]_{i∈Λ} is a polynomial algebra on any set Λ, with a surjection P→C; D is the p-adic completion of the PD envelope of its kernel relative to γ.
- M is a p-adically complete D-module; ⊗^∧ is the p-adically completed tensor product.

**API.**

- `TauCeti.Crystalline.QNConnection.operators` (data): ∇(m)=Σ_iθ_i(m)dx_i, and θ_i(fm)=∂_i(f)m+fθ_i(m) for f∈D and m∈M, where df=Σ_i∂_i(f)dx_i in Ω_D.
- `TauCeti.Crystalline.QNConnection.commute` (relation): Integrability implies θ_iθ_j=θ_jθ_i.
- `TauCeti.Crystalline.QNConnection.finite_taylor` (characterisation): If ∇ is integrable and topologically quasi-nilpotent, then for every m∈M and e≥1 only finitely many multi-indices K of finite support have θ_K(m)∉pᵉM; hence Σ_Kθ_K(m)⊗ξ^{[K]} converges p-adically for every family of elements ξ_i of a PD ideal in a p-adically complete D-algebra.

**Unit tests.**

- `TauCeti.Crystalline.test_qn_trivial` (degenerate): For A=F_p with the zero PD ideal and C=P=F_p[t], so D=F_p[t]: (D,d) is integrable and topologically quasi-nilpotent, with θ=d/dt and θᵏ(f)=0 for k>deg f.
- `TauCeti.Crystalline.test_qn_unipotent` (computation): Over F_p[t], θ(e₁)=0,θ(e₂)=e₁ gives a nonzero rank-two connection with θ^p=0.
- `TauCeti.Crystalline.test_qn_exponential` (non-example): Over F_p[t], ∇e=e⊗dt is integrable but θ^p(e)=e, so it is not quasi-nilpotent.

**Uses.** Stacks §60.17; Esnault–Groechenig §2.6; CR.2/embedding-computation: Makes the Taylor series converge p-adically on each local section and turns crystal coefficients into the coefficient de Rham differential; iterated operators and finite Taylor sums detect the required convergence.

**Construction or proof.**

1. Ω¹_PD(D_{P,γ}(J)/A)=D_{P,γ}(J)⊗_PΩ_{P/A} is free on the dx_i (CR.1/envelope-differentials), and its p-adic completion is lim_eΩ¹_PD(D_e/A) (Stacks Lemma 60.6.10); this gives the unique expansions Σf_idx_i and the derivation d:D→Ω_D.
2. The Leibniz rule for ∇ gives θ_i(fm)=∂_i(f)m+fθ_i(m), where df=Σ∂_i(f)dx_i. For a total order on Λ, the coefficient of dx_i∧dx_j (i<j) in ∇(∇m) is θ_iθ_j(m)−θ_jθ_i(m); so integrability is equivalent to the commutation of the θ_i.
3. Finiteness modulo pᵉ: θ_i(m)∈pᵉM for all but finitely many i because ∇(m) lies in the completed sum; for each remaining i the condition modulo p, applied to m and then to the elements m′ with θ_iᵏ(m)=pm′, gives θ_iʳ(m)∈pᵉM for r≥r_i; by commutation θ_K(m)∈pᵉM unless K is supported in that finite set with k_i<r_i.

**Depends on:** `CR.1/integrable-connection`, `CR.1/pd-differentials`, `CR.1/envelope-differentials`, `CR.0/pd-envelope`, `CR.0/completed-envelope`, `mathlib:IsAdicComplete`, `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.17, conditions (1)–(4) before Lemma 60.17.3; Lemma 60.17.5 and its footnote for a smooth P′. Conditions (1)–(4) of §60.17 are taken as they stand for a polynomial P; for a smooth P′ Stacks defines the condition only by transport along b:D′→D (proof of Lemma 60.17.5). The finiteness modulo pᵉ of the θ_K(m) is used in the proof of Proposition 60.17.4 and is proved in the node's steps.; [eg](https://page.mi.fu-berlin.de/esnault/preprints/helene/126_esn_gro.pdf), §2.6, p. 15 of the author-hosted manuscript, the paragraph before Theorem 2.19. Esnault–Groechenig use quasi-nilpotence of finite-type connections on a smooth W_n-lift in Berthelot's sense (not acquired) and refer to this Stacks condition for the definition; the node takes nothing else from the passage. The reduction modulo p is stated in CR.1/finite-witt-evaluation.

**Acceptance.**

- A nontrivial connection satisfying the condition: for A=F_p with the zero PD ideal and C=P=F_p[t] (so D=F_p[t]), on M=De₁⊕De₂ with θ(e₁)=0, θ(e₂)=e₁ one has θ=∂+N with N²=0 and [∂,N]=0, hence θᵖ=∂ᵖ+Nᵖ=0.
- A connection outside it: on M=F_p[t]·e with ∇e=e⊗dt, θ=∂+1 and θᵖ=∂ᵖ+1=id, so θᵏ(e)=e for all k.
- (D,d) is integrable and topologically quasi-nilpotent for every D as above, being attached to the structure crystal (Stacks Lemma 60.17.3).

### taylor-equivalence — Crystals, stratifications and quasi-nilpotent connections

**Theorem:** `TauCeti.Crystalline.crystalConnectionEquivalence`. Convention. A PD stratification is ε:M⊗^∧_{D,p₀}D(1)→M⊗^∧_{D,p₁}D(1) (CR.1/pd-stratification), a connection is written ∇m=Σ_iθ_i(m)dx_i (CR.1/quasi-nilpotent-connection), and ξ_i=x_i⊗1−1⊗x_i=p₀(x_i)−p₁(x_i)∈D(1). (1) In Stacks Situation 60.5.1 with X=Spec C and S=Spec A, let P=A[x_i]→C be a surjection from a polynomial algebra, D the p-adic completion of the PD envelope of its kernel and D_e=D/pᵉD. For a crystal F in quasi-coherent O_crys-modules on Cris(X/S), M=lim_eΓ((X,Spec D_e,γ̄),F) is a p-adically complete D-module with M/pᵉM=Γ((X,Spec D_e,γ̄),F), the crystal property gives a PD stratification ε on M, and ε(m⊗1)=Σ_Kθ_K(m)⊗∏_iξ_i^{[k_i]} with θ_K=∏_iθ_i^{k_i}, where ∇(m)=Σ_iθ_i(m)dx_i is the canonical connection of F evaluated on the Spec D_e; ∇ is integrable and topologically quasi-nilpotent (Stacks Lemma 60.17.3). (2) The functor F↦(M,∇) is an equivalence from the category of crystals in quasi-coherent O_crys-modules on Cris(X/S) to the category of pairs (M,∇) of a p-adically complete D-module and an integrable, topologically quasi-nilpotent connection ∇:M→M⊗^∧_DΩ_D (Stacks Proposition 60.17.4). A quasi-inverse sends (M,∇) to the crystal with value M⊗_{D,f}B on an affine object (U,Spec B,δ) with a morphism f:D→B of thickenings, two choices f, g being identified by c_{f,g}(m⊗1)=Σ_Kθ_K(m)⊗∏_i(f(x_i)−g(x_i))^{[k_i]}, a finite sum. (3) Let A→P′→C be ring maps with P′ smooth over A and P′→C surjective with kernel J′, and D′ the p-adic completion of D_{P′,γ}(J′). There are a surjection P→C from a polynomial algebra and PD A-algebra maps a:D→D′, b:D′→D compatible with the maps to C with a∘b=id; base change along a and b gives an equivalence between the pairs (M,∇) over D and the pairs (M′,∇′) over D′ that are p-adically complete, integrable and topologically quasi-nilpotent, and the equivalence of (2) holds for the functor F↦(M′,∇′) (Stacks Lemma 60.17.5).

**Hypotheses and conventions.**

- p is a prime number; (A,I,γ) is a PD ring with A a ℤ_(p)-algebra; A→C is a ring map with IC=0 and p nilpotent in C (Stacks Situation 60.5.1). X=Spec C and S=Spec A.
- In (1) and (2), P=A[x_i] is a polynomial algebra on any set of variables with a surjection P→C; in (3), P′ is a smooth A-algebra with a surjection P′→C.
- Crystals are crystals in quasi-coherent O_crys-modules on the small site Cris(X/S); modules over D and D′ are p-adically complete.

**Construction or proof.**

1. Lemma 60.17.3: (X,Spec D_e,γ̄) is an object of Cris(X/S) for e≫0 (Stacks Lemma 60.5.5); the crystal property gives M_e=M_{e+1}/pᵉM_{e+1} and the isomorphisms M⊗^∧_{D,p₀}D(1)→M(1)←M⊗^∧_{D,p₁}D(1), whose composite c is expanded in the divided powers of the ξ_i (CR.1/pd-stratification, Taylor coefficients). The connection of F is ∇(s)=p₁^*s−c(p₀^*s) (CR.1/integrable-connection), and ξ_i maps to −dx_i modulo the square of the diagonal ideal, which gives ∇(m)=Σθ_i(m)dx_i.
2. The cocycle identity on D(2), with ζ″_i=ζ_i+ζ′_i and the PD addition formula (ζ+ζ′)^{[k]}=Σ_{a+b=k}ζ^{[a]}ζ′^{[b]}, gives θ_K∘θ_L=θ_{K+L}; no division by K! occurs. The p-adic convergence of the expansion of c(m⊗1) gives topological quasi-nilpotence.
3. Proposition 60.17.4: for an affine object (U,Spec B,δ) choose f:D→B (Stacks Lemma 60.5.6) and put F_T=(M⊗_{D,f}B)~. The sums defining c_{f,g} are finite by CR.1/quasi-nilpotent-connection; c_{g,h}∘c_{f,g}=c_{f,h} and c_{f,f}=1 by the same addition formula, so the value does not depend on f. A morphism a of affine objects gives a^*F_T≅F_T′ by taking f′=f∘a; the sheaf on Cris(X/S) is obtained from these data by CR.1/structure-sheaves.
4. Lemma 60.17.5: choose P=A[y_1,…,y_m]→P′ surjective; a:D→D′ is induced. The kernel of D_e→D′_e is locally nilpotent, so P′→D′_e lifts to P′→D_e and then, step by step along square-zero extensions, to P′→D (formal smoothness of P′ over A), which gives b with a∘b=id. With F and G the base changes along a and b, F∘G=id and G(F(M,∇))≅(M,∇) through c_{id,b∘a}.

**Depends on:** `CR.1/quasi-nilpotent-connection`, `CR.1/pd-stratification`, `CR.1/crystal`, `CR.1/structure-sheaves`, `CR.1/integrable-connection`, `CR.0/pd-polynomial`, `CR.0/pd-envelope`, `CR.1/envelope-differentials`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.17, Lemma 60.17.3, Proposition 60.17.4 and Lemma 60.17.5 (Remark 60.17.6 for the formally smooth case, without proof). Parts (1)–(3) are Lemma 60.17.3, Proposition 60.17.4 and Lemma 60.17.5. The source omits several verifications in the proofs of 60.17.4 and 60.17.5 and gives the formally smooth case only as Remark 60.17.6. The node states nothing beyond these results.; [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.17, proof of Lemma 60.17.3 (definition of ξ_i and the expansion of c). This fixes the sign convention of the Taylor formula: c goes from the p₀-pullback to the p₁-pullback and ξ_i=x_i⊗1−1⊗x_i.

**Acceptance.**

- Sign check on the structure crystal: for F=O_crys, M=D, ∇=d and ε is the identity of D(1); for m=x_j the formula gives ε(x_j⊗1)=p₁(x_j)+ξ_j=p₀(x_j), as D(1)-linearity requires (θ_0(x_j)=x_j, θ_j(x_j)=1 and all other θ_K(x_j) vanish). With ξ_j replaced by p₁(x_j)−p₀(x_j) the right side would be 2p₁(x_j)−p₀(x_j).
- For A=F_p with the zero PD ideal and C=P=F_p[t]: the rank-two connection θ(e₁)=0, θ(e₂)=e₁ corresponds to a crystal, with ε(e₂⊗1)=e₂⊗1+e₁⊗ξ; the pair (F_p[t]·e,∇e=e⊗dt) corresponds to no crystal.

### finite-witt-evaluation — Finite-Witt evaluation and formal coefficient comparison

**Comparison:** `TauCeti.Crystalline.finiteWittEvaluation`. Let k be a perfect field of characteristic p, W=W(k) with the canonical PD structure on (p), W_n=W/pⁿ, Z a smooth k-scheme of finite type and Ẑ a smooth p-adic formal W-scheme with Ẑ⊗_Wk=Z; put Z_n=Ẑ⊗_WW_n. Then (Z,Z_n,γ) is an object of Cris(Z/Spec W_n). Let MIC(Z_n) be the category of O_{Z_n}-modules of finite type with an integrable connection ∇_n:E_n→E_n⊗Ω¹_{Z_n/W_n}. Call (E_n,∇_n) quasi-nilpotent if for every affine open Spec P′ of Z_n the pair (Γ(Spec P′,E_n),∇_n) over D′=P′ is topologically quasi-nilpotent in the sense of CR.1/quasi-nilpotent-connection (Stacks Lemma 60.17.5), and let MIC(Z_n)^qn be the full subcategory of these. (1) Evaluation E↦(E_{Z_n},∇) on the object (Z,Z_n,γ) is an equivalence from Crys(Z/W_n), the crystals of finite type on Cris(Z/Spec W_n), to MIC(Z_n)^qn, compatible with reduction from W_{n+1} to W_n; crystals in finite locally free modules correspond to the (E_n,∇_n) with E_n finite locally free. (2) (E_n,∇_n) in MIC(Z_n) is quasi-nilpotent if and only if its reduction (E_1,∇_1)=(E_n,∇_n)⊗_{W_n}k is. (3) Crys(Z/W) is equivalent to the category of coherent O_Ẑ-modules E with an integrable connection such that (E,∇)⊗_WW_n lies in MIC(Z_n)^qn for every n; such E satisfy E=lim_nE/pⁿE.

**Hypotheses and conventions.**

- k is a perfect field of characteristic p; W=W(k) carries the canonical PD structure on (p); W_n=W/pⁿ.
- Z is a smooth k-scheme of finite type and Ẑ a smooth p-adic formal scheme over W with reduction Z; the lift Ẑ is part of the data and need not exist for every Z.
- Modules are of finite type and connections are integrable.

**Construction or proof.**

1. Z_n is flat over W_n, so γ extends to pO_{Z_n} (CR.0/flat-extension) and (Z,Z_n,γ) is an object of Cris(Z/Spec W_n) (Stacks Remark 60.24.11(1)); the PD envelope of Z in Z_n is Z_n itself and Ω¹_PD(O_{Z_n}/W_n)=Ω¹_{Z_n/W_n} (CR.1/envelope-differentials).
2. (1): on an affine open Spec P′ of Z_n, CR.1/taylor-equivalence (3) identifies crystals in quasi-coherent modules on the corresponding open of Z with pairs over D′=P′; by that equivalence a pair is topologically quasi-nilpotent if and only if it is the evaluation of a crystal, so the condition does not depend on the choice of b. Finite type corresponds to finite type, and E is finite locally free on every thickening if and only if E_{Z_n} is, because every affine thickening maps to Z_n locally. Both categories and the evaluation functor are compatible with restriction to opens of Z (Stacks Lemma 60.9.5); glue.
3. (2): condition (4) of CR.1/quasi-nilpotent-connection for a pair (M,∇) over D only involves M/pM, and the PD envelope over (W_n,(p),γ) reduces modulo p to the PD envelope over (k,0), since the kernel of the reduction is generated by the γ_m(pa)=(pᵐ/m!)aᵐ∈pD (Stacks Lemma 60.2.3).
4. (3): every object of Cris(Z/Spec W) is Zariski locally an object of some Cris(Z/Spec W_n), so a crystal of finite type over W is a compatible system of crystals over the W_n; coherent modules on the noetherian formal scheme Ẑ are the compatible systems of coherent modules on the Z_n (EGA I 10.11.3).

**Depends on:** `CR.1/taylor-equivalence`, `CR.1/isocrystal`, `CR.1/quasi-nilpotent-connection`, `CR.1/crystal`, `CR.1/envelope-differentials`, `CR.0/flat-extension`, `AdicSpacesPartII:F0/coherent-as-inverse-system`, `AdicSpacesPartII:F0/locally-noetherian-formal-scheme`.

**Sources:** [eg](https://page.mi.fu-berlin.de/esnault/preprints/helene/126_esn_gro.pdf), §2.6, p. 15 of the author-hosted manuscript: the paragraph before Theorem 2.19 and the paragraph before Corollary 2.20. Esnault–Groechenig state (1)–(3), with references to Berthelot (LNM 407, II 4.3.10 and IV 1.6.5), Berthelot–Ogus (Exercise 4.14) and Berthelot–Messing (1.3.3) and prove only the induction step of (2). The node defines quasi-nilpotence through Stacks Lemma 60.17.5, for which (1) and (2) follow from Stacks; the sentence on finite locally free objects is the node's.; [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.17, Lemma 60.17.5; §60.24, Remark 60.24.11(1)–(2). Lemma 60.17.5 is the affine form of (1) for the smooth lift; Remark 60.24.11(1)–(2) gives the object (Z,Z_n,γ) and the connection on the restriction to it.

**Acceptance.**

- For Z=𝔸¹_k and Ẑ=Spf W⟨t⟩: (O_Ẑ,d) corresponds to the structure crystal, and the connection ∇e=λe⊗dt on W⟨t⟩·e (λ∈W) corresponds to a crystal on Cris(Z/Spec W) if and only if p divides λ, because modulo p one has θ=∂+λ̄ and θᵖ=λ̄ᵖ.

### etale-crystalline-site — The étale crystalline sites

**Definition:** `TauCeti.Crystalline.etale_crystalline_site`. For a crystalline situation (p,S,X), the big étale crystalline site has the objects and morphisms of CRIS(X/S). A covering family (U_i,T_i,δ_i)→(U,T,δ) is given by jointly surjective étale maps T_i→T, the Cartesian squares U_i=U×_T T_i, and the unique extended divided powers. The small étale crystalline site is its full subcategory where U→X is étale. Its structure and PD ideal sheaves evaluate to O_T and ker(O_T→O_U). Its projection to X_ét sends (U,T,δ) to U. The Zariski crystalline site uses open immersions U→X and Zariski covers of T. Changing the topology of the big site gives ε:CRIS_ét(X/S)→CRIS_Zar(X/S). No equivalence of arbitrary sheaves under this change is asserted.

**Hypotheses and conventions.**

- p is prime, S a PD scheme over ℤ_(p), X→S₀ with p locally nilpotent on X.
- The PD ideal of an object is locally nilpotent, as in the existing crystalline site; étale pullback is flat.

**API.**

- `TauCeti.Crystalline.etale_crystalline_site_toX` (projection): The projection (U,T,δ)↦U takes values in X_ét on the small site and pulls an étale cover of T back to a cover of U.
- `TauCeti.Crystalline.etale_crystalline_site_structure` (data): O_crys,ét(U,T)=Γ(T,O_T) and J_crys,ét(U,T)=ker(Γ(T,O_T)→Γ(U,O_U)); these are étale sheaves.
- `TauCeti.Crystalline.etale_crystalline_site_change` (functoriality): The identity on big-site objects from the finer étale topology gives ε to the big Zariski crystalline topos; ε⁻¹ is étale sheafification of the Zariski sheaf.

**Unit tests.**

- `TauCeti.Crystalline.test_etale_crystalline_identity` (degenerate): An identity of a thickening is an étale covering singleton.
- `TauCeti.Crystalline.test_etale_crystalline_field_cover` (non-example): For X=Spec F_p, the object (Spec F_(p²),Spec F_(p²),0) is small étale over X but not small Zariski over X; the map to (X,X,0) is a covering.
- `TauCeti.Crystalline.test_etale_crystalline_affine_descent` (compatibility): For an affine thickening Spec B and a finite faithfully flat étale B-algebra B′, the equalizer B′⇉B′⊗_B B′ is B, and the equalizer of the pulled-back PD ideals is the original ideal.

**Uses.** CR.1/etale-crystal-comparison and CR.3/etale-hypercover-descent: Allows crystalline coefficients to be used on the étale site while retaining their original structure and PD ideals.

**Construction or proof.**

1. Extend divided powers uniquely under the flat maps T_i→T using flat-extension; the Cartesian U_i identify their kernels.
2. Étale maps and joint surjectivity are stable under composition and base change, giving a pretopology and its generated Grothendieck topology.
3. Étale-local lifting across a nil thickening identifies étale maps to U with their lifts to T; this supplies the small site and the continuity of its projection. Descent for O_T and its ideal gives the ringed structure. The precise nil-thickening étale-lifting input is requested from SF.2.

**Depends on:** `CR.1/crystalline-site`, `CR.1/pd-scheme`, `CR.0/flat-extension`, `CR.0/envelope-etale-extension`, `SchemeAndStackFoundations:SF.2`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.8, Definition 60.8.4 (07I0), variant with étale coverings. Definition of coverings by étale maps of thickenings with Cartesian closed subschemes; the node spells out the small variant as well.; [stacks-descent](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/descent.tex), §35.9, Proposition 35.9.3 (03DW). Descent of quasi-coherent modules and their cohomology supplies the ring and ideal sheaves.

**Acceptance.**

- Over X=S=Spec F_p with zero PD ideal, Spec F_(p²)→Spec F_p is an étale cover in the small étale site, and is not a small Zariski object.

**Signature component.** The small-object full subcategory, the big-site étale covering condition and the identity-cover detector are typed. The associated Grothendieck topology, structural ringed topos, remaining API and two other tests are recorded as omissions; they are not replaced by an uninterpreted proposition.

### etale-crystal-comparison — Change of topology for quasi-coherent crystals

**Comparison:** `TauCeti.Crystalline.etale_crystal_comparison`. Restriction and étale extension give inverse equivalences between quasi-coherent crystals on the small étale and small Zariski crystalline sites. They preserve finite local freeness. For such a crystal E and every Zariski open V⊂X, the natural map RΓ((V/S)_cris,Zar,E)→RΓ((V/S)_cris,ét,E_ét) is an isomorphism, functorial in V and E. Equivalently Ru_Zar,*E agrees with Rν_*Ru_ét,*E_ét for ν:X_ét→X_Zar, as objects with base coefficients f⁻¹O_S.

**Hypotheses and conventions.**

- The crystalline situation of etale-crystalline-site.
- Only quasi-coherent crystals are compared; arbitrary sheaves on these sites need not have the same cohomology.

**Construction or proof.**

1. On an affine thickening the crystal is a quasi-coherent module on T. Étale extension is obtained by flat base change, and faithfully flat module descent makes it unique and compatible on overlaps.
2. Étale maps U′→U lift uniquely across the nil thickening U→T; this reduces extension from Zariski to étale objects to the preceding descent. Restriction and extension are inverse by the crystal transition isomorphisms.
3. For affine thickenings, higher cohomology of quasi-coherent modules vanishes in either topology (Stacks Theorem 59.22.4). Compute by the same PD-envelope Čech–Alexander resolution in either topology. On general V, apply Zariski hypercover descent; the common affine computation gives the derived comparison. The required small-site hypercover/envelope comparison is recorded as an explicit proof contract, rather than an equivalence of topoi.

**Depends on:** `CR.1/etale-crystalline-site`, `CR.1/crystal`, `CR.2/embedding-computation`, `CR.0/envelope-etale-extension`, `EnhancedDerivedSheaves:E2/bounded-below-hypercover-descent`, `SchemeAndStackFoundations:SF.2`.

**Sources:** [stacks-etale-cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/etale-cohomology.tex), §59.22, Theorem 59.22.4 and proof. Quasi-coherent cohomology is independent of the Zariski, étale and flat topology on a scheme; the crystalline deduction is the argument in proofSteps.; [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.17, Lemmas 60.17.2–60.17.3; §60.21, Proposition 60.21.1. PD envelope Čech resolution on affine crystalline opens.

**Acceptance.**

- For Spec F_p the étale extension of the unit crystal has value F_(p²) on its unramified field cover and invariants F_p.
- The comparison of the unit crystal on affine space uses the PD de Rham complex; it does not imply vanishing of crystalline cohomology of affine space.

## CR.2 — The PD Poincaré lemma and de Rham computations

**Targets.** Enhanced crystalline direct image and global sections, The relative PD Poincaré lemma, Crystalline cohomology from an embedding.

### crystalline-cohomology — Enhanced crystalline direct image and global sections

**Construction:** `TauCeti.Crystalline.RΓcrys`. In the situation of CR.1/crystalline-site, with f:X→S the structure map, u_{X/S}:(X/S)_cris→Sh(X_Zar) is a morphism of topoi (CR.1/site-morphisms). It is not a morphism of ringed topoi to (X_Zar,O_X): the natural ring map goes from O_crys to u⁻¹O_X. Through u⁻¹f⁻¹O_S→O_crys every O_crys-module is a module over u⁻¹f⁻¹O_S, and Ru_{X/S,*}:D((X/S)_cris,O_crys)→D(X_Zar,f⁻¹O_S) is the derived direct image. Crystalline cohomology is RΓ_crys(X/S,E)=RΓ(Cris(X/S),E)=RΓ(X_Zar,Ru_{X/S,*}E), an object of D(Γ(S,O_S)). In particular, for a PD ring (A,I,γ) with A a ℤ_(p)-algebra and p nilpotent in A/I, S=Spec A and X an S₀-scheme with p locally nilpotent on X, RΓ_crys(X/S,E)∈D(A) is defined although p need not be nilpotent in A. In that case pᵉA⊂I is stable under γ for e≫0; with S_e=Spec A/pᵉA, Cris(X/S_e) is a full subcategory of Cris(X/S), and for every O_crys-module F with restrictions F_e to Cris(X/S_e) one has RΓ(Cris(X/S),F)≅Rlim_eRΓ(Cris(X/S_e),F_e) (Stacks Remark 60.24.10).

**Hypotheses and conventions.**

- p is a prime number; (S,I,γ) is a PD scheme over ℤ_(p) and S₀=V(I)⊂S; X→S₀ is a morphism of schemes with p locally nilpotent on X (Stacks Situation 60.7.5). E is an O_crys-module, or a complex of O_crys-modules, on Cris(X/S).
- For the limit formula: S=Spec A for a PD ring (A,I,γ) with A a ℤ_(p)-algebra and p nilpotent in A/I, and F is any O_crys-module.

**API.**

- `TauCeti.Crystalline.RΓcrys_comp` (compatibility): RΓ_crys(X/S,−)=RΓ(X_Zar,−)∘Ru_{X/S,*} as functors D((X/S)_cris,O_crys)→D(Γ(S,O_S)), where Ru_{X/S,*} takes values in D(X_Zar,f⁻¹O_S).
- `TauCeti.Crystalline.RΓcrys_map` (functoriality): For a square X→Y over (S,I,γ)→(S′,I′,γ′) as in CR.1/site-morphisms, an O_crys-module F′ on Cris(Y/S′) and a map f_cris⁻¹F′→F of sheaves on Cris(X/S) linear over f_cris⁻¹O_{Y/S′}→O_{X/S}, there is a map RΓ_crys(Y/S′,F′)→RΓ_crys(X/S,F), linear over Γ(S′,O_S′)→Γ(S,O_S).
- `TauCeti.Crystalline.RΓcrys_limit` (characterisation): For a PD ring (A,I,γ) with A a ℤ_(p)-algebra and p nilpotent in A/I, S=Spec A and S_e=Spec A/pᵉA (e≫0): RΓ(Cris(X/S),F)≅Rlim_eRΓ(Cris(X/S_e),F|_{Cris(X/S_e)}) for every O_crys-module F (Stacks Remark 60.24.10).

**Unit tests.**

- `TauCeti.Crystalline.test_RΓcrys_empty` (degenerate): The empty scheme has zero crystalline cohomology.
- `TauCeti.Crystalline.test_RΓcrys_point` (computation): For k a perfect field of characteristic p, X=Spec k and S=Spec W_e(k) with the canonical PD structure on (p): RΓ_crys(X/S,O_crys)=W_e(k) in degree 0.
- `TauCeti.Crystalline.test_RΓcrys_limit_not_groups` (non-example): For X=𝔸¹_{F_p} over S=Spec ℤ_p and F=O_crys, the map H¹(RΓ_crys(X/S,O_crys))→lim_eH¹(RΓ_crys(X/S_e,O_crys)) is not injective: the class of η=Σ_{e>0}pᵉx^{pᵉ−1}dx is nonzero and maps to zero, since η≡d(Σ_{0<j<e}x^{pʲ}) modulo pᵉ (Stacks Example 60.22.2).

**Uses.** Stacks §§60.18, 60.21, 60.23 and Remark 60.24.10; CR.2/embedding-computation; CR.3/derived-base-change; CohomologyComparisons:CP.0: RΓ_crys and Ru_* are the objects computed by de Rham complexes of PD envelopes and compared under base change; the limit formula relates cohomology over a p-adic base to the finite levels and forbids replacing the derived limit by limits of cohomology groups.

**Construction or proof.**

1. u_{X/S} comes from the continuous and cocontinuous functor (U,T,δ)↦U (Stacks Remark 60.9.4); O_crys is an algebra over u⁻¹f⁻¹O_S through the structure morphism of Stacks Remark 60.9.6. The derived direct image and derived global sections are taken in the enhanced derived categories of EnhancedDerivedSheaves:E1.
2. RΓ(Cris(X/S),−)=RΓ(X_Zar,−)∘Ru_{X/S,*} because Γ(Cris(X/S),−)=Γ(X_Zar,u_{X/S,*}−) and u_{X/S,*} preserves injectives.
3. Limit formula, following the hint of Remark 60.24.10: reduce to F injective; then the F_e are injective, the maps Γ(F_{e+1})→Γ(F_e) are surjective, and Γ(F)=lim_eΓ(F_e) because every object of Cris(X/S) is Zariski locally an object of some Cris(X/S_e).

**Depends on:** `CR.1/structure-sheaves`, `CR.1/site-morphisms`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E2/surjective-system-derived-limit`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.24, Remark 60.24.10 (Rlim; a remark with a hint of proof); see also §60.9, Remarks 60.9.4 and 60.9.6. Stacks takes crystalline cohomology to be the cohomology of the site Cris(X/S) in Situation 60.7.5; the limit formula is Remark 60.24.10, stated there with a hint of proof only. The target D(X_Zar,f⁻¹O_S) of Ru_{X/S,*} is made explicit by the node.; [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.9, Remark 60.9.4 (Comparison with Zariski site). u_{X/S} is a morphism of topoi, not of ringed topoi; this is why Ru_{X/S,*} lands in complexes of f⁻¹O_S-modules.

**Acceptance.**

- For k a perfect field of characteristic p: RΓ_crys(Spec k/Spec W_e(k),O_crys)=W_e(k) in degree 0.
- Affine space: for X=𝔸ʳ_{F_p} over S=Spec ℤ_p, RΓ_crys(X/S,O_crys) is the p-adically completed de Rham complex D→Ω¹_D→⋯→Ωʳ_D of D=ℤ_p[x_1,…,x_r]^∧; H⁰=ℤ_p, and H¹ is not p-adically separated when r=1 (Stacks Example 60.22.2).
- Finite-level reduction: for X=𝔸¹_{F_p}, RΓ_crys(X/Spec ℤ/pᵉ,O_crys) is (ℤ/pᵉ)[x]→(ℤ/pᵉ)[x]dx, the reduction modulo pᵉ of the complex over ℤ_p, and the complex over ℤ_p is the derived limit of these (the transition maps are termwise surjective).

### pd-poincare — The relative PD Poincaré lemma

**Theorem:** `TauCeti.Crystalline.pdPoincare`. (1) Let A be a ring and P=A⟨x_i⟩_{i∈W} a PD polynomial algebra on any set W of variables, with its PD ideal P₊. For every A-module N the complex 0→N→N⊗_AP→N⊗_AΩ¹_PD(P/A)→N⊗_AΩ²_PD(P/A)→⋯ is exact (Stacks Lemma 60.20.1). (2) Let (B,I,δ) be a PD ring with B an A-algebra, P=B⟨x_i⟩_{i∈W} with PD ideal IP+P₊, and M a B-module with an integrable connection ∇:M→M⊗_BΩ¹_PD(B/A). Then the map of de Rham complexes M⊗_BΩ^•_PD(B/A)→M⊗_BΩ^•_PD(P/A) is a quasi-isomorphism (Stacks Lemma 60.20.2). (3) Let p be a prime. In (1), with D₀ the p-adic completion of P and Ωⁱ_{D₀} the p-adic completion of Ωⁱ_PD(P/A), the complex 0→N→N⊗^∧_AD₀→N⊗^∧_AΩ¹_{D₀}→⋯ is exact for every p-adically complete A-module N. In (2), with D and D′ the p-adic completions of B and P and Ωⁱ_D, Ωⁱ_{D′} the p-adic completions of Ωⁱ_PD(B/A) and Ωⁱ_PD(P/A), the map M⊗^∧_DΩ^•_D→M⊗^∧_DΩ^•_{D′} is a quasi-isomorphism for every p-adically complete D-module M with an integrable connection ∇:M→M⊗^∧_DΩ¹_D. (4) For one variable z over B the contraction is explicit: on Ω^•_PD(B⟨z⟩/B), the B-linear map h with h(z^{[n]}dz)=z^{[n+1]} and h=0 in degree 0 satisfies dh+hd=id−ev₀, where ev₀ is evaluation at z=0 in degree 0 and zero in degree 1 (Stacks Example 60.25.2).

**Hypotheses and conventions.**

- A is a commutative ring and W any set of variables.
- In (2): (B,I,δ) is a PD ring, B an A-algebra, and M a B-module with an integrable connection relative to Ω¹_PD(B/A).
- In (3): p is a prime number, the modules N and M are p-adically complete, and ⊗^∧ is the p-adically completed tensor product.

**Construction or proof.**

1. (1): for N=A the complex is a direct sum, over the multi-indices K of finite support, of subcomplexes E(K) spanned by the forms ∏_{i∉I}x_i^{[k_i]}∏_{i∈I}x_i^{[k_i−1]}dx_{i₁}∧⋯∧dx_{i_j} with I⊂Supp(K); E(0) is A→A and for K≠0, E(K) is the complex 0→A→⊕_{s∈S}A→∧²(⊕_{s∈S}A)→⋯ with S=Supp(K), which is homotopic to zero. So the complex for N=A is homotopy equivalent to zero as a complex of A-modules, and tensoring with N keeps this (proof of Stacks Lemma 60.20.1). For one variable the homotopy is the one in (4).
2. (2): filter Ω^•_PD(P/A) by Fⁱ=σ_{≥i}Ω^•_PD(B/A)∧Ω^•_PD(P/A). The sequence 0→Ω¹_PD(B/A)⊗_BP→Ω¹_PD(P/A)→Ω¹_PD(P/B)→0 is split with last term free on the dx_i (CR.1/pd-differentials, adjoining PD variables), so grⁱ_F(M⊗_BΩ^•_PD(P/A))=M⊗_BΩⁱ_PD(B/A)⊗_BΩ^•_PD(P/B), which by (1) is quasi-isomorphic to M⊗_BΩⁱ_PD(B/A) in degree 0; the filtration is finite in each degree, so the map is a quasi-isomorphism.
3. (3): the same arguments after p-adic completion; the homotopies of (1) are termwise linear maps and pass to completions.
4. (4): d(z^{[n]})=z^{[n−1]}dz, so dh(z^{[n]}dz)=z^{[n]}dz and hd(z^{[n]})=z^{[n]} for n≥1, hd(1)=0.

**Depends on:** `CR.0/pd-polynomial`, `CR.1/pd-differentials`, `CR.1/integrable-connection`, `mathlib:AdicCompletion`, `mathlib:AdicCompletion.map`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.20, Lemmas 60.20.1 and 60.20.2; §60.25, Lemma 60.25.1 and Example 60.25.2. Lemma 60.20.1 is (1) and its completed form, Lemma 60.20.2 is (2) and its completed form (its display has ⊗_P where ⊗_B is meant, and 'integral connection' is a misprint for integrable), and Example 60.25.2 with Lemma 60.25.1 is (4). The node states nothing beyond them.

**Acceptance.**

- 0→A→A⟨z⟩→A⟨z⟩dz→0 is exact, with d(z^{[n]})=z^{[n−1]}dz and contraction h(z^{[n]}dz)=z^{[n+1]}.
- Divided powers are needed: in the ordinary de Rham complex of F_p[z] the form z^{p−1}dz is closed and not exact.
- A constant crystal: for (B,I,δ)=(A,0,∅) and M=N with the zero connection, (2) says that N→N⊗_AΩ^•_PD(A⟨x_i⟩/A) is a quasi-isomorphism, which is (1).

### embedding-computation — Crystalline cohomology from an embedding

**Theorem:** `TauCeti.Crystalline.crysEmbeddingComputation`. Setting for (1)–(4): Stacks Situation 60.5.1 with X=Spec C and S=Spec A, P=A[x_i]→C a surjection from a polynomial algebra, D(n) the p-adically completed PD envelopes of CR.1/pd-stratification, D=D(0), and T(n)_e=Spec D(n)/pᵉD(n), so that (X,T(n)_e,γ̄) is an object of Cris(X/S) for e≫0. (1) (Čech–Alexander complex.) Let F be an O_crys-module on Cris(X/S) such that every restriction F_T is quasi-coherent and c_f:f^*F_T′→F_T is surjective for every morphism of Cris(X/S) with f:T→T′ a closed immersion. Then M(n)=lim_eΓ((X,T(n)_e,γ̄),F) is a cosimplicial module over the cosimplicial ring D(•), and the complex M(0)→M(1)→M(2)→⋯ computes RΓ(Cris(X/S),F) (Stacks Proposition 60.21.1). (2) For such F, Hʲ(Cris(X/S),F⊗_{O_crys}Ωⁱ_{X/S})=0 for all i>0 and j≥0 (Stacks Lemma 60.21.2). (3) If F is a crystal in quasi-coherent modules and (M,∇) the associated module with connection over D (CR.1/taylor-equivalence), then M⊗^∧_DΩ^•_D computes RΓ(Cris(X/S),F) (Stacks Proposition 60.21.3); if p is nilpotent in A the completions may be omitted. (4) If A→P′→C are ring maps with P′ smooth over A and P′→C surjective, D′ is the p-adic completion of the PD envelope of the kernel and (M′,∇′) is the pair over D′ associated to F, then M′⊗^∧_{D′}Ω^•_{D′} computes RΓ(Cris(X/S),F) (Stacks Lemma 60.21.4). (5) (Sheaf form.) In the situation of CR.1/crystalline-site, for a crystal F in quasi-coherent modules, Ru_{X/S,*}(F⊗_{O_crys}Ωⁱ_{X/S})=0 for all i>0, so the map of complexes F⊗Ω^•_{X/S}→F[0] becomes an isomorphism after Ru_{X/S,*} (Stacks Proposition 60.23.1); for every object (U,T,δ) this gives a canonical map RΓ(Cris(X/S),F)→RΓ(T,F_T⊗_{O_T}Ω^•_{T/S,δ}). (6) (Closed embedding.) If moreover p is locally nilpotent on S and X→P is a closed S₀-immersion into a smooth S-scheme with PD envelope D, then (X,D,γ̄) is an object of Cris(X/S) and the map of (5) for T=D induces an isomorphism Ru_{X/S,*}F≅F_D⊗_{O_P}Ω^•_{P/S} in D(X_Zar,f⁻¹O_S).

**Hypotheses and conventions.**

- (1)–(4): p is a prime number; (A,I,γ) is a PD ring with A a ℤ_(p)-algebra; A→C is a ring map with IC=0 and p nilpotent in C; X=Spec C and S=Spec A (Stacks Situation 60.5.1). P is a polynomial A-algebra on any set of variables with a surjection onto C; in (4), P′ is a smooth A-algebra with a surjection onto C.
- (5)–(6): p is a prime number; (S,I,γ) is a PD scheme over ℤ_(p) and S₀=V(I)⊂S; X→S₀ is a morphism of schemes with p locally nilpotent on X (Stacks Situation 60.7.5). In (6), p is locally nilpotent on S and P is a smooth S-scheme with a closed S₀-immersion X→P.
- F is an O_crys-module on the small site Cris(X/S) with the properties stated in each part; in (3)–(6) it is a crystal in quasi-coherent modules.

**Construction or proof.**

1. (1): the cohomology of a module with quasi-coherent restrictions vanishes on affine objects (Stacks Lemma 60.18.1), so RΓ(Cris(X/S),F) is the cohomology of the category of thickenings (X,T,δ) with the chaotic topology (Lemma 60.18.2). The surjectivity hypothesis makes the transition maps F(B_{e+1})→F(B_e) surjective, so passing to the category Cris^∧(C/A) of complete thickenings does not change cohomology (Lemma 60.18.3). There D is weakly final (Lemma 60.5.7) with D×⋯×D=D(n) (Lemma 60.17.2), and Lemma 60.18.4 gives the complex.
2. (2): the cosimplicial module Ω_{D(•)} is homotopic to zero (Example 60.19.1, Lemma 60.19.2), and homotopies are preserved by exterior powers, tensor products and completion (Lemma 60.16.1), so M(•)⊗^∧Ωⁱ_{D(•)} is homotopic to zero for i>0 (Lemma 60.19.3); apply (1) to F⊗Ωⁱ_{X/S}.
3. (3): the double complex K^{a,b}=M⊗^∧_DΩ^a_{D(b)} has acyclic columns for a>0 by (2), and its column a=0 computes RΓ by (1). Each row is quasi-isomorphic to M⊗^∧_DΩ^•_D by CR.2/pd-poincare, because D(b) is the completion of a PD polynomial algebra over D (Lemma 60.17.1), and the b+1 coprojections induce the same map on cohomology; compare the two spectral sequences.
4. (4): with a:D→D′ and b:D′→D as in CR.1/taylor-equivalence (3), it suffices that every PD A-endomorphism ρ of D over C induces a quasi-isomorphism M⊗^∧_DΩ^•_D→M⊗^∧_{D,ρ}Ω^•_D; factor ρ through D⟨ξ_i⟩^∧ by x_i↦x_i+ξ_i and ξ_i↦ρ(x_i)−x_i and apply CR.2/pd-poincare twice.
5. (5): by localisation (Stacks Lemma 60.9.5) the cohomology of Ru_{X/S,*}(F⊗Ωⁱ_{X/S}) over an affine open of X lying over an affine open of S is that of (2). (6): X→D is a thickening because p is locally nilpotent on D; on affine opens the map of (5) for T=D is the quasi-isomorphism of (4), as in the hint to Stacks Remark 60.24.11.

**Depends on:** `CR.2/crystalline-cohomology`, `CR.2/pd-poincare`, `CR.1/envelope-differentials`, `CR.1/pd-differentials`, `CR.1/taylor-equivalence`, `CR.1/pd-stratification`, `CR.1/integrable-connection`, `CR.1/site-morphisms`, `CR.1/structure-sheaves`, `EnhancedDerivedSheaves:E2/hypercover`, `EnhancedDerivedSheaves:E2/bounded-below-hypercover-descent`, `ArithmeticGaloisDuality:R02.2/first-quadrant-spectral-sequence`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.21, Propositions 60.21.1 and 60.21.3, Lemmas 60.21.2 and 60.21.4; §60.23, Proposition 60.23.1 and the map displayed after Remark 60.23.2; §60.24, Remark 60.24.11 (hint) for part (6). Parts (1)–(4) are Proposition 60.21.1, Lemma 60.21.2, Proposition 60.21.3 and Lemma 60.21.4; part (5) is Proposition 60.23.1 with the map displayed after Remark 60.23.2. Part (6), for a closed embedding into a smooth S-scheme, is not stated in Stacks: it is obtained from (4) and (5) as in the hint to Remark 60.24.11, which treats a smooth lift.; [illusie-drw](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), Part 0, §3.2 (Calcul de la cohomologie cristalline): 3.2.1–3.2.3, Théorème 3.2.4 ((3.2.4.1), (3.2.4.2)) and 3.2.5, printed pp. 536–539. Part (6), as a recall of Berthelot's theorem: for p locally nilpotent on S, X an S-scheme to which γ extends (in particular X over S₀=V(I)), i:X→Y a closed S-immersion into a smooth S-scheme with PD envelope Ȳ, and E a crystal of O_(X/S)-modules, Ru_(X/S*)E≅E_Ȳ⊗_(O_Y)Ω^*_(Y/S) canonically in D(X,f⁻¹O_S), multiplicatively for E=O_(X/S) and independently of the embedding. The recall gives no proof beyond the reduction in the excerpt (Berthelot's book, IV 1.3.2 and V 2.3.2) and does not say that the isomorphism is induced by the map of part (5).

**Acceptance.**

- Affine space: for C=F_p[x_1,…,x_r] over A=ℤ_p and P=ℤ_p[x_1,…,x_r], D is the p-adic completion of P and RΓ(Cris(X/S),O_crys) is D→Ω¹_D→⋯→Ωʳ_D (Stacks Example 60.22.2); over A=ℤ/pᵉ it is the de Rham complex of (ℤ/pᵉ)[x_1,…,x_r].
- A constant crystal: for a finite free A-module N and F=N⊗_AO_crys, (M,∇)=(N⊗_AD,1⊗d) and the complex of (3) is N⊗_AΩ^•_D.
- A singular case: for C=F_p[x,y]/(x²,xy,y²) over A=ℤ_p, τ=γ̄_p(x²)γ̄_p(y²)−γ̄_p(xy)²∈D is a nonzero class in H⁰(Cris(X/S),O_crys) with pτ=0 (Stacks Example 60.22.1).

### linearization — Crystalline linearization along a smooth embedding

**Construction:** `TauCeti.Crystalline.linearization`. Setting: p a prime, (A,I,γ) a PD ring with p nilpotent in A, A→C a ring map with IC=0, X=Spec C, S=Spec A, P=A[x_1,…,x_d] with a surjection P→C with kernel J, and D=D_{P,γ}(J), so that (X,Spec D,γ̄) is an object of Cris(X/S). Construction: for an object (U,T,δ) of Cris(X/S) let (U,D_T,δ_T)=(U,T,δ)×(X,Spec D,γ̄) be the product in Cris(X/S), with projections pr_T:D_T→T and pr_D:D_T→Spec D; D_T is the PD envelope of U in T×_SSpec P relative to δ. For a D-module N the linearization L(N) is the O_crys-module on Cris(X/S) with L(N)_T=pr_{T,*}pr_D^*Ñ and the restriction maps given by functoriality of the product. (1) If T=Spec B is affine and h:D→B is a morphism of thickenings, then D_T=Spec B⟨ξ_1,…,ξ_d⟩ with pr_D given by x_i↦h(x_i)+ξ_i, so L(N)(U,T,δ)=N⊗_DB⟨ξ_1,…,ξ_d⟩; L(N) is a crystal in quasi-coherent O_crys-modules. (2) RΓ(Cris(X/S),L(N))≅N, placed in degree 0. (3) L(Ω^q_PD(D/A))_T=pr_{T,*}Ω^q_PD(D_T/T), and the relative PD de Rham differentials of D_T over T make L(Ω^•_PD(D/A)) a complex of O_crys-modules with an augmentation O_crys→L(D). For a crystal E in quasi-coherent O_crys-modules with value E_D on Spec D, E⊗_{O_crys}L(Ω^q_PD(D/A))≅L(E_D⊗_DΩ^q_PD(D/A)), and the augmented complex E→E⊗_{O_crys}L(Ω^•_PD(D/A)) is exact: E is resolved by linearizations.

**Hypotheses and conventions.**

- p is a prime number; (A,I,γ) is a PD ring with p nilpotent in A; A→C is a ring map with IC=0; X=Spec C and S=Spec A.
- P=A[x_1,…,x_d] with a surjection P→C of A-algebras with kernel J; D=D_{P,γ}(J) is the PD envelope (no completion is needed).
- N is a D-module; in (3), E is a crystal in quasi-coherent O_crys-modules on Cris(X/S).

**API.**

- `TauCeti.Crystalline.linearization_eval` (data): L(N)(U,T,δ)=Γ(D_T,pr_D^*Ñ) with (U,D_T,δ_T)=(U,T,δ)×(X,Spec D,γ̄); for T=Spec B affine and h:D→B a morphism of thickenings, D_T=Spec B⟨ξ_1,…,ξ_d⟩ with pr_D:x_i↦h(x_i)+ξ_i and L(N)(U,T,δ)=N⊗_DB⟨ξ_1,…,ξ_d⟩.
- `TauCeti.Crystalline.linearization_map` (functoriality): A D-linear map N→N′ induces a map of O_crys-modules L(N)→L(N′), compatibly with composition and with the restriction maps.
- `TauCeti.Crystalline.linearization_augmentation` (constructor): For a crystal E in quasi-coherent O_crys-modules, the maps E_T→pr_{T,*}pr_T^*E_T=pr_{T,*}pr_D^*Ẽ_D define E→L(E_D), and L(E_D⊗_DN)≅E⊗_{O_crys}L(N) for every D-module N.
- `TauCeti.Crystalline.linearization_cohomology` (characterisation): RΓ(Cris(X/S),L(N))≅N in degree 0: Γ(Cris(X/S),L(N))=N and Hⁱ(Cris(X/S),L(N))=0 for i>0.
- `TauCeti.Crystalline.linearization_resolution` (characterisation): L(Ω^•_PD(D/A)), with L(Ω^q_PD(D/A))_T=pr_{T,*}Ω^q_PD(D_T/T) and the relative PD de Rham differentials, is a complex of O_crys-modules, and for every crystal E in quasi-coherent O_crys-modules the augmented complex E→E⊗_{O_crys}L(Ω^•_PD(D/A)) is exact.

**Unit tests.**

- `TauCeti.Crystalline.test_linearization_zero` (degenerate): L(0)=0.
- `TauCeti.Crystalline.test_linearization_identity` (computation): For A=F_p with the zero PD ideal and C=P=F_p[x], so that D=F_p[x] and X=Spec D: L(D)(X,X,∅)=F_p[x]⟨ξ⟩, where the two maps from F_p[x] are x↦x and x↦x+ξ; this is free of infinite rank over F_p[x] and is not D. RΓ(Cris(X/S),L(D))=F_p[x] in degree 0.
- `TauCeti.Crystalline.test_linearization_PD` (non-example): For the same data, L(D)(X,X,∅)=F_p[x]⟨ξ⟩ is not the polynomial ring F_p[x][ξ]: ξᵖ=p!·ξ^{[p]}=0 in it, and ξ^{[p]} is not a polynomial in ξ.

**Uses.** Stage CR.2 (linearization and its acyclicity); CR.4/crystalline-comparison: Turns a module on the PD envelope into a crystal with no higher cohomology and resolves a crystal by such linearizations; CR.4/crystalline-comparison uses the same device for Witt differential operators with flat coefficients (Langer–Zink §3.5).

**Construction or proof.**

1. Products exist in Cris(X/S) (CR.1/crystalline-site). For an affine object with ring B and PD ideal J_B, the product with (X,Spec D,γ̄) is the PD envelope over (B,J_B,δ) of the kernel of B[x_1,…,x_d]→B/J_B; with h:D→B (it exists by Stacks Lemma 60.5.6) this kernel is J_BB[x]+(x_i−h(x_i)), and the envelope is B⟨ξ_i⟩ with ξ_i=x_i−h(x_i) (Stacks Lemma 60.2.5).
2. Crystal property: for a morphism of affine objects given by B→B′ and h′ the composite, B′⟨ξ⟩=B⟨ξ⟩⊗_BB′ compatibly with the maps from D.
3. (2): L(N) satisfies the hypotheses of CR.2/embedding-computation (1), so RΓ is computed by the cosimplicial module n↦L(N)(X,Spec D(n),γ̄)=N⊗_DD(n+1), using D(n)×D=D(n+1) (Stacks Lemma 60.17.2). This cosimplicial module is homotopy equivalent to the constant one with value N: the codegeneracies D(n+1)→D(n) multiplying the last two factors are an extra degeneracy.
4. (3): Ω^q_PD(B⟨ξ⟩/B)=B⟨ξ⟩⊗_PΩ^q_{P/A} (CR.1/envelope-differentials over the base B), E_{D_T}=E_T⊗_BB⟨ξ⟩ by the crystal property along pr_T, and 0→E_T→E_T⊗_BB⟨ξ⟩→E_T⊗_BΩ¹_PD(B⟨ξ⟩/B)→⋯ is exact by CR.2/pd-poincare (1).

**Depends on:** `CR.0/pd-envelope`, `CR.0/pd-polynomial`, `CR.1/crystalline-site`, `CR.1/crystal`, `CR.1/pd-stratification`, `CR.1/pd-differentials`, `CR.1/envelope-differentials`, `CR.2/pd-poincare`, `CR.2/embedding-computation`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.20, Lemma 60.20.1; §60.2, Lemma 60.2.5; §60.5, Lemma 60.5.6; §60.17, Lemma 60.17.2; §60.21, Proposition 60.21.1 (the lemmas used in the proof; the chapter contains no linearization functor). The cited Stacks sections do not contain the linearization functor or its acyclicity. They supply the lemmas from which the node's statements are proved in the affine case with polynomial P: Lemma 60.2.5 for D_T, Proposition 60.21.1 and Lemma 60.17.2 for (2), Lemma 60.20.1 (quoted) for (3). The classical source is Berthelot–Ogus, Notes on Crystalline Cohomology, §6.

**Acceptance.**

- For A=F_p with the zero PD ideal and C=P=F_p[x] (so D=F_p[x], X=Spec D): L(D)(X,X,∅)=F_p[x]⟨ξ⟩, which is free of infinite rank over F_p[x]; it is not D.
- For the same data the complex L(Ω^•_PD(D/A)) on (X,X,∅) is F_p[x]⟨ξ⟩→F_p[x]⟨ξ⟩dξ, ξ^{[n]}↦ξ^{[n−1]}dξ, linear over F_p[x]; its kernel is F_p[x] and it is surjective, so O_crys→L(Ω^•_PD(D/A)) is exact on this object.
- RΓ(Cris(X/S),L(D))=F_p[x] in degree 0 for the same data.

### embedding-independence — Independence of the presentation and of the embedding

**Theorem:** `TauCeti.Crystalline.crysEmbeddingIndependent`. In the setting of CR.2/embedding-computation (1)–(4), let F be a crystal in quasi-coherent O_crys-modules and (M,∇) the associated module with connection over D. (1) For every PD A-algebra endomorphism ρ:D→D compatible with the maps to C, the induced map M⊗^∧_DΩ^•_D→M⊗^∧_{D,ρ}Ω^•_D is a quasi-isomorphism (proof of Stacks Lemma 60.21.4). (2) For ring maps A→P′→C with P′ smooth and P′→C surjective, a surjection P→P′ from a polynomial algebra and a:D→D′, b:D′→D as in CR.1/taylor-equivalence (3), the base change maps M′⊗^∧_{D′}Ω^•_{D′}→M⊗^∧_DΩ^•_D along b and M⊗^∧_DΩ^•_D→M′⊗^∧_{D′}Ω^•_{D′} along a are quasi-isomorphisms (Stacks Lemma 60.21.4). (3) Each of the b+1 coprojections D→D(b) induces a quasi-isomorphism M⊗^∧_DΩ^•_D→M⊗^∧_DΩ^•_{D(b)}, and they all induce the same map in the derived category, the inverse being induced by the codiagonal D(b)→D (proof of Stacks Proposition 60.21.3). (4) Let P₁→C and P₂→C be surjections from polynomial A-algebras, with completed envelopes D₁, D₂, and D₁₂ the completed envelope of the kernel of P₁⊗_AP₂→C, and let (M₁,∇), (M₂,∇), (M₁₂,∇) be the modules with connection of F. Then D₁₂ is the p-adic completion of a PD polynomial algebra over D₁ and over D₂, and the maps M₁⊗^∧Ω^•_{D₁}→M₁₂⊗^∧Ω^•_{D₁₂}←M₂⊗^∧Ω^•_{D₂} are quasi-isomorphisms compatible with the identifications of the three complexes with RΓ(Cris(X/S),F). (5) Any two PD A-algebra maps g,h:D₂→D₁ compatible with the maps to C induce the same map M₂⊗^∧Ω^•_{D₂}→M₁⊗^∧Ω^•_{D₁} in the derived category.

**Hypotheses and conventions.**

- p is a prime number; (A,I,γ) is a PD ring with A a ℤ_(p)-algebra; A→C is a ring map with IC=0 and p nilpotent in C; X=Spec C and S=Spec A (Stacks Situation 60.5.1). F is a crystal in quasi-coherent O_crys-modules on Cris(X/S).
- P, P₁ and P₂ are polynomial A-algebras on any sets of variables, each with a surjection onto C; P′ is a smooth A-algebra with a surjection onto C.

**Construction or proof.**

1. (1): write ρ(x_i)=x_i+z_i with z_i in the PD ideal of D. Then ρ=τ∘σ with σ:D→D⟨ξ_i⟩^∧, x_i↦x_i+ξ_i, and τ the PD D-algebra map with ξ_i↦z_i. The automorphism α of D⟨ξ_i⟩^∧ with x_i↦x_i−ξ_i, ξ_i↦ξ_i makes α∘σ the inclusion, so σ induces a quasi-isomorphism by CR.2/pd-poincare; the inclusion D→D⟨ξ_i⟩^∧ is a section of τ, so τ induces one too.
2. (2): a∘b=id shows that one composite is the identity; the other composite is the map induced by ρ=b∘a, a quasi-isomorphism by (1).
3. (3): D(b) is the completion of a PD polynomial algebra over D through each coprojection (Stacks Lemma 60.17.1), so CR.2/pd-poincare applies; each coprojection is a section of the codiagonal.
4. (4): P₁⊗_AP₂=P₁[y_j], and the kernel of P₁[y_j]→C is J₁P₁[y_j]+(y_j−f_j) for lifts f_j∈P₁ of the images of the y_j, so D₁₂ is the completion of D_{P₁,γ}(J₁)⟨y_j−f_j⟩ (Stacks Lemma 60.2.5); apply CR.2/pd-poincare. The identifications with RΓ of CR.2/embedding-computation (1) and (3) are natural in the presentation P→C.
5. (5): g and h define (g,h):D₂(1)→D₁ with g=(g,h)∘p₀ and h=(g,h)∘p₁, and p₀, p₁ induce the same map in the derived category by (3).

**Depends on:** `CR.2/embedding-computation`, `CR.2/pd-poincare`, `CR.1/taylor-equivalence`, `CR.1/pd-stratification`, `CR.0/pd-polynomial`, `CR.0/pd-envelope`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.21, proof of Lemma 60.21.4 and proof of Proposition 60.21.3; §60.17, Lemma 60.17.1; §60.2, Lemma 60.2.5. Parts (1)–(3) are steps of the proofs of Lemma 60.21.4 and Proposition 60.21.3. Parts (4) and (5), on two polynomial presentations and their product, are not stated in Stacks; they follow from Lemma 60.2.5, Lemma 60.20.2 and (3).

**Acceptance.**

- A smooth hypersurface through two embeddings: for k a perfect field of characteristic p, A=W_e(k) with the canonical PD structure on (p), f∈A[x_1,…,x_n] with nonzero reduction f̄, X=Spec k[x]/(f̄), and P′=A[x]/(f) smooth over A: the presentation P=A[x] gives D=A[x]⟨ξ⟩/(ξ−f), the presentation P′ gives D′=P′, and the PD map a:D→D′ (ξ^{[m]}↦0 for m≥1) induces a quasi-isomorphism Ω^•_PD(D/A)→Ω^•_{P′/A}; both complexes compute RΓ_crys(X/Spec W_e(k),O_crys).

### smooth-lift-filtration — Smooth-lift comparison and PD filtration

**Comparison:** `TauCeti.Crystalline.crysSmoothLiftFiltration`. (1) (Smooth lift; Stacks Remark 60.24.11.) Let p be a prime, (A,I,γ) a PD ring with p nilpotent in A, S=Spec A, S₀=Spec A/I, Y a smooth S-scheme, X=Y×_SS₀, and F a crystal in quasi-coherent O_crys-modules on Cris(X/S). Then γ extends to a PD structure on the ideal of X in Y, so that (X,Y,γ) is an object of Cris(X/S); the restriction F_Y carries a canonical integrable connection ∇:F_Y→F_Y⊗_{O_Y}Ω_{Y/S}; and RΓ(Cris(X/S),F)≅RΓ(Y,F_Y⊗_{O_Y}Ω^•_{Y/S}) in D(A). (2) (Filtration on an envelope.) Let (A,I,γ) be a PD ring, P an A-algebra, J⊂P an ideal containing IP, (D,J̄,γ̄) the PD envelope and J̄^{[a]} the PD powers of J̄ (CR.0/pd-filtration), with J̄^{[a]}=D for a≤0. Then d(J̄^{[a]})⊂J̄^{[a−1]}·Ω¹_PD(D/A). Hence for every integer r the submodules Filʳ(Ω^q_PD(D/A))=J̄^{[r−q]}·Ω^q_PD(D/A) form a subcomplex Filʳ of Ω^•_PD(D/A), decreasing in r, equal to the whole complex for r≤0; and for a D-module M with integrable connection the submodules J̄^{[r−q]}·(M⊗_DΩ^q_PD(D/A)) form a subcomplex of M⊗_DΩ^•_PD(D/A). (3) If I=0 and J=0, so that D=P, then Filʳ=σ_{≥r}Ω^•_{P/A}, the stupid truncation. In the situation of (1), for D=O_Y and J̄=IO_Y, the image of Filʳ in Ω^•_{X/S₀} is σ_{≥r}Ω^•_{X/S₀}.

**Hypotheses and conventions.**

- (1): p is a prime number, (A,I,γ) a PD ring with p nilpotent in A, Y a smooth scheme over S=Spec A, X=Y×_SSpec A/I, and F a crystal in quasi-coherent O_crys-modules on Cris(X/S).
- (2): (A,I,γ) is a PD ring, P an A-algebra and J⊂P an ideal containing IP; q≥0 and r is any integer; M is a D-module with an integrable connection relative to Ω¹_PD(D/A).

**Construction or proof.**

1. (1), following the hint of Stacks Remark 60.24.11: Y is flat over S, so γ extends to IO_Y (CR.0/flat-extension); the connection is that of CR.1/integrable-connection on the object (X,Y,γ), and Ω¹_PD(O_Y/S)=Ω_{Y/S} by CR.1/envelope-differentials; the map RΓ(Cris(X/S),F)→RΓ(Y,F_Y⊗Ω^•_{Y/S}) of CR.2/embedding-computation (5) is an isomorphism over affine opens by CR.2/embedding-computation (4), so Ru_{X/S,*}F≅F_Y⊗Ω^•_{Y/S} on Y_Zar=X_Zar.
2. (2): J̄^{[a]} is generated by the products γ̄_{e₁}(x₁)⋯γ̄_{e_t}(x_t) with x_j∈J̄ and Σe_j≥a; by d(γ̄_n(x))=γ̄_{n−1}(x)dx and the Leibniz rule, d of b times such a product lies in J̄^{[a]}Ω¹+J̄^{[a−1]}Ω¹=J̄^{[a−1]}Ω¹_PD(D/A). For coefficients use ∇(jη)=dj∧η+j∇(η).
3. (3): for I=0 and J=0 every positive PD power is zero. In (1) the PD powers (IO_Y)^{[a]} with a≥1 lie in IO_Y and map to zero in O_X.

**Depends on:** `CR.2/embedding-computation`, `CR.1/pd-differentials`, `CR.1/envelope-differentials`, `CR.1/integrable-connection`, `CR.0/pd-filtration`, `CR.0/flat-extension`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.24, Remark 60.24.11 (Comparison; a remark with a hint of proof). Part (1) is Remark 60.24.11, which Stacks states with a hint of proof only. The filtration Filʳ on the de Rham complex of an envelope and parts (2)–(3) are not in Stacks; they are verified directly from d(γ_n(x))=γ_{n−1}(x)dx. No comparison of Filʳ with crystalline cohomology is stated here or in Stacks.; [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.6, the definition of I^{[n]} before Lemma 60.6.3. The PD powers used to define Filʳ; Stacks defines the ideals and no filtration on a de Rham complex.

**Acceptance.**

- For S=S₀ (I=0) and Y=X smooth over S, Filʳ=σ_{≥r}Ω^•_{X/S}, and (1) reads RΓ(Cris(X/S),O_crys)≅RΓ(X,Ω^•_{X/S}).
- For k a perfect field of characteristic p, Y=S=Spec W_e(k) and X=Spec k: Filʳ is the ideal (p)^{[r]} of W_e(k), generated by the pⁿ/n! with n≥r.
- For D=A⟨x⟩ (P=A[x], J=(x), I=0): Filʳ is spanned in degree 0 by the x^{[n]} with n≥r and in degree 1 by the x^{[n]}dx with n≥r−1, and d(x^{[n]})=x^{[n−1]}dx respects this.

### formal-and-end0 — Formal comparison with trace-free endomorphism coefficients

**Comparison:** `TauCeti.Crystalline.crysFormalEnd0`. (1) (Stacks Remark 60.24.14.) Let p be a prime, (A,I,γ) a PD ring with A noetherian and p-adically complete and p nilpotent in A/I, S=Spec A, S₀=Spec A/I, Y a proper smooth S-scheme, X=Y×_SS₀, and F a crystal of finite type in quasi-coherent O_crys-modules on Cris(X/S). Then there is a coherent O_Y-module F_Y with an integrable connection ∇:F_Y→F_Y⊗_{O_Y}Ω_{Y/S} such that F_Y/pᵉF_Y with its connection is the module with connection over A/pᵉA of CR.2/smooth-lift-filtration (1), and RΓ(Cris(X/S),F)≅RΓ(Y,F_Y⊗_{O_Y}Ω^•_{Y/S}) in D(A). (2) For A=W(k) with k a perfect field, I=(p) and K=W(k)[1/p]: RΓ(Cris(X/S),F)⊗_{W(k)}K≅RΓ(Y_K,F_{Y_K}⊗Ω^•_{Y_K/K}). (3) (Trace-free endomorphisms.) Let E be a crystal in finite locally free O_crys-modules of constant rank r≥1. The trace tr:End(E)=E^∨⊗E→O_crys is a surjective map of crystals, End⁰(E):=Ker(tr) is a crystal in finite locally free modules of rank r²−1, and (1) and (2) apply to End(E) and End⁰(E). The map O_crys⊕End⁰(E)→End(E), (a,φ)↦a·id+φ, has cokernel O_crys/r·O_crys; it is an isomorphism if p does not divide r, and it is not surjective if p divides r and X is nonempty.

**Hypotheses and conventions.**

- (1): p is a prime number; (A,I,γ) is a PD ring with A noetherian and p-adically complete and p nilpotent in A/I; Y is proper and smooth over S=Spec A; X=Y×_SSpec A/I; F is a crystal of finite type in quasi-coherent O_crys-modules on Cris(X/S).
- (2): A=W(k) for a perfect field k of characteristic p, with the canonical PD structure on (p).
- (3): E is a crystal in finite locally free O_crys-modules of constant rank r≥1.

**Construction or proof.**

1. For every e, F restricts to a crystal on Cris(X/S_e), S_e=Spec A/pᵉA, and CR.2/smooth-lift-filtration (1) gives a coherent module with integrable connection (F_{Y_e},∇_e) on Y_e=Y×_SS_e with RΓ(Cris(X/S_e),F)≅RΓ(Y_e,F_{Y_e}⊗Ω^•_{Y_e/S_e}), compatibly in e.
2. Grothendieck's existence theorem (AdicSpacesPartII:F0/grothendieck-existence) gives a coherent F_Y with F_Y/pᵉ=F_{Y_e}. The connections are algebraized through the O-linear isomorphisms p₁^*F_{Y_e}≅p₂^*F_{Y_e} on the first-order neighbourhood of the diagonal of Y_e over S_e that correspond to ∇_e: that neighbourhood is proper over S, so the compatible system of isomorphisms comes from a unique isomorphism over S.
3. RΓ(Cris(X/S),F)≅Rlim_eRΓ(Cris(X/S_e),F) (CR.2/crystalline-cohomology), and RΓ(Y,F_Y⊗Ω^q_{Y/S})≅Rlim_eRΓ(Y_e,F_{Y_e}⊗Ω^q_{Y_e/S_e}) for every q by the theorem on formal functions (AdicSpacesPartII:F0/theorem-on-formal-functions), hence for the de Rham complex, which has finitely many terms.
4. (2): W(k)→K is flat and Y is quasi-compact and separated. (3): tr is a map of crystals because it is compatible with pullback, it is surjective because locally End(E) is a matrix algebra, and the kernel of a surjection of finite locally free modules is finite locally free; tr(a·id+φ)=ra, so the image of O_crys⊕End⁰(E) is tr⁻¹(r·O_crys).

**Depends on:** `CR.2/smooth-lift-filtration`, `CR.2/crystalline-cohomology`, `CR.1/crystal`, `CR.1/integrable-connection`, `AdicSpacesPartII:F0/theorem-on-formal-functions`, `AdicSpacesPartII:F0/coherent-as-inverse-system`, `AdicSpacesPartII:F0/grothendieck-existence`, `DerivedDeRhamCohomology:DD.1/completion-exchanges`, `AdicSpacesPartII:F0/formal-functions-affine`, `SchemeAndStackFoundations:SF.2/tor-independent-base-change`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.24, Remark 60.24.14 (Complete comparison; a remark with a hint of proof), with Remarks 60.24.10 and 60.24.11. Part (1) is Remark 60.24.14, which Stacks gives with a hint only and with an unresolved reference in the source for the existence of F_Y; the algebraization of the connection is not discussed there. Parts (2) and (3) are not in Stacks.; [eg](https://page.mi.fu-berlin.de/esnault/preprints/helene/126_esn_gro.pdf), §7, p. 36 of the author-hosted manuscript (the sentence before Definition 7.2); used again in the proof of Proposition 7.4(2), p. 37. Esnault–Groechenig use, without proof, that H¹ of the de Rham complex of End⁰(E,∇) on the generic fibre of a smooth projective lift equals the rational crystalline H¹ of the corresponding isocrystal; this is the case of (2) and (3) that the node records. The definition of End⁰ as the kernel of the trace and the statement on O_crys⊕End⁰(E)→End(E) are not in that passage.

**Acceptance.**

- For Y=ℙ¹_{W(k)} and F=O_crys: RΓ_crys(ℙ¹_k/Spec W(k),O_crys)≅RΓ(ℙ¹_{W(k)},Ω^•), with cohomology W(k) in degrees 0 and 2 and zero in degree 1.
- For E of rank one, End⁰(E)=0 and End(E)=O_crys.
- For E=O_crys⊕O_crys and p=2: tr(id)=2, and End(E)/(O_crys·id+End⁰(E))≅O_crys/2·O_crys≠0, so End(E) is not the direct sum of O_crys·id and End⁰(E).

### smooth-ambient-linearization — Linearization in a smooth ambient scheme

**Construction:** `TauCeti.Crystalline.smooth_ambient_linearization`. Let p be nilpotent on the PD base S and i:X↪P a closed S-immersion with P smooth of finite presentation over S. Let D be its PD envelope and N a quasi-coherent O_D-module, viewed on X. For a crystalline thickening (U,T), form the PD envelope D_T of U in T×_S P relative to the PD ideal on T. With projections a:D_T→T and b:D_T→D, define L_i(N)_T=a_*b^*N. Its transition maps come from these envelopes. Ru_{X/S,*}L_i(N)≅N as sheaves of base modules on X; higher direct images vanish. The linearizations of E_D⊗Ω^q_(P/S), with their relative PD differential, form a resolution of a quasi-coherent crystal E. This also defines linearization of the differential operators in the coefficient de Rham complex.

**Hypotheses and conventions.**

- p is prime and nilpotent on S; the closed immersion is compatible with the base PD structure.
- P/S is smooth of finite presentation, D its ordinary PD envelope; E is a quasi-coherent crystal.
- For p-adic bases this construction is taken levelwise, then as a derived inverse limit of compatible coefficient complexes; exactness of an ordinary limit requires its stated Mittag–Leffler hypotheses.

**API.**

- `TauCeti.Crystalline.smooth_linearization_eval` (data): L_i(N)_T=a_*b^*N, with D_T the relative PD envelope of U in T×_SP; this formula defines the restriction maps.
- `TauCeti.Crystalline.smooth_linearization_map` (functoriality): An O_D-linear map N→N′ induces L_i(N)→L_i(N′); identity and composition are preserved.
- `TauCeti.Crystalline.smooth_linearization_acyclic` (characterisation): u_*L_i(N)=N and R^qu_*L_i(N)=0 for q>0 as base-module sheaves on X.
- `TauCeti.Crystalline.smooth_linearization_resolution` (compatibility): The crystal transition isomorphisms identify E⊗L_i(Ω^q_(P/S)|_D) with L_i(E_D⊗Ω^q_(P/S)|_D); the augmented relative PD de Rham complex is exact.

**Unit tests.**

- `TauCeti.Crystalline.test_smooth_linearization_zero` (degenerate): L_i(0)=0 on every object.
- `TauCeti.Crystalline.test_smooth_linearization_line` (computation): For X=P=A¹_(F_p), D=X and (U,T)=(X,X), L_i(O_X)_T=F_p[x]⟨ξ⟩ with the second coordinate x+ξ.
- `TauCeti.Crystalline.test_smooth_linearization_etale_chart` (compatibility): Restrict the preceding construction to X=P=G_m. The value is F_p[x,x⁻¹]⟨ξ⟩, and x+ξ is invertible since ξ^p=0; thus the two ambient maps respect the inverted coordinate.

**Uses.** CR.2/smooth-ambient-comparison; CR.4/crystalline-comparison: Provides linearization and coefficient differential operators for smooth ambient schemes rather than only polynomial presentations.

**Construction or proof.**

1. Work locally on P with an étale coordinate chart into affine space. Formal étaleness lifts the ambient map to each thickening; envelope-etale-extension identifies D_T locally with the corresponding PD polynomial envelope.
2. The coordinate formula is the existing linearization. Its zero higher-direct-image statement is the extra-degeneracy contraction of the envelope Čech complex. The construction by a_*b^*N makes coordinate changes canonical.
3. The PD Poincaré contraction on each chart resolves E; the crystal transition maps identify its coefficients, so the local resolutions glue. Apply the construction to the relative differential operator between successive forms.
4. Finite levels glue over X. For a p-adic base take Rlim of the compatible finite-level resolutions and use the supplier for derived inverse limits; do not infer exactness of ordinary limits without a hypothesis.

**Depends on:** `CR.2/linearization`, `CR.0/envelope-etale-extension`, `CR.2/pd-poincare`, `CR.1/crystal`, `CR.1/pd-differentials`, `EnhancedDerivedSheaves:E2/surjective-system-derived-limit`.

**Sources:** [bhatt-dejong](https://arxiv.org/pdf/1110.5001v1), §2, Remarks 2.9 and 2.18, pp.4,6; Theorem 3.6, pp.8–9. Smooth étale charts, their coordinate-independent Taylor identification and global computation.; [lsq-filtered](https://arxiv.org/pdf/math/0409564v1), §3, Definition 3.3 and Proposition 3.8, pp.10–12, with m=0. Geometric linearization and its zero higher-direct-image property for smooth schemes; the envelope version follows locally by the PD coordinate argument.

**Acceptance.**

- The value at a trivial thickening of the affine line is O_X⟨ξ⟩, while Ru_*L(O_X)=O_X; evaluation is different from pushforward.

### smooth-ambient-comparison — De Rham computation in a smooth ambient embedding

**Comparison:** `TauCeti.Crystalline.smooth_ambient_comparison`. In the situation of smooth-ambient-linearization, for a quasi-coherent crystal E with envelope value E_D and its integrable PD connection, Ru_{X/S,*}E≅(E_D⊗_(O_P)Ω^•_(P/S),∇) as complexes of f⁻¹O_S-modules on X. For p-adic bases and compatible crystals at finite level the analogous identity is the derived limit of these complexes. If i₁:X↪P₁ and i₂:X↪P₂ are two smooth embeddings, pullback through X↪P₁×_SP₂ gives canonical quasi-isomorphisms between their envelope complexes, coherent for triples and compatible with base change and open restriction.

**Hypotheses and conventions.**

- The hypotheses of smooth-ambient-linearization, with E a quasi-coherent crystal.
- For the p-adic version, define both sides by Rlim of the compatible finite-level complexes.

**Construction or proof.**

1. Apply Ru_* to the acyclic linearization resolution; degree q pushes forward to E_D⊗Ω^q_(P/S), and its differential is the coefficient connection.
2. Locally the comparison is the same map as the envelope Čech–Alexander bicomplex comparison, since both restrict a crystal to the same envelope and use its Taylor stratification. Bhatt–de Jong Theorems 2.12 and 3.6 verify this map for a smooth ambient Z_p-scheme. The PD-base case uses the same PD contraction with the given base powers.
3. For two embeddings, project from the product envelope. On étale charts the additional coordinates are PD variables, and their relative complex is contracted by ξ^[n]dξ↦ξ^[n+1]. Thus each projection is a quasi-isomorphism. All maps come from envelope universal properties, so the diagrams for triple products commute; Čech descent glues them.
4. Take the compatible finite-level maps and Rlim for the p-adic version.

**Depends on:** `CR.2/smooth-ambient-linearization`, `CR.2/embedding-computation`, `CR.2/embedding-independence`, `CR.0/envelope-etale-extension`, `EnhancedDerivedSheaves:E2/bounded-below-hypercover-descent`.

**Sources:** [bhatt-dejong](https://arxiv.org/pdf/1110.5001v1), §2, Theorem 2.12, Remarks 2.18–2.19, pp.4–6; §3, Theorem 3.6 with proof, pp.8–9. Affine and global smooth-ambient computation with the explicit global comparison map.; [lsq-filtered](https://arxiv.org/pdf/math/0409564v1), §3, Corollaries 3.10–3.11, p.12, level m=0. Smooth ambient closed-embedding comparison; its chartwise proof is given above.

**Acceptance.**

- For a smooth lift X=P×_SS₀, the envelope is P with its extended base PD ideal, and the complex is ordinary de Rham with coefficients.
- On X=Spec F_p[t]/(t²) embedded in A¹_(F_p), the envelope complex, rather than Ω^•_X, computes crystalline cohomology.

### filtered-pd-comparison — Filtered PD Poincaré lemma and comparison

**Comparison:** `TauCeti.Crystalline.filtered_pd_comparison`. Let p∈I and p be nilpotent on the PD base (S,I,γ), i:X↪P smooth as above, and E a finite locally free crystal. Give E on the crystalline site the filtration J_crys^[r]E (J^[r]=O for r≤0). On its envelope de Rham complex set Fil^r(E_D⊗Ω^q_(P/S))=J_D^[r−q]E_D⊗Ω^q_(P/S), where J_D=ker(O_D→O_X). Then Ru_*(J_crys^[r]E)≅Fil^r(E_D⊗Ω^•_(P/S),∇) for every integer r, compatibly with r and with smooth-ambient independence. In a smooth lift the filtration is the base PD filtration combined with degree, and modulo the base PD ideal it becomes the Hodge filtration. The p-adic assertion is the derived inverse limit of the finite-level filtered identities.

**Hypotheses and conventions.**

- p is prime, p∈I, and p is nilpotent on S for the finite-level statement.
- E is finite locally free. The filtration J^[r]E is saturated and transversal for the T-inverse image of filtrations; this does not assert equality with the ordinary pullback of filtered submodules.
- The finite-level envelope, coefficient connection and sign convention are those of smooth-ambient-comparison.

**Construction or proof.**

1. The PD derivation sends J^[a] to J^[a−1]Ω¹, so the displayed degree-q submodules form a subcomplex. Finite local freeness identifies their tensors with the corresponding ideal multiples.
2. On a PD coordinate ξ, h(ξ^[n]dξ)=ξ^[n+1] increases the PD order and lowers the form degree by one, so it preserves total PD-plus-form weight. Tensor the coordinate contractions and use the horizontal Taylor identification of coefficients. This proves the filtered Poincaré resolution.
3. For a locally free E, multiplication of PD ideals gives J^[i]·J^[r−i]E⊆J^[r]E, including i=r, where J^[0]E=E. Consequently the sum defining the saturated T-inverse image is J_T^[r]E_T, which proves saturation and transversality. Use Le Stum–Quirós 1997 Definitions 4.2.1–4.2.2 and Example 4.2.3, rather than asserting that ordinary pullback preserves these submodules. The filtered-paper Theorem 3.5, Propositions 3.6,3.8 and Corollary 3.7 at m=0 apply; Corollaries 3.10–3.11 give the closed-embedding comparison.
4. The product-envelope homotopies preserve the same weight, giving embedding independence of the filtration. Take Rlim for compatible finite levels in the complete case.

**Depends on:** `CR.0/pd-filtration`, `CR.0/pd-filtration-stability`, `CR.1/pd-differentials`, `CR.2/smooth-ambient-linearization`, `CR.2/smooth-ambient-comparison`, `CR.2/smooth-lift-filtration`, `EnhancedDerivedSheaves:E2/surjective-system-derived-limit`.

**Sources:** [lsq-filtered](https://arxiv.org/pdf/math/0409564v1), §2, Proposition 2.10, pp.7–8; §3, Theorem 3.5, Propositions 3.6,3.8, Corollary 3.7, Theorem 3.9 and Corollaries 3.10–3.11, pp.10–12 (m=0). Filtered homotopies and the comparison for transversal filtered crystals; the node uses only ordinary PD powers and a finite locally free coefficient crystal.; [lsq-transversal](https://www.numdam.org/article/AIF_1997__47_1_69_0.pdf), §4.2, Definitions 4.2.1–4.2.2, Example 4.2.3 and Propositions 4.2.4–4.2.5, printed pp.90–91; §1.1, Definitions 1.1.3–1.1.6, pp.72–73. The inverse image of a filtration is saturated using the PD ideals. The ideal-multiple filtration on a finite locally free crystal is the transversal example; ordinary tensor pullback alone need not preserve the filtered submodules.

**Acceptance.**

- For X=P=Spec F_p[t], J_D=0, Fil¹ of the resulting de Rham complex is 0→Ω¹, whereas the unfiltered complex begins with O_X.
- On F_p⟨ξ⟩, ξ^[n]dξ of total weight n+1 contracts to ξ^[n+1] of the same weight.
- No higher-level m-PD structure is needed.

### cech-alexander-global — Čech–Alexander totalization and refinements

**Theorem:** `TauCeti.Crystalline.cech_alexander_global`. Let X/S be a crystalline situation, E a quasi-coherent crystal, and U_•→X a Zariski hypercover whose terms admit smooth ambient embeddings. Form for each U_n its compatible envelope Čech–Alexander de Rham bicomplex C_n using all repeated intersections and ambient tensor factors. Then RΓ_crys(X/S,E)≅Tot_n RΓ(U_n,C_n). If X is separated and a finite totally ordered affine cover is used, the alternating Čech total complex of the intersection envelope complexes also computes it. A refinement gives a canonical comparison quasi-isomorphism; any two refinements agree in the derived category after passage to a common refinement. At p-adic level use Rlim of the compatible finite-level totalizations.

**Hypotheses and conventions.**

- Hypercover descent is for bounded-below complexes; in the smooth finite-dimensional case the de Rham direction is bounded.
- Use homotopy totalization; replace derived limits by ordinary limits only when the stated acyclicity and surjectivity conditions hold.

**Construction or proof.**

1. Each affine envelope bicomplex computes the local crystalline complex by embedding-computation and smooth-ambient-comparison. Its cosimplicial positive-form rows contract as in Bhatt–de Jong Lemmas 2.15–2.17, while the columns use the PD Poincaré lemma.
2. Apply the bounded-below hypercover descent contract in EnhancedDerivedSheaves:E2 to the sheaf Ru_*E, obtaining the global totalization.
3. For a finite ordered cover the augmented alternating Čech resolution of sheaves is exact stalkwise: choose a covering index and insert it as a contracting homotopy. Resolve the terms for derived global sections, yielding the alternating model.
4. A refinement maps the augmented resolutions; the identity augmentation and common refinement give independence in the derived category. Derived inverse limit preserves the compatible comparison equivalences.

**Depends on:** `CR.2/embedding-computation`, `CR.2/smooth-ambient-comparison`, `CR.2/crystalline-cohomology`, `EnhancedDerivedSheaves:E2/hypercover`, `EnhancedDerivedSheaves:E2/bounded-below-hypercover-descent`.

**Sources:** [bhatt-dejong](https://arxiv.org/pdf/1110.5001v1), §2, Lemmas 2.13–2.17 and proof of Theorem 2.12, pp.5–6; §3, proof of Theorem 3.6, pp.8–9. The envelope bicomplex and affine-open gluing by its spectral sequences.; [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.24, Remarks 60.24.3–60.24.4. The target Čech–Alexander and alternating models; the proof supplied here uses the explicit E2 descent contract rather than the source’s unfinished hint.

**Acceptance.**

- For a one-member cover, the alternating totalization is its single envelope complex.
- Repeated intersections remain in the Čech–Alexander model; normalisation or the alternating model removes degeneracies without changing cohomology.

### higher-direct-image-vanishing — Positive PD forms vanish after crystalline projection

**Theorem:** `TauCeti.Crystalline.higher_direct_image_vanishing`. For X a Z_p-scheme with p locally nilpotent and E a quasi-coherent crystal on (X/Z_p)_cris, Ru_*(E⊗Ω^q_crys)=0 for every q>0. Consequently the projection of the crystalline de Rham complex (E→E⊗Ω¹_crys→⋯) to E[0] becomes an isomorphism under Ru_*. Here u is ringed over f⁻¹O_(Spec Z_p), and Ω_crys is the PD differential sheaf on thickenings. The same argument applies over a finite Z/p^e base at each compatible level.

**Hypotheses and conventions.**

- p is prime, X→Spec Z_p and p locally nilpotent on X.
- E is a crystal in quasi-coherent modules; the assertion is after Ru_*, not a vanishing of Ω^q_crys itself.

**Construction or proof.**

1. Use affine opens and the PD-envelope Čech–Alexander resolution. In degree one the cosimplicial module of forms has basis dx_i(j), indexed by the tensor positions.
2. The interval homotopy keeps dx_i(j) before a chosen cut and sends the remaining generators to zero. Its two endpoints are the identity and zero. Exterior powers, tensoring with the coefficient cosimplicial module and completed limits of the explicit homotopy preserve this contraction.
3. Thus every positive-form row has zero cohomology. The first-quadrant bicomplex spectral sequence proves the projection assertion; Zariski localisation proves the Ru_* statement.

**Depends on:** `CR.1/pd-differentials`, `CR.2/embedding-computation`, `CR.2/cech-alexander-global`, `CR.1/crystal`, `ArithmeticGaloisDuality:R02.2/first-quadrant-spectral-sequence`.

**Sources:** [bhatt-dejong](https://arxiv.org/pdf/1110.5001v1), §2, Lemmas 2.14–2.17 and Example 2.16, pp.5–6; §3, Theorem 3.2, p.7. The interval contraction and global vanishing theorem with quasi-coherent crystal coefficients.

**Acceptance.**

- On a one-variable PD envelope Ω¹ is nonzero, despite its derived crystalline pushforward being zero.

## CR.3 — Descent, finiteness, base change and Frobenius

**Targets.** Proper smooth crystalline perfectness and reductions, Crystalline cup products, Proper smooth crystalline Künneth formula, Semilinear crystalline Frobenius and linearization, Crystalline weak Lefschetz with bounded line-bundle cohomology.

### crystalline-descent — Crystalline cohomology from a finite affine cover: the alternating Čech complex

**Theorem:** `TauCeti.Crystalline.crysDescent`. Let (A,I,γ) be a PD ring in which p is nilpotent, S=Spec A, S₀=Spec A/I, X a quasi-compact separated S₀-scheme and E a crystal in quasi-coherent O_crys-modules on X/S. Choose a finite affine open cover X=⋃_(λ∈Λ)U_λ with U_λ=Spec C_λ, a total order on Λ, and for each λ a surjection P_λ→C_λ from a polynomial A-algebra. For λ₀<…<λ_n write U_(λ₀)∩…∩U_(λ_n)=Spec C_(λ₀…λ_n), let D_(λ₀…λ_n) be the PD envelope, relative to γ, of the kernel of P_(λ₀)⊗_A…⊗_A P_(λ_n)→C_(λ₀…λ_n), and let (M_(λ₀…λ_n),∇) be the D_(λ₀…λ_n)-module with integrable connection attached to E. Then RΓ_crys(X/S,E) is isomorphic in D(A) to the total complex of the double complex M^(n,m)=⊕_(λ₀<…<λ_n) M_(λ₀…λ_n)⊗_(D_(λ₀…λ_n))Ω^m_PD(D_(λ₀…λ_n)/A), with the Čech differential in n and the de Rham differential of ∇ in m.

**Hypotheses and conventions.**

- p is a prime number; (A,I,γ) is a PD ring and p is nilpotent in A; S=Spec A, S₀=Spec A/I.
- X is a quasi-compact separated S₀-scheme; hence every finite intersection of affine opens of X is affine.
- E is a crystal in quasi-coherent O_crys-modules on the Zariski crystalline site of X/S.
- The open cover is finite and by affine opens U_λ=Spec C_λ, its index set Λ is totally ordered, and for each λ a surjection P_λ→C_λ from a polynomial A-algebra is given.

**Construction or proof.**

1. RΓ_crys(X/S,E)=RΓ_crys(X/S,E⊗_(O_crys)Ω^•_(X/S)), because Ru_*(E⊗Ω^i_(X/S))=0 for i>0 (Stacks Proposition 60.23.1).
2. On U_(λ₀)∩…∩U_(λ_n) the cohomology of E⊗Ω^•_(X/S) is computed by M_(λ₀…λ_n)⊗Ω^•_PD(D_(λ₀…λ_n)/A), by the affine computation for the embedding into Spec(P_(λ₀)⊗_A…⊗_A P_(λ_n)) (Stacks Proposition 60.21.3; CR.2/embedding-computation). No p-adic completion is needed because p is nilpotent in A.
3. The U_λ form a finite totally ordered covering of the final object of the crystalline topos by subobjects. The alternating Čech complex of such a covering computes the cohomology of a bounded-below complex of sheaves when it does so on every finite intersection.

**Depends on:** `CR.2/embedding-computation`, `CR.1/site-morphisms`, `EnhancedDerivedSheaves:E2/hypercover`, `EnhancedDerivedSheaves:E2/bounded-below-hypercover-descent`, `EnhancedDerivedSheaves:E2`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.24, Remark 60.24.4 (tag 07MN), Alternating Čech complex; notation from Remark 60.24.3 (tag 07MM). The node is the remark for a base in which p is nilpotent, where the p-adic completions of the source do nothing. The source states it as a remark with a hint of proof only; the hint cites the general fact about alternating Čech complexes as a future reference.

**Acceptance.**

- If Λ has one element (X affine) the double complex is the single column M⊗Ω^•_PD(D/A), and the statement is the affine computation of CR.2/embedding-computation (Stacks Proposition 60.21.3).
- For X=P¹_k over A=W_n(k), k perfect of characteristic p, with the two standard charts Spec k[x], Spec k[y] and P₀=W_n[x], P₁=W_n[y]: D₀=W_n[x], D₁=W_n[y], D₀₁ is the PD envelope of (xy−1) in W_n[x,y], and the total complex has cohomology W_n, 0, W_n, 0 in degrees 0, 1, 2, 3, in agreement with RΓ_dR(P¹_(W_n)/W_n).

### mayer-vietoris — Mayer–Vietoris for crystalline cohomology

**Theorem:** `TauCeti.Crystalline.mayer_vietoris`. For X=U∪V an open cover and E an O_crys-module (or a bounded-below coefficient complex), there is a natural distinguished triangle RΓ_crys(X/S,E)→RΓ_crys(U/S,E)⊕RΓ_crys(V/S,E)→RΓ_crys((U∩V)/S,E)→RΓ_crys(X/S,E)[1], whose middle arrow is res_U−res_V. It is compatible with coefficients, restrictions and PD base-change maps.

**Hypotheses and conventions.**

- Use bounded-below derived cohomology on the crystalline site and its Zariski projection.

**Construction or proof.**

1. The localisation of site-morphisms identifies restrictions to U,V and their intersection.
2. Apply the exact augmented two-open Čech resolution to Ru_*E. Stalkwise one of U,V contains the point, giving a split exact complex with the stated difference map.
3. Derived global sections turn this resolution into the distinguished triangle. Functoriality of the resolution gives all compatibilities.

**Depends on:** `CR.1/site-morphisms`, `CR.2/crystalline-cohomology`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.24, Remark 60.24.2; §60.9, Lemma 60.9.5. The crystalline Mayer–Vietoris target and localisation, with the sheaf-resolution proof stated explicitly.

**Acceptance.**

- For U=X,V=∅ the triangle reduces to the identity on RΓ(X).
- For U=V=X the middle arrow is (a,b)↦a−b, and the first arrow is diagonal.

### derived-base-change — Derived crystalline base change

**Comparison:** `TauCeti.Crystalline.crysBaseChange`. Let (A′,I′,γ′)→(A,I,γ) be a homomorphism of PD rings, S′=Spec A′, S=Spec A, X′ a scheme over A′/I′, X a scheme over A/I and f:X→X′ a morphism over Spec A/I→Spec A′/I′, with p locally nilpotent on X and X′. For an O_crys-module E′ on X′/S′ with pullback E=f_crys^*E′ put K′=RΓ_crys(X′/S′,E′) and K=RΓ_crys(X/S,E). (1) There is a canonical base-change map K′⊗^L_(A′)A→K in D(A). (2) It is an isomorphism if all of the following hold: p is nilpotent in A′; E′ is a crystal in quasi-coherent O_crys-modules; X′→Spec A′/I′ is quasi-compact and quasi-separated; X=X′×_(Spec A′/I′)Spec A/I; E′ is a flat O_crys-module; X′→Spec A′/I′ is a local complete intersection morphism; X′ and Spec A/I are Tor-independent over Spec A′/I′. The conditions on X′, X and E′ hold when X′ is quasi-compact, quasi-separated and smooth over A′/I′, X is its base change and E′ is a finite locally free crystal. (3) p-adic form: let A′ and A be p-adically complete with p nilpotent in A′/I′ and in A/I, and assume the conditions of (2) except the nilpotence of p in A′. For e so large that p^eA′⊂I′ is stable under γ′ put K′_e=RΓ_crys(X′/Spec(A′/p^e),E′). If K′ is a perfect complex of A′-modules and K′⊗^L_(A′)A′/p^e→K′_e is an isomorphism for all such e, then K′⊗^L_(A′)A→K is an isomorphism.

**Hypotheses and conventions.**

- (A′,I′,γ′)→(A,I,γ) is a homomorphism of PD rings, both Z_(p)-algebras: the ring map sends I′ into I and commutes with the divided powers.
- X′ is a scheme over A′/I′ and X a scheme over A/I, p is locally nilpotent on both, and f:X→X′ lies over Spec A/I→Spec A′/I′; E′ is an O_crys-module on X′/Spec A′ and E=f_crys^*E′.
- For (2): p is nilpotent in A′; E′ is a crystal in quasi-coherent O_crys-modules and is flat over O_crys; X′→Spec A′/I′ is quasi-compact, quasi-separated and a local complete intersection morphism; X=X′×_(Spec A′/I′)Spec A/I; X′ and Spec A/I are Tor-independent over Spec A′/I′.
- For (3): A′ and A are p-adically complete, p is nilpotent in A′/I′ and in A/I, the conditions of (2) other than the nilpotence of p in A′ hold, K′ is a perfect complex of A′-modules, and K′⊗^L_(A′)A′/p^e→RΓ_crys(X′/Spec(A′/p^e),E′) is an isomorphism for all e with p^eA′⊂I′ stable under γ′.

**API.**

- `TauCeti.Crystalline.crysBaseChange_id` (functoriality): For the identity of (A,I,γ) and the identity of X the base-change map K⊗^L_A A→K is the canonical isomorphism.
- `TauCeti.Crystalline.crysBaseChange_comp` (functoriality): For PD homomorphisms (A″,I″,γ″)→(A′,I′,γ′)→(A,I,γ) and morphisms X→X′→X″ over them, the base-change map K″⊗^L_(A″)A→K is the composite of (K″⊗^L_(A″)A′)⊗^L_(A′)A→K′⊗^L_(A′)A with K′⊗^L_(A′)A→K.
- `TauCeti.Crystalline.crysBaseChange_natural` (functoriality): A homomorphism E′₁→E′₂ of O_crys-modules on X′/S′ induces a commutative square of base-change maps; the base-change map is also natural for morphisms g:Y′→X′ of schemes over A′/I′ and their base changes.

**Construction or proof.**

1. (1): compose the base-change map of the commutative square of ringed topoi formed by the crystalline topoi of X/S and X′/S′ and the Zariski topoi of S and S′ with the canonical map Lf_crys^*E′→f_crys^*E′=E (Stacks Remark 60.24.8).
2. (2): since p is nilpotent no completion occurs. By quasi-compactness, quasi-separatedness and the Mayer–Vietoris triangle for an open cover (Stacks Remark 60.24.2) reduce to X′=Spec C′ with C′=(A′/I′)[x₁,…,x_n]/(f̄′₁,…,f̄′_c), the f̄′_i a Koszul-regular sequence. Then X=Spec C with C=(A/I)[x₁,…,x_n]/(f̄₁,…,f̄_c), and the f̄_i are Koszul-regular by Tor-independence.
3. Lift f̄′_i to f′_i∈A′[x] with images f_i∈A[x]. The PD envelope of I′A′[x]+(f′_i) relative to γ′ is D′=A′[x]⟨ξ₁,…,ξ_c⟩/(ξ_i−f′_i), and ξ₁−f′₁,…,ξ_c−f′_c is a Koszul-regular sequence in A′[x]⟨ξ⟩; likewise for D over A. Since A′[x]⟨ξ⟩ is free over A′, D′⊗^L_(A′)A≅D.
4. Let (M′,∇) be the D′-module with connection attached to E′; it is flat over D′, so M=M′⊗_(D′)D=M′⊗^L_(A′)A. The modules Ω¹_PD(D′/A′) and Ω¹_PD(D/A) are free on dx₁,…,dx_n (CR.1/envelope-differentials), hence M⊗_DΩ^•_PD(D/A)=(M′⊗_(D′)Ω^•_PD(D′/A′))⊗^L_(A′)A, and the affine computation of CR.2/embedding-computation gives (2).
5. (3): K=Rlim_e K_e with K_e=RΓ_crys(X/Spec(A/p^e),E), and by (2) for A′/p^e→A/p^e, K_e≅K′_e⊗^L_(A′/p^e)A/p^e≅(K′⊗^L_(A′)A)⊗^L_A A/p^e, compatibly in e. As K′⊗^L_(A′)A is a perfect complex and A=lim_e A/p^e with surjective transition maps, Rlim_e((K′⊗^L_(A′)A)⊗^L_A A/p^e)=K′⊗^L_(A′)A.

**Depends on:** `CR.3/crystalline-descent`, `CR.0/regular-envelope`, `CR.0/envelope-base-change`, `CR.2/embedding-computation`, `CR.1/envelope-differentials`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`, `DerivedDeRhamCohomology:DD.1`, `CR.3/mayer-vietoris`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.24, Remark 60.24.8 (tag 07MS), Base change map, and Remark 60.24.9 (tag 07MU), Base change isomorphism, conditions (1)–(7) and the hints. Parts (1) and (2) are the two remarks, with the same seven conditions; the source gives them with hints of proof only. Part (3) is deduced here from (2) and from the description of p-adic crystalline cohomology as a derived limit; the source does not state it.; [stacks-sites-cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/sites-cohomology.tex), Cohomology on Sites, Remark 07A7 (base change map for a commutative square of ringed topoi). The base-change map Lg^*Rf_*K→Rf′_*L(g′)^*K of a commutative square of ringed topoi, which part (1) composes with Lf_crys^*E′→f_crys^*E′.

**Acceptance.**

- For X smooth, quasi-compact and quasi-separated over a perfect field k of characteristic p and σ the Frobenius of W_n(k), a PD automorphism of (W_n(k),(p)): RΓ_crys(X/W_n)⊗^L_(W_n,σ)W_n≅RΓ_crys(X^(p)/W_n), where X^(p)=X×_(k,Frob)k.
- For P¹_k and the reduction W_(n+1)(k)→W_n(k) the map is the isomorphism (W_(n+1)⊕W_(n+1)[−2])⊗^L_(W_(n+1))W_n≅W_n⊕W_n[−2].

### proper-perfectness — Proper smooth crystalline perfectness and reductions

**Theorem:** `TauCeti.Crystalline.crysPerfect`. (1) Let (A,I,γ) be a PD ring with A Noetherian and p nilpotent in A, X a proper smooth scheme over A/I and E a finite locally free crystal on X/Spec A. Then K=RΓ_crys(X/Spec A,E) is a perfect complex of A-modules. (2) Let (A,I,γ) be a PD ring with A Noetherian and p-adically complete and p nilpotent in A/I, X proper smooth over A/I and E a finite locally free crystal on X/Spec A. For e such that p^eA⊂I is stable under γ (all sufficiently large e) put K_e=RΓ_crys(X/Spec(A/p^e),E). Then K=Rlim_e K_e is a perfect complex of A-modules and K⊗^L_A A/p^e→K_e is an isomorphism for every such e. (3) Let k be a perfect field of characteristic p, A=W(k), I=(p), X proper smooth over k of dimension ≤d and E a finite locally free crystal on X/W(k). Then K=RΓ_crys(X/W(k),E) is a perfect complex of W(k)-modules of Tor-amplitude in [0,2d], K⊗^L_(W(k))W_n(k)≅RΓ_crys(X/W_n(k),E) for all n≥1, and each H^i(K) is a finitely generated W(k)-module, zero unless 0≤i≤2d. The modules H^i(K) can have p-torsion. (4) In the situation of (2), for a homomorphism (A,I,γ)→(B,J,δ) of PD rings with B Noetherian and p-adically complete and p nilpotent in B/J, the base-change map K⊗^L_A B→RΓ_crys(X_B/Spec B,E_B) of CR.3/derived-base-change is an isomorphism, where X_B=X×_(Spec A/I)Spec B/J and E_B is the pullback of E.

**Hypotheses and conventions.**

- (1): (A,I,γ) is a PD ring, A is Noetherian and p is nilpotent in A; X is proper and smooth over A/I; E is a crystal in finite locally free O_crys-modules on X/Spec A.
- (2), (4): (A,I,γ) is a PD ring, A is Noetherian and p-adically complete, p is nilpotent in A/I; X is proper and smooth over A/I; E is a crystal in finite locally free O_crys-modules on the crystalline site of X over Spec A. In (4), (B,J,δ) satisfies the same conditions as (A,I,γ) and A→B is a homomorphism of PD rings.
- (3): k is a perfect field of characteristic p, A=W(k) with I=(p) and its unique divided powers (then p^eW(k) is stable under γ for every e≥1); X is proper and smooth over k; d≥0 with dim X≤d.

**Construction or proof.**

1. (1): by CR.3/derived-base-change (2) for (A,I,γ)→(A/I,0), K⊗^L_A A/I≅RΓ_crys(X/Spec(A/I),E), and this is RΓ(X,E_X⊗Ω^•_(X/(A/I))) by CR.2/smooth-lift-filtration, X being its own smooth lift over A/I.
2. Each RΓ(X,E_X⊗Ω^q_(X/(A/I))) is a perfect complex of A/I-modules, because E_X⊗Ω^q is finite locally free and X→Spec A/I is proper and flat; by the stupid filtration K⊗^L_A A/I is perfect.
3. I is a nil ideal (x^n=n!·γ_n(x) and p is nilpotent in A) and is finitely generated because A is Noetherian, hence nilpotent. A complex whose derived reduction modulo a nilpotent ideal is perfect is perfect (Stacks, More on Algebra, Lemma 07LU). So K is perfect.
4. (2): the K_e are perfect by (1), and K_(e′)⊗^L A/p^e≅K_e for e′≥e by CR.3/derived-base-change (2). For a p-adically complete ring the derived limit of such a tower is perfect and K⊗^L_A A/p^e≅K_e (Stacks, More on Algebra, Lemma 09AW). The tower is an object of the derived category of inverse systems; by the corrected statement (B2.1) of Berthelot–Ogus, Appendix B, it is isomorphic there to a system of bounded-above complexes of projective A/p^e-modules with surjective transition maps, whose termwise limit represents K.
5. (3): K⊗^L_W k≅RΓ(X,E_X⊗Ω^•_(X/k)) lies in degrees [0,2d], since Ω^q=0 for q>d and coherent cohomology vanishes above degree d; a perfect complex over the local ring W whose reduction to the residue field lies in [0,2d] has Tor-amplitude in [0,2d]. (4): apply CR.3/derived-base-change (3); its two assumptions are (2).

**Depends on:** `CR.3/derived-base-change`, `CR.2/smooth-lift-filtration`, `DerivedDeRhamCohomology:DD.1`, `AlgebraicModuliForArithmeticGeometry:A0-extension`, `SchemeAndStackFoundations:SF.2/perfect-generator`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.24, Remark 60.24.12 (tag 07MX), Perfectness, and Remark 60.24.13 (tag 07MY), Complete perfectness; Remark 60.24.10 (tag 07MV) for the derived limit. Parts (1) and (2) are the two remarks with the extra hypothesis that A is Noetherian, under which the hint of Remark 60.24.12 is complete; both are stated in the source with hints only. The amplitude bound of (3), the reductions modulo p^e and part (4) are deduced here.; [bo-correction](https://math.berkeley.edu/~ogus/preprints/BO_B2_Erratumre.pdf), p. 1: the opening paragraph and the replacement text for (B2.1); pp. 1–2: (B2.1a) and its proof. Used for the tower of the K_e: a replacement by complexes of projective modules with surjective transition maps exists as an isomorphism in the derived category of inverse systems; a surjective quasi-isomorphism onto the original tower requires its transition maps to be surjective.

**Acceptance.**

- RΓ_crys(P¹_k/W(k))≅W⊕W[−2], and its reduction modulo p^n is W_n⊕W_n[−2]≅RΓ_crys(P¹_k/W_n(k)).
- Properness cannot be dropped: for X=A¹ over F_p and A=Z_p, H¹_crys(X/Z_p) is not p-adically separated, hence not a finitely generated Z_p-module (Stacks Example 60.22.2).
- Torsion occurs: for the surface H_k of BMS1 Theorem 2.10, H²_crys(H_k/W(k)) has torsion submodule k⊕k, although K is perfect.

### weak-lefschetz — Crystalline weak Lefschetz with bounded line-bundle cohomology

**Theorem:** `TauCeti.Crystalline.crysWeakLefschetz`. Let k be a perfect field of characteristic p, X a smooth projective variety of dimension d over k and L an invertible O_X-module. Let i_L≥0 be an integer such that for every coherent O_X-module F one has H^i(X,F⊗L^n)=0 for all i>i_L and all sufficiently large n. Then there is an integer n₀ such that for every n≥n₀ and every smooth H⊂X that is the zero scheme of a section of L^n, the restriction map H^j_crys(X/W(k))→H^j_crys(H/W(k)) is an isomorphism for j<d−i_L−1 and is injective with torsion-free cokernel for j=d−i_L−1. If L is ample one can take i_L=0.

**Hypotheses and conventions.**

- k is a perfect field of characteristic p; X is a smooth projective variety of dimension d over k; L is an invertible O_X-module.
- i_L≥0 is an integer such that for every coherent O_X-module F there is n(F) with H^i(X,F⊗L^n)=0 for all i>i_L and all n≥n(F).
- H is the zero scheme of a section of L^n and is smooth over k; n≥n₀, where n₀ depends on X and L only.

**Construction or proof.**

1. Let K be the cone of RΓ_crys(X/W)→RΓ_crys(H/W). It is a perfect, hence derived p-complete, complex of W-modules; for such K, K∈D^(≥m) with H^m(K) torsion-free is equivalent to K⊗^L_W k∈D^(≥m). With m=d−i_L−1 the long exact cohomology sequence gives the statement.
2. K⊗^L_W k is the cone of RΓ_dR(X/k)→RΓ_dR(H/k) (CR.3/proper-perfectness (3), CR.2/smooth-lift-filtration). By the filtrations by form degree it suffices that the cone K_j of RΓ(X,Ω^j_X)→RΓ(H,Ω^j_H) lies in D^(≥d−i_L−j−1) for every j≥0.
3. Let I≅L^(−n) be the ideal sheaf of H. By Serre duality, for a finite locally free G and r≥1, RΓ(X,I^r⊗G) is dual to RΓ(X,L^(rn)⊗G^∨⊗Ω^d_X) shifted by d, so it lies in D^(≥d−i_L) for n large. For fixed r≥1 prove RΓ(X,I^r⊗Ω^(j−1)_H)∈D^(≥d−i_L−j) for n large, by induction on j≥1: for j=1 use 0→I^(r+1)→I^r→I^r⊗O_H→0; for j>1 use 0→I^(r+1)⊗Ω^(j−2)_H→I^r⊗(Ω^(j−1)_X/I·Ω^(j−1)_X)→I^r⊗Ω^(j−1)_H→0, where RΓ of the middle term lies in D^(≥d−i_L−1) by 0→I^(r+1)⊗Ω^(j−1)_X→I^r⊗Ω^(j−1)_X→I^r⊗(Ω^(j−1)_X/I·Ω^(j−1)_X)→0.
4. The kernel of Ω^j_X→Ω^j_H is an extension of I⊗Ω^(j−1)_H by I⊗Ω^j_X, so RΓ of it lies in D^(≥d−i_L−j) and K_j∈D^(≥d−i_L−j−1). Only the sheaves Ω^j_X, 0≤j≤d, and the exponents r≤d+1 occur, so one n₀ serves for all.

**Depends on:** `CR.3/proper-perfectness`, `CR.3/derived-base-change`, `CR.2/smooth-lift-filtration`, `SchemeAndStackFoundations:SF.2/serre-proper`, `SchemeAndStackFoundations:SF.2/smooth-proper`, `DerivedDeRhamCohomology:DD.1/derived-completeness`, `DerivedDeRhamCohomology:DD.1/derived-completion`, `AdicSpacesPartII:F0/graded-cohomology-finiteness`.

**Sources:** [bms1](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §2.2, Lemma 2.12 and its proof, pp. 17–18. The node is the lemma with its hypotheses and its range. In the proof the displayed exact sequence for j>1 on p. 18 is misprinted; the proof steps use the corrected sequence.

**Acceptance.**

- L ample: i_L=0 by Serre vanishing, so for a smooth hypersurface section H of sufficiently large degree the restriction is an isomorphism in degrees j<d−1 and injective with torsion-free cokernel in degree d−1.
- For a smooth plane curve C⊂P² of sufficiently large degree: H⁰_crys(P²/W)≅H⁰_crys(C/W), and H¹_crys(C/W), the cokernel of 0=H¹_crys(P²/W)→H¹_crys(C/W), is torsion-free.
- In BMS1 §2.2 the lemma is applied with i_L=1 to the pullback L_E to X_E=(P×E)/G of an ample invertible module on X=P/G.

### first-chern-class — The crystalline first Chern class and the hyperplane class

**Construction:** `TauCeti.Crystalline.crysChern`. Let (S,I,γ) be a PD scheme over Z_(p), S₀=V(I), and X an S₀-scheme on which p is locally nilpotent. On the crystalline site of X/S let O_crys, O_X^cris and J_crys=ker(O_crys→O_X^cris) be the sheaves of CR.1/structure-sheaves, δ the divided powers of J_crys, and u:(X/S)_crys→X_Zar the projection. (1) The sequence of sheaves of abelian groups 1→1+J_crys→O_crys^*→(O_X^cris)^*→1 is exact, and (O_X^cris)^*=u^(−1)O_X^*. (2) log:1+J_crys→J_crys, log(1+x)=Σ_(n≥1)(−1)^(n−1)·(n−1)!·δ_n(x), is a homomorphism from the multiplicative group 1+J_crys to the additive group J_crys; on each thickening the sum is locally finite because p is locally nilpotent there. (3) The first Chern class c₁:Pic(X)=H¹(X,O_X^*)→H²_crys(X/S)=H²((X/S)_crys,O_crys) is the composite of u^(−1), the connecting homomorphism H¹((O_X^cris)^*)→H²(1+J_crys) of (1), the map induced by log, and the map induced by J_crys⊂O_crys. (4) The sign of the connecting homomorphism is fixed by the following property: if p is nilpotent on S, Y is a smooth lift of X over S and L̃ is an invertible O_Y-module lifting L, with trivialising sections s_λ on an open cover, then under H²_crys(X/S)≅H²(Y,Ω^•_(Y/S)) the class c₁(L) is the class of the Čech 1-cocycle (dlog(s_μ/s_λ))_(λ,μ) with values in Ω¹_(Y/S), the de Rham first Chern class of L̃. (5) c₁ is a homomorphism of groups and is natural for the morphisms of crystalline topoi induced by commutative squares of schemes over PD morphisms. (6) For a perfect field k of characteristic p and X proper smooth over k, c₁(L)∈H²_crys(X/W(k)) is the compatible system of the classes c₁(L)∈H²_crys(X/W_n(k)); the hyperplane class is h=c₁(O(1))∈H²_crys(P^d_k/W(k)).

**Hypotheses and conventions.**

- (S,I,γ) is a PD scheme over Z_(p), S₀=V(I), and X is an S₀-scheme on which p is locally nilpotent; the crystalline site is that of CR.1/crystalline-site, whose thickenings have p locally nilpotent.
- L is an invertible O_X-module.
- In (4): p is locally nilpotent on S, Y is smooth over S with Y×_S S₀=X, and L̃ is an invertible O_Y-module with L̃|_X≅L.
- In (6): k is a perfect field of characteristic p, S=Spec W_n(k) or Spec W(k) with the PD ideal (p), and X is proper and smooth over k; then H²_crys(X/W)=lim_n H²_crys(X/W_n), because the groups H¹_crys(X/W_n) have finite length.

**API.**

- `TauCeti.Crystalline.crysChern_log` (relation): log((1+x)(1+y))=log(1+x)+log(1+y) for local sections x, y of J_crys, where log(1+x)=Σ_(n≥1)(−1)^(n−1)·(n−1)!·δ_n(x).
- `TauCeti.Crystalline.crysChern_add` (structure): c₁(L⊗M)=c₁(L)+c₁(M), c₁(O_X)=0 and c₁(L^∨)=−c₁(L) for invertible O_X-modules L, M.
- `TauCeti.Crystalline.crysChern_pullback` (functoriality): For a morphism g:X′→X over a morphism of PD schemes S′→S: g^*c₁(L)=c₁(g^*L) in H²_crys(X′/S′).
- `TauCeti.Crystalline.crysChern_fil` (characterisation): c₁(L) lies in the image of H²((X/S)_crys,J_crys)→H²_crys(X/S).
- `TauCeti.Crystalline.crysChern_deRham` (compatibility): If p is locally nilpotent on S, Y is a smooth lift of X over S and L̃ an invertible O_Y-module lifting L with trivialising sections s_λ, then under H²_crys(X/S)≅H²(Y,Ω^•_(Y/S)) of CR.2/smooth-lift-filtration c₁(L) is the class of the Čech 1-cocycle (dlog(s_μ/s_λ)) with values in Ω¹_(Y/S).
- `TauCeti.Crystalline.crysChern_reduction` (compatibility): For k perfect and X proper smooth over k, the reduction H²_crys(X/W(k))→H²_crys(X/W_n(k)) sends c₁(L) to c₁(L), and for n=1 the image is the de Rham class c₁^dR(L)∈H²_dR(X/k).
- `TauCeti.Crystalline.crysChern_hyperplane` (data): h=c₁(O(1))∈H²_crys(P^d_k/W(k)) for a perfect field k of characteristic p and d≥1.

**Unit tests.**

- `TauCeti.Crystalline.test_crysChern_P1` (computation): For a perfect field k of characteristic p, H²_crys(P¹_k/W_n(k)) is free of rank one over W_n(k) with basis h=c₁(O(1)); under H²_crys(P¹_k/W_n)≅H²(P¹_(W_n),Ω^•) the class h is that of the Čech 1-cocycle dt/t on U₀∩U₁, t=T₁/T₀.
- `TauCeti.Crystalline.test_crysChern_twist` (computation): c₁(O(m))=m·h in H²_crys(P^d_k/W(k)) for every integer m.
- `TauCeti.Crystalline.test_crysChern_mod_p` (non-example): For k a perfect field of characteristic p and S=Spec k: c₁(O(p))=0 in H²_crys(P¹_k/k)=H²_dR(P¹_k/k), although O(p) is not trivial and c₁(O(p))=p·h≠0 in H²_crys(P¹_k/W(k)); so c₁ is not injective, and the class over W(k) is not determined by its reduction modulo p.
- `TauCeti.Crystalline.test_crysChern_trivial` (degenerate): c₁(O_X)=0 in H²_crys(X/S).

**Uses.** Gros, Classes de Chern et classes de cycles en cohomologie de Hodge–Witt logarithmique, II.5.1, (5.1.7)–(5.1.9), recalling Berthelot–Illusie: The crystalline first Chern class is the connecting map of the unit sequence followed by the PD logarithm; it is compared there with the dlog class in de Rham–Witt cohomology. CrystallineCohomology CR.3/torsion-and-models, CR.3/cup-product, CR.3/frobenius-map, CR.3:duality/trace, CR.3:duality/gysin, CR.3:duality/diagonal: h=c₁(O(1)) is the generator of H²_crys(P^d/W) in the projective-space computations, in the normalisation of the trace and in the formula for the class of the diagonal. CohomologyComparisons:CP.6: The crystalline class is the one compared there with the étale Kummer, de Rham dlog and prismatic first Chern classes.

**Construction or proof.**

1. Exactness of (1): a unit of O_U lifts locally to a section of O_T, which is a unit because sections x of J_crys are locally nilpotent (x^n=n!·δ_n(x) and p is locally nilpotent on T); the kernel of O_T^*→O_U^* is 1+J_T. The identification (O_X^cris)^*=u^(−1)O_X^* is the formula for u^(−1) of CR.1/site-morphisms.
2. log is a homomorphism: in the PD polynomial algebra Z⟨x,y⟩ (CR.0/pd-polynomial), which is torsion-free, the identity log((1+x)(1+y))=log(1+x)+log(1+y) holds degree by degree, since it holds over Q where δ_n(x)=x^n/n!; map x, y to sections of J_crys. The terms with (n−1)! divisible by a power of p that annihilates O_T vanish, so only finitely many terms occur locally.
3. Define c₁ by (3). Additivity and naturality follow from those of the connecting homomorphism and of log.
4. Comparison (4): for a smooth lift Y with ideal I_Y of X, Ru_*O_crys^* is represented by the multiplicative de Rham complex O_Y^*→Ω¹_(Y/S)→Ω²_(Y/S)→…, whose first map is dlog, and Ru_*(1+J_crys) by its subcomplex beginning with 1+I_Y; log maps the latter to I_Y→Ω¹_(Y/S)→… . The cocycle of L lifts to the cocycle (s_μ/s_λ) of O_Y^*, whose total differential is the Čech 1-cochain (dlog(s_μ/s_λ)) in form degree 1 (Gros, II.5.1, (5.1.11)–(5.1.13)).
5. (6): for X proper smooth over k the groups H¹_crys(X/W_n) are W_n-modules of finite length (CR.3/proper-perfectness), so lim¹ vanishes and H²_crys(X/W)=lim_n H²_crys(X/W_n); the classes c₁(L) are compatible by naturality.

**Depends on:** `CR.1/structure-sheaves`, `CR.1/site-morphisms`, `CR.2/crystalline-cohomology`, `CR.2/smooth-lift-filtration`, `CR.0/pd-polynomial`, `CR.3/proper-perfectness`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.10 (tag 07IN), Sheaves on the crystalline site: the kernel J_{X/S} of O_{X/S}→O_X and its divided powers. The source supplies the divided power ideal sheaf on which the logarithm is defined. The unit sequence, the logarithm and the Chern class are not in this source; they are in Gros, II.5.1 (after Berthelot–Illusie).; [gros-chern](http://www.numdam.org/item/MSMF_1985_2_21__1_0.pdf), Chapitre II, §5.1, printed p. 24 (PDF page 25): (5.1.7)–(5.1.9); p. 25: (5.1.11)–(5.1.13). The source recalls the crystalline first Chern class of Berthelot–Illusie: the exact sequence 0→1+J_(X/W_n)→O^*_(X/W_n)→O_X^*→0 of (5.1.8), the logarithm 1+J_(X/W_n)→J_(X/W_n) and c₁:O_X^*→J_(X/W_n)[1] of (5.1.9), and realises it on the multiplicative de Rham complex of a lift. The node states this for a general PD base on which p is locally nilpotent; the source treats W_n(k) and X smooth over k.; [stacks-derham](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/derham.tex), de Rham Cohomology, Section "First Chern class in de Rham cohomology" (tag 0FLE); Lemma 0FMJ (de Rham cohomology of projective space). The de Rham first Chern class defined through dlog, with which part (4) compares the crystalline class on a smooth lift, and the computation for projective space used in the tests.

**Acceptance.**

- For S=S₀=Spec k and X smooth over k, c₁ is the de Rham first Chern class H¹(X,O_X^*)→H²_dR(X/k) induced by dlog:O_X^*→Ω¹_(X/k).
- For P^d over W_n(k): h is the class of the Čech 1-cocycle dlog(T_μ/T_λ) on the standard cover; for d≥1, H²_crys(P^d_k/W_n(k)) is free of rank one with basis h.

### cup-product — Crystalline cup products

**Construction:** `TauCeti.Crystalline.crysCup`. Let (A,I,γ) be a PD ring with A a Z_(p)-algebra, S=Spec A, X a scheme over A/I on which p is locally nilpotent, and write K(E)=RΓ_crys(X/S,E) for an O_crys-module E. (1) For O_crys-modules E, F the cup product is the map ∪:K(E)⊗^L_A K(F)→K(E⊗_(O_crys)F) in D(A) obtained from the cup product RΓ(E)⊗^L RΓ(F)→RΓ(E⊗^L_(O_crys)F) of the ringed crystalline topos followed by E⊗^L F→E⊗F; the unit is A→K(O_crys). (2) It is associative and unital, natural in E and F, and compatible with pullback along the morphisms of crystalline topoi induced by commutative squares of schemes over homomorphisms of PD rings. (3) On H^*_crys(X/S)=H^*(K(O_crys)) it is a graded A-algebra structure, graded commutative: x∪y=(−1)^(ij)·y∪x for x∈H^i, y∈H^j. In particular 2·x∪x=0 for x of odd degree, hence x∪x=0 when p is odd; for p=2 this gives only 2·x∪x=0. (4) For schemes X, Y over A/I the external product of x∈H^*(K_X(E)) and y∈H^*(K_Y(F)) is pr₁^*x∪pr₂^*y∈H^*(K_(X×Y)(pr₁^*E⊗pr₂^*F)), X×Y the fibre product over A/I.

**Hypotheses and conventions.**

- (A,I,γ) is a PD ring and A is a Z_(p)-algebra; X is a scheme over A/I on which p is locally nilpotent.
- E and F are O_crys-modules on the crystalline site of X/Spec A; E⊗F is their tensor product over O_crys. No flatness is assumed.
- In (4), Y is a second scheme over A/I on which p is locally nilpotent.

**API.**

- `TauCeti.Crystalline.crysCup_unit` (relation): The class 1∈H⁰_crys(X/S), image of 1 under the unit A→K(O_crys), satisfies 1∪x=x=x∪1 for x∈H^*(K(E)), under O_crys⊗E≅E≅E⊗O_crys.
- `TauCeti.Crystalline.crysCup_graded_comm` (relation): For x∈H^i_crys(X/S) and y∈H^j_crys(X/S): x∪y=(−1)^(ij)·y∪x; for O_crys-modules E, F the same holds between K(E⊗F) and K(F⊗E) through the exchange isomorphism.
- `TauCeti.Crystalline.crysCup_reduction` (compatibility): For a homomorphism of PD rings (A′,I′,γ′)→(A,I,γ) and f:X→X′ over it, the base-change map K′(E′)⊗^L_(A′)A→K(f_crys^*E′) of CR.3/derived-base-change is compatible with cup products and units. In particular, for p^eA⊂I stable under γ, the reduction K(E)→RΓ_crys(X/Spec(A/p^e),E) carries cup products to cup products.
- `TauCeti.Crystalline.crysCup_assoc` (relation): (x∪y)∪z=x∪(y∪z) in H^*(K(E⊗F⊗G)) for x∈H^*(K(E)), y∈H^*(K(F)), z∈H^*(K(G)); the same holds for the maps of complexes in D(A).
- `TauCeti.Crystalline.crysCup_pullback` (functoriality): For a morphism g:X′→X of schemes over a homomorphism of PD rings and O_crys-modules E, F on X: g^*(x∪y)=g^*x∪g^*y and g^*1=1.
- `TauCeti.Crystalline.crysCup_deRham` (compatibility): If p is nilpotent in A and Y is a smooth lift of X over A, then under H^*_crys(X/S)≅H^*(Y,Ω^•_(Y/A)) of CR.2/smooth-lift-filtration the cup product is the product induced by the wedge product of Ω^•_(Y/A); with coefficients it is induced by (e⊗ω)∧(f⊗η)=(e⊗f)⊗(ω∧η).
- `TauCeti.Crystalline.crysCup_external` (data): For schemes X, Y over A/I and classes x∈H^*(K_X(E)), y∈H^*(K_Y(F)): x⊠y=pr₁^*x∪pr₂^*y∈H^*(K_(X×Y)(pr₁^*E⊗pr₂^*F)); on complexes, K_X(E)⊗^L_A K_Y(F)→K_(X×Y)(pr₁^*E⊗pr₂^*F).

**Unit tests.**

- `TauCeti.Crystalline.test_crysCup_point` (computation): For X=Spec k, k a perfect field of characteristic p, and S=Spec W(k): K(O_crys)=W(k) in degree 0 and the cup product is the multiplication of W(k).
- `TauCeti.Crystalline.test_crysCup_P1` (computation): On P¹×P¹ over a perfect field k, with h_a=pr_a^*h and h=c₁(O(1))∈H²_crys(P¹/W(k)): h₁∪h₂=h₂∪h₁ generates H⁴_crys(P¹×P¹/W(k))≅W(k), and h₁∪h₁=0=h₂∪h₂.
- `TauCeti.Crystalline.test_crysCup_P2` (computation): On P² over a perfect field k: h∪h generates H⁴_crys(P²/W(k))≅W(k) and h∪h∪h=0, for h=c₁(O(1)).
- `TauCeti.Crystalline.test_crysCup_odd` (computation): For a geometrically connected smooth proper curve C over a perfect field k and x,y∈H¹_crys(C/W(k)): x∪y=−y∪x and x∪x=0 in H²_crys(C/W(k)).

**Uses.** Ekedahl, On the multiplicative properties of the de Rham–Witt complex I, II Corollary 2.2.23 (p. 203): The duality isomorphism is induced by cup product followed by the trace. CrystallineCohomology CR.3/kunneth, CR.3:duality/poincare-pairing, CR.3:duality/gysin, CR.3:duality/diagonal: The external product, the Poincaré pairing, the projection formula and the class of the diagonal are expressed through the cup product and its compatibility with pullback and base change. MordellLawrenceVenkatesh:LV.2/crystalline-frobenius-on-fibres: Requests that crystalline Frobenius be compatible with cup products.

**Construction or proof.**

1. For a ringed topos (Sh(C),O) and a ring map A→Γ(C,O), derived global sections carry a cup product RΓ(K)⊗^L_A RΓ(M)→RΓ(K⊗^L_O M), which is associative and graded commutative (Stacks, Cohomology on Sites, Section 'Cup product', tags 0FPJ, 0FPL, 0FPM). Apply it to the crystalline topos with O=O_crys and compose with E⊗^L F→E⊗F.
2. For E=F=O_crys compose with the multiplication O_crys⊗O_crys→O_crys; it is commutative, so H^*_crys(X/S) is graded commutative, and x∪x=−x∪x for x of odd degree.
3. Under the isomorphisms of CR.2/embedding-computation and CR.2/smooth-lift-filtration the cup product is induced by the wedge product (e⊗ω)∧(f⊗η)=(e⊗f)⊗(ω∧η) of de Rham complexes, because these isomorphisms are induced by the multiplicative maps O_crys→Ω^•_(X/S) and restriction to a thickening.
4. Compatibility with the base-change map of CR.3/derived-base-change is the compatibility of the cup product with a commutative square of ringed topoi (Stacks tag 0H9A).

**Depends on:** `CR.2/crystalline-cohomology`, `CR.2/embedding-computation`, `CR.2/smooth-lift-filtration`, `CR.3/derived-base-change`, `CR.3/first-chern-class`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E1`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.23, Proposition 60.23.1 (tag 07LM) and the restriction map (60.23.2.1); §60.21, Proposition 60.21.3 (tag 07LG). The source has no cup product. It supplies the de Rham resolution of a crystal and its restriction to a thickening, on which the product is the wedge product. The cup product itself is the general one of a ringed topos (Stacks, Cohomology on Sites, Section 'Cup product', tag 0FPJ), the second source of this node.; [stacks-sites-cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/sites-cohomology.tex), Cohomology on Sites, Section "Cup product" (tag 0FPJ); Lemmas 0FPL (associativity), 0FPM (commutativity) and 0H9A (base change). The cup product of a ringed topos, from which (1) starts, with the associativity, graded commutativity and compatibility with base-change squares used in (2) and (3). The crystalline topos is not mentioned there; the specialisation, the unit and the external product (4) are the node's.

**Acceptance.**

- H^*_crys(P^d_k/W(k))=W[h]/(h^(d+1)) as a graded ring, h=c₁(O(1)), k a perfect field of characteristic p.
- For X=Spec k: K(O_crys)=W(k) in degree 0 and the cup product is the multiplication of W(k).

### frobenius-map — Semilinear crystalline Frobenius and linearization

**Construction:** `TauCeti.Crystalline.crysFrobenius`. Let (A,I,γ) be a PD ring with A a Z_(p)-algebra and p∈I, and σ:A→A a homomorphism of PD rings with σ(x)≡x^p modulo pA. Let S=Spec A, S₀=Spec A/I and X an S₀-scheme. (1) The absolute Frobenius F_X of X lies over the absolute Frobenius F_(S₀) of S₀, which Spec(σ) lifts; it induces a morphism of crystalline topoi (F_X)_crys:(X/S)_crys→(X/S)_crys. (2) An F-crystal on X/S relative to σ is a crystal E in finite locally free O_crys-modules together with a map Φ:(F_X)_crys^*E→E; it is nondegenerate if there are an integer i≥0 and a map V:E→(F_X)_crys^*E with V∘Φ=p^i. The structure sheaf with the canonical isomorphism (F_X)_crys^*O_crys=O_crys is an F-crystal. (3) For an F-crystal (E,Φ) and K=RΓ_crys(X/S,E) the linearised Frobenius F_K:K⊗^L_(A,σ)A→K is the composite of three maps: the base-change map K⊗^L_(A,σ)A→RΓ_crys(X^(1)/S,E^(1)), where X^(1)=X×_(S₀,F_(S₀))S₀ and E^(1) is the pullback of E along the projection X^(1)→X over Spec(σ); the pullback RΓ_crys(X^(1)/S,E^(1))→RΓ_crys(X/S,(F_X)_crys^*E) along the relative Frobenius F_(X/S₀):X→X^(1); and the map induced by Φ. (4) The composite F:K→K⊗^L_(A,σ)A→K is σ-semilinear on cohomology: F(ax)=σ(a)F(x).

**Hypotheses and conventions.**

- (A,I,γ) is a PD ring, A a Z_(p)-algebra, p∈I.
- σ:A→A is a ring endomorphism with σ(I)⊂I, σ∘γ_n=γ_n∘σ on I for all n≥0, and σ(x)≡x^p modulo pA for all x∈A.
- X is a scheme over A/I (so p=0 on X).
- (E,Φ) is an F-crystal on X/Spec A relative to σ: E is a crystal in finite locally free O_crys-modules and Φ:(F_X)_crys^*E→E is O_crys-linear. No nondegeneracy is assumed.

**API.**

- `TauCeti.Crystalline.crysFrobenius_semilinear` (characterisation): The endomorphism F of H^*(K) induced by K→K⊗^L_(A,σ)A→K is additive and satisfies F(ax)=σ(a)·F(x) for a∈A.
- `TauCeti.Crystalline.crysFrobenius_linearize` (data): F_K:K⊗^L_(A,σ)A→K is an A-linear map in D(A), the composite of the base-change map for Spec(σ), the pullback along the relative Frobenius F_(X/S₀):X→X^(1) and the map induced by Φ.
- `TauCeti.Crystalline.crysFrobenius_lift` (compatibility): Assume p is nilpotent in A. Let Y be a smooth lift of X over A and φ̃:Y→Y a morphism over Spec(σ) whose reduction modulo p is the absolute Frobenius of Y⊗_A A/p. Under RΓ_crys(X/S)≅RΓ(Y,Ω^•_(Y/A)) of CR.2/smooth-lift-filtration the semilinear Frobenius of the structure crystal is induced by φ̃^*:Ω^•_(Y/A)→Ω^•_(Y/A), and φ̃^*(Ω^q_(Y/A))⊂p^q·Ω^q_(Y/A) for every q≥0.
- `TauCeti.Crystalline.crysFrobenius_natural` (functoriality): For a morphism g:X′→X of schemes over A/I and a morphism of F-crystals g_crys^*(E,Φ)→(E′,Φ′), the induced map K→K′ commutes with the linearised Frobenius maps; in particular g^*∘F=F∘g^* on H^*_crys.
- `TauCeti.Crystalline.crysFrobenius_cup` (relation): For F-crystals (E,Φ_E), (E′,Φ_(E′)) and the F-crystal (E⊗E′,Φ_E⊗Φ_(E′)): F(x∪y)=F(x)∪F(y); and F(1)=1 in H⁰_crys(X/S).
- `TauCeti.Crystalline.crysFrobenius_chern` (relation): F(c₁(L))=p·c₁(L) in H²_crys(X/S) for every invertible O_X-module L, because F_X^*L≅L^(⊗p).
- `TauCeti.Crystalline.crysFrobenius_finite_field` (example): For k=F_(p^f), A=W(k) and σ the Witt vector Frobenius, the iterate F^f is W(k)-linear on H^*_crys(X/W(k)).

**Unit tests.**

- `TauCeti.Crystalline.test_crysFrobenius_point` (computation): For X=Spec k, k perfect of characteristic p, A=W(k), σ the Witt vector Frobenius: K=W(k) and F=σ; it is not W(k)-linear when k≠F_p.
- `TauCeti.Crystalline.test_crysFrobenius_P1` (computation): For P¹ over a perfect field k and A=W(k): F=σ on H⁰_crys=W and F(h)=p·h for h=c₁(O(1))∈H²_crys(P¹/W(k)).
- `TauCeti.Crystalline.test_crysFrobenius_Pd` (computation): On H^(2i)_crys(P^d/W(k))=W·h^i, k perfect: F(a·h^i)=σ(a)·p^i·h^i for 0≤i≤d.
- `TauCeti.Crystalline.test_crysFrobenius_singular` (non-example): For X=Spec F_p[x,y]/(x²,xy,y²), A=Z_p with I=(p) and σ=id: the Frobenius F of H⁰_crys(X/Z_p) is not injective.

**Uses.** Stacks, Crystalline Cohomology, Theorem 60.26.4; CR.3:Frobenius-isogeny/rational-frobenius: The linearised Frobenius is the map shown to be an isomorphism after inverting p. Langer–Zink, De Rham–Witt cohomology for a proper and smooth morphism, §3.4; CR.4/degree-scaled-frobenius: Compared there with p^q·F on de Rham–Witt forms of degree q. MordellLawrenceVenkatesh:LV.2/crystalline-frobenius-on-fibres; PadicDifferentialEquationsAndRigidCohomology:RD.7/rigid-crystalline-comparison; PrismaticCohomology:PR.1/crystalline-comparison: Use semilinearity, functoriality in the scheme, compatibility with cup products and with the de Rham comparison of a smooth lift.

**Construction or proof.**

1. The square formed by F_X, F_(S₀) and the structure map X→S₀ commutes and Spec(σ) is a PD morphism lifting F_(S₀); CR.1/site-morphisms gives (F_X)_crys.
2. F_X is the composite of the relative Frobenius F_(X/S₀):X→X^(1) and the projection X^(1)→X over F_(S₀); hence F_(X/S₀)^*E^(1)=(F_X)_crys^*E. Compose the base-change map of CR.3/derived-base-change (1) for the projection over Spec(σ), the pullback along F_(X/S₀), and RΓ_crys(X/S,Φ).
3. Semilinearity: K→K⊗^L_(A,σ)A, x↦x⊗1, is σ-semilinear and the three maps of (3) are A-linear.
4. Functoriality in X and compatibility with cup products follow from the corresponding properties of pullback, of the base-change map and of the cup product. If p is nilpotent in A, Y is a smooth lift of X and φ̃:Y→Y lies over Spec(σ) and reduces modulo p to the absolute Frobenius of Y⊗_A A/p, functoriality of the comparison of CR.2/smooth-lift-filtration identifies F with the map induced by φ̃^* on Ω^•_(Y/A); φ̃^*(dy)=d(y^p+p·z)∈p·Ω¹_(Y/A), so φ̃^*(Ω^q_(Y/A))⊂p^q·Ω^q_(Y/A).

**Depends on:** `CR.1/site-morphisms`, `CR.1/isocrystal`, `CR.3/derived-base-change`, `CR.2/crystalline-cohomology`, `CR.3/cup-product`, `CR.3/first-chern-class`, `CR.2/smooth-lift-filtration`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.26, Situation 60.26.1 (tag 07N2), Definition 60.26.2 (tag 07N3), and the first paragraph of the proof of Theorem 60.26.4 (tag 07N5). The node takes the situation, the definition of an F-crystal and of nondegeneracy, and the factorisation of the Frobenius map into base change, pullback along the relative Frobenius and the map of the F-crystal. Semilinearity, functoriality, multiplicativity and the description on a lift carrying a lift of Frobenius are standard consequences stated here; the source does not state them.

**Acceptance.**

- For X=Spec k, k perfect of characteristic p, A=W(k): K=W(k) and F is the Witt vector Frobenius σ.
- For P^d over k: F(h^i)=p^i·h^i on H^(2i)_crys(P^d/W(k))=W·h^i, 0≤i≤d.
- For X=Spec F_p[x,y]/(x²,xy,y²), A=Z_p, σ=id: F is not injective on H⁰_crys(X/Z_p) (Stacks Example 60.22.1).

### kunneth — Proper smooth crystalline Künneth formula

**Theorem:** `TauCeti.Crystalline.crysKunneth`. Let k be a perfect field of characteristic p, W=W(k), X and Y proper smooth k-schemes and E, F finite locally free crystals on X/W and Y/W; write K(X,E)=RΓ_crys(X/W,E). The external cup product K(X,E)⊗^L_W K(Y,F)→K(X×_kY,pr₁^*E⊗pr₂^*F), x⊗y↦pr₁^*x∪pr₂^*y, is an isomorphism in D(W). It is compatible with cup products, with the reductions ⊗^L_W W_n(k), and, when (E,Φ_E) and (F,Φ_F) are F-crystals relative to the Witt vector Frobenius σ, with the linearised Frobenius maps of CR.3/frobenius-map for (E,Φ_E), (F,Φ_F) and (pr₁^*E⊗pr₂^*F,Φ_E⊗Φ_F). Consequently there are short exact sequences 0→⊕_(i+j=n)H^i(K(X,E))⊗_W H^j(K(Y,F))→H^n(K(X×Y,pr₁^*E⊗pr₂^*F))→⊕_(i+j=n+1)Tor₁^W(H^i(K(X,E)),H^j(K(Y,F)))→0.

**Hypotheses and conventions.**

- k is a perfect field of characteristic p; W=W(k) with the PD ideal (p).
- X and Y are proper and smooth over k.
- E and F are crystals in finite locally free O_crys-modules on X/W and Y/W. For the Frobenius compatibility, (E,Φ_E) and (F,Φ_F) are F-crystals relative to the Witt vector Frobenius σ in the sense of CR.3/frobenius-map.

**Construction or proof.**

1. The map is the external product of CR.3/cup-product. Compatibility with cup products and reductions follows from naturality of the cup product under pullback and base change; compatibility with Frobenius from naturality of the Frobenius map and F_(X×Y)=F_X×F_Y.
2. Both sides are perfect complexes of W-modules (CR.3/proper-perfectness), hence derived p-complete; by derived Nakayama it suffices to prove that the map is an isomorphism after ⊗^L_W k.
3. After ⊗^L_W k both sides are de Rham cohomology (CR.3/proper-perfectness (3), CR.2/smooth-lift-filtration), and the map is RΓ(X,E_X⊗Ω^•_X)⊗_k RΓ(Y,F_Y⊗Ω^•_Y)→RΓ(X×Y,(pr₁^*E_X⊗pr₂^*F_Y)⊗Ω^•_(X×Y)), induced by the wedge product.
4. Ω^n_(X×Y/k)=⊕_(a+b=n)pr₁^*Ω^a_X⊗pr₂^*Ω^b_Y compatibly with the differentials, and RΓ(X,G)⊗_k RΓ(Y,H)≅RΓ(X×Y,pr₁^*G⊗pr₂^*H) for quasi-coherent G, H on the quasi-compact separated k-schemes X, Y; filter both sides by form degree. The exact sequences are the Künneth sequences of the derived tensor product of two perfect complexes over the discrete valuation ring W. The coherent Künneth isomorphism is proved directly by finite affine covers: on a product of affine intersections sections are the tensor product over k, which is exact over a field; the two alternating Čech complexes tensor to the product double complex. Thus no general K-theory projection formula is used.

**Depends on:** `CR.3/cup-product`, `CR.3/proper-perfectness`, `CR.3/derived-base-change`, `CR.3/frobenius-map`, `CR.2/smooth-lift-filtration`, `SchemeAndStackFoundations:SF.2/tor-independent-base-change`, `DerivedDeRhamCohomology:DD.1/derived-completion`, `DerivedDeRhamCohomology:DD.1/completion-exchanges`, `CR.3/crystalline-descent`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.24, Remark 60.24.9 (tag 07MU), Base change isomorphism, and Remark 60.24.12 (tag 07MX), Perfectness. The source has no Künneth formula. It supplies base change and perfectness (as remarks with hints), by which the statement is reduced to the Künneth formula for de Rham cohomology with coefficients; the statement of the node is deduced here.; [stacks-derham](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/derham.tex), de Rham Cohomology, Section "Künneth formula" (tag 0FM9), Lemma 0FMB. The Künneth isomorphism for de Rham cohomology with trivial coefficients over an affine base, proved from the Künneth formula for coherent cohomology; the node uses it for the reductions modulo p. Crystalline cohomology, coefficients and the Frobenius compatibility are not in this source.

**Acceptance.**

- H^*_crys(P¹×P¹/W)=W[h₁,h₂]/(h₁²,h₂²), h_a=pr_a^*h.
- The tensor product must be derived: for the surface H_k of BMS1 Theorem 2.10, the cokernel of ⊕_(i+j=3)H^i⊗_W H^j→H³_crys(H_k×H_k/W), H^i=H^i_crys(H_k/W), contains Tor₁^W(H²,H²)≅Tor₁^W(k²,k²)≅k⁴, so this map is not surjective.

### etale-hypercover-descent — Descent along étale hypercovers

**Theorem:** `TauCeti.Crystalline.etale_hypercover_descent`. Let U_•→X be an étale hypercover of schemes over the PD base S and E a quasi-coherent crystal. With pullback coefficients E_n on each U_n, the augmentation RΓ_crys(X/S,E)→Tot_n RΓ_crys(U_n/S,E_n) is an isomorphism. Totalization is a homotopy limit. For bounded-below coefficient complexes use their derived hypercohomology; in the p-adic setting use compatible finite-level descent followed by Rlim. This does not assert h-, fppf- or proper descent for arbitrary crystalline coefficients.

**Hypotheses and conventions.**

- The crystalline situation of etale-crystalline-site; U_• is an étale hypercover.
- The coefficient complexes are bounded below; unbounded descent would need a separate convergence theorem.

**Construction or proof.**

1. Extend E to the étale crystalline site by etale-crystal-comparison. Its derived projection to X_ét has étale-local evaluations given by the crystalline complexes on U_n.
2. Apply the bounded-below hypercover theorem of E2 to this projected complex.
3. Use etale-crystal-comparison on X and on each U_n to express the two sides in the original Zariski crystalline convention. Compatibility of restriction supplies the augmentation.
4. Take Rlim of these finite-level equivalences in the complete case; homotopy limits commute with homotopy limits.

**Depends on:** `CR.1/etale-crystal-comparison`, `CR.2/crystalline-cohomology`, `EnhancedDerivedSheaves:E2/hypercover`, `EnhancedDerivedSheaves:E2/bounded-below-hypercover-descent`.

**Sources:** [stacks-etale-cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/etale-cohomology.tex), §59.22, Theorem 59.22.4. The affine topology-independence input.; [bhatt-dejong](https://arxiv.org/pdf/1110.5001v1), §3, proof of Theorem 3.6, pp.8–9. Crystalline complexes commute with localisation and glue; the extension to an étale hypercover uses the explicit E2 hypercover contract.

**Acceptance.**

- For an étale covering map U→X its full Čech nerve gives the usual descent totalization.
- A non-Zariski field extension F_(p²)/F_p is a descent example; deleting the higher overlap terms would give F_(p²), rather than F_p, for the unit crystal.

### top-coherent-differential — Vanishing of the top coherent de Rham differential

**Theorem:** `TauCeti.Crystalline.top_coherent_differential`. If X is smooth proper equidimensional of dimension d over a field k of positive characteristic, d:H^d(X,Ω^(d−1)_(X/k))→H^d(X,Ω^d_(X/k)) is zero. Thus the coherent trace factors through top de Rham cohomology. For a geometrically connected smooth proper curve this gives H¹_dR dimension 2g.

**Hypotheses and conventions.**

- k has positive characteristic; X smooth proper of pure dimension d.

**Construction or proof.**

1. Reduce to a connected component and to its finite separable constant field, so the top Hodge cohomology is one dimensional.
2. Use the trace of the finite syntomic relative Frobenius on forms: it commutes with d, is zero in degree d−1 and surjective in degree d. Finite pushforward preserves cohomology; H^d is right exact by cohomological dimension, so the top trace is nonzero. The commuting square forces the displayed differential to be zero.
3. For a curve, combine this with d:H⁰(O)→H⁰(Ω¹)=0 and the coherent dimensions from JacobianChallenge Layer B.

**Depends on:** `SchemeAndStackFoundations:SF.2/serre-proper`, `DerivedDeRhamCohomology:DD.3/smooth-cartier`.

**Sources:** [stacks-derham](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/derham.tex), §50.20, Lemma 50.20.3 (0FW6), positive-characteristic proof; §50.19, Lemma 50.19.5. The proof uses the trace on forms for relative Frobenius. The packet restricts to the positive-characteristic case it needs.

**Acceptance.**

- The map on forms is k-linear; its vanishing cannot be obtained by treating it as an O_X-linear map in Serre duality.

### smooth-curve-lift — Smooth proper lifts of curves over Witt vectors

**Theorem:** `TauCeti.Crystalline.smooth_curve_lift`. For a geometrically connected smooth proper curve C over a perfect field k of characteristic p, there exists a smooth proper projective W(k)-scheme C̃ with C̃⊗k≅C. A lift is chosen, not canonical. For every n, coherent cohomology of O and Ω¹ on C̃_n has ranks 1,g,g,1 and is free over W_n(k); the Hodge–de Rham spectral sequence degenerates and H²_dR(C̃_n/W_n(k)) is free of rank one.

**Hypotheses and conventions.**

- k perfect of characteristic p; C smooth proper geometrically connected, genus g.

**Construction or proof.**

1. Use SF.4/deformations-of-smooth-schemes: the obstruction H²(C,T_C) vanishes by dimension one, so lift successively to W_n. Lift an ample bundle because H²(C,O_C)=0. SF.4/effective-formal-deformations-of-curves algebraizes the compatible polarized system; smoothness follows from the local lifting criterion and properness.
2. Apply the relative coherent cohomology and base-change interface of JacobianChallenge Layer C, together with Serre duality for smooth proper curves, to obtain the free Hodge groups and their ranks.
3. The differential on H⁰(O) is zero. Vanishing on H¹(O) requires the relative trace/residue calculation, not just O-linear Serre duality; the field version is top-coherent-differential below and the Witt-thickening version is recorded as a precise remaining proof input. With that input the two-column spectral sequence degenerates.

**Depends on:** `SchemeAndStackFoundations:SF.4/deformations-of-smooth-schemes`, `SchemeAndStackFoundations:SF.4/effective-formal-deformations-of-curves`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`, `SchemeAndStackFoundations:SF.2/serre-proper`, `CR.3/top-coherent-differential`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.24, Remark 60.24.11 (07MW). Smooth-lift crystalline computation; the lift itself is supplied by the lower-tier deformation and algebraization interfaces.; [stacks-derham](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/derham.tex), §50.20, Lemma 50.20.3 (0FW6). The field-case vanishing that must not be inferred merely from O-linear Serre duality.

**Acceptance.**

- For C=P¹_k take P¹_W; for a nonsingular Weierstrass curve lift its coefficients and unit discriminant.

### crystalline-leray — Crystalline Leray spectral sequence

**Theorem:** `TauCeti.Crystalline.crystalline_leray`. For a morphism f:Y→X of schemes over a PD base S and a bounded-below crystalline coefficient complex E, the morphism of crystalline topoi gives E₂^(a,b)=H^a_crys(X/S,R^b f_crys,*E)⇒H^(a+b)_crys(Y/S,E). For a proper smooth f whose relative cohomology is finite locally free and commutes with PD base change, the R^b f_crys,*E are finite locally free crystals. For an étale-locally trivial E₀-torsor with E₀ a smooth proper elliptic curve, R¹ f_crys,*O is the constant rank-two crystal H¹_crys(E₀/S); its descent transition maps are trivial because translations act trivially on H¹.

**Hypotheses and conventions.**

- E bounded below; use the finite-level PD sites first and a derived limit for p-adic cohomology.
- Finite local freeness of higher direct images is asserted only with the displayed flatness and base-change conditions, not for every proper smooth family.

**Construction or proof.**

1. Compose derived direct images for the crystalline site morphisms. Filter the bounded-below derived pushforward by its Postnikov truncations and apply RΓ on the base; the requested E1 Grothendieck spectral-sequence contract gives convergence (first quadrant after shifting the lower bound). Restriction to fibres gives the edge maps.
2. Under the relative perfectness and base-change conditions, evaluate on each PD thickening and descend the relative cohomology modules as crystals. In the torsor case étale local sections reduce to the product with E₀; the needed elliptic Hodge ranks and relative degeneration are the smooth-curve-lift calculation. This invokes only the curve part, not the torsion surface that consumes Leray.
3. Translations on E₀ act identically on H¹: Künneth gives H¹(E₀×E₀)=H¹(E₀)⊕H¹(E₀), and addition pulls a class back to the sum of its two components, as seen by restriction to the axes. A constant section has zero positive-degree pullback. This makes torsor descent constant. The relative PD-thickening extension of this argument is the exact outstanding input below.

**Depends on:** `CR.1/site-morphisms`, `CR.1/etale-crystal-comparison`, `ArithmeticGaloisDuality:R02.2/first-quadrant-spectral-sequence`, `EnhancedDerivedSheaves:E1`, `CR.3/smooth-curve-lift`.

**Sources:** [bms1](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §2.2, proof of Theorem 2.10, pp.17–19. The two crystalline Leray applications computing the torsion surface and its elliptic torsor; their required coefficient conditions are made explicit.

**Acceptance.**

- For f=id the spectral sequence has only b=0.
- For f:E₀×X→X the edge map H¹(E₀×X)→H⁰(X,H¹(E₀)) is restriction to a fibre.

### torsion-and-models — Proper smooth tests and a crystalline torsion surface

**Application:** `TauCeti.Crystalline.crysAcceptanceModels`. Let k be a perfect field of characteristic p, W=W(k), σ its Frobenius and F the semilinear Frobenius of CR.3/frobenius-map. (a) For d≥0: H^*_crys(P^d_k/W)=W[h]/(h^(d+1)) as a graded W-algebra, with h=c₁(O(1)) in degree 2; thus H^(2i)=W·h^i for 0≤i≤d, the odd groups vanish, and F(h)=p·h. (b) For a geometrically connected smooth proper curve C of genus g over k: H⁰_crys(C/W)=W, H¹_crys(C/W) is free of rank 2g, H²_crys(C/W) is free of rank 1, and F(H²_crys(C/W))=p·H²_crys(C/W). (c) For an elliptic curve E over k with origin 0: H¹_crys(E/W) is free of rank 2 and H²_crys(E/W)=W·e with e=c₁(O_E([0])) and F(e)=p·e. (d) Let O be the ring of integers of a complete algebraically closed non-archimedean extension C of Q_p, with residue field k. The smooth projective surface H over O constructed in BMS1 §2.2 satisfies H¹_crys(H_k/W(k))=0 and H²_crys(H_k/W(k))_tors≅k⊕k, while H²_ét(H_C,Z_p)_tors≅Z/p².

**Hypotheses and conventions.**

- k is a perfect field of characteristic p; W=W(k) with PD ideal (p); σ is the Witt vector Frobenius.
- (b): C is a smooth proper geometrically connected curve over k and g=dim_k H¹(C,O_C).
- (c): E is an elliptic curve over k: a smooth proper geometrically connected curve of genus 1 with a rational point 0.
- (d): O is the ring of integers of a complete algebraically closed non-archimedean extension C of Q_p and k is its residue field. E/O is an elliptic curve with supersingular reduction, G⊂E the flat closure of the subgroup generated by a point of exact order p², P/O a projective space with a G-action whose locus of non-trivial stabilisers has codimension >2 on the special fibre, and H a smooth complete intersection of hypersurfaces of sufficiently large degree in P/G contained in the image of the free locus (BMS1 Lemmas 2.5, 2.7, 2.9).

**Construction or proof.**

1. (a): P^d_k lifts to P^d over W_n. By CR.2/smooth-lift-filtration and the de Rham description of the cup product, H^*_crys(P^d_k/W_n) is the de Rham cohomology ring of P^d over W_n, which is W_n[h]/(h^(d+1)) with h=c₁(O(1)), because H^q(P^d,Ω^p) vanishes for p≠q and is free of rank one generated by the p-th power of the Hodge class of O(1) for p=q≤d. Pass to the limit over n by CR.3/proper-perfectness (2). F(h)=p·h by CR.3/frobenius-map.
2. (b), (c): K=RΓ_crys(C/W) is perfect of Tor-amplitude in [0,2] with K⊗^L_W k=RΓ_dR(C/k) (CR.3/proper-perfectness). The Hodge–de Rham spectral sequence of C degenerates (d vanishes on H⁰(C,O) and on H¹(C,O)), so dim_k H^i_dR(C/k)=1, 2g, 1. Hence H⁰(K) is free with H⁰(K)/p⊂k, so H⁰(K)=W; H¹(K)[p]=coker(H⁰(K)/p→H⁰_dR)=0; and H²(K)/p≅H²_dR(C/k)=k.
3. H²(K) is torsion-free: C has a smooth proper lift C̃ over W (for an elliptic curve, a Weierstrass equation with lifted coefficients); K⊗^L_W W_n≅RΓ_dR(C̃_n/W_n) by CR.2/smooth-lift-filtration; the modules H^q(C̃_n,Ω^p) are free over W_n of ranks 1, g, g, 1 and the relative Hodge–de Rham spectral sequence degenerates, so H²_dR(C̃_n/W_n)≅W_n for all n. Then rank H¹(K)=2g by the Euler characteristic 2−2g.
4. Frobenius on H²: after a finite extension of k, which changes W by a faithfully flat base change (CR.3/derived-base-change), C has a rational point x. The class e=c₁(O(x)) reduces to the image of the Hodge class of O(x) in H²_dR(C/k)=H¹(C,Ω¹), which is non-zero: Riemann–Roch gives H⁰(C,Ω¹)=H⁰(C,Ω¹(x)), so the connecting map k→H¹(C,Ω¹) of 0→Ω¹→Ω¹(x)→k_x→0 is injective. So e is a basis of H²(K), and F(e)=p·e. For an elliptic curve take x=0.
5. (d): by CR.3/weak-lefschetz and the Leray spectral sequence of X_(E,k)=(P_k×E_k)/G_k→E_k/G_k≅E_k, with fibres P_k, the maps H^i_crys(E_k/W)→H^i_crys(H_(E,k)/W) are isomorphisms for i=0,1 and H²_crys(H_(E,k)/W) is torsion-free. In the exact sequence of low degree of the Leray spectral sequence of the E_k-torsor f:H_(E,k)→H_k, 0→H¹(H_k)→H¹(H_(E,k))→H⁰(H_k,R¹f_crys*O)→H²(H_k)→H²(H_(E,k)), restriction to a fibre identifies the middle map with the endomorphism of H¹_crys(E_k/W) induced by E_k→E_k/E_k[p]≅E_k, which is multiplication by p. Hence H¹_crys(H_k/W)=0 and H²_crys(H_k/W)_tors≅H¹_crys(E_k/W)/p≅k⊕k (BMS1, proof of Theorem 2.10).

**Depends on:** `CR.3/weak-lefschetz`, `CR.3/proper-perfectness`, `CR.3/frobenius-map`, `CR.3/cup-product`, `CR.3/first-chern-class`, `CR.3/derived-base-change`, `CR.2/smooth-lift-filtration`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`, `ArithmeticGaloisDuality:R02.2/first-quadrant-spectral-sequence`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`, `CR.3/smooth-curve-lift`, `CR.3/crystalline-leray`, `CR.3/top-coherent-differential`.

**Sources:** [bms1](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §2.2, pp. 15–17: Lemmas 2.5, 2.7 and 2.9 (the construction), Theorem 2.10 (p. 16) and its proof (pp. 16–17). Part (d) is Theorem 2.10 together with the equality H¹_crys(H_k/W(k))=0 obtained in its proof. Parts (a)–(c) are the other acceptance examples of the stage; they are standard computations and are not in this source.; [stacks-derham](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/derham.tex), de Rham Cohomology, Lemmas 0FMI and 0FMJ (Hodge and de Rham cohomology of projective space). For a ring A the de Rham cohomology of P^n_A is free with basis the powers of c₁^dR(O(1)); part (a) is deduced from it for A=W_n(k) through the comparison with de Rham cohomology of the lift P^n over W_n(k).

**Acceptance.**

- d=1: H^*_crys(P¹_k/W)=W⊕W·h with h∪h=0 and F(h)=p·h.
- For the surface of (d): length_W H²_crys(H_k/W)_tors=2=length_(Z_p) H²_ét(H_C,Z_p)_tors, but Z/p²⊗_(Z_p)W=W/p² is not isomorphic to k⊕k; K=RΓ_crys(H_k/W) is perfect although H² is not free.

### elliptic-frobenius — Ordinary and supersingular elliptic crystalline Frobenius

**Theorem:** `TauCeti.Crystalline.elliptic_frobenius`. For an elliptic curve E/F_p with a=p+1−#E(F_p), H¹_crys(E/Z_p) is free of rank two and its Frobenius has characteristic polynomial T²−aT+p. For E:y²=x³+x over F_5 the point count is 4, a=2, and the Newton slopes are 0 and 1; E is ordinary. For E:y²=x³−x over F_3 the point count is 4, a=0, and the polynomial is T²+3 with both slopes 1/2; E is supersingular. The slopes describe rational cohomology and do not assert a diagonal integral basis.

**Hypotheses and conventions.**

- E is elliptic, not a singular Weierstrass cubic; the displayed Frobenius is linear because σ on W(F_p)=Z_p is the identity.

**Construction or proof.**

1. Use torsion-and-models for rank two, H²=Z_p·c₁(0), and F on H² equal to p. The cup pairing on H¹ is perfect: modulo p this is Serre duality on the two Hodge pieces, and freeness plus Nakayama lifts its nondegeneracy. This curve-case pairing uses top-coherent-differential and does not require a later CR.3:duality result. The pairing is alternating even at p=2: graded commutativity gives 2(x∪x)=0, and H² is torsion-free over Z_p, hence x∪x=0.
2. Künneth and restriction to the two axes show that addition on E pulls H¹ back by the sum. Hence the endomorphism-to-cohomology action is additive. Import the existing upstream EllipticCurves Layer 3 identity π²−[a]π+[p]=0, giving F²−aF+p=0. The alternating cup form scales by p under F, so det(F)=p. Cayley–Hamilton then gives tr(F)=a, since F is invertible after inverting p.
3. Enumerate the affine points: for F_5 the only x with x³+x a square are 0,2,3, each with y=0; for F_3 every x has x³−x=0, each with y=0. Add the point at infinity. The valuation polygons of T²−2T+5 and T²+3 give the stated slopes. Ordinary/supersingular agrees with the geometric predicates by the upstream finite-field criterion p∣a.

**Depends on:** `CR.3/torsion-and-models`, `CR.3/top-coherent-differential`, `CR.3/cup-product`, `CR.3/kunneth`, `CR.3/first-chern-class`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`, `SchemeAndStackFoundations:SF.2/serre-proper`.

**Sources:** [bms1](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §2.2, proof of Theorem 2.10, pp.17–19. Rank-two torsion-free elliptic crystalline cohomology used by the model calculation. The polynomial is deduced using the already owned isogeny identity and cup form.; [stacks-weil](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/weil.tex), §45.4, Definition 45.4.1, cup-product and duality conventions. The cohomological determinant convention; the proof here needs only the curve pairing and no general Weil-conjectures theorem.

**Acceptance.**

- The affine counts are 3 in both cases; counting only affine points would give the wrong Frobenius trace.
- The ordinary polynomial has det=5 and trace=2; the supersingular polynomial has det=3 and trace=0.

## CR.3:Frobenius-isogeny — Frobenius isogeny

**Targets.** Rational crystalline Frobenius isogeny.

### inseparable-control — p-power control for purely inseparable pullback

**Theorem:** `TauCeti.Crystalline.crysInseparableControl`. Let (S,I,γ) be a PD scheme over Z_(p) with p∈I, S₀=V(I), and f:X′→X a morphism of S₀-schemes which, locally on X, is a composite of finitely many morphisms of the form Spec C[z]/(z^p−c)→Spec C (an iterated α_p-cover), of constant degree q. Let E be a crystal in quasi-coherent O_crys-modules on X/S and E′=f_crys^*E. Then the cone Q of Ru_(X/S,*)E→f_*Ru_(X′/S,*)E′ in the derived category of X_Zar has cohomology sheaves annihilated by q, and f^*:H^i_crys(X/S,E)→H^i_crys(X′/S,E′) has kernel and cokernel annihilated by q^(i+1). If X→S₀ is smooth of relative dimension d and X^(1)=X×_(S₀,F_(S₀))S₀, the relative Frobenius F_(X/S₀):X→X^(1) is an iterated α_p-cover of degree p^d; hence for every crystal G in quasi-coherent modules on X^(1)/S the map F_(X/S₀)^*:H^i_crys(X^(1)/S,G)→H^i_crys(X/S,(F_(X/S₀))_crys^*G) has kernel and cokernel annihilated by p^(d(i+1)).

**Hypotheses and conventions.**

- (S,I,γ) is a PD scheme over Z_(p) with p∈I; S₀=V(I).
- f:X′→X is a morphism of S₀-schemes such that every point of X has an open neighbourhood over which f is a composite of finitely many morphisms Spec C[z]/(z^p−c)→Spec C, with C an F_p-algebra and c∈C; f is then finite locally free, and its degree q is assumed constant.
- E is a crystal in quasi-coherent O_crys-modules on X/S and E′=f_crys^*E.
- For the last assertion: X→S₀ is smooth of relative dimension d, and G is a crystal in quasi-coherent O_crys-modules on X^(1)/S.

**Construction or proof.**

1. Reduce to S=Spec A, X=Spec C and one cover C′=C[z]/(z^p−c). With P→C a surjection from a polynomial A-algebra, D its p-adically completed PD envelope and λ∈D a lift of c, the completed envelope for P[z]→C′ is D′, the p-adic completion of D[z]⟨ξ⟩/(ξ−(z^p−λ)); it is the completion of the free D-module on z^j·ξ^[n], 0≤j<p, n≥0, and Ω_(D′)=Ω_D⊗D′⊕D′·dz, completed (CR.1/envelope-differentials).
2. Define a continuous D-linear θ:D′→D′ by θ(z^j)=p·z^(j+1)/(j+1) for 0≤j≤p−1, θ(z^(p−1)·ξ^[m])=ξ^[m+1] for m≥1, and θ(z^j·ξ^[m])=(p·z^(j+1)·ξ^[m]−θ(p·λ·z^j·ξ^[m−1]))/(j+1+p·m) for 0≤j<p−1, m≥1; then ∂_z∘θ=p. That p·g−θ(∂_z g)∈D and (θ⊗1)(d₁g)−d₁θ(g)∈Ω_D for all g∈D′ is checked in the universal case D₀=Z_(p)[λ], where D₀′ is torsion-free and D₀ is the kernel of ∂_z.
3. Let c:M⊗Ω^•_D→M⊗Ω^•_(D′) be the comparison map for the module with connection (M,∇) of E. With h(g·ω)=0, h(g·dz∧η)=θ(g)·η, e(g·ω)=(p·g−θ(∂_z g))·ω and e(g·dz∧η)=((θ⊗1)(d₁g)−d₁θ(g))∧η one has d∘h+h∘d=p−c∘e and e∘c=p. The map c is termwise injective, because D→D′ has a continuous D-linear retraction, and h vanishes on the image of c; so h induces a homotopy between multiplication by p and 0 on coker(c), which is quasi-isomorphic to the cone of c. Hence the cone has cohomology annihilated by p and none in degree −1.
4. For a composite of m covers Q is a successive extension of m such cones (octahedral axiom), so its cohomology sheaves are annihilated by q=p^m and vanish in negative degrees. Then H^n(X,Q) is filtered with graded pieces subquotients of H^a(X,H^b(Q)), a+b=n, b≥0, hence is annihilated by q^(n+1); the kernel of f^* on H^i is a quotient of H^(i−1)(X,Q) and its cokernel a subgroup of H^i(X,Q).
5. If X→S₀ is smooth of relative dimension d then, locally, X is étale over affine d-space over S₀ and the relative Frobenius of X is the base change of that of affine space, which raises the d coordinates to the p-th power and is a composite of d covers of the form above, one for each coordinate; so F_(X/S₀) is an iterated α_p-cover of degree p^d.

**Depends on:** `CR.2/embedding-computation`, `CR.2/pd-poincare`, `CR.1/envelope-differentials`, `CR.0/pd-polynomial`, `CR.0/regular-envelope`, `mathlib:DerivedCategory.TStructure.t`, `mathlib:CategoryTheory.Triangulated.TStructure.triangleLEGE`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.25 (tag 07PZ): Lemma 60.25.1 (tag 07Q7), Lemma 60.25.3 (tag 07N1), Lemma 60.25.4 (tag 07Q9), Lemma 60.25.5 (tag 07QA), Lemma 60.25.6 (tag 07QB). The statement is Lemmas 60.25.4, 60.25.5 and 60.25.6 with their hypotheses and exponents. The proof steps add two facts which the source's deductions use without saying so: for one cover the cone is annihilated by p and has no cohomology in degree −1, because the comparison map is injective, e∘c=p exactly and the homotopy vanishes on its image.

**Acceptance.**

- For X=P¹_k over a perfect field k and S=Spec W(k): F_(X/k)^* is the identity W→W on H⁰ and multiplication by p on H²≅W, because F_(X/k)^*O(1)=O(p); its cokernel W/p is annihilated by p, within the bound p^(1·(2+1)), so the pullback is not an isomorphism and the bound is not sharp.

### rational-frobenius — Rational crystalline Frobenius isogeny

**Theorem:** `TauCeti.Crystalline.crysFrobeniusIsogeny`. Let (A,I,γ) be a PD ring with A Noetherian and p-adically complete and p∈I, σ:A→A a homomorphism of PD rings with σ(x)≡x^p modulo pA, X a proper smooth scheme over A/I, and (E,Φ) a nondegenerate F-crystal on X/Spec A relative to σ: E is a crystal in finite locally free O_crys-modules, Φ:(F_X)_crys^*E→E, and there are an integer i≥0 and a map V:E→(F_X)_crys^*E with V∘Φ=p^i. Then the linearised Frobenius F_K:K⊗^L_(A,σ)A→K of CR.3/frobenius-map, K=RΓ_crys(X/Spec A,E), becomes an isomorphism after inverting p. In particular, for a perfect field k of characteristic p, A=W(k) and σ the Witt vector Frobenius, the semilinear Frobenius of H^j_crys(X/W(k),E)[1/p] is bijective for every j. It need not be bijective on H^j_crys(X/W(k),E).

**Hypotheses and conventions.**

- (A,I,γ) is a PD ring, A is Noetherian and p-adically complete, p∈I.
- σ:A→A is a homomorphism of PD rings with σ(x)≡x^p modulo pA.
- X is proper and smooth over A/I.
- (E,Φ) is an F-crystal on X/Spec A relative to σ (a crystal in finite locally free O_crys-modules with Φ:(F_X)_crys^*E→E) and is nondegenerate: there are an integer i≥0 and a map V:E→(F_X)_crys^*E with V∘Φ=p^i.

**Construction or proof.**

1. F_K is the composite of the base-change map for Spec(σ), the pullback along the relative Frobenius F_(X/S₀):X→X^(1) and the map induced by Φ (CR.3/frobenius-map).
2. The base-change map is an isomorphism: X^(1) is the base change of the proper smooth X along F_(S₀), source and target are perfect complexes compatible with reduction modulo p^e (CR.3/proper-perfectness (2)), and modulo p^e the map is an isomorphism by CR.3/derived-base-change (2).
3. The pullback along F_(X/S₀): X is quasi-compact, so its relative dimensions are bounded by some d, and by CR.3:Frobenius-isogeny/inseparable-control the kernel and cokernel on H^j are annihilated by p^(d(j+1)); the cohomology is bounded, so the map is an isomorphism after inverting p.
4. The map induced by Φ: E has rank bounded by some r on the quasi-compact X, and for N>i·r the map V′=p^N·V satisfies V′∘Φ=Φ∘V′=p^(N+i) (Stacks Remark 60.26.3); so it is an isomorphism after inverting p.

**Depends on:** `CR.3/frobenius-map`, `CR.3/proper-perfectness`, `CR.3/derived-base-change`, `CR.1/isocrystal`, `CR.3:Frobenius-isogeny/inseparable-control`.

**Sources:** [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.26, Theorem 60.26.4 (tag 07N5) and its proof; Definition 60.26.2 (tag 07N3); Remark 60.26.3 (tag 07N4). The statement is the theorem with its hypotheses. The proof in the source cites Remarks 60.24.9 and 60.24.13, which are stated there with hints only; here they are CR.3/derived-base-change and CR.3/proper-perfectness.

**Acceptance.**

- For P¹ over a perfect field k: the linearised Frobenius is 1 on H⁰=W and p on H²=W·h; it is an isomorphism only after inverting p.
- Nondegeneracy cannot be dropped: for X=Spec k and the F-crystal (O_crys,Φ=0) the map F_K is zero on K=W(k).

## CR.3:duality — Trace and Poincaré duality

**Targets.** Proper smooth crystalline trace, Derived crystalline Poincaré duality, Proper smooth crystalline Gysin maps, Diagonal class and crystalline coevaluation.

### trace — Proper smooth crystalline trace

**Construction:** `TauCeti.Crystalline.crysTrace`. Let k be a perfect field of characteristic p, W_n=W_n(k), X a proper smooth k-scheme of pure dimension d, W_nX the scheme (|X|,W_nO_X) and f_n:W_nX→Spec W_n its structure map; f_n^! denotes the exceptional inverse image of coherent duality. (1) The complex f_n^!W_n is concentrated in degree −d, and there is a unique map of W_nO_X-modules Tr^Ek:W_nΩ^d_X→f_n^!W_n[−d] which, on every open U⊂X with a smooth lift U′ over W_n, is the composite of the isomorphism θ:W_nΩ^d_U≅σ^n_*H^d(Ω^•_(U′/W_n)) with the map induced by the coherent trace isomorphism Ω^d_(U′/W_n)≅f′^!W_n[−d] of f′:U′→Spec W_n. It is an isomorphism and is compatible with étale maps. (2) Through Ru_*O_crys≅W_nΩ^•_X (CR.4/crystalline-comparison), the isomorphism C^(−n):W_nΩ^d_X≅H^d(W_nΩ^•_X) and adjunction for the proper map f_n, it induces Tr^Ek_(X,n):RΓ_crys(X/W_n)→W_n[−2d], equivalently a W_n-linear map H^(2d)_crys(X/W_n)→W_n. These maps are compatible with reduction from W_n to W_(n−1), and Tr^Ek_(X,1):H^(2d)_dR(X/k)=H^d(X,Ω^d_X)→k is the trace of coherent duality. (3) Normalisation. For X=P^d, Tr^Ek_(X,n) sends to 1 the class [ω] of the Čech d-cocycle ω=dlog[t₁]∧…∧dlog[t_d] of the standard covering, [t_i]∈W_nO the Teichmüller representative of the coordinate t_i; and h^d=ε_d·[ω] in H^(2d)_crys(P^d/W_n) for a sign ε_d∈{1,−1} which depends only on d and on the sign conventions for products of Čech cochains. The crystalline trace is Tr_(X,n)=ε_d·Tr^Ek_(X,n), and Tr_X=Rlim_n Tr_(X,n):RΓ_crys(X/W)→W[−2d]; thus Tr_(P^d)(h^d)=1.

**Hypotheses and conventions.**

- k is a perfect field of characteristic p; X is a proper smooth k-scheme of pure dimension d. (For (1), X smooth of pure dimension d suffices.)
- f_n^! is the functor of coherent duality (Hartshorne, Residues and Duality) for the finite-type morphism f_n:W_nX→Spec W_n(k).
- h=c₁(O(1))∈H²_crys(P^d/W_n) is the hyperplane class of CR.3/first-chern-class and h^d its d-th power for the cup product of CR.3/cup-product.

**API.**

- `TauCeti.Crystalline.crysTrace_projective` (simp): Tr_(P^d)(h^d)=1 in W(k), for h=c₁(O(1)) and every d≥0; the same holds over W_n(k).
- `TauCeti.Crystalline.crysTrace_reduction` (compatibility): Tr_X⊗^L_W W_n=Tr_(X,n) under RΓ_crys(X/W)⊗^L_W W_n≅RΓ_crys(X/W_n), and Tr_(X,1):H^d(X,Ω^d_X)→k is ε_d times the trace of coherent duality.
- `TauCeti.Crystalline.crysTrace_etale_local` (functoriality): For an étale morphism g:U→X of smooth k-schemes of pure dimension d, g^*(Tr^Ek_X)=Tr^Ek_U under the identifications g^*W_nΩ^d_X≅W_nΩ^d_U and g^*f_(X,n)^!W_n≅f_(U,n)^!W_n (Ekedahl I, (2.11)).
- `TauCeti.Crystalline.crysTrace_iso` (characterisation): Tr^Ek:W_nΩ^d_X→f_n^!W_n[−d] is an isomorphism of W_nO_X-modules, for X smooth of pure dimension d over k (Ekedahl I, Theorem 4.1).
- `TauCeti.Crystalline.crysTrace_ekedahl` (compatibility): Tr_(X,n)=ε_d·Tr^Ek_(X,n), where Tr^Ek is induced by Ekedahl's map (2.11), Tr^Ek_(P^d,n)([ω])=1 for the Čech class [ω] of dlog[t₁]∧…∧dlog[t_d], and ε_d∈{1,−1} is defined by h^d=ε_d·[ω].
- `TauCeti.Crystalline.crysTrace_frobenius` (relation): Tr_X(F(x))=p^d·σ(Tr_X(x)) for x∈H^(2d)_crys(X/W), F the semilinear Frobenius of CR.3/frobenius-map and σ the Frobenius of W(k); equivalently Tr_X is a map RΓ_crys(X/W)→W(−d)[−2d] compatible with Frobenius, W(−d) being W with Frobenius p^d·σ.
- `TauCeti.Crystalline.crysTrace_product` (compatibility): For proper smooth X,Y of pure dimensions d,e over k, under derived Künneth K(X×Y)≅K(X)⊗^L_W K(Y), Tr_(X×Y)=Tr_X⊗^L Tr_Y as morphisms to W[−2(d+e)], with the canonical shift and Koszul symmetry identifications. This holds at finite W_n levels and commutes with reduction. In particular Tr_(X×Y)(pr₁^*x∪pr₂^*y)=Tr_X(x)Tr_Y(y) for x,y of top degree.

**Unit tests.**

- `TauCeti.Crystalline.test_crysTrace_point` (degenerate): For X=Spec k (d=0): Tr_X is the identity of W(k)=H⁰_crys(Spec k/W(k)).
- `TauCeti.Crystalline.test_crysTrace_P1` (computation): For P¹ over k: Tr(h)=1 for h=c₁(O(1))∈H²_crys(P¹/W(k)).
- `TauCeti.Crystalline.test_crysTrace_finite_extension` (computation): For X=Spec k′ with k′/k a finite extension (d=0): Tr_X:W(k′)→W(k) is the trace of the finite étale W(k)-algebra W(k′).

**Uses.** Ekedahl I.5 and II2.2; CohomologyComparisons:CP.6: Normalizes the proper smooth trace by the projective-space class, and supplies the trace morphism that turns cup product into derived Poincaré duality. CR.3:duality/diagonal: The derived product identity identifies the tensor product evaluation with the pairing on X×X, so the diagonal is coevaluation even when integral cohomology has torsion.

**Construction or proof.**

1. Local construction (Ekedahl I, (2.3)–(2.7)): for a smooth lift U′/W_n, θ:W_nΩ^•_U≅σ^n_*H^•(Ω^•_(U′/W_n)); the map ε from U′ to the scheme (|U|,H⁰(Ω^•_(U′/W_n))) is finite; the coherent trace Ω^d_(U′/W_n)≅f′^!W_n[−d], duality for the finite map θε and W_n≅(σ^n)^!W_n give (θε)_*Ω^d_(U′/W_n)→f_n^!W_n[−d], which vanishes on d((θε)_*Ω^(d−1)_(U′/W_n)): by étale localisation and adjunction this reduces to P^d, where R^df′_*Ω^(d−1)=0.
2. Independence of the lift and compatibility with étale maps (Ekedahl I, (2.8)–(2.11)); since f_n^!W_n[−d] is a sheaf, the local maps glue to Tr^Ek.
3. Tr^Ek is an isomorphism (Ekedahl I, Theorem 4.1): induction on n along 0→j_*W_(n−1)Ω^d→W_nΩ^d→(jF^(n−1))_*Ω^d→0 and the dual sequence, using the compatibility of Tr^Ek with p (Lemma 3.3) and with F (Lemma 3.4) and the case n=1.
4. Tr^Ek([ω])=1 on P^d (Ekedahl I, Lemma 3.2): the composite H^d(P^d_(W_n),Ω^d)→H^d(P^d,W_nΩ^d)→W_n is the coherent trace, the cocycle dt′₁∧…∧dt′_d/(t′₁⋯t′_d) has trace 1 and maps to ω, because C^n fixes dlog[t].
5. Global trace and reduction (Ekedahl I.5): RΓ_crys(X/W_n)≅RΓ(X,W_nΩ^•)→RΓ(X,H^d(W_nΩ^•))[−d]≅RΓ(X,W_nΩ^d)[−d]→RΓ(X,f_n^!W_n)[−2d]→W_n[−2d], the last map by adjunction for the proper map f_n; compatibility with reduction and the identification of Tr^Ek_(X,1) with the de Rham trace follow from Lemma 3.4 and the proof of Theorem 4.1.
6. Sign: h^d and [ω] are both bases of H^(2d)_crys(P^d/W_n)≅W_n, and the Čech cocycle of the d-th power of the Hodge class of O(1) is ±dlog t₁∧…∧dlog t_d on U₀∩…∩U_d; hence h^d=ε_d·[ω] with ε_d=±1.
7. Frobenius: under RΓ_crys(X/W_n)≅RΓ(X,W_nΩ^•_X) the crystalline Frobenius of CR.3/frobenius-map is p^q·F in degree q (CR.4/degree-scaled-frobenius), so on H^d(X,W_nΩ^d_X) it is p^d·F; and Tr^Ek carries F:W_nΩ^d_X→W_(n−1)Ω^d_X to the map m of Ekedahl I, (3.4.1), on dualizing complexes lying over the Frobenius W_n(k)→W_(n−1)(k) (Ekedahl I, Lemma 3.4). In the limit over n this gives Tr_X(F(x))=p^d·σ(Tr_X(x)).
8. For product compatibility, compare the local construction with the external product of coherent dualizing complexes and their counits, using the requested SF.2 product-duality coherence. Carry this equality through the de Rham–Witt comparison and the Künneth totalization. Check the Čech product and shift signs together with ε_d, ε_e and ε_(d+e), so the hyperplane-normalized traces satisfy the derived product identity. This exact sign and residue comparison is recorded as a gap; Ekedahl I.5 alone does not assert it.

**Depends on:** `CR.4/crystalline-comparison`, `CR.3/frobenius-map`, `CR.4/degree-scaled-frobenius`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `SchemeAndStackFoundations:key/coherent-duality`, `SchemeAndStackFoundations:SF.2/smooth-proper`, `SchemeAndStackFoundations:SF.2/trace`, `SchemeAndStackFoundations:SF.2/finite-formula`, `SchemeAndStackFoundations:SF.2/composition`, `SchemeAndStackFoundations:SF.2`, `CR.3/top-coherent-differential`.

**Sources:** [ekedahl](https://archive.ymsc.tsinghua.edu.cn/pacm_download/116/7414-11512_2006_Article_BF02384380.pdf), Chapter I, pp. 192–198: I.2 with (2.7) and (2.11); Lemmas 3.2, 3.3, 3.4; Theorem 4.1; I.5. The node takes the construction of the trace W_nΩ^N→f_n^!W_n[−N] ((2.11)), its normalisation Tr ω=1 on projective space (Lemma 3.2), that it is an isomorphism (Theorem 4.1), and the induced trace on H^(2N)(X/W_n) with its reduction modulo p (I.5). The sign ε_d relating ω to the d-th power of the hyperplane class, and the limit over n, are added here. The agreement with Berthelot's trace, sketched in I.5 from results of LNM 407 VI–VII, is not part of the node.

**Acceptance.**

- On P^d: Tr(h^d)=1, and Tr^Ek([ω])=1 for the Čech class of dlog[t₁]∧…∧dlog[t_d] (Ekedahl I, Lemma 3.2).
- For X=Spec k: Tr is the identity of W(k).
- Tr_X(F(x))=p^d·σ(Tr_X(x)); on P^d this is F(h^d)=p^d·h^d.

### poincare-pairing — Derived crystalline Poincaré duality

**Theorem:** `TauCeti.Crystalline.crysPoincareDuality`. Let k be a perfect field of characteristic p, W=W(k), X a proper smooth k-scheme of pure dimension d and E a finite locally free crystal on X/W with dual E^∨; write K(E)=RΓ_crys(X/W,E). The pairing K(E)⊗^L_W K(E^∨)→K(E⊗E^∨)→K(O_crys)→W[−2d], composed of the cup product, the evaluation E⊗E^∨→O_crys and Tr_X, is perfect: its adjoint K(E)→RHom_W(K(E^∨),W)[−2d] is an isomorphism in D(W). The same holds over W_n(k) with Tr_(X,n), compatibly with ⊗^L_W W_n. For E=O_crys and H^i=H^i_crys(X/W): H^i[1/p]⊗H^(2d−i)[1/p]→W[1/p] is a perfect pairing of W[1/p]-vector spaces, (H^i/tors)⊗_W(H^(2d−i)/tors)→W is a perfect pairing, and H^i_tors≅Hom_W(H^(2d−i+1)_tors,W[1/p]/W).

**Hypotheses and conventions.**

- k is a perfect field of characteristic p; W=W(k); X is a proper smooth k-scheme of pure dimension d.
- E is a crystal in finite locally free O_crys-modules on X/W and E^∨ its dual crystal, with evaluation E⊗E^∨→O_crys (CR.1/crystal).
- Tr_X and Tr_(X,n) are the traces of CR.3:duality/trace.

**Construction or proof.**

1. Source and target of the adjoint map are perfect complexes of W-modules (CR.3/proper-perfectness), hence derived p-complete; by derived Nakayama it suffices to prove that it is an isomorphism after ⊗^L_W k.
2. By CR.3/proper-perfectness (3), CR.2/smooth-lift-filtration, the de Rham description of the cup product and the identification of Tr_(X,1) with ε_d times the coherent trace (CR.3:duality/trace), the map becomes RΓ_dR(X,(E_X,∇))→RHom_k(RΓ_dR(X,(E_X^∨,∇^∨)),k)[−2d], induced by the wedge product, the evaluation and the trace t:H^d(X,Ω^d_X)→k.
3. The trace t vanishes on the image of d:H^d(X,Ω^(d−1)_X)→H^d(X,Ω^d_X), so it is defined on H^(2d)_dR(X/k). The forms of degree ≥j pair to zero with the forms of degree ≥d−j+1, so the adjoint map is compatible with the filtrations by form degree, and on the j-th graded piece it is Serre duality RΓ(X,E_X⊗Ω^j_X)≅RHom_k(RΓ(X,E_X^∨⊗Ω^(d−j)_X),k)[−d], since (E_X⊗Ω^j)^∨⊗Ω^d≅E_X^∨⊗Ω^(d−j).
4. The statement over W_n follows by ⊗^L_W W_n. The statements on the groups H^i follow from 0→Ext¹_W(H^(2d−i+1),W)→H^i(RHom_W(K,W)[−2d])→Hom_W(H^(2d−i),W)→0 and Ext¹_W(T,W)≅Hom_W(T,W[1/p]/W) for a torsion module T of finite length.

**Depends on:** `CR.3:duality/trace`, `CR.1/crystal`, `CR.3/proper-perfectness`, `CR.3/cup-product`, `CR.2/smooth-lift-filtration`, `DerivedDeRhamCohomology:DD.1/derived-completion`, `DerivedDeRhamCohomology:DD.1/completion-exchanges`, `SchemeAndStackFoundations:SF.2/serre-proper`, `SchemeAndStackFoundations:SF.2/smooth-proper`, `SchemeAndStackFoundations:SF.2/trace`, `SchemeAndStackFoundations:SF.2/perfect-generator`, `CR.3/top-coherent-differential`, `SchemeAndStackFoundations:SF.2`.

**Sources:** [ekedahl](https://archive.ymsc.tsinghua.edu.cn/pacm_download/116/7414-11512_2006_Article_BF02384380.pdf), Introduction, p. 186 (the crystalline duality formula); I.5, p. 198; II, Theorem 2.2 (p. 199) and Corollary 2.2.23 (p. 203). The source states the crystalline duality formula with trivial coefficients (p. 186) and says in I.5 that duality for RΓ(X/W_n) follows from Tr_n/p=Tr_1 and de Rham duality; Theorem II.2.2 and Corollary II.2.2.23 prove the finer duality of the sheaves W_nΩ^i and of Hodge–Witt cohomology. Coefficients in a finite locally free crystal and the passage to the limit over n are deduced here by the same reduction modulo p; they are not in the source.; [stacks-derham](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/derham.tex), de Rham Cohomology, Proposition 0FW7 (Poincaré duality), with Lemmas 0FW5 and 0FW6. Poincaré duality for de Rham cohomology with trivial coefficients over a field, to which the proof reduces the statement modulo p. Coefficients, the integral statement and the torsion pairing are not in this source.

**Acceptance.**

- For P^d: ⟨h^i,h^(d−i)⟩=Tr(h^d)=1, so H^(2i) and H^(2d−2i) are dual with dual bases h^i, h^(d−i).
- For a geometrically connected smooth proper curve C: H¹_crys(C/W) is torsion-free, hence H²_tors≅Hom_W(H¹_tors,W[1/p]/W)=0 and H²≅Hom_W(H⁰,W)=W; the pairing on H¹ is alternating and perfect.
- For the surface H_k of BMS1 Theorem 2.10 (d=2): H³_crys(H_k/W)_tors≅Hom_W(k⊕k,W[1/p]/W)≅k⊕k, and the pairing H²×H²→W vanishes on H²_tors.

### finite-etale-transfer — Finite étale crystalline transfer and trace

**Construction:** `TauCeti.Crystalline.finite_etale_transfer`. For a finite étale map g:Y→X of constant degree m between smooth proper pure d-dimensional schemes over a perfect field k, the trace of the finite locally free algebra on each PD thickening defines tr_g:Rg_crys,*O_(Y/W)→O_(X/W). It induces g_!:RΓ_crys(Y/W)→RΓ_crys(X/W), satisfying g_!g^*=m·id, the projection formula g_!(g^*a∪b)=a∪g_!b, composition, and Tr_X g_!=Tr_Y. This transfer agrees with the degree-zero-shift Gysin map defined by duality.

**Hypotheses and conventions.**

- g finite étale of constant degree m; X,Y smooth proper of the same pure dimension; W=W(k), k perfect.

**API.**

- `TauCeti.Crystalline.finiteEtaleTransfer_scalar` (relation): g_!g^*=m·id on RΓ_crys(X/W).
- `TauCeti.Crystalline.finiteEtaleTransfer_projection` (compatibility): g_!(g^*a∪b)=a∪g_!b.
- `TauCeti.Crystalline.finiteEtaleTransfer_trace` (compatibility): Tr_X∘g_!=Tr_Y, and transfer composes for finite étale maps.

**Unit tests.**

- `TauCeti.Crystalline.test_finiteEtaleTransfer_identity` (degenerate): The identity cover has transfer id.
- `TauCeti.Crystalline.test_finiteEtaleTransfer_split` (computation): For Y=⊔_(i=1)^mX the transfer is the sum of the m coordinates and g_!g^*=m.
- `TauCeti.Crystalline.test_finiteEtaleTransfer_field` (compatibility): For Spec F_(p^r)→Spec F_p transfer in degree zero is the trace W(F_(p^r))→Z_p and sends 1 to r.

**Uses.** CR.3:duality/gysin: Supplies the finite étale test and the functorial trace law explicitly.

**Construction or proof.**

1. Finite étale maps lift uniquely across nil PD thickenings. On every affine thickening use the ordinary finite-locally-free algebra trace, which commutes with base change and restricts to m on scalars. Descent gives tr_g and its projection formula.
2. For the trace identity compare finite-level de Rham resolutions: finite étale Ω_Y=g^*Ω_X, and the algebra trace on each degree commutes with d. Transitivity of coherent-duality counits identifies the top trace. Pass to Rlim over W_n.
3. Pair the projection formula with Tr_X. The identity Tr_Xg_!=Tr_Y characterizes the duality-defined Gysin map by its adjoint pairing, proving agreement.

**Depends on:** `CR.1/etale-crystalline-site`, `CR.1/etale-crystal-comparison`, `CR.3:duality/trace`, `CR.3:duality/poincare-pairing`, `SchemeAndStackFoundations:SF.2/trace`.

**Sources:** [ekedahl](https://archive.ymsc.tsinghua.edu.cn/pacm_download/116/7414-11512_2006_Article_BF02384380.pdf), Chapter I, §2, equations (2.5)–(2.11), pp. 192–194 (étale naturality of the dualizing trace); §5, p. 198 (crystalline trace from adjunction). The dualizing trace is natural under étale maps. Its crystalline realization and coherent-duality counit supply the trace comparison used to identify finite étale transfer with Gysin.; [stacks-crys](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.8, Definition 60.8.4; §60.17–60.21, crystal evaluation and de Rham comparison. Lifting finite étale thickenings and computing the transfer on the de Rham resolution.

**Acceptance.**

- The statement requires constant degree; for a disconnected base it is componentwise.

### gysin — Proper smooth crystalline Gysin maps

**Construction:** `TauCeti.Crystalline.crysGysin`. Let k be a perfect field of characteristic p, W=W(k), and f:X→Y a morphism of proper smooth k-schemes of pure dimensions d_X and d_Y; write K(X)=RΓ_crys(X/W). (1) The Gysin map f_*:K(X)→K(Y)[2(d_Y−d_X)] is the transpose of f^*:K(Y)→K(X) under the duality isomorphisms of CR.3:duality/poincare-pairing: K(X)≅RHom_W(K(X),W)[−2d_X]→RHom_W(K(Y),W)[−2d_X]≅K(Y)[2(d_Y−d_X)]. It satisfies Tr_Y(f_*x∪y)=Tr_X(x∪f^*y) for x∈H^i_crys(X/W), y∈H^(2d_X−i)_crys(Y/W). (2) Projection formula: f_*(x∪f^*y)=f_*x∪y. (3) For a second morphism g:Y→Z of proper smooth k-schemes of pure dimension, (g∘f)_*=g_*∘f_*. (4) For the structure map a:X→Spec k, a_*=Tr_X. (5) For a closed immersion f the class of X in Y is cl_Y(X)=f_*(1)∈H^(2(d_Y−d_X))_crys(Y/W).

**Hypotheses and conventions.**

- k is a perfect field of characteristic p; W=W(k).
- X, Y (and Z) are proper smooth k-schemes of pure dimensions d_X, d_Y (and d_Z); f:X→Y (and g:Y→Z) are morphisms of k-schemes.

**API.**

- `TauCeti.Crystalline.crysGysin_comp` (functoriality): (g∘f)_*=g_*∘f_* with the corresponding summed dimension shifts.
- `TauCeti.Crystalline.crysGysin_projection` (relation): As morphisms K(X)⊗^L_W K(Y)→K(Y)[2(d_Y−d_X)], f_*∘μ_X∘(id⊗f^*)=μ_Y∘(f_*⊗id), using the even dimension shift. Hence f_*(x·f^*y)=f_*x·y on cohomology; no torsion-free hypothesis is imposed.
- `TauCeti.Crystalline.crysGysin_trace` (compatibility): For the structural map X→Spec k, f_*=Tr_X.
- `TauCeti.Crystalline.crysGysin_adjoint` (characterisation): Tr_Y(f_*x∪y)=Tr_X(x∪f^*y) for x∈H^i_crys(X/W) and y∈H^(2d_X−i)_crys(Y/W); on complexes, f_* is the transpose of f^* under the duality isomorphisms.
- `TauCeti.Crystalline.crysGysin_frobenius` (compatibility): p^(d_Y)·f_*(F_X x)=p^(d_X)·F_Y(f_*x) in H^*_crys(Y/W)[1/p] for x∈H^*_crys(X/W)[1/p]; for a closed immersion of codimension c, F_Y(f_*x)=p^c·f_*(F_X x).

**Unit tests.**

- `TauCeti.Crystalline.test_crysGysin_identity` (degenerate): For id_X, pushforward is the identity.
- `TauCeti.Crystalline.test_crysGysin_hyperplane` (computation): For a hyperplane i:P^(d−1)→P^d over k: i_*(1)=h and i_*(h^j)=h^(j+1) for 0≤j≤d−1, h=c₁(O(1)).
- `TauCeti.Crystalline.test_crysGysin_shift` (computation): For the structure map a:P^d→Spec k: a_*(h^d)=1 in W=H⁰_crys(Spec k/W) and a_*(h^j)=0 for j<d; the target of a_* is K(Spec k)[−2d]=W[−2d].
- `TauCeti.Crystalline.test_crysGysin_finite_etale` (computation): For π:X′→X finite étale of constant degree n between proper smooth k-schemes of pure dimension d: π_*(1)=n in H⁰_crys(X/W) and π_*π^*x=n·x.

**Uses.** CR.3:duality/diagonal: The class of the diagonal is Δ_*(1). CohomologyComparisons:CP.6: Trace and Gysin operations are exported there for comparison with the étale and de Rham ones.

**Construction or proof.**

1. Define f_* by transposition through the isomorphisms K(X)≅RHom_W(K(X),W)[−2d_X] and K(Y)≅RHom_W(K(Y),W)[−2d_Y] of CR.3:duality/poincare-pairing; the adjunction formula Tr_Y(f_*x∪y)=Tr_X(x∪f^*y) is the definition read on cohomology.
2. Prove the projection formula as equality of morphisms K(X)⊗^L K(Y)→K(Y)[2(d_Y−d_X)]. Compose both candidates with the adjoint duality isomorphism for K(Y), and use the tensor–internal-Hom adjunction. Their adjoints are the same morphism on K(X)⊗^L K(Y)⊗^L K(Y): associativity of cup product and multiplicativity of f^* identify both with Tr_X∘μ_X∘(id⊗f^*∘μ_Y), with the prescribed shifts and symmetry signs. Duality therefore identifies the morphisms, including integral torsion. The class formula follows on cohomology. Composition follows by contravariant transposition of (g∘f)^*=f^*∘g^*; transposition of the unit W→K(X) gives Tr_X.

**Depends on:** `CR.3:duality/poincare-pairing`, `CR.3:duality/trace`, `CR.3/cup-product`, `CR.3/first-chern-class`, `CR.3/frobenius-map`, `CR.3:duality/finite-etale-transfer`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Sources:** [ekedahl](https://archive.ymsc.tsinghua.edu.cn/pacm_download/116/7414-11512_2006_Article_BF02384380.pdf), Introduction, p. 186: the crystalline duality formula RHom_W(RΓ(X/W),W)[−2N]≅RΓ(X/W); I.5, p. 198, for the characterisation of a trace by local residues. The source gives the duality through which the Gysin map is defined as a transpose. It does not construct Gysin maps; the projection formula and functoriality are formal consequences of the definition (proved from the same definition in Stacks, Weil Cohomology Theories, Lemma 0FGT).; [stacks-weil](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/weil.tex), Weil Cohomology Theories, Lemma 0FGT (pushforward defined by Poincaré duality). The field-valued transpose argument motivates (2) and (3). Here it is carried out by tensor–internal-Hom adjunction as equality of derived morphisms. Ordinary cohomological trace evaluations do not suffice to detect equality in the presence of integral torsion.

**Acceptance.**

- For a hyperplane i:P^(d−1)→P^d: i_*(h^j)=h^(j+1) for 0≤j≤d−1.
- For π:X′→X finite étale of constant degree n: π_*π^*x=n·x.
- For the structure map a:X→Spec k: a_*=Tr_X.

### diagonal — Diagonal class and crystalline coevaluation

**Construction:** `TauCeti.Crystalline.crysDiagonal`. Let k be a perfect field of characteristic p, W=W(k), X a proper smooth k-scheme of pure dimension d, K=RΓ_crys(X/W) and Δ:X→X×_kX the diagonal. (1) [Δ_X]=Δ_*(1)∈H^(2d)_crys(X×X/W), Δ_* the Gysin map of CR.3:duality/gysin. (2) The correspondence [Δ_X] acts as the identity: pr_(2*)([Δ_X]∪pr₁^*x)=x for x∈H^*_crys(X/W). (3) Under the Künneth isomorphism K⊗^L_W K≅RΓ_crys(X×X/W), [Δ_X] is the coevaluation coev:W→(K⊗^L_W K)[2d] for the evaluation ev:K⊗^L_W K→W[−2d], ev(x⊗y)=Tr_X(x∪y): the composites (ev⊗id)∘(id⊗coev) and (id⊗ev)∘(coev⊗id) are the identity of K. (4) If the H^i=H^i_crys(X/W) are free with bases e_(i,j), then [Δ_X]=Σ_(i,j)e_(i,j)⊗e′_(2d−i,j) with e′_(2d−i,j)∈H^(2d−i) determined by Tr_X(e_(i,j)∪e′_(2d−i,j′))=(−1)^i·δ_(jj′). (5) For P^d: [Δ]=Σ_(i=0)^d h₁^i∪h₂^(d−i), h_a=pr_a^*h. The same holds over W_n(k), compatibly with reduction.

**Hypotheses and conventions.**

- k is a perfect field of characteristic p; W=W(k); X is a proper smooth k-scheme of pure dimension d.
- In (4) the W-modules H^i_crys(X/W) are free; in general the formula holds in H^*_crys(X×X/W)[1/p].

**API.**

- `TauCeti.Crystalline.crysDiagonal_action` (characterisation): The diagonal correspondence acts as id_K.
- `TauCeti.Crystalline.crysDiagonal_triangles` (relation): Evaluation and coevaluation satisfy both triangular identities.
- `TauCeti.Crystalline.crysDiagonal_projective` (example): On P^d, [Δ]=Σh₁^i h₂^(d−i).

**Unit tests.**

- `TauCeti.Crystalline.test_crysDiagonal_point` (degenerate): For the point the diagonal class and coevaluation are 1.
- `TauCeti.Crystalline.test_crysDiagonal_P1` (computation): For P¹, [Δ]=h₁+h₂.
- `TauCeti.Crystalline.test_crysDiagonal_curve` (computation): For a geometrically connected smooth proper curve C of genus g over k, with pt∈H²_crys(C/W) of trace 1 and a basis a₁,…,a_g,b₁,…,b_g of H¹_crys(C/W) with Tr(a_i∪b_j)=δ_ij and Tr(a_i∪a_j)=0=Tr(b_i∪b_j): [Δ_C]=pt⊗1+1⊗pt+Σ_i(b_i⊗a_i−a_i⊗b_i).
- `TauCeti.Crystalline.test_crysDiagonal_euler` (computation): Tr_(X×X)([Δ_X]∪[Δ_X])=Σ_i(−1)^i·rank_W H^i_crys(X/W); this is d+1 for P^d and 2−2g for a curve of genus g.

**Uses.** Stacks, Weil Cohomology Theories, Lemmas 0FGZ and 0FH0: The Künneth components of the class of the diagonal are the dual bases up to the sign (−1)^i; its self-intersection is the Euler characteristic. CohomologyComparisons:CP.6: Duals and trace and Gysin operations are exported there; the class of the diagonal gives the evaluation and coevaluation of the duality.

**Construction or proof.**

1. [Δ_X]=Δ_*(1). By the projection formula and (pr₂∘Δ)_*=id: pr_(2*)([Δ_X]∪pr₁^*x)=pr_(2*)Δ_*(Δ^*pr₁^*x)=x.
2. Under derived Künneth, Δ^* is μ:K⊗^L K→K. Gysin transposes this morphism using the Poincaré dualities of X and X×X. The product-trace contract in CR.3:duality/trace identifies the latter duality with the tensor product duality, with Koszul symmetries. Thus Δ_*(1) is the transpose of multiplication applied to the unit, namely the coevaluation for ev=Tr_X∘μ. The duality triangle identities prove both identity correspondences as morphisms in D(W), including Tor contributions; no decomposition of an arbitrary integral Künneth class into pure cohomology tensors is used.
3. When every H^i(K) is free, the Tor terms vanish and derived Künneth on cohomology becomes the direct sum of tensor products. Read the coevaluation in dual bases; interchanging degrees i and 2d−i gives (−1)^i. This proves (4), and the hyperplane basis with Tr(h^d)=1 gives (5). After inverting p the same argument applies over the field W[1/p].

**Depends on:** `CR.3:duality/gysin`, `CR.3:duality/poincare-pairing`, `CR.3/kunneth`, `CR.3/cup-product`, `CR.3:duality/trace`, `CR.3/first-chern-class`, `SchemeAndStackFoundations:SF.2`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Sources:** [ekedahl](https://archive.ymsc.tsinghua.edu.cn/pacm_download/116/7414-11512_2006_Article_BF02384380.pdf), Introduction, p. 186: the crystalline duality formula. The source states the duality from which the node is deduced; it does not mention the diagonal. The formula for the class of the diagonal and its sign are those of Stacks, Weil Cohomology Theories, Lemma 0FGZ, the second source of this node.; [stacks-weil](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/weil.tex), Weil Cohomology Theories, Lemma 0FGZ (class of the diagonal), and Lemma 0FH0. The formula of part (4) with its sign, in the setting of a Weil cohomology theory with coefficients in a field; the node states it for free crystalline cohomology groups over W, where the same computation applies.

**Acceptance.**

- For P^d: [Δ]=Σ_(i=0)^d h₁^i∪h₂^(d−i), and Tr_(P^d×P^d)([Δ]∪[Δ])=d+1.
- For every X: pr_(2*)([Δ_X]∪pr₁^*x)=x.

## CR.4 — Ordinary and relative de Rham–Witt complexes

**Targets.** Dieudonné complexes, Universal saturated de Rham–Witt complex, Initial relative de Rham–Witt complex, Finite and infinite crystalline de Rham–Witt comparison, Strict Dieudonné complexes as décalage fixed points, Nygaard filtration and divided Frobenius.

### semistable-log-witt-models — Semistable logarithmic Witt models

**Construction:** `TauCeti.Crystalline.LogWittModel`. Let κ be a perfect field of characteristic p, W=W(κ), K₀=W[1/p]. Let W[t]° be Spec W[t] with the log structure associated with 1↦t, W° its fibre at t=0, κ° the fibre of W° at p=0 (the standard log point), and W^triv=Spec W with the trivial log structure. Let (X,L) be a log scheme of finite type and strictly semistable over κ°, and {(X^⋆,L^⋆)↪(Z^⋆,N^⋆)} an admissible embedding system for (X,L)/W[t]°; put (Y^⋆,M^⋆)=(Z^⋆,N^⋆)×_(W[t]°)W°, and for l≥1 let D_l^⋆ be the PD envelope of X^⋆ in Y_l^⋆=Y^⋆⊗Z/p^l, over W with its usual divided powers. Define, in D⁺(X_ét,W_•) (systems indexed by l), Wω_X=Ru_*(Ω^*_((Y^⋆,M^⋆)/W°)⊗O_(D_l^⋆)) and Wω̃_X=Ru_*(Ω^*_((Z^⋆,N^⋆)/W^triv)⊗O_(D_l^⋆)), where u:X^⋆→X is the augmentation of the hypercovering. They do not depend on the embedding system. After applying Rlim_l and ⊗_W K₀ there is a distinguished triangle Wω_(X,K₀)[−1]→Wω̃_(X,K₀)→Wω_(X,K₀)--N→Wω_(X,K₀) in D⁺(X_ét,K₀), whose first map is ∧dlog t, whose second map is the natural projection, and whose third map N is the connecting map. The convergent complexes ω_X, ω̃_X∈D⁺(X_ét,K₀) of Disegni–Liu (the same differential forms with the tube of X^⋆ in place of the PD envelopes) are related to them by natural equivalences ω_X≃Wω_(X,K₀), ω̃_X≃Wω̃_(X,K₀), under which the triangle (B.1) of Disegni–Liu corresponds to this one.

**Hypotheses and conventions.**

- κ is a perfect field of characteristic p (in Disegni–Liu the residue field of a finite extension of Q_p); W=W(κ), K₀=W[1/p].
- (X,L) is a fine log scheme of finite type over κ°, strictly semistable over κ°; the embedding system is admissible in the sense of Disegni–Liu §B.1: among the conditions, (X⁰,M⁰)≅(Z⁰,N⁰)×_(W[t]°)κ°, Z⁰ is flat over W[t] and smooth over W, and N⁰ is the log structure defined by the relative strict normal crossings divisor Y⁰=Z⁰⊗_(W[t])W.
- The triangle and the comparison with ω_X, ω̃_X are statements in D⁺(X_ét,K₀), after Rlim over l and ⊗_W K₀.

**API.**

- `TauCeti.Crystalline.LogWittModel.envelope_eval` (data): For an admissible embedding system, Wω_X and Wω̃_X are represented by Ru_* of the complexes Ω^*_((Y^⋆,M^⋆)/W°)⊗O_(D_l^⋆) and Ω^*_((Z^⋆,N^⋆)/W^triv)⊗O_(D_l^⋆), l≥1, on the hypercovering X^⋆.
- `TauCeti.Crystalline.LogWittModel.embedding_independence` (equivalence): The product-embedding maps are compatible quasi-isomorphisms and satisfy the cocycle.
- `TauCeti.Crystalline.LogWittModel.rational_compare` (compatibility): There are natural equivalences ω_X≃Wω_(X,K₀) and ω̃_X≃Wω̃_(X,K₀) in D⁺(X_ét,K₀) (Disegni–Liu (B.5)) carrying the triangle (B.1) of the convergent complexes to the triangle (B.4); in particular they commute with the maps ∧dlog t.
- `TauCeti.Crystalline.LogWittModel.monodromy_triangle` (relation): Wω_(X,K₀)[−1]--∧dlog t→Wω̃_(X,K₀)→Wω_(X,K₀)--N→Wω_(X,K₀) is a distinguished triangle in D⁺(X_ét,K₀), and N is its connecting map (Disegni–Liu (B.4)).

**Unit tests.**

- `TauCeti.Crystalline.test_logWittModel_point` (degenerate): For X=κ° with the embedding κ°↪W[t]° (Z=Spec W[t], Y=W°, D_l=Spec W/p^l): Wω_X=(W/p^l)_l in degree 0, Wω̃_X=(W/p^l⊕W/p^l·dlog t)_l in degrees 0 and 1 with zero differential, and the connecting map N of the triangle is 0.
- `TauCeti.Crystalline.test_logWittModel_diagonal_embedding` (characterisation): For an admissible embedding system E of (X,L), the isomorphisms Wω_X(E)≅Wω_X(E) and Wω̃_X(E)≅Wω̃_X(E) obtained by comparing E with itself through the product system E×E and its two projections are the identity maps.
- `TauCeti.Crystalline.test_logWittModel_rational_scope` (computation): For X=κ° with the embedding κ°↪W[t]°: the tube of X in the generic fibre of the formal completion of Y=W° is the point Sp K₀, so ω_X=K₀ in degree 0 and ω̃_X=K₀⊕K₀·dlog t in degrees 0 and 1 with zero differential; Wω_(X,K₀) and Wω̃_(X,K₀) are the same complexes, and the equivalences of (B.5) are the identity maps.

**Uses.** Disegni–Liu AppendixB.2; CrystallineCohomology:CR.5 and CR.6: Forms the crystalline Witt models of the two embedding-system complexes and Sato’s coefficient complex. Log Poincaré/descent is imported from CR.5 and the monodromy operator belongs to CR.6.

**Construction or proof.**

1. Log schemes, log differentials, embedding systems and log PD envelopes are those of CR.5. The exact sequence of coherent sheaves 0→Ω^(q−1)_((Y^⋆,M^⋆)/W°)--∧dlog t→Ω^q_((Z^⋆,N^⋆)/W^triv)⊗O_(Y^⋆)→Ω^q_((Y^⋆,M^⋆)/W°)→0, compatible with differentials, tensored with O_(D_l^⋆), gives the triangle; N is its connecting map (Disegni–Liu (B.1), (B.4)).
2. Independence of the embedding system: compare two systems through their product. Disegni–Liu state this as well known and identify Wω_X with the modified de Rham–Witt complex of Hyodo and Hyodo–Kato and Wω̃_X with its variant.
3. Comparison with the convergent complexes: the canonical map from the structure sheaf of the formal completion of Y^⋆ along X^⋆ to Rlim_l O_(D_l^⋆) induces, after ⊗K₀, maps from the tube complexes to the PD-envelope complexes; they are equivalences because (X^⋆,L^⋆) is strictly semistable over κ° (Disegni–Liu (B.5), by an argument they attribute to their reference [4], §1.9).

**Depends on:** `CR.0/pd-envelope`, `CR.2/crystalline-cohomology`, `CrystallineCohomology:CR.5:log-algebra`, `CrystallineCohomology:CR.5`.

**Sources:** [dl](https://arxiv.org/pdf/2204.09239v3), Appendix B.1 (embedding systems and admissible embedding systems, pp.80–81) and B.2, from 'From now on, we assume that (X,L) is strictly semistable' to (B.5), pp.81–82. The PD-envelope complexes, their identification with the Hyodo–Kato complexes Wω_X and Wω̃_X (stated as well known), the triangle (B.4) and the equivalences (B.5) are as printed; the source gives no proof of the independence statements.

**Acceptance.**

- For X=κ° with the embedding κ°↪W[t]° (Z=Spec W[t], Y=W°, D_l=Spec W/p^l): Wω_X is (W/p^l)_l in degree 0, Wω̃_X is (W/p^l)_l in degrees 0 and 1 (basis 1 and dlog t) with zero differential, the first map of the triangle sends 1 to dlog t, and N=0.

### log-witt-proper-support — Witt comparison maps with proper support

**Construction:** `TauCeti.Crystalline.LogWittSupport`. In the situation of CR.4/semistable-log-witt-models let F:U→X be the inclusion of an open subscheme, and let ω̃_(U,X), ω⁺_(U,X)∈D⁺(X_ét,K₀) be the convergent complexes with support of Disegni–Liu, defined like ω̃_X and ω⁺_X with the tube functor f^!_(U^⋆,X^⋆) inserted (f^! is the kernel of the unit id→g_*g^* for the open immersion g of the tube of X^⋆∖U^⋆ into the tube of X^⋆). (1) There is a natural map F_!F^*Wω̃_(X,K₀)→ω̃_(U,X) in D⁺(X_ét,K₀) (Disegni–Liu (B.6)): F_!F^* applied to the inverse of the equivalence ω̃_X≃Wω̃_(X,K₀), followed by the natural transformation F_!∘F^*∘Rs_*→Rs_*∘f^! of their Lemma B.3. (2) Let WΞ_X∈D⁺(X_ét,W_•) be Sato's cohomological de Rham–Witt complex, with the equivalence ω⁺_X≃WΞ_(X,K₀). In the same way there is a natural map F_!F^*WΞ_(X,K₀)→ω⁺_(U,X) (Disegni–Liu (B.9)). (3) Assuming the correspondence between Sato’s map and the quotient map specified below, these two maps form a commutative square (Disegni–Liu (B.10)) with the map F_!F^*Wω̃_(X,K₀)→F_!F^*WΞ_(X,K₀)[−1] induced by Sato's map Wω̃_X→WΞ_X[−1] and the map ω̃_(U,X)→ω⁺_(U,X)[−1] induced by the quotient maps Ω^(q+1)_((Z^⋆,N^⋆)/W^triv)⊗O_(Y^⋆)→Ξ^q_(Z^⋆)=Ω^(q+1)_((Z^⋆,N^⋆)/W^triv)/Ω^(q+1)_(Z^⋆/W). The map ∧dlog t is the map ω_(U,X)[−1]→ω̃_(U,X) of Disegni–Liu (B.8); it does not occur in (B.10). For U=X the tube functor is the identity and the maps (1), (2) are the inverses of the comparison equivalences.

**Hypotheses and conventions.**

- (X,L) is strictly semistable of finite type over κ°, with an admissible embedding system as in CR.4/semistable-log-witt-models; U⊂X is an open subscheme with inclusion F.
- All objects and maps are in D⁺(X_ét,K₀): Rlim over l and ⊗_W K₀ are applied before F_!F^*.
- WΞ_X, the equivalence ω⁺_X≃WΞ_(X,K₀) and the map Wω̃_X→WΞ_X[−1] are those of Sato (Definition 8.3, Propositions 8.4, 8.10) as cited by Disegni–Liu.
- For (3) only: under the rational comparison equivalences, Sato’s map Wω̃_X→WΞ_X[−1] agrees with the map ω̃_X→ω⁺_X[−1] induced by the displayed quotient of differential forms. This compatibility is an input, not a conclusion established from Disegni–Liu alone.

**API.**

- `TauCeti.Crystalline.LogWittSupport.compare` (data): Natural maps F_!F^*Wω̃_(X,K₀)→ω̃_(U,X) and F_!F^*WΞ_(X,K₀)→ω⁺_(U,X) in D⁺(X_ét,K₀) (Disegni–Liu (B.6), (B.9)).
- `TauCeti.Crystalline.LogWittSupport.open_identity` (simp): For U=X, the tube support functor is the identity and the comparison recovers the full rational model comparison.
- `TauCeti.Crystalline.LogWittSupport.dlog_square` (compatibility): Under the compatibility hypothesis of clause (3), the maps (B.6) and (B.9) form the square (B.10), whose vertical arrows are the support comparison maps and whose horizontal arrows are induced respectively by Sato’s map and by the quotient of forms. Naturality of the tube support transformation proves the square.

**Unit tests.**

- `TauCeti.Crystalline.test_logWittSupport_empty` (degenerate): For U=∅: g is the identity of the tube of X^⋆, f^!_(∅,X)=ker(id→id)=0, so ω̃_(∅,X)=ω⁺_(∅,X)=0, and the sources F_!F^*(−) of (B.6) and (B.9) are 0.
- `TauCeti.Crystalline.test_logWittSupport_full` (compatibility): For U=X: the tube of X∖U is empty, f^!_(X,X) is the identity, ω̃_(X,X)=ω̃_X, and (B.6) is the inverse of the equivalence ω̃_X≃Wω̃_(X,K₀) of (B.5).
- `TauCeti.Crystalline.test_logWittSupport_map` (computation): Let X=X₁⊔X₂ be a disjoint union of two smooth points over κ°, with the standard semistable log structures, and U=X₁. The source and target of (B.6) restrict on X₁ to the full comparison and on X₂ to zero. The support map is the full comparison on X₁ and zero on X₂; replacing support by the full complex or by zero fails this test.

**Uses.** Disegni–Liu (B.6),(B.9),(B.10); CohomologyComparisons:CP.4: Supplies the actual natural maps from rational Witt objects with open support into convergent tube objects and their dlog compatibility diagram, preserving the source’s map shape and tube support functor.

**Construction or proof.**

1. Lemma B.3: the unit Rs_*→Rs_*∘g_*∘g^* factors through G_*∘G^*∘Rs_* for the closed immersion G:X∖U→X, so the square of Disegni–Liu Lemma B.3 commutes, which yields the natural transformation F_!∘F^*∘Rs_*→Rs_*∘f^!_(U,X).
2. (B.6): apply F_!F^* to the inverse of the equivalence (B.5) on the embedding system, then the transformation of step 1, then Ru_*; the target is ω̃_(U,X) by its definition. (B.9) is obtained in the same way from ω⁺_X≃WΞ_(X,K₀).
3. (B.10): its bottom arrow is the horizontal arrow of (B.8), induced by the quotient maps of (B.7), and its top arrow is induced by Sato's map. The square commutes provided Sato's map Wω̃_X→WΞ_X[−1] corresponds, under ω̃_X≃Wω̃_(X,K₀) and ω⁺_X≃WΞ_(X,K₀), to the map ω̃_X→ω⁺_X[−1] induced by the quotient maps; the rest is naturality of step 1. Disegni–Liu display (B.10) without proof.

**Depends on:** `CR.4/semistable-log-witt-models`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `SchemeAndStackFoundations:SF.2`.

**Sources:** [dl](https://arxiv.org/pdf/2204.09239v3), Appendix B.1, Definition B.1, Remark B.2 and Lemma B.3 with proof, p.80; B.2, the definitions of ω_(U,X), ω̃_(U,X) (p.81) and (B.6)–(B.9), p.83. The maps (B.6) and (B.9), with their sources and targets, and the remark that they are only maps (Remark B.2) are as printed.; [dl](https://arxiv.org/pdf/2204.09239v3), Appendix B.2, diagrams (B.7), (B.8) and (B.10), p.83. (B.10) is displayed as a diagram that (B.6) and (B.9) fit into; its upper arrow is induced by Sato's map and its lower arrow is the horizontal arrow of (B.8). The source does not prove its commutativity and the node records the condition under which it holds.

**Acceptance.**

- For U=X the tube of X∖U is empty, f^!_(X,X) is the identity, and (B.6) is the inverse of the equivalence ω̃_X≃Wω̃_(X,K₀) of (B.5); for U=∅ the tube functor is the kernel of the identity, so source and target of (B.6) and (B.9) vanish.

### principal-p-decalage — Principal p-décalage on torsion-free complexes

**Construction:** `TauCeti.Crystalline.principal_p_decalage`. For a termwise p-torsion-free cochain complex M of abelian groups define E_p(M)^n={x∈M^n : dx∈pM^(n+1)}, with differential x↦dx/p (the unique quotient). Multiplication by p^n identifies this normalized complex with η_p(M)^n={z∈p^nM^n⊂M^n[1/p] : dz∈p^(n+1)M^(n+1)} for every integer n. Chain maps restrict to E_p; identity and composition are inherited. H^n(E_pM)≅H^n(M)/H^n(M)[p], naturally. E_p commutes with filtered colimits of such complexes.

**Hypotheses and conventions.**

- p is prime; multiplication by p is injective on every M^n; cochain degrees are integers.

**API.**

- `TauCeti.Crystalline.pDecalage_degree` (characterisation): E_p(M)^n is the kernel of d followed by reduction modulo p.
- `TauCeti.Crystalline.pDecalage_d` (relation): p·d_E(x)=d_M(x), so d_E²=0.
- `TauCeti.Crystalline.pDecalage_map` (functoriality): E_p(f)(x)=f(x), with E_p(id)=id and E_p(gf)=E_p(g)E_p(f).
- `TauCeti.Crystalline.pDecalage_cohomology` (equivalence): H^n(E_pM)=H^n(M)/H^n(M)[p].
- `TauCeti.Crystalline.pDecalage_filtered_colimit` (compatibility): colim E_p(M_j)≅E_p(colim M_j) for a filtered diagram of termwise p-torsion-free complexes.

**Unit tests.**

- `TauCeti.Crystalline.test_pDecalage_zero` (degenerate): E_p of the zero complex is zero.
- `TauCeti.Crystalline.test_pDecalage_two_term` (computation): For [Z --p--> Z] in degrees 0,1 the normalized E_p is [Z --1--> Z], so its cohomology vanishes.
- `TauCeti.Crystalline.test_pDecalage_negative` (compatibility): For Z in degree −1 with zero differential, E_p is Z in degree −1, identified with p^(−1)Z in η_p.

**Uses.** CR.4/dieudonne-complex, saturation-colimit and nygaard-filtration: Supplies the actual p-décalage object and its chain maps before any later A_inf theory.

**Construction or proof.**

1. Existence and uniqueness of dx/p use the defining condition and injectivity. Its differential is again admissible and squares to zero because p·d(dx/p)=d²x=0. Chain maps commute with division by p.
2. The maps x↦p^n x in localized terms identify E_p with η_p, including negative n. A cocycle of E_p is a cocycle of M. Its boundaries are the elements z with pz a boundary of M; therefore the cohomology quotient kills exactly H^n(M)[p].
3. Filtered colimits of abelian groups are exact, preserve injectivity of p, and commute with the kernel of M^n→M^(n+1)/p. Hence they commute with E_p and its differential.

**Depends on:** `mathlib:CochainComplex`, `mathlib:ModuleCat`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), Construction 2.1.3 and Remark 2.1.4, pp.13–14; Proposition 7.2.1 and Corollary 7.2.2, p.84. The localized construction and its cohomology computation; normalized coordinates and filtered-colimit compatibility follow directly from kernels.

**Acceptance.**

- Negative cochain degrees use p^n in the localization, rather than a natural-degree truncation.

**Signature component.** The integer-indexed normalized submodules, d/p differential and functorial cochain map are typed. The homology and filtered-colimit assertions are in the exact omission register. The negative-degree test checks the normalized carrier; its embedding into the localization as p^(-1)Z is not typed.

### dieudonne-complex — Dieudonné complexes

**Definition:** `TauCeti.Crystalline.DieudonneComplex`. A Dieudonné complex is a cochain complex of abelian groups (M*,d) with a map of graded abelian groups F:M*→M* satisfying dF(x)=pF(dx); morphisms commute with d and F. For a termwise p-torsion-free complex M, η_pM is the principal décalage complex of CrystallineCohomology:CR.4/principal-p-decalage for the ring Z and the element p: as a subcomplex of M*[p^{-1}], (η_pM)^n={x∈p^nM^n : dx∈p^{n+1}M^{n+1}} for every integer n (Construction 2.1.3; for complexes in nonnegative degrees η_pM⊆M, footnote 1). For termwise p-torsion-free M, a Dieudonné structure F is equivalent to a map of cochain complexes α_F:M*→(η_pM)*, α_F(x)=p^nF(x) for x∈M^n, with inverse F(x)=p^{-n}α(x).

**Hypotheses and conventions.**

- p is a prime.
- M is a cochain complex of abelian groups, graded by all integers.
- Termwise p-torsion-freeness of M is assumed for η_pM and for the equivalence between F and α_F; it is not assumed in the definition of a Dieudonné complex.

**API.**

- `TauCeti.Crystalline.DieudonneComplex.F_zero` (simp): F is zero preserving in every degree.
- `TauCeti.Crystalline.DieudonneComplex.F_add` (simp): F is additive in every degree.
- `TauCeti.Crystalline.DieudonneComplex.d_F` (relation): The relation is dF=pFd, including negative cochain degrees.
- `TauCeti.Crystalline.DieudonneComplex.alphaF` (data): For a termwise p-torsion-free Dieudonné complex M, α_F:M→η_pM is the cochain map with α_F(x)=p^nF(x) for x∈M^n; in the normalized coordinates of CrystallineCohomology:CR.4/principal-p-decalage it is F itself, regarded as a cochain map M→E_p(M).
- `TauCeti.Crystalline.DieudonneComplex.ofAlpha` (constructor): For a termwise p-torsion-free cochain complex M of abelian groups and a cochain map α:M→η_pM, the triple (M,d,F) with F(x)=p^(−n)α(x) for x∈M^n is a Dieudonné complex.
- `TauCeti.Crystalline.DieudonneComplex.alphaF_ofAlpha` (characterisation): The two constructions are mutually inverse: the map α_F of ofAlpha(α) is α, and ofAlpha(α_F) has Frobenius F.
- `TauCeti.Crystalline.DieudonneComplex.alphaF_natural` (functoriality): For termwise p-torsion-free Dieudonné complexes M, N and a cochain map f:M→N with f∘F=F∘f, η_p(f)∘α_F=α_F∘f.
- `TauCeti.Crystalline.DieudonneComplex.ofEnd` (example): For an abelian group A and any endomorphism F of A, the complex with A in degree 0 and zero elsewhere, with this F, is a Dieudonné complex (BLM Example 2.5.6).

**Unit tests.**

- `TauCeti.Crystalline.test_dieudonne_degree_zero` (computation): Z concentrated in degree zero permits any Frobenius multiplication a.
- `TauCeti.Crystalline.test_dieudonne_not_chain` (non-example): For p=2 there is a Dieudonné complex with dF≠Fd: Z→Z with d=id, F₀=2 and F₁=1.
- `TauCeti.Crystalline.test_dieudonne_factor_p` (non-example): On the complex [Z --id--> Z] in degrees 0 and 1, the maps F_0=id, F_1=id do not form a Dieudonné structure for any prime p: d(F_0(1))=1 while p·F_1(d(1))=p.

**Uses.** BLM Definition 2.2.1, Remark 2.2.2 and §2.3 (CrystallineCohomology:CR.4/saturated-frobenius, CR.4/saturation-colimit): saturation is the condition that α_F is an isomorphism, and Sat(M) is the colimit of the iterates of α_F BLM Definition 3.1.2 (CrystallineCohomology:CR.4/dieudonne-algebra): a Dieudonné algebra is a Dieudonné complex with a compatible graded-commutative product BLM Theorem 7.3.4 (CrystallineCohomology:CR.4/leta-fixed-point): through α_F, strict Dieudonné complexes are the fixed points of Lη_p on the p-complete derived category

**Construction or proof.**

1. η_pM and its identification with a subcomplex of M[p^{-1}] are those of CrystallineCohomology:CR.4/principal-p-decalage for R=Z, f=p: in normalized coordinates E_p(M)^n={x∈M^n : dx∈pM^{n+1}} with differential x↦dx/p, and x↦p^n x identifies E_p(M)^n with (η_pM)^n. In these coordinates α_F is F itself, a cochain map M→E_p(M) because d(Fx)/p=F(dx).
2. Use dF=pFd to check that p^nF lands in the η_p submodule and commutes with the differentials.
3. Conversely divide α(x) by p^n inside the localization; membership in η_p makes the result an element of M.
4. Check the two constructions are inverse; for a cochain map f commuting with F, η_p(f)∘α_F=α_F∘f, with η_p(f) as in CrystallineCohomology:CR.4/principal-p-decalage.

**Depends on:** `CR.4/principal-p-decalage`, `mathlib:CochainComplex`, `mathlib:ModuleCat`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.1, Definition 2.1.1, Construction 2.1.3 with footnote 1, Remark 2.1.4; pp.13–14 in arXiv v3 and in the published version. Definition 2.1.1 gives the definition and the morphisms; Construction 2.1.3 gives η_pM inside M[p^{-1}] "for each integer n"; Remark 2.1.4 gives the correspondence between F and α_F. The node adds only that η_pM is the principal décalage complex of CrystallineCohomology:CR.4/derived-p-decalage for (Z,p).

**Acceptance.**

- T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id is a Dieudonné complex: d(F_0x)=px=p·F_1(dx); F is not a cochain map, since F_1(dx)=x≠px=d(F_0x) for x≠0.
- For the same T: (η_pT)^0={x∈Z : dx∈pZ}=pZ and (η_pT)^1=pZ, and α_F is x↦px in both degrees, a cochain map T→η_pT (here an isomorphism).
- Negative degrees: for Z in degree −1 (zero elsewhere) with F=id, (η_pM)^(−1)=p^(−1)Z inside Q and α_F(x)=p^(−1)x.

### saturated-frobenius — Saturated Frobenius

**Definition:** `TauCeti.Crystalline.IsSaturated`. A Dieudonné complex M is saturated when it is termwise p-torsion-free and F:M^n→{x∈M^n:dx∈pM^{n+1}} is bijective in every degree. For a termwise p-torsion-free Dieudonné complex M, this holds iff α_F:M→η_pM is an isomorphism of cochain complexes.

**Hypotheses and conventions.**

- p is a prime; M is a Dieudonné complex.
- The equivalence with α_F being an isomorphism is stated for termwise p-torsion-free M, where α_F and η_pM are defined.

**API.**

- `TauCeti.Crystalline.IsSaturated.p_injective` (characterisation): Multiplication by p is injective in every degree.
- `TauCeti.Crystalline.IsSaturated.F_injective` (characterisation): The graded Frobenius is injective.
- `TauCeti.Crystalline.IsSaturated.F_range` (characterisation): The image of F in degree n consists exactly of elements whose differential is p-divisible.

**Unit tests.**

- `TauCeti.Crystalline.test_saturated_zero` (degenerate): Every complex whose groups are zero is saturated.
- `TauCeti.Crystalline.test_saturated_zero_d` (characterisation): For zero differential and termwise p-torsionfree groups, saturation is equivalent to bijectivity of F.
- `TauCeti.Crystalline.test_saturated_multiplication_two` (non-example): The degree-zero group Z with F=2 is not saturated at p=2.
- `TauCeti.Crystalline.test_saturated_two_term` (characterisation): For every prime p, the complex [Z --id--> Z] in degrees 0 and 1 with F_0=p and F_1=id is a saturated Dieudonné complex, although F_0 is not surjective.
- `TauCeti.Crystalline.test_saturated_divisible_differential` (non-example): For every prime p, the complex [Z --p--> Z] (d is multiplication by p) in degrees 0 and 1 with F_0=p and F_1=id is a termwise p-torsion-free Dieudonné complex with F injective in both degrees that is not saturated: every x∈M^0 has dx∈pM^1, but F_0(M^0)=pZ.

**Uses.** BLM Remark 2.2.3 and Proposition 2.2.4 (CrystallineCohomology:CR.4/verschiebung-identities): on a saturated complex V is defined by F(Vx)=px BLM §2.3 (CrystallineCohomology:CR.4/saturation-colimit): saturated complexes are the targets in the universal property of Sat(M) BLM Construction 2.5.1 (CrystallineCohomology:CR.4/verschiebung-completion-tower): the quotients W_r(M) and the completion W(M) are defined for saturated M

**Construction or proof.**

1. Identify p^n times the target of F with (η_p M)^n.
2. Use the established α_F dictionary to transport bijectivity to a chain isomorphism.

**Depends on:** `CR.4/dieudonne-complex`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.2, Definition 2.2.1 and Remark 2.2.2; p.14 in arXiv v3 and in the published version. Definition 2.2.1 is the node's definition (the display after (ii) is M^n→{x∈M^n : dx∈pM^(n+1)}); Remark 2.2.2 is the equivalence with α_F being an isomorphism, stated there, as here, for termwise p-torsion-free M.

**Acceptance.**

- T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id is saturated: F_0(Z)=pZ={x : dx∈pT^1}, F_1 is bijective, and correspondingly α_F:T→η_pT is x↦px onto pZ in both degrees.
- A in degree 0 with an endomorphism F is saturated iff A is p-torsion-free and F is an automorphism (BLM Example 2.5.6): (Z,F=id) and (Q,F=id) are saturated; (Z/p,F=id) and (Z,F=p) are not.

### verschiebung-identities — Verschiebung and the differential

**Construction:** `TauCeti.Crystalline.verschiebung`. On a saturated Dieudonné complex define V uniquely by F(Vx)=px. It is injective and satisfies FV=VF=p, FdV=d and Vd=p dV.

**Hypotheses and conventions.**

- The complex is saturated; in particular F is injective and M is p-torsion-free.

**API.**

- `TauCeti.Crystalline.verschiebung_FV` (relation): F(Vx)=px in every degree.
- `TauCeti.Crystalline.verschiebung_VF` (relation): V(Fx)=px in every degree.
- `TauCeti.Crystalline.verschiebung_d` (relation): Vd=p dV; V is not assumed to be a chain map.
- `TauCeti.Crystalline.verschiebung_FdV` (relation): FdV=d in each degree.
- `TauCeti.Crystalline.verschiebung_injective` (characterisation): V is injective in each degree.

**Unit tests.**

- `TauCeti.Crystalline.test_V_F_identity` (computation): If F is identity in a degree, V is multiplication by p there.
- `TauCeti.Crystalline.test_V_F_p` (computation): If F is multiplication by p in a degree, V is identity there; e.g. a rational degree-zero group.
- `TauCeti.Crystalline.test_V_not_chain` (non-example): On the saturated Dieudonné complex [Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id one has V_0=id and V_1=p; hence V_1(d(1))=p=p·d(V_0(1)) and V_1∘d≠d∘V_0.

**Uses.** BLM Construction 2.5.1 and Remark 2.5.2 (CrystallineCohomology:CR.4/verschiebung-filtration, CR.4/verschiebung-completion-tower): V defines the subcomplexes im(V^r)+im(dV^r), and FV=p, FdV=d, Vd=p dV make F and V descend to the quotients W_r(M) BLM Lemmas 2.6.3 and 2.6.4: the identities give dx=F^r d(V^r x) and pV^r=V^(r+1)F

**Construction or proof.**

1. Since d(px) belongs to pM, saturation puts px in the image of F; injectivity gives existence and uniqueness of V.
2. FV=p implies injectivity of V. Precompose with F and cancel F to obtain VF=p.
3. Combine dF=pFd and FV=p, cancel p, and then postcompose with V to obtain the differential identities.

**Depends on:** `CR.4/saturated-frobenius`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.2, Remark 2.2.3 and Proposition 2.2.4 with proof, identities (4)–(6); arXiv v3 p.14; published p.14 (statement) and p.15 (proof). Remark 2.2.3 defines Vx as the unique element with F(Vx)=px; Proposition 2.2.4 states injectivity and (4) F∘V=V∘F=p, (5) F∘d∘V=d, (6) p(d∘V)=V∘d, the node's FV=VF=p, FdV=d, Vd=p dV. Nothing is added.

**Acceptance.**

- On T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id: V_0=id and V_1=p; F_0V_0=p=V_1F_1, F_1∘d∘V_0=d, V_1∘d=p·d∘V_0, and V_1∘d≠d∘V_0.
- For a p-torsion-free group A in degree 0 with an automorphism F, V=p·F^(−1); for F=id, V=p, and for A=Q with F=p, V=id.

### iterated-frobenius-divisibility — Iterated Frobenius divisibility

**Lemma:** `TauCeti.Crystalline.iteratedF_range`. For a saturated Dieudonné complex and every r≥0, F^r identifies M^n with {x∈M^n:dx∈p^rM^{n+1}}. Consequently every cocycle belongs to the image of every iterate F^r.

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; r≥0 and n are integers.

**Uses.** BLM Proposition 2.7.1 and Remark 2.7.3 (CrystallineCohomology:CR.4/finite-witt-cohomology): surjectivity of W_r(M)→H^*(M/p^rM), and writing a cocycle y as F^r y′ in the comparison of M/p^rM with W_r(M)

**Construction or proof.**

1. The forward inclusion follows from dF^r=p^rF^rd.
2. For dx=p^r y with r>0, p-torsion-freeness gives dy=0.
3. Write x=F(x′) and y=F(y′) by saturation, cancel pF to obtain dx′=p^{r−1}y′, and apply induction.

**Depends on:** `CR.4/saturated-frobenius`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.2, Proposition 2.2.5 with proof and Remark 2.2.6; p.15 in arXiv v3 and in the published version. Proposition 2.2.5 (the display is M^*→{x∈M^* : dx∈p^rM^(*+1)}) is the first sentence of the node and Remark 2.2.6 the consequence for cocycles; the proof steps are the source's induction on r.

**Acceptance.**

- r=0 is trivial and r=1 is condition (ii) of saturation.
- On T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id: F_0^r(Z)=p^rZ={x : dx∈p^rT^1}; in degree 1 every element is a cocycle and F_1^r=id is bijective.

### dieudonne-dF — Frobenius relation dF=pFd

**Lemma:** `TauCeti.Crystalline.DieudonneComplex.d_F`. For a Dieudonné complex (M,d,F), every integer n and every x∈M^n: d(Fx)=p·F(dx) in M^(n+1).

**Hypotheses and conventions.**

- p is a prime; M is a Dieudonné complex, graded by all integers; n is any integer. Neither saturation nor torsion-freeness is assumed.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. This is the defining identity of a Dieudonné complex (BLM Definition 2.1.1); it holds in every integer degree because the complex is graded by all integers.

**Depends on:** `CR.4/dieudonne-complex`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.1, Definition 2.1.1; p.13 in arXiv v3 and in the published version. The relation is the defining identity of Definition 2.1.1. The complex there is graded by all integers, so no restriction on the degree is made.

**Acceptance.**

- On T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id: d(F_0x)=px=p·F_1(dx).
- In a negative degree: for Z in degrees −1 and 0 with d=id, F_(−1)=p and F_0=id, d(F_(−1)x)=px=p·F_0(dx).

### saturated-p-injective — p-torsion-freeness of a saturated complex

**Lemma:** `TauCeti.Crystalline.IsSaturated.p_injective`. Let M be a saturated Dieudonné complex. For every integer n, multiplication by p on M^n is injective.

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. This is condition (i) in the definition of saturation (BLM Definition 2.2.1): M is termwise p-torsion-free.

**Depends on:** `CR.4/saturated-frobenius`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.2, Definition 2.2.1(i); p.14 in arXiv v3 and in the published version. Condition (i) of the definition of a saturated Dieudonné complex, restated as injectivity of multiplication by p on each M^n.

**Acceptance.**

- Z in degree 0 with F=id is saturated, and multiplication by p on Z is injective.
- Z/p in degree 0 with any F is a Dieudonné complex that is not saturated, since p·1=0.

### saturated-F-injective — Injectivity of Frobenius on a saturated complex

**Lemma:** `TauCeti.Crystalline.IsSaturated.F_injective`. Let M be a saturated Dieudonné complex. For every integer n, F:M^n→M^n is injective.

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. By condition (ii) in the definition of saturation, F is a bijection of M^n onto the subgroup {x∈M^n : dx∈pM^(n+1)}; in particular it is injective (BLM Remark 2.2.3).

**Depends on:** `CR.4/saturated-frobenius`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.2, Remark 2.2.3, first sentence (a consequence of Definition 2.2.1(ii)); p.14 in arXiv v3 and in the published version. The first assertion of Remark 2.2.3; it holds because condition (ii) makes F an isomorphism of M^n onto a subgroup of M^n.

**Acceptance.**

- On T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id, F_0=p and F_1=id are injective.
- Z in degree 0 with F=0 is termwise p-torsion-free and not saturated, since F is not injective.

### saturated-F-range — Image of Frobenius on a saturated complex

**Lemma:** `TauCeti.Crystalline.IsSaturated.F_range`. Let M be a saturated Dieudonné complex. For every integer n, F(M^n)={x∈M^n : dx∈pM^(n+1)}.

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. This is condition (ii) in the definition of saturation (BLM Definition 2.2.1): F maps M^n bijectively onto {x∈M^n : dx∈pM^(n+1)}.

**Depends on:** `CR.4/saturated-frobenius`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.2, Definition 2.2.1(ii) with its display; p.14 in arXiv v3 and in the published version. Condition (ii): F induces an isomorphism M^n→{x∈M^n : dx∈pM^(n+1)} (the display that follows the excerpt); the node states the resulting image of F.

**Acceptance.**

- On T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id: F_0(Z)=pZ={x : dx∈pT^1} and F_1(Z)=Z={x : dx∈pT^2=0}.
- Z in degree 0 with F=p is not saturated: every x has dx=0∈pM^1, but F(Z)=pZ.

### verschiebung-FV — FV=p

**Lemma:** `TauCeti.Crystalline.verschiebung_FV`. Let M be a saturated Dieudonné complex. For every integer n and every x∈M^n: F(Vx)=px.

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. This is the defining property of V: Vx is the unique element of M^n with F(Vx)=px; it exists because d(px)∈pM^(n+1) puts px in the image of F, and it is unique because F is injective (BLM Remark 2.2.3).

**Depends on:** `CR.4/verschiebung-identities`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.2, Remark 2.2.3; p.14 in arXiv v3 and in the published version. The defining property of the Verschiebung; the first half of identity (4) of Proposition 2.2.4.

**Acceptance.**

- On T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id: V_0=id, V_1=p and F_0V_0=p=F_1V_1.
- For Z in degree 0 with F=id: V=p and FV=p.

### verschiebung-VF — VF=p

**Lemma:** `TauCeti.Crystalline.verschiebung_VF`. Let M be a saturated Dieudonné complex. For every integer n and every x∈M^n: V(Fx)=px.

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. F(V(Fx))=p·Fx=F(px), by F(Vy)=py for y=Fx; cancel the injective F (BLM, proof of Proposition 2.2.4).

**Depends on:** `CR.4/verschiebung-identities`, `CR.4/verschiebung-FV`, `CR.4/saturated-F-injective`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.2, Proposition 2.2.4, identity (4), and its proof; arXiv v3 p.14; published p.14 (statement) and p.15 (proof). The second half of identity (4), with the source's proof: precompose FV=p with F and cancel the injective F.

**Acceptance.**

- On T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id: V_0F_0=p and V_1F_1=p.
- For Q in degree 0 with F=p (saturated): V=id and VF=p.

### verschiebung-FdV — FdV=d

**Lemma:** `TauCeti.Crystalline.verschiebung_FdV`. Let M be a saturated Dieudonné complex. For every integer n and every x∈M^n: F(d(Vx))=dx in M^(n+1).

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. p·dx=d(px)=d(F(Vx))=p·F(d(Vx)), by F(Vx)=px and dF=pFd; cancel p, which is injective on M^(n+1) (BLM, proof of Proposition 2.2.4).

**Depends on:** `CR.4/verschiebung-identities`, `CR.4/verschiebung-FV`, `CR.4/dieudonne-dF`, `CR.4/saturated-p-injective`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.2, Proposition 2.2.4, identity (5), and its proof; arXiv v3 p.14; published p.14 (statement) and p.15 (proof). Identity (5), F∘d∘V=d, with the source's proof: pd=dFV=pFdV and M is p-torsion-free.

**Acceptance.**

- On T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id: F_1(d(V_0(1)))=1=d(1).

### verschiebung-d — Vd=p dV

**Lemma:** `TauCeti.Crystalline.verschiebung_d`. Let M be a saturated Dieudonné complex. For every integer n and every x∈M^n: V(dx)=p·d(Vx) in M^(n+1). In particular V is not a cochain map in general.

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. V(dx)=V(F(d(Vx)))=p·d(Vx): first FdV=d applied to x, then VF=p applied to d(Vx) (BLM, proof of Proposition 2.2.4).

**Depends on:** `CR.4/verschiebung-identities`, `CR.4/verschiebung-FdV`, `CR.4/verschiebung-VF`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.2, Proposition 2.2.4, identity (6), and the last sentence of its proof; arXiv v3 p.14; published p.14 (statement) and p.15 (proof). Identity (6), p(d∘V)=V∘d, with the source's proof from identity (5) and VF=p. The remark that V is not a cochain map is the node's.

**Acceptance.**

- On T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id: V_1(d(1))=p=p·d(V_0(1)), while d(V_0(1))=1≠p.

### dieudonne-morphism — Morphisms of Dieudonné complexes

**Definition:** `TauCeti.Crystalline.DieudonneHom`. For two existing Dieudonné complexes M,N with the same p, a morphism is an ordinary cochain map f:M→N satisfying f_n F_M=F_N f_n in every integer degree. The cochain map is Mathlib’s HomologicalComplex.Hom; only its Frobenius compatibility is added.

**Hypotheses and conventions.**

- p is a prime; M and N are Dieudonné complexes for p, graded by all integers. No saturation is assumed.

**API.**

- `TauCeti.Crystalline.DieudonneHom.id` (constructor): The identity cochain map with its Frobenius compatibility.
- `TauCeti.Crystalline.DieudonneHom.comp` (functoriality): For f:M→N and g:N→P, g.comp(f) has degree map g_n∘f_n.
- `TauCeti.Crystalline.DieudonneHom.ext` (extensionality): Two morphisms equal on all elements in every degree are equal.
- `TauCeti.Crystalline.DieudonneHom.id_apply` (simp): The identity evaluates to x in each degree.
- `TauCeti.Crystalline.DieudonneHom.comp_apply` (simp): Composition evaluates to g_n(f_n(x)).
- `TauCeti.Crystalline.DieudonneComplex.category` (instance): For a fixed prime p, Dieudonné complexes with DieudonneHom as morphisms, DieudonneHom.id and DieudonneHom.comp form a category DC.
- `TauCeti.Crystalline.DieudonneHom.comm_F` (simp): For a morphism f:M→N, every integer n and x∈M^n: f_n(F_M x)=F_N(f_n x).
- `TauCeti.Crystalline.DieudonneHom.isIso_iff_bijective` (characterisation): A morphism f:M→N of Dieudonné complexes is an isomorphism in DC iff f_n:M^n→N^n is bijective for every integer n.

**Unit tests.**

- `TauCeti.Crystalline.hom_test_zero` (degenerate): The zero cochain map is a Dieudonné morphism.
- `TauCeti.Crystalline.hom_test_scalar` (computation): Multiplication by any integer a is a Dieudonné endomorphism.
- `TauCeti.Crystalline.hom_test_composition` (compatibility): Composition with the identity of the target returns the original morphism.
- `TauCeti.Crystalline.hom_test_F_compatibility` (non-example): A morphism between degree-zero Z groups with F source identity and F target multiplication by2 has zero degree-zero map. Ordinary cochain maps alone would allow identity.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. Bundle the ordinary cochain map and the displayed compatibility equation.
2. Use ordinary identity/composition for the API; Frobenius compatibility follows by substitution. Extensionality is HomologicalComplex.hom_ext plus proof irrelevance.

**Depends on:** `CR.4/dieudonne-complex`, `mathlib:HomologicalComplex.Hom`, `mathlib:HomologicalComplex.hom_ext`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.1, Definition 2.1.1, second paragraph (the category DC); p.13 in arXiv v3 and in the published version. The source's definition of a morphism in DC; the node phrases "map of graded abelian groups commuting with d" as a cochain map.

**Acceptance.**

- Multiplication by an integer a is an endomorphism of every Dieudonné complex.
- For M=Z in degree 0 with F=id and N=Z in degree 0 with F=p, the only morphism M→N is 0, because f(1)=f(F(1))=F(f(1))=p·f(1); as cochain complexes there are the maps of multiplication by any integer.

### dieudonne-morphism-V — Morphisms commute with Verschiebung

**Lemma:** `TauCeti.Crystalline.DieudonneHom.comm_V`. A Dieudonné morphism f between saturated M,N commutes with V in every degree.

**Hypotheses and conventions.**

- p is a prime; M and N are saturated Dieudonné complexes and f:M→N is a morphism of Dieudonné complexes; n is any integer.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. Apply F_N to both f(V_M x) and V_N(fx). Frobenius compatibility and FV=p identify both images with p f(x).
2. Cancel F_N, which is injective because N is saturated; no surjectivity of f is needed.

**Depends on:** `CR.4/dieudonne-morphism`, `CR.4/verschiebung-FV`, `CR.4/saturated-F-injective`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.2, Remark 2.2.3 (uniqueness of Vx), p.14 in arXiv v3 and in the published version; used without statement in Remark 2.5.3 (arXiv v3 pp.19–20; published p.20). The source does not state that morphisms commute with V; Remark 2.5.3 relies on it for the "tautological maps". The node proves it from this uniqueness: F(f(Vx))=f(F(Vx))=p·f(x)=F(V(fx)) and F is injective.

**Acceptance.**

- For M=N=Z in degree 0 with F=id and f multiplication by an integer a: f(Vx)=a·px=V(fx).
- For the inclusion Z→Z_p (both in degree 0 with F=id), V=p on both sides and the inclusion commutes with it.

### verschiebung-filtration — The Verschiebung filtration

**Definition:** `TauCeti.Crystalline.vFiltration`. Set N_r^n(M)=im(V_n^r)+im(d_(n−1) V_(n−1)^r), as the sum of two existing Z-submodules of M^n. The endomorphism exponent is composition. The zeroth level is all of M^n.

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an integer.

**API.**

- `TauCeti.Crystalline.mem_vFiltration` (characterisation): x belongs to N_r^n iff x=V_n^r(a)+d V_(n−1)^r(b), for a in M^n and b in M^(n−1).
- `TauCeti.Crystalline.vFiltration_zero` (simp): N_0^n=M^n because V^0 is identity.
- `TauCeti.Crystalline.vFiltration_antitone` (structure): For r≤s, N_s^n is contained in N_r^n.
- `TauCeti.Crystalline.vFiltration_d` (compatibility): d(N_r^n) is contained in N_r^(n+1).

**Unit tests.**

- `TauCeti.Crystalline.filtration_test_zero` (degenerate): Zero belongs to N_7^n.
- `TauCeti.Crystalline.filtration_test_V_identity` (computation): If V_n is identity and the incoming differential is zero, N_3^n=M^n.
- `TauCeti.Crystalline.filtration_test_zero_d_F_identity` (compatibility): If the incoming differential is zero and F_n is identity, N_r^n=p^r M^n.
- `TauCeti.Crystalline.filtration_test_d_summand` (non-example): At p=2 there is a saturated M and an element of N_1^1 outside im(V_1): for M=[Z --id--> Z] in degrees 0 and 1 with F_0=2, F_1=id (so V_0=id, V_1=2), N_1^1=M^1 while im(V_1)=2M^1, and dV_0(1)=1 is such an element. The same holds for every prime p with F_0=p.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. N_r^n is the sum of the image of V^r:M^n→M^n and the image of d∘V^r:M^(n−1)→M^n, formed with LinearMap.range and the supremum of submodules; V^r is the r-fold composite.
2. The second summand uses degree n−1 for every integer n. Both summands are images of additive maps and no closure is taken, as in BLM Construction 2.5.1.

**Depends on:** `CR.4/verschiebung-identities`, `mathlib:LinearMap.range`, `mathlib:Submodule.mem_sup`, `mathlib:Module.End.pow_apply`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.5, Construction 2.5.1, the subcomplex im(V^r)+im(dV^r); p.19 in arXiv v3 and in the published version. N_r^n is the degree-n part of the subcomplex im(V^r)+im(dV^r) of Construction 2.5.1; the name N_r and the degreewise description are the node's.

**Acceptance.**

- For M=Z in degree 0 with F=id: N_r^0=p^rZ.
- For T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id: N_r^0=T^0 and N_r^1=T^1 for all r, while im(V_1^r)=p^rZ; so the summand im(dV^r) cannot be omitted.

### verschiebung-filtration-membership — Representatives in the Verschiebung filtration

**Lemma:** `TauCeti.Crystalline.mem_vFiltration`. x∈N_r^n iff x=V_n^r(a)+d V_(n−1)^r(b) for some a∈M^n and b∈M^(n−1).

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an integer.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. Unfold the two ranges and apply Submodule.mem_sup. Reverse the displayed sum equality if necessary.

**Depends on:** `CR.4/verschiebung-filtration`, `mathlib:Submodule.mem_sup`, `mathlib:LinearMap.mem_range`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.5, Construction 2.5.1, the subcomplex im(V^r)+im(dV^r); p.19 in arXiv v3 and in the published version. Unfolds the sum of the two images in degree n; the source uses this description without stating it (for instance at the start of the proof of Lemma 2.6.4).

**Acceptance.**

- For M=Z in degree 0 with F=id: x∈N_r^0 iff x=p^r a for some integer a.
- For T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id: 1∈N_1^1, because 1=V_1(0)+d(V_0(1)), although 1∉im(V_1)=pZ.

### verschiebung-filtration-zero — Zeroth Verschiebung filtration

**Lemma:** `TauCeti.Crystalline.vFiltration_zero`. N_0^n=M^n for every n.

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. V^0 is identity, so the first range is top. This holds without any assumption on the incoming differential.

**Depends on:** `CR.4/verschiebung-filtration`, `mathlib:Module.End.pow_apply`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.5, Construction 2.5.1, the case r=0 (the displayed tower ends with W_0(M)^*=0); p.19 in arXiv v3 and in the published version. For r=0 the subcomplex is all of M because V^0 is the identity; the source records this as W_0(M)^*=0 at the end of the displayed tower.

**Acceptance.**

- For M=Z in degree 0 with F=id and for T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id: N_0^n=M^n in every degree; consequently W_0(M)=0.

### verschiebung-filtration-antitone — Decreasing Verschiebung filtration

**Lemma:** `TauCeti.Crystalline.vFiltration_antitone`. The sequence r↦N_r^n is antitone.

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer; r≤s are nonnegative integers.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. Write V^(r+1)=V^r∘V in both summands. This gives N_(r+1)⊆N_r, then iterate the inclusion for arbitrary r≤s.

**Depends on:** `CR.4/verschiebung-filtration-membership`, `mathlib:Module.End.pow_apply`, `mathlib:LinearMap.range_comp_le_range`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.5, Construction 2.5.1, the natural quotient maps Res; p.19 in arXiv v3 and in the published version. The source's "natural quotient maps" presuppose that the (r+1)-st subcomplex lies in the r-th; the node states the inclusion N_s⊆N_r for all r≤s.

**Acceptance.**

- For M=Z in degree 0 with F=id the chain is Z⊇pZ⊇p²Z⊇⋯, strictly decreasing.
- For Q in degree 0 with F=id it is constant: N_r^0=Q for all r.

### verschiebung-filtration-d — Differential stability of the filtration

**Lemma:** `TauCeti.Crystalline.vFiltration_d`. d maps N_r^n into N_r^(n+1).

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an integer.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. For x=V^r a+dV^r b, dx=dV^r a because d²=0. This is exactly the second summand in degree n+1.

**Depends on:** `CR.4/verschiebung-filtration-membership`, `mathlib:HomologicalComplex.d_comp_d`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.5, Construction 2.5.1 ("the subcomplex im(V^r)+im(dV^r)"); p.19 in arXiv v3 and in the published version. The source calls im(V^r)+im(dV^r) a subcomplex without comment; the node states and proves the stability under d that this means.

**Acceptance.**

- For T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id: d(N_r^0)=d(Z)=Z=N_r^1.
- For E, the free strict Dieudonné complex on one generator x in degree 0 (BLM Example 2.5.7): Vx∈N_1^0 and d(Vx)=dVx∈N_1^1.

### verschiebung-filtration-F — Frobenius lowers the filtration

**Lemma:** `TauCeti.Crystalline.vFiltration_F`. F_n(N_(r+1)^n)⊆N_r^n.

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an integer.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. On V^(r+1)a, FV=p gives p V^r a. On dV^(r+1)b, FdV=d gives dV^r b. Both lie in the required two summands.

**Depends on:** `CR.4/verschiebung-filtration-membership`, `CR.4/verschiebung-FV`, `CR.4/verschiebung-FdV`, `mathlib:Module.End.pow_apply`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.5, Remark 2.5.2, first paragraph; p.19 in arXiv v3 and in the published version. The source's statement with r+1 in place of r, and its proof from F∘d∘V=d and F∘V=p.

**Acceptance.**

- For M=Z in degree 0 with F=id: F(N_(r+1)^0)=p^(r+1)Z⊆p^rZ=N_r^0.
- F need not preserve a level: for E, the free strict Dieudonné complex on one generator x in degree 0 (BLM Example 2.5.7), dVx∈N_1^1 and F(dVx)=dx lies in N_0^1 but not in N_1^1.

### verschiebung-filtration-V — Verschiebung raises the filtration

**Lemma:** `TauCeti.Crystalline.vFiltration_V`. V_n(N_r^n)⊆N_(r+1)^n.

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an integer.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. The first summand maps to V^(r+1)a. The second maps to p dV^(r+1)b by Vd=p dV.

**Depends on:** `CR.4/verschiebung-filtration-membership`, `CR.4/verschiebung-d`, `mathlib:Module.End.pow_apply`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.5, Remark 2.5.2, second paragraph; p.19 in arXiv v3 and in the published version. Exactly the source's statement and proof.

**Acceptance.**

- For M=Z in degree 0 with F=id: V(N_r^0)=p·p^rZ=N_(r+1)^0.
- For E, the free strict Dieudonné complex on one generator x in degree 0 (BLM Example 2.5.7): dx∈N_0^1 and V(dx)=p·dVx∈N_1^1.

### finite-witt-quotient — Finite Verschiebung quotient complex

**Construction:** `TauCeti.Crystalline.Wcomplex`. For saturated M and r≥0 define W_r(M)^n=M^n/N_r^n for every integer n, with differential [x]↦[dx]; this is a cochain complex of abelian groups graded by all integers. The notation W_r here is a quotient of a Dieudonné complex, not the ring of truncated Witt vectors.

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an integer.

**API.**

- `TauCeti.Crystalline.Wmk` (constructor): The canonical linear quotient projection M^n→W_r(M)^n.
- `TauCeti.Crystalline.Wmk_surjective` (characterisation): Every class in W_r(M)^n is represented by an element of M^n.
- `TauCeti.Crystalline.Wmk_eq_zero` (characterisation): The class of x is zero iff x∈N_r^n.
- `TauCeti.Crystalline.Wcomplex_d_mk` (simp): The quotient differential sends the class of x to the class of dx.

**Unit tests.**

- `TauCeti.Crystalline.Wcomplex_test_zero_level` (degenerate): Every group of W_0(M) is zero.
- `TauCeti.Crystalline.Wcomplex_test_zero_complex` (degenerate): If M is degreewise zero, so is every W_r(M).
- `TauCeti.Crystalline.Wcomplex_test_V_surjective` (non-example): If V is surjective in every degree, all W_r(M) vanish, including rational degree-zero M with F identity.
- `TauCeti.Crystalline.Wcomplex_test_Z8` (computation): For M^0 identified with Z, zero incoming differential and F_0 identity at p=2, W_3(M)^0 is Z/8 as a Z-module.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. d maps N_r^n into N_r^(n+1) (CR.4/verschiebung-filtration-d), so it induces a map of quotients by Submodule.mapQ; the induced map squares to zero because d does, checked on representatives.
2. The complex is assembled from these groups and maps with CochainComplex.of; Wmk:M^n→W_r(M)^n is the quotient map Submodule.Quotient.mk.

**Depends on:** `CR.4/verschiebung-filtration-d`, `mathlib:CochainComplex.of`, `mathlib:ModuleCat.ofHom`, `mathlib:Submodule.mapQ`, `mathlib:Submodule.Quotient.mk`, `mathlib:HomologicalComplex.d_comp_d`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.5, Construction 2.5.1; p.19 in arXiv v3 and in the published version. W_r(M) is the source's quotient complex; the node spells out the degree-n group M^n/N_r^n and the induced differential, and warns that W_r here is not the ring of truncated Witt vectors.

**Acceptance.**

- For M=Z in degree 0 with F=id: W_r(M) is Z/p^r in degree 0 (Z/8 for p=2, r=3).
- W_0(M)=0 for every saturated M; for Q in degree 0 with F=id, W_r=0 for all r.
- For T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id: W_r(T)^1=0 although T^1/V^r(T^1)=Z/p^r, so the summand im(dV^r) matters.

### finite-witt-representatives — Surjectivity of the quotient projection

**Lemma:** `TauCeti.Crystalline.Wmk_surjective`. The degreewise map Wmk:M^n→W_r(M)^n is surjective.

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an integer.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. Wmk is the quotient map of M^n by the submodule N_r^n, which is surjective (Submodule.mkQ_surjective).

**Depends on:** `CR.4/finite-witt-quotient`, `mathlib:Submodule.mkQ_surjective`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.5, Construction 2.5.1; p.19 in arXiv v3 and in the published version. Surjectivity of M^n→W_r(M)^n is immediate from the construction as a quotient; the source uses it without statement ("Choose an element x∈M^* representing x̄", proof of Proposition 2.6.2).

**Acceptance.**

- For M=Z in degree 0 with F=id, Wmk is the reduction Z→Z/p^r, which is surjective.

### finite-witt-zero-class — Zero classes in finite quotients

**Lemma:** `TauCeti.Crystalline.Wmk_eq_zero`. Wmk(x)=0 iff x∈N_r^n.

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an integer.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. The class of x in the quotient M^n/N_r^n is zero iff x∈N_r^n (Submodule.Quotient.mk_eq_zero).

**Depends on:** `CR.4/finite-witt-quotient`, `mathlib:Submodule.Quotient.mk_eq_zero`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.5, Construction 2.5.1; p.19 in arXiv v3 and in the published version. The kernel of M^n→W_r(M)^n is N_r^n by construction; the source uses this in Lemma 2.6.4 ("the image of x vanishes in W_r(M)^*").

**Acceptance.**

- For M=Z in degree 0 with F=id: the class of x in Z/p^r is zero iff x∈p^rZ=N_r^0.
- For T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id: the class of 1∈T^1 in W_1(T)^1 is zero, because 1=d(V_0(1))∈N_1^1.

### finite-witt-differential — Differential of a quotient representative

**Lemma:** `TauCeti.Crystalline.Wcomplex_d_mk`. d(Wmk(x))=Wmk(dx) in W_r(M)^(n+1).

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an integer.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. Unfold CochainComplex.of at adjacent indices and use mapQ_apply.

**Depends on:** `CR.4/finite-witt-quotient`, `mathlib:Submodule.mapQ_apply`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.5, Construction 2.5.1; p.19 in arXiv v3 and in the published version. The differential of the quotient complex is induced by d; this is what "the quotient of M^* by the subcomplex" means, and it is not stated separately in the source.

**Acceptance.**

- For E, the free strict Dieudonné complex on one generator x in degree 0 (BLM Example 2.5.7): d[x]_1=[dx]_1 in W_1(E)^1, and this class is nonzero, because every element of N_1^1 has its coefficient of dx divisible by p.

### finite-witt-projection — Projection to the finite quotient

**Construction:** `TauCeti.Crystalline.Wprojection`. The degreewise projections Wmk assemble into a cochain map M→W_r(M).

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an integer.

**API.**

- `TauCeti.Crystalline.Wprojection_apply` (simp): Its degree-n component sends x to Wmk(x).
- `TauCeti.Crystalline.Wprojection_surjective` (characterisation): Every component is surjective.
- `TauCeti.Crystalline.Wprojection_kernel` (characterisation): The degree-n kernel is N_r^n.

**Unit tests.**

- `TauCeti.Crystalline.projection_test_level_zero` (degenerate): The projection to W_0 is zero.
- `TauCeti.Crystalline.projection_test_V_power` (computation): The projection kills V^r(x).
- `TauCeti.Crystalline.projection_test_dV_power` (non-example): The projection also kills dV^r(y), even when this element is not in im(V^r).

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. The components are the maps Wmk; the cochain-map condition is d[x]=[dx] (CR.4/finite-witt-differential).

**Depends on:** `CR.4/finite-witt-quotient`, `CR.4/finite-witt-differential`, `mathlib:CochainComplex.ofHom`, `CR.4/finite-witt-representatives`, `CR.4/finite-witt-zero-class`, `mathlib:Submodule.mkQ`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.5, Construction 2.5.1 and the displayed tower M^*→⋯→W_1(M)^*→W_0(M)^* after Remark 2.5.3; arXiv v3 pp.19–20; published pp.19–20. The quotient maps M→W_r(M) are the first arrows of the displayed tower; the node records that they are cochain maps, surjective in each degree, with kernel N_r.

**Acceptance.**

- For M=Z in degree 0 with F=id the projection is the reduction Z→Z/p^r, with kernel p^rZ.
- The projection to W_0(M) is zero.

### finite-witt-restriction — Restriction between finite quotients

**Construction:** `TauCeti.Crystalline.Wrestriction`. The inclusion N_(r+1)⊆N_r induces a cochain map R_r:W_(r+1)(M)→W_r(M), represented by the identity on M.

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an integer.

**API.**

- `TauCeti.Crystalline.Wrestriction_mk` (simp): R_r([x]_(r+1))=[x]_r.
- `TauCeti.Crystalline.Wrestriction_surjective` (characterisation): R_r is surjective in each degree.
- `TauCeti.Crystalline.Wprojection_restriction` (compatibility): Projection to level r+1 followed by R_r equals projection to level r.

**Unit tests.**

- `TauCeti.Crystalline.restriction_test_zero` (degenerate): R_0 has zero target and sends every class to zero.
- `TauCeti.Crystalline.restriction_test_two_steps` (computation): R_r R_(r+1)([x]_(r+2))=[x]_r.
- `TauCeti.Crystalline.restriction_test_d` (compatibility): Restriction commutes with the quotient differential.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. Apply mapQ to identity degreewise and use d-stability; compatibility with differentials is checked on representatives.

**Depends on:** `CR.4/verschiebung-filtration-antitone`, `CR.4/finite-witt-quotient`, `mathlib:Submodule.mapQ`, `mathlib:CochainComplex.ofHom`, `CR.4/finite-witt-representatives`, `CR.4/finite-witt-differential`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.5, Construction 2.5.1, the maps Res; p.19 in arXiv v3 and in the published version. R_r is the source's Res:W_(r+1)(M)→W_r(M), with the same direction and indices as R in Definition 2.6.1.

**Acceptance.**

- For M=Z in degree 0 with F=id, R_r is the reduction Z/p^(r+1)→Z/p^r.
- R_0:W_1(M)→W_0(M)=0 is zero.

### finite-witt-restriction-formula — Restriction on representatives

**Lemma:** `TauCeti.Crystalline.Wrestriction_mk`. R_r([x]_(r+1))=[x]_r.

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an integer. x∈M^n.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. Use the defining identity lift and mapQ_apply.

**Depends on:** `CR.4/finite-witt-restriction`, `mathlib:Submodule.mapQ_apply`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.5, Construction 2.5.1, the maps Res; p.19 in arXiv v3 and in the published version. Res is the "natural quotient map", so it is the identity on representatives; the formula is not written in the source.

**Acceptance.**

- For M=Z in degree 0 with F=id: R_r(x mod p^(r+1))=x mod p^r.

### finite-witt-F — Frobenius on finite quotients

**Construction:** `TauCeti.Crystalline.WF`. The map F induces Z-linear degree maps F_r:W_(r+1)(M)^n→W_r(M)^n sending [x] to [Fx].

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an integer.

**API.**

- `TauCeti.Crystalline.WF_mk` (simp): F_r([x]_(r+1))=[Fx]_r.
- `TauCeti.Crystalline.WF_d` (relation): d F_r=p F_r d, with the degree and level indices shown.
- `TauCeti.Crystalline.WF_restriction` (compatibility): R_r F_(r+1)=F_r R_(r+1) from level r+2 to r.

**Unit tests.**

- `TauCeti.Crystalline.WF_test_zero_level` (degenerate): F_0 has zero target.
- `TauCeti.Crystalline.WF_test_identity` (compatibility): If F is identity on M, F_r equals R_r.
- `TauCeti.Crystalline.WF_test_non_chain` (non-example): At p=2 there is a saturated M for which F_1:W_2(M)→W_1(M) does not commute with d: for M the free strict Dieudonné complex on one generator x in degree 0 (BLM Example 2.5.7), d(F_1[x]_2)=[2F dx]_1=0 while F_1(d[x]_2)=[F dx]_1≠0 in W_1(M)^1. The same M works for every prime p.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. Apply Submodule.mapQ to F, using F(N_(r+1)^n)⊆N_r^n (CR.4/verschiebung-filtration-F).
2. The relation d∘F_r=p·F_r∘d follows on representatives from dF=pFd, and R_r∘F_(r+1)=F_r∘R_(r+1) holds because both send [x]_(r+2) to [Fx]_r.

**Depends on:** `CR.4/verschiebung-filtration-F`, `CR.4/finite-witt-quotient`, `mathlib:Submodule.mapQ`, `CR.4/dieudonne-dF`, `CR.4/finite-witt-representatives`, `CR.4/finite-witt-differential`, `CR.4/finite-witt-restriction-formula`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.5, Remark 2.5.2, first paragraph and diagram, p.19 in arXiv v3 and in the published version; indexing as in §2.6, Definition 2.6.1, p.21 in both. The source's F:W_r(M)→W_(r−1)(M), indexed in the node as F_r:W_(r+1)(M)→W_r(M) as in Definition 2.6.1. The relations d∘F=p·F∘d and R∘F=F∘R of the API are axioms (3) and (4) of that definition, which the proof of Proposition 2.6.2 calls clear.

**Acceptance.**

- For M=Z in degree 0 with F=id, F_r is the reduction Z/p^(r+1)→Z/p^r; it equals R_r.
- For E, the free strict Dieudonné complex on one generator x in degree 0 (BLM Example 2.5.7): d(F_1[x]_2)=[pF dx]_1=0 and F_1(d[x]_2)=[F dx]_1≠0, so F_1 is not a cochain map, while d∘F_1=p·F_1∘d holds.

### finite-witt-F-formula — Frobenius on representatives

**Lemma:** `TauCeti.Crystalline.WF_mk`. F_r([x]_(r+1))=[Fx]_r.

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an integer. x∈M^n.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. Apply mapQ_apply to the defining degree map.

**Depends on:** `CR.4/finite-witt-F`, `mathlib:Submodule.mapQ_apply`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.5, Remark 2.5.2, first paragraph and diagram; p.19 in arXiv v3 and in the published version. The formula is the commutativity of the source's square: F on the quotients is induced by F on representatives.

**Acceptance.**

- For M=Z in degree 0 with F=id: F_r(x mod p^(r+1))=x mod p^r.
- For Z_p in degree 0 with F multiplication by a p-adic unit u: F_r(x mod p^(r+1))=ux mod p^r.

### finite-witt-V — Verschiebung on finite quotients

**Construction:** `TauCeti.Crystalline.WV`. The map V induces Z-linear degree maps V_r:W_r(M)^n→W_(r+1)(M)^n sending [x] to [Vx].

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an integer.

**API.**

- `TauCeti.Crystalline.WV_mk` (simp): V_r([x]_r)=[Vx]_(r+1).
- `TauCeti.Crystalline.WV_d` (relation): V_r∘d=p·d∘V_r as maps W_r(M)^n→W_(r+1)(M)^(n+1), for every integer n.
- `TauCeti.Crystalline.WV_restriction` (compatibility): R_(r+1) V_(r+1)=V_r R_r from level r+1 to itself.

**Unit tests.**

- `TauCeti.Crystalline.WV_test_zero_level` (degenerate): V_0 has zero source.
- `TauCeti.Crystalline.WV_test_identity_frobenius` (computation): If F is identity, V_r([x])=p[x] at level r+1.
- `TauCeti.Crystalline.WV_test_non_chain` (non-example): At p=2 there is a saturated M for which V_1:W_1(M)→W_2(M) does not commute with d: for M the free strict Dieudonné complex on one generator x in degree 0 (BLM Example 2.5.7), d(V_1[x]_1)=[dVx]_2≠0 while V_1(d[x]_1)=[2dVx]_2=0 in W_2(M)^1, because 2dVx=dV²(Fx). The same M works for every prime p.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. Apply Submodule.mapQ to V, using V(N_r^n)⊆N_(r+1)^n (CR.4/verschiebung-filtration-V).
2. The relation V_r∘d=p·d∘V_r follows on representatives from Vd=p dV, and R_(r+1)∘V_(r+1)=V_r∘R_r holds because both send [x]_(r+1) to [Vx]_(r+1).

**Depends on:** `CR.4/verschiebung-filtration-V`, `CR.4/finite-witt-quotient`, `mathlib:Submodule.mapQ`, `CR.4/verschiebung-d`, `CR.4/finite-witt-representatives`, `CR.4/finite-witt-differential`, `CR.4/finite-witt-restriction-formula`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.5, Remark 2.5.2, second paragraph and diagram, p.19 in arXiv v3 and in the published version; §2.6, Definition 2.6.1, p.21 in both. The source's V:W_r(M)→W_(r+1)(M). The relation V∘d=p·d∘V and the compatibility with R of the API follow on representatives; the latter is axiom (4) of Definition 2.6.1.

**Acceptance.**

- For M=Z in degree 0 with F=id, V_r is multiplication by p from Z/p^r to Z/p^(r+1), which is injective.
- For E, the free strict Dieudonné complex on one generator x in degree 0 (BLM Example 2.5.7): d(V_1[x]_1)=[dVx]_2≠0 and V_1(d[x]_1)=p[dVx]_2=0 in W_2(E)^1 (p·dVx=dV²(Fx)), so V_1 is not a cochain map, while V_1∘d=p·d∘V_1 holds.

### finite-witt-V-formula — Verschiebung on representatives

**Lemma:** `TauCeti.Crystalline.WV_mk`. V_r([x]_r)=[Vx]_(r+1).

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an integer. x∈M^n.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. Apply mapQ_apply to the defining degree map.

**Depends on:** `CR.4/finite-witt-V`, `mathlib:Submodule.mapQ_apply`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.5, Remark 2.5.2, second paragraph and diagram; p.19 in arXiv v3 and in the published version. The formula is the commutativity of the source's square: V on the quotients is induced by V on representatives.

**Acceptance.**

- For M=Z in degree 0 with F=id: V_r(x mod p^r)=px mod p^(r+1).

### finite-witt-FV — Finite Frobenius after Verschiebung

**Lemma:** `TauCeti.Crystalline.WFV`. F_r V_r=p on W_r(M)^n, including r=0.

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an integer.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. Lift a class to M, use FV=p there, and apply the quotient map.

**Depends on:** `CR.4/finite-witt-F-formula`, `CR.4/finite-witt-V-formula`, `CR.4/finite-witt-representatives`, `CR.4/verschiebung-FV`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.6, Definition 2.6.1(5), p.21 in arXiv v3 and in the published version; proof of Proposition 2.6.2, first sentences, p.22 in both. Axiom (5), first equality, for the tower W_r(M): F(V(x))=px for x∈W_r(M). The source calls it clear; the node gives the one-line proof on representatives.

**Acceptance.**

- For M=Z in degree 0 with F=id: F_rV_r is Z/p^r --p--> Z/p^(r+1) --reduction--> Z/p^r, multiplication by p.
- For r=0 both sides are the zero map of W_0(M)=0.

### finite-witt-VF — Finite Verschiebung after Frobenius

**Lemma:** `TauCeti.Crystalline.WVF`. V_r F_r=p on W_(r+1)(M)^n. In particular p annihilates W_1(M).

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an integer.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. Lift a class to M and use VF=p. For r=0 the intermediate group W_0 is zero.

**Depends on:** `CR.4/finite-witt-F-formula`, `CR.4/finite-witt-V-formula`, `CR.4/finite-witt-representatives`, `CR.4/verschiebung-VF`, `CR.4/verschiebung-filtration-zero`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.6, Definition 2.6.1(5), p.21 in arXiv v3 and in the published version; proof of Proposition 2.6.2, first sentences, p.22 in both. Axiom (5), second equality, V(F(x))=px, stated in the node on W_(r+1)(M) because its F_r starts there. The consequence p·W_1(M)=0 is the node's.

**Acceptance.**

- For M=Z in degree 0 with F=id: V_rF_r is Z/p^(r+1) --reduction--> Z/p^r --p--> Z/p^(r+1), multiplication by p.
- p·W_1(M)=0: for M=Z in degree 0 with F=id, W_1(M)=Z/p.

### verschiebung-divisibility-lift — Frobenius lifting after a divided differential

**Lemma:** `TauCeti.Crystalline.dV_pow_p_divisible`. If d(V^r x) is divisible by p in M^(n+1), then x belongs to im(F_n).

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an integer. x∈M^n.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. Iterating FdV=d gives dx=F^r d(V^r x). If d(V^r x)=py then dx=F^r(py)=p·F^r(y), so dx∈pM^(n+1).
2. Hence x∈F(M^n), by the description of the image of F for saturated M (CR.4/saturated-F-range).

**Depends on:** `CR.4/verschiebung-FdV`, `CR.4/saturated-F-range`, `mathlib:Module.End.pow_apply`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.6, Lemma 2.6.3 with proof; arXiv v3 p.21; published p.22. Exactly Lemma 2.6.3 (d(V^r x)∈pM^(*+1) implies x∈im(F)), with the source's proof dx=F^r d(V^r x).

**Acceptance.**

- For T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id and x∈T^0: d(V_0^r x)=x is divisible by p iff x∈pZ=im(F_0).
- For M=Z in degree 0 with F=id the hypothesis always holds (d=0) and every x lies in im(F)=Z.

### verschiebung-filtration-p-shift — Multiplication by p raises the filtration

**Lemma:** `TauCeti.Crystalline.vFiltration_p_shift`. For x∈N_r^n, px∈N_(r+1)^n.

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an integer.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. VF=p gives pV^r a=V^r(VFa)=V^(r+1)(Fa) and p·dV^r b=dV^r(VFb)=dV^(r+1)(Fb); so p(V^r a+dV^r b)∈N_(r+1)^n.

**Depends on:** `CR.4/verschiebung-filtration-membership`, `CR.4/verschiebung-VF`, `mathlib:Module.End.pow_apply`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.6, proof of Proposition 2.6.2, verification of axiom (7), first half; p.22 in arXiv v3 and in the published version. The source's observation that p(im V^r+im dV^r) lies in im V^(r+1)+im dV^(r+1), which it derives from pV^r=V^(r+1)F in the display that follows.

**Acceptance.**

- For M=Z in degree 0 with F=id: p·N_r^0=p^(r+1)Z=N_(r+1)^0.

### verschiebung-filtration-p-cancellation — Cancellation across filtration levels

**Lemma:** `TauCeti.Crystalline.vFiltration_p_cancel`. If px∈N_(r+1)^n, then x∈N_r^n.

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an integer. x∈M^n.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. Write px=V^(r+1)a+dV^(r+1)b. Differentiating gives dV^(r+1)a=p dx; the lifting lemma writes a=Fa′.
2. Substitute and use V^(r+1)F=pV^r. The residual dV^(r+1)b is p-divisible, so b=Fb′ by the same lemma.
3. The resulting equality is px=p(V^r a′+dV^r b′). Cancel p in M^n.

**Depends on:** `CR.4/verschiebung-filtration-membership`, `CR.4/verschiebung-divisibility-lift`, `CR.4/verschiebung-VF`, `CR.4/saturated-p-injective`, `mathlib:HomologicalComplex.d_comp_d`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.6, Lemma 2.6.4 with proof; p.22 in arXiv v3 and in the published version. Lemma 2.6.4, restated with the subgroups N_r; the three proof steps are the source's proof.

**Acceptance.**

- For M=Z in degree 0 with F=id: px∈p^(r+1)Z implies x∈p^rZ.
- The shift is exactly one in that example: for x=p^r, px∈N_(r+1)^0 and x∈N_r^0, but x∉N_(r+1)^0.

### finite-witt-restriction-kernel — Restriction kernel and p-torsion

**Theorem:** `TauCeti.Crystalline.Wrestriction_kernel`. For x∈W_(r+1)(M)^n, R_r(x)=0 iff px=0. This is the kernel of restriction, not the kernel of Frobenius.

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an integer.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. Represent x by a∈M^n. R_r(x)=0 means a∈N_r; px=0 means pa∈N_(r+1).
2. Use p-shift and p-cancellation for the two implications.

**Depends on:** `CR.4/finite-witt-representatives`, `CR.4/finite-witt-zero-class`, `CR.4/finite-witt-restriction-formula`, `CR.4/verschiebung-filtration-p-shift`, `CR.4/verschiebung-filtration-p-cancellation`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.6, Definition 2.6.1(7), p.21 in arXiv v3 and in the published version; proof of Proposition 2.6.2, verification of (7), p.22 in both. Axiom (7) for the tower W_r(M): the kernel of Res:W_(r+1)(M)→W_r(M) is the p-torsion W_(r+1)(M)[p], with the source's two inclusions.

**Acceptance.**

- For M=Z in degree 0 with F=id: ker(Z/p^(r+1)→Z/p^r)=p^rZ/p^(r+1)Z=(Z/p^(r+1))[p].
- For r=0: R_0=0 and p·W_1(M)=0.

### finite-witt-F-lifting — Finite Frobenius lifting

**Theorem:** `TauCeti.Crystalline.WF_lift`. If x∈W_r(M)^n has d x divisible by p in W_r(M)^(n+1), then x has a preimage under F_r:W_(r+1)(M)^n→W_r(M)^n.

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an integer.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. For r=0 take the zero preimage, since W_0=0. For r≥1 lift the equation to dx=py+V^r a+dV^r b.
2. Differentiate: dV^r a is p-divisible, hence a=Fa′. Then d(x−V^r b)=p(y+V^(r−1)a′).
3. Saturation lifts x−V^r b to Fz. Modulo N_r it has the same class as x, so the class of z at level r+1 is the required preimage.

**Depends on:** `CR.4/finite-witt-representatives`, `CR.4/finite-witt-zero-class`, `CR.4/finite-witt-differential`, `CR.4/finite-witt-F-formula`, `CR.4/verschiebung-filtration-membership`, `CR.4/verschiebung-divisibility-lift`, `CR.4/verschiebung-VF`, `CR.4/saturated-F-range`, `mathlib:HomologicalComplex.d_comp_d`, `CR.4/verschiebung-filtration-zero`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.6, Definition 2.6.1(6), p.21 in arXiv v3 and in the published version; proof of Proposition 2.6.2, verification of (6), p.22 in both. Axiom (6) for the tower W_r(M), with the source's proof. The case r=0, which the source does not separate (its formula uses V^(r−1)), is trivial because W_0(M)=0.

**Acceptance.**

- For M=Z in degree 0 with F=id (d=0): every class of Z/p^r is F_r of a class of Z/p^(r+1), since F_r is the surjective reduction.
- For E, the free strict Dieudonné complex on one generator x in degree 0 (BLM Example 2.5.7) and the class [Fx]_1∈W_1(E)^0: d[Fx]_1=[pF dx]_1=0 is divisible by p, and [Fx]_1=F_1([x]_2).

### finite-witt-p-power — Annihilation at finite level

**Lemma:** `TauCeti.Crystalline.Wcomplex_p_pow`. Multiplication by p^r annihilates every group W_r(M)^n. No torsionfreeness of the finite quotient is asserted.

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an integer.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. Start with every a∈N_0 and apply p-shift r times. Then p^r a∈N_r, so its class is zero.

**Depends on:** `CR.4/verschiebung-filtration-zero`, `CR.4/verschiebung-filtration-p-shift`, `CR.4/finite-witt-representatives`, `CR.4/finite-witt-zero-class`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.8, proof of Corollary 2.8.2, last sentence; arXiv v3 p.27; published p.27. A consequence of axioms (1) and (7) of Definition 2.6.1 (proof of Proposition 2.6.2, p.22 in both versions). The source uses "W_r(M)^n is annihilated by p^r" without proof in the proof of Corollary 2.8.2; the node proves it by r applications of p·N_r⊆N_(r+1).

**Acceptance.**

- For M=Z in degree 0 with F=id: p^r kills W_r(M)=Z/p^r and, for r≥1, p^(r−1) does not; so the exponent is sharp.

### finite-witt-map — Functorial finite quotients

**Construction:** `TauCeti.Crystalline.DieudonneHom.Wmap`. A Dieudonné morphism f between saturated M,N induces a cochain map W_r(f):W_r(M)→W_r(N), represented by f in every degree.

**Hypotheses and conventions.**

- p is a prime; M and N are saturated Dieudonné complexes and f:M→N is a morphism of Dieudonné complexes; r≥0 is an integer.

**API.**

- `TauCeti.Crystalline.DieudonneHom.Wmap_mk` (simp): W_r(f)([x])=[f(x)].
- `TauCeti.Crystalline.DieudonneHom.Wmap_restriction` (compatibility): R_N∘W_(r+1)(f)=W_r(f)∘R_M as cochain maps W_(r+1)(M)→W_r(N), where R_M, R_N are the restriction maps R_r of M and N.
- `TauCeti.Crystalline.DieudonneHom.Wmap_F` (compatibility): W_r(f)∘F_r=F_r∘W_(r+1)(f) in every degree, as maps W_(r+1)(M)^n→W_r(N)^n.
- `TauCeti.Crystalline.DieudonneHom.Wmap_V` (compatibility): W_(r+1)(f)∘V_r=V_r∘W_r(f) in every degree, as maps W_r(M)^n→W_(r+1)(N)^n.
- `TauCeti.Crystalline.DieudonneHom.Wmap_id` (functoriality): W_r of the identity is identity.
- `TauCeti.Crystalline.DieudonneHom.Wmap_comp` (functoriality): W_r(g∘f)=W_r(g)∘W_r(f).

**Unit tests.**

- `TauCeti.Crystalline.Wmap_test_identity` (computation): The induced identity map fixes each quotient class.
- `TauCeti.Crystalline.Wmap_test_zero` (degenerate): A morphism with zero underlying cochain map induces the zero map.
- `TauCeti.Crystalline.Wmap_test_level_zero` (degenerate): Every induced map at level zero is zero.
- `TauCeti.Crystalline.Wmap_test_scalar` (computation): For M=N=Z in degree 0 with F=id and f multiplication by an integer a, W_r(f) is multiplication by a on W_r(M)^0=Z/p^r, for every r≥0.

**Uses.** BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

**Construction or proof.**

1. Commutation with V gives fV^r=V^r f; the existing cochain-map identity gives f dV^r=dV^r f. Hence f maps each N_r(M) into N_r(N).
2. Use mapQ and the ordinary cochain-map constructor. Identity/composition and compatibility with R,F,V are checked on representatives.

**Depends on:** `CR.4/dieudonne-morphism`, `CR.4/dieudonne-morphism-V`, `CR.4/verschiebung-filtration-membership`, `CR.4/finite-witt-quotient`, `mathlib:HomologicalComplex.Hom.comm`, `mathlib:Submodule.mapQ`, `mathlib:Submodule.mapQ_comp`, `mathlib:Submodule.mapQ_id`, `mathlib:CochainComplex.ofHom`, `CR.4/finite-witt-representatives`, `CR.4/finite-witt-restriction-formula`, `CR.4/finite-witt-F-formula`, `CR.4/finite-witt-V-formula`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.5, Remark 2.5.3; arXiv v3 pp.19–20; published p.20. W_r(f) is the source's "tautological map" M/(im V^r+im dV^r)→N/(im V^r+im dV^r); the node adds that it is a cochain map, compatible with Res, F and V and functorial in f.

**Acceptance.**

- For M=N=Z in degree 0 with F=id and f multiplication by an integer a, W_r(f) is multiplication by a on Z/p^r.
- For the inclusion Z→Z_p (both in degree 0 with F=id), W_r(f) is the isomorphism Z/p^r→Z_p/p^rZ_p.

### verschiebung-completion-tower — Completion of a saturated Dieudonné complex

**Construction:** `TauCeti.Crystalline.Completion`. For saturated M* form W_r(M)*=M*/(im V^r+im dV^r) for r≥0 (W_0(M)*=0), the restriction maps Res:W_{r+1}(M)*→W_r(M)*, and the completion W(M)*=lim_r W_r(M)*. For every r≥0, F descends to F:W_{r+1}(M)*→W_r(M)* and V to V:W_r(M)*→W_{r+1}(M)*; passing to the limit makes W(M)* a Dieudonné complex, the construction is functorial, and the tautological map ρ_M:M*→W(M)* is a map of Dieudonné complexes (Remark 2.5.3).

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; r≥0 is an integer.

**API.**

- `TauCeti.Crystalline.Completion.restriction` (functoriality): Res:W_(r+1)(M)→W_r(M) is the cochain map R_r of CR.4/finite-witt-restriction: it is surjective in every degree and Res([x]_(r+1))=[x]_r.
- `TauCeti.Crystalline.Completion.F` (data): F descends from W_{r+1}M to W_rM; on the inverse limit it satisfies dF=pFd.
- `TauCeti.Crystalline.Completion.V` (data): V descends to V_r:W_r(M)→W_(r+1)(M) with V_r∘d=p·d∘V_r; on W(M)^n, viewed as compatible families (x_r)_r, it defines V(x) by V(x)_(r+1)=V_r(x_r) and V(x)_0=0.
- `TauCeti.Crystalline.Completion.unit` (constructor): The natural map ρ:M→lim_r W_rM is a morphism of Dieudonné complexes.
- `TauCeti.Crystalline.Completion.projection` (projection): For every r≥0 there is a cochain map π_r:W(M)→W_r(M), with Res∘π_(r+1)=π_r.
- `TauCeti.Crystalline.Completion.unit_projection` (compatibility): π_r∘ρ_M is the quotient map M→W_r(M) of CR.4/finite-witt-projection, for every r≥0.
- `TauCeti.Crystalline.Completion.ext` (extensionality): Two elements x, y of W(M)^n are equal iff π_r(x)=π_r(y) for every r≥0.
- `TauCeti.Crystalline.Completion.lift` (universal-property): For a cochain complex K of abelian groups and cochain maps g_r:K→W_r(M) with Res∘g_(r+1)=g_r for all r, there is a unique cochain map g:K→W(M) with π_r∘g=g_r for all r.
- `TauCeti.Crystalline.Completion.F_coordinate` (compatibility): π_r(F x)=F_r(π_(r+1) x) for x∈W(M)^n and r≥0, where F_r:W_(r+1)(M)→W_r(M) is the map of CR.4/finite-witt-F.
- `TauCeti.Crystalline.Completion.map` (functoriality): A morphism f:M→N of saturated Dieudonné complexes induces a morphism of Dieudonné complexes W(f):W(M)→W(N) with π_r∘W(f)=W_r(f)∘π_r for all r; W(id)=id, W(g∘f)=W(g)∘W(f), and W(f)∘ρ_M=ρ_N∘f.

**Unit tests.**

- `TauCeti.Crystalline.test_completion_W0` (degenerate): W₀M is the zero complex, since V⁰ is identity.
- `TauCeti.Crystalline.test_completion_Z` (computation): For M=Z in degree zero with F=id, V=p, W_rM=Z/p^r and W(M)=Z_p.
- `TauCeti.Crystalline.test_completion_rational` (non-example): For M=Q in degree zero with F=id, V=p is bijective, all W_rM vanish and the completion is zero.

**Uses.** BLM Definition 2.5.4 (CrystallineCohomology:CR.4/strict-dieudonne-complex): M is strict when ρ_M:M→W(M) is an isomorphism BLM Propositions 2.6.2, 2.6.5, 2.7.5 and 2.7.7 (CrystallineCohomology:CR.4/strict-completion): W(M) is saturated and strict, and ρ_M is universal among morphisms from M to strict complexes BLM Proposition 3.5.5 (CrystallineCohomology:CR.4/dieudonne-algebra): the completion of a saturated Dieudonné algebra is a Dieudonné algebra

**Construction or proof.**

1. The denominator is a subcomplex because d²=0.
2. Use FdV=d and FV=p to show F lowers the level.
3. Use Vd=p dV to show V raises the level.
4. Pass the compatible graded maps and the differential to the inverse limit; check naturality under maps of saturated complexes.

**Depends on:** `CR.4/verschiebung-identities`, `CR.4/finite-witt-projection`, `CR.4/finite-witt-restriction`, `CR.4/finite-witt-F`, `CR.4/finite-witt-V`, `CR.4/finite-witt-map`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.5, Construction 2.5.1 (Completion), Remarks 2.5.2 and 2.5.3; arXiv v3 pp.19–20; published p.19 (2.5.1, 2.5.2) and p.20 (2.5.3). Construction 2.5.1 gives W_r(M), Res and W(M); Remark 2.5.2 gives F:W_r→W_(r−1) (written in the node as W_(r+1)→W_r), V:W_r→W_(r+1) and the Dieudonné structure on W(M); Remark 2.5.3 gives functoriality and ρ_M. Nothing is added.

**Acceptance.**

- For M=Z in degree 0 with F=id: W_r(M)=Z/p^r, Res and F are the reduction Z/p^(r+1)→Z/p^r, V is multiplication by p from Z/p^r to Z/p^(r+1), W(M)=Z_p and ρ_M is Z→Z_p.
- For Q in degree 0 with F=id every W_r is 0, so W(Q)=0.
- For T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id every W_r(T) is 0, because V_0=id.

### strict-dieudonne-complex — Strict Dieudonné complexes

**Definition:** `TauCeti.Crystalline.IsStrict`. A Dieudonné complex M is strict if it is saturated and the canonical map ρ_M:M→W(M) to its completion is an isomorphism of Dieudonné complexes; equivalently, M is saturated and ρ_M:M^n→W(M)^n=lim_r M^n/N_r^n is bijective for every integer n. DC_str is the full subcategory of DC on the strict Dieudonné complexes.

**Hypotheses and conventions.**

- p is a prime; M is a Dieudonné complex. The completion W(M) and the map ρ_M are defined for saturated M, so saturation is part of the definition.

**API.**

- `TauCeti.Crystalline.IsStrict.unit_bijective` (characterisation): A saturated Dieudonné complex M is strict iff ρ_M:M^n→W(M)^n is bijective for every integer n; equivalently, iff ρ_M is an isomorphism in DC.
- `TauCeti.Crystalline.IsStrict.iff_separated_complete` (characterisation): For saturated M and every integer n, ker(ρ_M) in degree n is ⋂_(r≥0) N_r^n, and ρ_M is surjective in degree n iff every sequence (x_r)_r in M^n with x_(r+1)−x_r∈N_r^n for all r has an x∈M^n with x−x_r∈N_r^n for all r. So M is strict iff every M^n is separated and complete for the filtration (N_r^n)_r.
- `TauCeti.Crystalline.IsStrict.of_iso` (compatibility): If f:M→N is an isomorphism of saturated Dieudonné complexes and M is strict, then N is strict.
- `TauCeti.Crystalline.IsStrict.degreeZero_iff` (example): For an abelian group A with an endomorphism F, the Dieudonné complex with A in degree 0 and zero elsewhere is saturated iff A is p-torsion-free and F is an automorphism; if so, it is strict iff A is p-adically complete, i.e. A→lim_r A/p^rA is an isomorphism (BLM Example 2.5.6).

**Unit tests.**

- `TauCeti.Crystalline.test_strict_Zp` (computation): Z_p in degree 0 with F=id is strict: V=p, W_r=Z_p/p^rZ_p=Z/p^r, and ρ:Z_p→lim_r Z/p^r is an isomorphism.
- `TauCeti.Crystalline.test_strict_Z` (non-example): Z in degree 0 with F=id is saturated and not strict: ρ:Z→W(Z)=Z_p is injective and not surjective.
- `TauCeti.Crystalline.test_strict_Q` (non-example): Q in degree 0 with F=id is saturated and not strict: V=p is bijective, W(Q)=0, and ρ:Q→0 is not injective.
- `TauCeti.Crystalline.test_strict_unit` (computation): For a p-adic unit u, Z_p in degree 0 with F multiplication by u is strict; with F multiplication by p it is not saturated, hence not strict.

**Uses.** BLM Corollary 2.7.6 and Proposition 2.7.7 (CrystallineCohomology:CR.4/strict-completion): W(M) is strict for saturated M, and ρ_M is universal among morphisms from M to strict complexes BLM Definition 4.1.1 (CrystallineCohomology:CR.4/saturated-de-rham-witt): the saturated de Rham–Witt complex of an F_p-algebra is defined by a universal property among strict Dieudonné algebras BLM Theorem 7.3.4 (CrystallineCohomology:CR.4/leta-fixed-point): the category of strict Dieudonné complexes is equivalent to the category of fixed points of Lη_p on the p-complete derived category

**Construction or proof.**

1. For saturated M, ρ_M:M→W(M) is the morphism of Dieudonné complexes of CR.4/verschiebung-completion-tower; strictness is the condition that it is an isomorphism.
2. A morphism of Dieudonné complexes is an isomorphism iff it is bijective in every degree, since the inverse maps then commute with d and F; this gives the degreewise form.
3. In degree n the kernel of ρ_M is the intersection of the N_r^n (CR.4/finite-witt-zero-class), and ρ_M is surjective iff every sequence (x_r) in M^n with x_(r+1)−x_r∈N_r^n has a limit x with x−x_r∈N_r^n for all r; so strictness is separatedness and completeness of each M^n for the filtration (N_r^n)_r.
4. For a p-torsion-free group A in degree 0 with an automorphism F: V=p·F^(−1), N_r^0=p^rA, W_r=A/p^rA, and ρ is A→lim_r A/p^rA (BLM Example 2.5.6).

**Depends on:** `CR.4/saturated-frobenius`, `CR.4/verschiebung-completion-tower`, `CR.4/dieudonne-morphism`, `CR.4/verschiebung-filtration`, `CR.4/finite-witt-zero-class`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.5, Definition 2.5.4; p.20 in arXiv v3 and in the published version. The definition and DC_str are Definition 2.5.4. The degreewise form and the description by separatedness and completeness for the filtration N_r are the node's; that W(M) is strict (Corollary 2.7.6) is in CR.4/strict-completion.; [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.5, Example 2.5.6; p.20 in arXiv v3 and in the published version. The degree-zero example behind IsStrict.degreeZero_iff and the four tests: "these conditions" are that A is p-torsion-free and F is an automorphism, and the canonical map is A→lim A/p^rA.

**Acceptance.**

- Z_p in degree 0 with F=id is strict; Z and Q in degree 0 with F=id are saturated and not strict (W(Z)=Z_p, W(Q)=0).
- For a p-torsion-free group A in degree 0 with an automorphism F, strictness is p-adic completeness of A (BLM Example 2.5.6).

### finite-witt-cohomology — The finite quotients compute cohomology modulo p^r

**Theorem:** `TauCeti.Crystalline.Wcomplex_cohomology`. Let M be a saturated Dieudonné complex and r≥0. (1) For every integer n, x↦F^r x induces an isomorphism of abelian groups θ_r:W_r(M)^n→H^n(M/p^rM), [x]↦[F^r x], natural in M for morphisms of saturated Dieudonné complexes (BLM Proposition 2.7.1). (2) The quotient map M/pM→W_1(M) is a quasi-isomorphism of cochain complexes (BLM Corollary 2.7.2); more generally, M/p^rM→W_r(M) is a quasi-isomorphism for every r≥0 (BLM Remark 2.7.3). (3) For a morphism f:M→N of saturated Dieudonné complexes the following are equivalent: M/pM→N/pN is a quasi-isomorphism; W_1(f):W_1(M)→W_1(N) is an isomorphism of cochain complexes; M/p^rM→N/p^rN is a quasi-isomorphism for every r≥0; W_r(f) is an isomorphism of cochain complexes for every r≥0 (BLM Corollary 2.7.4).

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex; r≥0 and n are integers.
- M/p^rM is the quotient of M by the subcomplex p^rM, and H^n is its cohomology in degree n; the map M/p^rM→W_r(M) exists because p^rM^n⊆N_r^n.

**Uses.** BLM Corollary 2.7.4, Propositions 2.7.5 and 2.8.1 (CrystallineCohomology:CR.4/strict-completion): a morphism of saturated complexes is a quasi-isomorphism modulo p iff it induces isomorphisms on all W_r; this gives W_r(W(M))≅W_r(M) and the quasi-isomorphisms M/p^rM→W(M)/p^rW(M)

**Construction or proof.**

1. θ_r is well defined: d(F^r x)=p^r F^r(dx) by dF=pFd, so F^r x is a cocycle of M/p^rM; and F^rV^r a=p^r a, F^r dV^r b=db by FV=p and FdV=d, so F^r maps N_r^n to coboundaries of M/p^rM. It is natural in M because morphisms of Dieudonné complexes commute with F and induce the maps W_r(f) of CR.4/finite-witt-map.
2. θ_r is surjective: a class of H^n(M/p^rM) is represented by z∈M^n with dz∈p^rM^(n+1), and such z lies in F^r(M^n) by CR.4/iterated-frobenius-divisibility.
3. θ_r is injective: if F^r x=p^r y+dz, then p^r x=V^rF^r x=p^rV^r y+V^r dz=p^r(V^r y+dV^r z) by VF=p and Vd=p dV; cancel p^r, so x∈N_r^n.
4. p^rM^n⊆N_r^n because p^r x=V^rF^r x, so M/p^rM→W_r(M) is defined. It is surjective on H^n: a cocycle of W_r(M) is the class of x∈M^n with dx=V^r y+dV^r z; then dV^r y=0, so dy=F^r dV^r y=0, y=F^r y′ by CR.4/iterated-frobenius-divisibility, V^r y=p^r y′, and x−V^r z is a cocycle of M/p^rM with the same class in W_r(M).
5. It is injective on H^n: if w∈M^n has dw∈p^rM^(n+1) and w=dw′+V^r u+dV^r v, then dV^r u=dw∈p^rM^(n+1), so du=F^r dV^r u∈p^rM^(n+1) and u=F^r u′; hence w=d(w′+V^r v)+p^r u′ is a coboundary of M/p^rM.
6. (3): by (1) and its naturality, W_r(f) is an isomorphism if and only if M/p^rM→N/p^rN is a quasi-isomorphism. The case r=1 implies all r by induction, using the exact sequences 0→M/p^(r−1)M→M/p^rM→M/pM→0 (multiplication by p is injective on M) and the five lemma.

**Depends on:** `CR.4/iterated-frobenius-divisibility`, `CR.4/finite-witt-quotient`, `CR.4/finite-witt-representatives`, `CR.4/finite-witt-zero-class`, `CR.4/finite-witt-differential`, `CR.4/verschiebung-filtration-membership`, `CR.4/dieudonne-dF`, `CR.4/verschiebung-FV`, `CR.4/verschiebung-VF`, `CR.4/verschiebung-FdV`, `CR.4/verschiebung-d`, `CR.4/saturated-p-injective`, `CR.4/finite-witt-map`, `mathlib:HomologicalComplex.homology`, `mathlib:QuasiIso`, `mathlib:HomologicalComplex.d_comp_d`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.7, Proposition 2.7.1 with proof, Corollaries 2.7.2 and 2.7.4, Remark 2.7.3; p.23 in arXiv v3 and in the published version. Statement (1) is Proposition 2.7.1 (the isomorphism is W_r(M)^*→H^*(M^*/p^rM^*)); steps 1–3 are the source's proof. Naturality in M is not stated there; the source uses it in the proof of Corollary 2.7.4.; [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.7, Corollary 2.7.2 (arXiv v3 pp.23–24; published p.24) and Remark 2.7.3 (p.24 in both versions). Statement (2) for r=1 is Corollary 2.7.2 and for general r is Remark 2.7.3. Steps 4–5 are the direct argument of Remark 2.7.3; the source proves Corollary 2.7.2 instead from Proposition 2.4.5 and the isomorphism α_F.

**Acceptance.**

- For M=Z in degree 0 with F=id: W_r(M)^0=Z/p^r=H^0(Z/p^r), θ_r is the identity, and Z/p^r→W_r(M) is an isomorphism.
- For T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id: W_r(T)=0, and T/p^rT=[Z/p^r --id--> Z/p^r] is acyclic.
- For Q in degree 0 with F=id: W_r(Q)=0=H^*(Q/p^rQ).

### strict-dieudonne-tower — Strict Dieudonné towers

**Definition:** `TauCeti.Crystalline.StrictDieudonneTower`. A strict Dieudonné tower is an inverse system ⋯→X_3→X_2→X_1→X_0 of cochain complexes of abelian groups, with transition maps R:X_(r+1)→X_r, equipped with maps of graded abelian groups F:X_(r+1)→X_r and V:X_r→X_(r+1) for every r≥0, such that: (1) X_0=0; (2) R:X_(r+1)→X_r is surjective for every r≥0; (3) F:X_(r+1)→X_r satisfies dF=pFd for every r≥0; (4) F, R and V commute with each other; (5) F(V(x))=p·x=V(F(x)) for every x∈X_r; (6) every x∈X_r such that dx is divisible by p lies in the image of F:X_(r+1)→X_r; (7) the kernel of R:X_(r+1)→X_r is the subgroup X_(r+1)[p] of elements x with p·x=0; (8) the kernel of R:X_(r+1)→X_r is the span of the images of V^r:X_1→X_(r+1) and dV^r:X_1→X_(r+1). A morphism of strict Dieudonné towers is a morphism of towers of cochain complexes compatible with F and V; TD denotes the category of strict Dieudonné towers. (a) For a saturated Dieudonné complex M, the tower (W_r(M))_(r≥0) with the maps Res, F and V of CR.4/verschiebung-completion-tower is a strict Dieudonné tower. (b) For a strict Dieudonné tower (X_r), the inverse limit X=lim_r X_r, with F the inverse limit of the maps F:X_(r+1)→X_r, is a saturated Dieudonné complex; for every r≥0 the projection X→X_r induces an isomorphism of cochain complexes W_r(X)=X/(im V^r+im dV^r)≅X_r; these isomorphisms form an isomorphism of strict Dieudonné towers (W_r(X))_r≅(X_r)_r; and X is a strict Dieudonné complex. (c) The functor M↦(W_r(M))_(r≥0) from the category DC_str of strict Dieudonné complexes to TD is an equivalence of categories, with inverse (X_r)_(r≥0)↦lim_r X_r.

**Hypotheses and conventions.**

- p is a prime. Cochain complexes are complexes of abelian groups graded by all integers, as in CR.4/dieudonne-complex. The maps R are maps of cochain complexes; F and V are additive and preserve the degree, and are not assumed to commute with d.
- The index r runs over all integers r≥0 in axioms (2), (3), (6), (7), (8). In (5), F(V(x))=p·x holds in X_r for r≥0 and V(F(x))=p·x holds in X_r for r≥1. In (4): R∘F=F∘R as maps X_(r+2)→X_r, R∘V=V∘R as maps X_(r+1)→X_(r+1), and F∘V=V∘F as maps X_(r+1)→X_(r+1). In (8), V^r:X_1^n→X_(r+1)^n and d∘V^r:X_1^(n−1)→X_(r+1)^n, and the span is taken in each degree n.
- In (a), M is a saturated Dieudonné complex. In (b), W_r(X) is formed with the Verschiebung of the saturated complex X, which is the inverse limit of the maps V:X_r→X_(r+1). In (c), DC_str is the full subcategory of strict Dieudonné complexes in the category of Dieudonné complexes.

**API.**

- `TauCeti.Crystalline.StrictDieudonneTower.ofSaturated` (constructor): For a saturated Dieudonné complex M, the complexes W_r(M) (r≥0) with Res:W_(r+1)(M)→W_r(M), F:W_(r+1)(M)→W_r(M) and V:W_r(M)→W_(r+1)(M) form a strict Dieudonné tower (BLM Proposition 2.6.2).
- `TauCeti.Crystalline.StrictDieudonneTower.limit` (constructor): For a strict Dieudonné tower X, the inverse limit lim_r X_r with (Fx)_r=F(x_(r+1)) is a saturated Dieudonné complex, and its Verschiebung is given by (Vx)_(r+1)=V(x_r), (Vx)_0=0 (BLM Proposition 2.6.5).
- `TauCeti.Crystalline.StrictDieudonneTower.limitWIso` (characterisation): For a strict Dieudonné tower X and every r≥0, the projection lim_s X_s→X_r is surjective with kernel im V^r+im dV^r; so it induces an isomorphism of cochain complexes W_r(lim_s X_s)≅X_r, and these isomorphisms commute with R, F and V (BLM Proposition 2.9.1, Corollary 2.9.2).
- `TauCeti.Crystalline.StrictDieudonneTower.limit_isStrict` (compatibility): For a strict Dieudonné tower X, lim_r X_r is a strict Dieudonné complex in the sense of CR.4/strict-dieudonne-complex (BLM Corollary 2.9.3).
- `TauCeti.Crystalline.StrictDieudonneTower.Hom` (functoriality): A morphism X→Y of strict Dieudonné towers is a family of maps of cochain complexes f_r:X_r→Y_r with R∘f_(r+1)=f_r∘R, F∘f_(r+1)=f_r∘F and V∘f_r=f_(r+1)∘V. It induces a morphism of Dieudonné complexes lim f:lim_r X_r→lim_r Y_r, with lim(id)=id and lim(g∘f)=lim(g)∘lim(f); a morphism f:M→N of saturated Dieudonné complexes induces the morphism (W_r(f))_r of towers, compatibly with identities and composition.
- `TauCeti.Crystalline.StrictDieudonneTower.equivalence` (equivalence): M↦(W_r(M))_r, from strict Dieudonné complexes to strict Dieudonné towers, and X↦lim_r X_r are inverse equivalences of categories: ρ_M:M→lim_r W_r(M) is a natural isomorphism for strict M, and W_r(lim_s X_s)≅X_r is a natural isomorphism of towers (BLM Corollary 2.9.4).
- `TauCeti.Crystalline.StrictDieudonneTower.relations` (relation): In a strict Dieudonné tower: p^r·X_r=0 for every r≥0 (by (1) and (7), by induction on r); and V∘d=p·d∘V:X_r^n→X_(r+1)^(n+1) and F∘d∘V=d:X_r^n→X_r^(n+1). The last two are not axioms; they follow from X_r≅W_r(lim X) and the identities Vd=p·dV, FdV=d on the saturated complex lim X.

**Unit tests.**

- `TauCeti.Crystalline.test_tower_Zp` (computation): The tower of Z_p (degree 0, F=id) is X_r=Z/p^r with R and F the projections Z/p^(r+1)→Z/p^r and V multiplication by p, Z/p^r→Z/p^(r+1). It satisfies the eight axioms: ker(R:X_(r+1)→X_r)=p^r·Z/p^(r+1)=X_(r+1)[p]=V^r(X_1), and F is surjective. Its limit is Z_p with F=id and V=p.
- `TauCeti.Crystalline.test_tower_constant_Fp` (non-example): Let X_0=0 and X_r=F_p in degree 0 for r≥1, with R:X_(r+1)→X_r and F:X_(r+1)→X_r the identity for r≥1 and zero for r=0, and V=0. Axioms (1)–(6) and (8) hold, and (7) fails: for r≥1, ker(R:X_(r+1)→X_r)=0 and X_(r+1)[p]=F_p. The limit F_p is not p-torsion-free.
- `TauCeti.Crystalline.test_tower_rational` (degenerate): The zero tower (X_r=0 for all r) is a strict Dieudonné tower with limit 0. It is the tower of the saturated complex Q (degree 0, F=id), for which V=p is bijective and W_r(Q)=0; so lim_r W_r(M)≅M fails for the non-strict saturated complex M=Q.
- `TauCeti.Crystalline.test_tower_localization` (compatibility): The saturated complexes Z_(p) and Z_p (degree 0, F=id) have the same tower (Z/p^r)_r, and its limit Z_p is the completion W(Z_(p)) of CR.4/verschiebung-completion-tower; for a saturated M, lim_r of the tower (W_r(M))_r is W(M).
- `TauCeti.Crystalline.test_tower_free` (computation): Let X_r⁰=⊕_(m≥0)(Z/p^r)·e_m ⊕ ⊕_(0<n<r)(Z/p^(r−n))·v_n and X_r¹=⊕_(m≥0)(Z/p^r)·f_m ⊕ ⊕_(0<n<r)(Z/p^(r−n))·w_n, with d(e_m)=p^m·f_m, d(v_n)=w_n, R the projections, F(e_m)=e_(m+1), F(v_n)=p·v_(n−1), F(f_m)=f_(m+1), F(w_n)=w_(n−1), V(e_m)=p·e_(m−1) for m≥1, V(e_0)=v_1, V(v_n)=v_(n+1), V(f_m)=p·f_(m−1) for m≥1, V(f_0)=p·w_1, V(w_n)=p·w_(n+1), where v_0=e_0 and w_0=f_0. This is a strict Dieudonné tower with nonzero differential (d(e_0)=f_0 in X_1); it is the tower of the free strict Dieudonné complex on x=e_0 of BLM Example 2.5.7, with e_m=F^m x, v_n=V^n x, f_m=F^m dx, w_n=dV^n x.

**Uses.** BLM §5.5, proof of Theorem 5.3.4 (CrystallineCohomology:CR.4/witt-localization-descent): the tower 𝒲_n(A)^*⊗_(W_n(R))W_n(S) is shown to satisfy the eight axioms, and its limit is the V-adically étale strict Dieudonné algebra over A whose n-th quotient is the n-th term of the tower BLM §2.7, opening paragraph (CrystallineCohomology:CR.4/strict-completion): for a saturated M the completion W(M)=lim_r W_r(M) is again saturated, by Propositions 2.6.2 and 2.6.5 BLM Corollary 2.9.4: a strict Dieudonné complex is the same thing as the tower of its quotients W_r; constructions made level by level (tensor products with W_r of an étale algebra) produce strict Dieudonné complexes

**Construction or proof.**

1. (a) (BLM Proposition 2.6.2). Axioms (1)–(4) hold by the construction of W_r(M), Res, F and V (CR.4/verschiebung-completion-tower): W_0(M)=0, Res is surjective, dF=pFd, and all maps are induced by the identity, F and V of M. Axiom (5) is CR.4/finite-witt-FV and CR.4/finite-witt-VF. Axiom (8) holds because the kernel of Res:W_(r+1)(M)→W_r(M) is (im V^r+im dV^r)/(im V^(r+1)+im dV^(r+1)), the image of W_1(M) under V^r and dV^r. Axiom (6) is CR.4/finite-witt-F-lifting and axiom (7) is CR.4/finite-witt-restriction-kernel (BLM Lemmas 2.6.3, 2.6.4). A morphism of saturated Dieudonné complexes induces a morphism of towers (CR.4/finite-witt-map).
2. (b), saturation (BLM Proposition 2.6.5). Write x∈X as a compatible family (x_r), with (Fx)_r=F(x_(r+1)). By (3), dF=pFd on X. If p·x=0 then p·x_r=0, so x_(r−1)=R(x_r)=0 by (7), for every r; hence X is p-torsion-free. The inverse limit of the maps V, (Vx)_(r+1)=V(x_r), satisfies FV=VF=p by (5), so F is injective. If dx∈pX, choose by (6) elements y_(r+1)∈X_(r+1) with F(y_(r+1))=x_r; then R(y_(r+1))−y_r is killed by F, hence by p=VF, hence by R, by (7); so (R(y_(r+1)))_r is a compatible family y with Fy=x. Thus X is saturated (CR.4/saturated-frobenius), and its Verschiebung, the unique map with FV=p (CR.4/verschiebung-identities), is the inverse limit of the maps V.
3. (b), finite levels (BLM Proposition 2.9.1, Corollary 2.9.2). The projection θ:X→X_r is surjective by (2). Its kernel contains im V^r+im dV^r, because (V^r y)_r=V^r(y_0) and X_0=0. Conversely let x∈ker θ, written (x_k∈X_(r+k))_(k≥0) with x_0=0; one constructs compatible y_k, z_k∈X_k with x_k=V^r(y_k)+dV^r(z_k) by induction on k: lift y_(k−1), z_(k−1) to ȳ_k, z̄_k∈X_k by (2); then e=x_k−V^r(ȳ_k)−dV^r(z̄_k) lies in the kernel of R:X_(r+k)→X_(r+k−1), so e=V^(r+k−1)(e′)+dV^(r+k−1)(e″) with e′, e″∈X_1 by (8); put y_k=ȳ_k+V^(k−1)(e′) and z_k=z̄_k+V^(k−1)(e″), which still lift y_(k−1), z_(k−1) because R∘V^(k−1) vanishes on X_1. The resulting isomorphisms W_r(X)≅X_r commute with R, F and V, since these are computed on compatible families.
4. (b), strictness (BLM Corollary 2.9.3). Under the isomorphisms W_r(X)≅X_r the canonical map ρ_X:X→W(X)=lim_r W_r(X) becomes the identity of lim_r X_r, so ρ_X is an isomorphism and X is strict (CR.4/strict-dieudonne-complex). The source argues through Corollary 2.9.2 and the strictness of W(M) for saturated M (BLM Corollary 2.7.6).
5. (c) (BLM Corollary 2.9.4). Both constructions are functorial: a morphism of towers induces a map of the limits commuting with d and F, and a morphism of Dieudonné complexes between strict complexes induces a morphism of towers (CR.4/dieudonne-morphism, CR.4/finite-witt-map). For strict M the map ρ_M:M→lim_r W_r(M) is an isomorphism by definition, and for a tower the maps W_r(lim X)→X_r are isomorphisms by the third step; both are natural, which gives the equivalence.

**Depends on:** `CR.4/dieudonne-complex`, `CR.4/saturated-frobenius`, `CR.4/dieudonne-morphism`, `CR.4/verschiebung-identities`, `CR.4/verschiebung-completion-tower`, `CR.4/finite-witt-FV`, `CR.4/finite-witt-VF`, `CR.4/finite-witt-F-lifting`, `CR.4/finite-witt-restriction-kernel`, `CR.4/finite-witt-map`, `CR.4/strict-dieudonne-complex`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.6, Definition 2.6.1, p.21. The definition, the eight axioms and the category TD are Definition 2.6.1, transcribed axiom by axiom with the printed indexing; the hypotheses spell out which composites axiom (4) concerns. The source does not list Vd=p·dV or FdV=d among the axioms; the API item relations derives them.; [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.6, Proposition 2.6.2 with proof (Lemmas 2.6.3, 2.6.4), pp.21–22, and Proposition 2.6.5 with proof, pp.22–23. Statement (a) is Proposition 2.6.2 and the first assertion of (b) is Proposition 2.6.5. That the Verschiebung of the limit is the limit of the maps V is not stated there; it is proved in the second proof step and is used silently in the proof of Proposition 2.9.1.; [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.9, Proposition 2.9.1 with proof and Corollaries 2.9.2, 2.9.3, 2.9.4 with proofs, pp.27–28. The remaining assertions of (b) are Proposition 2.9.1 and Corollaries 2.9.2, 2.9.3, and (c) is Corollary 2.9.4. The source proves Corollary 2.9.3 from Corollary 2.7.6; the fourth proof step gives the direct argument. In 'DC_str ↪ DC → TD' the second functor is defined on saturated complexes only.; [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.5, Example 2.5.7 (Free Strict Dieudonné Complexes), pp.20–21. The example behind the third acceptance item and test_tower_free. The source gives M⁰, M¹, d and the rules FdV=d, FV=p; the quotients W_r(M) and the verification of the axioms are computed by the node.

**Acceptance.**

- For M=Z_p in degree 0 with F=id: X_r=Z/p^r, R and F are the projections Z/p^(r+1)→Z/p^r and V:Z/p^r→Z/p^(r+1) is multiplication by p. All eight axioms hold; the kernel of R is p^r·Z/p^(r+1), which is both the p-torsion of X_(r+1) and V^r(X_1); the limit is Z_p with F=id.
- The constant tower X_0=0, X_r=F_p in degree 0 for r≥1, with R=id and F=id between the levels r≥1 and V=0, satisfies axioms (1)–(6) and (8), and not (7): for r≥1 the kernel of R:X_(r+1)→X_r is 0 while X_(r+1)[p]=F_p. Its limit F_p is not p-torsion-free, hence not a saturated Dieudonné complex.
- For the free strict Dieudonné complex on a generator x of degree 0 (BLM Example 2.5.7): X_r⁰=⊕_(m≥0)(Z/p^r)·F^m x ⊕ ⊕_(0<n<r)(Z/p^(r−n))·V^n x and X_r¹=⊕_(m≥0)(Z/p^r)·F^m dx ⊕ ⊕_(0<n<r)(Z/p^(r−n))·dV^n x, with d(F^m x)=p^m·F^m dx and d(V^n x)=dV^n x. For r=1 this is ⊕F_p·F^m x→⊕F_p·F^m dx with d(x)=dx and d(F^m x)=0 for m≥1, and the kernel of R:X_2→X_1 is spanned by p·F^m x, Vx, p·F^m dx and dVx, which is X_2[p] and also V(X_1)+dV(X_1).

### p-bockstein — Bockstein reduction of principal p-décalage

**Construction:** `TauCeti.Crystalline.p_bockstein`. For termwise p-torsion-free M, the connecting map of 0→M/p→M/p²→M/p→0 is β:H^n(M/p)→H^(n+1)(M/p). If dx=py then β([x])=[y]. It squares to zero. The map E_p(M)/pE_p(M)→(H^*(M/p),β), x↦[x], is a natural quasi-isomorphism of cochain complexes.

**Hypotheses and conventions.**

- p is prime and the terms of M are p-torsion-free; the left injection of the short exact sequence is multiplication by p.

**API.**

- `TauCeti.Crystalline.pBockstein_lift` (characterisation): If dx=py then β([x])=[y].
- `TauCeti.Crystalline.pBockstein_square` (relation): β∘β=0 in every degree.
- `TauCeti.Crystalline.pBockstein_decalage` (compatibility): x↦[x] gives E_p(M)/p≃(H^*(M/p),β), naturally in M.

**Unit tests.**

- `TauCeti.Crystalline.test_pBockstein_p` (computation): For [Z --p--> Z], both mod-p cohomology groups are F_p and β:F_p→F_p is the identity.
- `TauCeti.Crystalline.test_pBockstein_p_squared` (non-example): For [Z --p²--> Z], β=0 although the integral differential is nonzero.
- `TauCeti.Crystalline.test_pBockstein_degree_zero` (degenerate): For Z in degree zero, β is zero and E_p/p=F_p in degree zero.

**Uses.** CR.4/cartier-saturation-mod-p and finite-witt-cohomology: Makes the Bockstein differential and the reduction of décalage available on explicit carriers.

**Construction or proof.**

1. Changing a lift x changes y by a boundary or a multiple of p. Since p·dy=d²x=0, dy=0 and β²=0. The formula gives a chain map from E_p/p.
2. It is degreewise surjective: every mod-p cocycle has a lift whose differential lies in pM. Its kernel in degree n consists of classes of dy+pz inside E_p^n modulo pE_p^n.
3. If dy+pz represents a cocycle in that kernel, then d(dy+pz)/p=dz lies in pE_p^(n+1); hence dz∈pM and z∈E_p^n. The term pz is zero in E_p/p. The remaining dy is a boundary in the kernel, represented as d_E(py). Thus the kernel is acyclic.

**Depends on:** `CR.4/principal-p-decalage`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), Construction 2.4.4 and Proposition 2.4.5 with proof, pp.17–18. The reduction map to mod-p cohomology, its Bockstein differential, and the acyclic-kernel proof.

**Acceptance.**

- The target differential is β, not zero.

**Signature component.** The prototype uses the actual quotient of lifted mod-p cocycles by integral boundaries plus p multiples. It types β([x])=[dx/p], its square, the quasi-isomorphism from E_p/p, and the three elementary detectors. An implementation must identify this quotient with the pinned homology object of the mod-p complex; no abstract cohomology carrier is assumed.

### derived-p-decalage — Derived p-décalage and completion

**Construction:** `TauCeti.Crystalline.derived_p_decalage`. The functor E_p on termwise p-torsion-free complexes descends through quasi-isomorphisms to Lη_p:D(Z)→D(Z), and to its enhanced derived category. H^n(Lη_pK)≅H^n(K)/H^n(K)[p]. There is a natural equivalence (Lη_pK)^∧_p≅Lη_p(K^∧_p). In particular Lη_p preserves derived p-completeness. This is an endofunctor, without a claim that it is exact or preserves arbitrary limits.

**Hypotheses and conventions.**

- p is prime; derived p-completion means Rlim_r(K⊗^L_Z Z/p^r).

**API.**

- `TauCeti.Crystalline.derivedPDecalage_model` (compatibility): For a torsion-free model M of K, Lη_pK is represented by E_p(M).
- `TauCeti.Crystalline.derivedPDecalage_cohomology` (equivalence): H^n(Lη_pK)≅H^n(K)/H^n(K)[p], naturally.
- `TauCeti.Crystalline.derivedPDecalage_completion` (compatibility): (Lη_pK)^∧_p≅Lη_p(K^∧_p), naturally in K.

**Unit tests.**

- `TauCeti.Crystalline.test_derivedPDecalage_p` (computation): Lη_p(Z/p[0])=0, computed on [Z --p--> Z] in degrees −1,0.
- `TauCeti.Crystalline.test_derivedPDecalage_p_squared` (computation): H⁰(Lη_p(Z/p²[0]))=Z/p and all other cohomology is zero.
- `TauCeti.Crystalline.test_derivedPDecalage_complete` (compatibility): Lη_p(Z_p[0])=Z_p[0] and its derived p-completion map is an isomorphism.

**Uses.** CR.4/leta-fixed-point: Supplies the enhanced p-complete endofunctor whose fixed points are strict Dieudonné complexes.

**Construction or proof.**

1. Resolve K by a complex of free abelian groups. principal-p-decalage computes cohomology and therefore preserves quasi-isomorphisms between torsion-free models; localize this functor to obtain Lη_p. Enhanced localization gives the enhanced functor, using the E1 derived-category interface.
2. For a free model M, degreewise p-completion represents derived completion. Express E_p(M)^n as the kernel of (d,−p):M^n⊕M^(n+1)→M^(n+1). Its cokernel is killed by p, so completion preserves this kernel by BLM Lemma 7.2.5. Degreewise completion therefore commutes with E_p on free models, proving the natural equivalence.

**Depends on:** `CR.4/principal-p-decalage`, `EnhancedDerivedSheaves:E1`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), Corollaries 7.2.2–7.2.3, p.84; Proposition 7.2.4 and Lemma 7.2.5 with proofs, pp.84–85. Derived descent and compatibility with p-completion; the printed completion typo is corrected by the proof.

**Acceptance.**

- For K=Z/p in degree zero, Lη_pK=0; this functor is not an exact triangulated functor.

### saturation-colimit — Saturation by iterated décalage

**Construction:** `TauCeti.Crystalline.Saturation`. Every Dieudonné complex M* admits a saturation M*→Sat(M*): a map to a saturated complex through which every map to a saturated complex factors uniquely. First quotient by the graded subgroup T* of elements killed by a power of p; on the p-torsion-free quotient take the direct limit of the sequence M*→(η_pM)*→(η_pη_pM)*→⋯ whose transition maps are α_F, η_p(α_F), η_p(η_p(α_F)),… (display (8)). Saturation is left adjoint to the inclusion DC_sat↪DC.

**Hypotheses and conventions.**

- A Dieudonné complex; no initial saturation or p-torsion-freeness assumption.

**API.**

- `TauCeti.Crystalline.Saturation.unit` (constructor): The canonical morphism M→Sat(M) commutes with d and F.
- `TauCeti.Crystalline.Saturation.lift` (universal-property): For every saturated K, composition with the unit bijects Hom(Sat(M),K) with Hom(M,K).
- `TauCeti.Crystalline.Saturation.idempotent` (characterisation): The unit is an isomorphism when M is saturated; hence saturation is idempotent.
- `TauCeti.Crystalline.Saturation.saturated` (characterisation): Sat(M) is a saturated Dieudonné complex, for every Dieudonné complex M.
- `TauCeti.Crystalline.Saturation.isColimit` (characterisation): For termwise p-torsion-free M, Sat(M) is the colimit in cochain complexes of M --α_F--> η_pM --η_p(α_F)--> η_pη_pM --> ⋯, its Frobenius is induced by those of the stages, and the unit M→Sat(M) is the canonical map from the first term.
- `TauCeti.Crystalline.Saturation.map` (functoriality): A morphism f:M→N of Dieudonné complexes induces Sat(f):Sat(M)→Sat(N) with Sat(f)∘unit_M=unit_N∘f, Sat(id)=id and Sat(g∘f)=Sat(g)∘Sat(f).

**Unit tests.**

- `TauCeti.Crystalline.test_saturation_Z_identity` (compatibility): The degree-zero complex Z with F=id is already saturated at each prime p, so its saturation unit is an isomorphism.
- `TauCeti.Crystalline.test_saturation_p_torsion` (degenerate): The degree-zero group Z/p with F=0 has zero saturation because every map to a p-torsionfree group kills it.
- `TauCeti.Crystalline.test_saturation_invert_p` (computation): For Z in degree zero with F multiplication by p, saturation is Z[1/p] in degree zero with the same Frobenius.

**Uses.** BLM Theorem 2.4.2 (CrystallineCohomology:CR.4/cartier-saturation-mod-p): the colimit description of Sat(M) reduces the comparison of M/p with Sat(M)/p to the single map α_F BLM Proposition 3.4.3 (CrystallineCohomology:CR.4/dieudonne-algebra): the saturation of a Dieudonné algebra, formed in Dieudonné complexes, is again a Dieudonné algebra BLM Notation 2.8.4 (CrystallineCohomology:CR.4/strict-completion): W Sat(M), the completion of the saturation, is left adjoint to the inclusion of strict Dieudonné complexes in DC

**Construction or proof.**

1. Let T⊆M be the graded subgroup of elements killed by a power of p. T is stable under d and F, M/T is termwise p-torsion-free, and every morphism from M to a saturated (hence p-torsion-free) complex kills T; so a saturation of M/T is a saturation of M.
2. For termwise p-torsion-free M form M→η_pM→η_pη_pM→⋯ with maps α_F, η_p(α_F), η_p(η_p(α_F)),…, using CrystallineCohomology:CR.4/principal-p-decalage and AI.1/principal-map for (Z,p). Each η_p^kM is termwise p-torsion-free and is a Dieudonné complex with α=η_p^k(α_F).
3. Let N be the colimit of the sequence. Since η_p commutes with filtered colimits of termwise p-torsion-free complexes (CrystallineCohomology:CR.4/derived-p-decalage), η_pN is the colimit of the shifted sequence and α_N:N→η_pN is the induced isomorphism; so N is saturated.
4. Universal property: for a morphism f:M→K with K saturated, α_K^(−1)∘η_p(f):η_pM→K is a morphism of Dieudonné complexes extending f along α_F, and it is the only one, because a morphism g with g∘α_F=f satisfies α_K∘g=η_p(g)∘η_p(α_F)=η_p(f). Apply this at every stage and pass to the colimit.
5. The adjunction of Corollary 2.3.2 restates the universal property.

**Depends on:** `CR.4/saturated-frobenius`, `CR.4/dieudonne-morphism`, `CR.4/principal-p-decalage`, `CR.4/derived-p-decalage`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.3, definition of a saturation with display (7), Proposition 2.3.1 with proof and display (8), Corollary 2.3.2; arXiv v3 p.15; published pp.15–16. The node takes the universal property (7), the reduction to M/T, the sequence (8) and the adjunction of Corollary 2.3.2. The source's proof is this one sentence; the checks behind the reduction to M/T and the verification of the universal property stage by stage are the node's.

**Acceptance.**

- Sat of Z in degree 0 with F=p is Z[1/p] with F=p: the sequence is Z --p--> Z --p--> ⋯.
- Sat of Z/p in degree 0 (any F) is 0, and the unit M→Sat(M) is an isomorphism for saturated M, e.g. Z in degree 0 with F=id.
- The unit need not be a quasi-isomorphism: for Z in degree 0 with F=p it is Z→Z[1/p].

### cartier-saturation-mod-p — Cartier criterion for saturation

**Theorem:** `TauCeti.Crystalline.cartier_saturation_mod_p`. If M is a termwise p-torsion-free Dieudonné complex and F induces an isomorphism of graded groups M/p→H*(M/p), then M/p→Sat(M)/p is a quasi-isomorphism.

**Hypotheses and conventions.**

- p is a prime; M is a Dieudonné complex of Cartier type (BLM Definition 2.4.1): M is termwise p-torsion-free, and x↦[Fx] induces an isomorphism of graded abelian groups M/pM→H^*(M/pM).

**Uses.** BLM Corollary 2.8.5 (CrystallineCohomology:CR.4/strict-completion): for a Cartier-type complex with p-adically complete terms, M→W Sat(M) is a quasi-isomorphism BLM Corollary 3.3.8: applied to the completed de Rham complex of a p-torsion-free lift with a Frobenius lift

**Construction or proof.**

1. Bockstein comparison (BLM Proposition 2.4.5): for termwise p-torsion-free M, γ:(η_pM)/p→(H^*(M/pM),β), γ(x)=[p^(−k)x] for x∈(η_pM)^k, is a quasi-isomorphism of cochain complexes, natural in M. This is CrystallineCohomology:CR.4/p-bockstein for the one-point topos with O=Z and I=(p): η_pM is p-torsion-free, so (η_pM)/p represents the derived reduction, and trivialising (p)^(⊗k) by p^k identifies B_(p)(M) with (H^*(M/pM),β).
2. A map of termwise p-torsion-free complexes that is a quasi-isomorphism modulo p stays so after η_p (BLM Corollary 2.4.6): it induces an isomorphism on the Bockstein complexes.
3. Factor the Cartier map through α_F:M/p→(η_pM)/p; the triangle commutes because γ(α_F(x))=[Fx]. The Bockstein comparison and two-out-of-three make α_F a quasi-isomorphism modulo p.
4. Apply η_p repeatedly: the k-th map of the sequence defining Sat(M) is η_p^k(α_F), a quasi-isomorphism modulo p by step 2.
5. Passing from the stages (η_p^k M)/p to Sat(M)/p uses that cohomology and reduction modulo p commute with filtered colimits.

**Depends on:** `CR.4/saturation-colimit`, `CR.4/p-bockstein`, `CR.4/principal-p-decalage`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.4, Definition 2.4.1, Theorem 2.4.2 (Cartier Criterion), Construction 2.4.4, Proposition 2.4.5, Corollary 2.4.6 and proof of Theorem 2.4.2; arXiv v3 pp.16–18; published pp.17–19. The sentence continues "quasi-isomorphism of cochain complexes M^*/pM^*→Sat(M^*)/pSat(M^*)". The statement is Theorem 2.4.2 with the two conditions of Definition 2.4.1 written out; steps 1–4 are Proposition 2.4.5, Corollary 2.4.6 and the source's proof; step 5 is implicit in the source.

**Acceptance.**

- For R=Z[x] with φ(x)=x^p, the p-completed de Rham complex of R with F(x^i dx)=x^(ip+p−1)dx is of Cartier type (BLM Corollary 3.3.8(1), by the Cartier isomorphism for F_p[x]); so Ω^*_(F_p[x])→Sat/p is a quasi-isomorphism.
- For Z in degree 0 with F=id (Cartier type, already saturated) the map M/p→Sat(M)/p is the identity of F_p.
- The hypothesis is needed: for Z in degree 0 with F=p the map M/p→H^0(M/p) is zero, and M/p=F_p→Sat(M)/p=Z[1/p]/p=0 is not a quasi-isomorphism.

### strict-completion — Strict completion and its adjunction

**Theorem:** `TauCeti.Crystalline.strictCompletion`. For a saturated Dieudonné complex M, W(M)=lim_r W_r(M) is saturated, W_r(M)→W_r(W(M)) is an isomorphism for every r, and the canonical map ρ_M:M→W(M) is universal for maps from M to strict complexes. Strict means precisely that ρ_M is an isomorphism; W(M) is strict, and W is left adjoint to the inclusion of strict into saturated Dieudonné complexes. Each W(M)^n is p-adically complete, M/p^rM→W(M)/p^rW(M) is a quasi-isomorphism for every r, and ρ_M exhibits W(M) as the derived p-completion of M. For a Dieudonné complex M of Cartier type (termwise p-torsion-free, with F inducing an isomorphism M/pM→H^*(M/pM)), M→W(Sat M) exhibits W(Sat M) as the derived p-completion of M; if moreover every M^n is p-adically complete, this map is a quasi-isomorphism.

**Hypotheses and conventions.**

- p is a prime.
- M is a saturated Dieudonné complex in all statements about W(M); in the last sentence M is a Dieudonné complex of Cartier type (BLM Definition 2.4.1), which includes termwise p-torsion-freeness.

**Construction or proof.**

1. W(M) is saturated: define F and V on compatible sequences, prove p-torsion-freeness and that x with dx divisible by p lies in the image of F by lifting through the finite levels (CR.4/finite-witt-restriction-kernel, CR.4/finite-witt-F-lifting; BLM Propositions 2.6.2, 2.6.5).
2. F^r induces an isomorphism W_r(M)≅H^*(M/p^rM), so a map of saturated complexes is an isomorphism on all W_r as soon as it is one on W_1 (BLM Proposition 2.7.1, Corollary 2.7.4). For r=1, W_1(M)→W_1(W(M)) is injective and surjective by writing a compatible sequence as x_(m+1)=x_m+V^m y_m+dV^m z_m (BLM Proposition 2.7.5).
3. ρ_(W(M)) coincides with W(ρ_M), which is an isomorphism by the previous step, so W(M) is strict (BLM Corollary 2.7.6). A map M→N to a strict N factors uniquely through W(M): pass to the finite quotients W_r and take the limit (BLM Proposition 2.7.7, Corollary 2.7.8).
4. M/p^r→W(M)/p^r is a quasi-isomorphism by the first two steps (BLM Proposition 2.8.1), and each W(M)^n is an inverse limit of groups killed by p^r, hence p-adically complete; this gives the derived p-completion (BLM Corollary 2.8.2).
5. For M of Cartier type, M/p→Sat(M)/p is a quasi-isomorphism (CR.4/cartier-saturation-mod-p); combine with the previous step for Sat(M); when the M^n are p-adically complete both sides are termwise p-complete and p-torsion-free, so a quasi-isomorphism modulo p is a quasi-isomorphism (BLM Corollary 2.8.5).

**Depends on:** `CR.4/verschiebung-completion-tower`, `CR.4/finite-witt-restriction-kernel`, `CR.4/finite-witt-F-lifting`, `CR.4/cartier-saturation-mod-p`, `CR.4/finite-witt-VF`, `CR.4/finite-witt-p-power`, `CR.4/finite-witt-FV`, `CR.4/strict-dieudonne-complex`, `CR.4/finite-witt-cohomology`, `DerivedDeRhamCohomology:DD.1/derived-completeness`, `DerivedDeRhamCohomology:DD.1/derived-completion`, `DerivedDeRhamCohomology:DD.1/ordinary-quotient-completion`, `CR.4/strict-dieudonne-tower`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.6 (Propositions 2.6.2, 2.6.5), §2.7 (Proposition 2.7.1, Corollary 2.7.4, Proposition 2.7.5, Corollary 2.7.6, Proposition 2.7.7, Corollary 2.7.8), §2.8 (Proposition 2.8.1, Corollaries 2.8.2, 2.8.3), pp.21–27. The node collects these results; each clause about W(M) is one of them, with the printed hypothesis that M is saturated.; [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §2.4 Definition 2.4.1 and §2.8 Corollary 2.8.5, pp.16–17 and 27. The last sentence of the node. The derived-completion clause for Cartier type without completeness is the composite of Theorem 2.4.2 and Corollary 2.8.2 and is not a numbered result of the source.

**Acceptance.**

- For M=Z_(p) in degree 0 with F=id (saturated, V=p): W_r(M)=Z/p^r and W(M)=Z_p, so M is saturated but not strict and M→W(M) is the p-completion.
- For M=Z_p in degree 0 with F=id the map M→W(M) is an isomorphism: M is strict.
- For the p-completed de Rham complex M of Z_p[t] with φ(t)=t^p (Cartier type, termwise p-complete), M→W(Sat M) is a quasi-isomorphism but not an isomorphism: M is not saturated, since d(p·t)∈pM¹ while p·t is not in the image of F (which consists of series in t^p), whereas W(Sat M) is saturated.

### dieudonne-algebra — Dieudonné algebras and multiplicative quotients

**Definition:** `TauCeti.Crystalline.DieudonneAlgebra`. A Dieudonné algebra is a nonnegatively graded commutative differential graded Z-algebra A with x²=0 for every homogeneous odd-degree x (also at p=2), a multiplicative unital graded Frobenius F, dF=pFd, and F(a)≡a^p modulo p in degree 0. Saturated and strict refer to its underlying Dieudonné complex. On a saturated algebra the Verschiebung V (the map with FV=VF=p of CR.4/verschiebung-identities) satisfies x·V(y)=V(F(x)·y); N_r=im V^r+im dV^r is a differential graded ideal, so W_r(A) and W(A) are commutative differential graded algebras, and Sat(A) and W(A) are again Dieudonné algebras, initial among maps from A to saturated, respectively (for saturated A) strict, Dieudonné algebras.

**Hypotheses and conventions.**

- p is a prime; A^n=0 for n<0; x²=0 for every homogeneous x of odd degree, also when p=2.
- F is a homomorphism of graded rings with dF=pFd and F(x)≡x^p mod p for x∈A⁰; F is not a map of complexes.
- The projection formula and the ideal property of im V^r+im dV^r are statements about saturated Dieudonné algebras.

**API.**

- `TauCeti.Crystalline.DieudonneAlgebra.odd_sq` (relation): An odd homogeneous element has square0, even for p=2.
- `TauCeti.Crystalline.DieudonneAlgebra.projection` (relation): x·V(y)=V(F(x)·y) on a saturated algebra.
- `TauCeti.Crystalline.DieudonneAlgebra.W_mul` (compatibility): Finite-quotient projections and restriction preserve products, d and units.
- `TauCeti.Crystalline.DieudonneAlgebra.ofDeRham` (constructor): For a p-torsion-free ring R with a ring endomorphism φ, φ(x)≡x^p mod p: the absolute de Rham complex Ω^*_R with F(x)=φ(x) and F(dx)=x^(p−1)dx+d((φ(x)−x^p)/p) is a Dieudonné algebra; the same holds for the p-completed de Rham complex Ω̂^*_R=lim_n Ω^*_R/p^n (BLM Proposition 3.2.1, Variant 3.3.1).
- `TauCeti.Crystalline.DieudonneAlgebra.ofDeRham_lift` (universal-property): For a p-torsion-free Dieudonné algebra A, restriction to degree 0 is a bijection from maps of Dieudonné algebras Ω^*_R→A to ring maps f:R→A⁰ with f∘φ=F∘f; if A is moreover termwise p-adically complete, the same holds for Ω̂^*_R (BLM Proposition 3.2.3, Variant 3.3.1).
- `TauCeti.Crystalline.DieudonneAlgebra.sat_lift` (universal-property): A→Sat(A) is a map of Dieudonné algebras, and every map from A to a saturated Dieudonné algebra factors uniquely through it (BLM Proposition 3.4.3).
- `TauCeti.Crystalline.DieudonneAlgebra.W_lift` (universal-property): For saturated A, ρ_A:A→W(A) is a map of Dieudonné algebras into a strict one, and every map from A to a strict Dieudonné algebra factors uniquely through it; hence W∘Sat is left adjoint to the inclusion of strict Dieudonné algebras (BLM Propositions 3.5.5, 3.5.8, Corollaries 3.5.9, 3.5.10).

**Unit tests.**

- `TauCeti.Crystalline.test_DA_Zp` (degenerate): Z_p in degree0 with F=id is strict, with V multiplication by p.
- `TauCeti.Crystalline.test_DA_p2_exterior` (non-example): For p=2 every element x of degree 1 of a Dieudonné algebra satisfies x²=0. The graded-commutative F_2-algebra F_2[x] with x in degree 1, d=0 and F=id satisfies all the other axioms and has x²≠0, so it is not a Dieudonné algebra.
- `TauCeti.Crystalline.test_DA_Fd` (computation): For a saturated Dieudonné algebra A and x∈A⁰ with F(x)=x^p: F(dx)=x^(p−1)·dx and d(F(x))=p·F(dx). Example: A=Sat(Ω^*_(Z[t])) with φ(t)=t^p and x=t.

**Uses.** BLM §§3.1,3.3–3.6; CR.4/saturated-de-rham-witt: Adds graded multiplication and the strong odd-square-zero convention to Dieudonné complexes. Projection and quotient-ideal APIs make the finite Verschiebung groups into rings and DGAs.

**Construction or proof.**

1. Definition: a Dieudonné algebra is a commutative algebra object of Dieudonné complexes (tensor product of BLM Remark 2.1.5) with A^n=0 for n<0, F(x)≡x^p mod p on A⁰ and x²=0 for odd x (BLM Definition 3.1.2, Remark 3.1.5).
2. Saturation: after dividing by p-power torsion, η_pA⊂A[1/p] is a subalgebra stable under F and again a Dieudonné algebra (the congruence for η_pA is BLM Remark 3.1.7); Sat(A) is the colimit of A→η_pA→η_pη_pA→⋯ and is the saturation among Dieudonné algebras (BLM Proposition 3.4.3).
3. Projection formula: F(x·V(y))=F(x)·p·y=F(V(F(x)·y)) and F is injective. Then x·V^r(y)=V^r(F^r(x)·y) and (−1)^(deg x)·x·dV^r(y)=d(V^r(F^r(x)·y))−V^r(F^r(dx)·y) show that im V^r+im dV^r is a differential graded ideal (BLM Proposition 3.5.1, Corollary 3.5.2).
4. W(A)=lim_r W_r(A) is a commutative differential graded algebra on which F is a ring map; F(x)≡x^p modulo V W(A)⁰ because W_1(A)≅W_1(W(A)) (CR.4/strict-completion), and for a saturated complex with ring structure the congruence modulo V A⁰ implies the congruence modulo p (BLM Proposition 3.4.2, using Lemma 2.6.3). The universal property of A→W(A) among strict Dieudonné algebras follows from that for complexes (BLM Propositions 3.5.5, 3.5.8).
5. De Rham example: for p-torsion-free R with a ring endomorphism φ, φ(x)=x^p+p·δ(x), the map x↦x^(p−1)dx+dδ(x) is a derivation R→Ω¹_R over φ, so F(x)=φ(x), F(dx)=x^(p−1)dx+dδ(x) extends to a ring endomorphism of Ω^*_R with dF=pFd (BLM Proposition 3.2.1); a map of Dieudonné algebras from Ω^*_R to a p-torsion-free A is determined by f:R→A⁰ and exists exactly when f∘φ=F∘f (BLM Proposition 3.2.3).

**Depends on:** `CR.4/dieudonne-complex`, `CR.4/saturation-colimit`, `CR.4/verschiebung-filtration`, `CR.4/strict-completion`, `mathlib:DirectSum.GRing`, `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex`, `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-universal-property`, `CR.4/verschiebung-identities`, `CR.4/verschiebung-divisibility-lift`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §3.1 (conditions (a)–(c), Remark 3.1.1, Definition 3.1.2, Remarks 3.1.5–3.1.7), §3.2 (Propositions 3.2.1, 3.2.3), §3.4 (Definition 3.4.1, Propositions 3.4.2, 3.4.3), §3.5 (Proposition 3.5.1, Corollary 3.5.2, Propositions 3.5.5, 3.5.8, Definition 3.5.6), pp.29–38. Definition 3.1.2 with conditions (i)–(iii), and condition (b) of §3.1 (x²=0 for odd x); the projection formula and the ideal im V^r+im dV^r are Proposition 3.5.1. The node states nothing beyond these results.

**Acceptance.**

- W(k) in degree 0 with the Witt vector Frobenius is a Dieudonné algebra for every F_p-algebra k; it is saturated, and then strict, exactly when k is perfect (BLM Example 3.1.8).
- For R=Z[t] with φ(t)=t^p, the Dieudonné algebra Ω^*_R has F(dt)=t^(p−1)dt and d(F(t))=p·t^(p−1)dt=p·F(dt).
- For p=2, the graded-commutative F_2-algebra F_2[x] with x in degree 1, d=0 and F=id satisfies dF=pFd and F(a)≡a² in degree 0 but x²≠0; it is not a Dieudonné algebra.

### leta-fixed-point — Strict Dieudonné complexes as décalage fixed points

**Theorem:** `TauCeti.Crystalline.strictDieudonneFixedPoint`. Let D(Z)^_p be the full subcategory of derived p-complete objects of D(Z); Lη_p preserves it. Sending a strict Dieudonné complex M to the pair (M,α_F:M≅Lη_pM) is an equivalence from the category of strict Dieudonné complexes to the fixed-point category of Lη_p on D(Z)^_p, whose objects are pairs (X,φ:X≅Lη_pX) and whose morphisms are the maps X→X′ in D(Z) commuting with φ, φ′. The fixed-point ∞-category, defined as the equalizer of the identity and Lη_p on the ∞-category of derived p-complete objects of the derived ∞-category of Z (so that objects carry a specified equivalence and morphisms a specified homotopy), has discrete mapping spaces, and the forgetful functor from it to the ordinary fixed-point category is an equivalence. For strict M, F^r induces isomorphisms W_r(M)≅H^*(M/p^rM), so M=lim_r W_r(M) is recovered from the cohomology of the reductions M⊗^L Z/p^r.

**Hypotheses and conventions.**

- p is a prime; for a p-torsion-free complex M, (η_pM)^n={x∈p^nM^n: dx∈p^(n+1)M^(n+1)} in every integer degree n, and Lη_p is the induced functor on D(Z).
- An object of the fixed-point category is a derived p-complete X with a chosen isomorphism φ:X≅Lη_pX; morphisms commute with the chosen isomorphisms (in the ∞-categorical version, up to a specified homotopy).

**Construction or proof.**

1. Functor: for saturated M, α_F:M→η_pM is an isomorphism of complexes (CR.4/saturated-frobenius); strict complexes are derived p-complete (CR.4/strict-completion); Lη_p preserves derived p-complete objects (BLM Proposition 7.2.4).
2. Full faithfulness: the terms of a strict complex are p-torsion-free and p-adically complete, so maps in D(Z) between strict complexes are chain homotopy classes of chain maps (BLM Proposition 7.1.16). A chain map f with F⁻¹∘f∘F=f+dh+hd is homotopic to the map of Dieudonné complexes f+du+ud, u=Σ_(n≥0)V^n∘h∘F^n, which converges because the target is strict; a map of Dieudonné complexes homotopic to zero has image in dV^r+V^r for every r and so vanishes (BLM Proposition 7.3.6).
3. Essential surjectivity: represent (X,φ) by a complex X^* of free abelian groups and a chain map α:X^*→η_pX^* representing φ; this makes X^* a Dieudonné complex. η_p preserves quasi-isomorphisms of p-torsion-free complexes (BLM Corollary 7.2.2), so X^*→Sat(X^*) is a quasi-isomorphism, and since X is derived p-complete Sat(X^*)→W(Sat X^*) is one too (BLM Corollary 2.8.3).
4. ∞-categorical version: the mapping space between fixed points (X,φ_X), (Y,φ_Y) is the fibre of f−g:Hom(X,Y)→Hom(X,Lη_pY), where f is composition with φ_Y, an equivalence, and g is Lη_p followed by composition with φ_X. Lη_p acts on π_r of mapping spaces by a map divisible by p^r (BLM Proposition 7.5.3, Corollary 7.5.4), and for a derived p-complete abelian group an automorphism plus p times an endomorphism is an automorphism (BLM Lemma 7.5.6). So f−g is an isomorphism on π_r for r>0 and the fibre is discrete, equal to the set of morphisms of the ordinary fixed-point category (BLM Theorem 7.4.7, Corollary 7.4.8).

**Depends on:** `CR.4/dieudonne-complex`, `CR.4/saturated-frobenius`, `CR.4/saturation-colimit`, `CR.4/strict-completion`, `CR.4/derived-p-decalage`, `DerivedDeRhamCohomology:DD.1/derived-completeness`, `DerivedDeRhamCohomology:DD.1/derived-completion`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E0/dg-nerve-mapping-space`, `CR.4/finite-witt-cohomology`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §7.1 Proposition 7.1.16; §7.2 Corollary 7.2.2, Proposition 7.2.4; §7.3 Definition 7.3.1, Theorem 7.3.4 with proof, Proposition 7.3.6; §7.4 Definition 7.4.3, Theorem 7.4.7, Corollary 7.4.8; §7.5 Proposition 7.5.3, Corollary 7.5.4, Lemma 7.5.6 and the proof of Theorem 7.4.7, pp.85–94. Theorem 7.3.4 (ordinary categories) and Theorem 7.4.7 with Corollary 7.4.8 (∞-categories), for p-complete objects. Two misprints in the proofs of Propositions 7.2.4 and 7.5.3 are packet source issues CrystallineCohomology/E508 and E509.

**Acceptance.**

- Z_p in degree 0 with F=id corresponds to the fixed point (Z_p,id:Z_p≅Lη_pZ_p).
- Z/p in degree 0 is derived p-complete but has no fixed-point structure: H⁰(Lη_p(Z/p))=(Z/p)/(Z/p)[p]=0.
- For strict M and N, the set of maps of Dieudonné complexes M→N is π₀ of the mapping space of the fixed-point ∞-category, and the higher homotopy groups of that space vanish.

### witt-structural-identities — Structural identities on the existing p-typical Witt vectors

**Theorem:** `TauCeti.Crystalline.witt_structural_identities`. Use Mathlib WittVector p R and TruncatedWittVector p r R. Restriction R_r:W_(r+1)(R)→W_r(R) and F_r:W_(r+1)(R)→W_r(R) are ring maps, V_r:W_r(R)→W_(r+1)(R) is additive and injective, and Teichmüller is multiplicative. F_rV_r=p and V_r(x)·y=V_r(xF_r(y)); the kernel of restriction W_(r+1)→W_r is V^r(R). For R of characteristic p and r≥1, V_(r−1)F_(r−1)=p on W_r(R); on infinite Witt vectors VF=p. The restriction kernel statement means the image of the r-fold coordinate shift from W_1(R)=R into W_(r+1)(R). If R is reduced of characteristic p, W(R) is p-torsion-free and its Frobenius is injective.

**Hypotheses and conventions.**

- p is prime; the last two assertions need CharP R p and reduced R. No characteristic-p hypothesis is imposed on the general F,V projection identities.

**Construction or proof.**

1. Define the finite-length operators by descending the existing infinite operators along truncation, using their coordinate dependence. Prove equality of Witt vectors by extensionality and universal integral polynomial identities, checked over a torsion-free polynomial ring where ghost coordinates are injective.
2. V is the coordinate shift, so is injective and describes the truncation kernel. In characteristic p, p·x=V(Fx). In a reduced characteristic-p ring coordinate Frobenius is injective; together with V injective this proves p-torsion-freeness.

**Depends on:** `mathlib:WittVector`, `mathlib:TruncatedWittVector`, `mathlib:WittVector.frobenius`, `mathlib:WittVector.verschiebung`, `mathlib:WittVector.teichmuller`, `mathlib:WittVector.frobenius_verschiebung`, `mathlib:WittVector.verschiebung_mul_frobenius`, `mathlib:WittVector.verschiebung_frobenius`, `mathlib:TruncatedWittVector.truncate`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §3.6, proof of Proposition 3.6.2, pp.39–40. Reduced coefficient rings give injective Witt Frobenius and p-torsion-free Witt vectors; the remaining finite-length identities descend the library operators.; [lz-relative](https://www.math.uni-bielefeld.de/~zink/dRW.pdf), Introduction, printed pp.3–5; §1.2, Definition 1.4, printed pp.17–18 (July 2003 manuscript). Operator and length conventions for the relative complex. The coefficient identities themselves are supplied by the pinned Witt-vector declarations listed as prerequisites, with finite-length descent as in proof step 1; the introduction is not a proof of those identities.

**Acceptance.**

- W_0(R)=0; W_1(R)=R; V is injective even when R has p-torsion.
- For R=F_p, V and multiplication by p agree after identifying W(F_p)=Z_p; this agreement is not claimed over an arbitrary Z_(p)-algebra.

### witt-verschiebung-divided-powers — Canonical divided powers on the Verschiebung ideal of W_r(R)

**Construction:** `TauCeti.Crystalline.wittVerschiebungDividedPowers`. Let R be a Z_(p)-algebra and r≥1, and let I_r=V W_(r−1)(R)⊂W_r(R) be the image of Verschiebung, which is the kernel of the projection W_r(R)→R (W_0=0, so I_1=0). Then W_r(R) is a Z_(p)-algebra and I_r carries a divided power structure γ with γ_n(Vξ)=(p^(n−1)/n!)·V(ξ^n) for all ξ∈W_(r−1)(R) and n≥1, where p^(n−1)/n!∈Z_(p). It satisfies n!·γ_n(x)=x^n and (p−1)!·γ_p(Vξ)=p^(p−2)·V(ξ^p). The restriction maps W_(r+1)(R)→W_r(R) and the maps W_r(R)→W_r(R′) induced by a homomorphism R→R′ of Z_(p)-algebras are divided power morphisms. If R is p-torsion-free, γ is the only divided power structure on I_r.

**Hypotheses and conventions.**

- p is a prime; R is a commutative Z_(p)-algebra (every integer prime to p is invertible in R); r≥1.
- W_r(R) is Mathlib's TruncatedWittVector p r R, and V:W_(r−1)(R)→W_r(R) is induced by WittVector.verschiebung (the operator V_p of CrystallineCohomology:CR.4/witt-structural-identities).

**API.**

- `TauCeti.Crystalline.wittVerschiebungIdeal` (data): I_r=V W_(r−1)(R), the ideal of W_r(R) equal to the kernel of W_r(R)→R (for every commutative ring R).
- `TauCeti.Crystalline.wittVerschiebung_pow` (relation): For every commutative ring R, ξ∈W_(r−1)(R) and n≥1: (Vξ)^n=p^(n−1)·V(ξ^n) in W_r(R).
- `TauCeti.Crystalline.wittVerschiebungDividedPowers_dpow` (simp): For a Z_(p)-algebra R: γ_n(Vξ)=(p^(n−1)/n!)·V(ξ^n) for n≥1; in particular (p−1)!·γ_p(Vξ)=p^(p−2)·V(ξ^p).
- `TauCeti.Crystalline.wittVerschiebungDividedPowers_map` (functoriality): The restriction W_(r+1)(R)→W_r(R) and W_r(f):W_r(R)→W_r(R′) for a homomorphism f of Z_(p)-algebras are divided power morphisms (mathlib:DividedPowers.IsDPMorphism).
- `TauCeti.Crystalline.wittVerschiebungDividedPowers_unique` (characterisation): If R is a p-torsion-free Z_(p)-algebra, any divided power structure on I_r equals γ.
- `TauCeti.Crystalline.wittVerschiebungDividedPowers_Fp` (compatibility): Under Z/p^r≅W_r(F_p) (mathlib:TruncatedWittVector.zmodEquivTrunc) the ideal I_r is (p) and γ_n(px)=p^n·x^n/n!, the canonical divided powers on (p).

**Unit tests.**

- `TauCeti.Crystalline.test_wittPD_Fp` (computation): For R=F_p and r=2: W_2(F_p)=Z/p², I_2=(p) and γ_n(p)=p^n/n! in Z/p² for all n≥1; these are the canonical divided powers on (p).
- `TauCeti.Crystalline.test_wittPD_two` (computation): For p=2, in W_2(F_2)=Z/4: γ_2(2)=2, γ_3(2)=0 and γ_(2^k)(2)=2 for every k≥0.
- `TauCeti.Crystalline.test_wittPD_factorial` (characterisation): For a Z_(p)-algebra R, ξ∈W_(r−1)(R) and n≥1: n!·γ_n(Vξ)=(Vξ)^n.
- `TauCeti.Crystalline.test_wittPD_integers` (non-example): For p=3 and R=Z: in W_2(Z)⊂Z×Z (ghost components) (V1)²=3·V(1)=(0,9) is not 2·y for any y∈W_2(Z), so the ideal V W_1(Z) admits no divided power structure.

**Uses.** Langer–Zink §1.1 and §1.3; CR.4/relative-witt-complex, CR.4/relative-de-rham-witt: The relative de Rham–Witt complex is constructed as a quotient of the PD de Rham complex of W_r(R) over W_r(A) for these divided powers, and the differential of every F–V procomplex is a PD derivation for them. Langer–Zink §3.1, Theorem 3.1; CR.4/crystalline-comparison: The crystalline site of a smooth A-scheme over W_r(A) is formed with respect to these divided powers on the kernel of W_r(A)→A.

**Construction or proof.**

1. For every commutative ring R: V(x)·V(y)=V(x·FV(y))=p·V(xy) by the projection formula and FV=p (mathlib:WittVector.verschiebung_mul_frobenius, mathlib:WittVector.frobenius_verschiebung, passed to truncations); hence (Vξ)^n=p^(n−1)·V(ξ^n) for n≥1. V is injective on truncated Witt vectors, so γ_n(Vξ) is well defined; p^(n−1)/n! lies in Z_(p) because v_p(n!)≤(n−1)/(p−1). W_r(R) is a Z_(p)-algebra: for an integer m prime to p, m·V^i(x)=V^i(F^i(m)·x)=V^i(mx), so multiplication by m is bijective on each quotient V^iW_(r−i)(R)/V^(i+1)W_(r−i−1)(R)≅R and hence on W_r(R).
2. p-torsion-free R: the ghost map W_r(R)→R^r is injective, so W_r(R) is torsion-free and embeds in the Q-algebra W_r(R)⊗Q, in which the ideal generated by I_r has the divided powers x^n/n! (mathlib:DividedPowers.RatAlgebra.dividedPowers). Since (Vξ)^n/n!=(p^(n−1)/n!)·V(ξ^n) lies in I_r, this structure restricts to I_r (mathlib:DividedPowers.ofInjective); it is unique because n!·γ_n(x)=x^n in a torsion-free ring.
3. General R: write R=P/𝔞 with P a polynomial algebra over Z_(p). W_r(P)→W_r(R) is surjective with kernel W_r(𝔞), I_r(P) maps onto I_r(R), and W_r(𝔞)∩I_r(P)=V W_(r−1)(𝔞) is stable under the γ_n, because ξ∈W_(r−1)(𝔞) implies ξ^n∈W_(r−1)(𝔞). So γ descends to I_r(R) with the same formula (mathlib:DividedPowers.Quotient.OfSurjective.dividedPowers). The formula shows independence of the presentation and compatibility with restriction and with maps R→R′.

**Depends on:** `CR.4/witt-structural-identities`, `mathlib:TruncatedWittVector`, `mathlib:WittVector.truncate`, `mathlib:WittVector.verschiebung`, `mathlib:WittVector.frobenius_verschiebung`, `mathlib:WittVector.verschiebung_mul_frobenius`, `mathlib:WittVector.ghostComponent`, `mathlib:DividedPowers`, `mathlib:DividedPowers.RatAlgebra.dividedPowers`, `mathlib:DividedPowers.ofInjective`, `mathlib:DividedPowers.Quotient.OfSurjective.dividedPowers`, `CR.0/canonical-p-divided-powers`.

**Sources:** [lz-relative](https://www.math.uni-bielefeld.de/~zink/dRW.pdf), §1.1, paragraph after the proof of Lemma 1.2, printed p.13. The source states the formula γ_n(Vξ)=(p^(n−1)/n!)·V(ξ^n) on V W_(m−1)(S) for an algebra S over a Z_(p)-algebra, with a reference to Grothendieck (Groupes de Barsotti–Tate et cristaux de Dieudonné, p.76) and without proof; the proof steps, uniqueness, functoriality and the examples are added by the node.

**Acceptance.**

- For R=F_p and r=2: W_2(F_p)=Z/p², I_2=(p), V(1)=p and γ_n(p)=p^n/n! in Z/p², the canonical divided powers on (p).
- For p=2: in W_2(F_2)=Z/4 one has γ_(2^k)(2)=2 for every k≥0, so the structure is not nilpotent.
- For p=3 and R=Z (not a Z_(3)-algebra): (V1)²=3·V(1) has ghost components (0,9) and is not twice an element of W_2(Z), so V W_1(Z) has no divided power structure.

### relative-witt-complex — Relative Frobenius–Verschiebung procomplexes

**Definition:** `TauCeti.Crystalline.RelativeWittComplex`. For a map A→R of Z_(p)-algebras, an F–V procomplex for R/A consists of: for each r≥1 a commutative differential graded W_r(A)-algebra P_r=⊕_(n≥0)P_r^n (strictly commutative: x²=0 for x of odd degree); restriction maps R:P_(r+1)→P_r of differential graded algebras; maps F:P_(r+1)→P_r of graded rings; additive maps V:P_r→P_(r+1) of graded groups; and ring maps λ_r:W_r(R)→P_r⁰ compatible with R, F and V on Witt vectors. R commutes with F and V, and the relations are FV=p, FdV=d, Fdλ_(r+1)([x])=λ_r([x])^(p−1)·dλ_r([x]) for x∈R, and V(x·F(y))=V(x)·y. Morphisms are families of maps of differential graded W_r(A)-algebras commuting with R, F, V and λ. Consequently dF=pFd, Vd=p·dV, V(x·dy_1⋯dy_n)=V(x)·dV(y_1)⋯dV(y_n), VF=V(1)· (which is multiplication by p when V(1)=p in W_(r+1)(A), for instance when A is an F_p-algebra, and not in general), and d is a PD derivation for the canonical divided powers on V W_(r−1)(R): dλ(V(ξ^p))=λ(V(ξ^(p−1)))·dλ(V(ξ)).

**Hypotheses and conventions.**

- p is a prime; A is a Z_(p)-algebra and R an A-algebra; p need not be nilpotent in A; r≥1.
- W_r(R) is Mathlib's TruncatedWittVector p r R, which is the ring W_(p^(r−1))(R) of CrystallineCohomology:CR.4/witt-structural-identities; restriction R:W_(r+1)(R)→W_r(R) is TruncatedWittVector.truncate, and F:W_(r+1)(R)→W_r(R), V:W_r(R)→W_(r+1)(R) and the Teichmüller lift [·]:R→W_r(R) are induced from WittVector.frobenius, WittVector.verschiebung and WittVector.teichmuller through WittVector.truncate.
- The differential of P_r is W_r(A)-linear. Commutative differential graded algebras are strictly commutative (BMS1); for p odd this is automatic from graded commutativity, for p=2 it is an axiom. The divided-power property of d is a consequence, not an axiom.

**API.**

- `TauCeti.Crystalline.RelativeWittComplex.FdV` (relation): F_r(d(V_r x))=dx with the correct form degree.
- `TauCeti.Crystalline.RelativeWittComplex.VF` (relation): V_r(F_r y)=V_r(1)·y; p·y follows only under the extra characteristic-p identity.
- `TauCeti.Crystalline.RelativeWittComplex.dlog` (simp): For a unit u, dlog[u]=[u]⁻¹d[u] is closed and F(dlog[u])=dlog[u].
- `TauCeti.Crystalline.finiteWittF` (data): F:W_(r+1)(R)→W_r(R), x↦truncate_r(frobenius(x̃)) for any lift x̃∈W(R) of x; it is independent of the lift, a ring homomorphism, commutes with restriction, and is the operator F_p of CrystallineCohomology:CR.4/witt-structural-identities under W_(p^r)(R)≅TruncatedWittVector p (r+1) R.
- `TauCeti.Crystalline.finiteWittV` (data): V:W_r(R)→W_(r+1)(R), x↦truncate_(r+1)(verschiebung(x̃)); it is independent of the lift, additive and injective, commutes with restriction, and satisfies F(V(x))=p·x and V(x·F(y))=V(x)·y for x∈W_r(R), y∈W_(r+1)(R).
- `TauCeti.Crystalline.finiteTeich` (data): [·]:R→W_r(R), the truncation of the Teichmüller lift; it is multiplicative, commutes with restriction, and F([x])=[x]^p=[x^p].
- `TauCeti.Crystalline.RelativeWittComplex.d_F` (relation): d(F(x))=p·F(dx) for x∈P_(r+1).
- `TauCeti.Crystalline.RelativeWittComplex.V_d` (relation): V(dx)=p·dV(x) and V(x·dy_1⋯dy_n)=V(x)·dV(y_1)⋯dV(y_n) for x, y_i∈P_r.
- `TauCeti.Crystalline.RelativeWittComplex.d_pd` (relation): dλ(V(ξ^p))=λ(V(ξ^(p−1)))·dλ(V(ξ)) for ξ∈W_r(R); hence d∘λ_(r+1):W_(r+1)(R)→P_(r+1)¹ is a PD derivation over W_(r+1)(A) for the canonical divided powers on V W_r(R) (CR.4/witt-verschiebung-divided-powers).

**Unit tests.**

- `TauCeti.Crystalline.test_relativeWitt_units` (computation): On A[t,t⁻¹], dlog[t] is a closed degree-one form fixed by graded F.
- `TauCeti.Crystalline.test_relativeWitt_V1` (non-example): Over A=Z/p², V(1) and p differ in W_2(A): the Witt coordinate of index 0 of V(1) is 0 and that of p is p≠0; so V∘F=V(1)· is not multiplication by p.
- `TauCeti.Crystalline.test_relativeWitt_constant` (degenerate): For every Z_(p)-algebra A, the tower {W_r(A)}_r placed in degree 0, with d=0, λ=id and the Witt vector F, V and restriction, is an F–V procomplex for A/A; if A is an F_p-algebra then VF=FV=p on it.

**Uses.** Langer–Zink §1.2; BMS1 §10.2; CR.4/relative-de-rham-witt: Specifies the finite Witt coefficient rings and the R, F, V identities, especially FdV=d and VF=V(1)·, so that the initial relative complex has the correct base variance. BMS1 §11.1 (Proposition 11.5); AInfCohomology:AI.4: A tower of cohomology groups with Bockstein differential is shown to be an F–V procomplex and then receives a map from the initial one; the axioms are therefore limited to those of BMS1 Definition 10.5.

**Construction or proof.**

1. The data and relations are those of BMS1 Definition 10.5 for a Z_(p)-algebra A; Langer–Zink Definition 1.4 is the same with graded commutativity in place of strict commutativity and with the restriction maps as the transition maps of a projective system.
2. Consequences: V(x·dy)=V(x·FdV(y))=V(x)·dV(y) by FdV=d and the projection formula; V(dx)=V(1)·dV(x)=p·dV(x) since d is W_r(A)-linear and V(1)·V(x)=V(FV(1)·x)=p·V(x); VF(x)=V(1·F(x))=V(1)·x; d(Fx)=FdV(Fx)=Fd(V(1)·x)=FV(1)·F(dx)=p·F(dx) (Langer–Zink (1.16)–(1.19)).
3. PD property: dV(ξ^p)=V(ξ^(p−1))·dV(ξ) is proved for ξ=[x], then for sums, then for ξ=V(η) (Langer–Zink Lemma 1.5). With (p−1)!·γ_p(Vξ)=p^(p−2)·V(ξ^p) from CR.4/witt-verschiebung-divided-powers this says d(γ_p(Vξ))=γ_(p−1)(Vξ)·d(Vξ), and over a Z_(p)-algebra a derivation with this property is a PD derivation (Langer–Zink Lemma 1.2).

**Depends on:** `CR.1/pd-differentials`, `CR.4/witt-verschiebung-divided-powers`, `CR.4/witt-structural-identities`, `mathlib:TruncatedWittVector`, `mathlib:TruncatedWittVector.truncate`, `mathlib:WittVector.truncate`, `mathlib:WittVector.frobenius`, `mathlib:WittVector.verschiebung`, `mathlib:WittVector.teichmuller`, `mathlib:WittVector.frobenius_verschiebung`, `mathlib:WittVector.verschiebung_mul_frobenius`, `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex`.

**Sources:** [lz-relative](https://www.math.uni-bielefeld.de/~zink/dRW.pdf), §1.2, Definition 1.4, consequences (1.16)–(1.22) and Lemma 1.5, printed pp.17–20. Langer–Zink's definition (base R, algebra S) with the relations FV=p, FdV=d, Fd[x]=[x^(p−1)]d[x], V(ωFη)=(Vω)η, and the derived relations. The node adds BMS1's strict commutativity and explicit restriction maps. The manuscript prints FdVω=ω for FdVω=dω in (1.27) (packet source issue CrystallineCohomology/E506) and W(S) for W_n(S) in Definition 1.4 (i).; [bms1](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §10.2, Definition 10.5 and Remark 10.6, p.81. The data (i)–(v) and the identities for an arbitrary Z_(p)-algebra A; BMS1's 'commutative differential graded algebra' includes x²=0 for odd x (used on p.88). The node follows this convention.

**Acceptance.**

- In every F–V procomplex dF=pFd, Vd=p·dV and VF=V(1)·; over A=Z/p², V(1)≠p in W_2(A): their Witt coordinates of index 0 are 0 and p.
- For a unit u of R and dlog[u]=[u]⁻¹·d[u]: F(dlog[u])=dlog[u] and d(dlog[u])=0; on the torus R=A[t,t⁻¹] this applies to u=t.
- For every Z_(p)-algebra A the tower {W_r(A)}_r placed in degree 0 (d=0, λ=id, Witt F, V, R) is an F–V procomplex for A/A.

### relative-de-rham-witt — Initial relative de Rham–Witt complex

**Construction:** `TauCeti.Crystalline.relativeDRW`. For any map A→R of Z_(p)-algebras, the category of F–V procomplexes for R/A has an initial object {W_rΩ^*_(R/A)}_(r≥1), the relative de Rham–Witt complex. Its degree-zero ring is W_r(R) (λ_r is the identity), its length-one term is the de Rham complex Ω^*_(R/A), and its differential is W_r(A)-linear. For every r the map of differential graded algebras from the PD de Rham complex Ω̆^*_(W_r(R)/W_r(A)) (for the canonical divided powers on V W_(r−1)(R)) to W_rΩ^*_(R/A) is surjective; hence the restriction maps W_(r+1)Ω^q_(R/A)→W_rΩ^q_(R/A) are surjective. It is constructed by induction on r: W_(r+1)Ω^* is the quotient of Ω̆^*_(W_(r+1)(R)/W_(r+1)(A)) by the differential graded ideal generated by the elements Σ_l V(ξ_l)·dV(η_(l,1))⋯dV(η_(l,i)) and Σ_l dV(ξ_l)·dV(η_(l,1))⋯dV(η_(l,i)) for every relation Σ_l ξ_l·dη_(l,1)⋯dη_(l,i)=0 in W_rΩ^i_(R/A), and then by the differential graded ideal generated by the elements V(ω·F(η))−V(ω)·η.

**Hypotheses and conventions.**

- p is a prime; A is a Z_(p)-algebra and R an arbitrary A-algebra; p need not be nilpotent in A and R need not be smooth over A; r≥1.
- W_r(R), its operators and the notion of F–V procomplex are those of CR.4/relative-witt-complex; the divided powers on V W_(r−1)(R) are those of CR.4/witt-verschiebung-divided-powers.

**API.**

- `TauCeti.Crystalline.relativeDRW_lift` (universal-property): Every F–V procomplex P for R/A receives a unique morphism of F–V procomplexes from {W_rΩ^*_(R/A)}_r (maps of differential graded W_r(A)-algebras commuting with R, F, V and λ).
- `TauCeti.Crystalline.relativeDRW_zero` (equivalence): W_rΩ⁰_(R/A)=W_r(R) and W₁Ω^*_(R/A)=Ω^*_(R/A).
- `TauCeti.Crystalline.relativeDRW_map` (functoriality): A commutative square of ring maps (a:A→A′, f:R→R′ with f∘(A→R)=(A′→R′)∘a, all Z_(p)-algebras) induces maps W_rΩ^*_(R/A)→W_rΩ^*_(R′/A′) of differential graded algebras over W_r(f), equal to W_r(f) in degree 0 and commuting with restriction, F and V.
- `TauCeti.Crystalline.relativeDRW_generated` (characterisation): The map of differential graded algebras Ω^*_(W_r(R)/W_r(A))→W_rΩ^*_(R/A) is surjective (it factors through the PD de Rham complex); hence every element of W_rΩ^q_(R/A) is a sum of elements ξ·dη_1⋯dη_q with ξ, η_i∈W_r(R), and restriction W_(r+1)Ω^q_(R/A)→W_rΩ^q_(R/A) is surjective.
- `TauCeti.Crystalline.relativeDRW_base_quotient` (equivalence): If A→A′ is a surjective map of Z_(p)-algebras and R is an A′-algebra, then W_rΩ^*_(R/A)=W_rΩ^*_(R/A′), because W_r(A)→W_r(A′) is surjective and the two categories of F–V procomplexes coincide.
- `TauCeti.Crystalline.relativeDRW_lift_noRestriction` (universal-property): Let Q be a family of commutative differential graded W_r(A)-algebras Q_r (r≥1) with maps F:Q_(r+1)→Q_r, V:Q_r→Q_(r+1) and λ_r:W_r(R)→Q_r⁰ satisfying all axioms of an F–V procomplex except those involving restriction maps. Then there is a unique family of maps of differential graded algebras W_rΩ^*_(R/A)→Q_r commuting with F, V and λ.

**Unit tests.**

- `TauCeti.Crystalline.test_relativeDRW_identity` (degenerate): For R=A all positive forms vanish and degree0 is W_r(A).
- `TauCeti.Crystalline.test_relativeDRW_torus` (computation): For R=A[t,t⁻¹] with A≠0: dlog[t]=[t]⁻¹·d[t]∈W_rΩ¹_(R/A) is nonzero (its image in W_1Ω¹=Ω¹_(R/A) is dt/t), F(dlog[t])=dlog[t] and d(dlog[t])=0.
- `TauCeti.Crystalline.test_relativeDRW_nonsmooth` (non-example): For R=F_p[ε]/ε² over A=F_p the relative de Rham–Witt complex has W_rΩ⁰=W_r(R) with [ε]≠0 and W_1Ω¹=Ω¹_(R/F_p)≠0; it is therefore not the saturated complex WsatΩ_R=Z_p.
- `TauCeti.Crystalline.test_relativeWitt_length1` (computation): For every map A→R of Z_(p)-algebras, the length-one term of the initial F–V procomplex of R/A (CR.4/relative-de-rham-witt) is the de Rham complex Ω^*_(R/A); in particular its degree-zero ring is R.

**Uses.** Langer–Zink §2.5 Proposition 2.17 and §3.1–3.3; BMS1 §10: The initial F–V procomplex gives relative forms over a Z_(p)-algebra base; its length-one, degree-zero and torus descriptions are the inputs for étale base change, the basic Witt differentials and the crystalline comparison. HabiroCohomologyFoundations:HQ.4/the-comparison-map-from-ordinary-de-rham-witt: The universal property among systems with F and V but without restriction maps gives the maps W_(a+1)Ω_(R/A)→qW_(p^a)Ω_(R/A).

**Construction or proof.**

1. Frobenius on PD forms: for a W_r(A)-linear PD derivation ν:W_r(R)→M, the map ξ=[x]+V(ρ)↦[x]^(p−1)·ν([x])+ν(ρ) is a W_(r+1)(A)-linear PD derivation W_(r+1)(R)→M_[F]. Its additivity uses the identity Σ((p−1)!/(i!j!k!))·[x]^i[y]^j(Vτ)^k+α_p(Vτ)=τ (sum over i+j+k=p with i,j,k≠p) for [x+y]=[x]+[y]+V(τ), α_p=(p−1)!·γ_p, checked in Z_(p)[x,y], and the PD property of ν (Langer–Zink Proposition 1.3). Applied to the universal PD derivation it gives F:Ω̆^*_(W_(r+1)(R)/W_(r+1)(A))→Ω̆^*_(W_r(R)/W_r(A)) with F(dV(η))=dη, F(d[x])=[x]^(p−1)·d[x] and d(Fξ)=p·F(dξ) (Langer–Zink (1.14)–(1.15)).
2. Induction: W_1Ω^*=Ω^*_(R/A). Given the levels ≤r with surjections from the PD forms compatible with restriction and F, let I be the ideal of Ω̆^*_(W_(r+1)(R)/W_(r+1)(A)) generated by the elements of the statement attached to relations in W_rΩ^i; F maps I to zero in W_rΩ^* because FV=p on W_r(R) and FdV=d. On the quotient, V(ξ·dη_1⋯dη_i)=V(ξ)·dV(η_1)⋯dV(η_i) is well defined; divide further by the differential graded ideal generated by V(ω·F(η))−V(ω)·η, which F also kills (Langer–Zink §1.3).
3. Initiality: for an F–V procomplex P the map Ω̆^*_(W_r(R)/W_r(A))→P_r exists because d of P is a PD derivation (CR.4/relative-witt-complex, d_pd) and it commutes with F; by induction on r it kills both ideals, by V(x·dy_1⋯dy_n)=V(x)·dV(y_1)⋯dV(y_n) and the projection formula in P. Uniqueness holds because W_rΩ^* is generated by W_r(R) and dW_r(R). The argument uses F, V and λ of P at levels r and r+1 but never its restriction maps (Langer–Zink Proposition 1.6).

**Depends on:** `CR.4/relative-witt-complex`, `CR.1/pd-differentials`, `CR.4/witt-verschiebung-divided-powers`.

**Sources:** [lz-relative](https://www.math.uni-bielefeld.de/~zink/dRW.pdf), §1.1, Proposition 1.3 and (1.14)–(1.15), printed pp.14–17; §1.3, construction (1.26)–(1.31) and Proposition 1.6, printed pp.21–23. Construction and universal property as printed (base R, algebra S, no hypothesis beyond R being a Z_(p)-algebra). In (1.27) and on p.23 the manuscript prints FdVω=ω for FdVω=dω (packet source issue CrystallineCohomology/E506). The universal property without restriction maps is not stated in the source; it is read off from the induction.; [bms1](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §10.2, Theorem 10.7, p.82. Existence of the initial F–V procomplex for a map of Z_(p)-algebras, quoted from Langer–Zink with BMS1's definition.

**Acceptance.**

- W_rΩ⁰_(R/A)=W_r(R) and W_1Ω^*_(R/A)=Ω^*_(R/A); for R=A, W_rΩ^q_(A/A)=0 for q>0.
- Torus: for R=A[t,t⁻¹] with A≠0, dlog[t]∈W_rΩ¹_(R/A) is nonzero (its image in W_1Ω¹=Ω¹_(R/A) is dt/t), F(dlog[t])=dlog[t] and d(dlog[t])=0.
- The complex is defined when p is not nilpotent (A=Z_(p)) and for non-smooth R: for R=F_p[ε]/ε² over F_p, W_1Ω¹=Ω¹_(R/F_p)≠0 and [ε]≠0 in W_rΩ⁰.

### witt-basic-differentials — Polynomial basic Witt differential expansion

**Theorem:** `TauCeti.Crystalline.basicWittExpansion`. For S=A[T₁,…,T_d], A a Z_(p)-algebra, weights are k∈Z[1/p]≥0^d; order the support of k by increasing p-valuation, with a fixed tie order that is the same for k and p^a·k. A partition P of the support is a sequence of intervals I₀,…,I_q in increasing order, with I₀ allowed empty and the later intervals nonempty. Put t(I)=−min_(i∈I)v_p(k_i), u(I)=max(0,t(I)) and u(k)=max(0,−min_i v_p(k_i)); the weight k_I (the restriction of k to I) is integral when t(I)≤0, and the intervals with non-integral k_I come first. For ξ=V^u(k)(η) the basic form e(ξ,k,P) is the product, in order, of V^u(I₀)(η[T]^(p^u(I₀)k_I₀)) for block 0, dV^u(I)([T]^(p^u(I)k_I)) for each later block with k_I not integral, and F^(−t(I))d[T]^(p^t(I)k_I) for each later block with k_I integral. If I₀ is empty, η is placed inside the first factor, dV^u(I₁)(η[T]^(p^u(I₁)k_I₁)), when k is not integral, and in front of the product when k is integral. Every element of W_rΩ^q_(S/A) is uniquely a finite sum of basic forms e(ξ_(k,P),k,P) over weights with p^(r−1)·k integral (that is u(k)<r) and partitions into q+1 intervals, with ξ_(k,P)∈V^u(k)W_(r−u(k))(A). Every element of WΩ^q_(S/A)=lim_r W_rΩ^q_(S/A) is uniquely a convergent sum of basic forms, where for each m all but finitely many coefficients lie in V^mW(A).

**Hypotheses and conventions.**

- p is a prime; A is a Z_(p)-algebra, possibly with p-torsion; S=A[T₁,…,T_d], d≥0; r≥1; q≥0.
- The expansion describes W_rΩ^q_(S/A) as a W_r(A)-module through the coefficients ξ∈V^u(k)W_(r−u(k))(A); it is not a basis over W_r(S).

**Construction or proof.**

1. Degree 0 and generators (Langer–Zink Proposition 2.3, Corollary 2.4, display (2.24)): every element of W(S) is uniquely a convergent sum Σ_k V^u(k)(η_k·[T]^(p^u(k)·k)) over the weights k, with η_k∈W(A). One subtracts Σ_k[a_k]·[T]^k, where w_0(ξ)=Σ_k a_k·T^k, to land in V W(S), repeats, and rewrites V^m([a]·[T]^k)=V^(m−ρ)(V^ρ([a])·[T]^(k/p^ρ)) for the largest ρ≤m with k/p^ρ integral. Since W_rΩ^q_(S/A) is spanned by the products ξ·dη_1⋯dη_q with ξ, η_i∈W_r(S) (CR.4/relative-de-rham-witt), every element of WΩ^q_(S/A) is a convergent sum of products V^(u_0)(η_0[T]^(a_0))·dV^(u_1)(η_1[T]^(a_1))⋯dV^(u_q)(η_q[T]^(a_q)) with η_j∈W(A) and integral weights a_j.
2. Operators on basic forms, from the relations V(x·F(y))=V(x)·y, FdV=d, dF=pFd and V(x·dy_1⋯dy_n)=V(x)·dV(y_1)⋯dV(y_n) (CR.4/relative-witt-complex). Langer–Zink Proposition 2.5: F e(ξ,k,P)=e(Fξ,pk,P) if I₀≠∅ or k is integral, and =e(ξ′,pk,P) with Vξ′=ξ if I₀=∅ and k is not integral; V e(ξ,k,P)=e(Vξ,k/p,P) if I₀≠∅ or k/p is integral, and =e(p·Vξ,k/p,P) if I₀=∅ and k/p is not integral. Proposition 2.6: d e(ξ,k,I₀,…,I_q)=0 if I₀=∅; =e(ξ,k,∅,I₀,…,I_q) if I₀≠∅ and k is not integral; =p^(−t)·e(ξ,k,∅,I₀,…,I_q) with t=t(Supp k)≤0 if I₀≠∅ and k is integral. Since α·e(ξ,k,P)=e(αξ,k,P) for α∈W(A), the operators F, V and d carry basic forms to basic forms or to 0.
3. Integral weights (Langer–Zink Lemmas 2.9, 2.10, Proposition 2.11). Put (df^a/b)=(a/b)·f^(a−1)·df for f∈W(S) and integers a, b≥1 with ord_p(a/b)≥0; integers prime to p are units of W(A) because A is a Z_(p)-algebra. For subsets J₀, J₁,…,J_q of {1,…,d} (J₁,…,J_q nonempty, overlaps allowed), exponents a_(j,i)≥1 for i∈J_j and c_j=gcd_(i∈J_j) a_(j,i), the element ∏_(i∈J₀)[T_i]^(a_(0,i))·∏_(j=1..q)(d(∏_(i∈J_j)[T_i]^(a_(j,i)))/c_j) is a sum of basic forms of weight k_i=Σ_j a_(j,i). For q=1 and J₀∩J₁=∅ (Lemma 2.9) the variables of J₀ are moved past those of J₁ by the Leibniz rule; for q=1 in general (Lemma 2.10) one uses [T_j]^b·(d[T_j]^a/c)=(a/c)·(d[T_j]^(a+b)/(a+b)) when ord_p(a)≥ord_p(c); for q>1 (Proposition 2.11) one argues by induction on q: when J₀=∅ the element is, up to a unit of Z_(p), F^e∘d applied to an element with q−1 differentials (e the least ord_p(c_j)), which is a sum of basic forms by induction, so that step 2 applies; the variables of J₀ are then multiplied in one at a time, using Lemmas 2.9 and 2.10.
4. General products and finite level (Langer–Zink Lemma 2.12; first lines of the proof of Proposition 2.17). By induction on q, a product as in step 1 is a sum of basic forms. If u_0≥u_j for all j, then V^(u_0)(x)·dV^(u_j)(y)=V^(u_0)(x·F^(u_0−u_j)(dy)) writes it as V^(u_0) of an element treated in step 3, and step 2 applies. Otherwise let u_1 be the largest of the u_j, after reordering the factors dV^(u_j)(…); by the Leibniz rule V^(u_0)(x)·dV^(u_1)(y)=d(V^(u_0)(x)·V^(u_1)(y))−V^(u_1)(y)·dV^(u_0)(x) the product is the difference of d of a product with q−1 differentials, to which the induction hypothesis and step 2 apply, and a product of the first kind. The image of e(ξ,k,P) in W_rΩ^q_(S/A) depends only on the class of ξ in W_r(A) and is 0 for ξ∈V^rW(A); since WΩ^q_(S/A)→W_rΩ^q_(S/A) is surjective, every element of W_rΩ^q_(S/A) is a finite sum of basic forms with ξ_(k,P)∈V^u(k)W_(r−u(k))(A), u(k)<r.
5. Phantom components (Langer–Zink §2.4, Lemma 2.14, Proposition 2.15), for a Z_(p)-algebra A and any A-algebra S. For m≥0 the map δ_m:W(S)→Ω¹_(S/A), δ_m(x_0,x_1,…)=Σ_(i=0..m) x_i^(p^(m−i)−1)·dx_i, satisfies p^m·δ_m=d∘w_m and is a W(A)-linear PD derivation into Ω¹_(S/A) with W(S) acting through the ghost component w_m; this is clear when Ω¹_(S/A) is p-torsion-free and follows in general from the case of a polynomial ring over a p-torsion-free base. The maps ξ·dη_1⋯dη_q↦w_m(ξ)·δ_m(η_1)⋯δ_m(η_q) on the PD de Rham complex of W_(m+1)(S) over W_(m+1)(A) factor through ring homomorphisms ω_m:W_(m+1)Ω^*_(S/A)→Ω^*_(S/A) with ω_m(Vx)=p·ω_(m−1)(x) and ω_m(dVx)=ω_(m−1)(dx) for m≥1, ω_0(Vx)=ω_0(dVx)=0, ω_m(Fx)=ω_(m+1)(x), and d∘ω_m=p^m·ω_m∘d. Because the tower ⊕_(i<r)Ω^*_(S/A) is not an F–V procomplex, this is proved by checking that ω_m kills the two families of relations in the inductive construction of W_(m+1)Ω^*_(S/A) (CR.4/relative-de-rham-witt), not by the universal property.
6. Uniqueness for p-torsion-free A (Langer–Zink Propositions 2.16 and 2.1, first half of the proof of Proposition 2.17, Corollary 2.18). For S=A[T₁,…,T_d] and m<r: ω_m(e)=w_m(ξ)·T^(p^m k_I₀)·∏_j(p^(−ord_p(p^m k_I_j))·dT^(p^m k_I_j)) when p^m·k is integral (with w_(m−u)(η), ξ=V^u(η), u=u(k), in place of w_m(ξ) if I₀ is empty and k is not integral), and ω_m(e)=0 otherwise. Here, for an integral weight k_I with v=min_(i∈I)ord_p(k_i), the symbol (p^(−v)·dT^(k_I)) denotes Z^(p^v−1)·dZ with Z=T^(k_I/p^v), and the right-hand side is w_m(ξ), respectively w_(m−u)(η), times the p-basic element of Ω^*_(S/A) of weight p^m·k and partition P; the p-basic elements of all integral weights and partitions form an A-basis of Ω^*_(S/A) for every Z_(p)-algebra A (Proposition 2.1). So a vanishing finite sum Σe(ξ_(k,P),k,P) in W_rΩ^q_(S/A) has w_m(ξ_(k,P))=0 for all m<r (respectively, all ghost components of η∈W_(r−u)(A) vanish), and the ghost map W_r(A)→A^r is injective because A, a p-torsion-free Z_(p)-algebra, is torsion-free (CrystallineCohomology:CR.4/witt-structural-identities, ghost_injective). Hence all ξ_(k,P)=0, and (ω_0,…,ω_(r−1)) is injective on W_rΩ^*_(S/A).
7. General A (Langer–Zink Proposition 2.17, second half of the proof): write A=Ã/𝔞 with Ã a p-torsion-free Z_(p)-algebra, for instance a polynomial ring over Z_(p), and put S̃=Ã[T₁,…,T_d]. The convergent sums of basic forms with coefficients in W(𝔞)=ker(W(Ã)→W(A)) form an ideal of WΩ_(S̃/Ã) stable under F, V and d (by steps 2–4); the quotient E is an F–V procomplex for S/A with E⁰=W(S), and by step 6 every element of E_r has a unique expansion with coefficients in V^u(k)W_(r−u(k))(A). Initiality (CR.4/relative-de-rham-witt) gives a map WΩ_(S/A)→E, and the composite WΩ_(S̃/Ã)→WΩ_(S/A)→E is the quotient map; maps of F–V procomplexes carry basic forms to basic forms with the same coefficients, so a vanishing sum in W_rΩ^q_(S/A) has vanishing coefficients.
8. Limit (Langer–Zink Theorem 2.8): an element of WΩ^q_(S/A) is a convergent sum of basic forms by steps 1–4, and its coefficients are determined modulo V^rW(A) by its image in W_rΩ^q_(S/A) for every r, hence uniquely.

**Depends on:** `CR.4/relative-de-rham-witt`, `CR.4/relative-witt-complex`, `CR.4/witt-structural-identities`, `mathlib:TruncatedWittVector`, `mathlib:WittVector.ghostComponent`, `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex`.

**Sources:** [lz-relative](https://www.math.uni-bielefeld.de/~zink/dRW.pdf), §2.2 (weights, definitions of t and u, basic Witt differentials (2.11)–(2.17), Propositions 2.5, 2.6, Lemma 2.7), printed pp.37–42; §2.3 Theorem 2.8, p.43; §2.5 Proposition 2.17 with proof and Corollary 2.18, pp.55–57. Proposition 2.17 is the finite-level statement (existence and uniqueness for every Z_(p)-algebra R, by reduction to p-torsion-free rings) and Theorem 2.8 the statement for the limit; the three cases of the basic forms are (2.15)–(2.17). Theorem 2.8 is printed without hypothesis, under the standing hypothesis of §2.2 that R is a Z_(p)-algebra; only Corollary 2.18 and the first half of the proof of Proposition 2.17 assume R p-torsion-free. In the proof of Proposition 2.5 the manuscript prints an extra factor dVω₀ (packet source issue CrystallineCohomology/E507).; [lz-relative](https://www.math.uni-bielefeld.de/~zink/dRW.pdf), §2.2 Proposition 2.3 and Corollary 2.4, printed pp.37–38; §2.3 Lemmas 2.9, 2.10, Proposition 2.11 and Lemma 2.12 with proofs, Corollary 2.13, pp.43–49. Existence of the expansion (proof steps 1, 3 and 4). §2.3 proves Theorem 2.8 'without the uniqueness assertion': the products of display (2.24) are sums of basic Witt differentials, first for integral weights (Lemmas 2.9, 2.10, Proposition 2.11), then in general by induction on the degree (Lemma 2.12). The node's finite-level existence is deduced from it in the first lines of the proof of Proposition 2.17.; [lz-relative](https://www.math.uni-bielefeld.de/~zink/dRW.pdf), §2.1 Proposition 2.1 with proof (Lemma 2.2), printed pp.32–37; §2.4 Lemma 2.14, Proposition 2.15 with proof and Proposition 2.16 with proof, pp.49–54. Uniqueness (proof steps 5 and 6): the maps ω_m and their relations with F, V and d (Lemma 2.14, Proposition 2.15, for every Z_(p)-algebra R and every R-algebra S), their values on basic Witt differentials (Proposition 2.16) and the basis of p-basic elements of the de Rham complex of R[X] (Proposition 2.1). §2.1 opens with 'Let R be a Zp-algebra'; the proof of Proposition 2.1 uses only that integers prime to p are units, and Proposition 2.17 applies it to Z_(p)-algebras.

**Acceptance.**

- For d=1 and r=1 the basic forms are η·T^k in degree 0 and η·k′·T^(k−1)dT in degree 1, where k=p^a·k′≥1 with k′ prime to p (a unit of A): the expansion is the monomial basis of Ω^*_(A[T]/A).
- For d=1, r=2 and a weight k=m/p with m prime to p: the basic forms are V(η[T]^m) in degree 0 and dV(η[T]^m) in degree 1 with η∈W_1(A)=A, and d maps the first to the second (Langer–Zink Proposition 2.6).
- For d=1, r=2 and A=F_p: in weight 1 the basic forms are ξ·[T] (degree 0) and ξ·d[T] (degree 1) with ξ∈W_2(F_p)=Z/p²; in weight 1/p they are V(η[T]) and dV(η[T]) with η∈F_p. For every weight k>0 the part of weight k of W_2Ω^q_(F_p[T]/F_p), q=0, 1, is Z/p² if k is integral, Z/p if k=m/p with p∤m, and 0 otherwise; d from degree 0 to degree 1 is multiplication by p^(ord_p k) on Z/p² for integral k and an isomorphism for k=m/p. Hence H⁰ and H¹ of W_2Ω^*_(F_p[T]/F_p) are the kernel and cokernel of f↦f′ on (Z/p²)[T], the de Rham cohomology of the lift.

### witt-quotients-topologies — Witt differential quotients and completion topologies

**Theorem:** `TauCeti.Crystalline.wittQuotientCompletion`. Let A be a ring and r≥1. For an ideal I⊂A put W_r(I)=ker(W_r(A)→W_r(A/I)) and let [I]⊂W_r(A) be the ideal generated by the Teichmüller lifts [a], a∈I. (a) For every ideal I and s≥1: [I]^s⊂[I^s]⊂W_r(I^s) and [I]^s⊂W_r(I)^s⊂W_r(I^s). If I is finitely generated with finite generating set Σ, then moreover W_r(I^(|Σ|·p^r·s))⊂⟨[a^s]:a∈Σ⟩⊂[I]^s; so the five chains ⟨[a^s]:a∈Σ⟩, [I]^s, [I^s], W_r(I)^s, W_r(I^s) are intertwined. (b) [p]^(2s)·W_r(A)⊂p^s·W_r(A), p^(rs)·W_r(A)⊂W_r(pA)^s and W_r(pA)^(p^r·s)⊂[p]^s·W_r(A); so the [p]-adic, W_r(pA)-adic and p-adic topologies of W_r(A) coincide. (c) For a map A→R of Z_(p)-algebras and an ideal I⊂R, the kernel of W_rΩ^*_(R/A)→W_rΩ^*_((R/I)/A) is the differential graded ideal generated by W_r(I). If I is finitely generated by Σ, the chains ⟨[a^s]:a∈Σ⟩·W_rΩ^*_(R/A) and ker(W_rΩ^*_(R/A)→W_rΩ^*_((R/I^s)/A)) are intertwined. (d) For a map A→R of Z_(p)-algebras and a finitely generated ideal I⊂A, the pro-objects {W_rΩ^*_(R/A)⊗_(W_r(A))W_r(A)/[I^s]}_s and {W_rΩ^*_((R/I^sR)/(A/I^s))}_s are isomorphic; in particular their inverse limits over s agree.

**Hypotheses and conventions.**

- p is a prime; r≥1; in (a) and (b) A is any commutative ring.
- In (c) and (d) A→R is a map of Z_(p)-algebras; the intertwining statements require the ideal to be finitely generated.
- [I^s] denotes the ideal of W_r(A) generated by the Teichmüller lifts of the elements of I^s.

**Construction or proof.**

1. Every element of W_r(A) is uniquely Σ_(i<r)V^i[a_i]; W_r(I) consists of the elements with all a_i∈I, and W_r(J₁+J₂)=W_r(J₁)+W_r(J₂). The inclusions ⟨[a^s]⟩⊂[I]^s⊂[I^s]⊂W_r(I^s) and [I]^s⊂W_r(I)^s follow; W_r(I)^s⊂W_r(I^s) follows from V^i[a]·V^j[b]=p^j·V^i([a·b^(p^(i−j))]) for i≥j, a consequence of V(x·F(y))=V(x)·y and FV=p (BMS1 Lemma 10.1; proof of Lemma 3.2).
2. Conversely I^(|Σ|·p^r·s)⊂⟨a^(p^r·s):a∈Σ⟩, W_r of the latter ideal is Σ_a W_r(a^(p^r·s)A), and W_r(a^(p^r·s)A)⊂[a]^s·W_r(A) because V^i[f^(p^i)·c]=[f]·V^i[c] for i<r (BMS1 Lemma 10.1, Lemma 3.2(ii)).
3. [p]∈V W_(r−1)(A)+p·W_r(A) and (V W_(r−1)(A))²⊂p·W_r(A) by the identity of step 1, so [p]²∈p·W_r(A); p^r=0 in W_r(A/pA) because W_r(F_p)=Z/p^r, so p^r∈W_r(pA); the third inclusion is step 2 for I=pA and Σ={p} (BMS1 Lemma 3.2(ii), Lemma 10.3).
4. Let W′ be the differential graded ideal of W_rΩ^*_(R/A) generated by W_r(I); its elements are sums of terms a₀·da₁⋯da_n with some a_j∈W_r(I), and it is stable under R, F and V. The quotients form an F–V procomplex for (R/I)/A with degree-zero part W_r(R/I), so the universal property gives a section of the surjection onto W_rΩ^*_((R/I)/A), which is therefore an isomorphism (BMS1 Lemma 10.9(i)).
5. By step 2, for each s there is t with W_r(I^t)⊂⟨[a^s]:a∈Σ⟩; writing a factor of a generator of W′ for I^t as [a^s]·b and using the Leibniz rule puts it in ⟨[a^(s−1)]:a∈Σ⟩·W_rΩ^* (BMS1 Lemma 10.9(ii)). For I⊂A apply this to IR and use W_rΩ^*_((R/I^sR)/A)=W_rΩ^*_((R/I^sR)/(A/I^s)) (CR.4/relative-de-rham-witt; BMS1 Corollary 10.10).

**Depends on:** `CR.4/relative-de-rham-witt`, `CR.4/witt-structural-identities`, `mathlib:TruncatedWittVector`, `mathlib:WittVector.teichmuller`, `mathlib:WittVector.verschiebung`, `mathlib:WittVector.frobenius_verschiebung`, `mathlib:WittVector.verschiebung_mul_frobenius`.

**Sources:** [bms1](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §10.1 Lemma 10.3 with proof, pp.80–81; §3.1 Lemma 3.2(ii) with proof, pp.19–20. Statement (b) with the three printed inclusions; the proof uses [p]²∈pW_r(A) and p^rW_r(A)⊂W_r(pA) from Lemma 3.2(ii) and the last inclusion from Lemma 10.1.; [bms1](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §10.1 Lemma 10.1 with proof, p.80. Statement (a) with the printed containments; the source notes that the inclusions not involving Σ do not require finite generation.; [bms1](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §10.3 Lemma 10.9 with proof and Corollary 10.10, pp.82–83. Statements (c) and (d). For the stability of the ideal under R, F, V the source refers to Geisser–Hesselholt (Lemma 2.4) for the detailed manipulations.

**Acceptance.**

- For r=1 the kernel of Ω^*_(R/A)→Ω^*_((R/I)/A) is the differential graded ideal generated by I, that is by I and dI.
- For A=Z_(p) and r=2: [p]∉p·W_2(A) but [p]²∈p·W_2(A). In ghost components [p]=(p,p^p)=p·(1,p^(p−1)) and (1,p^(p−1)) is not a ghost vector since p^(p−1)≢1 mod p, whereas [p]²=(p²,p^(2p))=p·(p,p^(2p−1)) and p^(2p−1)≡p^p mod p.

### continuous-relative-witt — Continuous relative de Rham–Witt complex

**Construction:** `TauCeti.Crystalline.continuousRelativeWitt`. For every map A→R of Z_(p)-algebras and r≥1, define W_rΩ^(q,cont)_(R/A)=lim_s W_rΩ^q_((R/p^s)/(A/p^s))≅lim_s(W_rΩ^q_(R/A)/p^s). With the induced differential, product, restriction, F and V, and with λ_r the limit of the maps W_r(R)→W_r(R/p^s), the tower {W_rΩ^(*,cont)_(R/A)}_r is an F–V procomplex for R/A; hence it receives a unique map of F–V procomplexes from {W_rΩ^*_(R/A)}_r. In each degree q and for each fixed r it is the p-adic completion of W_rΩ^q_(R/A).

**Hypotheses and conventions.**

- p is a prime; A is a Z_(p)-algebra, R an A-algebra, r≥1; p need not be nilpotent in A.
- The completion is with respect to the ideal pA; the limits are ordinary inverse limits of abelian groups in each degree q.

**API.**

- `TauCeti.Crystalline.continuousWitt_eval` (data): For q≥0, r≥1 and s≥1, ev_s:W_rΩ^(q,cont)_(R/A)→W_rΩ^q_((R/p^s)/(A/p^s)) is the projection. Its image coordinates satisfy res_(s+1,s)∘ev_(s+1)=ev_s, and a compatible family of coordinates defines exactly one element of the limit.
- `TauCeti.Crystalline.continuousWitt_map` (functoriality): For ring maps a:A→A′ and b:R→R′ with b∘(A→R)=(A′→R′)∘a, the map b_*:W_rΩ^(q,cont)_(R/A)→W_rΩ^(q,cont)_(R′/A′) is induced by the maps modulo p^s and satisfies ev_s∘b_*=(b mod p^s)_*∘ev_s. Identity and composition agree coordinatewise.
- `TauCeti.Crystalline.continuousWitt_operators` (compatibility): For r≥1, restriction and F map W_(r+1)Ω^(q,cont)→W_rΩ^(q,cont), V maps W_rΩ^(q,cont)→W_(r+1)Ω^(q,cont), and d maps degree q to q+1 at fixed r. Every ev_s intertwines these operators with the operator at base (R/p^s)/(A/p^s). Hence FV=p, FdV=d, d²=0 and dF=pFd hold with these domains.
- `TauCeti.Crystalline.continuousWitt_fromRelative` (universal-property): The unique map of F–V procomplexes W_rΩ^*_(R/A)→W_rΩ^(*,cont)_(R/A); in each degree it is the map to the p-adic completion, and it is an isomorphism when p is nilpotent in A.

**Unit tests.**

- `TauCeti.Crystalline.test_continuousWitt_p_nilpotent` (compatibility): If p^N=0 on A and R, the defining tower is eventually constant and recovers W_rΩ_(R/A).
- `TauCeti.Crystalline.test_continuousWitt_identity` (degenerate): For R=A the result has only degree0, the p-completion of W_r(A).
- `TauCeti.Crystalline.test_continuousWitt_r1` (computation): At r=1 it is the degreewise p-completed ordinary relative de Rham complex.

**Uses.** BMS1 Definition 10.11 and §11; AInfCohomology:AI.4: Degreewise p-completion at fixed Witt length gives the continuous forms W_rΩ^(i,cont) used as coefficients in the A_inf comparison.

**Construction or proof.**

1. By CR.4/witt-quotients-topologies (d) for I=pA the pro-objects {W_rΩ^q_(R/A)⊗_(W_r(A))W_r(A)/[p^sA]}_s and {W_rΩ^q_((R/p^s)/(A/p^s))}_s are isomorphic, and by (b) the [p]-adic and p-adic topologies of W_r(A) agree; this gives the second description (BMS1 Corollary 10.10, Lemma 10.3, Definition 10.11).
2. d, the product, restriction, F and V are compatible with the transition maps in s, being induced by the maps of procomplexes for (R/p^(s+1))/(A/p^(s+1))→(R/p^s)/(A/p^s); so they pass to the limit and keep the identities FV=p, FdV=d, V(F(x)·y)=x·V(y) and the Teichmüller identity.

**Depends on:** `CR.4/witt-quotients-topologies`, `CR.4/relative-witt-complex`, `CR.4/relative-de-rham-witt`, `mathlib:AdicCompletion`.

**Sources:** [bms1](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §10.3, Corollary 10.10, Definition 10.11 and the two sentences after it, p.83. The two inverse limits and the remark that the result is again an F–V procomplex for R/A are as printed; the map from the algebraic complex is the node's consequence of initiality.

**Acceptance.**

- If p^N=0 in A, the tower in s is constant for s≥N and W_rΩ^(q,cont)_(R/A)=W_rΩ^q_(R/A).
- For R=A only degree 0 remains: W_rΩ^(0,cont)_(A/A)=lim_s W_r(A)/p^s.
- For r=1: W_1Ω^(q,cont)_(R/A)=lim_s Ω^q_(R/A)/p^s, the degreewise p-adic completion of the de Rham complex.

### classical-de-rham-witt — Classical de Rham–Witt complex as the initial V-pro-complex

**Construction:** `TauCeti.Crystalline.classicalDRW`. Let R be a commutative F_p-algebra. An R-framed V-pro-complex consists of an inverse system ⋯→A_3→A_2→A_1→A_0 of commutative differential graded algebras (transition maps Res, inverse limit A_∞), maps V:A_r→A_(r+1) of graded abelian groups, and a ring homomorphism β:W(R)→A_∞⁰ with components β_r:W(R)→A_r⁰, such that: (a) A_r^n=0 for n<0 and for r=0; (b) Res∘V=V∘Res; (c) β∘V=V∘β; (d) V(x·dy)=V(x)·dV(y); (e) (Vx)·dβ_(r+1)([λ])=V(x·β_r([λ])^(p−1)·dβ_r([λ])) for λ∈R and x∈A_r. Morphisms are families of maps of differential graded algebras commuting with Res, V and β. This category has an initial object {W_rΩ^*_R}_(r≥0), the classical de Rham–Witt complex of R, and WΩ^*_R=lim_r W_rΩ^*_R. Each W_rΩ^*_R is a quotient of the absolute de Rham complex Ω^*_(W_r(R)); the restriction maps are surjective; β_r induces an isomorphism W_r(R)≅W_rΩ⁰_R; and Ω^*_R→W_1Ω^*_R is an isomorphism.

**Hypotheses and conventions.**

- p is a prime; R is a commutative F_p-algebra, with no regularity, reducedness or finiteness assumption.
- Commutative differential graded algebras are strictly commutative (x²=0 for x of odd degree) and concentrated in degrees ≥0; differentials are additive.
- A Frobenius operator is not part of the structure of an R-framed V-pro-complex.

**API.**

- `TauCeti.Crystalline.classicalDRW_lift` (universal-property): Every R-framed V-pro-complex {A_r} receives a unique morphism of R-framed V-pro-complexes from {W_rΩ^*_R}.
- `TauCeti.Crystalline.classicalDRW_zero` (equivalence): β_r induces a ring isomorphism W_r(R)≅W_rΩ⁰_R for r≥1, and W_0Ω^*_R=0.
- `TauCeti.Crystalline.classicalDRW_one` (equivalence): The map Ω^*_R→W_1Ω^*_R extending R=W_1(R)→W_1Ω⁰_R is an isomorphism of differential graded algebras.
- `TauCeti.Crystalline.classicalDRW_generated` (characterisation): Ω^*_(W_r(R))→W_rΩ^*_R is surjective, and Res:W_(r+1)Ω^*_R→W_rΩ^*_R is surjective.
- `TauCeti.Crystalline.classicalDRW_map` (functoriality): A homomorphism f:R→R′ of F_p-algebras induces maps W_rΩ^*_R→W_rΩ^*_(R′) of differential graded algebras commuting with Res, V and W(f); identities and composites are respected.
- `TauCeti.Crystalline.classicalDRW_toRelative` (compatibility): The tower {W_rΩ^*_(R/F_p)}_r of CR.4/relative-de-rham-witt is an R-framed V-pro-complex, and the resulting maps W_rΩ^*_R→W_rΩ^*_(R/F_p) are isomorphisms of differential graded algebras commuting with V and restriction, for every F_p-algebra R; they carry Illusie's Frobenius F:W_(r+1)Ω^*_R→W_rΩ^*_R (Illusie I.2.17) to the Frobenius of the F–V procomplex.
- `TauCeti.Crystalline.classicalDRW_lift_degreeZero` (universal-property): Illusie's universal property. Let M_• be an inverse system of commutative differential graded algebras with M_r=0 for r≤0 and M⁰_r=W_r(M⁰_1) for an F_p-algebra M⁰_1 (the restriction maps being the restriction of Witt vectors in degree 0), with additive maps V:M_r→M_(r+1) that commute with restriction, are the Verschiebung of Witt vectors in degree 0, and satisfy V(x·dy)=V(x)·dV(y) for all x, y∈M_r and (Vy)·d[x]=V([x]^(p−1)·y)·dV[x] for x∈M⁰_1, y∈M⁰_r. Then every ring homomorphism f:R→M⁰_1 extends uniquely to maps W_rΩ^*_R→M_r of differential graded algebras that commute with restriction and V and are W_r(f) in degree 0.

**Unit tests.**

- `TauCeti.Crystalline.test_classicalDRW_perfect` (computation): For a perfect F_p-algebra k and r≥1: W_rΩ⁰_k=W_r(k) and W_rΩ^n_k=0 for all n>0.
- `TauCeti.Crystalline.test_classicalDRW_length_one` (computation): For R=F_p[t]: W_1Ω⁰_R=F_p[t], W_1Ω¹_R=F_p[t]·dt≠0 and W_1Ω^n_R=0 for n≥2.
- `TauCeti.Crystalline.test_classicalDRW_dual_numbers` (non-example): For R=F_p[ε]/ε²: [ε]≠0 in W_rΩ⁰_R=W_r(R) and W_1Ω¹_R=Ω¹_R≠0, so W_rΩ^*_R→W_rΩ^*_(F_p) is not an isomorphism, unlike WsatΩ_R→WsatΩ_(F_p).
- `TauCeti.Crystalline.test_classicalDRW_cusp` (non-example): For R=F_p[t²,t³] with x=t³, y=t²: dx∧dy≠0 in W_1Ω²_R=Ω²_R, whereas WsatΩ²_R=0.

**Uses.** BLM §4.4, Proposition 4.4.10, Corollary 4.4.11, Theorem 4.4.12; CR.4/classical-regular-comparison: The universal property gives the comparison map γ to the saturated de Rham–Witt complex, an isomorphism for regular Noetherian R. Shiho §2; BMS2 §8.1; CR.4/logarithmic-witt-sheaf, CR.4/nygaard-filtration: These sources work with the de Rham–Witt complex of Bloch–Deligne–Illusie of regular F_p-schemes, which is this complex.

**Construction or proof.**

1. Call a family of differential graded ideals I_r⊂Ω^*_(W_r(R)), r≥0, good if (i) restriction carries I_(r+1) into I_r; (ii) V(x_0·dx_1∧⋯∧dx_n)=V(x_0)·dV(x_1)∧⋯∧dV(x_n) is a well-defined additive map Ω^*_(W_r(R))/I_r→Ω^*_(W_(r+1)(R))/I_(r+1); (iii) (Vx)·d[λ]−V(x·[λ]^(p−1)·d[λ])∈I_(r+1) for all x and λ∈R. Good families are closed under intersection, and the quotients by the smallest good family, with β the projections, form an initial R-framed V-pro-complex (BLM Proposition 4.4.4).
2. The family of all elements of positive degree is good, so the smallest good family is zero in degree 0 and W_rΩ⁰_R=W_r(R); the relations impose nothing for r=1, so W_1Ω^*_R=Ω^*_R; restriction is surjective because W_(r+1)(R)→W_r(R) is (BLM Remarks 4.4.5, 4.4.9, Warning 4.4.8).
3. In any R-framed V-pro-complex the composite Res^r∘V^r:A_r→A_r vanishes by (a) and (b), so by (c) β_r kills V^rW(R) and factors through W_r(R) (BLM Remark 4.4.3).
4. Functoriality: for f:R→R′ an R′-framed V-pro-complex is R-framed through W(f), which commutes with V and Teichmüller lifts; initiality gives W_rΩ^*_R→W_rΩ^*_(R′). The Langer–Zink tower {W_rΩ^*_(R/F_p)}_r (with W_0=0), with its V and the projections W(R)→W_r(R), satisfies (d) by V(x·dy)=V(x·FdV(y))=V(x)·dV(y) and (e) by V(x·F(d[λ]))=V(x)·d[λ] with F(d[λ])=[λ]^(p−1)·d[λ]; so it is an R-framed V-pro-complex and receives a map from the classical complex, surjective because both are quotients of Ω^*_(W_r(R)).
5. Illusie's universal property (API item classicalDRW_lift_degreeZero). Let M_• and f:R→M⁰_1 be as there; M_• is a V-pro-complex of DR in the sense of Illusie I.1.1, his condition (V3) being (e) for x of degree 0 rewritten by (d). Let M′_r⊂M_r be the differential graded subalgebra generated by M⁰_r. The M′_r are stable under restriction and under V (by (d)), and satisfy (e) for x of every degree: for x=a·dx_1⋯dx_i with a, x_j∈M⁰_r, (Vx)·d[λ]=(−1)^i·V(a)·d[λ]·dV(x_1)⋯dV(x_i)=(−1)^i·V([λ]^(p−1)a)·dV[λ]·dV(x_1)⋯dV(x_i)=V(x·[λ]^(p−1)·d[λ]). So M′_• with β=W(f) is an R-framed V-pro-complex and receives a unique morphism from {W_rΩ^*_R}; every morphism from {W_rΩ^*_R} to M_• lands in M′_• because W_rΩ^*_R is generated as a differential graded algebra by its degree-zero part W_r(R) (steps 1 and 2). Hence R↦{W_rΩ^*_R} is left adjoint to M_•↦M⁰_1, which is Illusie's definition of the de Rham–Witt pro-complex (Illusie I.1.3, I.1.4); conversely Illusie's pro-complex is an R-framed V-pro-complex, (e) in all degrees being his formula (1.5.2) (BLM Warning 4.4.8).
6. Agreement with the Langer–Zink complex. By step 5 Illusie's theorems apply to {W_rΩ^*_R}: there are maps F:W_(r+1)Ω^*_R→W_rΩ^*_R of graded rings, compatible with restriction and equal to F on Witt vectors in degree 0, with F(d[x])=[x]^(p−1)·d[x] and FdV=d (Illusie, Théorème I.2.17), and FV=VF=p, x·V(y)=V(F(x)·y) (Illusie, Proposition I.2.18). So {W_rΩ^*_R}_(r≥1) with F and V is an F–V procomplex for R/F_p (CR.4/relative-witt-complex), and initiality (CR.4/relative-de-rham-witt) gives maps h_r:W_rΩ^*_(R/F_p)→W_rΩ^*_R commuting with d, restriction, F and V. The surjections g_r of step 4 commute with F: g∘F and F∘g are ring maps that agree on W_(r+1)(R), on d[x] and on dV(y), and these generate. Hence h∘g is an endomorphism of the initial R-framed V-pro-complex and g∘h an endomorphism of the initial F–V procomplex; both are the identity, so g_r is an isomorphism for every F_p-algebra R.

**Depends on:** `CR.4/witt-structural-identities`, `mathlib:WittVector`, `mathlib:TruncatedWittVector`, `mathlib:WittVector.truncate`, `mathlib:WittVector.verschiebung`, `mathlib:WittVector.teichmuller`, `CR.4/relative-de-rham-witt`, `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex`, `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-universal-property`, `CR.4/relative-witt-complex`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §4.4, Definition 4.4.1, Remark 4.4.3, Proposition 4.4.4 with its proof sketch, Remark 4.4.5, Definition 4.4.6, Remark 4.4.7, Warning 4.4.8, Remark 4.4.9, pp.48–51. The axioms (a)–(e), the initial object and the four properties are as printed. The source gives the existence only as a proof sketch and says of W_r(R)≅W_rΩ⁰_R that 'it is not difficult to see'; the second proof step supplies the argument. Functoriality in R and the map to the Langer–Zink complex are not stated in the source.; [lz-relative](https://www.math.uni-bielefeld.de/~zink/dRW.pdf), Introduction, PDF p.4. Langer–Zink assert the agreement of their relative complex over a perfect base with Illusie's complex, without proof. Proof steps 4 and 6 prove it over F_p, for every F_p-algebra R, from Illusie I.2.17 and I.2.18.; [illusie-drw](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), Part I, §1: Définition 1.1 ((V1)–(V3)), Théorème 1.3 ((1.3.1)), Définition 1.4, Proposition 1.5 ((1.5.2)), Proposition 1.6, printed pp. 543–545; 1.10 (p. 547); 1.15 (p. 550). Illusie's original definition, on any topos; it differs from axioms (a)–(e): (V1) requires M⁰_n=W_n(M⁰_1) with the usual restriction and Verschiebung (there is no map β), and (V3) imposes (e) only for x of degree 0, the general case being (1.5.2) for the universal object. W_•Ω^*_A is the value at A of the left adjoint of M_•↦M⁰_1 (Théorème 1.3, which also gives Ω^*_(W_n(A))→W_nΩ^*_A surjective and Ω^*_A≅W_1Ω^*_A); Proposition 1.6 is the acceptance item on perfect rings. That the node's initial object has Illusie's universal property is proof step 5.; [illusie-drw](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), Part I, §2 E: Théorème 2.17, Proposition 2.18 ((2.18.1)–(2.18.6)), printed pp. 562–564. For every F_p-algebra R (Illusie: every topos ringed in F_p-algebras): the maps F:W_(r+1)Ω^*_R→W_rΩ^*_R of graded rings extending F on Witt vectors, with F(d[x])=[x]^(p−1)d[x] and FdV=d (2.17), FV=VF=p, dF=pFd and x·V(y)=V(F(x)·y) (2.18). Proof step 6 uses them to make the classical complex an F–V procomplex for R/F_p and to invert the map to the Langer–Zink complex.

**Acceptance.**

- For a perfect F_p-algebra k: W_rΩ⁰_k=W_r(k) and W_rΩ^n_k=0 for n>0, because every element of W_r(k) is a sum of V^i[a]=p^i[a^(1/p^i)] and d[c]=d([c^(1/p^r)]^(p^r)) is divisible by p^r=0.
- For R=F_p[t]: W_1Ω^*_R=Ω^*_R, so W_1Ω¹_R=F_p[t]·dt≠0.
- For R=F_p[ε]/ε²: [ε]≠0 in W_rΩ⁰_R=W_r(R); for the cusp R=F_p[t²,t³]: W_1Ω²_R=Ω²_R≠0. The classical complex is not invariant under R→R_red or under passing to the seminormalisation.

### witt-frobenius-lift-universal — Witt lifting from a torsion-free Frobenius lift

**Theorem:** `TauCeti.Crystalline.witt_frobenius_lift_universal`. Let A be a p-torsion-free commutative ring with a ring endomorphism φ satisfying φ(a)≡a^p mod p. Let S be a reduced F_p-algebra and f:A→S a ring map. There is a unique ring map u:A→W(S) with w₀u=f and F_Wu=uφ. Here F_W is injective because S is reduced. This is the special Witt lifting property needed to identify degree zero of a strict Dieudonné algebra.

**Hypotheses and conventions.**

- p is prime; A is p-torsion-free; S is reduced of characteristic p; φ is a Frobenius lift.

**Construction or proof.**

1. Construct a map A→W(A) whose n-th ghost coordinate is φ^n(a): recursively define the Witt coordinates by dividing φ^n(a)−Σ_(i<n)p^i u_i(a)^(p^(n−i)) by p^n. The Frobenius-lift congruences imply divisibility, and torsion-freeness gives uniqueness.
2. Universal Witt polynomial identities show that this map is a ring map and is Frobenius compatible. Compose with W(f):W(A)→W(S).
3. For uniqueness, any ring map u with F_Wu=uφ commutes with the p-derivation δ=(φ−(·)^p)/p, since source and target are p-torsion-free. Successive Witt coordinates are universal polynomials in w₀ and the iterates of δ, so they are forced by f. The integrality and coordinate-reconstruction certificates are recorded as the precise gap: BLM invokes Joyal instead of proving them.

**Depends on:** `CR.4/witt-structural-identities`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §3.6, Proposition 3.6.2 and its proof; Definition 3.7.1, pp.39–42. The proof uses the cofree Witt property for the torsion-free Frobenius lift on degree zero. This node owns just that specialization, rather than a later δ-ring category.

**Acceptance.**

- For A=Z with φ=id and S=F_p, u is the canonical Z→W(F_p).
- For S=F_p[t] and A=Z[t] with φ(t)=t^p and reduction f, u(t)=[t].

### saturated-de-rham-witt — Universal saturated de Rham–Witt complex

**Construction:** `TauCeti.Crystalline.saturatedDRW`. For an F_p-algebra R, a saturated de Rham–Witt complex of R is a strict Dieudonné algebra WsatΩ_R with a ring map e:R→WsatΩ_R⁰/V WsatΩ_R⁰ such that, for every strict Dieudonné algebra A, composition with e is a bijection Hom_DA(WsatΩ_R,A)≅Hom_Fp(R,A⁰/VA⁰). It exists, is unique up to unique isomorphism, and R↦WsatΩ_R is left adjoint to A↦A⁰/VA⁰. Construct it as W(Sat Ω^*_(W(R_red))), where W(R_red) is the existing ring of Witt vectors (p-torsion-free because R_red is reduced) with its Witt vector Frobenius and Ω^* is its absolute de Rham complex with the divided Frobenius. For a strict Dieudonné algebra A with S=A⁰/VA⁰, the ring S is reduced and there is a unique ring isomorphism A⁰≅W(S) lifting the identity of S and carrying F to the Witt vector Frobenius; it also carries V to Verschiebung. Hence, writing S_R=WsatΩ_R⁰/V WsatΩ_R⁰, the degree-zero ring of WsatΩ_R is W(S_R). S_R is reduced and seminormal (x²=y³ in S_R implies x=t³, y=t² for some t∈S_R), and WsatΩ_R→WsatΩ_(R_red) is an isomorphism. For R=F_p[t²,t³]⊂F_p[t] the inclusion induces an isomorphism WsatΩ_R≅WsatΩ_(F_p[t]). For a p-torsion-free ring B with a ring endomorphism φ, φ(x)≡x^p mod p, there is a unique map of Dieudonné algebras μ from the p-completed de Rham complex Ω̂^*_B to WsatΩ_(B/pB) lifting B→B/pB→S_(B/pB), and it induces an isomorphism W(Sat Ω̂^*_B)≅WsatΩ_(B/pB).

**Hypotheses and conventions.**

- p is a prime; R is a commutative F_p-algebra.
- In the universal property A ranges over strict Dieudonné algebras.
- For μ: B is a p-torsion-free ring with a ring endomorphism φ such that φ(x)≡x^p mod p; B need not be smooth or p-adically complete.

**API.**

- `TauCeti.Crystalline.satDRW_lift` (universal-property): For every strict Dieudonné algebra A and every ring map g:R→A⁰/VA⁰ there is a unique map of Dieudonné algebras f:WsatΩ_R→A such that the map S_R→A⁰/VA⁰ induced by f, composed with e_R:R→S_R, equals g.
- `TauCeti.Crystalline.satDRW_degree0` (equivalence): A ring isomorphism WsatΩ_R⁰≅W(S_R), S_R=WsatΩ_R⁰/V WsatΩ_R⁰, whose Witt coordinate of index 0 is the projection WsatΩ_R⁰→S_R (BLM Proposition 3.6.2).
- `TauCeti.Crystalline.satDRW_map` (functoriality): Ring maps induce maps preserving d,F,V and all finite quotients.
- `TauCeti.Crystalline.satDRW_degree0_F` (compatibility): The isomorphism WsatΩ_R⁰≅W(S_R) carries F and V of WsatΩ_R⁰ to the Witt vector Frobenius and Verschiebung of W(S_R).
- `TauCeti.Crystalline.satDRW_unit` (data): e_R:R→S_R, the unit of the adjunction; e_R factors through R_red.
- `TauCeti.Crystalline.satDRW_residue_seminormal` (characterisation): S_R is reduced, and for x, y∈S_R with x²=y³ there is t∈S_R with x=t³ and y=t² (BLM Lemma 3.6.1, Proposition 6.5.1).
- `TauCeti.Crystalline.satDRW_red` (equivalence): WsatΩ_R→WsatΩ_(R_red) is an isomorphism of strict Dieudonné algebras (BLM Warning 4.1.3).
- `TauCeti.Crystalline.satDRW_ofLift` (universal-property): For a p-torsion-free ring B with an endomorphism φ lifting Frobenius: maps of Dieudonné algebras Ω̂^*_B→A into a strict A correspond bijectively to ring maps B→A⁰/VA⁰; the map μ:Ω̂^*_B→WsatΩ_(B/pB) corresponding to B→B/pB→S_(B/pB) induces W(Sat Ω̂^*_B)≅WsatΩ_(B/pB) (BLM Proposition 4.2.1, Corollary 4.2.3).

**Unit tests.**

- `TauCeti.Crystalline.test_satDRW_perfect` (computation): For perfect k, WsatΩ_k=W(k) in degree0 with higher forms0.
- `TauCeti.Crystalline.test_satDRW_polynomial` (computation): For R=F_p[t]: d[t]≠0 in WsatΩ¹_R and F(d[t])=[t]^(p−1)·d[t], where [t]∈WsatΩ⁰_R=W(S_R) is the Teichmüller lift of e_R(t).
- `TauCeti.Crystalline.test_satDRW_dual_numbers` (non-example): For R=F_p[ε]/ε²: e_R(ε)=0 in S_R and the map WsatΩ_R→WsatΩ_(F_p)=Z_p induced by ε↦0 is an isomorphism, whereas the Teichmüller lift [ε] is nonzero in W(R).
- `TauCeti.Crystalline.test_satDRW_cusp` (computation): For R=F_p[t²,t³]⊂F_p[t] the inclusion induces an isomorphism WsatΩ_R≅WsatΩ_(F_p[t]); in particular WsatΩ²_R=0, although Ω²_R≠0 (dx∧dy≠0 for x=t³, y=t²), and there is s∈S_R, mapping to e(t) under S_R≅S_(F_p[t])=F_p[t], with e_R(x)=s³ and e_R(y)=s².

**Uses.** BLM §§4.1–4.4; CR.4/classical-regular-comparison: Represents algebra maps into the residue of strict Dieudonné algebras; initiality, Teichmüller lifts and finite quotients connect the saturated object to classical Witt forms without imposing W(R_red) in degree zero for arbitrary singular R.

**Construction or proof.**

1. Reducedness: for a saturated Dieudonné algebra A, V A⁰ is an ideal containing p=V(1), and A⁰/VA⁰ is reduced: if x^p∈VA⁰ then F(x)=V(y), d(Vy)=p·F(dx), so y=F(z) by BLM Lemma 2.6.3 and x=V(z) (BLM Lemma 3.6.1).
2. Degree zero: for strict A with S=A⁰/VA⁰, W(S) is p-torsion-free and is the cofree δ-ring on S, which gives a unique ring map u:A⁰→W(S) lifting the identity of S and commuting with F; u commutes with V because F is injective on W(S); u is an isomorphism by induction on r along 0→A⁰/VA⁰→A⁰/V^rA⁰→A⁰/V^(r−1)A⁰→0 and the corresponding sequences of truncated Witt vectors (BLM Proposition 3.6.2). Consequently a ring map R→A⁰/VA⁰ lifts uniquely to a ring map W(R)→A⁰ commuting with F (BLM Proposition 3.6.3, Lemma 3.6.4).
3. Existence: by step 1 every map R→A⁰/VA⁰ factors through R_red, so assume R reduced. Then Hom_DA(W Sat Ω^*_(W(R)),A)≅Hom_DA(Sat Ω^*_(W(R)),A)≅Hom_DA(Ω^*_(W(R)),A)≅{f:W(R)→A⁰ with f∘F=F∘f}≅Hom(R,A⁰/VA⁰), by the universal properties of W, Sat and the de Rham Dieudonné algebra (CR.4/dieudonne-algebra) and step 2 (BLM Proposition 4.1.4, Corollary 4.1.5). Functoriality and WsatΩ_R≅WsatΩ_(R_red) follow from the universal property.
4. The map μ: a strict Dieudonné algebra A is termwise p-adically complete and p-torsion-free, so Hom_DA(Ω̂^*_B,A)≅{f:B→A⁰ with f∘φ=F∘f}≅Hom(B,A⁰/VA⁰) by step 2; this gives μ and W(Sat Ω̂^*_B)≅WsatΩ_(B/pB) (BLM Proposition 4.2.1, Corollary 4.2.3).
5. Cusp and seminormality: for R=F_p[t²,t³] take B=Z_p[t²,t³]⊂Z_p[t] with φ(t)=t^p. The inclusion is an isomorphism in all degrees ≠1 of the grading by powers of t, which gives Sat Ω^*_B≅Sat Ω^*_(Z_p[t]) (BLM Proposition 6.1.2), hence WsatΩ_R≅WsatΩ_(F_p[t]) by step 4 (BLM Proposition 6.2.1). If x²=y³ in A⁰/VA⁰ for a strict A, the corresponding map WsatΩ_R→A factors through WsatΩ_(F_p[t]), and the image of t is the required element (BLM Proposition 6.5.1).

**Depends on:** `CR.4/dieudonne-algebra`, `CR.4/strict-completion`, `mathlib:WittVector`, `mathlib:WittVector.frobenius`, `mathlib:WittVector.verschiebung`, `mathlib:WittVector.teichmuller`, `mathlib:WittVector.frobenius_verschiebung`, `mathlib:WittVector.truncate`, `mathlib:TruncatedWittVector`, `mathlib:WittVector.verschiebung_frobenius`, `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex`, `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-universal-property`, `CR.4/witt-frobenius-lift-universal`, `CR.4/verschiebung-divisibility-lift`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §3.6 (Lemma 3.6.1, Propositions 3.6.2, 3.6.3, Lemma 3.6.4), §4.1 (Definition 4.1.1, Warning 4.1.3, Proposition 4.1.4, Corollary 4.1.5), §4.2 (Proposition 4.2.1, Corollary 4.2.3), pp.38–45. Definition, existence (Proposition 4.1.4, by the construction W Sat Ω^*_(W(R)) for reduced R), the degree-zero description and the map μ are as printed.; [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §6.1 Proposition 6.1.2, §6.2 Proposition 6.2.1, §6.3 Proposition 6.3.1, §6.5 Proposition 6.5.1, pp.70–74. The cusp isomorphism and the seminormality of A⁰/VA⁰ for strict A. The identification of S_R with the seminormalisation of R (Theorem 6.5.3) is the separate node CR.4/saturated-seminormalisation.

**Acceptance.**

- For a perfect F_p-algebra k: WsatΩ_k=W(k) in degree 0 and 0 in positive degrees.
- For R=F_p[t]: d[t]≠0 and F(d[t])=[t]^(p−1)·d[t] in WsatΩ¹_R, where [t] is the Teichmüller lift in WsatΩ⁰_R=W(S_R).
- Singular inputs: for R=F_p[ε]/ε², WsatΩ_R=WsatΩ_(F_p)=Z_p although [ε]≠0 in W(R); for the cusp R=F_p[t²,t³], WsatΩ_R≅WsatΩ_(F_p[t]), so WsatΩ²_R=0 although Ω²_R≠0.

### witt-localization-descent — Witt localization and étale descent

**Theorem:** `TauCeti.Crystalline.wittEtaleDescent`. (1) For a map A→R of Z_(p)-algebras and an étale R-algebra S, the natural map W_r(S)⊗_(W_r(R))W_rΩ^*_(R/A)→W_rΩ^*_(S/A) is an isomorphism for every r≥1; it is an isomorphism of differential graded algebras for the unique extension of the derivation to the tensor product, which is not 1⊗d. In particular W_r(R_f)⊗_(W_r(R))W_rΩ^*_(R/A)≅W_rΩ^*_(R_f/A) for f∈R. (2) If p^m·W_r(A)=0, then W_(m+r)(S)⊗_(W_(m+r)(R),F^m)W_rΩ^i_(R/A)≅W_rΩ^i_(S/A), and in this description 1⊗d induces d. (3) For a saturated Dieudonné algebra A and s∈A⁰ with F(s)=s^p, the map W_r(A)[s̄⁻¹]→W_r(A[s⁻¹]) is an isomorphism of differential graded algebras; hence for an F_p-algebra R and s∈R, W_r(WsatΩ_R)[[s]⁻¹]≅W_r(WsatΩ_(R[1/s])), and WsatΩ_(R[1/s]) is the strict completion W(WsatΩ_R[[s]⁻¹]); the localisation WsatΩ_R[[s]⁻¹] itself is in general not strict. For an étale map R→S of F_p-algebras, W_r(WsatΩ_R)⊗_(W_r(R))W_r(S)≅W_r(WsatΩ_S) for every r. (4) For a scheme X over a Z_(p)-algebra A, U↦W_rΩ^q_(O(U)/A) on affine opens is a quasi-coherent sheaf on the scheme (|X|,W_r(O_X)), and an étale sheaf when p is nilpotent in A. For an F_p-scheme X, U↦W_r(WsatΩ^q_(O(U))) and U↦WsatΩ^q_(O(U)) are sheaves for the Zariski and the étale topology on affines, the former quasi-coherent over W_r(O_X), and the Zariski cohomology groups H^n(Spec R,WsatΩ^q) vanish for n>0.

**Hypotheses and conventions.**

- p is a prime; r≥1.
- (1): A→R is a map of Z_(p)-algebras and R→S is étale; no nilpotence or F-finiteness is assumed.
- (2): in addition p^m·W_r(A)=0, so p is nilpotent in A.
- (3) and the saturated part of (4): F_p-algebras and F_p-schemes.

**Construction or proof.**

1. W_r(R)→W_r(S) is étale and W_r commutes with base change along étale maps (BMS1 Theorem 10.4). So the derivation of W_rΩ^*_(R/A) extends uniquely to W_r(S)⊗_(W_r(R))W_rΩ^*_(R/A), and F, V extend by F(ξ⊗x)=F(ξ)⊗F(x) and V(ξ⊗x)=ξ⊗V(x), using W_r(S)⊗_(W_r(R))P_r=W_(r+1)(S)⊗_(W_(r+1)(R))P_(r,[F]); the tensor tower is an F–V procomplex for S/A (Langer–Zink §1.4).
2. Initiality gives α:W_rΩ^*_(S/A)→W_r(S)⊗W_rΩ^*_(R/A) and a map β in the other direction; β is surjective because both sides are quotients of Ω^*_(W_r(S)/W_r(A))=W_r(S)⊗Ω^*_(W_r(R)/W_r(A)), and α∘β is the identity by uniqueness, so both are isomorphisms (Langer–Zink Proposition 1.7; BMS1 Lemma 10.8).
3. If p^m·W_r(A)=0 then p^m kills W_rΩ^*_(R/A), its differential is linear over W_(m+r)(R) acting through F^m, and W_(m+r)(S)⊗_(W_(m+r)(R),F^m)W_r(R)=W_r(S); this gives (2) (Langer–Zink, Remark after Proposition 1.7).
4. Saturated case, localisation: V^r(s^(−n)·x)=s^(−n)·V^r(s^(n(p^r−1))·x) shows (V^rA+dV^rA)[s⁻¹]=V^r(A[s⁻¹])+dV^r(A[s⁻¹]) (BLM Proposition 5.1.5), and the universal property identifies W(A[[s]⁻¹]) with WsatΩ_(R[1/s]) (BLM Corollary 5.1.6).
5. Saturated case, étale maps of F_p-algebras, Witt vector inputs (BLM §5.4, Lemma 5.5.2, Example 5.5.3). For an étale map R→S of F_p-algebras and n≥1: W_n(R)→W_n(S) is étale; W_n(S)⊗_(W_n(R))W_(n−1)(R)≅W_(n−1)(S) along restriction; W_n(R″)⊗_(W_n(R))W_n(S)≅W_n(R″⊗_R S) for every ring map R→R″; and W_n(R)⊗_(F^k,W_n(R))W_n(S)≅W_n(S) along the k-th power of the Witt vector Frobenius (Theorem 5.4.1, proved in the source for F_p-algebras by induction on n: W_(n+1)(R)→W_n(R) is a square-zero extension whose kernel V^nR≅R is an R-module through the n-th power of Frobenius, and R⊗_(φ^n,R)S≅S because R→S is étale; Remark 5.4.2). Consequently, for a W_n(R)-module M, M_S=M⊗_(W_n(R))W_n(S) does not depend on n and is exact in M; an additive map f:M→N into a W_n(S)-module with f(F^k(x)·m)=F^l(x)·f(m) for x∈W(R) extends uniquely to a map M_S→N with the same property for x∈W(S); and an exact sequence M→N→P of such semilinear maps stays exact after (−)_S (Proposition 5.4.7, Corollary 5.4.9, Remark 5.4.10). If p^k·M=0 and D:W_n(R)→M is a derivation, then D∘F^k:W_(n+k)(R)→M vanishes (Lemma 5.5.2); so the differential of a commutative differential graded algebra whose degree-0 part is a W_n(R)-algebra satisfies d(F^n(x)·m)=F^n(x)·dm for x∈W(R) (Example 5.5.3).
6. Saturated case, étale maps, construction (BLM Proposition 5.3.2; proof of Theorem 5.3.4(1) in §5.5). For a commutative differential graded algebra E and an étale E⁰-algebra T, the graded ring E⊗_(E⁰)T has a unique differential extending that of E (because Ω¹_T≅T⊗_(E⁰)Ω¹_(E⁰)), and maps of differential graded E-algebras from it to an E-algebra D correspond to E⁰-algebra maps T→D⁰. Let A be a strict Dieudonné algebra, R′=A⁰/VA⁰, so that W_n(A)⁰≅W_n(R′) (CR.4/saturated-de-rham-witt), and let S′ be an étale R′-algebra. Put B_n=W_n(A)⊗_(W_n(R′))W_n(S′) with this differential, with restriction and F induced by those of W_n(A) and W_n(S′) (F is a map of graded rings with dF=pFd, not a map of differential graded algebras), and with V the semilinear extension of V:W_n(A)→W_(n+1)(A), which satisfies V(F(x)·m)=x·V(m). The tower (B_n)_n satisfies the eight axioms of a strict Dieudonné tower (BLM Definition 2.6.1). Axioms (1)–(5) are formal: restriction is surjective by right exactness of the tensor product, and dF=pFd, FV=p=VF and the commutation of restriction, F and V hold because both sides are semilinear extensions of the same map of the tower W_n(A), which are unique by step 5. Axioms (6)–(8) hold because the sequences W_(n+1)(A)→W_n(A)→W_n(A)^(*+1)/p (F, then d), W_(n+1)(A)[p]→W_(n+1)(A)→W_n(A) (inclusion, then restriction) and W_1(A)⊕W_1(A)^(*−1)→W_(n+1)(A)→W_n(A) ((V^n,dV^n), then restriction) of the tower W_n(A) are exact (CR.4/finite-witt-F-lifting, CR.4/finite-witt-restriction-kernel, and the definition of W_n) and, being sequences of semilinear maps, stay exact after (−)_(S′) by step 5. Hence B=lim_n B_n is a strict Dieudonné algebra with W_n(B)≅B_n (CR.4/strict-dieudonne-tower; BLM Proposition 2.6.5, Proposition 2.9.1, Corollary 2.9.3); so B⁰=W(S′), B⁰/VB⁰=S′, and W_n(A)→W_n(B) is étale for every n.
7. Saturated case, étale maps, universal property and conclusion (BLM Proposition 5.5.1, Theorem 5.3.4(2), Corollary 5.3.5). Let C be a strict Dieudonné algebra with a map A→C and let g:S′→C⁰/VC⁰ be a map of R′-algebras. Since W_n(R′)→W_n(S′) is étale and W_n(C)⁰→C⁰/VC⁰ is surjective with nilpotent kernel, g lifts uniquely to W_n(R′)-algebra maps W_n(S′)→W_n(C)⁰, which extend uniquely to maps B_n→W_n(C) of differential graded W_n(A)-algebras by step 6; these commute with restriction and with F (it is enough to compare on W_n(A) and on W_n(S′), which generate B_n as a graded ring; on W_n(S′) the two maps to W_(n−1)(C)⁰ agree modulo a nilpotent ideal, hence agree), and their limit is the unique map of Dieudonné algebras B→C over A inducing g. For A=WsatΩ_R and an étale R-algebra S take S′=S⊗_R R′: then maps B→C correspond to ring maps S→C⁰/VC⁰, so B is WsatΩ_S, and W_n(WsatΩ_R)⊗_(W_n(R))W_n(S)≅W_n(A)⊗_(W_n(R′))W_n(S′)=B_n≅W_n(WsatΩ_S), the first isomorphism by the base-change statement of step 5.
8. Sheaf property: on affines the presheaves are S↦M⊗_(W_r(R))W_r(S) for the W_r(R)-module M=W_rΩ^q; the Zariski sheaf property follows since the Teichmüller lifts [s_α] of elements generating the unit ideal of R generate the unit ideal of W_r(R); when p is nilpotent, S↦W_r(S) identifies the étale sites of R and W_r(R), which gives étale descent; cohomology vanishes on affines at each level r and passes to the limit because restriction is surjective (BLM Theorem 5.2.2, Remark 5.2.3, Proposition 5.2.4, Theorem 5.3.7; Langer–Zink Proposition 1.9).

**Depends on:** `CR.4/relative-de-rham-witt`, `CR.4/saturated-de-rham-witt`, `CR.4/strict-completion`, `CR.4/finite-witt-F-lifting`, `CR.4/finite-witt-restriction-kernel`, `mathlib:Algebra.Etale`, `CR.4/strict-dieudonne-tower`.

**Sources:** [lz-relative](https://www.math.uni-bielefeld.de/~zink/dRW.pdf), §1.4, Propositions 1.7, 1.8, the Remarks after them and Proposition 1.9, printed pp.23–27. Langer–Zink prove the étale base change under the hypothesis 'S is F-finite or p is nilpotent in S' (Proposition 1.7), which is needed only for W_n(S)→W_n(S′) to be étale; the remark quoted gives the Frobenius-twisted linear form used in (2).; [bms1](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §10.1 Theorem 10.4 with proof and §10.3 Lemma 10.8 with proof, pp.81–82. Lemma 10.8 is statement (1) for every map A→R of Z_(p)-algebras, deduced from Langer–Zink's proof and Theorem 10.4. In the proof 'If p is nilpotent in S or S is F-finite' should read R (register entry PAPER-BHATT-MORROW-SCHOLZE-18/E9).; [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §5.1 Propositions 5.1.4, 5.1.5, Corollary 5.1.6, pp.55–57; §5.2 Theorem 5.2.2, Remark 5.2.3, Proposition 5.2.4, pp.57–59; §5.3 Definitions 5.3.1, 5.3.3, Proposition 5.3.2, Theorem 5.3.4, Corollary 5.3.5 with proof, Theorem 5.3.7 with proof, pp.59–61. Statement (3) and the saturated part of (4): Proposition 5.1.5 and Corollary 5.1.6 give the localisation, the remark after Proposition 5.1.4 that A[s⁻¹] is usually not strict, Corollary 5.3.5 the displayed isomorphism for an étale map of F_p-algebras, Theorems 5.2.2 and 5.3.7 the Zariski and étale sheaf properties, Remark 5.2.3 quasi-coherence over W_r(O_X), and Proposition 5.2.4 the vanishing of Zariski cohomology on affines. All are stated for F_p-algebras and F_p-schemes with no further hypothesis.; [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §5.4 Theorem 5.4.1 with its proof for F_p-algebras, Remark 5.4.2, Definitions 5.4.3, 5.4.4, 5.4.8, Proposition 5.4.7, Corollary 5.4.9, Remark 5.4.10, pp.61–64. Proof step 5. The theorem is stated for arbitrary commutative rings, but the source proves it only for F_p-algebras (pp.62–63) and refers to Langer–Zink, van der Kallen and Borger for the general case. The node uses it from this source only for étale maps of F_p-algebras, in statement (3) and the saturated part of (4); statements (1), (2) and the first sentence of (4) rest on BMS1 Theorem 10.4. In Definition 5.4.8 the printed 'f(x)' should read f(m).; [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §5.5 Proposition 5.5.1 with proof, Lemma 5.5.2, Example 5.5.3 and the proof of Theorem 5.3.4, pp.65–68; the results on strict Dieudonné towers it uses: §2.6 Definition 2.6.1, Propositions 2.6.2, 2.6.5, pp.21–23, and §2.9 Proposition 2.9.1, Corollary 2.9.3, pp.27–28. Proof steps 6 and 7: the proof of Theorem 5.3.4, on which Corollary 5.3.5 rests. The V-adically étale strict Dieudonné algebra is the limit of the tower 𝒲_n(A)^*⊗_(W_n(R))W_n(S). The printed proof says that R and F extend to maps of commutative differential graded algebras, which is true for R only (F satisfies dF=pFd), and it ends with the tower axioms; that 𝒲_n of the limit is the n-th term of the tower is Proposition 2.9.1, which the proof does not cite.

**Acceptance.**

- For R=A[T]→S=A[T,T⁻¹]: W_rΩ^n_(S/A)=W_rΩ^n_(R/A)[[T]⁻¹].
- For an F_p-algebra R and s∈R: W_r(WsatΩ_(R[1/s]))=W_r(WsatΩ_R)[[s]⁻¹] for every r.
- For an F_p-algebra R: H⁰(Spec R,WsatΩ^q)=WsatΩ^q_R and H^n(Spec R,WsatΩ^q)=0 for n>0 (BLM Proposition 5.2.4).

### torus-integral-part — Laurent Witt weights and the integral quasi-isomorphism

**Theorem:** `TauCeti.Crystalline.wittTorusIntegral`. For S=A[T₁^±1,…,T_d^±1], the basic Witt expansion extends to all weights a∈p^(−r)Z^d, with a fixed total order ≼_a on the coordinate indices refining the nondecreasing valuations v_p(a_i), including v_p(0)=∞, and resolving every tie. Partition the ordered indices into consecutive intervals I₀,…,I_q, with I₀ possibly empty and the others nonempty. Nonintegral blocks use V and dV; integral nonzero blocks use F^v d of the corresponding divided-weight Teichmüller monomial; zero blocks use dlog of the product of their coordinates, as in the three cases of BMS1 10.12. The coefficient module for weight a is V^u(a)W_(r−u(a))(A), u(a)=max(−min_i v_p(a_i),0). The map τ:Ω^*_(W_r(A)[U^±1]/W_r(A))→W_rΩ^*_(S/A), U_i↦[T_i], is injective and a quasi-isomorphism. Its image is exactly the integral-weight subcomplex; the fractional-weight complement is acyclic. The image depends on these coordinates.

**Hypotheses and conventions.**

- p is a prime; A is an arbitrary Z_(p)-algebra; S=A[T₁^±1,…,T_d^±1]; r≥1.
- The expansion describes W_rΩ^n_(S/A) as a direct sum of the W_r(A)-modules V^u(a)W_(r−u(a))(A) over weights a and partitions; it is not a basis over W_r(S).
- Choose the same total order ≼_a for every occurrence of a weight. Ordered blocks are consecutive intervals in this order; arbitrary ordered set partitions would overcount the coefficient summands.

**Construction or proof.**

1. Localize the polynomial expansion at [T_i] and take its increasing union; this permits negative weights and introduces the zero-weight dlog blocks. Retain the fixed total order refining the valuations and use only consecutive interval partitions, as in BMS1 §10.4, condition (iii), p.83.
2. Identify the image of τ with the integral-weight terms by the ordinary Laurent monomial basis.
3. On each fractional weight use its first nonintegral block to give the differential contraction. This proves acyclicity and the quasi-isomorphism without assuming ghost injectivity for a torsion base.

**Depends on:** `CR.4/witt-basic-differentials`, `CR.4/witt-localization-descent`, `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex`, `mathlib:KaehlerDifferential.mvPolynomialBasis`, `mathlib:KaehlerDifferential.isLocalizedModule_map`.

**Sources:** [bms1](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §10.4: weights, the partitions P_a, Cases 1–3, Theorem 10.12 with proof, the integral part, Theorem 10.13 with proof, pp.83–85. Theorems 10.12 and 10.13 for Laurent polynomial algebras over an arbitrary Z_(p)-algebra, with the three kinds of block; the image of τ and the acyclicity of the complement are in the proof of 10.13. As printed, Case 1 has V^(−v(a|I₀)) where V^(u(a|I₀)) is meant and Case 2 an undefined index ρ (register entry PAPER-BHATT-MORROW-SCHOLZE-18/E10); the node describes the blocks through u(a) and is unaffected.

**Acceptance.**

- For d=1 the weight-zero part of W_rΩ^*_(S/A) is W_r(A) in degree 0 and W_r(A)·dlog[T] in degree 1, the image under τ of W_r(A)⊕W_r(A)·dlog U.
- For d=1, r=2 and the weight a=1/p the summand is {V(x[T])} in degree 0 and {dV(x[T])} in degree 1, x∈W_1(A)=A, and d maps the first isomorphically onto the second; so this fractional summand is acyclic.

### classical-regular-comparison — Classical and saturated de Rham–Witt comparison

**Comparison:** `TauCeti.Crystalline.classicalSaturatedComparison`. (1) Let R be a regular Noetherian F_p-algebra and {W_rΩ^*_R}_r its classical de Rham–Witt complex (CR.4/classical-de-rham-witt). The tower {W_r(WsatΩ_R)}_r, with its Verschiebung maps and the map W(R)→WsatΩ_R⁰ lifting e:R→S_R, is an R-framed V-pro-complex, and the resulting maps γ_r:W_rΩ^*_R→W_r(WsatΩ_R) are isomorphisms for all r≥0; hence γ:WΩ^*_R→WsatΩ_R is an isomorphism of differential graded algebras compatible with V, restriction and the maps from W(R), and ν:Ω^*_R→W_1(WsatΩ_R) is an isomorphism. (2) Let k be a perfect F_p-algebra and R a smooth k-algebra; then ν:Ω^*_R→W_1(WsatΩ_R) is an isomorphism. (3) Let B be a p-torsion-free ring with a ring endomorphism φ, φ(x)≡x^p mod p, such that B/pB is smooth over a perfect F_p-algebra. Then the p-completed de Rham complex Ω̂^*_B is a Dieudonné complex of Cartier type, and the map μ:Ω̂^*_B→WsatΩ_(B/pB) of CR.4/saturated-de-rham-witt is a quasi-isomorphism.

**Hypotheses and conventions.**

- p is a prime.
- (1): R is a regular Noetherian F_p-algebra, for example a smooth algebra over a perfect field.
- (2): k is a perfect F_p-algebra, not necessarily Noetherian, and R is a smooth k-algebra; Ω^*_R denotes absolute differentials, which equal Ω^*_(R/k).
- (3): B is p-torsion-free with an endomorphism φ lifting the Frobenius of B/pB, and B/pB is smooth over a perfect F_p-algebra; B need not be p-adically complete.

**Construction or proof.**

1. Cartier: for A smooth over a perfect F_p-algebra k the Cartier map Ω^*_A→H^*(Ω^*_A), x↦x^p, dy↦[y^(p−1)dy], is an isomorphism. This is DerivedDeRhamCohomology:DD.3/smooth-cartier for A over k, using Ω^*_(A/k)=Ω^*_A and that the Frobenius twist of A over k is identified with A by the Frobenius of k (BLM Proposition 3.3.4, Theorem 3.3.6).
2. (3): first replace B by its p-adic completion B̂. For a p-torsion-free B, B̂ is p-torsion-free, B̂/pⁿ≅B/pⁿ, and φ extends continuously; Ω̂^*_B≅Ω̂^*_(B̂) by the universal property of continuous differentials. These completion facts are part of the explicit completion contract below. Now use DD.2/formal-ordinary-derham for B̂: Ω̂ is p-torsion-free, Ω̂/p=Ω^*_(B/pB), and its divided Frobenius induces Cartier modulo p (BLM Remark 3.3.3, Example 3.3.5 and Corollary 3.3.8). The strict-completion theorem makes Ω̂→W(Sat Ω̂) a quasi-isomorphism, and saturated-de-rham-witt identifies the target with WsatΩ_(B/pB) (BLM Theorem 4.2.4).
3. (2): choose a p-torsion-free, p-adically complete lift B of R with a Frobenius lift (lift R to W_n(k) for each n). Then ν is the composite Ω^*_R≅Ω̂^*_B/p→WsatΩ_R/p→W_1(WsatΩ_R); in the square formed with the Cartier isomorphism, the isomorphism H^*(Ω̂^*_B/p)≅H^*(WsatΩ_R/p) of step 2 and the isomorphism W_1(M)≅H^*(M/pM) induced by F for saturated M, ν is an isomorphism (BLM Proposition 4.3.2).
4. Filtered colimits: strict Dieudonné algebras have filtered colimits, computed as the completion of the colimit of saturated ones, and W_r commutes with them; so R↦W_r(WsatΩ_R) commutes with filtered colimits (BLM Proposition 4.3.3, Corollary 4.3.5). A regular Noetherian F_p-algebra is a filtered colimit of smooth F_p-algebras (Popescu), so step 3 gives that ν is an isomorphism for regular Noetherian R (BLM Theorem 4.3.1).
5. (1), the map: for a strict Dieudonné algebra A with a ring map R→A⁰/VA⁰, the tower {W_r(A)}_r with V and the lift β:W(R)→A⁰ is an R-framed V-pro-complex; axioms (c)–(e) are checked after applying the injective map F, for example F((Vx)·dβ[λ])=x·dβ([λ]^p)=F(V(x·β[λ]^(p−1)·dβ[λ])). Initiality of the classical complex gives γ (BLM Proposition 4.4.10, Corollary 4.4.11).
6. (1), isomorphism: R↦W_rΩ^*_R (Illusie I.1.10) and R↦W_r(WsatΩ_R) commute with filtered colimits, so by Popescu assume R smooth over F_p. By CR.4/classical-de-rham-witt the classical complex is Illusie's pro-complex, and Illusie's results on the sheaves WΩ^i_X, X=Spec R, give the following for R on global sections, because H^j(X,WΩ^i_X)=0 for j>0 and p, F, V are injective on WΩ^i_X. (i) WΩ^*_R=lim_r W_rΩ^*_R carries an endomorphism F of graded rings with FV=VF=p, dF=pFd and F(x)≡x^p mod p on W(R) (Illusie I.2.17, I.2.18, I.2.19 and (0.1.4.8)); so it is a Dieudonné algebra. (ii) WΩ^*_R is p-torsion-free (Illusie, Corollaire I.3.6) and d⁻¹(p·WΩ^(i+1)_R)=F(WΩ^i_R) (Illusie, Remarques I.3.21.1, formula (3.21.1.5) with n=1); so it is saturated. (iii) ker(WΩ^*_R→W_rΩ^*_R)=V^r(WΩ^*_R)+dV^r(WΩ^(*−1)_R) (Illusie, Proposition I.3.31; Proposition I.3.2 is the same statement for W_mΩ^*_R with m finite, and the limit is not formal because dV^r(WΩ^(i−1)_X) is not closed in general, Illusie I.3.32); on global sections one uses that the kernel of dV^r:WΩ^(i−1)_X→WΩ^i_X/V^r(WΩ^i_X) is F^r(WΩ^(i−1)_X), by (3.21.1.5). Hence WΩ^*_R is a strict Dieudonné algebra with W_r(WΩ^*_R)=W_rΩ^*_R. γ commutes with F because V is injective on WsatΩ_R and Vγ(Fx)=γ(VFx)=γ(px)=VFγ(x). Hence γ_r=W_r(γ) is an isomorphism for all r as soon as it is one for r=1 (CR.4/finite-witt-cohomology (3), BLM Corollary 2.7.4), and γ_1 is ν of step 4 since W_1Ω^*_R=Ω^*_R (BLM Theorem 4.4.12).
7. Langer–Zink complex: {W_r(WsatΩ_R)}_r is also an F–V procomplex for R/F_p (FV=p, FdV=d and the projection formula hold in WsatΩ_R, and Fd[x]=[x]^(p−1)d[x] because WsatΩ_R is p-torsion-free), so there are maps W_rΩ^*_(R/F_p)→W_r(WsatΩ_R). Their composite with the surjection W_rΩ^*_R→W_rΩ^*_(R/F_p) of CR.4/classical-de-rham-witt is a morphism of R-framed V-pro-complexes, hence equals γ_r; as γ_r is injective, the surjection is an isomorphism.

**Depends on:** `CR.4/saturated-de-rham-witt`, `CR.4/classical-de-rham-witt`, `CR.4/relative-de-rham-witt`, `CR.4/strict-completion`, `CR.4/cartier-saturation-mod-p`, `DerivedDeRhamCohomology:DD.3/smooth-cartier`, `DerivedDeRhamCohomology:DD.3/polynomial-cartier-map`, `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex`, `DerivedDeRhamCohomology:DD.2/formal-ordinary-derham`, `CR.4/finite-witt-cohomology`, `CR.4/dieudonne-algebra`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §3.3 (Remark 3.3.3, Proposition 3.3.4, Example 3.3.5, Theorem 3.3.6, Corollary 3.3.8), pp.34–35; §4.3 (Theorem 4.3.1, Proposition 4.3.3, Corollary 4.3.5), pp.46–48; §4.4 (Proposition 4.4.10, Corollary 4.4.11, Theorem 4.4.12 with proof), pp.51–53. Statement (1) for the classical complex of BLM Definition 4.4.6. The compatibility of γ with F and the comparison with the Langer–Zink complex are not in the source; the first is in its proof for smooth R, the second is proof step 7.; [shiho](https://www.ms.u-tokyo.ac.jp/journal/pdf/jms140404.pdf), §2, Theorem 2.1 (Popescu) and Theorem 2.2 (Grothendieck's limit theorem), p.572. Shiho states Popescu's theorem for regular local rings of characteristic p, without proof; BLM use it for regular Noetherian F_p-algebras with a reference to the Stacks project. The node uses the statement and does not prove it.; [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §4.2, Corollary 4.2.3 and Theorem 4.2.4, p.45. Statement (3), with the printed hypothesis that R/pR is smooth over a perfect ring of characteristic p; no completeness or smoothness of R itself is assumed.; [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §4.3, Proposition 4.3.2 with proof, pp.46–47. Statement (2): over a perfect ring only the comparison of W_1 with the de Rham complex is proved, not the comparison with the classical complex at all levels.; [illusie-drw](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), Part I, §3 (X smooth over a perfect scheme): Proposition 3.2 (p. 568), Proposition 3.31 (p. 582) with its proof and Remarque 3.32 (p. 583). Proof step 6 (iii): Fil^n WΩ^*_X=V^n WΩ^*_X+dV^n WΩ^(*−1)_X for the kernel Fil^n of WΩ^*_X→W_nΩ^*_X, X smooth over a perfect scheme. Proposition 3.2, which BLM cite for this, is the corresponding statement for W_rΩ^*_X with r finite, and by Remarque 3.32 the limit is not formal (dV^n WΩ^(i−1)_X is not closed in general).; [illusie-drw](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), Part I, §3: Corollaire 3.6 (p. 570), Proposition 3.21 and Remarques 3.21.1, formula (3.21.1.5) (p. 579). Proof step 6 (ii): for X smooth over a perfect scheme, p, F and V are injective on WΩ^i_X (3.6), and d⁻¹(p^n WΩ^(i+1)_X)=F^n WΩ^i_X for all n≥0 ((3.21.1.5), the display just before the excerpt); with n=1 these are the two conditions for WΩ^*_X to be saturated. BLM cite only Remark I.3.21.1.; [illusie-drw](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), Part I, §2 E: Théorème 2.17, Proposition 2.18 and 2.19 ((2.19.1)–(2.19.6)), printed pp. 562–565; Part 0, (1.4.8), printed p. 511. Proof step 6 (i): F exists on W_•Ω^* for every F_p-algebra (2.17), with FV=VF=p, dF=pFd, FdV=d (2.18), and gives the endomorphism F of WΩ^* with the same identities (2.19); F(x)=x^p+p·α(x) on W(A) is (0.1.4.8). No smoothness is needed for this part.

**Acceptance.**

- For a perfect field k: W_rΩ^*_k=W_r(k)=W_r(WsatΩ_k), concentrated in degree 0, and γ_r is the identity.
- For R=F_p[t] (smooth over F_p): W_1(WsatΩ_R)=Ω^*_R, so d[t] has nonzero image dt, and Ω̂^*_(Z_p[t])→WsatΩ_R (φ(t)=t^p) is a quasi-isomorphism.
- Outside the regular case γ is not an isomorphism: for R=F_p[ε]/ε², [ε]≠0 in W_rΩ⁰_R=W_r(R) while WsatΩ_R=Z_p; for the cusp R=F_p[t²,t³], W_1Ω²_R=Ω²_R≠0 while WsatΩ²_R=0 (BLM Proposition 6.3.1).

### crystalline-comparison — Finite and infinite crystalline de Rham–Witt comparison

**Theorem:** `TauCeti.Crystalline.crystallineWittComparison`. (a) Let A be a ring in which p is nilpotent and X a smooth A-scheme. For each r≥1 there is an isomorphism Ru_(r*)O_(X/W_r(A))≅W_rΩ^*_(X/A) in D⁺(X_Zar,W_r(A)), functorial in X, where u_r:(X/W_r(A))_crys→X_Zar and the crystalline site is formed with respect to the canonical divided powers on the kernel V W_(r−1)(A) of the projection w₀:W_r(A)→A. (b) More generally, for a quasi-coherent crystal E of flat modules on (X/W_r(A))_crys, Ru_(r*)E is represented by E_r⊗_(W_r(O_X))W_rΩ^*_(X/A), where E_r is the value of E on the PD thickening X→W_r(X) and the differential is induced by the connection of the crystal. (c) For X smooth over a perfect field k (the case A=k), these isomorphisms are compatible in r and give Ru_*O_(X/W(k))≅Rlim_r W_rΩ^*_(X/k)≅WΩ^*_(X/k), and the corresponding isomorphisms on RΓ(X,−); here lim_r W_rΩ^q=Rlim_r W_rΩ^q because the restriction maps are surjective on affine opens.

**Hypotheses and conventions.**

- p is a prime. (a), (b): p is nilpotent in A and X is a smooth A-scheme; nilpotence of p is a hypothesis of the comparison, not of the complex W_rΩ^*_(X/A).
- (b): E is a quasi-coherent crystal of flat O_(X/W_r(A))-modules.
- (c): k is a perfect field and X is a smooth k-scheme; W_rΩ^*_(X/k) is the Langer–Zink complex relative to k.

**Construction or proof.**

1. Local lifts: Zariski-locally X=Spec B with B étale over A[T₁,…,T_d]; A_r=W_r(A)[T] with T_i↦T_i^p is a Frobenius lift with δ_r:A_r→W_r(A[T]), T_i↦[T_i], and it extends uniquely to an étale B_r with δ_r:B_r→W_r(B) (Langer–Zink Proposition 3.2). For an embedding of X into a smooth scheme Y with a Witt lift (Y_r,Δ_r), the comparison morphism is the composite from the de Rham complex of the PD envelope of X in Y_r to W_r(O_X)⊗Ω^*_(W_r(Y)/W_r(A)) and on to W_rΩ^*_(X/A); it is independent of the embedding (compare through products) and is defined globally by simplicial methods (Langer–Zink §3.2, (3.4)–(3.7)).
2. For X=Spec B as above the source of the comparison is Ω^*_(B_r/W_r(A)) (CR.2/embedding-computation). By CR.4/witt-localization-descent (2), with p^m·W_r(A)=0, both sides for B are obtained from those for the polynomial algebra by the flat base change B_(m+r)⊗_(A_(m+r),φ^m)−, compatibly with d; so assume B=A[T]. Then W_rΩ^*_(B/A)=C_int⊕C_frac (integral and non-integral weights, CR.4/witt-basic-differentials), the comparison maps Ω^*_(A_r/W_r(A)) isomorphically onto C_int, and C_frac is acyclic by the formula for d on basic forms (Langer–Zink Proposition 2.6). This proves (a) (Langer–Zink Theorem 3.5).
3. (b): the connection on E_r is obtained from the crystal on the thickening W_r(B)⊕Ω; the comparison map is a quasi-isomorphism by reduction to the structure sheaf, using Grothendieck's linearisation of differential operators and the flatness of E (Langer–Zink Theorem 3.8, Lemma 3.9).
4. (c): the local lifts are compatible in r, so the comparison maps are; pass to the derived limit. On the de Rham–Witt side the derived limit is the ordinary limit because restriction is surjective on affine opens (CR.4/relative-de-rham-witt). Where a tower of complexes is replaced by one with projective terms and surjective transition maps, the replacement is an isomorphism in the derived category of towers, and a surjective quasi-isomorphism only when the original tower has surjective transition maps (Berthelot–Ogus erratum, (B2.1), (B2.1a)).

**Depends on:** `CR.4/relative-de-rham-witt`, `CR.4/witt-verschiebung-divided-powers`, `CR.4/witt-basic-differentials`, `CR.4/witt-localization-descent`, `CR.4/classical-regular-comparison`, `CR.2/embedding-computation`, `CR.2/linearization`, `CR.2/crystalline-cohomology`, `AdicSpacesPartII:F0/cohomology-of-mittag-leffler-limit`, `EnhancedDerivedSheaves:E2`.

**Sources:** [lz-relative](https://www.math.uni-bielefeld.de/~zink/dRW.pdf), §3.1 (Theorem 3.1, Proposition 3.2, Definition 3.3, Proposition 3.4), §3.2 ((3.4)–(3.7)), §3.3 Theorem 3.5 with proof, printed pp.67–75; §3.5 Theorem 3.8 and Lemma 3.9, printed pp.82–90. Statement (a) is Theorem 3.5 (R the base, with p nilpotent; 'This isomorphism is functorial in X'), statement (b) is Theorem 3.8 ('for any crystal E of flat modules', E quasi-coherent). Three cross-references in this chapter are misprinted ((3.2) for (3.4); §1.2 for §3.2 twice).; [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §10.1, Theorem 10.1.1 (quoted from Illusie, Théorème II.1.4) and Theorem 10.1.2, p.128. BLM's statement for the classical (equivalently saturated) complex of a smooth scheme over a perfect field, on cohomology rings, with crystalline cohomology relative to (Z_p,(p)). BLM attribute it to Illusie, Théorème II.1.4, which is the finite-level statement for sheaves, over W_n(S), for X smooth of finite type over a perfect scheme (see the Illusie source of this node). The node's statement (c) is for the Langer–Zink complex and is derived from (a).; [bo-correction](https://math.berkeley.edu/~ogus/preprints/BO_B2_Erratumre.pdf), both pages: the replacement text for assertion (B2.1) of Appendix B of Berthelot–Ogus and the new statement (B2.1a) with its proof. The erratum replaces (B2.1) by an isomorphism in the derived category of towers and proves a surjective quasi-isomorphism only for towers with surjective transition maps; used in proof step 4 only.; [illusie-drw](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), Part II, introduction (p. 598) and §1: 1.1 ((1.1.1)), Proposition 1.2 (a)–(c) ((1.2.1)–(1.2.4)), 1.3 ((1.3.1)–(1.3.3)), Théorème 1.4 with its proof, printed pp. 600–607; Proposition 2.1 (a), Théorème 2.7 and Scholie 2.8, printed pp. 607–611. Illusie's comparison for his (classical) complex: for S a perfect scheme of characteristic p and X smooth of finite type over S, the arrow Ru_(X/W_n*)O_(X/W_n)→W_nΩ^*_X of D(X_Zar,f⁻¹W_n(O_S)) is an isomorphism for every n≥1 (Théorème 1.4), multiplicative, functorial, compatible with Frobenius and with the transition maps (Proposition 1.2). Illusie states no isomorphism of sheaves over W: for X proper and smooth over a perfect field he sets RΓ(X/W)=RΓ(X,WΩ^*_X) (Scholie 2.8). Part (c) is for the Langer–Zink complex and passes to the limit in proof step 4; that lim=Rlim on affine opens is Illusie's remark on p. 608.

**Acceptance.**

- For X=Spec k, k a perfect field: both sides are W_r(k) in degree 0.
- For A=Z/p^n and X=Spec A[T]: W_rΩ^*_(A[T]/A)=C_int⊕C_frac with C_int≅Ω^*_(W_r(A)[T]/W_r(A)) and C_frac acyclic, so both sides compute the de Rham cohomology of W_r(Z/p^n)[T] over W_r(Z/p^n).

### degree-scaled-frobenius — Graded and crystalline Frobenius conventions

**Theorem:** `TauCeti.Crystalline.wittCrystallineFrobenius`. In every F–V procomplex dF=pFd, so the graded Frobenius F is in general not a map of complexes. Let p be nilpotent in A and X a smooth A-scheme. The absolute Frobenius 𝐅:W_rΩ^q_(X/A)→W_(r−1)Ω^q_(X/A), 𝐅=p^q·F, is a map of complexes, semilinear over F:W_r(A)→W_(r−1)(A); it is the map induced on de Rham–Witt complexes by F:W_r(O_X)→W_(r−1)(O_X). The crystalline complexes carry an absolute Frobenius 𝐅:Ru_(r*)O_(X/W_r(A))→Ru_((r−1)*)O_(X/W_(r−1)(A)), induced by the absolute Frobenius of X₀=X⊗F_p and the PD morphism Spec W_(r−1)(A)→Spec W_r(A) given by F, for the divided powers extended to the kernel of W_r(A)→A/pA. The comparison isomorphisms of CR.4/crystalline-comparison at levels r and r−1 intertwine the two maps 𝐅. For X smooth over a perfect field k, the limit over r is the endomorphism φ=p^q·F of the complex WΩ^*_(X/k), and it corresponds to the crystalline Frobenius of Ru_*O_(X/W(k)).

**Hypotheses and conventions.**

- p is a prime; p is nilpotent in A; X is a smooth A-scheme; r≥2.
- For the last sentence k is a perfect field and X is smooth over k.
- In degree q=0 the scaling factor is 1.

**Construction or proof.**

1. d(p^q·F(x))=p^q·p·F(dx)=p^(q+1)·F(dx), so 𝐅 commutes with d; it is the map induced by functoriality of differential forms from the square formed by F on W_r(O_X) and F on W_r(A), because d(Fξ)=p·F(dξ) (Langer–Zink (3.15)–(3.16)).
2. Reduce by the simplicial construction to X embedded in a smooth affine Y with a Frobenius lift Φ_r:Y_(r−1)→Y_r (Langer–Zink Proposition 3.2). The crystalline 𝐅 is then represented by the map of PD-envelope de Rham complexes induced by Φ_r, and the square with the comparison maps commutes because the maps Δ_r of the Frobenius lift intertwine Φ with F on Witt vectors (Langer–Zink (3.17)–(3.20), Proposition 3.6).
3. For X smooth over a perfect field pass to the limit over r: φ=p^q·F on WΩ^q_(X/k).

**Depends on:** `CR.4/relative-witt-complex`, `CR.4/crystalline-comparison`, `CR.3/frobenius-map`.

**Sources:** [lz-relative](https://www.math.uni-bielefeld.de/~zink/dRW.pdf), §3.3, diagrams (3.15)–(3.18) and Proposition 3.6 with (3.19)–(3.20), printed pp.75–77. The definition 𝐅=p^iF on W_nΩ^i, the crystalline absolute Frobenius and their compatibility are as printed (R the base, p nilpotent in R as in Theorem 3.5).; [bms2](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), §8.1, paragraph after Definition 8.1 (before Lemma 8.2), p.266. BMS2 use the same convention φ=p^jF in degree j on WΩ^*_A for A smooth over a perfect field.; [illusie-drw](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), Part I, introduction (p. 542); §2 E: Proposition 2.18 ((2.18.2), (2.18.7)) and 2.19 (the sentence after (2.19.6)), printed pp. 564–565. For every F_p-scheme X: dF=pFd ((2.18.2)), the endomorphism 𝐅 of W_nΩ^*_X induced by F on W_n(O_X) satisfies R∘𝐅=p^i·F:W_nΩ^i_X→W_(n−1)Ω^i_X ((2.18.7)), and in the limit 𝐅=p^i·F on WΩ^i_X (2.19; announced in the excerpt, which continues 'dont on vérifie qu'il est donné par p^i F en degré i'). Illusie's finite-level 𝐅 is an endomorphism of W_nΩ^*_X; the node's 𝐅:W_r→W_(r−1) (Langer–Zink) is its composite with restriction.; [illusie-drw](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), Part II: Proposition 1.2 (b), square (1.2.3), printed p. 603; Scholie 2.8, (2.8.4), printed pp. 610–611. The last sentence of the statement, for Illusie's complex: the comparison isomorphism is compatible with Frobenius at each finite level ((1.2.3), X smooth of finite type over a perfect scheme), and for X proper and smooth over a perfect field 𝐅=p^i·F on WΩ^*_X induces the Frobenius of RΓ(X/W) ((2.8.4), the excerpt). The statement for the sheaf Ru_*O_(X/W(k)) is obtained in the node through CR.4/crystalline-comparison (c).

**Acceptance.**

- For k[t], F(d[t])=[t]^(p−1)d[t] but φ(d[t])=p[t]^(p−1)d[t].
- For dlog[t], F fixes the form and φ multiplies it by p.

### nygaard-filtration — Nygaard filtration and divided Frobenius

**Construction:** `TauCeti.Crystalline.Nygaard`. Let M be a saturated Dieudonné complex and i an integer. Define N^(≥i)M^q=p^(i−q−1)·V(M^q) for q<i and N^(≥i)M^q=M^q for q≥i. This is a subcomplex of M, decreasing in i, and x∈M^q lies in N^(≥i)M^q if and only if p^q·F(x)∈p^i·M^q; equivalently N^(≥i)M=α_F⁻¹(p^iM∩η_pM), where α_F=p^q·F in degree q. Hence φ=α_F restricted to N^(≥i)M is uniquely divisible by p^i, giving a map of complexes φ_i=φ/p^i:N^(≥i)M→M, and N^(≥i)M is the largest subcomplex of M on which φ is divisible by p^i. The graded pieces gr^i_N M=N^(≥i)M/N^(≥i+1)M vanish in degrees >i, and x↦p^(−i)·α_F(x) induces an isomorphism of complexes gr^i_N M≅τ^(≤i)(M/pM). M is complete for the filtration if and only if every M^q is p-adically complete. If M is a saturated Dieudonné algebra the filtration is multiplicative, N^(≥i)·N^(≥j)⊂N^(≥i+j), and φ_(i+j)(xy)=φ_i(x)·φ_j(y). Maps of saturated Dieudonné complexes preserve the filtration and commute with the φ_i. For R smooth over a perfect field k and M=WΩ^*_R, a strict Dieudonné algebra by CR.4/classical-regular-comparison, this is the Nygaard filtration N^(≥i)WΩ^*_R: p^(i−1)V W(R)→p^(i−2)V WΩ¹_R→⋯→V WΩ^(i−1)_R→WΩ^i_R→WΩ^(i+1)_R→⋯; it is transported to Ru_*O_(X/W(k)) for a smooth k-scheme X by CR.4/crystalline-comparison.

**Hypotheses and conventions.**

- p is a prime; M is a saturated Dieudonné complex (termwise p-torsion-free, with V satisfying FV=VF=p); i is an integer, and N^(≥i)M=M for i≤0 when M is concentrated in degrees ≥0.
- For multiplicativity M is a saturated Dieudonné algebra.
- In the last sentence R is a smooth algebra over a perfect field k, respectively X a smooth k-scheme.

**API.**

- `TauCeti.Crystalline.Nygaard.degree` (simp): For q<i, N≥i in degreeq is p^(i−q−1)imV; in degreeq≥i it is all forms.
- `TauCeti.Crystalline.Nygaard.dividedF` (data): p^iφ_i is the restriction of φ and φ_i is a cochain map.
- `TauCeti.Crystalline.Nygaard.decalage` (compatibility): For a saturated Dieudonné complex M, α_F maps N^(≥i)M isomorphically onto p^iM∩η_pM (BLM Proposition 8.2.1(2)); for M=WΩ^*_R this is BMS2 Proposition 8.5.
- `TauCeti.Crystalline.Nygaard.mem_iff` (characterisation): For x∈M^q: x∈N^(≥i)M^q if and only if p^q·F(x)∈p^i·M^q.
- `TauCeti.Crystalline.Nygaard.map` (functoriality): A map f:M→M′ of saturated Dieudonné complexes satisfies f(N^(≥i)M)⊂N^(≥i)M′ and f∘φ_i=φ_i∘f; in particular this holds for WΩ^*_R→WΩ^*_(R′) induced by a homomorphism of smooth algebras over a perfect field.
- `TauCeti.Crystalline.Nygaard.mul` (relation): For a saturated Dieudonné algebra: N^(≥i)M·N^(≥j)M⊂N^(≥i+j)M and φ_(i+j)(xy)=φ_i(x)·φ_j(y).
- `TauCeti.Crystalline.Nygaard.gr_iso` (equivalence): x↦p^(−i)·α_F(x) induces an isomorphism of complexes gr^i_N M≅τ^(≤i)(M/pM), and gr^i_N M vanishes in degrees >i (BLM Proposition 8.2.1(1),(4)).

**Unit tests.**

- `TauCeti.Crystalline.test_nygaard_zero` (degenerate): N≥0=WΩ.
- `TauCeti.Crystalline.test_nygaard_perfect` (computation): For a perfect field k in degree0, N≥iW(k)=p^iW(k).
- `TauCeti.Crystalline.test_nygaard_boundary` (non-example): At degreeq=i−1, N≥i=imV with no extra factor p; at degreeq=i it is the whole module.

**Uses.** BMS2 §8.1; BLM §8; DerivedDeRhamCohomology:DD.4/derived-de-rham-witt: The filtration with its divided Frobenius maps φ_i, functorial in smooth F_p-algebras, is the input that is left Kan extended to the derived de Rham–Witt complex. PrismaticCohomology:PR.4/log-forms-divided-frobenius; PrismaticCohomology:PR.5/absolute-nygaard-perfect-prism: They use N^(≥i)WΩ and φ_i−1 for smooth schemes over a perfect field, and the description N^n={x: φ(x)∈p^nWΩ} for regular Noetherian F_p-algebras.

**Construction or proof.**

1. Subcomplex: for q+1<i, d(p^(i−q−1)·V(y))=p^(i−q−2)·V(dy) by Vd=p·dV; for q+1=i, dV(y)∈M^i (BLM Construction 8.1.1).
2. α_F(p^(i−q−1)·V(y))=p^(i−1)·FV(y)=p^i·y, so α_F(N^(≥i)M^q)⊂p^iM^q. Conversely, if q<i and p^q·F(x)=p^i·y, then p^q·F(x)=p^q·F(p^(i−q−1)·V(y)) and F is injective, so x∈N^(≥i)M^q (BLM Proposition 8.2.1(2)). This gives φ_i, its uniqueness (M is p-torsion-free) and the maximality.
3. Graded pieces: in degrees q<i, p^q·F induces a bijection p^(i−q−1)V M^q/p^(i−q)V M^q→p^iM^q/p^(i+1)M^q because F:V M^q→pM^q is bijective; in degree i, F:M^i/VM^i→d⁻¹(pM^(i+1))/pM^i is bijective by saturation (BLM Proposition 8.2.1(3),(4)).
4. Completeness: p^(i−q)·M^q⊂N^(≥i)M^q⊂p^(i−q−1)·M^q for q<i (BLM Remark 8.1.2). Multiplicativity: V(u)·V(v)=p·V(uv) and V(u)·y=V(u·F(y)) (CR.4/dieudonne-algebra), and α_F is multiplicative. Functoriality: maps of saturated Dieudonné complexes commute with F and V.
5. For R smooth over a perfect field, WΩ^*_R is a strict Dieudonné algebra (CR.4/classical-regular-comparison (1)) and the formula is BMS2 Definition 8.1; φ:WΩ^*_R≅η_pWΩ^*_R identifies N^(≥i) with p^iWΩ∩η_pWΩ (BMS2 Proposition 8.5).

**Depends on:** `CR.4/saturated-frobenius`, `CR.4/saturated-F-range`, `CR.4/verschiebung-identities`, `CR.4/dieudonne-algebra`, `CR.4/classical-regular-comparison`, `CR.4/degree-scaled-frobenius`, `CR.4/principal-p-decalage`, `CR.4/crystalline-comparison`.

**Sources:** [bms2](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), §8.1, Definition 8.1, the definition of φ_i after it, Proposition 8.5 with proof and the definition of the filtration on Ru_*O^crys after it, pp.265–268. Definition 8.1 and Proposition 8.5 for WΩ^*_A, A smooth over a perfect field; the node states the construction for every saturated Dieudonné complex (BLM) and specialises to this case.; [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §8.1 Construction 8.1.1, Remark 8.1.2, Example 8.1.3; §8.2 Proposition 8.2.1 with proof, pp.100–102. The construction, the description N^kM=α_F⁻¹(p^kM∩η_pM), the graded pieces and the completeness criterion for an arbitrary saturated Dieudonné complex. Multiplicativity for Dieudonné algebras is not stated there; it is checked in proof step 4.

**Acceptance.**

- N^(≥0)M=M for M in degrees ≥0; for a perfect F_p-algebra k and M=W(k): N^(≥i)W(k)=p^i·W(k) (BLM Example 8.1.3).
- For R=k[t] over a perfect field k: d[t]∈N^(≥1)WΩ¹_R but d[t]∉N^(≥2)WΩ¹_R=V WΩ¹_R (its image in W_1Ω¹=Ω¹_R is dt≠0); φ(d[t])=p·[t]^(p−1)·d[t] and φ_1(d[t])=[t]^(p−1)·d[t].
- In degree q=i−1, N^(≥i)M^q=V(M^q) with no further factor of p; in degree q=i it is M^i.

### nygaard-filtration-comparisons — Nygaard, conjugate, Hodge and lift filtrations

**Comparison:** `TauCeti.Crystalline.nygaardComparisons`. Let R be a smooth algebra over a perfect field k and WΩ=WΩ^*_R with its Nygaard filtration. (1) The composite N^(≥i)WΩ--φ_i→WΩ→Ω^*_(R/k) lands in the canonical truncation τ^(≤i)Ω^*_(R/k), kills N^(≥i+1)WΩ, and induces a quasi-isomorphism gr^i_N WΩ→τ^(≤i)Ω^*_(R/k). (2) The sequence WΩ/N^(≥i)--p→WΩ/N^(≥i+1)→Ω^(≤i)_(R/k) is a cofiber sequence, where Ω^(≤i) is the stupid truncation and the second map is induced by WΩ→Ω^*_(R/k)→Ω^(≤i)_(R/k). (3) Let Ã be the p-adic completion of a smooth W(k)-algebra lifting R, with a chosen lift φ̃ of Frobenius, and let σ:Ω̂^*_(Ã/W(k))→WΩ be the comparison map constructed from φ̃. Then σ maps the subcomplex p^max(i−•,0)Ω̂^•_(Ã/W(k)), with terms p^(i−q)Ω̂^q for q<i and Ω̂^q for q≥i, into N^(≥i)WΩ, and the induced map is a quasi-isomorphism for every i≥0.

**Hypotheses and conventions.**

- p is a prime; k is a perfect field; R is a smooth k-algebra; i≥0.
- τ^(≤i) is the canonical truncation (kernel of d in degree i, zero above) and Ω^(≤i) the stupid truncation (zero above degree i); they are different complexes.
- (3): Ã is the p-adic completion of a smooth W(k)-algebra with Ã/p=R, and φ̃:Ã→Ã lifts the Frobenius of R; σ depends on φ̃.

**Construction or proof.**

1. (1): φ_i identifies gr^i_N WΩ with τ^(≤i)(p^iWΩ/p^(i+1)WΩ)≅τ^(≤i)(WΩ/p) (CR.4/nygaard-filtration), and WΩ/p→W_1Ω=Ω^*_(R/k) is a quasi-isomorphism (BLM Corollary 2.7.2 with CR.4/classical-regular-comparison); the composite to Ω^*_(R/k) lands in τ^(≤i) because dF=pFd (BMS2 Lemma 8.2).
2. (2): multiplication by p is injective on WΩ/N^(≥i) with cokernel the complex W(R)/p→⋯→WΩ^(i−1)/p→WΩ^i/V WΩ^i. Its map to Ω^(≤i)_(R/k) is surjective with kernel K: K^q=Fil¹WΩ^q/pWΩ^q for q<i and K^i=Fil¹WΩ^i/V WΩ^i, where Fil¹=V WΩ+dV WΩ. K is acyclic: in degrees ≤i−2 it agrees with the acyclic complex Fil¹WΩ/p (the kernel of the quasi-isomorphism WΩ/p→Ω); if y=V(a)+dV(b) in degree i−1 has dy=dV(a)∈V WΩ^i, then da=FdV(a)∈pWΩ^i, so a=F(a′) by saturation and V(a)=p·a′, that is y≡d(V(b)) mod p; and K^i is generated by the elements dV(b)=d(V(b)) (BMS2 Lemma 8.3, which quotes Illusie II.3.20 for this step).
3. (3): σ is a quasi-isomorphism because σ mod p is the identity of Ω^*_(R/k) under WΩ/p≃Ω^*_(R/k); it maps p^(i−q)Ω̂^q into N^(≥i)WΩ^q since p=VF. On graded pieces one compares Ω̂^q/p with the cohomology groups p·WΩ^q/(p·V WΩ^q+p·dV WΩ^(q−1)) for q<i and WΩ^i/(V WΩ^i+dV WΩ^(i−1)), which restriction identifies with Ω^q_(R/k) (BMS2 Proposition 8.7).

**Depends on:** `CR.4/nygaard-filtration`, `CR.4/classical-regular-comparison`, `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex`, `DerivedDeRhamCohomology:DD.2/formal-ordinary-derham`, `mathlib:CochainComplex.truncLE`, `mathlib:HomologicalComplex.stupidTrunc`, `CR.4/finite-witt-cohomology`.

**Sources:** [bms2](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), §8.1, Lemma 8.2 and Lemma 8.3 with proofs, pp.266–267; §8.1.2, Proposition 8.7 with proof, pp.269–270. Lemma 8.2 (graded pieces and the canonical truncation), Lemma 8.3 (the cofiber sequence with the stupid truncation) and Proposition 8.7 (smooth lift with a Frobenius lift) are as printed; BMS2 add that they expect the filtration in degrees ≥p not to be obtainable without the choice of a Frobenius lift, which the node does not assert.; [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §8.2 Proposition 8.2.1(3),(4); §8.3 Proposition 8.3.3, Corollaries 8.3.4, 8.3.5, Example 8.3.6, pp.101–104. The graded pieces for any saturated Dieudonné complex, and the filtered quasi-isomorphism for a Cartier-type lift with Frobenius (BLM Example 8.3.6), which is statement (3) in BLM's setting.

**Acceptance.**

- For a perfect field R=k: gr^i_N W(k)=p^iW(k)/p^(i+1)W(k)≅k=τ^(≤i)Ω^*_(k/k) for every i≥0.
- For R=k[t] and i=0: gr⁰_N WΩ=W(R)/V W(R)=k[t] in degree 0, and φ_0 induces x↦x^p, an isomorphism onto τ^(≤0)Ω^*_(R/k)=k[t^p]; in (2), WΩ/N^(≥0)=0 and the cofibre is WΩ/N^(≥1)=k[t]=Ω^(≤0)_(R/k). The two truncations differ: k[t^p]⊂k[t] is a proper inclusion.

### logarithmic-witt-sheaf — Logarithmic Hodge–Witt sheaves

**Construction:** `TauCeti.Crystalline.LogWitt`. Let X be a regular locally Noetherian F_p-scheme, q≥0 and r≥1, and let W_rΩ^q_X be the sheaf on the small étale site of X given on affines by the de Rham–Witt complex (on regular Noetherian rings the classical, Langer–Zink and saturated complexes agree by CR.4/classical-regular-comparison). The logarithmic Hodge–Witt sheaf W_rΩ^q_(X,log) is the image, in the category of sheaves on X_ét, of the map (O_X^×)^(⊗q)→W_rΩ^q_X, u₁⊗⋯⊗u_q↦dlog[u₁]∧⋯∧dlog[u_q], where dlog[u]=[u]⁻¹·d[u]. For q=0 it is the image of Z→W_r(O_X), the constant sheaf Z/p^r. Its sections are closed forms. For X smooth over a perfect field k, WΩ^q_(X,log)=lim_r W_rΩ^q_(X,log), formed in sheaves on the pro-étale site of X.

**Hypotheses and conventions.**

- p is a prime; X is a regular locally Noetherian F_p-scheme; q≥0; r≥1.
- W_rΩ^q_X is regarded as a sheaf on the small étale site of X and the image is formed there: a section is étale-locally a sum of symbols dlog[u₁]∧⋯∧dlog[u_q].
- For WΩ^q_(X,log): X is smooth over a perfect field k, and the limit is taken on the pro-étale site.

**API.**

- `TauCeti.Crystalline.LogWitt.symbol` (constructor): For V→X étale and units u₁,…,u_q∈O_X(V)^×, symbol_V(u₁,…,u_q)∈W_rΩ^q_(X,log)(V) has image ∧_(i=1)^q([u_i]⁻¹d[u_i]) in W_rΩ^q_X(V). The empty tuple maps to 1. The symbol is additive in each unit under multiplication, and commutes with étale restriction and length restriction.
- `TauCeti.Crystalline.LogWitt.closed_fixed` (relation): Every local section ω of W_rΩ^q_(X,log) satisfies dω=0. For every local section ω̃ of W_(r+1)Ω^q_(X,log) with restriction ω to level r, F(ω̃)=ω in W_rΩ^q_X, where F:W_(r+1)Ω^q_X→W_rΩ^q_X; indeed F(dlog[u])=dlog[u].
- `TauCeti.Crystalline.LogWitt.map` (functoriality): Pullback of schemes sends a unit symbol to the symbol of its pulled-back units.

**Unit tests.**

- `TauCeti.Crystalline.test_logWitt_zero_degree` (degenerate): W_rΩ⁰_log is the constant Z/p^r generated by1.
- `TauCeti.Crystalline.test_logWitt_torus` (computation): On G_m, the symbol of t is dlog[t], a closed degree-one section.
- `TauCeti.Crystalline.test_logWitt_not_all` (non-example): On Spec F_p[t] at length1, dt is not a logarithmic section on the whole scheme: its Cartier image is0 whereas logarithmic forms are Cartier fixed.

**Uses.** Shiho §2; CMM §5.3; BMS2 §8.1: Provides the unit-symbol coefficients in finite and pro-étale logarithmic exact sequences; finite F is defined through its stated quotient, which is essential for the kernel API.

**Construction or proof.**

1. dlog[u]=[u]⁻¹·d[u] is additive in u because the Teichmüller lift is multiplicative, so the symbol map is defined on (O_X^×)^(⊗q); d(dlog[u])=0 and F(dlog[u])=dlog[u] in every F–V procomplex (CR.4/relative-witt-complex).
2. W_rΩ^q_X is an étale sheaf (CR.4/witt-localization-descent); the image sheaf is the étale sheafification of the presheaf image, and pullback along a morphism of schemes sends symbols to symbols.
3. For q=0 the map is Z→W_r(O_X), 1↦1, whose image is the constant sheaf Z/p^r since W_r(F_p)=Z/p^r. For X smooth over a perfect field, the sheaves W_rΩ^q_(X,log) are pulled back to the pro-étale site and their inverse limit along restriction is taken there (BMS2 §8.1).

**Depends on:** `CR.4/relative-witt-complex`, `CR.4/classical-regular-comparison`, `CR.4/witt-localization-descent`, `SchemeAndStackFoundations:SF.2`.

**Sources:** [shiho](https://www.ms.u-tokyo.ac.jp/journal/pdf/jms140404.pdf), §2, Definition 2.6, p.575. Shiho defines the sheaf for every F_p-scheme, as the image of the symbol map in sheaves on X_et (stated in the parenthesis after the display); the node restricts to regular X, where it is used.; [cmm](https://www.imo.universite-paris-saclay.fr/~matthew.morrow/Clausen%2C%20Mathew%2C%20Morrow%2C%20K-theory%20and%20TC%20of%20Henselian%20pairs.pdf), §5.3, Definitions 5.25 and 5.26, p.43. The same construction for rings: CMM form the image Zariski-locally and state, citing Morrow, that forming it étale-locally gives the same group of sections; the node uses the étale image and does not assert that comparison.; [bms2](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), §8.1, paragraph before Proposition 8.4, p.267. Definition of W_rΩ^i_(X,log) as a pro-étale subsheaf and of WΩ^i_(X,log) as the limit over r, for X smooth over a perfect field.; [illusie-drw](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), Part I, §5, 5.7, definition (5.7.1), printed pp. 596–597; the map dlog in 3.23, (3.23.1), printed p. 580. Illusie's definition, for X smooth over a perfect scheme of characteristic p, i≥1 and n≥1: the abelian subsheaf of W_nΩ^i_X generated locally for the étale topology by the forms dlog[x₁]⋯dlog[x_i], x_j∈O_X^×, with dlog[x]=d[x]/[x] ((3.23.1)); it is 0 for n≤0. The node takes the same étale-local image for regular X and for q=0 (Shiho); the limit over r on the pro-étale site is not in Illusie.; [illusie-drw](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), Part 0, §2.4: 2.4.1 ((2.4.1.1)–(2.4.1.3)), Théorème 2.4.2 (Bloch) and the sentence after it, printed pp. 527–528. Length one: for X smooth over an F_p-scheme S and i≥1, the étale sheaf generated by the forms dlog x₁⋯dlog x_i is the kernel ν(i) of W^*−C on closed i-forms; Illusie adds that he does not know whether it is generated Zariski-locally when i≥2. This supports forming the image on the étale site and the third acceptance item (a logarithmic form is closed and fixed by C).

**Acceptance.**

- W_rΩ⁰_(X,log) is the constant sheaf Z/p^r.
- On the torus G_m=Spec F_p[t,t⁻¹], dlog[t] is a section of W_rΩ¹_log; it is closed and F(dlog[t])=dlog[t].
- On Spec F_p[t] the form dt is not a section of Ω¹_log=W_1Ω¹_log: C(dt)=0 because dt is exact, while a logarithmic form ω satisfies C(ω)=ω (Shiho Proposition 2.10).

### logarithmic-witt-sequences — Illusie and Shiho logarithmic exact sequences

**Theorem:** `TauCeti.Crystalline.logWittExactSequences`. Let X be a regular locally Noetherian F_p-scheme and q≥0; all sheaves are on the small étale site of X. (1) For r≥1, F:W_(r+1)Ω^q_X→W_rΩ^q_X induces F:W_rΩ^q_X→W_rΩ^q_X/dV^(r−1)Ω^(q−1)_X (with Ω^(−1)=0), and the sequence 0→W_rΩ^q_(X,log)→W_rΩ^q_X--1−F→W_rΩ^q_X/dV^(r−1)Ω^(q−1)_X→0 is exact. (2) The sequence of pro-sheaves 0→W_•Ω^q_(X,log)→W_•Ω^q_X--R−F→W_•Ω^q_X→0 is exact. (3) For positive integers n, m, multiplication by p^m on W_(n+m)Ω^q_(X,log) induces a map p̲^m:W_nΩ^q_(X,log)→W_(n+m)Ω^q_(X,log), and the sequence 0→W_nΩ^q_(X,log)--p̲^m→W_(n+m)Ω^q_(X,log)--R^n→W_mΩ^q_(X,log)→0 is exact; consequently 0→W_•Ω^q_(X,log)--p^m→W_•Ω^q_(X,log)→W_mΩ^q_(X,log)→0 is an exact sequence of pro-sheaves.

**Hypotheses and conventions.**

- p is a prime; X is a regular locally Noetherian F_p-scheme; q≥0.
- Exactness is for sheaves on the small étale site; it does not hold on global sections or for Zariski sheaves in general.
- In (1) r≥1 and Ω^(−1)=0; in (3) n, m≥1.

**Uses.** PrismaticCohomology:PR.4/log-forms-divided-frobenius (BMS2 Proposition 8.4): The exactness of the pro-sequence 0→W_•Ω^i_log→W_•Ω^i--R−F→W_•Ω^i→0 is the degree-i step in proving that φ_i−1:N^(≥i)WΩ→WΩ is surjective on the pro-étale site with kernel WΩ^i_log[−i], and that WΩ^i_log=Rlim_r W_rΩ^i_log. Clausen–Mathew–Morrow §5.3, proof of Lemma 5.31: The p^r, R^(s−r) pro-sequence (3) and the R−F pro-sequence (2) are applied to a regular affine scheme and to closed subschemes to obtain their relative versions.

**Construction or proof.**

1. For regular X, ker(W_(r+1)Ω^q_X→W_rΩ^q_X)=V^rΩ^q_X+dV^rΩ^(q−1)_X (Shiho Proposition 2.3), and F(V^rΩ^q_X)=p·V^(r−1)Ω^q_X=0, F(dV^rΩ^(q−1)_X)=dV^(r−1)Ω^(q−1)_X; so F descends to W_rΩ^q_X→W_rΩ^q_X/dV^(r−1)Ω^(q−1)_X (Shiho Lemma 2.7). For X smooth over a perfect scheme these are Illusie, Propositions I.3.2 and I.3.3.
2. (1): reduce to strictly local rings, write them as filtered colimits of smooth F_p-algebras (Popescu, Shiho Theorem 2.1) and pass to the limit (Shiho Theorem 2.2; Shiho Proposition 2.8). Smooth case, X smooth over F_p, q≥1; write π for the projection W_rΩ^q_X→W_rΩ^q_X/dV^(r−1)Ω^(q−1)_X, so that π∘(R−F)=(1−F)∘R on W_(r+1)Ω^q_X. (i) W_rΩ^q_(X,log) lies in the kernel of 1−F because F(dlog[u])=dlog[u]. (ii) R−F:W_(r+1)Ω^q_X→W_rΩ^q_X is surjective for the étale topology (Illusie I.3.26), hence so is 1−F. (iii) If x∈W_rΩ^q_X and (1−F)x=0, choose locally x̃∈W_(r+1)Ω^q_X with Rx̃=x and b∈Ω^(q−1)_X with Rx̃−Fx̃=dV^(r−1)b; the element z=dV^r(b) of W_(r+1)Ω^q_X satisfies Rz=0 and Fz=dV^(r−1)b (FdV=d), so (R−F)(x̃+z)=0; by Illusie (I.5.7.4) with m=0, x̃+z∈W_(r+1)Ω^q_(X,log)+ker R, and x=R(x̃+z)∈W_rΩ^q_(X,log). For q=0 the sequence is Illusie I.3.28. (The smooth case is also [Colliot-Thélène–Sansuc–Soulé, §1, Lemme 2], quoted in Shiho Proposition 2.8.)
3. (2) follows from (1) because the projection W_•Ω^q_X→W_•Ω^q_X/dV^(•−1)Ω^(q−1)_X is an isomorphism of pro-sheaves: restriction kills dV^(r−1)Ω^(q−1)_X⊂W_rΩ^q_X (Shiho Corollary 2.9).
4. (3): reduce to the smooth case as in step 2 (Shiho Proposition 2.12). Smooth case, X smooth over F_p, q≥1: multiplication by p^m on W_(n+m)Ω^q_X has kernel ker(R^m:W_(n+m)Ω^q_X→W_nΩ^q_X), so it induces an injection p̲^m:W_nΩ^q_X→W_(n+m)Ω^q_X (Illusie I.3.4); p̲^m maps W_nΩ^q_(X,log) onto p^m·W_(n+m)Ω^q_(X,log), and R^n is surjective on the logarithmic sheaves, because symbols lift along restriction. If x∈W_(n+m)Ω^q_(X,log) and R^n(x)=0, lift x locally to x̃∈W_(n+m+1)Ω^q_(X,log); then R^(n+1)x̃=0, that is x̃∈Fil^m W_(n+m+1)Ω^q_X, and (R−F)x̃=0, so x̃∈p^m·W_(n+m+1)Ω^q_(X,log)+ker R by Illusie (I.5.7.4), and x=Rx̃∈p^m·W_(n+m)Ω^q_(X,log). For q=0 the sequence is 0→Z/p^n→Z/p^(n+m)→Z/p^m→0. (The smooth case is also [Colliot-Thélène–Sansuc–Soulé, §1, Lemme 3], quoted in Shiho Proposition 2.12.) The pro-version follows by passing to the systems in n (Shiho Corollary 2.13; for smooth X it is Illusie, Corollaire I.5.7.5).

**Depends on:** `CR.4/logarithmic-witt-sheaf`, `CR.4/classical-regular-comparison`.

**Sources:** [shiho](https://www.ms.u-tokyo.ac.jp/journal/pdf/jms140404.pdf), §2, Proposition 2.3, Lemma 2.7, Proposition 2.8, Corollary 2.9, Proposition 2.12 and Corollary 2.13, pp.573–577. Statements (1)–(3) are Proposition 2.8 (with Lemma 2.7), Corollary 2.9, Proposition 2.12 and Corollary 2.13 with the printed indices. Shiho proves them by reduction to smooth schemes and quotes the smooth cases.; [cmm](https://www.imo.universite-paris-saclay.fr/~matthew.morrow/Clausen%2C%20Mathew%2C%20Morrow%2C%20K-theory%20and%20TC%20of%20Henselian%20pairs.pdf), §5.3, the sequence recalled before Lemma 5.31 and the two diagrams in its proof, pp.44–45. CMM recall the pro-sequences for smooth varieties over a perfect field and their extension to regular F_p-schemes by Shiho (Corollary 2.13). In the second diagram of the proof the exponent of R is printed r−s for s−r (register entry PAPER-CLAUSEN-MATHEW-MORROW-21/E4).; [bms2](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), §8.1, last paragraph of the proof of Proposition 8.4, p.268. BMS2 quote the pro-sequence (2) from Illusie I.5.7.2 for smooth schemes over a perfect field and use it to prove their Proposition 8.4, which is stated by PrismaticCohomology:PR.4/log-forms-divided-frobenius, not by this node. The boundary case of that proof is misprinted ('i = n − 1' for n = i − 1): register entry PAPER-BHATT-MORROW-SCHOLZE-19/E7.; [illusie-drw](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), Part I, §5, 5.7: Théorème 5.7.2 ((5.7.2.1)), Lemme 5.7.3, formula (5.7.4), printed p. 597; Corollaire 5.7.5, printed p. 598. Statement (2) for X smooth over a perfect scheme of characteristic p and q≥1 (there '1' is the canonical projection, so 1−F is R−F:W_(n+1)Ω^i_X→W_nΩ^i_X); Lemme 5.7.3 with n=0 is statement (1) for r=1, and Corollaire 5.7.5 is the pro-form of (3). Illusie does not state the finite-level sequences (1) for r≥2 and (3); proof steps 2 and 4 derive them in the smooth case from the kernel estimate (5.7.4).; [illusie-drw](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), Part I, §3: Proposition 3.2 (p. 568), Proposition 3.3 ((3.3.1)) and Proposition 3.4 (p. 569), Proposition 3.26 (p. 581), Proposition 3.28 and Corollaire 3.29 (p. 582). For X smooth over a perfect scheme: the map F:W_nΩ^i_X→W_nΩ^i_X/dV^(n−1)Ω^(i−1)_X of statement (1), equal to C⁻¹ for n=1 (3.3, from 3.2), and the étale surjectivity of 1−F:W_(n+1)Ω^i_X→W_nΩ^i_X (3.26, the excerpt). Also used in the proof steps: the injection W_nΩ^*_X→W_(n+1)Ω^*_X induced by p, with ker(p^i)=Fil^(n+1−i) on W_(n+1)Ω^*_X (3.4), and the case q=0 of (1) and (2) (3.28, (3.29.1)).

**Acceptance.**

- q=0: (1) is the Artin–Schreier–Witt sequence 0→Z/p^r→W_r(O_X)--1−F→W_r(O_X)→0.
- r=1: (1) is 0→Ω^q_(X,log)→Ω^q_X--1−F→Ω^q_X/dΩ^(q−1)_X→0 with F the inverse Cartier operator, compatible with 0→Ω^q_(X,log)→ZΩ^q_X--C−1→Ω^q_X→0 (Shiho Proposition 2.10, Remark 2.11).
- On X=Spec F_p the map 1−F on Γ(X,O_X)=F_p is zero, so (1) is not exact on global sections; for q=0 and n=m=1, (3) is 0→Z/p→Z/p²→Z/p→0.

### saturated-seminormalisation — Degree zero of the saturated complex and seminormalisation

**Theorem:** `TauCeti.Crystalline.satDRW_residue_seminormalization`. For every commutative F_p-algebra R, the unit map e:R→S_R=WsatΩ_R⁰/V WsatΩ_R⁰ exhibits S_R as the seminormalisation of R: S_R is seminormal and every ring homomorphism from R to a seminormal ring factors uniquely through e. Consequently e is an isomorphism if and only if R is seminormal; a homomorphism R→R′ inducing an isomorphism of seminormalisations induces an isomorphism WsatΩ_R≅WsatΩ_(R′); and the adjunction between F_p-algebras and strict Dieudonné algebras restricts to an equivalence between seminormal F_p-algebras and those strict Dieudonné algebras A for which WsatΩ_(A⁰/VA⁰)→A is an isomorphism.

**Hypotheses and conventions.**

- p is a prime; R is any commutative F_p-algebra.
- A ring is seminormal if it is reduced and for all x, y with x²=y³ there is t with x=t³ and y=t²; the seminormalisation R→R^sn is the universal homomorphism from R to a seminormal ring (Swan).

**Construction or proof.**

1. S_R is seminormal (CR.4/saturated-de-rham-witt). If R→R′ induces an isomorphism of seminormalisations, then Hom(R′,A⁰/VA⁰)→Hom(R,A⁰/VA⁰) is bijective for every strict A, so WsatΩ_R≅WsatΩ_(R′) (BLM Corollary 6.5.2). Hence one may replace R by R^sn and assume R seminormal, in particular reduced.
2. Write Ψ(R)=S_R. Ψ commutes with filtered colimits and Ψ(R)=R for R smooth over a perfect F_p-algebra (CR.4/classical-regular-comparison (2); BLM Remarks 6.6.2, 6.6.3). The Frobenius of R induces the Frobenius of Ψ(R), because x↦p^nF(x) on WsatΩ^n_R is a map of Dieudonné algebras inducing it; so R→Ψ(R) becomes an isomorphism on perfections (BLM Lemma 6.6.4, Corollary 6.6.5).
3. Two R-algebra maps from Ψ(R) to a reduced ring agree; every homomorphism from R to a field k factors uniquely through Ψ(R), since a field is a filtered colimit of smooth F_p-algebras; for R reduced and finitely generated Ψ(R) embeds in the normalisation of R, using that the localisations of the normalisation at height-one primes are regular, hence filtered colimits of smooth F_p-algebras. It follows that R→Ψ(R) is integral (BLM Corollary 6.6.6, Propositions 6.6.7, 6.6.8, Corollary 6.6.9).
4. For seminormal R the map R→Ψ(R) is therefore injective, integral and bijective on k-points for every field k; a seminormal ring has no proper extension of this kind [Swan, On seminormality, Lemma 2.6], so R=Ψ(R) (BLM, proof of Theorem 6.5.3).

**Depends on:** `CR.4/saturated-de-rham-witt`, `CR.4/classical-regular-comparison`.

**Sources:** [blm-derhamwitt](https://arxiv.org/pdf/1805.05501v3), §6.5, Proposition 6.5.1, Corollary 6.5.2, Theorem 6.5.3, Remark 6.5.4, pp.74–75; §6.6 (Notation 6.6.1 to the proof of Theorem 6.5.3), pp.76–78. The statement is Theorem 6.5.3 with the consequences drawn in Corollary 6.5.2 and Remark 6.5.4; the proof steps follow §6.6.

**Acceptance.**

- For the cusp R=F_p[t²,t³]: S_R=F_p[t], the seminormalisation of R.
- For R=F_p[ε]/ε²: S_R=F_p.
- For a regular Noetherian F_p-algebra R (seminormal, being normal): R→S_R is an isomorphism, in agreement with Ω⁰_R≅W_1(WsatΩ_R)⁰.

### isocrystal-slope-decomposition — Slope decomposition on the existing isocrystal carrier

**Theorem:** `TauCeti.Crystalline.isocrystal_slope_decomposition`. Let k be a perfect field of characteristic p and V a finite-dimensional Mathlib WittVector.Isocrystal over K=FractionRing(WittVector p k). For a reduced rational λ=a/b, b>0, define the standard block over an algebraic closure of k by F(e_i)=e_(i+1) for i<b and F(e_b)=p^a e_1, with σ on coefficients. V is isoclinic of slope λ if its scalar extension is a sum of these blocks. There is a canonical finite direct-sum decomposition V=⊕_λ V_λ into isoclinic subisocrystals. Hom(V_λ,V_μ)=0 for λ≠μ. Over algebraically closed k the standard blocks are exactly the simple objects. Over a finite field F_(p^r), the slopes are v_p of eigenvalues of the K-linear F^r divided by r, with multiplicities.

**Hypotheses and conventions.**

- p prime; k perfect; V finite-dimensional. Semisimplicity and classification by simple standard blocks are asserted only over algebraically closed k.

**Construction or proof.**

1. The carrier, Frobenius-semilinear equivalences and equivariant morphisms are already in Mathlib. Construct the cyclic standard blocks and use the Dieudonné–Manin classification after extending k to an algebraic closure; the full classification is an explicit missing proof input below.
2. The different-slope Hom groups vanish: iterate Frobenius over a common denominator and use its p-adic valuation scaling to show a nonzero equivariant map cannot connect two different slopes. Thus the isoclinic summands are canonical. Their uniqueness makes them invariant under descent, giving the decomposition over perfect k.
3. For k finite, σ^r=id, so F^r is linear. Its eigenvalue valuations on a standard slope block equal rλ, giving the stated convention and the Newton-polygon computation.

**Depends on:** `mathlib:WittVector.Isocrystal`, `CR.4/witt-structural-identities`.

**Sources:** [lurie-isocrystals](https://www.math.ias.edu/~lurie/205notes/Lecture26-Isocrystals.pdf), Example 5 and Theorem 6, p.2; Definition 12 and Remark 14, p.3. The standard blocks and algebraically closed classification statement, with its isoclinic decomposition. It supplies no classification proof.; [illusie-drw](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), Chapter II, §3, Théorème 3.2 and Corollaire 3.5, pp.614–616. The slope convention used to identify the rows of the Witt spectral sequence.

**Acceptance.**

- A rank-one standard block with F=p^aσ has slope a.
- For F_3, T²+3 has slopes 1/2 twice; for F_5, T²−2T+5 has slopes 0 and 1.
- A slope-zero Jordan block over F_p need not split into one-dimensional isocrystals over F_p; semisimplicity is not asserted over that field.

### witt-slope-spectral-sequence — Degree filtration and the slope spectral sequence

**Theorem:** `TauCeti.Crystalline.wittSlopeSpectralSequence`. Let X be a smooth proper scheme of dimension d over a perfect field k, W=W(k), K=W[1/p]. The filtration of WΩ^*_X by the subcomplexes WΩ^(≥a)_X, 0≤a≤d, gives a convergent spectral sequence E₁^(a,b)=H^b(X,WΩ^a_X)⇒H^(a+b)_crys(X/W), compatible with the Frobenius φ, which acts on the a-th column through p^a·F. After tensoring with K, the E₁ terms are finite-dimensional over K, the Frobenius on the a-th column has slopes in [a,a+1), and the spectral sequence degenerates at E₁; so H^b(X,WΩ^a_X)⊗K is the part of H^(a+b)_crys(X/W)⊗K with slopes in [a,a+1). For each r≥1 the same filtration of W_rΩ^*_X gives a spectral sequence E₁^(a,b)=H^b(X,W_rΩ^a_X)⇒H^(a+b)_crys(X/W_r(k)).

**Hypotheses and conventions.**

- p is a prime; k is a perfect field; X is proper and smooth over k, of dimension d.
- The finiteness, slope and degeneration statements are after ⊗K only; nothing is asserted about E₁-degeneration over W or about finite generation of H^b(X,WΩ^a_X) over W.

**Construction or proof.**

1. The filtration by the subcomplexes WΩ^(≥a)_X is finite, so hypercohomology gives a convergent spectral sequence with the stated E₁ term; its abutment is crystalline cohomology by CR.4/crystalline-comparison (c). The same holds at each finite level r.
2. φ=p^a·F in degree a preserves the filtration (CR.4/degree-scaled-frobenius), so the differentials commute with the induced Frobenius maps.
3. Write H=H^b(X,WΩ^a_X) and T for its p-torsion submodule. T is killed by a power p^N of p and H/T is a free W-module of finite type (Illusie, Théorème II.2.13); F and V act on H with FV=VF=p (Illusie II.3.1), so the slopes of F on (H/T)⊗K lie in [0,1]. H is separated for the V-adic topology (Illusie, Corollaire II.2.5); hence ∩_n V^n(H/T)=0 (if x lies in the intersection and x̃∈H lifts x, then p^N·x̃∈∩_n V^n(H)=0, so x̃∈T), V is topologically nilpotent on H/T, and F has no slope 1. So F has slopes in [0,1) on H⊗K and φ=p^a·F has slopes in [a,a+1) on the a-th column (Illusie, proof of Théorème II.3.2).
4. Maps of F-isocrystals between objects with disjoint slope intervals vanish (CR.4/isocrystal-slope-decomposition); the differentials d_r⊗K, r≥1, connect columns a and a+r, so they vanish.

**Depends on:** `CR.4/crystalline-comparison`, `CR.4/degree-scaled-frobenius`, `CR.3/proper-perfectness`, `CR.4/isocrystal-slope-decomposition`, `ArithmeticGaloisDuality:R02.2/first-quadrant-spectral-sequence`.

**Sources:** [ekedahl](https://archive.ymsc.tsinghua.edu.cn/pacm_download/116/7414-11512_2006_Article_BF02384380.pdf), §0 (Definitions and preliminaries), sentence after Lemma 0.8, printed p.191. The source only recalls the spectral sequence E₁^(i,j)=H^j(X,WΩ^i)⇒H^*(X/W) for proper X, with a citation of Illusie–Raynaud. The slope bound and the degeneration after ⊗K are not in this source; they are Illusie 1979, II, Théorème 3.2 and Corollaire 3.5 (the Illusie sources of this node).; [illusie-drw](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), Part II, §3 A: 3.1 ((3.1.1)–(3.1.6)), Théorème 3.2 with its proof, Corollaire 3.3, 3.4, Corollaire 3.5 ((3.5.4)), printed pp. 614–616. The spectral sequence, the action of 𝐅=p^i·F on the i-th column, d_r⊗K=0 for r≥1, the slope interval [i,i+1) and the identification (3.5.4) of H^(*−i)(X,WΩ^i_X)⊗K with the part of H^*(X/W)⊗K of slopes in [i,i+1), for X proper and smooth over a perfect field; Illusie takes H^*(X/W)=lim_n H^*(X/W_n) (Scholie II.2.8). The finite-level spectral sequence of the last sentence is not stated in the paper; it follows from Théorème II.1.4.; [illusie-drw](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), Part II, §2: standing hypotheses and Proposition 2.1 (p. 607), Corollaire 2.5 (p. 609), Théorème 2.7 and Scholie 2.8 (pp. 610–611), Remarque 2.12 and Théorème 2.13 (pp. 612–613). The finiteness used in proof step 3, for X proper and smooth over a perfect field: the p-torsion of H^j(X,WΩ^i_X) is killed by a power of p and the quotient is a free W-module of finite type (2.13), and H^j(X,WΩ^i_X) is separated and complete for the V-adic topology (2.5).

**Acceptance.**

- For a proper smooth curve only the columns a=0 and a=1 occur, with slopes in [0,1) and [1,2).
- For an elliptic curve E over k: if E is ordinary, H¹_crys(E/W)⊗K has slopes 0 and 1, and H¹(E,WO_E)⊗K, H⁰(E,WΩ¹_E)⊗K both have dimension 1; if E is supersingular, the slopes are 1/2, 1/2, H¹(E,WO_E)⊗K has dimension 2 and H⁰(E,WΩ¹_E)⊗K=0.

### perfectoid-witt-base-change-input — Finite Witt base change for integral perfectoid rings

**Theorem:** `TauCeti.Crystalline.perfectoid_witt_base_change_input`. Let S→S′ be a map of integral perfectoid rings in the sense of BMS1 Definition 3.5. For 1≤j≤r the canonical maps W_j(S)⊗^L_(A_inf(S))A_inf(S′)→W_j(S′) and W_j(S)⊗^L_(W_r(S))W_r(S′)→W_j(S′) are isomorphisms, using either restriction or Frobenius for the W_r-module structure. For 1≤j<r, Ann_(W_r(S))(V^j(1))=ker(F^j:W_r(S)→W_(r−j)(S)), V^j(1)W_r(S)=V^jW_(r−j)(S), and F^j and multiplication by V^j(1) identify W_r(S)/Ann(V^j(1)) with W_(r−j)(S) and V^jW_(r−j)(S), respectively.

**Hypotheses and conventions.**

- S,S′ integral perfectoid; no p-torsion-free or roots-of-unity assumption is added.
- The P1 supplier is requested at the full BMS1 Definition 3.5 generality, including discrete perfect F_p-algebras. The existing Tate-pair P1 nodes do not by themselves supply this generality.

**Construction or proof.**

1. Use the requested full integral-perfectoid P1 interface: A_inf(S)=W(S♭), functorial surjective maps θ_j and θ̃_j to W_j(S), and principal kernels generated by the non-zero-divisors ξ_j and ξ̃_j of BMS1 Lemma 3.12. A map S→S′ takes these generators to generators up to a unit, hence to non-zero-divisors. Lemmas 3.10–3.12 prove this for BMS1 Definition 3.5 rings; the currently written Tate-pair nodes cover only a special case.
2. The two-term resolution for this quotient has no higher Tor after base change because the image remains a non-zero-divisor. Apply it at lengths j and r and use associativity of derived tensor to obtain the two base-change maps.
3. The formula xV^j(1)=V^j(F^j(x)), injectivity of V^j and surjectivity of F^j for perfectoid S give both annihilator and image identities. The first isomorphism theorem gives the two quotient identifications.

**Depends on:** `PerfectoidSpaces:P1`, `CR.4/witt-structural-identities`, `DerivedDeRhamCohomology:DD.1/koszul-complex`.

**Sources:** [bms1](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), Definition 3.5, p.21; Lemmas 3.10–3.13 and proofs, pp.22–24; Remark 3.19 and proof, p.26. The integral perfectoid hypothesis, distinguished non-zero-divisor kernels, quotient resolutions and finite Witt annihilator formulas.

**Acceptance.**

- For perfect F_p-algebras, ξ=p and W_j=W/p^j; the statement is the familiar truncated-Witt base change.
- The annihilator formulas use 1≤j<r and do not identify finite Witt rings with p-torsion-free rings.

### perfectoid-base-change — Relative Witt forms over perfectoid bases

**Theorem:** `TauCeti.Crystalline.wittPerfectoidBaseChange`. For a homomorphism A→A′ of perfectoid rings, a smooth A-algebra R with base change R′=R⊗_A A′, and r≥1: (i) the W_r(A)-modules W_rΩ^q_(R/A) and W_r(A′) are Tor-independent for every q≥0; (ii) the canonical map W_rΩ^*_(R/A)⊗_(W_r(A))W_r(A′)→W_rΩ^*_(R′/A′) is an isomorphism of differential graded W_r(A′)-algebras.

**Hypotheses and conventions.**

- p is a prime; A and A′ are perfectoid rings in the sense of BMS1 Definition 3.5 (this includes perfect F_p-algebras); A→A′ is any ring homomorphism.
- R is a smooth A-algebra; r≥1; q≥0.

**Construction or proof.**

1. Both statements are local for the Zariski topology on Spec R, so assume there is an étale map A[T₁^±1,…,T_d^±1]→R; then W_rΩ^n_(R/A)=W_r(R)⊗_(W_r(A[T^±1]))W_rΩ^n_(A[T^±1]/A) and likewise over A′ (CR.4/witt-localization-descent (1)).
2. By CR.4/torus-integral-part, W_rΩ^n_(A[T^±1]/A) is a direct sum of modules V^uW_(r−u)(A), compatibly with A→A′. For perfectoid A→A′ and 1≤j≤r, W_j(A)⊗^L_(W_r(A))W_r(A′)≅W_j(A′), with W_j(A) a W_r(A)-module through restriction or Frobenius (BMS1 Lemma 3.13), and V^jW_(r−j)(A)≅W_(r−j)(A) as W_r(A)-modules through F^j (BMS1 Remark 3.19). So each summand is Tor-independent from W_r(A′) and base changes to the corresponding summand over A′.
3. W_r(R) is flat over W_r(A[T^±1]), being étale, and W_r(A′[T^±1])⊗_(W_r(A[T^±1]))W_r(R)=W_r(R′) (BMS1 Theorem 10.4); this gives Tor-independence for R and the chain of identifications proving (ii).

**Depends on:** `CR.4/torus-integral-part`, `CR.4/witt-localization-descent`, `CR.4/perfectoid-witt-base-change-input`.

**Sources:** [bms1](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §10.5, Proposition 10.14 with proof, p.85; inputs: §3 Lemma 3.13 (p.24), Remark 3.19 (p.26), §10.1 Theorem 10.4 (p.81). Proposition 10.14 (i) and (ii) with the printed hypotheses; the proof route (Laurent chart, Theorem 10.12, Lemma 3.13, Remark 3.19, Theorem 10.4) is the source's.

**Acceptance.**

- For the ring of integers O of a perfectoid field with residue field k, A=O→A′=k and R=O[T^±1]: W_rΩ^n_(R/O)⊗_(W_r(O))W_r(k)≅W_rΩ^n_(k[T^±1]/k), with no higher Tor.
- For perfect F_p-algebras A→A′ and R=A[T]: each summand V^uW_(r−u)(A)≅W(A)/p^(r−u) satisfies W(A)/p^j⊗^L_(W(A)/p^r)W(A′)/p^r=W(A′)/p^j, since p is a nonzerodivisor on W(A) and W(A′).

## Supplier contracts

### Contract 1 — EnhancedDerivedSheaves:E2

Let (X,O) be a ringed topos, Λ a finite totally ordered set, (U_λ)_{λ∈Λ} subobjects of the final object of X whose union is the final object, and K a bounded-below complex of O-modules. Then RΓ(X,K) is isomorphic in D(Γ(X,O)) to the total complex of the double complex whose n-th column (n≥0) is ∏_{λ₀<…<λ_n}RΓ(U_{λ₀}×…×U_{λ_n},K), computed by the sections of one K-injective resolution of K, and whose horizontal differential is Σ_j(−1)^j·(restriction omitting λ_j); the isomorphism is natural in K. Consequently a morphism K→K′ of bounded-below complexes that induces isomorphisms RΓ(U_{λ₀}×…×U_{λ_n},K)→RΓ(U_{λ₀}×…×U_{λ_n},K′) for all λ₀<…<λ_n induces an isomorphism RΓ(X,K)→RΓ(X,K′).

Used by `CR.3/crystalline-descent`.

### Contract 2 — EnhancedDerivedSheaves:E2

Let (X,O) be a ringed site and (K_r)_{r≥1} a tower in the enhanced derived category D(X,O). Then the homotopy limit Rlim_r K_r exists, RΓ(U,Rlim_r K_r)≃Rlim_r RΓ(U,K_r) naturally for every object U of the site, and there are exact sequences 0→R¹lim_r H^{i−1}(U,K_r)→H^i(U,Rlim_r K_r)→lim_r H^i(U,K_r)→0 for all i. A morphism of towers that is an isomorphism at every level induces an isomorphism of homotopy limits.

Used by `CR.4/crystalline-comparison`.

### Contract 3 — EnhancedDerivedSheaves:E1

For a ringed topos (Sh(C),O), a ring map A→Γ(C,O) and K, M in D(O): the cup product RΓ(C,K)⊗^L_A RΓ(C,M)→RΓ(C,K⊗^L_O M), a morphism of D(A) natural in K and M; it is associative, unital for A→RΓ(C,O), and graded commutative (on cohomology x∪y=(−1)^{ij}·y∪x for x of degree i and y of degree j, under the exchange K⊗^L_O M≅M⊗^L_O K); it is compatible with pullback along morphisms of ringed topoi and with the base-change maps of commutative squares of ringed topoi.

Used by `CR.3/cup-product`.

### Contract 4 — DerivedDeRhamCohomology:DD.1

Let R be a commutative ring and f₁,…,f_r∈R a sequence that is weakly regular on R (each f_i is a non-zero-divisor on R/(f₁,…,f_{i−1})). Then the Koszul complex K_R(f₁,…,f_r) of DerivedDeRhamCohomology:DD.1/koszul-complex has H_i=0 for i>0 and H₀=R/(f₁,…,f_r). In particular every (r_t)∈R^r with Σ_t r_t f_t=0 is an R-linear combination of the Koszul relations f_j e_i−f_i e_j, i<j. Also supply that if a finite sequence is weakly regular, replacing any of its members by a positive power preserves weak regularity, including the mixed sequence f₁^p,…,f_(t−1)^p,f_t used in the envelope proof.

Used by `CR.0/regular-envelope`.

### Contract 5 — DerivedDeRhamCohomology:DD.1

Let R be a ring, I⊂R a nilpotent ideal and K an object of D(R) such that K⊗^L_R R/I is a perfect complex of R/I-modules. Then K is a perfect complex of R-modules.

Used by `CR.3/proper-perfectness`.

### Contract 6 — DerivedDeRhamCohomology:DD.1

Let A be a ring and I⊂A an ideal such that A is I-adically complete. Let K_n∈D(A/I^n), n≥1, with maps K_{n+1}→K_n in D(A/I^{n+1}) such that K₁ is perfect and K_{n+1}⊗^L_{A/I^{n+1}}A/I^n→K_n is an isomorphism for every n. Then K=Rlim_n K_n is a perfect and derived I-complete object of D(A), and K⊗^L_A A/I^n→K_n is an isomorphism for every n.

Used by `CR.3/proper-perfectness`.

### Contract 7 — DerivedDeRhamCohomology:DD.1

Let A be a ring and f∈A such that A→lim_e A/f^eA is an isomorphism, and let P be a perfect complex of A-modules. Then the natural map P→Rlim_e(P⊗^L_A A/f^eA) is an isomorphism in D(A).

Used by `CR.3/derived-base-change`.

### Contract 8 — AlgebraicModuliForArithmeticGeometry:A0-extension

Let f:X→Spec R be proper, flat and of finite presentation with fibres of dimension ≤d, and F a finite locally free O_X-module. Then RΓ(X,F) is a perfect complex of R-modules of Tor-amplitude in [0,d], and its formation commutes with every base change R→R′. In particular H^i(X,F)=0 for i>d when R is a field.

Used by `CR.3/proper-perfectness`.

### Contract 9 — tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality

For a geometrically connected smooth proper curve C over a field k, with g=dim_k H¹(C,O_C): dim_k H⁰(C,O_C)=1, dim_k H⁰(C,Ω¹_{C/k})=g and dim_k H¹(C,Ω¹_{C/k})=1 (Serre duality with dualizing sheaf ω_{C/k}=Ω¹_{C/k}); and for a k-rational point x of C, H⁰(C,Ω¹_{C/k})=H⁰(C,Ω¹_{C/k}(x)) (Riemann–Roch).

Used by `CR.3/torsion-and-models`.

### Contract 10 — SchemeAndStackFoundations:SF.2

For a scheme X: the pro-étale site X_proét (Bhatt–Scholze, The pro-étale topology for schemes, §4) with its topos, and the morphism of topoi ν:Shv(X_proét)→Shv(X_ét); ν^* is exact and fully faithful on abelian sheaves, and K→Rν_*ν^*K is an isomorphism for K∈D⁺(X_ét).

Used by `CR.4/logarithmic-witt-sheaf`.

### Contract 11 — SchemeAndStackFoundations:SF.2

For an open immersion F:U→X of schemes and a ring R: the exact functor F_!:Sh(U_ét,R)→Sh(X_ét,R) left adjoint to F^*, its extension to D⁺, and for the closed complement G:Z→X the exact sequence 0→F_!F^*K→K→G_*G^*K→0, natural in K; in particular G^*F_!=0.

Used by `CR.4/log-witt-proper-support`.

### Contract 12 — SchemeAndStackFoundations:SF.2

For a smooth separated morphism of finite type f:X→Y of Noetherian schemes, of relative dimension d, and f^! the functor of SchemeAndStackFoundations:key/coherent-duality: f^!M≅Lf^*M⊗Ω^d_{X/Y}[d], naturally in M∈D⁺_qc(O_Y), without properness of f. For an étale separated morphism of finite type j: j^!≅j^*. Both isomorphisms are compatible with the composition isomorphisms (g∘f)^!≅f^!g^!.

Used by `CR.3:duality/trace`.

### Contract 13 — CrystallineCohomology:CR.5:log-algebra

Fine log schemes, exact closed immersions and log-smooth morphisms; the log schemes W^triv=(Spec W,W^×), W[t]°=(Spec W[t], log structure of 1↦t), W° (fibre of W[t]° at t=0) and κ° (fibre of W° at p=0), for W=W(κ), κ a perfect field; strictly semistable log schemes of finite type over κ°; for (Z,N) log smooth over (S,L), the complex Ω^•_{(Z,N)/(S,L)} of log differentials, functorial for morphisms and base change.

Used by `CR.4/semistable-log-witt-models`.

### Contract 14 — CrystallineCohomology:CR.5

For a fine log scheme (X,M) of finite type over a fine PD log base (S,L) and an embedding system {(X^⋆,M^⋆)↪(Z^⋆,N^⋆)} (a Zariski hypercover of X with exact closed immersions into log schemes log smooth over (S,L)): the log PD envelopes D^⋆_l modulo p^l, and the theorem that Ru_*(Ω^•_{(Z^⋆,N^⋆)/(S,L)}⊗O_{D^⋆_l}) computes log crystalline cohomology of (X,M) over (S,L) modulo p^l and is independent of the embedding system up to canonical isomorphism.

Used by `CR.4/semistable-log-witt-models`.

### Contract 15 — SchemeAndStackFoundations:SF.2

Étale morphisms over a scheme lift uniquely, with their morphisms, across a locally nilpotent closed thickening, and quasi-coherent modules satisfy faithfully flat étale descent; compare Zariski and étale cohomology of quasi-coherent sheaves (Stacks 59.22.4 and 35.9.3). These give the small crystalline étale extension and its affine acyclicity.

Used by `CR.1/etale-crystalline-site`, `CR.1/etale-crystal-comparison`.

### Contract 16 — tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change

For a smooth proper geometrically connected curve over W_n(k), coherent cohomology of O and Ω¹ is free of ranks 1,g,g,1 and commutes with reduction; import the current relative curve cohomology owner, without rebuilding its theory.

Used by `CR.3/smooth-curve-lift`.

### Contract 17 — tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1

For an elliptic E/F_p with a=p+1−#E(F_p), the upstream Frobenius isogeny satisfies π²−[a]π+[p]=0 and E is supersingular iff p divides a. The upstream roadmap already computes the two examples y²=x³+x/F_5 and y²=x³−x/F_3. CR.3 adds their crystalline characteristic polynomials, not a second isogeny or point-count theory.

Used by `CR.3/elliptic-frobenius`.

### Contract 18 — EnhancedDerivedSheaves:E1

Localize the category of cochain complexes of abelian groups at quasi-isomorphisms, with functorial termwise p-torsion-free replacements and enhancement. A natural construction on those replacements that preserves quasi-isomorphisms descends to D(Z); natural maps and their coherent compositions descend with it. This is the categorical input to Lη_p, not a claim that Lη_p is exact.

Used by `CR.4/derived-p-decalage`.

### Contract 19 — SchemeAndStackFoundations:SF.2

For a perfect complex P of modules over a ring A, evaluation induces P≃RHom_A(RHom_A(P,A),A). Derived tensor, dual, and evaluation commute with base change on perfect complexes. This is the finite-projective-complex biduality input; the perfect-generator node alone defines perfect objects without stating all these maps.

Used by `CR.3:duality/poincare-pairing`, `CR.3:duality/diagonal`.

### Contract 20 — IntegralHeckeAndGaloisDeterminants:IHG.0

Import the current upstream §0.4 contract, already planned there: homogeneous grading Γ_R(M)=⊕ Γ_R^n(M), arbitrary scalar base change, and Γ_R^n(M) ≅ TSym_R^n(M) for free M. The atlas id IHG.0 locates this existing upstream owner; it is not a request to re-plan that roadmap or a claim that its suggested declarations have been proved.

Used by `CR.0/pd-polynomial`.

### Contract 21 — EnhancedDerivedSheaves:E1

For a morphism f:Y→X of ringed topoi and K∈D⁺(Y), construct the convergent Grothendieck spectral sequence E₂^(a,b)=H^a(X,H^b(Rf_*K)) ⇒ H^(a+b)(Y,K), from the Postnikov filtration of Rf_*K and the composition RΓ(X,Rf_*K)≃RΓ(Y,K). Here a≥0 and b has a fixed lower bound; it becomes first quadrant after a shift. State naturality in K and morphisms of topoi and identify its edge maps. This supplements the existing E1 derived-pushforward adjunction, without assuming unbounded convergence.

Used by `CR.3/crystalline-leray`.

### Contract 22 — PerfectoidSpaces:P1

Extend the Tate-pair P1 interface to all integral perfectoid rings of BMS1 Definition 3.5, p.21, including discrete perfect F_p-algebras. For every S and j≥1, give S♭, A_inf(S)=W(S♭), the functorial surjections θ_j and θ̃_j:A_inf(S)→W_j(S), their non-zero-divisor principal kernel generators ξ_j, ξ̃_j and their transition conventions (Lemmas 3.10–3.12, pp.22–24). Under any S→S′ their images generate the corresponding kernels and remain non-zero-divisors. Give surjectivity of finite Witt Frobenius and the identification of the V^j image via F^j (Remark 3.19, p.26). No Tate, p-torsion-free or roots-of-unity restriction may be added.

Used by `CR.4/perfectoid-witt-base-change-input`.

### Contract 23 — SchemeAndStackFoundations:SF.2

For proper smooth X,Y over a noetherian base S, construct the external-product identification of their dualizing complexes with that of X×_S Y, and identify the coherent trace counit for the product with the tensor product of the two counits under derived Künneth. Include the composition/projection coherence and the Koszul signs of shifts by the relative dimensions, compatible with base change and the smooth top-differential identifications. The crystalline owner will compare the finite Witt dualizing complexes and Ekedahl’s local residues with this contract; the existing trace/composition nodes alone do not give product coherence.

Used by `CR.3:duality/trace`, `CR.3:duality/diagonal`.

## Library declarations used

- `mathlib:CochainComplex` — The existing Z-indexed cochain-complex carrier, used in the Dieudonné prototype. (Mathlib/Algebra/Homology/HomologicalComplex.lean).
- `mathlib:DividedPowerAlgebra` — The existing quotient algebra Γ_R(M); the source explicitly leaves its canonical augmentation divided powers as a TODO. (Mathlib/RingTheory/DividedPowerAlgebra/Init.lean).
- `mathlib:DividedPowerAlgebra.lift` — The weak algebra-homomorphism universal property into a given PD target. It does not supply a PD structure on Γ_R(M). (Mathlib/RingTheory/DividedPowerAlgebra/Init.lean).
- `mathlib:DividedPowerAlgebra.map` — Functoriality of the existing divided-power algebra along the stated scalar tower and linear map. (Mathlib/RingTheory/DividedPowerAlgebra/Init.lean).
- `mathlib:DividedPowers` — Divided powers on an existing ideal, including totalization by zero outside the ideal and the exact binomial/uniformBell axioms. (Mathlib/RingTheory/DividedPowers/Basic.lean).
- `mathlib:DividedPowers.IsDPMorphism` — A ring homomorphism preserving the specified ideals and their divided powers. (Mathlib/RingTheory/DividedPowers/DPMorphism.lean).
- `mathlib:DividedPowers.Quotient.dividedPowers` — Existing descent to A/K when K∩I is stable under positive divided powers; no need to rebuild quotient PD structures. (Mathlib/RingTheory/DividedPowers/SubDPIdeal.lean).
- `mathlib:DividedPowers.RatAlgebra.dividedPowers` — The PD structure on any ideal of a rational algebra; used only to establish universal coefficient identities. (Mathlib/RingTheory/DividedPowers/RatAlgebra.lean).
- `mathlib:DividedPowers.RatAlgebra.dpow_eq_inv_fact_smul` — On a rational algebra every PD structure evaluates on its ideal as the factorial-normalized power. (Mathlib/RingTheory/DividedPowers/RatAlgebra.lean).
- `mathlib:DividedPowers.coincide_on_smul` — Two divided-power structures in the same ring agree on the product of their ideals. (Mathlib/RingTheory/DividedPowers/Basic.lean).
- `mathlib:DividedPowers.dpow_eq_from_gens` — Two existing PD structures agreeing on an ideal generating set are equal; this does not construct a structure from partial axioms. (Mathlib/RingTheory/DividedPowers/DPMorphism.lean).
- `mathlib:DividedPowers.dpow_eval_zero` — Positive divided powers of zero vanish. (Mathlib/RingTheory/DividedPowers/Basic.lean).
- `mathlib:DividedPowers.dpow_sum` — The finite-sum expansion indexed by multisets, with no extra multinomial coefficients. (Mathlib/RingTheory/DividedPowers/Basic.lean).
- `mathlib:DividedPowers.ext` — Equality from equality of operations on the ideal, with the outside convention handled automatically. (Mathlib/RingTheory/DividedPowers/Basic.lean).
- `mathlib:DividedPowers.prod_dpow` — Repeated products of divided powers of one element are the multinomial coefficient times the divided power of the summed degree. (Mathlib/RingTheory/DividedPowers/Basic.lean).
- `mathlib:IsLocalization.flat` — Localization is flat over its base commutative ring. (Mathlib/RingTheory/Flat/Localization.lean).
- `mathlib:IsLocalization.mk'` — The existing fraction x/s in a specified localization. (Mathlib/RingTheory/Localization/Defs.lean).
- `mathlib:Module.Flat.isTrivialRelation_of_sum_smul_eq_zero` — A relation in a flat module factors through finitely many elements with vanishing coefficient relations; used directly in presentation independence. (Mathlib/RingTheory/Flat/EquationalCriterion.lean).
- `mathlib:ModuleCat` — The existing category of modules; ModuleCat Z supplies the additive groups in the prototype. (Mathlib/Algebra/Category/ModuleCat/Basic.lean).
- `mathlib:MvPolynomial.basisMonomials` — The ordinary monomials form a basis over any coefficient ring; rationally rescaled monomials distinguish universal coefficient identities. (Mathlib/RingTheory/MvPolynomial/Basic.lean).
- `mathlib:Nat.add_choose_eq` — Vandermonde identity as an equality of natural-number coefficients. (Mathlib/Data/Nat/Choose/Vandermonde.lean).
- `mathlib:PadicInt.dividedPowers` — Canonical divided powers on the principal ideal (p) of Z_p for every prime p, including two. (Mathlib/RingTheory/DividedPowers/Padic.lean).
- `tauceti:TauCeti.Associative.dividedPower` — The factorial-normalized power in an associative rational algebra; only a rational compatibility test, not a torsion-ring PD structure. (TauCeti/RingTheory/DividedPowers/Associative.lean).
- `mathlib:DividedPowerAlgebra.lift_apply_dp` — Evaluation on dp(n,m) is the target divided power of the linear image. (Mathlib/RingTheory/DividedPowerAlgebra/Init.lean).
- `mathlib:DividedPowerAlgebra.algHom_ext` — R-algebra homomorphisms are equal if they agree on every divided-power generator. (Mathlib/RingTheory/DividedPowerAlgebra/Init.lean).
- `mathlib:DividedPowerAlgebra.dp_zero` — The degree-zero generator is one. (Mathlib/RingTheory/DividedPowerAlgebra/Init.lean).
- `mathlib:DividedPowerAlgebra.map_apply_dp` — The functorial algebra map sends dp(n,m) to dp(n,f(m)). (Mathlib/RingTheory/DividedPowerAlgebra/Init.lean).
- `mathlib:DividedPowerAlgebra.induction_on` — Induction on scalars, addition and multiplication by dp(n,m). (Mathlib/RingTheory/DividedPowerAlgebra/Init.lean).
- `mathlib:dividedPowersBot` — The canonical PD structure on the zero ideal. (Mathlib/RingTheory/DividedPowers/Basic.lean).
- `mathlib:RingHom.ker` — Ideal kernel of a ring homomorphism. (Mathlib/RingTheory/Ideal/Maps.lean).
- `mathlib:RingHom.mem_ker` — Kernel membership is equivalent to image zero. (Mathlib/RingTheory/Ideal/Maps.lean).
- `mathlib:Ideal.subset_span` — Every generator belongs to its ideal span. (Mathlib/RingTheory/Ideal/Span.lean).
- `mathlib:Ideal.span_le` — The ideal span lies in an ideal exactly when every generator does. (Mathlib/RingTheory/Ideal/Span.lean).
- `mathlib:LinearEquiv.ofLinearMap` — Packages inverse linear maps into a linear equivalence. (Mathlib/Algebra/Module/Equiv/Basic.lean).
- `mathlib:Ideal.map` — Ideal extension is the ideal span of the image. (Mathlib/RingTheory/Ideal/Maps.lean).
- `mathlib:Ideal.mem_map_of_mem` — The image of an ideal element lies in the extended ideal. (Mathlib/RingTheory/Ideal/Maps.lean).
- `mathlib:Finsupp.mem_ideal_span_range_iff_exists_finsupp` — An element of an ideal spanned by a range has a finite coefficient expression. (Mathlib/RingTheory/Ideal/Operations.lean).
- `mathlib:Ideal.mul_mem_mul` — A product of elements of the two ideals lies in their ideal product. (Mathlib/RingTheory/Ideal/Operations.lean).
- `mathlib:Ideal.mul_le_inf` — The product of two ideals lies in their intersection. (Mathlib/RingTheory/Ideal/Operations.lean).
- `mathlib:DividedPowerAlgebra.lift'` — Constructs an algebra map from a generator family satisfying the four defining relations. (Mathlib/RingTheory/DividedPowerAlgebra/Init.lean).
- `mathlib:DividedPowerAlgebra.lift'_apply_dp` — Evaluation of lift′ on each generator is the specified family value. (Mathlib/RingTheory/DividedPowerAlgebra/Init.lean).
- `mathlib:DividedPowerAlgebra.embed_def` — The canonical module embedding sends m to dp(1,m). (Mathlib/RingTheory/DividedPowerAlgebra/Init.lean).
- `mathlib:TrivSqZeroExt.inr` — The module inclusion m↦(0,m) into the trivial square-zero extension. (Mathlib/Algebra/TrivSqZeroExt/Basic.lean).
- `mathlib:TrivSqZeroExt.inr_mul_inr` — The product of any two elements in the square-zero module summand is zero. (Mathlib/Algebra/TrivSqZeroExt/Basic.lean).
- `mathlib:TrivSqZeroExt.inr_injective` — The module-summand inclusion is injective. (Mathlib/Algebra/TrivSqZeroExt/Basic.lean).
- `mathlib:ZMod.natCast_self` — The modulus n is zero in ZMod n. (Mathlib/Data/ZMod/Basic.lean).
- `mathlib:ModuleCat.ofHom` — Existing ModuleCat.ofHom; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. (Mathlib/Algebra/Category/ModuleCat/Basic.lean).
- `mathlib:HomologicalComplex.d_comp_d` — Existing HomologicalComplex.d_comp_d; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. (Mathlib/Algebra/Homology/HomologicalComplex.lean).
- `mathlib:HomologicalComplex.Hom` — Existing HomologicalComplex.Hom; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. (Mathlib/Algebra/Homology/HomologicalComplex.lean).
- `mathlib:HomologicalComplex.hom_ext` — Existing HomologicalComplex.hom_ext; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. (Mathlib/Algebra/Homology/HomologicalComplex.lean).
- `mathlib:CochainComplex.of` — Existing CochainComplex.of; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. (Mathlib/Algebra/Homology/HomologicalComplex.lean).
- `mathlib:CochainComplex.ofHom` — Existing CochainComplex.ofHom; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. (Mathlib/Algebra/Homology/HomologicalComplex.lean).
- `mathlib:LinearMap.mem_range` — Existing LinearMap.mem_range; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. (Mathlib/Algebra/Module/Submodule/Range.lean).
- `mathlib:LinearMap.range_comp_le_range` — Existing LinearMap.range_comp_le_range; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. (Mathlib/Algebra/Module/Submodule/Range.lean).
- `mathlib:Submodule.mapQ` — Existing Submodule.mapQ; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. (Mathlib/LinearAlgebra/Quotient/Basic.lean).
- `mathlib:Submodule.mapQ_apply` — Existing Submodule.mapQ_apply; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. (Mathlib/LinearAlgebra/Quotient/Basic.lean).
- `mathlib:Submodule.mapQ_comp` — Existing Submodule.mapQ_comp; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. (Mathlib/LinearAlgebra/Quotient/Basic.lean).
- `mathlib:Submodule.mapQ_id` — Existing Submodule.mapQ_id; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. (Mathlib/LinearAlgebra/Quotient/Basic.lean).
- `mathlib:Submodule.mkQ` — Existing Submodule.mkQ; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. (Mathlib/LinearAlgebra/Quotient/Defs.lean).
- `mathlib:Submodule.mkQ_surjective` — Existing Submodule.mkQ_surjective; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. (Mathlib/LinearAlgebra/Quotient/Defs.lean).
- `mathlib:Submodule.mem_sup` — Existing Submodule.mem_sup; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. (Mathlib/LinearAlgebra/Span/Defs.lean).
- `mathlib:HomologicalComplex.Hom.comm` — Existing HomologicalComplex.Hom.comm; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. (Mathlib/Algebra/Homology/HomologicalComplex.lean).
- `mathlib:Module.End.pow_apply` — Existing Module.End.pow_apply; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. (Mathlib/Algebra/Module/LinearMap/End.lean).
- `mathlib:LinearMap.range` — Existing LinearMap.range; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. (Mathlib/Algebra/Module/Submodule/Range.lean).
- `mathlib:Submodule.Quotient.mk` — Existing Submodule.Quotient.mk; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. (Mathlib/LinearAlgebra/Quotient/Defs.lean).
- `mathlib:Submodule.Quotient.mk_eq_zero` — Existing Submodule.Quotient.mk_eq_zero; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. (Mathlib/LinearAlgebra/Quotient/Defs.lean).
- `mathlib:Ideal.span` — The existing ideal generated by a subset. (Mathlib/RingTheory/Ideal/Span.lean).
- `mathlib:Ideal.span_mono` — Inclusion of generating sets induces inclusion of their spans. (Mathlib/RingTheory/Ideal/Span.lean).
- `mathlib:Ideal.eq_top_iff_one` — An ideal is the unit ideal exactly when it contains 1. (Mathlib/RingTheory/Ideal/Lattice.lean).
- `mathlib:Ideal.span_mul_span` — The product of generated ideals is generated by pairwise products; the two-sided hypotheses hold for commutative rings. (Mathlib/RingTheory/Ideal/Operations.lean).
- `mathlib:Ideal.map_span` — Mapping an ideal span gives the span of the image set. (Mathlib/RingTheory/Ideal/Maps.lean).
- `mathlib:Ideal.mem_map_iff_of_surjective` — For a surjective ring map, membership in an ideal image is witnessed by an element of the original ideal. (Mathlib/RingTheory/Ideal/Maps.lean).
- `mathlib:Ideal.span_singleton_pow` — A power of a principal ideal is generated by the corresponding power of its generator. (Mathlib/RingTheory/Ideal/Operations.lean).
- `mathlib:Ideal.pow_mem_pow` — An element of I has its nth power in Iⁿ. (Mathlib/RingTheory/Ideal/Operations.lean).
- `mathlib:Ideal.pow_le_pow_right` — For m≤n, Iⁿ⊆Iᵐ. (Mathlib/RingTheory/Ideal/Operations.lean).
- `mathlib:DividedPowers.IsDPMorphism.map_dpow` — A PD morphism preserves γ_n(x) for x in the source ideal. (Mathlib/RingTheory/DividedPowers/DPMorphism.lean).
- `mathlib:PadicInt.coe_dpow_eq` — Embedding the canonical p-adic divided power into ℚ_p gives xⁿ/n! for x in (p). (Mathlib/RingTheory/DividedPowers/Padic.lean).
- `mathlib:PadicInt.valuation_p` — The valuation of p in ℤ_p is one. (Mathlib/NumberTheory/Padics/PadicIntegers.lean).
- `mathlib:PadicInt.mem_span_pow_iff_le_valuation` — For nonzero x, membership in the principal ideal generated by pⁿ is equivalent to n≤v_p(x). (Mathlib/NumberTheory/Padics/PadicIntegers.lean).
- `mathlib:AlgebraicGeometry.Scheme.IdealSheafData` — Affine-open ideal data compatible with basic-open localization, defining a quasi-coherent ideal sheaf on an existing Scheme. (Mathlib/AlgebraicGeometry/IdealSheaf/Basic.lean).
- `mathlib:SheafOfModules` — A presheaf of modules over a sheaf of rings whose underlying presheaf of abelian groups is a sheaf. (Mathlib/Algebra/Category/ModuleCat/Sheaf.lean).
- `mathlib:TruncatedWittVector` — The existing carrier Fin r → R, with its pinned prime-dependent Witt ring operations. (Mathlib/RingTheory/WittVector/Truncated.lean).
- `mathlib:WittVector.truncate` — The existing ring homomorphism from infinite Witt vectors to length r, with its surjectivity. (Mathlib/RingTheory/WittVector/Truncated.lean).
- `mathlib:WittVector.frobenius` — The existing Witt Frobenius ring homomorphism, used to form the concrete length-changing coefficient operation. (Mathlib/RingTheory/WittVector/Frobenius.lean).
- `mathlib:DirectSum.GRing` — The existing graded ring structure with coherent integer casts; the Dieudonné and relative DGA signatures add the differential and graded-commutative axioms. (Mathlib/Algebra/DirectSum/Ring.lean).
- `mathlib:KaehlerDifferential` — The existing ordinary module I/I² for the kernel of the tensor multiplication map, used before imposing PD derivative relations. (Mathlib/RingTheory/Kaehler/Basic.lean).
- `mathlib:KaehlerDifferential.linearMapEquivDerivation` — The existing equivalence between S-linear maps from Ω[S/R] and R-derivations into the specified S-module. (Mathlib/RingTheory/Kaehler/Basic.lean).
- `mathlib:CategoryTheory.ObjectProperty.FullSubcategory` — The existing category of objects satisfying a stated predicate, used for the small crystalline site inside the big one. (Mathlib/CategoryTheory/ObjectProperty/FullSubcategory.lean).
- `mathlib:CategoryTheory.ObjectProperty.ι` — The existing full-subcategory inclusion functor on actual objects and morphisms. (Mathlib/CategoryTheory/ObjectProperty/FullSubcategory.lean).
- `mathlib:RingTheory.Sequence.IsRegular` — Weak regularity with a nonzero final quotient; the existing sequence notion supplies the characteristic-p regular-envelope basis hypothesis. (Mathlib/RingTheory/Regular/RegularSequence.lean).
- `mathlib:DividedPowers.le_equalizer_of_isDPMorphism` — If f is a PD morphism from (I,γ) to two divided power structures on an ideal K containing I.map f, then I.map f lies in the ideal on which the two structures have equal operations. (Mathlib/RingTheory/DividedPowers/SubDPIdeal.lean).
- `mathlib:DividedPowers.mem_dpEqualizer_iff` — Membership in the equalizer ideal of two divided power structures on I: x∈I and the two structures agree at x in every degree. (Mathlib/RingTheory/DividedPowers/SubDPIdeal.lean).
- `mathlib:DividedPowers.exp` — The power series Σₙγₙ(a)Tⁿ attached to a divided power structure γ and an element a. (Mathlib/RingTheory/DividedPowers/Basic.lean).
- `mathlib:DividedPowers.exp_add` — For a,b in the ideal, the power series of a+b is the product of the power series of a and of b. (Mathlib/RingTheory/DividedPowers/Basic.lean).
- `mathlib:DividedPowers.IsDPMorphism.on_span` — A ring map that sends a generating set S of I into J and commutes with the divided powers at every element of S is a PD morphism from (I,γ) to (J,δ). (Mathlib/RingTheory/DividedPowers/DPMorphism.lean).
- `mathlib:DividedPowers.IsDPMorphism.of_comp` — If f is a PD morphism from (I,γ) to (I.map f,δ) and g∘f is a PD morphism from (I,γ) to (K,κ), then g is a PD morphism from (I.map f,δ) to (K,κ). (Mathlib/RingTheory/DividedPowers/DPMorphism.lean).
- `mathlib:DividedPowers.ofRingEquiv` — Transfer of a divided power structure along a ring isomorphism e with I.map e=J: the operation at b is e(γₙ(e⁻¹(b))). (Mathlib/RingTheory/DividedPowers/Basic.lean).
- `mathlib:DividedPowers.dpow_sum'` — The expansion of dpow n of a finite sum as a sum over multisets, for any family of maps satisfying the degree-zero, addition and vanishing-at-zero laws on an additive submonoid; no multiplication or iteration law is assumed. (Mathlib/RingTheory/DividedPowers/Basic.lean).
- `mathlib:Finset.sum_pow_eq_sum_piAntidiag` — The multinomial theorem in a commutative semiring: (Σᵢfᵢ)ⁿ is the sum over exponent vectors k of weight n of multinomial(k)·∏ᵢfᵢ^{kᵢ}. (Mathlib/Data/Nat/Choose/Multinomial.lean).
- `tauceti:TauCeti.Associative.dividedPower_eq_dpow` — In a commutative ℚ-algebra, the associative divided power xⁿ/n! equals γₙ(x) for every divided power structure γ on an ideal I and every x∈I. (TauCeti/RingTheory/DividedPowers/Associative.lean).
- `mathlib:DividedPowers.ofInjective` — A divided power structure on I induced along an injective ring map f:A→B from one on J=I.map f, when every δₙ(f(x)), x∈I, is the image of an element of A lying in I for n≠0. (Mathlib/RingTheory/DividedPowers/Padic.lean).
- `mathlib:DividedPowers.OfSquareZero.dividedPowers` — The divided power structure on an ideal of square zero; its operations of degree at least two vanish (dpow_of_two_le, line 203). (Mathlib/RingTheory/DividedPowers/RatAlgebra.lean).
- `mathlib:padicValNat_factorial_lt_of_ne_zero` — For a prime p and n≠0, the p-adic valuation of n! is less than n. (Mathlib/NumberTheory/Padics/PadicVal/Basic.lean).
- `mathlib:Localization.AtPrime` — The localization of a commutative ring at the complement of a prime ideal; for ℤ and (p) it is ℤ₍p₎. (Mathlib/RingTheory/Localization/AtPrime/Basic.lean).
- `mathlib:IsLocalization.lift` — The ring map out of a localization induced by a ring map that sends the submonoid to units. (Mathlib/RingTheory/Localization/Defs.lean).
- `mathlib:DividedPowers.IsSubDPIdeal` — For hI : DividedPowers I and an ideal J: J ≤ I and hI.dpow n j ∈ J for all n ≠ 0, j ∈ J (sub-PD ideal). (Mathlib/RingTheory/DividedPowers/SubDPIdeal.lean).
- `mathlib:DividedPowers.span_isSubDPIdeal_iff` — For S ⊆ I: IsSubDPIdeal hI (span S) ↔ ∀ n ≠ 0, ∀ s ∈ S, hI.dpow n s ∈ span S (Stacks 23.4.3(2)(c)). (Mathlib/RingTheory/DividedPowers/SubDPIdeal.lean).
- `mathlib:DividedPowers.isSubDPIdeal_ker` — For a divided power morphism f from (I,hI) to (J,hJ): RingHom.ker f ⊓ I is a sub-PD ideal of I. (Mathlib/RingTheory/DividedPowers/SubDPIdeal.lean).
- `mathlib:DividedPowers.SubDPIdeal.span_carrier_eq_dpow_span` — For S ⊆ I the sub-PD ideal generated by S is the ideal generated by the hI.dpow n x, n ≠ 0, x ∈ S (Stacks 23.4.4). (Mathlib/RingTheory/DividedPowers/SubDPIdeal.lean).
- `mathlib:DividedPowers.Quotient.OfSurjective.dividedPowers` — For a surjective ring map f : A → B, J = I.map f and IsSubDPIdeal hI (RingHom.ker f ⊓ I): the induced divided power structure on J, with dpow n (f a) = f (hI.dpow n a) for a ∈ I. (Mathlib/RingTheory/DividedPowers/SubDPIdeal.lean).
- `mathlib:DividedPowers.factorial_mul_dpow_eq_pow` — For a ∈ I: (n ! : A) * hI.dpow n a = a ^ n. (Mathlib/RingTheory/DividedPowers/Basic.lean).
- `mathlib:DividedPowerAlgebra.lift_unique` — An algebra map f from DividedPowerAlgebra R M with f (dp R n m) = hI.dpow n (g m) for all n, m equals lift hI g hg. (Mathlib/RingTheory/DividedPowerAlgebra/Init.lean).
- `mathlib:DividedPowerAlgebra.lift_surjective` — For a surjective linear map f : M → N the algebra map DividedPowerAlgebra.map R f is surjective. (Mathlib/RingTheory/DividedPowerAlgebra/Init.lean).
- `mathlib:DividedPowerAlgebra.dp_sum_smul` — dp R q (∑ i ∈ s, a i • x i) = ∑ over k ∈ s.sym q of (∏ a i ^ count i k) • ∏ dp R (count i k) (x i). (Mathlib/RingTheory/DividedPowerAlgebra/Init.lean).
- `mathlib:DividedPowerAlgebra.submodule_span_prod_dp_eq_top` — If the v i span M, the finite products ∏ dp R (k i) (v i) span DividedPowerAlgebra R M as an R-module (spanning only; linear independence for a basis is not in Mathlib at this commit). (Mathlib/RingTheory/DividedPowerAlgebra/Init.lean).
- `mathlib:Module.Flat.of_free` — A free module is flat. (Mathlib/RingTheory/Flat/Basic.lean).
- `mathlib:IsNilpotent` — IsNilpotent x := ∃ n : ℕ, x ^ n = 0; applied to an ideal I it says I ^ n = 0 for some n. (Mathlib/Algebra/GroupWithZero/Basic.lean).
- `mathlib:nilradical` — nilradical R = (0 : Ideal R).radical, the ideal of nilpotent elements (mem_nilradical : x ∈ nilradical R ↔ IsNilpotent x). (Mathlib/RingTheory/Nilpotent/Lemmas.lean).
- `mathlib:TrivSqZeroExt` — The trivial square-zero extension R × M of a ring R by a module M, with (r₁ + m₁)(r₂ + m₂) = r₁r₂ + r₁m₂ + r₂m₁. (Mathlib/Algebra/TrivSqZeroExt/Basic.lean).
- `mathlib:AdicCompletion` — The I-adic completion of a module as the inverse limit of the M ⧸ I ^ n • ⊤; for M = R it is a commutative ring (instance at Mathlib/RingTheory/AdicCompletion/Algebra.lean:97). (Mathlib/RingTheory/AdicCompletion/Basic.lean).
- `mathlib:Choose.choose_modEq_choose_mod_mul_choose_div_nat` — For a prime p: choose n k ≡ choose (n % p) (k % p) * choose (n / p) (k / p) [MOD p] (Lucas). (Mathlib/Data/Nat/Choose/Lucas.lean).
- `mathlib:PreTilt` — PreTilt O p = Perfection (ModP O p) p, the perfection of O/p; a perfect ring of characteristic p when p is prime and not a unit of O. (Mathlib/RingTheory/Perfection.lean).
- `mathlib:WittVector.fontaineTheta` — For a commutative ring R that is p-adically complete (IsAdicComplete (span {p}) R) with p not a unit: the ring homomorphism θ : 𝕎 (PreTilt R p) →+* R, the limit of the maps modulo p^(n+1). (Mathlib/RingTheory/Perfectoid/FontaineTheta.lean).
- `mathlib:WittVector.mk_fontaineTheta` — Ideal.Quotient.mk (span {p}) (fontaineTheta R p x) = PreTilt.coeff 0 (x.coeff 0): θ modulo p is the zeroth coefficient. (Mathlib/RingTheory/Perfectoid/FontaineTheta.lean).
- `mathlib:WittVector.fontaineTheta_teichmuller` — fontaineTheta R p (teichmuller p x) = x.untilt. (Mathlib/RingTheory/Perfectoid/FontaineTheta.lean).
- `mathlib:surjective_fontaineTheta` — If Frobenius is surjective on R/p (and R is p-adically complete, p not a unit) then fontaineTheta R p is surjective. (Mathlib/RingTheory/Perfectoid/FontaineTheta.lean).
- `mathlib:WittVector.eq_zero_of_p_mul_eq_zero` — For a perfect ring k of characteristic p, 𝕎 k is p-torsion-free. (Mathlib/RingTheory/WittVector/Complete.lean).
- `mathlib:WittVector.mem_span_p_iff_coeff_zero_eq_zero` — For a perfect ring k of characteristic p: x ∈ span {(p : 𝕎 k)} ↔ x.coeff 0 = 0. (Mathlib/RingTheory/WittVector/Complete.lean).
- `mathlib:WittVector.isAdicCompleteIdealSpanP` — For a perfect ring k of characteristic p, 𝕎 k is p-adically complete. (Mathlib/RingTheory/WittVector/Complete.lean).
- `mathlib:WittVector.map` — For a ring homomorphism f : R →+* S the ring homomorphism 𝕎 R →+* 𝕎 S acting coefficientwise ((map f x).coeff n = f (x.coeff n), map_coeff at line 267). (Mathlib/RingTheory/WittVector/Basic.lean).
- `mathlib:WittVector.eq_of_apply_teichmuller_eq` — For a ring S in which p is nilpotent, two ring maps 𝕎 R →+* S (R perfect of characteristic p) that agree on Teichmüller representatives are equal. (Mathlib/RingTheory/WittVector/TeichmullerSeries.lean).
- `mathlib:IsAdicComplete` — A module M over a ring R is I-adically complete if it is Hausdorff and precomplete for the I-adic topology; used with I=(p) for the p-adically complete modules of CR.1/quasi-nilpotent-connection and CR.1/pd-stratification. (Mathlib/RingTheory/AdicCompletion/Basic.lean).
- `mathlib:HomologicalComplex.homology` — The homology K.homology i in degree i of a homological complex K with [K.HasHomology i]; for a cochain complex this is its cohomology in degree i. (Mathlib/Algebra/Homology/ShortComplex/HomologicalComplex.lean).
- `mathlib:QuasiIso` — The property of a morphism f:K⟶L of homological complexes with homology that f is a quasi-isomorphism in every degree, i.e. every homologyMap f i is an isomorphism. (Mathlib/Algebra/Homology/QuasiIso.lean).
- `mathlib:WittVector` — The ring 𝕎 R of p-typical Witt vectors of a commutative ring R (coefficients ℕ → R); the carrier of W(R). (Mathlib/RingTheory/WittVector/Defs.lean).
- `mathlib:WittVector.verschiebung` — The additive map V : 𝕎 R →+ 𝕎 R shifting coefficients by one, for every commutative ring R. (Mathlib/RingTheory/WittVector/Verschiebung.lean).
- `mathlib:WittVector.teichmuller` — The multiplicative Teichmüller lift R →* 𝕎 R, with coefficient 0 equal to r and all other coefficients 0. (Mathlib/RingTheory/WittVector/Teichmuller.lean).
- `mathlib:WittVector.frobenius_verschiebung` — frobenius (verschiebung x) = x * p in 𝕎 R for every commutative ring R (FV = p); the converse VF = p is only available under CharP R p. (Mathlib/RingTheory/WittVector/Identities.lean).
- `mathlib:WittVector.verschiebung_mul_frobenius` — The projection formula verschiebung (x * frobenius y) = verschiebung x * y in 𝕎 R for every commutative ring R. (Mathlib/RingTheory/WittVector/Identities.lean).
- `mathlib:WittVector.ghostComponent` — The n-th ghost component 𝕎 R →+* R, the value of the n-th Witt polynomial on the first n+1 coefficients. (Mathlib/RingTheory/WittVector/Basic.lean).
- `mathlib:TruncatedWittVector.truncate` — The restriction ring homomorphism TruncatedWittVector p m R →+* TruncatedWittVector p n R for n ≤ m. Mathlib has no Frobenius, Verschiebung or Teichmüller map on TruncatedWittVector. (Mathlib/RingTheory/WittVector/Truncated.lean).
- `mathlib:CategoryTheory.Functor.sheafAdjunctionContinuous` — For a continuous functor of sites, the adjunction between sheaf pullback and sheaf pushforward. (Mathlib/CategoryTheory/Sites/Pullback.lean).
- `mathlib:CategoryTheory.Functor.sheafAdjunctionCocontinuous` — For a continuous and cocontinuous functor of sites, restriction along G is left adjoint to the right-Kan-extension pushforward. (Mathlib/CategoryTheory/Sites/CoverLifting.lean).
- `mathlib:SheafOfModules.pullbackPushforwardAdjunction` — The pullback/pushforward adjunction for sheaves of modules along a continuous functor and a morphism of sheaves of rings. (Mathlib/Algebra/Category/ModuleCat/Sheaf/PullbackContinuous.lean).
- `mathlib:AdicCompletion.map` — Functoriality of ordinary adic completion, linear in the map (so chain homotopies pass to completions). (Mathlib/RingTheory/AdicCompletion/Functoriality.lean).
- `mathlib:DerivedCategory.TStructure.t` — The canonical t-structure on the derived category of an abelian category. (Mathlib/Algebra/Homology/DerivedCategory/TStructure.lean).
- `mathlib:CategoryTheory.Triangulated.TStructure.triangleLEGE` — The functorial truncation triangle τ≤a A → A → τ≥a+1 A of a t-structure. (Mathlib/CategoryTheory/Triangulated/TStructure/TruncLEGT.lean).
- `mathlib:WittVector.verschiebung_frobenius` — VF = p on 𝕎 R when R has characteristic p. (Mathlib/RingTheory/WittVector/Identities.lean).
- `mathlib:Algebra.Etale` — Étale algebras: formally étale and of finite presentation. (Mathlib/RingTheory/Etale/Basic.lean).
- `mathlib:KaehlerDifferential.mvPolynomialBasis` — The differentials dX_i form a basis of Ω¹ of a polynomial algebra. (Mathlib/RingTheory/Kaehler/Polynomial.lean).
- `mathlib:KaehlerDifferential.isLocalizedModule_map` — Ω¹ of a localization is the localization of Ω¹. (Mathlib/RingTheory/Etale/Kaehler.lean).
- `mathlib:CochainComplex.truncLE` — The canonical (good) truncation τ≤n of a cochain complex. (Mathlib/Algebra/Homology/Embedding/CochainComplex.lean).
- `mathlib:HomologicalComplex.stupidTrunc` — The stupid truncation of a complex along an embedding of complex shapes. (Mathlib/Algebra/Homology/Embedding/StupidTrunc.lean).
- `mathlib:WittVector.Isocrystal` — A module over FractionRing(WittVector p k) with a Frobenius-semilinear equivalence over a perfect domain k. The carrier and its morphisms exist; full finite-dimensional slope classification does not. (Mathlib/RingTheory/WittVector/Isocrystal.lean).

- `mathlib:CommRingCat.Colimits.hasColimits_commRingCat` (instance, Mathlib/Algebra/Category/Ring/Colimits.lean): All small colimits of commutative rings, formed by the quotient construction colimitCocone with colimitIsColimit. This supplies the underlying ring R before adjoining divided powers and imposing PD compatibility relations. Read the ring-colimit construction and the instance at lines 588–593 at Mathlib 082e2d3; elaboration checks the fully qualified name. It supplies ordinary ring colimits, not colimits of PD rings.

## Sources and locators

- **stacks-dpa**: [Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex). Live text accessed 2026-09-26; dpa.tex at a04446e57ec1fbc252a871afcec7752fb2807b14. Version receipt: `1e4ed7cee878c185ea5284e176241d3428a398a25b28a56c44869c1b59f090ed`. Read ranges: Definition23.2.1; complete proofs of Lemmas23.2.4–5 and23.4.2; complete §23.5 including polynomial basis, universal property and infinite variables. Canonical powers on arbitrary-module Γ require the recorded quotient-stability certificate.; Review (REV-CrystallineCohomology--CR.0, 2026-10-06/07): §§23.2–23.5 read in full at the pinned commit, for the CR.0 nodes..
- **stacks-crys**: [Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex). Live Sections60.2 and60.6; crystalline.tex at a04446e57ec1fbc252a871afcec7752fb2807b14, with chapter PDF collated2026-09-27. Version receipt: `466c0634a5e8e3899b157a42a4b4bb5f4357199f96708caf5854f5a92be58054`. Read ranges: Locked TeX §§60.2–26 read, including §60.25 purely inseparable pullback/integration and §60.26 Frobenius. Section60.24 proof hints are not a perfectness proof certificate.; Review (REV-CrystallineCohomology--CR.0, 2026-10-06/07): §§60.2–60.26 read in full at the pinned commit (§§60.2, 60.4–60.6 for CR.0; §§60.3, 60.5–60.26 for CR.1–CR.3). The results of §60.24 are remarks with hints, without proofs..
- **blm-derhamwitt**: [Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3). arXiv:1805.05501v3, 19 February2020; newly downloaded158-page PDF. Version receipt: `533f9073572ccefa893706a39b8792b55cb313886e402a7eb6d4c22271687753`. Read ranges: Version3: §§2.6–2.9,3.1,3.3–3.6,4.1–4.4,5.1–5.3,7.2–7.5 read;5.4 initial Witt étale proof,6.3 singular example and10.1 theorem/deduction read.5.5 and10.2–10.4 proof interiors remain gates; Nygaard is sourced to fully read BMS2§8.1.; Review (REV-CrystallineCohomology--CR.0, 2026-10-06/07): read as page images: pp. 13–30 (§§2.1–2.9), pp. 34–68 (§§3.1–5.5), pp. 85–94 (§§7.2–7.5), pp. 99–104; in the extracted text: §§6.1–6.3, 6.5, 6.6 and 10.1. Not read: the proofs of §§10.2–10.4..
- **blm-published**: [Revisiting the de Rham-Witt complex](https://smf.emath.fr/system/files/filepdf/smf_ast_424.pdf). Astérisque424(2021), publisher PDF178pages including front matter. Version receipt: `fd87e547f9d769f60de623f8708ded7b9fe2b5953d5c0c8281ad44f71e05ca22`. Read ranges: Printed p.16, PDF page24, Remarks2.3.3–4 and adjacent text; Remark2.3.4 visually inspected for the source finding. The rest of the published volume was not reread.; Continuation27September2026: hash-verified reuse of the acquired publisher PDF; printedpp.22–23 (PDFpages30–31) read and rendered, including2.6.2–5 and2.7.1.; 2026-10-06: printed pp.88 and96, Propositions7.2.4 and7.5.3 proof paragraphs read and rendered for source collation.; Review (REV-CrystallineCohomology--CR.0, 2026-10-06/07): pp. 13–23 compared with arXiv v3 (the prose is identical apart from footnote 1, and the displayed formulas agree); pp. 17, 53, 65, 68, 88 and 96 read for the source issues..
- **blm-author**: [Revisiting the de Rham-Witt complex](https://www.math.ias.edu/~lurie/papers/Crystalline.pdf). Author-hosted141-page copy downloaded 2026-09-26; not identified with arXivv3 or the published text. Version receipt: `dad4e554ad5847a9c7410a42d8d4f8eb37afffae643ed55ccdf11471278ece0d`. Read ranges: Printed p.16, Remark2.3.4, to collate the displayed differential calculation. A distinct forward-direction misprint here is corrected in arXivv3 and the published text.; Review (REV-CrystallineCohomology--CR.0, 2026-10-06/07): the passages of the source issues on Proposition 2.4.5 and on the proof of Theorem 5.3.4 compared..
- **bhatt-pd**: [p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560). arXiv:1204.6560, acquired PDF. Version receipt: `e5ca4056c89eaed462a12038c29d5c3b0a7e06d02d18a7db6dfdf1cfe9f4f00f`. Read ranges: §3.3 Lemmas3.37–3.38/Corollary3.40 read; only classical PD-side lemmas owned here. §9 Notation9.1 through Proposition9.9 and Remark9.10, including proofs, read for the Fontaine envelope. Derived period comparison remains DD.4/AI.0.; Review (REV-CrystallineCohomology--CR.0, 2026-10-06/07): pp. 16–17 and 35 read as page images, and §9 up to Remark 9.10 in the text..
- **lz-relative**: [De Rham–Witt cohomology for a proper and smooth morphism](https://www.math.uni-bielefeld.de/~zink/dRW.pdf). Author manuscript, July2003, 107pages. Version receipt: `50410e7d5fa13c4e76786fb0e2a3e215b6735549cf9365c81cb5d2d5dd834905`. Read ranges: Author July2003 manuscript: §§1.1–1.5,2.2 basic definitions/operator formulas,2.5 Proposition2.17 full proof,3.1–3.3 comparison,3.4 scaled Frobenius and3.5 flat coefficients/full Lemma3.9 proof read.2.3–2.4 generation/product interiors remain a gate. Displays at the end of3.4 belong to R07.; Review (REV-CrystallineCohomology--CR.0, 2026-10-06/07): printed pp. 11–28 (§§1.1–1.4), 32–57 (§§2.1–2.5), 67–78 (§§3.1–3.4) and 85–86 (§3.5 up to Theorem 3.8) read (PDF page = printed page + 1). Not read: §§2.6–2.7, the proof of Lemma 3.9 and the appendix..
- **bms1**: [Integral p-adic Hodge theory](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf). Author-hosted PDF. Version receipt: `80b0b525752501bf0834f09595a93209969d2f91a97d9a000783a21a0ce10420`. Read ranges: §10 read completely;§11 introduction is the AI.4 boundary. Theorem2.10 cohomological torsion proof and full Lemma2.12 weak Lefschetz proof read;2.1–2.7 geometric inputs remain a gate. Definition3.22 and§14.1 statement/proof screened for the A_cris/crystalline boundary.; Review (REV-CrystallineCohomology--CR.0, 2026-10-06/07): author-hosted PDF: pp. 13–18 (§2), pp. 24, 26 and 27 (Lemma 3.13, Remark 3.19, the generator of ker θ), pp. 80–85 (§10) and 88–89 read as page images. Published version: pp. 243 and 339 compared for two source issues..
- **bms2**: [Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf). Publications Mathématiques de l’IHÉS129(2019), public publisher PDF. Version receipt: `6b43d1ff3c3f345db85100562a30c2bcbb6fcbfc2874ce899f8b4ded23ff23dd`. Read ranges: §8.1 read completely. §8.2 belongs to DD.4 and is imported, not reconstructed.; Review (REV-CrystallineCohomology--CR.0, 2026-10-06/07): pp. 265–270 (§8.1) read..
- **eg**: [Rigid connections and F-isocrystals](https://page.mi.fu-berlin.de/esnault/preprints/helene/126_esn_gro.pdf). Author-hosted Acta Mathematica225(2020) manuscript. Version receipt: `0bfa00b7dbae7a59c193d3523028df826741f15d3e88cb50526f8656a7fb8e35`. Read ranges: §2.6 and§7 End⁰ crystalline/de Rham comparison paragraph read. Katz and p-curvature assertions retain CartierFlows ownership.; Review (REV-CrystallineCohomology--CR.0, 2026-10-06/07): author-hosted manuscript: pp. 14–15 (§2.6) read as page images, §7 and the introduction in the text. Published version: pp. 119–121 compared for two source issues..
- **bo-correction**: [Corrigendum to Appendix B of Notes on Crystalline Cohomology](https://math.berkeley.edu/~ogus/preprints/BO_B2_Erratumre.pdf). 21August2013, two-page correction. Version receipt: `7a31ee9881433d3db283bbfcdfbba23e39e53acd919d9230a054cc3c3bc8fc0a`. Read ranges: Both pages read completely, including the surjective replacement and the distinction between a derived isomorphism and an actual quasi-isomorphism to the original tower.; Review (REV-CrystallineCohomology--CR.0, 2026-10-06/07): both pages read..
- **ekedahl**: [On the multiplicative properties of the de Rham–Witt complex I](https://archive.ymsc.tsinghua.edu.cn/pacm_download/116/7414-11512_2006_Article_BF02384380.pdf). Arkiv för Matematik22(1984),185–239, public archive PDF. Version receipt: `f8d748a7ccef663960ff431a0d632d13122f515938fb68a1b19703002c06dbe5`. Read ranges: Introduction/§0; I.2–3 trace construction and I.3.4–I.4 tail portions; I.5 complete;II Theorem2.2 statement/Corollary2.2.23 proof read. Unread I.1/I.3 interiors and Berthelot VI/VII references remain the trace/purity proof gate.; Review (REV-CrystallineCohomology--CR.0, 2026-10-06/07): pp. 185–188 and 191–204 read as page images (the text layer of the scan is poor).; Revision 2, 2026-10-10: Chapter I §2 equations (2.5)–(2.11), pp. 192–194, and §5 p. 198 reread; pp. 194 and 198 inspected as page images. Other historical reading claims remain attributed to the earlier review..
- **shiho**: [On logarithmic Hodge–Witt cohomology of regular schemes](https://www.ms.u-tokyo.ac.jp/journal/pdf/jms140404.pdf). Journal of Mathematical Sciences, University of Tokyo14(2007),567–635. Version receipt: `510b1918c021da4030ecf0f281ae7c90f1071c2f7eeebb5723c78ea1db9cdbad`. Read ranges: §2 through Corollary2.13, including all reduction arguments, read completely. Purity and Gersten results are outside this part.; Review (REV-CrystallineCohomology--CR.0, 2026-10-06/07): pp. 572–578 (§2) read..
- **cmm**: [K-theory and topological cyclic homology of henselian pairs](https://www.imo.universite-paris-saclay.fr/~matthew.morrow/Clausen%2C%20Mathew%2C%20Morrow%2C%20K-theory%20and%20TC%20of%20Henselian%20pairs.pdf). Author-hosted JAMS34(2021) manuscript. Version receipt: `68fab6b1e08b9584af74c6540a1f9101f4ff3bce96955111d719f4a202de4eb2`. Read ranges: §5.3, especially Definitions5.25–26 and the Illusie pro-sheaf sequence read. K-theory/TC comparison is owned by other roadmaps.; Review (REV-CrystallineCohomology--CR.0, 2026-10-06/07): pp. 43–45 (§5.3) read; p. 16 and the bibliography for two source issues..
- **dl**: [A p-adic arithmetic inner product formula](https://arxiv.org/pdf/2204.09239v3). arXiv:2204.09239v3. Version receipt: `1f759774cdbf8700c5978b6ea45c1bf63c99b993136a82a45a907320fef53bfa`. Read ranges: AppendixB.2 read completely. CR.4 owns only the Witt models; log-crystalline sites and monodromy are requested from CR.5/6.; Review (REV-CrystallineCohomology--CR.0, 2026-10-06/07): pp. 79–84 (Appendix B.1, B.2 and the opening of B.3) read..
- **gros-chern**: [Classes de Chern et classes de cycles en cohomologie de Hodge–Witt logarithmique](http://www.numdam.org/item/MSMF_1985_2_21__1_0.pdf). Mémoires de la Société Mathématique de France (2) 21 (1985), 87 pp.; Numdam scan. Version receipt: `fffa536be3bcf10a24f4e8679258dc37bcab13b8ed5f77da15852033e9def27a`. Read ranges: Chapitre II, §5.1, printed pp. 24–25 ((5.1.7)–(5.1.13)): the crystalline first Chern class recalled from Berthelot–Illusie. Read for the review; nothing else was read..
- **illusie-drw**: [Complexe de de Rham–Witt et cohomologie cristalline](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf). Annales scientifiques de l’É.N.S. (4) 12 (1979), 501–661; Numdam scan. Version receipt: `bf9b783b4f5f255133c68ccb544aec029f25828aa943a744ccb6958d51f218d8`. Read ranges: Read on the page images for the review (printed page = PDF page + 499): Table des matières, Conventions et notations and the start of Part 0 (pp. 502–504); 0 §1.3.23–1.5.1 (pp. 510–511); 0 §2.4: 2.4.1, Théorème 2.4.2 and its proof up to Lemme 2.4.5 (pp. 527–529); 0 §3 complete (pp. 534–541); I, introduction and §1 complete (pp. 541–550); I §2: 2.15–2.21 (pp. 561–567); I §3 complete and 4.1 (pp. 567–583); I §5: 5.5–5.7.9 (pp. 594–598); II, introduction, §§1–3 complete and 4.1–4.6 (pp. 598–621). Not read: 0 §§1.1–1.3.22, 2.1–2.3, 2.5; I §2, 2.1–2.14; I §4; I §5.0–5.4; II §§4.7–7..
- **stacks-derham**: [de Rham Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/derham.tex). derham.tex at a04446e57ec1fbc252a871afcec7752fb2807b14. Version receipt: `2dc4e936fce0e3b2729f9d9b68d4ff5e6f188f1c25f6723d61b92fa682e90fc8`. Read ranges: Sections on cup product, first Chern class, Künneth formula, projective space and Poincaré duality (tags 0FLE, 0FM9–0FMB, 0FMI–0FMJ, 0FW5–0FW7), read for the review..
- **stacks-weil**: [Weil Cohomology Theories](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/weil.tex). weil.tex at a04446e57ec1fbc252a871afcec7752fb2807b14. Version receipt: `3861f2d85eb151058b6a0248e7f1b06910adf8c4f4f017e856cc76f7a439ad3b`. Read ranges: Lemmas 0FGT, 0FGZ and 0FH0 (pushforward by duality, class of the diagonal), read for the review..
- **stacks-sites-cohomology**: [Cohomology on Sites](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/sites-cohomology.tex). sites-cohomology.tex at a04446e57ec1fbc252a871afcec7752fb2807b14. Version receipt: `5b335ce2c7208a128b3c744b8828d93508063f41a4fabbce2e921f890928895c`. Read ranges: Section "Cup product" (tag 0FPJ) with Lemmas 0FPL, 0FPM, 0H9A, and Remark 07A7 (base change map), read for the review..
- **bhatt-dejong**: [Crystalline cohomology and de Rham cohomology](https://arxiv.org/pdf/1110.5001v1). arXiv:1110.5001v1 (2011). Version receipt: `a2d1e4763d25371c49e6b0abe897db8d7e5d3d9d709aa77588bb5e233f7dc89d`. Read ranges: §2.7–2.19, pp.3–6: crystals, smooth charts, Čech bicomplex and its contractions; §3.1–3.10, pp.7–9: higher direct image vanishing, global comparison and finite base change..
- **lsq-filtered**: [The filtered Poincaré lemma in higher level (with applications to algebraic groups)](https://arxiv.org/pdf/math/0409564v1). arXiv:math/0409564v1; only the ordinary level m=0 is used. Version receipt: `4db3a040ffaf8c2e55b42a15e760cef1b255b565f8bd8e082575f5cba74c8f0b`. Read ranges: §2.8–2.10, pp.7–8 and §3.1–3.11, pp.9–12: filtered PD contraction, linearization, transversality and comparison; specialize every assertion to level zero..
- **stacks-etale-cohomology**: [Étale Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/etale-cohomology.tex). Pinned TeX at a04446e57ec1fbc252a871afcec7752fb2807b14. Version receipt: `c0f6bec61aa79a94f45e0ec9f1a85bfa9b85859dce175d11922eb17d131139f8`. Read ranges: §59.22, Theorem 59.22.4 and proof: cohomology of quasi-coherent sheaves in the Zariski, étale and flat topologies..
- **stacks-descent**: [Descent](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/descent.tex). Pinned TeX at a04446e57ec1fbc252a871afcec7752fb2807b14. Version receipt: `49483b3bcb36427a607a8227f4ea67730fcddf1eeccb8e992ca61915ace3b31d`. Read ranges: §35.9, Proposition 35.9.3 (03DW) and proof: quasi-coherent cohomology, faithfully flat affine Čech descent..
- **lurie-isocrystals**: [Lecture 26: Isocrystals](https://www.math.ias.edu/~lurie/205notes/Lecture26-Isocrystals.pdf). December 6, 2018 lecture notes; classification statement only, not a proof. Version receipt: `73fcb0f228e194ba1e4db21957702d861d6abaeae4c11bc3a66511a0b91251ea`. Read ranges: Definition 1 and Example 5, pp.1–2; Theorem 6, p.2; Definition 12 and Remark 14, p.3. The theorem is stated without proof; no vector-bundle classification is used..

- **lsq-transversal**: [Transversal crystals of finite level](https://www.numdam.org/article/AIF_1997__47_1_69_0.pdf). Annales de l’Institut Fourier 47 (1997), no.1, pp.69–100. Version receipt: `d9b9a95e09b2ad56a780e040d43c9cfb5fbf7c193207c85362746fe220cef53d`. Read ranges: §1.1, Definitions 1.1.3–1.1.6 and Propositions 1.1.7–1.1.8, printed pp.72–73; §4.2, Definitions 4.2.1–4.2.2, Example 4.2.3 and Propositions 4.2.4–4.2.5, printed pp.90–91: saturated inverse image, transversal filtrations and ideal-multiple examples..
