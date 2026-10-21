# Rings with symbols, relative K₂ and Tate comparisons

**Summary.** These layers connect explicit Steinberg words to relative nilpotent calculations and to the arithmetic cup product. They use the stable classical K₂ of T.1 and the symbol-preserving Matsumoto equivalence of T.2. Additive notation is used for K₂ and Brauer groups; roots of unity are written multiplicatively. A homotopy K₂ is identified with its classical counterpart only through the specified comparison map.

The old notation with 1+ab and the modern notation with 1−rs must be distinguished. This document uses **D(r,s)** for the modern symbol and **P(a,b)** for the old plus word. Their conversion is D(r,s)=P(−r,s), without inversion. The source-version warning is explained after the targets.

## Boundaries and imports

- **KTheoryLowDegrees U.5** supplies relative elementary/congruence groups, relative K₁, the augmented double and its degree-one fibre comparison. The missing relative degree-two comparison is stated explicitly below.
- **GeneralAlgebraicKTheory K.5** supplies the homotopy-fibre definition of relative K-theory. The relative Steinberg comparison belongs to this layer’s adapter; it is not inferred from K₁ alone.
- **MotivicEtaleKTheory M.1, M.3 and M.8** supply twists and étale/Galois comparisons, the Galois symbol and arithmetic Tate theorems, and finite étale Chern classes. Their exact existing nodes are the prerequisites below. Their proofs and retained gaps are imported unchanged.
- **ClassicalArithmeticCompletion CA.1** owns local m-th power norm-residue symbols, their Steinberg and skew-symmetry laws, and higher Hilbert reciprocity. No second local-symbol construction is introduced here.
- **Tau Ceti ClassFieldTheory** supplies the primitive-root coefficient pairing, Kummer-to-Brauer map, all-degree Kummer cup–cyclic class theorem, local Artin reciprocity, invariant and global Brauer sequence. **QuadraticFormInvariants 7B** supplies the generic crossed-product comparison with H²; 6E supplies the quadratic Hilbert comparison. T.7 transports these maps to the explicit symbol algebra and the K₂ and twist interfaces.

The pinned declarations listed in the packet were read at Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 and Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. The current read-only Tau Ceti and TauCetiRoadmap checkouts were also inspected. At Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, `kummerCupPairing` implements the exponent contraction; `h2MuToBr_cup_kummerClass` compares the ordered Kummer cup to the negative cyclic class with the second input defining the extension, including proper-degree cases. `h2MuEquivZMod` and `toRatAddCircle_h2MuEquivZMod` identify the local coordinate by k↦k/m; `brauerCohomologyEquiv_crossedProductClass` already compares a general finite Galois crossed product. The corresponding read-only TauCetiRoadmap revision was 0d144d044dacebca17b654695b6f1ad58f159b27. These are imports beyond the pins, not new baseline declarations. The suggested file uses only the pinned carriers.

## T.6 — Rings with symbols and relative groups

The following targets refine the six earlier T.6 targets. The stable word and the relative Steinberg quotient retain their original owners; the comparisons below correct and deepen their specifications. Three proof inputs remain explicitly identified after the targets. Every statement that needs one of them is conditional on that input.


### Dennis–Stein convention and stable word

**Target:** `K2SymbolsBrauer:T.6/modern-convention-calibration`.

For a commutative ring A, r,s∈A and u=1−rs∈Aˣ, the modern symbol D(r,s) is the stable Steinberg-kernel element x_ji(−s/u)x_ij(−r)x_ji(s)x_ij(r/u)h_ij(u)⁻¹. It is independent of the distinct indices i,j. For the older plus-convention word P(a,b)=x_ji(−b/(1+ab))x_ij(a)x_ji(b)x_ij(−a/(1+ab))h_ij(1+ab)⁻¹, the exact translation is D(r,s)=P(−r,s). If r is a unit, D(r,s)={r,1−rs}; if s is a unit, D(r,s)={1−rs,s}. The translation has no additional inversion.


**Hypotheses.** A is commutative and unital; u=1−rs is a unit. All assertions about centrality and index independence take place after stabilization.


**Argument.**

Use T.2:symbols/diagonal-lift-words and /diagonal-lift for h_ij. The elementary image of the first four factors is diag(u,u⁻¹), so the last factor puts the word in the kernel.

Stein–Dennis Proposition 1.1 constructs P and proves independence after adjoining a third index; T.1/k2-is-centre supplies stable centrality. Substitute a=−r literally in the word. No interchange of factors is required.

Proposition 1.1(H2) gives P(a,b)={−a,1+ab} when a is a unit and {1+ab,b} when b is a unit. Substitution gives both formulas. Every unit symbol {a,b} is D(a,a⁻¹(1−b)).

Van der Kallen §5.2, p.489, uses the same plus word; his unit expression {−a⁻¹,1+ab}⁻¹ equals {−a,1+ab}, since {−1,v} has order dividing two. Morrow Remark 3.10 also changes only the first argument.


**Checks.**

- In ℚ(t), D(2,(1−t)/2)={2,t}, with tame residue 2 at t=0; inserting an inverse gives 1/2.
- The construction does not imply centrality for St(2,A).
- D(r,0)=D(0,s)=0, and D(r,s) need not be alternating.


**Prerequisites.** `K2SymbolsBrauer:T.6/dennis-stein-symbol`, `K2SymbolsBrauer:T.1/k2-is-centre`, `K2SymbolsBrauer:T.2:symbols/diagonal-lift-words`, `K2SymbolsBrauer:T.2:symbols/diagonal-lift`.


**Sources.** [SteinDennis1973] Proposition 1.1, printed pp.283–285. The plus word, its stable independence, and the two unit formulas are proved here. [Kallen1977] §5.2, printed pp.488–489. The presentation uses the same plus-convention word and a unit formula equivalent by bilinearity. [MorrowLocalisations] Remark 3.10, p.8. The modern convention is obtained by negating the first argument without inversion.


### Dennis–Stein relations over a commutative ring

**Target:** `K2SymbolsBrauer:T.6/general-relations-calculus`.

The stable symbols satisfy (D1) D(r,s)=−D(s,r); (D2) D(r,s)+D(r,t)=D(r,s+t−rst) when 1−rs and 1−rt are units; (D3) D(r,st)=D(rs,t)+D(rt,s) when 1−rst is a unit. These hold over every commutative ring, independently of the extra hypotheses needed for a presentation theorem.


**Hypotheses.** A is commutative. Each displayed symbol must be admissible; the stated unit conditions imply this.


**Argument.**

Stein–Dennis Proposition 1.1(H1) gives P(a,b)=−P(−b,−a), hence D1. Its proof rearranges the defining Steinberg word and uses the third-index conjugation identities, not a field reduction.

For D3 use Proposition 1.1(H5): P(a,bc)=P(ab,c)+P(ac,b). Its Hall–Witt calculation uses x_12(−a), x_23(−b), x_31(−c); the Steinberg commutator relations and centrality of P eliminate the conjugation terms. Put a=−r.

For D2 put u=1+ab and v=1+ac. Proposition 1.1(H3), with second increment cu, gives P(a,b+cu)=P(a,b)+P(a/u,cu)+{u,v}, because 1+a(b+cu)=uv.

H5 rewrites P(a/u,cu)=P(a,c)+P(ac/u,u). Since u is a unit, H2 gives P(ac/u,u)={v,u}. Antisymmetry of unit symbols cancels {v,u}+{u,v}. Thus P(a,b+c+abc)=P(a,b)+P(a,c); put a=−r. All denominators are u or v, which are units by hypothesis.


**Checks.**

- The proofs apply to rings with zero divisors, including ℤ/4.
- For D2, 1−r(s+t−rst)=(1−rs)(1−rt).
- No Matsumoto theorem or local-presentation theorem is used in proving these relations.


**Prerequisites.** `K2SymbolsBrauer:T.6/modern-convention-calibration`, `K2SymbolsBrauer:T.2/symbol-consequences`.


**Sources.** [SteinDennis1973] Proposition 1.1(H1)–(H5) and proof, printed pp.283–285. The third-index word identities and Hall–Witt calculation prove the relations before any generation theorem. [WeibelIII] III.5.11, printed pp.43–44 of the separate chapter. The modern D1–D3 presentation fixes the convention being proved.


### Threefold stability

**Target:** `K2SymbolsBrauer:T.6/threefold-stability`.

A commutative ring A is threefold stable if for every three unimodular pairs (a_i,b_i), i=1,2,3, there is t∈A such that every a_i+b_i t is a unit. A pair is unimodular precisely when a_i A+b_i A=A. This predicate is a sufficient hypothesis for the stable Dennis–Stein presentation; it is not imposed on the separate all-local-ring theorem.


**Hypotheses.** A is a commutative unital ring.


**Argument.**

Use the displayed simultaneous-unit condition as the definition. Ring equivalences transport witnesses and unimodular pairs.

For a semilocal ring reduce the three pairs to its finitely many residue fields. Each pair with b_i nonzero excludes one value of t; a residue field with at least four elements supplies an allowed value. Lift the finitely many choices by the Chinese remainder theorem; the resulting three values avoid all maximal ideals and are units.

Conversely, in a residue field with at most three elements, the pairs (−c,1) indexed by all field elements, repeated if needed, exclude every t. In a semilocal ring choose these obstructions in that maximal ideal and harmless unit pairs in the others, again by Chinese remaindering.


**API.**

- `IsThreefoldStable`: The quantified simultaneous-unit predicate on three unimodular pairs.
- `IsThreefoldStable.exists_unit_perturbation`: The definition returns t and the three unit proofs for supplied pairs.
- `IsThreefoldStable.ringEquiv`: A ring equivalence preserves and reflects the predicate, compatibly with identity and composition.
- `isThreefoldStable_iff_residue_card_ge_four`: For semilocal A, threefold stability is equivalent to cardinality at least four of every residue field.


**Uses.** T.6/threefold-dennis-stein-presentation: The chunk construction needs simultaneous general-position choices. T.6/local-presentation-completeness: The residue criterion isolates exactly the local rings not covered by this proof.


**Tests.**

- **computation** (`threefold_five`): 𝔽₅ and ℤ/25 are threefold stable, since their residue fields have five elements.
- **non-example** (`threefold_two_three`): 𝔽₂ and 𝔽₃ are local but not threefold stable: the pairs (−c,1) exclude all t.
- **compatibility** (`threefold_product`): 𝔽₅×𝔽₅ is threefold stable although it is not local.


**Checks.**

- For semilocal A the predicate is equivalent to every residue field having at least four elements.
- It is invariant under ring equivalence and is preserved by finite products of semilocal rings satisfying the residue criterion.


**Prerequisites.** `mathlib:IsUnit`.


**Sources.** [Kallen1977] §5.2 and §5.4(3), printed pp.488–489. Definition of k-fold stability and the exact semilocal residue-cardinality criterion.


### Dennis–Stein presentation for threefold stable rings

**Target:** `K2SymbolsBrauer:T.6/threefold-dennis-stein-presentation`.

Let D(A) be the abelian group on all admissible pairs (r,s), with relations D1–D3. If A is threefold stable, the map D(A)→K₂(A) sending a generator to the modern stable word is an isomorphism. More precisely D(A)≅K₂(n,A) for n≥3, and these isomorphisms commute with stabilization and ring maps between such rings. No corresponding claim is made for n=2.


**Hypotheses.** A is commutative and threefold stable; n≥3 in the finite-rank assertion.


**Argument.**

The general relations give the homomorphism. Translate van der Kallen’s plus generators by (a,b)↦(−a,b); this transports all presentation relations and the word map exactly.

For the inverse use the rank-one chunk of §§5.8–5.19: its central coordinate is D(A), and the elementary two-by-two moves give the rank-one Steinberg action and the map of Theorem 5.3. This intermediate rank-two Steinberg kernel is not identified with stable K₂.

In §§6.3–6.9 glue two overlapping rank-one pieces as triples [x,M,y], with the D-coordinate identified by the equivalence in §6.3. The left and right partially defined elementary translations respect this equivalence and satisfy the local Steinberg relations.

Section 6.14 uses threefold stability to put any required finite configuration in common general position. Sections 6.16–6.22 extend the local translations uniquely and make composition independent of the chosen general-position move. Section 6.23 obtains a St(3,A) action and reads a kernel word in its central D-coordinate.

Reading the central coordinate sends each symbol word back to its defining generator; the action reconstructs every kernel word. These are the two inverse identities of Theorem 6.2, not just generation. The injective-stability argument in §§7.2–7.4, together with elementary generation, transports the isomorphism to every n≥3 and the colimit (Theorem 7.1).


**Checks.**

- Both composites are identity, on D-generators and on arbitrary Steinberg-kernel words.
- The finite-rank range starts at three; §5.4(6) warns that the rank-two inverse can have kernel.
- The result covers local rings with residue cardinality ≥4 and nonlocal examples such as 𝔽₅×𝔽₅.


**Prerequisites.** `K2SymbolsBrauer:T.6/threefold-stability`, `K2SymbolsBrauer:T.6/general-relations-calculus`, `K2SymbolsBrauer:T.1/k2-definition`, `K2SymbolsBrauer:T.6/dennis-stein-presentation`.


**Sources.** [Kallen1977] Theorem 5.3, p.489; §§5.8–5.19, pp.491–495; Theorem 6.2 and §§6.3–6.23, pp.496–506; Theorem 7.1 and §§7.2–7.4, pp.507–508. The central-coordinate construction supplies injectivity and the stable comparison, under threefold stability.


### Local Dennis–Stein presentation and its uncovered cases

**Target:** `K2SymbolsBrauer:T.6/local-presentation-completeness`.

For every commutative local ring A, the modern generator map D(A)→K₂(A) is an isomorphism, including residue fields 𝔽₂ and 𝔽₃. The field cases are imported from T.2 and the inherited T.6 field inverse; local rings with residue cardinality ≥4 use the preceding theorem. The proof for nonfields with residue field 𝔽₂ or 𝔽₃ remains the precisely identified missing input G1.


**Hypotheses.** A is a commutative local ring; there is no hypothesis on its residue-field cardinality.


**Argument.**

Partition into fields, nonfields with residue size ≥4, and nonfields with residue size two or three.

For fields use the inherited inverse based on Matsumoto; the map is the modern word by modern-convention-calibration. For residue size ≥4 use the semilocal criterion and threefold-dennis-stein-presentation.

Van der Kallen–Maazen–Stienstra §2.4 states the remaining all-local theorem, but is an announcement. Weibel III.5.11.1(a) also states it. Neither contains the needed small-residue-field injectivity proof. G1 records the exact source and normal-form proof still needed; there is no reduction from locality to threefold stability.


**Checks.**

- ℤ/4 and ℤ/9 are admissible local examples even though neither is threefold stable.
- Any use of the local presentation in later calculations retains G1 as a prerequisite gap.


**Prerequisites.** `K2SymbolsBrauer:T.6/threefold-dennis-stein-presentation`, `K2SymbolsBrauer:T.6/dennis-stein-presentation`, `K2SymbolsBrauer:T.2/matsumoto`.


**Sources.** [KallenMaazenStienstra1975] §2.4, Theorem 1, p.935. States the all-local presentation but announces rather than proves it. [WeibelIII] III.5.11.1(a), p.44 of the separate chapter. States the same local result; its proof is attributed elsewhere.


### Relative Steinberg K₂ and the homotopy fibre

**Target:** `K2SymbolsBrauer:T.6/relative-homotopy-fibre-comparison`.

For an ideal I of a unital ring A, use the augmented double A⋉I with multiplication (a,x)(b,y)=(ab,ay+xb+xy), projections p(a,x)=a and q(a,x)=a+x. St(A,I) is ker St(p) modulo the normal closure of the cross-commutators [x_ij(0,u),x_kl(v,−v)] with u,v∈I, i≠j and k≠l. The q-map gives St(A,I)→E(A,I); its kernel is classical relative K₂(A,I). The target comparison identifies this group naturally with π₂ fib(K(A)→K(A/I)), identifies its forgetful and connecting maps, and extends to the segment K₃(A)→K₃(A/I)→K₂(A,I)→K₂(A)→K₂(A/I)→K₁(A,I).


**Hypotheses.** A is unital and I is two-sided. Commutativity is imposed only for the symbol calculations below. The cross-commutator subgroup is normally generated; the four indices need not be pairwise distinct.


**Argument.**

Import the augmented double, its two congruence models and relative K₁ from U.5. The inherited T.6/relative-steinberg-group supplies the relative Steinberg quotient and its elementary map.

The cross-commutators die under q because x_kl(v,−v) maps to the identity; they die under p because x_ij(0,u) does. The quotient therefore retains the relative root generators and q-map.

Import the K-theory homotopy fibre from GeneralAlgebraicKTheory:K.5/relative-K-theory. U.5/relative-comparison-of-sequences identifies the absolute K₂ terms and relative K₁ portion, not π₂ of the relative fibre.

The missing Keune–Loday comparison must construct the relative degree-two map, prove bijectivity and compare the K₃(A/I) boundary as well as the subsequent maps. Levine §2.1 recalls the natural comparison and exact sequence but does not prove it; this is G2.

For a split quotient A→A/I, the K₃ map is surjective, so the relative-to-absolute K₂ map is injective and identifies the relative group with the kernel. For a nonsplit quotient this conclusion is not automatic.


**Checks.**

- For I=0 the relative Steinberg group and relative K₂ are zero.
- For a split square-zero extension, the fibre calculation maps injectively to absolute K₂.
- A degree-one fibre comparison or excision claim does not replace G2.


**Prerequisites.** `K2SymbolsBrauer:T.6/relative-steinberg-group`, `KTheoryLowDegrees:U.5/double-congruence-isom`, `KTheoryLowDegrees:U.5/double-relative-K1-isom`, `KTheoryLowDegrees:U.5/relative-comparison-of-sequences`, `GeneralAlgebraicKTheory:K.5/relative-K-theory`.


**Sources.** [WeibelIII] Definition III.5.7, p.40 of the separate chapter. Defines the relative Steinberg quotient and the relative exact sequence. [Levine1989] §2.1, printed pp.289–290. Recalls the natural relative group, comparison and K₃-to-K₁ exact segment, citing Loday and Keune; it does not supply their proof.


### Relative Dennis–Stein presentation with the input guard

**Target:** `K2SymbolsBrauer:T.6/guarded-relative-presentation`.

For commutative A and I⊆Jac(A), classical K₂(A,I) is generated by D(r,s) with r∈I or s∈I. D1 and D2 are imposed only when all displayed symbols are relative. D3 is imposed only when at least one of its INPUTS r,s,t lies in I. For D2 this eligibility says r∈I or both s,t∈I. These are presentations of the relative group, not just of its image in K₂(A). The generation and full kernel proof of Keune’s Theorem 15 is input G3.


**Hypotheses.** I is contained in the Jacobson radical, not merely a radical ideal in the scheme-theoretic sense. For the eligible symbols 1−rs is a unit; an element of I is not required to be nilpotent.


**Argument.**

Use the relative Steinberg quotient and lift D(r,x), x∈I, by the double symbol with entries (r,0),(0,x); obtain the other order through D1.

The guarded D-relations map into the relative kernel. Full injectivity and generation must be proved inside that quotient, not inferred from the absolute ring presentation. Levine §2.1 states Keune Theorem 15 with exactly the input guard.

The split-radical theorem announced in van der Kallen–Maazen–Stienstra §2.6 does not establish nonsplit pairs. Keune 1978 was not accessible; G3 retains the full relative presentation proof.

The input guard is essential. In A=𝔽₃[x,y]/(x²,y²), I=(xy), take (r,s,t)=(x,y,x+y), all outside I. All three output pairs of D3 are relative, but the differential map below sends the left side to (−1,0) and the two right terms to (1,1) and (0,1) in the basis xy⊗dx,xy⊗dy. Their difference is (1,1)≠0. Imposing all output-eligible triples gives a false relation.


**Checks.**

- The guard is checked on r,s,t, before their products are formed.
- The square-zero calculations use this guarded presentation and explicitly retain G3.
- For I=0 there are only zero-entry relative symbols, all zero.


**Prerequisites.** `K2SymbolsBrauer:T.6/relative-homotopy-fibre-comparison`, `K2SymbolsBrauer:T.6/general-relations-calculus`, `mathlib:Ideal.jacobson`, `K2SymbolsBrauer:T.6/relative-presentation`.


**Sources.** [Levine1989] The unnumbered theorem in §2.1, p.290, attributed to Keune Theorem 15. States the Jacobson-radical hypothesis and the input-guarded relative relations. [KallenMaazenStienstra1975] §2.6, Theorem 2, p.935. The announced split-pair presentation has an extra splitting hypothesis and cannot close the general relative proof.


### The relative differential symbol

**Target:** `K2SymbolsBrauer:T.6/relative-differential`.

For commutative A and I⊆Jac(A), set B=A/I and Ω=Ω¹_{B/ℤ}. The relative symbol differential δ:K₂(A,I)→I⊗_A Ω is the additive homomorphism specified by δD(x,r)=x⊗d(r̄) and δD(r,x)=−x⊗d(r̄), for x∈I. It is surjective and natural for maps of pairs. If both entries lie in I the two formulas both give zero. Its construction from classical K₂ uses the guarded relative presentation, hence G3.


**Hypotheses.** A is commutative; I⊆Jac(A). The tensor product is over A via A→B on Ω, so I²⊗Ω vanishes. The base of differentials is ℤ.


**Argument.**

Use the real Mathlib Kähler differential and its universal derivation for Ω, rather than a vector space presented as a substitute.

Check D1 by swapping signs. For D2, if r∈I, the reduced second argument is s̄+t̄; if r∉I, eligibility forces s,t∈I and the correction rst lies in I² and tensors to zero.

For D3 with r∈I use d(s̄t̄)=s̄ d(t̄)+t̄ d(s̄). With s∈I the right side becomes rs⊗d(t̄)−s⊗d(r̄t̄)=−st⊗d(r̄), as required. The t∈I case follows by interchanging s,t. Overlapping cases agree because d(I)=0 in B.

The presentation descends these values to a homomorphism. Pure tensors x⊗d(b) generate the target and lift to D(x,r), so δ is onto. Functoriality follows on these generators; uniqueness is the relative presentation’s generation statement.


**API.**

- `relativeSymbolDifferential`: The unique additive map with the two displayed generator formulas.
- `relativeSymbolDifferential_left`: δD(x,r)=x⊗d(r̄) for x∈I.
- `relativeSymbolDifferential_right`: δD(r,x)=−x⊗d(r̄) for x∈I.
- `relativeSymbolDifferential_surjective`: Every x⊗d(b) has a preimage D(x,lift b).
- `relativeSymbolDifferential_natural`: For a ring map f:A→A′ with f(I)⊆I′, δ′K₂(f)= (f_I⊗Ω(f̄))δ, compatibly with identities and composites.


**Uses.** T.6/square-zero-differential-kernel: Identifies the quotient by symbols with two ideal entries. T.6/dual-number-differential-isom: Computes the square-zero examples through actual Kähler differentials.


**Tests.**

- **computation** (`differential_dual_variable`): For A=ℚ[t][ε]/ε², I=(ε), δD(ε,t)=dt≠0 under I⊗Ω_{ℚ[t]/ℤ}≅Ω_{ℚ[t]/ℤ}.
- **compatibility** (`differential_swapped_variable`): In the same pair, δD(t,ε)=−dt; omitting the relative-order sign fails this.
- **degenerate** (`differential_two_ideal_entries`): δD(aε,bε)=0 for all a,b; this does not assert D(aε,bε)=0.
- **non-example** (`differential_input_guard`): For A=𝔽₃[x,y]/(x²,y²), I=(xy), the output-only D3 guard produces the nonzero defect (1,1) described above.


**Checks.**

- For I²=0, δD(I,I)=0.
- For any map of radical pairs, the δ-square commutes with its induced tensor-differential map.


**Prerequisites.** `K2SymbolsBrauer:T.6/guarded-relative-presentation`, `mathlib:KaehlerDifferential`, `mathlib:KaehlerDifferential.D`.


**Sources.** [WeibelIII] Exercise III.5.14(a)–(b), printed p.46 of the separate chapter. The exercise gives the relative differential and its square-zero kernel; the proof here checks each guarded relation. [KallenDual1971] The unnumbered theorem and corollary, p.1204, with proof pp.1205–1207. The dual-number differential comparison motivates the generator formula and the torsion test.


### The square-zero kernel of the differential

**Target:** `K2SymbolsBrauer:T.6/square-zero-differential-kernel`.

If I²=0 in a commutative ring A, then I⊆Jac(A), and ker δ is exactly the subgroup S generated by the symbols D(x,y), x,y∈I. Consequently K₂(A,I)/S≅I⊗_A Ω¹_{(A/I)/ℤ}. Even when 2 is invertible, S need not vanish for a general square-zero ideal.


**Hypotheses.** A is commutative and I²=0. The relative presentation is used subject to G3.


**Argument.**

For x∈I and a∈A, (1−ax)(1+ax)=1; this proves I⊆Jac(A) and automatic admissibility. The differential annihilates S.

Modulo S define B(x,b)=D(x,lift b). A change of lift by I changes the symbol by elements of S, using D2 and I²=0. D1 and D2 give additivity in x and b after the correction xrs∈I is discarded.

D3 gives B(x,bc)=B(xb,c)+B(xc,b). The abelian presentation of I⊗Ω_B by pairs (x,b), additivity and this balanced Leibniz relation therefore gives the inverse map. This argument uses a tensor presentation; it does not assume an A-module structure on K₂(A,I)/S.

For a sharp non-example take A=ℚ⊕ℚ² with square-zero ideal I=ℚ². For r=a+x, s=b+y with 1−ab≠0, λD(r,s)=det(x,y)/(1−ab) respects D1–D3. In D2 the numerator becomes (1−ac)det(x,y)+(1−ab)det(x,z) and the denominator becomes (1−ab)(1−ac); in D3 the two determinant cross-terms cancel. Restrict to relative symbols. Then D(e₁,e₂) maps to 1, while Ω_{ℚ/ℤ}=0, so S≠0 although 2 is a unit.


**Checks.**

- The inverse is independent of lifts and has both inverse identities.
- Square-zero does not mean the double-entry symbols vanish.
- The non-example distinguishes an arbitrary square-zero ideal from the principal dual-number ideal.


**Prerequisites.** `K2SymbolsBrauer:T.6/relative-differential`, `K2SymbolsBrauer:T.6/general-relations-calculus`, `mathlib:TrivSqZeroExt`.


**Sources.** [WeibelIII] Exercise III.5.14(a)–(b), printed p.46 of the separate chapter. Gives the square-zero differential kernel and the relevant examples; the tensor-presentation proof supplies the missing argument.


### Relative K₂ of dual numbers with two invertible

**Target:** `K2SymbolsBrauer:T.6/dual-number-differential-isom`.

For a commutative ring R with 2∈Rˣ, let A=R[ε]/ε² and I=εR. The homomorphism δ induces K₂(A,I)≅Ω¹_{R/ℤ}, taking D(aε,b) to a db. The splitting A→R identifies this relative group with the kernel of K₂(A)→K₂(R); its further identification with the homotopy-fibre group uses G2.


**Hypotheses.** R is commutative and 2 is a unit. A and I are the native DualNumber or equivalent TrivSqZeroExt carrier and its augmentation ideal; the presentation uses G3.


**Argument.**

Use the square-zero kernel theorem. D3 and ε²=0 give D(aε,bε)=D(abε,ε). The right side is symmetric in a,b, whereas D1 negates it, so every such symbol is killed by two.

Additivity in the first nilpotent entry gives D(cε,ε)=2D((c/2)ε,ε)=0. Thus S=0, and I⊗_A Ω_R≅Ω_R by aε⊗ω↦aω.

The inverse sends a db to D(aε,b); additivity, balanced Leibniz and independence of presentations follow from square-zero-differential-kernel. The split relative exact sequence gives the classical absolute-kernel interpretation.


**Checks.**

- For R=ℚ[t], the class D(ε,t) corresponds to dt and is nonzero.
- For an odd finite field R, Ω_{R/ℤ}=0, hence the relative group is zero.
- For R=ℤ, the relative group is ℤ/2 rather than Ω_{ℤ/ℤ}=0 (van der Kallen 1971); the hypothesis on two cannot be omitted.


**Prerequisites.** `K2SymbolsBrauer:T.6/square-zero-differential-kernel`, `K2SymbolsBrauer:T.6/relative-homotopy-fibre-comparison`, `mathlib:DualNumber`, `mathlib:DualNumber.eps_mul_eps`.


**Sources.** [KallenDual1971] The unnumbered theorem, corollary and Example 1, p.1204; proof pp.1205–1207. Computes dual-number relative K₂ and exhibits the integral two-torsion obstruction. [WeibelIII] Exercise III.5.14(c), p.47 of the separate chapter. Dual numbers and their odd-characteristic specializations are among the required tests.


### A detector for K₂ of ℤ/4

**Target:** `K2SymbolsBrauer:T.6/zmod-four-symbol-detector`.

For A=ℤ/4, define λ on admissible pairs by λ(2,2)=λ(2,3)=λ(3,2)=1 in ℤ/2, and λ=0 on the other admissible pairs. It satisfies D1–D3 and therefore induces K₂(ℤ/4)→ℤ/2 through the local presentation. Its inverse sends 1 to g=D(3,2)={−1,−1}, giving K₂(ℤ/4)≅ℤ/2. The use of the all-local presentation retains G1.


**Hypotheses.** The ring is ℤ/4; admissibility means rs is even. The source group is the actual local Steinberg kernel via local-presentation-completeness.


**Argument.**

There are twelve admissible pairs. Check the three relations by arithmetic modulo four and two; no enumeration of unrestricted nonadmissible generators is used.

Symbols with a zero entry vanish. D(1,2)={1,−1}=0 and D(2,1)=0. D1 gives D(2,3)=−g; D2 with r=2,s=2,t=1 gives D(2,2)=D(2,3)=−g. D1 at (2,2) then gives 2g=0.

The remaining admissible pairs have already been covered. Thus g generates and has order dividing two. The table gives λ(g)=1, providing the lower bound. Consequently the proposed maps have both inverse identities.

The unit formula identifies g=D(3,2)={3,3}={−1,−1}. The detector also gives a relative test for the ideal (2); no identification of an arbitrary relative group with an absolute kernel is inferred.


**API.**

- `zmodFourSymbolParity`: The displayed function on (ℤ/4)² with values in ℤ/2; only admissible pairs define K₂ generators.
- `zmodFourSymbolParity_relations`: The table satisfies D1–D3 on their exact admissible domains.
- `zmodFourK2Equiv`: The induced map K₂(ℤ/4)≃ℤ/2 has inverse 1↦D(3,2).
- `zmodFourK2Equiv_generator`: The equivalence sends {−1,−1} to 1 and the zero class to 0.


**Uses.** T.6/dyadic-nilpotent-computation: Supplies the base case and an independent nonzero detector. T.6/relative-square-zero: Tests the nonvanishing double-ideal-entry kernel at two.


**Tests.**

- **computation** (`zmodFour_double_even`): λ(2,2)=1, so nilpotent double-entry symbols need not vanish.
- **degenerate** (`zmodFour_unit_one`): λ(1,2)=λ(2,1)=0, agreeing with the unit symbol involving 1.
- **compatibility** (`zmodFour_unit_generator`): λ(3,2)=1 and D(3,2)={3,3}; the zero detector would miss this class.
- **non-example** (`zmodFour_admissibility`): (1,1) is not admissible since 1−1·1=0 is not a unit; its table value is not a K₂ generator.


**Checks.**

- Both the upper bound and a nonzero lower-bound detector are present.
- The same table is not asserted for ℤ/8 without rechecking its different admissible pairs.


**Prerequisites.** `K2SymbolsBrauer:T.6/local-presentation-completeness`, `K2SymbolsBrauer:T.6/general-relations-calculus`.


**Sources.** [WeibelIII] Exercise III.5.13, printed p.46 of the separate chapter. The dyadic family includes the ℤ/4 example; the finite presentation proof and detector are given here.


### The uniform dyadic nilpotent example

**Target:** `K2SymbolsBrauer:T.6/dyadic-nilpotent-computation`.

For every n≥2, reduction ℤ/2ⁿ→ℤ/4 induces an isomorphism K₂(ℤ/2ⁿ)≅K₂(ℤ/4)≅ℤ/2, sending {−1,−1} to the nonzero class. In contrast K₂(𝔽₂)=0. The argument is uniform and uses only the local presentation (retaining G1), the unit-symbol calculus and CA.1’s explicit unit generators.


**Hypotheses.** n is an integer with n≥2. Use the all-local presentation subject to G1; no separate dyadic computation is assumed.


**Argument.**

The case n=2 is the detector calculation above. Let n≥3 and A=ℤ/2ⁿ. Every admissible D(r,s) is a unit symbol if either entry is a unit. If neither is a unit, both are even: D2 with increment 1 gives D(r,s)=D(r,s+1−rs), because D(r,1)=0. Its new second entry is odd, hence a unit. Thus unit symbols generate K₂(A), directly from the local presentation.

Import CA.1/unit-group-of-a-power-of-two: Aˣ is generated by −1 and 5. Bilinearity and skew-symmetry imply K₂(A) is generated by a={−1,−1}, b={−1,5}, c={5,5}. All three have order dividing two: for a and b use the order of −1; for c use skew-symmetry. Therefore all of K₂(A) has exponent dividing two.

The unit formula and D3 give b=D(−1,4)=D(−2,2)+D(−2,2)=0. Every term is admissible because the common unit condition is 1+4=5. The general unit identity {u,u}={u,−1} from T.2/symbol-consequences gives c=−b=0. Thus a alone generates, with order at most two.

Naturality sends a to the nonzero generator of K₂(ℤ/4), detected by zmodFourSymbolParity. This supplies the matching lower bound and proves reduction is an isomorphism, uniformly for every n≥3. The argument does not extrapolate from the finite checks at n=3,4.


**Checks.**

- Both the uniform upper bound and the reduction detector are proved.
- The order-two argument is used before concluding 2D(−2,2)=0; nilpotence alone would not justify that step.
- The exclusion n=1 is required.


**Prerequisites.** `K2SymbolsBrauer:T.6/zmod-four-symbol-detector`, `K2SymbolsBrauer:T.6/local-presentation-completeness`, `K2SymbolsBrauer:T.6/general-relations-calculus`, `K2SymbolsBrauer:T.2/steinberg-symbol`, `K2SymbolsBrauer:T.2/symbol-consequences`, `K2SymbolsBrauer:T.2/k2-finite-field`, `ClassicalArithmeticCompletion:CA.1/unit-group-of-a-power-of-two`.


**Sources.** [WeibelIII] Exercise III.5.13, printed p.46 of the separate chapter; III.5.10–5.11, pp.42–44. The exercise states the dyadic target. The proof above combines its local presentation with explicit unit generators already owned by CA.1; the unit-symbol identities are the existing T.2 input.


## T.7 — Tate’s comparison and Hilbert symbols

The tensor-valued Galois symbol is imported before any primitive root is chosen. All signs below refer to the native root-ratio Kummer cocycle, the native ordered cup product, arithmetic Frobenius, and the product-normalized K₂ comparison.


### The native Kummer cup formula

**Target:** `K2SymbolsBrauer:T.7/native-kummer-cup-comparison`.

For a field F, m≥2 invertible in F and a,b∈Fˣ, the imported map h_{F,m}:K₂(F)/m→H²(F,μ_m^{⊗2}) takes {a,b} to κ_m(a)∪κ_m(b). Here κ_m(a) is the additive class corresponding to TauCeti.kummerMap, whose cocycle is g↦g(α)/α for αᵐ=a. Under M.1’s cup-compatible field comparison, h agrees with explicitCup11 for the canonical tensor pairing into M.1’s weight-two twist.


**Hypotheses.** F is a field and m≥2 is a unit in F. No primitive root is assumed in F for this tensor-valued statement.


**Argument.**

Import M.3/galois-symbol, M.1/finite-tate-twist and the field étale/Galois comparison. The formula and Steinberg descent are owned there, not constructed again.

At the pinned Tau Ceti declarations, kummerMap_eq_kummerCocycleClass identifies the actual Kummer class. explicitCup11 uses the cocycle (g,h)↦κ(a)(g)⊗gκ(b)(h), rather than an abstract bilinear operation with unspecified comparison. The pinned kummerMap_eq_one_iff supplies vanishing on m-th powers; this existing Kummer-kernel fact is imported, not a new target.

Transport that cocycle through the coefficient identification supplied by M.1 and the cup-compatible field comparison. Equality on symbols gives equality of the homomorphisms by T.2’s generator theorem. Coefficient power maps and field restriction are those of M.3/galois-symbol.


**Checks.**

- An m-th power in either slot gives zero.
- The tensor-valued map exists without μ_m⊆F; scalar trivialization requires the extra root choice.
- For m=2 and F=ℝ, {−1,−1} maps to the nonzero quaternion class after contraction.


**Prerequisites.** `MotivicEtaleKTheory:M.3/galois-symbol`, `MotivicEtaleKTheory:M.1/finite-tate-twist`, `MotivicEtaleKTheory:M.1/field-etale-galois-comparison`, `K2SymbolsBrauer:T.2/symbols-generate`, `tauceti:TauCeti.kummerMap_eq_kummerCocycleClass`, `tauceti:TauCeti.ContCohomology.explicitCup11`, `tauceti:TauCeti.kummerMap_eq_one_iff`.


**Sources.** [WeibelIII] Formula (III.6.10.2), p.58, and Proposition III.6.10.3, p.59 of the separate chapter. The Galois symbol is the cup product; M.3 is the existing owner of its construction.


### Primitive-root contraction and the Brauer symbol

**Target:** `K2SymbolsBrauer:T.7/root-brauer-coefficient-adapter`.

Suppose μ_m⊆F and ζ∈F is primitive of order m. The trivialization τ_{ζ,j}:ℤ/m≃μ_m^{⊗j} sends 1 to ζ^{⊗j} for j≥0 and uses the dual basis for j<0. Define the bilinear Galois-equivariant contraction c_ζ:μ_m⊗_{ℤ/m}μ_m→μ_m by c_ζ(ζⁱ⊗ζʲ)=ζ^{ij}. The Brauer symbol β_ζ is h_{F,m}, followed by c_ζ on H² and the Kummer injection H²(F,μ_m)→Br(F)[m]. For u∈(ℤ/m)ˣ, τ_{ζᵘ,j}=τ_{ζ,j}∘(uʲ·), c_{ζᵘ}=u⁻¹c_ζ and β_{ζᵘ}=u⁻¹β_ζ. The scalar trivialization of the weight-two twist alone changes by u⁻²; it is different from the Brauer contraction.


**Hypotheses.** F is a field, m≥2 invertible in F, and ζ∈F is primitive of order m. The Brauer identification with central simple algebras is imported from QuadraticFormInvariants 7B, not defined here.


**Argument.**

Use M.1’s tensor and dual twist modules. Import ClassFieldTheory.kummerCupPairing and its bil_apply formula from current Tau Ceti: its value on ζⁱ,ζʲ is ζ^{ij}. The new rootCupContraction API transports that existing bilinear pairing across M.1’s tensor universal property; it does not reconstruct the coefficient pairing.

The exponent formula is bilinear and equivariant because ζ lies in F. Import ClassFieldTheory.h2MuToBr and h2MuToBr_injective, with their m-torsion image, rather than constructing another Kummer-to-Brauer map. Transport M.1’s coefficient model to this map; QFI 7B supplies its central-simple-algebra interpretation.

Replacing ζ by ζᵘ changes each input exponent by u⁻¹ and the output root by u; the combined factor is u⁻¹. For τ in degree j the factor is uʲ, including inverse powers for dual twists. Naturality is with respect to root-preserving field embeddings.

For m=2 the primitive root is −1 and c_ζ is canonical. The existing quaternion cup comparison fixes this specialization. For m=1 all coefficients and symbols are trivial, separately from the primitive-root formulas.


**API.**

- `rootTwistTrivialization`: The ℤ/m-linear equivalence τ_{ζ,j}, with the tensor basis in nonnegative degree and dual basis in negative degree.
- `rootCupContraction`: The tensor-factorization of the imported kummerCupPairing, with c_ζ(ζⁱ⊗ζʲ)=ζ^{ij}; this is a coefficient-model adapter.
- `brauerSymbol`: The unique additive map β_ζ with value [c_ζ(κ(a)∪κ(b))] on symbols.
- `rootTwistTrivialization_change`: τ_{ζᵘ,j}=τ_{ζ,j}∘(uʲ·) for u a unit modulo m.
- `brauerSymbol_change`: β_{ζᵘ}(x)=u⁻¹β_ζ(x), with the same target Br(F)[m].
- `brauerSymbol_map`: Root-preserving field embeddings carry β_ζ to β_{fζ}; identity and composition follow on symbols.
- `brauerSymbol_quaternion`: For m=2, β_{−1}{a,b} is the quaternion Brauer class supplied by QFI 7B.


**Uses.** T.7/cyclic-algebra-cup-comparison: Identifies the explicit cyclic symbol algebra with the root-dependent Brauer value. T.7/normalized-local-invariant-comparison: Translates the Brauer invariant into a root-independent Hilbert symbol.


**Tests.**

- **computation** (`root_change_five`): For m=5 and ζ′=ζ², β_{ζ′}=3β_ζ, whereas the scalar weight-two coordinate changes by 4.
- **computation** (`root_contraction_two_five`): For m=5, c_ζ(ζ²⊗ζ³)=ζ; multiplying the roots instead gives 1 and fails bilinearity.
- **non-example** (`root_choice_required`): Over ℚ and m=3 the tensor-valued h exists but no primitive-root scalar trivialization over ℚ is available.
- **compatibility** (`root_quaternion`): At m=2, ζ=−1, β{−1,−1} over ℝ is Hamilton’s class and has invariant 1/2.


**Checks.**

- No scalar trivialization is used before choosing ζ in F.
- Root multiplication is not bilinear on the additive root module; the exponent-product formula is essential.


**Prerequisites.** `K2SymbolsBrauer:T.7/native-kummer-cup-comparison`, `MotivicEtaleKTheory:M.1/finite-tate-twist`, `MotivicEtaleKTheory:M.1/etale-kummer-sequences`, `mathlib:IsPrimitiveRoot.zmodEquivZPowers`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#7b-the-comparison-with-h²`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.


**Sources.** [WeibelIII] Proposition III.6.9.2, p.57; Example III.6.10.1, p.58; Remark III.6.10.4, p.59 of the separate chapter. The root choice reads the weight-two symbol in Brauer cohomology; the exponent calculation pins its change of root. [MilneCFT2020] III §4, Steps 1–2, pp.111–112. Kummer roots, cup products and cyclic classes are compared with explicit coefficient conventions.


### The cyclic symbol algebra

**Target:** `K2SymbolsBrauer:T.7/cyclic-symbol-algebra`.

For a field F with m≥2 invertible and ζ primitive of order m in F, and a,b∈Fˣ, let A_ζ(a,b) be the F-algebra generated by X,Y with Xᵐ=a, Yᵐ=b and YX=ζXY. It has basis XⁱYʲ, 0≤i,j<m, dimension m², and is central simple, hence defines a Brauer class. The algebra remains defined when F(a^{1/m}) has degree less than m; the full cyclic extension degree is not a hypothesis.


**Hypotheses.** F is a field; m≥2 is invertible; ζ∈F is primitive; a,b are units.


**Argument.**

Give the vector space with the displayed basis its multiplication by commuting Y-powers past X-powers and reducing exponents with a and b. The factor ζ^{j i′} and the two carry factors make multiplication associative; verify this on basis triples.

Over a separable closure choose αᵐ=a. On a basis e₀,…,e_{m−1}, put Xe_i=αζⁱe_i, Ye_i=e_{i−1} for i>0 and Ye₀=b e_{m−1}. Then Xᵐ=a, Yᵐ=b and YX=ζXY. The distinct diagonal entries give every diagonal idempotent, and the invertible weighted shift supplies all matrix units, so the algebra is Mat_m.

Faithful field extension descends centrality and simplicity. The basis construction gives the universal property and root-preserving scalar-extension isomorphisms.

If a=αᵐ with α∈F, the same weighted-shift construction is defined over F using b itself; no m-th root of b is required. Hence the algebra is already split. The case m=2 has anticommuting generators and recovers the quaternion algebra.


**API.**

- `cyclicSymbolAlgebra`: The algebra with the stated basis, relations and multiplication.
- `cyclicSymbolAlgebra.lift`: A pair of elements in an F-algebra satisfying Xᵐ=a, Yᵐ=b, YX=ζXY induces a unique F-algebra map.
- `cyclicSymbolAlgebra.basis`: The m² monomials XⁱYʲ form an F-basis.
- `cyclicSymbolAlgebra.baseChange`: Root-preserving field embeddings give the canonical scalar-extension algebra isomorphism, with identity and composition laws.
- `cyclicSymbolAlgebra.split`: After adjoining an m-th root of a, the algebra is isomorphic to Mat_m of that field; an m-th root of b is unnecessary.
- `cyclicSymbolAlgebra.quaternion`: For m=2 and ζ=−1 the algebra is the quaternion algebra (a,b).


**Uses.** T.7/cyclic-algebra-cup-comparison: The concrete algebra is compared with β on every symbol, including degree-drop cases. T.7/normalized-local-invariant-comparison: The cubic example tests the sign of the invariant adapter.


**Tests.**

- **degenerate** (`cyclic_split_power`): If a∈F^{×m}, A_ζ(a,b)≅Mat_m(F); treating F(a^{1/m}) as a degree-m field would fail.
- **compatibility** (`cyclic_quaternion`): For m=2, a=b=−1 over ℝ this is Hamilton’s algebra, not a split matrix algebra.
- **non-example** (`cyclic_degree_drop`): For m=4, a=c² with c nonsquare, A_ζ(c²,b)≅Mat₂(A_{ζ²}(c,b)); its dimension is 16, not 4.
- **computation** (`cyclic_cubic_direction`): Over ℚ₇ with m=3 and ζ reducing to 2, A_ζ(3,7) has invariant 1/3 in the arithmetic-Frobenius normalization.


**Checks.**

- The relation is YX=ζXY; changing it to XY=ζYX reverses the Brauer class for m>2.
- The algebra has dimension m² even if the Kummer field has smaller degree.
- Splitting is proved from the displayed matrices; a nonscalar u with uᵐ=1 alone is insufficient without dim_F F[u]=m (the correction to Weibel III.6.9.1).


**Prerequisites.** `K2SymbolsBrauer:T.7/root-brauer-coefficient-adapter`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#7b-the-comparison-with-h²`.


**Sources.** [WeibelIII] Cyclic Algebras III.6.9, p.57, and Remark III.6.10.4, p.59 of the separate chapter. Defines the cyclic symbol algebra and its basis; the weighted-shift argument here checks splitting when only a is an m-th power. [MilneCFT2020] III §4, Step 1, p.111 and Step 2, p.112. Cyclic extensions and the corresponding cup/carry cocycle support the Brauer comparison.


### Cyclic algebras represent the Brauer symbol

**Target:** `K2SymbolsBrauer:T.7/cyclic-algebra-cup-comparison`.

Under the hypotheses of cyclic-symbol-algebra, [A_ζ(a,b)]=β_ζ{a,b} in Br(F)[m]. Import current ClassFieldTheory.h2MuToBr_cup_kummerClass and QFI 7B’s generic crossed-product comparison. The new adapter identifies the displayed symbol algebra, including its proper-degree matrix corner, with those existing cyclic-class and cup maps.


**Hypotheses.** F is a field with μ_m⊆F, m invertible, ζ primitive, and a,b∈Fˣ.


**Argument.**

Choose αᵐ=a, let L=F(α), d=[L:F] dividing m, and e=m/d. Write ζ_d=ζᵉ. The Kummer character has image generated by ζ_d; hence c=αᵈ∈F, a=cᵉ and L=F(c^{1/d}), with generator σ(α)=ζ_dα.

The étale algebra F[X]/(Xᵐ−a) has e factors F[X]/(Xᵈ−ηʲc), η=ζᵈ, each isomorphic to L. Conjugation by Y cycles their primitive idempotents. The corner at the factor Xᵈ=c is generated by X,Yᵉ, satisfies (Yᵉ)ᵈ=b and YᵉX=ζ_dXYᵉ, and is the cyclic crossed product (L/F,σ,b). The orbit gives A_ζ(a,b)≅Mat_e((L/F,σ,b)). For d=1 this is split.

Import current ClassFieldTheory.h2MuToBr_cup_kummerClass with its inputs reversed, namely (b,a), the root α and generator σ. Its hypotheses allow any d dividing m and σ(α)=ζ^{m/d}α. It identifies β_ζ{b,a} with minus the inflation of cyclicClass(σ,b). This theorem is already proved for arbitrary fields, not only local fields.

Use the imported symmetry of kummerCupPairing and graded skew-symmetry of the degree-(1,1) cup to obtain β_ζ{a,b}=infl(cyclicClass(σ,b)). No new Kummer/carry-cocycle comparison is planned. In carry coordinates the class is B(g,h)=b^{floor((p(g)+p(h))/d)}, where g(α)/α=ζ_d^{p(g)}; this pins the orientation for the algebra comparison.

QFI’s existing brauerCohomologyEquiv_crossedProductClass identifies that cyclic carry class with the corner (L/F,σ,b). Transport through its existing cohomology and Brauer equivalences, then use the matrix decomposition. For d=1 the imported cyclic class and cup are zero and the algebra is split. The same argument therefore covers every degree-drop case.


**Checks.**

- Check the map-level equality on each {a,b}, not an abstract isomorphism of groups.
- For m=4 and a=c², the proof reduces to the quadratic corner and does not assume degree four.
- At m=2 this agrees with brauerCohomologyEquiv_quaternionClass already implemented in current Tau Ceti.


**Prerequisites.** `K2SymbolsBrauer:T.7/cyclic-symbol-algebra`, `K2SymbolsBrauer:T.7/native-kummer-cup-comparison`, `K2SymbolsBrauer:T.7/root-brauer-coefficient-adapter`, `tauceti:TauCeti.ContCohomology.explicitCup11_eq_neg_flip`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#7b-the-comparison-with-h²`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.


**Sources.** [MilneCFT2020] III §4, Step 1 and Step 2, pp.111–112. The Kummer cup, character and cyclic carry cocycle motivate this explicit comparison. [WeibelIII] Remark III.6.10.4, p.59 of the separate chapter. States the cyclic-algebra interpretation; the matrix corner and the imported ordered Kummer/cyclic comparison specify the algebra and its sign.


### The Hilbert symbol and the normalized local invariant

**Target:** `K2SymbolsBrauer:T.7/normalized-local-invariant-comparison`.

Let F be a nonarchimedean local field, m≥2 invertible in F and μ_m⊆F. Write H_m(a,b)=Art_F(a)(b^{1/m})/b^{1/m} for the symbol owned by ClassicalArithmeticCompletion CA.1, with arithmetic Frobenius. If e_m:(ℚ/ℤ)[m]≃ℤ/m takes [k/m] to k, then H_m(a,b)=ζ^{−e_m(inv_F(β_ζ{a,b}))}. Equivalently the positive invariant coordinate computes H_m(b,a). The local cohomological symbol of ClassFieldTheory Layer 5 is the positive coordinate when its trace is the normalized Brauer-invariant map.


**Hypotheses.** F is a nonarchimedean local field; m is invertible in F, possibly divisible by the residue characteristic when char F=0. ζ is primitive of order m in F; local reciprocity uses arithmetic Frobenius.


**Argument.**

Import CA.1’s local norm-residue symbol, its skew-symmetry and its norm criterion. These are not reconstructed in T.7.

Milne III Proposition 3.6 identifies χ(Art_F(b)) with inv_F(b∪δχ), for the normalized invariant. Step 2 of §4 compares the Kummer cup of a,b to this class for χ determined by a, so inv_F(β_ζ{a,b})=χ_a(Art_F(b)).

The right side exponentiates to H_m(b,a). Apply the imported skew-symmetry to obtain the minus in the displayed formula for H_m(a,b). Native Kummer classes use gα/α and native explicitCup11 uses the order (a,b); neither introduces a further reversal.

ClassFieldTheory’s kummerCupPairing ζ is exactly the exponent contraction c_ζ. Its normalized h2MuEquivZMod is characterized by toRatAddCircle(value)=inv(h2MuToBr(class)); thus it is e_m of the invariant. An arbitrary additive equivalence H²→ℤ/m does not fix the normalization.

For ℚ₇,m=3,ζ reducing to 2, take α³=3. Its reduction generates the unramified cubic and arithmetic Frobenius acts by α↦α⁷, so α⁷/α=α⁶=9≡2. Hence inv β{3,7}=1/3, H_3(7,3)=ζ and H_3(3,7)=ζ⁻¹. This detects the sign hidden at m=2.

At a real place m=2, use inv of Hamilton’s algebra equal to 1/2; both negative entries give −1. At a complex place both groups are trivial. Root replacement ζ↦ζᵘ changes the exponent by u⁻¹ and cancels in the value of H_m.


**Checks.**

- e_m is a coordinate isomorphism on m-torsion; multiplication by m inside ℚ/ℤ is zero and cannot be used for it.
- The cubic test fixes the exact sign; norm-kernel equality by itself permits many unit scalars.
- At m=2 the statement agrees with current QFI hilbertSymbol_eq_cohomological.


**Prerequisites.** `K2SymbolsBrauer:T.7/cyclic-algebra-cup-comparison`, `ClassicalArithmeticCompletion:CA.1/local-norm-residue-symbol`, `ClassicalArithmeticCompletion:CA.1/archimedean-norm-residue-symbol`, `ClassicalArithmeticCompletion:CA.1/norm-residue-symbol-steinberg-and-skew-symmetry`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6e-the-two-hasse-invariants-agree-and-both-are-the-invariant-map`.


**Sources.** [MilneCFT2020] III Proposition 3.6, p.109; III §4 Step 2, p.112, Steps 3–4 and Remark 4.5, pp.112–114. Connects the Artin character, ordered Kummer cup and invariant; swapping the slots yields the required negative exponent.


### Global reciprocity in Brauer-symbol coordinates

**Target:** `K2SymbolsBrauer:T.7/global-brauer-reciprocity-adapter`.

Let F be a number field with μ_m⊆F and m≥2. For a,b∈Fˣ, all but finitely many local β_ζ{a,b} have invariant zero, and Σ_v inv_v β_ζ{a,b}=0. Under normalized-local-invariant-comparison this is the already owned higher Hilbert product law ∏_v H_{m,v}(a,b)=1. Every place is included: those over m, dyadic places and archimedean places.


**Hypotheses.** F is a number field containing the primitive root ζ of order m. For m>2 such an F has no real places; for m=2 they remain in the formula.


**Argument.**

Import the global Brauer sequence and finite support from ClassFieldTheory Layer 10, and the degree-m Hilbert product law from CA.1. T.7 transports these existing maps rather than reproving higher reciprocity.

Restriction of β to each completion follows from the native cup and root contraction. At nonarchimedean places substitute the negative invariant exponent; at real and complex places use the already specified values.

The sum of the torsion invariants is zero in ℚ/ℤ. The common coordinate e_m sends this finite sum to zero in ℤ/m, and exponentiation by ζ turns it into the product formula. Naturality shows the product is independent of the chosen root.

ClassFieldTheory Layer 14 supplies only the quadratic reciprocity specialization and is not used as an all-m supplier.


**Checks.**

- For m=2 and a=b=−1 over ℚ the nontrivial local factors occur at 2 and ∞ and multiply to one; omitting either place fails.
- No product over only unramified finite places is substituted.
- The theorem is an adapter to CA.1/hilbert-product-formula-of-degree-n, not a second reciprocity engine.


**Prerequisites.** `K2SymbolsBrauer:T.7/normalized-local-invariant-comparison`, `ClassicalArithmeticCompletion:CA.1/norm-residue-symbol-at-a-place`, `ClassicalArithmeticCompletion:CA.1/hilbert-product-formula-of-degree-n`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`.


**Sources.** [MilneCFT2020] V Example 5.4, p.179; VII Theorem 8.1(b), p.221. The first gives the all-place Hilbert product formula from global Artin reciprocity; the second states the sum of Brauer invariants. Their constructions remain imports from CA.1 and ClassFieldTheory Layer 10.


### Tate comparisons through the actual localization maps

**Target:** `K2SymbolsBrauer:T.7/arithmetic-tate-localization-adapters`.

The T.7 comparison is the map imported from M.3: for a local field F, a prime ℓ≠char F and r≥1, h_{F,ℓʳ} is an isomorphism; for a number field F it is an isomorphism for every prime ℓ and r≥1, including ℓ=2 with real places. For O=O_{F,S}, S finite containing all archimedean places and primes above ℓ, the imported h_O gives K₂(O)⊗ℤ_ℓ≅H²_cont(O,ℤ_ℓ(2)) and K₂(O)/ℓʳ≅H²_et(O,μ_{ℓʳ}^{⊗2}). These commute with the maps to the fraction field, enlargement of S and the actual localization residue maps. This is a transport and compatibility target; M.3 owns the arithmetic proofs.


**Hypotheses.** Local and number-field hypotheses are kept separate. No global-function-field theorem is imported from a number-field-only supplier. S contains all places above ℓ; no assertion is made with noninvertible coefficients on O.


**Argument.**

Cite M.3/tate-local, /tate-global and /tate-s-integer directly. Combine their generator normalization with native-kummer-cup-comparison; no new norm-residue map is defined.

Use M.1/s-integer-galois-comparison with G_{F,S}, not G_F. The generic-point map is induced by G_F→G_{F,S}; its compatibility with residues is part of the imported theorem.

For the finite localization diagram use M.1/localization-gysin-sequence and M.3/symbol-residue-compatibility. With T.3’s convention ∂{u,π}=ū, the cohomological cup residue has the opposite sign: ∂h=−κ∂^{tame}. This sign is transported into the commuting diagram.

Do not infer the ring isomorphism by injecting finite H²(O) into H²(F). The Kummer row has kernel Pic(O)/ℓʳ, after a permissible coefficient trivialization, and M.2/degree-two-localization-diagram records it. M.3’s separate coefficient-sequence argument, including the real-place two-adic transition maps, supplies the finite S-integer theorem.


**Checks.**

- For ℚ, S={2,∞}, K₂(ℤ[1/2])/2≅ℤ/2, represented by {−1,−1}, matching the finite étale group.
- An ideal-class contribution Pic(O)/ℓʳ is not discarded when passing to the fraction field.
- An arbitrary scheme’s étale cohomology is not identified with its function-field Galois cohomology.


**Prerequisites.** `K2SymbolsBrauer:T.7/native-kummer-cup-comparison`, `MotivicEtaleKTheory:M.3/tate-local`, `MotivicEtaleKTheory:M.3/tate-global`, `MotivicEtaleKTheory:M.3/tate-s-integer`, `MotivicEtaleKTheory:M.3/symbol-residue-compatibility`, `MotivicEtaleKTheory:M.1/s-integer-galois-comparison`, `MotivicEtaleKTheory:M.1/localization-gysin-sequence`, `MotivicEtaleKTheory:M.2/degree-two-localization-diagram`.


**Sources.** [WeibelIII] III.6.10, pp.58–59 of the separate chapter. Motivates the arithmetic specialization; the detailed local, global and ring theorem sources are the imported M.3 nodes, not new claims from this chapter.


### The product-normalized étale Chern comparison

**Target:** `K2SymbolsBrauer:T.7/normalized-etale-chern-comparison`.

For a field F, m≥2 invertible in F and x∈K₂^cl(F), let θ₂ be T.1’s Hurewicz comparison and θ₂♮=θ₂∘(ε·) its product normalization from T.2/graded-map-degree-two-identification, with ε∈{±1}. Then c_{2,2}(red_m(θ₂♮x))=−h_{F,m}(x mod m) in H²_et(F,μ_m^{⊗2}), read through M.1’s field comparison. For the raw Hurewicz map, the scalar is −ε. Here c_{2,2}:K₂(F;ℤ/m)→H²_et(F,μ_m^{⊗2}) is the already constructed M.8 finite étale Chern map.


**Hypotheses.** F is a field and m is invertible in F; m≥2. Use the exact product comparison and retained torus sign from T.2, not an assumed sign-free identification. Only the integral-reduction image in finite-coefficient K₂ is asserted; K₁(F)[m] can contribute an additional Bockstein quotient.


**Argument.**

Import c_{2,2} from M.8/finite-etale-chern and c_{1,1}=κ from its normalization. T.2’s product theorem identifies θ₂♮{a,b} with θ₁(a)·θ₁(b).

Soulé Proposition 2.2.2.3, pp.42–44, applies to integral K₁ inputs. Its hypothesis (M) is automatic for the degree-(2,2) term: 2i−k=2j−k′=1 and k+k′=2 force i=j=k=k′=1 among nonnegative cohomological degrees. Its factorial coefficient is −1, giving −c_{1,1}(a)∪c_{1,1}(b). The proof’s suspension and diagonal calculation fixes the sign.

Reduce this integral product modulo m and apply the imported natural coefficient map. This uses integral inputs before reduction; it does not require a finite-coefficient product for m=2 or 4, where the separate coefficient-product construction has extra hypotheses.

For prime powers this gives the equality on every {a,b}; additivity and the classical symbol generation extend it to x. For composite m use the coefficient Chinese remainder decomposition and the same natural maps. The case m=1 is zero.

Finally θ₂♮=θ₂∘(ε·) implies the raw-Hurewicz formula −εh. The exact coefficient sequence K₂(F)/m→K₂(F;ℤ/m)→K₁(F)[m] prevents extending the statement to all finite-coefficient K₂ by choosing an unspecified lift.


**Checks.**

- For ℚ₇,m=3, the {3,7} example has positive cup invariant 1/3 and product-normalized Chern invariant −1/3; m=2 would not distinguish them.
- Changing θ₂ to its opposite changes ε, not the intrinsic product-normalized statement.
- The equality is of maps after integral reduction, not an identification of the whole finite-coefficient K₂ with K₂/m.


**Prerequisites.** `K2SymbolsBrauer:T.7/native-kummer-cup-comparison`, `MotivicEtaleKTheory:M.8/finite-etale-chern`, `MotivicEtaleKTheory:M.1/field-etale-galois-comparison`, `K2SymbolsBrauer:T.2/graded-map-degree-two-identification`, `K2SymbolsBrauer:T.2/unit-loop-product-symbol`, `K2SymbolsBrauer:T.1/chosen-k2-comparisons`.


**Sources.** [SouleThesis1978] Proposition 2.2.2.3 and proof, printed pp.42–44. The product formula and its suspension computation give coefficient −1 for two integral K₁ inputs.


## Representative Lean signatures

The suggested file uses the namespace `TauCetiRoadmap.K2SymbolsBrauer`, with subnamespaces `T6` and `T7`. Its three light definitions have real bodies: `T6.IsThreefoldStable` is the simultaneous-unit predicate; `T6.zmodFourSymbolParity` is the finite detector table; `T7.rootCupCoordinate` multiplies exponent coordinates. Two proved examples per definition test respectively 𝔽₅ versus 𝔽₃, the nonzero and zero/admissibility entries of the detector, and exponent contraction together with the inverse first-power root-change factor.

The remaining nine declarations are theorem targets, with these exact names and meanings:

| Declaration | Statement represented |
| --- | --- |
| `T6.threefoldStable_product_five` | The nonlocal product 𝔽₅×𝔽₅ satisfies threefold stability. |
| `T6.not_threefoldStable_four` | The local ring ℤ/4 fails threefold stability. |
| `T6.modernWord_matrix` | The four elementary matrices in the modern Dennis–Stein word multiply to diag(1−rs,(1−rs)⁻¹). |
| `T6.dennisStein_second_relation_unit` | The two D2 unit hypotheses imply admissibility of its combined argument. |
| `T6.zmodFourSymbolParity_relations` | The detector respects D1–D3 on their exact admissible domains. |
| `T6.squareZero_unit` | If x²=0, then (1−rx)(1+rx)=1. |
| `T6.relative_guard_test` | On the native iterated dual-number carrier over 𝔽₃, x,y,x+y lie outside (xy), while the relevant products lie in that square-zero ideal. The differential defect is computed in the guarded-relative target above. |
| `T7.rootCupCoordinate_change` | Two inverse input-coordinate changes and one output-coordinate change give the inverse first power. |
| `T7.kummerCup_power` | The actual native continuous cup of Kummer classes vanishes when either input is an m-th power, for any continuous equivariant bilinear coefficient pairing. |

The full stable/relative K₂, tensor-twist, cyclic-algebra and Chern targets remain specified above. Their absent pinned carriers are not introduced as admitted data definitions. The theorem targets retain `sorry` and every implementation status remains `unchecked`.

## Exact remaining proof inputs

The target-level pass is complete; these are mathematical proof inputs still needed for gap-free closure, not claims that the results are false.


### G1 — All-local presentation for nonfields with residue 𝔽₂ or 𝔽₃

Supply the proof that the D1–D3 generator map is injective and onto for nonfield local rings with residue size two or three. The 1975 announcement §2.4 and Weibel III.5.11.1(a) state it, while van der Kallen 1977 proves the threefold-stable case. Maazen–Stienstra, A presentation for K₂ of split radical pairs, J. Pure Appl. Algebra 10 (1977), 271–294, DOI 10.1016/0022-4049(77)90007-X, is a source to obtain; its publisher denied access, and no author proof copy was located. Field cases remain imported, not newly closed here.

Consumed by `K2SymbolsBrauer:T.6/local-presentation-completeness`, `K2SymbolsBrauer:T.6/zmod-four-symbol-detector`, `K2SymbolsBrauer:T.6/dyadic-nilpotent-computation`.


### G2 — Keune–Loday degree-two relative comparison, including the K₃ boundary

Construct and prove the natural isomorphism from the stated classical relative Steinberg kernel to π₂ fib(K(A)→K(A/I)), and identify all maps beginning at K₃(A)→K₃(A/I). U.5 supplies degree one and the later exact-sequence comparison only. Loday, Cohomologie et groupe de Steinberg relatifs, J. Algebra 54 (1978), 178–202, DOI 10.1016/0021-8693(78)90025-X, and Keune, The relativization of K₂, J. Algebra 54 (1978), 159–177, DOI 10.1016/0021-8693(78)90024-8, could not be read: publisher access failed. Levine §2.1 is a statement, not a proof.

Consumed by `K2SymbolsBrauer:T.6/relative-homotopy-fibre-comparison`, `K2SymbolsBrauer:T.6/dual-number-differential-isom`.


### G3 — Keune’s guarded radical-relative presentation

Read and decompose Keune 1978 Theorem 15, proving full relative generation and kernel with I⊆Jac(A) and the input guard in D3. Levine §2.1 p.290 states the exact result. The 1975 split-pair announcement is insufficient for nonsplit pairs; the 1973 older relative-kernel convention is not substituted for this group. Keune’s publisher PDF was inaccessible and no author copy was found. The differential and square-zero proofs are fully given conditional on this presentation.

Consumed by `K2SymbolsBrauer:T.6/guarded-relative-presentation`, `K2SymbolsBrauer:T.6/relative-differential`, `K2SymbolsBrauer:T.6/square-zero-differential-kernel`, `K2SymbolsBrauer:T.6/dual-number-differential-isom`.


## Source findings

In the separately paginated author Chapter III PDF specified below, the warning after III.5.11 on printed p.44 adds an inverse to the old-to-modern symbol conversion. Literal substitution in the two Steinberg words gives D(r,s)=P(−r,s), and the tame residue of D(2,(1−t)/2) over ℚ(t) is 2 rather than 1/2. This finding is scoped to that author chapter and its recorded SHA-256, without making a claim about the bound published edition. Morrow Remark 3.10 uses the corrected parameter change. The author’s K-book page and its errata link were checked on 19 October 2026; the linked errata PDF returned 404. This is recorded as `K2SymbolsBrauer/E-T6-old-symbol-inverse` in the packet.

The same author chapter’s Lemma III.6.9.1, printed p.57, claims splitting from a nonscalar u with uⁿ=1. Its proof needs the stronger hypothesis dim_F F[u]=n, or minimal polynomial Tⁿ−1, to obtain n nonzero orthogonal idempotents. For a counterexample to the printed claim, take F=ℂ(s,t), the quaternion division algebra D=(s,t)_F, A=Mat₂(D), n=4 and u=diag(1,−1). Then u⁴=1 and u is nonscalar, but A is not Mat₄(F). Division of D can be checked over ℂ(s)((t)): reduce a hypothetical primitive integral zero of a²−sb²−tc²+std² modulo t; the nonsquare s forces a,b to be divisible by t. Dividing by t and reducing again forces c,d to be divisible by t, a contradiction. Adding the minimal-polynomial hypothesis repairs the idempotent argument. The cyclic-algebra target above uses its explicit matrices, and its Brauer comparison imports the existing Kummer/cyclic theorem, so neither depends on the false criterion. This is `K2SymbolsBrauer/E-T6-cyclic-splitting-minimal-polynomial`, independently confirmed during this review and scoped to the same hashed chapter. No correction was located on the checked author page or targeted author-site searches; its linked errata PDF returned 404. No novelty claim is made.

## Planets

T.6: Dennis–Stein symbols; Dennis–Stein presentation; Relative Steinberg groups; Relative Dennis–Stein presentation; Relative differential symbols; K₂ of dual numbers.

T.7: Brauer-valued symbols; Cyclic symbol algebras; Hilbert symbols and local invariants; Brauer-symbol reciprocity; Tate comparison adapters; Étale Chern comparison.

These six choices per layer replace the earlier selections at assembly. The threefold-stability predicate, finite detector and proof refinements remain targets without adding atlas planets.

## Source register

All results and proof descriptions above are written in our own words. The following source files were read on 19 October 2026; SHA-256 values and read sections are recorded in the packet. Printed page numbers belong to the editions identified here. In particular, the separate Weibel chapter’s page numbers are not the bound book’s page numbers.


- **WeibelIII**: Charles A. Weibel, [The K-book, separate Chapter III: K₁ and K₂ of a ring](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf). Author’s separately paginated chapter PDF; printed page numbers here are its own pp.1–72, not those of the bound book. Read: III.5.7; III.5.10–5.11.1; Exercises III.5.13–5.14; III.6.9–6.10.


- **SteinDennis1973**: Michael R. Stein and R. Keith Dennis, [K₂ of radical ideals and semi-local rings revisited](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/SLN342.pdf). Lecture Notes in Mathematics 342 (1973), article pp.281–303; SHA covers the complete proceedings PDF. Read: Proposition 1.1 and proof, printed pp.283–285; relative generation discussion, pp.287–288.


- **Kallen1977**: Wilberd van der Kallen, [The K₂ of rings with many units](https://www.numdam.org/item/ASENS_1977_4_10_4_473_0.pdf). Annales scientifiques de l’École Normale Supérieure, series 4, 10 (1977), 473–515. Read: §§5.2–5.19, pp.488–495; §§6.1–6.23, pp.496–506; §§7.1–7.4, pp.507–508.


- **KallenMaazenStienstra1975**: Wilberd van der Kallen, Hendrik Maazen and Jan Stienstra, [A presentation for some K₂(n,R)](https://webspace.science.uu.nl/~kalle101/maazenStK.pdf). Bulletin of the American Mathematical Society 81 (1975), 934–936; announcement. Read: §§2.3–2.6, pp.935–936.


- **KallenDual1971**: Wilberd van der Kallen, [Le K₂ des nombres duaux](https://webspace.science.uu.nl/~kalle101/K2nd1971.pdf). Comptes rendus de l’Académie des sciences de Paris, série A, 273 (1971), 1204–1207. Read: Theorems and proofs, pp.1204–1207.


- **MorrowLocalisations**: Matthew Morrow, [K₂ of localisations of local rings](https://www.imo.universite-paris-saclay.fr/~matthew.morrow/Morrow%2C%20M.%2C%20K_2%20of%20localisations%20of%20local%20rings.pdf). Author PDF, 16 pages; used for explicit convention translation, not as the proof of the all-local presentation. Read: §§3.2–3.3, pp.7–8; Remarks 3.8 and 3.10, Theorem 3.9.


- **Levine1989**: Marc Levine, [The indecomposable K₃ of fields](https://www.numdam.org/item/10.24033/asens.1585.pdf). Annales scientifiques de l’École Normale Supérieure, series 4, 22 (1989), 255–344. Read: §2.1, pp.289–290.


- **MilneCFT2020**: James S. Milne, [Class Field Theory](https://www.jmilne.org/math/CourseNotes/CFT.pdf?download=1). Version 4.03, 6 August 2020. Read: III Proposition 3.6, p.109; III §4 Steps 1–4 and Remark 4.5, pp.111–114; V Example 5.4, p.179; VII Theorem 8.1(b), p.221.


- **SouleThesis1978**: Christophe Soulé, [K-théorie des anneaux d’entiers de corps de nombres et cohomologie étale](https://www.ihes.fr/~soule/documents/These_Christophe_Soule.pdf). June 1978 doctoral thesis, author scan; printed page numbers. Read: Proposition 2.2.2.3 and proof, pp.42–44.
