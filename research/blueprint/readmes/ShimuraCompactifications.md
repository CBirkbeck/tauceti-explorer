# Analytic toric geometry, Part II: arithmetic toroidal compactifications

**First prerequisite:** the unchanged [Analytic toric geometry](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/tau-ceti/AnalyticToricGeometry/README.md) roadmap, `tauceti:TauCetiRoadmap/AnalyticToricGeometry`.

This roadmap constructs arithmetic toroidal compactifications from relative torus charts, mixed boundary data and admissible fans. It then plans their canonical models, refinement and level maps, boundary cohomology, integral degeneration families and Hilbert/modular comparisons. The roadmap ID remains `ShimuraCompactifications`; accepted [RS-32](../restructure/RS-32.result.json) makes it an extension of Analytic toric geometry.

The anchor owns the common lattice, cone and dual-monoid vocabulary, finite regular complex charts, finite-fan analytic gluing and their boundary/properness results. This extension begins where arbitrary coefficient rings, torus torsors, arithmetic actions and infinitely many cones with finitely many arithmetic orbits are required. Its integral finite-fan scheme is constructed once over Z; finite complex specializations compare with the anchor. Completion, adic generic fibres and perfectoid toric geometry belong to the nonarchimedean Part II, which imports that scheme.

The two part packets specify 142 nodes, 125 API items, 97 unit tests and 40 planets. All nine stages are **planned**, none is closed, and every implementation status is **unchecked**. Their 28 gaps and 56 supplier requests remain part of the construction contract. Completion of the target-level planning pass is not a claim of formalization or of a gap-free plan. The [suggested Lean file](../suggested/ShimuraCompactifications.lean) supplies native algebra/arithmetic signatures and explicit geometric omission ledgers; those ledgers are not typed declarations.

## Scope and neighbouring owners

The reviewed [link maps](../links/) and RS-32 determine these boundaries. The ModularCurves map is the existing reviewed map with an edge into this roadmap; the other owner contracts below come from the packets and restructuring, rather than a new link review.

| Input or consumer | Ownership boundary |
| --- | --- |
| Analytic toric geometry | Imports common toric vocabulary and finite complex constructions; C0 adds arbitrary-ring/torsor and arithmetic-fan geometry. |
| HodgeStructures L2 | Supplies native mixed Hodge structures and their induced pure graded structures; C1 instantiates them on the boundary Lie representation. |
| Shimura varieties V0, V2, V8/V8.general | Owns pure data, rational boundary components and canonical/minimal interiors; C1 enriches boundary data and C2 compares the actual compactifications. |
| SchemeAndStackFoundations SF.0–SF.2; ComplexComparisonPartII; AdicSpacesPartII F0 | Own schemes, algebraic spaces, torsors, coherent/formal descent and the analytic carriers, including nilpotents. Their requested interfaces are not replaced with new carriers here. |
| AbelianSchemesAndArithmeticModuli; R11.3 | Own abelian duality/moduli and local polarized Raynaud theory. C4 owns its relative Mumford application. The recorded reverse R11.3 dependency needs repair before closure. |
| HilbertModularVarietiesAndShimuraCurves H1–H4 | Own HBAV moduli, cusp lattices, polarization/stabilizers, ramified local models and level towers. C6 specializes compactification geometry without recreating those objects. |
| R07.2; OverconvergentFormsAndEigenvarieties T0, T3–T5 | Own generic BT₁ Hasse/differential theory, its semiabelian extension, canonical subgroups, filtration estimates, Igusa torsors and the modified integral Hodge lattice. C6 identifies the compactified Hilbert interfaces. |
| Automorphic bundles B3–B5 and Hilbert H5 | Consume conormal, q-expansion, boundary/component and cohomological comparisons. Early C5 does not import B5; late minimal-model results can consume it. |
| Modular curves Layer 10 and ModularCurvesPartII R13.4a/b | The [reviewed ModularCurves link](../links/tauceti_TauCetiRoadmap_ModularCurves.json) is restricted to prime N≥5 diamond quotients H≤(Z/N)×/{±1}. Full and composite levels use R13.4a/b, retaining actual level, determinant, cusp-field, inertia and width data. |

## Conventions and pinned library boundary

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The 27 baseline records below retain the parts’ pinned statement checks; assembly also reads the cited statements at those commits. Source-generated additive monoid-algebra forms are recorded explicitly. The reviewed library audit is the ownership starting point; source reading is not a compilation claim.

For the coefficient algebra, let R be a commutative ring and P an additive commutative monoid. The notation R[P] means Mathlib's existing `AddMonoidAlgebra R P`. An element is a finite monomial sum; its coefficient family is the existing `coeff` field. Write e_p for the unit-coefficient monomial of degree p. The zero ring and nonreduced coefficient rings are included.

For the relative geometry, let H be a **split torus** over a scheme Z and let T → Z be a right H-torsor. Algebraic-space bases use their actual étale atlases and descent. The character lattice M is finite free; the cocharacter lattice is its integral dual. Use the common closed rational polyhedral salient cone σ and the existing additive monoid

\[
P_\sigma=\{m\in M:\langle m,v\rangle\geq0\text{ for all }v\in\sigma\}.
\]

Lan's cone convention is relatively open. His nonnegative character monoid agrees with the one for its closure. When comparing strictly positive character degrees, use the relative interior of the closed cone, not every point of a set containing the origin. For the zero cone the nonnegative monoid is all of M and the strictly positive part is empty.

A right translation by h acts on a weight-m function through multiplication by m(h). Let L_m be the corresponding invertible subsheaf of the actual pushforward of O_T. The identifications L_0 ≅ O_Z and the multiplication maps

\[
L_m\otimes L_n\longrightarrow L_{m+n}
\]

are inherited from the torsor algebra and are isomorphisms. Their associativity, symmetry and unit compatibility are retained. A family of line bundles without these coherent multiplication maps is not the input. Lan's Remark 6.1.2.2 is relevant precisely because one cannot freely choose incompatible rigidifications.

The ordinary relative chart construction is generic in T. It consumes the torsor/descent interface of SF.1 and the relative-Spec interface of SF.0. **It does not import C4.** C4 instantiates this construction with its actual cusp torsors. Thus the direction remains generic foundations → C0 → C4/early C5. The PEL component detector belongs to SF.2 after proper coherent cohomology, and feeds early C5, then B5. There is no reverse B5 dependency.

For pure characteristic-zero assertions fix the pure datum, level and actual arithmetic quotients from V0; no universal abelian scheme is presumed. For the relative degeneration assertions use the complete normal Noetherian-domain setting of Lan 4.1–4.4. For integral assertions retain the full good-prime conditions of Lan 1.4.1.1 and 1.4.1.2 and the given PEL moduli hypotheses. Individual declarations repeat the restrictions needed for their exact statements.

Three construction settings remain distinct. C2 is characteristic zero. C5's good-model statements retain Lan's good-prime PEL hypotheses. C6's Hilbert model over Z[1/N(n)] allows discriminant primes under the stated tame-level conditions; it cannot be supplied just by the good-prime C5 theorem. The consuming packet records this missing all-prime instantiation explicitly.

On a regular chart, a boundary intersection has the ideal generated by its selected coordinate variables; the union of all boundary components has ideal generated by their product. Neither ideal is replaced by its radical over a nonreduced base. Ordinary toric coordinates, completed charts and finite changed-lattice normalization are separate interfaces.

### Hilbert coefficients, cusps and ordinary conventions

Let F be a totally real number field of degree g, O its ring of integers, d its
different, and Δ_F its discriminant. For a fractional ideal f, write
f*=f⁻¹d⁻¹, the integral trace dual. Character and cocharacter lattices use the
pairing Tr_F/Q, not a Euclidean pairing chosen independently of the different.
At a real place w, τ_w is the signed embedding; the native infinite-place value
w(x) is its absolute value. The strict totally positive cone consists of elements
with τ_w(x)>0 for every w. Zero is a separate allowed Fourier exponent.

Dimitrov permits the connected determinant group D between G_m and Res_F/Q G_m.
The fine polarized moduli scheme is M¹ and its polarization-class quotient is M.
For a tame ideal n use his torsion-free hypothesis: n is prime to Δ_F and does
not divide 2 or 3, with c chosen prime to n. Write B=Z[1/N(n)] and Δ=N(d n).
The compactifications and the determinant Hodge line are over B. Smoothness and
the arbitrary integral character-weight line ωκ in §8 are used over a weight
base O′[1/Δ], with the character values and square roots needed for polarization
descent present. This distinction allows p dividing Δ_F to remain a legitimate
residue prime of the normal model over B. It does not assert that the model is
smooth there or that its natural O-differential module is rank one everywhere.

BHW uses a scalar tame N≥4, prime to p, a polarization ideal prime to N, and a
perfectoid coefficient field L extending Q_p^cyc. The ordinary model over O_L is
the completion of the tame integral model. Its extra finite p-level models in
§5.1.2 are initially defined over Q and then analytified over L. An integral
compactification at a wild level requires the H2/H4 local-model theorem specified
in the requests. An infinite tower is not itself an integral moduli scheme.

Use Mbar¹_Σ, Mbar_Σ for toroidal models and M^{1,min}, M^{min} for minimal ones.
The source’s superscript star for a minimal model has no relation to the trace
star on ideals. The fine universal family extends semiabelianly over Mbar¹_Σ.
Its conormal has Z-rank g. It has O-rank one on the Rapoport locus, including
split toric boundary charts; Δ inversion supplies the source’s global weight-line
setting. T5 owns the modified integral lattice ω^int. The natural ω⁺ transported
by C6 can differ from it when p ramifies in F.

### Cusp data and the phase character

An H1 cusp has O-lattice L, exact sequence 0→a*→L→b→0, polarization c=ab⁻¹ and
primitive tame level vector. Projecting that vector determines b′⊃b. Its exponent
e, defined by e(b′/b)=0, is an integer, distinct from the ideal n. The toric
character lattice is X=ab′=cbb′ and the cocharacter lattice is X*. The unipotent
stabilizer is X*. The diagonal stabilizer acts effectively by u²ε on characters;
its translations, diagonal subgroup and finite cyclotomic image are separate data.
The H3 congruences are u−1∈n b′b⁻¹ and uε−1∈bb′⁻¹. They were checked in the
rendered author copy of Proposition 3.3(iv), not inferred from extracted prime marks.

A change of uniformization lies in (ab)*/(ab′)*. On the cover adjoining ζ_e its
monomial action is q^ξ↦ζ_e^{eTr(ξx)}q^ξ. The integer exponent exists because
ξ∈ab′ and e(ab′)⊆ab. Moving x by (ab′)* changes that exponent by e times an
integer. The native construction below packages exactly this phase as a character
of a Z-submodule into the existing unit group. It does not create a new cusp
carrier, a period quotient or a completed series algebra.

No primitive-root hypothesis is needed for the character API. The geometric
level cover starts with the specified root, but coefficient specialization can
reduce its order. The phase remains a unit and evaluates to one at ξ=0, including
over nonreduced coefficient rings. The quotient by the wrong trace dual would
lose this distinction: for A=Z, B=(1/4)Z and ζ=2 modulo 5, changing x from 0 to 1
changes the phase at 1/4, even though 1 lies in the dual of A.

The fan is complete in the open positive cone together with zero, rational
polyhedral and locally finite away from zero, compatible with cusp isomorphisms
and finite modulo effective units. This allows infinitely many cones. Regularity
is measured in each actual X*, so a regular fan for the underlying unlevelled
cusp need not be regular for every level-ramified cusp above it. The term
“ramified cusp” describes b′≠b; it does not describe ramification of p in F.

### Koecher and boundary ideals

For g>1 the finite-index cusp units can move a nonzero exponent having a negative
real conjugate to arbitrarily negative trace pairing with a fixed positive vector.
A unit-valued coefficient law preserves nonzero coefficients. A meromorphic
section with finite pole order on a completed regular chart has a lower support
bound. These facts force its nonzero exponents to be zero or totally positive.
the requested completion of C0’s ordinary coordinate theorem and F0’s coherent completion detection then
turn support positivity into extension of the actual weight-line section.

The Noetherian proof is local on completed charts. For arbitrary coefficient
algebras the plan uses finite presentation and H0 commuting with filtered colimits
on qcqs models and their open submodels, requested from SF.0. Every section and
its relations descend to a finitely generated coefficient algebra. Completion
commuting with an arbitrary tensor product is not used. The pure coefficient
lemmas themselves need neither reducedness nor a domain assumption.

The boundary divisor is a scheme-theoretic union. In a regular chart with boundary
variables x₁,…,x_r, its ideal is (t), t=x₁⋯x_r. A totally positive lattice exponent
has a positive integer pairing with every primitive boundary ray, so its monomial
is divisible by every x_j and hence by t. A section belongs to ωκ⊗I_D precisely
when every cusp constant coefficient vanishes. It is insufficient to inspect
geometric points: a nilpotent constant coefficient is still a nonzero boundary
section. Koecher permits constant terms and therefore does not make a modular
form cuspidal. The unit-character annihilator criterion forces their vanishing
only when the relevant character-minus-one acts injectively on the coefficients.

The minimal contraction uses the determinant Hodge section ring. Six separate
outputs identify semi-ampleness, the contraction and fan independence, finite
generation and normal projectivity with polarization quotient, the cyclotomic
cusp scheme, connected inverse boundary fibres and their completions, and the
parallel-weight extension criterion. The source’s compact minimal quotient can
have nontrivial cusp stabilizers. Its fine-to-coarse map therefore has different
étaleness behaviour from the free toroidal action. Parallel weight lines descend
to the minimal model over the arithmetic weight base; the converse is not
asserted after an arbitrary reduction of that base.

### Ordinary and degree-one interfaces

R07.2 owns the generic BT₁ Hasse invariant det(V*), LF and the BT₁ Hodge–Tate
sequence, following the confirmed finding RT-AREA-padic-1/26. H2 constructs its
Hilbert Hasse ideal from that invariant. T0 extends the differential construction
to the semiabelian charts with their toric and abelian pieces. C6 identifies those
interfaces on its universal family. On a split torus Verschiebung has invertible
differential determinant, so the Hilbert boundary has unit Hasse ideal and lies
in the ordinary locus. A degenerating semiabelian family cannot be treated as an
abelian p-divisible group of constant height 2g at its toric boundary.

For 0≤ε<1, the near-ordinary condition |Ha_lift|≥|p|^ε is independent of the
chosen lift modulo p. H2 supplies the normalized admissible blowup model, with
p-torsion removed. C6 compares its generic fibre with BHW’s compactified
neighbourhood and its boundary. The endpoint ε=1 does not have the same elementary
lift-independence argument. T3 owns canonical subgroups and their numerical bounds,
including the independent p=2 input; T4 owns filtration-position estimates;
T5 owns Igusa torsors and ω^int. The compactified family and its natural lattice
are C6’s interfaces to these consumers.

For F=Q, match the actual full, fixed-pairing, Γ1 or refined Γ0 level and
coefficient field with R13.4a. The generic-fibre toroidal and minimal normal curves
agree with its compactified coarse modular curve by uniqueness of a normal proper
completion of the common dense open. R13.4b supplies analytic and correspondence
compatibility, retaining determinant components, cusp fields, inertia and cusp
widths. For a width-w cusp, q_Tate=t^w in the level cusp parameter. The comparison
with PR81 Layer 10 is restricted to prime N≥5 diamond quotients
H≤(Z/N)×/{±1}. Full and composite levels consume R13.4a’s separate construction.
Degree-one meromorphic functions can have poles at cusps, so no g=1 Koecher
statement follows from the higher-degree argument.

### Coefficient inclusions and module detection

Dimitrov–Tilouine Proposition 7.3(2), the proof cited by Dimitrov §8, explicitly
assumes R⊂R′. It proves descent using q-expansion detection for additive coefficient
modules. Flatness of R′ over R is unnecessary: tensor the coefficient exact sequence
with the line on the flat model, apply left exactness of global sections and detect
the image in the quotient module R′/R. The preceding module-detection lemma retains
prime-power thickenings, then writes arbitrary coefficients as a union of finitely generated submodules. The
invertible coefficient line gives injective coefficient maps, so zero expansion in
the union already means zero at the stage carrying the section. An infinite
product of Fourier coefficients need not commute with filtered colimits; the plan
uses coefficientwise vanishing and finite generation, with the precise generic
facts requested from SF.0/F0. The companion displays nonramified charts; Dimitrov
§8 supplies the general chart with the unit-valued cyclotomic phase.

The independently confirmed source issue E-C6-3 records the companion’s claim that both sides commute with filtered colimits, together with a direct-sum coefficient counterexample. The repair above leaves the q-expansion theorem intact; comparison with the version of record remains open.

The companion also explains the zero-object sentence after Proposition 8.5:
zero coefficient submodule gives ordinary injectivity. A zero unital ring
specialization is vacuous. The source record retains the narrower wording precision issue; no replacement of the zero coefficient object by a complex coefficient ring is needed.

C6 exports its conormal comparison to B3 and its geometric q-expansion comparison
to H5/B4. Those downstream stages are consumers; importing them into these proofs
would make a cycle.

## Sources

The source inventory below retains the part packets’ editions, exact read sections, access limitations, hashes and independent-review provenance. Assembly collates these records; it does not claim a fresh full-paper reading. Lan's revised PEL thesis supplies relative torus embeddings, degeneration/effectivity and good integral models; Pink supplies mixed boundary data, arithmetic gluing and canonical descent. Lan 2017 supplies normalized higher-level and general projective models. Pilloni, Bijakowski–Pilloni–Stroh, Boxer–Pilloni and the routed applications supply the cohomological and tower contracts. Dimitrov and Dimitrov–Tilouine supply Hilbert compactifications and arithmetic q-expansion; Birkbeck–Heuer–Williams supplies the ordinary Hilbert tower comparison. Restricted AMRT, KKMS and Faltings–Chai proof leaves remain explicit obligations.

### STACKS-NC: Normal crossings divisors

**id.** STACKS-NC

**title.** Normal crossings divisors

**authors.** The Stacks Project Authors

**edition.** Section 41.21, tag 0CBN, read in the preceding checkpoint on 26 September 2026

**url.** https://stacks.math.columbia.edu/tag/0CBN

**readSections.** Definitions 41.21.1 and 41.21.4, Lemma 41.21.2 and proof

Lemma 41.21.6, branch normalization, read only as a possible non-neat lead

**accessNote.** Preserved source provenance. These are absolute scheme criteria; relative smoothness uses the actual arithmetic-base charts.

### STACKS-STEIN: Stein factorization for algebraic spaces

**id.** STACKS-STEIN

**title.** Stein factorization for algebraic spaces

**authors.** The Stacks Project Authors

**edition.** Section 76.36, tag 0A18, and Lemma 76.36.9 at 0E0D, read in the preceding checkpoint on 26 September 2026

**url.** https://stacks.math.columbia.edu/tag/0A18

**readSections.** Lemma 76.36.1, Theorem 76.36.4 and its proof

Lemma 76.36.9 and its proof, also opened at https://stacks.math.columbia.edu/tag/0E0D

**accessNote.** Generic component detection is assigned to SF.2 after spaces/descent and proper coherent cohomology. Its C5 specialization is a deduction, not a separately numbered theorem claimed in Lan.

### BRESCIANI-2024: On the birational section conjecture with strong birationality assumptions

**id.** BRESCIANI-2024

**title.** On the birational section conjecture with strong birationality assumptions

**authors.** Giulio Bresciani

**edition.** Publisher open-access PDF, Inventiones 235 (2024), pp. 129–150

**url.** https://link.springer.com/content/pdf/10.1007/s00222-023-01220-6.pdf

**sha256.** 77c20bc77743abd3cabedbe6259a4bd686cb94823481bce724c3517b1c30e148

**accessDate.** 2026-10-06

**readSections.** Lemma 8 proof, published p. 138: semi-abelian extension and full profinite Tate modules; no full-paper reading claimed

**accessNote.** The named passages were read, not the whole source. Unread supporting proofs and version comparisons are listed explicitly in gaps. The SHA-256 records the inspected PDF binary.

### FARB-KISIN-WOLFSON-2024: Essential dimension via prismatic cohomology

**id.** FARB-KISIN-WOLFSON-2024

**title.** Essential dimension via prismatic cohomology

**authors.** Benson Farb, Mark Kisin and Jesse Wolfson

**edition.** arXiv:2110.05534v2, 27 February 2024; publisher copy not collated

**url.** https://arxiv.org/pdf/2110.05534v2

**sha256.** f281f903f7a1836ef0eb7abe718c78e72f481d059cecb91dd237e6ecfe83b26b

**accessDate.** 2026-10-06

**readSections.** 3.2.1 and Lemma 3.2.2, printed p. 24; Proposition 3.2.7 proof, p. 25: torus torsors over abelian varieties, character lines and locally trivial compactified torsors

**accessNote.** The named passages were read, not the whole source. Unread supporting proofs and version comparisons are listed explicitly in gaps. The SHA-256 records the inspected PDF binary.

### LAN-2021: Arithmetic compactifications of PEL-type Shimura varieties

**id.** LAN-2021

**title.** Arithmetic compactifications of PEL-type Shimura varieties

**authors.** Kai-Wen Lan

**edition.** Author-hosted thesis revision, 14 March 2021; publisher edition not inspected

**url.** https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf

**sha256.** a7a454f5d0735f4bf11f00a8afc14c361c5fc2cefd691d7466f7620ab4c3a079

**accessDate.** 2026-10-06

**readSections.** 1.4.1.1 and standing good-prime restrictions; 3.3.1.1–3.3.1.10, printed pp. 191–193; selected 3.3.2 semistable-reduction context

4.1, printed pp. 207–208; 4.2.1.13–4.2.1.14, pp. 213–214; 4.4.1–4.4.16, pp. 250–255; 4.5.2.15–4.5.2.18, pp. 273–275; 4.5.3.6 and surrounding graph proof; 4.5.4.17 numerical lemma

6.1.1.2–6.1.1.11 and 6.1.2.1–6.1.2.8: relative torus charts, ordinary embeddings and coordinate ideals, retained checkpoint analysis

6.2.5.25–6.2.5.28 formal degeneration/stabilizers; 6.3.2.5–6.3.2.9, pp. 503–505, freshly read two-embedding good algebraic-model definition and existence

6.3.3.13 proof and 6.3.3.14–6.3.3.16, pp. 514–518, freshly read ordinary etale relation and quotient descent

6.4.1.1 and proof, pp. 519–523, freshly read; 7.1.1.4–7.1.1.5 and proof, pp. 532–533, arbitrary coefficient modules

7.2.1.1–7.2.1.2, pp. 540–541; 7.2.2.6 and 7.2.3 construction, pp. 544–546; 7.2.3.5–7.2.3.10, pp. 547–548; selected 7.1.2 Fourier–Jacobi consumer context

Independent review: Proposition 3.1.5.1 (p. 183), 4.2.1.7 (p. 210), Definition 4.4.6/Remark 4.4.7 (p. 251), Definitions 6.3.3.4/6.3.3.7 and Proposition 6.3.3.17 (pp. 512–518), and the explicit Stein structure-sheaf equality (p. 544).

**accessNote.** The named passages were read, not the whole source. Unread supporting proofs and version comparisons are listed explicitly in gaps. The SHA-256 records the inspected PDF binary.

### LAN-ERRATA: Arithmetic compactifications of PEL-type Shimura varieties: errata

**id.** LAN-ERRATA

**title.** Arithmetic compactifications of PEL-type Shimura varieties: errata

**authors.** Kai-Wen Lan

**edition.** Author-hosted list, 14 March 2021

**url.** https://www.kwlan.org/articles/cpt-PEL-type-book-pup-err.pdf

**sha256.** 14343693efbc34ef8e9fa63e65ac9586c663d1c731409c0db64ec39a7e84eb88

**accessDate.** 2026-10-06

**readSections.** Items 60–77, approximation/etaleness, label and torsor corrections

**accessNote.** The named passages were read, not the whole source. Unread supporting proofs and version comparisons are listed explicitly in gaps. The SHA-256 records the inspected PDF binary.

### LAN-2017: Integral models of toroidal compactifications with projective cone decompositions

**id.** LAN-2017

**title.** Integral models of toroidal compactifications with projective cone decompositions

**authors.** Kai-Wen Lan

**edition.** Author-hosted published-paper copy, IMRN 2017

**url.** https://www.kwlan.org/articles/cpt-ram-nbl.pdf

**sha256.** ff2229d32fc6dd99174d8ff392ebdf6c93c3a455118bd7d54f54a74a967d31ac

**accessDate.** 2026-10-06

**readSections.** Definitions 2.1, 2.2, 2.5, 2.7 and Proposition 2.8: compatible projective fans and concave/superadditive convention

Theorem 6.1(1)–(6) and beginning of proof, printed pp. 22–24: normalized integral models; not the full referenced normalization proof

Proposition 7.5 and proof 7.10–7.14, pp. 27–29: structure sheaf, boundary ideal and higher direct-image vanishing; KKMS Corollary 2, p. 44, remains unread

Definition 8.5, Theorems 8.6–8.7, Remarks 8.9–8.10, pp. 34–35: exact coefficient form, simple-algebra hypothesis and dimension-one exception; Propositions 8.3–8.4/the cited [17] proof are incomplete proof leaves

Independent review also read Sections 1–2 setup (pp. 3–5), Construction 3.1, Definition 3.5, Construction 3.12 (pp. 7–9), Construction 4.5 (p. 11), and Proposition 7.1 setup (p. 27); full Sections 4–5 proof remains a gap.

**accessNote.** The named passages were read, not the whole source. Unread supporting proofs and version comparisons are listed explicitly in gaps. The SHA-256 records the inspected PDF binary.

### PINK-1990: Arithmetical compactification of mixed Shimura varieties

**id.** PINK-1990

**title.** Arithmetical compactification of mixed Shimura varieties

**authors.** Richard Pink

**edition.** Author-hosted dissertation text; publisher edition not compared

**url.** https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf

**sha256.** 6f8aa447ccf54368d465a9d45f44bc91f0d35440cba04e20061c576145ca8669

**accessDate.** 2026-10-06

**readSections.** 2.1, printed pp. 29–30, with rendered p. 30 inspection; 3.12–3.22, pp. 47–53, torus/abelian torsor and polarization construction

4.7–4.16, pp. 59–64; 4.22–4.25, pp. 68–69: boundary datum, filtrations and positivity/incidence

6.4–6.7, pp. 96–99; 6.10–6.12, pp. 100–102; 6.18–6.21, pp. 105–109; 6.22–6.27, pp. 110–115: charts, quotient topology, gluing/maps and compactness

7.2–7.5, pp. 118–120: strata; 9.17–9.25, pp. 153–158: smooth/projective refinements and finite compatibility

12.1–12.8, pp. 196–199: toroidal canonical models and descent; 12.13–12.17 special mixed-model construction not read

**accessNote.** The named passages were read, not the whole source. Unread supporting proofs and version comparisons are listed explicitly in gaps. The SHA-256 records the inspected PDF binary.

### BPS-2016: Classicite de formes modulaires surconvergentes

**id.** BPS-2016

**title.** Classicite de formes modulaires surconvergentes

**authors.** Stephane Bijakowski, Vincent Pilloni and Benoit Stroh

**edition.** Publisher PDF, Annals of Mathematics 183 (2016) no. 3

**url.** https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p05-p.pdf

**sha256.** 13c159cde16c09c98de6b29ed1cf0e293ae78e5dc250399a1ee9203b3601d92c

**accessDate.** 2026-10-06

**readSections.** 5.1–5.2, printed pp. 1009–1010: normalization model compactification, coefficient extension and mod pi^n Koecher; identification with the moduli model remains a separate Part II target

**accessNote.** The named passages were read, not the whole source. Unread supporting proofs and version comparisons are listed explicitly in gaps. The SHA-256 records the inspected PDF binary.

### BP-2026: Higher Hida theory for Siegel modular forms

**id.** BP-2026

**title.** Higher Hida theory for Siegel modular forms

**authors.** George Boxer and Vincent Pilloni

**edition.** Author copy built 5 November 2025, 65 pages; Springer version of record not compared

**url.** https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf

**sha256.** af70d084612b1b75761694923ef2395752d23b41e0b8b458910d096df4c8c3c6

**accessDate.** 2026-10-06

**readSections.** 3.4.15–3.4.16, p. 39: toric/coherent vanishing in the partial ordinary tower setting

4.1.1, p. 41, semi-abelian isogeny chains; 4.2.2, p. 43, extension/quasi-finite flat isogenies; routed kernel-finiteness correction

**accessNote.** The named passages were read, not the whole source. Unread supporting proofs and version comparisons are listed explicitly in gaps. The SHA-256 records the inspected PDF binary.

### PILLONI-2020: Higher coherent cohomology and p-adic modular forms of singular weights

**id.** PILLONI-2020

**title.** Higher coherent cohomology and p-adic modular forms of singular weights

**authors.** Vincent Pilloni

**edition.** Author copy dated 17 June 2019, 113 pages; Duke version of record not compared

**url.** https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf

**sha256.** 4c05724efeab1dbbb108f980ec9a722127d2a8cd2abf6e8c2a6a2251cf0f9f58

**accessDate.** 2026-10-06

**readSections.** Selected 3.4, pp. 15–16, monoidal/adic vanishing setting; 5.3, p. 24, coherent cohomology and boundary ideals

Theorem 6.1.5.1, p. 29: refinement pullback error, corrected derived boundary-ideal comparison

11.1.1, p. 66: ordinary Koecher assertion; 13.2.1, p. 85: exact Klingen correspondence, subgroup formula and asserted acyclicity

**accessNote.** The named passages were read, not the whole source. Unread supporting proofs and version comparisons are listed explicitly in gaps. The SHA-256 records the inspected PDF binary.

### PILLONI-2012: Sur la theorie de Hida pour le groupe GSp4

**id.** PILLONI-2012

**title.** Sur la theorie de Hida pour le groupe GSp4

**authors.** Vincent Pilloni

**edition.** Publisher PDF, Bulletin de la SMF 140 (2012), pp. 335–400

**url.** https://smf.emath.fr/system/files/2017-08/smf_bull_140_335-400.pdf

**sha256.** 605f046df3f91c6405fa5b18d377e0ef3eb913398220238291a76bc16ed266c2

**accessDate.** 2026-10-06

**readSections.** 4.1.2, printed pp. 350–351: compactified subgroup extension at prime-to-base level

**accessNote.** The named passages were read, not the whole source. Unread supporting proofs and version comparisons are listed explicitly in gaps. The SHA-256 records the inspected PDF binary.

### CG-2020: Minimal modularity lifting for non-regular symplectic representations

**id.** CG-2020

**title.** Minimal modularity lifting for non-regular symplectic representations

**authors.** Frank Calegari and David Geraghty

**edition.** Author-hosted Duke typeset copy, 96 pages; page numbers offset by 800 in publisher pagination

**url.** https://math.uchicago.edu/~fcale/papers/Siegel.pdf

**sha256.** fff305877c7e6b9d32ca9a8b4a56f7f3b343695fc737184d1a3a1b78f195cfa5

**accessDate.** 2026-10-06

**readSections.** 5.2, published pp. 821–822: Siegel compactification, arbitrary coefficients, fan independence, Koecher and compactified generator cover

5.3, published pp. 830–831: canonical/subcanonical duality identity

A.3.2, published pp. 886–888: ordinary/refinement coherent comparison setting

**accessNote.** The named passages were read, not the whole source. Unread supporting proofs and version comparisons are listed explicitly in gaps. The SHA-256 records the inspected PDF binary.

### BCGP-2021: Abelian surfaces over totally real fields are potentially modular

**id.** BCGP-2021

**title.** Abelian surfaces over totally real fields are potentially modular

**authors.** George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni

**edition.** arXiv:1812.09269v3; publisher edition not collated

**url.** https://arxiv.org/pdf/1812.09269v3

**sha256.** 7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed

**accessDate.** 2026-10-06

**readSections.** 8.2, published locator p. 240: genus-two Hilbert–Siegel minimal boundary codimension, normal formal model and H0 Hartogs

**accessNote.** The named passages were read, not the whole source. Unread supporting proofs and version comparisons are listed explicitly in gaps. The SHA-256 records the inspected PDF binary.

### BCGP-2025: Modularity of abelian surfaces

**id.** BCGP-2025

**title.** Modularity of abelian surfaces

**authors.** George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni

**edition.** arXiv:2502.20645v1; publisher edition not collated

**url.** https://arxiv.org/pdf/2502.20645v1

**sha256.** 51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c

**accessDate.** 2026-10-06

**readSections.** Theorem 1.8.29 and beginning of proof, p. 17: hyperspecial good-reduction geometry and Lan–Stroh nearby-cycle/open comparison plus duality

**accessNote.** The named passages were read, not the whole source. Unread supporting proofs and version comparisons are listed explicitly in gaps. The SHA-256 records the inspected PDF binary.

### YUAN-2024: Arithmetic bigness and a uniform Bogomolov-type result

**id.** YUAN-2024

**title.** Arithmetic bigness and a uniform Bogomolov-type result

**authors.** Xinyi Yuan

**edition.** arXiv:2108.05625v4, 30 April 2024, text dated 1 May 2024; requested 2026 publisher edition not compared

**url.** https://arxiv.org/pdf/2108.05625v4

**sha256.** a4e4c3d79e0912b62961a4b45b08e1e5c6957b0b64af7da74647c8ff9361e11e

**accessDate.** 2026-10-06

**readSections.** 3.4, end, printed pp. 55–56: minimal Siegel coarse compactification and ample Hodge Q-line; author-hosted requested copy connection refused

**accessNote.** The named passages were read, not the whole source. Unread supporting proofs and version comparisons are listed explicitly in gaps. The SHA-256 records the inspected PDF binary.

### LAN-2017-ERRATA: Kai-Wen Lan, Integral models of toroidal compactifications with projective cone decompositions — errata

**id.** LAN-2017-ERRATA

**title.** Kai-Wen Lan, Integral models of toroidal compactifications with projective cone decompositions — errata

**url.** https://www.kwlan.org/articles/cpt-ram-nbl-err.pdf

**access.** public

**readSections.** One-page author errata, items (1)–(3); finite etale group scheme averaging and the dimension-one exception in Theorem 8.7.

**authors.** Kai-Wen Lan

**edition.** Author-hosted one-page errata, inspected independently

**sha256.** e0ecf94c74332660867965dc9877836ef97f2a03161c53b5f0ff1a1a7f616b04

**accessDate.** 2026-10-06

**accessNote.** Linked from the author academic bibliography; all three numbered corrections read. Publisher version not compared.

### DIMITROV-2004-v3: Compactifications arithmétiques des variétés de Hilbert et formes modulaires de Hilbert pour Γ1(c,n)

**id.** DIMITROV-2004-v3

**title.** Compactifications arithmétiques des variétés de Hilbert et formes modulaires de Hilbert pour Γ1(c,n)

**authors.** Mladen Dimitrov

**edition.** arXiv math/0212071v3, 7 November 2004, 28 physical pages

**url.** https://arxiv.org/pdf/math/0212071v3

**sha256.** e590480f6a0f29048502721505e5742a0fec2c86fa8629909a480978696a16da

**accessDate.** 2026-09-26

**readSections.** Entire 28-page preprint: introduction, §§1–8 and bibliography; read in batches of at most three physical pages.

Koecher and Fourier arguments: pp. 22–24; rendered p. 24 inspected.

Comparison with author-hosted typeset copy: physical pp. 1, 22–24, with printed pp. 546–548 at the latter three pages; rendered printed p. 547 inspected.

**accessNote.** The publisher DOI page returned HTTP 405. The author-hosted 27-page typeset copy has pagination differing from the published citation pp. 527–554; it is recorded as an author copy, not asserted to be the publisher version. Other cited books and papers in its bibliography have not been independently read for this packet.

**independentReviewReadSections.** Proof-issue passages in pp. 23–24 collated against the author copy on 2026-10-06; not a new full-preprint reading.

### DIMITROV-AUTHOR: Compactifications arithmétiques des variétés de Hilbert et formes modulaires de Hilbert pour Γ1(c,n)

**id.** DIMITROV-AUTHOR

**title.** Compactifications arithmétiques des variétés de Hilbert et formes modulaires de Hilbert pour Γ1(c,n)

**authors.** Mladen Dimitrov

**edition.** Author-hosted typeset copy, 27 physical pages, printed pp. 525–551; not certified as the publisher version of record

**url.** https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf

**sha256.** 722986ce0343547cdbc6cd7d39fa524a9c967f3ab42fdd231cc3acd87b006f03

**accessDate.** 2026-10-06

**readSections.** Entire author copy, §§1–8 and bibliography.

Rechecked Definition 3.2, Proposition 3.3(iv), Proposition 4.1, Theorem 7.2, Corollaries 7.4–7.5, Proposition 7.6, Theorem 7.7, equation (5), Theorem 8.3, Proposition 8.5, and all six assertions of Theorem 8.6.

**independentReviewReadSections.** Entire author copy, introduction, sections 1–8 and bibliography; all cited locators rechecked on 2026-10-06.

### BHW-2023: Overconvergent Hilbert modular forms via perfectoid modular varieties

**id.** BHW-2023

**title.** Overconvergent Hilbert modular forms via perfectoid modular varieties

**authors.** Christopher Birkbeck, Ben Heuer and Chris Williams

**edition.** Annales de l’Institut Fourier 73(4) (2023), pp. 1709–1794, DOI 10.5802/aif.3560

**url.** https://www.numdam.org/item/10.5802/aif.3560.pdf

**sha256.** d59b7f701eb5258c351d959be08d49f17946245ed1e5779317d2371981c2c5c4

**accessDate.** 2026-10-06

**readSections.** §1.5 notation and §2.1 elliptic compactification and Hasse neighbourhoods.

§5.1 moduli/level conventions and §5.2 ordinary neighbourhoods and boundary inputs to Lemma 5.12.

Remark 6.9, §7.1 semiabelian and natural versus modified integral differentials.

§8.1 finite polarization action, §8.2 mixed full levels, §8.4 tower actions; Remark 9.9 and Theorem 9.12 inspected for consumer boundaries.

**independentReviewReadSections.** Section 2.1 elliptic conventions; sections 5.1–5.2, 7.1, 8.1–8.4, at every cited locator, on 2026-10-06. The source consumer results listed in the author’s readSections are not claimed as a fresh whole-paper reading.

### MODULAR-CURVES-II: Modular curves, Part II: integral models and p-adic geometry

**id.** MODULAR-CURVES-II

**title.** Modular curves, Part II: integral models and p-adic geometry

**authors.** Tau Ceti Atlas roadmap programme

**edition.** Roadmap supplier contract at this repository’s main input; layers R13.4a and R13.4b

**url.** https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/ModularCurvesPartII/README.md

**readSections.** R13.4a and R13.4b with their dependencies; reviewed Modular Curves link-map entries into C6.

**accessDate.** 2026-10-06

**accessNote.** A supplier scope, not evidence that the comparison is implemented. Its exact statements are requested below.

**independentReviewReadSections.** Whole supplier roadmap and exact R13.4a/R13.4b statements; Modular Curves Layer 10 prime-N diamond-quotient scope checked on 2026-10-06.

### DIMITROV-TILOUINE-AUTHOR: Variétés et formes modulaires de Hilbert arithmétiques pour Γ1(c,n)

**id.** DIMITROV-TILOUINE-AUTHOR

**title.** Variétés et formes modulaires de Hilbert arithmétiques pour Γ1(c,n)

**authors.** Mladen Dimitrov and Jacques Tilouine

**edition.** Author-hosted typeset copy, 58 physical pages, printed pp. 553–610; not certified as the publisher version of record

**url.** https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad16-DiTi.pdf

**sha256.** 184736dfe17df7202a8ab2913f53a763b6459daaef29001c7a75b4ed3e746f29

**accessDate.** 2026-10-06

**readSections.** §7 opening geometric irreducibility and weight extensions, Koecher Theorem 7.1, q-expansion Definition 7.2, Proposition 7.3 and its complete proof, Remark 7.4, printed pp. 584–586.

**accessNote.** This source restricts its displayed q-expansion charts to nonramified cusps and refers to Dimitrov §8 for general cusps. Only the stated passage was read, not the whole paper.

**independentReviewReadSections.** Entire cited section 7 passage, printed pp. 584–586, on 2026-10-06; no claim to have read the whole paper.

### Source versions

**kind.** published

**sourceId.** BRESCIANI-2024

**url.** https://link.springer.com/content/pdf/10.1007/s00222-023-01220-6.pdf

**sha256.** 77c20bc77743abd3cabedbe6259a4bd686cb94823481bce724c3517b1c30e148

**citation.** Publisher open-access PDF, Inventiones 235 (2024), pp. 129–150

**read.** 2026-10-06

**kind.** preprint

**sourceId.** FARB-KISIN-WOLFSON-2024

**url.** https://arxiv.org/pdf/2110.05534v2

**sha256.** f281f903f7a1836ef0eb7abe718c78e72f481d059cecb91dd237e6ecfe83b26b

**citation.** arXiv:2110.05534v2, 27 February 2024; publisher copy not collated

**read.** 2026-10-06

**kind.** author copy

**sourceId.** LAN-2021

**url.** https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf

**sha256.** a7a454f5d0735f4bf11f00a8afc14c361c5fc2cefd691d7466f7620ab4c3a079

**citation.** Author-hosted thesis revision, 14 March 2021; publisher edition not inspected

**read.** 2026-10-06

**kind.** author copy

**sourceId.** LAN-ERRATA

**url.** https://www.kwlan.org/articles/cpt-PEL-type-book-pup-err.pdf

**sha256.** 14343693efbc34ef8e9fa63e65ac9586c663d1c731409c0db64ec39a7e84eb88

**citation.** Author-hosted list, 14 March 2021

**read.** 2026-10-06

**kind.** author copy

**sourceId.** LAN-2017

**url.** https://www.kwlan.org/articles/cpt-ram-nbl.pdf

**sha256.** ff2229d32fc6dd99174d8ff392ebdf6c93c3a455118bd7d54f54a74a967d31ac

**citation.** Author-hosted published-paper copy, IMRN 2017

**read.** 2026-10-06

**kind.** author copy

**sourceId.** PINK-1990

**url.** https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf

**sha256.** 6f8aa447ccf54368d465a9d45f44bc91f0d35440cba04e20061c576145ca8669

**citation.** Author-hosted dissertation text; publisher edition not compared

**read.** 2026-10-06

**kind.** published

**sourceId.** BPS-2016

**url.** https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p05-p.pdf

**sha256.** 13c159cde16c09c98de6b29ed1cf0e293ae78e5dc250399a1ee9203b3601d92c

**citation.** Publisher PDF, Annals of Mathematics 183 (2016) no. 3

**read.** 2026-10-06

**kind.** author copy

**sourceId.** BP-2026

**url.** https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf

**sha256.** af70d084612b1b75761694923ef2395752d23b41e0b8b458910d096df4c8c3c6

**citation.** Author copy built 5 November 2025, 65 pages; Springer version of record not compared

**read.** 2026-10-06

**kind.** author copy

**sourceId.** PILLONI-2020

**url.** https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf

**sha256.** 4c05724efeab1dbbb108f980ec9a722127d2a8cd2abf6e8c2a6a2251cf0f9f58

**citation.** Author copy dated 17 June 2019, 113 pages; Duke version of record not compared

**read.** 2026-10-06

**kind.** published

**sourceId.** PILLONI-2012

**url.** https://smf.emath.fr/system/files/2017-08/smf_bull_140_335-400.pdf

**sha256.** 605f046df3f91c6405fa5b18d377e0ef3eb913398220238291a76bc16ed266c2

**citation.** Publisher PDF, Bulletin de la SMF 140 (2012), pp. 335–400

**read.** 2026-10-06

**kind.** author copy

**sourceId.** CG-2020

**url.** https://math.uchicago.edu/~fcale/papers/Siegel.pdf

**sha256.** fff305877c7e6b9d32ca9a8b4a56f7f3b343695fc737184d1a3a1b78f195cfa5

**citation.** Author-hosted Duke typeset copy, 96 pages; page numbers offset by 800 in publisher pagination

**read.** 2026-10-06

**kind.** preprint

**sourceId.** BCGP-2021

**url.** https://arxiv.org/pdf/1812.09269v3

**sha256.** 7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed

**citation.** arXiv:1812.09269v3; publisher edition not collated

**read.** 2026-10-06

**kind.** preprint

**sourceId.** BCGP-2025

**url.** https://arxiv.org/pdf/2502.20645v1

**sha256.** 51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c

**citation.** arXiv:2502.20645v1; publisher edition not collated

**read.** 2026-10-06

**kind.** preprint

**sourceId.** YUAN-2024

**url.** https://arxiv.org/pdf/2108.05625v4

**sha256.** a4e4c3d79e0912b62961a4b45b08e1e5c6957b0b64af7da74647c8ff9361e11e

**citation.** arXiv:2108.05625v4, 30 April 2024, text dated 1 May 2024; requested 2026 publisher edition not compared

**read.** 2026-10-06

**kind.** author copy

**sourceId.** LAN-2017-ERRATA

**url.** https://www.kwlan.org/articles/cpt-ram-nbl-err.pdf

**sha256.** e0ecf94c74332660867965dc9877836ef97f2a03161c53b5f0ff1a1a7f616b04

**citation.** One-page author-hosted errata linked from the author bibliography; publisher version not collated

**read.** 2026-10-06

**kind.** preprint

**url.** https://arxiv.org/pdf/math/0212071v3

**read.** 2026-09-26

**sha256.** e590480f6a0f29048502721505e5742a0fec2c86fa8629909a480978696a16da

**reviewRead.** 2026-10-06

**reviewNote.** SHA256 independently confirmed. Only the proof-issue passages collated; original full reading retained as author evidence.

**kind.** author copy

**url.** https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf

**read.** 2026-10-06

**sha256.** 722986ce0343547cdbc6cd7d39fa524a9c967f3ab42fdd231cc3acd87b006f03

**citation.** Entire author-hosted typeset copy read; not certified as the publisher version.

**reviewRead.** 2026-10-06

**reviewNote.** SHA256 independently confirmed. Exact reading scope is recorded in the corresponding sources entry; publisher version remains unverified.

**kind.** author copy

**url.** https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad16-DiTi.pdf

**read.** 2026-10-06

**sha256.** 184736dfe17df7202a8ab2913f53a763b6459daaef29001c7a75b4ed3e746f29

**citation.** Author-hosted typeset copy, 58 physical pages, printed pp. 553–610; not certified as the publisher version of record

**reviewRead.** 2026-10-06

**reviewNote.** SHA256 independently confirmed. Exact reading scope is recorded in the corresponding sources entry; publisher version remains unverified.

## Layer overview

| Layer | Construction and output | Nodes | Planets | Status |
| --- | --- | ---: | ---: | --- |
| C0 | Relative/integral torus charts and arithmetic-admissible refinements | 17 | 5 | planned |
| C1 | Mixed boundary data, torsor towers, labels and effective stabilizers | 6 | 5 | planned |
| C2 | Arithmetic gluing, properness, boundary and canonical models | 9 | 6 | planned |
| C2.general | Canonical models for general pure data | 1 | 1 | planned |
| C3 | Refinement, level and Hecke maps; derived boundary comparisons | 12 | 5 | planned |
| C3.general | Reflex-field descent of general-data maps and spans | 1 | 1 | planned |
| C4 | Relative semiabelian degeneration, effectivity and extended structures | 14 | 5 | planned |
| C5 | Integral PEL models, boundary geometry and minimal contractions | 30 | 6 | planned |
| C6 | Hilbert/modular models, Koecher, q-expansions and ordinary interfaces | 52 | 6 | planned |

The implementation order is finer than the displayed stages. Early C1 mixed groups and stabilizers precede C0 arithmetic fans; late C1 labels consume those fans. Generic C0 torsor geometry precedes C4 cusp instantiation. Early C5 toroidal properness and boundary/component geometry precede B5; late C5 Hodge/minimal geometry follows it. C6 consumes exact ordinary C0/C3/C4 nodes where they match and retains completion, all-prime and changed-level gaps where they do not. These interfaces require no alteration of reviewed node statements.

## Declaration catalogue

Each entry states its hypotheses, construction/proof, direct prerequisites, sources and acceptance properties. An external stage is a supplier contract, not an implemented declaration. Every definition/construction retains its named API and tests. Proposed module paths and planets are recorded with their nodes.

## C0. Relative/integral torus charts and arithmetic-admissible refinements

The coefficient calculation precedes the arithmetic quotient. For an additive submonoid F with the face property, restriction R[P] → R[F] preserves multiplication, has the existing inclusion as a section, and has kernel the ideal generated by off-face monomials. The quotient retains the coefficient ring, including nilpotents. The native first isomorphism theorem and degree/coefficient maps supply the general algebra; the new statements identify their particular toric face instance.

For a right split-torus torsor, the character lines form a subalgebra of the actual torsor algebra. Relative Spec and ordinary character localizations construct its chart and face opens. A primitive integral basis gives polynomial and Laurent coordinates. Simpliciality alone does not give these coordinates. Boundary intersections use scheme-theoretic coordinate ideals; exact opens invert the complementary monomial, whose injectivity on the monomial basis proves universal schematic density.

The integral finite-fan scheme is constructed once over Z and base changed to every commutative ring, including non-Noetherian valuation rings. This is the single supplier for the Binda–Kato–Vezzani route. That route owns formal completion, adic generic fibres and perfectoid geometry. Arithmetic cone systems can have infinitely many cones and finitely many arithmetic orbits. Their local finiteness is on the open positivity domain. Common refinements handle a specified finite family of maps; smooth projective refinements keep an invariant integral polarization. Properness requires the support criterion and the actual quotient finiteness/separation inputs. Over the empty base every map is proper, so necessity of the support criterion requires a nonempty base.

**Remaining construction contracts.**

- Arithmetic admissibility/effective stabilizers and simultaneous smooth/projective construction proof leaves; uniform arbitrary-ring/torsor gluing with the requested native geometric interfaces.
- Geometric declaration/API/test signatures listed in the suggested-file omission ledger need actual supplier carriers. No stage is closed or implemented.

### The integral face projection

**Node:** `ShimuraCompactifications:C0/face-projection`. **Declaration:** `AddMonoidAlgebra.faceProjection`. **Kind:** construction. **Implementation:** unchecked.

Construct the R-algebra homomorphism pi_(R,F): R[P] to R[F] that restricts a finite coefficient family to F. On the monomial r e_p it is r e_(p in F) when p belongs to F and zero otherwise. Its underlying additive map is the pinned coefficient restriction comapDomain along the inclusion F to P. In particular this is not an augmentation, reduction of R, or an arbitrary linear map renamed a stratum restriction.

**Hypotheses.**

- R is a commutative ring, including the zero ring; P is an additive commutative monoid.
- F is an existing additive submonoid of P with the explicit face condition: for all a,b in P, a+b belongs to F if and only if both a and b belong to F. No replacement face or monoid carrier is introduced.

**Construction or proof.**

1. Reuse the existing additive monoid-algebra carrier and its coefficient restriction along the injective subtype map. The additive operation is already in the pinned library.
2. For multiplication, reduce by finite bilinearity to e_a e_b=e_(a+b). The face condition says exactly that the product survives precisely when both factors survive. The surviving subtype sum is the original sum. This proves multiplicativity without cancellation, reducedness or a domain hypothesis.
3. Zero belongs to F, so e_0 maps to e_0 and every scalar is preserved. Package these laws as an AlgHom. Equivalently apply the pinned AddMonoidAlgebra.lift to the monomial-or-zero multiplicative map; the lift universal property proves agreement with coefficient restriction.

**Planning API.**

- `AddMonoidAlgebra.faceProjection_eq_comapDomain` (compatibility): For every f in R[P], pi_(R,F)(f) equals comapDomain along the injective inclusion F to P applied to f.
- `AddMonoidAlgebra.faceProjection_single_mem` (simp): For p in F and r in R, pi_(R,F)(r e_p)=r e_(p in F).
- `AddMonoidAlgebra.faceProjection_single_not_mem` (simp): For p outside F and r in R, pi_(R,F)(r e_p)=0.
- `AddMonoidAlgebra.faceProjection_coeff` (projection): For f in R[P] and m in F, the m-coefficient of pi_(R,F)(f) is the underlying m-coefficient of f; promoted to face-projection-coeff.
- `AddMonoidAlgebra.faceProjection_comp_inclusion` (relation): The composite R[F] to R[P] to R[F] is the identity; promoted to face-projection-section.
- `AddMonoidAlgebra.faceProjection_coefficient_change` (functoriality): For every ring homomorphism R to S, coefficient change commutes with pi; promoted to face-projection-coefficient-change.

**Unit tests.**

- `AddMonoidAlgebra.faceProjection_zero_test` (degenerate): The zero element of R[P] maps to zero in R[F].
- `AddMonoidAlgebra.faceProjection_positive_test` (computation): For R=Z/4, P=N and F={0}, pi(e_1)=0.
- `AddMonoidAlgebra.faceProjection_nilpotent_test` (non-example): For R=Z/4, P=N and F={0}, the zero-degree coefficient of pi(2 e_0) is 2, hence nonzero. The nonzero nilpotent scalar is retained.
- `AddMonoidAlgebra.faceProjection_laurent_test` (compatibility): For R=Z, P=Z and F=P, the coefficient in degree -1 of pi(e_(-1)) is 1. Invertible character directions are not discarded.

**Consumers.**

- `ShimuraCompactifications:C0/relative-stratum-quotient`: Realizes the local restriction from a torus embedding to its closed orbit without reducing the base.
- `ShimuraCompactifications:C0/relative-boundary-coordinates`: Kills the selected coordinate directions in the actual scheme-theoretic boundary ideal.

**Direct prerequisites.**

- `mathlib:MonoidAlgebra.comapDomain`
- `mathlib:AddMonoidAlgebra.lift`
- `mathlib:AddMonoidAlgebra.lift_single`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.1.2.1–6.1.2.6, especially the homogeneous quotient in Lemma 6.1.2.6: This is the general coefficient-algebra proof behind the source toric-stratum quotient, written in existing monoid-algebra vocabulary. The extension to an arbitrary face submonoid is proved here, not attributed to a separately numbered general theorem in Lan.

**Acceptance.**

- For R nonzero and P=N, F={0}, the positive-degree monomial maps to zero but the constant one does not.
- The face assumption cannot be dropped: restriction to the even submonoid of N kills e_1 but retains e_2, although e_1 squared is e_2.

**Proposed library placement.** **module.** TauCeti/Algebra/MonoidAlgebra/FaceProjection

**namespace.** AddMonoidAlgebra

### Coefficients of the face projection

**Node:** `ShimuraCompactifications:C0/face-projection-coeff`. **Declaration:** `AddMonoidAlgebra.faceProjection_coeff`. **Kind:** lemma. **Implementation:** unchecked.

For f in R[P] and m in F, coeff_m(pi_(R,F)(f))=coeff_m(f). This is the named coefficient API used by the kernel and base-change arguments.

**Hypotheses.**

- R is a commutative ring, including the zero ring; P is an additive commutative monoid.
- F is an existing additive submonoid of P with the explicit face condition: for all a,b in P, a+b belongs to F if and only if both a and b belong to F. No replacement face or monoid carrier is introduced.

**Construction or proof.**

1. Evaluate the coefficient restriction used in face-projection at the subtype element m. Injectivity of the subtype inclusion makes this precisely the coefficient at its underlying element. No summation of distinct degrees occurs.

**Direct prerequisites.**

- `ShimuraCompactifications:C0/face-projection`
- `mathlib:MonoidAlgebra.comapDomain`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.1.2.6, homogeneous components of the quotient: Makes the degreewise content of the source quotient explicit.

**Acceptance.**

- The formula also holds when R is zero or when the coefficient is nilpotent.

**Proposed library placement.** **module.** TauCeti/Algebra/MonoidAlgebra/FaceProjection

**namespace.** AddMonoidAlgebra

### A section of the face projection

**Node:** `ShimuraCompactifications:C0/face-projection-section`. **Declaration:** `AddMonoidAlgebra.faceProjection_comp_inclusion`. **Kind:** lemma. **Implementation:** unchecked.

Let i_F:R[F] to R[P] be the existing monoid-algebra map induced by the subtype inclusion. Then pi_(R,F) composed with i_F is the identity R-algebra homomorphism. In particular pi_(R,F) is surjective.

**Hypotheses.**

- R is a commutative ring, including the zero ring; P is an additive commutative monoid.
- F is an existing additive submonoid of P with the explicit face condition: for all a,b in P, a+b belongs to F if and only if both a and b belong to F. No replacement face or monoid carrier is introduced.

**Construction or proof.**

1. Use the existing mapDomainAlgHom for the inclusion. On a coefficient monomial r e_m, the inclusion gives the same monomial with its underlying P-degree.
2. Apply face-projection-coeff and coefficient extensionality. This proves the identity on arbitrary finite sums; it supplies an actual right inverse, not only an existence assertion. Surjectivity is the immediate elementwise consequence.

**Direct prerequisites.**

- `ShimuraCompactifications:C0/face-projection-coeff`
- `mathlib:MonoidAlgebra.mapDomainAlgHom`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.1.2.6, quotient algebra on the orthogonal characters: The retained homogeneous summands provide the explicit section in a trivialized chart.

**Acceptance.**

- An arbitrary finite F-supported polynomial, not just the unit, is recovered.

**Proposed library placement.** **module.** TauCeti/Algebra/MonoidAlgebra/FaceProjection

**namespace.** AddMonoidAlgebra

### The monomial ideal of the face complement

**Node:** `ShimuraCompactifications:C0/face-projection-kernel`. **Declaration:** `AddMonoidAlgebra.ker_faceProjection`. **Kind:** lemma. **Implementation:** unchecked.

The kernel of pi_(R,F) is the ideal J_F generated by e_p for p outside F. Equivalently, a polynomial lies in J_F exactly when all its F-coefficients vanish. The statement is about the actual Ideal.span in R[P], not the radical of this ideal.

**Hypotheses.**

- R is a commutative ring, including the zero ring; P is an additive commutative monoid.
- F is an existing additive submonoid of P with the explicit face condition: for all a,b in P, a+b belongs to F if and only if both a and b belong to F. No replacement face or monoid carrier is introduced.

**Construction or proof.**

1. The coefficient formula identifies the kernel with the polynomials whose retained coefficients vanish.
2. Each generator e_p outside F is killed. Therefore its ideal span lies in the kernel.
3. Conversely expand an element of the kernel as its finite monomial sum. Every nonzero term has degree outside F and is a scalar multiple of one of the indicated generators. Thus it belongs to that ideal span. This proof also establishes the coefficient characterization.

**Direct prerequisites.**

- `ShimuraCompactifications:C0/face-projection-coeff`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.1.2.6, displayed homogeneous ideal: Provides a coefficient-level proof and retains nilpotent coefficients under arbitrary base change.

**Acceptance.**

- Over Z/4, J_{0} in (Z/4)[N] is the positive-degree ideal; it does not contain 2 e_0.
- For F=P, the generating set is empty and the kernel is the zero ideal.

**Proposed library placement.** **module.** TauCeti/Algebra/MonoidAlgebra/FaceProjection

**namespace.** AddMonoidAlgebra

### The integral stratum quotient algebra

**Node:** `ShimuraCompactifications:C0/face-quotient`. **Declaration:** `AddMonoidAlgebra.faceQuotientEquiv`. **Kind:** construction. **Implementation:** unchecked.

Construct the canonical R-algebra equivalence R[P]/J_F with R[F], where J_F is the ideal span of the off-face monomials from face-projection-kernel. It takes the class of f to pi_(R,F)(f). Use the existing ideal-quotient carrier and the pinned first isomorphism theorem.

**Hypotheses.**

- R is a commutative ring, including the zero ring; P is an additive commutative monoid.
- F is an existing additive submonoid of P with the explicit face condition: for all a,b in P, a+b belongs to F if and only if both a and b belong to F. No replacement face or monoid carrier is introduced.

**Construction or proof.**

1. Apply Ideal.quotientKerAlgEquivOfRightInverse using the explicit inclusion section from face-projection-section.
2. Transport the quotient along face-projection-kernel to the specified monomial ideal J_F. The resulting equivalence has its quotient-map formula fixed, so it is not an unspecified isomorphism of rings.

**Planning API.**

- `AddMonoidAlgebra.faceQuotientEquiv_mk` (simp): The equivalence evaluated at the quotient class of f is pi_(R,F)(f).
- `AddMonoidAlgebra.faceQuotientEquiv_symm_single` (simp): The inverse sends r e_m for m in F to the quotient class of r e_m in R[P].
- `AddMonoidAlgebra.faceQuotientEquiv_coeff` (projection): The m-coefficient of the image of the class of f equals coeff_m(f), for m in F.
- `AddMonoidAlgebra.faceQuotient_mk_eq_iff` (characterisation): The quotient classes of f and g are equal exactly when their coefficients agree in every F-degree.

**Unit tests.**

- `AddMonoidAlgebra.faceQuotient_zero_test` (degenerate): The class of zero maps to zero.
- `AddMonoidAlgebra.faceQuotient_positive_test` (computation): For R=Z/4, P=N and F={0}, the class of e_1 maps to zero.
- `AddMonoidAlgebra.faceQuotient_nilpotent_test` (non-example): For R=Z/4, P=N and F={0}, the image of the class of 2 e_0 has zero-degree coefficient 2, not zero.
- `AddMonoidAlgebra.faceQuotient_laurent_test` (compatibility): For R=Z, P=Z and F=P, the image of the class of e_(-1) has degree -1 coefficient 1.

**Consumers.**

- `ShimuraCompactifications:C0/relative-stratum-quotient`: Identifies the affine-local coordinate algebra of the relative closed orbit.
- `ShimuraCompactifications:C0/relative-boundary-coordinates`: Computes scheme-theoretic boundary intersections after local trivialization.

**Direct prerequisites.**

- `ShimuraCompactifications:C0/face-projection-section`
- `ShimuraCompactifications:C0/face-projection-kernel`
- `mathlib:Ideal.quotientKerAlgEquivOfRightInverse`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.1.2.6, quotient defining the closed stratum: Identifies the specified monomial quotient, using the existing generic first isomorphism theorem instead of replanning it.

**Acceptance.**

- The equivalence preserves the R-algebra structure, including nonzero nilpotents in R.

**Proposed library placement.** **module.** TauCeti/Algebra/MonoidAlgebra/FaceProjection

**namespace.** AddMonoidAlgebra

### Coefficient change commutes with face restriction

**Node:** `ShimuraCompactifications:C0/face-projection-coefficient-change`. **Declaration:** `AddMonoidAlgebra.faceProjection_coefficient_change`. **Kind:** lemma. **Implementation:** unchecked.

For every unital ring homomorphism phi:R to S, the two ring homomorphisms R[P] to S[F] obtained by projecting then changing coefficients, or changing coefficients then projecting, are equal. There is no flatness, injectivity or surjectivity hypothesis on phi.

**Hypotheses.**

- R is a commutative ring, including the zero ring; P is an additive commutative monoid.
- F is an existing additive submonoid of P with the explicit face condition: for all a,b in P, a+b belongs to F if and only if both a and b belong to F. No replacement face or monoid carrier is introduced.
- S is any commutative ring and phi:R to S is a ring homomorphism.

**Construction or proof.**

1. The pinned monoid-algebra coefficient map sends r e_p to phi(r) e_p.
2. Compare the two composites on each coefficient monomial. Membership of p in F is unchanged by phi, and phi(0)=0. Finite-sum or algebra-homomorphism extensionality gives equality.

**Direct prerequisites.**

- `ShimuraCompactifications:C0/face-projection-coeff`
- `mathlib:MonoidAlgebra.mapRingHom`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.1.2.1–6.1.2.6, homogeneous algebra construction: The arbitrary-ring naturality is a direct verification on the source homogeneous construction. It does not assert any tensor/inverse-limit interchange.

**Acceptance.**

- Apply to Z/4 to Z/2 and to identity and composite coefficient maps.

**Proposed library placement.** **module.** TauCeti/Algebra/MonoidAlgebra/FaceProjection

**namespace.** AddMonoidAlgebra

### The face ideal commutes with coefficient change

**Node:** `ShimuraCompactifications:C0/face-kernel-coefficient-change`. **Declaration:** `AddMonoidAlgebra.ker_faceProjection_map`. **Kind:** lemma. **Implementation:** unchecked.

For phi:R to S, extension of the ideal ker(pi_(R,F)) along the existing coefficient map R[P] to S[P] is ker(pi_(S,F)). Consequently the specified stratum quotient has its expected coefficient-base-change comparison. This is extension of this monomial ideal, not a claim that arbitrary kernel formation commutes with tensoring.

**Hypotheses.**

- R is a commutative ring, including the zero ring; P is an additive commutative monoid.
- F is an existing additive submonoid of P with the explicit face condition: for all a,b in P, a+b belongs to F if and only if both a and b belong to F. No replacement face or monoid carrier is introduced.
- S and phi are as in face-projection-coefficient-change.

**Construction or proof.**

1. Rewrite both kernels using face-projection-kernel.
2. The image of each generating monomial e_p is the same e_p since phi(1)=1. Extension of an ideal generated by a set is generated by its image. This proves the equality even if phi is nonflat.
3. For the quotient comparison, apply face-quotient on both bases and use the naturality square. The ordinary monoid-algebra coefficient extension is computed from its free monomial basis; no completion is involved.

**Direct prerequisites.**

- `ShimuraCompactifications:C0/face-projection-kernel`
- `ShimuraCompactifications:C0/face-projection-coefficient-change`
- `ShimuraCompactifications:C0/face-quotient`
- `mathlib:MonoidAlgebra.mapRingHom`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.1.2.6, monomial description of the stratum ideal: This proves the needed coefficient-change property of the displayed ideal, rather than claiming it for all kernel or completion functors.

**Acceptance.**

- The nonflat map Z/4 to Z/2 passes the ideal-generator test.
- Keep the distinction from a general ideal kernel: the argument uses the fixed monomial generating set and the explicit split coefficient basis.

**Proposed library placement.** **module.** TauCeti/Algebra/MonoidAlgebra/FaceProjection

**namespace.** AddMonoidAlgebra

### Relative torus embeddings from the actual torsor algebra

**Node:** `ShimuraCompactifications:C0/relative-torus-embedding`. **Declaration:** `TauCeti.Toric.Relative.torusEmbedding`. **Kind:** construction. **Implementation:** unchecked.

**Planet:** Relative torus embedding.

Construct T(sigma)=Spec_Z(A_sigma), where A_sigma is the homogeneous O_Z-subalgebra direct-summing L_m over m in P_sigma inside the actual torsor algebra. Its multiplication and unit are inherited from O_T. The construction is functorial under base change and is equivariant for the given split torus. It extends the unchanged finite-complex toric chart, not its lattice or cone carrier.

**Hypotheses.**

- Z is a scheme, or an algebraic space treated on its actual etale atlas. H is a split torus with finite free character lattice M; T to Z is a right H-torsor in the fppf topology.
- Use the common toric lattice/cone vocabulary and its dual additive monoids. For a rational polyhedral salient closed cone sigma in the real cocharacter space, P_sigma consists of the integral characters nonnegative on sigma.
- Let L_m be the weight-m subsheaf of the actual pushforward of O_T: right translation by h acts on a local function by multiplication by m(h). Its unit and multiplication maps L_m tensor L_n to L_(m+n) are those of O_T, not arbitrary rigidifications.
- Lan's cone convention is relatively open; its nonnegative character monoid agrees with that of our closed cone. Strict positivity, when comparing the source ideal notation, is tested on the relative interior, not on the origin. The zero-cone case is treated separately.

**Construction or proof.**

1. Import the actual graded torsor algebra and its coherent multiplication from the generic torsor/descent owner SF.1. In particular identify L_0 with O_Z and prove that character-line multiplication is an isomorphism; do not select incompatible trivializations.
2. Nonnegativity is closed under addition and includes zero, so the indicated homogeneous direct sum is a quasi-coherent subalgebra. Use SF.0 relative Spec for this algebra, not a new scheme or gluing carrier.
3. Trivialize a basis of character lines on a cover of Z. The multiplication-compatible trivialization identifies A_sigma there with O_Z[P_sigma]. Two trivializations differ by character units and give the actual descent cocycle.
4. Pullback commutes with direct sums and the individual character lines. The cocycle respects multiplication, so relative Spec base change and the torus action descend. No C4 object is a prerequisite: this is the generic construction that C4 instantiates.

**Planning API.**

- `TauCeti.Toric.Relative.embedding_trivialization` (compatibility): A multiplication-compatible trivialization of the torsor identifies T(sigma) with Spec of the existing monoid algebra over that open of Z.
- `TauCeti.Toric.Relative.embedding_baseChange` (functoriality): For Zprime to Z, pullback of T(sigma) is canonically the embedding of the pulled-back torsor, compatibly with identity and composition.
- `TauCeti.Toric.Relative.embedding_torusAction` (structure): The given H-action extends to T(sigma), and the structural morphism to Z is invariant.
- `TauCeti.Toric.Relative.embedding_zeroCone` (compatibility): For the zero cone, P_sigma=M and T(sigma) is canonically the original torsor T.
- `TauCeti.Toric.Relative.embedding_changeTrivialization` (relation): If local torsor sections satisfy t_beta=t_alpha g_alpha_beta, the weight-m coordinate functions satisfy q_beta,m=m(g_alpha_beta)^(-1) q_alpha,m. These transitions preserve multiplication, boundary ideals and all face maps.
- `TauCeti.Toric.Relative.embedding_homEquiv` (universal-property): For a Z-scheme Y, maps Y→T(sigma) over Z correspond to maps from the pulled-back graded character algebra A_sigma to O_Y; evaluation on homogeneous characters respects its inherited multiplication.

**Unit tests.**

- `TauCeti.Toric.Relative.embedding_rankOne_test` (computation): For a trivial G_m-torsor and its positive ray, the embedding is A1_Z with its usual G_m open.
- `TauCeti.Toric.Relative.embedding_zeroCone_test` (degenerate): The zero-cone embedding is the given torsor, even if that torsor is nontrivial.
- `TauCeti.Toric.Relative.embedding_lineDual_test` (compatibility): For rank one with weight-one function line L, the positive-ray embedding is Spec_Z Sym(L), the total space of L dual under the convention V(E)=Spec Sym(E dual). Do not replace it by the total space of L.
- `TauCeti.Toric.Relative.embedding_nilpotentBase_test` (non-example): For the trivial rank-one torsor over Z/4, the positive-ray coordinate ring is (Z/4)[q], and restriction to q=0 retains the nonzero nilpotent scalar 2.

**Consumers.**

- `ShimuraCompactifications:C4`: Supplies the relative torus embeddings used in actual degeneration charts.
- `ShimuraCompactifications:C0/relative-regular-coordinates`: Provides the scheme whose ordinary integral coordinates are identified.
- `ShimuraCompactifications:C5/neat-boundary-intersection-smooth`: Its coordinate form is pulled to the ordinary good algebraic models.
- `PAPER-FARB-KISIN-WOLFSON-24/089`: Specializes the same generic torus-torsor/character-line supplier over an abelian variety; no second torsor definition.

**Direct prerequisites.**

- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:SF.1`
- `mathlib:MonoidAlgebra.domCongr`
- `tauceti:TauCeti.SplitTorus.groupScheme`
- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.1.2.1, Remark 6.1.2.2, Definition 6.1.2.3, printed pp. 443–444: Keeps the actual multiplication isomorphisms and the relative Spec construction, with split-torus rather than unrestricted nonsmooth multiplicative-type hypotheses.
- [FARB-KISIN-WOLFSON-2024](https://arxiv.org/pdf/2110.05534v2), 3.2.1; Proposition 3.2.7 proof, printed pp. 24–25: Torus torsors and character-line compactifications over an abelian base; the generic torsor carrier is requested from SF.1.

**Acceptance.**

- On a trivial torsor over Spec R, the construction is the actual affine spectrum of R[P_sigma].
- A nontrivial torsor need not admit a global monomial function of every degree.

**Proposed library placement.** **module.** TauCeti/Geometry/Toric/Algebraic/Relative

**namespace.** TauCeti.Toric.Relative

### Ordinary face charts are relative open subspaces

**Node:** `ShimuraCompactifications:C0/relative-face-open`. **Declaration:** `TauCeti.Toric.Relative.faceOpenImmersion`. **Kind:** theorem. **Implementation:** unchecked.

For a face tau of sigma, construct the canonical equivariant open immersion T(tau) to T(sigma). On a multiplication-compatible trivialization it is the monomial localization R[P_sigma] to R[P_tau]; these immersions obey identity and composition and have the expected common-face intersections. This is an ordinary scheme statement, not a morphism between completions at different strata.

**Hypotheses.**

- Z is a scheme, or an algebraic space treated on its actual etale atlas. H is a split torus with finite free character lattice M; T to Z is a right H-torsor in the fppf topology.
- Use the common toric lattice/cone vocabulary and its dual additive monoids. For a rational polyhedral salient closed cone sigma in the real cocharacter space, P_sigma consists of the integral characters nonnegative on sigma.
- Let L_m be the weight-m subsheaf of the actual pushforward of O_T: right translation by h acts on a local function by multiplication by m(h). Its unit and multiplication maps L_m tensor L_n to L_(m+n) are those of O_T, not arbitrary rigidifications.
- Use the common integral supporting-character and face-localization theorem from the toric anchor: choose m in P_sigma exposing tau, so P_tau=P_sigma+N(-m).
- Lan's cone convention is relatively open; its nonnegative character monoid agrees with that of our closed cone. Strict positivity, when comparing the source ideal notation, is tested on the relative interior, not on the origin. The zero-cone case is treated separately.

**Construction or proof.**

1. On a trivialized chart, apply the anchor supporting-character/monoid identity and the generic monoid-algebra localization universal property. A character algebra map extends exactly when the exposed monomial is invertible.
2. Relative Spec gives a principal open on each trivializing chart. On overlaps the monomial is multiplied by a unit, so the opens and their structural maps agree and descend.
3. Identity, successive localization and overlap formulas follow by the same character maps, hence descend. Do not infer a map between completions along two distinct stratum ideals from this open immersion.

**Direct prerequisites.**

- `ShimuraCompactifications:C0/relative-torus-embedding`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:SF.1`
- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), Lemma 6.1.2.4 and Theorem 6.1.2.8(2): The base-ring/torsor extension of the ordinary face-open theorem is proved by localization and descent, while the finite-complex subproblem stays with the anchor.

**Acceptance.**

- For the quadrant and its first-coordinate ray face, the face chart inverts the second coordinate.
- For sigma the zero cone, the identity face gives the identity torsor map.
- For nontrivial character lines the open is defined locally by a monomial, not by a falsely chosen global q.

**Proposed library placement.** **module.** TauCeti/Geometry/Toric/Algebraic/Relative

**namespace.** TauCeti.Toric.Relative

### Integral regular coordinates on a relative torus chart

**Node:** `ShimuraCompactifications:C0/relative-regular-coordinates`. **Declaration:** `TauCeti.Toric.Relative.regularCoordinateIso`. **Kind:** comparison. **Implementation:** unchecked.

If sigma is regular of dimension r in a rank-n cocharacter lattice, a supplied integral basis extending its primitive rays and a multiplication-compatible local torsor trivialization give an algebra isomorphism A_sigma with R[x_1,...,x_r,y_1^(+-1),...,y_(n-r)^(+-1)]. On monomials it is the character-exponent map from the existing dual-monoid identification P_sigma with N^r times Z^(n-r). The associated scheme isomorphism is over the actual local base.

**Hypotheses.**

- Z is a scheme, or an algebraic space treated on its actual etale atlas. H is a split torus with finite free character lattice M; T to Z is a right H-torsor in the fppf topology.
- Use the common toric lattice/cone vocabulary and its dual additive monoids. For a rational polyhedral salient closed cone sigma in the real cocharacter space, P_sigma consists of the integral characters nonnegative on sigma.
- Let L_m be the weight-m subsheaf of the actual pushforward of O_T: right translation by h acts on a local function by multiplication by m(h). Its unit and multiplication maps L_m tensor L_n to L_(m+n) are those of O_T, not arbitrary rigidifications.
- Regularity includes rationality, salience and the primitive-basis condition; it is not merely simpliciality. The ring R can be nonreduced.
- Lan's cone convention is relatively open; its nonnegative character monoid agrees with that of our closed cone. Strict positivity, when comparing the source ideal notation, is tested on the relative interior, not on the origin. The zero-cone case is treated separately.

**Construction or proof.**

1. Use the existing anchor lattice/regular-cone theorem to obtain the additive equivalence of dual monoids. The choice of basis is a hypothesis of this coordinate comparison, not the definition of the global embedding.
2. Apply the pinned monoid-algebra equivalence induced by that degree equivalence. This operation is already general in the coefficient ring; no new generic algebra congruence is planned.
3. Identify the product monoid algebra as the stated polynomial/Laurent polynomial algebra by its monomial basis and generic free-algebra interfaces. Transport the actual relative algebra trivialization, then relative Spec.
4. A change of basis or torsor trivialization is the induced character monomial map and units. Compose these maps using existing functoriality; coordinates never canonize one basis.

**Direct prerequisites.**

- `ShimuraCompactifications:C0/relative-torus-embedding`
- `mathlib:MonoidAlgebra.domCongr`
- `SchemeAndStackFoundations:SF.0`
- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.1.1.11 and Theorem 6.1.2.8(5): Makes the ordinary integral-coordinate proof explicit under the free character lattice and regular-cone hypotheses.

**Acceptance.**

- A full regular rank-two cone gives R[x_1,x_2]; a rank-one cone in rank two gives R[x_1,y^(+-1)].
- The zero cone gives the whole split torus, not affine space.
- The cone generated by (1,0) and (1,2) is simplicial but its ray generators are not an integral basis; it is not admitted by the regular-coordinate theorem.

**Proposed library placement.** **module.** TauCeti/Geometry/Toric/Algebraic/Relative

**namespace.** TauCeti.Toric.Relative

### The scheme-theoretic relative toric stratum

**Node:** `ShimuraCompactifications:C0/relative-stratum-quotient`. **Declaration:** `TauCeti.Toric.Relative.stratumQuotientIso`. **Kind:** theorem. **Implementation:** unchecked.

**Planet:** Toric stratum.

For a split torus chart T(sigma), the homogeneous quotient by the sum of L_m over m in P_sigma outside F_sigma=M intersect sigma-perp is canonically Spec_Z of the direct sum of L_m over F_sigma. It is the induced torsor for the split quotient torus with character lattice F_sigma. Its ideal and the quotient construction commute with arbitrary base change. This is the relative scheme-theoretic stratum; identify it with a reduced complement only under the needed reducedness hypotheses.

**Hypotheses.**

- Z is a scheme, or an algebraic space treated on its actual etale atlas. H is a split torus with finite free character lattice M; T to Z is a right H-torsor in the fppf topology.
- Use the common toric lattice/cone vocabulary and its dual additive monoids. For a rational polyhedral salient closed cone sigma in the real cocharacter space, P_sigma consists of the integral characters nonnegative on sigma.
- Let L_m be the weight-m subsheaf of the actual pushforward of O_T: right translation by h acts on a local function by multiplication by m(h). Its unit and multiplication maps L_m tensor L_n to L_(m+n) are those of O_T, not arbitrary rigidifications.
- Lan's cone convention is relatively open; its nonnegative character monoid agrees with that of our closed cone. Strict positivity, when comparing the source ideal notation, is tested on the relative interior, not on the origin. The zero-cone case is treated separately.

**Construction or proof.**

1. Nonnegative real character evaluations show that a+b vanishes on sigma precisely when both a and b do. Thus F_sigma is a face submonoid, and in this case is a saturated subgroup of M.
2. On a torsor trivialization apply face-projection, face-projection-kernel and face-quotient. The quotient ideal is the off-face homogeneous ideal, not its radical.
3. Character-unit transitions preserve the retained summands and the projection. Descend the ideal, quotient and isomorphism through the actual torsor cocycle.
4. The retained character algebra with its inherited multiplication is the pushout torsor for the quotient torus. Obtain this generic torsor/graded-algebra identification from SF.1, rather than defining a second torsor.
5. Apply face-kernel-coefficient-change and relative Spec base change locally, then descend the comparison. Neither reducedness nor completion commutes with arbitrary base change by this argument.

**Direct prerequisites.**

- `ShimuraCompactifications:C0/relative-torus-embedding`
- `ShimuraCompactifications:C0/face-projection-kernel`
- `ShimuraCompactifications:C0/face-quotient`
- `ShimuraCompactifications:C0/face-kernel-coefficient-change`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:SF.1`
- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), Lemma 6.1.2.6 and Definition 6.1.2.7: Uses the homogeneous quotient formula for the relative base-change-compatible stratum. The comparison with the source reduction notation is kept under explicit reducedness hypotheses.

**Acceptance.**

- The full positive ray has closed stratum Z; the zero cone has stratum the whole torsor.
- Over Z/4 the full-ray stratum has ring Z/4, not Z/2.
- For a rank-one cone in a rank-two lattice the stratum retains a rank-one torus direction.

**Proposed library placement.** **module.** TauCeti/Geometry/Toric/Algebraic/Relative

**namespace.** TauCeti.Toric.Relative

### Coordinate ideals of relative boundary intersections

**Node:** `ShimuraCompactifications:C0/relative-boundary-coordinates`. **Declaration:** `TauCeti.Toric.Relative.boundaryCoordinateIso`. **Kind:** comparison. **Implementation:** unchecked.

In the regular coordinates of relative-regular-coordinates, the scheme-theoretic intersection of the coordinate boundary components indexed by J has ideal (x_j : j in J) and coordinate algebra R[x_i : i outside J, y_1^(+-1),...,y_(n-r)^(+-1)]. Its exact boundary open is the principal open obtained by inverting the product of x_i for i outside J. These identifications are compatible with base change and with the character-unit transition maps.

**Hypotheses.**

- Z is a scheme, or an algebraic space treated on its actual etale atlas. H is a split torus with finite free character lattice M; T to Z is a right H-torsor in the fppf topology.
- Use the common toric lattice/cone vocabulary and its dual additive monoids. For a rational polyhedral salient closed cone sigma in the real cocharacter space, P_sigma consists of the integral characters nonnegative on sigma.
- Let L_m be the weight-m subsheaf of the actual pushforward of O_T: right translation by h acts on a local function by multiplication by m(h). Its unit and multiplication maps L_m tensor L_n to L_(m+n) are those of O_T, not arbitrary rigidifications.
- Use the supplied regular cone basis and actual torsor trivialization, and J a subset of the r boundary-coordinate indices.
- Lan's cone convention is relatively open; its nonnegative character monoid agrees with that of our closed cone. Strict positivity, when comparing the source ideal notation, is tested on the relative interior, not on the origin. The zero-cone case is treated separately.

**Construction or proof.**

1. The degrees whose J coordinates are zero form a face submonoid. The complement monomial ideal is exactly generated by the x_j with j in J: every off-face monomial contains such a variable, and every multiple of such a variable is off-face.
2. Apply face-quotient to that face and the regular monoid coordinates. This computes the scheme-theoretic intersection with its actual base coefficients.
3. Removing the other boundary components is precisely localization at the product of the remaining x_i. Multiplication by this monomial is injective by shifting the exponent basis, over every coefficient ring and after every base change. Thus this open is universally schematically dense; ordinary topological density follows as well.
4. Polynomial and Laurent polynomial algebras are smooth over R. The quotient algebra therefore gives smoothness of each intersection over the local base. Descend these particular coordinate descriptions and consequences through SF.0/SF.1. Smoothness over the arithmetic base additionally requires smoothness of the cusp base.
5. Transport each ideal and open using the actual character-unit changes. Do not apply the conclusion to identified global boundary branches without C5 neat branch separation and label-preserving ordinary charts.

**Direct prerequisites.**

- `ShimuraCompactifications:C0/relative-regular-coordinates`
- `ShimuraCompactifications:C0/face-quotient`
- `ShimuraCompactifications:C0/face-kernel-coefficient-change`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:SF.1`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.1.2.6–6.1.2.8 and the ordinary charts used in 6.3.2.5: The ideal and exact-open calculation is a direct algebraic refinement of the regular relative toric chart, and provides the concrete C0 input to the existing C5 nodes.

**Acceptance.**

- For a quadrant, J empty, one coordinate and both coordinates give the plane, a line and the base, respectively.
- When no remaining boundary coordinate is present, the product is 1 and the exact open is the whole intersection.
- The coordinate quotient over Z/4 retains 2; passing to a radical ideal would fail the test.
- For G_m over F_2, density is a scheme-theoretic statement, not a claim about the number of rational points.

**Proposed library placement.** **module.** TauCeti/Geometry/Toric/Algebraic/Relative

**namespace.** TauCeti.Toric.Relative

### Arithmetic-admissible cone systems

**Node:** `ShimuraCompactifications:C0/arithmetic-admissible-fan`. **Declaration:** `TauCeti.ShimuraCompactifications.C0.arithmetic_admissible_fan`. **Kind:** definition. **Implementation:** unchecked.

**Planet:** Admissible cone decomposition.

Extend the common fan incidence data by a possibly infinite set of rational polyhedral salient cones, an integral arithmetic action and finitely many cone orbits. For every cusp the support lies in the rational closure C* of its positivity cone; completeness means support=C*. Require local finiteness on compact subsets of the OPEN positivity domain, closure under faces, intersections as common faces, stabilizer invariance, and compatibility under the actual rational boundary restriction and level actions. The finite specialization is the pinned Fan; finite orbit count is never substituted for a finite set of cones.

**Hypotheses.**

- The lattice and PointedCone, IsToricCone and IsFaceOf predicates are the pinned common carriers. Supply integral linear actions preserving the lattice and C*.
- The arithmetic quotient action is its effective image on the lattice. Global cusp compatibility includes the finite double-coset indexing, not just one fan at one cusp.

**Construction or proof.**

1. Keep the shared incidence fields of Fan, replacing only finite_cones by the arithmetic action/orbit-finiteness package. Assemble cusp-indexed cones with Pink 6.4 equivariance under rational conjugation, boundary restriction and right level action.
2. Express support and local finiteness in the positivity domain. The origin lies in every cone and cannot have an ambient locally finite neighbourhood for an infinite arithmetic fan.
3. Restriction to a boundary component preserves incidence and equivariance; separately check completeness and orbit finiteness, which Pink 6.6 does not grant automatically.

**Planning API.**

- `ArithmeticFan.ext` (extensionality): Two systems with the same cusp lattices, actions and cone sets agree; proof witnesses do not create a second cone carrier.
- `ArithmeticFan.toFiniteFan` (compatibility): If the cone set is finite, forgetting the action/support data gives the pinned Fan with exactly that cone set.
- `ArithmeticFan.restrict` (functoriality): Boundary and level restriction preserve incidence and equivariance; completeness and orbit finiteness are transported only under the established source hypotheses.
- `ArithmeticFan.support` (characterisation): Completeness is the equality of union of cones with the specified rational closure C*, not all ambient vectors.

**Unit tests.**

- `ArithmeticFan.zero_test` (degenerate): For the rank-zero lattice C*={0}, the complete system has exactly the zero cone.
- `ArithmeticFan.finite_test` (compatibility): For a finite quadrant fan and trivial action, toFiniteFan has exactly its original cones.
- `ArithmeticFan.origin_test` (non-example): A genuinely infinite fan with common vertex 0 fails ambient local finiteness at 0 and remains allowed when locally finite on C.
- `ArithmeticFan.support_test` (non-example): The single positive ray fan in R has support R>=0 and is not a complete fan with prescribed support R.

**Consumers.**

- `ShimuraCompactifications:C2`: Supplies cusp support and arithmetic finiteness for quotient gluing.
- `ShimuraCompactifications:C3`: Supplies compatible refinement data rather than a fixed Hecke-stable fan.

**Direct prerequisites.**

- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`
- `ShimuraVarieties:V2/rational-boundary`
- `tauceti:TauCeti.Toric.Fan.ext`

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 6.4–6.6, printed pp. 96–99: Arithmetic cone system, finiteness and restriction qualifications.

**Acceptance.**

- An infinite arithmetic fan can have finitely many orbits; the API must not coerce it to a finite Fan.
- Restriction never asserts completeness without a hypothesis.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C0

**namespace.** TauCeti.ShimuraCompactifications

### Common refinements and compatible fan maps

**Node:** `ShimuraCompactifications:C0/compatible-common-refinement`. **Declaration:** `TauCeti.ShimuraCompactifications.C0.compatible_common_refinement`. **Kind:** construction. **Implementation:** unchecked.

For two complete admissible cusp systems and a specified finite family of boundary-compatible integral lattice maps, construct a common admissible refinement by intersections sigma1 intersect phi^-1(sigma2), closing under faces. Preserve support, finite arithmetic orbits and cusp/level compatibility under Pink 9.22 hypotheses. The construction is coarsest for the cone-containment relation; no common refinement is claimed for infinitely many unrelated Hecke maps.

**Hypotheses.**

- Both systems satisfy arithmetic-admissible-fan, and the maps send the source positivity domain into the required target domain.
- For the relative comparison, use the same cusp support or the inverse-image support appropriate to the specified map.

**Construction or proof.**

1. Use finite cone representatives and Pink 6.19 finite-overlap reduction to check orbit finiteness for the intersection collection.
2. Intersections are rational polyhedral cones on the shared carrier; their faces and incidence are inherited. Verify the support identity and equivariance under the specified arithmetic maps.
3. The containment universal property gives identity and common-refinement comparison maps, compatible with boundary restrictions.

**Planning API.**

- `ArithmeticFan.commonRefinement_le` (structure): Each resulting cone is contained in a cone of both original systems.
- `ArithmeticFan.commonRefinement_universal` (universal-property): A compatible fan refining both systems refines the intersection system.
- `ArithmeticFan.commonRefinement_support` (compatibility): The resulting system has the required common or inverse-image support.

**Unit tests.**

- `ArithmeticFan.commonRefinement_self_test` (degenerate): The common refinement of a system with itself is the same cone collection.
- `ArithmeticFan.quadrant_refinement_test` (computation): Intersecting the quadrant fan with its subdivision by (1,1) yields the two diagonal cones and their faces.
- `ArithmeticFan.commonRefinement_level_test` (compatibility): A specified level restriction induces the same cone-containment maps on the common refinement.

**Consumers.**

- `ShimuraCompactifications:C3/choice-comparison`: Compares independently chosen toroidal compactifications.
- `ShimuraCompactifications:C0/smooth-projective-refinement`: Provides input for a simultaneous smooth/projective refinement.

**Direct prerequisites.**

- `ShimuraCompactifications:C0/arithmetic-admissible-fan`
- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`
- `ShimuraCompactifications:C1/arithmetic-stabilizer`

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 9.22–9.23, printed pp. 156–157: Finite family of compatible morphisms and common refinements.

**Acceptance.**

- Two refinements compare through a third without being literally equal.
- For the quadrant and its diagonal subdivision, the common refinement is the diagonal subdivision.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C0

**namespace.** TauCeti.ShimuraCompactifications

### Smooth projective compatible refinements

**Node:** `ShimuraCompactifications:C0/smooth-projective-refinement`. **Declaration:** `TauCeti.ShimuraCompactifications.C0.smooth_projective_refinement`. **Kind:** theorem. **Implementation:** unchecked.

**Planet:** Smooth projective refinement.

Every complete admissible system at neat level has a complete smooth projective admissible refinement, compatible with any specified finite family of fan maps. Projectivity carries an invariant integral piecewise-linear polarization, with domains of linearity exactly the cones. Record Lan's superadditive/concave convention pol(x+y)>=pol(x)+pol(y). If a global no-self-identification condition is required, impose the extra barycentric refinement of Pink 9.20; neatness and smoothness alone prove local normal crossings.

**Hypotheses.**

- The arithmetic system and maps satisfy compatible-common-refinement. Use rational polyhedral positivity cones attached to the actual boundary data.
- A projective polarization is continuous, positive on nonzero points, homogeneous, arithmetic-invariant and integral on the lattice, with the required cusp restriction compatibility.

**Construction or proof.**

1. Pink 9.18–9.19 construct invariant rational piecewise-linear functions: perturb a common function on finitely many arithmetic cone representatives, average over finite effective cone stabilizers and extend over faces.
2. Resolve singular cones by primitive integral subdivisions, retaining orbit and boundary compatibility; barycentrically refine when the separate no-self-identification property is requested.
3. Pink 9.21 and 9.23 give the complete smooth projective output and finite simultaneous compatibility. Compare the sign with Lan 2017 Definitions 2.5 and 2.7 instead of importing an opposite convexity convention.

**Direct prerequisites.**

- `ShimuraCompactifications:C0/compatible-common-refinement`
- `ShimuraCompactifications:C1/arithmetic-stabilizer`
- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 9.18–9.23, printed pp. 153–157: Existence proof and simultaneous compatibility.
- [LAN-2017](https://www.kwlan.org/articles/cpt-ram-nbl.pdf), Definitions 2.5, 2.7 and Proposition 2.8: Integral polarization and cusp compatibility.

**Acceptance.**

- The cone generated by (1,0),(1,2) needs a genuine regular subdivision; simpliciality alone fails.
- A prescribed finite Hecke span admits compatible refinements; an arbitrary universal fixed fan is not asserted.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C0

**namespace.** TauCeti.ShimuraCompactifications

### Toric charts over arbitrary commutative rings

**Node:** `ShimuraCompactifications:C0/arbitrary-ring-toric-charts`. **Declaration:** `TauCeti.ShimuraCompactifications.C0.arbitrary_ring_toric_charts`. **Kind:** construction. **Implementation:** unchecked.

**Planet:** Integral toric chart.

For the shared lattice and dual monoid P_sigma, construct U_sigma,R=Spec R[P_sigma] for every commutative ring R, by base change of Spec Z[P_sigma]. Glue a FINITE fan using the ordinary face localizations to obtain X_Sigma,R, with its split torus action and stratum ideals. All chart, overlap and action maps commute with arbitrary coefficient change, including non-Noetherian valuation rings; this extends the complex anchor rather than constructing its finite complex case again.

**Hypotheses.**

- Sigma is a finite rational polyhedral fan on the common lattice; singular cones are permitted.
- R is any commutative ring. Arithmetic infinite-fan quotients require their separate finiteness and gluing arguments.

**Construction or proof.**

1. Identify R[P] with Z[P] tensor_Z R using its native monomial basis and algebra universal property; do not quotient nilpotent coefficients.
2. Use integral supporting-character localization for every face, transport through Spec and glue the finite open-cover cocycle. The overlap for sigma,tau is their common-face chart.
3. The monomial comultiplication supplies the actual split torus action. Tensor the ordinary coordinate ideals and maps to obtain base-change comparisons; reducedness is a separate assertion.

**Planning API.**

- `Toric.affineChart_baseChange` (compatibility): U_sigma,R base changed along R→S is canonically U_sigma,S, with monomial coefficient map.
- `Toric.finiteFan_baseChange` (functoriality): Finite-fan gluing commutes with arbitrary base change and the comparisons obey identity and composition.
- `Toric.finiteFan_anchor` (compatibility): For a finite complex fan, the new integral realization base changed to C is the anchor realization, not a second complex toric space.
- `Toric.finiteFan_torusAction` (structure): The split torus action extends its translation action on the dense open torus.
- `Toric.finiteFan_glue_hom` (universal-property): Maps from the finite-fan scheme to a Z-scheme correspond to compatible maps from its affine monoid charts, with agreement on the ordinary face-open overlaps.

**Unit tests.**

- `Toric.affineChart_ray_Z4_test` (computation): The positive ray over Z/4 has coordinate ring (Z/4)[q], and its closed stratum has coordinate ring Z/4.
- `Toric.affineChart_zero_test` (degenerate): The zero cone yields Spec R[M], the split torus rather than affine n-space.
- `Toric.affineChart_valuation_test` (compatibility): For an arbitrary valuation ring V, U_sigma,V is the base change of U_sigma,Z and the same face-open maps apply.
- `Toric.affineChart_nilpotent_test` (non-example): Replacing R by its reduction would kill the nonzero scalar 2 over Z/4 and is rejected.

**Consumers.**

- `AnalyticToricGeometryNonarchimedeanPartII, PAPER-BINDA-KATO-VEZZANI-25/092`: Imports a uniform toric scheme over the valuation rings used for formal/adic charts.
- `ShimuraCompactifications:C4`: Uses the base-ring chart in relative degeneration models.

**Direct prerequisites.**

- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`
- `ShimuraCompactifications:C0/face-projection-coefficient-change`
- `ShimuraCompactifications:C0/face-kernel-coefficient-change`
- `SchemeAndStackFoundations:SF.0`
- `tauceti:TauCeti.SplitTorus.groupScheme`
- `mathlib:AlgebraicGeometry.Spec`
- `mathlib:AlgebraicGeometry.Spec.map`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.1.1.7–6.1.2.8; ordinary character algebra construction: Relative monoid charts specialize to the trivial torsor; universal coefficient extension is proved by the monomial basis.

**Acceptance.**

- Over Z/4, U_ray has ring (Z/4)[q] and its q=0 stratum retains 2.
- Finite complex specialization compares to the original anchor through the same monomials.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C0

**namespace.** TauCeti.ShimuraCompactifications

### Relative fan maps and support properness

**Node:** `ShimuraCompactifications:C0/relative-fan-properness`. **Declaration:** `TauCeti.ShimuraCompactifications.C0.relative_fan_properness`. **Kind:** theorem. **Implementation:** unchecked.

An integral lattice map and a compatible equivariant map of split torus torsors with FINITE fans induce the relative toric map over the same base scheme. The inverse-image support criterion implies properness over every base. Conversely, over a NONEMPTY base, properness implies that criterion by testing a geometric fibre. Over the empty base every map is proper and support is not detected. For arithmetic quotients separately require finite-type separated quotient charts and compatible arithmetic support; orbit finiteness alone never makes the infinite unquotiented toric space proper.

**Hypotheses.**

- Use finite fans and an actual morphism of torsors equivariant for the torus homomorphism. The base morphism in the relative assertion is the identity; composing with another proper base morphism preserves properness.
- The arithmetic variant uses the actual separated finite-type quotient model from C2 or C5 and complete compatible cusp systems.

**Construction or proof.**

1. Locally trivialize the torsors and prove the integral finite-fan support criterion by valuation extension of character monomials; the same lattice inequalities hold over arbitrary coefficients.
2. Glue the local morphisms through torus transition units. Properness descends fpqc locally on the base.
3. For the arithmetic assertion apply the criterion on the finite quotient-chart presentations and separately prove the quotient is finite type and separated. Compare over C to L5.

**Direct prerequisites.**

- `ShimuraCompactifications:C0/arbitrary-ring-toric-charts`
- `ShimuraCompactifications:C0/relative-torus-embedding`
- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-5-toric-maps-and-properness`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:SF.1`

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 6.25 and 6.27, printed pp. 113–115: Arithmetic compatibility and compactness supply the additional quotient hypotheses.

**Acceptance.**

- A complete P1 fan gives a proper relative P1; a single positive ray gives A1, which is not proper.
- A subdivision with unchanged support gives a proper map.
- An empty base is permitted in the sufficient direction; the necessary direction explicitly requires a nonempty geometric fibre.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C0

**namespace.** TauCeti.ShimuraCompactifications

## C1. Mixed boundary data, torsor towers, labels and effective stabilizers

The rational boundary component is imported from V2. Its arithmetic compactification input is the mixed boundary datum: P1, unipotent radical W1, central subgroup U1, quotient V1=W1/U1 and pure group G1=P1/W1, together with the homogeneous domain cover and its Hodge homomorphism. The Lie filtration has steps Lie U1, Lie W1 and Lie P1. It is instantiated on the native mixed Hodge carrier; a separately chosen pure graded filtration would not satisfy the comparison contract.

The central group U1 supplies the torus lattice. It is not interchangeable with all of W1. At a genus-two rank-one cusp their dimensions are respectively one and three. The intermediate boundary tower consists of a pure base, an abelian torsor and a torus torsor, with character-line multiplication and Poincaré rigidifications. Pink's finite domain cover is retained throughout.

The effective arithmetic image, rather than the full group with its ineffective kernel, acts on the cone lattice. Stabilizer control is established before admissible fans are constructed. Arithmetic cusp/cone labels consume those fans afterwards. This declaration order is acyclic even though coarse C0/C1 stage arrows obscure it. Labels retain level, rational conjugacy and cone orbit data; boundary incidence uses their actual equivalence relation.

**Remaining construction contracts.**

- AMRT arithmetic reduction and constructible/strict boundary representation APIs; special mixed canonical torsor models supplied for descent.
- Geometric declaration/API/test signatures listed in the suggested-file omission ledger need actual supplier carriers. No stage is closed or implemented.

### Mixed Shimura boundary datum

**Node:** `ShimuraCompactifications:C1/mixed-boundary-datum`. **Declaration:** `TauCeti.ShimuraCompactifications.C1.mixed_boundary_datum`. **Kind:** definition. **Implementation:** unchecked.

**Planet:** Mixed Shimura boundary datum.

Enrich V2's existing rational boundary component by Pink's admissible parabolic Q, the associated connected group P1, its unipotent radical W1, distinguished central weight-minus-two subgroup U1, V1=W1/U1 and pure quotient G1=P1/W1. The boundary domain X1 is the specified homogeneous finite-cover space with h1:S_C→(P1)_C; retain its finite fibers, real descent modulo U1, central weight cocharacter, Cartan-involution/no-compact-Q-factor and center conditions. Ad on Lie P1 has only weights 0,-1,-2 with W_-2=Lie U1, W_-1=Lie W1 and W_0=Lie P1. U1 and W1 are distinct inputs.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. No universal abelian scheme is assumed for this datum.
- V2 supplies the rational boundary component; D4 supplies the ambient pure Shimura datum and its algebraic morphisms; the parabolic/Lie structure is imported from ReductiveGroups Layer 7. The homogeneous finite cover X1 is not replaced by the image of h1.
- Mixed Hodge structures, filtrations and strictness are the pinned Hodge carriers and HodgeStructures L2, not new generic definitions.

**Construction or proof.**

1. Apply Pink 4.7–4.12 boundary homomorphism construction to the existing rational boundary/parabolic datum, and obtain P1,W1,U1 by the specified weight filtration.
2. Verify Pink 2.1 axioms from the boundary representation and the Hodge filtration comparison in 4.12. Use the corrected Lie filtration rather than the misprinted author-copy 2.1(v).
3. Identify the analytic boundary component through the pure quotient, retaining the finite homogeneous cover and incidence data.

**Planning API.**

- `MixedBoundaryDatum.pureQuotient` (projection): The quotient P1/W1 with its induced domain is the existing pure boundary datum.
- `MixedBoundaryDatum.weightFiltration` (characterisation): The three steps are exactly Lie U1, Lie W1 and Lie P1; V1 identifies with gr_-1.
- `MixedBoundaryDatum.conjugation` (functoriality): Rational conjugation transports the groups, domain cover, h1 and filtrations with the V2 boundary label.
- `MixedBoundaryDatum.h_finiteFibers` (structure): The map h1 has finite fibers; the definition keeps X1 rather than setting X1=image h1.
- `MixedBoundaryDatum.ext` (extensionality): With the ambient datum and homogeneous cover fixed, equality of the algebraic subgroup embeddings P1,W1,U1 and the boundary h1/domain data determines equality of boundary data; axiom proofs add no extra carrier.

**Unit tests.**

- `MixedBoundaryDatum.siegel2_rank1_test` (computation): At a genus-two rank-one cusp, U1 has rank 1 and V1 dimension 2, so W1 has dimension 3.
- `MixedBoundaryDatum.pure_test` (degenerate): When W1=1, U1=1 and the Lie algebra of P1 is entirely weight zero.
- `MixedBoundaryDatum.hodge_test` (compatibility): The induced graded structures are the supplied HodgeStructure on the native weight-graded quotient.
- `MixedBoundaryDatum.radical_center_test` (non-example): Using all W1 as the torus character group gives rank 3 instead of 1 at the genus-two rank-one cusp and fails.

**Consumers.**

- `ShimuraCompactifications:C2/partial-boundary-charts`: Supplies the actual mixed boundary torsor and parabolic quotient.
- `AutomorphicBundles:B3`: Uses the same boundary datum for canonical coefficient charts.

**Direct prerequisites.**

- `ShimuraVarieties:V2/rational-boundary`
- `ShimuraData:D3`
- `ShimuraData:D4`
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`
- `tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne`
- `tauceti:TauCeti.Hodge.MixedHodgeStructure`

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 2.1; 4.7–4.12, printed pp. 29–30 and 59–62: Boundary construction and axioms, with author-copy filtration misprint recorded in E1.

**Acceptance.**

- For the rank-one Siegel cusp of genus 2, dim U1=1 while dim W1=3.
- For a pure datum the unipotent radical is zero and the entire adjoint Lie algebra remains in weight zero.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C1

**namespace.** TauCeti.ShimuraCompactifications

### Boundary weight and Hodge filtrations

**Node:** `ShimuraCompactifications:C1/boundary-mixed-hodge-structure`. **Declaration:** `TauCeti.ShimuraCompactifications.C1.boundary_mixed_hodge_structure`. **Kind:** construction. **Implementation:** unchecked.

**Planet:** Boundary mixed Hodge structure.

For a rational representation of the boundary group P1 and a chosen invariant integral lattice, construct the native mixed Hodge structure induced by h1, with its genuine rational/complex base changes. If the representation is the restriction of a rational representation of the original group P, Pink 4.12 compares corresponding points x and x1: the Hodge filtration is unchanged while the weight filtration changes. This comparison is not asserted for an arbitrary P1 representation that does not extend to P. For the boundary adjoint representation, the weight steps are Lie U1, Lie W1 and Lie P1, with graded types (-1,-1), {(-1,0),(0,-1)} and {(-1,1),(0,0),(1,-1)}.

**Hypotheses.**

- Use mixed-boundary-datum and the chosen rational/integral representation with genuine rational and complex base-change models. Do not postulate a canonical integral lattice in every rational representation.
- For Hodge-filtration agreement, fix an ambient rational P representation, restrict it to P1, and use the associated points x and x1 of Pink 4.12. The independent boundary adjoint calculation does not assert that the P1 adjoint representation extends to P.

**Construction or proof.**

1. Factor the boundary homomorphism through Pink's standard H0 construction and transport the induced filtrations on the representation.
2. Identify the induced pure Hodge structure on each weight quotient through the existing graded carrier. The adjoint weight statements follow from the unipotent groups.
3. Apply Pink 4.12 only to an ambient P representation restricted to P1 at corresponding points; import strictness and filtered tensor/morphism APIs from HodgeStructures L2 for boundary representations themselves.

**Planning API.**

- `BoundaryMHS.weight_adjoint` (characterisation): Its weight steps identify with the three specified Lie subobjects.
- `BoundaryMHS.hodge_boundary_eq` (compatibility): For a rational representation of P restricted to P1 and the corresponding x,x1 of Pink 4.12, the original and boundary Hodge filtrations agree on the same complexified representation.
- `BoundaryMHS.map` (functoriality): Representation maps are morphisms of the native mixed Hodge structures and are strict by the owner API.
- `BoundaryMHS.native_filtrations` (compatibility): The returned native mixed Hodge structure has exactly the h1-induced WQ and F on the specified base-change models; its graded Hodge filtration is the induced quotient filtration of the pinned carrier.

**Unit tests.**

- `BoundaryMHS.pure_test` (degenerate): For a pure boundary group W1=1, W_-1=0 and W_0=Lie P1.
- `BoundaryMHS.siegel2_test` (computation): At a genus-two rank-one cusp, gr_-2 has dimension 1 and gr_-1 dimension 2.
- `BoundaryMHS.graded_test` (compatibility): The graded Hodge filtration is exactly the induced quotient filtration, not an unrelated pure structure.

**Consumers.**

- `ShimuraCompactifications:C1/boundary-torsor-tower`: Identifies torus and abelian pieces of the actual boundary neighbourhood.

**Direct prerequisites.**

- `ShimuraCompactifications:C1/mixed-boundary-datum`
- `tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne`
- `tauceti:TauCeti.Hodge.MixedHodgeStructure.gradedHodgeStructure`

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 4.7–4.12, especially 4.12, printed pp. 59–62: Constructs boundary filtrations and proves Hodge-filtration agreement.

**Acceptance.**

- The pure quotient has weight zero adjoint Lie algebra.
- The commutator lands in the weight-minus-two piece rather than identifying it with gr_-1.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C1

**namespace.** TauCeti.ShimuraCompactifications

### Pure quotients and boundary torsors

**Node:** `ShimuraCompactifications:C1/boundary-torsor-tower`. **Declaration:** `TauCeti.ShimuraCompactifications.C1.boundary_torsor_tower`. **Kind:** construction. **Implementation:** unchecked.

**Planet:** Boundary torus torsor.

At a neat boundary level, construct the mixed arithmetic boundary quotient as a torus torsor over an abelian-scheme torsor over a finite cover of the pure boundary Shimura variety. Its torus comes from the arithmetic lattice in U1, and its abelian directions from W1/U1. The commutator determines the Poincare/cubical torsor class. This is the boundary part of mixed Shimura theory; canonical models of the special mixed torsors required for descent are a separate supplier request.

**Hypotheses.**

- Use mixed-boundary-datum, its Hodge structure and the actual arithmetic lattices from K. Assume neatness for the asserted torsor form; at non-neat level retain finite stabilizer quotients.
- Use the exact central lattice Gamma_U(-1) and the weight-minus-one lattice; they are not interchangeable.

**Construction or proof.**

1. Pink 3.12–3.19 express the U quotient as an algebraic torus and the V/F0 quotient as a complex torus with the supplied polarization.
2. Apply the abelian-algebraization/polarization input to the compact weight-minus-one torus, and construct the commutator torsor through its line-bundle class.
3. Assemble the quotients over the pure arithmetic boundary quotient, compare transition maps and keep the finite level cover; pass to non-neat finite quotients separately.

**Planning API.**

- `BoundaryTorsor.torusCharacters` (characterisation): The character lattice is dual to the actual integral U1 lattice.
- `BoundaryTorsor.abelianQuotient` (projection): The quotient by the central torus is the constructed abelian torsor over the pure boundary base.
- `BoundaryTorsor.levelChange` (functoriality): Specified level changes induce the lattice/torsor maps and commute with rational conjugation.

**Unit tests.**

- `BoundaryTorsor.siegel2_klingen_test` (computation): The genus-two rank-one cusp has torus rank 1 and an elliptic abelian direction.
- `BoundaryTorsor.siegel2_siegel_test` (degenerate): The maximal genus-two cusp has torus rank dim Sym²(Z²)=3 and abelian dimension zero.
- `BoundaryTorsor.nontrivial_test` (non-example): A nontrivial character line gives a nontrivial torus torsor, not a chosen product with G_m.

**Consumers.**

- `ShimuraCompactifications:C0/relative-torus-embedding`: Instantiates the generic torsor chart without reversing the C0→C1 dependency.
- `ShimuraCompactifications:C2`: Supplies the mixed neighbourhood of each existing rational boundary.

**Direct prerequisites.**

- `ShimuraCompactifications:C1/mixed-boundary-datum`
- `ShimuraCompactifications:C1/boundary-mixed-hodge-structure`
- `AbelianSchemesAndArithmeticModuli:A2`
- `AbelianSchemesAndArithmeticModuli:A5`
- `SchemeAndStackFoundations:SF.1`
- `SchemeAndStackFoundations:SF.3`
- `ShimuraVarieties:V0/component-decomposition`
- `tauceti:TauCeti.SplitTorus.groupScheme`

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 3.12–3.22; 6.1–6.7; 7.2–7.5: Central torus and abelian-torsor tower with finite homogeneous-cover and stabilizer qualifications.

**Acceptance.**

- At a genus-two rank-one Siegel cusp the abelian fibre has dimension 1 and the torus rank is 1.
- At a maximal genus-two cusp the torus rank is 3 and there is no positive-dimensional abelian fibre.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C1

**namespace.** TauCeti.ShimuraCompactifications

### Cusp labels and their equivalence

**Node:** `ShimuraCompactifications:C1/cusp-label`. **Declaration:** `TauCeti.ShimuraCompactifications.C1.cusp_label`. **Kind:** definition. **Implementation:** unchecked.

**Planet:** Cusp label.

Define an adelic cusp label from the existing rational boundary component/parabolic, its boundary mixed datum and the finite-adelic level representative. Quotient by the actual rational conjugation, boundary arithmetic action and right-K action. A cone label adds a cone in that cusp's common lattice and uses the compatible induced equivalence. Neither a representative nor a connected/irreducible component of its boundary base is identified with the entire equivalence class.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- The mixed boundary datum and the finite adelic double-coset description are supplied; use Pink's finite cover X1.

**Construction or proof.**

1. Define the equivalence relation by Pink 6.10–6.12 elementary actions and boundary identifications; prove the displayed commutation relations give a consistent quotient.
2. Compute the stabilizing action on the central lattice and transport cone membership, preserving the actual cusp datum.
3. Use arithmetic double-coset finiteness and finite cone orbits for the finite set of stratum labels used in a complete compactification.

**Planning API.**

- `CuspLabel.representative_invariant` (relation): All elementary rational/level transformations give the same cusp class.
- `CuspLabel.cone_transport` (functoriality): The label equivalence transports cones through the specified integral map.
- `CuspLabel.finite` (structure): At finite level the cusp classes are finite; complete admissible cone systems have finitely many cone-label orbits.
- `CuspLabel.mk` (constructor): A genuine boundary/cusp representative with its finite-adelic level data defines its class in the equivalence quotient.
- `CuspLabel.eq_iff` (characterisation): Two representatives have equal cusp labels exactly when they are related by the source's specified rational/level elementary equivalence; no chosen representative is part of a quotient label.

**Unit tests.**

- `CuspLabel.modular_test` (computation): For GL2-type modular data cusp labels reduce to the standard rational-cusp double cosets with their level width.
- `CuspLabel.representative_test` (compatibility): Right multiplication by K gives the identical cusp class.
- `CuspLabel.component_test` (non-example): A cusp base with two connected components has one admissible cusp class but two possible component strata; they are not collapsed.

**Consumers.**

- `ShimuraCompactifications:C2/arithmetic-gluing`: Indexes quotient charts and their overlaps.
- `ShimuraCompactifications:C5/formal-completion`: Preserves the cusp/cone labels in formal charts.

**Direct prerequisites.**

- `ShimuraCompactifications:C1/mixed-boundary-datum`
- `AdelicAlgebraicGroups:AA.3`
- `ShimuraCompactifications:C0/arithmetic-admissible-fan`
- `ShimuraVarieties:V2/rational-boundary`

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 6.10–6.12 and 7.2–7.5, printed pp. 100–102 and 118–120: Actual label equivalence and stratum quotients.

**Acceptance.**

- Changing a representative by an allowed action does not change the stratum label.
- Labels never force a disconnected boundary base to be irreducible.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C1

**namespace.** TauCeti.ShimuraCompactifications

### Effective arithmetic stabilizers and finite overlap

**Node:** `ShimuraCompactifications:C1/arithmetic-stabilizer`. **Declaration:** `TauCeti.ShimuraCompactifications.C1.arithmetic_stabilizer`. **Kind:** theorem. **Implementation:** unchecked.

**Planet:** Cusp stabilizer.

Construct the cusp normalizer quotient Delta1 and its effective action on U1/lattices. For polyhedral cones sigma,tau in the rational closure, the set of EFFECTIVE arithmetic images gamma for which gamma(sigma) intersects tau in the open positivity cone is finite. Identify the ineffective kernel up to the specified central/arithmetic subgroups. Cone stabilizers act through finite groups; neatness removes the relevant effective finite cone action. Do not assert that the full normalizer is finite or that a merely neat level removes every central kernel.

**Hypotheses.**

- Use Pink 6.18 definitions and the positivity cone from the actual boundary datum. Both cones are in the appropriate rational closure.
- The finite-overlap conclusion uses the arithmetic reduction input for the homogeneous positivity cone, requested from AA.3/V2.

**Construction or proof.**

1. Pass to the image rho(Q) of the cusp normalizer on U1; identify the kernel using Pink 6.20 rather than counting every ineffective element.
2. Apply Pink 6.19(a) arithmetic reduction to cone intersections and 6.19(b) a rational polyhedral reduction domain.
3. Derive finite cone stabilizer images; use neatness on the finite effective action and retain the ineffective quotient in the torsor/stack model.

**Direct prerequisites.**

- `ShimuraCompactifications:C1/mixed-boundary-datum`
- `ShimuraVarieties:V2/rational-boundary`
- `AdelicAlgebraicGroups:AA.3`
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 6.18–6.21, printed pp. 105–109: Effective finite-overlap argument; AMRT reduction proof remains a named source leaf.

**Acceptance.**

- An infinite central kernel does not contradict finite effective overlap.
- The quotient action must preserve the central lattice.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C1

**namespace.** TauCeti.ShimuraCompactifications

### Positivity cones and boundary incidence

**Node:** `ShimuraCompactifications:C1/boundary-incidence`. **Declaration:** `TauCeti.ShimuraCompactifications.C1.boundary_incidence`. **Kind:** theorem. **Implementation:** unchecked.

Identify the positivity cone C(P1,X1) and its rational closure as the union of the cones of incident rational boundary data. For a pure initial datum the cone is open convex nondegenerate homogeneous self-adjoint in U1(R); general mixed reductions may carry lineality and require the quotient in Pink 4.15. Prove nested-boundary and rational-conjugation formulas on groups, central lattices, torsors and cones, preserving the V2 analytic incidence relation.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. No universal abelian scheme is assumed for this datum.
- Use the exact embedded central spaces and quotient maps of Pink 4.22–4.25; C* need be neither open nor closed.

**Construction or proof.**

1. Pink 4.15 identifies the pure-boundary cone using the Hodge representation and Cartan involution.
2. Pink 4.22–4.25 give the rational closure and intersection/quotient identities for incident components.
3. Transport through conjugation and the cusp-label equivalence, producing the face/stratum order for the toroidal charts.

**Direct prerequisites.**

- `ShimuraCompactifications:C1/mixed-boundary-datum`
- `ShimuraCompactifications:C1/boundary-mixed-hodge-structure`
- `ShimuraVarieties:V2/rational-boundary`
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`
- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 4.15 and 4.22–4.25, printed pp. 63–64 and 68–69: Positivity and rational closure, with pure/mixed lineality distinction.

**Acceptance.**

- For Siegel maximal cusps C is the positive-definite symmetric cone; C* includes positive-semidefinite forms with rational radical.
- Do not replace C* by the topological closure with irrational-radical boundary points.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C1

**namespace.** TauCeti.ShimuraCompactifications

## C2. Arithmetic gluing, properness, boundary and canonical models

Partial boundary charts are formed from the actual C1 torsors and C0 embeddings, with the specified imaginary-part inequalities. Their analytic carrier is the requested nilpotent-preserving carrier of ComplexComparisonPartII C0. Quotient separation uses controlled neighbourhoods and effective arithmetic stabilizers. An abstract orbit set does not establish Hausdorffness or a normal analytic space.

The partial charts glue under the actual boundary-incidence maps. Completeness and arithmetic finite-orbit conditions prove compactness; the projective compatible fan supplies the positivity needed for algebraization. Pink distinguishes the algebraic-space conclusion from scheme representability with an ample covering. Regular cones and neatness give local normal crossings. A globally simple boundary additionally requires the no-self-identification condition.

Canonical descent uses canonical models of the special mixed boundary data, along with the given pure reflex-field model. A pure Shimura datum has no universal abelian scheme in general. PEL moduli descent is a specialization, not a substitute for that general argument. The boundary map to the minimal compactification and its compatibility remain statements with their specified source and coefficient hypotheses.

**Remaining construction contracts.**

- Nonreduced analytic carrier integration, controlled quotient-neighbourhood proof, algebraic-space/GAGA and special mixed canonical descent interfaces.
- Geometric declaration/API/test signatures listed in the suggested-file omission ledger need actual supplier carriers. No stage is closed or implemented.

### Partial compactifications of boundary torsors

**Node:** `ShimuraCompactifications:C2/partial-boundary-charts`. **Declaration:** `TauCeti.ShimuraCompactifications.C2.partial_boundary_charts`. **Kind:** construction. **Implementation:** unchecked.

**Planet:** Partial toroidal compactification.

Construct the local partial analytic compactification attached to each C1 boundary torus torsor and its C0 cone system. On ordinary finite regular split charts it is the analytification of the supplied toric relative embedding, with the same character functions, face opens and orbit strata. For nonregular cones use the actual monoid-algebra analytic chart, retaining its singular and nilpotent structure; do not define every analytic chart to be a polydisc.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- Complex analytic spaces include nilpotents, structure sheaves, open gluing, fibre products and group actions. These are supplied by ComplexComparisonPartII:C0, with its still-open carrier gap exposed.

**Construction or proof.**

1. Analytify the finite-type relative monoid charts through the owner functor and identify the regular coordinate specializations with L2.
2. Glue ordinary face opens using the torsor transition functions and L3 finite-chart comparisons; nonregular charts require the recorded analytic monoid-algebra extension.
3. Retain the boundary lattice, cusp representative and group action for the subsequent arithmetic quotient, with the stratum comparison from L4.

**Planning API.**

- `PartialBoundaryChart.openTorsor` (structure): The original boundary torsor is an equivariant open subspace.
- `PartialBoundaryChart.faceOpen` (functoriality): A face gives the same ordinary open immersion as analytification of the relative toric face map.
- `PartialBoundaryChart.anchor` (compatibility): A finite regular trivialized complex chart identifies with the anchor chart, preserving characters and strata.
- `PartialBoundaryChart.glue_hom` (universal-property): Compatible analytic maps on the finite-type monoid charts agreeing on the face-open cocycle glue uniquely to the partial boundary space, in the nilpotent-preserving analytic category.

**Unit tests.**

- `PartialBoundaryChart.zero_test` (degenerate): The zero cone adds no boundary.
- `PartialBoundaryChart.rankOne_test` (computation): The trivial positive-ray chart is analytically A1_C with its G_m open.
- `PartialBoundaryChart.nilpotent_test` (non-example): Analytification of a nonreduced finite-type base keeps the epsilon class; passing to the reduced manifold fails.

**Consumers.**

- `ShimuraCompactifications:C2/arithmetic-gluing`: Supplies the actual local chart, not an unspecified resolution.

**Direct prerequisites.**

- `ShimuraCompactifications:C1/boundary-torsor-tower`
- `ShimuraCompactifications:C1/cusp-label`
- `ShimuraCompactifications:C0/relative-torus-embedding`
- `ShimuraCompactifications:C0/relative-face-open`
- `ComplexComparisonPartII:C0/repair-analytification`
- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`
- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-2-affine-analytic-charts-of-regular-cones`
- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-3-finite-fan-analytic-gluing`
- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-4-torus-actions-strata-and-the-boundary`

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 6.6–6.17, especially the construction in 6.13 and elementary identifications in 6.14–6.17, printed pp. 98–105: Partial torus embeddings and transition maps.

**Acceptance.**

- The zero-cone chart is the original torsor.
- The analytic image of Spec C[epsilon]/epsilon² retains its nilpotent structure.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C2

**namespace.** TauCeti.ShimuraCompactifications

### Arithmetic quotient neighbourhoods and separation

**Node:** `ShimuraCompactifications:C2/quotient-separation`. **Declaration:** `TauCeti.ShimuraCompactifications.C2.quotient_separation`. **Kind:** theorem. **Implementation:** unchecked.

The elementary relation on partial boundary charts admits actual local quotient neighbourhoods by the cusp normalizer, has closed graph, and yields a Hausdorff complex analytic quotient with finite effective local stabilizers. Quotient invariant sheaves supply the local analytic structure. Neatness removes the effective finite stabilizer at smooth cone charts; arbitrary level retains the finite quotient, without asserting smoothness.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- Use Pink's controlled neighbourhoods V1→V2→V3 in the rational Satake space, with V2/satake-compactness and its local topology/reduction contract.
- The ineffective center is removed through the specified quotient action; finiteness of the full cusp group is not assumed.

**Construction or proof.**

1. Pink 6.19 finite effective overlap gives discontinuity on the cone charts; use the controlled Satake neighbourhoods of 6.22 rather than all boundary completions.
2. Identify the chart equivalence relation on those neighbourhoods with the cusp-normalizer action; Pink 6.23 then proves its graph closed.
3. Construct the invariant analytic sheaf on the finite local quotient. Closed graph and the local separation results prove Hausdorffness; smoothness requires the neat/regular hypotheses.

**Direct prerequisites.**

- `ShimuraCompactifications:C2/partial-boundary-charts`
- `ShimuraCompactifications:C1/arithmetic-stabilizer`
- `ShimuraVarieties:V2/satake-compactness`
- `ComplexComparisonPartII:C0/repair-analytification`
- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-3-finite-fan-analytic-gluing`
- `SchemeAndStackFoundations:SF.1`

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 6.20–6.24, printed pp. 107–112: Controlled neighbourhood quotient and closed graph; AMRT neighbourhood proof is a recorded source leaf.

**Acceptance.**

- A finite nontrivial stabilizer may give a normal singular quotient.
- Closed graph is a proved input, not an automatic consequence of finite cone orbits.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C2

**namespace.** TauCeti.ShimuraCompactifications

### Arithmetic toroidal gluing

**Node:** `ShimuraCompactifications:C2/arithmetic-gluing`. **Declaration:** `TauCeti.ShimuraCompactifications.C2.arithmetic_gluing`. **Kind:** construction. **Implementation:** unchecked.

**Planet:** Toroidal compactification.

Glue the local arithmetic quotient charts by Pink's rational conjugation, adelic-level and nested-boundary transitions to construct the actual analytic toroidal space Sh_K^tor(Sigma). It contains the original Sh_K(C), has the cone/cusp orbit stratification, and agrees with each controlled quotient neighbourhood. The gluing cocycle and effective quotient are part of the construction.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- Use the actual analytic-space category, quotient charts and their open transition maps. Completeness is not needed for the local construction; it is needed for compactness.

**Construction or proof.**

1. Form the disjoint union of partial charts with their original interior and the elementary equivalence relation of Pink 6.10–6.12.
2. Use quotient-separation to descend structure sheaves and open charts through the controlled local equivalence relation.
3. Apply open analytic gluing and the transition cocycle to obtain the space and its atlas; identify the original interior and the cusp/cone orbit strata.

**Planning API.**

- `ToroidalSpace.chart` (structure): Each controlled arithmetic quotient neighbourhood embeds as its stated open chart.
- `ToroidalSpace.interior` (structure): The original analytic Shimura quotient is the given open subspace.
- `ToroidalSpace.strata` (characterisation): The strata are the actual cone-label quotients with the nested-boundary incidence rule.
- `ToroidalSpace.chart_overlap` (compatibility): Transition maps on a triple overlap satisfy the cocycle inherited from elementary label actions.
- `ToroidalSpace.descend_hom` (universal-property): Compatible invariant maps on the controlled quotient charts, agreeing under all elementary boundary/level identifications, descend uniquely to the glued arithmetic toroidal quotient.

**Unit tests.**

- `ToroidalSpace.compact_interior_test` (degenerate): If the pure Shimura variety has no rational boundary, the toroidal space is the interior.
- `ToroidalSpace.modular_q_test` (computation): A modular cusp of width w gives the usual punctured q-disc plus its q=0 point.
- `ToroidalSpace.anchor_test` (compatibility): A trivialized finite regular chart has the anchor's face-open overlap rather than an unrelated gluing.

**Consumers.**

- `ShimuraCompactifications:C2/minimal-boundary-map`: Constructs the source of the comparison to V2's minimal compactification.
- `ShimuraCompactifications:C3`: Constructs sources and targets of refinement maps.

**Direct prerequisites.**

- `ShimuraCompactifications:C2/partial-boundary-charts`
- `ShimuraCompactifications:C2/quotient-separation`
- `ShimuraCompactifications:C1/boundary-incidence`
- `ShimuraCompactifications:C1/cusp-label`
- `ComplexComparisonPartII:C0/repair-analytification`
- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-3-finite-fan-analytic-gluing`

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 6.10–6.12 and 6.24, printed pp. 100–102 and 112: Actual quotient/gluing construction.

**Acceptance.**

- An interior point is not identified with an unrelated cusp representative.
- The construction depends on Sigma through the specified chart system.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C2

**namespace.** TauCeti.ShimuraCompactifications

### Normality and the dense open interior

**Node:** `ShimuraCompactifications:C2/normal-open-dense`. **Declaration:** `TauCeti.ShimuraCompactifications.C2.normal_open_dense`. **Kind:** theorem. **Implementation:** unchecked.

The actual analytic toroidal space is normal and contains Sh_K(C) as an open dense analytic subspace. Nonregular rational saturated monoid charts remain allowed. Normality comes from normal toric chart algebras and finite invariant quotients, not from assuming a smooth compactification exists.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- Complex boundary bases are the actual smooth/normal mixed quotient bases; dual monoids are saturated in their character lattices.

**Construction or proof.**

1. Use integral saturated monoid normality on each complex chart and normality of the boundary base.
2. Finite stabilizer invariant rings/sheaves preserve normality. Descend this through the quotient neighbourhood atlas.
3. The ordinary torus is schematically dense in each monoid chart; transport the interior identification through the elementary chart relation.

**Direct prerequisites.**

- `ShimuraCompactifications:C2/arithmetic-gluing`
- `ShimuraCompactifications:C0/arbitrary-ring-toric-charts`
- `ShimuraCompactifications:C2/quotient-separation`
- `SchemeAndStackFoundations:SF.0`
- `ComplexComparisonPartII:C0/repair-analytification`

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 6.7 and 6.24, printed pp. 98–99 and 112: Normal finite quotient charts and their open dense interior.

**Acceptance.**

- A singular saturated cone gives a normal chart without being smooth.
- Normality is not claimed over every nonnormal coefficient ring of C0.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C2

**namespace.** TauCeti.ShimuraCompactifications

### Complete admissible fans give proper toroidal models

**Node:** `ShimuraCompactifications:C2/compactness-properness`. **Declaration:** `TauCeti.ShimuraCompactifications.C2.compactness_properness`. **Kind:** theorem. **Implementation:** unchecked.

**Planet:** Toroidal properness.

If the cusp fan system is complete and admissible, the analytic toroidal space is compact. Once algebraized, the resulting algebraic model is proper over its characteristic-zero field. Finite arithmetic orbit control, complete cusp support and the compact minimal/Satake base are all retained.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- The system is complete with the required finite cone/cusp orbit conditions. Use the algebraization theorem when asserting algebraic properness.

**Construction or proof.**

1. Map the constructed space to the compact rational Satake quotient.
2. Pink 6.27 uses controlled quotient charts and the torus valuation/support criterion to prove compactness above a finite cover of the Satake base.
3. Compactness over C supplies analytic properness to a point, and also properness of the comparison to the Hausdorff minimal space. After a separate algebraization, apply the owner's properness comparison; no integral properness follows from this step.

**Direct prerequisites.**

- `ShimuraCompactifications:C2/arithmetic-gluing`
- `ShimuraCompactifications:C2/minimal-boundary-map`
- `ShimuraCompactifications:C0/relative-fan-properness`
- `ShimuraVarieties:V2/satake-compactness`
- `ComplexComparisonPartII:C2`

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 6.27, printed pp. 114–115: Compactness proof for complete admissible arithmetic cone systems.

**Acceptance.**

- Deleting a needed boundary cone can destroy compactness.
- Properness of an integral C5 model requires its own valuative argument.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C2

**namespace.** TauCeti.ShimuraCompactifications

### Neat smooth fans and normal crossings

**Node:** `ShimuraCompactifications:C2/smooth-normal-crossings`. **Declaration:** `TauCeti.ShimuraCompactifications.C2.smooth_normal_crossings`. **Kind:** theorem. **Implementation:** unchecked.

**Planet:** Normal crossings boundary.

At neat level with a smooth admissible fan, the analytic toroidal space is smooth and its boundary is a normal-crossings divisor in the local sense. A global simple/no-self-intersection assertion requires the separate face no-self-identification condition. Compare its regular quotient coordinates with the ordinary coordinate hyperplanes supplied by L4.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- K is neat; every cone is regular in the actual central lattice. For the stronger global branch separation impose Pink 7.12(*)/9.20 explicitly.

**Construction or proof.**

1. Identify each regular torsor chart with polynomial/Laurent coordinates over the smooth boundary base.
2. Apply the effective stabilizer result at neat level to preserve smoothness and local coordinate branches under the quotient.
3. The boundary is locally a union of coordinate hyperplanes. Trace face identifications separately before asserting global simple normal crossings.

**Direct prerequisites.**

- `ShimuraCompactifications:C2/arithmetic-gluing`
- `ShimuraCompactifications:C0/relative-regular-coordinates`
- `ShimuraCompactifications:C0/relative-boundary-coordinates`
- `ShimuraCompactifications:C1/arithmetic-stabilizer`
- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-4-torus-actions-strata-and-the-boundary`
- `ComplexComparisonPartII:C0/repair-analytification`

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 6.26; 9.20–9.21, printed pp. 113–114 and 155–156: Local smoothness and extra refinement for no self-identification.

**Acceptance.**

- Simplicial nonregular cones do not satisfy this smoothness theorem.
- Two locally separate branches can still be globally identified without the extra fan condition.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C2

**namespace.** TauCeti.ShimuraCompactifications

### Algebraization for projective admissible fans

**Node:** `ShimuraCompactifications:C2/projective-algebraization`. **Declaration:** `TauCeti.ShimuraCompactifications.C2.projective_algebraization`. **Kind:** theorem. **Implementation:** unchecked.

**Planet:** Projective toroidal algebraization.

A smooth projective admissible fan at neat level gives a projective algebraization of the complete analytic toroidal space, whose ample line comes from the invariant piecewise-linear polarization. For arbitrary level construct the finite quotient algebraic model and its descended ample power. For a general admissible fan without the ample-cover condition construct the algebraic-space algebraization; do not call every proper toroidal algebraic space a projective scheme.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- For the projective conclusion use complete projective admissible Sigma. The general algebraic-space conclusion uses the effective analytic/algebraic descent contract and Pink's local ample charts.

**Construction or proof.**

1. Pink 9.18–9.24 attach polarization line bundles to the arithmetic torus charts and prove their quotient compatibility.
2. An invariant ample power gives the neat projective realization through the complex comparison owner's Chow/GAGA algebraization theorem.
3. For a non-neat level descend from a normal neat subgroup through a finite quotient; for nonprojective systems use algebraic-space charts and Pink 12.5 instead of assuming an ample global line.

**Direct prerequisites.**

- `ShimuraCompactifications:C2/arithmetic-gluing`
- `ShimuraCompactifications:C0/smooth-projective-refinement`
- `ShimuraCompactifications:C2/normal-open-dense`
- `ComplexComparisonPartII:C2`
- `ComplexComparisonPartII:C4`
- `SchemeAndStackFoundations:SF.1`
- `SchemeAndStackFoundations:SF.3`
- `ShimuraCompactifications:C2/compactness-properness`

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 9.24; 12.4–12.5, printed pp. 157–158 and 197–198: Scheme algebraization needs ample cover; algebraic spaces have the unconditional version.

**Acceptance.**

- Projectivity records an actual ample line, not only compactness.
- A nonprojective complete fan is not forced into a projective scheme.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C2

**namespace.** TauCeti.ShimuraCompactifications

### Comparison with the existing minimal compactification

**Node:** `ShimuraCompactifications:C2/minimal-boundary-map`. **Declaration:** `TauCeti.ShimuraCompactifications.C2.minimal_boundary_map`. **Kind:** theorem. **Implementation:** unchecked.

Construct the continuous analytic comparison from the actual toroidal quotient to the already-owned minimal compactification. On each boundary cone stratum it is the map through the associated pure boundary quotient; its cone-stratum restriction is the specified torus/abelian-torsor quotient map. Preserve the cusp equivalence classes and incidence order; do not assume each entire boundary fibre or stratum is irreducible. Properness is a later consequence of compactness-properness for complete fans and a Hausdorff minimal target; its algebraic form is obtained after projective-algebraization. Neither conclusion is an input to constructing the continuous map.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- Use V2's actual Baily–Borel/Satake algebraization and its boundary strata. The source toroidal model is the C2 construction, not a resolution chosen from an existence theorem.

**Construction or proof.**

1. The ordinary partial embedding has the canonical map to its pure boundary quotient.
2. Pink 6.22–6.24 show these maps agree under elementary identifications and are continuous for the rational Satake topology; glue them on the constructed quotient.
3. Identify the cone-stratum restriction using Pink 7.2–7.5. The continuous comparison is constructed before compactness. Once compactness-properness and algebraization have been established, the same map is proper and the proper-morphism GAGA interface algebraizes it; these are subsequent consequences, not prerequisites of this construction.

**Direct prerequisites.**

- `ShimuraCompactifications:C2/arithmetic-gluing`
- `ShimuraCompactifications:C1/boundary-torsor-tower`
- `ShimuraCompactifications:C1/boundary-incidence`
- `ShimuraVarieties:V2/baily-borel`
- `ComplexComparisonPartII:C4`

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 6.21–6.24, printed pp. 109–112; 7.2–7.5, printed pp. 118–120: The toroidal-to-minimal map and actual quotient strata.

**Acceptance.**

- A cone-label quotient maps to its existing pure boundary stratum.
- The map is independent of the chosen cusp representative.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C2

**namespace.** TauCeti.ShimuraCompactifications

### Canonical models of toroidal compactifications

**Node:** `ShimuraCompactifications:C2/canonical-toroidal-model`. **Declaration:** `TauCeti.ShimuraCompactifications.C2.canonical_toroidal_model`. **Kind:** construction. **Implementation:** unchecked.

**Planet:** Canonical toroidal model.

For a datum class with the actual pure canonical model and the special mixed-boundary canonical torsors supplied, descend the constructed toroidal algebraization to its reflex field E. The canonical model restricts to the supplied pure canonical model and has the specified completed boundary torsor charts. It is a scheme when Pink 12.4's ample-cover condition holds and otherwise an algebraic space as in 12.5. Canonical-model uniqueness on the dense interior determines morphisms after existence; it does not by itself construct boundary descent.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- Supply the canonical models of the actual boundary pure data and their special mixed torus/abelian torsors, reflex-field compatibility and dense special mixed points. V8 supplies pure functoriality; its general completion is instantiated only in C2.general.
- The fan is rational and compatible with the descent actions. Scheme effectivity requires the explicit ample-line-cover hypothesis.

**Construction or proof.**

1. Pink 12.1 identifies boundary reflex fields. Compare Galois transports of the special mixed canonical torsor charts and their formal neighbourhoods.
2. Pink 12.6–12.8 use special mixed-point density and normality to extend the descent isomorphisms from the interior; check the overlap cocycle on the actual charts.
3. Descend as an algebraic space by effective descent. Use the ample cover of 12.4 only for scheme effectivity and identify the restricted pure model by V8 uniqueness. The unread density proof 12.13–12.17 is exposed as a supplier/source gap.

**Planning API.**

- `ToroidalCanonicalModel.interior` (compatibility): Restriction to Sh_K is the actual canonical model over E.
- `ToroidalCanonicalModel.boundaryCompletion` (characterisation): Each labelled completed neighbourhood is the specified mixed canonical torsor embedding over E.
- `ToroidalCanonicalModel.descent_cocycle` (structure): The Galois descent isomorphisms obey the cocycle and preserve the labelled boundary maps.
- `ToroidalCanonicalModel.unique` (extensionality): Two effective descent models with the prescribed complex comparison and mixed boundary canonical identifications have the unique comparison isomorphism compatible with those data, by the specified descent/uniqueness theorem.

**Unit tests.**

- `ToroidalCanonicalModel.empty_boundary_test` (degenerate): For a compact Shimura variety the construction is its original canonical model.
- `ToroidalCanonicalModel.baseChange_C_test` (compatibility): Base change and analytification recover the C2 toroidal quotient with its original charts.
- `ToroidalCanonicalModel.modular_cusp_test` (computation): For a modular cusp the descended completed ring is the cyclotomic cusp ring with its width-normalized q parameter.

**Consumers.**

- `ShimuraCompactifications:C2.general`: Instantiates the same construction with general pure canonical models.
- `ShimuraCompactifications:C3`: Provides algebraic sources and targets for descended refinement and Hecke maps.

**Direct prerequisites.**

- `ShimuraCompactifications:C2/projective-algebraization`
- `ShimuraCompactifications:C2/minimal-boundary-map`
- `ShimuraVarieties:V8`
- `SchemeAndStackFoundations:SF.1`
- `ComplexComparisonPartII:C4`

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 12.1–12.8, printed pp. 196–199: Construction and effectivity conditions; density proof is explicitly not claimed read.

**Acceptance.**

- The dense-open pure canonical model agrees with the supplied one.
- An arbitrary formal chart isomorphism is not taken as an ordinary open overlap.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C2

**namespace.** TauCeti.ShimuraCompactifications

## C2.general. Canonical models for general pure data

The general canonical-model theorem uses the V8.general reflex-field model and the same special mixed boundary supplier as C2. Galois transport includes the domain cover, cusp labels, character lattice and fan, not merely the pure interior. Descent effectiveness is an algebraic-space assertion; a scheme conclusion uses the stated ample-cover criterion. The identification is fixed on the dense interior and on the specified boundary special points.

**Remaining construction contracts.**

- The same mixed boundary canonical supplier and dense-special-point descent proof, retaining the V8.general fields.
- Geometric declaration/API/test signatures listed in the suggested-file omission ledger need actual supplier carriers. No stage is closed or implemented.

### Toroidal canonical models for general pure data

**Node:** `ShimuraCompactifications:C2.general/general-toroidal-descent`. **Declaration:** `TauCeti.ShimuraCompactifications.C2_general.general_toroidal_descent`. **Kind:** theorem. **Implementation:** unchecked.

**Planet:** General toroidal canonical model.

Instantiate the C2 descent construction for every pure Shimura datum using V8.general's actual general canonical tower/minimal models and the requested general boundary mixed canonical torsors. Preserve the existing rational boundary, cusp stabilizer and cone labels, together with the algebraic-space versus ample-cover scheme distinction. This adds no universal abelian scheme and no integral model at bad primes.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- Use ShimuraVarieties:V8.general/general-tower and general-minimal, plus the special mixed-boundary canonical supplier in exactly the datum class needed by Pink 12.4–12.5.

**Construction or proof.**

1. Specialize the pure canonical and minimal inputs of canonical-toroidal-model to V8.general.
2. Identify each boundary pure datum and its canonical special mixed torsors with the unchanged C1 labels; the remaining mixed-model source leaf is recorded, not absorbed into general pure uniqueness.
3. Apply the same effective descent and ample-cover criterion, comparing the finite complex charts through L0/L2/L3/L4.

**Direct prerequisites.**

- `ShimuraCompactifications:C2/canonical-toroidal-model`
- `ShimuraVarieties:V8.general/general-tower`
- `ShimuraVarieties:V8.general/general-minimal`
- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`
- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-2-affine-analytic-charts-of-regular-cones`
- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-3-finite-fan-analytic-gluing`
- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-4-torus-actions-strata-and-the-boundary`

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 12.4–12.5, printed pp. 197–198: General toroidal canonical descent with scheme/algebraic-space distinction.

**Acceptance.**

- The boundary pure datum is unchanged by choosing V7 auxiliary canonical-model data.
- No PEL moduli family is introduced for a general datum.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C2/general

**namespace.** TauCeti.ShimuraCompactifications

## C3. Refinement, level and Hecke maps; derived boundary comparisons

A refinement gives a proper map with the same dense interior. Datum and level morphisms require compatible cone systems. An ordered Hecke span therefore passes through an auxiliary common refinement, with its source and target levels retained. Different choices compare through a further refinement; they need not give literally equal compactifications.

The cohomological argument has three distinct statements: degree-zero structure-sheaf pushforward, higher direct-image vanishing, and the boundary-ideal comparison. The toric proof is an integral monomial-degree Čech argument with the specified support complexes. The arbitrary-coefficient theorem uses the derived projection formula with its coefficient hypotheses. Adic or partial ordinary statements also require their finite-thickening and inverse-limit comparison interfaces.

The subcanonical comparison is a derived pushforward assertion. On the blowup of a two-coordinate crossing, xy pulls back to u²v while the new reduced boundary has equation uv. Thus pulling back the old boundary line bundle is not the new subcanonical line bundle. The source correction is built into the statement.

The Klingen correspondence keeps the corrected first projection (G,H_n), the level-p^(n+1) second target and its specified subgroup. Its first-projection acyclicity needs an actual boundary-chart factorization and toric/coherent comparison. Properness of that projection alone supplies no vanishing theorem.

**Remaining construction contracts.**

- Integral Cech/KKMS vanishing and exact coefficient/adic comparison; Klingen boundary factorization; no false subcanonical pullback or ordinary inverse-limit shortcut.
- Geometric declaration/API/test signatures listed in the suggested-file omission ledger need actual supplier carriers. No stage is closed or implemented.

### Proper arithmetic refinement maps

**Node:** `ShimuraCompactifications:C3/refinement-map`. **Declaration:** `TauCeti.ShimuraCompactifications.C3.refinement_map`. **Kind:** construction. **Implementation:** unchecked.

**Planet:** Toroidal refinement map.

For a compatible refinement Sigma′ of Sigma at fixed datum and level, construct the canonical proper map Sh_K^tor(Sigma′)→Sh_K^tor(Sigma), restricting to the identity on the interior and to the shared ordinary toric refinement maps in each finite regular split chart. Identity and composition are canonical equalities of maps. The C5 integral version uses its actual degeneration-chart atlas and is a separate instantiation of this map contract.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- Sigma′ refines Sigma with unchanged cusp support. Use the actual C2 algebraic models, or the C5 integral models, and compatible boundary torsor data.

**Construction or proof.**

1. Define the chart maps by the common character-monoid inclusion and the supplied finite-chart L5 map.
2. The elementary rational, boundary and level identifications commute with these chart maps; descend and glue them on the arithmetic models.
3. Support equality gives properness on local charts. Identity/composition hold there and hence globally, with canonical descent over the reflex field.

**Planning API.**

- `ToroidalRefinement.interior` (compatibility): The open restriction is the identity of the original Shimura model.
- `ToroidalRefinement.comp` (functoriality): Maps for successive refinements compose to the map for the composite refinement.
- `ToroidalRefinement.proper` (structure): The map is proper under the stated support and model hypotheses.
- `ToroidalRefinement.id` (simp): The map for the identity refinement is the identity of the actual toroidal model.

**Unit tests.**

- `ToroidalRefinement.identity_test` (degenerate): Refinement by the identical cone system gives the identity map.
- `ToroidalRefinement.star_test` (computation): The (1,1) star subdivision of the quadrant is the blow-up of A² at the origin.
- `ToroidalRefinement.anchor_test` (compatibility): On a finite regular complex chart the map is exactly the supplied L5 monomial map.

**Consumers.**

- `ShimuraCompactifications:C3/coherent-cohomology-invariance`: Supplies the actual map for derived sheaf comparison.

**Direct prerequisites.**

- `ShimuraCompactifications:C2/canonical-toroidal-model`
- `ShimuraCompactifications:C0/relative-fan-properness`
- `ShimuraCompactifications:C1/cusp-label`
- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`
- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-3-finite-fan-analytic-gluing`
- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-4-torus-actions-strata-and-the-boundary`
- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-5-toric-maps-and-properness`

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 6.25 and 9.22–9.23: Functorial compatible fan maps and refinements.
- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.4.2.2–6.4.2.3; 7.1.1.4: Integral instantiation and proper chart maps.

**Acceptance.**

- A nontrivial star subdivision gives a proper birational map, not an isomorphism.
- The zero refinement is the identity.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C3

**namespace.** TauCeti.ShimuraCompactifications

### Compatible level and datum maps

**Node:** `ShimuraCompactifications:C3/level-datum-functoriality`. **Declaration:** `TauCeti.ShimuraCompactifications.C3.level_datum_functoriality`. **Kind:** theorem. **Implementation:** unchecked.

Extend a specified level map, rational datum map or Hecke translation to the toroidal models when its induced central lattice maps send every source cone into a target cone. Maps are over the stated reflex-field compositum, preserve labelled boundary strata, and satisfy the source's ordered composition laws. The corresponding normal-level finite quotient is constructed under its exact invariant-fan hypotheses; a level map is not declared etale at the boundary from interior etaleness.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- Provide compatible source and target fans for this particular map; use V8's pure finite-level/datum/translation maps and the actual C1 boundary lattice maps.

**Construction or proof.**

1. Use the induced monomial/torsor chart maps and Pink 6.25 compatibility with elementary identifications.
2. Descend and glue on the actual models, checking the same interior map and the boundary cone labels.
3. Prove composition and normal-level quotient by local chart comparison plus dense-open uniqueness. Record any boundary ramification in the lattice map.

**Direct prerequisites.**

- `ShimuraCompactifications:C3/refinement-map`
- `ShimuraCompactifications:C0/compatible-common-refinement`
- `ShimuraCompactifications:C1/boundary-incidence`
- `ShimuraVarieties:V8`
- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-5-toric-maps-and-properness`

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 6.25, printed pp. 113–114: Compatible fan maps, finite normal-level quotients and composition.

**Acceptance.**

- The Tate cusp map q↦q^p has boundary ramification even though its generic torus map is etale in characteristic zero.
- A datum map carries the specified reflex-field base change.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C3

**namespace.** TauCeti.ShimuraCompactifications

### Toroidal Hecke correspondences

**Node:** `ShimuraCompactifications:C3/hecke-span`. **Declaration:** `TauCeti.ShimuraCompactifications.C3.hecke_span`. **Kind:** construction. **Implementation:** unchecked.

**Planet:** Toroidal Hecke correspondence.

For a specified Hecke double coset choose compatible fans on its intermediate level and the two endpoints, and construct the ordered toroidal span extending V8's open Hecke span. A common refinement compares any two choices. The construction never claims one fixed fan admits every Hecke operator.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- Use the two actual maps at the intersection level K intersect gKg^-1 with the ordered translation convention of V8/hecke-span.

**Construction or proof.**

1. Apply the finite-family compatible-refinement theorem to the two boundary lattice maps.
2. Construct both toroidal arrows by level-datum-functoriality, preserving their open restrictions.
3. Compare different intermediate fans through refinement-map and identify the spans after refinement.

**Planning API.**

- `ToroidalHeckeSpan.openRestriction` (compatibility): The interior span is V8's ordered Hecke span.
- `ToroidalHeckeSpan.commonRefinement` (functoriality): Two compatible fan choices compare through a canonical refined span.
- `ToroidalHeckeSpan.boundaryMap` (structure): Each arrow maps its cone stratum through the stated cusp/lattice map.

**Unit tests.**

- `ToroidalHeckeSpan.identity_test` (degenerate): The identity double coset gives the identity span after the identity fan choice.
- `ToroidalHeckeSpan.q_power_test` (computation): A rank-one p-isogeny cusp arrow has the prescribed q↦q^p or q′^p=q map, not an etale extension by assumption.
- `ToroidalHeckeSpan.refinement_test` (compatibility): A further intermediate refinement leaves the open Hecke span unchanged.

**Consumers.**

- `AutomorphicBundles:B3`: Supplies the correspondence geometry for canonical/cuspidal coefficient maps.
- `IntegralCoherentHeckeComplexes`: Imports the actual refined span before defining trace maps.

**Direct prerequisites.**

- `ShimuraCompactifications:C3/level-datum-functoriality`
- `ShimuraCompactifications:C0/smooth-projective-refinement`
- `ShimuraVarieties:V8/hecke-span`

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 6.25 and 9.23: Compatible finite family of morphisms supplies the toroidal span.

**Acceptance.**

- The order of the two arrows agrees with the open correspondence.
- An incompatible fan is first refined.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C3

**namespace.** TauCeti.ShimuraCompactifications

### Independence through common refinements

**Node:** `ShimuraCompactifications:C3/choice-comparison`. **Declaration:** `TauCeti.ShimuraCompactifications.C3.choice_comparison`. **Kind:** theorem. **Implementation:** unchecked.

Any two admissible toroidal choices at fixed datum/level admit proper comparison maps from a common compatible refinement. Further common refinements give the same comparison diagrams. Choice independence means these maps and induced sheaf/cohomology identifications; it never means literal equality of all toroidal compactifications.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- Both fans satisfy the stated support and compatibility requirements.

**Construction or proof.**

1. Apply compatible-common-refinement and construct the two refinement maps.
2. Apply the identity/composition API to compare two common refinements through a third.
3. Use the resulting commutative diagrams for the sheaf comparison theorems, separating map existence from higher-direct-image vanishing.

**Direct prerequisites.**

- `ShimuraCompactifications:C3/refinement-map`
- `ShimuraCompactifications:C0/compatible-common-refinement`

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 9.22–9.23: Comparison through common compatible refinements.

**Acceptance.**

- A blow-up and its target differ as spaces but compare through the stated proper map.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C3

**namespace.** TauCeti.ShimuraCompactifications

### Universal toric structure-sheaf acyclicity

**Node:** `ShimuraCompactifications:C3/toric-structure-sheaf-vanishing`. **Declaration:** `TauCeti.ShimuraCompactifications.C3.toric_structure_sheaf_vanishing`. **Kind:** theorem. **Implementation:** unchecked.

**Planet:** Toric refinement vanishing.

For a finite rational fan subdivision Sigma′→Sigma with equal support, the proper toric map over any commutative ring R satisfies O→pi_*O as an isomorphism and R^i pi_*O=0 for i>0. State the two assertions independently. The integral monomial Cech proof is universal in R; finite regular complex maps supplied by L5 alone do not contain this cohomological theorem.

**Hypotheses.**

- Use the arbitrary-ring C0 toric realization. Check finite subdivision and support equality; the source need not be asserted smooth for the universal monomial argument.
- The required integral graded Cech exactness/contractibility lemma is a recorded proof leaf; the source quotation establishes the smooth-refinement applications, and the stronger universal argument must be verified before implementation.

**Construction or proof.**

1. Localize on an affine target cone and cover its subdivision inverse image by finitely many affine cone charts.
2. Grade the monomial Cech complex by the character lattice. Identify each weight complex with the integral relative polyhedral nerve complex and prove its augmentation exact with torsion-free/split terms.
3. Tensor that exact graded complex with arbitrary R, identify degree-zero functions and higher cohomology, then sheafify. The unread KKMS Ch. I §3 Corollaries on p44 remain an explicit source leaf.

**Direct prerequisites.**

- `ShimuraCompactifications:C0/arbitrary-ring-toric-charts`
- `ShimuraCompactifications:C0/relative-fan-properness`
- `SchemeAndStackFoundations:SF.2`
- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-5-toric-maps-and-properness`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 7.1.1.4 and proof, printed pp. 532–533: Both degree-zero and higher assertions after coefficient base change.
- [LAN-2017](https://www.kwlan.org/articles/cpt-ram-nbl.pdf), Proposition 7.5, proof (7.13)–(7.14): Reduction to toric affine chart maps.
- [PILLONI-2020](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), 3.4, proof of Proposition 3.4.1, author-copy pp. 15–16: Uses KKMS toric vanishing before the separately owned analytic comparison.

**Acceptance.**

- For the blow-up of the quadrant, pi_*O=O and positive higher direct images vanish.
- Normality alone proves neither universal coefficient change nor higher vanishing.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C3

**namespace.** TauCeti.ShimuraCompactifications

### Arithmetic structure-sheaf pushforward

**Node:** `ShimuraCompactifications:C3/refinement-structure-sheaf`. **Declaration:** `TauCeti.ShimuraCompactifications.C3.refinement_structure_sheaf`. **Kind:** theorem. **Implementation:** unchecked.

For refinement maps of the actual normal arithmetic toroidal models, O_X→f_*O_X′ is an isomorphism. This degree-zero theorem also holds on the C5 integral models and normalization charts in the exact Lan 2017 setup. It is kept separate from positive-degree vanishing.

**Hypotheses.**

- Use the genuine proper refinement map and the actual ordinary/formal quotient charts. For changed levels include the finite-group invariant formulation of Lan 7.5 rather than identifying all functions outright.

**Construction or proof.**

1. On equal-level toric charts apply the degree-zero part of toric-structure-sheaf-vanishing.
2. Descend through the torsor and arithmetic quotient charts; for normalization-base comparisons use the noetherian normal Zariski-main input of Lan 7.5.
3. Glue the canonical map and verify that it restricts to the identity on the interior.

**Direct prerequisites.**

- `ShimuraCompactifications:C3/refinement-map`
- `ShimuraCompactifications:C3/toric-structure-sheaf-vanishing`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:SF.1`

**Source match.**

- [LAN-2017](https://www.kwlan.org/articles/cpt-ram-nbl.pdf), Proposition 7.5, (7.6) and proof: Degree-zero map and normal-level invariant statement.

**Acceptance.**

- A finite level change generally gives invariant functions, not equality without taking invariants.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C3

**namespace.** TauCeti.ShimuraCompactifications

### Arithmetic higher direct-image vanishing

**Node:** `ShimuraCompactifications:C3/refinement-higher-structure-sheaf`. **Declaration:** `TauCeti.ShimuraCompactifications.C3.refinement_higher_structure_sheaf`. **Kind:** theorem. **Implementation:** unchecked.

For a same-level refinement of the exact C2 or C5 toroidal models, R^i f_*O_X′=0 for every i>0, locally on the target, with the specified coefficient-base-change hypotheses. For Lan 2017 normalized integral models use its projective cone and lattice-collection setup, including the changed-level version only as stated there.

**Hypotheses.**

- The map has the quotient/torsor chart descriptions of the actual construction. Integral coefficient comparisons use the universal toric result or the exact Noetherian/Dedekind reduction of Lan 7.1.1.4.
- Formal comparison requires proper coherent formal functions; it is not obtained merely by recognizing completed coordinate rings.

**Construction or proof.**

1. Apply positive-degree toric acyclicity on each inverse image of an affine target chart.
2. Use proper formal functions and the torsor/finite quotient model to compare the completed pushforward, tracking the arithmetic action.
3. Faithful local descent proves the sheaf vanishing on the target. State it separately from the degree-zero result.

**Direct prerequisites.**

- `ShimuraCompactifications:C3/refinement-map`
- `ShimuraCompactifications:C3/toric-structure-sheaf-vanishing`
- `SchemeAndStackFoundations:SF.1`
- `SchemeAndStackFoundations:SF.2`

**Source match.**

- [LAN-2017](https://www.kwlan.org/articles/cpt-ram-nbl.pdf), Proposition 7.5, (7.8) and proof: Positive-degree structure-sheaf vanishing on normalized integral toroidal models.

**Acceptance.**

- The proof identifies every R^i locally, rather than deducing it from f_*O=O.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C3

**namespace.** TauCeti.ShimuraCompactifications

### Boundary ideal and its derived pushforward

**Node:** `ShimuraCompactifications:C3/refinement-boundary-ideal`. **Declaration:** `TauCeti.ShimuraCompactifications.C3.refinement_boundary_ideal`. **Kind:** theorem. **Implementation:** unchecked.

**Planet:** Boundary ideal pushforward.

For the same actual toroidal refinement maps, f_*I_D′=I_D and R^i f_*I_D′=0 for i>0. On a relative toric chart use the strict-positive monomial ideal of the UNION of boundary divisors, distinct from the face ideal of a closed stratum. Over a nonreduced coefficient base this is the base-changed boundary ideal, not its radical. On the good integral models it agrees with the stated reduced Cartier boundary ideal. In general f*I_D is only a subsheaf of I_D′.

**Hypotheses.**

- Use the same map/chart/coefficient hypotheses as refinement-higher-structure-sheaf. Cartierty of the boundary twist is asserted only for the stated regular toroidal models.
- The vanishing concerns the ideal on the source, not a falsely equal pullback ideal.

**Construction or proof.**

1. Use the strict-positive character grading in the toric Cech proof, retaining the relative boundary ideal in degree zero.
2. Lan 2017 Proposition 7.5(7.7),(7.9) descends both assertions through the actual completed toroidal charts.
3. On regular coordinates compare pullback vanishing orders of the reduced boundary with the new exceptional ray; the blow-up test rejects the printed pullback equality in Pilloni E40.

**Direct prerequisites.**

- `ShimuraCompactifications:C3/refinement-map`
- `ShimuraCompactifications:C3/toric-structure-sheaf-vanishing`
- `ShimuraCompactifications:C0/relative-boundary-coordinates`
- `SchemeAndStackFoundations:SF.1`
- `SchemeAndStackFoundations:SF.2`

**Source match.**

- [LAN-2017](https://www.kwlan.org/articles/cpt-ram-nbl.pdf), Proposition 7.5, (7.7),(7.9): Derived boundary-ideal comparison.
- [PILLONI-2020](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), 5.3; Theorem 6.1.5.1(2), author-copy pp. 24 and 29: Use the corrected derived pushforward, not the printed pullback equality.

**Acceptance.**

- Blow up (x,y)=(0,0): pullback of (xy) has exceptional order 2 while the new reduced boundary ideal has exceptional order 1.
- For the quadrant the boundary-union ideal is (xy), whereas its closed-stratum ideal is (x,y).

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C3

**namespace.** TauCeti.ShimuraCompactifications

### Canonical and cuspidal cohomology under refinement

**Node:** `ShimuraCompactifications:C3/coherent-cohomology-invariance`. **Declaration:** `TauCeti.ShimuraCompactifications.C3.coherent_cohomology_invariance`. **Kind:** theorem. **Implementation:** unchecked.

**Planet:** Cohomology independence of the fan.

For a canonical locally free coefficient E with the supplier comparison f*E=E′, refinement induces isomorphisms H^i(X,E)→H^i(X′,E′) and H^i(X,E tensor I_D)→H^i(X′,E′ tensor I_D′) for every i. Over the good integral base these remain valid for E0 tensor_B M for EVERY B-module M under Lan 7.1.1.4's Dedekind/field and the stated universal-chart hypotheses; M is not silently assumed flat.

**Hypotheses.**

- Canonical/subcanonical bundles and their refined comparison are supplied by AutomorphicBundles:B3/B4, with the requested integral formally-canonical extension. The geometric maps and O/I_D derived comparisons are independently available.
- For arbitrary modules use the exact coefficient argument: filtered colimits and finite generated module reduction over the Dedekind/field base, or universal integral chart exactness.

**Construction or proof.**

1. Apply the derived projection formula for locally free E to the O and I_D comparisons.
2. For integral arbitrary M follow Lan 7.1.1.4: reduce by filtered colimits to finitely generated modules, split torsion and projective parts over the Dedekind base, and check quotient-ring coefficients by the universal local chart argument.
3. Compare two fans through a common refinement and prove functoriality of the cohomology isomorphisms. The subcanonical step uses Rf_*I_D′=I_D, not pullback equality.

**Direct prerequisites.**

- `ShimuraCompactifications:C3/refinement-structure-sheaf`
- `ShimuraCompactifications:C3/refinement-higher-structure-sheaf`
- `ShimuraCompactifications:C3/refinement-boundary-ideal`
- `ShimuraCompactifications:C3/choice-comparison`
- `AutomorphicBundles:B3/refinement-canonical-extension`
- `AutomorphicBundles:B4`
- `SchemeAndStackFoundations:SF.2`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 7.1.1.4–7.1.1.5, printed pp. 532–533: Arbitrary coefficient-module proof and canonical Hodge comparison.
- [CG-2020](https://math.uchicago.edu/~fcale/papers/Siegel.pdf), 5.2, published pp. 821–822; A.3.2, pp. 886–888: All-degree coherent coefficients including torsion.
- [PILLONI-2020](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), 5.3, author-copy p. 24: Cuspidal coherent cohomology.

**Acceptance.**

- Take M=B/pi^n; the result must survive this nonflat coefficient change.
- It applies to every degree, not just H0.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C3

**namespace.** TauCeti.ShimuraCompactifications

### Local vanishing for ordinary Igusa formal charts

**Node:** `ShimuraCompactifications:C3/partial-ordinary-formal-invariance`. **Declaration:** `TauCeti.ShimuraCompactifications.C3.partial_ordinary_formal_invariance`. **Kind:** theorem. **Implementation:** unchecked.

Export the O and boundary-ideal derived refinement comparisons locally on each target toroidal chart and on compatible p-adic completions. After the ordinary Igusa owner constructs its actual finite-level/profinite-flat chart towers and quotients, these local comparisons give the independence of canonical and cuspidal coherent cohomology on its partial toroidal compactifications under the specified completed-coefficient and limit hypotheses. No unconstrained inverse-limit/tensor interchange or construction of Igusa varieties is included.

**Hypotheses.**

- Formal bases are the Noetherian p-adic chart models with proper comparison maps. For a profinite-flat or perfectoid limit, require the owner's finite-level descent, completion exactness, inverse-system and completed-tensor theorem.
- Pilloni's analytic plus-sheaf comparison and completed valuation coefficients belong to AdicSpacesPartII:R3; C3 supplies its algebraic toric input.

**Construction or proof.**

1. Complete the locally proved O/I_D comparisons using proper formal functions, retaining all finite quotient actions.
2. Restrict to the ordinary open on the target; locality preserves the finite-level comparison.
3. Supply the resulting local maps to the Igusa and adic comparison owners. Only after their proved limit/coefficient comparison may one deduce the stated partial-toroidal cohomology invariance.

**Direct prerequisites.**

- `ShimuraCompactifications:C3/refinement-higher-structure-sheaf`
- `ShimuraCompactifications:C3/refinement-boundary-ideal`
- `ShimuraCompactifications:C3/coherent-cohomology-invariance`
- `SchemeAndStackFoundations:SF.2`
- `AdicSpacesPartII:F0`
- `AdicSpacesPartII:R3`

**Source match.**

- [BP-2026](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), 3.4.15–3.4.16, author copy p. 39: Partial Igusa refinement application of Lan 7.5.
- [PILLONI-2020](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), 3.4, author-copy pp. 15–16: Completed coefficient application, with analytic comparison owned elsewhere.

**Acceptance.**

- The export states vanishing locally on the target, before passing to a limit.
- A completed tensor with a non-Noetherian valuation coefficient is not exchanged with cohomology without the adic owner's comparison.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C3

**namespace.** TauCeti.ShimuraCompactifications

### Compactified Klingen correspondences

**Node:** `ShimuraCompactifications:C3/klingen-correspondence-compactification`. **Declaration:** `TauCeti.ShimuraCompactifications.C3.klingen_correspondence_compactification`. **Kind:** construction. **Implementation:** unchecked.

At the analytic Klingen p^n levels constructed by the integral-boundary/adic owners, choose compatible cone systems and compactify the correspondence of (G,H_n,L) from Pilloni 13.2.1. Here L⊂G[p²] is totally isotropic of etale type (Z/p)² direct-sum Z/p² and disjoint from H_n; t1=(G,H_n) and t2=(G/L,([p]^-1(H_n)+L)/L) at level p^(n+1). Extend both arrows through the actual toroidal chart maps. Its asserted positive-degree acyclicity is a separate target.

**Hypotheses.**

- Use exactly the characteristic-zero analytic models/levels of Pilloni 13.2.1. Their integral Klingen/paramodular models are owned by the Part II supplier and are not generalized good-prime C5 models.

**Construction or proof.**

1. Identify the open correspondence and its boundary lattice maps through the supplied degeneration comparison.
2. Apply the finite-family fan refinement theorem and glue the two toroidal arrows.
3. Transport to the specified analytic spaces through the adic comparison owner. Correct the printed H/C_n and subgroup parentheses as recorded by the reviewed extraction.

**Planning API.**

- `KlingenToroidalCorrespondence.t1_open` (compatibility): The first arrow sends (G,H_n,L) to (G,H_n).
- `KlingenToroidalCorrespondence.t2_open` (compatibility): The second arrow is the quotient and inverse-p-image level subgroup stated above.
- `KlingenToroidalCorrespondence.fanComparison` (functoriality): Further compatible cone refinements compare the compactified spans.

**Unit tests.**

- `KlingenToroidalCorrespondence.t1_test` (computation): For a triple at level p^n, t1 forgets exactly L and retains H_n.
- `KlingenToroidalCorrespondence.t2_test` (compatibility): The new level subgroup is the image of [p]^-1(H_n)+L in G/L.
- `KlingenToroidalCorrespondence.empty_test` (degenerate): On a base where no eligible L exists, the correspondence fibre is empty rather than an arbitrary chosen subgroup.

**Consumers.**

- `HigherHidaAndColemanTheory`: Imports the compactified analytic correspondence before its cohomological operator construction.

**Direct prerequisites.**

- `ShimuraCompactifications:C3/hecke-span`
- `ShimuraCompactifications:C4/boundary-level-comparison`
- `AdicSpacesPartII:R3`

**Source match.**

- [PILLONI-2020](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), 13.2.1, author-copy p. 85: Two compactified arrows with the corrected subgroup formula.

**Acceptance.**

- The target of t2 is level p^(n+1), not p^n.
- The two arrows extend the same ordered open maps.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C3

**namespace.** TauCeti.ShimuraCompactifications

### Acyclicity of the Klingen first projection

**Node:** `ShimuraCompactifications:C3/klingen-correspondence-acyclicity`. **Declaration:** `TauCeti.ShimuraCompactifications.C3.klingen_correspondence_acyclicity`. **Kind:** theorem. **Implementation:** unchecked.

For the exact compactified analytic correspondence of klingen-correspondence-compactification, prove (t1)_*O_C→R(t1)_*O_C is a quasi-isomorphism, equivalently R^i(t1)_*O_C=0 for i>0. This is not claimed to follow from properness or from the open map being finite; the boundary chart factorization and analytic-coherent comparison must be supplied.

**Hypotheses.**

- Use the exact source, level, coefficient structure sheaf and analytic comparison setting of Pilloni 13.2.1; integral parahoric vanishing is not inferred.

**Construction or proof.**

1. Determine the first projection on every boundary degeneration chart, factoring its finite normalization and toroidal subdivision pieces.
2. Apply the local toric vanishing only after this factorization has been proved, then the proper analytic coherent comparison.
3. Glue the local vanishing. Pilloni recalls this without a reference, and the missing boundary factorization/proof is recorded as a concrete gap rather than a proved consequence.

**Direct prerequisites.**

- `ShimuraCompactifications:C3/klingen-correspondence-compactification`
- `ShimuraCompactifications:C3/toric-structure-sheaf-vanishing`
- `AdicSpacesPartII:R3`
- `SchemeAndStackFoundations:SF.2`

**Source match.**

- [PILLONI-2020](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), 13.2.1, author-copy p. 85: Asserted acyclicity; supporting boundary proof is explicitly open.

**Acceptance.**

- The theorem names the actual first arrow and all positive degrees.
- No vanishing for arbitrary proper Hecke correspondences is asserted.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C3

**namespace.** TauCeti.ShimuraCompactifications

## C3.general. Reflex-field descent of general-data maps and spans

Every general-datum refinement, level morphism and ordered Hecke span descends over the stated reflex field or field compositum through C2.general. The morphisms carry the full fan/label data and cocycle. Compatibility with composition is tested after passage to a common refinement and then by descent. This theorem imports the existing general canonical-model interfaces and does not construct a second reflex-field theory.

**Remaining construction contracts.**

- Specified reflex-field/compositum descent of the full compatible map/span interface through the same special mixed supplier.
- Geometric declaration/API/test signatures listed in the suggested-file omission ledger need actual supplier carriers. No stage is closed or implemented.

### General-data toroidal maps and correspondences

**Node:** `ShimuraCompactifications:C3.general/general-map-descent`. **Declaration:** `TauCeti.ShimuraCompactifications.C3_general.general_map_descent`. **Kind:** theorem. **Implementation:** unchecked.

**Planet:** General toroidal functoriality.

Descend the C3 compatible refinement, level, datum and ordered Hecke maps to the C2.general toroidal canonical models, using V8.general functoriality over the prescribed reflex-field composita. Preserve boundary labels and the common-refinement comparisons, and prove identity/composition after descent. The coefficient vanishing theorems retain their own hypotheses and are not strengthened by this general-data instantiation.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- Use the actual general canonical models and the special mixed-boundary descent input, with compatible source/target cone systems for each specified map.

**Construction or proof.**

1. Apply the unchanged C3 chart maps to the C2.general models and identify their open restrictions with the V8.general maps.
2. Use canonical descent of the boundary torsors and dense-interior uniqueness to descend the maps.
3. Check identity/composition and common-refinement diagrams after complex base change, then reflect equality over the reflex field.

**Direct prerequisites.**

- `ShimuraCompactifications:C2.general/general-toroidal-descent`
- `ShimuraCompactifications:C3/level-datum-functoriality`
- `ShimuraCompactifications:C3/hecke-span`
- `ShimuraCompactifications:C3/choice-comparison`
- `ShimuraVarieties:V8.general/general-tower`
- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`
- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-2-affine-analytic-charts-of-regular-cones`
- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-3-finite-fan-analytic-gluing`
- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-4-torus-actions-strata-and-the-boundary`
- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-5-toric-maps-and-properness`

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 6.25; 12.4–12.8: Functorial fan maps and toroidal canonical-model descent.

**Acceptance.**

- A general datum map uses the specified field compositum.
- No all-prime integral extension is added.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C3/general

**namespace.** TauCeti.ShimuraCompactifications

## C4. Relative semiabelian degeneration, effectivity and extended structures

A semi-abelian scheme is a smooth separated commutative group scheme whose geometric fibres are extensions of abelian varieties by tori. Toric rank may jump. Its character sheaf is constructible; a global extension by a fixed torus requires the stated locally constant-rank assumptions. Abelian duals, Poincaré biextensions and polarizations belong to their existing arithmetic-moduli owner.

Relative degeneration data live over a Noetherian normal domain complete for a radical ideal, with an isotrivial torus. They retain the period lattice, injective finite-cokernel polarization map, Poincaré/cubical trivialization, symmetry and I-adic positivity. Periods are generic-fibre data; they are not assumed to extend as points everywhere. The local DVR Raynaud theory is imported from R11.3. Its current verbal reverse dependency on early C4 needs a supplier repair, recorded explicitly rather than treated as a closed chain.

Mumford's relatively complete model and period quotient, ample algebraization and effectivity produce the relative degeneration and its formal universal cusp instance. Generic Hom extension on a normal base and the uniqueness needed for endomorphisms are separate inputs. The extended isogeny kernel is quasi-finite flat in its precise boundary family and need not be finite. The Tate family q^p → q has generic degree p and trivial special-fibre kernel.

Tate coordinates distinguish the relative differential du/u from the base logarithmic differential dq/q and fix the Kodaira–Spencer normalization. In characteristic zero, the full semi-abelian Tate module is an extension of the abelian Tate module by the torus Tate module. Exactness is checked first on finite torsion and then through the actual profinite/primewise transition systems.

Global finite type or finite presentation is imposed only when an individual application requires it; it is not part of the generic semiabelian definition.

**Remaining construction contracts.**

- Relative effectivity/theta proof leaves, R11.3 local ownership interface, Faltings–Chai Hom extension, exact Tate/log-Kodaira–Spencer and boundary-level normalization interfaces.
- Geometric declaration/API/test signatures listed in the suggested-file omission ledger need actual supplier carriers. No stage is closed or implemented.

### Semi-abelian schemes

**Node:** `ShimuraCompactifications:C4/semi-abelian-scheme`. **Declaration:** `TauCeti.ShimuraCompactifications.C4.semi_abelian_scheme`. **Kind:** definition. **Implementation:** unchecked.

**Planet:** Semi-abelian scheme.

A semi-abelian scheme G over S is a separated smooth commutative group scheme whose geometric fibres are extensions of abelian varieties by tori. Keep the relative dimension and constructible character sheaf of the maximal fibrewise torus. A single global exact sequence by a torus exists under the additional locally constant toric-rank hypothesis; it is not part of the definition for a degenerating family. Smoothness supplies local finite presentation. When an application needs global finite presentation or finite type, retain that additional hypothesis in the application rather than inserting it into Lan's fibrewise definition.

**Hypotheses.**

- Work over the scheme or algebraic-space bases supplied by SF.1, using the existing group-scheme and abelian-scheme carriers. For Lan character/extension theorems retain his locally Noetherian base hypotheses.

**Construction or proof.**

1. Use the existing smooth separated commutative group-scheme structure and impose the stated geometric-fibre condition.
2. The maximal tori and their characters are identified fibrewise; descent supplies the constructible character sheaf.
3. Relate the constant-rank case to an extension by a relative torus and abelian scheme.

**Planning API.**

- `SemiAbelianScheme.baseChange` (functoriality): Every base change preserves the geometric-fibre condition and its smooth group structure, with identity/composition comparisons.
- `SemiAbelianScheme.characterSheaf` (projection): Returns the constructible character sheaf with its restriction to each geometric fibre.
- `SemiAbelianScheme.abelianEmbedding` (compatibility): An existing abelian scheme gives a semi-abelian scheme with zero character sheaf.
- `SemiAbelianScheme.constantRankExtension` (characterisation): Under the locally constant character-rank hypothesis the family is an extension of an abelian scheme by a torus.
- `SemiAbelianScheme.ofGroup` (constructor): A genuine separated smooth commutative group scheme with the stated geometric-fibre torus-extension property gives a semi-abelian scheme, without choosing a global torus extension for a rank-jumping family.
- `SemiAbelianScheme.ext` (extensionality): On a fixed group-scheme carrier and structure maps, two semi-abelian structures agree because the smooth/separated and geometric-fibre requirements are properties; equality does not require equality of chosen local torus splittings.

**Unit tests.**

- `SemiAbelianScheme.abelian_test` (degenerate): An abelian scheme has toric rank zero.
- `SemiAbelianScheme.splitTorus_test` (compatibility): The pinned rank-r SplitTorus is semi-abelian with character sheaf Z^r and zero abelian quotient.
- `SemiAbelianScheme.tate_rank_test` (computation): The Tate family has generic toric rank zero and boundary toric rank one.
- `SemiAbelianScheme.additive_test` (non-example): G_a is excluded: its geometric fibre is not an extension of an abelian variety by a torus.

**Consumers.**

- `ShimuraCompactifications:C4/polarized-degeneration-data`: Supplies the genuine group family reconstructed by degeneration data.
- `ShimuraCompactifications:C5/integral-toroidal-space`: Supplies the universal boundary extension.

**Direct prerequisites.**

- `AbelianSchemesAndArithmeticModuli:A2`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:SF.1`
- `tauceti:TauCeti.SplitTorus.groupScheme`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 3.3.1.1–3.3.1.4, printed pp. 191–192: Definition and constructible character data.

**Acceptance.**

- A Tate degeneration can have toric rank zero generically and one at the boundary.
- A constant-rank extension has the expected relative torus but a rank-jumping family need not.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C4

**namespace.** TauCeti.ShimuraCompactifications

### Character sheaves and homomorphisms from tori

**Node:** `ShimuraCompactifications:C4/constructible-character-sheaf`. **Declaration:** `TauCeti.ShimuraCompactifications.C4.constructible_character_sheaf`. **Kind:** theorem. **Implementation:** unchecked.

For a semi-abelian scheme G over a locally Noetherian base, construct its etale constructible character sheaf X(G), restricting to the free character lattice of the maximal torus in every geometric fibre. Identify morphisms from a torus T to G with the dual character-sheaf maps in Lan 3.3.1.9, with the exact sheaf direction and specializations retained. On the constant-rank locus this recovers the usual anti-equivalence for tori.

**Hypotheses.**

- Use Lan's constructible etale sheaf setting; no locally constant character lattice is assumed across a rank jump.

**Construction or proof.**

1. Construct fibrewise maximal tori and the specialization-compatible character sheaf.
2. Apply the relative homomorphism identification of Lan 3.3.1.9; the character map is contravariant.
3. Check the torus and abelian specializations and etale descent. The general sheaf theorem quoted from Faltings–Chai requires its missing supplier proof.

**Direct prerequisites.**

- `ShimuraCompactifications:C4/semi-abelian-scheme`
- `SchemeAndStackFoundations:SF.1`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 3.3.1.8–3.3.1.10, printed pp. 192–193: Character sheaf and torus-to-semi-abelian Hom comparison.

**Acceptance.**

- For G=T, the comparison is the native contravariant character-lattice Hom.
- For an abelian scheme G, every torus-to-G group homomorphism is zero.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C4

**namespace.** TauCeti.ShimuraCompactifications

### Relative torus extensions and Poincare classes

**Node:** `ShimuraCompactifications:C4/poincare-extension-classification`. **Declaration:** `TauCeti.ShimuraCompactifications.C4.poincare_extension_classification`. **Kind:** theorem. **Implementation:** unchecked.

For an abelian scheme A and an isotrivial torus H with finite-free character sheaf X(H), classify commutative group scheme extensions 0→H→G→A→0 by homomorphisms c:X(H)→A^dual. Lan 3.1.5.1 gives an anti-equivalence of the source categories (and, for fixed A,H, the corresponding classification of extension classes). In Lan's convention the rigidified invertible sheaf for chi corresponds to pushout of the torsor by -chi. Retain this negative-character/inverse-Poincare sign in reconstruction, multiplication, base change and duality; dual abelian schemes and biextensions remain A3/A5 inputs.

**Hypotheses.**

- Use the locally Noetherian base and isotrivial finite-free character data of Lan 4.2.1; do not assert a globally split torus without an etale trivialization.

**Construction or proof.**

1. For each character chi, take the rigidified invertible sheaf associated to the G_m-torsor obtained by pushout by -chi, as in Lan 3.1.5.1; the group-extension law puts its class in Pic^0=A^dual.
2. Reconstruct the graded character-line algebra using the Poincare biextension and its coherent multiplication.
3. Use the rigidifications to check the inverse constructions and contravariance of the character-sheaf description; retain the negative-character sign before defining degeneration trivializations.

**Direct prerequisites.**

- `ShimuraCompactifications:C4/semi-abelian-scheme`
- `ShimuraCompactifications:C4/constructible-character-sheaf`
- `AbelianSchemesAndArithmeticModuli:A3`
- `AbelianSchemesAndArithmeticModuli:A5`
- `SchemeAndStackFoundations:SF.1`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), Proposition 3.1.5.1, printed p. 183; 4.2.1.7 and 4.2.1.13, printed pp. 210 and 213: Anti-equivalence and negative-character pushout; inverse-biextension convention for degeneration data.

**Acceptance.**

- A trivial c gives the split extension A×T.
- A nonzero c gives a genuinely nontrivial character line, retained by C0 torsor charts.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C4

**namespace.** TauCeti.ShimuraCompactifications

### Polarized relative degeneration data

**Node:** `ShimuraCompactifications:C4/polarized-degeneration-data`. **Declaration:** `TauCeti.ShimuraCompactifications.C4.polarized_degeneration_data`. **Kind:** definition. **Implementation:** unchecked.

**Planet:** Polarized degeneration datum.

In the relative setting R,I,S,eta, define the polarized degeneration datum DD_pol of Lan Definition 4.4.6 (using the entries and positivity from 4.2.1.13): an abelian scheme A with polarization lambda_A, isotrivial finite-free sheaves X,Y, an injective phi:Y→X with finite cokernel, maps c:X→A^dual and c^dual:Y→A satisfying lambda_A c^dual=c phi, and a bilinear rigidified trivialization tau of the pullback of the INVERSE Poincare biextension on the generic fibre. Require its cubical/symmetry relations and the I-adic positivity condition: diagonal trivializations yield sections vanishing along I for nonzero y. The period lattice lives on the generic fibre; it is not silently an everywhere-defined map Y→G over S. Its associated generic polarized 1-motive is the complex [Y to G_eta], where G is the torus extension determined by c and the lift of c^dual is the period map determined by tau. This names the degeneration datum already being constructed, not a second generic motivic theory. This polarized tuple omits the additional ample-line and Y-action fields L^sharp and psi of DD_ample; when Mumford reconstruction uses them, derive the auxiliary data as in Remark 4.4.7, keeping track that its displayed choice induces 2 lambda_A.

**Hypotheses.**

- Let R be a Noetherian normal domain, complete for a radical ideal I, S=Spec R and eta=Spec Frac R. Use the isotrivial torus hypothesis and the cubical rigidifications of Lan 4.1 and 4.2.1.1; this relative setting is stronger and more general in its base than the complete-DVR local R11.3 specialization.
- Retain Lan's ampleness/polarization, positivity and base-change conditions. Use the same local lattice and Raynaud carriers as R11.3 when R is a complete DVR.

**Construction or proof.**

1. Assemble the extension of A by T through c and the supplied Poincare biextension.
2. Express the period map through tau, fixing the inverse-biextension and phi compatibility convention.
3. State positivity on the ideal of degeneration and compare the complete-DVR restriction to the imported polarized Raynaud datum.

**Planning API.**

- `PolarizedDegenerationData.extension` (projection): Returns the actual torus extension of A determined by c.
- `PolarizedDegenerationData.baseChange` (functoriality): Admissible complete base changes preserving the ideal and positivity transport all data and rigidifications.
- `PolarizedDegenerationData.localRaynaud` (compatibility): For a complete DVR, identifies the datum with the R11.3 polarized Raynaud/lattice input.
- `PolarizedDegenerationData.period_pairing` (relation): The period trivialization is bilinear and symmetric with the prescribed phi and inverse-Poincare convention.
- `PolarizedDegenerationData.genericOneMotive` (projection): Returns [Y to G_eta] with the actual tau-defined period map and polarization comparison lambda_A c^dual=c phi; it is compatible with admissible base change.
- `PolarizedDegenerationData.iso_iff` (extensionality): Structure-preserving isomorphisms of the abelian scheme and the character/period sheaves identify two DD_pol objects precisely when lambda_A,phi,c,c^dual and the rigidified tau commute with those isomorphisms and retain the same positivity data.
- `PolarizedDegenerationData.toAmple` (constructor): Remark 4.4.7 derives auxiliary DD_ample data from DD_pol: M=(Id,lambda_A)^*P_A, L^sharp=pi^*M and psi=(Id_Y,phi)^*tau, with the displayed 2phi and induced 2lambda_A retained. This auxiliary construction is not an equality of the two categories.

**Unit tests.**

- `PolarizedDegenerationData.rankZero_test` (degenerate): X=Y=0 gives A with its existing polarization.
- `PolarizedDegenerationData.tate_test` (computation): For X=Y=Z and period q, positivity is v(q)>0 and reconstruction gives the Tate degeneration.
- `PolarizedDegenerationData.local_test` (compatibility): The complete-DVR specialization retains the same character and period lattices as R11.3.
- `PolarizedDegenerationData.negative_test` (non-example): Period q^-1 for v(q)>0 fails the diagonal positivity condition.

**Consumers.**

- `ShimuraCompactifications:C4/mumford-quotient`: Supplies periods and ample gluing data.
- `ShimuraCompactifications:C4/formal-universal-degeneration`: Instantiates the universal cusp family.

**Direct prerequisites.**

- `ShimuraCompactifications:C4/poincare-extension-classification`
- `NeronModelsAndSemistableAbelianVarieties:R11.3`
- `AbelianSchemesAndArithmeticModuli:A3`
- `AbelianSchemesAndArithmeticModuli:A5`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), Definition 4.4.6 and Remark 4.4.7, printed p. 251; 4.2.1.7 and 4.2.1.13–4.2.1.14, printed pp. 210 and 213–214: The DD_pol tuple, its positivity, and its relation to the larger DD_ample tuple.

**Acceptance.**

- The no-torus case X=Y=0 recovers the polarized abelian scheme A.
- A negative Tate parameter valuation violates positivity and cannot define the stated proper degeneration.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C4

**namespace.** TauCeti.ShimuraCompactifications

### Relative Mumford quotient and algebraization

**Node:** `ShimuraCompactifications:C4/mumford-quotient`. **Declaration:** `TauCeti.ShimuraCompactifications.C4.mumford_quotient`. **Kind:** construction. **Implementation:** unchecked.

**Planet:** Mumford degeneration construction.

From positive polarized degeneration data and a compatible rational polyhedral decomposition, construct the relatively complete torus model, its formal period-lattice quotient and ample descent line. Algebraize the projective formal quotient over the complete base to obtain the semi-abelian degeneration and its generic polarized abelian scheme. The finite-index subgroup Y0 used to make an intermediate ample quotient is comparison data; the final construction descends the full lattice action.

**Hypotheses.**

- Let R be a Noetherian normal domain, complete for a radical ideal I, S=Spec R and eta=Spec Frac R. Use the isotrivial torus hypothesis and the cubical rigidifications of Lan 4.1 and 4.2.1.1; this relative setting is stronger and more general in its base than the complete-DVR local R11.3 specialization.
- Choose the compatible polarization and fan, preserving the cubical identities and I-adic positivity. Formal schemes and effectivity are imported from their owners, not reconstructed by ad hoc inverse limits.

**Construction or proof.**

1. Build the relatively complete torus model from C0 relative torsor charts, with line-bundle multiplication induced by tau.
2. Use positivity to prove period translations are locally discrete on the formal model, and descend the ample line after a finite-index lattice restriction.
3. Apply Lan 4.5.2.15–4.5.2.18 to the projective formal quotient and algebraize; compare the intermediate quotient with the full-lattice output. Relatively complete model/theta lemmas not read in full are explicit gaps.

**Planning API.**

- `MumfordDegeneration.genericFibre` (compatibility): The generic fibre is the polarized abelian scheme uniformized by the specified Raynaud extension and period lattice.
- `MumfordDegeneration.formalCompletion` (characterisation): The completion is the constructed formal period quotient with its descended ample line.
- `MumfordDegeneration.fanComparison` (functoriality): Compatible subdivisions induce the canonical comparison maps, agreeing on the generic fibre.

**Unit tests.**

- `MumfordDegeneration.rankZero_test` (degenerate): The zero-period-lattice datum returns the original abelian scheme.
- `MumfordDegeneration.tate_test` (computation): The rank-one period q gives G_m/q^Z on the generic analytic fibre.
- `MumfordDegeneration.refinement_test` (compatibility): Changing to a compatible subdivision changes the model by its toroidal comparison, preserving the generic uniformization.

**Consumers.**

- `ShimuraCompactifications:C4/degeneration-effectivity`: Constructs the quasi-inverse to extracting degeneration data.
- `ShimuraCompactifications:C5/good-algebraic-model`: Supplies the universal formal degeneration charts.

**Direct prerequisites.**

- `ShimuraCompactifications:C4/polarized-degeneration-data`
- `ShimuraCompactifications:C0/relative-torus-embedding`
- `ShimuraCompactifications:C0/smooth-projective-refinement`
- `SchemeAndStackFoundations:SF.1`
- `SchemeAndStackFoundations:SF.3`
- `NeronModelsAndSemistableAbelianVarieties:R11.3`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 4.5.2.15–4.5.2.18, especially Corollary 4.5.2.16, printed pp. 273–275: Projective formal quotient and ample effectivity.

**Acceptance.**

- Torus rank zero returns A.
- A positive rank-one datum gives the Tate family and its proper formal quotient.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C4

**namespace.** TauCeti.ShimuraCompactifications

### Polarized degeneration equivalence

**Node:** `ShimuraCompactifications:C4/degeneration-effectivity`. **Declaration:** `TauCeti.ShimuraCompactifications.C4.degeneration_effectivity`. **Kind:** theorem. **Implementation:** unchecked.

**Planet:** Polarized degeneration equivalence.

Under Lan's complete normal-base and positivity hypotheses, the functor extracting polarized degeneration data from semi-abelian degenerations with polarized abelian generic fibre is an equivalence with the groupoid DD_pol(R,I) of Definition 4.4.6. Prove full faithfulness and essential surjectivity separately, retaining the auxiliary cubical line construction and the structure-preserving isomorphisms used as morphisms in the polarized categories. The complete-DVR local specialization is imported from R11.3; this target is its relative effectivity extension.

**Hypotheses.**

- Let R be a Noetherian normal domain, complete for a radical ideal I, S=Spec R and eta=Spec Frac R. Use the isotrivial torus hypothesis and the cubical rigidifications of Lan 4.1 and 4.2.1.1; this relative setting is stronger and more general in its base than the complete-DVR local R11.3 specialization.
- Use exactly the degeneration categories and polarization requirements of Lan 4.4.1–4.4.16. An arbitrary singular complete ring outside this normal-domain setting is not covered.
- For the polarized equivalence the morphisms are structure-preserving isomorphisms in DEG_pol and DD_pol. This is not an equivalence of categories with all generic homomorphisms as arrows.

**Construction or proof.**

1. Extend a structure-preserving generic isomorphism and its inverse by homomorphism-extension; uniqueness makes their composites identities. Identify the compatible polarization, character, period and biextension maps. Full faithfulness concerns precisely the source's polarized isomorphism groupoids.
2. Essential surjectivity uses mumford-quotient and the relatively complete model/theta inputs in Lan 4.5.
3. Compare extraction and reconstruction on the actual objects and morphisms, including polarizations. The chapter's uninspected construction lemmas are named proof gaps, not an inferred equivalence from the statement alone.

**Direct prerequisites.**

- `ShimuraCompactifications:C4/polarized-degeneration-data`
- `ShimuraCompactifications:C4/mumford-quotient`
- `ShimuraCompactifications:C4/homomorphism-extension`
- `NeronModelsAndSemistableAbelianVarieties:R11.3`
- `SchemeAndStackFoundations:SF.3`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 4.4.1–4.4.16, printed pp. 250–255: Categories and equivalence theorem, with relative construction proof obligations.

**Acceptance.**

- The functor is fully faithful on morphisms, not just a bijection of isomorphism classes.
- The complete-DVR comparison uses the imported local theory.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C4

**namespace.** TauCeti.ShimuraCompactifications

### Universal degeneration on a cusp chart

**Node:** `ShimuraCompactifications:C4/formal-universal-degeneration`. **Declaration:** `TauCeti.ShimuraCompactifications.C4.formal_universal_degeneration`. **Kind:** construction. **Implementation:** unchecked.

**Planet:** Universal boundary degeneration.

For the PEL cusp label, construct the universal positive degeneration datum over the formal completion of its relative torus embedding and apply the relative effectivity equivalence. Obtain the formal semi-abelian family with its polarization, torus characters, abelian quotient and generic PEL family, compatible with admissible faces and changes of cusp representative.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- Complete along the specified positive monomial degeneration ideal; use the exact cusp base and formal chart rather than the completion of the entire boundary without isolating its stratum.

**Construction or proof.**

1. Take the universal c,c^dual,phi,tau from the cusp torsor and its graded monomials.
2. Verify positivity using the interior cone and apply degeneration-effectivity on the normal complete chart.
3. Identify face restrictions and representative changes by full faithfulness, preserving all rigidifications.

**Planning API.**

- `UniversalDegeneration.character` (projection): The toric character sheaf is the cusp label's specified X.
- `UniversalDegeneration.genericPEL` (compatibility): Its generic restriction identifies with the given PEL family and polarization.
- `UniversalDegeneration.faceRestriction` (functoriality): Allowed face and representative maps preserve the universal degeneration datum and its reconstruction.

**Unit tests.**

- `UniversalDegeneration.rankZero_test` (degenerate): At zero toric rank the family is the lower-dimensional universal abelian family.
- `UniversalDegeneration.tate_test` (computation): For a modular cusp the universal period is q and the invariant fibre differential is du/u.
- `UniversalDegeneration.representative_test` (compatibility): Equivalent cusp representatives induce isomorphic families through the prescribed descent map.

**Consumers.**

- `ShimuraCompactifications:C5/good-algebraic-model`: Supplies the formal object to algebraize.
- `ShimuraCompactifications:C5/log-kodaira-spencer`: Supplies the boundary Hodge and logarithmic differential comparison.

**Direct prerequisites.**

- `ShimuraCompactifications:C1/boundary-torsor-tower`
- `ShimuraCompactifications:C0/relative-torus-embedding`
- `ShimuraCompactifications:C4/degeneration-effectivity`
- `PELModuli:M1`
- `SchemeAndStackFoundations:SF.1`
- `SchemeAndStackFoundations:SF.3`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.2.5.25–6.2.5.28; 6.3.2.5: Universal formal degeneration and its good algebraic-model comparison.

**Acceptance.**

- The generic fibre has the prescribed PEL moduli meaning.
- Face comparison preserves the actual character and period lattices.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C4

**namespace.** TauCeti.ShimuraCompactifications

### Extension of semi-abelian homomorphisms

**Node:** `ShimuraCompactifications:C4/homomorphism-extension`. **Declaration:** `TauCeti.ShimuraCompactifications.C4.homomorphism_extension`. **Kind:** theorem. **Implementation:** unchecked.

Let S be a locally Noetherian normal scheme, U a dense open and G,H semi-abelian schemes over S. Restriction Hom_S(G,H)→Hom_U(G_U,H_U) is bijective: every generic-open homomorphism extends uniquely. State the same result over the algebraic-space bases by effective etale descent. Smoothness of an unrelated open moduli space does not supply this extension theorem.

**Hypotheses.**

- Retain normality of S, dense U and the semi-abelian family hypotheses of Lan 3.3.1.5 / Faltings–Chai I.2.7.

**Construction or proof.**

1. Apply the scheme extension theorem quoted by Lan to an etale chart of the normal base.
2. Use uniqueness on the dense restriction to verify the descent cocycle and descend the homomorphism.
3. Check identities and composition by the same uniqueness. The cited Faltings–Chai proof is an explicit unread source leaf.

**Direct prerequisites.**

- `ShimuraCompactifications:C4/semi-abelian-scheme`
- `SchemeAndStackFoundations:SF.1`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 3.3.1.5, printed p. 192: Quoted Faltings–Chai I.2.7 extension theorem.
- [BP-2026](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), Lemma 4.2.2, printed p. 43: Routed use of the extension theorem.

**Acceptance.**

- The restriction is a bijection on actual homomorphisms.
- No finite-flat kernel follows just from existence of the extension.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C4

**namespace.** TauCeti.ShimuraCompactifications

### PEL endomorphisms and Rosati compatibility

**Node:** `ShimuraCompactifications:C4/endomorphism-extension`. **Declaration:** `TauCeti.ShimuraCompactifications.C4.endomorphism_extension`. **Kind:** theorem. **Implementation:** unchecked.

Extend the generic O-action on the universal semi-abelian family uniquely across the normal boundary base. The extension remains a ring action and preserves the specified polarization/Rosati relations because these identities hold densely. Keep polarization morphisms and their duality in the actual degeneration category; no nonexistent dual semi-abelian scheme is presumed.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- Use the family from formal-universal-degeneration and its admissible algebraizations; its endomorphism identities are checked on the common dense generic restriction.

**Construction or proof.**

1. Extend each endomorphism by homomorphism-extension.
2. Reflect sums, products, identity and involution/polarization relations by uniqueness.
3. Verify compatibility with character and period maps in the degeneration datum and with chart descent.

**Direct prerequisites.**

- `ShimuraCompactifications:C4/homomorphism-extension`
- `ShimuraCompactifications:C4/formal-universal-degeneration`
- `PELModuli:M1`
- `AbelianSchemesAndArithmeticModuli:A3`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.3.2.5–6.3.2.6, printed pp. 503–504: PEL algebraizations carry the extended structures.

**Acceptance.**

- The O-action is a ring homomorphism after extension.
- The Rosati identity is transported with the given polarization datum.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C4

**namespace.** TauCeti.ShimuraCompactifications

### Boundary comparison of level structures

**Node:** `ShimuraCompactifications:C4/boundary-level-comparison`. **Declaration:** `TauCeti.ShimuraCompactifications.C4.boundary_level_comparison`. **Kind:** theorem. **Implementation:** unchecked.

Compare the prescribed prime-to-S level data on the generic PEL family with the degeneration lattice/torus data on a cusp chart and extend the allowed finite-etale tame part. At p-power level retain the actual higher-level normalization and its ramified monomial map. An etale level torsor on the open locus need not extend etale over the boundary; do not replace a q↦q^p cusp map by an etale cover.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- For p-level comparison use a fixed normalization model with its actual generic level map; the formal degeneration statement alone does not identify that model with a parahoric moduli problem.

**Construction or proof.**

1. Identify tame torsion through the polarized degeneration datum and the character/period lattices.
2. For p-level maps compare the normalized monomial charts and their ramification, using the imported interior normalization construction.
3. Check the open level maps and representative descent. Record the remaining explicit boundary-normalization comparison as a proof gap.

**Direct prerequisites.**

- `ShimuraCompactifications:C4/polarized-degeneration-data`
- `ShimuraCompactifications:C4/homomorphism-extension`
- `PELModuli:M4/higher-level-normalization`
- `ModularCurvesPartII:R13.1`
- `ModularCurvesPartII:R13.2`
- `ModularCurvesPartII:R13.3`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.2.5; 6.4.1.1(5): Degeneration level and formal boundary descriptions.
- [PILLONI-2020](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), 13.2.1, author-copy p. 85: Routed correspondence uses the precise level subgroup formula.

**Acceptance.**

- The Tate p-isogeny has ramified base map q↦q^p.
- The comparison preserves tame level data and does not assert p-level etaleness.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C4

**namespace.** TauCeti.ShimuraCompactifications

### Quasi-finite flat boundary isogenies

**Node:** `ShimuraCompactifications:C4/extended-isogeny-kernel`. **Declaration:** `TauCeti.ShimuraCompactifications.C4.extended_isogeny_kernel`. **Kind:** theorem. **Implementation:** unchecked.

For the semi-abelian boundary families and the isogenies in Boxer–Pilloni Lemma 4.2.2, extend the isogeny and a chosen inverse up to multiplication. Prove the asserted quasi-finite flat morphism and kernel properties under those exact degeneration hypotheses. The kernel can fail to be finite and its order can jump at the boundary; it is not a finite locally free group of constant rank over the whole base.

**Hypotheses.**

- Use the source's normal boundary base, compatible family and generic p-power isogeny. Extension is supplied by homomorphism-extension; quasi-finiteness/flatness require the further semi-abelian degeneration argument.

**Construction or proof.**

1. Extend the isogeny and its inverse up to [m] by uniqueness.
2. Use the induced toric/abelian/lattice maps to show zero-dimensional fibres and flatness in the stated family; isolate the group-flatness argument as a supplier proof obligation.
3. Compute the Tate example: G_q^p→G_q induced by identity on the multiplicative coordinate has generic kernel of order p and trivial special kernel. This disproves a global finite-flat strengthening.

**Direct prerequisites.**

- `ShimuraCompactifications:C4/homomorphism-extension`
- `ShimuraCompactifications:C4/polarized-degeneration-data`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:SF.1`

**Source match.**

- [BP-2026](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), 4.1.1 and Lemma 4.2.2, printed pp. 41 and 43: Semi-abelian isogeny chain and unique extension; the further quasi-finite/flat boundary argument is a recorded proof obligation, not an assertion proved by Lemma 4.2.2 alone.

**Acceptance.**

- The asserted kernel is quasi-finite flat in the source setting.
- The rank-jumping Tate specialization rules out a blanket finite-flat kernel claim.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C4

**namespace.** TauCeti.ShimuraCompactifications

### Comparison with Tate curves and n-gons

**Node:** `ShimuraCompactifications:C4/tate-degeneration-comparison`. **Declaration:** `TauCeti.ShimuraCompactifications.C4.tate_degeneration_comparison`. **Kind:** theorem. **Implementation:** unchecked.

Restrict the relative polarized construction to toric rank one and identify it with the Tate curve/generalized elliptic degeneration and n-gon objects imported from R13.1–R13.3. Compare periods, polarization, invariant relative differential du/u, torsion and the actual base-parameter maps under the two standard p-isogenies. Keep the generic torsion exact sequence and special-fibre rank loss visible.

**Hypotheses.**

- Use the dimension-one generalized elliptic curve and Tate n-gon suppliers; those objects are not constructed again here.
- For a Tate parameter q with positive valuation, distinguish u↦u^p and identity-on-u quotient maps and their corresponding period/base changes.

**Construction or proof.**

1. Identify the rank-one period datum with the imported q-uniformization.
2. Compare invariant differentials by the homomorphism on u and compute the lattice/torus contributions to torsion.
3. Compare the compactified fibre to the prescribed n-gon after its level/base change, retaining ramification in q.

**Direct prerequisites.**

- `ShimuraCompactifications:C4/polarized-degeneration-data`
- `ShimuraCompactifications:C4/degeneration-effectivity`
- `ModularCurvesPartII:R13.1`
- `ModularCurvesPartII:R13.2`
- `ModularCurvesPartII:R13.3`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 4.4 and 4.5, rank-one specialization: Relative degeneration construction; exact dimension-one model is imported.

**Acceptance.**

- For u↦u^p, pullback of du/u is p du/u.
- Identity on u from period q^p to period q has generic kernel of order p and trivial special kernel.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C4

**namespace.** TauCeti.ShimuraCompactifications

### Tate logarithmic Kodaira–Spencer comparison

**Node:** `ShimuraCompactifications:C4/tate-log-kodaira-spencer`. **Declaration:** `TauCeti.ShimuraCompactifications.C4.tate_log_kodaira_spencer`. **Kind:** theorem. **Implementation:** unchecked.

For the imported Tate family, its polarization and invariant Hodge line E, compute the Kodaira–Spencer comparison E^tensor2→Omega^1_base(log boundary) with the source's normalization: (du/u)^tensor2 maps to dq/q up to the explicitly fixed sign/unit convention. Under q↦q^p the base logarithmic differential pulls back to p dq/q. This is a Kodaira–Spencer isomorphism between the stated bundles, not an equality between the relative fibre differential sheaf and the base differential sheaf.

**Hypotheses.**

- Use the normalized polarization and Tate parameter of R13.1–R13.3 and the logarithmic Kodaira–Spencer supplier; retain characteristic and level conditions where p is not invertible.

**Construction or proof.**

1. Import the dimension-one logarithmic Kodaira–Spencer construction and fix its sign using the chosen polarization and period.
2. Compute the period derivative and the two isogeny pullbacks separately on the fibre and base coordinates.
3. Compare the higher-dimensional log-Kodaira–Spencer chart formula with this rank-one restriction.

**Direct prerequisites.**

- `ShimuraCompactifications:C4/tate-degeneration-comparison`
- `AutomorphicBundles:B4`
- `SchemeAndStackFoundations:SF.0`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.4.1.1(4), printed pp. 519–520: Logarithmic Kodaira–Spencer supplies the higher-dimensional comparison.

**Acceptance.**

- du/u belongs to invariant relative differentials; dq/q belongs to base logarithmic differentials.
- The ramification factor p appears in pullback of dq/q.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C4

**namespace.** TauCeti.ShimuraCompactifications

### Tate modules of semi-abelian extensions

**Node:** `ShimuraCompactifications:C4/semiabelian-tate-module`. **Declaration:** `TauCeti.ShimuraCompactifications.C4.semiabelian_tate_module`. **Kind:** construction. **Implementation:** unchecked.

For a semi-abelian variety J over a characteristic-zero field k in an exact sequence 0→T→J→A→0, form the full profinite Tate module TJ=inverse-limit_n J[n](kbar), indexed by positive integers under divisibility with transition [n/m] from n-torsion to m-torsion. Import the general compact coefficient carrier and prove the continuous G_k-equivariant exact sequence 0→TT→TJ→TA→0. Primewise restriction gives the same exact sequence of Z_l-modules; for split T=G_m^r, TT=Zhat(1)^r. The generalized Jacobian and its anabelian application remain consumer constructions.

**Hypotheses.**

- Characteristic zero, a chosen algebraic closure and the actual torus extension J. Each torsion group is taken on geometric points with its finite discrete topology; compact inverse-limit exactness is imported from R02.1.
- The transition maps are multiplication n/m, not inclusions of torsion sets. No extension of this all-prime characteristic-zero statement to a rank-jumping family is asserted.

**Construction or proof.**

1. Use surjectivity/divisibility of T(kbar) and the finite torsion sequence for the torus extension to obtain 0→T[n]→J[n]→A[n]→0.
2. Apply the supplied compact inverse-limit exactness theorem to the finite surjective torsion systems, retaining Galois action and topology.
3. Use the Chinese-remainder decomposition of n-torsion to identify the full inverse limit with the product of its prime-power factors. Prime powers are not cofinal in the full divisibility index. Identify split-torus torsion with roots of unity; the generalized Jacobian imports this sequence.

**Planning API.**

- `SemiAbelianTateModule.exact` (structure): The maps induced by T→J→A give the continuous exact full Tate sequence.
- `SemiAbelianTateModule.primewise` (compatibility): The l-primary factor is the usual inverse limit of J[l^n], compatible with the exact sequence.
- `SemiAbelianTateModule.map` (functoriality): Homomorphisms of torus extensions induce continuous equivariant maps, preserving identity and composition.
- `SemiAbelianTateModule.splitTorus` (characterisation): For G_m^r the module is Zhat(1)^r with the cyclotomic Galois action.
- `SemiAbelianTateModule.torsionProjection` (projection): The full module maps continuously to each J[n] in the divisibility-indexed system; for n|m the transition is multiplication by m/n, and these maps agree with the imported primewise comparison.

**Unit tests.**

- `SemiAbelianTateModule.Gm_test` (computation): For J=G_m, the full Tate module is Zhat(1), not the trivial-action Zhat.
- `SemiAbelianTateModule.abelian_test` (degenerate): For T=0 the construction is the supplied abelian full Tate module TA.
- `SemiAbelianTateModule.product_test` (compatibility): For J=T×A the exact sequence splits as TT×TA with the supplied actions.
- `SemiAbelianTateModule.transitions_test` (non-example): An inclusion J[m]→J[n] when m divides n has the wrong direction and does not define this inverse system.

**Consumers.**

- `JacobianChallengePartIIGeneralizedAlbanese, PAPER-BRESCIANI-24/57`: Imports the general Tate extension for its curve-specific semi-abelian Jacobian.
- `ArithmeticGaloisDuality:R02.1`: Uses the continuous extension in the subsequent compact-coefficient cohomology sequence.

**Direct prerequisites.**

- `ShimuraCompactifications:C4/semi-abelian-scheme`
- `ShimuraCompactifications:C4/poincare-extension-classification`
- `AbelianSchemesAndArithmeticModuli:A3`
- `AbelianSchemesAndArithmeticModuli:A4`
- `ArithmeticGaloisDuality:R02.1`

**Source match.**

- [BRESCIANI-2024](https://link.springer.com/content/pdf/10.1007/s00222-023-01220-6.pdf), Lemma 8 proof, published p. 138: Full Tate extension used by the generalized Jacobian consumer.

**Acceptance.**

- The full sequence is continuous, exact and Galois-equivariant.
- The transition direction and split-torus Tate twist are explicit.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C4

**namespace.** TauCeti.ShimuraCompactifications

## C5. Integral PEL models, boundary geometry and minimal contractions

At the good primes specified by the PEL datum, algebraic approximation of each formal degeneration constructs the good algebraic charts. Their natural completed-base embedding and family-induced embedding are distinct. The actual finite-type étale relation descends the family and the labels to a toroidal algebraic space. Formal completions are identified after removing the closures of the other strata. Properness uses valuation extension of the degeneration data; projectivity and the minimal compactification are not premises of this early construction.

The five retained neat-boundary assertions use ordinary integral coordinate charts, scheme-theoretic boundary intersections and the additional branch-separation condition. A stratum component is an exact open in a connected component of a boundary intersection. Its closure is smooth and proper, and its open is dense in every geometric fibre. The SF.2 Stein/component detector then supplies the B5 geometric-component hypothesis. Non-neat descent has its own branch and lifted-component obligations.

The identity-section invariant differentials extend the Hodge bundle. The logarithmic Kodaira–Spencer map is Sym²(E) only in the Siegel setting; general PEL data require the actual relations. A positive Hodge power is semiample on the toroidal model and ample on the minimal model. Graded finite generation and constant terms identify the minimal compactification. These are downstream of early toroidal properness and B5.

Higher p-level models are normalizations in the stated generic finite cover. Their finite charts, coefficient extensions and Koecher theorem do not identify them with an independently defined parahoric moduli space. Lan 2017 Definition 8.5 specifies formally canonical quasicoherent coefficients and their finite filtration; Theorem 8.7 retains its simple-algebra and dimension-one boundary exception. Ordinary and formal Hartogs statements require the actual special-fibre normality/S2 and codimension verification.

For genus-two Hilbert–Siegel varieties, the minimal boundary has codimension 2d in an interior of dimension 3d; the toroidal boundary is divisorial. The prime-Q generator cover uses Q invertible and the extended finite flat cyclic level group. Its generic inclusion into the abelian family is not asserted to extend into the semi-abelian identity component. Genus-two canonical duality uses the smooth Siegel bundle identity. Good-boundary geometry is exported to the étale cohomology owner, which supplies the nearby-cycle/open comparison and duality needed for unramifiedness.

The separate C5/projective-normalized-blowup node uses Lan 2017’s general ramified minimal/interior supplier M4 and projective fan model. A same-fan higher-level normalization can be finite; a further compatible subdivision is generally only proper. Neither construction supplies the full all-prime Hilbert moduli comparison automatically.

**Remaining construction contracts.**

- Good-model approximation, non-neat branch/component descent, theta/B5 minimal identification, normalized integral coefficient/positivity proofs, ordinary/formal Hartogs and etale cohomology owner inputs.
- Geometric declaration/API/test signatures listed in the suggested-file omission ledger need actual supplier carriers. No stage is closed or implemented.
- Distinguish same-fan good-prime finite normalization from Lan's projective normalized blow-up; supply the ramified lattice-collection interior/minimal models and the explicit formal toroidal-to-minimal structure-sheaf comparison.

### Good algebraic models of formal cusp charts

**Node:** `ShimuraCompactifications:C5/good-algebraic-model`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.good_algebraic_model`. **Kind:** construction. **Implementation:** unchecked.

For each chosen complete cone/cusp degeneration chart, construct Lan's ordinary good algebraic model with its extended PEL semi-abelian family and the prescribed formal identification. Retain both ring embeddings i_nat,i_alg:R_alg→R^hat, where R^hat is the completion of the strict local toric-chart ring at the selected geometric point along its stratum ideal; they need not agree. The model must be a strata-preserving etale finite-type neighbourhood of the toric chart with the specified dense interior, rather than a formal model declared to be algebraic.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- Use Lan 6.3.2.5 including its normal base, comparison of natural and algebraic embeddings, and the approximation hypotheses corrected by the author's errata.
- The cone is nondegenerate and smooth, as in Definition 6.3.2.5. Retain conditions (3a),(3b) for the PEL/degeneration comparisons under the two R_alg embeddings and (3c) for the logarithmic Kodaira–Spencer isomorphism; these embeddings are not merely maps of a common fraction field.

**Construction or proof.**

1. Apply the relative effectivity/approximation construction to the universal formal family and all its PEL structures.
2. Apply Lan 6.3.2.6–6.3.2.9 to the selected good model, retaining i_nat and i_alg as distinct ring maps R_alg→R^hat and the comparisons of families/degeneration data and logarithmic differentials required in 6.3.2.5.
3. Take the permitted finite collection of good algebraic models covering the formal boundary labels. The approximation lemmas 6.3.1–6.3.2.4 not read in full remain a named gap.

**Planning API.**

- `GoodCuspModel.formalComparison` (equivalence): Completion at the specified boundary ideal identifies with the given universal formal chart, preserving PEL data.
- `GoodCuspModel.openPEL` (compatibility): The dense open maps etale to the M2 PEL space with its actual universal family.
- `GoodCuspModel.embeddings` (projection): Returns the two actual maps R_alg→R^hat separately, together with conditions (3a),(3b) for the PEL/degeneration structures and (3c) for logarithmic Kodaira–Spencer.

**Unit tests.**

- `GoodCuspModel.rankZero_test` (degenerate): A zero-rank chart recovers an etale chart of the open M2 space.
- `GoodCuspModel.tate_test` (computation): The rank-one completion has the actual q-adic Tate degeneration.
- `GoodCuspModel.twoEmbeddings_test` (non-example): Forcing i_nat=i_alg as part of the definition rejects the source's permitted approximation models.

**Consumers.**

- `ShimuraCompactifications:C5/etale-chart-relation`: Supplies ordinary charts with universal families.
- `ShimuraCompactifications:C5/integral-toroidal-space`: Supplies the finite-type atlas.

**Direct prerequisites.**

- `ShimuraCompactifications:C4/formal-universal-degeneration`
- `ShimuraCompactifications:C4/endomorphism-extension`
- `ShimuraCompactifications:C4/boundary-level-comparison`
- `PELModuli:M2/representability`
- `PELModuli:M2/universal-family`
- `SchemeAndStackFoundations:SF.1`
- `SchemeAndStackFoundations:SF.3`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.3.2.5–6.3.2.9, printed pp. 503–505: Good algebraic-model definition and existence with two embeddings.
- [LAN-ERRATA](https://www.kwlan.org/articles/cpt-PEL-type-book-pup-err.pdf), Items 60–77, especially approximation and etaleness corrections: Retain the corrected approximation and descent hypotheses.

**Acceptance.**

- Formal identification preserves the family and level data.
- The natural and algebraic ring embeddings R_alg→R^hat and their three comparison conditions are recorded separately.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C5

**namespace.** TauCeti.ShimuraCompactifications

### Etale relation on integral degeneration charts

**Node:** `ShimuraCompactifications:C5/etale-chart-relation`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.etale_chart_relation`. **Kind:** theorem. **Implementation:** unchecked.

Let U_H be the finite disjoint union of the chosen smooth good algebraic models and the open PEL atlas, and let U_H[0] be its interior. Form R_H[0]=U_H[0]×_(M_H)U_H[0], representing interior PEL-family identifications. Define R_H as the relative normalization of U_H×_B U_H in R_H[0], as in Lan 6.3.3.7. Extend the tautological interior family isomorphism to R_H; prove both projections R_H→U_H etale and verify the diagonal, symmetry and composition of Corollary 6.3.3.14. This construction uses normalization of the interior relation, not the entire unrestricted isomorphism functor of all boundary families.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- Use Lan's selected charts and equivalence-class labels; charts with unrelated function-field embeddings cannot simply be identified pointwise.
- Use the smooth compatible cone collection of Definition 6.3.3.4 and the selected etale models of Definition 6.3.2.5. The normalizations and overlap laws use the exact source embeddings and component labels.

**Construction or proof.**

1. Construct the interior fibre-product relation and its normalization over U_H×_B U_H using the generic normalization interface; extend its tautological semi-abelian PEL isomorphism by homomorphism-extension and uniqueness.
2. Use the good-model etale recognition and Lan 6.3.3.13 for both projections.
3. Use the completed-local-chart comparison to prove the normal relation is etale (6.3.3.13), then extend the interior diagonal, inverse and composition as in Corollary 6.3.3.14 and apply the SF.1 effective quotient interface.

**Direct prerequisites.**

- `ShimuraCompactifications:C5/good-algebraic-model`
- `ShimuraCompactifications:C1/cusp-label`
- `ShimuraCompactifications:C4/homomorphism-extension`
- `SchemeAndStackFoundations:SF.1`
- `SchemeAndStackFoundations:SF.3`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.3.3.7–6.3.3.14, printed pp. 514–518: Normalization of the interior relation, extended tautological isomorphism, etale projections and relation laws.

**Acceptance.**

- Both projections are etale.
- The cocycle is an ordinary algebraic-space relation, not a stipulated formal quotient.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C5

**namespace.** TauCeti.ShimuraCompactifications

### Integral PEL toroidal algebraic spaces

**Node:** `ShimuraCompactifications:C5/integral-toroidal-space`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.integral_toroidal_space`. **Kind:** construction. **Implementation:** unchecked.

**Planet:** Integral PEL toroidal compactification.

For the smooth compatible collection Sigma of Lan Definition 6.3.3.4, form M_H,Sigma^tor=[U_H/R_H] over the stated good base B with its descended semi-abelian PEL family and cusp/cone stratification. The quotient is a finite-type separated smooth algebraic stack; it is an algebraic space at neat level. Complete fans give properness through valuative-properness. Projective choices give a scheme through ample descent. Keep finite stabilizer quotients at non-neat level before taking any coarse space; this theorem does not assert smoothness of that coarse space. The ordinary construction here does not cover arbitrary nonsmooth fans; the normalized projective construction is separate.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- Sigma is the complete compatible collection of SMOOTH admissible cone decompositions in Definition 6.3.3.4, satisfying Condition 6.2.5.25 and the surjection compatibility in Condition 6.3.3.2. Retain Lan's standing PEL conditions, including Condition 1.4.3.10 and Convention 6.2.1.1. The neat no-self-intersection assertion uses the source's actual compatibility condition, rather than neatness alone on an arbitrary fan.

**Construction or proof.**

1. Take the effective etale quotient of etale-chart-relation and descend the family and all its rigidified PEL structures.
2. Identify the open locus with M2 and descend the cusp/cone strata.
3. Prove finite type, separatedness and smoothness on the actual charts; combine formal-completion and valuative-properness for the complete compactification. For non-neat level apply the actual finite quotient-stack construction.

**Planning API.**

- `IntegralToroidalModel.openImmersion` (projection): The interior is an open immersion of the actual good-prime PEL moduli space.
- `IntegralToroidalModel.universalSemiAbelian` (projection): Returns the descended universal semi-abelian family with polarization and O-action.
- `IntegralToroidalModel.chart` (characterisation): The chosen good algebraic models are its etale boundary atlas with the prescribed family identifications.
- `IntegralToroidalModel.genericComparison` (compatibility): Characteristic-zero base change agrees with the C2 canonical toroidal model for the same PEL datum and fan.
- `IntegralToroidalModel.descend_hom` (universal-property): For the neat effective etale quotient, maps to an algebraic space correspond to maps from U_H compatible with its ACTUAL normalized relation R_H and its two projections. Retain quotient-stack descent at non-neat level.

**Unit tests.**

- `IntegralToroidalModel.interior_test` (compatibility): Restricting the atlas and family to the interior returns the M2 moduli object.
- `IntegralToroidalModel.modular_test` (computation): At a dimension-one cusp the completion carries the imported Tate generalized elliptic degeneration.
- `IntegralToroidalModel.badPrime_test` (non-example): Removing a prime dividing the level from the good-prime restriction does not produce a smooth model by this construction.

**Consumers.**

- `ShimuraCompactifications:C5/integral-minimal-space`: Supplies the proper toroidal source and Hodge line.
- `PerfectoidShimuraVarieties:S1`: Imports the higher-level normalization charts after their separate comparison.
- `ArakelovGeometryAndAbelianHeights:R35.5`: Uses the good-base moduli realization and Hodge line.

**Direct prerequisites.**

- `ShimuraCompactifications:C5/etale-chart-relation`
- `ShimuraCompactifications:C0/relative-regular-coordinates`
- `ShimuraCompactifications:C4/endomorphism-extension`
- `PELModuli:M2/representability`
- `SchemeAndStackFoundations:SF.1`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), Definition 6.3.3.4; 6.3.3.15–6.3.3.16; Theorem 6.4.1.1, printed pp. 512–513 and 518–520: Ordinary smooth compatible fan quotient, neat algebraic-space case, and the universal structures.

**Acceptance.**

- The open subspace is the actual M2 algebraic space.
- The family restricts to its universal abelian family and becomes semi-abelian at the boundary.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C5

**namespace.** TauCeti.ShimuraCompactifications

### Formal completion along integral boundary strata

**Node:** `ShimuraCompactifications:C5/formal-completion`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.formal_completion`. **Kind:** theorem. **Implementation:** unchecked.

For each cusp/cone equivalence class, identify the completion of its appropriate open stratum neighbourhood in M_H,Sigma^tor with the specified universal formal torus-embedding chart modulo its actual stabilizer. Remove closures of the other strata as in Lan 6.4.1.1(5) before completing. Preserve the family, Hodge bundles, O-action and level data. Do not infer a map between completions along different centers from an unrelated chart inclusion.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- Use the same smooth compatible Sigma as integral-toroidal-space, and the exact stratum neighbourhood with its ordinary scheme-theoretic ideal. At non-neat level retain the source stack and stabilizer quotient; singular higher-level normalizations require their separate formal comparison.

**Construction or proof.**

1. Apply the good-model formal identification on each atlas chart.
2. Restrict to the source's stratum neighbourhood and descend along the etale relation.
3. Identify the stabilizer quotient and structures; use these local comparisons to establish compatible completion maps only for the stated centers.

**Direct prerequisites.**

- `ShimuraCompactifications:C5/integral-toroidal-space`
- `ShimuraCompactifications:C5/good-algebraic-model`
- `ShimuraCompactifications:C4/formal-universal-degeneration`
- `SchemeAndStackFoundations:SF.1`
- `SchemeAndStackFoundations:SF.3`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.4.1.1(5) and proof, printed pp. 519–523: Exact completion neighbourhood and structural comparison.

**Acceptance.**

- The center and excluded stratum closures are named.
- The identification preserves ordinary nilpotent thickenings.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C5

**namespace.** TauCeti.ShimuraCompactifications

### Properness of integral toroidal compactifications

**Node:** `ShimuraCompactifications:C5/valuative-properness`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.valuative_properness`. **Kind:** theorem. **Implementation:** unchecked.

For the complete smooth compatible cusp system of the ordinary construction and good-prime PEL data, M_H,Sigma^tor is proper over B. Prove separatedness and the valuative extension/uniqueness for the actual finite-type algebraic space. After the allowed finite DVR base extension, semistable reduction and the degeneration period pairing determine a cone chart; completeness supplies the extension and the separated relation plus the source's valuative descent argument supply uniqueness/descent.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- Sigma is the complete smooth compatible collection used in integral-toroidal-space; use the precise admissible valuation criterion and the semistable-reduction theorem of R11.3. The non-neat conclusion is properness of the source stack; the neat conclusion is properness of its algebraic space.

**Construction or proof.**

1. Extend a generic PEL family after the permitted DVR extension using semistable reduction, retaining its polarization and O-action.
2. Locate its positive valuation datum in a cone of Sigma and use the formal/good algebraic chart to extend the moduli point.
3. Use separatedness and the etale relation together with the source's valuative/fpqc descent argument, rather than deriving descent from equality of labels alone. Proposition 6.3.3.17 (printed p. 518) proves properness. Theorem 6.4.1.1(6) is the more precise all-traits cone extension criterion, not the properness statement by itself; the semistable-reduction and descent leaves remain requests.

**Direct prerequisites.**

- `ShimuraCompactifications:C5/integral-toroidal-space`
- `ShimuraCompactifications:C5/formal-completion`
- `ShimuraCompactifications:C0/arithmetic-admissible-fan`
- `ShimuraCompactifications:C4/degeneration-effectivity`
- `NeronModelsAndSemistableAbelianVarieties:R11.3`
- `SchemeAndStackFoundations:SF.1`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), Proposition 6.3.3.17 and the opening assertion of Theorem 6.4.1.1, printed pp. 518–519; (6), printed pp. 520–521: Properness theorem, with the distinct all-traits cone extension criterion.

**Acceptance.**

- Every allowed DVR test has existence and uniqueness.
- An incomplete fan is excluded.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C5

**namespace.** TauCeti.ShimuraCompactifications

### Smooth relative boundary intersections

**Node:** `ShimuraCompactifications:C5/neat-boundary-intersection-smooth`. **Declaration:** `ShimuraCompactification.neat_boundary_intersection_smooth`. **Kind:** lemma. **Implementation:** unchecked.

Every D_J is smooth over B. Empty intersections are allowed; no claim is made that a nonempty intersection is connected.

**Hypotheses.**

- Work on the actual good-prime PEL toroidal algebraic space X=M_H,Sigma^tor of Lan 6.3.3.15, over the indicated regular Noetherian arithmetic base B=Spec R. H is neat; Sigma satisfies 6.3.3.4, including 6.2.5.25. Retain 1.4.3.10 and the good-prime/level hypotheses of 1.4.1.2 and M2. The source construction and its ordinary etale chart/stratification theorem are required inputs, not implemented objects or arbitrary smooth resolutions.
- D_i are the finitely many irreducible components of the reduced boundary. For a subset J of their index set, D_J is their scheme-theoretic intersection (D_empty=X), and D_J^o=D_J minus the union of D_i with i outside J. These are subspaces of the actual X, not new boundary carriers.

**Construction or proof.**

1. Use the actual ordinary etale presentation from 6.3.2.5-6.3.3.16. At neat level the cone stabilizers act trivially as in 6.2.5.27. Do not replace this presentation by formal completions alone.
2. Apply the new relative-regular-coordinates and relative-boundary-coordinates nodes on the ordinary chart. Their integral monoid-algebra calculation is over the smooth abelian-torsor base and retains the actual torsor multiplication. The source model still needs its ordinary chart identification.
3. The source fan condition and neat no-self-intersection clause identify distinct global branches through a point with distinct coordinate hyperplanes. Scheme-theoretic intersection quotients by the corresponding coordinate variables, leaving another smooth polynomial/Laurent chart.
4. Smoothness composes with the smooth cusp base and descends through the actual etale cover by SF.0/SF.1. Work with algebraic spaces throughout; minimal compactification and projectivity are not premises.

**Direct prerequisites.**

- `ShimuraCompactifications:C0/relative-regular-coordinates`
- `ShimuraCompactifications:C0/relative-boundary-coordinates`
- `PELModuli:M2`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:SF.1`
- `ShimuraCompactifications:C5/integral-toroidal-space`
- `ShimuraCompactifications:C5/formal-completion`
- `ShimuraCompactifications:C5/valuative-properness`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.3.2.5(2), 6.3.3.14-6.3.3.16; 6.4.1.1(3), pp. 503, 517-520: Uses the ordinary relative charts and the specific neat fan hypotheses; the proof of the intersection conclusion is expanded here.
- [STACKS-NC](https://stacks.math.columbia.edu/tag/0CBN), 41.21.2: Only the absolute intersection criterion is compared; relative smoothness comes from the arithmetic-base charts.

**Acceptance.**

- For a two-ray affine chart the three cases J=empty, one ray, both rays yield affine plane, affine line and the base.
- Disconnected intersections remain smooth and are not renamed a single stratum.
- An irreducible nodal boundary divisor cannot be treated as one smooth global branch: the no-self-intersection premise is essential. This is a generic warning, not a PEL counterexample.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Compactification/BoundaryStrata

**namespace.** ShimuraCompactification

### Density of exact boundary opens in every geometric fiber

**Node:** `ShimuraCompactifications:C5/neat-boundary-open-fiberwise-dense`. **Declaration:** `ShimuraCompactification.neat_boundary_open_fiberwise_dense`. **Kind:** lemma. **Implementation:** unchecked.

For every geometric point b of B and every J, the open (D_J^o)_b is dense in (D_J)_b. In particular, it meets each nonempty geometric-fiber component of each open-and-closed subspace of D_J.

**Hypotheses.**

- Work on the actual good-prime PEL toroidal algebraic space X=M_H,Sigma^tor of Lan 6.3.3.15, over the indicated regular Noetherian arithmetic base B=Spec R. H is neat; Sigma satisfies 6.3.3.4, including 6.2.5.25. Retain 1.4.3.10 and the good-prime/level hypotheses of 1.4.1.2 and M2. The source construction and its ordinary etale chart/stratification theorem are required inputs, not implemented objects or arbitrary smooth resolutions.
- D_i are the finitely many irreducible components of the reduced boundary. For a subset J of their index set, D_J is their scheme-theoretic intersection (D_empty=X), and D_J^o=D_J minus the union of D_i with i outside J. These are subspaces of the actual X, not new boundary carriers.

**Construction or proof.**

1. Base-change the ordinary etale chart and the scheme-theoretic boundary intersections. Smoothness and the coordinate descriptions survive this base change.
2. Apply relative-boundary-coordinates: the exact open in the coordinate quotient inverts the remaining boundary monomial. Multiplication by that monomial is injective on its exponent basis over every base ring. Thus the local open is schematically dense after every base change; in particular it is topologically dense on the geometric fiber. This strengthens the preceding reduced-base coordinate argument without changing the target.
3. For clarity, use the generic open-map proof rather than counting rational points: the inverse image of a dense open under an open map is dense, because any nonempty open has nonempty open image. Etale maps are open.
4. Apply this to the etale chart maps and descend density using their jointly surjective cover. Restriction to an open-and-closed component preserves it. Density after extension to an algebraic closure also implies density in an ordinary residue fiber.

**Direct prerequisites.**

- `ShimuraCompactifications:C5/neat-boundary-intersection-smooth`
- `ShimuraCompactifications:C0/relative-boundary-coordinates`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:SF.1`
- `ShimuraCompactifications:C5/integral-toroidal-space`
- `ShimuraCompactifications:C5/formal-completion`
- `ShimuraCompactifications:C5/valuative-properness`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.3.2.5 and 6.4.1.1(2)-(3): A deduction from the relative coordinate-orbit description, with the base change and density steps made explicit; not inferred from total open density alone.

**Acceptance.**

- In A1 over a field, G_m is dense even when that field has finitely many rational points; no rational-point cardinality proof is admissible.
- If J contains every boundary coordinate, the remaining product is 1 and the exact open equals the entire coordinate intersection.
- Over a DVR, deleting the closed fiber from a boundary section gives a total-space dense open that is NOT fiberwise dense. The arbitrary dense-open statement is false.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Compactification/BoundaryStrata

**namespace.** ShimuraCompactification

### A labelled stratum component is an exact boundary open

**Node:** `ShimuraCompactifications:C5/neat-stratum-closure-component`. **Declaration:** `ShimuraCompactification.neat_stratum_closure_component`. **Kind:** theorem. **Implementation:** unchecked.

For every nonempty irreducible component Z of a labelled stratum, let J consist of the global boundary components containing Z. There is a unique connected component W of D_J with Z = W intersect D_J^o. Consequently the reduced closure of Z in X is W.

**Hypotheses.**

- Work on the actual good-prime PEL toroidal algebraic space X=M_H,Sigma^tor of Lan 6.3.3.15, over the indicated regular Noetherian arithmetic base B=Spec R. H is neat; Sigma satisfies 6.3.3.4, including 6.2.5.25. Retain 1.4.3.10 and the good-prime/level hypotheses of 1.4.1.2 and M2. The source construction and its ordinary etale chart/stratification theorem are required inputs, not implemented objects or arbitrary smooth resolutions.
- D_i are the finitely many irreducible components of the reduced boundary. For a subset J of their index set, D_J is their scheme-theoretic intersection (D_empty=X), and D_J^o=D_J minus the union of D_i with i outside J. These are subspaces of the actual X, not new boundary carriers.

**Construction or proof.**

1. The source closure/incidence theorem makes each boundary component a union of stratum components. Thus Z lies wholly inside or wholly outside each D_i, so it lies in the indicated exact-pattern open D_J^o.
2. On the ordinary relative toric chart, an exact coordinate pattern is a face-orbit stratum, now described by relative-face-open, relative-stratum-quotient and relative-boundary-coordinates. Good algebraic models preserve these labels (6.3.2.5 and 6.3.2.16), and the two projections of the quotient groupoid preserve their equivalence classes (6.3.3.16). Thus, on D_J^o, every labelled stratum is open: around each point it is the image of the appropriate exact-pattern etale chart.
3. All label subsets in D_J^o are open, so their complements are open as well. A stratum is smooth over the regular base; its irreducible components are open and closed. Hence the partition of D_J^o into stratum components is a partition by open-and-closed subsets. No assertion about arbitrary refinements of a stratification is used.
4. By neat-boundary-intersection-smooth, D_J is regular and Noetherian. Its connected components are irreducible and open and closed. By neat-boundary-open-fiberwise-dense, each nonempty component W has a nonempty dense open W intersect D_J^o, which is irreducible.
5. An irreducible space admits no partition into two nonempty open-and-closed subsets. Therefore W intersect D_J^o is exactly the stratum component it meets. Conversely the connected Z lies in one W. Its closure is W, which is already reduced. This proves existence and uniqueness without assuming that all of D_J is one stratum closure.

**Direct prerequisites.**

- `ShimuraCompactifications:C5/neat-boundary-intersection-smooth`
- `ShimuraCompactifications:C5/neat-boundary-open-fiberwise-dense`
- `ShimuraCompactifications:C0/relative-face-open`
- `ShimuraCompactifications:C0/relative-stratum-quotient`
- `ShimuraCompactifications:C0/relative-boundary-coordinates`
- `SchemeAndStackFoundations:SF.1`
- `ShimuraCompactifications:C5/integral-toroidal-space`
- `ShimuraCompactifications:C5/formal-completion`
- `ShimuraCompactifications:C5/valuative-properness`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.3.2.16; 6.3.3.16; 6.4.1.1(2)-(3): Refines the source open-dense intersection assertion using its ordinary stratum-preserving charts. The exact-pattern and connected-component argument is this blueprint deduction; it needs the stated no-self-intersection and label-descent inputs.

**Acceptance.**

- A smooth quadrant has one exact zero/nonzero pattern for each subset of its two rays, with the usual face-incidence order.
- Over a base where 2 is invertible, on P1_z times P1_w the divisors w=1 and w=z^2 meet in two disjoint sections z=1 and z=-1. One must choose a connected component of their intersection, not identify the whole intersection with one stratum closure.
- For J empty, this includes a connected component of the open moduli stratum and its closure in the corresponding component of X. It does not manufacture a boundary cusp when the boundary is empty.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Compactification/BoundaryStrata

**namespace.** ShimuraCompactification

### Properness of the neat stratum closure

**Node:** `ShimuraCompactifications:C5/neat-stratum-closure-proper`. **Declaration:** `ShimuraCompactification.neat_stratum_closure_proper`. **Kind:** lemma. **Implementation:** unchecked.

The reduced closure W of each nonempty stratum component Z is proper over B. Together with the preceding nodes it is smooth over B, and Z_b is dense in W_b for every geometric point b.

**Hypotheses.**

- Work on the actual good-prime PEL toroidal algebraic space X=M_H,Sigma^tor of Lan 6.3.3.15, over the indicated regular Noetherian arithmetic base B=Spec R. H is neat; Sigma satisfies 6.3.3.4, including 6.2.5.25. Retain 1.4.3.10 and the good-prime/level hypotheses of 1.4.1.2 and M2. The source construction and its ordinary etale chart/stratification theorem are required inputs, not implemented objects or arbitrary smooth resolutions.
- D_i are the finitely many irreducible components of the reduced boundary. For a subset J of their index set, D_J is their scheme-theoretic intersection (D_empty=X), and D_J^o=D_J minus the union of D_i with i outside J. These are subspaces of the actual X, not new boundary carriers.

**Construction or proof.**

1. Identify W with the connected component of D_J supplied by neat-stratum-closure-component. No arbitrary closure smoothness principle is invoked.
2. Since D_J is Noetherian and regular, W is open and closed in D_J; D_J is a closed subspace of X. Thus W to X is a closed immersion.
3. Compose with the actual proper structural morphism X to B from the early toroidal construction. Smoothness follows from the first node, and fiberwise density from the second after restricting to W.
4. Do not use the integral minimal compactification, an ample Hodge power, scheme representability or any projectivity theorem. Those are separate C5 targets.

**Direct prerequisites.**

- `ShimuraCompactifications:C5/neat-boundary-intersection-smooth`
- `ShimuraCompactifications:C5/neat-boundary-open-fiberwise-dense`
- `ShimuraCompactifications:C5/neat-stratum-closure-component`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:SF.1`
- `ShimuraCompactifications:C5/integral-toroidal-space`
- `ShimuraCompactifications:C5/formal-completion`
- `ShimuraCompactifications:C5/valuative-properness`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.3.3.17 and 6.4.1.1, combined with the preceding stratum identification: Imports properness of the actual constructed toroidal model; it does not re-prove the valuative compactification construction in this checkpoint.

**Acceptance.**

- A boundary section in P1_B is proper over B; its open obtained by deleting a special fiber is not a replacement for the proper closure.
- A disconnected boundary intersection gives separate proper closures, not an assertion of their geometric connectedness.
- The proof applies to proper algebraic spaces without first proving that the toroidal model is a scheme.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Compactification/BoundaryStrata

**namespace.** ShimuraCompactification

### Neat strata detect geometric-fiber components

**Node:** `ShimuraCompactifications:C5/neat-strata-detect-geometric-components`. **Declaration:** `ShimuraCompactification.neat_strata_detect_geometric_components`. **Kind:** theorem. **Implementation:** unchecked.

**Planet:** Boundary component detection.

For a finite family of nonempty labelled strata of the actual neat model X, assume their union meets every irreducible component of X. Then for every geometric point b of B, their base changes meet every irreducible component of X_b. This supplies the residue-component hypothesis required by the B5 prime-quotient expansion argument at neat level.

**Hypotheses.**

- Work on the actual good-prime PEL toroidal algebraic space X=M_H,Sigma^tor of Lan 6.3.3.15, over the indicated regular Noetherian arithmetic base B=Spec R. H is neat; Sigma satisfies 6.3.3.4, including 6.2.5.25. Retain 1.4.3.10 and the good-prime/level hypotheses of 1.4.1.2 and M2. The source construction and its ordinary etale chart/stratification theorem are required inputs, not implemented objects or arbitrary smooth resolutions.
- D_i are the finitely many irreducible components of the reduced boundary. For a subset J of their index set, D_J is their scheme-theoretic intersection (D_empty=X), and D_J^o=D_J minus the union of D_i with i outside J. These are subspaces of the actual X, not new boundary carriers.

**Construction or proof.**

1. Split the chosen strata into their finitely many irreducible components, using Noetherianity and smoothness. This does not change their union.
2. Apply the preceding closure and density nodes to obtain smooth proper W_a and opens Z_a dense in every geometric fiber of W_a. This is the specific PEL instance missing from a mere total-space density assertion.
3. Import the generic smooth-closure component detector from SF.2, after its SF.1 algebraic-space and proper coherent cohomology inputs. Its proof uses the arithmetic-base Stein factor X to E to B with E finite etale. Each W_a to E is proper and smooth, so its image is clopen; the total-component hypothesis makes these images cover E.
4. Over a geometric b, the fibers of X over the points of the discrete E_b are the connected regular, hence irreducible components of X_b. The corresponding nonempty W_a fibers are open and closed in W_a,b, so the dense Z_a,b meets them. This describes the exact imported detector, not a second C5 definition or independent copy of Stein theory.
5. Export the conclusion directly to AutomorphicBundles B5. The owner order is early spaces/descent, then SF.2 Stein/detection, then early C5, then B5. Do not insert a B5-to-C5 edge or use the C5 minimal-compactification endpoint.

**Consumers.**

- `AutomorphicBundles:B5/fj-injectivity-cyclic`: Supplies the geometric residue-component premise at neat level. Formal-chart coefficient comparison and coefficient devissage remain B5/F0 obligations.

**Direct prerequisites.**

- `ShimuraCompactifications:C5/neat-boundary-open-fiberwise-dense`
- `ShimuraCompactifications:C5/neat-stratum-closure-component`
- `ShimuraCompactifications:C5/neat-stratum-closure-proper`
- `SchemeAndStackFoundations:SF.2`
- `ShimuraCompactifications:C5/integral-toroidal-space`
- `ShimuraCompactifications:C5/formal-completion`
- `ShimuraCompactifications:C5/valuative-properness`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 7.1.2.14(1), geometric component hypothesis, read with 6.4.1.1: Neat-level geometric input to the source expansion theorem, not a proof of its arbitrary-coefficient or non-neat cases.
- [STACKS-STEIN](https://stacks.math.columbia.edu/tag/0A18), 76.36.1, 76.36.4 and 76.36.9; also tag 0E0D: Supplies Stein factorization; the smooth-closure detector is assigned once to SF.2 and applied here to the actual PEL stratum closures.

**Acceptance.**

- For two disjoint proper smooth curves, selecting strata on only one curve fails the total-component hypothesis.
- For P1_B with either whole standard boundary section, the condition and conclusion both hold on every geometric fiber.
- A connected finite etale Stein cover may have several points in a geometric fiber. The proof must reach every point, not confuse connectedness over B with geometric connectedness.
- No conclusion for arbitrary non-neat level is asserted: a neat cover need not preserve the detecting collection on every lifted component, and a toroidal level map need not be etale at the boundary.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Compactification/BoundaryStrata

**namespace.** ShimuraCompactification

### Non-neat boundary and component descent

**Node:** `ShimuraCompactifications:C5/nonneat-boundary-descent`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.nonneat_boundary_descent`. **Kind:** theorem. **Implementation:** unchecked.

At non-neat good level, construct the toroidal quotient stack and its coarse boundary using the actual finite stabilizer actions. Descend the ordinary stratum ideals and chart incidences, keeping branch normalization and possible self-identifications. Transfer the neat component-detection conclusion only after proving every geometric component is covered by the chosen proper branch/level cover and its stratified descent. Coarse quotient smoothness and global simple normal crossings are not asserted.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- Use a specified neat normal subgroup and compatible cone system, the quotient stack and actual finite stabilizers; keep residue-characteristic restrictions on coarse-space exactness.

**Construction or proof.**

1. Apply finite-level quotient descent to the neat atlas and family, then construct the coarse space with its ordinary boundary ideals.
2. Normalize boundary branches when self-identifications occur and prove the chosen proper cover meets every geometric component.
3. Descend the component detection only under that proved coverage. The branch-coverage and relative stack theorem are an explicit gap; the Stacks scheme normalization lemma is only a lead.

**Direct prerequisites.**

- `ShimuraCompactifications:C5/integral-toroidal-space`
- `ShimuraCompactifications:C5/neat-strata-detect-geometric-components`
- `SchemeAndStackFoundations:SF.1`
- `SchemeAndStackFoundations:SF.2`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.4.1.1 and non-neat finite-level descent: Source neat theorem plus specified quotient-stack extension.
- [STACKS-NC](https://stacks.math.columbia.edu/tag/0CBN), Lemma 41.21.6, tag 0CBN: Scheme branch-normalization lead, not a relative stack theorem.

**Acceptance.**

- No smooth coarse quotient is assumed.
- Component detection requires an actual covering argument.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C5

**namespace.** TauCeti.ShimuraCompactifications

### Logarithmic Kodaira–Spencer on PEL models

**Node:** `ShimuraCompactifications:C5/log-kodaira-spencer`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.log_kodaira_spencer`. **Kind:** theorem. **Implementation:** unchecked.

On a neat smooth good-prime integral toroidal model, construct the logarithmic Kodaira–Spencer comparison with the PEL relation quotient of the tensor of invariant differentials, as in Lan 6.4.1.1(4). In the principally polarized Siegel case it is Sym² E ≅ Omega^1_M/B(log D), where E=e^*Omega^1_G/M is the invariant Hodge bundle of the universal semi-abelian family and D is the reduced toroidal boundary. Require the stated smooth chart and polarization conditions; do not replace a general PEL quotient by Sym² E.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- The level is neat, Sigma smooth, and the required no-self-identification condition is imposed when a global boundary divisor presentation is used.

**Construction or proof.**

1. Define the Hodge bundle via the identity section of the universal semi-abelian family.
2. Compute the period derivative on each universal formal degeneration chart, with ordinary logarithmic differentials dq_i/q_i.
3. Use the PEL relations and etale descent to glue the source's comparison. Check the rank-one Tate normalization against tate-log-kodaira-spencer.

**Direct prerequisites.**

- `ShimuraCompactifications:C5/integral-toroidal-space`
- `ShimuraCompactifications:C5/formal-completion`
- `ShimuraCompactifications:C4/tate-log-kodaira-spencer`
- `AutomorphicBundles:B4`
- `SchemeAndStackFoundations:SF.0`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.4.1.1(4), printed pp. 519–520: PEL logarithmic comparison.

**Acceptance.**

- The Siegel rank-g Hodge bundle gives differential rank g(g+1)/2.
- The rank-one logarithmic base differential is dq/q, distinct from the fibre differential du/u.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C5

**namespace.** TauCeti.ShimuraCompactifications

### Semiampleness of the integral Hodge line

**Node:** `ShimuraCompactifications:C5/hodge-semiampleness`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.hodge_semiampleness`. **Kind:** theorem. **Implementation:** unchecked.

**Planet:** Hodge line semiampleness.

For the good-prime integral toroidal PEL compactification, a positive tensor power of omega=det E is generated by global sections relative to B. This is semiampleness on the toroidal model; omega can have degree zero on boundary contraction fibres and is not assumed ample there. Retain the source's polarized PEL hypotheses and their finite-level descent.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- Use the proper toroidal model and its universal polarized degeneration. For a coarse non-neat model first prove descent of a positive power.

**Construction or proof.**

1. Apply the theta/polarized-family construction quoted in Lan 7.2.1.1 to produce sections separating the required degeneration data.
2. Use properness and the boundary chart comparison to obtain a uniform positive generating power.
3. Retain the Faltings–Chai V.2.1 proof as an unread input request; source assertion alone does not close the theta-generation proof.

**Direct prerequisites.**

- `ShimuraCompactifications:C5/integral-toroidal-space`
- `ShimuraCompactifications:C5/valuative-properness`
- `ShimuraCompactifications:C4/degeneration-effectivity`
- `AutomorphicBundles:B4`
- `AbelianSchemesAndArithmeticModuli:A5`
- `SchemeAndStackFoundations:SF.2`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), Proposition 7.2.1.1 and 7.2.1.2, printed pp. 540–541: Semiampleness and degree-zero/isotriviality criterion.

**Acceptance.**

- A uniform positive power is relatively generated.
- Boundary contraction fibres can have Hodge degree zero.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C5

**namespace.** TauCeti.ShimuraCompactifications

### Finite generation of the Hodge section algebra

**Node:** `ShimuraCompactifications:C5/graded-section-finite-generation`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.graded_section_finite_generation`. **Kind:** theorem. **Implementation:** unchecked.

For the proper toroidal model with semiample omega, prove the nonnegative section algebra S=direct-sum_(k>=0) H^0(M^tor,omega^k) is a finitely generated B-algebra under the Noetherian proper/semiample hypotheses of Lan 7.2.2.6. Apply the foundations Proj and Stein-factor results rather than planning those generic constructions here. Preserve base change and the positivity/constant-term inputs needed for identifying the PEL strata of its Proj.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- Use the relatively generated positive power and the proper algebraic-space coherent finiteness theorem. Generic finite generation alone does not imply an integral finite-type section algebra.

**Construction or proof.**

1. Map by a generated positive power and take the finite Stein factor using SF.2.
2. Use coherent direct image under the ample line on the Stein target to show finite generation of every residue class of graded degrees.
3. Combine the finitely many residue classes into S; apply the exact Noetherian argument of Lan 7.2.2.6. Import B5 only for subsequent boundary/constant-term identification.

**Direct prerequisites.**

- `ShimuraCompactifications:C5/hodge-semiampleness`
- `ShimuraCompactifications:C5/valuative-properness`
- `SchemeAndStackFoundations:SF.2`
- `SchemeAndStackFoundations:SF.3`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), Corollary 7.2.2.6; 7.2.3.1–7.2.3.3, printed pp. 544–546: Noetherian section-algebra argument and its compactification use.

**Acceptance.**

- All nonnegative degrees occur, with a finite Veronese argument.
- The result is over the good arithmetic base, not only over its fraction field.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C5

**namespace.** TauCeti.ShimuraCompactifications

### Integral minimal compactification

**Node:** `ShimuraCompactifications:C5/integral-minimal-space`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.integral_minimal_space`. **Kind:** construction. **Implementation:** unchecked.

**Planet:** Integral minimal compactification.

Construct M_H^min=Proj_B S from the Hodge section algebra, with its proper map pi:M_H,Sigma^tor→M_H^min and its canonical open PEL immersion. Prove projectivity, normality and the stated flatness over the good base, identify the minimal boundary strata through constant terms, and prove independence of Sigma and agreement with the characteristic-zero minimal model. The map contracts the toroidal boundary directions; it is not a toric chart isomorphism. In its Stein-factor construction retain the canonical isomorphism O_(M_H^min)≅pi_*O_(M_H,Sigma^tor); special-fibre and formal transfers require their own base-change comparison.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- Use Lan's PEL compactification hypotheses, the semiample Hodge line and the exact constant-term/positivity inputs from B5. The first construction of the proper toroidal source does not import B5.

**Construction or proof.**

1. Form Proj of the finitely generated section algebra using the supplied foundations construction.
2. Use the Stein factor of the semiample Hodge morphism as in the construction preceding Lemma 7.2.3.1. Keep O_min≅pi_*O_tor as part of that construction; then establish normality, projectivity, open immersion and the prescribed arithmetic flatness.
3. Identify images and fibres of boundary strata through the B5 constant-term decomposition and Lan 7.2.3.5–7.2.3.9; compare different fans through C3 and their section maps.

**Planning API.**

- `IntegralMinimalModel.fromToroidal` (projection): The Hodge morphism has the specified restriction to the interior and boundary contraction.
- `IntegralMinimalModel.fanIndependent` (characterisation): The target and open immersion are canonically independent of the chosen compatible complete fan.
- `IntegralMinimalModel.genericComparison` (compatibility): Fraction-field base change gives the existing minimal Shimura variety for the same PEL datum.
- `IntegralMinimalModel.levelMap` (functoriality): Specified compatible level maps descend through the Hodge section algebra and obey composition.
- `IntegralMinimalModel.structureSheaf` (structure): For the algebraic Stein-factor contraction pi, O_min→pi_*O_tor is a canonical isomorphism. Completion or special-fibre comparison is a separate theorem with its own properness, coefficient and base-change hypotheses.

**Unit tests.**

- `IntegralMinimalModel.interior_test` (compatibility): The composition of the open immersion with the toroidal-to-minimal map is the canonical PEL open immersion.
- `IntegralMinimalModel.modular_test` (computation): In dimension one the cusp contraction agrees with the imported compactified modular curve.
- `IntegralMinimalModel.fan_test` (degenerate): Replacing Sigma by a compatible refinement preserves the minimal target and its open immersion.

**Consumers.**

- `ShimuraCompactifications:C5/open-quasiprojectivity`: Realizes the open arithmetic moduli as an open in a projective scheme.
- `ArakelovGeometryAndAbelianHeights:R35.5`: Supplies the compactified Hodge line and good-base realization.

**Direct prerequisites.**

- `ShimuraCompactifications:C5/graded-section-finite-generation`
- `ShimuraCompactifications:C3/coherent-cohomology-invariance`
- `AutomorphicBundles:B5`
- `SchemeAndStackFoundations:SF.2`
- `SchemeAndStackFoundations:SF.3`
- `ShimuraVarieties:V2/baily-borel`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 7.2.3 construction preceding Lemma 7.2.3.1 and 7.2.3.1–7.2.3.9, printed pp. 544–548: Integral minimal construction, boundary images and independence.

**Acceptance.**

- The map restricts to the prescribed identity on the open PEL moduli.
- Different compatible fans produce the same minimal target.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C5

**namespace.** TauCeti.ShimuraCompactifications

### Ample Hodge line on the minimal model

**Node:** `ShimuraCompactifications:C5/minimal-hodge-ampleness`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.minimal_hodge_ampleness`. **Kind:** theorem. **Implementation:** unchecked.

A specified positive power of the Hodge line descends to an ample invertible sheaf on the neat integral minimal compactification, whose pullback to the toroidal model is that power of omega. On coarse finite-level quotients record the descended Q-line/positive tensor power and stabilizer restrictions. For the Siegel coarse minimal variety this supplies the ample Hodge Q-line used by Yuan; it does not assert ampleness of omega on the toroidal source.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- For a coarse quotient prove descent through an auxiliary sufficiently fine level and use the source's stabilizer/characteristic restrictions.

**Construction or proof.**

1. Use Proj/Stein factor and the semiample generating power to identify the descended ample line.
2. Compare its toroidal pullback and normalize the positive tensor power.
3. Descend through the specified finite-level quotient to the ample Q-line statement; Yuan's cited Faltings–Chai construction is a supplier proof leaf.

**Direct prerequisites.**

- `ShimuraCompactifications:C5/integral-minimal-space`
- `ShimuraCompactifications:C5/hodge-semiampleness`
- `AutomorphicBundles:B4`
- `SchemeAndStackFoundations:SF.1`
- `SchemeAndStackFoundations:SF.3`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 7.2.3 construction preceding Lemma 7.2.3.1 and 7.2.3.1–7.2.3.4, printed pp. 544–546: The finite Stein-factor map to projective space and pullback of its ample O(1); ampleness is a deduction from finiteness.
- [YUAN-2024](https://arxiv.org/pdf/2108.05625v4), 3.4, end; arXiv v4 printed pp. 55–56: Coarse Siegel minimal compactification and ample Hodge Q-line.

**Acceptance.**

- The descended line is ample on the minimal model.
- The toroidal pullback has the required positive power, without toroidal ampleness.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C5

**namespace.** TauCeti.ShimuraCompactifications

### Quasi-projectivity of good-prime PEL moduli

**Node:** `ShimuraCompactifications:C5/open-quasiprojectivity`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.open_quasiprojectivity`. **Kind:** theorem. **Implementation:** unchecked.

**Planet:** Quasi-projectivity of PEL moduli.

Deduce that the neat good-prime PEL moduli algebraic space of M2 is a quasi-projective scheme over B, using its canonical open immersion in the projective minimal compactification. This is Lan revised-book Corollary 7.2.3.10. Export the resulting arithmetic moduli realization and Hodge line to the height/finiteness owners with all good-prime conditions; their bad-prime correction estimates are not supplied by this theorem.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- Use the actual M2 algebraic space and its open immersion; do not assume scheme/quasi-projective representability in M2 to prove C5.

**Construction or proof.**

1. Apply the open immersion into the projective minimal model.
2. Use the scheme/open-subspace criterion to identify the open algebraic space as a scheme and restrict the ample line.
3. State the relative quasi-projectivity endpoint with its exact good-base PEL data and identify the height consumers' exported bundle.

**Direct prerequisites.**

- `ShimuraCompactifications:C5/integral-minimal-space`
- `ShimuraCompactifications:C5/minimal-hodge-ampleness`
- `PELModuli:M2/representability`
- `SchemeAndStackFoundations:SF.1`
- `SchemeAndStackFoundations:SF.3`

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), Corollary 7.2.3.10, printed p. 548: Precise arithmetic moduli endpoint.

**Acceptance.**

- The endpoint is a scheme and relatively quasi-projective.
- No bad-prime or general Hodge/abelian-type integral model is asserted.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C5

**namespace.** TauCeti.ShimuraCompactifications

### Higher-level normalized toroidal models

**Node:** `ShimuraCompactifications:C5/higher-level-toroidal-normalization`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.higher_level_toroidal_normalization`. **Kind:** construction. **Implementation:** unchecked.

**Planet:** Higher-level toroidal normalization.

For the fixed good-prime base-level toroidal model and SAME-fan finite generic higher-level cover of M4, take relative normalization in the generic function algebra. Its map to the base toroidal model is finite over the excellent base and its interior is M4's normalization. Pull back the good-level universal semi-abelian family; its higher p-level structure is specified on the generic fibre, not automatically over the special fibre. The changed-lattice boundary description and identification with the normalized toroidal charts require the exact source comparison. This is the Siegel normalization lane described in BPS 5.1–5.2, extended to other PEL data only when that comparison is supplied. It is not automatically the parahoric moduli model or Lan's full ramified projective-fan construction.

**Hypotheses.**

- Let p be a GOOD prime for the base PEL datum and v|p. Take a neat prime-to-p level K^p, base p-level K_p^0=G(Z_p), and K_p contained in K_p^0 open. The base model is the ordinary good-level toroidal model over O_(F0,v); the higher level itself may have p-power index. Import the generic finite etale cover and its interior normalization from M4. Do not impose the base model's prime-to-p-level restriction on K_p.
- Fix the chosen good-level fan and its inverse-image cones in the changed higher-level character lattices. This is normalization of that SAME fan model in the finite generic function algebra over an excellent base. A compatible refinement of the fan instead gives a proper modification, not a finite normalization map to the old fan. General projective compatible nonsmooth fans at ramified primes use projective-normalized-blowup below, with different input models.

**Construction or proof.**

1. Import the interior normalization from M4 and extend by integral closure in the finite generic algebra.
2. For the changed integral lattices, prove the normalized character-line chart comparison in the specific same-fan situation; BPS 5.1–5.2 states the Siegel normalization result. Identifying this finite normalization with the projective normalized-blowup construction of Lan 2017 requires the recorded model-comparison gap, not just an appeal to Theorem 6.1.
3. Descend the family and finite map; compare compatible refinements. The model-identification theorem belongs to the separate parahoric owner.

**Planning API.**

- `NormalizedToroidalModel.finiteMap` (projection): For the SAME-fan relative normalization, the structural map to the chosen good-level toroidal model is finite. A subsequent fan refinement is a separate proper modification.
- `NormalizedToroidalModel.openNormalization` (compatibility): Its interior is canonically the M4 normalization, before any parahoric moduli identification.
- `NormalizedToroidalModel.chartIntegralClosure` (characterisation): When the exact changed-lattice/completed-chart comparison is supplied, the normalization chart identifies with its specified integral closure, torsor units and saturated character monoids; no arbitrary fan modification is inferred finite.
- `NormalizedToroidalModel.refinement` (functoriality): Compatible further fan refinements give proper comparison maps agreeing on the same generic higher-level cover; this functoriality is separate from finiteness of the fixed-fan normalization map.
- `NormalizedToroidalModel.desc` (universal-property): A normal flat algebraic space over the good-level toroidal model with the specified generic lift to the finite higher-level cover factors uniquely through its relative normalization, using the exact generic-compatibility and normalization descent hypotheses.

**Unit tests.**

- `NormalizedToroidalModel.identity_test` (degenerate): The identity generic cover of a normal base model returns that model.
- `NormalizedToroidalModel.tate_ramification_test` (computation): A cusp cover q=t^p is finite but ramified at t=0 and can have inseparable special behavior.
- `NormalizedToroidalModel.open_test` (compatibility): Restricting to the interior agrees with the M4 normalization carrier.
- `NormalizedToroidalModel.smoothness_test` (non-example): A higher-level normalized chart is not declared smooth merely because its good-level target is smooth.

**Consumers.**

- `PerfectoidShimuraVarieties:S1`: Supplies normalized finite-level charts for its tower argument.
- `ShimuraCompactifications:C5/normalized-koecher`: Supplies the normalization model to which the routed integral Koecher theorem applies.

**Direct prerequisites.**

- `ShimuraCompactifications:C5/integral-toroidal-space`
- `ShimuraCompactifications:C5/formal-completion`
- `PELModuli:M4/higher-level-normalization`
- `PELModuli:M4/normalization-finite-normal-flat`
- `SchemeAndStackFoundations:SF.1`
- `SchemeAndStackFoundations:SF.3`

**Source match.**

- [LAN-2017](https://www.kwlan.org/articles/cpt-ram-nbl.pdf), Theorem 6.1, printed pp. 22–24, as a comparison target with a DIFFERENT normalized-blowup construction: Lan's projective model is not defined merely by finite normalization of a fixed good-level toroidal model; the comparison is an explicit gap.
- [BPS-2016](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p05-p.pdf), 5.1–5.2, printed pp. 1009–1010: Routed normalization compactification, with moduli identification kept separate.

**Acceptance.**

- The normalization map is finite and its open locus is the M4 normalized cover.
- The boundary model may be singular or ramified.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C5

**namespace.** TauCeti.ShimuraCompactifications

### Normalized chart finiteness and formal comparison

**Node:** `ShimuraCompactifications:C5/normalized-chart-finiteness`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.normalized_chart_finiteness`. **Kind:** theorem. **Implementation:** unchecked.

For the projective normalized-blowup model, prove the completed boundary chart identification of Lan 2017 Theorem 6.1(3)–(4), with the actual torus-torsor base and changed lattices. For the SAME-fan higher-level normalization, prove the separate finite integral-closure map and compare its completed charts with that source model when the input models agree. Export precisely these finite-type, normality and chart properties to the tower owner. A map induced by an arbitrary fan subdivision is proper and can have positive-dimensional fibres; it is not asserted finite.

**Hypotheses.**

- Retain separately the exact good-prime SAME-fan hypotheses of higher-level-toroidal-normalization and the projective compatible, possibly nonsmooth/ramified hypotheses of projective-normalized-blowup. Their model identification is a recorded gap. No all-prime general Hodge-type model is included.

**Construction or proof.**

1. Use finite integral closure on excellent charts in the same-fan normalization case; for the general projective model use the normalized-blowup construction and its formal chart theorem instead.
2. Apply Lan Theorem 6.1(3)–(4) for the projective model's completed torus-torsor chart. Relate it to the finite normalization chart only after the precise model-identification input has been supplied.
3. Verify overlap descent and the compatibility maps consumed by the tower. Lan's referenced global normalization/completion proof is an explicit unread leaf.

**Direct prerequisites.**

- `ShimuraCompactifications:C5/higher-level-toroidal-normalization`
- `ShimuraCompactifications:C0/arbitrary-ring-toric-charts`
- `ShimuraCompactifications:C4/boundary-level-comparison`
- `SchemeAndStackFoundations:SF.1`
- `SchemeAndStackFoundations:SF.3`
- `ShimuraCompactifications:C5/projective-normalized-blowup`

**Source match.**

- [LAN-2017](https://www.kwlan.org/articles/cpt-ram-nbl.pdf), Theorem 6.1(3)–(4), printed pp. 22–23; Construction 4.5, printed p. 11: Normal formal torus-torsor charts; finite normalization maps require the separate same-fan argument.

**Acceptance.**

- The completed character lattice is the changed higher-level lattice.
- No unjustified inverse-limit/completion interchange is asserted.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C5

**namespace.** TauCeti.ShimuraCompactifications

### Integral canonical and subcanonical coefficient charts

**Node:** `ShimuraCompactifications:C5/integral-coefficient-extension`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.integral_coefficient_extension`. **Kind:** application. **Implementation:** unchecked.

Instantiate B3/B4 canonical coefficient extensions on the actual good-prime and normalized toroidal models. The canonical extension has the prescribed character-line Fourier–Jacobi completion; its subcanonical extension is the canonical sheaf tensor the ordinary boundary ideal, not an incorrectly identified pullback line on every refinement. Identify the formally canonical/subcanonical conditions of Lan 2017 Definition 8.5, including its finite exhaustive coefficient filtration with finite R-module graded pieces.

**Hypotheses.**

- Use the exact coefficient sheaf and finite-module filtration required by Definition 8.5, not an arbitrary boundary sheaf. Integral/normalized coefficients are requested from B3/B4 rather than inferred from their characteristic-zero construction.

**Construction or proof.**

1. Use the universal semi-abelian family to identify the B3/B4 coefficient functor on each boundary torsor chart.
2. Compare its completion with the character-line sum and the base coefficient E0, retaining the finite filtration condition.
3. For subcanonical coefficients impose strictly boundary-positive degrees/ordinary boundary ideal; use the C3 derived ideal comparison on refinements.

**Direct prerequisites.**

- `ShimuraCompactifications:C5/integral-toroidal-space`
- `ShimuraCompactifications:C5/higher-level-toroidal-normalization`
- `ShimuraCompactifications:C5/formal-completion`
- `AutomorphicBundles:B3`
- `AutomorphicBundles:B4`
- `ShimuraCompactifications:C3/refinement-boundary-ideal`
- `ShimuraCompactifications:C5/projective-normalized-blowup`

**Source match.**

- [LAN-2017](https://www.kwlan.org/articles/cpt-ram-nbl.pdf), Definition 8.5, printed p. 34: Exact completed coefficient form and finite-filtration hypothesis.
- [BPS-2016](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p05-p.pdf), 5.1–5.2, printed pp. 1009–1010: Routed automorphic extension on the normalization model.

**Acceptance.**

- Canonical coefficients satisfy the exact formal condition used by Koecher.
- The subcanonical refinement map retains boundary multiplicities.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C5

**namespace.** TauCeti.ShimuraCompactifications

### Koecher principle on normalized PEL models

**Node:** `ShimuraCompactifications:C5/normalized-koecher`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.normalized_koecher`. **Kind:** theorem. **Implementation:** unchecked.

Let O tensor_Z Q be simple, R any O_F0,(p)-algebra, and E a quasi-coherent formally canonical coefficient sheaf on the normalized toroidal model in Lan 2017 Definition 8.5. For every open U_min of its minimal compactification, restriction Gamma(U_tor,E)→Gamma(U,E) is bijective, except when both dim(M_H)=1 and U_min minus U is nonempty. This includes the source's mod pi^n coefficients satisfying the formal hypothesis and BPS normalization model. It does not establish the model's separate identification with X_Iw.

**Hypotheses.**

- Use the projective normalized model and the exact Definition 8.5 completed character-line form plus finite filtration. Retain the simple-algebra hypothesis and the dimension-one exception.

**Construction or proof.**

1. Apply the positive Fourier–Jacobi rank/growth results of Lan 2017 Propositions 8.3–8.4 to the exact coefficient filtration.
2. Use the same formal extension argument as the source's cited Koecher theorem and glue over U_min.
3. Specialize to R=O/pi^n and the BPS normalization model after verifying the coefficient condition. The cited Lan [17] proof and positivity inputs are recorded as unresolved proof leaves; normal generic-fibre Hartogs alone does not prove torsion coefficients.

**Direct prerequisites.**

- `ShimuraCompactifications:C5/higher-level-toroidal-normalization`
- `ShimuraCompactifications:C5/integral-coefficient-extension`
- `ShimuraCompactifications:C5/integral-minimal-space`
- `AutomorphicBundles:B5`
- `SchemeAndStackFoundations:SF.2`
- `ShimuraCompactifications:C5/projective-normalized-blowup`

**Source match.**

- [LAN-2017](https://www.kwlan.org/articles/cpt-ram-nbl.pdf), Theorem 8.7 and Remarks 8.9–8.10, printed pp. 34–35: Exact normalized-model theorem, exception and boundary of higher variants.
- [BPS-2016](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p05-p.pdf), 5.2, printed p. 1010: Routed mod pi^n theorem for normalization model.
- [LAN-2017-ERRATA](https://www.kwlan.org/articles/cpt-ram-nbl-err.pdf), Item (3), p. 1: The explicit dimension-one/nonempty-boundary exception to Koecher, already retained in the node.

**Acceptance.**

- The theorem applies to arbitrary stated R, not merely its fraction field.
- Dimension-one boundary poles are the genuine excluded case.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C5

**namespace.** TauCeti.ShimuraCompactifications

### Siegel Koecher with arbitrary coefficients

**Node:** `ShimuraCompactifications:C5/siegel-koecher-arbitrary-coefficients`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.siegel_koecher_arbitrary_coefficients`. **Kind:** theorem. **Implementation:** unchecked.

For the neat good-prime genus-two Siegel model, E of rank two and integers a>=b, set omega(a,b)=Sym^(a-b) E tensor (det E)^b using the B3/B4 coefficient construction. For EVERY O-module M, restriction H^0(X,omega(a,b) tensor_O M)→H^0(Y,omega(a,b) tensor_O M) is bijective. Derive the arbitrary-module assertion through finite modules and filtered colimits, preserving torsion; the result is independent of the chosen compatible toroidal model.

**Hypotheses.**

- Use the precise smooth proper good-prime genus-two setup of Calegari–Geraghty 5.2. For higher normalized models instead invoke normalized-koecher with its exact coefficient hypotheses.

**Construction or proof.**

1. Verify the formally canonical condition for finite coefficient modules and apply the integral Koecher theorem.
2. Pass to arbitrary modules by filtered colimits on the finite-type quasi-compact separated models, using the exact coefficient construction.
3. Compare fans via the common refinement; preserve the derived boundary-ideal distinction for cuspidal coefficients.

**Direct prerequisites.**

- `ShimuraCompactifications:C5/normalized-koecher`
- `ShimuraCompactifications:C5/integral-coefficient-extension`
- `ShimuraCompactifications:C3/coherent-cohomology-invariance`
- `SchemeAndStackFoundations:SF.2`

**Source match.**

- [CG-2020](https://math.uchicago.edu/~fcale/papers/Siegel.pdf), 5.2, published pp. 821–822: H0 with arbitrary O-module coefficients.
- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 7.1.1.4–7.1.1.5, printed pp. 532–533: Arbitrary coefficient-module reduction and fan independence.

**Acceptance.**

- Torsion M=O/pi^n is included.
- No equality of all open and compactified higher cohomology follows from H0 Koecher.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C5

**namespace.** TauCeti.ShimuraCompactifications

### Ordinary-locus Koecher principle

**Node:** `ShimuraCompactifications:C5/ordinary-koecher`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.ordinary_koecher`. **Kind:** theorem. **Implementation:** unchecked.

For the exact ordinary minimal open and its toroidal inverse image in Pilloni 11.1.1, prove restriction of sections of the stated canonical coefficient sheaf to the open ordinary locus is bijective, retaining its integral/mod p setting. Prove the formal coefficient condition and special-fibre extension theorem on that open. The characteristic-zero whole-space Koecher assertion alone does not imply this ordinary mod p statement, and it is not exported to an unidentified arbitrary parahoric model.

**Hypotheses.**

- Use the specified good-prime ordinary geometry and finite-level coefficient construction. Establish normality/S2 and the codimension or Fourier–Jacobi extension inputs on the relevant special-fibre/formal model.

**Construction or proof.**

1. Identify the ordinary minimal open and toroidal preimage through the actual Hodge map.
2. Prove the special-fibre/formal extension input for the exact coefficient sheaf, then pass to the stated finite thickenings/completions.
3. Compare with the source's restriction map. Pilloni states this without proof/reference; the special-fibre/formal extension is recorded as a gap.

**Direct prerequisites.**

- `ShimuraCompactifications:C5/normalized-koecher`
- `ShimuraCompactifications:C5/integral-coefficient-extension`
- `AdicSpacesPartII:R2`
- `AdicSpacesPartII:R3`
- `SchemeAndStackFoundations:SF.2`

**Source match.**

- [PILLONI-2020](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), 11.1.1, author-copy p. 66: Ordinary version asserted without a proof reference.

**Acceptance.**

- The ordinary mod p/formal setting is proved separately.
- No general parahoric model or higher-cohomology Koecher theorem is inferred.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C5

**namespace.** TauCeti.ShimuraCompactifications

### Codimension of genus-two Hilbert–Siegel boundary

**Node:** `ShimuraCompactifications:C5/hilbert-siegel-boundary-codimension`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.hilbert_siegel_boundary_codimension`. **Kind:** theorem. **Implementation:** unchecked.

For the exact genus-two Hilbert–Siegel minimal compactification over a totally real field of degree d in BCGP 8.2, the open has dimension 3d and every maximal nonempty boundary stratum has dimension at most d, hence boundary codimension at least 2d>=2. Preserve the inequality under the specified finite normalizations and on the normal formal model needed in the source. A toroidal boundary is a divisor; this codimension assertion concerns the minimal target.

**Hypotheses.**

- Use the source's normal characteristic-zero/minimal and normal formal setup; arbitrary bad-prime special-fibre codimension/S2 is not assumed from it.

**Construction or proof.**

1. Classify the genus-two rational parabolic boundary: rank-one pure quotient has Hilbert modular dimension d and maximal-rank cusp has dimension zero.
2. Compare to dimension 3d and use finite normalization to preserve dimensions of the specified closed strata.
3. Verify the normal formal charts used for the Hartogs argument; do not transport the inequality to the toroidal divisor.

**Direct prerequisites.**

- `ShimuraCompactifications:C1/boundary-incidence`
- `ShimuraCompactifications:C2/minimal-boundary-map`
- `ShimuraCompactifications:C5/integral-minimal-space`
- `ShimuraCompactifications:C5/higher-level-toroidal-normalization`
- `ShimuraVarieties:V2/rational-boundary`

**Source match.**

- [BCGP-2021](https://arxiv.org/pdf/1812.09269v3), arXiv:1812.09269v3, Section 8.2, printed/PDF p. 240; publisher pagination not collated: Minimal boundary codimension and normal formal geometry.

**Acceptance.**

- For d=1, a rank-one boundary stratum has dimension 1 inside a threefold.
- The corresponding toroidal boundary has codimension one and is not confused with this minimal boundary.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C5

**namespace.** TauCeti.ShimuraCompactifications

### Formal Hilbert–Siegel Koecher principle

**Node:** `ShimuraCompactifications:C5/formal-hilbert-siegel-koecher`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.formal_hilbert_siegel_koecher`. **Kind:** theorem. **Implementation:** unchecked.

In BCGP 8.2, on the NORMAL formal minimal scheme and for its stated invertible sheaf and toroidal pullback, extend H0 sections uniquely across the codimension-at-least-two minimal boundary. Prove the formal Hartogs statement with its precise normality/local-finiteness hypotheses and compare the toroidal pushforward of the line. This does not imply equality of arbitrary higher cohomology or all torsion coefficient sections.

**Hypotheses.**

- Use the exact normal formal model, line bundle and finite-level comparison of the source; special-fibre S2/normality cannot be replaced by normality of a generic fibre.
- Supply O_formal-min≅pi_hat_*O_formal-tor for the ACTUAL formal contraction in BCGP, and a projection formula for its specified invertible sheaf. The good-level algebraic Stein equality in integral-minimal-space must be transported to this normalized/ordinary formal model; neither generic-fibre equality nor the fan-refinement theorem proves that transport.

**Construction or proof.**

1. Apply the foundations formal Hartogs theorem for an invertible sheaf on the normal formal model and the proved minimal boundary codimension.
2. Start with the toroidal-to-minimal Stein structure-sheaf comparison, then use AdicSpacesPartII:F0/formal-direct-image-comparison only after verifying its proper locally-Noetherian scheme hypotheses (or supplying the exact algebraic-space extension). The identification with BCGP's normalized/ordinary formal contraction, and any special-fibre transfer, remain the explicit comparison gap. Apply the projection formula for the specified line only once this comparison is supplied.
3. Identify the source's H0 restriction. Record the formal Hartogs theorem and normal formal-model verification as requests/gaps.

**Direct prerequisites.**

- `ShimuraCompactifications:C5/hilbert-siegel-boundary-codimension`
- `AdicSpacesPartII:R2`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:SF.2`
- `ShimuraCompactifications:C5/integral-minimal-space`
- `AdicSpacesPartII:F0/formal-direct-image-comparison`

**Source match.**

- [BCGP-2021](https://arxiv.org/pdf/1812.09269v3), arXiv:1812.09269v3, Section 8.2, printed/PDF p. 240; publisher pagination not collated: Formal H0 extension on the specified normal model.

**Acceptance.**

- The normal formal model and invertible sheaf are the asserted carriers.
- The conclusion is H0 extension, with no blanket higher-cohomology statement.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C5

**namespace.** TauCeti.ShimuraCompactifications

### Prime-to-base cyclic level group at the boundary

**Node:** `ShimuraCompactifications:C5/prime-Q-subgroup-extension`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.prime_Q_subgroup_extension`. **Kind:** theorem. **Implementation:** unchecked.

For the Calegari–Geraghty K0(Q) Siegel toroidal model with Q a prime invertible on the arithmetic base, extend the specified open cyclic subgroup H⊂A[Q] AS A FINITE FLAT GROUP SCHEME over the compactification, as in Pilloni 2012 4.1.2. The extension is finite etale of rank Q and is the group used for the generator Isom cover. No closed inclusion of this extended group into the identity-component semi-abelian family is asserted: the source states a finite-flat group extension, and boundary torsion can lose rank. Retain the generic inclusion only on the open locus.

**Hypotheses.**

- Use the fixed K0(Q) model, compatible fans and subgroup with the source's extension construction; Q is invertible on the entire base.

**Construction or proof.**

1. Use the level degeneration datum to construct the finite flat cyclic level group H on each cusp chart, with its generic subgroup identification. The Faltings–Chai chapter V construction quoted by Pilloni remains a recorded proof leaf.
2. Descend the finite group and its generic identification through the ordinary chart relation; do not assert that the generic inclusion extends into the semi-abelian identity component.
3. Apply the finite-group order-invertible etaleness theorem and compare the generic restriction. Pilloni 4.1.2 gives this group-extension case.

**Direct prerequisites.**

- `ShimuraCompactifications:C5/integral-toroidal-space`
- `ShimuraCompactifications:C4/boundary-level-comparison`
- `ShimuraCompactifications:C4/formal-universal-degeneration`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:SF.1`

**Source match.**

- [PILLONI-2012](https://smf.emath.fr/system/files/2017-08/smf_bull_140_335-400.pdf), 4.1.2, printed pp. 350–351: The open subgroup extends as a finite flat group scheme; the text does not assert a boundary inclusion into the semi-abelian family.
- [CG-2020](https://math.uchicago.edu/~fcale/papers/Siegel.pdf), 5.2, published p. 822: The compactified cyclic level group used for the next finite-etale cover.

**Acceptance.**

- H has rank Q on every fibre and is finite etale.
- The statement is not applied to a rank-losing boundary kernel, even when its generic degree is invertible on the base.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C5

**namespace.** TauCeti.ShimuraCompactifications

### Toroidal generator cover of a cyclic subgroup

**Node:** `ShimuraCompactifications:C5/prime-Q-generator-cover`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.prime_Q_generator_cover`. **Kind:** construction. **Implementation:** unchecked.

On the specified compactified K0(Q) model, define X_K1(Q)=Isom_X(Z/Q,H) for the extended finite-etale cyclic rank-Q level group. It is a finite-etale torsor under Delta=(Z/Q)^×, restricts to the specified K1(Q) level cover on the open, and inherits the pulled-back universal family and coefficient sheaves. The proof uses Q invertible and the actual extended finite group; it requires no inclusion of H into the semi-abelian identity component over the boundary.

**Hypotheses.**

- Use prime-Q-subgroup-extension, with Q prime and invertible on the base, and the constant cyclic group scheme Z/Q.

**Construction or proof.**

1. Represent the finite-etale group-scheme isomorphism functor by the foundations finite-etale Isom construction.
2. Check simple transitivity of generators under multiplication by (Z/Q)^× and finite-etale rank Q-1.
3. Compare the open level meaning and descend/pull back the family and coefficient data.

**Planning API.**

- `PrimeQGeneratorCover.torsor` (structure): Multiplication of a generator by Delta gives a simply transitive action on each geometric fibre.
- `PrimeQGeneratorCover.openLevel` (compatibility): The interior is the stated K1(Q)→K0(Q) level map.
- `PrimeQGeneratorCover.baseChange` (functoriality): The Isom cover and its action commute with base change, with identity/composition comparisons.
- `PrimeQGeneratorCover.isomSections` (characterisation): Sections of the cover over T correspond to group-scheme isomorphisms (Z/QZ)_T→H_T; an arbitrary point of H or the zero section is not a generator.

**Unit tests.**

- `PrimeQGeneratorCover.Q3_test` (computation): For Q=3 and constant H=Z/3 there are two generators, permuted freely by (Z/3)^×.
- `PrimeQGeneratorCover.Q2_test` (degenerate): For Q=2 the generator cover has degree one.
- `PrimeQGeneratorCover.open_test` (compatibility): Restriction to the open gives the original level cover.
- `PrimeQGeneratorCover.noninvertible_test` (non-example): A p-kernel with rank loss at a characteristic-p boundary cannot be inserted as H to deduce a finite-etale cover.

**Consumers.**

- `AutomorphicGaloisRepresentationsPartII`: Supplies compactified level covers for the coherent Hecke module construction.
- `CG-2020, 5.2`: Pulls back coefficient sheaves along the exact finite-etale level cover.

**Direct prerequisites.**

- `ShimuraCompactifications:C5/prime-Q-subgroup-extension`
- `SchemeAndStackFoundations:SF.1`

**Source match.**

- [CG-2020](https://math.uchicago.edu/~fcale/papers/Siegel.pdf), 5.2, published p. 822: Exact compactified generator-cover construction.

**Acceptance.**

- The cover is finite etale of degree Q-1.
- It agrees with the prescribed open K1(Q) cover.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C5

**namespace.** TauCeti.ShimuraCompactifications

### Canonical bundle of a Siegel threefold

**Node:** `ShimuraCompactifications:C5/siegel-canonical-bundle`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.siegel_canonical_bundle`. **Kind:** theorem. **Implementation:** unchecked.

For a neat smooth genus-two Siegel toroidal threefold X/B with boundary D and invariant Hodge bundle E of rank two, det Omega^1_X/B(log D)=(det E)^3 and the relative dualizing line is (det E)^3 tensor O_X(-D). Derive this from the logarithmic Kodaira–Spencer isomorphism and the local normal-crossings coordinate formula; D is the actual boundary divisor. These are smooth-model bundle identities, not automatic dualizing formulas for singular p-level normalizations.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- Use relative dimension three, principal Siegel polarization, smooth cone system and the specified boundary normal-crossings hypotheses.

**Construction or proof.**

1. Take determinants in Sym² E≅Omega^1(log D); compute det Sym² E=(det E)^3 by a rank-two basis/transition calculation.
2. Use the local logarithmic coordinate wedge to identify det Omega^1(log D)=det Omega^1 tensor O(D).
3. Identify det Omega^1 with the relative dualizing line in the smooth setting and descend the local comparison.

**Direct prerequisites.**

- `ShimuraCompactifications:C5/log-kodaira-spencer`
- `AutomorphicBundles:B4`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:SF.2`

**Source match.**

- [CG-2020](https://math.uchicago.edu/~fcale/papers/Siegel.pdf), 5.3, published pp. 830–831: Canonical/subcanonical duality bundle identity.

**Acceptance.**

- For a diagonal change of basis, Sym² has determinant (t1 t2)^3.
- Removing the logarithmic poles contributes O(-D).

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C5

**namespace.** TauCeti.ShimuraCompactifications

### Good-reduction boundary geometry for cohomology

**Node:** `ShimuraCompactifications:C5/good-boundary-cohomology-export`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.good_boundary_cohomology_export`. **Kind:** application. **Implementation:** unchecked.

Export the exact good-prime toroidal family, smooth proper model, open Siegel moduli locus and normal-crossings boundary with the hyperspecial/tame level conditions used in BCGP 2025 Theorem 1.8.29. The cohomology owner must supply Lan–Stroh nearby-cycle/open comparison and duality to obtain the stated unramified cohomology conclusion. Smoothness of the nonproper open alone is not a proof of unramifiedness.

**Hypotheses.**

- At ell distinct from p use the theorem's hyperspecial ell-level, prime-to-ell auxiliary level and exact automorphic coefficient system; export only the model satisfying those hypotheses.

**Construction or proof.**

1. Choose the compatible good-prime smooth projective toroidal model and its universal semi-abelian extension.
2. Identify its interior, boundary and coefficient extension with the theorem's Siegel variety and local system inputs.
3. Pass the geometry to the etale/cohomology supplier, naming the nearby-cycle/open comparison and duality separately. The cited Lan–Stroh Corollary 5.20 proof is not read and is not a new theorem in C5.

**Direct prerequisites.**

- `ShimuraCompactifications:C5/integral-toroidal-space`
- `ShimuraCompactifications:C5/valuative-properness`
- `ShimuraCompactifications:C5/log-kodaira-spencer`
- `AutomorphicBundles:B3`
- `AutomorphicGaloisRepresentationsPartII:AG2.4`

**Source match.**

- [BCGP-2025](https://arxiv.org/pdf/2502.20645v1), Theorem 1.8.29 and beginning of proof, arXiv v1 p. 17: Boundary geometry supplied here; nearby cycles and duality supplied by the cohomology owner.

**Acceptance.**

- The geometry retains hyperspecial good-reduction conditions.
- No cohomological conclusion is inferred from smoothness of the open alone.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C5

**namespace.** TauCeti.ShimuraCompactifications

### Projective normalized-blowup compactification

**Node:** `ShimuraCompactifications:C5/projective-normalized-blowup`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.projective_normalized_blowup`. **Kind:** construction. **Implementation:** unchecked.

For Lan 2017's integral PEL/lattice-collection setting at a prime p, construct the projective toroidal model for a compatible PROJECTIVE cone system Sigma, without imposing smoothness or good reduction at p. Choose its compatible polarization function pol and a smooth refinement over the characteristic-zero reflex field. Push the pol-weighted boundary ideal to the minimal model, take its schematic closure J_tilde_(H,dpol) in the supplied p-integral minimal model, and form the normalization of its blow-up. For sufficiently divisible d the resulting models stabilize to the normal projective flat scheme M_tilde_(H,Sigma)^tor of Theorem 6.1, with the stated formal torus-torsor charts and tautological degenerating families indexed by the auxiliary lattice collection. This is a normalized blow-up of a minimal model; it is not defined as a finite cover of a fixed good-level toroidal model.

**Hypotheses.**

- Use the integral PEL datum (O,*,L,pairing,h0) and Condition 1.4.3.10 as in Lan 2017 Section 2. Let H be open compact in G(Zhat) with NEAT image H^p away from p, and retain the collection (g_j,L_j,pairing_j) indexed by J as in the source's reference [18], Section 2.
- Work over S_tilde_0=Spec(O_(F0,(p))). Sigma is complete admissible and compatible as in Definition 2.1/Condition 6.2.5.25, and projective as in Definitions 2.5 and 2.7. A compatible invariant polarization function is supplied; individual cones need not be smooth.
- The ramified normalized interior, minimal model and auxiliary lattice families of [18], Propositions 6.1 and 6.4 are requested from M4. The currently inspected M4 nodes cover only the good-prime normalization case, so this wider supplier interface is an explicit gap.

**Construction or proof.**

1. Use C0 projective refinements and Lan Construction 3.1 to form the boundary ideal whose ray multiplicities are dpol; Definition 3.5 pushes it to the characteristic-zero minimal model. Keep the invariant piecewise-linear function and its lattice-valued ray multiplicities.
2. Construction 3.12 takes the schematic closure of that ideal in the supplied p-integral minimal model and the normalization of its blow-up, yielding normality, projectivity and flatness. Generic normalization and blow-ups are foundations inputs, rather than new private carriers.
3. Lan Sections 4–5 identify the completed ideals and torus-torsor charts and establish stabilization for sufficiently divisible d; Theorem 6.1(1)–(6) supplies the resulting families, strata and uniqueness. The complete Sections 4–5 proof and [18] supplier constructions were not read, so their precise proof leaves remain a gap. When using Lemma 2.12 allow its nonvertex lattice generators as required by Remark 2.15.

**Planning API.**

- `ProjectiveToroidalModel.toMinimal` (projection): Returns the canonical proper map to the supplied normalized minimal model, with the source's boundary stratum images.
- `ProjectiveToroidalModel.completion` (characterisation): The completed neighbourhood of the labelled stratum is the formal torus-torsor chart of Theorem 6.1(3)–(4), with its actual normal flat torsor base and all indexed families.
- `ProjectiveToroidalModel.auxiliaryIndependent` (extensionality): For sufficiently divisible d, the comparison identifies models for different d and polarization functions inducing the same Sigma; retain the fixed PEL lattice-collection data.
- `ProjectiveToroidalModel.refinement` (functoriality): Compatible projective refinements induce canonical proper maps with identity/composition, as in Theorem 6.1(2) and Proposition 7.1.
- `ProjectiveToroidalModel.valuativeExtension` (universal-property): For an irreducible Noetherian normal S over the local reflex base carrying the specified indexed degenerating families and generic level map, the map extends uniquely when, at each geometric point, ALL dominating complete-DVR valuation pairings lie in one corresponding cone, exactly as in Theorem 6.1(6).

**Unit tests.**

- `ProjectiveToroidalModel.rankZero_test` (degenerate): When there is no boundary and the minimal model is already the proper interior, the ideal is the unit ideal and its normalized blow-up returns that normal model.
- `ProjectiveToroidalModel.blowup_test` (non-example): The normalized blow-up of (x,y) in a regular two-dimensional affine chart has exceptional P1 and a positive-dimensional fibre; declaring every normalized blow-up a finite normalization fails this local construction test.
- `ProjectiveToroidalModel.stabilization_test` (compatibility): Two sufficiently divisible d giving the same source Sigma yield the canonical comparison preserving the labelled completed chart and each auxiliary family.

**Consumers.**

- `ShimuraCompactifications:C5/normalized-chart-finiteness`: Supplies the projective source model whose formal chart theorem must be distinguished from a finite same-fan normalization.

**Direct prerequisites.**

- `ShimuraCompactifications:C0/smooth-projective-refinement`
- `ShimuraCompactifications:C2/projective-algebraization`
- `ShimuraCompactifications:C2/minimal-boundary-map`
- `ShimuraCompactifications:C4/polarized-degeneration-data`
- `PELModuli:M4`
- `SchemeAndStackFoundations:SF.2`
- `SchemeAndStackFoundations:SF.3`

**Source match.**

- [LAN-2017](https://www.kwlan.org/articles/cpt-ram-nbl.pdf), Construction 3.1, Definition 3.5 and Construction 3.12, printed pp. 7–9; Theorem 6.1, printed pp. 22–24: Normalized-blowup construction, local reflex base, projective compatible fan, and stabilized model theorem.

**Acceptance.**

- Every lattice index j has its own tautological semi-abelian family; higher-level structures are specified only where the source defines them.
- The output is projective over the local reflex base and maps properly to the supplied minimal model; no general finiteness to a different fan is claimed.

**Proposed library placement.** **module.** TauCeti/ShimuraCompactifications/C5

**namespace.** TauCeti.ShimuraCompactifications

## C6. Hilbert/modular models, Koecher, q-expansions and ordinary interfaces

This layer identifies the generic compactification machinery with the actual Hilbert moduli problems, completed cusp charts, polarization quotients and level/differential data. Its native arithmetic lemmas prove the unit-orbit support argument and phase character. The geometric comparisons retain the precise coefficient bases, actual level and supplier gaps described above.

**Remaining construction contracts.**

- Close the exact supplier requests for arithmetic completed charts, formal effectivity, HBAV local models, determinant section-ring geometry, Hasse/differential extension and modular coarse comparisons; replace the geometric signature omission ledger with the actual native interfaces. In particular close the integral boundary global-function comparison and the compatible/pullback-fan level-map contracts.
- Supply the module-valued schematic-density/completion contracts needed by the inclusion q-expansion theorem; specify any separate noninjective-map image formulation and the integral wild-level local-model comparison before enlarging those statements.
- Collate the independently reviewed source issues against the version of record; the accessible-copy independent review is complete.
- Reconcile the completed-chart, all-prime Hilbert-model and changed-level instantiation gaps recorded by the assembly; exact ordinary C0/C3/C4 ingredients now have node prerequisites, but the wider C5 integral request has no matching node.

### A contracting unit in a cusp subgroup

**Node:** `ShimuraCompactifications:C6/finite-index-cusp-unit-contraction`. **Declaration:** `finiteIndex_unit_contracts_away`. **Kind:** lemma. **Implementation:** unchecked.

If U has finite index and F has more than one infinite place, then for each w₀ there is u∈U with |τ_w₀(u)|>1 and |τ_w(u)|<1 for every w≠w₀.

**Hypotheses.**

- F is a totally real number field; τ_w denotes its signed real embedding at infinite place w. The native InfinitePlace value w(x) is |τ_w(x)|. U is a subgroup of the integer units, not a subgroup of F× with an assumed finite index.
- The cardinality hypothesis is equivalent to [F:Q]>1 in this totally real setting.

**Construction or proof.**

1. Apply the pinned Dirichlet exists_unit theorem at w₀ to obtain v whose other absolute values have negative logarithms.
2. Use positivity of unit absolute values and the logarithmic product formula, with all multiplicities equal to one. There is at least one other place, so the logarithm at w₀ is strictly positive.
3. Apply the finite-index positive-power theorem to v. Raising all absolute values to this positive power preserves the strict inequalities and produces an element of U.

**Direct prerequisites.**

- `mathlib:NumberField.Units.dirichletUnitTheorem.exists_unit`
- `mathlib:NumberField.Units.sum_mult_mul_log`
- `mathlib:NumberField.Units.pos_at_place`
- `mathlib:NumberField.IsTotallyReal.mult_eq`
- `mathlib:Subgroup.exists_pow_mem_of_index_ne_zero`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Theorem 8.3 proof, author copy printed p. 547: Declaration-level expansion of the coefficient argument, with its necessary hypotheses made explicit.

**Acceptance.**

- Over Q every integer unit has absolute value one, so the degree assumption cannot be removed.
- For a principal cusp-unit subgroup, use its actual finite index from H3; no logarithmic density of a discrete lattice is asserted.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Koecher

**namespace.** TauCeti.HilbertCusp

### A negative embedding of a nonpositive exponent

**Node:** `ShimuraCompactifications:C6/negative-cusp-exponent`. **Declaration:** `exists_negative_embedding`. **Kind:** lemma. **Implementation:** unchecked.

If ξ∈F is nonzero and is not totally positive, then τ_w(ξ)<0 for some infinite place w.

**Hypotheses.**

- F is a totally real number field; τ_w denotes its signed real embedding at infinite place w. The native InfinitePlace value w(x) is |τ_w(x)|. U is a subgroup of the integer units, not a subgroup of F× with an assumed finite index.

**Construction or proof.**

1. Negate the existing universal strict-positivity predicate to obtain τ_w(ξ)≤0.
2. A field embedding is injective, so ξ≠0 implies τ_w(ξ)≠0; hence the inequality is strict.

**Direct prerequisites.**

- `tauceti:NumberField.isTotallyPositive_iff`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Theorem 8.3 proof, author copy printed p. 547: Corrects the omitted exclusion of exponent zero in the printed contradiction argument; see E1.

**Acceptance.**

- ξ=0 has no negative embedding and must be excluded.
- A nonzero element cannot have a zero real conjugate.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Koecher

**namespace.** TauCeti.HilbertCusp

### Unbounded negative trace along cusp units

**Node:** `ShimuraCompactifications:C6/negative-trace-orbit`. **Declaration:** `negative_trace_orbit_unbounded`. **Kind:** lemma. **Implementation:** unchecked.

Let U have finite index, [F:Q]>1, ξ≠0 not totally positive, and y_w>0 for every w. For every real B there is u∈U with Σ_w τ_w(u²ξ)y_w<B.

**Hypotheses.**

- F is a totally real number field; τ_w denotes its signed real embedding at infinite place w. The native InfinitePlace value w(x) is |τ_w(x)|. U is a subgroup of the integer units, not a subgroup of F× with an assumed finite index.
- The y_w form a vector of the open positive dual cone. It need not itself be a field element.

**Construction or proof.**

1. Choose a negative embedding w₀ by negative-cusp-exponent and a unit v∈U contracting at all other places by finite-index-cusp-unit-contraction.
2. For u=v^n, the w₀ summand is τ_w₀(ξ)y_w₀|τ_w₀(v)|^(2n), tending to negative infinity.
3. At every other place |τ_w(v)|^(2n) tends to zero. The finite sum of these terms tends to zero. Therefore the whole sum is less than any prescribed B for sufficiently large n.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/negative-cusp-exponent`
- `ShimuraCompactifications:C6/finite-index-cusp-unit-contraction`
- `mathlib:tendsto_pow_atTop_atTop_of_one_lt`
- `mathlib:tendsto_pow_atTop_nhds_zero_of_lt_one`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Theorem 8.3 proof, author copy printed p. 547: Declaration-level expansion of the coefficient argument, with its necessary hypotheses made explicit.

**Acceptance.**

- For Q the orbit of ξ=−1 under integer-unit squares is the singleton {−1}.
- ξ=0 has identically zero pairing; no unboundedness conclusion applies.
- For Q(√2), ξ=−√2, v=1+√2 and y=(1,1), the first positive n already gives a negative trace; positive powers continue to negative infinity.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Koecher

**namespace.** TauCeti.HilbertCusp

### Nonzero coefficients survive unit transport

**Node:** `ShimuraCompactifications:C6/coefficient-unit-orbit`. **Declaration:** `coefficient_ne_zero_on_unit_orbit`. **Kind:** lemma. **Implementation:** unchecked.

For a commutative ring R, a:F→R, multipliers c:U×F→R× and covariance a(u²ξ)=c(u,ξ)a(ξ), one has a(u²ξ)≠0 if and only if a(ξ)≠0.

**Hypotheses.**

- F is a totally real number field; τ_w denotes its signed real embedding at infinite place w. The native InfinitePlace value w(x) is |τ_w(x)|. U is a subgroup of the integer units, not a subgroup of F× with an assumed finite index.
- No reducedness, domain, characteristic-zero, or nontriviality condition on R.

**Construction or proof.**

1. Rewrite using the stated covariance.
2. Apply Units.mul_right_eq_zero and negate the equivalence. No division by a nonunit or by the coefficient is used.

**Direct prerequisites.**

- `mathlib:Units.mul_right_eq_zero`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Equation (5), author copy printed p. 546: The scalar unit consequence of the actual Fourier transformation law; the lattice and line trivialization are supplier obligations.

**Acceptance.**

- In Z/4, multiplication by the nonunit 2 kills the nonzero coefficient 2; the unit condition is essential.
- A root of unity and a unit-valued weight character remain units after any coefficient-ring map, even if their reductions equal one.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Koecher

**namespace.** TauCeti.HilbertCusp

### Koecher support for coefficient families

**Node:** `ShimuraCompactifications:C6/bounded-cusp-support`. **Declaration:** `bounded_cusp_support_is_positive`. **Kind:** theorem. **Implementation:** unchecked.

Let [F:Q]>1, U have finite index, and a:F→R satisfy unit-valued covariance as in coefficient-unit-orbit. Suppose some y_w>0 and B∈ℝ satisfy B≤Σ_w τ_w(ξ)y_w whenever a(ξ)≠0. Then every nonzero coefficient is indexed by ξ=0 or by a totally positive ξ.

**Hypotheses.**

- F is a totally real number field; τ_w denotes its signed real embedding at infinite place w. The native InfinitePlace value w(x) is |τ_w(x)|. U is a subgroup of the integer units, not a subgroup of F× with an assumed finite index.
- A coefficient family alone is not a convergent or completed formal series.

**Construction or proof.**

1. Suppose a nonzero coefficient has ξ≠0 not totally positive.
2. Apply negative-trace-orbit with the given y and B, obtaining u∈U with pairing strictly below B.
3. The coefficient at u²ξ is nonzero by coefficient-unit-orbit, contradicting the support lower bound.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/negative-trace-orbit`
- `ShimuraCompactifications:C6/coefficient-unit-orbit`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Theorem 8.3 proof, author copy printed p. 547: Declaration-level expansion of the coefficient argument, with its necessary hypotheses made explicit.

**Acceptance.**

- The constant family supported only at zero is permitted. Koecher does not imply cuspidality.
- The conclusion allows torsion and nilpotents in the coefficient ring because only multiplication by units was cancelled.
- A geometric application must supply the support bound; it is not assumed from the notation for a formal series.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Koecher

**namespace.** TauCeti.HilbertCusp

### Positive exponents vanish on every boundary ray

**Node:** `ShimuraCompactifications:C6/positive-exponents-on-charts`. **Declaration:** `positive_exponent_pairs_pos`. **Kind:** lemma. **Implementation:** unchecked.

If ξ is totally positive and v=(v_w) is nonzero with all v_w≥0, then Σ_w τ_w(ξ)v_w>0. In an integral Hilbert cusp chart, its pairing with each primitive nonzero boundary ray is therefore a strictly positive integer.

**Hypotheses.**

- F is a totally real number field; τ_w denotes its signed real embedding at infinite place w. The native InfinitePlace value w(x) is |τ_w(x)|. U is a subgroup of the integer units, not a subgroup of F× with an assumed finite index.
- For the final interpretation ξ belongs to the character lattice X and the ray belongs to its integral dual; lattice integrality is imported from C0/H1.

**Construction or proof.**

1. All summands are nonnegative. Since v is nonzero, at least one coordinate is strictly positive.
2. Its product with the corresponding strictly positive conjugate of ξ is positive, so the finite sum is positive.
3. Use the character/cocharacter integral pairing to interpret the result as a positive coordinate exponent.

**Direct prerequisites.**

- `tauceti:NumberField.isTotallyPositive_iff`
- `mathlib:Finset.one_lt_prod_iff_of_one_le`
- `ShimuraCompactifications:C0/relative-regular-coordinates`
- `HilbertModularVarietiesAndShimuraCurves:H1`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Section 2 boundary coordinates, author copy printed pp. 529–530; Theorem 8.3, printed p. 547: Elementary positivity consequence used to identify the Hilbert boundary ideal; generic toric coordinate construction remains in C0.

**Acceptance.**

- The zero dual vector gives zero and must be excluded.
- For ξ=1 and every y_w>0 the pairing is positive.
- On a regular chart, positivity at each of its r rays implies divisibility of the monomial by the product x₁⋯x_r.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Koecher

**namespace.** TauCeti.HilbertCusp

### The annihilator of a constant coefficient

**Node:** `ShimuraCompactifications:C6/constant-term-covariance`. **Declaration:** `constant_coefficient_annihilated`. **Kind:** lemma. **Implementation:** unchecked.

Under a(u²ξ)=c(u,ξ)a(ξ) with c(u,ξ)∈R×, every u satisfies (c(u,0)−1)a(0)=0. For Dimitrov’s actual weight law the root-of-unity phase at zero is one.

**Hypotheses.**

- F is a totally real number field; τ_w denotes its signed real embedding at infinite place w. The native InfinitePlace value w(x) is |τ_w(x)|. U is a subgroup of the integer units, not a subgroup of F× with an assumed finite index.
- R is any commutative ring; the scalar formula is written after a local trivialization of the invertible coefficient line.

**Construction or proof.**

1. Set ξ=0 in the transformation law, since u²·0=0.
2. Subtract a(0); distributivity yields the annihilation relation.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/coefficient-unit-orbit`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Proposition 8.5(iii), author copy printed p. 548: The explicit ring-valued equality underlying the source’s zero-divisor formulation.

**Acceptance.**

- This does not conclude a(0)=0 over a ring with zero divisors.
- For the trivial character, every a(0) satisfies the relation.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Koecher

**namespace.** TauCeti.HilbertCusp

### Constant-term vanishing with a regular multiplier

**Node:** `ShimuraCompactifications:C6/constant-term-vanishing`. **Declaration:** `constant_coefficient_eq_zero`. **Kind:** lemma. **Implementation:** unchecked.

If, for some u, multiplication by c(u,0)−1 on R has zero kernel, then the covariance relation forces a(0)=0.

**Hypotheses.**

- F is a totally real number field; τ_w denotes its signed real embedding at infinite place w. The native InfinitePlace value w(x) is |τ_w(x)|. U is a subgroup of the integer units, not a subgroup of F× with an assumed finite index.
- The zero-kernel hypothesis is required; c(u,0)≠1 alone is insufficient for a general coefficient ring.

**Construction or proof.**

1. Apply constant-term-covariance at the selected u.
2. Apply the zero-kernel hypothesis to a(0).

**Direct prerequisites.**

- `ShimuraCompactifications:C6/constant-term-covariance`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Proposition 8.5(iii), author copy printed p. 548: Coefficient-sensitive consequence; no assertion that every nonparallel character remains nontrivial modulo a prime.

**Acceptance.**

- In Z/4, the unit 3 differs from 1 and fixes the nonzero coefficient 2. Thus the nontrivial-character argument valid over a field does not apply to every R.
- Over a field, any multiplier different from one supplies the zero-kernel hypothesis.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Koecher

**namespace.** TauCeti.HilbertCusp

### A pole bound on a Hilbert cusp chart

**Node:** `ShimuraCompactifications:C6/meromorphic-cusp-support-bound`. **Declaration:** `meromorphic_cusp_support_bound`. **Kind:** lemma. **Implementation:** unchecked.

Under the stated Hilbert geometric hypotheses, a section of ω^κ over the open part of a completed regular cusp chart, which has finite pole order along its boundary, has Fourier support bounded below under every y in that cone. More explicitly, after a character-compatible local trivialization, write it as t^(−m)g, where t=x₁⋯x_r, m≥0, and g lies in the t-adic completed chart ring. Then a(ξ)≠0 implies ⟨ξ,y⟩≥−mΣ_i⟨m_i,y⟩, with m_i the r polynomial coordinate characters.

**Hypotheses.**

- Use the actual Hilbert moduli and toroidal model supplied by H1–H4 and C4–C5, not an arbitrary scheme record with the conclusions as fields. F is totally real of degree greater than one; n is prime to the discriminant and divides neither (2) nor (3); c is prime to n. Use a regular admissible cusp fan, finite modulo its unit group, and a Noetherian algebra R over o′[1/Δ], Δ=N(d n), containing the weight values and the required square roots for polarization descent. Adjoin the finite cyclotomic cusp coefficients by an étale cover when needed. ω^κ is the actual descended invariant-differential line; no general automorphic-bundle construction is duplicated here.
- The completion and localization are formed over R; an unproved interchange of completion with arbitrary tensor products is not used. The coefficient description of this completion and the meromorphic representation are requested generic inputs.

**Construction or proof.**

1. Import the C0 regular coordinate identification and the boundary-union ideal (t). Complete that R-algebra and use its proven admissible coefficient expansion.
2. Every exponent of g has nonnegative pairing with y in the cone; the Laurent coordinates pair to zero.
3. Multiplication by t^(−m) translates the support by −mΣ_i m_i. Coefficient injectivity yields the stated lower bound.

**Direct prerequisites.**

- `ShimuraCompactifications:C0/relative-regular-coordinates`
- `ShimuraCompactifications:C0/relative-boundary-coordinates`
- `ShimuraCompactifications:C4/formal-universal-degeneration`
- `AdicSpacesPartII:F0`
- `HilbertModularVarietiesAndShimuraCurves:H1`
- `HilbertModularVarietiesAndShimuraCurves:H3`
- `ShimuraCompactifications:C6/hilbert-boundary-formal-comparison`
- `ShimuraCompactifications:C6/hilbert-conormal-comparison`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Section 2 completed toric coordinates, author copy printed pp. 529–530; Theorem 8.3 proof, printed p. 547: Hilbert specialization of imported completed-coordinate algebra; not a new generic completion theorem.

**Acceptance.**

- For r=1 this is the usual lower bound on Laurent-series exponents.
- The union of coordinate boundary divisors is cut out by their product, whereas the sum ideal defines their intersection.
- The empty boundary chart r=0 is excluded from boundary-completion detection.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Koecher

**namespace.** TauCeti.HilbertCusp

### Positive support of meromorphic Hilbert expansions

**Node:** `ShimuraCompactifications:C6/hilbert-cusp-positive-support`. **Declaration:** `hilbert_cusp_support_positive`. **Kind:** theorem. **Implementation:** unchecked.

Under the Hilbert geometric hypotheses, every unit-equivariant meromorphic cusp expansion of an open Hilbert modular form has support contained in X_+∪{0}, where X=cbb′ is the actual character lattice at that cusp.

**Hypotheses.**

- Use the actual Hilbert moduli and toroidal model supplied by H1–H4 and C4–C5, not an arbitrary scheme record with the conclusions as fields. F is totally real of degree greater than one; n is prime to the discriminant and divides neither (2) nor (3); c is prime to n. Use a regular admissible cusp fan, finite modulo its unit group, and a Noetherian algebra R over o′[1/Δ], Δ=N(d n), containing the weight values and the required square roots for polarization descent. Adjoin the finite cyclotomic cusp coefficients by an étale cover when needed. ω^κ is the actual descended invariant-differential line; no general automorphic-bundle construction is duplicated here.
- The finite-index subgroup U consists of the stabilizer pairs (u,1); its action preserves X. Its weight and cyclotomic multipliers are units. The coefficient family on X is extended by zero to F.

**Construction or proof.**

1. Use H3’s exact stabilizer congruences and finite-index assertion; use H1’s lattice and trace dictionary, including the distinction between b and b′.
2. Choose an open positive dual vector y. Completeness of the admissible fan puts y in a cone, without asserting that the whole fan is finite.
3. Apply meromorphic-cusp-support-bound on that cone.
4. In a local trivialization of the coefficient line, apply bounded-cusp-support. The result is independent of the trivialization because its transition scalars are units.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/meromorphic-cusp-support-bound`
- `ShimuraCompactifications:C6/bounded-cusp-support`
- `HilbertModularVarietiesAndShimuraCurves:H1`
- `HilbertModularVarietiesAndShimuraCurves:H3`
- `ShimuraCompactifications:C0/relative-regular-coordinates`
- `ShimuraCompactifications:C0/relative-boundary-coordinates`
- `ShimuraCompactifications:C4/formal-universal-degeneration`
- `ShimuraCompactifications:C5`
- `ShimuraCompactifications:C6/uniformized-level-chart`
- `ShimuraCompactifications:C6/cusp-lattice-comparison`
- `ShimuraCompactifications:C6/hilbert-boundary-formal-comparison`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Theorem 8.3 proof, author copy printed p. 547: Declaration-level expansion of the coefficient argument, with its necessary hypotheses made explicit.

**Acceptance.**

- Both unramified level cusps (b′=b) and ramified level cusps (b′≠b) retain their actual exponent lattice.
- Ramification of a level cusp does not mean a base prime dividing the field discriminant.
- No finite flatness of a full p-adic tower is inferred from the finite cusp cyclotomic cover.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Koecher

**namespace.** TauCeti.HilbertCusp

### Arithmetic Koecher extension

**Node:** `ShimuraCompactifications:C6/arithmetic-koecher`. **Declaration:** `arithmetic_koecher`. **Kind:** theorem. **Implementation:** unchecked.

**Planet:** Arithmetic Koecher principle.

For g=[F:Q]>1, every coefficient algebra R over the discriminant-inverted weight base O′[1/Δ], and the actual Hilbert toroidal model, restriction Γ(Mbar_R,ωκ)→Γ(M_R,ωκ) is an isomorphism. No cusp vanishing is included.

**Hypotheses.**

- Dimitrov’s torsion-free tame level and admissible fan; Δ=N(d n). The weight κ is integral, the coefficient base contains its values and the square roots needed for polarization descent.
- The Noetherian case uses coherent completion detection. The general R case uses finite presentation and the requested qcqs filtered-colimit theorem; completion is not asserted to commute with arbitrary tensor products.

**Construction or proof.**

1. Use schematic density of the open immersion and invertibility of the line to obtain injectivity.
2. For an open section, use the requested finite-pole and formal-detection theorem to examine it on every completed cusp chart.
3. Apply hilbert-cusp-positive-support. Its exponents lie in every positive dual monoid, so the existing meromorphic expansion has no negative coordinate exponents and belongs to the completed regular ring.
4. Use the actual equivariant chart relation to glue these regular formal sections, then coherent formal detection to extend across the boundary. Uniqueness follows from injectivity.
5. Descend the finite-presentation model, line and section data to finitely generated subalgebras of R over O′[1/Δ]. Apply the Noetherian result there and use the requested qcqs H0/filtered-colimit comparison for both open and compactified schemes. This is the explicit supplier input for arbitrary coefficients.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/hilbert-cusp-positive-support`
- `AdicSpacesPartII:F0`
- `ShimuraCompactifications:C0/relative-boundary-coordinates`
- `ShimuraCompactifications:C4/formal-universal-degeneration`
- `ShimuraCompactifications:C5`
- `HilbertModularVarietiesAndShimuraCurves:H3`
- `SchemeAndStackFoundations:SF.1`
- `SchemeAndStackFoundations:SF.0`
- `ShimuraCompactifications:C6/hilbert-toroidal-model`
- `ShimuraCompactifications:C6/hilbert-conormal-comparison`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Theorem 8.3, author copy printed p. 547: Declaration-level expansion of the coefficient argument, with its necessary hypotheses made explicit.

**Acceptance.**

- For degree one the weakly holomorphic q^(−1) behavior is not eliminated by units; the theorem is not claimed for F=Q.
- The constant coefficient need not vanish.
- No ramified-base Hasse-ideal conclusion follows from a theorem over o′[1/Δ].
- Changing an admissible fan uses common-refinement comparison maps from C3, not equality of the chosen toroidal schemes.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Koecher

**namespace.** TauCeti.HilbertCusp

### Hilbert cusp forms and the boundary ideal

**Node:** `ShimuraCompactifications:C6/hilbert-boundary-constant`. **Declaration:** `hilbert_cuspidal_iff_constant_zero`. **Kind:** theorem. **Implementation:** unchecked.

**Planet:** Hilbert boundary-ideal criterion.

Under the Hilbert geometric hypotheses, let D be the scheme-theoretic relative toroidal boundary and I_D its ideal, locally (x₁⋯x_r). For s∈Γ(M̄_Σ,R,ω^κ), membership in the image of Γ(M̄_Σ,R,ω^κ⊗I_D) is equivalent to vanishing of its constant Fourier coefficient at every cusp component, after the stated étale coefficient and line-trivializing covers.

**Hypotheses.**

- Use the actual Hilbert moduli and toroidal model supplied by H1–H4 and C4–C5, not an arbitrary scheme record with the conclusions as fields. F is totally real of degree greater than one; n is prime to the discriminant and divides neither (2) nor (3); c is prime to n. Use a regular admissible cusp fan, finite modulo its unit group, and a Noetherian algebra R over o′[1/Δ], Δ=N(d n), containing the weight values and the required square roots for polarization descent. Adjoin the finite cyclotomic cusp coefficients by an étale cover when needed. ω^κ is the actual descended invariant-differential line; no general automorphic-bundle construction is duplicated here.
- This is the scalar Hilbert coefficient comparison on its zero-dimensional cusp bases. It is not the generic B5 theorem for higher-dimensional boundary coefficients, and it does not import B3 or B5 back into their C6 supplier.
- The Noetherian case is followed by the same filtered-colimit argument as arithmetic-koecher; it is not a pointwise or reduced-base test.

**Construction or proof.**

1. Use arithmetic-koecher to identify open forms with regular extended sections, and hilbert-cusp-positive-support for their expansions.
2. For ξ∈X_+, positive-exponents-on-charts makes every boundary coordinate exponent a positive integer. Hence each nonconstant monomial is divisible by t=x₁⋯x_r. Division by t preserves the requested completed-ring support condition.
3. The constant coefficient survives modulo (t). Thus an expansion is in (t) exactly when its constant coefficient is zero. This is a scheme-theoretic coefficient computation, valid with nilpotents.
4. Use the invertible-line boundary exact sequence, étale descent of its ideal and coherent formal detection at every cusp to obtain the asserted global equivalence.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/arithmetic-koecher`
- `ShimuraCompactifications:C6/positive-exponents-on-charts`
- `ShimuraCompactifications:C0/relative-boundary-coordinates`
- `AdicSpacesPartII:F0`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:SF.1`
- `ShimuraCompactifications:C6/hilbert-boundary-etale-charts`
- `ShimuraCompactifications:C6/hilbert-conormal-comparison`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Section 2 boundary coordinates, author copy printed pp. 529–530; equation (5) and Theorem 8.3, printed pp. 546–547: Explicit Hilbert-specific consequence of positive support and the boundary-ideal computation, not attributed as a separately numbered theorem in Dimitrov.

**Acceptance.**

- A section with nonzero constant term may satisfy Koecher extension but is not cuspidal.
- On a rank-one formal boundary chart the condition reduces to divisibility by q.
- Use every cusp component; a single scalar at one cusp does not replace all boundary restrictions.
- For a general Shimura variety a boundary coefficient can itself be a nonconstant form; that case remains owned by AutomorphicBundles:B5.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Koecher

**namespace.** TauCeti.HilbertCusp

### Hilbert cusp lattice and trace pairing

**Node:** `ShimuraCompactifications:C6/cusp-lattice-comparison`. **Declaration:** `hilbert_cusp_lattice_compare`. **Kind:** comparison. **Implementation:** unchecked.

For an H1 (R,n)-cusp with exact sequence 0→a*→L→b→0 and c=ab⁻¹, the level-image ideal b′⊃b gives character lattice X=cbb′=ab′. Its cocharacter lattice is X*, and its real pairing is Tr_F/Q. The unipotent stabilizer is X*, and the effective diagonal action is multiplication by u²ε.

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.
- Keep the chosen uniformization and finite cyclotomic action H_C separately from translations and diagonal units.

**Construction or proof.**

1. Apply the cusp classification to the primitive level vector; its projection determines b′.
2. Compute translations preserving that vector as (cbb′)* by Proposition 3.3(iv); identify toric monomials through the trace pairing.
3. Transport, rather than redefine, the H1 lattice and H3 stabilizer.

**Direct prerequisites.**

- `HilbertModularVarietiesAndShimuraCurves:H1`
- `HilbertModularVarietiesAndShimuraCurves:H3`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), §3, Definition 3.2 and Proposition 3.3(iv), printed pp. 531–535: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.

**Acceptance.**

- For b′=b one obtains X=cb²; for b′≠b this lattice generally changes.
- The phase quotient uses (ab)*/(ab′)*, not the inverse quotient.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Admissible Hilbert cusp fans

**Node:** `ShimuraCompactifications:C6/admissible-fan-specialization`. **Declaration:** `hilbert_admissible_fan_compare`. **Kind:** comparison. **Implementation:** unchecked.

C0’s arithmetic fan at a cusp identifies with a complete rational polyhedral decomposition of the open positive cone in X*⊗R, together with zero, locally finite away from zero, stable under the effective cusp-unit action, with finitely many cone orbits and compatibility with cusp isomorphisms.

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.

**Construction or proof.**

1. Use the lattice comparison and transport the signed positive cone.
2. Match the C0 arithmetic admissibility conditions with Definition 7.1; retain finite orbit data, not a finite fan in the whole cone.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/cusp-lattice-comparison`
- `ShimuraCompactifications:C0/arithmetic-admissible-fan`
- `HilbertModularVarietiesAndShimuraCurves:H3`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Definition 7.1 and proof of Theorem 7.2, printed pp. 541–542: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.

**Acceptance.**

- In degree >1 finitely many unit orbits need not mean finitely many cones.
- A fan regular for (cb²)* need not be regular for (cbb′)* at a level-ramified cusp (Remark 7.3).

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Integral uniformization exponents

**Node:** `ShimuraCompactifications:C6/trace-exponent-integral`. **Declaration:** `UniformizationPrototype.trace_exponent_integral`. **Kind:** lemma. **Implementation:** unchecked.

For Z-submodules A,B of a number field K, nB⊆A, ξ∈B and x∈traceDual_Z/Q(A), there is an integer m with m=n Tr_K/Q(ξx).

**Hypotheses.**

- n is a natural number; these are native Mathlib submodules, not newly defined cusp carriers.

**Construction or proof.**

1. Pair x with nξ∈A using the existing trace-dual membership criterion.
2. Use Q-linearity of trace and commutativity to obtain the integer witness.

**Direct prerequisites.**

- `mathlib:Submodule.traceDual`
- `mathlib:Submodule.mem_traceDual`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Proposition 4.1(ii), printed p. 537: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.

**Acceptance.**

- A=Z, B=(1/3)Z, n=3, ξ=1/3, x=1 gives m=1.
- Using n=2 for the same B fails to clear the denominator.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Congruence under a uniformization lift

**Node:** `ShimuraCompactifications:C6/trace-exponents-congruent`. **Declaration:** `UniformizationPrototype.trace_exponents_congruent`. **Kind:** lemma. **Implementation:** unchecked.

If ξ∈B and x′−x∈traceDual(B), integer witnesses m=nTr(ξx), m′=nTr(ξx′) differ by n times an integer.

**Hypotheses.**

- K is a number field, B a Z-submodule, n∈N.

**Construction or proof.**

1. Take the integer trace witness for ξ(x′−x).
2. Subtract the two exponent identities in Q and use injectivity of Z→Q.

**Direct prerequisites.**

- `mathlib:Submodule.mem_traceDual`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Proposition 4.1(ii), printed p. 537: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.

**Acceptance.**

- The dual must be that of B, not the smaller module A.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Uniformization phases are well defined

**Node:** `ShimuraCompactifications:C6/phase-independent-of-lift`. **Declaration:** `UniformizationPrototype.phase_independent_of_lift`. **Kind:** lemma. **Implementation:** unchecked.

With the previous exponent witnesses and ζ∈R× satisfying ζ^n=1, ζ^m′=ζ^m.

**Hypotheses.**

- R is any commutative ring; primitive order n is unnecessary.

**Construction or proof.**

1. Use trace-exponents-congruent and the integer-power laws in the unit group.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/trace-exponents-congruent`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Proposition 4.1(ii), printed p. 537: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.

**Acceptance.**

- Roots can specialize to smaller order; the equality still holds over nonreduced R.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Additivity of uniformization phases

**Node:** `ShimuraCompactifications:C6/phase-additive-in-character`. **Declaration:** `UniformizationPrototype.phase_additive_in_character`. **Kind:** lemma. **Implementation:** unchecked.

For integer witnesses mξ=nTr(ξx), mη=nTr(ηx), msum=nTr((ξ+η)x), ζ^msum=ζ^mξ ζ^mη.

**Hypotheses.**

- ζ is a unit of a commutative ring.

**Construction or proof.**

1. Trace additivity and injectivity of Z→Q give msum=mξ+mη.
2. Apply the integer-power addition law.

**Direct prerequisites.**

- `mathlib:Submodule.traceDual`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Proposition 4.1(ii), printed p. 537: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.

**Acceptance.**

- Negative exponents are taken in R×; natural powers do not describe the full lattice.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Uniformization phase character

**Node:** `ShimuraCompactifications:C6/uniformization-phase-character`. **Declaration:** `UniformizationPrototype.tracePhase`. **Kind:** construction. **Implementation:** unchecked.

Given native Z-submodules A,B of K, nB⊆A, x∈traceDual(A) and ζ∈R× with ζ^n=1, construct the additive character B→Additive(R×) sending ξ to ζ^m where m=nTr(ξx).

**Hypotheses.**

- K is a number field; R any commutative ring. All exponent witnesses are integral; no choice of a generator of the fractional ideal B.
- For the geometric specialization use A=ab, B=ab′, n the exponent of b′/b.

**Construction or proof.**

1. Obtain integral exponent witnesses by trace-exponent-integral.
2. Independence of the integer witness follows from Z→Q injectivity; phase-additive-in-character supplies the homomorphism laws.
3. The phase depends only on x modulo traceDual(B) by phase-independent-of-lift.

**Planning API.**

- `UniformizationPrototype.tracePhase_apply` (characterisation): For ξ∈B and an integer witness m=nTr(ξx), evaluation equals ζ^m.
- `UniformizationPrototype.tracePhase_zero` (simp): Evaluation at the zero character is one in R×.
- `UniformizationPrototype.tracePhase_add` (relation): Evaluation at ξ+η equals the product of the evaluations at ξ and η.
- `UniformizationPrototype.tracePhase_lift` (compatibility): Changing x by traceDual(B) leaves the character unchanged.
- `UniformizationPrototype.tracePhase_trivial_root` (simp): For ζ=1 the character has every value one.
- `UniformizationPrototype.tracePhase_map` (functoriality): A coefficient ring map transports the character by its induced map on units, without a primitivity hypothesis.

**Unit tests.**

- `UniformizationPrototype.phase_third_denominator` (computation): For K=Q, A=Z, B=(1/3)Z, n=3 and x=1, evaluation at 1/3 is ζ (for any ζ³=1).
- `UniformizationPrototype.phase_zero_character` (degenerate): For every datum the zero character evaluates to one, including the zero coefficient ring.
- `UniformizationPrototype.phase_dual_shift` (compatibility): For K=Q, A=Z, B=(1/3)Z, x=1 and x′=4, the characters are equal when ζ³=1, since 3 belongs to traceDual(B).
- `UniformizationPrototype.phase_wrong_dual` (non-example): For A=Z, B=(1/4)Z, n=4, ζ=2 in (Z/5)×, x=0 and x′=1, the evaluations at 1/4 are 1 and 2; quotienting by traceDual(A) would be wrong.
- `UniformizationPrototype.phase_nonprimitive` (compatibility): For any datum with n=4 over Z/8 and ζ=3, evaluation equals 3^m, although this root has order 2.

**Consumers.**

- `Dimitrov Proposition 4.1(ii)`: Describes how changing the uniformization acts on toric monomials.
- `Dimitrov equation (5) and C6/hilbert-cusp-positive-support`: Ensures cyclotomic coefficient multipliers are units, with phase one at the zero exponent.
- `HilbertModularVarietiesAndShimuraCurves:H5 and OverconvergentAutomorphicForms:O6`: Keeps the q-expansion law compatible with coefficient specialization and ramified level cusps.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/trace-exponent-integral`
- `ShimuraCompactifications:C6/phase-independent-of-lift`
- `ShimuraCompactifications:C6/phase-additive-in-character`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Proposition 4.1(ii) and equation (5), printed pp. 537, 546: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.

**Acceptance.**

- Use A=ab and B=ab′ in the actual H1 chart; this character alone does not construct a cusp action.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### The universal family on a Hilbert cusp chart

**Node:** `ShimuraCompactifications:C6/uniformized-level-chart`. **Declaration:** `hilbert_uniformized_level_chart`. **Kind:** comparison. **Implementation:** unchecked.

Over B[ζ_e], where e is the exponent of b′/b, the C4 Mumford family on the C0 toric chart carries the H1 c-polarization and µ_n level structure; on the open abelian locus it is the pullback of the universal fine HBAV. Changing uniformization x∈(ab)*/(ab′)* acts by q^ξ↦ζ_e^{eTr(ξx)}q^ξ.

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.

**Construction or proof.**

1. Import C4’s family and its level exact sequence; use the H1 chosen lift of the projected level data.
2. Identify the phase with tracePhase; verify faces and cusp-unit/cyclotomic changes by Proposition 4.1(iii).

**Direct prerequisites.**

- `ShimuraCompactifications:C6/cusp-lattice-comparison`
- `ShimuraCompactifications:C6/uniformization-phase-character`
- `ShimuraCompactifications:C4/formal-universal-degeneration`
- `ShimuraCompactifications:C4/endomorphism-extension`
- `ShimuraCompactifications:C4/boundary-level-comparison`
- `HilbertModularVarietiesAndShimuraCurves:H1`
- `HilbertModularVarietiesAndShimuraCurves:H3`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Proposition 4.1(i)–(iii), printed pp. 536–537: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.

**Acceptance.**

- At b′=b, e=1 and the cyclotomic phase is trivial.
- A ramified level cusp is a property of b′/b; it does not mean that the residue prime ramifies in F.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Fine Hilbert toroidal compactification

**Node:** `ShimuraCompactifications:C6/hilbert-toroidal-model`. **Declaration:** `hilbert_toroidal_model_exists`. **Kind:** theorem. **Implementation:** unchecked.

**Planet:** Hilbert toroidal compactification.

For an admissible cusp fan system Σ, there is a scheme Mbar¹_Σ over B, an open immersion M¹→Mbar¹_Σ and the prescribed completed cusp-chart identifications compatible with the universal HBAV. This pair is unique up to a unique isomorphism fixing the open and formal data.

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.

**Construction or proof.**

1. Form the finite representative chart cover and its actual face/unit/cyclotomic relation.
2. Apply the requested formal effectivity/descent theorem, verifying its two valuative conditions by Raynaud–Mumford compatibility and the level chart.
3. The formal data determine the algebraization under the requested schematic-density and uniqueness hypotheses.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/admissible-fan-specialization`
- `ShimuraCompactifications:C6/uniformized-level-chart`
- `ShimuraCompactifications:C5`
- `AdicSpacesPartII:F0`
- `SchemeAndStackFoundations:SF.1`
- `NeronModelsAndSemistableAbelianVarieties:R11.3`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Theorem 7.2(i), §§5–6, printed pp. 538–543: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.

**Acceptance.**

- No smoothness at discriminant primes is included.
- Replacing each ramified cusp lattice by the underlying unlevelled lattice fails Remark 7.3.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Polarization quotients of toroidal models

**Node:** `ShimuraCompactifications:C6/toroidal-polarization-quotient`. **Declaration:** `hilbert_toroidal_polarization_quotient`. **Kind:** theorem. **Implementation:** unchecked.

For a fan system invariant under H3’s tame finite polarization group, its action extends to Mbar¹_Σ, and the quotient Mbar_Σ compactifies M with the formal unit/cyclotomic quotient appropriate to G. For Dimitrov’s torsion-free tame situation Mbar¹_Σ→Mbar_Σ remains finite étale.

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.
- For BHW scalar tame N this group is Δ(N)=O×,+/((1+NO)×)²; use H3’s conventions rather than identifying all D or all p-level groups with it.

**Construction or proof.**

1. The chart maps are equivariant by Proposition 4.1(iii).
2. The admissible fan is invariant under the full cusp action; apply effective quotient descent to the properly acting free toroidal action.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/hilbert-toroidal-model`
- `HilbertModularVarietiesAndShimuraCurves:H3`
- `SchemeAndStackFoundations:SF.1`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Theorem 7.2(ii), author copy printed pp. 542–543: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.
- [BHW-2023](https://www.numdam.org/item/10.5802/aif.3560.pdf), Proposition 8.4, printed p. 1766: The finite tame polarization quotient on the open Hilbert variety; extension and boundary freeness are supplied by Dimitrov Theorem 7.2(ii), not by this open torsor statement.

**Acceptance.**

- This does not make the corresponding map of minimal compactifications étale.
- Full p-level G* structures need not be preserved by all positive units.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Formal Hilbert cusp neighbourhoods

**Node:** `ShimuraCompactifications:C6/hilbert-boundary-formal-comparison`. **Declaration:** `hilbert_boundary_formal_compare`. **Kind:** comparison. **Implementation:** unchecked.

The boundary completion of Mbar_Σ is the disjoint union over cusp components of the C0 completed toric union divided by the effective cusp units, with coefficient algebra B[ζ_e]^{H_C}. On the fine model use U_C,1 and H_C,1. The root action and weight line are transported together.

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.

**Construction or proof.**

1. Read the completed presentation in Theorem 7.2 on the actual descended chart relation.
2. Apply toroidal-polarization-quotient and identify the cusp lattice and cyclotomic phase.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/hilbert-toroidal-model`
- `ShimuraCompactifications:C6/toroidal-polarization-quotient`
- `ShimuraCompactifications:C6/cusp-lattice-comparison`
- `ShimuraCompactifications:C0/relative-torus-embedding`
- `ShimuraCompactifications:C0/relative-boundary-coordinates`
- `HilbertModularVarietiesAndShimuraCurves:H3`
- `AdicSpacesPartII:F0`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Theorem 7.2(i),(ii), printed pp. 541–543: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.

**Acceptance.**

- The infinite arithmetic unit quotient is not a finite-group quotient of one affine chart.
- Keep formal completions and arbitrary coefficient tensor products distinct.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Étale toric charts at Hilbert boundary

**Node:** `ShimuraCompactifications:C6/hilbert-boundary-etale-charts`. **Declaration:** `hilbert_boundary_etale_toric`. **Kind:** theorem. **Implementation:** unchecked.

Near the boundary the open immersion M→Mbar is étale locally the C0 relative torus embedding S_C→S_σ for its actual lattice X. Nonopen strata have the toric description after an algebraically closed field base change of characteristic prime to N(n).

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.

**Construction or proof.**

1. The effective arithmetic cusp units act freely on nonopen strata.
2. Use the formal identification and the requested algebraization of boundary-local étale charts.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/hilbert-boundary-formal-comparison`
- `ShimuraCompactifications:C0/relative-torus-embedding`
- `ShimuraCompactifications:C0/relative-face-open`
- `AdicSpacesPartII:F0`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Corollary 7.4, printed p. 544: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.

**Acceptance.**

- Freeness on toroidal strata does not imply freeness on a contracted minimal cusp.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Smooth Hilbert refinements on the good base

**Node:** `ShimuraCompactifications:C6/hilbert-regular-refinement`. **Declaration:** `hilbert_regular_refinement_smooth`. **Kind:** theorem. **Implementation:** unchecked.

An admissible regular refinement with respect to each actual X* makes Mbar_Σ smooth over Z[1/Δ]. Refinement maps agree with C3 on the open and on completed cusp charts.

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.

**Construction or proof.**

1. Use C0’s regular coordinates and invariant locally finite refinement.
2. Combine the smooth H1 open model on the Δ-inverted base with the étale boundary charts; C3 supplies refinement morphisms.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/hilbert-boundary-etale-charts`
- `ShimuraCompactifications:C0/smooth-projective-refinement`
- `ShimuraCompactifications:C3/refinement-map`
- `HilbertModularVarietiesAndShimuraCurves:H1`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Corollary 7.5 and Remark 7.3, printed pp. 543–544: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.

**Acceptance.**

- Smoothness over Z[1/N(n)] is not asserted when a remaining prime divides Δ_F.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Universal Hilbert semiabelian extension

**Node:** `ShimuraCompactifications:C6/hilbert-semiabelian-extension`. **Declaration:** `hilbert_semiabelian_extension`. **Kind:** theorem. **Implementation:** unchecked.

**Planet:** Universal semiabelian extension.

The universal fine HBAV on M¹ has a unique semiabelian group scheme extension G over Mbar¹_Σ with O-action. It is a torus over the boundary, and its chart pullbacks are the C4 Mumford families.

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.

**Construction or proof.**

1. Descend C4’s semiabelian chart families by their face and cusp equivariance.
2. Glue with the universal abelian family on the open. Apply the requested uniqueness theorem for semiabelian extensions over the normal dense model.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/hilbert-toroidal-model`
- `ShimuraCompactifications:C6/uniformized-level-chart`
- `ShimuraCompactifications:C4/degeneration-effectivity`
- `ShimuraCompactifications:C4/homomorphism-extension`
- `ShimuraCompactifications:C4/endomorphism-extension`
- `SchemeAndStackFoundations:SF.1`
- `NeronModelsAndSemistableAbelianVarieties:R11.3`
- `NeronModelsAndSemistableAbelianVarieties:R11.3/rigid-uniformisation`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Proposition 7.6, printed p. 544: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.

**Acceptance.**

- The fine family has O-action; the coarse polarization quotient is not asserted to carry a universal polarized HBAV.
- Boundary torus rank is g; its p-power torsion has multiplicative rank p^(ng), not constant abelian height 2g.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Hilbert differentials on degeneration charts

**Node:** `ShimuraCompactifications:C6/hilbert-conormal-comparison`. **Declaration:** `hilbert_conormal_compare`. **Kind:** comparison. **Implementation:** unchecked.

The invariant differential sheaf e*Ω¹_G/Mbar equals the C4 chart differential module and restricts to the HBAV Hodge bundle on M¹. It has Z-rank g everywhere, O⊗O_Mbar-rank one on the Rapoport locus and at split toric boundary charts; after Δ inversion its character-weight lines are the H3 character-weight lines obtained from these differentials. This comparison is exported to B3 for its canonical-extension construction and to H5 for its classical tests.

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.

**Construction or proof.**

1. Identify differentials of the torus through its character lattice, and glue by semiabelian-extension uniqueness.
2. Compare to the H1/H2 Hodge module on the open and to the H3 weight descent on the Δ-inverted base.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/hilbert-semiabelian-extension`
- `ShimuraCompactifications:C4/formal-universal-degeneration`
- `HilbertModularVarietiesAndShimuraCurves:H1`
- `HilbertModularVarietiesAndShimuraCurves:H2`
- `HilbertModularVarietiesAndShimuraCurves:H3`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Proposition 7.6 and opening of section 8, author copy printed pp. 544–546: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.
- [BHW-2023](https://www.numdam.org/item/10.5802/aif.3560.pdf), Section 7.1, printed pp. 1759–1760: Identifies the natural invariant differentials of the semiabelian extension. The subsequently modified integral lattice has a different owner and is not identified with this sheaf.

**Acceptance.**

- At ramified primes away from the Rapoport locus O-rank-one local freeness of the natural lattice is not automatic.
- T5’s modified ω^int is not identified with this natural integral lattice.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Proper Hilbert toroidal models

**Node:** `ShimuraCompactifications:C6/hilbert-toroidal-proper`. **Declaration:** `hilbert_toroidal_proper`. **Kind:** theorem. **Implementation:** unchecked.

Mbar¹_Σ and Mbar_Σ are proper over B for a complete admissible fan system.

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.

**Construction or proof.**

1. Apply semistable reduction after a finite extension of the valuation field.
2. Use Raynaud’s polarized period lattice to obtain a positive valuation vector and an appropriate cone modulo units.
3. The C4 chart extends the map over the valuation ring; use the requested valuative descent to conclude properness.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/hilbert-toroidal-model`
- `ShimuraCompactifications:C6/toroidal-polarization-quotient`
- `ShimuraCompactifications:C6/admissible-fan-specialization`
- `ShimuraCompactifications:C4/degeneration-effectivity`
- `ShimuraCompactifications:C5`
- `NeronModelsAndSemistableAbelianVarieties:R11.3`
- `NeronModelsAndSemistableAbelianVarieties:R11.3/finite-separable-semistable-extension`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Theorem 7.7, printed pp. 544–545: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.

**Acceptance.**

- Properness does not assert projectivity of every toroidal fan.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Semiample determinant Hodge line

**Node:** `ShimuraCompactifications:C6/hilbert-hodge-semiampleness`. **Declaration:** `hilbert_hodge_semiample`. **Kind:** theorem. **Implementation:** unchecked.

A positive power of the determinant Hodge line λ=det_Z(e*Ω¹_G) on Mbar¹_Σ is generated by its global sections.

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.
- Use the determinant line over B, not a nonparallel weight line only defined after Δ inversion.

**Construction or proof.**

1. Specialize the C5 semi-ampleness theorem for the imported polarized semiabelian family.
2. Check the determinant convention λ=ω^t on the rank-one O-locus.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/hilbert-semiabelian-extension`
- `ShimuraCompactifications:C6/hilbert-toroidal-proper`
- `ShimuraCompactifications:C5`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Theorem 8.6(i) and proof citing [9] IX.2.1 / [7] V.2.1, printed pp. 548–549: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.

**Acceptance.**

- A boundary-effective divisor twist is not part of λ.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Hilbert minimal contraction

**Node:** `ShimuraCompactifications:C6/hilbert-minimal-contraction`. **Declaration:** `hilbert_minimal_contraction`. **Kind:** theorem. **Implementation:** unchecked.

**Planet:** Hilbert minimal compactification.

The determinant section ring Rλ=⊕_{k≥0}Γ(Mbar¹_Σ,λ^k) defines a surjective contraction π:Mbar¹_Σ→M^{1,min}=Proj_B Rλ. The minimal scheme is independent of Σ.

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.
- For g>1 use arithmetic Koecher to identify the section ring independently of the fan; degree one is treated by the modular comparison.

**Construction or proof.**

1. Use semi-ampleness and the C5 normalized section-ring contraction.
2. Identify the Veronese Proj with Proj Rλ via the requested generic comparison.
3. Use Koecher on the Δ-inverted locus and the C5 integral section-ring independence on B; do not infer arbitrary integral independence merely from generic equality.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/hilbert-hodge-semiampleness`
- `ShimuraCompactifications:C6/arithmetic-koecher`
- `ShimuraCompactifications:C5`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Theorem 8.6(ii) and proof, printed pp. 548–549: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.

**Acceptance.**

- An isomorphism over Q alone does not identify integral minimal models.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Finite generation of the Hilbert section ring

**Node:** `ShimuraCompactifications:C6/hilbert-minimal-finite-generation`. **Declaration:** `hilbert_minimal_sectionRing_finite`. **Kind:** theorem. **Implementation:** unchecked.

Rλ is a finitely generated B-algebra.

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.

**Construction or proof.**

1. Use C5’s normalization/Veronese construction after a globally generated power.
2. Import its finite-generation and integral-closure theorem, including finiteness of the full section ring over the chosen Veronese; the bare word integral does not establish finite type.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/hilbert-hodge-semiampleness`
- `ShimuraCompactifications:C5`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Theorem 8.6(iii) and proof, printed pp. 548–549: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.

**Acceptance.**

- Retain finiteness over the Veronese as a supplier obligation.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Normal projective Hilbert minimal models

**Node:** `ShimuraCompactifications:C6/hilbert-minimal-normal-projective`. **Declaration:** `hilbert_minimal_normal_projective`. **Kind:** theorem. **Implementation:** unchecked.

M^{1,min} is a normal projective finite-type B-scheme; π is proper birational with connected fibres and π_*O=O.

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.

**Construction or proof.**

1. Apply the C5 normal section-ring construction and finite generation.
2. Use properness and Zariski connectedness from the generic normal contraction, with its schematic-density hypotheses.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/hilbert-minimal-contraction`
- `ShimuraCompactifications:C6/hilbert-minimal-finite-generation`
- `ShimuraCompactifications:C6/hilbert-toroidal-proper`
- `ShimuraCompactifications:C5`
- `SchemeAndStackFoundations:SF.0`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Theorem 8.6(iii) and proof, printed pp. 548–549: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.

**Acceptance.**

- Connected fibres are a theorem, not the definition of the contraction.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Polarization quotients of minimal models

**Node:** `ShimuraCompactifications:C6/minimal-polarization-quotient`. **Declaration:** `hilbert_minimal_polarization_quotient`. **Kind:** theorem. **Implementation:** unchecked.

The H3 finite tame polarization action on the section ring induces an action on M^{1,min}; the quotient M^{min} is normal projective finite type over B, and the contraction descends. The action can stabilize minimal cusps, so the fine-to-coarse minimal map is not generally étale.

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.

**Construction or proof.**

1. Transport the linearized determinant section ring under the H3 action.
2. Apply C5/SF1 finite projective quotient and normalization theorems, and the equivariance of π.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/toroidal-polarization-quotient`
- `ShimuraCompactifications:C6/hilbert-minimal-normal-projective`
- `ShimuraCompactifications:C5`
- `HilbertModularVarietiesAndShimuraCurves:H3`
- `SchemeAndStackFoundations:SF.1`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Theorem 8.6(iii) and proof, printed pp. 548–549: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.

**Acceptance.**

- A nontrivial cusp stabilizer can arise after contraction even when the toroidal action is free.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Cyclotomic cusps of Hilbert minimal models

**Node:** `ShimuraCompactifications:C6/hilbert-minimal-cusps`. **Declaration:** `hilbert_minimal_cusps`. **Kind:** theorem. **Implementation:** unchecked.

The contraction identifies M with a dense open of M^{min}. Its reduced boundary is the finite étale B-scheme ⨿_C Spec(B[ζ_e]^{H_C}), with e the exponent of b′/b; it has relative codimension g, hence at least two when g>1.

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.
- The cusp subscheme here has the source’s finite étale structure. Boundary ideals under coefficient base change use this scheme, not only its geometric points.

**Construction or proof.**

1. Apply the C5 description of contracted toric boundary fibres and formal functions.
2. Use the H3 finite cyclotomic quotient to compute the cusp rings; e is invertible on B.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/hilbert-boundary-formal-comparison`
- `ShimuraCompactifications:C6/hilbert-minimal-normal-projective`
- `ShimuraCompactifications:C6/minimal-polarization-quotient`
- `ShimuraCompactifications:C5`
- `HilbertModularVarietiesAndShimuraCurves:H3`
- `AdicSpacesPartII:F0`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Theorem 8.6(iv), printed p. 548: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.

**Acceptance.**

- For e=1 the component is Spec B.
- A cusp component is not in general a B-rational geometric point.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Connected boundary fibres of Hilbert contraction

**Node:** `ShimuraCompactifications:C6/hilbert-minimal-boundary-fibres`. **Declaration:** `hilbert_minimal_boundary_fibres`. **Kind:** theorem. **Implementation:** unchecked.

Each minimal cusp has inverse image one connected toroidal boundary component. Every other geometric fibre of π is one point of the open Hilbert variety.

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.

**Construction or proof.**

1. Use the C5 constancy of the abelian part along contraction fibres and connectedness.
2. At a Hilbert cusp the abelian part is zero, so the whole boundary component contracts to its cyclotomic cusp.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/hilbert-minimal-normal-projective`
- `ShimuraCompactifications:C6/hilbert-minimal-cusps`
- `ShimuraCompactifications:C6/hilbert-semiabelian-extension`
- `ShimuraCompactifications:C5`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Theorem 8.6(v) and proof using [7] V.2.2, printed pp. 548–549: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.

**Acceptance.**

- Do not replace connected boundary components by separate fan cones.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Toroidal completion over a minimal cusp

**Node:** `ShimuraCompactifications:C6/hilbert-minimal-formal-comparison`. **Declaration:** `hilbert_minimal_formal_compare`. **Kind:** comparison. **Implementation:** unchecked.

Completion of Mbar along π⁻¹(C) is the completed toric union divided by the cusp units with coefficient ring B[ζ_e]^{H_C}; this agrees with the toroidal completion. At e=1 the cyclotomic factor is B.

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.

**Construction or proof.**

1. Combine the boundary-fibre theorem with the toroidal formal identification.
2. Apply the requested formal-functions theorem for the contraction and coefficient descent; do not assert that the minimal local ring is a single regular toric chart.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/hilbert-minimal-boundary-fibres`
- `ShimuraCompactifications:C6/hilbert-boundary-formal-comparison`
- `AdicSpacesPartII:F0`
- `HilbertModularVarietiesAndShimuraCurves:H3`
- `AdicSpacesPartII:F0/completion-of-morphism`
- `AdicSpacesPartII:F0/theorem-on-formal-functions`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Theorem 8.6(v), printed p. 548: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.

**Acceptance.**

- The formal completion is on the toroidal inverse image, not an identification of the minimal model with a torus embedding.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Weights extending to the Hilbert minimal model

**Node:** `ShimuraCompactifications:C6/hilbert-minimal-weight-extension`. **Declaration:** `hilbert_minimal_weight_extension`. **Kind:** theorem. **Implementation:** unchecked.

For g>1 and integral weight κ over O′[1/Δ], the canonical weight line on M extends to an invertible sheaf on M^{min} if and only if κ is parallel. The pushforward π_*ωκ is coherent for every κ.

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.
- This is the arithmetic weight-base statement of Theorem 8.6(vi); no assertion of the converse over an arbitrary special-fibre quotient of O′ is made.

**Construction or proof.**

1. Use C5 coherent proper pushforward and normal/codimension-two extension.
2. Use the H3 cusp-unit action on the trivialized line. For nonparallel κ choose a place of maximal component and the finite-index contracting unit at that place; the weighted logarithmic sum is strictly positive because another component is smaller. Thus the character cannot be trivial. For parallel κ use the norm/polarization law in H3 and C5’s descended determinant line.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/hilbert-conormal-comparison`
- `ShimuraCompactifications:C6/hilbert-minimal-cusps`
- `ShimuraCompactifications:C6/hilbert-minimal-formal-comparison`
- `ShimuraCompactifications:C5`
- `HilbertModularVarietiesAndShimuraCurves:H3`
- `SchemeAndStackFoundations:SF.0`
- `ShimuraCompactifications:C6/finite-index-cusp-unit-contraction`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Theorem 8.6(vi) and proof, printed pp. 548–549: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.

**Acceptance.**

- Nonparallel weights can have reduced characters become trivial in a special coefficient ring; that does not prove invertible extension over the arithmetic weight base.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### The geometric Hilbert q-expansion map

**Node:** `ShimuraCompactifications:C6/hilbert-q-expansion-comparison`. **Declaration:** `hilbert_qExpansion_compare`. **Kind:** comparison. **Implementation:** unchecked.

The q-expansion in Dimitrov Definition 8.4 of a section at an H1 uniformized cusp agrees with its restriction to the C0 completed toric chart, with coefficients in a(κ)=(a⊗O′[1/Δ])^(-κ) and the H3 weight/cyclotomic covariance. A scalar coefficient family is obtained only after trivializing this line.

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.
- g>1 for Koecher automatic regularity; the line and coefficient base include ζ_e.

**Construction or proof.**

1. Use the actual universal level chart and weight-line trivialization (5).
2. Apply hilbert-cusp-positive-support and identify the canonical completed restriction with the source’s evaluation map. Export this comparison to H5/B4; neither downstream consumer is a supplier.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/uniformized-level-chart`
- `ShimuraCompactifications:C6/hilbert-conormal-comparison`
- `ShimuraCompactifications:C6/hilbert-cusp-positive-support`
- `HilbertModularVarietiesAndShimuraCurves:H3`
- `ShimuraCompactifications:C0/relative-regular-coordinates`
- `AdicSpacesPartII:F0`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Definition 8.4, equation (5), printed pp. 546–547: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.

**Acceptance.**

- Changing uniformization changes the expansion by tracePhase, not by a new modular form.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Hilbert q-expansion detection with coefficient modules

**Node:** `ShimuraCompactifications:C6/hilbert-q-expansion-module-injective`. **Declaration:** `hilbert_qExpansion_module_injective`. **Kind:** lemma. **Implementation:** unchecked.

On the fixed smooth geometrically connected component over the Δ-inverted weight base A₀ (a localized number ring containing the character and cyclotomic values), completion at the chosen uniformized cusp detects sections of ωκ⊗_{A₀}N for every A₀-module N. The target consists of the actual completed coefficient-line expansions, not a tensor product identified with formal series without proof.

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.
- No claim of injectivity at one cusp for a disjoint union of untested components.
- Use the smooth Δ-inverted model, not a ramified-base singular local model. The line is invertible and the underlying model is flat over A₀.

**Construction or proof.**

1. For finitely generated coefficients over the Dedekind base, reduce to a finite projective module and quotients by prime powers. Use geometric irreducibility of the smooth fibres and schematic density on each thickening to detect a section by the boundary completion. These generic density/completion facts are precise SF.0/F0 requests.
2. Write N as the directed union of its finitely generated submodules. The section descends to a submodule N₀ by the qcqs H0 colimit theorem. The invertible coefficient line a(κ) is flat over A₀, so N₀⊂N induces injective coefficient maps. Thus zero expansion over N already means zero expansion over N₀, where finite-module detection applies. This needs no interchange of a full power-series module with filtered colimits.
3. At a ramified cusp retain the cyclotomic cover and the unit-valued trace phase in the coefficient line; faithful cover descent reduces to the same detection statement.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/hilbert-q-expansion-comparison`
- `HilbertModularVarietiesAndShimuraCurves:H1`
- `SchemeAndStackFoundations:SF.0`
- `AdicSpacesPartII:F0`

**Source match.**

- [DIMITROV-TILOUINE-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad16-DiTi.pdf), §7, Definition 7.2 and Proposition 7.3 proof, printed pp. 585–586: The companion gives the abelian-coefficient injectivity argument and explicitly assumes an inclusion of coefficient algebras; its displayed chart presentation is restricted to nonramified cusps. Dimitrov §8 supplies the general cusp presentation, whose unit phase preserves the argument.
- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Proposition 8.5(i), printed p. 547 (proof delegated to [6], §7): Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.

**Acceptance.**

- Detection is for a fixed weight; the direct sum of all weight spaces is not injective after reduction (a Hasse form and 1 can have the same expansion).
- Torsion coefficient modules and infinitesimal thickenings are retained. Testing only reduced geometric points is insufficient.
- No assertion that an infinite product of coefficients commutes with filtered colimits is used.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Hilbert q-expansion injectivity

**Node:** `ShimuraCompactifications:C6/hilbert-q-expansion-injective`. **Declaration:** `hilbert_qExpansion_injective`. **Kind:** theorem. **Implementation:** unchecked.

At a uniformized cusp in the fixed geometrically connected c-component, the q-expansion map for ωκ is injective for every coefficient algebra R over O′[1/Δ,ζ_e].

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.
- No claim of injectivity at one cusp for a disjoint union of untested components.

**Construction or proof.**

1. Apply module-coefficient detection to N=R, with its A₀-module structure.
2. Use the completed-chart comparison to obtain the source’s fixed-weight q-expansion principle.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/hilbert-q-expansion-module-injective`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Proposition 8.5(i), printed p. 547 (proof delegated to [6], §7): Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.
- [DIMITROV-TILOUINE-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad16-DiTi.pdf), §7, Definition 7.2 and Proposition 7.3 proof, printed pp. 585–586: The companion gives the abelian-coefficient injectivity argument and explicitly assumes an inclusion of coefficient algebras; its displayed chart presentation is restricted to nonramified cusps. Dimitrov §8 supplies the general cusp presentation, whose unit phase preserves the argument.

**Acceptance.**

- Testing only one component cannot detect a form supported on another component.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Coefficient descent from Hilbert q-expansions

**Node:** `ShimuraCompactifications:C6/hilbert-q-expansion-coefficient-descent`. **Declaration:** `hilbert_qExpansion_coefficient_descent`. **Kind:** theorem. **Implementation:** unchecked.

For an inclusion R⊂R′ of coefficient algebras and a fixed-weight section f′ over R′, if its full q-expansion at the chosen component cusp has coefficients in the image of the R-valued coefficient line, then f′ descends uniquely to an R-valued form. Flatness of R′ over R is not required.

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.
- The coefficient map is injective. Use the smooth flat model and invertible line over the fixed weight base; a noninjective map requires a separate image formulation.

**Construction or proof.**

1. Apply the coefficient exact sequence 0→R→R′→R′/R→0 to the invertible line on the flat model. Global sections are left exact.
2. The image of f′ in the quotient-coefficient section module has zero expansion. Module-coefficient detection makes this image zero. Exactness gives existence over R; injectivity gives uniqueness.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/hilbert-q-expansion-module-injective`
- `SchemeAndStackFoundations:SF.0`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Proposition 8.5(ii), printed p. 547 (proof delegated to [6], §7): Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.
- [DIMITROV-TILOUINE-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad16-DiTi.pdf), §7, Definition 7.2 and Proposition 7.3 proof, printed pp. 585–586: The companion gives the abelian-coefficient injectivity argument and explicitly assumes an inclusion of coefficient algebras; its displayed chart presentation is restricted to nonramified cusps. Dimitrov §8 supplies the general cusp presentation, whose unit phase preserves the argument.

**Acceptance.**

- An injective nonflat map is permitted: Z/4→(Z/4)[t]/(2t) supplies a coefficient test for the stronger statement.
- For a noninjective map R→0, unique recovery is false for nonzero R.
- The zero coefficient submodule recovers injectivity; the zero unital coefficient ring alone gives a vacuous specialization.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Hilbert minimal and toroidal cusp ideals

**Node:** `ShimuraCompactifications:C6/hilbert-boundary-ideal-pushforward`. **Declaration:** `hilbert_boundary_ideal_pushforward`. **Kind:** theorem. **Implementation:** unchecked.

For g>1, on the stated normal Hilbert models π_*I_D=I_cusp, where D is the toroidal boundary and I_cusp is the ideal of the finite étale minimal cusp subscheme. For a parallel weight line Lmin, π_*(π*Lmin⊗I_D)=Lmin⊗I_cusp.

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.
- First over the source arithmetic base; any coefficient extension requires the requested coherent pushforward/base-change comparison, not an automatic equality of pulled-back ideals.

**Construction or proof.**

1. Use the C5 normal proper contraction theorem to obtain π_*O_Mbar=O_Mmin over B=Z[1/N(n)]. Let C be the finite étale minimal cusp subscheme and f:D→C the induced boundary map.
2. Use hilbert-boundary-etale-charts and C0: the scheme-theoretic toric boundary has a monomial quotient basis over its cusp coefficient ring, so it is flat and has geometrically reduced fibres. Descend along the actual cusp étale covers. Hilbert-minimal-boundary-fibres identifies the geometrically connected fibres over C; properness follows from the contraction.
3. Apply the requested SF.0/C5 theorem for a proper flat finitely presented morphism with geometrically reduced and geometrically connected fibres: O_C≅f_*O_D, with its coherent base-change statement. This is an integral global-function argument, not a reduced-point detection argument.
4. Push forward 0→I_D→O_Mbar→O_D. Left exactness identifies π_*I_D with the kernel of O_Mmin→O_C, namely I_cusp. Apply the projection formula for the invertible parallel line Lmin.
5. Any coefficient extension uses the explicitly permitted coherent base changes; do not interchange a completed series ring with arbitrary tensor product.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/hilbert-minimal-normal-projective`
- `ShimuraCompactifications:C6/hilbert-minimal-cusps`
- `ShimuraCompactifications:C6/hilbert-minimal-formal-comparison`
- `ShimuraCompactifications:C5`
- `AdicSpacesPartII:F0`
- `SchemeAndStackFoundations:SF.0`
- `AdicSpacesPartII:F0/formal-direct-image-comparison`
- `ShimuraCompactifications:C6/hilbert-boundary-etale-charts`
- `ShimuraCompactifications:C6/hilbert-minimal-boundary-fibres`
- `ShimuraCompactifications:C0/relative-boundary-coordinates`

**Source match.**

- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Theorem 8.6(iv),(v) and its proof, author copy printed pp. 548–549; Corollary 7.4, printed p. 544: Derived ideal comparison from the source boundary contraction and toric charts, plus the explicitly requested integral global-function theorem in SF.0/C5; not a separately numbered source theorem.

**Acceptance.**

- No equality π*I_cusp=I_D is claimed; orders of vanishing can change under refinements.
- Boundary ideals retain nilpotent coefficients.
- The integral base B does not invert the discriminant. The weight-line boundary criterion over o′[1/Δ] is not used to prove this base-B assertion.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Hilbert models at arbitrary residue primes

**Node:** `ShimuraCompactifications:C6/hilbert-ordinary-model-comparison`. **Declaration:** `hilbert_ordinary_integral_model_compare`. **Kind:** comparison. **Implementation:** unchecked.

For any prime p not dividing the tame level, including p=2 and p ramified in F, the completions of the H2 Deligne–Pappas model and its minimal/toroidal compactifications identify with the C6 models on their common moduli open and cusp charts. The ordinary locus and Hasse neighbourhood models are those of H2’s actual local model.

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.
- Use the H2 moduli condition at ramified primes and its ordinary/Rapoport locus, rather than C5’s good-prime smoothness. BHW uses N≥4, (N,p)=1.

**Construction or proof.**

1. Match H1/H2 moduli data and the H2 local model on the interior.
2. On the boundary use the C4 family and actual lattice/level maps.
3. Identify the completed models via the requested uniqueness/descent comparison; retain H2’s ordinary-locus hypotheses.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/hilbert-toroidal-model`
- `ShimuraCompactifications:C6/hilbert-minimal-normal-projective`
- `ShimuraCompactifications:C6/hilbert-boundary-formal-comparison`
- `HilbertModularVarietiesAndShimuraCurves:H2`
- `HilbertModularVarietiesAndShimuraCurves:H1`
- `AdicSpacesPartII:F0`

**Source match.**

- [BHW-2023](https://www.numdam.org/item/10.5802/aif.3560.pdf), Sections 5.1.2–5.2, printed pp. 1744–1748: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.
- [DIMITROV-AUTHOR](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf), Theorems 7.2 and 8.6, author copy printed pp. 541–543, 548–549: The arithmetic toroidal/minimal models to which the BHW ordinary construction is compared; ramified integral local-model compatibility is separately requested from H2.

**Acceptance.**

- Ramification in F and ramification of a level cusp are independent.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Hilbert Hasse ideal on the boundary

**Node:** `ShimuraCompactifications:C6/hilbert-hasse-boundary-comparison`. **Declaration:** `hilbert_hasse_boundary_compare`. **Kind:** comparison. **Implementation:** unchecked.

The H2 total Hasse ideal on the ordinary Hilbert model is the ideal obtained from the R07.2 determinant of Verschiebung on invariant differentials on its abelian locus, and from T0’s semiabelian extension on the C4 boundary charts. These agree on overlaps and are compatible with the O-action and changes of polarization.

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.
- The generic BT₁ determinant invariant, LF and BT₁ Hodge–Tate sequence have owner R07.2. C6 does not define them.
- At the toric boundary use the semiabelian Verschiebung/differential construction, not an abelian BT₁ of fixed height 2g.

**Construction or proof.**

1. Compare the abelian H2 determinant with imported R07.2 Ha.
2. Use T0’s extension along the C4 charts and the conormal identification; determinant functoriality glues the ideal.
3. Use the actual H2 ordinary local model for p=2 and ramified primes.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/hilbert-conormal-comparison`
- `ShimuraCompactifications:C6/hilbert-ordinary-model-comparison`
- `HilbertModularVarietiesAndShimuraCurves:H2`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`
- `HodgeTateAndCanonicalSubgroups:T0`
- `HilbertModularVarietiesAndShimuraCurves:H3`

**Source match.**

- [BHW-2023](https://www.numdam.org/item/10.5802/aif.3560.pdf), BHW §5.2, Lemma 5.12 proof, pp. 1746–1748; §7.1, pp. 1759–1760: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.

**Acceptance.**

- The determinant line is Z-rank g; partial Hasse factors after splitting are not the definition of a new invariant.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### The Hilbert boundary is ordinary

**Node:** `ShimuraCompactifications:C6/hilbert-boundary-ordinary`. **Declaration:** `hilbert_boundary_ordinary`. **Kind:** theorem. **Implementation:** unchecked.

**Planet:** Ordinary Hilbert boundary.

The Hasse ideal is the unit ideal on the formal toric boundary. Consequently every cusp lies in the ε=0 ordinary neighbourhood, for every permitted prime including p=2 and discriminant primes.

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.

**Construction or proof.**

1. On a split torus, Verschiebung is the identity after the Frobenius factorization of [p]; its differential determinant is a unit.
2. Descend this unit-ideal statement from the splitting/cyclotomic chart cover to the actual boundary.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/hilbert-hasse-boundary-comparison`
- `ShimuraCompactifications:C6/hilbert-semiabelian-extension`
- `HodgeTateAndCanonicalSubgroups:T0`
- `HilbertModularVarietiesAndShimuraCurves:H2`
- `SchemeAndStackFoundations:SF.1`

**Source match.**

- [BHW-2023](https://www.numdam.org/item/10.5802/aif.3560.pdf), BHW Lemma 5.12 proof, printed p. 1748: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.

**Acceptance.**

- The boundary lies in the Rapoport locus even though the whole special fibre need not be smooth.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Hasse neighbourhood model comparison

**Node:** `ShimuraCompactifications:C6/hilbert-near-ordinary-model`. **Declaration:** `hilbert_nearOrdinary_model_compare`. **Kind:** comparison. **Implementation:** unchecked.

For 0≤ε<1 with |p|^ε in |L×|, the H2 admissible normalized blowup model of |Ha|≥|p|^ε on the compactified Hilbert model has generic fibre exactly BHW’s X*(ε). Locally its blowup chart before normalization is the p-torsion-free quotient of R⟨T⟩/(T Ha_lift−p^ε). It contains the entire boundary.

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.
- Choose an integral element of valuation ε in a coefficient extension, as in H2; normalization and p-torsion removal are part of the supplied model.

**Construction or proof.**

1. Compare the H2 ideal construction with the local lift equation.
2. If Ha′−Ha∈pR and ε<1, the ultrametric inequality makes the two valuation conditions equivalent.
3. Use boundary-ordinary and formal/adic generic-fibre comparison.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/hilbert-ordinary-model-comparison`
- `ShimuraCompactifications:C6/hilbert-hasse-boundary-comparison`
- `ShimuraCompactifications:C6/hilbert-boundary-ordinary`
- `HilbertModularVarietiesAndShimuraCurves:H2`
- `AdicSpacesPartII:F0`
- `AdicSpacesPartII:R2`
- `AdicSpacesPartII:R3`

**Source match.**

- [BHW-2023](https://www.numdam.org/item/10.5802/aif.3560.pdf), BHW §5.2, pp. 1746–1748; elliptic convention §2.1, p. 1721: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.

**Acceptance.**

- At ε=1, Ha=0 and Ha′=p need not define the same condition.
- This node does not prove any canonical-subgroup radius; T3 owns those estimates.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Polarization quotients of ordinary neighbourhoods

**Node:** `ShimuraCompactifications:C6/hilbert-ordinary-polarization-quotient`. **Declaration:** `hilbert_ordinary_polarization_quotient`. **Kind:** theorem. **Implementation:** unchecked.

For tame Δ(N), the Hasse inequality is invariant under changing the chosen polarization, and the G ordinary-neighbourhood model is the effective quotient of the G* model. For Γ0(p^n) level, the diagram over the corresponding unlevelled opens is Cartesian and is a finite étale Δ(N)-torsor on the adic moduli locus.

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.
- For compactified formal charts use the actual toroidal/minimal action above; no étale torsor assertion is added at minimal cusps.

**Construction or proof.**

1. The underlying O-abelian scheme, hence Hasse ideal, is unchanged by the polarization action.
2. Use H4’s relative Γ0 moduli problem and H3’s tame quotient.
3. The natural subgroup is O-stable, giving the Cartesian property of Lemma 8.5; compare formal charts by equivariance.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/toroidal-polarization-quotient`
- `ShimuraCompactifications:C6/minimal-polarization-quotient`
- `ShimuraCompactifications:C6/hilbert-near-ordinary-model`
- `HilbertModularVarietiesAndShimuraCurves:H3`
- `HilbertModularVarietiesAndShimuraCurves:H4`
- `SchemeAndStackFoundations:SF.1`

**Source match.**

- [BHW-2023](https://www.numdam.org/item/10.5802/aif.3560.pdf), BHW Proposition 8.4 and Lemma 8.5, pp. 1766–1767: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.

**Acceptance.**

- For full G* p-level, the positive-unit action need not preserve the Weil-pairing constraint; the mixed full-level model is needed.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Finite-level Hilbert boundary maps

**Node:** `ShimuraCompactifications:C6/hilbert-p-level-boundary-comparison`. **Declaration:** `hilbert_pLevel_boundary_compare`. **Kind:** comparison. **Implementation:** unchecked.

The forgetful and finite effective H4 level/polarization maps extend between the canonical Hilbert generic-fibre minimal compactifications (or the specified finite normalizations). For toroidal compactifications they extend after choosing fans compatible with the induced cusp lattice maps; a finite toroidal extension uses the pullback fan/finite normalization, while further refinements may give proper nonfinite maps. These maps agree on completed cusp data, including lattice inclusions, root actions and determinant pairing. The full-level comparison passes through H4’s mixed G-level problem; it is not the quotient of X_{Γ*(p^n)} by all positive units.

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.
- Integral models at wild p-level are only those explicitly supplied by H2/H4 and the applicable C5 extension theorem; the BHW generic-fibre tower alone supplies no all-level smooth integral model.
- For every toroidal map choose source and target admissible fans compatible under the actual cusp lattice map, using C0/C3 equivariant refinements. A finiteness assertion requires the source to be the finite normalization of the target, equivalently the pullback fan in the finite toric lattice case; compatibility alone does not imply finiteness.

**Construction or proof.**

1. Use H4’s actual finite-level action (precomposition by γ∨=det(γ)γ⁻¹) and effective centers.
2. Apply C5’s canonical minimal compactification/finite normalization extension theorem to finite open maps, with its stated normality and density hypotheses.
3. For toroidal maps use C0’s lattice-map criterion and C3’s compatible equivariant refinements, with C4’s period data. Identify the finite normalization with the pullback fan when claiming finiteness; additional subdivisions only supply proper comparison maps.
4. Use H3’s phase compatibility to identify the formal boundary maps, and schematic density to compare them with the extended open maps.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/hilbert-boundary-formal-comparison`
- `ShimuraCompactifications:C6/hilbert-minimal-formal-comparison`
- `HilbertModularVarietiesAndShimuraCurves:H2`
- `HilbertModularVarietiesAndShimuraCurves:H3`
- `HilbertModularVarietiesAndShimuraCurves:H4`
- `ShimuraCompactifications:C4/boundary-level-comparison`
- `ShimuraCompactifications:C5`
- `ShimuraCompactifications:C0/compatible-common-refinement`
- `ShimuraCompactifications:C0/relative-torus-embedding`
- `ShimuraCompactifications:C3/level-datum-functoriality`
- `ShimuraCompactifications:C3/choice-comparison`

**Source match.**

- [BHW-2023](https://www.numdam.org/item/10.5802/aif.3560.pdf), BHW §5.1.1–5.1.2 and §8.2–8.4, pp. 1742–1745, 1768–1779: BHW supplies the actual open finite-level maps, effective groups and mixed-level distinction. Extension to compactifications is a C6 comparison using C5 and the explicitly requested C0/C3 fan compatibility; BHW is not cited as proving extension for arbitrary toroidal fans.

**Acceptance.**

- The map from full G* to full G level is not generally surjective (BHW §8.2).
- Finite effective groups at fixed n are not the profinite group Δ(p∞N).
- Unrelated fixed fans need not admit the level map. A proper subdivision of a compatible fan can give a nonfinite toroidal map, even though the open level map is finite.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Natural integral Hilbert differential lattice

**Node:** `ShimuraCompactifications:C6/hilbert-integral-differential-interface`. **Declaration:** `hilbert_integral_differential_compare`. **Kind:** comparison. **Implementation:** unchecked.

The natural integral conormal lattice on the C6 ordinary toroidal model pulls back on H4 finite levels to the ω⁺ used in BHW §7.1. This comparison supplies the boundary family and natural lattice to T3–T5; the modified inverse-image lattice ω^int, its local freeness and estimates remain T5’s own constructions.

**Hypotheses.**

- F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.
- Use O⊗O⁺-rank one only on the stated Rapoport locus; p may ramify in F.

**Construction or proof.**

1. Take the conormal of the actual formal semiabelian family and apply the requested formal/generic-fibre sheaf comparison.
2. Use the moduli compatibility of finite level pullback and the ordinary-model comparison.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/hilbert-conormal-comparison`
- `ShimuraCompactifications:C6/hilbert-near-ordinary-model`
- `ShimuraCompactifications:C6/hilbert-p-level-boundary-comparison`
- `HilbertModularVarietiesAndShimuraCurves:H2`
- `HilbertModularVarietiesAndShimuraCurves:H4`
- `AdicSpacesPartII:F0`
- `AdicSpacesPartII:R3`

**Source match.**

- [BHW-2023](https://www.numdam.org/item/10.5802/aif.3560.pdf), BHW §7.1, Definition 7.3 and Proposition 7.4, pp. 1759–1760: Specialization to C6 of the stated source construction or comparison; generic objects are imported from their unique owners.

**Acceptance.**

- At ramified primes the natural lattice can differ from T5’s ω^int.
- No canonical subgroup or Igusa torsor is constructed here.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/Hilbert/Compactification

**namespace.** TauCeti.HilbertCusp

### Degree-one compactification comparison

**Node:** `ShimuraCompactifications:C6/modular-toroidal-minimal-comparison`. **Declaration:** `modular_toroidal_minimal_compare`. **Kind:** comparison. **Implementation:** unchecked.

For F=Q, after identifying principal polarizations and the same tame and finite p-level moduli data and bases, the generic-fibre normal Hilbert toroidal and minimal curves are canonically isomorphic to the compactified coarse modular curves of R13.4a. The isomorphism restricts to the moduli identification on the open and identifies the cusp subschemes.

**Hypotheses.**

- Work in characteristic zero, component by component, with the precise full/fixed-pairing/Γ1/Γ0 level and coefficient field supplied by R13.4a.
- For full level retain the Weil-pairing/cyclotomic component field; do not collapse it to the tame Γ1 curve.

**Construction or proof.**

1. The H1 HBAV moduli problem at F=Q is the elliptic one with the specified level.
2. Use the R13.4a normal proper coarse construction. Normal proper curve completions of the common dense open are uniquely isomorphic.
3. A proper birational contraction of normal curves is an isomorphism, so toroidal and minimal generic curves coincide.

**Direct prerequisites.**

- `HilbertModularVarietiesAndShimuraCurves:H1`
- `HilbertModularVarietiesAndShimuraCurves:H4`
- `ShimuraCompactifications:C4/tate-degeneration-comparison`
- `ShimuraCompactifications:C5`
- `ModularCurvesPartII:R13.4a`
- `SchemeAndStackFoundations:SF.0`

**Source match.**

- [MODULAR-CURVES-II](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/ModularCurvesPartII/README.md), R13.4a: A roadmap supplier contract, not an implemented theorem or a primary proof. The precise comparison is requested from R13.4a.
- [BHW-2023](https://www.numdam.org/item/10.5802/aif.3560.pdf), Section 2.1, printed pp. 1720–1721: The elliptic compactification and Hasse-neighbourhood convention. The algebraic/formal comparison with the Hilbert specialization still uses the separately requested modular-curve contracts.

**Acceptance.**

- g=1 does not satisfy arithmetic Koecher; a pole at a cusp can exist.
- Composite and full levels use R13.4a.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/ModularComparison

**namespace.** TauCeti.HilbertCusp

### Modular cusp parameters and analytification

**Node:** `ShimuraCompactifications:C6/modular-formal-cusp-comparison`. **Declaration:** `modular_formal_cusp_compare`. **Kind:** comparison. **Implementation:** unchecked.

Under the degree-one comparison, the C4 Tate/Mumford family, cusp fields and the formal q parameter agree with R13.4a/R13.4b. For a cusp of width w, j=q_Tate⁻¹+744+… and q_Tate=t^w in its level cusp parameter t. Analytification and the permitted level/degeneracy correspondences commute with this identification.

**Hypotheses.**

- Use R13.4b’s component and correspondence descent hypotheses; at stack level keep inertia, and at coarse level keep cusp width.
- Generic fibre and completed cusp comparisons use the formal/adic comparison F0/R2/R3.

**Construction or proof.**

1. Identify the universal Tate object on the common punctured cusp using C4’s uniqueness.
2. Transport the character inclusion at the cusp; its index is the width, giving q_Tate=t^w.
3. Use R13.4b’s analytic and correspondence comparison rather than proving analytic uniformization here.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/modular-toroidal-minimal-comparison`
- `ShimuraCompactifications:C4/tate-degeneration-comparison`
- `ShimuraCompactifications:C4/boundary-level-comparison`
- `ModularCurvesPartII:R13.4a`
- `ModularCurvesPartII:R13.4b`
- `AdicSpacesPartII:F0`
- `AdicSpacesPartII:R2`
- `AdicSpacesPartII:R3`

**Source match.**

- [MODULAR-CURVES-II](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/ModularCurvesPartII/README.md), R13.4a and R13.4b: A roadmap supplier contract, not an implemented theorem or a primary proof. The precise comparison is requested from R13.4a and R13.4b.
- [BHW-2023](https://www.numdam.org/item/10.5802/aif.3560.pdf), Section 2.1, printed pp. 1720–1721: The elliptic compactification and Hasse-neighbourhood convention. The algebraic/formal comparison with the Hilbert specialization still uses the separately requested modular-curve contracts.

**Acceptance.**

- At width w>1 the coarse parameter t is not the Tate q itself.
- A coarse-space map is not a substitute for a stack correspondence.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/ModularComparison

**namespace.** TauCeti.HilbertCusp

### PR81 prime diamond quotient comparison

**Node:** `ShimuraCompactifications:C6/prime-diamond-pr81-comparison`. **Declaration:** `modular_primeDiamond_PR81_compare`. **Kind:** comparison. **Implementation:** unchecked.

For prime N≥5 and H≤(Z/N)×/{±1}, the generic-fibre compactification for the corresponding diamond quotient agrees with PR81 Modular Curves Layer 10 through R13.4a. The comparison identifies the affine open, cusp divisor and normalization over the j-line.

**Hypotheses.**

- Apply only to this prime diamond class, with its precise level quotient.

**Construction or proof.**

1. Use R13.4a’s agreement with PR81 after inverting N.
2. Compose with the degree-one compactification comparison and retain the checked finite-normal j-line conditions.

**Direct prerequisites.**

- `ShimuraCompactifications:C6/modular-toroidal-minimal-comparison`
- `ModularCurvesPartII:R13.4a`
- `tauceti:TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering`

**Source match.**

- [MODULAR-CURVES-II](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/ModularCurvesPartII/README.md), R13.4a: A roadmap supplier contract, not an implemented theorem or a primary proof. The precise comparison is requested from R13.4a.

**Acceptance.**

- This statement does not cover general full or composite level, or an arbitrary H in GL2.

**Proposed library placement.** **module.** TauCeti/Geometry/Shimura/ModularComparison

**namespace.** TauCeti.HilbertCusp

## Pinned baseline declarations

These are existing inputs, rather than new nodes. Read statements at the recorded pins; compiled availability is a separate question.

### `tauceti:TauCeti.Toric.Fan.ext`

**ref.** tauceti:TauCeti.Toric.Fan.ext

**kind.** theorem

**module.** TauCeti/Geometry/Toric/Algebraic/Fan/Basic.lean

**provides.** Extensionality on the existing finite fan carrier. Its structure has finite_cones; it is not an arithmetic fan with merely finitely many orbits. Reuse its lattice/cone vocabulary and finite specialization.

**checked.** Statement and surrounding hypotheses freshly read at the recorded pin on 2026-10-06. Source annotations generating the additive forms were checked where applicable. The read statement supplies exactly the limited interface in provides; no compiled Tau Ceti import is claimed.

### `tauceti:TauCeti.SplitTorus.groupScheme`

**ref.** tauceti:TauCeti.SplitTorus.groupScheme

**kind.** abbrev

**module.** TauCeti/Algebra/AlgebraicGroup/SplitTorus/Scheme.lean

**provides.** The actual finite-rank split torus over Spec R for any commutative ring, not just over a field. Relative torsors and toroidal boundary charts are additional constructions.

**checked.** Statement and surrounding hypotheses freshly read at the recorded pin on 2026-10-06. Source annotations generating the additive forms were checked where applicable. The read statement supplies exactly the limited interface in provides; no compiled Tau Ceti import is claimed.

### `tauceti:TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk`

**ref.** tauceti:TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk

**kind.** theorem

**module.** TauCeti/AlgebraicGeometry/IrreducibleOfConnectedDomainStalk.lean

**provides.** A locally Noetherian connected SCHEME with domain stalks is irreducible. This is a scheme-specialization input for the foundations owner, not the algebraic-space or geometric-fiber theorem needed below.

**checked.** Statement and surrounding hypotheses freshly read at the recorded pin on 2026-10-06. Source annotations generating the additive forms were checked where applicable. The read statement supplies exactly the limited interface in provides; no compiled Tau Ceti import is claimed.

### `mathlib:MonoidAlgebra.comapDomain`

**ref.** mathlib:MonoidAlgebra.comapDomain

**kind.** def

**module.** Mathlib/Algebra/MonoidAlgebra/MapDomain.lean

**provides.** Coefficient restriction along an injective degree map, including its source-generated AddMonoidAlgebra version. The operation is additive, not an algebra homomorphism without the face condition proved in C0.

**checked.** Statement and surrounding hypotheses freshly read at the recorded pin on 2026-10-06. Source annotations generating the additive forms were checked where applicable. The read statement supplies exactly the limited interface in provides; no compiled Tau Ceti import is claimed.

### `mathlib:AddMonoidAlgebra.lift`

**ref.** mathlib:AddMonoidAlgebra.lift

**kind.** def

**module.** Mathlib/Algebra/MonoidAlgebra/Basic.lean

**provides.** Equivalence between multiplicative maps from Multiplicative P to an R-algebra A and R-algebra homomorphisms from AddMonoidAlgebra R P. It packages the actual monomial-or-zero map once its multiplication law is established.

**checked.** Statement and surrounding hypotheses freshly read at the recorded pin on 2026-10-06. Source annotations generating the additive forms were checked where applicable. The read statement supplies exactly the limited interface in provides; no compiled Tau Ceti import is claimed.

### `mathlib:AddMonoidAlgebra.lift_single`

**ref.** mathlib:AddMonoidAlgebra.lift_single

**kind.** theorem

**module.** Mathlib/Algebra/MonoidAlgebra/Basic.lean

**provides.** The additive monoid-algebra lift evaluated on a coefficient monomial is the scalar multiple of the chosen monoid map. This checks the face-projection normalization.

**checked.** Statement and surrounding hypotheses freshly read at the recorded pin on 2026-10-06. Source annotations generating the additive forms were checked where applicable. The read statement supplies exactly the limited interface in provides; no compiled Tau Ceti import is claimed.

### `mathlib:MonoidAlgebra.mapDomainAlgHom`

**ref.** mathlib:MonoidAlgebra.mapDomainAlgHom

**kind.** def

**module.** Mathlib/Algebra/MonoidAlgebra/Basic.lean

**provides.** The algebra map induced by a degree-monoid homomorphism, with its source-generated AddMonoidAlgebra form. Used for the existing inclusion R[F] to R[P], not replanned.

**checked.** Statement and surrounding hypotheses freshly read at the recorded pin on 2026-10-06. Source annotations generating the additive forms were checked where applicable. The read statement supplies exactly the limited interface in provides; no compiled Tau Ceti import is claimed.

### `mathlib:MonoidAlgebra.mapRingHom`

**ref.** mathlib:MonoidAlgebra.mapRingHom

**kind.** def

**module.** Mathlib/Algebra/MonoidAlgebra/MapDomain.lean

**provides.** The ring map changing every monoid-algebra coefficient along a unital ring homomorphism, with its source-generated additive-degree form, coefficient formula and monomial formula.

**checked.** Statement and surrounding hypotheses freshly read at the recorded pin on 2026-10-06. Source annotations generating the additive forms were checked where applicable. The read statement supplies exactly the limited interface in provides; no compiled Tau Ceti import is claimed.

### `mathlib:MonoidAlgebra.domCongr`

**ref.** mathlib:MonoidAlgebra.domCongr

**kind.** def

**module.** Mathlib/Algebra/MonoidAlgebra/Basic.lean

**provides.** An equivalence of degree monoids induces an algebra equivalence for any coefficient algebra. Its source-generated additive version supplies the algebraic part of integral regular coordinates, but not the dual-monoid or torsor theorem.

**checked.** Statement and surrounding hypotheses freshly read at the recorded pin on 2026-10-06. Source annotations generating the additive forms were checked where applicable. The read statement supplies exactly the limited interface in provides; no compiled Tau Ceti import is claimed.

### `mathlib:Ideal.quotientKerAlgEquivOfRightInverse`

**ref.** mathlib:Ideal.quotientKerAlgEquivOfRightInverse

**kind.** def

**module.** Mathlib/RingTheory/Ideal/Quotient/Operations.lean

**provides.** For an algebra homomorphism with an actual right inverse, the quotient by its kernel is algebra-isomorphic to its codomain. The C0 work identifies the specified off-face monomial ideal with that kernel.

**checked.** Statement and surrounding hypotheses freshly read at the recorded pin on 2026-10-06. Source annotations generating the additive forms were checked where applicable. The read statement supplies exactly the limited interface in provides; no compiled Tau Ceti import is claimed.

### `tauceti:TauCeti.Hodge.MixedHodgeStructure`

**ref.** tauceti:TauCeti.Hodge.MixedHodgeStructure

**kind.** structure

**module.** TauCeti/Geometry/Hodge/Mixed/Basic.lean

**provides.** Integral module with actual rational/complex base-change models, bounded increasing WQ and decreasing F, and native pure graded Hodge structures whose filtration is exactly the induced quotient filtration. C1 only constructs its boundary instance.

**checked.** Pinned source read 2026-10-06, structure and graded_pure fields, lines 65–105; no compiled Tau Ceti import is claimed.

### `tauceti:TauCeti.Hodge.MixedHodgeStructure.gradedHodgeStructure`

**ref.** tauceti:TauCeti.Hodge.MixedHodgeStructure.gradedHodgeStructure

**kind.** def

**module.** TauCeti/Geometry/Hodge/Mixed/Basic.lean

**provides.** The native weight-k graded Hodge structure, with F defined by gradedF and exact gradedHodgeStructure_F comparison. C1 uses this existing pure carrier rather than choosing an unrelated pure structure.

**checked.** Pinned source read 2026-10-06, actual definition and filtration equality after conjF, approximately lines 208–228; statement includes isBaseChange_ratTensorMap and the native weightGradedRat quotient.

### `mathlib:AlgebraicGeometry.Spec`

**ref.** mathlib:AlgebraicGeometry.Spec

**kind.** def

**module.** Mathlib/AlgebraicGeometry/Scheme.lean

**provides.** The existing scheme spectrum of CommRingCat, used for Spec R[P] rather than a new affine-scheme carrier.

**checked.** Actual definitions and identity/composition statements read at Mathlib 082e2d3 on 2026-10-06, lines 468–488, blob 7b6780cadcf0a4d2df6c5bf7e4356b95d059e8d9.

### `mathlib:AlgebraicGeometry.Spec.map`

**ref.** mathlib:AlgebraicGeometry.Spec.map

**kind.** def

**module.** Mathlib/AlgebraicGeometry/Scheme.lean

**provides.** A ring morphism R to S induces the scheme morphism Spec S to Spec R. Coefficient maps of integral charts use this existing contravariance.

**checked.** Actual definitions and identity/composition statements read at Mathlib 082e2d3 on 2026-10-06, lines 468–488, blob 7b6780cadcf0a4d2df6c5bf7e4356b95d059e8d9.

### `mathlib:NumberField.Units.dirichletUnitTheorem.exists_unit`

**ref.** mathlib:NumberField.Units.dirichletUnitTheorem.exists_unit

**module.** Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean

**kind.** theorem

**provides.** For a selected infinite place, an integer unit has negative logarithm at every other place. Reuse this existing theorem; its unrestricted unit need not lie in the cusp subgroup.

**checked.** Statement freshly read with git show at the recorded pin on 2026-10-06; no inference from its name.

### `mathlib:NumberField.Units.sum_mult_mul_log`

**ref.** mathlib:NumberField.Units.sum_mult_mul_log

**module.** Mathlib/NumberTheory/NumberField/Units/Basic.lean

**kind.** theorem

**provides.** The weighted sum of logarithms of an integer unit is zero.

**checked.** Statement freshly read with git show at the recorded pin on 2026-10-06; no inference from its name.

### `mathlib:NumberField.Units.pos_at_place`

**ref.** mathlib:NumberField.Units.pos_at_place

**module.** Mathlib/NumberTheory/NumberField/Units/Basic.lean

**kind.** theorem

**provides.** The absolute value of an integer unit at each infinite place is strictly positive.

**checked.** Statement freshly read with git show at the recorded pin on 2026-10-06; no inference from its name.

### `mathlib:NumberField.IsTotallyReal.mult_eq`

**ref.** mathlib:NumberField.IsTotallyReal.mult_eq

**module.** Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean

**kind.** theorem

**provides.** Each infinite-place multiplicity is one in a totally real field.

**checked.** Statement freshly read with git show at the recorded pin on 2026-10-06; no inference from its name.

### `mathlib:Subgroup.exists_pow_mem_of_index_ne_zero`

**ref.** mathlib:Subgroup.exists_pow_mem_of_index_ne_zero

**module.** Mathlib/GroupTheory/Index.lean

**kind.** theorem

**provides.** A positive power of every group element belongs to a subgroup of nonzero index, with exponent at most its index.

**checked.** Statement freshly read with git show at the recorded pin on 2026-10-06; no inference from its name.

### `tauceti:NumberField.isTotallyPositive_iff`

**ref.** tauceti:NumberField.isTotallyPositive_iff

**module.** TauCeti/NumberTheory/NumberField/TotallyPositive.lean

**kind.** theorem

**provides.** The existing strict positivity predicate is positivity at every real infinite place. Zero is not totally positive in a totally real number field.

**checked.** Statement freshly read with git show at the recorded pin on 2026-10-06; no inference from its name.

### `tauceti:NumberField.isTotallyPositive_sq`

**ref.** tauceti:NumberField.isTotallyPositive_sq

**module.** TauCeti/NumberTheory/NumberField/TotallyPositive.lean

**kind.** theorem

**provides.** Every nonzero square is totally positive, including squares of integer units.

**checked.** Statement freshly read with git show at the recorded pin on 2026-10-06; no inference from its name.

### `mathlib:tendsto_pow_atTop_atTop_of_one_lt`

**ref.** mathlib:tendsto_pow_atTop_atTop_of_one_lt

**module.** Mathlib/Analysis/SpecificLimits/Basic.lean

**kind.** theorem

**provides.** Powers of a real number greater than one tend to positive infinity.

**checked.** Statement freshly read with git show at the recorded pin on 2026-10-06; no inference from its name.

### `mathlib:tendsto_pow_atTop_nhds_zero_of_lt_one`

**ref.** mathlib:tendsto_pow_atTop_nhds_zero_of_lt_one

**module.** Mathlib/Analysis/SpecificLimits/Basic.lean

**kind.** theorem

**provides.** Powers of a nonnegative real number strictly below one tend to zero.

**checked.** Statement freshly read with git show at the recorded pin on 2026-10-06; no inference from its name.

### `mathlib:Units.mul_right_eq_zero`

**ref.** mathlib:Units.mul_right_eq_zero

**module.** Mathlib/Algebra/GroupWithZero/Units/Basic.lean

**kind.** theorem

**provides.** Multiplication by a unit on the left preserves whether an element is zero; no domain or nontriviality hypothesis.

**checked.** Statement freshly read with git show at the recorded pin on 2026-10-06; no inference from its name.

### `mathlib:Finset.one_lt_prod_iff_of_one_le`

**ref.** mathlib:Finset.one_lt_prod_iff_of_one_le

**module.** Mathlib/Algebra/Order/BigOperators/Group/Finset.lean

**kind.** theorem

**provides.** The indexed multiplicative statement generates Finset.sum_pos_iff_of_nonneg by to_additive. Its generated additive signature was checked by pinned Lean: a finite sum of nonnegative terms is positive exactly when one term is positive. Both source statements were read; the shared text index lists the generating declaration.

**checked.** Statement freshly read with git show at the recorded pin on 2026-10-06; no inference from its name.

### `mathlib:Submodule.traceDual`

**ref.** mathlib:Submodule.traceDual

**module.** Mathlib/RingTheory/DedekindDomain/Different.lean

**kind.** def

**provides.** Existing integral trace dual of a Z-submodule of a number field, using the rational trace form.

**checked.** Definition and membership statement read at Mathlib 082e2d3 on 2026-10-06.

### `mathlib:Submodule.mem_traceDual`

**ref.** mathlib:Submodule.mem_traceDual

**module.** Mathlib/RingTheory/DedekindDomain/Different.lean

**kind.** lemma

**provides.** Membership means every trace pairing with the original module lies in the range of Z→Q.

**checked.** Definition and membership statement read at Mathlib 082e2d3 on 2026-10-06.

## Open construction and interface gaps

The plan remains open until these contracts and supplier requests are discharged. Packet completion does not close them.

### Native geometric signatures and supplier carrier interfaces

**detail.** The native coefficient-algebra signatures remain valid. Advanced arithmetic-fan, torsor, mixed-boundary, analytic quotient, formal degeneration, integral-model and cohomology signatures require actual supplier carriers and their requested API. Every omitted declaration/API/test is enumerated by its exact packet name in the suggested-file ledger. No arbitrary Prop or conclusion-as-field object stands for a missing definition.

**neededBy.** ShimuraCompactifications:C0

ShimuraCompactifications:C1

ShimuraCompactifications:C2

ShimuraCompactifications:C2.general

ShimuraCompactifications:C3

ShimuraCompactifications:C3.general

ShimuraCompactifications:C4

ShimuraCompactifications:C5

### Analytic carrier and nonreduced chart extension

**detail.** Use ComplexComparisonPartII:C0/repair-analytification, which is a planned repair, not an existing analytic-space implementation. Require the nilpotent-preserving local analytic-space carrier, morphisms, gluing/products and actual scheme analytification. Its current infrastructure/PR196 integration remains unfinished. Extend regular finite anchor charts to singular/nonreduced charts through that same carrier.

**neededBy.** ShimuraCompactifications:C2/partial-boundary-charts

ShimuraCompactifications:C2/arithmetic-gluing

ShimuraCompactifications:C2/projective-algebraization

### Arithmetic reduction and controlled quotient neighbourhoods

**detail.** Pink 6.19 and 6.22 use AMRT reduction/controlled Satake-neighbourhood input. Those proof passages were not read; AA.3/V2 must supply finite cusp indexing, effective stabilizer control and the stated separated quotient-neighbourhood theorem. Finite cone orbits alone do not prove separatedness or finiteness of stabilizers.

**neededBy.** ShimuraCompactifications:C1/arithmetic-stabilizer

ShimuraCompactifications:C2/quotient-separation

ShimuraCompactifications:C0/smooth-projective-refinement

### Special mixed canonical boundary models

**detail.** Pink 12.13–12.17 constructing special mixed boundary canonical models and the special-point descent input were not read. The pure V8 model does not supply these models by itself. Request the torus/abelian-torsor boundary subclass as the explicit descent supplier; the C2/C2.general and C3.general outputs remain conditional on it.

**neededBy.** ShimuraCompactifications:C2/canonical-toroidal-model

ShimuraCompactifications:C2.general/general-toroidal-descent

ShimuraCompactifications:C3.general/general-map-descent

### Universal toric subdivision cohomology

**detail.** Supply the integral monomial Cech/contractibility proof for structure sheaves and strictly boundary-positive degree ideals, including arbitrary coefficient base change and the derived boundary-ideal version. Lan 2017 Proposition 7.5 reduces to KKMS Corollary 2 p. 44, which was not read. A real-cone contractibility observation without the coefficient complex is insufficient.

**neededBy.** ShimuraCompactifications:C3/toric-structure-sheaf-vanishing

ShimuraCompactifications:C3/refinement-higher-structure-sheaf

ShimuraCompactifications:C3/refinement-boundary-ideal

### Relative effectivity construction proof leaves

**detail.** Lan 4.4 equivalence and 4.5.2 projective quotient statements/proofs were read, but the earlier relatively complete model and theta construction lemmas were not read in full. Supply those precise lemmas, cubical descent and ample effectivity through the formal-scheme/abelian owners; do not infer essential surjectivity solely from an equivalence statement.

**neededBy.** ShimuraCompactifications:C4/mumford-quotient

ShimuraCompactifications:C4/degeneration-effectivity

ShimuraCompactifications:C4/formal-universal-degeneration

### Local Raynaud supplier ownership repair

**detail.** The accepted RS-32 imports R11.3 into C4, but R11.3/raynaud-extension-comparison currently says its algebraic semi-abelian extension is supplied by early C4. Its recorded stage edge alone is not a closed independent carrier interface. Resolve the local construction and its exact statement in the Neron owner; C4 extends it to the relative complete normal-base/cusp setting.

**neededBy.** ShimuraCompactifications:C4/polarized-degeneration-data

ShimuraCompactifications:C4/degeneration-effectivity

ShimuraCompactifications:C5/valuative-properness

### Semi-abelian extension and quasi-finite flatness proof

**detail.** Faltings–Chai I.2.7 and the constructible-character theorem cited by Lan were not inspected in the original book. Supply the normal-base generic Hom extension and the extra quasi-finite/flat group argument for the exact boundary isogeny family. The Tate rank-loss example proves that a finite-flat-kernel strengthening is false. Faltings–Chai chapter V finite-flat cyclic level-group extension quoted in Pilloni 2012 4.1.2 was also not inspected. It extends the group with its generic identification, not necessarily its inclusion into the semi-abelian identity component.

**neededBy.** ShimuraCompactifications:C4/constructible-character-sheaf

ShimuraCompactifications:C4/homomorphism-extension

ShimuraCompactifications:C4/extended-isogeny-kernel

ShimuraCompactifications:C5/prime-Q-subgroup-extension

### Good algebraic-model approximation

**detail.** Lan 6.3.2.5–6.3.2.9 and 6.3.3.13–6.3.3.16 were read; the earlier approximation/versality lemmas in 6.3.1–6.3.2.4 and complete 6.3.2.10 proof were not. Supply their corrected etale finite-type hypotheses and keep i_nat/i_alg distinct.

**neededBy.** ShimuraCompactifications:C5/good-algebraic-model

ShimuraCompactifications:C5/etale-chart-relation

### Non-neat branch and geometric-component coverage

**detail.** The neat five-target argument is retained. A non-neat transport requires actual relative branch normalization or a proper finite-level cover meeting every geometric component, its stratified descent and coarse-space restrictions. Stacks 41.21.6 is only an absolute scheme lead. Neatness alone does not establish a globally simple normal-crossings coarse boundary.

**neededBy.** ShimuraCompactifications:C5/nonneat-boundary-descent

### Hodge theta generation and minimal constant terms

**detail.** Lan quotes Faltings–Chai V.2.1 for Hodge semiampleness; that proof was not inspected. Supply the theta-generation input, graded finite-generation/Stein interfaces and B5 constant-term identification, keeping B5 downstream of early toroidal properness. Coarse Hodge Q-line descent requires the stated auxiliary level/stabilizer check.

**neededBy.** ShimuraCompactifications:C5/hodge-semiampleness

ShimuraCompactifications:C5/graded-section-finite-generation

ShimuraCompactifications:C5/integral-minimal-space

ShimuraCompactifications:C5/minimal-hodge-ampleness

### Higher-level normalized chart proof and moduli identification

**detail.** Lan 2017 Theorem 6.1(1)–(6) and its beginning were read, not the complete cited global normalization proof. Supply the exact finite chart/completion/lattice comparison. BPS items 34/36 apply to the normalization model; identifying it with the parahoric moduli model (item 35) belongs to the separate Part II and is not assumed here.

**neededBy.** ShimuraCompactifications:C5/higher-level-toroidal-normalization

ShimuraCompactifications:C5/normalized-chart-finiteness

ShimuraCompactifications:C5/integral-coefficient-extension

### Integral coefficient and Koecher positivity proof

**detail.** Provide B3/B4 normalized integral coefficient functors satisfying all of Lan 2017 Definition 8.5, and B5 positivity/finite-growth inputs in Propositions 8.3–8.4 plus Lan [17] Theorem 2.3 proof, not read in full. Theorem 8.7's simple-algebra and dimension-one exception are retained. Generic normal Hartogs does not prove torsion coefficient extension.

**neededBy.** ShimuraCompactifications:C5/normalized-koecher

ShimuraCompactifications:C5/siegel-koecher-arbitrary-coefficients

ShimuraCompactifications:C3/coherent-cohomology-invariance

### Ordinary and formal special-fibre extension

**detail.** Pilloni 11.1.1 ordinary Koecher is asserted without a proof/reference; BCGP 8.2 uses a normal FORMAL model. Supply exact formal Hartogs, the normality/S2/codimension verification on those models and finite-thickening coefficient comparisons. Generic characteristic-zero Hartogs and H0 extension do not imply higher Koecher or all mod p conclusions.

**neededBy.** ShimuraCompactifications:C5/ordinary-koecher

ShimuraCompactifications:C5/formal-hilbert-siegel-koecher

ShimuraCompactifications:C3/partial-ordinary-formal-invariance

### Klingen first-projection acyclicity

**detail.** Pilloni 13.2.1 recalls acyclicity without a reference. Determine and prove the actual boundary-chart factorization of the corrected compactified first projection, then use the toric vanishing and analytic coherent comparison. Properness of the correspondence alone does not imply vanishing.

**neededBy.** ShimuraCompactifications:C3/klingen-correspondence-acyclicity

### Etale good-reduction cohomology comparison

**detail.** BCGP 2025 Theorem 1.8.29 proof uses Lan–Stroh Corollary 5.20 and duality, whose original proofs were not read. C5 supplies the good-prime smooth proper boundary geometry; the cohomology owner supplies nearby cycles/open comparison and duality. This is not a consequence of smoothness of the nonproper interior.

**neededBy.** ShimuraCompactifications:C5/good-boundary-cohomology-export

### Version-of-record and source collation boundary

**detail.** Hashes and exact read sections identify every inspected PDF. Pink/Pilloni/Boxer–Pilloni/Yuan and arXiv BCGP texts were not collated against their publishers. Yuan's requested author copy refused connection; arXiv v4 is used with its own date. Supporting AMRT, KKMS, Faltings–Chai and Lan [17]/Lan–Stroh original proofs remain the specific leaves above; no complete book reading or publisher-wide error claim is made.

**neededBy.** ShimuraCompactifications:C0

ShimuraCompactifications:C1

ShimuraCompactifications:C2

ShimuraCompactifications:C2.general

ShimuraCompactifications:C3

ShimuraCompactifications:C3.general

ShimuraCompactifications:C4

ShimuraCompactifications:C5

### Semi-abelian full Tate extension supplier interfaces

**detail.** The Bresciani routed characteristic-zero target requires the existing abelian torsion/Tate construction and the actual compact/profinite full-versus-primewise inverse-limit exactness interface from A4/R02.1. Its current cochain and lim1 nodes do not alone provide exactness of the underlying torus-extension systems. The finite torsion proof is sketched explicitly and the missing generic interface is requested, not replaced by a private topological carrier.

**neededBy.** ShimuraCompactifications:C4/semiabelian-tate-module

### Actual formal minimal-contraction structure-sheaf comparison

**detail.** C3/refinement-structure-sheaf concerns a fan subdivision and cannot prove O_formal-min≅pi_hat_*O_formal-tor. C5/integral-minimal-space records its algebraic Stein equality. To use it in BCGP 8.2, identify the source's normalized/ordinary formal contraction with that completed algebraic model and verify the proper formal-functions, projection-formula and special-fibre comparisons. These identifications remain requested; no generic-to-special transfer is inferred.

**neededBy.** ShimuraCompactifications:C5/formal-hilbert-siegel-koecher

### Normalized blow-up and finite normalization are distinct models

**detail.** The good-prime SAME-fan finite normalization and Lan 2017's possibly ramified normalized blow-up of a minimal model use different inputs. Supply the exact comparison on their common locus, including changed lattices and formal torus-torsor charts. M4 currently supplies only the good-prime interior normalization; the ramified lattice-collection interior/minimal models of Lan [18] and the complete Sections 4–5 stabilization/completion proofs remain leaves for the newly added projective-normalized-blowup target. No general subdivision map is inferred finite.

**neededBy.** ShimuraCompactifications:C5/projective-normalized-blowup

ShimuraCompactifications:C5/higher-level-toroidal-normalization

ShimuraCompactifications:C5/normalized-chart-finiteness

ShimuraCompactifications:C5/integral-coefficient-extension

ShimuraCompactifications:C5/normalized-koecher

### Analytic algebraization beyond the inspected proper-scheme Hom theorem

**detail.** ComplexComparisonPartII:C4/repair-proper-morphism-algebraicity supplies only Hom comparison for proper complex schemes. The compact positive-line existence theorem and Pink algebraic-space algebraization/effective-descent extension still need the precise C2/C4 contracts now requested. They are not established merely by the existing proper-scheme morphism node.

**neededBy.** ShimuraCompactifications:C2/projective-algebraization

ShimuraCompactifications:C2/minimal-boundary-map

ShimuraCompactifications:C2/canonical-toroidal-model

### Geometric supplier interfaces and suggested signatures

**neededBy.** ShimuraCompactifications:C6/meromorphic-cusp-support-bound

ShimuraCompactifications:C6/hilbert-cusp-positive-support

ShimuraCompactifications:C6/arithmetic-koecher

ShimuraCompactifications:C6/hilbert-boundary-constant

ShimuraCompactifications:C6/cusp-lattice-comparison

ShimuraCompactifications:C6/admissible-fan-specialization

ShimuraCompactifications:C6/uniformized-level-chart

ShimuraCompactifications:C6/hilbert-toroidal-model

ShimuraCompactifications:C6/toroidal-polarization-quotient

ShimuraCompactifications:C6/hilbert-boundary-formal-comparison

ShimuraCompactifications:C6/hilbert-boundary-etale-charts

ShimuraCompactifications:C6/hilbert-regular-refinement

ShimuraCompactifications:C6/hilbert-semiabelian-extension

ShimuraCompactifications:C6/hilbert-conormal-comparison

ShimuraCompactifications:C6/hilbert-toroidal-proper

ShimuraCompactifications:C6/hilbert-hodge-semiampleness

ShimuraCompactifications:C6/hilbert-minimal-contraction

ShimuraCompactifications:C6/hilbert-minimal-finite-generation

ShimuraCompactifications:C6/hilbert-minimal-normal-projective

ShimuraCompactifications:C6/minimal-polarization-quotient

ShimuraCompactifications:C6/hilbert-minimal-cusps

ShimuraCompactifications:C6/hilbert-minimal-boundary-fibres

ShimuraCompactifications:C6/hilbert-minimal-formal-comparison

ShimuraCompactifications:C6/hilbert-minimal-weight-extension

ShimuraCompactifications:C6/hilbert-q-expansion-comparison

ShimuraCompactifications:C6/hilbert-q-expansion-module-injective

ShimuraCompactifications:C6/hilbert-q-expansion-injective

ShimuraCompactifications:C6/hilbert-q-expansion-coefficient-descent

ShimuraCompactifications:C6/hilbert-boundary-ideal-pushforward

ShimuraCompactifications:C6/hilbert-ordinary-model-comparison

ShimuraCompactifications:C6/hilbert-hasse-boundary-comparison

ShimuraCompactifications:C6/hilbert-boundary-ordinary

ShimuraCompactifications:C6/hilbert-near-ordinary-model

ShimuraCompactifications:C6/hilbert-ordinary-polarization-quotient

ShimuraCompactifications:C6/hilbert-p-level-boundary-comparison

ShimuraCompactifications:C6/hilbert-integral-differential-interface

ShimuraCompactifications:C6/modular-toroidal-minimal-comparison

ShimuraCompactifications:C6/modular-formal-cusp-comparison

ShimuraCompactifications:C6/prime-diamond-pr81-comparison

**detail.** The target-level mathematical statements are specified, but the current baseline has no HBAV cusp, arithmetic completed toric fan, Hilbert moduli, relative semiabelian or Hasse-neighbourhood carrier. Exact interfaces are requested from their unique owners. Consequently these named geometric signatures are omitted from the suggested file, with a per-node omission ledger; there are no substitute propositions or axiomatized opaque geometry. Populate genuine signatures once the supplier objects exist. The independent review additionally makes the base-B boundary global-function comparison and the compatible-fan finite-level distinction explicit in the C0/C3/C5/SF.0 requests.

### Noninjective maps in the printed coefficient-descent statement

**neededBy.** ShimuraCompactifications:C6/hilbert-q-expansion-coefficient-descent

**detail.** Dimitrov Proposition 8.5(ii) prints any R-algebra R′ but writes an inclusion of coefficient modules. The cited companion, Dimitrov–Tilouine Proposition 7.3(2), explicitly uses an inclusion R⊂R′ and its proof uses quotient coefficient modules. The inclusion theorem, without a flatness hypothesis, is now planned. A separate image/existence formulation for noninjective maps remains unspecified and is not needed for this target; uniqueness under R→0 is false for nonzero R.

### Integral wild-level compactification comparison

**neededBy.** ShimuraCompactifications:C6/hilbert-p-level-boundary-comparison

ShimuraCompactifications:C6/hilbert-integral-differential-interface

**detail.** BHW §5.1.2 constructs the added p-level models over Q and completes tame level over O_L. It does not by itself identify an integral compactification at every wild full level and ramified residue prime. The H2/H4/C5 requests specify the exact additional local-model and normalization/base-change theorem needed. This remains a supplier gap, not a claim of smooth all-level models. Toroidal level-map extension also requires compatible cusp fans; finiteness requires a pullback fan or finite normalization, not an arbitrary refinement.

### Version-of-record collation

**neededBy.** ShimuraCompactifications:C6/negative-cusp-exponent

ShimuraCompactifications:C6/constant-term-vanishing

ShimuraCompactifications:C6/hilbert-q-expansion-module-injective

**detail.** Independent review confirms E-C6-1, E-C6-2 and E-C6-3 in the accessed preprint/author copies, with the narrowed zero-module interpretation of E-C6-2 and directed-union repair for E-C6-3. The main author copy has printed pagination differing from the published citation; publisher DOI access failed again. Version-of-record collation remains outstanding, and no result relies on an asserted publisher correction. Fresh public errata searches found no correction, which does not establish that none exists.

### Completed Hilbert charts and finite changed-lattice maps beyond ordinary C0 nodes

**neededBy.** ShimuraCompactifications:C6/hilbert-cusp-positive-support

ShimuraCompactifications:C6/admissible-fan-specialization

ShimuraCompactifications:C6/hilbert-boundary-formal-comparison

ShimuraCompactifications:C6/hilbert-boundary-etale-charts

ShimuraCompactifications:C6/hilbert-regular-refinement

ShimuraCompactifications:C6/hilbert-q-expansion-comparison

ShimuraCompactifications:C6/hilbert-boundary-ideal-pushforward

ShimuraCompactifications:C6/hilbert-p-level-boundary-comparison

**detail.** Assembly identifies ordinary ingredients by C0/relative-torus-embedding, relative-face-open, relative-regular-coordinates, relative-boundary-coordinates, arithmetic-admissible-fan, compatible-common-refinement and smooth-projective-refinement. These statements do not construct the completed arithmetic unit quotient, its module-valued support/localization description, or the finite normalization induced by a finite lattice map with its pullback fan. Apply the existing F0 completion/detection requests to the actual Hilbert cusp lattices and prove the residual C0 request. In regular local coordinates the boundary UNION ideal is (x_1 ... x_r), whereas the C0 intersection node has ideal (x_j : j in J). Derive the union formula from the monomial basis; do not identify these two ideals. Its quotient-basis/flat geometric-reducedness argument over the integral cusp base and the compatible changed-lattice finite map are explicit missing comparisons, not consequences of face-open or refinement properness alone.

### Hilbert integral effectivity and minimal geometry outside the good-prime C5 scope

**neededBy.** ShimuraCompactifications:C6/hilbert-cusp-positive-support

ShimuraCompactifications:C6/arithmetic-koecher

ShimuraCompactifications:C6/hilbert-toroidal-model

ShimuraCompactifications:C6/hilbert-toroidal-proper

ShimuraCompactifications:C6/hilbert-hodge-semiampleness

ShimuraCompactifications:C6/hilbert-minimal-contraction

ShimuraCompactifications:C6/hilbert-minimal-finite-generation

ShimuraCompactifications:C6/hilbert-minimal-normal-projective

ShimuraCompactifications:C6/minimal-polarization-quotient

ShimuraCompactifications:C6/hilbert-minimal-cusps

ShimuraCompactifications:C6/hilbert-minimal-boundary-fibres

ShimuraCompactifications:C6/hilbert-minimal-weight-extension

ShimuraCompactifications:C6/hilbert-boundary-ideal-pushforward

ShimuraCompactifications:C6/hilbert-p-level-boundary-comparison

ShimuraCompactifications:C6/modular-toroidal-minimal-comparison

**detail.** No C5 node supplies the full existing C6-to-C5 request over B=Z[1/N(n)] when the discriminant is not inverted. C5/integral-toroidal-space, formal-completion, valuative-properness and hodge-semiampleness require the good-prime PEL model (the first also a smooth compatible fan); C5/graded-section-finite-generation and integral-minimal-space build on that same model. They cannot be substituted for Hilbert toroidal/minimal existence, Hodge positivity, integral connected/reduced boundary fibres or their structure-sheaf comparison at discriminant primes. C5/projective-normalized-blowup supplies a different projective normalized model conditional on an M4 ramified interior/minimal/lattice-collection interface, not an identification with the H2 Deligne–Pappas model or a proof of its global B-model. Retain the exact C5 stage request, with H1/H2 moduli and local-model inputs. Establish its Hilbert specialization by the Dimitrov construction and the stated formal effectivity/descent, then export the precise determinant-section-ring, Veronese, cusp-fibre and coherent-base-change statements. Degree-one generic comparisons may use the characteristic-zero restriction, but this does not fill the integral all-prime request. No new compactification carrier or broader good-prime theorem is asserted.

### Hilbert instantiation of generic C3 and C4 boundary morphisms

**neededBy.** ShimuraCompactifications:C6/hilbert-regular-refinement

ShimuraCompactifications:C6/hilbert-p-level-boundary-comparison

ShimuraCompactifications:C6/modular-formal-cusp-comparison

**detail.** C3/refinement-map and level-datum-functoriality specify the generic characteristic-zero map contract and its separate C5 integral instantiation. C4/boundary-level-comparison supplies degeneration-level and Tate comparisons with M4 normalization inputs. After C6 identifies its actual Hilbert models, transport these map contracts to H1/H2/H4 cusp data: choose compatible fans for each lattice map, prove identity/composition on the completed models, and distinguish a finite pullback-fan normalization from a further proper nonfinite refinement. The discriminant-prime integral model identification and wild-level extension remain the existing H2/H4/C5 request. The referenced generic node does not establish that identification by itself.

## Source issues and incorporated corrections

The accessible-copy independent verdicts below are inherited from the reviews. No publisher/version-of-record correction is asserted beyond their inspected scope.

### ShimuraCompactifications/E1

**id.** ShimuraCompactifications/E1

**kind.** misprint

**locator.** Pink author-hosted dissertation, Definition 2.1(v), printed p. 30, PDF p. 31 (one-based); binary SHA-256 as PINK-1990. Publisher text not compared.

**printed.** Lie V for n = -1; Lie W for n >= 0

**correction.** Use Lie W for n=-1 and Lie P for n>=0. The weight-minus-one graded quotient is Lie V=Lie W/Lie U.

**reason.** The displayed filtration is on Lie P. For a pure datum W=1 and nonzero Lie P, its printed top step would be zero, contradicting exhaustivity. The printed middle line also places a quotient Lie V where a Lie P subspace is required. The surrounding weight convention gives the stated correction; the rendered author-copy p. 30 was inspected.

**affects.** nothing

**known.** New finding for the inspected author-hosted binary; no formal published correction located, and no error in an uninspected publisher edition is asserted.

**searched.** Pink dissertation download and author dissertation bibliography at https://people.math.ethz.ch/~pink/dissertation.html, read 2026-10-06; no errata link found.

Search for Pink Definition 2.1 mixed Shimura Lie filtration errata; primary definitions use Lie W and Lie P. No author erratum found.

**source.** PINK-1990

**review.** **verdict.** confirmed

**reason.** Inspected the rendered display in the hashed author PDF at printed p. 30/PDF p. 31. Its top step violates exhaustivity for a pure datum; Lie V is a quotient, not the required middle Lie subspace. The surrounding convention gives Lie W and Lie P. Publisher edition uninspected.

**by.** REV-ShimuraCompactifications--C0

### ShimuraCompactifications/E2

**id.** ShimuraCompactifications/E2

**kind.** error

**source.** LAN-2021

**locator.** Author-hosted revision dated 14 March 2021, Lemma 6.1.2.6, printed p. 444/PDF p. 472 (one-based); SHA-256 recorded as LAN-2021. Publisher edition uninspected.

**printed.** The reduced closed complement is identified with Spec of the unreduced orthogonal-character algebra over arbitrary Z.

**correction.** Use the scheme-theoretic off-face monomial quotient as the stratum. If a reduced stratum is wanted, reduce that quotient too; identifying it with the unreduced character algebra requires reducedness of the relevant base/chart.

**reason.** Remark 6.1.2.2 explicitly permits arbitrary Z. For Z=Spec(Z/4Z), a trivial G_m-torsor and its positive ray, the displayed orthogonal quotient is Spec(Z/4Z) whereas the reduced closed complement of G_m in A1_Z is Spec(F2). The nonzero nilpotent 2 survives the monomial quotient and is killed by reduction. The packet's C0 quotient and nilpotent tests already use the scheme-theoretic version.

**affects.** nothing

**known.** New finding for the inspected hashed author revision; no corresponding correction was located in the author errata searched. No claim about an uninspected publisher edition.

**searched.** The 14 March 2021 book errata at https://www.kwlan.org/articles/cpt-PEL-type-book-pup-err.pdf was inspected, including its toroidal and stratum corrections; this arbitrary-base reduced-stratum discrepancy was not located.

The author bibliography https://www.kwlan.org/academic.html and its linked thesis errata https://www.kwlan.org/articles/cpt-PEL-type-thesis-errata.pdf were searched for the toroidal/reduced-stratum correction on 2026-10-06.

**review.** **verdict.** confirmed

**reason.** Read the displayed reduction and Spec formula at the exact hashed-source locator and Remark 6.1.2.2. The trivial rank-one Z/4Z example disproves their equality over arbitrary bases; the unreduced scheme-theoretic quotient is the correct packet convention.

**by.** REV-ShimuraCompactifications--C0

**finding.** PAPER-PILLONI-20/E40

**application.** C3/refinement-boundary-ideal uses the natural boundary ideal map and derived pushforward comparison; a toric blowup has f^*D=D_strict+2E while D_new=D_strict+E, so f^*O(-D) is not O(-D_new). Scope is the inspected author copy, not an uninspected Duke version.

**finding.** PAPER-PILLONI-20/E109

**application.** C3 Klingen span keeps t1(G,H_n,L)=(G,H_n), the level p^(n+1) target and ([p]^-1(H_n)+L)/L subgroup; the source C_n/H leftovers are not definitions.

**finding.** PAPER-BOXER-PILLONI-26/E67

**application.** C4 records quasi-finite flat extended kernels and the Tate rank-loss example; the finite-flat Fargues divisor machinery is not automatically applied to every boundary kernel.

**finding.** PAPER-BIJAKOWSKI-PILLONI-STROH-16/E14

**application.** Use normalization compactification/coefficient/Koecher statements of 5.1–5.2; do not infer the distinct moduli-model identification from the bibliographic Example 13.12 slip.

**finding.** PAPER-CALEGARI-GERAGHTY-20/E165

**application.** The appendix writes the extended family over Y alongside Omega^1_A/X; the semi-abelian extension is over X, as in the main text. Use its identity-section invariant differentials and keep the actual base of every bundle.

### ShimuraCompactifications/E-C6-1

**id.** ShimuraCompactifications/E-C6-1

**source.** DIMITROV-2004-v3

**kind.** misprint

**locator.** Theorem 8.3 proof, arXiv v3 p. 24; same text in author copy printed p. 547

**printed.** ξ₀ non-totalement positif

**correction.** Choose ξ₀ outside X_+∪{0}: explicitly require ξ₀≠0 before obtaining a strictly negative real embedding or trace pairing.

**reason.** At ξ₀=0 all pairings are zero, so the displayed negative-trace conclusion is false. The preceding definition allows the zero exponent and the theorem retains constant terms. This corrects the proof wording, not the theorem.

**affects.** the proof

**known.** new

**searched.** https://arxiv.org/abs/math/0212071 (v3 is the final listed revision)

https://gitlabpages.univ-lille.fr/dimitrov/ (publication list and linked typeset author copy inspected)

https://www.degruyterbrill.com/document/doi/10.1515/9783110198133.1.527/html (HTTP 405 on full-page access)

Public title + errata/corrigendum search on 2026-09-26; no correction located.

Independent review, 2026-10-06: public title/author + errata/corrigendum queries, final arXiv revision metadata and author publication listing checked; no correction located. Publisher DOI access failed; this is not a version-of-record verification.

**review.** **verdict.** confirmed

**reason.** Confirmed in arXiv v3 p. 24 and author copy p. 547: zero is not strictly totally positive but has no negative embedding or pairing. The contradiction requires a nonzero exponent outside the positive cone. Dimitrov–Tilouine Theorem 7.1 p. 585 repeats the wording. This changes the proof wording, not Koecher’s theorem.

**by.** REV-ShimuraCompactifications--C6

### ShimuraCompactifications/E-C6-2

**id.** ShimuraCompactifications/E-C6-2

**source.** DIMITROV-2004-v3

**kind.** misprint

**locator.** Sentence after Proposition 8.5(iii), arXiv v3 p. 24; author copy printed p. 548

**printed.** l’anneau nul R = 0

**correction.** Read the zero object as the zero coefficient submodule in the additive-module descent argument: a section whose expansion is zero is zero. As a specialization of unital coefficient-ring inclusions, R=0 forces R′=0 and is vacuous; replacing R by C is not the intended inference.

**reason.** Dimitrov–Tilouine §7, Proposition 7.3 proof, derives both assertions from injectivity with arbitrary abelian coefficient groups. This explains the intended zero-module case. The previous checkpoint’s proposed R=C correction is withdrawn; the only precision issue is calling that zero module a coefficient ring.

**affects.** nothing

**known.** Dimitrov–Tilouine author copy §7, Proposition 7.3 proof explains the intended additive-module argument; no publisher erratum verified.

**searched.** https://arxiv.org/abs/math/0212071 (v3 is the final listed revision)

https://gitlabpages.univ-lille.fr/dimitrov/ (publication list and linked typeset author copy inspected)

https://www.degruyterbrill.com/document/doi/10.1515/9783110198133.1.527/html (HTTP 405 on full-page access)

Public title + errata/corrigendum search on 2026-09-26; no correction located.

Dimitrov–Tilouine author-hosted companion, printed pp. 585–586, read 2026-10-06.

Independent review, 2026-10-06: public title/author + errata/corrigendum queries, final arXiv revision metadata and author publication listing checked; no correction located. Publisher DOI access failed; this is not a version-of-record verification.

**review.** **verdict.** confirmed

**reason.** Confirmed only as a terminology imprecision. Both the main author copy p. 548 and companion p. 585 print the zero-ring sentence; the companion proof p. 586 works with arbitrary abelian coefficient groups. An inclusion of unital rings from the zero ring forces the target zero, whereas the zero coefficient submodule gives the intended injectivity case. No theorem failure or replacement by C is asserted.

**by.** REV-ShimuraCompactifications--C6

### ShimuraCompactifications/E-C6-3

**id.** ShimuraCompactifications/E-C6-3

**source.** DIMITROV-TILOUINE-AUTHOR

**kind.** error

**locator.** Proposition 7.3 proof, author copy printed p. 586

**printed.** Par commutation des deux membres aux limites inductives

**correction.** Use directed unions of finitely generated coefficient submodules and coefficientwise injectivity from the invertible coefficient line. Only H0 on the qcqs model needs the colimit theorem; do not claim colimit commutation for the entire formal-series target.

**reason.** Let N_j=Z^j with the coordinate inclusions, N=the direct sum of countably many copies of Z. The series whose ith coefficient is the ith basis vector lies in N[[q]] but in no N_j[[q]]. Hence colim_j N_j[[q]]→N[[q]] is not surjective. The source’s conclusion is repaired by the directed-union argument: zero in N is detected already in each N_j because every coefficient map is injective.

**affects.** the proof

**known.** new

**searched.** https://arxiv.org/abs/math/0212072 (final listed revision v3, 7 November 2004; metadata inspected 2026-10-06, not a fresh full reading of v3)

https://gitlabpages.univ-lille.fr/dimitrov/ (publication listing and linked author copy, inspected 2026-10-06)

https://www.math.univ-paris13.fr/~tilouine/publications.html (publication listing inspected 2026-10-06)

https://www.degruyterbrill.com/document/doi/10.1515/9783110198133.2.555/html (publisher full-page access failed)

Public title + errata/corrigendum search, 2026-10-06; no correction located.

Independent review, 2026-10-06: public title/author + errata/corrigendum queries, final arXiv revision metadata and author publication listing checked; no correction located. Publisher DOI access failed; this is not a version-of-record verification.

**review.** **verdict.** confirmed

**reason.** Confirmed in the companion author copy p. 586. For N_j=Z^j and N=⊕_i Z, the series with coefficient e_i at the ith positive multiple of one allowed exponent lies in N[[q]] but in no N_j[[q]]. Thus the full-series target does not commute with this colimit. The directed-union argument in the node needs only H0 colimit commutation and injective coefficient maps from the flat line.

**by.** REV-ShimuraCompactifications--C6

## Supplier requests and restructuring

The [assembly handoff](../handoff/ASM-ShimuraCompactifications.md) collects all 56 requests and the four restructuring proposals without treating an unresolved stage contract as supplied. C0 and C6 remain separately reviewed packets; this reader and the suggested file reconcile their order and notation.
