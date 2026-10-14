# Source hypotheses for anticyclotomic nonvanishing

This companion fixes the hypotheses used by the nonvanishing targets of
**Heegner-point Euler systems and arithmetic descent**. The geometric targets
belong to HE.8; independent anticyclotomic main-conjecture equalities and their
applications belong to HE.8b. HE.8c adds no mathematical declarations. It gives
an explicit choice of source theorem, character domain, sign branch, and
coefficient strength for each use of those targets.

The mathematical specification and interfaces imported here are in
[HE.7s/HE.8/HE.8b](HeegnerPointEulerSystems--HE.7s.md), with the target IDs in
[its packet](../packets/HeegnerPointEulerSystems--HE.7s.json). The
[HE.8c packet](../packets/HeegnerPointEulerSystems--HE.8c.json) contains ten
hypothesis records H1–H10 and their exact import map. Throughout, a named
interface is a planned declaration, with implementation status unchecked.

## The nonvanishing statements and their domains

The following table is a hypothesis matrix. The statements after it fix the
objects that its abbreviations denote. Page numbers refer to the manuscript
or version listed under Sources, rather than to an unspecified journal edition.

| Input | Domain and additional restrictions | Conclusion | Mathematical owner and locator |
| --- | --- | --- | --- |
| H1: Cornut tower trace | Modular parametrization of E/ℚ; K imaginary quadratic; every prime dividing N split; p∤N | At some conductor pⁿ, the trace to the anticyclotomic tower has infinite order | HE.8 `cornut-tower-trace-nontorsion`; Cornut introduction, pp.1–2; §4 Theorem A, pp.20–21 |
| H2–H3: CV characters and signs | F totally real, K/F CM; π cuspidal parallel weight two; finite-order everywhere unramified central character ω; prime-to-P part of N coprime to D; admissible fixed χ₀ | Exact-conductor strata and stabilized sign (−1)^\|S\| | HE.8 `cm-character-stratum`, `cm-generic-root-number`; CV §1.1, pp.3–6; Lemma 1.1, p.5; Corollary 2.2, p.21 |
| H4: indefinite geometry | Quaternion algebra indefinite at one real place, split at P; local order conditions (H1),(H2); matching nonzero P-new quotient; good CM point | For every sufficiently large conductor and each good point, some primitive fixed-type character projection is nonzero in the complexified Mordell–Weil space | HE.8 `indefinite-cm-character-point`; CV Theorems 1.10, 4.1–4.2, pp.13,36–37 |
| H4–H5: definite branch | \|S\| even; π≇π⊗η; matching nonzero P-new vector and good CM point | Some primitive fixed-type toric period at each sufficiently large conductor is nonzero; hence some central L-value is nonzero | HE.8 `definite-cm-character-period`, `definite-rankin-nonvanishing`; CV Theorems 1.4, 1.11, 1.13, 5.10, pp.6,15,58–60 |
| H5: indefinite derivative | \|S\| odd; **also** ω=1 and N,D,P pairwise coprime | For every sufficiently large n, some χ∈P(n,χ₀) has L′(π,χ,½)≠0 | HE.8, legacy ID `HE.8c/cornut-vatsal-nonvanishing-with-its-exact-hypotheses`; CV Theorem 1.5, p.7 |
| H6: common dynamics | Actual quaternion reduction/component spaces, admissible auxiliary places, pairwise P-irrational shifts, compact-open Galois subgroup | Joint fibre equidistribution and finite-level orbit surjectivity | HE.8 `joint-cm-equidistribution`, `joint-cm-orbit-surjectivity`; CV dynamics Theorem 2.9/Corollary 2.10, pp.9–12 |
| H7: BCGS Theorem A | E/ℚ; p odd, good ordinary, split in K; (Heeg),(disc),(tor); **rational** anticyclotomic main conjecture | Some finite derivative class κₙ≠0 | HE.8 `bcgs-conditional-kolyvagin-nonvanishing`; BCGS Theorem A, pp.2–3; proof §2.1, pp.15–16 |
| H8: irreducible discharge | Theorem A data; p>3; E[p] irreducible as a G_ℚ-module | Rational anticyclotomic equality, sufficient for A | HE.8b rational main-conjecture targets and branch application; BCS Theorems 1.2.2(a), 1.2.4(a), p.3; BCGS Theorem 1.2.13(ii), pp.14–15 |
| H8: Eisenstein discharge | Theorem A data; rational p-isogeny with kernel 𝔽ₚ(φ); φ restricted to Gₚ distinct from 1 and the mod-p cyclotomic character | Independent integral equality, with its matched rational consequence sufficient for A | HE.8b `eisenstein-main-conjecture-adapter`, supplied by BSD.7a; CGS Theorem C and Greenberg reformulation, pp.3–4 |
| H9: refined BCGS Theorem B | Theorem A data; p>3; residual G_ℚ-image GL₂(𝔽ₚ); **integral** main conjecture; fixed p-optimal parametrization | M∞=Σ_{ℓ∣N}vₚ(cℓ(E/ℚ)) | HE.8 conditional refined target, HE.8b split application; BCGS Theorem B and footnote 1, p.3; proof pp.19–20 |

### H1. Classical points and the tower trace

Fix a modular parametrization π:X₀(N)→E over ℚ and an imaginary quadratic
field K in which every prime dividing N splits. Choose an ideal 𝔑 of 𝒪_K
with 𝒪_K/𝔑≅ℤ/Nℤ. For c prime to N, the order 𝒪_c=ℤ+c𝒪_K and the induced
cyclic N-isogeny determine a CM point x_c over the ring class field K[c];
write y_c=π(x_c). These are the HE.0/HE.1 constructions, imported with their
conductor-change and reciprocity conventions.

For a prime p∤N, set K[p∞]=⋃ₙK[pⁿ]. It contains the anticyclotomic
ℤₚ-extension H∞ with finite relative Galois group G₀. The expression
Tr_{K[p∞]/H∞}(y_{pⁿ}) means the sum over that finite group, acting on a
point with finite orbit. Cornut proves that this trace is non-torsion for
some n≥0. His stronger Theorem A concerns every nonzero modular abelian
quotient of J₀(N): the span of the prescribed finite-torsion-character
projections of higher CM points is infinite-dimensional. The relevant
locators are his introduction pp.1–2 and §4 Theorem A, pp.20–21.

The geometric theorem has no good-ordinary assumption. Cornut explicitly
adds ordinary reduction to the quoted Iwasawa consequences in the
introduction, p.2. The imported HE.8 tower-trace target is deliberately used
in the narrower ordinary setting of the family construction: it also fixes
an odd p, the discriminant conditions and the appropriate Tate module. That
narrow application does not turn those assumptions into hypotheses of
Cornut's geometric theorem. This companion does not broaden the existing
HE.8 target.

**Check.** The conductor-one trace Tr_{K[1]/K}(y₁) can vanish without
contradicting the tower theorem. Its quantifier permits a different
conductor. Neither nonvanishing of every trace nor rank one over K follows
from this geometric statement alone. The passage to the non-torsion Λ-class
uses the stabilization, finite torsion and norm-family arguments of HE.8
`lambda-bottom-class-nontorsion`; it is not a definition of nonvanishing.

### H2. Relative ring-class conductors and character types

Fix a totally real number field F, a CM quadratic extension K/F, and a
finite prime P of F with residue characteristic p. For an integral ideal C
of 𝒪_F, put 𝒪_C=𝒪_F+C𝒪_K. The corresponding ring-class quotient is

\[
 G(n)=\operatorname{Pic}(\mathcal O_{P^n})
      \simeq\operatorname{Gal}(K[P^n]/K),\qquad
 G_\infty=\varprojlim_nG(n).
\]

Its torsion subgroup G₀ is finite, and G∞/G₀ is a free ℤₚ-module of rank
[F_P:ℚₚ]. The image G₂ of the F-ideles identifies with Pic(𝒪_F) inside G₀.
These are consequences of the relative tower, not hypotheses declaring
that every such tower has rank one. See CV §1.1, pp.4–6, and §2.1
Corollary 2.2, p.21.

A ring-class character χ has conductor C in the **𝒪_F-order** sense: C is
the largest ideal for which χ factors through Pic(𝒪_C). This differs from
the 𝒪_K ideal conductor of its Hecke-character realization, which divides
C𝒪_K. Transition maps run from the higher conductor quotient to the lower
one. Proper invertible ideals, their Picard groups, class fields and Artin
maps are imported; no new order or class-field carrier belongs here.

Fix χ₀:G₀→ℂ× with χ₀ω=1 on G₂. For n sufficiently large that G₀ embeds
in G(n), the exact-conductor stratum is

\[
 \mathcal P(n,\chi_0)=
 \{\chi:G(n)\to\mathbb C^\times:
       \chi|_{G_0}=\chi_0,\quad
       \chi\text{ does not factor through }G(n-1)\}.
\]

Characters of finite quotients are automatically finite-order. No embedding
of G₀ in a small quotient is presumed. Central compatibility on G₂ is the
idele condition χ₀ω=1 on 𝔸_F×. It is not an unrestricted choice of finite
character. CV §1.1 p.6 and Lemma 2.8 p.23 supply the exact-conductor and
averaging conventions.

The imported declaration is
`TauCeti.Heegner.Anticyclotomic.cmCharacterStratum` at
`HE.8/cm-character-stratum`. Its four imported API items are:

- `cmCharacterStratum_mem`: membership means both the chosen torsion
  restriction and failure to descend to the preceding quotient.
- `cmCharacterStratum_torsion`: each member has that torsion restriction.
- `cmCharacterStratum_not_old`: a preceding-level pullback is excluded.
- `cmCharacterStratum_transport`: isomorphisms compatible with the quotient
  maps and torsion embeddings transport the strata.

All names here and below use the namespace
`TauCeti.Heegner.Anticyclotomic`. The API and its tests are owned by HE.8 and
are referenced without new declarations. Its three imported unit tests are
`cmCharacterStratum_identity_quotient` (an identity transition has empty
primitive stratum), `cmCharacterStratum_wrong_torsion` (wrong type excludes
an otherwise primitive character), and `cmCharacterStratum_first_nontrivial`
(the nontrivial character of C₂ belongs over the trivial preceding quotient
with trivial torsion subgroup).

**Worked check.** In that C₂ example the trivial character descends and is
excluded, while the character taking the generator to −1 is included.
For general F, if [F_P:ℚₚ]=2 the free tower quotient has rank two; replacing
it by a chosen ℤₚ quotient changes the character domain and cannot implement
the full CV theorem.

### H3. The local sign set and the exceptional pair

Let π be a cuspidal GL₂/F representation of parallel weight two and
conductor N. Its central character ω is finite-order and everywhere
unramified. The part N′ of N prime to P is coprime to the relative
discriminant D=D_{K/F}. The admissible characters satisfy χω=1 on 𝔸_F×.
Define

\[
 S=\{\text{real places of }F\}
   \cup\{v\ne P:v\text{ is inert in }K,
                        \operatorname{ord}_v(N)\text{ is odd}\}.
\]

CV's local sign set S(χ) records failure of the local epsilon factor to
agree with η_v(−1)ω_v(−1), where η is the quadratic character of K/F.
Lemma 1.1, p.5, proves S(χ)=S or S∪{P}, and S(χ)=S if P∤N, if P splits
in K, or if the conductor exponent is sufficiently large. In those cases
ε(π,χ)=(−1)^|S|. The source defines the triple as definite for even |S|,
indefinite for odd |S|.

The word exceptional has a separate representation-theoretic use:
(π,K) is exceptional when π≅π⊗η. CV Definition 1.3, pp.5–6, excludes this
case in the definite branch because factorization into two odd factors can
force central-value vanishing. It is not the possible extra prime in S(χ).

**Worked check.** Over F=ℚ, the classical Heegner hypothesis with P∤N
leaves S={∞}, so the sign is negative and the derivative branch is relevant.
Over a real quadratic F with no inert finite odd-conductor contribution,
S consists of its two real places and the sign is positive. One cannot
always select the derivative branch by calling all these characters
anticyclotomic. When P divides N and is inert, a small conductor may still
have S(χ)=S∪{P}; the stabilized sign theorem cannot be used there.

### H4. Good CM points and the geometric assertions

Choose B/F with a fixed embedding of K and split at P. In the definite
case Ram(B)=S. In the indefinite case remove one real place τ from S;
B then defines the Shimura curve with its one split real factor. The
parity of the ramification set makes these valid quaternion algebras. With
H=\widehat R× for an 𝒪_F-order R⊂B, the source's CM set is
K×\B(𝔸_f)×/H with its reciprocity action. Its points of conductor Pⁿ are
defined over K[Pⁿ].

The local geometric restrictions of CV §4, p.36, are:

- (H1) R_P is an Eichler order in the split algebra B_P≅M₂(F_P).
- (H2) At each Q≠P ramified in K/F, B_Q is split and R_Q is maximal.

For R_P of level P^δ, choose its two maximal-order endpoints R₁,R₂.
A point represented by g is good if δ=0 or

\[
 K_P\cap g_PR_{1,P}g_P^{-1}
       \ne K_P\cap g_PR_{2,P}g_P^{-1}.
\]

This is CV Definition 1.6, p.9; at maximal level all CM points are good.
A positive-level point must pass the endpoint test. The new-vector and
conductor distribution arguments use it; it is not supplied by merely
being a CM point.

The indefinite quotient J→A is a surjective rational morphism of abelian
varieties, Pic(𝒪_F)-equivariant and P-new, with a nonzero component of the
specified central-character type. Surjective here means that some nonzero
multiple is a genuine surjective morphism. CV Theorems 4.1–4.2, pp.36–37,
and the automorphic specialization Theorem 1.10, p.13, give a nonzero
primitive-character projection for every good CM point at sufficiently
large conductor. The projection lives in a Mordell–Weil space tensored
with the character field. Nonzero torsion in a raw point group does not
satisfy this conclusion.

The definite statement uses a nonzero P-new vector θ in the quaternionic
representation associated to the nonexceptional π. Its induced function
on CM points has nonzero χ-weighted period for some exact-conductor
character of the chosen type at each sufficiently large conductor. This
is the imported `definite-cm-character-period`, from CV Theorems 1.13 and
5.10, pp.15,58–60. The proof uses nonexceptionality to exclude the function
being constant on the relevant norm fibres, then orbit surjectivity and
primitive-character averaging. It cannot be applied to a zero vector or
to an unspecified test vector with no newness condition.

**Character convention.** CV equation (4), p.7, uses the average

\[
 a(x,\chi)=\frac1{|G(n)|}\sum_{\sigma\in G(n)}
                      \chi(\sigma)\,\psi(\sigma x).
\]

For an equivariant ψ, acting by h multiplies this expression by χ(h)⁻¹.
Thus it lies in the χ⁻¹ eigenspace. Cornut's §4, p.21, instead writes an
unnormalized sum weighted by χ⁻¹ and hence projects to the χ eigenspace.
Over characteristic zero dividing by the group order preserves
nonvanishing, but it does not remove the inversion. With a nontrivial
central character the point/height identity must match the indicated
component. CV Remark 1.9, p.13, justifies interchanging χ and χ⁻¹ in the
trivial-central-character anticyclotomic specialization through the outer
Galois twist. The imported projector and Artin conventions must be retained;
reciprocity in the dynamics manuscript sends uniformizers to geometric
Frobenius (Definition 2.8, p.11).

### H5. Central values and derivatives after geometry

For even |S| and a nonexceptional (π,K), the definite period theorem plus
the Waldspurger criterion gives some χ∈P(n,χ₀) with L(π,χ,½)≠0 for each
sufficiently large n. The criterion is used with the local toric/sign
conditions for the chosen quaternion algebra; Lemma 1.1 provides them
at large conductor. CV Theorems 1.4 and 1.11, pp.6,15, are the relevant
analytic statement and comparison. The theorem is the imported HE.8
`definite-rankin-nonvanishing`.

For odd |S|, CV Theorem 1.5, p.7, requires **ω=1 and N,D,P pairwise
coprime** for its derivative conclusion. These extra conditions come from
the available generalized Gross–Zagier formula; the geometric point
theorem has wider scope. Under them and the admissible fixed χ₀, for
every sufficiently large n some χ∈P(n,χ₀) satisfies L′(π,χ,½)≠0. Use
`GrossZagierAndArithmeticHeights:GZ.8/general-quaternionic-gross-zagier-identity`
with the actual nondegenerate height pairing and matching eigenspace. Point
nonvanishing alone is not an L-function comparison.

The identifier
`HeegnerPointEulerSystems:HE.8c/cornut-vatsal-nonvanishing-with-its-exact-hypotheses`
is retained by the imported plan, with mathematical parent HE.8 and name
`cornut_vatsal_indefinite_nonvanishing`. Its spelling does not assign
mathematical ownership to this source companion. The definite theorem
has its own target.

**Check.** Both analytic conclusions have quantifiers
“for every sufficiently large n, there exists χ in P(n,χ₀).” An old
character is not a valid witness. The theorem does not assert that every
primitive character has nonzero value. For instance a character satisfying
all conductor conditions has not thereby acquired a nonzero period; that
is the conclusion the theorem supplies for a chosen witness.

### H6. The actual non-Archimedean dynamics dependency

The two geometric branches share a dynamical input. In CV dynamics,
§2.2 pp.9–12, fix a nonempty finite collection 𝒮 of auxiliary finite
prime sets T with P∉T, B_v split and K_v a field for v∈T. The parity
condition is |T|+|Ram_f(B)|+[F:ℚ] even. This produces compatible totally definite
quaternion reduction spaces. Fix a nonempty finite set R of Galois shifts,
pairwise distinct modulo the P-rational subgroup. P-rational means
rec_K(λ) with λ_P∈K×F_P×, retaining the existential choice of λ in that
definition.

Let Red be the simultaneous reduction map, C its reduced-norm component
map, and x̄=C(Red(x)). Each allowed component fibre carries its invariant
probability measure μ. For a compact-open subgroup U of Gal(Kᵃᵇ/K),
Theorem 2.9 says that, along a fixed P-isogeny class and as x escapes
compact subsets, its Galois averages agree asymptotically with the
averages of those fibre measures. With probability Haar du, the difference
is

\[
 \int_U f(\operatorname{Red}(ux))\,du
 -\int_U\int_{C^{-1}(u\bar x)}f\,d\mu_{u\bar x}\,du
 \longrightarrow0.
\]

At finite level, characteristic functions turn this into Corollary 2.10:
for all but finitely many points in the isogeny class,
Red(Ux)=C⁻¹(Ux̄). In the nontriviality manuscript, Proposition 4.17,
p.49, and Proposition 5.6, p.55, apply precisely this result. Finitely
many isogeny classes suffice for the P-power-conductor family. The norm
component restriction and pairwise P-irrationality are essential: identical
shifts force a diagonal, and no orbit can hit an incompatible component.

The generic supplier is
`GeometryOfNumbersAndQuadraticArithmetic:GN.4`, with an extension in its
own direction or its Part II. Its real Lie-group Ratner targets do not
supply the following theorem over F_P. CV dynamics Theorem 2.29,
pp.31–32, requires homogeneous orbit closure and invariant probability
measure for a one-parameter unipotent flow on a product of cocompact
SL₂(F_P) quotients, together with convergence of averages over sκ for
a compact κ⊂F_P of positive Haar measure as |s|→∞. Its Lemma 2.30,
p.32, requires a twisted-diagonal SL₂(F_P) subgroup inside the measure
stabilizer. Lemmas 2.31–2.32 and Corollary 2.34, pp.32–33, then relate
proper factors to commensurable lattices.

The manuscript cites Margulis–Tomanov Theorem 11.2 and Ratner Theorem 3
for uniform distribution. For the twisted-diagonal lemma it directly cites
Ratner's Corollary 4 of Theorem 6 only when F_P=ℚₚ, and appeals to expert
knowledge for general F_P. A matching acquired theorem for that extension
is an explicit supplier obligation. Neither those original proofs nor
that general extension is certified by this companion. HE.8 owns the
arithmetic reductions and the named joint-distribution targets; GN.4 owns
generic dynamics. The first proof through André–Oort is not an available
shortcut without its own matching supplier.

For p split in K, the existing HE.8 supplier alternative through
`AutomorphicPadicLFunctions:L3h` and the BDP logarithm formula can be used
at its exact hypotheses. It does not replace the inert-P branch of CV's
geometric scope. This companion makes no new source-certification claim
for that alternative.

## Conditional arithmetic applications

### H7. BCGS Theorem A without a rank-one assumption

Write d_K<0 for the signed discriminant throughout. The BCGS data are:
E/ℚ of conductor N; p odd, of good ordinary reduction; K imaginary
quadratic; every prime ℓ∣N split in K; d_K odd and d_K≠−3;
E(K)[p]=0; and p=v v̄ split in K. These are (Heeg),(disc),(tor),(spl)
with the standing ordinary hypothesis. Good reduction gives p∤N, and
splitting gives p∤d_K. Fix the actual lattice T=TₚE, parametrization and
Heegner derivative classes.

For an allowed Kolyvagin prime ℓ inert in K, ℓ∤Np and
min(vₚ(aℓ),vₚ(ℓ+1))>0. The coefficient ideal at a squarefree product n
is Iₙ=p^{M(n)}ℤₚ, where M(n) is the minimum of those valuations over its
prime factors. Set M(1)=∞ and I₁=0. Thus κ₁ lies in H¹(K,T), while the
other κₙ lie in their specified finite coefficient quotients. They are not
all classes in one arbitrarily chosen module.

BCGS Theorem A, pp.2–3, assumes the rational anticyclotomic main
conjecture and concludes ∃n, κₙ≠0. The conductor n can exceed one;
κ₁ can vanish. There is no analytic-rank-one assumption. In particular,
this statement is different from the non-torsion Λ-adic bottom class
constructed along the tower. The imported conditional theorem lives in
HE.8. HE.8b combines it with an independently supplied equality.

The complete proof in §2.1, pp.15–16, uses the weaker divisibility
specified in footnote 5: if F_E generates the Greenberg characteristic
ideal, L_BDP² divides F_E in Λᵘʳ[1/p]. Clearing denominators gives
pᴿF_E=L_BDP²h with R≥0 and integral h. The bounded p-error is retained.
The proof specializes near the trivial character, uses a nonzero
specialized bottom class and index/control formulas, and argues against
vanishing of every finite derivative. Its rescaling bound concerns a
collection whose one common pᵗ multiple is a genuine Kolyvagin system;
the error depends on the Tate lattice rather than on t. The imported
`arithmetic-rescaled-kolyvagin-bound` retains that uniformity obligation.

**Check.** An inert p may satisfy the geometric CV conditions but cannot
be used in BCGS A. A nonzero Λ-class does not by itself supply the rational
main-conjecture divisibility. In the residual branches, keep E(K)[p]=0
until a separate result with the same arithmetic field proves it.

### H8. Main-conjecture strength, normalization and residual branches

Let Γ=Gal(K∞/K), Λ=ℤₚ[[Γ]], and
Λᵘʳ=Λ\widehat⊗_{ℤₚ}ℤₚᵘʳ, with ℤₚᵘʳ the completed integers of the
maximal unramified extension of ℚₚ. The Greenberg module X_Gr is the
Pontryagin dual for strict local condition at v and unrestricted local
condition at v̄: the (0,∅) convention. It is different from the ordinary
rank-one Selmer module and from the all-p-strict Selmer complex.

BCGS Conjecture 1.2.10 and Remark 1.2.11, p.14, assert Λ-torsionness and

\[
 \operatorname{char}_\Lambda(X_{\rm Gr})\Lambda^{\rm ur}
       =(L_{\rm BDP}^{\,2}).
\]

The integral statement is an equality in Λᵘʳ. The rational statement is
the corresponding equality in Λᵘʳ[1/p]. An equality after inverting p
cannot recover the exponent at the prime (p): generators differing by a
factor p have the same rational ideal.

BCS Theorems 1.2.2 and 1.2.4, p.3, use a single-power name for the squared
BDP distribution. CGS's Greenberg reformulation, p.4, uses that convention
as well. The imported HE.8b `bdp-function-convention-comparison` compares
generated ideals, after coefficient extension and matching primitive or
imprimitive Euler factors, periods and local conditions. Equality of
arbitrarily named functions is not the contract; a nonunit local factor
cannot be absorbed into a unit. The precise comparison is supplied by
GZ.9's BDP and imprimitive dictionaries and L3h's construction.

For BCS's anticyclotomic branch, the baseline field, ordinary, discriminant,
Heegner and split hypotheses persist. At p>3, irreducibility of E[p]
as a G_ℚ-module supplies the **rational** Heegner and Greenberg equalities.
The residual-surjective G_ℚ-image branch of those theorems supplies their
**integral** equalities. Irreducible, surjective and irreducible upon
restriction to G_K are distinct conditions; none is silently renamed to
another. The `rational-heegner-main-conjecture`,
`integral-heegner-main-conjecture`,
`rational-greenberg-bdp-main-conjecture` and
`integral-greenberg-bdp-main-conjecture` targets all belong to HE.8b.

For the Eisenstein branch, fix a rational p-isogeny with kernel 𝔽ₚ(φ),
p∤2N, and φ|Gₚ distinct from 1 and the mod-p cyclotomic character. Here
that cyclotomic character is not CV's central character ω. CGS Theorem C,
p.3, and its Greenberg reformulation, p.4, supply independent integral
anticyclotomic equality under (Heeg),(disc),(spl), without the older
rank-one Selmer hypothesis. Apply the equality through HE.8b
`eisenstein-main-conjecture-adapter` to BCGS A with all the A hypotheses
still present. The supplier is `RankZeroOneBSD:BSD.7a`; this companion
checks its source statement, not its independent proof. BCGS Theorem
1.2.13, pp.14–15, records these respective branches.

**Check.** An excluded local character φ|Gₚ=1 or cyclotomic fails the
Eisenstein interface. No rank-one assumption repairs that failure by
notation. The irreducible rational branch suffices for Theorem A but does
not establish an exact integral divisibility index.

### H9. The finite-system defect and the stronger refined statement

For a nonzero κₙ in its actual coefficient module, let ind(κₙ) be its
largest p-divisibility exponent; set ind(0)=∞. Take

\[
 M_r=\inf_{\nu(n)=r}\operatorname{ind}(\kappa_n),\qquad
 M_\infty=\inf_rM_r,
\]

where ν(n) is the number of prime factors and the infima are in ℕ∪{∞}.
Empty strata have value ∞. The Kolyvagin system's monotonicity identifies
M∞ with the source's limiting value; it is not the index at conductor one.
The coefficient ideals, allowed primes, lattice and parametrization are
fixed in this construction. See BCGS introduction pp.2–3 and §2.2,
pp.17–20.

The imported `heegnerDivisibilityProfile` at
`HE.8/heegner-divisibility-profile` has the following four API items:

- `heegnerDivisibilityProfile_at`: the exact-prime-count infimum M_r.
- `heegnerDivisibilityProfile_bottom`: M₀=ind(κ₁).
- `heegnerDivisibilityProfile_top`: a stratum has value ∞ precisely when
  all its permitted classes are zero, including an empty stratum.
- `heegnerDivisibilityProfile_rescale`: common pᵗ rescaling shifts indices
  where the coefficient depth permits it, retaining quotient truncation.

Its three imported unit tests are `heegnerDivisibilityProfile_zero`
(the zero system has every index ∞),
`heegnerDivisibilityProfile_bottom_vs_infimum` (indices 3 at conductor one
and 1 at a one-prime conductor give M₀=3 and M∞≤1), and
`heegnerDivisibilityProfile_sum_not_max` (indices 2 and 5 in the same
stratum give its infimum 2). These test the profile on supplied index data;
they do not assert existence of a new elliptic curve with those indices.

BCGS Theorem B, p.3, imposes all Theorem A data and **p>3, residual
surjectivity, integral main-conjecture equality, and a fixed p-optimal
parametrization**. It then proves

\[
 M_\infty=\sum_{\ell\mid N}v_p(c_\ell(E/\mathbb Q)).
\]

The parametrization is p-optimal when its degree has minimal p-adic
valuation among parametrizations of every curve in the ℚ-isogeny class.
Replacing it by a multiple can alter the integral indices. Since each
bad rational prime splits in K, the displayed rational sum is half the
sum over K-primes above N; neither sum is the order of Sha or M₀. The
proof is BCGS §2.2.3, pp.19–20. The conditional statement belongs to
HE.8 `bcgs-conditional-refined-divisibility`, and its independent equality
discharge belongs to HE.8b `split-refined-kolyvagin-divisibility`.

**Worked check.** Two rational bad primes with Tamagawa valuations 1 and
2 give a required sum of 3, and a K-prime sum of 6. A statement giving
6 for M∞ has counted both primes above each rational prime. A rational
equality alone cannot force 3, because its lost p-primary divisor can
change an integral index.

## H10. Ownership, dependency order and acceptance

Generic orders, invertible Picard groups and Hecke characters are supplied
by GlobalNumberFields; ring class fields and reciprocity by ClassFieldTheory;
elliptic curves, point groups and ordinary reduction by EllipticCurves;
generic profinite calculus by ProfiniteArithmetic and its Tau Ceti inputs.
Their current upstream contracts are the inputs to the specialized
HE.0/HE.1 tower and CM-point constructions. HE.8c does not develop any
of them again.

The additional source routes have the same boundary. Khayutin's
quadratic-order constructions belong to HE.0, with order-genus extensions
in MultiquadraticPartII. The CGLS family construction and rational
comparison belong to HE.8 and HE.8b. Gross/Kolyvagin arithmetic descent
belongs to HE.3–HE.7, with its family application in HE.8. No result in
those routes becomes an HE.8c declaration.

The dependency order is:

1. Generic non-Archimedean dynamics supplies HE.8 joint CM geometry;
   the geometric point theorem precedes its generalized height comparison.
2. Early HE.8 families, local conditions and geometric nonvanishing can be
   inputs to independent main-conjecture suppliers.
3. HE.8b imports those independent equalities and matches coefficients and
   local conditions before applying the conditional BCGS A/B implications.

In particular BSD.7a cannot use the late HE.8b equality as a premise for
its independent Eisenstein proof. A process label for source hypotheses
is not a theorem prerequisite. The structure proposal removes HE.8c
as a mathematical layer after preserving these conditions in the HE.8
and HE.8b statements. No planet belongs to HE.8c; the imported nonvanishing
and main-conjecture targets retain their mathematical owners.

Acceptance consists of the following source and interface checks:

- Identify the actual trace field, finite torsion subgroup, character
  restriction, exact conductor and reciprocity orientation in a use of
  Cornut or CV; test the imported strata API on its three named examples.
- Compute S including all real places and check stabilized versus small
  conductor. Apply the nonexceptionality exclusion to the definite branch.
- Check good CM points, newness and the nonzero matching quotient/vector
  before using geometric nonvanishing. Check the stronger height-formula
  assumptions before producing a derivative.
- Retain the permitted norm fibres and P-irrationality in joint reduction.
  The requested GN.4 extension must provide the local theorem it needs.
- Select the rational or integral main conjecture with the same BDP and
  Selmer conventions, and retain every BCGS A hypothesis when discharging it.
- Test the finite-system profile on its three named examples. An exact
  Tamagawa formula requires the integral, residual-surjective, p>3,
  p-optimal branch, with the rational-versus-K-prime factor of two checked.

The source-hypothesis pass is complete. The imported mathematical plans
have four explicit boundaries: the general-F_P dynamical supplier; exact
analytic/BDP and integral local normalizations; the independent Eisenstein
proof suppliers; and the weak-torsion uniform bound with its small-prime
limitations. Recording their hypotheses does not prove these inputs.
No arithmetic theorem or imported API/test is re-prototyped by the
[Suggested file](../suggested/HeegnerPointEulerSystems--HE.8c.lean); its
elaboration validates an empty declaration set.

## Source versions and inherited source issues

All prose statements above are independent formulations of the mathematics.
All seven public copies were read on 14 October 2026; their URLs, editions,
read ranges and SHA-256 receipts are in the packet.

- [Cornut, *Mazur's conjecture on higher Heegner points*](https://webusers.imj-prg.fr/~christophe.cornut/papers/mcinv.pdf),
  author manuscript dated 24 October 2001. Locators use manuscript pp.1–28,
  not the journal pp.495–523. The theorem's hypotheses, trace, character
  statement and dynamical dependence were read; no full-paper proof audit
  is claimed.
- [Cornut–Vatsal, *Nontriviality of Rankin–Selberg L-functions and CM points*](https://personal.math.ubc.ca/~vatsal/research/part1.pdf),
  author manuscript dated 1 April 2005. The matrix uses its printed
  manuscript pages; these agree with its one-based PDF pages. The cited
  geometric and analytic statements and the two dynamical proof interfaces
  were read.
- [Cornut–Vatsal, *CM points and quaternion algebras*](https://webusers.imj-prg.fr/~christophe.cornut/papers/part2.pdf),
  author manuscript dated 3 April 2005, with its own pp.9–12,31–34 for the
  required supplier statements. These are not the journal pp.263–309.
- [Burungale–Castella–Grossi–Skinner, *Non-vanishing of Kolyvagin systems and Iwasawa theory*, arXiv v2](https://arxiv.org/pdf/2312.09301v2),
  dated 21 January 2026. The introductory hypotheses, Conjecture 1.2.10,
  residual branch list, and complete A/B proofs were read at the cited
  pages. The [linked author copy](https://web.math.ucsb.edu/~castella/Kolyvagin.pdf),
  dated 2 January 2026, was used for the discriminant and prime-threshold
  collation. Neither copy is certified here as the publisher's text.
- [Burungale–Castella–Skinner, *Base change and Iwasawa main conjectures for GL₂*, arXiv v2](https://arxiv.org/pdf/2405.00270v2),
  March 2025, §1.2 pp.2–3. Theorem numbering and normalization in this
  companion refer to v2, not to a different revision.
- [Castella–Grossi–Skinner, *Mazur's main conjecture at Eisenstein primes*](https://web.math.ucsb.edu/~castella/Mazur.pdf),
  author-served copy. Theorem C and its Greenberg reformulation pp.3–4
  supply the branch hypotheses. This is a statement/interface reading;
  the independent proof is a supplier obligation.

Two inherited findings affect how these hypotheses are read. In BCGS v2
introduction p.1, the field discriminant is introduced as −D_K<0, but the
exception in (disc) is written with the signed convention. Use d_K<0 odd
and d_K≠−3 consistently; equivalently the positive absolute discriminant
must differ from 3. This is the existing sourceIssue E1, rechecked in both
served copies. In §2.2, pp.17–19, the exact-length theorem imports an
odd-prime range whose proof invokes a stub lemma assuming p>3. Preserve
the verified p>3 proof route (existing E3); no counterexample at p=3 is
asserted. Theorem B already has that stronger prime bound. This companion
carries these findings without issuing a new independent review verdict
or claiming a publisher correction search beyond the recorded collation.
