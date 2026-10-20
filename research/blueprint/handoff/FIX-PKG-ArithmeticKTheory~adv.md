# ArithmeticKTheory: adversarial findings repaired

Job `FIX-PKG-ArithmeticKTheory~adv`, issue #11275. Agent: Codex,
session `codex-K8w3Oo`. The claim bot confirmed this session's claim.
This is a complete fix submission, for independent fix review. It does
not claim to formalize the roadmap's mathematical targets.

Only the four issue deliverables were changed. The earlier adversarial
report remains an unchanged record of what its reviewer found.

## Finding dispositions

### U1: the uniform annihilator assertion is false

README §6.6 now retires `coefficientKernel_eq_div_of_annihilates`.
The fixed-modulus intersection formula and eventual theorem are kept,
with a separate stabilization bound. The new Lean target
`inter_mul_eventually_eq_divisibleSubgroup` states the general finite-subgroup
argument, including containment of the ambient infinite-height subgroup.
It does not require that the ambient group be finite.

The arithmetic counterexample is Caputo's sextic
X⁶−793X³+226981. Proposition 4 and Example 2, pp. 16–17,
give a zero 3-primary wild kernel and a nonzero fixed-modulus
obstruction. Theorem 1, pp. 12–14, identifies that obstruction at
i=1,n=1 with the twisted S-class group of order three. The local
root calculation and Moore sequence identify the tame 3-part with
ℤ/3: multiplication by three annihilates it but its coefficient
kernel still has order three. Multiplying by the exponent of the
prime-to-three tame part gives a full annihilator with the same defect.
Thus the arithmetic assertion, rather than only its proposed abstract
proof, has a negative control.

Qualification retained in the README: Caputo reports the class-group
computation using PARI. I did not independently certify that computation.
The four arithmetic hypotheses of Proposition 4 and the local degree/root
calculation specify the exact certificate target under §8.1; a defining
polynomial is not a certified class-group computation. No computational
certificate was fabricated. The source's counterexample and the conditional
deduction from its hypotheses are distinguished explicitly.

The contrast with K-book V.6.8.2, p. 413, is now stated. Banaszak's
separate stabilization index is recorded at equations (56), (59)–(60),
p. 17, and Remark 6.1/Theorem 6.4, p. 31, of version 1.

### U2: independent exceptional dyadic image proof

README §§6.10–6.12 replace the invalid unrestricted class/norm prescription
by Hutchinson's finite-coefficient, Bockstein and Poitou–Tate proof.
The full-field complex has middle homology ℤ/2 exactly for even weight
and a very special field. Passing to the twist field removes that defect.
For odd weight the full field already is the twist field. The image is
the ambient infinite-height subgroup after the independent eventual bound;
the argument does not confuse an annihilator with that bound.

The proof records both finite Sha¹ groups, the inclusion of the all-place
group into the S-local group, the reversed dual surjection, and its kernel.
It retains the real H³ Bockstein term. Hutchinson's Corollary 5.7,
p. 19, then supplies the exact wild-kernel/div quotient, including special
odd weight. The real motivic-H² bridge uses the actual ring comparison
and localization rows; the real correction is in K→H². Weibel's
Proposition 8.4, Lemmas 8.5–8.6 and Theorem 8.7, pp. 20–21,
supply divisibility of the hidden real K-class. The higher raw/symbol
comparison remains conditional on the stated global-to-local vanishing.

An additional definition error was found while repairing U2.
`IsSpecial` is now defined by proper stable dyadic decomposition groups.
Its equivalent local test is a disjunction: a nonexceptional completion,
or an extra real cyclotomic root in an exceptional completion.
The old strict-root-enlargement test wrongly rejected ℚ(√−17).
`IsVerySpecial` and its API/tests record the separate full-tower defect.

The compatible prime theorem is also stated exactly: for H the relevant
S-class field, L the cyclotomic extension and C=H∩L, the two Artin
restrictions to C must agree. A norm residue must first belong to the
actual cyclotomic image. This consumes class field theory and Chebotarev.
It is explanatory; the repaired image proof does not rely on prescribing
an incompatible pair.

### U3a: the detected Harris–Segal map

README §5.5 constructs the monomial functor from finite free μ_m-sets,
its wreath-product maps and group completion. The ℓ-Sylow index
calculation and stable transfer give surjectivity into finite-field K-theory.
The argument states precisely why ordinary-homology equivalence yields a
localized stable section, why a homotopy class lifts through the suspension
spectrum, and why the map factors through the actual group-completion
source. It does not assert scalar transfer on stable homotopy.

The finite-coefficient lift uses N=ℓ^{v_ℓ(q^i−1)}, followed by the
Bockstein; this supplies a lift of the correct finite order. Integral
surjectivity alone is not used to choose a finite-order section.
Residue detection, the actual e-map, prime-to-ℓ descent, and the
dyadic cyclic norm identify the number-field summand. The dyadic step
uses norm surjectivity, not division by two or a false blanket doubling
formula for w_i. The map, detection, injection and summand have named
targets, with noncanonicity of auxiliary finite-rank sections explicit.

Harris–Segal's original article was not obtained. Its DOI is bibliographic
evidence only. The replacement is an explicit proof route using the read
K-book VI.1.5, pp. 466–467, and Mitchell's research article, Theorem 3.4
and proof sketch, pp. 184–186. No claim to have read the original article
is made. This closes the detected-map planning gap without treating a
reported abstract cyclic decomposition as its construction.

### U3b: the actual twisted Picard injection

README §6.13 gives Caputo's independent Kummer–corestriction construction
and proof (Lemmas 4, 6–7, Proposition 3 and Remark 5, pp. 7–8).
It applies to every number field, odd p, and n≥1, including ramification
of p. The ideal-principalization cocycle and its Kummer boundary fix the
map. The extension used is the maximal extension unramified outside
the primes over p, with no extra pro-p restriction.

The twisted Brauer kernel has zero H₁ by faithful cyclic-module
acyclicity and Shapiro; coinvariants therefore preserve this particular
injection. Corestriction and the degree-two comparison finish it.
The root-basis computation gives relations χ(g)g(x)−x, equivalently
g(x)−χ(g)⁻¹x. CGZ's unramified-p version is a specialization.
The invariant-vanishing consequence uses the prime-to-p idempotent
first and finite-p-group Nakayama next; it does not identify invariants
and coinvariants. A p=5 test distinguishes the inverse twist, which
a sign character at p=3 could not do.

### U3c: cyclotomic proofs and the coherent coefficient module

README §§7.2–7.5 now give the finite character/reflection proof of
Kummer's criterion, the integral divided-Bernoulli congruence argument
at all positive indices, the one-prime inertia argument up the tower,
and the direct Artin normalization of Herbrand–Ribet. The original
Ribet article was read, including its lattice, modular-form and local
finite-flat arguments; its source locators are listed in §7.3.
The all-index step does not divide a congruence by a possibly nonunit k.
The tower step specializes the existing one-prime theorem, without
assuming an unproved norm-control isomorphism or the main conjecture.

The coefficient-module proof constructs `regularBottShift` by transporting
cup product with the invariant Tate class through normalized finite-coefficient
edges. Its iterates define a coherent polynomial action at every odd regular
prime, including three. For primes at least five, multiplicative comparison
identifies it with the usual descended Bott multiplication. At three the
transported operation is explicitly the meaning of the notation: no arbitrary
associative mod-three Moore ring is assumed. The unit-character calculation
gives the basis and all degrees, rather than extrapolating from low-degree
dimensions. The real-subfield norm and finite reflection bound give the
Vandiver cyclicity implication; exact orders still require B.8.

Obsolete IntegralIwasawaTheory L0/L3 references were replaced by its
current §§0.1–0.5, 3.1, 5.4 and 7.1–7.4. Three additional exact
exports are requested, with their statements/proofs in this package:

- `cyclotomic_kummer_congruence`: the integral divided-Bernoulli congruence,
  including indices divisible by p, away from the trivial character.
- `cyclotomic_finite_herbrand_ribet`: finite class components with the
  direct χ^{1−2k} Artin action.
- `cyclotomic_character_reflection`: the displayed complementary
  character-rank inequalities and trivial/χ component vanishing.

The maintainer should route those additions to IntegralIwasawaTheory's
packet. This issue permits no edit of that packet. Its existing one-prime
class-control target is consumed, not replanned.

## Adversarial pass over every touched statement

Each row covers the stated target family and its associated named API.
“Pass” records the attempted falsification and corrected scope, not a Lean
proof. Number-field assertions have characteristic zero; q=1 is not a
finite field. Heavy carriers remain README targets, as the package shape
requires. The two new computed norm/twist controls are proved Lean examples.

| Statement / API | Instances and calculation | Result and change |
| --- | --- | --- |
| Supplier contract and Layer 7 dependencies | Current IntegralIwasawaTheory §§0.1–0.5, 3.1, 5.4, 7.1–7.4 versus obsolete L0/L3; current upstream/library trees | Pass: existing foundations consumed; three absent specializations explicitly requested. |
| `cyclotomicWreathMap`, entries and block sum | Rank 0 gives the trivial automorphism group; rank 1 gives μ_m acting by scalar multiplication; two orbits give the monomial block sum | Pass: defined by a symmetric monoidal functor, not arbitrary group data. |
| Wreath stabilization, base change, residue, transfer | Identity extension; a tower of finite-projective integer extensions; finite S and its inverse image; a residue field of characteristic different from ℓ | Pass: the maps are those of the functor and K transfer; finite-projectivity and the residue characteristic restrictions retained. |
| Sylow valuation identity | q=7, ℓ=3, r=2: orders 2016 and 18, index 112; r=0 gives index 1; q=3, ℓ=2, r=2 fails the proposed formula | Pass: exact ℓ-root order required, and μ₄ required at two. q=2 supplies no positive dyadic root level. |
| Stable transfer / positive-homotopy surjectivity | Index a unit at ℓ versus divisible by ℓ; suspension-spectrum counit on an infinite-loop space; one finite-rank representative of a compact sphere | Pass: use ordinary homology and connective stable Whitehead, then the adjunction and actual source factorization. No scalar assertion on generalized cohomology. |
| Finite-order detected section | i=1 and i divisible by ℓ; N larger than m when v_ℓ(i)>0; odd N or 4∣N; zero target | Pass: use the full finite-field primary order N and a coefficient Bockstein. A lift of an integral generator alone is insufficient. |
| Root-field and odd-primary descent | F containing μ_ℓ; F=ℚ, ℓ=3, i=1/2; degree-one and prime-to-ℓ extensions; finite S | Pass: root-action valuations agree with the minimal root field, and only the unit extension degree is divided out. |
| Dyadic norm descent | ℚ(√−2)⊂ℚ(ζ₈), odd weight: action 3 on ℤ/8, invariants {0,4}, norm 4 onto them; inversion 7 gives norm zero | Pass: README and Lean pin the positive norm direction and exclude inversion. No blanket w_i doubling used. |
| `harrisSegalMap_e`, injection and summand | i=1 roots of unity; a zero primary W; real ℚ at two; exceptional imaginary ℚ(√−7) | Pass: actual e-detection and the stated nonexceptional dyadic hypothesis retained. Auxiliary section choices not asserted natural. |
| `coefficientKernel_eq_inter_mul` | mT=0 versus mT≠0; n=2 versus n=0; m=1; T=0 | Pass: identification with T requires an annihilator, m≥2, and positive even degree. The quotient expression is used before that identification. |
| Eventual intersection theorem | A=T=0, T=0 in ℤ, finite A, A=ℚ with finite T (containment fails), A=ℤ/4 and T=2A | Pass: finite T and div A≤T are essential; m₀=1 is allowed; no arbitrary-annihilator conclusion. Lean has exactly these hypotheses. |
| Stabilization threshold | A=ℤ/2^r, T=2^{r−1}A, r=1/2/large; equal early kernels | Pass: the drop occurs at r although |T|=2; repetitions and an annihilator give no bound. |
| Arithmetic counterexample | 3⁵≡−1 mod61, order 10; local root orders 9 versus 3; μ₂₇ has local degree 18; tame exponent 3, coefficient kernel order 3, div zero | Pass under the source's four arithmetic premises, with the reported PARI class-group datum explicitly uncertified here. Full annihilator extension acts invertibly on the 3-part. |
| `IsSpecial` and its local/decomposition API | ℚ not special; ℚ(i) nonexceptional; ℚ(√−17) has completion ℚ₂(i); ℚ(√−14) has completion ℚ₂(√2) | Pass: the nonexceptional-completion alternative repairs the old root-only definition. Properness at dyadic places implies the all-place condition. |
| Quadratic special-field test | d=−1, ±2 excluded; d=−17 and −14 included; d=2 tests the missing small-field exception in Hutchinson's example | Pass: the corrected exclusions agree with decomposition groups. |
| `IsVerySpecial` API | ℚ(√−17) yes; ℚ(√−14) no; a real field no; a field containing i no | Pass: total imaginary, global exceptional and every dyadic nonexceptional are all retained. |
| Special-field ρ₁ criterion | A decomposition group equal to G gives an identity summand on H₁ and hence a split surjection; every decomposition group proper gives zero; m=1/2 excluded | Pass: the revised stable definition agrees with the finite criterion for sufficiently large ν and odd positive i. |
| Finite faithful cyclic norm | On ℤ/4 with action 3, norm zero and invariants {0,2}; on ℤ/8 with action 3, norm 4 and invariants {0,4}; q=2 at modulus 4 is not an automorphism | Pass: only inversion is excluded in the faithful dyadic statement; coprimality and the action's actual order matter. The ℤ/8 control is also proved in Lean. |
| Full-field Picard complex | Odd/even i; special/very special/nonspecial fields; ν too small versus eventual ν | Pass: middle homology C₂ only for even i and very special F. No all-ν exactness asserted. |
| Real Bockstein term | i=1/2: H³(ℝ,ℤ₂(i+1)) is 0/C₂; the finite-H² boundary is an isomorphism in the latter case | Pass: integral H² modulo 2^ν is not substituted for finite H² without this term. |
| Sha¹ dual comparison | Odd special: both orders two; even very special: S-local order two, all-place order one; nonspecial: both trivial | Pass: all-place injects into S-local, with a dual surjection; the middle homology has the claimed size. |
| `cyclotomicPicard_image_div` | Odd weight full=twist field; even very special full-field defect; finite T; ν beyond independent intersection and finite-limit bounds | Pass: twist field removes the defect; no injection of class-group norm maps assumed. Odd-prime route is Caputo's Theorem 1. |
| `compatibleClassCyclotomicPrime` | H∩L=F gives independence; L⊆H forces its Artin restriction; ℚ(i) and norm 3 mod4 impossible; ℚ(√−17) has F(i) inside its S-class field | Pass: exact fiber product replaces independent prescriptions; actual arithmetic Frobenius direction specified. |
| Wild-kernel cohomological quotient | i odd/even; F=ℚ versus special ℚ(√−14); zero obstruction | Pass: quotient order two precisely for odd special case. No splitting supplied. |
| Real motivic-H² bridge | i=1/2; real local H³; identical finite residue groups; torsion field groups | Pass: ordinary motivic-H² comparison has no invented real kernel; real corrections remain in K→H². |
| Hidden real K-class divisibility | i≡2 mod4; the degree-four class of ℚ(√7); a finite C⊂div A | Pass: transfer/signature proof puts C in ambient div; it does not make the finite group C divisible in itself. |
| Assembled symbol theorem / raw boundary | Degree two versus higher even degree; torsion mapping to a divisible torsion group | Pass: symbol conclusion now has an independent exceptional proof; higher raw equality still requires actual global-to-local vanishing. |
| `cyclotomicPicardInjection` domain and map | Odd ramified p allowed; F=ℚ(μ₃), p=3,n=1 gives G=1; p=2 and n=0 excluded | Pass: full supported generality stated; identity case is the twisted Kummer map. |
| Ideal cocycle / generator independence | Unit ideal, a principal ideal, change α to a unit multiple, identity corestriction | Pass: zero class maps to zero and change of generator changes a cocycle by a coboundary; ambient extension stated precisely. |
| Coinvariant injection proof | Trivial G; several primes over p; nonzero H₁ for a general cyclic module at two | Pass: faithful odd cyclotomic modules, Shapiro and the M⁰ exact sequence prove H₁=0 in this case. General left exactness is not asserted. |
| χ⁻¹ twist convention | p=5, χ(g)=2, χ⁻¹ eigenvalue 3: 2·3=1; omitted twist scalar 3; inverse twist scalar 4 | Pass: correct quotient survives, both wrong quotients vanish. README and proved Lean example agree. |
| Invariant vanishing | Δ trivial; P trivial; finite p-module versus an arbitrary module | Pass: use Δ's integral idempotent and finite-module Nakayama; no canonical invariants/coinvariants identification. |
| Finite regularity criterion | p=3 empty range; p=37 and B₃₂; p=2 separate; totalized inputs 0/1 | Pass: prime/odd hypotheses retained, and reflection covers the plus part without Vandiver. |
| Character reflection and trivial components | Even a=0 and nonzero even a; complementary character 1−a; zero plus part | Pass: trivial/χ vanish; ranks of other odd components are at most one under Vandiver. |
| All-index Bernoulli step | p=5,k=5: B₁₀/5=1/66; p−1∣2k; p∣k; k=0 excluded | Pass: bounded integral moments handle cancellation; von Staudt handles the trivial-character case. No division by a nonunit. |
| Regularity up the tower | r=1 identity; higher p-power layers; one totally ramified prime versus two primes | Pass: the proper inertia subgroup lies in a maximal normal subgroup of index p. The resulting base extension is unramified; the one-prime hypothesis is essential. |
| Herbrand scalar and normalization | Primitive b; a=1 excluded; N=1+p(2k−1); k in the finite permitted range | Pass: ω^a(b)−b is a unit; N≡2k mod p−1 and N≡1 mod p fix the divided Bernoulli scalar. |
| Ribet extension and direct character | Diagonal (1,χ^{2k−1}); upper-right entry; p=37,k=16 yields direct exponent 5, inverse 31 | Pass: conjugation gives χ^{1−2k}; the finite-flat local proof, not level alone, removes ramification at p. |
| Regular-prime H² vanishing | ℓ=3/5 versus irregular 37; one inverted prime versus several; all twists over V | Pass: Pic/ℓ=0 and one-prime Brauer=0 are both used; the inverse even edge is unavailable in the general irregular case. |
| Coefficient edge identifications | n=0/1 handled by K₀/units; even n≥2; odd n≥3 | Pass: degree zero and one do not rely on an unstated high-degree comparison range. |
| `regularBottShift` and API | ℓ=3 degree 4; ℓ=5 degree 8; ζ↦ζ^a gives a^{ℓ−1}=1; two iterations | Pass: transported cup product gives a root-independent coherent F_ℓ[t] action and restriction compatibility; safe-prime multiplication agreement stated separately. |
| Unit characters and basis | ℓ=3/5; root component χ; free even characters; x₀=ℓ | Pass: rational Dirichlet representation plus integral prime-to-ℓ projectors suffices. No integral permutation-lattice isomorphism assumed. |
| Graded free module and parity | ℓ=3 residue dimensions 1,1,0,1; ℓ=5 dimensions 1,1,0,0,0,1,0,1; count (ℓ+3)/2 | Pass: correct odd/even H¹ cases give all basis degrees and all periodic repetitions, including three. |
| Vandiver norm, vanishing, cyclicity | Degree-two real extension, p odd; zero plus part; finite group with mod-p dimension 0/1 | Pass: K₄a primary group vanishes, K₄a−2 primary group is cyclic. Dimension does not assign its order. |
| Vandiver converse and conditional table | Degree 4a through every even character; one prime p versus all odd primes; low degree range n≥2 | Pass: finite character periodicity proves the converse; full integral orders still require all-odd-prime Vandiver and B.8. |
| Lean variables and generality | Ambient `A : Type*` with `AddCommGroup`; `[Finite T]`, not `[Finite A]`; positive m,m₀ and explicit containment | Pass: theorem matches the README. The two new examples use actual ZMod carriers and no axioms or admitted examples. |

## Source audit and qualifications

All repository prose is in my own words, with result/section/page locators.
No source passage or section-by-section digest was added. The following
are the precise files read; links are in the package bibliography.

| Source version | Locators used | SHA-256 |
| --- | --- | --- |
| Weibel, combined K-book, 29 August 2013 | IV.2.8 pp. 281–282; V.6.8.2 p. 413; VI.1.5 pp. 466–467; VI.2.5 p. 473; VI.8.3–8.5 pp. 514–515; VI.10.4–10.10 pp. 530–533 | `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845` |
| Weibel, wild-kernel author preprint, 23 July 2004 | Corollary 4.6 p. 13; §§7–8 pp. 18–21, including rendered real-comparison and transfer proofs | `2675756fe4e03556dac1b26538eeca0fd1b8bf0ae7d800433a3c708812f3478b` |
| Caputo, arXiv:1002.2936v2, header 25 February 2010, internal date 11 September 2018 | Notation 1 p. 3; Proposition 2 p. 5; Lemmas 4,6–9 pp. 7–11; Proposition 3/Remark 5 p. 8; Theorem 1 pp. 12–14; Proposition 4/Example 2 pp. 16–17 | `0dd2d646a440cacfc7f8a33f4e8922ac3eb96a8b84a509dc5780026c3212191b` |
| Banaszak, arXiv:1208.2137v1, 10 August 2012 | §4 p. 17; Remark 6.1/Theorem 6.4 p. 31 | `81b519ed809abfe718d66e650c9771ae4374bc840160552d340d11b9cd25ff5c` |
| Hutchinson, author preprint, 16 July 2004 | Definition 2.3/Remark 2.4 p. 4; Lemmas 2.6–2.7 pp. 4–7; Theorem 2.8/Corollary 2.9 pp. 6–8; Theorem 4.3 and Corollaries 4.7–4.8 pp. 13–15; Lemmas 5.1–5.2/Remark 5.4/Theorem 5.6/Corollary 5.7 pp. 16–19 | `4b17df7ff67808e65b19aeec2f71c8002926583e26446b1aafd90cd97fc6686f` |
| Mitchell, MSRI Publications 27 (1994), pp. 163–240 | §3 Theorem 3.4 p. 184, proof sketch pp. 185–186 | `3c4315e7b40cfaee78a15a53dfb85ed94aa817e6ba08ffa684c17c1df769df7b` |
| Sharifi, author Iwasawa Theory notes | Theorem 4.4.2 and Corollaries 4.4.4–4.4.5 pp. 111–113; Theorem 4.5.7 p. 117; Definition 5.2.4/Proposition 5.2.5 and Remarks 5.2.8–5.2.9 pp. 134–136 | `e5308be4c3d9ded6002cefb50df64b31f62b584b6ff68be7f21dc939f2508c26` |
| Ribet, Inventiones 34 (1976), pp. 151–162 | All twelve article pages, rendered from the author's scan; precise theorem/lemma/proposition locators in §7.3 | `6985813b4026bb0fd7098aed3f816262e0922f62a5d2dab22e29bcc2eb323471` |
| Yokoyama, Tohoku Mathematical Journal 17 (1965), pp. 349–357 | Theorem 4 p. 354 and proof p. 355 | `241d16ad2bce2aff802a94c3bb72758453b6211283cd5dd7756442c19a6c0f18` |

Hutchinson's journal version was not collated; all its page numbers refer
to the dated preprint. Harris–Segal's original proof and Keune's original
article are not claimed read: explicit alternative constructions replace
those evidence gaps. Washington was not cleared in the library index and
no copy was retrieved or used.

Source discrepancies worth the maintainer's attention: K-book p. 531's
prose immediately before Theorem VI.10.6 swaps the H¹ parity cases compared
with its correct Example VI.10.4.2; the roadmap derives the correct cases.
The integral unit-lattice permutation claim preceding Example VI.10.4.1
is stronger than needed; the roadmap uses the rational character calculation.
The dyadic w_i doubling shortcut is avoided by the explicit norm calculation.
Hutchinson's Example 2.5 misses the d=2 exception; the roadmap's quadratic
test excludes d=±2 and d=−1. These are observations for the maintainer,
not a second errata job. No suspicious instructions in fetched data were found.

## Ownership, retained boundaries, and resumption

Read the reviewed N.1–N.8 library audit, the package and adversarial reports,
the approved exemplar and nearby upstream roadmaps. Checked the current
read-only TauCetiRoadmap at `0d144d044dacebca17b654695b6f1ad58f159b27`
and Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`,
including the nine newer roadmap families and the named Completed roadmaps.
Object searches found no existing implementation of the new wreath-map,
special-field, coefficient-kernel or cyclotomic specializations. Existing
class-field, Chebotarev, class-norm, cyclotomic-character and one-prime
class-control foundations are consumed. The current golden-field arithmetic
is already correctly a library supplier and was not replanned.

The elaboration pins remain Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.
The new Lean target uses the existing pointwise subgroup images; it creates
no alternate K-theory/cohomology carriers or sorry-defined data.

The old G-HarrisSegal, G-WildExceptional, G-Keune and G-RegularProofs
missing-proof routes are supplied here. Their library/supplier exports are
still planned mathematics, rather than already formalized declarations.
The inherited H.3 connected finite-type export, hermitian/H.6 comparisons,
K.7 and M.7 coefficient/edge interfaces, RT.4 real comparison and the
one-prime Brauer calculation remain explicit supplier contracts.
G-WildHigher remains an explicitly conditional raw/symbol extension.
G-ChernBoundary still needs the previously documented external packet
updates; this package uses the early M.7 edge and introduces no M.8 cycle.
None of those packets is an allowed deliverable for this fix.

No repair finding is left for another worker. The next action is the
independent review of this fix, checking especially the source-reported
arithmetic datum and the stable-transfer and dyadic twist-field arguments.
The maintainer can route the three named IntegralIwasawaTheory exports
without reconstructing this run's scratch notes.

## Validation

`lean-check research/blueprint/packages/ArithmeticKTheory/Suggested.lean`
exited zero. All fourteen examples are proved. The only warnings are the
thirteen intended theorem `sorry` warnings. The file has seven light
real-bodied definitions, thirteen theorem targets and 234 lines.
All new heavy definitions and maps are named in its closing comment.
The README has 62 Checks lists, each with at least three entries.

All eight existing ArithmeticKTheory family packets were checked read-only
with `scripts/check_blueprint.py`: zero errors and zero warnings for each.
They retain their historical gaps/requests; this check is structural,
not a claim that this fix edited or closed those packet records.
`research/blueprint/intake.py check-files` reports four files and zero
problems for the four deliverables. `git diff --check` also passes.
