# PAPER-CADORET-HUI-TAMAGAWA-17 — geometric monodromy

Codex — codex-c83e7a, continuing codex-a71f92's [PR1937](https://github.com/CBirkbeck/tauceti-explorer/pull/1937). Refs #1157. Status: **partial**, not formalised.

The continuation preserves all119 existing interfaces and adds23 proof interfaces for the two external bottlenecks in Theorem7.3. The inventory now has **142 items:7 library,8 planned,127 missing**, with every missing item routed exactly once. All41 definitions/constructions have82 named API statements, explicit uses and123 proposed mathematical acceptance cases. These are planning interfaces, not executed Lean declarations.

All32 pages of the official CHT paper were reread. Larsen2010 was read in full, and the relevant Cadoret–Tamagawa author-version tensor lemma was read directly. The linear-algebra part of the tensor-stabilizer reduction and the entire structure of Larsen's argument are now explicit. Their recursive geometric and group-theoretic inputs remain G1/G5; this checkpoint does not claim source closure merely because every item has a route.

## Source and version record

CHT: [official Annals PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n1-p05-p.pdf), DOI10.4007/annals.2017.186.1.5, published pp.205–236. SHA256 `3aa67f6881cd54cdb5384eada8dc3ec9eff051d6ccb43de76d28100297b298d5`. Acquired and all pages read2026-09-22.

Larsen: [Exponential generation and largeness for compact p-adic Lie groups](https://msp.org/ant/2010/4-8/ant-v4-n8-p02-s.pdf), ANT4(2010),1029–1038. SHA256 `a14bc3effc7007f972cb2b6f1cd2de14824ac7965b4b7b95088207ae9fa89284`. The full mathematical article and references were read2026-09-22, including the Hilbert-family and finite-point-count portions absent from the prior reading. Reading it is distinct from closing its Nori, Borel, EGA, Serre and Kneser references.

Cadoret–Tamagawa: [author manuscript TI.pdf](https://webusers.imj-prg.fr/~anna.cadoret/TI.pdf), *Genus of abstract modular curves with level-ℓ structures*. SHA256 `c11e6e28cbc3f1e7c1a0dc4f75bfcff54257a327f9bcfe4605e76970519cd704`. Read pp.10–12, especially **Lemma4.2.1.1 on p.11**. CHT cites this result as CT16 Lemma4.1. That is a version-specific locator, not a bibliographic error. This29-page author copy is not the published37-page2019 article, and the continuation does not claim to have read all of either version. The author publication list links this exact file.

The earlier worker's selected comparison with [GSS.pdf](https://webusers.imj-prg.fr/~anna.cadoret/GSS.pdf), SHA256 `bd7bd8204d7d3a02df8ca15da194f122766aab61c88103948aa75ee55f67baaf`, is retained with that attribution; it was not repeated. E1–E4 are unchanged and unreviewed.

## Exact endpoint boundaries

Let X be connected smooth separated over algebraically closed k of characteristic p≥0, and f:Y→X smooth proper. For ℓ≠p write H∞=H*(Yx,Zℓ), H=H*(Yx,Fℓ), π=π₁(X,x); π₀ is the arithmetic group of a finitely generated model. All large-prime bounds depend on this fixed family; bounded tensor results additionally depend on fixed degrees.

Theorem 1.1 proves **geometric** semisimplicity on H for every sufficiently large ℓ. Theorem 1.3 proves invariant reduction for bounded mixed Schur tensors and, separately, for every **π₀-stable** free quotient and saturated submodule. Merely π-stable subquotients are not in that assertion.

After one connected finite étale cover independent of ℓ, Theorem 1.2/Corollary 8.2 identifies this with an **almost-hyperspecial** geometric image. The inverse image under the simply connected cover is hyperspecial; the original image is not asserted to equal a hyperspecial group.

Corollary 11.1 is conditional arithmetic mathematics over a finitely generated field of positive characteristic. It assumes rational semisimplicity in degree 2w and rational Tate fullness in **both** codimensions w and d−w. It does not turn Theorem 1.1 into unconditional arithmetic Frobenius semisimplicity. The exact source-wide ℓ quantifier and finite-extension stability of the Milne–Ramachandran input remain G7.

## Ownership and routes

| Route | Interfaces | New responsibility and imported boundary |
|---|---:|---|
| ArithmeticGaloisRepresentationsGeometricMonodromy, Part II of ArithmeticGaloisRepresentations | 39 | Fixed-cover reduction, uniform images, full invariant theorem, both geometric proofs, conditional arithmetic application; import representation carriers and ordinary cohomology. |
| ReductiveGroupsMonodromyModels, Part II of upstream ReductiveGroups | 59 | Nori envelopes, tensor stabilizers, integral models, finite-factor comparisons and Lie-defect criterion; import RG2 buildings/parahorics and existing field-level groups. |
| SchurWeylIntegralFunctors, Part II of upstream SchurWeyl | 6 | Integral/mod-ℓ functors and determinant splittings; preserve built rational symmetrizers and characteristic-zero Weyl modules. |
| DeligneWeightsUniformIntegralMonodromy, Part II of DeligneWeightsAndPurity | 13 | Gabber–Suh uniform freeness, rational/mod-ℓ annihilators and the curve Inv proof; import rational weights, duality and alterations. |
| ArithmeticGaloisDuality:R02.1–2, source | 7 | Compact H¹ exactness/rationalization, extension classes, prime-to-index descent; no private cohomology carrier. |
| SchemeAndStackFoundations:SF.2, source | 3 | Lisse/fundamental-group comparison, arithmetic action and fibre-power Künneth on shared scheme-cohomology infrastructure. |
| EtaleDualityAndPerverseSheaves:EDC.2, source | 1 planned | Finite étale compact-support trace normalization and regression E1. |

The four proposed Part II IDs remain absent from the fresh atlas; the JSON gives detailed design briefs, imports, suggested Lean files and tests. Generic compatible-system operations remain with their existing owners. Classical analytic/adic cohomology is not a replacement for scheme cohomology here. Upstream CFSGStatement L3 explicitly constructs finite Lie-type candidate carriers without proving finiteness or simplicity; it cannot silently discharge the Tits/Steinberg/Lang input of Lemma 8.1.

These roadmaps interact at **stage** level, not by a circular import of their final theorems. In particular, geometric characteristic-zero semisimplicity and uniform covers come first; the curve quotient theorem then precedes the determinant reduction and saturated-submodule theorem. Only afterwards do the two mod-ℓ semisimplicity proofs consume Theorem 1.3.

## Library evidence

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Atlas/audit snapshot: `7b65e518c872fabd61ed788df956668e2f67211d`.

The seven credited interfaces were read in the actual pinned files:

- `TauCeti.YoungTableau.youngSymmetrizer_sq` and `isIdempotentElem_smul_youngSymmetrizer`: rational normalization only, from Symmetric/Specht/Ideal/Idempotent.lean.
- `continuousCohomology`: the TopRep homogeneous-cochain homology object, not compact exactness.
- `LinearMap.charpoly_baseChange`: finite-free endomorphisms over arbitrary commutative base change.
- `TauCeti.semisimpleCommHopfAlgProperty`, its iff theorem and `reductiveAffineGroupSchemeProperty`: field-level predicates, not smooth integral models.
- `TauCeti.semisimpleCommHopfAlgProperty.reductive`: field-level structural implication.
- `exteriorPower.presentation` and `exteriorPower.map`: module-level exterior powers and functorial maps.
- `TauCeti.ContCohomology.explicitCor1_comp_res1`: continuous explicit H¹ corestriction–restriction for open finite-index subgroups; comparison to canonical compact cohomology is not supplied by this credit.

The pinned ClassicalGroups/WeylModule.lean explicitly requires a Q-algebra and only constructs a Schur functor's value at a standard module. Its name is not evidence for an integral functor on arbitrary Zℓ-lattices. The source was read and used to narrow the proposed extension.

Reviewed audits read: AUDIT-01 SF.2; AUDIT-02 R02.1–2; AUDIT-18 DWP.0/7/8, EDC.0/2 and L5; AUDIT-19 WC.3; AUDIT-31 R01.1–6. DWP.5's existing layer supplies pure/mixed lisse definitions. ReductiveGroupsPartII and upstream SchurWeyl had no dedicated reviewed-audit entries; actual library statements and relevant layer descriptions were inspected instead. Searches covered both complete pinned trees, atlas roadmaps, new roadmaps, packets, decompositions and reserved IDs. “Missing” here is a scoped result of that evidence, not a claim about future libraries.

## Proof spine and fragile interfaces

1. **Weights to invariants.** Gabber–Suh gives H∞ free and reduction compatible in every degree. The H¹ ℓ-torsion obstruction is annihilated by a fibre polynomial of weight w and another polynomial of weights≥w+1. Lemma 5.1 compares torsion with reduction; Lemma 5.2 supplies a uniform compact-support annihilator over Qℓ and Fℓ; Lemma 5.3 uses the curve Leray edge and duality. A rational Bézout identity/resultant excludes finitely many primes and kills the obstruction.
2. **Free quotients and saturated submodules.** On an affine curve, cdℓ≤1 gives H¹ quotient surjectivity. The same annihilator works for every arithmetic quotient. For saturated M, geometric determinant triviality plus M≅(Λ^(m−1)M)∨⊗det(M) reduces to a free quotient of a dual fibre-power cohomology module. The determinant is geometrically trivial, not necessarily arithmetically trivial. Rank zero is separate; the finitely many ranks/degrees allow one bound.
3. **Nori and maximality.** T≤d has s,t≤d separately, hence the polynomial degree bound is 2d(r−1). Nori's plus theorem and CT16 Lemma 4.1's uniform **pointwise** tensor-stabilizer theorem are different inputs. Invariants imply Gs⊂Nℓ; Larsen's dimension bound and flatness give scheme equality. Bounded index plus ℓ-generation gives Π∞=𝒢(Zℓ)+. Composition-factor bounds and the simply connected hyperspecial model give Corollary 8.2.
4. **Lie proof.** A nice torus must extend as a closed integral immersion. The defect uses invariants under the **identity component** of the special fibre. Δ on the dual Lie exterior powers detects the reductive centre and the unipotent radical through the exterior-adjoint Poincaré polynomial. Arithmetic-stable free tensor quotients Λ^n𝔤∨ use Theorem 1.3(1), not its submodule clause. The arithmetic compatible-Frobenius argument supplies the nice torus.
5. **Cohomological proof.** A split determinant inclusion gives an equivariant retraction via wedge/Hom, without division by its dimension. Fibre powers reduce to splitting invariant vectors. The invariant lattice A∞ and free quotient B∞ reduce exactly. Their extension class is rationally zero; Inv for the **saturated arithmetic-stable** Hom lattice A∞⊗B∞∨ makes H¹ inject into rational cohomology. This uses Theorem 1.3(2), independently of the Lie-defect branch.

The extended item-level dependency graph retains this order (142 nodes,177 internal edges). No spectral-sequence convergence, cohomological finiteness or positive-characteristic complete reducibility is smuggled into a carrier definition.

### Total-cohomology dévissage supplied here

Theorem 4.5 is stated for H*, while §§5.2–5.3 work with H^w. Here is the explicit bridge (item116).

Choose a rational-point Frobenius after a finite constant-field extension. For each degree w its common rational polynomial P_w has roots of weight w. Different degrees have disjoint root sets. Exclude denominators and the finitely many nonzero pairwise resultants. Over Zℓ[T], the ideals (P_w) are then pairwise comaximal, and the Chinese remainder theorem provides e_w congruent to 1 modulo P_w and 0 modulo each P_v, v≠w. Cayley–Hamilton gives e_w(F) equal to the canonical degree-w projector on H∞.

An arithmetic-stable submodule is F-stable, hence stable under all e_w(F); so is its quotient. The projectors therefore decompose it into degreewise submodules/quotients. Each factor is free or saturated when the original module is. This is uniform in the chosen subquotient because the excluded primes depend only on the finite list P_w. The resulting operators commute with π₀ because they are the canonical grading projections on H∞, **not** because Frobenius is central. This fills a planning step; it is not asserted as a source error.

## Tensor-stabilizer proof: what is now explicit

Items120–127 separate the argument used by58. Let r be fixed. Write
T^f(V)=⊕_(s,t)(V^⊗s⊗(V∨)^⊗t)^⊕f(s,t), where f has finite support.

1. **A family is needed for uniformity.** The nilpotent matrix scheme is defined by N^r=0 over Z[1/(r−1)!]. CT16 uses a selected r²-tuple and two ordered passes of its exponentials, with2r² scalar parameters. Larsen's parameter construction instead stratifies tuples spanning a Lie algebra and uses2r² repetitions, with2r⁴ parameters. Both are bounded in r, but their formulas and hypotheses differ. Item121 records both without substituting one for the other silently.
2. **Chevalley and spreading are the outstanding geometric input.** At generic points the group is a subspace stabilizer in a mixed tensor representation. Spread that property to open strata and repeat on the lower-dimensional complements; summing the finitely many multiplicity maps gives one f°_r. This is item122. Its exact closed-group-family hypotheses and equality after arbitrary coefficient-algebra extension remain G5. The author's proof briefly writes equality in GL_r(Fℓ); field points alone do not supply the subgroup-scheme equality used by CHT.
3. **Setwise to pointwise is a real argument.** A subspace W of dimension δ is preserved exactly when its determinant line Λ^δW is preserved. This Plücker statement is made over every coefficient algebra in123. Every character of an exponentially generated group is trivial: restrict to G_a, where an invertible polynomial is constant and the identity forces that constant to be1, then use generation. Consequently U fixes this determinant line pointwise (124). The pointwise stabilizer is contained in the setwise one, which is U, giving equality.
4. **Move the line into tensor space.** If δ! is invertible, antisymmetrization maps Λ^δE into E^⊗δ and its wedge composite is δ!. For D=dim T^(f°_r)(Fℓ^r), the single conservative bound ℓ>D handles every δ≤D. CT16 uses the normalized map; this bound is not a claim that the unnormalized exterior embedding must fail in smaller characteristic. Add the tensor powers for1≤δ≤D. The fixed line in one summand forces the pointwise stabilizer of all U-invariants to be U (125).
5. **Remove multiplicities carefully.** Fixed vectors in a finite direct sum split by coordinates. Repeating an isomorphic summand adds no new equations, so the multiplicity construction embeds its conditions into CHT's rectangular tensor bound s,t≤d. After expanding the tensor powers one may take d≥D max_(s,t)∈supp(f°_r) max(s,t). The bound is on the expanded family, not merely the original support. Along an exponential root group the polynomial degree is at most(s+t)(r−1)≤2d(r−1) (126).

Fix(W) in127 is explicitly a subgroup scheme: an A-point fixes the base-changed vectors for every F-algebra A. This prevents the false inference that finite-point equality is scheme equality. For example T^ℓ−T vanishes on all Fℓ points of G_a but is a nonzero polynomial, and evaluates to −ε at ε over Fℓ[ε]/(ε²). Once G_s is a closed subscheme of the integral Nori envelope with equal dimension, item142 supplies the final scheme equality: full support gives a nilpotent ideal, and the ambient coordinate ring is reduced.

The proof after the uniform Chevalley input is now supplied at declaration granularity. The primary Borel/EGA family step, the relevant NoriA hypotheses and the scheme-level spreading still need verification. They have not been replaced by a finite computational test.

## Larsen's complete proof dependency chain

Items128–141 expose the inputs behind113–114, with the **unipotent-radical hypothesis** retained for bounded index.

-128 gives the characteristic-zero exponential-generation criterion: no nontrivial finite, toric or anisotropic quotient. Its proof uses unipotent filtrations and generation by proper parabolic radicals; the cited rational-point and structure theorems remain recursive leaves.
-129 records NoriA's correspondence between nilpotently generated Lie algebras and exponential groups. NoriB's finite-points comparison56 is a different input.
-130–131 give the finite Hilbert-polynomial and reduced-family step. The projective object includes the entire boundary P^(n²) minus GL_n. It is not just the projective closure of G. The printed family construction in Lemma4 requires the E5 correction discussed below.
-132 defines Nori dimension via the residual envelope.133 defines F_mH for m≥1 and its embedding in M_n(F_p). It does not linearize the level-zero quotient.
-134 proves the lifted-exponential congruence A^(p^k)≡1+p^kM modulo p^(k+1) when p≥2n. Lift the nilpotent logarithm using a lifted Jordan basis, write A=1+N+pB, and expand. In the exceptional m=p binomial term a word N^iBN^j has i+j=p−1; p≥2n forces one exponent≥n, so it vanishes. The other B terms vanish modulo p². Iterating the positive-level power congruence gives all k. The lift M need only reduce to x in the final congruence.
-135 compares each graded congruence space between the Nori logarithm span and dim G. The upper bound is the **Serre p-adic analytic growth input**, not an immediate Zariski-density argument.136 uses equality of the graded spaces, successive corrections and closedness to obtain F_1Γ=F_1H and openness. A dense nonclosed subgroup would not justify the limit step.
-137 separates the finite component-group argument: a finite central extension, Jordan's theorem and the pth cyclotomic degree. Its finite-extension hypothesis is essential; arbitrary infinite extensions do not preserve elements of order p.
-138 passes to a **totally ramified** splitting extension so the residue field stays F_p. This is where local anisotropic-group classification and division-algebra splitting enter.139 uses the finite Hilbert list, properness, flat closure and constructible component counts to obtain a bound d_n independent of p and G.
-140 states the connected finite-field point bounds(p−1)^d≤|K(F_p)|≤(p+1)^d, including the radical/quotient and component arguments needed for the actual possibly nonreduced special fibre. Those inputs remain Lang/structure/order-formula proof obligations.
-141 combines the upper bound d_n(3/2)^(n²)p^d for H/F_1H and lower bound e_n⁻¹2^(−n²)p^d for Γ/F_1Γ, where e_n comes from Nori. Equal first kernels cancel, leaving[H:Γ]≤3^(n²)d_ne_n. Dimension equality alone would not give this index bound.

The exact finite diagnostic includes n=2,p=3, A=((1,1),(3,1)). Modulo9, A³=((1,6),(0,1)), whereas1+3x=((1,3),(0,1)) for x=((0,1),(0,0)). Thus dropping the stated prime bound actually breaks this congruence. The example is outside Larsen's hypotheses and is not a source error.

## Source findings and independent review

All five findings await independent review. E1–E4 are preserved byte-for-byte in JSON from the prior extraction; no review verdict was added.

- **E1:** CHT p.218 loses the compact-support subscript in the finite-étale direct-factor sentence.
- **E2:** CHT p.229 places a closed point in the fundamental group instead of the base's closed points.
- **E3:** CHT Theorem9.1.1–2 states no prime bound, while its displayed root-exponential proof uses ℓ≥r. This is a proof-scope gap, not a counterexample to the theorem. The main large-prime application is unaffected by retaining that bound.
- **E4:** CHT's BT84 bibliography gives an incorrect page interval/link; the earlier extraction supplies the original Bruhat–Tits record.
- **E5, new external-source notation finding:** Larsen Lemma4 pp.1033–1034 defines W as the reduced closure of the boundary of the constructible image, then chooses U disjoint from W. Thus W_U is empty. The next page nevertheless defines the open-stratum part of Y′ to be W_U and describes the base map ψ on W_U although its domain is U. For X=Spec Q, Z=Y=Spec Q and ξ=id, embedded in P¹, the claimed construction gives an empty fibre instead of a point. The intended family is the closed image over U, with ψ restricting to U→X. Its reducedness and base-change proof still need checking. Rendered PDF pages were inspected; this is not a text-extraction artefact, nor a counterexample to Lemma4. The official MSP source/index and exact-title correction searches found no correction; that search does not prove novelty.

## Remaining closure work

- **G1:** Verify recursive originals for Gabber/Suh, CT13 and CT16 uniform-image assertions, CT12, Nori A/B, Jantzen/Larsen95b, Larsen–Pink92/95 and Milne–Ramachandran. Larsen2010 is now fully read: close its Nori correspondence, Serre analytic-growth, finite extension/Jordan component, Kneser ramified splitting, EGA reduced-family/Hilbert properness/component-constructibility and Lang/finite-field point-count inputs. Review and repair E5 before exporting Lemma4. Consuming items: 21, 24, 25, 26, 49, 56, 68, 89, 107, 113, 114, 128, 129, 130, 131, 135, 137, 138, 139, 140, 141.
- **G2:** Turn item116's CRT weight-projector argument into a fully typed lattice/subquotient proof; combine the finitely many degrees and ranks, fibre powers, shifts and geometrically trivial determinant twists to obtain a single bound independent of the subquotient. Consuming items: 11, 12, 13, 116.
- **G3:** Establish canonical versus explicit continuous H¹ comparison for compact coefficients, continuous splittings, the exact reduction/rationalization sequences and affine-curve cd≤1 on the correct coefficient carrier. Consuming items: 10, 27, 48, 100, 101, 102.
- **G4:** Check Bruhat–Tits big-cell hypotheses over ramified splitting O_E, affine-model hypotheses in Lemma8.1, schematic closure under base change, special Lie base change and simply connected isogeny extension. Review E3 before any small-prime export. Consuming items: 72, 79, 80, 84, 85, 87, 94.
- **G5:** The CT16 author-version lemma4.2.1.1 is read, and determinant-line fixing, antisymmetrization and conversion to separate tensor bounds are decomposed in120–127. Establish the exact finite-type exponential-family and Chevalley/spreading statement122 over all coefficient algebras. The selected two-pass product and Larsen’s 2r²-pass construction have different parameter counts; do not identify them or infer scheme equality from finite field points. Verify Borel/EGA originals and NoriA for the alternate Lie-tuple family. Consuming items: 58, 61, 121, 122, 129.
- **G6:** Read Larsen–Pink Γ-regular and common-Frobenius statements directly, prove the arithmetic torus lift and discriminant exclusion, and justify uniformity of the single chosen closed point across coefficients. Consuming items: 92, 93, 109, 111.
- **G7:** Resolve the precise rational-coefficient ℓ quantification and finite-extension stability in Corollary11.1/MR04 Lemma3.1, with both complementary Tate assumptions and integral cycle saturation. Consuming items: 105, 106, 107, 109.
- **G8:** Reconcile any overlapping future generic Lang/Tits/finite Lie-type simplicity or exterior-adjoint invariant owner at design time. CFSGStatement L3 is a carrier roadmap and explicitly does not prove simplicity. Library nonexistence claims are scoped to this pinned search, not all future work. Consuming items: 78, 89, 124, 140.
- **G9:** Future blueprint work expands the suggested files into signatures, API and tests and compiles at the pins. This is downstream formalization work, not an unfulfilled authorized paper deliverable; no Lean file was requested here. Consuming items: downstream blueprint files.

G9 is a downstream formalization handoff, not an unmet requirement to edit an unauthorized Lean file. G1–G8 are why source/design closure remains partial. The next worker should verify122's family/spreading hypotheses and131's corrected reduced-image construction, then the primary Nori/Serre inputs for135. The remaining nice-torus and arithmetic Tate quantifiers remain separate tasks.

## Validation and reproducibility

The continuation checked the142-node graph with177 internal edges for resolved endpoints and acyclicity; all127 missing items have exactly one route. All41 definitions/constructions have explicit API statements, recorded uses and three mathematical test cases. All eight planned items cite actual atlas stages. The reviewed atlas/library/protocol/owner/paper snapshot contains484 files, recorded with Git blob and SHA256 hashes in JSON. Publication rechecks those inputs and all three original deliverable blobs against current main before creating the commit.

The new standard-library diagnostic checks18,156 lifted-exponential congruences;6,052 graded-power congruences;408 tensor-degree expansions;2,544 rank-two setwise/pointwise stabilizer cases;five finite-point/scheme counterexamples;one small-prime failure; and one factorial-normalization boundary. The prior report's unchanged certificate was rerun:166 root-system products,4,714 coefficient witnesses,4,356 exp/log laws,84 determinant splittings and162 weight-projector entries. All passed. These finite checks do not prove Nori uniformity, Chevalley spreading, Hilbert-family existence or geometric semisimplicity.

Paper schema and three-file intake checks are recorded in JSON. No Lean file was a deliverable and no Lean compilation is claimed.

### New diagnostic (Python standard library)

```python
"""Exact finite regressions. These are not proofs of the uniform group theorems."""
from itertools import product
from math import factorial
import json
from pathlib import Path
P=Path('.')
def mul(a,b,q):
 return tuple(sum(a[2*i+k]*b[2*k+j] for k in range(2))%q for i in range(2) for j in range(2))
def power(a,n,q):
 b=(1,0,0,1)
 while n:
  if n%2:b=mul(b,a,q)
  a=mul(a,a,q);n//=2
 return b
I=(1,0,0,1)
counts={'liftedExponentialCongruences':0,'gradedPowerCongruences':0,'tensorDegreeExpansions':0,'finitePointSchemeCounterexamples':0,'determinantLineStabilizers':0}
for p in [5,7]:
 for x in [(0,0,0,0),(0,1,0,0),(0,0,1,0)]:
  for b in product(range(p),repeat=4):
   a=tuple(I[j]+x[j]+p*b[j] for j in range(4))
   for k in [1,2]:
    q=p**(k+1)
    assert power(a,p**k,q)==tuple((I[j]+p**k*x[j])%q for j in range(4))
    counts['liftedExponentialCongruences']+=1
 for c in product(range(p),repeat=4):
  for m in [1,2]:
   q=p**(m+2);a=tuple(I[j]+p**m*c[j] for j in range(4))
   assert power(a,p,q)==tuple((I[j]+p**(m+1)*c[j])%q for j in range(4))
   counts['gradedPowerCongruences']+=1
# A real failure outside the stated p>=2n bound (n=2,p=3).
assert power((1,1,3,1),3,9)!=(1,3,0,1)
counts['smallPrimeCounterexample']=1
# Expanding mixed tensor products adds covariant/contravariant degrees separately.
for support in [((0,0),(1,0)),((1,0),(0,1)),((2,1),(0,2)),((2,2),(1,0))]:
 for r in [1,2,3]:
  D=sum(r**(s+t) for s,t in support)
  d=D*max(max(z) for z in support)
  for delta in range(1,min(D,5)+1):
   for terms in product(support,repeat=delta):
    s=sum(z[0] for z in terms);t=sum(z[1] for z in terms)
    assert s<=d and t<=d
    assert (s+t)*(r-1)<=2*d*(r-1)
    counts['tensorDegreeExpansions']+=1
assert max(sum(z) for z in [(2,2)])==4 # total-degree cutoff2 would lose this summand.
# X^p-X vanishes at all F_p points but is a nonzero polynomial;
# at epsilon over dual numbers it is -epsilon, so it does not vanish schematically.
for p in [2,3,5,7,11]:
 assert all((pow(a,p,p)-a)%p==0 for a in range(p))
 coeff=[0]*(p+1);coeff[1]=-1;coeff[p]=1
 assert any(a%p for a in coeff) and (-1)%p!=0
 counts['finitePointSchemeCounterexamples']+=1
# For W=<e1>, invertible 2x2 matrices stabilize W iff the lower-left entry is0.
# The line and its determinant are the same here; pointwise fixing also requires a=1.
for p in [3,5,7]:
 seen_strict=False
 for a,b,c,e in product(range(p),repeat=4):
  if (a*e-b*c)%p==0:continue
  setwise=c==0;pointwise=c==0 and a==1
  assert not pointwise or setwise
  if setwise and not pointwise:seen_strict=True
  counts['determinantLineStabilizers']+=1
 assert seen_strict
# Normalized antisymmetrization requires factorial invertibility; no claim that
# unnormalized exterior embedding itself must fail in small characteristic.
assert factorial(3)%3==0 and factorial(3)%5!=0
counts['factorialNormalizationBoundary']=1
counts['scope']='Finite rank-two congruences, tensor bounds and explicit counterexamples only; no Chevalley spreading, Nori theorem, Hilbert family or geometric semisimplicity proved.'
(P/'diagnostic-results.json').write_text(json.dumps(counts,indent=2)+'\n')
print(json.dumps(counts,indent=2))
```

### Prior certificate, retained and rerun

```python
"""Exact finite checks for CHT17 extraction; not geometric proofs."""
from itertools import combinations
from math import factorial

def mulpoly(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i+j] += x*y
    return out

types = []
for n in range(1, 7):
    types.append(("A"+str(n), list(range(1, n+1))))
    if n >= 2:
        types.append(("B"+str(n), list(range(1, 2*n, 2))))
        types.append(("C"+str(n), list(range(1, 2*n, 2))))
    if n >= 4:
        types.append(("D"+str(n), list(range(1, 2*n-2, 2))+[n-1]))
types += [("G2", [1,5]), ("F4", [1,5,7,11]), ("E6", [1,4,5,7,8,11])]
systems = []
def enumerate_systems(start=0, names=(), exponents=()):
    if exponents:
        poly = [1]
        for e in exponents:
            poly = mulpoly(poly, [1]+[0]*(2*e)+[1])
        assert sum(poly) == 2**len(exponents)
        assert len(poly)-1 == sum(2*e+1 for e in exponents)
        systems.append((names, len(exponents), len(poly)-1, poly))
    for i in range(start, len(types)):
        name, es = types[i]
        if len(exponents)+len(es) <= 6:
            enumerate_systems(i, names+(name,), exponents+tuple(es))
enumerate_systems()
witnesses = 0
for a in systems:
    for b in systems:
        if a[1] == b[1] and a[2] < b[2]:
            assert any(a[3][m] > b[3][m] for m in range(a[2]+1))
            witnesses += 1

def ident(r):
    return [[int(i == j) for j in range(r)] for i in range(r)]
def mm(a, b, p):
    r = len(a)
    return [[sum(a[i][k]*b[k][j] for k in range(r)) % p
             for j in range(r)] for i in range(r)]
def add(a, b, p):
    return [[(x+y) % p for x,y in zip(ar,br)] for ar,br in zip(a,b)]
def scale(c, a, p):
    return [[c*x % p for x in row] for row in a]
def expm(a, p):
    r, out, term = len(a), ident(len(a)), ident(len(a))
    for n in range(1, r):
        term = mm(term, a, p)
        out = add(out, scale(pow(factorial(n), -1, p), term, p), p)
    return out
def logm(u, p):
    r = len(u)
    a = add(u, scale(-1, ident(r), p), p)
    out, term = scale(0, a, p), ident(r)
    for n in range(1, r):
        term = mm(term, a, p)
        out = add(out, scale((-1)**(n+1)*pow(n, -1, p), term, p), p)
    return out
group_laws = 0
for p in (5,7,11,17):
    for r in (2,3,4):
        for seed in (1,2,3):
            a = [[(seed+i+2*j) % p if i < j else 0
                  for j in range(r)] for i in range(r)]
            u = expm(a,p)
            assert logm(u,p) == a
            values = [expm(scale(t,a,p),p) for t in range(p)]
            for t in range(p):
                for v in range(p):
                    assert mm(values[t],values[v],p) == values[(t+v)%p]
                    group_laws += 1
            # Strict polynomial degree < p matters in Lemma 7.1(3).
            assert all((t**p-t) % p == 0 for t in range(p))
            assert [0,(-1)%p]+[0]*(p-2)+[1] != [0]*(p+1)

splittings = 0
for p in (2,3,5,7):
    for r in range(1,7):
        for a in range(1,r+1):
            top = tuple(range(a))
            coefficients = {I:(sum((k+1)*(j+1) for k,j in enumerate(I))+3)%p
                            for I in combinations(range(r),a)}
            coefficients[top] = 1
            def wedge_value(indices):
                if len(set(indices)) < len(indices):
                    return 0
                inversions = sum(indices[i] > indices[j]
                                 for i in range(a) for j in range(i+1,a))
                return (-1)**inversions*coefficients[tuple(sorted(indices))] % p
            retraction = [[(-1)**i*wedge_value([j]+[k for k in range(a) if k != i])%p
                           for j in range(r)] for i in range(a)]
            assert [row[:a] for row in retraction] == ident(a)
            splittings += 1

projectors = 0
for q in (2,3,5,7):
    for p in (5,7,11,13,17):
        eigen = [1,q%p,q*q%p]
        if q%p == 0 or len(set(eigen)) < 3:
            continue
        for i, lam in enumerate(eigen):
            for j, mu in enumerate(eigen):
                value = 1
                for k, nu in enumerate(eigen):
                    if k != i:
                        value = value*(mu-nu)*pow((lam-nu)%p,-1,p)%p
                assert value == int(i == j)
                projectors += 1
assert (4-1)%3 == 0  # weight-separated rational roots can collide mod 3.
print({"root_system_products":len(systems), "equal_rank_dimension_witnesses":witnesses,
       "exp_log_group_laws":group_laws, "determinant_splittings":splittings,
       "weight_projector_entries":projectors})
```
