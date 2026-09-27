# Perfectoid quotients and their prismatic prerequisites

Current packet: **20 nodes, 6 API items, 12 tests, 3 planets, 54 baseline declarations, 8 gaps, 7 requests and 0 closed stages**. The complete-file compilation record is in the handoff.

This roadmap constructs the closed perfectoid quotient theorem through the
prismatic route of Bhatt–Scholze. Its endpoint is that a Zariski closed
immersion into an affinoid perfectoid space is strongly Zariski closed, in the
sense used by the supplied revision of Scholze’s *Étale cohomology of
diamonds*. The intermediate algebra is substantial: integral perfectoid rings,
universal prisms, perfectoidization, quasisyntomic lifting and André’s flatness
lemma. Each of these must be available independently of diamond v-descent.
The endpoint cannot be used as an input to its own proof.

The declaration graph developed here gives the integral-perfectoid predicate,
the functoriality needed to use it independently of a presentation, and a
complete algebraic argument for quotients of perfect rings in characteristic
p. In that case the answer is the existing quotient R/√I. The map from R/I
is surjective, the answer is integral perfectoid, and every map to an integral
perfectoid target factors uniquely through it. These statements allow an
arbitrary ideal, including the top ideal and infinitely generated ideals.
They do not impose a topology or identify an algebraic quotient with a
pseudouniformizer-adic completion.

All seven stages remain partial. In particular, the characteristic-p proof does
not establish completed flat base change in mixed characteristic, the ordinal
steps in the universal-prism construction, or the analytic plus-ring conclusion.
The twelve aggregates of the accepted source decomposition are preserved in
the packet’s continuation register. One identifier is refined to the integral
predicate; its other definitions retain their canonical suppliers. The eleven
other identifiers remain required mathematical work, with their accepted
hypotheses, source locators and corrections. Those aggregates are excluded from
the new declaration count and are not represented by artificial Lean carriers.

## Conventions and existing mathematics

Fix a prime p. Rings are commutative and unital; the zero ring is permitted.
Completeness means completeness and separation. A statement about ordinary
p-adic completion concerns the inverse system of ordinary quotients by powers
of the ideal (p). A statement about derived completion concerns the derived
category or animated ring supplied by DD.1. A statement about a Tate ring
uses its specified pseudouniformizer and topological carrier. These three
settings must be compared by theorems under stated hypotheses.

The pinned Mathlib already constructs Witt vectors, their Frobenius,
Teichmüller representatives and constant-coefficient map. It also constructs
inverse Frobenius perfection and the multiplicative untilt. Its PreTilt(R,p)
is the inverse-limit perfection of R/p. This has a canonical map toward R/p.
It is different from PerfectClosure(R,p), the direct construction that adjoins
p-power roots and kills the appropriate nilpotents. In particular, the arrows
in their universal properties point in different directions. Both existing
carriers are used: PreTilt enters the Fontaine map, while PerfectClosure of a
polynomial ring gives a decisive non-example for the integral predicate.

Fontaine’s map θ is already a ring homomorphism W(PreTilt(R,p))→R for a
classically p-complete R with p nonunit. Its reduction modulo p is the
zeroth Witt coefficient followed by the zeroth tilt coordinate. Its value on
[x] is x♯. The baseline also proves surjectivity of θ when Frobenius on R/p
is surjective. None of these constructions is planned again. In particular,
the θ reduction formula is cited as WittVector.mk_fontaineTheta; the suggested
file does not introduce a duplicate theorem for it.

The reviewed AUDIT-38 confirms this baseline and the absence of the general
perfectoid predicate. The generated library-coverage file in the snapshot has
no entry for this roadmap, so the accepted audit and its independent review
were read directly. Their presence claims were then checked against the actual
declarations, including the hypotheses on θ. The fact that a file lives in
Mathlib’s Perfectoid directory does not establish that the perfectoid predicate,
principal kernel or prism correspondence is implemented.

There is a small but consequential zero-ring interface. The pinned PreTilt
ring instance uses a quotient of characteristic exactly p, which cannot hold
for the zero ring. The predicate therefore has an explicit subsingleton
branch. Its other branch uses the existing Fontaine map with its actual
nonunit-p and completeness instances. This adds no mathematical restriction:
if p is invertible in a p-adically complete separated ring, the ideal (p) is
the top ideal and the ring is subsingleton. No second Witt ring or totalized
Fontaine map is introduced to hide that issue.

## Q0:integral-algebra — the independent integral prefix

Use the normalization of BMS2 Definition 4.18. An integral perfectoid ring is
p-adically complete, has an element π with π^p=pa for a unit a, has surjective
Frobenius on R/p, and has a principal Fontaine kernel. The distinguished
generator and its nonzerodivisor property are theorems to establish; they are
not fields of the definition. The chosen π is existential data, not a global
orientation. A chosen generator of ker θ must likewise not become part of
the underlying ring unless a separate oriented object is explicitly needed.

The old aggregate identifier ending in
`semiperfectoid-quasisyntomic-and-qrsp-rings` is retained for this one definition.
This is an identifier-preserving refinement, not permission to own all four
notions in its old title. The semiperfectoid presentation says that an ordinary
derived p-complete ring S admits a surjection from an integral perfectoid R.
Quasisyntomic and quasiregular semiperfectoid conditions use the actual
cotangent complex, completed flatness and the bounded-torsion hypotheses
supplied by DD.0 and DD.5. Their accepted source text is retained in the
continuation register and routed to those owners.

The basic API exposes completeness, the root condition, the nonzero
characterization, invariance under ring equivalence, and agreement with
PerfectRing in characteristic p. The equivalence statement is supported by
two naturality lemmas. A ring map between p-complete rings preserves p-adic
congruences. Applying the baseline formula for sharp modulo p^(n+1) gives
untilt naturality. Reducing maps out of Witt vectors modulo p^n then lets the
baseline uniqueness theorem apply to a target where p really is nilpotent.
Equality on Teichmüller representatives follows from the sharp calculation.
Separation gives the desired equality in the complete target. The reduction
square relating the two ring maps is explicit in both statements.

The characteristic-p criterion is proved through the θ-kernel rather than
assumed. Suppose ker θ is generated by ξ. Because p maps to zero, write
p=ξa in the Witt ring. The first two Witt coordinates and the zeroth tilt
projection show that the zeroth coordinate of a maps to a unit. A compatible
inverse sequence detects units in inverse perfection. The Witt unit criterion
then makes a a unit, so ξ generates the same ideal as p. Notice where the
calculation occurs: p is zero in R, but the product equation is in W(R♭).
Cancelling p in R would destroy the argument.

The unit criterion for W(k), with k perfect of characteristic p, does not need
k to be a field. Its constant-coefficient kernel is (p), and its p-adic
completeness puts that ideal in the Jacobson radical. Lift an inverse of the
constant coefficient; the product differs from one by a Jacobson-radical
element and is therefore a unit. This is the missing general-ring statement
needed here. The baseline’s field-specialized discrete valuation ring result
is insufficient as a direct citation, although it is a useful consistency
check.

Once ker θ=(p), a tilt element whose zeroth coordinate vanishes has a
Teichmüller representative in (p), so the existing Witt kernel formula makes
the tilt element zero. Thus the tilt projection is injective. Surjectivity
comes from the integral predicate and the existing inverse-perfection theorem.
The characteristic-p ring is therefore its own perfect inverse perfection.
Conversely, a perfect ring has this same projection isomorphism, θ has kernel
(p), the ideal defining p-adic completion is zero, and π=0 supplies the root
condition. This proves the precise comparison with PerfectRing, including
nonfield examples such as F_p×F_p.

The tests distinguish each essential requirement. The zero ring tests the
typeclass boundary. F_p and its product test the positive cases and forbid an
accidental domain hypothesis. Z/4 at p=2 has a complete p-adic topology and
surjective Frobenius modulo p, but squares are 0 or 1 and cannot equal twice
an odd unit. F₂[t] fails Frobenius surjectivity. Dual numbers fail both
reducedness and Frobenius surjectivity. The sharper example is
A/(t), where A is the perfect closure of F₂[t]. Its squaring map is surjective,
yet the class of t^(1/2) is nonzero and square-zero. It therefore fails the
principal-kernel condition. A predicate that kept only completeness and
semiperfectness would incorrectly accept it.

BMS1 uses a presentation with π-adic completeness and π^p dividing p. Its
equivalence with the BMS2 normalization uses Lemma 3.9, including the
unit-adjusted compatible roots and the comparison of completions. That
normalization argument is recorded as required work. The general
nonzerodivisor theorem, the precise form of a distinguished kernel generator,
and bounded p-power torsion also remain required. BMS2 Proposition 4.19 gives
an elementary two-coefficient proof of the torsion bound; that proof provides
the intended early route. The alternative proof through v-descent is not an
input to this roadmap.

## Q0:animated-application and Q1 — supplier boundaries

RS-01 keeps the integral prefix independent and assigns general δ-ring and
prism algebra to PR.0. Import its free δ-algebras, distinguished elements,
prisms and morphisms, boundedness, orientations, regular envelopes and
completed perfection. The integral predicate constructed above is the input
on the ring side of the perfect-prism correspondence. That correspondence
must not be used to prove the integral predicate’s independent foundations.

The accepted Lemma 4.8 aggregate concerns maps out of a perfect prism. Its
uniqueness statement includes lifting a ring map on reductions to a prism map.
The p-torsion issue is real: Frobenius compatibility in a p-torsion target
does not alone make a map δ-compatible. The source factors through an inverse
Frobenius limit that is a perfect δ-ring and hence p-torsionfree. This part
needs its actual PR.0 carriers. The accepted review also corrected the proof
boundary: rigidity is used in Proposition 7.2, not in Lemma 4.8.

Q1 is a named reexport of PR.1. It consumes the bounded relative prismatic
site, its coverings and structure sheaf, the Čech–Alexander models, independence
of presentation and Frobenius naturality. The Hodge–Tate theorem is the
multiplicative comparison with the specified Breuil–Kisin twists. Its
polynomial calculation, localization and descent remain proof obligations.
Crystalline and de Rham constructions are supplied by CR.0–2 and DD, with
the exact hypotheses on envelopes and completion. The endpoint is not obtained
by importing the étale comparison theorem.

## Q2 and Q3 — universal prisms and the flat extension

For a semiperfectoid presentation R→S, Proposition 7.2 begins with A_inf(R)
and the generator d of its Fontaine kernel. Freely adjoin divisions f/d for
the kernel of A_inf(R)→S. The universal map to a prism is unique because d
is a nonzerodivisor there. Killing the δ-stable ideal generated by d-power
torsion and taking degree zero of derived completion preserves the relevant
mapping property, but completion can create new torsion. An ordinal iteration
is therefore part of the construction. Its stopping argument, size bounds and
compatibility with the chosen completion must be separate declarations.

The resulting initial object ranges over all prisms under S. It need not be
bounded and must not be identified with an object of the bounded absolute
prismatic site. Completed perfection and the PR.0 correspondence produce
universal perfectoidization. In Corollary 7.3 the reduction map is from S;
the printed R must either be replaced by S or explicitly required to factor
through the chosen quotient. This distinction preserves the kernel relations
that the construction is intended to impose.

PR.2 owns the derived extension of prismatic cohomology and the filtered
Hodge–Tate comparison. Q2 imports those constructions, their base change and
descent, and their discreteness results. Lemma 7.7 gives weak initiality
together with an idempotent retract; it does not assert that every discrete
prismatic cohomology ring is initial. The regular-quotient calculation retains
Koszul regularity and bounded p-torsion. The QRSP argument retains naturality
of the idempotents through its colimit reductions. These are precisely the
points identified in the accepted review, not replaceable by a typeclass
whose fields assume the desired theorem.

The Q3 extension adjoins roots of monic polynomials, lifts the resulting
quasisyntomic cover to a prism, perfects it, and iterates. Each limit step
must preserve perfectoidness, completeness and p-complete faithful flatness.
Absolute integral closedness is the statement that every monic polynomial
has a root. A compatible p-power-root sequence follows by successive choices,
applying this statement to X^p minus the preceding root. Unrelated roots of
X^(p^n) minus the original element do not by themselves form such a sequence.
The needed refinements of Examples 7.12–7.13 and Remark 7.15 belong to the
same source closure.

## Q4 — algebraic characteristic-p quotients and the full endpoint

For a perfect characteristic-p ring R, every quotient has surjective
Frobenius: lift an element, take its unique root upstairs, and reduce. The
quotient is perfect precisely when its ideal is radical. One implication
uses reducedness and the baseline perfect-ring criterion; the reverse
implication uses injectivity of all powers of Frobenius to kill nilpotents.
The zero quotient is handled explicitly because it has bijective p-th power
although its characteristic is not exactly p.

It follows that R/√I is integral perfectoid. If a map R→T kills I and T is
integral perfectoid, then p=0 in T. Either T is zero or it has characteristic
p and is perfect by the integral criterion. Thus T is reduced, every element
of √I maps to zero, and the baseline quotient lift gives a unique map from
R/√I. This also proves presentation independence through the universal
property. Surjectivity from R/I is the existing quotient-map theorem. There
is no finite-generation reduction in this algebraic specialization.

In the principal case, √(f) is the ideal generated by all inverse Frobenius
iterates of f. For the less immediate inclusion, if x^m=fc, choose p^n≥m,
rewrite x^(p^n) as a multiple of f, and apply inverse Frobenius n times.
The resulting expression makes x a multiple of f^(1/p^n). This argument
explains why quotienting by (f) can leave nilpotents, whereas killing all
compatible roots removes them. It also supplies direct tests at f=0 and f=1.

The full Theorem 7.4 requires more. Its reductions to a finitely generated
ideal and then a principal ideal occur inside the correctly completed
category. Passing to André’s extension requires a completed flat-base-change
theorem for perfectoidization and descent of surjectivity. A universal property
alone does not establish an arbitrary completed tensor formula. Nor can
Proposition 8.5 be used circularly: the accepted review checked that its proof
already uses Theorem 7.4 and asserts the same base-change compatibility.

For the analytic application retain a perfectoid Tate ring R and an explicit
ring of integral elements R+. Form the specified pseudouniformizer-completed
integral quotient, perfectoidize it, and justify the inversion step on the
existing P4 carriers. The plus ring is the appropriate integral closure of
the image, with the required openness. Almost surjectivity has direction
R+→R′+, not the reversed arrow in the printed ECD remark. General Tate rings
need not be over a chosen perfectoid field. A nonclosed ideal cannot silently
be substituted for its completed kernel.

The source register contains an awaiting-review proposal, PerfectoidSpaces/E33,
to add a pseudouniformizer completion in Remark 7.5. It is retained as a lead
inside the completion gap. Its reasoning about arbitrary characteristic-p
perfection does not alone settle the semiperfectoid quotient case here. The
rejected PerfectoidSpaces/E9 finding is also distinguished from an accepted
source correction: its expanded proof dependencies are useful, but the review
did not establish a source error. This blueprint does not change either
review verdict.

## Declaration catalogue

The following specifications are the declaration graph of this checkpoint.
Every named prerequisite resolves to another declaration below or to an
actually read statement in the pinned library. Each displayed API promotion
has one signature in the suggested file; it is not duplicated when listed
both on its definition and as a dependency node. The source aggregates and
supplier gaps following the catalogue remain outside that local closure.

### Integral perfectoid rings

Identifier: `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`. Proposed declaration: `TauCeti.PerfectoidQuotients.IsIntegralPerfectoid`.

Fix a prime p. A commutative ring R is integral perfectoid if it is the zero ring, or p is not a unit, R is classically p-adically complete and separated, there are π∈R and a∈R× with π^p=pa, Frobenius on R/p is surjective, and ker(θ:W(PreTilt(R,p))→R) is generated by one element. θ, PreTilt and W are the existing Mathlib constructions. The nonzero branch is exactly BMS2 Definition 4.18; completeness forces nonunit p for every nonzero R. No chosen generator, δ-structure, prism or desired comparison theorem is a field of the predicate.

Hypotheses: p is prime; all rings are commutative and unital. The zero ring is allowed. The integral predicate is independent of a topology on a Tate localization. Its p-adic completeness includes separation.

Proof or construction. Use the existing PreTilt, Fontaine map and ideal span in the nonunit-p branch. The zero-ring branch is explicit because the pinned PreTilt ring instance uses a nontrivial characteristic-p quotient. If a p-adically complete ring has p invertible, its p-adic ideal is top and IsAdicComplete.subsingleton makes it the zero ring; thus the branch condition does not exclude an object of BMS2. The original aggregate identifier is retained for this single definition. Quasisyntomic and quasiregular semiperfectoid predicates are transferred to their DD.0/DD.5 supplier contracts; their accepted source statements remain in inheritedWork.

Dependencies: `mathlib:IsAdicComplete`, `mathlib:IsAdicComplete.subsingleton`, `mathlib:PreTilt`, `mathlib:WittVector.fontaineTheta`.

API:

- `TauCeti.PerfectoidQuotients.IsIntegralPerfectoid.of_subsingleton` (example): Every zero ring is integral perfectoid.
- `TauCeti.PerfectoidQuotients.IsIntegralPerfectoid.complete` (projection): An integral perfectoid R is classically p-adically complete and separated.
- `TauCeti.PerfectoidQuotients.IsIntegralPerfectoid.has_p_root` (projection): There exist π in R and a unit a with π^p=pa.
- `TauCeti.PerfectoidQuotients.IsIntegralPerfectoid.iff_nontrivial` (characterisation): With the existing nonunit-p and completeness instances, the predicate is exactly the root condition, Frobenius surjectivity on ModP, and a principal kernel of the existing Fontaine map.
- `TauCeti.PerfectoidQuotients.IsIntegralPerfectoid.congr` (equivalence): A ring equivalence R≃S preserves and reflects the predicate, with p fixed.
- `TauCeti.PerfectoidQuotients.integralPerfectoid_iff_perfect` (compatibility): For a ring of characteristic exactly p, integral perfectoidness is equivalent to Mathlib PerfectRing R p.

Tests:

- `TauCeti.PerfectoidQuotients.zeroRing`: ZMod 1 is integral perfectoid for every prime p.
- `TauCeti.PerfectoidQuotients.primeField`: ZMod p is integral perfectoid for every prime p.
- `TauCeti.PerfectoidQuotients.zmodFour`: ZMod 4 is not integral perfectoid at p=2: no π and odd unit a satisfy π²=2a.
- `TauCeti.PerfectoidQuotients.polynomial`: F₂[t] is not integral perfectoid at 2: Frobenius misses t.
- `TauCeti.PerfectoidQuotients.dualNumbers`: TrivSqZeroExt F₂ F₂ is not integral perfectoid: its nonzero square-zero element is not a square.
- `TauCeti.PerfectoidQuotients.semiperfectNotPerfect`: If A=PerfectClosure(F₂[t],2) and t denotes the image of the polynomial variable, A/(t) is not integral perfectoid although its squaring map is surjective. The class t^(1/2) is nonzero and square-zero.
- `TauCeti.PerfectoidQuotients.semiperfectSquaring`: Squaring is surjective on PerfectClosure(F₂[t],2)/(t); this separates the principal-kernel condition from Frobenius surjectivity.
- `TauCeti.PerfectoidQuotients.productField`: F_p × F_p is integral perfectoid, so a domain or valuation-ring condition would be too strong.
- `TauCeti.PerfectoidQuotients.perfectRingAgreement`: Every ring of characteristic p with the baseline PerfectRing instance satisfies the predicate.

Acceptance: The zero ring, F_p and F_p×F_p pass. Z/4, F₂[t], dual numbers and the semiperfect root quotient fail for distinct stated reasons.

Sources: bms2-thh-2019, Definition 4.18, p.22. Exact definition; the zero-ring separation is a library-interface adaptation, not a change of mathematical scope.

### The nonzero integral-perfectoid criterion

Identifier: `PerfectoidQuotients:Q0:integral-algebra/integral-perfectoid-nontrivial-criterion`. Proposed declaration: `TauCeti.PerfectoidQuotients.IsIntegralPerfectoid.iff_nontrivial`.

If p is not a unit in the classically p-complete ring R, integral perfectoidness is equivalent to the three remaining BMS2 conditions: π^p=pa for a unit a, surjective Frobenius on ModP R p, and principal ker θ.

Hypotheses: p prime; the actual nonunit-p and IsAdicComplete instances are supplied.

Proof or construction. The nonunit assumption rules out the subsingleton branch, because every element of a zero ring is a unit. Unpack the existential proof instances and use proof irrelevance; the Fontaine map and its ideal do not depend on which proofs supply the instances.

Dependencies: `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`.

Acceptance: Changing witnesses for completeness or nonunit p does not change the predicate.

Sources: bms2-thh-2019, Definition 4.18, p.22. API promotion used in the characteristic-p equivalence.

### Units in inverse perfection

Identifier: `PerfectoidQuotients:Q0:integral-algebra/inverse-perfection-unit-criterion`. Proposed declaration: `TauCeti.PerfectoidQuotients.perfection_isUnit_iff`.

For a ring R of characteristic p and x∈Perfection(R,p), x is a unit if and only if its zeroth coordinate is a unit.

Hypotheses: p prime; R a commutative ring of characteristic p; no surjectivity of its Frobenius is assumed.

Proof or construction. A ring map preserves units, giving the forward implication. If x₀ is a unit, each x_n is a unit because x_n^(p^n)=x₀. Their inverses form a compatible Frobenius sequence; pointwise multiplication exhibits the inverse of x in the existing Perfection ring.

Dependencies: `mathlib:Perfection.coeff_pow_p`.

Acceptance: A sequence with zeroth coordinate 1 is a unit. This is inverse-limit perfection, not adjoining roots by a direct limit.

Sources: bms1-integral-2018, Lemma 3.10 proof, p.23, unit detection in S♭. The proof uses unit detection in the inverse limit; the general statement is extracted from the coordinate argument.

### Units in Witt vectors over a perfect ring

Identifier: `PerfectoidQuotients:Q0:integral-algebra/perfect-witt-unit-criterion`. Proposed declaration: `TauCeti.PerfectoidQuotients.witt_isUnit_iff`.

For a perfect ring k of characteristic p, w∈W(k) is a unit if and only if w₀ is a unit of k.

Hypotheses: k is an arbitrary perfect commutative ring of characteristic p, not necessarily a field.

Proof or construction. The constant-coefficient map preserves units. For the converse lift an inverse of w₀ through the surjective constant-coefficient map. The product differs from 1 by an element of (p), by the baseline kernel formula. Witt p-adic completeness puts (p) in the Jacobson radical. The baseline Jacobson unit criterion makes the product a unit, and hence w is a unit.

Dependencies: `mathlib:WittVector.ker_constantCoeff`, `mathlib:WittVector.constantCoeff_surjective`, `mathlib:WittVector.isAdicCompleteIdealSpanP`, `mathlib:IsAdicComplete.le_jacobson_bot`, `mathlib:Ideal.isUnit_of_sub_one_mem_jacobson_bot`.

Acceptance: p is not a unit in W(k) when k has characteristic exactly p; 1+p is a unit.

Sources: bms1-integral-2018, Lemma 3.10 proof, p.23, deduction that a is a unit. Supplies the general-ring unit test used by the kernel-generator argument; the pinned DVR file only has a field-specialized test.

### The first Witt product coordinate in characteristic p

Identifier: `PerfectoidQuotients:Q0:integral-algebra/witt-product-first-coordinate`. Proposed declaration: `TauCeti.PerfectoidQuotients.witt_mul_coeff_one`.

For x,y∈W(k) with k of characteristic p, (xy)₁=x₀^p y₁+x₁ y₀^p.

Hypotheses: p prime; k a commutative characteristic-p ring. Perfection of k is not needed.

Proof or construction. Compute the first two universal Witt multiplication polynomials over the integer polynomial ring using ghost degrees zero and one. The degree-one expression is x₀^p y₁+x₁ y₀^p+p x₁y₁. Evaluate in k; its characteristic-p hypothesis kills the last term. Cancellation of p is used only in the universal torsion-free polynomial calculation.

Dependencies: `mathlib:WittVector.mul_coeff`.

Acceptance: The formula remains valid over nonreduced characteristic-p rings; it must not be asserted over an arbitrary mixed-characteristic coefficient ring.

Sources: bms1-integral-2018, Lemma 3.10 proof, p.23, first two Witt coordinates of ξ′a. The displayed degree-one coordinate is exactly the formula used here.

### A principal θ-kernel in characteristic p is generated by p

Identifier: `PerfectoidQuotients:Q0:integral-algebra/theta-kernel-characteristic-p`. Proposed declaration: `TauCeti.PerfectoidQuotients.theta_kernel_charP`.

Let R have characteristic p. Assume the pinned completeness and nonunit-p instances and that ker θ is principal. Then ker θ=(p) inside W(PreTilt(R,p)). Frobenius surjectivity on R is not required for this implication.

Hypotheses: p prime; R a commutative characteristic-p ring with the indicated instances.

Proof or construction. Choose ξ generating ker θ. Since p maps to zero, write p=ξa. The existing θ-mod-p formula gives c₀(ξ₀)=0, where c₀:PreTilt(R,p)→R/p. Apply c₀ to the first Witt product coordinate. Since p₁=1, obtain 1=c₀(ξ₁)c₀(a₀)^p. Thus c₀(a₀) is a unit. The inverse-perfection unit criterion makes a₀ a unit; the perfect-Witt unit criterion makes a a unit. Therefore ξ and p generate the same ideal. This is the characteristic-p specialization of the generator argument, so no general prism correspondence is imported.

Dependencies: `PerfectoidQuotients:Q0:integral-algebra/inverse-perfection-unit-criterion`, `PerfectoidQuotients:Q0:integral-algebra/perfect-witt-unit-criterion`, `PerfectoidQuotients:Q0:integral-algebra/witt-product-first-coordinate`, `mathlib:WittVector.mk_fontaineTheta`, `mathlib:WittVector.coeff_p_one`.

Acceptance: No p-torsion cancellation is performed in R. The conclusion concerns the kernel in its Witt ring.

Sources: bms1-integral-2018, Lemma 3.10 proof, p.23, and Example 3.15, p.24. Specializes the primitive-generator proof to π=0; all coefficient steps are recorded separately.

### Injectivity of the characteristic-p tilt projection

Identifier: `PerfectoidQuotients:Q0:integral-algebra/tilt-projection-injective-characteristic-p`. Proposed declaration: `TauCeti.PerfectoidQuotients.tilt_projection_injective_charP`.

Under the hypotheses of the preceding kernel lemma, the zeroth-coordinate map PreTilt(R,p)→R/p is injective.

Hypotheses: R has characteristic exactly p; ker θ principal; existing θ hypotheses.

Proof or construction. If x has zeroth coordinate zero, θ([x]) is zero because R/p=R and the baseline θ-mod-p formula identifies its reduction. Then [x] belongs to ker θ=(p). The baseline constant-coefficient kernel formula forces x=0. A ring homomorphism with zero kernel is injective.

Dependencies: `PerfectoidQuotients:Q0:integral-algebra/theta-kernel-characteristic-p`, `mathlib:WittVector.mk_fontaineTheta`, `mathlib:WittVector.ker_constantCoeff`.

Acceptance: For a semiperfect nonreduced ring the projection is surjective but not injective, so its θ-kernel cannot be principal.

Sources: bms1-integral-2018, Example 3.15, p.24. Expands the equality S=A_inf(S)/p=S♭ into the missing injectivity declaration.

### Naturality of the multiplicative untilt

Identifier: `PerfectoidQuotients:Q0:integral-algebra/untilt-naturality`. Proposed declaration: `TauCeti.PerfectoidQuotients.untilt_natural`.

For a ring map f:R→S between classically p-complete rings with p nonunit, let g:R/p→S/p commute with the quotient maps and f. For every x∈PreTilt(R,p), f(x♯)=(Perfection.map(g)(x))♯.

Hypotheses: p prime; the commuting reduction square is a hypothesis and is retained in the suggested signature.

Proof or construction. Choose lifts of each coordinate of x. Their images under f lift the corresponding coordinates of Perfection.map(g)(x), by the commuting square. The baseline Teichmüller congruence determines each sharp modulo p^(n+1) by the p^n-th power of a lift. Apply f to those congruences. p-adic separation of S identifies the two elements. No topological structure is added: a ring map sends p^nR into p^nS.

Dependencies: `mathlib:PreTilt.untilt`, `mathlib:Perfection.map`, `mathlib:Perfection.coeff_map`, `mathlib:Perfection.teichmuller_sModEq`, `mathlib:IsHausdorff.eq_iff_smodEq`.

Acceptance: For identity and composite ring maps the equality agrees with the existing Perfection.map functoriality.

Sources: bms1-integral-2018, Definition 3.1 and Lemma 3.2 statement, p.19; naturality of the construction. Packet-derived functoriality from the baseline congruence formula; no unread proof of Lemma 3.2 is claimed.

### Naturality of Fontaine’s map

Identifier: `PerfectoidQuotients:Q0:integral-algebra/theta-naturality`. Proposed declaration: `TauCeti.PerfectoidQuotients.theta_natural`.

With f and g as in untilt naturality, f(θ_R(w))=θ_S(W(g♭)(w)) for all w∈W(PreTilt(R,p)).

Hypotheses: The two rings are classically p-complete, p is nonunit in each, and g is the map induced by f modulo p.

Proof or construction. Reduce both ring maps to S/p^n. The prime is nilpotent in that target. Use the baseline equality criterion for maps out of Witt vectors into a p-nilpotent ring: equality on Teichmüller representatives suffices. θ([x])=x♯ and untilt naturality give that equality. Apply p-adic separation of S. The nilpotence hypothesis is used only after reduction, never asserted in S.

Dependencies: `PerfectoidQuotients:Q0:integral-algebra/untilt-naturality`, `mathlib:WittVector.map`, `mathlib:WittVector.fontaineTheta_teichmuller`, `mathlib:WittVector.eq_of_apply_teichmuller_eq`, `mathlib:IsHausdorff.eq_iff_smodEq`.

Acceptance: The reduction square is essential; the prototype explicitly includes it rather than allowing Lean to drop an unused section hypothesis.

Sources: bms1-integral-2018, §3.1, Definition 3.1 and Lemma 3.4, pp.19–21. Ring-map naturality is derived from the existing Mathlib construction; Lemma 3.4 supplies the surrounding θ convention, not a verbatim statement of this lemma.

### Invariance under ring equivalence

Identifier: `PerfectoidQuotients:Q0:integral-algebra/integral-perfectoid-ring-equivalence`. Proposed declaration: `TauCeti.PerfectoidQuotients.IsIntegralPerfectoid.congr`.

For every ring equivalence e:R≃S, integral perfectoidness of R at p is equivalent to that of S at p.

Hypotheses: p prime; commutative unital rings; the zero ring is included.

Proof or construction. Transport the subsingleton case directly. Otherwise transport completeness along the bijection of p-adic congruence systems, and the root/unit and Frobenius-surjectivity conditions along e. The induced maps modulo p, on inverse perfection, and on Witt vectors are equivalences because the inverse ring map gives their inverses. θ naturality identifies the two kernels, so principal generation transfers in both directions.

Dependencies: `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`, `PerfectoidQuotients:Q0:integral-algebra/theta-naturality`, `mathlib:Ideal.quotientMap`, `mathlib:Perfection.map`, `mathlib:WittVector.map`, `mathlib:IsAdicComplete`.

Acceptance: Changing the presentation of F_p or its finite product does not change perfectoidness.

Sources: bms2-thh-2019, Definition 4.18, p.22. A presentation-independent predicate on rings; the transport proof uses the named naturality nodes.

### Integral perfectoidness in characteristic p

Identifier: `PerfectoidQuotients:Q0:integral-algebra/characteristic-p-perfectoid-criterion`. Proposed declaration: `TauCeti.PerfectoidQuotients.integralPerfectoid_iff_perfect`.

A commutative ring of characteristic exactly p is integral perfectoid if and only if it satisfies Mathlib PerfectRing R p, namely bijectivity of the p-th-power map.

Hypotheses: p prime; characteristic exactly p gives a nonzero ring. The zero-ring statement is separately part of the definition API.

Proof or construction. For a perfectoid R, use the nontrivial criterion. Frobenius surjectivity gives surjectivity of the tilt projection by Perfection.coeff_surjective. The principal-kernel lemma gives injectivity. Thus R/p=R is isomorphic to its perfect inverse perfection. Conversely, if R is perfect, the projection from its inverse perfection is bijective: existence uses successive unique roots, and uniqueness follows from injectivity of their powers. Under R/p=R, the existing θ formula is the constant-coefficient map followed by this bijection. Its kernel is (p) by the baseline Witt kernel formula. The p-adic ideal is zero, so R is complete, and π=0 with unit 1 supplies the root condition.

Dependencies: `PerfectoidQuotients:Q0:integral-algebra/integral-perfectoid-nontrivial-criterion`, `PerfectoidQuotients:Q0:integral-algebra/tilt-projection-injective-characteristic-p`, `mathlib:Perfection.coeff_surjective`, `mathlib:PerfectRing`, `mathlib:Perfection.lift`, `mathlib:WittVector.mk_fontaineTheta`, `mathlib:WittVector.ker_constantCoeff`, `mathlib:IsAdicComplete`.

Acceptance: F_p×F_p passes; F₂[t] and F₂[ε]/ε² fail. The semiperfect quotient of the perfect closure of F₂[t] also fails.

Sources: bms1-integral-2018, Example 3.15, p.24, with Lemma 3.10 proof, p.23. Exact characteristic-p equivalence, expanded to the pinned carriers.

### Surjectivity of powers on a quotient

Identifier: `PerfectoidQuotients:Q4/quotient-frobenius-surjective`. Proposed declaration: `TauCeti.PerfectoidQuotients.quotient_pow_surjective`.

If the p-th-power function on a commutative ring R is surjective, its p-th-power function on R/I is surjective for every ideal I.

Hypotheses: p prime in the roadmap specialization. The argument itself needs no characteristic or reducedness assumption.

Proof or construction. Lift a quotient element to r∈R using the existing surjective quotient map. Choose a p-th root s of r. Its class is a p-th root of the given quotient element.

Dependencies: `mathlib:Ideal.Quotient.mk_surjective`.

Acceptance: It holds even for the semiperfect nonreduced quotient A/(t), so surjectivity alone cannot be the target perfectoid criterion.

Sources: bs-prisms-2022, Theorem 7.4 and its proof, pp.56 and 62. Elementary characteristic-p specialization used in the quotient proof; source-derived bookkeeping, not a separately named theorem in BS22.

### Perfect quotients of a perfect characteristic-p ring

Identifier: `PerfectoidQuotients:Q4/perfect-quotient-radical-criterion`. Proposed declaration: `TauCeti.PerfectoidQuotients.quotient_perfect_iff_radical`.

For a perfect ring R of characteristic p and any ideal I, PerfectRing(R/I,p) holds if and only if I is radical. This includes I=R and its zero quotient.

Hypotheses: p prime; R a perfect commutative ring of characteristic exactly p; no properness or finite-generation condition on I.

Proof or construction. The quotient power map is surjective by quotient-frobenius-surjective. If I is radical then R/I is reduced; split off the zero ring, and in the nonzero case give the quotient characteristic p and apply PerfectRing.ofSurjective. Conversely, bijectivity of the p-th power implies that no nonzero element of the quotient is nilpotent: choose p^n at least the nilpotence exponent and use injectivity repeatedly. The existing radical/reduced-quotient equivalence gives radicality of I.

Dependencies: `PerfectoidQuotients:Q4/quotient-frobenius-surjective`, `mathlib:Ideal.isRadical_iff_quotient_reduced`, `mathlib:PerfectRing.ofSurjective`, `mathlib:CharP.charP_iff_prime_eq_zero`.

Acceptance: The top ideal gives the zero ring, which still has bijective p-th power. Nonradical ideals fail injectivity.

Sources: bms1-integral-2018, Example 3.15, p.24. Packet-derived elementary quotient criterion supporting the BS22 characteristic-p application.; bs-prisms-2022, Theorem 7.4 and its proof, pp.56 and 62. Specialization to quotients of perfect characteristic-p rings.

### The radical quotient is integral perfectoid

Identifier: `PerfectoidQuotients:Q4/radical-quotient-integral-perfectoid`. Proposed declaration: `TauCeti.PerfectoidQuotients.radical_quotient_integralPerfectoid`.

For a perfect characteristic-p ring R and any ideal I, R/√I is integral perfectoid at p, including the zero quotient.

Hypotheses: p prime; R perfect of characteristic p.

Proof or construction. The radical is radical in the existing ideal API. The perfect-quotient criterion gives PerfectRing(R/√I,p). If the quotient is zero use the explicit zero-ring branch. Otherwise the map from R gives characteristic p, and the characteristic-p perfectoid criterion applies.

Dependencies: `PerfectoidQuotients:Q4/perfect-quotient-radical-criterion`, `PerfectoidQuotients:Q0:integral-algebra/characteristic-p-perfectoid-criterion`, `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`, `mathlib:Ideal.radical_isRadical`, `mathlib:CharP.charP_iff_prime_eq_zero`.

Acceptance: For I=0 the quotient is R; for I=R it is the zero ring.

Sources: bs-prisms-2022, Theorem 7.4 and its proof, pp.56 and 62. Candidate perfectoidization in characteristic p, combined with BMS1 Example 3.15.

### Perfectoidization of a characteristic-p quotient

Identifier: `PerfectoidQuotients:Q4/characteristic-p-perfectoidization-universal`. Proposed declaration: `TauCeti.PerfectoidQuotients.radical_quotient_universal`.

Let R be a perfect ring of characteristic p and I an arbitrary ideal. For every integral perfectoid ring T and ring map f:R→T killing I, there is a unique ring map g:R/√I→T with g composed with the quotient map equal to f. Together with the preceding perfectoidness lemma and the existing surjective map R/I→R/√I, this identifies R/√I as the universal integral perfectoid ring under R/I.

Hypotheses: No characteristic assumption is imposed on T: the given ring map forces p=0 in T. The zero target is allowed.

Proof or construction. If T is zero the factorization is unique. Otherwise f(p)=0 gives characteristic p; the integral-perfectoid criterion makes T perfect, hence reduced. Every element of √I maps to a nilpotent and hence to zero in T. Apply the existing Ideal.Quotient.lift to f. The quotient map from R is surjective, so the lift is unique. Apply Ideal.quotientMap_surjective to the identity of R and I≤√I for the surjectivity from R/I. No transfinite prism, completed base change or André theorem enters this specialization.

Dependencies: `PerfectoidQuotients:Q4/radical-quotient-integral-perfectoid`, `PerfectoidQuotients:Q0:integral-algebra/characteristic-p-perfectoid-criterion`, `mathlib:CharP.charP_iff_prime_eq_zero`, `mathlib:Ideal.Quotient.lift`, `mathlib:Ideal.Quotient.mk_surjective`, `mathlib:Ideal.quotientMap_surjective`, `mathlib:Ideal.radical`.

Acceptance: Surjectivity is a statement about the canonical quotient map, not an abstract existence of a perfectoid target. It works for infinitely generated I.

Sources: bs-prisms-2022, Theorem 7.4 and its proof, pp.56 and 62. Explicit characteristic-p proof of the universal-property and surjectivity specialization; no claim to close the mixed-characteristic theorem.

### The ideal of all roots of a principal element

Identifier: `PerfectoidQuotients:Q4/compatible-root-ideal-radical`. Proposed declaration: `TauCeti.PerfectoidQuotients.root_span_eq_radical`.

In a perfect ring R of characteristic p, for f∈R the ideal generated by φ^(−n)(f), n≥0, equals √(f). Roots here are supplied by the inverse of the existing Frobenius ring equivalence.

Hypotheses: p prime; R perfect of characteristic p. This is an algebraic ideal with no topology attached.

Proof or construction. Every listed root has p^n-th power f, so belongs to √(f). If x^m belongs to (f), choose n with p^n≥m, and write x^(p^n)=fc. Apply the inverse n-th Frobenius to obtain x=φ^(−n)(f)φ^(−n)(c), proving membership in the root ideal. Both inclusions hold for arbitrary f, including zero and units. The fixed-root sequence has exact compatibility, not independently chosen roots.

Dependencies: `mathlib:frobeniusEquiv`, `mathlib:frobeniusEquiv_symm_pow_p`, `mathlib:Ideal.radical`.

Acceptance: For f=0 the ideal is zero; for f=1 it is top; every compatible root maps to zero in the radical quotient.

Sources: bs-prisms-2022, Theorem 7.4 and its proof, pp.56 and 62. The root-ideal description in the printed principal-case proof, specialized to characteristic p and supplied with an elementary algebraic argument.

### Which algebraic quotients stay integral perfectoid

Identifier: `PerfectoidQuotients:Q4/integral-perfectoid-quotient-radical-criterion`. Proposed declaration: `TauCeti.PerfectoidQuotients.quotient_perfectoid_iff_radical`.

For a perfect characteristic-p ring R and any ideal I, R/I is integral perfectoid at p if and only if I is radical.

Hypotheses: p prime; characteristic-p perfect source; arbitrary ideal, including top.

Proof or construction. Split the zero quotient. The ideal is then top and radical, and the zero ring is integral perfectoid. For a nonzero quotient, transfer characteristic p along the quotient map. Apply the characteristic-p integral-perfectoid criterion followed by the perfect-quotient radical criterion.

Dependencies: `PerfectoidQuotients:Q4/perfect-quotient-radical-criterion`, `PerfectoidQuotients:Q0:integral-algebra/characteristic-p-perfectoid-criterion`, `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`, `mathlib:CharP.charP_iff_prime_eq_zero`.

Acceptance: For A=F₂[t^(1/2^∞)], the ideal (t) is not radical because t^(1/2) is outside it but has square in it. Its quotient is semiperfect but not integral perfectoid.

Sources: bms1-integral-2018, Example 3.15, p.24. Exact algebraic quotient application; no Tate or completed-quotient assertion.; bs-prisms-2022, Theorem 7.4 and its proof, pp.56 and 62. Acceptance criterion for the characteristic-p surjectivity route.

## Continuation ledger and preserved source work

The packet preserves the complete text, links and gaps of all twelve accepted aggregates. Their source statements remain requirements, subject to the accepted corrections. Only the integral-predicate identifier is refined into this declaration graph. The following inventory makes the exact resumption points visible without treating the aggregates as finished declarations.

- `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`: Integral perfectoid, semiperfectoid, quasisyntomic and quasiregular semiperfectoid rings. The integral predicate is now specified above; route quasisyntomic and QRSP conditions to DD.0/DD.5, and establish the BMS1/BMS2 normalization.
- `PerfectoidQuotients:Q0:animated-application/perfect-prism-is-initial-over-its-perfectoid-ring`: Maps out of a perfect prism are determined by their reduction: (A_inf(R), ker θ) is initial in (R)_Δ. Retain its verified locator, hypotheses and corrected tests while splitting the proof into declarations on the actual supplier carriers.
- `PerfectoidQuotients:Q2/initial-prism-of-a-semiperfectoid-ring`: The category of prisms under a semiperfectoid ring has an initial object with principal ideal. Retain its verified locator, hypotheses and corrected tests while splitting the proof into declarations on the actual supplier carriers.
- `PerfectoidQuotients:Q2/universal-perfectoidization`: Universal perfectoid ring S_perfd under a semiperfectoid ring. Retain its verified locator, hypotheses and corrected tests while splitting the proof into declarations on the actual supplier carriers.
- `PerfectoidQuotients:Q2/derived-prismatic-cohomology-and-hodge-tate-filtration`: Derived prismatic cohomology by left Kan extension, with its Hodge-Tate filtration and formal properties. This is PR.2 supplier content under RS-01. Preserve its ID as the inherited import obligation; do not create a second local construction.
- `PerfectoidQuotients:Q2/discrete-derived-prismatic-cohomology-gives-a-weakly-initial-prism`: When Δ_{R/A} is discrete it is a δ-ring, a prism over (A, I), and weakly initial with an idempotent retract that is initial. This is PR.2 supplier content under RS-01. Preserve its ID as the inherited import obligation; do not create a second local construction.
- `PerfectoidQuotients:Q2/lci-quotient-prism-is-initial`: For a Koszul-regular quotient R = A/(I, f_1, ..., f_r) with bounded p-torsion, Δ_{R/A} is the prismatic envelope and initial. This is PR.2 supplier content under RS-01. Preserve its ID as the inherited import obligation; do not create a second local construction.
- `PerfectoidQuotients:Q2/qrsp-derived-prismatic-cohomology-is-the-initial-prism`: For quasiregular semiperfectoid S, Δ_{S/A} is discrete, equals the initial prism Δ^init_S independently of the perfectoid R, and S → Δ̄_S is p-completely faithfully flat. This is PR.2 supplier content under RS-01. Preserve its ID as the inherited import obligation; do not create a second local construction.
- `PerfectoidQuotients:Q3/lifting-quasisyntomic-covers-to-prisms`: A quasisyntomic A/I-algebra admits a prism (B, IB) over (A, I) with R → B/IB p-completely faithfully flat; flatness of the (perfected) prism. Retain its verified locator, hypotheses and corrected tests while splitting the proof into declarations on the actual supplier carriers.
- `PerfectoidQuotients:Q3/andre-flatness-lemma`: Andre's flatness lemma: every perfectoid ring has a p-completely faithfully flat absolutely integrally closed perfectoid extension. Retain its verified locator, hypotheses and corrected tests while splitting the proof into declarations on the actual supplier carriers.
- `PerfectoidQuotients:Q4/surjectivity-of-perfectoidization`: S → S_perfd is surjective for every semiperfectoid S. Retain its verified locator, hypotheses and corrected tests while splitting the proof into declarations on the actual supplier carriers.
- `PerfectoidQuotients:Q4/zariski-closed-subsets-are-strongly-zariski-closed`: Closed perfectoid quotients: the vanishing locus of an ideal in an affinoid perfectoid space is strongly Zariski closed. Retain its verified locator, hypotheses and corrected tests while splitting the proof into declarations on the actual supplier carriers.

Stage coverage and exact remaining work:

### PerfectoidQuotients:Q0

- Container scope: the new integral predicate and characteristic-p algebraic quotient prefix are specified. The BMS1/BMS2 comparison, general θ-kernel structure and all remaining stages below are required.

### PerfectoidQuotients:Q0:animated-application

- Refine the accepted Lemma 4.8 aggregate against actual PR.0 prism carriers, including the inverse-Frobenius factorization needed for δ-compatibility in a p-torsion target. Import free δ-rings, distinguished elements, prisms, boundedness, orientations and completed perfection once from PR.0.
- The E5 animation and DD.0–1 cotangent, derived powers and completion contracts remain required; no strict commutative-DGA substitution in characteristic p.

### PerfectoidQuotients:Q0:integral-algebra

- Normalize BMS1 Definition 3.5 to BMS2 Definition 4.18 using Lemma 3.9, including p-adic versus π-adic completeness; spell out the general principal-kernel, nonzerodivisor and bounded-torsion statements. The new characteristic-p argument does not supply them.
- Resolve the P1 comparison lead at its recorded node IDs, whose packet has needs_changes review. Retain general Tate rings, explicit plus rings, boundedness in the converse and the nonzerodivisor in BMS1 Lemma 3.21.
- DD.0/DD.5 own the quasisyntomic and QRSP definitions extracted in the old aggregate. Restore their exact accepted O_C/p test through supplier nodes; it is QRSP.

### PerfectoidQuotients:Q1

- Q1 is a PR.1 reexport. Obtain the bounded relative site, covers, structure sheaf, Čech–Alexander presentation independence and Frobenius, and Theorem 6.3 with its multiplicative map and twists, not the étale comparison.

### PerfectoidQuotients:Q2

- Refine Proposition 7.2 into adjoining, δ-stable torsion removal, derived completion, ordinal iteration and initiality declarations. Distinguish all prisms from the bounded site.
- Import PR.2 Construction 7.6 and Lemmas 7.7–7.10, retaining the retract/idempotent argument, bounded torsion and Koszul regularity.
- Establish completed flat base change of perfectoidization and descent of surjectivity without citing Proposition 8.5 circularly.

### PerfectoidQuotients:Q3

- Decompose Proposition 7.11, completed perfection preserving faithful flatness, the monic-root extension and limit-stage/size claims of Theorem 7.14. Include Examples 7.12–7.13 and the needed Remark 7.15 refinement.
- Compatible roots must be chosen successively; no v-descent or Q4 theorem may enter this early route.

### PerfectoidQuotients:Q4

- The characteristic-p algebraic quotient prefix is specified; complete the arbitrary semiperfectoid theorem using correctly completed filtered colimits, principal reduction, Q2 base change and faithful-flat descent after André.
- For Remark 7.5 and ECD 5.8, prove the pseudouniformizer completion and plus-ring statements on P4 carriers. Assess the unreviewed PerfectoidSpaces/E33 lead about characteristic-p completion; do not promote its proposed fix as established.
- Prove the analytic universal property, surjectivity after inversion, plus-ring integral closure and integral almost surjectivity, preserving the nonclosed-ideal acceptance test.

## Supplier requests

- `PrismaticCohomology:PR.0`: The actual free δ-ring, prism, boundedness, rigidity, completed-perfection and perfect-prism/integral-perfectoid correspondence declarations, with regular-envelope hypotheses. The algebraic δ-prefix packet is a lead; no general prism carrier is yet imported as implemented. Consumers: `PerfectoidQuotients:Q0:animated-application`, `PerfectoidQuotients:Q2`.
- `PrismaticCohomology:PR.1`: The complete Q1 reexport contract: bounded relative site and structure sheaf, covers, Čech–Alexander models and Theorem 6.3 with twists, multiplicative comparison and descent. Consumers: `PerfectoidQuotients:Q1`.
- `PrismaticCohomology:PR.2`: Derived left Kan extension (7.6), filtered Hodge–Tate comparison, base change, discreteness/δ-structure, idempotent retract, regular and QRSP initiality (7.7–7.10). Consumers: `PerfectoidQuotients:Q2`, `PerfectoidQuotients:Q3`.
- `DerivedDeRhamCohomology:DD.0`: Full cotangent complexes, derived exterior powers and mod-p Tor-amplitude criteria defining quasisyntomic and QRSP rings, beyond the ordinary differential prefix. Consumers: `PerfectoidQuotients:Q0:integral-algebra`, `PerfectoidQuotients:Q0:animated-application`, `PerfectoidQuotients:Q2`.
- `DerivedDeRhamCohomology:DD.1`: Derived completion of rings/modules, comparison with classical completion under bounded torsion, completed colimits and base change at the ordinal and descent steps. Consumers: `PerfectoidQuotients:Q0:integral-algebra`, `PerfectoidQuotients:Q2`, `PerfectoidQuotients:Q3`, `PerfectoidQuotients:Q4`.
- `DerivedDeRhamCohomology:DD.5`: Quasisyntomic site and compatible-root QRSP covers with the exact bounded torsion/amplitude hypotheses; O_C/p is an included QRSP example. Consumers: `PerfectoidQuotients:Q0:integral-algebra`, `PerfectoidQuotients:Q3`.
- `EnhancedDerivedSheaves:E5:animation`: The actual simplicial commutative/animated algebra carrier, polynomial resolutions and coherent sifted Kan extension, with its comparison to commutative algebra objects. Consumers: `PerfectoidQuotients:Q0:animated-application`, `PerfectoidQuotients:Q2`.

## Source versions and corrections

The [published BMS2 article](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), pp.226–227, was also read for Definition 4.18 and both proofs of Proposition 4.19; p.227 was rendered and visually checked. Its SHA-256 is `6b43d1ff3c3f345db85100562a30c2bcbb6fcbfc2874ce899f8b4ded23ff23dd`. The comparison is restricted to this passage.

Public versions were obtained during 26–27 September 2026. The three freshly acquired preprint hashes match the corresponding hashes in the integrated decomposition. The ECD record is inherited from its accepted review; its supplied revision is not silently replaced by a live version with different numbering. The current reading limits below distinguish fresh proof reading from inherited source evidence.

- **Prisms and prismatic cohomology**, Bhargav Bhatt, Peter Scholze. arXiv:1905.08229v4, 12 January 2022; public PDF, hash matches the integrated extraction. [Source](https://arxiv.org/pdf/1905.08229v4). SHA-256 `1d91a6eb85828feb73f84ab3b27ced17514f0855d61c3bff71ab9d8287891e4a`. Fresh: pp.55–56 (Notation 7.1, Proposition 7.2 with proof, Corollary 7.3, Theorem 7.4 statement, Remark 7.5, opening of Construction 7.6) and p.62 (Remark 7.15 and full proof of Theorem 7.4). Page 56 also rendered. Remaining §7 evidence is retained from the accepted decomposition, not claimed as a fresh complete reading.
- **Topological Hochschild homology and integral p-adic Hodge theory**, Bhargav Bhatt, Matthew Morrow, Peter Scholze. arXiv:1802.03261v2, 9 April 2019; public PDF, hash matches the integrated extraction. [Source](https://arxiv.org/pdf/1802.03261v2). SHA-256 `b2338ef19714f39aeac2aaaa4e8d6bd708020815016bbe5541a74e4db3594038`. Fresh: pp.21–23, including Definition 4.18, all of Proposition 4.19 and both proofs of part (3), Definition 4.20 and Remark 4.21. Page 23 also rendered. The v-descent proof is not imported into the early Q route.
- **Etale cohomology of diamonds**, Peter Scholze. Supplied revision dated 14 April 2026 (library copy EtCohDiamonds.pdf, catalogue: "deliberately not replaced with a live copy"); arXiv:1709.07343 is an earlier preprint with different numbering. Extraction line numbers refer to pdftotext -layout of the library PDF. [Source](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf). SHA-256 `4ce3d1232a6e9e186d1a36da5cc659616569ac8dd2bb263510247c07995a26c1`. Accepted extraction/reviewer evidence retained; the 14 April 2026 PDF has not been freshly obtained for this checkpoint. Its hash is inherited provenance, not a new acquisition.
- **Integral p-adic Hodge theory**, Bhargav Bhatt, Matthew Morrow, Peter Scholze. arXiv:1602.03148v3, 15 January 2019; public PDF, hash matches the integrated extraction. [Source](https://arxiv.org/pdf/1602.03148v3). SHA-256 `285f7d2088607688365ca92222dcf44c0acd6c4788dd872fe6a6191b9c4e072a`. Fresh: §3.1 Definition 3.1 and Lemma 3.2 statement (p.19); pp.21–24, including Definitions 3.5, Lemmas 3.9–3.10 with proofs, Remark 3.11 and Example 3.15; Lemmas 3.20–3.21 with the printed proofs, pp.26–27. Pages 22 and 24 also inspected as rendered images. Lemma 3.2 proof and the references in Lemma 3.21 are not freshly read.

Five source findings are recorded; the BMS2 wording finding is also collated with the published text. Corollary 7.3’s R/S variable slip was already identified by the accepted reviewer. The unresolved citation in BMS1 Lemma 3.14 has no guessed bibliographic replacement. Three additional findings are editorial omissions or grammar. No mathematical theorem is rejected on their basis, and no exhaustive novelty claim is made. Published-version collation is established only for the BMS2 wording finding, at p.227; the other findings retain their stated version limits.

- `PerfectoidQuotients/E1`: Corollary 7.3 proof, p.56, arXiv v4. “with a map R → A/I” → Replace R by S, or explicitly require the map from R to factor through the chosen quotient S. The category being identified consists of perfectoid rings under S. Arbitrary maps from the presentation ring R would forget its kernel.
- `PerfectoidQuotients/E2`: Lemma 3.14 proof, p.24, arXiv v3. “[?, Lem. 6.5.13(i)]” → Supply a verified bibliographic reference for Frobenius acting by zero on the cotangent complex, or include that argument. No replacement author/title is guessed. The rendered public preprint has an unresolved citation marker. The conclusion is unchanged; the source closure is owned by DD.0.
- `PerfectoidQuotients/E3`: Proposition 4.19(3), end of the first proof, published p.227 and arXiv v2 p.23. “to the claim follows” → so the claim follows Editorial grammar; the elementary second proof and the statement are unaffected.
- `PerfectoidQuotients/E4`: Sentence before Theorem 7.4, p.56, arXiv v4. “One goal in this section is prove” → One goal in this section is to prove Editorial omission of the infinitive marker; no mathematical consequence.
- `PerfectoidQuotients/E5`: Lemma 3.20 proof, p.27, arXiv v3. “Let assume for the moment” → Let us assume for the moment Editorial omission of the pronoun; no mathematical consequence.

The accepted all-prisms correction and the I/J correction in Theorem 7.4 are retained under their existing source-register IDs. Rejected and awaiting-review records remain distinguished in the packet. The unit and quotient arguments do not use the unresolved cotangent citation or the analytic completion proposal.

## Acceptance and formalization boundary

The suggested file states every one of the twenty graph declarations, every API entry, all nine definition tests and the three named Witt-torsion acceptance examples on the actual pinned Mathlib carriers. Its other examples exercise the Witt unit criterion and the root-ideal and quotient statements. The predicate itself is an explicit formula; the prismatic, derived and analytic objects missing from the baseline are not replaced by arbitrary proposition fields. A signature check cannot establish the mathematical assertions in the proof placeholders. The packet remains unchecked and no stage is declared closed.

## Elementary bounded torsion in Witt quotients

Let p be prime and k a perfect commutative ring of characteristic p. For a Witt vector xi whose coordinate xi_1 is a unit, the principal quotient W(k)/(xi) has all its p-primary torsion killed by p. The result does not require k to be a domain or xi to be a nonzerodivisor. It isolates the elementary argument of BMS2 Proposition 4.19(3), independently of valuation covers and descent.

The coordinate convention matters: in xi=[a0]+p[a1] modulo p squared, the digit a1 is inverse Frobenius applied to the Witt coordinate xi_1. Thus its being a unit is equivalent to the displayed coordinate condition, but the digits must not be identified without this Frobenius adjustment.

### Detecting a factor modulo p from a Witt product

Identifier: `PerfectoidQuotients:Q0:integral-algebra/witt-product-p-square-detection`.

If p squared divides xi times g in W(k), and Witt coordinate one of xi is a unit, then p divides g. There is no condition on coordinate zero of xi and no assumed nonzerodivisor property of xi.

Proof plan:

- Apply the pinned Teichmuller expansion theorem at precision p squared to xi and g. Write xi=[a0]+p[a1] modulo p squared and g=[b0]+p[b1] modulo p squared, where a1 is inverse Frobenius applied to xi_1, hence is a unit. These are Teichmuller p-adic digits, not raw Witt coordinates.
- Multiply these two congruences. Multiplicativity of Teichmuller representatives gives xi*g=[a0*b0]+p*([a0*b1]+[a1*b0]) modulo p squared. Reducing with constantCoeff yields a0*b0=0, so the first displayed Teichmuller term vanishes.
- Cancel one p using the pinned p-torsionfreeness of W(k), then reduce again with constantCoeff to obtain a0*b1+a1*b0=0. Multiplying by b0 and using the first relation gives a1*(b0^2)=0. Since a1 is a unit, b0 squared=0.
- As p is at least two, b0 to the pth power vanishes. Injectivity of Frobenius on the perfect ring k gives b0=0. The pinned first-coordinate ideal-membership criterion then gives p divides g.

Dependencies: `mathlib:WittVector.dvd_sub_sum_teichmuller_iterateFrobeniusEquiv_coeff`, `mathlib:WittVector.teichmuller`, `mathlib:WittVector.teichmuller_zero`, `mathlib:WittVector.teichmuller_coeff_zero`, `mathlib:WittVector.constantCoeff`, `mathlib:WittVector.eq_zero_of_p_mul_eq_zero`, `mathlib:WittVector.mem_span_p_iff_coeff_zero_eq_zero`, `mathlib:frobeniusEquiv`, `mathlib:injective_frobenius`, `mathlib:Ideal.mem_span_singleton`, `mathlib:WittVector.coeff_p_one`.

Acceptance: witt_torsion_prime_detection — For xi=p, the condition reduces to p squared dividing p*g if and only if p divides g; xi_1=1.

### One-step p-saturation of a principal Witt ideal

Identifier: `PerfectoidQuotients:Q0:integral-algebra/witt-principal-p-saturation`.

If p squared times f belongs to the ordinary ideal generated by xi in W(k), then p times f belongs to that ideal, under the unit-coordinate hypothesis on xi.

Proof plan:

- Write p squared times f=xi*g using the existing principal-ideal membership theorem.
- The product-detection lemma gives g=p*h. Rearrange the equality as p*(p*f)=p*(xi*h), and use p-torsionfreeness of the Witt ring to cancel p. The result p*f=xi*h proves membership in the same ideal. No cancellation of xi is used.

Dependencies: `PerfectoidQuotients:Q0:integral-algebra/witt-product-p-square-detection`, `mathlib:Ideal.mem_span_singleton`, `mathlib:WittVector.eq_zero_of_p_mul_eq_zero`, `mathlib:Ideal.Quotient.eq_zero_iff_mem`.

Acceptance: witt_torsion_quotient_by_prime — The quotient W(k)/(p) is killed by p for any perfect k of characteristic p, including a product of fields; no domain hypothesis is needed.

### Bounded torsion in a principal Witt quotient

Identifier: `PerfectoidQuotients:Q0:integral-algebra/witt-principal-quotient-p-torsion`.

For Q=W(k)/(xi), every x in Q and every nonnegative integer n satisfy: if p to the nth power times x is zero, then p times x is zero. Thus the p-primary torsion of Q is already killed by p. This is a sufficient criterion, not a characterization of all principal ideals with this property.

Proof plan:

- Choose a representative f of x using the existing quotient projection. The relation p squared times x=0 is equivalent to p squared times f lying in (xi), so one-step saturation gives p times x=0.
- For arbitrary n, n=0 forces x=0 and n=1 is the hypothesis itself. For n at least two, apply the square-step result to p to the (n-2) power times x; this lowers the annihilating exponent by one. Induction finishes.
- To use the result for a perfectoid ring, separately establish its representation W(R-flat)/(xi) and the unit coefficient of a chosen kernel generator. These source hypotheses are not inferred from principal generation alone.

Dependencies: `PerfectoidQuotients:Q0:integral-algebra/witt-principal-p-saturation`, `mathlib:Ideal.Quotient.mk_surjective`, `mathlib:Ideal.Quotient.eq_zero_iff_mem`, `mathlib:WittVector.mem_span_p_pow_iff_le_coeff_eq_zero`, `mathlib:WittVector.coeff_p_one`.

Acceptance: witt_torsion_hypothesis_required — In W(F_2)/(4), the class of one is killed by 4 but not by 2. The generator 4 has Witt coordinate one equal to zero, so it is excluded by the theorem.

Application to an integral perfectoid ring remains conditional on the separate construction of a kernel generator with the required coefficient. Principality alone does not supply that coefficient. The counterexample W(F_2)/(4) prevents accidentally dropping the hypothesis. No new ring carrier, Witt theory, prism structure or derived-completion functor is constructed here.

### Source wording correction awaiting review

PerfectoidQuotients/E3 collates the existing grammatical-typo finding “to the claim follows” at the end of the first proof of Proposition 4.19(3), published p.227 and arXiv v2 p.23; the connective should be “so”. Both PDF pages were visually checked. It changes no mathematics. No correction was located in the recorded search of the journal listing, arXiv versions and author copy; this is a pending finding, without an independent-review verdict.
