# Odd K-groups of number fields and S-integers

This part specifies `ArithmeticKTheory:N.5`. Its purpose is to determine the odd
integral groups together with the maps that detect their torsion. An abstract
finite abelian group decomposition loses information needed by étale Chern maps,
localisation and restriction to real places. In degree three modulo eight, that
information is a short exact sequence with a specified extension class.

The seven N.5 declarations in
[ArithmeticKTheory--N.1.json](../packets/ArithmeticKTheory--N.1.json) supply the
localisation theorem, the e-invariant, the Harris–Segal summand and the integral
structure theorems. They retain their ids. The six declarations in
[the N.5 packet](../packets/ArithmeticKTheory--N.5.json) supply their coefficient,
map and extension interfaces. They introduce no new definitions or constructions,
so there is no second API or set of definition tests to assemble. The e-invariant
API and its tests remain attached to its defining node in N.1.

## Conventions and ownership

Let F be a number field, S a finite set of its finite places, and
O = O_{F,S}. Let r₁ and r₂ denote the numbers of real and complex infinite places.
For j ≥ 2 put n = 2j−1. All K-groups are connective algebraic K-groups with their
usual additive abelian-group structure. S contains finite places only; the set
of real places is written V. The notation R in a coefficient argument means
O[1/ℓ]. The real field is written ℝ, which is distinct from R.

The inherited N.4 object is

\[
W_j(F)=H^0(F;\mathbb Q/\mathbb Z(j)),\qquad
w_j(F)=|W_j(F)|.
\]

Tate twists use the j-th power of the cyclotomic character, prime by prime. They
are not ordinary tensor powers of the divisible group ℚ/ℤ. Write W_j(F){ℓ} for
the ℓ-primary subgroup and w_{j,ℓ}(F) for its order. Thus w_j(F) is the full order,
whereas w_{j,2}(F) is a power of two. The subscript in w₂(ℚ)=24 is the **weight**
subscript: w_{2,2}(ℚ)=8. The two meanings must remain distinct in the real table.
N.4 supplies finiteness, cyclicity and the cyclotomic calculation of these groups.

For an abelian group A, A{ℓ} consists of elements annihilated by some power of ℓ;
A_tors is its finite-order subgroup. These use Mathlib's primary-component and
torsion subgroups. Coefficient K-theory means homotopy of the coefficient
cofiber or its specified colimit. It is not defined by tensoring the integral
K-group. K-spectrum completion is the homotopy inverse limit of finite
coefficient K-spectra; identifying its homotopy with ordinary group completion
requires a theorem.

N.2 owns Dedekind localisation and its finite-extension maps. N.3 owns integral
finite generation and Borel rank. N.4 owns W and exceptional cyclotomic images.
N.5 owns odd arithmetic structure and the e-invariant. N.8 owns certified
examples, including the computations for ℚ and ℚ(i). GeneralAlgebraicKTheory
owns K-theory and its products and transfers; KTheoryFiniteLocalFields:L.1 owns
finite-field K-theory, finite coefficient K-theory and Bott elements;
StableHomotopyKTheory:H.6 owns the coefficient and completion machinery for
spectra. MotivicEtaleKTheory:M.7 owns Suslin comparisons and arithmetic descent.
Its first degree-one edge comparison must be distinguished from the full Chern
and regulator family in M.8.

The isomorphisms to free groups and cyclic factors below are existence
statements. Their bases and generators are not natural. The localisation,
Bockstein, restriction, e and coefficient connecting maps are natural.

## The inherited targets

The following ids belong to the N.1 packet and are imported here.

| N.5 suffix | Output used in this part |
| --- | --- |
| `soule-theorem` | K_n(O) → K_n(F) is an isomorphism for odd n ≥ 3. |
| `soule-mod-l-surjectivity` | For m ≥ 2 and even d ≥ 2, the finite-coefficient localisation boundary is onto. |
| `e-invariant` | The map on odd torsion induced by restriction to a separable closure and Suslin's equivariant identification. |
| `harris-segal-summand` | A cyclic summand detected by e at odd primes, and at two under the nonexceptional hypothesis. |
| `odd-torsion-at-a-prime-where-cd-is-two` | The primary torsion computation at odd primes, and at two for totally imaginary fields. |
| `totally-imaginary-integral-structure` | The complete odd integral structure when r₁=0. |
| `the-real-case-modulo-eight` | The complete odd integral structure when r₁>0. |

The structure conclusions are, for totally imaginary F,

\[
K_n(O)\cong K_n(F)\cong\mathbb Z^{r_2}\oplus\mathbb Z/w_j(F).
\]

For r₁>0 the inherited real theorem has the following four rows.

| n mod 8 | Free rank | Finite torsion group |
| --- | --- | --- |
| 1 | r₁+r₂ | ℤ/w_j(F) |
| 3 | r₂ | ℤ/(2w_j(F)) ⊕ (ℤ/2)^{r₁−1} |
| 5 | r₁+r₂ | ℤ/(w_j(F)/2) |
| 7 | r₂ | ℤ/w_j(F) |

The scope n≥3 excludes K₁; the first occurrence of the row 1 is n=9. In row 5,
j is odd and w_{j,2}(F)=2. Thus w_j(F)/2 is a positive odd integer. An assertion
that row 5 has the same dyadic torsion as W_j(F) would be wrong.

The first Chern and e comparisons below justify the map-level content of these
rows. Their proofs do not import N.6's even integral structure theorem, which
consumes N.5. They use only the even **finiteness** already supplied by N.3 for
S-integer rings. Positive even K-groups of F need not be finite.

## Soulé's localisation input

The odd ring/field isomorphism is additional mathematical input. Exactness of
Dedekind localisation alone gives a finite possible kernel; it does not show
that the kernel vanishes. The inherited proof injects this kernel into a finite
coefficient group by choosing a modulus annihilating integral torsion, and uses
the surjectivity of the preceding even coefficient boundary.

The supplier ids for this argument are
`KTheoryFiniteLocalFields:L.1/k-theory-mod-m`, `mod-m-products`, `bott-element`,
`browder-mod-l-ring`, `quillen-k-groups`, `finite-field-galois-descent` and
`finite-field-transfer-formulas`. The last two provide the residue transfers and
their surjectivity in positive degrees. These are supplier plans; their existence
as nodes is not evidence that their mathematical statements have been formalised.

The modulus deserves care. Given m, prove surjectivity first at a multiple M
whose prime-power factors avoid 2, 3, 4 and 8. At M the general-ring product
statement of K-book IV.2.8 applies. After adjoining a primitive M-th root of
unity, the Bott element and its powers turn the degree-two boundary into the
boundary in degree 2j. Compatibility of this boundary with the K(R)-module
structure is required. Residue-field transfers descend the surjectivity from
the cyclotomic extension. Finally reduce from M to m: in positive odd degrees
finite-field coefficient groups are the integral groups modulo the modulus,
because their preceding positive even integral groups vanish. This reduction
is onto.

Residue characteristic factors can be treated prime by prime. Their positive
integral K-groups have order prime to the residue characteristic, so those
primary residue targets vanish. The primitive-root argument is applied to the
remaining primary factors. This avoids asking a residue field of characteristic
p to contain a primitive p-power root of unity.

The coefficient boundary linearity and projection formula are requested from
GeneralAlgebraicKTheory:K.7 as refinements of its existing product/localisation
interfaces. An associative general-ring product at an exceptional small modulus
is not inferred by transporting a product from a multiple. The source's
finite-coefficient argument and its printed correction in ArithmeticKTheory/E6
remain attached to the inherited declaration, without creating a second Soulé
node.

## Primary torsion and the coefficient Bockstein

**Declaration:** `primaryBockstein_localisation`, node
`ArithmeticKTheory:N.5/primary-bockstein-localisation`.

For ℓ prime and j≥2, the Q_ℓ/Z_ℓ universal coefficient sequence gives

\[
0\longrightarrow K_{2j}(R)\otimes\mathbb Q_\ell/\mathbb Z_\ell
\longrightarrow K_{2j}(R;\mathbb Q_\ell/\mathbb Z_\ell)
\xrightarrow{\beta_R}K_{2j-1}(R)\{\ell\}\longrightarrow0.
\]

The first term vanishes because K_{2j}(R) is finite and ℚ_ℓ/ℤ_ℓ is divisible.
Consequently β_R is a natural isomorphism, lowering degree by one. Soulé's
odd-degree isomorphism identifies its target with K_n(O){ℓ} and K_n(F){ℓ}.
This works at two for real fields as well: the real correction belongs to the
descent computation, not to this coefficient exact sequence.

H.6's finite coefficient node
`mod-l-homotopy-and-bockstein-sequence` is the starting point. Its required
extension forms the colimit along the inclusions ℤ/ℓᵃ→ℤ/ℓᵃ⁺¹ and proves the
natural Q_ℓ/Z_ℓ sequence. At the integral level, localisation over primes above
ℓ gives the same primary comparison, since both neighbouring positive residue
K-groups have order prime to ℓ. The residue ring there is O/𝔭, not R/𝔭 after 𝔭
has been inverted.

Acceptance checks are the degree shift K₄(R;ℚ_ℓ/ℤ_ℓ)→K₃(R){ℓ}, validity at a
real dyadic place, and the absence of an implication that K_{2j}(F) is finite.
The maps commute with enlargement of S and pullback along number-field
embeddings with compatible inverted places.

## The e-invariant equals the descent edge

**Declaration:** `eInvariant_eq_descentEdge`, node
`ArithmeticKTheory:N.5/e-invariant-descent-edge`.

The inherited definition has domain K_n(F)_tors. It restricts to
K_n(F^s)_tors and takes G_F-invariants under Suslin's identification with
ℚ/ℤ(j). It does not extend e to the whole positive-rank K-group. Its primary
component is e_{F,ℓ}:K_n(F){ℓ}→W_j(F){ℓ}.

Fix one coherent Bott-normalised Suslin identification. The coefficient
Bockstein over F^s identifies K_{2j}(F^s;ℚ_ℓ/ℤ_ℓ) with its odd primary torsion;
the positive even integral groups over this separable closure are uniquely
divisible. Restriction to F^s followed by invariants is the degree-zero descent
edge ε_R. Naturality of the Bockstein therefore gives the equality

\[
\varepsilon_R=e_{F,\ell}\circ\mathrm{loc}\circ\beta_R.
\]

Rognes–Weibel state precisely this factorisation at two after Example 1.6. Its
prime-by-prime version uses Suslin's equivariance in K-book VI.1.7.1. A chosen
cyclic generator is not used to identify two unrelated maps.

At odd ℓ, and at two when F is totally imaginary, M.7 supplies the
cohomological-dimension-two descent calculation. In total degree 2j its possible
H² term has twist j+1 and vanishes for j≥2; the H⁰ term is W_j(F){ℓ}. The edge
is therefore an isomorphism, and so is e_{F,ℓ}. A totally imaginary exceptional
field, for example ℚ(√−7), remains in this range. Exceptionality of a cyclotomic
image is distinct from the presence of real places.

M.7 must name its general separable-closure Suslin interface. The existing
`KTheoryFiniteLocalFields:L.2/separable-closure-l-torsion` declaration is scoped
to a nonarchimedean local field and primes unequal to the residue characteristic.
It does not by itself provide equivariance for an arbitrary number-field
absolute Galois group. The required general node is proposed as
`MotivicEtaleKTheory:M.7/suslin-separable-closure-torsion`; this proposed name is
not used as if it were an existing or reserved node.

## The diagonal real-place extension

**Declaration:** `real_eInvariant_diagonalExtension`, node
`ArithmeticKTheory:N.5/real-e-invariant-extension`.

Assume r₁>0 and n=8k+3, so j=4k+2. M.7's real descent output in coefficient
degree 8k+4 has a short filtration with quotient W_j(F){2} and kernel

\[
H^2(F;\mathbb Q_2/\mathbb Z_2(j+1))\cong(\mathbb Z/2)^V.
\]

This identification is by restriction to all real places. The edge comparison
just proved identifies the quotient with the actual e-map. At odd primes e is
an isomorphism. Reassembling these primary groups gives a natural sequence

\[
0\longrightarrow(\mathbb Z/2)^V\xrightarrow{\iota}
K_n(F)_{\mathrm{tors}}\xrightarrow eW_j(F)\longrightarrow0.
\]

The extension must be computed. Suslin's real-to-complex map on torsion in
this degree is multiplication by two on ℚ/ℤ, in compatible trivialisations.
For every v∈V, pushing out the displayed sequence along the v-th coordinate
produces the pullback of the real sequence

\[
0\longrightarrow\mathbb Z/2\longrightarrow\mathbb Q/\mathbb Z
\xrightarrow{\,2\,}\mathbb Q/\mathbb Z\longrightarrow0
\]

along W_j(F)↪ℚ/ℤ(j) induced by that real embedding. The left map is the unique
identification of the coordinate kernel with the real kernel; the quotient map
is restriction of the same W object. The induced map between the pushout and
pullback extensions is an isomorphism on their kernels and is the identity on
their common quotient W; exactness makes it an isomorphism. This is the map of extensions used in the
proof of Rognes–Weibel Theorem 6.7. Applying it at every real place specifies
all coordinates of the extension class.

Choose W_j(F)≅ℤ/w, w=w_j(F), and a lift x of its generator. The pullback over
one real place has a lift of order 2w, whose w-multiple is the nonzero kernel
element. Hence, simultaneously at all real places,

\[
w x=\iota(1,\ldots,1).
\]

The relation is unchanged when x is replaced by another lift: their difference
lies in an elementary two-group and w is even. Replacing the cyclic generator
multiplies the class by an odd unit and preserves each coordinate. Thus the
class in Ext¹_ℤ(ℤ/w,(ℤ/2)^V) is the diagonal vector. Knowing that just one
coordinate is nonzero suffices to determine the abstract group type, but it
does not determine the natural real-place sequence.

**Algebraic input:** `diagonalExtension_normalForm`, node
`ArithmeticKTheory:N.5/diagonal-extension-normal-form`.

For any abelian E in a short exact sequence with kernel (ℤ/2)^r and quotient
ℤ/w, assume w>0, r>0, 2|w and the displayed diagonal lift relation. Choose a
basis of the kernel starting with its nonzero diagonal vector. Exactness gives
a presentation with generators x,a₀,…,a_{r−1} and relations 2aᵢ=0, wx=a₀.
To verify that these are all relations, map a putative relation to ℤ/w;
its coefficient of x is a multiple of w, which can be eliminated using wx=a₀.
Injectivity of the kernel map then detects the remaining relation.

Eliminating a₀ gives E≅ℤ/(2w)⊕(ℤ/2)^{r−1}. The lift x has order exactly 2w.
An additive section of the quotient would give a lift of 1 annihilated by w,
contradicting the same lift relation. This theorem is general group theory;
it assumes the lift relation as additional data and does not assume the desired
group decomposition or nonsplitting as a hypothesis.

For r=1,w=8 the group is ℤ/16. For r=2,w=8 it is ℤ/16⊕ℤ/2; the split group
ℤ/8⊕(ℤ/2)² has the same cardinality and smaller exponent. The cyclic reduction
ℤ/16→ℤ/8 has no additive section. These are the three acceptance examples in
the suggested file.

Naturality refers to the sequence. For F↪E, a kernel coordinate at a real place
of F restricts to each real place of E above it. Coordinates that become complex
map to zero. In particular, restriction to a totally imaginary extension kills
the real-place kernel. Enlargement of S identifies the sequence with the same
field sequence. No functorial choice of the cyclic lift or a free basis is
part of the theorem.

## Kernel and cokernel in all four rows

**Declaration:** `eInvariant_kernel_cokernel`, node
`ArithmeticKTheory:N.5/e-invariant-kernel-cokernel`.

For a totally imaginary number field both groups vanish. For r₁>0:

| n mod 8 | Kernel of e on torsion | Cokernel in W_j(F) |
| --- | --- | --- |
| 1 | 0 | 0 |
| 3 | (ℤ/2)^V | 0 |
| 5 | 0 | ℤ/2 |
| 7 | 0 | 0 |

At two this follows from the positive even coefficient degrees n+1. M.7 must
supply the **edges and filtration maps** in its four rows, not just a list of
abelian groups. Degrees 8a and 8a+2 have H⁰ edge isomorphisms onto W_{4a}{2}
and W_{4a+1}{2}, with the latter of order two. Degree 8a+4 has the specified
extension. Degree 8a+6 is zero, whereas its target W_{4a+3}{2} has order two.
The row 8a is used only at positive degree; coefficient K₀ has a different
formula and is outside this argument.

The odd-primary components are isomorphisms in every row. Thus in row 5 the
full e-map is injective and its image is the odd-primary subgroup of W_j(F).
In row 3 the diagonal extension is nonsplit. Combining this map calculation
with N.3's finite generation and ranks gives the inherited integral structure
table without creating duplicate arithmetic group declarations.

For ℚ,j=2, the inherited W calculation gives w₂(ℚ)=24, so the sequence has
kernel ℤ/2, target ℤ/24 and torsion middle group ℤ/48. This is an acceptance
instance of the extension statement. Its certified arithmetic example remains
owned by N.8. In degree five the dyadic source is zero while the weight-three
invariant group still has order two; a computation that identifies them fails
this acceptance condition.

## The edge-normalised first Chern map

**Declaration:** `etaleEdge_eInvariant_torsion`, node
`ArithmeticKTheory:N.5/edge-normalised-chern-torsion`.

Use the Dwyer–Friedlander first étale Chern map: the ordinary-to-étale K-theory
comparison followed by the degree-one edge into H¹(R;ℤ_ℓ(j)). This is the
normalisation described in Weibel's Handbook chapter §5.4. Write it as
c_edge on K_{2j−1}(R)^∧_ℓ. Its coefficient and connecting-square compatibility
belongs to the early M.7 comparison interface. Identifying it with the full
family of higher Chern classes, including their factorials and signs, belongs
to M.8.

The coefficient sequence gives a connecting map

\[
\delta:H^0(R;\mathbb Q_\ell/\mathbb Z_\ell(j))
\longrightarrow H^1(R;\mathbb Z_\ell(j)).
\]

For positive j the cyclotomic character on a number field has infinite image,
so its j-th power is nontrivial. Both H⁰(R;ℤ_ℓ(j)) and H⁰(R;ℚ_ℓ(j)) vanish.
The continuous cohomology coefficient sequence therefore embeds W_j(F){ℓ}
into H¹(R;ℤ_ℓ(j)). M.2 supplies finite generation of this H¹ and its comparison
with rational cohomology; the kernel of rationalisation is exactly its finite
torsion subgroup. Thus δ identifies W_j(F){ℓ} with that subgroup.

Naturality of the K-theory and étale coefficient triangles gives
c_edge∘β_R=δ∘ε_R. Since β_R is an isomorphism, the desired formula on torsion is

\[
c_{\mathrm{edge}}=\delta\circ e_{F,\ell}\circ\mathrm{loc}.
\]

This uses an equality of maps with specified normalisation. No unqualified
classical higher Chern class is substituted in this formula. The kernel on
primary torsion is exactly the e-kernel, and the cokernel **into cohomological
torsion** is the e-cokernel. This is not a cokernel computation into all of H¹,
which can have a free part.

The completion step uses
`KTheoryFiniteLocalFields:L.1/completed-k-theory` and
`StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence`. Finite coefficient
groups here are finite, so their inverse systems are Mittag–Leffler. In odd
degree the inverse limit of the bounded finite even-group torsion term has
multiplication-by-ℓ transition maps and is zero. The Milnor and universal
coefficient sequences identify the odd completed group with ordinary completion
of the finitely generated odd integral group, preserving its primary torsion.
This argument explains why group completion is valid in this setting.

Acceptance requires the same real kernel in degree three modulo eight, zero
dyadic torsion image but cohomological torsion ℤ/2 in degree five modulo eight,
and a torsion isomorphism at odd primes. Pullback and enlargement of S commute
with the comparison. No injectivity statement for a rational, syntomic or
p-adic regulator is implied. Those maps and their norm compatibilities belong
to the corresponding regulator roadmaps.

## Supplier contracts and atlas boundaries

The nine requests in the packet are the following interfaces.

1. H.6 supplies the Q_ℓ/Z_ℓ coefficient colimit, Bockstein and compatibility with
   localisation/completion.
2. M.7 names general separable-closure Suslin torsion and equivariance.
3. M.7 supplies the cohomological-dimension-two descent output and the
   coefficient/edge connecting square for the first Chern comparison.
4. M.7 names `suslin-real-finite-coefficient-comparison`, stating
   K_d(ℝ;ℤ/m)≅π_d(BO;ℤ/m) for d≥1,m≥2, together with the real-to-complex torsion
   maps, and then `real-place-dyadic-descent-output` with its restrictions,
   filtration and extension data. The latter includes the real-place
   cohomology and approximation input of K-book VI.9.3.
5. `RefinedTraceMethods:RT.4:topological` supplies an explicit scope extension:
   real KO/BO, real Bott periodicity, π_d(BO) and the coefficient and
   real-to-complex maps. Its existing complex ku/KU scope does not provide
   this material. M.7 imports this real node before its Suslin theorem;
   N.5 consumes the M.7 output. Tau Ceti's Clifford-algebra periodicity is
   a different statement.
6. M.2 supplies the continuous cohomology sequence, H¹ finite generation and
   rationalisation comparison used to identify its torsion.
7. M.8 supplies the full higher-Chern-family comparison with exact sign and
   factorial conventions; this is the inherited request attached to the
   cohomological-dimension-two node, distinct from the first-edge formula.
8. L.1 supplies the Harris–Segal finite-field/wreath-product theorem and its
   detected cyclotomic-integer summand. The original §3 must be read. Its
   quotation in K-book VI.1.5 does not supply a proof.
9. K.7 supplies the finite-coefficient boundary linearity and transfer
   projection formula in the enlarged-modulus Soulé argument.

The real Suslin and KO/BO requests address the missing input to the dyadic
spectral sequence. A proposed supplier-node id in a request is a precise owner
specification, not an implemented, existing or reserved declaration.

K3BlochGroups:V.5 must import N.5 for arithmetic structure and N.8 for the
certified ℤ,ℚ,ℚ(i) examples. It retains the decomposition into the image of
Milnor K₃ and the indecomposable quotient. Proving the same arithmetic groups
inside V.5 duplicates N's ownership and omits its rank and dyadic inputs.
The N.5→V.5 and N.8→V.5 dependencies belong in V.5's owning packet.

The inherited full M.8 dependency passes through BorelRegulators:R.7,
Polylogarithms:P.2 and K3BlochGroups:V.3/V.2 back to N.5. The V.2 node
`k3-rank-borel` needs Borel rank directly from R.3 and arithmetic finite
generation; its N.5 dependency must be removed. The new six-node graph is
acyclic and adds no full M.8 prerequisite. The union with that inherited chain
is not claimed globally acyclic until the owner correction is applied.

Consumers receive the natural torsion/edge interfaces: HabiroNumberFields:HB.1
uses finite Chern maps with its own coefficient and excluded-prime hypotheses;
PadicHodgeRegulators:D.4 uses global-to-local restriction and owns its
regulator comparisons; SpecialValuesBirchTate:B.5 uses the precise dyadic
arithmetic input; K3BlochGroups:V.6 and ArithmeticKTheory:N.8 own their explicit
certificates. These consumers do not receive a canonical free generator or an
unconditional regulator injectivity assertion from the abstract structure table.

## Baseline, suggestions and sources

The baseline is Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 with Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174. The reviewed N.5 audit reports higher
K-theory missing while real/complex-place arithmetic exists. Source searches at
those commits find the K₀/Grothendieck work but no required higher algebraic
K-group or étale K-comparison interface. The six direct baseline references in
this packet are `CommGroup.primaryComponent` and its generated additive form,
`ZMod`, `MonoidHom.ker`, `MonoidHom.range` and their generated additive forms,
`ZMod.addOrderOf_one`, and `ZMod.castHom`. Their source statements are read;
the suggested theorem uses the actual additive homomorphism API.

[The suggested file](../suggested/ArithmeticKTheory--N.5.lean) states the general
diagonal-extension theorem and three acceptance examples. Its other five
signatures are explicitly omitted until the genuine K-theory, coefficient,
descent and continuous cohomology carriers and maps exist. It creates no
proposition-valued replacement structures. It elaborates with the pinned
Mathlib imports and four placeholder warnings. This checks signature formation,
not the mathematical proofs. All nodes retain unchecked implementation status.

Sources are public author copies, accessed 6 October 2026, with their SHA-256
values in the packet:

- [Weibel, *The K-book*, combined draft of 29 August 2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf):
  IV.2 for coefficients and products; V.6.8 for Soulé; VI.1–3 for Suslin, W, e,
  Harris–Segal and real torsion; VI.8–9 for the arithmetic tables. Locators use
  the printed draft pages; combined PDF pages are eight larger.
- [Weibel, *Algebraic K-Theory of Rings of Integers in Local and Global Fields*,
  Handbook I.5](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/KZsurvey-published.pdf):
  §§5.3,5.4,5.7,5.8, with printed published page numbers, particularly the
  first étale Chern convention and real arithmetic output.
- [Rognes–Weibel, *Two-primary algebraic K-theory of rings of integers in number
  fields*](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/RognesWeibel.pdf):
  the paragraph after Example 1.6, Theorem 5.6 and its proof, and Theorems
  6.7/6.9 with their proofs. The extension's all-coordinate diagonal form is
  obtained by applying the published real-place argument at every embedding.

Harris–Segal's original 1975 §3 is an unread source boundary, retained explicitly.
The inherited ArithmeticKTheory source corrections E6, E10, E13, E15, E17 and E20,
and KTheoryFiniteLocalFields/E3, E4 and E10, are used without
creating duplicate errata records: in particular, ℝ itself is nonexceptional,
even finiteness belongs to S-integers, inverted-prime residues are taken before
inversion, and the real table uses the two-primary w. The coefficient coprime decomposition
uses the corrected distinct q₁ and q₂ factors, and the Suslin proof uses the
corrected finite-characteristic coefficient calculation. No additional published
source error is asserted.

N.5 is **planned**, with all targets assigned to these six declarations, the
seven inherited declarations and the exact supplier contracts. It is not
closed: five gaps retain the real supplier scope, coefficient/edge contracts,
original Harris–Segal proof, inherited Chern cycle and safe-product localisation
interface. The packet records two new planets, “Real-place torsion extension”
and “Odd e-invariant kernel and cokernel”; together with the four inherited N.5
planets this meets the six-per-layer limit.
