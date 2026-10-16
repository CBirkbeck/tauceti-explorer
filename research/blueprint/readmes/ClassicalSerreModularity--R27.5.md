# Classical Serre modularity: characteristic two and even conductor

This part plans `ClassicalSerreModularity:R27.5`, the last conductor reductions in Khare–Wintenberger’s Theorem 9.1. It proves qualitative residual modularity in characteristic two, including Serre weight four, and in odd characteristic with arbitrary even Serre conductor. The earlier odd-conductor theorem then supplies the remaining case. The resulting modularity witness contains a characteristic-zero newform, a coefficient place and an isomorphism of residual representations. Prescribing its level, weight and character is the work of R27.6.

The plan has three theorem declarations, three reused internal milestones and no new definitions or constructions. Every arithmetic object is imported from its existing owner. The planning pass is complete; the layer is **planned**, with three precise supplier requests preventing closure. Nothing here is an implementation claim.

## Scope, ownership and the existing parts

The issue’s predecessor, part R26.1, now covers R26.1–R27.2 and has no R27.5 coverage record. The newer part R27.3 already contains the internal milestones needed here. Their identifiers remain unchanged:

| Alias | Existing declaration in part R27.3 | Role here |
|---|---|---|
| Weight claim | `ClassicalSerreModularity:R27.5/dyadic-weight-two-claim` | The specially constructed dyadic residual representation has weight two. |
| D₁ | `ClassicalSerreModularity:R27.5/d1-by-the-prime-three` | Good-dihedral representations in odd characteristic with dyadic conductor exponent at most one are modular. |
| Dᵣ | `ClassicalSerreModularity:R27.5/dr-for-r-at-least-two` | The higher dyadic conductor exponents after characteristic two is proved. |

These are imported, with the hypothesis checks below, rather than copied into new nodes. The integrated identifier `ClassicalSerreModularity:R27.5/hypothesis-H-and-theorem-9-1` is retained for the final theorem and narrowed to that theorem’s conductor reductions. Its legacy identifier does not confer ownership of Hypothesis (H).

The sole owner of the proof of (H) is `GL2ModularityLifting:R22.6/hypothesis-h`. It includes the derivation from Kisin’s dyadic theorem, the potentially crystalline to potentially Barsotti–Tate comparison and the determinant normalisation. This resolves confirmed finding **RT-AREA-langlands-2/20**. The packet proposes one owners entry, a direct R22.6 → R27.5 dependency, and a replacement for RS-06’s R27.5 keeps. RS-08’s owner is retained. Those structural changes are proposals for the maintainer; no other packet or restructuring file is changed here.

The two new endpoint identifiers are:

- `ClassicalSerreModularity:R27.5/characteristic-two-closure`;
- `ClassicalSerreModularity:R27.5/even-conductor-closure`.

The three planets are **Characteristic-two modularity**, **Even-conductor modularity**, and **Serre modularity theorem**. The existing internal milestones keep their identities at assembly; they are not recreated as additional copies.

## Objects and conventions

Fix an algebraic closure of the rationals and decomposition groups inside its absolute Galois group. A residual coefficient field F is finite of characteristic p, and a residual representation is a continuous homomorphism from G_Q to GL₂(F), with F discrete. S-type means absolutely irreducible and odd. Oddness means that the determinant of complex conjugation is −1. In characteristic two this determinant condition is vacuous; requiring complex conjugation to act nontrivially would change the theorem and is not permitted.

The positive integer N(r̄) is Serre’s prime-to-p Artin conductor. Its dyadic exponent is the actual exponent v₂(N), including Swan conductor, rather than the number of distinct dyadic prime divisors. In characteristic two, N is automatically odd. The local Serre-weight recipe is the one owned by R15.4. At p=2 its values are 2 and 4; weight 4 detects the très-ramifiée branch. A cyclotomic twist can normalise the weight of an arbitrary residual representation before it is known modular. The full recipe must be reapplied after twisting: there is no unrestricted additive formula for the weight across its normalisation boundaries.

Use arithmetic Frobenius in characteristic polynomials. The p-adic cyclotomic character has Hodge–Tate weight +1, and a weight-two lift has weights {0,1}. Finite coefficient extensions, places above the residual prime and stable lattices are recorded at every switch of coefficient characteristic. Local restrictions keep their extension classes even though the global residual modularity witness uses semisimplification. In particular, locally semisimplifying a nontrivial unipotent action destroys the information this proof needs.

The imported modularity witness is the R15.6 notion: there exist a normalised cuspidal characteristic-zero newform f of weight at least 2, a place λ above p in a coefficient field containing its eigenvalues, a stable lattice in its λ-adic Galois representation, and an isomorphism between its semisimplified reduction and r̄ after extension to a common finite field. The pinned Tau Ceti carrier `HeckeRing.GL2.Newform` already supplies the classical newform. It does not supply the Galois representation or this witness.

An almost strictly compatible system here has **exactly** the classical KW contract supplied by R24.5. It consists of odd irreducible rank-two members with common good-prime polynomials and the specified local parameters. At a coefficient prime its geometric and full Weil–Deligne conclusions are used under the stated residual irreducibility condition. The proof does not replace this condition by an assertion that every compatible system is strictly compatible.

The statement Dᵣ, imported from `ClassicalSerreModularity:R27.2/hypotheses-Lr-Wr-and-Dr`, quantifies over S-type representations in **odd** residual characteristic which are locally good-dihedral and satisfy v₂(N)≤r. It is not itself a theorem about characteristic-two inputs. Theorem 3.4 removes the good-dihedral restriction. For characteristic two its extra weight-two restriction applies when r=0; the application with r=1 used here has no such restriction.

## Supplier contracts

The following are imports, not new R27.5 definitions or parallel developments. Their source statements and blueprint contracts were read before use.

| Supplier declaration | Exact part used |
|---|---|
| `ClassicalSerreModularity:R27.4/theorem-1-2` | Odd residual characteristic and odd N are modular; characteristic two of Serre weight two is modular. Only these qualitative conclusions are needed. |
| `ClassicalSerreModularity:R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice` | Dᵣ implies modularity of every S-type input with v₂(N)≤r, subject to the separate characteristic-two, r=0 restriction. |
| `ClassicalSerreModularity:R27.3/d0-from-all-lr` | The previously established good-dihedral odd-conductor case. |
| `ClassicalSerreModularity:R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved` | Preservation at the small residual primes in the precise range of Lemma 6.3, with the fixed ramification support and minimal type at the auxiliary prime. |
| `PotentialModularityAndCompatibleSystems:R24.3/theorem-5-1-part-2-weight-two` | The minimal weight-two lift, after residual weight normalisation and with its actual local minimality conditions. |
| `PotentialModularityAndCompatibleSystems:R24.3/theorem-5-1-part-4-level-two-type-at-q` | A prescribed level-two tame type at a prime q different from the coefficient prime, with the required local residual triangular shape and divisibility p∣q+1. |
| `PotentialModularityAndCompatibleSystems:R24.5/kw-theorem-5-1-systems` | Those prescribed lifts occur as the specified members of odd irreducible almost strictly compatible systems. |
| `PotentialModularityAndCompatibleSystems:R24.5/compatible-system` and `...:R24.5/almost-strict-compatibility` | The classical carrier and its conditional coefficient-prime geometry, including the full local WD parameter used below. |
| `PotentialModularityAndCompatibleSystems:R24.6/residual-members` | Residual members, coefficient extensions and the away-from-coefficient-prime conductor bounds. These do not assert residual irreducibility at every prime. |
| `PadicHodgeTheory:R06.3/weil-deligne-descent` | For a de Rham member, restriction is crystalline precisely when inertia on its WD parameter is trivial and its monodromy is zero. |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/crystalline-01-is-bt` | At every p, including 2, every stable integral lattice in a crystalline representation of weights {0,1} comes from a p-divisible group. |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/schematic-closure-of-generic-subgroups` | Generic finite subgroup closure and its finite flat quotient; needed for reduction modulo the coefficient uniformiser of the chosen lattice. |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/fontaine-ramification-numbering` and `...:R07.6/fontaine-ramification-bound` | The numbering comparison and the ramification bound for finite flat group schemes killed by a power of p. |
| `GL2ModularityLifting:R22.5/kw-i-theorem-4-1-odd-prime` | At coefficient prime 3, modular residual representation with absolutely irreducible restriction to G_Q(μ₃), and a potentially semistable weight-two lift, imply modularity of the lift. |
| `GL2ModularityLifting:R22.6/hypothesis-h` | At coefficient prime 2, a finitely ramified odd irreducible potentially crystalline weight-two lift of a modular nonsolvable residual representation is modular. |
| `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent` | Continuous characteristic-zero representations with the same good-prime characteristic polynomials on a density-one set have isomorphic semisimplifications after common scalar extension. |
| `AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation` | For a fixed newform, its representations exist at every finite coefficient place and have the same arithmetic-Frobenius polynomial. No Hilbert coefficient-prime strictness upgrade is used. |
| `AlgebraicModularFormsAndSerreWeights:R15.4/dyadic-weight-two-or-four` and `...:R15.4/recipe-well-definedness-and-twisting` | The numerical dyadic alternative and a small-weight cyclotomic twist for arbitrary residual representations. |
| `AlgebraicModularFormsAndSerreWeights:R15.6/s-type-arises-from-and-modular` and `...:R15.6/residual-modularity-witness` | The residual modularity conclusion, with the place, lattice, common coefficient field and residual isomorphism. |

R24.5’s own continuation reuses its compatible-system nodes from part R24.3; those are genuine existing node IDs, not new requests. The broad linked-systems propagation theorem is unnecessary here. Transferring modularity along a single system uses only its common good-prime polynomials and characteristic-zero recognition. Transferring between two systems through a shared residual representation requires the appropriate modularity lifting theorem at that shared prime. Neither transfer follows merely from the phrase “compatible system”.

Kisin’s Theorem 0.1 is used only to check the H boundary. Its full statement requires potential Barsotti–Tate at 2, determinant equal to the cyclotomic character times an even finite-order character, and modular nonsolvable residual image. R22.6 owns the passage from those hypotheses to H. In particular, this layer does not erase the determinant condition when citing Kisin directly.

## First endpoint: characteristic-two modularity

**Declaration:** `R27.5/characteristic-two-closure`. Assume the imported dyadic H. Every S-type representation over a finite field of characteristic two is modular, with either possible Serre weight and with no good-dihedral assumption on the input.

The argument first proves D₁ in odd characteristic and then applies Theorem 3.4 with r=1. The weight-four input is handled in this last application. The representation to which the weight-two characteristic-two base case is applied is a different, deliberately constructed residual member.

### Checking the imported D₁ milestone

Let r̄ have odd residual characteristic p, be locally good-dihedral at an auxiliary prime q₀ and have v₂(N)≤1. First choose a cyclotomic twist with 2≤k≤p+1 using the local recipe. This numerical normalisation does not assume modularity. The independent witness-level twist equivalence is request Q3. The twist preserves the prime-to-p conductor and the good-dihedral condition.

Theorem 5.1(2) gives a minimal weight-two lift and an almost strictly compatible system C. Its member at 3 has a residual representation r̄₃ with nonsolvable image by the good-dihedral preservation theorem. The bound in that theorem is B=max(Q(N/q₀²),p), where Q denotes the largest prime factor as in KW I. Since p≥3, the primes 2 and 3 lie in the permitted range. At later switches the fixed support remains within this bound, and the type at q₀ is preserved. A member may acquire ramification at its own coefficient prime; this does not enlarge the fixed away-from-coefficient-prime support used by the argument.

The dyadic conductor of r̄₃ is at most one. If it is zero, its conductor is odd and Theorem 1.2(1) proves its modularity. At coefficient prime 3, C₃ is potentially semistable of weight two by the conditional system contract. Nonsolvable image gives the needed absolute irreducibility on G_Q(μ₃): otherwise the cyclic restriction and Clifford theory force a reducible or dihedral, hence solvable, projective image. The odd-prime Theorem 4.1 applies to C₃. Characteristic-zero Frobenius recognition transfers the resulting newform to C’s original member, whose residual is r̄.

Suppose instead that r̄₃ is ramified at 2. The conductor formula a₂=codim(V^I₂)+Sw₂, with nonnegative terms, implies Sw₂=0 and dim(V^I₂)=1. Wild inertia is trivial. The tame quotient is cyclic; its diagonal characters are Frobenius invariant, and the residue field at 2 has multiplicative group of order one. They are therefore trivial. The inertia action is genuinely nontrivial unipotent. Arithmetic Frobenius F satisfies FUF⁻¹=U², which forces the ratio of its diagonal characters to be 2=−1 in characteristic three. Up to an unramified twist, the entire local representation is the extension of 1 by the residual 3-adic cyclotomic character required in Theorem 5.1(4). Request Q2 asks R01.3 for this conductor adapter with the actual extension class retained.

Now the coefficient prime is **3** and the local prime is **2**. Choose a tame character θ of inertia at 2 of order 3 and niveau 2. It exists because 3 divides 2+1; its Frobenius conjugate is θ², and their product is one. Before applying Theorem 5.1 again, normalise this intermediate input independently: choose η=χ̄₃^i so that σ̄₃=r̄₃⊗η has 2≤k(σ̄₃)≤4. The character η is unramified away from 3, so it preserves the conductor-one local shape at 2 and the good-dihedral type up to unramified twist. Theorem 5.1(4) applied to **σ̄₃** gives a second system C′, whose member C′₃ lifts σ̄₃ and has local type θ⊕θ² at 2. KW II §3.3.3 supplies the integral lattice needed to recover the nonsplit residual extension. Diagonalising the characteristic-zero inertia and reducing its two characters separately would lose that extension and would not suffice.

The Weil–Deligne parameter at 2 is (τ,0). The representation τ of the Weil group is irreducible because Frobenius interchanges its two inertia lines. Its restriction to inertia is a sum of two characters; calling that restriction irreducible would be incorrect. The original auxiliary good-dihedral prime survives, so both r̄′₂ and the relevant characteristic-three residual member have the nonsolvable image and absolute irreducibility needed at the subsequent lifting steps.

### Checking the weight-two claim

At coefficient prime 2, residual absolute irreducibility activates almost strict compatibility. Thus C′₂ is geometric with weights {0,1} and the same full WD parameter at 2. Let K be the field cut out by θ over the unramified quadratic extension of Q₂. It has ramification index 3; its total degree over Q₂ can be 6. On restriction to K, the inertial type is trivial and monodromy remains zero. The WD crystalline criterion makes C′₂ crystalline over K.

Apply the **integral** R07.4 equivalence to the chosen stable lattice. This gives a p-divisible group for that lattice, rather than merely a rational isogeny class with some unrelated reduction. If the coefficient ring is O_E with uniformiser π, extend its action by full faithfulness. The chosen reduction modulo π is a finite flat quotient of the appropriate 2-torsion: 2 times the lattice lies in π times the lattice, and generic subgroup closure and finite flat quotient give the model. Therefore the actual r̄′₂ restricted to G_K is finite flat on its underlying finite F₂-module.

If its Serre weight were 4, it would be très ramifiée. The following argument gives the precise obstruction needed here; its general export is Q1 at R07.6.

After a finite unramified extension F/Q₂ killing the finite diagonal unramified characters, the très-ramifiée extension has a quadratic Kummer quotient with class d of odd valuation. For any finite K/Q₂ of odd absolute ramification index e, put M=KF. This is unramified over K, so it has the same absolute ramification index e. The valuation of d over M remains odd. Multiplying by a square normalises it to v_M(d)=1. The quadratic extension M(√d)/M is Eisenstein, with integral basis 1,√d; its discriminant exponent is

\[
 v_M(4d)=2e+1.
\]

The quadratic discriminant/different formula gives its unique **Serre upper break** as 2e. These Eisenstein, different and upper-filtration facts belong to the existing LocalFieldsRamification roadmap.

Fontaine’s Theorem 1 for finite flat groups killed by 2 says that the action is trivial for his upper parameter u>2e. His §1.2(i) identifies u with v+1 in Serre’s upper numbering. Thus finite flat 2-torsion is trivial for **Serre upper v>2e−1**. The quadratic quotient just found is still nontrivial at v=2e. Upper filtrations commute with quotients, so its action contradicts finite flatness. Unramified base change of a finite flat model is enough; no ramified descent or uniqueness of a model is asserted.

For e=1 the quotient has discriminant exponent 3 and upper break 2, beyond the finite flat bound 1. For e=3 these values are 7, 6 and 5. No such assertion is made for even e: an even-index extension can kill the offending quadratic class. A bare claim that the valuation stays odd would leave the finite-flat implication unexplained; the ramification bound supplies it.

Consequently the specially constructed r̄′₂ has Serre weight 2. Theorem 1.2(2) makes it modular, and H makes C′₂ modular. The same newform then realises C′₃ by good-prime characteristic polynomials and recognition. Its reduction is σ̄₃. Apply Q3 with η⁻¹ to recover modularity of r̄₃, so the original C₃ now has a modular residual representation. When η is nontrivial, C′₃ and C₃ do not have identical residual representations before this untwisting. Apply the odd-prime weight-two potentially semistable lifting theorem at 3, and then recognise the original member of C. This completes D₁. Only H, rather than the narrower dyadic version of KW I Theorem 4.1, supplies the required new potential-crystalline case.

Apply Theorem 3.4 to D₁ with r=1. Every characteristic-two conductor is odd, hence is not divisible by 4. This proves characteristic-two modularity **also when the original input has Serre weight 4**. D₁ used only the earlier weight-two base case, so the dependency is acyclic.

### Acceptance checks

The first endpoint must pass all of the following checks:

- Check the weight bound separately at the intermediate coefficient-three lift, and untwist σ̄₃ before returning to C₃. Normalising only the original input does not check Theorem 5.1’s second application.
- Trace a weight-four input to Theorem 3.4 with r=1, without submitting that input to Theorem 1.2(2).
- Check that the specially constructed representation is finite flat for the **same** residual lattice used in the two-system link.
- In the obstruction, retain the shift u=v+1 and the strict inequality in Fontaine’s bound. At e=3 the break 6 contradicts triviality above 5.
- Distinguish ramification index 3 from degree 6 and the irreducibility of τ from the reducibility of its inertia restriction.
- Compute the order-three matrix with rows (0,1),(1,1) over F₂: its cube is the identity, it is nonidentity, has determinant one and has no nonzero fixed vector.
- Over F₃, compute DUD⁻¹=U² for D=diag(−1,1), U with rows (1,1),(0,1), and check that U has order three. Replacing U by its semisimplification fails the nonidentity check.

The last two checks are the five finite-matrix examples in the suggested file. They test concrete local algebra only; they do not assert the arithmetic endpoint in Lean.

## Second endpoint: arbitrary even conductor

**Declaration:** `R27.5/even-conductor-closure`. Assume dyadic H. Every odd-characteristic S-type representation with even Serre conductor is modular, without a bound on v₂(N), an initial weight restriction or a good-dihedral assumption.

First check the imported Dᵣ milestone for r≥2. As for D₁, normalise the residual weight by the numerical recipe before using Theorem 5.1(2), and recover the original representation by Q3. There are two local branches at 2.

If inertia is scalar times unipotent, remove the scalar by a finite global character unramified outside 2. The scalar character is invariant under local conjugation; local reciprocity identifies its restriction with a finite character of Z₂×, and the corresponding Dirichlet character gives the required global extension. This imports existing ClassFieldTheory rather than introducing another global reciprocity theory. After scalar removal, the image of wild inertia is a pro-2 image inside a unipotent p-group for odd p, hence is trivial. The remaining tame unipotent action has conductor at most one. D₁ gives modularity of the twist and Q3 returns modularity of the original representation. The global character is unramified at the odd auxiliary good-dihedral prime, so the protective local type is unchanged up to an unramified twist. Oddness is preserved because a character evaluated at complex conjugation has square one.

In the other branch, KW II §3.3.1’s local minimality conditions give a minimal weight-two lift with finite inertia at 2. The exceptional projectively unipotent case is precisely the branch already removed. Its WD parameter has zero monodromy. The resulting system’s dyadic residual member is good-dihedral, hence absolutely irreducible and nonsolvable; almost strict compatibility therefore supplies the dyadic member’s geometric weight-two condition and its full local parameter. By the WD criterion this member is potentially crystalline.

Characteristic-two modularity, already proved from D₁, now applies to its residual representation, regardless of whether that residual Serre weight is 2 or 4. H applies to the dyadic lift. Recognition along the common good-prime polynomials gives modularity of the original member and hence of the original residual representation. This proves Dᵣ for every r≥2 in one argument. It does not claim that each coefficient switch strictly decreases the conductor exponent, nor does it feed a Steinberg parameter with nonzero monodromy to H.

For an arbitrary even-conductor input, choose r=v₂(N), a finite integer at least one. Use D₁ for r=1 and Dᵣ for r≥2, followed by Theorem 3.4 to remove the good-dihedral condition. The theorem’s earlier solvable and dihedral cases keep their existing component suppliers; a solvable residual image is never passed to H. The initial small-weight twist is then undone.

Acceptance checks cover v₂(N)=1, v₂(N)=2 and arbitrarily large exponents, the scalar-unipotent case with large original conductor, and an input with initial Serre weight greater than p+1. The scalar-removal branch must recompute the twisted conductor. The finite-inertia branch must exclude nonzero monodromy and use the already established characteristic-two endpoint. Ramification of one member at its own coefficient prime cannot be silently identified with the away-from-coefficient-prime conductor of another member.

## Final endpoint: Theorem 9.1

**Declaration:** `R27.5/hypothesis-H-and-theorem-9-1`. Under the exact dyadic H supplied by R22.6, every S-type residual representation over every finite coefficient field is modular in the qualitative R15.6 sense. Substituting R22.6’s theorem discharges H.

For p=2 use characteristic-two-closure. For p odd and N odd use D₀ and Theorem 3.4 with r=0, equivalently the qualitative conclusion of Theorem 1.2(1). For p odd and N even use even-conductor-closure. This exhausts the possible inputs. Return the coefficient field, place above p, stable lattice and residual isomorphism from the existing witness. The result does not prescribe the Serre level and weight; that transition belongs to R27.6.

The proof order is D₁ → characteristic two → Dᵣ for r≥2 → arbitrary even conductor → Theorem 9.1. Recognition along a system compares characteristic polynomials on a density-one set after common coefficient embedding, not a finite list of traces. The newform side uses the pinned `HeckeRing.GL2.Newform` with its actual parent character field and nonzero-level assumption. No new carrier called modularity is introduced to stand in for the missing witness theory.

Acceptance requires all three characteristic/conductor cases, a witness at the actual residual prime and the correct dependency order. Removing the H import must leave a conditional theorem, as in the source. Adding a prescribed level N(r̄), weight k(r̄) or character is a request to R27.6. No modern R33 theorem is an input to this classical argument.

## Open supplier interfaces and closure

The packet records exactly three requests and three corresponding gaps. Their mathematical uses and proof reductions are specified; their owning declarations are not yet supplied.

| Request / gap | Owner | Required export |
|---|---|---|
| Q1 / G1 | `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6` | Très-ramifiée dyadic representations remain non-finite-flat after every finite odd-ramification-index base change, with finite coefficient extensions and the actual local extension class. Use the Kummer quadratic quotient and Fontaine’s upper bound as above. |
| Q2 / G2 | `ArithmeticGaloisRepresentations:R01.3` | The conductor-at-most-one triangular shape at local 2 in coefficient characteristic 3, and removal of scalar-unipotent inertia by a finite global character supported at 2, importing existing ClassFieldTheory. |
| Q3 / G3 | `AlgebraicModularFormsAndSerreWeights:R15.6` | Qualitative residual modularity is equivalent before and after any finite residual character twist, via Teichmüller lifting, the existing ModularForms Layer 9 twist and Layer 4A primitive associate, and the tensor/Galois-polynomial and lattice comparison. Include finite coefficient extension and inverse twisting. No fixed level or weight is asserted. |

Q1 belongs above the existing R07.5 Kummer and R07.6 Fontaine inputs. Placing it in R07.5 with a dependency back on R07.6 would create a stage cycle. Q2’s conductor formula and vanishing criteria are already planned, but they do not themselves state the precise local/global adapter. Q3 must be independent of the theorem in R20.3 that starts with an **already modular** representation. The latter cannot justify a normalisation used before the proof of modularity. Q3 also covers the intermediate mod-3 twist in D₁ and normalisations within the imported Theorem 3.4. The newer R27.4 packet still lists the already-modular R20.3 input: IC-4 records the replacement needed at assembly, without editing that supplier in this job. The form twisting API and passage to a primitive associate already belong to current ModularForms Layers 9 and 4A. Q3 requests their arithmetic compatibility with the existing residual witness, not another construction of those form operations.

There are no R27.5 definition API items or definition unit tests, because every definition is imported. The theorem acceptance checks above are still required. Once Q1–Q3 are supplied, replace the three stage prerequisites by their exact node identifiers, check their full contracts and recheck closure. The current coverage is planned, not closed.

## Baseline and current upstream comparison

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Five declarations were read at those commits: `ZMod`, `Matrix.mul_fin_two`, `Matrix.det_fin_two`, `Matrix.mulVec`, and `HeckeRing.GL2.Newform`. The first four supply the small algebraic acceptance fragments. The fifth supplies the existing target-side newform carrier. The reviewed audit `AUDIT-31` records R27.5 as not built and identifies the overlap of H with R22.6.

The current read-only Tau Ceti roadmaps were checked beyond the atlas snapshot. ModularForms’ conventions, Layers 4–5, Layer 9 inner twists and worked checks supply the existing forms direction, including the twist, its good-prime coefficients and its primitive associate. LocalGaloisGroups’ contracts and examples, ProfiniteArithmetic’s initial contracts, and LocalFieldsRamification’s Eisenstein, different and upper-filtration material own the local arithmetic used in the import checks. IntegralHeckeAndGaloisDeterminants’ scope distinguishes its reconstruction work from the residual modularity endpoint. Their plans are cited, never recreated. The current Tau Ceti library was searched as well; its newer content does not turn these Serre-weight, compatible-system and modularity-witness interfaces into pinned carriers.

The compact suggested file contains only five matrix statements over existing pinned carriers, with no new data definitions. All three principal target statements are in this document: their continuous Galois representations, local weight recipe, compatible systems and modularity witnesses cannot yet be expressed against the pinned interfaces without developing missing theory. The packet’s `suggestedCoverage` records each omission individually. Elaboration of these fragments checks syntax and types, not the truth of the roadmap’s arithmetic theorems.

## Sources and source corrections

All locators below use the versions actually read on 16 October 2026. Mathematical statements in this document and the packet are in our own words. No source passages are reproduced.

- Khare–Wintenberger, [*Serre’s modularity conjecture (I)*](https://www.math.ucla.edu/~shekhar/papers/results.pdf), public author copy, own pages 2–23: Theorem 3.4 p. 6, Theorem 4.1 p. 7, Theorem 5.1(2),(4) pp. 9–10, Lemmas 6.1–6.3 pp. 10–12, §8.4 pp. 17–18, Hypothesis (H), its Remark and Theorem 9.1 in §9 pp. 18–19.
- Khare–Wintenberger, [*Serre’s modularity conjecture (II)*](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), author copy dated 30 May 2009: local minimal lifts in §3.3.1 pp. 32–33, the prescribed level-two type and lattice in §3.3.3 pp. 35–36, and the system construction’s concluding checks in §10.3.1–§10.3.2 pp. 92–94. These are supplier checks; their deformation and potential-modularity proofs are not replanned here.
- Serre, [*Sur les représentations modulaires de degré 2 de Gal(Q̄/Q)*](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), Duke Math. J. 54 (1987), printed §2.4.7 p. 186, §2.6 p. 188, §2.7 pp. 188–189, and Proposition 4 in §2.8 pp. 189–190. These fix the Kummer and weight conventions.
- Fontaine, [*Il n’y a pas de variété abélienne sur Z*](https://www.imo.universite-paris-saclay.fr/~fontaine/varabZ.pdf), Invent. Math. 81 (1985): §1.2(i) p. 518 and Theorem 1 in §2.1 p. 525. The page images were checked for the precise bound and numbering because the text extraction loses formulae.
- Kisin, [*Modularity of 2-adic Barsotti–Tate representations*](https://people.math.harvard.edu/~kisin/dvifiles/serre2.dvi), public author DVI, Theorem 0.1 p. 2. Its statement was read for the supplier boundary; its proof belongs to R22.6. The determinant condition is retained there.

The published pagination of the KW and Kisin articles was not compared with these author copies. No inaccessible book is used as an unchecked proof leaf in this part; the general local-field facts have their existing upstream owners.

Existing source issue **ClassicalSerreModularity/E3** is retained under its existing identity. In the proof of Theorem 9.1 on author p. 19, the second system must lift the **characteristic-three residual member** of the first system, with any required weight-normalising twist recorded and later undone. The later reference for the order-three local type is Theorem 5.1(4), together with coefficient-prime compatibility and the integral Barsotti–Tate input, rather than item (2) alone. These are cross-reference slips with the intended argument recoverable. Part R27.3’s independent review already confirmed E3; that review is not presented as a review of this new packet. The present independent review confirms E3 in that author copy. The Springer landing page and PDF endpoint were checked, but the proof requires subscription access; the published proof was not compared and no linked correction was found. The packet records this version boundary in `sourceVersions`.

Independent review `REV-ClassicalSerreModularity--R27.5` accepts this planning pass after the intermediate weight-normalisation correction. All three theorem nodes and five pinned baseline declarations were checked. Q1–Q3 remain open and the layer remains planned. The unchanged suggested file elaborates at the pins with five expected `sorry` warnings and no other warnings.
